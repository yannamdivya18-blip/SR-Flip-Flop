`timescale 1ns/1ps

module tb_sr_flipflop;

    reg clk;
    reg reset;
    reg S;
    reg R;

    wire Q;
    wire Qbar;

    // Instantiate DUT
    sr_flipflop uut (
        .clk   (clk),
        .reset (reset),
        .S     (S),
        .R     (R),
        .Q     (Q),
        .Qbar  (Qbar)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Generate waveform
        $dumpfile("sr_flipflop.vcd");
        $dumpvars(0, tb_sr_flipflop);

        // Initialize
        clk   = 1'b0;
        reset = 1'b1;
        S     = 1'b0;
        R     = 1'b0;

        $display("Time\tReset\tS\tR\tQ\tQbar");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, reset, S, R, Q, Qbar);

        // Reset
        #10;
        reset = 1'b0;

        // Hold condition: S=0, R=0
        #10;
        S = 1'b0;
        R = 1'b0;

        // Set condition: S=1, R=0
        #10;
        S = 1'b1;
        R = 1'b0;

        // Hold
        #10;
        S = 1'b0;
        R = 1'b0;

        // Reset condition: S=0, R=1
        #10;
        S = 1'b0;
        R = 1'b1;

        // Hold
        #10;
        S = 1'b0;
        R = 1'b0;

        // Invalid condition: S=1, R=1
        #10;
        S = 1'b1;
        R = 1'b1;

        #10;

        $finish;
    end

endmodule