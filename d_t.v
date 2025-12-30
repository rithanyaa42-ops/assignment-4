`timescale 1ns/1ps

module d_ff(input d, clk, rst, output reg q);
always @(posedge clk or posedge rst) begin
    if (rst) q <= 1'b0;
    else     q <= d;
end
endmodule

module tb_d_ff;
reg d, clk, rst;
wire q;

d_ff dut(d, clk, rst, q);

always #5 clk = ~clk;

initial begin
    clk=0; rst=1; d=0;
    #10 rst=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #20 $finish;
end
endmodule



