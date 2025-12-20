;============================================================================
; Faxanadu (U).nes
;
; PRG0 ($8000 - $bfff)
;============================================================================

    BASE $8000

ROMBankStart:                               ; [$8000]
    dw $0006                                ; Eolis
    dw $0429                                ; Forepaw

;
; XREFS:
;     Player_LoadArmorTile
;
USHORT_8004:                                ; [$8004]
    dw $389c                                ; Mascon

;
; XREFS:
;     ROMBankStart [$8000]
;
EOLIS_BLOCKS:                               ; [$8006]
    dw $0018                                ; EOLIS_BLOCKS_SCREEN_0
                                            ; [$8006]
    dw $0083                                ; EOLIS_BLOCKS_SCREEN+1
                                            ; [$8008]

;
; XREFS:
;     Player_LoadShieldTile
;
USHORT_800a:                                ; [$800a]
    dw $00f3                                ; EOLIS_BLOCKS_SCREEN_2
                                            ; [$800a]
    dw $0165                                ; EOLIS_BLOCKS_SCREEN_3
                                            ; [$800c]
    dw $01c9                                ; EOLIS_BLOCKS_SCREEN_4
                                            ; [$800e]
    dw $022b                                ; EOLIS_BLOCKS_SCREEN_5
                                            ; [$8010]
    dw $028e                                ; EOLIS_BLOCKS_SCREEN_6
                                            ; [$8012]
    dw $031f                                ; EOLIS_BLOCKS_SCREEN_7
                                            ; [$8014]
    dw $03bf                                ; EOLIS_BLOCKS_SCREEN_8
                                            ; [$8016]

;
; XREFS:
;     EOLIS_BLOCKS [$8006]
;
EOLIS_BLOCKS_SCREEN_0:                      ; [$8018]
    hex c0 40 00 00 00 00 00 00 33 41 00 00 0c d3 0f d5 ; [$8018] undefined
    hex b3 31 00 00 0c cf 45 d6 71 0c 3b 5a 40 03 34 4c ; [$8028] undefined
    hex 43 3f d4 36 97 54 40 03 33 75 9d 43 13 d1 15 43 ; [$8038] undefined
    hex 0c cb 72 fc 33 2c 75 3c 49 c7 15 c3 43 1a 41 c5 ; [$8048] undefined
    hex 95 c4 95 c1 c0 0c 18 15 d3 d5 d9 40 0c 14 35 e5 ; [$8058] undefined
    hex d3 95 d9 80 00 00 36 85 c1 00 03 67 ca 70 3c ab ; [$8068] undefined
    hex 08 ca 70 37 5f 40 03 3a c0 80 00    ; [$8078] undefined

EOLIS_BLOCKS_SCREEN_1:                      ; [$8083]
    hex c0 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$8083] undefined
    hex 00 d6 b3 fc 8c 35 a4 d6 75 0d 69 00 d5 35 3c 9b ; [$8093] undefined
    hex 22 c9 b5 4d 6f 43 d4 f1 2d 53 5b d0 c0 5c c5 cc ; [$80a3] undefined
    hex 5d 8f 20 74 47 63 c8 00 5c 88 1d 6f 27 71 27 5b ; [$80b3] undefined
    hex c9 c0 5d 53 4f d4 d7 12 74 f5 c4 b1 cc 48 57 4e ; [$80c3] undefined
    hex 5d 8f 1c 74 e7 63 c7 01 d7 f5 e7 64 d7 9c 53 37 ; [$80d3] undefined
    hex d7 b6 47 14 cd c0 ca c0 00 00 00 d2 00 00 00 00 ; [$80e3] undefined

;
; XREFS:
;     USHORT_800a [$800a]
;
EOLIS_BLOCKS_SCREEN_2:                      ; [$80f3]
    hex c0 40 32 8c 04 00 00 00 c3 f3 3d 59 00 00 00 da ; [$80f3] undefined
    hex b6 bd b1 00 00 0c d1 cf f2 3d 69 cd 10 00 0c cf ; [$8103] undefined
    hex 59 c8 c2 cc d0 35 9d 40 d0 cd 67 53 cc 72 2c c7 ; [$8113] undefined
    hex 54 b5 bd 0c 35 3c 48 c8 0d 4c d5 f5 59 36 3c 80 ; [$8123] undefined
    hex 14 c9 c4 c8 b4 d5 35 bc 9c 14 04 d5 34 fd 4d 1c ; [$8133] undefined
    hex 4b 1c c4 9d 3d 31 c4 74 e5 1c 72 9d 39 d2 0d 78 ; [$8143] undefined
    hex 76 4d 79 34 80 35 ed 91 ca c0 00 00 00 d2 00 00 ; [$8153] undefined
    db $00,$00                              ; [$8163] undefined

EOLIS_BLOCKS_SCREEN_3:                      ; [$8165]
    hex c0 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$8165] undefined
    hex 00 00 00 35 9c 8f 21 40 d0 c0 34 2d 0c 35 3c 99 ; [$8175] undefined
    hex d6 72 3c 87 43 c4 b2 73 44 c4 b2 73 44 c4 9c c5 ; [$8185] undefined
    hex d4 f3 17 63 40 00 1c 89 72 27 5b 71 e0 40 32 4d ; [$8195] undefined
    hex 3f 24 34 fc 91 cd 80 34 bd 33 48 1d 39 34 e5 cd ; [$81a5] undefined
    hex c0 00 1d 91 36 47 48 ce 00 03 2b 00 00 cf 00 0d ; [$81b5] undefined
    db $27,$48,$00,$00                      ; [$81c5] undefined

EOLIS_BLOCKS_SCREEN_4:                      ; [$81c9]
    hex c0 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$81c9] undefined
    hex 00 00 03 34 4c 43 5c d7 50 00 33 47 33 4c 45 5d ; [$81d9] undefined
    db $0c,$d8,$b6,$ed,$8b,$6e,$d8          ; [$81e9] undefined

;
; XREFS:
;     Screen_LoadUIPalette
;
DAT_81f0:                                   ; [$81f0]
    hex b4 a7 2c cb d5 5c 47 44 d1 c0 36 0d 85 cb b1 65 ; [$81f0] undefined
    hex 70 d7 12 c1 80 00 05 70 75 c1 40 00 05 73 60 d9 ; [$8200] undefined
    hex 80 00 0c e9 73 70 c0 c0 ca b0 8c a7 03 ca b0 8c ; [$8210] undefined
    hex d7 0e cf 73 80 c0 80 00 00 33 c0    ; [$8220] undefined

EOLIS_BLOCKS_SCREEN_5:                      ; [$822b]
    hex c0 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$822b] undefined
    hex 00 d4 35 a7 10 d7 35 d7 34 40 00 c8 17 11 57 33 ; [$823b] undefined
    hex 4c d1 00 c4 b5 4c 31 5c 33 2c 76 ed 29 d8 8d b8 ; [$824b] undefined
    hex c9 dc 69 5c b5 c5 b4 7d 83 0d d1 c0 c4 9c 19 5c ; [$825b] undefined
    hex 18 00 00 5c 59 5c 14 00 00 c2 40 5d 98 00 00 ce ; [$826b] undefined
    hex 00 c3 b3 dc a7 03 ca b0 8c a7 03 0c ab 29 c0 80 ; [$827b] undefined
    db $00,$00,$00                          ; [$828b] undefined

EOLIS_BLOCKS_SCREEN_6:                      ; [$828e]
    hex c0 43 34 c0 40 c3 f5 6c 04 30 fd 5b 01 03 33 40 ; [$828e] undefined
    hex d1 74 64 34 5d 19 cd 1d cb 44 dc dc d1 dc b7 34 ; [$829e] undefined
    hex 37 2d cd cc dd 67 50 d6 9c cd d6 75 ad 0f 42 d0 ; [$82ae] undefined
    hex f5 9d 69 c5 f7 1d 4f 12 d5 33 0c 5f 71 dd 35 4d ; [$82be] undefined
    hex c3 23 37 4d 53 43 cc 87 76 77 1c c8 5d bf 31 c8 ; [$82ce] undefined
    hex 97 5b c7 c7 75 71 9c 7c d4 d7 22 35 35 c8 07 12 ; [$82de] undefined
    hex 76 3c 80 55 15 c9 c5 75 bc 9c 5d 3f 24 d3 d5 cd ; [$82ee] undefined
    hex cd 79 d7 f1 4c dc 75 fd 39 d3 9d 7d c2 40 00 d7 ; [$82fe] undefined
    hex b5 4d 91 d9 35 e7 0a ce 00 00 00 00 d2 00 00 00 ; [$830e] undefined
    db $00                                  ; [$831e] undefined

EOLIS_BLOCKS_SCREEN_7:                      ; [$831f]
    hex c0 40 32 5c 6f 01 cc f0 1c 6f 01 c9 70 10 00 df ; [$831f] undefined
    hex 77 ec cd c5 dc cf 7d df 90 c6 dd f7 7e de f7 cc ; [$832f] undefined
    hex 5f 59 c8 f5 ac 5f 7b df 37 dd f9 cc dd ef 7c d6 ; [$833f] undefined
    hex 75 ad 40 03 59 de 77 bd f1 c5 f3 0d 67 50 dd 35 ; [$834f] undefined
    hex 4d 13 59 c8 f2 1d 13 74 75 bd 6b 30 5d 4f 76 d4 ; [$835f] undefined
    hex f5 9d 6b 53 dd 5d 67 5a 5d 53 71 71 97 75 77 4d ; [$836f] undefined
    hex 51 cc 5d d3 54 77 f7 19 75 b7 12 45 c8 9d 4f 79 ; [$837f] undefined
    hex 35 b7 5b 57 76 77 47 24 d3 f2 4d d3 54 55 5d 7b ; [$838f] undefined
    hex 12 45 d3 9d 4d 57 14 70 ac 24 de b5 ed 7d d9 1d ; [$839f] undefined
    hex 7b 5f dd f7 8c 24 73 80 00 00 00 d2 00 00 00 00 ; [$83af] undefined

EOLIS_BLOCKS_SCREEN_8:                      ; [$83bf]
    hex c0 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$83bf] undefined
    hex d0 f1 0c 3b 5a d0 b1 0d 73 5d 40 d0 f4 2d 0f 59 ; [$83cf] undefined
    hex c7 36 97 54 c8 31 15 d0 cd 0b 43 c8 03 11 d1 15 ; [$83df] undefined
    hex c7 15 c4 b1 cc 48 31 cc 49 c7 15 c9 d5 c7 37 57 ; [$83ef] undefined
    hex 44 77 55 55 c4 95 71 2c 70 21 d3 d5 c7 15 c4 a9 ; [$83ff] undefined
    hex 05 d3 95 cd d5 cd c0 03 7a cf b1 55 ca cc 3b 3d ; [$840f] undefined
    hex ca c0 00 07 5f d2 00 00 00 00       ; [$841f] undefined

FOREPAW_BLOCKS:                             ; [$8429]
    dw $04cf                                ; FOREPAW_BLOCKS_SCREEN_0_10_11_35_36
                                            ; [$8429]
    dw $0592                                ; FOREPAW_BLOCKS_SCREEN+1
                                            ; [$842b]
    dw $0650                                ; FOREPAW_BLOCKS_SCREEN_2
                                            ; [$842d]
    dw $0708                                ; FOREPAW_BLOCKS_SCREEN_3
                                            ; [$842f]
    dw $07c0                                ; FOREPAW_BLOCKS_SCREEN_4
                                            ; [$8431]
    dw $0872                                ; FOREPAW_BLOCKS_SCREEN_5
                                            ; [$8433]
    dw $0931                                ; FOREPAW_BLOCKS_SCREEN_6
                                            ; [$8435]
    dw $09dd                                ; FOREPAW_BLOCKS_SCREEN_7
                                            ; [$8437]
    dw $0aa7                                ; FOREPAW_BLOCKS_SCREEN_8
                                            ; [$8439]
    dw $0b58                                ; FOREPAW_BLOCKS_SCREEN_9
                                            ; [$843b]
    dw $04cf                                ; FOREPAW_BLOCKS_SCREEN_0_10_11_35_36
                                            ; [$843d]
    dw $04cf                                ; FOREPAW_BLOCKS_SCREEN_0_10_11_35_36
                                            ; [$843f]
    dw $0c05                                ; FOREPAW_BLOCKS_SCREEN_12
                                            ; [$8441]
    dw $0cb6                                ; FOREPAW_BLOCKS_SCREEN_13
                                            ; [$8443]
    dw $0d50                                ; FOREPAW_BLOCKS_SCREEN_14
                                            ; [$8445]
    dw $0e07                                ; FOREPAW_BLOCKS_SCREEN_15
                                            ; [$8447]
    dw $0ebe                                ; FOREPAW_BLOCKS_SCREEN_16
                                            ; [$8449]
    dw $0f5f                                ; FOREPAW_BLOCKS_SCREEN_17
                                            ; [$844b]
    dw $1004                                ; FOREPAW_BLOCKS_SCREEN_18
                                            ; [$844d]
    dw $10b4                                ; FOREPAW_BLOCKS_SCREEN_19
                                            ; [$844f]
    dw $114c                                ; FOREPAW_BLOCKS_SCREEN_20
                                            ; [$8451]
    dw $11ed                                ; FOREPAW_BLOCKS_SCREEN_21
                                            ; [$8453]
    dw $128e                                ; FOREPAW_BLOCKS_SCREEN_22
                                            ; [$8455]
    dw $1332                                ; FOREPAW_BLOCKS_SCREEN_23
                                            ; [$8457]
    dw $13ef                                ; FOREPAW_BLOCKS_SCREEN_24
                                            ; [$8459]
    dw $14a1                                ; FOREPAW_BLOCKS_SCREEN_25
                                            ; [$845b]
    dw $154d                                ; FOREPAW_BLOCKS_SCREEN_26
                                            ; [$845d]
    dw $15fd                                ; FOREPAW_BLOCKS_SCREEN_27
                                            ; [$845f]
    dw $16ae                                ; FOREPAW_BLOCKS_SCREEN_28
                                            ; [$8461]
    dw $1768                                ; FOREPAW_BLOCKS_SCREEN_29
                                            ; [$8463]
    dw $1825                                ; FOREPAW_BLOCKS_SCREEN_30
                                            ; [$8465]
    dw $18df                                ; FOREPAW_BLOCKS_SCREEN_31
                                            ; [$8467]
    dw $19a2                                ; FOREPAW_BLOCKS_SCREEN_32
                                            ; [$8469]
    dw $1a67                                ; FOREPAW_BLOCKS_SCREEN_33
                                            ; [$846b]
    dw $1b23                                ; FOREPAW_BLOCKS_SCREEN_34
                                            ; [$846d]
    dw $04cf                                ; FOREPAW_BLOCKS_SCREEN_0_10_11_35_36
                                            ; [$846f]
    dw $04cf                                ; FOREPAW_BLOCKS_SCREEN_0_10_11_35_36
                                            ; [$8471]
    dw $1bdd                                ; FOREPAW_BLOCKS_SCREEN_37
                                            ; [$8473]
    dw $1c9b                                ; FOREPAW_BLOCKS_SCREEN_38
                                            ; [$8475]
    dw $1d58                                ; FOREPAW_BLOCKS_SCREEN_39
                                            ; [$8477]
    dw $1e1c                                ; FOREPAW_BLOCKS_SCREEN_40
                                            ; [$8479]
    dw $1ee4                                ; FOREPAW_BLOCKS_SCREEN_41
                                            ; [$847b]
    dw $1f9d                                ; FOREPAW_BLOCKS_SCREEN_42
                                            ; [$847d]
    dw $2055                                ; FOREPAW_BLOCKS_SCREEN_43
                                            ; [$847f]
    dw $210c                                ; FOREPAW_BLOCKS_SCREEN_44
                                            ; [$8481]
    dw $21b3                                ; FOREPAW_BLOCKS_SCREEN_45
                                            ; [$8483]
    dw $225a                                ; FOREPAW_BLOCKS_SCREEN_46
                                            ; [$8485]
    dw $2305                                ; FOREPAW_BLOCKS_SCREEN_47
                                            ; [$8487]
    dw $23b6                                ; FOREPAW_BLOCKS_SCREEN_48
                                            ; [$8489]
    dw $245a                                ; FOREPAW_BLOCKS_SCREEN_49
                                            ; [$848b]
    dw $24f4                                ; FOREPAW_BLOCKS_SCREEN_50
                                            ; [$848d]
    dw $2595                                ; FOREPAW_BLOCKS_SCREEN_51
                                            ; [$848f]
    dw $2625                                ; FOREPAW_BLOCKS_SCREEN_52
                                            ; [$8491]
    dw $26d4                                ; FOREPAW_BLOCKS_SCREEN_53
                                            ; [$8493]
    dw $275b                                ; FOREPAW_BLOCKS_SCREEN_54
                                            ; [$8495]
    dw $27ef                                ; FOREPAW_BLOCKS_SCREEN_55
                                            ; [$8497]
    dw $288f                                ; FOREPAW_BLOCKS_SCREEN_56
                                            ; [$8499]
    dw $2940                                ; FOREPAW_BLOCKS_SCREEN_57
                                            ; [$849b]
    dw $29eb                                ; FOREPAW_BLOCKS_SCREEN_58
                                            ; [$849d]
    dw $2a92                                ; FOREPAW_BLOCKS_SCREEN_59
                                            ; [$849f]
    dw $2b14                                ; FOREPAW_BLOCKS_SCREEN_60
                                            ; [$84a1]
    dw $2b8b                                ; FOREPAW_BLOCKS_SCREEN_61
                                            ; [$84a3]
    dw $2c1d                                ; FOREPAW_BLOCKS_SCREEN_62
                                            ; [$84a5]
    dw $2cb3                                ; FOREPAW_BLOCKS_SCREEN_63
                                            ; [$84a7]
    dw $2d53                                ; FOREPAW_BLOCKS_SCREEN_64
                                            ; [$84a9]
    dw $2dff                                ; FOREPAW_BLOCKS_SCREEN_65
                                            ; [$84ab]
    dw $2e85                                ; FOREPAW_BLOCKS_SCREEN_66
                                            ; [$84ad]
    dw $2f13                                ; FOREPAW_BLOCKS_SCREEN_67
                                            ; [$84af]
    dw $2fa5                                ; FOREPAW_BLOCKS_SCREEN_68
                                            ; [$84b1]
    dw $304d                                ; FOREPAW_BLOCKS_SCREEN_69
                                            ; [$84b3]
    dw $30de                                ; FOREPAW_BLOCKS_SCREEN_70
                                            ; [$84b5]
    dw $3173                                ; FOREPAW_BLOCKS_SCREEN_71
                                            ; [$84b7]
    dw $3209                                ; FOREPAW_BLOCKS_SCREEN_72
                                            ; [$84b9]
    dw $32b0                                ; FOREPAW_BLOCKS_SCREEN_73
                                            ; [$84bb]
    dw $334a                                ; FOREPAW_BLOCKS_SCREEN_74
                                            ; [$84bd]
    dw $33df                                ; FOREPAW_BLOCKS_SCREEN_75
                                            ; [$84bf]
    dw $3471                                ; FOREPAW_BLOCKS_SCREEN_76
                                            ; [$84c1]
    dw $350e                                ; FOREPAW_BLOCKS_SCREEN_77
                                            ; [$84c3]
    dw $3599                                ; FOREPAW_BLOCKS_SCREEN_78
                                            ; [$84c5]
    dw $3620                                ; FOREPAW_BLOCKS_SCREEN_79
                                            ; [$84c7]
    dw $36bd                                ; FOREPAW_BLOCKS_SCREEN_80
                                            ; [$84c9]
    dw $375c                                ; FOREPAW_BLOCKS_SCREEN_81
                                            ; [$84cb]
    dw $37f7                                ; FOREPAW_BLOCKS_SCREEN_82
                                            ; [$84cd]

