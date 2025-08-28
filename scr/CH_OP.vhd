--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity CH_OP is
--    Port (
--        C: in  STD_LOGIC;
        
--        instraction: in std_logic_vector(7 downto 0);
--        Operation_in: in std_logic_vector(1 downto 0);                                     
--        ram: in std_logic_vector(31 downto 0);
--        regs_f: in std_logic_vector(31 downto 0);
--        regs_s: in std_logic_vector(31 downto 0);
        
--        res_back_1: in std_logic_vector(31 downto 0);
--        res_back_2: in std_logic_vector(31 downto 0);
--        inc_top_1:in std_logic;
--        inc_top_2:in std_logic;
        
--        addr_ram_back: in std_logic_vector(15 downto 0);
--        ind_reg_back: in std_logic_vector(2 downto 0);
--        addr_ram_back_2: in std_logic_vector(15 downto 0);
--        ind_reg_back_2: in std_logic_vector(2 downto 0);
        
--        addr_ram_in: in std_logic_vector(15 downto 0);
--        ind_reg_in: in std_logic_vector(2 downto 0);
--        --dst_ind_in: in std_logic;
        
--        addr_ram_out: out std_logic_vector(15 downto 0);
--        ind_reg_out: out std_logic_vector(2 downto 0);
--        --dst_ind_out: out std_logic;
        
--        instraction_out: out std_logic_vector(7 downto 0);
          
--        A: out std_logic_vector(31 downto 0);
--        B: out std_logic_vector(31 downto 0);
--        Operation: out std_logic_vector(1 downto 0)     
--    );
--end CH_OP;

--architecture Behavioral of CH_OP is
   
    
--    signal addr_ram_s: std_logic_vector(15 downto 0);
--    signal ind_reg_s:  std_logic_vector(2 downto 0);
--    --signal dst_ind_s:  std_logic;
    
--    signal operation_s: std_logic_vector(1 downto 0);
    
--    signal instraction_s: std_logic_vector(7 downto 0):="11111111";
   
--begin       
--    A <= regs_f when ((instraction="00000000" or instraction="00000001" or instraction="00000011" or 
--                      instraction="00000100" or instraction="00000110" or instraction="00000111" or
--                      instraction="00001100" or instraction="00001001" or instraction="00001101") and inc_top_1='0' and inc_top_2='0') 
--                else
--         regs_s when ((instraction="00000010" or instraction="00000101" or instraction="00001000" or
--                      instraction="00001011") and ) 
--                else
--         ram    when (instraction="00001010") 
--                else (others=>'0');
         
--    B <= regs_f when (instraction="00000010" or instraction="00000101" or instraction="00001000") 
--                else
--         regs_s when (instraction="00000000" or instraction="00000011" or instraction="00000110") 
--                else
--         ram    when (instraction="00000001" or instraction="00000100" or instraction="00000111") 
--                else (others=>'0');
         
         
--    process(C)
--    begin
--        if rising_edge(C) then   
--            operation_s<=operation_in;
            
--            addr_ram_s<=addr_ram_in;
--            ind_reg_s<=ind_reg_in;
            
--            instraction_s<=instraction;
--            --dst_ind_s<=dst_ind_in;
--        end if;
--    end process;
    
--   operation<=operation_s;
   
