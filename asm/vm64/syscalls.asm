; RPGMUD-64 supervisor call dispatcher
SYS_NONE=0
SYS_CONSOLE=1
SYS_NETWORK=2
SYS_TIMER=3
SYS_STORAGE=4
SYS_EVENT=5
VM_SYSCALL:
        CMP #SYS_EVENT+1
        BCS VS_BAD
        LDA #0
        RTS
VS_BAD:
        LDA #1
        RTS
