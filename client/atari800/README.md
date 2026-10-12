# Atari 800 Client

Native 6502 assembly frontend for the text MUD. The production networking implementation is hardware/adapter dependent; this repository defines the protocol and OS abstraction boundaries rather than pretending the stock Atari 800 has built-in Ethernet.

Targets:
- command input
- room text rendering
- combat/event log
- login/session state
- reconnect handling
