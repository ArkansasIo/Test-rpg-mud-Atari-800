# Protocol Contract

RPGMUD/1 is line-oriented UTF-8. Commands are bounded and parsed server-side.

State-changing requests are authenticated and authorized before reaching the authoritative game world.

A future binary protocol can coexist behind the same command/event model without changing game semantics.