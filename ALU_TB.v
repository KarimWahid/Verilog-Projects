
module ALU_TB;
parameter N=8;
//Inputs
 reg[N-1:0] _A,_B;
 reg[3:0] _SEL;

//Outputs
 wire[N-1:0] _SUM;
 wire _CarryOut;

 integer i;
ALU UUT( .A(_A),
	    .B(_B),                  
            .SEL(_SEL),
            .SUM(_SUM), 
            .CarryOut(_CarryOut) );
    initial begin

      _A = 8'b00000101;
      _B = 8'b00000011;
      _SEL = 4'b0000;
      #10;
      for (i=0;i<=15;i=i+1)
      begin
      _SEL = _SEL  + 1'b1;
       #10;
      end
      $display ("sum is  %b"," Carryout is  %b",_SUM,_SEL);
    end

endmodule