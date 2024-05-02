//Integer Computational Instructions
//================[Integer Register-Immediate Instructions]===================
//OP-I-Type
`define OP_IMM       'b0010011
/*Although lui and auipc are in the  I-isnt they have different opcode*/
`define OP_LUI       'b0110111
`define OP_AUIPC     'b0010111
//==================[Integer Register-Register Operations]===================
//OP-R-Type
//Integer Computational Instructions
`define OP           'b0110011
//================================[NOP]======================================
`define OP_NOP       'b0010011

//Control Transfer Instructions
//Unconditional Jumps
`define OP_JAL       'b1101111
`define OP_JALR      'b1100111  
//Conditional Branches
`define OP_BRANCH    'b0110011
//=========================[Load and Store Instructions]=======================
`define OP_LOAD      'b0000011
`define OP_STORE     'b0100011
//=======================[Memory Ordering Instructions]========================
`define OP_MISC_MEM  'b0001111
//=======================[Environment Call and Breakpoints]====================
`define OP_SYSTEM    'b1110011