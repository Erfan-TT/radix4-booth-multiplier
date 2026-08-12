library ieee;
use ieee.std_logic_1164.all;
use work.common_pkg.all;
-- corrector : builds the last row of the partial-product array.
-- This single row carries two completely different things, which happen to fit
-- in disjoint halves of the same word:
--   bits N-1 .. 0 : the one to be added to the two's complements of the partial products, if they are negative or not.
--   which are determined by the sel(2) bits inside the neg_bits vector input.
--   bits 2N-1 .. N  the constant that cancels the error introduced by
--                   sign-extension elimination in mux_and_shift
--                   the pattern is : (0xAAAA...AB, see pp_pkg.sign_ext_const).
entity corrector is
  generic (N : integer := 32);
  port (
    neg_bits     : in  std_logic_vector(N/2-1 downto 0);
    correction_v : out std_logic_vector(2*N-1 downto 0)
  );
end entity corrector;

architecture no_sign_extend of corrector is

  constant SE_CONST : std_logic_vector(2*N-1 downto 0) := sign_ext_const(N);

begin

  -- low half: Booth "+1" bits, neg_bits(i) at weight 2**(2i)
  gen_neg: for i in 0 to N/2-1 generate
    correction_v(2*i)   <= neg_bits(i);
    correction_v(2*i+1) <= '0';
  end generate gen_neg;

  -- high half: constant bias cancellation (no logic, pure wiring to 0/1)
  correction_v(2*N-1 downto N) <= SE_CONST(2*N-1 downto N);

end architecture no_sign_extend;

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

-- basic one, without the optimization on the sign bits, only the two's complement addition bits comming from sel(2)
architecture sign_extend of corrector is

begin

  -- low half: Booth "+1" bits, neg_bits(i) at weight 2**(2i)
  gen_neg: for i in 0 to N/2-1 generate
    correction_v(2*i)   <= neg_bits(i);
    correction_v(2*i+1) <= '0';
  end generate gen_neg;
  -- high half: all zero
  correction_v(2*N-1 downto N) <= ( others => '0');

end architecture sign_extend;