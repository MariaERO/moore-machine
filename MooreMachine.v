module MooreMachine (W, clk, reset, z);

input [0:1] W;
input clk, reset;
output reg [0:3] z;
reg [0:3] y, Y;  // y: estado atual, Y: próx estado
parameter A=4'b0000, B=4'b0001, C=4'b0010, D=4'b0011, E=4'b0100, F=4'b0101, G=4'b0110, H=4'b0111, I=4'b1000, J=4'b1001;

always @ (y or W) // entrada
begin
	case (y)
		A: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = I;
			else if (W==2'b10) Y = B;
			else Y = J;
		B: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = A;
			else if (W==2'b10) Y = C;
			else Y = J;
		C: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = B;
			else if (W==2'b10) Y = D;
			else Y = J;
		D: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = C;
			else if (W==2'b10) Y = E;
			else Y = J;
		E: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = D;
			else if (W==2'b10) Y = F;
			else Y = J;
		F: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = E;
			else if (W==2'b10) Y = G;
			else Y = J;
		G: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = F;
			else if (W==2'b10) Y = H;
			else Y = J;
		H: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = G;
			else if (W==2'b10) Y = I;
			else Y = J;
		I: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = H;
			else if (W==2'b10) Y = A;
			else Y = J;
		J: if (W==2'b00) Y = y;
			else if (W==2'b01) Y = A;
			else if (W==2'b10) Y = A;
			else Y = J;
		default Y = 4'bxxxx;
	endcase
end

always @ (posedge clk or posedge reset) // memória
begin
	if (reset==1) y <= A;
	else y <= Y;
end

always @ (*) // saída
begin
	case (y)
		A: z = 4'b0010;
		B: z = 4'b1000;
		C: z = 4'b0101;
		D: z = 4'b1001;
		E: z = 4'b0111;
		F: z = 4'b0110;
		G: z = 4'b0111;
		H: z = 4'b0110;
		I: z = 4'b0001;
		J: z = 4'b1111;
	endcase
end

endmodule
