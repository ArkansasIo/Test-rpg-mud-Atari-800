; Authoritative network service boundary
NET_MAX_SESSIONS=32
NET_INIT:
        RTS
NET_ACCEPT:
        JSR DESCRIPTOR_ALLOC
        RTS
NET_RECEIVE:
        RTS
NET_SEND:
        RTS
NET_CLOSE:
        RTS
