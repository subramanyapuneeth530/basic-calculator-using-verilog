# 🔧 Verilog Arithmetic Logic Unit (ALU)

This repository contains a Verilog-based **Arithmetic Logic Unit (ALU)** that performs signed arithmetic operations — **Addition, Subtraction, Multiplication, and Division** — on two 5-bit signed inputs. The result is a 9-bit signed output, capable of capturing extended range values (e.g., from multiplication).

The project is modularly organized into:
- `src/` for the **design module**
- `tb/` for the **testbench**

---

## 🚀 Features

- ✅ **Signed arithmetic support**: Inputs A and B range from -16 to +15
- ➗ Performs: Add, Subtract, Multiply, Divide
- ⚠️ Safe divide-by-zero handling
- 💡 Synthesizable combinational logic using `always @(*)`
- 🧮 9-bit signed output for full result coverage

---

## 📥 Inputs

| Signal | Width        | Description               |
|--------|--------------|---------------------------|
| `A`    | 5-bit signed | First operand             |
| `B`    | 5-bit signed | Second operand            |
| `a_s`  | 2-bit        | Operation selector:       |
|        |              | `00` → Add                |
|        |              | `01` → Subtract           |
|        |              | `10` → Multiply           |
|        |              | `11` → Divide (safe)      |

## 📤 Output

| Signal   | Width         | Description            |
|----------|---------------|------------------------|
| `result` | 9-bit signed  | Computed result value  |

---

## 🧪 Example Operation Table

| A     | B     | a_s | Operation       | Result |
|-------|-------|-----|------------------|--------|
|   5   |   3   | 00  | 5 + 3            | 8      |
|   7   |  -2   | 01  | 7 - (-2)         | 9      |
|  -4   |   3   | 10  | -4 × 3           | -12    |
|  10   |   0   | 11  | 10 / 0           | 0 (safe)|

---

## 📂 Folder Structure

.
├── src/
│ ├── design_file.v # Main ALU design module (test1)
│ └── README.md # Design-specific documentation
│
├── tb/
│ ├── design_file_tb.v # Testbench for simulation
│ └── README.md # Testbench-specific documentation
│
└── README.md # Root project documentation (this file)
