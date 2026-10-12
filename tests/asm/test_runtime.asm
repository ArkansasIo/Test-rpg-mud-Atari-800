; Runtime smoke tests
TEST_VM:
        LDA #VM_OP_NOP
        STA VM_OPCODE
        JSR VM_DISPATCH
        RTS
TEST_COMBAT:
        LDA #10
        STA COMBAT_ATTACK_POWER
        LDA #3
        STA COMBAT_DEFENSE
        JSR COMBAT_CALCULATE
        RTS
TEST_QUEST:
        JSR QUEST_ACCEPT
        JSR QUEST_PROGRESS
        JSR QUEST_COMPLETE
        JSR QUEST_REWARD
        RTS
