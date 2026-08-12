library ieee;
use ieee.std_logic_1164.all;

-- =============================================================================
-- common_pkg : partial-product types and the sign-extension correction constant.
--
-- NBIT is the single source of truth for the operand width. Change it here and
-- the multiplier and the testbench both follow.
--
-- Port types have to live in a package so that both the entity and whoever
-- instantiates it can see them, and a VHDL-93 package cannot see a generic.
-- That is why the width comes from a constant here while the *number of rows*
-- stays generic (pp_array is unconstrained in its outer dimension).
-- =============================================================================
package common_pkg is

  -- Operand width. Must be even (radix-4 Booth works on bit pairs).
  -- Set to 8 to run the exhaustive testbench; 32 is the synthesis target.
  constant NBIT : integer := 8;
  constant NROWS : integer := NBIT/2+1;
  subtype pp_word  is std_logic_vector(2*NBIT-1 downto 0);
  type    pp_array is array (natural range <>) of pp_word;

  -- Shape of the partial-product array feeding the reduction tree. The Dadda
  -- schedule is computed from column heights, so it has to know which layout it
  -- is looking at; the uniform CSA tree ignores this.
  --
  --   BOOTH_SE     radix-4 Booth, sign extension eliminated
  --                NBIT/2 rows of NBIT+1 bits at offset 2i, plus the corrector
  --   BOOTH_PLAIN  radix-4 Booth, rows sign-extended to the full 2*NBIT width
  --                corrector carries only the negate bits
  --   BAUGH_WOOLEY NBIT rows of NBIT bits at offset j, two hardwired constants
  type pp_layout_t is (BOOTH_SE, BOOTH_PLAIN, BAUGH_WOOLEY);


  -- Sign-extension bias cancellation constant.
  --
  -- Eliminating the sign extension of row i (storing ~s_i instead of s_i and
  -- zero-filling above it) makes that row overshoot by exactly 2**(2i+NB),
  -- independently of the operands. Summed over all NB/2 rows the design owes:
  --
  --     -sum(i = 0 .. NB/2-1) 2**(2i+NB)   mod 2**(2*NB)
  --
  -- which is the bit pattern 0xAAAA...AB sitting in bits 2*NB-1 downto NB
  -- (0xB for NB=4, 0xAB for NB=8, 0xAAAAAAAB for NB=32). Bits NB-1 downto 0
  -- are zero, which is what lets this share a row with the Booth "+1" bits.
  function sign_ext_const(NB : natural) return std_logic_vector;

end package common_pkg;


package body common_pkg is

  function sign_ext_const(NB : natural) return std_logic_vector is
    variable v : std_logic_vector(2*NB-1 downto 0) := (others => '0');
  begin
    -- bit NB is always '1'; above it every odd bit position is '1'
    v(NB) := '1';
    for j in NB+1 to 2*NB-1 loop
      if (j mod 2) = 1 then
        v(j) := '1';
      end if;
    end loop;
    return v;
  end function sign_ext_const;

end package body common_pkg;
