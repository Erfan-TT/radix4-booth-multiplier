library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common_pkg.all;          -- NBIT, pp_word, pp_array

-- =============================================================================
-- BOOTHMUL : NBIT x NBIT signed multiplier.
--
--   BOOTH_ENCODER   NBIT/2 radix-4 encoders, one per bit pair of B
--   mux_and_shift   one partial-product row each: 0, +/-A, +/-2A
--                   built in NBIT+1 bits with the sign bit inverted and zeros
--                   above it (sign-extension elimination)
--   corrector       one more row: Booth "+1" carries in the low half,
--                   sign-extension bias cancellation constant in the high half
--   REDUCTION_TREE  reduces the NBIT/2+1 rows down to carry + sum
--   P4_adder        final carry-propagate add to the 2*NBIT product
--
-- Everything is arithmetic mod 2**(2*NBIT): CSA carry-outs of the MSB are
-- dropped and the final adder's Cout is left open. That is exact rather than
-- approximate, because a signed NBIT x NBIT product always fits in 2*NBIT bits.
-- The same modular property is what makes the sign-extension trick valid.
--
-- The operand width comes from pp_pkg.NBIT, not from a generic, because the
-- pp_array port type has to be declared in a package.
-- =============================================================================
entity BOOTHMUL is
  port (
    A : in  std_logic_vector(NBIT-1 downto 0);
    B : in  std_logic_vector(NBIT-1 downto 0);
    P : out std_logic_vector(2*NBIT-1 downto 0)
  );
end entity BOOTHMUL;

architecture STRUCTURAL of BOOTHMUL is

  -- one Booth row per bit pair of B; the corrector supplies one row on top
  constant Num_PP : integer := NBIT/2;

  type sel_array_t is array (0 to Num_PP-1) of std_logic_vector(2 downto 0);

  -- B with B(-1) = '0' appended at the LSB end
  signal B_padded : std_logic_vector(NBIT downto 0);

  signal triplets : sel_array_t;
  signal sel      : sel_array_t;

  signal pp_row   : pp_array(0 to Num_PP-1);   -- rows straight out of the muxes
  signal pp       : pp_array(0 to Num_PP);     -- shifted rows + corrector row
  signal neg_bits : std_logic_vector(Num_PP-1 downto 0);

  signal tree_c   : pp_word;
  signal tree_s   : pp_word;

  component BOOTH_ENCODER is
    port (
      B_IN : in  std_logic_vector(2 downto 0);
      SEL  : out std_logic_vector(2 downto 0)
    );
  end component;

  component mux_and_shift is
    generic (N : integer := 32);
    port (
      A   : in  std_logic_vector(N-1 downto 0);
      sel : in  std_logic_vector(2 downto 0);
      pp  : out std_logic_vector(2*N-1 downto 0)
    );
  end component;

  component corrector is
    generic (N : integer := 32);
    port (
      neg_bits     : in  std_logic_vector(N/2-1 downto 0);
      correction_v : out std_logic_vector(2*N-1 downto 0)
    );
  end component;

  component REDUCTION_TREE is
    port (
      PP : in  pp_array(0 to NROWS-1);
      C  : out pp_word;
      S  : out pp_word
    );
  end component;

  component P4_adder is
    generic (NBIT : integer := 32);
    port (
      A    : in  std_logic_vector(NBIT-1 downto 0);
      B    : in  std_logic_vector(NBIT-1 downto 0);
      Cin  : in  std_logic;
      S    : out std_logic_vector(NBIT-1 downto 0);
      Cout : out std_logic
    );
  end component;

begin

  -- B(-1) = '0' convention
  B_padded <= B & '0';

  gen_stages: for i in 0 to Num_PP-1 generate

    -- overlapping triplet B(2i+1), B(2i), B(2i-1)
    triplets(i) <= B_padded(2*i+2) & B_padded(2*i+1) & B_padded(2*i);

    enc_i: BOOTH_ENCODER
      port map (
        B_IN => triplets(i),
        SEL  => sel(i)
      );

    -- sel(2) is the negate flag, which is also the "+1" this row still owes
    neg_bits(i) <= sel(i)(2);

    mux_i: mux_and_shift
      generic map (N => NBIT)
      port map (
        A   => A,
        sel => sel(i),
        pp  => pp_row(i)
      );

    -- row i carries weight 4**i, i.e. a left shift by 2i
    pp(i) <= std_logic_vector(shift_left(unsigned(pp_row(i)), 2*i));

  end generate gen_stages;

  -- last row: Booth "+1"s (low half) merged with the bias constant (high half)
  corr_i: corrector
    generic map (N => NBIT)
    port map (
      neg_bits     => neg_bits,
      correction_v => pp(Num_PP)
    );

  tree_i: REDUCTION_TREE
    port map (
      PP => pp,
      C  => tree_c,
      S  => tree_s
    );

  final_add: P4_adder
    generic map (NBIT => 2*NBIT)
    port map (
      A    => tree_c,
      B    => tree_s,
      Cin  => '0',
      S    => P,
      Cout => open
    );

end architecture STRUCTURAL;

-- Configurations live in cfg/configurations.vhd, because the testbench-level
-- ones can only be analysed after the testbench and it is easier to keep the
-- whole binding story in one file.


