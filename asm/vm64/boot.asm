; RPGMUD-64 virtual machine boot
.include "opcodes.inc"
.include "mmio.inc"
VM_BOOT:
        JSR VM_RESET
        JSR VM_MEMORY_INIT
        JSR DEVICE_INIT
        JSR VM_RUN
        RTS
