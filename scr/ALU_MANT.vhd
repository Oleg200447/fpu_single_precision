library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_MANT is
    Port (
        A_m : in  std_logic_vector(22 downto 0);
        B_m : in  std_logic_vector(22 downto 0);
        A_sign:in std_logic;
        B_sign:in std_logic;
        SFT_val: in std_logic_vector(9 downto 0);
        Cond: in std_logic_vector(1 downto 0);
        
        Operation: in std_logic_vector(1 downto 0);
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        C: in std_logic;
        
        EXP_DIV:out std_logic_vector(6 downto 0);
        
        Res_sign:out std_logic;
        Res_m : out  std_logic_vector(22 downto 0)      
       );
end ALU_MANT;

architecture Behavioral of ALU_MANT is
    component ADDER_MANT is 
        Port(
        A : in  std_logic_vector(25 downto 0);
        B : in  std_logic_vector(25 downto 0);
        C: in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        R : out  std_logic_vector(25 downto 0)
    );
    end component;
    component SFT_MANT is 
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
     end component;
     
     component  TWO_COMPL_CONV is
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
       end component;
       component NORM_MANT is 
        Port(
         R : in  std_logic_vector(25 downto 0);
        
         C: in std_logic;    
         Cntr_sign:in std_logic_vector(4 downto 0);
              
         NORM_MANT_o : out  std_logic_vector(22 downto 0);
         EXP_DIV : out  std_logic_vector(6 downto 0)
        );
        end component;
        component MULT_MANT is
        Port(
        A : in  std_logic_vector(22 downto 0);
        B : in  std_logic_vector(22 downto 0);
        
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        R : out  std_logic_vector(47 downto 0)
        );
        end component;
        
        component NORM_MANT_MULT is
        Port(
        R : in  std_logic_vector(47 downto 0);
        
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        NORM_MANT_o : out  std_logic_vector(22 downto 0);
        EXP_DIV : out  std_logic_vector(6 downto 0)
        );
        end component;
        
    signal ATTC_s :  std_logic_vector(25 downto 0);
    signal BTTC_s :  std_logic_vector(25 downto 0);
    signal ASFT_s :  std_logic_vector(23 downto 0);
    signal BSFT_s :  std_logic_vector(23 downto 0);
    
    signal mult_res: std_logic_vector(47 downto 0);
    
    signal B_sign_s:std_logic;
    
    signal EXP_DIV_add_s: std_logic_vector(6 downto 0);
    signal EXP_DIV_mult_s: std_logic_vector(6 downto 0);
    
    signal Res_m_add_s: std_logic_vector(22 downto 0);
    signal Res_m_mult_s: std_logic_vector(22 downto 0);
    
    signal adder_res_s: std_logic_vector(25 downto 0);
begin
     
    cmpnt_1: SFT_MANT port map (A_m,B_m,SFT_val,Cond,C,Cntr_sign,ASFT_s,BSFT_s);
    cmpnt_2: TWO_COMPL_CONV port map (ASFT_s,BSFT_s,A_sign,B_sign_s,C,Cntr_sign,ATTC_s,BTTC_s);
    cmpnt_3: ADDER_MANT port map (ATTC_s,BTTC_s,C,Cntr_sign,adder_res_s);
    cmpnt_4: NORM_MANT port map (adder_res_s,C,Cntr_sign,Res_m_add_s,EXP_DIV_add_s);
    cmpnt_5: NORM_MANT_MULT port map (mult_res,C,Cntr_sign,Res_m_mult_s,EXP_DIV_mult_s);
    cmpnt_6: MULT_MANT port map (A_m,B_m,C,Cntr_sign,mult_res);
    
with operation select --mult
    B_sign_s <= not B_sign when "10",
                B_sign when others;
               
with operation select --mult
    EXP_DIV <= EXP_DIV_add_s when "00",--add
               EXP_DIV_mult_s when "01",--mult
               EXP_DIV_add_s when others;  --sub           

with operation select --mult
    Res_m <= Res_m_add_s when "00", --add
             Res_m_mult_s when "01", --mult
             Res_m_add_s when others; --sub
               
                              
    res_sign<=adder_res_s(25);
end Behavioral;
