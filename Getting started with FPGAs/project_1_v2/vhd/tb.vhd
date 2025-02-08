library IEEE;
use IEEE.std_logic_1164.all;
use std.env.finish;

use work.all;

entity switches_to_leds_TB is
end entity switches_to_leds_TB;

architecture behave of switches_to_leds_TB is
  signal r_switch_1 :  std_logic;
  signal r_switch_2 :  std_logic;
  signal r_switch_3 :  std_logic;
  signal r_switch_4 : std_logic;

  signal w_led_1: std_logic;
  signal w_led_2: std_logic;
  signal w_led_3: std_logic;
  signal w_led_4: std_logic;
   
  begin

  UUT: entity switches_to_leds 
    port map (
      i_switch_1 => r_switch_1,
      i_switch_2 => r_switch_2,
      i_switch_3 => r_switch_3,
      i_switch_4 => r_switch_4,
      o_led_1 => w_led_1,
      o_led_2 => w_led_2,
      o_led_3 => w_led_3,
      o_led_4 => w_led_4
    );

  process is
  begin
    r_switch_1 <= '0';
    r_switch_2 <= '0';
    r_switch_3 <= '0';
    r_switch_4 <= '0';
    wait for 10 ns;

    r_switch_1 <= '1';
    r_switch_2 <= '0';
    r_switch_3 <= '0';
    r_switch_4 <= '0';
    wait for 10 ns;
    
    r_switch_1 <= '0';
    r_switch_2 <= '1';
    r_switch_3 <= '0';
    r_switch_4 <= '0';
    wait for 10 ns;

    r_switch_1 <= '0';
    r_switch_2 <= '0';
    r_switch_3 <= '1';
    r_switch_4 <= '0';
    wait for 10 ns;

    r_switch_1 <= '0';
    r_switch_2 <= '0';
    r_switch_3 <= '0';
    r_switch_4 <= '1';
    wait for 10 ns;

    finish;
    end process;
end behave;
