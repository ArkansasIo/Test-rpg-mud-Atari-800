; Authoritative world movement primitives
WORLD_ROOM:.word 0
WORLD_TARGET:.word 0
WORLD_ENTER:
        LDA WORLD_TARGET
        STA WORLD_ROOM
        LDA WORLD_TARGET+1
        STA WORLD_ROOM+1
        RTS
WORLD_MOVE:
        JMP WORLD_ENTER
WORLD_LEAVE:
        LDA #0
        STA WORLD_ROOM
        STA WORLD_ROOM+1
        RTS
WORLD_LOOK:
        LDA WORLD_ROOM
        RTS
