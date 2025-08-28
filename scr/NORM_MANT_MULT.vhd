library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NORM_MANT_MULT is
    Port(
        R : in  std_logic_vector(47 downto 0);
        
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        NORM_MANT_o : out  std_logic_vector(22 downto 0);
        EXP_DIV : out  std_logic_vector(6 downto 0)
    );
end NORM_MANT_MULT;

architecture Behavioral of NORM_MANT_MULT is
    signal NORM_MANT_s: std_logic_vector(22 downto 0);
    signal EXP_DIV_s: std_logic_vector(6 downto 0);
  
begin
    process(C,Cntr_sign)
    variable count : integer:=0;
    variable R_v : unsigned(47 downto 0);
    variable NORM_MANT_v : unsigned(22 downto 0);
    
    begin
       if rising_edge(C) and cntr_sign="01011" then
       R_v:=unsigned(R);
       
        for i in 47 downto 0 loop
            if R_v(i) = '1' then
                count := (48-i);
                exit;
            end if;
        end loop;
               
       R_v:=shift_left(R_v,(count));
       NORM_MANT_v:= R_v(47 downto 25);
       NORM_MANT_s<=std_logic_vector(NORM_MANT_v);
       EXP_DIV_s<=std_logic_vector(to_signed((count-2),7));    
       end if;             
    end process;
    NORM_MANT_o<=NORM_MANT_s;
    EXP_DIV<=EXP_DIV_s;
end Behavioral;
