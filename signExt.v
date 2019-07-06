module signExt(inData,outData);
input[15:0] inData;
output[31:0] outData;
reg[31:0] outData;
always@(inData)
begin
outData[15:0]=inData[15:0];
outData[31:16]={16{inData[15]}};
end
endmodule
