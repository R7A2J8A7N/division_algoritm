module fast_division_tb;

  reg clk;
  reg rst;
  reg signed [15:0] dividend;
  reg signed [15:0] divisor;
  wire signed [15:0] quotient;
  wire signed [15:0] remainder;

  fast_division dut (
    .clk(clk),
    .rst(rst),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    dividend = 32;    // Example dividend value
    divisor = 5;      // Example divisor value
    #10 rst = 0;      // Deassert reset
    #100 $finish;     // Finish simulation after some time
  end

  always @(posedge clk) begin
    $display("Dividend: %d, Divisor: %d, Quotient: %d, Remainder: %d",
             dividend, divisor, quotient, remainder);
  end

endmodule
