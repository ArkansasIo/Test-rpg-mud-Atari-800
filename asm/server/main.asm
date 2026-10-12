; RPGMUD 6502 authoritative server
        .include "../shared/constants.inc"
        .include "server.inc"
START:  JSR SERVER_INIT
MAIN:   JSR SESSION_POLL
        JSR COMMAND_DISPATCH
        JSR WORLD_TICK
        JSR COMBAT_TICK
        JSR DB_FLUSH
        JMP MAIN
