// Pseudocode
// color = 0
// pointer = screen // 16384
// maxaddr = pointer + 8192

// while true:
//     pointer = screen

//     k = kbd

//     if k > 0:
//         color = 1
    
//     if k == 0:
//         color = 0
    
//     while true:

//         if (pointer - maxaddr) > 0:
//             break
        
//         M[pointer] = color
//         pointer++




@color
M=0

// load screen address into data reg
@SCREEN
D=A

// set val of to `pointer` to addr of screen
@pointer
M=D

// number of 16-bit words/registers of @SCREEN
@8192
D=D+A

// initial screen addr + 8192 = max screen addr
@maxaddr
M=D


(LOOP)
    
    // load screen addr into data reg
    @SCREEN 
    D=A
    
    // reset pointer
    @pointer
    M=D

    // load keyboard input into data reg
    @KBD
    D=M

    // if key is pressed, jump to black
    @BLACK 
    D;JGT

    // otherwise, jump to white
    @WHITE
    0;JMP


    (BLACK)
        
        // set value to black pixel
        @color
        M=-1

        // jump to fill logic
        @FILL
        0;JMP
    

    (WHITE)

        // set value to white pixel
        @color
        M=0
        
        // jump to fill logic
        @FILL
        0;JMP


    (FILL)

        // load screen pointer into data reg
        @pointer
        D=M
        
        // load result of (max add - screen pointer) into data reg
        @maxaddr
        D=M-D 

        // exit if data reg == 0, meaning we're at max screen memory addr
        @LOOP
        D;JEQ

        // load color into data reg
        @color
        D=M

        // select the addr located at pointer val, set val at addr to selected color
        @pointer
        A=M
        M=D

        // increment pointer val
        @pointer
        M=M+1

        // return to loop
        @FILL
        0;JMP

    (END)
    0;JMP