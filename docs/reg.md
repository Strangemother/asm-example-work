# Register

The registry combines a printer and a useful caller, used by the compiler
to render lines and the _vm_ to monitor registry usage. It allows meta and inline programming

It's a pretty easy thing to conceptualise - A register is split into rows. Each register item is a mutant caller. Certain attributes may be asserted for compliler type. This type may be given late; therefore multiple bay be required

    reg = Registry('x32')
    reg.al = 2

Each mutator action performs a change to the registry entity and applies a write statement to the ASM file.
All mutators define a asm action


    reg.rax = 5     ; mov rax, 5
    reg.rcx = 12    ; mov rcx, 23
    reg.rax + reg.rcx   ; add rax, rcx

The same is applied for all operands.

Special operations to shortcut tasks such as xor:

    # xor rcx, rcx
    reg.rax.xor()
    reg.rax.xor('rax')
    asm.xor(reg.rax)
    asm.xor("rax", 'rax')

clear:

    # mov, rcx, -1
    asm.mov('rax', -1)
    reg.rax.mov(-1)
    reg.rax = -1
    reg.rax.clear()


## Future

It would be nice to extend this. Like equals through xor == `NOT XOR`

    reg.rax.equal(1)
    reg.rax.not.xor()
