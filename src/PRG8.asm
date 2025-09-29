;============================================================================
; Faxanadu (U).nes
;
; PRG8 ($8000 - $bfff)
;============================================================================

BASE $8000

;
; XREFS:
;     Maybe_Player_LoadArmorSprite
;
DAT_PRG8__8000:                             ; [$8000]
    db $12                                  ; [$8000] undefined

;
; XREFS:
;     Maybe_Player_LoadArmorSprite
;
DAT_PRG8__8001:                             ; [$8001]
    db $00                                  ; [$8001] undefined

;
; XREFS:
;     Maybe_Player_LoadWeaponSprite
;
DAT_PRG8__8002:                             ; [$8002]
    db $6b                                  ; [$8002] undefined

;
; XREFS:
;     Maybe_Player_LoadWeaponSprite
;
DAT_PRG8__8003:                             ; [$8003]
    db $01                                  ; [$8003] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__eea9
;
DAT_PRG8__8004:                             ; [$8004]
    db $a4                                  ; [$8004] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__eea9
;
DAT_PRG8__8005:                             ; [$8005]
    db $01                                  ; [$8005] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;
DAT_PRG8__8006:                             ; [$8006]
    db $94                                  ; [$8006] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;
DAT_PRG8__8007:                             ; [$8007]
    db $0a                                  ; [$8007] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__ce80
;
DAT_PRG8__8008:                             ; [$8008]
    db $04                                  ; [$8008] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__ce80
;
DAT_PRG8__8009:                             ; [$8009]
    db $0c                                  ; [$8009] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__ee93
;
DAT_PRG8__800a:                             ; [$800a]
    db $04                                  ; [$800a] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__ee93
;
DAT_PRG8__800b:                             ; [$800b]
    db $11                                  ; [$800b] undefined

;
; XREFS:
;     Maybe_Player_LoadShieldSprite
;
DAT_PRG8__800c:                             ; [$800c]
    db $8c                                  ; [$800c] undefined

;
; XREFS:
;     Maybe_Player_LoadShieldSprite
;
DAT_PRG8__800d:                             ; [$800d]
    db $01                                  ; [$800d] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__f2e3
;
DAT_PRG8__800e:                             ; [$800e]
    db $24                                  ; [$800e] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__f2e3
;
DAT_PRG8__800f:                             ; [$800f]
    db $12                                  ; [$800f] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__f316
;
DAT_PRG8__8010:                             ; [$8010]
    db $6b                                  ; [$8010] undefined

