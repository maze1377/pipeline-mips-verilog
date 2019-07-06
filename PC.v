module PCRegWrite(clock,in,out,enable);
input [31:0] in;
input clock,enable;
output reg [31:0] out;

initial begin
 out=32'b0;
end
always @(in) begin
if(enable==1'b1)
    out=in;
   end
endmodule
