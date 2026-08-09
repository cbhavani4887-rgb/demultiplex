# 1-to-4 Demultiplexer Using Verilog

## Description

This project implements a **1-to-4 Demultiplexer (DEMUX)** using Verilog HDL.

A demultiplexer is a combinational circuit that takes **one input** and routes it to **one of multiple outputs** based on the select lines.

This design has:

* 1 data input
* 2 select inputs
* 4 outputs

## Files

```text
demux/
├── demux_1to4.v
├── demux_1to4_tb.v
└── README.md
```

## Block Diagram

```text
                  ┌──────────────┐
       DIN ──────►│              │──── Y0
                  │              │──── Y1
       SEL[1:0] ─►│  1-to-4      │──── Y2
                  │  DEMUX       │──── Y3
                  └──────────────┘
```

## Inputs and Outputs

| Signal |  Width | Description           |
| ------ | -----: | --------------------- |
| `din`  |  1 bit | Data input            |
| `sel`  | 2 bits | Select input          |
| `y`    | 4 bits | Demultiplexer outputs |

## Truth Table

| DIN | SEL | Y3 | Y2 | Y1 | Y0 |
| --: | :-: | -: | -: | -: | -: |
|   0 |  00 |  0 |  0 |  0 |  0 |
|   0 |  01 |  0 |  0 |  0 |  0 |
|   0 |  10 |  0 |  0 |  0 |  0 |
|   0 |  11 |  0 |  0 |  0 |  0 |
|   1 |  00 |  0 |  0 |  0 |  1 |
|   1 |  01 |  0 |  0 |  1 |  0 |
|   1 |  10 |  0 |  1 |  0 |  0 |
|   1 |  11 |  1 |  0 |  0 |  0 |

## Working

The two select lines determine which output receives the input data.

```text
SEL = 00  →  Y0 = DIN
SEL = 01  →  Y1 = DIN
SEL = 10  →  Y2 = DIN
SEL = 11  →  Y3 = DIN
```

All other outputs remain `0`.

For example, when:

```text
DIN = 1
SEL = 10
```

the output is:

```text
Y = 0100
```

## Simulation

Using Icarus Verilog:

```bash
iverilog -o demux_sim demux_1to4.v demux_1to4_tb.v
vvp demux_sim
```

## Expected Output

When `DIN = 1`:

```text
SEL     Y
-----------
00      0001
01      0010
10      0100
11      1000
```

When `DIN = 0`:

```text
SEL     Y
-----------
00      0000
01      0000
10      0000
11      0000
```

Expected simulation output:

```text
Time | DIN | SEL | Y
----------------------
10   |  1  | 00  | 0001
20   |  1  | 01  | 0010
30   |  1  | 10  | 0100
40   |  1  | 11  | 1000
50   |  0  | 00  | 0000
60   |  0  | 01  | 0000
70   |  0  | 10  | 0000
80   |  0  | 11  | 0000
```

## Result

The 1-to-4 demultiplexer successfully routes the single input `DIN` to the selected output according to `SEL`.

```text
DIN = 1
00 → 0001
01 → 0010
10 → 0100
11 → 1000
```

Thus, the design demonstrates the correct operation of a **1-to-4 DEMUX**.
