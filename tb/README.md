# 🧪 Testbench for `design_file` ALU Module

This testbench verifies the functionality of the `design_file` Verilog module, which performs signed arithmetic operations (addition, subtraction, multiplication, and safe division) on two 5-bit inputs.

---

## 📄 File: `design_file_tb.v`

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
```

### ➕ Subtraction (`a_s = 2'b00`)
```verilog
A = 5'sd10;  B = 5'sd3;   // 10 - 3 = 7
A = -5'sd8;  B = -5'sd4;  // -8 - (-4) = -4
```

### ➕ Multiplication (`a_s = 2'b00`)
```verilog
A = 5'sd4;   B = 5'sd3;   // 4 * 3 = 12
A = -5'sd6;  B = 5'sd2;   // -6 * 2 = -12
```

### ➕ Division (`a_s = 2'b00`)
```verilog
A = 5'sd8;   B = 5'sd4;   // 8 / 4 = 2
A = -5'sd8;  B = 5'sd2;   // -8 / 2 = -4
A = 5'sd7;   B = 5'sd0;   // 7 / 0 = 0 (safe division)
```


![Screenshot 2025-06-02 003204](https://github.com/user-attachments/assets/05eb0858-9996-4141-8149-8bfdb39b7b09)

