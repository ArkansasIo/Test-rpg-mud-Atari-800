; Authoritative command router
CMD_ROUTE:
        JSR RATE_ALLOW
        BNE CR_DENY
        JSR PARSER_DISPATCH
        RTS
CR_DENY:
        LDA #3
        RTS
