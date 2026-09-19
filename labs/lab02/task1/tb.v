module tb;

reg t_I0, t_I1, t_S;
wire t_Y;

DUT U1 (
  .I0(t_I0),
  .I1(t_I1),
  .S(t_S),
  .Y(t_Y)
);

initial begin

  t_I0 = 0; t_I1 = 0; t_S = 0;
  #5;

  t_I0 = 0; t_I1 = 0; t_S = 1;
  #5;

  t_I0 = 0; t_I1 = 1; t_S = 0;
  #5;

  t_I0 = 0; t_I1 = 1; t_S = 1;
  #5;

  t_I0 = 1; t_I1 = 0; t_S = 0;
  #5;

  t_I0 = 1; t_I1 = 0; t_S = 1;
  #5;

  t_I0 = 1; t_I1 = 1; t_S = 0;
  #5;

  t_I0 = 1; t_I1 = 1; t_S = 1;
  #5;

  $finish;

end

endmodule