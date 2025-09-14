library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CMP_EXP is
  Port (
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        RES : out  std_logic_vector(1 downto 0)
       );
end CMP_EXP;

architecture Behavioral of CMP_EXP is
signal res_s: std_logic_vector(1 downto 0);
signal A_exp_s: std_logic_vector(7 downto 0);
signal B_exp_s: std_logic_vector(7 downto 0);

begin
    A_exp_s<=A_exp;
    B_exp_s<=B_exp;
    process(C,Cntr_sign)
    begin
        if rising_edge(C) and Cntr_sign = "00101" then
            if (A_exp = B_exp) then
                 res_s<="00";
            elsif (A_exp > B_exp) then
                 res_s<= "01";
            elsif (A_exp < B_exp) then
                 res_s<= "10";   
            end if;
end if;
    end process;
    RES <= res_s;
end Behavioral;