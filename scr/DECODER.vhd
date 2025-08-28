library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DECODER is
    Port (
        C : in  STD_LOGIC;
                                      
        instraction_in: in std_logic_vector(23 downto 0);
          
        addr_ram_read: out std_logic_vector(15 downto 0);
        addr_ram_next: out std_logic_vector(15 downto 0);
        ind_reg_read: out std_logic_vector(2 downto 0);
        ind_reg_next: out std_logic_vector(2 downto 0);
        --dst_ind: out std_logic;
        --inc_top_back_chop:in std_logic;
        --inc_top_back_alu:in std_logic;
        --inc_top:out std_logic;
        instraction_out: out std_logic_vector(7 downto 0);
        Operation: out std_logic_vector(1 downto 0)     
    );
end DECODER;

architecture Behavioral of DECODER is
            
    signal operation_s: std_logic_vector(1 downto 0);
    signal instraction:std_logic_vector(23 downto 0);
    signal addr_ram_r_s: std_logic_vector(15 downto 0);
    signal addr_ram_n_s: std_logic_vector(15 downto 0);
    signal ind_reg_r_s: std_logic_vector(2 downto 0);
    signal ind_reg_n_s: std_logic_vector(2 downto 0);
    --signal ind_reg_s_1: std_logic_vector(2 downto 0);
    --signal ind_reg_s_2: std_logic_vector(2 downto 0);
    signal dst_ind_s: std_logic;
    
    signal instraction_s: std_logic_vector(7 downto 0):="11111111";
begin

process(C)
    begin      
        if rising_edge(C) then    
            instraction<= instraction_in;
        end if;
end process;
       
op: process(C)
    begin      
        if rising_edge(C) then
           case instraction(23 downto 16) is
            when "00000000" | "00000001" | "00000010" =>
                operation_s <= "00";  -- add
            when "00000011" | "00000100" | "00000101" => 
                operation_s <= "10";  -- sub
            when "00000110" | "00000111" | "00001000" => 
                operation_s <= "01";  --mult
            when others => operation_s <= "11"; -- ld st
        end case;
        end if;
    end process;
    
process(C)
    begin      
        if rising_edge(C) then
            if(instraction(23 downto 16)="00000001" or instraction(23 downto 16)="00000100" or instraction(23 downto 16)="00000111" or instraction(23 downto 16)="00001010") then   
                addr_ram_r_s<=instraction(15 downto 0);
            else
                addr_ram_r_s<=(others=>'0');
            end if;
        end if;
end process;

process(C)
    begin      
        if rising_edge(C) then
            if (instraction(23 downto 16)="00001100") then   
                addr_ram_n_s<=instraction(15 downto 0);
            else
                addr_ram_n_s<=(others=>'0');
            end if;
        end if;
end process;

process(C)
    begin      
        if rising_edge(C) then    
            instraction_s<= instraction(23 downto 16);
        end if;
end process;

process(C)
    begin      
        if rising_edge(C) then    
            if(instraction(23 downto 16)="00000000" or instraction(23 downto 16)="00000011" or instraction(23 downto 16)="00000110") then
                ind_reg_r_s<="001";
            elsif (instraction(23 downto 16)="00000010" or instraction(23 downto 16)="00000101" or instraction(23 downto 16)="00001000" or instraction(23 downto 16)="00001011") then
                ind_reg_r_s<=instraction(15 downto 13);
            else ind_reg_r_s<="000";
            end if;
            --dst_ind_s<=instraction(12);
        end if;
end process;

process(C)
    begin      
        if rising_edge(C) then    
            if(instraction(23 downto 16)="00000000" or instraction(23 downto 16)="00000011" or instraction(23 downto 16)="00000110" or
               instraction(23 downto 16)="00000001" or instraction(23 downto 16)="00000100" or instraction(23 downto 16)="00000111" or
               instraction(23 downto 16)="00001001" or instraction(23 downto 16)="00001010" or instraction(23 downto 16)="00001011") then
                ind_reg_n_s<="000";
            elsif (instraction(23 downto 16)="00000010" or instraction(23 downto 16)="00000101" or instraction(23 downto 16)="00001000" or instraction(23 downto 16)="00001101") then
                ind_reg_n_s<=instraction(15 downto 13);
            else ind_reg_n_s<="000";
            end if;
            --dst_ind_s<=instraction(12);
        end if;
end process;
--inc_top <= '0' when (instraction_s="00000010" or instraction_s="00000101" or instraction_s="00001100" or
--                     instraction_s="00001000" or instraction_s="00001101" or instraction_s="11111111") 
--               else '1';


    
--addr_ram<=addr_ram_s;
--ind_reg<=ind_reg_s;
--dst_ind<=dst_ind_s;
addr_ram_read<=addr_ram_r_s;
addr_ram_next<=addr_ram_n_s;
ind_reg_read<=ind_reg_r_s;
ind_reg_next<=ind_reg_n_s;

operation<=operation_s;
instraction_out<=instraction_s;
   
end Behavioral;