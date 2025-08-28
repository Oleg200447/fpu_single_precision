library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NORM_MANT is
    Port(
        R : in  std_logic_vector(25 downto 0);
        
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        NORM_MANT_o : out  std_logic_vector(22 downto 0);
        EXP_DIV : out  std_logic_vector(6 downto 0)
    );
end NORM_MANT;

architecture Behavioral of NORM_MANT is
    signal NORM_MANT_s: std_logic_vector(22 downto 0);
    signal EXP_DIV_s: std_logic_vector(6 downto 0);
    signal R_s: std_logic_vector(25 downto 0);
begin
    --R_s<=R;
    process(C,Cntr_sign)
    variable count : integer:=0;
    variable count_v : unsigned(4 downto 0):="00000";
    variable R_v : unsigned(25 downto 0);
    variable NORM_MANT_v : unsigned(22 downto 0);
    
    begin
       if rising_edge(C) and cntr_sign="00100" then
       R_v:=unsigned(R);
        for i in 24 downto 0 loop
            if R_v(i) = '1' then
                count := (23-i);
                exit;
            end if;
        end loop;     
       R_v:=shift_left(R_v,(count+2));

       NORM_MANT_v:= R_v(24 downto 2);
       NORM_MANT_s<=std_logic_vector(NORM_MANT_v); 
       EXP_DIV_s<=std_logic_vector(to_signed(count,7));    
       end if;             
    end process;
    NORM_MANT_o<=NORM_MANT_s;
    EXP_DIV<=EXP_DIV_s;
end Behavioral;
