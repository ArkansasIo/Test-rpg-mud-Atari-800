#!/usr/bin/env python3
"""Generate missing RPGMUD source/documentation scaffolds from a declarative manifest."""
from pathlib import Path
import json, hashlib

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "tools" / "production_manifest.json"

def render(spec):
    kind = spec["kind"]
    name = spec["name"]
    if kind == "asm":
        return f"; Generated module: {name}\n; Implementation status: boundary\n{name.upper()}_INIT: RTS\n{name.upper()}_TICK: RTS\n"
    if kind == "inc":
        return f"; Generated include: {name}\n"
    if kind == "test":
        return f"; Deterministic test: {name}\nTEST_{name.upper()}: RTS\n"
    if kind == "md":
        return f"# {name}\n\nGenerated production-build documentation boundary.\n"
    if kind == "cfg":
        return f"# {name}\n# Generated configuration template; no credentials.\n"
    return ""

def main():
    data=json.loads(MANIFEST.read_text())
    created=0
    skipped=0
    for spec in data["files"]:
        path=ROOT/spec["path"]
        path.parent.mkdir(parents=True, exist_ok=True)
        if path.exists():
            skipped += 1
            continue
        path.write_text(render(spec), encoding="utf-8")
        created += 1
    print(json.dumps({"created":created,"skipped":skipped,"manifest":str(MANIFEST)}))

if __name__ == "__main__":
    main()
