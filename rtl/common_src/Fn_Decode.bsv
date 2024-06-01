package Fn_Decode

import Instr_Bits :: * ;
import Inter_Stage :: * ;

typedef struct {
   RR_to_Retire      to_Retire;
   RR_to_EX_Control  to_EX_Control;
   RR_to_EX          to_EX;
   Mem_Req           to_EX_DMem;
} Result_Dispatch
deriving (Bits, FShow);

function ActionValue #(Decode_to_RR) fn_Decode(
	Fetch_to_Decode x_F_to_D,
	Mem_Rsp rsp_IMem,
	File flog
)

	actionvalue
		Bit#(32) instr = truncate(rsp_IMem.data);
		Bit#(5) rd = isntr_rd(isntr);

		let fallthru_pc = x_F_to_D.pc + 4;
	endactionvalue
endfunction

endpackage: Fn_Decode