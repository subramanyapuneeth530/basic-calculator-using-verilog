`timescale 1ns / 1ps

module design_file_tb;

    // Inputs
    reg signed [4:0] A, B;
    reg [1:0] a_s;

    // Output
    wire signed [8:0] result;

    // Instantiate the DUT
    design_file uut (
        .A(A),
        .B(B),
        .a_s(a_s),
        .result(result)
    );

    initial begin
        $display("Time\tA\tB\ta_s | Result (bin) | Result (dec)");
        $monitor("%g\t%d\t%d\t%02b   | %b | %0d", $time, A, B, a_s, result, result);

        // --- Addition Tests ---
        A = 5'sd8;   B = 5'sd7;    a_s = 2'b00; #10;  // 8 + 7 = 15
        A = -5'sd10; B = 5'sd5;    a_s = 2'b00; #10;  // -10 + 5 = -5

        // --- Subtraction Tests ---
        A = 5'sd10;  B = 5'sd3;    a_s = 2'b01; #10;  // 10 - 3 = 7
        A = -5'sd8;  B = -5'sd4;   a_s = 2'b01; #10;  // -8 - (-4) = -4

        // --- Multiplication Tests ---
        A = 5'sd4;   B = 5'sd3;    a_s = 2'b10; #10;  // 4 * 3 = 12
        A = -5'sd6;  B = 5'sd2;    a_s = 2'b10; #10;  // -6 * 2 = -12

        // --- Division Tests ---
        A = 5'sd8;  B = 5'sd4;    a_s = 2'b11; #10;  // 12 / 4 = 3
        A = -5'sd8;  B = 5'sd2;    a_s = 2'b11; #10;  // -8 / 2 = -4
        A = 5'sd7;   B = 5'sd0;    a_s = 2'b11; #10;  // 7 / 0 = 0 (safe)

        $finish;
    end

endmodule