;
; XREFS:
;     FOREPAW_BLOCKS [$8429]
;
FOREPAW_BLOCKS_SCREEN_0_10_11_35_36:        ; [$84cf]
    hex c4 43 18 c1 34 1c 13 25 c1 34 0c 10 0c 30 70 4d ; [$84cf] undefined
    hex 07 40 d0 72 54 c6 32 8c 47 1a c3 34 00 c1 31 d7 ; [$84df] undefined
    hex 25 ce 72 63 11 32 3c 97 24 c2 70 4c 17 14 32 55 ; [$84ef] undefined
    hex c9 b0 e1 c8 f2 4c 24 d3 30 5c 95 c9 70 4c 33 26 ; [$84ff] undefined
    hex c3 b0 82 c9 34 53 4c d4 30 4c 9a ce 74 1c a3 20 ; [$850f] undefined
    hex 5c 3b 24 d3 f4 dd 28 d0 f2 6b 27 ca 1c 83 11 c2 ; [$851f] undefined
    hex 2c 77 1e d3 34 ac 9b 27 c9 b2 ec 33 2f d0 07 08 ; [$852f] undefined
    hex c3 b1 1c 93 25 c9 8c 45 c9 32 3c 17 28 d0 71 3c ; [$853f] undefined
    hex 9b 11 c8 f2 4c 63 26 c4 72 40 d4 32 75 72 6c b9 ; [$854f] undefined
    hex c9 32 8c 9e c9 34 4d 1b 45 72 5c 0d cb dc 1f 27 ; [$855f] undefined
    hex c7 72 6c 93 25 d1 75 0d 1f 4a 72 8c 14 c3 30 67 ; [$856f] undefined
    hex 04 03 05 c0 f0 50 00 57 2f c1 72 5c 7b 25 50 32 ; [$857f] undefined
    db $5d,$03,$03                          ; [$858f] undefined

FOREPAW_BLOCKS_SCREEN_1:                    ; [$8592]
    hex c4 43 18 c3 30 40 34 0c 10 c6 0c 13 0c 71 23 13 ; [$8592] undefined
    hex c1 5c 97 09 c2 b2 8c 25 cf cd 00 c4 b0 5d 07 05 ; [$85a2] undefined
    hex c1 32 5c 30 0d 33 24 ca 31 8c a3 14 c1 70 4c 4f ; [$85b2] undefined
    hex 25 c9 b0 cc 3b 11 c8 f1 1c 9f 28 c6 8c 95 c1 b1 ; [$85c2] undefined
    hex 8c 33 26 c3 b2 3c 93 25 32 8c 77 0c c6 1c 9a 5c ; [$85d2] undefined
    hex a3 20 c4 72 7d 3f 17 d1 74 4c 5e 32 6c a3 27 c1 ; [$85e2] undefined
    hex 70 ec 83 11 32 4d 24 d3 74 8d 43 27 c9 b2 ec 31 ; [$85f2] undefined
    hex c1 b1 87 08 c4 b1 34 57 25 b2 3c 9f 28 c1 71 2c ; [$8602] undefined
    hex 9b 11 54 d1 97 14 ac a0 c1 2c 11 c9 32 84 d1 d1 ; [$8612] undefined
    hex 2c 61 c2 f0 6c 4b 27 c7 70 43 05 30 cc 10 c2 f0 ; [$8622] undefined
    hex cc 10 c3 17 18 c4 f2 47 24 c0 f0 b7 1d ca 31 1c ; [$8632] undefined
    hex 60 70 4c 17 13 32 57 05 32 5c 17 25 43 03 ; [$8642] undefined

FOREPAW_BLOCKS_SCREEN_2:                    ; [$8650]
    hex c1 0c 17 14 c2 f0 4d 03 41 34 0c bc 30 bc bf 1a ; [$8650] undefined
    hex c4 70 5c 53 04 32 4c 04 23 28 c0 f0 cd 01 c4 b0 ; [$8660] undefined
    hex 4c 2f 13 c9 30 1c c3 32 c5 30 bc 13 24 c1 0c a3 ; [$8670] undefined
    hex 04 ca 31 8c 4f 1d c0 73 03 00 cc 1c 9e c6 8c 77 ; [$8680] undefined
    hex 1e 4c 32 c5 1c c9 cc b1 4b 0c c3 b1 cc 9b 25 72 ; [$8690] undefined
    hex 0b 20 c1 24 1c 97 11 c4 31 1c a3 27 4b 40 c4 74 ; [$86a0] undefined
    hex 18 32 5c 61 0c 31 47 11 c9 32 8c 79 c1 34 1d 03 ; [$86b0] undefined
    hex 04 c9 f2 3c 9f 28 0c 9f 24 c9 5c 94 c3 31 1c 63 ; [$86c0] undefined
    hex 28 c9 6c a0 0c 97 14 13 18 c4 b1 8c a3 14 30 40 ; [$86d0] undefined
    hex 34 1c 13 40 d0 70 47 13 ca 0c 50 c2 f0 cc 60 0c ; [$86e0] undefined
    hex 4b 18 c4 f2 4c 54 c0 f0 b7 0b ca 31 14 c3 13 13 ; [$86f0] undefined
    hex 32 54 c5 32 57 25 43 03             ; [$8700] undefined

FOREPAW_BLOCKS_SCREEN_3:                    ; [$8708]
    hex c0 f0 4c 17 04 c2 f0 4c 0c d0 74 0c 0c c1 30 bc ; [$8708] undefined
    hex 13 1a c3 30 5c 51 32 4b 01 c1 30 3d 07 28 b0 c7 ; [$8718] undefined
    hex 1d c1 70 4c 2f 13 c9 30 12 30 bb 04 30 57 03 71 ; [$8728] undefined
    hex 8c 4f 12 b0 b5 c2 cc 4e 4c 77 1e c2 f0 cc 4b 11 ; [$8738] undefined
    hex 2c 97 0b c3 0c 4a c2 f0 5c 9b 25 71 8c a3 20 c4 ; [$8748] undefined
    hex 31 2c 30 c4 4c 43 11 c7 70 6c a3 27 c3 31 2c 7b ; [$8758] undefined
    hex 13 c4 60 71 0c 93 1e c1 1c 31 71 dc 07 25 c9 f1 ; [$8768] undefined
    hex 20 c8 32 3c 4f 04 03 28 31 e4 b2 8c 77 13 c7 b1 ; [$8778] undefined
    hex 3c 63 03 05 c1 00 c5 13 1e c2 f0 cc 4b 13 c5 32 ; [$8788] undefined
    hex 57 05 c4 f1 20 c4 cc 10 c3 31 6c 43 11 c1 f0 cc ; [$8798] undefined
    hex 0f 06 71 87 18 72 4c 0f 13 80 70 4c 61 53 13 32 ; [$87a8] undefined
    hex 5c 56 31 4c 57 13 71 a9             ; [$87b8] undefined

FOREPAW_BLOCKS_SCREEN_4:                    ; [$87c0]
    hex c0 32 fc 1f 00 30 53 30 c3 30 53 04 d0 30 bc 13 ; [$87c0] undefined
    hex 05 cb f0 55 33 24 03 41 70 4c 4e b0 00 cc 73 01 ; [$87d0] undefined
    hex 32 5c 0f 0b 30 c7 03 cf 5c c0 4c ca c0 5c 4f 28 ; [$87e0] undefined
    hex c3 31 1c 63 0c 73 0c 10 83 01 c0 dc 9b 0c c4 71 ; [$87f0] undefined
    hex 8c 33 08 50 0c 07 25 c2 f0 cc 43 11 c6 32 6c 39 ; [$8800] undefined
    hex 73 57 32 31 43 03 5c 4b 24 ca 30 4d 07 04 c1 b2 ; [$8810] undefined
    hex 5a c0 47 25 c3 32 3c 83 26 c3 30 e3 11 71 3b 1e ; [$8820] undefined
    hex 72 5c 2d c8 32 4c 30 d0 30 83 23 cf 72 0b 28 c9 ; [$8830] undefined
    hex 72 6c 9f 13 32 8c 97 04 c3 9c 43 24 71 31 c9 b2 ; [$8840] undefined
    hex 3c 33 11 31 ac 9b 11 c4 03 26 c1 43 3f 0c 17 3d ; [$8850] undefined
    hex cf f0 5c fc 30 50 c1 8c ff 06 70 5c 1b 3f c1 ac ; [$8860] undefined
    db $18,$00                              ; [$8870] undefined

FOREPAW_BLOCKS_SCREEN_5:                    ; [$8872]
    hex c0 f0 bc 1f 05 31 1c 23 10 c4 70 4c 17 04 d0 30 ; [$8872] undefined
    hex 4c 2c cb f0 57 03 c1 10 c3 32 4c 0f 0b 0c 4d c4 ; [$8882] undefined
    hex f0 37 26 c4 72 4c 81 c9 32 55 30 c7 03 c4 72 7c ; [$8892] undefined
    hex 4f 25 b2 73 25 c2 cc a2 c3 31 1c 63 0c c4 31 2c ; [$88a2] undefined
    hex 97 26 c3 87 13 c3 07 0c c4 71 8c 33 08 c3 9c 4f ; [$88b2] undefined
    hex 20 70 8c 4a c9 b2 77 04 c6 30 40 0d 00 c1 31 07 ; [$88c2] undefined
    hex 40 c1 17 41 c5 5c 98 c4 71 dc 07 25 c9 f1 2c 63 ; [$88d2] undefined
    hex 04 c4 72 3c 4f 0c 32 6c 3b 11 c9 32 5c 9b 27 b2 ; [$88e2] undefined
    hex 8c 96 c7 72 5c 30 30 83 23 c9 72 6c 44 c4 f0 b0 ; [$88f2] undefined
    hex c9 41 c3 9c 43 24 c9 dc 1f 12 72 5c a0 0c 9b 11 ; [$8902] undefined
    hex c4 03 26 c1 47 3f c9 70 50 cf f0 53 08 30 50 c1 ; [$8912] undefined
    hex 87 25 c0 f2 fc 1b 3f c1 ac 13 23 c9 32 5c 18 ; [$8922] undefined

FOREPAW_BLOCKS_SCREEN_6:                    ; [$8931]
    hex c5 30 33 25 c9 b2 7c 0f 25 30 b3 28 c3 32 4c 13 ; [$8931] undefined
    hex 25 c4 f0 bc 07 26 c4 4c a3 26 c4 b2 8c 97 26 c9 ; [$8941] undefined
    hex 32 82 53 0c c8 f2 4c 9b 27 ca 32 5c 9b 27 ca 30 ; [$8951] undefined
    hex 34 c4 ac a0 c9 70 cc 77 1e c9 b2 7c a7 24 c9 70 ; [$8961] undefined
    hex 7b 05 72 5d 00 c1 34 0c 7b 14 d0 30 4d 03 09 c1 ; [$8971] undefined
    hex 1c 13 06 c9 f4 0b 09 0c 53 4f c5 f0 9d 3f 4a c5 ; [$8981] undefined
    hex dc 91 c3 31 2d 28 34 2d 14 34 2d 28 1c 95 c8 f2 ; [$8991] undefined
    hex 4d 27 4d d2 20 0d 27 4d d2 1c 14 c3 32 67 42 74 ; [$89a1] undefined
    hex 93 46 d2 07 42 73 0c 1b 18 c7 72 87 46 53 47 47 ; [$89b1] undefined
    hex 46 55 72 57 47 70 50 07 47 5c f7 05 00 0c 19 c1 ; [$89c1] undefined
    hex 9c 1b 05 00 0c 19 c1 90 00 c1 9c 19 ; [$89d1] undefined

FOREPAW_BLOCKS_SCREEN_7:                    ; [$89dd]
    hex c1 b0 3c 33 05 c6 32 4c 9b 11 c9 f2 8c 98 c4 71 ; [$89dd] undefined
    hex 2c 4f 20 c1 0c 17 41 c4 f2 5c 83 1d c9 2b 11 1c ; [$89ed] undefined
    hex 93 28 70 3b 03 c9 b2 7c a3 26 c9 f1 2b 20 32 4c ; [$89fd] undefined
    hex a0 c1 71 4c 2f 2f c8 23 0e 31 1c 4f 28 72 8c 1f ; [$8a0d] undefined
    hex 27 c1 b0 3c 97 04 b1 1c 3b 08 c4 32 4c a0 c9 70 ; [$8a1d] undefined
    hex 45 c1 72 53 0c b4 17 04 d0 30 4d 03 25 c0 c7 41 ; [$8a2d] undefined
    hex c1 93 20 c3 b1 1c 93 25 c0 70 bc 9b 27 85 c1 72 ; [$8a3d] undefined
    hex 83 13 c4 b2 3c 97 03 32 5c 83 24 71 47 13 c1 b2 ; [$8a4d] undefined
    hex 5c 9b 12 ca 0c 0f 01 c5 1c 2f 25 c5 0c a1 c1 72 ; [$8a5d] undefined
    hex 6c 48 70 3c 07 30 b0 3c 9f 14 b2 8c 2f 20 c1 b0 ; [$8a6d] undefined
    hex 74 c1 0d 03 04 d0 30 4d 03 28 c9 b1 2c 9d c1 1c ; [$8a7d] undefined
    hex 10 c4 f2 6c 9f 13 32 8c 33 04 00 c0 dc 48 0c 4f ; [$8a8d] undefined
    hex 0c c4 8c 83 24 c9 b2 8c 9b 0c       ; [$8a9d] undefined

FOREPAW_BLOCKS_SCREEN_8:                    ; [$8aa7]
    hex c4 72 4c 2f 18 c3 32 8c 53 32 c5 0c 33 12 c3 8c ; [$8aa7] undefined
    hex 4b 0c 5c 30 c4 54 30 b7 0e 04 c9 30 b7 11 c3 b1 ; [$8ab7] undefined
    hex 29 c2 f0 cc 38 31 0c 8f 24 c9 70 cc 4f 0e c2 2b ; [$8ac7] undefined
    hex 0b c3 31 1c 49 c4 0c 4b 13 72 6b 11 b2 3c 93 28 ; [$8ad7] undefined
    hex c4 6c 38 1c 9b 25 c9 b0 ec a3 20 c8 f2 4c 94 c3 ; [$8ae7] undefined
    hex 30 e3 11 0c 4b 27 c3 32 4c 9b 27 c9 40 5c 4b 28 ; [$8af7] undefined
    hex 4c 8f 24 c9 72 6c 3b 11 c4 b1 37 0c c3 8c 93 0c ; [$8b07] undefined
    hex c9 f2 3c 9f 28 c3 30 e1 5c 33 0e 32 4c 33 28 c9 ; [$8b17] undefined
    hex b1 0c 47 12 5c 93 26 c3 b1 1c 38 c9 32 57 26 c4 ; [$8b27] undefined
    hex 30 87 13 c8 f2 4c 9b 0e 32 e3 12 c4 f0 cc 3b 2e ; [$8b37] undefined
    hex c2 2b 2e c1 43 2f c1 40 03 2f c1 40 cb c0 00 00 ; [$8b47] undefined
    db $00                                  ; [$8b57] undefined

FOREPAW_BLOCKS_SCREEN_9:                    ; [$8b58]
    hex c4 72 4c 2f 18 c3 32 8c 53 32 c5 0c a3 20 c1 f0 ; [$8b58] undefined
    hex ec 13 0c 5c 30 c4 54 30 bc 94 9c 4b 05 c9 30 bc ; [$8b68] undefined
    hex 6b 11 c8 dc 0d c2 f0 cc 9f 28 ac 8f 06 c9 70 cc ; [$8b78] undefined
    hex 47 0e c9 30 33 07 c3 31 1c 4a 5c 49 70 40 51 c1 ; [$8b88] undefined
    hex 03 1d 4c 9b 05 c9 b0 ec a3 24 c0 cc 11 c3 30 ec ; [$8b98] undefined
    hex 45 45 c3 32 4c 9b 27 c9 45 5c 4b 24 72 8c 1f 06 ; [$8ba8] undefined
    hex c9 72 6c 3b 11 c4 b1 39 c3 b1 1c 93 25 ca b2 b5 ; [$8bb8] undefined
    hex c3 30 e1 5c 33 0e 32 4c 33 28 ce b3 bc 2f 05 5c ; [$8bc8] undefined
    hex 93 26 c3 b1 1c 38 c9 32 57 26 ca b2 bc 97 80 c8 ; [$8bd8] undefined
    hex f2 4c 9b 0e 32 e3 12 c4 f0 cc 3b 2e ce b3 b5 c1 ; [$8be8] undefined
    hex 43 2f c1 40 03 2f c1 40 cb c0 00 00 00 ; [$8bf8] undefined

FOREPAW_BLOCKS_SCREEN_12:                   ; [$8c05]
    hex c1 32 4c 2f 18 c3 30 4c 14 c1 32 5c 33 12 c3 30 ; [$8c05] undefined
    hex ec 33 04 c1 5c 30 c9 30 5c a3 25 a3 05 30 4c 4a ; [$8c15] undefined
    hex 70 bc 13 05 30 4c 97 14 2c 97 27 ca 29 70 cc bf ; [$8c25] undefined
    hex 23 c9 32 5c 53 30 44 c0 69 c1 34 1c 13 25 c5 33 ; [$8c35] undefined
    hex 0c c8 0b 32 c0 f2 5c 1b 25 70 3c 07 14 cc 30 00 ; [$8c45] undefined
    hex 17 03 c9 70 bc 17 04 c5 30 7c 53 07 cc 80 31 4c ; [$8c55] undefined
    hex 97 28 c3 0c 8e c0 5c 15 c0 f1 43 01 c0 f2 5c a3 ; [$8c65] undefined
    hex 0c c4 72 3c 9d 70 3c 19 c9 71 3c 94 0c 33 11 31 ; [$8c75] undefined
    hex 3c 45 e0 25 c9 b1 1c 9c c9 32 67 27 c4 f0 cc 49 ; [$8c85] undefined
    hex 55 c3 b2 ec 93 25 32 83 13 1c 93 04 81 c1 4c 07 ; [$8c95] undefined
    hex 04 70 4c 4f 25 c1 32 4c a1 cb c1 c1 85 5c 94 72 ; [$8ca5] undefined
    db $55                                  ; [$8cb5] undefined

FOREPAW_BLOCKS_SCREEN_13:                   ; [$8cb6]
    hex c4 b2 4c 2f 04 c3 30 5c 10 0c 14 30 4c 30 70 4c ; [$8cb6] undefined
    hex 17 0c b1 2c 19 c4 70 8c 3b 13 c2 72 6c 17 04 72 ; [$8cc6] undefined
    hex 7c 9b 08 c3 97 0e c8 30 e3 23 c3 32 4c 0d 70 5c ; [$8cd6] undefined
    hex 38 c4 b2 5c 13 24 c9 6c 8f 24 34 f7 06 8c 48 c9 ; [$8ce6] undefined
    hex 31 43 32 c5 2c 93 4f d3 74 57 05 32 33 25 cc 30 ; [$8cf6] undefined
    hex 00 5c e7 49 74 87 25 c8 0c 93 32 00 73 9c 31 d0 ; [$8d06] undefined
    hex 97 05 c1 32 4c 1f 14 03 39 32 55 d1 97 06 a7 04 ; [$8d16] undefined
    hex c1 40 30 4c 45 d1 d5 c1 33 04 00 0b 05 03 04 c1 ; [$8d26] undefined
    hex 50 c5 00 10 07 1d 71 40 30 37 03 70 3c 50 70 51 ; [$8d36] undefined
    hex cb f0 30 0c 05 c9 5c 97 41 50       ; [$8d46] undefined

