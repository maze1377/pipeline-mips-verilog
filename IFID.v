 module IFID(clock,nextPC,instrWireID,nextPCID,instrWireIF,enable);
 input clock, enable;
 input [31:0] nextPC;
 input [31:0] instrWireIF;
 output [31:0] nextPCID, instrWireID;
 reg [31:0]  nextPCID,instrWireID;
always @(posedge clock)  begin 
if (enable) begin 
instrWireID <= instrWireIF;
nextPCID <= nextPC;
end 
 end
 endmodule
 