library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all;

entity Memory is 
	port (clk, wr: in std_logic; 
			Addr_in, D_in: in std_logic_vector(15 downto 0);
			D_out: out std_logic_vector(15 downto 0)); 
end entity; 

architecture behave of Memory is 
	type mem is array(31 downto 0) of std_logic_vector(15 downto 0);
--	signal mem_reg: registerFile:=(0 => x"3001", 1 => x"60aa", 2 => x"0038", 3 => x"03fa", 4 => x"0079", 5 => x"5f9f", 6 => x"13fb", 7 => x"2038",
--	8 => x"233a", 9 => x"2079", 10 => x"4f86",11 => x"4f9f", 12 => x"c9c2", 13 => x"abcd", 14 => x"8e02", 15 => x"1234", 16 => x"7caa", 17 => x"91c0",
--	128 => x"ffff", 129 => x"0002", 130 => x"0000", 131 => x"0000", 132 => x"0001", 133 => x"0000",
--	others => x"0000");
	signal mem_reg: mem :=(0 => x"1241", 1 => x"1001", 2 => x"1494", 3 => x"1904", 4 => x"10c0", 5 => x"0040", 
								  6 => x"1640", 7 => x"1d81", 8 => x"cc82", 9 => x"9f00", 10 => x"8e00", others => x"0000");
	
	
	begin
	
	  D_out <= mem_reg(to_integer(unsigned(Addr_in)));
	  
	  process(clk, mem_reg, Addr_in, wr)
	   begin

		if (wr = '1') then
		  if(falling_edge(clk)) then
			mem_reg(to_integer(unsigned(Addr_in))) <= D_in;
		  end if;
		end if;
	end process;	
end behave;