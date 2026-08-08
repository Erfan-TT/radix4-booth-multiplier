library ieee;
use ieee.std_logic_1164.all;

entity CSA is
  generic (N : integer := 32);
  port (
    A : in  std_logic_vector(N-1 downto 0);
    B : in  std_logic_vector(N-1 downto 0);
    F : in  std_logic_vector(N-1 downto 0);
    Carry : out std_logic_vector(N-1 downto 0);
    S : out std_logic_vector(N-1 downto 0)

  );
end CSA;

architecture STRUCTURAL of CSA is

    component FA is 
        generic ( DFAS: time := 0 ns;
		  DFAC: time := 0 ns);
	Port (
        A:	In	std_logic;
		B:	In	std_logic;
		Ci:	In	std_logic;
		S:	Out	std_logic;
		Co:	Out	std_logic);

    end component;

    signal Carry_temp : std_logic_vector(N-1 downto 0);

    begin

    FAs: for i in 0 to N-1 generate
    FA_i : FA
    port map (
       A=> A(i), B => B(i), Ci => F(i), S => S(i), Co => Carry_temp(i)
    );
    end generate FAs;

    Carry(0) <= '0';
    shifting_Carry : for i in 0 to N-2 generate
    Carry(i+1) <= Carry_temp(i);
    end generate shifting_Carry;

    end architecture;