# Architecture

The project remains a text-based MUD.

Client -> Gateway -> Session -> Authoritative Game Server -> Repository -> Database.

Clients:
- Modern terminal/text client
- Native Atari 800 6502 client

CircleMUD integration is isolated behind an adapter boundary. Clients cannot authoritatively mutate world state.
