; Experience awards and level thresholds
; XP is a 32-bit unsigned value stored little-endian.

XP_LO: .word 0
XP_HI: .word 0
XP_LEVEL: .byte 1
XP_MAX_LEVEL = 60

; Add 16-bit award in A(low), X(high).
XP_AWARD:
        CLC
        ADC XP_LO
        STA XP_LO
        TXA
        ADC XP_LO+1
        STA XP_LO+1
        BCC XP_NO_CARRY
        INC XP_HI
        BNE XP_NO_CARRY
        INC XP_HI+1
XP_NO_CARRY:
        RTS

; A=level. Returns 16-bit threshold in XP_RET_LO/HI.
; Threshold = level * level * 100, capped at 65535.
XP_RET_LO: .word 0
XP_THRESHOLD:
        STA XP_RET_LO
        LDX #0
        STX XP_RET_LO+1
        LDY #0
XP_MUL:
        CPY XP_RET_LO
        BCS XP_MUL_DONE
        CLC
        LDA XP_RET_LO+1
        ADC #0
        STA XP_RET_LO+1
        INY
        CPY #255
        BNE XP_MUL
XP_MUL_DONE:
        RTS

XP_LEVEL_CHECK:
        LDA XP_LEVEL
        CMP #XP_MAX_LEVEL
        BCS XP_LEVEL_CAP
XP_LEVEL_CAP:
        RTS
