library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_EXP is
    Port (
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        EXP_DIV: in  std_logic_vector(6 downto 0);
        Operation: in std_logic_vector(1 downto 0);
        
        SFT_val: out std_logic_vector(9 downto 0);
        Cond: out std_logic_vector(1 downto 0);
        ovr_exp: out std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        C: in std_logic;
        
        Res_exp : out  std_logic_vector(7 downto 0)   
       );
end ALU_EXP;

architecture Behavioral of ALU_EXP is
    component ADDER_EXP is 
        Port(
        A : in  std_logic_vector(9 downto 0);
        B : in  std_logic_vector(9 downto 0);        
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);      
        R : out  std_logic_vector(9 downto 0)
    );
    end component;
    component CMP_EXP is 
        Port (
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        RES : out  std_logic_vector(1 downto 0)
     );
     end component;
     
     component  TWO_COMPL_CONV_EXP is
     Port (       
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        Cond: in std_logic_vector(1 downto 0);       
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);   
        ATTC : out  std_logic_vector(9 downto 0);       
        BTTC : out  std_logic_vector(9 downto 0)
       );
       end component;
       
       component  RES_REG_MUX_EXP is
     Port(
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        Mul_exp: in  std_logic_vector(7 downto 0);
        cond: in std_logic_vector(1 downto 0);
        Operation: in std_logic_vector(1 downto 0);
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        R_exp : out  std_logic_vector(7 downto 0)
    );
    end component;
    
     component  SUB_EXP is
     Port(
        EXP: in  std_logic_vector(7 downto 0);
        EXP_DIV: in  std_logic_vector(6 downto 0);
        C: in std_logic;
        
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        EXP_R : out  std_logic_vector(7 downto 0)
    );
    end component;
    
    component  ADDER_EXP_MULT is
     Port(
        A : in  std_logic_vector(7 downto 0);
        B : in  std_logic_vector(7 downto 0);
        
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        
        ovr: out std_logic; 
        R : out  std_logic_vector(7 downto 0)
        );
    end component;
       
    signal ATTC_s :  std_logic_vector(9 downto 0);
    signal BTTC_s :  std_logic_vector(9 downto 0);  
    signal cond_s :  std_logic_vector(1 downto 0);
    
    signal Mul_exp_s:std_logic_vector(7 downto 0);
    
    --signal ovr_s: std_logic; 
    
    signal reg_R_exp : std_logic_vector(7 downto 0);  
begin
     
    cmpnt_1: RES_REG_MUX_EXP port map (A_exp,B_exp,Mul_exp_s,cond_s,Operation,C,Cntr_sign,reg_R_exp);
    cmpnt_2: TWO_COMPL_CONV_EXP port map (A_exp,B_exp,cond_s,C,Cntr_sign,ATTC_s,BTTC_s);
    cmpnt_3: CMP_EXP port map (A_exp,B_exp,C,Cntr_sign,cond_s);
    cmpnt_4: ADDER_EXP port map (ATTC_s,BTTC_s,C,Cntr_sign,SFT_val);
    cmpnt_5: SUB_EXP port map (reg_R_exp,EXP_DIV,C,Cntr_sign,Res_exp);
    cmpnt_6: ADDER_EXP_MULT port map (A_exp,B_exp,C,Cntr_sign,ovr_exp,Mul_exp_s);
    cond<=cond_s;
    
end Behavioral;
