module fast_division (
  input clk,
  input rst,
  input signed [15:0] dividend,
  input signed [15:0] divisor,
  output signed [15:0] quotient,
  output signed [15:0] remainder
);

  reg signed [15:0] quotient_reg;
  reg signed [15:0] remainder_reg;
  reg signed [15:0] divisor_reg;
  reg [3:0] count;
  reg [3:0] n;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      quotient_reg <= 0;
      remainder_reg <= 0;
      divisor_reg <= 0;
      count <= 0;
      n <= 0;
    end else begin
      if (count < 16) begin
        remainder_reg <= remainder_reg << 1;
        remainder_reg[0] <= dividend[15];
        divisor_reg <= (n <= 0) ? divisor : -divisor;
        if (remainder_reg >= 0) begin
          remainder_reg <= remainder_reg - divisor_reg;
          quotient_reg[count] <= 1;
          n <= n - 1;
        end else begin
          remainder_reg <= remainder_reg + divisor_reg;
          quotient_reg[count] <= 0;
          n <= n + 1;
        end
        count <= count + 1;
      end
    end
  end

  assign quotient = quotient_reg;
  assign remainder = remainder_reg;

endmodule
