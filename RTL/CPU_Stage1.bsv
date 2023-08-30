package CPU_Stage1;

interface Ifc;
    method Value #(Reg#(Int#(32))) programCounter(Reg#(Int #(32))pc);
endinterface: Ifc_type



(* synthesize *)
module mkstage1(Ifc);  
    Reg #(Int#(32)) pc <- mkReg (0);
    let newvalue;
    rule newval;
        newvalue = pc + 4;
    endrule
    method ActionValue #(Reg#(Int#(32))) programCounter(pc);
        pc <= newvalue;
        return pc;
    endmethod


endmodule
endpackage