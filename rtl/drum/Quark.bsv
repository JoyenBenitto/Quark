package Quark;

interface Quark_IFC;
   method Action pc_next;
endinterface

(*synthesize*)
module mk_quark(Quark_IFC);
    Reg #(Bit #(32)) rg_pc <- mkReg (0);
    $display("Here is the next PC");
    $finish;

    method Action pc_next;
        rg_pc <= rg_pc + 4;
    endmethod

endmodule
endpackage
