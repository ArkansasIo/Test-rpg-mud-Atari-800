# Security Model

Threats include credential attacks, malformed packets, command flooding, spoofed state, privilege escalation, and database compromise.

Controls:
- scrypt password hashing
- server-side authorization
- bounded command length
- rate limiting at gateway
- least-privilege database credentials
- audit logging for administrative operations
- no secrets in Git
- deterministic server-side combat and inventory state