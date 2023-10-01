package decoder

    function Bit#(5) fn_decode_rs1(Bit#(32) inst);
        Bit#(3) funct3 = inst[14:12];
		Bit#(7) funct7 = inst[31:25];

        case(inst[6:2]) matches
        default:
    endfunction
endpackage