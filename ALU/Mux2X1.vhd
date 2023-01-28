----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:01 06/06/2021 
-- Design Name: 
-- Module Name:    Mux2X1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2X1 is
port( in0:in std_logic;
      in1:in std_logic;
		sel:in std_logic;
		output: out std_logic
		);
end Mux2X1;

architecture Behavioral of Mux2X1 is
begin
output <= in0 when sel = '0' else
          in1 when sel = '1' else
			 'X';
end Behavioral;

