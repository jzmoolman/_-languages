library ieee;
use ieee.std_logic_1164.all;

entity lfsr is
        port ( i_clk: std_logic)
end entity lfst;

architecture RTL of lfsr is
        signal r_lfsr : std_logic_vecter(2 downto 0);
        signal w_xnor : std_logic;
begin
        process (i_clk) is
                r_lfsr <= r_lfsr(1 downto 0) & w_xnor;
        end process;
        w_xnor <= r_lfsr(2) xnor r_lfsr(1);
end architecture RTL;
