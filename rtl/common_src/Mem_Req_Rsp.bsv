package Mem_Req_Rsp
typedef enum {MEM_1B, 
    MEM_2B, 
    MEM_4B, 
    MEM_8B} Mem_Req_Size deriving (Eq, FShow, Bits);

typedef struct {
    Mem_Req_Type req_type;,
    Mem_Req_Size size;
    Bit #(64) addr;
    Bit #(64) data;
} Mem_Req

typedef enum {MEM_RSP_OK,
    MEM_RSP_MISALIGNED,
    MEM_RSP_ERR,
} Mem_Rsp_Type deriving (Eq, FShow, Bits);

typedef struct {Mem_Rsp_Type rsp_type;
Bit #(64) data; // mem => CPU data

} Mem_Rsp deriving (Eq, FShow, Bits);

endpackage