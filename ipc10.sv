

class first;
  rand int data;
  constraint data_c { data > 0; data < 10; }
endclass

class second;
  rand int data;
  constraint data_c { data > 10; data < 20; }
endclass

class main;
  first f;
  second s;
  int data;
  semaphore sem;

  function new();
    sem = new(1);
    f = new();
    s = new();
  endfunction

  task send_first();
    sem.get(1);
    for (int i = 0; i < 10; i++) begin
      void'(f.randomize());
      data = f.data;
      $display("The data of first %0d", f.data);
    end
    sem.put(1);
    $display("All the data of first is generated");
  endtask

  task send_second();
    sem.get(1);
    for (int i = 0; i < 10; i++) begin
      void'(s.randomize());
      data = s.data;
      $display("The data of second %0d", s.data);
    end
    sem.put(1);
    $display("All the data of second is generated");
  endtask
endclass

module tb;
  main m;

  initial begin
    m = new();
    fork
      m.send_first();
      m.send_second();
    join
    $finish;
  end
endmodule
