; Atari 800 text MUD client
        .include "../shared/constants.inc"
START:
        JSR CIO_INIT
        JSR SESSION_INIT
CLIENT_LOOP:
        JSR INPUT_READ
        JSR COMMAND_ENCODE
        JSR NETWORK_SEND
        JSR NETWORK_RECEIVE
        JSR TEXT_RENDER
        JMP CLIENT_LOOP
