library ieee;
use ieee.std_logic_1164.all;

use work.pp_pkg.all;

-- =============================================================================
-- corrector : builds the last row of the partial-product array.
--
-- This single row carries two completely different things, which happen to fit
-- in disjoint halves of the same word:
--
--   bits N-1 .. 0   the Booth negation carries. Row i was negated as ~x, so it
--                   still owes a +1 at weight 2**(2i). neg_bits(i) goes there.
--                   Odd positions are unused and tied to '0'.
--
--   bits 2N-1 .. N  the constant that cancels the bias introduced by
--                   sign-extension elimination in mux_and_shift
--                   (0xAAAA...AB, see pp_pkg.sign_ext_const).
--
-- Because the two halves never overlap they share one row for free: the Wallace
-- tree still sees N/2+1 rows, so no extra reduction layer is needed.
-- =============================================================================
entity corrector is
  generic (N : integer := 32);
  port (
    neg_bits     : in  std_logic_vector(N/2-1 downto 0);
    correction_v : out std_logic_vector(2*N-1 downto 0)
  );
end entity corrector;

architecture BEH of corrector is

  constant SE_CONST : std_logic_vector(2*N-1 downto 0) := sign_ext_const(N);

begin

  -- low half: Booth "+1" bits, neg_bits(i) at weight 2**(2i)
  gen_neg: for i in 0 to N/2-1 generate
    correction_v(2*i)   <= neg_bits(i);
    correction_v(2*i+1) <= '0';
  end generate gen_neg;

  -- high half: constant bias cancellation (no logic, pure wiring to 0/1)
  correction_v(2*N-1 downto N) <= SE_CONST(2*N-1 downto N);

end architecture BEH;
