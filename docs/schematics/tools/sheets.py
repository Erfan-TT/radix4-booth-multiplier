"""Booth multiplier RTL schematics.

    python tools/iterate.py datapath          # render + lint into tools/_iter/
    python tools/build_schematics.py          # publish svg / drawio / pdf / png

Sheets are hand-placed and hand-routed with the kit (see kit.py).
"""
from schem import Sheet, Sym, Pin, FILL_REG
from kit import Kit, print_profile

N = 32


def tags(sh, sym, specs):
    """name tags (CLK, RST, LD) on short straight stubs: specs (name, side, frac)"""
    ft = sh.ftag
    for nm, side, fr in specs:
        sym.pins[nm] = Pin(nm, side, fr, None, "clk", True)
        px, py = sym.pin_xy(nm)
        tw, th = max(42, len(nm) * ft * 0.62 + 16), max(20, ft * 1.6)
        gap = max(26, ft * 1.2)
        if side == "S":
            x, y, op = px - tw / 2, py + gap, "N"
        elif side == "N":
            x, y, op = px - tw / 2, py - gap - th, "S"
        elif side == "W":
            x, y, op = px - gap - tw, py - th / 2, "E"
        else:
            x, y, op = px + gap, py - th / 2, "W"
        t = sh.block(f"{sym.key}_{nm}", x, y, tw, th, nm, kind="tagbox",
                     pins=[Pin("o", op, 0.5, None, "clk", False)])
        sh.net("", (t, "o"), [(sym, nm)], None, "clk", label_at="none", ways=[None])


def reg_ns(sh, key, x, y, w, h, sub):
    """register fed from the top, output at the bottom"""
    r = sh.block(key, x, y, w, h, "reg_N", sub, kind="reg", fill=FILL_REG,
                 pins=[Pin("X", "N", 0.5, None, "data", True),
                       Pin("Y", "S", 0.5, None, "data", True)])
    r.nsh = True
    return r


def reg_we(sh, key, x, y, w, h, sub):
    """register fed from the left, output on the right"""
    return sh.block(key, x, y, w, h, "reg_N", sub, kind="reg", fill=FILL_REG,
                    pins=[Pin("X", "W", 0.30, None, "data", True),
                          Pin("Y", "E", 0.30, None, "data", True)])


# ===========================================================================
# 01  datapath of boothmul_registered
# ===========================================================================