FOREPAW_BLOCKS_SCREEN_14:                   ; [$8d50]
    hex c4 b0 50 c0 70 5c 13 0c 30 4c 14 0c 13 05 c1 1c ; [$8d50] undefined
    hex 07 0b 30 ca 30 5c 98 c9 f2 6c 3a b0 1c 2c c3 31 ; [$8d60] undefined
    hex 2c 22 32 6c 3b 23 c3 32 4c 0d c1 9c 30 c2 30 ec ; [$8d70] undefined
    hex 77 24 c9 72 0c 8f 24 32 77 20 70 cc 3b 08 c3 b1 ; [$8d80] undefined
    hex 1c 93 25 c5 2c a3 0b c3 1c a1 c1 71 1c 22 c4 71 ; [$8d90] undefined
    hex 3c 97 14 1c e7 0c c3 b1 1c 4d c1 b1 8b 1c 5c a3 ; [$8da0] undefined
    hex 0c 32 7c 33 0e 31 dc 95 71 37 12 ca 0c 9b 11 01 ; [$8db0] undefined
    hex c4 1c 0d c1 72 5c a0 32 6c 44 c3 b1 2c 3b 10 c9 ; [$8dc0] undefined
    hex 30 bc 9b 11 c1 b3 09 c6 31 13 0e c2 2c 8f 13 c9 ; [$8dd0] undefined
    hex 5c 31 70 7c a3 11 c4 9c 10 03 25 c2 f0 c3 08 c1 ; [$8de0] undefined
    hex 5c 10 0c a3 25 c5 32 5c a2 00 1c 97 03 32 5c 53 ; [$8df0] undefined
    db $03,$b0,$38,$ca,$32,$5c,$a1          ; [$8e00] undefined

FOREPAW_BLOCKS_SCREEN_15:                   ; [$8e07]
    hex c4 b0 5c 1f 14 c9 70 4c 17 04 0c 17 11 32 4c 13 ; [$8e07] undefined
    hex 05 30 47 30 b0 cc 69 31 8c 98 c9 f2 6b 06 33 07 ; [$8e17] undefined
    hex 01 c9 5c 43 11 c6 32 6c 3b 23 c3 32 4c 0d 31 4c ; [$8e27] undefined
    hex 07 03 72 8c 47 24 c9 72 0c 8f 24 32 5c 9b 05 cb ; [$8e37] undefined
    hex f1 3c 0f 25 ca 31 eb 25 c5 2c a3 0b c9 47 20 c2 ; [$8e47] undefined
    hex f0 cc 97 28 c7 8c 97 14 0c e7 25 c9 b2 7c 4f 05 ; [$8e57] undefined
    hex c4 71 8c 13 1d 70 4c 53 04 4c 13 26 c3 b2 4c 1f ; [$8e67] undefined
    hex 06 71 2c 8f 24 71 4c 2c c4 cc 9a 05 72 4c a0 32 ; [$8e77] undefined
    hex 6c 60 c4 4c 63 1d ca 30 bc 95 71 8c 9d c9 b1 13 ; [$8e87] undefined
    hex 0e c4 30 eb 13 c9 5c 31 c3 0c 10 00 30 8b 12 b0 ; [$8e97] undefined
    hex c3 04 0c 0c 0c a3 25 40 00 30 3c 95 32 5c 53 03 ; [$8ea7] undefined
    db $b0,$3c,$94,$ca,$32,$5c,$a1          ; [$8eb7] undefined

FOREPAW_BLOCKS_SCREEN_16:                   ; [$8ebe]
    hex c1 b0 7c 10 c4 40 32 7c 9b 27 ca 31 3c 38 c1 57 ; [$8ebe] undefined
    hex 11 c4 9c 93 20 c9 32 5c a3 11 b2 64 c1 9c 3b 24 ; [$8ece] undefined
    hex c9 71 3c 9b 11 72 8c 9b 23 c9 54 70 ec 93 25 32 ; [$8ede] undefined
    hex 83 24 c9 72 6c 8f 24 c9 b0 e0 cb f2 4c 04 c0 f1 ; [$8eee] undefined
    hex ec 10 0c 4b 13 c1 00 c1 b0 1c 1d c5 2c 97 0c c3 ; [$8efe] undefined
    hex b1 1c 8f 25 c9 b2 7c 4f 11 c1 47 04 0c 4f 0e c4 ; [$8f0e] undefined
    hex 72 3c 93 26 c3 b1 10 17 24 c2 f2 64 c9 0c 9b 11 ; [$8f1e] undefined
    hex 00 30 4c a0 c6 b1 13 12 c9 f1 3c 61 31 34 cb f4 ; [$8f2e] undefined
    hex 0c 9f 0c c3 84 31 29 c9 32 8c 31 c1 b0 4c 47 0e ; [$8f3e] undefined
    hex c2 08 71 33 24 c0 c9 cb c0 00 00 00 c1 40 00 00 ; [$8f4e] undefined
    db $00                                  ; [$8f5e] undefined

FOREPAW_BLOCKS_SCREEN_17:                   ; [$8f5f]
    hex c4 43 24 c9 70 cc 44 32 7c 9b 27 ca 31 3d 07 04 ; [$8f5f] undefined
    hex 4c 93 25 c3 30 e4 00 b2 6d 01 71 2c 97 13 c3 b1 ; [$8f6f] undefined
    hex 1c 93 28 c9 32 87 0e c4 dc 4d 71 33 0c c4 72 4c ; [$8f7f] undefined
    hex a2 c9 72 6c 8e c9 b0 e7 05 b4 0c 13 41 c1 34 1c ; [$8f8f] undefined
    hex 13 03 cc 30 4c 0f 13 c1 31 25 c4 71 8c 4b 08 c4 ; [$8f9f] undefined
    hex b1 3c 0f 01 4c 53 0c c3 b1 13 04 57 11 72 87 14 ; [$8faf] undefined
    hex 47 26 c2 31 0c 13 05 71 29 c2 2c 4f 25 8c 9b 08 ; [$8fbf] undefined
    hex c4 31 1c 14 5c a1 71 0c 47 12 c9 8c 23 10 c4 72 ; [$8fcf] undefined
    hex 81 c4 b1 33 0c a8 c4 70 8c 43 11 ca 0c 9b 46 44 ; [$8fdf] undefined
    hex c4 a3 08 31 0c 8f 24 72 6c 3b 47 cb c0 00 00 00 ; [$8fef] undefined
    db $c1,$40,$00,$00,$00                  ; [$8fff] undefined

FOREPAW_BLOCKS_SCREEN_18:                   ; [$9004]
    hex ca 30 cc 17 07 c1 4c 47 40 c4 70 4c 9b 27 c1 31 ; [$9004] undefined
    hex 3c 97 04 c3 31 1c 19 c1 b2 04 00 b2 6c 93 01 ca ; [$9014] undefined
    hex 30 51 c1 72 83 26 c3 87 0e c9 1c 4d c1 70 4c a1 ; [$9024] undefined
    hex c0 70 37 24 32 6c 8f 24 c9 b1 d7 25 c1 b2 8c 95 ; [$9034] undefined
    hex cc b1 43 25 31 3c 0f 13 31 27 28 c1 72 5c 05 47 ; [$9044] undefined
    hex 01 4c 13 0c 31 1c 77 01 c1 25 70 17 25 07 40 c6 ; [$9054] undefined
    hex b1 0c 10 ca 2c 95 c5 32 5c 4d ca 1c 98 c4 31 1c ; [$9064] undefined
    hex 93 28 c4 dc a3 01 c9 72 8c 33 12 c9 8c 23 10 c4 ; [$9074] undefined
    hex 72 4c a0 30 6c 4f 0c c4 f0 cc 3b 10 c4 70 8c 40 ; [$9084] undefined
    hex c9 32 80 1c 16 c4 b1 1c             ; [$9094] undefined

    db $14                                  ; [$909d] undefined1

    hex c2 31 0c 8f 24 ca 32 54 32 f0 0c 18 cb c0 00 4c ; [$909e] undefined
    db $9b,$24,$c1,$30,$50,$00,$00          ; [$90ad] undefined

FOREPAW_BLOCKS_SCREEN_19:                   ; [$90b4]
    hex c0 4c a0 c1 30 53 04 30 50 c1 00 4c 0d c1 ac 94 ; [$90b4] undefined
    hex c0 70 33 0c c9 f2 6c 91 71 4c 13 05 b2 53 03 32 ; [$90c4] undefined
    hex 5c 9b 0e 1c 4f 01 c5 33 03 01 c9 41 32 63 10 71 ; [$90d4] undefined
    hex d7 25 5c 50 9c 0e 30 cc 38 31 2b 03 4c 04 c9 71 ; [$90e4] undefined
    hex 3c 10 c3 30 ec 11 c4 71 d3 04 00 ca 30 4c 47 12 ; [$90f4] undefined
    hex 5c 23 11 c7 70 4c 0c 32 5c 0c 32 5c 4e b0 8c 41 ; [$9104] undefined
    hex c4 cc 93 28 c4 dc a3 25 31 33 12 c3 97 12 72 4c ; [$9114] undefined
    hex a0 23 0c c9 8c 33 0e c2 31 0c 8d 72 8c 95 1c 9b ; [$9124] undefined
    hex 11 c4 b0 cc 3b 08 32 3c 93 28 c9 b2 78 cb c0 00 ; [$9134] undefined
    hex 00 00 c1 50 0c 14 00 00             ; [$9144] undefined

FOREPAW_BLOCKS_SCREEN_20:                   ; [$914c]
    hex c1 b0 1c 97 28 c9 b2 7c 0f 14 0c 0f 28 c1 f2 8c ; [$914c] undefined
    hex 0f 06 c1 1c 0f 0c c4 71 2c 4f 25 70 1c 9b 0c c9 ; [$915c] undefined
    hex f2 6c 93 05 c0 71 4c 4d c3 b1 0c 46 c0 f2 57 0e ; [$916c] undefined
    hex 1c 4f 01 c5 32 5c a3 26 c2 04 b2 63 10 c1 27 25 ; [$917c] undefined
    hex 5c 4f 04 1c 3b 12 70 cc 38 31 2c 77 03 c1 0c a3 ; [$918c] undefined
    hex 11 4a c1 01 c4 71 d3 25 82 95 c9 11 c7 70 cc a0 ; [$919c] undefined
    hex 72 5c a3 26 c3 b0 8c 3b 24 ca 32 6c 3b 11 c4 cc ; [$91ac] undefined
    hex 95 c4 d7 20 c4 6c 8f 28 c9 b1 2c 43 12 72 5c a0 ; [$91bc] undefined
    hex 22 c3 00 c4 b1 0c 8d 72 89 1c 9b 11 87 12 c2 32 ; [$91cc] undefined
    hex 3c 93 28 c9 b2 78 cb c0 00 00 00 c1 50 0c 14 00 ; [$91dc] undefined
    db $00                                  ; [$91ec] undefined

FOREPAW_BLOCKS_SCREEN_21:                   ; [$91ed]
    hex c0 f0 50 c9 b0 50 30 4c 0f 04 c1 4c 0c c1 70 1c ; [$91ed] undefined
    hex 97 0c c1 31 2c 4f 25 ca 30 1c 9b 06 c4 8b 04 c0 ; [$91fd] undefined
    hex 72 5c 4d c1 70 ec 46 70 5c 13 05 71 dc 4e 1c a3 ; [$920d] undefined
    hex 26 c4 43 24 c9 72 6c 1b 1c c4 70 bc 33 25 2c 4f ; [$921d] undefined
    hex 11 c1 5c 93 25 32 8c 17 1d c7 b0 cc 77 03 43 28 ; [$922d] undefined
    hex 72 4c 94 0c 9b 27 ca 15 c0 5c a3 26 81 c2 f0 cc ; [$923d] undefined
    hex 17 0c b0 3c a0 95 32 7c 4f 03 c3 30 e3 11 c4 cc ; [$924d] undefined
    hex 95 c4 d7 20 c4 47 28 c9 9c 23 12 72 5c a3 01 a2 ; [$925d] undefined
    hex 45 c5 71 1b 27 72 8c 79 5c 9b 27 c4 f2 4c a0 c3 ; [$926d] undefined
    hex 30 eb 24 c3 31 d5 cb c0 00 00 00 c1 50 0c 14 00 ; [$927d] undefined
    db $00                                  ; [$928d] undefined

FOREPAW_BLOCKS_SCREEN_22:                   ; [$928e]
    hex c1 70 7c 9f 03 03 25 c9 b2 7c 93 03 0c 10 71 2c ; [$928e] undefined
    hex 93 28 0c 97 13 32 4c 0f 25 c2 70 cc 91 71 1c 4f ; [$929e] undefined
    hex 0c 32 6c 4c c9 4c 27 26 d3 31 dc 9b 05 13 26 c3 ; [$92ae] undefined
    hex 8c 47 24 72 6c 31 c3 9c 1f 06 c1 0c 4f 04 0c 93 ; [$92be] undefined
    hex 07 72 8c 17 0e c1 07 05 c9 43 26 c3 b1 1c 95 c1 ; [$92ce] undefined
    hex 4c 47 24 c9 47 06 4c 33 0e 32 4c a3 13 70 cc 93 ; [$92de] undefined
    hex 45 34 a5 c5 32 8c 47 08 72 7c 4f 12 72 4d 17 4d ; [$92ee] undefined
    hex 34 87 05 72 5c 81 c4 47 28 70 1d 27 42 1c a3 01 ; [$92fe] undefined
    hex 70 b7 16 c3 b2 4c 14 c0 47 46 5c 97 05 57 11 c9 ; [$930e] undefined
    hex 30 53 01 30 37 47 5c 4f 06 cb c0 00 00 00 c1 50 ; [$931e] undefined
    db $0c,$14,$00,$00                      ; [$932e] undefined

FOREPAW_BLOCKS_SCREEN_23:                   ; [$9332]
    hex c0 f2 5d 07 30 c0 72 5c 9b 04 0c 9f 0c 31 3c 30 ; [$9332] undefined
    hex c9 72 6c 47 40 c1 34 1c 13 12 c4 5d 07 04 d0 5c ; [$9342] undefined
    hex 9b 04 07 26 c3 b0 8c 3b 08 c9 0c a3 13 c4 70 43 ; [$9352] undefined
    hex 18 c1 b2 67 04 43 24 c2 70 3c 07 25 c9 b1 ac 63 ; [$9362] undefined
    hex 24 c1 30 54 c4 32 43 09 d3 33 3c e5 c3 31 dc 93 ; [$9372] undefined
    hex 01 cf e7 10 c9 34 5d 37 49 d2 30 9c 05 c6 31 1c ; [$9382] undefined
    hex 9f 28 c1 30 6c 3b 24 d3 d1 4c c3 39 c9 92 c8 dc ; [$9392] undefined
    hex 93 25 d2 74 8d 35 47 25 71 2c 22 c9 30 5c 13 45 ; [$93a2] undefined
    hex 5d 29 47 39 70 cc bb 20 c9 4c 1b 4c 75 0d 35 d4 ; [$93b2] undefined
    hex 1c 03 04 d0 03 04 c0 70 cc 17 49 34 8d 19 d2 05 ; [$93c2] undefined
    hex cb b1 2c 4d c3 30 ec 11 35 0d 1d d4 1c 13 24 ca ; [$93d2] undefined
    hex 32 50 c3 8c 16 c1 40 30 4c bf 28 c0 c4 ; [$93e2] undefined

FOREPAW_BLOCKS_SCREEN_24:                   ; [$93ef]
    hex d0 32 5c 47 04 d0 30 4c 9b 04 31 1c 13 40 c3 31 ; [$93ef] undefined
    hex 3c 13 0c c1 32 6c 13 40 c4 4b 12 c4 68 c1 0c 9b ; [$93ff] undefined
    hex 11 2c 47 26 c3 b0 8c 3b 08 c9 0c a3 13 83 18 c8 ; [$940f] undefined
    hex 32 3c 23 0e 31 1c 90 c5 30 3c 07 25 c9 b1 ac 63 ; [$941f] undefined
    hex 24 ca 32 6c 3b 11 c9 32 8c 94 73 3c e5 c3 31 dc ; [$942f] undefined
    hex 93 01 57 24 ca 32 5c 50 0c 05 c6 31 1c 9f 28 c9 ; [$943f] undefined
    hex b0 ec 4b 13 c5 00 0c c3 0c c9 92 c8 f1 13 27 ca ; [$944f] undefined
    hex 10 0c 33 0e 34 0c 10 c9 32 8c 82 72 54 30 cc 38 ; [$945f] undefined
    hex c4 70 cc 15 32 58 c9 e0 c3 30 e3 08 c1 2c 12 70 ; [$946f] undefined
    hex c4 31 3d 00 30 4c 20 71 2c 4e d0 0c 13 40 0c a3 ; [$947f] undefined
    hex 0c c3 8d 03 04 d0 2c 94 c3 b2 80 0c 33 11 03 28 ; [$948f] undefined
    db $c0,$c4                              ; [$949f] undefined

FOREPAW_BLOCKS_SCREEN_25:                   ; [$94a1]
    hex c3 b0 4c 47 0e c1 43 04 c3 b1 1c 17 40 c1 30 5c ; [$94a1] undefined
    hex 13 05 70 89 c4 b2 4c 97 28 c8 30 48 c3 b0 8c 3a ; [$94b1] undefined
    hex c4 69 c9 31 34 8c 83 13 8c 91 ca 31 6b 27 c9 72 ; [$94c1] undefined
    hex 81 c5 30 3b 25 c9 b2 4c 10 c9 72 0c 45 70 33 01 ; [$94d1] undefined
    hex 73 3c e5 ca 32 59 72 67 28 70 1c 10 d0 0c 11 c6 ; [$94e1] undefined
    hex 30 7c 9d c3 30 ec 4b 13 c5 00 0c 2f 0c d0 1c 10 ; [$94f1] undefined
    hex 0d 03 04 90 0c 0f 28 c3 9c 39 c9 32 8c 83 0e c4 ; [$9501] undefined
    hex ac 95 30 33 0c c4 70 c1 32 57 11 c9 32 80 c4 f1 ; [$9511] undefined
    hex 9c 6b 11 c9 1c 10 32 80 c9 5c 0f 07 c3 8c 41 c3 ; [$9521] undefined
    hex 31 2c 3b 05 d0 1c 0c 09 c1 70 4d 03 05 d0 30 5c ; [$9531] undefined
    hex 10 91 32 8c 31 c1 34 1b 28 70 4b 25 ; [$9541] undefined

FOREPAW_BLOCKS_SCREEN_26:                   ; [$954d]
    hex d0 32 8c 97 26 31 33 07 c4 f1 1c 13 03 c1 30 e0 ; [$954d] undefined
    hex c1 72 5b 27 c4 4c 61 c9 72 0a c3 b0 87 04 c1 b2 ; [$955d] undefined
    db $80,$c9                              ; [$956d] undefined

    db $b1                                  ; [$9570] undefined1

    hex 07 25 32 8b 13 c4 70 4a 70 7c 98 c3 8c 49 c0 cb ; [$9571] undefined
    hex 25 c9 a9 5c 10 03 26 c9 f0 bc 33 12 ca 15 70 1c ; [$9580] undefined
    hex 0f 28 c4 72 4c 2f 20 c4 70 cc 44 b0 c9 5c 97 26 ; [$9590] undefined
    hex c8 f1 4c 07 28 9c 3b 08 5c 3b 04 72 5c 9b 11 c4 ; [$95a0] undefined
    db $d3                                  ; [$95b0] undefined1

    hex 0b c4 f1 8c 45 c7 14 c1 72 f3 0e ac 07 25 c8 31 ; [$95b2] undefined
    hex 1c 3b 1c c9 11 c4 70 63 20 c4 b1 ab 28 c9 ac 8f ; [$95c1] undefined
    hex 24 c9 9c 3b 08 c8 30 5c bc 2c 77 0c c3 b1 2c 9f ; [$95d1] undefined
    hex 26 c4 71 2c 22 ca 31 18 0c bd c2 2c 13 2f c2 0c ; [$95e1] undefined
    hex bf 05 c5 2c 83 04 00 03 05 c1 0c 14 ; [$95f1] undefined

