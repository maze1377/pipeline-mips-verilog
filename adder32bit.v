module adder32bit(in1,in2,out);
input [31:0]in1;
input [31:0]in2;
output [31:0]out;
reg [31:0]out;
always@(in1,in2)begin
out=in1+in2;
end
endmodule
