; Atari 2600 music sequencer
; Compact data-driven music interface for the TIA audio adapter.
; Tracks are sequences of note records: frequency, control, duration.
; The sequencer uses one channel for melody and leaves the second channel
; available to SFX.

MUSIC_NONE   = 0
MUSIC_TITLE  = 1
MUSIC_LOGIN  = 2
MUSIC_TOWN   = 3
MUSIC_DUNGEON= 4
MUSIC_BATTLE = 5
MUSIC_BOSS   = 6
MUSIC_VICTORY= 7
MUSIC_DEFEAT = 8
MUSIC_CREDITS= 9

MUSIC_TRACK: .byte 0
MUSIC_INDEX: .byte 0
MUSIC_TIMER: .byte 0
MUSIC_VOLUME:.byte 12
MUSIC_LOOP:  .byte 0

MUSIC_INIT:
        LDA #MUSIC_NONE
        STA MUSIC_TRACK
        LDA #0
        STA MUSIC_INDEX
        STA MUSIC_TIMER
        LDA #12
        STA MUSIC_VOLUME
        RTS

; A = track ID. X = loop flag (0=no loop, nonzero=loop).
MUSIC_PLAY:
        STA MUSIC_TRACK
        STX MUSIC_LOOP
        LDA #0
        STA MUSIC_INDEX
        STA MUSIC_TIMER
        RTS

MUSIC_STOP:
        LDA #0
        STA MUSIC_TRACK
        STA MUSIC_TIMER
        RTS

; Advance one music tick and emit the next note when the current note expires.
MUSIC_TICK:
        LDA MUSIC_TRACK
        BEQ MUSIC_DONE
        LDA MUSIC_TIMER
        BEQ MUSIC_NEXT_NOTE
        DEC MUSIC_TIMER
        RTS

MUSIC_NEXT_NOTE:
        LDX MUSIC_TRACK
        LDA MUSIC_TRACK_PTR_LO,X
        STA MUSIC_PTR_LO
        LDA MUSIC_TRACK_PTR_HI,X
        STA MUSIC_PTR_HI
        LDY MUSIC_INDEX

        LDA (MUSIC_PTR_LO),Y
        CMP #$FF
        BEQ MUSIC_END
        STA TIA_MUSIC_FREQ
        INY
        LDA (MUSIC_PTR_LO),Y
        STA TIA_MUSIC_CTRL
        INY
        LDA (MUSIC_PTR_LO),Y
        STA MUSIC_TIMER
        INY
        STY MUSIC_INDEX
        LDA MUSIC_VOLUME
        STA TIA_MUSIC_VOL
        RTS

MUSIC_END:
        LDA MUSIC_LOOP
        BEQ MUSIC_STOP
        LDA #0
        STA MUSIC_INDEX
        RTS

MUSIC_DONE:
        RTS

MUSIC_SET_VOLUME:
        STA MUSIC_VOLUME
        RTS

TIA_MUSIC_FREQ = $17
TIA_MUSIC_CTRL = $15
TIA_MUSIC_VOL  = $19
MUSIC_PTR_LO: .byte 0
MUSIC_PTR_HI: .byte 0

; Track 0 unused; tracks use compact note records.
MUSIC_TRACK_PTR_LO:
        .byte 0,<MUSIC_TITLE,<MUSIC_LOGIN,<MUSIC_TOWN,<MUSIC_DUNGEON
        .byte <MUSIC_BATTLE,<MUSIC_BOSS,<MUSIC_VICTORY,<MUSIC_DEFEAT,<MUSIC_CREDITS
MUSIC_TRACK_PTR_HI:
        .byte 0,>MUSIC_TITLE,>MUSIC_LOGIN,>MUSIC_TOWN,>MUSIC_DUNGEON
        .byte >MUSIC_BATTLE,>MUSIC_BOSS,>MUSIC_VICTORY,>MUSIC_DEFEAT,>MUSIC_CREDITS

MUSIC_TITLE:   .byte $20,$08,8,$18,$08,8,$10,$08,8,$FF
MUSIC_LOGIN:   .byte $18,$08,6,$10,$08,6,$08,$08,8,$FF
MUSIC_TOWN:    .byte $28,$08,8,$24,$08,8,$20,$08,8,$18,$08,8,$FF
MUSIC_DUNGEON: .byte $38,$04,10,$30,$04,10,$28,$04,10,$20,$04,10,$FF
MUSIC_BATTLE:  .byte $10,$06,4,$0C,$06,4,$08,$06,4,$0C,$06,4,$FF
MUSIC_BOSS:    .byte $08,$0C,8,$0A,$0C,8,$0C,$0C,8,$10,$0C,8,$FF
MUSIC_VICTORY: .byte $10,$08,6,$18,$08,6,$20,$08,10,$FF
MUSIC_DEFEAT:  .byte $30,$04,10,$38,$04,10,$40,$04,14,$FF
MUSIC_CREDITS: .byte $20,$08,10,$18,$08,10,$10,$08,10,$FF
