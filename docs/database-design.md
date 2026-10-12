# Database Design

## Goals

RPGMUD persistence is record-oriented, journaled, recoverable, and independent of presentation.

## Core records

- Character
- Guild
- Item
- Quest
- Zone
- Instance
- World metadata

Record sizes are defined in the database include files and must remain ABI-stable once persisted data is released.

## Write path

```
game mutation
 -> dirty record
 -> transaction
 -> journal append
 -> commit
 -> durable store
```

## Recovery

Startup recovery replays or rolls back incomplete journal operations according to the transaction state.

## Checksums

Persisted records use checksums to detect corruption before deserialization.

## Transaction contract

A transaction has three logical states:
- IDLE
- ACTIVE
- COMMITTED/rolled back back to IDLE

The implementation must never expose partially committed gameplay state to readers.

## Storage backends

The assembly database layer is the authoritative interface. External databases such as MySQL, if used, are adapters rather than replacements for the game-domain record model.

## Failure policy

I/O failures must be surfaced through ABI status codes. Gameplay code should not silently treat failed persistence as success.
