;@-------------------------------------------------------------------------
;@-------------------------------------------------------------------------

.globl _start
_start:
    mov sp,#0x8000
    bl notmain
hang: b hang

.globl PUT32
PUT32:
    str r1,[r0]
    bx lr

.globl GET32
GET32:
    ldr r0,[r0]
    bx lr

.globl GETPC
GETPC:
    mov r0,lr
    bx lr

.globl dummy
dummy:
    bx lr

.globl GETCPUID
GETCPUID:
    mrc p15,0,r0,c0,c0,0
    bx lr