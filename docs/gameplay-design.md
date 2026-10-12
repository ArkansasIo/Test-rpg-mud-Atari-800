# Gameplay Systems Design

## Character

Characters have identity, level, experience, attributes, resources, equipment, inventory, quests, social memberships, and world position.

## Combat

Combat is server-authoritative:

```
intent
 -> target validation
 -> ability validation
 -> attack/defense calculation
 -> damage/result
 -> resource/state mutation
 -> combat event
```

The combat engine must never accept client-supplied damage as truth.

## Quests

Quest lifecycle:
1. available;
2. accepted;
3. in progress;
4. completed;
5. rewarded.

Progress must be validated against server events.

## Economy

Currency mutations use explicit award, purchase, sell, and trade operations. Balance checks occur before deductions.

## World

World movement validates:
- current room/zone;
- destination;
- exits;
- doors;
- permissions;
- instance membership;
- movement restrictions.

## Social systems

Party, guild, mail, chat, reputation, and moderation are separate services with explicit ownership.

## Content

NPCs, items, loot tables, quests, zones, encounters, bosses, recipes, factions, and events should be data-driven where practical.
