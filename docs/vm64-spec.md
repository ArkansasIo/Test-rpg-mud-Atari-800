# RPGMUD-64 VM

RPGMUD-64 is a custom 64-bit virtual server architecture with a 6502-compatible low-memory execution mode. The physical 6502 is not being described as a 64-bit processor.

## Address regions
- `$00000000-$0000FFFF`: 6502 compatibility region
- `$FFFF0000+`: virtual MMIO
- console, network, timer, storage, and audio devices

The server VM is authoritative for world state; clients communicate through the RPGMUD protocol.
