library ieee;
use ieee.std_logic_1164.all;
use work.common_pkg.all; --NBIT and NROWS

-- just a wrapper, change architecture in configuration.vhd file
entity reduction_tree is
  port (
    PP : in  pp_array(0 to NROWS-1);   -- outer range fixed by the generic
    C  : out pp_word;                  -- carry vector
    S  : out pp_word                   -- sum vector
  );
end entity reduction_tree;


architecture wallace of reduction_tree is

  component wallace_tree is
    port (
      PP : in  pp_array(0 to NROWS-1);   -- outer range fixed by the generic
      C  : out pp_word;                  -- carry vector
      S  : out pp_word                   -- sum vector
        );
  end component wallace_tree;
begin

  wallace_i: wallace_tree port map ( 
    PP => PP, 
    C => C, 
    S => S
    );
end architecture wallace;


architecture dadda of reduction_tree is

  component dadda_tree is
    port (
      PP : in  pp_array(0 to NROWS-1);   -- outer range fixed by the generic
      C  : out pp_word;                  -- carry vector
      S  : out pp_word                   -- sum vector
      );
  end component dadda_tree;

begin
  dadda_i: dadda_tree port map (
    PP => PP,
    C => C,
    S => S
    );
end architecture dadda;