--   addr_ram_out<=addr_ram_s;
--   ind_reg_out<=ind_reg_s;
--   --dst_ind_out<=dst_ind_s;
--   instraction_out<=instraction_s;
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CH_OP is
    Port (
        C: in  STD_LOGIC;
        
        instraction: in std_logic_vector(7 downto 0);
        Operation_in: in std_logic_vector(1 downto 0);                                     
        ram: in std_logic_vector(31 downto 0);
        regs_f: in std_logic_vector(31 downto 0);
        regs_s: in std_logic_vector(31 downto 0);
        
        res_back_1: in std_logic_vector(31 downto 0);
        res_back_2: in std_logic_vector(31 downto 0);
        inc_top_back_alu:in std_logic;
        inc_top_back_mem:in std_logic;
        inc_top_back_chop:out std_logic;
        
        addr_ram_back: in std_logic_vector(15 downto 0);
        ind_reg_back: in std_logic_vector(2 downto 0);
        addr_ram_back_2: in std_logic_vector(15 downto 0);
        ind_reg_back_2: in std_logic_vector(2 downto 0);
        
        addr_ram_in: in std_logic_vector(15 downto 0);
        addr_ram_n: in std_logic_vector(15 downto 0);
        ind_reg_in: in std_logic_vector(2 downto 0);
        ind_reg_n: in std_logic_vector(2 downto 0);
        
        addr_ram_out: out std_logic_vector(15 downto 0);
        ind_reg_out: out std_logic_vector(2 downto 0);
        addr_reg_wr: out std_logic;
        addr_reg_wr_back: in std_logic;
        addr_reg_wr_back2: in std_logic;
        
        instraction_out: out std_logic_vector(7 downto 0);
          
        A: out std_logic_vector(31 downto 0);
        B: out std_logic_vector(31 downto 0);
        Operation: out std_logic_vector(1 downto 0)     
    );
end CH_OP;

architecture Behavioral of CH_OP is
   
    
    signal addr_ram_s: std_logic_vector(15 downto 0);
    signal addr_ram_n_s: std_logic_vector(15 downto 0);
    signal ind_reg_s:  std_logic_vector(2 downto 0);
    signal ind_reg_n_s:  std_logic_vector(2 downto 0);
    
    signal operation_s: std_logic_vector(1 downto 0);
    
    signal instraction_s: std_logic_vector(7 downto 0):="11111111";
    
    signal inc_top_s: std_logic;
    
    signal addr_reg_wr_s: std_logic;
   
