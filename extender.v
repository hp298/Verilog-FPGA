module extender(IMM_in, IMM_out);

input [5:0] IMM_in;

output [7:0] IMM_out;

reg [7:0] IMM_out;

always @ (*) begin
	if (IMM_in[5]) begin //negative
		IMM_out[5:0] = IMM_in;
		IMM_out[7] = 1'b1;
		IMM_out[6] = 1'b1;
	end 
	else begin // postive
		IMM_out[5:0] = IMM_in;
		IMM_out[7] = 1'b0;
		IMM_out[6] = 1'b0;
	end
end
endmodule