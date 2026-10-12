# Assembly Architecture

## 1. Purpose

This document defines how RPGMUD-64 is divided into source modules and how those modules communicate.

## 2. Module boundaries

### VM64
Owns machine state and execution:
- opcode definitions;
- registers;
- memory;
- interpreter;
- devices;
- MMIO;
- boot;
- syscalls.

### Server
Owns authority over connected players:
- descriptors;
- input/output queues;
- authentication;
- sessions;
- command parsing/routing;
- network transport;
- game ticks;
- moderation;
- persistence orchestration.

### Database
Owns durable state:
- records;
- serialization;
- checksums;
- journals;
- transactions;
- recovery;
- entity stores.

### Game
Owns rules:
- characters;
- attributes;
- resources;
- combat;
- movement;
- quests;
- NPCs;
- items;
- loot;
- crafting;
- economy;
- parties;
- guilds;
- PvP;
- instances;
- raids;
- world events.

### Client
Owns presentation and local input:
- Atari CIO;
- terminal;
- command entry;
- protocol encoding/decoding;
- UI state;
- scrollback;
- audio/event presentation.

## 3. Dependency direction

```
client -> protocol -> server -> game -> database
                         |
                         +-> VM64
```

Gameplay code must not trust client-provided authoritative state. The client requests actions; the server validates and applies them.

## 4. ABI rule

Public routines must define:
- inputs;
- outputs;
- registers modified;
- error codes;
- ownership of buffers;
- persistence side effects.

The shared ABI currently defines zero as success and non-zero values as categorized failures.

## 5. Tick model

The authoritative server loop is conceptually:

```
poll input
 -> authenticate/session update
 -> parse and rate-limit commands
 -> execute gameplay intents
 -> publish events
 -> update world/combat timers
 -> persist dirty state
 -> flush output
```

The implementation may split these stages across modules, but ordering must preserve deterministic authority.

## 6. Error handling

Subsystems return compact ABI status values rather than printing directly. Presentation layers convert errors into user-visible text.
