library ieee;
use ieee.std_logic_1164.all;
use work.common_pkg.all; -- for NBIT and NROWS
use work.dadda_types_pkg.all; -- for NUM_LAYERS_D
use work.dadda_math_pkg.all; -- for the functions


entity dadda_tree is
  port (
    PP : in  pp_array(0 to NROWS-1);   -- outer range fixed by the generic
    C  : out pp_word;                  -- carry vector
    S  : out pp_word                   -- sum vector
  );
end entity dadda_tree;


architecture structural of dadda_tree is

  constant remaining_system : sys_t(0 to NUM_LAYERS_D-1) := constructing_dadda(0); -- zero opt code means return remaining_sys
  constant HA_matrix :        sys_t(0 to NUM_LAYERS_D-1) := constructing_dadda(1); -- one opt code means return ha matrix
  constant FA_matrix :        sys_t(0 to NUM_LAYERS_D-1) := constructing_dadda(2); -- two opt code means return fa matrix
  

  -- one entry per layer, each holding a full set of rows
  type layer_array is array (natural range <>) of pp_array(0 to NROWS-1);

  signal layer : layer_array(0 to NUM_LAYERS_D-1) := (others => (others => (others => '0')));

component HA is
  port (
    A  : in  std_logic;
    B  : in  std_logic;
    S  : out std_logic;
    Co : out std_logic
  );
end component;


component FA is 
        generic ( DFAS: time := 0 ns;
		  DFAC: time := 0 ns);
	Port (	A:	In	std_logic;
		B:	In	std_logic;
		Ci:	In	std_logic;
		S:	Out	std_logic;
		Co:	Out	std_logic);
end component; 

begin

  layer(NUM_LAYERS_D-1) <= PP;

  tree: for lev in NUM_LAYERS_D-1 downto 1 generate -- last layer, layer(0) no need to analyze, its the result

  constant num_rows_current : integer :=  num_rows_dadda(lev);

  begin

    columns: for col in 0 to NBIT*2-1 generate 

    constant remaining_count : integer := remaining_counting_func(remaining_system, lev, num_rows_current, col);
    constant fa_count_col : integer := fa_count_col_dadda(FA_matrix, lev, num_rows_current, col);
    constant ha_flag_col : integer := ha_flag_col_dadda(HA_matrix, lev, num_rows_current, col);
    constant C_out_counting : integer := num_C_out_from_prev_col(FA_matrix, HA_matrix, lev, col);
    constant filled_rows : integer := fa_count_col +  ha_flag_col + C_out_counting; --c_out from prev layer
    constant FA_args : fa_args_t(0 to (fa_count_col-1)) := fa_arg_func(FA_matrix, num_rows_current, fa_count_col, lev, col);
    constant rem_bit_args : rem_bit_args_t(0 to (remaining_count-1)) := remaining_bit_pos(remaining_system, num_rows_current, remaining_count, lev, col);
    

    begin

        maping_fa: for ID in 0 to fa_count_col-1 generate
        
        constant row_first_arg : integer := FA_args(ID)(0);
        constant row_sec_arg   : integer := FA_args(ID)(1);
        constant row_third_arg : integer := FA_args(ID)(2);
        constant sum_bit_arg : integer := ID + C_out_counting;
        constant carry_out_arg : integer := ID;
        begin
        FA_i : FA port map (
            A => layer(lev)(row_first_arg)(col),
            B => layer(lev)(row_sec_arg)(col),
            Ci => layer(lev)(row_third_arg)(col),
            S => layer(lev-1)(sum_bit_arg)(col), -- putting the sum bits after the positions that the prev layer c_out filled
            Co => layer(lev-1)(carry_out_arg)(col+1)); -- we would have fa_count_col equal to zero for the last bit, so its fine to use col+1
        end generate maping_fa;

        gen_HA : if ha_flag_col = 1 generate
        constant HA_args : ha_args_t := ha_arg_func(HA_matrix, num_rows_current, lev, col);
        constant row_first_arg : integer := HA_args(0);
        constant row_sec_arg : integer := HA_args(1);
        constant sum_bit_arg : integer := fa_count_col + C_out_counting;
        constant carry_out_arg : integer := fa_count_col;
        begin
        HA_i : HA port map (
            A  => layer(lev)(row_first_arg)(col),
            B  => layer(lev)(row_sec_arg)(col),
            S  => layer(lev-1)(sum_bit_arg)(col), -- putting after the sum bits of FAs and c_out bits from prev layer
            Co => layer(lev-1)(carry_out_arg)(col + 1));
        end generate;

        -- passing the rest, loop over the remaining system bits at col, for all rows, and find the i_th bit position
        passing_loop: for i in 0 to (remaining_count -1) generate
        constant bit_position : natural := rem_bit_args(i);
          begin
            layer(lev-1)(filled_rows + i)(col) <= layer(lev)(bit_position)(col);
          end generate passing_loop;
        
        -- passing_rows: for i in 0 to remaining_rows-1 generate
        -- layer(lev-1)(filled_rows + i)(col) <= layer(lev)(i+ passed_rows)(col);
        -- end generate passing_rows;

    end generate columns;

  
  end generate tree;

  C <= layer(0)(0);
  S <= layer(0)(1);

end architecture structural;
