# Atari Build Contract

The source is organized for a ca65-compatible 6502 toolchain.

Required production artifacts:
- object files
- linker configuration
- Atari XEX executable
- reproducible build manifest

The networking adapter must be selected for the actual Atari hardware expansion being used. The base Atari 800 does not contain a generic Ethernet interface.