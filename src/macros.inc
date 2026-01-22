.macro bank_offset_16 expr
  .word ((expr) & $FFFF) - $8000
.endmacro


.macro pointer expr
  .word ((expr) & $FFFF)
.endmacro
