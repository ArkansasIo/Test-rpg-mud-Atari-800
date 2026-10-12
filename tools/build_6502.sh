#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/build/atari800"
mkdir -p "$OUT"
if ! command -v ca65 >/dev/null 2>&1 || ! command -v ld65 >/dev/null 2>&1; then
  echo "ca65/ld65 not installed; Atari 6502 compilation unavailable in this environment." >&2
  exit 2
fi
ca65 "$ROOT/asm/client/main.asm" -o "$OUT/client.o"
echo "ATARI800_OBJECT=$OUT/client.o"
