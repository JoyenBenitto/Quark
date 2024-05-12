//Integer Computational Instructions
//================[Integer Register-Immediate Instructions]===================
//OP-I-Type
`define OP_IMM       7'b0010011
/*Although lui and auipc are in the  I-isnt they have different opcode*/
`define OP_LUI       7'b0110111
`define OP_AUIPC     7'b0010111
//==================[Integer Register-Register Operations]===================
//OP-R-Type
//Integer Computational Instructions
`define OP           7'b0110011
//================================[NOP]======================================
`define OP_NOP       7'b0010011

//Control Transfer Instructions
//Unconditional Jumps
`define OP_JAL       7'b1101111
`define OP_JALR      7'b1100111  
//Conditional Branches
`define OP_BRANCH    7'b0110011
//=========================[Load and Store Instructions]=======================
`define OP_LOAD      7'b0000011
`define OP_STORE     7'b0100011
//=======================[Memory Ordering Instructions]========================
`define OP_MISC_MEM  7'b0001111
//=======================[Environment Call and Breakpoints]====================
`define OP_SYSTEM    7'b1110011

//==================================[Funct7]===================================
`define FUNCT7_ADD   7'b_000_0000
`define FUNCT7_SUB   7'b_010_0000
`define FUNCT7_SLL   7'b_000_0000
`define FUNCT7_SLT   7'b_000_0000
`define FUNCT7_SLTU  7'b_000_0000
`define FUNCT7_XOR   7'b_000_0000
`define FUNCT7_SRL   7'b_000_0000
`define FUNCT7_SRA   7'b_010_0000
`define FUNCT7_OR    7'b_000_0000
`define FUNCT7_AND   7'b_000_0000

//===================================[Funct3]===================================
//store funct3
`define FUNCT3_SB  3'b_000
`define FUNCT3_SH  3'b_001
`define FUNCT3_SW  3'b_010

//load funct3
`define FUNCT3_LB   3'b_000
`define FUNCT3_LH   3'b_001
`define FUNCT3_LW   3'b_010
`define FUNCT3_LBU  3'b_100
`define FUNCT3_LHU  3'b_101


//R-type func3
`define FUNCT3_ADD  3'b_000
`define FUNCT3_SUB  3'b_000
`define FUNCT3_SLL  3'b_001
`define FUNCT3_SLT  3'b_010
`define FUNCT3_SLTU 3'b_011
`define FUNCT3_SRxI 3'b_101
`define FUNCT3_XOR  3'b_100
`define FUNCT3_SRL  3'b_101
`define FUNCT3_SRA  3'b_101
`define FUNCT3_OR   3'b_110
`define FUNCT3_AND  3'b_111

//I-type func3
`define FUNCT3_ADDI  3'b_000
`define FUNCT3_SLTI  3'b_010
`define FUNCT3_SLTIU 3'b_011
`define FUNCT3_XORI  3'b_100
`define FUNCT3_ORI   3'b_110
`define FUNCT3_ANDI  3'b_111
`define FUNCT3_SLLI  3'b_001
`define FUNCT3_SRLI  3'b_101
`define FUNCT3_SRAI  3'b_101
`define FUNCT3_SRxI  3'b_101
