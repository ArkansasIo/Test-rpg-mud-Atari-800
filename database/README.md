# Database Layer

The database is persistence, not game authority.

Tables cover accounts, characters, rooms, item prototypes, character statistics, and character inventory. Repository/service code should validate every state transition before persistence.

Production deployment should use migrations, backups, connection pooling, least-privilege database roles, and encrypted transport.
