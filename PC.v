module PC(CLK, PC_in, RESET, PC_out, EN_L, PreEN_L);

input 			CLK;
input    [7:0] PC_in;
input 		   RESET;
input 			EN_L;

output 	[7:0] PC_out;
output 			PreEN_L;

reg 		[7:0] PC_out;
reg				PreEN_L;

always @ (posedge CLK) begin
	if (RESET) begin //RESET == 1
		PC_out = 8'b11111110;
	end
	else begin //RESET == 0
		PC_out = PC_in + 8'd2;
		PreEN_L = EN_L;
	end
end
endmodule