;============================================================================
; Faxanadu (U).nes
;
; PPU ($2000 - $2007)
;============================================================================

    .segment "PPU"
    .ORG $2000

;
; XREFS:
;     Game_Init
;     PPUBuffer_Draw
;     PPU_HandleOnInterrupt
;     PPU_InitVBlank
;     PPU_SetVRAMIncrementAdd1Across
;     Screen_WriteScrollHorizPPUTileData
;     Screen_WriteScrollVertPPUTileData
;
PPUCTRL:                                    ; [$2000]
    .byte $00                               ; [$2000] PPUCtrlFlags

;
; XREFS:
;     Game_Init
;     OnInterrupt
;     PPU_HandleOnInterrupt
;
PPUMASK:                                    ; [$2001]
    .byte $00                               ; [$2001] PPUMaskFlags

;
; XREFS:
;     DEADCODE_FUN_PRG15_MIRROR__cb0c
;     Game_Init
;     PPU_HandleOnInterrupt
;
PPUSTATUS:                                  ; [$2002]
    .byte $00                               ; [$2002] PPUStatusFlags

;
; XREFS:
;     OnInterrupt
;
OAMADDR:                                    ; [$2003]
    .byte $00                               ; [$2003] byte

OAMDATA:                                    ; [$2004]
    .byte $00                               ; [$2004] byte

;
; XREFS:
;     PPU_HandleOnInterrupt
;
PPUSCROLL:                                  ; [$2005]
    .byte $00                               ; [$2005] byte

;
; XREFS:
;     PasswordScreen_Show
;     StartScreen_Draw
;     Area_LoadTiles
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_DrawCommand_WritePalette
;     PPU_ClearAllTilemaps
;     PPU_LoadGlyphsForStrings
;     PPU_SetAddr
;     PPU_WriteTilesFromCHRRAM
;     Screen_WriteScrollHorizPPUAttrData
;     Screen_WriteScrollHorizPPUTileData
;     Screen_WriteScrollVertPPUAttrData
;     Screen_WriteScrollVertPPUTileData
;     Sprites_LoadCommon
;     UI_DrawHUDSprites
;     UI_DrawSelectedItem
;     UI_SetHUDPPUAttributes
;
PPUADDR:                                    ; [$2006]
    .byte $00                               ; [$2006] byte

;
; XREFS:
;     PasswordScreen_Show
;     StartScreen_Draw
;     UI_DrawText
;     Area_LoadTiles
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_DrawCommand_WritePalette
;     PPU_FillData
;     PPU_FillGrid
;     PPU_WriteGlyphTile
;     PPU_WriteTilesFromCHRRAM
;     Screen_WriteScrollHorizPPUAttrData
;     Screen_WriteScrollHorizPPUTileData
;     Screen_WriteScrollVertPPUAttrData
;     Screen_WriteScrollVertPPUTileData
;     Sprites_LoadCommon
;     UI_DrawHUDSprites
;     UI_DrawSelectedItem
;     UI_SetHUDPPUAttributes
;
PPUDATA:                                    ; [$2007]
    .byte $00                               ; [$2007] byte
