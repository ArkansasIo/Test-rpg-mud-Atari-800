; Per-session command rate limiter
RATE_LIMIT_MAX=16
RATE_COUNT:.res DESCRIPTOR_MAX
RATE_RESET:
        LDX #0
        LDA #0
RL_LOOP:
        STA RATE_COUNT,X
        INX
        CPX #DESCRIPTOR_MAX
        BNE RL_LOOP
        RTS
RATE_ALLOW:
        CPX #DESCRIPTOR_MAX
        BCS RLA_DENY
        LDA RATE_COUNT,X
        CMP #RATE_LIMIT_MAX
        BCS RLA_DENY
        INC RATE_COUNT,X
        LDA #0
        RTS
RLA_DENY:
        LDA #1
        RTS
