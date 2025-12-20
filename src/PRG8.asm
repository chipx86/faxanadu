;============================================================================
; Faxanadu (U).nes
;
; PRG8 ($8000 - $bfff)
;============================================================================

    BASE $8000


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
    dw $0012                                ; TILES_PLAYER_ARMOR_ADDRS_INDEX
                                            ; [$PRG8::8000]


;
; Address for the weapon-to-tiles offsets lookup table.
;
;
; XREFS:
;     Player_LoadWeaponSpriteTileAddrs
;
TILES_WEAPON_ADDRS_INDEX_REF:               ; [$8002]
    dw $016b                                ; TILES_PLAYER_WEAPON_ADDRS_INDEX
                                            ; [$PRG8::8002]


;
; Start address of all armor tiles.
;
;
; XREFS:
;     Player_LoadArmorTile
;
TILES_ARMOR_START_REF:                      ; [$8004]
    dw $01a4                                ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8004]


;
; Start address of all weapon tiles.
;
;
; XREFS:
;     Player_LoadWeaponTile
;
TILES_WEAPONS_START_REF:                    ; [$8006]
    dw $0a94                                ; TILES_WEAPONS_START_DAGGER_02
                                            ; [$PRG8::8006]


;
; Start address of common game tiles.
;
;
; XREFS:
;     Sprites_LoadCommon
;
TILES_COMMON_START_REF:                     ; [$8008]
    dw $0c04                                ; TILES_COMMON_START
                                            ; [$PRG8::8008]


;
; Start address of all shield tiles.
;
;
; XREFS:
;     Player_LoadShieldTile
;
TILES_SHIELDS_START_REF:                    ; [$800a]
    dw $1104                                ; TILES_SHIELDS_START_SMALL_SHIELD_01
                                            ; [$PRG8::800a]


;
; Address for the shield-to-tiles offsets lookup table.
;
;
; XREFS:
;     Player_LoadShieldSpriteTileAddrs
;
TILES_SHIELDS_ADDRS_INDEX_REF:              ; [$800c]
    dw $018c                                ; TILES_SHIELDS_ADDRS_INDEX
                                            ; [$PRG8::800c]


;
; Address for the portrait-to-tiles offsets lookup table.
;
;
; XREFS:
;     IScripts_LoadPortraitTilesAddress
;
TILES_PORTRAITS_ADDRS_INDEX_REF:            ; [$800e]
    dw $1224                                ; SPRITE_TILES_PORTRAITS_ADDRS_INDEX
                                            ; [$PRG8::800e]


;
; Start address for all portrait tiles.
;
;
; XREFS:
;     IScripts_DrawPortraitTileToPPU
;
TILES_PORTRAITS_START_REF:                  ; [$8010]
    dw $136b                                ; SPRITE_TILES_PORTRAIT_PINKSHIRT_00
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
    dw $0022                                ; TILES_PLAYER_ARMOR_LEATHER_START
                                            ; [$PRG8::8012]
    dw $00f2                                ; TILES_PLAYER_ARMOR_LEATHER_WSHIELD_START
                                            ; [$PRG8::8014]
    dw $0056                                ; TILES_PLAYER_ARMOR_STUDDED_MAIL_START
                                            ; [$PRG8::8016]
    dw $011a                                ; TILES_PLAYER_ARMOR_STUDDED_MAIL_WSHIELD_START
                                            ; [$PRG8::8018]
    dw $008a                                ; TILES_PLAYER_ARMOR_FULL_PLATE_START
                                            ; [$PRG8::801a]
    dw $0142                                ; TILES_PLAYER_ARMOR_FULL_PLATE_WSHIELD_START
                                            ; [$PRG8::801c]
    dw $00bf                                ; TILES_PLAYER_ARMOR_BATTLE_SUIT_START
                                            ; [$PRG8::801e]
    dw $00bf                                ; TILES_PLAYER_ARMOR_BATTLE_SUIT_START
                                            ; [$PRG8::8020]

;
; XREFS:
;     TILES_PLAYER_ARMOR_ADDRS_INDEX [$PRG8::8012]
;
TILES_PLAYER_ARMOR_LEATHER_START:           ; [$8022]
    db $00                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8022]
    db $01                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::8023]
    db $02                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_02
                                            ; [$PRG8::8024]
    db $03                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_03
                                            ; [$PRG8::8025]
    db $04                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_04
                                            ; [$PRG8::8026]
    db $05                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_05
                                            ; [$PRG8::8027]
    db $06                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::8028]
    db $07                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::8029]
    db $08                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::802a]
    db $09                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::802b]
    db $0a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_10
                                            ; [$PRG8::802c]
    db $0b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_11
                                            ; [$PRG8::802d]
    db $0c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_12
                                            ; [$PRG8::802e]
    db $0d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_13
                                            ; [$PRG8::802f]
    db $0e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::8030]
    db $0f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_15
                                            ; [$PRG8::8031]
    db $10                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_16
                                            ; [$PRG8::8032]
    db $11                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_17
                                            ; [$PRG8::8033]
    db $12                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_18
                                            ; [$PRG8::8034]
    db $13                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::8035]
    db $14                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::8036]
    db $29                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_21
                                            ; [$PRG8::8037]
    db $2a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_22
                                            ; [$PRG8::8038]
    db $2b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24
                                            ; [$PRG8::8039]
    db $2c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25
                                            ; [$PRG8::803a]
    db $2d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26
                                            ; [$PRG8::803b]
    db $2e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27
                                            ; [$PRG8::803c]
    db $4b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::803d]
    db $4c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::803e]
    db $4d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_29_WSHIELD_17
                                            ; [$PRG8::803f]
    db $4e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_30_WSHIELD_18
                                            ; [$PRG8::8040]
    db $4f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_31_WSHIELD_19
                                            ; [$PRG8::8041]
    db $50                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_32_WSHIELD_20
                                            ; [$PRG8::8042]
    db $51                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::8043]
    db $52                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8044]
    db $57                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8045]
    db $58                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::8046]
    db $59                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::8047]
    db $5a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_38_WSHIELD_26
                                            ; [$PRG8::8048]
    db $5b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_39_WSHIELD_27
                                            ; [$PRG8::8049]
    db $5c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_40_WSHIELD_28
                                            ; [$PRG8::804a]
    db $5d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_41_WSHIELD_29
                                            ; [$PRG8::804b]
    db $5e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::804c]
    db $5f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::804d]
    db $75                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::804e]
    db $76                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::804f]
    db $77                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_46_WSHIELD_34__STUDDED_052
                                            ; [$PRG8::8050]
    db $78                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_47_WSHIELD_35
                                            ; [$PRG8::8051]
    db $79                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_48_WSHIELD_36
                                            ; [$PRG8::8052]
    db $7a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_49_WSHIELD_37
                                            ; [$PRG8::8053]
    db $7b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8054]
    db $7c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
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
    db $00                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8056]
    db $01                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::8057]
    db $06                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::8058]
    db $07                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::8059]
    db $08                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::805a]
    db $09                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::805b]
    db $0e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::805c]
    db $13                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::805d]
    db $14                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::805e]
    db $15                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_09__FULL_PLATE_02
                                            ; [$PRG8::805f]
    db $16                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_10__FULL_PLATE_03
                                            ; [$PRG8::8060]
    db $17                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_11__FULL_PLATE_04
                                            ; [$PRG8::8061]
    db $18                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_12__FULL_PLATE_05
                                            ; [$PRG8::8062]
    db $19                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_13__FULL_PLATE_10
                                            ; [$PRG8::8063]
    db $1a                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_14__FULL_PLATE_11
                                            ; [$PRG8::8064]
    db $1b                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_15__FULL_PLATE_12
                                            ; [$PRG8::8065]
    db $1c                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_16__FULL_PLATE_13
                                            ; [$PRG8::8066]
    db $1d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_17__FULL_PLATE_16
                                            ; [$PRG8::8067]
    db $1e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_18__FULL_PLATE_17
                                            ; [$PRG8::8068]
    db $1f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_19__FULL_PLATE_18
                                            ; [$PRG8::8069]
    db $20                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_20__FULL_PLATE_19
                                            ; [$PRG8::806a]
    db $2b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24
                                            ; [$PRG8::806b]
    db $2c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25
                                            ; [$PRG8::806c]
    db $2d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26
                                            ; [$PRG8::806d]
    db $2e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27
                                            ; [$PRG8::806e]
    db $2f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_25
                                            ; [$PRG8::806f]
    db $30                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_26
                                            ; [$PRG8::8070]
    db $4b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8071]
    db $4c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::8072]
    db $51                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::8073]
    db $52                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8074]
    db $53                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::8075]
    db $54                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::8076]
    db $55                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::8077]
    db $56                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::8078]
    db $57                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8079]
    db $58                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::807a]
    db $59                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::807b]
    db $5e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::807c]
    db $5f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::807d]
    db $60                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::807e]
    db $61                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::807f]
    db $62                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::8080]
    db $63                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::8081]
    db $75                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::8082]
    db $76                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::8083]
    db $7b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8084]
    db $7c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8085]
    db $7d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::8086]
    db $7e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::8087]
    db $7f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::8088]
    db $80                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::8089]

TILES_PLAYER_ARMOR_FULL_PLATE_START:        ; [$808a]
    db $00                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::808a]
    db $01                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::808b]
    db $15                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_09__FULL_PLATE_02
                                            ; [$PRG8::808c]
    db $16                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_10__FULL_PLATE_03
                                            ; [$PRG8::808d]
    db $17                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_11__FULL_PLATE_04
                                            ; [$PRG8::808e]
    db $18                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_12__FULL_PLATE_05
                                            ; [$PRG8::808f]
    db $21                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06
                                            ; [$PRG8::8090]
    db $22                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07
                                            ; [$PRG8::8091]
    db $08                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::8092]
    db $09                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::8093]
    db $19                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_13__FULL_PLATE_10
                                            ; [$PRG8::8094]
    db $1a                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_14__FULL_PLATE_11
                                            ; [$PRG8::8095]
    db $1b                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_15__FULL_PLATE_12
                                            ; [$PRG8::8096]
    db $1c                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_16__FULL_PLATE_13
                                            ; [$PRG8::8097]
    db $23                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_14_WSHIELD_10
                                            ; [$PRG8::8098]
    db $24                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_15_WSHIELD_11
                                            ; [$PRG8::8099]
    db $1d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_17__FULL_PLATE_16
                                            ; [$PRG8::809a]
    db $1e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_18__FULL_PLATE_17
                                            ; [$PRG8::809b]
    db $1f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_19__FULL_PLATE_18
                                            ; [$PRG8::809c]
    db $20                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_20__FULL_PLATE_19
                                            ; [$PRG8::809d]
    db $25                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_20_WSHIELD_12
                                            ; [$PRG8::809e]
    db $26                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_21_WSHIELD_13
                                            ; [$PRG8::809f]
    db $2f                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_22
                                            ; [$PRG8::80a0]
    db $30                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_23
                                            ; [$PRG8::80a1]
    db $2b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_23__STUDDED_21__FULL_PLATE_24
                                            ; [$PRG8::80a2]
    db $2c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_24__STUDDED_22__FULL_PLATE_25
                                            ; [$PRG8::80a3]
    db $2d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_25__STUDDED_23__FULL_PLATE_26
                                            ; [$PRG8::80a4]
    db $2e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_26__STUDDED_24__FULL_PLATE_27
                                            ; [$PRG8::80a5]
    db $4b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::80a6]
    db $4c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::80a7]
    db $53                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::80a8]
    db $54                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::80a9]
    db $55                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::80aa]
    db $56                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::80ab]
    db $6a                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32
                                            ; [$PRG8::80ac]
    db $6b                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33
                                            ; [$PRG8::80ad]
    db $57                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::80ae]
    db $58                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::80af]
    db $59                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::80b0]
    db $60                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::80b1]
    db $61                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::80b2]
    db $62                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::80b3]
    db $63                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::80b4]
    db $73                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41
                                            ; [$PRG8::80b5]
    db $74                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42
                                            ; [$PRG8::80b6]
    db $75                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::80b7]
    db $76                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::80b8]
    db $7d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::80b9]
    db $7e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::80ba]
    db $7f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::80bb]
    db $80                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::80bc]
    db $87                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49
                                            ; [$PRG8::80bd]
    db $88                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50
                                            ; [$PRG8::80be]

TILES_PLAYER_ARMOR_BATTLE_SUIT_START:       ; [$80bf]
    db $31                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_00
                                            ; [$PRG8::80bf]
    db $32                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_01
                                            ; [$PRG8::80c0]
    db $33                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_02
                                            ; [$PRG8::80c1]
    db $34                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_03
                                            ; [$PRG8::80c2]
    db $35                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_04
                                            ; [$PRG8::80c3]
    db $36                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_05
                                            ; [$PRG8::80c4]
    db $21                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06
                                            ; [$PRG8::80c5]
    db $22                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07
                                            ; [$PRG8::80c6]
    db $37                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_08
                                            ; [$PRG8::80c7]
    db $38                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_09
                                            ; [$PRG8::80c8]
    db $39                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_10
                                            ; [$PRG8::80c9]
    db $3a                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_11
                                            ; [$PRG8::80ca]
    db $3b                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_12
                                            ; [$PRG8::80cb]
    db $3c                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_13
                                            ; [$PRG8::80cc]
    db $3d                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_14
                                            ; [$PRG8::80cd]
    db $3e                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_15
                                            ; [$PRG8::80ce]
    db $3f                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_16
                                            ; [$PRG8::80cf]
    db $40                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_17
                                            ; [$PRG8::80d0]
    db $41                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_18
                                            ; [$PRG8::80d1]
    db $42                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_19
                                            ; [$PRG8::80d2]
    db $43                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_20
                                            ; [$PRG8::80d3]
    db $44                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_21
                                            ; [$PRG8::80d4]
    db $45                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_22
                                            ; [$PRG8::80d5]
    db $46                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_23
                                            ; [$PRG8::80d6]
    db $47                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_24
                                            ; [$PRG8::80d7]
    db $48                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_25
                                            ; [$PRG8::80d8]
    db $64                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_26
                                            ; [$PRG8::80d9]
    db $65                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_27
                                            ; [$PRG8::80da]
    db $66                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_28
                                            ; [$PRG8::80db]
    db $67                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_29
                                            ; [$PRG8::80dc]
    db $68                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_30
                                            ; [$PRG8::80dd]
    db $69                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_31
                                            ; [$PRG8::80de]
    db $6a                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32
                                            ; [$PRG8::80df]
    db $6b                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33
                                            ; [$PRG8::80e0]
    db $6c                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_34
                                            ; [$PRG8::80e1]
    db $6d                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_35
                                            ; [$PRG8::80e2]
    db $6e                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_36
                                            ; [$PRG8::80e3]
    db $6f                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_37
                                            ; [$PRG8::80e4]
    db $70                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_38
                                            ; [$PRG8::80e5]
    db $71                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_39
                                            ; [$PRG8::80e6]
    db $72                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_40
                                            ; [$PRG8::80e7]
    db $73                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41
                                            ; [$PRG8::80e8]
    db $74                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42
                                            ; [$PRG8::80e9]
    db $81                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_43
                                            ; [$PRG8::80ea]
    db $82                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_44
                                            ; [$PRG8::80eb]
    db $83                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_45
                                            ; [$PRG8::80ec]
    db $84                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_46
                                            ; [$PRG8::80ed]
    db $85                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_47
                                            ; [$PRG8::80ee]
    db $86                                  ; SPRITE_TILES_PLAYER_ARMOR_BATTLE_SUIT_48
                                            ; [$PRG8::80ef]
    db $87                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49
                                            ; [$PRG8::80f0]
    db $88                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50
                                            ; [$PRG8::80f1]

TILES_PLAYER_ARMOR_LEATHER_WSHIELD_START:   ; [$80f2]
    db $00                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::80f2]
    db $01                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::80f3]
    db $89                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_02
                                            ; [$PRG8::80f4]
    db $8a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03
                                            ; [$PRG8::80f5]
    db $8b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_04
                                            ; [$PRG8::80f6]
    db $8c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05
                                            ; [$PRG8::80f7]
    db $06                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::80f8]
    db $07                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::80f9]
    db $08                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::80fa]
    db $09                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::80fb]
    db $0e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::80fc]
    db $13                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::80fd]
    db $14                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::80fe]
    db $49                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14
                                            ; [$PRG8::80ff]
    db $4a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15
                                            ; [$PRG8::8100]
    db $4b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8101]
    db $4c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::8102]
    db $4d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_29_WSHIELD_17
                                            ; [$PRG8::8103]
    db $4e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_30_WSHIELD_18
                                            ; [$PRG8::8104]
    db $4f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_31_WSHIELD_19
                                            ; [$PRG8::8105]
    db $50                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_32_WSHIELD_20
                                            ; [$PRG8::8106]
    db $51                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::8107]
    db $52                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8108]
    db $57                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8109]
    db $58                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::810a]
    db $59                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::810b]
    db $5a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_38_WSHIELD_26
                                            ; [$PRG8::810c]
    db $5b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_39_WSHIELD_27
                                            ; [$PRG8::810d]
    db $5c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_40_WSHIELD_28
                                            ; [$PRG8::810e]
    db $5d                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_41_WSHIELD_29
                                            ; [$PRG8::810f]
    db $5e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::8110]
    db $5f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::8111]
    db $75                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::8112]
    db $76                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::8113]
    db $77                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_46_WSHIELD_34__STUDDED_052
                                            ; [$PRG8::8114]
    db $78                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_47_WSHIELD_35
                                            ; [$PRG8::8115]
    db $79                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_48_WSHIELD_36
                                            ; [$PRG8::8116]
    db $7a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_49_WSHIELD_37
                                            ; [$PRG8::8117]
    db $7b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8118]
    db $7c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8119]

TILES_PLAYER_ARMOR_STUDDED_MAIL_WSHIELD_START: ; [$811a]
    db $00                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::811a]
    db $01                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::811b]
    db $8d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_02__FULL_PLATE_WSHIELD_02
                                            ; [$PRG8::811c]
    db $8a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03
                                            ; [$PRG8::811d]
    db $8e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_04__FULL_PLATE_WSHIELD_04
                                            ; [$PRG8::811e]
    db $8c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05
                                            ; [$PRG8::811f]
    db $06                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_06_WSHIELD_06__STUDDED_02_WSHIELD_06
                                            ; [$PRG8::8120]
    db $07                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_07_WSHIELD_07__STUDDED_03_WSHIELD_07
                                            ; [$PRG8::8121]
    db $08                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::8122]
    db $09                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::8123]
    db $0e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_14_WSHIELD_10__STUDDED_06_WSHIELD_10
                                            ; [$PRG8::8124]
    db $13                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_19_WSHIELD_11__STUDDED_07_WSHIELD_11
                                            ; [$PRG8::8125]
    db $14                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_20_WSHIELD_12__STUDDED_08_WSHIELD_12
                                            ; [$PRG8::8126]
    db $49                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14
                                            ; [$PRG8::8127]
    db $4a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15
                                            ; [$PRG8::8128]
    db $4b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8129]
    db $4c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::812a]
    db $53                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::812b]
    db $54                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::812c]
    db $55                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::812d]
    db $56                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::812e]
    db $51                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_33_WSHIELD_21__STUDDED_29_WSHIELD_21
                                            ; [$PRG8::812f]
    db $52                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_34_WSHIELD_22__STUDDED_30_WSHIELD_22
                                            ; [$PRG8::8130]
    db $57                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::8131]
    db $58                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::8132]
    db $59                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::8133]
    db $60                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::8134]
    db $61                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::8135]
    db $62                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::8136]
    db $63                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::8137]
    db $5e                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_42_WSHIELD_30__STUDDED_38_WSHIELD_30
                                            ; [$PRG8::8138]
    db $5f                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_43_WSHIELD_31__STUDDED_39_WSHIELD_31
                                            ; [$PRG8::8139]
    db $75                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::813a]
    db $76                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::813b]
    db $7d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::813c]
    db $7e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::813d]
    db $7f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::813e]
    db $80                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::813f]
    db $7b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_50_WSHIELD_38__STUDDED_46_WSHIELD_38
                                            ; [$PRG8::8140]
    db $7c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_51_WSHIELD_39__STUDDED_47_WSHIELD_39
                                            ; [$PRG8::8141]

TILES_PLAYER_ARMOR_FULL_PLATE_WSHIELD_START: ; [$8142]
    db $00                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_00_WSHIELD_00__STUDDED_00_WSHIELD_00__FULL_PLATE_00_WSHIELD_00
                                            ; [$PRG8::8142]
    db $01                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_01_WSHIELD_01__STUDDED_01_WSHIELD_01__FULL_PLATE_01_WSHIELD_01
                                            ; [$PRG8::8143]
    db $8d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_02__FULL_PLATE_WSHIELD_02
                                            ; [$PRG8::8144]
    db $8a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_03__STUDDED_WSHIELD_03__FULL_PLATE_WSHIELD_03
                                            ; [$PRG8::8145]
    db $8e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_WSHIELD_04__FULL_PLATE_WSHIELD_04
                                            ; [$PRG8::8146]
    db $8c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_05__STUDDED_WSHIELD_05__FULL_PLATE_WSHIELD_05
                                            ; [$PRG8::8147]
    db $21                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_06_WSHIELD_06__BATTLE_SUIT_06
                                            ; [$PRG8::8148]
    db $22                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_07_WSHIELD_07__BATTLE_SUIT_07
                                            ; [$PRG8::8149]
    db $08                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_08_WSHIELD_08__STUDDED_04_WSHIELD_08__FULL_PLATE_08_WSHIELD_08
                                            ; [$PRG8::814a]
    db $09                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_09_WSHIELD_09__STUDDED_05_WSHIELD_09__FULL_PLATE_09_WSHIELD_09
                                            ; [$PRG8::814b]
    db $23                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_14_WSHIELD_10
                                            ; [$PRG8::814c]
    db $24                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_15_WSHIELD_11
                                            ; [$PRG8::814d]
    db $25                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_20_WSHIELD_12
                                            ; [$PRG8::814e]
    db $26                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_21_WSHIELD_13
                                            ; [$PRG8::814f]
    db $49                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_13__STUDDED_WSHIELD_13__FULL_PLATE_WSHIELD_14
                                            ; [$PRG8::8150]
    db $4a                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_WSHIELD_14__STUDDED_WSHIELD_14__FULL_PLATE_WSHIELD_15
                                            ; [$PRG8::8151]
    db $4b                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_27_WSHIELD_15__STUDDED_27_WSHIELD_15__FULL_PLATE_28_WSHIELD_16
                                            ; [$PRG8::8152]
    db $4c                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_28_WSHIELD_16__STUDDED_28_WSHIELD_16__FULL_PLATE_29_WSHIELD_17
                                            ; [$PRG8::8153]
    db $53                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_31_WSHIELD_17__FULL_PLATE_30_WSHIELD_18
                                            ; [$PRG8::8154]
    db $54                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_32_WSHIELD_18__FULL_PLATE_31_WSHIELD_19
                                            ; [$PRG8::8155]
    db $55                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_33_WSHIELD_19__FULL_PLATE_32_WSHIELD_20
                                            ; [$PRG8::8156]
    db $56                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_34_WSHIELD_20__FULL_PLATE_33_WSHIELD_21
                                            ; [$PRG8::8157]
    db $6a                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_34_WSHIELD_22__BATTLE_SUIT_32
                                            ; [$PRG8::8158]
    db $6b                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_35_WSHIELD_23__BATTLE_SUIT_33
                                            ; [$PRG8::8159]
    db $57                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_35_WSHIELD_23__STUDDED_35_WSHIELD_23__FULL_PLATE_36_WSHIELD_24
                                            ; [$PRG8::815a]
    db $58                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_36_WSHIELD_24__STUDDED_36_WSHIELD_24__FULL_PLATE_37_WSHIELD_25
                                            ; [$PRG8::815b]
    db $59                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_37_WSHIELD_25__STUDDED_37_WSHIELD_25__FULL_PLATE_38_WSHIELD_26
                                            ; [$PRG8::815c]
    db $60                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_40_WSHIELD_26__FULL_PLATE_39_WSHIELD_27
                                            ; [$PRG8::815d]
    db $61                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_41_WSHIELD_27__FULL_PLATE_40_WSHIELD_28
                                            ; [$PRG8::815e]
    db $62                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_42_WSHIELD_28__FULL_PLATE_41_WSHIELD_29
                                            ; [$PRG8::815f]
    db $63                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_43_WSHIELD_29__FULL_PLATE_42_WSHIELD_30
                                            ; [$PRG8::8160]
    db $73                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_43_WSHIELD_31__BATTLE_SUIT_41
                                            ; [$PRG8::8161]
    db $74                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_44_WSHIELD_32__BATTLE_SUIT_42
                                            ; [$PRG8::8162]
    db $75                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_44_WSHIELD_32__STUDDED_44_WSHIELD_32__FULL_PLATE_45_WSHIELD_33
                                            ; [$PRG8::8163]
    db $76                                  ; SPRITE_TILES_PLAYER_ARMOR_LEATHER_45_WSHIELD_33__STUDDED_45_WSHIELD_33__FULL_PLATE_46_WSHIELD_34
                                            ; [$PRG8::8164]
    db $7d                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_48_WSHIELD_34__FULL_PLATE_47_WSHIELD_35
                                            ; [$PRG8::8165]
    db $7e                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_49_WSHIELD_35__FULL_PLATE_48_WSHIELD_36
                                            ; [$PRG8::8166]
    db $7f                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_50_WSHIELD_36__FULL_PLATE_49_WSHIELD_37
                                            ; [$PRG8::8167]
    db $80                                  ; SPRITE_TILES_PLAYER_ARMOR_STUDDED_51_WSHIELD_37__FULL_PLATE_50_WSHIELD_38
                                            ; [$PRG8::8168]
    db $87                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_51_WSHIELD_39__BATTLE_SUIT_49
                                            ; [$PRG8::8169]
    db $88                                  ; SPRITE_TILES_PLAYER_ARMOR_FULL_PLATE_52_WSHIELD_40__BATTLE_SUIT_50
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
    dw $0173                                ; TILES_DAGGER_TILE_IDS
                                            ; [$PRG8::816b]
    dw $0176                                ; TILES_LONG_SWORD_TILE_IDS
                                            ; [$PRG8::816d]
    dw $017c                                ; TILES_GIANT_BLADE_TILE_IDS
                                            ; [$PRG8::816f]
    dw $0183                                ; TILES_DRAGON_SLAYER_TILE_IDS
                                            ; [$PRG8::8171]


