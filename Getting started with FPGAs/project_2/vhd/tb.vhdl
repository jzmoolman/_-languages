library IEEE;
use IEEE.std_logic_1164.all;
use std.env.finish;

use work.all;

entity And_Gate_TB is
end entity And_Gate_TB;

architecture behave of And_Gate_TB is

  signal r_in : std_logic_vector(1 downto 0);
  signal w_out: std_logic_vector(0 downto 0);
  begin

  UUT: entity And_Gate_Project2
  port map (
    sw => r_in,
    led => w_out);

  process is
  begin
    r_in(0) <= '0';
    r_in(1) <= '0';
    wait for 10 ns;

    r_in(0) <= '0';
    r_in(1) <= '1';
    wait for 10 ns;

    r_in(0) <= '1';
    r_in(1) <= '0';
    wait for 10 ns;

    r_in(0) <= '1';
    r_in(1) <= '1';
    wait for 10 ns;

    finish;
    end process;
end behave;
