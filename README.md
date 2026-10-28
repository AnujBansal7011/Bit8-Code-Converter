# 8-Bit Multi-Code Converter Using Verilog HDL

## About the Project

This project is an **8-bit multi-code converter** that I designed using Verilog HDL and Xilinx Vivado.

The idea behind this project was to implement multiple digital code conversions within a single RTL module instead of designing separate modules for each operation.

The converter supports six operations involving Binary, Gray Code, BCD, and Excess-3. A 4-bit selection input determines the conversion, while the result is provided through a 12-bit output.

## Supported Conversions

| Select | Conversion |

| `0000` | Binary → Gray |
| `0001` | Gray → Binary |
| `0010` | Binary → Excess-3 |
| `0011` | Excess-3 → Binary |
| `0100` | Binary → BCD |
| `0101` | BCD → Binary |
| Others | Bypass |

## Design Details

| Parameter    | Description |

| Language     | Verilog HDL |
| Top Module   | `Bit_8` |
| Input        | `data_In[7:0]` |
| Selection    | `Select[3:0]` |
| Output       | `data_Out[11:0]` |
| Architecture | Combinational RTL |
| Tool         | Xilinx Vivado |

### Verilog Source Code

[View Complete Verilog Code — Bit_8.v](https://github.com/AnujBansal7011/Bit8-Code-Converter/blob/main/CODE_CONV/CODE_CONV.srcs/sources_1/new/Bit_8.v)

## Simulation and Verification

After completing the RTL design, I verified its functionality using Vivado XSim.

I manually applied different input values and selection signals using the **Force Constant** feature and compared the outputs with the expected results.

A total of **19 test cases** were checked, and all 19 produced the expected outputs.

**Verification Result: 19/19 Passed**

### Simulation Waveform

[View Simulation Result](https://github.com/AnujBansal7011/Bit8-Code-Converter/blob/main/Screenshots/Screenshot%202026-10-27%20195126.png)

![Simulation Waveform](https://github.com/AnujBansal7011/Bit8-Code-Converter/blob/main/Screenshots/Screenshot%202026-10-27%20195126.png?raw=true)

[View All Simulation Screenshots](https://github.com/AnujBansal7011/Bit8-Code-Converter/tree/main/Screenshots)

*The verification covers selected test cases rather than every possible input combination.*

## RTL Synthesis

After verifying the simulation results, I synthesized the design using Xilinx Vivado.

The synthesis completed successfully, and I captured the synthesized schematic to understand how the conversion logic was represented after synthesis.

### Synthesized Schematic

[View Full Synthesized Schematic](https://github.com/AnujBansal7011/Bit8-Code-Converter/blob/main/Screenshots/Screenshot%202026-10-27%20201423.png)

![Synthesized RTL Schematic](https://github.com/AnujBansal7011/Bit8-Code-Converter/blob/main/Screenshots/Screenshot%202026-10-27%20201423.png?raw=true)

## How to Run

1. Open Xilinx Vivado and create a new RTL project.
2. Add the Verilog source file `Bit_8.v`.
3. Set `Bit_8` as the top module.
4. Run Behavioral Simulation.
5. Apply input values using Force Constant.
6. Compare the output with the expected result.
7. Run Synthesis to inspect the synthesized schematic.

## Limitations and Future Improvements

The design supports 8-bit binary inputs, while reverse BCD and Excess-3 conversions are limited to two decimal digits (0–99).

I plan to improve this project by adding an automated testbench, extending the input width, and implementing the design on FPGA hardware with a seven-segment display interface.

## What I Learned

Working on this project helped me strengthen my understanding of combinational RTL design, Verilog programming, digital code conversions, and the simulation-to-synthesis workflow in Vivado.

It also gave me hands-on experience in debugging conversion logic and verifying results through simulation.

---

**Anuj Bansal**

VLSI | RTL Design | VLSI Enthusiast

[GitHub Profile](https://github.com/AnujBansal7011)
