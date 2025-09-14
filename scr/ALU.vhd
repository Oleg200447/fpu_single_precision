--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity ALU is
--    Port (
--        A : in  std_logic_vector(31 downto 0);  -- Первый операнд
--        B : in  std_logic_vector(31 downto 0);  -- Второй операнд
--        Operation : in  std_logic_vector(1 downto 0);  -- Выбор операции
        
--        C: in std_logic;
--        C_pipe: in std_logic;
        
--        instraction: in std_logic_vector(7 downto 0);
--        instraction_out: out std_logic_vector(7 downto 0);
                
--        addr_ram_in: in std_logic_vector(15 downto 0);
--        ind_reg_in: in std_logic_vector(2 downto 0);        
--        addr_ram_out: out std_logic_vector(15 downto 0);
--        ind_reg_out: out std_logic_vector(2 downto 0);
               
--        Result : out std_logic_vector(31 downto 0)  -- Результат
--    );
--end ALU;

--architecture Behavioral of ALU is
--component ALU_MANT is 
--        Port (
--        A_m : in  std_logic_vector(22 downto 0);
--        B_m : in  std_logic_vector(22 downto 0);
--        A_sign:in std_logic;
--        B_sign:in std_logic;
--        SFT_val: in std_logic_vector(9 downto 0);
--        Cond: in std_logic_vector(1 downto 0);
        
--        Operation: in std_logic_vector(1 downto 0);
        
--        Cntr_sign:in std_logic_vector(4 downto 0);
        
--        C: in std_logic;
        
        
        
        
--        --Res_m : out  std_logic_vector(25 downto 0)
--        EXP_DIV:out std_logic_vector(6 downto 0);
        
--        Res_sign:out std_logic;
--        Res_m : out  std_logic_vector(22 downto 0)      
--       );
--    end component;
--    component ALU_EXP is 
--        Port (
--        A_exp : in  std_logic_vector(7 downto 0);
--        B_exp : in  std_logic_vector(7 downto 0);
--        EXP_DIV: in  std_logic_vector(6 downto 0);
--        Operation: in std_logic_vector(1 downto 0);
        
--        SFT_val: out std_logic_vector(9 downto 0);
--        Cond: out std_logic_vector(1 downto 0);
--        ovr_exp: out std_logic;
        
--        Cntr_sign:in std_logic_vector(4 downto 0);
        
--        C: in std_logic;
        
--        Res_exp : out  std_logic_vector(7 downto 0)   
--       );
--     end component;
     
--     component  CU is
--     Port (
--        operation:in std_logic_vector(1 downto 0);
--        C:in std_logic;
--        C_pipe:in std_logic;
--        Cntr_sign:out std_logic_vector(4 downto 0)
--     );
--       end component;
       
--    signal Cntr_sign_s :  std_logic_vector(4 downto 0);
--    signal SFT_val_s :  std_logic_vector(9 downto 0);
--    signal cond_s :  std_logic_vector(1 downto 0);
--    signal BSFT_s :  std_logic_vector(23 downto 0);
    
--    signal RES_reg :  std_logic_vector(31 downto 0); --reg for res
    
--    signal ovr_exp_s : std_logic;
    
--    signal RES_s :  std_logic_vector(31 downto 0); 
--    signal EXP_DIV_s: std_logic_vector(6 downto 0);
    
--    signal A_s:std_logic_vector(31 downto 0);
--    signal B_s:std_logic_vector(31 downto 0); 
    
--    signal instraction_s: std_logic_vector(7 downto 0):="11111111";
                
--    signal addr_ram_s: std_logic_vector(15 downto 0);
--    signal ind_reg_s: std_logic_vector(2 downto 0); 
--begin
    
--    cmpnt_1: CU port map (Operation,C,C_pipe,Cntr_sign_s);
--    cmpnt_2: ALU_EXP port map (A_s(30 downto 23),B_s(30 downto 23),EXP_DIV_s,Operation,SFT_val_s,cond_s,ovr_exp_s,Cntr_sign_s,C,RES_s(30 downto 23));
--    cmpnt_3: ALU_MANT port map (A_s(22 downto 0),B_s(22 downto 0),A_s(31),B_s(31),SFT_val_s,cond_s,Operation,Cntr_sign_s,C,EXP_DIV_s,RES_s(31),RES_s(22 downto 0));
    