FOREPAW_BLOCKS_SCREEN_27:                   ; [$95fd]
    hex d0 32 8c 97 26 31 33 28 c4 f1 1c 13 03 c1 31 1c ; [$95fd] undefined
    hex 4b 13 c1 72 5b 27 71 1c 91 c9 72 0c 92 ca 32 0c ; [$960d] undefined
    hex 3b 04 72 80 c8 32 5c 33 25 0c 0c c9 70 4c 4b 27 ; [$961d] undefined
    hex 70 7c 98 c9 30 37 27 c0 c3 28 c3 31 1b 13 5c 10 ; [$962d] undefined
    hex 03 12 c4 f2 5c 9b 11 c3 97 27 5c 0f 28 c0 cc 83 ; [$963d] undefined
    hex 11 31 2c 47 0e 30 c9 5c 96 c0 73 0c 96 2c 21 c4 ; [$964d] undefined
    hex 9c 9f 04 c4 5c a1 cc 31 43 0b c4 f1 88 32 4c 0c ; [$965d] undefined
    hex 71 25 1c 07 25 c0 f2 83 20 c9 32 57 13 4c 4d ca ; [$966d] undefined
    hex 31 33 28 c4 e2 c0 cc 33 18 4c 62 c8 31 8c 77 0c ; [$967d] undefined
    hex c3 b1 87 26 70 cc 47 0e c1 70 4c 15 c3 2c 17 04 ; [$968d] undefined
    hex 30 5c 13 2f c3 30 8c 43 24 54 00 07 05 c1 0c 17 ; [$969d] undefined
    db $04                                  ; [$96ad] undefined

FOREPAW_BLOCKS_SCREEN_28:                   ; [$96ae]
    hex ca 30 53 04 c9 b1 3c 14 c1 30 33 25 c1 03 13 72 ; [$96ae] undefined
    hex 5c a3 27 70 4c a3 25 c0 ec 97 04 32 5c a2 c1 44 ; [$96be] undefined
    hex c1 32 5c 07 03 c0 5c 17 03 c9 72 7c 4b 27 c4 b2 ; [$96ce] undefined
    hex 8c 99 c9 30 13 14 30 33 28 c3 31 1c 3b 13 ca 00 ; [$96de] undefined
    hex 31 40 c9 4c 9b 12 c3 97 27 c3 1c 0d c0 cc 97 28 ; [$96ee] undefined
    hex 30 cc 47 0e 30 c9 ca 30 1c 97 04 c6 71 ac 63 20 ; [$96fe] undefined
    hex c3 31 1c 21 c4 9c 9f 24 c2 f2 5c a3 0c c4 70 e3 ; [$970e] undefined
    hex 12 c4 f1 88 32 4c 0c ca 30 c3 11 c3 ac 8e b2 8c ; [$971e] undefined
    hex 9b 20 c9 32 57 13 5c 8f 20 72 4c a3 20 ac 83 13 ; [$972e] undefined
    hex c0 cc 33 18 5c 93 05 c1 07 1a c4 6b 27 b0 cc 47 ; [$973e] undefined
    hex 0e c0 f0 4c 17 06 72 08 11 ca 13 04 30 63 04 c9 ; [$974e] undefined
    hex 31 3c 47 12 c4 f0 53 04 c1 41       ; [$975e] undefined

FOREPAW_BLOCKS_SCREEN_29:                   ; [$9768]
    hex d0 30 5c 13 05 c1 30 5c 33 04 c3 30 5c 10 c1 4c ; [$9768] undefined
    hex 10 30 67 27 b0 cc 13 25 a8 c3 30 48 c0 e3 28 32 ; [$9778] undefined
    hex 4c 07 03 53 03 c9 72 7c 4b 27 c4 b2 8c 99 c9 70 ; [$9788] undefined
    hex 33 28 c3 0c 0f 28 c3 31 1c 3b 13 ca 32 58 c3 32 ; [$9798] undefined
    hex 6c 9f 26 c3 b2 7c 9b 12 c3 97 27 c3 2c 33 0e 31 ; [$97a8] undefined
    hex 13 08 31 1b 0e 30 c9 ca 30 1c 10 d0 30 4d 00 c1 ; [$97b8] undefined
    hex 34 0c 13 40 c1 0c 9f 24 c2 f2 57 0c c9 b2 7c a3 ; [$97c8] undefined
    hex 0c c4 b2 87 11 32 48 ca 30 c3 11 c3 b2 47 11 53 ; [$97d8] undefined
    hex 20 c9 32 5c 0f 13 5c 8f 20 c9 30 33 20 c3 ac 83 ; [$97e8] undefined
    hex 26 c9 f0 3c 33 18 5c 4b 0c ca 32 5c 99 c4 6b 27 ; [$97f8] undefined
    hex c4 f0 cc 47 0e c1 00 c9 72 0c 13 27 b0 49 c1 00 ; [$9808] undefined
    hex c1 b1 37 13 71 37 28 c4 dc 30 70 5c 31 ; [$9818] undefined

FOREPAW_BLOCKS_SCREEN_30:                   ; [$9825]
    hex c5 30 5c 30 c1 30 5c 33 04 c3 30 5c 10 c1 4c 13 ; [$9825] undefined
    hex 0e c1 1c 10 c1 70 c3 25 88 c4 b0 e7 05 31 41 32 ; [$9835] undefined
    hex 4c 13 03 c3 0c a0 c7 72 77 27 c4 b2 8c 4f 28 c9 ; [$9845] undefined
    hex 70 33 28 71 dc 2f 25 c3 2c 3b 13 ca 32 5b 26 c4 ; [$9855] undefined
    hex f1 41 c8 32 7c 4f 03 c4 f2 6c 6b 27 c3 2c 33 0e ; [$9865] undefined
    hex c4 a7 03 ab 0b c1 ec 77 13 ca 30 1c 83 12 c7 72 ; [$9875] undefined
    hex 44 b0 cc 47 13 70 40 0d 03 04 d0 71 43 04 31 1c ; [$9885] undefined
    hex 23 04 5c 4b 20 ca 30 c3 11 c9 1c a3 0c c4 b0 e1 ; [$9895] undefined
    hex c4 71 dc a1 5c 8f 24 ca 30 33 20 c3 83 11 c9 f2 ; [$98a5] undefined
    hex 8c 32 1c 4b 28 32 5c 99 c4 43 27 c4 f0 cc 93 25 ; [$98b5] undefined
    hex c1 03 05 03 04 c1 4c 10 30 5c 13 05 c1 b1 3c 1f ; [$98c5] undefined
    hex 13 c9 71 3c 12 8c 33 28 0c 32       ; [$98d5] undefined

FOREPAW_BLOCKS_SCREEN_31:                   ; [$98df]
    hex cc f4 10 03 01 d0 4c 07 41 0c 07 41 c1 2c 13 1e ; [$98df] undefined
    hex c9 72 6c 9f 04 c9 b2 7c 27 25 c9 8c 10 c9 72 8c ; [$98ef] undefined
    hex 27 0b c4 f1 10 c9 20 c4 b2 4c 97 20 ca 30 4d e3 ; [$98ff] undefined
    hex 26 1c 77 28 c3 31 6c 47 24 c9 70 9c 53 09 c2 f0 ; [$990f] undefined
    hex cc 4b 0e 32 4c 27 25 c8 31 1c 93 45 c5 f7 87 78 ; [$991f] undefined
    hex c3 31 0c 3b 23 c9 34 fd e3 0c c9 b2 4d 14 34 cd ; [$992f] undefined
    hex 13 25 c4 32 3c 93 45 0d 33 28 c9 2d 27 48 d2 8c ; [$993f] undefined
    hex 97 26 c8 f2 4d e3 42 0d 87 15 c4 f1 27 50 d0 b4 ; [$994f] undefined
    hex d7 0c c9 33 3d 33 4d d2 b4 dd 33 30 c9 72 47 48 ; [$995f] undefined
    hex 74 bc 4f 12 c9 70 27 48 d1 b4 97 00 cd f3 67 50 ; [$996f] undefined
    hex d1 b4 3c 97 18 c0 55 d1 d5 30 a7 48 d1 d5 c1 0c ; [$997f] undefined
    hex 17 3f c1 4c fc c1 40 0c 13 05 c4 c3 04 31 20 0c ; [$998f] undefined
    db $10,$17,$13                          ; [$999f] undefined

FOREPAW_BLOCKS_SCREEN_32:                   ; [$99a2]
    hex c1 34 13 03 d0 43 04 ca 34 1d 03 41 0c 13 41 ca ; [$99a2] undefined
    hex 30 cc 13 1e c9 70 c0 b0 9c 94 c9 8c 30 4c e6 c4 ; [$99b2] undefined
    hex dc 47 23 c9 37 8c 98 c4 b2 0c 47 24 ce 70 97 26 ; [$99c2] undefined
    hex 31 1c 93 28 c3 32 3c 47 12 c9 1c 93 25 77 8c 9b ; [$99d2] undefined
    hex 0e 32 4c 97 45 34 8c 83 24 ca 32 6c 9f 28 32 6c ; [$99e2] undefined
    hex 3b 23 c9 34 fc 13 4d d0 9c 94 c9 b1 2c 91 c9 b1 ; [$99f2] undefined
    hex 1c 1f 24 c1 00 9c 7b 0b c8 32 4c 97 0c c4 70 e7 ; [$9a02] undefined
    hex 04 0c 91 1c 95 c9 72 63 11 32 4d 41 c3 b2 4d 13 ; [$9a12] undefined
    hex 45 4c 79 c9 b1 2c 44 c9 f4 fd 21 c9 34 fd 0b 46 ; [$9a22] undefined
    hex 95 d0 34 1d 03 41 c9 34 25 c1 f4 97 47 d0 9c 97 ; [$9a32] undefined
    hex 20 c5 b1 2c 97 18 c1 70 40 70 5c fc c1 5c 2f 26 ; [$9a42] undefined
    hex c3 b2 4c 9b 0e c4 c3 05 70 4c 4b 05 c1 0c 97 28 ; [$9a52] undefined
    db $c9,$32,$6c,$3b,$24                  ; [$9a62] undefined

FOREPAW_BLOCKS_SCREEN_33:                   ; [$9a67]
    hex c1 30 ec 93 03 c9 b4 13 01 ca 34 0c 17 1a c1 31 ; [$9a67] undefined
    hex ac 17 41 ca 2c a3 26 c1 32 5c 16 c1 4c 10 c9 8c ; [$9a77] undefined
    hex 32 43 04 c9 4c 32 c4 71 dc 98 b2 0c 45 ce 70 cc ; [$9a87] undefined
    hex 13 25 30 cc 3b 11 cb b1 2c 3b 12 2c 17 04 5c 4f ; [$9a97] undefined
    hex 28 c3 30 ec 23 1d c8 30 e3 11 c9 30 5c 9f 0b ca ; [$9aa7] undefined
    hex 32 6c 4b 1a c3 b0 8c 8d 71 1c bb 24 c9 b0 4b 04 ; [$9ab7] undefined
    hex c9 b1 17 0e c2 2c 77 1e 72 3c 93 01 c8 32 4c 95 ; [$9ac7] undefined
    hex c4 70 e7 2e b2 3c 93 25 03 0b c9 72 63 06 72 4c ; [$9ad7] undefined
    hex 82 72 4c 97 26 c4 cc 79 c9 b1 2c 8d c1 00 c9 32 ; [$9ae7] undefined
    hex 8c 9b 11 c4 89 c3 30 ec 91 c3 8c 93 25 0c 10 03 ; [$9af7] undefined
    hex 20 c5 b0 7c 97 04 c4 b2 4c a0 72 6c 31 c3 02 1c ; [$9b07] undefined
    hex 13 05 c4 c3 26 31 20 0c 95 c9 1c 3a ; [$9b17] undefined

FOREPAW_BLOCKS_SCREEN_34:                   ; [$9b23]
    hex c1 30 ec 93 03 c9 b4 13 01 ca 34 0c 17 1a c1 31 ; [$9b23] undefined
    hex ac 17 41 ca 2c a3 26 c1 32 5c 16 c1 4c 10 c9 8c ; [$9b33] undefined
    hex 8e 43 04 c9 4c 32 c4 71 dc 98 c4 4c 93 7a ce 70 ; [$9b43] undefined
    hex cc 13 25 30 cc 3b 11 cb b1 2c 38 c4 b1 dc 95 5c ; [$9b53] undefined
    hex 4f 28 c3 30 ec 23 1d c8 32 4c 9b 11 c9 32 81 ca ; [$9b63] undefined
    hex 32 6c 4b 1a c3 b0 8c 8d ca 32 6c 47 23 ca 32 5c ; [$9b73] undefined
    hex 1d c9 b1 17 0e c2 2c 77 1e 72 07 27 de 85 c4 70 ; [$9b83] undefined
    hex ec 93 28 b2 3c 93 25 30 cc 4b 7a ce b3 b5 72 4c ; [$9b93] undefined
    hex 97 26 72 4c 97 26 c4 f2 3d e8 ca b2 b5 72 63 11 ; [$9ba3] undefined
    hex c9 32 8c 9b 11 c4 b7 a0 ce b3 b7 80 c3 8c 93 07 ; [$9bb3] undefined
    hex c9 4d e8 00 ca b2 b5 c4 b2 4c a1 c1 4c ff 05 cf ; [$9bc3] undefined
    hex f0 5c ff 05 00 c4 c1 40 00 00       ; [$9bd3] undefined

FOREPAW_BLOCKS_SCREEN_37:                   ; [$9bdd]
    hex c1 30 3c 13 03 c9 b0 4c 9b 27 ca 31 d3 0c c4 b1 ; [$9bdd] undefined
    hex 3c 17 41 c0 6c a3 26 c4 f2 5b 13 30 4c a3 23 c1 ; [$9bed] undefined
    hex 2c 8f 04 07 20 b2 7c a3 26 c4 4c 9f 20 32 3c 93 ; [$9bfd] undefined
    hex 13 c0 70 b3 25 b2 4c 9b 11 c3 8c 93 28 c9 f1 dc ; [$9c0d] undefined
    hex 97 04 70 7c 4f 28 b2 6c 8e c8 32 4c a0 c1 f2 8c ; [$9c1d] undefined
    hex 13 13 5d e8 32 4b 1d c1 00 72 59 5c eb 3b 72 6c ; [$9c2d] undefined
    hex 4b 24 ca 32 07 27 57 04 5c ab 2b 70 43 25 ce 6b ; [$9c3d] undefined
    hex 24 c9 70 cc 9f 13 4c eb 3b 72 4c 94 c5 32 5c 2f ; [$9c4d] undefined
    hex 25 c3 30 e3 04 e0 1d e8 ca 0c 9b 27 c9 8c 9f 0c ; [$9c5d] undefined
    hex c8 dc 93 20 57 0c c1 f2 57 24 c8 31 1c 3b 23 c9 ; [$9c6d] undefined
    hex f0 41 de 83 24 70 4d 03 04 c4 f0 4d 07 04 d0 2c ; [$9c7d] undefined
    hex a2 c1 74 0c 4f 20 71 1c 4f 0c 4c a0 03 40 ; [$9c8d] undefined

FOREPAW_BLOCKS_SCREEN_38:                   ; [$9c9b]
    hex c1 30 5c 13 03 c1 0c 14 0c 10 c4 b0 4c 17 04 c0 ; [$9c9b] undefined
    hex 72 5b 39 72 5e 03 39 c4 f2 7c a3 20 ac 8e c9 70 ; [$9cab] undefined
    hex 3c 10 c9 b2 7c a3 26 c4 49 32 3c 93 25 c0 70 4c ; [$9cbb] undefined
    hex 2f 25 c8 23 0e 32 3c 93 28 72 4c 97 03 c1 30 3c ; [$9ccb] undefined
    hex 97 28 c3 31 1c 3b 08 c8 f2 4c a0 c9 72 8c 0e 72 ; [$9cdb] undefined
    hex 53 0c c3 b0 87 23 c9 32 8c 94 c0 c9 c0 53 20 4c ; [$9ceb] undefined
    hex 47 24 c0 70 bc 9b 27 85 70 4c a1 c4 72 3c 93 14 ; [$9cfb] undefined
    hex 72 5c 83 24 70 cc 9d 4c 96 b2 4c 94 9c 2f 25 c3 ; [$9d0b] undefined
    hex 30 ec 4b 13 c1 1c a0 01 ca 32 6c 9f 0c c3 b1 1c ; [$9d1b] undefined
    hex 93 20 c0 70 b7 07 c9 f2 5c 9a c9 b1 1c 38 c4 31 ; [$9d2b] undefined
    hex 2c 4d c0 f0 41 c1 0d 03 04 0d 07 10 c1 70 4c 17 ; [$9d3b] undefined
    hex 04 5c 95 4c 4f 0c 4c 83 24 c1 32 8b 0c ; [$9d4b] undefined

FOREPAW_BLOCKS_SCREEN_39:                   ; [$9d58]
    hex c1 b0 3c 33 05 c1 f2 4c 9b 11 c9 f2 8c 98 c4 71 ; [$9d58] undefined
    hex 2c 4f 20 c1 0c 17 41 c4 f2 5c 83 1d c9 2b 11 1c ; [$9d68] undefined
    hex 93 28 70 3b 03 c9 b2 7c a3 26 c9 f1 2b 20 32 4c ; [$9d78] undefined
    hex a0 c0 71 4c 2f 2f c8 23 0e 31 1c 4f 28 72 8c 1f ; [$9d88] undefined
    hex 27 c5 30 3c 97 04 b1 1c 3b 08 c4 32 4c a0 c9 70 ; [$9d98] undefined
    hex 45 72 53 0c b4 17 04 d0 30 4d 03 25 c0 c7 41 ca ; [$9da8] undefined
    hex 13 20 c3 b1 1c 93 25 c0 70 bc 9b 27 85 c9 63 13 ; [$9db8] undefined
    hex c4 b2 3c 97 03 32 5c 83 24 71 47 13 c0 6c 9b 12 ; [$9dc8] undefined
    hex ca 0c 0f 01 c5 1c 2f 25 c5 0c a1 32 6c 48 70 3c ; [$9dd8] undefined
    hex 07 30 b0 3c 9f 14 b2 8c 2f 20 c4 80 c1 0d 03 04 ; [$9de8] undefined
    hex d0 30 4d 03 28 c9 b1 2c 9d c1 00 c4 f2 6c 9f 13 ; [$9df8] undefined
    hex 32 8c 33 04 00 c0 f1 20 0c 4f 0c c4 8c 83 24 c9 ; [$9e08] undefined
    db $b2,$8c,$9b,$0c                      ; [$9e18] undefined

