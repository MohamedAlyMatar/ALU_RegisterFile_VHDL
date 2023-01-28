----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:43 06/06/2021 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FullAdder is
port(
     A,B,cin: in std_logic;
     output,cout: out std_logic
	  );
end FullAdder;

architecture Behavioral of FullAdder is
signal tmp: std_logic_vector(1 downto 0);

begin
tmp <= ('0' & A) + ('0' & B) + ('0' & cin);
output <= tmp(0);
cout   <= tmp(1);
end Behavioral;

