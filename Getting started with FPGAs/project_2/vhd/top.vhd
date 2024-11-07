library ieee;

use ieee.std_logic_1164.all;

entity And_Gate_Project2 is 
	port (
	sw : in std_logic_vector(1 downto 0);
	led : out std_logic_vector(0 downto 0));
end entity And_Gate_Project2;

architecture RTL of And_Gate_Project2 is 
begin
	led(0) <= sw(0) and sw(1);
end RTL;

