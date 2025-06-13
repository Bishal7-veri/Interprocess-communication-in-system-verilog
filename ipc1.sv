module tb;
  
  event a1,a2;
  
  // -> used to trigger the event 
  // @ waits for the event to be triggered
  
  initial
    begin
      $display ("Waits for the a1 event to be triggered");
      @(a1); // waits for the a1 triggered
      $display ("Event a1 received at time", $time);  
    end
  
  initial
    begin
      $display ("Waits for the a2 event to be triggered");
      @(a2); // waits for the a1 triggered
      $display ("Event a2 received at time", $time);  
    end
  
  initial
    begin
      #10 
      $display ("Triggering the event a1", $time);
      -> a1;
    end
  
  initial
    begin
      #20 
      $display ("Triggering the event a2", $time);
      -> a2;
    end
  
endmodule
