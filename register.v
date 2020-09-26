module register(CLK, SA, SB, LD, DR, D_in, DataA, DataB, RESET);

input 			CLK;
input 	[2:0] SA;
input 	[2:0] SB;
input 			LD;
input 	[2:0]	DR;
input 	[7:0] D_in;
input 			RESET;

output 	[7:0] DataA;
output 	[7:0] DataB;

reg 		[7:0] DataA;
reg		[7:0] DataB;
reg 		[7:0] REG0;
reg		[7:0] REG1;
reg 		[7:0] REG2;
reg		[7:0] REG3;
reg 		[7:0] REG4;
reg		[7:0] REG5;
reg 		[7:0] REG6;
reg		[7:0] REG7;

always @ (posedge CLK) begin
	if (RESET) begin //RESET
		REG0 = 8'b0;
		REG1 = 8'b0;
		REG2 = 8'b0;
		REG3 = 8'b0;
		REG4 = 8'b0;
		REG5 = 8'b0;
		REG6 = 8'b0;
		REG7 = 8'b0;
	end
	else begin
		if (LD) begin // input data to reg DR
			if (DR == 3'b111) begin
				REG7 = D_in;
			end
			else if (DR == 3'b110) begin
				REG6 = D_in;
			end
			else if (DR == 3'b101) begin
				REG5 = D_in;
			end
			else if (DR == 3'b100) begin
				REG4 = D_in;
			end
			else if (DR == 3'b011) begin
				REG3 = D_in;
			end
			else if (DR == 3'b010) begin
				REG2 = D_in;
			end
			else if (DR == 3'b001) begin
				REG1 = D_in;
			end
			else begin // 3'b000
				REG0 = D_in;
			end
		end
	end
end

always @ (*) begin
	if (SA == 3'b111) begin
		DataA = REG7;
	end
	else if (SA == 3'b110) begin
		DataA = REG6;
	end
	else if (SA == 3'b101) begin
		DataA = REG5;
	end
	else if (SA == 3'b100) begin
		DataA = REG4;
	end
	else if (SA == 3'b011) begin
		DataA = REG3;
	end
	else if (SA == 3'b010) begin
		DataA = REG2;
	end
	else if (SA == 3'b001) begin
		DataA = REG1;
	end
	else begin // 3'b000
		DataA = REG0;
	end
end

always @ (*) begin
	if (SB == 3'b111) begin
		DataB = REG7;
	end
	else if (SB == 3'b110) begin
		DataB = REG6;
	end
	else if (SB == 3'b101) begin
		DataB = REG5;
	end
	else if (SB == 3'b100) begin
		DataB = REG4;
	end
	else if (SB == 3'b011) begin
		DataB = REG3;
	end
	else if (SB == 3'b010) begin
		DataB = REG2;
	end
	else if (SB == 3'b001) begin
		DataB = REG1;
	end
	else begin // 3'b000
		DataB = REG0;
	end
end
endmodule