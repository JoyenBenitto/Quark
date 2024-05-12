package Inter_Stage;

import Instr_Bits :: * ;

typedef enum {
    OPCLASS_SYSTEM,
    OPCLASS_CONTROL,
    OPCLASS_INT,
    OPCLASS_MEM,
    OPCLASS_FENCE
} OpClass deriving (Bits, Eq, FShow);

endpackage
