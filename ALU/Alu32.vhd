----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:47:52 06/14/2021 
-- Design Name: 
-- Module Name:    Alu32 - Behavioral 
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
use work.ourComponents.all;

entity Alu32 is
PORT(
     data1: in STD_LOGIC_VECTOR(31 downto 0);
     data2: in STD_LOGIC_VECTOR(31 downto 0);
     aluop: in std_logic_vector (3 downto 0);
     cin : in std_logic;
	  res : out STD_LOGIC_VECTOR(31 downto 0);
	  cout: out std_logic;
     cflag : out STD_LOGIC;
     oflag : out STD_LOGIC;
     zflag : out STD_LOGIC
     );
end Alu32;

architecture Behavioral of Alu32 is
signal tmpope: std_logic_vector(1 downto 0);
signal tmpb: std_logic_vector(31 downto 0);
signal tmpa: std_logic_vector(31 downto 0);
signal tmpand: std_logic_vector(31 downto 0);
signal tmpor: std_logic_vector(31 downto 0);
signal c: std_logic_vector(32 downto 0);
signal tmp: std_logic_vector(31 downto 0);
signal tmpres: std_logic_vector(31 downto 0);
signal tmpo: std_logic_vector(31 downto 0);
signal tmpless: std_logic_vector(31 downto 0);

begin

tmpope <= aluop(1) & aluop(0);
c(0) <= cin;

      muxb: Mux2X1 port map(data2(0),not(data2(0)),aluop(2),tmpb(0));
		muxa: Mux2X1 port map(data1(0),not(data1(0)),aluop(3),tmpa(0));
		tmpand(0) <= tmpa(0) and tmpb(0);
		tmpor(0) <= tmpa(0) or tmpb(0);
      addsub: FullAdder port map(data1(0),tmpb(0),c(0),tmp(0),c(1));
      muxOpe: Mux4X1 port map(tmpand(0),tmpor(0),tmp(0),not(c(32)),tmpope,tmpres(0));
		res(0) <= tmpres(0);
		tmpo(0) <= tmpres(0);
  
	BITs: for i in 1 to 31 generate
      muxb: Mux2X1 port map(data2(i),not(data2(i)),aluop(2),tmpb(i));
		muxa: Mux2X1 port map(data1(i),not(data1(i)),aluop(3),tmpa(i));
		tmpand(i) <= tmpa(i) and tmpb(i);
		tmpor(i) <= tmpa(i) or tmpb(i);
      addsub: FullAdder port map(data1(i),tmpb(i),c(i),tmp(i),c(i+1));
      muxOpe: Mux4X1 port map(tmpand(i),tmpor(i),tmp(i),'0',tmpope,tmpres(i));
		res(i) <= tmpres(i);
		tmpo(i) <= tmpres(i);
		cout <= c(32);
   end generate;
	
	oflag <= c(32) xor c(31);
	cflag <= c(32);
   zflag <= '1' when tmpo = "00000000000000000000000000000000" else '0';
	
end Behavioral;

