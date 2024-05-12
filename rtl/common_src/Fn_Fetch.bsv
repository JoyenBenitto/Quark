package Fn_Fetch;

import Instr_Stage :: *; 

typedef struct {
   Fetch_to_Decode to_D;
   Mem_Req  mem_req;
} Result_F
deriving (Bits, FShow);

function ActionValue #(Result_F) fn_Fetch (
        Bit #(XLEN)  pc,
		Bit #(XLEN)  predicted_pc,
		Epoch        epoch,
		Bit #(64)    inum,
		File         flog);

   actionvalue
      Result_F y = ?;
      // Info to next stage
      y.to_D = Fetch_to_Decode {pc:           pc,
				predicted_pc: predicted_pc,
				epoch:        epoch,
				inum:         inum};
      // Request to IMem
      y.mem_req = Mem_Req {req_type: funct5_LOAD,
			   size:     MEM_4B,
			   addr:     zeroExtend (pc),
			   data :    ?,
			   // Debugging
			   inum:     inum,
			   pc:       pc,
			   instr:    ?};
      return y;
   endactionvalue
endfunction

endpackage
