// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Optional?
// Store R0 as variable
// Store R1 as variable
@R0
D = M
@i
M = D
@R2
M = 0

// Loop through R0 (R1)times
(LOOP)
  @i
  M = M - 1
// Jump to END when R1 == 0
  @END
  M;JLT
// Otherwise add R1 to @sum
  @R1
  D = M
  @R2
  M = D + M
  @LOOP
  0;JMP

// END the software
(END)
  @END
  0;JMP
