module concatForJump(part1, part2,result);
input [3:0]part1;
input [27:0]part2;
output reg [31:0]result;
always @(part1,part2)begin
result={part1,part2};
end
endmodule
