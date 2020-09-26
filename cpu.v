module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  //reg [7:0] PC;
  //reg [7:0] NextPC;
  wire [7:0] PC;
  wire [7:0] NextPC;
  wire [15:0] Iin;
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire MB;
  wire [2:0] FS;
  wire MD;
  wire LD;
  wire MW;
  wire [7:0] IMMex;
  wire [7:0] DataA;
  wire [7:0] DataB;
  reg [7:0] DataC;
  wire [7:0] DataD;
  wire [7:0] Din;
  reg [7:0] B;
  wire [7:0] D;
  wire [15:0] I;
  wire [7:0] IOA;
  wire [7:0] IOB;
  wire [7:0] IOC;
  wire [7:0] IOD;
  wire [7:0] IOE;
  wire [7:0] IOF;
  wire [7:0] IOG;
  reg  [7:0] PCnow;
  wire [2:0] BS;
  wire [5:0] OFF;
  wire [7:0] OFFex;
  reg 		 MP;
  wire 		 HALT;
  wire 		 PreEN_L;
  
  // ADD YOUR CODE BELOW THIS LINE
  always @ (*) begin
		B = MB ? IMMex : DataB;
		DataC = MD ? Din : DataD;
		
		if (BS == 3'b000) begin //Z
			MP = ((DataA - DataB) == 8'd0);
		end
		else if (BS == 3'b001) begin //~Z
			MP = ~((DataA - DataB) == 8'd0);
		end
		else if (BS == 3'b010) begin //~N
			MP = ~(DataA < 8'd0);
		end
		else if (BS == 3'b011) begin //N
			MP = (DataA < 8'd0);
		end
		else begin // 0
			MP = 3'b000;
		end
		PCnow = (~(~EN_L & PreEN_L) & HALT) ? PC - 8'd2 : MP ? (PC + OFFex) : PC;
	end
  
	PC mac(.CLK(CLK),.PC_in(PCnow), .RESET(RESET), .PC_out(PC), .EN_L(EN_L), .PreEN_L(PreEN_L));

	decoder spy(.INST(Iin), .DR(DR), .SA(SA), .SB(SB), .IMM(IMM), .MB(MB), .FS(FS), .MD(MD), .LD(LD), .MW(MW), .BS(BS), .HALT(HALT), .OFF(OFF)); //Iin for I
	
	register cash(.CLK(CLK), .SA(SA), .SB(SB), .LD(LD), .DR(DR), .D_in(DataC), .DataA(DataA), .DataB(DataB), .RESET(RESET));
	
	extender it(.IMM_in(IMM), .IMM_out(IMMex));
	
	extender is(.IMM_in(OFF), .IMM_out(OFFex));
	
	alu math(.A(DataA), .B(B), .OP(FS), .Y(DataD),.C(C), .V(V), .N(N), .Z(Z));	
	
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
