library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RES_REG_MUX_EXP is
    Port(
        A_exp : in  std_logic_vector(7 downto 0);
        B_exp : in  std_logic_vector(7 downto 0);
        Mul_exp: in  std_logic_vector(7 downto 0);
        cond: in std_logic_vector(1 downto 0);
        Operation: in std_logic_vector(1 downto 0);
        C:in std_logic;
        Cntr_sign:in std_logic_vector(4 downto 0);
        R_exp : out  std_logic_vector(7 downto 0)
    );
end RES_REG_MUX_EXP;

architecture Behavioral of RES_REG_MUX_EXP is
    signal R_exp_s: std_logic_vector(7 downto 0);
begin
    process(C)
    begin
    if rising_edge(C) then
        if (Cntr_sign="00110" or Cntr_sign="01011") then 
        if (operation="00") then
            if cond="01" then
                R_exp_s<=A_exp;
            else
                R_exp_s<=B_exp;
            end if;
        elsif (operation="10") then
            if cond="01" then
                R_exp_s<=A_exp;
            else
                R_exp_s<=B_exp;
            end if;
        else -- opertion=01
            R_exp_s<=Mul_exp;
        end if;
        end if;
    end if;
    end process;
    R_exp<=R_exp_s;
end Behavioral;
