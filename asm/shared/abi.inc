; RPGMUD assembly ABI conventions
; A = status/result low byte
; X/Y = 8-bit argument/index registers in 6502 compatibility mode
; Carry set indicates failure; carry clear indicates success
ABI_OK = 0
ABI_ERR_ARGUMENT = 1
ABI_ERR_NOT_FOUND = 2
ABI_ERR_PERMISSION = 3
ABI_ERR_CAPACITY = 4
ABI_ERR_IO = 5
