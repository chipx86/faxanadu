.segment "HEADER"


INES_MAPPER = 1
INES_PRG = 16
INES_MIRROR = 1
INES_SRAM = 0

.byte 'N', 'E', 'S', $1A ; ID
.byte $10 ; 16k PRG chunk count
.byte $00 ; 8k CHR chunk count
.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
.byte (INES_MAPPER & %11110000)
.byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding
