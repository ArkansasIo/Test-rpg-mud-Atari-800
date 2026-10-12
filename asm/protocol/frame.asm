; RPGMUD framed protocol
FRAME_MAX=255
FRAME_OPCODE:.byte 0
FRAME_LENGTH:.byte 0
FRAME_VALIDATE:
        LDA FRAME_LENGTH
        BEQ FF_BAD
        CMP #FRAME_MAX
        BCS FF_BAD
        LDA #0
        RTS
FF_BAD:
        LDA #2
        RTS
