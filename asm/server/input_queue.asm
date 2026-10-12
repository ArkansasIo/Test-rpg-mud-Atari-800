; Bounded per-session input queue
; 6502-compatible implementation. Caller provides A=byte for PUSH/POP.
INPUTQ_SIZE = 256

INPUTQ_HEAD: .byte 0
INPUTQ_TAIL: .byte 0
INPUTQ_DATA: .res INPUTQ_SIZE

INPUTQ_PUSH:
        PHA
        LDA INPUTQ_HEAD
        CLC
        ADC #1
        TAX
        CMP INPUTQ_TAIL
        BEQ INPUTQ_FULL
        PLA
        LDY INPUTQ_HEAD
        STA INPUTQ_DATA,Y
        INY
        STY INPUTQ_HEAD
        LDA #0
        RTS
INPUTQ_FULL:
        PLA
        LDA #4
        RTS

INPUTQ_POP:
        LDA INPUTQ_HEAD
        CMP INPUTQ_TAIL
        BEQ INPUTQ_EMPTY
        LDY INPUTQ_TAIL
        LDA INPUTQ_DATA,Y
        INY
        STY INPUTQ_TAIL
        RTS
INPUTQ_EMPTY:
        LDA #0
        RTS

INPUTQ_CLEAR:
        LDA #0
        STA INPUTQ_HEAD
        STA INPUTQ_TAIL
        RTS
