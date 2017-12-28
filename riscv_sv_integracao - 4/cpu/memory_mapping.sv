
package memory_mapping;
	
	function integer clog2;
		input integer value;
    begin
        value = value - 1;
        for (clog2 = 0; value > 0; clog2 = clog2 + 1) begin
            value = value >> 1;
        end
    end
	endfunction
	

	parameter DATA_RAM_BEGIN	= 32'h0000_4000;
	parameter DATA_RAM_END		= 32'h0000_6000;	
	parameter INST_ROM_BEGIN 	= 32'h0000_2000;		//Bit width of address
	parameter INST_ROM_END 		= 32'h0000_4000;		//Bit width of a word
	
	parameter WORD_WIDTH 		= 32;		//Bit width of a word
			
	parameter INST_ROM_DEPTH	= (INST_ROM_END - INST_ROM_BEGIN)/4;

	parameter DATA_RAM_DEPTH 	= (DATA_RAM_END - DATA_RAM_BEGIN)/4; 	//In words
	parameter ADDR_WIDTH 		= clog2(DATA_RAM_DEPTH);		//Bit width of address
	

	//parameter INST_FILE 		= "C:/Workspace/TG/inst_gen/lw/rom.mif";
	localparam INST_FILE 		= "C:/Workspace/TG/isa-test/lw/rom.mif";
	
	//parameter DATA_FILE			= "C:/Workspace/TG/riscv_sv_integracao/work_sim/ram.mif";
	localparam DATA_FILE		= "C:/Workspace/TG/isa-test/lw/ram.mif";

	
	
endpackage