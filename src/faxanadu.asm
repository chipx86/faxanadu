.feature string_escapes;

; Write the iNES header.
.segment "HEADER"
.ORG $0000;

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


.INCLUDE "DEFS.asm"

.ORG $0000
.INCLUDE "RAM.asm"

.ORG $2000
.INCLUDE "PPU.asm"

.ORG $4000
.INCLUDE "APU_IO.asm"

.INCLUDE "PRG0.asm"
.INCLUDE "PRG1.asm"
.INCLUDE "PRG2.asm"
.INCLUDE "PRG3.asm"
.INCLUDE "PRG4.asm"
.INCLUDE "PRG5.asm"
.INCLUDE "PRG6.asm"
.INCLUDE "PRG7.asm"
.INCLUDE "PRG8.asm"
.INCLUDE "PRG9.asm"
.INCLUDE "PRG10.asm"
.INCLUDE "PRG11.asm"
.INCLUDE "PRG12.asm"
.INCLUDE "PRG13.asm"
.INCLUDE "PRG14.asm"
.INCLUDE "PRG15_MIRROR.asm"
