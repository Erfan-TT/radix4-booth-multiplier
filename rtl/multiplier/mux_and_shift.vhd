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