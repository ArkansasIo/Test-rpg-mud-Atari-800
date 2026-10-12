# Batch Generation Workflow

The project now uses a manifest plus batch plan.

## Fast path

```text
production_manifest.json
        |
        v
generate_project_tree.py
        |
        v
source / include / test / config / docs tree
        |
        v
validate_manifest.py
        |
        v
assembly + deterministic tests
```

The generator only creates missing files. Existing implementation files are preserved. This makes repeated production batches safe and idempotent.