def sheet_datapath():
    W, H = 3500, 2430
    sh = Sheet("01", "boothmul_registered — datapath",
               "rtl/multiplier/boothmul.vhd : STRUCTURAL   (N = 32)", W, H)
    print_profile(sh, pin_pt=6.5)
    k = Kit(sh, PW=230)
    PX, PY, wire = k.PX, k.PY, k.wire

    # ---- rows: encoder -> mux_and_shift -> shift, one per Booth digit ---------
    ROWS = [("0", 640), ("1", 1000), ("N/2-1", 1540)]   # (index, encoder centre y)
    XE, WE = 760, 380                  # encoder column
    XM, WM, HM = 1480, 340, 200        # mux_and_shift column
    XS, WS = 1900, 180                 # shift column
    XT, WT = 2190, 340                 # reduction tree
    TB = 700                           # B triplet trunk x
    TA = 1350                          # A trunk x
    LN = {"0": 1270, "1": 1230, "N/2-1": 1190}   # sel(2) lanes to the corrector

    enc, mas, shf = {}, {}, {}
    for i, R in ROWS:
        trip = {"0": "B(1:0) & '0'", "1": "B(3:1)", "N/2-1": "B(N-1:N-3)"}[i]
        enc[i] = sh.block(f"enc{i}", XE, R - 80, WE, 160, "booth_encoder",
                          (f"row {i}:  {trip}",),
                          pins=[Pin("B_IN", "W", 0.5, 3, "data"),
                                Pin("SEL", "E", 0.5, 3, "ctrl")])
        m = sh.block(f"mas{i}", XM, R - 140, WM, HM, "mux_and_shift", (f"row {i}",),
                     pins=[Pin("A", "W", 0.30, N, "data"),
                           Pin("sel", "W", 0.70, 3, "ctrl"),
                           Pin("pp", "E", 0.50, 2 * N, "data")])
        mas[i] = m
        shf[i] = sh.block(f"shf{i}", XS, R - 80, WS, 80,
                          "<< 0" if i == "0" else "<< 2" if i == "1" else "<< N-2", (),
                          pins=[Pin("i", "W", 0.5, None, "data", False),
                                Pin("o", "E", 0.5, None, "data", False)])

    cor = sh.block("cor", XM, 1780, WM, 240, "corrector",
                   ("Booth +1 bits", "+ bias constant"),
                   pins=[Pin("neg(0)", "W", 0.22, None, "ctrl"),
                         Pin("neg(1)", "W", 0.50, None, "ctrl"),
                         Pin("neg(N/2-1)", "W", 0.78, None, "ctrl"),
                         Pin("pp(N/2)", "E", 0.50, 2 * N, "data")])

    # reduction tree: one W pin per row at that row's height
    YT0, YT1 = 460, 2080
    ys = [PY(shf[i], "o") for i, _ in ROWS] + [PY(cor, "pp(N/2)")]
    tree = sh.block("tree", XT, YT0, WT, YT1 - YT0, "reduction_tree",
                    ("wallace | dadda", "N/2+1 rows -> 2"),
                    pins=[Pin(f"PP{j}", "W", (y - YT0) / (YT1 - YT0), 2 * N, "data")
                          for j, y in enumerate(ys)] +
                         [Pin("C", "E", 0.42, 2 * N, "data"),
                          Pin("S", "E", 0.52, 2 * N, "data")])
    tree.hdr = False
    for j, nm in enumerate(["PP(0)", "PP(1)", "PP(N/2-1)", "PP(N/2)"]):
        tree.pins[f"PP{j}"].name = nm
        tree.pins[nm] = tree.pins.pop(f"PP{j}")

    yc, ys_ = PY(tree, "C"), PY(tree, "S")
    add = sh.block("add", 2640, (yc + ys_) / 2 - 150, 240, 300, "P4_adder",
                   ("sparse-tree CPA", "Cin = 0"),
                   pins=[Pin("A", "W", (yc - ((yc + ys_) / 2 - 150)) / 300, 2 * N, "data"),
                         Pin("B", "W", (ys_ - ((yc + ys_) / 2 - 150)) / 300, 2 * N, "data"),
                         Pin("S", "E", 0.5, 2 * N, "data")])
    preg = reg_we(sh, "preg", 2980, PY(add, "S") - 0.3 * 170, 240, 170, ("P register",))

    # ---- registers and edge flags -----------------------------------------------
    breg = reg_ns(sh, "breg", TB - 130, 140, 260, 180, ("B register",))
    pad = sh.block("pad", TB - 110, 390, 220, 80, "B & '0'", (),
                   pins=[Pin("i", "N", 0.5, None, "data", False),
                         Pin("o", "S", 0.5, None, "data", False)])
    YA = 520
    areg = reg_we(sh, "areg", 330, YA - 0.3 * 160, 260, 160, ("A register",))
    tags(sh, areg, [("CLK", "S", 0.22), ("RST", "S", 0.5), ("LD", "S", 0.78)])
    tags(sh, breg, [("CLK", "E", 0.25), ("RST", "E", 0.5), ("LD", "E", 0.75)])
    tags(sh, preg, [("CLK", "S", 0.22), ("RST", "S", 0.5), ("LD", "S", 0.78)])

    f_b = k.tport("f_b", "B", TB, w=200, kind="data")
    f_a = k.iport("f_a", "A", YA)
    f_p = k.oport("f_p", "P", PY(preg, "Y"))

    # ---- nets ----------------------------------------------------------------------
    wire("B", (f_b, "o"), [(breg, "X")], None, N)
    wire("", (breg, "Y"), [(pad, "i")], None, N, label=False)
    rows = [i for i, _ in ROWS]
    wire("B & '0'", (pad, "o"), [(enc[i], "B_IN") for i in rows],
         [[(TB, PY(enc["0"], "B_IN"))]] +
         [[(TB, PY(enc["0"], "B_IN")), (TB, PY(enc[i], "B_IN"))] for i in rows[1:]],
         N + 1, label=False)
    wire("A", (f_a, "o"), [(areg, "X")], None, N)
    wire("A_i", (areg, "Y"), [(mas[i], "A") for i in rows],
         [[(TA, YA), (TA, PY(mas["0"], "A"))]] +
         [[(TA, PY(mas["0"], "A")), (TA, PY(mas[i], "A"))] for i in rows[1:]], N)
    corpin = {"0": "neg(0)", "1": "neg(1)", "N/2-1": "neg(N/2-1)"}
    for i in rows:
        x = LN[i]
        wire(f"sel({i})", (enc[i], "SEL"), [(mas[i], "sel"), (cor, corpin[i])],
             [[], [(x, PY(enc[i], "SEL")), (x, PY(cor, corpin[i]))]], 3, "ctrl",
             dlabels=["", f"sel({i})(2)"])
        wire("", (mas[i], "pp"), [(shf[i], "i")], None, 2 * N, label=False)
    tpin = {"0": "PP(0)", "1": "PP(1)", "N/2-1": "PP(N/2-1)"}
    for i in rows:
        wire(f"pp({i})", (shf[i], "o"), [(tree, tpin[i])], None, 2 * N, label=False)
    wire("pp(N/2)", (cor, "pp(N/2)"), [(tree, "PP(N/2)")], None, 2 * N)
    wire("C", (tree, "C"), [(add, "A")], None, 2 * N)
    wire("S", (tree, "S"), [(add, "B")], None, 2 * N)
    wire("P_i", (add, "S"), [(preg, "X")], None, 2 * N, label=False)
    wire("P", (preg, "Y"), [(f_p, "i")], None, 2 * N)

    # ---- the rows not drawn ------------------------------------------------------
    ym = (ROWS[1][1] + ROWS[2][1]) / 2 - 20
    for x in (XE + WE / 2, XM + WM / 2, XS + WS / 2):
        sh.text("⋮", x, ym, sh.fsig * 2.2, "middle")
    sh.text("one row per Booth digit: i = 0 … N/2-1  (16 rows at N = 32)",
            80, 2130, sh.fnote, "start", "#475467")
    sh.text("row i is shifted left by 2i before the tree;  the corrector adds the",
            80, 2130 + sh.fnote * 1.5, sh.fnote, "start", "#475467")
    sh.text("Booth +1 of every negative row and the sign-extension bias constant",
            80, 2130 + sh.fnote * 3.0, sh.fnote, "start", "#475467")
    sh.legend(80, 1780, [("line", "#101418", 1.6 * sh.ui, "", "data (bus width on the slash)"),
                         ("line", "#B54708", 1.6 * sh.ui, "", "Booth select sel(2:0)"),
                         ("line", "#667085", 1.6 * sh.ui, "", "CLK, RST, LD by name tag")],
              "KEY", sh.legend_scale)
    return sh


