#!/usr/bin/env python3
"""Validate that every manifest path is present and report missing files."""
from pathlib import Path
import json

ROOT=Path(__file__).resolve().parents[1]
MANIFEST=ROOT/"tools"/"production_manifest.json"

def main():
    data=json.loads(MANIFEST.read_text())
    missing=[]
    for item in data["files"]:
        path=ROOT/item["path"]
        if not path.exists():
            missing.append(item["path"])
    if missing:
        print("MISSING")
        for path in missing: print(path)
        raise SystemExit(1)
    print(f"OK: {len(data['files'])} manifest paths present")

if __name__=="__main__":
    main()
