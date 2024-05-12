/*All the structures and functions between stages can be found here*/

package Inter_Stage;

import Instr_Bits :: * ;

typedef enum {
    OPCLASS_SYSTEM,
    OPCLASS_CONTROL,
    OPCLASS_INT,
    OPCLASS_MEM,
    OPCLASS_FENCE
} OpClass deriving (Bits, Eq, FShow);

typedef struct {
    Bit #(32) pc; //The curent pc hold the current pc for jalr, jal, auipc ...
    // We will also use the above for handelling traps
    Bool exception; 
    //True if illegal instruction in the decoder
    /*
        >Wether an error occoured in the fetch-to-memory-to-decode path.
        >(or) if the issued instruction is illegal.
    */

    Bit #(4) cause;
    Bit #(32) tval;

    //If not exception
    Bit #(32) fallthru_pc; //PC + 4 
    //For JAL and JALR instructions (unconditional jumps), this is the “return address”
    Bit #(32) instr;
    OpClass opclass;
    Bool has_rs1;
    Bool has_rs2;
    Bool has_rd;
    Bool  writes_mem; //All mem operation other than load
    Bit #(32) imm; //canonical (bit swizzled) 
} Decode_to_RR deriving (Bits, FShow);

endpackage
