-- Testbench for the registered Booth multiplier.

--   1. check that the multiplier gives the right result
--   2. switch the circuit , for the dynamic power analysis by PrimeTime 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_boothmul_registered is
  generic (
    CLK_PERIOD  : time    := 2.4 ns; -- generic, we give he period by the sim.do script
    NUM_VECTORS : integer := 500
  );
end tb_boothmul_registered;

architecture TEST of tb_boothmul_registered is

  constant N : integer := 32;

  component boothmul_registered is
    port (
      CLK : in  std_logic;
      RST : in  std_logic;
      LD  : in  std_logic;
      A   : in  std_logic_vector(N-1 downto 0);
      B   : in  std_logic_vector(N-1 downto 0);
      P   : out std_logic_vector(2*N-1 downto 0)
    );
  end component;

  signal CLK : std_logic := '0';
  signal RST : std_logic := '1';
  signal LD  : std_logic := '1';

  signal A : std_logic_vector(N-1 downto 0)   := (others => '0');
  signal B : std_logic_vector(N-1 downto 0)   := (others => '0');
  signal P : std_logic_vector(2*N-1 downto 0);

  -- expected result, delayed by two clock cycles like the multiplier
  signal exp1 : std_logic_vector(2*N-1 downto 0) := (others => '0');
  signal exp2 : std_logic_vector(2*N-1 downto 0) := (others => '0');

  signal check_en : std_logic := '0';
  signal errors   : integer   := 0;
  signal sim_done : boolean   := false;

  -- We add a big odd number to A and B at every clock cycle
  constant A_STEP : integer := 12345;
  constant B_STEP : integer := 6789;

begin




    dut : boothmul_registered
    port map (CLK => CLK, RST => RST, LD => LD, A => A, B => B, P => P);


  clk_process : process
  begin
    while not sim_done loop
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- new operands are given on the falling edge, so they are stable
  stim_process : process
  begin

    -- reset
    RST <= '1';
    LD  <= '1';
    for i in 0 to 3 loop
      wait until falling_edge(CLK);
    end loop;
    RST <= '0';

    -- wait two cycles before checking, the registers need to be filled
    wait until falling_edge(CLK);
    wait until falling_edge(CLK);
    check_en <= '1';

    -- the vectors
    for i in 0 to NUM_VECTORS-1 loop
      wait until falling_edge(CLK);
      A <= std_logic_vector(unsigned(A) + A_STEP);
      B <= std_logic_vector(unsigned(B) + B_STEP);
    end loop;

    -- let the last results come out of the pipeline
    for i in 0 to 3 loop
      wait until falling_edge(CLK);
    end loop;

    report "simulation finished, number of errors = " & integer'image(errors)
      severity note;

    sim_done <= true;
    wait;

  end process;

  -- expected result, two registers, exp2 should be compared with P
  ref_process : process(CLK)
  begin
    if rising_edge(CLK) then
      if RST = '1' then
        exp1 <= (others => '0');
        exp2 <= (others => '0');
      elsif LD = '1' then
        exp1 <= std_logic_vector(signed(A) * signed(B));
        exp2 <= exp1;
      end if;
    end if;
  end process;

  -- checker, compared on the falling edge, when P is stable
  check_process : process(CLK)
  begin
    if falling_edge(CLK) and check_en = '1' then
      if P /= exp2 then
        errors <= errors + 1;
      end if;
    end if;
  end process;

end TEST;