;
; Dagger Tiles
;
;
; XREFS:
;     TILES_PLAYER_WEAPON_ADDRS_INDEX [$PRG8::816b]
;
TILES_DAGGER_TILE_IDS:                      ; [$8173]
    db $12                                  ; TILE_DAGGER_01
                                            ; [$PRG8::8173]
    db $00                                  ; TILES_WEAPONS_START_DAGGER_02
                                            ; [$PRG8::8174]
    db $09                                  ; TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7
                                            ; [$PRG8::8175]


;
; Long Sword Tiles
;
TILES_LONG_SWORD_TILE_IDS:                  ; [$8176]
    db $0e                                  ; TILE_LONG_SWORD_01
                                            ; [$PRG8::8176]
    db $0f                                  ; TILE_LONG_SWORD_02
                                            ; [$PRG8::8177]
    db $01                                  ; TILE_LONG_SWORD_03
                                            ; [$PRG8::8178]
    db $02                                  ; TILE_LONG_SWORD_04
                                            ; [$PRG8::8179]
    db $0a                                  ; TILE_LONG_SWORD_05
                                            ; [$PRG8::817a]
    db $09                                  ; TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7
                                            ; [$PRG8::817b]


;
; Giant Blade Tiles
;
TILES_GIANT_BLADE_TILE_IDS:                 ; [$817c]
    db $10                                  ; TILE_GIANT_BLADE_01
                                            ; [$PRG8::817c]
    db $11                                  ; TILE_GIANT_BLADE_02
                                            ; [$PRG8::817d]
    db $03                                  ; TILE_GIANT_BLADE_03
                                            ; [$PRG8::817e]
    db $04                                  ; TILE_GIANT_BLADE_04
                                            ; [$PRG8::817f]
    db $05                                  ; TILE_GIANT_BLADE_05
                                            ; [$PRG8::8180]
    db $0b                                  ; TILE_GIANT_BLADE_06
                                            ; [$PRG8::8181]
    db $09                                  ; TILE_DAGGER_03_LONG_SWORD_06_GIANT_BLADE_7
                                            ; [$PRG8::8182]


;
; Dragon Slayer Tiles
;
TILES_DRAGON_SLAYER_TILE_IDS:               ; [$8183]
    db $0d                                  ; TILE_DRAGON_SLAYER_01
                                            ; [$PRG8::8183]
    db $13                                  ; TILE_DRAGON_SLAYER_02
                                            ; [$PRG8::8184]
    db $14                                  ; TILE_DRAGON_SLAYER_03
                                            ; [$PRG8::8185]
    db $15                                  ; TILE_DRAGON_SLAYER_04
                                            ; [$PRG8::8186]
    db $16                                  ; TILE_DRAGON_SLAYER_05
                                            ; [$PRG8::8187]
    db $06                                  ; TILE_DRAGON_SLAYER_06
                                            ; [$PRG8::8188]
    db $07                                  ; TILE_DRAGON_SLAYER_07
                                            ; [$PRG8::8189]
    db $08                                  ; TILE_DRAGON_SLAYER_08
                                            ; [$PRG8::818a]
    db $0c                                  ; TILE_DRAGON_SLAYER_09
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
    dw $0192                                ; TILES_SHIELDS_SMALL
                                            ; [$PRG8::818c]
    dw $0198                                ; TILES_SHIELDS_LARGE
                                            ; [$PRG8::818e]
    dw $019e                                ; TILES_SHIELDS_MAGIC
                                            ; [$PRG8::8190]


;
; Small Shield Tiles
;
;
; XREFS:
;     TILES_SHIELDS_ADDRS_INDEX [$PRG8::818c]
;
TILES_SHIELDS_SMALL:                        ; [$8192]
    db $00                                  ; TILES_SHIELDS_START_SMALL_SHIELD_01
                                            ; [$PRG8::8192]
    db $01                                  ; TILE_SMALL_SHIELD_02
                                            ; [$PRG8::8193]
    db $06                                  ; TILE_SMALL_SHIELD_03
                                            ; [$PRG8::8194]
    db $07                                  ; TILE_SMALL_SHIELD_04
                                            ; [$PRG8::8195]
    db $0c                                  ; TILE_SMALL_SHIELD_05
                                            ; [$PRG8::8196]
    db $0d                                  ; TILE_SMALL_SHIELD_06
                                            ; [$PRG8::8197]


;
; Large Shield Tiles
;
TILES_SHIELDS_LARGE:                        ; [$8198]
    db $02                                  ; TILE_LARGE_SHIELD_01
                                            ; [$PRG8::8198]
    db $03                                  ; TILE_LARGE_SHIELD_02
                                            ; [$PRG8::8199]
    db $08                                  ; TILE_LARGE_SHIELD_03
                                            ; [$PRG8::819a]
    db $09                                  ; TILE_LARGE_SHIELD_04
                                            ; [$PRG8::819b]
    db $0e                                  ; TILE_LARGE_SHIELD_05
                                            ; [$PRG8::819c]
    db $0f                                  ; TILE_LARGE_SHIELD_06
                                            ; [$PRG8::819d]


