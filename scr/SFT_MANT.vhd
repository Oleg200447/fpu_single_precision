library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SFT_MANT is
    Port (
        A_m : in  std_logic_vector(22 downto 0);
        B_m : in  std_logic_vector(22 downto 0);
        SFT_val: in std_logic_vector(9 downto 0);
        Cond: in std_logic_vector(1 downto 0);
        
        C: in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        ASFT : out  std_logic_vector(23 downto 0);
        BSFT : out  std_logic_vector(23 downto 0)
       );
end SFT_MANT;

architecture Behavioral of SFT_MANT is
    signal ASFT_s: std_logic_vector(23 downto 0);
    signal BSFT_s: std_logic_vector(23 downto 0);
begin
    process(C,Cntr_sign)
    variable ASFT_v : unsigned(23 downto 0);
    variable SFT_val_v : unsigned(7 downto 0);

    begin
    if rising_edge(c) and cntr_sign="00001" then
        SFT_val_v:= unsigned(SFT_val(7 downto 0));
        ASFT_v:='1' & unsigned(A_m);
        if Cond = "10" then 
            ASFT_v:=shift_right(ASFT_v,to_integer( SFT_val_v));          
        end if;
     ASFT_s<=std_logic_vector(ASFT_v); 
     end if;    
    end process;
    ASFT<=ASFT_s;
    
    process(C,Cntr_sign)
    variable BSFT_v : unsigned(23 downto 0);
    variable SFT_val_v : unsigned(7 downto 0);

    begin
    if rising_edge(c) and cntr_sign="00001" then
        SFT_val_v:= unsigned(SFT_val(7 downto 0));
        BSFT_v:='1' & unsigned(B_m);
        if Cond = "01" then 
            BSFT_v:=shift_right(BSFT_v,to_integer( SFT_val_v));
        end if;
     BSFT_s<=std_logic_vector(BSFT_v);     
    end if;
    end process;
    
    BSFT<=BSFT_s;
end Behavioral;
