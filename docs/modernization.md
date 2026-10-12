# Modern Client and Server Specification

The project remains a text-based RPG/MUD.

## Atari 800 client
The Atari profile retains its 6502 execution model and Atari-compatible I/O while adding:
- structured text windows
- status/header rendering
- scrolling room and combat log
- command history
- abbreviations and aliases
- color/attribute support where available
- compact inventory and character panels
- reconnect/session state
- protocol framing

## Modern client
The modern client remains text-first but can run on a contemporary terminal or terminal-like UI:
- UTF-8 text
- ANSI styling
- resizable panes
- character/status pane
- room pane
- combat/event pane
- inventory pane
- chat pane
- command completion
- key bindings
- accessibility/plain-text mode

## Modern server
The RPGMUD-64 server is the authoritative runtime:
- 64-bit virtual machine architecture
- 6502-compatible assembly programming model
- session/authentication service
- world and room service
- combat service
- inventory/item service
- persistence service
- cluster/router service
- administrative console
- audit/security layer

The presentation layer never becomes authoritative. Movement, combat, inventory, permissions, and character state are validated by the server.