;
; XREFS:
;     FUN_PRG15_MIRROR__f316
;
DAT_PRG8__8011:                             ; [$8011]
    hex 13 22 00 f2 00 56 00 1a 01 8a 00 42 01 bf 00 bf ; [$8011] undefined
    hex 00 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e ; [$8021] undefined
    hex 0f 10 11 12 13 14 29 2a 2b 2c 2d 2e 4b 4c 4d 4e ; [$8031] undefined
    hex 4f 50 51 52 57 58 59 5a 5b 5c 5d 5e 5f 75 76 77 ; [$8041] undefined
    hex 78 79 7a 7b 7c 00 01 06 07 08 09 0e 13 14 15 16 ; [$8051] undefined
    hex 17 18 19 1a 1b 1c 1d 1e 1f 20 2b 2c 2d 2e 2f 30 ; [$8061] undefined
    hex 4b 4c 51 52 53 54 55 56 57 58 59 5e 5f 60 61 62 ; [$8071] undefined
    hex 63 75 76 7b 7c 7d 7e 7f 80 00 01 15 16 17 18 21 ; [$8081] undefined
    hex 22 08 09 19 1a 1b 1c 23 24 1d 1e 1f 20 25 26 2f ; [$8091] undefined
    hex 30 2b 2c 2d 2e 4b 4c 53 54 55 56 6a 6b 57 58 59 ; [$80a1] undefined
    hex 60 61 62 63 73 74 75 76 7d 7e 7f 80 87 88 31 32 ; [$80b1] undefined
    hex 33 34 35 36 21 22 37 38 39 3a 3b 3c 3d 3e 3f 40 ; [$80c1] undefined
    hex 41 42 43 44 45 46 47 48 64 65 66 67 68 69 6a 6b ; [$80d1] undefined
    hex 6c 6d 6e 6f 70 71 72 73 74 81 82 83 84 85 86 87 ; [$80e1] undefined
    hex 88 00 01 89 8a 8b 8c 06 07 08 09 0e 13 14 49 4a ; [$80f1] undefined
    hex 4b 4c 4d 4e 4f 50 51 52 57 58 59 5a 5b 5c 5d 5e ; [$8101] undefined
    hex 5f 75 76 77 78 79 7a 7b 7c 00 01 8d 8a 8e 8c 06 ; [$8111] undefined
    hex 07 08 09 0e 13 14 49 4a 4b 4c 53 54 55 56 51 52 ; [$8121] undefined
    hex 57 58 59 60 61 62 63 5e 5f 75 76 7d 7e 7f 80 7b ; [$8131] undefined
    hex 7c 00 01 8d 8a 8e 8c 21 22 08 09 23 24 25 26 49 ; [$8141] undefined
    hex 4a 4b 4c 53 54 55 56 6a 6b 57 58 59 60 61 62 63 ; [$8151] undefined
    hex 73 74 75 76 7d 7e 7f 80 87 88 73 01 76 01 7c 01 ; [$8161] undefined
    hex 83 01 12 00 09 0e 0f 01 02 0a 09 10 11 03 04 05 ; [$8171] undefined
    hex 0b 09 0d 13 14 15 16 06 07 08 0c 92 01 98 01 9e ; [$8181] undefined
    hex 01 00 01 06 07 0c 0d 02 03 08 09 0e 0f 04 05 0a ; [$8191] undefined
    db $0b,$10,$11                          ; [$81a1] undefined

    db $00,$3e,$5f,$4f,$1f,$1f,$5b,$03,$00,$00,$20,$30,$38,$2a,$7e,$3c ; [$81a5]
                                                                       ; byte
    hex 00 00 00 00 80 c0 80 c0 00 00 00 00 00 00 00 00 ; [$81b4] undefined
    hex 07 3f 0b 1f 1e 0f 0c 5f 38 01 17 1e 1d 1e 1f e0 ; [$81c4] undefined
    hex 80 80 e0 d0 70 a8 58 f8 00 c0 00 e0 e0 70 b0 30 ; [$81d4] undefined
    hex 9e ff 1c 0e 1f 0b 39 33 ef 00 0f 1f 03 1c 1e 3c ; [$81e4] undefined
    hex f8 f0 e0 40 40 c0 80 80 30 30 70 a0 80 00 00 00 ; [$81f4] undefined
    hex 27 2a 69 68 68 68 68 c8 78 71 31 30 30 30 70 f0 ; [$8204] undefined
    hex 80 c0 20 80 10 40 50 a0 00 00 c0 e0 60 70 60 c0 ; [$8214] undefined
    hex 3e 5f 4f 1f 1f 43 13 07 00 20 30 38 2a 7e 3c 38 ; [$8224] undefined
    hex 00 00 00 80 c0 80 c0 00 00 00 00 00 00 00 00 00 ; [$8234] undefined
    hex 3b 0f 10 0b 0b 17 0e 1c 07 07 0f 1f 1f 1b 17 0f ; [$8244] undefined
    hex 80 c0 c0 40 40 40 40 c0 00 80 00 80 80 80 80 00 ; [$8254] undefined
    hex 39 22 1e 0e 08 19 1d 1d 1e 1d 03 1f 17 0e 0e 0e ; [$8264] undefined
    hex 80 80 80 80 80 00 00 00 00 00 00 00 00 00 00 00 ; [$8274] undefined
    hex 18 0d 0d 0d 0c 0c 1e 18 0e 0e 06 06 07 07 0f 1e ; [$8284] undefined
    hex 07 0f 0e 0e 1d 09 3b 35 38 06 03 0d 0e 1e 1c 7a ; [$8294] undefined
    hex 80 c0 c0 e0 e0 f0 f0 f0 00 00 00 00 00 00 00 00 ; [$82a4] undefined
    hex 49 9f dc 0e 1f 1b 1e 1e f6 e0 0f 1f 0f 04 17 37 ; [$82b4] undefined
    hex 90 d0 f0 c0 40 c0 80 80 20 60 00 00 80 00 00 00 ; [$82c4] undefined
    hex 36 27 2b 28 28 28 68 08 3b 7b 71 31 30 30 70 f0 ; [$82d4] undefined
    hex 00 40 00 a0 10 40 50 20 80 80 c0 c0 e0 70 60 c0 ; [$82e4] undefined
    hex 07 3f 0d 3f 3d 09 1f ff 38 01 12 16 16 16 00 40 ; [$82f4] undefined
    hex c0 e0 f0 f0 70 a8 d8 f8 00 c0 e0 00 e0 70 30 30 ; [$8304] undefined
    hex 9c ff 1b 0f 0f 17 39 33 ef 00 05 15 15 08 1e 3c ; [$8314] undefined
    hex f8 f0 e0 e0 80 00 80 80 30 70 70 00 40 c0 00 00 ; [$8324] undefined
    hex 3f 0f 17 15 07 0f 1e 1c 03 03 08 1b 1b 13 07 0f ; [$8334] undefined
    hex 40 c0 c0 40 40 40 80 80 80 80 00 80 80 80 00 00 ; [$8344] undefined
    hex 39 26 1e 1e 1f 19 1d 1d 1e 19 05 15 00 0e 0e 0e ; [$8354] undefined
    hex 80 80 80 80 80 00 00 00 00 00 00 00 00 00 00 00 ; [$8364] undefined
    hex 09 1e 0e 0e 1d 09 32 3c 36 0f 03 0d 0e 1e 0d 73 ; [$8374] undefined
    hex 80 c0 80 e0 a0 70 50 70 00 00 40 00 40 80 a0 80 ; [$8384] undefined
    hex 48 9f de 0f 0f 17 1e 1e f7 e0 05 15 15 08 17 37 ; [$8394] undefined
    hex 90 d0 f0 c0 40 c0 80 80 20 60 00 00 80 00 00 00 ; [$83a4] undefined
    hex 3f 3c 34 34 34 3c 24 64 38 21 08 18 18 00 38 78 ; [$83b4] undefined
    hex c0 e0 f0 78 38 20 28 50 00 80 a0 30 20 18 30 60 ; [$83c4] undefined
    hex 0e 0e 04 06 06 07 0f 0c 0d 09 03 03 03 00 07 0f ; [$83d4] undefined
    hex 00 80 80 80 00 80 00 00 00 00 00 00 80 00 80 00 ; [$83e4] undefined
    hex 1b 1f 1d 14 14 14 34 04 15 18 11 08 18 18 38 78 ; [$83f4] undefined
    hex 00 e0 c0 d0 68 24 28 10 c0 00 a0 60 70 38 30 60 ; [$8404] undefined
    hex c0 a0 a0 e0 a0 20 a0 20 00 c0 c0 00 c0 c0 c0 c0 ; [$8414] undefined
    hex 40 80 80 00 00 00 00 00 80 00 00 80 80 00 00 00 ; [$8424] undefined
    hex 07 0f 1b 1f 3e 0f 96 3f 38 01 17 3e 1f 1e cf e0 ; [$8434] undefined
    hex 80 80 e0 d0 70 a8 58 f8 00 c0 00 e0 e0 70 b0 30 ; [$8444] undefined
    hex 77 5f 2d 5c 19 28 16 0b 0d 31 76 6f 6e 17 09 04 ; [$8454] undefined
    hex c8 10 e0 40 80 00 00 00 f0 e0 00 80 00 80 c0 c0 ; [$8464] undefined
    hex 04 04 00 00 00 00 00 00 06 02 02 00 00 00 00 00 ; [$8474] undefined
    hex 00 00 00 00 00 00 00 00 40 40 00 00 00 00 00 00 ; [$8484] undefined
    hex 07 0b 0d 3f 3d 2c 9f 12 38 05 12 16 16 13 e0 ed ; [$8494] undefined
    hex c0 e0 f0 f0 70 a8 d8 f8 00 c0 e0 00 e0 70 30 f0 ; [$84a4] undefined
    hex 00 2f 3c 3e 3d 1f 07 3d 00 2e 37 39 3e 00 1b 3e ; [$84b4] undefined
    hex 00 00 80 40 40 c0 c0 c0 00 00 00 80 80 00 00 00 ; [$84c4] undefined
    hex 3f 3f 17 9f de cd 9f 6f 39 33 2a 8a 4b 43 c4 b7 ; [$84d4] undefined
    hex f8 f8 f8 f8 f0 74 fc 7c a8 78 c8 90 38 b8 00 98 ; [$84e4] undefined
    hex ee 7f 17 0f 0f 05 09 3b 57 20 0a 02 00 0e 1e 24 ; [$84f4] undefined
    hex 7c ec c8 70 e0 a0 c0 c0 a8 70 70 80 80 40 00 00 ; [$8504] undefined
    hex 2f 3c 3e 3d 1f 07 3d 3f 2e 37 39 3e 00 1b 3e 39 ; [$8514] undefined
    hex 00 80 40 40 c0 c0 e0 c0 00 00 80 80 00 00 a0 e0 ; [$8524] undefined
    hex 2e 0f 0f 0f 03 8f 6f 17 33 20 05 0d 0d 81 e2 6f ; [$8534] undefined
    hex e0 70 a0 a0 a0 e0 c0 c0 30 80 c0 c0 c0 00 80 00 ; [$8544] undefined
    hex 1c 13 0f 0f 07 0e 0e 0e 0f 0c 02 0a 08 07 07 0b ; [$8554] undefined
    hex c0 40 40 40 c0 80 80 80 00 80 80 80 00 00 00 00 ; [$8564] undefined
    hex 0e 0e 04 06 06 07 0f 0c 0d 09 03 03 03 00 07 0f ; [$8574] undefined
    hex 00 80 80 80 00 80 00 00 00 00 00 00 80 00 80 00 ; [$8584] undefined
    hex 3f 3f 0f 06 07 0e 1d 8f 3a 33 24 03 07 0b 0a 74 ; [$8594] undefined
    hex c0 e0 f0 f0 f8 ac b0 6c 80 a0 c0 40 00 50 4c 80 ; [$85a4] undefined
    hex f6 8f 7f 07 0f 0b 0f 1f 79 70 02 0a 0a 04 0b 0b ; [$85b4] undefined
    hex f0 d6 ec e8 a0 e0 40 40 0c 1a 00 80 c0 00 80 80 ; [$85c4] undefined
    hex 1b 1f 1d 14 14 14 34 04 15 18 11 08 18 18 38 78 ; [$85d4] undefined
    hex 40 c0 e0 d0 68 28 28 10 80 00 80 60 70 30 30 60 ; [$85e4] undefined
    hex ee 7e 1f 39 73 7c 64 32 55 21 0c 1e 5c 60 58 1c ; [$85f4] undefined
    hex fc 0c f8 30 90 50 e4 fb e8 f0 00 c0 e0 e0 1a de ; [$8604] undefined
    hex 1b 0f 06 00 00 00 00 00 0c 02 03 03 01 00 00 00 ; [$8614] undefined
    hex 65 07 01 00 00 00 00 00 5a 02 02 01 00 00 00 00 ; [$8624] undefined
    hex 1c 0a 06 01 01 00 00 00 0f 07 01 02 02 00 00 00 ; [$8634] undefined
    hex 80 40 40 40 00 00 00 00 00 80 80 80 80 00 00 00 ; [$8644] undefined
    hex 00 07 0f 0b 05 06 06 00 00 00 00 04 06 03 0f 07 ; [$8654] undefined
    hex 00 c0 e0 e0 f0 b8 70 f8 00 00 00 00 00 40 80 00 ; [$8664] undefined
    hex 01 06 ef 5b f7 6f 1e 7f 06 07 db 3f 3b f3 e7 00 ; [$8674] undefined
    hex e0 60 18 08 0c 0b 11 ff 00 80 e0 f4 f6 f6 e6 08 ; [$8684] undefined
    hex 0c 0f 1e 0e 1d 1f 33 67 07 00 0f 1f 03 18 3c 38 ; [$8694] undefined
    hex 6e e6 00 00 20 40 e0 e0 81 00 e0 e0 c0 a0 00 00 ; [$86a4] undefined
    hex 4d 59 69 68 48 50 50 90 70 60 70 70 70 60 e0 e0 ; [$86b4] undefined
    hex e0 60 20 d0 68 28 24 6c 00 80 c0 e0 70 30 38 70 ; [$86c4] undefined
    hex 01 0e ef 5b f7 6f 1e 7f 06 0f d7 3d 3a f3 e7 00 ; [$86d4] undefined
    hex e0 e8 bc ac 4c 4b 51 ff 00 10 4c 50 b6 b6 a6 08 ; [$86e4] undefined
    hex 0c 0f 1f 0f 1d 1f 33 67 07 00 0a 1a 02 18 3c 38 ; [$86f4] undefined
    hex 6e e6 c0 c0 60 40 e0 e0 81 00 a0 a0 80 a0 00 00 ; [$8704] undefined
    hex 00 00 78 be 9f 4b 6b e7 00 00 00 40 60 74 34 f8 ; [$8714] undefined
    hex 00 00 00 00 80 00 80 00 00 00 00 00 00 00 00 00 ; [$8724] undefined
    hex 00 00 00 20 b8 e9 34 4f 00 00 00 20 20 5f 4b 00 ; [$8734] undefined
    hex 07 0f 1f 3f 7d fc 3c f0 78 73 06 66 be bf df 0f ; [$8744] undefined
    hex 00 20 d8 34 84 f4 64 f4 00 c0 e0 f8 78 18 98 18 ; [$8754] undefined
    hex 0f 0e 0f 0c 1e 1b 19 33 00 07 00 0f 03 0c 1e 3c ; [$8764] undefined
    hex d4 60 e0 e0 60 60 e0 e0 38 98 00 00 80 80 00 00 ; [$8774] undefined
    hex 2c 34 10 1a 0a 0a 1a 02 30 38 1c 1c 0c 0c 1c 3c ; [$8784] undefined
    hex e0 30 48 20 34 10 12 22 00 c0 70 38 38 1c 1c 3c ; [$8794] undefined
    hex 07 0f 7f 1f 7d bf 2e ff 78 71 03 60 83 db db 00 ; [$87a4] undefined
    hex c0 e0 c8 b4 9c f4 f4 f4 00 c0 b0 78 78 18 18 08 ; [$87b4] undefined
    hex 0e 0f 0f 0f 0f 0d 19 23 07 00 02 0a 00 0e 1e 3c ; [$87c4] undefined
    hex 74 f8 60 e0 60 e0 e0 e0 98 00 80 80 80 00 00 00 ; [$87d4] undefined
    hex 00 0b 0f 0f 0f 0f 0f 0f 00 0b 0d 0e 0f 00 00 0f ; [$87e4] undefined
    hex 00 c0 20 80 50 f0 b0 60 00 80 c0 60 a0 00 c0 80 ; [$87f4] undefined
    hex 1f 3a 3d 7d f5 6e 3c ec 00 1d 0e 56 ba d1 c7 0f ; [$8804] undefined
    hex e0 5c ce 4d 4b 57 ff fa 18 ac b0 b6 b6 a0 00 15 ; [$8814] undefined
    hex 0f 0e 0f 1f 1f 37 63 57 08 07 08 1a 02 38 5c 68 ; [$8824] undefined
    hex ae a0 e0 40 c0 60 e0 60 40 40 00 a0 a0 80 00 80 ; [$8834] undefined
    hex 59 70 48 48 48 38 c8 c8 20 40 70 70 70 00 70 f0 ; [$8844] undefined
    hex e0 e0 b0 78 08 3c 64 64 80 00 c0 60 30 00 38 78 ; [$8854] undefined
    hex 3f 3f 17 1f 1e cd ff 6f 39 33 2a 0a 0b 83 44 d7 ; [$8864] undefined
    hex 00 bc f2 f9 f5 ff 1f f7 00 b8 dc e6 fa 00 6c f8 ; [$8874] undefined
    hex 00 00 00 c0 ff f7 e5 0f 00 00 80 40 d9 49 9a 00 ; [$8884] undefined
    hex ef ff fb 7f fe ec 3f ec f0 c2 8d 2c af b7 d0 07 ; [$8894] undefined
    hex d0 f0 40 b8 fc dc f8 f8 a0 f0 b0 78 74 28 1c 1c ; [$88a4] undefined
    hex 0a 07 0f 0f 0f 0c 18 33 07 00 02 0a 00 0f 1f 2c ; [$88b4] undefined
    hex 7c fc fc f0 f0 e0 e0 e0 98 00 98 98 80 00 00 00 ; [$88c4] undefined
    hex 3f 36 1a 1a 0a 0e 19 21 30 08 1c 0c 0c 00 1e 3e ; [$88d4] undefined
    hex f0 f8 78 2c 16 0e 0b 17 00 00 40 10 18 00 1c 38 ; [$88e4] undefined
    hex 00 0b 2f 2f d7 d7 d7 af 00 30 70 70 60 60 60 70 ; [$88f4] undefined
    hex 00 c0 e0 e0 f0 f0 f0 ec 00 00 00 00 00 00 00 08 ; [$8904] undefined
    hex 6b 4d 2e 17 1b 08 0f 0b 34 36 17 0f 07 07 00 07 ; [$8914] undefined
    hex e6 de 7c e4 c8 1e e4 a0 0c 34 f6 fe f6 e0 00 c0 ; [$8924] undefined
    hex 0f 3f 0b 2c 3f 29 35 14 08 17 37 13 00 10 18 18 ; [$8934] undefined
    hex e0 c0 a0 60 e0 a0 60 60 20 e0 c0 80 00 40 c0 c0 ; [$8944] undefined
    hex 0c 3c 24 18 00 00 00 00 18 28 18 00 00 00 00 00 ; [$8954] undefined
    hex 20 60 20 60 70 30 20 c0 c0 80 c0 c0 c0 c0 c0 00 ; [$8964] undefined
    hex 7b 5d 3e 17 13 08 0f 0b 2c 2e 01 0e 0e 07 00 07 ; [$8974] undefined
    hex fe fe 7c ec c8 1e e4 a0 04 34 86 f6 f6 e0 00 c0 ; [$8984] undefined
    hex 07 37 03 2b 3f 29 35 14 08 1d 3d 15 00 10 18 18 ; [$8994] undefined
    hex e0 e0 e0 a0 e0 a0 60 60 00 40 40 40 00 40 c0 c0 ; [$89a4] undefined
    hex 00 0b 2c 59 db f9 d8 de 00 30 73 67 67 07 67 63 ; [$89b4] undefined
    hex 00 c0 20 90 d0 90 10 6c 00 00 c0 e0 e0 e0 e0 c8 ; [$89c4] undefined
    hex ab 7f 7f 35 14 09 0f 0b 5d 5c 21 0e 0f 07 00 07 ; [$89d4] undefined
    hex ce fe fc ae 28 9a ec 20 b0 38 82 74 f6 e4 00 c0 ; [$89e4] undefined
    hex 07 37 73 3b 7f 2d 35 15 08 1d 0d 65 00 10 18 18 ; [$89f4] undefined
    hex e0 e0 e0 a0 e0 a0 a0 a0 00 40 40 40 00 40 c0 c0 ; [$8a04] undefined
    hex 1d 3d 1d 05 01 01 01 00 00 28 38 18 00 00 00 00 ; [$8a14] undefined
    hex c0 80 e0 a0 b0 f0 a0 c0 20 e0 00 c0 c0 00 c0 00 ; [$8a24] undefined
    hex 27 1f 0b 0e 0f 07 07 07 18 01 06 05 05 05 01 07 ; [$8a34] undefined
    hex c0 a0 a0 e0 a0 20 a0 20 00 c0 c0 00 c0 c0 c0 c0 ; [$8a44] undefined
    hex 00 07 0f 1e 1f 1f 07 13 07 00 00 07 03 00 18 1c ; [$8a54] undefined
    hex 40 80 80 00 00 00 00 00 80 00 00 80 80 00 00 00 ; [$8a64] undefined
    hex 21 1f 1f 1f 07 07 07 07 1e 03 01 0c 0d 05 00 07 ; [$8a74] undefined
    hex 00 07 0d 1f 37 3f 3f 33 07 00 02 02 0a 08 00 0c ; [$8a84] undefined
    hex 10 18 08 0c 06 03 03 05 10 08 0c 04 04 05 02 05 ; [$8a94] undefined
    hex 80 80 c0 c0 60 60 30 38 80 c0 c0 60 60 30 30 10 ; [$8aa4] undefined
    hex 18 18 08 0c 06 03 03 05 18 08 0c 04 04 05 02 05 ; [$8ab4] undefined
    hex 00 00 00 00 01 01 00 00 00 00 00 00 00 01 00 00 ; [$8ac4] undefined
    hex 00 80 48 e8 48 74 ac 78 80 80 c8 48 64 24 bc f8 ; [$8ad4] undefined
    hex 38 18 08 0c 06 05 03 06 78 08 0c 04 04 03 02 05 ; [$8ae4] undefined
    hex 00 18 0c 06 03 01 00 00 00 18 1c 0e 07 03 01 00 ; [$8af4] undefined
    hex 00 00 00 00 00 80 c0 60 00 00 00 00 00 80 c0 e0 ; [$8b04] undefined
    hex 30 10 18 0c 06 03 07 03 70 38 0c 06 03 01 04 03 ; [$8b14] undefined
    hex 00 00 00 00 00 00 06 03 00 00 00 00 00 00 04 03 ; [$8b24] undefined
    hex 40 60 30 30 08 04 06 03 40 20 30 18 18 0c 06 01 ; [$8b34] undefined
    hex 40 64 36 33 0b 67 3f 1f 40 24 32 19 19 4d 26 19 ; [$8b44] undefined
    hex 00 00 60 38 0e 01 00 00 00 00 f0 78 1e 07 01 00 ; [$8b54] undefined
    hex 00 00 00 00 00 00 7f 18 00 00 00 00 00 00 7c 07 ; [$8b64] undefined
    hex 00 00 00 38 1f 04 00 00 00 00 00 3c 1f 03 00 00 ; [$8b74] undefined
    hex 00 00 00 00 00 c0 58 0b 00 00 00 00 00 e0 3c 07 ; [$8b84] undefined
    hex 06 03 7d 17 02 01 0b 02 07 01 38 0f 01 00 1d 07 ; [$8b94] undefined
    hex 00 80 80 80 f0 dc 1f 02 00 80 80 c0 e0 b8 87 01 ; [$8ba4] undefined
    hex 00 00 00 00 70 1b 0f 03 00 00 00 00 60 3d 07 00 ; [$8bb4] undefined
    hex 00 00 00 30 1f 03 00 00 00 00 00 38 0f 00 00 00 ; [$8bc4] undefined
    hex 00 00 00 00 00 f0 7f 0d 00 00 00 00 80 f8 0e 03 ; [$8bd4] undefined
    hex f0 5f 1c 00 00 00 00 00 f8 3f 03 00 00 00 00 00 ; [$8be4] undefined
    hex 00 00 e1 fd 1f 03 01 00 00 80 f1 1e 03 00 01 00 ; [$8bf4] undefined
    hex 3c 42 19 a5 a5 19 42 3c 3c 7c fe fe fe fe 7c 00 ; [$8c04] undefined
    hex 18 30 30 30 30 30 30 08 10 18 18 18 18 18 18 10 ; [$8c14] undefined
    hex 43 db 00 52 42 00 db c3 81 66 7e 3c 3c 7e 66 81 ; [$8c24] undefined
    hex 00 24 7e 3c 3c 7e 24 00 00 42 00 10 00 00 42 00 ; [$8c34] undefined
    hex 02 06 04 0c 0c 0c 18 18 02 06 06 0c 0c 1c 1c 1c ; [$8c44] undefined
    hex 03 2d c9 88 c1 88 c2 7f 3d 7f 7f 7f 7f 7f 3d 00 ; [$8c54] undefined
    hex 00 00 00 06 12 41 42 81 00 00 01 0f 3c 70 61 c3 ; [$8c64] undefined
    hex 07 1a c9 48 00 e2 30 9c 00 3c f0 80 00 00 c0 e0 ; [$8c74] undefined
    hex 00 00 00 03 04 08 10 20 00 00 01 03 06 0c 18 31 ; [$8c84] undefined
    hex 0a 58 20 00 00 05 90 40 04 20 c0 00 00 1a 60 80 ; [$8c94] undefined
    hex 10 38 44 54 ba ba c6 7c 00 00 38 38 7c 7c 38 00 ; [$8ca4] undefined
    hex 03 07 0f 0e 1e 1c 39 3b 03 07 0f 0f 1e 1c 3d 3b ; [$8cb4] undefined
    hex 00 0f f8 c0 00 3c f0 e0 00 7f f8 e0 80 7e f8 e0 ; [$8cc4] undefined
    hex 42 60 33 1d 0f 17 ff 1f 42 23 30 1b 17 0f ec 6d ; [$8cd4] undefined
    hex 10 20 d0 60 b0 da dc d4 10 30 20 80 c0 e7 ee 68 ; [$8ce4] undefined
    hex 68 a0 29 29 01 21 43 fe b4 fe fe fe fe fe bc 00 ; [$8cf4] undefined
    hex 00 10 10 10 32 53 93 b3 18 14 14 14 14 34 74 74 ; [$8d04] undefined
    hex 00 00 00 00 00 80 e0 3a 00 00 00 00 00 00 00 c0 ; [$8d14] undefined
    hex 02 0d 3f 61 4c be 3f 7f 00 00 00 1e 3f 7f ff ff ; [$8d24] undefined
    hex 00 00 10 1c 10 18 10 1d 00 c0 a0 a0 a0 a0 a0 a0 ; [$8d34] undefined
    hex 00 00 00 00 3c 47 99 bc 00 00 00 00 00 38 7e 7f ; [$8d44] undefined
    hex 00 00 00 00 06 81 e1 3b 00 00 00 00 00 04 04 c4 ; [$8d54] undefined
    hex 00 00 0e 3f 7f 63 dc bf 00 00 00 00 00 1c 3f 7f ; [$8d64] undefined
    hex 00 00 00 90 00 e1 fc 3a 00 00 00 00 00 00 00 c0 ; [$8d74] undefined
    hex 02 44 0f 10 a7 2f 5f 5f 23 66 40 cf df 9f bf bf ; [$8d84] undefined
    hex 00 00 16 c8 20 d0 cc e3 00 00 08 30 c0 e0 f0 fc ; [$8d94] undefined
    hex 10 10 38 28 44 54 44 38 00 00 00 10 38 38 38 00 ; [$8da4] undefined
    hex 33 33 27 26 64 44 40 40 3b 77 77 66 66 44 44 40 ; [$8db4] undefined
    hex 00 00 03 0f 3f 7c f9 e3 00 00 03 0f 3f 7e f9 f3 ; [$8dc4] undefined
    hex 1f 17 08 0c 37 21 20 00 0e 0f 07 1b 18 30 40 00 ; [$8dd4] undefined
    hex d8 98 30 e0 58 d8 84 00 60 e0 c0 10 b8 8c 84 80 ; [$8de4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$8df4] undefined
    hex 70 fe ff f0 6e 6d 6b 26 78 ff ff ff f1 73 76 7d ; [$8e04] undefined
    hex 00 00 80 e0 30 8c 76 e0 00 00 c0 e0 f8 7c ce 91 ; [$8e14] undefined
    hex 00 3c 7f 7f 78 77 36 35 00 00 00 00 07 0f 0f 0e ; [$8e24] undefined
    hex 10 18 0f 0e 01 17 37 37 10 08 08 05 0f 0f 0f fe ; [$8e34] undefined
    hex 40 00 c4 34 c8 d0 f8 ec 40 c0 02 cc f8 e0 26 b0 ; [$8e44] undefined
    hex 00 00 00 00 00 01 03 16 00 00 00 00 00 00 07 0f ; [$8e54] undefined
    hex 00 00 00 00 1f f4 a0 00 00 00 00 00 0f f8 c0 00 ; [$8e64] undefined
    hex 35 13 1b 0a 04 06 02 00 3b 3e 1c 0d 0e 06 02 01 ; [$8e74] undefined
    hex c0 80 00 00 00 00 00 00 20 40 80 00 00 00 00 00 ; [$8e84] undefined
    hex 33 1a 18 0d 05 06 03 01 0d 07 07 03 03 01 00 00 ; [$8e94] undefined
    hex 37 0b 00 14 3b 40 00 00 0e 07 0f 1b 30 60 00 00 ; [$8ea4] undefined
    hex c8 98 3c f6 26 e0 60 20 70 e0 d8 0c c2 40 60 20 ; [$8eb4] undefined
    hex 00 00 80 e0 70 1c c6 9b 00 00 00 00 80 e0 78 fc ; [$8ec4] undefined
    hex 30 60 c0 80 00 00 00 00 e0 c0 80 00 00 00 00 00 ; [$8ed4] undefined
    hex 70 fe ff ff 78 70 73 33 78 ff ff ff f8 70 73 73 ; [$8ee4] undefined
    hex 00 00 80 e0 f0 3c 8e e1 00 00 c0 e0 f8 3c 8e e1 ; [$8ef4] undefined
    hex 3b 19 1d 0c 06 06 02 01 3b 39 1d 0c 0e 06 02 01 ; [$8f04] undefined
    hex f8 9c 86 c0 c0 60 20 00 f8 9c 86 c0 c0 60 20 00 ; [$8f14] undefined
    hex 00 10 18 fc fe fc 18 10 00 10 18 fc fe fc 18 10 ; [$8f24] undefined
    hex 00 00 ff 7e 3c 18 00 00 00 00 ff 7e 3c 18 00 00 ; [$8f34] undefined
    hex 00 00 18 3c 7e ff 00 00 00 00 18 3c 7e ff 00 00 ; [$8f44] undefined
    hex 3c 66 66 0c 18 18 00 18 3c 66 66 0c 18 18 00 18 ; [$8f54] undefined
    hex 08 14 14 14 16 35 55 55 00 08 08 08 08 0a 2a 2a ; [$8f64] undefined
    hex 00 00 00 00 00 80 60 50 00 00 00 00 00 00 80 a0 ; [$8f74] undefined
    hex 54 50 50 40 20 20 10 10 2b 2f 2f 3f 1f 1f 0f 0f ; [$8f84] undefined
    hex 50 10 10 10 10 10 20 20 a0 e0 e0 e0 e0 e0 c0 c0 ; [$8f94] undefined
    hex 1c 38 38 1f 1f 2f 7e ff 3c 78 78 3c 03 1e 38 7f ; [$8fa4] undefined
    hex 00 00 2e f8 e0 80 00 30 00 00 1e f0 80 00 00 c0 ; [$8fb4] undefined
    hex 05 0d 1a 12 09 04 1b 2c 03 06 0c 0c 06 03 06 1f ; [$8fc4] undefined
    hex 30 80 00 00 80 00 80 6a c0 00 00 00 00 fc 00 80 ; [$8fd4] undefined
    hex 00 00 00 00 00 00 00 ff 00 00 00 00 00 00 00 00 ; [$8fe4] undefined
    hex fc c6 e6 e6 dc c0 c0 00 fc c6 e6 e6 dc c0 c0 00 ; [$8ff4] undefined
    hex 00 00 1e 03 09 be 7e 7f 00 00 00 3c 7e 7f ff ff ; [$9004] undefined
    hex 00 00 00 e0 9a e0 38 5f 00 00 00 00 00 00 c0 e0 ; [$9014] undefined
    hex 7e 7f bc 15 03 1e 00 00 ff ff 7f 7e 3c 00 00 00 ; [$9024] undefined
    hex ac 7e f0 4c e0 00 00 00 f0 c0 00 00 00 00 00 00 ; [$9034] undefined
    hex 00 00 00 00 3f 43 9c be 00 00 00 00 00 3c 7f 7f ; [$9044] undefined
    hex 00 00 00 00 00 80 e0 3c 00 00 00 00 00 00 00 c0 ; [$9054] undefined
    hex 00 15 2f 3d 58 31 67 33 00 00 00 02 07 0f 1f 0f ; [$9064] undefined
    hex 05 47 1d b2 71 47 ef 0f 00 00 02 0f 0f 3f 1f 7f ; [$9074] undefined
    hex 05 0a 0d aa 1f 2b 1f 4f 16 57 3f 5f 7f 7f ff 3f ; [$9084] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$9094] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90a4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90b4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90c4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90d4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90e4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90f4] undefined
    hex 00 e0 d0 f8 c8 e8 c8 e8 00 40 60 60 70 70 70 70 ; [$9104] undefined
    hex c8 e8 d0 e0 40 00 00 00 70 70 60 40 00 00 00 00 ; [$9114] undefined
    hex 00 40 e0 f0 d8 e8 c8 e8 00 00 40 60 60 70 70 70 ; [$9124] undefined
    hex c8 e8 c8 f0 e0 40 00 00 70 70 70 60 40 00 00 00 ; [$9134] undefined
    hex 00 e0 d0 f8 c8 e8 c8 e8 00 40 60 60 70 70 70 70 ; [$9144] undefined
    hex c8 e8 c8 e8 d0 f0 60 40 70 70 70 70 60 60 40 00 ; [$9154] undefined
    hex 00 38 60 c0 c4 cc f8 f8 00 20 40 80 80 80 80 80 ; [$9164] undefined
    hex f8 78 f0 60 38 20 00 40 80 80 40 00 00 00 00 00 ; [$9174] undefined
    hex 00 38 60 c0 c4 cc f8 f8 00 20 40 80 80 80 80 80 ; [$9184] undefined
    hex f8 f8 f0 e0 78 20 00 40 80 80 80 40 00 00 00 00 ; [$9194] undefined
    hex 30 78 60 c0 c4 cc f8 f8 30 60 c0 80 80 80 80 80 ; [$91a4] undefined
    hex f8 f8 f0 e0 38 60 00 40 80 80 80 80 c0 40 00 00 ; [$91b4] undefined
    hex c0 e0 c8 f4 f4 f4 f4 d4 00 c0 b0 38 18 18 58 68 ; [$91c4] undefined
    hex f4 ec f8 f4 7c fc e0 e0 68 70 30 38 98 0c 00 00 ; [$91d4] undefined
    hex c0 e0 c8 f4 f4 f4 f4 d4 00 c0 b0 38 18 58 d8 e8 ; [$91e4] undefined
    hex f4 ec f8 f4 7c fc ec e0 68 70 30 38 98 1c 06 00 ; [$91f4] undefined
    hex c0 e0 c8 f4 f4 f4 f4 d4 00 c0 b0 38 58 d8 d8 e8 ; [$9204] undefined
    hex f4 ec f8 f4 7c fc ec ee 68 70 30 38 98 18 0c 06 ; [$9214] undefined
    hex 3a 12 52 12 65 12 85 12 98 12 b1 12 cd 12 e9 12 ; [$9224] undefined
    hex 07 13 2d 13 43 13 8a 8b 8c 8d 8e 8f 90 91 92 93 ; [$9234] undefined
    hex 96 94 95 98 97 60 9a 99 63 65 9b 9c 9d ff a8 a9 ; [$9244] undefined
    hex aa ab ac ad ae af 29 f1 63 cd f2 f3 f4 f5 b0 b1 ; [$9254] undefined
    hex ff 68 69 6a 6b 6c 6d 6e 6f 70 71 72 73 74 75 76 ; [$9264] undefined
    hex 77 7b 7a 79 7e 7c 7d 81 82 7f 83 84 78 85 86 87 ; [$9274] undefined
    hex ff 51 52 53 54 55 56 57 58 ee 94 60 80 ef 63 cd ; [$9284] undefined
    hex 2a 88 89 ff e2 e3 b4 c2 a0 e4 e5 c6 a2 a3 ca ea ; [$9294] undefined
    hex e6 e7 eb ec e9 ce f0 cd db dc a6 e8 ff 1a 1b 1c ; [$92a4] undefined
    hex 1d 1e 1f 20 21 22 23 24 25 29 27 28 2c 2a 2b 2f ; [$92b4] undefined
    hex 2d 2e 30 31 cd 32 33 26 ff 00 01 02 03 04 05 06 ; [$92c4] undefined
    hex 07 08 09 0a 0b 0c 0d 10 11 0e 0f ce 12 13 14 15 ; [$92d4] undefined
    hex 16 17 18 19 ff bf c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 ; [$92e4] undefined
    hex ca cb cc d0 d1 44 45 10 11 46 47 ce 12 13 d2 d3 ; [$92f4] undefined
    hex d4 d5 ff 36 37 38 39 3a 3b 3c 3d 3e 3f 4d 40 41 ; [$9304] undefined
    hex 42 43 e1 5b 5c 5d 5e 66 e0 e6 ce 61 62 64 cd e9 ; [$9314] undefined
    hex ee 4c 67 4e 4f 50 59 5a ff 9e 9f a0 a1 a2 a3 a4 ; [$9324] undefined
    hex a5 d6 d7 d8 d9 da cd db dc dd de df a6 a7 ff b2 ; [$9334] undefined
    hex b3 b4 c2 b5 b6 b7 b8 b9 ba bb bc cb cc d0 d1 1a ; [$9344] undefined
    hex 48 44 fa fb fc 2a cf 46 47 da fd 49 4a cd 34 fe ; [$9354] undefined
    hex db dc bd be d4 d5 ff 00 01 03 0a 0c 06 1c 14 00 ; [$9364] undefined
    hex 00 01 07 07 0c 08 39 08 36 44 00 00 00 58 84 37 ; [$9374] undefined
    hex fd a3 98 7e ff 87 01 19 01 38 69 d1 6a 37 34 12 ; [$9384] undefined
    hex 3a 13 12 7a b1 d8 db b8 7c 07 77 bc 4d 0d 77 47 ; [$9394] undefined
    hex 83 80 78 eb cb f3 8b 5d 3c e3 dc 6a 43 42 26 80 ; [$93a4] undefined
    hex 02 00 1f bb b2 bd d9 9c 84 04 0e 1b 96 1c 1c 40 ; [$93b4] undefined
    hex 68 e8 e0 e6 6d eb eb 64 38 9b 9a 7a 3c 1b 19 9b ; [$93c4] undefined
    hex c7 e7 67 07 03 04 06 03 04 0b 0c 09 0f 37 26 f7 ; [$93d4] undefined
    hex f3 e0 ec de b0 0f 9f b3 54 b4 48 8c e5 90 08 cc ; [$93e4] undefined
    hex 8f 0f 37 73 19 e5 f1 1e 1c 19 1d 3e 2c 28 08 e1 ; [$93f4] undefined
    hex e3 e7 e2 c0 d0 d0 f0 09 0a 04 04 01 01 00 00 06 ; [$9404] undefined
    hex 07 03 03 00 00 00 00 00 03 41 0c 88 c0 f0 ff bf ; [$9414] undefined
    hex bc be ff 7f 3f 0f 00 00 e2 22 08 08 1b 7f ff fd ; [$9424] undefined
    hex 1d 1d f7 f7 e4 80 00 18 10 30 60 c0 80 80 80 e0 ; [$9434] undefined
    hex e0 c0 80 00 00 00 00 0a 21 90 90 48 a0 d0 e8 f5 ; [$9444] undefined
    hex fe 7f 7f bf df ef 77 bf 7f ff 7f 1f 0f 0f 1f 40 ; [$9454] undefined
    hex 80 00 80 e1 f3 f7 ee 00 00 01 04 10 20 40 00 00 ; [$9464] undefined
    hex 00 00 03 0f 1f 3f 7f 00 47 0b 0b 05 02 01 00 00 ; [$9474] undefined
    hex 3a f7 f7 fb fd fe ff 5c 2c 9c 9c 04 98 9c 18 bb ; [$9484] undefined
    hex db 6b 0b e3 69 0a e9 84 9c 18 84 9c 1f 0f 07 61 ; [$9494] undefined
    hex 0a e9 63 0b ec f7 f8 b8 1c 67 47 14 0d 0d 77 47 ; [$94a4] undefined
    hex e3 f8 f8 63 83 f3 8b 5d 3c e3 c8 40 50 42 26 80 ; [$94b4] undefined
    hex 02 1c 3f 9e a1 bd d9 03 04 0b 0c 09 0f 2a 00 f7 ; [$94c4] undefined
    hex f3 e0 ec de b0 07 a0 b3 54 b4 48 8c f5 a0 00 cc ; [$94d4] undefined
    hex 8f 0f 37 73 09 f5 01 17 07 40 0d 88 c0 f0 ff bf ; [$94e4] undefined
    hex bf bf fe 7f 3f 0f 00 00 02 c2 e8 08 1b 7f ff fd ; [$94f4] undefined
    hex fd 3d 17 f7 e4 80 00 01 03 7f ff ff ff ff ff 03 ; [$9504] undefined
    hex 0f 3f 7f ff ff ff 7f 01 01 01 03 02 06 07 0f 00 ; [$9514] undefined
    hex 03 07 07 0f 0f 0e 0d 7f bf fe 79 76 e8 de a0 80 ; [$9524] undefined
    hex ff ff fe f8 f7 e1 df e1 fc 68 74 ef c9 00 07 1b ; [$9534] undefined
    hex ff ff 6f d8 36 ff f8 80 c0 40 40 60 a0 b0 f0 00 ; [$9544] undefined
    hex 00 80 80 80 40 40 00 0d 1d 1d 0a 09 09 09 0d 0a ; [$9554] undefined
    hex 0a 0a 1d 1d 1e 1e 1a e1 ed cf ce c0 98 50 c0 90 ; [$9564] undefined
    hex 8d b9 bf 3f 7f bf 3f 08 93 94 1a 06 00 50 00 f7 ; [$9574] undefined
    hex 60 65 eb ff ff ef df e0 a0 a0 a0 c0 c0 80 80 00 ; [$9584] undefined
    hex 40 40 40 00 00 00 00 0e 1f 1f 15 05 05 02 00 1b ; [$9594] undefined
    hex 0b 09 0f 0e 06 03 01 80 a0 c0 a0 f8 7c 36 b3 3f ; [$95a4] undefined
    hex 1f 1f 4f 87 c3 69 0c 01 71 43 62 06 48 18 e0 fe ; [$95b4] undefined
    hex 0e fc 9c f8 f2 e1 0c 01 91 03 42 06 48 18 e0 fe ; [$95c4] undefined
    hex 0e 9c fc f8 f2 e1 0c f0 e4 e4 b0 ee ff 3f c0 0f ; [$95d4] undefined
    hex 1f 9f cf f1 ff ff ff e0 40 40 88 cd de 9e 7e 00 ; [$95e4] undefined
    hex a0 b0 70 f2 ef ff ff 00 00 00 00 00 07 3f ff 00 ; [$95f4] undefined
    hex 00 00 00 00 07 3f ff ff ff ff 7f bf 5f 6f 2f ff ; [$9604] undefined
    hex ff ff ff 7f bf 9f df be ff df ff ef ef f7 ff ff ; [$9614] undefined
    hex bf ff df ff ff ff f7 01 03 03 03 07 04 00 00 01 ; [$9624] undefined
    hex 03 07 04 00 03 07 07 37 17 13 13 13 17 17 17 cf ; [$9634] undefined
    hex ef ef ef ef ef ef ef fb fd ff ff ff ff f9 ff ff ; [$9644] undefined
    hex ff fe ff fe fe fe f8 00 00 08 08 08 08 00 08 07 ; [$9654] undefined
    hex 07 07 07 07 07 0f 07 00 00 00 00 00 00 00 08 0f ; [$9664] undefined
    hex 0f 0f 0f 0f 0f 0f 07 17 17 17 03 03 08 00 00 ef ; [$9674] undefined
    hex ef ef ef ef e7 e7 e7 e0 f4 c7 c1 c0 98 50 c0 9f ; [$9684] undefined
    hex 8f b0 b8 3f 7f bf 3f 08 18 1c 1c 00 00 50 00 f7 ; [$9694] undefined
    hex e7 67 e3 f9 ff ef df ff ff ff ff ff e7 1f ff fe ; [$96a4] undefined
    hex fe fe fe ff ff ff ff 00 00 00 00 00 00 00 00 1f ; [$96b4] undefined
    hex 1f 1f 1f 3f 3f 3f 3f 00 00 00 00 00 02 07 0c 00 ; [$96c4] undefined
    hex 00 01 03 07 04 08 03 00 30 c0 04 43 82 00 40 3f ; [$96d4] undefined
    hex ef ff fb b8 7c ff ff 3c 03 00 00 80 40 40 00 c0 ; [$96e4] undefined
    hex fc ff ff 7f 3f 9f ef 00 00 80 40 20 20 10 10 00 ; [$96f4] undefined
    hex 00 00 80 c0 c0 e0 e0 08 06 04 08 11 2a 39 53 00 ; [$9704] undefined
    hex 06 0c 06 0d 1b 1a 38 60 63 c2 c6 80 31 9b c2 bc ; [$9714] undefined
    hex bb 7f fb ff ef 77 37 00 e0 b8 38 00 80 80 00 3f ; [$9724] undefined
    hex df a7 27 ff ff ff ff 10 08 08 08 04 02 0e 16 e0 ; [$9734] undefined
    hex f0 f0 f0 e0 dc b0 e0 42 43 44 6c 78 4a 55 55 3c ; [$9744] undefined
    hex 3c 39 11 05 3c 3b 3b b0 f8 88 88 0c 06 e3 82 07 ; [$9754] undefined
    hex 07 f7 f7 f3 01 fc fd 2e 5c 74 60 c8 d8 e0 80 c0 ; [$9764] undefined
    hex 80 88 98 30 20 00 00 54 43 45 4b 2a 28 1c 07 3b ; [$9774] undefined
    hex 3c 3a 37 17 17 03 00 02 00 e0 10 00 00 00 87 fd ; [$9784] undefined
    hex ff 1f ef ff ff ff 78 01 01 03 07 0e 1d 73 ef fe ; [$9794] undefined
    hex fe fc f8 f0 e0 80 00 8f 83 80 88 88 84 80 80 70 ; [$97a4] undefined
    hex 7c 7f 7f 7f 7f 7f 7f fc fc 3c 1c 0c 0c 3e 0e 00 ; [$97b4] undefined
    hex 00 c0 e0 f0 f0 c0 f0 00 00 00 00 00 80 e0 f8 ff ; [$97c4] undefined
    hex ff ff ff 7f 9f e7 f8 0e 06 02 00 02 01 07 dc f0 ; [$97d4] undefined
    hex f8 fc fe fc f9 e7 1f f6 f4 f0 f0 f0 f4 fc f8 f0 ; [$97e4] undefined
    hex f3 f7 f7 f7 f3 f3 fb 17 0b 0b 05 01 00 00 00 e7 ; [$97f4] undefined
    hex f3 f3 f9 fd fe fe fe bf bf bf 7f 7f 7f ff ff ff ; [$9804] undefined
    hex bf bf 7f 7f 7f 7f ff 00 00 80 60 10 18 08 0c 00 ; [$9814] undefined
    hex 00 00 a0 d0 d8 e8 ec 80 80 00 00 00 80 80 80 7f ; [$9824] undefined
    hex 7f ff ff ff 7f 7f 7f 00 00 04 04 08 30 e0 00 ff ; [$9834] undefined
    hex ff fb fb f7 cf 1f ff 08 01 08 08 11 2a 39 53 07 ; [$9844] undefined
    hex 06 07 00 0d 1b 1a 38 63 60 c4 c1 80 31 9b c2 bf ; [$9854] undefined
    hex bb 78 fe ff ef 77 37 00 00 00 38 00 80 80 00 ff ; [$9864] undefined
    hex ff ff 07 ff ff ff ff 00 00 00 03 03 06 05 0d 00 ; [$9874] undefined
    hex 00 01 03 07 07 0f 0f 1f 73 ec db 56 b6 7c 70 1e ; [$9884] undefined
    hex 7f ff ff ff fe fd fb 17 17 1f 3f 2f 24 4b 78 1e ; [$9894] undefined
    hex 1d 13 2f 37 38 38 3b f9 fc fe ff 1f 05 c0 80 77 ; [$98a4] undefined
    hex fb fd fe 1e 64 d5 99 31 30 18 58 50 11 51 0f 7a ; [$98b4] undefined
    hex 7d 7d 3d 7b 7b 7b 7b 1d f1 23 c1 00 9a 3f 7f e3 ; [$98c4] undefined
    hex 0f d7 37 f1 e4 cf 9f 10 40 1b 59 0a 53 13 53 7b ; [$98d4] undefined
    hex 7b 68 6c 74 3d 7d 7d 7f ff ff fc f8 f1 cc 3b bf ; [$98e4] undefined
    hex 7f 7f ff fc fb f7 c4 42 43 44 6d 78 4a 57 55 3c ; [$98f4] undefined
    hex 3c 39 10 04 3c 3a 3b b0 f8 88 08 0c 06 13 c2 07 ; [$9904] undefined
    hex 07 f7 f7 03 01 0c fd c9 07 0e 1c 18 38 70 60 30 ; [$9914] undefined
    hex f7 ef de dd bd 7b 73 ff cf a7 40 bb 80 60 30 00 ; [$9924] undefined
    hex 70 78 bf 44 7f bf cf 9f ff ff bf 1f 06 01 07 00 ; [$9934] undefined
    hex 00 00 40 e0 f8 fd fb 80 f0 e0 9f 7f ff e0 c8 00 ; [$9944] undefined
    hex 00 00 1f 7f ff f0 e7 e0 e0 c0 c0 c0 80 80 80 f7 ; [$9954] undefined
    hex f7 ef ef ef df df df ab aa ce cb e2 f2 f9 fe 7f ; [$9964] undefined
    hex 7f 3f 3f 1f 8f 87 41 03 03 07 07 06 06 06 06 fb ; [$9974] undefined
    hex fb f7 f7 f7 f7 f7 f7 80 00 00 00 00 00 00 00 df ; [$9984] undefined
    hex bf bf 7f 7f 7f 7f 7f 73 fc 7e bf 3e 9f 5f ad 80 ; [$9994] undefined
    hex 90 d9 cc ef f7 f3 72 08 00 04 00 00 02 00 00 f0 ; [$99a4] undefined
    hex f8 f8 fc fc fc fe fe 4e 5f 4b 29 ae af 5b 58 f5 ; [$99b4] undefined
    hex f6 f6 f6 f5 f6 f6 f7 00 00 00 80 40 20 f0 10 00 ; [$99c4] undefined
    hex 00 00 00 80 c0 00 e0 01 01 01 00 00 00 00 00 fe ; [$99d4] undefined
    hex fe fe ff ff ff ff ff 01 03 01 07 07 07 0f 0f 00 ; [$99e4] undefined
    hex 01 03 03 02 02 06 06 b5 d5 fd b4 a0 30 f0 b8 ff ; [$99f4] undefined
    hex ff 87 79 7d fe 7f ff 63 47 84 06 02 03 01 01 fc ; [$9a04] undefined
    hex f8 83 b8 7c fc fe fe 80 c0 c0 e0 60 30 30 70 00 ; [$9a14] undefined
    hex 00 00 00 80 40 40 00 0f 0f 0a 0b 1b 2f 30 01 06 ; [$9a24] undefined
    hex 06 07 05 05 11 1e 1f 98 e0 81 b3 0c 76 fb 4f ff ; [$9a34] undefined
    hex 1f 0e c0 81 71 e9 c9 01 0f 70 07 11 66 4b 76 fe ; [$9a44] undefined
    hex f0 80 80 80 86 9b 93 d0 90 90 10 94 78 a4 2c 20 ; [$9a54] undefined
    hex 20 20 20 20 84 48 50 1b 13 1b 09 09 0c 0c 04 07 ; [$9a64] undefined
    hex 0f 07 07 07 03 03 03 05 0f bb 09 0c 0a 11 26 fb ; [$9a74] undefined
    hex f3 c7 f3 f1 f4 ee d9 60 30 19 16 10 78 78 78 9f ; [$9a84] undefined
    hex cf c6 c9 af 07 87 87 7c 6c 6c 6c 78 38 20 60 80 ; [$9a94] undefined
    hex 80 80 80 80 c0 c0 80 04 04 04 04 06 02 03 01 03 ; [$9aa4] undefined
    hex 03 03 03 01 01 00 00 01 17 2e 00 03 06 03 04 e0 ; [$9ab4] undefined
    hex cf df ff fc f8 ff ff c8 80 00 00 c1 60 00 00 07 ; [$9ac4] undefined
    hex f3 fb ff 3e 1f ff ff 60 60 e0 e0 60 60 40 c0 80 ; [$9ad4] undefined
    hex 80 00 00 80 80 80 00 98 e0 81 b3 0c 66 8b 07 ff ; [$9ae4] undefined
    hex 1f 0e c0 f1 f9 71 81 00 00 c0 60 bc 5f e7 f8 ff ; [$9af4] undefined
    hex ff 3f 1f 03 80 c0 60 82 73 ef 4f 1a 3f 7f bf 01 ; [$9b04] undefined
    hex 82 f6 f6 e7 c3 81 40 ff 0f 3f 00 00 00 00 00 00 ; [$9b14] undefined
    hex ff ff ff ff ff ff ff b1 8c 87 00 00 60 c0 c0 4e ; [$9b24] undefined
    hex 73 78 ff ff ff ff ff f7 7f 1f 03 01 01 01 01 38 ; [$9b34] undefined
    hex 8c e0 fc fe fe fe fe 3f e9 f3 eb a7 4e 8c 58 c0 ; [$9b44] undefined
    hex 1c 38 70 d0 a1 43 c7 07 0f b9 02 01 01 01 03 f8 ; [$9b54] undefined
    hex f0 46 fd fe fe fe fc e7 f7 e7 f7 e7 e7 f7 e5 f9 ; [$9b64] undefined
    hex fb fb fb fb fb fb fb 99 59 99 58 9c 4c ce d7 c7 ; [$9b74] undefined
    hex 87 47 c7 c3 83 01 40 c0 c0 c0 c0 c0 f0 3d 00 ff ; [$9b84] undefined
    hex ff ff ff ff ff ff ff 9b 5d de 9f 5f 5e 1c 1c c0 ; [$9b94] undefined
    hex 80 00 40 80 81 83 83 e0 fc ff e0 00 50 00 00 1f ; [$9ba4] undefined
    hex 03 00 1f ff ff ff ff 01 0f 70 07 11 68 40 60 fe ; [$9bb4] undefined
    hex f0 80 80 8e 9f 9e 81 11 20 28 0c 07 01 0c 03 e0 ; [$9bc4] undefined
    hex c0 d0 ff ff fe f3 ff c8 04 1c 04 81 c0 20 00 07 ; [$9bd4] undefined
    hex 03 03 fb fe 3f df ff f9 fc fe ff 1f 85 00 00 77 ; [$9be4] undefined
    hex fb fd fe 1e 64 f5 01 7f ff fe fb fc f0 cb 3b bf ; [$9bf4] undefined
    hex 7f 7f fc f8 f8 f7 c4 84 4a 22 39 2d 2f 3d 30 94 ; [$9c04] undefined
    hex 52 6a 21 31 31 31 3b 01 0a 0b 65 81 66 ef ea 41 ; [$9c14] undefined
    hex 49 68 0d 07 99 9c 9d 18 24 1c 01 04 17 2f 1f 3b ; [$9c24] undefined
    hex 1d 0e 0e 00 0c 19 3b f5 7d 3c 07 92 fe fc de cb ; [$9c34] undefined
    hex e3 fb 78 00 ff ff f1 2b 1e 3f 2f 3c 2a 2b 29 17 ; [$9c44] undefined
    hex 37 74 70 73 77 77 77 05 63 ca f4 0d 19 e0 8a 82 ; [$9c54] undefined
    hex 24 cd fb f3 e7 17 f1 c0 cc 53 3e b1 96 07 50 01 ; [$9c64] undefined
    hex 28 b3 df ce e9 ef 8f da 74 fa fc 36 9c 1a 1e ec ; [$9c74] undefined
    hex ee 2e 0e ce ee ee ee 28 38 3f 5f 3f 7f 5b 57 77 ; [$9c84] undefined
    hex 77 70 7b 7f 7f 7f 7f 1c fe ff ff fe ef 99 50 ec ; [$9c94] undefined
    hex 7f ff fe f9 f0 e7 ef 37 20 0e a4 76 74 d6 d2 6e ; [$9ca4] undefined
    hex 7f 77 7f af af 7f 7f 43 f7 ff ff df 57 57 2f fc ; [$9cb4] undefined
    hex fb ff ff ff ff ff ff 00 00 00 01 06 0c 34 4a 00 ; [$9cc4] undefined
    hex 00 00 00 01 0b 3b 77 4e ad af af bf 5e fe ff fb ; [$9cd4] undefined
    hex 7b 7d 7d 6b f5 55 02 be 56 ee af 6f d6 d6 ae e7 ; [$9ce4] undefined
    hex ef df de df ef ef df b1 9a c9 98 9d cc 99 98 cf ; [$9cf4] undefined
    hex e7 f7 e7 e3 f3 e7 e7 7d 6a 77 f5 f6 6b 6b 75 e7 ; [$9d04] undefined
    hex f7 fb 7b fb f7 f7 fb 7d 43 12 0c 0d 19 e0 8a 82 ; [$9d14] undefined
    hex fc e5 03 f3 e7 17 f1 de c8 40 20 b1 96 07 50 01 ; [$9d24] undefined
    hex 3f af d0 ce e9 ef 8f 1c fe ff ff fe e9 90 53 ec ; [$9d34] undefined
    hex 7f ff fe f9 f0 e0 e7 00 00 00 00 00 04 04 14 00 ; [$9d44] undefined
    hex 00 00 01 03 0b 1b 2b 18 60 80 0f 00 1e 61 0c 07 ; [$9d54] undefined
    hex 1f 7f f0 ff e1 9e f3 2a 58 6c 5c 7c 38 58 38 11 ; [$9d64] undefined
    hex 23 11 21 01 03 63 63 33 00 00 02 3c c0 32 02 cc ; [$9d74] undefined
    hex ff fd c1 83 3f 7d fd 08 2c 14 14 15 0c 0a 1f 53 ; [$9d84] undefined
    hex 43 63 23 23 33 31 00 06 22 4c 74 09 14 23 c4 81 ; [$9d94] undefined
    hex 61 cb fb f7 e3 c8 18 0d 1e 1f 1f 0f 0f 0f 07 00 ; [$9da4] undefined
    hex 00 00 00 00 00 00 00 0f f8 f5 e0 e7 e0 e0 fd 30 ; [$9db4] undefined
    hex 00 03 0f 08 0c 0e 00 06 42 04 05 09 14 23 c4 f1 ; [$9dc4] undefined
    hex f9 73 8b f7 e3 c8 18 0f f8 f0 e5 e0 e7 e2 fc 30 ; [$9dd4] undefined
    hex 00 00 0b 0f 08 0c 01 03 03 05 07 05 06 0f 06 00 ; [$9de4] undefined
    hex 00 02 00 02 01 00 08 f6 93 54 2b 6b ab 9c c9 09 ; [$9df4] undefined
    hex 7f ff ff ff 7f 77 3f 13 1f 11 19 10 18 10 1c 0c ; [$9e04] undefined
    hex 0c 0c 0c 0d 0d 0d 09 04 88 78 86 23 6a 4e 1e 03 ; [$9e14] undefined
    hex 70 87 01 70 69 c9 e1 21 29 21 29 21 39 21 3d 1c ; [$9e24] undefined
    hex 1c 1c 1c 1c 1c 1c 18 65 45 02 8d 46 43 01 07 fb ; [$9e34] undefined
    hex fb f9 70 b8 bc fe f8 20 38 20 38 20 3a 30 00 1e ; [$9e44] undefined
    hex 1e 1e 1f 1f 1f 0f 1f 88 81 80 43 41 20 18 07 70 ; [$9e54] undefined
    hex 7f 7f 3c 3f 1f 47 60 04 88 6c 46 03 06 06 1e 03 ; [$9e64] undefined
    hex 70 f3 f9 fc 79 81 e1 88 84 81 40 43 20 18 07 70 ; [$9e74] undefined
    hex 78 7f 3f 3c 1f 47 60 00 00 00 00 01 02 01 07 00 ; [$9e84] undefined
    hex 00 00 00 00 01 03 03 00 10 66 bc d2 11 a6 64 00 ; [$9e94] undefined
    hex 0f 19 70 e1 e7 cf 8f 00 08 b6 5d 2a 1d 3a 31 00 ; [$9ea4] undefined
    hex f0 c8 62 b1 d0 d4 ce 07 0b 0f 0f 1a 1f 0d 11 02 ; [$9eb4] undefined
    hex 05 02 05 0f 32 06 0e 40 c0 c0 80 80 03 02 10 9f ; [$9ec4] undefined
    hex 1f 1f 3f 3c 78 77 6f 00 00 20 0c 44 cf 4a 68 ff ; [$9ed4] undefined
    hex ff df b3 38 30 b7 b7 c0 c0 c0 c0 40 80 c0 40 00 ; [$9ee4] undefined
    hex 00 00 00 00 00 00 80 10 1a 02 00 08 02 02 0a 24 ; [$9ef4] undefined
    hex 20 34 17 13 09 0d 05 31 06 6b 47 00 00 80 71 c1 ; [$9f04] undefined
    hex fe f7 f8 ff ff 7f 8e 0a 0c 8b 23 1a f8 60 33 72 ; [$9f14] undefined
    hex 70 f3 f8 e1 01 83 c0 e0 e0 e0 60 60 c0 c0 c0 00 ; [$9f24] undefined
    hex 00 00 80 80 00 00 00 38 04 60 43 00 00 80 71 c7 ; [$9f34] undefined
    hex f3 f8 fc ff ff 7f 8e 08 0c 8b 23 1a f8 60 33 f7 ; [$9f44] undefined
    hex 73 70 f8 e1 01 83 c0 00 00 03 03 07 07 0f 0f 00 ; [$9f54] undefined
    hex 00 00 00 00 00 00 00 3f ff ff ff fe e2 c8 88 00 ; [$9f64] undefined
    hex 00 00 00 00 00 1d 3f f0 fc fe bf 83 05 00 40 00 ; [$9f74] undefined
    hex 00 00 00 40 e8 fe bf 00 00 00 00 80 80 c0 40 00 ; [$9f84] undefined
    hex 00 00 00 00 00 00 00 0f 1f 1f 1f 0f 27 13 09 00 ; [$9f94] undefined
    hex 00 00 00 00 10 38 2c 83 89 91 05 0a 0d 07 02 3c ; [$9fa4] undefined
    hex 30 26 68 72 74 7f 7f 00 04 83 c1 54 51 57 cb 3b ; [$9fb4] undefined
    hex f8 78 30 a4 a1 a7 30 40 40 40 40 c0 c0 c0 c0 00 ; [$9fc4] undefined
    hex 00 00 00 00 00 00 00 13 18 01 00 08 02 02 0a 24 ; [$9fd4] undefined
    hex 23 36 17 13 09 0d 05 87 20 00 80 41 31 21 27 78 ; [$9fe4] undefined
    hex ff ff 7f be ce de d9 c3 c5 02 02 34 4c b3 1f 38 ; [$9ff4] undefined
    hex 38 7c 7c 09 01 c0 e0 c0 60 60 60 60 c0 c0 c0 00 ; [$a004] undefined
    hex 80 80 80 80 00 00 00 06 03 03 01 01 01 00 00 01 ; [$a014] undefined
    hex 00 00 00 00 00 00 00 00 08 09 88 00 60 1a 83 ff ; [$a024] undefined
    hex f7 f6 77 7f 9f c5 60 ff ff ff ff ff ff ff ff ff ; [$a034] undefined
    hex ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00 ff ; [$a044] undefined
    hex ff ff ff ff ff ff ff f8 fc fc fe ff ff ff ff fb ; [$a054] undefined
    hex fd fd fe ff ff ff ff 41 f5 83 1e 27 33 23 06 80 ; [$a064] undefined
    hex 79 fc e0 d8 fc fc f8 80 f8 18 00 00 00 00 00 00 ; [$a074] undefined
    hex f0 e0 00 00 00 00 00 83 89 91 04 06 00 00 00 3c ; [$a084] undefined
    hex 30 26 6f 7f 77 78 7f 00 04 83 c0 50 55 50 cb 3b ; [$a094] undefined
    hex f8 78 37 a7 22 a0 30 41 81 b3 06 3f 33 23 06 80 ; [$a0a4] undefined
    hex 03 fc f8 c0 fc fc f8 80 40 e0 18 10 00 00 00 00 ; [$a0b4] undefined
    hex 80 f0 20 00 00 00 00 07 00 00 00 00 00 00 00 00 ; [$a0c4] undefined
    hex 1f 7f ff ff ff ff ff f7 7b 3d 3e 3f 3f 3f 3f f0 ; [$a0d4] undefined
    hex 70 38 bc bf bf bf bf ff ff ff 7f 9d e2 ff f9 00 ; [$a0e4] undefined
    hex 00 00 00 00 80 c0 ff 00 00 00 00 02 00 00 00 ff ; [$a0f4] undefined
    hex ff fb fd fc fe fe fe 7f 3f 3f 3f 7f 7f ff ff 7f ; [$a104] undefined
    hex 7f 7f 7f ff ff ff ff 00 00 04 08 13 24 04 20 fd ; [$a114] undefined
    hex fd f9 f0 e4 cb db df ff ff ff ff 3f 4f 93 a0 ff ; [$a124] undefined
    hex ff ff ff 3f 8f 63 5c 85 25 80 00 00 80 fe 7f 7a ; [$a134] undefined
    hex da 7f ff ff 7f 01 00 02 24 84 04 00 02 00 fc fd ; [$a144] undefined
    hex db 7b fb ff fd ff 03 3f 5f 0f 07 13 23 01 01 3f ; [$a154] undefined
    hex 9f ef f7 eb db fd fd 40 40 41 01 01 03 03 03 3e ; [$a164] undefined
    hex 3e 3d 7d 7d 7b 7b 7b 00 03 04 08 00 10 20 20 00 ; [$a174] undefined
    hex 00 03 07 0f 0f 1f 1f 00 00 03 04 03 04 06 15 00 ; [$a184] undefined
    hex 00 00 03 04 0b 18 28 1f f0 0d f0 1c e0 00 0c 00 ; [$a194] undefined
    hex 0f f2 0f e3 01 1e f3 03 38 06 01 00 40 08 00 fc ; [$a1a4] undefined
    hex c7 f9 fe fd 81 07 7f c0 1c 60 80 06 13 20 00 3f ; [$a1b4] undefined
    hex e3 9f 71 e0 8c 9f ff 06 02 f2 f9 fc fe ff ff 01 ; [$a1c4] undefined
    hex f1 f9 fc fe ff ff ff a0 41 00 03 81 60 38 9f 40 ; [$a1d4] undefined
    hex bf ff fc 7f 1f 87 c0 a0 40 01 00 83 61 38 9f 40 ; [$a1e4] undefined
    hex b8 ff ff 7c 1f 87 c0 cf e7 f3 f8 ff ff ff ff e0 ; [$a1f4] undefined
    hex f0 f8 fc ff ff ff ff 00 00 00 07 1f 3f 7f 7f 00 ; [$a204] undefined
    hex 00 07 1f 3f 7f 7f ff e0 80 00 00 00 00 00 00 e0 ; [$a214] undefined
    hex 9f 7f ff ff ff ff ff ff 3b 1b 13 13 07 07 07 ff ; [$a224] undefined
    hex 3b db d7 d7 ef ef ef 2f 2f 0f 5f 1f bf bf 3f df ; [$a234] undefined
    hex df df bf bf 7f 7f 7f 01 03 7f fe ff ff ff fb 03 ; [$a244] undefined
    hex 0f 3f 7f fe fd fd 7d d3 f4 3b 80 f5 fa ff ff ff ; [$a254] undefined
    hex 5b e4 ff ff ff ff ff 0f 0f 0f 1f 1f 3f 3f 3f df ; [$a264] undefined
    hex df df bf bf 7f 7f 7f 28 28 3c f4 f9 fd fd ff 1e ; [$a274] undefined
    hex 1c 01 02 ea f4 f4 fa fe ff ff ff ff ff ff ff fa ; [$a284] undefined
    hex fd fe ff ff ff ff ff bd 2a 97 d5 e6 73 79 7d 67 ; [$a294] undefined
    hex 77 bb 5b ab d7 eb f5 7e 6b 74 f1 f8 6b 68 79 e2 ; [$a2a4] undefined
    hex f5 f8 7d f4 f7 f4 f5 7d 69 75 f5 f6 6b 6b 75 e5 ; [$a2b4] undefined
    hex f5 f9 79 f8 f7 f7 fb ff 1f 0f 07 07 03 03 03 ff ; [$a2c4] undefined
    hex 1f ef f7 f7 fb fb fb 03 03 03 03 03 03 07 07 fb ; [$a2d4] undefined
    hex fb fb fb fb fb f7 f7 0c 1e 3e fe ff ff ff ff ec ; [$a2e4] undefined
    hex de 3e fe ff ff ff ff 00 f0 fe ff ff ff ff ff 00 ; [$a2f4] undefined
    hex f0 fe ff ff ff ff ff fc fd 3c 1c 0c 0c 3e 0e 00 ; [$a304] undefined
    hex 01 c1 e1 f1 f1 c0 f0 00 80 f0 fc fe ff 7f 7f 00 ; [$a314] undefined
    hex 80 f0 fc fe ff ff ff 00 00 00 00 00 80 e0 f0 00 ; [$a324] undefined
    hex 00 00 00 00 80 e0 f0 c0 80 80 00 00 00 00 00 c0 ; [$a334] undefined
    hex b0 b8 78 7c 7c 7c 7e 00 00 00 00 00 00 00 00 fe ; [$a344] undefined
    hex fe ff ff ff 7f 7f 7f 00 00 00 00 00 00 00 00 00 ; [$a354] undefined
    hex 00 00 00 00 00 00 00 fc 00 04 00 00 00 00 00 0b ; [$a364] undefined
    hex 00 00 00 00 00 00 00 29 00 00 00 00 00 00 00 7b ; [$a374] undefined
    hex 00 87 00 0a 00 00 00 cf 00 21 00 20 00 00 00 5a ; [$a384] undefined
    hex 00 08 00 00 00 00 00 40 00 10 00 00 00 00 00 e5 ; [$a394] undefined
    hex 00 ff 00 04 00 00 00 76 00 00 00 00 00 00 00 1a ; [$a3a4] undefined
    hex 00 04 00 00 00 00 00 08 00 00 00 00 00 00 00 5f ; [$a3b4] undefined
    hex 00 f4 00 02 00 00 00 78 00 00 00 01 00 00 00 2c ; [$a3c4] undefined
    hex 80 18 00 00 00 00 00 8a 00 00 00 00 00 00 00 ce ; [$a3d4] undefined
    hex 00 28 00 02 00 00 00 4a 00 01 00 01 00 00 00 01 ; [$a3e4] undefined
    hex 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 bf ; [$a3f4] undefined
    hex 00 a9 00 a5 00 00 00 ad 00 d2 00 80 00 00 00 ac ; [$a404] undefined
    hex 00 21 00 00 00 00 80 aa 00 5b 00 00 00 00 00 bf ; [$a414] undefined
    hex 00 f7 00 00 00 00 00 fb 00 23 00 80 00 00 00 b3 ; [$a424] undefined
    hex 00 0a 00 01 00 00 00 48 00 10 00 00 00 00 00 8f ; [$a434] undefined
    hex 00 29 00 00 00 00 00 7f 00 f3 00 00 00 00 00 a9 ; [$a444] undefined
    hex 00 96 00 00 00 00 00 23 00 00 00 00 00 00 00 ff ; [$a454] undefined
    hex 00 cf 00 00 00 00 00 63 00 73 00 00 00 00 00 5b ; [$a464] undefined
    hex 00 01 00 00 00 00 00 09 00 01 00 10 00 00 00 df ; [$a474] undefined
    hex 00 29 00 02 00 00 00 82 00 3d 00 00 00 00 00 43 ; [$a484] undefined
    hex 00 01 00 00 00 00 00 08 00 00 00 00 00 00 00 cd ; [$a494] undefined
    hex 00 c3 00 40 00 00 00 c1 00 40 00 02 00 00 00 08 ; [$a4a4] undefined
    hex 00 00 00 00 00 00 00 10 00 00 00 10 00 00 00 7f ; [$a4b4] undefined
    hex 00 22 00 00 00 00 00 69 00 f0 00 10 00 00 00 04 ; [$a4c4] undefined
    hex 00 00 00 80 00 00 00 08 00 00 00 00 00 00 00 81 ; [$a4d4] undefined
    hex 00 1f 00 82 00 00 00 48 00 41 00 14 00 00 00 21 ; [$a4e4] undefined
    hex 00 01 00 01 00 00 00 30 00 10 00 00 00 00 00 f7 ; [$a4f4] undefined
    hex 00 a8 00 00 00 00 00 6b 00 55 00 00 00 00 00 b3 ; [$a504] undefined
    hex 00 55 00 00 00 00 00 f0 10 48 00 00 00 00 00 ff ; [$a514] undefined
    hex 00 ae 00 00 00 00 00 db 00 0d 00 00 00 00 00 8f ; [$a524] undefined
    hex 00 95 00 80 00 00 00 6d 00 01 00 00 00 00 00 ff ; [$a534] undefined
    hex 00 01 00 00 00 00 00 de 00 00 00 80 00 00 00 5c ; [$a544] undefined
    hex 00 09 00 00 00 00 00 15 00 01 00 00 00 00 00 fa ; [$a554] undefined
    hex 00 dd 00 00 00 00 00 cf 00 d2 00 20 00 00 00 9d ; [$a564] undefined
    hex 00 01 00 80 00 00 00 15 00 22 00 00 00 00 00 ff ; [$a574] undefined
    hex 00 29 00 01 00 00 00 fa 00 97 00 0a 00 00 00 58 ; [$a584] undefined
    hex 00 00 00 20 00 00 00 0c 00 00 00 00 00 00 00 fd ; [$a594] undefined
    hex 00 28 00 04 00 00 00 1a 00 00 00 a1 00 00 00 49 ; [$a5a4] undefined
    hex 00 98 00 00 00 00 00 05 00 08 00 00 00 00 00 be ; [$a5b4] undefined
    hex 00 18 00 00 00 00 00 6c 00 29 00 09 00 00 00 41 ; [$a5c4] undefined
    hex 00 48 00 00 00 00 00 2c 00 02 00 00 00 00 00 d1 ; [$a5d4] undefined
    hex 00 01 00 0b 00 00 00 7d 00 30 00 40 00 00 00 84 ; [$a5e4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ; [$a5f4] undefined
    hex 00 af 00 40 00 00 00 d7 00 d9 00 00 00 00 00 ff ; [$a604] undefined
    hex 00 64 00 00 00 00 00 0c 00 13 00 00 00 00 00 7b ; [$a614] undefined
    hex 00 b4 00 00 00 00 00 25 00 07 00 00 00 00 00 4d ; [$a624] undefined
    hex 00 a1 00 00 00 00 00 28 00 40 00 00 00 00 00 ff ; [$a634] undefined
    hex 00 29 00 01 00 00 00 4d 00 09 00 00 00 00 00 ab ; [$a644] undefined
    hex 00 01 00 80 00 00 00 09 00 84 00 00 00 00 00 7f ; [$a654] undefined
    hex 00 6a 00 00 00 00 00 cf 00 00 00 20 00 00 00 05 ; [$a664] undefined
    hex 00 10 00 80 00 00 00 11 00 04 00 00 00 00 00 89 ; [$a674] undefined
    hex 00 4f 00 00 00 00 00 c1 00 90 00 20 00 00 00 42 ; [$a684] undefined
    hex 00 08 00 80 00 00 00 10 00 00 00 01 00 00 00 7f ; [$a694] undefined
    hex 00 0a 00 40 00 00 00 1d 00 04 00 80 00 00 00 13 ; [$a6a4] undefined
    hex 00 04 00 00 00 00 00 64 00 00 00 00 00 00 00 ce ; [$a6b4] undefined
    hex 00 43 00 01 00 00 00 3c 00 00 00 28 00 00 00 40 ; [$a6c4] undefined
    hex 00 40 00 00 00 00 00 40 00 40 00 00 00 00 00 ea ; [$a6d4] undefined
    hex 00 00 00 04 00 00 00 36 00 00 00 00 00 00 00 00 ; [$a6e4] undefined
    hex 00 00 00 02 00 00 00 40 80 00 00 00 00 00 00 9e ; [$a6f4] undefined
    hex 00 6f 00 80 00 00 00 fb 00 1c 00 00 00 00 00 bf ; [$a704] undefined
    hex 00 c3 00 00 00 00 00 6b 00 19 00 00 00 00 00 ba ; [$a714] undefined
    hex 00 5e 00 04 00 00 00 4e 00 51 00 00 00 00 00 2e ; [$a724] undefined
    hex 00 38 00 00 00 00 00 08 00 10 00 00 00 00 00 bf ; [$a734] undefined
    hex 00 af 00 08 00 00 00 fe 00 03 00 00 00 00 00 c8 ; [$a744] undefined
    hex 00 84 00 00 00 00 00 4f 80 00 00 00 00 00 00 ff ; [$a754] undefined
    hex 00 8a 00 00 00 00 00 bc 00 21 00 00 00 00 00 53 ; [$a764] undefined
    hex 00 42 00 00 00 00 00 05 00 00 00 00 00 00 00 df ; [$a774] undefined
    hex 00 0e 00 20 00 00 00 8d 00 07 00 00 00 00 00 1a ; [$a784] undefined
    hex 00 0c 00 80 00 00 00 00 00 00 00 00 00 00 00 2d ; [$a794] undefined
    hex 00 26 00 10 00 00 00 5e 00 b0 00 80 00 00 00 26 ; [$a7a4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ed ; [$a7b4] undefined
    hex 00 50 00 0c 00 00 00 85 00 02 00 80 00 00 00 1c ; [$a7c4] undefined
    hex 00 00 00 00 00 00 00 40 02 04 00 00 00 00 00 ab ; [$a7d4] undefined
    hex 00 00 00 04 00 00 00 3d 00 00 00 00 00 00 00 14 ; [$a7e4] undefined
    hex 00 10 00 00 00 00 00 00 00 20 00 00 00 00 00 5f ; [$a7f4] undefined
    hex 00 18 00 00 00 00 00 1f 00 7c 00 00 00 00 00 3f ; [$a804] undefined
    hex 00 ae 00 00 00 00 00 9c 00 00 00 10 00 00 00 fb ; [$a814] undefined
    hex 00 bc 00 00 00 00 00 4b 00 0f 00 00 00 00 00 b7 ; [$a824] undefined
    hex 00 34 00 00 00 00 00 18 00 14 00 00 00 00 00 df ; [$a834] undefined
    hex 00 75 00 00 00 00 00 b2 00 58 00 00 00 00 00 ba ; [$a844] undefined
    hex 00 07 00 02 00 00 00 90 00 30 00 00 00 00 00 be ; [$a854] undefined
    hex 00 32 00 80 00 00 00 df 00 a8 00 00 00 00 00 56 ; [$a864] undefined
    hex 00 a1 00 00 00 00 00 00 00 00 00 00 00 00 00 fd ; [$a874] undefined
    hex 00 23 00 00 00 00 00 e4 00 0c 00 00 00 00 00 24 ; [$a884] undefined
    hex 00 05 00 08 00 00 00 49 00 01 00 00 00 00 00 51 ; [$a894] undefined
    hex 00 b8 00 04 00 00 00 df 00 14 00 00 00 00 00 0f ; [$a8a4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 af ; [$a8b4] undefined
    hex 00 18 00 05 00 00 00 90 00 04 00 03 00 00 00 81 ; [$a8c4] undefined
    hex 00 02 00 00 00 00 00 54 08 04 00 00 00 00 00 b2 ; [$a8d4] undefined
    hex 00 00 00 00 00 00 00 a8 00 80 00 01 00 00 00 11 ; [$a8e4] undefined
    hex 00 00 00 02 00 00 00 00 c0 00 00 00 00 00 00 ff ; [$a8f4] undefined
    hex 00 cd 00 10 00 00 00 fa 00 1d 00 00 00 00 00 3f ; [$a904] undefined
    hex 00 4c 00 00 00 00 00 22 00 cc 00 00 00 00 00 5f ; [$a914] undefined
    hex 00 cf 00 40 00 00 00 df 00 0a 00 00 00 00 00 9d ; [$a924] undefined
    hex 00 71 00 00 00 00 00 86 80 00 00 00 00 00 00 bf ; [$a934] undefined
    hex 00 c4 00 00 00 00 00 7b 00 ec 00 00 00 00 00 48 ; [$a944] undefined
    hex 00 81 00 00 00 00 00 8c 00 a4 00 00 00 00 00 ff ; [$a954] undefined
    hex 00 3e 00 00 00 00 00 7f 00 b6 00 00 00 00 00 4b ; [$a964] undefined
    hex 00 0d 00 01 00 00 00 0b 40 00 00 00 00 00 00 9b ; [$a974] undefined
    hex 00 0b 00 01 00 00 00 8a 00 1b 00 24 00 00 00 95 ; [$a984] undefined
    hex 00 a4 00 02 00 00 00 84 00 00 00 00 00 00 00 7f ; [$a994] undefined
    hex 00 db 00 18 00 00 00 cc 00 05 00 00 00 00 00 05 ; [$a9a4] undefined
    hex 00 08 00 60 00 00 00 00 00 00 00 82 00 00 00 a2 ; [$a9b4] undefined
    hex 00 5a 00 20 00 00 00 98 00 84 00 41 00 00 00 04 ; [$a9c4] undefined
    hex 00 40 00 20 00 00 00 42 00 00 00 00 00 00 00 09 ; [$a9d4] undefined
    hex 00 03 00 00 00 00 00 01 00 00 00 00 00 00 00 04 ; [$a9e4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ; [$a9f4] undefined
    hex 00 bc 00 10 00 00 00 7b 00 24 00 00 00 00 00 5d ; [$aa04] undefined
    hex 00 06 00 00 00 00 00 cc 00 00 00 00 00 00 00 df ; [$aa14] undefined
    hex 00 a8 00 04 00 00 00 5f 00 aa 00 10 00 00 00 7c ; [$aa24] undefined
    hex 00 d0 00 00 00 00 00 06 00 10 00 00 00 00 00 ff ; [$aa34] undefined
    hex 00 f3 00 00 00 00 00 11 00 4c 00 00 00 00 00 76 ; [$aa44] undefined
    hex 00 80 00 00 00 00 00 15 40 00 00 00 00 00 00 cd ; [$aa54] undefined
    hex 00 4c 00 00 00 00 00 7c 00 09 00 00 00 00 00 3f ; [$aa64] undefined
    hex 00 c8 00 00 00 00 00 49 00 05 00 00 00 00 00 6d ; [$aa74] undefined
    hex 00 30 00 12 00 00 00 76 00 8c 00 00 00 00 00 00 ; [$aa84] undefined
    hex 00 60 00 00 00 00 00 00 10 0a 00 00 00 00 00 5f ; [$aa94] undefined
    hex 00 d8 00 00 00 00 00 2c 00 00 00 00 00 00 00 12 ; [$aaa4] undefined
    hex 00 80 00 00 00 00 00 04 00 00 00 00 00 00 00 f9 ; [$aab4] undefined
    hex 00 18 00 00 00 00 00 1f 00 00 00 00 00 00 00 31 ; [$aac4] undefined
    hex 00 c0 00 08 00 00 20 04 00 00 00 00 00 00 00 b7 ; [$aad4] undefined
    hex 00 41 00 10 00 00 00 da 00 80 00 40 00 00 00 00 ; [$aae4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 df ; [$aaf4] undefined
    hex 00 39 00 20 00 00 00 ae 00 58 00 00 00 00 00 f3 ; [$ab04] undefined
    hex 00 18 00 00 00 00 00 61 00 00 00 00 00 00 00 ff ; [$ab14] undefined
    hex 00 bd 00 00 00 00 00 ff 00 3b 00 00 00 00 00 dc ; [$ab24] undefined
    hex 00 f0 00 00 00 00 00 61 00 00 00 00 00 00 00 df ; [$ab34] undefined
    hex 00 29 00 00 00 00 00 3d 00 1d 00 00 00 00 00 6c ; [$ab44] undefined
    hex 00 5c 00 02 00 00 00 02 00 00 00 40 00 00 00 fe ; [$ab54] undefined
    hex 00 16 00 38 00 00 00 66 00 29 00 20 00 00 00 fe ; [$ab64] undefined
    hex 00 01 00 00 00 00 00 10 00 80 00 00 00 00 00 af ; [$ab74] undefined
    hex 00 10 00 50 00 00 00 43 00 0c 00 00 00 00 00 02 ; [$ab84] undefined
    hex 00 40 00 00 00 00 00 00 00 80 00 00 00 00 00 06 ; [$ab94] undefined
    hex 00 2a 00 00 00 00 00 de 00 4a 00 c2 00 00 00 17 ; [$aba4] undefined
    hex 00 43 00 00 00 00 00 02 00 04 00 02 00 00 00 17 ; [$abb4] undefined
    hex 00 18 00 00 00 00 00 e7 00 d3 00 82 00 00 00 04 ; [$abc4] undefined
    hex 00 0c 00 00 00 00 00 00 00 00 00 00 00 00 00 6b ; [$abd4] undefined
    hex 00 04 00 00 00 00 00 04 00 10 00 00 00 00 00 a0 ; [$abe4] undefined
    hex 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 ff ; [$abf4] undefined
    hex 00 39 00 a0 00 00 00 6d 00 64 00 00 00 00 00 4c ; [$ac04] undefined
    hex 00 54 00 00 00 00 00 44 00 02 00 00 00 00 00 bf ; [$ac14] undefined
    hex 00 ae 00 00 00 00 00 f7 00 e6 00 40 00 00 00 f1 ; [$ac24] undefined
    hex 00 39 00 40 00 00 00 08 02 21 00 00 00 00 00 3f ; [$ac34] undefined
    hex 00 5a 00 80 00 00 00 e5 00 80 00 00 00 00 00 c1 ; [$ac44] undefined
    hex 00 01 00 80 00 00 00 1a 00 01 00 00 00 00 00 9b ; [$ac54] undefined
    hex 00 2c 00 08 00 00 00 bd 00 26 00 00 00 00 00 49 ; [$ac64] undefined
    hex 00 01 00 00 00 00 00 08 00 04 00 00 00 00 00 bf ; [$ac74] undefined
    hex 00 68 00 02 00 00 00 4d 00 59 00 00 00 00 00 05 ; [$ac84] undefined
    hex 00 10 00 00 00 00 00 09 00 00 00 00 00 00 00 7f ; [$ac94] undefined
    hex 00 0c 00 40 00 00 00 c8 00 10 00 00 00 00 00 00 ; [$aca4] undefined
    hex 00 80 00 04 00 00 00 65 00 00 00 00 00 00 00 f7 ; [$acb4] undefined
    hex 00 24 00 01 00 00 00 00 00 02 00 20 00 00 00 08 ; [$acc4] undefined
    hex 00 04 00 00 00 00 00 00 00 01 00 00 00 00 00 0b ; [$acd4] undefined
    hex 00 80 00 57 00 00 00 04 00 02 00 80 00 00 00 2a ; [$ace4] undefined
    hex 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00 ff ; [$acf4] undefined
    hex 00 4d 00 01 00 00 00 7d 00 44 00 00 00 00 00 b4 ; [$ad04] undefined
    hex 00 00 00 00 00 00 00 50 00 83 00 00 00 00 00 7b ; [$ad14] undefined
    hex 00 72 00 00 00 00 00 92 00 05 00 00 00 00 00 ad ; [$ad24] undefined
    hex 00 d3 00 40 00 00 00 3c 00 05 00 10 00 00 00 fe ; [$ad34] undefined
    hex 00 59 00 00 00 00 00 5d 00 91 00 00 00 00 00 7a ; [$ad44] undefined
    hex 00 00 00 80 00 00 00 3f 00 10 00 00 00 00 00 fe ; [$ad54] undefined
    hex 00 f2 00 15 00 00 00 fe 00 dc 00 00 00 00 00 c0 ; [$ad64] undefined
    hex 00 34 00 00 00 00 00 04 00 08 00 00 00 00 00 39 ; [$ad74] undefined
    hex 00 4e 00 84 00 00 00 e3 00 10 00 00 00 00 00 0c ; [$ad84] undefined
    hex 00 43 00 00 00 00 00 08 00 00 00 00 00 00 00 a7 ; [$ad94] undefined
    hex 00 c9 00 00 00 00 00 44 00 1b 00 01 00 00 00 aa ; [$ada4] undefined
    hex 00 00 00 80 00 00 00 01 00 00 00 00 00 00 00 fb ; [$adb4] undefined
    hex 00 d9 00 20 00 00 00 21 00 67 00 00 00 00 00 88 ; [$adc4] undefined
    hex 00 01 00 80 00 00 00 21 00 00 00 00 00 00 00 51 ; [$add4] undefined
    hex 00 24 00 0c 00 00 00 08 00 01 00 80 00 00 00 04 ; [$ade4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b7 ; [$adf4] undefined
    hex 00 cf 00 82 00 00 00 df 00 26 00 02 00 00 00 34 ; [$ae04] undefined
    hex 00 05 00 00 00 00 00 8c 00 20 00 00 00 00 00 ff ; [$ae14] undefined
    hex 00 d7 00 00 00 00 00 7d 00 c3 00 00 00 00 00 89 ; [$ae24] undefined
    hex 00 00 00 00 00 00 00 19 00 05 00 00 00 00 00 ff ; [$ae34] undefined
    hex 00 4a 00 00 00 00 00 7e 00 41 00 00 00 00 00 67 ; [$ae44] undefined
    hex 00 0a 00 00 00 00 00 8a 00 00 00 00 00 00 00 ff ; [$ae54] undefined
    hex 00 b3 00 80 00 00 00 7d 00 6c 00 00 00 00 00 08 ; [$ae64] undefined
    hex 00 20 00 02 00 00 00 0a 00 04 00 80 00 00 00 fe ; [$ae74] undefined
    hex 00 2f 00 41 00 00 00 c9 00 08 00 00 00 00 00 4a ; [$ae84] undefined
    hex 00 c4 00 00 00 00 00 82 00 00 00 00 00 00 00 ff ; [$ae94] undefined
    hex 00 30 00 40 00 00 00 cf 00 42 00 80 00 00 00 19 ; [$aea4] undefined
    hex 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00 a5 ; [$aeb4] undefined
    hex 00 a3 00 00 00 00 00 47 00 28 00 00 00 00 00 53 ; [$aec4] undefined
    hex 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 72 ; [$aed4] undefined
    hex 00 8d 00 00 00 00 00 04 00 42 00 00 00 00 00 20 ; [$aee4] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 ff ; [$aef4] undefined
    hex 00 9c 00 00 00 00 00 77 00 8b 00 00 00 00 00 8d ; [$af04] undefined
    hex 00 10 00 00 00 00 00 11 08 14 00 00 00 00 00 ff ; [$af14] undefined
    hex 00 d8 00 00 00 00 00 5f 00 c1 00 02 00 00 00 52 ; [$af24] undefined
    hex 08 00 00 00 00 00 00 06 00 04 00 00 00 00 00 ff ; [$af34] undefined
    hex 00 85 00 01 00 00 00 67 00 6a 00 00 00 00 00 63 ; [$af44] undefined
    hex 00 14 00 00 00 00 00 86 00 41 00 00 00 00 00 6f ; [$af54] undefined
    hex 00 73 00 00 00 00 00 1c 00 96 00 20 00 00 00 38 ; [$af64] undefined
    hex 00 a2 00 00 00 00 00 00 00 02 00 00 00 00 00 6f ; [$af74] undefined
    hex 00 3a 00 a0 00 00 00 ac 00 00 00 04 00 00 00 1d ; [$af84] undefined
    hex 20 00 00 80 00 00 00 00 04 00 00 00 00 00 00 f5 ; [$af94] undefined
    hex 00 3a 00 00 00 00 00 3b 00 00 00 80 00 00 00 78 ; [$afa4] undefined
    hex 00 20 00 80 00 00 40 02 00 00 00 00 00 00 00 7a ; [$afb4] undefined
    hex 00 06 00 41 00 00 00 23 00 01 00 00 00 00 00 b0 ; [$afc4] undefined
    hex 00 82 00 80 00 00 00 44 82 00 00 00 00 00 00 f1 ; [$afd4] undefined
    hex 00 20 00 00 00 00 00 cd 00 02 00 80 00 00 00 e6 ; [$afe4] undefined
    hex 02 80 00 80 00 00 00 00 00 00 00 00 00 ff 11 ff ; [$aff4] undefined
    hex ff ff ba ff 00 ff be ff fd ff fb ff 00 ff 76 ff ; [$b004] undefined
    hex bf ff fe ff 00 ff ff ff ff ff ff bf 00 ff ad ff ; [$b014] undefined
    hex 9b ff 8f 9f 00 ff 31 ff fa ff f5 ff 00 ff d7 ff ; [$b024] undefined
    hex ff ff ef ee 00 ff 7b ff ff ff ff 3d 00 ff 76 ff ; [$b034] undefined
    hex f5 ff bb ff 00 ff be ff fe ff 8f ff 00 ff fe ff ; [$b044] undefined
    hex ef ff ff ff 00 ff f7 ff ef ff ff ae 00 ff 28 ff ; [$b054] undefined
    hex e5 ff bb ff 00 ff d0 ff f9 ff eb df 00 ff dd ff ; [$b064] undefined
    hex fd ff 3f db 00 ff bf ff ff ff bf df 00 ff f8 ff ; [$b074] undefined
    hex e4 ff ee ff 00 ff b5 ff bb ff f6 bf 00 ff fe ff ; [$b084] undefined
    hex df ff df 97 00 ff fb ff ff ff ff 45 00 ff 64 ff ; [$b094] undefined
    hex c3 ff 7f ff 00 ff 1a ff e6 ff f7 67 00 ff e6 ff ; [$b0a4] undefined
    hex fd ff be 7a 00 ff fd ff ff ff ff 84 00 ff cc ff ; [$b0b4] undefined
    hex c7 ff c7 fe 00 ff 60 ff fd ff fb bb 00 ff bf ff ; [$b0c4] undefined
    hex 7f ff ff 3f 00 ff ff ff ff ff ff 3f 00 ff 08 ff ; [$b0d4] undefined
    hex 78 ff c8 7f 00 ff 6b ff ef ff fd ed 00 ff 32 ff ; [$b0e4] undefined
    hex 7f ff fb da 00 ff fe ff ff ff ff f7 00 ff 31 ff ; [$b0f4] undefined
    hex 75 ff 7f ff 00 ff a2 ff cd ff ff df 00 ff b6 ff ; [$b104] undefined
    hex 5f ff ff df 00 ff ef ff ff ff 7f ff 00 ff 64 ff ; [$b114] undefined
    hex db ff 6f ff 00 ff e7 ff df ff ff ff 00 ff 8a ff ; [$b124] undefined
    hex ef ff ff ff 00 ff ee ff ff ff ff 7f 00 ff 70 ff ; [$b134] undefined
    hex fd ff ff ff 00 ff e4 ff fe ff fd ff 00 ff f8 ff ; [$b144] undefined
    hex 7f ff ff ff 00 ff ff ff ff ff ff f5 00 ff aa ff ; [$b154] undefined
    hex 3a ff d7 ff 00 ff 18 ff ff 7f df ef 00 ff 5b ff ; [$b164] undefined
    hex fd ff ff 7c 00 ff ff ff ff ff ef 9b 00 ff 18 ff ; [$b174] undefined
    hex df ff ab ff 00 ff d4 ff ff ff fe bf 00 ff 70 ff ; [$b184] undefined
    hex ff ff ff 4f 00 ff fb ff ff bf ff f5 00 ff 80 ff ; [$b194] undefined
    hex ec ff 0c df 00 ff c0 ff 7e ff 72 ff 00 ff fe ff ; [$b1a4] undefined
    hex ff ff ff ff 00 ff ff ff ff ff ff 7b 00 ff 1a ff ; [$b1b4] undefined
    hex 89 ff ac ff 00 ff ea ff df ff fb df 00 ff 7e ff ; [$b1c4] undefined
    hex fb ff f5 f7 00 ff f3 ff ff ff fe 69 00 ff 40 ff ; [$b1d4] undefined
    hex de ff ce ff 00 ff 67 ff be 7f eb fb 00 ff e7 ff ; [$b1e4] undefined
    hex f7 fe fe de 00 ff ee ff ff f3 ff 02 00 ff 66 ff ; [$b1f4] undefined
    hex eb ff de ff 00 ff cb ff eb ff ef 7f 00 ff af ff ; [$b204] undefined
    hex ff ff ff ff 00 ff f6 ff ff ff fd 7f 00 ff b4 ff ; [$b214] undefined
    hex ae ff 8d ff 00 ff cd ff ff ff fc f7 00 ff 7c ff ; [$b224] undefined
    hex fe ef ff 5b 00 ff ff ff ff ff ff ff 00 ff 80 ff ; [$b234] undefined
    hex dd ff 5e ff 00 ff ea ff 2f ff ff ff 00 ff dc ff ; [$b244] undefined
    hex ff ff fe 3f 00 ff ff ff ff ff fe e7 00 ff 64 ff ; [$b254] undefined
    hex af ff f1 ff 00 ff 4e ff fe ff ee ff 00 ff bb ff ; [$b264] undefined
    hex b7 ff ff fe 00 ff ff ff fc ff ff 7e 00 ff 08 ff ; [$b274] undefined
    hex a9 ff ed df 00 ff 6a ff fe ff fa fd 00 ff d4 ff ; [$b284] undefined
    hex ff ff ff ef 00 ff f6 ff ff ff ff e1 00 ff 80 ff ; [$b294] undefined
    hex d4 ff dd ff 00 ff ef ff fc ff fb ef 00 ff e2 ff ; [$b2a4] undefined
    hex ef ff ff 7c 00 ff ff ff fe 7f fd c7 00 ff 78 ff ; [$b2b4] undefined
    hex 5e ff f6 e7 00 ff e8 ff fd ff ef ff 00 ff ea ff ; [$b2c4] undefined
    hex ff ff b6 7f 00 ff ff bf fe ff ff 04 00 ff 80 ff ; [$b2d4] undefined
    hex f9 ff fd fe 00 ff 7a ff ff ff bb ff 00 ff fd ff ; [$b2e4] undefined
    hex ff ff ff de 00 ff 9b ff ff bf ff 1b 00 ff 31 ff ; [$b2f4] undefined
    hex f0 ff f6 ff 00 ff 91 ff ff ff ff f7 00 ff af ff ; [$b304] undefined
    hex bf ff 7f fe 00 ff ff ff ff ff ff d6 00 ff 02 ff ; [$b314] undefined
    hex aa ff f7 ff 00 ff b2 ff bf ff 7f ff 00 ff db ff ; [$b324] undefined
    hex ff ff ff ef 00 ff ff ff ff ff ff ff 00 ff c0 ff ; [$b334] undefined
    hex 54 ff dd fb 00 ff 6e ff bd ff ee ff 00 ff bf ff ; [$b344] undefined
    hex 7e ff ff eb 00 ff eb ff ff ff f7 ed 00 ff 28 ff ; [$b354] undefined
    hex be ff cd ff 00 ff 1b ff ff ff eb 7f 00 ff fd ff ; [$b364] undefined
    hex ff ff fd 37 00 ff ff ff ff ff ff fd 00 ff 24 ff ; [$b374] undefined
    hex bb ff bf ff 00 ff ec ff ff ff fd cf 00 ff 8f ff ; [$b384] undefined
    hex ff ff ed be 00 ff df ff ff ff ff f1 00 ff a0 ff ; [$b394] undefined
    hex 24 ff c4 ff 00 ff 29 ff ff ff fd df 00 ff da ff ; [$b3a4] undefined
    hex fb ff ff 7f 00 ff df ef ff ff ff 71 00 ff 92 ff ; [$b3b4] undefined
    hex dd ff d7 eb 00 ff b9 ff ef ff ff ff 00 ff ab ff ; [$b3c4] undefined
    hex ff ff ff f7 00 ff fb ff ff ff ff 3e 00 ff e0 ff ; [$b3d4] undefined
    hex 52 ff 3e ff 00 ff da ff fb bf ff bb 00 ff df ff ; [$b3e4] undefined
    hex ff ff 7e e9 00 ff f9 ff ff ff df 5f 00 ff e4 ff ; [$b3f4] undefined
    hex f8 ff 7b df 00 ff eb ff fe ff ff f7 00 ff fe ff ; [$b404] undefined
    hex ff ff ff ff 00 ff fe ff df ff ff df 00 ff ac ff ; [$b414] undefined
    hex b3 ff 9e ff 00 ff 5a ff 9f ff ff ff 00 ff ce ff ; [$b424] undefined
    hex fd ff fd bf 00 ff ff ff ff ff ff bf 00 ff 24 ff ; [$b434] undefined
    hex bd ff dd ff 00 ff 8a ff ff ff ff ff 00 ff fd ff ; [$b444] undefined
    hex ff ff fe cc 00 ff bd ff ff f7 ff 5b 00 ff 0a ff ; [$b454] undefined
    hex 6d ff 5a 9f 00 ff 9e ff 53 ff fa 4f 00 ff c4 ff ; [$b464] undefined
    hex ff ff fb 4f 00 ff ff ff ff ff ff b1 00 ff 8f ff ; [$b474] undefined
    hex 7d ff 64 ff 00 ff 62 ff 7f ff e3 7f 00 ff f3 ff ; [$b484] undefined
    hex ff ff ff ff 00 ff ff ff ff ff ff 09 00 ff 16 ff ; [$b494] undefined
    hex 4d ff 29 ff 00 ff 6e ff fb ff bb bf 00 ff df ff ; [$b4a4] undefined
    hex ff ff ef 6e 00 ff ff ff ff ff ff 81 00 ff 04 ff ; [$b4b4] undefined
    hex 0b ff e3 ff 00 ff b0 ff e6 ff fe ff 00 ff ec ff ; [$b4c4] undefined
    hex af ff ef ff 00 ff ff ff ff ff ff 38 00 ff a5 ff ; [$b4d4] undefined
    hex f3 ff 7f bf 00 ff 3f ff b7 fb ef 6f 00 ff de ff ; [$b4e4] undefined
    hex ff ff ff 67 00 ff ff ff fb f7 ff a2 00 ff f8 ff ; [$b4f4] undefined
    hex e7 ff ca bf 00 ff a0 ff ff ff fc ff 00 ff df ff ; [$b504] undefined
    hex fb ff ff f7 00 ff ff ff ff ff ff af 00 ff 06 ff ; [$b514] undefined
    hex b5 ff a7 ff 00 ff 56 ff f5 ff f7 6f 00 ff 5f ff ; [$b524] undefined
    hex ff ff f5 ff 00 ff bf ff ff ff ff f7 00 ff a0 ff ; [$b534] undefined
    hex 7e ff be ff 00 ff ea ff f7 ff 69 5e 00 ff db ff ; [$b544] undefined
    hex ff ff ff 7f 00 ff 57 ff ff ff ff 2f 00 ff 00 ff ; [$b554] undefined
    hex db ff a8 fe 00 ff be ff 7f ff bf fe 00 ff e5 ff ; [$b564] undefined
    hex ef ff df 7e 00 ff ff ff f7 ff ff f3 00 ff 02 ff ; [$b574] undefined
    hex f3 ff 60 7f 00 ff 97 ff fd ff ff dc 00 ff ff ff ; [$b584] undefined
    hex d7 ff bd ff 00 ff e7 ff ff ff fb 9c 00 ff 82 ff ; [$b594] undefined
    hex e7 ff d7 ff 00 ff 7d ff e7 ff f7 ff 00 ff 0a ff ; [$b5a4] undefined
    hex ff ff de 97 00 ff bf ff e7 ff ff 98 00 ff 07 ff ; [$b5b4] undefined
    hex 60 ff da ff 00 ff 88 ff fe ff fd ff 00 ff e7 ff ; [$b5c4] undefined
    hex fa ff ff ef 00 ff ff ff ff ff ff 6f 00 ff 21 ff ; [$b5d4] undefined
    hex fd ff fe fb 00 ff 90 ff fb ff 76 fe 00 ff e1 ff ; [$b5e4] undefined
    hex 7f ff fd 3f 00 ff ff ff ff ff f7 4e 00 ff 24 ff ; [$b5f4] undefined
    hex 1f ff 6d ef 00 ff af ff 7d ff e9 ff 00 ff 36 ff ; [$b604] undefined
    hex 7f ff ff b7 00 ff ff ff ff ff f7 ff 00 ff c3 ff ; [$b614] undefined
    hex ff ff ef ff 00 ff 98 ff 7f ff ff fe 00 ff aa ff ; [$b624] undefined
    hex fe ff fd ff 00 ff fe ff bf ff ff fb 00 ff 84 ff ; [$b634] undefined
    hex bf ff b7 ff 00 ff f7 ff ff ff 7b ff 00 ff bf ff ; [$b644] undefined
    hex ff ff ff 7b 00 fd fb ff ff ff ff 55 00 ff 68 ff ; [$b654] undefined
    hex e5 ff d8 ff 00 ff 03 ff ff ff 7e ff 00 ff bb ff ; [$b664] undefined
    hex fb ff fd 7b 00 ff fe ff ff ff ff ef 00 ff 80 ff ; [$b674] undefined
    hex e9 ff bb f7 00 ff 32 ff ed ff 4d fb 00 ff a5 ff ; [$b684] undefined
    hex df ff df 3f 00 ff ff ff ff 7f ff e4 00 ff 00 ff ; [$b694] undefined
    hex cd ff bb ff 00 ff c2 ff dd ff f7 7f 00 ff 46 ff ; [$b6a4] undefined
    hex fd ff bf 7f 00 ff fe ff fb ff ff 5b 00 ff a0 ff ; [$b6b4] undefined
    hex dc ff f4 ff 00 ff f9 ff c5 ff fb bf 00 ff ff ff ; [$b6c4] undefined
    hex fb ff f3 fe 00 ff ff 7f ff ff ff 60 00 ff 35 ff ; [$b6d4] undefined
    hex 81 ff f3 ff 00 ff c1 ff ff ff 7b 3f 00 ff fd ff ; [$b6e4] undefined
    hex ff ff ff 5e 00 ff fb ff ff ff ff 0d 00 ff 85 ff ; [$b6f4] undefined
    hex f8 ff b2 ff 00 ff f5 ff ff ff f7 ff 00 ff e9 ff ; [$b704] undefined
    hex ef ff ff ff 00 ff ed ff ff ff ff db 00 ff e8 ff ; [$b714] undefined
    hex fe ff f5 ff 00 ff a6 ff ff ff df ff 00 ff 6f ff ; [$b724] undefined
    hex f7 ff fd be 00 ff ff ff ff ff ff 6b 00 ff 86 ff ; [$b734] undefined
    hex 75 ff d8 ff 00 ff 28 ff f7 ff f9 ff 00 ff af ff ; [$b744] undefined
    hex ff ff f7 fd 00 ff fe ff fe ff ff f7 00 ff a0 ff ; [$b754] undefined
    hex a5 ff be bf 00 ff 95 ff bf ff af ff 00 ff 7d ff ; [$b764] undefined
    hex ff ff ef cb 00 ff fb ff ff ff fe be 00 ff 0a ff ; [$b774] undefined
    hex 5a ff b4 f7 00 ff 1b ff bd ff 79 ff 00 ff ff ff ; [$b784] undefined
    hex f7 ff ff cf 00 ff fe ff ff ff ff ed 00 ff 20 ff ; [$b794] undefined
    hex 23 ff d3 ff 00 ff bd ff ce ff ce ff 00 ff 37 ff ; [$b7a4] undefined
    hex ef ff ff ff 00 ff ff ff ff ff ff fb 00 ff 45 ff ; [$b7b4] undefined
    hex 5e ff 9f ff 00 ff f8 ff 75 ff ff ff 00 ff b1 ff ; [$b7c4] undefined
    hex ff ff ff b5 00 ff f7 ff df ff ff 17 00 ff c6 ff ; [$b7d4] undefined
    hex f0 ff 83 ff 00 ff f8 ff ef ff ef dd 00 ef ff ff ; [$b7e4] undefined
    hex ff ff ef df 00 ff ff ff ff ff ff 4e 00 ff 80 ff ; [$b7f4] undefined
    hex ff ff fe ff 00 ff d2 ff ff ff ef ef 00 ff af ff ; [$b804] undefined
    hex f6 ff ff ff 00 ff de ff fe ff ff f3 00 ff f0 ff ; [$b814] undefined
    hex 7d ff 66 fb 00 ff e6 ff e2 ff ff f7 00 ff df ff ; [$b824] undefined
    hex ff ff fe ff 00 ff d7 ff ff fb fd fe 00 ff 72 ff ; [$b834] undefined
    hex ed ff f7 ff 00 ff e8 ff be ff ff ff 00 ff c6 ff ; [$b844] undefined
    hex ff ff fd ee 00 ff ff ff fd bf f5 e1 00 ff ac ff ; [$b854] undefined
    hex 31 ff ee fd 00 ff 03 ff be ff ef 9e 00 ff f9 ff ; [$b864] undefined
    hex 7f ff df 5f 00 ff fd ff 7f ff fb fb 00 ff 48 ff ; [$b874] undefined
    hex 8c ff 70 df 00 ff 93 ff ff ff e7 ff 00 ff 75 ff ; [$b884] undefined
    hex ff ff ff ab 00 ff f5 ff ff f7 ff 40 00 ff 34 ff ; [$b894] undefined
    hex f3 ff f4 ff 00 ff ac ff ff ff ff bf 00 ff dd ff ; [$b8a4] undefined
    hex fa ff ef 32 00 ff ff ff fe ff ff 2a 00 ff 22 ff ; [$b8b4] undefined
    hex 68 ff b6 de 00 ff 0e ff 66 ff 72 ed 00 ff da ff ; [$b8c4] undefined
    hex fe ff fd df 00 ff ff ff fb fb ff 17 00 ff 30 ff ; [$b8d4] undefined
    hex b5 ff de 7f 00 ff 79 fb d7 ff db ee 00 ff f9 ff ; [$b8e4] undefined
    hex ff ff ff 5a 00 ff f7 ff ff ff ff 4f 00 ff fc ff ; [$b8f4] undefined
    hex 8c ff df ff 00 ff a1 ff f5 ff ef f7 00 ff 75 ff ; [$b904] undefined
    hex fa fb ff ff 00 ff 5f ff ff bf ff ff 00 ff 00 ff ; [$b914] undefined
    hex b2 ff 1e 7f 00 ff 53 ff ee ff df df 00 ff e9 ff ; [$b924] undefined
    hex fe ff ff d7 00 ff ff ff ff ff ff 7d 00 ff 80 ff ; [$b934] undefined
    hex fa ff ff ff 00 ff 6a ff 7e ff ff f7 00 ff fe ff ; [$b944] undefined
    hex db ff fe f7 00 ff fe ff ff ff ff 47 00 ff a7 ff ; [$b954] undefined
    hex 65 ff e5 ff 00 ff 50 ff ef ff ba fd 00 ff 7e ff ; [$b964] undefined
    hex fe ff ff ff 00 ff ff ff ff ff ff 0f 00 ff 4c ff ; [$b974] undefined
    hex e8 ff 32 ff 00 ff 11 ff fa ff 46 ff 00 ff 9d ff ; [$b984] undefined
    hex ff ff ff 3f 00 ff f7 ff ff ff ff 25 00 ff 92 ff ; [$b994] undefined
    hex f2 ff 9f ff 00 ff ce ff ed ff fa df 00 ff ac ff ; [$b9a4] undefined
    hex ff ff ff ff 00 ff fb ff fd ff df e4 00 ff b8 ff ; [$b9b4] undefined
    hex 7d ff 82 ff 00 ff f9 ff 77 ff fa fe 00 ff ba ff ; [$b9c4] undefined
    hex fe ff 7f 7f 00 ff df ff fb ff ff 27 00 ff 42 ff ; [$b9d4] undefined
    hex ca ff 4b ff 00 ff a4 ff ff ff fb 95 00 ff fc ff ; [$b9e4] undefined
    hex ff ff f7 fb 00 ff f7 ff ff ff ff 75 00 ff 8c ff ; [$b9f4] undefined
    hex bf ff dc f7 00 ff b4 ff fa ff df ff 00 ff ca ff ; [$ba04] undefined
    hex ff ff be df 00 ff f7 ff ff ff ff fe 00 ff 93 ff ; [$ba14] undefined
    hex 37 ff 91 fb 00 ff 6c ff df ff f7 ff 00 ff 5e ff ; [$ba24] undefined
    hex df ff ff f5 00 ff fa ff ff ff ff 97 00 ff 04 ff ; [$ba34] undefined
    hex dc ff 7c bb 00 ff ba ff de ff fc bf 00 ff 32 ff ; [$ba44] undefined
    hex bf ff ff cb 00 fd fe ff ff ff ff dd 00 ff 8e ff ; [$ba54] undefined
    hex 9d ff e5 df 00 ff fb ff fe ff df ff 00 ff f7 ff ; [$ba64] undefined
    hex fb ff df d7 00 ff ff ff ff ff ff f3 00 ff b0 ff ; [$ba74] undefined
    hex e7 ff 5c ff 00 ff df ff 9d ff ff ff 00 ff cc ff ; [$ba84] undefined
    hex ff ff ff ae 00 ff 5f ff ff df ff 6e 00 ff 8c ff ; [$ba94] undefined
    hex 5d ff f5 ff 00 ff 71 ff fe ff ff bf 00 ff f7 ff ; [$baa4] undefined
    hex ff ff af 6e 00 ff f1 ff ff ff ff 07 00 ff 34 ff ; [$bab4] undefined
    hex 2b ff fe ff 00 ff d8 ff fa ef fe ff 00 ff f0 7f ; [$bac4] undefined
    hex ff ff ff b9 00 ff fb ff bd ff ff 7e 00 ff c2 ff ; [$bad4] undefined
    hex 46 ff fb ff 00 ff f6 ff 87 ff fd 9e 00 ff 7b ff ; [$bae4] undefined
    hex ff ff ff 33 00 7f ff ff ff ff ff 93 00 ff 84 ff ; [$baf4] undefined
    hex ed ff 6d ff 00 ff b1 ff e7 ff 7f ff 00 ff fa ff ; [$bb04] undefined
    hex ef ff ff ff 00 ff ff ff ff ff ff b7 00 ff 80 ff ; [$bb14] undefined
    hex eb ff ff ff 00 ff d7 ff fd ff 7b fe 00 ff ff ff ; [$bb24] undefined
    hex ef ff bf df 00 ff 7f ff ff ff ff df 00 ff b8 ff ; [$bb34] undefined
    hex ed ff ad ff 00 ff 5d ff b7 ff bf bb 00 ff de ff ; [$bb44] undefined
    hex bf ff ff f9 00 ff fb ff ff ff ff 26 00 ff e4 ff ; [$bb54] undefined
    hex e7 ff a1 ff 00 ff b7 ff 3e ff ff 5f 00 ff f4 ff ; [$bb64] undefined
    hex fb ff 7f bd 00 ff df ff 5f ff ff f7 00 ff 80 ff ; [$bb74] undefined
    hex dd ff dc fe 00 ff db ff ff ff f7 ff 00 ff ee ff ; [$bb84] undefined
    hex ff ff ff 7d 00 ff ff ff ff ff ff dd 00 ff 9a ff ; [$bb94] undefined
    hex 51 ff cd ff 00 ff 12 ff ef ff ff fe 00 ff 7e ff ; [$bba4] undefined
    hex 3f ff df b7 00 ff ff ff ff ff fd e9 00 ff a3 ff ; [$bbb4] undefined
    hex e3 ff f4 ff 00 ff b0 ff fd ff fa ad 00 ff 7f ff ; [$bbc4] undefined
    hex ff ff fd 79 00 ff ff ff ff ff bf 89 00 ff ba ff ; [$bbd4] undefined
    hex e9 ff 80 ff 00 ff 74 ff ff ff 7b cf 00 ff df ff ; [$bbe4] undefined
    hex 7f ff ff b1 00 ff fd df ff bf ff 4b 00 ff ce ff ; [$bbf4] undefined
    hex 7e ff 29 bf 00 ff f7 ff ef ff ef df 00 ff ef ff ; [$bc04] undefined
    hex ff ff ff ef 00 ff de ff ff ff ff 6b 00 ff 73 ff ; [$bc14] undefined
    hex ef ff ff ff 00 ff a3 ff ff ff fe bd 00 ff df ff ; [$bc24] undefined
    hex f7 ff f5 bf 00 ff ff ff ff fe df 5f 00 ff c1 ff ; [$bc34] undefined
    hex 36 ff fd ff 00 ff d3 ff 7b ff bb 7f 00 ff ca ff ; [$bc44] undefined
    hex ff ff fe f7 00 ff ff ff ff ff ff 3f 00 ff 14 ff ; [$bc54] undefined
    hex ab ff bd b7 00 ff 7f ff ef ff fb f5 00 ff bf ff ; [$bc64] undefined
    hex ff ff 5f d7 00 ff ff ff ff ff ff 45 00 ff 70 ff ; [$bc74] undefined
    hex fa ff 67 ff 00 ff bb ff e9 ff ef bf 00 ff 2d ff ; [$bc84] undefined
    hex ef ff df bf 00 ff ca ff ff ff ff 78 00 ff 4a ff ; [$bc94] undefined
    hex 36 bf f1 ff 00 ff d4 ff ed ff 7b ff 00 ff df ff ; [$bca4] undefined
    hex fa ff ff 7e 00 ff ef ff ff f7 ff 25 00 ff 46 ff ; [$bcb4] undefined
    hex ac ff bb bf 00 ff 36 ff f7 ff df 7f 00 ff c1 ff ; [$bcc4] undefined
    hex bf ff ff fb 00 ff ef ff ff ff ff 2e 00 ff 02 ff ; [$bcd4] undefined
    hex 18 ff f5 fe 00 ff dd ff fc ff ff b7 00 ff bf ff ; [$bce4] undefined
    hex be ff 7f ea 00 ff fd ff ff ef ff 87 00 ff 02 ff ; [$bcf4] undefined
    hex fa ff dc ff 00 ff ea ff 7f ff f9 ff 00 ff fa ff ; [$bd04] undefined
    hex ff ff ff f7 00 ff ff ff ff ff ff bf 00 ff 46 ff ; [$bd14] undefined
    hex fb ff ff ff 00 ff 3d ff ef ff ff 7f 00 ff be ff ; [$bd24] undefined
    hex ff ff ff d5 00 ff ff ff ff ff ff 5b 00 ff 62 ff ; [$bd34] undefined
    hex aa ff bd fb 00 ff 8b ff ef ff ff ff 00 ff f5 ff ; [$bd44] undefined
    hex ff ff ff 5f 00 ff ff ff ff f7 ff 61 00 ff 90 ff ; [$bd54] undefined
    hex e2 ff ff ff 00 ff 87 ff cb ff 53 ff 00 ff ec ff ; [$bd64] undefined
    hex ff ff ff 7b 00 ff ff ff ff ff ff 53 00 ff 01 ff ; [$bd74] undefined
    hex 9c ff e2 ff 00 ff a8 ff fe ff de ef 00 ff 57 ff ; [$bd84] undefined
    hex fd ff fc fa 00 ff f7 ff ff ff ff 76 00 ff 46 ff ; [$bd94] undefined
    hex b0 ff 6e ff 00 ff 33 ff f3 ff fb fa 00 ff f7 ff ; [$bda4] undefined
    hex bf ff ff 9b 00 ff ff ff f7 ff ff 11 00 ff 44 ff ; [$bdb4] undefined
    hex a6 ff ca ff 00 ff f5 ff f2 ff ef df 00 ff dc ff ; [$bdc4] undefined
    hex ff ff fd bb 00 ff f7 ff ff ff ff 97 00 ff 75 ff ; [$bdd4] undefined
    hex 55 ff 1b 9f 00 ff 9f ff 7f ff 7f fb 00 ff 3b ff ; [$bde4] undefined
    hex f7 ff fd f7 00 fe ff ff ff ff ff c5 00 ff a5 ff ; [$bdf4] undefined
    hex 72 ff fa fe 00 ff 62 ff f9 ff ef 5f 00 ff 5c ff ; [$be04] undefined
    hex bf ff ef ff 00 ff ff ff ff ff fe ff 00 ff c0 ff ; [$be14] undefined
    hex 51 ff fe ff 00 ff b7 ff f6 ff ff ef 00 ff bb ff ; [$be24] undefined
    hex ff ff fd fb 00 ff f7 ff fd ff ff 3b 00 ff c4 ff ; [$be34] undefined
    hex 95 ff ad ff 00 ff ce ff f6 ff fa df 00 ff ef ff ; [$be44] undefined
    hex ff ff ff ef 00 ff f5 ff ff ff fd 02 00 ff d0 ff ; [$be54] undefined
    hex 4e ff 54 ff 00 ff ce ff ff ff f6 7f 00 ff ff ff ; [$be64] undefined
    hex ff ff 7b 5f 00 ff be ff ff df ff 5e 00 ff 41 ff ; [$be74] undefined
    hex b6 ff 3f ff 00 ff 71 ff ef ff 37 df 00 ff 23 ff ; [$be84] undefined
    hex f7 ff fe db 00 ff ff ff ff fb ff fd 00 ff 71 ff ; [$be94] undefined
    hex 1a ff 9d ff 00 ff 2d ff f7 ff fb ff 00 ff fd ff ; [$bea4] undefined
    hex ff ff fd 77 00 ff ff ff ff ff ff 2f 00 ff 63 ff ; [$beb4] undefined
    hex d1 ff 34 ff 00 ff d9 ff bf ff 5d 7f 00 ff 3f ff ; [$bec4] undefined
    hex fe ff db fe 00 ff 7d ff ff ff ff 4d 00 ff c0 ff ; [$bed4] undefined
    hex f4 ff fa ff 00 ff f6 ff f4 ff ef ef 00 ff de ff ; [$bee4] undefined
    hex f7 ff ef 0d 00 bf ff ff ff ff ff bc 00 ff 86 ff ; [$bef4] undefined
    hex dd ff af fd 00 ff 6d ff 79 ff ff ff 00 ff f7 ff ; [$bf04] undefined
    hex ff ff 7f ff 00 ff ff ff f7 ff ff 3f 00 ff 14 ff ; [$bf14] undefined
    hex fc ff ee 7f 00 ff 9a ff fc ff f7 ff 00 ff d1 ff ; [$bf24] undefined
    hex fb ff fb ff 00 ff ff ff ff ff ff e7 00 ff 50 ff ; [$bf34] undefined
    hex de ff d7 ff 00 ff 3a ff f7 ff ff ff 00 ff ff ff ; [$bf44] undefined
    hex 7f ff f9 f7 00 ff ff ff ff ff ff 5f 00 ff 90 ff ; [$bf54] undefined
    hex 67 ff b0 ff 00 ff 97 ff ff ff ff 7f 00 ff 5f ff ; [$bf64] undefined
    hex ff ff ff de 00 ff ef ff ff ff ff 3a 00 ff 8c ff ; [$bf74] undefined
    hex 7c ff f4 ff 00 ff e8 ff cc ff ff bf 00 ff e7 ff ; [$bf84] undefined
    hex ff ff bf fc 00 ff ff 7f ff ff ff 83 00 ff 61 ff ; [$bf94] undefined
    hex e6 ff 5c f7 00 ff 9b ff db ff bd fd 00 ff bd ff ; [$bfa4] undefined
    hex fe ff ff de 00 ff fd ff ff ff ff 7f 00 ff 70 ff ; [$bfb4] undefined
    hex ff ff d9 ff 00 ff ef ff fe ff ff 6d 00 ff fa ff ; [$bfc4] undefined
    hex fd ff 7e 2b 00 ff dd ff ff f7 ff 1d 00 ff 48 ff ; [$bfd4] undefined
    hex df ff e5 ff 00 ff 89 ff ff ff ff 8f 00 ff 7f ff ; [$bfe4] undefined
    hex 7d ff fe ff 00 ff ff f7 ff ff ff 19 ; [$bff4] undefined