begin
    
           
    A <= regs_f when ((instraction_s="00000000" or instraction_s="00000001" or instraction_s="00000011" or 
                      instraction_s="00000100" or instraction_s="00000110" or instraction_s="00000111" or
                      instraction_s="00001100" or instraction_s="00001001" or instraction_s="00001101") and inc_top_back_alu='0' and inc_top_back_mem='0' and (ind_reg_back_2/="000" or addr_reg_wr_back2='0') and (ind_reg_back/="000" or addr_reg_wr_back='0')) 
                else
         res_back_2 when ((instraction_s="00000000" or instraction_s="00000001" or instraction_s="00000011" or 
                      instraction_s="00000100" or instraction_s="00000110" or instraction_s="00000111" or
                      instraction_s="00001100" or instraction_s="00001001" or instraction_s="00001101") and ((inc_top_back_alu='0' and inc_top_back_mem='1')or((ind_reg_back_2="000" and addr_reg_wr_back2='1') and (ind_reg_back/="000" or addr_reg_wr_back='0')))) 
                else
         res_back_1 when ((instraction_s="00000000" or instraction_s="00000001" or instraction_s="00000011" or 
                      instraction_s="00000100" or instraction_s="00000110" or instraction_s="00000111" or
                      instraction_s="00001100" or instraction_s="00001001" or instraction_s="00001101") and (inc_top_back_alu='1' or (ind_reg_back="000" and addr_reg_wr_back='1'))) 
                else       
         regs_s when ((instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001000" or
                      instraction_s="00001011") and (ind_reg_back_2/=ind_reg_s or addr_reg_wr_back2='0') and (ind_reg_back/=ind_reg_s or addr_reg_wr_back='0') and ((inc_top_back_alu='0' and inc_top_back_mem='0')or(inc_top_back_alu='1' and inc_top_back_mem='1' and (ind_reg_s/="001"))or((inc_top_back_alu='1' xor inc_top_back_mem='1') and ind_reg_s/="000"))) 
                else
         res_back_2 when ((instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001000" or
                      instraction_s="00001011") and (((ind_reg_back/=ind_reg_s or addr_reg_wr_back='0') and (ind_reg_back_2=ind_reg_s and addr_reg_wr_back2='1') and inc_top_back_alu='0' and inc_top_back_mem='0') or
                      (((ind_reg_back="000" and ind_reg_s/="001") or (ind_reg_back="001" and ind_reg_s/="010") or (ind_reg_back="010" and ind_reg_s/="011") or (ind_reg_back="011" and ind_reg_s/="100") or (ind_reg_back="100" and ind_reg_s/="101") or (ind_reg_back="101" and ind_reg_s/="110") or (ind_reg_back="110" and ind_reg_s/="111") or (ind_reg_back="111" and ind_reg_s/="000"))and addr_reg_wr_back='1' and addr_reg_wr_back2='1' and inc_top_back_alu='1' and inc_top_back_mem='0' and ((ind_reg_back_2="000" and ind_reg_s="001") or (ind_reg_back_2="001" and ind_reg_s="010") or (ind_reg_back_2="010" and ind_reg_s="011") or (ind_reg_back_2="011" and ind_reg_s="100") or (ind_reg_back_2="100" and ind_reg_s="101") or (ind_reg_back_2="101" and ind_reg_s="110") or (ind_reg_back_2="110" and ind_reg_s="111") or (ind_reg_back_2="111" and ind_reg_s="000"))) or
                      (((ind_reg_back="000" and ind_reg_s/="001") or (ind_reg_back="001" and ind_reg_s/="010") or (ind_reg_back="010" and ind_reg_s/="011") or (ind_reg_back="011" and ind_reg_s/="100") or (ind_reg_back="100" and ind_reg_s/="101") or (ind_reg_back="101" and ind_reg_s/="110") or (ind_reg_back="110" and ind_reg_s/="111") or (ind_reg_back="111" and ind_reg_s/="000"))and addr_reg_wr_back='1' and addr_reg_wr_back2='1' and inc_top_back_alu='0' and inc_top_back_mem='1' and ((ind_reg_back_2="000" and ind_reg_s="001") or (ind_reg_back_2="001" and ind_reg_s="010") or (ind_reg_back_2="010" and ind_reg_s="011") or (ind_reg_back_2="011" and ind_reg_s="100") or (ind_reg_back_2="100" and ind_reg_s="101") or (ind_reg_back_2="101" and ind_reg_s="110") or (ind_reg_back_2="110" and ind_reg_s="111") or (ind_reg_back_2="111" and ind_reg_s="000"))) or
                      (((ind_reg_back="000" and ind_reg_s/="010") or (ind_reg_back="001" and ind_reg_s/="011") or (ind_reg_back="010" and ind_reg_s/="100") or (ind_reg_back="011" and ind_reg_s/="101") or (ind_reg_back="100" and ind_reg_s/="110") or (ind_reg_back="101" and ind_reg_s/="111") or (ind_reg_back="110" and ind_reg_s/="000") or (ind_reg_back="111" and ind_reg_s/="001"))and addr_reg_wr_back='1' and addr_reg_wr_back2='1' and inc_top_back_alu='1' and inc_top_back_mem='1' and ((ind_reg_back_2="000" and ind_reg_s="010") or (ind_reg_back_2="001" and ind_reg_s="011") or (ind_reg_back_2="010" and ind_reg_s="100") or (ind_reg_back_2="011" and ind_reg_s="101") or (ind_reg_back_2="100" and ind_reg_s="110") or (ind_reg_back_2="101" and ind_reg_s="111") or (ind_reg_back_2="110" and ind_reg_s="000") or (ind_reg_back_2="111" and ind_reg_s="001"))) or 
                      (ind_reg_s="001" and inc_top_back_alu='1' and inc_top_back_mem='1') or (ind_reg_s="000" and inc_top_back_alu='0' and inc_top_back_mem='1')))       
                else
         res_back_1 when ((instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001000" or
                      instraction_s="00001011")  and (((ind_reg_back=ind_reg_s and addr_reg_wr_back='1') and inc_top_back_alu='0' and inc_top_back_mem='0') or
                      (inc_top_back_alu='1' and inc_top_back_mem='0' and addr_reg_wr_back='1' and ((ind_reg_back="000" and ind_reg_s="001") or (ind_reg_back="001" and ind_reg_s="010") or (ind_reg_back="010" and ind_reg_s="011") or (ind_reg_back="011" and ind_reg_s="100") or (ind_reg_back="100" and ind_reg_s="101") or (ind_reg_back="101" and ind_reg_s="110") or (ind_reg_back="110" and ind_reg_s="111") or (ind_reg_back="111" and ind_reg_s="000"))) or
                      (inc_top_back_alu='0' and inc_top_back_mem='1' and addr_reg_wr_back='1' and ((ind_reg_back="000" and ind_reg_s="001") or (ind_reg_back="001" and ind_reg_s="010") or (ind_reg_back="010" and ind_reg_s="011") or (ind_reg_back="011" and ind_reg_s="100") or (ind_reg_back="100" and ind_reg_s="101") or (ind_reg_back="101" and ind_reg_s="110") or (ind_reg_back="110" and ind_reg_s="111") or (ind_reg_back="111" and ind_reg_s="000"))) or
                      (inc_top_back_alu='1' and inc_top_back_mem='1' and addr_reg_wr_back='1' and ((ind_reg_back="000" and ind_reg_s="010") or (ind_reg_back="001" and ind_reg_s="011") or (ind_reg_back="010" and ind_reg_s="100") or (ind_reg_back="011" and ind_reg_s="101") or (ind_reg_back="100" and ind_reg_s="110") or (ind_reg_back="101" and ind_reg_s="111") or (ind_reg_back="110" and ind_reg_s="000") or (ind_reg_back="111" and ind_reg_s="001"))) or 
                      (ind_reg_s="000" and inc_top_back_alu='1')))  
                else
         ram    when (instraction_s="00001010" and (((addr_ram_back/=addr_ram_s or addr_reg_wr_back='1') and (addr_ram_back_2/=addr_ram_s or addr_reg_wr_back2='1'))))
                else
         res_back_2    when (instraction_s="00001010" and (addr_ram_back/=addr_ram_s or addr_reg_wr_back='1') and (addr_ram_back_2=addr_ram_s and addr_reg_wr_back2='0'))
                else
         res_back_1    when (instraction_s="00001010" and addr_ram_back=addr_ram_s and addr_reg_wr_back='0')
                else (others=>'0');
         
    B <= regs_f when ((instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001000") and inc_top_back_alu='0' and inc_top_back_mem='0' and (ind_reg_back_2/="000" or addr_reg_wr_back2='0') and (ind_reg_back/="000" or addr_reg_wr_back='0')) 
                else
         res_back_2 when ((instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001000") and ((inc_top_back_alu='0' and inc_top_back_mem='1')or((ind_reg_back_2="000" and addr_reg_wr_back2='1') and (ind_reg_back/="000" or addr_reg_wr_back='0')))) 
                else
         res_back_1 when ((instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001000") and (inc_top_back_alu='1' or (ind_reg_back="000" and addr_reg_wr_back='1'))) 
                else
         regs_s when ((instraction_s="00000000" or instraction_s="00000011" or instraction_s="00000110")and (ind_reg_back/=ind_reg_s or addr_reg_wr_back='0') and ((inc_top_back_alu='0' and inc_top_back_mem='0')or(inc_top_back_alu='1' and inc_top_back_mem='1' and (ind_reg_s/="001"))or((inc_top_back_alu='1' xor inc_top_back_mem='1') and ind_reg_s/="000"))) 
                else 
         res_back_2 when ((instraction_s="00000000" or instraction_s="00000011" or instraction_s="00000110") and (((ind_reg_back/=ind_reg_s or addr_reg_wr_back='0') and (ind_reg_back_2=ind_reg_s and addr_reg_wr_back2='1') and inc_top_back_alu='0' and inc_top_back_mem='0') or
                      (((ind_reg_back="000" and ind_reg_s/="001") or (ind_reg_back="001" and ind_reg_s/="010") or (ind_reg_back="010" and ind_reg_s/="011") or (ind_reg_back="011" and ind_reg_s/="100") or (ind_reg_back="100" and ind_reg_s/="101") or (ind_reg_back="101" and ind_reg_s/="110") or (ind_reg_back="110" and ind_reg_s/="111") or (ind_reg_back="111" and ind_reg_s/="000"))and addr_reg_wr_back='1' and addr_reg_wr_back2='1' and inc_top_back_alu='1' and inc_top_back_mem='0' and ((ind_reg_back_2="000" and ind_reg_s="001") or (ind_reg_back_2="001" and ind_reg_s="010") or (ind_reg_back_2="010" and ind_reg_s="011") or (ind_reg_back_2="011" and ind_reg_s="100") or (ind_reg_back_2="100" and ind_reg_s="101") or (ind_reg_back_2="101" and ind_reg_s="110") or (ind_reg_back_2="110" and ind_reg_s="111") or (ind_reg_back_2="111" and ind_reg_s="000"))) or
                      (((ind_reg_back="000" and ind_reg_s/="001") or (ind_reg_back="001" and ind_reg_s/="010") or (ind_reg_back="010" and ind_reg_s/="011") or (ind_reg_back="011" and ind_reg_s/="100") or (ind_reg_back="100" and ind_reg_s/="101") or (ind_reg_back="101" and ind_reg_s/="110") or (ind_reg_back="110" and ind_reg_s/="111") or (ind_reg_back="111" and ind_reg_s/="000"))and addr_reg_wr_back='1' and addr_reg_wr_back2='1' and inc_top_back_alu='0' and inc_top_back_mem='1' and ((ind_reg_back_2="000" and ind_reg_s="001") or (ind_reg_back_2="001" and ind_reg_s="010") or (ind_reg_back_2="010" and ind_reg_s="011") or (ind_reg_back_2="011" and ind_reg_s="100") or (ind_reg_back_2="100" and ind_reg_s="101") or (ind_reg_back_2="101" and ind_reg_s="110") or (ind_reg_back_2="110" and ind_reg_s="111") or (ind_reg_back_2="111" and ind_reg_s="000"))) or
                      (((ind_reg_back="000" and ind_reg_s/="010") or (ind_reg_back="001" and ind_reg_s/="011") or (ind_reg_back="010" and ind_reg_s/="100") or (ind_reg_back="011" and ind_reg_s/="101") or (ind_reg_back="100" and ind_reg_s/="110") or (ind_reg_back="101" and ind_reg_s/="111") or (ind_reg_back="110" and ind_reg_s/="000") or (ind_reg_back="111" and ind_reg_s/="001"))and addr_reg_wr_back='1' and addr_reg_wr_back2='1' and inc_top_back_alu='1' and inc_top_back_mem='1' and ((ind_reg_back_2="000" and ind_reg_s="010") or (ind_reg_back_2="001" and ind_reg_s="011") or (ind_reg_back_2="010" and ind_reg_s="100") or (ind_reg_back_2="011" and ind_reg_s="101") or (ind_reg_back_2="100" and ind_reg_s="110") or (ind_reg_back_2="101" and ind_reg_s="111") or (ind_reg_back_2="110" and ind_reg_s="000") or (ind_reg_back_2="111" and ind_reg_s="001"))) or 
                      (ind_reg_s="001" and inc_top_back_alu='1' and inc_top_back_mem='1') or (ind_reg_s="000" and inc_top_back_alu='0' and inc_top_back_mem='1')))              
                else
         res_back_1 when ((instraction_s="00000000" or instraction_s="00000011" or instraction_s="00000110") and (((ind_reg_back=ind_reg_s and addr_reg_wr_back='1') and inc_top_back_alu='0' and inc_top_back_mem='0') or
                      (inc_top_back_alu='1' and inc_top_back_mem='0' and addr_reg_wr_back='1' and ((ind_reg_back="000" and ind_reg_s="001") or (ind_reg_back="001" and ind_reg_s="010") or (ind_reg_back="010" and ind_reg_s="011") or (ind_reg_back="011" and ind_reg_s="100") or (ind_reg_back="100" and ind_reg_s="101") or (ind_reg_back="101" and ind_reg_s="110") or (ind_reg_back="110" and ind_reg_s="111") or (ind_reg_back="111" and ind_reg_s="000"))) or
                      (inc_top_back_alu='0' and inc_top_back_mem='1' and addr_reg_wr_back='1' and ((ind_reg_back="000" and ind_reg_s="001") or (ind_reg_back="001" and ind_reg_s="010") or (ind_reg_back="010" and ind_reg_s="011") or (ind_reg_back="011" and ind_reg_s="100") or (ind_reg_back="100" and ind_reg_s="101") or (ind_reg_back="101" and ind_reg_s="110") or (ind_reg_back="110" and ind_reg_s="111") or (ind_reg_back="111" and ind_reg_s="000"))) or
                      (inc_top_back_alu='1' and inc_top_back_mem='1' and addr_reg_wr_back='1' and ((ind_reg_back="000" and ind_reg_s="010") or (ind_reg_back="001" and ind_reg_s="011") or (ind_reg_back="010" and ind_reg_s="100") or (ind_reg_back="011" and ind_reg_s="101") or (ind_reg_back="100" and ind_reg_s="110") or (ind_reg_back="101" and ind_reg_s="111") or (ind_reg_back="110" and ind_reg_s="000") or (ind_reg_back="111" and ind_reg_s="001"))) or 
                      (ind_reg_s="000" and inc_top_back_alu='1')))  
                else
         ram    when ((instraction_s="00000001" or instraction_s="00000100" or instraction_s="00000111") and (((addr_ram_back/=addr_ram_s or addr_reg_wr_back='1') and (addr_ram_back_2/=addr_ram_s or addr_reg_wr_back2='1'))))
                else
         res_back_2 when ((instraction_s="00000001" or instraction_s="00000100" or instraction_s="00000111") and (addr_ram_back/=addr_ram_s or addr_reg_wr_back='1') and (addr_ram_back_2=addr_ram_s and addr_reg_wr_back2='0'))
                else 
         res_back_1 when ((instraction_s="00000001" or instraction_s="00000100" or instraction_s="00000111") and addr_ram_back=addr_ram_s and addr_reg_wr_back='0')
                else (others=>'0');
         
     process(C)
    begin
        if rising_edge(C) then   
            if(instraction="00000010" or instraction="00000101" or instraction="00001100" or
               instraction="00001000" or instraction="00001101" or instraction="11111111") then
               inc_top_s <= '0';
            else
               inc_top_s <= '1';
            end if;
        end if;
    end process;
         
    process(C)
    begin
        if rising_edge(C) then   
            operation_s<=operation_in;
        end if;
    end process;
    
 process(C)
    begin
        if rising_edge(C) then              
            addr_ram_s<=addr_ram_in;
        end if;
    end process;
    
 process(C)
    begin
        if rising_edge(C) then   
            addr_ram_n_s<=addr_ram_n;
        end if;
    end process;

 process(C)
    begin
        if rising_edge(C) then              
           ind_reg_s<=ind_reg_in;
        end if;
    end process;

 process(C)
    begin
        if rising_edge(C) then              
            ind_reg_n_s<=ind_reg_n;
        end if;
    end process;

 process(C)
    begin
        if rising_edge(C) then              
            instraction_s<=instraction;
        end if;
    end process;
    
 process(C)
    begin
        if rising_edge(C) then
            if(instraction/="00001100") then
                addr_reg_wr_s<='1';
            else
                addr_reg_wr_s<='0';
            end if;             
        end if;
    end process;   
    
        
   operation<=operation_s;
   
   addr_ram_out<=addr_ram_n_s;
   ind_reg_out<=ind_reg_n_s;
   
   instraction_out<=instraction_s;
   addr_reg_wr<=addr_reg_wr_s;
   inc_top_back_chop<=inc_top_s;
end Behavioral;