# RPGMUD-64 / Aetherfall Online

## About

RPGMUD-64 is an assembly-first, text-native multiplayer role-playing game platform designed around a custom 64-bit virtual server architecture and an authentic Atari 800/6502-oriented client.

The project combines retro-computing constraints with modern server concepts: authoritative simulation, deterministic protocols, persistent records, procedural content generation, automated validation, and modular gameplay services.

## Project identity

**Project:** RPGMUD-64  
**Game/world codename:** Aetherfall Online  
**Primary client target:** Atari 800 / 6502  
**Server architecture:** RPGMUD-64 VM  
**Primary implementation language:** Assembly, with Python tooling for generation and validation

## What the project is

The system is a text-first MMORPG/MUD. Players interact through commands, terminal panels, status displays, combat logs, chat, inventory, quests, social systems, and world navigation.

The server remains authoritative. A client submits an intent; the server validates it, applies game rules, persists state when required, and sends the resulting event back to the client.

## Architecture

```
Atari 800 / 6502 client
        |
   RPGMUD protocol
        |
 session / command layer
        |
 RPGMUD-64 VM + server
        |
 gameplay engines
        |
 persistence / journal
        |
 durable storage
```

RPGMUD-64 is a virtual architecture. It does **not** claim that the physical 6502 processor has native 64-bit registers. The compatibility layer allows 6502-oriented code and semantics to participate in a 64-bit server execution model.

## Procedural generation

The repository is designed to support deterministic procedural generation of:
- zones;
- rooms;
- exits;
- NPCs;
- items;
- quests;
- encounters;
- loot tables;
- recipes;
- factions;
- world events.

A seed, configuration, and generator version form the reproducibility boundary. Generated source is validated before it is treated as build input.

## Development status

The project contains implemented runtime primitives and extensive architecture/source scaffolding. Production completeness is tracked explicitly; individual files are not considered finished merely because they exist.

Release-quality status requires compilation, tests, persistence recovery, protocol compatibility, and end-to-end validation.

## Attribution and clean-room policy

Classic MUD concepts such as rooms, zones, NPCs, commands, combat, quests, guilds, and persistent characters are general design concepts.

Where an existing MUD implementation is consulted for feature research, this project uses its behavior and architecture as a reference while implementing original assembly code. Upstream implementation bodies are not copied into this repository unless their licensing has been reviewed and permits that use.

## Repository organization

- `asm/` — assembly runtime and gameplay source
- `shared/` — protocol and shared definitions
- `data/` — game/content data and generated content
- `tests/` — assembly and integration tests
- `tools/` — generators, validators, and build tooling
- `docs/` — architecture and engineering documentation

## License

No project license is asserted by this document. A repository license should be selected explicitly before redistribution or third-party contribution.

## Maintenance principle

Documentation, source contracts, generators, and tests are maintained together. A generated file should identify its generator and seed/configuration provenance where practical.
