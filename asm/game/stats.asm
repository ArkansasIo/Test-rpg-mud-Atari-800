; Aetherfall character statistics
STAT_STR=0
STAT_DEX=1
STAT_CON=2
STAT_INT=3
STAT_WIS=4
STAT_SPI=5
STAT_LCK=6
STAT_WIL=7
STAT_COUNT=8
STAT_MIN=1
STAT_MAX=255
STATS:.res STAT_COUNT
STATS_INIT:
        LDX #0
        LDA #10
SI_LOOP:
        STA STATS,X
        INX
        CPX #STAT_COUNT
        BNE SI_LOOP
        RTS
; A=stat value. Returns signed two's-complement modifier in A.
STATS_MODIFIER:
        CMP #10
        BCS SM_HIGH
        LDX #0
SM_LOW:
        CMP #10
        BCS SM_DONE
        CLC
        ADC #2
        DEX
        JMP SM_LOW
SM_HIGH:
        LDX #0
SM_HIGH_LOOP:
        CMP #12
        BCC SM_HIGH_DONE
        SEC
        SBC #2
        INX
        JMP SM_HIGH_LOOP
SM_HIGH_DONE:
        TXA
SM_DONE:
        RTS
STATS_DERIVE:
        RTS
