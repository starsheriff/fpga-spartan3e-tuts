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
        desired_level : in STD_LOGIC_VECTOR(7 downto 0);
        stream_out : out STD_LOGIC;
        led_out : out STD_LOGIC
    );
end dac8;

architecture Behavioral of dac8 is
    signal sum : STD_LOGIC_VECTOR(8 downto 0);
begin
    -- the 9th bit of the counter is used as output stream
    stream_out <= sum(8);
    led_out <= sum(8);
    
    process(clk, sum)
    begin
        if rising_edge(clk) then
            sum <= ("0" & sum(7 downto 0)) + ("0" & desired_level);
        end if;
    end process;

end Behavioral;

