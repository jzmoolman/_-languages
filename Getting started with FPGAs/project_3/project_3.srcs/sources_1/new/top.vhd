library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity LED_Toggle_Project2 is
  port (
     sysclk_n : in std_logic;
     sysclk_p : in std_logic;
     sw : in std_logic_vector(0 downto 0);
     led : out std_logic_vector(0 downto 0));  
end LED_Toggle_Project2;

architecture RTL of LED_Toggle_Project2 is
    signal r_LED : std_logic := '0';
    signal r_switch : std_logic := '0';
    signal s_clk: std_logic;
begin

clk_inst : IBUFDS
generic map (
   DIFF_TERM => FALSE, -- Differential Termination
   IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
   IOSTANDARD => "DEFAULT")
port map (
   O => s_clk,  -- Buffer output
   I => sysclk_p,  -- Diff_p buffer input (connect directly to top-level port)
   IB => sysclk_n -- Diff_n buffer input (connect directly to top-level port)
);

process (s_clk) is
begin
    if rising_edge(s_clk) then
      r_switch <= sw(0);
      if sw(0) = '0' and r_switch = '1' then
          r_LED <= not r_LED;
      end if;
    end if;
 end process;
     
led(0) <= r_LED;
       
end architecture RTL;
