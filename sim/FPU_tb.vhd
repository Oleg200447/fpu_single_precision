library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FPU_tb is end FPU_tb;

architecture Behavioral of FPU_tb is
    component FPU is
        Port (
        Instraction : in  std_logic_vector(23 downto 0); 
        
        C_alu: in std_logic;
        C_pipe: out std_logic;
        
        addr_ram_in: out std_logic_vector(15 downto 0);
        data_ram_in: in std_logic_vector(31 downto 0);
        
        addr_ram_out: out std_logic_vector(15 downto 0);
        data_ram_out: out std_logic_vector(31 downto 0);
        w_en_ram: out std_logic
    );
    end component;
        
     component RAM is
        Port (
        clk     : in  STD_LOGIC;                                         
        addr_in    : in  STD_LOGIC_VECTOR(15 downto 0);
        addr_out    : in  STD_LOGIC_VECTOR(15 downto 0);
        w_en: in std_logic;  
        data_in : in  STD_LOGIC_VECTOR(31 downto 0);  
        data_out: out STD_LOGIC_VECTOR(31 downto 0)   
    );
    end component;   
               
        signal C_alu: std_logic;
        signal Instraction :  std_logic_vector(23 downto 0); 
       
        signal C_pipe: std_logic;
        
        signal addr_ram_in: std_logic_vector(15 downto 0);
        signal data_ram_in:std_logic_vector(31 downto 0);
        
        signal addr_ram_out: std_logic_vector(15 downto 0);
        signal data_ram_out: std_logic_vector(31 downto 0);
        signal w_en_ram: std_logic;
        
       constant c_alu_period : time := 7 ns;
       constant c_pipe_period : time := 98 ns; 
begin
        fpu_m: FPU port map (Instraction,C_alu,C_pipe,addr_ram_in,data_ram_in,addr_ram_out,data_ram_out,w_en_ram);
        ram_m: RAM port map (C_pipe,addr_ram_out,addr_ram_in,w_en_ram,data_ram_out,data_ram_in);
        
tb_c_alu: process
    begin
    C_alu<='0';
    wait for c_alu_period/2;
    C_alu<='1';
    wait for c_alu_period/2;
end process;
        
tb : process
        begin   --(a+b-c)*d  
            Instraction<="000010100000000000000010";--st(0)=c
            wait for c_pipe_period;
            Instraction<="000010100000000000000001";--st(0)=b st(1)=c
            wait for c_pipe_period;
            Instraction<="000000111111111111111111";--st(0)=b-c st(1)=b st(2)=c
            wait for c_pipe_period;
            Instraction<="000010100000000000000000";--st(0)=a st(1)=b-c st(2)=b st(3)=c
            wait for c_pipe_period;
            Instraction<="000000000000000000000000";--st(0)=a+b-c st(1)=a st(2)=b-c st(3)=b st(4)=c
            wait for c_pipe_period;
            Instraction<="000010100000000000000011";--st(0)=d st(1)=a+b-c st(2)=a st(3)=b-c st(4)=b st(5)=c
            wait for c_pipe_period;
            Instraction<="000001100000000000000000";--st(0)=(a+b-c)*d st(1)=d st(2)=a+b-c st(3)=a st(4)=b-c st(5)=b st(6)=c
            wait for c_pipe_period;
            Instraction<="000011000000000000000100";--end
            wait for c_pipe_period;
            Instraction<="000010100000000000000001";
            wait for c_pipe_period;
            Instraction<="000001000000000000000010";
            wait for c_pipe_period;
            Instraction<="000000010000000000000000";
            wait for c_pipe_period;
            Instraction<="000001110000000000000011";
            wait for c_pipe_period;
            Instraction<="000011000000000000000101";--end
            wait for c_pipe_period;
            Instraction<="000000100110000000000101";
            wait for c_pipe_period;
            Instraction<="000010110110000000000101";       
            wait for c_pipe_period;
            Instraction<="000011000000000000000110";--end
            wait for c_pipe_period;
            WAIT;
        end process;
end Behavioral;
