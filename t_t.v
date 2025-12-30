`timescale 1ns/1ps

module t_ff(input t, clk, rst, output reg q);
always @(posedge clk or posedge rst) begin
    if (rst)      q <= 1'b0;
    else if (t)  q <= ~q;
end
endmodule

module tb_t_ff;
reg t, clk, rst;
wire q;

t_ff dut(t, clk, rst, q);

always #5 clk = ~clk;

initial begin
    clk=0; rst=1; t=0;
    #10 rst=0;
    #10 t=1;
    #20 t=0;
    #10 t=1;
    #20 $finish;
end
endmodule



