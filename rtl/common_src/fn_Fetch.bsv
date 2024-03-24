package Fn_Fetch

typedef struct {
    Fetch_to_Decode to_D;
    Mem_Req mem_req;
 } Result_F deriving (Bits, FShow);

 function ActionValue #(Result_F)
    fn_Fetch()
endpackage