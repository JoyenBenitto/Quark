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


endpackage: Fn_Decode