--    process(C_pipe)
--        begin
--            if rising_edge(C_pipe) then
--                A_s<=A;
--                B_s<=B;
--            end if;
--    end process;
    
--    process(C_pipe)
--        begin
--            if rising_edge(C_pipe) then
--                instraction_s<=instraction;
--                addr_ram_s<=addr_ram_in;
--                ind_reg_s<=ind_reg_in;
--            end if;
--    end process;
    
--    process(C)
--        begin
--            if rising_edge(C) then
--                case Operation is
--                    when "00" =>
--                    case Cntr_sign_s is
--                        when "00100" => RES_reg(31)<=RES_s(31);
--                        when "01000" => RES_reg(22 downto 0)<=RES_s(22 downto 0);
--                        when "01001" => RES_reg(30 downto 23)<=RES_s(30 downto 23);
--                        when others =>null ;
--                    end case;
--                    when "01" =>
--                    case Cntr_sign_s is
--                        when "01010" => RES_reg(31)<=A_s(31) XOR B_s(31);
--                        when "01000" => case ovr_exp_s is
--                                        when '0' => RES_reg(22 downto 0)<=RES_s(22 downto 0);
--                                        when others => RES_reg(22 downto 0)<=(others=>'0');
--                                        end case;
--                        when "01001" => RES_reg(30 downto 23)<=RES_s(30 downto 23);
--                                        case ovr_exp_s is
--                                        when '0' => RES_reg(30 downto 23)<=RES_s(30 downto 23);
--                                        when others => RES_reg(30 downto 23)<=(others=>'1');
--                                        end case;
--                        when others =>null ;
--                    end case;
--                    when "10" =>
--                    case Cntr_sign_s is
--                        when "00100" => RES_reg(31)<=RES_s(31);
--                        when "01000" => RES_reg(22 downto 0)<=RES_s(22 downto 0);
--                        when "01001" => RES_reg(30 downto 23)<=RES_s(30 downto 23);
--                        when others =>null ;
--                    end case;
--                    when others =>
--                    case Cntr_sign_s is
--                        when "01111" => RES_reg<=A_s;
--                        when others =>null ;
--                    end case;
--                 end case;
--            end if;
--    end process;
--    result<=RES_reg;
    
