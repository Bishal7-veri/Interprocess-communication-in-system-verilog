module tb;
  int i = 0;
  bit [7:0] data1, data2;
  event done;
  event next;
  
  task generator ();
    for(int i=0;i<10;i++)
      begin
        data1 = $urandom;
        $display ("data sent : %0d", data1);
        #10
        wait(next.triggered);
      end
    -> done;
  endtask
  
  task receiver();
    forever 
      begin
        #10
        data2 = data1;
        $display ("Data received : %0d", data2);
        -> next;
      end
  endtask
  
  task wait_event ();
    wait(done.triggered);
    $display ("Complete all sending stimuli");
    $finish();
  endtask
  
  initial
    begin
      fork
        generator();
        receiver();
        wait_event();
      join
    end
endmodule