FOREPAW_BLOCKS_SCREEN_40:                   ; [$9e1c]
    hex c9 70 3c 04 33 0c cf 25 c1 30 5c 13 05 c4 70 7c ; [$9e1c] undefined
    hex 17 20 c0 f0 13 30 ce 72 5c e6 c9 32 87 11 17 04 ; [$9e2c] undefined
    hex c9 5c ca c2 f2 7c a0 c9 d3 20 32 4c a3 06 c0 71 ; [$9e3c] undefined
    hex 4c e7 0b c3 32 63 24 c0 71 4c 96 72 8c 31 c9 70 ; [$9e4c] undefined
    hex 3c 97 04 c4 70 ec 10 d0 30 4d 03 04 c9 70 c3 04 ; [$9e5c] undefined
    hex 34 0c 13 0c c3 b2 3c 93 30 c5 32 5c 47 25 b4 1c ; [$9e6c] undefined
    hex 13 28 32 53 20 c8 f0 cc 6b 19 c9 72 63 27 8c 31 ; [$9e7c] undefined
    hex c9 63 13 c3 31 1c 4b 0e c4 31 2c 83 24 71 47 13 ; [$9e8c] undefined
    hex c0 6c 9b 12 c8 1c 3b 08 c9 32 63 25 c5 2c 49 32 ; [$9e9c] undefined
    hex 6c 48 ca 1c 8f 24 c9 ac 9f 14 30 cc 3b 20 c4 80 ; [$9eac] undefined
    hex c3 30 ec 93 26 b0 4d 07 04 c3 31 1c 23 12 c1 0d ; [$9ebc] undefined
    hex 07 04 34 13 04 c1 72 8c 30 b0 50 c0 f1 28 c1 6c ; [$9ecc] undefined
    hex 17 0c c4 8c 83 24 c9 a1             ; [$9edc] undefined

FOREPAW_BLOCKS_SCREEN_41:                   ; [$9ee4]
    hex c1 70 3c 13 12 c1 0c cf 25 c2 f0 6c 13 25 c2 70 ; [$9ee4] undefined
    hex cc 3b 18 c1 0c 06 ce 72 5c 17 0c 30 4c 27 28 d3 ; [$9ef4] undefined
    hex 1c 11 c1 70 1c cb 05 30 cc 13 11 c3 8d 33 0c 32 ; [$9f04] undefined
    hex 4c 27 0c c0 71 4c e7 0b 52 1c 33 24 d1 4d 33 04 ; [$9f14] undefined
    hex c9 70 3c 97 0c 5c 44 0c 93 45 34 27 06 ca 03 26 ; [$9f24] undefined
    hex b2 3c 93 28 c8 32 4d 3f 4d d0 b4 d5 72 5c 33 ; [$9f34] undefined

    db $11                                  ; [$9f44] undefined1

    hex c8 f2 5c 04 c9 72 6d 33 48 d2 b4 95 c9 70 cc 4b ; [$9f45] undefined
    hex 27 c3 31 33 19 c6 b2 05 d1 95 c2 f1 ac 46 c9 31 ; [$9f54] undefined
    hex 5c 97 28 31 35 d1 d5 c4 f2 7c 57 25 cc f0 40 cc ; [$9f64] undefined
    hex ec 13 05 03 04 c4 8c 9b 27 cd b2 7c db 25 cd a2 ; [$9f74] undefined
    hex c3 31 1c 13 06 cb c0 00 c1 72 f3 05 a2 b0 43 06 ; [$9f84] undefined
    hex 30 4c 1b 04 c1 b0 42 c9 a2          ; [$9f94] undefined

FOREPAW_BLOCKS_SCREEN_42:                   ; [$9f9d]
    hex c0 c0 0c 14 c4 cc a3 25 c5 32 8c 33 05 72 54 c9 ; [$9f9d] undefined
    hex 70 5c 31 c1 30 50 c9 b2 07 18 70 1c 13 05 c1 0c ; [$9fad] undefined
    hex 47 08 72 7c a3 20 b0 4c 9a c0 72 5c 1b 25 c9 b0 ; [$9fbd] undefined
    hex cb 10 c3 ac 9b 23 c1 32 6c a3 04 c9 70 5c 13 0c ; [$9fcd] undefined
    hex 70 57 11 c9 32 5c 83 24 ca 32 52 30 3c a3 26 b2 ; [$9fdd] undefined
    hex 3c 93 28 c0 d0 0c a0 c0 f0 4c 33 11 c8 f2 50 c0 ; [$9fed] undefined
    hex 5c 53 01 41 c1 32 0c 4b 27 c3 31 33 28 c0 c0 72 ; [$9ffd] undefined
    hex 6c 9d 72 8a c9 31 5c 95 30 bc 33 27 c4 f1 12 c1 ; [$a00d] undefined
    hex 72 5c 57 25 cc f0 bc db 0b c1 00 05 70 3c 1f 27 ; [$a01d] undefined
    hex cd b0 40 c9 f2 8c 9b 13 c3 31 18 cb f0 47 04 32 ; [$a02d] undefined
    hex 8c 33 18 72 6c 44 c8 e3 0e c1 b0 57 1a 31 8c 38 ; [$a03d] undefined
    hex c4 4c 4b 0e c9 32 6c 38             ; [$a04d] undefined

FOREPAW_BLOCKS_SCREEN_43:                   ; [$a055]
    hex c0 cc 13 05 c1 30 5c 94 c4 f0 5c 13 05 0c 13 11 ; [$a055] undefined
    hex c1 0c 97 03 b2 5c 13 05 ca 0a c9 b2 0a c1 70 1c ; [$a065] undefined
    hex 0f 04 b2 8c 9b 27 c1 32 7b 20 c4 8c 9b 24 c0 72 ; [$a075] undefined
    hex 59 ca 32 6c 38 ac 9b 23 72 6c a0 c9 70 33 0b 71 ; [$a085] undefined
    hex 17 11 b1 2c 47 27 ca 32 51 1c a3 26 c3 32 0c 93 ; [$a095] undefined
    hex 28 c8 24 c4 dc a3 0c 4c 33 11 c8 f2 50 53 24 c9 ; [$a0a5] undefined
    hex 4c 10 72 0c 4b 27 c3 31 37 28 c3 1c 4b 13 72 6c ; [$a0b5] undefined
    hex 33 24 c9 b2 7a c9 32 53 0c c3 b1 0c 47 24 c1 0c ; [$a0c5] undefined
    hex a0 c8 32 4c 57 25 cc f0 bc 33 0e 31 2c 93 26 c3 ; [$a0d5] undefined
    hex 32 83 27 c1 00 cd b0 c1 c4 72 4c 10 4c 9e c3 31 ; [$a0e5] undefined
    hex 0c 47 2f 80 0c bf 11 c8 d1 c4 43 1a 31 8c 38 c4 ; [$a0f5] undefined
    db $4c,$4b,$0e,$c9,$32,$6c,$91          ; [$a105] undefined

FOREPAW_BLOCKS_SCREEN_44:                   ; [$a10c]
    hex cb f2 5c 33 07 c1 30 50 00 c1 30 53 04 c2 f2 8c ; [$a10c] undefined
    hex d9 00 00 2c 9f 0c 5c 2f 28 c9 b2 7c a3 26 31 2c ; [$a11c] undefined
    hex 47 12 4a c0 72 5c 07 25 c8 32 4c 83 11 c3 b0 8c ; [$a12c] undefined
    hex 43 0e 9c 82 c9 70 3c a3 33 c0 f2 5c a2 43 23 c9 ; [$a13c] undefined
    hex 32 52 ca 01 c5 12 9c 47 24 c4 dc a3 04 00 c9 70 ; [$a14c] undefined
    hex 17 20 c4 ec 93 28 c9 4c 33 20 ca 03 26 c9 d7 28 ; [$a15c] undefined
    hex c3 30 ec 9d 72 6c 10 c9 b2 7c 83 04 32 51 71 0c ; [$a16c] undefined
    hex 10 0c a3 0c c8 32 4c 57 25 30 bc a3 26 c1 0c 93 ; [$a17c] undefined
    hex 26 c3 32 8c 33 23 80 c1 00 c4 72 4c 30 0c 6b 10 ; [$a18c] undefined
    hex 71 0c 45 00 03 11 c8 d3 0e c4 43 1a 31 8c 38 c4 ; [$a19c] undefined
    db $4c,$4b,$0e,$c9,$32,$6c,$38          ; [$a1ac] undefined

FOREPAW_BLOCKS_SCREEN_45:                   ; [$a1b3]
    hex cb f2 5c 0c c1 f1 4c 0f 25 ca 32 6c 4f 28 c9 72 ; [$a1b3] undefined
    hex 83 1e c1 b2 8c d9 5c 06 c9 b1 1c 33 27 11 5c 2f ; [$a1c3] undefined
    hex 28 c5 07 25 70 e3 11 4c 97 14 c1 72 5c 07 25 70 ; [$a1d3] undefined
    hex 1c 97 28 c8 30 8c 41 c8 f2 5c 79 c1 30 3c 1f 32 ; [$a1e3] undefined
    hex c0 73 99 70 e3 23 c9 1c 50 c1 67 04 a1 5c 47 24 ; [$a1f3] undefined
    hex c4 f1 e4 c0 d7 32 ce 5c 97 20 c4 ec 93 28 c9 44 ; [$a203] undefined
    hex ca 30 5c c3 01 c0 d7 28 c3 31 2c 4d 73 9c c0 c9 ; [$a213] undefined
    hex b0 6c 07 03 32 51 71 1a 41 c8 30 5c 0f 25 30 bc ; [$a223] undefined
    hex a3 26 c4 70 e9 c3 32 87 33 c3 30 48 c0 d5 43 12 ; [$a233] undefined
    hex 4c 6b 13 71 09 0c 13 05 00 30 40 c4 43 1a c1 14 ; [$a243] undefined
    db $c4,$4c,$49,$c9,$32,$67,$05          ; [$a253] undefined

FOREPAW_BLOCKS_SCREEN_46:                   ; [$a25a]
    hex c1 34 1c 17 03 d0 4c 0f 40 32 6d 03 28 c9 74 0c ; [$a25a] undefined
    hex a0 c0 4c 13 41 c1 31 4d 02 c9 ac 33 27 d0 32 89 ; [$a26a] undefined
    hex cc 31 43 40 c5 0c 07 25 2c 3b 04 8c 97 04 73 2c ; [$a27a] undefined
    hex c2 32 53 28 c8 1c 43 11 c8 f2 53 14 43 32 cc 70 ; [$a28a] undefined
    hex 11 c9 b0 e3 23 c9 1c 52 40 9d 03 04 d0 70 4d 03 ; [$a29a] undefined
    hex 24 c4 d0 43 32 c5 1c 97 20 c4 f1 1c 93 28 c9 74 ; [$a2aa] undefined
    hex 00 4c 52 c0 72 53 28 32 0c 4d 73 9c 53 01 71 4c ; [$a2ba] undefined
    hex 07 03 11 02 4c a3 25 5c 0f 25 30 bc a3 26 c4 b1 ; [$a2ca] undefined
    hex 30 c3 32 8c 33 33 c5 30 bc 97 26 c1 1c 33 0e 0c ; [$a2da] undefined
    hex 49 4c 6b 27 c1 43 04 0c 14 30 43 05 30 40 c4 43 ; [$a2ea] undefined
    hex 1a 70 50 c1 0d 04 c9 34 1d 03 39    ; [$a2fa] undefined

FOREPAW_BLOCKS_SCREEN_47:                   ; [$a305]
    hex c1 34 1c a3 07 ca 32 4c 0f 25 c9 8c 38 c4 70 ec ; [$a305] undefined
    hex a3 04 31 1c 4e 31 4c 97 0c 70 ec 33 20 2b 05 ca ; [$a315] undefined
    hex 31 3b 25 c5 0c a3 20 c4 72 4c 9b 27 ca 32 4c 9b ; [$a325] undefined
    hex 04 c9 72 08 72 50 ca 32 6c 43 11 b2 5c 47 05 c0 ; [$a335] undefined
    hex e8 d0 03 28 c9 b0 e3 23 c9 87 04 cc 2b 28 c9 70 ; [$a345] undefined
    hex 1c 96 c1 34 0c 10 ca 31 1d 05 d0 03 33 43 20 c4 ; [$a355] undefined
    hex f1 1c 93 26 1c 17 40 c2 f0 13 14 c0 53 28 32 0c ; [$a365] undefined
    hex 9b 11 30 5c 13 30 c9 53 03 b0 b5 c9 b1 1c 38 54 ; [$a375] undefined
    hex 4c 0f 25 27 26 c4 b0 e3 11 c1 70 4c 4f 28 72 8b ; [$a385] undefined
    hex 26 c3 2c 33 0e 0c 4b 13 5c a3 03 c1 00 03 05 30 ; [$a395] undefined
    hex 4c 14 c1 32 8c 2c c4 41 d0 4c 83 11 c4 b2 3d 05 ; [$a3a5] undefined
    db $48                                  ; [$a3b5] undefined

FOREPAW_BLOCKS_SCREEN_48:                   ; [$a3b6]
    hex ce f2 10 00 00 00 77 dd 6c df 35 bd f3 5b df 35 ; [$a3b6] undefined
    hex bd f3 5b df 35 bd f3 5b 76 8d d3 75 dc f7 4d cf ; [$a3c6] undefined
    hex 75 dc f7 4d cf 75 dc f7 4d cf 75 77 bd ab 5c 75 ; [$a3d6] undefined
    hex c7 5c 75 c7 5c 75 c7 5c 5d 9f 70 77 07 70 77 07 ; [$a3e6] undefined
    hex 70 77 07 70 76 9d bf 5c 77 67 77 77 67 77 77 67 ; [$a3f6] undefined
    hex 77 76 8d 53 5d 75 c7 5c 75 c7 5c 75 c7 5c 5d 57 ; [$a406] undefined
    hex 70 77 07 70 77 07 70 77 07 7a 75 90 00 03 6a 77 ; [$a416] undefined
    hex ad 93 6e 76 8d 53 2c dc f2 cd cf 2c dc f2 cd cf ; [$a426] undefined
    hex 2c 76 ed f3 0f 5c 3c 70 f7 57 75 77 57 de b6 ad ; [$a436] undefined
    hex cf 54 5d ef 6a 75 47 54 75 57 54 76 87 0f de 47 ; [$a446] undefined
    db $79,$00,$00,$00                      ; [$a456] undefined

FOREPAW_BLOCKS_SCREEN_49:                   ; [$a45a]
    hex c8 40 00 00 de 80 d6 cd f3 5b df 75 bd f3 5b 0d ; [$a45a] undefined
    hex f3 5b 43 7d d5 30 fd cf 54 c3 f5 7d cf 54 d5 4d ; [$a46a] undefined
    hex cf 54 db 9d a7 6f c3 f5 77 5c d5 f5 c7 5c cb 35 ; [$a47a] undefined
    hex c7 5c cb 2d f3 5c 75 57 70 b7 07 70 b7 07 70 b7 ; [$a48a] undefined
    hex 0d cf 70 57 5c d7 67 5c d7 67 5c d7 67 5c 75 45 ; [$a49a] undefined
    hex dc 15 dc 15 dc 15 de b6 a7 70 cb 27 70 d5 e7 70 ; [$a4aa] undefined
    hex cb 27 70 d6 ed 93 2c 07 2c 07 2c 07 2c c3 f6 ed ; [$a4ba] undefined
    hex bd dc 15 dc 15 dc 15 75 4d eb 6a d5 30 f7 57 c3 ; [$a4ca] undefined
    hex f5 77 57 c3 f5 77 54 77 b7 68 c3 f5 77 54 75 57 ; [$a4da] undefined
    hex 54 75 47 0f de 5d e4 00 00 00       ; [$a4ea] undefined

FOREPAW_BLOCKS_SCREEN_50:                   ; [$a4f4]
    hex de 80 00 03 66 de 83 2a 4d 99 d9 9d 99 d9 9d f7 ; [$a4f4] undefined
    hex 5b df 5d ef 3a d6 cd f3 5b 13 7d d6 ed 93 54 d5 ; [$a504] undefined
    hex 76 67 2a c3 f5 7d cf 5c d5 f6 67 68 c3 f6 ed cb ; [$a514] undefined
    hex 5c cb 36 e7 3a d7 35 57 70 b6 e9 d4 77 0d cf 2c ; [$a524] undefined
    hex d4 67 2a d7 67 5c d7 6d f3 56 d9 c0 07 3a dc 15 ; [$a534] undefined
    hex dc 1d cf 5c dc 35 cd f3 5c dc 35 c7 2a cb 27 70 ; [$a544] undefined
    hex cb 27 70 d5 ed cf 70 d5 e7 3a c3 e7 2c 07 2c 07 ; [$a554] undefined
    hex 2c 07 2a cb 25 df 95 df 95 df 97 3a c3 f5 47 0f ; [$a564] undefined
    hex b5 57 55 b5 57 57 b5 4d f3 2a 75 55 35 77 54 d5 ; [$a574] undefined
    hex d7 54 c3 dd cf 3a de 43 6a 77 a0 36 ac b3 7a 03 ; [$a584] undefined
    db $2a                                  ; [$a594] undefined

FOREPAW_BLOCKS_SCREEN_51:                   ; [$a595]
    hex ce f2 10 00 00 00 77 d0 00 03 5b df 40 5d 70 00 ; [$a595] undefined
    hex 00 00 5d 74 00 00 00 5d d3 75 dd 37 5d d3 75 dd ; [$a5a5] undefined
    hex 37 5d d3 75 dd 37 5d d3 75 5d da b7 7d da b7 7d ; [$a5b5] undefined
    hex da b7 7d da 5d d2 dd ed d2 dd ed d2 dd ed d2 5d ; [$a5c5] undefined
    hex db 77 b7 0d db 77 ad db 77 ad db 77 5c b3 1b cb ; [$a5d5] undefined
    hex 30 fc b3 0f cb 30 fc b3 0f cb 30 fc b3 0f 77 bd ; [$a5e5] undefined
    hex 46 d5 6d 46 d5 6d 46 df ad 46 5d 67 67 d6 76 7d ; [$a5f5] undefined
    hex 67 67 d6 76 73 59 36 7d 64 5d a7 5d 35 7d 74 d5 ; [$a605] undefined
    hex f5 d3 54 d7 4c 3f 5d 5d a1 30 f4 d5 13 55 4d 55 ; [$a615] undefined

FOREPAW_BLOCKS_SCREEN_52:                   ; [$a625]
    hex c8 40 00 00 00 df 4d 6c 00 00 03 3a d7 00 00 37 ; [$a625] undefined
    hex 33 2d cb 35 ed 7f 2a d7 40 03 7e d7 72 dc d3 5e ; [$a635] undefined
    hex d7 f2 dd 8f 3a dd 37 5d d3 75 dd 37 57 70 37 ec ; [$a645] undefined
    hex fb 63 cb 35 ed 7f 2a dd 77 7d da b7 7d c3 74 dd ; [$a655] undefined
    hex 6d cf 5e d7 f2 dd 8f 3a dd ed d2 dd ed 73 76 dd ; [$a665] undefined
    hex f5 cc fb 63 cb 35 ed 7f 2a dd ad db 77 ad c2 37 ; [$a675] undefined
    hex 0d cf 5e d7 f2 dc d3 3a cb 30 fc b3 1b cb 30 fc ; [$a685] undefined
    hex b2 32 dd 8c cb 35 ed 7f 2a c3 ed 38 4d 38 cb 37 ; [$a695] undefined
    hex 33 5e d7 f2 dd 8f 3a d6 43 67 d6 76 7d 67 67 d6 ; [$a6a5] undefined
    hex 76 73 59 36 7d 67 2a d7 4d 5f 5d 35 7d 74 d5 f5 ; [$a6b5] undefined
    hex d3 54 d7 4c 3f 3a 45 30 f4 d5 13 55 4d 57 2a ; [$a6c5] undefined

