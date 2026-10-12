; Record integrity checksum interface
; 16-bit additive checksum. A=byte to update.
CHECKSUM_LO: .byte 0
CHECKSUM_HI: .byte 0

CHECKSUM_INIT:
        LDA #0
        STA CHECKSUM_LO
        STA CHECKSUM_HI
        RTS

CHECKSUM_UPDATE:
        CLC
        ADC CHECKSUM_LO
        STA CHECKSUM_LO
        LDA CHECKSUM_HI
        ADC #0
        STA CHECKSUM_HI
        RTS

CHECKSUM_FINAL:
        LDA CHECKSUM_LO
        LDX CHECKSUM_HI
        RTS
