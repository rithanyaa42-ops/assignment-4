`timescale 1ns/1ps

module sr_ff(input s, r, clk, rst, output reg q);
always @(posedge clk or posedge rst) begin
    if (rst)        q <= 1'b0;
    else if (s&r)  q <= q;      // invalid avoided
    else if (s)    q <= 1'b1;
    else if (r)    q <= 1'b0;
end
endmodule

module tb_sr_ff;
reg s, r, clk, rst;
wire q;

sr_ff dut(s, r, clk, rst, q);

always #5 clk = ~clk;

initial begin
    clk=0; rst=1; s=0; r=0;
    #10 rst=0;
    #10 s=1; r=0;
    #10 s=0; r=1;
    #10 s=0; r=0;
    #20 $finish;
end
endmodule



