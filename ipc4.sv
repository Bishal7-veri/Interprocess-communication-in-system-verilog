// fork join
// Waits for all the parallel threads to complete before moving to the next statement
// this waits for all parallel statement to complete before moving to the next statement
module tb;
  initial
    begin
      fork
        $display ("Thread 1 started");
        #10
        $display ("Thread 1 done"); 
        $display ("Thread 2 started");
        #5
        $display ("Thread 2 done");
      join
      $display ("All threads completed");
    end
endmodule
