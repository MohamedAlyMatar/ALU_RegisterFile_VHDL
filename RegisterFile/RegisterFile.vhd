library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
 PORT(
         read_sel1 : IN  std_logic_vector(4 downto 0);
         read_sel2 : IN  std_logic_vector(4 downto 0);
         write_sel : IN  std_logic_vector(4 downto 0);
         write_ena : IN  std_logic;
         clk : IN  std_logic;
         write_data : IN  std_logic_vector(31 downto 0);
         data1 : OUT  std_logic_vector(31 downto 0);
         data2 : OUT  std_logic_vector(31 downto 0)
        );
end RegisterFile;

architecture Behavioral of RegisterFile is
TYPE reg_file_type IS ARRAY (0 TO 31) OF std_logic_vector(31 DOWNTO 0);
		-- create 32 registers of 32 bits
		SIGNAL array_reg : reg_file_type := (
			x"00000000", --$zero
			x"11111111", --$at
			x"22222222", --$v0
			x"33333333", --$v1
			x"44444444", --$a0
			x"55555555", --$a1
			x"66666666", --$a2
			x"77777777", --$a3
			x"88888888", --$t0
			x"99999999", --$t1
			x"aaaaaaaa", --$t2
			x"bbbbbbbb", --$t3
			x"cccccccc", --$t4
			x"dddddddd", --$t5
			x"eeeeeeee", --$t6
			x"ffffffff", --$t7
			x"00000000", --$s0
			x"11111111", --$s1
			x"22222222", --$s2
			x"33333333", --$s3
			x"44444444", --$s4
			x"55555555", --$s5
			x"66666666", --$s6
			x"77777777", --$s7
			x"88888888", --$t8
			x"99999999", --$t9
			x"aaaaaaaa", --$k0
			x"bbbbbbbb", --$k1
			x"10008000", --$global pointer
			x"7FFFF1EC", --$stack pointer
			x"eeeeeeee", --$frame pointer
			x"ffffffff" --$return address
		);

begin

	process(clk, write_ena)
	begin
	if(rising_edge(clk)) then
		if(write_ena='1') then
			array_reg(to_integer(unsigned(write_sel))) <= write_data;
		end if;
	end if;
 end process;
 data1 <= array_reg(to_integer(unsigned(read_sel1)));
 data2 <= array_reg(to_integer(unsigned(read_sel2)));

end Behavioral;