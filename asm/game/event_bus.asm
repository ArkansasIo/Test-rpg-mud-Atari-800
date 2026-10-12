; Internal gameplay event bus
EVENT_CAPACITY=32
EVENT_COUNT:.byte 0
EVENT_TYPE:.res EVENT_CAPACITY
EVENT_ID:.res EVENT_CAPACITY
EVENT_PUSH:
        LDX EVENT_COUNT
        CPX #EVENT_CAPACITY
        BCS EB_FULL
        STA EVENT_TYPE,X
        STY EVENT_ID,X
        INC EVENT_COUNT
        LDA #0
        RTS
EB_FULL:
        LDA #4
        RTS
EVENT_CLEAR:
        LDA #0
        STA EVENT_COUNT
        RTS
EVENT_TICK:
        JSR EVENT_CLEAR
        RTS
