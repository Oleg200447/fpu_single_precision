library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SUB_EXP is
    Port(
        EXP: in  std_logic_vector(7 downto 0);
        EXP_DIV: in  std_logic_vector(6 downto 0);
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        EXP_R : out  std_logic_vector(7 downto 0)
    );
end SUB_EXP;

architecture Behavioral of SUB_EXP is
    signal EXP_R_s: std_logic_vector(7 downto 0);
    
begin
    process(C,Cntr_sign)
    variable EXP_v: signed(8 downto 0);
    begin
       if rising_edge(C) and cntr_sign="01000" then
            EXP_v:=signed('0' & unsigned(EXP));
            EXP_v:=EXP_v - signed(EXP_DIV);
       end if;
     EXP_R_s<=std_logic_vector(EXP_v(7 downto 0));  
    end process;
    EXP_R<=EXP_R_s;
end Behavioral;
