`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2026 18:20:43
// Design Name: 
// Module Name: For_4_Bits
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module For_4_Bits(
    input [3:0] data_In,
   input [3:0] Select,
   output reg [7:0] data_Out
   );
   reg [3:0] Operation ;
   reg [3:0] Tens;
   reg [3:0] Ones;
   integer i ; 
    always@(*) begin
    case(Select)
    4'b0000 : Operation = 4'b0000; // BINARY TO GRAY
    4'b0001 : Operation = 4'b0001; // GRAY TO BINARY
    4'b0010 : Operation = 4'b0010; // BINARY TO EXCESS-3
    4'b0011 : Operation = 4'b0011; // EXCESS-3 TO BINARY
    4'b0100 : Operation = 4'b0100; // BINARY TO BCD
    4'b0101 : Operation = 4'b0101; // BCD TO BINARY
    default : Operation = 4'b1111 ; // BYPASS
    endcase
    end
    
    always@(*)begin
    
    data_Out = 12'b0;
    Tens = 4'b0;
    Ones = 4'b0;
    
    case(Operation)
    
    //BINARY TO GRAY
    
    4'b0000:begin
    
     data_Out[3:0] = data_In ^ (data_In >> 1);
     data_Out[7:4] = 4'b0000;
     
    end
    
    //GRAY TO BINARY
    
    4'b0001:begin
    
     data_Out[3] = data_In[3];
     
     for (i = 2; i >= 0; i = i - 1)
     data_Out[i] = data_Out[i + 1] ^ data_In[i];
     data_Out[7:4] = 4'b0000;
     
    end
    
    //BINARY TO EXCESS-3
    
    4'b0010:begin
    // Binary to BCD
    Tens = data_In / 10;
    Ones = data_In % 10;
    
    //BCD to excess-3
    data_Out[7:4] = Tens + 4'd3;
    data_Out[3:0] = Ones + 4'd3; 
    
    end
    
    //EXCESS-3 TO BINARY
    
    4'b0011:begin
 
    data_Out = data_In[3:0] - 4'd3;
    
    end
   
   // BINARY TO BCD
     
    4'b0100:begin
    
    data_Out[7:4] = data_In[3:0] / 10;
    data_Out[3:0] = data_In[3:0] % 10;
    
    end 
    
    // BCD TO BINARY
    
   4'b0101:begin
    
     data_Out[3:0] = data_In[3:0]; 
   
    end
   
    default : data_Out[7:0] = data_In;
    
    endcase
    
    end
        
endmodule
