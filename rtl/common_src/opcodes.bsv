//Integer Computational Instructions
//================[Integer Register-Immediate Instructions]===================
//OP-I-Type
`OP_IMM       'b0010011
/*Although lui and auipc are in the  I-isnt they have different opcode*/
`OP_LUI       'b0110111
`OP_AUIPC     'b0010111
//==================[Integer Register-Register Operations]===================
//OP-R-Type
//Integer Computational Instructions
`OP           'b0110011
//================================[NOP]======================================
`OP_NOP       'b0010011

//Control Transfer Instructions
//Unconditional Jumps
`OP_JAL       'b1101111
`OP_JALR      'b1100111  
//Conditional Branches
`OP_BRANCH    'b0110011
//=========================[Load and Store Instructions]=======================
`OP_LOAD      'b0000011
`OP_STORE     'b0100011
//=======================[Memory Ordering Instructions]========================
`OP_MISC_MEM  'b0001111
//=======================[Environment Call and Breakpoints]====================
`OP_SYSTEM    'b1110011