# ===========================================================================
# 02  mux_and_shift: no_sign_extend (steps 2-3) against fused_selector (step 4)
# ===========================================================================

def xor_gate(sh, key, x, y, w=120, h=110):
    """2-input XOR: an OR body plus its second back curve; inputs land on the curve"""
    aw, g = 0.14 * w, 0.17 * w            # back curve width, gap to the body
    sh.add(Sym(f"{key}_arc", x, y, aw, h, "xarc", fill="none"))
    pins = []
    for nm, f in (("a", 0.26), ("b", 0.74)):
        t = f
        for _ in range(40):               # the curve's parameter t at height f
            yt = 3 * (1 - t) ** 2 * t * 0.28 + 3 * (1 - t) * t * t * 0.72 + t ** 3
            t -= (yt - f) * 0.8
        xc = 3 * (1 - t) * t * 0.6 * aw   # both control points at 60 % of aw
        pins.append(Pin(nm, "W", f, None, "data", False, -(g - xc)))
    pins.append(Pin("y", "E", 0.5, None, "data", False))
    return sh.block(key, x + g, y, w - g, h, "", (), kind="or", pins=pins)


def flag(sh, k, key, name, x, cy, out, kind="data", w=None):
    """a flag anywhere on the sheet: an input points right into the circuit,
    an output points right, away from it"""
    w = w or k.flag_w(name)
    pin = Pin("i", "W", 0.5, None, kind, False) if out else Pin("o", "E", 0.5, None, kind,
                                                                 False)
    return k._scale(sh.block(key, x, cy - k.PH / 2, w, k.PH, name,
                             kind="pon" if out else "pin", pins=[pin]))


