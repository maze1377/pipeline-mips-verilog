module TB;
reg clk;
initial begin
    clk=1'b0;
  end
always
begin
//write your test here
#3 clk=~clk;
end
Mypip sc1(clk);
endmodule
