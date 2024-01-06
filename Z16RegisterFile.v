module Z16RegisterFile(
  // クロック
  input wire i_clk,

  // RS1アドレス
  input wire [3:0] i_rs1_addr,
  // RS1読み出しデータ
  output wire [15:0] o_rs1_data,

  // RS2アドレス
  input wire [3:0] i_rs2_addr,
  // RS2読み出しデータ
  output wire [15:0] o_rs2_data,

  // RDアドレス
  input wire [3:0] i_rd_addr,
  // RD書き込み有効化
  input wire       i_rd_wen,
  // RD書き込みデータ
  input wire [15:0] i_rd_data

);

  // レジスタファイル本体
  reg [15:0] mem[15:0];

  // Read
  // アドレスが0なら0を出力
  assign o_rs1_data = (i_rs1_addr == 4'h0) ? 16'h0000 : mem[i_rs1_addr];
  assign o_rs2_data = (i_rs2_addr == 4'h0) ? 16'h0000 : mem[i_rs2_addr];

  // Write
  always @(posedge i_clk) begin
    if(i_rd_wen) begin
      mem[i_rd_addr] <= i_rd_data;
    end else begin
      mem[i_rd_addr] <= mem[i_rd_addr];
    end
  end

endmodule