
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;



--entity CU is
--    Port (
--    operation:in std_logic_vector(1 downto 0);
--    C:in std_logic;
--    C_pipe: in std_logic;
--    Cntr_sign:out std_logic_vector(4 downto 0)
--     );
--end CU;

--architecture Behavioral of CU is
--signal Cntr_sign_s: std_logic_vector(4 downto 0):="00000";

----signal work_fl_set: std_logic:='0';

--signal work_fl: std_logic:='0';

--begin
--    --process(C_pipe)
--   -- begin
--      -- if rising_edge(C_pipe) then 
--        --    work_fl_set<='1';
--     --  elsif falling_edge(C_pipe) then 
--       --     work_fl_set<='0';
--      -- end if;
--    --end process;
--    process(C,C_pipe)
--    begin
--        --if work_fl_set='1' then         
--          -- work_fl<='1';
--       -- end if;
--        if rising_edge(C_pipe) then 
--           work_fl<='1';
--        end if;
        
        
--        if rising_edge(C) and work_fl='1' then
--        case Operation is
--            when "00" =>
--            case Cntr_sign_s is 
--                when "00000" =>
--                    Cntr_sign_s<="00101";
--                when "00101" =>
--                    Cntr_sign_s<="00110";
--                when "00110" =>
--                    Cntr_sign_s<="00111";
--                when "00111" =>
--                    Cntr_sign_s<="00001";
--                when "00001" =>
--                    Cntr_sign_s<="00010";        
--                when "00010" =>
--                    Cntr_sign_s<="00011";
--                --when "00011" =>
--                    --work_fl<='0';
--                    --Cntr_sign_s<="00000";    
--                when others =>
--                    work_fl<='0';
--                    Cntr_sign_s<="00000";
--             end case;
--             when others =>
                    
--         end case;
--        end if;
--     end process;
--     Cntr_sign<=Cntr_sign_s;
--end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port (
        operation   : in  std_logic_vector(1 downto 0);
        C           : in  std_logic;        
        C_pipe      : in  std_logic;          
        Cntr_sign   : out std_logic_vector(4 downto 0)  
    );
end CU;

architecture Behavioral of CU is
    signal Cntr_sign_s  : std_logic_vector(4 downto 0) := "00000";
    signal work_fl      : std_logic := '0';
    signal C_pipe_sync  : std_logic_vector(1 downto 0) := "00"; 
begin
    process(C)
    begin
        if rising_edge(C) then     
            C_pipe_sync <= C_pipe_sync(0) & C_pipe;
               
            if C_pipe_sync = "01" then
                work_fl <= '1';  
            end if;
            
           
            if work_fl = '1' then
                case operation is
                    when "00" =>  -- SUM
                        case Cntr_sign_s is
                            when "00000" => Cntr_sign_s <= "00101";
                            when "00101" => Cntr_sign_s <= "00110";
                            when "00110" => Cntr_sign_s <= "00111";
                            when "00111" => Cntr_sign_s <= "00001";
                            when "00001" => Cntr_sign_s <= "00010";
                            when "00010" => Cntr_sign_s <= "00011";
                            when "00011" => Cntr_sign_s <= "00100";
                            when "00100" => Cntr_sign_s <= "01000";
                            when "01000" => Cntr_sign_s <= "01001";
                            when others =>
                                work_fl <= '0';  
                                Cntr_sign_s <= "00000";
                        end case;
                    when "01" =>  -- MULT
                        case Cntr_sign_s is
                            when "00000" => Cntr_sign_s <= "01010";
                            when "01010" => Cntr_sign_s <= "01011";
                            when "01011" => Cntr_sign_s <= "01000";
                            when "01000" => Cntr_sign_s <= "01001";
                            when others =>
                                work_fl <= '0';  
                                Cntr_sign_s <= "00000";
                        end case;
                    when "10" =>  -- SUB
                        case Cntr_sign_s is
                            when "00000" => Cntr_sign_s <= "00101";
                            when "00101" => Cntr_sign_s <= "00110";
                            when "00110" => Cntr_sign_s <= "00111";
                            when "00111" => Cntr_sign_s <= "00001";
                            when "00001" => Cntr_sign_s <= "00010";
                            when "00010" => Cntr_sign_s <= "00011";
                            when "00011" => Cntr_sign_s <= "00100";--here
                            when "00100" => Cntr_sign_s <= "01000";
                            when "01000" => Cntr_sign_s <= "01001";
                            when others =>
                                work_fl <= '0'; 
                                Cntr_sign_s <= "00000";
                        end case;
                    when others =>  
                         case Cntr_sign_s is
                            when "00000" => Cntr_sign_s <= "01111";
                            when others =>
                            work_fl <= '0'; 
                                Cntr_sign_s <= "00000";
                        end case;
                end case;
            end if;
        end if;
    end process;
    
    Cntr_sign <= Cntr_sign_s;
end Behavioral;