// tb.v
// Self-checking testbench for comp2.

module tb;

  reg [1:0] t_A;
  reg [1:0] t_B;

  wire t_GT;
  wire t_LT;
  wire t_EQ;

  reg exp_GT;
  reg exp_LT;
  reg exp_EQ;

  integer i;
  integer j;
  integer errors;
  integer passed;

  comp2 DUT (
    .A(t_A),
    .B(t_B),
    .GT(t_GT),
    .LT(t_LT),
    .EQ(t_EQ)
  );

  initial begin

    errors = 0;
    passed = 0;

    for (i = 0; i < 4; i = i + 1) begin

      for (j = 0; j < 4; j = j + 1) begin

        t_A = i;
        t_B = j;

        #5;

        exp_GT = (t_A > t_B);
        exp_LT = (t_A < t_B);
        exp_EQ = (t_A == t_B);

        if ({t_GT, t_LT, t_EQ} !== {exp_GT, exp_LT, exp_EQ}) begin

          $display("FAIL at time %0t: A=%b B=%b got GT=%b LT=%b EQ=%b expected GT=%b LT=%b EQ=%b",
                   $time,
                   t_A,
                   t_B,
                   t_GT,
                   t_LT,
                   t_EQ,
                   exp_GT,
                   exp_LT,
                   exp_EQ);

          errors = errors + 1;

        end
        else begin

          passed = passed + 1;

        end

      end

    end

    $write("SUMMARY: ");

    $display("%0d passed out of 16, %0d errors",
             passed,
             errors);

    $finish;

  end

endmodule