FOREPAW_BLOCKS_SCREEN_53:                   ; [$a6d4]
    hex c8 4d ef 21 00 00 00 ce f7 d7 7d df 35 b3 7c d6 ; [$a6d4] undefined
    hex cd f3 5b 37 cd 6f 3a 76 87 68 dc f2 dc d3 73 cb ; [$a6e4] undefined
    hex 73 4d cf 2d cd 37 3c b7 2a 55 76 21 d8 87 62 1d ; [$a6f4] undefined
    hex 8b 3a 55 72 c1 df b2 c7 2c 1d 53 2a 55 5d 51 cb ; [$a704] undefined
    hex 07 7e 5c b3 3a 5d bb 6f 77 4d d5 dd 37 57 74 dd ; [$a714] undefined
    hex 5d d3 2a 5c 3c 75 c1 d7 07 5c 1d 73 3a 57 1b 77 ; [$a724] undefined
    hex 6d dd dd b7 77 76 dd dd ef 2a 76 70 00 00 07 67 ; [$a734] undefined
    hex 76 8c 3c 00 00 0d bb 6f 5d ef 6a cb 04 cb 04 cb ; [$a744] undefined
    db $08,$77,$97,$79,$00,$00,$00          ; [$a754] undefined

FOREPAW_BLOCKS_SCREEN_54:                   ; [$a75b]
    hex ce f7 bd e4 00 00 00 50 36 0d ec 36 01 0d 83 7b ; [$a75b] undefined
    hex 50 14 13 7b 05 77 dd 6c 43 7d 51 00 76 8d d3 75 ; [$a76b] undefined
    hex db 9d a7 6f 5d ec df 75 b7 7d 5d db 77 c3 ed bf ; [$a77b] undefined
    hex 1b 43 69 db f5 7d bb 6f 77 ad ab 55 c3 60 db 9d ; [$a78b] undefined
    hex a7 6f c6 f5 4c 3c 5d a1 d5 35 cd d3 75 d7 2d bf ; [$a79b] undefined
    hex 5c dd 37 5d 71 76 9b 6a d7 35 dd db 77 d7 63 5d ; [$a7ab] undefined
    hex dd b7 7d 76 d6 76 87 68 dc 37 6d de b7 03 76 dd ; [$a7bb] undefined
    hex eb 70 c3 cd ba da b5 7c 3c d5 f0 f0 d5 70 fd 53 ; [$a7cb] undefined
    hex 0f 01 da 32 cd d3 75 cb 0d d3 75 cb 0d d3 75 de ; [$a7db] undefined
    db $40,$00,$00,$00                      ; [$a7eb] undefined

FOREPAW_BLOCKS_SCREEN_55:                   ; [$a7ef]
    hex de 43 68 c3 f7 90 36 ac 3f 79 03 3a de c1 76 ed ; [$a7ef] undefined
    hex 6c 36 87 6e d6 c0 df 41 d3 8c 3f 4e 30 fd 38 c3 ; [$a7ff] undefined
    hex f4 e3 0f dd b7 7c 6f 0f dd b7 7d 5f 76 dd dd db ; [$a80f] undefined
    hex 77 77 6d dd cb 37 0c 3c dc 32 cd 57 70 cb 1d c3 ; [$a81f] undefined
    hex 7b da b7 0c b1 00 03 57 c3 cd 5d d9 c0 43 55 c3 ; [$a82f] undefined
    hex 53 55 4d 57 6e db f5 4c 3c 35 6d 9f 2a ca f6 a7 ; [$a83f] undefined
    hex 54 40 0d 5d 32 cc f3 3a ce f6 70 03 6a 75 5b 54 ; [$a84f] undefined
    hex 43 2a ca f6 9c f0 03 0f 35 44 32 c7 3a ce f6 8c ; [$a85f] undefined
    hex 3f 4e d7 35 4d 3b 5c d5 74 ed 47 57 4d ed 77 bd ; [$a86f] undefined
    hex ab 2c d7 72 c3 5d cb 0d 4f 2c de 45 5d e4 00 00 ; [$a87f] undefined

FOREPAW_BLOCKS_SCREEN_56:                   ; [$a88f]
    hex ce f7 bd a3 5d 30 fd 74 c3 f5 d3 0f d7 4c 3f 5d ; [$a88f] undefined
    hex df 57 70 35 cd c0 d7 37 03 5c dc 0d 73 70 c3 f6 ; [$a89f] undefined
    hex ed bf 74 dd 6d d3 75 b7 4d d6 dd 37 5b 74 4d 73 ; [$a8af] undefined
    hex 76 dd f5 cd db 77 d7 37 6d df 5c dd b7 7d 73 76 ; [$a8bf] undefined
    hex 4d c3 0f 37 0d 57 0f dc 35 7d 53 70 c3 cd c3 0f ; [$a8cf] undefined
    hex d6 76 70 d6 76 ac 3f 57 d5 b5 93 67 00 83 55 c3 ; [$a8df] undefined
    hex 70 f3 55 c3 cd 57 0f 35 4c 3c 35 5d 5e 03 54 40 ; [$a8ef] undefined
    hex 0d 5d 35 4d 3b 54 74 ed 53 55 d3 93 4e 75 5d 3b ; [$a8ff] undefined
    hex 54 4d 47 0f d5 f5 1d 57 0f d4 53 51 75 4d 47 0f ; [$a90f] undefined
    hex 34 ed 4d d3 b5 3c 3f 4e d4 f5 4d 3b 53 d5 74 ed ; [$a91f] undefined
    hex 4f 57 72 c5 cb 17 2c 72 c1 cb 07 2c de 40 00 00 ; [$a92f] undefined
    db $00                                  ; [$a93f] undefined

FOREPAW_BLOCKS_SCREEN_57:                   ; [$a940]
    hex d7 71 bc 3f 5d 30 fd 74 c3 f5 d3 0f d7 4c 3f 21 ; [$a940] undefined
    hex dc 35 c3 70 35 cd c0 d7 37 03 5c dc 0d 73 5b dd ; [$a950] undefined
    hex 63 74 dd 6d d3 75 b7 4d d6 dd 37 5b 74 dd f5 c3 ; [$a960] undefined
    hex 76 dd f5 cd db 77 d7 37 6d df 5c dd b7 7d 73 76 ; [$a970] undefined
    hex c3 f7 03 0f 37 0d 57 0f dc 35 7d 53 70 c3 cd c3 ; [$a980] undefined
    hex 0f d6 76 70 d6 76 70 35 93 67 00 83 55 c3 70 f3 ; [$a990] undefined
    hex 55 c3 cd 57 0f 35 4c 3c 31 bd 5e 00 00 0d 5d 0d ; [$a9a0] undefined
    hex 39 34 ed 53 55 d3 93 4e 75 5d 3b 54 4d 45 d5 f5 ; [$a9b0] undefined
    hex 1d 57 0f d4 53 51 75 4d 47 0f 34 ed 4d d3 b5 3c ; [$a9c0] undefined
    hex 3f 4e d4 f5 4d 3b 53 d5 74 ed 4f 57 72 c5 cb 17 ; [$a9d0] undefined
    hex 2c 72 c1 cb 07 2c de 40 00 00 00    ; [$a9e0] undefined

FOREPAW_BLOCKS_SCREEN_58:                   ; [$a9eb]
    hex c8 40 00 00 00 d6 c0 00 00 03 3a dd 77 03 74 dd ; [$a9eb] undefined
    hex 77 0d d3 75 dc 37 4d d7 70 dd 37 5d c3 2a dd f5 ; [$a9fb] undefined
    hex c3 76 dd f5 cd db 77 d7 37 6d df 5c dd b7 7d 73 ; [$aa0b] undefined
    hex 3a c3 f7 03 22 37 0c 88 dc 35 7d 53 70 c3 cd c3 ; [$aa1b] undefined
    hex 2a d6 76 70 d6 76 7d 67 6a d5 b5 9d ab 22 43 3a ; [$aa2b] undefined
    hex c3 c3 55 c3 70 f3 55 c3 cd 5b 67 da b5 4d ef 2a ; [$aa3b] undefined
    hex 71 bd 5e 00 00 d5 b6 77 3a 4d 39 34 ed 53 55 d3 ; [$aa4b] undefined
    hex 93 4e b5 57 2a 74 ed 45 d3 b5 1d 57 4e d4 5d 3b ; [$aa5b] undefined
    hex 51 75 4d bb 3a 75 5d 4d d5 75 3c 3e d4 f5 4d 57 ; [$aa6b] undefined
    hex 53 d5 6d 57 2a 72 c7 22 cb 1c 8b 2c 72 2c b1 cb ; [$aa7b] undefined
    db $32,$21,$de,$40,$00,$00,$00          ; [$aa8b] undefined

FOREPAW_BLOCKS_SCREEN_59:                   ; [$aa92]
    hex ca f7 dd ec 03 7d d6 c0 00 5d 6c 07 69 cb 03 57 ; [$aa92] undefined
    hex c3 cc b3 0f 5c b0 07 68 4d 56 d5 32 c1 54 0d bb ; [$aaa2] undefined
    hex 6f 40 30 f0 54 cb 53 2d 40 c3 64 77 bd a9 25 75 ; [$aab2] undefined
    hex 7c b5 de f6 a4 5d 9c 00 d9 20 76 70 5d 7b 5f cb ; [$aac2] undefined
    hex 73 4c b0 37 e7 7e 76 8c b3 3a 5d a3 2c d7 b5 fc ; [$aad2] undefined
    hex fb 34 4c b6 57 2a 77 dd 7b 5f cb 73 4d 79 72 dd ; [$aae2] undefined
    hex 52 db b6 fc 3f 3a 5c b0 d7 b5 fc f9 4b 2c b2 cd ; [$aaf2] undefined
    hex 57 2a 5d 7b 5f cb 73 4d 79 72 d8 01 de 40 00 00 ; [$ab02] undefined
    db $03,$3a                              ; [$ab12] undefined

FOREPAW_BLOCKS_SCREEN_60:                   ; [$ab14]
    hex ca f7 d0 00 d6 c0 00 c3 c0 00 0d 5b 67 da b0 f0 ; [$ab14] undefined
    hex 32 c1 cb 07 2c 17 59 72 c1 1c 3c 75 45 c3 c5 70 ; [$ab24] undefined
    hex f5 00 35 54 05 50 00 0d 5d 37 b5 de e4 d6 4d 9c ; [$ab34] undefined
    hex d6 76 ab 56 d9 d5 76 70 ce f7 dc 3c c6 c7 2c 15 ; [$ab44] undefined
    hex da 76 fc b3 0f ca d7 5c 75 c7 5c 55 da b5 c7 5c ; [$ab54] undefined
    hex ce dd 73 5d b5 db 5d b6 e5 00 ca dd c1 dc 1d c1 ; [$ab64] undefined
    hex 20 00 77 bd aa c3 ec 3e 0d 5b 67 da b7 0d ef 6a ; [$ab74] undefined
    db $ce,$dd,$e4,$00,$00,$07,$79          ; [$ab84] undefined

FOREPAW_BLOCKS_SCREEN_61:                   ; [$ab8b]
    hex ca f7 dd ef 3a ce f7 bd f4 d6 c0 03 3a c3 c5 5d ; [$ab8b] undefined
    hex a3 0f 0d 54 c3 c1 72 cd bb 5b 17 2c 72 cd 53 2c ; [$ab9b] undefined
    hex 72 c7 2a 5c 3f 56 d6 65 55 57 3a 41 76 ac 3c 0d ; [$abab] undefined
    hex 57 0f 03 2a 41 5d 5d 0d 53 57 4d ef 3a d6 4d 9f ; [$abbb] undefined
    hex 6a cb 35 6d 64 d9 c0 07 2a cb 30 fc b3 0f c6 cc ; [$abcb] undefined
    hex 3c 03 55 c3 c7 3a 75 c7 5c de f6 a7 5c 75 c7 5c ; [$abdb] undefined
    hex d5 f5 c7 2a d6 76 73 59 76 8d 73 5d b5 db 5d b5 ; [$abeb] undefined
    hex dd bb 3a d7 00 db b6 fd c1 dc 1d c1 dc 1d c3 2a ; [$abfb] undefined
    hex dc 00 d5 35 7c 3e d5 6d 52 c3 ed 5f 3a de 40 00 ; [$ac0b] undefined
    db $00,$00                              ; [$ac1b] undefined

FOREPAW_BLOCKS_SCREEN_62:                   ; [$ac1d]
    hex ce f7 bd f7 5b 00 00 0d ef 3a ca dd a3 0f 00 0d ; [$ac1d] undefined
    hex 54 c3 c5 57 3e cd 35 ed 7f 3e cd 35 ed 7f 3e cd ; [$ac2d] undefined
    hex 35 e7 2a 57 54 d5 72 c3 57 c3 f2 c3 54 d5 72 c7 ; [$ac3d] undefined
    hex 3a ce dd 9c 03 6a cb 36 70 07 2a ca dd a3 0f 0c ; [$ac4d] undefined
    hex b0 0d 53 57 c3 c7 3a ce d5 d7 1d d3 75 dd 37 5d ; [$ac5d] undefined
    hex 5f 5c 47 2a ca d7 74 dd 4d da d5 f7 7d d0 dd 57 ; [$ac6d] undefined
    hex 3a ce f6 9d bf 76 37 7d 53 57 dd f7 5d db 77 1d ; [$ac7d] undefined
    hex bb 2a da f1 bc 3f 55 d5 f5 4d db 77 dd ad 57 54 ; [$ac8d] undefined
    hex c3 c3 3a db 32 20 d5 2c b0 0c 88 03 2a de 40 00 ; [$ac9d] undefined
    db $00,$00,$00,$00,$00,$00              ; [$acad] undefined

FOREPAW_BLOCKS_SCREEN_63:                   ; [$acb3]
    hex c8 40 00 00 00 ca f7 dd 6c 00 00 00 76 9c b3 5e ; [$acb3] undefined
    hex d7 f2 cd 53 5c 0c 3f 54 d5 f5 c0 76 85 5d d3 75 ; [$acc3] undefined
    hex dc 37 4d d5 dd 37 5d c3 74 ce d5 5d db 77 d7 37 ; [$acd3] undefined
    hex 6d df 0f dd b7 7d 73 76 ca d5 5d 57 74 77 5c 3f ; [$ace3] undefined
    hex 57 d5 77 47 75 ce d5 5c 3f 76 dc 37 7d 5e b7 6d ; [$acf3] undefined
    hex c3 77 ca d5 53 5c cb 35 cc b1 35 cc 3f 5c 55 5c ; [$ad03] undefined
    hex 3f 5d c3 f5 dc 3c 35 d7 5d ce f7 bd a9 57 7e 5d ; [$ad13] undefined
    hex 57 54 d5 f7 e5 ca dd 9c 0d ab 5d d5 17 0f 35 dd ; [$ad23] undefined
    hex 5d ce dd eb 6a d7 b5 fc b3 67 0d ab 67 0d ab 67 ; [$ad33] undefined
    hex 57 68 cf b3 47 0f d7 37 0d 73 0f d7 37 0d 73 0f ; [$ad43] undefined

FOREPAW_BLOCKS_SCREEN_64:                   ; [$ad53]
    hex c8 40 00 00 00 d6 c0 00 00 00 c3 f5 4d 57 5c 0c ; [$ad53] undefined
    hex 3f 54 c3 f5 c0 c3 f1 bc 3c dd 75 5d d3 75 dc 37 ; [$ad63] undefined
    hex 4d d7 55 dd 37 5d c3 74 dd 60 dd f0 fd db 77 d7 ; [$ad73] undefined
    hex 37 6d df 54 dd b7 7d 73 76 dd d3 3a b5 4b 5c 0d ; [$ad83] undefined
    hex 54 c3 f5 c0 c3 cd ed 71 bd 5f 70 0c 6f 0f d5 f7 ; [$ad93] undefined
    hex 00 d5 b6 75 cb 1c b3 5c cb 35 cc b2 cb 35 cc b3 ; [$ada3] undefined
    hex 5c cb 30 f5 c3 dd 5f 5d c3 f5 dc 6f 0f 35 dc 3f ; [$adb3] undefined
    hex 5d c3 f0 dd b9 75 4c 3d 5c 3e 77 ed 55 d5 e1 75 ; [$adc3] undefined
    hex 55 c6 dc 6e d5 35 dd 5d c3 cc 35 d6 47 56 d6 4d ; [$add3] undefined
    hex ab 56 d9 f5 9d ab 56 d9 f5 9d a9 d7 37 0d 72 d7 ; [$ade3] undefined
    hex 37 0d 73 1b d7 37 0d 73 70 d7 30 f1 ; [$adf3] undefined

FOREPAW_BLOCKS_SCREEN_65:                   ; [$adff]
    hex c8 40 00 00 00 d6 c0 00 00 00 c3 f5 4d 7b 5f cf ; [$adff] undefined
    hex b2 cc fb 2c cf b2 cd 7b 5f cf b2 cc fb 2c d5 dc ; [$ae0f] undefined
    hex b0 cf 1d 7b 5f b3 cc fb 2c cf 1d 7b 5f ce f5 90 ; [$ae1f] undefined
    hex 00 00 00 76 9c fb 2c cf 32 cd 7b 5f cf b2 cc fb ; [$ae2f] undefined
    hex 2c 35 ec b3 5e 76 8d 7b 5f 80 35 eb 5e cb 6a 5c ; [$ae3f] undefined
    hex fb 2c 35 e7 5e cf ab 2d cb 35 ea 5c b3 5e cb 6b ; [$ae4f] undefined
    hex 2d cb 35 ea cf 2a 57 2d cb 35 ea aa 35 e8 5c 3f ; [$ae5f] undefined
    hex 5e ac b6 93 3c 54 77 ad ab 2c 75 eb 3c 8c f2 ac ; [$ae6f] undefined
    db $f1,$77,$90,$00,$00,$00              ; [$ae7f] undefined

FOREPAW_BLOCKS_SCREEN_66:                   ; [$ae85]
    hex c8 40 00 00 00 d6 c0 00 00 00 cb 72 cd 7b 5f cf ; [$ae85] undefined
    hex b3 4c fb 34 cf b2 cd 7b 5f cf b3 4c fb 34 5c b7 ; [$ae95] undefined
    hex 2c da 6d 7b 5f 76 9c fb 2c da 61 d9 cd 67 5f cf ; [$aea5] undefined
    hex b3 4c b0 73 4d 7b 5f cf b3 45 cb 36 9c fb 56 d9 ; [$aeb5] undefined
    hex cd 67 5f 5c fb 34 35 e5 76 8d 7b 5f cb 03 56 d9 ; [$aec5] undefined
    hex cd 67 5e cb 65 5c b7 2c 35 e7 5e cf b2 cd 7b 56 ; [$aed5] undefined
    hex d9 c3 59 57 5e cb 6b 2d cb 35 ea da 72 cd 7b 2c ; [$aee5] undefined
    hex d7 a4 cb 35 ea aa 35 e8 53 5e ac b6 93 69 54 36 ; [$aef5] undefined
    hex 9c b6 75 eb 69 8d a6 ad a5 de 40 00 00 00 ; [$af05] undefined

FOREPAW_BLOCKS_SCREEN_67:                   ; [$af13]
    hex c8 40 00 00 00 d6 c0 00 00 00 cb 76 30 33 4c fb ; [$af13] undefined
    hex 34 cf b2 cd 7b 5f cf b3 4c fb 34 50 1d 7b 5f 76 ; [$af23] undefined
    hex 9c fb 2c da 61 53 34 cb 00 73 4d 7b 5f cf b5 90 ; [$af33] undefined
    hex 76 9c f9 43 5f 75 90 35 ec fb 5e 76 8d 7b 5f 75 ; [$af43] undefined
    hex 90 36 ac b3 5e cb 73 4b 34 d9 c0 35 ec b3 5e cf ; [$af53] undefined
    hex b2 cd 7b 3e cd 33 ea cb 36 8c d3 5e cb 73 4b 2d ; [$af63] undefined
    hex cb 35 ea da 72 cd 7b 2c ac b4 cd 35 ec b2 ab 3e ; [$af73] undefined
    hex cd 35 ec fb 34 50 cf a7 3e cd 33 ec d3 2c 00 36 ; [$af83] undefined
    hex 9c b7 34 75 1b 51 b5 17 51 cf b5 1c d1 de 40 00 ; [$af93] undefined
    db $00,$00                              ; [$afa3] undefined

