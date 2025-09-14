library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADDER_MANT is
    Port(
        A : in  std_logic_vector(25 downto 0);
        B : in  std_logic_vector(25 downto 0);
        
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
      
        R : out  std_logic_vector(25 downto 0)
    );
end ADDER_MANT;

architecture Behavioral of ADDER_MANT is
    signal R_s: std_logic_vector(25 downto 0);
begin
    process(C,Cntr_sign)
    variable sum : unsigned(25 downto 0);
    begin
       if rising_edge(c) and cntr_sign="00011" then
       
       sum := (unsigned(A) + unsigned(B));
       
       if sum(25)='1' then 
            sum(24 downto 0):=not sum (24 downto 0); 
            sum:=sum+1;
       end if;
       R_s<=std_logic_vector(sum);
       end if;   
    end process;
    R<=R_s;
end Behavioral;
