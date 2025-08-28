library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU_tb is end ALU_tb;

architecture Behavioral of ALU_tb is
    component ALU is
        Port (
        A : in  std_logic_vector(31 downto 0);  -- ?????? ???????
        B : in  std_logic_vector(31 downto 0);  -- ?????? ???????
        Operation : in  std_logic_vector(1 downto 0);  -- ????? ????????
        C: in std_logic;
        C_pipe: in std_logic;
        Result : out std_logic_vector(31 downto 0)  -- ?????????
    );
        end component;
        
        
        signal A: std_logic_vector(31 downto 0);
        signal B: std_logic_vector(31 downto 0);
        signal operation: std_logic_vector(1 downto 0);
           
        signal C: std_logic;
        signal Res :std_logic_vector(31 downto 0);
        signal C_pipe: std_logic;   
        
        
        
begin
        ch: ALU port map (A,B,operation,C,C_pipe,res);

          
tb : process
        begin
            C<='0';
            C_pipe<='0';
            wait for 50 ns;      
            
            A <= "01000000110000000000000000000000";
            B <= "11000000001000000000000000000000";
            operation<="00";
            
             wait for 5 ns;
            C_pipe<='1';
            C<='1';
           wait for 5 ns;
            C_pipe<='0';
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            
           
            
            A <= "01000000010000000000000000000000";
            B <= "11000000001000000000000000000000";
            operation<="01";
            
            wait for 5 ns;
            C_pipe<='1';
            C<='1';
            wait for 5 ns;
            C_pipe<='0';
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            
            A <= "11000000011000000000000000000000";
            B <= "11000000011000000000000000000000";
           
            operation<="00";
            
            wait for 5 ns;
            C_pipe<='1';
            C<='1';
            wait for 5 ns;
            C_pipe<='0';
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            
            A <= "01000000110000000000000000000000";
            B <= "11000000001000000000000000000000";
            operation<="10";
            
             wait for 5 ns;
            C_pipe<='1';
            C<='1';
           wait for 5 ns;
            C_pipe<='0';
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            
            
            A <= "11111110011000000000000000000000";
            B <= "11111110011000000000000000000000";
           
            operation<="01";
            
            wait for 5 ns;
            C_pipe<='1';
            C<='1';
            wait for 5 ns;
            C_pipe<='0';
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
             wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            wait for 5 ns;
            C<='1';
            wait for 5 ns;
            C<='0';
            
            
            
            WAIT;
        end process;
end Behavioral;
