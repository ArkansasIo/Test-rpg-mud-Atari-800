; Account authentication service boundary
AUTH_OK=0
AUTH_INVALID=1
AUTH_LOCKED=2
AUTH_EXISTS=3
AUTH_LOGIN:
        LDA #AUTH_INVALID
        RTS
AUTH_LOGOUT:
        LDA #AUTH_OK
        RTS
AUTH_REGISTER:
        LDA #AUTH_EXISTS
        RTS