;
; Magic Shield Tiles
;
TILES_SHIELDS_MAGIC:                        ; [$819e]
    db $04                                  ; TILE_MAGIC_SHIELD_01
                                            ; [$PRG8::819e]
    db $05                                  ; TILE_MAGIC_SHIELD_02
                                            ; [$PRG8::819f]
    db $0a                                  ; TILE_MAGIC_SHIELD_03
                                            ; [$PRG8::81a0]
    db $0b                                  ; TILE_MAGIC_SHIELD_04
                                            ; [$PRG8::81a1]
    db $10                                  ; TILE_MAGIC_SHIELD_05
                                            ; [$PRG8::81a2]
    db $11                                  ; TILE_MAGIC_SHIELD_06
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
    db $00,$3e,$5f,$4f,$1f,$1f,$5b,$03,$00,$00,$20,$30,$38,$2a,$7e,$3c ; [$81a4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$80,$c0,$80,$c0,$00,$00,$00,$00,$00,$00,$00,$00 ; [$81b4]
                                                                       ; byte


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
    db $07,$3f,$0b,$1f,$1e,$0f,$0c,$5f,$38,$01,$17,$1e,$1d,$1e,$1f,$e0 ; [$81c4]
                                                                       ; byte


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
    db $80,$80,$e0,$d0,$70,$a8,$58,$f8,$00,$c0,$00,$e0,$e0,$70,$b0,$30 ; [$81d4]
                                                                       ; byte


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
    db $9e,$ff,$1c,$0e,$1f,$0b,$39,$33,$ef,$00,$0f,$1f,$03,$1c,$1e,$3c ; [$81e4]
                                                                       ; byte


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
    db $f8,$f0,$e0,$40,$40,$c0,$80,$80,$30,$30,$70,$a0,$80,$00,$00,$00 ; [$81f4]
                                                                       ; byte


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
    db $27,$2a,$69,$68,$68,$68,$68,$c8,$78,$71,$31,$30,$30,$30,$70,$f0 ; [$8204]
                                                                       ; byte


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
    db $80,$c0,$20,$80,$10,$40,$50,$a0,$00,$00,$c0,$e0,$60,$70,$60,$c0 ; [$8214]
                                                                       ; byte


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
    db $3e,$5f,$4f,$1f,$1f,$43,$13,$07,$00,$20,$30,$38,$2a,$7e,$3c,$38 ; [$8224]
                                                                       ; byte


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
    db $00,$00,$00,$80,$c0,$80,$c0,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$8234]
                                                                       ; byte


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
    db $3b,$0f,$10,$0b,$0b,$17,$0e,$1c,$07,$07,$0f,$1f,$1f,$1b,$17,$0f ; [$8244]
                                                                       ; byte


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
    db $80,$c0,$c0,$40,$40,$40,$40,$c0,$00,$80,$00,$80,$80,$80,$80,$00 ; [$8254]
                                                                       ; byte


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
    db $39,$22,$1e,$0e,$08,$19,$1d,$1d,$1e,$1d,$03,$1f,$17,$0e,$0e,$0e ; [$8264]
                                                                       ; byte


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
    db $80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$8274]
                                                                       ; byte


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
    db $18,$0d,$0d,$0d,$0c,$0c,$1e,$18,$0e,$0e,$06,$06,$07,$07,$0f,$1e ; [$8284]
                                                                       ; byte


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
    db $07,$0f,$0e,$0e,$1d,$09,$3b,$35,$38,$06,$03,$0d,$0e,$1e,$1c,$7a ; [$8294]
                                                                       ; byte


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
    db $80,$c0,$c0,$e0,$e0,$f0,$f0,$f0,$00,$00,$00,$00,$00,$00,$00,$00 ; [$82a4]
                                                                       ; byte


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
    db $49,$9f,$dc,$0e,$1f,$1b,$1e,$1e,$f6,$e0,$0f,$1f,$0f,$04,$17,$37 ; [$82b4]
                                                                       ; byte


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
    db $90,$d0,$f0,$c0,$40,$c0,$80,$80,$20,$60,$00,$00,$80,$00,$00,$00 ; [$82c4]
                                                                       ; byte


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
    db $36,$27,$2b,$28,$28,$28,$68,$08,$3b,$7b,$71,$31,$30,$30,$70,$f0 ; [$82d4]
                                                                       ; byte


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
    db $00,$40,$00,$a0,$10,$40,$50,$20,$80,$80,$c0,$c0,$e0,$70,$60,$c0 ; [$82e4]
                                                                       ; byte


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
    db $07,$3f,$0d,$3f,$3d,$09,$1f,$ff,$38,$01,$12,$16,$16,$16,$00,$40 ; [$82f4]
                                                                       ; byte


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
    db $c0,$e0,$f0,$f0,$70,$a8,$d8,$f8,$00,$c0,$e0,$00,$e0,$70,$30,$30 ; [$8304]
                                                                       ; byte


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
    db $9c,$ff,$1b,$0f,$0f,$17,$39,$33,$ef,$00,$05,$15,$15,$08,$1e,$3c ; [$8314]
                                                                       ; byte


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
    db $f8,$f0,$e0,$e0,$80,$00,$80,$80,$30,$70,$70,$00,$40,$c0,$00,$00 ; [$8324]
                                                                       ; byte


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
    db $3f,$0f,$17,$15,$07,$0f,$1e,$1c,$03,$03,$08,$1b,$1b,$13,$07,$0f ; [$8334]
                                                                       ; byte


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
    db $40,$c0,$c0,$40,$40,$40,$80,$80,$80,$80,$00,$80,$80,$80,$00,$00 ; [$8344]
                                                                       ; byte


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
    db $39,$26,$1e,$1e,$1f,$19,$1d,$1d,$1e,$19,$05,$15,$00,$0e,$0e,$0e ; [$8354]
                                                                       ; byte


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
    db $80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$8364]
                                                                       ; byte


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
    db $09,$1e,$0e,$0e,$1d,$09,$32,$3c,$36,$0f,$03,$0d,$0e,$1e,$0d,$73 ; [$8374]
                                                                       ; byte


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
    db $80,$c0,$80,$e0,$a0,$70,$50,$70,$00,$00,$40,$00,$40,$80,$a0,$80 ; [$8384]
                                                                       ; byte


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
    db $48,$9f,$de,$0f,$0f,$17,$1e,$1e,$f7,$e0,$05,$15,$15,$08,$17,$37 ; [$8394]
                                                                       ; byte


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
    db $90,$d0,$f0,$c0,$40,$c0,$80,$80,$20,$60,$00,$00,$80,$00,$00,$00 ; [$83a4]
                                                                       ; byte


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
    db $3f,$3c,$34,$34,$34,$3c,$24,$64,$38,$21,$08,$18,$18,$00,$38,$78 ; [$83b4]
                                                                       ; byte


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
    db $c0,$e0,$f0,$78,$38,$20,$28,$50,$00,$80,$a0,$30,$20,$18,$30,$60 ; [$83c4]
                                                                       ; byte


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
    db $0e,$0e,$04,$06,$06,$07,$0f,$0c,$0d,$09,$03,$03,$03,$00,$07,$0f ; [$83d4]
                                                                       ; byte


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
    db $00,$80,$80,$80,$00,$80,$00,$00,$00,$00,$00,$00,$80,$00,$80,$00 ; [$83e4]
                                                                       ; byte


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
    db $1b,$1f,$1d,$14,$14,$14,$34,$04,$15,$18,$11,$08,$18,$18,$38,$78 ; [$83f4]
                                                                       ; byte


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
    db $00,$e0,$c0,$d0,$68,$24,$28,$10,$c0,$00,$a0,$60,$70,$38,$30,$60 ; [$8404]
                                                                       ; byte


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
    db $c0,$a0,$a0,$e0,$a0,$20,$a0,$20,$00,$c0,$c0,$00,$c0,$c0,$c0,$c0 ; [$8414]
                                                                       ; byte


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
    db $40,$80,$80,$00,$00,$00,$00,$00,$80,$00,$00,$80,$80,$00,$00,$00 ; [$8424]
                                                                       ; byte


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
    db $07,$0f,$1b,$1f,$3e,$0f,$96,$3f,$38,$01,$17,$3e,$1f,$1e,$cf,$e0 ; [$8434]
                                                                       ; byte


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
    db $80,$80,$e0,$d0,$70,$a8,$58,$f8,$00,$c0,$00,$e0,$e0,$70,$b0,$30 ; [$8444]
                                                                       ; byte


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
    db $77,$5f,$2d,$5c,$19,$28,$16,$0b,$0d,$31,$76,$6f,$6e,$17,$09,$04 ; [$8454]
                                                                       ; byte


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
    db $c8,$10,$e0,$40,$80,$00,$00,$00,$f0,$e0,$00,$80,$00,$80,$c0,$c0 ; [$8464]
                                                                       ; byte


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
    db $04,$04,$00,$00,$00,$00,$00,$00,$06,$02,$02,$00,$00,$00,$00,$00 ; [$8474]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$40,$40,$00,$00,$00,$00,$00,$00 ; [$8484]
                                                                       ; byte


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
    db $07,$0b,$0d,$3f,$3d,$2c,$9f,$12,$38,$05,$12,$16,$16,$13,$e0,$ed ; [$8494]
                                                                       ; byte


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
    db $c0,$e0,$f0,$f0,$70,$a8,$d8,$f8,$00,$c0,$e0,$00,$e0,$70,$30,$f0 ; [$84a4]
                                                                       ; byte


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
    db $00,$2f,$3c,$3e,$3d,$1f,$07,$3d,$00,$2e,$37,$39,$3e,$00,$1b,$3e ; [$84b4]
                                                                       ; byte


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
    db $00,$00,$80,$40,$40,$c0,$c0,$c0,$00,$00,$00,$80,$80,$00,$00,$00 ; [$84c4]
                                                                       ; byte


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
    db $3f,$3f,$17,$9f,$de,$cd,$9f,$6f,$39,$33,$2a,$8a,$4b,$43,$c4,$b7 ; [$84d4]
                                                                       ; byte


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
    db $f8,$f8,$f8,$f8,$f0,$74,$fc,$7c,$a8,$78,$c8,$90,$38,$b8,$00,$98 ; [$84e4]
                                                                       ; byte


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
    db $ee,$7f,$17,$0f,$0f,$05,$09,$3b,$57,$20,$0a,$02,$00,$0e,$1e,$24 ; [$84f4]
                                                                       ; byte


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
    db $7c,$ec,$c8,$70,$e0,$a0,$c0,$c0,$a8,$70,$70,$80,$80,$40,$00,$00 ; [$8504]
                                                                       ; byte


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
    db $2f,$3c,$3e,$3d,$1f,$07,$3d,$3f,$2e,$37,$39,$3e,$00,$1b,$3e,$39 ; [$8514]
                                                                       ; byte


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
    db $00,$80,$40,$40,$c0,$c0,$e0,$c0,$00,$00,$80,$80,$00,$00,$a0,$e0 ; [$8524]
                                                                       ; byte


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
    db $2e,$0f,$0f,$0f,$03,$8f,$6f,$17,$33,$20,$05,$0d,$0d,$81,$e2,$6f ; [$8534]
                                                                       ; byte


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
    db $e0,$70,$a0,$a0,$a0,$e0,$c0,$c0,$30,$80,$c0,$c0,$c0,$00,$80,$00 ; [$8544]
                                                                       ; byte


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
    db $1c,$13,$0f,$0f,$07,$0e,$0e,$0e,$0f,$0c,$02,$0a,$08,$07,$07,$0b ; [$8554]
                                                                       ; byte


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
    db $c0,$40,$40,$40,$c0,$80,$80,$80,$00,$80,$80,$80,$00,$00,$00,$00 ; [$8564]
                                                                       ; byte


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
    db $0e,$0e,$04,$06,$06,$07,$0f,$0c,$0d,$09,$03,$03,$03,$00,$07,$0f ; [$8574]
                                                                       ; byte


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
    db $00,$80,$80,$80,$00,$80,$00,$00,$00,$00,$00,$00,$80,$00,$80,$00 ; [$8584]
                                                                       ; byte


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
    db $3f,$3f,$0f,$06,$07,$0e,$1d,$8f,$3a,$33,$24,$03,$07,$0b,$0a,$74 ; [$8594]
                                                                       ; byte


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
    db $c0,$e0,$f0,$f0,$f8,$ac,$b0,$6c,$80,$a0,$c0,$40,$00,$50,$4c,$80 ; [$85a4]
                                                                       ; byte


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
    db $f6,$8f,$7f,$07,$0f,$0b,$0f,$1f,$79,$70,$02,$0a,$0a,$04,$0b,$0b ; [$85b4]
                                                                       ; byte


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
    db $f0,$d6,$ec,$e8,$a0,$e0,$40,$40,$0c,$1a,$00,$80,$c0,$00,$80,$80 ; [$85c4]
                                                                       ; byte


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
    db $1b,$1f,$1d,$14,$14,$14,$34,$04,$15,$18,$11,$08,$18,$18,$38,$78 ; [$85d4]
                                                                       ; byte


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
    db $40,$c0,$e0,$d0,$68,$28,$28,$10,$80,$00,$80,$60,$70,$30,$30,$60 ; [$85e4]
                                                                       ; byte


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
    db $ee,$7e,$1f,$39,$73,$7c,$64,$32,$55,$21,$0c,$1e,$5c,$60,$58,$1c ; [$85f4]
                                                                       ; byte


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
    db $fc,$0c,$f8,$30,$90,$50,$e4,$fb,$e8,$f0,$00,$c0,$e0,$e0,$1a,$de ; [$8604]
                                                                       ; byte


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
    db $1b,$0f,$06,$00,$00,$00,$00,$00,$0c,$02,$03,$03,$01,$00,$00,$00 ; [$8614]
                                                                       ; byte


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
    db $65,$07,$01,$00,$00,$00,$00,$00,$5a,$02,$02,$01,$00,$00,$00,$00 ; [$8624]
                                                                       ; byte


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
    db $1c,$0a,$06,$01,$01,$00,$00,$00,$0f,$07,$01,$02,$02,$00,$00,$00 ; [$8634]
                                                                       ; byte


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
    db $80,$40,$40,$40,$00,$00,$00,$00,$00,$80,$80,$80,$80,$00,$00,$00 ; [$8644]
                                                                       ; byte


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
    db $00,$07,$0f,$0b,$05,$06,$06,$00,$00,$00,$00,$04,$06,$03,$0f,$07 ; [$8654]
                                                                       ; byte


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
    db $00,$c0,$e0,$e0,$f0,$b8,$70,$f8,$00,$00,$00,$00,$00,$40,$80,$00 ; [$8664]
                                                                       ; byte


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
    db $01,$06,$ef,$5b,$f7,$6f,$1e,$7f,$06,$07,$db,$3f,$3b,$f3,$e7,$00 ; [$8674]
                                                                       ; byte


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
    db $e0,$60,$18,$08,$0c,$0b,$11,$ff,$00,$80,$e0,$f4,$f6,$f6,$e6,$08 ; [$8684]
                                                                       ; byte


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
    db $0c,$0f,$1e,$0e,$1d,$1f,$33,$67,$07,$00,$0f,$1f,$03,$18,$3c,$38 ; [$8694]
                                                                       ; byte


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
    db $6e,$e6,$00,$00,$20,$40,$e0,$e0,$81,$00,$e0,$e0,$c0,$a0,$00,$00 ; [$86a4]
                                                                       ; byte


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
    db $4d,$59,$69,$68,$48,$50,$50,$90,$70,$60,$70,$70,$70,$60,$e0,$e0 ; [$86b4]
                                                                       ; byte


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
    db $e0,$60,$20,$d0,$68,$28,$24,$6c,$00,$80,$c0,$e0,$70,$30,$38,$70 ; [$86c4]
                                                                       ; byte


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
    db $01,$0e,$ef,$5b,$f7,$6f,$1e,$7f,$06,$0f,$d7,$3d,$3a,$f3,$e7,$00 ; [$86d4]
                                                                       ; byte


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
    db $e0,$e8,$bc,$ac,$4c,$4b,$51,$ff,$00,$10,$4c,$50,$b6,$b6,$a6,$08 ; [$86e4]
                                                                       ; byte


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
    db $0c,$0f,$1f,$0f,$1d,$1f,$33,$67,$07,$00,$0a,$1a,$02,$18,$3c,$38 ; [$86f4]
                                                                       ; byte


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
    db $6e,$e6,$c0,$c0,$60,$40,$e0,$e0,$81,$00,$a0,$a0,$80,$a0,$00,$00 ; [$8704]
                                                                       ; byte


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
    db $00,$00,$78,$be,$9f,$4b,$6b,$e7,$00,$00,$00,$40,$60,$74,$34,$f8 ; [$8714]
                                                                       ; byte


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
    db $00,$00,$00,$00,$80,$00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$8724]
                                                                       ; byte


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
    db $00,$00,$00,$20,$b8,$e9,$34,$4f,$00,$00,$00,$20,$20,$5f,$4b,$00 ; [$8734]
                                                                       ; byte


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
    db $07,$0f,$1f,$3f,$7d,$fc,$3c,$f0,$78,$73,$06,$66,$be,$bf,$df,$0f ; [$8744]
                                                                       ; byte


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
    db $00,$20,$d8,$34,$84,$f4,$64,$f4,$00,$c0,$e0,$f8,$78,$18,$98,$18 ; [$8754]
                                                                       ; byte


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
    db $0f,$0e,$0f,$0c,$1e,$1b,$19,$33,$00,$07,$00,$0f,$03,$0c,$1e,$3c ; [$8764]
                                                                       ; byte


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
    db $d4,$60,$e0,$e0,$60,$60,$e0,$e0,$38,$98,$00,$00,$80,$80,$00,$00 ; [$8774]
                                                                       ; byte


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
    db $2c,$34,$10,$1a,$0a,$0a,$1a,$02,$30,$38,$1c,$1c,$0c,$0c,$1c,$3c ; [$8784]
                                                                       ; byte


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
    db $e0,$30,$48,$20,$34,$10,$12,$22,$00,$c0,$70,$38,$38,$1c,$1c,$3c ; [$8794]
                                                                       ; byte


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
    db $07,$0f,$7f,$1f,$7d,$bf,$2e,$ff,$78,$71,$03,$60,$83,$db,$db,$00 ; [$87a4]
                                                                       ; byte


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
    db $c0,$e0,$c8,$b4,$9c,$f4,$f4,$f4,$00,$c0,$b0,$78,$78,$18,$18,$08 ; [$87b4]
                                                                       ; byte


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
    db $0e,$0f,$0f,$0f,$0f,$0d,$19,$23,$07,$00,$02,$0a,$00,$0e,$1e,$3c ; [$87c4]
                                                                       ; byte


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
    db $74,$f8,$60,$e0,$60,$e0,$e0,$e0,$98,$00,$80,$80,$80,$00,$00,$00 ; [$87d4]
                                                                       ; byte


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
    db $00,$0b,$0f,$0f,$0f,$0f,$0f,$0f,$00,$0b,$0d,$0e,$0f,$00,$00,$0f ; [$87e4]
                                                                       ; byte


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
    db $00,$c0,$20,$80,$50,$f0,$b0,$60,$00,$80,$c0,$60,$a0,$00,$c0,$80 ; [$87f4]
                                                                       ; byte


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
    db $1f,$3a,$3d,$7d,$f5,$6e,$3c,$ec,$00,$1d,$0e,$56,$ba,$d1,$c7,$0f ; [$8804]
                                                                       ; byte


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
    db $e0,$5c,$ce,$4d,$4b,$57,$ff,$fa,$18,$ac,$b0,$b6,$b6,$a0,$00,$15 ; [$8814]
                                                                       ; byte


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
    db $0f,$0e,$0f,$1f,$1f,$37,$63,$57,$08,$07,$08,$1a,$02,$38,$5c,$68 ; [$8824]
                                                                       ; byte


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
    db $ae,$a0,$e0,$40,$c0,$60,$e0,$60,$40,$40,$00,$a0,$a0,$80,$00,$80 ; [$8834]
                                                                       ; byte


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
    db $59,$70,$48,$48,$48,$38,$c8,$c8,$20,$40,$70,$70,$70,$00,$70,$f0 ; [$8844]
                                                                       ; byte


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
    db $e0,$e0,$b0,$78,$08,$3c,$64,$64,$80,$00,$c0,$60,$30,$00,$38,$78 ; [$8854]
                                                                       ; byte


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
    db $3f,$3f,$17,$1f,$1e,$cd,$ff,$6f,$39,$33,$2a,$0a,$0b,$83,$44,$d7 ; [$8864]
                                                                       ; byte


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
    db $00,$bc,$f2,$f9,$f5,$ff,$1f,$f7,$00,$b8,$dc,$e6,$fa,$00,$6c,$f8 ; [$8874]
                                                                       ; byte


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
    db $00,$00,$00,$c0,$ff,$f7,$e5,$0f,$00,$00,$80,$40,$d9,$49,$9a,$00 ; [$8884]
                                                                       ; byte


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
    db $ef,$ff,$fb,$7f,$fe,$ec,$3f,$ec,$f0,$c2,$8d,$2c,$af,$b7,$d0,$07 ; [$8894]
                                                                       ; byte


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
    db $d0,$f0,$40,$b8,$fc,$dc,$f8,$f8,$a0,$f0,$b0,$78,$74,$28,$1c,$1c ; [$88a4]
                                                                       ; byte


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
    db $0a,$07,$0f,$0f,$0f,$0c,$18,$33,$07,$00,$02,$0a,$00,$0f,$1f,$2c ; [$88b4]
                                                                       ; byte


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
    db $7c,$fc,$fc,$f0,$f0,$e0,$e0,$e0,$98,$00,$98,$98,$80,$00,$00,$00 ; [$88c4]
                                                                       ; byte


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
    db $3f,$36,$1a,$1a,$0a,$0e,$19,$21,$30,$08,$1c,$0c,$0c,$00,$1e,$3e ; [$88d4]
                                                                       ; byte


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
    db $f0,$f8,$78,$2c,$16,$0e,$0b,$17,$00,$00,$40,$10,$18,$00,$1c,$38 ; [$88e4]
                                                                       ; byte


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
    db $00,$0b,$2f,$2f,$d7,$d7,$d7,$af,$00,$30,$70,$70,$60,$60,$60,$70 ; [$88f4]
                                                                       ; byte


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
    db $00,$c0,$e0,$e0,$f0,$f0,$f0,$ec,$00,$00,$00,$00,$00,$00,$00,$08 ; [$8904]
                                                                       ; byte


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
    db $6b,$4d,$2e,$17,$1b,$08,$0f,$0b,$34,$36,$17,$0f,$07,$07,$00,$07 ; [$8914]
                                                                       ; byte


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
    db $e6,$de,$7c,$e4,$c8,$1e,$e4,$a0,$0c,$34,$f6,$fe,$f6,$e0,$00,$c0 ; [$8924]
                                                                       ; byte


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
    db $0f,$3f,$0b,$2c,$3f,$29,$35,$14,$08,$17,$37,$13,$00,$10,$18,$18 ; [$8934]
                                                                       ; byte


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
    db $e0,$c0,$a0,$60,$e0,$a0,$60,$60,$20,$e0,$c0,$80,$00,$40,$c0,$c0 ; [$8944]
                                                                       ; byte


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
    db $0c,$3c,$24,$18,$00,$00,$00,$00,$18,$28,$18,$00,$00,$00,$00,$00 ; [$8954]
                                                                       ; byte


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
    db $20,$60,$20,$60,$70,$30,$20,$c0,$c0,$80,$c0,$c0,$c0,$c0,$c0,$00 ; [$8964]
                                                                       ; byte


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
    db $7b,$5d,$3e,$17,$13,$08,$0f,$0b,$2c,$2e,$01,$0e,$0e,$07,$00,$07 ; [$8974]
                                                                       ; byte


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
    db $fe,$fe,$7c,$ec,$c8,$1e,$e4,$a0,$04,$34,$86,$f6,$f6,$e0,$00,$c0 ; [$8984]
                                                                       ; byte


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
    db $07,$37,$03,$2b,$3f,$29,$35,$14,$08,$1d,$3d,$15,$00,$10,$18,$18 ; [$8994]
                                                                       ; byte


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
    db $e0,$e0,$e0,$a0,$e0,$a0,$60,$60,$00,$40,$40,$40,$00,$40,$c0,$c0 ; [$89a4]
                                                                       ; byte


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
    db $00,$0b,$2c,$59,$db,$f9,$d8,$de,$00,$30,$73,$67,$67,$07,$67,$63 ; [$89b4]
                                                                       ; byte


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
    db $00,$c0,$20,$90,$d0,$90,$10,$6c,$00,$00,$c0,$e0,$e0,$e0,$e0,$c8 ; [$89c4]
                                                                       ; byte


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
    db $ab,$7f,$7f,$35,$14,$09,$0f,$0b,$5d,$5c,$21,$0e,$0f,$07,$00,$07 ; [$89d4]
                                                                       ; byte


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
    db $ce,$fe,$fc,$ae,$28,$9a,$ec,$20,$b0,$38,$82,$74,$f6,$e4,$00,$c0 ; [$89e4]
                                                                       ; byte


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
    db $07,$37,$73,$3b,$7f,$2d,$35,$15,$08,$1d,$0d,$65,$00,$10,$18,$18 ; [$89f4]
                                                                       ; byte


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
    db $e0,$e0,$e0,$a0,$e0,$a0,$a0,$a0,$00,$40,$40,$40,$00,$40,$c0,$c0 ; [$8a04]
                                                                       ; byte


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
    db $1d,$3d,$1d,$05,$01,$01,$01,$00,$00,$28,$38,$18,$00,$00,$00,$00 ; [$8a14]
                                                                       ; byte


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
    db $c0,$80,$e0,$a0,$b0,$f0,$a0,$c0,$20,$e0,$00,$c0,$c0,$00,$c0,$00 ; [$8a24]
                                                                       ; byte


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
    db $27,$1f,$0b,$0e,$0f,$07,$07,$07,$18,$01,$06,$05,$05,$05,$01,$07 ; [$8a34]
                                                                       ; byte


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
    db $c0,$a0,$a0,$e0,$a0,$20,$a0,$20,$00,$c0,$c0,$00,$c0,$c0,$c0,$c0 ; [$8a44]
                                                                       ; byte


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
    db $00,$07,$0f,$1e,$1f,$1f,$07,$13,$07,$00,$00,$07,$03,$00,$18,$1c ; [$8a54]
                                                                       ; byte


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
    db $40,$80,$80,$00,$00,$00,$00,$00,$80,$00,$00,$80,$80,$00,$00,$00 ; [$8a64]
                                                                       ; byte


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
    db $21,$1f,$1f,$1f,$07,$07,$07,$07,$1e,$03,$01,$0c,$0d,$05,$00,$07 ; [$8a74]
                                                                       ; byte


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
    db $00,$07,$0d,$1f,$37,$3f,$3f,$33,$07,$00,$02,$02,$0a,$08,$00,$0c ; [$8a84]
                                                                       ; byte


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
    db $10,$18,$08,$0c,$06,$03,$03,$05,$10,$08,$0c,$04,$04,$05,$02,$05 ; [$8a94]
                                                                       ; byte


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
    db $80,$80,$c0,$c0,$60,$60,$30,$38,$80,$c0,$c0,$60,$60,$30,$30,$10 ; [$8aa4]
                                                                       ; byte


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
    db $18,$18,$08,$0c,$06,$03,$03,$05,$18,$08,$0c,$04,$04,$05,$02,$05 ; [$8ab4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00 ; [$8ac4]
                                                                       ; byte


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
    db $00,$80,$48,$e8,$48,$74,$ac,$78,$80,$80,$c8,$48,$64,$24,$bc,$f8 ; [$8ad4]
                                                                       ; byte


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
    db $38,$18,$08,$0c,$06,$05,$03,$06,$78,$08,$0c,$04,$04,$03,$02,$05 ; [$8ae4]
                                                                       ; byte


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
    db $00,$18,$0c,$06,$03,$01,$00,$00,$00,$18,$1c,$0e,$07,$03,$01,$00 ; [$8af4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$80,$c0,$60,$00,$00,$00,$00,$00,$80,$c0,$e0 ; [$8b04]
                                                                       ; byte


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
    db $30,$10,$18,$0c,$06,$03,$07,$03,$70,$38,$0c,$06,$03,$01,$04,$03 ; [$8b14]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$06,$03,$00,$00,$00,$00,$00,$00,$04,$03 ; [$8b24]
                                                                       ; byte


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
    db $40,$60,$30,$30,$08,$04,$06,$03,$40,$20,$30,$18,$18,$0c,$06,$01 ; [$8b34]
                                                                       ; byte


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
    db $40,$64,$36,$33,$0b,$67,$3f,$1f,$40,$24,$32,$19,$19,$4d,$26,$19 ; [$8b44]
                                                                       ; byte


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
    db $00,$00,$60,$38,$0e,$01,$00,$00,$00,$00,$f0,$78,$1e,$07,$01,$00 ; [$8b54]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$7f,$18,$00,$00,$00,$00,$00,$00,$7c,$07 ; [$8b64]
                                                                       ; byte


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
    db $00,$00,$00,$38,$1f,$04,$00,$00,$00,$00,$00,$3c,$1f,$03,$00,$00 ; [$8b74]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$c0,$58,$0b,$00,$00,$00,$00,$00,$e0,$3c,$07 ; [$8b84]
                                                                       ; byte


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
    db $06,$03,$7d,$17,$02,$01,$0b,$02,$07,$01,$38,$0f,$01,$00,$1d,$07 ; [$8b94]
                                                                       ; byte


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
    db $00,$80,$80,$80,$f0,$dc,$1f,$02,$00,$80,$80,$c0,$e0,$b8,$87,$01 ; [$8ba4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$70,$1b,$0f,$03,$00,$00,$00,$00,$60,$3d,$07,$00 ; [$8bb4]
                                                                       ; byte


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
    db $00,$00,$00,$30,$1f,$03,$00,$00,$00,$00,$00,$38,$0f,$00,$00,$00 ; [$8bc4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$f0,$7f,$0d,$00,$00,$00,$00,$80,$f8,$0e,$03 ; [$8bd4]
                                                                       ; byte


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
    db $f0,$5f,$1c,$00,$00,$00,$00,$00,$f8,$3f,$03,$00,$00,$00,$00,$00 ; [$8be4]
                                                                       ; byte


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
    db $00,$00,$e1,$fd,$1f,$03,$01,$00,$00,$80,$f1,$1e,$03,$00,$01,$00 ; [$8bf4]
                                                                       ; byte


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
    db $3c,$42,$19,$a5,$a5,$19,$42,$3c,$3c,$7c,$fe,$fe,$fe,$fe,$7c,$00 ; [$8c04]
                                                                       ; byte


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
    db $18,$30,$30,$30,$30,$30,$30,$08,$10,$18,$18,$18,$18,$18,$18,$10 ; [$8c14]
                                                                       ; byte


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
    db $43,$db,$00,$52,$42,$00,$db,$c3,$81,$66,$7e,$3c,$3c,$7e,$66,$81 ; [$8c24]
                                                                       ; byte


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
    db $00,$24,$7e,$3c,$3c,$7e,$24,$00,$00,$42,$00,$10,$00,$00,$42,$00 ; [$8c34]
                                                                       ; byte


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
    db $02,$06,$04,$0c,$0c,$0c,$18,$18,$02,$06,$06,$0c,$0c,$1c,$1c,$1c ; [$8c44]
                                                                       ; byte


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
    db $03,$2d,$c9,$88,$c1,$88,$c2,$7f,$3d,$7f,$7f,$7f,$7f,$7f,$3d,$00 ; [$8c54]
                                                                       ; byte


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
    db $00,$00,$00,$06,$12,$41,$42,$81,$00,$00,$01,$0f,$3c,$70,$61,$c3 ; [$8c64]
                                                                       ; byte


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
    db $07,$1a,$c9,$48,$00,$e2,$30,$9c,$00,$3c,$f0,$80,$00,$00,$c0,$e0 ; [$8c74]
                                                                       ; byte


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
    db $00,$00,$00,$03,$04,$08,$10,$20,$00,$00,$01,$03,$06,$0c,$18,$31 ; [$8c84]
                                                                       ; byte


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
    db $0a,$58,$20,$00,$00,$05,$90,$40,$04,$20,$c0,$00,$00,$1a,$60,$80 ; [$8c94]
                                                                       ; byte


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
    db $10,$38,$44,$54,$ba,$ba,$c6,$7c,$00,$00,$38,$38,$7c,$7c,$38,$00 ; [$8ca4]
                                                                       ; byte


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
    db $03,$07,$0f,$0e,$1e,$1c,$39,$3b,$03,$07,$0f,$0f,$1e,$1c,$3d,$3b ; [$8cb4]
                                                                       ; byte


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
    db $00,$0f,$f8,$c0,$00,$3c,$f0,$e0,$00,$7f,$f8,$e0,$80,$7e,$f8,$e0 ; [$8cc4]
                                                                       ; byte


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
    db $42,$60,$33,$1d,$0f,$17,$ff,$1f,$42,$23,$30,$1b,$17,$0f,$ec,$6d ; [$8cd4]
                                                                       ; byte


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
    db $10,$20,$d0,$60,$b0,$da,$dc,$d4,$10,$30,$20,$80,$c0,$e7,$ee,$68 ; [$8ce4]
                                                                       ; byte


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
    db $68,$a0,$29,$29,$01,$21,$43,$fe,$b4,$fe,$fe,$fe,$fe,$fe,$bc,$00 ; [$8cf4]
                                                                       ; byte


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
    db $00,$10,$10,$10,$32,$53,$93,$b3,$18,$14,$14,$14,$14,$34,$74,$74 ; [$8d04]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$80,$e0,$3a,$00,$00,$00,$00,$00,$00,$00,$c0 ; [$8d14]
                                                                       ; byte


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
    db $02,$0d,$3f,$61,$4c,$be,$3f,$7f,$00,$00,$00,$1e,$3f,$7f,$ff,$ff ; [$8d24]
                                                                       ; byte


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
    db $00,$00,$10,$1c,$10,$18,$10,$1d,$00,$c0,$a0,$a0,$a0,$a0,$a0,$a0 ; [$8d34]
                                                                       ; byte


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
    db $00,$00,$00,$00,$3c,$47,$99,$bc,$00,$00,$00,$00,$00,$38,$7e,$7f ; [$8d44]
                                                                       ; byte


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
    db $00,$00,$00,$00,$06,$81,$e1,$3b,$00,$00,$00,$00,$00,$04,$04,$c4 ; [$8d54]
                                                                       ; byte


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
    db $00,$00,$0e,$3f,$7f,$63,$dc,$bf,$00,$00,$00,$00,$00,$1c,$3f,$7f ; [$8d64]
                                                                       ; byte


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
    db $00,$00,$00,$90,$00,$e1,$fc,$3a,$00,$00,$00,$00,$00,$00,$00,$c0 ; [$8d74]
                                                                       ; byte


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
    db $02,$44,$0f,$10,$a7,$2f,$5f,$5f,$23,$66,$40,$cf,$df,$9f,$bf,$bf ; [$8d84]
                                                                       ; byte


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
    db $00,$00,$16,$c8,$20,$d0,$cc,$e3,$00,$00,$08,$30,$c0,$e0,$f0,$fc ; [$8d94]
                                                                       ; byte


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
    db $10,$10,$38,$28,$44,$54,$44,$38,$00,$00,$00,$10,$38,$38,$38,$00 ; [$8da4]
                                                                       ; byte


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
    db $33,$33,$27,$26,$64,$44,$40,$40,$3b,$77,$77,$66,$66,$44,$44,$40 ; [$8db4]
                                                                       ; byte


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
    db $00,$00,$03,$0f,$3f,$7c,$f9,$e3,$00,$00,$03,$0f,$3f,$7e,$f9,$f3 ; [$8dc4]
                                                                       ; byte


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
    db $1f,$17,$08,$0c,$37,$21,$20,$00,$0e,$0f,$07,$1b,$18,$30,$40,$00 ; [$8dd4]
                                                                       ; byte


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
    db $d8,$98,$30,$e0,$58,$d8,$84,$00,$60,$e0,$c0,$10,$b8,$8c,$84,$80 ; [$8de4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$8df4]
                                                                       ; byte


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
    db $70,$fe,$ff,$f0,$6e,$6d,$6b,$26,$78,$ff,$ff,$ff,$f1,$73,$76,$7d ; [$8e04]
                                                                       ; byte


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
    db $00,$00,$80,$e0,$30,$8c,$76,$e0,$00,$00,$c0,$e0,$f8,$7c,$ce,$91 ; [$8e14]
                                                                       ; byte


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
    db $00,$3c,$7f,$7f,$78,$77,$36,$35,$00,$00,$00,$00,$07,$0f,$0f,$0e ; [$8e24]
                                                                       ; byte


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
    db $10,$18,$0f,$0e,$01,$17,$37,$37,$10,$08,$08,$05,$0f,$0f,$0f,$fe ; [$8e34]
                                                                       ; byte


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
    db $40,$00,$c4,$34,$c8,$d0,$f8,$ec,$40,$c0,$02,$cc,$f8,$e0,$26,$b0 ; [$8e44]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$01,$03,$16,$00,$00,$00,$00,$00,$00,$07,$0f ; [$8e54]
                                                                       ; byte


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
    db $00,$00,$00,$00,$1f,$f4,$a0,$00,$00,$00,$00,$00,$0f,$f8,$c0,$00 ; [$8e64]
                                                                       ; byte


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
    db $35,$13,$1b,$0a,$04,$06,$02,$00,$3b,$3e,$1c,$0d,$0e,$06,$02,$01 ; [$8e74]
                                                                       ; byte


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
    db $c0,$80,$00,$00,$00,$00,$00,$00,$20,$40,$80,$00,$00,$00,$00,$00 ; [$8e84]
                                                                       ; byte


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
    db $33,$1a,$18,$0d,$05,$06,$03,$01,$0d,$07,$07,$03,$03,$01,$00,$00 ; [$8e94]
                                                                       ; byte


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
    db $37,$0b,$00,$14,$3b,$40,$00,$00,$0e,$07,$0f,$1b,$30,$60,$00,$00 ; [$8ea4]
                                                                       ; byte


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
    db $c8,$98,$3c,$f6,$26,$e0,$60,$20,$70,$e0,$d8,$0c,$c2,$40,$60,$20 ; [$8eb4]
                                                                       ; byte


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
    db $00,$00,$80,$e0,$70,$1c,$c6,$9b,$00,$00,$00,$00,$80,$e0,$78,$fc ; [$8ec4]
                                                                       ; byte


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
    db $30,$60,$c0,$80,$00,$00,$00,$00,$e0,$c0,$80,$00,$00,$00,$00,$00 ; [$8ed4]
                                                                       ; byte


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
    db $70,$fe,$ff,$ff,$78,$70,$73,$33,$78,$ff,$ff,$ff,$f8,$70,$73,$73 ; [$8ee4]
                                                                       ; byte


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
    db $00,$00,$80,$e0,$f0,$3c,$8e,$e1,$00,$00,$c0,$e0,$f8,$3c,$8e,$e1 ; [$8ef4]
                                                                       ; byte


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
    db $3b,$19,$1d,$0c,$06,$06,$02,$01,$3b,$39,$1d,$0c,$0e,$06,$02,$01 ; [$8f04]
                                                                       ; byte


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
    db $f8,$9c,$86,$c0,$c0,$60,$20,$00,$f8,$9c,$86,$c0,$c0,$60,$20,$00 ; [$8f14]
                                                                       ; byte


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
    db $00,$10,$18,$fc,$fe,$fc,$18,$10,$00,$10,$18,$fc,$fe,$fc,$18,$10 ; [$8f24]
                                                                       ; byte


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
    db $00,$00,$ff,$7e,$3c,$18,$00,$00,$00,$00,$ff,$7e,$3c,$18,$00,$00 ; [$8f34]
                                                                       ; byte


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
    db $00,$00,$18,$3c,$7e,$ff,$00,$00,$00,$00,$18,$3c,$7e,$ff,$00,$00 ; [$8f44]
                                                                       ; byte


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
    db $3c,$66,$66,$0c,$18,$18,$00,$18,$3c,$66,$66,$0c,$18,$18,$00,$18 ; [$8f54]
                                                                       ; byte


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
    db $08,$14,$14,$14,$16,$35,$55,$55,$00,$08,$08,$08,$08,$0a,$2a,$2a ; [$8f64]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$80,$60,$50,$00,$00,$00,$00,$00,$00,$80,$a0 ; [$8f74]
                                                                       ; byte


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
    db $54,$50,$50,$40,$20,$20,$10,$10,$2b,$2f,$2f,$3f,$1f,$1f,$0f,$0f ; [$8f84]
                                                                       ; byte


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
    db $50,$10,$10,$10,$10,$10,$20,$20,$a0,$e0,$e0,$e0,$e0,$e0,$c0,$c0 ; [$8f94]
                                                                       ; byte


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
    db $1c,$38,$38,$1f,$1f,$2f,$7e,$ff,$3c,$78,$78,$3c,$03,$1e,$38,$7f ; [$8fa4]
                                                                       ; byte


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
    db $00,$00,$2e,$f8,$e0,$80,$00,$30,$00,$00,$1e,$f0,$80,$00,$00,$c0 ; [$8fb4]
                                                                       ; byte


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
    db $05,$0d,$1a,$12,$09,$04,$1b,$2c,$03,$06,$0c,$0c,$06,$03,$06,$1f ; [$8fc4]
                                                                       ; byte


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
    db $30,$80,$00,$00,$80,$00,$80,$6a,$c0,$00,$00,$00,$00,$fc,$00,$80 ; [$8fd4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$ff,$00,$00,$00,$00,$00,$00,$00,$00 ; [$8fe4]
                                                                       ; byte


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
    db $fc,$c6,$e6,$e6,$dc,$c0,$c0,$00,$fc,$c6,$e6,$e6,$dc,$c0,$c0,$00 ; [$8ff4]
                                                                       ; byte


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
    db $00,$00,$1e,$03,$09,$be,$7e,$7f,$00,$00,$00,$3c,$7e,$7f,$ff,$ff ; [$9004]
                                                                       ; byte


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
    db $00,$00,$00,$e0,$9a,$e0,$38,$5f,$00,$00,$00,$00,$00,$00,$c0,$e0 ; [$9014]
                                                                       ; byte


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
    db $7e,$7f,$bc,$15,$03,$1e,$00,$00,$ff,$ff,$7f,$7e,$3c,$00,$00,$00 ; [$9024]
                                                                       ; byte


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
    db $ac,$7e,$f0,$4c,$e0,$00,$00,$00,$f0,$c0,$00,$00,$00,$00,$00,$00 ; [$9034]
                                                                       ; byte


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
    db $00,$00,$00,$00,$3f,$43,$9c,$be,$00,$00,$00,$00,$00,$3c,$7f,$7f ; [$9044]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$80,$e0,$3c,$00,$00,$00,$00,$00,$00,$00,$c0 ; [$9054]
                                                                       ; byte


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
    db $00,$15,$2f,$3d,$58,$31,$67,$33,$00,$00,$00,$02,$07,$0f,$1f,$0f ; [$9064]
                                                                       ; byte


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
    db $05,$47,$1d,$b2,$71,$47,$ef,$0f,$00,$00,$02,$0f,$0f,$3f,$1f,$7f ; [$9074]
                                                                       ; byte


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
    db $05,$0a,$0d,$aa,$1f,$2b,$1f,$4f,$16,$57,$3f,$5f,$7f,$7f,$ff,$3f ; [$9084]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$9094]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$90a4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$90b4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$90c4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$90d4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$90e4]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$90f4]
                                                                       ; byte


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
    db $00,$e0,$d0,$f8,$c8,$e8,$c8,$e8,$00,$40,$60,$60,$70,$70,$70,$70 ; [$9104]
                                                                       ; byte


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
    db $c8,$e8,$d0,$e0,$40,$00,$00,$00,$70,$70,$60,$40,$00,$00,$00,$00 ; [$9114]
                                                                       ; byte


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
    db $00,$40,$e0,$f0,$d8,$e8,$c8,$e8,$00,$00,$40,$60,$60,$70,$70,$70 ; [$9124]
                                                                       ; byte


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
    db $c8,$e8,$c8,$f0,$e0,$40,$00,$00,$70,$70,$70,$60,$40,$00,$00,$00 ; [$9134]
                                                                       ; byte


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
    db $00,$e0,$d0,$f8,$c8,$e8,$c8,$e8,$00,$40,$60,$60,$70,$70,$70,$70 ; [$9144]
                                                                       ; byte


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
    db $c8,$e8,$c8,$e8,$d0,$f0,$60,$40,$70,$70,$70,$70,$60,$60,$40,$00 ; [$9154]
                                                                       ; byte


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
    db $00,$38,$60,$c0,$c4,$cc,$f8,$f8,$00,$20,$40,$80,$80,$80,$80,$80 ; [$9164]
                                                                       ; byte


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
    db $f8,$78,$f0,$60,$38,$20,$00,$40,$80,$80,$40,$00,$00,$00,$00,$00 ; [$9174]
                                                                       ; byte


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
    db $00,$38,$60,$c0,$c4,$cc,$f8,$f8,$00,$20,$40,$80,$80,$80,$80,$80 ; [$9184]
                                                                       ; byte


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
    db $f8,$f8,$f0,$e0,$78,$20,$00,$40,$80,$80,$80,$40,$00,$00,$00,$00 ; [$9194]
                                                                       ; byte


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
    db $30,$78,$60,$c0,$c4,$cc,$f8,$f8,$30,$60,$c0,$80,$80,$80,$80,$80 ; [$91a4]
                                                                       ; byte


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
    db $f8,$f8,$f0,$e0,$38,$60,$00,$40,$80,$80,$80,$80,$c0,$40,$00,$00 ; [$91b4]
                                                                       ; byte


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
    db $c0,$e0,$c8,$f4,$f4,$f4,$f4,$d4,$00,$c0,$b0,$38,$18,$18,$58,$68 ; [$91c4]
                                                                       ; byte


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
    db $f4,$ec,$f8,$f4,$7c,$fc,$e0,$e0,$68,$70,$30,$38,$98,$0c,$00,$00 ; [$91d4]
                                                                       ; byte


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
    db $c0,$e0,$c8,$f4,$f4,$f4,$f4,$d4,$00,$c0,$b0,$38,$18,$58,$d8,$e8 ; [$91e4]
                                                                       ; byte


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
    db $f4,$ec,$f8,$f4,$7c,$fc,$ec,$e0,$68,$70,$30,$38,$98,$1c,$06,$00 ; [$91f4]
                                                                       ; byte


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
    db $c0,$e0,$c8,$f4,$f4,$f4,$f4,$d4,$00,$c0,$b0,$38,$58,$d8,$d8,$e8 ; [$9204]
                                                                       ; byte


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
    db $f4,$ec,$f8,$f4,$7c,$fc,$ec,$ee,$68,$70,$30,$38,$98,$18,$0c,$06 ; [$9214]
                                                                       ; byte


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
    dw $123a                                ; SPRITE_TILES_PORTRAIT_ADDRS_KING
                                            ; [$PRG8::9224]
    dw $1252                                ; SPRITE_TILES_PORTRAIT_ADDRS_GURU
                                            ; [$PRG8::9226]
    dw $1265                                ; SPRITE_TILES_PORTRAIT_ADDRS_MARTIAL_ARTIST
                                            ; [$PRG8::9228]
    dw $1285                                ; SPRITE_TILES_PORTRAIT_ADDRS_MAGICIAN
                                            ; [$PRG8::922a]
    dw $1298                                ; SPRITE_TILES_PORTRAIT_ADDRS_DOCTOR
                                            ; [$PRG8::922c]
    dw $12b1                                ; SPRITE_TILES_PORTRAIT_ADDRS_NURSE
                                            ; [$PRG8::922e]
    dw $12cd                                ; SPRITE_TILES_PORTRAIT_ADDRS_PINKSHIRT
                                            ; [$PRG8::9230]
    dw $12e9                                ; SPRITE_TILES_PORTRAIT_ADDRS_SMOKING_GUY
                                            ; [$PRG8::9232]
    dw $1307                                ; SPRITE_TILES_PORTRAIT_ADDRS_MEAT_SALESMAN
                                            ; [$PRG8::9234]
    dw $132d                                ; SPRITE_TILES_PORTRAIT_ADDRS_TOOLS_SALESMAN
                                            ; [$PRG8::9236]
    dw $1343                                ; SPRITE_TILES_PORTRAIT_ADDRS_KEY_SALESMAN
                                            ; [$PRG8::9238]

;
; XREFS:
;     SPRITE_TILES_PORTRAITS_ADDRS_INDEX [$PRG8::9224]
;
SPRITE_TILES_PORTRAIT_ADDRS_KING:           ; [$923a]
    db $8a                                  ; SPRITE_TILES_PORTRAIT_KING_00
                                            ; [$PRG8::923a]
    db $8b                                  ; SPRITE_TILES_PORTRAIT_KING_01
                                            ; [$PRG8::923b]
    db $8c                                  ; SPRITE_TILES_PORTRAIT_KING_02
                                            ; [$PRG8::923c]
    db $8d                                  ; SPRITE_TILES_PORTRAIT_KING_03
                                            ; [$PRG8::923d]
    db $8e                                  ; SPRITE_TILES_PORTRAIT_KING_04
                                            ; [$PRG8::923e]
    db $8f                                  ; SPRITE_TILES_PORTRAIT_KING_05
                                            ; [$PRG8::923f]
    db $90                                  ; SPRITE_TILES_PORTRAIT_KING_06
                                            ; [$PRG8::9240]
    db $91                                  ; SPRITE_TILES_PORTRAIT_KING_07
                                            ; [$PRG8::9241]
    db $92                                  ; SPRITE_TILES_PORTRAIT_KING_08
                                            ; [$PRG8::9242]
    db $93                                  ; SPRITE_TILES_PORTRAIT_KING_09
                                            ; [$PRG8::9243]
    db $96                                  ; SPRITE_TILES_PORTRAIT_KING_10
                                            ; [$PRG8::9244]
    db $94                                  ; SPRITE_TILES_PORTRAIT_KING_11__MAGICIAN_09
                                            ; [$PRG8::9245]
    db $95                                  ; SPRITE_TILES_PORTRAIT_KING_12
                                            ; [$PRG8::9246]
    db $98                                  ; SPRITE_TILES_PORTRAIT_KING_13
                                            ; [$PRG8::9247]
    db $97                                  ; SPRITE_TILES_PORTRAIT_KING_14
                                            ; [$PRG8::9248]
    db $60                                  ; SPRITE_TILES_PORTRAIT_KING_15__MAGICIAN_10
                                            ; [$PRG8::9249]
    db $9a                                  ; SPRITE_TILES_PORTRAIT_KING_16
                                            ; [$PRG8::924a]
    db $99                                  ; SPRITE_TILES_PORTRAIT_KING_17
                                            ; [$PRG8::924b]
    db $63                                  ; SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13
                                            ; [$PRG8::924c]
    db $65                                  ; SPRITE_TILES_PORTRAIT_KING_19
                                            ; [$PRG8::924d]
    db $9b                                  ; SPRITE_TILES_PORTRAIT_KING_20
                                            ; [$PRG8::924e]
    db $9c                                  ; SPRITE_TILES_PORTRAIT_KING_21
                                            ; [$PRG8::924f]
    db $9d                                  ; SPRITE_TILES_PORTRAIT_KING_22
                                            ; [$PRG8::9250]
    db $ff                                  ; [$9251] byte

SPRITE_TILES_PORTRAIT_ADDRS_GURU:           ; [$9252]
    db $a8                                  ; SPRITE_TILES_PORTRAIT_GURU_00
                                            ; [$PRG8::9252]
    db $a9                                  ; SPRITE_TILES_PORTRAIT_GURU_01
                                            ; [$PRG8::9253]
    db $aa                                  ; SPRITE_TILES_PORTRAIT_GURU_02
                                            ; [$PRG8::9254]
    db $ab                                  ; SPRITE_TILES_PORTRAIT_GURU_03
                                            ; [$PRG8::9255]
    db $ac                                  ; SPRITE_TILES_PORTRAIT_GURU_04
                                            ; [$PRG8::9256]
    db $ad                                  ; SPRITE_TILES_PORTRAIT_GURU_05
                                            ; [$PRG8::9257]
    db $ae                                  ; SPRITE_TILES_PORTRAIT_GURU_06
                                            ; [$PRG8::9258]
    db $af                                  ; SPRITE_TILES_PORTRAIT_GURU_07
                                            ; [$PRG8::9259]
    db $29                                  ; SPRITE_TILES_PORTRAIT_GURU_08__NURSE_12
                                            ; [$PRG8::925a]
    db $f1                                  ; SPRITE_TILES_PORTRAIT_GURU_09
                                            ; [$PRG8::925b]
    db $63                                  ; SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13
                                            ; [$PRG8::925c]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::925d]
    db $f2                                  ; SPRITE_TILES_PORTRAIT_GURU_12
                                            ; [$PRG8::925e]
    db $f3                                  ; SPRITE_TILES_PORTRAIT_GURU_13
                                            ; [$PRG8::925f]
    db $f4                                  ; SPRITE_TILES_PORTRAIT_GURU_14
                                            ; [$PRG8::9260]
    db $f5                                  ; SPRITE_TILES_PORTRAIT_GURU_15
                                            ; [$PRG8::9261]
    db $b0                                  ; SPRITE_TILES_PORTRAIT_GURU_16
                                            ; [$PRG8::9262]
    db $b1                                  ; SPRITE_TILES_PORTRAIT_GURU_17
                                            ; [$PRG8::9263]
    db $ff                                  ; [$9264] byte

SPRITE_TILES_PORTRAIT_ADDRS_MARTIAL_ARTIST: ; [$9265]
    db $68                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_00
                                            ; [$PRG8::9265]
    db $69                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_01
                                            ; [$PRG8::9266]
    db $6a                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_02
                                            ; [$PRG8::9267]
    db $6b                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_03
                                            ; [$PRG8::9268]
    db $6c                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_04
                                            ; [$PRG8::9269]
    db $6d                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_05
                                            ; [$PRG8::926a]
    db $6e                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_06
                                            ; [$PRG8::926b]
    db $6f                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_07
                                            ; [$PRG8::926c]
    db $70                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_08
                                            ; [$PRG8::926d]
    db $71                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_09
                                            ; [$PRG8::926e]
    db $72                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_10
                                            ; [$PRG8::926f]
    db $73                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_11
                                            ; [$PRG8::9270]
    db $74                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_12
                                            ; [$PRG8::9271]
    db $75                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_13
                                            ; [$PRG8::9272]
    db $76                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_14
                                            ; [$PRG8::9273]
    db $77                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_15
                                            ; [$PRG8::9274]
    db $7b                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_16
                                            ; [$PRG8::9275]
    db $7a                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_17
                                            ; [$PRG8::9276]
    db $79                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_18
                                            ; [$PRG8::9277]
    db $7e                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_19
                                            ; [$PRG8::9278]
    db $7c                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_20
                                            ; [$PRG8::9279]
    db $7d                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_21
                                            ; [$PRG8::927a]
    db $81                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_22
                                            ; [$PRG8::927b]
    db $82                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_23
                                            ; [$PRG8::927c]
    db $7f                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_24
                                            ; [$PRG8::927d]
    db $83                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_25
                                            ; [$PRG8::927e]
    db $84                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_26
                                            ; [$PRG8::927f]
    db $78                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_27
                                            ; [$PRG8::9280]
    db $85                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_28
                                            ; [$PRG8::9281]
    db $86                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_29
                                            ; [$PRG8::9282]
    db $87                                  ; SPRITE_TILES_PORTRAIT_MARTIAL_ARTIST_30
                                            ; [$PRG8::9283]
    db $ff                                  ; [$9284] byte

SPRITE_TILES_PORTRAIT_ADDRS_MAGICIAN:       ; [$9285]
    db $51                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_00
                                            ; [$PRG8::9285]
    db $52                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_01
                                            ; [$PRG8::9286]
    db $53                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_02
                                            ; [$PRG8::9287]
    db $54                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_03
                                            ; [$PRG8::9288]
    db $55                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_04
                                            ; [$PRG8::9289]
    db $56                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_05
                                            ; [$PRG8::928a]
    db $57                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_06
                                            ; [$PRG8::928b]
    db $58                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_07
                                            ; [$PRG8::928c]
    db $ee                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_08__MEAT_SALESMAN_29
                                            ; [$PRG8::928d]
    db $94                                  ; SPRITE_TILES_PORTRAIT_KING_11__MAGICIAN_09
                                            ; [$PRG8::928e]
    db $60                                  ; SPRITE_TILES_PORTRAIT_KING_15__MAGICIAN_10
                                            ; [$PRG8::928f]
    db $80                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_11
                                            ; [$PRG8::9290]
    db $ef                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_12
                                            ; [$PRG8::9291]
    db $63                                  ; SPRITE_TILES_PORTRAIT_KING_18__GURU_10__MAGICIAN_13
                                            ; [$PRG8::9292]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::9293]
    db $2a                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22
                                            ; [$PRG8::9294]
    db $88                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_16
                                            ; [$PRG8::9295]
    db $89                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_17
                                            ; [$PRG8::9296]
    db $ff                                  ; [$9297] byte

