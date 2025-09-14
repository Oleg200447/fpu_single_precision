library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADDER_EXP is
    Port(
        A : in  std_logic_vector(9 downto 0);
        B : in  std_logic_vector(9 downto 0);
        
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        R : out  std_logic_vector(9 downto 0)
    );
end ADDER_EXP;

architecture Behavioral of ADDER_EXP is
    signal R_s: std_logic_vector(9 downto 0);
begin
    process(C,Cntr_sign)
    variable sum : unsigned(9 downto 0);
    begin  
       if rising_edge(C) and Cntr_sign="00111" then
       sum := (unsigned(A) + unsigned(B));
       
       if sum(9)='1' then
            sum(8 downto 0):=not sum (8 downto 0); 
            sum:=sum+1;
       end if;
       R_s<=std_logic_vector(sum);
       end if;   
    end process;
    R<=R_s;
end Behavioral;
