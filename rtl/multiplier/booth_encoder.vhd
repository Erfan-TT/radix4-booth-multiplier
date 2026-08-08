library ieee;
use ieee.std_logic_1164.all;

-- Booth radix-4 encoder
-- Takes 3 overlapping bits of multiplier B: B(2i+1), B(2i), B(2i-1)
-- Outputs 3-bit selection: SEL(2)=negate, SEL(1)=double, SEL(0)=enable
--
-- Encoding table:
-- B_IN  | Operation | SEL
-- 000   |     0     | 000
-- 001   |    +A     | 001
-- 010   |    +A     | 001
-- 011   |   +2A     | 011
-- 100   |   -2A     | 111
-- 101   |    -A     | 101
-- 110   |    -A     | 101
-- 111   |     0     | 000

entity BOOTH_ENCODER is
  port (
    B_IN : in  std_logic_vector(2 downto 0);
    SEL  : out std_logic_vector(2 downto 0)
  );
end BOOTH_ENCODER;

architecture BEHAVIORAL of BOOTH_ENCODER is
begin
  process(B_IN)
  begin
    case B_IN is
      when "000"  => SEL <= "000";  -- 0
      when "001"  => SEL <= "001";  -- +A
      when "010"  => SEL <= "001";  -- +A
      when "011"  => SEL <= "011";  -- +2A
      when "100"  => SEL <= "111";  -- -2A
      when "101"  => SEL <= "101";  -- -A
      when "110"  => SEL <= "101";  -- -A
      when "111"  => SEL <= "000";  -- 0
      when others => SEL <= "000";
    end case;
  end process;
end BEHAVIORAL;
