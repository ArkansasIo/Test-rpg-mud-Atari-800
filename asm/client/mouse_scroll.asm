; Mouse scroll / scrollback controller
; Wheel input: A = signed wheel delta (+1 up, -1 down).
; Maintains a bounded viewport into the text scrollback buffer.

SCROLL_TOP:    .word 0
SCROLL_BOTTOM: .word 0
SCROLL_POS:    .word 0
SCROLL_PAGE:   .word 20
SCROLL_MIN:    .word 0

MOUSE_SCROLL_INIT:
        LDA #0
        STA SCROLL_POS
        STA SCROLL_POS+1
        RTS

; A = wheel delta. Positive = toward older text/up; negative = toward newer text/down.
MOUSE_SCROLL:
        CMP #0
        BEQ MS_DONE
        BPL MS_UP

; Scroll toward newest text.
MS_DOWN:
        LDA SCROLL_POS
        CMP SCROLL_BOTTOM
        BNE MS_DOWN_ONE
        LDA SCROLL_POS+1
        CMP SCROLL_BOTTOM+1
        BEQ MS_DONE
MS_DOWN_ONE:
        INC SCROLL_POS
        BNE MS_DONE
        INC SCROLL_POS+1
        RTS

; Scroll toward oldest text.
MS_UP:
        LDA SCROLL_POS
        ORA SCROLL_POS+1
        BEQ MS_DONE
        LDA SCROLL_POS
        BNE MS_UP_ONE
        DEC SCROLL_POS+1
MS_UP_ONE:
        DEC SCROLL_POS
MS_DONE:
        RTS

; Set current scrollback bounds.
; A/X = bottom position, Y is reserved.
MOUSE_SCROLL_SET_BOTTOM:
        STA SCROLL_BOTTOM
        STX SCROLL_BOTTOM+1
        RTS

; Return current position in A/X.
MOUSE_SCROLL_GET_POS:
        LDA SCROLL_POS
        LDX SCROLL_POS+1
        RTS
