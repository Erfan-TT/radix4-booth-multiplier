library ieee;
use ieee.std_logic_1164.all;

use work.common_pkg.all;
use work.dadda_types_pkg.all;
use work.wallace_math_pkg.all;
use work.dadda_math_pkg.all;

-- =============================================================================
-- REDUCTION_TREE : reduces NROWS partial-product rows down to two.
--
-- Two architectures share this entity and are interchangeable through a
-- configuration:
--
--   uniform  (here)              3:2 CSAs on whole rows, full 2*NBIT width
--   dadda    (dadda_tree.vhd)    per-column scheduling, far fewer half adders
--
-- The final carry-propagate adder is deliberately left outside, so swapping the
-- reduction strategy never touches BOOTHMUL.
-- =============================================================================
entity wallace_tree is
  port (
    PP : in  pp_array(0 to NROWS-1);   -- outer range fixed by the generic
    C  : out pp_word;                  -- carry vector
    S  : out pp_word                   -- sum vector
  );
end entity wallace_tree;


architecture wallace of wallace_tree is

  -- reduction layers, plus one to hold the final (carry, sum) pair
  constant num_layers_wallace : natural := wallace_num_layers(NROWS) + 1;

  -- one entry per layer, each holding a full set of rows
  type layer_array is array (natural range <>) of pp_array(0 to NROWS-1);

  -- Only rows 0 .. rows_after_layers(NROWS,i)-1 of layer(i) are ever driven or
  -- read. The initialiser exists purely to keep the unused rows from showing up
  -- as 'U' in the waveform; synthesis ignores it.
  signal layer : layer_array(0 to num_layers_wallace-1) :=
                   (others => (others => (others => '0')));

  component CSA is
    generic (N : integer := 32);
    port (
      A     : in  std_logic_vector(N-1 downto 0);
      B     : in  std_logic_vector(N-1 downto 0);
      F     : in  std_logic_vector(N-1 downto 0);
      Carry : out std_logic_vector(N-1 downto 0);
      S     : out std_logic_vector(N-1 downto 0)
    );
  end component;

begin

  layer(0) <= PP;

  tree: for i in 0 to num_layers_wallace-2 generate

    -- rows entering this layer
    constant ROWS_IN : natural := rows_after_layers(NROWS, i);

    -- full groups of three, one CSA each
    constant num_CSA : natural := ROWS_IN / 3;

    -- rows left over after grouping by three (0, 1 or 2)
    constant remaining : natural := ROWS_IN - num_CSA*3;

  begin

    -- 3 rows in -> 1 CSA -> 2 rows out (carry at 2j, sum at 2j+1)
    gen_csa: for j in 0 to num_CSA-1 generate
      csa_j: CSA
        generic map (N => 2*NBIT)
        port map (
          A     => layer(i)(3*j),
          B     => layer(i)(3*j+1),
          F     => layer(i)(3*j+2),
          Carry => layer(i+1)(2*j),
          S     => layer(i+1)(2*j+1)
        );
    end generate gen_csa;

    -- leftover rows continue untouched, appended after the 2*N_CSA new rows
    gen_pass: for k in 0 to remaining-1 generate
      layer(i+1)(2*num_CSA + k) <= layer(i)(3*num_CSA + k);
    end generate gen_pass;

  end generate tree;

  C <= layer(num_layers_wallace-1)(0);
  S <= layer(num_layers_wallace-1)(1);

end architecture wallace;
