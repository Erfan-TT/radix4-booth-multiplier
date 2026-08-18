library ieee;
use ieee.std_logic_1164.all;
use work.common_pkg.all;

entity boothmul_registered is 
  port (
    CLK, LD, RST : in std_logic;
    A : in  std_logic_vector(N-1 downto 0);
    B : in  std_logic_vector(N-1 downto 0);
    P : out std_logic_vector(2*N-1 downto 0)
  );
  end entity;

architecture structural of boothmul_registered is 

component boothmul is
  port (
    A : in  std_logic_vector(N-1 downto 0);
    B : in  std_logic_vector(N-1 downto 0);
    P : out std_logic_vector(2*N-1 downto 0)
  );
end component;

component reg_N is
    generic (N : integer := 32);
port (
    clk, RST, LD : in  std_logic;
    X        : in  std_logic_vector(N-1 downto 0);
    Y        : out std_logic_vector(N-1 downto 0)
);
end component;

signal A_i, B_i : std_logic_vector(N-1 downto 0);
signal P_i : std_logic_vector(2*N-1 downto 0);

begin

    A_reg: reg_N
    generic map(N=>NBIT)
    port map(X=> A, Y => A_i, clk => clk, LD => LD, RST => RST);

    B_reg: reg_N 
    generic map(N=>NBIT)
    port map(X=> B, Y => B_i, clk => clk, LD => LD, RST => RST);  

    mul: boothmul
    port map(A=>A_i, B=> B_i, P => P_i);

    p_reg: reg_N
    generic map(N=>NBIT*2)
    port map(X=> P_i, Y => P, clk => clk, LD => LD, RST => RST);

end architecture;
