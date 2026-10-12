# Subsystem Traceability Matrix

| Area | Assembly module family | Required acceptance test |
|---|---|---|
| Runtime | server/runtime, pulse_scheduler | stable tick sequence and graceful shutdown |
| Sessions | server/session, descriptor_table, queues | bounded allocation, disconnect cleanup |
| Protocol | protocol/*, server/telnet | framing, Telnet negotiation, malformed-input rejection |
| Login | server/login, auth/security | valid login, invalid secret, duplicate session |
| Commands | command_parser, command_table, commands | tokenization, permissions, unknown command |
| World | game/world_loader, world, zone_reset | load index, resolve exits, validate references |
| Movement | game/movement, doors, visibility | legal move, blocked exit, visibility filtering |
| Characters | game/characters, stats, resources | create/load/save round trip |
| Combat | game/combat_system, threat, death | damage, threat ordering, death and respawn |
| Magic | game/magic_system, status_effects | cost, target validation, effect expiration |
| Items | object_system, items, containers, equipment | inventory capacity and equip restrictions |
| NPCs | mobile_system, npc_system, special_dispatch | spawn, update, dispatch, extract |
| Economy | shops, vendors, currencies, market | atomic buy/sell and balance validation |
| Social | social, mail, boards, emotes | access control and message persistence |
| MMORPG | quest, party, guild, raid, instance, event | group lifecycle and objective rewards |
| Persistence | database/* | corrupt-record detection and journal recovery |
| Admin | admin_commands, moderation_service | authorization and audit trail |
