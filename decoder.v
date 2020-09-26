module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);

input [15:0] INST;

output [2:0] BS;
output [5:0] OFF;
output		 HALT;
output [2:0] DR;
output [2:0] SA;
output [2:0] SB;
output [5:0] IMM;
output 		 MB;
output [2:0] FS;
output		 MD;
output		 LD;
output		 MW;

reg [2:0] DR;
reg [2:0] SA;
reg [2:0] SB;
reg [5:0] IMM;
reg 		 MB;
reg [2:0] FS;
reg		 MD;
reg		 LD;
reg		 MW;
reg 		 HALT;
reg [2:0] BS;
reg [5:0] OFF;

always @ (*) begin 
	if (INST[15:12] == 4'b0000) begin// NOP
		if (INST[2:0] == 3'b001) begin
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			HALT = 1'b1;
			BS = 3'b100;
			OFF = 6'd0;
		end
		else begin
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end
	end
	else if (INST[15] == 1'b1) begin
		if (INST[15:12] == 4'b1111) begin// R to R, all funct
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = INST[2:0];
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end
		else if (INST[15:12] == 4'b1000) begin// BEQ**
			DR = 3'b000;
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b0;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b000;
			OFF = INST[5:0];
		end
		else if (INST[15:12] == 4'b1001) begin// BNE**
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = INST[2:0];
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b001;
			OFF = INST[5:0];
		end
		else if (INST[15:12] == 4'b1010) begin// BGEZ**
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = INST[2:0];
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b010;
			OFF = INST[5:0];
		end
		else begin// BLTZ**
			DR = INST[5:3];
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = 6'd0;
			MB = 1'b0;
			FS = INST[2:0];
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b011;
			OFF = INST[5:0];
		end
	end
	else begin// R to IMM
		if (INST[15:12] == 4'b0010) begin//      LB
			DR = INST[8:6];
			SA = INST[11:9];
			SB = 3'd0;
			IMM = INST[5:0];
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b1;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end
		else if (INST[15:12] == 4'b0100) begin// SB
			DR = 3'b000;
			SA = INST[11:9];
			SB = INST[8:6];
			IMM = INST[5:0];
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b1;
			LD = 1'b0;
			MW = 1'b1;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end
		else if (INST[15:12] == 4'b0101) begin// ADDI
			DR = INST[8:6];
			SA = INST[11:9];
			SB = 3'd0;
			IMM = INST[5:0];
			MB = 1'b1;
			FS = 3'b000;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end 
		else if (INST[15:12] == 4'b0110) begin// ANDI
			DR = INST[8:6];
			SA = INST[11:9];
			SB = 3'd0;
			IMM = INST[5:0];
			MB = 1'b1;
			FS = 3'b101;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end
		else begin// 4'b0111						  	  ORI
			DR = INST[8:6];
			SA = INST[11:9];
			SB = 3'd0;
			IMM = INST[5:0];
			MB = 1'b1;
			FS = 3'b110;
			MD = 1'b0;
			LD = 1'b1;
			MW = 1'b0;
			HALT = 1'b0;
			BS = 3'b100;
			OFF = 6'd0;
		end
	end	


end
	

endmodule
