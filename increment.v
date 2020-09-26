module increment (CLK, C_in, C_out);

input [7:0] C_in;
input CLK;

output [7:0] C_out;

reg [7:0] C_out;

always @ (posedge CLK)begin
		C_out = C_in + 8'd2;
end
endmodule

