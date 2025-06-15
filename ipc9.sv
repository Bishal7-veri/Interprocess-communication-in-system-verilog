

module tb;
  task first();
    #5
    $display ("Task 1 started at time , [%0t]", $time);
    #20
    $display ("Task 1 ended at time , [%0t]", $time);
  endtask
  task second();
    #2
    $display ("task 2 started at time , [%0t]", $time);
    #15
    $display ("Task 2 ended at time , [%0t]", $time);
  endtask
  
  initial
    begin
      fork 
        first();
        second();
      join_any
      $display ("task done moving forward");
    end
endmodule
