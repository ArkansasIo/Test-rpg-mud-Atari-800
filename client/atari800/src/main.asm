; Native Atari 800 6502 text MUD client skeleton
        .org $2000
START:  LDA #0
        STA $D20E
LOOP:   JMP LOOP
