library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- =============================================================================
-- mux_and_shift : builds one radix-4 Booth partial-product row.
--
--   sel(0) = enable    sel(1) = double (2A)    sel(2) = negate
--
-- The row is built in N+1 bits, which is exactly enough for +/-2A when A is an
-- N-bit signed number.
--
-- Sign-extension elimination
-- --------------------------
-- The natural thing would be to sign-extend the N+1 bit row all the way up to
-- 2N bits. That costs up to N-1 replica bits per row and they are all copies of
-- one net, so they carry no information.
--
-- Instead the sign bit q(N) is INVERTED and everything above it is zero-filled.
-- Reason: the sign has weight -2**P, but the tree adds unsigned, so
--
--     -s*2**P = ~s*2**P - 2**P
--
-- The ~s part is the data; the -2**P part is a constant that does not depend on
-- s at all, and is cancelled once for all rows by the corrector component.
-- Legal because the whole datapath is mod 2**(2N).
-- =============================================================================
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
      q := std_logic_vector(shift_left(unsigned(q), 1));      -- 2A
    end if;

    -- negate: one's complement only. The matching +1 is supplied as neg_bits(i)
    -- by the corrector, so it costs one bit in the array instead of an adder.
    q := q xor (q'range => sel(2));

    -- sign-extension elimination: store ~s, zero-fill above
    q(N) := not q(N);

    -- zero-extend (NOT sign-extend) to the full 2N-bit row width
    pp <= std_logic_vector(resize(unsigned(q), 2*N));

  end process;

end architecture no_sign_extend;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------


architecture sign_extend of mux_and_shift is
begin

  process (A, sel)
    variable q : std_logic_vector(N downto 0);   -- N+1 bits, holds +/-A or +/-2A
  begin

    -- start from A sign-extended to 2N bits
    q := std_logic_vector(resize(signed(A), N*2));

    if sel(0) = '0' then
      q := (others => '0');                                   -- row disabled
    elsif sel(1) = '1' then
      q := std_logic_vector(shift_left(unsigned(q), 1));      -- 2A
    end if;

    -- negate: one's complement. The matching +1 is supplied as neg_bits(i)
    -- by the corrector, so it costs one bit in the array instead of an adder.
    q := q xor (q'range => sel(2));
    pp <= q;

  end process;

end architecture sign_extend;