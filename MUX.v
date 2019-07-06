module mux2(select,a,b,y);
input select;
input[31:0] a,b;
output reg [31:0] y;
always@(select,a,b) begin

case(select)
	1'b0:y=a;
	1'b1:y=b;
endcase
end
endmodule

module mux2A(select,a,b,y);
input select;
input[4:0] a,b;
output reg [4:0] y;
always@(select,a,b) begin
 
case(select)
	1'b0:y=a;
	1'b1:y=b;
	endcase
end
endmodule