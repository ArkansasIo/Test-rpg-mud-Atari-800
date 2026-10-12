# Scripted CircleMUD-to-Assembly Port Workflow

Run from a machine with Git and Bash:

```bash
bash tools/port_circlemud.sh .
```

The script clones the upstream CircleMUD source into `reference/CircleMUD`, creates a sorted C/header manifest, and generates clean-room assembly stubs under `porting/circlemud/asm`.

It does **not** translate C to assembly automatically. Correct translation requires per-subsystem work: structures and memory layout, socket/Telnet I/O, command dispatch, world/database loaders, combat, magic, shops, player persistence, and tests. The upstream source remains isolated from the project runtime. Review the upstream license before redistributing upstream files or derivative code.

The default upstream is the public CircleMUD mirror at https://github.com/Yuffster/CircleMUD. Override it with `CIRCLEMUD_UPSTREAM_URL` if you have a different authorized source checkout.
