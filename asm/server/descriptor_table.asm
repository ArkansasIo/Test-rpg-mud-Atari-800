; Session descriptor allocation
DESCRIPTOR_MAX=32
DESC_ACTIVE:.res DESCRIPTOR_MAX
DESC_STATE:.res DESCRIPTOR_MAX
DESCRIPTOR_ALLOC:
        LDX #0
DA_LOOP:
        CPX #DESCRIPTOR_MAX
        BCS DA_FULL
        LDA DESC_ACTIVE,X
        BEQ DA_SLOT
        INX
        JMP DA_LOOP
DA_SLOT:
        LDA #1
        STA DESC_ACTIVE,X
        LDA #1
        STA DESC_STATE,X
        TXA
        RTS
DA_FULL:
        LDA #$FF
        RTS
DESCRIPTOR_FIND:
        CPX #DESCRIPTOR_MAX
        BCS DF_BAD
        LDA DESC_ACTIVE,X
        RTS
DF_BAD:
        LDA #0
        RTS
DESCRIPTOR_RELEASE:
        CPX #DESCRIPTOR_MAX
        BCS DR_DONE
        LDA #0
        STA DESC_ACTIVE,X
        STA DESC_STATE,X
DR_DONE:
        RTS
