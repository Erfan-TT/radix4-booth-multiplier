library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.pp_pkg.all;          -- NBIT

-- =============================================================================
-- MULTIPLIER_tb : self-checking testbench for BOOTHMUL.
--
-- Width follows pp_pkg.NBIT, so there is nothing to edit here when switching
-- between the 8-bit simulation build and the 32-bit synthesis build.
--
--   NBIT <= 8 : exhaustive, all 2**(2*NBIT) operand pairs
--   NBIT >  8 : corner cases + N_RANDOM pseudo-random pairs
--
-- Values are reported in hex: at NBIT=32 the product is 64 bits and would
-- overflow integer'image / to_integer.
-- =============================================================================
entity MULTIPLIER_tb is
end entity MULTIPLIER_tb;

architecture TEST of MULTIPLIER_tb is

  constant W        : integer := NBIT;
  constant TSTEP    : time    := 10 ns;
  constant N_RANDOM : integer := 20000;

  -- 2**W only ever evaluated for small W, so this never overflows integer
  function exh_count(w : integer) return integer is
  begin
    if w <= 8 then
      return 2**w;
    else
      return 0;
    end if;
  end function exh_count;

  constant EXH_N : integer := exh_count(W);

  signal A_i : std_logic_vector(W-1 downto 0)   := (others => '0');
  signal B_i : std_logic_vector(W-1 downto 0)   := (others => '0');
  signal P_i : std_logic_vector(2*W-1 downto 0);

  component BOOTHMUL is
    port (
      A : in  std_logic_vector(NBIT-1 downto 0);
      B : in  std_logic_vector(NBIT-1 downto 0);
      P : out std_logic_vector(2*NBIT-1 downto 0)
    );
  end component;

  function to_hex(v : std_logic_vector) return string is
    constant HEXC : string(1 to 16) := "0123456789ABCDEF";
    constant NCH  : integer := (v'length + 3) / 4;
    variable pad  : std_logic_vector(4*NCH-1 downto 0) := (others => '0');
    variable r    : string(1 to NCH);
    variable hi   : integer;
  begin
    pad(v'length-1 downto 0) := v;
    for i in 1 to NCH loop
      hi   := 4*NCH - 1 - 4*(i-1);
      r(i) := HEXC(to_integer(unsigned(pad(hi downto hi-3))) + 1);
    end loop;
    return r;
  end function to_hex;

begin

  uut: BOOTHMUL
    port map (
      A => A_i,
      B => B_i,
      P => P_i
    );

  test: process

    variable av, bv : std_logic_vector(W-1 downto 0);
    variable exp    : signed(2*W-1 downto 0);
    variable errors : natural  := 0;
    variable checks : natural  := 0;
    variable s1, s2 : positive := 1;
    variable rnd    : real;

    -- drive one pair and compare against the reference product
    procedure check is
    begin
      A_i <= av;
      B_i <= bv;
      wait for TSTEP;
      exp    := signed(av) * signed(bv);
      checks := checks + 1;
      if signed(P_i) /= exp then
        errors := errors + 1;
        assert false
          report "MISMATCH  A=0x" & to_hex(av) &
                 "  B=0x" & to_hex(bv) &
                 "  expected=0x" & to_hex(std_logic_vector(exp)) &
                 "  got=0x" & to_hex(P_i)
          severity error;
      end if;
    end procedure check;

    -- fill a vector with random bits (works at any width, no integer overflow)
    procedure rand_slv(v : out std_logic_vector(W-1 downto 0)) is
    begin
      for k in 0 to W-1 loop
        uniform(s1, s2, rnd);
        if rnd < 0.5 then
          v(k) := '0';
        else
          v(k) := '1';
        end if;
      end loop;
    end procedure rand_slv;

    -- the five values most likely to break a signed multiplier
    type corner_t is array (0 to 4) of std_logic_vector(W-1 downto 0);
    variable corners : corner_t;

  begin

    corners(0) := (others => '0');                    --  0
    corners(1) := std_logic_vector(to_signed(1, W));  -- +1
    corners(2) := (others => '1');                    -- -1
    corners(3) := (others => '1');                    -- max positive: 0111..1
    corners(3)(W-1) := '0';
    corners(4) := (others => '0');                    -- min negative: 1000..0
    corners(4)(W-1) := '1';

    report "BOOTHMUL testbench, NBIT = " & integer'image(W) severity note;

    -- corner cases, all pairs
    for i in corners'range loop
      for j in corners'range loop
        av := corners(i);
        bv := corners(j);
        check;
      end loop;
    end loop;

    if EXH_N > 0 then
      report "exhaustive sweep: " & integer'image(EXH_N*EXH_N) & " pairs"
        severity note;
      for a in 0 to EXH_N-1 loop
        for b in 0 to EXH_N-1 loop
          av := std_logic_vector(to_unsigned(a, W));
          bv := std_logic_vector(to_unsigned(b, W));
          check;
        end loop;
      end loop;
    else
      report "random sweep: " & integer'image(N_RANDOM) & " pairs"
        severity note;
      for n in 1 to N_RANDOM loop
        rand_slv(av);
        rand_slv(bv);
        check;
      end loop;
    end if;

    if errors = 0 then
      report "PASS - " & integer'image(checks) & " vectors, 0 mismatches"
        severity note;
    else
      report "FAIL - " & integer'image(errors) & " mismatches out of " &
             integer'image(checks) severity failure;
    end if;

    wait;

  end process test;

end architecture TEST;
