module TB;
reg clk;
initial begin
    clk=1'b0;
  end
always
begin
#3 clk=~clk;
end
Mypip sc1(clk);
endmodule
