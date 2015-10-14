----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:01 10/14/2015 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
  Port(
    clk: in STD_LOGIC;
    switches: in STD_LOGIC_VECTOR(7 downto 0);
    LEDs: out STD_LOGIC_VECTOR(7 downto 0)
    );
end main;

architecture Behavioral of main is
  constant state_error : STD_LOGIC_VECTOR(3 downto 0) := "0000";
  constant state_start : STD_LOGIC_VECTOR(3 downto 0) := "0001";  
  constant state_one   : STD_LOGIC_VECTOR(3 downto 0) := "0011";
  constant state_two   : STD_LOGIC_VECTOR(3 downto 0) := "0111";
  constant state_tre   : STD_LOGIC_VECTOR(3 downto 0) := "1111";
  
  signal state : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  
begin

  LEDS(7 downto 0) <= state & "0000";
  
  process(clk, state)
  begin
    if rising_edge(clk) then
      case state is
        when state_start =>
          case switches is
            when "00000000" => state <= state_start;
            when "10000000" => state <= state_one;
            when others => state <= state_error;
          end case;
        when state_one =>
          case switches is
            when "10000000" => state <= state_one;
            when "11000000" => state <= state_two;
            when others => state <= state_error;
          end case;
        when state_two =>
          case switches is
            when "11000000" => state <= state_two;
            when "11100000" => state <= state_tre;
            when others => state <= state_error;
          end case;
        when state_tre =>
          case switches is
            when "11100000" => state <= state_tre;
            when "00000000" => state <= state_start;
            when others => state <= state_error;
          end case;
        when state_error =>
          case switches is
            when "00000000" => state <= state_start;
            when others => state <= state_error;
          end case;
        when others => state <= state_error;
      end case; 
    end if;
  end process;


end Behavioral;

