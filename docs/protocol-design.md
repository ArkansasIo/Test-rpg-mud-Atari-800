# RPGMUD Protocol Design

## Purpose

The protocol transports player intents and authoritative server events between the Atari client and server.

## Frame model

A frame contains an opcode/type, payload length, and payload bytes. Length validation occurs before dispatch.

## Client-to-server

Examples:
- login;
- movement;
- look;
- combat intent;
- inventory operation;
- quest interaction;
- chat;
- guild/party operation.

## Server-to-client

Examples:
- character state;
- stats;
- combat result;
- loot;
- world update;
- chat;
- mail;
- market;
- party/guild updates.

## Security

The client is never authoritative for:
- health;
- currency;
- inventory ownership;
- quest completion;
- combat results;
- permissions;
- position validity.

All such state is verified server-side.

## Compatibility

Protocol constants are maintained in shared include files. Changing a public opcode requires a versioning strategy and client compatibility review.
