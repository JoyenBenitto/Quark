package CPU_Stage1;

    interface Stage1_IFC; // interface is declared
        method ActionValue #(Int#(32)) program_counter; // method program counter
    endinterface

    (* synthesize *)
    module mkstage1(Stage1_IFC);
        
        //Register decleration
        Reg #(Int#(32)) pc <- mkReg (0);
        Reg #(Int#(32)) imem <- mkReg (0);

        rule incremeter;
            pc <= pc + 4;
        endrule

        method ActionValue #(Int#(32)) program_counter();
            imem <= pc;
            return pc;
        endmethod
    endmodule
endpackage