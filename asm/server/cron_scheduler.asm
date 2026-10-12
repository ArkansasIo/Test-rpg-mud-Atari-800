; RPGMUD assembly job scheduler
; Cron-like fixed-minute scheduler for persistence maintenance.
; Jobs are registered with an interval in ticks. The server pulse increments
; JOB_TICK and dispatches due jobs.

JOB_MAX = 16

JOB_ACTIVE:   .res JOB_MAX
JOB_INTERVAL: .res JOB_MAX
JOB_COUNTER:  .res JOB_MAX
JOB_HANDLER:  .res JOB_MAX

JOB_TICK:
        LDX #0
JT_LOOP:
        CPX #JOB_MAX
        BCS JT_DONE
        LDA JOB_ACTIVE,X
        BEQ JT_NEXT
        LDA JOB_COUNTER,X
        BEQ JT_RUN
        DEC JOB_COUNTER,X
        JMP JT_NEXT
JT_RUN:
        LDA JOB_INTERVAL,X
        STA JOB_COUNTER,X
        ; Handler dispatch is platform/ABI specific.
        ; Handler ID remains in JOB_HANDLER,X.
JT_NEXT:
        INX
        JMP JT_LOOP
JT_DONE:
        RTS

JOB_REGISTER:
        ; A=handler id, X=interval ticks.
        LDY #0
JR_FIND:
        CPY #JOB_MAX
        BCS JR_FULL
        LDA JOB_ACTIVE,Y
        BEQ JR_SLOT
        INY
        JMP JR_FIND
JR_SLOT:
        STA JOB_HANDLER,Y
        TXA
        STA JOB_INTERVAL,Y
        STA JOB_COUNTER,Y
        LDA #1
        STA JOB_ACTIVE,Y
        TYA
        RTS
JR_FULL:
        LDA #$FF
        RTS

JOB_CANCEL:
        ; X=job slot.
        CPX #JOB_MAX
        BCS JC_DONE
        LDA #0
        STA JOB_ACTIVE,X
JC_DONE:
        RTS

; Recommended persistence jobs:
; 01 MYSQL_FLUSH_JOURNAL
; 02 MYSQL_BACKUP
; 03 MYSQL_INTEGRITY_CHECK
; 04 MYSQL_CLEANUP_EXPIRED
