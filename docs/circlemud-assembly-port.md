# CircleMUD-Style Assembly Port Plan

This repository targets a clean-room assembly implementation of the major CircleMUD gameplay and engine subsystems. It does not copy the original C source line-for-line. The upstream project is a C codebase with its own license; review that license before importing any source or data.

## Coverage map

- Runtime: boot, main loop, pulse scheduler, shutdown/restart, logging
- Networking: listener abstraction, descriptor/session table, input/output queues, line framing, Telnet negotiation
- Login: name validation, password verifier interface, character creation, reconnect, disconnect
- Commands: parser, aliases, command table, permissions, help
- World: room/exit/object/mobile indexes, world loader, zone resets, persistence
- Characters: player/NPC records, attributes, conditions, skills, classes, experience
- Movement: exits, doors, followers, visibility, room broadcasts
- Combat: attack rounds, hit resolution, armor, damage, death, corpse, rewards
- Magic: spells, targeting, mana, affects, cooldowns
- Items: object prototypes, inventory, equipment, containers, weight, wear slots
- Social: say, tell, shout, channels, socials, ignore, mail
- Economy: shops, buying/selling, currencies, player market extension
- Groups: parties, followers, guilds and raids
- Quests: objectives, triggers, rewards, quest chains
- Administration: admin commands, bans, mute, audit log, shutdown
- Persistence: record serialization, journal, atomic save, recovery, indexes
- Extensions: triggers and special procedures represented as data-driven assembly dispatch
- Testing: parser vectors, combat vectors, persistence round-trip, protocol tests

## Target architecture

The Atari 800 6502 client is a compact text terminal client. The RPGMUD-64 server is a separately specified virtual machine with 64-bit addressing and registers. A 6502 instruction set does not itself become 64-bit; the server ISA/ABI must be explicitly defined.

## Implementation status

Files named as systems/services are currently module boundaries and entry-point stubs unless they contain actual instruction sequences. They must not be described as complete implementations until algorithms, memory layouts, platform I/O and tests are added.
