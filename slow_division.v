module slow_division (
  input clk,
  input rst,
  input signed [15:0] dividend,
  input signed [15:0] divisor,
  output signed [15:0] quotient,
  output signed [15:0] remainder
);

  reg signed [15:0] quotient_reg;
  reg signed [15:0] remainder_reg;
  reg [3:0] count;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      quotient_reg <= 0;
      remainder_reg <= 0;
      count <= 0;
    end else begin
      if (count < 16) begin
        remainder_reg <= remainder_reg << 1;
        remainder_reg[0] <= dividend[15];
        if (remainder_reg >= 0) begin
          remainder_reg <= remainder_reg - divisor;
          quotient_reg[count] <= 1;
        end else begin
          quotient_reg[count] <= 0;
        end
        count <= count + 1;
      end
    end
  end

  assign quotient = quotient_reg;
  assign remainder = remainder_reg;

endmodule
