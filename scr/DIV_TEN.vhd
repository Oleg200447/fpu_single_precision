library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DIV_TEN is
    Port (
        clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC   
    );
end DIV_TEN;

architecture Behavioral of DIV_TEN is
    signal counter : unsigned(3 downto 0) := "0000"; 
    signal temp_clk : STD_LOGIC := '0';              
begin
    process(clk_in)
    begin
        
        if rising_edge(clk_in) then
            if counter = "0110" then
                counter <= "0000";
                temp_clk <= not temp_clk;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temp_clk;
end Behavioral;