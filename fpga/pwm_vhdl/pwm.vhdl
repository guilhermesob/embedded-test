-- ==================================================================
-- --- Libraries ---

  library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;
  use IEEE.std_logic_unsigned.all;

 
-- ==================================================================
-- --- Entity --- 
  entity pwm is
    port 
	 (
      clk        : in  std_logic;                          -- clock signal 
      reset      : in  std_logic;                          -- reset signal 
      duty_cycle : in  std_logic_vector(7 downto 0);       -- 8-bit duty cycle
      pwm_out    : out STD_LOGIC                           -- pwm output
    );
  end pwm;


-- ==================================================================
-- --- Architecture ---
  architecture hardware of pwm is
    signal counter : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- 8-bit counter

  begin
    pro1: process(clk, reset)
    begin
        if reset = '0' then
            counter <= (others => '0');
            pwm_out <= '0';
        elsif rising_edge(clk) then
            if counter < "11111111" then
                counter <= counter + 1;
            else
                counter <= (others => '0');
            end if;
            
            if counter < duty_cycle then
                pwm_out <= '1';
            else
                pwm_out <= '0';
            end if;
        end if;
    
	 end process pro1;
  
  end hardware;


-- ==================================================================
-- Test --


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- ==================================================================
-- --- Entity (Testbench não tem portas) ---
entity pwm_tb is
end pwm_tb;

-- ==================================================================
-- --- Architecture ---
architecture behavior of pwm_tb is

    -- Component Declaration
    component pwm
        port (
            clk        : in  std_logic;
            reset      : in  std_logic;
            duty_cycle : in  std_logic_vector(7 downto 0);
            pwm_out    : out std_logic
        );
    end component;

    -- Signals for testing
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '0';
    signal duty_cycle : std_logic_vector(7 downto 0) := (others => '0');
    signal pwm_out    : std_logic;

    -- Clock period definition (10 ns para 100 MHz)
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: pwm
        port map (
            clk => clk,
            reset => reset,
            duty_cycle => duty_cycle,
            pwm_out => pwm_out
        );

    -- Clock process definitions
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: Reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Test 2: Duty Cycle 50%
        duty_cycle <= "10000000";  -- 128 em decimal (50%)
        wait for 200 ns;

        -- Test 3: Duty Cycle 25%
        duty_cycle <= "01000000";  -- 64 em decimal (25%)
        wait for 200 ns;

        -- Test 4: Duty Cycle 75%
        duty_cycle <= "11000000";  -- 192 em decimal (75%)
        wait for 200 ns;

        -- Test 5: Duty Cycle 100%
        duty_cycle <= "11111111";  -- 255 em decimal (100%)
        wait for 200 ns;

        -- Test 6: Duty Cycle 0%
        duty_cycle <= "00000000";  -- 0 em decimal (0%)
        wait for 200 ns;

        -- Finalize simulation
        wait;
    end process;

end behavior;


-- --- End VHDL File ---




