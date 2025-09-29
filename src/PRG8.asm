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
    hex 0b 10 11 00 3e 5f 4f 1f 1f 5b 03 00 00 20 30 38 ; [$81a1] undefined
    hex 2a 7e 3c 00 00 00 00 80 c0 80 c0 00 00 00 00 00 ; [$81b1] undefined
    hex 00 00 00 07 3f 0b 1f 1e 0f 0c 5f 38 01 17 1e 1d ; [$81c1] undefined
    hex 1e 1f e0 80 80 e0 d0 70 a8 58 f8 00 c0 00 e0 e0 ; [$81d1] undefined
    hex 70 b0 30 9e ff 1c 0e 1f 0b 39 33 ef 00 0f 1f 03 ; [$81e1] undefined
    hex 1c 1e 3c f8 f0 e0 40 40 c0 80 80 30 30 70 a0 80 ; [$81f1] undefined
    hex 00 00 00 27 2a 69 68 68 68 68 c8 78 71 31 30 30 ; [$8201] undefined
    hex 30 70 f0 80 c0 20 80 10 40 50 a0 00 00 c0 e0 60 ; [$8211] undefined
    hex 70 60 c0 3e 5f 4f 1f 1f 43 13 07 00 20 30 38 2a ; [$8221] undefined
    hex 7e 3c 38 00 00 00 80 c0 80 c0 00 00 00 00 00 00 ; [$8231] undefined
    hex 00 00 00 3b 0f 10 0b 0b 17 0e 1c 07 07 0f 1f 1f ; [$8241] undefined
    hex 1b 17 0f 80 c0 c0 40 40 40 40 c0 00 80 00 80 80 ; [$8251] undefined
    hex 80 80 00 39 22 1e 0e 08 19 1d 1d 1e 1d 03 1f 17 ; [$8261] undefined
    hex 0e 0e 0e 80 80 80 80 80 00 00 00 00 00 00 00 00 ; [$8271] undefined
    hex 00 00 00 18 0d 0d 0d 0c 0c 1e 18 0e 0e 06 06 07 ; [$8281] undefined
    hex 07 0f 1e 07 0f 0e 0e 1d 09 3b 35 38 06 03 0d 0e ; [$8291] undefined
    hex 1e 1c 7a 80 c0 c0 e0 e0 f0 f0 f0 00 00 00 00 00 ; [$82a1] undefined
    hex 00 00 00 49 9f dc 0e 1f 1b 1e 1e f6 e0 0f 1f 0f ; [$82b1] undefined
    hex 04 17 37 90 d0 f0 c0 40 c0 80 80 20 60 00 00 80 ; [$82c1] undefined
    hex 00 00 00 36 27 2b 28 28 28 68 08 3b 7b 71 31 30 ; [$82d1] undefined
    hex 30 70 f0 00 40 00 a0 10 40 50 20 80 80 c0 c0 e0 ; [$82e1] undefined
    hex 70 60 c0 07 3f 0d 3f 3d 09 1f ff 38 01 12 16 16 ; [$82f1] undefined
    hex 16 00 40 c0 e0 f0 f0 70 a8 d8 f8 00 c0 e0 00 e0 ; [$8301] undefined
    hex 70 30 30 9c ff 1b 0f 0f 17 39 33 ef 00 05 15 15 ; [$8311] undefined
    hex 08 1e 3c f8 f0 e0 e0 80 00 80 80 30 70 70 00 40 ; [$8321] undefined
    hex c0 00 00 3f 0f 17 15 07 0f 1e 1c 03 03 08 1b 1b ; [$8331] undefined
    hex 13 07 0f 40 c0 c0 40 40 40 80 80 80 80 00 80 80 ; [$8341] undefined
    hex 80 00 00 39 26 1e 1e 1f 19 1d 1d 1e 19 05 15 00 ; [$8351] undefined
    hex 0e 0e 0e 80 80 80 80 80 00 00 00 00 00 00 00 00 ; [$8361] undefined
    hex 00 00 00 09 1e 0e 0e 1d 09 32 3c 36 0f 03 0d 0e ; [$8371] undefined
    hex 1e 0d 73 80 c0 80 e0 a0 70 50 70 00 00 40 00 40 ; [$8381] undefined
    hex 80 a0 80 48 9f de 0f 0f 17 1e 1e f7 e0 05 15 15 ; [$8391] undefined
    hex 08 17 37 90 d0 f0 c0 40 c0 80 80 20 60 00 00 80 ; [$83a1] undefined
    hex 00 00 00 3f 3c 34 34 34 3c 24 64 38 21 08 18 18 ; [$83b1] undefined
    hex 00 38 78 c0 e0 f0 78 38 20 28 50 00 80 a0 30 20 ; [$83c1] undefined
    hex 18 30 60 0e 0e 04 06 06 07 0f 0c 0d 09 03 03 03 ; [$83d1] undefined
    hex 00 07 0f 00 80 80 80 00 80 00 00 00 00 00 00 80 ; [$83e1] undefined
    hex 00 80 00 1b 1f 1d 14 14 14 34 04 15 18 11 08 18 ; [$83f1] undefined
    hex 18 38 78 00 e0 c0 d0 68 24 28 10 c0 00 a0 60 70 ; [$8401] undefined
    hex 38 30 60 c0 a0 a0 e0 a0 20 a0 20 00 c0 c0 00 c0 ; [$8411] undefined
    hex c0 c0 c0 40 80 80 00 00 00 00 00 80 00 00 80 80 ; [$8421] undefined
    hex 00 00 00 07 0f 1b 1f 3e 0f 96 3f 38 01 17 3e 1f ; [$8431] undefined
    hex 1e cf e0 80 80 e0 d0 70 a8 58 f8 00 c0 00 e0 e0 ; [$8441] undefined
    hex 70 b0 30 77 5f 2d 5c 19 28 16 0b 0d 31 76 6f 6e ; [$8451] undefined
    hex 17 09 04 c8 10 e0 40 80 00 00 00 f0 e0 00 80 00 ; [$8461] undefined
    hex 80 c0 c0 04 04 00 00 00 00 00 00 06 02 02 00 00 ; [$8471] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 40 40 00 00 00 ; [$8481] undefined
    hex 00 00 00 07 0b 0d 3f 3d 2c 9f 12 38 05 12 16 16 ; [$8491] undefined
    hex 13 e0 ed c0 e0 f0 f0 70 a8 d8 f8 00 c0 e0 00 e0 ; [$84a1] undefined
    hex 70 30 f0 00 2f 3c 3e 3d 1f 07 3d 00 2e 37 39 3e ; [$84b1] undefined
    hex 00 1b 3e 00 00 80 40 40 c0 c0 c0 00 00 00 80 80 ; [$84c1] undefined
    hex 00 00 00 3f 3f 17 9f de cd 9f 6f 39 33 2a 8a 4b ; [$84d1] undefined
    hex 43 c4 b7 f8 f8 f8 f8 f0 74 fc 7c a8 78 c8 90 38 ; [$84e1] undefined
    hex b8 00 98 ee 7f 17 0f 0f 05 09 3b 57 20 0a 02 00 ; [$84f1] undefined
    hex 0e 1e 24 7c ec c8 70 e0 a0 c0 c0 a8 70 70 80 80 ; [$8501] undefined
    hex 40 00 00 2f 3c 3e 3d 1f 07 3d 3f 2e 37 39 3e 00 ; [$8511] undefined
    hex 1b 3e 39 00 80 40 40 c0 c0 e0 c0 00 00 80 80 00 ; [$8521] undefined
    hex 00 a0 e0 2e 0f 0f 0f 03 8f 6f 17 33 20 05 0d 0d ; [$8531] undefined
    hex 81 e2 6f e0 70 a0 a0 a0 e0 c0 c0 30 80 c0 c0 c0 ; [$8541] undefined
    hex 00 80 00 1c 13 0f 0f 07 0e 0e 0e 0f 0c 02 0a 08 ; [$8551] undefined
    hex 07 07 0b c0 40 40 40 c0 80 80 80 00 80 80 80 00 ; [$8561] undefined
    hex 00 00 00 0e 0e 04 06 06 07 0f 0c 0d 09 03 03 03 ; [$8571] undefined
    hex 00 07 0f 00 80 80 80 00 80 00 00 00 00 00 00 80 ; [$8581] undefined
    hex 00 80 00 3f 3f 0f 06 07 0e 1d 8f 3a 33 24 03 07 ; [$8591] undefined
    hex 0b 0a 74 c0 e0 f0 f0 f8 ac b0 6c 80 a0 c0 40 00 ; [$85a1] undefined
    hex 50 4c 80 f6 8f 7f 07 0f 0b 0f 1f 79 70 02 0a 0a ; [$85b1] undefined
    hex 04 0b 0b f0 d6 ec e8 a0 e0 40 40 0c 1a 00 80 c0 ; [$85c1] undefined
    hex 00 80 80 1b 1f 1d 14 14 14 34 04 15 18 11 08 18 ; [$85d1] undefined
    hex 18 38 78 40 c0 e0 d0 68 28 28 10 80 00 80 60 70 ; [$85e1] undefined
    hex 30 30 60 ee 7e 1f 39 73 7c 64 32 55 21 0c 1e 5c ; [$85f1] undefined
    hex 60 58 1c fc 0c f8 30 90 50 e4 fb e8 f0 00 c0 e0 ; [$8601] undefined
    hex e0 1a de 1b 0f 06 00 00 00 00 00 0c 02 03 03 01 ; [$8611] undefined
    hex 00 00 00 65 07 01 00 00 00 00 00 5a 02 02 01 00 ; [$8621] undefined
    hex 00 00 00 1c 0a 06 01 01 00 00 00 0f 07 01 02 02 ; [$8631] undefined
    hex 00 00 00 80 40 40 40 00 00 00 00 00 80 80 80 80 ; [$8641] undefined
    hex 00 00 00 00 07 0f 0b 05 06 06 00 00 00 00 04 06 ; [$8651] undefined
    hex 03 0f 07 00 c0 e0 e0 f0 b8 70 f8 00 00 00 00 00 ; [$8661] undefined
    hex 40 80 00 01 06 ef 5b f7 6f 1e 7f 06 07 db 3f 3b ; [$8671] undefined
    hex f3 e7 00 e0 60 18 08 0c 0b 11 ff 00 80 e0 f4 f6 ; [$8681] undefined
    hex f6 e6 08 0c 0f 1e 0e 1d 1f 33 67 07 00 0f 1f 03 ; [$8691] undefined
    hex 18 3c 38 6e e6 00 00 20 40 e0 e0 81 00 e0 e0 c0 ; [$86a1] undefined
    hex a0 00 00 4d 59 69 68 48 50 50 90 70 60 70 70 70 ; [$86b1] undefined
    hex 60 e0 e0 e0 60 20 d0 68 28 24 6c 00 80 c0 e0 70 ; [$86c1] undefined
    hex 30 38 70 01 0e ef 5b f7 6f 1e 7f 06 0f d7 3d 3a ; [$86d1] undefined
    hex f3 e7 00 e0 e8 bc ac 4c 4b 51 ff 00 10 4c 50 b6 ; [$86e1] undefined
    hex b6 a6 08 0c 0f 1f 0f 1d 1f 33 67 07 00 0a 1a 02 ; [$86f1] undefined
    hex 18 3c 38 6e e6 c0 c0 60 40 e0 e0 81 00 a0 a0 80 ; [$8701] undefined
    hex a0 00 00 00 00 78 be 9f 4b 6b e7 00 00 00 40 60 ; [$8711] undefined
    hex 74 34 f8 00 00 00 00 80 00 80 00 00 00 00 00 00 ; [$8721] undefined
    hex 00 00 00 00 00 00 20 b8 e9 34 4f 00 00 00 20 20 ; [$8731] undefined
    hex 5f 4b 00 07 0f 1f 3f 7d fc 3c f0 78 73 06 66 be ; [$8741] undefined
    hex bf df 0f 00 20 d8 34 84 f4 64 f4 00 c0 e0 f8 78 ; [$8751] undefined
    hex 18 98 18 0f 0e 0f 0c 1e 1b 19 33 00 07 00 0f 03 ; [$8761] undefined
    hex 0c 1e 3c d4 60 e0 e0 60 60 e0 e0 38 98 00 00 80 ; [$8771] undefined
    hex 80 00 00 2c 34 10 1a 0a 0a 1a 02 30 38 1c 1c 0c ; [$8781] undefined
    hex 0c 1c 3c e0 30 48 20 34 10 12 22 00 c0 70 38 38 ; [$8791] undefined
    hex 1c 1c 3c 07 0f 7f 1f 7d bf 2e ff 78 71 03 60 83 ; [$87a1] undefined
    hex db db 00 c0 e0 c8 b4 9c f4 f4 f4 00 c0 b0 78 78 ; [$87b1] undefined
    hex 18 18 08 0e 0f 0f 0f 0f 0d 19 23 07 00 02 0a 00 ; [$87c1] undefined
    hex 0e 1e 3c 74 f8 60 e0 60 e0 e0 e0 98 00 80 80 80 ; [$87d1] undefined
    hex 00 00 00 00 0b 0f 0f 0f 0f 0f 0f 00 0b 0d 0e 0f ; [$87e1] undefined
    hex 00 00 0f 00 c0 20 80 50 f0 b0 60 00 80 c0 60 a0 ; [$87f1] undefined
    hex 00 c0 80 1f 3a 3d 7d f5 6e 3c ec 00 1d 0e 56 ba ; [$8801] undefined
    hex d1 c7 0f e0 5c ce 4d 4b 57 ff fa 18 ac b0 b6 b6 ; [$8811] undefined
    hex a0 00 15 0f 0e 0f 1f 1f 37 63 57 08 07 08 1a 02 ; [$8821] undefined
    hex 38 5c 68 ae a0 e0 40 c0 60 e0 60 40 40 00 a0 a0 ; [$8831] undefined
    hex 80 00 80 59 70 48 48 48 38 c8 c8 20 40 70 70 70 ; [$8841] undefined
    hex 00 70 f0 e0 e0 b0 78 08 3c 64 64 80 00 c0 60 30 ; [$8851] undefined
    hex 00 38 78 3f 3f 17 1f 1e cd ff 6f 39 33 2a 0a 0b ; [$8861] undefined
    hex 83 44 d7 00 bc f2 f9 f5 ff 1f f7 00 b8 dc e6 fa ; [$8871] undefined
    hex 00 6c f8 00 00 00 c0 ff f7 e5 0f 00 00 80 40 d9 ; [$8881] undefined
    hex 49 9a 00 ef ff fb 7f fe ec 3f ec f0 c2 8d 2c af ; [$8891] undefined
    hex b7 d0 07 d0 f0 40 b8 fc dc f8 f8 a0 f0 b0 78 74 ; [$88a1] undefined
    hex 28 1c 1c 0a 07 0f 0f 0f 0c 18 33 07 00 02 0a 00 ; [$88b1] undefined
    hex 0f 1f 2c 7c fc fc f0 f0 e0 e0 e0 98 00 98 98 80 ; [$88c1] undefined
    hex 00 00 00 3f 36 1a 1a 0a 0e 19 21 30 08 1c 0c 0c ; [$88d1] undefined
    hex 00 1e 3e f0 f8 78 2c 16 0e 0b 17 00 00 40 10 18 ; [$88e1] undefined
    hex 00 1c 38 00 0b 2f 2f d7 d7 d7 af 00 30 70 70 60 ; [$88f1] undefined
    hex 60 60 70 00 c0 e0 e0 f0 f0 f0 ec 00 00 00 00 00 ; [$8901] undefined
    hex 00 00 08 6b 4d 2e 17 1b 08 0f 0b 34 36 17 0f 07 ; [$8911] undefined
    hex 07 00 07 e6 de 7c e4 c8 1e e4 a0 0c 34 f6 fe f6 ; [$8921] undefined
    hex e0 00 c0 0f 3f 0b 2c 3f 29 35 14 08 17 37 13 00 ; [$8931] undefined
    hex 10 18 18 e0 c0 a0 60 e0 a0 60 60 20 e0 c0 80 00 ; [$8941] undefined
    hex 40 c0 c0 0c 3c 24 18 00 00 00 00 18 28 18 00 00 ; [$8951] undefined
    hex 00 00 00 20 60 20 60 70 30 20 c0 c0 80 c0 c0 c0 ; [$8961] undefined
    hex c0 c0 00 7b 5d 3e 17 13 08 0f 0b 2c 2e 01 0e 0e ; [$8971] undefined
    hex 07 00 07 fe fe 7c ec c8 1e e4 a0 04 34 86 f6 f6 ; [$8981] undefined
    hex e0 00 c0 07 37 03 2b 3f 29 35 14 08 1d 3d 15 00 ; [$8991] undefined
    hex 10 18 18 e0 e0 e0 a0 e0 a0 60 60 00 40 40 40 00 ; [$89a1] undefined
    hex 40 c0 c0 00 0b 2c 59 db f9 d8 de 00 30 73 67 67 ; [$89b1] undefined
    hex 07 67 63 00 c0 20 90 d0 90 10 6c 00 00 c0 e0 e0 ; [$89c1] undefined
    hex e0 e0 c8 ab 7f 7f 35 14 09 0f 0b 5d 5c 21 0e 0f ; [$89d1] undefined
    hex 07 00 07 ce fe fc ae 28 9a ec 20 b0 38 82 74 f6 ; [$89e1] undefined
    hex e4 00 c0 07 37 73 3b 7f 2d 35 15 08 1d 0d 65 00 ; [$89f1] undefined
    hex 10 18 18 e0 e0 e0 a0 e0 a0 a0 a0 00 40 40 40 00 ; [$8a01] undefined
    hex 40 c0 c0 1d 3d 1d 05 01 01 01 00 00 28 38 18 00 ; [$8a11] undefined
    hex 00 00 00 c0 80 e0 a0 b0 f0 a0 c0 20 e0 00 c0 c0 ; [$8a21] undefined
    hex 00 c0 00 27 1f 0b 0e 0f 07 07 07 18 01 06 05 05 ; [$8a31] undefined
    hex 05 01 07 c0 a0 a0 e0 a0 20 a0 20 00 c0 c0 00 c0 ; [$8a41] undefined
    hex c0 c0 c0 00 07 0f 1e 1f 1f 07 13 07 00 00 07 03 ; [$8a51] undefined
    hex 00 18 1c 40 80 80 00 00 00 00 00 80 00 00 80 80 ; [$8a61] undefined
    hex 00 00 00 21 1f 1f 1f 07 07 07 07 1e 03 01 0c 0d ; [$8a71] undefined
    hex 05 00 07 00 07 0d 1f 37 3f 3f 33 07 00 02 02 0a ; [$8a81] undefined
    hex 08 00 0c 10 18 08 0c 06 03 03 05 10 08 0c 04 04 ; [$8a91] undefined
    hex 05 02 05 80 80 c0 c0 60 60 30 38 80 c0 c0 60 60 ; [$8aa1] undefined
    hex 30 30 10 18 18 08 0c 06 03 03 05 18 08 0c 04 04 ; [$8ab1] undefined
    hex 05 02 05 00 00 00 00 01 01 00 00 00 00 00 00 00 ; [$8ac1] undefined
    hex 01 00 00 00 80 48 e8 48 74 ac 78 80 80 c8 48 64 ; [$8ad1] undefined
    hex 24 bc f8 38 18 08 0c 06 05 03 06 78 08 0c 04 04 ; [$8ae1] undefined
    hex 03 02 05 00 18 0c 06 03 01 00 00 00 18 1c 0e 07 ; [$8af1] undefined
    hex 03 01 00 00 00 00 00 00 80 c0 60 00 00 00 00 00 ; [$8b01] undefined
    hex 80 c0 e0 30 10 18 0c 06 03 07 03 70 38 0c 06 03 ; [$8b11] undefined
    hex 01 04 03 00 00 00 00 00 00 06 03 00 00 00 00 00 ; [$8b21] undefined
    hex 00 04 03 40 60 30 30 08 04 06 03 40 20 30 18 18 ; [$8b31] undefined
    hex 0c 06 01 40 64 36 33 0b 67 3f 1f 40 24 32 19 19 ; [$8b41] undefined
    hex 4d 26 19 00 00 60 38 0e 01 00 00 00 00 f0 78 1e ; [$8b51] undefined
    hex 07 01 00 00 00 00 00 00 00 7f 18 00 00 00 00 00 ; [$8b61] undefined
    hex 00 7c 07 00 00 00 38 1f 04 00 00 00 00 00 3c 1f ; [$8b71] undefined
    hex 03 00 00 00 00 00 00 00 c0 58 0b 00 00 00 00 00 ; [$8b81] undefined
    hex e0 3c 07 06 03 7d 17 02 01 0b 02 07 01 38 0f 01 ; [$8b91] undefined
    hex 00 1d 07 00 80 80 80 f0 dc 1f 02 00 80 80 c0 e0 ; [$8ba1] undefined
    hex b8 87 01 00 00 00 00 70 1b 0f 03 00 00 00 00 60 ; [$8bb1] undefined
    hex 3d 07 00 00 00 00 30 1f 03 00 00 00 00 00 38 0f ; [$8bc1] undefined
    hex 00 00 00 00 00 00 00 00 f0 7f 0d 00 00 00 00 80 ; [$8bd1] undefined
    hex f8 0e 03 f0 5f 1c 00 00 00 00 00 f8 3f 03 00 00 ; [$8be1] undefined
    hex 00 00 00 00 00 e1 fd 1f 03 01 00 00 80 f1 1e 03 ; [$8bf1] undefined
    hex 00 01 00 3c 42 19 a5 a5 19 42 3c 3c 7c fe fe fe ; [$8c01] undefined
    hex fe 7c 00 18 30 30 30 30 30 30 08 10 18 18 18 18 ; [$8c11] undefined
    hex 18 18 10 43 db 00 52 42 00 db c3 81 66 7e 3c 3c ; [$8c21] undefined
    hex 7e 66 81 00 24 7e 3c 3c 7e 24 00 00 42 00 10 00 ; [$8c31] undefined
    hex 00 42 00 02 06 04 0c 0c 0c 18 18 02 06 06 0c 0c ; [$8c41] undefined
    hex 1c 1c 1c 03 2d c9 88 c1 88 c2 7f 3d 7f 7f 7f 7f ; [$8c51] undefined
    hex 7f 3d 00 00 00 00 06 12 41 42 81 00 00 01 0f 3c ; [$8c61] undefined
    hex 70 61 c3 07 1a c9 48 00 e2 30 9c 00 3c f0 80 00 ; [$8c71] undefined
    hex 00 c0 e0 00 00 00 03 04 08 10 20 00 00 01 03 06 ; [$8c81] undefined
    hex 0c 18 31 0a 58 20 00 00 05 90 40 04 20 c0 00 00 ; [$8c91] undefined
    hex 1a 60 80 10 38 44 54 ba ba c6 7c 00 00 38 38 7c ; [$8ca1] undefined
    hex 7c 38 00 03 07 0f 0e 1e 1c 39 3b 03 07 0f 0f 1e ; [$8cb1] undefined
    hex 1c 3d 3b 00 0f f8 c0 00 3c f0 e0 00 7f f8 e0 80 ; [$8cc1] undefined
    hex 7e f8 e0 42 60 33 1d 0f 17 ff 1f 42 23 30 1b 17 ; [$8cd1] undefined
    hex 0f ec 6d 10 20 d0 60 b0 da dc d4 10 30 20 80 c0 ; [$8ce1] undefined
    hex e7 ee 68 68 a0 29 29 01 21 43 fe b4 fe fe fe fe ; [$8cf1] undefined
    hex fe bc 00 00 10 10 10 32 53 93 b3 18 14 14 14 14 ; [$8d01] undefined
    hex 34 74 74 00 00 00 00 00 80 e0 3a 00 00 00 00 00 ; [$8d11] undefined
    hex 00 00 c0 02 0d 3f 61 4c be 3f 7f 00 00 00 1e 3f ; [$8d21] undefined
    hex 7f ff ff 00 00 10 1c 10 18 10 1d 00 c0 a0 a0 a0 ; [$8d31] undefined
    hex a0 a0 a0 00 00 00 00 3c 47 99 bc 00 00 00 00 00 ; [$8d41] undefined
    hex 38 7e 7f 00 00 00 00 06 81 e1 3b 00 00 00 00 00 ; [$8d51] undefined
    hex 04 04 c4 00 00 0e 3f 7f 63 dc bf 00 00 00 00 00 ; [$8d61] undefined
    hex 1c 3f 7f 00 00 00 90 00 e1 fc 3a 00 00 00 00 00 ; [$8d71] undefined
    hex 00 00 c0 02 44 0f 10 a7 2f 5f 5f 23 66 40 cf df ; [$8d81] undefined
    hex 9f bf bf 00 00 16 c8 20 d0 cc e3 00 00 08 30 c0 ; [$8d91] undefined
    hex e0 f0 fc 10 10 38 28 44 54 44 38 00 00 00 10 38 ; [$8da1] undefined
    hex 38 38 00 33 33 27 26 64 44 40 40 3b 77 77 66 66 ; [$8db1] undefined
    hex 44 44 40 00 00 03 0f 3f 7c f9 e3 00 00 03 0f 3f ; [$8dc1] undefined
    hex 7e f9 f3 1f 17 08 0c 37 21 20 00 0e 0f 07 1b 18 ; [$8dd1] undefined
    hex 30 40 00 d8 98 30 e0 58 d8 84 00 60 e0 c0 10 b8 ; [$8de1] undefined
    hex 8c 84 80 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$8df1] undefined
    hex 00 00 00 70 fe ff f0 6e 6d 6b 26 78 ff ff ff f1 ; [$8e01] undefined
    hex 73 76 7d 00 00 80 e0 30 8c 76 e0 00 00 c0 e0 f8 ; [$8e11] undefined
    hex 7c ce 91 00 3c 7f 7f 78 77 36 35 00 00 00 00 07 ; [$8e21] undefined
    hex 0f 0f 0e 10 18 0f 0e 01 17 37 37 10 08 08 05 0f ; [$8e31] undefined
    hex 0f 0f fe 40 00 c4 34 c8 d0 f8 ec 40 c0 02 cc f8 ; [$8e41] undefined
    hex e0 26 b0 00 00 00 00 00 01 03 16 00 00 00 00 00 ; [$8e51] undefined
    hex 00 07 0f 00 00 00 00 1f f4 a0 00 00 00 00 00 0f ; [$8e61] undefined
    hex f8 c0 00 35 13 1b 0a 04 06 02 00 3b 3e 1c 0d 0e ; [$8e71] undefined
    hex 06 02 01 c0 80 00 00 00 00 00 00 20 40 80 00 00 ; [$8e81] undefined
    hex 00 00 00 33 1a 18 0d 05 06 03 01 0d 07 07 03 03 ; [$8e91] undefined
    hex 01 00 00 37 0b 00 14 3b 40 00 00 0e 07 0f 1b 30 ; [$8ea1] undefined
    hex 60 00 00 c8 98 3c f6 26 e0 60 20 70 e0 d8 0c c2 ; [$8eb1] undefined
    hex 40 60 20 00 00 80 e0 70 1c c6 9b 00 00 00 00 80 ; [$8ec1] undefined
    hex e0 78 fc 30 60 c0 80 00 00 00 00 e0 c0 80 00 00 ; [$8ed1] undefined
    hex 00 00 00 70 fe ff ff 78 70 73 33 78 ff ff ff f8 ; [$8ee1] undefined
    hex 70 73 73 00 00 80 e0 f0 3c 8e e1 00 00 c0 e0 f8 ; [$8ef1] undefined
    hex 3c 8e e1 3b 19 1d 0c 06 06 02 01 3b 39 1d 0c 0e ; [$8f01] undefined
    hex 06 02 01 f8 9c 86 c0 c0 60 20 00 f8 9c 86 c0 c0 ; [$8f11] undefined
    hex 60 20 00 00 10 18 fc fe fc 18 10 00 10 18 fc fe ; [$8f21] undefined
    hex fc 18 10 00 00 ff 7e 3c 18 00 00 00 00 ff 7e 3c ; [$8f31] undefined
    hex 18 00 00 00 00 18 3c 7e ff 00 00 00 00 18 3c 7e ; [$8f41] undefined
    hex ff 00 00 3c 66 66 0c 18 18 00 18 3c 66 66 0c 18 ; [$8f51] undefined
    hex 18 00 18 08 14 14 14 16 35 55 55 00 08 08 08 08 ; [$8f61] undefined
    hex 0a 2a 2a 00 00 00 00 00 80 60 50 00 00 00 00 00 ; [$8f71] undefined
    hex 00 80 a0 54 50 50 40 20 20 10 10 2b 2f 2f 3f 1f ; [$8f81] undefined
    hex 1f 0f 0f 50 10 10 10 10 10 20 20 a0 e0 e0 e0 e0 ; [$8f91] undefined
    hex e0 c0 c0 1c 38 38 1f 1f 2f 7e ff 3c 78 78 3c 03 ; [$8fa1] undefined
    hex 1e 38 7f 00 00 2e f8 e0 80 00 30 00 00 1e f0 80 ; [$8fb1] undefined
    hex 00 00 c0 05 0d 1a 12 09 04 1b 2c 03 06 0c 0c 06 ; [$8fc1] undefined
    hex 03 06 1f 30 80 00 00 80 00 80 6a c0 00 00 00 00 ; [$8fd1] undefined
    hex fc 00 80 00 00 00 00 00 00 00 ff 00 00 00 00 00 ; [$8fe1] undefined
    hex 00 00 00 fc c6 e6 e6 dc c0 c0 00 fc c6 e6 e6 dc ; [$8ff1] undefined
    hex c0 c0 00 00 00 1e 03 09 be 7e 7f 00 00 00 3c 7e ; [$9001] undefined
    hex 7f ff ff 00 00 00 e0 9a e0 38 5f 00 00 00 00 00 ; [$9011] undefined
    hex 00 c0 e0 7e 7f bc 15 03 1e 00 00 ff ff 7f 7e 3c ; [$9021] undefined
    hex 00 00 00 ac 7e f0 4c e0 00 00 00 f0 c0 00 00 00 ; [$9031] undefined
    hex 00 00 00 00 00 00 00 3f 43 9c be 00 00 00 00 00 ; [$9041] undefined
    hex 3c 7f 7f 00 00 00 00 00 80 e0 3c 00 00 00 00 00 ; [$9051] undefined
    hex 00 00 c0 00 15 2f 3d 58 31 67 33 00 00 00 02 07 ; [$9061] undefined
    hex 0f 1f 0f 05 47 1d b2 71 47 ef 0f 00 00 02 0f 0f ; [$9071] undefined
    hex 3f 1f 7f 05 0a 0d aa 1f 2b 1f 4f 16 57 3f 5f 7f ; [$9081] undefined
    hex 7f ff 3f 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$9091] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90a1] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90b1] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90c1] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90d1] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90e1] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$90f1] undefined
    hex 00 00 00 00 e0 d0 f8 c8 e8 c8 e8 00 40 60 60 70 ; [$9101] undefined
    hex 70 70 70 c8 e8 d0 e0 40 00 00 00 70 70 60 40 00 ; [$9111] undefined
    hex 00 00 00 00 40 e0 f0 d8 e8 c8 e8 00 00 40 60 60 ; [$9121] undefined
    hex 70 70 70 c8 e8 c8 f0 e0 40 00 00 70 70 70 60 40 ; [$9131] undefined
    hex 00 00 00 00 e0 d0 f8 c8 e8 c8 e8 00 40 60 60 70 ; [$9141] undefined
    hex 70 70 70 c8 e8 c8 e8 d0 f0 60 40 70 70 70 70 60 ; [$9151] undefined
    hex 60 40 00 00 38 60 c0 c4 cc f8 f8 00 20 40 80 80 ; [$9161] undefined
    hex 80 80 80 f8 78 f0 60 38 20 00 40 80 80 40 00 00 ; [$9171] undefined
    hex 00 00 00 00 38 60 c0 c4 cc f8 f8 00 20 40 80 80 ; [$9181] undefined
    hex 80 80 80 f8 f8 f0 e0 78 20 00 40 80 80 80 40 00 ; [$9191] undefined
    hex 00 00 00 30 78 60 c0 c4 cc f8 f8 30 60 c0 80 80 ; [$91a1] undefined
    hex 80 80 80 f8 f8 f0 e0 38 60 00 40 80 80 80 80 c0 ; [$91b1] undefined
    hex 40 00 00 c0 e0 c8 f4 f4 f4 f4 d4 00 c0 b0 38 18 ; [$91c1] undefined
    hex 18 58 68 f4 ec f8 f4 7c fc e0 e0 68 70 30 38 98 ; [$91d1] undefined
    hex 0c 00 00 c0 e0 c8 f4 f4 f4 f4 d4 00 c0 b0 38 18 ; [$91e1] undefined
    hex 58 d8 e8 f4 ec f8 f4 7c fc ec e0 68 70 30 38 98 ; [$91f1] undefined
    hex 1c 06 00 c0 e0 c8 f4 f4 f4 f4 d4 00 c0 b0 38 58 ; [$9201] undefined
    hex d8 d8 e8 f4 ec f8 f4 7c fc ec ee 68 70 30 38 98 ; [$9211] undefined
    hex 18 0c 06 3a 12 52 12 65 12 85 12 98 12 b1 12 cd ; [$9221] undefined
    hex 12 e9 12 07 13 2d 13 43 13 8a 8b 8c 8d 8e 8f 90 ; [$9231] undefined
    hex 91 92 93 96 94 95 98 97 60 9a 99 63 65 9b 9c 9d ; [$9241] undefined
    hex ff a8 a9 aa ab ac ad ae af 29 f1 63 cd f2 f3 f4 ; [$9251] undefined
    hex f5 b0 b1 ff 68 69 6a 6b 6c 6d 6e 6f 70 71 72 73 ; [$9261] undefined
    hex 74 75 76 77 7b 7a 79 7e 7c 7d 81 82 7f 83 84 78 ; [$9271] undefined
    hex 85 86 87 ff 51 52 53 54 55 56 57 58 ee 94 60 80 ; [$9281] undefined
    hex ef 63 cd 2a 88 89 ff e2 e3 b4 c2 a0 e4 e5 c6 a2 ; [$9291] undefined
    hex a3 ca ea e6 e7 eb ec e9 ce f0 cd db dc a6 e8 ff ; [$92a1] undefined
    hex 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25 29 27 28 2c ; [$92b1] undefined
    hex 2a 2b 2f 2d 2e 30 31 cd 32 33 26 ff 00 01 02 03 ; [$92c1] undefined
    hex 04 05 06 07 08 09 0a 0b 0c 0d 10 11 0e 0f ce 12 ; [$92d1] undefined
    hex 13 14 15 16 17 18 19 ff bf c0 c1 c2 c3 c4 c5 c6 ; [$92e1] undefined
    hex c7 c8 c9 ca cb cc d0 d1 44 45 10 11 46 47 ce 12 ; [$92f1] undefined
    hex 13 d2 d3 d4 d5 ff 36 37 38 39 3a 3b 3c 3d 3e 3f ; [$9301] undefined
    hex 4d 40 41 42 43 e1 5b 5c 5d 5e 66 e0 e6 ce 61 62 ; [$9311] undefined
    hex 64 cd e9 ee 4c 67 4e 4f 50 59 5a ff 9e 9f a0 a1 ; [$9321] undefined
    hex a2 a3 a4 a5 d6 d7 d8 d9 da cd db dc dd de df a6 ; [$9331] undefined
    hex a7 ff b2 b3 b4 c2 b5 b6 b7 b8 b9 ba bb bc cb cc ; [$9341] undefined
    hex d0 d1 1a 48 44 fa fb fc 2a cf 46 47 da fd 49 4a ; [$9351] undefined
    hex cd 34 fe db dc bd be d4 d5 ff 00 01 03 0a 0c 06 ; [$9361] undefined
    hex 1c 14 00 00 01 07 07 0c 08 39 08 36 44 00 00 00 ; [$9371] undefined
    hex 58 84 37 fd a3 98 7e ff 87 01 19 01 38 69 d1 6a ; [$9381] undefined
    hex 37 34 12 3a 13 12 7a b1 d8 db b8 7c 07 77 bc 4d ; [$9391] undefined
    hex 0d 77 47 83 80 78 eb cb f3 8b 5d 3c e3 dc 6a 43 ; [$93a1] undefined
    hex 42 26 80 02 00 1f bb b2 bd d9 9c 84 04 0e 1b 96 ; [$93b1] undefined
    hex 1c 1c 40 68 e8 e0 e6 6d eb eb 64 38 9b 9a 7a 3c ; [$93c1] undefined
    hex 1b 19 9b c7 e7 67 07 03 04 06 03 04 0b 0c 09 0f ; [$93d1] undefined
    hex 37 26 f7 f3 e0 ec de b0 0f 9f b3 54 b4 48 8c e5 ; [$93e1] undefined
    hex 90 08 cc 8f 0f 37 73 19 e5 f1 1e 1c 19 1d 3e 2c ; [$93f1] undefined
    hex 28 08 e1 e3 e7 e2 c0 d0 d0 f0 09 0a 04 04 01 01 ; [$9401] undefined
    hex 00 00 06 07 03 03 00 00 00 00 00 03 41 0c 88 c0 ; [$9411] undefined
    hex f0 ff bf bc be ff 7f 3f 0f 00 00 e2 22 08 08 1b ; [$9421] undefined
    hex 7f ff fd 1d 1d f7 f7 e4 80 00 18 10 30 60 c0 80 ; [$9431] undefined
    hex 80 80 e0 e0 c0 80 00 00 00 00 0a 21 90 90 48 a0 ; [$9441] undefined
    hex d0 e8 f5 fe 7f 7f bf df ef 77 bf 7f ff 7f 1f 0f ; [$9451] undefined
    hex 0f 1f 40 80 00 80 e1 f3 f7 ee 00 00 01 04 10 20 ; [$9461] undefined
    hex 40 00 00 00 00 03 0f 1f 3f 7f 00 47 0b 0b 05 02 ; [$9471] undefined
    hex 01 00 00 3a f7 f7 fb fd fe ff 5c 2c 9c 9c 04 98 ; [$9481] undefined
    hex 9c 18 bb db 6b 0b e3 69 0a e9 84 9c 18 84 9c 1f ; [$9491] undefined
    hex 0f 07 61 0a e9 63 0b ec f7 f8 b8 1c 67 47 14 0d ; [$94a1] undefined
    hex 0d 77 47 e3 f8 f8 63 83 f3 8b 5d 3c e3 c8 40 50 ; [$94b1] undefined
    hex 42 26 80 02 1c 3f 9e a1 bd d9 03 04 0b 0c 09 0f ; [$94c1] undefined
    hex 2a 00 f7 f3 e0 ec de b0 07 a0 b3 54 b4 48 8c f5 ; [$94d1] undefined
    hex a0 00 cc 8f 0f 37 73 09 f5 01 17 07 40 0d 88 c0 ; [$94e1] undefined
    hex f0 ff bf bf bf fe 7f 3f 0f 00 00 02 c2 e8 08 1b ; [$94f1] undefined
    hex 7f ff fd fd 3d 17 f7 e4 80 00 01 03 7f ff ff ff ; [$9501] undefined
    hex ff ff 03 0f 3f 7f ff ff ff 7f 01 01 01 03 02 06 ; [$9511] undefined
    hex 07 0f 00 03 07 07 0f 0f 0e 0d 7f bf fe 79 76 e8 ; [$9521] undefined
    hex de a0 80 ff ff fe f8 f7 e1 df e1 fc 68 74 ef c9 ; [$9531] undefined
    hex 00 07 1b ff ff 6f d8 36 ff f8 80 c0 40 40 60 a0 ; [$9541] undefined
    hex b0 f0 00 00 80 80 80 40 40 00 0d 1d 1d 0a 09 09 ; [$9551] undefined
    hex 09 0d 0a 0a 0a 1d 1d 1e 1e 1a e1 ed cf ce c0 98 ; [$9561] undefined
    hex 50 c0 90 8d b9 bf 3f 7f bf 3f 08 93 94 1a 06 00 ; [$9571] undefined
    hex 50 00 f7 60 65 eb ff ff ef df e0 a0 a0 a0 c0 c0 ; [$9581] undefined
    hex 80 80 00 40 40 40 00 00 00 00 0e 1f 1f 15 05 05 ; [$9591] undefined
    hex 02 00 1b 0b 09 0f 0e 06 03 01 80 a0 c0 a0 f8 7c ; [$95a1] undefined
    hex 36 b3 3f 1f 1f 4f 87 c3 69 0c 01 71 43 62 06 48 ; [$95b1] undefined
    hex 18 e0 fe 0e fc 9c f8 f2 e1 0c 01 91 03 42 06 48 ; [$95c1] undefined
    hex 18 e0 fe 0e 9c fc f8 f2 e1 0c f0 e4 e4 b0 ee ff ; [$95d1] undefined
    hex 3f c0 0f 1f 9f cf f1 ff ff ff e0 40 40 88 cd de ; [$95e1] undefined
    hex 9e 7e 00 a0 b0 70 f2 ef ff ff 00 00 00 00 00 07 ; [$95f1] undefined
    hex 3f ff 00 00 00 00 00 07 3f ff ff ff ff 7f bf 5f ; [$9601] undefined
    hex 6f 2f ff ff ff ff 7f bf 9f df be ff df ff ef ef ; [$9611] undefined
    hex f7 ff ff bf ff df ff ff ff f7 01 03 03 03 07 04 ; [$9621] undefined
    hex 00 00 01 03 07 04 00 03 07 07 37 17 13 13 13 17 ; [$9631] undefined
    hex 17 17 cf ef ef ef ef ef ef ef fb fd ff ff ff ff ; [$9641] undefined
    hex f9 ff ff ff fe ff fe fe fe f8 00 00 08 08 08 08 ; [$9651] undefined
    hex 00 08 07 07 07 07 07 07 0f 07 00 00 00 00 00 00 ; [$9661] undefined
    hex 00 08 0f 0f 0f 0f 0f 0f 0f 07 17 17 17 03 03 08 ; [$9671] undefined
    hex 00 00 ef ef ef ef ef e7 e7 e7 e0 f4 c7 c1 c0 98 ; [$9681] undefined
    hex 50 c0 9f 8f b0 b8 3f 7f bf 3f 08 18 1c 1c 00 00 ; [$9691] undefined
    hex 50 00 f7 e7 67 e3 f9 ff ef df ff ff ff ff ff e7 ; [$96a1] undefined
    hex 1f ff fe fe fe fe ff ff ff ff 00 00 00 00 00 00 ; [$96b1] undefined
    hex 00 00 1f 1f 1f 1f 3f 3f 3f 3f 00 00 00 00 00 02 ; [$96c1] undefined
    hex 07 0c 00 00 01 03 07 04 08 03 00 30 c0 04 43 82 ; [$96d1] undefined
    hex 00 40 3f ef ff fb b8 7c ff ff 3c 03 00 00 80 40 ; [$96e1] undefined
    hex 40 00 c0 fc ff ff 7f 3f 9f ef 00 00 80 40 20 20 ; [$96f1] undefined
    hex 10 10 00 00 00 80 c0 c0 e0 e0 08 06 04 08 11 2a ; [$9701] undefined
    hex 39 53 00 06 0c 06 0d 1b 1a 38 60 63 c2 c6 80 31 ; [$9711] undefined
    hex 9b c2 bc bb 7f fb ff ef 77 37 00 e0 b8 38 00 80 ; [$9721] undefined
    hex 80 00 3f df a7 27 ff ff ff ff 10 08 08 08 04 02 ; [$9731] undefined
    hex 0e 16 e0 f0 f0 f0 e0 dc b0 e0 42 43 44 6c 78 4a ; [$9741] undefined
    hex 55 55 3c 3c 39 11 05 3c 3b 3b b0 f8 88 88 0c 06 ; [$9751] undefined
    hex e3 82 07 07 f7 f7 f3 01 fc fd 2e 5c 74 60 c8 d8 ; [$9761] undefined
    hex e0 80 c0 80 88 98 30 20 00 00 54 43 45 4b 2a 28 ; [$9771] undefined
    hex 1c 07 3b 3c 3a 37 17 17 03 00 02 00 e0 10 00 00 ; [$9781] undefined
    hex 00 87 fd ff 1f ef ff ff ff 78 01 01 03 07 0e 1d ; [$9791] undefined
    hex 73 ef fe fe fc f8 f0 e0 80 00 8f 83 80 88 88 84 ; [$97a1] undefined
    hex 80 80 70 7c 7f 7f 7f 7f 7f 7f fc fc 3c 1c 0c 0c ; [$97b1] undefined
    hex 3e 0e 00 00 c0 e0 f0 f0 c0 f0 00 00 00 00 00 80 ; [$97c1] undefined
    hex e0 f8 ff ff ff ff 7f 9f e7 f8 0e 06 02 00 02 01 ; [$97d1] undefined
    hex 07 dc f0 f8 fc fe fc f9 e7 1f f6 f4 f0 f0 f0 f4 ; [$97e1] undefined
    hex fc f8 f0 f3 f7 f7 f7 f3 f3 fb 17 0b 0b 05 01 00 ; [$97f1] undefined
    hex 00 00 e7 f3 f3 f9 fd fe fe fe bf bf bf 7f 7f 7f ; [$9801] undefined
    hex ff ff ff bf bf 7f 7f 7f 7f ff 00 00 80 60 10 18 ; [$9811] undefined
    hex 08 0c 00 00 00 a0 d0 d8 e8 ec 80 80 00 00 00 80 ; [$9821] undefined
    hex 80 80 7f 7f ff ff ff 7f 7f 7f 00 00 04 04 08 30 ; [$9831] undefined
    hex e0 00 ff ff fb fb f7 cf 1f ff 08 01 08 08 11 2a ; [$9841] undefined
    hex 39 53 07 06 07 00 0d 1b 1a 38 63 60 c4 c1 80 31 ; [$9851] undefined
    hex 9b c2 bf bb 78 fe ff ef 77 37 00 00 00 38 00 80 ; [$9861] undefined
    hex 80 00 ff ff ff 07 ff ff ff ff 00 00 00 03 03 06 ; [$9871] undefined
    hex 05 0d 00 00 01 03 07 07 0f 0f 1f 73 ec db 56 b6 ; [$9881] undefined
    hex 7c 70 1e 7f ff ff ff fe fd fb 17 17 1f 3f 2f 24 ; [$9891] undefined
    hex 4b 78 1e 1d 13 2f 37 38 38 3b f9 fc fe ff 1f 05 ; [$98a1] undefined
    hex c0 80 77 fb fd fe 1e 64 d5 99 31 30 18 58 50 11 ; [$98b1] undefined
    hex 51 0f 7a 7d 7d 3d 7b 7b 7b 7b 1d f1 23 c1 00 9a ; [$98c1] undefined
    hex 3f 7f e3 0f d7 37 f1 e4 cf 9f 10 40 1b 59 0a 53 ; [$98d1] undefined
    hex 13 53 7b 7b 68 6c 74 3d 7d 7d 7f ff ff fc f8 f1 ; [$98e1] undefined
    hex cc 3b bf 7f 7f ff fc fb f7 c4 42 43 44 6d 78 4a ; [$98f1] undefined
    hex 57 55 3c 3c 39 10 04 3c 3a 3b b0 f8 88 08 0c 06 ; [$9901] undefined
    hex 13 c2 07 07 f7 f7 03 01 0c fd c9 07 0e 1c 18 38 ; [$9911] undefined
    hex 70 60 30 f7 ef de dd bd 7b 73 ff cf a7 40 bb 80 ; [$9921] undefined
    hex 60 30 00 70 78 bf 44 7f bf cf 9f ff ff bf 1f 06 ; [$9931] undefined
    hex 01 07 00 00 00 40 e0 f8 fd fb 80 f0 e0 9f 7f ff ; [$9941] undefined
    hex e0 c8 00 00 00 1f 7f ff f0 e7 e0 e0 c0 c0 c0 80 ; [$9951] undefined
    hex 80 80 f7 f7 ef ef ef df df df ab aa ce cb e2 f2 ; [$9961] undefined
    hex f9 fe 7f 7f 3f 3f 1f 8f 87 41 03 03 07 07 06 06 ; [$9971] undefined
    hex 06 06 fb fb f7 f7 f7 f7 f7 f7 80 00 00 00 00 00 ; [$9981] undefined
    hex 00 00 df bf bf 7f 7f 7f 7f 7f 73 fc 7e bf 3e 9f ; [$9991] undefined
    hex 5f ad 80 90 d9 cc ef f7 f3 72 08 00 04 00 00 02 ; [$99a1] undefined
    hex 00 00 f0 f8 f8 fc fc fc fe fe 4e 5f 4b 29 ae af ; [$99b1] undefined
    hex 5b 58 f5 f6 f6 f6 f5 f6 f6 f7 00 00 00 80 40 20 ; [$99c1] undefined
    hex f0 10 00 00 00 00 80 c0 00 e0 01 01 01 00 00 00 ; [$99d1] undefined
    hex 00 00 fe fe fe ff ff ff ff ff 01 03 01 07 07 07 ; [$99e1] undefined
    hex 0f 0f 00 01 03 03 02 02 06 06 b5 d5 fd b4 a0 30 ; [$99f1] undefined
    hex f0 b8 ff ff 87 79 7d fe 7f ff 63 47 84 06 02 03 ; [$9a01] undefined
    hex 01 01 fc f8 83 b8 7c fc fe fe 80 c0 c0 e0 60 30 ; [$9a11] undefined
    hex 30 70 00 00 00 00 80 40 40 00 0f 0f 0a 0b 1b 2f ; [$9a21] undefined
    hex 30 01 06 06 07 05 05 11 1e 1f 98 e0 81 b3 0c 76 ; [$9a31] undefined
    hex fb 4f ff 1f 0e c0 81 71 e9 c9 01 0f 70 07 11 66 ; [$9a41] undefined
    hex 4b 76 fe f0 80 80 80 86 9b 93 d0 90 90 10 94 78 ; [$9a51] undefined
    hex a4 2c 20 20 20 20 20 84 48 50 1b 13 1b 09 09 0c ; [$9a61] undefined
    hex 0c 04 07 0f 07 07 07 03 03 03 05 0f bb 09 0c 0a ; [$9a71] undefined
    hex 11 26 fb f3 c7 f3 f1 f4 ee d9 60 30 19 16 10 78 ; [$9a81] undefined
    hex 78 78 9f cf c6 c9 af 07 87 87 7c 6c 6c 6c 78 38 ; [$9a91] undefined
    hex 20 60 80 80 80 80 80 c0 c0 80 04 04 04 04 06 02 ; [$9aa1] undefined
    hex 03 01 03 03 03 03 01 01 00 00 01 17 2e 00 03 06 ; [$9ab1] undefined
    hex 03 04 e0 cf df ff fc f8 ff ff c8 80 00 00 c1 60 ; [$9ac1] undefined
    hex 00 00 07 f3 fb ff 3e 1f ff ff 60 60 e0 e0 60 60 ; [$9ad1] undefined
    hex 40 c0 80 80 00 00 80 80 80 00 98 e0 81 b3 0c 66 ; [$9ae1] undefined
    hex 8b 07 ff 1f 0e c0 f1 f9 71 81 00 00 c0 60 bc 5f ; [$9af1] undefined
    hex e7 f8 ff ff 3f 1f 03 80 c0 60 82 73 ef 4f 1a 3f ; [$9b01] undefined
    hex 7f bf 01 82 f6 f6 e7 c3 81 40 ff 0f 3f 00 00 00 ; [$9b11] undefined
    hex 00 00 00 ff ff ff ff ff ff ff b1 8c 87 00 00 60 ; [$9b21] undefined
    hex c0 c0 4e 73 78 ff ff ff ff ff f7 7f 1f 03 01 01 ; [$9b31] undefined
    hex 01 01 38 8c e0 fc fe fe fe fe 3f e9 f3 eb a7 4e ; [$9b41] undefined
    hex 8c 58 c0 1c 38 70 d0 a1 43 c7 07 0f b9 02 01 01 ; [$9b51] undefined
    hex 01 03 f8 f0 46 fd fe fe fe fc e7 f7 e7 f7 e7 e7 ; [$9b61] undefined
    hex f7 e5 f9 fb fb fb fb fb fb fb 99 59 99 58 9c 4c ; [$9b71] undefined
    hex ce d7 c7 87 47 c7 c3 83 01 40 c0 c0 c0 c0 c0 f0 ; [$9b81] undefined
    hex 3d 00 ff ff ff ff ff ff ff ff 9b 5d de 9f 5f 5e ; [$9b91] undefined
    hex 1c 1c c0 80 00 40 80 81 83 83 e0 fc ff e0 00 50 ; [$9ba1] undefined
    hex 00 00 1f 03 00 1f ff ff ff ff 01 0f 70 07 11 68 ; [$9bb1] undefined
    hex 40 60 fe f0 80 80 8e 9f 9e 81 11 20 28 0c 07 01 ; [$9bc1] undefined
    hex 0c 03 e0 c0 d0 ff ff fe f3 ff c8 04 1c 04 81 c0 ; [$9bd1] undefined
    hex 20 00 07 03 03 fb fe 3f df ff f9 fc fe ff 1f 85 ; [$9be1] undefined
    hex 00 00 77 fb fd fe 1e 64 f5 01 7f ff fe fb fc f0 ; [$9bf1] undefined
    hex cb 3b bf 7f 7f fc f8 f8 f7 c4 84 4a 22 39 2d 2f ; [$9c01] undefined
    hex 3d 30 94 52 6a 21 31 31 31 3b 01 0a 0b 65 81 66 ; [$9c11] undefined
    hex ef ea 41 49 68 0d 07 99 9c 9d 18 24 1c 01 04 17 ; [$9c21] undefined
    hex 2f 1f 3b 1d 0e 0e 00 0c 19 3b f5 7d 3c 07 92 fe ; [$9c31] undefined
    hex fc de cb e3 fb 78 00 ff ff f1 2b 1e 3f 2f 3c 2a ; [$9c41] undefined
    hex 2b 29 17 37 74 70 73 77 77 77 05 63 ca f4 0d 19 ; [$9c51] undefined
    hex e0 8a 82 24 cd fb f3 e7 17 f1 c0 cc 53 3e b1 96 ; [$9c61] undefined
    hex 07 50 01 28 b3 df ce e9 ef 8f da 74 fa fc 36 9c ; [$9c71] undefined
    hex 1a 1e ec ee 2e 0e ce ee ee ee 28 38 3f 5f 3f 7f ; [$9c81] undefined
    hex 5b 57 77 77 70 7b 7f 7f 7f 7f 1c fe ff ff fe ef ; [$9c91] undefined
    hex 99 50 ec 7f ff fe f9 f0 e7 ef 37 20 0e a4 76 74 ; [$9ca1] undefined
    hex d6 d2 6e 7f 77 7f af af 7f 7f 43 f7 ff ff df 57 ; [$9cb1] undefined
    hex 57 2f fc fb ff ff ff ff ff ff 00 00 00 01 06 0c ; [$9cc1] undefined
    hex 34 4a 00 00 00 00 01 0b 3b 77 4e ad af af bf 5e ; [$9cd1] undefined
    hex fe ff fb 7b 7d 7d 6b f5 55 02 be 56 ee af 6f d6 ; [$9ce1] undefined
    hex d6 ae e7 ef df de df ef ef df b1 9a c9 98 9d cc ; [$9cf1] undefined
    hex 99 98 cf e7 f7 e7 e3 f3 e7 e7 7d 6a 77 f5 f6 6b ; [$9d01] undefined
    hex 6b 75 e7 f7 fb 7b fb f7 f7 fb 7d 43 12 0c 0d 19 ; [$9d11] undefined
    hex e0 8a 82 fc e5 03 f3 e7 17 f1 de c8 40 20 b1 96 ; [$9d21] undefined
    hex 07 50 01 3f af d0 ce e9 ef 8f 1c fe ff ff fe e9 ; [$9d31] undefined
    hex 90 53 ec 7f ff fe f9 f0 e0 e7 00 00 00 00 00 04 ; [$9d41] undefined
    hex 04 14 00 00 00 01 03 0b 1b 2b 18 60 80 0f 00 1e ; [$9d51] undefined
    hex 61 0c 07 1f 7f f0 ff e1 9e f3 2a 58 6c 5c 7c 38 ; [$9d61] undefined
    hex 58 38 11 23 11 21 01 03 63 63 33 00 00 02 3c c0 ; [$9d71] undefined
    hex 32 02 cc ff fd c1 83 3f 7d fd 08 2c 14 14 15 0c ; [$9d81] undefined
    hex 0a 1f 53 43 63 23 23 33 31 00 06 22 4c 74 09 14 ; [$9d91] undefined
    hex 23 c4 81 61 cb fb f7 e3 c8 18 0d 1e 1f 1f 0f 0f ; [$9da1] undefined
    hex 0f 07 00 00 00 00 00 00 00 00 0f f8 f5 e0 e7 e0 ; [$9db1] undefined
    hex e0 fd 30 00 03 0f 08 0c 0e 00 06 42 04 05 09 14 ; [$9dc1] undefined
    hex 23 c4 f1 f9 73 8b f7 e3 c8 18 0f f8 f0 e5 e0 e7 ; [$9dd1] undefined
    hex e2 fc 30 00 00 0b 0f 08 0c 01 03 03 05 07 05 06 ; [$9de1] undefined
    hex 0f 06 00 00 02 00 02 01 00 08 f6 93 54 2b 6b ab ; [$9df1] undefined
    hex 9c c9 09 7f ff ff ff 7f 77 3f 13 1f 11 19 10 18 ; [$9e01] undefined
    hex 10 1c 0c 0c 0c 0c 0d 0d 0d 09 04 88 78 86 23 6a ; [$9e11] undefined
    hex 4e 1e 03 70 87 01 70 69 c9 e1 21 29 21 29 21 39 ; [$9e21] undefined
    hex 21 3d 1c 1c 1c 1c 1c 1c 1c 18 65 45 02 8d 46 43 ; [$9e31] undefined
    hex 01 07 fb fb f9 70 b8 bc fe f8 20 38 20 38 20 3a ; [$9e41] undefined
    hex 30 00 1e 1e 1e 1f 1f 1f 0f 1f 88 81 80 43 41 20 ; [$9e51] undefined
    hex 18 07 70 7f 7f 3c 3f 1f 47 60 04 88 6c 46 03 06 ; [$9e61] undefined
    hex 06 1e 03 70 f3 f9 fc 79 81 e1 88 84 81 40 43 20 ; [$9e71] undefined
    hex 18 07 70 78 7f 3f 3c 1f 47 60 00 00 00 00 01 02 ; [$9e81] undefined
    hex 01 07 00 00 00 00 00 01 03 03 00 10 66 bc d2 11 ; [$9e91] undefined
    hex a6 64 00 0f 19 70 e1 e7 cf 8f 00 08 b6 5d 2a 1d ; [$9ea1] undefined
    hex 3a 31 00 f0 c8 62 b1 d0 d4 ce 07 0b 0f 0f 1a 1f ; [$9eb1] undefined
    hex 0d 11 02 05 02 05 0f 32 06 0e 40 c0 c0 80 80 03 ; [$9ec1] undefined
    hex 02 10 9f 1f 1f 3f 3c 78 77 6f 00 00 20 0c 44 cf ; [$9ed1] undefined
    hex 4a 68 ff ff df b3 38 30 b7 b7 c0 c0 c0 c0 40 80 ; [$9ee1] undefined
    hex c0 40 00 00 00 00 00 00 00 80 10 1a 02 00 08 02 ; [$9ef1] undefined
    hex 02 0a 24 20 34 17 13 09 0d 05 31 06 6b 47 00 00 ; [$9f01] undefined
    hex 80 71 c1 fe f7 f8 ff ff 7f 8e 0a 0c 8b 23 1a f8 ; [$9f11] undefined
    hex 60 33 72 70 f3 f8 e1 01 83 c0 e0 e0 e0 60 60 c0 ; [$9f21] undefined
    hex c0 c0 00 00 00 80 80 00 00 00 38 04 60 43 00 00 ; [$9f31] undefined
    hex 80 71 c7 f3 f8 fc ff ff 7f 8e 08 0c 8b 23 1a f8 ; [$9f41] undefined
    hex 60 33 f7 73 70 f8 e1 01 83 c0 00 00 03 03 07 07 ; [$9f51] undefined
    hex 0f 0f 00 00 00 00 00 00 00 00 3f ff ff ff fe e2 ; [$9f61] undefined
    hex c8 88 00 00 00 00 00 00 1d 3f f0 fc fe bf 83 05 ; [$9f71] undefined
    hex 00 40 00 00 00 00 40 e8 fe bf 00 00 00 00 80 80 ; [$9f81] undefined
    hex c0 40 00 00 00 00 00 00 00 00 0f 1f 1f 1f 0f 27 ; [$9f91] undefined
    hex 13 09 00 00 00 00 00 10 38 2c 83 89 91 05 0a 0d ; [$9fa1] undefined
    hex 07 02 3c 30 26 68 72 74 7f 7f 00 04 83 c1 54 51 ; [$9fb1] undefined
    hex 57 cb 3b f8 78 30 a4 a1 a7 30 40 40 40 40 c0 c0 ; [$9fc1] undefined
    hex c0 c0 00 00 00 00 00 00 00 00 13 18 01 00 08 02 ; [$9fd1] undefined
    hex 02 0a 24 23 36 17 13 09 0d 05 87 20 00 80 41 31 ; [$9fe1] undefined
    hex 21 27 78 ff ff 7f be ce de d9 c3 c5 02 02 34 4c ; [$9ff1] undefined
    hex b3 1f 38 38 7c 7c 09 01 c0 e0 c0 60 60 60 60 c0 ; [$a001] undefined
    hex c0 c0 00 80 80 80 80 00 00 00 06 03 03 01 01 01 ; [$a011] undefined
    hex 00 00 01 00 00 00 00 00 00 00 00 08 09 88 00 60 ; [$a021] undefined
    hex 1a 83 ff f7 f6 77 7f 9f c5 60 ff ff ff ff ff ff ; [$a031] undefined
    hex ff ff ff ff ff ff ff ff ff ff 00 00 00 00 00 00 ; [$a041] undefined
    hex 00 00 ff ff ff ff ff ff ff ff f8 fc fc fe ff ff ; [$a051] undefined
    hex ff ff fb fd fd fe ff ff ff ff 41 f5 83 1e 27 33 ; [$a061] undefined
    hex 23 06 80 79 fc e0 d8 fc fc f8 80 f8 18 00 00 00 ; [$a071] undefined
    hex 00 00 00 f0 e0 00 00 00 00 00 83 89 91 04 06 00 ; [$a081] undefined
    hex 00 00 3c 30 26 6f 7f 77 78 7f 00 04 83 c0 50 55 ; [$a091] undefined
    hex 50 cb 3b f8 78 37 a7 22 a0 30 41 81 b3 06 3f 33 ; [$a0a1] undefined
    hex 23 06 80 03 fc f8 c0 fc fc f8 80 40 e0 18 10 00 ; [$a0b1] undefined
    hex 00 00 00 80 f0 20 00 00 00 00 07 00 00 00 00 00 ; [$a0c1] undefined
    hex 00 00 00 1f 7f ff ff ff ff ff f7 7b 3d 3e 3f 3f ; [$a0d1] undefined
    hex 3f 3f f0 70 38 bc bf bf bf bf ff ff ff 7f 9d e2 ; [$a0e1] undefined
    hex ff f9 00 00 00 00 00 80 c0 ff 00 00 00 00 02 00 ; [$a0f1] undefined
    hex 00 00 ff ff fb fd fc fe fe fe 7f 3f 3f 3f 7f 7f ; [$a101] undefined
    hex ff ff 7f 7f 7f 7f ff ff ff ff 00 00 04 08 13 24 ; [$a111] undefined
    hex 04 20 fd fd f9 f0 e4 cb db df ff ff ff ff 3f 4f ; [$a121] undefined
    hex 93 a0 ff ff ff ff 3f 8f 63 5c 85 25 80 00 00 80 ; [$a131] undefined
    hex fe 7f 7a da 7f ff ff 7f 01 00 02 24 84 04 00 02 ; [$a141] undefined
    hex 00 fc fd db 7b fb ff fd ff 03 3f 5f 0f 07 13 23 ; [$a151] undefined
    hex 01 01 3f 9f ef f7 eb db fd fd 40 40 41 01 01 03 ; [$a161] undefined
    hex 03 03 3e 3e 3d 7d 7d 7b 7b 7b 00 03 04 08 00 10 ; [$a171] undefined
    hex 20 20 00 00 03 07 0f 0f 1f 1f 00 00 03 04 03 04 ; [$a181] undefined
    hex 06 15 00 00 00 03 04 0b 18 28 1f f0 0d f0 1c e0 ; [$a191] undefined
    hex 00 0c 00 0f f2 0f e3 01 1e f3 03 38 06 01 00 40 ; [$a1a1] undefined
    hex 08 00 fc c7 f9 fe fd 81 07 7f c0 1c 60 80 06 13 ; [$a1b1] undefined
    hex 20 00 3f e3 9f 71 e0 8c 9f ff 06 02 f2 f9 fc fe ; [$a1c1] undefined
    hex ff ff 01 f1 f9 fc fe ff ff ff a0 41 00 03 81 60 ; [$a1d1] undefined
    hex 38 9f 40 bf ff fc 7f 1f 87 c0 a0 40 01 00 83 61 ; [$a1e1] undefined
    hex 38 9f 40 b8 ff ff 7c 1f 87 c0 cf e7 f3 f8 ff ff ; [$a1f1] undefined
    hex ff ff e0 f0 f8 fc ff ff ff ff 00 00 00 07 1f 3f ; [$a201] undefined
    hex 7f 7f 00 00 07 1f 3f 7f 7f ff e0 80 00 00 00 00 ; [$a211] undefined
    hex 00 00 e0 9f 7f ff ff ff ff ff ff 3b 1b 13 13 07 ; [$a221] undefined
    hex 07 07 ff 3b db d7 d7 ef ef ef 2f 2f 0f 5f 1f bf ; [$a231] undefined
    hex bf 3f df df df bf bf 7f 7f 7f 01 03 7f fe ff ff ; [$a241] undefined
    hex ff fb 03 0f 3f 7f fe fd fd 7d d3 f4 3b 80 f5 fa ; [$a251] undefined
    hex ff ff ff 5b e4 ff ff ff ff ff 0f 0f 0f 1f 1f 3f ; [$a261] undefined
    hex 3f 3f df df df bf bf 7f 7f 7f 28 28 3c f4 f9 fd ; [$a271] undefined
    hex fd ff 1e 1c 01 02 ea f4 f4 fa fe ff ff ff ff ff ; [$a281] undefined
    hex ff ff fa fd fe ff ff ff ff ff bd 2a 97 d5 e6 73 ; [$a291] undefined
    hex 79 7d 67 77 bb 5b ab d7 eb f5 7e 6b 74 f1 f8 6b ; [$a2a1] undefined
    hex 68 79 e2 f5 f8 7d f4 f7 f4 f5 7d 69 75 f5 f6 6b ; [$a2b1] undefined
    hex 6b 75 e5 f5 f9 79 f8 f7 f7 fb ff 1f 0f 07 07 03 ; [$a2c1] undefined
    hex 03 03 ff 1f ef f7 f7 fb fb fb 03 03 03 03 03 03 ; [$a2d1] undefined
    hex 07 07 fb fb fb fb fb fb f7 f7 0c 1e 3e fe ff ff ; [$a2e1] undefined
    hex ff ff ec de 3e fe ff ff ff ff 00 f0 fe ff ff ff ; [$a2f1] undefined
    hex ff ff 00 f0 fe ff ff ff ff ff fc fd 3c 1c 0c 0c ; [$a301] undefined
    hex 3e 0e 00 01 c1 e1 f1 f1 c0 f0 00 80 f0 fc fe ff ; [$a311] undefined
    hex 7f 7f 00 80 f0 fc fe ff ff ff 00 00 00 00 00 80 ; [$a321] undefined
    hex e0 f0 00 00 00 00 00 80 e0 f0 c0 80 80 00 00 00 ; [$a331] undefined
    hex 00 00 c0 b0 b8 78 7c 7c 7c 7e 00 00 00 00 00 00 ; [$a341] undefined
    hex 00 00 fe fe ff ff ff 7f 7f 7f 00 00 00 00 00 00 ; [$a351] undefined
    hex 00 00 00 00 00 00 00 00 00 00 fc 00 04 00 00 00 ; [$a361] undefined
    hex 00 00 0b 00 00 00 00 00 00 00 29 00 00 00 00 00 ; [$a371] undefined
    hex 00 00 7b 00 87 00 0a 00 00 00 cf 00 21 00 20 00 ; [$a381] undefined
    hex 00 00 5a 00 08 00 00 00 00 00 40 00 10 00 00 00 ; [$a391] undefined
    hex 00 00 e5 00 ff 00 04 00 00 00 76 00 00 00 00 00 ; [$a3a1] undefined
    hex 00 00 1a 00 04 00 00 00 00 00 08 00 00 00 00 00 ; [$a3b1] undefined
    hex 00 00 5f 00 f4 00 02 00 00 00 78 00 00 00 01 00 ; [$a3c1] undefined
    hex 00 00 2c 80 18 00 00 00 00 00 8a 00 00 00 00 00 ; [$a3d1] undefined
    hex 00 00 ce 00 28 00 02 00 00 00 4a 00 01 00 01 00 ; [$a3e1] undefined
    hex 00 00 01 00 00 00 02 00 00 00 00 00 00 00 00 00 ; [$a3f1] undefined
    hex 00 00 bf 00 a9 00 a5 00 00 00 ad 00 d2 00 80 00 ; [$a401] undefined
    hex 00 00 ac 00 21 00 00 00 00 80 aa 00 5b 00 00 00 ; [$a411] undefined
    hex 00 00 bf 00 f7 00 00 00 00 00 fb 00 23 00 80 00 ; [$a421] undefined
    hex 00 00 b3 00 0a 00 01 00 00 00 48 00 10 00 00 00 ; [$a431] undefined
    hex 00 00 8f 00 29 00 00 00 00 00 7f 00 f3 00 00 00 ; [$a441] undefined
    hex 00 00 a9 00 96 00 00 00 00 00 23 00 00 00 00 00 ; [$a451] undefined
    hex 00 00 ff 00 cf 00 00 00 00 00 63 00 73 00 00 00 ; [$a461] undefined
    hex 00 00 5b 00 01 00 00 00 00 00 09 00 01 00 10 00 ; [$a471] undefined
    hex 00 00 df 00 29 00 02 00 00 00 82 00 3d 00 00 00 ; [$a481] undefined
    hex 00 00 43 00 01 00 00 00 00 00 08 00 00 00 00 00 ; [$a491] undefined
    hex 00 00 cd 00 c3 00 40 00 00 00 c1 00 40 00 02 00 ; [$a4a1] undefined
    hex 00 00 08 00 00 00 00 00 00 00 10 00 00 00 10 00 ; [$a4b1] undefined
    hex 00 00 7f 00 22 00 00 00 00 00 69 00 f0 00 10 00 ; [$a4c1] undefined
    hex 00 00 04 00 00 00 80 00 00 00 08 00 00 00 00 00 ; [$a4d1] undefined
    hex 00 00 81 00 1f 00 82 00 00 00 48 00 41 00 14 00 ; [$a4e1] undefined
    hex 00 00 21 00 01 00 01 00 00 00 30 00 10 00 00 00 ; [$a4f1] undefined
    hex 00 00 f7 00 a8 00 00 00 00 00 6b 00 55 00 00 00 ; [$a501] undefined
    hex 00 00 b3 00 55 00 00 00 00 00 f0 10 48 00 00 00 ; [$a511] undefined
    hex 00 00 ff 00 ae 00 00 00 00 00 db 00 0d 00 00 00 ; [$a521] undefined
    hex 00 00 8f 00 95 00 80 00 00 00 6d 00 01 00 00 00 ; [$a531] undefined
    hex 00 00 ff 00 01 00 00 00 00 00 de 00 00 00 80 00 ; [$a541] undefined
    hex 00 00 5c 00 09 00 00 00 00 00 15 00 01 00 00 00 ; [$a551] undefined
    hex 00 00 fa 00 dd 00 00 00 00 00 cf 00 d2 00 20 00 ; [$a561] undefined
    hex 00 00 9d 00 01 00 80 00 00 00 15 00 22 00 00 00 ; [$a571] undefined
    hex 00 00 ff 00 29 00 01 00 00 00 fa 00 97 00 0a 00 ; [$a581] undefined
    hex 00 00 58 00 00 00 20 00 00 00 0c 00 00 00 00 00 ; [$a591] undefined
    hex 00 00 fd 00 28 00 04 00 00 00 1a 00 00 00 a1 00 ; [$a5a1] undefined
    hex 00 00 49 00 98 00 00 00 00 00 05 00 08 00 00 00 ; [$a5b1] undefined
    hex 00 00 be 00 18 00 00 00 00 00 6c 00 29 00 09 00 ; [$a5c1] undefined
    hex 00 00 41 00 48 00 00 00 00 00 2c 00 02 00 00 00 ; [$a5d1] undefined
    hex 00 00 d1 00 01 00 0b 00 00 00 7d 00 30 00 40 00 ; [$a5e1] undefined
    hex 00 00 84 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$a5f1] undefined
    hex 00 00 ff 00 af 00 40 00 00 00 d7 00 d9 00 00 00 ; [$a601] undefined
    hex 00 00 ff 00 64 00 00 00 00 00 0c 00 13 00 00 00 ; [$a611] undefined
    hex 00 00 7b 00 b4 00 00 00 00 00 25 00 07 00 00 00 ; [$a621] undefined
    hex 00 00 4d 00 a1 00 00 00 00 00 28 00 40 00 00 00 ; [$a631] undefined
    hex 00 00 ff 00 29 00 01 00 00 00 4d 00 09 00 00 00 ; [$a641] undefined
    hex 00 00 ab 00 01 00 80 00 00 00 09 00 84 00 00 00 ; [$a651] undefined
    hex 00 00 7f 00 6a 00 00 00 00 00 cf 00 00 00 20 00 ; [$a661] undefined
    hex 00 00 05 00 10 00 80 00 00 00 11 00 04 00 00 00 ; [$a671] undefined
    hex 00 00 89 00 4f 00 00 00 00 00 c1 00 90 00 20 00 ; [$a681] undefined
    hex 00 00 42 00 08 00 80 00 00 00 10 00 00 00 01 00 ; [$a691] undefined
    hex 00 00 7f 00 0a 00 40 00 00 00 1d 00 04 00 80 00 ; [$a6a1] undefined
    hex 00 00 13 00 04 00 00 00 00 00 64 00 00 00 00 00 ; [$a6b1] undefined
    hex 00 00 ce 00 43 00 01 00 00 00 3c 00 00 00 28 00 ; [$a6c1] undefined
    hex 00 00 40 00 40 00 00 00 00 00 40 00 40 00 00 00 ; [$a6d1] undefined
    hex 00 00 ea 00 00 00 04 00 00 00 36 00 00 00 00 00 ; [$a6e1] undefined
    hex 00 00 00 00 00 00 02 00 00 00 40 80 00 00 00 00 ; [$a6f1] undefined
    hex 00 00 9e 00 6f 00 80 00 00 00 fb 00 1c 00 00 00 ; [$a701] undefined
    hex 00 00 bf 00 c3 00 00 00 00 00 6b 00 19 00 00 00 ; [$a711] undefined
    hex 00 00 ba 00 5e 00 04 00 00 00 4e 00 51 00 00 00 ; [$a721] undefined
    hex 00 00 2e 00 38 00 00 00 00 00 08 00 10 00 00 00 ; [$a731] undefined
    hex 00 00 bf 00 af 00 08 00 00 00 fe 00 03 00 00 00 ; [$a741] undefined
    hex 00 00 c8 00 84 00 00 00 00 00 4f 80 00 00 00 00 ; [$a751] undefined
    hex 00 00 ff 00 8a 00 00 00 00 00 bc 00 21 00 00 00 ; [$a761] undefined
    hex 00 00 53 00 42 00 00 00 00 00 05 00 00 00 00 00 ; [$a771] undefined
    hex 00 00 df 00 0e 00 20 00 00 00 8d 00 07 00 00 00 ; [$a781] undefined
    hex 00 00 1a 00 0c 00 80 00 00 00 00 00 00 00 00 00 ; [$a791] undefined
    hex 00 00 2d 00 26 00 10 00 00 00 5e 00 b0 00 80 00 ; [$a7a1] undefined
    hex 00 00 26 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$a7b1] undefined
    hex 00 00 ed 00 50 00 0c 00 00 00 85 00 02 00 80 00 ; [$a7c1] undefined
    hex 00 00 1c 00 00 00 00 00 00 00 40 02 04 00 00 00 ; [$a7d1] undefined
    hex 00 00 ab 00 00 00 04 00 00 00 3d 00 00 00 00 00 ; [$a7e1] undefined
    hex 00 00 14 00 10 00 00 00 00 00 00 00 20 00 00 00 ; [$a7f1] undefined
    hex 00 00 5f 00 18 00 00 00 00 00 1f 00 7c 00 00 00 ; [$a801] undefined
    hex 00 00 3f 00 ae 00 00 00 00 00 9c 00 00 00 10 00 ; [$a811] undefined
    hex 00 00 fb 00 bc 00 00 00 00 00 4b 00 0f 00 00 00 ; [$a821] undefined
    hex 00 00 b7 00 34 00 00 00 00 00 18 00 14 00 00 00 ; [$a831] undefined
    hex 00 00 df 00 75 00 00 00 00 00 b2 00 58 00 00 00 ; [$a841] undefined
    hex 00 00 ba 00 07 00 02 00 00 00 90 00 30 00 00 00 ; [$a851] undefined
    hex 00 00 be 00 32 00 80 00 00 00 df 00 a8 00 00 00 ; [$a861] undefined
    hex 00 00 56 00 a1 00 00 00 00 00 00 00 00 00 00 00 ; [$a871] undefined
    hex 00 00 fd 00 23 00 00 00 00 00 e4 00 0c 00 00 00 ; [$a881] undefined
    hex 00 00 24 00 05 00 08 00 00 00 49 00 01 00 00 00 ; [$a891] undefined
    hex 00 00 51 00 b8 00 04 00 00 00 df 00 14 00 00 00 ; [$a8a1] undefined
    hex 00 00 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$a8b1] undefined
    hex 00 00 af 00 18 00 05 00 00 00 90 00 04 00 03 00 ; [$a8c1] undefined
    hex 00 00 81 00 02 00 00 00 00 00 54 08 04 00 00 00 ; [$a8d1] undefined
    hex 00 00 b2 00 00 00 00 00 00 00 a8 00 80 00 01 00 ; [$a8e1] undefined
    hex 00 00 11 00 00 00 02 00 00 00 00 c0 00 00 00 00 ; [$a8f1] undefined
    hex 00 00 ff 00 cd 00 10 00 00 00 fa 00 1d 00 00 00 ; [$a901] undefined
    hex 00 00 3f 00 4c 00 00 00 00 00 22 00 cc 00 00 00 ; [$a911] undefined
    hex 00 00 5f 00 cf 00 40 00 00 00 df 00 0a 00 00 00 ; [$a921] undefined
    hex 00 00 9d 00 71 00 00 00 00 00 86 80 00 00 00 00 ; [$a931] undefined
    hex 00 00 bf 00 c4 00 00 00 00 00 7b 00 ec 00 00 00 ; [$a941] undefined
    hex 00 00 48 00 81 00 00 00 00 00 8c 00 a4 00 00 00 ; [$a951] undefined
    hex 00 00 ff 00 3e 00 00 00 00 00 7f 00 b6 00 00 00 ; [$a961] undefined
    hex 00 00 4b 00 0d 00 01 00 00 00 0b 40 00 00 00 00 ; [$a971] undefined
    hex 00 00 9b 00 0b 00 01 00 00 00 8a 00 1b 00 24 00 ; [$a981] undefined
    hex 00 00 95 00 a4 00 02 00 00 00 84 00 00 00 00 00 ; [$a991] undefined
    hex 00 00 7f 00 db 00 18 00 00 00 cc 00 05 00 00 00 ; [$a9a1] undefined
    hex 00 00 05 00 08 00 60 00 00 00 00 00 00 00 82 00 ; [$a9b1] undefined
    hex 00 00 a2 00 5a 00 20 00 00 00 98 00 84 00 41 00 ; [$a9c1] undefined
    hex 00 00 04 00 40 00 20 00 00 00 42 00 00 00 00 00 ; [$a9d1] undefined
    hex 00 00 09 00 03 00 00 00 00 00 01 00 00 00 00 00 ; [$a9e1] undefined
    hex 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$a9f1] undefined
    hex 00 00 ff 00 bc 00 10 00 00 00 7b 00 24 00 00 00 ; [$aa01] undefined
    hex 00 00 5d 00 06 00 00 00 00 00 cc 00 00 00 00 00 ; [$aa11] undefined
    hex 00 00 df 00 a8 00 04 00 00 00 5f 00 aa 00 10 00 ; [$aa21] undefined
    hex 00 00 7c 00 d0 00 00 00 00 00 06 00 10 00 00 00 ; [$aa31] undefined
    hex 00 00 ff 00 f3 00 00 00 00 00 11 00 4c 00 00 00 ; [$aa41] undefined
    hex 00 00 76 00 80 00 00 00 00 00 15 40 00 00 00 00 ; [$aa51] undefined
    hex 00 00 cd 00 4c 00 00 00 00 00 7c 00 09 00 00 00 ; [$aa61] undefined
    hex 00 00 3f 00 c8 00 00 00 00 00 49 00 05 00 00 00 ; [$aa71] undefined
    hex 00 00 6d 00 30 00 12 00 00 00 76 00 8c 00 00 00 ; [$aa81] undefined
    hex 00 00 00 00 60 00 00 00 00 00 00 10 0a 00 00 00 ; [$aa91] undefined
    hex 00 00 5f 00 d8 00 00 00 00 00 2c 00 00 00 00 00 ; [$aaa1] undefined
    hex 00 00 12 00 80 00 00 00 00 00 04 00 00 00 00 00 ; [$aab1] undefined
    hex 00 00 f9 00 18 00 00 00 00 00 1f 00 00 00 00 00 ; [$aac1] undefined
    hex 00 00 31 00 c0 00 08 00 00 20 04 00 00 00 00 00 ; [$aad1] undefined
    hex 00 00 b7 00 41 00 10 00 00 00 da 00 80 00 40 00 ; [$aae1] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$aaf1] undefined
    hex 00 00 df 00 39 00 20 00 00 00 ae 00 58 00 00 00 ; [$ab01] undefined
    hex 00 00 f3 00 18 00 00 00 00 00 61 00 00 00 00 00 ; [$ab11] undefined
    hex 00 00 ff 00 bd 00 00 00 00 00 ff 00 3b 00 00 00 ; [$ab21] undefined
    hex 00 00 dc 00 f0 00 00 00 00 00 61 00 00 00 00 00 ; [$ab31] undefined
    hex 00 00 df 00 29 00 00 00 00 00 3d 00 1d 00 00 00 ; [$ab41] undefined
    hex 00 00 6c 00 5c 00 02 00 00 00 02 00 00 00 40 00 ; [$ab51] undefined
    hex 00 00 fe 00 16 00 38 00 00 00 66 00 29 00 20 00 ; [$ab61] undefined
    hex 00 00 fe 00 01 00 00 00 00 00 10 00 80 00 00 00 ; [$ab71] undefined
    hex 00 00 af 00 10 00 50 00 00 00 43 00 0c 00 00 00 ; [$ab81] undefined
    hex 00 00 02 00 40 00 00 00 00 00 00 00 80 00 00 00 ; [$ab91] undefined
    hex 00 00 06 00 2a 00 00 00 00 00 de 00 4a 00 c2 00 ; [$aba1] undefined
    hex 00 00 17 00 43 00 00 00 00 00 02 00 04 00 02 00 ; [$abb1] undefined
    hex 00 00 17 00 18 00 00 00 00 00 e7 00 d3 00 82 00 ; [$abc1] undefined
    hex 00 00 04 00 0c 00 00 00 00 00 00 00 00 00 00 00 ; [$abd1] undefined
    hex 00 00 6b 00 04 00 00 00 00 00 04 00 10 00 00 00 ; [$abe1] undefined
    hex 00 00 a0 00 00 00 20 00 00 00 00 00 00 00 00 00 ; [$abf1] undefined
    hex 00 00 ff 00 39 00 a0 00 00 00 6d 00 64 00 00 00 ; [$ac01] undefined
    hex 00 00 4c 00 54 00 00 00 00 00 44 00 02 00 00 00 ; [$ac11] undefined
    hex 00 00 bf 00 ae 00 00 00 00 00 f7 00 e6 00 40 00 ; [$ac21] undefined
    hex 00 00 f1 00 39 00 40 00 00 00 08 02 21 00 00 00 ; [$ac31] undefined
    hex 00 00 3f 00 5a 00 80 00 00 00 e5 00 80 00 00 00 ; [$ac41] undefined
    hex 00 00 c1 00 01 00 80 00 00 00 1a 00 01 00 00 00 ; [$ac51] undefined
    hex 00 00 9b 00 2c 00 08 00 00 00 bd 00 26 00 00 00 ; [$ac61] undefined
    hex 00 00 49 00 01 00 00 00 00 00 08 00 04 00 00 00 ; [$ac71] undefined
    hex 00 00 bf 00 68 00 02 00 00 00 4d 00 59 00 00 00 ; [$ac81] undefined
    hex 00 00 05 00 10 00 00 00 00 00 09 00 00 00 00 00 ; [$ac91] undefined
    hex 00 00 7f 00 0c 00 40 00 00 00 c8 00 10 00 00 00 ; [$aca1] undefined
    hex 00 00 00 00 80 00 04 00 00 00 65 00 00 00 00 00 ; [$acb1] undefined
    hex 00 00 f7 00 24 00 01 00 00 00 00 00 02 00 20 00 ; [$acc1] undefined
    hex 00 00 08 00 04 00 00 00 00 00 00 00 01 00 00 00 ; [$acd1] undefined
    hex 00 00 0b 00 80 00 57 00 00 00 04 00 02 00 80 00 ; [$ace1] undefined
    hex 00 00 2a 00 00 00 00 00 00 00 02 00 00 00 00 00 ; [$acf1] undefined
    hex 00 00 ff 00 4d 00 01 00 00 00 7d 00 44 00 00 00 ; [$ad01] undefined
    hex 00 00 b4 00 00 00 00 00 00 00 50 00 83 00 00 00 ; [$ad11] undefined
    hex 00 00 7b 00 72 00 00 00 00 00 92 00 05 00 00 00 ; [$ad21] undefined
    hex 00 00 ad 00 d3 00 40 00 00 00 3c 00 05 00 10 00 ; [$ad31] undefined
    hex 00 00 fe 00 59 00 00 00 00 00 5d 00 91 00 00 00 ; [$ad41] undefined
    hex 00 00 7a 00 00 00 80 00 00 00 3f 00 10 00 00 00 ; [$ad51] undefined
    hex 00 00 fe 00 f2 00 15 00 00 00 fe 00 dc 00 00 00 ; [$ad61] undefined
    hex 00 00 c0 00 34 00 00 00 00 00 04 00 08 00 00 00 ; [$ad71] undefined
    hex 00 00 39 00 4e 00 84 00 00 00 e3 00 10 00 00 00 ; [$ad81] undefined
    hex 00 00 0c 00 43 00 00 00 00 00 08 00 00 00 00 00 ; [$ad91] undefined
    hex 00 00 a7 00 c9 00 00 00 00 00 44 00 1b 00 01 00 ; [$ada1] undefined
    hex 00 00 aa 00 00 00 80 00 00 00 01 00 00 00 00 00 ; [$adb1] undefined
    hex 00 00 fb 00 d9 00 20 00 00 00 21 00 67 00 00 00 ; [$adc1] undefined
    hex 00 00 88 00 01 00 80 00 00 00 21 00 00 00 00 00 ; [$add1] undefined
    hex 00 00 51 00 24 00 0c 00 00 00 08 00 01 00 80 00 ; [$ade1] undefined
    hex 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$adf1] undefined
    hex 00 00 b7 00 cf 00 82 00 00 00 df 00 26 00 02 00 ; [$ae01] undefined
    hex 00 00 34 00 05 00 00 00 00 00 8c 00 20 00 00 00 ; [$ae11] undefined
    hex 00 00 ff 00 d7 00 00 00 00 00 7d 00 c3 00 00 00 ; [$ae21] undefined
    hex 00 00 89 00 00 00 00 00 00 00 19 00 05 00 00 00 ; [$ae31] undefined
    hex 00 00 ff 00 4a 00 00 00 00 00 7e 00 41 00 00 00 ; [$ae41] undefined
    hex 00 00 67 00 0a 00 00 00 00 00 8a 00 00 00 00 00 ; [$ae51] undefined
    hex 00 00 ff 00 b3 00 80 00 00 00 7d 00 6c 00 00 00 ; [$ae61] undefined
    hex 00 00 08 00 20 00 02 00 00 00 0a 00 04 00 80 00 ; [$ae71] undefined
    hex 00 00 fe 00 2f 00 41 00 00 00 c9 00 08 00 00 00 ; [$ae81] undefined
    hex 00 00 4a 00 c4 00 00 00 00 00 82 00 00 00 00 00 ; [$ae91] undefined
    hex 00 00 ff 00 30 00 40 00 00 00 cf 00 42 00 80 00 ; [$aea1] undefined
    hex 00 00 19 00 00 00 10 00 00 00 00 00 00 00 00 00 ; [$aeb1] undefined
    hex 00 00 a5 00 a3 00 00 00 00 00 47 00 28 00 00 00 ; [$aec1] undefined
    hex 00 00 53 00 01 00 00 00 00 00 00 00 00 00 00 00 ; [$aed1] undefined
    hex 00 00 72 00 8d 00 00 00 00 00 04 00 42 00 00 00 ; [$aee1] undefined
    hex 00 00 20 00 00 00 00 00 00 00 00 00 00 00 01 00 ; [$aef1] undefined
    hex 00 00 ff 00 9c 00 00 00 00 00 77 00 8b 00 00 00 ; [$af01] undefined
    hex 00 00 8d 00 10 00 00 00 00 00 11 08 14 00 00 00 ; [$af11] undefined
    hex 00 00 ff 00 d8 00 00 00 00 00 5f 00 c1 00 02 00 ; [$af21] undefined
    hex 00 00 52 08 00 00 00 00 00 00 06 00 04 00 00 00 ; [$af31] undefined
    hex 00 00 ff 00 85 00 01 00 00 00 67 00 6a 00 00 00 ; [$af41] undefined
    hex 00 00 63 00 14 00 00 00 00 00 86 00 41 00 00 00 ; [$af51] undefined
    hex 00 00 6f 00 73 00 00 00 00 00 1c 00 96 00 20 00 ; [$af61] undefined
    hex 00 00 38 00 a2 00 00 00 00 00 00 00 02 00 00 00 ; [$af71] undefined
    hex 00 00 6f 00 3a 00 a0 00 00 00 ac 00 00 00 04 00 ; [$af81] undefined
    hex 00 00 1d 20 00 00 80 00 00 00 00 04 00 00 00 00 ; [$af91] undefined
    hex 00 00 f5 00 3a 00 00 00 00 00 3b 00 00 00 80 00 ; [$afa1] undefined
    hex 00 00 78 00 20 00 80 00 00 40 02 00 00 00 00 00 ; [$afb1] undefined
    hex 00 00 7a 00 06 00 41 00 00 00 23 00 01 00 00 00 ; [$afc1] undefined
    hex 00 00 b0 00 82 00 80 00 00 00 44 82 00 00 00 00 ; [$afd1] undefined
    hex 00 00 f1 00 20 00 00 00 00 00 cd 00 02 00 80 00 ; [$afe1] undefined
    hex 00 00 e6 02 80 00 80 00 00 00 00 00 00 00 00 00 ; [$aff1] undefined
    hex ff 11 ff ff ff ba ff 00 ff be ff fd ff fb ff 00 ; [$b001] undefined
    hex ff 76 ff bf ff fe ff 00 ff ff ff ff ff ff bf 00 ; [$b011] undefined
    hex ff ad ff 9b ff 8f 9f 00 ff 31 ff fa ff f5 ff 00 ; [$b021] undefined
    hex ff d7 ff ff ff ef ee 00 ff 7b ff ff ff ff 3d 00 ; [$b031] undefined
    hex ff 76 ff f5 ff bb ff 00 ff be ff fe ff 8f ff 00 ; [$b041] undefined
    hex ff fe ff ef ff ff ff 00 ff f7 ff ef ff ff ae 00 ; [$b051] undefined
    hex ff 28 ff e5 ff bb ff 00 ff d0 ff f9 ff eb df 00 ; [$b061] undefined
    hex ff dd ff fd ff 3f db 00 ff bf ff ff ff bf df 00 ; [$b071] undefined
    hex ff f8 ff e4 ff ee ff 00 ff b5 ff bb ff f6 bf 00 ; [$b081] undefined
    hex ff fe ff df ff df 97 00 ff fb ff ff ff ff 45 00 ; [$b091] undefined
    hex ff 64 ff c3 ff 7f ff 00 ff 1a ff e6 ff f7 67 00 ; [$b0a1] undefined
    hex ff e6 ff fd ff be 7a 00 ff fd ff ff ff ff 84 00 ; [$b0b1] undefined
    hex ff cc ff c7 ff c7 fe 00 ff 60 ff fd ff fb bb 00 ; [$b0c1] undefined
    hex ff bf ff 7f ff ff 3f 00 ff ff ff ff ff ff 3f 00 ; [$b0d1] undefined
    hex ff 08 ff 78 ff c8 7f 00 ff 6b ff ef ff fd ed 00 ; [$b0e1] undefined
    hex ff 32 ff 7f ff fb da 00 ff fe ff ff ff ff f7 00 ; [$b0f1] undefined
    hex ff 31 ff 75 ff 7f ff 00 ff a2 ff cd ff ff df 00 ; [$b101] undefined
    hex ff b6 ff 5f ff ff df 00 ff ef ff ff ff 7f ff 00 ; [$b111] undefined
    hex ff 64 ff db ff 6f ff 00 ff e7 ff df ff ff ff 00 ; [$b121] undefined
    hex ff 8a ff ef ff ff ff 00 ff ee ff ff ff ff 7f 00 ; [$b131] undefined
    hex ff 70 ff fd ff ff ff 00 ff e4 ff fe ff fd ff 00 ; [$b141] undefined
    hex ff f8 ff 7f ff ff ff 00 ff ff ff ff ff ff f5 00 ; [$b151] undefined
    hex ff aa ff 3a ff d7 ff 00 ff 18 ff ff 7f df ef 00 ; [$b161] undefined
    hex ff 5b ff fd ff ff 7c 00 ff ff ff ff ff ef 9b 00 ; [$b171] undefined
    hex ff 18 ff df ff ab ff 00 ff d4 ff ff ff fe bf 00 ; [$b181] undefined
    hex ff 70 ff ff ff ff 4f 00 ff fb ff ff bf ff f5 00 ; [$b191] undefined
    hex ff 80 ff ec ff 0c df 00 ff c0 ff 7e ff 72 ff 00 ; [$b1a1] undefined
    hex ff fe ff ff ff ff ff 00 ff ff ff ff ff ff 7b 00 ; [$b1b1] undefined
    hex ff 1a ff 89 ff ac ff 00 ff ea ff df ff fb df 00 ; [$b1c1] undefined
    hex ff 7e ff fb ff f5 f7 00 ff f3 ff ff ff fe 69 00 ; [$b1d1] undefined
    hex ff 40 ff de ff ce ff 00 ff 67 ff be 7f eb fb 00 ; [$b1e1] undefined
    hex ff e7 ff f7 fe fe de 00 ff ee ff ff f3 ff 02 00 ; [$b1f1] undefined
    hex ff 66 ff eb ff de ff 00 ff cb ff eb ff ef 7f 00 ; [$b201] undefined
    hex ff af ff ff ff ff ff 00 ff f6 ff ff ff fd 7f 00 ; [$b211] undefined
    hex ff b4 ff ae ff 8d ff 00 ff cd ff ff ff fc f7 00 ; [$b221] undefined
    hex ff 7c ff fe ef ff 5b 00 ff ff ff ff ff ff ff 00 ; [$b231] undefined
    hex ff 80 ff dd ff 5e ff 00 ff ea ff 2f ff ff ff 00 ; [$b241] undefined
    hex ff dc ff ff ff fe 3f 00 ff ff ff ff ff fe e7 00 ; [$b251] undefined
    hex ff 64 ff af ff f1 ff 00 ff 4e ff fe ff ee ff 00 ; [$b261] undefined
    hex ff bb ff b7 ff ff fe 00 ff ff ff fc ff ff 7e 00 ; [$b271] undefined
    hex ff 08 ff a9 ff ed df 00 ff 6a ff fe ff fa fd 00 ; [$b281] undefined
    hex ff d4 ff ff ff ff ef 00 ff f6 ff ff ff ff e1 00 ; [$b291] undefined
    hex ff 80 ff d4 ff dd ff 00 ff ef ff fc ff fb ef 00 ; [$b2a1] undefined
    hex ff e2 ff ef ff ff 7c 00 ff ff ff fe 7f fd c7 00 ; [$b2b1] undefined
    hex ff 78 ff 5e ff f6 e7 00 ff e8 ff fd ff ef ff 00 ; [$b2c1] undefined
    hex ff ea ff ff ff b6 7f 00 ff ff bf fe ff ff 04 00 ; [$b2d1] undefined
    hex ff 80 ff f9 ff fd fe 00 ff 7a ff ff ff bb ff 00 ; [$b2e1] undefined
    hex ff fd ff ff ff ff de 00 ff 9b ff ff bf ff 1b 00 ; [$b2f1] undefined
    hex ff 31 ff f0 ff f6 ff 00 ff 91 ff ff ff ff f7 00 ; [$b301] undefined
    hex ff af ff bf ff 7f fe 00 ff ff ff ff ff ff d6 00 ; [$b311] undefined
    hex ff 02 ff aa ff f7 ff 00 ff b2 ff bf ff 7f ff 00 ; [$b321] undefined
    hex ff db ff ff ff ff ef 00 ff ff ff ff ff ff ff 00 ; [$b331] undefined
    hex ff c0 ff 54 ff dd fb 00 ff 6e ff bd ff ee ff 00 ; [$b341] undefined
    hex ff bf ff 7e ff ff eb 00 ff eb ff ff ff f7 ed 00 ; [$b351] undefined
    hex ff 28 ff be ff cd ff 00 ff 1b ff ff ff eb 7f 00 ; [$b361] undefined
    hex ff fd ff ff ff fd 37 00 ff ff ff ff ff ff fd 00 ; [$b371] undefined
    hex ff 24 ff bb ff bf ff 00 ff ec ff ff ff fd cf 00 ; [$b381] undefined
    hex ff 8f ff ff ff ed be 00 ff df ff ff ff ff f1 00 ; [$b391] undefined
    hex ff a0 ff 24 ff c4 ff 00 ff 29 ff ff ff fd df 00 ; [$b3a1] undefined
    hex ff da ff fb ff ff 7f 00 ff df ef ff ff ff 71 00 ; [$b3b1] undefined
    hex ff 92 ff dd ff d7 eb 00 ff b9 ff ef ff ff ff 00 ; [$b3c1] undefined
    hex ff ab ff ff ff ff f7 00 ff fb ff ff ff ff 3e 00 ; [$b3d1] undefined
    hex ff e0 ff 52 ff 3e ff 00 ff da ff fb bf ff bb 00 ; [$b3e1] undefined
    hex ff df ff ff ff 7e e9 00 ff f9 ff ff ff df 5f 00 ; [$b3f1] undefined
    hex ff e4 ff f8 ff 7b df 00 ff eb ff fe ff ff f7 00 ; [$b401] undefined
    hex ff fe ff ff ff ff ff 00 ff fe ff df ff ff df 00 ; [$b411] undefined
    hex ff ac ff b3 ff 9e ff 00 ff 5a ff 9f ff ff ff 00 ; [$b421] undefined
    hex ff ce ff fd ff fd bf 00 ff ff ff ff ff ff bf 00 ; [$b431] undefined
    hex ff 24 ff bd ff dd ff 00 ff 8a ff ff ff ff ff 00 ; [$b441] undefined
    hex ff fd ff ff ff fe cc 00 ff bd ff ff f7 ff 5b 00 ; [$b451] undefined
    hex ff 0a ff 6d ff 5a 9f 00 ff 9e ff 53 ff fa 4f 00 ; [$b461] undefined
    hex ff c4 ff ff ff fb 4f 00 ff ff ff ff ff ff b1 00 ; [$b471] undefined
    hex ff 8f ff 7d ff 64 ff 00 ff 62 ff 7f ff e3 7f 00 ; [$b481] undefined
    hex ff f3 ff ff ff ff ff 00 ff ff ff ff ff ff 09 00 ; [$b491] undefined
    hex ff 16 ff 4d ff 29 ff 00 ff 6e ff fb ff bb bf 00 ; [$b4a1] undefined
    hex ff df ff ff ff ef 6e 00 ff ff ff ff ff ff 81 00 ; [$b4b1] undefined
    hex ff 04 ff 0b ff e3 ff 00 ff b0 ff e6 ff fe ff 00 ; [$b4c1] undefined
    hex ff ec ff af ff ef ff 00 ff ff ff ff ff ff 38 00 ; [$b4d1] undefined
    hex ff a5 ff f3 ff 7f bf 00 ff 3f ff b7 fb ef 6f 00 ; [$b4e1] undefined
    hex ff de ff ff ff ff 67 00 ff ff ff fb f7 ff a2 00 ; [$b4f1] undefined
    hex ff f8 ff e7 ff ca bf 00 ff a0 ff ff ff fc ff 00 ; [$b501] undefined
    hex ff df ff fb ff ff f7 00 ff ff ff ff ff ff af 00 ; [$b511] undefined
    hex ff 06 ff b5 ff a7 ff 00 ff 56 ff f5 ff f7 6f 00 ; [$b521] undefined
    hex ff 5f ff ff ff f5 ff 00 ff bf ff ff ff ff f7 00 ; [$b531] undefined
    hex ff a0 ff 7e ff be ff 00 ff ea ff f7 ff 69 5e 00 ; [$b541] undefined
    hex ff db ff ff ff ff 7f 00 ff 57 ff ff ff ff 2f 00 ; [$b551] undefined
    hex ff 00 ff db ff a8 fe 00 ff be ff 7f ff bf fe 00 ; [$b561] undefined
    hex ff e5 ff ef ff df 7e 00 ff ff ff f7 ff ff f3 00 ; [$b571] undefined
    hex ff 02 ff f3 ff 60 7f 00 ff 97 ff fd ff ff dc 00 ; [$b581] undefined
    hex ff ff ff d7 ff bd ff 00 ff e7 ff ff ff fb 9c 00 ; [$b591] undefined
    hex ff 82 ff e7 ff d7 ff 00 ff 7d ff e7 ff f7 ff 00 ; [$b5a1] undefined
    hex ff 0a ff ff ff de 97 00 ff bf ff e7 ff ff 98 00 ; [$b5b1] undefined
    hex ff 07 ff 60 ff da ff 00 ff 88 ff fe ff fd ff 00 ; [$b5c1] undefined
    hex ff e7 ff fa ff ff ef 00 ff ff ff ff ff ff 6f 00 ; [$b5d1] undefined
    hex ff 21 ff fd ff fe fb 00 ff 90 ff fb ff 76 fe 00 ; [$b5e1] undefined
    hex ff e1 ff 7f ff fd 3f 00 ff ff ff ff ff f7 4e 00 ; [$b5f1] undefined
    hex ff 24 ff 1f ff 6d ef 00 ff af ff 7d ff e9 ff 00 ; [$b601] undefined
    hex ff 36 ff 7f ff ff b7 00 ff ff ff ff ff f7 ff 00 ; [$b611] undefined
    hex ff c3 ff ff ff ef ff 00 ff 98 ff 7f ff ff fe 00 ; [$b621] undefined
    hex ff aa ff fe ff fd ff 00 ff fe ff bf ff ff fb 00 ; [$b631] undefined
    hex ff 84 ff bf ff b7 ff 00 ff f7 ff ff ff 7b ff 00 ; [$b641] undefined
    hex ff bf ff ff ff ff 7b 00 fd fb ff ff ff ff 55 00 ; [$b651] undefined
    hex ff 68 ff e5 ff d8 ff 00 ff 03 ff ff ff 7e ff 00 ; [$b661] undefined
    hex ff bb ff fb ff fd 7b 00 ff fe ff ff ff ff ef 00 ; [$b671] undefined
    hex ff 80 ff e9 ff bb f7 00 ff 32 ff ed ff 4d fb 00 ; [$b681] undefined
    hex ff a5 ff df ff df 3f 00 ff ff ff ff 7f ff e4 00 ; [$b691] undefined
    hex ff 00 ff cd ff bb ff 00 ff c2 ff dd ff f7 7f 00 ; [$b6a1] undefined
    hex ff 46 ff fd ff bf 7f 00 ff fe ff fb ff ff 5b 00 ; [$b6b1] undefined
    hex ff a0 ff dc ff f4 ff 00 ff f9 ff c5 ff fb bf 00 ; [$b6c1] undefined
    hex ff ff ff fb ff f3 fe 00 ff ff 7f ff ff ff 60 00 ; [$b6d1] undefined
    hex ff 35 ff 81 ff f3 ff 00 ff c1 ff ff ff 7b 3f 00 ; [$b6e1] undefined
    hex ff fd ff ff ff ff 5e 00 ff fb ff ff ff ff 0d 00 ; [$b6f1] undefined
    hex ff 85 ff f8 ff b2 ff 00 ff f5 ff ff ff f7 ff 00 ; [$b701] undefined
    hex ff e9 ff ef ff ff ff 00 ff ed ff ff ff ff db 00 ; [$b711] undefined
    hex ff e8 ff fe ff f5 ff 00 ff a6 ff ff ff df ff 00 ; [$b721] undefined
    hex ff 6f ff f7 ff fd be 00 ff ff ff ff ff ff 6b 00 ; [$b731] undefined
    hex ff 86 ff 75 ff d8 ff 00 ff 28 ff f7 ff f9 ff 00 ; [$b741] undefined
    hex ff af ff ff ff f7 fd 00 ff fe ff fe ff ff f7 00 ; [$b751] undefined
    hex ff a0 ff a5 ff be bf 00 ff 95 ff bf ff af ff 00 ; [$b761] undefined
    hex ff 7d ff ff ff ef cb 00 ff fb ff ff ff fe be 00 ; [$b771] undefined
    hex ff 0a ff 5a ff b4 f7 00 ff 1b ff bd ff 79 ff 00 ; [$b781] undefined
    hex ff ff ff f7 ff ff cf 00 ff fe ff ff ff ff ed 00 ; [$b791] undefined
    hex ff 20 ff 23 ff d3 ff 00 ff bd ff ce ff ce ff 00 ; [$b7a1] undefined
    hex ff 37 ff ef ff ff ff 00 ff ff ff ff ff ff fb 00 ; [$b7b1] undefined
    hex ff 45 ff 5e ff 9f ff 00 ff f8 ff 75 ff ff ff 00 ; [$b7c1] undefined
    hex ff b1 ff ff ff ff b5 00 ff f7 ff df ff ff 17 00 ; [$b7d1] undefined
    hex ff c6 ff f0 ff 83 ff 00 ff f8 ff ef ff ef dd 00 ; [$b7e1] undefined
    hex ef ff ff ff ff ef df 00 ff ff ff ff ff ff 4e 00 ; [$b7f1] undefined
    hex ff 80 ff ff ff fe ff 00 ff d2 ff ff ff ef ef 00 ; [$b801] undefined
    hex ff af ff f6 ff ff ff 00 ff de ff fe ff ff f3 00 ; [$b811] undefined
    hex ff f0 ff 7d ff 66 fb 00 ff e6 ff e2 ff ff f7 00 ; [$b821] undefined
    hex ff df ff ff ff fe ff 00 ff d7 ff ff fb fd fe 00 ; [$b831] undefined
    hex ff 72 ff ed ff f7 ff 00 ff e8 ff be ff ff ff 00 ; [$b841] undefined
    hex ff c6 ff ff ff fd ee 00 ff ff ff fd bf f5 e1 00 ; [$b851] undefined
    hex ff ac ff 31 ff ee fd 00 ff 03 ff be ff ef 9e 00 ; [$b861] undefined
    hex ff f9 ff 7f ff df 5f 00 ff fd ff 7f ff fb fb 00 ; [$b871] undefined
    hex ff 48 ff 8c ff 70 df 00 ff 93 ff ff ff e7 ff 00 ; [$b881] undefined
    hex ff 75 ff ff ff ff ab 00 ff f5 ff ff f7 ff 40 00 ; [$b891] undefined
    hex ff 34 ff f3 ff f4 ff 00 ff ac ff ff ff ff bf 00 ; [$b8a1] undefined
    hex ff dd ff fa ff ef 32 00 ff ff ff fe ff ff 2a 00 ; [$b8b1] undefined
    hex ff 22 ff 68 ff b6 de 00 ff 0e ff 66 ff 72 ed 00 ; [$b8c1] undefined
    hex ff da ff fe ff fd df 00 ff ff ff fb fb ff 17 00 ; [$b8d1] undefined
    hex ff 30 ff b5 ff de 7f 00 ff 79 fb d7 ff db ee 00 ; [$b8e1] undefined
    hex ff f9 ff ff ff ff 5a 00 ff f7 ff ff ff ff 4f 00 ; [$b8f1] undefined
    hex ff fc ff 8c ff df ff 00 ff a1 ff f5 ff ef f7 00 ; [$b901] undefined
    hex ff 75 ff fa fb ff ff 00 ff 5f ff ff bf ff ff 00 ; [$b911] undefined
    hex ff 00 ff b2 ff 1e 7f 00 ff 53 ff ee ff df df 00 ; [$b921] undefined
    hex ff e9 ff fe ff ff d7 00 ff ff ff ff ff ff 7d 00 ; [$b931] undefined
    hex ff 80 ff fa ff ff ff 00 ff 6a ff 7e ff ff f7 00 ; [$b941] undefined
    hex ff fe ff db ff fe f7 00 ff fe ff ff ff ff 47 00 ; [$b951] undefined
    hex ff a7 ff 65 ff e5 ff 00 ff 50 ff ef ff ba fd 00 ; [$b961] undefined
    hex ff 7e ff fe ff ff ff 00 ff ff ff ff ff ff 0f 00 ; [$b971] undefined
    hex ff 4c ff e8 ff 32 ff 00 ff 11 ff fa ff 46 ff 00 ; [$b981] undefined
    hex ff 9d ff ff ff ff 3f 00 ff f7 ff ff ff ff 25 00 ; [$b991] undefined
    hex ff 92 ff f2 ff 9f ff 00 ff ce ff ed ff fa df 00 ; [$b9a1] undefined
    hex ff ac ff ff ff ff ff 00 ff fb ff fd ff df e4 00 ; [$b9b1] undefined
    hex ff b8 ff 7d ff 82 ff 00 ff f9 ff 77 ff fa fe 00 ; [$b9c1] undefined
    hex ff ba ff fe ff 7f 7f 00 ff df ff fb ff ff 27 00 ; [$b9d1] undefined
    hex ff 42 ff ca ff 4b ff 00 ff a4 ff ff ff fb 95 00 ; [$b9e1] undefined
    hex ff fc ff ff ff f7 fb 00 ff f7 ff ff ff ff 75 00 ; [$b9f1] undefined
    hex ff 8c ff bf ff dc f7 00 ff b4 ff fa ff df ff 00 ; [$ba01] undefined
    hex ff ca ff ff ff be df 00 ff f7 ff ff ff ff fe 00 ; [$ba11] undefined
    hex ff 93 ff 37 ff 91 fb 00 ff 6c ff df ff f7 ff 00 ; [$ba21] undefined
    hex ff 5e ff df ff ff f5 00 ff fa ff ff ff ff 97 00 ; [$ba31] undefined
    hex ff 04 ff dc ff 7c bb 00 ff ba ff de ff fc bf 00 ; [$ba41] undefined
    hex ff 32 ff bf ff ff cb 00 fd fe ff ff ff ff dd 00 ; [$ba51] undefined
    hex ff 8e ff 9d ff e5 df 00 ff fb ff fe ff df ff 00 ; [$ba61] undefined
    hex ff f7 ff fb ff df d7 00 ff ff ff ff ff ff f3 00 ; [$ba71] undefined
    hex ff b0 ff e7 ff 5c ff 00 ff df ff 9d ff ff ff 00 ; [$ba81] undefined
    hex ff cc ff ff ff ff ae 00 ff 5f ff ff df ff 6e 00 ; [$ba91] undefined
    hex ff 8c ff 5d ff f5 ff 00 ff 71 ff fe ff ff bf 00 ; [$baa1] undefined
    hex ff f7 ff ff ff af 6e 00 ff f1 ff ff ff ff 07 00 ; [$bab1] undefined
    hex ff 34 ff 2b ff fe ff 00 ff d8 ff fa ef fe ff 00 ; [$bac1] undefined
    hex ff f0 7f ff ff ff b9 00 ff fb ff bd ff ff 7e 00 ; [$bad1] undefined
    hex ff c2 ff 46 ff fb ff 00 ff f6 ff 87 ff fd 9e 00 ; [$bae1] undefined
    hex ff 7b ff ff ff ff 33 00 7f ff ff ff ff ff 93 00 ; [$baf1] undefined
    hex ff 84 ff ed ff 6d ff 00 ff b1 ff e7 ff 7f ff 00 ; [$bb01] undefined
    hex ff fa ff ef ff ff ff 00 ff ff ff ff ff ff b7 00 ; [$bb11] undefined
    hex ff 80 ff eb ff ff ff 00 ff d7 ff fd ff 7b fe 00 ; [$bb21] undefined
    hex ff ff ff ef ff bf df 00 ff 7f ff ff ff ff df 00 ; [$bb31] undefined
    hex ff b8 ff ed ff ad ff 00 ff 5d ff b7 ff bf bb 00 ; [$bb41] undefined
    hex ff de ff bf ff ff f9 00 ff fb ff ff ff ff 26 00 ; [$bb51] undefined
    hex ff e4 ff e7 ff a1 ff 00 ff b7 ff 3e ff ff 5f 00 ; [$bb61] undefined
    hex ff f4 ff fb ff 7f bd 00 ff df ff 5f ff ff f7 00 ; [$bb71] undefined
    hex ff 80 ff dd ff dc fe 00 ff db ff ff ff f7 ff 00 ; [$bb81] undefined
    hex ff ee ff ff ff ff 7d 00 ff ff ff ff ff ff dd 00 ; [$bb91] undefined
    hex ff 9a ff 51 ff cd ff 00 ff 12 ff ef ff ff fe 00 ; [$bba1] undefined
    hex ff 7e ff 3f ff df b7 00 ff ff ff ff ff fd e9 00 ; [$bbb1] undefined
    hex ff a3 ff e3 ff f4 ff 00 ff b0 ff fd ff fa ad 00 ; [$bbc1] undefined
    hex ff 7f ff ff ff fd 79 00 ff ff ff ff ff bf 89 00 ; [$bbd1] undefined
    hex ff ba ff e9 ff 80 ff 00 ff 74 ff ff ff 7b cf 00 ; [$bbe1] undefined
    hex ff df ff 7f ff ff b1 00 ff fd df ff bf ff 4b 00 ; [$bbf1] undefined
    hex ff ce ff 7e ff 29 bf 00 ff f7 ff ef ff ef df 00 ; [$bc01] undefined
    hex ff ef ff ff ff ff ef 00 ff de ff ff ff ff 6b 00 ; [$bc11] undefined
    hex ff 73 ff ef ff ff ff 00 ff a3 ff ff ff fe bd 00 ; [$bc21] undefined
    hex ff df ff f7 ff f5 bf 00 ff ff ff ff fe df 5f 00 ; [$bc31] undefined
    hex ff c1 ff 36 ff fd ff 00 ff d3 ff 7b ff bb 7f 00 ; [$bc41] undefined
    hex ff ca ff ff ff fe f7 00 ff ff ff ff ff ff 3f 00 ; [$bc51] undefined
    hex ff 14 ff ab ff bd b7 00 ff 7f ff ef ff fb f5 00 ; [$bc61] undefined
    hex ff bf ff ff ff 5f d7 00 ff ff ff ff ff ff 45 00 ; [$bc71] undefined
    hex ff 70 ff fa ff 67 ff 00 ff bb ff e9 ff ef bf 00 ; [$bc81] undefined
    hex ff 2d ff ef ff df bf 00 ff ca ff ff ff ff 78 00 ; [$bc91] undefined
    hex ff 4a ff 36 bf f1 ff 00 ff d4 ff ed ff 7b ff 00 ; [$bca1] undefined
    hex ff df ff fa ff ff 7e 00 ff ef ff ff f7 ff 25 00 ; [$bcb1] undefined
    hex ff 46 ff ac ff bb bf 00 ff 36 ff f7 ff df 7f 00 ; [$bcc1] undefined
    hex ff c1 ff bf ff ff fb 00 ff ef ff ff ff ff 2e 00 ; [$bcd1] undefined
    hex ff 02 ff 18 ff f5 fe 00 ff dd ff fc ff ff b7 00 ; [$bce1] undefined
    hex ff bf ff be ff 7f ea 00 ff fd ff ff ef ff 87 00 ; [$bcf1] undefined
    hex ff 02 ff fa ff dc ff 00 ff ea ff 7f ff f9 ff 00 ; [$bd01] undefined
    hex ff fa ff ff ff ff f7 00 ff ff ff ff ff ff bf 00 ; [$bd11] undefined
    hex ff 46 ff fb ff ff ff 00 ff 3d ff ef ff ff 7f 00 ; [$bd21] undefined
    hex ff be ff ff ff ff d5 00 ff ff ff ff ff ff 5b 00 ; [$bd31] undefined
    hex ff 62 ff aa ff bd fb 00 ff 8b ff ef ff ff ff 00 ; [$bd41] undefined
    hex ff f5 ff ff ff ff 5f 00 ff ff ff ff f7 ff 61 00 ; [$bd51] undefined
    hex ff 90 ff e2 ff ff ff 00 ff 87 ff cb ff 53 ff 00 ; [$bd61] undefined
    hex ff ec ff ff ff ff 7b 00 ff ff ff ff ff ff 53 00 ; [$bd71] undefined
    hex ff 01 ff 9c ff e2 ff 00 ff a8 ff fe ff de ef 00 ; [$bd81] undefined
    hex ff 57 ff fd ff fc fa 00 ff f7 ff ff ff ff 76 00 ; [$bd91] undefined
    hex ff 46 ff b0 ff 6e ff 00 ff 33 ff f3 ff fb fa 00 ; [$bda1] undefined
    hex ff f7 ff bf ff ff 9b 00 ff ff ff f7 ff ff 11 00 ; [$bdb1] undefined
    hex ff 44 ff a6 ff ca ff 00 ff f5 ff f2 ff ef df 00 ; [$bdc1] undefined
    hex ff dc ff ff ff fd bb 00 ff f7 ff ff ff ff 97 00 ; [$bdd1] undefined
    hex ff 75 ff 55 ff 1b 9f 00 ff 9f ff 7f ff 7f fb 00 ; [$bde1] undefined
    hex ff 3b ff f7 ff fd f7 00 fe ff ff ff ff ff c5 00 ; [$bdf1] undefined
    hex ff a5 ff 72 ff fa fe 00 ff 62 ff f9 ff ef 5f 00 ; [$be01] undefined
    hex ff 5c ff bf ff ef ff 00 ff ff ff ff ff fe ff 00 ; [$be11] undefined
    hex ff c0 ff 51 ff fe ff 00 ff b7 ff f6 ff ff ef 00 ; [$be21] undefined
    hex ff bb ff ff ff fd fb 00 ff f7 ff fd ff ff 3b 00 ; [$be31] undefined
    hex ff c4 ff 95 ff ad ff 00 ff ce ff f6 ff fa df 00 ; [$be41] undefined
    hex ff ef ff ff ff ff ef 00 ff f5 ff ff ff fd 02 00 ; [$be51] undefined
    hex ff d0 ff 4e ff 54 ff 00 ff ce ff ff ff f6 7f 00 ; [$be61] undefined
    hex ff ff ff ff ff 7b 5f 00 ff be ff ff df ff 5e 00 ; [$be71] undefined
    hex ff 41 ff b6 ff 3f ff 00 ff 71 ff ef ff 37 df 00 ; [$be81] undefined
    hex ff 23 ff f7 ff fe db 00 ff ff ff ff fb ff fd 00 ; [$be91] undefined
    hex ff 71 ff 1a ff 9d ff 00 ff 2d ff f7 ff fb ff 00 ; [$bea1] undefined
    hex ff fd ff ff ff fd 77 00 ff ff ff ff ff ff 2f 00 ; [$beb1] undefined
    hex ff 63 ff d1 ff 34 ff 00 ff d9 ff bf ff 5d 7f 00 ; [$bec1] undefined
    hex ff 3f ff fe ff db fe 00 ff 7d ff ff ff ff 4d 00 ; [$bed1] undefined
    hex ff c0 ff f4 ff fa ff 00 ff f6 ff f4 ff ef ef 00 ; [$bee1] undefined
    hex ff de ff f7 ff ef 0d 00 bf ff ff ff ff ff bc 00 ; [$bef1] undefined
    hex ff 86 ff dd ff af fd 00 ff 6d ff 79 ff ff ff 00 ; [$bf01] undefined
    hex ff f7 ff ff ff 7f ff 00 ff ff ff f7 ff ff 3f 00 ; [$bf11] undefined
    hex ff 14 ff fc ff ee 7f 00 ff 9a ff fc ff f7 ff 00 ; [$bf21] undefined
    hex ff d1 ff fb ff fb ff 00 ff ff ff ff ff ff e7 00 ; [$bf31] undefined
    hex ff 50 ff de ff d7 ff 00 ff 3a ff f7 ff ff ff 00 ; [$bf41] undefined
    hex ff ff ff 7f ff f9 f7 00 ff ff ff ff ff ff 5f 00 ; [$bf51] undefined
    hex ff 90 ff 67 ff b0 ff 00 ff 97 ff ff ff ff 7f 00 ; [$bf61] undefined
    hex ff 5f ff ff ff ff de 00 ff ef ff ff ff ff 3a 00 ; [$bf71] undefined
    hex ff 8c ff 7c ff f4 ff 00 ff e8 ff cc ff ff bf 00 ; [$bf81] undefined
    hex ff e7 ff ff ff bf fc 00 ff ff 7f ff ff ff 83 00 ; [$bf91] undefined
    hex ff 61 ff e6 ff 5c f7 00 ff 9b ff db ff bd fd 00 ; [$bfa1] undefined
    hex ff bd ff fe ff ff de 00 ff fd ff ff ff ff 7f 00 ; [$bfb1] undefined
    hex ff 70 ff ff ff d9 ff 00 ff ef ff fe ff ff 6d 00 ; [$bfc1] undefined
    hex ff fa ff fd ff 7e 2b 00 ff dd ff ff f7 ff 1d 00 ; [$bfd1] undefined
    hex ff 48 ff df ff e5 ff 00 ff 89 ff ff ff ff 8f 00 ; [$bfe1] undefined
    hex ff 7f ff 7d ff fe ff 00 ff ff f7 ff ff ff 19 ; [$bff1] undefined
