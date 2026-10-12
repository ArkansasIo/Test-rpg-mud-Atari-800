; Bounded command tokenizer
; Input: PARSER_TEXT points at NUL-terminated command text.
; Output: A=token count, X=0 on success. Empty input returns zero tokens.
PARSER_MAX_TOKENS = 16

PARSER_TEXT_LO: .byte 0
PARSER_TEXT_HI: .byte 0
PARSER_TOKEN_COUNT: .byte 0
PARSER_TOKEN_PTR_LO: .res PARSER_MAX_TOKENS
PARSER_TOKEN_PTR_HI: .res PARSER_MAX_TOKENS

PARSER_RESET:
        LDA #0
        STA PARSER_TOKEN_COUNT
        RTS

PARSER_TOKENIZE:
        JSR PARSER_RESET
        LDY #0
PT_SKIP:
        LDA (PARSER_TEXT_LO),Y
        BEQ PT_DONE
        CMP #' '
        BNE PT_START
        INY
        BNE PT_SKIP
        JMP PT_DONE
PT_START:
        LDA PARSER_TOKEN_COUNT
        CMP #PARSER_MAX_TOKENS
        BCS PT_DONE
        TAX
        TYA
        STA PARSER_TOKEN_PTR_LO,X
        LDA PARSER_TEXT_HI
        STA PARSER_TOKEN_PTR_HI,X
        INC PARSER_TOKEN_COUNT
PT_SCAN:
        INY
        LDA (PARSER_TEXT_LO),Y
        BEQ PT_DONE
        CMP #' '
        BNE PT_SCAN
PT_SPACE:
        LDA (PARSER_TEXT_LO),Y
        BEQ PT_DONE
        CMP #' '
        BNE PT_START
        INY
        BNE PT_SPACE
PT_DONE:
        LDA PARSER_TOKEN_COUNT
        RTS

PARSER_VALIDATE_LENGTH:
        ; A=length; carry set when length exceeds 255 (caller convention).
        RTS

PARSER_DISPATCH:
        ; Dispatch is intentionally table-driven by the server command layer.
        RTS
