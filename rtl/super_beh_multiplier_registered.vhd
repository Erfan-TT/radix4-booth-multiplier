library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common_pkg.all; -- for NBIT and NROWS


entity super_beh_multiplier_registered is
   port (
    CLK, RST : in std_logic;
    LD : in std_logic;
    A : in  std_logic_vector(NBIT-1 downto 0);
    B : in  std_logic_vector(NBIT-1 downto 0);
    P : out std_logic_vector(2*NBIT-1 downto 0)
  );
end entity super_beh_multiplier_registered;


architecture beh of super_beh_multiplier_registered is


signal A_temp, B_temp : std_logic_vector(NBIT-1 downto 0);
signal P_temp : std_logic_vector(2*NBIT-1 downto 0);
  begin

    P_temp <= std_logic_vector(signed(A_temp) * signed(B_temp));

    process(CLK) begin
      if(rising_edge(CLK)) then
        if(RST = '1') then
          A_temp <= (others => '0');
          B_temp <= (others => '0');
          P <= (others => '0'); -- not p_temp, two driver for P_temp, but now one driver for P out

        elsif(LD = '1') then
          A_temp <= A;
          B_temp <= B;
          P <= P_temp;
        end if;
      end if;
    end process;

end beh;