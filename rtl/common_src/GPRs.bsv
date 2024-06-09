package GPRs;

import  RegFile :: *;
import  Vector :: *;

interface GPRs_IFC;
    method Bit#(32) read_rs1 (Bit #(5) rs1);
    method Bit#(32) read_rs2 (Bit #(5) rs2);
    method Action write_rd (Bit #(5) rd, Bit #(32) rd_val);
endinterface

module mkGPRs(GPRs_IFC);
    RegFile #(Bit#(5), Bit#(32)) rf <- mkRegFileFull;

    method Bit #(32) read_rs1 (Bit #(5) rs1);
        return ((rs1 == 0) ? 0 : rf.sub (rs1));
    endmethod

    method Bit #(32) read_rs2 (Bit #(5) rs2);
         return ((rs2 == 0) ? 0 : rf.sub (rs2));
    endmethod

    method Action write_rd (Bit #(5) rd, Bit #(32) rd_val);
         rf.upd (rd, rd_val);
    endmethod

endmodule

(* synthesize *)
module mkGPRs_synth (GPRs_IFC);
   let ifc <- mkGPRs;
   return ifc;
endmodule

typedef  Vector #(32, Bit #(1))  Scoreboard;

interface Scoreboard_IFC;
   interface Reg #(Scoreboard) port0;
   interface Reg #(Scoreboard) port1;
endinterface

module mkScoreboard (Scoreboard_IFC);
   Reg #(Scoreboard) rg <- mkReg (replicate (0));
   interface port0 = rg;
   interface port1 = rg;
endmodule

endpackage