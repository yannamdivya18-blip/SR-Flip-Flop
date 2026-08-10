`timescale 1ns/1ps

module sr_flipflop (
    input  wire clk,
    input  wire reset,
    input  wire S,
    input  wire R,
    output reg  Q,
    output wire Qbar
);

    assign Qbar = ~Q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else begin
            case ({S, R})
                2'b00: Q <= Q;       // Hold
                2'b01: Q <= 1'b0;   // Reset
                2'b10: Q <= 1'b1;   // Set
                2'b11: Q <= 1'bx;   // Invalid condition
            endcase
        end
    end

endmodule