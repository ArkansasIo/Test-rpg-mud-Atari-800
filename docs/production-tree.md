# Production Tree Strategy

The repository is organized into:

- `asm/vm64/` — virtual CPU, memory, opcodes, devices, syscalls
- `asm/server/` — sessions, transport, authentication, scheduling and services
- `asm/game/` — authoritative gameplay engines
- `asm/database/` — serialization, journal, transactions and stores
- `asm/client/` — Atari client UI, input, protocol and audio
- `shared/` — protocol and ABI contracts
- `tests/` — deterministic assembly-level tests
- `config/` — deployment-safe configuration templates
- `docs/` — architecture and release documentation
- `tools/` — generators and validation tooling

The manifest-driven generator creates the repetitive file structure quickly; subsystem implementation remains a separate engineering task.