SPRITE_TILES_PORTRAIT_ADDRS_DOCTOR:         ; [$9298]
    db $e2                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_00
                                            ; [$PRG8::9298]
    db $e3                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_01
                                            ; [$PRG8::9299]
    db $b4                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_02__KEY_SALESMAN_02
                                            ; [$PRG8::929a]
    db $c2                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03
                                            ; [$PRG8::929b]
    db $a0                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_04__TOOLS_SALESMAN_02
                                            ; [$PRG8::929c]
    db $e4                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_05
                                            ; [$PRG8::929d]
    db $e5                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_06
                                            ; [$PRG8::929e]
    db $c6                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_07__SMOKING_GUY_07
                                            ; [$PRG8::929f]
    db $a2                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_08__TOOLS_SALESMAN_04
                                            ; [$PRG8::92a0]
    db $a3                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_09__TOOLS_SALESMAN_05
                                            ; [$PRG8::92a1]
    db $ca                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_10__SMOKING_GUY_11
                                            ; [$PRG8::92a2]
    db $ea                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_11
                                            ; [$PRG8::92a3]
    db $e6                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_12__MEAT_SALESMAN_22
                                            ; [$PRG8::92a4]
    db $e7                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_13
                                            ; [$PRG8::92a5]
    db $eb                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_14
                                            ; [$PRG8::92a6]
    db $ec                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_15
                                            ; [$PRG8::92a7]
    db $e9                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_16__MEAT_SALESMAN_28
                                            ; [$PRG8::92a8]
    db $ce                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::92a9]
    db $f0                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_18
                                            ; [$PRG8::92aa]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::92ab]
    db $db                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33
                                            ; [$PRG8::92ac]
    db $dc                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34
                                            ; [$PRG8::92ad]
    db $a6                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_22__TOOLS_SALESMAN_19
                                            ; [$PRG8::92ae]
    db $e8                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_23
                                            ; [$PRG8::92af]
    db $ff                                  ; [$92b0] byte

SPRITE_TILES_PORTRAIT_ADDRS_NURSE:          ; [$92b1]
    db $1a                                  ; SPRITE_TILES_PORTRAIT_NURSE_00__KEY_SALESMAN_16
                                            ; [$PRG8::92b1]
    db $1b                                  ; SPRITE_TILES_PORTRAIT_NURSE_01
                                            ; [$PRG8::92b2]
    db $1c                                  ; SPRITE_TILES_PORTRAIT_NURSE_02
                                            ; [$PRG8::92b3]
    db $1d                                  ; SPRITE_TILES_PORTRAIT_NURSE_03
                                            ; [$PRG8::92b4]
    db $1e                                  ; SPRITE_TILES_PORTRAIT_NURSE_04
                                            ; [$PRG8::92b5]
    db $1f                                  ; SPRITE_TILES_PORTRAIT_NURSE_05
                                            ; [$PRG8::92b6]
    db $20                                  ; SPRITE_TILES_PORTRAIT_NURSE_06
                                            ; [$PRG8::92b7]
    db $21                                  ; SPRITE_TILES_PORTRAIT_NURSE_07
                                            ; [$PRG8::92b8]
    db $22                                  ; SPRITE_TILES_PORTRAIT_NURSE_08
                                            ; [$PRG8::92b9]
    db $23                                  ; SPRITE_TILES_PORTRAIT_NURSE_09
                                            ; [$PRG8::92ba]
    db $24                                  ; SPRITE_TILES_PORTRAIT_NURSE_10
                                            ; [$PRG8::92bb]
    db $25                                  ; SPRITE_TILES_PORTRAIT_NURSE_11
                                            ; [$PRG8::92bc]
    db $29                                  ; SPRITE_TILES_PORTRAIT_GURU_08__NURSE_12
                                            ; [$PRG8::92bd]
    db $27                                  ; SPRITE_TILES_PORTRAIT_NURSE_13
                                            ; [$PRG8::92be]
    db $28                                  ; SPRITE_TILES_PORTRAIT_NURSE_14
                                            ; [$PRG8::92bf]
    db $2c                                  ; SPRITE_TILES_PORTRAIT_NURSE_15
                                            ; [$PRG8::92c0]
    db $2a                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22
                                            ; [$PRG8::92c1]
    db $2b                                  ; SPRITE_TILES_PORTRAIT_NURSE_17
                                            ; [$PRG8::92c2]
    db $2f                                  ; SPRITE_TILES_PORTRAIT_NURSE_18
                                            ; [$PRG8::92c3]
    db $2d                                  ; SPRITE_TILES_PORTRAIT_NURSE_19
                                            ; [$PRG8::92c4]
    db $2e                                  ; SPRITE_TILES_PORTRAIT_NURSE_20
                                            ; [$PRG8::92c5]
    db $30                                  ; SPRITE_TILES_PORTRAIT_NURSE_21
                                            ; [$PRG8::92c6]
    db $31                                  ; SPRITE_TILES_PORTRAIT_NURSE_22
                                            ; [$PRG8::92c7]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::92c8]
    db $32                                  ; SPRITE_TILES_PORTRAIT_NURSE_24
                                            ; [$PRG8::92c9]
    db $33                                  ; SPRITE_TILES_PORTRAIT_NURSE_25
                                            ; [$PRG8::92ca]
    db $26                                  ; SPRITE_TILES_PORTRAIT_NURSE_26
                                            ; [$PRG8::92cb]
    db $ff                                  ; [$92cc] byte

SPRITE_TILES_PORTRAIT_ADDRS_PINKSHIRT:      ; [$92cd]
    db $00                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_00
                                            ; [$PRG8::92cd]
    db $01                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_01
                                            ; [$PRG8::92ce]
    db $02                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_02
                                            ; [$PRG8::92cf]
    db $03                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_03
                                            ; [$PRG8::92d0]
    db $04                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_04
                                            ; [$PRG8::92d1]
    db $05                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_05
                                            ; [$PRG8::92d2]
    db $06                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_06
                                            ; [$PRG8::92d3]
    db $07                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_07
                                            ; [$PRG8::92d4]
    db $08                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_08
                                            ; [$PRG8::92d5]
    db $09                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_09
                                            ; [$PRG8::92d6]
    db $0a                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_10
                                            ; [$PRG8::92d7]
    db $0b                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_11
                                            ; [$PRG8::92d8]
    db $0c                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_12
                                            ; [$PRG8::92d9]
    db $0d                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_13
                                            ; [$PRG8::92da]
    db $10                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_14__SMOKING_GUY_18
                                            ; [$PRG8::92db]
    db $11                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_15__SMOKING_GUY_19
                                            ; [$PRG8::92dc]
    db $0e                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_16
                                            ; [$PRG8::92dd]
    db $0f                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_17
                                            ; [$PRG8::92de]
    db $ce                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::92df]
    db $12                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_19__SMOKING_GUY_23
                                            ; [$PRG8::92e0]
    db $13                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_20__SMOKING_GUY_24
                                            ; [$PRG8::92e1]
    db $14                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_21
                                            ; [$PRG8::92e2]
    db $15                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_22
                                            ; [$PRG8::92e3]
    db $16                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_23
                                            ; [$PRG8::92e4]
    db $17                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_24
                                            ; [$PRG8::92e5]
    db $18                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_25
                                            ; [$PRG8::92e6]
    db $19                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_26
                                            ; [$PRG8::92e7]
    db $ff                                  ; [$92e8] byte

SPRITE_TILES_PORTRAIT_ADDRS_SMOKING_GUY:    ; [$92e9]
    db $bf                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_00
                                            ; [$PRG8::92e9]
    db $c0                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_01
                                            ; [$PRG8::92ea]
    db $c1                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_02
                                            ; [$PRG8::92eb]
    db $c2                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03
                                            ; [$PRG8::92ec]
    db $c3                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_04
                                            ; [$PRG8::92ed]
    db $c4                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_05
                                            ; [$PRG8::92ee]
    db $c5                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_06
                                            ; [$PRG8::92ef]
    db $c6                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_07__SMOKING_GUY_07
                                            ; [$PRG8::92f0]
    db $c7                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_08
                                            ; [$PRG8::92f1]
    db $c8                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_09
                                            ; [$PRG8::92f2]
    db $c9                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_10
                                            ; [$PRG8::92f3]
    db $ca                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_10__SMOKING_GUY_11
                                            ; [$PRG8::92f4]
    db $cb                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_12__KEY_SALESMAN_12
                                            ; [$PRG8::92f5]
    db $cc                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_13__KEY_SALESMAN_13
                                            ; [$PRG8::92f6]
    db $d0                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_14__KEY_SALESMAN_14
                                            ; [$PRG8::92f7]
    db $d1                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_15__KEY_SALESMAN_15
                                            ; [$PRG8::92f8]
    db $44                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_16__KEY_SALESMAN_18
                                            ; [$PRG8::92f9]
    db $45                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_17
                                            ; [$PRG8::92fa]
    db $10                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_14__SMOKING_GUY_18
                                            ; [$PRG8::92fb]
    db $11                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_15__SMOKING_GUY_19
                                            ; [$PRG8::92fc]
    db $46                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_20__KEY_SALESMAN_24
                                            ; [$PRG8::92fd]
    db $47                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_21__KEY_SALESMAN_25
                                            ; [$PRG8::92fe]
    db $ce                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::92ff]
    db $12                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_19__SMOKING_GUY_23
                                            ; [$PRG8::9300]
    db $13                                  ; SPRITE_TILES_PORTRAIT_PINKSHIRT_20__SMOKING_GUY_24
                                            ; [$PRG8::9301]
    db $d2                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_25
                                            ; [$PRG8::9302]
    db $d3                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_26
                                            ; [$PRG8::9303]
    db $d4                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_27__KEY_SALESMAN_37
                                            ; [$PRG8::9304]
    db $d5                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_28__KEY_SALESMAN_38
                                            ; [$PRG8::9305]
    db $ff                                  ; [$9306] byte

SPRITE_TILES_PORTRAIT_ADDRS_MEAT_SALESMAN:  ; [$9307]
    db $36                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_00
                                            ; [$PRG8::9307]
    db $37                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_01
                                            ; [$PRG8::9308]
    db $38                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_02
                                            ; [$PRG8::9309]
    db $39                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_03
                                            ; [$PRG8::930a]
    db $3a                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_04
                                            ; [$PRG8::930b]
    db $3b                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_05
                                            ; [$PRG8::930c]
    db $3c                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_06
                                            ; [$PRG8::930d]
    db $3d                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_07
                                            ; [$PRG8::930e]
    db $3e                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_08
                                            ; [$PRG8::930f]
    db $3f                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_09
                                            ; [$PRG8::9310]
    db $4d                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_10
                                            ; [$PRG8::9311]
    db $40                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_11
                                            ; [$PRG8::9312]
    db $41                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_12
                                            ; [$PRG8::9313]
    db $42                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_13
                                            ; [$PRG8::9314]
    db $43                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_14
                                            ; [$PRG8::9315]
    db $e1                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_15
                                            ; [$PRG8::9316]
    db $5b                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_16
                                            ; [$PRG8::9317]
    db $5c                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_17
                                            ; [$PRG8::9318]
    db $5d                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_18
                                            ; [$PRG8::9319]
    db $5e                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_19
                                            ; [$PRG8::931a]
    db $66                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_20
                                            ; [$PRG8::931b]
    db $e0                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_21
                                            ; [$PRG8::931c]
    db $e6                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_12__MEAT_SALESMAN_22
                                            ; [$PRG8::931d]
    db $ce                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_17__PINKSHIRT_18__SMOKING_GUY_22__MEAT_SALESMAN_23
                                            ; [$PRG8::931e]
    db $61                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_24
                                            ; [$PRG8::931f]
    db $62                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_25
                                            ; [$PRG8::9320]
    db $64                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_26
                                            ; [$PRG8::9321]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::9322]
    db $e9                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_16__MEAT_SALESMAN_28
                                            ; [$PRG8::9323]
    db $ee                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_08__MEAT_SALESMAN_29
                                            ; [$PRG8::9324]
    db $4c                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_30
                                            ; [$PRG8::9325]
    db $67                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_31
                                            ; [$PRG8::9326]
    db $4e                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_32
                                            ; [$PRG8::9327]
    db $4f                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_33
                                            ; [$PRG8::9328]
    db $50                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_34
                                            ; [$PRG8::9329]
    db $59                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_35
                                            ; [$PRG8::932a]
    db $5a                                  ; SPRITE_TILES_PORTRAIT_MEAT_SALESMAN_36
                                            ; [$PRG8::932b]
    db $ff                                  ; [$932c] byte

SPRITE_TILES_PORTRAIT_ADDRS_TOOLS_SALESMAN: ; [$932d]
    db $9e                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_00
                                            ; [$PRG8::932d]
    db $9f                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_01
                                            ; [$PRG8::932e]
    db $a0                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_04__TOOLS_SALESMAN_02
                                            ; [$PRG8::932f]
    db $a1                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_03
                                            ; [$PRG8::9330]
    db $a2                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_08__TOOLS_SALESMAN_04
                                            ; [$PRG8::9331]
    db $a3                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_09__TOOLS_SALESMAN_05
                                            ; [$PRG8::9332]
    db $a4                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_06
                                            ; [$PRG8::9333]
    db $a5                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_07
                                            ; [$PRG8::9334]
    db $d6                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_08
                                            ; [$PRG8::9335]
    db $d7                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_09
                                            ; [$PRG8::9336]
    db $d8                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_10
                                            ; [$PRG8::9337]
    db $d9                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_11
                                            ; [$PRG8::9338]
    db $da                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_12__KEY_SALESMAN_26
                                            ; [$PRG8::9339]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::933a]
    db $db                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33
                                            ; [$PRG8::933b]
    db $dc                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34
                                            ; [$PRG8::933c]
    db $dd                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_16
                                            ; [$PRG8::933d]
    db $de                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_17
                                            ; [$PRG8::933e]
    db $df                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_18
                                            ; [$PRG8::933f]
    db $a6                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_22__TOOLS_SALESMAN_19
                                            ; [$PRG8::9340]
    db $a7                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_20
                                            ; [$PRG8::9341]
    db $ff                                  ; [$9342] byte

