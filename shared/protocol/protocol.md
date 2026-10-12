# RPGMUD/1 Protocol

Line-oriented UTF-8 protocol.

Client commands:
AUTH <user> <password>
LOOK
MOVE <direction>
SAY <text>
ATTACK <target>
INVENTORY
WHO
QUIT

Server messages:
OK <request>
ERR <code> <message>
ROOM <id> <title>
DESC <text>
EVENT <type> <payload>

The server is authoritative for all state-changing operations.
