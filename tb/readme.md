# 🧪 Testbench for `test1` ALU Module

This testbench verifies the functionality of the `test1` Verilog module, which performs signed arithmetic operations (addition, subtraction, multiplication, and safe division) on two 5-bit inputs.

---

## 📄 File: `test1_tb.v`

### ✅ Purpose

- Instantiates the ALU module (`test1`)
- Applies a series of test cases to the inputs `A`, `B`, and `a_s`
- Monitors the output `result` in both binary and decimal format
- Tests safe division handling (i.e., no crash on divide by zero)

---

## 🔢 Inputs & Outputs

| Signal   | Direction | Type              | Description                 |
|----------|-----------|-------------------|-----------------------------|
| `A`      | Input     | `reg signed [4:0]` | First operand               |
| `B`      | Input     | `reg signed [4:0]` | Second operand              |
| `a_s`    | Input     | `reg [1:0]`        | Operation selector          |
| `result` | Output    | `wire signed [8:0]`| Computed result of the ALU  |

---

## 🧪 Operations Tested

### ➕ Addition (`a_s = 2'b00`)
```verilog
A = 5'sd8;   B = 5'sd7;   // 8 + 7 = 15
A = -5'sd10; B = 5'sd5;   // -10 + 5 = -5
