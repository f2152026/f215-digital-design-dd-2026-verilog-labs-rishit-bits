// tb.v
// Testbench for parameterized lookup table.

module tb;

  reg  [2:0] t_sel;
  wire [7:0] t_dout;

  integer i;
  integer errors;

  lut #(
    .WIDTH(8),
    .DEPTH(8)
  ) DUT (
    .sel(t_sel),
    .dout(t_dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin

    errors = 0;

    for (i = 0; i < 8; i = i + 1) begin

      t_sel = i;
      #5;

      if (t_dout !== i * i) begin
        $display("FAIL: sel=%d dout=%d expected=%d",
                 t_sel, t_dout, i * i);

        errors = errors + 1;
      end
      else begin
        $display("PASS: sel=%d dout=%d",
                 t_sel, t_dout);
      end

    end

    $display("Total errors = %d", errors);

    $finish;

  end

  initial
    $monitor($time, " sel=%b | dout=%d", t_sel, t_dout);

endmodule