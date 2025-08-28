--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity MWS is
--    Port (
--        C: in  STD_LOGIC;     
--        res: in std_logic_vector(31 downto 0);
        
--        instraction: in std_logic_vector(7 downto 0);
        
--        addr_ram_in: in std_logic_vector(15 downto 0);
--        ind_reg_in: in std_logic_vector(2 downto 0);
        
--        addr_ram_back: out std_logic_vector(15 downto 0);
--        ind_reg_back: out std_logic_vector(2 downto 0);
--        addr_ram_back_2: out std_logic_vector(15 downto 0);
--        ind_reg_back_2: out std_logic_vector(2 downto 0);
        
--        inc_top: out std_logic;
--        inc_top_2: out std_logic;
        
--        addr_ram_out: out std_logic_vector(15 downto 0);
--        ind_reg_out: out std_logic_vector(2 downto 0);
--        res_out: out std_logic_vector(31 downto 0);
--        w_en_reg:out std_logic;
--        w_en_ram:out std_logic;
        
--        res_back_2:out std_logic_vector(31 downto 0)      
--    );
--end MWS;

--architecture Behavioral of MWS is
   
--signal res_back_2_s: std_logic_vector(31 downto 0);
--signal inc_top_s: std_logic;  
--signal inc_top_2_s: std_logic;

--signal addr_ram_back_2_s: std_logic_vector(15 downto 0);
--signal ind_reg_back_2_s: std_logic_vector(2 downto 0);    
--begin

--    w_en_reg<='0' when(instraction="00001100" or instraction="11111111" )
--                  else '1';
--    w_en_ram<='1' when(instraction="00001100")
--                  else '0';
    
         
--    ind_reg_out <= ind_reg_in when (instraction="00000010" or instraction="00000101" or 
--                                     instraction="00001000" or instraction="00001101") 
--                               else 
--                  (others=>'0');
         
--    inc_top_s <= '0' when (instraction="00000010" or instraction="00000101" or instraction="00001100" or
--                     instraction="00001000" or instraction="00001101" or instraction="11111111") 
--               else '1';
               
-- process(C)
--    begin
--        if rising_edge(c) then
--           res_back_2_s<=res;
--           inc_top_2_s<=inc_top_s;
--           addr_ram_back_2_s<=addr_ram_in;
--           ind_reg_back_2_s<=ind_reg_in;
--        end if;
--end process;
      
--    res_out<=res;
--    addr_ram_out<=addr_ram_in;
--    res_back_2<=res_back_2_s;
    
--    inc_top<=inc_top_s;
--    inc_top_2<=inc_top_2_s;
    
--    addr_ram_back<=addr_ram_in;
--    ind_reg_back<=ind_reg_in;
    
--    addr_ram_back_2<=addr_ram_back_2_s;
--    ind_reg_back_2<=ind_reg_back_2_s;
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MWS is
    Port (
        C: in  STD_LOGIC;     
        res: in std_logic_vector(31 downto 0);
        
        instraction: in std_logic_vector(7 downto 0);
        
        addr_ram_in: in std_logic_vector(15 downto 0);
        ind_reg_in: in std_logic_vector(2 downto 0);
        
        addr_ram_back_2: out std_logic_vector(15 downto 0);
        ind_reg_back_2: out std_logic_vector(2 downto 0);
        
        inc_top: in std_logic;
        inc_top_2: out std_logic;
        
        addr_ram_out: out std_logic_vector(15 downto 0);
        ind_reg_out: out std_logic_vector(2 downto 0);
        res_out: out std_logic_vector(31 downto 0);
        w_en_reg:out std_logic;
        w_en_ram:out std_logic;
        
        addr_reg_wr: in std_logic;
        addr_reg_wr_back2: out std_logic;
        
        res_back_2:out std_logic_vector(31 downto 0)      
    );
end MWS;

architecture Behavioral of MWS is
   
signal res_back_2_s: std_logic_vector(31 downto 0);
signal inc_top_s: std_logic;  

signal addr_ram_back_2_s: std_logic_vector(15 downto 0);
signal ind_reg_back_2_s: std_logic_vector(2 downto 0);

signal addr_reg_wr_s:std_logic;    
begin

    w_en_reg<='0' when(instraction="00001100" or instraction="11111111" )
                  else '1';
    w_en_ram<='1' when(instraction="00001100")
                  else '0';
                  
    ind_reg_out <= ind_reg_in;
                      
 process(C)
    begin
        if rising_edge(c) then
           res_back_2_s<=res;
        end if;
end process;

 process(C)
    begin
        if rising_edge(c) then
           inc_top_s<=inc_top;          
        end if;
end process;

 process(C)
    begin
        if rising_edge(c) then
           addr_ram_back_2_s<=addr_ram_in;
        end if;
end process;

 process(C)
    begin
        if rising_edge(c) then
           ind_reg_back_2_s<=ind_reg_in;
        end if;
end process;

 process(C)
    begin
        if rising_edge(c) then
           addr_reg_wr_s<=addr_reg_wr;
        end if;
end process;
      
    res_out<=res;
    addr_ram_out<=addr_ram_in;
   
    inc_top_2<=inc_top_s;
    
    res_back_2<=res_back_2_s;
    addr_ram_back_2<=addr_ram_back_2_s;
    ind_reg_back_2<=ind_reg_back_2_s;
    
    addr_reg_wr_back2<=addr_reg_wr_s;
end Behavioral;