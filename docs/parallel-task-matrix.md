# RPGMUD Parallel Port Task Matrix

Task IDs are stable integration IDs.

| ID | Workstream | Path | Depends on | Definition of done |
|---|---|---|---|---|
| SRV-001 | Output queue | asm/server/output_queue.asm | ABI-001 | Bounded enqueue/dequeue/clear routines with full/empty status |
| SRV-002 | Descriptor table | asm/server/descriptor_table.asm | ABI-001 | Allocate, release, lookup and validate session descriptors |
| DB-001 | Serialization | asm/database/serialization.asm | ABI-001 | Fixed-width record pack/unpack with bounds checks |
| DB-002 | Journal | asm/database/journal.asm | DB-001 | Append sequence, type, payload and checksum with capacity handling |
| GAME-001 | Stats | asm/game/stats.asm | ABI-001 | Deterministic modifier calculation and stat validation |
| GAME-002 | Inventory | asm/game/inventory.asm | ABI-001, DB-001 | Bounded insert/remove/find with deterministic slot behavior |
| PROTO-001 | Frame validation | asm/protocol/mmorpg_protocol.asm | ABI-001 | Validate opcode, length and payload bounds |
| CLIENT-001 | Command menu | asm/client/command_menu.asm | PROTO-001 | Static command table and command lookup interface |
| ABI-001 | Integration ABI | asm/shared/abi.inc | — | Common status codes, calling convention and register ownership |
| INT-001 | Server integration | asm/server | SRV-001, SRV-002, PROTO-001 | Queue/session/protocol path linked through one dispatcher |
| INT-002 | Persistence integration | asm/database | DB-001, DB-002 | Serialization and journal share record/checksum conventions |
| INT-003 | Gameplay integration | asm/game | GAME-001, GAME-002 | Stats and inventory callable from character/game services |
| INT-004 | Atari integration | asm/client | CLIENT-001, PROTO-001 | Client command path encodes and validates protocol frames |
| TEST-001 | Assembly validation | asm/tests | INT-001..INT-004 | Deterministic vectors exercise success/error/capacity paths |

## Execution model

The first eight implementation tasks are independent work units. ABI-001 is the shared contract and must remain stable while those units are implemented. Integration tasks run only after their declared dependencies are complete.

## Status vocabulary

- TODO — not started
- ACTIVE — implementation in progress
- REVIEW — implementation present, validation pending
- DONE — implementation and deterministic tests pass
- BLOCKED — dependency or toolchain prevents completion
