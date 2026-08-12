-- 1-bit half adder: two bits in, sum plus carry out.
-- Used by the Dadda tree, where a column sometimes needs shaving by exactly one.
library ieee;
use ieee.std_logic_1164.all;

entity HA is
  port (
    A  : in  std_logic;
    B  : in  std_logic;
    S  : out std_logic;
    Co : out std_logic
  );
end entity HA;

architecture BEHAVIORAL of HA is
begin

  S  <= A xor B;    -- sum
  Co <= A and B;    -- carry-out

end architecture BEHAVIORAL;

configuration CFG_HA_BEHAVIORAL of HA is
  for BEHAVIORAL
  end for;
end configuration CFG_HA_BEHAVIORAL;
