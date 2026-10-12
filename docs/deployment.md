# Deployment Design

## Runtime topology

A minimal deployment consists of:

```
Atari/terminal clients
        |
    TCP transport
        |
   RPGMUD server
        |
  persistence layer
        |
 durable storage
```

For scale, the server can later separate:
- login/auth;
- world zones;
- instance workers;
- chat;
- market;
- persistence;
- monitoring.

## Security

Production deployment requires:
- authenticated accounts;
- salted password verification;
- privilege separation;
- input validation;
- rate limiting;
- journal recovery;
- backups;
- structured logs;
- operator audit trails.

## Release gates

A release should require:
1. clean generated tree;
2. successful assembly/link;
3. passing unit/smoke tests;
4. passing integration tests;
5. persistence recovery test;
6. client protocol compatibility;
7. documented configuration;
8. reproducible artifact.
