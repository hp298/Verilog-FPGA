module control(OP, CISEL, BSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); // add other inputs and outputs here

  // inputs (add others here)
  input  [2:0]  OP;
  
  // outputs (add others here)
  output        CISEL;
  output			 BSEL;
  output [1:0]  OSEL;
  output			 SHIFT_LA;
  output        SHIFT_LR;
  output			 LOGICAL_OP;

  // reg and internal variable definitions
  reg			 BSEL;
  reg [1:0]  OSEL;
  reg			 SHIFT_LA;
  reg        SHIFT_LR;
  reg			 LOGICAL_OP;
  wire 		 CISEL;
  
  // implement module here (add other control signals below)
  assign CISEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  
  always @ (*) begin
	if (OP == 3'd0) begin
		BSEL <= 1'b0;
		OSEL <= 2'b00;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b0;
		LOGICAL_OP <= 1'b0;
	end
	else if (OP == 3'd1) begin
		BSEL <= 1'b1;
		OSEL <= 2'b00;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b0;
		LOGICAL_OP <= 1'b0;
	end
	else if (OP == 3'd2) begin
		BSEL <= 1'b0;
		OSEL <= 2'b01;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b1;
		LOGICAL_OP <= 1'b0;
	end
	else if (OP == 3'd3) begin
		BSEL <= 1'b0;
		OSEL <= 2'b01;
		SHIFT_LA <= 1'b1;
		SHIFT_LR <= 1'b1;
		LOGICAL_OP <= 1'b0;
	end
	else if (OP == 3'd4) begin
		BSEL <= 1'b0;
		OSEL <= 2'b01;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b0;
		LOGICAL_OP <= 1'b0;
	end
	else if (OP == 3'd5) begin
		BSEL <= 1'b0;
		OSEL <= 2'b10;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b0;
		LOGICAL_OP <= 1'b1;
	end
	else if (OP == 3'd6) begin
		BSEL <= 1'b0;
		OSEL <= 2'b10;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b0;
		LOGICAL_OP <= 1'b0;
	end
	else begin
		BSEL <= 1'b0;
		OSEL <= 2'b00;
		SHIFT_LA <= 1'b0;
		SHIFT_LR <= 1'b0;
		LOGICAL_OP <= 1'b0;
	end
  end
  
endmodule