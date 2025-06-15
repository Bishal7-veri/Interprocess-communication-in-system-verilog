// fork join_none
// Starts all threads and immediately continues execution. Useful for background processes like monitors
module tb;
  initial begin
  fork
    #10 $display("Background thread done");
  join_none
  $display("Moved on without waiting");
end
endmodule
