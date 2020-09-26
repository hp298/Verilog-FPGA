module adder(A, B, CIn, Y, COut, V); // add all inputs and outputs inside parentheses

  // inputs
  input  [7:0]	A;
  input  [7:0]	B;
  input 		  	CIn;
  
  // outputs
  output [7:0]	Y;
  output 		COut;
  output			V;
  
  // reg and internal variable definitions
  reg C0, C1, C2, C3, C4, C5, C6;
  reg [7:0] Y;
  reg COut;
  reg V;
  
  
  // implement module here
  
  always @ (*) begin
  		
		Y[0] <= ((A[0] ^ B[0]) ^ CIn);
		C0 <= ((A[0] & B[0]) | ((A[0] ^ B[0]) & CIn));
		
		Y[1] <= ((A[1] ^ B[1]) ^ C0);
		C1 <= ((A[1] & B[1]) | ((A[1] ^ B[1]) & C0));
		
		Y[2] <= ((A[2] ^ B[2]) ^ C1);
		C2 <= ((A[2] & B[2]) | ((A[2] ^ B[2]) & C1));
		
		Y[3] <= ((A[3] ^ B[3]) ^ C2);
		C3 <= ((A[3] & B[3]) | ((A[3] ^ B[3]) & C2));
		
		Y[4] <= ((A[4] ^ B[4]) ^ C3);
		C4 <= ((A[4] & B[4]) | ((A[4] ^ B[4]) & C3));
		
		Y[5] <= ((A[5] ^ B[5]) ^ C4);
		C5 <= ((A[5] & B[5]) | ((A[5] ^ B[5]) & C4));
		
		Y[6] <= ((A[6] ^ B[6]) ^ C5);
		C6 <= ((A[6] & B[6]) | ((A[6] ^ B[6]) & C5));
		
		Y[7] <= ((A[7] ^ B[7]) ^ C6);
		COut <= ((A[7] & B[7]) | ((A[7] ^ B[7]) & C6));
		
		if (COut == C6) begin
			V <= 1'b0;
		end
		else begin
			V <= 1'b1;
		end	
  end
endmodule