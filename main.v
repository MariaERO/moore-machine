module main (w, clockFPGA, RES, segment_display, mooreOut);

input [1:0] w;
input clockFPGA;
input RES;
output wire [6:0] segment_display;
wire div_output;
output [3:0] mooreOut;
wire [3:0] moore_output;

divisor div (
	.CLK(clockFPGA),
	.S(div_output)
);

MooreMachine mm (
	.W (w),
	.clk(div_output),
	.reset(RES),
	.z(moore_output)
);

assign mooreOut = moore_output;

decoder dec (
	.A (moore_output[3]),
	.B (moore_output[2]),
	.C (moore_output[1]),
	.D (moore_output[0]),
	.segmentos (segment_display)
);

endmodule