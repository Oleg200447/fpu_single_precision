library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity REG_STACK is
    Port (
        C : in  STD_LOGIC;
                                      
        D_in  : in  STD_LOGIC_VECTOR(31 downto 0);
        IND_in   : in  STD_LOGIC_VECTOR(2 downto 0);
        w_en:in std_logic;
        
        inc_top:in std_logic;
        
        inc_top_back_chop:in std_logic;
        inc_top_back_alu:in std_logic;

        IND_out   : in  STD_LOGIC_VECTOR(2 downto 0);   
        D_out_f : out STD_LOGIC_VECTOR(31 downto 0); 
        D_out_s : out STD_LOGIC_VECTOR(31 downto 0)     
    );
end REG_STACK;

architecture Behavioral of REG_STACK is
   
    type reg_stack_type is array (0 to 7) of STD_LOGIC_VECTOR(31 downto 0);
    signal reg_stack : reg_stack_type := (others => (others => '0'));
    
    signal D_out_f_s:STD_LOGIC_VECTOR(31 downto 0);
    signal D_out_s_s:STD_LOGIC_VECTOR(31 downto 0);
   
    signal top : unsigned(2 downto 0) := "000"; 
begin
    
write: process(C)
    variable top_v:unsigned(2 downto 0);
    begin      
        if rising_edge(C) then
             top_v:=unsigned(top);
             if inc_top='1' then
                top_v:=top_v+"001";
             end if;
             
             if w_en='1' then                                             
                reg_stack(to_integer(top_v - unsigned(IND_in)))<=D_in;       
             end if;           
             top<=top_v;

       end if;

    end process;
 read: process(C)
    variable top_v:unsigned(2 downto 0);
    begin      
        if rising_edge(C) then
             top_v:=unsigned(top);
             
             if inc_top_back_chop='1' and inc_top_back_alu='1' then   
                D_out_f_s<=reg_stack(to_integer(top_v + "010"));
                D_out_s_s<=reg_stack(to_integer(top_v +"010" - unsigned(IND_out)));
             elsif inc_top_back_chop='1' or inc_top_back_alu='1' then   
                D_out_f_s<=reg_stack(to_integer(top_v + "001"));
                D_out_s_s<=reg_stack(to_integer(top_v +"001" - unsigned(IND_out)));        
             else
                D_out_f_s<=reg_stack(to_integer(top_v));
                D_out_s_s<=reg_stack(to_integer(top_v - unsigned(IND_out)));
             end if;                    
       end if;          
    end process;   
    D_out_f<=D_out_f_s;
    D_out_s<=D_out_s_s;
   
end Behavioral;