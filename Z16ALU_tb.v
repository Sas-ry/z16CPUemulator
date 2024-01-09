module Z16ALU_tb;

  reg [15:0]  i_data_a;
  reg [15:0]  i_data_b;
  reg [3:0]   i_curl;
  wire [15:0] o_data;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, Z16ALU_tb);
  end

  Z16ALU ALU(
    .i_data_a   (i_data_a),
    .i_data_b   (i_data_b),
    .i_curl     (i_curl),
    .o_data     (o_data)
  );

  initial begin
    i_data_a  = 16'h0004;
    i_data_b  = 16'h0008;

    // ADD
    i_curl    = 4'h0;
    #2

    // SUB
    i_curl    = 4'h1;
    #2

    // MUL
    i_curl    = 4'h2;
    #2

    // DIV
    i_curl    = 4'h3;
    #2

    // OR
    i_curl    = 4'h4;
    #2
    $finish;
  end
endmodule