library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TWO_COMPL_CONV is
      Port (
        A_m : in  std_logic_vector(23 downto 0);
        B_m : in  std_logic_vector(23 downto 0);
        A_sign : in std_logic;
        B_sign : in std_logic;
        
        C: in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        ATTC : out  std_logic_vector(25 downto 0);
        BTTC : out  std_logic_vector(25 downto 0)
       );
end TWO_COMPL_CONV;

architecture Behavioral of TWO_COMPL_CONV is

signal ATTC_s: std_logic_vector(25 downto 0);
signal BTTC_s: std_logic_vector(25 downto 0);

begin
    process(C,Cntr_sign)
    variable ATTC_v : unsigned(25 downto 0);
    begin    
      if rising_edge(c) and cntr_sign="00010" then
       ATTC_v := A_sign & "0" & unsigned(A_m);
       
       if ATTC_v(25)='1' then 
            ATTC_v(24 downto 0):=not ATTC_v (24 downto 0); 
            ATTC_v:=ATTC_v+1;
       end if;
       ATTC_s<=std_logic_vector(ATTC_v);
      end if;   
    end process;
    
    process(C,Cntr_sign)
    variable BTTC_v : unsigned(25 downto 0);
    begin    
    if rising_edge(c) and cntr_sign="00010" then 
       BTTC_v := B_sign & "0" & unsigned(B_m);
       
       if BTTC_v(25)='1' then 
            BTTC_v(24 downto 0):=not BTTC_v (24 downto 0); 
            BTTC_v:=BTTC_v+1;
       end if;
       BTTC_s<=std_logic_vector(BTTC_v);
      end if;   
    end process;
    
    ATTC<=ATTC_s;
    BTTC<=BTTC_s;
end Behavioral;
