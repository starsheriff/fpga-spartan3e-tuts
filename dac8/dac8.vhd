----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:47 10/02/2015 
-- Design Name: 
-- Module Name:    dac8 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dac8 is
    Port(
        clk : in STD_LOGIC;
        level : in STD_LOGIC_VECTOR(7 downto 0);
        stream_out : out STD_LOGIC
    );
end dac8;

architecture Behavioral of dac8 is
    signal ctr_9bit : STD_LOGIC_VECTOR(8 downto 0);
begin


end Behavioral;

