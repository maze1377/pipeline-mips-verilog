module IMemBank(input memread, input [31:0] address, output reg [31:0] readdata);
 
  reg [31:0] mem_array [255:0];
  reg [31:0]temp;
  integer i;
  initial begin
    for (i=11; i<255; i=i+1)   
	begin
       	mem_array[i]=32'b0;
	end
  end
  always@(memread, address, mem_array[address])
  begin
    if(memread)begin
      temp=address>>2;
      readdata=mem_array[temp];
    end
    //////////////////////////////////////////////////////////////////////////////////////////////////////// test bench!
	//lvl 1
	/*mem_array[0]={6'b0,5'b10,5'b1,5'b11,5'b0,6'b100000};//add reg3,reg2,reg1 =30
	mem_array[1]={6'b0,5'b10,5'b1,5'b100,5'b0,6'b100010};//sub reg4,reg2,reg1 =10
	mem_array[2]={6'b0,5'b10,5'b1,5'b101,5'b0,6'b100101};//or reg5,reg2,reg1 =30
	mem_array[3]={6'b0,5'b10,5'b1,5'b110,5'b0,6'b100100};//and reg6,reg2,reg1 =0
	mem_array[4]={6'b0,5'b10,5'b1,5'b111,5'b0,6'b101010};//stl reg7,reg2,reg1 =0
	
	mem_array[5]={6'b001000,5'b10,5'b1000,16'b1010};//addi r8,r2,10 =30
	mem_array[6]={6'b001010,5'b10,5'b1001,16'b1010};//slti r9,r2,10 =0
	mem_array[7]={6'b001101,5'b10,5'b1010,16'b1010};//ori r10,r2,10 =30
	mem_array[8]={6'b001100,5'b10,5'b1011,16'b1010};//andi r11,r2,10 =0

	mem_array[9]={6'b101011,5'b10,5'b0,16'b1};//sw reg0,1(reg2) =mem[21]<=0
	mem_array[10]={6'b100011,5'b0,5'b1100,16'b0};//lw reg12,0(reg0) =reg[12]<=0
*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//lvl 2
	/*mem_array[0]={6'b0,5'b10,5'b1,5'b11,5'b0,6'b100000};//add reg3,reg2,reg1 =30
	mem_array[1]={6'b0,5'b11,5'b1,5'b100,5'b0,6'b100010};//sub reg4,reg3,reg1 =20
	mem_array[2]={6'b0,5'b100,5'b1,5'b101,5'b0,6'b100101};//or reg5,reg4,reg1 =30
	mem_array[3]={6'b0,5'b10,5'b1,5'b110,5'b0,6'b100100};//and reg6,reg2,reg1 =0
	mem_array[4]={6'b0,5'b10,5'b1,5'b111,5'b0,6'b101010};//stl reg7,reg2,reg1 =0
	
	mem_array[5]={6'b001000,5'b10,5'b1000,16'b1010};//addi r8,r2,10 =30
	mem_array[6]={6'b001010,5'b1000,5'b1001,16'b1000000};//slti r9,r8,32 =1
	mem_array[7]={6'b001101,5'b10,5'b1010,16'b1010};//ori r10,r2,10 =30
	mem_array[8]={6'b001100,5'b1001,5'b1011,16'b1010};//andi r11,r9,10 =0

	mem_array[9]={6'b101011,5'b1010,5'b1011,16'b1};//sw reg11,1(reg10) =mem[31]<=0
	mem_array[10]={6'b100011,5'b1010,5'b1100,16'b01};//lw reg12,1(reg10) =reg[12]<=0*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	//lvl 3
	// mem_array[0]={6'b0,5'b10,5'b1,5'b11,5'b0,6'b100000};//add reg3,reg2,reg1 =30
	// mem_array[1]={6'b0,5'b11,5'b1,5'b100,5'b0,6'b100010};//sub reg4,reg3,reg1 =20
	// mem_array[2]={6'b0,5'b100,5'b1,5'b101,5'b0,6'b100101};//or reg5,reg4,reg1 =30

	// mem_array[3]={6'b100,5'b100,5'b101,16'b10};//beq r4,r5,2ta

	// mem_array[4]={6'b0,5'b10,5'b1,5'b110,5'b0,6'b100100};//and reg6,reg2,reg1 =0

	// mem_array[5]={6'b101,5'b110,5'b101,16'b1000};//bne r6,r5,2ta

	// mem_array[6]={6'b0,5'b10,5'b1,5'b111,5'b0,6'b101010};//stl reg7,reg2,reg1 =0

	// mem_array[7]={6'b10,26'b100};//jump lable4 13 ya 14

	// mem_array[8]={6'b001000,5'b10,5'b1000,16'b1010};//addi r8,r2,10 =30
	// mem_array[9]={6'b001010,5'b1000,5'b1001,16'b1000000};//slti r9,r8,32 =1
	// mem_array[10]={6'b001101,5'b10,5'b1010,16'b1010};//ori r10,r2,10 =30
	// mem_array[11]={6'b001100,5'b1001,5'b1011,16'b1010};//andi r11,r9,10 =0

	// mem_array[12]={6'b101011,5'b1010,5'b1011,16'b1};//sw reg11,1(reg10) =mem[31]<=0
	// mem_array[13]={6'b100011,5'b1010,5'b1100,16'b01};//lw reg12,1(reg10) =reg[12]<=0


/*
	//r2=max , r3=min , r4=1 , r5=i , r6=adress , r7=current
	mem_array[0]={6'b001000,5'b0,5'b10,16'b1010};//addi r2,r0,10
	mem_array[1]={6'b001000,5'b0,5'b11,16'b1010};//addi r3,r0,10
	mem_array[2]={6'b001000,5'b0,5'b100,16'b1};//addi r4,r0,1
	mem_array[3]={6'b001000,5'b0,5'b101,16'b1};//addi r5,r0,1
	//loop:
	mem_array[4]={6'b0,5'b0,5'b00101,5'b00110,11'b0};//add r6,r0,r5
	mem_array[5]={6'b100011,5'b00110,5'b00111,16'b0};//lw r7,0(r6)
	mem_array[6]={6'b0,5'b10,5'b111,5'b01000,5'b0,6'b101010};//slt r8,r7,r2
	mem_array[7]={6'b100,5'b1000,5'b0,16'b10};//beq r8,r0,lable1
	mem_array[8]={6'b10,26'b1010};//jump lable2 adrese 9 ya 8
	//lable1
	mem_array[9]={6'b1000,5'b111,5'b10,16'b0};//addi r2,r7,0
	//lable2:
	mem_array[10]={6'b0,5'b11,5'b111,5'b1000,5'b0,6'b101010};//slt r8,r3,r7
	mem_array[11]={6'b100,5'b1000,5'b0,16'b10};//beq r8,r0,lable3
	mem_array[12]={6'b10,26'b1110};//jump lable4 13 ya 14
	//lable3:
	mem_array[13]={6'b1000,5'b111,5'b11,16'b0};//addi r3,r7,0
	//lable4
	mem_array[14]={6'b1000,5'b101,5'b101,16'b1};//addi r5,r5,1
	mem_array[15]={6'b1010,5'b100,5'b1001,16'b1011};//slti r9,r5,11
	mem_array[16]={6'b100,5'b1001,5'b100,16'b1111111111110100};//beq r9,r4,loop
*/
  end
endmodule

