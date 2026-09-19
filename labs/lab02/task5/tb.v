module tb;

  reg [3:0] t_a;
  reg [3:0] t_b;
  reg       t_op;

  wire [3:0] t_result;

  reg [3:0] expected;

  integer errors;

  alu DUT (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
  );

  initial begin

    errors = 0;

    // Same operands, switch operation
    t_a = 4'd10;
    t_b = 4'd3;

    t_op = 0;
    #5;

    expected = t_a + t_b;

    if (t_result !== expected) begin
      $display("FAIL ADD: a=%d b=%d result=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    t_op = 1;
    #5;

    expected = t_a - t_b;

    if (t_result !== expected) begin
      $display("FAIL SUB: a=%d b=%d result=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    // Change operands, test add
    t_a = 4'd6;
    t_b = 4'd2;
    t_op = 0;
    #5;

    expected = t_a + t_b;

    if (t_result !== expected) begin
      $display("FAIL ADD: a=%d b=%d result=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    // Change operands, test subtract
    t_a = 4'd12;
    t_b = 4'd5;
    t_op = 1;
    #5;

    expected = t_a - t_b;

    if (t_result !== expected) begin
      $display("FAIL SUB: a=%d b=%d result=%d expected=%d",
               t_a, t_b, t_result, expected);
      errors = errors + 1;
    end

    if (errors == 0)
      $display("ALL TESTS PASSED");
    else
      $display("%d TESTS FAILED", errors);

    $finish;

  end

endmodule