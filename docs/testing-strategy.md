# Testing Strategy

## Test levels

### 1. Static validation
- manifest validation;
- duplicate-label checks;
- generated-tree cleanliness.

### 2. Assembly tests
Assemble isolated modules and integration targets with CC65 tools.

### 3. Runtime smoke tests
Verify initialization, opcode dispatch, queues, persistence primitives, and core gameplay paths.

### 4. Integration tests
Exercise:
- login;
- authentication;
- world entry;
- movement;
- combat;
- inventory;
- quest;
- persistence;
- logout.

### 5. End-to-end tests
Run client/server interaction against a controlled test world.

## Required invariants

- Unauthorized sessions cannot enter the world.
- Invalid frames are rejected.
- Rate limits cannot be bypassed by malformed commands.
- Currency cannot become negative through purchase operations.
- Client state cannot directly mutate authoritative records.
- Incomplete transactions recover safely.
- Invalid VM opcodes fail closed.

## CI

GitHub Actions should validate the tree on pull requests and main-branch pushes. A green source-validation job is not equivalent to a complete MMORPG release; executable compilation and end-to-end tests must also pass.
