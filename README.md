# 8-Bit Multi-Code Converter using Verilog HDL

A combinational Verilog RTL design that supports six conversion modes and a bypass mode. Developed and simulated with **AMD Vivado 2025.2**.

## Interface

| Signal | Width | Description |
|---|---:|---|
| `data_In` | 8 bits | Encoded input |
| `Select` | 4 bits | Conversion selection |
| `data_Out` | 12 bits | Converted result |

## Operations

| Select | Operation | Supported valid input range |
|---|---|---|
| `0000` | Binary → Gray | 0–255 |
| `0001` | Gray → Binary | 8-bit Gray code |
| `0010` | Binary → Excess-3 | 0–255, 3 packed decimal digits |
| `0011` | Excess-3 → Binary | 00–99, two encoded digits |
| `0100` | Binary → BCD | 0–255, 3 packed decimal digits |
| `0101` | BCD → Binary | 00–99, two packed digits |
| Other | Bypass | Zero-extended 8-bit input |

**Important:** Reverse Excess-3 and BCD paths accept two digits only; input validity checking is not implemented. `data_Out` is a packed digit representation for BCD/Excess-3 modes, not an ordinary hexadecimal integer.

## Verification

**19 manually applied XSim test cases** (3 per conversion mode, plus bypass) matched the expected outputs. Inputs were applied manually through Vivado simulation forcing; **no automated testbench is included**. This is selected functional verification, not exhaustive coverage.

See [verification table](docs/VERIFICATION.md) and [simulation screenshots](docs/simulation/).

## Synthesis

RTL synthesis completed in Vivado for target **xc7k70tfbv676-1 (Kintex-7)**. See [synthesized schematic](docs/synthesis/synthesized_schematic.png). This is *not* a claim of FPGA board deployment or hardware validation.

## Project files

- [`rtl/Bit_8.v`](rtl/Bit_8.v): actual converter RTL from the archived Vivado project.
- [`vivado/CODE_CONV.xpr`](vivado/CODE_CONV.xpr): archived Vivado project configuration, included for reference. It may contain original machine-specific paths or references to additional source files not packaged here.
- [`docs/simulation/`](docs/simulation/): 19 manual simulation screenshots.
- [`docs/synthesis/`](docs/synthesis/): synthesized logic schematic.

## How to reproduce

1. Open Vivado 2025.2 and create a new RTL project.
2. Add `rtl/Bit_8.v` as a **Design Source** and set `Bit_8` as top.
3. Select a compatible target FPGA (original synthesis used `xc7k70tfbv676-1`).
4. Run Behavioral Simulation with `Bit_8` as simulation top; force `Select` and `data_In` for manual tests and observe `data_Out`.
5. Run Synthesis and open the synthesized schematic.

The archived `.xpr` is preserved for reference; a fresh project with `Bit_8.v` is the most portable way to reproduce the design.

## Future work

- Add a self-checking Verilog testbench and exhaustive input checks.
- Add invalid-BCD/Excess-3 input handling.
- Extend reverse conversion to three decimal digits using a wider encoded input.
- Compare alternative conversion architectures for timing and area.
