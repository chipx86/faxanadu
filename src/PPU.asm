;============================================================================
; Faxanadu (U).nes
;
; PPU ($2000 - $2007)
;============================================================================

BASE $2000

;
; XREFS:
;     FUN_PRG15_MIRROR__d654
;     FUN_PRG15_MIRROR__d673
;     Game_Init
;     PPUBuffer_Draw
;     PPU_HandleOnInterrupt
;     PPU_InitVBlank
;     PPU_SetVRAMIncrementAdd1Across
;
PPUCTRL:                                    ; [$2000]
    db $00                                  ; [$2000] PPUCtrlFlags

;
; XREFS:
;     Game_Init
;     OnInterrupt
;     PPU_HandleOnInterrupt
;
PPUMASK:                                    ; [$2001]
    db $00                                  ; [$2001] PPUMaskFlags

;
; XREFS:
;     DEADCODE_FUN_PRG15_MIRROR__cb0c
;     Game_Init
;     PPU_HandleOnInterrupt
;
PPUSTATUS:                                  ; [$2002]
    db $00                                  ; [$2002] PPUStatusFlags

;
; XREFS:
;     OnInterrupt
;
OAMADDR:                                    ; [$2003]
    db $00                                  ; [$2003] byte

OAMDATA:                                    ; [$2004]
    db $00                                  ; [$2004] byte

;
; XREFS:
;     PPU_HandleOnInterrupt
;
PPUSCROLL:                                  ; [$2005]
    db $00                                  ; [$2005] byte

;
; XREFS:
;     PasswordScreen_Show
;     StartScreen_Draw
;     CHR_LoadTilesetPages
;     FUN_PRG15_MIRROR__ce80
;     FUN_PRG15_MIRROR__d654
;     FUN_PRG15_MIRROR__d673
;     FUN_PRG15_MIRROR__d699
;     FUN_PRG15_MIRROR__d6b1
;     FUN_PRG15_MIRROR__fbaf
;     PPUBuffer_Command_RotateTilesRight1Pixel
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_WritePalette
;     PPU_ClearAllTilemaps
;     PPU_LoadGlyphsForStrings
;     PPU_SetAddr
;     PPU_WriteTilesFromCHRRAM
;     UI_DrawStatusSymbols
;     UI_SetHUDPPUAttributes
;
PPUADDR:                                    ; [$2006]
    db $00                                  ; [$2006] byte

;
; XREFS:
;     PasswordScreen_Show
;     StartScreen_Draw
;     UI_DrawText
;     CHR_LoadTilesetPages
;     FUN_PRG15_MIRROR__ce80
;     FUN_PRG15_MIRROR__d654
;     FUN_PRG15_MIRROR__d673
;     FUN_PRG15_MIRROR__d699
;     FUN_PRG15_MIRROR__d6b1
;     FUN_PRG15_MIRROR__fbaf
;     PPUBuffer_Command_RotateTilesRight1Pixel
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_WritePalette
;     PPU_FillData
;     PPU_FillGrid
;     PPU_WriteGlyphTile
;     PPU_WriteTilesFromCHRRAM
;     UI_DrawStatusSymbols
;     UI_SetHUDPPUAttributes
;
PPUDATA:                                    ; [$2007]
    db $00                                  ; [$2007] byte
