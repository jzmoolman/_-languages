library ieee;
use ieee.std_logic_1164.all;
entity debounce_filter is 
        generic (
           DEBOUNCE_LIMIT: integer := 20);
        port (
          i_clk: in std_logic;
          i_bouncy: in std_logic;
          o_debounced: out std_logic);
end entity debounce_filter;

architecture RTL of debounce_filter is 
        signal r_count: integer range 0 to DEBOUNCE_LIMIT := 0;
        signal r_state: std_logic := '0';
begin
        process (i_clk) is
        begin
                if rising_edge(i_clk) then
                        if ( i_bouncy /= r_state and r_count < DEBOUNCE_LIMIT-1) then 
                          r_count <= r_count + 1;
                  elsif ( r_count = DEBOUNCE_LIMIT-1) then 
                          r_count <= 0;
                          r_state <= i_bouncy;
                  else
                          r_count <= 0;
                  end if;
                end if;
        end process;
        o_debounced <= r_state;
end architecture RTL;

library ieee;
use ieee.std_logic_1164.all;

entity debounce_project_top is 
        port (
          i_clk      : in std_logic;
          i_switch_1 : in std_logic;
          o_led_1    : out std_logic);
end entity debounce_project_top;

architecture RTL of debounce_project_top is 
    signal w_debounced_switch: std_logic;

begin
        debounce_filter_inst: entity work.debounce_filter
        generic map (
          DEBOUNCE_LIMIT => 25000)
        port map (
            i_clk => i_clk,
            i_bouncy => i_switch_1,
            o_debounced => w_debounced_switch);

        led_toggle_project_inst: entity work.led_toggle_project 
        port map (
            i_clk => i_clk,
            i_switch_1 => w_debounced_switch,
            o_led_1 => o_led_1);
end architecture RTL;
