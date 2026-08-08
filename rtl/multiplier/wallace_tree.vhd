library ieee;
use ieee.std_logic_1164.all;

use work.pp_pkg.all;
use work.const_math_pkg.all;

-- =============================================================================
-- WALLACE_TREE : reduces NROWS partial-product rows down to two.
--
-- Each layer takes every group of 3 rows into one 3:2 carry-save adder, which
-- produces 2 rows (a carry vector and a sum vector). Rows left over after
-- grouping by 3 are passed straight through to the next layer.
--
-- The final two rows are handed back as C and S for a carry-propagate adder to
-- finish. Keeping the CPA outside means this block can be swapped for a Dadda
-- or 4:2-compressor tree without touching BOOTHMUL.
-- =============================================================================
entity WALLACE_TREE is
  generic (NROWS : positive);
  port (
    PP : in  pp_array(0 to NROWS-1);   -- outer range fixed by the generic
    C  : out pp_word;                  -- carry vector
    S  : out pp_word                   -- sum vector
  );
end entity WALLACE_TREE;

architecture STRUCTURAL of WALLACE_TREE is

  -- reduction layers, plus one to hold the final (carry, sum) pair
  constant NUM_LAYERS : natural := wallace_num_layers(NROWS) + 1;

  type layer_array is array (natural range <>) of pp_array(0 to NROWS-1);

  -- Only rows 0 .. rows_after_layers(NROWS,i)-1 of layer(i) are ever driven or
  -- read. The initialiser exists purely to keep the unused rows from showing up
  -- as 'U' in the waveform; synthesis ignores it.
  signal layer : layer_array(0 to NUM_LAYERS-1) :=
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

  tree: for i in 0 to NUM_LAYERS-2 generate
    constant ROWS_IN : natural := rows_after_layers(NROWS, i);
    constant N_CSA   : natural := ROWS_IN / 3;             -- full groups of 3
    constant N_PASS  : natural := ROWS_IN - N_CSA*3;       -- leftovers (0, 1 or 2)
  begin

    -- 3 rows in -> 1 CSA -> 2 rows out (carry at 2j, sum at 2j+1)
    gen_csa: for j in 0 to N_CSA-1 generate
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
    gen_pass: for k in 0 to N_PASS-1 generate
      layer(i+1)(2*N_CSA + k) <= layer(i)(3*N_CSA + k);
    end generate gen_pass;

  end generate tree;

  C <= layer(NUM_LAYERS-1)(0);
  S <= layer(NUM_LAYERS-1)(1);

end architecture STRUCTURAL;
