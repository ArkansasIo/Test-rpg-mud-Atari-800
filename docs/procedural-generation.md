# Procedural Content Generation

## Purpose

The procedural generator creates reproducible RPGMUD content as assembly/data source files.

## Generation contract

A generation run is determined by:

```
generator version + seed + configuration + schema
                 |
                 v
          deterministic RNG
                 |
                 v
        content generation
                 |
                 v
       assembly/data artifacts
                 |
                 v
             manifest
                 |
                 v
             validator
```

The same inputs should produce the same logical content.

## Generated domains

### Zones and rooms
The generator can create zone identifiers, room identifiers, descriptions, exits, terrain categories, and connectivity metadata.

### NPCs
NPC records can be generated from role templates, level ranges, stat profiles, behavior categories, and loot references.

### Items
Items can be produced from item families, rarity weights, stat ranges, equipment slots, and material templates.

### Quests
Quest generation combines objectives, target types, locations, reward bands, prerequisites, and narrative templates.

### Encounters
Encounter generation creates deterministic groups of NPCs, difficulty bands, reward profiles, and encounter identifiers.

## Seed discipline

Seeds must be explicit. Do not use host-dependent entropy for production generation.

Recommended provenance:

```
generator_id
generator_version
seed
config_hash
schema_version
generated_at
```

The timestamp is metadata only and must not affect generated gameplay values.

## Weighted selection

For a set of weights (w_i), choose an item using a deterministic random value (r):

```
target = r mod sum(w_i)
```

Then walk the cumulative weight intervals until the selected bucket is reached.

## Identifier generation

Identifiers should be stable and machine-readable. A generated identifier should not depend on filesystem ordering.

## Validation

Generated content must pass:
- duplicate-ID detection;
- reference validation;
- range validation;
- graph/connectivity checks for rooms;
- reward consistency;
- schema validation;
- deterministic regeneration comparison.

## Output policy

Generated content belongs under `data/generated/` or another explicitly generated tree. Generated output should not silently overwrite handwritten source.

## Future generator stages

1. schema loader;
2. deterministic RNG;
3. template resolver;
4. zone generator;
5. NPC generator;
6. item generator;
7. quest generator;
8. encounter generator;
9. manifest writer;
10. validator;
11. reproducibility test.

## Design rule

The generator generates content, not arbitrary program logic. Runtime behavior remains in reviewed assembly modules.
