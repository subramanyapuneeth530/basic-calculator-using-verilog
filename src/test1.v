module test1(
    input signed [4:0] A,           // 5-bit signed input (-16 to +15)
    input signed [4:0] B,           // 5-bit signed input
    input [1:0] a_s,                // 00 = add, 01 = sub, 10 = mul, 11 = div
    output reg signed [8:0] result  // 9-bit signed result for full-range ops
);

always @(*) begin
    case (a_s)
        2'b00: result = A + B;                        // Addition
        2'b01: result = A - B;                        // Subtraction
        2'b10: result = A * B;                        // Multiplication
        2'b11: result = (B != 0) ? A / B : 9'sd0;     // Safe Division
        default: result = 9'sd0;
    endcase
end

endmodule
