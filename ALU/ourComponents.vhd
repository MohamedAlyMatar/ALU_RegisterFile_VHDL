--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ourComponents is

component Mux2X1 is
port( in0:in std_logic;
      in1:in std_logic;
		sel:in std_logic;
		output: out std_logic
		);
end component;

component Mux4X1 is
port( in0:in std_logic;
      in1:in std_logic;
		in2:in std_logic;
		in3:in std_logic;
		sel:in std_logic_vector(1 downto 0);
		output: out std_logic
		);
end component;

component FullAdder is
port(
     A,B,cin: in std_logic;
     output,cout: out std_logic
	  );
end component;

end ourComponents;


package body ourComponents is
end ourComponents;
