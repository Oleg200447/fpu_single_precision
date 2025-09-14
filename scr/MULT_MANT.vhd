library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MULT_MANT is
    Port(
        A : in  std_logic_vector(22 downto 0);
        B : in  std_logic_vector(22 downto 0);
        
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        R : out  std_logic_vector(47 downto 0)
    );
end MULT_MANT;

architecture Behavioral of MULT_MANT is
    signal R_s: std_logic_vector(47 downto 0);
begin
    process(C,Cntr_sign)
    variable prod : unsigned(47 downto 0);
    begin
       if rising_edge(c) and cntr_sign="01010" then      
            prod := (unsigned('1' & A) * unsigned('1' & B));          
            R_s<=std_logic_vector(prod);
       end if;   
    end process;
    R<=R_s;
end Behavioral;
