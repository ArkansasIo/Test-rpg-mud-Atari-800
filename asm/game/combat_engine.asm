; Deterministic combat primitives
COMBAT_ATTACK_POWER:.word 0
COMBAT_DEFENSE:.word 0
COMBAT_DAMAGE:.word 0
COMBAT_CALCULATE:
        LDA COMBAT_ATTACK_POWER
        SEC
        SBC COMBAT_DEFENSE
        BCS CC_POS
        LDA #1
CC_POS:
        STA COMBAT_DAMAGE
        LDA #0
        RTS
COMBAT_APPLY:
        JSR COMBAT_CALCULATE
        RTS
COMBAT_ROLL:
        LDA #1
        RTS
COMBAT_DEATH:
        RTS
