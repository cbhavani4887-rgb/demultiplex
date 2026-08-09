`timescale 1ns/1ps

module demux_1to4_tb;

    reg       din;
    reg [1:0] sel;
    wire [3:0] y;

    demux_1to4 dut (
        .din(din),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("Time | DIN | SEL | Y");
        $display("----------------------");

        // DIN = 1, select each output
        din = 1;

        sel = 2'b00;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        sel = 2'b01;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        sel = 2'b10;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        sel = 2'b11;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        // DIN = 0
        din = 0;

        sel = 2'b00;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        sel = 2'b01;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        sel = 2'b10;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        sel = 2'b11;
        #10;
        $display("%0t   |  %b  | %b  | %b", $time, din, sel, y);

        $finish;
    end

endmodule