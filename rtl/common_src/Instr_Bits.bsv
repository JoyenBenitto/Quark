package Instr_Bits;

import StmtFSM :: *;
`include "opcodes.bsv"

Bit #(5) funct5_LOAD = 5'b_11110;
Bit #(5) funct5_STORE = 5'b_11111;

// Returns slice of the instruction
function Bit #(7) instr_opcode (Bit #(32) instr);
    return instr[6:0];
endfunction

function Bit #(3) instr_funct3 (Bit #(32) instr);
    return instr[14:12];
endfunction

function Bit #(7) instr_funct7 (Bit #(32) instr);
    return instr [31:25];
 endfunction

// Sources and destination return functions
function Bit #(5) instr_rs1 (Bit #(32) instr);
   return instr [19:15];
endfunction

function Bit #(5) instr_rs2 (Bit #(32) instr);
   return instr [24:20];
endfunction
   
function Bit #(5) instr_rd (Bit #(32) instr);
   return instr [11:7];
endfunction

//==========================[Extracting Immediates]============================
function Bit#(12) instr_imm_I (Bit #(32) instr);
   return instr[31:20];
endfunction

function Bit#(12) instr_imm_S (Bit #(32) instr);
   Bit #(7) offset_11_5 = instr[31:25];
   Bit #(5) offset_4_0 = instr[11:7];
   return {offset_11_5, offset_4_0};
endfunction

function Bit#(13) instr_imm_B (Bit #(32) instr);
   Bit #(1) offset_11 = instr[7];
   Bit #(1) offset_12 = instr[31];
   Bit #(4) offset_4_1 = instr[11:8];
   Bit #(6) offset_10_5 = instr[30:25];
   return {offset_12, offset_11, offset_10_5, offset_4_1, 1'b0};
endfunction

function Bit #(20) instr_imm_U (Bit #(32) instr);
   return instr [31:12];
endfunction

function Bit #(21) instr_imm_J (Bit #(32) instr);
   // instr [31:12] = imm[20|10:1|11|19:12]
   Bit #(1)  imm_20    = instr [31];
   Bit #(10) imm_10_1  = instr [30:21];
   Bit #(1)  imm_11    = instr [20];
   Bit #(8)  imm_19_12 = instr [19:12];

   return { imm_20, imm_19_12, imm_11, imm_10_1, 1'b0 };
endfunction


//=====[Funtions that returns true for a particular type of instruction]=======

// Checks if the instruction is a branching instruction(B-Type)
function Bool is_legal_BRANCH (Bit #(32) instr);
   /*Checks if the provided function is a branch instruction*/ 
   let funct3 = instr_funct3(instr);
   return ((instr_opcode(instr) == `OP_BRANCH)
            && (funct3 != 3'b010) 
            && (funct3 != 3'b011));
endfunction

// Check is the instruction is a store instruction
function Bool is_legal_STORE (Bit #(32) instr);
   let funct3 = instr_funct3(instr);
   return ((instr_opcode(instr) == `OP_STORE)
            && ((funct3 == `FUNCT3_SB)
              ||(funct3 == `FUNCT3_SH)
              ||(funct3 == `FUNCT3_SW)));
endfunction

//Check if the intruction is a LUI
function Bool is_legal_LUI (Bit #(32) instr);
   return (instr_opcode (instr) == `OP_LUI);
endfunction

//Check if the instruction is a AUIPC
function Bool is_legal_AUIPC (Bit #(32) instr);
   return (instr_opcode (instr) == `OP_AUIPC);
endfunction

//Check if the instruction is a JALR
function Bool is_legal_JALR (Bit #(32) instr);
   return (instr_opcode (instr) == `OP_JALR);
endfunction

function Bool is_legal_LOAD (Bit #(32) instr);
   let funct3 = instr_funct3 (instr);
   return ((instr_opcode (instr) == `OP_LOAD)
	   && ((funct3 == `FUNCT3_LB)
	      || (funct3 == `FUNCT3_LH)
	      || (funct3 == `FUNCT3_LW)
	      || (funct3 == `FUNCT3_LBU)
	      || (funct3 == `FUNCT3_LHU)));
endfunction

function Bool is_legal_OP (Bit #(32) instr);
   let funct3 = instr_funct3 (instr);
   let funct7 = instr_funct7 (instr);
   return ((instr_opcode (instr) == `OP)
	   && ((funct3 == `FUNCT3_ADD)  && (funct7 == `FUNCT7_ADD)
	      ||(funct3 == `FUNCT3_SUB)  && (funct7 == `FUNCT7_SUB)
	      ||(funct3 == `FUNCT3_SLL)  && (funct7 == `FUNCT7_SLL)
	      ||(funct3 == `FUNCT3_SLT)  && (funct7 == `FUNCT7_SLT)
	      ||(funct3 == `FUNCT3_SLTU) && (funct7 == `FUNCT7_SLTU)
	      ||(funct3 == `FUNCT3_XOR)  && (funct7 == `FUNCT7_XOR)
	      ||(funct3 == `FUNCT3_SRL)  && (funct7 == `FUNCT7_SRL)
	      ||(funct3 == `FUNCT3_SRA)  && (funct7 == `FUNCT7_SRA)
	      ||(funct3 == `FUNCT3_OR)   && (funct7 == `FUNCT7_OR)
	      ||(funct3 == `FUNCT3_AND)  && (funct7 == `FUNCT7_AND)));
endfunction

function Bool is_legal_OP_IMM (Bit #(32) instr);
   let funct3 = instr_funct3 (instr);
   let funct7 = instr_funct7 (instr);
   Bool is_legal_SLLI = (funct7 == 7'b000_0000);
   Bool is_legal_SRxI = ((funct7 == 7'b010_0000)||(funct7 == 7'b000_0000));
   return ((instr_opcode (instr) == `OP_IMM)
	   && ((funct3 == `FUNCT3_SLLI) ? is_legal_SLLI : 
      ((funct3 == `FUNCT3_SRxI) ? is_legal_SRxI : True)));
endfunction

//====================================Test module=============================
(*synthesize*)
module mkTop (Empty); 
   mkAutoFSM (
      seq
         action
         Bit #(32) instr_R = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_011_0011};
         Bit #(32) instr_IMM = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_001_0011};
         Bit #(32) instr_S = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_110_0011};

         $display ("instr_R %08h => %0d", instr_R, is_legal_OP(instr_R));
         //$display ("instr_IMM %08h => %0d", instr_IMM, is_OP_IMM(instr_IMM));
         $display ("instr_S %08h => %0d", instr_S, is_legal_STORE(instr_S));
         endaction
      endseq);
endmodule

endpackage
