package Inter_Stage;

include Inter_Stage :: *;

typedef enum {
    OPCLASS_SYSTEM,
    OPCLASS_CONTROL,
    OPCLASS_INT,
    OPCLASS_MEM,
    OPCLASS_FENCE
}OpClass deriving (Bits, Eq, FShow)

function OpClass instr_opclass (Bit #(32) instr);
    OpClass result;

    if (is_legal_BRANCH(instr))

endfunction

endpackage