# 🔧 Verilog Arithmetic Unit (ALU)

This project implements a simple **Arithmetic Logic Unit (ALU)** in Verilog that performs signed arithmetic operations—Addition, Subtraction, Multiplication, and Division—on two 5-bit signed inputs. It includes safe handling for division by zero and produces a 9-bit signed result.

## 🚀 Features

- ✅ **Signed 5-bit inputs** (`A`, `B`)
- ➕ Performs: Addition, Subtraction, Multiplication, Division
- ⚠️ Safe division: Checks for divide-by-zero
- 🔄 Combinational logic with `always @(*)`
- 🧮 9-bit signed output to handle overflow/extended results

## 📥 Inputs

| Signal | Width | Description              |
|--------|-------|--------------------------|
| `A`    | 5-bit signed | First operand      |
| `B`    | 5-bit signed | Second operand     |
| `a_s`  | 2-bit  | Operation selector:      |
|        |        | `00` = Add               |
|        |        | `01` = Subtract          |
|        |        | `10` = Multiply          |
|        |        | `11` = Divide (safe)     |

## 📤 Output

| Signal   | Width | Description             |
|----------|-------|-------------------------|
| `result` | 9-bit signed | Computed result |

## 🧪 Example Operation Table

| A   | B   | a_s | Operation   | Result |
|-----|-----|-----|-------------|--------|
|  5  |  3  | 00  | 5 + 3       | 8      |
|  5  | -2  | 01  | 5 - (-2)    | 7      |
| -4  |  3  | 10  | -4 × 3      | -12    |
| 10  |  0  | 11  | 10 / 0      | 0 (safe) |

## 📂 File Structure

