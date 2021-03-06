// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
  @KBD
  D=M
  @FILLBLACK
  D; JNE
  @FILLWHITE
  0;JMP

(FILLBLACK)
  @KBD
  D=A
  @addr
  M=D-1
  @i
  M=D
  @SCREEN
  D=A
  @i
  M=M-D
  (FILLLOOPB)
    @addr
    A=M
    M=-1
    @addr
    M=M-1
    @i
    M=M-1
    D=M
    @LOOP
    D;JEQ
    @FILLLOOPB
    0;JMP

(FILLWHITE)
  @KBD
  D=A
  @addr
  M=D-1
  @i
  M=D
  @SCREEN
  D=A
  @i
  M=M-D
  (FILLLOOPW)
    @addr
    A=M
    M=0
    @addr
    M=M-1
    @i
    M=M-1
    D=M
    @LOOP
    D;JEQ
    @FILLLOOPW
    0;JMP
