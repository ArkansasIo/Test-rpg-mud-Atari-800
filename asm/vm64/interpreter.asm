; RPGMUD-64 interpreter core
VM_OPCODE:.byte 0
VM_STATUS:.byte 0
VM_FETCH:
        LDA VM_OPCODE
        RTS
VM_DECODE:
        LDA VM_OPCODE
        RTS
VM_EXECUTE:
        CMP #VM_OP_NOP
        BEQ VME_OK
        CMP #VM_OP_HALT
        BEQ VME_HALT
        CMP #VM_OP_ADD
        BEQ VME_OK
        CMP #VM_OP_SUB
        BEQ VME_OK
        CMP #VM_OP_LOAD
        BEQ VME_OK
        CMP #VM_OP_STORE
        BEQ VME_OK
        LDA #1
        STA VM_STATUS
        RTS
VME_HALT:
        JSR VM_HALT
VME_OK:
        LDA #0
        STA VM_STATUS
        RTS
VM_DISPATCH:
        JSR VM_FETCH
        JSR VM_DECODE
        JSR VM_EXECUTE
        RTS
