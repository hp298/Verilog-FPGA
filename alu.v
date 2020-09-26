module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;

  wire CISEL;
  wire BSEL;
  wire [1:0] OSEL;
  wire SHIFT_LA;
  wire SHIFT_LR;
  wire LOP;
  wire [7:0] LOPY;
  wire [7:0] SHIFTY;
  wire SHIFTC;
  wire CIn;
  wire [7:0] ADDY;
  wire COut;
  wire VOut;

  // ADD YOUR CODE BELOW THIS LINE
  control freak(.OP(OP),.CISEL(CISEL),.BSEL(BSEL),.OSEL(OSEL),.SHIFT_LA(SHIFT_LA),.SHIFT_LR(SHIFT_LR),.LOGICAL_OP(LOP));

  logical paradox(.A(A),.B(B),.OP(LOP),.Y(LOPY));  
  
  shifter iDontGiveAShift(.A(A),.LA(SHIFT_LA),.LR(SHIFT_LR),.Y(SHIFTY),.C(SHIFTC));
  
  adder add(.A(A),.B(BSEL ? ~B : B),.CIn(CISEL ? 1'b1 : 1'b0),.Y(ADDY),.COut(COut),.V(VOut));
  
	assign Y = OSEL[1] ? LOPY : (OSEL[0] ? SHIFTY : ADDY);
	assign V = OSEL[1] ? 1'b0 : (OSEL[0] ? 1'b0 : VOut);
   assign C = OSEL[1] ? 1'b0 : (OSEL[0] ? SHIFTC : COut);
	assign Z = (Y == 8'd0) ? 1'b1 : 1'b0;
	assign N = Y[7];
  
  endmodule
