start:
    xor   ax, ax      ; This is shorter/faster than "mov ax, 0h"
    mov   ds, ax
    mov   ss, ax
    mov   sp, 7F00h   ; set stack pointer after our bootloader
    mov   di, 7C00h   ; set Data pointer to where is our bootloader loaded
.printMemoryValue:
    mov   cx, 0006H   ; CX:DX = 00068480h Pause for about 0.4 sec
    mov   dx, 8480H
    mov   ah, 86h     ; BIOS.Delay
    int   15h
    mov   bp, [di]    ; Moving content of memory location in BP
    mov   bx, 0007h   ; Display page 0 in BH, Attribute WhiteOnBlack in BL
    mov   cx, 16
.loopstart:
    rol   bp, 1       ; Produces a CF
    mov   ax, 0E00h   ; Function number in AH, zeroing AL
    adc   al, "0"     ; 0 + "0" + CF=0 ==> "0"
    int   10h         ; 0 + "0" + CF=1 ==> "1"
    dec   cx
    jnz   .loopstart
    mov   ax, 0E0Dh   ; Newline is carriage return plus linefeed
    int   10h
    mov   ax, 0E0Ah
    int   10h
    add   di, 2
    cmp   di, 7E00h
    jb    .printMemoryValue
    hlt               ; ende

    times 510-($-$$) db 0
    dw    0AA55h      ; => 55h 0AAh (little endian byte order)
