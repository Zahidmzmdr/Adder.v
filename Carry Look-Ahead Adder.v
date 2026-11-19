// 4-bit Carry Look-Ahead Adder

module CLA_4bit (
    input  [3:0] A, B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

wire [3:0] P, G;
wire [4:0] C;

// Generate and Propagate
assign P = A ^ B;
assign G = A & B;

// Carry Look-Ahead Equations
assign C[0] = Cin;

assign C[1] = G[0] | (P[0] & C[0]);

assign C[2] = G[1] |
              (P[1] & G[0]) |
              (P[1] & P[0] & C[0]);

assign C[3] = G[2] |
              (P[2] & G[1]) |
              (P[2] & P[1] & G[0]) |
              (P[2] & P[1] & P[0] & C[0]);

assign C[4] = G[3] |
              (P[3] & G[2]) |
              (P[3] & P[2] & G[1]) |
              (P[3] & P[2] & P[1] & G[0]) |
              (P[3] & P[2] & P[1] & P[0] & C[0]);

// Sum and Carry Output
assign Sum = P ^ C[3:0];
assign Cout = C[4];

endmodule
