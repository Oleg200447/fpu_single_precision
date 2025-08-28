library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADDER_EXP_MULT is
    Port(
        A : in  std_logic_vector(7 downto 0);
        B : in  std_logic_vector(7 downto 0);
        
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        ovr: out std_logic; 
        R : out  std_logic_vector(7 downto 0)
    );
end ADDER_EXP_MULT;

architecture Behavioral of ADDER_EXP_MULT is
    signal R_s: std_logic_vector(7 downto 0);
    signal ovr_s: std_logic;
begin
    process(C,Cntr_sign)
    variable sum : unsigned(8 downto 0);
    begin  
       if rising_edge(C) and Cntr_sign="01010" then
            ovr_s<='0';
            sum := (unsigned('0' & (A)) + unsigned('0' & (B))-"001111111");
            if(sum>"011111111") then              
                ovr_s<='1';
            end if;
            R_s<=(std_logic_vector(sum(7  downto 0)));
       end if;   
    end process;
    R<=R_s;
    ovr<=ovr_s;
end Behavioral;
