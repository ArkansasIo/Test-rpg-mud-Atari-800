# RPGMUD-64 VM64 Specification

## Purpose

VM64 is the server execution environment. It provides a 64-bit virtual address/register model while supporting a compatibility-oriented 6502 programming model.

## Machine model

- 16 general-purpose 64-bit registers: R0-R15.
- 64-bit program counter.
- 64-bit stack pointer.
- 64-bit flags.
- 64-bit virtual addresses.
- Low-memory compatibility region for 6502-oriented code.
- MMIO regions for console, network, timer, storage, and other devices.

## Important distinction

A 6502 CPU is not being modified into a native 64-bit CPU. VM64 is a custom virtual architecture. Compatibility means that selected 6502 semantics can execute inside the VM.

## Instruction classes

The VM opcode layer includes categories for:
- NOP/HALT;
- arithmetic;
- load/store;
- control flow;
- system/supervisor calls.

Each opcode has a stable numeric encoding defined in `asm/vm64/opcodes.inc`.

## Execution pipeline

```
PC fetch
 -> opcode decode
 -> operand validation
 -> instruction execution
 -> flags/register update
 -> PC advance
```

## Supervisor calls

Supervisor calls provide controlled access to privileged services:
- console;
- network;
- timer;
- storage;
- event services.

Unrecognized calls must return an error and must not mutate privileged state.

## Memory safety

The VM must eventually enforce:
- address-range validation;
- executable/read/write permissions;
- stack bounds;
- MMIO access restrictions;
- supervisor/user privilege separation.

## Determinism

Gameplay execution must not depend on host pointer addresses, wall-clock scheduling, or unseeded host randomness. Random gameplay operations should consume an explicit deterministic RNG state.

## Implementation status

The repository currently contains the VM register, memory, MMIO, device, boot, opcode, interpreter, and syscall modules. The interpreter currently provides the execution boundary and basic opcode dispatch; the full instruction semantics and production memory protection remain implementation work.
