----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:14 04/22/2012 
-- Design Name: 
-- Module Name:    compteur - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur is
    Port ( CE : in  STD_LOGIC;
           H : in  STD_LOGIC;
           DIN : in  STD_LOGIC_VECTOR (3 downto 0);
           RESET : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           DIR : in  STD_LOGIC;
           DOUT : inout  STD_LOGIC_VECTOR (3 downto 0));
end compteur;

architecture Behavioral of compteur is

begin

process (H) 
begin
   if H='1' and H'event then
      if RESET='0' then 
         DOUT <= (others => '0');
      elsif CE='1' then
         if LOAD='1' then
            DOUT <= DIN;
         else 
            if DIR='1' then   
               DOUT <= DOUT + 1;
            else
               DOUT <= DOUT - 1;
            end if;
         end if;
      end if;
   end if;
end process;


end Behavioral;

