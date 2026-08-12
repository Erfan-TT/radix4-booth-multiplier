library ieee;
use ieee.std_logic_1164.all;
use work.common_pkg.all; -- for NROWS


package dadda_types_pkg is

  -- We have these constants in the common_pkg.vhd
  --constant NBIT : integer := 8;
  --constant NROWS : integer := NBIT/2+1; -- partial products plus the corrector vector
  constant NUM_LAYERS_D : natural; -- just a declaration, just like functions, but given value in the body

  type col_t is array(0 to NBIT*2-1) of bit;
  type row_t is array (0 to NROWS-1) of col_t;
  type sys_t is array (natural range<>) of row_t;

  type fa_pos_t is array(0 to 2) of natural;
  type fa_args_t is array(natural range<>) of fa_pos_t;
  type ha_args_t is array(0 to 1) of natural;

  type rem_bit_args_t is array(natural range<>) of natural;

  function height_dadda(lev: natural) return natural;
  function num_layers_dadda(NROWS : natural) return natural;

end package dadda_types_pkg;

package body dadda_types_pkg is


  function height_dadda(lev: natural) return natural is
  variable temp : integer := 2;
  begin
    for i in 0 to (lev-1) loop -- i changed lev-2 to lev -1
      temp := (temp *3) /2;
      end loop;
    return temp;
  end function height_dadda;


  function num_layers_dadda(NROWS : natural) return natural is 
  variable temp : natural := 2;
  variable level : natural := 1;
  begin
  while NROWS > temp loop
    temp := height_dadda(level);
    level := level + 1;
    end loop;
  return level;
  end function num_layers_dadda;

-- now we can give value to the number of layer constant 
constant NUM_LAYERS_D : natural := num_layers_dadda(NROWS);


end package body dadda_types_pkg;