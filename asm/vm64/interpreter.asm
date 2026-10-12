; RPGMUD-64 instruction interpreter boundary
VM_FETCH:
        RTS
VM_DECODE:
        RTS
VM_EXECUTE:
        RTS
VM_DISPATCH:
        JSR VM_FETCH
        JSR VM_DECODE
        JSR VM_EXECUTE
        RTS
