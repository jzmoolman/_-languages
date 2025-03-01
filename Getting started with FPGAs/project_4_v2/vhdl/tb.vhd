library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

entity debounce_filter_TB is 
end entity debounce_filter_TB;

architecture behav of debounce_filter_TB is 
        signal r_clk: std_logic := '1';
        signal r_bouncy: std_logic := '0';
        signal w_debounced: std_logic := '0';
begin
        r_clk <= not r_clk after 2ns;

        UUT: entity work.debounce_filter 
        generic map (
          DEBOUNCE_LIMIT => 4);
          port map (
            i_clk => i_clk;
            i_bouncy => r_bouncy;
            o_debounced => w_debounced);

        process is
        begin
                wait for 10ns;
                r_bouncy <= '1';

                wait until rising_edge(r_clk);
                r_bouncy <= '0';

                wait until rising_edge(r_clk);
                r_bounce <= '1';

                wait for 24ns;
                finish;

end architecture behav;


