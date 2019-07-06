module Controlstall(clk,op1,op2,op3,stall);
input [5:0]op1,op2,op3;
input clk;
output reg stall;
initial begin
stall=1'b1;
end
always @(posedge clk)begin


if(op1==6'b000100 | op1==6'b000101 | op1==6'b000010)begin// beq or bne or j
stall=1'b0;
end
if(op2==6'b000100 | op2==6'b000101 | op2==6'b000010)begin// beq or bne or j
stall=1'b0;
end
if(op3==6'b000100 | op3==6'b000101 | op3==6'b000010)begin// beq or bne or j
stall=1'b0;
end
else begin
stall=1'b1;
end

end


endmodule

module nopSet(clk,s1,s2,oldF,oldD,newF,newD);
input clk,s1,s2;
input [31:0] oldF,oldD;
output reg[31:0]newD,newF;

initial begin
end
always @(posedge clk)begin
if(s1==1'b0 && s2==1'b0)begin
newF=32'b0;
newD=32'b0;
end
else if(s1==1'b0 && s2==1'b1)begin
newD=32'b0;
end
else if(s1==1'b1 && s2==1'b0)begin
newF=32'b0;
end
else
begin
newD=oldD;
newF=oldF;
end
end
endmodule
