`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2022 04:48:33 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    //reg c_0;
    reg clk;
    
    // Outputs
    wire [3:0] sum;
    wire cout;

// Instantiate the Unit Under Test (UUT)
    cla uut (
    .a(a),
    .b(b),
    .clk(clk),
    .sum(sum),
    .cout(cout)
    );
    initial begin
    // Initialize Inputs
        clk=0;
        a = 0;
        b = 0;
    // Wait 100 ns for global reset to finish
        #100;
        a = 5;
        b = 6;
    // Wait 100 ns for global reset to finish
        #100;
        a=13;
        b=1;
        
        #100;
        a=3;
        b=8;
end
always #10 clk = ~clk;
endmodule
