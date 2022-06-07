`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2022 04:19:42 PM
// Design Name: 
// Module Name: CLA_adder
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


module CLA_adder(input [3:0]a,input [3:0]b, input c_0,output [3:0]sum, output c_4);
    wire [3:0]p;
    wire [3:0]g;
    wire [3:1]c;
    assign p[0]=(a[0]^b[0]),
        p[1]=(a[1]^b[1]),
        p[2]=(a[2]^b[2]),
        p[3]=(a[3]^b[3]);
        
    assign g[0]=(a[0]&b[0]),
        g[1]=(a[1]&b[1]),
        g[2]=(a[2]&b[2]),
        g[3]=(a[3]&b[3]);
        
    assign c[1]=g[0] | p[0] & c_0;
    //assign c[2]=g[1] | p[1] & c[1];
    assign c[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&c_0);
    //assign c[3]=g[2] | p[2] & c[2];
    assign c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[1]&p[1]&p[0]&c_0);
    assign c_4= g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c_0);
    
    assign sum[0]=p[0]^c_0,
        sum[1]=p[1]^c[1],
        sum[2]=p[2]^c[2],
        sum[3]=p[3]^c[3];
        
endmodule

module dff(D,clk,Q);
  input [3:0] D; // Data input
  input clk; // clock input
  output reg [3:0] Q; // output Q
  always @(posedge clk)
  begin
    Q <= D;
  end
endmodule

module cla(a,b,clk,sum,cout);
  input [3:0] a,b;
  input clk;
  output [3:0] sum;
  output cout;

  wire [3:0] af,bf,sumf;
  wire coutf;

  dff d1(.D(a),.clk(clk),.Q(af));
  dff d2(.D(b),.clk(clk),.Q(bf));

  CLA_adder c1(.a(af),.b(bf),.c_0(0),.sum(sumf),.c_4(coutf));

  dff d3(.D(sumf),.clk(clk),.Q(sum));
  dff d4(.D(coutf),.clk(clk),.Q(cout));
endmodule