module DMemBank(input memread, input memwrite, input [31:0] address, input [31:0] writedata, output reg [31:0] readdata);
 
  reg [31:0] mem_array [127:0];
  wire[6:0]finalAddress;
  assign finalAddress=address[8:0];
  integer i;
  initial 
  begin
      for (i=0; i<127; i=i+1)   
     mem_array[i]=i*10;
  end
 
  always@(memread, memwrite, address, mem_array[address], writedata)
  begin
    if(memread)begin
      readdata=mem_array[finalAddress];
    end

    if(memwrite)
    begin
      mem_array[finalAddress]= writedata;
    end

  end

endmodule

