`timescale 1ns/1ps

module jk_ff(input j, k, clk, rst, output reg q);
always @(posedge clk or posedge rst) begin
    if (rst)        q <= 1'b0;
    else if (~j & ~k) q <= q;
    else if (~j & k)  q <= 1'b0;
    else if (j & ~k)  q <= 1'b1;
    else              q <= ~q;
end
endmodule

module tb_jk_ff;
reg j, k, clk, rst;
wire q;

jk_ff dut(j, k, clk, rst, q);

always #5 clk = ~clk;

initial begin
    clk=0; rst=1; j=0; k=0;
    #10 rst=0;
    #10 j=1; k=0;
    #10 j=0; k=1;
    #10 j=1; k=1;
    #20 $finish;
end
endmodule



