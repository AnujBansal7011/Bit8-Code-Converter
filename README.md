# 8-Bit Multi-Code Converter Using Verilog HDL

## About the Project

This project is an **8-bit multi-code converter** that I designed using Verilog HDL and Xilinx Vivado.

The idea behind this project was to implement different digital code conversions within a single RTL module instead of designing separate modules for each operation.

The converter supports six operations involving Binary, Gray Code, BCD, and Excess-3. A 4-bit selection input determines which conversion is performed, and the result is displayed through a 12-bit output.

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

The design uses combinational logic and does not require a clock.

| Parameter  | Description |

| HDL        | Verilog |
| Top Module | `Bit_8` |
| Input      | `data_In[7:0]` |
| Selection  | `Select[3:0]` |
| Output     | `data_Out[11:0]` |
| Tool       | Xilinx Vivado |

## Simulation and Verification

After completing the RTL design, I verified its functionality using Vivado's behavioral simulation.

I manually applied different input values and selection signals using the **Force Constant** feature and compared the outputs with the expected conversion results.

In total, I tested **19 different cases**, and all 19 produced the expected outputs.

The simulation screenshots are included in this repository for reference.

These tests cover selected input cases rather than every possible input combination.

## Synthesis

Once the simulation results were verified, I synthesized the design using Xilinx Vivado.

The synthesis completed successfully, and I captured the synthesized schematic to understand how the conversion logic was represented after synthesis.

The schematic is also included in the repository.

## How to Run

1. Open Xilinx Vivado and create a new RTL project.
2. Add the Verilog source file.
3. Set `Bit_8` as the top module.
4. Run Behavioral Simulation.
5. Apply input values and selection signals using Force Constant.
6. Check the output against the expected conversion.
7. Run Synthesis to view the synthesized schematic.

## Limitations and Future Improvements

Currently, the design supports 8-bit binary inputs and uses a 12-bit output. The reverse BCD and Excess-3 conversion modes support two decimal digits (0–99).

I plan to improve this project by adding an automated Verilog testbench, extending the input width, and eventually implementing the design on FPGA hardware with a seven-segment display interface.

## What I Learned

Working on this project helped me better understand combinational RTL design, Verilog programming, digital code conversions, and the simulation-to-synthesis workflow in Vivado.

It also gave me hands-on experience in debugging conversion logic and checking results through simulation.

---

**Anuj Bansal**

VLSI | RTL Design | VLSI Enthusiast

[GitHub Profile](https://github.com/AnujBansal7011)
