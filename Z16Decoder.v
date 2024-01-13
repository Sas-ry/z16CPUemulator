module Z16Decoder(
  // 命令入力
  input wire  [15:0] i_instr,
  // オペコード出力
  output wire [3:0]  o_opecode,
  // RDアドレス出力
  output wire [3:0]  o_rd_addr,
  // RS1アドレス出力
  output wire [3:0]  o_rs1_addr,
  // 即値出力
  output wire [15:0] o_imm,
  // レジスタ書き込み有効化信号
  output wire        o_rd_wen,
  // メモリ書き込み有効化信号
  output wire        o_mem_wen,
  // ALU演算制御信号
  output wire [3:0]  o_alu_ctrl
);

  assign o_opecode  = i_instr[3:0];
  assign o_rd_addr  = i_instr[7:4];
  assign o_rs1_addr = i_instr[11:8];
  assign o_imm      = get_imm(i_instr);
  assign o_rd_wen   = get_rd_wen(i_instr);
  assign o_mem_wen  = get_mem_wen(i_instr);
  assign o_alu_ctrl = get_alu_ctrl(i_instr);

  // 符号拡張
  function [15:0] get_imm;
    input [15:0] i_instr;
  begin
    case(i_instr[3:0])
      4'hA    : get_imm = {{12{i_instr[15]}}, i_instr[15:12] };
      default : get_imm = 16'h0000;
    endcase
  end
  endfunction

  // レジスタ書き込み有効化信号取得
  function get_rd_wen;
    input [15:0] i_instr;
  begin
    if(4'hA == i_instr[3:0]) begin
      get_rd_wen = 1'b1;
    end else begin
      get_rd_wen = 1'b0;
    end
  end
  endfunction

  // メモリ書き込み有効化信号取得
  function get_mem_wen;
    input [15:0] i_instr;
  begin
    if(4'hA == i_instr[3:0]) begin
      get_mem_wen = 1'b0;
    end else begin
      get_mem_wen = 1'b0;
    end
  end
  endfunction

  // ALU演算制御信号取得
  function get_alu_ctrl;
    input [15:0] i_instr;
  begin
    if(4'hA == i_instr[3:0]) begin
      get_alu_ctrl = 4'h0;
    end else begin
      get_alu_ctrl = 4'h0;
    end
  end
  endfunction

endmodule