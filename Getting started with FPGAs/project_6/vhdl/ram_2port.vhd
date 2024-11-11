library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entirty RAM_2Port is
        generic (
            WIDTH : integer := 16;
        DEPTH : interger := 256);
        port (
        -- write signals 
        i_wr_clk : in std_logic;
        i_wr_addr : in std_logic_vector; -- size at higher level
        i_wr_db : in std_logic;
        i_wr_data : in std_logic_vector(WIDTH-1 downto 0);
        -- read signals
        i_rd_clk : in std_logic;
        i_rd_addr : in std_logic_vector;
        i_rd_en : in std_logic;
        o_rd_dv : out std_logic;
        o_rd_data : out std_logic_vector(WIDTH-1 downto 0)
);

end RAM_2port;

architecture RTL of RAM_2Port is 
        type t_mem is array ( 0 to DEPTH-1) of std_loogic_vector(WIDHT-1 downto 0);
        signal r_mem: t_mem;
begin
        process (i_wr_clk)
        begin
                if rising_edge(i_wr_clk) then
                        if i_wr_dv = '1' then 
                                r_mem(to_interger(unsigned(i_wr_addr))) <= i_wr_data;
                        end if ;
                end if;
        end process;

        process (i_rd_clk)
        begin
                if rising_edge(i_rd_clk) then
                        o_rd_data <= r_mem(to_interger(unsigned(i_rd_add)));
                        o_rd_dv <= i_rd_en;
                end if;
        end process;

end RTL
