library ieee;
use ieee.std_logic_1164.all;

entity reg_N is 
generic (N : integer := 32);
port (
    clk, RST, LD : in  std_logic;
    X        : in  std_logic_vector(N-1 downto 0);
    Y        : out std_logic_vector(N-1 downto 0)
);
end entity;

architecture beh of reg_N is 

signal Y_temp : std_logic_vector(N-1 downto 0);

begin
process(clk) begin
    if(rising_edge(clk)) then

        if (RST = '1') then
            Y_temp <= (others => '0');

        elsif (LD = '1') then
            Y_temp <= X;
        end if;
    end if;
 end process;

 Y <= Y_temp;

 end architecture;