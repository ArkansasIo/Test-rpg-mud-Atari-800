; RPGMUD-64 virtual CPU state
VM_R0_LO:.res 8
VM_R1_LO:.res 8
VM_R2_LO:.res 8
VM_R3_LO:.res 8
VM_PC:.res 8
VM_SP:.res 8
VM_FLAGS:.res 8
VM_RUNNING:.byte 0
VM_RESET:
        LDA #0
        STA VM_RUNNING
        RTS
VM_RUN:
        LDA #1
        STA VM_RUNNING
        RTS
VM_HALT:
        LDA #0
        STA VM_RUNNING
        RTS
VM_STEP:
        RTS
