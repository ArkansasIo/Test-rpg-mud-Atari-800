; Quest state primitives
QUEST_STATE:.byte 0
QUEST_PROGRESS_VALUE:.byte 0
QUEST_ACCEPT:
        LDA #1
        STA QUEST_STATE
        LDA #0
        STA QUEST_PROGRESS_VALUE
        RTS
QUEST_PROGRESS:
        LDA QUEST_STATE
        BEQ QP_FAIL
        INC QUEST_PROGRESS_VALUE
        RTS
QP_FAIL:
        LDA #1
        RTS
QUEST_COMPLETE:
        LDA QUEST_STATE
        BEQ QC_FAIL
        LDA #2
        STA QUEST_STATE
        RTS
QC_FAIL:
        LDA #1
        RTS
QUEST_REWARD:
        LDA QUEST_STATE
        CMP #2
        BNE QR_FAIL
        LDA #0
        STA QUEST_STATE
        RTS
QR_FAIL:
        LDA #1
        RTS
