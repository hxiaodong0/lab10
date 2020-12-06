library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab10b is
	port(
		clk:      in    std_logic;
		ra1:      in    std_logic;
		rc1:      in    std_logic;
		rc3:      in    std_logic;
		rb:       inout std_logic_vector(7 downto 0);
		adc_data: in    std_logic_vector(9 downto 0);
		go:       out   std_logic
	);
end lab10b;

architecture arch of lab10b is
	component lab10b_gui
		port(
			clk:    in    std_logic;
			ra1:    in    std_logic;
			rc1:    in    std_logic;
			rc3:    in    std_logic;
			rb:     inout std_logic_vector(7 downto 0);
			next_o: out   std_logic;
			adda_o: out   std_logic_vector(12 downto 0);
			data_i: in    std_logic_vector(7 downto 0)
		);
	end component;
	component lab10_mem
		port(
			clk:    in  std_logic;
			adda_i: in  std_logic_vector(12 downto 0);
			data_o: out std_logic_vector(7 downto 0);
			wrtb_i: in  std_logic;
			addb_i: in  std_logic_vector(11 downto 0);
			datb_i: in  std_logic_vector(9 downto 0)
		);
	end component;
	signal nxt:  std_logic;
	signal adda: std_logic_vector(12 downto 0);
	signal data: std_logic_vector(7 downto 0);
	signal wrtb: std_logic;
	signal addb: std_logic_vector(11 downto 0);
	signal datb: std_logic_vector(9 downto 0);
begin
	------------------------------------------------------------------
	-- Module instantiations
	------------------------------------------------------------------
	gui: lab10b_gui port map(clk=>clk,ra1=>ra1,rc1=>rc1,rc3=>rc3,
		rb=>rb,next_o=>nxt,adda_o=>adda,data_i=>data);
	mem0: lab10_mem port map(clk=>clk,adda_i=>adda,data_o=>data,
		wrtb_i=>wrtb,addb_i=>addb,datb_i=>datb);

end arch;
