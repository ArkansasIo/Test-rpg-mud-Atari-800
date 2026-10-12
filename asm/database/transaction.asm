; Transaction state machine
DB_TXN_IDLE=0
DB_TXN_ACTIVE=1
DB_TXN_STATE:.byte DB_TXN_IDLE
DB_TXN_BEGIN:
        LDA DB_TXN_STATE
        BNE DB_TXN_FAIL
        LDA #DB_TXN_ACTIVE
        STA DB_TXN_STATE
        JSR JOURNAL_BEGIN
        RTS
DB_TXN_COMMIT:
        LDA DB_TXN_STATE
        CMP #DB_TXN_ACTIVE
        BNE DB_TXN_FAIL
        JSR JOURNAL_COMMIT
        LDA #DB_TXN_IDLE
        STA DB_TXN_STATE
        LDA #0
        RTS
DB_TXN_ROLLBACK:
        JSR JOURNAL_RECOVER
        LDA #DB_TXN_IDLE
        STA DB_TXN_STATE
        LDA #0
        RTS
DB_TXN_FAIL:
        LDA #1
        RTS
