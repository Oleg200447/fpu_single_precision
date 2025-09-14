library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TWO_COMPL_CONV_EXP is
      Port (
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        Cond: in std_logic_vector(1 downto 0);
        
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        ATTC : out  std_logic_vector(9 downto 0);       
        BTTC : out  std_logic_vector(9 downto 0)
       );
end TWO_COMPL_CONV_EXP;

architecture Behavioral of TWO_COMPL_CONV_EXP is

signal BTTC_s: std_logic_vector(9 downto 0);
signal ATTC_s: std_logic_vector(9 downto 0);

begin
    
    process(C,Cntr_sign)
    variable ATTC_v : unsigned(9 downto 0);
    begin    
       if rising_edge(C) and Cntr_sign="00110" then
       ATTC_v :=Cond(1)& '0' & unsigned(A_exp);
       
       if ATTC_v(9)='1' then 
            ATTC_v(8 downto 0):=not ATTC_v (8 downto 0); 
            ATTC_v:=ATTC_v+1;
       end if;
       ATTC_s<=std_logic_vector(ATTC_v);
       end if;
    end process;
      
    process(C,Cntr_sign)
    variable BTTC_v : unsigned(9 downto 0);
    begin    
       if rising_edge(C) and Cntr_sign="00110" then
       BTTC_v :=Cond(0)& '0' & unsigned(B_exp);
       
       if BTTC_v(9)='1' then 
            BTTC_v(8 downto 0):=not BTTC_v (8 downto 0); 
            BTTC_v:=BTTC_v+1;
       end if;
       BTTC_s<=std_logic_vector(BTTC_v);
       end if;   
    end process;
    
    ATTC<=ATTC_s;
    BTTC<=BTTC_s;
end Behavioral;
