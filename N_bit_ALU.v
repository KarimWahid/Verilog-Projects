
module ALU(A,B,SEL,SUM,CarryOut);
parameter N = 8;
input   [N-1:0] A,B;		// Ports declaration
input   [3:0] SEL;
output  [N-1:0] SUM;
output  CarryOut;

reg [N:0] Result;
wire ALU_CARRY;	

assign SUM = Result[N-1:0];
assign ALU_CARRY = Result[N];
assign CarryOut = ALU_CARRY;

always @(*)
begin
	case(SEL)
        	4'b0000: Result = A + B ;  // Addition
           
        	4'b0001: Result = A - B ; // Subtraction
           
        	4'b0010: Result = A * B; // Multiplication
          
       	        4'b0011: Result = A/B; // Division
          
       	        4'b0100: Result = A<<1; // Logical shift left
         
	        4'b0101: Result = A>>1; // Logical shift right
           
         	4'b0110: Result = {{A,A}<<1}; // Rotate left
           
         	4'b0111: Result = {{A,A}>>1}; // Rotate right
           
          	4'b1000: Result = A & B; //  Logical and 
          
          	4'b1001: Result = A | B; //  Logical or
          
          	4'b1010: Result = A ^ B; //  Logical xor 
           
          	4'b1011: Result = ~(A | B); //  Logical nor
           
          	4'b1100: Result = ~(A & B); // Logical nand 
          
          	4'b1101: Result = ~(A ^ B); // Logical xnor
           
          	4'b1110: Result = (A>B)?8'd1:8'd0; // Greater comparison
           
          	4'b1111: Result = (A==B)?8'd1:8'd0 ;// Equal comparison   
            
          	default: Result = A + B; 
        endcase
end
endmodule
