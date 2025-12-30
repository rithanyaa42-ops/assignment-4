`timescale 1ns/1ps

module rca_8bit(
    input  [7:0] a, b,
    input  cin,
    output [7:0] sum,
    output cout
);
assign {cout, sum} = a + b + cin;
endmodule

module tb_rca_8bit;
reg  [7:0] a, b;
reg  cin;
wire [7:0] sum;
wire cout;

rca_8bit dut(a, b, cin, sum, cout);

initial begin
    a=8'd10; b=8'd20; cin=0;
    #10 a=8'd50; b=8'd25;
    #10 a=8'd100; b=8'd55;
    #10 cin=1;
    #20 $finish;
end
endmodule



