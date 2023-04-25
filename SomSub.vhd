---somador/subtrator Avaliação 02; Com Display.
library IEEE;
use IEEE.STD_logic_1164.all;
use IEEE.STD_logic_unsigned.all;
use IEEE.STD_logic_arith.all;

entity SomSub is
port ( 
      numero: in std_logic_vector(3 downto 0);
		salvar1, salvar2, sinal, calcular: in std_logic;
		resultado : buffer std_logic_vector(3 downto 0);
		SEG : out STD_LOGIC_VECTOR(6 downto 0));
 end SomSub;
 
architecture equipamento of SomSub is 
   signal numero1, numero2:std_logic_vector(3 downto 0);
begin


   process(salvar1)
	   begin
		   if  (salvar1 ='1') then
		        numero1 <= numero;
		end if;
	end process;
	
	process(salvar2)
	   begin
		   if  (salvar2 ='1') then
		        numero2 <= numero;
		end if;
	end process;
	
	process(calcular)
	     begin
		     if (calcular =  '1') then 
			      if (sinal ='0') then  
					    resultado <= numero1 + numero2;
						 else
					    resultado <= numero1 - numero2;
					        end if;
			           end if;
	end process;

   process (resultado)
	   begin 
		    case resultado  is 
			     when  "0001" =>
				     SEG <=  "1111001";
				  when  "0010" =>
				     SEG <=  "0100100";
				  when  "0011" =>
				     SEG <=  "0110000";
				  when  "0100" =>
				     SEG <=  "0011001";
				  when  "0101" =>
				     SEG <=  "0010010";
				  when  "0110" =>
				     SEG <=  "0000010";
				  when  "0111" =>
				     SEG <=  "1111000";
				  when  "1000" =>
				     SEG <=  "0000000";                                                                                                                                                                                           
				  when  "1001" =>
				     SEG <=  "0010000";
				  when  "1010" =>
				     SEG <=  "0010000";
				  when  "1011" =>
				     SEG <=  "0000011";
				  when  "1100" => 
				     SEG <=  "1000110";
				  when  "1101" =>
				     SEG <=  "1000010";
				  when  "1110" =>
				     SEG <=  "0110000";
				  when  "1111" =>
				     SEG <=  "0111000";
				  when others => SEG<= "0000001";
		end case;
		end process;
end equipamento;