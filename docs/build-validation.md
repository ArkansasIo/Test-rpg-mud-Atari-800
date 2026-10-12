# Build and Validation

Validation is incremental. Atari 800 sources target a 6502 assembler such as ca65; RPGMUD-64 sources target the project's virtual-machine assembler/interpreter.

Required checks include syntax assembly, duplicate-symbol detection, bounded queue tests, journal recovery tests, protocol validation, and deterministic gameplay tick tests.

Generated boundaries and scaffolds are not considered production-complete until executable tests pass.
