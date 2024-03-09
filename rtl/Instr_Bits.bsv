package Instr_Bits;

import StmtFSM :: *;

function Bit #(7) instr_opcode (Bit #(32) instr);
    return instr[6:0];
endfunction

function Bit #(3) isntr_func3 (Bit #(32) instr);
    return instr[14:12];
endfunction

function Bit #(7) instr_funct7 (Bit #(32) instr);
    return instr [31:25];
 endfunction

// Sources and destination

 function Bit #(5) instr_rs1 (Bit #(32) instr);
    return instr [19:15];
 endfunction
 
 function Bit #(5) instr_rs2 (Bit #(32) instr);
    return instr [24:20];
 endfunction
    
 function Bit #(5) instr_rd (Bit #(32) instr);
    return instr [11:7];
 endfunction

Bit #(7) opcode_BRANCH = 7'b_110_0011;
 
function Bool is_legal_BRANCH (Bit #(32) instr);
    let funct3 = isntr_func3(instr);
    return ((instr_opcode (instr) == opcode_BRANCH)
            && (funct3 != 3'b010) 
            && (funct3 != 3'b011));
endfunction

(*synthesize*)
module mkTop (Empty); 
   
   mkAutoFSM (
      seq
         action
         Bit #(32) instr_BEQ = {7'h0, 5'h9, 5'h8, 3'b000, 5'h3, 7'b_110_0011};
         $display ("instr_BEQ %08h => %0d", instr_BEQ, is_legal_BRANCH (instr_BEQ));
         endaction
      endseq);
endmodule

endpackage
