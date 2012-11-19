
--------------------------------------
-- NumberDisplay.vhdl
--
-- Author: James Brennan
--
-- Date: November 18, 2012
--
-- Revisions: (Date and Description)
--
-- Notes:
-------------------------------------

-- Import Libraries --
library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

-----------------
-- DiplayNumber
--
-- Notes:
-- 
-----------------
entity NumberDisplay is
	port( 
	    Clock: in std_logic;
	    Number: in std_logic_vector(3 downto 0); --BCD
			Segments: out std_logic_vector(6 downto 0)
	);
end NumberDisplay;

-----------------
-- Behaviour
--
-- Notes:
-- 
-----------------
architecture Behaviour of NumberDisplay is

begin
  process (Clock, Number)
    begin
      -- Every clock cycle
      if(Clock'event and Clock='1') then
        case Number is
          when "0000"=> Segments <="0000001";
          when "0001"=> Segments <="1001111";
          when "0010"=> Segments <="0010010";
          when "0011"=> Segments <="0000110";
          when "0100"=> Segments <="1001100";
          when "0101"=> Segments <="0100100";
          when "0110"=> Segments <="0100000";
          when "0111"=> Segments <="0001111";
          when "1000"=> Segments <="0000000";
          when "1001"=> Segments <="0000100";
          when others => Segments <="0000000";
        end case;
    end if;
  end process;
end Behaviour;

