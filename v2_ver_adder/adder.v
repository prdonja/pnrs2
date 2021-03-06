
`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module adder(
    input [7:0] A_in,
    input [7:0] B_in,
    input Sel_in,
    output [8:0] Rez_out
    );

reg [7:0] C;
reg [8:0] rez;

always @(A_in or B_in or Sel_in)
begin: process
	if(B_in[7] == 1)
		C <= ({B_in[7], (~ B_in[6:0])}) + 1;
	else
		C <= B_in;

	if(Sel_in == 0)
		rez <= {A_in[7], A_in} + {C[7], C};
	else
		rez <= {A_in[7], A_in} - {C[7], C};
		
end

endmodule