--    instraction_out<=instraction_s;
--    addr_ram_out<=addr_ram_s;
--    ind_reg_out<=ind_reg_s;
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A : in  std_logic_vector(31 downto 0);  
        B : in  std_logic_vector(31 downto 0);  
        Operation : in  std_logic_vector(1 downto 0);  
        
        C: in std_logic;
        C_pipe: in std_logic;
        
        instraction: in std_logic_vector(7 downto 0);
        instraction_out: out std_logic_vector(7 downto 0);
                
        addr_ram_in: in std_logic_vector(15 downto 0);
        ind_reg_in: in std_logic_vector(2 downto 0);        
        addr_ram_out: out std_logic_vector(15 downto 0);
        ind_reg_out: out std_logic_vector(2 downto 0);
        
        inc_top:in std_logic;
        inc_top_back_1:out std_logic;
        
        addr_reg_wr: in std_logic;
        addr_reg_wr_back: out std_logic;
               
        Result : out std_logic_vector(31 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
component ALU_MANT is 
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
    end component;
    component ALU_EXP is 
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
     end component;
     
     component  CU is
     Port (
        operation:in std_logic_vector(1 downto 0);
        C:in std_logic;
        C_pipe:in std_logic;
        Cntr_sign:out std_logic_vector(4 downto 0)
     );
       end component;
       
    signal Cntr_sign_s :  std_logic_vector(4 downto 0);
    signal SFT_val_s :  std_logic_vector(9 downto 0);
    signal cond_s :  std_logic_vector(1 downto 0);
    signal BSFT_s :  std_logic_vector(23 downto 0);
    
    signal RES_reg :  std_logic_vector(31 downto 0); --reg for res
    
    signal ovr_exp_s : std_logic;
    
    signal RES_s :  std_logic_vector(31 downto 0); 
    signal EXP_DIV_s: std_logic_vector(6 downto 0);
    
    signal A_s:std_logic_vector(31 downto 0);
    signal B_s:std_logic_vector(31 downto 0); 
    signal Operation_s: std_logic_vector(1 downto 0);
    
    signal instraction_s: std_logic_vector(7 downto 0):="11111111";
                
    signal addr_ram_s: std_logic_vector(15 downto 0);
    signal ind_reg_s: std_logic_vector(2 downto 0);
    
    signal inc_top_s:std_logic;
    
    signal addr_reg_wr_s:std_logic; 
begin
    
    cmpnt_1: CU port map (Operation_s,C,C_pipe,Cntr_sign_s);
    cmpnt_2: ALU_EXP port map (A_s(30 downto 23),B_s(30 downto 23),EXP_DIV_s,Operation_s,SFT_val_s,cond_s,ovr_exp_s,Cntr_sign_s,C,RES_s(30 downto 23));
    cmpnt_3: ALU_MANT port map (A_s(22 downto 0),B_s(22 downto 0),A_s(31),B_s(31),SFT_val_s,cond_s,Operation_s,Cntr_sign_s,C,EXP_DIV_s,RES_s(31),RES_s(22 downto 0));
    
    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                A_s<=A;
            end if;
    end process;
    
    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                B_s<=B;
            end if;
    end process;
    
    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                Operation_s<=operation;
            end if;
    end process;    
    
    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                instraction_s<=instraction;
            end if;
    end process;

    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                addr_ram_s<=addr_ram_in;
            end if;
    end process;

    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                ind_reg_s<=ind_reg_in;
            end if;
    end process;

    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                inc_top_s<=inc_top;
            end if;
    end process;
    
    process(C_pipe)
        begin
            if rising_edge(C_pipe) then
                addr_reg_wr_s<=addr_reg_wr;
            end if;
    end process;
    
    process(C)
        begin
            if rising_edge(C) then
                case Operation_s is
                    when "00" =>
                    case Cntr_sign_s is
                        when "00100" => RES_reg(31)<=RES_s(31);
                        when "01000" => RES_reg(22 downto 0)<=RES_s(22 downto 0);
                        when "01001" => RES_reg(30 downto 23)<=RES_s(30 downto 23);
                        when others =>null ;
                    end case;
                    when "01" =>
                    case Cntr_sign_s is
                        when "01010" => RES_reg(31)<=A_s(31) XOR B_s(31);
                        when "01000" => case ovr_exp_s is
                                        when '0' => RES_reg(22 downto 0)<=RES_s(22 downto 0);
                                        when others => RES_reg(22 downto 0)<=(others=>'0');
                                        end case;
                        when "01001" => RES_reg(30 downto 23)<=RES_s(30 downto 23);
                                        case ovr_exp_s is
                                        when '0' => RES_reg(30 downto 23)<=RES_s(30 downto 23);
                                        when others => RES_reg(30 downto 23)<=(others=>'1');
                                        end case;
                        when others =>null ;
                    end case;
                    when "10" =>
                    case Cntr_sign_s is
                        when "00100" => RES_reg(31)<=RES_s(31);
                        when "01000" => RES_reg(22 downto 0)<=RES_s(22 downto 0);
                        when "01001" => RES_reg(30 downto 23)<=RES_s(30 downto 23);
                        when others =>null ;
                    end case;
                    when others =>
                    case Cntr_sign_s is
                        when "01111" => RES_reg<=A_s;
                        when others =>null ;
                    end case;
                 end case;
            end if;
    end process;
    result<=RES_reg;
    
    instraction_out<=instraction_s;
    addr_ram_out<=addr_ram_s;
    ind_reg_out<=ind_reg_s;
    
    inc_top_back_1<=inc_top_s;
    
    addr_reg_wr_back<=addr_reg_wr_s;
end Behavioral;