FOREPAW_BLOCKS_SCREEN_68:                   ; [$afa5]
    hex c8 40 00 00 00 d6 f7 dd 6f 7d d6 f7 dd 6c 00 03 ; [$afa5] undefined
    hex 3a cb 32 dd 8f 68 d8 f6 8c fb 34 cf b2 cd 7b 5f ; [$afb5] undefined
    hex cf b3 4c fb 2a 5c d3 3e 73 4d 7b 5f 76 9c fb 2c ; [$afc5] undefined
    hex da 63 3a d6 43 2d cd 33 eb 3e cd 0d 7b 5f cf b2 ; [$afd5] undefined
    hex c3 2a cb 76 9c f3 56 d9 cd 67 5f b6 30 cb 35 ec ; [$afe5] undefined
    hex fb 3a 76 8c b3 5f cb 72 c3 56 d9 cd 67 5e cb 73 ; [$aff5] undefined
    hex 4d ef 2a cb 00 35 e7 5e cf b2 cd 7b 56 d6 47 3a ; [$b005] undefined
    hex 76 8c d3 5e cb 73 4b 2d cb 35 ea cb 07 2a 4c b4 ; [$b015] undefined
    hex cd 35 ec b2 ab 3e cd 35 ed a7 3a 40 00 00 03 2a ; [$b025] undefined
    hex 75 1c b7 51 cf b5 1c d3 51 cf b5 1c d3 51 cf b5 ; [$b035] undefined
    hex 1c d3 3a de 40 00 00 00             ; [$b045] undefined

FOREPAW_BLOCKS_SCREEN_69:                   ; [$b04d]
    hex c8 40 00 00 00 ce f7 d0 00 00 00 76 8d d3 75 cb ; [$b04d] undefined
    hex 35 7d d3 75 cb 35 4d d3 75 cb 35 4d d3 75 5d d6 ; [$b05d] undefined
    hex b7 4d d6 b7 4d d6 b7 4d d6 5d c0 00 00 00 5d 5b ; [$b06d] undefined
    hex 67 35 9d ab 5c d5 b5 9d ab 5c d5 b6 70 5d 70 03 ; [$b07d] undefined
    hex 5d 83 5d 80 5d 77 70 d7 77 0d 77 70 df b7 0d 77 ; [$b08d] undefined
    hex 70 b7 0d 77 70 5d c3 2c b2 cb 2c b2 cb 2c b2 cb ; [$b09d] undefined
    hex 2c 5d 39 d3 9d 39 d3 9d 39 d3 9d 39 da f6 fd 45 ; [$b0ad] undefined
    hex d4 5d 45 d4 5d 45 d4 5d 45 db 32 2d 4f 22 d4 f2 ; [$b0bd] undefined
    hex 2d 4f 22 d4 f2 2d 4f 22 d4 f2 2d 4d de 40 00 00 ; [$b0cd] undefined
    db $00                                  ; [$b0dd] undefined

FOREPAW_BLOCKS_SCREEN_70:                   ; [$b0de]
    hex c8 40 00 00 00 df 40 00 00 00 cb 35 5d d3 75 cb ; [$b0de] undefined
    hex 35 7d d3 75 cb 35 4d d3 75 cb 35 4d d3 75 37 4d ; [$b0ee] undefined
    hex d6 b7 4d d6 b7 4d d6 b7 4d d6 dc 00 00 00 00 d9 ; [$b0fe] undefined
    hex c0 35 9d ab 5c d5 b6 7d 67 6a d7 35 6d 9c d7 03 ; [$b10e] undefined
    hex 5d d7 03 5d 80 d7 60 d7 77 0d 77 70 b7 0d 77 70 ; [$b11e] undefined
    hex df b7 0d 77 70 77 0d 77 70 32 cb 2c b2 cb 2c b2 ; [$b12e] undefined
    hex cb 2c b2 cb 2c d3 9d 39 d3 9d 39 d3 9d 39 d3 9d ; [$b13e] undefined
    hex 39 d4 5d 45 d4 5d 45 d4 5d 45 d4 5d 45 d4 f2 2d ; [$b14e] undefined
    hex 4f 22 d4 f2 2d 4f 22 d4 f2 2d 4f 22 d4 f2 2d 4d ; [$b15e] undefined
    db $de,$40,$00,$00,$00                  ; [$b16e] undefined

FOREPAW_BLOCKS_SCREEN_71:                   ; [$b173]
    hex c8 40 00 00 00 df 40 00 00 00 cb 35 5d d3 75 cb ; [$b173] undefined
    hex 35 7d d3 75 cb 35 4d d3 75 cb 35 4d d3 75 37 4d ; [$b183] undefined
    hex d6 b7 4d d6 b7 4d d6 b7 4d d6 dc 00 00 00 0d ef ; [$b193] undefined
    hex 6a d9 c0 00 35 9d ab 5c d5 b6 77 2a d7 00 00 03 ; [$b1a3] undefined
    hex 5d 87 3a d7 77 0d 77 70 d7 77 0d 77 70 df b7 0d ; [$b1b3] undefined
    hex 77 70 b7 07 2a dc 32 cb 2c b2 cb 2c b2 cb 2c b2 ; [$b1c3] undefined
    hex c7 3a d3 9d 39 d3 9d 39 d3 9d 39 d3 9d bb 2a d4 ; [$b1d3] undefined
    hex 5d 45 d4 5d 45 d4 5d 45 d4 5d 47 3a d4 f2 2d 4f ; [$b1e3] undefined
    hex 22 d4 f2 2d 4f 22 d4 f2 2d 4f 22 d4 f2 2d 4f 2a ; [$b1f3] undefined
    db $de,$40,$00,$00,$03,$3a              ; [$b203] undefined

FOREPAW_BLOCKS_SCREEN_72:                   ; [$b209]
    hex c8 77 bd eb 68 d7 b5 fc d3 5d 00 00 df 55 cb 73 ; [$b209] undefined
    hex 4c b1 dc 1d c1 dc 1d c1 cb 15 d7 b5 fb 70 d7 2d ; [$b219] undefined
    hex 72 d7 2d 72 dd 55 cb 73 4c b3 5d 00 00 95 d7 b5 ; [$b229] undefined
    hex fb 5c dc 35 cd c3 5c dc 35 cd c3 5c ca d5 cb 73 ; [$b239] undefined
    hex 4c b3 5d b5 db 5d b5 db 5d ce d5 d7 b5 fb 70 b7 ; [$b249] undefined
    hex 0b 70 b7 0b 70 ca d7 7b da b7 bd ab 74 77 5b 74 ; [$b259] undefined
    hex 77 5b 74 ce d5 de 9d a3 76 dc 37 7d 73 76 dc 37 ; [$b269] undefined
    hex 7d 73 76 ca f7 dd 6c 76 9d bf 54 c3 f5 4d 77 54 ; [$b279] undefined
    hex c3 f5 5d 77 0f ce f6 8d 57 54 76 8c 3f 55 ad fb ; [$b289] undefined
    hex 55 2d f9 ca dc 3d 5d 50 c3 f5 5d 77 0f d5 ed 77 ; [$b299] undefined
    db $55,$ce,$f7,$90,$00,$00,$00          ; [$b2a9] undefined

FOREPAW_BLOCKS_SCREEN_73:                   ; [$b2b0]
    hex d7 40 00 00 0c b3 3a dc 1d c1 dc 1d c1 dc 1d c1 ; [$b2b0] undefined
    hex dc 15 d7 2d 72 d7 2d 72 d7 2d 72 d7 25 d7 40 03 ; [$b2c0] undefined
    hex 7e d7 40 05 dc 35 cd c3 5c dc 35 cd c3 5c dc 35 ; [$b2d0] undefined
    hex cd c3 5c dc 35 c5 d7 35 db 5d b5 db 5d b5 db 5d ; [$b2e0] undefined
    hex b5 d7 6e d7 77 0b 70 b7 0b 70 b7 0b 70 d5 f7 04 ; [$b2f0] undefined
    hex 77 5b 74 b7 5b 74 b7 5b 74 b7 5d ef 6a dc 37 7d ; [$b300] undefined
    hex 73 76 77 7d 73 76 77 7d 73 76 77 77 3a d5 35 5d ; [$b310] undefined
    hex 77 0f d5 70 fd 77 0f 35 4d 77 54 c3 f5 5d b9 c3 ; [$b320] undefined
    hex d5 07 55 d5 2d fb 55 2d f9 d5 67 54 47 0f 35 5d ; [$b330] undefined
    hex 77 0f d5 ed 75 de 40 00 00 01       ; [$b340] undefined

FOREPAW_BLOCKS_SCREEN_74:                   ; [$b34a]
    hex ce f2 10 00 00 00 77 dd 6c 00 00 00 76 8d d3 75 ; [$b34a] undefined
    hex cb 35 4d d3 75 cb 35 7d d3 75 d5 32 cd d3 75 5d ; [$b35a] undefined
    hex d6 b7 4d d6 b7 4d d6 b7 4d d6 77 bd df 70 00 00 ; [$b36a] undefined
    hex 00 d6 dd 9f 6a d5 75 6d 9c 00 00 d7 76 ed bf 70 ; [$b37a] undefined
    hex d7 00 00 00 75 4d ef 6a d7 43 70 d7 77 0d 77 70 ; [$b38a] undefined
    hex d7 77 0d 77 70 ce f5 97 68 dc 1d c3 2c b2 cb 2c ; [$b39a] undefined
    hex b2 cb 2c 76 8d bb 6f d3 ad 3b 57 d3 b5 4d 3b 54 ; [$b3aa] undefined
    hex d3 b5 5d 3b 54 5d 73 0f d4 6d 72 d4 6d 72 d4 6d ; [$b3ba] undefined
    hex 72 5d 77 54 d4 ed 77 51 d4 ed 77 51 d4 ed 77 51 ; [$b3ca] undefined
    db $de,$40,$00,$00,$00                  ; [$b3da] undefined

FOREPAW_BLOCKS_SCREEN_75:                   ; [$b3df]
    hex c8 40 00 00 00 d6 f7 dd 6c 00 00 00 cb 0d d3 75 ; [$b3df] undefined
    hex cb 35 4d d3 75 cb 35 7d d3 75 d5 32 cd d3 75 37 ; [$b3ef] undefined
    hex 4d d6 b7 4d d6 b7 4d d6 b7 4d d6 dd f7 00 00 00 ; [$b3ff] undefined
    hex 00 d9 c0 35 9d ab 0f d5 b6 70 00 d7 00 00 00 00 ; [$b40f] undefined
    hex dc 35 d3 70 d7 43 70 d7 77 0d 77 70 d7 77 0d 77 ; [$b41f] undefined
    hex 70 cb 1d c3 2c 9d c3 2c b2 cb 2c b2 cb 2c d3 b7 ; [$b42f] undefined
    hex 0d 3b 0f d3 ad 3b 57 d3 b5 4d 3b 54 d3 b5 5d 3b ; [$b43f] undefined
    hex 54 d4 6d 72 d4 6d 72 d4 6d 72 d4 6d 72 d4 ed 77 ; [$b44f] undefined
    hex 51 d4 ed 77 51 d4 ed 77 51 d4 ed 77 51 de 40 00 ; [$b45f] undefined
    db $00,$00                              ; [$b46f] undefined

FOREPAW_BLOCKS_SCREEN_76:                   ; [$b471]
    hex c8 40 00 00 00 d6 f7 dd 6c 00 00 03 2a cb 0d d3 ; [$b471] undefined
    hex 75 cb 35 4d d3 75 cb 35 7d d3 75 d5 32 cd ef 3a ; [$b481] undefined
    hex dd 77 4d d6 d5 b6 70 00 07 2a dd f7 03 56 da b7 ; [$b491] undefined
    hex 00 00 07 3a d9 cd 67 6a c3 f5 43 57 c3 cd 57 0f ; [$b4a1] undefined
    hex d5 35 77 2a d7 00 00 00 07 3a dc 35 dd c0 35 d3 ; [$b4b1] undefined
    hex 70 d7 43 70 d7 77 07 2a cb 1c eb 3b d9 1d c3 2c ; [$b4c1] undefined
    hex 9d c3 2c b2 c7 3a d3 b7 0c ab 2b da 37 0d 3b 57 ; [$b4d1] undefined
    hex d3 ad 3b 55 d3 b5 5d bb 2a d4 6c eb 3b 74 ed 72 ; [$b4e1] undefined
    hex d4 6d 72 d4 6d 73 3a d4 ec ab 2b de b6 4d 77 51 ; [$b4f1] undefined
    hex d4 ed 77 51 d4 ed 77 2a de 40 00 00 00 ; [$b501] undefined

FOREPAW_BLOCKS_SCREEN_77:                   ; [$b50e]
    hex c8 40 00 00 00 ce f7 dd 6c 00 00 00 76 8d 57 74 ; [$b50e] undefined
    hex d7 37 5d d3 5c dd 77 4d 73 75 d5 f0 f0 5c b3 76 ; [$b51e] undefined
    hex dc 37 7d db 70 dd f7 6d c3 77 cb 0d 51 75 93 5c ; [$b52e] undefined
    hex 00 00 c3 dd 5b 59 76 8c 3f 5d d5 b5 d3 56 d7 4d ; [$b53e] undefined
    hex 5b 7e 75 6d ab 0f 5d f9 d7 13 5c 4d 73 5d 40 5c ; [$b54e] undefined
    hex b1 dc 13 70 4d c1 cb 37 bd a9 5d 51 d7 13 5c 4d ; [$b55e] undefined
    hex 71 c3 dd 9e 5c 3f 76 b7 7d da dd f7 6b 77 d5 76 ; [$b56e] undefined
    hex ed 59 57 54 70 fd 51 d5 70 f7 55 d5 35 75 5c b0 ; [$b57e] undefined
    hex 72 c1 cb 07 2c 05 de 40 00 00 00    ; [$b58e] undefined

FOREPAW_BLOCKS_SCREEN_78:                   ; [$b599]
    hex c8 40 00 00 00 d6 c0 00 00 00 c3 cd 57 0f d5 35 ; [$b599] undefined
    hex 5c 3f 55 d5 f0 f3 54 c3 f5 5c 3f 57 cb 0d ef 6a ; [$b5a9] undefined
    hex cb 07 2c 1c b3 55 cb 0d 52 d6 47 68 c3 d5 d5 57 ; [$b5b9] undefined
    hex 54 9c 3c d9 f6 8d bb 6f d5 47 55 35 7d 53 0f d5 ; [$b5c9] undefined
    hex b6 a7 56 5c 3c 75 4a 21 54 77 bd ab 5c b5 c1 d7 ; [$b5d9] undefined
    hex 37 bd ab 5c 77 b9 5d 9f 64 b7 02 dc 1d 9e 5d 9c ; [$b5e9] undefined
    hex 36 9d bf 74 37 5d d3 75 36 ed 59 75 bd 3b 0f 03 ; [$b5f9] undefined
    hex 76 55 dd f7 65 d5 34 ed 45 0c b0 dc 00 cb 05 cb ; [$b609] undefined
    db $0d,$4d,$de,$40,$00,$00,$00          ; [$b619] undefined

FOREPAW_BLOCKS_SCREEN_79:                   ; [$b620]
    hex c8 40 00 00 03 3a d6 c0 00 00 03 2a dd 37 5d 73 ; [$b620] undefined
    hex 74 dd 75 cd d3 75 d7 37 4d d7 5c dd 37 5d 73 3a ; [$b630] undefined
    hex dd b7 7d c3 76 dd f7 0d db 77 dc 37 6d df 70 dd ; [$b640] undefined
    hex b7 7d c3 2a d7 0d 53 5c 35 7d 70 d5 75 c3 54 d7 ; [$b650] undefined
    hex 0d ef 3a d9 c0 00 00 35 97 2a c3 f5 5c 3f 55 35 ; [$b660] undefined
    hex 4d 57 0f 35 53 0f 0d bb 3a 75 4d 5f 54 70 fb 57 ; [$b670] undefined
    hex 40 03 2a d9 c0 00 00 03 3a cf 34 ec f0 d3 b3 c3 ; [$b680] undefined
    hex 4e cf 0d 3b 3c 34 ec f3 2a d3 b5 1c 3f 4e d4 70 ; [$b690] undefined
    hex fd 3b 51 c3 f4 ed 47 0f d3 b5 1c 3f 6b c3 f5 34 ; [$b6a0] undefined
    hex d4 d3 53 4d 4d 35 37 6c de 40 00 00 00 ; [$b6b0] undefined

FOREPAW_BLOCKS_SCREEN_80:                   ; [$b6bd]
    hex c8 40 00 00 00 ce f7 dd 6c 00 00 00 ca f6 8d 53 ; [$b6bd] undefined
    hex 55 30 fd 57 0f 00 d5 70 f0 ce dc b0 d5 f2 c3 54 ; [$b6cd] undefined
    hex cb 07 2c 72 c7 2c ca f6 70 d6 76 ad 57 57 75 45 ; [$b6dd] undefined
    hex d5 15 ce f6 8d 5f 54 35 53 67 00 35 9d 9c ca dc ; [$b6ed] undefined
    hex 3c d5 70 fd 53 0f 35 7c 3c d5 35 5c 3f 55 ce dd ; [$b6fd] undefined
    hex 70 de f6 ad ef 6a d7 00 de f6 ad ef 6a ca dd 74 ; [$b70d] undefined
    hex 76 77 68 d7 40 75 97 68 ce dd c0 db b4 ed bb 6f ; [$b71d] undefined
    hex dc 00 db b4 ed bb 6f ca dd af 0f d4 76 7d 47 57 ; [$b72d] undefined
    hex d7 35 1d 70 d4 75 9d 47 5c ce dd b1 d4 f4 ed 4f ; [$b73d] undefined
    hex 55 d7 75 3d 74 d4 f4 ed 4f 5d de 40 00 00 00 ; [$b74d] undefined

FOREPAW_BLOCKS_SCREEN_81:                   ; [$b75c]
    hex c8 40 00 00 00 d6 c0 00 00 00 c3 cd 53 55 30 fd ; [$b75c] undefined
    hex 57 0f 00 d5 70 f0 cb 1c b0 d5 f2 c3 54 cb 07 2c ; [$b76c] undefined
    hex 72 c7 2c 14 c3 c7 57 75 45 d5 15 d9 f5 9d ab 55 ; [$b77c] undefined
    hex d5 b6 70 00 35 9d 9c c3 f5 cc 3f 5c b0 fd 53 0f ; [$b78c] undefined
    hex d7 35 7d 70 d5 35 cc 3f 5c 75 db 5d de f6 ad ef ; [$b79c] undefined
    hex 6a d7 6d 74 de f6 ad ef 6a 50 76 77 68 40 75 97 ; [$b7ac] undefined
    hex 68 d4 77 00 db b4 ed bb 6f dc 00 db b4 ed bb 6f ; [$b7bc] undefined
    hex d4 f0 fd 47 0f d4 76 7d 47 57 d4 75 cd 47 5c d4 ; [$b7cc] undefined
    hex 75 9d 47 5c 5d 4f 57 d4 f4 ed 4f 55 d4 f5 dd 4f ; [$b7dc] undefined
    hex 5d d4 f4 ed 4f 5d de 40 00 00 00    ; [$b7ec] undefined

