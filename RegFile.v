module RegFile (clk, readreg1, readreg2, writereg, writedata, RegWrite, readdata1, readdata2);
  input [4:0] readreg1, readreg2, writereg;
  input [31:0] writedata;
  input clk, RegWrite;
  output [31:0] readdata1, readdata2;

  reg [31:0] regfile [31:0];
  integer i;
  initial begin
      for (i=1; i<32; i=i+1)   
	begin
         regfile[i]=i*10;
	end
end
  always @(posedge clk)
  begin
	if (RegWrite) 
	 	regfile[writereg] <= writedata;
    regfile[0]=0;
  end

  assign readdata1 = regfile[readreg1];
  assign readdata2 = regfile[readreg2];
endmodule

