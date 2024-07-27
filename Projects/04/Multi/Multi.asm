// Pseudocode
// x = 3
// y = 4
// res = 0

// while true:
//     if y==0:
//         break
//
//     res += x
//     y--



@3
D=A
@x
M=D
@4
D=A
@y
M=D
@z
M=0
(Loop)
@y
D=M
@End
D;JEQ
@x
D=M
@z
M=D+M
@y
M=M-1
@Loop
0;JMP
(End)
@End
0;JMP