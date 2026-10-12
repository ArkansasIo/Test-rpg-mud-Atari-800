# RPGMUD MySQL Backend

MySQL is the durable persistence layer; it is not the gameplay engine.

Atari 800 client -> RPGMUD protocol -> RPGMUD-64 server -> assembly database ABI -> MySQL adapter -> MySQL

Assembly owns record layouts, serialization, checksums, journal semantics, transaction boundaries, and status codes.
MySQL owns durable storage, indexes, transactions, and relational persistence.

Do not commit production passwords or connection strings. Load credentials from protected runtime configuration.
Apply schema.sql to a dedicated RPGMUD database before enabling persistence.