def sheet_mux_and_shift():
    W, H = 3400, 2360
    sh = Sheet("02", "mux_and_shift — one bit of a partial-product row",
               "rtl/multiplier/mux_and_shift.vhd : no_sign_extend | fused_selector",
               W, H)
    print_profile(sh, pin_pt=6.5)
    k = Kit(sh)
    PX, PY, wire = k.PX, k.PY, k.wire
    grey = "#475467"
    XD = 1500                                        # divider between the panels
    sh.line(XD, 60, XD, H - 220, "#7A8699", 1.4 * sh.ui, "8,8")

    def heading(x, title, sub):
        sh.text(title, x, 110, sh.fsig * 1.45, "start", bold=True)
        sh.text(sub, x, 110 + sh.fsig * 1.9, sh.fsig, "start", grey)

    # ======================= left: select, zero, negate ============================
    heading(80, "no_sign_extend  (steps 2 and 3)",
            "select A or 2A, force zero, then negate with an XOR")
    mux = k.mux("mux", 560, 700, "0", "1", h=260)
    gand = k.gate("gand", "and", 860, PY(mux, "y") - 0.26 * 170, 150, 170)
    gxor = xor_gate(sh, "gxor", 1140, PY(gand, "y") - 0.26 * 170, 190, 170)
    f_ai = flag(sh, k, "l_ai", "A(i)", 80, PY(mux, "0"), False)
    f_aj = flag(sh, k, "l_aj", "A(i-1)", 80, PY(mux, "1"), False)
    LS = {"1": PX(mux, "s"), "0": 790, "2": 1070}               # select lanes
    T, YT = k.stair([("l_s1", "sel(1)", LS["1"], "ctrl", "in"),
                     ("l_s0", "sel(0)", LS["0"], "ctrl", "in"),
                     ("l_s2", "sel(2)", LS["2"], "ctrl", "in")], 80, 300)
    f_pp = flag(sh, k, "l_pp", "pp(i)", 1390 - 30, PY(gxor, "y"), True, w=130)

    wire("A(i)", (f_ai, "o"), [(mux, "0")], None, None, label=False)
    wire("A(i-1)", (f_aj, "o"), [(mux, "1")], None, None, label=False)
    wire("sel(1)", (T["l_s1"], "o"), [(mux, "s")], [[(LS["1"], YT["l_s1"])]], None,
         "ctrl", label=False)
    wire("", (mux, "y"), [(gand, "a")], None, None, label=False)
    wire("sel(0)", (T["l_s0"], "o"), [(gand, "b")],
         [[(LS["0"], YT["l_s0"]), (LS["0"], PY(gand, "b"))]], None, "ctrl", label=False)
    wire("", (gand, "y"), [(gxor, "a")], None, None, label=False)
    wire("sel(2)", (T["l_s2"], "o"), [(gxor, "b")],
         [[(LS["2"], YT["l_s2"]), (LS["2"], PY(gxor, "b"))]], None, "ctrl", label=False)
    wire("", (gxor, "y"), [(f_pp, "i")], None, None, label=False)

    yl = 1240
    for j, t in enumerate([
            "per bit: 1 mux + 1 AND + 1 XOR, for each of the N+1 bits of the row",
            "sel(2) drives N+1 XOR gates: a separate negation layer",
            "bit N (the sign) is inverted after the XOR; bits above N are 0",
            "mux input 0 = A(i) (1 x A),  input 1 = A(i-1) (2 x A, shifted)"]):
        sh.text(t, 80, yl + j * sh.fnote * 1.6, sh.fnote, "start", grey)

    # Booth digit -> select, shared by both architectures
    yt = 1560
    sh.text("booth_encoder output", 80, yt, sh.fnote * 1.15, "start", bold=True)
    rows = [("digit", "sel(2)", "sel(1)", "sel(0)"), ("0", "0", "0", "0"),
            ("+1", "0", "0", "1"), ("+2", "0", "1", "1"), ("-1", "1", "0", "1"),
            ("-2", "1", "1", "1")]
    cw, rh = 200, sh.fnote * 1.7
    for r, row in enumerate(rows):
        for c, v in enumerate(row):
            sh.text(v, 80 + c * cw, yt + 50 + r * rh, sh.fnote, "start",
                    "#101418" if r else grey, mono=bool(r), bold=(r == 0))
    for j, t in enumerate(["sel(0) = 1: the digit is not 0", "sel(1) = 1: |digit| = 2",
                           "sel(2) = 1: the digit is negative"]):
        sh.text(t, 80, yt + 60 + (len(rows) + j) * rh, sh.fnote, "start", grey)

    # ======================= right: one sum of products ============================
    X0 = XD + 80
    heading(X0, "fused_selector  (step 4)",
            "decode the four non-zero digits once, then one AND-OR per bit")
    dec = [("pos1", ("b", "c")), ("neg1", ("b",)), ("pos2", ("c",)), ("neg2", ())]
    XG, GW, GH, GP = X0 + 520, 150, 180, 250                 # decoder gates
    gd = {nm: k.gate(f"d_{nm}", "and", XG, 420 + j * GP, GW, GH, inv=inv, n=3)
          for j, (nm, inv) in enumerate(dec)}
    L = {"0": XG - 220, "1": XG - 160, "2": XG - 100}       # select lanes
    T2, YT2 = k.stair([("r_s0", "sel(0)", L["0"], "ctrl", "in"),
                       ("r_s1", "sel(1)", L["1"], "ctrl", "in"),
                       ("r_s2", "sel(2)", L["2"], "ctrl", "in")], X0, 270)
    for b, pin in (("0", "a"), ("1", "b"), ("2", "c")):
        top = PY(gd["pos1"], pin)
        wire(f"sel({b})", (T2[f"r_s{b}"], "o"), [(gd[nm], pin) for nm, _ in dec],
             [[(L[b], YT2[f"r_s{b}"]), (L[b], top)]] +
             [[(L[b], top), (L[b], PY(gd[nm], pin))] for nm, _ in dec[1:]],
             None, "ctrl", label=False)

    XA, AW, AH = XG + GW + 330, 140, 150                    # slice AND gates
    LA = {"src1": XG + GW + 170, "src2": XG + GW + 240}      # data lanes
    ga = {}
    for nm, _ in dec:
        ga[nm] = k.gate(f"a_{nm}", "and", XA, PY(gd[nm], "y") - 0.26 * AH, AW, AH,
                        inv=("b",) if nm.startswith("neg") else ())
        wire(nm, (gd[nm], "y"), [(ga[nm], "a")], None, None, "ctrl", label=True)
    YS = 1500
    f_s1d = flag(sh, k, "r_a1", "A(i)", X0, YS, False)
    f_s2d = flag(sh, k, "r_a2", "A(i-1)", X0, YS + 80, False)
    wire("src1", (f_s1d, "o"), [(ga["pos1"], "b"), (ga["neg1"], "b")],
         [[(LA["src1"], YS), (LA["src1"], PY(ga["pos1"], "b"))],
          [(LA["src1"], PY(ga["neg1"], "b"))]], None, label=False)
    wire("src2", (f_s2d, "o"), [(ga["pos2"], "b"), (ga["neg2"], "b")],
         [[(LA["src2"], YS + 80), (LA["src2"], PY(ga["pos2"], "b"))],
          [(LA["src2"], PY(ga["neg2"], "b"))]], None, label=False)

    ymid = (PY(ga["neg1"], "y") + PY(ga["pos2"], "y")) / 2
    gor = k.gate("gor", "or", XA + AW + 260, ymid - 190, 180, 380, n=4)
    # top outputs turn farthest right, bottom ones too: no two of them cross
    JX = {"pos1": XA + AW + 210, "neg1": XA + AW + 90, "pos2": XA + AW + 130,
          "neg2": XA + AW + 170}
    for nm, pin in zip(["pos1", "neg1", "pos2", "neg2"], "abcd"):
        wire("", (ga[nm], "y"), [(gor, pin)],
             [[(JX[nm], PY(ga[nm], "y")), (JX[nm], PY(gor, pin))]], None, label=False)
    f_q = flag(sh, k, "r_pp", "pp(i)", PX(gor, "y") + 90, PY(gor, "y"), True, w=150)
    wire("", (gor, "y"), [(f_q, "i")], None, None, label=False)

    yr = 1720
    for j, t in enumerate([
            "decoder (left): once per row, shared by the N+1 bits of the row",
            "slice (right): per bit 4 AND2 + 1 OR4, which maps onto AOI/OAI cells",
            "no XOR: the negation is the inverted data input of neg1 / neg2",
            "src1(i) = A(i),  src2(i) = A(i-1);  bit N inverted as on the left",
            "pos1 = sel(0) . /sel(1) . /sel(2)  (+A)",
            "neg1 = sel(0) . /sel(1) . sel(2)  (-A)",
            "pos2 = sel(0) . sel(1) . /sel(2)  (+2A)",
            "neg2 = sel(0) . sel(1) . sel(2)  (-2A)"]):
        sh.text(t, X0, yr + j * sh.fnote * 1.6, sh.fnote, "start", grey)
    return sh
