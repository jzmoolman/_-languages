library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

use work.all;

entity and_gate_project_TB is 
end entity and_gate_project_TB;

architecture behav of and_gate_project_TB is 
    signal i_switch_1: std_logic;
    signal i_switch_2: std_logic;
    signal o_led_1: std_logic;
begin


UUT: entity and_gate_project_vhdl 
   port map ( 
       i_switch_1 => i_switch_1,
       i_switch_2 => i_switch_2,
       o_led_1 => o_led_1
   );

   process is 
   begin
       i_switch_1 <= '0';
       i_switch_2 <= '0';
       wait for 10ns;
      
       i_switch_1 <= '1';
       i_switch_2 <= '1';
       wait for 10ns;

       finish;
   end process;
end behav;

