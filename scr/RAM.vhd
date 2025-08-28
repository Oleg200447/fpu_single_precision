library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    Port (
        clk     : in  STD_LOGIC;                                         
        addr_in    : in  STD_LOGIC_VECTOR(15 downto 0);
        addr_out    : in  STD_LOGIC_VECTOR(15 downto 0);
        w_en: in std_logic;  
        data_in : in  STD_LOGIC_VECTOR(31 downto 0);  
        data_out: out STD_LOGIC_VECTOR(31 downto 0)   
    );
end RAM;

architecture Behavioral of RAM is
    
    type ram_type is array (0 to 65535) of STD_LOGIC_VECTOR(31 downto 0);
    signal ram : ram_type := (0=>"01000000000000000000000000000000",
                              1=>"01000000001000000000000000000000",
                              2=>"01000001000000100000000000000000",
                              3=>"11000000110010100011110101110001",
                              others => (others => '0'));  

    signal read_addr_reg : STD_LOGIC_VECTOR(15 downto 0);

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if w_en='1' then        
                ram(to_integer(unsigned(addr_in))) <= data_in;
            end if;         
        end if;
    end process;
    process(clk)
    begin
        if rising_edge(clk) then       
            read_addr_reg <= addr_out;
        end if;
    end process;

    data_out <= ram(to_integer(unsigned(read_addr_reg)));
end Behavioral;