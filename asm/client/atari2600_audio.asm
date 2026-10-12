; Atari 2600 TIA sound-effect interface
; Gameplay emits sound IDs; the Atari audio adapter translates them to TIA writes.
; This keeps server/game logic independent from physical audio registers.

SFX_NONE       = 0
SFX_CONFIRM    = 1
SFX_ERROR      = 2
SFX_MOVE       = 3
SFX_ATTACK     = 4
SFX_HIT        = 5
SFX_CRITICAL   = 6
SFX_CAST       = 7
SFX_LOOT       = 8
SFX_LEVELUP    = 9
SFX_DEATH      = 10
SFX_CHAT       = 11
SFX_LOGIN      = 12
SFX_LOGOUT     = 13
SFX_MENU       = 14

SFX_ID:       .byte 0
SFX_PRIORITY: .byte 0
SFX_TIMER:    .byte 0

TIA_AUDC0 = $15
TIA_AUDC1 = $16
TIA_AUDF0 = $17
TIA_AUDF1 = $18
TIA_AUDV0 = $19
TIA_AUDV1 = $1A

AUDIO_INIT:
        LDA #0
        STA SFX_ID
        STA SFX_PRIORITY
        STA SFX_TIMER
        RTS

; A = SFX identifier.
SFX_PLAY:
        STA SFX_ID
        LDX SFX_ID
        CPX #SFX_MENU+1
        BCS SFX_INVALID

        ; Compact default parameter table:
        ; AUDC, AUDF, AUDV, duration.
        LDA SFX_CONTROL,X
        STA TIA_AUDC0
        LDA SFX_FREQ,X
        STA TIA_AUDF0
        LDA SFX_VOLUME,X
        STA TIA_AUDV0
        LDA SFX_DURATION,X
        STA SFX_TIMER
        RTS

SFX_INVALID:
        LDA #0
        STA TIA_AUDV0
        RTS

SFX_TICK:
        LDA SFX_TIMER
        BEQ SFX_TICK_DONE
        DEC SFX_TIMER
        BNE SFX_TICK_DONE
        LDA #0
        STA TIA_AUDV0
SFX_TICK_DONE:
        RTS

; 15 entries: one per SFX ID.
SFX_CONTROL:
        .byte $00,$08,$04,$04,$08,$06,$0C,$0A,$08,$0E,$04,$08,$08,$04,$08
SFX_FREQ:
        .byte $00,$20,$08,$18,$10,$0C,$08,$14,$1C,$04,$02,$28,$24,$20,$30
SFX_VOLUME:
        .byte $00,$0C,$08,$08,$0E,$0E,$0F,$0C,$0D,$0F,$0F,$06,$0C,$06,$08
SFX_DURATION:
        .byte $00,$06,$08,$04,$06,$05,$08,$0A,$08,$14,$18,$04,$0C,$0C,$04
