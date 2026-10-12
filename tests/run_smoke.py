#!/usr/bin/env python3
"""Run deterministic smoke checks against the repository's core source contracts."""
from pathlib import Path
import sys
ROOT=Path(__file__).resolve().parents[1]
required=[
 "asm/vm64/opcodes.inc",
 "asm/vm64/cpu.asm",
 "asm/vm64/memory.asm",
 "asm/vm64/interpreter.asm",
 "asm/server/integration.asm",
 "asm/database/transaction.asm",
 "asm/game/combat_engine.asm",
 "asm/client/atari2600_audio.asm",
 "asm/client/atari2600_music.asm",
]
missing=[p for p in required if not (ROOT/p).exists()]
if missing:
    print("SMOKE FAIL")
    print("\n".join(missing))
    sys.exit(1)
print(f"SMOKE PASS: {len(required)} required core files present")
