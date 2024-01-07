module Z16DataMemory(
  // クロック
  input wire i_clk,

  // アドレス
  input  wire [15:0] i_addr,
  // 書き込み制御
  input  wire        i_wen,
  // 書き込みデータ
  input  wire [15:0] i_data,
  // 読み出しデータ
  output wire [15:0] o_data
);
  reg [15:0] mem[1023:0];

  // Load
  assign o_data = mem[i_addr[10:1]];

  always @(posedge i_clk) begin
    // Store
    if(i_wen) begin
      mem[i_addr[10:1]] <= i_data;
    end
  end
endmodule