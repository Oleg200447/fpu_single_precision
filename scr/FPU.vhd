--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity FPU is
--    Port (
--        Instraction : in  std_logic_vector(23 downto 0); 
        
--        C_alu: in std_logic;
--        C_pipe: in std_logic;
        
--        addr_ram_in: out std_logic_vector(15 downto 0);
--        data_ram_in: in std_logic_vector(31 downto 0);
        
--        addr_ram_out: out std_logic_vector(15 downto 0);
--        data_ram_out: out std_logic_vector(31 downto 0);
--        w_en_ram: out std_logic
--    );
--end FPU;

--architecture Behavioral of FPU is
--component DECODER is 
--        Port (
--        C : in  STD_LOGIC;
                                      
--        instraction: in std_logic_vector(23 downto 0);
          
--        addr_ram: out std_logic_vector(15 downto 0);
--        ind_reg: out std_logic_vector(2 downto 0);
--        --dst_ind: out std_logic;
        
--        --inc_top:out std_logic;
--        instraction_out: out std_logic_vector(7 downto 0);
--        Operation: out std_logic_vector(1 downto 0)     
--    );
--    end component;
    
--    component CH_OP is 
--        Port (
--        C: in  STD_LOGIC;
        
--        instraction: in std_logic_vector(7 downto 0);
--        Operation_in: in std_logic_vector(1 downto 0);                                     
--        ram: in std_logic_vector(31 downto 0);
--        regs_f: in std_logic_vector(31 downto 0);
--        regs_s: in std_logic_vector(31 downto 0);
        
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
--     end component;
     
--     component  ALU is
--     Port (
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
--    end component;
    
--    component  MWS is
--     Port (
--       -- C: in  STD_LOGIC;
        
--        res: in std_logic_vector(31 downto 0);
        
--        instraction: in std_logic_vector(7 downto 0);
        
--        addr_ram_in: in std_logic_vector(15 downto 0);
--        ind_reg_in: in std_logic_vector(2 downto 0);
        
--        inc_top: out std_logic;
        
--        addr_ram_out: out std_logic_vector(15 downto 0);
--        ind_reg_out: out std_logic_vector(2 downto 0);
--        res_out: out std_logic_vector(31 downto 0);
--        w_en_reg:out std_logic;
--        w_en_ram:out std_logic       
--    );
--    end component;
    
--    component  REG_STACK is
--     Port (
--        C      : in  STD_LOGIC;
                                      
--        D_in  : in  STD_LOGIC_VECTOR(31 downto 0);
--        IND_in   : in  STD_LOGIC_VECTOR(2 downto 0);
--        w_en:in std_logic;
        
--        inc_top:in std_logic;
--        --r_en:in std_logic;
--        IND_out   : in  STD_LOGIC_VECTOR(2 downto 0);   
--        D_out_f : out STD_LOGIC_VECTOR(31 downto 0); 
--        D_out_s : out STD_LOGIC_VECTOR(31 downto 0)     
--    );
--    end component;
       
--    signal addr_ram_st1_s :  std_logic_vector(15 downto 0);
--    signal ind_reg_st1_s :  std_logic_vector(2 downto 0);
--    signal inc_top_s: std_logic;
--    signal instraction_out_st1_s: std_logic_vector(7 downto 0);
--    signal operation_out_st1_s: std_logic_vector(1 downto 0);
    
--    signal regs_f_st2_s: std_logic_vector(31 downto 0);
--    signal regs_s_st2_s: std_logic_vector(31 downto 0);
--    signal addr_ram_st2_s :  std_logic_vector(15 downto 0);
--    signal ind_reg_st2_s :  std_logic_vector(2 downto 0);
--    signal instraction_out_st2_s: std_logic_vector(7 downto 0):="00000000";
--    signal A_s: std_logic_vector(31 downto 0);
--    signal B_s: std_logic_vector(31 downto 0);
--    signal operation_out_st2_s: std_logic_vector(1 downto 0);
    
--    signal addr_ram_st3_s :  std_logic_vector(15 downto 0);
--    signal ind_reg_st3_s :  std_logic_vector(2 downto 0);
--    signal instraction_out_st3_s: std_logic_vector(7 downto 0);
--    signal result_st3_s:std_logic_vector(31 downto 0);
    
--    signal addr_ram_st4_s :  std_logic_vector(15 downto 0);
--    signal ind_reg_st4_s :  std_logic_vector(2 downto 0);
--    signal result_st4_s:std_logic_vector(31 downto 0);
--    signal w_en_reg_s:std_logic;
--    signal w_en_ram_s:std_logic;
--begin
    
--    st_1: DECODER port map (C_pipe,instraction,addr_ram_st1_s,ind_reg_st1_s,instraction_out_st1_s,operation_out_st1_s);
--    st_2: CH_OP port map (C_pipe,instraction_out_st1_s,operation_out_st1_s,data_ram_in,regs_f_st2_s,regs_s_st2_s,
--                          addr_ram_st1_s,ind_reg_st1_s,addr_ram_st2_s,ind_reg_st2_s,instraction_out_st2_s,A_s,B_s,
--                          operation_out_st2_s);
--    st_3: ALU port map (A_s,B_s,operation_out_st2_s,C_alu,C_pipe,instraction_out_st2_s,instraction_out_st3_s,addr_ram_st2_s,
--                        ind_reg_st2_s,addr_ram_st3_s,ind_reg_st3_s,result_st3_s);
--    st_4: MWS port map (result_st3_s,instraction_out_st3_s,addr_ram_st3_s,ind_reg_st3_s,inc_top_s,addr_ram_st4_s,ind_reg_st4_s,
--                        result_st4_s,w_en_reg_s,w_en_ram_s);
--    regs: REG_STACK port map(C_pipe,result_st4_s,ind_reg_st4_s,w_en_reg_s,inc_top_s,ind_reg_st1_s,regs_f_st2_s,regs_s_st2_s);
--    addr_ram_in<=addr_ram_st1_s;
--    data_ram_out<=result_st4_s;
--    addr_ram_out<=addr_ram_st4_s;
--    w_en_ram<=w_en_ram_s;
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FPU is
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
end FPU;

architecture Behavioral of FPU is
component DECODER is 
        Port (
        C : in  STD_LOGIC;
                                      
        instraction_in: in std_logic_vector(23 downto 0);
          
        addr_ram_read: out std_logic_vector(15 downto 0);
        addr_ram_next: out std_logic_vector(15 downto 0);
        ind_reg_read: out std_logic_vector(2 downto 0);
        ind_reg_next: out std_logic_vector(2 downto 0);
     
        instraction_out: out std_logic_vector(7 downto 0);
        Operation: out std_logic_vector(1 downto 0)     
    );
    end component;
    
    component CH_OP is 
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
     end component;
     
     component  ALU is
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
    end component;
    
    component  MWS is
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
    end component;
    
    component  REG_STACK is
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
    end component;
    
    component DIV_TEN is
    Port (
        clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC   
    );
end component;
      
    signal C_pipe_s:std_logic;  
       
    signal addr_ram_r_st1_s :  std_logic_vector(15 downto 0);
    signal addr_ram_n_st1_s :  std_logic_vector(15 downto 0);
    signal ind_reg_r_st1_s :  std_logic_vector(2 downto 0);
    signal ind_reg_n_st1_s :  std_logic_vector(2 downto 0);
    signal inc_top_s: std_logic;
    signal instraction_out_st1_s: std_logic_vector(7 downto 0);
    signal operation_out_st1_s: std_logic_vector(1 downto 0);
    
    signal regs_f_st2_s: std_logic_vector(31 downto 0);
    signal regs_s_st2_s: std_logic_vector(31 downto 0);
    signal addr_ram_st2_s :  std_logic_vector(15 downto 0);
    signal ind_reg_st2_s :  std_logic_vector(2 downto 0);
    signal instraction_out_st2_s: std_logic_vector(7 downto 0):="00000000";
    signal A_s: std_logic_vector(31 downto 0);
    signal B_s: std_logic_vector(31 downto 0);
    signal operation_out_st2_s: std_logic_vector(1 downto 0);
    
    signal  inc_top_back_alu_s: std_logic;
    signal  inc_top_back_chop_s: std_logic;       
    
    signal addr_ram_st3_s :  std_logic_vector(15 downto 0);
    signal ind_reg_st3_s :  std_logic_vector(2 downto 0);
    signal instraction_out_st3_s: std_logic_vector(7 downto 0);
    signal result_st3_s:std_logic_vector(31 downto 0);
    
    signal addr_ram_st4_s :  std_logic_vector(15 downto 0);
    signal ind_reg_st4_s :  std_logic_vector(2 downto 0);
    signal result_st4_s:std_logic_vector(31 downto 0);
    signal w_en_reg_s:std_logic;
    signal w_en_ram_s:std_logic;
    
    signal addr_ram_back_2_s:std_logic_vector(15 downto 0);
    signal ind_reg_back_2_s:std_logic_vector(2 downto 0);
    signal inc_top_back_mem:std_logic;
    signal res_back_2_s:std_logic_vector(31 downto 0);
    
    signal addr_reg_wr_s1:std_logic;
    signal addr_reg_wr_s_back1:std_logic;
    signal addr_reg_wr_s_back2:std_logic;
begin
    div_c: DIV_TEN port map(C_alu,C_pipe_s);
    st_1: DECODER port map (C_pipe_s,instraction,addr_ram_r_st1_s,addr_ram_n_st1_s,ind_reg_r_st1_s,ind_reg_n_st1_s,instraction_out_st1_s,operation_out_st1_s);
    st_2: CH_OP port map (C_pipe_s,instraction_out_st1_s,operation_out_st1_s,data_ram_in,regs_f_st2_s,regs_s_st2_s,
                            result_st3_s,res_back_2_s,inc_top_back_alu_s,inc_top_back_mem,inc_top_back_chop_s,addr_ram_st3_s,ind_reg_st3_s,
                          addr_ram_back_2_s,ind_reg_back_2_s,addr_ram_r_st1_s,addr_ram_n_st1_s,ind_reg_r_st1_s,ind_reg_n_st1_s,addr_ram_st2_s,ind_reg_st2_s,addr_reg_wr_s1,addr_reg_wr_s_back1,addr_reg_wr_s_back2,instraction_out_st2_s,A_s,B_s,
                          operation_out_st2_s);
    st_3: ALU port map (A_s,B_s,operation_out_st2_s,C_alu,C_pipe_s,instraction_out_st2_s,instraction_out_st3_s,addr_ram_st2_s,
                        ind_reg_st2_s,addr_ram_st3_s,ind_reg_st3_s,inc_top_back_chop_s,inc_top_back_alu_s,addr_reg_wr_s1,addr_reg_wr_s_back1,result_st3_s);
    st_4: MWS port map (C_pipe_s,result_st3_s,instraction_out_st3_s,addr_ram_st3_s,ind_reg_st3_s,addr_ram_back_2_s,ind_reg_back_2_s,
                        inc_top_back_alu_s,inc_top_back_mem,addr_ram_st4_s,ind_reg_st4_s,
                        result_st4_s,w_en_reg_s,w_en_ram_s,addr_reg_wr_s_back1,addr_reg_wr_s_back2,res_back_2_s);
    regs: REG_STACK port map(C_pipe_s,result_st4_s,ind_reg_st4_s,w_en_reg_s,inc_top_back_alu_s,inc_top_back_chop_s,inc_top_back_alu_s,ind_reg_r_st1_s,regs_f_st2_s,regs_s_st2_s);
    addr_ram_in<=addr_ram_r_st1_s;
    data_ram_out<=result_st4_s;
    addr_ram_out<=addr_ram_st4_s;
    w_en_ram<=w_en_ram_s;
    
    C_pipe<=C_pipe_s;
end Behavioral;