package Instr_Bits;

import StmtFSM :: *;
`include "opcodes.bsv"

Bit #(5) funct5_LOAD = 5'b_11110;
Bit #(5) funct5_STORE = 5'b_11111;

// Returns slice of the instruction
function Bit #(7) instr_opcode (Bit #(32) instr);
    return instr[6:0];
endfunction

function Bit #(3) isntr_func3 (Bit #(32) instr);
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


//=====[Funtions that returns true for a particular type of instruction]=======

// Checks if the instruction is a R type
function Bool is_OP(Bit #(32) instr);
   return(instr_opcode(instr) == `OP);
endfunction
// Checks if the instruction is a I type
function Bool is_OP_IMM(Bit #(32) instr);
   return(instr_opcode(instr) == `OP_IMM);
endfunction
// Checks if the instruction is a store instruction
function Bool is_OP_S(Bit #(32) instr);
   return(instr_opcode(instr) == `OP_STORE);
endfunction

// Checks if the instruction is a branching instruction(B-Type)
function Bool is_legal_BRANCH (Bit #(32) instr);
   /*Checks if the provided function is a branch instruction*/ 
   let funct3 = isntr_func3(instr);
   return ((instr_opcode(instr) == `OP_BRANCH)
            && (funct3 != 3'b010) 
            && (funct3 != 3'b011));
endfunction

//Test module
(*synthesize*)
module mkTop (Empty); 
   mkAutoFSM (
      seq
         action
         Bit #(32) instr_R = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_011_0011};
         Bit #(32) instr_IMM = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_110_0011};
         Bit #(32) instr_S = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_110_0011};

         $display ("instr_R %08h => %0d", instr_R, is_OP(instr_R));
         $display ("instr_IMM %08h => %0d", instr_IMM, is_OP_IMM(instr_IMM));
         $display ("instr_S %08h => %0d", instr_S, is_OP_S(instr_S));
         endaction
      endseq);
endmodule

endpackage
