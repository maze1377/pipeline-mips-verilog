module stallUnit(clk,rs,rt,opcode,IRD,IREX,IRMEM,regWB,WWBs,IRWB,stall);
input clk,WWBs;
input [5:0]opcode;
input [4:0]rs,rt,regWB;
input [31:0]IRD,IREX,IRMEM,IRWB;
output reg stall;
reg we1,we2,we3;
reg [4:0]ws1,ws2,ws3;
reg res,ret;
initial begin
stall=1'b1;
we1=1'b0;
we2=1'b0;
we3=1'b0;
res=1'b0;
ret=1'b0;
end

always @(posedge clk)begin
if(IRD != 32'b0)begin
case(opcode)
//Rtype
6'b0:begin
res=1'b1;
ret=1'b1;
end
6'b100011:begin//lw
res=1'b1;
ret=1'b0;
end
6'b101011:begin//sw
res=1'b1;
ret=1'b1;
end
6'b000010:begin//jump
res=1'b0;
ret=1'b0;
end
6'b100:begin//beq
res=1'b1;
ret=1'b1;
end
6'b101:begin//bne
res=1'b1;
ret=1'b1;
end
default begin//IType
res=1'b1;
ret=1'b0;
end
endcase
end
else begin
res=1'b0;
ret=1'b0;
end

//
if(IREX != 32'b0)begin
case(IREX[31:26])//we1,ws1
//Rtype:opcode 6bit and function 
6'b0:begin
we1=1'b1;
ws1=IREX[15:11];
end		 
6'b100011:begin//lw
we1=1'b1;
ws1=IREX[20:16];
end
6'b101011:begin//sw
we1=1'b0;
ws1=5'b0;
end
6'b000010:begin//jump
we1=1'b0;
ws1=5'b0;
end
6'b100:begin//beq
we1=1'b0;
ws1=5'b0;
end
6'b101:begin//bne
we1=1'b0;
ws1=5'b0;
end
default begin//IType
we1=1'b1;
ws1=IREX[20:16];
end
endcase
end
else begin
we1=1'b0;
end

//
if(IRMEM != 32'b0)begin
case(IRMEM[31:26])//we2,ws2
//Rtype:opcode 6bit and function 6bit
6'b0:begin
we2=1'b1;
ws2=IREX[15:11];
end
6'b100011:begin//lw
we2=1'b1;
ws2=IREX[20:16];
end
6'b101011:begin//sw
we2=1'b0;
ws2=5'b0;
end
6'b000010:begin//jump
we2=1'b0;
ws2=5'b0;
end
6'b100:begin//beq
we2=1'b0;
ws2=5'b0;
end
6'b101:begin//bne
we2=1'b0;
ws2=5'b0;
end
default begin//IType
we2=1'b1;
ws2=IREX[20:16];
end
endcase
end
else begin
we2=1'b0;
end

//
if(IRWB != 32'b0)begin
we3=WWBs;
ws3=regWB;
end
else begin
we3=1'b0;
end
stall=~((((rs==ws1)&we1) + ((rs==ws2)&we2) + ((rs==ws3)&we3))&res + (((rt==ws1)&we1) + ((rt==ws2)&we2) + ((rt==ws3)&we3))&ret);

end
endmodule
