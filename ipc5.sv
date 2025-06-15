// fork join_any
// Waits until any one thread finishes, then continues with the next statement. Remaining threads continue to run in the background.
module tb;
  initial begin
  fork
    #10 $display(" Thread 1 done ");
    #5  $display(" Thread 2 done ");
  join_any
    $display(" One thread is done, moving on ");
end
endmodule
