# Production File Generation

The production tree is generated from `tools/production_manifest.json`.

## Workflow

1. Edit the manifest rather than manually creating repetitive files.
2. Run `python tools/generate_project_tree.py`.
3. Review generated paths.
4. Implement generated boundaries.
5. Run assembly and deterministic tests.
6. Commit the batch.

The generator is intentionally idempotent: existing files are preserved and only missing files are created.

This accelerates project scaffolding without pretending that generated `RTS` boundaries are complete implementations.
