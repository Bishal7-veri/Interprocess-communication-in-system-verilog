

module tb;

  bit [1:0] data1, data2;
  event data_ready;

  // Sender process
  initial begin
    for (int i = 0; i < 10; i++) begin
      #10;
      data1 = $urandom();
      $display("Sender: data1 sent at time [%0t], value = %0b", $time, data1);
      -> data_ready;  // Notify receiver
    end
  end

  // Receiver process
  initial begin
    for (int i = 0; i < 10; i++) begin
      @(data_ready);  // Wait for data to be ready
      data2 = data1;
      $display("Receiver: data2 received at time [%0t], value = %0b", $time, data2);
    end
  end

endmodule
