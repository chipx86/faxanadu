;============================================================================
; Faxanadu (U).nes
;
; PRG8 ($8000 - $bfff)
;============================================================================

    .segment "PRG8"
    .reloc


;============================================================================
; Offsets into the tile data for player sprites, items, and the start screen.
;
; These contain:
;
; 1. Direct references to the start of tile data for a
;    category
;
; 2. Lookup tables mapping a type of an item (e.g., weapon)
;    to the tile IDs based on the start of that category's
;    tile data.
;
; XREFS:
;     Player_LoadArmorSpriteTilesAddr
;============================================================================

;
; Address for the armor-to-tiles offsets lookup table.
;
;
; XREFS:
;     Player_LoadArmorSpriteTilesAddr
;
TILES_ARMOR_ADDRS_INDEX_REF:                ; [$8000]
    .word $0012                             ; TILES_PLAYER_ARMOR_ADDRS_INDEX
                                            ; [$PRG8::8000]


;
; Address for the weapon-to-tiles offsets lookup table.
;
;
; XREFS:
;     Player_LoadWeaponSpriteTileAddrs
;
TILES_WEAPON_ADDRS_INDEX_REF:               ; [$8002]
    .word $016b                             ; TILES_PLAYER_WEAPON_ADDRS_INDEX
                                            ; [$PRG8::8002]


;
; Start address of all armor tiles.
;
;
; XREFS:
;     Player_LoadArmorTile
;
TILES_ARMOR_START_REF:                      ; [$8004]
    .word $01a4                             ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8004]


;
; Start address of all weapon tiles.
;
;
; XREFS:
;     Player_LoadWeaponTile
;
TILES_WEAPONS_START_REF:                    ; [$8006]
    .word $0a94                             ; TILES_WEAPONS_START_DAGGER_02
                                            ; [$PRG8::8006]


;
; Start address of common game tiles.
;
;
; XREFS:
;     Sprites_LoadCommon
;
TILES_COMMON_START_REF:                     ; [$8008]
    .word $0c04                             ; TILES_COMMON_START
                                            ; [$PRG8::8008]


;
; Start address of all shield tiles.
;
;
; XREFS:
;     Player_LoadShieldTile
;
TILES_SHIELDS_START_REF:                    ; [$800a]
    .word $1104                             ; TILES_SHIELDS_START_SMALL_SHIELD_01
                                            ; [$PRG8::800a]


;
; Address for the shield-to-tiles offsets lookup table.
;
;
; XREFS:
;     Player_LoadShieldSpriteTileAddrs
;
TILES_SHIELDS_ADDRS_INDEX_REF:              ; [$800c]
    .word $018c                             ; TILES_SHIELDS_ADDRS_INDEX
                                            ; [$PRG8::800c]


;
; Address for the portrait-to-tiles offsets lookup table.
;
;
; XREFS:
;     IScripts_LoadPortraitTilesAddress
;
TILES_PORTRAITS_ADDRS_INDEX_REF:            ; [$800e]
    .word $1224                             ; SPRITE_TILES_PORTRAITS_ADDRS_INDEX
                                            ; [$PRG8::800e]


;
; Start address for all portrait tiles.
;
;
; XREFS:
;     IScripts_DrawPortraitTileToPPU
;
TILES_PORTRAITS_START_REF:                  ; [$8010]
    .word $136b                             ; SPRITE_TILES_PORTRAIT_PINKSHIRT_00
                                            ; [$PRG8::8010]


;============================================================================
; Lookup table mapping armor IDs to tile start offsets.
;
; Each offset is relative to the start of the bank. The
; address is $8000 + offset.
;
; XREFS:
;     TILES_ARMOR_ADDRS_INDEX_REF [$PRG8::8000]
;============================================================================

;
; XREFS:
;     TILES_ARMOR_ADDRS_INDEX_REF [$PRG8::8000]
;
TILES_PLAYER_ARMOR_ADDRS_INDEX:             ; [$8012]
    .word $0022                             ; TILES_PLAYER_ARMOR_LEATHER_START
                                            ; [$PRG8::8012]
    .word $00f2                             ; TILES_PLAYER_ARMOR_LEATHER_WSHIELD_START
                                            ; [$PRG8::8014]
    .word $0056                             ; TILES_PLAYER_ARMOR_STUDDED_MAIL_START
                                            ; [$PRG8::8016]
    .word $011a                             ; TILES_PLAYER_ARMOR_STUDDED_MAIL_WSHIELD_START
                                            ; [$PRG8::8018]
    .word $008a                             ; TILES_PLAYER_ARMOR_FULL_PLATE_START
                                            ; [$PRG8::801a]
    .word $0142                             ; TILES_PLAYER_ARMOR_FULL_PLATE_WSHIELD_START
                                            ; [$PRG8::801c]
    .word $00bf                             ; TILES_PLAYER_ARMOR_BATTLE_SUIT_START
                                            ; [$PRG8::801e]
    .word $00bf                             ; TILES_PLAYER_ARMOR_BATTLE_SUIT_START
                                            ; [$PRG8::8020]

;
; XREFS:
;     TILES_PLAYER_ARMOR_ADDRS_INDEX [$PRG8::8012]
;
TILES_PLAYER_ARMOR_LEATHER_START:           ; [$8022]
    .byte $00                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8022]
    .byte $01                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::8023]
    .byte $02                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_02
                                            ; [$PRG8::8024]
    .byte $03                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_03
                                            ; [$PRG8::8025]
    .byte $04                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_04
                                            ; [$PRG8::8026]
    .byte $05                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_05
                                            ; [$PRG8::8027]
    .byte $06                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::8028]
    .byte $07                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::8029]
    .byte $08                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::802a]
    .byte $09                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::802b]
    .byte $0a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_10
                                            ; [$PRG8::802c]
    .byte $0b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_11
                                            ; [$PRG8::802d]
    .byte $0c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_12
                                            ; [$PRG8::802e]
    .byte $0d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_13
                                            ; [$PRG8::802f]
    .byte $0e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::8030]
    .byte $0f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_15
                                            ; [$PRG8::8031]
    .byte $10                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_16
                                            ; [$PRG8::8032]
    .byte $11                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_17
                                            ; [$PRG8::8033]
    .byte $12                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_18
                                            ; [$PRG8::8034]
    .byte $13                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::8035]
    .byte $14                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::8036]
    .byte $29                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_21
                                            ; [$PRG8::8037]
    .byte $2a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_22
                                            ; [$PRG8::8038]
    .byte $2b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24
                                            ; [$PRG8::8039]
    .byte $2c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25
                                            ; [$PRG8::803a]
    .byte $2d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26
                                            ; [$PRG8::803b]
    .byte $2e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27
                                            ; [$PRG8::803c]
    .byte $4b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::803d]
    .byte $4c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::803e]
    .byte $4d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_29_WSHIELD_17
                                            ; [$PRG8::803f]
    .byte $4e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_30_WSHIELD_18
                                            ; [$PRG8::8040]
    .byte $4f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_31_WSHIELD_19
                                            ; [$PRG8::8041]
    .byte $50                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_32_WSHIELD_20
                                            ; [$PRG8::8042]
    .byte $51                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::8043]
    .byte $52                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8044]
    .byte $57                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8045]
    .byte $58                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::8046]
    .byte $59                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::8047]
    .byte $5a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_38_WSHIELD_26
                                            ; [$PRG8::8048]
    .byte $5b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_39_WSHIELD_27
                                            ; [$PRG8::8049]
    .byte $5c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_40_WSHIELD_28
                                            ; [$PRG8::804a]
    .byte $5d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_41_WSHIELD_29
                                            ; [$PRG8::804b]
    .byte $5e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::804c]
    .byte $5f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::804d]
    .byte $75                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::804e]
    .byte $76                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::804f]
    .byte $77                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_46_WSHIELD_34__STUDDED_052
                                            ; [$PRG8::8050]
    .byte $78                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_47_WSHIELD_35
                                            ; [$PRG8::8051]
    .byte $79                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_48_WSHIELD_36
                                            ; [$PRG8::8052]
    .byte $7a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_49_WSHIELD_37
                                            ; [$PRG8::8053]
    .byte $7b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8054]
    .byte $7c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8055]


;============================================================================
; The tiles comprising studded mail.
;
; BUG:
; SPRITE_TILES_PLAYER_ARMOR_LEATHER_46_WSHIELD_34__STUDDED_052
;      is not in this list, but should be. It's loaded via
;      the Leather armor tiles and referenced.
;============================================================================
TILES_PLAYER_ARMOR_STUDDED_MAIL_START:      ; [$8056]
    .byte $00                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8056]
    .byte $01                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::8057]
    .byte $06                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::8058]
    .byte $07                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::8059]
    .byte $08                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::805a]
    .byte $09                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::805b]
    .byte $0e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::805c]
    .byte $13                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::805d]
    .byte $14                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::805e]
    .byte $15                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_09__FULL_PLATE_02
                                            ; [$PRG8::805f]
    .byte $16                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_10__FULL_PLATE_03
                                            ; [$PRG8::8060]
    .byte $17                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_11__FULL_PLATE_04
                                            ; [$PRG8::8061]
    .byte $18                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_12__FULL_PLATE_05
                                            ; [$PRG8::8062]
    .byte $19                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_13__FULL_PLATE_10
                                            ; [$PRG8::8063]
    .byte $1a                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_14__FULL_PLATE_11
                                            ; [$PRG8::8064]
    .byte $1b                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_15__FULL_PLATE_12
                                            ; [$PRG8::8065]
    .byte $1c                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_16__FULL_PLATE_13
                                            ; [$PRG8::8066]
    .byte $1d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_17__FULL_PLATE_16
                                            ; [$PRG8::8067]
    .byte $1e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_18__FULL_PLATE_17
                                            ; [$PRG8::8068]
    .byte $1f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_19__FULL_PLATE_18
                                            ; [$PRG8::8069]
    .byte $20                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_20__FULL_PLATE_19
                                            ; [$PRG8::806a]
    .byte $2b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24
                                            ; [$PRG8::806b]
    .byte $2c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25
                                            ; [$PRG8::806c]
    .byte $2d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26
                                            ; [$PRG8::806d]
    .byte $2e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27
                                            ; [$PRG8::806e]
    .byte $2f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_25
                                            ; [$PRG8::806f]
    .byte $30                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_26
                                            ; [$PRG8::8070]
    .byte $4b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8071]
    .byte $4c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::8072]
    .byte $51                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::8073]
    .byte $52                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8074]
    .byte $53                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::8075]
    .byte $54                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::8076]
    .byte $55                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::8077]
    .byte $56                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::8078]
    .byte $57                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8079]
    .byte $58                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::807a]
    .byte $59                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::807b]
    .byte $5e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::807c]
    .byte $5f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::807d]
    .byte $60                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::807e]
    .byte $61                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::807f]
    .byte $62                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::8080]
    .byte $63                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::8081]
    .byte $75                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::8082]
    .byte $76                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::8083]
    .byte $7b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8084]
    .byte $7c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8085]
    .byte $7d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::8086]
    .byte $7e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::8087]
    .byte $7f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::8088]
    .byte $80                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::8089]

TILES_PLAYER_ARMOR_FULL_PLATE_START:        ; [$808a]
    .byte $00                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::808a]
    .byte $01                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::808b]
    .byte $15                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_09__FULL_PLATE_02
                                            ; [$PRG8::808c]
    .byte $16                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_10__FULL_PLATE_03
                                            ; [$PRG8::808d]
    .byte $17                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_11__FULL_PLATE_04
                                            ; [$PRG8::808e]
    .byte $18                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_12__FULL_PLATE_05
                                            ; [$PRG8::808f]
    .byte $21                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06
                                            ; [$PRG8::8090]
    .byte $22                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07
                                            ; [$PRG8::8091]
    .byte $08                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::8092]
    .byte $09                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::8093]
    .byte $19                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_13__FULL_PLATE_10
                                            ; [$PRG8::8094]
    .byte $1a                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_14__FULL_PLATE_11
                                            ; [$PRG8::8095]
    .byte $1b                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_15__FULL_PLATE_12
                                            ; [$PRG8::8096]
    .byte $1c                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_16__FULL_PLATE_13
                                            ; [$PRG8::8097]
    .byte $23                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_14_WSHIELD_10
                                            ; [$PRG8::8098]
    .byte $24                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_15_WSHIELD_11
                                            ; [$PRG8::8099]
    .byte $1d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_17__FULL_PLATE_16
                                            ; [$PRG8::809a]
    .byte $1e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_18__FULL_PLATE_17
                                            ; [$PRG8::809b]
    .byte $1f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_19__FULL_PLATE_18
                                            ; [$PRG8::809c]
    .byte $20                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_20__FULL_PLATE_19
                                            ; [$PRG8::809d]
    .byte $25                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_20_WSHIELD_12
                                            ; [$PRG8::809e]
    .byte $26                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_21_WSHIELD_13
                                            ; [$PRG8::809f]
    .byte $2f                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_22
                                            ; [$PRG8::80a0]
    .byte $30                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_23
                                            ; [$PRG8::80a1]
    .byte $2b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24
                                            ; [$PRG8::80a2]
    .byte $2c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25
                                            ; [$PRG8::80a3]
    .byte $2d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26
                                            ; [$PRG8::80a4]
    .byte $2e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27
                                            ; [$PRG8::80a5]
    .byte $4b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::80a6]
    .byte $4c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::80a7]
    .byte $53                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::80a8]
    .byte $54                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::80a9]
    .byte $55                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::80aa]
    .byte $56                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::80ab]
    .byte $6a                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32
                                            ; [$PRG8::80ac]
    .byte $6b                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33
                                            ; [$PRG8::80ad]
    .byte $57                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::80ae]
    .byte $58                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::80af]
    .byte $59                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::80b0]
    .byte $60                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::80b1]
    .byte $61                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::80b2]
    .byte $62                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::80b3]
    .byte $63                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::80b4]
    .byte $73                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41
                                            ; [$PRG8::80b5]
    .byte $74                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42
                                            ; [$PRG8::80b6]
    .byte $75                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::80b7]
    .byte $76                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::80b8]
    .byte $7d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::80b9]
    .byte $7e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::80ba]
    .byte $7f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::80bb]
    .byte $80                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::80bc]
    .byte $87                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49
                                            ; [$PRG8::80bd]
    .byte $88                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50
                                            ; [$PRG8::80be]

TILES_PLAYER_ARMOR_BATTLE_SUIT_START:       ; [$80bf]
    .byte $31                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_00
                                            ; [$PRG8::80bf]
    .byte $32                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_01
                                            ; [$PRG8::80c0]
    .byte $33                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_02
                                            ; [$PRG8::80c1]
    .byte $34                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_03
                                            ; [$PRG8::80c2]
    .byte $35                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_04
                                            ; [$PRG8::80c3]
    .byte $36                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_05
                                            ; [$PRG8::80c4]
    .byte $21                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06
                                            ; [$PRG8::80c5]
    .byte $22                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07
                                            ; [$PRG8::80c6]
    .byte $37                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_08
                                            ; [$PRG8::80c7]
    .byte $38                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_09
                                            ; [$PRG8::80c8]
    .byte $39                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_10
                                            ; [$PRG8::80c9]
    .byte $3a                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_11
                                            ; [$PRG8::80ca]
    .byte $3b                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_12
                                            ; [$PRG8::80cb]
    .byte $3c                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_13
                                            ; [$PRG8::80cc]
    .byte $3d                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_14
                                            ; [$PRG8::80cd]
    .byte $3e                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_15
                                            ; [$PRG8::80ce]
    .byte $3f                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_16
                                            ; [$PRG8::80cf]
    .byte $40                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_17
                                            ; [$PRG8::80d0]
    .byte $41                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_18
                                            ; [$PRG8::80d1]
    .byte $42                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_19
                                            ; [$PRG8::80d2]
    .byte $43                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_20
                                            ; [$PRG8::80d3]
    .byte $44                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_21
                                            ; [$PRG8::80d4]
    .byte $45                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_22
                                            ; [$PRG8::80d5]
    .byte $46                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_23
                                            ; [$PRG8::80d6]
    .byte $47                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_24
                                            ; [$PRG8::80d7]
    .byte $48                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_25
                                            ; [$PRG8::80d8]
    .byte $64                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_26
                                            ; [$PRG8::80d9]
    .byte $65                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_27
                                            ; [$PRG8::80da]
    .byte $66                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_28
                                            ; [$PRG8::80db]
    .byte $67                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_29
                                            ; [$PRG8::80dc]
    .byte $68                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_30
                                            ; [$PRG8::80dd]
    .byte $69                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_31
                                            ; [$PRG8::80de]
    .byte $6a                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32
                                            ; [$PRG8::80df]
    .byte $6b                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33
                                            ; [$PRG8::80e0]
    .byte $6c                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_34
                                            ; [$PRG8::80e1]
    .byte $6d                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_35
                                            ; [$PRG8::80e2]
    .byte $6e                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_36
                                            ; [$PRG8::80e3]
    .byte $6f                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_37
                                            ; [$PRG8::80e4]
    .byte $70                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_38
                                            ; [$PRG8::80e5]
    .byte $71                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_39
                                            ; [$PRG8::80e6]
    .byte $72                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_40
                                            ; [$PRG8::80e7]
    .byte $73                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41
                                            ; [$PRG8::80e8]
    .byte $74                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42
                                            ; [$PRG8::80e9]
    .byte $81                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_43
                                            ; [$PRG8::80ea]
    .byte $82                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_44
                                            ; [$PRG8::80eb]
    .byte $83                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_45
                                            ; [$PRG8::80ec]
    .byte $84                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_46
                                            ; [$PRG8::80ed]
    .byte $85                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_47
                                            ; [$PRG8::80ee]
    .byte $86                               ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_48
                                            ; [$PRG8::80ef]
    .byte $87                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49
                                            ; [$PRG8::80f0]
    .byte $88                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50
                                            ; [$PRG8::80f1]

TILES_PLAYER_ARMOR_LEATHER_WSHIELD_START:   ; [$80f2]
    .byte $00                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::80f2]
    .byte $01                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::80f3]
    .byte $89                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_02
                                            ; [$PRG8::80f4]
    .byte $8a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03
                                            ; [$PRG8::80f5]
    .byte $8b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_04
                                            ; [$PRG8::80f6]
    .byte $8c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05
                                            ; [$PRG8::80f7]
    .byte $06                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::80f8]
    .byte $07                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::80f9]
    .byte $08                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::80fa]
    .byte $09                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::80fb]
    .byte $0e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::80fc]
    .byte $13                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::80fd]
    .byte $14                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::80fe]
    .byte $49                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14
                                            ; [$PRG8::80ff]
    .byte $4a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15
                                            ; [$PRG8::8100]
    .byte $4b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8101]
    .byte $4c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::8102]
    .byte $4d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_29_WSHIELD_17
                                            ; [$PRG8::8103]
    .byte $4e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_30_WSHIELD_18
                                            ; [$PRG8::8104]
    .byte $4f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_31_WSHIELD_19
                                            ; [$PRG8::8105]
    .byte $50                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_32_WSHIELD_20
                                            ; [$PRG8::8106]
    .byte $51                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::8107]
    .byte $52                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8108]
    .byte $57                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8109]
    .byte $58                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::810a]
    .byte $59                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::810b]
    .byte $5a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_38_WSHIELD_26
                                            ; [$PRG8::810c]
    .byte $5b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_39_WSHIELD_27
                                            ; [$PRG8::810d]
    .byte $5c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_40_WSHIELD_28
                                            ; [$PRG8::810e]
    .byte $5d                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_41_WSHIELD_29
                                            ; [$PRG8::810f]
    .byte $5e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::8110]
    .byte $5f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::8111]
    .byte $75                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::8112]
    .byte $76                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::8113]
    .byte $77                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_46_WSHIELD_34__STUDDED_052
                                            ; [$PRG8::8114]
    .byte $78                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_47_WSHIELD_35
                                            ; [$PRG8::8115]
    .byte $79                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_48_WSHIELD_36
                                            ; [$PRG8::8116]
    .byte $7a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_49_WSHIELD_37
                                            ; [$PRG8::8117]
    .byte $7b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8118]
    .byte $7c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8119]

TILES_PLAYER_ARMOR_STUDDED_MAIL_WSHIELD_START: ; [$811a]
    .byte $00                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::811a]
    .byte $01                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::811b]
    .byte $8d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_02__FULL_PLATE_WSHIELD_02
                                            ; [$PRG8::811c]
    .byte $8a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03
                                            ; [$PRG8::811d]
    .byte $8e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_04__FULL_PLATE_WSHIELD_04
                                            ; [$PRG8::811e]
    .byte $8c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05
                                            ; [$PRG8::811f]
    .byte $06                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::8120]
    .byte $07                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::8121]
    .byte $08                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::8122]
    .byte $09                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::8123]
    .byte $0e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::8124]
    .byte $13                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::8125]
    .byte $14                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::8126]
    .byte $49                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14
                                            ; [$PRG8::8127]
    .byte $4a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15
                                            ; [$PRG8::8128]
    .byte $4b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8129]
    .byte $4c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::812a]
    .byte $53                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::812b]
    .byte $54                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::812c]
    .byte $55                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::812d]
    .byte $56                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::812e]
    .byte $51                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::812f]
    .byte $52                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8130]
    .byte $57                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8131]
    .byte $58                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::8132]
    .byte $59                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::8133]
    .byte $60                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::8134]
    .byte $61                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::8135]
    .byte $62                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::8136]
    .byte $63                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::8137]
    .byte $5e                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::8138]
    .byte $5f                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::8139]
    .byte $75                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::813a]
    .byte $76                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::813b]
    .byte $7d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::813c]
    .byte $7e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::813d]
    .byte $7f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::813e]
    .byte $80                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::813f]
    .byte $7b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8140]
    .byte $7c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8141]

TILES_PLAYER_ARMOR_FULL_PLATE_WSHIELD_START: ; [$8142]
    .byte $00                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8142]
    .byte $01                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::8143]
    .byte $8d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_02__FULL_PLATE_WSHIELD_02
                                            ; [$PRG8::8144]
    .byte $8a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03
                                            ; [$PRG8::8145]
    .byte $8e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_04__FULL_PLATE_WSHIELD_04
                                            ; [$PRG8::8146]
    .byte $8c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05
                                            ; [$PRG8::8147]
    .byte $21                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06
                                            ; [$PRG8::8148]
    .byte $22                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07
                                            ; [$PRG8::8149]
    .byte $08                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::814a]
    .byte $09                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::814b]
    .byte $23                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_14_WSHIELD_10
                                            ; [$PRG8::814c]
    .byte $24                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_15_WSHIELD_11
                                            ; [$PRG8::814d]
    .byte $25                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_20_WSHIELD_12
                                            ; [$PRG8::814e]
    .byte $26                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_21_WSHIELD_13
                                            ; [$PRG8::814f]
    .byte $49                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14
                                            ; [$PRG8::8150]
    .byte $4a                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15
                                            ; [$PRG8::8151]
    .byte $4b                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8152]
    .byte $4c                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::8153]
    .byte $53                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::8154]
    .byte $54                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::8155]
    .byte $55                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::8156]
    .byte $56                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::8157]
    .byte $6a                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32
                                            ; [$PRG8::8158]
    .byte $6b                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33
                                            ; [$PRG8::8159]
    .byte $57                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::815a]
    .byte $58                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::815b]
    .byte $59                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::815c]
    .byte $60                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::815d]
    .byte $61                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::815e]
    .byte $62                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::815f]
    .byte $63                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::8160]
    .byte $73                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41
                                            ; [$PRG8::8161]
    .byte $74                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42
                                            ; [$PRG8::8162]
    .byte $75                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::8163]
    .byte $76                               ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::8164]
    .byte $7d                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::8165]
    .byte $7e                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::8166]
    .byte $7f                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::8167]
    .byte $80                               ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::8168]
    .byte $87                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49
                                            ; [$PRG8::8169]
    .byte $88                               ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50
                                            ; [$PRG8::816a]


;============================================================================
; Lookup table mapping weapon IDs to tile start offsets.
;
; Each offset is relative to the start of the bank. The
; address is $8000 + offset.
;
; XREFS:
;     TILES_WEAPON_ADDRS_INDEX_REF [$PRG8::8002]
;============================================================================

;
; XREFS:
;     TILES_WEAPON_ADDRS_INDEX_REF [$PRG8::8002]
;
TILES_PLAYER_WEAPON_ADDRS_INDEX:            ; [$816b]
    .word $0173                             ; TILES_DAGGER_TILE_IDS
                                            ; [$PRG8::816b]
    .word $0176                             ; TILES_LONG_SWORD_TILE_IDS
                                            ; [$PRG8::816d]
    .word $017c                             ; TILES_GIANT_BLADE_TILE_IDS
                                            ; [$PRG8::816f]
    .word $0183                             ; TILES_DRAGON_SLAYER_TILE_IDS
                                            ; [$PRG8::8171]


;
; Dagger Tiles
;
;
; XREFS:
;     TILES_PLAYER_WEAPON_ADDRS_INDEX [$PRG8::816b]
;
TILES_DAGGER_TILE_IDS:                      ; [$8173]
    .byte $12                               ; TILE_DAGGER_01
                                            ; [$PRG8::8173]
    .byte $00                               ; TILES_WEAPONS_START_DAGGER_02
                                            ; [$PRG8::8174]
    .byte $09                               ; TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7
                                            ; [$PRG8::8175]


;
; Long Sword Tiles
;
TILES_LONG_SWORD_TILE_IDS:                  ; [$8176]
    .byte $0e                               ; TILE_LONG_SWORD_01
                                            ; [$PRG8::8176]
    .byte $0f                               ; TILE_LONG_SWORD_02
                                            ; [$PRG8::8177]
    .byte $01                               ; TILE_LONG_SWORD_03
                                            ; [$PRG8::8178]
    .byte $02                               ; TILE_LONG_SWORD_04
                                            ; [$PRG8::8179]
    .byte $0a                               ; TILE_LONG_SWORD_05
                                            ; [$PRG8::817a]
    .byte $09                               ; TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7
                                            ; [$PRG8::817b]


;
; Giant Blade Tiles
;
TILES_GIANT_BLADE_TILE_IDS:                 ; [$817c]
    .byte $10                               ; TILE_GIANT_BLADE_01
                                            ; [$PRG8::817c]
    .byte $11                               ; TILE_GIANT_BLADE_02
                                            ; [$PRG8::817d]
    .byte $03                               ; TILE_GIANT_BLADE_03
                                            ; [$PRG8::817e]
    .byte $04                               ; TILE_GIANT_BLADE_04
                                            ; [$PRG8::817f]
    .byte $05                               ; TILE_GIANT_BLADE_05
                                            ; [$PRG8::8180]
    .byte $0b                               ; TILE_GIANT_BLADE_06
                                            ; [$PRG8::8181]
    .byte $09                               ; TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7
                                            ; [$PRG8::8182]


;
; Dragon Slayer Tiles
;
TILES_DRAGON_SLAYER_TILE_IDS:               ; [$8183]
    .byte $0d                               ; TILE_DRAGON_SLAYER_01
                                            ; [$PRG8::8183]
    .byte $13                               ; TILE_DRAGON_SLAYER_02
                                            ; [$PRG8::8184]
    .byte $14                               ; TILE_DRAGON_SLAYER_03
                                            ; [$PRG8::8185]
    .byte $15                               ; TILE_DRAGON_SLAYER_04
                                            ; [$PRG8::8186]
    .byte $16                               ; TILE_DRAGON_SLAYER_05
                                            ; [$PRG8::8187]
    .byte $06                               ; TILE_DRAGON_SLAYER_06
                                            ; [$PRG8::8188]
    .byte $07                               ; TILE_DRAGON_SLAYER_07
                                            ; [$PRG8::8189]
    .byte $08                               ; TILE_DRAGON_SLAYER_08
                                            ; [$PRG8::818a]
    .byte $0c                               ; TILE_DRAGON_SLAYER_09
                                            ; [$PRG8::818b]


;============================================================================
; Lookup table mapping shield IDs to tile start offsets.
;
; Each offset is relative to the start of the bank. The
; address is $8000 + offset.
;
; XREFS:
;     TILES_SHIELDS_ADDRS_INDEX_REF [$PRG8::800c]
;============================================================================

;
; XREFS:
;     TILES_SHIELDS_ADDRS_INDEX_REF [$PRG8::800c]
;
TILES_SHIELDS_ADDRS_INDEX:                  ; [$818c]
    .word $0192                             ; TILES_SHIELDS_SMALL
                                            ; [$PRG8::818c]
    .word $0198                             ; TILES_SHIELDS_LARGE
                                            ; [$PRG8::818e]
    .word $019e                             ; TILES_SHIELDS_MAGIC
                                            ; [$PRG8::8190]


;
; Small Shield Tiles
;
;
; XREFS:
;     TILES_SHIELDS_ADDRS_INDEX [$PRG8::818c]
;
TILES_SHIELDS_SMALL:                        ; [$8192]
    .byte $00                               ; TILES_SHIELDS_START_SMALL_SHIELD_01
                                            ; [$PRG8::8192]
    .byte $01                               ; TILE_SMALL_SHIELD_02
                                            ; [$PRG8::8193]
    .byte $06                               ; TILE_SMALL_SHIELD_03
                                            ; [$PRG8::8194]
    .byte $07                               ; TILE_SMALL_SHIELD_04
                                            ; [$PRG8::8195]
    .byte $0c                               ; TILE_SMALL_SHIELD_05
                                            ; [$PRG8::8196]
    .byte $0d                               ; TILE_SMALL_SHIELD_06
                                            ; [$PRG8::8197]


;
; Large Shield Tiles
;
TILES_SHIELDS_LARGE:                        ; [$8198]
    .byte $02                               ; TILE_LARGE_SHIELD_01
                                            ; [$PRG8::8198]
    .byte $03                               ; TILE_LARGE_SHIELD_02
                                            ; [$PRG8::8199]
    .byte $08                               ; TILE_LARGE_SHIELD_03
                                            ; [$PRG8::819a]
    .byte $09                               ; TILE_LARGE_SHIELD_04
                                            ; [$PRG8::819b]
    .byte $0e                               ; TILE_LARGE_SHIELD_05
                                            ; [$PRG8::819c]
    .byte $0f                               ; TILE_LARGE_SHIELD_06
                                            ; [$PRG8::819d]


;
; Magic Shield Tiles
;
TILES_SHIELDS_MAGIC:                        ; [$819e]
    .byte $04                               ; TILE_MAGIC_SHIELD_01
                                            ; [$PRG8::819e]
    .byte $05                               ; TILE_MAGIC_SHIELD_02
                                            ; [$PRG8::819f]
    .byte $0a                               ; TILE_MAGIC_SHIELD_03
                                            ; [$PRG8::81a0]
    .byte $0b                               ; TILE_MAGIC_SHIELD_04
                                            ; [$PRG8::81a1]
    .byte $10                               ; TILE_MAGIC_SHIELD_05
                                            ; [$PRG8::81a2]
    .byte $11                               ; TILE_MAGIC_SHIELD_06
                                            ; [$PRG8::81a3]


;============================================================================
; Beginning of the armor/body tiles.
;
; XREFS:
;     TILES_ARMOR_START_REF [$PRG8::8004]
;     TILES_PLAYER_ARMOR_FULL_PLATE_START [$PRG8::808a]
;     TILES_PLAYER_ARMOR_FULL_PLATE_WSHIELD_START
;     [$PRG8::8142]
;     TILES_PLAYER_ARMOR_LEATHER_START [$PRG8::8022]
;     TILES_PLAYER_ARMOR_LEATHER_WSHIELD_START
;     [$PRG8::80f2]
;     TILES_PLAYER_ARMOR_STUDDED_MAIL_START [$PRG8::8056]
;     TILES_PLAYER_ARMOR_STUDDED_MAIL_WSHIELD_START
;     [$PRG8::811a]
;============================================================================

;
; ........
; ..░░░░░.
; .░▒░░░░░
; .░▒▒░░░░
; ..▒██░░░
; ..▒░█░█░
; .█▒██▒█░
; ..▒▒▒▒░░
;
; XREFS:
;     TILES_ARMOR_START_REF [$PRG8::8004]
;     TILES_PLAYER_ARMOR_FULL_PLATE_START [$PRG8::808a]
;     TILES_PLAYER_ARMOR_FULL_PLATE_WSHIELD_START
;     [$PRG8::8142]
;     TILES_PLAYER_ARMOR_LEATHER_START [$PRG8::8022]
;     TILES_PLAYER_ARMOR_LEATHER_WSHIELD_START
;     [$PRG8::80f2]
;     TILES_PLAYER_ARMOR_STUDDED_MAIL_START [$PRG8::8056]
;     TILES_PLAYER_ARMOR_STUDDED_MAIL_WSHIELD_START
;     [$PRG8::811a]
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00: ; [$81a4]
    .byte $00,$3e,$5f,$4f,$1f,$1f,$5b,$03   ; [$81a4] byte
    .byte $00,$00,$20,$30,$38,$2a,$7e,$3c   ; [$81ac] byte


;
; ........
; ........
; ........
; ........
; ░.......
; ░░......
; ░.......
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01: ; [$81b4]
    .byte $00,$00,$00,$00,$80,$c0,$80,$c0   ; [$81b4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$81bc] byte


;
; ..▒▒▒░░░
; ..░░░░░█
; ...▒░▒██
; ...████░
; ...███░▒
; ...▒███░
; ...▒██▒▒
; ▒█▒░░░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_02:       ; [$81c4]
    .byte $07,$3f,$0b,$1f,$1e,$0f,$0c,$5f   ; [$81c4] byte
    .byte $38,$01,$17,$1e,$1d,$1e,$1f,$e0   ; [$81cc] byte


;
; ░.......
; █▒......
; ░░░.....
; ██▒░....
; ▒██░....
; ░▒█▒░...
; ▒░▒█░...
; ░░██░...
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_03:       ; [$81d4]
    .byte $80,$80,$e0,$d0,$70,$a8,$58,$f8   ; [$81d4] byte
    .byte $00,$c0,$00,$e0,$e0,$70,$b0,$30   ; [$81dc] byte


;
; █▒▒░███▒
; ░░░░░░░░
; ...░██▒▒
; ...▒███▒
; ...░░░██
; ...▒█▒░░
; ..░██▒▒░
; ..██▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_04:       ; [$81e4]
    .byte $9e,$ff,$1c,$0e,$1f,$0b,$39,$33   ; [$81e4] byte
    .byte $ef,$00,$0f,$1f,$03,$1c,$1e,$3c   ; [$81ec] byte


;
; ░░██░...
; ░░██....
; ░██▒....
; ▒░▒.....
; ▒░......
; ░░......
; ░.......
; ░.......
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_05:       ; [$81f4]
    .byte $f8,$f0,$e0,$40,$40,$c0,$80,$80   ; [$81f4] byte
    .byte $30,$30,$70,$a0,$80,$00,$00,$00   ; [$81fc] byte


;
; .▒█▒▒░░░
; .▒█▒░.░▒
; .░█▒░..█
; .░█▒░...
; .░█▒░...
; .░█▒░...
; .██▒░...
; ██▒▒░...
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06: ; [$8204]
    .byte $27,$2a,$69,$68,$68,$68,$68,$c8   ; [$8204] byte
    .byte $78,$71,$31,$30,$30,$30,$70,$f0   ; [$820c] byte


;
; ░.......
; ░░......
; ▒▒░.....
; █▒▒.....
; .▒▒░....
; .█▒▒....
; .█▒░....
; █▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07: ; [$8214]
    .byte $80,$c0,$20,$80,$10,$40,$50,$a0   ; [$8214] byte
    .byte $00,$00,$c0,$e0,$60,$70,$60,$c0   ; [$821c] byte


;
; ..░░░░░.
; .░▒░░░░░
; .░▒▒░░░░
; ..▒██░░░
; ..▒░█░█░
; .█▒▒▒▒█░
; ..▒█▒▒░░
; ..▒▒▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08: ; [$8224]
    .byte $3e,$5f,$4f,$1f,$1f,$43,$13,$07   ; [$8224] byte
    .byte $00,$20,$30,$38,$2a,$7e,$3c,$38   ; [$822c] byte


;
; ........
; ........
; ........
; ░.......
; ░░......
; ░.......
; ░░......
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09: ; [$8234]
    .byte $00,$00,$00,$80,$c0,$80,$c0,$00   ; [$8234] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$823c] byte


;
; ..░░░▒██
; ....░███
; ...░▒▒▒▒
; ...▒█▒██
; ...▒█▒██
; ...█▒░██
; ...▒░██▒
; ...░██▒▒
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_10:       ; [$8244]
    .byte $3b,$0f,$10,$0b,$0b,$17,$0e,$1c   ; [$8244] byte
    .byte $07,$07,$0f,$1f,$1f,$1b,$17,$0f   ; [$824c] byte


;
; ░.......
; █░......
; ░░......
; ▒░......
; ▒░......
; ▒░......
; ▒░......
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_11:       ; [$8254]
    .byte $80,$c0,$c0,$40,$40,$40,$40,$c0   ; [$8254] byte
    .byte $00,$80,$00,$80,$80,$80,$80,$00   ; [$825c] byte


;
; ..░██▒▒░
; ..░▒▒▒░▒
; ...░░░█▒
; ...▒███▒
; ...▒░▒▒▒
; ...░█▒▒░
; ...░██▒░
; ...░██▒░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_12:       ; [$8264]
    .byte $39,$22,$1e,$0e,$08,$19,$1d,$1d   ; [$8264] byte
    .byte $1e,$1d,$03,$1f,$17,$0e,$0e,$0e   ; [$826c] byte


;
; ░.......
; ░.......
; ░.......
; ░.......
; ░.......
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_13:       ; [$8274]
    .byte $80,$80,$80,$80,$80,$00,$00,$00   ; [$8274] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$827c] byte


;
; ...░█▒▒.
; ....██▒░
; ....░█▒░
; ....░█▒░
; ....░█▒▒
; ....░█▒▒
; ...░███▒
; ...██▒▒.
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10: ; [$8284]
    .byte $18,$0d,$0d,$0d,$0c,$0c,$1e,$18   ; [$8284] byte
    .byte $0e,$0e,$06,$06,$07,$07,$0f,$1e   ; [$828c] byte


;
; ..▒▒▒░░░
; ....░██░
; ....░░█▒
; ....██░▒
; ...░██▒░
; ...▒█▒▒░
; ..░██▒░░
; .▒██▒░▒░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_15:       ; [$8294]
    .byte $07,$0f,$0e,$0e,$1d,$09,$3b,$35   ; [$8294] byte
    .byte $38,$06,$03,$0d,$0e,$1e,$1c,$7a   ; [$829c] byte


;
; ░.......
; ░░......
; ░░......
; ░░░.....
; ░░░.....
; ░░░░....
; ░░░░....
; ░░░░....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_16:       ; [$82a4]
    .byte $80,$c0,$c0,$e0,$e0,$f0,$f0,$f0   ; [$82a4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$82ac] byte


;
; ▒█▒▒░▒▒░
; █▒▒░░░░░
; ░░.░██▒▒
; ...▒███▒
; ...░████
; ...░░▒░░
; ...█░██▒
; ..▒█░██▒
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_17:       ; [$82b4]
    .byte $49,$9f,$dc,$0e,$1f,$1b,$1e,$1e   ; [$82b4] byte
    .byte $f6,$e0,$0f,$1f,$0f,$04,$17,$37   ; [$82bc] byte


;
; ░.▒░....
; ░█▒░....
; ░░░░....
; ░░......
; ▒░......
; ░░......
; ░.......
; ░.......
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_18:       ; [$82c4]
    .byte $90,$d0,$f0,$c0,$40,$c0,$80,$80   ; [$82c4] byte
    .byte $20,$60,$00,$00,$80,$00,$00,$00   ; [$82cc] byte


;
; ..██▒░█▒
; .▒█▒▒░██
; .▒█▒░.░█
; ..█▒░..▒
; ..█▒░...
; ..█▒░...
; .██▒░...
; ▒▒▒▒░...
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11: ; [$82d4]
    .byte $36,$27,$2b,$28,$28,$28,$68,$08   ; [$82d4] byte
    .byte $3b,$7b,$71,$31,$30,$30,$70,$f0   ; [$82dc] byte


;
; ▒.......
; ▒░......
; ▒▒......
; █▒░.....
; ▒▒▒░....
; .█▒▒....
; .█▒░....
; ▒▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12: ; [$82e4]
    .byte $00,$40,$00,$a0,$10,$40,$50,$20   ; [$82e4] byte
    .byte $80,$80,$c0,$c0,$e0,$70,$60,$c0   ; [$82ec] byte


;
; ..▒▒▒░░░
; ..░░░░░█
; ...▒░░▒░
; ..░█░██░
; ..░█░█▒░
; ...▒░▒▒░
; ...░░░░░
; ░█░░░░░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_09__FULL_PLATE_02: ; [$82f4]
    .byte $07,$3f,$0d,$3f,$3d,$09,$1f,$ff   ; [$82f4] byte
    .byte $38,$01,$12,$16,$16,$16,$00,$40   ; [$82fc] byte


;
; ░░......
; ██░.....
; ███░....
; ░░░░....
; ▒██░....
; ░▒█▒░...
; ░░▒█░...
; ░░██░...
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_10__FULL_PLATE_03: ; [$8304]
    .byte $c0,$e0,$f0,$f0,$70,$a8,$d8,$f8   ; [$8304] byte
    .byte $00,$c0,$e0,$00,$e0,$70,$30,$30   ; [$830c] byte


;
; █▒▒░██▒▒
; ░░░░░░░░
; ...░░▒░█
; ...▒░█░█
; ...▒░█░█
; ...░▒░░░
; ..░██▒▒░
; ..██▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_11__FULL_PLATE_04: ; [$8314]
    .byte $9c,$ff,$1b,$0f,$0f,$17,$39,$33   ; [$8314] byte
    .byte $ef,$00,$05,$15,$15,$08,$1e,$3c   ; [$831c] byte


;
; ░░██░...
; ░███....
; ░██▒....
; ░░░.....
; ░▒......
; ▒▒......
; ░.......
; ░.......
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_12__FULL_PLATE_05: ; [$8324]
    .byte $f8,$f0,$e0,$e0,$80,$00,$80,$80   ; [$8324] byte
    .byte $30,$70,$70,$00,$40,$c0,$00,$00   ; [$832c] byte


;
; ..░░░░██
; ....░░██
; ...░▒░░░
; ...█▒░▒█
; ...▒▒░██
; ...▒░░██
; ...░░██▒
; ...░██▒▒
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_13__FULL_PLATE_10: ; [$8334]
    .byte $3f,$0f,$17,$15,$07,$0f,$1e,$1c   ; [$8334] byte
    .byte $03,$03,$08,$1b,$1b,$13,$07,$0f   ; [$833c] byte


;
; ▒░......
; █░......
; ░░......
; ▒░......
; ▒░......
; ▒░......
; ░.......
; ░.......
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_14__FULL_PLATE_11: ; [$8344]
    .byte $40,$c0,$c0,$40,$40,$40,$80,$80   ; [$8344] byte
    .byte $80,$80,$00,$80,$80,$80,$00,$00   ; [$834c] byte


;
; ..░██▒▒░
; ..░▒▒░░▒
; ...░░█░▒
; ...█░█░▒
; ...░░░░░
; ...░█▒▒░
; ...░██▒░
; ...░██▒░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_15__FULL_PLATE_12: ; [$8354]
    .byte $39,$26,$1e,$1e,$1f,$19,$1d,$1d   ; [$8354] byte
    .byte $1e,$19,$05,$15,$00,$0e,$0e,$0e   ; [$835c] byte


;
; ░.......
; ░.......
; ░.......
; ░.......
; ░.......
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_16__FULL_PLATE_13: ; [$8364]
    .byte $80,$80,$80,$80,$80,$00,$00,$00   ; [$8364] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$836c] byte


;
; ..▒▒░▒▒░
; ...░███▒
; ....░░█▒
; ....██░▒
; ...░██▒░
; ...▒█▒▒░
; ..░░▒▒░▒
; .▒██░░▒▒
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_17__FULL_PLATE_16: ; [$8374]
    .byte $09,$1e,$0e,$0e,$1d,$09,$32,$3c   ; [$8374] byte
    .byte $36,$0f,$03,$0d,$0e,$1e,$0d,$73   ; [$837c] byte


;
; ░.......
; ░░......
; ░▒......
; ░░░.....
; ░▒░.....
; ▒░░░....
; ▒░▒░....
; ▒░░░....
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_18__FULL_PLATE_17: ; [$8384]
    .byte $80,$c0,$80,$e0,$a0,$70,$50,$70   ; [$8384] byte
    .byte $00,$00,$40,$00,$40,$80,$a0,$80   ; [$838c] byte


;
; ▒█▒▒░▒▒▒
; █▒▒░░░░░
; ░░.░░█░▒
; ...▒░█░█
; ...▒░█░█
; ...░▒░░░
; ...█░██▒
; ..▒█░██▒
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_19__FULL_PLATE_18: ; [$8394]
    .byte $48,$9f,$de,$0f,$0f,$17,$1e,$1e   ; [$8394] byte
    .byte $f7,$e0,$05,$15,$15,$08,$17,$37   ; [$839c] byte


;
; ░.▒░....
; ░█▒░....
; ░░░░....
; ░░......
; ▒░......
; ░░......
; ░.......
; ░.......
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_20__FULL_PLATE_19: ; [$83a4]
    .byte $90,$d0,$f0,$c0,$40,$c0,$80,$80   ; [$83a4] byte
    .byte $20,$60,$00,$00,$80,$00,$00,$00   ; [$83ac] byte


;
; ..███░░░
; ..█░░░.▒
; ..░░▒░..
; ..░█▒░..
; ..░█▒░..
; ..░░░░..
; ..█▒▒░..
; .██▒▒░..
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06: ; [$83b4]
    .byte $3f,$3c,$34,$34,$34,$3c,$24,$64   ; [$83b4] byte
    .byte $38,$21,$08,$18,$18,$00,$38,$78   ; [$83bc] byte


;
; ░░......
; █░░.....
; █░█░....
; .░██░...
; ..█░░...
; ..░▒▒...
; ..█▒░...
; .█▒░....
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07: ; [$83c4]
    .byte $c0,$e0,$f0,$78,$38,$20,$28,$50   ; [$83c4] byte
    .byte $00,$80,$a0,$30,$20,$18,$30,$60   ; [$83cc] byte


;
; ....██░▒
; ....█░░▒
; .....░▒▒
; .....░█▒
; .....░█▒
; .....░░░
; ....░███
; ....██▒▒
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_14_WSHIELD_10: ; [$83d4]
    .byte $0e,$0e,$04,$06,$06,$07,$0f,$0c   ; [$83d4] byte
    .byte $0d,$09,$03,$03,$03,$00,$07,$0f   ; [$83dc] byte


;
; ........
; ░.......
; ░.......
; ░.......
; ▒.......
; ░.......
; ▒.......
; ........
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_15_WSHIELD_11: ; [$83e4]
    .byte $00,$80,$80,$80,$00,$80,$00,$00   ; [$83e4] byte
    .byte $00,$00,$00,$00,$80,$00,$80,$00   ; [$83ec] byte


;
; ...█░▒░█
; ...██░░░
; ...█░░.█
; ...░▒░..
; ...█▒░..
; ...█▒░..
; ..██▒░..
; .▒▒▒▒░..
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_20_WSHIELD_12: ; [$83f4]
    .byte $1b,$1f,$1d,$14,$14,$14,$34,$04   ; [$83f4] byte
    .byte $15,$18,$11,$08,$18,$18,$38,$78   ; [$83fc] byte


;
; ▒▒......
; ░░░.....
; █░▒.....
; ░█▒░....
; .██▒░...
; ..█▒▒░..
; ..█▒░...
; .▒▒░....
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_21_WSHIELD_13: ; [$8404]
    .byte $00,$e0,$c0,$d0,$68,$24,$28,$10   ; [$8404] byte
    .byte $c0,$00,$a0,$60,$70,$38,$30,$60   ; [$840c] byte


;
; ░░......
; █▒░.....
; █▒░.....
; ░░░.....
; █▒░.....
; ▒▒░.....
; █▒░.....
; ▒▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_22:    ; [$8414]
    .byte $c0,$a0,$a0,$e0,$a0,$20,$a0,$20   ; [$8414] byte
    .byte $00,$c0,$c0,$00,$c0,$c0,$c0,$c0   ; [$841c] byte


;
; ▒░......
; ░.......
; ░.......
; ▒.......
; ▒.......
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_23:    ; [$8424]
    .byte $40,$80,$80,$00,$00,$00,$00,$00   ; [$8424] byte
    .byte $80,$00,$00,$80,$80,$00,$00,$00   ; [$842c] byte


;
; ..▒▒▒░░░
; ....░░░█
; ...█░▒██
; ..▒████░
; ..░████▒
; ...▒███░
; █▒.░▒██▒
; ▒▒█░░░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_21:       ; [$8434]
    .byte $07,$0f,$1b,$1f,$3e,$0f,$96,$3f   ; [$8434] byte
    .byte $38,$01,$17,$3e,$1f,$1e,$cf,$e0   ; [$843c] byte


;
; ░.......
; █▒......
; ░░░.....
; ██▒░....
; ▒██░....
; ░▒█▒░...
; ▒░▒█░...
; ░░██░...
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_22:       ; [$8444]
    .byte $80,$80,$e0,$d0,$70,$a8,$58,$f8   ; [$8444] byte
    .byte $00,$c0,$00,$e0,$e0,$70,$b0,$30   ; [$844c] byte


;
; .░░░▒█░█
; .░▒█░░░█
; .▒█▒░█▒░
; .█▒░██▒▒
; .▒▒░█▒▒░
; ..░▒░▒▒▒
; ...░▒░░▒
; ....░▒░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24: ; [$8454]
    .byte $77,$5f,$2d,$5c,$19,$28,$16,$0b   ; [$8454] byte
    .byte $0d,$31,$76,$6f,$6e,$17,$09,$04   ; [$845c] byte


;
; ██▒▒░...
; ▒▒▒░....
; ░░░.....
; ▒░......
; ░.......
; ▒.......
; ▒▒......
; ▒▒......
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25: ; [$8464]
    .byte $c8,$10,$e0,$40,$80,$00,$00,$00   ; [$8464] byte
    .byte $f0,$e0,$00,$80,$00,$80,$c0,$c0   ; [$846c] byte


;
; .....█▒.
; .....░▒.
; ......▒.
; ........
; ........
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26: ; [$8474]
    .byte $04,$04,$00,$00,$00,$00,$00,$00   ; [$8474] byte
    .byte $06,$02,$02,$00,$00,$00,$00,$00   ; [$847c] byte


;
; .▒......
; .▒......
; ........
; ........
; ........
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27: ; [$8484]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8484] byte
    .byte $40,$40,$00,$00,$00,$00,$00,$00   ; [$848c] byte


;
; ..▒▒▒░░░
; ....░▒░█
; ...▒░░▒░
; ..░█░██░
; ..░█░█▒░
; ..░▒░░▒▒
; █▒▒░░░░░
; ▒▒▒░▒▒░▒
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_25:       ; [$8494]
    .byte $07,$0b,$0d,$3f,$3d,$2c,$9f,$12   ; [$8494] byte
    .byte $38,$05,$12,$16,$16,$13,$e0,$ed   ; [$849c] byte


;
; ░░......
; ██░.....
; ███░....
; ░░░░....
; ▒██░....
; ░▒█▒░...
; ░░▒█░...
; ████░...
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_26:       ; [$84a4]
    .byte $c0,$e0,$f0,$f0,$70,$a8,$d8,$f8   ; [$84a4] byte
    .byte $00,$c0,$e0,$00,$e0,$70,$30,$f0   ; [$84ac] byte


;
; ........
; ..█.███░
; ..██░█▒▒
; ..███░░▒
; ..████▒░
; ...░░░░░
; ...▒▒░██
; ..████▒░
;
; XREFS:
;     TILES_PLAYER_ARMOR_BATTLE_SUIT_START [$PRG8::80bf]
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_00:   ; [$84b4]
    .byte $00,$2f,$3c,$3e,$3d,$1f,$07,$3d   ; [$84b4] byte
    .byte $00,$2e,$37,$39,$3e,$00,$1b,$3e   ; [$84bc] byte


;
; ........
; ........
; ░.......
; ▒░......
; ▒░......
; ░░......
; ░░......
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_01:   ; [$84c4]
    .byte $00,$00,$80,$40,$40,$c0,$c0,$c0   ; [$84c4] byte
    .byte $00,$00,$00,$80,$80,$00,$00,$00   ; [$84cc] byte


;
; ..███░░█
; ..██░░██
; ..▒░▒░█░
; █..░█░█░
; ░█.░█░█▒
; ░█..░░▒█
; █▒.░░█░░
; ▒░█▒░███
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_02:   ; [$84d4]
    .byte $3f,$3f,$17,$9f,$de,$cd,$9f,$6f   ; [$84d4] byte
    .byte $39,$33,$2a,$8a,$4b,$43,$c4,$b7   ; [$84dc] byte


;
; █░█░█...
; ░████...
; ██░░█...
; █░░█░...
; ░░██▒...
; ▒░██▒░..
; ░░░░░░..
; ▒░░██░..
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_03:   ; [$84e4]
    .byte $f8,$f8,$f8,$f8,$f0,$74,$fc,$7c   ; [$84e4] byte
    .byte $a8,$78,$c8,$90,$38,$b8,$00,$98   ; [$84ec] byte


;
; ░█░▒░██▒
; .░█░░░░░
; ...░▒░█░
; ....░░█░
; ....░░░░
; ....▒█▒░
; ...▒█▒▒░
; ..█░░▒░░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_04:   ; [$84f4]
    .byte $ee,$7f,$17,$0f,$0f,$05,$09,$3b   ; [$84f4] byte
    .byte $57,$20,$0a,$02,$00,$0e,$1e,$24   ; [$84fc] byte


;
; ▒░█░█░..
; ░██▒░░..
; ░█▒▒░...
; ▒░░░....
; █░░.....
; ░▒░.....
; ░░......
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_05:   ; [$8504]
    .byte $7c,$ec,$c8,$70,$e0,$a0,$c0,$c0   ; [$8504] byte
    .byte $a8,$70,$70,$80,$80,$40,$00,$00   ; [$850c] byte


;
; ..█.███░
; ..██░█▒▒
; ..███░░▒
; ..████▒░
; ...░░░░░
; ...▒▒░██
; ..████▒░
; ..███░░█
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_08:   ; [$8514]
    .byte $2f,$3c,$3e,$3d,$1f,$07,$3d,$3f   ; [$8514] byte
    .byte $2e,$37,$39,$3e,$00,$1b,$3e,$39   ; [$851c] byte


;
; ........
; ░.......
; ▒░......
; ▒░......
; ░░......
; ░░......
; █░█.....
; ██▒.....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_09:   ; [$8524]
    .byte $00,$80,$40,$40,$c0,$c0,$e0,$c0   ; [$8524] byte
    .byte $00,$00,$80,$80,$00,$00,$a0,$e0   ; [$852c] byte


;
; ..█▒░░█▒
; ..▒.░░░░
; ....░█░█
; ....██░█
; ....▒▒░█
; █...░░░█
; ▒██.░░█░
; .▒▒░▒███
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_10:   ; [$8534]
    .byte $2e,$0f,$0f,$0f,$03,$8f,$6f,$17   ; [$8534] byte
    .byte $33,$20,$05,$0d,$0d,$81,$e2,$6f   ; [$853c] byte


;
; ░░█▒....
; ▒░░░....
; █▒░.....
; █▒░.....
; █▒░.....
; ░░░.....
; █░......
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_11:   ; [$8544]
    .byte $e0,$70,$a0,$a0,$a0,$e0,$c0,$c0   ; [$8544] byte
    .byte $30,$80,$c0,$c0,$c0,$00,$80,$00   ; [$854c] byte


;
; ...░██▒▒
; ...░▒▒░░
; ....░░█░
; ....█░█░
; ....▒░░░
; ....░██▒
; ....░██▒
; ....█░█▒
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_12:   ; [$8554]
    .byte $1c,$13,$0f,$0f,$07,$0e,$0e,$0e   ; [$8554] byte
    .byte $0f,$0c,$02,$0a,$08,$07,$07,$0b   ; [$855c] byte


;
; ░░......
; ▒░......
; ▒░......
; ▒░......
; ░░......
; ░.......
; ░.......
; ░.......
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_13:   ; [$8564]
    .byte $c0,$40,$40,$40,$c0,$80,$80,$80   ; [$8564] byte
    .byte $00,$80,$80,$80,$00,$00,$00,$00   ; [$856c] byte


;
; ....██░▒
; ....█░░▒
; .....░▒▒
; .....░█▒
; .....░█▒
; .....░░░
; ....░███
; ....██▒▒
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_14:   ; [$8574]
    .byte $0e,$0e,$04,$06,$06,$07,$0f,$0c   ; [$8574] byte
    .byte $0d,$09,$03,$03,$03,$00,$07,$0f   ; [$857c] byte


;
; ........
; ░.......
; ░.......
; ░.......
; ▒.......
; ░.......
; ▒.......
; ........
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_15:   ; [$8584]
    .byte $00,$80,$80,$80,$00,$80,$00,$00   ; [$8584] byte
    .byte $00,$00,$00,$00,$80,$00,$80,$00   ; [$858c] byte


;
; ..███░█░
; ..██░░██
; ..▒.░█░░
; .....░█▒
; .....███
; ....█░█▒
; ...░█░▒░
; ░▒▒▒░█░░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_16:   ; [$8594]
    .byte $3f,$3f,$0f,$06,$07,$0e,$1d,$8f   ; [$8594] byte
    .byte $3a,$33,$24,$03,$07,$0b,$0a,$74   ; [$859c] byte


;
; █░......
; █░█.....
; ██░░....
; ░█░░....
; ░░░░░...
; ░▒░▒░░..
; ░▒░░▒▒..
; ▒░░.░░..
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_17:   ; [$85a4]
    .byte $c0,$e0,$f0,$f0,$f8,$ac,$b0,$6c   ; [$85a4] byte
    .byte $80,$a0,$c0,$40,$00,$50,$4c,$80   ; [$85ac] byte


;
; ░███▒░░▒
; ░▒▒▒░░░░
; .░░░░░█░
; ....▒░█░
; ....█░█░
; ....░▒░░
; ....█░██
; ...░█░██
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_18:   ; [$85b4]
    .byte $f6,$8f,$7f,$07,$0f,$0b,$0f,$1f   ; [$85b4] byte
    .byte $79,$70,$02,$0a,$0a,$04,$0b,$0b   ; [$85bc] byte


;
; ░░░░▒▒..
; ░░.█▒░█.
; ░░░.░░..
; █░░.░...
; █▒░.....
; ░░░.....
; ▒░......
; ▒░......
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_19:   ; [$85c4]
    .byte $f0,$d6,$ec,$e8,$a0,$e0,$40,$40   ; [$85c4] byte
    .byte $0c,$1a,$00,$80,$c0,$00,$80,$80   ; [$85cc] byte


;
; ...█░▒░█
; ...██░░░
; ...█░░.█
; ...░▒░..
; ...█▒░..
; ...█▒░..
; ..██▒░..
; .▒▒▒▒░..
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_20:   ; [$85d4]
    .byte $1b,$1f,$1d,$14,$14,$14,$34,$04   ; [$85d4] byte
    .byte $15,$18,$11,$08,$18,$18,$38,$78   ; [$85dc] byte


;
; ▒░......
; ░░......
; █░░.....
; ░█▒░....
; .██▒░...
; ..█▒░...
; ..█▒░...
; .▒▒░....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_21:   ; [$85e4]
    .byte $40,$c0,$e0,$d0,$68,$28,$28,$10   ; [$85e4] byte
    .byte $80,$00,$80,$60,$70,$30,$30,$60   ; [$85ec] byte


;
; ░█░▒░█░▒
; .░█░░░░▒
; ...░██░░
; ..░██▒▒░
; .█░█▒▒░░
; .██░░░..
; .█░▒▒░..
; ..░█▒▒░.
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_22:   ; [$85f4]
    .byte $ee,$7e,$1f,$39,$73,$7c,$64,$32   ; [$85f4] byte
    .byte $55,$21,$0c,$1e,$5c,$60,$58,$1c   ; [$85fc] byte


;
; ███░█░..
; ▒▒▒▒░░..
; ░░░░░...
; ▒▒░░....
; █▒▒░....
; ▒█▒░....
; ░░░▒▒░▒.
; ██░██▒█░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_23:   ; [$8604]
    .byte $fc,$0c,$f8,$30,$90,$50,$e4,$fb   ; [$8604] byte
    .byte $e8,$f0,$00,$c0,$e0,$e0,$1a,$de   ; [$860c] byte


;
; ...░█▒░░
; ....░░█░
; .....░█▒
; ......▒▒
; .......▒
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_24:   ; [$8614]
    .byte $1b,$0f,$06,$00,$00,$00,$00,$00   ; [$8614] byte
    .byte $0c,$02,$03,$03,$01,$00,$00,$00   ; [$861c] byte


;
; .█░▒▒░▒░
; .....░█░
; ......▒░
; .......▒
; ........
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_25:   ; [$8624]
    .byte $65,$07,$01,$00,$00,$00,$00,$00   ; [$8624] byte
    .byte $5a,$02,$02,$01,$00,$00,$00,$00   ; [$862c] byte


;
; ...░██▒▒
; ....░▒█▒
; .....░░▒
; ......▒░
; ......▒░
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14: ; [$8634]
    .byte $1c,$0a,$06,$01,$01,$00,$00,$00   ; [$8634] byte
    .byte $0f,$07,$01,$02,$02,$00,$00,$00   ; [$863c] byte


;
; ░.......
; ▒░......
; ▒░......
; ▒░......
; ▒.......
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15: ; [$8644]
    .byte $80,$40,$40,$40,$00,$00,$00,$00   ; [$8644] byte
    .byte $00,$80,$80,$80,$80,$00,$00,$00   ; [$864c] byte


;
; ........
; .....░░░
; ....░░░░
; ....░▒░░
; .....█▒░
; .....░█▒
; ....▒██▒
; .....▒▒▒
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16: ; [$8654]
    .byte $00,$07,$0f,$0b,$05,$06,$06,$00   ; [$8654] byte
    .byte $00,$00,$00,$04,$06,$03,$0f,$07   ; [$865c] byte


;
; ........
; ░░......
; ░░░.....
; ░░░.....
; ░░░░....
; ░▒░░░...
; ▒░░░....
; ░░░░░...
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17: ; [$8664]
    .byte $00,$c0,$e0,$e0,$f0,$b8,$70,$f8   ; [$8664] byte
    .byte $00,$00,$00,$00,$00,$40,$80,$00   ; [$866c] byte


;
; .....▒▒░
; .....██▒
; ██░▒█░██
; .░▒██▒██
; ░░██▒░██
; ▒██▒░░██
; ▒▒▒░░██▒
; .░░░░░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_29_WSHIELD_17: ; [$8674]
    .byte $01,$06,$ef,$5b,$f7,$6f,$1e,$7f   ; [$8674] byte
    .byte $06,$07,$db,$3f,$3b,$f3,$e7,$00   ; [$867c] byte


;
; ░░░.....
; ▒░░.....
; ▒▒▒░░...
; ▒▒▒▒░▒..
; ▒▒▒▒░█▒.
; ▒▒▒▒░▒█░
; ▒▒▒░.▒▒░
; ░░░░█░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_30_WSHIELD_18: ; [$8684]
    .byte $e0,$60,$18,$08,$0c,$0b,$11,$ff   ; [$8684] byte
    .byte $00,$80,$e0,$f4,$f6,$f6,$e6,$08   ; [$868c] byte


;
; ....░█▒▒
; ....░░░░
; ...░███▒
; ...▒███▒
; ...░░░▒█
; ...██░░░
; ..██▒▒░░
; .░█▒▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_31_WSHIELD_19: ; [$8694]
    .byte $0c,$0f,$1e,$0e,$1d,$1f,$33,$67   ; [$8694] byte
    .byte $07,$00,$0f,$1f,$03,$18,$3c,$38   ; [$869c] byte


;
; ▒░░.░░░▒
; ░░░..░░.
; ▒▒▒.....
; ▒▒▒.....
; ▒▒░.....
; ▒░▒.....
; ░░░.....
; ░░░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_32_WSHIELD_20: ; [$86a4]
    .byte $6e,$e6,$00,$00,$20,$40,$e0,$e0   ; [$86a4] byte
    .byte $81,$00,$e0,$e0,$c0,$a0,$00,$00   ; [$86ac] byte


;
; .█▒▒░░.░
; .█▒░░..░
; .██▒░..░
; .██▒░...
; .█▒▒░...
; .█▒░....
; ▒█▒░....
; █▒▒░....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21: ; [$86b4]
    .byte $4d,$59,$69,$68,$48,$50,$50,$90   ; [$86b4] byte
    .byte $70,$60,$70,$70,$70,$60,$e0,$e0   ; [$86bc] byte


;
; ░░░.....
; ▒░░.....
; ▒▒░.....
; ██▒░....
; .██▒░...
; ..█▒░...
; ..█▒▒░..
; .██▒░░..
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22: ; [$86c4]
    .byte $e0,$60,$20,$d0,$68,$28,$24,$6c   ; [$86c4] byte
    .byte $00,$80,$c0,$e0,$70,$30,$38,$70   ; [$86cc] byte


;
; .....▒▒░
; ....███▒
; ██░▒░███
; .░▒██▒░█
; ░░██▒░█░
; ▒██▒░░██
; ▒▒▒░░██▒
; .░░░░░░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18: ; [$86d4]
    .byte $01,$0e,$ef,$5b,$f7,$6f,$1e,$7f   ; [$86d4] byte
    .byte $06,$0f,$d7,$3d,$3a,$f3,$e7,$00   ; [$86dc] byte


;
; ░░░.....
; ░░░▒░...
; ░▒░░██..
; ░▒░▒░░..
; ▒░▒▒░█▒.
; ▒░▒▒░▒█░
; ▒░▒░.▒▒░
; ░░░░█░░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19: ; [$86e4]
    .byte $e0,$e8,$bc,$ac,$4c,$4b,$51,$ff   ; [$86e4] byte
    .byte $00,$10,$4c,$50,$b6,$b6,$a6,$08   ; [$86ec] byte


;
; ....░█▒▒
; ....░░░░
; ...░█░█░
; ...▒█░█░
; ...░░░▒░
; ...██░░░
; ..██▒▒░░
; .░█▒▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20: ; [$86f4]
    .byte $0c,$0f,$1f,$0f,$1d,$1f,$33,$67   ; [$86f4] byte
    .byte $07,$00,$0a,$1a,$02,$18,$3c,$38   ; [$86fc] byte


;
; ▒░░.░░░▒
; ░░░..░░.
; █░▒.....
; █░▒.....
; ▒░░.....
; ▒░▒.....
; ░░░.....
; ░░░.....
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21: ; [$8704]
    .byte $6e,$e6,$c0,$c0,$60,$40,$e0,$e0   ; [$8704] byte
    .byte $81,$00,$a0,$a0,$80,$a0,$00,$00   ; [$870c] byte


;
; ........
; ........
; .░░░░...
; ░▒░░░░░.
; ░▒▒░░░░░
; .█▒▒░▒░░
; .░█▒░▒░░
; ███▒▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24: ; [$8714]
    .byte $00,$00,$78,$be,$9f,$4b,$6b,$e7   ; [$8714] byte
    .byte $00,$00,$00,$40,$60,$74,$34,$f8   ; [$871c] byte


;
; ........
; ........
; ........
; ........
; ░.......
; ........
; ░.......
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25: ; [$8724]
    .byte $00,$00,$00,$00,$80,$00,$80,$00   ; [$8724] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$872c] byte


;
; ........
; ........
; ........
; ..█.....
; ░.█░░...
; ░█░▒█▒▒█
; .▒░░▒░▒▒
; .░..░░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26: ; [$8734]
    .byte $00,$00,$00,$20,$b8,$e9,$34,$4f   ; [$8734] byte
    .byte $00,$00,$00,$20,$20,$5f,$4b,$00   ; [$873c] byte


;
; .▒▒▒▒░░░
; .▒▒▒░░██
; ...░░██░
; .▒█░░██░
; ▒░████▒░
; █░████▒▒
; ▒▒░███▒▒
; ░░░░▒▒▒▒
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_38_WSHIELD_26: ; [$8744]
    .byte $07,$0f,$1f,$3f,$7d,$fc,$3c,$f0   ; [$8744] byte
    .byte $78,$73,$06,$66,$be,$bf,$df,$0f   ; [$874c] byte


;
; ........
; ▒▒░.....
; ██▒░░...
; ▒▒██▒░..
; ░▒▒▒▒░..
; ░░░█▒░..
; ▒░░▒▒░..
; ░░░█▒░..
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_39_WSHIELD_27: ; [$8754]
    .byte $00,$20,$d8,$34,$84,$f4,$64,$f4   ; [$8754] byte
    .byte $00,$c0,$e0,$f8,$78,$18,$98,$18   ; [$875c] byte


;
; ....░░░░
; ....░██▒
; ....░░░░
; ....██▒▒
; ...░░░█▒
; ...░█▒░░
; ...██▒▒░
; ..██▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_40_WSHIELD_28: ; [$8764]
    .byte $0f,$0e,$0f,$0c,$1e,$1b,$19,$33   ; [$8764] byte
    .byte $00,$07,$00,$0f,$03,$0c,$1e,$3c   ; [$876c] byte


;
; ░░▒█▒░..
; ▒░░▒▒...
; ░░░.....
; ░░░.....
; ▒░░.....
; ▒░░.....
; ░░░.....
; ░░░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_41_WSHIELD_29: ; [$8774]
    .byte $d4,$60,$e0,$e0,$60,$60,$e0,$e0   ; [$8774] byte
    .byte $38,$98,$00,$00,$80,$80,$00,$00   ; [$877c] byte


;
; ..█▒░░..
; ..██▒░..
; ...█▒▒..
; ...██▒░.
; ....█▒░.
; ....█▒░.
; ...██▒░.
; ..▒▒▒▒░.
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30: ; [$8784]
    .byte $2c,$34,$10,$1a,$0a,$0a,$1a,$02   ; [$8784] byte
    .byte $30,$38,$1c,$1c,$0c,$0c,$1c,$3c   ; [$878c] byte


;
; ░░░.....
; ▒▒░░....
; .█▒▒░...
; ..█▒▒...
; ..██▒░..
; ...█▒▒..
; ...█▒▒░.
; ..█▒▒▒░.
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31: ; [$8794]
    .byte $e0,$30,$48,$20,$34,$10,$12,$22   ; [$8794] byte
    .byte $00,$c0,$70,$38,$38,$1c,$1c,$3c   ; [$879c] byte


;
; .▒▒▒▒░░░
; .▒▒▒░░░█
; .░░░░░██
; .▒▒░░░░░
; ▒░░░░░▒█
; █▒░██░██
; ▒▒░▒█░█▒
; ░░░░░░░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27: ; [$87a4]
    .byte $07,$0f,$7f,$1f,$7d,$bf,$2e,$ff   ; [$87a4] byte
    .byte $78,$71,$03,$60,$83,$db,$db,$00   ; [$87ac] byte


;
; ░░......
; ██░.....
; █░▒▒░...
; ░▒██▒░..
; ░▒▒██░..
; ░░░█▒░..
; ░░░█▒░..
; ░░░░▒░..
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28: ; [$87b4]
    .byte $c0,$e0,$c8,$b4,$9c,$f4,$f4,$f4   ; [$87b4] byte
    .byte $00,$c0,$b0,$78,$78,$18,$18,$08   ; [$87bc] byte


;
; ....░██▒
; ....░░░░
; ....░░█░
; ....█░█░
; ....░░░░
; ....██▒░
; ...██▒▒░
; ..█▒▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29: ; [$87c4]
    .byte $0e,$0f,$0f,$0f,$0f,$0d,$19,$23   ; [$87c4] byte
    .byte $07,$00,$02,$0a,$00,$0e,$1e,$3c   ; [$87cc] byte


;
; ▒░░█▒░..
; ░░░░░...
; ▒░░.....
; █░░.....
; ▒░░.....
; ░░░.....
; ░░░.....
; ░░░.....
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30: ; [$87d4]
    .byte $74,$f8,$60,$e0,$60,$e0,$e0,$e0   ; [$87d4] byte
    .byte $98,$00,$80,$80,$80,$00,$00,$00   ; [$87dc] byte


;
; ........
; ....█.██
; ....██░█
; ....███░
; ....████
; ....░░░░
; ....░░░░
; ....████
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_26:   ; [$87e4]
    .byte $00,$0b,$0f,$0f,$0f,$0f,$0f,$0f   ; [$87e4] byte
    .byte $00,$0b,$0d,$0e,$0f,$00,$00,$0f   ; [$87ec] byte


;
; ........
; █░......
; ▒▒░.....
; ░▒▒.....
; ▒░▒░....
; ░░░░....
; █▒░░....
; ▒░░.....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_27:   ; [$87f4]
    .byte $00,$c0,$20,$80,$50,$f0,$b0,$60   ; [$87f4] byte
    .byte $00,$80,$c0,$60,$a0,$00,$c0,$80   ; [$87fc] byte


;
; ...░░░░░
; ..░██▒░▒
; ..░░██▒░
; .█░█░█▒░
; █░██▒░▒░
; ▒█░▒░░░▒
; ▒▒░░░█▒▒
; ░░░.██▒▒
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_28:   ; [$8804]
    .byte $1f,$3a,$3d,$7d,$f5,$6e,$3c,$ec   ; [$8804] byte
    .byte $00,$1d,$0e,$56,$ba,$d1,$c7,$0f   ; [$880c] byte


;
; ░░░▒▒...
; ▒░▒░██..
; █░▒▒░░░.
; ▒░▒▒░█▒░
; ▒░▒▒░▒█░
; ▒░▒░.░░░
; ░░░░░░░░
; ░░░█░▒░▒
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_29:   ; [$8814]
    .byte $e0,$5c,$ce,$4d,$4b,$57,$ff,$fa   ; [$8814] byte
    .byte $18,$ac,$b0,$b6,$b6,$a0,$00,$15   ; [$881c] byte


;
; ....█░░░
; ....░██▒
; ....█░░░
; ...██░█░
; ...░░░█░
; ..██▒░░░
; .█░▒▒▒░░
; .█▒░▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_30:   ; [$8824]
    .byte $0f,$0e,$0f,$1f,$1f,$37,$63,$57   ; [$8824] byte
    .byte $08,$07,$08,$1a,$02,$38,$5c,$68   ; [$882c] byte


;
; ░▒░.░░░.
; ░▒░.....
; ░░░.....
; ▒░▒.....
; █░▒.....
; ▒░░.....
; ░░░.....
; ▒░░.....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_31:   ; [$8834]
    .byte $ae,$a0,$e0,$40,$c0,$60,$e0,$60   ; [$8834] byte
    .byte $40,$40,$00,$a0,$a0,$80,$00,$80   ; [$883c] byte


;
; .░▒░░..░
; .█░░....
; .█▒▒░...
; .█▒▒░...
; .█▒▒░...
; ..░░░...
; ░█▒▒░...
; ██▒▒░...
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32: ; [$8844]
    .byte $59,$70,$48,$48,$48,$38,$c8,$c8   ; [$8844] byte
    .byte $20,$40,$70,$70,$70,$00,$70,$f0   ; [$884c] byte


;
; █░░.....
; ░░░.....
; █▒░░....
; .██░░...
; ..▒▒░...
; ..░░░░..
; .░█▒▒░..
; .██▒▒░..
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33: ; [$8854]
    .byte $e0,$e0,$b0,$78,$08,$3c,$64,$64   ; [$8854] byte
    .byte $80,$00,$c0,$60,$30,$00,$38,$78   ; [$885c] byte


;
; ..███░░█
; ..██░░██
; ..▒░▒░█░
; ...░█░█░
; ...░█░█▒
; █░..░░▒█
; ░█░░░█░░
; ▒█░▒░███
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_34:   ; [$8864]
    .byte $3f,$3f,$17,$1f,$1e,$cd,$ff,$6f   ; [$8864] byte
    .byte $39,$33,$2a,$0a,$0b,$83,$44,$d7   ; [$886c] byte


;
; ........
; █.███░..
; ██░█▒▒░.
; ███░░▒▒░
; ████▒░▒░
; ░░░░░░░░
; .▒▒░██░░
; ████▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_35:   ; [$8874]
    .byte $00,$bc,$f2,$f9,$f5,$ff,$1f,$f7   ; [$8874] byte
    .byte $00,$b8,$dc,$e6,$fa,$00,$6c,$f8   ; [$887c] byte


;
; ........
; ........
; ▒.......
; ░█......
; ██░██░░█
; ░█░░▒░░█
; █░░▒▒░▒░
; ....░░░░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_36:   ; [$8884]
    .byte $00,$00,$00,$c0,$ff,$f7,$e5,$0f   ; [$8884] byte
    .byte $00,$00,$80,$40,$d9,$49,$9a,$00   ; [$888c] byte


;
; ███▒░░░░
; ██░░░░█░
; █░░░█▒░█
; .░█░██░░
; █░█░███▒
; █░█▒░█▒▒
; ▒▒░█░░░░
; ░░░.░█▒▒
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_37:   ; [$8894]
    .byte $ef,$ff,$fb,$7f,$fe,$ec,$3f,$ec   ; [$8894] byte
    .byte $f0,$c2,$8d,$2c,$af,$b7,$d0,$07   ; [$889c] byte


;
; █░▒░....
; ████....
; ▒░▒▒....
; ░▒███...
; ░███░█..
; ░░▒░█░..
; ░░░██▒..
; ░░░██▒..
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_38:   ; [$88a4]
    .byte $d0,$f0,$40,$b8,$fc,$dc,$f8,$f8   ; [$88a4] byte
    .byte $a0,$f0,$b0,$78,$74,$28,$1c,$1c   ; [$88ac] byte


;
; ....░▒█▒
; .....░░░
; ....░░█░
; ....█░█░
; ....░░░░
; ....██▒▒
; ...██▒▒▒
; ..█░▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_39:   ; [$88b4]
    .byte $0a,$07,$0f,$0f,$0f,$0c,$18,$33   ; [$88b4] byte
    .byte $07,$00,$02,$0a,$00,$0f,$1f,$2c   ; [$88bc] byte


;
; ▒░░██░..
; ░░░░░░..
; █░░██░..
; █░░█▒...
; █░░░....
; ░░░.....
; ░░░.....
; ░░░.....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_40:   ; [$88c4]
    .byte $7c,$fc,$fc,$f0,$f0,$e0,$e0,$e0   ; [$88c4] byte
    .byte $98,$00,$98,$98,$80,$00,$00,$00   ; [$88cc] byte


;
; ..██░░░░
; ..░░▒░░.
; ...██▒░.
; ...░█▒░.
; ....█▒░.
; ....░░░.
; ...██▒▒░
; ..█▒▒▒▒░
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41: ; [$88d4]
    .byte $3f,$36,$1a,$1a,$0a,$0e,$19,$21   ; [$88d4] byte
    .byte $30,$08,$1c,$0c,$0c,$00,$1e,$3e   ; [$88dc] byte


;
; ░░░░....
; ░░░░░...
; .█░░░...
; ..░▒░░..
; ...█▒░░.
; ....░░░.
; ...▒█▒░░
; ..▒█▒░░░
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42: ; [$88e4]
    .byte $f0,$f8,$78,$2c,$16,$0e,$0b,$17   ; [$88e4] byte
    .byte $00,$00,$40,$10,$18,$00,$1c,$38   ; [$88ec] byte


;
; ........
; ..▒▒░.░░
; .▒█▒░░░░
; .▒█▒░░░░
; ░█▒░.░░░
; ░█▒░.░░░
; ░█▒░.░░░
; ░▒█▒░░░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33: ; [$88f4]
    .byte $00,$0b,$2f,$2f,$d7,$d7,$d7,$af   ; [$88f4] byte
    .byte $00,$30,$70,$70,$60,$60,$60,$70   ; [$88fc] byte


;
; ........
; ░░......
; ░░░.....
; ░░░.....
; ░░░░....
; ░░░░....
; ░░░░....
; ░░░.█░..
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34: ; [$8904]
    .byte $00,$c0,$e0,$e0,$f0,$f0,$f0,$ec   ; [$8904] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$08   ; [$890c] byte


;
; .░█▒░▒░░
; .░▒▒░█▒░
; ..░▒░██▒
; ...░▒███
; ...░░▒██
; ....░▒▒▒
; ....░░░░
; ....░▒██
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_46_WSHIELD_34__STUDDED_052: ; [$8914]
    .byte $6b,$4d,$2e,$17,$1b,$08,$0f,$0b   ; [$8914] byte
    .byte $34,$36,$17,$0f,$07,$07,$00,$07   ; [$891c] byte


;
; ░░░.▒█░.
; ░░▒█░█░.
; ▒███░█▒.
; ███▒▒█▒.
; ██▒▒░▒▒.
; ▒▒▒░░░░.
; ░░░..░..
; █▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_47_WSHIELD_35: ; [$8924]
    .byte $e6,$de,$7c,$e4,$c8,$1e,$e4,$a0   ; [$8924] byte
    .byte $0c,$34,$f6,$fe,$f6,$e0,$00,$c0   ; [$892c] byte


;
; ....█░░░
; ..░█░███
; ..▒▒░▒██
; ..░▒░░▒▒
; ..░░░░░░
; ..░▒░..░
; ..░█▒░.░
; ...█▒░..
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_48_WSHIELD_36: ; [$8934]
    .byte $0f,$3f,$0b,$2c,$3f,$29,$35,$14   ; [$8934] byte
    .byte $08,$17,$37,$13,$00,$10,$18,$18   ; [$893c] byte


;
; ░░█.....
; ██▒.....
; █▒░.....
; ▒░░.....
; ░░░.....
; ░▒░.....
; ▒█░.....
; ▒█░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_49_WSHIELD_37: ; [$8944]
    .byte $e0,$c0,$a0,$60,$e0,$a0,$60,$60   ; [$8944] byte
    .byte $20,$e0,$c0,$80,$00,$40,$c0,$c0   ; [$894c] byte


;
; ...▒█░..
; ..█░█░..
; ..░▒▒░..
; ...░░...
; ........
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38: ; [$8954]
    .byte $0c,$3c,$24,$18,$00,$00,$00,$00   ; [$8954] byte
    .byte $18,$28,$18,$00,$00,$00,$00,$00   ; [$895c] byte


;
; ▒▒░.....
; ▒░░.....
; ▒▒░.....
; ▒█░.....
; ▒█░░....
; ▒▒░░....
; ▒▒░.....
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39: ; [$8964]
    .byte $20,$60,$20,$60,$70,$30,$20,$c0   ; [$8964] byte
    .byte $c0,$80,$c0,$c0,$c0,$c0,$c0,$00   ; [$896c] byte


;
; .░█░█▒░░
; .░▒░██▒░
; ..░░░░░▒
; ...░▒██░
; ...░▒▒█░
; ....░▒▒▒
; ....░░░░
; ....░▒██
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35: ; [$8974]
    .byte $7b,$5d,$3e,$17,$13,$08,$0f,$0b   ; [$8974] byte
    .byte $2c,$2e,$01,$0e,$0e,$07,$00,$07   ; [$897c] byte


;
; ░░░░░█░.
; ░░██░█░.
; ▒░░░░█▒.
; ███▒░█▒.
; ██▒▒░▒▒.
; ▒▒▒░░░░.
; ░░░..░..
; █▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36: ; [$8984]
    .byte $fe,$fe,$7c,$ec,$c8,$1e,$e4,$a0   ; [$8984] byte
    .byte $04,$34,$86,$f6,$f6,$e0,$00,$c0   ; [$898c] byte


;
; ....▒░░░
; ..░█▒█░█
; ..▒▒▒▒░█
; ..░▒░▒░█
; ..░░░░░░
; ..░▒░..░
; ..░█▒░.░
; ...█▒░..
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37: ; [$8994]
    .byte $07,$37,$03,$2b,$3f,$29,$35,$14   ; [$8994] byte
    .byte $08,$1d,$3d,$15,$00,$10,$18,$18   ; [$899c] byte


;
; ░░░.....
; ░█░.....
; ░█░.....
; ░▒░.....
; ░░░.....
; ░▒░.....
; ▒█░.....
; ▒█░.....
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38: ; [$89a4]
    .byte $e0,$e0,$e0,$a0,$e0,$a0,$60,$60   ; [$89a4] byte
    .byte $00,$40,$40,$40,$00,$40,$c0,$c0   ; [$89ac] byte


;
; ........
; ..▒▒░.░░
; .▒█▒░░▒▒
; .█▒░░▒▒█
; ░█▒░░▒██
; ░░░░░▒▒█
; ░█▒░░▒▒▒
; ░█▒░░░█▒
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_43:   ; [$89b4]
    .byte $00,$0b,$2c,$59,$db,$f9,$d8,$de   ; [$89b4] byte
    .byte $00,$30,$73,$67,$67,$07,$67,$63   ; [$89bc] byte


;
; ........
; ░░......
; ▒▒░.....
; █▒▒░....
; ██▒░....
; █▒▒░....
; ▒▒▒░....
; ▒█░.█░..
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_44:   ; [$89c4]
    .byte $00,$c0,$20,$90,$d0,$90,$10,$6c   ; [$89c4] byte
    .byte $00,$00,$c0,$e0,$e0,$e0,$e0,$c8   ; [$89cc] byte


;
; ░▒░▒█▒░█
; .█░███░░
; .░█░░░░█
; ..░░▒█▒░
; ...░▒█▒▒
; ....░▒▒█
; ....░░░░
; ....░▒██
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_45:   ; [$89d4]
    .byte $ab,$7f,$7f,$35,$14,$09,$0f,$0b   ; [$89d4] byte
    .byte $5d,$5c,$21,$0e,$0f,$07,$00,$07   ; [$89dc] byte


;
; █░▒▒░░░.
; ░░███░░.
; █░░░░░▒.
; ░▒█▒░█░.
; ▒▒█▒░▒▒.
; █▒▒░░▒░.
; ░░░.░░..
; ▒▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_46:   ; [$89e4]
    .byte $ce,$fe,$fc,$ae,$28,$9a,$ec,$20   ; [$89e4] byte
    .byte $b0,$38,$82,$74,$f6,$e4,$00,$c0   ; [$89ec] byte


;
; ....▒░░░
; ..░█▒█░█
; .░░░▒▒░█
; .▒█░░▒░█
; .░░░░░░░
; ..░▒░░.░
; ..░█▒░.░
; ...█▒░.░
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_47:   ; [$89f4]
    .byte $07,$37,$73,$3b,$7f,$2d,$35,$15   ; [$89f4] byte
    .byte $08,$1d,$0d,$65,$00,$10,$18,$18   ; [$89fc] byte


;
; ░░░.....
; ░█░.....
; ░█░.....
; ░▒░.....
; ░░░.....
; ░▒░.....
; █▒░.....
; █▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_48:   ; [$8a04]
    .byte $e0,$e0,$e0,$a0,$e0,$a0,$a0,$a0   ; [$8a04] byte
    .byte $00,$40,$40,$40,$00,$40,$c0,$c0   ; [$8a0c] byte


;
; ...░░░.░
; ..█░█░.░
; ..▒██░.░
; ...▒▒░.░
; .......░
; .......░
; .......░
; ........
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49: ; [$8a14]
    .byte $1d,$3d,$1d,$05,$01,$01,$01,$00   ; [$8a14] byte
    .byte $00,$28,$38,$18,$00,$00,$00,$00   ; [$8a1c] byte


;
; ░░▒.....
; █▒▒.....
; ░░░.....
; █▒░.....
; █▒░░....
; ░░░░....
; █▒░.....
; ░░......
;
SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50: ; [$8a24]
    .byte $c0,$80,$e0,$a0,$b0,$f0,$a0,$c0   ; [$8a24] byte
    .byte $20,$e0,$00,$c0,$c0,$00,$c0,$00   ; [$8a2c] byte


;
; ..░▒▒░░░
; ...░░░░█
; ....░▒█░
; ....░█░▒
; ....░█░█
; .....█░█
; .....░░█
; .....███
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_02: ; [$8a34]
    .byte $27,$1f,$0b,$0e,$0f,$07,$07,$07   ; [$8a34] byte
    .byte $18,$01,$06,$05,$05,$05,$01,$07   ; [$8a3c] byte


;
; ░░......
; █▒░.....
; █▒░.....
; ░░░.....
; █▒░.....
; ▒▒░.....
; █▒░.....
; ▒▒░.....
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03: ; [$8a44]
    .byte $c0,$a0,$a0,$e0,$a0,$20,$a0,$20   ; [$8a44] byte
    .byte $00,$c0,$c0,$00,$c0,$c0,$c0,$c0   ; [$8a4c] byte


;
; .....▒▒▒
; .....░░░
; ....░░░░
; ...░░██▒
; ...░░░██
; ...░░░░░
; ...▒▒░░░
; ...█▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_04: ; [$8a54]
    .byte $00,$07,$0f,$1e,$1f,$1f,$07,$13   ; [$8a54] byte
    .byte $07,$00,$00,$07,$03,$00,$18,$1c   ; [$8a5c] byte


;
; ▒░......
; ░.......
; ░.......
; ▒.......
; ▒.......
; ........
; ........
; ........
;
SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05: ; [$8a64]
    .byte $40,$80,$80,$00,$00,$00,$00,$00   ; [$8a64] byte
    .byte $80,$00,$00,$80,$80,$00,$00,$00   ; [$8a6c] byte


;
; ..░▒▒▒▒░
; ...░░░██
; ...░░░░█
; ...░██░░
; ....▒█░█
; .....█░█
; .....░░░
; .....███
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_02__FULL_PLATE_WSHIELD_02: ; [$8a74]
    .byte $21,$1f,$1f,$1f,$07,$07,$07,$07   ; [$8a74] byte
    .byte $1e,$03,$01,$0c,$0d,$05,$00,$07   ; [$8a7c] byte


;
; .....▒▒▒
; .....░░░
; ....░░▒░
; ...░░░█░
; ..░░▒░█░
; ..░░█░░░
; ..░░░░░░
; ..░░▒▒░░
;
SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_04__FULL_PLATE_WSHIELD_04: ; [$8a84]
    .byte $00,$07,$0d,$1f,$37,$3f,$3f,$33   ; [$8a84] byte
    .byte $07,$00,$02,$02,$0a,$08,$00,$0c   ; [$8a8c] byte


;============================================================================
; Weapon: Dagger: Tile 2
;
; XREFS:
;     TILES_WEAPONS_START_REF [$PRG8::8006]
;============================================================================

;
; ...█....
; ...░█...
; ....█▒..
; ....░█..
; .....█░.
; .....▒░█
; ......█░
; .....█.█
;
; XREFS:
;     TILES_WEAPONS_START_REF [$PRG8::8006]
;
TILES_WEAPONS_START_DAGGER_02:              ; [$8a94]
    .byte $10,$18,$08,$0c,$06,$03,$03,$05   ; [$8a94] byte
    .byte $10,$08,$0c,$04,$04,$05,$02,$05   ; [$8a9c] byte


;============================================================================
; Weapon: Long Sword: Tile 3
;============================================================================

;
; █.......
; █▒......
; ██......
; ░█▒.....
; .██.....
; .░█▒....
; ..██....
; ..░█░...
;
TILE_LONG_SWORD_03:                         ; [$8aa4]
    .byte $80,$80,$c0,$c0,$60,$60,$30,$38   ; [$8aa4] byte
    .byte $80,$c0,$c0,$60,$60,$30,$30,$10   ; [$8aac] byte


;============================================================================
; Weapon: Long Sword: Tile 4
;============================================================================

;
; ...██...
; ...░█...
; ....█▒..
; ....░█..
; .....█░.
; .....▒░█
; ......█░
; .....█.█
;
TILE_LONG_SWORD_04:                         ; [$8ab4]
    .byte $18,$18,$08,$0c,$06,$03,$03,$05   ; [$8ab4] byte
    .byte $18,$08,$0c,$04,$04,$05,$02,$05   ; [$8abc] byte


;============================================================================
; Weapon: Giant Blade: Tile 3
;============================================================================

;
; ........
; ........
; ........
; ........
; .......░
; .......█
; ........
; ........
;
TILE_GIANT_BLADE_03:                        ; [$8ac4]
    .byte $00,$00,$00,$00,$01,$01,$00,$00   ; [$8ac4] byte
    .byte $00,$00,$00,$00,$00,$01,$00,$00   ; [$8acc] byte


;============================================================================
; Weapon: Giant Blade: Tile 4
;============================================================================

;
; ▒.......
; █.......
; ▒█..█...
; ░█░.█...
; .█▒.░▒..
; .░█░.█..
; █.█▒██..
; ▒████...
;
TILE_GIANT_BLADE_04:                        ; [$8ad4]
    .byte $00,$80,$48,$e8,$48,$74,$ac,$78   ; [$8ad4] byte
    .byte $80,$80,$c8,$48,$64,$24,$bc,$f8   ; [$8adc] byte


;============================================================================
; Weapon: Giant Blade: Tile 5
;============================================================================

;
; .▒███...
; ...░█...
; ....█▒..
; ....░█..
; .....█░.
; .....░▒█
; ......█░
; .....█░▒
;
TILE_GIANT_BLADE_05:                        ; [$8ae4]
    .byte $38,$18,$08,$0c,$06,$05,$03,$06   ; [$8ae4] byte
    .byte $78,$08,$0c,$04,$04,$03,$02,$05   ; [$8aec] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 6
;============================================================================

;
; ........
; ...██...
; ...▒██..
; ....▒██.
; .....▒██
; ......▒█
; .......▒
; ........
;
TILE_DRAGON_SLAYER_06:                      ; [$8af4]
    .byte $00,$18,$0c,$06,$03,$01,$00,$00   ; [$8af4] byte
    .byte $00,$18,$1c,$0e,$07,$03,$01,$00   ; [$8afc] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 7
;============================================================================

;
; ........
; ........
; ........
; ........
; ........
; █.......
; ██......
; ▒██.....
;
TILE_DRAGON_SLAYER_07:                      ; [$8b04]
    .byte $00,$00,$00,$00,$00,$80,$c0,$60   ; [$8b04] byte
    .byte $00,$00,$00,$00,$00,$80,$c0,$e0   ; [$8b0c] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 8
;============================================================================

;
; .▒██....
; ..▒█▒...
; ...░█▒..
; ....░█▒.
; .....░█▒
; ......░█
; .....█░░
; ......██
;
TILE_DRAGON_SLAYER_08:                      ; [$8b14]
    .byte $30,$10,$18,$0c,$06,$03,$07,$03   ; [$8b14] byte
    .byte $70,$38,$0c,$06,$03,$01,$04,$03   ; [$8b1c] byte


;============================================================================
; Weapons:
;
; * Dagger: Tile 3
; * Long Sword: Tile 6
; * Giant Blade: Tile 7
;============================================================================

;
; ........
; ........
; ........
; ........
; ........
; ........
; .....█░.
; ......██
;
TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7: ; [$8b24]
    .byte $00,$00,$00,$00,$00,$00,$06,$03   ; [$8b24] byte
    .byte $00,$00,$00,$00,$00,$00,$04,$03   ; [$8b2c] byte


;============================================================================
; Weapon: Long Sword: Tile 5
;============================================================================

;
; .█......
; .░█.....
; ..██....
; ..░█▒...
; ...▒█...
; ....▒█..
; .....██.
; ......░█
;
TILE_LONG_SWORD_05:                         ; [$8b34]
    .byte $40,$60,$30,$30,$08,$04,$06,$03   ; [$8b34] byte
    .byte $40,$20,$30,$18,$18,$0c,$06,$01   ; [$8b3c] byte


;============================================================================
; Weapon: Giant Blade: Tile 6
;============================================================================

;
; .█......
; .░█..█..
; ..██.░█.
; ..░█▒.░█
; ...▒█.░█
; .█░.▒█░█
; ..█░░██░
; ...██░░█
;
TILE_GIANT_BLADE_06:                        ; [$8b44]
    .byte $40,$64,$36,$33,$0b,$67,$3f,$1f   ; [$8b44] byte
    .byte $40,$24,$32,$19,$19,$4d,$26,$19   ; [$8b4c] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 9
;============================================================================

;
; ........
; ........
; ▒██▒....
; .▒███...
; ...▒███.
; .....▒▒█
; .......▒
; ........
;
TILE_DRAGON_SLAYER_09:                      ; [$8b54]
    .byte $00,$00,$60,$38,$0e,$01,$00,$00   ; [$8b54] byte
    .byte $00,$00,$f0,$78,$1e,$07,$01,$00   ; [$8b5c] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 1
;
; XREFS:
;     TILES_DRAGON_SLAYER_TILE_IDS [$PRG8::8183]
;============================================================================

;
; ........
; ........
; ........
; ........
; ........
; ........
; .█████░░
; ...░░▒▒▒
;
; XREFS:
;     TILES_DRAGON_SLAYER_TILE_IDS [$PRG8::8183]
;
TILE_DRAGON_SLAYER_01:                      ; [$8b64]
    .byte $00,$00,$00,$00,$00,$00,$7f,$18   ; [$8b64] byte
    .byte $00,$00,$00,$00,$00,$00,$7c,$07   ; [$8b6c] byte


;============================================================================
; Weapon: Long Sword: Tile 1
;
; XREFS:
;     TILES_LONG_SWORD_TILE_IDS [$PRG8::8176]
;============================================================================

;
; ........
; ........
; ........
; ..███▒..
; ...█████
; .....░▒▒
; ........
; ........
;
; XREFS:
;     TILES_LONG_SWORD_TILE_IDS [$PRG8::8176]
;
TILE_LONG_SWORD_01:                         ; [$8b74]
    .byte $00,$00,$00,$38,$1f,$04,$00,$00   ; [$8b74] byte
    .byte $00,$00,$00,$3c,$1f,$03,$00,$00   ; [$8b7c] byte


;============================================================================
; Weapon: Long Sword: Tile 2
;============================================================================

;
; ........
; ........
; ........
; ........
; ........
; ██▒.....
; .░▒██▒..
; ....░▒██
;
TILE_LONG_SWORD_02:                         ; [$8b84]
    .byte $00,$00,$00,$00,$00,$c0,$58,$0b   ; [$8b84] byte
    .byte $00,$00,$00,$00,$00,$e0,$3c,$07   ; [$8b8c] byte


;============================================================================
; Weapon: Giant Blade: Tile 1
;
; XREFS:
;     TILES_GIANT_BLADE_TILE_IDS [$PRG8::817c]
;============================================================================

;
; .....██▒
; ......░█
; .░███░.░
; ...░▒███
; ......░▒
; .......░
; ...▒█▒░█
; .....▒█▒
;
; XREFS:
;     TILES_GIANT_BLADE_TILE_IDS [$PRG8::817c]
;
TILE_GIANT_BLADE_01:                        ; [$8b94]
    .byte $06,$03,$7d,$17,$02,$01,$0b,$02   ; [$8b94] byte
    .byte $07,$01,$38,$0f,$01,$00,$1d,$07   ; [$8b9c] byte


;============================================================================
; Weapon: Giant Blade: Tile 2
;============================================================================

;
; ........
; █.......
; █.......
; █▒......
; ███░....
; █░▒██░..
; ▒..░░███
; ......░▒
;
TILE_GIANT_BLADE_02:                        ; [$8ba4]
    .byte $00,$80,$80,$80,$f0,$dc,$1f,$02   ; [$8ba4] byte
    .byte $00,$80,$80,$c0,$e0,$b8,$87,$01   ; [$8bac] byte


;============================================================================
; Weapon: Dagger: Tile 1
;
; XREFS:
;     TILES_DAGGER_TILE_IDS [$PRG8::8173]
;============================================================================

;
; ........
; ........
; ........
; ........
; .██░....
; ..▒██▒░█
; ....░███
; ......░░
;
; XREFS:
;     TILES_DAGGER_TILE_IDS [$PRG8::8173]
;
TILE_DAGGER_01:                             ; [$8bb4]
    .byte $00,$00,$00,$00,$70,$1b,$0f,$03   ; [$8bb4] byte
    .byte $00,$00,$00,$00,$60,$3d,$07,$00   ; [$8bbc] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 2
;============================================================================

;
; ........
; ........
; ........
; ..██▒...
; ...░████
; ......░░
; ........
; ........
;
TILE_DRAGON_SLAYER_02:                      ; [$8bc4]
    .byte $00,$00,$00,$30,$1f,$03,$00,$00   ; [$8bc4] byte
    .byte $00,$00,$00,$38,$0f,$00,$00,$00   ; [$8bcc] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 3
;============================================================================

;
; ........
; ........
; ........
; ........
; ▒.......
; ████▒...
; .░░░███░
; ....░░▒█
;
TILE_DRAGON_SLAYER_03:                      ; [$8bd4]
    .byte $00,$00,$00,$00,$00,$f0,$7f,$0d   ; [$8bd4] byte
    .byte $00,$00,$00,$00,$80,$f8,$0e,$03   ; [$8bdc] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 4
;============================================================================

;
; ████▒...
; .░▒█████
; ...░░░▒▒
; ........
; ........
; ........
; ........
; ........
;
TILE_DRAGON_SLAYER_04:                      ; [$8be4]
    .byte $f0,$5f,$1c,$00,$00,$00,$00,$00   ; [$8be4] byte
    .byte $f8,$3f,$03,$00,$00,$00,$00,$00   ; [$8bec] byte


;============================================================================
; Weapon: Dragon Slayer: Tile 5
;============================================================================

;
; ........
; ▒.......
; ███▒...█
; ░░░███▒░
; ...░░░██
; ......░░
; .......█
; ........
;
TILE_DRAGON_SLAYER_05:                      ; [$8bf4]
    .byte $00,$00,$e1,$fd,$1f,$03,$01,$00   ; [$8bf4] byte
    .byte $00,$80,$f1,$1e,$03,$00,$01,$00   ; [$8bfc] byte


;
; ..████..
; .█▒▒▒▒░.
; ▒▒▒██▒▒░
; █▒█▒▒█▒░
; █▒█▒▒█▒░
; ▒▒▒██▒▒░
; .█▒▒▒▒░.
; ..░░░░..
;
; XREFS:
;     TILES_COMMON_START_REF [$PRG8::8008]
;
TILES_COMMON_START:                         ; [$8c04]
    .byte $3c,$42,$19,$a5,$a5,$19,$42,$3c   ; [$8c04] byte
    .byte $3c,$7c,$fe,$fe,$fe,$fe,$7c,$00   ; [$8c0c] byte


;
; ...█░...
; ..░█▒...
; ..░█▒...
; ..░█▒...
; ..░█▒...
; ..░█▒...
; ..░█▒...
; ...▒░...
;
    .byte $18,$30,$30,$30,$30,$30,$30,$08   ; [$8c14] byte
    .byte $10,$18,$18,$18,$18,$18,$18,$10   ; [$8c1c] byte


;
; ▒░....░█
; ░█▒░░▒█░
; .▒▒▒▒▒▒.
; .░▒█▒▒░.
; .░▒▒▒▒░.
; .▒▒▒▒▒▒.
; ░█▒░░▒█░
; █░....░█
;
    .byte $43,$db,$00,$52,$42,$00,$db,$c3   ; [$8c24] byte
    .byte $81,$66,$7e,$3c,$3c,$7e,$66,$81   ; [$8c2c] byte


;
; ........
; .▒░..░▒.
; .░░░░░░.
; ..░█░░..
; ..░░░░..
; .░░░░░░.
; .▒░..░▒.
; ........
;
    .byte $00,$24,$7e,$3c,$3c,$7e,$24,$00   ; [$8c34] byte
    .byte $00,$42,$00,$10,$00,$00,$42,$00   ; [$8c3c] byte


;
; ......█.
; .....██.
; .....█▒.
; ....██..
; ....██..
; ...▒██..
; ...██▒..
; ...██▒..
;
    .byte $02,$06,$04,$0c,$0c,$0c,$18,$18   ; [$8c44] byte
    .byte $02,$06,$06,$0c,$0c,$1c,$1c,$1c   ; [$8c4c] byte


;
; ..▒▒▒▒░█
; .▒█▒██▒█
; ░█▒▒█▒▒█
; ░▒▒▒█▒▒▒
; ░█▒▒▒▒▒█
; ░▒▒▒█▒▒▒
; ░░▒▒▒▒░▒
; .░░░░░░░
;
    .byte $03,$2d,$c9,$88,$c1,$88,$c2,$7f   ; [$8c54] byte
    .byte $3d,$7f,$7f,$7f,$7f,$7f,$3d,$00   ; [$8c5c] byte


;
; ........
; ........
; .......▒
; ....▒██▒
; ..▒█▒▒░.
; .█▒▒...░
; .█▒...░▒
; █▒....▒█
;
    .byte $00,$00,$00,$06,$12,$41,$42,$81   ; [$8c64] byte
    .byte $00,$00,$01,$0f,$3c,$70,$61,$c3   ; [$8c6c] byte


;
; .....░░░
; ..▒██▒░.
; ██▒▒░..░
; ▒░..░...
; ........
; ░░░...░.
; ▒▒░░....
; █▒▒░░░..
;
    .byte $07,$1a,$c9,$48,$00,$e2,$30,$9c   ; [$8c74] byte
    .byte $00,$3c,$f0,$80,$00,$00,$c0,$e0   ; [$8c7c] byte


;
; ........
; ........
; .......▒
; ......██
; .....█▒.
; ....█▒..
; ...█▒...
; ..█▒...▒
;
    .byte $00,$00,$00,$03,$04,$08,$10,$20   ; [$8c84] byte
    .byte $00,$00,$01,$03,$06,$0c,$18,$31   ; [$8c8c] byte


;
; ....░▒░.
; .░▒░░...
; ▒▒░.....
; ........
; ........
; ...▒▒░▒░
; ░▒▒░....
; ▒░......
;
    .byte $0a,$58,$20,$00,$00,$05,$90,$40   ; [$8c94] byte
    .byte $04,$20,$c0,$00,$00,$1a,$60,$80   ; [$8c9c] byte


;
; ...░....
; ..░░░...
; .░▒▒▒░..
; .░▒█▒░..
; ░▒███▒░.
; ░▒███▒░.
; ░░▒▒▒░░.
; .░░░░░..
;
    .byte $10,$38,$44,$54,$ba,$ba,$c6,$7c   ; [$8ca4] byte
    .byte $00,$00,$38,$38,$7c,$7c,$38,$00   ; [$8cac] byte


;
; ......██
; .....███
; ....████
; ....███▒
; ...████.
; ...███..
; ..███▒.█
; ..███.██
;
    .byte $03,$07,$0f,$0e,$1e,$1c,$39,$3b   ; [$8cb4] byte
    .byte $03,$07,$0f,$0f,$1e,$1c,$3d,$3b   ; [$8cbc] byte


;
; ........
; .▒▒▒████
; █████...
; ██▒.....
; ▒.......
; .▒████▒.
; ████▒...
; ███.....
;
    .byte $00,$0f,$f8,$c0,$00,$3c,$f0,$e0   ; [$8cc4] byte
    .byte $00,$7f,$f8,$e0,$80,$7e,$f8,$e0   ; [$8ccc] byte


;
; .█....█.
; .░█...▒▒
; ..██..░░
; ...██░▒█
; ...▒░███
; ...░▒███
; ███░██░░
; .▒▒░██░█
;
    .byte $42,$60,$33,$1d,$0f,$17,$ff,$1f   ; [$8cd4] byte
    .byte $42,$23,$30,$1b,$17,$0f,$ec,$6d   ; [$8cdc] byte


;
; ...█....
; ..█▒....
; ░░▒░....
; ▒░░.....
; █▒░░....
; ██▒░░▒█▒
; ██▒░██▒.
; ░█▒░▒░..
;
    .byte $10,$20,$d0,$60,$b0,$da,$dc,$d4   ; [$8ce4] byte
    .byte $10,$30,$20,$80,$c0,$e7,$ee,$68   ; [$8cec] byte


;
; ▒░█▒░▒..
; █▒█▒▒▒▒.
; ▒▒█▒█▒▒░
; ▒▒█▒█▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒█▒▒▒▒░
; ▒░▒▒▒▒░░
; ░░░░░░░.
;
    .byte $68,$a0,$29,$29,$01,$21,$43,$fe   ; [$8cf4] byte
    .byte $b4,$fe,$fe,$fe,$fe,$fe,$bc,$00   ; [$8cfc] byte


;
; ...▒▒...
; ...█.▒..
; ...█.▒..
; ...█.▒..
; ..░█.▒░.
; .░▒█.▒░░
; ░▒▒█.▒░░
; ░▒██.▒░░
;
    .byte $00,$10,$10,$10,$32,$53,$93,$b3   ; [$8d04] byte
    .byte $18,$14,$14,$14,$14,$34,$74,$74   ; [$8d0c] byte


;
; ........
; ........
; ........
; ........
; ........
; ░.......
; ░░░.....
; ▒▒░░░.░.
;
    .byte $00,$00,$00,$00,$00,$80,$e0,$3a   ; [$8d14] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$c0   ; [$8d1c] byte


;
; ......░.
; ....░░.░
; ..░░░░░░
; .░░▒▒▒▒░
; .░▒▒██▒▒
; ░▒█████▒
; ▒▒██████
; ▒███████
;
    .byte $02,$0d,$3f,$61,$4c,$be,$3f,$7f   ; [$8d24] byte
    .byte $00,$00,$00,$1e,$3f,$7f,$ff,$ff   ; [$8d2c] byte


;
; ........
; ▒▒......
; ▒.▒░....
; ▒.▒░░░..
; ▒.▒░....
; ▒.▒░░...
; ▒.▒░....
; ▒.▒░░░.░
;
    .byte $00,$00,$10,$1c,$10,$18,$10,$1d   ; [$8d34] byte
    .byte $00,$c0,$a0,$a0,$a0,$a0,$a0,$a0   ; [$8d3c] byte


;
; ........
; ........
; ........
; ........
; ..░░░░..
; .░▒▒▒░░░
; ░▒▒██▒▒░
; ░▒████▒▒
;
    .byte $00,$00,$00,$00,$3c,$47,$99,$bc   ; [$8d44] byte
    .byte $00,$00,$00,$00,$00,$38,$7e,$7f   ; [$8d4c] byte


;
; ........
; ........
; ........
; ........
; .....░░.
; ░....▒.░
; ░░░..▒.░
; ▒▒░░░▒░░
;
    .byte $00,$00,$00,$00,$06,$81,$e1,$3b   ; [$8d54] byte
    .byte $00,$00,$00,$00,$00,$04,$04,$c4   ; [$8d5c] byte


;
; ........
; ........
; ....░░░.
; ..░░░░░░
; .░░░░░░░
; .░░▒▒▒░░
; ░░▒███▒▒
; ░▒██████
;
    .byte $00,$00,$0e,$3f,$7f,$63,$dc,$bf   ; [$8d64] byte
    .byte $00,$00,$00,$00,$00,$1c,$3f,$7f   ; [$8d6c] byte


;
; ........
; ........
; ........
; ░..░....
; ........
; ░░░....░
; ░░░░░░..
; ▒▒░░░.░.
;
    .byte $00,$00,$00,$90,$00,$e1,$fc,$3a   ; [$8d74] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$c0   ; [$8d7c] byte


;
; ..▒...█▒
; .█▒..█▒.
; .▒..░░░░
; ▒▒.░▒▒▒▒
; █▒░▒▒███
; ▒.░▒████
; ▒░▒█████
; ▒░▒█████
;
    .byte $02,$44,$0f,$10,$a7,$2f,$5f,$5f   ; [$8d84] byte
    .byte $23,$66,$40,$cf,$df,$9f,$bf,$bf   ; [$8d8c] byte


;
; ........
; ........
; ...░▒░░.
; ░░▒▒░...
; ▒▒░.....
; ██▒░....
; ██▒▒░░..
; ███▒▒▒░░
;
    .byte $00,$00,$16,$c8,$20,$d0,$cc,$e3   ; [$8d94] byte
    .byte $00,$00,$08,$30,$c0,$e0,$f0,$fc   ; [$8d9c] byte


;
; ...░....
; ...░....
; ..░░░...
; ..░▒░...
; .░▒▒▒░..
; .░▒█▒░..
; .░▒▒▒░..
; ..░░░...
;
    .byte $10,$10,$38,$28,$44,$54,$44,$38   ; [$8da4] byte
    .byte $00,$00,$00,$10,$38,$38,$38,$00   ; [$8dac] byte


;
; ..██▒.██
; .▒██.▒██
; .▒█▒.███
; .▒█..██.
; .██..█▒.
; .█...█..
; .█...▒..
; .█......
;
    .byte $33,$33,$27,$26,$64,$44,$40,$40   ; [$8db4] byte
    .byte $3b,$77,$77,$66,$66,$44,$44,$40   ; [$8dbc] byte


;
; ........
; ........
; ......██
; ....████
; ..██████
; .█████▒.
; █████..█
; ███▒..██
;
    .byte $00,$00,$03,$0f,$3f,$7c,$f9,$e3   ; [$8dc4] byte
    .byte $00,$00,$03,$0f,$3f,$7e,$f9,$f3   ; [$8dcc] byte


;
; ...░███░
; ...░▒███
; ....░▒▒▒
; ...▒█░▒▒
; ..░█▒░░░
; ..█▒...░
; .▒░.....
; ........
;
    .byte $1f,$17,$08,$0c,$37,$21,$20,$00   ; [$8dd4] byte
    .byte $0e,$0f,$07,$1b,$18,$30,$40,$00   ; [$8ddc] byte


;
; ░█▒░░...
; █▒▒░░...
; ▒▒░░....
; ░░░▒....
; ▒░▒██...
; █░.░█▒..
; █....█..
; ▒.......
;
    .byte $d8,$98,$30,$e0,$58,$d8,$84,$00   ; [$8de4] byte
    .byte $60,$e0,$c0,$10,$b8,$8c,$84,$80   ; [$8dec] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8df4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8dfc] byte


;
; .███▒...
; ███████▒
; ████████
; ████▒▒▒▒
; ▒██▒░░░▒
; .██▒░░▒█
; .██▒░▒█░
; .▒█▒▒█░▒
;
    .byte $70,$fe,$ff,$f0,$6e,$6d,$6b,$26   ; [$8e04] byte
    .byte $78,$ff,$ff,$ff,$f1,$73,$76,$7d   ; [$8e0c] byte


;
; ........
; ........
; █▒......
; ███.....
; ▒▒██▒...
; ░▒▒▒██..
; ▒█░░▒██.
; █░░▒...▒
;
    .byte $00,$00,$80,$e0,$30,$8c,$76,$e0   ; [$8e14] byte
    .byte $00,$00,$c0,$e0,$f8,$7c,$ce,$91   ; [$8e1c] byte


;
; ........
; ..░░░░..
; .░░░░░░░
; .░░░░░░░
; .░░░░▒▒▒
; .░░░▒███
; ..░░▒██▒
; ..░░▒█▒░
;
    .byte $00,$3c,$7f,$7f,$78,$77,$36,$35   ; [$8e24] byte
    .byte $00,$00,$00,$00,$07,$0f,$0f,$0e   ; [$8e2c] byte


;
; ...█....
; ...░█...
; ....█░░░
; ....░█░▒
; ....▒▒▒█
; ...░▒███
; ..░░▒███
; ▒▒██▒██░
;
    .byte $10,$18,$0f,$0e,$01,$17,$37,$37   ; [$8e34] byte
    .byte $10,$08,$08,$05,$0f,$0f,$0f,$fe   ; [$8e3c] byte


;
; .█......
; ▒▒......
; ░░...░▒.
; ▒▒░░▒█..
; ██▒▒█...
; ██▒░....
; ░░█░░▒▒.
; █░█▒░░..
;
    .byte $40,$00,$c4,$34,$c8,$d0,$f8,$ec   ; [$8e44] byte
    .byte $40,$c0,$02,$cc,$f8,$e0,$26,$b0   ; [$8e4c] byte


;
; ........
; ........
; ........
; ........
; ........
; .......░
; .....▒██
; ...░▒██▒
;
    .byte $00,$00,$00,$00,$00,$01,$03,$16   ; [$8e54] byte
    .byte $00,$00,$00,$00,$00,$00,$07,$0f   ; [$8e5c] byte


;
; ........
; ........
; ........
; ........
; ...░████
; ████▒░..
; █▒░.....
; ........
;
    .byte $00,$00,$00,$00,$1f,$f4,$a0,$00   ; [$8e64] byte
    .byte $00,$00,$00,$00,$0f,$f8,$c0,$00   ; [$8e6c] byte


;
; ..██▒░▒█
; ..▒█▒▒█░
; ...██▒░░
; ....█▒░▒
; ....▒█▒.
; .....██.
; ......█.
; .......▒
;
    .byte $35,$13,$1b,$0a,$04,$06,$02,$00   ; [$8e74] byte
    .byte $3b,$3e,$1c,$0d,$0e,$06,$02,$01   ; [$8e7c] byte


;
; ░░▒.....
; ░▒......
; ▒.......
; ........
; ........
; ........
; ........
; ........
;
    .byte $c0,$80,$00,$00,$00,$00,$00,$00   ; [$8e84] byte
    .byte $20,$40,$80,$00,$00,$00,$00,$00   ; [$8e8c] byte


;
; ..░░▒▒░█
; ...░░▒█▒
; ...░░▒▒▒
; ....░░▒█
; .....░▒█
; .....░░▒
; ......░░
; .......░
;
    .byte $33,$1a,$18,$0d,$05,$06,$03,$01   ; [$8e94] byte
    .byte $0d,$07,$07,$03,$03,$01,$00,$00   ; [$8e9c] byte


;
; ..░░▒██░
; ....░▒██
; ....▒▒▒▒
; ...█▒░▒▒
; ..██░.░░
; .█▒.....
; ........
; ........
;
    .byte $37,$0b,$00,$14,$3b,$40,$00,$00   ; [$8ea4] byte
    .byte $0e,$07,$0f,$1b,$30,$60,$00,$00   ; [$8eac] byte


;
; ░█▒▒░...
; █▒▒░░...
; ▒▒░██░..
; ░░░░▒█░.
; ▒▒░..░█.
; ░█░.....
; .██.....
; ..█.....
;
    .byte $c8,$98,$3c,$f6,$26,$e0,$60,$20   ; [$8eb4] byte
    .byte $70,$e0,$d8,$0c,$c2,$40,$60,$20   ; [$8ebc] byte


;
; ........
; ........
; ░.......
; ░░░.....
; ▒░░░....
; ▒▒▒░░░..
; ░█▒▒▒░░.
; █▒▒██▒░░
;
    .byte $00,$00,$80,$e0,$70,$1c,$c6,$9b   ; [$8ec4] byte
    .byte $00,$00,$00,$00,$80,$e0,$78,$fc   ; [$8ecc] byte


;
; ▒▒█░....
; ▒█░.....
; █░......
; ░.......
; ........
; ........
; ........
; ........
;
    .byte $30,$60,$c0,$80,$00,$00,$00,$00   ; [$8ed4] byte
    .byte $e0,$c0,$80,$00,$00,$00,$00,$00   ; [$8edc] byte


;
; .███▒...
; ███████▒
; ████████
; ████████
; ▒████...
; .███....
; .███..██
; .▒██..██
;
    .byte $70,$fe,$ff,$ff,$78,$70,$73,$33   ; [$8ee4] byte
    .byte $78,$ff,$ff,$ff,$f8,$70,$73,$73   ; [$8eec] byte


;
; ........
; ........
; █▒......
; ███.....
; ████▒...
; ..████..
; █...███.
; ███....█
;
    .byte $00,$00,$80,$e0,$f0,$3c,$8e,$e1   ; [$8ef4] byte
    .byte $00,$00,$c0,$e0,$f8,$3c,$8e,$e1   ; [$8efc] byte


;
; ..███.██
; ..▒██..█
; ...███.█
; ....██..
; ....▒██.
; .....██.
; ......█.
; .......█
;
    .byte $3b,$19,$1d,$0c,$06,$06,$02,$01   ; [$8f04] byte
    .byte $3b,$39,$1d,$0c,$0e,$06,$02,$01   ; [$8f0c] byte


;
; █████...
; █..███..
; █....██.
; ██......
; ██......
; .██.....
; ..█.....
; ........
;
    .byte $f8,$9c,$86,$c0,$c0,$60,$20,$00   ; [$8f14] byte
    .byte $f8,$9c,$86,$c0,$c0,$60,$20,$00   ; [$8f1c] byte


;
; ........
; ...█....
; ...██...
; ██████..
; ███████.
; ██████..
; ...██...
; ...█....
;
    .byte $00,$10,$18,$fc,$fe,$fc,$18,$10   ; [$8f24] byte
    .byte $00,$10,$18,$fc,$fe,$fc,$18,$10   ; [$8f2c] byte


;
; ........
; ........
; ████████
; .██████.
; ..████..
; ...██...
; ........
; ........
;
    .byte $00,$00,$ff,$7e,$3c,$18,$00,$00   ; [$8f34] byte
    .byte $00,$00,$ff,$7e,$3c,$18,$00,$00   ; [$8f3c] byte


;
; ........
; ........
; ...██...
; ..████..
; .██████.
; ████████
; ........
; ........
;
    .byte $00,$00,$18,$3c,$7e,$ff,$00,$00   ; [$8f44] byte
    .byte $00,$00,$18,$3c,$7e,$ff,$00,$00   ; [$8f4c] byte


;
; ..████..
; .██..██.
; .██..██.
; ....██..
; ...██...
; ...██...
; ........
; ...██...
;
    .byte $3c,$66,$66,$0c,$18,$18,$00,$18   ; [$8f54] byte
    .byte $3c,$66,$66,$0c,$18,$18,$00,$18   ; [$8f5c] byte


;
; ....░...
; ...░▒░..
; ...░▒░..
; ...░▒░..
; ...░▒░░.
; ..░░▒░▒░
; .░▒░▒░▒░
; .░▒░▒░▒░
;
    .byte $08,$14,$14,$14,$16,$35,$55,$55   ; [$8f64] byte
    .byte $00,$08,$08,$08,$08,$0a,$2a,$2a   ; [$8f6c] byte


;
; ........
; ........
; ........
; ........
; ........
; ░.......
; ▒░░.....
; ▒░▒░....
;
    .byte $00,$00,$00,$00,$00,$80,$60,$50   ; [$8f74] byte
    .byte $00,$00,$00,$00,$00,$00,$80,$a0   ; [$8f7c] byte


;
; .░▒░▒░▒▒
; .░▒░▒▒▒▒
; .░▒░▒▒▒▒
; .░▒▒▒▒▒▒
; ..░▒▒▒▒▒
; ..░▒▒▒▒▒
; ...░▒▒▒▒
; ...░▒▒▒▒
;
    .byte $54,$50,$50,$40,$20,$20,$10,$10   ; [$8f84] byte
    .byte $2b,$2f,$2f,$3f,$1f,$1f,$0f,$0f   ; [$8f8c] byte


;
; ▒░▒░....
; ▒▒▒░....
; ▒▒▒░....
; ▒▒▒░....
; ▒▒▒░....
; ▒▒▒░....
; ▒▒░.....
; ▒▒░.....
;
    .byte $50,$10,$10,$10,$10,$10,$20,$20   ; [$8f94] byte
    .byte $a0,$e0,$e0,$e0,$e0,$e0,$c0,$c0   ; [$8f9c] byte


;
; ..▒███..
; .▒███...
; .▒███...
; ..▒███░░
; ...░░░██
; ..░▒███░
; .░███░░.
; ░███████
;
    .byte $1c,$38,$38,$1f,$1f,$2f,$7e,$ff   ; [$8fa4] byte
    .byte $3c,$78,$78,$3c,$03,$1e,$38,$7f   ; [$8fac] byte


;
; ........
; ........
; ..░▒███.
; ████░...
; █░░.....
; ░.......
; ........
; ▒▒░░....
;
    .byte $00,$00,$2e,$f8,$e0,$80,$00,$30   ; [$8fb4] byte
    .byte $00,$00,$1e,$f0,$80,$00,$00,$c0   ; [$8fbc] byte


;
; .....░▒█
; ....░█▒░
; ...░█▒░.
; ...░▒▒░.
; ....░▒▒░
; .....░▒▒
; ...░░▒█░
; ..░▒██▒▒
;
    .byte $05,$0d,$1a,$12,$09,$04,$1b,$2c   ; [$8fc4] byte
    .byte $03,$06,$0c,$0c,$06,$03,$06,$1f   ; [$8fcc] byte


;
; ▒▒░░....
; ░.......
; ........
; ........
; ░.......
; ▒▒▒▒▒▒..
; ░.......
; ▒░░.░.░.
;
    .byte $30,$80,$00,$00,$80,$00,$80,$6a   ; [$8fd4] byte
    .byte $c0,$00,$00,$00,$00,$fc,$00,$80   ; [$8fdc] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ░░░░░░░░
;
    .byte $00,$00,$00,$00,$00,$00,$00,$ff   ; [$8fe4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8fec] byte


;
; ██████..
; ██...██.
; ███..██.
; ███..██.
; ██.███..
; ██......
; ██......
; ........
;
    .byte $fc,$c6,$e6,$e6,$dc,$c0,$c0,$00   ; [$8ff4] byte
    .byte $fc,$c6,$e6,$e6,$dc,$c0,$c0,$00   ; [$8ffc] byte


;
; ........
; ........
; ...░░░░.
; ..▒▒▒▒░░
; .▒▒▒█▒▒░
; ░▒█████▒
; ▒██████▒
; ▒███████
;
    .byte $00,$00,$1e,$03,$09,$be,$7e,$7f   ; [$9004] byte
    .byte $00,$00,$00,$3c,$7e,$7f,$ff,$ff   ; [$900c] byte


;
; ........
; ........
; ........
; ░░░.....
; ░..░░.░.
; ░░░.....
; ▒▒░░░...
; ▒█▒░░░░░
;
    .byte $00,$00,$00,$e0,$9a,$e0,$38,$5f   ; [$9014] byte
    .byte $00,$00,$00,$00,$00,$00,$c0,$e0   ; [$901c] byte


;
; ▒██████▒
; ▒███████
; ░▒████▒▒
; .▒▒█▒█▒░
; ..▒▒▒▒░░
; ...░░░░.
; ........
; ........
;
    .byte $7e,$7f,$bc,$15,$03,$1e,$00,$00   ; [$9024] byte
    .byte $ff,$ff,$7f,$7e,$3c,$00,$00,$00   ; [$902c] byte


;
; █▒█▒░░..
; ▒█░░░░░.
; ░░░░....
; .░..░░..
; ░░░.....
; ........
; ........
; ........
;
    .byte $ac,$7e,$f0,$4c,$e0,$00,$00,$00   ; [$9034] byte
    .byte $f0,$c0,$00,$00,$00,$00,$00,$00   ; [$903c] byte


;
; ........
; ........
; ........
; ........
; ..░░░░░░
; .░▒▒▒▒░░
; ░▒▒███▒▒
; ░▒█████▒
;
    .byte $00,$00,$00,$00,$3f,$43,$9c,$be   ; [$9044] byte
    .byte $00,$00,$00,$00,$00,$3c,$7f,$7f   ; [$904c] byte


;
; ........
; ........
; ........
; ........
; ........
; ░.......
; ░░░.....
; ▒▒░░░░..
;
    .byte $00,$00,$00,$00,$00,$80,$e0,$3c   ; [$9054] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$c0   ; [$905c] byte


;
; ........
; ...░.░.░
; ..░.░░░░
; ..░░░░▒░
; .░.░░▒▒▒
; ..░░▒▒▒█
; .░░▒▒███
; ..░░▒▒██
;
    .byte $00,$15,$2f,$3d,$58,$31,$67,$33   ; [$9064] byte
    .byte $00,$00,$00,$02,$07,$0f,$1f,$0f   ; [$906c] byte


;
; .....░.░
; .░...░░░
; ...░░░▒░
; ░.░░▒▒█▒
; .░░░▒▒▒█
; .░▒▒▒███
; ░░░▒████
; .▒▒▒████
;
    .byte $05,$47,$1d,$b2,$71,$47,$ef,$0f   ; [$9074] byte
    .byte $00,$00,$02,$0f,$0f,$3f,$1f,$7f   ; [$907c] byte


;
; ...▒.█▒░
; .▒.▒░▒█▒
; ..▒▒██▒█
; ░▒░▒█▒█▒
; .▒▒█████
; .▒█▒█▒██
; ▒▒▒█████
; .░▒▒████
;
    .byte $05,$0a,$0d,$aa,$1f,$2b,$1f,$4f   ; [$9084] byte
    .byte $16,$57,$3f,$5f,$7f,$7f,$ff,$3f   ; [$908c] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9094] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$909c] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90a4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90ac] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90b4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90bc] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90c4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90cc] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90d4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90dc] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90e4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90ec] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90f4] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$90fc] byte


;============================================================================
; Beginning of shield tiles.
;
; XREFS:
;     TILES_SHIELDS_SMALL [$PRG8::8192]
;     TILES_SHIELDS_START_REF [$PRG8::800a]
;============================================================================

;
; ........
; ░█░.....
; ░█▒░....
; ░██░░...
; ░█▒▒░...
; ░██▒░...
; ░█▒▒░...
; ░██▒░...
;
; XREFS:
;     TILES_SHIELDS_SMALL [$PRG8::8192]
;     TILES_SHIELDS_START_REF [$PRG8::800a]
;
TILES_SHIELDS_START_SMALL_SHIELD_01:        ; [$9104]
TILES_SMALL_SHIELD_01:
    .byte $00,$e0,$d0,$f8,$c8,$e8,$c8,$e8   ; [$9104] byte
    .byte $00,$40,$60,$60,$70,$70,$70,$70   ; [$910c] byte


;
; ░█▒▒░...
; ░██▒░...
; ░█▒░....
; ░█░.....
; .░......
; ........
; ........
; ........
;
TILE_SMALL_SHIELD_02:                       ; [$9114]
    .byte $c8,$e8,$d0,$e0,$40,$00,$00,$00   ; [$9114] byte
    .byte $70,$70,$60,$40,$00,$00,$00,$00   ; [$911c] byte


;
; ........
; .░......
; ░█░.....
; ░██░....
; ░█▒░░...
; ░██▒░...
; ░█▒▒░...
; ░██▒░...
;
; XREFS:
;     TILES_SHIELDS_LARGE [$PRG8::8198]
;
TILE_LARGE_SHIELD_01:                       ; [$9124]
    .byte $00,$40,$e0,$f0,$d8,$e8,$c8,$e8   ; [$9124] byte
    .byte $00,$00,$40,$60,$60,$70,$70,$70   ; [$912c] byte


;
; ░█▒▒░...
; ░██▒░...
; ░█▒▒░...
; ░██░....
; ░█░.....
; .░......
; ........
; ........
;
TILE_LARGE_SHIELD_02:                       ; [$9134]
    .byte $c8,$e8,$c8,$f0,$e0,$40,$00,$00   ; [$9134] byte
    .byte $70,$70,$70,$60,$40,$00,$00,$00   ; [$913c] byte


;
; ........
; ░█░.....
; ░█▒░....
; ░██░░...
; ░█▒▒░...
; ░██▒░...
; ░█▒▒░...
; ░██▒░...
;
; XREFS:
;     TILES_SHIELDS_MAGIC [$PRG8::819e]
;
TILE_MAGIC_SHIELD_01:                       ; [$9144]
    .byte $00,$e0,$d0,$f8,$c8,$e8,$c8,$e8   ; [$9144] byte
    .byte $00,$40,$60,$60,$70,$70,$70,$70   ; [$914c] byte


;
; ░█▒▒░...
; ░██▒░...
; ░█▒▒░...
; ░██▒░...
; ░█▒░....
; ░██░....
; .█░.....
; .░......
;
TILE_MAGIC_SHIELD_02:                       ; [$9154]
    .byte $c8,$e8,$c8,$e8,$d0,$f0,$60,$40   ; [$9154] byte
    .byte $70,$70,$70,$70,$60,$60,$40,$00   ; [$915c] byte


;
; ........
; ..█░░...
; .█░.....
; █░......
; █░...░..
; █░..░░..
; █░░░░...
; █░░░░...
;
TILE_SMALL_SHIELD_03:                       ; [$9164]
    .byte $00,$38,$60,$c0,$c4,$cc,$f8,$f8   ; [$9164] byte
    .byte $00,$20,$40,$80,$80,$80,$80,$80   ; [$916c] byte


;
; █░░░░...
; ▒░░░░...
; ░█░░....
; .░░.....
; ..░░░...
; ..░.....
; ........
; .░......
;
TILE_SMALL_SHIELD_04:                       ; [$9174]
    .byte $f8,$78,$f0,$60,$38,$20,$00,$40   ; [$9174] byte
    .byte $80,$80,$40,$00,$00,$00,$00,$00   ; [$917c] byte


;
; ........
; ..█░░...
; .█░.....
; █░......
; █░...░..
; █░..░░..
; █░░░░...
; █░░░░...
;
TILE_LARGE_SHIELD_03:                       ; [$9184]
    .byte $00,$38,$60,$c0,$c4,$cc,$f8,$f8   ; [$9184] byte
    .byte $00,$20,$40,$80,$80,$80,$80,$80   ; [$918c] byte


;
; █░░░░...
; █░░░░...
; █░░░....
; ░█░.....
; .░░░░...
; ..░.....
; ........
; .░......
;
TILE_LARGE_SHIELD_04:                       ; [$9194]
    .byte $f8,$f8,$f0,$e0,$78,$20,$00,$40   ; [$9194] byte
    .byte $80,$80,$80,$40,$00,$00,$00,$00   ; [$919c] byte


;
; ..██....
; .██░░...
; ▒█░.....
; █░......
; █░...░..
; █░..░░..
; █░░░░...
; █░░░░...
;
TILE_MAGIC_SHIELD_03:                       ; [$91a4]
    .byte $30,$78,$60,$c0,$c4,$cc,$f8,$f8   ; [$91a4] byte
    .byte $30,$60,$c0,$80,$80,$80,$80,$80   ; [$91ac] byte


;
; █░░░░...
; █░░░░...
; █░░░....
; █░░.....
; ▒▒░░░...
; .█░.....
; ........
; .░......
;
TILE_MAGIC_SHIELD_04:                       ; [$91b4]
    .byte $f8,$f8,$f0,$e0,$38,$60,$00,$40   ; [$91b4] byte
    .byte $80,$80,$80,$80,$c0,$40,$00,$00   ; [$91bc] byte


;
; ░░......
; ██░.....
; █░▒▒░...
; ░░██▒░..
; ░░░█▒░..
; ░░░█▒░..
; ░█░█▒░..
; ░█▒░▒░..
;
TILE_SMALL_SHIELD_05:                       ; [$91c4]
    .byte $c0,$e0,$c8,$f4,$f4,$f4,$f4,$d4   ; [$91c4] byte
    .byte $00,$c0,$b0,$38,$18,$18,$58,$68   ; [$91cc] byte


;
; ░██░▒░..
; ░██▒░░..
; ░░██░...
; ░░██▒░..
; ▒░░██░..
; ░░░░██..
; ░░░.....
; ░░░.....
;
TILE_SMALL_SHIELD_06:                       ; [$91d4]
    .byte $f4,$ec,$f8,$f4,$7c,$fc,$e0,$e0   ; [$91d4] byte
    .byte $68,$70,$30,$38,$98,$0c,$00,$00   ; [$91dc] byte


;
; ░░......
; ██░.....
; █░▒▒░...
; ░░██▒░..
; ░░░█▒░..
; ░█░█▒░..
; ██░█▒░..
; ██▒░▒░..
;
TILE_LARGE_SHIELD_05:                       ; [$91e4]
    .byte $c0,$e0,$c8,$f4,$f4,$f4,$f4,$d4   ; [$91e4] byte
    .byte $00,$c0,$b0,$38,$18,$58,$d8,$e8   ; [$91ec] byte


;
; ░██░▒░..
; ░██▒░░..
; ░░██░...
; ░░██▒░..
; ▒░░██░..
; ░░░███..
; ░░░.░█▒.
; ░░░.....
;
TILE_LARGE_SHIELD_06:                       ; [$91f4]
    .byte $f4,$ec,$f8,$f4,$7c,$fc,$ec,$e0   ; [$91f4] byte
    .byte $68,$70,$30,$38,$98,$1c,$06,$00   ; [$91fc] byte


;
; ░░......
; ██░.....
; █░▒▒░...
; ░░██▒░..
; ░█░█▒░..
; ██░█▒░..
; ██░█▒░..
; ██▒░▒░..
;
TILE_MAGIC_SHIELD_05:                       ; [$9204]
    .byte $c0,$e0,$c8,$f4,$f4,$f4,$f4,$d4   ; [$9204] byte
    .byte $00,$c0,$b0,$38,$58,$d8,$d8,$e8   ; [$920c] byte


;
; ░██░▒░..
; ░██▒░░..
; ░░██░...
; ░░██▒░..
; ▒░░██░..
; ░░░██░..
; ░░░.██..
; ░░░.░██.
;
TILE_MAGIC_SHIELD_06:                       ; [$9214]
    .byte $f4,$ec,$f8,$f4,$7c,$fc,$ec,$ee   ; [$9214] byte
    .byte $68,$70,$30,$38,$98,$18,$0c,$06   ; [$921c] byte


;============================================================================
; A mapping of portrait IDs (0-based) to tile address lists.
;
; Each entry in the tile address lists are single-byte
; values that are converted into a 16-bit value
; representing an address in this bank, relative to
; the start of the list of tiles
; (SPRITE_TILES_PORTRAIT_PINKSHIRT_00).
;
; As an example:
;
;     0x8A == $08A0
;           + $936B
;          == $9C0B
;
; A value of 0xFF means tile drawing is done for that
; portrait.
;
; XREFS:
;     TILES_PORTRAITS_ADDRS_INDEX_REF [$PRG8::800e]
;============================================================================

;
; XREFS:
;     TILES_PORTRAITS_ADDRS_INDEX_REF [$PRG8::800e]
;
SPRITE_TILES_PORTRAITS_ADDRS_INDEX:         ; [$9224]
    .word $123a                             ; SPRITE_TILES_PORTRAIT_ADDRS_KING
                                            ; [$PRG8::9224]
    .word $1252                             ; SPRITE_TILES_PORTRAIT_ADDRS_GURU
                                            ; [$PRG8::9226]
    .word $1265                             ; SPRITE_TILES_PORTRAIT_ADDRS_MARTIAL_ARTIST
                                            ; [$PRG8::9228]
    .word $1285                             ; SPRITE_TILES_PORTRAIT_ADDRS_MAGICIAN
                                            ; [$PRG8::922a]
    .word $1298                             ; SPRITE_TILES_PORTRAIT_ADDRS_DOCTOR
                                            ; [$PRG8::922c]
    .word $12b1                             ; SPRITE_TILES_PORTRAIT_ADDRS_NURSE
                                            ; [$PRG8::922e]
    .word $12cd                             ; SPRITE_TILES_PORTRAIT_ADDRS_PINKSHIRT
                                            ; [$PRG8::9230]
    .word $12e9                             ; SPRITE_TILES_PORTRAIT_ADDRS_SMOKING_GUY
                                            ; [$PRG8::9232]
    .word $1307                             ; SPRITE_TILES_PORTRAIT_ADDRS_MEAT_SALESMAN
                                            ; [$PRG8::9234]
    .word $132d                             ; SPRITE_TILES_PORTRAIT_ADDRS_TOOLS_SALESMAN
                                            ; [$PRG8::9236]
    .word $1343                             ; SPRITE_TILES_PORTRAIT_ADDRS_KEY_SALESMAN
                                            ; [$PRG8::9238]

;
; XREFS:
;     SPRITE_TILES_PORTRAITS_ADDRS_INDEX [$PRG8::9224]
;
SPRITE_TILES_PORTRAIT_ADDRS_KING:           ; [$923a]
    .byte $8a                               ; SPRITE_TILES_PORTRAIT_KING_00
                                            ; [$PRG8::923a]
    .byte $8b                               ; SPRITE_TILES_PORTRAIT_KING_01
                                            ; [$PRG8::923b]
    .byte $8c                               ; SPRITE_TILES_PORTRAIT_KING_02
                                            ; [$PRG8::923c]
    .byte $8d                               ; SPRITE_TILES_PORTRAIT_KING_03
                                            ; [$PRG8::923d]
    .byte $8e                               ; SPRITE_TILES_PORTRAIT_KING_04
                                            ; [$PRG8::923e]
    .byte $8f                               ; SPRITE_TILES_PORTRAIT_KING_05
                                            ; [$PRG8::923f]
    .byte $90                               ; SPRITE_TILES_PORTRAIT_KING_06
                                            ; [$PRG8::9240]
    .byte $91                               ; SPRITE_TILES_PORTRAIT_KING_07
                                            ; [$PRG8::9241]
    .byte $92                               ; SPRITE_TILES_PORTRAIT_KING_08
                                            ; [$PRG8::9242]
    .byte $93                               ; SPRITE_TILES_PORTRAIT_KING_09
                                            ; [$PRG8::9243]
    .byte $96                               ; SPRITE_TILES_PORTRAIT_KING_10
                                            ; [$PRG8::9244]
    .byte $94                               ; SPRITE_TILES_PORTRAIT_KING_11__MAGICIAN_09
                                            ; [$PRG8::9245]
    .byte $95                               ; SPRITE_TILES_PORTRAIT_KING_12
                                            ; [$PRG8::9246]
    .byte $98                               ; SPRITE_TILES_PORTRAIT_KING_13
                                            ; [$PRG8::9247]
    .byte $97                               ; SPRITE_TILES_PORTRAIT_KING_14
                                            ; [$PRG8::9248]
    .byte $60                               ; SPRITE_TILES_PORTRAIT_KING_15__MAGICIAN_10
                                            ; [$PRG8::9249]
    .byte $9a                               ; SPRITE_TILES_PORTRAIT_KING_16
                                            ; [$PRG8::924a]
    .byte $99                               ; SPRITE_TILES_PORTRAIT_KING_17
                                            ; [$PRG8::924b]
    .byte $63                               ; SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13
                                            ; [$PRG8::924c]
    .byte $65                               ; SPRITE_TILES_PORTRAIT_KING_19
                                            ; [$PRG8::924d]
    .byte $9b                               ; SPRITE_TILES_PORTRAIT_KING_20
                                            ; [$PRG8::924e]
    .byte $9c                               ; SPRITE_TILES_PORTRAIT_KING_21
                                            ; [$PRG8::924f]
    .byte $9d                               ; SPRITE_TILES_PORTRAIT_KING_22
                                            ; [$PRG8::9250]
    .byte $ff                               ; [$9251] byte

SPRITE_TILES_PORTRAIT_ADDRS_GURU:           ; [$9252]
    .byte $a8                               ; SPRITE_TILES_PORTRAIT_GURU_00
                                            ; [$PRG8::9252]
    .byte $a9                               ; SPRITE_TILES_PORTRAIT_GURU_01
                                            ; [$PRG8::9253]
    .byte $aa                               ; SPRITE_TILES_PORTRAIT_GURU_02
                                            ; [$PRG8::9254]
    .byte $ab                               ; SPRITE_TILES_PORTRAIT_GURU_03
                                            ; [$PRG8::9255]
    .byte $ac                               ; SPRITE_TILES_PORTRAIT_GURU_04
                                            ; [$PRG8::9256]
    .byte $ad                               ; SPRITE_TILES_PORTRAIT_GURU_05
                                            ; [$PRG8::9257]
    .byte $ae                               ; SPRITE_TILES_PORTRAIT_GURU_06
                                            ; [$PRG8::9258]
    .byte $af                               ; SPRITE_TILES_PORTRAIT_GURU_07
                                            ; [$PRG8::9259]
    .byte $29                               ; SPRITE_TILES_PORTRAIT_GURU_08__NURSE_12
                                            ; [$PRG8::925a]
    .byte $f1                               ; SPRITE_TILES_PORTRAIT_GURU_09
                                            ; [$PRG8::925b]
    .byte $63                               ; SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13
                                            ; [$PRG8::925c]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::925d]
    .byte $f2                               ; SPRITE_TILES_PORTRAIT_GURU_12
                                            ; [$PRG8::925e]
    .byte $f3                               ; SPRITE_TILES_PORTRAIT_GURU_13
                                            ; [$PRG8::925f]
    .byte $f4                               ; SPRITE_TILES_PORTRAIT_GURU_14
                                            ; [$PRG8::9260]
    .byte $f5                               ; SPRITE_TILES_PORTRAIT_GURU_15
                                            ; [$PRG8::9261]
    .byte $b0                               ; SPRITE_TILES_PORTRAIT_GURU_16
                                            ; [$PRG8::9262]
    .byte $b1                               ; SPRITE_TILES_PORTRAIT_GURU_17
                                            ; [$PRG8::9263]
    .byte $ff                               ; [$9264] byte

SPRITE_TILES_PORTRAIT_ADDRS_MARTIAL_ARTIST: ; [$9265]
    .byte $68                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_00
                                            ; [$PRG8::9265]
    .byte $69                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_01
                                            ; [$PRG8::9266]
    .byte $6a                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_02
                                            ; [$PRG8::9267]
    .byte $6b                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_03
                                            ; [$PRG8::9268]
    .byte $6c                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_04
                                            ; [$PRG8::9269]
    .byte $6d                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_05
                                            ; [$PRG8::926a]
    .byte $6e                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_06
                                            ; [$PRG8::926b]
    .byte $6f                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_07
                                            ; [$PRG8::926c]
    .byte $70                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_08
                                            ; [$PRG8::926d]
    .byte $71                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_09
                                            ; [$PRG8::926e]
    .byte $72                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_10
                                            ; [$PRG8::926f]
    .byte $73                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_11
                                            ; [$PRG8::9270]
    .byte $74                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_12
                                            ; [$PRG8::9271]
    .byte $75                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_13
                                            ; [$PRG8::9272]
    .byte $76                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_14
                                            ; [$PRG8::9273]
    .byte $77                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_15
                                            ; [$PRG8::9274]
    .byte $7b                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_16
                                            ; [$PRG8::9275]
    .byte $7a                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_17
                                            ; [$PRG8::9276]
    .byte $79                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_18
                                            ; [$PRG8::9277]
    .byte $7e                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_19
                                            ; [$PRG8::9278]
    .byte $7c                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_20
                                            ; [$PRG8::9279]
    .byte $7d                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_21
                                            ; [$PRG8::927a]
    .byte $81                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_22
                                            ; [$PRG8::927b]
    .byte $82                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_23
                                            ; [$PRG8::927c]
    .byte $7f                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_24
                                            ; [$PRG8::927d]
    .byte $83                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_25
                                            ; [$PRG8::927e]
    .byte $84                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_26
                                            ; [$PRG8::927f]
    .byte $78                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_27
                                            ; [$PRG8::9280]
    .byte $85                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_28
                                            ; [$PRG8::9281]
    .byte $86                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_29
                                            ; [$PRG8::9282]
    .byte $87                               ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_30
                                            ; [$PRG8::9283]
    .byte $ff                               ; [$9284] byte

SPRITE_TILES_PORTRAIT_ADDRS_MAGICIAN:       ; [$9285]
    .byte $51                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_00
                                            ; [$PRG8::9285]
    .byte $52                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_01
                                            ; [$PRG8::9286]
    .byte $53                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_02
                                            ; [$PRG8::9287]
    .byte $54                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_03
                                            ; [$PRG8::9288]
    .byte $55                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_04
                                            ; [$PRG8::9289]
    .byte $56                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_05
                                            ; [$PRG8::928a]
    .byte $57                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_06
                                            ; [$PRG8::928b]
    .byte $58                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_07
                                            ; [$PRG8::928c]
    .byte $ee                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_08__MEAT_SALESMAN_29
                                            ; [$PRG8::928d]
    .byte $94                               ; SPRITE_TILES_PORTRAIT_KING_11__MAGICIAN_09
                                            ; [$PRG8::928e]
    .byte $60                               ; SPRITE_TILES_PORTRAIT_KING_15__MAGICIAN_10
                                            ; [$PRG8::928f]
    .byte $80                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_11
                                            ; [$PRG8::9290]
    .byte $ef                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_12
                                            ; [$PRG8::9291]
    .byte $63                               ; SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13
                                            ; [$PRG8::9292]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::9293]
    .byte $2a                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22
                                            ; [$PRG8::9294]
    .byte $88                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_16
                                            ; [$PRG8::9295]
    .byte $89                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_17
                                            ; [$PRG8::9296]
    .byte $ff                               ; [$9297] byte

SPRITE_TILES_PORTRAIT_ADDRS_DOCTOR:         ; [$9298]
    .byte $e2                               ; SPRITE_TILES_PORTRAIT_DOCTOR_00
                                            ; [$PRG8::9298]
    .byte $e3                               ; SPRITE_TILES_PORTRAIT_DOCTOR_01
                                            ; [$PRG8::9299]
    .byte $b4                               ; SPRITE_TILES_PORTRAIT_DOCTOR_02__KEY_SALESMAN_02
                                            ; [$PRG8::929a]
    .byte $c2                               ; SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03
                                            ; [$PRG8::929b]
    .byte $a0                               ; SPRITE_TILES_PORTRAIT_DOCTOR_04__TOOLS_SALESMAN_02
                                            ; [$PRG8::929c]
    .byte $e4                               ; SPRITE_TILES_PORTRAIT_DOCTOR_05
                                            ; [$PRG8::929d]
    .byte $e5                               ; SPRITE_TILES_PORTRAIT_DOCTOR_06
                                            ; [$PRG8::929e]
    .byte $c6                               ; SPRITE_TILES_PORTRAIT_DOCTOR_07__SMOKING_GUY_07
                                            ; [$PRG8::929f]
    .byte $a2                               ; SPRITE_TILES_PORTRAIT_DOCTOR_08__TOOLS_SALESMAN_04
                                            ; [$PRG8::92a0]
    .byte $a3                               ; SPRITE_TILES_PORTRAIT_DOCTOR_09__TOOLS_SALESMAN_05
                                            ; [$PRG8::92a1]
    .byte $ca                               ; SPRITE_TILES_PORTRAIT_DOCTOR_10__SMOKING_GUY_11
                                            ; [$PRG8::92a2]
    .byte $ea                               ; SPRITE_TILES_PORTRAIT_DOCTOR_11
                                            ; [$PRG8::92a3]
    .byte $e6                               ; SPRITE_TILES_PORTRAIT_DOCTOR_12__MEAT_SALESMAN_22
                                            ; [$PRG8::92a4]
    .byte $e7                               ; SPRITE_TILES_PORTRAIT_DOCTOR_13
                                            ; [$PRG8::92a5]
    .byte $eb                               ; SPRITE_TILES_PORTRAIT_DOCTOR_14
                                            ; [$PRG8::92a6]
    .byte $ec                               ; SPRITE_TILES_PORTRAIT_DOCTOR_15
                                            ; [$PRG8::92a7]
    .byte $e9                               ; SPRITE_TILES_PORTRAIT_DOCTOR_16__MEAT_SALESMAN_28
                                            ; [$PRG8::92a8]
    .byte $ce                               ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::92a9]
    .byte $f0                               ; SPRITE_TILES_PORTRAIT_DOCTOR_18
                                            ; [$PRG8::92aa]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::92ab]
    .byte $db                               ; SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33
                                            ; [$PRG8::92ac]
    .byte $dc                               ; SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34
                                            ; [$PRG8::92ad]
    .byte $a6                               ; SPRITE_TILES_PORTRAIT_DOCTOR_22__TOOLS_SALESMAN_19
                                            ; [$PRG8::92ae]
    .byte $e8                               ; SPRITE_TILES_PORTRAIT_DOCTOR_23
                                            ; [$PRG8::92af]
    .byte $ff                               ; [$92b0] byte

SPRITE_TILES_PORTRAIT_ADDRS_NURSE:          ; [$92b1]
    .byte $1a                               ; SPRITE_TILES_PORTRAIT_NURSE_00__KEY_SALESMAN_16
                                            ; [$PRG8::92b1]
    .byte $1b                               ; SPRITE_TILES_PORTRAIT_NURSE_01
                                            ; [$PRG8::92b2]
    .byte $1c                               ; SPRITE_TILES_PORTRAIT_NURSE_02
                                            ; [$PRG8::92b3]
    .byte $1d                               ; SPRITE_TILES_PORTRAIT_NURSE_03
                                            ; [$PRG8::92b4]
    .byte $1e                               ; SPRITE_TILES_PORTRAIT_NURSE_04
                                            ; [$PRG8::92b5]
    .byte $1f                               ; SPRITE_TILES_PORTRAIT_NURSE_05
                                            ; [$PRG8::92b6]
    .byte $20                               ; SPRITE_TILES_PORTRAIT_NURSE_06
                                            ; [$PRG8::92b7]
    .byte $21                               ; SPRITE_TILES_PORTRAIT_NURSE_07
                                            ; [$PRG8::92b8]
    .byte $22                               ; SPRITE_TILES_PORTRAIT_NURSE_08
                                            ; [$PRG8::92b9]
    .byte $23                               ; SPRITE_TILES_PORTRAIT_NURSE_09
                                            ; [$PRG8::92ba]
    .byte $24                               ; SPRITE_TILES_PORTRAIT_NURSE_10
                                            ; [$PRG8::92bb]
    .byte $25                               ; SPRITE_TILES_PORTRAIT_NURSE_11
                                            ; [$PRG8::92bc]
    .byte $29                               ; SPRITE_TILES_PORTRAIT_GURU_08__NURSE_12
                                            ; [$PRG8::92bd]
    .byte $27                               ; SPRITE_TILES_PORTRAIT_NURSE_13
                                            ; [$PRG8::92be]
    .byte $28                               ; SPRITE_TILES_PORTRAIT_NURSE_14
                                            ; [$PRG8::92bf]
    .byte $2c                               ; SPRITE_TILES_PORTRAIT_NURSE_15
                                            ; [$PRG8::92c0]
    .byte $2a                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22
                                            ; [$PRG8::92c1]
    .byte $2b                               ; SPRITE_TILES_PORTRAIT_NURSE_17
                                            ; [$PRG8::92c2]
    .byte $2f                               ; SPRITE_TILES_PORTRAIT_NURSE_18
                                            ; [$PRG8::92c3]
    .byte $2d                               ; SPRITE_TILES_PORTRAIT_NURSE_19
                                            ; [$PRG8::92c4]
    .byte $2e                               ; SPRITE_TILES_PORTRAIT_NURSE_20
                                            ; [$PRG8::92c5]
    .byte $30                               ; SPRITE_TILES_PORTRAIT_NURSE_21
                                            ; [$PRG8::92c6]
    .byte $31                               ; SPRITE_TILES_PORTRAIT_NURSE_22
                                            ; [$PRG8::92c7]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::92c8]
    .byte $32                               ; SPRITE_TILES_PORTRAIT_NURSE_24
                                            ; [$PRG8::92c9]
    .byte $33                               ; SPRITE_TILES_PORTRAIT_NURSE_25
                                            ; [$PRG8::92ca]
    .byte $26                               ; SPRITE_TILES_PORTRAIT_NURSE_26
                                            ; [$PRG8::92cb]
    .byte $ff                               ; [$92cc] byte

SPRITE_TILES_PORTRAIT_ADDRS_PINKSHIRT:      ; [$92cd]
    .byte $00                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_00
                                            ; [$PRG8::92cd]
    .byte $01                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_01
                                            ; [$PRG8::92ce]
    .byte $02                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_02
                                            ; [$PRG8::92cf]
    .byte $03                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_03
                                            ; [$PRG8::92d0]
    .byte $04                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_04
                                            ; [$PRG8::92d1]
    .byte $05                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_05
                                            ; [$PRG8::92d2]
    .byte $06                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_06
                                            ; [$PRG8::92d3]
    .byte $07                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_07
                                            ; [$PRG8::92d4]
    .byte $08                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_08
                                            ; [$PRG8::92d5]
    .byte $09                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_09
                                            ; [$PRG8::92d6]
    .byte $0a                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_10
                                            ; [$PRG8::92d7]
    .byte $0b                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_11
                                            ; [$PRG8::92d8]
    .byte $0c                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_12
                                            ; [$PRG8::92d9]
    .byte $0d                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_13
                                            ; [$PRG8::92da]
    .byte $10                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_14__SMOKING_GUY_18
                                            ; [$PRG8::92db]
    .byte $11                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_15__SMOKING_GUY_19
                                            ; [$PRG8::92dc]
    .byte $0e                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_16
                                            ; [$PRG8::92dd]
    .byte $0f                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_17
                                            ; [$PRG8::92de]
    .byte $ce                               ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::92df]
    .byte $12                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_19__SMOKING_GUY_23
                                            ; [$PRG8::92e0]
    .byte $13                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_20__SMOKING_GUY_24
                                            ; [$PRG8::92e1]
    .byte $14                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_21
                                            ; [$PRG8::92e2]
    .byte $15                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_22
                                            ; [$PRG8::92e3]
    .byte $16                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_23
                                            ; [$PRG8::92e4]
    .byte $17                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_24
                                            ; [$PRG8::92e5]
    .byte $18                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_25
                                            ; [$PRG8::92e6]
    .byte $19                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_26
                                            ; [$PRG8::92e7]
    .byte $ff                               ; [$92e8] byte

SPRITE_TILES_PORTRAIT_ADDRS_SMOKING_GUY:    ; [$92e9]
    .byte $bf                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_00
                                            ; [$PRG8::92e9]
    .byte $c0                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_01
                                            ; [$PRG8::92ea]
    .byte $c1                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_02
                                            ; [$PRG8::92eb]
    .byte $c2                               ; SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03
                                            ; [$PRG8::92ec]
    .byte $c3                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_04
                                            ; [$PRG8::92ed]
    .byte $c4                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_05
                                            ; [$PRG8::92ee]
    .byte $c5                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_06
                                            ; [$PRG8::92ef]
    .byte $c6                               ; SPRITE_TILES_PORTRAIT_DOCTOR_07__SMOKING_GUY_07
                                            ; [$PRG8::92f0]
    .byte $c7                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_08
                                            ; [$PRG8::92f1]
    .byte $c8                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_09
                                            ; [$PRG8::92f2]
    .byte $c9                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_10
                                            ; [$PRG8::92f3]
    .byte $ca                               ; SPRITE_TILES_PORTRAIT_DOCTOR_10__SMOKING_GUY_11
                                            ; [$PRG8::92f4]
    .byte $cb                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_12__KEY_SALESMAN_12
                                            ; [$PRG8::92f5]
    .byte $cc                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_13__KEY_SALESMAN_13
                                            ; [$PRG8::92f6]
    .byte $d0                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_14__KEY_SALESMAN_14
                                            ; [$PRG8::92f7]
    .byte $d1                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_15__KEY_SALESMAN_15
                                            ; [$PRG8::92f8]
    .byte $44                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_16__KEY_SALESMAN_18
                                            ; [$PRG8::92f9]
    .byte $45                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_17
                                            ; [$PRG8::92fa]
    .byte $10                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_14__SMOKING_GUY_18
                                            ; [$PRG8::92fb]
    .byte $11                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_15__SMOKING_GUY_19
                                            ; [$PRG8::92fc]
    .byte $46                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_20__KEY_SALESMAN_24
                                            ; [$PRG8::92fd]
    .byte $47                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_21__KEY_SALESMAN_25
                                            ; [$PRG8::92fe]
    .byte $ce                               ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::92ff]
    .byte $12                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_19__SMOKING_GUY_23
                                            ; [$PRG8::9300]
    .byte $13                               ; SPRITE_TILES_PORTRAIT_PINKSHIRT_20__SMOKING_GUY_24
                                            ; [$PRG8::9301]
    .byte $d2                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_25
                                            ; [$PRG8::9302]
    .byte $d3                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_26
                                            ; [$PRG8::9303]
    .byte $d4                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_27__KEY_SALESMAN_37
                                            ; [$PRG8::9304]
    .byte $d5                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_28__KEY_SALESMAN_38
                                            ; [$PRG8::9305]
    .byte $ff                               ; [$9306] byte

SPRITE_TILES_PORTRAIT_ADDRS_MEAT_SALESMAN:  ; [$9307]
    .byte $36                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_00
                                            ; [$PRG8::9307]
    .byte $37                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_01
                                            ; [$PRG8::9308]
    .byte $38                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_02
                                            ; [$PRG8::9309]
    .byte $39                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_03
                                            ; [$PRG8::930a]
    .byte $3a                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_04
                                            ; [$PRG8::930b]
    .byte $3b                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_05
                                            ; [$PRG8::930c]
    .byte $3c                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_06
                                            ; [$PRG8::930d]
    .byte $3d                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_07
                                            ; [$PRG8::930e]
    .byte $3e                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_08
                                            ; [$PRG8::930f]
    .byte $3f                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_09
                                            ; [$PRG8::9310]
    .byte $4d                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_10
                                            ; [$PRG8::9311]
    .byte $40                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_11
                                            ; [$PRG8::9312]
    .byte $41                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_12
                                            ; [$PRG8::9313]
    .byte $42                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_13
                                            ; [$PRG8::9314]
    .byte $43                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_14
                                            ; [$PRG8::9315]
    .byte $e1                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_15
                                            ; [$PRG8::9316]
    .byte $5b                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_16
                                            ; [$PRG8::9317]
    .byte $5c                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_17
                                            ; [$PRG8::9318]
    .byte $5d                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_18
                                            ; [$PRG8::9319]
    .byte $5e                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_19
                                            ; [$PRG8::931a]
    .byte $66                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_20
                                            ; [$PRG8::931b]
    .byte $e0                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_21
                                            ; [$PRG8::931c]
    .byte $e6                               ; SPRITE_TILES_PORTRAIT_DOCTOR_12__MEAT_SALESMAN_22
                                            ; [$PRG8::931d]
    .byte $ce                               ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::931e]
    .byte $61                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_24
                                            ; [$PRG8::931f]
    .byte $62                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_25
                                            ; [$PRG8::9320]
    .byte $64                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_26
                                            ; [$PRG8::9321]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::9322]
    .byte $e9                               ; SPRITE_TILES_PORTRAIT_DOCTOR_16__MEAT_SALESMAN_28
                                            ; [$PRG8::9323]
    .byte $ee                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_08__MEAT_SALESMAN_29
                                            ; [$PRG8::9324]
    .byte $4c                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_30
                                            ; [$PRG8::9325]
    .byte $67                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_31
                                            ; [$PRG8::9326]
    .byte $4e                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_32
                                            ; [$PRG8::9327]
    .byte $4f                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_33
                                            ; [$PRG8::9328]
    .byte $50                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_34
                                            ; [$PRG8::9329]
    .byte $59                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_35
                                            ; [$PRG8::932a]
    .byte $5a                               ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_36
                                            ; [$PRG8::932b]
    .byte $ff                               ; [$932c] byte

SPRITE_TILES_PORTRAIT_ADDRS_TOOLS_SALESMAN: ; [$932d]
    .byte $9e                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_00
                                            ; [$PRG8::932d]
    .byte $9f                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_01
                                            ; [$PRG8::932e]
    .byte $a0                               ; SPRITE_TILES_PORTRAIT_DOCTOR_04__TOOLS_SALESMAN_02
                                            ; [$PRG8::932f]
    .byte $a1                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_03
                                            ; [$PRG8::9330]
    .byte $a2                               ; SPRITE_TILES_PORTRAIT_DOCTOR_08__TOOLS_SALESMAN_04
                                            ; [$PRG8::9331]
    .byte $a3                               ; SPRITE_TILES_PORTRAIT_DOCTOR_09__TOOLS_SALESMAN_05
                                            ; [$PRG8::9332]
    .byte $a4                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_06
                                            ; [$PRG8::9333]
    .byte $a5                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_07
                                            ; [$PRG8::9334]
    .byte $d6                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_08
                                            ; [$PRG8::9335]
    .byte $d7                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_09
                                            ; [$PRG8::9336]
    .byte $d8                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_10
                                            ; [$PRG8::9337]
    .byte $d9                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_11
                                            ; [$PRG8::9338]
    .byte $da                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_12__KEY_SALESMAN_26
                                            ; [$PRG8::9339]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::933a]
    .byte $db                               ; SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33
                                            ; [$PRG8::933b]
    .byte $dc                               ; SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34
                                            ; [$PRG8::933c]
    .byte $dd                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_16
                                            ; [$PRG8::933d]
    .byte $de                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_17
                                            ; [$PRG8::933e]
    .byte $df                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_18
                                            ; [$PRG8::933f]
    .byte $a6                               ; SPRITE_TILES_PORTRAIT_DOCTOR_22__TOOLS_SALESMAN_19
                                            ; [$PRG8::9340]
    .byte $a7                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_20
                                            ; [$PRG8::9341]
    .byte $ff                               ; [$9342] byte

SPRITE_TILES_PORTRAIT_ADDRS_KEY_SALESMAN:   ; [$9343]
    .byte $b2                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_00
                                            ; [$PRG8::9343]
    .byte $b3                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_01
                                            ; [$PRG8::9344]
    .byte $b4                               ; SPRITE_TILES_PORTRAIT_DOCTOR_02__KEY_SALESMAN_02
                                            ; [$PRG8::9345]
    .byte $c2                               ; SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03
                                            ; [$PRG8::9346]
    .byte $b5                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_04
                                            ; [$PRG8::9347]
    .byte $b6                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_05
                                            ; [$PRG8::9348]
    .byte $b7                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_06
                                            ; [$PRG8::9349]
    .byte $b8                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_07
                                            ; [$PRG8::934a]
    .byte $b9                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_08
                                            ; [$PRG8::934b]
    .byte $ba                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_09
                                            ; [$PRG8::934c]
    .byte $bb                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_10
                                            ; [$PRG8::934d]
    .byte $bc                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_11
                                            ; [$PRG8::934e]
    .byte $cb                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_12__KEY_SALESMAN_12
                                            ; [$PRG8::934f]
    .byte $cc                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_13__KEY_SALESMAN_13
                                            ; [$PRG8::9350]
    .byte $d0                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_14__KEY_SALESMAN_14
                                            ; [$PRG8::9351]
    .byte $d1                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_15__KEY_SALESMAN_15
                                            ; [$PRG8::9352]
    .byte $1a                               ; SPRITE_TILES_PORTRAIT_NURSE_00__KEY_SALESMAN_16
                                            ; [$PRG8::9353]
    .byte $48                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_17
                                            ; [$PRG8::9354]
    .byte $44                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_16__KEY_SALESMAN_18
                                            ; [$PRG8::9355]
    .byte $fa                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_19
                                            ; [$PRG8::9356]
    .byte $fb                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_20
                                            ; [$PRG8::9357]
    .byte $fc                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_21
                                            ; [$PRG8::9358]
    .byte $2a                               ; SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22
                                            ; [$PRG8::9359]
    .byte $cf                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_23
                                            ; [$PRG8::935a]
    .byte $46                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_20__KEY_SALESMAN_24
                                            ; [$PRG8::935b]
    .byte $47                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_21__KEY_SALESMAN_25
                                            ; [$PRG8::935c]
    .byte $da                               ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_12__KEY_SALESMAN_26
                                            ; [$PRG8::935d]
    .byte $fd                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_27
                                            ; [$PRG8::935e]
    .byte $49                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_28
                                            ; [$PRG8::935f]
    .byte $4a                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_29
                                            ; [$PRG8::9360]
    .byte $cd                               ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::9361]
    .byte $34                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_31
                                            ; [$PRG8::9362]
    .byte $fe                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_32
                                            ; [$PRG8::9363]
    .byte $db                               ; SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33
                                            ; [$PRG8::9364]
    .byte $dc                               ; SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34
                                            ; [$PRG8::9365]
    .byte $bd                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_35
                                            ; [$PRG8::9366]
    .byte $be                               ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_36
                                            ; [$PRG8::9367]
    .byte $d4                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_27__KEY_SALESMAN_37
                                            ; [$PRG8::9368]
    .byte $d5                               ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_28__KEY_SALESMAN_38
                                            ; [$PRG8::9369]
    .byte $ff                               ; [$936a] byte


;============================================================================
; Beginning of portrait tiles.
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_PINKSHIRT [$PRG8::92cd]
;     TILES_PORTRAITS_START_REF [$PRG8::8010]
;============================================================================

;
; ........
; .......░
; ......░█
; ....░▒█▒
; ....░█▒▒
; ....▒█░.
; ...░█░..
; ..▒█▒░.▒
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_PINKSHIRT [$PRG8::92cd]
;     TILES_PORTRAITS_START_REF [$PRG8::8010]
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_00:         ; [$936b]
    .byte $00,$01,$03,$0a,$0c,$06,$1c,$14   ; [$936b] byte
    .byte $00,$00,$01,$07,$07,$0c,$08,$39   ; [$9373] byte


;
; ..▒▒░▒▒▒
; ▒▒██▒█░▒
; ▒░▒..░▒▒
; ▒..▒▒...
; .▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒▒
; ▒░.░░▒▒▒
; ░....░.▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_01:         ; [$937b]
    .byte $08,$36,$44,$00,$00,$00,$58,$84   ; [$937b] byte
    .byte $37,$fd,$a3,$98,$7e,$ff,$87,$01   ; [$9383] byte


;
; ...█░.▒░
; ..▒▒▒.▒░
; ..░█░.▒▒
; .░░▒░.▒░
; ░█▒█▒.▒░
; ▒░█▒░.░▒
; ▒▒░█▒░░░
; ▒▒░█▒░▒▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_02:         ; [$938b]
    .byte $19,$01,$38,$69,$d1,$6a,$37,$34   ; [$938b] byte
    .byte $12,$3a,$13,$12,$7a,$b1,$d8,$db   ; [$9393] byte


;
; ░▒░░░▒▒▒
; ▒░░░░░▒▒
; ▒....░░░
; .███▒░░░
; █▒█░█░▒▒
; ▒█..█░▒█
; ▒▒▒▒░░▒█
; ▒░░░▒░██
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_03:         ; [$939b]
    .byte $b8,$7c,$07,$77,$bc,$4d,$0d,$77   ; [$939b] byte
    .byte $47,$83,$80,$78,$eb,$cb,$f3,$8b   ; [$93a3] byte


;
; ▒░.░░░.░
; ..░░░░▒.
; ░░░...░░
; ░░.███▒▒
; ▒░█▒█.█▒
; ▒░▒▒..█░
; ▒░▒▒▒▒░▒
; ▒▒░▒▒░░▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_04:         ; [$93ab]
    .byte $5d,$3c,$e3,$dc,$6a,$43,$42,$26   ; [$93ab] byte
    .byte $80,$02,$00,$1f,$bb,$b2,$bd,$d9   ; [$93b3] byte


;
; ░▒.░░░..
; ░▒▒.▒░..
; ▒▒▒.▒░..
; ▒▒▒.░░░.
; ▒▒▒░░▒█░
; ░▒▒░▒█░▒
; ▒▒▒░█░▒▒
; ▒▒▒░█░▒▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_05:         ; [$93bb]
    .byte $9c,$84,$04,$0e,$1b,$96,$1c,$1c   ; [$93bb] byte
    .byte $40,$68,$e8,$e0,$e6,$6d,$eb,$eb   ; [$93c3] byte


;
; ▒░░▒▒░▒▒
; ▒▒░░░▒▒▒
; █▒▒░░▒██
; ░▒▒░░▒█▒
; .░░░░▒█▒
; ..░░░░▒▒
; ...░░▒░░
; ...░░▒▒░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_06:         ; [$93cb]
    .byte $64,$38,$9b,$9a,$7a,$3c,$1b,$19   ; [$93cb] byte
    .byte $9b,$c7,$e7,$67,$07,$03,$04,$06   ; [$93d3] byte


;
; ▒▒▒▒.▒██
; ▒▒▒▒.░▒▒
; ▒▒▒.░.░░
; ▒▒▒.██..
; ▒▒.▒█▒▒░
; ▒.▒▒░░░░
; ..░░▒███
; ▒.░▒▒██▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_07:         ; [$93db]
    .byte $03,$04,$0b,$0c,$09,$0f,$37,$26   ; [$93db] byte
    .byte $f7,$f3,$e0,$ec,$de,$b0,$0f,$9f   ; [$93e3] byte


;
; █▒░░▒▒░░
; ▒░.░▒█▒▒
; ░.░░▒█▒▒
; .░▒▒░▒▒▒
; ░▒▒▒░░▒▒
; ░░░▒▒░.█
; █▒▒░.▒.▒
; ▒▒▒▒░..▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_08:         ; [$93eb]
    .byte $b3,$54,$b4,$48,$8c,$e5,$90,$08   ; [$93eb] byte
    .byte $cc,$8f,$0f,$37,$73,$19,$e5,$f1   ; [$93f3] byte


;
; ▒▒▒░░░░▒
; ▒▒▒░░░▒▒
; ▒▒▒░░▒▒█
; ▒▒▒░░░▒░
; ▒▒░░░░░.
; ▒▒░▒░░..
; ▒▒░▒░...
; ▒▒▒▒░...
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_09:         ; [$93fb]
    .byte $1e,$1c,$19,$1d,$3e,$2c,$28,$08   ; [$93fb] byte
    .byte $e1,$e3,$e7,$e2,$c0,$d0,$d0,$f0   ; [$9403] byte


;
; ....░▒▒░
; ....░▒█▒
; .....░▒▒
; .....░▒▒
; .......░
; .......░
; ........
; ........
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_10:         ; [$940b]
    .byte $09,$0a,$04,$04,$01,$01,$00,$00   ; [$940b] byte
    .byte $06,$07,$03,$03,$00,$00,$00,$00   ; [$9413] byte


;
; ▒.▒▒▒▒▒▒
; ▒.▒▒▒▒░░
; ▒░▒▒▒▒▒░
; ▒▒▒▒██▒▒
; ░▒▒▒█▒▒▒
; ░░▒▒▒▒▒▒
; ░░░░▒▒▒▒
; ░░░░░░░░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_11:         ; [$941b]
    .byte $00,$03,$41,$0c,$88,$c0,$f0,$ff   ; [$941b] byte
    .byte $bf,$bc,$be,$ff,$7f,$3f,$0f,$00   ; [$9423] byte


;
; ▒▒▒▒▒▒.▒
; ░░░▒▒▒░▒
; ..░▒▒▒░▒
; ▒▒▒▒░▒▒▒
; ▒▒▒▒░▒▒▒
; ▒▒▒░░▒░░
; ▒░░░░░░░
; ░░░░░░░░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_12:         ; [$942b]
    .byte $00,$e2,$22,$08,$08,$1b,$7f,$ff   ; [$942b] byte
    .byte $fd,$1d,$1d,$f7,$f7,$e4,$80,$00   ; [$9433] byte


;
; ▒▒▒░░...
; ▒▒▒░....
; ▒▒░░....
; ▒░░.....
; ░░......
; ░.......
; ░.......
; ░.......
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_13:         ; [$943b]
    .byte $18,$10,$30,$60,$c0,$80,$80,$80   ; [$943b] byte
    .byte $e0,$e0,$c0,$80,$00,$00,$00,$00   ; [$9443] byte


;
; ▒▒▒▒░▒░▒
; ▒▒█▒▒▒▒░
; ░▒▒█▒▒▒▒
; ░▒▒█▒▒▒▒
; ▒░▒▒█▒▒▒
; █▒░▒▒▒▒▒
; ██▒░▒▒▒▒
; ░██▒░▒▒▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_16:         ; [$944b]
    .byte $0a,$21,$90,$90,$48,$a0,$d0,$e8   ; [$944b] byte
    .byte $f5,$fe,$7f,$7f,$bf,$df,$ef,$77   ; [$9453] byte


;
; ░▒░░░░░░
; ▒░░░░░░░
; ░░░░░░░░
; ▒░░░░░░░
; ▒▒▒░░░░█
; ▒▒▒▒░░██
; ▒▒▒▒░███
; ▒▒▒░███░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_17:         ; [$945b]
    .byte $bf,$7f,$ff,$7f,$1f,$0f,$0f,$1f   ; [$945b] byte
    .byte $40,$80,$00,$80,$e1,$f3,$f7,$ee   ; [$9463] byte


;
; ........
; ........
; .......░
; .....░▒▒
; ...░▒▒▒▒
; ..░▒▒▒▒▒
; .░▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_14__SMOKING_GUY_18: ; [$946b]
    .byte $00,$00,$01,$04,$10,$20,$40,$00   ; [$946b] byte
    .byte $00,$00,$00,$03,$0f,$1f,$3f,$7f   ; [$9473] byte


;
; ........
; .░▒▒▒░█░
; ▒▒▒▒░▒██
; ▒▒▒▒░▒██
; ▒▒▒▒▒░▒█
; ▒▒▒▒▒▒░▒
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_15__SMOKING_GUY_19: ; [$947b]
    .byte $00,$47,$0b,$0b,$05,$02,$01,$00   ; [$947b] byte
    .byte $00,$3a,$f7,$f7,$fb,$fd,$fe,$ff   ; [$9483] byte


;
; ▒░▒██░▒▒
; ▒▒░▒█░▒▒
; ░▒▒░█░▒▒
; ░..░█░▒▒
; ▒▒▒..░▒▒
; ░▒▒░█..▒
; ░..░█░▒.
; ▒▒▒░█..▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_19__SMOKING_GUY_23: ; [$948b]
    .byte $5c,$2c,$9c,$9c,$04,$98,$9c,$18   ; [$948b] byte
    .byte $bb,$db,$6b,$0b,$e3,$69,$0a,$e9   ; [$9493] byte


;
; ░▒▒..░.▒
; ░..░█░▒.
; ▒▒▒░█..▒
; ░▒▒..░▒▒
; ░..░█░▒▒
; ▒▒▒░██░░
; ▒▒▒▒░███
; ▒▒▒▒▒░░░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_20__SMOKING_GUY_24: ; [$949b]
    .byte $84,$9c,$18,$84,$9c,$1f,$0f,$07   ; [$949b] byte
    .byte $61,$0a,$e9,$63,$0b,$ec,$f7,$f8   ; [$94a3] byte


;
; ░▒░░░▒▒▒
; ▒▒▒░░░▒▒
; ▒██▒▒░░░
; ▒█▒▒▒░░░
; .▒▒░.░▒▒
; ▒...░░▒█
; ▒▒▒▒░░▒█
; ▒░░░▒░██
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_21:         ; [$94ab]
    .byte $b8,$1c,$67,$47,$14,$0d,$0d,$77   ; [$94ab] byte
    .byte $47,$e3,$f8,$f8,$63,$83,$f3,$8b   ; [$94b3] byte


;
; ▒░.░░░.░
; ..░░░░▒.
; ░░░▒▒▒░░
; ░░▒▒█▒▒▒
; ▒░.▒▒▒▒.
; ▒░▒░...▒
; ▒░▒▒▒▒░▒
; ▒▒░▒▒░░▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_22:         ; [$94bb]
    .byte $5d,$3c,$e3,$c8,$40,$50,$42,$26   ; [$94bb] byte
    .byte $80,$02,$1c,$3f,$9e,$a1,$bd,$d9   ; [$94c3] byte


;
; ▒▒▒▒.▒██
; ▒▒▒▒.░▒▒
; ▒▒▒.░.░░
; ▒▒▒.██..
; ▒▒.▒█▒▒░
; ▒.▒▒░░░░
; ..░.░▒█▒
; ▒.▒.....
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_23:         ; [$94cb]
    .byte $03,$04,$0b,$0c,$09,$0f,$2a,$00   ; [$94cb] byte
    .byte $f7,$f3,$e0,$ec,$de,$b0,$07,$a0   ; [$94d3] byte


;
; █▒░░▒▒░░
; ▒░.░▒█▒▒
; ░.░░▒█▒▒
; .░▒▒░▒▒▒
; ░▒▒▒░░▒▒
; ░░░░▒░.█
; █▒█▒.▒.▒
; .......▒
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_24:         ; [$94db]
    .byte $b3,$54,$b4,$48,$8c,$f5,$a0,$00   ; [$94db] byte
    .byte $cc,$8f,$0f,$37,$73,$09,$f5,$01   ; [$94e3] byte


;
; ▒.▒█▒███
; ▒.▒▒▒███
; ▒░▒▒▒▒▒▒
; ▒▒▒▒██▒░
; ░▒▒▒█▒▒▒
; ░░▒▒▒▒▒▒
; ░░░░▒▒▒▒
; ░░░░░░░░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_25:         ; [$94eb]
    .byte $17,$07,$40,$0d,$88,$c0,$f0,$ff   ; [$94eb] byte
    .byte $bf,$bf,$bf,$fe,$7f,$3f,$0f,$00   ; [$94f3] byte


;
; ▒▒▒▒▒▒.▒
; ▒▒▒▒▒▒░▒
; ░░▒▒▒▒░▒
; ░░░▒░▒▒▒
; ▒▒▒▒░▒▒▒
; ▒▒▒░░▒░░
; ▒░░░░░░░
; ░░░░░░░░
;
SPRITE_TILES_PORTRAIT_PINKSHIRT_26:         ; [$94fb]
    .byte $00,$02,$c2,$e8,$08,$1b,$7f,$ff   ; [$94fb] byte
    .byte $fd,$fd,$3d,$17,$f7,$e4,$80,$00   ; [$9503] byte


;
; ......▒█
; ....▒▒██
; .░██████
; ░███████
; ████████
; ████████
; ████████
; ░███████
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_NURSE [$PRG8::92b1]
;
SPRITE_TILES_PORTRAIT_NURSE_00__KEY_SALESMAN_16: ; [$950b]
    .byte $01,$03,$7f,$ff,$ff,$ff,$ff,$ff   ; [$950b] byte
    .byte $03,$0f,$3f,$7f,$ff,$ff,$ff,$7f   ; [$9513] byte


;
; .......░
; ......▒█
; .....▒▒█
; .....▒██
; ....▒▒█▒
; ....▒██▒
; ....▒██░
; ....██░█
;
SPRITE_TILES_PORTRAIT_NURSE_01:             ; [$951b]
    .byte $01,$01,$01,$03,$02,$06,$07,$0f   ; [$951b] byte
    .byte $00,$03,$07,$07,$0f,$0f,$0e,$0d   ; [$9523] byte


;
; ▒░░░░░░░
; █▒██████
; ███████▒
; ▒████▒▒░
; ▒███▒░░.
; ███▒░▒▒▒
; ██▒░░░░▒
; █▒░▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_02:             ; [$952b]
    .byte $7f,$bf,$fe,$79,$76,$e8,$de,$a0   ; [$952b] byte
    .byte $80,$ff,$ff,$fe,$f8,$f7,$e1,$df   ; [$9533] byte


;
; ░░░▒▒.▒█
; ██████▒▒
; ▒██▒█▒▒▒
; .██░▒█▒▒
; ██░▒█░░░
; ░░▒▒░▒▒░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒░░░
;
SPRITE_TILES_PORTRAIT_NURSE_03:             ; [$953b]
    .byte $e1,$fc,$68,$74,$ef,$c9,$00,$07   ; [$953b] byte
    .byte $1b,$ff,$ff,$6f,$d8,$36,$ff,$f8   ; [$9543] byte


;
; ░.......
; ░░......
; ▒░......
; ▒░......
; ▒░░.....
; ░▒░.....
; ░▒░░....
; ░░░░....
;
SPRITE_TILES_PORTRAIT_NURSE_04:             ; [$954b]
    .byte $80,$c0,$40,$40,$60,$a0,$b0,$f0   ; [$954b] byte
    .byte $00,$00,$80,$80,$80,$40,$40,$00   ; [$9553] byte


;
; ....█░▒░
; ...░█░▒░
; ...░█░▒░
; ...▒█▒░▒
; ...▒█▒.█
; ...▒█▒▒░
; ...▒█▒▒░
; ...▒█░▒░
;
SPRITE_TILES_PORTRAIT_NURSE_05:             ; [$955b]
    .byte $0d,$1d,$1d,$0a,$09,$09,$09,$0d   ; [$955b] byte
    .byte $0a,$0a,$0a,$1d,$1d,$1e,$1e,$1a   ; [$9563] byte


;
; █░░▒...░
; █░░.██.█
; █░▒▒█░░█
; █░▒▒███▒
; ░░▒▒▒▒▒▒
; ░▒▒██▒▒▒
; ▒░▒█▒▒▒▒
; ░░▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_06:             ; [$956b]
    .byte $e1,$ed,$cf,$ce,$c0,$98,$50,$c0   ; [$956b] byte
    .byte $90,$8d,$b9,$bf,$3f,$7f,$bf,$3f   ; [$9573] byte


;
; ▒▒▒▒░▒▒▒
; ░▒▒░..░░
; ░▒▒░.█.▒
; ▒▒▒░█.█▒
; ▒▒▒▒▒██▒
; ▒▒▒▒▒▒▒▒
; ▒█▒░▒▒▒▒
; ▒▒.▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_07:             ; [$957b]
    .byte $08,$93,$94,$1a,$06,$00,$50,$00   ; [$957b] byte
    .byte $f7,$60,$65,$eb,$ff,$ff,$ef,$df   ; [$9583] byte


;
; ░░░.....
; ░▒░.....
; ░▒░.....
; ░▒░.....
; ░░......
; ░░......
; ░.......
; ░.......
;
SPRITE_TILES_PORTRAIT_NURSE_08:             ; [$958b]
    .byte $e0,$a0,$a0,$a0,$c0,$c0,$80,$80   ; [$958b] byte
    .byte $00,$40,$40,$40,$00,$00,$00,$00   ; [$9593] byte


;
; ...▒█░█▒
; ...░█░██
; ...░█░░█
; ...░▒█▒█
; ....▒█▒░
; .....█▒░
; ......█▒
; .......▒
;
SPRITE_TILES_PORTRAIT_NURSE_09:             ; [$959b]
    .byte $0e,$1f,$1f,$15,$05,$05,$02,$00   ; [$959b] byte
    .byte $1b,$0b,$09,$0f,$0e,$06,$03,$01   ; [$95a3] byte


;
; ░.▒▒▒▒▒▒
; ░.░▒▒▒▒▒
; ░░.▒▒▒▒▒
; ░▒░.▒▒▒▒
; █░░░░▒▒▒
; ▒█░░░░▒▒
; .▒█░▒░░▒
; ░.░░▒▒░░
;
SPRITE_TILES_PORTRAIT_NURSE_10:             ; [$95ab]
    .byte $80,$a0,$c0,$a0,$f8,$7c,$36,$b3   ; [$95ab] byte
    .byte $3f,$1f,$1f,$4f,$87,$c3,$69,$0c   ; [$95b3] byte


;
; ▒▒▒▒▒▒▒░
; .░░░▒▒▒░
; ▒█▒▒▒▒░░
; ▒░░▒▒▒░.
; ▒▒▒▒▒░░.
; ▒█▒▒░.▒.
; ▒▒▒░░..▒
; ░░░.▒▒..
;
SPRITE_TILES_PORTRAIT_NURSE_11:             ; [$95bb]
    .byte $01,$71,$43,$62,$06,$48,$18,$e0   ; [$95bb] byte
    .byte $fe,$0e,$fc,$9c,$f8,$f2,$e1,$0c   ; [$95c3] byte


;
; ▒▒▒▒▒▒▒░
; ░..░▒▒▒░
; ▒..▒▒▒░░
; ▒█▒▒▒▒░.
; ▒▒▒▒▒░░.
; ▒█▒▒░.▒.
; ▒▒▒░░..▒
; ░░░.▒▒..
;
SPRITE_TILES_PORTRAIT_NURSE_26:             ; [$95cb]
    .byte $01,$91,$03,$42,$06,$48,$18,$e0   ; [$95cb] byte
    .byte $fe,$0e,$9c,$fc,$f8,$f2,$e1,$0c   ; [$95d3] byte


;
; ░░░░▒▒▒▒
; ░░░▒▒█▒▒
; █░░▒▒█▒▒
; █▒░░▒▒▒▒
; ███▒░░░▒
; ████████
; ▒▒██████
; ██▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_13:             ; [$95db]
    .byte $f0,$e4,$e4,$b0,$ee,$ff,$3f,$c0   ; [$95db] byte
    .byte $0f,$1f,$9f,$cf,$f1,$ff,$ff,$ff   ; [$95e3] byte


;
; ░░░.....
; ▒░▒.....
; ▒░▒▒....
; ░▒▒▒░...
; ██▒▒░░▒░
; ██▒░███▒
; █▒▒████▒
; ▒██████▒
;
SPRITE_TILES_PORTRAIT_NURSE_14:             ; [$95eb]
    .byte $e0,$40,$40,$88,$cd,$de,$9e,$7e   ; [$95eb] byte
    .byte $00,$a0,$b0,$70,$f2,$ef,$ff,$ff   ; [$95f3] byte


;
; ........
; ........
; ........
; ........
; ........
; .....███
; ..██████
; ████████
;
SPRITE_TILES_PORTRAIT_GURU_08__NURSE_12:    ; [$95fb]
    .byte $00,$00,$00,$00,$00,$07,$3f,$ff   ; [$95fb] byte
    .byte $00,$00,$00,$00,$00,$07,$3f,$ff   ; [$9603] byte


;
; ████████
; ████████
; ████████
; ▒███████
; ░▒██████
; ▒░▒█████
; ▒░░▒████
; ▒▒░▒████
;
SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22: ; [$960b]
    .byte $ff,$ff,$ff,$7f,$bf,$5f,$6f,$2f   ; [$960b] byte
    .byte $ff,$ff,$ff,$ff,$7f,$bf,$9f,$df   ; [$9613] byte


;
; █▒█████▒
; █░██████
; ██▒█████
; ██░█████
; ███▒████
; ███▒████
; ████▒███
; ████░███
;
SPRITE_TILES_PORTRAIT_NURSE_17:             ; [$961b]
    .byte $be,$ff,$df,$ff,$ef,$ef,$f7,$ff   ; [$961b] byte
    .byte $ff,$bf,$ff,$df,$ff,$ff,$ff,$f7   ; [$9623] byte


;
; .......█
; ......██
; .....▒██
; .....▒░░
; .....░░░
; .....░▒▒
; .....▒▒▒
; .....▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_15:             ; [$962b]
    .byte $01,$03,$03,$03,$07,$04,$00,$00   ; [$962b] byte
    .byte $01,$03,$07,$04,$00,$03,$07,$07   ; [$9633] byte


;
; ▒▒░░▒███
; ▒▒▒░▒███
; ▒▒▒░▒▒██
; ▒▒▒░▒▒██
; ▒▒▒░▒▒██
; ▒▒▒░▒███
; ▒▒▒░▒███
; ▒▒▒░▒███
;
SPRITE_TILES_PORTRAIT_NURSE_19:             ; [$963b]
    .byte $37,$17,$13,$13,$13,$17,$17,$17   ; [$963b] byte
    .byte $cf,$ef,$ef,$ef,$ef,$ef,$ef,$ef   ; [$9643] byte


;
; █████▒██
; ██████▒█
; ███████░
; ████████
; ███████░
; ███████░
; █████▒▒░
; █████░░░
;
SPRITE_TILES_PORTRAIT_NURSE_20:             ; [$964b]
    .byte $fb,$fd,$ff,$ff,$ff,$ff,$f9,$ff   ; [$964b] byte
    .byte $ff,$ff,$fe,$ff,$fe,$fe,$fe,$f8   ; [$9653] byte


;
; .....▒▒▒
; .....▒▒▒
; ....░▒▒▒
; ....░▒▒▒
; ....░▒▒▒
; ....░▒▒▒
; ....▒▒▒▒
; ....░▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_18:             ; [$965b]
    .byte $00,$00,$08,$08,$08,$08,$00,$08   ; [$965b] byte
    .byte $07,$07,$07,$07,$07,$07,$0f,$07   ; [$9663] byte


;
; ....▒▒▒▒
; ....▒▒▒▒
; ....▒▒▒▒
; ....▒▒▒▒
; ....▒▒▒▒
; ....▒▒▒▒
; ....▒▒▒▒
; ....░▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_21:             ; [$966b]
    .byte $00,$00,$00,$00,$00,$00,$00,$08   ; [$966b] byte
    .byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$07   ; [$9673] byte


;
; ▒▒▒░▒███
; ▒▒▒░▒███
; ▒▒▒░▒███
; ▒▒▒.▒▒██
; ▒▒▒.▒▒██
; ▒▒▒.░▒▒▒
; ▒▒▒..▒▒▒
; ▒▒▒..▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_22:             ; [$967b]
    .byte $17,$17,$17,$03,$03,$08,$00,$00   ; [$967b] byte
    .byte $ef,$ef,$ef,$ef,$ef,$e7,$e7,$e7   ; [$9683] byte


;
; █░░▒▒▒▒▒
; █░░░▒█▒▒
; █░▒▒.░░░
; █░▒▒▒..░
; ░░▒▒▒▒▒▒
; ░▒▒██▒▒▒
; ▒░▒█▒▒▒▒
; ░░▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_24:             ; [$968b]
    .byte $e0,$f4,$c7,$c1,$c0,$98,$50,$c0   ; [$968b] byte
    .byte $9f,$8f,$b0,$b8,$3f,$7f,$bf,$3f   ; [$9693] byte


;
; ▒▒▒▒░▒▒▒
; ▒▒▒░░▒▒▒
; .▒▒░░█▒▒
; ▒▒▒░░░▒▒
; ▒▒▒▒▒..▒
; ▒▒▒▒▒▒▒▒
; ▒█▒░▒▒▒▒
; ▒▒.▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_NURSE_25:             ; [$969b]
    .byte $08,$18,$1c,$1c,$00,$00,$50,$00   ; [$969b] byte
    .byte $f7,$e7,$67,$e3,$f9,$ff,$ef,$df   ; [$96a3] byte


;
; ███████░
; ███████░
; ███████░
; ███████░
; ████████
; ███▒▒███
; ▒▒▒█████
; ████████
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_31:      ; [$96ab]
    .byte $ff,$ff,$ff,$ff,$ff,$e7,$1f,$ff   ; [$96ab] byte
    .byte $fe,$fe,$fe,$fe,$ff,$ff,$ff,$ff   ; [$96b3] byte


;
; ...▒▒▒▒▒
; ...▒▒▒▒▒
; ...▒▒▒▒▒
; ...▒▒▒▒▒
; ..▒▒▒▒▒▒
; ..▒▒▒▒▒▒
; ..▒▒▒▒▒▒
; ..▒▒▒▒▒▒
;
TILES_PORTRAITS_53:                         ; [$96bb]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$96bb] byte
    .byte $1f,$1f,$1f,$1f,$3f,$3f,$3f,$3f   ; [$96c3] byte


;
; ........
; ........
; .......▒
; ......▒▒
; .....▒▒▒
; .....▒░.
; ....▒░░░
; ....░░▒▒
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_MEAT_SALESMAN
;     [$PRG8::9307]
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_00:     ; [$96cb]
    .byte $00,$00,$00,$00,$00,$02,$07,$0c   ; [$96cb] byte
    .byte $00,$00,$01,$03,$07,$04,$08,$03   ; [$96d3] byte


;
; ..▒▒▒▒▒▒
; ▒▒█░▒▒▒▒
; ██▒▒▒▒▒▒
; ▒▒▒▒▒░▒▒
; ▒░▒▒▒.░░
; ░▒▒▒▒▒░.
; ▒▒▒▒▒▒▒▒
; ▒█▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_01:     ; [$96db]
    .byte $00,$30,$c0,$04,$43,$82,$00,$40   ; [$96db] byte
    .byte $3f,$ef,$ff,$fb,$b8,$7c,$ff,$ff   ; [$96e3] byte


;
; ▒▒░░░░..
; ▒▒▒▒▒▒░░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; .░▒▒▒▒▒▒
; ▒░.▒▒▒▒▒
; ▒▒▒.▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_02:     ; [$96eb]
    .byte $3c,$03,$00,$00,$80,$40,$40,$00   ; [$96eb] byte
    .byte $c0,$fc,$ff,$ff,$7f,$3f,$9f,$ef   ; [$96f3] byte


;
; ........
; ........
; ░.......
; ▒░......
; ▒▒░.....
; ▒▒░.....
; ▒▒▒░....
; ▒▒▒░....
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_03:     ; [$96fb]
    .byte $00,$00,$80,$40,$20,$20,$10,$10   ; [$96fb] byte
    .byte $00,$00,$00,$80,$c0,$c0,$e0,$e0   ; [$9703] byte


;
; ....░...
; .....██.
; ....▒█..
; ....░▒▒.
; ...░▒▒.█
; ..░▒█.█▒
; ..░██.▒░
; .░▒█▒.░░
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_04:     ; [$970b]
    .byte $08,$06,$04,$08,$11,$2a,$39,$53   ; [$970b] byte
    .byte $00,$06,$0c,$06,$0d,$1b,$1a,$38   ; [$9713] byte


;
; ▒░█▒▒▒..
; ▒░█▒▒.██
; ░█▒▒▒▒█▒
; ██▒▒▒░█▒
; █▒▒▒▒▒▒▒
; ▒▒█░▒▒▒█
; ░▒▒█░▒██
; ░░▒▒.▒█▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_05:     ; [$971b]
    .byte $60,$63,$c2,$c6,$80,$31,$9b,$c2   ; [$971b] byte
    .byte $bc,$bb,$7f,$fb,$ff,$ef,$77,$37   ; [$9723] byte


;
; ..▒▒▒▒▒▒
; ██░▒▒▒▒▒
; █.█░░▒▒▒
; ..█░░▒▒▒
; ▒▒▒▒▒▒▒▒
; █▒▒▒▒▒▒▒
; █▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_06:     ; [$972b]
    .byte $00,$e0,$b8,$38,$00,$80,$80,$00   ; [$972b] byte
    .byte $3f,$df,$a7,$27,$ff,$ff,$ff,$ff   ; [$9733] byte


;
; ▒▒▒░....
; ▒▒▒▒░...
; ▒▒▒▒░...
; ▒▒▒▒░...
; ▒▒▒..░..
; ▒▒.▒▒▒░.
; ▒.▒▒░░░.
; ▒▒▒░.░░.
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_07:     ; [$973b]
    .byte $10,$08,$08,$08,$04,$02,$0e,$16   ; [$973b] byte
    .byte $e0,$f0,$f0,$f0,$e0,$dc,$b0,$e0   ; [$9743] byte


;
; .░▒▒▒▒░.
; .░▒▒▒▒░░
; .░▒▒▒░.▒
; .░░▒░░.▒
; .░░░░▒.▒
; .░▒▒█▒░.
; .░▒█▒░▒█
; .░▒█▒░▒█
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_08:     ; [$974b]
    .byte $42,$43,$44,$6c,$78,$4a,$55,$55   ; [$974b] byte
    .byte $3c,$3c,$39,$11,$05,$3c,$3b,$3b   ; [$9753] byte


;
; ░.░░.▒▒▒
; ░░░░░▒▒▒
; █▒▒▒░▒▒▒
; █▒▒▒░▒▒▒
; ▒▒▒▒░░▒▒
; .....░░▒
; ███▒▒▒░░
; █▒▒▒▒▒░▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_09:     ; [$975b]
    .byte $b0,$f8,$88,$88,$0c,$06,$e3,$82   ; [$975b] byte
    .byte $07,$07,$f7,$f7,$f3,$01,$fc,$fd   ; [$9763] byte


;
; ▒▒░.░░░.
; ▒░.░░░..
; ▒░░░▒░..
; ▒░░▒▒...
; ░░▒▒░...
; ░░▒░░...
; ░░░.....
; ░.......
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_11:     ; [$976b]
    .byte $2e,$5c,$74,$60,$c8,$d8,$e0,$80   ; [$976b] byte
    .byte $c0,$80,$88,$98,$30,$20,$00,$00   ; [$9773] byte


;
; .░▒█▒░▒▒
; .░▒▒▒▒░░
; .░▒▒▒░▒░
; .░▒▒░▒██
; ..░▒░▒█▒
; ..░▒░▒▒▒
; ...░░░▒▒
; .....░░░
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_12:     ; [$977b]
    .byte $54,$43,$45,$4b,$2a,$28,$1c,$07   ; [$977b] byte
    .byte $3b,$3c,$3a,$37,$17,$17,$03,$00   ; [$9783] byte


;
; ▒▒▒▒▒▒░▒
; ▒▒▒▒▒▒▒▒
; ░░░▒▒▒▒▒
; ▒▒▒░▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒░░░
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_13:     ; [$978b]
    .byte $02,$00,$e0,$10,$00,$00,$00,$87   ; [$978b] byte
    .byte $fd,$ff,$1f,$ef,$ff,$ff,$ff,$78   ; [$9793] byte


;
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒░░
; ▒▒▒▒▒░░░
; ▒▒▒▒░░░.
; ▒▒▒░░░.░
; ▒░░░..░░
; ░░░.░░░░
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_14:     ; [$979b]
    .byte $01,$01,$03,$07,$0e,$1d,$73,$ef   ; [$979b] byte
    .byte $fe,$fe,$fc,$f8,$f0,$e0,$80,$00   ; [$97a3] byte


;
; ░▒▒▒░░░░
; ░▒▒▒▒▒░░
; ░▒▒▒▒▒▒▒
; ░▒▒▒█▒▒▒
; ░▒▒▒█▒▒▒
; ░▒▒▒▒█▒▒
; ░▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_16__KEY_SALESMAN_18: ; [$97ab]
    .byte $8f,$83,$80,$88,$88,$84,$80,$80   ; [$97ab] byte
    .byte $70,$7c,$7f,$7f,$7f,$7f,$7f,$7f   ; [$97b3] byte


;
; ░░░░░░..
; ░░░░░░..
; ▒▒░░░░..
; ▒▒▒░░░..
; ▒▒▒▒░░..
; ▒▒▒▒░░..
; ▒▒░░░░░.
; ▒▒▒▒░░░.
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_17:       ; [$97bb]
    .byte $fc,$fc,$3c,$1c,$0c,$0c,$3e,$0e   ; [$97bb] byte
    .byte $00,$00,$c0,$e0,$f0,$f0,$c0,$f0   ; [$97c3] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; █..▒▒▒▒▒
; ███..▒▒▒
; █████...
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_20__KEY_SALESMAN_24: ; [$97cb]
    .byte $00,$00,$00,$00,$00,$80,$e0,$f8   ; [$97cb] byte
    .byte $ff,$ff,$ff,$ff,$7f,$9f,$e7,$f8   ; [$97d3] byte


;
; ▒▒▒▒░░░.
; ▒▒▒▒▒░░.
; ▒▒▒▒▒▒░.
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒░.
; ▒▒▒▒▒..█
; ▒▒▒..███
; ░░.███▒▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_21__KEY_SALESMAN_25: ; [$97db]
    .byte $0e,$06,$02,$00,$02,$01,$07,$dc   ; [$97db] byte
    .byte $f0,$f8,$fc,$fe,$fc,$f9,$e7,$1f   ; [$97e3] byte


;
; ████.░░.
; ████.░▒▒
; ████.▒▒▒
; ████.▒▒▒
; ████.▒▒▒
; ████.░▒▒
; ████░░▒▒
; █████.▒▒
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_17:      ; [$97eb]
    .byte $f6,$f4,$f0,$f0,$f0,$f4,$fc,$f8   ; [$97eb] byte
    .byte $f0,$f3,$f7,$f7,$f7,$f3,$f3,$fb   ; [$97f3] byte


;
; ▒▒▒░.███
; ▒▒▒▒░.██
; ▒▒▒▒░.██
; ▒▒▒▒▒░.█
; ▒▒▒▒▒▒.█
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒.
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_28:      ; [$97fb]
    .byte $17,$0b,$0b,$05,$01,$00,$00,$00   ; [$97fb] byte
    .byte $e7,$f3,$f3,$f9,$fd,$fe,$fe,$fe   ; [$9803] byte


;
; █▒██████
; █.██████
; █.██████
; .███████
; .███████
; .███████
; ░███████
; ████████
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_29:      ; [$980b]
    .byte $bf,$bf,$bf,$7f,$7f,$7f,$ff,$ff   ; [$980b] byte
    .byte $ff,$bf,$bf,$7f,$7f,$7f,$7f,$ff   ; [$9813] byte


;
; ........
; ........
; ░.......
; ▒░█.....
; ▒▒.█....
; ▒▒.██...
; ▒▒▒.█...
; ▒▒▒.██..
;
TILES_PORTRAITS_75:                         ; [$981b]
    .byte $00,$00,$80,$60,$10,$18,$08,$0c   ; [$981b] byte
    .byte $00,$00,$00,$a0,$d0,$d8,$e8,$ec   ; [$9823] byte


;
; ░▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_30:     ; [$982b]
    .byte $80,$80,$00,$00,$00,$80,$80,$80   ; [$982b] byte
    .byte $7f,$7f,$ff,$ff,$ff,$7f,$7f,$7f   ; [$9833] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒░▒▒
; ▒▒▒▒▒░▒▒
; ▒▒▒▒░▒▒▒
; ▒▒░░▒▒▒▒
; ░░░▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_10:     ; [$983b]
    .byte $00,$00,$04,$04,$08,$30,$e0,$00   ; [$983b] byte
    .byte $ff,$ff,$fb,$fb,$f7,$cf,$1f,$ff   ; [$9843] byte


;
; ....░▒▒▒
; .....▒▒░
; ....░▒▒▒
; ....░...
; ...░▒▒.█
; ..░▒█.█▒
; ..░██.▒░
; .░▒█▒.░░
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_32:     ; [$984b]
    .byte $08,$01,$08,$08,$11,$2a,$39,$53   ; [$984b] byte
    .byte $07,$06,$07,$00,$0d,$1b,$1a,$38   ; [$9853] byte


;
; ▒░█▒▒▒██
; ▒░█▒▒.▒▒
; ░█▒▒▒░..
; ██▒▒▒▒▒░
; █▒▒▒▒▒▒▒
; ▒▒█░▒▒▒█
; ░▒▒█░▒██
; ░░▒▒.▒█▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_33:     ; [$985b]
    .byte $63,$60,$c4,$c1,$80,$31,$9b,$c2   ; [$985b] byte
    .byte $bf,$bb,$78,$fe,$ff,$ef,$77,$37   ; [$9863] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ..░░░▒▒▒
; ▒▒▒▒▒▒▒▒
; █▒▒▒▒▒▒▒
; █▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_34:     ; [$986b]
    .byte $00,$00,$00,$38,$00,$80,$80,$00   ; [$986b] byte
    .byte $ff,$ff,$ff,$07,$ff,$ff,$ff,$ff   ; [$9873] byte


;
; ........
; ........
; .......▒
; ......██
; .....▒██
; .....██▒
; ....▒█▒█
; ....██▒█
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_MAGICIAN [$PRG8::9285]
;
SPRITE_TILES_PORTRAIT_MAGICIAN_00:          ; [$987b]
    .byte $00,$00,$00,$03,$03,$06,$05,$0d   ; [$987b] byte
    .byte $00,$00,$01,$03,$07,$07,$0f,$0f   ; [$9883] byte


;
; ...████░
; .███▒▒██
; ███▒██▒▒
; ██▒██▒██
; ▒█▒█▒██▒
; █▒██▒██.
; ▒█████.▒
; ▒███▒.▒▒
;
SPRITE_TILES_PORTRAIT_MAGICIAN_01:          ; [$988b]
    .byte $1f,$73,$ec,$db,$56,$b6,$7c,$70   ; [$988b] byte
    .byte $1e,$7f,$ff,$ff,$ff,$fe,$fd,$fb   ; [$9893] byte


;
; ...█▒██░
; ...█▒█░█
; ...█░░██
; ..█░████
; ..█▒░███
; ..█▒▒░..
; .░▒▒█.░░
; .░███.▒▒
;
SPRITE_TILES_PORTRAIT_MAGICIAN_02:          ; [$989b]
    .byte $17,$17,$1f,$3f,$2f,$24,$4b,$78   ; [$989b] byte
    .byte $1e,$1d,$13,$2f,$37,$38,$38,$3b   ; [$98a3] byte


;
; ░███░▒▒█
; █████░▒▒
; ██████░▒
; ███████░
; ...████░
; .▒▒..█.░
; ██.▒.▒.▒
; █..▒▒..▒
;
SPRITE_TILES_PORTRAIT_MAGICIAN_03:          ; [$98ab]
    .byte $f9,$fc,$fe,$ff,$1f,$05,$c0,$80   ; [$98ab] byte
    .byte $77,$fb,$fd,$fe,$1e,$64,$d5,$99   ; [$98b3] byte


;
; .▒██▒.▒░
; .▒██▒▒.▒
; .▒▒██▒.▒
; .░▒██▒.▒
; .█▒█▒.▒▒
; .▒▒█▒.▒█
; .█▒█▒.▒█
; .▒▒▒█░██
;
SPRITE_TILES_PORTRAIT_MAGICIAN_04:          ; [$98bb]
    .byte $31,$30,$18,$58,$50,$11,$51,$0f   ; [$98bb] byte
    .byte $7a,$7d,$7d,$3d,$7b,$7b,$7b,$7b   ; [$98c3] byte


;
; ▒▒▒░░░▒█
; ░░░░▒▒▒█
; ▒▒░▒.▒██
; ░░▒▒.▒▒█
; ▒▒▒▒...▒
; █▒▒░░▒░.
; ▒▒░░████
; ▒░░█████
;
SPRITE_TILES_PORTRAIT_MAGICIAN_05:          ; [$98cb]
    .byte $1d,$f1,$23,$c1,$00,$9a,$3f,$7f   ; [$98cb] byte
    .byte $e3,$0f,$d7,$37,$f1,$e4,$cf,$9f   ; [$98d3] byte


;
; .▒▒█▒.▒▒
; .█▒▒▒.▒▒
; .▒▒░█.░░
; .█▒░█▒.░
; .▒▒▒░▒░.
; .░▒█▒▒░█
; .▒▒█▒▒░█
; .█▒█▒▒░█
;
SPRITE_TILES_PORTRAIT_MAGICIAN_06:          ; [$98db]
    .byte $10,$40,$1b,$59,$0a,$53,$13,$53   ; [$98db] byte
    .byte $7b,$7b,$68,$6c,$74,$3d,$7d,$7d   ; [$98e3] byte


;
; ▒░██████
; ░███████
; ░███████
; ██████▒▒
; █████▒..
; ████▒.▒█
; ██▒▒░█▒▒
; ▒▒░░░▒░░
;
SPRITE_TILES_PORTRAIT_MAGICIAN_07:          ; [$98eb]
    .byte $7f,$ff,$ff,$fc,$f8,$f1,$cc,$3b   ; [$98eb] byte
    .byte $bf,$7f,$7f,$ff,$fc,$fb,$f7,$c4   ; [$98f3] byte


;
; .░▒▒▒▒░.
; .░▒▒▒▒░░
; .░▒▒▒░.▒
; .░░▒░░.░
; .░░░░▒..
; .░▒▒█▒░.
; .░▒█▒░█░
; .░▒█▒░▒█
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_35:     ; [$98fb]
    .byte $42,$43,$44,$6d,$78,$4a,$57,$55   ; [$98fb] byte
    .byte $3c,$3c,$39,$10,$04,$3c,$3a,$3b   ; [$9903] byte


;
; ░.░░.▒▒▒
; ░░░░░▒▒▒
; █▒▒▒░▒▒▒
; ▒▒▒▒░▒▒▒
; ....░░▒▒
; .....░░▒
; ...░▒▒░░
; ██▒▒▒▒░▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_36:     ; [$990b]
    .byte $b0,$f8,$88,$08,$0c,$06,$13,$c2   ; [$990b] byte
    .byte $07,$07,$f7,$f7,$03,$01,$0c,$fd   ; [$9913] byte


;
; ░░▒▒░..░
; ▒▒▒▒.███
; ▒▒▒.███▒
; ▒▒.███▒.
; ▒▒.██▒.▒
; ▒.███▒.▒
; .███▒.▒▒
; .██▒..▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_16:     ; [$991b]
    .byte $c9,$07,$0e,$1c,$18,$38,$70,$60   ; [$991b] byte
    .byte $30,$f7,$ef,$de,$dd,$bd,$7b,$73   ; [$9923] byte


;
; ░░░░░░░░
; ░█▒▒░░░░
; ░▒█▒▒░░░
; ▒░▒▒▒▒▒▒
; ░▒░░░▒░░
; ░▒▒▒▒▒▒▒
; ▒░█▒▒▒▒▒
; ▒▒░░▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_17:     ; [$992b]
    .byte $ff,$cf,$a7,$40,$bb,$80,$60,$30   ; [$992b] byte
    .byte $00,$70,$78,$bf,$44,$7f,$bf,$cf   ; [$9933] byte


;
; ░..░░░░░
; ░░░░░░░░
; ░░░░░░░░
; ░▒░░░░░░
; ▒▒▒░░░░░
; ▒▒▒▒▒░░.
; ▒▒▒▒▒▒.█
; ▒▒▒▒▒░██
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_18:     ; [$993b]
    .byte $9f,$ff,$ff,$bf,$1f,$06,$01,$07   ; [$993b] byte
    .byte $00,$00,$00,$40,$e0,$f8,$fd,$fb   ; [$9943] byte


;
; ░.......
; ░░░░....
; ░░░.....
; ░..█████
; .███████
; ████████
; ███▒....
; ██▒.░▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_19:     ; [$994b]
    .byte $80,$f0,$e0,$9f,$7f,$ff,$e0,$c8   ; [$994b] byte
    .byte $00,$00,$00,$1f,$7f,$ff,$f0,$e7   ; [$9953] byte


;
; ███▒.▒▒▒
; ███▒.▒▒▒
; ██▒.▒▒▒▒
; ██▒.▒▒▒▒
; ██▒.▒▒▒▒
; █▒.▒▒▒▒▒
; █▒.▒▒▒▒▒
; █▒.▒▒▒▒▒
;
    .byte $e0,$e0,$c0,$c0,$c0,$80,$80,$80   ; [$995b] byte
    .byte $f7,$f7,$ef,$ef,$ef,$df,$df,$df   ; [$9963] byte


;
; ░▒█▒█▒██
; ░▒█▒█▒█▒
; ░░▒▒███▒
; ░░▒▒█▒██
; ░░░▒▒▒█▒
; █░░░▒▒█▒
; █░░░░▒▒█
; ░█░░░░░▒
;
SPRITE_TILES_PORTRAIT_KING_15__MAGICIAN_10: ; [$996b]
    .byte $ab,$aa,$ce,$cb,$e2,$f2,$f9,$fe   ; [$996b] byte
    .byte $7f,$7f,$3f,$3f,$1f,$8f,$87,$41   ; [$9973] byte


;
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒.███
; ▒▒▒▒.███
; ▒▒▒▒.██▒
; ▒▒▒▒.██▒
; ▒▒▒▒.██▒
; ▒▒▒▒.██▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_24:     ; [$997b]
    .byte $03,$03,$07,$07,$06,$06,$06,$06   ; [$997b] byte
    .byte $fb,$fb,$f7,$f7,$f7,$f7,$f7,$f7   ; [$9983] byte


;
; █▒.▒▒▒▒▒
; ▒.▒▒▒▒▒▒
; ▒.▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_25:     ; [$998b]
    .byte $80,$00,$00,$00,$00,$00,$00,$00   ; [$998b] byte
    .byte $df,$bf,$bf,$7f,$7f,$7f,$7f,$7f   ; [$9993] byte


;
; ▒░░░..░░
; █░░█░░..
; ▒█░██░░▒
; █▒░░██░░
; ▒▒█░███▒
; █▒▒█░███
; ▒█▒█░░██
; ░▒█▒░░▒░
;
SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13: ; [$999b]
    .byte $73,$fc,$7e,$bf,$3e,$9f,$5f,$ad   ; [$999b] byte
    .byte $80,$90,$d9,$cc,$ef,$f7,$f3,$72   ; [$99a3] byte


;
; ▒▒▒▒░...
; ▒▒▒▒▒...
; ▒▒▒▒▒░..
; ▒▒▒▒▒▒..
; ▒▒▒▒▒▒..
; ▒▒▒▒▒▒░.
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒.
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_26:     ; [$99ab]
    .byte $08,$00,$04,$00,$00,$02,$00,$00   ; [$99ab] byte
    .byte $f0,$f8,$f8,$fc,$fc,$fc,$fe,$fe   ; [$99b3] byte


;
; ▒█▒▒░█░▒
; ▒█▒█░██░
; ▒█▒▒░▒█░
; ▒▒█▒░▒▒░
; █▒█▒░█░▒
; █▒█▒░██░
; ▒█▒█░▒█░
; ▒█▒█░▒▒▒
;
SPRITE_TILES_PORTRAIT_KING_19:              ; [$99bb]
    .byte $4e,$5f,$4b,$29,$ae,$af,$5b,$58   ; [$99bb] byte
    .byte $f5,$f6,$f6,$f6,$f5,$f6,$f6,$f7   ; [$99c3] byte


;
; ........
; ........
; ........
; ░.......
; ▒░......
; ▒▒░.....
; ░░░░....
; ▒▒▒░....
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_20:     ; [$99cb]
    .byte $00,$00,$00,$80,$40,$20,$f0,$10   ; [$99cb] byte
    .byte $00,$00,$00,$00,$80,$c0,$00,$e0   ; [$99d3] byte


;
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_31:     ; [$99db]
    .byte $01,$01,$01,$00,$00,$00,$00,$00   ; [$99db] byte
    .byte $fe,$fe,$fe,$ff,$ff,$ff,$ff,$ff   ; [$99e3] byte


;
; .......░
; ......░█
; ......▒█
; .....░██
; .....░█░
; .....░█░
; ....░██░
; ....░██░
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_MARTIAL_ARTIST
;     [$PRG8::9265]
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_00:    ; [$99eb]
    .byte $01,$03,$01,$07,$07,$07,$0f,$0f   ; [$99eb] byte
    .byte $00,$01,$03,$03,$02,$02,$06,$06   ; [$99f3] byte


;
; █▒██▒█▒█
; ██▒█▒█▒█
; █░░░░█▒█
; ░▒██▒░.▒
; ░▒█▒▒▒.▒
; ▒▒██▒▒▒.
; ░███▒▒▒▒
; █▒███▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_01:    ; [$99fb]
    .byte $b5,$d5,$fd,$b4,$a0,$30,$f0,$b8   ; [$99fb] byte
    .byte $ff,$ff,$87,$79,$7d,$fe,$7f,$ff   ; [$9a03] byte


;
; ▒██▒▒▒░░
; ▒█▒▒▒░░░
; █....░▒▒
; ▒.▒▒▒░░.
; .▒▒▒▒▒░.
; ▒▒▒▒▒▒░░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_02:    ; [$9a0b]
    .byte $63,$47,$84,$06,$02,$03,$01,$01   ; [$9a0b] byte
    .byte $fc,$f8,$83,$b8,$7c,$fc,$fe,$fe   ; [$9a13] byte


;
; ░.......
; ░░......
; ░░......
; ░░░.....
; ▒░░.....
; .▒░░....
; .▒░░....
; .░░░....
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_03:    ; [$9a1b]
    .byte $80,$c0,$c0,$e0,$60,$30,$30,$70   ; [$9a1b] byte
    .byte $00,$00,$00,$00,$80,$40,$40,$00   ; [$9a23] byte


;
; ....░██░
; ....░██░
; ....░▒█▒
; ....░▒░█
; ...░░▒░█
; ..░▒░░░█
; ..░█▒▒▒.
; ...▒▒▒▒█
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_04:    ; [$9a2b]
    .byte $0f,$0f,$0a,$0b,$1b,$2f,$30,$01   ; [$9a2b] byte
    .byte $06,$06,$07,$05,$05,$11,$1e,$1f   ; [$9a33] byte


;
; █▒▒██▒▒▒
; ░░░▒▒▒▒▒
; ░...▒▒▒░
; █▒░░..░░
; ▒...░░.▒
; .███.░░▒
; ███░█.░█
; ▒█..█░░█
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_05:    ; [$9a3b]
    .byte $98,$e0,$81,$b3,$0c,$76,$fb,$4f   ; [$9a3b] byte
    .byte $ff,$1f,$0e,$c0,$81,$71,$e9,$c9   ; [$9a43] byte


;
; ▒▒▒▒▒▒▒░
; ▒▒▒▒░░░░
; ▒░░░....
; ▒....░░░
; ▒..░...░
; ▒░░..██.
; ▒░.▒█.██
; ▒░░█.░█▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_06:    ; [$9a4b]
    .byte $01,$0f,$70,$07,$11,$66,$4b,$76   ; [$9a4b] byte
    .byte $fe,$f0,$80,$80,$80,$86,$9b,$93   ; [$9a53] byte


;
; ░░▒░....
; ░.▒░....
; ░.▒░....
; ..▒░....
; ░.▒░.░..
; ▒░░░░▒..
; ░▒░.▒░..
; .▒░▒░░..
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_07:    ; [$9a5b]
    .byte $d0,$90,$90,$10,$94,$78,$a4,$2c   ; [$9a5b] byte
    .byte $20,$20,$20,$20,$20,$84,$48,$50   ; [$9a63] byte


;
; ...░░▒██
; ...░▒▒██
; ...░░▒██
; ....░▒▒█
; ....░▒▒█
; ....░░▒▒
; ....░░▒▒
; .....░▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_08:    ; [$9a6b]
    .byte $1b,$13,$1b,$09,$09,$0c,$0c,$04   ; [$9a6b] byte
    .byte $07,$0f,$07,$07,$07,$03,$03,$03   ; [$9a73] byte


;
; ▒▒▒▒▒░▒█
; ▒▒▒▒░░██
; █▒░░░▒██
; ▒▒▒▒░.▒█
; ▒▒▒▒░░.▒
; ▒▒▒▒░▒░.
; ▒▒▒░▒▒▒░
; ▒▒░▒▒░░▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_09:    ; [$9a7b]
    .byte $05,$0f,$bb,$09,$0c,$0a,$11,$26   ; [$9a7b] byte
    .byte $fb,$f3,$c7,$f3,$f1,$f4,$ee,$d9   ; [$9a83] byte


;
; ▒░░▒▒▒▒▒
; ▒▒░░▒▒▒▒
; ▒▒.░░▒▒░
; ▒▒.░▒░░▒
; ▒.▒░▒▒▒▒
; .░░░░▒▒▒
; ▒░░░░▒▒▒
; ▒░░░░▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_10:    ; [$9a8b]
    .byte $60,$30,$19,$16,$10,$78,$78,$78   ; [$9a8b] byte
    .byte $9f,$cf,$c6,$c9,$af,$07,$87,$87   ; [$9a93] byte


;
; ▒░░░░░..
; ▒░░.░░..
; ▒░░.░░..
; ▒░░.░░..
; ▒░░░░...
; ▒▒░░░...
; ▒▒░.....
; ▒░░.....
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_11:    ; [$9a9b]
    .byte $7c,$6c,$6c,$6c,$78,$38,$20,$60   ; [$9a9b] byte
    .byte $80,$80,$80,$80,$80,$c0,$c0,$80   ; [$9aa3] byte


;
; .....░▒▒
; .....░▒▒
; .....░▒▒
; .....░▒▒
; .....░░▒
; ......░▒
; ......░░
; .......░
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_12:    ; [$9aab]
    .byte $04,$04,$04,$04,$06,$02,$03,$01   ; [$9aab] byte
    .byte $03,$03,$03,$03,$01,$01,$00,$00   ; [$9ab3] byte


;
; ▒▒▒....░
; ▒▒.░▒███
; ▒▒░▒███▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒░░
; ▒▒▒▒▒░░.
; ▒▒▒▒▒▒██
; ▒▒▒▒▒█▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_13:    ; [$9abb]
    .byte $01,$17,$2e,$00,$03,$06,$03,$04   ; [$9abb] byte
    .byte $e0,$cf,$df,$ff,$fc,$f8,$ff,$ff   ; [$9ac3] byte


;
; ░░..░▒▒▒
; █▒▒▒..▒▒
; ▒▒▒▒▒.▒▒
; ▒▒▒▒▒▒▒▒
; ░░▒▒▒▒▒░
; .░░▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_14:    ; [$9acb]
    .byte $c8,$80,$00,$00,$c1,$60,$00,$00   ; [$9acb] byte
    .byte $07,$f3,$fb,$ff,$3e,$1f,$ff,$ff   ; [$9ad3] byte


;
; ▒░░.....
; ▒░░.....
; ░░░.....
; ░░░.....
; ▒░░.....
; ▒░░.....
; ▒░......
; ░░......
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_15:    ; [$9adb]
    .byte $60,$60,$e0,$e0,$60,$60,$40,$c0   ; [$9adb] byte
    .byte $80,$80,$00,$00,$80,$80,$80,$00   ; [$9ae3] byte


;
; █▒▒██▒▒▒
; ░░░▒▒▒▒▒
; ░...▒▒▒░
; █▒░░..░░
; ▒▒▒▒░░.▒
; ▒██▒▒░░▒
; ░▒▒▒░.░█
; ▒....░░█
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_27:    ; [$9aeb]
    .byte $98,$e0,$81,$b3,$0c,$66,$8b,$07   ; [$9aeb] byte
    .byte $ff,$1f,$0e,$c0,$f1,$f9,$71,$81   ; [$9af3] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░░▒▒▒▒▒▒
; .░░▒▒▒▒▒
; ░.░░░░▒▒
; ▒░.░░░░░
; ██░..░░░
; ░██░░...
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_18:    ; [$9afb]
    .byte $00,$00,$c0,$60,$bc,$5f,$e7,$f8   ; [$9afb] byte
    .byte $ff,$ff,$3f,$1f,$03,$80,$c0,$60   ; [$9b03] byte


;
; ░.....░▒
; ▒░░░..█░
; ███▒░██░
; ▒█▒▒░██░
; ▒▒▒░░▒█▒
; ▒▒░░░░██
; ▒░░░░░░█
; ░▒░░░░░░
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_17:    ; [$9b0b]
    .byte $82,$73,$ef,$4f,$1a,$3f,$7f,$bf   ; [$9b0b] byte
    .byte $01,$82,$f6,$f6,$e7,$c3,$81,$40   ; [$9b13] byte


;
; ░░░░░░░░
; ▒▒▒▒████
; ▒▒██████
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_16:    ; [$9b1b]
    .byte $ff,$0f,$3f,$00,$00,$00,$00,$00   ; [$9b1b] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b23] byte


;
; ░▒░░▒▒▒░
; ░▒▒▒░░▒▒
; ░▒▒▒▒░░░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒██▒▒▒▒▒
; ██▒▒▒▒▒▒
; ██▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_20:    ; [$9b2b]
    .byte $b1,$8c,$87,$00,$00,$60,$c0,$c0   ; [$9b2b] byte
    .byte $4e,$73,$78,$ff,$ff,$ff,$ff,$ff   ; [$9b33] byte


;
; ░░██▒░░░
; ▒░░░██░░
; ▒▒▒░░░░░
; ▒▒▒▒▒▒░░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_21:    ; [$9b3b]
    .byte $f7,$7f,$1f,$03,$01,$01,$01,$01   ; [$9b3b] byte
    .byte $38,$8c,$e0,$fc,$fe,$fe,$fe,$fe   ; [$9b43] byte


;
; ▒▒░░░░░░
; ░░░▒█▒.░
; ░░██▒.░░
; ░██▒░.░░
; █▒░▒.░░░
; ▒░▒.░░░▒
; ░▒..░░▒▒
; ▒█.░░▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_19:    ; [$9b4b]
    .byte $3f,$e9,$f3,$eb,$a7,$4e,$8c,$58   ; [$9b4b] byte
    .byte $c0,$1c,$38,$70,$d0,$a1,$43,$c7   ; [$9b53] byte


;
; ▒▒▒▒▒░░░
; ▒▒▒▒░░░░
; ░▒░░░▒▒░
; ▒▒▒▒▒▒░▒
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒░░
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_24:    ; [$9b5b]
    .byte $07,$0f,$b9,$02,$01,$01,$01,$03   ; [$9b5b] byte
    .byte $f8,$f0,$46,$fd,$fe,$fe,$fe,$fc   ; [$9b63] byte


;
; ███▒▒░░█
; ████▒░██
; ███▒▒░██
; ████▒░██
; ███▒▒░██
; ███▒▒░██
; ████▒░██
; ███▒▒░▒█
;
SPRITE_TILES_PORTRAIT_MAGICIAN_11:          ; [$9b6b]
    .byte $e7,$f7,$e7,$f7,$e7,$e7,$f7,$e5   ; [$9b6b] byte
    .byte $f9,$fb,$fb,$fb,$fb,$fb,$fb,$fb   ; [$9b73] byte


;
; █▒.░░▒▒█
; ▒░.░░▒▒█
; ░▒.░░▒▒█
; ▒█.░░▒▒▒
; █▒.░░░▒▒
; ▒░..░░▒▒
; ░░..░░░▒
; ░█.░.░░░
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_22:    ; [$9b7b]
    .byte $99,$59,$99,$58,$9c,$4c,$ce,$d7   ; [$9b7b] byte
    .byte $c7,$87,$47,$c7,$c3,$83,$01,$40   ; [$9b83] byte


;
; ██▒▒▒▒▒▒
; ██▒▒▒▒▒▒
; ██▒▒▒▒▒▒
; ██▒▒▒▒▒▒
; ██▒▒▒▒▒▒
; ████▒▒▒▒
; ▒▒████▒█
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_23:    ; [$9b8b]
    .byte $c0,$c0,$c0,$c0,$c0,$f0,$3d,$00   ; [$9b8b] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b93] byte


;
; █▒.░░.░░
; ▒░.░░░.░
; ░░.░░░░.
; ░▒.░░░░░
; ▒░.░░░░░
; ▒░.░░░░▒
; ▒..░░░▒▒
; ▒..░░░▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_25:    ; [$9b9b]
    .byte $9b,$5d,$de,$9f,$5f,$5e,$1c,$1c   ; [$9b9b] byte
    .byte $c0,$80,$00,$40,$80,$81,$83,$83   ; [$9ba3] byte


;
; ░░░▒▒▒▒▒
; ░░░░░░▒▒
; ░░░░░░░░
; ░░░▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒█▒█▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_26:    ; [$9bab]
    .byte $e0,$fc,$ff,$e0,$00,$50,$00,$00   ; [$9bab] byte
    .byte $1f,$03,$00,$1f,$ff,$ff,$ff,$ff   ; [$9bb3] byte


;
; ▒▒▒▒▒▒▒░
; ▒▒▒▒░░░░
; ▒░░░....
; ▒....░░░
; ▒..░▒▒▒░
; ▒░░▒█▒▒▒
; ▒░.▒▒▒▒.
; ▒░░....▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_28:    ; [$9bbb]
    .byte $01,$0f,$70,$07,$11,$68,$40,$60   ; [$9bbb] byte
    .byte $fe,$f0,$80,$80,$8e,$9f,$9e,$81   ; [$9bc3] byte


;
; ▒▒▒░...░
; ▒▒░.....
; ▒▒░▒░...
; ▒▒▒▒██▒▒
; ▒▒▒▒▒███
; ▒▒▒▒▒▒▒░
; ▒▒▒▒░░▒▒
; ▒▒▒▒▒▒██
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_29:    ; [$9bcb]
    .byte $11,$20,$28,$0c,$07,$01,$0c,$03   ; [$9bcb] byte
    .byte $e0,$c0,$d0,$ff,$ff,$fe,$f3,$ff   ; [$9bd3] byte


;
; ░░..░▒▒▒
; .....░▒▒
; ...░░░▒▒
; ▒▒▒▒▒░▒▒
; █▒▒▒▒▒▒░
; ░░▒▒▒▒▒▒
; ▒▒░▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_30:    ; [$9bdb]
    .byte $c8,$04,$1c,$04,$81,$c0,$20,$00   ; [$9bdb] byte
    .byte $07,$03,$03,$fb,$fe,$3f,$df,$ff   ; [$9be3] byte


;
; ░███░▒▒█
; █████░▒▒
; ██████░▒
; ███████░
; ...████░
; ░▒▒..█.░
; ▒▒▒▒.▒.▒
; .......▒
;
SPRITE_TILES_PORTRAIT_MAGICIAN_16:          ; [$9beb]
    .byte $f9,$fc,$fe,$ff,$1f,$85,$00,$00   ; [$9beb] byte
    .byte $77,$fb,$fd,$fe,$1e,$64,$f5,$01   ; [$9bf3] byte


;
; ▒░██████
; ░███████
; ░██████▒
; █████▒░░
; █████░..
; ████▒...
; ██▒▒░▒██
; ▒▒░░░▒░░
;
SPRITE_TILES_PORTRAIT_MAGICIAN_17:          ; [$9bfb]
    .byte $7f,$ff,$fe,$fb,$fc,$f0,$cb,$3b   ; [$9bfb] byte
    .byte $bf,$7f,$7f,$fc,$f8,$f8,$f7,$c4   ; [$9c03] byte


;
; █..▒.█..
; .█.▒░.█.
; .▒█.▒.█.
; ..█░░..█
; ..█▒░░.█
; ..█▒░░░█
; ..██░░.█
; ..██▒.▒▒
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_KING [$PRG8::923a]
;
SPRITE_TILES_PORTRAIT_KING_00:              ; [$9c0b]
    .byte $84,$4a,$22,$39,$2d,$2f,$3d,$30   ; [$9c0b] byte
    .byte $94,$52,$6a,$21,$31,$31,$31,$3b   ; [$9c13] byte


;
; .▒.....█
; .▒..█.░▒
; .▒▒.█.░░
; .░░.▒█.█
; ░....▒▒█
; ▒░░▒▒░░▒
; █░░▒██░░
; █░░▒█▒░▒
;
SPRITE_TILES_PORTRAIT_KING_01:              ; [$9c1b]
    .byte $01,$0a,$0b,$65,$81,$66,$ef,$ea   ; [$9c1b] byte
    .byte $41,$49,$68,$0d,$07,$99,$9c,$9d   ; [$9c23] byte


;
; ..▒██.▒▒
; ..░▒▒█.▒
; ...░██▒.
; ....▒▒▒░
; .....░..
; ...░▒█░░
; ..░▒█░░█
; ..▒██░██
;
SPRITE_TILES_PORTRAIT_KING_02:              ; [$9c2b]
    .byte $18,$24,$1c,$01,$04,$17,$2f,$1f   ; [$9c2b] byte
    .byte $3b,$1d,$0e,$0e,$00,$0c,$19,$3b   ; [$9c33] byte


;
; ██░░▒░▒█
; ▒██░░░▒█
; ▒▒███░▒▒
; .▒▒▒▒░░░
; ░..░..░.
; ███████▒
; ██████▒▒
; ██▒█░░░▒
;
SPRITE_TILES_PORTRAIT_KING_03:              ; [$9c3b]
    .byte $f5,$7d,$3c,$07,$92,$fe,$fc,$de   ; [$9c3b] byte
    .byte $cb,$e3,$fb,$78,$00,$ff,$ff,$f1   ; [$9c43] byte


;
; ..░▒░▒██
; ..▒█░██▒
; .▒██░█░░
; .▒█▒░░░░
; .▒██░░▒▒
; .▒█▒░▒█▒
; .▒█▒░▒██
; .▒█▒░▒▒█
;
SPRITE_TILES_PORTRAIT_KING_04:              ; [$9c4b]
    .byte $2b,$1e,$3f,$2f,$3c,$2a,$2b,$29   ; [$9c4b] byte
    .byte $17,$37,$74,$70,$73,$77,$77,$77   ; [$9c53] byte


;
; ▒....░▒░
; .░█..▒░░
; ██..█▒░▒
; ████▒░▒▒
; ▒▒▒▒░░▒█
; ▒▒▒░░▒▒█
; ░░░▒.▒▒▒
; █▒▒▒░.░▒
;
SPRITE_TILES_PORTRAIT_KING_05:              ; [$9c5b]
    .byte $05,$63,$ca,$f4,$0d,$19,$e0,$8a   ; [$9c5b] byte
    .byte $82,$24,$cd,$fb,$f3,$e7,$17,$f1   ; [$9c63] byte


;
; ░░.....▒
; ░░▒.█░..
; ▒░▒█..██
; ▒▒░████▒
; █▒░░▒▒▒░
; █▒▒░▒░░▒
; ▒▒▒.▒███
; ▒░.░▒▒▒▒
;
SPRITE_TILES_PORTRAIT_KING_06:              ; [$9c6b]
    .byte $c0,$cc,$53,$3e,$b1,$96,$07,$50   ; [$9c6b] byte
    .byte $01,$28,$b3,$df,$ce,$e9,$ef,$8f   ; [$9c73] byte


;
; ██▒░█▒░.
; ▒██░▒█▒.
; ░░█░█▒█.
; ░░░░██▒.
; ▒▒░░▒██.
; █▒▒░██▒.
; ▒▒▒░█▒█.
; ▒▒▒░███.
;
SPRITE_TILES_PORTRAIT_KING_07:              ; [$9c7b]
    .byte $da,$74,$fa,$fc,$36,$9c,$1a,$1e   ; [$9c7b] byte
    .byte $ec,$ee,$2e,$0e,$ce,$ee,$ee,$ee   ; [$9c83] byte


;
; .▒█▒░▒▒▒
; .▒██░▒▒▒
; .▒██░░░░
; .█▒██░██
; .▒██████
; .███████
; .█▒██▒██
; .█▒█▒███
;
SPRITE_TILES_PORTRAIT_KING_08:              ; [$9c8b]
    .byte $28,$38,$3f,$5f,$3f,$7f,$5b,$57   ; [$9c8b] byte
    .byte $77,$77,$70,$7b,$7f,$7f,$7f,$7f   ; [$9c93] byte


;
; ▒▒▒░██..
; ░██████▒
; ████████
; ███████░
; █████░░▒
; ███▒░░░░
; █▒▒░░▒▒█
; ▒█▒░▒▒▒▒
;
SPRITE_TILES_PORTRAIT_KING_09:              ; [$9c9b]
    .byte $1c,$fe,$ff,$ff,$fe,$ef,$99,$50   ; [$9c9b] byte
    .byte $ec,$7f,$ff,$fe,$f9,$f0,$e7,$ef   ; [$9ca3] byte


;
; .▒█░▒██░
; .▒█▒▒▒▒▒
; .▒▒▒░██▒
; ░▒█▒▒█▒▒
; ▒░█░▒██▒
; ▒░█░▒█▒▒
; ░█▒█▒██▒
; ░█▒█▒▒█▒
;
SPRITE_TILES_PORTRAIT_KING_11__MAGICIAN_09: ; [$9cab]
    .byte $37,$20,$0e,$a4,$76,$74,$d6,$d2   ; [$9cab] byte
    .byte $6e,$7f,$77,$7f,$af,$af,$7f,$7f   ; [$9cb3] byte


;
; ▒█▒▒▒▒░░
; ████▒░██
; ████████
; ████████
; ██▒█████
; ▒█▒█▒███
; ▒█▒█▒███
; ▒▒█▒████
;
SPRITE_TILES_PORTRAIT_KING_12:              ; [$9cbb]
    .byte $43,$f7,$ff,$ff,$df,$57,$57,$2f   ; [$9cbb] byte
    .byte $fc,$fb,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cc3] byte


;
; ........
; ........
; ........
; .......░
; .....░░▒
; ....█░▒▒
; ..██▒░▒▒
; .█▒▒░▒█▒
;
SPRITE_TILES_PORTRAIT_KING_10:              ; [$9ccb]
    .byte $00,$00,$00,$01,$06,$0c,$34,$4a   ; [$9ccb] byte
    .byte $00,$00,$00,$00,$01,$0b,$3b,$77   ; [$9cd3] byte


;
; ▒█▒▒█░█▒
; ░▒█▒█░▒█
; ░▒█▒██░█
; ░▒█▒██░█
; ░▒█░█░██
; ▒█▒█░█░▒
; ░█░█░█░▒
; ░░░░░░█░
;
SPRITE_TILES_PORTRAIT_KING_14:              ; [$9cdb]
    .byte $4e,$ad,$af,$af,$bf,$5e,$fe,$ff   ; [$9cdb] byte
    .byte $fb,$7b,$7d,$7d,$6b,$f5,$55,$02   ; [$9ce3] byte


;
; █▒█░░██▒
; ▒█▒░▒██▒
; ██░▒███▒
; █▒░▒███░
; ▒█░▒████
; ██▒░▒██▒
; ██▒░▒██▒
; █▒░▒███▒
;
SPRITE_TILES_PORTRAIT_KING_13:              ; [$9ceb]
    .byte $be,$56,$ee,$af,$6f,$d6,$d6,$ae   ; [$9ceb] byte
    .byte $e7,$ef,$df,$de,$df,$ef,$ef,$df   ; [$9cf3] byte


;
; █▒░░▒▒▒█
; █▒▒░░▒█▒
; ██▒▒░▒▒█
; █▒▒░░▒▒▒
; █▒▒░░░▒█
; ██▒▒░░▒▒
; █▒▒░░▒▒█
; █▒▒░░▒▒▒
;
SPRITE_TILES_PORTRAIT_KING_17:              ; [$9cfb]
    .byte $b1,$9a,$c9,$98,$9d,$cc,$99,$98   ; [$9cfb] byte
    .byte $cf,$e7,$f7,$e7,$e3,$f3,$e7,$e7   ; [$9d03] byte


;
; ▒██░░█▒█
; ▒██▒░▒█▒
; ▒███▒░██
; ░███▒░▒█
; ████▒░█▒
; ▒██▒░▒██
; ▒██▒░▒██
; ▒███▒░▒█
;
SPRITE_TILES_PORTRAIT_KING_16:              ; [$9d0b]
    .byte $7d,$6a,$77,$f5,$f6,$6b,$6b,$75   ; [$9d0b] byte
    .byte $e7,$f7,$fb,$7b,$fb,$f7,$f7,$fb   ; [$9d13] byte


;
; ▒░░░░░▒░
; ▒█▒▒▒▒░░
; ▒▒▒░.▒░▒
; ....░░▒▒
; ▒▒▒▒░░▒█
; ▒▒▒░░▒▒█
; ░░░▒.▒▒▒
; █▒▒▒░.░▒
;
SPRITE_TILES_PORTRAIT_KING_20:              ; [$9d1b]
    .byte $7d,$43,$12,$0c,$0d,$19,$e0,$8a   ; [$9d1b] byte
    .byte $82,$fc,$e5,$03,$f3,$e7,$17,$f1   ; [$9d23] byte


;
; ░░.░░░░▒
; ░░▒▒█▒▒▒
; ▒░▒.▒▒▒▒
; ▒▒░▒....
; █▒░░▒▒▒░
; █▒▒░▒░░▒
; ▒▒▒.▒███
; ▒░.░▒▒▒▒
;
SPRITE_TILES_PORTRAIT_KING_21:              ; [$9d2b]
    .byte $de,$c8,$40,$20,$b1,$96,$07,$50   ; [$9d2b] byte
    .byte $01,$3f,$af,$d0,$ce,$e9,$ef,$8f   ; [$9d33] byte


;
; ▒▒▒░██..
; ░██████▒
; ████████
; ███████░
; █████░░▒
; ███▒░..░
; █▒▒░....
; ▒█▒░.▒██
;
SPRITE_TILES_PORTRAIT_KING_22:              ; [$9d3b]
    .byte $1c,$fe,$ff,$ff,$fe,$e9,$90,$53   ; [$9d3b] byte
    .byte $ec,$7f,$ff,$fe,$f9,$f0,$e0,$e7   ; [$9d43] byte


;
; ........
; ........
; ........
; .......▒
; ......▒▒
; ....▒░▒▒
; ...▒▒░▒▒
; ..▒░▒░▒▒
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_TOOLS_SALESMAN
;     [$PRG8::932d]
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_00:    ; [$9d4b]
    .byte $00,$00,$00,$00,$00,$04,$04,$14   ; [$9d4b] byte
    .byte $00,$00,$00,$01,$03,$0b,$1b,$2b   ; [$9d53] byte


;
; ...░░▒▒▒
; .░░▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ▒▒▒▒░░░░
; ▒▒▒▒▒▒▒▒
; ▒▒▒░░░░▒
; ▒░░▒▒▒▒░
; ▒▒▒▒░░▒▒
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_01:    ; [$9d5b]
    .byte $18,$60,$80,$0f,$00,$1e,$61,$0c   ; [$9d5b] byte
    .byte $07,$1f,$7f,$f0,$ff,$e1,$9e,$f3   ; [$9d63] byte


;
; ..░▒░.░▒
; .░▒░░.▒▒
; .░░▒░░.▒
; .░▒░░░.▒
; .░░░░░.▒
; ..░░░.▒▒
; .█▒░░.▒▒
; .▒█░░.▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_04__TOOLS_SALESMAN_02: ; [$9d6b]
    .byte $2a,$58,$6c,$5c,$7c,$38,$58,$38   ; [$9d6b] byte
    .byte $11,$23,$11,$21,$01,$03,$63,$63   ; [$9d73] byte


;
; ▒▒░░▒▒░░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒.▒
; ▒▒....░▒
; ▒.░░░░▒▒
; ░░▒▒▒▒▒▒
; .▒██▒▒░▒
; ▒▒▒▒▒▒░▒
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_03:    ; [$9d7b]
    .byte $33,$00,$00,$02,$3c,$c0,$32,$02   ; [$9d7b] byte
    .byte $cc,$ff,$fd,$c1,$83,$3f,$7d,$fd   ; [$9d83] byte


;
; .▒.▒░.▒▒
; .▒░.░░▒▒
; .▒▒░.░▒▒
; ..▒░.░▒▒
; ..▒░.░▒█
; ..▒▒░░▒▒
; ..▒▒░.░▒
; ...░░░░░
;
SPRITE_TILES_PORTRAIT_DOCTOR_08__TOOLS_SALESMAN_04: ; [$9d8b]
    .byte $08,$2c,$14,$14,$15,$0c,$0a,$1f   ; [$9d8b] byte
    .byte $53,$43,$63,$23,$23,$33,$31,$00   ; [$9d93] byte


;
; ▒....░░▒
; .▒█...░▒
; ▒█..█░▒▒
; ▒███▒░▒▒
; ▒▒▒▒░▒▒█
; ▒▒▒░.░▒▒
; ▒▒░.▒.░░
; ░░.▒▒░..
;
SPRITE_TILES_PORTRAIT_DOCTOR_09__TOOLS_SALESMAN_05: ; [$9d9b]
    .byte $06,$22,$4c,$74,$09,$14,$23,$c4   ; [$9d9b] byte
    .byte $81,$61,$cb,$fb,$f7,$e3,$c8,$18   ; [$9da3] byte


;
; ....░░.░
; ...░░░░.
; ...░░░░░
; ...░░░░░
; ....░░░░
; ....░░░░
; ....░░░░
; .....░░░
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_06:    ; [$9dab]
    .byte $0d,$1e,$1f,$1f,$0f,$0f,$0f,$07   ; [$9dab] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9db3] byte


;
; ..▒▒░░░░
; ░░░░░...
; ░░░░.░▒█
; ░░░.▒▒▒▒
; ░░░.▒░░░
; ░░░.▒▒..
; ░░░.▒▒▒.
; ░░░░░░.░
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_07:    ; [$9dbb]
    .byte $0f,$f8,$f5,$e0,$e7,$e0,$e0,$fd   ; [$9dbb] byte
    .byte $30,$00,$03,$0f,$08,$0c,$0e,$00   ; [$9dc3] byte


;
; ▒▒▒▒.░░▒
; ▒█▒▒▒.░▒
; .▒▒▒.░▒▒
; ▒...▒░▒█
; ▒▒▒▒░▒▒█
; ▒▒▒░.░▒▒
; ▒▒░.▒.░░
; ░░.▒▒░..
;
SPRITE_TILES_PORTRAIT_DOCTOR_22__TOOLS_SALESMAN_19: ; [$9dcb]
    .byte $06,$42,$04,$05,$09,$14,$23,$c4   ; [$9dcb] byte
    .byte $f1,$f9,$73,$8b,$f7,$e3,$c8,$18   ; [$9dd3] byte


;
; ..▒▒░░░░
; ░░░░░...
; ░░░░....
; ░░░.▒░▒█
; ░░░.▒▒▒▒
; ░░░.▒░░░
; ░░░.▒▒░.
; ░░░░░░.▒
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_20:    ; [$9ddb]
    .byte $0f,$f8,$f0,$e5,$e0,$e7,$e2,$fc   ; [$9ddb] byte
    .byte $30,$00,$00,$0b,$0f,$08,$0c,$01   ; [$9de3] byte


;
; ......░░
; ......░░
; .....░▒░
; .....░░░
; .....░▒░
; .....░░▒
; ....░░░░
; ....▒░░.
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_GURU [$PRG8::9252]
;
SPRITE_TILES_PORTRAIT_GURU_00:              ; [$9deb]
    .byte $03,$03,$05,$07,$05,$06,$0f,$06   ; [$9deb] byte
    .byte $00,$00,$02,$00,$02,$01,$00,$08   ; [$9df3] byte


;
; ░░░░▒░░▒
; ░▒▒█▒▒██
; ▒█▒█▒█▒▒
; ▒▒█▒█▒██
; ▒██▒█▒██
; ░▒█▒█▒██
; ░▒▒█░█▒▒
; ░░▒▒█▒▒█
;
SPRITE_TILES_PORTRAIT_GURU_01:              ; [$9dfb]
    .byte $f6,$93,$54,$2b,$6b,$ab,$9c,$c9   ; [$9dfb] byte
    .byte $09,$7f,$ff,$ff,$ff,$7f,$77,$3f   ; [$9e03] byte


;
; ...░▒▒░░
; ...░██░░
; ...░▒▒.░
; ...░█▒.░
; ...░▒▒.▒
; ...░█▒.▒
; ...░▒▒.▒
; ...░█░.▒
;
SPRITE_TILES_PORTRAIT_GURU_02:              ; [$9e0b]
    .byte $13,$1f,$11,$19,$10,$18,$10,$1c   ; [$9e0b] byte
    .byte $0c,$0c,$0c,$0c,$0d,$0d,$0d,$09   ; [$9e13] byte


;
; .....░▒▒
; ░▒▒▒░...
; ▒░░░░▒▒▒
; ░....░░▒
; .▒█▒..░░
; .██.█.░▒
; ▒█..█░░▒
; ▒▒▒░░░░▒
;
SPRITE_TILES_PORTRAIT_GURU_03:              ; [$9e1b]
    .byte $04,$88,$78,$86,$23,$6a,$4e,$1e   ; [$9e1b] byte
    .byte $03,$70,$87,$01,$70,$69,$c9,$e1   ; [$9e23] byte


;
; ..░▒▒▒.░
; ..░▒█▒.░
; ..░▒▒▒.░
; ..░▒█▒.░
; ..░▒▒▒.░
; ..░██▒.░
; ..░▒▒▒.░
; ..░██░.░
;
SPRITE_TILES_PORTRAIT_GURU_04:              ; [$9e2b]
    .byte $21,$29,$21,$29,$21,$39,$21,$3d   ; [$9e2b] byte
    .byte $1c,$1c,$1c,$1c,$1c,$1c,$1c,$18   ; [$9e33] byte


;
; ▒██▒▒░▒█
; ▒█▒▒▒░▒█
; ▒▒▒▒▒.░▒
; ░▒▒▒░░.░
; ▒░▒▒▒░░.
; ▒░▒▒▒▒░░
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒░░░
;
SPRITE_TILES_PORTRAIT_GURU_05:              ; [$9e3b]
    .byte $65,$45,$02,$8d,$46,$43,$01,$07   ; [$9e3b] byte
    .byte $fb,$fb,$f9,$70,$b8,$bc,$fe,$f8   ; [$9e43] byte


;
; ..░▒▒▒▒.
; ..░██▒▒.
; ..░▒▒▒▒.
; ..░██▒▒▒
; ..░▒▒▒▒▒
; ..░██▒█▒
; ..░░▒▒▒▒
; ...▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_GURU_06:              ; [$9e4b]
    .byte $20,$38,$20,$38,$20,$3a,$30,$00   ; [$9e4b] byte
    .byte $1e,$1e,$1e,$1f,$1f,$1f,$0f,$1f   ; [$9e53] byte


;
; ░▒▒▒░...
; ░▒▒▒▒▒▒█
; ░▒▒▒▒▒▒▒
; .░▒▒▒▒░░
; .░▒▒▒▒▒█
; ..░▒▒▒▒▒
; .▒.░░▒▒▒
; .▒▒..░░░
;
SPRITE_TILES_PORTRAIT_GURU_07:              ; [$9e5b]
    .byte $88,$81,$80,$43,$41,$20,$18,$07   ; [$9e5b] byte
    .byte $70,$7f,$7f,$3c,$3f,$1f,$47,$60   ; [$9e63] byte


;
; .....░▒▒
; ░▒▒▒░...
; ▒██▒░░▒▒
; ▒█▒▒▒░░▒
; ▒▒▒▒▒▒░░
; .▒▒▒▒░░▒
; ▒....░░▒
; ▒▒▒░░░░▒
;
SPRITE_TILES_PORTRAIT_GURU_16:              ; [$9e6b]
    .byte $04,$88,$6c,$46,$03,$06,$06,$1e   ; [$9e6b] byte
    .byte $03,$70,$f3,$f9,$fc,$79,$81,$e1   ; [$9e73] byte


;
; ░▒▒▒░...
; ░▒▒▒▒░..
; ░▒▒▒▒▒▒█
; .░▒▒▒▒▒▒
; .░▒▒▒▒░░
; ..░▒▒▒▒▒
; .▒.░░▒▒▒
; .▒▒..░░░
;
SPRITE_TILES_PORTRAIT_GURU_17:              ; [$9e7b]
    .byte $88,$84,$81,$40,$43,$20,$18,$07   ; [$9e7b] byte
    .byte $70,$78,$7f,$3f,$3c,$1f,$47,$60   ; [$9e83] byte


;
; ........
; ........
; ........
; ........
; .......░
; ......░▒
; ......▒█
; .....░██
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_KEY_SALESMAN
;     [$PRG8::9343]
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_00:      ; [$9e8b]
    .byte $00,$00,$00,$00,$01,$02,$01,$07   ; [$9e8b] byte
    .byte $00,$00,$00,$00,$00,$01,$03,$03   ; [$9e93] byte


;
; ........
; ...░▒▒▒▒
; .░░▒▒░░▒
; ░▒██░░..
; ██▒░..░▒
; ▒▒▒░.▒▒█
; █▒░.▒██▒
; ▒░░.▒█▒▒
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_01:      ; [$9e9b]
    .byte $00,$10,$66,$bc,$d2,$11,$a6,$64   ; [$9e9b] byte
    .byte $00,$0f,$19,$70,$e1,$e7,$cf,$8f   ; [$9ea3] byte


;
; ........
; ▒▒▒▒░...
; █▒░░▒░░.
; .█▒░░░▒░
; ▒.█▒░.░▒
; ▒▒.█░░.░
; ▒▒░█░▒░.
; ▒▒░░▒▒▒░
;
SPRITE_TILES_PORTRAIT_DOCTOR_02__KEY_SALESMAN_02: ; [$9eab]
    .byte $00,$08,$b6,$5d,$2a,$1d,$3a,$31   ; [$9eab] byte
    .byte $00,$f0,$c8,$62,$b1,$d0,$d4,$ce   ; [$9eb3] byte


;
; .....░█░
; ....░▒░█
; ....░░█░
; ....░█░█
; ...░█▒█▒
; ..▒█░░█░
; ....░█▒░
; ...░▒▒▒░
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_04:      ; [$9ebb]
    .byte $07,$0b,$0f,$0f,$1a,$1f,$0d,$11   ; [$9ebb] byte
    .byte $02,$05,$02,$05,$0f,$32,$06,$0e   ; [$9ec3] byte


;
; ▒░.▒▒▒▒▒
; ░░.▒▒▒▒▒
; ░░.▒▒▒▒▒
; ░.▒▒▒▒▒▒
; ░.▒▒▒▒..
; .▒▒▒▒.░░
; .▒▒▒.▒█▒
; .▒▒░▒▒▒▒
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_05:      ; [$9ecb]
    .byte $40,$c0,$c0,$80,$80,$03,$02,$10   ; [$9ecb] byte
    .byte $9f,$1f,$1f,$3f,$3c,$78,$77,$6f   ; [$9ed3] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒░▒▒▒▒▒
; ▒.▒▒░░▒▒
; .░▒▒▒░..
; ░░▒▒░░░░
; ▒░▒▒░▒█▒
; ▒░█▒░▒▒▒
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_06:      ; [$9edb]
    .byte $00,$00,$20,$0c,$44,$cf,$4a,$68   ; [$9edb] byte
    .byte $ff,$ff,$df,$b3,$38,$30,$b7,$b7   ; [$9ee3] byte


;
; ░░......
; ░░......
; ░░......
; ░░......
; .░......
; ░.......
; ░░......
; ▒░......
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_07:      ; [$9eeb]
    .byte $c0,$c0,$c0,$c0,$40,$80,$c0,$40   ; [$9eeb] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$80   ; [$9ef3] byte


;
; ..▒░.▒..
; ..▒░░.░.
; ..▒▒.▒░.
; ...▒.▒▒▒
; ...▒░.▒▒
; ....▒.░▒
; ....▒▒░▒
; ....░▒░▒
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_08:      ; [$9efb]
    .byte $10,$1a,$02,$00,$08,$02,$02,$0a   ; [$9efb] byte
    .byte $24,$20,$34,$17,$13,$09,$0d,$05   ; [$9f03] byte


;
; ▒▒░░...█
; ▒▒▒▒▒██.
; ▒██▒░▒██
; ▒█▒▒▒░░░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ▒░░░▒▒▒░
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_09:      ; [$9f0b]
    .byte $31,$06,$6b,$47,$00,$00,$80,$71   ; [$9f0b] byte
    .byte $c1,$fe,$f7,$f8,$ff,$ff,$7f,$8e   ; [$9f13] byte


;
; .▒▒▒░.█.
; .▒▒▒░░..
; █▒▒▒░.██
; ▒▒█▒▒.░░
; ▒▒▒░░.░▒
; ░░░░░..▒
; ▒░░...▒▒
; ▒▒░░..░░
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_10:      ; [$9f1b]
    .byte $0a,$0c,$8b,$23,$1a,$f8,$60,$33   ; [$9f1b] byte
    .byte $72,$70,$f3,$f8,$e1,$01,$83,$c0   ; [$9f23] byte


;
; ░░░.....
; ░░░.....
; ░░░.....
; ▒░░.....
; ▒░░.....
; ░░......
; ░░......
; ░░......
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_11:      ; [$9f2b]
    .byte $e0,$e0,$e0,$60,$60,$c0,$c0,$c0   ; [$9f2b] byte
    .byte $00,$00,$00,$80,$80,$00,$00,$00   ; [$9f33] byte


;
; ▒▒░░░▒▒▒
; ▒▒▒▒.░▒▒
; ▒██▒▒...
; ▒█▒▒▒▒░░
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ▒░░░▒▒▒░
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_35:      ; [$9f3b]
    .byte $38,$04,$60,$43,$00,$00,$80,$71   ; [$9f3b] byte
    .byte $c7,$f3,$f8,$fc,$ff,$ff,$7f,$8e   ; [$9f43] byte


;
; ▒▒▒▒░▒▒▒
; .▒▒▒░░▒▒
; ░▒▒▒░.░░
; ▒▒█▒▒.░░
; ▒▒▒░░.░▒
; ░░░░░..▒
; ▒░░...▒▒
; ▒▒░░..░░
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_36:      ; [$9f4b]
    .byte $08,$0c,$8b,$23,$1a,$f8,$60,$33   ; [$9f4b] byte
    .byte $f7,$73,$70,$f8,$e1,$01,$83,$c0   ; [$9f53] byte


;
; ........
; ........
; ......░░
; ......░░
; .....░░░
; .....░░░
; ....░░░░
; ....░░░░
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_SMOKING_GUY
;     [$PRG8::92e9]
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_00:       ; [$9f5b]
    .byte $00,$00,$03,$03,$07,$07,$0f,$0f   ; [$9f5b] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9f63] byte


;
; ..░░░░░░
; ░░░░░░░░
; ░░░░░░░░
; ░░░░░░░░
; ░░░░░░░.
; ░░░...░.
; ░░.▒█▒.▒
; ░.▒▒█▒▒▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_01:       ; [$9f6b]
    .byte $3f,$ff,$ff,$ff,$fe,$e2,$c8,$88   ; [$9f6b] byte
    .byte $00,$00,$00,$00,$00,$00,$1d,$3f   ; [$9f73] byte


;
; ░░░░....
; ░░░░░░..
; ░░░░░░░.
; ░.░░░░░░
; ░▒....░░
; ▒▒▒.▒░.░
; ▒▒▒▒▒▒▒.
; ▒░▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_02:       ; [$9f7b]
    .byte $f0,$fc,$fe,$bf,$83,$05,$00,$40   ; [$9f7b] byte
    .byte $00,$00,$00,$00,$40,$e8,$fe,$bf   ; [$9f83] byte


;
; ........
; ........
; ........
; ........
; ░.......
; ░.......
; ░░......
; .░......
;
SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03: ; [$9f8b]
    .byte $00,$00,$00,$00,$80,$80,$c0,$40   ; [$9f8b] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9f93] byte


;
; ....░░░░
; ...░░░░░
; ...░░░░░
; ...░░░░░
; ....░░░░
; ..░▒.░░░
; ..▒█▒.░░
; ..▒.█▒.░
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_04:       ; [$9f9b]
    .byte $0f,$1f,$1f,$1f,$0f,$27,$13,$09   ; [$9f9b] byte
    .byte $00,$00,$00,$00,$00,$10,$38,$2c   ; [$9fa3] byte


;
; ░.▒▒▒▒░░
; ░.▒▒░..░
; ░.▒░.▒▒░
; .▒▒.▒░.░
; .▒▒▒░.█.
; .▒▒▒░█.░
; .▒▒▒▒███
; .▒▒▒▒▒█▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_05:       ; [$9fab]
    .byte $83,$89,$91,$05,$0a,$0d,$07,$02   ; [$9fab] byte
    .byte $3c,$30,$26,$68,$72,$74,$7f,$7f   ; [$9fb3] byte


;
; ..▒▒▒.▒▒
; ▒▒▒▒▒░..
; ░▒▒▒▒.░░
; ░░▒▒...░
; ▒░▒░.█..
; ▒░▒░...█
; ▒░▒░.███
; ░░▒▒░.░░
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_06:       ; [$9fbb]
    .byte $00,$04,$83,$c1,$54,$51,$57,$cb   ; [$9fbb] byte
    .byte $3b,$f8,$78,$30,$a4,$a1,$a7,$30   ; [$9fc3] byte


;
; .░......
; .░......
; .░......
; .░......
; ░░......
; ░░......
; ░░......
; ░░......
;
SPRITE_TILES_PORTRAIT_DOCTOR_07__SMOKING_GUY_07: ; [$9fcb]
    .byte $40,$40,$40,$40,$c0,$c0,$c0,$c0   ; [$9fcb] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9fd3] byte


;
; ..▒░.▒░░
; ..▒░░.▒▒
; ..▒▒.▒▒░
; ...▒.▒▒▒
; ...▒░.▒▒
; ....▒.░▒
; ....▒▒░▒
; ....░▒░▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_08:       ; [$9fdb]
    .byte $13,$18,$01,$00,$08,$02,$02,$0a   ; [$9fdb] byte
    .byte $24,$23,$36,$17,$13,$09,$0d,$05   ; [$9fe3] byte


;
; ░▒▒▒▒░░░
; ▒▒█▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ▒░▒▒▒▒▒░
; ▒▒░░▒▒▒░
; ▒▒░▒▒▒▒░
; ▒▒░▒▒░░█
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_09:       ; [$9feb]
    .byte $87,$20,$00,$80,$41,$31,$21,$27   ; [$9feb] byte
    .byte $78,$ff,$ff,$7f,$be,$ce,$de,$d9   ; [$9ff3] byte


;
; ░░▒▒▒.░░
; ░░▒▒▒░.░
; .▒▒▒▒▒░.
; .▒▒▒▒▒░.
; ..░░▒░.▒
; .░..░░.▒
; █▒░░..░░
; ▒▒▒░░░░░
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_10:       ; [$9ffb]
    .byte $c3,$c5,$02,$02,$34,$4c,$b3,$1f   ; [$9ffb] byte
    .byte $38,$38,$7c,$7c,$09,$01,$c0,$e0   ; [$a003] byte


;
; ░░......
; ▒░░.....
; ▒░░.....
; ▒░░.....
; ▒░░.....
; ░░......
; ░░......
; ░░......
;
SPRITE_TILES_PORTRAIT_DOCTOR_10__SMOKING_GUY_11: ; [$a00b]
    .byte $c0,$60,$60,$60,$60,$c0,$c0,$c0   ; [$a00b] byte
    .byte $00,$80,$80,$80,$80,$00,$00,$00   ; [$a013] byte


;
; .....░░▒
; ......░░
; ......░░
; .......░
; .......░
; .......░
; ........
; ........
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_12__KEY_SALESMAN_12: ; [$a01b]
    .byte $06,$03,$03,$01,$01,$01,$00,$00   ; [$a01b] byte
    .byte $01,$00,$00,$00,$00,$00,$00,$00   ; [$a023] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒░▒▒▒
; ▒▒▒▒░▒▒░
; ░▒▒▒░▒▒▒
; .▒▒▒▒▒▒▒
; ▒░░▒▒▒▒▒
; ▒▒.░░▒░▒
; ░▒▒...░░
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_13__KEY_SALESMAN_13: ; [$a02b]
    .byte $00,$08,$09,$88,$00,$60,$1a,$83   ; [$a02b] byte
    .byte $ff,$f7,$f6,$77,$7f,$9f,$c5,$60   ; [$a033] byte


;
; ████████
; ████████
; ████████
; ████████
; ████████
; ████████
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30: ; [$a03b]
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a03b] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a043] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23: ; [$a04b]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a04b] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a053] byte


;
; █████.▒▒
; ██████.▒
; ██████.▒
; ███████.
; ████████
; ████████
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_23:      ; [$a05b]
    .byte $f8,$fc,$fc,$fe,$ff,$ff,$ff,$ff   ; [$a05b] byte
    .byte $fb,$fd,$fd,$fe,$ff,$ff,$ff,$ff   ; [$a063] byte


;
; ▒░.....░
; ░███▒░.█
; █▒▒▒▒▒░░
; ▒▒▒░░░░.
; ▒▒░▒▒░░░
; ▒▒██▒▒░░
; ▒▒█▒▒▒░░
; ▒▒▒▒▒░░.
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_14__KEY_SALESMAN_14: ; [$a06b]
    .byte $41,$f5,$83,$1e,$27,$33,$23,$06   ; [$a06b] byte
    .byte $80,$79,$fc,$e0,$d8,$fc,$fc,$f8   ; [$a073] byte


;
; ░.......
; ████░...
; ▒▒▒░░...
; ........
; ........
; ........
; ........
; ........
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_15__KEY_SALESMAN_15: ; [$a07b]
    .byte $80,$f8,$18,$00,$00,$00,$00,$00   ; [$a07b] byte
    .byte $00,$f0,$e0,$00,$00,$00,$00,$00   ; [$a083] byte


;
; ░.▒▒▒▒░░
; ░.▒▒░..░
; ░.▒░.▒▒░
; .▒▒.▒█▒▒
; .▒▒▒▒██▒
; .▒▒▒.▒▒▒
; .▒▒▒▒...
; .▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_25:       ; [$a08b]
    .byte $83,$89,$91,$04,$06,$00,$00,$00   ; [$a08b] byte
    .byte $3c,$30,$26,$6f,$7f,$77,$78,$7f   ; [$a093] byte


;
; ..▒▒▒.▒▒
; ▒▒▒▒▒░..
; ░▒▒▒▒.░░
; ░░▒▒.▒▒▒
; ▒░▒░.▒▒▒
; .░▒░.░▒░
; ▒░▒░....
; ░░▒▒░.░░
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_26:       ; [$a09b]
    .byte $00,$04,$83,$c0,$50,$55,$50,$cb   ; [$a09b] byte
    .byte $3b,$f8,$78,$37,$a7,$22,$a0,$30   ; [$a0a3] byte


;
; ▒░.....░
; ░.....▒█
; █▒██▒▒░░
; ▒▒▒▒▒░░.
; ▒▒░░░░░░
; ▒▒██▒▒░░
; ▒▒█▒▒▒░░
; ▒▒▒▒▒░░.
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_27__KEY_SALESMAN_37: ; [$a0ab]
    .byte $41,$81,$b3,$06,$3f,$33,$23,$06   ; [$a0ab] byte
    .byte $80,$03,$fc,$f8,$c0,$fc,$fc,$f8   ; [$a0b3] byte


;
; ░.......
; ▒░......
; ███▒....
; ..▒░░...
; ...░....
; ........
; ........
; ........
;
SPRITE_TILES_PORTRAIT_SMOKING_GUY_28__KEY_SALESMAN_38: ; [$a0bb]
    .byte $80,$40,$e0,$18,$10,$00,$00,$00   ; [$a0bb] byte
    .byte $00,$80,$f0,$20,$00,$00,$00,$00   ; [$a0c3] byte


;
; .....░░░
; ...▒▒▒▒▒
; .▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_08:    ; [$a0cb]
    .byte $07,$00,$00,$00,$00,$00,$00,$00   ; [$a0cb] byte
    .byte $00,$1f,$7f,$ff,$ff,$ff,$ff,$ff   ; [$a0d3] byte


;
; ████.░░░
; .███░.░░
; ..███░.░
; ▒.████░.
; ▒.██████
; ▒.██████
; ▒.██████
; ▒.██████
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_09:    ; [$a0db]
    .byte $f7,$7b,$3d,$3e,$3f,$3f,$3f,$3f   ; [$a0db] byte
    .byte $f0,$70,$38,$bc,$bf,$bf,$bf,$bf   ; [$a0e3] byte


;
; ░░░░░░░░
; ░░░░░░░░
; ░░░░░░░░
; .░░░░░░░
; ░..░░░.░
; █░░...░.
; ██░░░░░░
; █████▒▒█
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_10:    ; [$a0eb]
    .byte $ff,$ff,$ff,$7f,$9d,$e2,$ff,$f9   ; [$a0eb] byte
    .byte $00,$00,$00,$00,$00,$80,$c0,$ff   ; [$a0f3] byte


;
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒.▒▒
; ▒▒▒▒▒▒.▒
; ▒▒▒▒▒▒░.
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒.
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_11:    ; [$a0fb]
    .byte $00,$00,$00,$00,$02,$00,$00,$00   ; [$a0fb] byte
    .byte $ff,$ff,$fb,$fd,$fc,$fe,$fe,$fe   ; [$a103] byte


;
; .███████
; .▒██████
; .▒██████
; .▒██████
; ▒███████
; ▒███████
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_12__KEY_SALESMAN_26: ; [$a10b]
    .byte $7f,$3f,$3f,$3f,$7f,$7f,$ff,$ff   ; [$a10b] byte
    .byte $7f,$7f,$7f,$7f,$ff,$ff,$ff,$ff   ; [$a113] byte


;
; ▒▒▒▒▒▒.▒
; ▒▒▒▒▒▒.▒
; ▒▒▒▒▒░.▒
; ▒▒▒▒░...
; ▒▒▒░.▒░░
; ▒▒░.▒░▒▒
; ▒▒.▒▒░▒▒
; ▒▒░▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33: ; [$a11b]
    .byte $00,$00,$04,$08,$13,$24,$04,$20   ; [$a11b] byte
    .byte $fd,$fd,$f9,$f0,$e4,$cb,$db,$df   ; [$a123] byte


;
; ████████
; ████████
; ████████
; ████████
; ..██████
; ▒░..████
; ░▒▒░..██
; ░▒░▒▒▒..
;
SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34: ; [$a12b]
    .byte $ff,$ff,$ff,$ff,$3f,$4f,$93,$a0   ; [$a12b] byte
    .byte $ff,$ff,$ff,$ff,$3f,$8f,$63,$5c   ; [$a133] byte


;
; ░▒▒▒▒░▒░
; ▒▒░▒▒░▒░
; ░▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒▒▒
; ░░░░░░░▒
; .░░░░░░░
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_16:    ; [$a13b]
    .byte $85,$25,$80,$00,$00,$80,$fe,$7f   ; [$a13b] byte
    .byte $7a,$da,$7f,$ff,$ff,$7f,$01,$00   ; [$a143] byte


;
; ▒▒▒▒▒▒░▒
; ▒▒░▒▒░▒▒
; ░▒▒▒▒░▒▒
; ▒▒▒▒▒░▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒░▒
; ▒▒▒▒▒▒▒▒
; ░░░░░░▒▒
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_17:    ; [$a14b]
    .byte $02,$24,$84,$04,$00,$02,$00,$fc   ; [$a14b] byte
    .byte $fd,$db,$7b,$fb,$ff,$fd,$ff,$03   ; [$a153] byte


;
; ..██████
; ▒░.█████
; ▒▒▒.████
; ▒▒▒▒.███
; ▒▒▒░▒.██
; ▒▒░▒▒.██
; ▒▒▒▒▒▒.█
; ▒▒▒▒▒▒.█
;
SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_18:    ; [$a15b]
    .byte $3f,$5f,$0f,$07,$13,$23,$01,$01   ; [$a15b] byte
    .byte $3f,$9f,$ef,$f7,$eb,$db,$fd,$fd   ; [$a163] byte


;
; .░▒▒▒▒▒.
; .░▒▒▒▒▒.
; .░▒▒▒▒.█
; .▒▒▒▒▒.█
; .▒▒▒▒▒.█
; .▒▒▒▒.██
; .▒▒▒▒.██
; .▒▒▒▒.██
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_21:     ; [$a16b]
    .byte $40,$40,$41,$01,$01,$03,$03,$03   ; [$a16b] byte
    .byte $3e,$3e,$3d,$7d,$7d,$7b,$7b,$7b   ; [$a173] byte


;
; ........
; ......░░
; .....░▒▒
; ....░▒▒▒
; ....▒▒▒▒
; ...░▒▒▒▒
; ..░▒▒▒▒▒
; ..░▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_15:     ; [$a17b]
    .byte $00,$03,$04,$08,$00,$10,$20,$20   ; [$a17b] byte
    .byte $00,$00,$03,$07,$0f,$0f,$1f,$1f   ; [$a183] byte


;
; ........
; ........
; ......░░
; .....░▒▒
; .....▒░░
; ....▒░▒▒
; ...▒▒░░.
; ..▒░▒░.░
;
; XREFS:
;     SPRITE_TILES_PORTRAIT_ADDRS_DOCTOR [$PRG8::9298]
;
SPRITE_TILES_PORTRAIT_DOCTOR_00:            ; [$a18b]
    .byte $00,$00,$03,$04,$03,$04,$06,$15   ; [$a18b] byte
    .byte $00,$00,$00,$03,$04,$0b,$18,$28   ; [$a193] byte


;
; ...░░░░░
; ░░░░▒▒▒▒
; ▒▒▒▒░░▒░
; ░░░░▒▒▒▒
; ▒▒▒░░░▒▒
; ░░░....▒
; ...▒▒▒▒.
; ▒▒▒▒░░▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_01:            ; [$a19b]
    .byte $1f,$f0,$0d,$f0,$1c,$e0,$00,$0c   ; [$a19b] byte
    .byte $00,$0f,$f2,$0f,$e3,$01,$1e,$f3   ; [$a1a3] byte


;
; ▒▒▒▒▒▒░░
; ▒▒░░░▒▒▒
; ▒▒▒▒▒░░▒
; ▒▒▒▒▒▒▒░
; ▒▒▒▒▒▒.▒
; ▒░.....▒
; ....░▒▒▒
; .▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_05:            ; [$a1ab]
    .byte $03,$38,$06,$01,$00,$40,$08,$00   ; [$a1ab] byte
    .byte $fc,$c7,$f9,$fe,$fd,$81,$07,$7f   ; [$a1b3] byte


;
; ░░▒▒▒▒▒▒
; ▒▒▒░░░▒▒
; ▒░░▒▒▒▒▒
; ░▒▒▒...▒
; ▒▒▒..░░.
; ▒..░▒▒░░
; ▒.░▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_06:            ; [$a1bb]
    .byte $c0,$1c,$60,$80,$06,$13,$20,$00   ; [$a1bb] byte
    .byte $3f,$e3,$9f,$71,$e0,$8c,$9f,$ff   ; [$a1c3] byte


;
; .....░░▒
; ▒▒▒▒..░▒
; ████▒.░▒
; █████▒.░
; ██████▒.
; ███████▒
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_DOCTOR_12__MEAT_SALESMAN_22: ; [$a1cb]
    .byte $06,$02,$f2,$f9,$fc,$fe,$ff,$ff   ; [$a1cb] byte
    .byte $01,$f1,$f9,$fc,$fe,$ff,$ff,$ff   ; [$a1d3] byte


;
; ░▒░.....
; ▒░▒▒▒▒▒█
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒░░
; ░▒▒▒▒▒▒█
; .░░▒▒▒▒▒
; ▒.░░░▒▒▒
; █▒.░░░░░
;
SPRITE_TILES_PORTRAIT_DOCTOR_13:            ; [$a1db]
    .byte $a0,$41,$00,$03,$81,$60,$38,$9f   ; [$a1db] byte
    .byte $40,$bf,$ff,$fc,$7f,$1f,$87,$c0   ; [$a1e3] byte


;
; ░▒░.....
; ▒░▒▒▒...
; ▒▒▒▒▒▒▒█
; ▒▒▒▒▒▒▒▒
; ░▒▒▒▒▒░░
; .░░▒▒▒▒█
; ▒.░░░▒▒▒
; █▒.░░░░░
;
SPRITE_TILES_PORTRAIT_DOCTOR_23:            ; [$a1eb]
    .byte $a0,$40,$01,$00,$83,$61,$38,$9f   ; [$a1eb] byte
    .byte $40,$b8,$ff,$ff,$7c,$1f,$87,$c0   ; [$a1f3] byte


;
; ██▒.░░░░
; ███▒.░░░
; ████▒.░░
; █████▒..
; ████████
; ████████
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_DOCTOR_16__MEAT_SALESMAN_28: ; [$a1fb]
    .byte $cf,$e7,$f3,$f8,$ff,$ff,$ff,$ff   ; [$a1fb] byte
    .byte $e0,$f0,$f8,$fc,$ff,$ff,$ff,$ff   ; [$a203] byte


;
; ........
; ........
; .....▒▒▒
; ...▒▒███
; ..▒█████
; .▒██████
; .███████
; ▒███████
;
SPRITE_TILES_PORTRAIT_DOCTOR_11:            ; [$a20b]
    .byte $00,$00,$00,$07,$1f,$3f,$7f,$7f   ; [$a20b] byte
    .byte $00,$00,$07,$1f,$3f,$7f,$7f,$ff   ; [$a213] byte


;
; ███.....
; █..▒▒▒▒▒
; .▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_DOCTOR_14:            ; [$a21b]
    .byte $e0,$80,$00,$00,$00,$00,$00,$00   ; [$a21b] byte
    .byte $e0,$9f,$7f,$ff,$ff,$ff,$ff,$ff   ; [$a223] byte


;
; ████████
; ..███.██
; ▒▒.██.██
; ▒▒.█.▒██
; ▒▒.█.▒██
; ▒▒▒.▒███
; ▒▒▒.▒███
; ▒▒▒.▒███
;
SPRITE_TILES_PORTRAIT_DOCTOR_15:            ; [$a22b]
    .byte $ff,$3b,$1b,$13,$13,$07,$07,$07   ; [$a22b] byte
    .byte $ff,$3b,$db,$d7,$d7,$ef,$ef,$ef   ; [$a233] byte


;
; ▒▒░▒████
; ▒▒░▒████
; ▒▒.▒████
; ▒░▒█████
; ▒.▒█████
; ░▒██████
; ░▒██████
; .▒██████
;
    .byte $2f,$2f,$0f,$5f,$1f,$bf,$bf,$3f   ; [$a23b] byte
    .byte $df,$df,$df,$bf,$bf,$7f,$7f,$7f   ; [$a243] byte


;
; ......▒█
; ....▒▒██
; .░██████
; ░██████▒
; ███████░
; ██████░█
; ██████░█
; ░████▒░█
;
SPRITE_TILES_PORTRAIT_MAGICIAN_08__MEAT_SALESMAN_29: ; [$a24b]
    .byte $01,$03,$7f,$fe,$ff,$ff,$ff,$fb   ; [$a24b] byte
    .byte $03,$0f,$3f,$7f,$fe,$fd,$fd,$7d   ; [$a253] byte


;
; ██▒█▒▒██
; ░█░█▒░▒▒
; ▒▒█░░▒░░
; █▒▒▒▒▒▒▒
; ████▒█▒█
; █████▒█▒
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_MAGICIAN_12:          ; [$a25b]
    .byte $d3,$f4,$3b,$80,$f5,$fa,$ff,$ff   ; [$a25b] byte
    .byte $ff,$5b,$e4,$ff,$ff,$ff,$ff,$ff   ; [$a263] byte


;
; ▒▒.▒████
; ▒▒.▒████
; ▒▒.▒████
; ▒.▒█████
; ▒.▒█████
; .▒██████
; .▒██████
; .▒██████
;
SPRITE_TILES_PORTRAIT_DOCTOR_18:            ; [$a26b]
    .byte $0f,$0f,$0f,$1f,$1f,$3f,$3f,$3f   ; [$a26b] byte
    .byte $df,$df,$df,$bf,$bf,$7f,$7f,$7f   ; [$a273] byte


;
; ..░▒█▒▒.
; ..░▒█▒..
; ..░░░░.▒
; ░░░░.░▒.
; ███░█.▒░
; ████░█.░
; ████░█.░
; █████░█░
;
SPRITE_TILES_PORTRAIT_GURU_09:              ; [$a27b]
    .byte $28,$28,$3c,$f4,$f9,$fd,$fd,$ff   ; [$a27b] byte
    .byte $1e,$1c,$01,$02,$ea,$f4,$f4,$fa   ; [$a283] byte


;
; █████░█.
; ██████░█
; ███████░
; ████████
; ████████
; ████████
; ████████
; ████████
;
SPRITE_TILES_PORTRAIT_GURU_12:              ; [$a28b]
    .byte $fe,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a28b] byte
    .byte $fa,$fd,$fe,$ff,$ff,$ff,$ff,$ff   ; [$a293] byte


;
; ░▒█░░█▒█
; .▒█▒░▒█▒
; █.▒█▒░██
; ░█.█▒░▒█
; █░█.▒░█▒
; ▒█░█.▒██
; ▒██░█.▒█
; ▒███░█.█
;
SPRITE_TILES_PORTRAIT_GURU_13:              ; [$a29b]
    .byte $bd,$2a,$97,$d5,$e6,$73,$79,$7d   ; [$a29b] byte
    .byte $67,$77,$bb,$5b,$ab,$d7,$eb,$f5   ; [$a2a3] byte


;
; ▒██░░░█.
; ▒██▒░▒░█
; ▒███▒░..
; ░███▒▒.█
; ████░▒..
; ▒██▒░▒██
; ▒██▒░▒..
; ▒███░▒.█
;
SPRITE_TILES_PORTRAIT_GURU_14:              ; [$a2ab]
    .byte $7e,$6b,$74,$f1,$f8,$6b,$68,$79   ; [$a2ab] byte
    .byte $e2,$f5,$f8,$7d,$f4,$f7,$f4,$f5   ; [$a2b3] byte


;
; ▒██░░█.█
; ▒██▒░▒.█
; ▒███▒░.█
; ░███▒░.█
; ████▒░░.
; ▒██▒░▒██
; ▒██▒░▒██
; ▒███▒░▒█
;
SPRITE_TILES_PORTRAIT_GURU_15:              ; [$a2bb]
    .byte $7d,$69,$75,$f5,$f6,$6b,$6b,$75   ; [$a2bb] byte
    .byte $e5,$f5,$f9,$79,$f8,$f7,$f7,$fb   ; [$a2c3] byte


;
; ████████
; ...█████
; ▒▒▒.████
; ▒▒▒▒.███
; ▒▒▒▒.███
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
;
    .byte $ff,$1f,$0f,$07,$07,$03,$03,$03   ; [$a2cb] byte
    .byte $ff,$1f,$ef,$f7,$f7,$fb,$fb,$fb   ; [$a2d3] byte


;
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒▒.██
; ▒▒▒▒.███
; ▒▒▒▒.███
;
    .byte $03,$03,$03,$03,$03,$03,$07,$07   ; [$a2db] byte
    .byte $fb,$fb,$fb,$fb,$fb,$fb,$f7,$f7   ; [$a2e3] byte


;
; ▒▒▒.██..
; ▒▒.████.
; ..█████.
; ███████.
; ████████
; ████████
; ████████
; ████████
;
    .byte $0c,$1e,$3e,$fe,$ff,$ff,$ff,$ff   ; [$a2eb] byte
    .byte $ec,$de,$3e,$fe,$ff,$ff,$ff,$ff   ; [$a2f3] byte


;
; ........
; ████....
; ███████.
; ████████
; ████████
; ████████
; ████████
; ████████
;
    .byte $00,$f0,$fe,$ff,$ff,$ff,$ff,$ff   ; [$a2fb] byte
    .byte $00,$f0,$fe,$ff,$ff,$ff,$ff,$ff   ; [$a303] byte


;
; ░░░░░░..
; ░░░░░░.█
; ▒▒░░░░.▒
; ▒▒▒░░░.▒
; ▒▒▒▒░░.▒
; ▒▒▒▒░░.▒
; ▒▒░░░░░.
; ▒▒▒▒░░░.
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_19:      ; [$a30b]
    .byte $fc,$fd,$3c,$1c,$0c,$0c,$3e,$0e   ; [$a30b] byte
    .byte $00,$01,$c1,$e1,$f1,$f1,$c0,$f0   ; [$a313] byte


;
; ........
; █.......
; ████....
; ██████..
; ███████.
; ████████
; ▒███████
; ▒███████
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_20:      ; [$a31b]
    .byte $00,$80,$f0,$fc,$fe,$ff,$7f,$7f   ; [$a31b] byte
    .byte $00,$80,$f0,$fc,$fe,$ff,$ff,$ff   ; [$a323] byte


;
; ........
; ........
; ........
; ........
; ........
; █.......
; ███.....
; ████....
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_21:      ; [$a32b]
    .byte $00,$00,$00,$00,$00,$80,$e0,$f0   ; [$a32b] byte
    .byte $00,$00,$00,$00,$00,$80,$e0,$f0   ; [$a333] byte


;
; ██......
; █.▒▒....
; █.▒▒▒...
; .▒▒▒▒...
; .▒▒▒▒▒..
; .▒▒▒▒▒..
; .▒▒▒▒▒..
; .▒▒▒▒▒▒.
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_27:      ; [$a33b]
    .byte $c0,$80,$80,$00,$00,$00,$00,$00   ; [$a33b] byte
    .byte $c0,$b0,$b8,$78,$7c,$7c,$7c,$7e   ; [$a343] byte


;
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒.
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; ▒▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
; .▒▒▒▒▒▒▒
;
SPRITE_TILES_PORTRAIT_KEY_SALESMAN_32:      ; [$a34b]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a34b] byte
    .byte $fe,$fe,$ff,$ff,$ff,$7f,$7f,$7f   ; [$a353] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; ........
;
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a35b] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a363] byte
    .byte $fc,$00,$04,$00,$00,$00,$00,$00   ; [$a36b] undefined
    .byte $0b,$00,$00,$00,$00,$00,$00,$00   ; [$a373] undefined
    .byte $29,$00,$00,$00,$00,$00,$00,$00   ; [$a37b] undefined
    .byte $7b,$00,$87,$00,$0a,$00,$00,$00   ; [$a383] undefined
    .byte $cf,$00,$21,$00,$20,$00,$00,$00   ; [$a38b] undefined
    .byte $5a,$00,$08,$00,$00,$00,$00,$00   ; [$a393] undefined
    .byte $40,$00,$10,$00,$00,$00,$00,$00   ; [$a39b] undefined
    .byte $e5,$00,$ff,$00,$04,$00,$00,$00   ; [$a3a3] undefined
    .byte $76,$00,$00,$00,$00,$00,$00,$00   ; [$a3ab] undefined
    .byte $1a,$00,$04,$00,$00,$00,$00,$00   ; [$a3b3] undefined
    .byte $08,$00,$00,$00,$00,$00,$00,$00   ; [$a3bb] undefined
    .byte $5f,$00,$f4,$00,$02,$00,$00,$00   ; [$a3c3] undefined
    .byte $78,$00,$00,$00,$01,$00,$00,$00   ; [$a3cb] undefined
    .byte $2c,$80,$18,$00,$00,$00,$00,$00   ; [$a3d3] undefined
    .byte $8a,$00,$00,$00,$00,$00,$00,$00   ; [$a3db] undefined
    .byte $ce,$00,$28,$00,$02,$00,$00,$00   ; [$a3e3] undefined
    .byte $4a,$00,$01,$00,$01,$00,$00,$00   ; [$a3eb] undefined
    .byte $01,$00,$00,$00,$02,$00,$00,$00   ; [$a3f3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a3fb] undefined
    .byte $bf,$00,$a9,$00,$a5,$00,$00,$00   ; [$a403] undefined
    .byte $ad,$00,$d2,$00,$80,$00,$00,$00   ; [$a40b] undefined
    .byte $ac,$00,$21,$00,$00,$00,$00,$80   ; [$a413] undefined
    .byte $aa,$00,$5b,$00,$00,$00,$00,$00   ; [$a41b] undefined
    .byte $bf,$00,$f7,$00,$00,$00,$00,$00   ; [$a423] undefined
    .byte $fb,$00,$23,$00,$80,$00,$00,$00   ; [$a42b] undefined
    .byte $b3,$00,$0a,$00,$01,$00,$00,$00   ; [$a433] undefined
    .byte $48,$00,$10,$00,$00,$00,$00,$00   ; [$a43b] undefined
    .byte $8f,$00,$29,$00,$00,$00,$00,$00   ; [$a443] undefined
    .byte $7f,$00,$f3,$00,$00,$00,$00,$00   ; [$a44b] undefined
    .byte $a9,$00,$96,$00,$00,$00,$00,$00   ; [$a453] undefined
    .byte $23,$00,$00,$00,$00,$00,$00,$00   ; [$a45b] undefined
    .byte $ff,$00,$cf,$00,$00,$00,$00,$00   ; [$a463] undefined
    .byte $63,$00,$73,$00,$00,$00,$00,$00   ; [$a46b] undefined
    .byte $5b,$00,$01,$00,$00,$00,$00,$00   ; [$a473] undefined
    .byte $09,$00,$01,$00,$10,$00,$00,$00   ; [$a47b] undefined
    .byte $df,$00,$29,$00,$02,$00,$00,$00   ; [$a483] undefined
    .byte $82,$00,$3d,$00,$00,$00,$00,$00   ; [$a48b] undefined
    .byte $43,$00,$01,$00,$00,$00,$00,$00   ; [$a493] undefined
    .byte $08,$00,$00,$00,$00,$00,$00,$00   ; [$a49b] undefined
    .byte $cd,$00,$c3,$00,$40,$00,$00,$00   ; [$a4a3] undefined
    .byte $c1,$00,$40,$00,$02,$00,$00,$00   ; [$a4ab] undefined
    .byte $08,$00,$00,$00,$00,$00,$00,$00   ; [$a4b3] undefined
    .byte $10,$00,$00,$00,$10,$00,$00,$00   ; [$a4bb] undefined
    .byte $7f,$00,$22,$00,$00,$00,$00,$00   ; [$a4c3] undefined
    .byte $69,$00,$f0,$00,$10,$00,$00,$00   ; [$a4cb] undefined
    .byte $04,$00,$00,$00,$80,$00,$00,$00   ; [$a4d3] undefined
    .byte $08,$00,$00,$00,$00,$00,$00,$00   ; [$a4db] undefined
    .byte $81,$00,$1f,$00,$82,$00,$00,$00   ; [$a4e3] undefined
    .byte $48,$00,$41,$00,$14,$00,$00,$00   ; [$a4eb] undefined
    .byte $21,$00,$01,$00,$01,$00,$00,$00   ; [$a4f3] undefined
    .byte $30,$00,$10,$00,$00,$00,$00,$00   ; [$a4fb] undefined
    .byte $f7,$00,$a8,$00,$00,$00,$00,$00   ; [$a503] undefined
    .byte $6b,$00,$55,$00,$00,$00,$00,$00   ; [$a50b] undefined
    .byte $b3,$00,$55,$00,$00,$00,$00,$00   ; [$a513] undefined
    .byte $f0,$10,$48,$00,$00,$00,$00,$00   ; [$a51b] undefined
    .byte $ff,$00,$ae,$00,$00,$00,$00,$00   ; [$a523] undefined
    .byte $db,$00,$0d,$00,$00,$00,$00,$00   ; [$a52b] undefined
    .byte $8f,$00,$95,$00,$80,$00,$00,$00   ; [$a533] undefined
    .byte $6d,$00,$01,$00,$00,$00,$00,$00   ; [$a53b] undefined
    .byte $ff,$00,$01,$00,$00,$00,$00,$00   ; [$a543] undefined
    .byte $de,$00,$00,$00,$80,$00,$00,$00   ; [$a54b] undefined
    .byte $5c,$00,$09,$00,$00,$00,$00,$00   ; [$a553] undefined
    .byte $15,$00,$01,$00,$00,$00,$00,$00   ; [$a55b] undefined
    .byte $fa,$00,$dd,$00,$00,$00,$00,$00   ; [$a563] undefined
    .byte $cf,$00,$d2,$00,$20,$00,$00,$00   ; [$a56b] undefined
    .byte $9d,$00,$01,$00,$80,$00,$00,$00   ; [$a573] undefined
    .byte $15,$00,$22,$00,$00,$00,$00,$00   ; [$a57b] undefined
    .byte $ff,$00,$29,$00,$01,$00,$00,$00   ; [$a583] undefined
    .byte $fa,$00,$97,$00,$0a,$00,$00,$00   ; [$a58b] undefined
    .byte $58,$00,$00,$00,$20,$00,$00,$00   ; [$a593] undefined
    .byte $0c,$00,$00,$00,$00,$00,$00,$00   ; [$a59b] undefined
    .byte $fd,$00,$28,$00,$04,$00,$00,$00   ; [$a5a3] undefined
    .byte $1a,$00,$00,$00,$a1,$00,$00,$00   ; [$a5ab] undefined
    .byte $49,$00,$98,$00,$00,$00,$00,$00   ; [$a5b3] undefined
    .byte $05,$00,$08,$00,$00,$00,$00,$00   ; [$a5bb] undefined
    .byte $be,$00,$18,$00,$00,$00,$00,$00   ; [$a5c3] undefined
    .byte $6c,$00,$29,$00,$09,$00,$00,$00   ; [$a5cb] undefined
    .byte $41,$00,$48,$00,$00,$00,$00,$00   ; [$a5d3] undefined
    .byte $2c,$00,$02,$00,$00,$00,$00,$00   ; [$a5db] undefined
    .byte $d1,$00,$01,$00,$0b,$00,$00,$00   ; [$a5e3] undefined
    .byte $7d,$00,$30,$00,$40,$00,$00,$00   ; [$a5eb] undefined
    .byte $84,$00,$00,$00,$00,$00,$00,$00   ; [$a5f3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a5fb] undefined
    .byte $ff,$00,$af,$00,$40,$00,$00,$00   ; [$a603] undefined
    .byte $d7,$00,$d9,$00,$00,$00,$00,$00   ; [$a60b] undefined
    .byte $ff,$00,$64,$00,$00,$00,$00,$00   ; [$a613] undefined
    .byte $0c,$00,$13,$00,$00,$00,$00,$00   ; [$a61b] undefined
    .byte $7b,$00,$b4,$00,$00,$00,$00,$00   ; [$a623] undefined
    .byte $25,$00,$07,$00,$00,$00,$00,$00   ; [$a62b] undefined
    .byte $4d,$00,$a1,$00,$00,$00,$00,$00   ; [$a633] undefined
    .byte $28,$00,$40,$00,$00,$00,$00,$00   ; [$a63b] undefined
    .byte $ff,$00,$29,$00,$01,$00,$00,$00   ; [$a643] undefined
    .byte $4d,$00,$09,$00,$00,$00,$00,$00   ; [$a64b] undefined
    .byte $ab,$00,$01,$00,$80,$00,$00,$00   ; [$a653] undefined
    .byte $09,$00,$84,$00,$00,$00,$00,$00   ; [$a65b] undefined
    .byte $7f,$00,$6a,$00,$00,$00,$00,$00   ; [$a663] undefined
    .byte $cf,$00,$00,$00,$20,$00,$00,$00   ; [$a66b] undefined
    .byte $05,$00,$10,$00,$80,$00,$00,$00   ; [$a673] undefined
    .byte $11,$00,$04,$00,$00,$00,$00,$00   ; [$a67b] undefined
    .byte $89,$00,$4f,$00,$00,$00,$00,$00   ; [$a683] undefined
    .byte $c1,$00,$90,$00,$20,$00,$00,$00   ; [$a68b] undefined
    .byte $42,$00,$08,$00,$80,$00,$00,$00   ; [$a693] undefined
    .byte $10,$00,$00,$00,$01,$00,$00,$00   ; [$a69b] undefined
    .byte $7f,$00,$0a,$00,$40,$00,$00,$00   ; [$a6a3] undefined
    .byte $1d,$00,$04,$00,$80,$00,$00,$00   ; [$a6ab] undefined
    .byte $13,$00,$04,$00,$00,$00,$00,$00   ; [$a6b3] undefined
    .byte $64,$00,$00,$00,$00,$00,$00,$00   ; [$a6bb] undefined
    .byte $ce,$00,$43,$00,$01,$00,$00,$00   ; [$a6c3] undefined
    .byte $3c,$00,$00,$00,$28,$00,$00,$00   ; [$a6cb] undefined
    .byte $40,$00,$40,$00,$00,$00,$00,$00   ; [$a6d3] undefined
    .byte $40,$00,$40,$00,$00,$00,$00,$00   ; [$a6db] undefined
    .byte $ea,$00,$00,$00,$04,$00,$00,$00   ; [$a6e3] undefined
    .byte $36,$00,$00,$00,$00,$00,$00,$00   ; [$a6eb] undefined
    .byte $00,$00,$00,$00,$02,$00,$00,$00   ; [$a6f3] undefined
    .byte $40,$80,$00,$00,$00,$00,$00,$00   ; [$a6fb] undefined
    .byte $9e,$00,$6f,$00,$80,$00,$00,$00   ; [$a703] undefined
    .byte $fb,$00,$1c,$00,$00,$00,$00,$00   ; [$a70b] undefined
    .byte $bf,$00,$c3,$00,$00,$00,$00,$00   ; [$a713] undefined
    .byte $6b,$00,$19,$00,$00,$00,$00,$00   ; [$a71b] undefined
    .byte $ba,$00,$5e,$00,$04,$00,$00,$00   ; [$a723] undefined
    .byte $4e,$00,$51,$00,$00,$00,$00,$00   ; [$a72b] undefined
    .byte $2e,$00,$38,$00,$00,$00,$00,$00   ; [$a733] undefined
    .byte $08,$00,$10,$00,$00,$00,$00,$00   ; [$a73b] undefined
    .byte $bf,$00,$af,$00,$08,$00,$00,$00   ; [$a743] undefined
    .byte $fe,$00,$03,$00,$00,$00,$00,$00   ; [$a74b] undefined
    .byte $c8,$00,$84,$00,$00,$00,$00,$00   ; [$a753] undefined
    .byte $4f,$80,$00,$00,$00,$00,$00,$00   ; [$a75b] undefined
    .byte $ff,$00,$8a,$00,$00,$00,$00,$00   ; [$a763] undefined
    .byte $bc,$00,$21,$00,$00,$00,$00,$00   ; [$a76b] undefined
    .byte $53,$00,$42,$00,$00,$00,$00,$00   ; [$a773] undefined
    .byte $05,$00,$00,$00,$00,$00,$00,$00   ; [$a77b] undefined
    .byte $df,$00,$0e,$00,$20,$00,$00,$00   ; [$a783] undefined
    .byte $8d,$00,$07,$00,$00,$00,$00,$00   ; [$a78b] undefined
    .byte $1a,$00,$0c,$00,$80,$00,$00,$00   ; [$a793] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a79b] undefined
    .byte $2d,$00,$26,$00,$10,$00,$00,$00   ; [$a7a3] undefined
    .byte $5e,$00,$b0,$00,$80,$00,$00,$00   ; [$a7ab] undefined
    .byte $26,$00,$00,$00,$00,$00,$00,$00   ; [$a7b3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a7bb] undefined
    .byte $ed,$00,$50,$00,$0c,$00,$00,$00   ; [$a7c3] undefined
    .byte $85,$00,$02,$00,$80,$00,$00,$00   ; [$a7cb] undefined
    .byte $1c,$00,$00,$00,$00,$00,$00,$00   ; [$a7d3] undefined
    .byte $40,$02,$04,$00,$00,$00,$00,$00   ; [$a7db] undefined
    .byte $ab,$00,$00,$00,$04,$00,$00,$00   ; [$a7e3] undefined
    .byte $3d,$00,$00,$00,$00,$00,$00,$00   ; [$a7eb] undefined
    .byte $14,$00,$10,$00,$00,$00,$00,$00   ; [$a7f3] undefined
    .byte $00,$00,$20,$00,$00,$00,$00,$00   ; [$a7fb] undefined
    .byte $5f,$00,$18,$00,$00,$00,$00,$00   ; [$a803] undefined
    .byte $1f,$00,$7c,$00,$00,$00,$00,$00   ; [$a80b] undefined
    .byte $3f,$00,$ae,$00,$00,$00,$00,$00   ; [$a813] undefined
    .byte $9c,$00,$00,$00,$10,$00,$00,$00   ; [$a81b] undefined
    .byte $fb,$00,$bc,$00,$00,$00,$00,$00   ; [$a823] undefined
    .byte $4b,$00,$0f,$00,$00,$00,$00,$00   ; [$a82b] undefined
    .byte $b7,$00,$34,$00,$00,$00,$00,$00   ; [$a833] undefined
    .byte $18,$00,$14,$00,$00,$00,$00,$00   ; [$a83b] undefined
    .byte $df,$00,$75,$00,$00,$00,$00,$00   ; [$a843] undefined
    .byte $b2,$00,$58,$00,$00,$00,$00,$00   ; [$a84b] undefined
    .byte $ba,$00,$07,$00,$02,$00,$00,$00   ; [$a853] undefined
    .byte $90,$00,$30,$00,$00,$00,$00,$00   ; [$a85b] undefined
    .byte $be,$00,$32,$00,$80,$00,$00,$00   ; [$a863] undefined
    .byte $df,$00,$a8,$00,$00,$00,$00,$00   ; [$a86b] undefined
    .byte $56,$00,$a1,$00,$00,$00,$00,$00   ; [$a873] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a87b] undefined
    .byte $fd,$00,$23,$00,$00,$00,$00,$00   ; [$a883] undefined
    .byte $e4,$00,$0c,$00,$00,$00,$00,$00   ; [$a88b] undefined
    .byte $24,$00,$05,$00,$08,$00,$00,$00   ; [$a893] undefined
    .byte $49,$00,$01,$00,$00,$00,$00,$00   ; [$a89b] undefined
    .byte $51,$00,$b8,$00,$04,$00,$00,$00   ; [$a8a3] undefined
    .byte $df,$00,$14,$00,$00,$00,$00,$00   ; [$a8ab] undefined
    .byte $0f,$00,$00,$00,$00,$00,$00,$00   ; [$a8b3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a8bb] undefined
    .byte $af,$00,$18,$00,$05,$00,$00,$00   ; [$a8c3] undefined
    .byte $90,$00,$04,$00,$03,$00,$00,$00   ; [$a8cb] undefined
    .byte $81,$00,$02,$00,$00,$00,$00,$00   ; [$a8d3] undefined
    .byte $54,$08,$04,$00,$00,$00,$00,$00   ; [$a8db] undefined
    .byte $b2,$00,$00,$00,$00,$00,$00,$00   ; [$a8e3] undefined
    .byte $a8,$00,$80,$00,$01,$00,$00,$00   ; [$a8eb] undefined
    .byte $11,$00,$00,$00,$02,$00,$00,$00   ; [$a8f3] undefined
    .byte $00,$c0,$00,$00,$00,$00,$00,$00   ; [$a8fb] undefined
    .byte $ff,$00,$cd,$00,$10,$00,$00,$00   ; [$a903] undefined
    .byte $fa,$00,$1d,$00,$00,$00,$00,$00   ; [$a90b] undefined
    .byte $3f,$00,$4c,$00,$00,$00,$00,$00   ; [$a913] undefined
    .byte $22,$00,$cc,$00,$00,$00,$00,$00   ; [$a91b] undefined
    .byte $5f,$00,$cf,$00,$40,$00,$00,$00   ; [$a923] undefined
    .byte $df,$00,$0a,$00,$00,$00,$00,$00   ; [$a92b] undefined
    .byte $9d,$00,$71,$00,$00,$00,$00,$00   ; [$a933] undefined
    .byte $86,$80,$00,$00,$00,$00,$00,$00   ; [$a93b] undefined
    .byte $bf,$00,$c4,$00,$00,$00,$00,$00   ; [$a943] undefined
    .byte $7b,$00,$ec,$00,$00,$00,$00,$00   ; [$a94b] undefined
    .byte $48,$00,$81,$00,$00,$00,$00,$00   ; [$a953] undefined
    .byte $8c,$00,$a4,$00,$00,$00,$00,$00   ; [$a95b] undefined
    .byte $ff,$00,$3e,$00,$00,$00,$00,$00   ; [$a963] undefined
    .byte $7f,$00,$b6,$00,$00,$00,$00,$00   ; [$a96b] undefined
    .byte $4b,$00,$0d,$00,$01,$00,$00,$00   ; [$a973] undefined
    .byte $0b,$40,$00,$00,$00,$00,$00,$00   ; [$a97b] undefined
    .byte $9b,$00,$0b,$00,$01,$00,$00,$00   ; [$a983] undefined
    .byte $8a,$00,$1b,$00,$24,$00,$00,$00   ; [$a98b] undefined
    .byte $95,$00,$a4,$00,$02,$00,$00,$00   ; [$a993] undefined
    .byte $84,$00,$00,$00,$00,$00,$00,$00   ; [$a99b] undefined
    .byte $7f,$00,$db,$00,$18,$00,$00,$00   ; [$a9a3] undefined
    .byte $cc,$00,$05,$00,$00,$00,$00,$00   ; [$a9ab] undefined
    .byte $05,$00,$08,$00,$60,$00,$00,$00   ; [$a9b3] undefined
    .byte $00,$00,$00,$00,$82,$00,$00,$00   ; [$a9bb] undefined
    .byte $a2,$00,$5a,$00,$20,$00,$00,$00   ; [$a9c3] undefined
    .byte $98,$00,$84,$00,$41,$00,$00,$00   ; [$a9cb] undefined
    .byte $04,$00,$40,$00,$20,$00,$00,$00   ; [$a9d3] undefined
    .byte $42,$00,$00,$00,$00,$00,$00,$00   ; [$a9db] undefined
    .byte $09,$00,$03,$00,$00,$00,$00,$00   ; [$a9e3] undefined
    .byte $01,$00,$00,$00,$00,$00,$00,$00   ; [$a9eb] undefined
    .byte $04,$00,$00,$00,$00,$00,$00,$00   ; [$a9f3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$a9fb] undefined
    .byte $ff,$00,$bc,$00,$10,$00,$00,$00   ; [$aa03] undefined
    .byte $7b,$00,$24,$00,$00,$00,$00,$00   ; [$aa0b] undefined
    .byte $5d,$00,$06,$00,$00,$00,$00,$00   ; [$aa13] undefined
    .byte $cc,$00,$00,$00,$00,$00,$00,$00   ; [$aa1b] undefined
    .byte $df,$00,$a8,$00,$04,$00,$00,$00   ; [$aa23] undefined
    .byte $5f,$00,$aa,$00,$10,$00,$00,$00   ; [$aa2b] undefined
    .byte $7c,$00,$d0,$00,$00,$00,$00,$00   ; [$aa33] undefined
    .byte $06,$00,$10,$00,$00,$00,$00,$00   ; [$aa3b] undefined
    .byte $ff,$00,$f3,$00,$00,$00,$00,$00   ; [$aa43] undefined
    .byte $11,$00,$4c,$00,$00,$00,$00,$00   ; [$aa4b] undefined
    .byte $76,$00,$80,$00,$00,$00,$00,$00   ; [$aa53] undefined
    .byte $15,$40,$00,$00,$00,$00,$00,$00   ; [$aa5b] undefined
    .byte $cd,$00,$4c,$00,$00,$00,$00,$00   ; [$aa63] undefined
    .byte $7c,$00,$09,$00,$00,$00,$00,$00   ; [$aa6b] undefined
    .byte $3f,$00,$c8,$00,$00,$00,$00,$00   ; [$aa73] undefined
    .byte $49,$00,$05,$00,$00,$00,$00,$00   ; [$aa7b] undefined
    .byte $6d,$00,$30,$00,$12,$00,$00,$00   ; [$aa83] undefined
    .byte $76,$00,$8c,$00,$00,$00,$00,$00   ; [$aa8b] undefined
    .byte $00,$00,$60,$00,$00,$00,$00,$00   ; [$aa93] undefined
    .byte $00,$10,$0a,$00,$00,$00,$00,$00   ; [$aa9b] undefined
    .byte $5f,$00,$d8,$00,$00,$00,$00,$00   ; [$aaa3] undefined
    .byte $2c,$00,$00,$00,$00,$00,$00,$00   ; [$aaab] undefined
    .byte $12,$00,$80,$00,$00,$00,$00,$00   ; [$aab3] undefined
    .byte $04,$00,$00,$00,$00,$00,$00,$00   ; [$aabb] undefined
    .byte $f9,$00,$18,$00,$00,$00,$00,$00   ; [$aac3] undefined
    .byte $1f,$00,$00,$00,$00,$00,$00,$00   ; [$aacb] undefined
    .byte $31,$00,$c0,$00,$08,$00,$00,$20   ; [$aad3] undefined
    .byte $04,$00,$00,$00,$00,$00,$00,$00   ; [$aadb] undefined
    .byte $b7,$00,$41,$00,$10,$00,$00,$00   ; [$aae3] undefined
    .byte $da,$00,$80,$00,$40,$00,$00,$00   ; [$aaeb] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$aaf3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$aafb] undefined
    .byte $df,$00,$39,$00,$20,$00,$00,$00   ; [$ab03] undefined
    .byte $ae,$00,$58,$00,$00,$00,$00,$00   ; [$ab0b] undefined
    .byte $f3,$00,$18,$00,$00,$00,$00,$00   ; [$ab13] undefined
    .byte $61,$00,$00,$00,$00,$00,$00,$00   ; [$ab1b] undefined
    .byte $ff,$00,$bd,$00,$00,$00,$00,$00   ; [$ab23] undefined
    .byte $ff,$00,$3b,$00,$00,$00,$00,$00   ; [$ab2b] undefined
    .byte $dc,$00,$f0,$00,$00,$00,$00,$00   ; [$ab33] undefined
    .byte $61,$00,$00,$00,$00,$00,$00,$00   ; [$ab3b] undefined
    .byte $df,$00,$29,$00,$00,$00,$00,$00   ; [$ab43] undefined
    .byte $3d,$00,$1d,$00,$00,$00,$00,$00   ; [$ab4b] undefined
    .byte $6c,$00,$5c,$00,$02,$00,$00,$00   ; [$ab53] undefined
    .byte $02,$00,$00,$00,$40,$00,$00,$00   ; [$ab5b] undefined
    .byte $fe,$00,$16,$00,$38,$00,$00,$00   ; [$ab63] undefined
    .byte $66,$00,$29,$00,$20,$00,$00,$00   ; [$ab6b] undefined
    .byte $fe,$00,$01,$00,$00,$00,$00,$00   ; [$ab73] undefined
    .byte $10,$00,$80,$00,$00,$00,$00,$00   ; [$ab7b] undefined
    .byte $af,$00,$10,$00,$50,$00,$00,$00   ; [$ab83] undefined
    .byte $43,$00,$0c,$00,$00,$00,$00,$00   ; [$ab8b] undefined
    .byte $02,$00,$40,$00,$00,$00,$00,$00   ; [$ab93] undefined
    .byte $00,$00,$80,$00,$00,$00,$00,$00   ; [$ab9b] undefined
    .byte $06,$00,$2a,$00,$00,$00,$00,$00   ; [$aba3] undefined
    .byte $de,$00,$4a,$00,$c2,$00,$00,$00   ; [$abab] undefined
    .byte $17,$00,$43,$00,$00,$00,$00,$00   ; [$abb3] undefined
    .byte $02,$00,$04,$00,$02,$00,$00,$00   ; [$abbb] undefined
    .byte $17,$00,$18,$00,$00,$00,$00,$00   ; [$abc3] undefined
    .byte $e7,$00,$d3,$00,$82,$00,$00,$00   ; [$abcb] undefined
    .byte $04,$00,$0c,$00,$00,$00,$00,$00   ; [$abd3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$abdb] undefined
    .byte $6b,$00,$04,$00,$00,$00,$00,$00   ; [$abe3] undefined
    .byte $04,$00,$10,$00,$00,$00,$00,$00   ; [$abeb] undefined
    .byte $a0,$00,$00,$00,$20,$00,$00,$00   ; [$abf3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$abfb] undefined
    .byte $ff,$00,$39,$00,$a0,$00,$00,$00   ; [$ac03] undefined
    .byte $6d,$00,$64,$00,$00,$00,$00,$00   ; [$ac0b] undefined
    .byte $4c,$00,$54,$00,$00,$00,$00,$00   ; [$ac13] undefined
    .byte $44,$00,$02,$00,$00,$00,$00,$00   ; [$ac1b] undefined
    .byte $bf,$00,$ae,$00,$00,$00,$00,$00   ; [$ac23] undefined
    .byte $f7,$00,$e6,$00,$40,$00,$00,$00   ; [$ac2b] undefined
    .byte $f1,$00,$39,$00,$40,$00,$00,$00   ; [$ac33] undefined
    .byte $08,$02,$21,$00,$00,$00,$00,$00   ; [$ac3b] undefined
    .byte $3f,$00,$5a,$00,$80,$00,$00,$00   ; [$ac43] undefined
    .byte $e5,$00,$80,$00,$00,$00,$00,$00   ; [$ac4b] undefined
    .byte $c1,$00,$01,$00,$80,$00,$00,$00   ; [$ac53] undefined
    .byte $1a,$00,$01,$00,$00,$00,$00,$00   ; [$ac5b] undefined
    .byte $9b,$00,$2c,$00,$08,$00,$00,$00   ; [$ac63] undefined
    .byte $bd,$00,$26,$00,$00,$00,$00,$00   ; [$ac6b] undefined
    .byte $49,$00,$01,$00,$00,$00,$00,$00   ; [$ac73] undefined
    .byte $08,$00,$04,$00,$00,$00,$00,$00   ; [$ac7b] undefined
    .byte $bf,$00,$68,$00,$02,$00,$00,$00   ; [$ac83] undefined
    .byte $4d,$00,$59,$00,$00,$00,$00,$00   ; [$ac8b] undefined
    .byte $05,$00,$10,$00,$00,$00,$00,$00   ; [$ac93] undefined
    .byte $09,$00,$00,$00,$00,$00,$00,$00   ; [$ac9b] undefined
    .byte $7f,$00,$0c,$00,$40,$00,$00,$00   ; [$aca3] undefined
    .byte $c8,$00,$10,$00,$00,$00,$00,$00   ; [$acab] undefined
    .byte $00,$00,$80,$00,$04,$00,$00,$00   ; [$acb3] undefined
    .byte $65,$00,$00,$00,$00,$00,$00,$00   ; [$acbb] undefined
    .byte $f7,$00,$24,$00,$01,$00,$00,$00   ; [$acc3] undefined
    .byte $00,$00,$02,$00,$20,$00,$00,$00   ; [$accb] undefined
    .byte $08,$00,$04,$00,$00,$00,$00,$00   ; [$acd3] undefined
    .byte $00,$00,$01,$00,$00,$00,$00,$00   ; [$acdb] undefined
    .byte $0b,$00,$80,$00,$57,$00,$00,$00   ; [$ace3] undefined
    .byte $04,$00,$02,$00,$80,$00,$00,$00   ; [$aceb] undefined
    .byte $2a,$00,$00,$00,$00,$00,$00,$00   ; [$acf3] undefined
    .byte $02,$00,$00,$00,$00,$00,$00,$00   ; [$acfb] undefined
    .byte $ff,$00,$4d,$00,$01,$00,$00,$00   ; [$ad03] undefined
    .byte $7d,$00,$44,$00,$00,$00,$00,$00   ; [$ad0b] undefined
    .byte $b4,$00,$00,$00,$00,$00,$00,$00   ; [$ad13] undefined
    .byte $50,$00,$83,$00,$00,$00,$00,$00   ; [$ad1b] undefined
    .byte $7b,$00,$72,$00,$00,$00,$00,$00   ; [$ad23] undefined
    .byte $92,$00,$05,$00,$00,$00,$00,$00   ; [$ad2b] undefined
    .byte $ad,$00,$d3,$00,$40,$00,$00,$00   ; [$ad33] undefined
    .byte $3c,$00,$05,$00,$10,$00,$00,$00   ; [$ad3b] undefined
    .byte $fe,$00,$59,$00,$00,$00,$00,$00   ; [$ad43] undefined
    .byte $5d,$00,$91,$00,$00,$00,$00,$00   ; [$ad4b] undefined
    .byte $7a,$00,$00,$00,$80,$00,$00,$00   ; [$ad53] undefined
    .byte $3f,$00,$10,$00,$00,$00,$00,$00   ; [$ad5b] undefined
    .byte $fe,$00,$f2,$00,$15,$00,$00,$00   ; [$ad63] undefined
    .byte $fe,$00,$dc,$00,$00,$00,$00,$00   ; [$ad6b] undefined
    .byte $c0,$00,$34,$00,$00,$00,$00,$00   ; [$ad73] undefined
    .byte $04,$00,$08,$00,$00,$00,$00,$00   ; [$ad7b] undefined
    .byte $39,$00,$4e,$00,$84,$00,$00,$00   ; [$ad83] undefined
    .byte $e3,$00,$10,$00,$00,$00,$00,$00   ; [$ad8b] undefined
    .byte $0c,$00,$43,$00,$00,$00,$00,$00   ; [$ad93] undefined
    .byte $08,$00,$00,$00,$00,$00,$00,$00   ; [$ad9b] undefined
    .byte $a7,$00,$c9,$00,$00,$00,$00,$00   ; [$ada3] undefined
    .byte $44,$00,$1b,$00,$01,$00,$00,$00   ; [$adab] undefined
    .byte $aa,$00,$00,$00,$80,$00,$00,$00   ; [$adb3] undefined
    .byte $01,$00,$00,$00,$00,$00,$00,$00   ; [$adbb] undefined
    .byte $fb,$00,$d9,$00,$20,$00,$00,$00   ; [$adc3] undefined
    .byte $21,$00,$67,$00,$00,$00,$00,$00   ; [$adcb] undefined
    .byte $88,$00,$01,$00,$80,$00,$00,$00   ; [$add3] undefined
    .byte $21,$00,$00,$00,$00,$00,$00,$00   ; [$addb] undefined
    .byte $51,$00,$24,$00,$0c,$00,$00,$00   ; [$ade3] undefined
    .byte $08,$00,$01,$00,$80,$00,$00,$00   ; [$adeb] undefined
    .byte $04,$00,$00,$00,$00,$00,$00,$00   ; [$adf3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$adfb] undefined
    .byte $b7,$00,$cf,$00,$82,$00,$00,$00   ; [$ae03] undefined
    .byte $df,$00,$26,$00,$02,$00,$00,$00   ; [$ae0b] undefined
    .byte $34,$00,$05,$00,$00,$00,$00,$00   ; [$ae13] undefined
    .byte $8c,$00,$20,$00,$00,$00,$00,$00   ; [$ae1b] undefined
    .byte $ff,$00,$d7,$00,$00,$00,$00,$00   ; [$ae23] undefined
    .byte $7d,$00,$c3,$00,$00,$00,$00,$00   ; [$ae2b] undefined
    .byte $89,$00,$00,$00,$00,$00,$00,$00   ; [$ae33] undefined
    .byte $19,$00,$05,$00,$00,$00,$00,$00   ; [$ae3b] undefined
    .byte $ff,$00,$4a,$00,$00,$00,$00,$00   ; [$ae43] undefined
    .byte $7e,$00,$41,$00,$00,$00,$00,$00   ; [$ae4b] undefined
    .byte $67,$00,$0a,$00,$00,$00,$00,$00   ; [$ae53] undefined
    .byte $8a,$00,$00,$00,$00,$00,$00,$00   ; [$ae5b] undefined
    .byte $ff,$00,$b3,$00,$80,$00,$00,$00   ; [$ae63] undefined
    .byte $7d,$00,$6c,$00,$00,$00,$00,$00   ; [$ae6b] undefined
    .byte $08,$00,$20,$00,$02,$00,$00,$00   ; [$ae73] undefined
    .byte $0a,$00,$04,$00,$80,$00,$00,$00   ; [$ae7b] undefined
    .byte $fe,$00,$2f,$00,$41,$00,$00,$00   ; [$ae83] undefined
    .byte $c9,$00,$08,$00,$00,$00,$00,$00   ; [$ae8b] undefined
    .byte $4a,$00,$c4,$00,$00,$00,$00,$00   ; [$ae93] undefined
    .byte $82,$00,$00,$00,$00,$00,$00,$00   ; [$ae9b] undefined
    .byte $ff,$00,$30,$00,$40,$00,$00,$00   ; [$aea3] undefined
    .byte $cf,$00,$42,$00,$80,$00,$00,$00   ; [$aeab] undefined
    .byte $19,$00,$00,$00,$10,$00,$00,$00   ; [$aeb3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$aebb] undefined
    .byte $a5,$00,$a3,$00,$00,$00,$00,$00   ; [$aec3] undefined
    .byte $47,$00,$28,$00,$00,$00,$00,$00   ; [$aecb] undefined
    .byte $53,$00,$01,$00,$00,$00,$00,$00   ; [$aed3] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$aedb] undefined
    .byte $72,$00,$8d,$00,$00,$00,$00,$00   ; [$aee3] undefined
    .byte $04,$00,$42,$00,$00,$00,$00,$00   ; [$aeeb] undefined
    .byte $20,$00,$00,$00,$00,$00,$00,$00   ; [$aef3] undefined
    .byte $00,$00,$00,$00,$01,$00,$00,$00   ; [$aefb] undefined
    .byte $ff,$00,$9c,$00,$00,$00,$00,$00   ; [$af03] undefined
    .byte $77,$00,$8b,$00,$00,$00,$00,$00   ; [$af0b] undefined
    .byte $8d,$00,$10,$00,$00,$00,$00,$00   ; [$af13] undefined
    .byte $11,$08,$14,$00,$00,$00,$00,$00   ; [$af1b] undefined
    .byte $ff,$00,$d8,$00,$00,$00,$00,$00   ; [$af23] undefined
    .byte $5f,$00,$c1,$00,$02,$00,$00,$00   ; [$af2b] undefined
    .byte $52,$08,$00,$00,$00,$00,$00,$00   ; [$af33] undefined
    .byte $06,$00,$04,$00,$00,$00,$00,$00   ; [$af3b] undefined
    .byte $ff,$00,$85,$00,$01,$00,$00,$00   ; [$af43] undefined
    .byte $67,$00,$6a,$00,$00,$00,$00,$00   ; [$af4b] undefined
    .byte $63,$00,$14,$00,$00,$00,$00,$00   ; [$af53] undefined
    .byte $86,$00,$41,$00,$00,$00,$00,$00   ; [$af5b] undefined
    .byte $6f,$00,$73,$00,$00,$00,$00,$00   ; [$af63] undefined
    .byte $1c,$00,$96,$00,$20,$00,$00,$00   ; [$af6b] undefined
    .byte $38,$00,$a2,$00,$00,$00,$00,$00   ; [$af73] undefined
    .byte $00,$00,$02,$00,$00,$00,$00,$00   ; [$af7b] undefined
    .byte $6f,$00,$3a,$00,$a0,$00,$00,$00   ; [$af83] undefined
    .byte $ac,$00,$00,$00,$04,$00,$00,$00   ; [$af8b] undefined
    .byte $1d,$20,$00,$00,$80,$00,$00,$00   ; [$af93] undefined
    .byte $00,$04,$00,$00,$00,$00,$00,$00   ; [$af9b] undefined
    .byte $f5,$00,$3a,$00,$00,$00,$00,$00   ; [$afa3] undefined
    .byte $3b,$00,$00,$00,$80,$00,$00,$00   ; [$afab] undefined
    .byte $78,$00,$20,$00,$80,$00,$00,$40   ; [$afb3] undefined
    .byte $02,$00,$00,$00,$00,$00,$00,$00   ; [$afbb] undefined
    .byte $7a,$00,$06,$00,$41,$00,$00,$00   ; [$afc3] undefined
    .byte $23,$00,$01,$00,$00,$00,$00,$00   ; [$afcb] undefined
    .byte $b0,$00,$82,$00,$80,$00,$00,$00   ; [$afd3] undefined
    .byte $44,$82,$00,$00,$00,$00,$00,$00   ; [$afdb] undefined
    .byte $f1,$00,$20,$00,$00,$00,$00,$00   ; [$afe3] undefined
    .byte $cd,$00,$02,$00,$80,$00,$00,$00   ; [$afeb] undefined
    .byte $e6,$02,$80,$00,$80,$00,$00,$00   ; [$aff3] undefined
    .byte $00,$00,$00,$00,$00,$00,$ff,$11   ; [$affb] undefined
    .byte $ff,$ff,$ff,$ba,$ff,$00,$ff,$be   ; [$b003] undefined
    .byte $ff,$fd,$ff,$fb,$ff,$00,$ff,$76   ; [$b00b] undefined
    .byte $ff,$bf,$ff,$fe,$ff,$00,$ff,$ff   ; [$b013] undefined
    .byte $ff,$ff,$ff,$ff,$bf,$00,$ff,$ad   ; [$b01b] undefined
    .byte $ff,$9b,$ff,$8f,$9f,$00,$ff,$31   ; [$b023] undefined
    .byte $ff,$fa,$ff,$f5,$ff,$00,$ff,$d7   ; [$b02b] undefined
    .byte $ff,$ff,$ff,$ef,$ee,$00,$ff,$7b   ; [$b033] undefined
    .byte $ff,$ff,$ff,$ff,$3d,$00,$ff,$76   ; [$b03b] undefined
    .byte $ff,$f5,$ff,$bb,$ff,$00,$ff,$be   ; [$b043] undefined
    .byte $ff,$fe,$ff,$8f,$ff,$00,$ff,$fe   ; [$b04b] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$f7   ; [$b053] undefined
    .byte $ff,$ef,$ff,$ff,$ae,$00,$ff,$28   ; [$b05b] undefined
    .byte $ff,$e5,$ff,$bb,$ff,$00,$ff,$d0   ; [$b063] undefined
    .byte $ff,$f9,$ff,$eb,$df,$00,$ff,$dd   ; [$b06b] undefined
    .byte $ff,$fd,$ff,$3f,$db,$00,$ff,$bf   ; [$b073] undefined
    .byte $ff,$ff,$ff,$bf,$df,$00,$ff,$f8   ; [$b07b] undefined
    .byte $ff,$e4,$ff,$ee,$ff,$00,$ff,$b5   ; [$b083] undefined
    .byte $ff,$bb,$ff,$f6,$bf,$00,$ff,$fe   ; [$b08b] undefined
    .byte $ff,$df,$ff,$df,$97,$00,$ff,$fb   ; [$b093] undefined
    .byte $ff,$ff,$ff,$ff,$45,$00,$ff,$64   ; [$b09b] undefined
    .byte $ff,$c3,$ff,$7f,$ff,$00,$ff,$1a   ; [$b0a3] undefined
    .byte $ff,$e6,$ff,$f7,$67,$00,$ff,$e6   ; [$b0ab] undefined
    .byte $ff,$fd,$ff,$be,$7a,$00,$ff,$fd   ; [$b0b3] undefined
    .byte $ff,$ff,$ff,$ff,$84,$00,$ff,$cc   ; [$b0bb] undefined
    .byte $ff,$c7,$ff,$c7,$fe,$00,$ff,$60   ; [$b0c3] undefined
    .byte $ff,$fd,$ff,$fb,$bb,$00,$ff,$bf   ; [$b0cb] undefined
    .byte $ff,$7f,$ff,$ff,$3f,$00,$ff,$ff   ; [$b0d3] undefined
    .byte $ff,$ff,$ff,$ff,$3f,$00,$ff,$08   ; [$b0db] undefined
    .byte $ff,$78,$ff,$c8,$7f,$00,$ff,$6b   ; [$b0e3] undefined
    .byte $ff,$ef,$ff,$fd,$ed,$00,$ff,$32   ; [$b0eb] undefined
    .byte $ff,$7f,$ff,$fb,$da,$00,$ff,$fe   ; [$b0f3] undefined
    .byte $ff,$ff,$ff,$ff,$f7,$00,$ff,$31   ; [$b0fb] undefined
    .byte $ff,$75,$ff,$7f,$ff,$00,$ff,$a2   ; [$b103] undefined
    .byte $ff,$cd,$ff,$ff,$df,$00,$ff,$b6   ; [$b10b] undefined
    .byte $ff,$5f,$ff,$ff,$df,$00,$ff,$ef   ; [$b113] undefined
    .byte $ff,$ff,$ff,$7f,$ff,$00,$ff,$64   ; [$b11b] undefined
    .byte $ff,$db,$ff,$6f,$ff,$00,$ff,$e7   ; [$b123] undefined
    .byte $ff,$df,$ff,$ff,$ff,$00,$ff,$8a   ; [$b12b] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$ee   ; [$b133] undefined
    .byte $ff,$ff,$ff,$ff,$7f,$00,$ff,$70   ; [$b13b] undefined
    .byte $ff,$fd,$ff,$ff,$ff,$00,$ff,$e4   ; [$b143] undefined
    .byte $ff,$fe,$ff,$fd,$ff,$00,$ff,$f8   ; [$b14b] undefined
    .byte $ff,$7f,$ff,$ff,$ff,$00,$ff,$ff   ; [$b153] undefined
    .byte $ff,$ff,$ff,$ff,$f5,$00,$ff,$aa   ; [$b15b] undefined
    .byte $ff,$3a,$ff,$d7,$ff,$00,$ff,$18   ; [$b163] undefined
    .byte $ff,$ff,$7f,$df,$ef,$00,$ff,$5b   ; [$b16b] undefined
    .byte $ff,$fd,$ff,$ff,$7c,$00,$ff,$ff   ; [$b173] undefined
    .byte $ff,$ff,$ff,$ef,$9b,$00,$ff,$18   ; [$b17b] undefined
    .byte $ff,$df,$ff,$ab,$ff,$00,$ff,$d4   ; [$b183] undefined
    .byte $ff,$ff,$ff,$fe,$bf,$00,$ff,$70   ; [$b18b] undefined
    .byte $ff,$ff,$ff,$ff,$4f,$00,$ff,$fb   ; [$b193] undefined
    .byte $ff,$ff,$bf,$ff,$f5,$00,$ff,$80   ; [$b19b] undefined
    .byte $ff,$ec,$ff,$0c,$df,$00,$ff,$c0   ; [$b1a3] undefined
    .byte $ff,$7e,$ff,$72,$ff,$00,$ff,$fe   ; [$b1ab] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$ff   ; [$b1b3] undefined
    .byte $ff,$ff,$ff,$ff,$7b,$00,$ff,$1a   ; [$b1bb] undefined
    .byte $ff,$89,$ff,$ac,$ff,$00,$ff,$ea   ; [$b1c3] undefined
    .byte $ff,$df,$ff,$fb,$df,$00,$ff,$7e   ; [$b1cb] undefined
    .byte $ff,$fb,$ff,$f5,$f7,$00,$ff,$f3   ; [$b1d3] undefined
    .byte $ff,$ff,$ff,$fe,$69,$00,$ff,$40   ; [$b1db] undefined
    .byte $ff,$de,$ff,$ce,$ff,$00,$ff,$67   ; [$b1e3] undefined
    .byte $ff,$be,$7f,$eb,$fb,$00,$ff,$e7   ; [$b1eb] undefined
    .byte $ff,$f7,$fe,$fe,$de,$00,$ff,$ee   ; [$b1f3] undefined
    .byte $ff,$ff,$f3,$ff,$02,$00,$ff,$66   ; [$b1fb] undefined
    .byte $ff,$eb,$ff,$de,$ff,$00,$ff,$cb   ; [$b203] undefined
    .byte $ff,$eb,$ff,$ef,$7f,$00,$ff,$af   ; [$b20b] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$f6   ; [$b213] undefined
    .byte $ff,$ff,$ff,$fd,$7f,$00,$ff,$b4   ; [$b21b] undefined
    .byte $ff,$ae,$ff,$8d,$ff,$00,$ff,$cd   ; [$b223] undefined
    .byte $ff,$ff,$ff,$fc,$f7,$00,$ff,$7c   ; [$b22b] undefined
    .byte $ff,$fe,$ef,$ff,$5b,$00,$ff,$ff   ; [$b233] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$80   ; [$b23b] undefined
    .byte $ff,$dd,$ff,$5e,$ff,$00,$ff,$ea   ; [$b243] undefined
    .byte $ff,$2f,$ff,$ff,$ff,$00,$ff,$dc   ; [$b24b] undefined
    .byte $ff,$ff,$ff,$fe,$3f,$00,$ff,$ff   ; [$b253] undefined
    .byte $ff,$ff,$ff,$fe,$e7,$00,$ff,$64   ; [$b25b] undefined
    .byte $ff,$af,$ff,$f1,$ff,$00,$ff,$4e   ; [$b263] undefined
    .byte $ff,$fe,$ff,$ee,$ff,$00,$ff,$bb   ; [$b26b] undefined
    .byte $ff,$b7,$ff,$ff,$fe,$00,$ff,$ff   ; [$b273] undefined
    .byte $ff,$fc,$ff,$ff,$7e,$00,$ff,$08   ; [$b27b] undefined
    .byte $ff,$a9,$ff,$ed,$df,$00,$ff,$6a   ; [$b283] undefined
    .byte $ff,$fe,$ff,$fa,$fd,$00,$ff,$d4   ; [$b28b] undefined
    .byte $ff,$ff,$ff,$ff,$ef,$00,$ff,$f6   ; [$b293] undefined
    .byte $ff,$ff,$ff,$ff,$e1,$00,$ff,$80   ; [$b29b] undefined
    .byte $ff,$d4,$ff,$dd,$ff,$00,$ff,$ef   ; [$b2a3] undefined
    .byte $ff,$fc,$ff,$fb,$ef,$00,$ff,$e2   ; [$b2ab] undefined
    .byte $ff,$ef,$ff,$ff,$7c,$00,$ff,$ff   ; [$b2b3] undefined
    .byte $ff,$fe,$7f,$fd,$c7,$00,$ff,$78   ; [$b2bb] undefined
    .byte $ff,$5e,$ff,$f6,$e7,$00,$ff,$e8   ; [$b2c3] undefined
    .byte $ff,$fd,$ff,$ef,$ff,$00,$ff,$ea   ; [$b2cb] undefined
    .byte $ff,$ff,$ff,$b6,$7f,$00,$ff,$ff   ; [$b2d3] undefined
    .byte $bf,$fe,$ff,$ff,$04,$00,$ff,$80   ; [$b2db] undefined
    .byte $ff,$f9,$ff,$fd,$fe,$00,$ff,$7a   ; [$b2e3] undefined
    .byte $ff,$ff,$ff,$bb,$ff,$00,$ff,$fd   ; [$b2eb] undefined
    .byte $ff,$ff,$ff,$ff,$de,$00,$ff,$9b   ; [$b2f3] undefined
    .byte $ff,$ff,$bf,$ff,$1b,$00,$ff,$31   ; [$b2fb] undefined
    .byte $ff,$f0,$ff,$f6,$ff,$00,$ff,$91   ; [$b303] undefined
    .byte $ff,$ff,$ff,$ff,$f7,$00,$ff,$af   ; [$b30b] undefined
    .byte $ff,$bf,$ff,$7f,$fe,$00,$ff,$ff   ; [$b313] undefined
    .byte $ff,$ff,$ff,$ff,$d6,$00,$ff,$02   ; [$b31b] undefined
    .byte $ff,$aa,$ff,$f7,$ff,$00,$ff,$b2   ; [$b323] undefined
    .byte $ff,$bf,$ff,$7f,$ff,$00,$ff,$db   ; [$b32b] undefined
    .byte $ff,$ff,$ff,$ff,$ef,$00,$ff,$ff   ; [$b333] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$c0   ; [$b33b] undefined
    .byte $ff,$54,$ff,$dd,$fb,$00,$ff,$6e   ; [$b343] undefined
    .byte $ff,$bd,$ff,$ee,$ff,$00,$ff,$bf   ; [$b34b] undefined
    .byte $ff,$7e,$ff,$ff,$eb,$00,$ff,$eb   ; [$b353] undefined
    .byte $ff,$ff,$ff,$f7,$ed,$00,$ff,$28   ; [$b35b] undefined
    .byte $ff,$be,$ff,$cd,$ff,$00,$ff,$1b   ; [$b363] undefined
    .byte $ff,$ff,$ff,$eb,$7f,$00,$ff,$fd   ; [$b36b] undefined
    .byte $ff,$ff,$ff,$fd,$37,$00,$ff,$ff   ; [$b373] undefined
    .byte $ff,$ff,$ff,$ff,$fd,$00,$ff,$24   ; [$b37b] undefined
    .byte $ff,$bb,$ff,$bf,$ff,$00,$ff,$ec   ; [$b383] undefined
    .byte $ff,$ff,$ff,$fd,$cf,$00,$ff,$8f   ; [$b38b] undefined
    .byte $ff,$ff,$ff,$ed,$be,$00,$ff,$df   ; [$b393] undefined
    .byte $ff,$ff,$ff,$ff,$f1,$00,$ff,$a0   ; [$b39b] undefined
    .byte $ff,$24,$ff,$c4,$ff,$00,$ff,$29   ; [$b3a3] undefined
    .byte $ff,$ff,$ff,$fd,$df,$00,$ff,$da   ; [$b3ab] undefined
    .byte $ff,$fb,$ff,$ff,$7f,$00,$ff,$df   ; [$b3b3] undefined
    .byte $ef,$ff,$ff,$ff,$71,$00,$ff,$92   ; [$b3bb] undefined
    .byte $ff,$dd,$ff,$d7,$eb,$00,$ff,$b9   ; [$b3c3] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$ab   ; [$b3cb] undefined
    .byte $ff,$ff,$ff,$ff,$f7,$00,$ff,$fb   ; [$b3d3] undefined
    .byte $ff,$ff,$ff,$ff,$3e,$00,$ff,$e0   ; [$b3db] undefined
    .byte $ff,$52,$ff,$3e,$ff,$00,$ff,$da   ; [$b3e3] undefined
    .byte $ff,$fb,$bf,$ff,$bb,$00,$ff,$df   ; [$b3eb] undefined
    .byte $ff,$ff,$ff,$7e,$e9,$00,$ff,$f9   ; [$b3f3] undefined
    .byte $ff,$ff,$ff,$df,$5f,$00,$ff,$e4   ; [$b3fb] undefined
    .byte $ff,$f8,$ff,$7b,$df,$00,$ff,$eb   ; [$b403] undefined
    .byte $ff,$fe,$ff,$ff,$f7,$00,$ff,$fe   ; [$b40b] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$fe   ; [$b413] undefined
    .byte $ff,$df,$ff,$ff,$df,$00,$ff,$ac   ; [$b41b] undefined
    .byte $ff,$b3,$ff,$9e,$ff,$00,$ff,$5a   ; [$b423] undefined
    .byte $ff,$9f,$ff,$ff,$ff,$00,$ff,$ce   ; [$b42b] undefined
    .byte $ff,$fd,$ff,$fd,$bf,$00,$ff,$ff   ; [$b433] undefined
    .byte $ff,$ff,$ff,$ff,$bf,$00,$ff,$24   ; [$b43b] undefined
    .byte $ff,$bd,$ff,$dd,$ff,$00,$ff,$8a   ; [$b443] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$fd   ; [$b44b] undefined
    .byte $ff,$ff,$ff,$fe,$cc,$00,$ff,$bd   ; [$b453] undefined
    .byte $ff,$ff,$f7,$ff,$5b,$00,$ff,$0a   ; [$b45b] undefined
    .byte $ff,$6d,$ff,$5a,$9f,$00,$ff,$9e   ; [$b463] undefined
    .byte $ff,$53,$ff,$fa,$4f,$00,$ff,$c4   ; [$b46b] undefined
    .byte $ff,$ff,$ff,$fb,$4f,$00,$ff,$ff   ; [$b473] undefined
    .byte $ff,$ff,$ff,$ff,$b1,$00,$ff,$8f   ; [$b47b] undefined
    .byte $ff,$7d,$ff,$64,$ff,$00,$ff,$62   ; [$b483] undefined
    .byte $ff,$7f,$ff,$e3,$7f,$00,$ff,$f3   ; [$b48b] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$ff   ; [$b493] undefined
    .byte $ff,$ff,$ff,$ff,$09,$00,$ff,$16   ; [$b49b] undefined
    .byte $ff,$4d,$ff,$29,$ff,$00,$ff,$6e   ; [$b4a3] undefined
    .byte $ff,$fb,$ff,$bb,$bf,$00,$ff,$df   ; [$b4ab] undefined
    .byte $ff,$ff,$ff,$ef,$6e,$00,$ff,$ff   ; [$b4b3] undefined
    .byte $ff,$ff,$ff,$ff,$81,$00,$ff,$04   ; [$b4bb] undefined
    .byte $ff,$0b,$ff,$e3,$ff,$00,$ff,$b0   ; [$b4c3] undefined
    .byte $ff,$e6,$ff,$fe,$ff,$00,$ff,$ec   ; [$b4cb] undefined
    .byte $ff,$af,$ff,$ef,$ff,$00,$ff,$ff   ; [$b4d3] undefined
    .byte $ff,$ff,$ff,$ff,$38,$00,$ff,$a5   ; [$b4db] undefined
    .byte $ff,$f3,$ff,$7f,$bf,$00,$ff,$3f   ; [$b4e3] undefined
    .byte $ff,$b7,$fb,$ef,$6f,$00,$ff,$de   ; [$b4eb] undefined
    .byte $ff,$ff,$ff,$ff,$67,$00,$ff,$ff   ; [$b4f3] undefined
    .byte $ff,$fb,$f7,$ff,$a2,$00,$ff,$f8   ; [$b4fb] undefined
    .byte $ff,$e7,$ff,$ca,$bf,$00,$ff,$a0   ; [$b503] undefined
    .byte $ff,$ff,$ff,$fc,$ff,$00,$ff,$df   ; [$b50b] undefined
    .byte $ff,$fb,$ff,$ff,$f7,$00,$ff,$ff   ; [$b513] undefined
    .byte $ff,$ff,$ff,$ff,$af,$00,$ff,$06   ; [$b51b] undefined
    .byte $ff,$b5,$ff,$a7,$ff,$00,$ff,$56   ; [$b523] undefined
    .byte $ff,$f5,$ff,$f7,$6f,$00,$ff,$5f   ; [$b52b] undefined
    .byte $ff,$ff,$ff,$f5,$ff,$00,$ff,$bf   ; [$b533] undefined
    .byte $ff,$ff,$ff,$ff,$f7,$00,$ff,$a0   ; [$b53b] undefined
    .byte $ff,$7e,$ff,$be,$ff,$00,$ff,$ea   ; [$b543] undefined
    .byte $ff,$f7,$ff,$69,$5e,$00,$ff,$db   ; [$b54b] undefined
    .byte $ff,$ff,$ff,$ff,$7f,$00,$ff,$57   ; [$b553] undefined
    .byte $ff,$ff,$ff,$ff,$2f,$00,$ff,$00   ; [$b55b] undefined
    .byte $ff,$db,$ff,$a8,$fe,$00,$ff,$be   ; [$b563] undefined
    .byte $ff,$7f,$ff,$bf,$fe,$00,$ff,$e5   ; [$b56b] undefined
    .byte $ff,$ef,$ff,$df,$7e,$00,$ff,$ff   ; [$b573] undefined
    .byte $ff,$f7,$ff,$ff,$f3,$00,$ff,$02   ; [$b57b] undefined
    .byte $ff,$f3,$ff,$60,$7f,$00,$ff,$97   ; [$b583] undefined
    .byte $ff,$fd,$ff,$ff,$dc,$00,$ff,$ff   ; [$b58b] undefined
    .byte $ff,$d7,$ff,$bd,$ff,$00,$ff,$e7   ; [$b593] undefined
    .byte $ff,$ff,$ff,$fb,$9c,$00,$ff,$82   ; [$b59b] undefined
    .byte $ff,$e7,$ff,$d7,$ff,$00,$ff,$7d   ; [$b5a3] undefined
    .byte $ff,$e7,$ff,$f7,$ff,$00,$ff,$0a   ; [$b5ab] undefined
    .byte $ff,$ff,$ff,$de,$97,$00,$ff,$bf   ; [$b5b3] undefined
    .byte $ff,$e7,$ff,$ff,$98,$00,$ff,$07   ; [$b5bb] undefined
    .byte $ff,$60,$ff,$da,$ff,$00,$ff,$88   ; [$b5c3] undefined
    .byte $ff,$fe,$ff,$fd,$ff,$00,$ff,$e7   ; [$b5cb] undefined
    .byte $ff,$fa,$ff,$ff,$ef,$00,$ff,$ff   ; [$b5d3] undefined
    .byte $ff,$ff,$ff,$ff,$6f,$00,$ff,$21   ; [$b5db] undefined
    .byte $ff,$fd,$ff,$fe,$fb,$00,$ff,$90   ; [$b5e3] undefined
    .byte $ff,$fb,$ff,$76,$fe,$00,$ff,$e1   ; [$b5eb] undefined
    .byte $ff,$7f,$ff,$fd,$3f,$00,$ff,$ff   ; [$b5f3] undefined
    .byte $ff,$ff,$ff,$f7,$4e,$00,$ff,$24   ; [$b5fb] undefined
    .byte $ff,$1f,$ff,$6d,$ef,$00,$ff,$af   ; [$b603] undefined
    .byte $ff,$7d,$ff,$e9,$ff,$00,$ff,$36   ; [$b60b] undefined
    .byte $ff,$7f,$ff,$ff,$b7,$00,$ff,$ff   ; [$b613] undefined
    .byte $ff,$ff,$ff,$f7,$ff,$00,$ff,$c3   ; [$b61b] undefined
    .byte $ff,$ff,$ff,$ef,$ff,$00,$ff,$98   ; [$b623] undefined
    .byte $ff,$7f,$ff,$ff,$fe,$00,$ff,$aa   ; [$b62b] undefined
    .byte $ff,$fe,$ff,$fd,$ff,$00,$ff,$fe   ; [$b633] undefined
    .byte $ff,$bf,$ff,$ff,$fb,$00,$ff,$84   ; [$b63b] undefined
    .byte $ff,$bf,$ff,$b7,$ff,$00,$ff,$f7   ; [$b643] undefined
    .byte $ff,$ff,$ff,$7b,$ff,$00,$ff,$bf   ; [$b64b] undefined
    .byte $ff,$ff,$ff,$ff,$7b,$00,$fd,$fb   ; [$b653] undefined
    .byte $ff,$ff,$ff,$ff,$55,$00,$ff,$68   ; [$b65b] undefined
    .byte $ff,$e5,$ff,$d8,$ff,$00,$ff,$03   ; [$b663] undefined
    .byte $ff,$ff,$ff,$7e,$ff,$00,$ff,$bb   ; [$b66b] undefined
    .byte $ff,$fb,$ff,$fd,$7b,$00,$ff,$fe   ; [$b673] undefined
    .byte $ff,$ff,$ff,$ff,$ef,$00,$ff,$80   ; [$b67b] undefined
    .byte $ff,$e9,$ff,$bb,$f7,$00,$ff,$32   ; [$b683] undefined
    .byte $ff,$ed,$ff,$4d,$fb,$00,$ff,$a5   ; [$b68b] undefined
    .byte $ff,$df,$ff,$df,$3f,$00,$ff,$ff   ; [$b693] undefined
    .byte $ff,$ff,$7f,$ff,$e4,$00,$ff,$00   ; [$b69b] undefined
    .byte $ff,$cd,$ff,$bb,$ff,$00,$ff,$c2   ; [$b6a3] undefined
    .byte $ff,$dd,$ff,$f7,$7f,$00,$ff,$46   ; [$b6ab] undefined
    .byte $ff,$fd,$ff,$bf,$7f,$00,$ff,$fe   ; [$b6b3] undefined
    .byte $ff,$fb,$ff,$ff,$5b,$00,$ff,$a0   ; [$b6bb] undefined
    .byte $ff,$dc,$ff,$f4,$ff,$00,$ff,$f9   ; [$b6c3] undefined
    .byte $ff,$c5,$ff,$fb,$bf,$00,$ff,$ff   ; [$b6cb] undefined
    .byte $ff,$fb,$ff,$f3,$fe,$00,$ff,$ff   ; [$b6d3] undefined
    .byte $7f,$ff,$ff,$ff,$60,$00,$ff,$35   ; [$b6db] undefined
    .byte $ff,$81,$ff,$f3,$ff,$00,$ff,$c1   ; [$b6e3] undefined
    .byte $ff,$ff,$ff,$7b,$3f,$00,$ff,$fd   ; [$b6eb] undefined
    .byte $ff,$ff,$ff,$ff,$5e,$00,$ff,$fb   ; [$b6f3] undefined
    .byte $ff,$ff,$ff,$ff,$0d,$00,$ff,$85   ; [$b6fb] undefined
    .byte $ff,$f8,$ff,$b2,$ff,$00,$ff,$f5   ; [$b703] undefined
    .byte $ff,$ff,$ff,$f7,$ff,$00,$ff,$e9   ; [$b70b] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$ed   ; [$b713] undefined
    .byte $ff,$ff,$ff,$ff,$db,$00,$ff,$e8   ; [$b71b] undefined
    .byte $ff,$fe,$ff,$f5,$ff,$00,$ff,$a6   ; [$b723] undefined
    .byte $ff,$ff,$ff,$df,$ff,$00,$ff,$6f   ; [$b72b] undefined
    .byte $ff,$f7,$ff,$fd,$be,$00,$ff,$ff   ; [$b733] undefined
    .byte $ff,$ff,$ff,$ff,$6b,$00,$ff,$86   ; [$b73b] undefined
    .byte $ff,$75,$ff,$d8,$ff,$00,$ff,$28   ; [$b743] undefined
    .byte $ff,$f7,$ff,$f9,$ff,$00,$ff,$af   ; [$b74b] undefined
    .byte $ff,$ff,$ff,$f7,$fd,$00,$ff,$fe   ; [$b753] undefined
    .byte $ff,$fe,$ff,$ff,$f7,$00,$ff,$a0   ; [$b75b] undefined
    .byte $ff,$a5,$ff,$be,$bf,$00,$ff,$95   ; [$b763] undefined
    .byte $ff,$bf,$ff,$af,$ff,$00,$ff,$7d   ; [$b76b] undefined
    .byte $ff,$ff,$ff,$ef,$cb,$00,$ff,$fb   ; [$b773] undefined
    .byte $ff,$ff,$ff,$fe,$be,$00,$ff,$0a   ; [$b77b] undefined
    .byte $ff,$5a,$ff,$b4,$f7,$00,$ff,$1b   ; [$b783] undefined
    .byte $ff,$bd,$ff,$79,$ff,$00,$ff,$ff   ; [$b78b] undefined
    .byte $ff,$f7,$ff,$ff,$cf,$00,$ff,$fe   ; [$b793] undefined
    .byte $ff,$ff,$ff,$ff,$ed,$00,$ff,$20   ; [$b79b] undefined
    .byte $ff,$23,$ff,$d3,$ff,$00,$ff,$bd   ; [$b7a3] undefined
    .byte $ff,$ce,$ff,$ce,$ff,$00,$ff,$37   ; [$b7ab] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$ff   ; [$b7b3] undefined
    .byte $ff,$ff,$ff,$ff,$fb,$00,$ff,$45   ; [$b7bb] undefined
    .byte $ff,$5e,$ff,$9f,$ff,$00,$ff,$f8   ; [$b7c3] undefined
    .byte $ff,$75,$ff,$ff,$ff,$00,$ff,$b1   ; [$b7cb] undefined
    .byte $ff,$ff,$ff,$ff,$b5,$00,$ff,$f7   ; [$b7d3] undefined
    .byte $ff,$df,$ff,$ff,$17,$00,$ff,$c6   ; [$b7db] undefined
    .byte $ff,$f0,$ff,$83,$ff,$00,$ff,$f8   ; [$b7e3] undefined
    .byte $ff,$ef,$ff,$ef,$dd,$00,$ef,$ff   ; [$b7eb] undefined
    .byte $ff,$ff,$ff,$ef,$df,$00,$ff,$ff   ; [$b7f3] undefined
    .byte $ff,$ff,$ff,$ff,$4e,$00,$ff,$80   ; [$b7fb] undefined
    .byte $ff,$ff,$ff,$fe,$ff,$00,$ff,$d2   ; [$b803] undefined
    .byte $ff,$ff,$ff,$ef,$ef,$00,$ff,$af   ; [$b80b] undefined
    .byte $ff,$f6,$ff,$ff,$ff,$00,$ff,$de   ; [$b813] undefined
    .byte $ff,$fe,$ff,$ff,$f3,$00,$ff,$f0   ; [$b81b] undefined
    .byte $ff,$7d,$ff,$66,$fb,$00,$ff,$e6   ; [$b823] undefined
    .byte $ff,$e2,$ff,$ff,$f7,$00,$ff,$df   ; [$b82b] undefined
    .byte $ff,$ff,$ff,$fe,$ff,$00,$ff,$d7   ; [$b833] undefined
    .byte $ff,$ff,$fb,$fd,$fe,$00,$ff,$72   ; [$b83b] undefined
    .byte $ff,$ed,$ff,$f7,$ff,$00,$ff,$e8   ; [$b843] undefined
    .byte $ff,$be,$ff,$ff,$ff,$00,$ff,$c6   ; [$b84b] undefined
    .byte $ff,$ff,$ff,$fd,$ee,$00,$ff,$ff   ; [$b853] undefined
    .byte $ff,$fd,$bf,$f5,$e1,$00,$ff,$ac   ; [$b85b] undefined
    .byte $ff,$31,$ff,$ee,$fd,$00,$ff,$03   ; [$b863] undefined
    .byte $ff,$be,$ff,$ef,$9e,$00,$ff,$f9   ; [$b86b] undefined
    .byte $ff,$7f,$ff,$df,$5f,$00,$ff,$fd   ; [$b873] undefined
    .byte $ff,$7f,$ff,$fb,$fb,$00,$ff,$48   ; [$b87b] undefined
    .byte $ff,$8c,$ff,$70,$df,$00,$ff,$93   ; [$b883] undefined
    .byte $ff,$ff,$ff,$e7,$ff,$00,$ff,$75   ; [$b88b] undefined
    .byte $ff,$ff,$ff,$ff,$ab,$00,$ff,$f5   ; [$b893] undefined
    .byte $ff,$ff,$f7,$ff,$40,$00,$ff,$34   ; [$b89b] undefined
    .byte $ff,$f3,$ff,$f4,$ff,$00,$ff,$ac   ; [$b8a3] undefined
    .byte $ff,$ff,$ff,$ff,$bf,$00,$ff,$dd   ; [$b8ab] undefined
    .byte $ff,$fa,$ff,$ef,$32,$00,$ff,$ff   ; [$b8b3] undefined
    .byte $ff,$fe,$ff,$ff,$2a,$00,$ff,$22   ; [$b8bb] undefined
    .byte $ff,$68,$ff,$b6,$de,$00,$ff,$0e   ; [$b8c3] undefined
    .byte $ff,$66,$ff,$72,$ed,$00,$ff,$da   ; [$b8cb] undefined
    .byte $ff,$fe,$ff,$fd,$df,$00,$ff,$ff   ; [$b8d3] undefined
    .byte $ff,$fb,$fb,$ff,$17,$00,$ff,$30   ; [$b8db] undefined
    .byte $ff,$b5,$ff,$de,$7f,$00,$ff,$79   ; [$b8e3] undefined
    .byte $fb,$d7,$ff,$db,$ee,$00,$ff,$f9   ; [$b8eb] undefined
    .byte $ff,$ff,$ff,$ff,$5a,$00,$ff,$f7   ; [$b8f3] undefined
    .byte $ff,$ff,$ff,$ff,$4f,$00,$ff,$fc   ; [$b8fb] undefined
    .byte $ff,$8c,$ff,$df,$ff,$00,$ff,$a1   ; [$b903] undefined
    .byte $ff,$f5,$ff,$ef,$f7,$00,$ff,$75   ; [$b90b] undefined
    .byte $ff,$fa,$fb,$ff,$ff,$00,$ff,$5f   ; [$b913] undefined
    .byte $ff,$ff,$bf,$ff,$ff,$00,$ff,$00   ; [$b91b] undefined
    .byte $ff,$b2,$ff,$1e,$7f,$00,$ff,$53   ; [$b923] undefined
    .byte $ff,$ee,$ff,$df,$df,$00,$ff,$e9   ; [$b92b] undefined
    .byte $ff,$fe,$ff,$ff,$d7,$00,$ff,$ff   ; [$b933] undefined
    .byte $ff,$ff,$ff,$ff,$7d,$00,$ff,$80   ; [$b93b] undefined
    .byte $ff,$fa,$ff,$ff,$ff,$00,$ff,$6a   ; [$b943] undefined
    .byte $ff,$7e,$ff,$ff,$f7,$00,$ff,$fe   ; [$b94b] undefined
    .byte $ff,$db,$ff,$fe,$f7,$00,$ff,$fe   ; [$b953] undefined
    .byte $ff,$ff,$ff,$ff,$47,$00,$ff,$a7   ; [$b95b] undefined
    .byte $ff,$65,$ff,$e5,$ff,$00,$ff,$50   ; [$b963] undefined
    .byte $ff,$ef,$ff,$ba,$fd,$00,$ff,$7e   ; [$b96b] undefined
    .byte $ff,$fe,$ff,$ff,$ff,$00,$ff,$ff   ; [$b973] undefined
    .byte $ff,$ff,$ff,$ff,$0f,$00,$ff,$4c   ; [$b97b] undefined
    .byte $ff,$e8,$ff,$32,$ff,$00,$ff,$11   ; [$b983] undefined
    .byte $ff,$fa,$ff,$46,$ff,$00,$ff,$9d   ; [$b98b] undefined
    .byte $ff,$ff,$ff,$ff,$3f,$00,$ff,$f7   ; [$b993] undefined
    .byte $ff,$ff,$ff,$ff,$25,$00,$ff,$92   ; [$b99b] undefined
    .byte $ff,$f2,$ff,$9f,$ff,$00,$ff,$ce   ; [$b9a3] undefined
    .byte $ff,$ed,$ff,$fa,$df,$00,$ff,$ac   ; [$b9ab] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$00,$ff,$fb   ; [$b9b3] undefined
    .byte $ff,$fd,$ff,$df,$e4,$00,$ff,$b8   ; [$b9bb] undefined
    .byte $ff,$7d,$ff,$82,$ff,$00,$ff,$f9   ; [$b9c3] undefined
    .byte $ff,$77,$ff,$fa,$fe,$00,$ff,$ba   ; [$b9cb] undefined
    .byte $ff,$fe,$ff,$7f,$7f,$00,$ff,$df   ; [$b9d3] undefined
    .byte $ff,$fb,$ff,$ff,$27,$00,$ff,$42   ; [$b9db] undefined
    .byte $ff,$ca,$ff,$4b,$ff,$00,$ff,$a4   ; [$b9e3] undefined
    .byte $ff,$ff,$ff,$fb,$95,$00,$ff,$fc   ; [$b9eb] undefined
    .byte $ff,$ff,$ff,$f7,$fb,$00,$ff,$f7   ; [$b9f3] undefined
    .byte $ff,$ff,$ff,$ff,$75,$00,$ff,$8c   ; [$b9fb] undefined
    .byte $ff,$bf,$ff,$dc,$f7,$00,$ff,$b4   ; [$ba03] undefined
    .byte $ff,$fa,$ff,$df,$ff,$00,$ff,$ca   ; [$ba0b] undefined
    .byte $ff,$ff,$ff,$be,$df,$00,$ff,$f7   ; [$ba13] undefined
    .byte $ff,$ff,$ff,$ff,$fe,$00,$ff,$93   ; [$ba1b] undefined
    .byte $ff,$37,$ff,$91,$fb,$00,$ff,$6c   ; [$ba23] undefined
    .byte $ff,$df,$ff,$f7,$ff,$00,$ff,$5e   ; [$ba2b] undefined
    .byte $ff,$df,$ff,$ff,$f5,$00,$ff,$fa   ; [$ba33] undefined
    .byte $ff,$ff,$ff,$ff,$97,$00,$ff,$04   ; [$ba3b] undefined
    .byte $ff,$dc,$ff,$7c,$bb,$00,$ff,$ba   ; [$ba43] undefined
    .byte $ff,$de,$ff,$fc,$bf,$00,$ff,$32   ; [$ba4b] undefined
    .byte $ff,$bf,$ff,$ff,$cb,$00,$fd,$fe   ; [$ba53] undefined
    .byte $ff,$ff,$ff,$ff,$dd,$00,$ff,$8e   ; [$ba5b] undefined
    .byte $ff,$9d,$ff,$e5,$df,$00,$ff,$fb   ; [$ba63] undefined
    .byte $ff,$fe,$ff,$df,$ff,$00,$ff,$f7   ; [$ba6b] undefined
    .byte $ff,$fb,$ff,$df,$d7,$00,$ff,$ff   ; [$ba73] undefined
    .byte $ff,$ff,$ff,$ff,$f3,$00,$ff,$b0   ; [$ba7b] undefined
    .byte $ff,$e7,$ff,$5c,$ff,$00,$ff,$df   ; [$ba83] undefined
    .byte $ff,$9d,$ff,$ff,$ff,$00,$ff,$cc   ; [$ba8b] undefined
    .byte $ff,$ff,$ff,$ff,$ae,$00,$ff,$5f   ; [$ba93] undefined
    .byte $ff,$ff,$df,$ff,$6e,$00,$ff,$8c   ; [$ba9b] undefined
    .byte $ff,$5d,$ff,$f5,$ff,$00,$ff,$71   ; [$baa3] undefined
    .byte $ff,$fe,$ff,$ff,$bf,$00,$ff,$f7   ; [$baab] undefined
    .byte $ff,$ff,$ff,$af,$6e,$00,$ff,$f1   ; [$bab3] undefined
    .byte $ff,$ff,$ff,$ff,$07,$00,$ff,$34   ; [$babb] undefined
    .byte $ff,$2b,$ff,$fe,$ff,$00,$ff,$d8   ; [$bac3] undefined
    .byte $ff,$fa,$ef,$fe,$ff,$00,$ff,$f0   ; [$bacb] undefined
    .byte $7f,$ff,$ff,$ff,$b9,$00,$ff,$fb   ; [$bad3] undefined
    .byte $ff,$bd,$ff,$ff,$7e,$00,$ff,$c2   ; [$badb] undefined
    .byte $ff,$46,$ff,$fb,$ff,$00,$ff,$f6   ; [$bae3] undefined
    .byte $ff,$87,$ff,$fd,$9e,$00,$ff,$7b   ; [$baeb] undefined
    .byte $ff,$ff,$ff,$ff,$33,$00,$7f,$ff   ; [$baf3] undefined
    .byte $ff,$ff,$ff,$ff,$93,$00,$ff,$84   ; [$bafb] undefined
    .byte $ff,$ed,$ff,$6d,$ff,$00,$ff,$b1   ; [$bb03] undefined
    .byte $ff,$e7,$ff,$7f,$ff,$00,$ff,$fa   ; [$bb0b] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$ff   ; [$bb13] undefined
    .byte $ff,$ff,$ff,$ff,$b7,$00,$ff,$80   ; [$bb1b] undefined
    .byte $ff,$eb,$ff,$ff,$ff,$00,$ff,$d7   ; [$bb23] undefined
    .byte $ff,$fd,$ff,$7b,$fe,$00,$ff,$ff   ; [$bb2b] undefined
    .byte $ff,$ef,$ff,$bf,$df,$00,$ff,$7f   ; [$bb33] undefined
    .byte $ff,$ff,$ff,$ff,$df,$00,$ff,$b8   ; [$bb3b] undefined
    .byte $ff,$ed,$ff,$ad,$ff,$00,$ff,$5d   ; [$bb43] undefined
    .byte $ff,$b7,$ff,$bf,$bb,$00,$ff,$de   ; [$bb4b] undefined
    .byte $ff,$bf,$ff,$ff,$f9,$00,$ff,$fb   ; [$bb53] undefined
    .byte $ff,$ff,$ff,$ff,$26,$00,$ff,$e4   ; [$bb5b] undefined
    .byte $ff,$e7,$ff,$a1,$ff,$00,$ff,$b7   ; [$bb63] undefined
    .byte $ff,$3e,$ff,$ff,$5f,$00,$ff,$f4   ; [$bb6b] undefined
    .byte $ff,$fb,$ff,$7f,$bd,$00,$ff,$df   ; [$bb73] undefined
    .byte $ff,$5f,$ff,$ff,$f7,$00,$ff,$80   ; [$bb7b] undefined
    .byte $ff,$dd,$ff,$dc,$fe,$00,$ff,$db   ; [$bb83] undefined
    .byte $ff,$ff,$ff,$f7,$ff,$00,$ff,$ee   ; [$bb8b] undefined
    .byte $ff,$ff,$ff,$ff,$7d,$00,$ff,$ff   ; [$bb93] undefined
    .byte $ff,$ff,$ff,$ff,$dd,$00,$ff,$9a   ; [$bb9b] undefined
    .byte $ff,$51,$ff,$cd,$ff,$00,$ff,$12   ; [$bba3] undefined
    .byte $ff,$ef,$ff,$ff,$fe,$00,$ff,$7e   ; [$bbab] undefined
    .byte $ff,$3f,$ff,$df,$b7,$00,$ff,$ff   ; [$bbb3] undefined
    .byte $ff,$ff,$ff,$fd,$e9,$00,$ff,$a3   ; [$bbbb] undefined
    .byte $ff,$e3,$ff,$f4,$ff,$00,$ff,$b0   ; [$bbc3] undefined
    .byte $ff,$fd,$ff,$fa,$ad,$00,$ff,$7f   ; [$bbcb] undefined
    .byte $ff,$ff,$ff,$fd,$79,$00,$ff,$ff   ; [$bbd3] undefined
    .byte $ff,$ff,$ff,$bf,$89,$00,$ff,$ba   ; [$bbdb] undefined
    .byte $ff,$e9,$ff,$80,$ff,$00,$ff,$74   ; [$bbe3] undefined
    .byte $ff,$ff,$ff,$7b,$cf,$00,$ff,$df   ; [$bbeb] undefined
    .byte $ff,$7f,$ff,$ff,$b1,$00,$ff,$fd   ; [$bbf3] undefined
    .byte $df,$ff,$bf,$ff,$4b,$00,$ff,$ce   ; [$bbfb] undefined
    .byte $ff,$7e,$ff,$29,$bf,$00,$ff,$f7   ; [$bc03] undefined
    .byte $ff,$ef,$ff,$ef,$df,$00,$ff,$ef   ; [$bc0b] undefined
    .byte $ff,$ff,$ff,$ff,$ef,$00,$ff,$de   ; [$bc13] undefined
    .byte $ff,$ff,$ff,$ff,$6b,$00,$ff,$73   ; [$bc1b] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$a3   ; [$bc23] undefined
    .byte $ff,$ff,$ff,$fe,$bd,$00,$ff,$df   ; [$bc2b] undefined
    .byte $ff,$f7,$ff,$f5,$bf,$00,$ff,$ff   ; [$bc33] undefined
    .byte $ff,$ff,$fe,$df,$5f,$00,$ff,$c1   ; [$bc3b] undefined
    .byte $ff,$36,$ff,$fd,$ff,$00,$ff,$d3   ; [$bc43] undefined
    .byte $ff,$7b,$ff,$bb,$7f,$00,$ff,$ca   ; [$bc4b] undefined
    .byte $ff,$ff,$ff,$fe,$f7,$00,$ff,$ff   ; [$bc53] undefined
    .byte $ff,$ff,$ff,$ff,$3f,$00,$ff,$14   ; [$bc5b] undefined
    .byte $ff,$ab,$ff,$bd,$b7,$00,$ff,$7f   ; [$bc63] undefined
    .byte $ff,$ef,$ff,$fb,$f5,$00,$ff,$bf   ; [$bc6b] undefined
    .byte $ff,$ff,$ff,$5f,$d7,$00,$ff,$ff   ; [$bc73] undefined
    .byte $ff,$ff,$ff,$ff,$45,$00,$ff,$70   ; [$bc7b] undefined
    .byte $ff,$fa,$ff,$67,$ff,$00,$ff,$bb   ; [$bc83] undefined
    .byte $ff,$e9,$ff,$ef,$bf,$00,$ff,$2d   ; [$bc8b] undefined
    .byte $ff,$ef,$ff,$df,$bf,$00,$ff,$ca   ; [$bc93] undefined
    .byte $ff,$ff,$ff,$ff,$78,$00,$ff,$4a   ; [$bc9b] undefined
    .byte $ff,$36,$bf,$f1,$ff,$00,$ff,$d4   ; [$bca3] undefined
    .byte $ff,$ed,$ff,$7b,$ff,$00,$ff,$df   ; [$bcab] undefined
    .byte $ff,$fa,$ff,$ff,$7e,$00,$ff,$ef   ; [$bcb3] undefined
    .byte $ff,$ff,$f7,$ff,$25,$00,$ff,$46   ; [$bcbb] undefined
    .byte $ff,$ac,$ff,$bb,$bf,$00,$ff,$36   ; [$bcc3] undefined
    .byte $ff,$f7,$ff,$df,$7f,$00,$ff,$c1   ; [$bccb] undefined
    .byte $ff,$bf,$ff,$ff,$fb,$00,$ff,$ef   ; [$bcd3] undefined
    .byte $ff,$ff,$ff,$ff,$2e,$00,$ff,$02   ; [$bcdb] undefined
    .byte $ff,$18,$ff,$f5,$fe,$00,$ff,$dd   ; [$bce3] undefined
    .byte $ff,$fc,$ff,$ff,$b7,$00,$ff,$bf   ; [$bceb] undefined
    .byte $ff,$be,$ff,$7f,$ea,$00,$ff,$fd   ; [$bcf3] undefined
    .byte $ff,$ff,$ef,$ff,$87,$00,$ff,$02   ; [$bcfb] undefined
    .byte $ff,$fa,$ff,$dc,$ff,$00,$ff,$ea   ; [$bd03] undefined
    .byte $ff,$7f,$ff,$f9,$ff,$00,$ff,$fa   ; [$bd0b] undefined
    .byte $ff,$ff,$ff,$ff,$f7,$00,$ff,$ff   ; [$bd13] undefined
    .byte $ff,$ff,$ff,$ff,$bf,$00,$ff,$46   ; [$bd1b] undefined
    .byte $ff,$fb,$ff,$ff,$ff,$00,$ff,$3d   ; [$bd23] undefined
    .byte $ff,$ef,$ff,$ff,$7f,$00,$ff,$be   ; [$bd2b] undefined
    .byte $ff,$ff,$ff,$ff,$d5,$00,$ff,$ff   ; [$bd33] undefined
    .byte $ff,$ff,$ff,$ff,$5b,$00,$ff,$62   ; [$bd3b] undefined
    .byte $ff,$aa,$ff,$bd,$fb,$00,$ff,$8b   ; [$bd43] undefined
    .byte $ff,$ef,$ff,$ff,$ff,$00,$ff,$f5   ; [$bd4b] undefined
    .byte $ff,$ff,$ff,$ff,$5f,$00,$ff,$ff   ; [$bd53] undefined
    .byte $ff,$ff,$f7,$ff,$61,$00,$ff,$90   ; [$bd5b] undefined
    .byte $ff,$e2,$ff,$ff,$ff,$00,$ff,$87   ; [$bd63] undefined
    .byte $ff,$cb,$ff,$53,$ff,$00,$ff,$ec   ; [$bd6b] undefined
    .byte $ff,$ff,$ff,$ff,$7b,$00,$ff,$ff   ; [$bd73] undefined
    .byte $ff,$ff,$ff,$ff,$53,$00,$ff,$01   ; [$bd7b] undefined
    .byte $ff,$9c,$ff,$e2,$ff,$00,$ff,$a8   ; [$bd83] undefined
    .byte $ff,$fe,$ff,$de,$ef,$00,$ff,$57   ; [$bd8b] undefined
    .byte $ff,$fd,$ff,$fc,$fa,$00,$ff,$f7   ; [$bd93] undefined
    .byte $ff,$ff,$ff,$ff,$76,$00,$ff,$46   ; [$bd9b] undefined
    .byte $ff,$b0,$ff,$6e,$ff,$00,$ff,$33   ; [$bda3] undefined
    .byte $ff,$f3,$ff,$fb,$fa,$00,$ff,$f7   ; [$bdab] undefined
    .byte $ff,$bf,$ff,$ff,$9b,$00,$ff,$ff   ; [$bdb3] undefined
    .byte $ff,$f7,$ff,$ff,$11,$00,$ff,$44   ; [$bdbb] undefined
    .byte $ff,$a6,$ff,$ca,$ff,$00,$ff,$f5   ; [$bdc3] undefined
    .byte $ff,$f2,$ff,$ef,$df,$00,$ff,$dc   ; [$bdcb] undefined
    .byte $ff,$ff,$ff,$fd,$bb,$00,$ff,$f7   ; [$bdd3] undefined
    .byte $ff,$ff,$ff,$ff,$97,$00,$ff,$75   ; [$bddb] undefined
    .byte $ff,$55,$ff,$1b,$9f,$00,$ff,$9f   ; [$bde3] undefined
    .byte $ff,$7f,$ff,$7f,$fb,$00,$ff,$3b   ; [$bdeb] undefined
    .byte $ff,$f7,$ff,$fd,$f7,$00,$fe,$ff   ; [$bdf3] undefined
    .byte $ff,$ff,$ff,$ff,$c5,$00,$ff,$a5   ; [$bdfb] undefined
    .byte $ff,$72,$ff,$fa,$fe,$00,$ff,$62   ; [$be03] undefined
    .byte $ff,$f9,$ff,$ef,$5f,$00,$ff,$5c   ; [$be0b] undefined
    .byte $ff,$bf,$ff,$ef,$ff,$00,$ff,$ff   ; [$be13] undefined
    .byte $ff,$ff,$ff,$fe,$ff,$00,$ff,$c0   ; [$be1b] undefined
    .byte $ff,$51,$ff,$fe,$ff,$00,$ff,$b7   ; [$be23] undefined
    .byte $ff,$f6,$ff,$ff,$ef,$00,$ff,$bb   ; [$be2b] undefined
    .byte $ff,$ff,$ff,$fd,$fb,$00,$ff,$f7   ; [$be33] undefined
    .byte $ff,$fd,$ff,$ff,$3b,$00,$ff,$c4   ; [$be3b] undefined
    .byte $ff,$95,$ff,$ad,$ff,$00,$ff,$ce   ; [$be43] undefined
    .byte $ff,$f6,$ff,$fa,$df,$00,$ff,$ef   ; [$be4b] undefined
    .byte $ff,$ff,$ff,$ff,$ef,$00,$ff,$f5   ; [$be53] undefined
    .byte $ff,$ff,$ff,$fd,$02,$00,$ff,$d0   ; [$be5b] undefined
    .byte $ff,$4e,$ff,$54,$ff,$00,$ff,$ce   ; [$be63] undefined
    .byte $ff,$ff,$ff,$f6,$7f,$00,$ff,$ff   ; [$be6b] undefined
    .byte $ff,$ff,$ff,$7b,$5f,$00,$ff,$be   ; [$be73] undefined
    .byte $ff,$ff,$df,$ff,$5e,$00,$ff,$41   ; [$be7b] undefined
    .byte $ff,$b6,$ff,$3f,$ff,$00,$ff,$71   ; [$be83] undefined
    .byte $ff,$ef,$ff,$37,$df,$00,$ff,$23   ; [$be8b] undefined
    .byte $ff,$f7,$ff,$fe,$db,$00,$ff,$ff   ; [$be93] undefined
    .byte $ff,$ff,$fb,$ff,$fd,$00,$ff,$71   ; [$be9b] undefined
    .byte $ff,$1a,$ff,$9d,$ff,$00,$ff,$2d   ; [$bea3] undefined
    .byte $ff,$f7,$ff,$fb,$ff,$00,$ff,$fd   ; [$beab] undefined
    .byte $ff,$ff,$ff,$fd,$77,$00,$ff,$ff   ; [$beb3] undefined
    .byte $ff,$ff,$ff,$ff,$2f,$00,$ff,$63   ; [$bebb] undefined
    .byte $ff,$d1,$ff,$34,$ff,$00,$ff,$d9   ; [$bec3] undefined
    .byte $ff,$bf,$ff,$5d,$7f,$00,$ff,$3f   ; [$becb] undefined
    .byte $ff,$fe,$ff,$db,$fe,$00,$ff,$7d   ; [$bed3] undefined
    .byte $ff,$ff,$ff,$ff,$4d,$00,$ff,$c0   ; [$bedb] undefined
    .byte $ff,$f4,$ff,$fa,$ff,$00,$ff,$f6   ; [$bee3] undefined
    .byte $ff,$f4,$ff,$ef,$ef,$00,$ff,$de   ; [$beeb] undefined
    .byte $ff,$f7,$ff,$ef,$0d,$00,$bf,$ff   ; [$bef3] undefined
    .byte $ff,$ff,$ff,$ff,$bc,$00,$ff,$86   ; [$befb] undefined
    .byte $ff,$dd,$ff,$af,$fd,$00,$ff,$6d   ; [$bf03] undefined
    .byte $ff,$79,$ff,$ff,$ff,$00,$ff,$f7   ; [$bf0b] undefined
    .byte $ff,$ff,$ff,$7f,$ff,$00,$ff,$ff   ; [$bf13] undefined
    .byte $ff,$f7,$ff,$ff,$3f,$00,$ff,$14   ; [$bf1b] undefined
    .byte $ff,$fc,$ff,$ee,$7f,$00,$ff,$9a   ; [$bf23] undefined
    .byte $ff,$fc,$ff,$f7,$ff,$00,$ff,$d1   ; [$bf2b] undefined
    .byte $ff,$fb,$ff,$fb,$ff,$00,$ff,$ff   ; [$bf33] undefined
    .byte $ff,$ff,$ff,$ff,$e7,$00,$ff,$50   ; [$bf3b] undefined
    .byte $ff,$de,$ff,$d7,$ff,$00,$ff,$3a   ; [$bf43] undefined
    .byte $ff,$f7,$ff,$ff,$ff,$00,$ff,$ff   ; [$bf4b] undefined
    .byte $ff,$7f,$ff,$f9,$f7,$00,$ff,$ff   ; [$bf53] undefined
    .byte $ff,$ff,$ff,$ff,$5f,$00,$ff,$90   ; [$bf5b] undefined
    .byte $ff,$67,$ff,$b0,$ff,$00,$ff,$97   ; [$bf63] undefined
    .byte $ff,$ff,$ff,$ff,$7f,$00,$ff,$5f   ; [$bf6b] undefined
    .byte $ff,$ff,$ff,$ff,$de,$00,$ff,$ef   ; [$bf73] undefined
    .byte $ff,$ff,$ff,$ff,$3a,$00,$ff,$8c   ; [$bf7b] undefined
    .byte $ff,$7c,$ff,$f4,$ff,$00,$ff,$e8   ; [$bf83] undefined
    .byte $ff,$cc,$ff,$ff,$bf,$00,$ff,$e7   ; [$bf8b] undefined
    .byte $ff,$ff,$ff,$bf,$fc,$00,$ff,$ff   ; [$bf93] undefined
    .byte $7f,$ff,$ff,$ff,$83,$00,$ff,$61   ; [$bf9b] undefined
    .byte $ff,$e6,$ff,$5c,$f7,$00,$ff,$9b   ; [$bfa3] undefined
    .byte $ff,$db,$ff,$bd,$fd,$00,$ff,$bd   ; [$bfab] undefined
    .byte $ff,$fe,$ff,$ff,$de,$00,$ff,$fd   ; [$bfb3] undefined
    .byte $ff,$ff,$ff,$ff,$7f,$00,$ff,$70   ; [$bfbb] undefined
    .byte $ff,$ff,$ff,$d9,$ff,$00,$ff,$ef   ; [$bfc3] undefined
    .byte $ff,$fe,$ff,$ff,$6d,$00,$ff,$fa   ; [$bfcb] undefined
    .byte $ff,$fd,$ff,$7e,$2b,$00,$ff,$dd   ; [$bfd3] undefined
    .byte $ff,$ff,$f7,$ff,$1d,$00,$ff,$48   ; [$bfdb] undefined
    .byte $ff,$df,$ff,$e5,$ff,$00,$ff,$89   ; [$bfe3] undefined
    .byte $ff,$ff,$ff,$ff,$8f,$00,$ff,$7f   ; [$bfeb] undefined
    .byte $ff,$7d,$ff,$fe,$ff,$00,$ff,$ff   ; [$bff3] undefined
    .byte $f7,$ff,$ff,$ff,$19               ; [$bffb] undefined
