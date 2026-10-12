#!/usr/bin/env python3
"""Deterministic source-level validation for the RPGMUD-64 VM tree."""
from pathlib import Path
import re, sys
ROOT=Path(__file__).resolve().parents[1]
roots=[ROOT/"asm"/"vm64", ROOT/"asm"/"server", ROOT/"asm"/"database", ROOT/"asm"/"game"]
files=[p for r in roots if r.exists() for p in r.rglob("*.asm")]
labels={}
errors=[]
for p in files:
    text=p.read_text(errors="replace")
    for line_no,line in enumerate(text.splitlines(),1):
        m=re.match(r"^([A-Za-z_][A-Za-z0-9_]*):",line.strip())
        if m:
            name=m.group(1)
            if name in labels:
                errors.append(f"duplicate label {name}: {p}:{line_no} and {labels[name]}")
            else:
                labels[name]=f"{p}:{line_no}"
if errors:
    print("\n".join(errors))
    sys.exit(1)
print(f"VM64 source validation PASS: {len(files)} assembly files, {len(labels)} labels")