SPRITE_TILES_PORTRAIT_ADDRS_KEY_SALESMAN:   ; [$9343]
    db $b2                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_00
                                            ; [$PRG8::9343]
    db $b3                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_01
                                            ; [$PRG8::9344]
    db $b4                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_02__KEY_SALESMAN_02
                                            ; [$PRG8::9345]
    db $c2                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_03__SMOKING_GUY_03__KEY_SALESMAN_03
                                            ; [$PRG8::9346]
    db $b5                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_04
                                            ; [$PRG8::9347]
    db $b6                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_05
                                            ; [$PRG8::9348]
    db $b7                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_06
                                            ; [$PRG8::9349]
    db $b8                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_07
                                            ; [$PRG8::934a]
    db $b9                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_08
                                            ; [$PRG8::934b]
    db $ba                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_09
                                            ; [$PRG8::934c]
    db $bb                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_10
                                            ; [$PRG8::934d]
    db $bc                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_11
                                            ; [$PRG8::934e]
    db $cb                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_12__KEY_SALESMAN_12
                                            ; [$PRG8::934f]
    db $cc                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_13__KEY_SALESMAN_13
                                            ; [$PRG8::9350]
    db $d0                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_14__KEY_SALESMAN_14
                                            ; [$PRG8::9351]
    db $d1                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_15__KEY_SALESMAN_15
                                            ; [$PRG8::9352]
    db $1a                                  ; SPRITE_TILES_PORTRAIT_NURSE_00__KEY_SALESMAN_16
                                            ; [$PRG8::9353]
    db $48                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_17
                                            ; [$PRG8::9354]
    db $44                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_16__KEY_SALESMAN_18
                                            ; [$PRG8::9355]
    db $fa                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_19
                                            ; [$PRG8::9356]
    db $fb                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_20
                                            ; [$PRG8::9357]
    db $fc                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_21
                                            ; [$PRG8::9358]
    db $2a                                  ; SPRITE_TILES_PORTRAIT_MAGICIAN_15__NURSE_16__KEY_SALESMAN_22
                                            ; [$PRG8::9359]
    db $cf                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_23
                                            ; [$PRG8::935a]
    db $46                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_20__KEY_SALESMAN_24
                                            ; [$PRG8::935b]
    db $47                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_21__KEY_SALESMAN_25
                                            ; [$PRG8::935c]
    db $da                                  ; SPRITE_TILES_PORTRAIT_TOOLS_SALESMAN_12__KEY_SALESMAN_26
                                            ; [$PRG8::935d]
    db $fd                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_27
                                            ; [$PRG8::935e]
    db $49                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_28
                                            ; [$PRG8::935f]
    db $4a                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_29
                                            ; [$PRG8::9360]
    db $cd                                  ; SPRITE_TILES_PORTRAIT_GURU_11__MAGICIAN_14__DOCTOR_19__NURSE_23__MEAT_SALESMAN_27__TOOLS_SALESMAN_13__KEY_SALESMAN_30
                                            ; [$PRG8::9361]
    db $34                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_31
                                            ; [$PRG8::9362]
    db $fe                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_32
                                            ; [$PRG8::9363]
    db $db                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_20__TOOLS_SALESMAN_14__KEY_SALESMAN_33
                                            ; [$PRG8::9364]
    db $dc                                  ; SPRITE_TILES_PORTRAIT_DOCTOR_21__TOOLS_SALESMAN_15__KEY_SALESMAN_34
                                            ; [$PRG8::9365]
    db $bd                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_35
                                            ; [$PRG8::9366]
    db $be                                  ; SPRITE_TILES_PORTRAIT_KEY_SALESMAN_36
                                            ; [$PRG8::9367]
    db $d4                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_27__KEY_SALESMAN_37
                                            ; [$PRG8::9368]
    db $d5                                  ; SPRITE_TILES_PORTRAIT_SMOKING_GUY_28__KEY_SALESMAN_38
                                            ; [$PRG8::9369]
    db $ff                                  ; [$936a] byte


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
    db $00,$01,$03,$0a,$0c,$06,$1c,$14,$00,$00,$01,$07,$07,$0c,$08,$39 ; [$936b]
                                                                       ; byte


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
    db $08,$36,$44,$00,$00,$00,$58,$84,$37,$fd,$a3,$98,$7e,$ff,$87,$01 ; [$937b]
                                                                       ; byte


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
    db $19,$01,$38,$69,$d1,$6a,$37,$34,$12,$3a,$13,$12,$7a,$b1,$d8,$db ; [$938b]
                                                                       ; byte


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
    db $b8,$7c,$07,$77,$bc,$4d,$0d,$77,$47,$83,$80,$78,$eb,$cb,$f3,$8b ; [$939b]
                                                                       ; byte


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
    db $5d,$3c,$e3,$dc,$6a,$43,$42,$26,$80,$02,$00,$1f,$bb,$b2,$bd,$d9 ; [$93ab]
                                                                       ; byte


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
    db $9c,$84,$04,$0e,$1b,$96,$1c,$1c,$40,$68,$e8,$e0,$e6,$6d,$eb,$eb ; [$93bb]
                                                                       ; byte


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
    db $64,$38,$9b,$9a,$7a,$3c,$1b,$19,$9b,$c7,$e7,$67,$07,$03,$04,$06 ; [$93cb]
                                                                       ; byte


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
    db $03,$04,$0b,$0c,$09,$0f,$37,$26,$f7,$f3,$e0,$ec,$de,$b0,$0f,$9f ; [$93db]
                                                                       ; byte


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
    db $b3,$54,$b4,$48,$8c,$e5,$90,$08,$cc,$8f,$0f,$37,$73,$19,$e5,$f1 ; [$93eb]
                                                                       ; byte


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
    db $1e,$1c,$19,$1d,$3e,$2c,$28,$08,$e1,$e3,$e7,$e2,$c0,$d0,$d0,$f0 ; [$93fb]
                                                                       ; byte


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
    db $09,$0a,$04,$04,$01,$01,$00,$00,$06,$07,$03,$03,$00,$00,$00,$00 ; [$940b]
                                                                       ; byte


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
    db $00,$03,$41,$0c,$88,$c0,$f0,$ff,$bf,$bc,$be,$ff,$7f,$3f,$0f,$00 ; [$941b]
                                                                       ; byte


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
    db $00,$e2,$22,$08,$08,$1b,$7f,$ff,$fd,$1d,$1d,$f7,$f7,$e4,$80,$00 ; [$942b]
                                                                       ; byte


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
    db $18,$10,$30,$60,$c0,$80,$80,$80,$e0,$e0,$c0,$80,$00,$00,$00,$00 ; [$943b]
                                                                       ; byte


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
    db $0a,$21,$90,$90,$48,$a0,$d0,$e8,$f5,$fe,$7f,$7f,$bf,$df,$ef,$77 ; [$944b]
                                                                       ; byte


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
    db $bf,$7f,$ff,$7f,$1f,$0f,$0f,$1f,$40,$80,$00,$80,$e1,$f3,$f7,$ee ; [$945b]
                                                                       ; byte


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
    db $00,$00,$01,$04,$10,$20,$40,$00,$00,$00,$00,$03,$0f,$1f,$3f,$7f ; [$946b]
                                                                       ; byte


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
    db $00,$47,$0b,$0b,$05,$02,$01,$00,$00,$3a,$f7,$f7,$fb,$fd,$fe,$ff ; [$947b]
                                                                       ; byte


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
    db $5c,$2c,$9c,$9c,$04,$98,$9c,$18,$bb,$db,$6b,$0b,$e3,$69,$0a,$e9 ; [$948b]
                                                                       ; byte


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
    db $84,$9c,$18,$84,$9c,$1f,$0f,$07,$61,$0a,$e9,$63,$0b,$ec,$f7,$f8 ; [$949b]
                                                                       ; byte


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
    db $b8,$1c,$67,$47,$14,$0d,$0d,$77,$47,$e3,$f8,$f8,$63,$83,$f3,$8b ; [$94ab]
                                                                       ; byte


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
    db $5d,$3c,$e3,$c8,$40,$50,$42,$26,$80,$02,$1c,$3f,$9e,$a1,$bd,$d9 ; [$94bb]
                                                                       ; byte


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
    db $03,$04,$0b,$0c,$09,$0f,$2a,$00,$f7,$f3,$e0,$ec,$de,$b0,$07,$a0 ; [$94cb]
                                                                       ; byte


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
    db $b3,$54,$b4,$48,$8c,$f5,$a0,$00,$cc,$8f,$0f,$37,$73,$09,$f5,$01 ; [$94db]
                                                                       ; byte


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
    db $17,$07,$40,$0d,$88,$c0,$f0,$ff,$bf,$bf,$bf,$fe,$7f,$3f,$0f,$00 ; [$94eb]
                                                                       ; byte


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
    db $00,$02,$c2,$e8,$08,$1b,$7f,$ff,$fd,$fd,$3d,$17,$f7,$e4,$80,$00 ; [$94fb]
                                                                       ; byte


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
    db $01,$03,$7f,$ff,$ff,$ff,$ff,$ff,$03,$0f,$3f,$7f,$ff,$ff,$ff,$7f ; [$950b]
                                                                       ; byte


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
    db $01,$01,$01,$03,$02,$06,$07,$0f,$00,$03,$07,$07,$0f,$0f,$0e,$0d ; [$951b]
                                                                       ; byte


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
    db $7f,$bf,$fe,$79,$76,$e8,$de,$a0,$80,$ff,$ff,$fe,$f8,$f7,$e1,$df ; [$952b]
                                                                       ; byte


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
    db $e1,$fc,$68,$74,$ef,$c9,$00,$07,$1b,$ff,$ff,$6f,$d8,$36,$ff,$f8 ; [$953b]
                                                                       ; byte


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
    db $80,$c0,$40,$40,$60,$a0,$b0,$f0,$00,$00,$80,$80,$80,$40,$40,$00 ; [$954b]
                                                                       ; byte


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
    db $0d,$1d,$1d,$0a,$09,$09,$09,$0d,$0a,$0a,$0a,$1d,$1d,$1e,$1e,$1a ; [$955b]
                                                                       ; byte


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
    db $e1,$ed,$cf,$ce,$c0,$98,$50,$c0,$90,$8d,$b9,$bf,$3f,$7f,$bf,$3f ; [$956b]
                                                                       ; byte


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
    db $08,$93,$94,$1a,$06,$00,$50,$00,$f7,$60,$65,$eb,$ff,$ff,$ef,$df ; [$957b]
                                                                       ; byte


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
    db $e0,$a0,$a0,$a0,$c0,$c0,$80,$80,$00,$40,$40,$40,$00,$00,$00,$00 ; [$958b]
                                                                       ; byte


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
    db $0e,$1f,$1f,$15,$05,$05,$02,$00,$1b,$0b,$09,$0f,$0e,$06,$03,$01 ; [$959b]
                                                                       ; byte


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
    db $80,$a0,$c0,$a0,$f8,$7c,$36,$b3,$3f,$1f,$1f,$4f,$87,$c3,$69,$0c ; [$95ab]
                                                                       ; byte


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
    db $01,$71,$43,$62,$06,$48,$18,$e0,$fe,$0e,$fc,$9c,$f8,$f2,$e1,$0c ; [$95bb]
                                                                       ; byte


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
    db $01,$91,$03,$42,$06,$48,$18,$e0,$fe,$0e,$9c,$fc,$f8,$f2,$e1,$0c ; [$95cb]
                                                                       ; byte


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
    db $f0,$e4,$e4,$b0,$ee,$ff,$3f,$c0,$0f,$1f,$9f,$cf,$f1,$ff,$ff,$ff ; [$95db]
                                                                       ; byte


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
    db $e0,$40,$40,$88,$cd,$de,$9e,$7e,$00,$a0,$b0,$70,$f2,$ef,$ff,$ff ; [$95eb]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$07,$3f,$ff,$00,$00,$00,$00,$00,$07,$3f,$ff ; [$95fb]
                                                                       ; byte


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
    db $ff,$ff,$ff,$7f,$bf,$5f,$6f,$2f,$ff,$ff,$ff,$ff,$7f,$bf,$9f,$df ; [$960b]
                                                                       ; byte


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
    db $be,$ff,$df,$ff,$ef,$ef,$f7,$ff,$ff,$bf,$ff,$df,$ff,$ff,$ff,$f7 ; [$961b]
                                                                       ; byte


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
    db $01,$03,$03,$03,$07,$04,$00,$00,$01,$03,$07,$04,$00,$03,$07,$07 ; [$962b]
                                                                       ; byte


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
    db $37,$17,$13,$13,$13,$17,$17,$17,$cf,$ef,$ef,$ef,$ef,$ef,$ef,$ef ; [$963b]
                                                                       ; byte


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
    db $fb,$fd,$ff,$ff,$ff,$ff,$f9,$ff,$ff,$ff,$fe,$ff,$fe,$fe,$fe,$f8 ; [$964b]
                                                                       ; byte


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
    db $00,$00,$08,$08,$08,$08,$00,$08,$07,$07,$07,$07,$07,$07,$0f,$07 ; [$965b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$08,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$07 ; [$966b]
                                                                       ; byte


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
    db $17,$17,$17,$03,$03,$08,$00,$00,$ef,$ef,$ef,$ef,$ef,$e7,$e7,$e7 ; [$967b]
                                                                       ; byte


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
    db $e0,$f4,$c7,$c1,$c0,$98,$50,$c0,$9f,$8f,$b0,$b8,$3f,$7f,$bf,$3f ; [$968b]
                                                                       ; byte


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
    db $08,$18,$1c,$1c,$00,$00,$50,$00,$f7,$e7,$67,$e3,$f9,$ff,$ef,$df ; [$969b]
                                                                       ; byte


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
    db $ff,$ff,$ff,$ff,$ff,$e7,$1f,$ff,$fe,$fe,$fe,$fe,$ff,$ff,$ff,$ff ; [$96ab]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$1f,$1f,$1f,$1f,$3f,$3f,$3f,$3f ; [$96bb]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$02,$07,$0c,$00,$00,$01,$03,$07,$04,$08,$03 ; [$96cb]
                                                                       ; byte


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
    db $00,$30,$c0,$04,$43,$82,$00,$40,$3f,$ef,$ff,$fb,$b8,$7c,$ff,$ff ; [$96db]
                                                                       ; byte


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
    db $3c,$03,$00,$00,$80,$40,$40,$00,$c0,$fc,$ff,$ff,$7f,$3f,$9f,$ef ; [$96eb]
                                                                       ; byte


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
    db $00,$00,$80,$40,$20,$20,$10,$10,$00,$00,$00,$80,$c0,$c0,$e0,$e0 ; [$96fb]
                                                                       ; byte


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
    db $08,$06,$04,$08,$11,$2a,$39,$53,$00,$06,$0c,$06,$0d,$1b,$1a,$38 ; [$970b]
                                                                       ; byte


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
    db $60,$63,$c2,$c6,$80,$31,$9b,$c2,$bc,$bb,$7f,$fb,$ff,$ef,$77,$37 ; [$971b]
                                                                       ; byte


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
    db $00,$e0,$b8,$38,$00,$80,$80,$00,$3f,$df,$a7,$27,$ff,$ff,$ff,$ff ; [$972b]
                                                                       ; byte


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
    db $10,$08,$08,$08,$04,$02,$0e,$16,$e0,$f0,$f0,$f0,$e0,$dc,$b0,$e0 ; [$973b]
                                                                       ; byte


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
    db $42,$43,$44,$6c,$78,$4a,$55,$55,$3c,$3c,$39,$11,$05,$3c,$3b,$3b ; [$974b]
                                                                       ; byte


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
    db $b0,$f8,$88,$88,$0c,$06,$e3,$82,$07,$07,$f7,$f7,$f3,$01,$fc,$fd ; [$975b]
                                                                       ; byte


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
    db $2e,$5c,$74,$60,$c8,$d8,$e0,$80,$c0,$80,$88,$98,$30,$20,$00,$00 ; [$976b]
                                                                       ; byte


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
    db $54,$43,$45,$4b,$2a,$28,$1c,$07,$3b,$3c,$3a,$37,$17,$17,$03,$00 ; [$977b]
                                                                       ; byte


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
    db $02,$00,$e0,$10,$00,$00,$00,$87,$fd,$ff,$1f,$ef,$ff,$ff,$ff,$78 ; [$978b]
                                                                       ; byte


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
    db $01,$01,$03,$07,$0e,$1d,$73,$ef,$fe,$fe,$fc,$f8,$f0,$e0,$80,$00 ; [$979b]
                                                                       ; byte


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
    db $8f,$83,$80,$88,$88,$84,$80,$80,$70,$7c,$7f,$7f,$7f,$7f,$7f,$7f ; [$97ab]
                                                                       ; byte


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
    db $fc,$fc,$3c,$1c,$0c,$0c,$3e,$0e,$00,$00,$c0,$e0,$f0,$f0,$c0,$f0 ; [$97bb]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$80,$e0,$f8,$ff,$ff,$ff,$ff,$7f,$9f,$e7,$f8 ; [$97cb]
                                                                       ; byte


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
    db $0e,$06,$02,$00,$02,$01,$07,$dc,$f0,$f8,$fc,$fe,$fc,$f9,$e7,$1f ; [$97db]
                                                                       ; byte


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
    db $f6,$f4,$f0,$f0,$f0,$f4,$fc,$f8,$f0,$f3,$f7,$f7,$f7,$f3,$f3,$fb ; [$97eb]
                                                                       ; byte


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
    db $17,$0b,$0b,$05,$01,$00,$00,$00,$e7,$f3,$f3,$f9,$fd,$fe,$fe,$fe ; [$97fb]
                                                                       ; byte


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
    db $bf,$bf,$bf,$7f,$7f,$7f,$ff,$ff,$ff,$bf,$bf,$7f,$7f,$7f,$7f,$ff ; [$980b]
                                                                       ; byte


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
    db $00,$00,$80,$60,$10,$18,$08,$0c,$00,$00,$00,$a0,$d0,$d8,$e8,$ec ; [$981b]
                                                                       ; byte


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
    db $80,$80,$00,$00,$00,$80,$80,$80,$7f,$7f,$ff,$ff,$ff,$7f,$7f,$7f ; [$982b]
                                                                       ; byte


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
    db $00,$00,$04,$04,$08,$30,$e0,$00,$ff,$ff,$fb,$fb,$f7,$cf,$1f,$ff ; [$983b]
                                                                       ; byte


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
    db $08,$01,$08,$08,$11,$2a,$39,$53,$07,$06,$07,$00,$0d,$1b,$1a,$38 ; [$984b]
                                                                       ; byte


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
    db $63,$60,$c4,$c1,$80,$31,$9b,$c2,$bf,$bb,$78,$fe,$ff,$ef,$77,$37 ; [$985b]
                                                                       ; byte


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
    db $00,$00,$00,$38,$00,$80,$80,$00,$ff,$ff,$ff,$07,$ff,$ff,$ff,$ff ; [$986b]
                                                                       ; byte


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
    db $00,$00,$00,$03,$03,$06,$05,$0d,$00,$00,$01,$03,$07,$07,$0f,$0f ; [$987b]
                                                                       ; byte


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
    db $1f,$73,$ec,$db,$56,$b6,$7c,$70,$1e,$7f,$ff,$ff,$ff,$fe,$fd,$fb ; [$988b]
                                                                       ; byte


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
    db $17,$17,$1f,$3f,$2f,$24,$4b,$78,$1e,$1d,$13,$2f,$37,$38,$38,$3b ; [$989b]
                                                                       ; byte


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
    db $f9,$fc,$fe,$ff,$1f,$05,$c0,$80,$77,$fb,$fd,$fe,$1e,$64,$d5,$99 ; [$98ab]
                                                                       ; byte


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
    db $31,$30,$18,$58,$50,$11,$51,$0f,$7a,$7d,$7d,$3d,$7b,$7b,$7b,$7b ; [$98bb]
                                                                       ; byte


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
    db $1d,$f1,$23,$c1,$00,$9a,$3f,$7f,$e3,$0f,$d7,$37,$f1,$e4,$cf,$9f ; [$98cb]
                                                                       ; byte


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
    db $10,$40,$1b,$59,$0a,$53,$13,$53,$7b,$7b,$68,$6c,$74,$3d,$7d,$7d ; [$98db]
                                                                       ; byte


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
    db $7f,$ff,$ff,$fc,$f8,$f1,$cc,$3b,$bf,$7f,$7f,$ff,$fc,$fb,$f7,$c4 ; [$98eb]
                                                                       ; byte


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
    db $42,$43,$44,$6d,$78,$4a,$57,$55,$3c,$3c,$39,$10,$04,$3c,$3a,$3b ; [$98fb]
                                                                       ; byte


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
    db $b0,$f8,$88,$08,$0c,$06,$13,$c2,$07,$07,$f7,$f7,$03,$01,$0c,$fd ; [$990b]
                                                                       ; byte


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
    db $c9,$07,$0e,$1c,$18,$38,$70,$60,$30,$f7,$ef,$de,$dd,$bd,$7b,$73 ; [$991b]
                                                                       ; byte


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
    db $ff,$cf,$a7,$40,$bb,$80,$60,$30,$00,$70,$78,$bf,$44,$7f,$bf,$cf ; [$992b]
                                                                       ; byte


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
    db $9f,$ff,$ff,$bf,$1f,$06,$01,$07,$00,$00,$00,$40,$e0,$f8,$fd,$fb ; [$993b]
                                                                       ; byte


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
    db $80,$f0,$e0,$9f,$7f,$ff,$e0,$c8,$00,$00,$00,$1f,$7f,$ff,$f0,$e7 ; [$994b]
                                                                       ; byte


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
    db $e0,$e0,$c0,$c0,$c0,$80,$80,$80,$f7,$f7,$ef,$ef,$ef,$df,$df,$df ; [$995b]
                                                                       ; byte


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
    db $ab,$aa,$ce,$cb,$e2,$f2,$f9,$fe,$7f,$7f,$3f,$3f,$1f,$8f,$87,$41 ; [$996b]
                                                                       ; byte


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
    db $03,$03,$07,$07,$06,$06,$06,$06,$fb,$fb,$f7,$f7,$f7,$f7,$f7,$f7 ; [$997b]
                                                                       ; byte


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
    db $80,$00,$00,$00,$00,$00,$00,$00,$df,$bf,$bf,$7f,$7f,$7f,$7f,$7f ; [$998b]
                                                                       ; byte


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
    db $73,$fc,$7e,$bf,$3e,$9f,$5f,$ad,$80,$90,$d9,$cc,$ef,$f7,$f3,$72 ; [$999b]
                                                                       ; byte


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
    db $08,$00,$04,$00,$00,$02,$00,$00,$f0,$f8,$f8,$fc,$fc,$fc,$fe,$fe ; [$99ab]
                                                                       ; byte


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
    db $4e,$5f,$4b,$29,$ae,$af,$5b,$58,$f5,$f6,$f6,$f6,$f5,$f6,$f6,$f7 ; [$99bb]
                                                                       ; byte


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
    db $00,$00,$00,$80,$40,$20,$f0,$10,$00,$00,$00,$00,$80,$c0,$00,$e0 ; [$99cb]
                                                                       ; byte


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
    db $01,$01,$01,$00,$00,$00,$00,$00,$fe,$fe,$fe,$ff,$ff,$ff,$ff,$ff ; [$99db]
                                                                       ; byte


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
    db $01,$03,$01,$07,$07,$07,$0f,$0f,$00,$01,$03,$03,$02,$02,$06,$06 ; [$99eb]
                                                                       ; byte


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
    db $b5,$d5,$fd,$b4,$a0,$30,$f0,$b8,$ff,$ff,$87,$79,$7d,$fe,$7f,$ff ; [$99fb]
                                                                       ; byte


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
    db $63,$47,$84,$06,$02,$03,$01,$01,$fc,$f8,$83,$b8,$7c,$fc,$fe,$fe ; [$9a0b]
                                                                       ; byte


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
    db $80,$c0,$c0,$e0,$60,$30,$30,$70,$00,$00,$00,$00,$80,$40,$40,$00 ; [$9a1b]
                                                                       ; byte


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
    db $0f,$0f,$0a,$0b,$1b,$2f,$30,$01,$06,$06,$07,$05,$05,$11,$1e,$1f ; [$9a2b]
                                                                       ; byte


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
    db $98,$e0,$81,$b3,$0c,$76,$fb,$4f,$ff,$1f,$0e,$c0,$81,$71,$e9,$c9 ; [$9a3b]
                                                                       ; byte


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
    db $01,$0f,$70,$07,$11,$66,$4b,$76,$fe,$f0,$80,$80,$80,$86,$9b,$93 ; [$9a4b]
                                                                       ; byte


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
    db $d0,$90,$90,$10,$94,$78,$a4,$2c,$20,$20,$20,$20,$20,$84,$48,$50 ; [$9a5b]
                                                                       ; byte


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
    db $1b,$13,$1b,$09,$09,$0c,$0c,$04,$07,$0f,$07,$07,$07,$03,$03,$03 ; [$9a6b]
                                                                       ; byte


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
    db $05,$0f,$bb,$09,$0c,$0a,$11,$26,$fb,$f3,$c7,$f3,$f1,$f4,$ee,$d9 ; [$9a7b]
                                                                       ; byte


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
    db $60,$30,$19,$16,$10,$78,$78,$78,$9f,$cf,$c6,$c9,$af,$07,$87,$87 ; [$9a8b]
                                                                       ; byte


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
    db $7c,$6c,$6c,$6c,$78,$38,$20,$60,$80,$80,$80,$80,$80,$c0,$c0,$80 ; [$9a9b]
                                                                       ; byte


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
    db $04,$04,$04,$04,$06,$02,$03,$01,$03,$03,$03,$03,$01,$01,$00,$00 ; [$9aab]
                                                                       ; byte


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
    db $01,$17,$2e,$00,$03,$06,$03,$04,$e0,$cf,$df,$ff,$fc,$f8,$ff,$ff ; [$9abb]
                                                                       ; byte


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
    db $c8,$80,$00,$00,$c1,$60,$00,$00,$07,$f3,$fb,$ff,$3e,$1f,$ff,$ff ; [$9acb]
                                                                       ; byte


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
    db $60,$60,$e0,$e0,$60,$60,$40,$c0,$80,$80,$00,$00,$80,$80,$80,$00 ; [$9adb]
                                                                       ; byte


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
    db $98,$e0,$81,$b3,$0c,$66,$8b,$07,$ff,$1f,$0e,$c0,$f1,$f9,$71,$81 ; [$9aeb]
                                                                       ; byte


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
    db $00,$00,$c0,$60,$bc,$5f,$e7,$f8,$ff,$ff,$3f,$1f,$03,$80,$c0,$60 ; [$9afb]
                                                                       ; byte


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
    db $82,$73,$ef,$4f,$1a,$3f,$7f,$bf,$01,$82,$f6,$f6,$e7,$c3,$81,$40 ; [$9b0b]
                                                                       ; byte


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
    db $ff,$0f,$3f,$00,$00,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff ; [$9b1b]
                                                                       ; byte


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
    db $b1,$8c,$87,$00,$00,$60,$c0,$c0,$4e,$73,$78,$ff,$ff,$ff,$ff,$ff ; [$9b2b]
                                                                       ; byte


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
    db $f7,$7f,$1f,$03,$01,$01,$01,$01,$38,$8c,$e0,$fc,$fe,$fe,$fe,$fe ; [$9b3b]
                                                                       ; byte


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
    db $3f,$e9,$f3,$eb,$a7,$4e,$8c,$58,$c0,$1c,$38,$70,$d0,$a1,$43,$c7 ; [$9b4b]
                                                                       ; byte


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
    db $07,$0f,$b9,$02,$01,$01,$01,$03,$f8,$f0,$46,$fd,$fe,$fe,$fe,$fc ; [$9b5b]
                                                                       ; byte


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
    db $e7,$f7,$e7,$f7,$e7,$e7,$f7,$e5,$f9,$fb,$fb,$fb,$fb,$fb,$fb,$fb ; [$9b6b]
                                                                       ; byte


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
    db $99,$59,$99,$58,$9c,$4c,$ce,$d7,$c7,$87,$47,$c7,$c3,$83,$01,$40 ; [$9b7b]
                                                                       ; byte


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
    db $c0,$c0,$c0,$c0,$c0,$f0,$3d,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff ; [$9b8b]
                                                                       ; byte


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
    db $9b,$5d,$de,$9f,$5f,$5e,$1c,$1c,$c0,$80,$00,$40,$80,$81,$83,$83 ; [$9b9b]
                                                                       ; byte


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
    db $e0,$fc,$ff,$e0,$00,$50,$00,$00,$1f,$03,$00,$1f,$ff,$ff,$ff,$ff ; [$9bab]
                                                                       ; byte


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
    db $01,$0f,$70,$07,$11,$68,$40,$60,$fe,$f0,$80,$80,$8e,$9f,$9e,$81 ; [$9bbb]
                                                                       ; byte


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
    db $11,$20,$28,$0c,$07,$01,$0c,$03,$e0,$c0,$d0,$ff,$ff,$fe,$f3,$ff ; [$9bcb]
                                                                       ; byte


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
    db $c8,$04,$1c,$04,$81,$c0,$20,$00,$07,$03,$03,$fb,$fe,$3f,$df,$ff ; [$9bdb]
                                                                       ; byte


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
    db $f9,$fc,$fe,$ff,$1f,$85,$00,$00,$77,$fb,$fd,$fe,$1e,$64,$f5,$01 ; [$9beb]
                                                                       ; byte


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
    db $7f,$ff,$fe,$fb,$fc,$f0,$cb,$3b,$bf,$7f,$7f,$fc,$f8,$f8,$f7,$c4 ; [$9bfb]
                                                                       ; byte


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
    db $84,$4a,$22,$39,$2d,$2f,$3d,$30,$94,$52,$6a,$21,$31,$31,$31,$3b ; [$9c0b]
                                                                       ; byte


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
    db $01,$0a,$0b,$65,$81,$66,$ef,$ea,$41,$49,$68,$0d,$07,$99,$9c,$9d ; [$9c1b]
                                                                       ; byte


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
    db $18,$24,$1c,$01,$04,$17,$2f,$1f,$3b,$1d,$0e,$0e,$00,$0c,$19,$3b ; [$9c2b]
                                                                       ; byte


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
    db $f5,$7d,$3c,$07,$92,$fe,$fc,$de,$cb,$e3,$fb,$78,$00,$ff,$ff,$f1 ; [$9c3b]
                                                                       ; byte


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
    db $2b,$1e,$3f,$2f,$3c,$2a,$2b,$29,$17,$37,$74,$70,$73,$77,$77,$77 ; [$9c4b]
                                                                       ; byte


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
    db $05,$63,$ca,$f4,$0d,$19,$e0,$8a,$82,$24,$cd,$fb,$f3,$e7,$17,$f1 ; [$9c5b]
                                                                       ; byte


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
    db $c0,$cc,$53,$3e,$b1,$96,$07,$50,$01,$28,$b3,$df,$ce,$e9,$ef,$8f ; [$9c6b]
                                                                       ; byte


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
    db $da,$74,$fa,$fc,$36,$9c,$1a,$1e,$ec,$ee,$2e,$0e,$ce,$ee,$ee,$ee ; [$9c7b]
                                                                       ; byte


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
    db $28,$38,$3f,$5f,$3f,$7f,$5b,$57,$77,$77,$70,$7b,$7f,$7f,$7f,$7f ; [$9c8b]
                                                                       ; byte


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
    db $1c,$fe,$ff,$ff,$fe,$ef,$99,$50,$ec,$7f,$ff,$fe,$f9,$f0,$e7,$ef ; [$9c9b]
                                                                       ; byte


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
    db $37,$20,$0e,$a4,$76,$74,$d6,$d2,$6e,$7f,$77,$7f,$af,$af,$7f,$7f ; [$9cab]
                                                                       ; byte


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
    db $43,$f7,$ff,$ff,$df,$57,$57,$2f,$fc,$fb,$ff,$ff,$ff,$ff,$ff,$ff ; [$9cbb]
                                                                       ; byte


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
    db $00,$00,$00,$01,$06,$0c,$34,$4a,$00,$00,$00,$00,$01,$0b,$3b,$77 ; [$9ccb]
                                                                       ; byte


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
    db $4e,$ad,$af,$af,$bf,$5e,$fe,$ff,$fb,$7b,$7d,$7d,$6b,$f5,$55,$02 ; [$9cdb]
                                                                       ; byte


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
    db $be,$56,$ee,$af,$6f,$d6,$d6,$ae,$e7,$ef,$df,$de,$df,$ef,$ef,$df ; [$9ceb]
                                                                       ; byte


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
    db $b1,$9a,$c9,$98,$9d,$cc,$99,$98,$cf,$e7,$f7,$e7,$e3,$f3,$e7,$e7 ; [$9cfb]
                                                                       ; byte


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
    db $7d,$6a,$77,$f5,$f6,$6b,$6b,$75,$e7,$f7,$fb,$7b,$fb,$f7,$f7,$fb ; [$9d0b]
                                                                       ; byte


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
    db $7d,$43,$12,$0c,$0d,$19,$e0,$8a,$82,$fc,$e5,$03,$f3,$e7,$17,$f1 ; [$9d1b]
                                                                       ; byte


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
    db $de,$c8,$40,$20,$b1,$96,$07,$50,$01,$3f,$af,$d0,$ce,$e9,$ef,$8f ; [$9d2b]
                                                                       ; byte


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
    db $1c,$fe,$ff,$ff,$fe,$e9,$90,$53,$ec,$7f,$ff,$fe,$f9,$f0,$e0,$e7 ; [$9d3b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$04,$04,$14,$00,$00,$00,$01,$03,$0b,$1b,$2b ; [$9d4b]
                                                                       ; byte


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
    db $18,$60,$80,$0f,$00,$1e,$61,$0c,$07,$1f,$7f,$f0,$ff,$e1,$9e,$f3 ; [$9d5b]
                                                                       ; byte


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
    db $2a,$58,$6c,$5c,$7c,$38,$58,$38,$11,$23,$11,$21,$01,$03,$63,$63 ; [$9d6b]
                                                                       ; byte


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
    db $33,$00,$00,$02,$3c,$c0,$32,$02,$cc,$ff,$fd,$c1,$83,$3f,$7d,$fd ; [$9d7b]
                                                                       ; byte


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
    db $08,$2c,$14,$14,$15,$0c,$0a,$1f,$53,$43,$63,$23,$23,$33,$31,$00 ; [$9d8b]
                                                                       ; byte


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
    db $06,$22,$4c,$74,$09,$14,$23,$c4,$81,$61,$cb,$fb,$f7,$e3,$c8,$18 ; [$9d9b]
                                                                       ; byte


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
    db $0d,$1e,$1f,$1f,$0f,$0f,$0f,$07,$00,$00,$00,$00,$00,$00,$00,$00 ; [$9dab]
                                                                       ; byte


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
    db $0f,$f8,$f5,$e0,$e7,$e0,$e0,$fd,$30,$00,$03,$0f,$08,$0c,$0e,$00 ; [$9dbb]
                                                                       ; byte


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
    db $06,$42,$04,$05,$09,$14,$23,$c4,$f1,$f9,$73,$8b,$f7,$e3,$c8,$18 ; [$9dcb]
                                                                       ; byte


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
    db $0f,$f8,$f0,$e5,$e0,$e7,$e2,$fc,$30,$00,$00,$0b,$0f,$08,$0c,$01 ; [$9ddb]
                                                                       ; byte


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
    db $03,$03,$05,$07,$05,$06,$0f,$06,$00,$00,$02,$00,$02,$01,$00,$08 ; [$9deb]
                                                                       ; byte


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
    db $f6,$93,$54,$2b,$6b,$ab,$9c,$c9,$09,$7f,$ff,$ff,$ff,$7f,$77,$3f ; [$9dfb]
                                                                       ; byte


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
    db $13,$1f,$11,$19,$10,$18,$10,$1c,$0c,$0c,$0c,$0c,$0d,$0d,$0d,$09 ; [$9e0b]
                                                                       ; byte


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
    db $04,$88,$78,$86,$23,$6a,$4e,$1e,$03,$70,$87,$01,$70,$69,$c9,$e1 ; [$9e1b]
                                                                       ; byte


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
    db $21,$29,$21,$29,$21,$39,$21,$3d,$1c,$1c,$1c,$1c,$1c,$1c,$1c,$18 ; [$9e2b]
                                                                       ; byte


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
    db $65,$45,$02,$8d,$46,$43,$01,$07,$fb,$fb,$f9,$70,$b8,$bc,$fe,$f8 ; [$9e3b]
                                                                       ; byte


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
    db $20,$38,$20,$38,$20,$3a,$30,$00,$1e,$1e,$1e,$1f,$1f,$1f,$0f,$1f ; [$9e4b]
                                                                       ; byte


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
    db $88,$81,$80,$43,$41,$20,$18,$07,$70,$7f,$7f,$3c,$3f,$1f,$47,$60 ; [$9e5b]
                                                                       ; byte


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
    db $04,$88,$6c,$46,$03,$06,$06,$1e,$03,$70,$f3,$f9,$fc,$79,$81,$e1 ; [$9e6b]
                                                                       ; byte


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
    db $88,$84,$81,$40,$43,$20,$18,$07,$70,$78,$7f,$3f,$3c,$1f,$47,$60 ; [$9e7b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$01,$02,$01,$07,$00,$00,$00,$00,$00,$01,$03,$03 ; [$9e8b]
                                                                       ; byte


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
    db $00,$10,$66,$bc,$d2,$11,$a6,$64,$00,$0f,$19,$70,$e1,$e7,$cf,$8f ; [$9e9b]
                                                                       ; byte


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
    db $00,$08,$b6,$5d,$2a,$1d,$3a,$31,$00,$f0,$c8,$62,$b1,$d0,$d4,$ce ; [$9eab]
                                                                       ; byte


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
    db $07,$0b,$0f,$0f,$1a,$1f,$0d,$11,$02,$05,$02,$05,$0f,$32,$06,$0e ; [$9ebb]
                                                                       ; byte


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
    db $40,$c0,$c0,$80,$80,$03,$02,$10,$9f,$1f,$1f,$3f,$3c,$78,$77,$6f ; [$9ecb]
                                                                       ; byte


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
    db $00,$00,$20,$0c,$44,$cf,$4a,$68,$ff,$ff,$df,$b3,$38,$30,$b7,$b7 ; [$9edb]
                                                                       ; byte


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
    db $c0,$c0,$c0,$c0,$40,$80,$c0,$40,$00,$00,$00,$00,$00,$00,$00,$80 ; [$9eeb]
                                                                       ; byte


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
    db $10,$1a,$02,$00,$08,$02,$02,$0a,$24,$20,$34,$17,$13,$09,$0d,$05 ; [$9efb]
                                                                       ; byte


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
    db $31,$06,$6b,$47,$00,$00,$80,$71,$c1,$fe,$f7,$f8,$ff,$ff,$7f,$8e ; [$9f0b]
                                                                       ; byte


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
    db $0a,$0c,$8b,$23,$1a,$f8,$60,$33,$72,$70,$f3,$f8,$e1,$01,$83,$c0 ; [$9f1b]
                                                                       ; byte


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
    db $e0,$e0,$e0,$60,$60,$c0,$c0,$c0,$00,$00,$00,$80,$80,$00,$00,$00 ; [$9f2b]
                                                                       ; byte


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
    db $38,$04,$60,$43,$00,$00,$80,$71,$c7,$f3,$f8,$fc,$ff,$ff,$7f,$8e ; [$9f3b]
                                                                       ; byte


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
    db $08,$0c,$8b,$23,$1a,$f8,$60,$33,$f7,$73,$70,$f8,$e1,$01,$83,$c0 ; [$9f4b]
                                                                       ; byte


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
    db $00,$00,$03,$03,$07,$07,$0f,$0f,$00,$00,$00,$00,$00,$00,$00,$00 ; [$9f5b]
                                                                       ; byte


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
    db $3f,$ff,$ff,$ff,$fe,$e2,$c8,$88,$00,$00,$00,$00,$00,$00,$1d,$3f ; [$9f6b]
                                                                       ; byte


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
    db $f0,$fc,$fe,$bf,$83,$05,$00,$40,$00,$00,$00,$00,$40,$e8,$fe,$bf ; [$9f7b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$80,$80,$c0,$40,$00,$00,$00,$00,$00,$00,$00,$00 ; [$9f8b]
                                                                       ; byte


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
    db $0f,$1f,$1f,$1f,$0f,$27,$13,$09,$00,$00,$00,$00,$00,$10,$38,$2c ; [$9f9b]
                                                                       ; byte


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
    db $83,$89,$91,$05,$0a,$0d,$07,$02,$3c,$30,$26,$68,$72,$74,$7f,$7f ; [$9fab]
                                                                       ; byte


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
    db $00,$04,$83,$c1,$54,$51,$57,$cb,$3b,$f8,$78,$30,$a4,$a1,$a7,$30 ; [$9fbb]
                                                                       ; byte


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
    db $40,$40,$40,$40,$c0,$c0,$c0,$c0,$00,$00,$00,$00,$00,$00,$00,$00 ; [$9fcb]
                                                                       ; byte


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
    db $13,$18,$01,$00,$08,$02,$02,$0a,$24,$23,$36,$17,$13,$09,$0d,$05 ; [$9fdb]
                                                                       ; byte


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
    db $87,$20,$00,$80,$41,$31,$21,$27,$78,$ff,$ff,$7f,$be,$ce,$de,$d9 ; [$9feb]
                                                                       ; byte


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
    db $c3,$c5,$02,$02,$34,$4c,$b3,$1f,$38,$38,$7c,$7c,$09,$01,$c0,$e0 ; [$9ffb]
                                                                       ; byte


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
    db $c0,$60,$60,$60,$60,$c0,$c0,$c0,$00,$80,$80,$80,$80,$00,$00,$00 ; [$a00b]
                                                                       ; byte


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
    db $06,$03,$03,$01,$01,$01,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00 ; [$a01b]
                                                                       ; byte


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
    db $00,$08,$09,$88,$00,$60,$1a,$83,$ff,$f7,$f6,$77,$7f,$9f,$c5,$60 ; [$a02b]
                                                                       ; byte


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
    db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff ; [$a03b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff ; [$a04b]
                                                                       ; byte


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
    db $f8,$fc,$fc,$fe,$ff,$ff,$ff,$ff,$fb,$fd,$fd,$fe,$ff,$ff,$ff,$ff ; [$a05b]
                                                                       ; byte


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
    db $41,$f5,$83,$1e,$27,$33,$23,$06,$80,$79,$fc,$e0,$d8,$fc,$fc,$f8 ; [$a06b]
                                                                       ; byte


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
    db $80,$f8,$18,$00,$00,$00,$00,$00,$00,$f0,$e0,$00,$00,$00,$00,$00 ; [$a07b]
                                                                       ; byte


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
    db $83,$89,$91,$04,$06,$00,$00,$00,$3c,$30,$26,$6f,$7f,$77,$78,$7f ; [$a08b]
                                                                       ; byte


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
    db $00,$04,$83,$c0,$50,$55,$50,$cb,$3b,$f8,$78,$37,$a7,$22,$a0,$30 ; [$a09b]
                                                                       ; byte


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
    db $41,$81,$b3,$06,$3f,$33,$23,$06,$80,$03,$fc,$f8,$c0,$fc,$fc,$f8 ; [$a0ab]
                                                                       ; byte


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
    db $80,$40,$e0,$18,$10,$00,$00,$00,$00,$80,$f0,$20,$00,$00,$00,$00 ; [$a0bb]
                                                                       ; byte


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
    db $07,$00,$00,$00,$00,$00,$00,$00,$00,$1f,$7f,$ff,$ff,$ff,$ff,$ff ; [$a0cb]
                                                                       ; byte


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
    db $f7,$7b,$3d,$3e,$3f,$3f,$3f,$3f,$f0,$70,$38,$bc,$bf,$bf,$bf,$bf ; [$a0db]
                                                                       ; byte


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
    db $ff,$ff,$ff,$7f,$9d,$e2,$ff,$f9,$00,$00,$00,$00,$00,$80,$c0,$ff ; [$a0eb]
                                                                       ; byte


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
    db $00,$00,$00,$00,$02,$00,$00,$00,$ff,$ff,$fb,$fd,$fc,$fe,$fe,$fe ; [$a0fb]
                                                                       ; byte


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
    db $7f,$3f,$3f,$3f,$7f,$7f,$ff,$ff,$7f,$7f,$7f,$7f,$ff,$ff,$ff,$ff ; [$a10b]
                                                                       ; byte


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
    db $00,$00,$04,$08,$13,$24,$04,$20,$fd,$fd,$f9,$f0,$e4,$cb,$db,$df ; [$a11b]
                                                                       ; byte


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
    db $ff,$ff,$ff,$ff,$3f,$4f,$93,$a0,$ff,$ff,$ff,$ff,$3f,$8f,$63,$5c ; [$a12b]
                                                                       ; byte


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
    db $85,$25,$80,$00,$00,$80,$fe,$7f,$7a,$da,$7f,$ff,$ff,$7f,$01,$00 ; [$a13b]
                                                                       ; byte


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
    db $02,$24,$84,$04,$00,$02,$00,$fc,$fd,$db,$7b,$fb,$ff,$fd,$ff,$03 ; [$a14b]
                                                                       ; byte


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
    db $3f,$5f,$0f,$07,$13,$23,$01,$01,$3f,$9f,$ef,$f7,$eb,$db,$fd,$fd ; [$a15b]
                                                                       ; byte


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
    db $40,$40,$41,$01,$01,$03,$03,$03,$3e,$3e,$3d,$7d,$7d,$7b,$7b,$7b ; [$a16b]
                                                                       ; byte


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
    db $00,$03,$04,$08,$00,$10,$20,$20,$00,$00,$03,$07,$0f,$0f,$1f,$1f ; [$a17b]
                                                                       ; byte


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
    db $00,$00,$03,$04,$03,$04,$06,$15,$00,$00,$00,$03,$04,$0b,$18,$28 ; [$a18b]
                                                                       ; byte


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
    db $1f,$f0,$0d,$f0,$1c,$e0,$00,$0c,$00,$0f,$f2,$0f,$e3,$01,$1e,$f3 ; [$a19b]
                                                                       ; byte


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
    db $03,$38,$06,$01,$00,$40,$08,$00,$fc,$c7,$f9,$fe,$fd,$81,$07,$7f ; [$a1ab]
                                                                       ; byte


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
    db $c0,$1c,$60,$80,$06,$13,$20,$00,$3f,$e3,$9f,$71,$e0,$8c,$9f,$ff ; [$a1bb]
                                                                       ; byte


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
    db $06,$02,$f2,$f9,$fc,$fe,$ff,$ff,$01,$f1,$f9,$fc,$fe,$ff,$ff,$ff ; [$a1cb]
                                                                       ; byte


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
    db $a0,$41,$00,$03,$81,$60,$38,$9f,$40,$bf,$ff,$fc,$7f,$1f,$87,$c0 ; [$a1db]
                                                                       ; byte


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
    db $a0,$40,$01,$00,$83,$61,$38,$9f,$40,$b8,$ff,$ff,$7c,$1f,$87,$c0 ; [$a1eb]
                                                                       ; byte


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
    db $cf,$e7,$f3,$f8,$ff,$ff,$ff,$ff,$e0,$f0,$f8,$fc,$ff,$ff,$ff,$ff ; [$a1fb]
                                                                       ; byte


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
    db $00,$00,$00,$07,$1f,$3f,$7f,$7f,$00,$00,$07,$1f,$3f,$7f,$7f,$ff ; [$a20b]
                                                                       ; byte


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
    db $e0,$80,$00,$00,$00,$00,$00,$00,$e0,$9f,$7f,$ff,$ff,$ff,$ff,$ff ; [$a21b]
                                                                       ; byte


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
    db $ff,$3b,$1b,$13,$13,$07,$07,$07,$ff,$3b,$db,$d7,$d7,$ef,$ef,$ef ; [$a22b]
                                                                       ; byte


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
    db $2f,$2f,$0f,$5f,$1f,$bf,$bf,$3f,$df,$df,$df,$bf,$bf,$7f,$7f,$7f ; [$a23b]
                                                                       ; byte


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
    db $01,$03,$7f,$fe,$ff,$ff,$ff,$fb,$03,$0f,$3f,$7f,$fe,$fd,$fd,$7d ; [$a24b]
                                                                       ; byte


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
    db $d3,$f4,$3b,$80,$f5,$fa,$ff,$ff,$ff,$5b,$e4,$ff,$ff,$ff,$ff,$ff ; [$a25b]
                                                                       ; byte


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
    db $0f,$0f,$0f,$1f,$1f,$3f,$3f,$3f,$df,$df,$df,$bf,$bf,$7f,$7f,$7f ; [$a26b]
                                                                       ; byte


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
    db $28,$28,$3c,$f4,$f9,$fd,$fd,$ff,$1e,$1c,$01,$02,$ea,$f4,$f4,$fa ; [$a27b]
                                                                       ; byte


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
    db $fe,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fa,$fd,$fe,$ff,$ff,$ff,$ff,$ff ; [$a28b]
                                                                       ; byte


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
    db $bd,$2a,$97,$d5,$e6,$73,$79,$7d,$67,$77,$bb,$5b,$ab,$d7,$eb,$f5 ; [$a29b]
                                                                       ; byte


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
    db $7e,$6b,$74,$f1,$f8,$6b,$68,$79,$e2,$f5,$f8,$7d,$f4,$f7,$f4,$f5 ; [$a2ab]
                                                                       ; byte


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
    db $7d,$69,$75,$f5,$f6,$6b,$6b,$75,$e5,$f5,$f9,$79,$f8,$f7,$f7,$fb ; [$a2bb]
                                                                       ; byte


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
    db $ff,$1f,$0f,$07,$07,$03,$03,$03,$ff,$1f,$ef,$f7,$f7,$fb,$fb,$fb ; [$a2cb]
                                                                       ; byte


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
    db $03,$03,$03,$03,$03,$03,$07,$07,$fb,$fb,$fb,$fb,$fb,$fb,$f7,$f7 ; [$a2db]
                                                                       ; byte


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
    db $0c,$1e,$3e,$fe,$ff,$ff,$ff,$ff,$ec,$de,$3e,$fe,$ff,$ff,$ff,$ff ; [$a2eb]
                                                                       ; byte


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
    db $00,$f0,$fe,$ff,$ff,$ff,$ff,$ff,$00,$f0,$fe,$ff,$ff,$ff,$ff,$ff ; [$a2fb]
                                                                       ; byte


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
    db $fc,$fd,$3c,$1c,$0c,$0c,$3e,$0e,$00,$01,$c1,$e1,$f1,$f1,$c0,$f0 ; [$a30b]
                                                                       ; byte


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
    db $00,$80,$f0,$fc,$fe,$ff,$7f,$7f,$00,$80,$f0,$fc,$fe,$ff,$ff,$ff ; [$a31b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$80,$e0,$f0,$00,$00,$00,$00,$00,$80,$e0,$f0 ; [$a32b]
                                                                       ; byte


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
    db $c0,$80,$80,$00,$00,$00,$00,$00,$c0,$b0,$b8,$78,$7c,$7c,$7c,$7e ; [$a33b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$fe,$fe,$ff,$ff,$ff,$7f,$7f,$7f ; [$a34b]
                                                                       ; byte


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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$a35b]
                                                                       ; byte
    hex fc 00 04 00 00 00 00 00 0b 00 00 00 00 00 00 00 ; [$a36b] undefined
    hex 29 00 00 00 00 00 00 00 7b 00 87 00 0a 00 00 00 ; [$a37b] undefined
    hex cf 00 21 00 20 00 00 00 5a 00 08 00 00 00 00 00 ; [$a38b] undefined
    hex 40 00 10 00 00 00 00 00 e5 00 ff 00 04 00 00 00 ; [$a39b] undefined
    hex 76 00 00 00 00 00 00 00 1a 00 04 00 00 00 00 00 ; [$a3ab] undefined
    hex 08 00 00 00 00 00 00 00 5f 00 f4 00 02 00 00 00 ; [$a3bb] undefined
    hex 78 00 00 00 01 00 00 00 2c 80 18 00 00 00 00 00 ; [$a3cb] undefined
    hex 8a 00 00 00 00 00 00 00 ce 00 28 00 02 00 00 00 ; [$a3db] undefined
    hex 4a 00 01 00 01 00 00 00 01 00 00 00 02 00 00 00 ; [$a3eb] undefined
    hex 00 00 00 00 00 00 00 00 bf 00 a9 00 a5 00 00 00 ; [$a3fb] undefined
    hex ad 00 d2 00 80 00 00 00 ac 00 21 00 00 00 00 80 ; [$a40b] undefined
    hex aa 00 5b 00 00 00 00 00 bf 00 f7 00 00 00 00 00 ; [$a41b] undefined
    hex fb 00 23 00 80 00 00 00 b3 00 0a 00 01 00 00 00 ; [$a42b] undefined
    hex 48 00 10 00 00 00 00 00 8f 00 29 00 00 00 00 00 ; [$a43b] undefined
    hex 7f 00 f3 00 00 00 00 00 a9 00 96 00 00 00 00 00 ; [$a44b] undefined
    hex 23 00 00 00 00 00 00 00 ff 00 cf 00 00 00 00 00 ; [$a45b] undefined
    hex 63 00 73 00 00 00 00 00 5b 00 01 00 00 00 00 00 ; [$a46b] undefined
    hex 09 00 01 00 10 00 00 00 df 00 29 00 02 00 00 00 ; [$a47b] undefined
    hex 82 00 3d 00 00 00 00 00 43 00 01 00 00 00 00 00 ; [$a48b] undefined
    hex 08 00 00 00 00 00 00 00 cd 00 c3 00 40 00 00 00 ; [$a49b] undefined
    hex c1 00 40 00 02 00 00 00 08 00 00 00 00 00 00 00 ; [$a4ab] undefined
    hex 10 00 00 00 10 00 00 00 7f 00 22 00 00 00 00 00 ; [$a4bb] undefined
    hex 69 00 f0 00 10 00 00 00 04 00 00 00 80 00 00 00 ; [$a4cb] undefined
    hex 08 00 00 00 00 00 00 00 81 00 1f 00 82 00 00 00 ; [$a4db] undefined
    hex 48 00 41 00 14 00 00 00 21 00 01 00 01 00 00 00 ; [$a4eb] undefined
    hex 30 00 10 00 00 00 00 00 f7 00 a8 00 00 00 00 00 ; [$a4fb] undefined
    hex 6b 00 55 00 00 00 00 00 b3 00 55 00 00 00 00 00 ; [$a50b] undefined
    hex f0 10 48 00 00 00 00 00 ff 00 ae 00 00 00 00 00 ; [$a51b] undefined
    hex db 00 0d 00 00 00 00 00 8f 00 95 00 80 00 00 00 ; [$a52b] undefined
    hex 6d 00 01 00 00 00 00 00 ff 00 01 00 00 00 00 00 ; [$a53b] undefined
    hex de 00 00 00 80 00 00 00 5c 00 09 00 00 00 00 00 ; [$a54b] undefined
    hex 15 00 01 00 00 00 00 00 fa 00 dd 00 00 00 00 00 ; [$a55b] undefined
    hex cf 00 d2 00 20 00 00 00 9d 00 01 00 80 00 00 00 ; [$a56b] undefined
    hex 15 00 22 00 00 00 00 00 ff 00 29 00 01 00 00 00 ; [$a57b] undefined
    hex fa 00 97 00 0a 00 00 00 58 00 00 00 20 00 00 00 ; [$a58b] undefined
    hex 0c 00 00 00 00 00 00 00 fd 00 28 00 04 00 00 00 ; [$a59b] undefined
    hex 1a 00 00 00 a1 00 00 00 49 00 98 00 00 00 00 00 ; [$a5ab] undefined
    hex 05 00 08 00 00 00 00 00 be 00 18 00 00 00 00 00 ; [$a5bb] undefined
    hex 6c 00 29 00 09 00 00 00 41 00 48 00 00 00 00 00 ; [$a5cb] undefined
    hex 2c 00 02 00 00 00 00 00 d1 00 01 00 0b 00 00 00 ; [$a5db] undefined
    hex 7d 00 30 00 40 00 00 00 84 00 00 00 00 00 00 00 ; [$a5eb] undefined
    hex 00 00 00 00 00 00 00 00 ff 00 af 00 40 00 00 00 ; [$a5fb] undefined
    hex d7 00 d9 00 00 00 00 00 ff 00 64 00 00 00 00 00 ; [$a60b] undefined
    hex 0c 00 13 00 00 00 00 00 7b 00 b4 00 00 00 00 00 ; [$a61b] undefined
    hex 25 00 07 00 00 00 00 00 4d 00 a1 00 00 00 00 00 ; [$a62b] undefined
    hex 28 00 40 00 00 00 00 00 ff 00 29 00 01 00 00 00 ; [$a63b] undefined
    hex 4d 00 09 00 00 00 00 00 ab 00 01 00 80 00 00 00 ; [$a64b] undefined
    hex 09 00 84 00 00 00 00 00 7f 00 6a 00 00 00 00 00 ; [$a65b] undefined
    hex cf 00 00 00 20 00 00 00 05 00 10 00 80 00 00 00 ; [$a66b] undefined
    hex 11 00 04 00 00 00 00 00 89 00 4f 00 00 00 00 00 ; [$a67b] undefined
    hex c1 00 90 00 20 00 00 00 42 00 08 00 80 00 00 00 ; [$a68b] undefined
    hex 10 00 00 00 01 00 00 00 7f 00 0a 00 40 00 00 00 ; [$a69b] undefined
    hex 1d 00 04 00 80 00 00 00 13 00 04 00 00 00 00 00 ; [$a6ab] undefined
    hex 64 00 00 00 00 00 00 00 ce 00 43 00 01 00 00 00 ; [$a6bb] undefined
    hex 3c 00 00 00 28 00 00 00 40 00 40 00 00 00 00 00 ; [$a6cb] undefined
    hex 40 00 40 00 00 00 00 00 ea 00 00 00 04 00 00 00 ; [$a6db] undefined
    hex 36 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00 ; [$a6eb] undefined
    hex 40 80 00 00 00 00 00 00 9e 00 6f 00 80 00 00 00 ; [$a6fb] undefined
    hex fb 00 1c 00 00 00 00 00 bf 00 c3 00 00 00 00 00 ; [$a70b] undefined
    hex 6b 00 19 00 00 00 00 00 ba 00 5e 00 04 00 00 00 ; [$a71b] undefined
    hex 4e 00 51 00 00 00 00 00 2e 00 38 00 00 00 00 00 ; [$a72b] undefined
    hex 08 00 10 00 00 00 00 00 bf 00 af 00 08 00 00 00 ; [$a73b] undefined
    hex fe 00 03 00 00 00 00 00 c8 00 84 00 00 00 00 00 ; [$a74b] undefined
    hex 4f 80 00 00 00 00 00 00 ff 00 8a 00 00 00 00 00 ; [$a75b] undefined
    hex bc 00 21 00 00 00 00 00 53 00 42 00 00 00 00 00 ; [$a76b] undefined
    hex 05 00 00 00 00 00 00 00 df 00 0e 00 20 00 00 00 ; [$a77b] undefined
    hex 8d 00 07 00 00 00 00 00 1a 00 0c 00 80 00 00 00 ; [$a78b] undefined
    hex 00 00 00 00 00 00 00 00 2d 00 26 00 10 00 00 00 ; [$a79b] undefined
    hex 5e 00 b0 00 80 00 00 00 26 00 00 00 00 00 00 00 ; [$a7ab] undefined
    hex 00 00 00 00 00 00 00 00 ed 00 50 00 0c 00 00 00 ; [$a7bb] undefined
    hex 85 00 02 00 80 00 00 00 1c 00 00 00 00 00 00 00 ; [$a7cb] undefined
    hex 40 02 04 00 00 00 00 00 ab 00 00 00 04 00 00 00 ; [$a7db] undefined
    hex 3d 00 00 00 00 00 00 00 14 00 10 00 00 00 00 00 ; [$a7eb] undefined
    hex 00 00 20 00 00 00 00 00 5f 00 18 00 00 00 00 00 ; [$a7fb] undefined
    hex 1f 00 7c 00 00 00 00 00 3f 00 ae 00 00 00 00 00 ; [$a80b] undefined
    hex 9c 00 00 00 10 00 00 00 fb 00 bc 00 00 00 00 00 ; [$a81b] undefined
    hex 4b 00 0f 00 00 00 00 00 b7 00 34 00 00 00 00 00 ; [$a82b] undefined
    hex 18 00 14 00 00 00 00 00 df 00 75 00 00 00 00 00 ; [$a83b] undefined
    hex b2 00 58 00 00 00 00 00 ba 00 07 00 02 00 00 00 ; [$a84b] undefined
    hex 90 00 30 00 00 00 00 00 be 00 32 00 80 00 00 00 ; [$a85b] undefined
    hex df 00 a8 00 00 00 00 00 56 00 a1 00 00 00 00 00 ; [$a86b] undefined
    hex 00 00 00 00 00 00 00 00 fd 00 23 00 00 00 00 00 ; [$a87b] undefined
    hex e4 00 0c 00 00 00 00 00 24 00 05 00 08 00 00 00 ; [$a88b] undefined
    hex 49 00 01 00 00 00 00 00 51 00 b8 00 04 00 00 00 ; [$a89b] undefined
    hex df 00 14 00 00 00 00 00 0f 00 00 00 00 00 00 00 ; [$a8ab] undefined
    hex 00 00 00 00 00 00 00 00 af 00 18 00 05 00 00 00 ; [$a8bb] undefined
    hex 90 00 04 00 03 00 00 00 81 00 02 00 00 00 00 00 ; [$a8cb] undefined
    hex 54 08 04 00 00 00 00 00 b2 00 00 00 00 00 00 00 ; [$a8db] undefined
    hex a8 00 80 00 01 00 00 00 11 00 00 00 02 00 00 00 ; [$a8eb] undefined
    hex 00 c0 00 00 00 00 00 00 ff 00 cd 00 10 00 00 00 ; [$a8fb] undefined
    hex fa 00 1d 00 00 00 00 00 3f 00 4c 00 00 00 00 00 ; [$a90b] undefined
    hex 22 00 cc 00 00 00 00 00 5f 00 cf 00 40 00 00 00 ; [$a91b] undefined
    hex df 00 0a 00 00 00 00 00 9d 00 71 00 00 00 00 00 ; [$a92b] undefined
    hex 86 80 00 00 00 00 00 00 bf 00 c4 00 00 00 00 00 ; [$a93b] undefined
    hex 7b 00 ec 00 00 00 00 00 48 00 81 00 00 00 00 00 ; [$a94b] undefined
    hex 8c 00 a4 00 00 00 00 00 ff 00 3e 00 00 00 00 00 ; [$a95b] undefined
    hex 7f 00 b6 00 00 00 00 00 4b 00 0d 00 01 00 00 00 ; [$a96b] undefined
    hex 0b 40 00 00 00 00 00 00 9b 00 0b 00 01 00 00 00 ; [$a97b] undefined
    hex 8a 00 1b 00 24 00 00 00 95 00 a4 00 02 00 00 00 ; [$a98b] undefined
    hex 84 00 00 00 00 00 00 00 7f 00 db 00 18 00 00 00 ; [$a99b] undefined
    hex cc 00 05 00 00 00 00 00 05 00 08 00 60 00 00 00 ; [$a9ab] undefined
    hex 00 00 00 00 82 00 00 00 a2 00 5a 00 20 00 00 00 ; [$a9bb] undefined
    hex 98 00 84 00 41 00 00 00 04 00 40 00 20 00 00 00 ; [$a9cb] undefined
    hex 42 00 00 00 00 00 00 00 09 00 03 00 00 00 00 00 ; [$a9db] undefined
    hex 01 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00 ; [$a9eb] undefined
    hex 00 00 00 00 00 00 00 00 ff 00 bc 00 10 00 00 00 ; [$a9fb] undefined
    hex 7b 00 24 00 00 00 00 00 5d 00 06 00 00 00 00 00 ; [$aa0b] undefined
    hex cc 00 00 00 00 00 00 00 df 00 a8 00 04 00 00 00 ; [$aa1b] undefined
    hex 5f 00 aa 00 10 00 00 00 7c 00 d0 00 00 00 00 00 ; [$aa2b] undefined
    hex 06 00 10 00 00 00 00 00 ff 00 f3 00 00 00 00 00 ; [$aa3b] undefined
    hex 11 00 4c 00 00 00 00 00 76 00 80 00 00 00 00 00 ; [$aa4b] undefined
    hex 15 40 00 00 00 00 00 00 cd 00 4c 00 00 00 00 00 ; [$aa5b] undefined
    hex 7c 00 09 00 00 00 00 00 3f 00 c8 00 00 00 00 00 ; [$aa6b] undefined
    hex 49 00 05 00 00 00 00 00 6d 00 30 00 12 00 00 00 ; [$aa7b] undefined
    hex 76 00 8c 00 00 00 00 00 00 00 60 00 00 00 00 00 ; [$aa8b] undefined
    hex 00 10 0a 00 00 00 00 00 5f 00 d8 00 00 00 00 00 ; [$aa9b] undefined
    hex 2c 00 00 00 00 00 00 00 12 00 80 00 00 00 00 00 ; [$aaab] undefined
    hex 04 00 00 00 00 00 00 00 f9 00 18 00 00 00 00 00 ; [$aabb] undefined
    hex 1f 00 00 00 00 00 00 00 31 00 c0 00 08 00 00 20 ; [$aacb] undefined
    hex 04 00 00 00 00 00 00 00 b7 00 41 00 10 00 00 00 ; [$aadb] undefined
    hex da 00 80 00 40 00 00 00 00 00 00 00 00 00 00 00 ; [$aaeb] undefined
    hex 00 00 00 00 00 00 00 00 df 00 39 00 20 00 00 00 ; [$aafb] undefined
    hex ae 00 58 00 00 00 00 00 f3 00 18 00 00 00 00 00 ; [$ab0b] undefined
    hex 61 00 00 00 00 00 00 00 ff 00 bd 00 00 00 00 00 ; [$ab1b] undefined
    hex ff 00 3b 00 00 00 00 00 dc 00 f0 00 00 00 00 00 ; [$ab2b] undefined
    hex 61 00 00 00 00 00 00 00 df 00 29 00 00 00 00 00 ; [$ab3b] undefined
    hex 3d 00 1d 00 00 00 00 00 6c 00 5c 00 02 00 00 00 ; [$ab4b] undefined
    hex 02 00 00 00 40 00 00 00 fe 00 16 00 38 00 00 00 ; [$ab5b] undefined
    hex 66 00 29 00 20 00 00 00 fe 00 01 00 00 00 00 00 ; [$ab6b] undefined
    hex 10 00 80 00 00 00 00 00 af 00 10 00 50 00 00 00 ; [$ab7b] undefined
    hex 43 00 0c 00 00 00 00 00 02 00 40 00 00 00 00 00 ; [$ab8b] undefined
    hex 00 00 80 00 00 00 00 00 06 00 2a 00 00 00 00 00 ; [$ab9b] undefined
    hex de 00 4a 00 c2 00 00 00 17 00 43 00 00 00 00 00 ; [$abab] undefined
    hex 02 00 04 00 02 00 00 00 17 00 18 00 00 00 00 00 ; [$abbb] undefined
    hex e7 00 d3 00 82 00 00 00 04 00 0c 00 00 00 00 00 ; [$abcb] undefined
    hex 00 00 00 00 00 00 00 00 6b 00 04 00 00 00 00 00 ; [$abdb] undefined
    hex 04 00 10 00 00 00 00 00 a0 00 00 00 20 00 00 00 ; [$abeb] undefined
    hex 00 00 00 00 00 00 00 00 ff 00 39 00 a0 00 00 00 ; [$abfb] undefined
    hex 6d 00 64 00 00 00 00 00 4c 00 54 00 00 00 00 00 ; [$ac0b] undefined
    hex 44 00 02 00 00 00 00 00 bf 00 ae 00 00 00 00 00 ; [$ac1b] undefined
    hex f7 00 e6 00 40 00 00 00 f1 00 39 00 40 00 00 00 ; [$ac2b] undefined
    hex 08 02 21 00 00 00 00 00 3f 00 5a 00 80 00 00 00 ; [$ac3b] undefined
    hex e5 00 80 00 00 00 00 00 c1 00 01 00 80 00 00 00 ; [$ac4b] undefined
    hex 1a 00 01 00 00 00 00 00 9b 00 2c 00 08 00 00 00 ; [$ac5b] undefined
    hex bd 00 26 00 00 00 00 00 49 00 01 00 00 00 00 00 ; [$ac6b] undefined
    hex 08 00 04 00 00 00 00 00 bf 00 68 00 02 00 00 00 ; [$ac7b] undefined
    hex 4d 00 59 00 00 00 00 00 05 00 10 00 00 00 00 00 ; [$ac8b] undefined
    hex 09 00 00 00 00 00 00 00 7f 00 0c 00 40 00 00 00 ; [$ac9b] undefined
    hex c8 00 10 00 00 00 00 00 00 00 80 00 04 00 00 00 ; [$acab] undefined
    hex 65 00 00 00 00 00 00 00 f7 00 24 00 01 00 00 00 ; [$acbb] undefined
    hex 00 00 02 00 20 00 00 00 08 00 04 00 00 00 00 00 ; [$accb] undefined
    hex 00 00 01 00 00 00 00 00 0b 00 80 00 57 00 00 00 ; [$acdb] undefined
    hex 04 00 02 00 80 00 00 00 2a 00 00 00 00 00 00 00 ; [$aceb] undefined
    hex 02 00 00 00 00 00 00 00 ff 00 4d 00 01 00 00 00 ; [$acfb] undefined
    hex 7d 00 44 00 00 00 00 00 b4 00 00 00 00 00 00 00 ; [$ad0b] undefined
    hex 50 00 83 00 00 00 00 00 7b 00 72 00 00 00 00 00 ; [$ad1b] undefined
    hex 92 00 05 00 00 00 00 00 ad 00 d3 00 40 00 00 00 ; [$ad2b] undefined
    hex 3c 00 05 00 10 00 00 00 fe 00 59 00 00 00 00 00 ; [$ad3b] undefined
    hex 5d 00 91 00 00 00 00 00 7a 00 00 00 80 00 00 00 ; [$ad4b] undefined
    hex 3f 00 10 00 00 00 00 00 fe 00 f2 00 15 00 00 00 ; [$ad5b] undefined
    hex fe 00 dc 00 00 00 00 00 c0 00 34 00 00 00 00 00 ; [$ad6b] undefined
    hex 04 00 08 00 00 00 00 00 39 00 4e 00 84 00 00 00 ; [$ad7b] undefined
    hex e3 00 10 00 00 00 00 00 0c 00 43 00 00 00 00 00 ; [$ad8b] undefined
    hex 08 00 00 00 00 00 00 00 a7 00 c9 00 00 00 00 00 ; [$ad9b] undefined
    hex 44 00 1b 00 01 00 00 00 aa 00 00 00 80 00 00 00 ; [$adab] undefined
    hex 01 00 00 00 00 00 00 00 fb 00 d9 00 20 00 00 00 ; [$adbb] undefined
    hex 21 00 67 00 00 00 00 00 88 00 01 00 80 00 00 00 ; [$adcb] undefined
    hex 21 00 00 00 00 00 00 00 51 00 24 00 0c 00 00 00 ; [$addb] undefined
    hex 08 00 01 00 80 00 00 00 04 00 00 00 00 00 00 00 ; [$adeb] undefined
    hex 00 00 00 00 00 00 00 00 b7 00 cf 00 82 00 00 00 ; [$adfb] undefined
    hex df 00 26 00 02 00 00 00 34 00 05 00 00 00 00 00 ; [$ae0b] undefined
    hex 8c 00 20 00 00 00 00 00 ff 00 d7 00 00 00 00 00 ; [$ae1b] undefined
    hex 7d 00 c3 00 00 00 00 00 89 00 00 00 00 00 00 00 ; [$ae2b] undefined
    hex 19 00 05 00 00 00 00 00 ff 00 4a 00 00 00 00 00 ; [$ae3b] undefined
    hex 7e 00 41 00 00 00 00 00 67 00 0a 00 00 00 00 00 ; [$ae4b] undefined
    hex 8a 00 00 00 00 00 00 00 ff 00 b3 00 80 00 00 00 ; [$ae5b] undefined
    hex 7d 00 6c 00 00 00 00 00 08 00 20 00 02 00 00 00 ; [$ae6b] undefined
    hex 0a 00 04 00 80 00 00 00 fe 00 2f 00 41 00 00 00 ; [$ae7b] undefined
    hex c9 00 08 00 00 00 00 00 4a 00 c4 00 00 00 00 00 ; [$ae8b] undefined
    hex 82 00 00 00 00 00 00 00 ff 00 30 00 40 00 00 00 ; [$ae9b] undefined
    hex cf 00 42 00 80 00 00 00 19 00 00 00 10 00 00 00 ; [$aeab] undefined
    hex 00 00 00 00 00 00 00 00 a5 00 a3 00 00 00 00 00 ; [$aebb] undefined
    hex 47 00 28 00 00 00 00 00 53 00 01 00 00 00 00 00 ; [$aecb] undefined
    hex 00 00 00 00 00 00 00 00 72 00 8d 00 00 00 00 00 ; [$aedb] undefined
    hex 04 00 42 00 00 00 00 00 20 00 00 00 00 00 00 00 ; [$aeeb] undefined
    hex 00 00 00 00 01 00 00 00 ff 00 9c 00 00 00 00 00 ; [$aefb] undefined
    hex 77 00 8b 00 00 00 00 00 8d 00 10 00 00 00 00 00 ; [$af0b] undefined
    hex 11 08 14 00 00 00 00 00 ff 00 d8 00 00 00 00 00 ; [$af1b] undefined
    hex 5f 00 c1 00 02 00 00 00 52 08 00 00 00 00 00 00 ; [$af2b] undefined
    hex 06 00 04 00 00 00 00 00 ff 00 85 00 01 00 00 00 ; [$af3b] undefined
    hex 67 00 6a 00 00 00 00 00 63 00 14 00 00 00 00 00 ; [$af4b] undefined
    hex 86 00 41 00 00 00 00 00 6f 00 73 00 00 00 00 00 ; [$af5b] undefined
    hex 1c 00 96 00 20 00 00 00 38 00 a2 00 00 00 00 00 ; [$af6b] undefined
    hex 00 00 02 00 00 00 00 00 6f 00 3a 00 a0 00 00 00 ; [$af7b] undefined
    hex ac 00 00 00 04 00 00 00 1d 20 00 00 80 00 00 00 ; [$af8b] undefined
    hex 00 04 00 00 00 00 00 00 f5 00 3a 00 00 00 00 00 ; [$af9b] undefined
    hex 3b 00 00 00 80 00 00 00 78 00 20 00 80 00 00 40 ; [$afab] undefined
    hex 02 00 00 00 00 00 00 00 7a 00 06 00 41 00 00 00 ; [$afbb] undefined
    hex 23 00 01 00 00 00 00 00 b0 00 82 00 80 00 00 00 ; [$afcb] undefined
    hex 44 82 00 00 00 00 00 00 f1 00 20 00 00 00 00 00 ; [$afdb] undefined
    hex cd 00 02 00 80 00 00 00 e6 02 80 00 80 00 00 00 ; [$afeb] undefined
    hex 00 00 00 00 00 00 ff 11 ff ff ff ba ff 00 ff be ; [$affb] undefined
    hex ff fd ff fb ff 00 ff 76 ff bf ff fe ff 00 ff ff ; [$b00b] undefined
    hex ff ff ff ff bf 00 ff ad ff 9b ff 8f 9f 00 ff 31 ; [$b01b] undefined
    hex ff fa ff f5 ff 00 ff d7 ff ff ff ef ee 00 ff 7b ; [$b02b] undefined
    hex ff ff ff ff 3d 00 ff 76 ff f5 ff bb ff 00 ff be ; [$b03b] undefined
    hex ff fe ff 8f ff 00 ff fe ff ef ff ff ff 00 ff f7 ; [$b04b] undefined
    hex ff ef ff ff ae 00 ff 28 ff e5 ff bb ff 00 ff d0 ; [$b05b] undefined
    hex ff f9 ff eb df 00 ff dd ff fd ff 3f db 00 ff bf ; [$b06b] undefined
    hex ff ff ff bf df 00 ff f8 ff e4 ff ee ff 00 ff b5 ; [$b07b] undefined
    hex ff bb ff f6 bf 00 ff fe ff df ff df 97 00 ff fb ; [$b08b] undefined
    hex ff ff ff ff 45 00 ff 64 ff c3 ff 7f ff 00 ff 1a ; [$b09b] undefined
    hex ff e6 ff f7 67 00 ff e6 ff fd ff be 7a 00 ff fd ; [$b0ab] undefined
    hex ff ff ff ff 84 00 ff cc ff c7 ff c7 fe 00 ff 60 ; [$b0bb] undefined
    hex ff fd ff fb bb 00 ff bf ff 7f ff ff 3f 00 ff ff ; [$b0cb] undefined
    hex ff ff ff ff 3f 00 ff 08 ff 78 ff c8 7f 00 ff 6b ; [$b0db] undefined
    hex ff ef ff fd ed 00 ff 32 ff 7f ff fb da 00 ff fe ; [$b0eb] undefined
    hex ff ff ff ff f7 00 ff 31 ff 75 ff 7f ff 00 ff a2 ; [$b0fb] undefined
    hex ff cd ff ff df 00 ff b6 ff 5f ff ff df 00 ff ef ; [$b10b] undefined
    hex ff ff ff 7f ff 00 ff 64 ff db ff 6f ff 00 ff e7 ; [$b11b] undefined
    hex ff df ff ff ff 00 ff 8a ff ef ff ff ff 00 ff ee ; [$b12b] undefined
    hex ff ff ff ff 7f 00 ff 70 ff fd ff ff ff 00 ff e4 ; [$b13b] undefined
    hex ff fe ff fd ff 00 ff f8 ff 7f ff ff ff 00 ff ff ; [$b14b] undefined
    hex ff ff ff ff f5 00 ff aa ff 3a ff d7 ff 00 ff 18 ; [$b15b] undefined
    hex ff ff 7f df ef 00 ff 5b ff fd ff ff 7c 00 ff ff ; [$b16b] undefined
    hex ff ff ff ef 9b 00 ff 18 ff df ff ab ff 00 ff d4 ; [$b17b] undefined
    hex ff ff ff fe bf 00 ff 70 ff ff ff ff 4f 00 ff fb ; [$b18b] undefined
    hex ff ff bf ff f5 00 ff 80 ff ec ff 0c df 00 ff c0 ; [$b19b] undefined
    hex ff 7e ff 72 ff 00 ff fe ff ff ff ff ff 00 ff ff ; [$b1ab] undefined
    hex ff ff ff ff 7b 00 ff 1a ff 89 ff ac ff 00 ff ea ; [$b1bb] undefined
    hex ff df ff fb df 00 ff 7e ff fb ff f5 f7 00 ff f3 ; [$b1cb] undefined
    hex ff ff ff fe 69 00 ff 40 ff de ff ce ff 00 ff 67 ; [$b1db] undefined
    hex ff be 7f eb fb 00 ff e7 ff f7 fe fe de 00 ff ee ; [$b1eb] undefined
    hex ff ff f3 ff 02 00 ff 66 ff eb ff de ff 00 ff cb ; [$b1fb] undefined
    hex ff eb ff ef 7f 00 ff af ff ff ff ff ff 00 ff f6 ; [$b20b] undefined
    hex ff ff ff fd 7f 00 ff b4 ff ae ff 8d ff 00 ff cd ; [$b21b] undefined
    hex ff ff ff fc f7 00 ff 7c ff fe ef ff 5b 00 ff ff ; [$b22b] undefined
    hex ff ff ff ff ff 00 ff 80 ff dd ff 5e ff 00 ff ea ; [$b23b] undefined
    hex ff 2f ff ff ff 00 ff dc ff ff ff fe 3f 00 ff ff ; [$b24b] undefined
    hex ff ff ff fe e7 00 ff 64 ff af ff f1 ff 00 ff 4e ; [$b25b] undefined
    hex ff fe ff ee ff 00 ff bb ff b7 ff ff fe 00 ff ff ; [$b26b] undefined
    hex ff fc ff ff 7e 00 ff 08 ff a9 ff ed df 00 ff 6a ; [$b27b] undefined
    hex ff fe ff fa fd 00 ff d4 ff ff ff ff ef 00 ff f6 ; [$b28b] undefined
    hex ff ff ff ff e1 00 ff 80 ff d4 ff dd ff 00 ff ef ; [$b29b] undefined
    hex ff fc ff fb ef 00 ff e2 ff ef ff ff 7c 00 ff ff ; [$b2ab] undefined
    hex ff fe 7f fd c7 00 ff 78 ff 5e ff f6 e7 00 ff e8 ; [$b2bb] undefined
    hex ff fd ff ef ff 00 ff ea ff ff ff b6 7f 00 ff ff ; [$b2cb] undefined
    hex bf fe ff ff 04 00 ff 80 ff f9 ff fd fe 00 ff 7a ; [$b2db] undefined
    hex ff ff ff bb ff 00 ff fd ff ff ff ff de 00 ff 9b ; [$b2eb] undefined
    hex ff ff bf ff 1b 00 ff 31 ff f0 ff f6 ff 00 ff 91 ; [$b2fb] undefined
    hex ff ff ff ff f7 00 ff af ff bf ff 7f fe 00 ff ff ; [$b30b] undefined
    hex ff ff ff ff d6 00 ff 02 ff aa ff f7 ff 00 ff b2 ; [$b31b] undefined
    hex ff bf ff 7f ff 00 ff db ff ff ff ff ef 00 ff ff ; [$b32b] undefined
    hex ff ff ff ff ff 00 ff c0 ff 54 ff dd fb 00 ff 6e ; [$b33b] undefined
    hex ff bd ff ee ff 00 ff bf ff 7e ff ff eb 00 ff eb ; [$b34b] undefined
    hex ff ff ff f7 ed 00 ff 28 ff be ff cd ff 00 ff 1b ; [$b35b] undefined
    hex ff ff ff eb 7f 00 ff fd ff ff ff fd 37 00 ff ff ; [$b36b] undefined
    hex ff ff ff ff fd 00 ff 24 ff bb ff bf ff 00 ff ec ; [$b37b] undefined
    hex ff ff ff fd cf 00 ff 8f ff ff ff ed be 00 ff df ; [$b38b] undefined
    hex ff ff ff ff f1 00 ff a0 ff 24 ff c4 ff 00 ff 29 ; [$b39b] undefined
    hex ff ff ff fd df 00 ff da ff fb ff ff 7f 00 ff df ; [$b3ab] undefined
    hex ef ff ff ff 71 00 ff 92 ff dd ff d7 eb 00 ff b9 ; [$b3bb] undefined
    hex ff ef ff ff ff 00 ff ab ff ff ff ff f7 00 ff fb ; [$b3cb] undefined
    hex ff ff ff ff 3e 00 ff e0 ff 52 ff 3e ff 00 ff da ; [$b3db] undefined
    hex ff fb bf ff bb 00 ff df ff ff ff 7e e9 00 ff f9 ; [$b3eb] undefined
    hex ff ff ff df 5f 00 ff e4 ff f8 ff 7b df 00 ff eb ; [$b3fb] undefined
    hex ff fe ff ff f7 00 ff fe ff ff ff ff ff 00 ff fe ; [$b40b] undefined
    hex ff df ff ff df 00 ff ac ff b3 ff 9e ff 00 ff 5a ; [$b41b] undefined
    hex ff 9f ff ff ff 00 ff ce ff fd ff fd bf 00 ff ff ; [$b42b] undefined
    hex ff ff ff ff bf 00 ff 24 ff bd ff dd ff 00 ff 8a ; [$b43b] undefined
    hex ff ff ff ff ff 00 ff fd ff ff ff fe cc 00 ff bd ; [$b44b] undefined
    hex ff ff f7 ff 5b 00 ff 0a ff 6d ff 5a 9f 00 ff 9e ; [$b45b] undefined
    hex ff 53 ff fa 4f 00 ff c4 ff ff ff fb 4f 00 ff ff ; [$b46b] undefined
    hex ff ff ff ff b1 00 ff 8f ff 7d ff 64 ff 00 ff 62 ; [$b47b] undefined
    hex ff 7f ff e3 7f 00 ff f3 ff ff ff ff ff 00 ff ff ; [$b48b] undefined
    hex ff ff ff ff 09 00 ff 16 ff 4d ff 29 ff 00 ff 6e ; [$b49b] undefined
    hex ff fb ff bb bf 00 ff df ff ff ff ef 6e 00 ff ff ; [$b4ab] undefined
    hex ff ff ff ff 81 00 ff 04 ff 0b ff e3 ff 00 ff b0 ; [$b4bb] undefined
    hex ff e6 ff fe ff 00 ff ec ff af ff ef ff 00 ff ff ; [$b4cb] undefined
    hex ff ff ff ff 38 00 ff a5 ff f3 ff 7f bf 00 ff 3f ; [$b4db] undefined
    hex ff b7 fb ef 6f 00 ff de ff ff ff ff 67 00 ff ff ; [$b4eb] undefined
    hex ff fb f7 ff a2 00 ff f8 ff e7 ff ca bf 00 ff a0 ; [$b4fb] undefined
    hex ff ff ff fc ff 00 ff df ff fb ff ff f7 00 ff ff ; [$b50b] undefined
    hex ff ff ff ff af 00 ff 06 ff b5 ff a7 ff 00 ff 56 ; [$b51b] undefined
    hex ff f5 ff f7 6f 00 ff 5f ff ff ff f5 ff 00 ff bf ; [$b52b] undefined
    hex ff ff ff ff f7 00 ff a0 ff 7e ff be ff 00 ff ea ; [$b53b] undefined
    hex ff f7 ff 69 5e 00 ff db ff ff ff ff 7f 00 ff 57 ; [$b54b] undefined
    hex ff ff ff ff 2f 00 ff 00 ff db ff a8 fe 00 ff be ; [$b55b] undefined
    hex ff 7f ff bf fe 00 ff e5 ff ef ff df 7e 00 ff ff ; [$b56b] undefined
    hex ff f7 ff ff f3 00 ff 02 ff f3 ff 60 7f 00 ff 97 ; [$b57b] undefined
    hex ff fd ff ff dc 00 ff ff ff d7 ff bd ff 00 ff e7 ; [$b58b] undefined
    hex ff ff ff fb 9c 00 ff 82 ff e7 ff d7 ff 00 ff 7d ; [$b59b] undefined
    hex ff e7 ff f7 ff 00 ff 0a ff ff ff de 97 00 ff bf ; [$b5ab] undefined
    hex ff e7 ff ff 98 00 ff 07 ff 60 ff da ff 00 ff 88 ; [$b5bb] undefined
    hex ff fe ff fd ff 00 ff e7 ff fa ff ff ef 00 ff ff ; [$b5cb] undefined
    hex ff ff ff ff 6f 00 ff 21 ff fd ff fe fb 00 ff 90 ; [$b5db] undefined
    hex ff fb ff 76 fe 00 ff e1 ff 7f ff fd 3f 00 ff ff ; [$b5eb] undefined
    hex ff ff ff f7 4e 00 ff 24 ff 1f ff 6d ef 00 ff af ; [$b5fb] undefined
    hex ff 7d ff e9 ff 00 ff 36 ff 7f ff ff b7 00 ff ff ; [$b60b] undefined
    hex ff ff ff f7 ff 00 ff c3 ff ff ff ef ff 00 ff 98 ; [$b61b] undefined
    hex ff 7f ff ff fe 00 ff aa ff fe ff fd ff 00 ff fe ; [$b62b] undefined
    hex ff bf ff ff fb 00 ff 84 ff bf ff b7 ff 00 ff f7 ; [$b63b] undefined
    hex ff ff ff 7b ff 00 ff bf ff ff ff ff 7b 00 fd fb ; [$b64b] undefined
    hex ff ff ff ff 55 00 ff 68 ff e5 ff d8 ff 00 ff 03 ; [$b65b] undefined
    hex ff ff ff 7e ff 00 ff bb ff fb ff fd 7b 00 ff fe ; [$b66b] undefined
    hex ff ff ff ff ef 00 ff 80 ff e9 ff bb f7 00 ff 32 ; [$b67b] undefined
    hex ff ed ff 4d fb 00 ff a5 ff df ff df 3f 00 ff ff ; [$b68b] undefined
    hex ff ff 7f ff e4 00 ff 00 ff cd ff bb ff 00 ff c2 ; [$b69b] undefined
    hex ff dd ff f7 7f 00 ff 46 ff fd ff bf 7f 00 ff fe ; [$b6ab] undefined
    hex ff fb ff ff 5b 00 ff a0 ff dc ff f4 ff 00 ff f9 ; [$b6bb] undefined
    hex ff c5 ff fb bf 00 ff ff ff fb ff f3 fe 00 ff ff ; [$b6cb] undefined
    hex 7f ff ff ff 60 00 ff 35 ff 81 ff f3 ff 00 ff c1 ; [$b6db] undefined
    hex ff ff ff 7b 3f 00 ff fd ff ff ff ff 5e 00 ff fb ; [$b6eb] undefined
    hex ff ff ff ff 0d 00 ff 85 ff f8 ff b2 ff 00 ff f5 ; [$b6fb] undefined
    hex ff ff ff f7 ff 00 ff e9 ff ef ff ff ff 00 ff ed ; [$b70b] undefined
    hex ff ff ff ff db 00 ff e8 ff fe ff f5 ff 00 ff a6 ; [$b71b] undefined
    hex ff ff ff df ff 00 ff 6f ff f7 ff fd be 00 ff ff ; [$b72b] undefined
    hex ff ff ff ff 6b 00 ff 86 ff 75 ff d8 ff 00 ff 28 ; [$b73b] undefined
    hex ff f7 ff f9 ff 00 ff af ff ff ff f7 fd 00 ff fe ; [$b74b] undefined
    hex ff fe ff ff f7 00 ff a0 ff a5 ff be bf 00 ff 95 ; [$b75b] undefined
    hex ff bf ff af ff 00 ff 7d ff ff ff ef cb 00 ff fb ; [$b76b] undefined
    hex ff ff ff fe be 00 ff 0a ff 5a ff b4 f7 00 ff 1b ; [$b77b] undefined
    hex ff bd ff 79 ff 00 ff ff ff f7 ff ff cf 00 ff fe ; [$b78b] undefined
    hex ff ff ff ff ed 00 ff 20 ff 23 ff d3 ff 00 ff bd ; [$b79b] undefined
    hex ff ce ff ce ff 00 ff 37 ff ef ff ff ff 00 ff ff ; [$b7ab] undefined
    hex ff ff ff ff fb 00 ff 45 ff 5e ff 9f ff 00 ff f8 ; [$b7bb] undefined
    hex ff 75 ff ff ff 00 ff b1 ff ff ff ff b5 00 ff f7 ; [$b7cb] undefined
    hex ff df ff ff 17 00 ff c6 ff f0 ff 83 ff 00 ff f8 ; [$b7db] undefined
    hex ff ef ff ef dd 00 ef ff ff ff ff ef df 00 ff ff ; [$b7eb] undefined
    hex ff ff ff ff 4e 00 ff 80 ff ff ff fe ff 00 ff d2 ; [$b7fb] undefined
    hex ff ff ff ef ef 00 ff af ff f6 ff ff ff 00 ff de ; [$b80b] undefined
    hex ff fe ff ff f3 00 ff f0 ff 7d ff 66 fb 00 ff e6 ; [$b81b] undefined
    hex ff e2 ff ff f7 00 ff df ff ff ff fe ff 00 ff d7 ; [$b82b] undefined
    hex ff ff fb fd fe 00 ff 72 ff ed ff f7 ff 00 ff e8 ; [$b83b] undefined
    hex ff be ff ff ff 00 ff c6 ff ff ff fd ee 00 ff ff ; [$b84b] undefined
    hex ff fd bf f5 e1 00 ff ac ff 31 ff ee fd 00 ff 03 ; [$b85b] undefined
    hex ff be ff ef 9e 00 ff f9 ff 7f ff df 5f 00 ff fd ; [$b86b] undefined
    hex ff 7f ff fb fb 00 ff 48 ff 8c ff 70 df 00 ff 93 ; [$b87b] undefined
    hex ff ff ff e7 ff 00 ff 75 ff ff ff ff ab 00 ff f5 ; [$b88b] undefined
    hex ff ff f7 ff 40 00 ff 34 ff f3 ff f4 ff 00 ff ac ; [$b89b] undefined
    hex ff ff ff ff bf 00 ff dd ff fa ff ef 32 00 ff ff ; [$b8ab] undefined
    hex ff fe ff ff 2a 00 ff 22 ff 68 ff b6 de 00 ff 0e ; [$b8bb] undefined
    hex ff 66 ff 72 ed 00 ff da ff fe ff fd df 00 ff ff ; [$b8cb] undefined
    hex ff fb fb ff 17 00 ff 30 ff b5 ff de 7f 00 ff 79 ; [$b8db] undefined
    hex fb d7 ff db ee 00 ff f9 ff ff ff ff 5a 00 ff f7 ; [$b8eb] undefined
    hex ff ff ff ff 4f 00 ff fc ff 8c ff df ff 00 ff a1 ; [$b8fb] undefined
    hex ff f5 ff ef f7 00 ff 75 ff fa fb ff ff 00 ff 5f ; [$b90b] undefined
    hex ff ff bf ff ff 00 ff 00 ff b2 ff 1e 7f 00 ff 53 ; [$b91b] undefined
    hex ff ee ff df df 00 ff e9 ff fe ff ff d7 00 ff ff ; [$b92b] undefined
    hex ff ff ff ff 7d 00 ff 80 ff fa ff ff ff 00 ff 6a ; [$b93b] undefined
    hex ff 7e ff ff f7 00 ff fe ff db ff fe f7 00 ff fe ; [$b94b] undefined
    hex ff ff ff ff 47 00 ff a7 ff 65 ff e5 ff 00 ff 50 ; [$b95b] undefined
    hex ff ef ff ba fd 00 ff 7e ff fe ff ff ff 00 ff ff ; [$b96b] undefined
    hex ff ff ff ff 0f 00 ff 4c ff e8 ff 32 ff 00 ff 11 ; [$b97b] undefined
    hex ff fa ff 46 ff 00 ff 9d ff ff ff ff 3f 00 ff f7 ; [$b98b] undefined
    hex ff ff ff ff 25 00 ff 92 ff f2 ff 9f ff 00 ff ce ; [$b99b] undefined
    hex ff ed ff fa df 00 ff ac ff ff ff ff ff 00 ff fb ; [$b9ab] undefined
    hex ff fd ff df e4 00 ff b8 ff 7d ff 82 ff 00 ff f9 ; [$b9bb] undefined
    hex ff 77 ff fa fe 00 ff ba ff fe ff 7f 7f 00 ff df ; [$b9cb] undefined
    hex ff fb ff ff 27 00 ff 42 ff ca ff 4b ff 00 ff a4 ; [$b9db] undefined
    hex ff ff ff fb 95 00 ff fc ff ff ff f7 fb 00 ff f7 ; [$b9eb] undefined
    hex ff ff ff ff 75 00 ff 8c ff bf ff dc f7 00 ff b4 ; [$b9fb] undefined
    hex ff fa ff df ff 00 ff ca ff ff ff be df 00 ff f7 ; [$ba0b] undefined
    hex ff ff ff ff fe 00 ff 93 ff 37 ff 91 fb 00 ff 6c ; [$ba1b] undefined
    hex ff df ff f7 ff 00 ff 5e ff df ff ff f5 00 ff fa ; [$ba2b] undefined
    hex ff ff ff ff 97 00 ff 04 ff dc ff 7c bb 00 ff ba ; [$ba3b] undefined
    hex ff de ff fc bf 00 ff 32 ff bf ff ff cb 00 fd fe ; [$ba4b] undefined
    hex ff ff ff ff dd 00 ff 8e ff 9d ff e5 df 00 ff fb ; [$ba5b] undefined
    hex ff fe ff df ff 00 ff f7 ff fb ff df d7 00 ff ff ; [$ba6b] undefined
    hex ff ff ff ff f3 00 ff b0 ff e7 ff 5c ff 00 ff df ; [$ba7b] undefined
    hex ff 9d ff ff ff 00 ff cc ff ff ff ff ae 00 ff 5f ; [$ba8b] undefined
    hex ff ff df ff 6e 00 ff 8c ff 5d ff f5 ff 00 ff 71 ; [$ba9b] undefined
    hex ff fe ff ff bf 00 ff f7 ff ff ff af 6e 00 ff f1 ; [$baab] undefined
    hex ff ff ff ff 07 00 ff 34 ff 2b ff fe ff 00 ff d8 ; [$babb] undefined
    hex ff fa ef fe ff 00 ff f0 7f ff ff ff b9 00 ff fb ; [$bacb] undefined
    hex ff bd ff ff 7e 00 ff c2 ff 46 ff fb ff 00 ff f6 ; [$badb] undefined
    hex ff 87 ff fd 9e 00 ff 7b ff ff ff ff 33 00 7f ff ; [$baeb] undefined
    hex ff ff ff ff 93 00 ff 84 ff ed ff 6d ff 00 ff b1 ; [$bafb] undefined
    hex ff e7 ff 7f ff 00 ff fa ff ef ff ff ff 00 ff ff ; [$bb0b] undefined
    hex ff ff ff ff b7 00 ff 80 ff eb ff ff ff 00 ff d7 ; [$bb1b] undefined
    hex ff fd ff 7b fe 00 ff ff ff ef ff bf df 00 ff 7f ; [$bb2b] undefined
    hex ff ff ff ff df 00 ff b8 ff ed ff ad ff 00 ff 5d ; [$bb3b] undefined
    hex ff b7 ff bf bb 00 ff de ff bf ff ff f9 00 ff fb ; [$bb4b] undefined
    hex ff ff ff ff 26 00 ff e4 ff e7 ff a1 ff 00 ff b7 ; [$bb5b] undefined
    hex ff 3e ff ff 5f 00 ff f4 ff fb ff 7f bd 00 ff df ; [$bb6b] undefined
    hex ff 5f ff ff f7 00 ff 80 ff dd ff dc fe 00 ff db ; [$bb7b] undefined
    hex ff ff ff f7 ff 00 ff ee ff ff ff ff 7d 00 ff ff ; [$bb8b] undefined
    hex ff ff ff ff dd 00 ff 9a ff 51 ff cd ff 00 ff 12 ; [$bb9b] undefined
    hex ff ef ff ff fe 00 ff 7e ff 3f ff df b7 00 ff ff ; [$bbab] undefined
    hex ff ff ff fd e9 00 ff a3 ff e3 ff f4 ff 00 ff b0 ; [$bbbb] undefined
    hex ff fd ff fa ad 00 ff 7f ff ff ff fd 79 00 ff ff ; [$bbcb] undefined
    hex ff ff ff bf 89 00 ff ba ff e9 ff 80 ff 00 ff 74 ; [$bbdb] undefined
    hex ff ff ff 7b cf 00 ff df ff 7f ff ff b1 00 ff fd ; [$bbeb] undefined
    hex df ff bf ff 4b 00 ff ce ff 7e ff 29 bf 00 ff f7 ; [$bbfb] undefined
    hex ff ef ff ef df 00 ff ef ff ff ff ff ef 00 ff de ; [$bc0b] undefined
    hex ff ff ff ff 6b 00 ff 73 ff ef ff ff ff 00 ff a3 ; [$bc1b] undefined
    hex ff ff ff fe bd 00 ff df ff f7 ff f5 bf 00 ff ff ; [$bc2b] undefined
    hex ff ff fe df 5f 00 ff c1 ff 36 ff fd ff 00 ff d3 ; [$bc3b] undefined
    hex ff 7b ff bb 7f 00 ff ca ff ff ff fe f7 00 ff ff ; [$bc4b] undefined
    hex ff ff ff ff 3f 00 ff 14 ff ab ff bd b7 00 ff 7f ; [$bc5b] undefined
    hex ff ef ff fb f5 00 ff bf ff ff ff 5f d7 00 ff ff ; [$bc6b] undefined
    hex ff ff ff ff 45 00 ff 70 ff fa ff 67 ff 00 ff bb ; [$bc7b] undefined
    hex ff e9 ff ef bf 00 ff 2d ff ef ff df bf 00 ff ca ; [$bc8b] undefined
    hex ff ff ff ff 78 00 ff 4a ff 36 bf f1 ff 00 ff d4 ; [$bc9b] undefined
    hex ff ed ff 7b ff 00 ff df ff fa ff ff 7e 00 ff ef ; [$bcab] undefined
    hex ff ff f7 ff 25 00 ff 46 ff ac ff bb bf 00 ff 36 ; [$bcbb] undefined
    hex ff f7 ff df 7f 00 ff c1 ff bf ff ff fb 00 ff ef ; [$bccb] undefined
    hex ff ff ff ff 2e 00 ff 02 ff 18 ff f5 fe 00 ff dd ; [$bcdb] undefined
    hex ff fc ff ff b7 00 ff bf ff be ff 7f ea 00 ff fd ; [$bceb] undefined
    hex ff ff ef ff 87 00 ff 02 ff fa ff dc ff 00 ff ea ; [$bcfb] undefined
    hex ff 7f ff f9 ff 00 ff fa ff ff ff ff f7 00 ff ff ; [$bd0b] undefined
    hex ff ff ff ff bf 00 ff 46 ff fb ff ff ff 00 ff 3d ; [$bd1b] undefined
    hex ff ef ff ff 7f 00 ff be ff ff ff ff d5 00 ff ff ; [$bd2b] undefined
    hex ff ff ff ff 5b 00 ff 62 ff aa ff bd fb 00 ff 8b ; [$bd3b] undefined
    hex ff ef ff ff ff 00 ff f5 ff ff ff ff 5f 00 ff ff ; [$bd4b] undefined
    hex ff ff f7 ff 61 00 ff 90 ff e2 ff ff ff 00 ff 87 ; [$bd5b] undefined
    hex ff cb ff 53 ff 00 ff ec ff ff ff ff 7b 00 ff ff ; [$bd6b] undefined
    hex ff ff ff ff 53 00 ff 01 ff 9c ff e2 ff 00 ff a8 ; [$bd7b] undefined
    hex ff fe ff de ef 00 ff 57 ff fd ff fc fa 00 ff f7 ; [$bd8b] undefined
    hex ff ff ff ff 76 00 ff 46 ff b0 ff 6e ff 00 ff 33 ; [$bd9b] undefined
    hex ff f3 ff fb fa 00 ff f7 ff bf ff ff 9b 00 ff ff ; [$bdab] undefined
    hex ff f7 ff ff 11 00 ff 44 ff a6 ff ca ff 00 ff f5 ; [$bdbb] undefined
    hex ff f2 ff ef df 00 ff dc ff ff ff fd bb 00 ff f7 ; [$bdcb] undefined
    hex ff ff ff ff 97 00 ff 75 ff 55 ff 1b 9f 00 ff 9f ; [$bddb] undefined
    hex ff 7f ff 7f fb 00 ff 3b ff f7 ff fd f7 00 fe ff ; [$bdeb] undefined
    hex ff ff ff ff c5 00 ff a5 ff 72 ff fa fe 00 ff 62 ; [$bdfb] undefined
    hex ff f9 ff ef 5f 00 ff 5c ff bf ff ef ff 00 ff ff ; [$be0b] undefined
    hex ff ff ff fe ff 00 ff c0 ff 51 ff fe ff 00 ff b7 ; [$be1b] undefined
    hex ff f6 ff ff ef 00 ff bb ff ff ff fd fb 00 ff f7 ; [$be2b] undefined
    hex ff fd ff ff 3b 00 ff c4 ff 95 ff ad ff 00 ff ce ; [$be3b] undefined
    hex ff f6 ff fa df 00 ff ef ff ff ff ff ef 00 ff f5 ; [$be4b] undefined
    hex ff ff ff fd 02 00 ff d0 ff 4e ff 54 ff 00 ff ce ; [$be5b] undefined
    hex ff ff ff f6 7f 00 ff ff ff ff ff 7b 5f 00 ff be ; [$be6b] undefined
    hex ff ff df ff 5e 00 ff 41 ff b6 ff 3f ff 00 ff 71 ; [$be7b] undefined
    hex ff ef ff 37 df 00 ff 23 ff f7 ff fe db 00 ff ff ; [$be8b] undefined
    hex ff ff fb ff fd 00 ff 71 ff 1a ff 9d ff 00 ff 2d ; [$be9b] undefined
    hex ff f7 ff fb ff 00 ff fd ff ff ff fd 77 00 ff ff ; [$beab] undefined
    hex ff ff ff ff 2f 00 ff 63 ff d1 ff 34 ff 00 ff d9 ; [$bebb] undefined
    hex ff bf ff 5d 7f 00 ff 3f ff fe ff db fe 00 ff 7d ; [$becb] undefined
    hex ff ff ff ff 4d 00 ff c0 ff f4 ff fa ff 00 ff f6 ; [$bedb] undefined
    hex ff f4 ff ef ef 00 ff de ff f7 ff ef 0d 00 bf ff ; [$beeb] undefined
    hex ff ff ff ff bc 00 ff 86 ff dd ff af fd 00 ff 6d ; [$befb] undefined
    hex ff 79 ff ff ff 00 ff f7 ff ff ff 7f ff 00 ff ff ; [$bf0b] undefined
    hex ff f7 ff ff 3f 00 ff 14 ff fc ff ee 7f 00 ff 9a ; [$bf1b] undefined
    hex ff fc ff f7 ff 00 ff d1 ff fb ff fb ff 00 ff ff ; [$bf2b] undefined
    hex ff ff ff ff e7 00 ff 50 ff de ff d7 ff 00 ff 3a ; [$bf3b] undefined
    hex ff f7 ff ff ff 00 ff ff ff 7f ff f9 f7 00 ff ff ; [$bf4b] undefined
    hex ff ff ff ff 5f 00 ff 90 ff 67 ff b0 ff 00 ff 97 ; [$bf5b] undefined
    hex ff ff ff ff 7f 00 ff 5f ff ff ff ff de 00 ff ef ; [$bf6b] undefined
    hex ff ff ff ff 3a 00 ff 8c ff 7c ff f4 ff 00 ff e8 ; [$bf7b] undefined
    hex ff cc ff ff bf 00 ff e7 ff ff ff bf fc 00 ff ff ; [$bf8b] undefined
    hex 7f ff ff ff 83 00 ff 61 ff e6 ff 5c f7 00 ff 9b ; [$bf9b] undefined
    hex ff db ff bd fd 00 ff bd ff fe ff ff de 00 ff fd ; [$bfab] undefined
    hex ff ff ff ff 7f 00 ff 70 ff ff ff d9 ff 00 ff ef ; [$bfbb] undefined
    hex ff fe ff ff 6d 00 ff fa ff fd ff 7e 2b 00 ff dd ; [$bfcb] undefined
    hex ff ff f7 ff 1d 00 ff 48 ff df ff e5 ff 00 ff 89 ; [$bfdb] undefined
    hex ff ff ff ff 8f 00 ff 7f ff 7d ff fe ff 00 ff ff ; [$bfeb] undefined
    db $f7,$ff,$ff,$ff,$19                  ; [$bffb] undefined