FOREPAW_BLOCKS_SCREEN_82:                   ; [$b7f7]
    hex c8 40 00 00 00 d6 c0 00 00 03 3a c3 cd 53 55 30 ; [$b7f7] undefined
    hex fd 57 0f d5 70 fd 57 0f d5 4d 5f 2a cb 1c b0 d5 ; [$b807] undefined
    hex f2 c3 54 cb 0d 53 2c 77 bd ab 3a 54 c3 c7 57 75 ; [$b817] undefined
    hex 4d 5f 56 d9 dd 67 2a d9 c0 00 d6 76 ad 56 c3 f6 ; [$b827] undefined
    hex ed bf 3a c3 f5 cd 53 5c d5 70 fd 53 0f d7 00 23 ; [$b837] undefined
    hex 2a d5 f5 db 5d de f6 ad ef 6a d7 40 1d ef 3a d5 ; [$b847] undefined
    hex 1d c1 76 77 68 dc 1d c1 dc 35 97 2a d4 77 0d 46 ; [$b857] undefined
    hex db b4 ed bb 6f d4 6d 46 d4 74 ed bb 3a d4 f5 5d ; [$b867] undefined
    hex 4f 0f d4 76 7d 47 57 d4 f5 cd 4f 5c d4 f5 5d 47 ; [$b877] undefined
    hex 2a 70 f7 57 d4 f4 ed 4f 55 75 d7 5d 74 ed 4f 3a ; [$b887] undefined
    db $de,$40,$00,$00,$00                  ; [$b897] undefined

;
; XREFS:
;     USHORT_8004 [$8004]
;
MASCON_BLOCKS:                              ; [$b89c]
    dw $38b8                                ; MASCON_BLOCKS_SCREEN_0
                                            ; [$b89c]
    dw $3941                                ; MASCON_BLOCKS_SCREEN+1
                                            ; [$b89e]
    dw $39d6                                ; MASCON_BLOCKS_SCREEN_2
                                            ; [$b8a0]
    dw $3a43                                ; MASCON_BLOCKS_SCREEN_3
                                            ; [$b8a2]
    dw $3acd                                ; MASCON_BLOCKS_SCREEN_4
                                            ; [$b8a4]
    dw $3b3c                                ; MASCON_BLOCKS_SCREEN_5
                                            ; [$b8a6]
    dw $3baa                                ; MASCON_BLOCKS_SCREEN_6
                                            ; [$b8a8]
    dw $3c23                                ; MASCON_BLOCKS_SCREEN_7
                                            ; [$b8aa]
    dw $3c99                                ; MASCON_BLOCKS_SCREEN_8
                                            ; [$b8ac]
    dw $3d2b                                ; MASCON_BLOCKS_SCREEN_9
                                            ; [$b8ae]
    dw $3d8e                                ; MASCON_BLOCKS_SCREEN_10
                                            ; [$b8b0]
    dw $3e12                                ; MASCON_BLOCKS_SCREEN_11
                                            ; [$b8b2]
    dw $3e8c                                ; MASCON_BLOCKS_SCREEN_12
                                            ; [$b8b4]
    dw $3eff                                ; MASCON_BLOCKS_SCREEN_13
                                            ; [$b8b6]

;
; XREFS:
;     MASCON_BLOCKS [$b89c]
;
MASCON_BLOCKS_SCREEN_0:                     ; [$b8b8]
    hex d3 70 90 00 34 dc 24 00 44 00 08 40 14 03 4d 47 ; [$b8b8] undefined
    hex 09 00 00 00 ca b4 d0 00 40 03 20 c9 32 17 6f d1 ; [$b8c8] undefined
    hex 74 4d 07 6f 4c ab 45 d0 34 1c ab 1f d5 72 25 c7 ; [$b8d8] undefined
    hex f2 4c 89 4d af 3f d1 34 2d af 5d d7 f5 e7 14 d3 ; [$b8e8] undefined
    hex b5 5c db 19 4d 93 6a 0d 93 59 d5 b5 85 c4 c0 4d ; [$b8f8] undefined
    hex af 68 d6 b6 9d af 5d d7 f5 ed bf 4f d4 35 cd 40 ; [$b908] undefined
    hex d3 1d 93 67 ce b6 7d 93 59 d5 35 87 4e d8 73 ad ; [$b918] undefined
    hex 83 28 57 52 ce f5 27 39 d4 f5 75 ca 33 bc a0 c0 ; [$b928] undefined
    hex 80 00 00 00 c0 40 00 00 00          ; [$b938] undefined

MASCON_BLOCKS_SCREEN_1:                     ; [$b941]
    hex c2 4d 34 c2 72 ac 24 00 00 34 d3 09 c8 32 3d bf ; [$b941] undefined
    hex 4d 4d 34 40 00 c7 dc 8a 10 00 d3 43 6f c5 72 5c ; [$b951] undefined
    hex 5b 00 74 6d 1d 00 db c7 14 c6 31 9c 63 1a 73 ed ; [$b961] undefined
    hex 03 41 db c0 85 31 2c 5c d1 73 fd 13 42 b0 04 c6 ; [$b971] undefined
    hex 31 97 15 c4 30 fc 47 16 cb 72 e0 cf 70 9d 13 1a ; [$b981] undefined
    hex c4 c7 03 c2 b0 ec 2b 1e cb 32 fc df 38 cf 31 9c ; [$b991] undefined
    hex 4f 17 d4 33 c5 c1 30 5c 1d ca f3 2c cf 34 cd b4 ; [$b9a1] undefined
    hex fd 43 36 ca 33 65 c1 b1 cc 21 73 1c eb 35 74 ed ; [$b9b1] undefined
    hex 53 4b 55 71 d5 73 0c ef 36 1d 4d c0 80 00 00 00 ; [$b9c1] undefined
    db $c0,$40,$00,$00,$00                  ; [$b9d1] undefined

MASCON_BLOCKS_SCREEN_2:                     ; [$b9d6]
    hex d3 40 36 fd 34 00 00 00 03 6f 4d bc 40 00 0d bc ; [$b9d6] undefined
    hex 40 c2 41 00 04 d1 b4 74 41 00 07 4d cf b4 0d 05 ; [$b9e6] undefined
    hex 41 00 db cb 45 cf f4 4d 0a c5 31 8c 6a 4c 27 6f ; [$b9f6] undefined
    hex 34 dc 27 1f cb 72 ec f7 22 71 3c 5d 41 30 9b 5d ; [$ba06] undefined
    hex d7 c3 5e c5 75 ac 59 40 c2 43 59 d3 b5 bc db 58 ; [$ba16] undefined
    hex c0 f0 dc 31 d3 10 41 75 45 71 c7 4d 50 74 d5 75 ; [$ba26] undefined
    hex 35 71 d5 c0 80 00 00 00 c0 40 00 00 00 ; [$ba36] undefined

MASCON_BLOCKS_SCREEN_3:                     ; [$ba43]
    hex d3 4d bc 0d 34 0d bf 4d 00 07 2a d3 43 6f 40 00 ; [$ba43] undefined
    hex 0c ab 62 90 90 00 0d 88 1d bc 80 00 31 47 18 71 ; [$ba53] undefined
    hex a8 00 00 db dc 4f 12 c4 f1 7d bf 45 d0 34 17 63 ; [$ba63] undefined
    hex 71 4c 63 19 b1 5c 43 0f c4 71 6c ab 1f cb b2 2c ; [$ba73] undefined
    hex 53 62 c6 9c 4c db f0 3c 2b 0e c2 b0 cd 3f 5d cd ; [$ba83] undefined
    hex f5 e7 13 c5 f4 fc e3 3c 5c 13 05 c1 dd 3b 59 cc ; [$ba93] undefined
    hex f5 8d 3f 50 cf 34 ed 5b 36 5c 1b 1c c2 15 d5 1d ; [$baa3] undefined
    hex 3b 3a cd 9d 53 4b 57 1d 57 39 d4 f5 77 3b 5d 4d ; [$bab3] undefined
    hex c0 80 00 00 00 c0 40 00 00 00       ; [$bac3] undefined

MASCON_BLOCKS_SCREEN_4:                     ; [$bacd]
    hex db cd 34 00 00 00 41 00 0d bc 01 74 d4 01 36 f0 ; [$bacd] undefined
    hex 01 40 34 d0 00 00 40 01 36 f0 00 0d 17 40 d0 51 ; [$badd] undefined
    hex 1d 37 63 d3 71 4c 63 19 4c 7f 23 c8 91 db cc 53 ; [$baed] undefined
    hex 62 c6 9c 4c 72 0c 93 5c b2 15 47 13 c5 f4 fd 43 ; [$bafd] undefined
    hex 3c 74 6c b7 2e cf 74 74 0c 57 5b c5 b4 ed 6b 36 ; [$bb0d] undefined
    hex d3 1d 3f 3a cf 14 0c 0f 1c c3       ; [$bb1d] undefined

;
; XREFS:
;     CastMagic_RunUpdateSpellHandler
;
DAT_bb27:                                   ; [$bb27]
    db $1c                                  ; [$bb27] undefined

;
; XREFS:
;     CastMagic_RunUpdateSpellHandler
;
DAT_bb28:                                   ; [$bb28]
    hex e9 5c cb 3b cd 94 07 1d 5c ed c0 80 00 00 00 c0 ; [$bb28] undefined
    db $40,$00,$00,$00                      ; [$bb38] undefined

MASCON_BLOCKS_SCREEN_5:                     ; [$bb3c]
    hex d3 40 00 00 00 00 00 00 00 00 00 00 00 00 00 34 ; [$bb3c] undefined
    hex 5d 03 41 40 00 00 31 fc 8f 22 40 00 00 c8 34 e7 ; [$bb4c] undefined
    hex 36 c8 50 c4 c3 45 d1 34 14 c7 f2 fc df 38 c8 90 ; [$bb5c] undefined
    hex c5 72 5c 5b 1f c9 32 24 d3 cc cf 3c 10 c0 f5 6c ; [$bb6c] undefined
    hex 33 4f d4 33 cc 67 17 d3 b3 1c f3 35 cd 90 71 c7 ; [$bb7c] undefined
    hex 4e ce b3 6c 98 73 0c ea 53 4c 71 d5 ce dc c3 28 ; [$bb8c] undefined
    hex 5c ef 36 11 c0 80 00 00 00 c0 40 00 00 00 ; [$bb9c] undefined

MASCON_BLOCKS_SCREEN_6:                     ; [$bbaa]
    hex d3 40 00 00 00 03 2a 40 00 00 0c 83 24 c8 50 00 ; [$bbaa] undefined
    hex 00 34 cc 7d c8 90 00 00 32 0c 93 44 b2 14 00 00 ; [$bbba] undefined
    hex 31 fc 28 32 24 c5 31 2c 4f 12 c5 d0 31 5c 13 0f ; [$bbca] undefined
    hex c1 f1 64 71 30 71 9c 4f 17 70 3c 1b 0e c2 30 c4 ; [$bbda] undefined
    hex d3 f2 fc df 2f cf 34 dc 9b 3c 57 0b 5c 67 13 cc ; [$bbea] undefined
    hex 8c cf 34 cd b3 0c a3 36 d3 17 1c 5d 37 25 73 1c ; [$bbfa] undefined
    hex eb 35 5d 51 57 1d 5c 03 0b 73 0c ef 22 5d 4d c0 ; [$bc0a] undefined
    hex 80 00 00 00 c0 40 00 00 00          ; [$bc1a] undefined

MASCON_BLOCKS_SCREEN_7:                     ; [$bc23]
    hex d3 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$bc23] undefined
    hex 00 03 45 d0 34 17 2a 70 90 04 ca 9c ab 3f d5 b4 ; [$bc33] undefined
    hex 2c 83 24 c8 50 01 d9 36 ad 93 2d cb b3 dc 7d c8 ; [$bc43] undefined
    hex 93 2d cb 83 3d 75 b7 5d d7 f5 ed 3f 50 cf 13 4f ; [$bc53] undefined
    hex d1 35 0d 13 3c 76 77 59 ca 35 8c cb 5a cd 93 2d ; [$bc63] undefined
    hex cb b5 cc bb 3d 73 a5 d5 1d 3b 54 76 f3 4f 33 ac ; [$bc73] undefined
    hex f3 4b 73 b5 d4 d7 53 53 4e 33 bc d9 c0 80 00 00 ; [$bc83] undefined
    db $00,$c0,$40,$00,$00,$00              ; [$bc93] undefined

MASCON_BLOCKS_SCREEN_8:                     ; [$bc99]
    hex db cd 34 00 00 00 41 00 0d bc 01 74 d4 03 20 c8 ; [$bc99] undefined
    hex 72 ac 83 21 41 40 32 ad 37 1f c8 b6 bc 7f 22 d3 ; [$bca9] undefined
    hex 40 74 6d 1d c8 32 3c 87 15 c5 b6 4c 57 16 db c0 ; [$bcb9] undefined
    hex 33 ed 03 41 c7 dc 8b 03 c3 32 5c 0f 0c c7 b1 9c ; [$bcc9] undefined
    hex 63 19 d3 73 fd 13 42 da f6 ad ad 70 f5 c6 71 30 ; [$bcd9] undefined
    hex db f4 f3 36 d9 35 bd 91 70 e5 d3 cc df 3c 74 ec ; [$bce9] undefined
    hex 8d 76 a5 c5 31 3c 5d d3 8c cf 36 d3 1c e9 da f5 ; [$bcf9] undefined
    hex 4d ad c1 31 cc 1d 73 1c eb 35 5c ed d9 35 3d 91 ; [$bd09] undefined
    hex c1 b1 dc 21 73 0c ef 36 c0 80 00 00 00 c0 40 00 ; [$bd19] undefined
    db $00,$00                              ; [$bd29] undefined

MASCON_BLOCKS_SCREEN_9:                     ; [$bd2b]
    hex db cd 34 00 00 00 41 00 0d bc 01 74 d4 01 00 41 ; [$bd2b] undefined
    hex 40 34 d0 00 00 74 d1 d3 40 ca 81 db c0 c5 d0 03 ; [$bd3b] undefined
    hex 20 cc b2 3c d3 21 80 50 03 1f c9 03 22 c6 71 3c ; [$bd4b] undefined
    hex 5d cf 10 03 15 c5 b5 ac 57 16 d3 f3 8c f1 cd 90 ; [$bd5b] undefined
    hex 03 03 c3 32 5c 0f 0c ca f5 cc d9 50 01 71 c5 d3 ; [$bd6b] undefined
    hex b5 47 4c 50 01 71 d5 75 35 c0 80 00 00 00 c0 40 ; [$bd7b] undefined
    db $00,$00,$00                          ; [$bd8b] undefined

MASCON_BLOCKS_SCREEN_10:                    ; [$bd8e]
    hex db cd 34 00 00 00 41 00 0d bc 01 74 d4 01 00 41 ; [$bd8e] undefined
    hex 40 34 d0 32 0c 85 00 74 d3 2a d3 74 5d 03 41 71 ; [$bd9e] undefined
    hex fc 89 36 f0 8c 83 23 c8 71 fc e3 22 c8 33 2c d3 ; [$bdae] undefined
    hex 21 d1 74 4d 07 4d 0c 7d c8 b4 ec 8f 36 c7 f3 1c ; [$bdbe] undefined
    hex d7 36 c6 71 3c 5d 0d 3f 56 cf 31 5c 97 16 c5 72 ; [$bdce] undefined
    hex 53 16 d3 f3 8c f1 0d 3b 5f cd b0 3d 6b 0c c0 f0 ; [$bdde] undefined
    hex d3 0c cc b5 cc d9 d3 17 3a 5c 71 71 cd 6d d3 b5 ; [$bdee] undefined
    hex 45 57 3b 5c 75 71 dc 2d 75 35 c0 80 00 00 00 c0 ; [$bdfe] undefined
    db $40,$00,$00,$00                      ; [$be0e] undefined

MASCON_BLOCKS_SCREEN_11:                    ; [$be12]
    hex db cd 34 0c ab 4d 00 00 41 32 0c 93 21 4d bc 01 ; [$be12] undefined
    hex 74 d4 31 fc f7 22 40 41 40 ca b1 5c 4b 16 ca 90 ; [$be22] undefined
    hex 00 74 d1 d8 b1 0c 3f 11 d8 90 03 6f 83 2a 70 3c ; [$be32] undefined
    hex 3b 0c 72 a4 d1 74 4d 06 03 62 c4 f0 a0 c5 e4 cb ; [$be42] undefined
    hex 72 ec f5 03 04 c5 70 4c 97 07 c5 b0 74 d3 f5 0c ; [$be52] undefined
    hex f1 03 06 c0 f0 6c 2f 08 c3 30 8c 9b 22 d3 b5 fc ; [$be62] undefined
    hex d9 01 5c 71 5c c3 36 75 47 4c 41 5c 75 55 75 35 ; [$be72] undefined
    hex c0 80 00 00 00 c0 40 00 00 00       ; [$be82] undefined

MASCON_BLOCKS_SCREEN_12:                    ; [$be8c]
    hex db c0 00 00 00 03 2a 40 00 00 0c 83 24 c8 50 00 ; [$be8c] undefined
    hex 00 0c 7d c8 b4 d4 00 00 32 0c 28 32 14 00 00 31 ; [$be9c] undefined
    hex fc 13 0f c1 f2 24 00 00 30 a3 0e c2 87 14 c6 31 ; [$beac] undefined
    hex 9c 63 1a 40 31 5c 13 05 c1 f1 e5 c4 c3 17 c6 71 ; [$bebc] undefined
    hex 33 17 70 3c 1b 0b c2 30 c7 4f d7 75 cd 7b 3c cc ; [$becc] undefined
    hex 35 bd 43 3c d3 17 1c 57 4e d6 73 ad 63 36 75 4c ; [$bedc] undefined
    hex a3 36 57 1d 55 73 b5 75 35 c0 80 00 00 00 c0 40 ; [$beec] undefined
    db $00,$00,$00                          ; [$befc] undefined

MASCON_BLOCKS_SCREEN_13:                    ; [$beff]
    hex db cd 34 db c0 00 00 04 74 d7 4d 74 d1 00 07 6f ; [$beff] undefined
    hex 85 5d bc 00 00 01 07 4d 10 0d 17 40 d0 50 00 44 ; [$bf0f] undefined
    hex c2 74 5c ff 44 d0 a7 45 d0 03 41 91 71 fc b7 2e ; [$bf1f] undefined
    hex cf 72 27 1f c9 03 22 45 74 fc dc 33 6c 9b 4f 35 ; [$bf2f] undefined
    hex 6c f3 36 c6 71 3c 5f 3c 74 ec cb 33 cd 1c c3 4e ; [$bf3f] undefined
    hex d7 75 fd 79 c5 75 ac 59 d3 5c c7 3a cd 55 d6 73 ; [$bf4f] undefined
    hex ad 61 c0 f1 cc 33 4b 5c c3 3b cf 15 73 b5 71 d5 ; [$bf5f] undefined
    hex c0 80 00 00 00 c0 40 00 00 00 ff ff ff ff 6f ff ; [$bf6f] undefined
    hex 00 04 7f fe ff ff ff ff 20 22 fb ff f3 ff ff ff ; [$bf7f] undefined
    hex 00 00 ff 77 ff ff ff ff 00 58 df ff f7 ff ff ff ; [$bf8f] undefined
    hex 00 00 ff ff ff ff fb fd 00 a0 df ff ff ff fb ff ; [$bf9f] undefined
    hex 00 62 ff f7 7f ff 9d ff 00 40 ff ff ff ff 6f ff ; [$bfaf] undefined
    hex 00 00 ff f1 ff ff ff ff 29 00 ff ef df 7e fe ff ; [$bfbf] undefined
    hex 00 20 bf eb ff ff ff ff 00 04 ff ff ff ff aa ff ; [$bfcf] undefined
    hex 80 00 ff be ff 7b ff ff 2d 01 ff fb ff ff ff ff ; [$bfdf] undefined
    hex 00 00 ff ff ff ff 99 ff 80 00 ff bf fe ff ff ff ; [$bfef] undefined
    db $00                                  ; [$bfff] undefined
