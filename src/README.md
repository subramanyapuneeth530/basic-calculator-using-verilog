# Arithmetic Logic Unit (ALU) - `test1`

## Overview

The `test1` module is a simple **Arithmetic Logic Unit (ALU)** written in Verilog. It performs basic arithmetic operations — **addition, subtraction, multiplication, and division** — on two 5-bit signed input numbers. The operation to be performed is determined by a 2-bit selector signal.

This module is designed to handle:
- Signed inputs in the range of **-16 to +15**
- A **9-bit signed output**, which is wide enough to represent results of multiplication and division without overflow
- **Safe division**, avoiding divide-by-zero errors

---

## Module Ports

### Inputs

| Name | Width | Type    | Description |
|------|-------|---------|-------------|
| `A`  | 5     | signed  | First operand (range: -16 to +15) |
| `B`  | 5     | signed  | Second operand (range: -16 to +15) |
| `a_s`| 2     | unsigned| Operation select signal:<br>• `00`: Add<br>• `01`: Subtract<br>• `10`: Multiply<br>• `11`: Divide |

### Output

| Name    | Width | Type    | Description |
|---------|-------|---------|-------------|
| `result`| 9     | signed  | Result of the selected arithmetic operation |

---

## Functionality

The module uses an `always @(*)` block to continuously evaluate the result whenever any input (`A`, `B`, or `a_s`) changes. The `case` statement selects the appropriate operation based on the 2-bit `a_s` selector:

### Operation Select (`a_s`)

| `a_s` | Operation  | Expression   | Description |
|--------|------------|--------------|-------------|
| `00`   | Addition   | `A + B`      | Adds `A` and `B` |
| `01`   | Subtraction| `A - B`      | Subtracts `B` from `A` |
| `10`   | Multiply   | `A * B`      | Multiplies `A` and `B` |
| `11`   | Division   | `A / B`      | Divides `A` by `B`, with a check to prevent divide-by-zero |

If `B == 0` during division, the result is set to zero (`9'sd0`) to avoid undefined behavior.

---

## Example

Assume:
```verilog
A  = 5'sd10;   // decimal 10
B  = 5'sd2;    // decimal 2
a_s = 2'b11;   // division
```
Result:
```output
Output : A / B = 10 / 2 = 5
```
