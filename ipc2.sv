

module tb;
  event a1, a2;

  initial begin
    #10
    ->> a1;
    #20
    ->> a2;
  end

  initial begin
    @(a1);
    $display("[%0t] Event a1 triggered", $time);
    @(a2);
    $display("[%0t] Event a2 triggered", $time);
  end
endmodule
