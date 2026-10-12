#!/usr/bin/env python3
"""Deterministic procedural RPGMUD content generator.

This tool emits assembly include files and a manifest. It is deliberately
small and dependency-free so generation can run in CI and on retro-project
build machines. Runtime game rules remain in assembly; this program generates
data, not executable gameplay logic.
"""
from __future__ import annotations
import argparse, hashlib, json, random
from pathlib import Path

TERRAIN = ("PLAINS", "FOREST", "HILLS", "MARSH", "RUINS", "COAST", "CAVES", "ASHLAND")
ROLES = ("GUARD", "MERCHANT", "QUESTGIVER", "WARRIOR", "MAGE", "BEAST")
RARITIES = ("COMMON", "UNCOMMON", "RARE", "EPIC", "RELIC")

def stable_rng(seed: int, domain: str) -> random.Random:
    material = f"{seed}:{domain}".encode()
    derived = int.from_bytes(hashlib.sha256(material).digest()[:8], "little")
    return random.Random(derived)

def asm_string(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\"') + '"'

def write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8", newline="\n")

def generate(cfg: dict, root: Path) -> dict:
    seed = int(cfg["seed"])
    counts = cfg["counts"]
    out = root / cfg.get("output", "data/generated")
    manifest = {
        "generator": cfg["generator"],
        "version": cfg["version"],
        "seed": seed,
        "schema_version": cfg["schema_version"],
        "files": []
    }

    zones = []
    zrng = stable_rng(seed, "zones")
    for i in range(counts["zones"]):
        zones.append({
            "id": i + 1,
            "name": f"Generated Zone {i+1:02d}",
            "terrain": zrng.choice(TERRAIN)
        })

    zone_lines = [
        "; GENERATED FILE — DO NOT EDIT",
        f"; generator={cfg['generator']} version={cfg['version']} seed={seed}",
        ".segment "GENERATED_DATA"",
        f"GEN_ZONE_COUNT = {len(zones)}",
        "GEN_ZONE_TABLE:"
    ]
    for z in zones:
        zone_lines.append(f"    .word {z['id']} ; {z['name']} / {z['terrain']}")
    zone_path = out / "zones.inc"
    write(zone_path, "\n".join(zone_lines) + "\n")
    manifest["files"].append(str(zone_path.relative_to(root)))

    rrng = stable_rng(seed, "rooms")
    room_lines = ["; GENERATED FILE — DO NOT EDIT", ".segment "GENERATED_DATA"", "GEN_ROOM_TABLE:"]
    for z in zones:
        for n in range(counts["rooms_per_zone"]):
            room_id = z["id"] * 1000 + n + 1
            room_lines.append(f"    .word {room_id}, {z['id']} ; room {n+1}")
    write(out / "rooms.inc", "\n".join(room_lines) + "\n")
    manifest["files"].append(str((out / "rooms.inc").relative_to(root)))

    nrng = stable_rng(seed, "npcs")
    npc_lines = ["; GENERATED FILE — DO NOT EDIT", ".segment "GENERATED_DATA"", "GEN_NPC_TABLE:"]
    total_npcs = counts["zones"] * counts["npcs_per_zone"]
    for i in range(total_npcs):
        npc_id = i + 1
        level = 1 + nrng.randrange(50)
        role = nrng.choice(ROLES)
        npc_lines.append(f"    .word {npc_id}, {level} ; {role}")
    write(out / "npcs.inc", "\n".join(npc_lines) + "\n")
    manifest["files"].append(str((out / "npcs.inc").relative_to(root)))

    irng = stable_rng(seed, "items")
    item_lines = ["; GENERATED FILE — DO NOT EDIT", ".segment "GENERATED_DATA"", "GEN_ITEM_TABLE:"]
    for i in range(counts["items"]):
        item_id = i + 1
        rarity = irng.choice(RARITIES)
        power = 1 + irng.randrange(100)
        item_lines.append(f"    .word {item_id}, {power} ; {rarity}")
    write(out / "items.inc", "\n".join(item_lines) + "\n")
    manifest["files"].append(str((out / "items.inc").relative_to(root)))

    qrng = stable_rng(seed, "quests")
    quest_lines = ["; GENERATED FILE — DO NOT EDIT", ".segment "GENERATED_DATA"", "GEN_QUEST_TABLE:"]
    for i in range(counts["quests"]):
        quest_id = i + 1
        target_zone = 1 + qrng.randrange(max(1, len(zones)))
        reward = 50 + qrng.randrange(951)
        quest_lines.append(f"    .word {quest_id}, {target_zone}, {reward}")
    write(out / "quests.inc", "\n".join(quest_lines) + "\n")
    manifest["files"].append(str((out / "quests.inc").relative_to(root)))

    erng = stable_rng(seed, "encounters")
    encounter_lines = ["; GENERATED FILE — DO NOT EDIT", ".segment "GENERATED_DATA"", "GEN_ENCOUNTER_TABLE:"]
    for i in range(counts["encounters"]):
        encounter_id = i + 1
        level = 1 + erng.randrange(50)
        size = 1 + erng.randrange(5)
        encounter_lines.append(f"    .word {encounter_id}, {level}, {size}")
    write(out / "encounters.inc", "\n".join(encounter_lines) + "\n")
    manifest["files"].append(str((out / "encounters.inc").relative_to(root)))

    manifest["config_hash"] = hashlib.sha256(
        json.dumps(cfg, sort_keys=True).encode()
    ).hexdigest()
    write(out / "manifest.json", json.dumps(manifest, indent=2) + "\n")
    return manifest

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--config", default="tools/generator_config.json")
    ap.add_argument("--root", default=".")
    args = ap.parse_args()
    root = Path(args.root).resolve()
    cfg = json.loads((root / args.config).read_text(encoding="utf-8"))
    manifest = generate(cfg, root)
    print(json.dumps(manifest, indent=2))
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
