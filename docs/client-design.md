# Atari Client Design

## Purpose

The client provides a text-native MMORPG interface suitable for the Atari 800 and compatible terminal concepts.

## UI states

- Login
- World
- Inventory
- Chat
- Status

## Input flow

```
keyboard/CIO
 -> command buffer
 -> validation
 -> protocol encoding
 -> network send
```

## Output flow

```
network receive
 -> frame validation
 -> event decode
 -> UI state update
 -> terminal renderer
```

## Design principles

- No authoritative gameplay logic on the client.
- Graceful handling of dropped or malformed frames.
- Compact text rendering.
- Scrollback for combat/chat history.
- Clear separation between command entry and server events.
- Optional audio feedback through an event dispatcher.

## Hardware distinction

Atari 800 audio should target POKEY. Atari 2600 TIA-oriented audio modules are separate compatibility experiments and must not be treated as Atari 800 POKEY drivers.
