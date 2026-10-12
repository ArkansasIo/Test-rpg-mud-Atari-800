; Authoritative game tick coordinator
GAME_TICK:
        JSR WORLD_TICK
        JSR COMBAT_TICK
        JSR EVENT_TICK
        RTS
