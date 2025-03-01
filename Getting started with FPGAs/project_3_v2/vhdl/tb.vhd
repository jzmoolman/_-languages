library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

use work.all;

entity led_toggle_project_TB is
end entity led_toggle_project_TB;

architecture behav of led_toggle_project_TB is
        signal r_clk      : std_logic := '1';
        signal r_switch_1 : std_logic := '0';
        signal w_led_1    : std_logic := '0';
begin
        r_clk <= not r_clk after 5ns;

        UUT : entity led_toggle_project 
        port map (
                i_clk => r_clk,
                i_switch_1 => r_switch_1,
                o_led_1 => w_led_1
        );

        process is 
        begin
                wait for 2ns;
                r_switch_1 <= '1';

                wait for 10ns;
                r_switch_1 <= '0';

                wait for 18ns;
                finish;
        end process;
end behav;

