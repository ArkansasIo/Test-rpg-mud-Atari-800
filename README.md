# RPGMUD-64 — Aetherfall Online

## Overview

RPGMUD-64 is an assembly-first, text-native multiplayer RPG architecture combining an authentic Atari 800/6502 client with a custom 64-bit virtual server runtime.

The project is intentionally **not** a literal 64-bit 6502 processor. The server uses a custom 64-bit virtual machine (VM64) with a 6502-compatible execution/programming mode. The Atari client remains constrained by the Atari 800/6502 environment.

## Design goals

1. Deterministic server-authoritative gameplay.
2. Small, explicit ABIs between subsystems.
3. Assembly implementations with minimal hidden runtime dependencies.
4. Text-first gameplay suitable for terminals and retro hardware.
5. Data-driven world, characters, quests, items, encounters, and economy.
6. Reproducible builds and automated validation.
7. Clean-room architectural reimplementation of classic MUD concepts rather than copying proprietary implementation code.

## Architecture

```
Atari 800 / 6502 Client
        |
        | framed RPGMUD protocol
        v
Network / Session Layer
        |
        v
Command Router -> Authentication -> World Services
        |                 |
        v                 v
Gameplay Engines     Event Bus
        |                 |
        +--------+--------+
                 |
             Persistence
                 |
          Journal / Records
                 |
             VM64 Runtime
                 |
          Storage / MMIO
```

## Runtime layers

- **VM64:** registers, memory, opcodes, interpreter, MMIO, devices, boot, syscalls.
- **Server:** sessions, descriptors, queues, commands, authentication, networking, ticks, services.
- **Database:** records, serialization, checksums, journal, transactions, recovery, stores.
- **Gameplay:** characters, stats, combat, quests, NPCs, items, inventory, crafting, economy, groups, guilds, PvP, instances, raids, world events.
- **Client:** CIO, terminal rendering, protocol, command input, UI state, scrollback, audio dispatch.
- **Tooling:** generators, manifests, validators, build scripts, smoke tests, CI workflows.

## Current implementation state

The project contains executable primitives for VM dispatch, session lifecycle, transactions, combat, world movement, quest state, economy, protocol framing, client UI state, and runtime smoke paths. These are implementation milestones, not a claim that every MMORPG subsystem is production complete.

The production pipeline therefore distinguishes:
- source-tree validation;
- assembly compilation;
- VM source validation;
- runtime smoke tests;
- integration tests;
- end-to-end deployment validation.

## Build

See [docs/assembly-build.md](docs/assembly-build.md), [docs/build-validation.md](docs/build-validation.md), and [docs/production-tree.md](docs/production-tree.md).

## Documentation map

| Document | Purpose |
|---|---|
| docs/assembly-architecture.md | Low-level module architecture |
| docs/vm64-spec.md | VM64 machine and ABI specification |
| docs/mmorpg-spec.md | MMORPG functional specification |
| docs/mmorpg-systems.md | Gameplay subsystem design |
| docs/mmorpg-commands.md | Player command model |
| docs/world-design.md | World and zone model |
| docs/classes.md | Class architecture |
| docs/progression.md | XP, levels, skills, progression |
| docs/content-model.md | Data/content definitions |
| docs/circlemud-assembly-port.md | Clean-room MUD feature mapping |
| docs/modernization.md | Modern terminal/client extensions |
| docs/build-validation.md | Validation strategy |
| docs/implementation-status.md | Current implementation matrix |
| docs/subsystem-matrix.md | Ownership and dependencies |
| docs/parallel-task-matrix.md | Parallel engineering work |
| docs/production-tree.md | Generated source-tree contract |
| docs/batch-generation.md | Generator workflow |
| docs/code-generation.md | Generator design |
| docs/assembly-build.md | Assembly build instructions |

## Engineering rule

A generated file is a scaffold only until it contains an explicit contract, data layout, error behavior, and implementation or an intentionally documented boundary. Do not represent a stub as production-complete.
