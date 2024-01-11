module Z16CPU(
  input wire  i_clk,
  input wire  i_rst
);

  // プログラムカウンタ
  reg   [15:0] r_pc;

  wire  [15:0] w_instr;
  // RDアドレス信号線
  wire  [15:0] w_rd_addr;
  // RS1アドレス信号線
  wire  [15:0] w_rs1_addr;
  // 即値信号線
  wire  [15:0] w_imm;
  // レジスタ書き込み有効化信号線
  wire         w_rd_wen;
  // メモリ書き込み有効化信号線
  wire         w_mem_wen;
  // ALU演算制御信号線
  wire  [3:0]  w_alu_ctrl;

  always @(posedge i_clk) begin
    if(i_rst) begin
      // リセット
      r_pc <= 16'h0000;
    end else begin
      r_pc <= r_pc + 16'h0002;
    end
  end

  // 命令メモリ
  Z16InstrMem InstrMem(
    // プログラムカウンタを命令メモリに接続
    .i_addr   (r_pc),
    .o_instr  (w_instr)
  );

  // デコーダ
  Z16Decoder Decoder(
    .i_instr    (w_instr),
    .o_rd_addr  (w_rd_addr),
    .o_rs1_addr (w_rs1_addr),
    .o_imm      (w_imm),
    .o_rd_wen   (w_rd_wen),
    .o_mem_wen  (w_mem_wen),
    .o_alu_ctrl (w_alu_ctrl)
  );

  // データメモリ
  Z16DataMem DataMem(
    .i_clk  (),
    .i_addr (),
    .i_wen  (),
    .i_data (),
    .o_data ()
  );

endmodule