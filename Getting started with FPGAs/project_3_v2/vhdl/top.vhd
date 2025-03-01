library ieee;
use ieee.std_logic_1164.all;

entity led_toggle_project is 
   port (
        i_clk : in std_logic;
        i_switch_1 : in std_logic;
        o_led_1 :  out std_logic
);
end entity led_toggle_project;

architecture RTL of led_toggle_project is
        signal r_switch_1: std_logic := '0';
        signal r_led_1: std_logic := '0';
begin
        process (i_clk) is 
        begin
                if rising_edge(i_clk) then
                        r_switch_1 <= i_switch_1;
                        if (i_switch_1 = '0' and r_switch_1 = '1') then
                                r_led_1 <= not r_led_1;
                        end if;
                end if;
        end process;
        o_led_1 <= r_led_1;
end RTL;

