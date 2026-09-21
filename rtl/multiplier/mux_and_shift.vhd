library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- mux_and_shift : builds one radix-4 Booth partial-product row.
-- sel(0) = enable    sel(1) = double (2A)    sel(2) = negate
-- The row is built in N+1 bits, enough for +/-2A when A is NBIT

-- no_sign_extend vs sign_extend : first one optimize #FAs needed
-- by putting zero at the sign extend bits, and flip the sign bit
-- which results into a constant error, which will be fixed later by
-- the corrector component output vector.
-- second one is the normal without optimization sign extention pp vector.

entity mux_and_shift is
  generic (N : integer := 32);
  port (
    A   : in  std_logic_vector(N-1 downto 0);
    sel : in  std_logic_vector(2 downto 0);
    pp  : out std_logic_vector(2*N-1 downto 0)
  );
end entity mux_and_shift;

architecture no_sign_extend of mux_and_shift is
begin

  process (A, sel)
    variable q : std_logic_vector(N downto 0);   -- N+1 bits, holds +/-A or +/-2A
  begin

    -- start from A sign-extended to N+1 bits
    q := std_logic_vector(resize(signed(A), N+1));

    if sel(0) = '0' then
      q := (others => '0');                                   -- row disabled
    elsif sel(1) = '1' then
      q := std_logic_vector(shift_left(unsigned(q), 1));      -- unsigned  2A 
    end if;

    -- negate bits 0 to N: if sel(2) is one
    q := q xor (q'range => sel(2));

    -- flip the sign bit
    q(N) := not q(N);

    -- zero-extend, zero-fill above
    pp <= std_logic_vector(resize(unsigned(q), 2*N));

  end process;

end architecture no_sign_extend;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------


architecture sign_extend of mux_and_shift is
begin

  process (A, sel)
    variable q : std_logic_vector(2*N-1 downto 0);   -- full row width
  begin

    -- start from A sign-extended to 2N bits
    q := std_logic_vector(resize(signed(A), 2*N));

    if sel(0) = '0' then
      q := (others => '0');                                   -- row disabled
    elsif sel(1) = '1' then
      q := std_logic_vector(shift_left(unsigned(q), 1));      -- unsigned 2A
    end if;

    -- negate: one's complement. The matching +1 is supplied as neg_bits(i) by the corrector
    q := q xor (q'range => sel(2));
    pp <= q;

  end process;

end architecture sign_extend;



---------------------------------------------------
---------------------------------------------------

architecture behavioural of mux_and_shift is
begin

  process (A, sel)
    variable q : unsigned(2*N-1 downto 0);   -- full row width
  begin

    -- start from A sign-extended to 2N bits
    q := unsigned(resize(signed(A), 2*N));

    if sel(0) = '0' then
      q := (others => '0');                                   -- row disabled
    elsif sel(1) = '1' then
      q := shift_left(unsigned(q), 1);                        -- unsigned 2A
    end if;

    -- If negative operation (-A or -2A), take two's complement
    if sel(2) = '1' then
      q := not q;
      q := q + 1;
    end if;
    pp <= std_logic_vector(q);

  end process;

end architecture behavioural;

---------------------------------------------------
---------------------------------------------------

-- fused_selector : same function as no_sign_extend, but written so that the
-- negation disappears into the selection gate instead of costing its own XOR
-- level.
--
-- no_sign_extend builds the row in two steps: first a mux picks A / 2A / 0,
-- then every bit is XORed with sel(2). That second step is N+1 XOR2 cells per
-- row, 16 rows, ~528 XOR cells at NBIT=32 -- roughly 843 um2 doing nothing but
-- inverting.
--
-- Here the row control is decoded once into four mutually exclusive signals,
-- and each output bit is one flat sum of products over { src1, ~src1, src2,
-- ~src2 }. DC maps that to a single AOI/OAI compound cell per bit. The ~src
-- terms are the same function of A in every row, so common subexpression
-- elimination shares one set of inverters across all 16 rows.
--
-- The zero row cannot also be a negated row (the encoder only emits sel(2)='1'
-- together with sel(0)='1'), which is what makes the four terms sufficient.

architecture fused_selector of mux_and_shift is

  -- the x1 operand: A sign-extended to N+1 bits
  signal src1 : std_logic_vector(N downto 0);

  -- the x2 operand: A shifted left by one, in N+1 bits
  signal src2 : std_logic_vector(N downto 0);

  -- row controls, decoded once per row
  signal pos1 : std_logic;   -- drive  src1   (+A)
  signal neg1 : std_logic;   -- drive ~src1   (-A)
  signal pos2 : std_logic;   -- drive  src2   (+2A)
  signal neg2 : std_logic;   -- drive ~src2   (-2A)

  -- the row before the sign bit gets flipped
  signal q : std_logic_vector(N downto 0);

begin

  src1 <= A(N-1) & A;
  src2 <= A & '0';

  pos1 <= sel(0) and (not sel(1)) and (not sel(2));
  neg1 <= sel(0) and (not sel(1)) and sel(2);
  pos2 <= sel(0) and sel(1) and (not sel(2));
  neg2 <= sel(0) and sel(1) and sel(2);

  -- one compound gate per bit, no XOR anywhere
  gen_bits: for i in 0 to N generate
    q(i) <= (pos1 and src1(i))
         or (neg1 and not src1(i))
         or (pos2 and src2(i))
         or (neg2 and not src2(i));
  end generate gen_bits;

  -- sign-extension elimination: store ~s at bit N, zeros above
  pp(N) <= not q(N);
  pp(N-1 downto 0) <= q(N-1 downto 0);
  pp(2*N-1 downto N+1) <= (others => '0');

end architecture fused_selector;
