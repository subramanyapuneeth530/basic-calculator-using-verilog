# 📊 ALU Simulation & RTL Schematic Visualization

This document provides a detailed explanation of the **simulation waveform** and **RTL schematic** images generated for the Verilog ALU module. These visuals help verify correct functionality and illustrate how the circuit is synthesized internally.

---

## 🟢 Simulation Waveform (Testbench Output)

![Simulation Waveform](https://github.com/subramanyapuneeth530/basic-calculator-using-verilog/blob/main/Results/wavform.png)

### Description

This simulation captures the output of the ALU for a variety of test cases:

| Time (ns) | A    | B    | a_s | Operation   | Result |
|-----------|------|------|-----|-------------|--------|
| 0         | 8    | 7    | 00  | 8 + 7       | 15     |
| 10        | -10  | 5    | 00  | -10 + 5     | -5     |
| 20        | 10   | 3    | 01  | 10 - 3      | 7      |
| 30        | -8   | -4   | 01  | -8 - (-4)   | -4     |
| 40        | 4    | 3    | 10  | 4 × 3       | 12     |
| 50        | -6   | 2    | 10  | -6 × 2      | -12    |
| 60        | 8    | 4    | 11  | 8 ÷ 4       | 2      |
| 70        | -8   | 2    | 11  | -8 ÷ 2      | -4     |
| 80        | 7    | 0    | 11  | 7 ÷ 0       | 0 (safe) |

### Signals Tracked

- **A [4:0]**: First signed operand
- **B [4:0]**: Second signed operand
- **a_s [1:0]**: Operation selector (`00` = Add, `01` = Sub, `10` = Mul, `11` = Div)
- **result [8:0]**: Output result of selected operation

The waveform confirms correct operation across all arithmetic instructions and proper division-by-zero handling.

---

## 🔩 RTL Schematic View

![Schematic](https://github.com/subramanyapuneeth530/basic-calculator-using-verilog/blob/main/Results/schematic.png)

### Description

This RTL schematic is auto-generated by the synthesis tool (e.g., Vivado or Quartus) and shows the internal datapath created for the ALU logic. It visualizes:

### Key Components

| Block         | Description |
|---------------|-------------|
| `RTL_ADD`     | Performs `A + B` |
| `RTL_SUB`     | Performs `A - B` |
| `RTL_MULT`    | Performs `A * B` |
| `RTL_DIV`     | Performs `A / B` (includes divide-by-zero guard) |
| `RTL_MUX`     | Multiple MUXes used to select between operations |
| `RTL_EQ`, `RTL_NEQ` | Used to check for division by zero condition |
| `RTL_LT`      | Used in edge condition checking (not functionally necessary for this design, included for internal optimization) |

### Output Path

The `result` signal is driven through a **4-way multiplexer** that selects between:
- Sum (Addition)
- Difference (Subtraction)
- Product (Multiplication)
- Quotient or 0 (Division, conditionally selected)

The selection is driven by `a_s[1:0]`.

---

## 🧠 Interpretation

- ✅ This schematic confirms that all four operations are implemented and only one is active based on control logic.
- 🔀 The conditional logic for **safe division** is visible using `RTL_EQ` and `MUX` to handle divide-by-zero.
- 🧩 The waveform and schematic together validate both **functional correctness** and **synthesizable structure**.


