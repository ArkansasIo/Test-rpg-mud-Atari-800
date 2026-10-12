; Bounded per-session output queue
OUTPUTQ_SIZE=256
OUTPUTQ_HEAD:.byte 0
OUTPUTQ_TAIL:.byte 0
OUTPUTQ_DATA:.res OUTPUTQ_SIZE
OUTPUTQ_PUSH:
        PHA
        LDA OUTPUTQ_HEAD
        CLC
        ADC #1
        CMP OUTPUTQ_TAIL
        BEQ OQ_FULL
        PLA
        LDY OUTPUTQ_HEAD
        STA OUTPUTQ_DATA,Y
        INY
        STY OUTPUTQ_HEAD
        LDA #0
        RTS
OQ_FULL:
        PLA
        LDA #4
        RTS
OUTPUTQ_POP:
        LDA OUTPUTQ_HEAD
        CMP OUTPUTQ_TAIL
        BEQ OQ_EMPTY
        LDY OUTPUTQ_TAIL
        LDA OUTPUTQ_DATA,Y
        INY
        STY OUTPUTQ_TAIL
        RTS
OQ_EMPTY:
        LDA #0
        RTS
OUTPUTQ_FLUSH:
        JSR OUTPUTQ_POP
        RTS
OUTPUTQ_CLEAR:
        LDA #0
        STA OUTPUTQ_HEAD
        STA OUTPUTQ_TAIL
        RTS
