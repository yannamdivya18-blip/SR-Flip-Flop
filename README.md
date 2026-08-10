# SR Flip-Flop using Verilog

## Description

This project implements a synchronous SR (Set-Reset) flip-flop using
Verilog HDL.

The flip-flop has:

- Clock input
- Reset input
- Set input (S)
- Reset input (R)
- Output Q
- Complementary output Qbar

The output changes on the positive edge of the clock.

## Truth Table

| S | R | Q(next) | Operation |
|---|---|---------|-----------|
| 0 | 0 | Q       | Hold      |
| 0 | 1 | 0       | Reset     |
| 1 | 0 | 1       | Set       |
| 1 | 1 | X       | Invalid   |

## Files

```text
sr_flipflop/
├── README.md
├── sr_flipflop.v
└── tb_sr_flipflop.v