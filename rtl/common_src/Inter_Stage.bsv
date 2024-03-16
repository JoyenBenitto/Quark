package Inter_Stage;

include Inter_Stage :: *;

'ifdef RV32
    typedef 32 XLEN;
'elif RV64
    typedef 64 XLEN; 
'endif

typedef enum {
    OPCLASS_SYSTEM,
    OPCLASS_CONTROL,
    OPCLASS_INT,
    OPCLASS_MEM,
    OPCLASS_FENCE
}OpClass deriving (Bits, Eq, FShow)

typedef struct {Bit #(XLEN) pc;

Bool exception;
Bit #(4) cause;
Bit #(XLEN) tval;

//if not exception
Bit #(XLEN) fallthru_pc;
Bit #(32) instr;
OpClass OpClass
Bool has_rs1;
Bool has_rs2;
Bool has_rd;
Bool writes_mem;
Bit #(XLEN) imm;
} Decode_to_RR deriving (Bits, Fshow);

function OpClass instr_opclass (Bit #(32) instr);
    OpClass result;

    if (is_legal_BRANCH(instr),
    || is_legal_JAL(instr),
    || is_legal_JALR(instr))
        result = OPCLASS_CONTROL;
    else
        result = OPCLASS_INT;
    result result
endfunction

endpackage