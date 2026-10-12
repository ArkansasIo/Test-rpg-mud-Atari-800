# MMORPG Feature Specification

The project remains a text-based MUD. MMORPG systems extend the game-state model rather than replacing text commands.

## Character progression
- persistent characters
- levels and experience
- attributes and derived statistics
- classes and skills
- equipment and item progression
- titles, achievements, reputation

## Social
- parties and party roles
- guilds, ranks, permissions, guild bank
- friends and ignore lists
- channels, tells, mail
- group questing

## World
- persistent rooms and zones
- NPC schedules
- shops and economy
- quests and quest chains
- world bosses and events
- instanced dungeons
- resource nodes
- dynamic world announcements

## Combat
- PvE encounters
- optional PvP
- threat/aggro
- status effects
- cooldowns
- skills and spells
- loot tables
- death/recovery

## MMO infrastructure
- account/session service
- shard/zone routing
- party/guild state
- persistence and recovery
- chat service
- mail service
- moderation/audit tools
- metrics and health checks

All authoritative state remains server-side and is representable through text commands/events.
