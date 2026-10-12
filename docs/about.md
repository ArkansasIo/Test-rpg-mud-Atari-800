# About RPGMUD-64

## Project summary

RPGMUD-64 is an assembly-first MMORPG/MUD platform built around a custom 64-bit virtual server and an Atari 800/6502-oriented text client.

The project intentionally combines:
- retro hardware interfaces;
- a deterministic server runtime;
- modular RPG systems;
- persistent world state;
- procedural content generation;
- automated source validation.

## Server/client relationship

The Atari client is a presentation and input endpoint. The RPGMUD-64 server is authoritative for all persistent and competitive state.

## Virtual architecture clarification

The term **64** refers to the server virtual machine's 64-bit address/register model. The Atari 800 client remains a 6502-class target. This distinction is part of the architecture specification and prevents confusing the virtual server ISA with physical Atari hardware.

## Original game design

The working game setting is **Aetherfall Online**, with original regions, classes, factions, characters, items, quests, encounters, and progression rules.

## Procedural content

Procedural generation is deterministic by design. Content should be reproducible from:
1. generator version;
2. seed;
3. configuration;
4. content schema.

Generated artifacts are source inputs, not opaque binary blobs.

## Engineering status

The repository has working implementation primitives across the VM, server, persistence, gameplay, protocol, client, and testing layers. Full production readiness remains a gated engineering milestone rather than an assumption.

## Intellectual-property boundary

The project may study historical MUD architecture and publicly available documentation for compatibility and design research. It does not require copying an existing game's source implementation. New runtime code should be independently authored and documented.

## See also

- `README.md`
- `docs/assembly-architecture.md`
- `docs/vm64-spec.md`
- `docs/procedural-generation.md`
- `docs/implementation-status.md`
