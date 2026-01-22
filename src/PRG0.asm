;============================================================================
; Faxanadu (U).nes
;
; PRG0 ($8000 - $bfff)
;============================================================================

    .segment "PRG0"
    .reloc

ROMBankStart:                               ; [$8000]
    bank_offset_16 EOLIS_BLOCKS             ; Eolis
    bank_offset_16 MIST_BLOCKS              ; Mist
    bank_offset_16 TOWNS_BLOCKS             ; Towns

;
; XREFS:
;     ROMBankStart [$8000]
;
EOLIS_BLOCKS:                               ; [$8006]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_00   ; EOLIS_BLOCKS_SCREEN_00
                                            ; [$8006]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_01   ; EOLIS_BLOCKS_SCREEN_01
                                            ; [$8008]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_02   ; EOLIS_BLOCKS_SCREEN_02
                                            ; [$800a]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_03   ; EOLIS_BLOCKS_SCREEN_03
                                            ; [$800c]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_04   ; EOLIS_BLOCKS_SCREEN_04
                                            ; [$800e]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_05   ; EOLIS_BLOCKS_SCREEN_05
                                            ; [$8010]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_06   ; EOLIS_BLOCKS_SCREEN_06
                                            ; [$8012]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_07   ; EOLIS_BLOCKS_SCREEN_07
                                            ; [$8014]
    bank_offset_16 EOLIS_BLOCKS_SCREEN_08   ; EOLIS_BLOCKS_SCREEN_08
                                            ; [$8016]

;
; XREFS:
;     EOLIS_BLOCKS [$8006]
;
EOLIS_BLOCKS_SCREEN_00:                     ; [$8018]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$8018] byte
    .byte $33,$41,$00,$00,$0c,$d3,$0f,$d5   ; [$8020] byte
    .byte $b3,$31,$00,$00,$0c,$cf,$45,$d6   ; [$8028] byte
    .byte $71,$0c,$3b,$5a,$40,$03,$34,$4c   ; [$8030] byte
    .byte $43,$3f,$d4,$36,$97,$54,$40,$03   ; [$8038] byte
    .byte $33,$75,$9d,$43,$13,$d1,$15,$43   ; [$8040] byte
    .byte $0c,$cb,$72,$fc,$33,$2c,$75,$3c   ; [$8048] byte
    .byte $49,$c7,$15,$c3,$43,$1a,$41,$c5   ; [$8050] byte
    .byte $95,$c4,$95,$c1,$c0,$0c,$18,$15   ; [$8058] byte
    .byte $d3,$d5,$d9,$40,$0c,$14,$35,$e5   ; [$8060] byte
    .byte $d3,$95,$d9,$80,$00,$00,$36,$85   ; [$8068] byte
    .byte $c1,$00,$03,$67,$ca,$70,$3c,$ab   ; [$8070] byte
    .byte $08,$ca,$70,$37,$5f,$40,$03,$3a   ; [$8078] byte
    .byte $c0,$80,$00                       ; [$8080] byte

EOLIS_BLOCKS_SCREEN_01:                     ; [$8083]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$8083] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$808b] byte
    .byte $00,$d6,$b3,$fc,$8c,$35,$a4,$d6   ; [$8093] byte
    .byte $75,$0d,$69,$00,$d5,$35,$3c,$9b   ; [$809b] byte
    .byte $22,$c9,$b5,$4d,$6f,$43,$d4,$f1   ; [$80a3] byte
    .byte $2d,$53,$5b,$d0,$c0,$5c,$c5,$cc   ; [$80ab] byte
    .byte $5d,$8f,$20,$74,$47,$63,$c8,$00   ; [$80b3] byte
    .byte $5c,$88,$1d,$6f,$27,$71,$27,$5b   ; [$80bb] byte
    .byte $c9,$c0,$5d,$53,$4f,$d4,$d7,$12   ; [$80c3] byte
    .byte $74,$f5,$c4,$b1,$cc,$48,$57,$4e   ; [$80cb] byte
    .byte $5d,$8f,$1c,$74,$e7,$63,$c7,$01   ; [$80d3] byte
    .byte $d7,$f5,$e7,$64,$d7,$9c,$53,$37   ; [$80db] byte
    .byte $d7,$b6,$47,$14,$cd,$c0,$ca,$c0   ; [$80e3] byte
    .byte $00,$00,$00,$d2,$00,$00,$00,$00   ; [$80eb] byte

EOLIS_BLOCKS_SCREEN_02:                     ; [$80f3]
    .byte $c0,$40,$32,$8c,$04,$00,$00,$00   ; [$80f3] byte
    .byte $c3,$f3,$3d,$59,$00,$00,$00,$da   ; [$80fb] byte
    .byte $b6,$bd,$b1,$00,$00,$0c,$d1,$cf   ; [$8103] byte
    .byte $f2,$3d,$69,$cd,$10,$00,$0c,$cf   ; [$810b] byte
    .byte $59,$c8,$c2,$cc,$d0,$35,$9d,$40   ; [$8113] byte
    .byte $d0,$cd,$67,$53,$cc,$72,$2c,$c7   ; [$811b] byte
    .byte $54,$b5,$bd,$0c,$35,$3c,$48,$c8   ; [$8123] byte
    .byte $0d,$4c,$d5,$f5,$59,$36,$3c,$80   ; [$812b] byte
    .byte $14,$c9,$c4,$c8,$b4,$d5,$35,$bc   ; [$8133] byte
    .byte $9c,$14,$04,$d5,$34,$fd,$4d,$1c   ; [$813b] byte
    .byte $4b,$1c,$c4,$9d,$3d,$31,$c4,$74   ; [$8143] byte
    .byte $e5,$1c,$72,$9d,$39,$d2,$0d,$78   ; [$814b] byte
    .byte $76,$4d,$79,$34,$80,$35,$ed,$91   ; [$8153] byte
    .byte $ca,$c0,$00,$00,$00,$d2,$00,$00   ; [$815b] byte
    .byte $00,$00                           ; [$8163] byte

EOLIS_BLOCKS_SCREEN_03:                     ; [$8165]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$8165] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$816d] byte
    .byte $00,$00,$00,$35,$9c,$8f,$21,$40   ; [$8175] byte
    .byte $d0,$c0,$34,$2d,$0c,$35,$3c,$99   ; [$817d] byte
    .byte $d6,$72,$3c,$87,$43,$c4,$b2,$73   ; [$8185] byte
    .byte $44,$c4,$b2,$73,$44,$c4,$9c,$c5   ; [$818d] byte
    .byte $d4,$f3,$17,$63,$40,$00,$1c,$89   ; [$8195] byte
    .byte $72,$27,$5b,$71,$e0,$40,$32,$4d   ; [$819d] byte
    .byte $3f,$24,$34,$fc,$91,$cd,$80,$34   ; [$81a5] byte
    .byte $bd,$33,$48,$1d,$39,$34,$e5,$cd   ; [$81ad] byte
    .byte $c0,$00,$1d,$91,$36,$47,$48,$ce   ; [$81b5] byte
    .byte $00,$03,$2b,$00,$00,$cf,$00,$0d   ; [$81bd] byte
    .byte $27,$48,$00,$00                   ; [$81c5] byte

EOLIS_BLOCKS_SCREEN_04:                     ; [$81c9]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$81c9] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$81d1] byte
    .byte $00,$00,$03,$34,$4c,$43,$5c,$d7   ; [$81d9] byte
    .byte $50,$00,$33,$47,$33,$4c,$45,$5d   ; [$81e1] byte
    .byte $0c,$d8,$b6,$ed,$8b,$6e,$d8       ; [$81e9] byte

;
; XREFS:
;     Screen_LoadUIPalette
;
BYTE_81f0:                                  ; [$81f0]
    .byte $b4,$a7,$2c,$cb,$d5,$5c,$47,$44   ; [$81f0] byte
    .byte $d1,$c0,$36,$0d,$85,$cb,$b1,$65   ; [$81f8] byte
    .byte $70,$d7,$12,$c1,$80,$00,$05,$70   ; [$8200] byte
    .byte $75,$c1,$40,$00,$05,$73,$60,$d9   ; [$8208] byte
    .byte $80,$00,$0c,$e9,$73,$70,$c0,$c0   ; [$8210] byte
    .byte $ca,$b0,$8c,$a7,$03,$ca,$b0,$8c   ; [$8218] byte
    .byte $d7,$0e,$cf,$73,$80,$c0,$80,$00   ; [$8220] byte
    .byte $00,$33,$c0                       ; [$8228] byte

EOLIS_BLOCKS_SCREEN_05:                     ; [$822b]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$822b] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8233] byte
    .byte $00,$d4,$35,$a7,$10,$d7,$35,$d7   ; [$823b] byte
    .byte $34,$40,$00,$c8,$17,$11,$57,$33   ; [$8243] byte
    .byte $4c,$d1,$00,$c4,$b5,$4c,$31,$5c   ; [$824b] byte
    .byte $33,$2c,$76,$ed,$29,$d8,$8d,$b8   ; [$8253] byte
    .byte $c9,$dc,$69,$5c,$b5,$c5,$b4,$7d   ; [$825b] byte
    .byte $83,$0d,$d1,$c0,$c4,$9c,$19,$5c   ; [$8263] byte
    .byte $18,$00,$00,$5c,$59,$5c,$14,$00   ; [$826b] byte
    .byte $00,$c2,$40,$5d,$98,$00,$00,$ce   ; [$8273] byte
    .byte $00,$c3,$b3,$dc,$a7,$03,$ca,$b0   ; [$827b] byte
    .byte $8c,$a7,$03,$0c,$ab,$29,$c0,$80   ; [$8283] byte
    .byte $00,$00,$00                       ; [$828b] byte

EOLIS_BLOCKS_SCREEN_06:                     ; [$828e]
    .byte $c0,$43,$34,$c0,$40,$c3,$f5,$6c   ; [$828e] byte
    .byte $04,$30,$fd,$5b,$01,$03,$33,$40   ; [$8296] byte
    .byte $d1,$74,$64,$34,$5d,$19,$cd,$1d   ; [$829e] byte
    .byte $cb,$44,$dc,$dc,$d1,$dc,$b7,$34   ; [$82a6] byte
    .byte $37,$2d,$cd,$cc,$dd,$67,$50,$d6   ; [$82ae] byte
    .byte $9c,$cd,$d6,$75,$ad,$0f,$42,$d0   ; [$82b6] byte
    .byte $f5,$9d,$69,$c5,$f7,$1d,$4f,$12   ; [$82be] byte
    .byte $d5,$33,$0c,$5f,$71,$dd,$35,$4d   ; [$82c6] byte
    .byte $c3,$23,$37,$4d,$53,$43,$cc,$87   ; [$82ce] byte
    .byte $76,$77,$1c,$c8,$5d,$bf,$31,$c8   ; [$82d6] byte
    .byte $97,$5b,$c7,$c7,$75,$71,$9c,$7c   ; [$82de] byte
    .byte $d4,$d7,$22,$35,$35,$c8,$07,$12   ; [$82e6] byte
    .byte $76,$3c,$80,$55,$15,$c9,$c5,$75   ; [$82ee] byte
    .byte $bc,$9c,$5d,$3f,$24,$d3,$d5,$cd   ; [$82f6] byte
    .byte $cd,$79,$d7,$f1,$4c,$dc,$75,$fd   ; [$82fe] byte
    .byte $39,$d3,$9d,$7d,$c2,$40,$00,$d7   ; [$8306] byte
    .byte $b5,$4d,$91,$d9,$35,$e7,$0a,$ce   ; [$830e] byte
    .byte $00,$00,$00,$00,$d2,$00,$00,$00   ; [$8316] byte
    .byte $00                               ; [$831e] byte

EOLIS_BLOCKS_SCREEN_07:                     ; [$831f]
    .byte $c0,$40,$32,$5c,$6f,$01,$cc,$f0   ; [$831f] byte
    .byte $1c,$6f,$01,$c9,$70,$10,$00,$df   ; [$8327] byte
    .byte $77,$ec,$cd,$c5,$dc,$cf,$7d,$df   ; [$832f] byte
    .byte $90,$c6,$dd,$f7,$7e,$de,$f7,$cc   ; [$8337] byte
    .byte $5f,$59,$c8,$f5,$ac,$5f,$7b,$df   ; [$833f] byte
    .byte $37,$dd,$f9,$cc,$dd,$ef,$7c,$d6   ; [$8347] byte
    .byte $75,$ad,$40,$03,$59,$de,$77,$bd   ; [$834f] byte
    .byte $f1,$c5,$f3,$0d,$67,$50,$dd,$35   ; [$8357] byte
    .byte $4d,$13,$59,$c8,$f2,$1d,$13,$74   ; [$835f] byte
    .byte $75,$bd,$6b,$30,$5d,$4f,$76,$d4   ; [$8367] byte
    .byte $f5,$9d,$6b,$53,$dd,$5d,$67,$5a   ; [$836f] byte
    .byte $5d,$53,$71,$71,$97,$75,$77,$4d   ; [$8377] byte
    .byte $51,$cc,$5d,$d3,$54,$77,$f7,$19   ; [$837f] byte
    .byte $75,$b7,$12,$45,$c8,$9d,$4f,$79   ; [$8387] byte
    .byte $35,$b7,$5b,$57,$76,$77,$47,$24   ; [$838f] byte
    .byte $d3,$f2,$4d,$d3,$54,$55,$5d,$7b   ; [$8397] byte
    .byte $12,$45,$d3,$9d,$4d,$57,$14,$70   ; [$839f] byte
    .byte $ac,$24,$de,$b5,$ed,$7d,$d9,$1d   ; [$83a7] byte
    .byte $7b,$5f,$dd,$f7,$8c,$24,$73,$80   ; [$83af] byte
    .byte $00,$00,$00,$d2,$00,$00,$00,$00   ; [$83b7] byte

EOLIS_BLOCKS_SCREEN_08:                     ; [$83bf]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$83bf] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$83c7] byte
    .byte $d0,$f1,$0c,$3b,$5a,$d0,$b1,$0d   ; [$83cf] byte
    .byte $73,$5d,$40,$d0,$f4,$2d,$0f,$59   ; [$83d7] byte
    .byte $c7,$36,$97,$54,$c8,$31,$15,$d0   ; [$83df] byte
    .byte $cd,$0b,$43,$c8,$03,$11,$d1,$15   ; [$83e7] byte
    .byte $c7,$15,$c4,$b1,$cc,$48,$31,$cc   ; [$83ef] byte
    .byte $49,$c7,$15,$c9,$d5,$c7,$37,$57   ; [$83f7] byte
    .byte $44,$77,$55,$55,$c4,$95,$71,$2c   ; [$83ff] byte
    .byte $70,$21,$d3,$d5,$c7,$15,$c4,$a9   ; [$8407] byte
    .byte $05,$d3,$95,$cd,$d5,$cd,$c0,$03   ; [$840f] byte
    .byte $7a,$cf,$b1,$55,$ca,$cc,$3b,$3d   ; [$8417] byte
    .byte $ca,$c0,$00,$07,$5f,$d2,$00,$00   ; [$841f] byte
    .byte $00,$00                           ; [$8427] byte

MIST_BLOCKS:                                ; [$8429]
    bank_offset_16 MIST_BLOCKS_SCREEN_00_10_11_35_36 ; MIST_BLOCKS_SCREEN_00_10_11_35_36
                                                     ; [$8429]
    bank_offset_16 MIST_BLOCKS_SCREEN_01    ; MIST_BLOCKS_SCREEN_01
                                            ; [$842b]
    bank_offset_16 MIST_BLOCKS_SCREEN_02    ; MIST_BLOCKS_SCREEN_02
                                            ; [$842d]
    bank_offset_16 MIST_BLOCKS_SCREEN_03    ; MIST_BLOCKS_SCREEN_03
                                            ; [$842f]
    bank_offset_16 MIST_BLOCKS_SCREEN_04    ; MIST_BLOCKS_SCREEN_04
                                            ; [$8431]
    bank_offset_16 MIST_BLOCKS_SCREEN_05    ; MIST_BLOCKS_SCREEN_05
                                            ; [$8433]
    bank_offset_16 MIST_BLOCKS_SCREEN_06    ; MIST_BLOCKS_SCREEN_06
                                            ; [$8435]
    bank_offset_16 MIST_BLOCKS_SCREEN_07    ; MIST_BLOCKS_SCREEN_07
                                            ; [$8437]
    bank_offset_16 MIST_BLOCKS_SCREEN_08    ; MIST_BLOCKS_SCREEN_08
                                            ; [$8439]
    bank_offset_16 MIST_BLOCKS_SCREEN_09    ; MIST_BLOCKS_SCREEN_09
                                            ; [$843b]
    bank_offset_16 MIST_BLOCKS_SCREEN_00_10_11_35_36 ; MIST_BLOCKS_SCREEN_00_10_11_35_36
                                                     ; [$843d]
    bank_offset_16 MIST_BLOCKS_SCREEN_00_10_11_35_36 ; MIST_BLOCKS_SCREEN_00_10_11_35_36
                                                     ; [$843f]
    bank_offset_16 MIST_BLOCKS_SCREEN_12    ; MIST_BLOCKS_SCREEN_12
                                            ; [$8441]
    bank_offset_16 MIST_BLOCKS_SCREEN_13    ; MIST_BLOCKS_SCREEN_13
                                            ; [$8443]
    bank_offset_16 MIST_BLOCKS_SCREEN_14    ; MIST_BLOCKS_SCREEN_14
                                            ; [$8445]
    bank_offset_16 MIST_BLOCKS_SCREEN_15    ; MIST_BLOCKS_SCREEN_15
                                            ; [$8447]
    bank_offset_16 MIST_BLOCKS_SCREEN_16    ; MIST_BLOCKS_SCREEN_16
                                            ; [$8449]
    bank_offset_16 MIST_BLOCKS_SCREEN_17    ; MIST_BLOCKS_SCREEN_17
                                            ; [$844b]
    bank_offset_16 MIST_BLOCKS_SCREEN_18    ; MIST_BLOCKS_SCREEN_18
                                            ; [$844d]
    bank_offset_16 MIST_BLOCKS_SCREEN_19    ; MIST_BLOCKS_SCREEN_19
                                            ; [$844f]
    bank_offset_16 MIST_BLOCKS_SCREEN_20    ; MIST_BLOCKS_SCREEN_20
                                            ; [$8451]
    bank_offset_16 MIST_BLOCKS_SCREEN_21    ; MIST_BLOCKS_SCREEN_21
                                            ; [$8453]
    bank_offset_16 MIST_BLOCKS_SCREEN_22    ; MIST_BLOCKS_SCREEN_22
                                            ; [$8455]
    bank_offset_16 MIST_BLOCKS_SCREEN_23    ; MIST_BLOCKS_SCREEN_23
                                            ; [$8457]
    bank_offset_16 MIST_BLOCKS_SCREEN_24    ; MIST_BLOCKS_SCREEN_24
                                            ; [$8459]
    bank_offset_16 MIST_BLOCKS_SCREEN_25    ; MIST_BLOCKS_SCREEN_25
                                            ; [$845b]
    bank_offset_16 MIST_BLOCKS_SCREEN_26    ; MIST_BLOCKS_SCREEN_26
                                            ; [$845d]
    bank_offset_16 MIST_BLOCKS_SCREEN_27    ; MIST_BLOCKS_SCREEN_27
                                            ; [$845f]
    bank_offset_16 MIST_BLOCKS_SCREEN_28    ; MIST_BLOCKS_SCREEN_28
                                            ; [$8461]
    bank_offset_16 MIST_BLOCKS_SCREEN_29    ; MIST_BLOCKS_SCREEN_29
                                            ; [$8463]
    bank_offset_16 MIST_BLOCKS_SCREEN_30    ; MIST_BLOCKS_SCREEN_30
                                            ; [$8465]
    bank_offset_16 MIST_BLOCKS_SCREEN_31    ; MIST_BLOCKS_SCREEN_31
                                            ; [$8467]
    bank_offset_16 MIST_BLOCKS_SCREEN_32    ; MIST_BLOCKS_SCREEN_32
                                            ; [$8469]
    bank_offset_16 MIST_BLOCKS_SCREEN_33    ; MIST_BLOCKS_SCREEN_33
                                            ; [$846b]
    bank_offset_16 MIST_BLOCKS_SCREEN_34    ; MIST_BLOCKS_SCREEN_34
                                            ; [$846d]
    bank_offset_16 MIST_BLOCKS_SCREEN_00_10_11_35_36 ; MIST_BLOCKS_SCREEN_00_10_11_35_36
                                                     ; [$846f]
    bank_offset_16 MIST_BLOCKS_SCREEN_00_10_11_35_36 ; MIST_BLOCKS_SCREEN_00_10_11_35_36
                                                     ; [$8471]
    bank_offset_16 MIST_BLOCKS_SCREEN_37    ; MIST_BLOCKS_SCREEN_37
                                            ; [$8473]
    bank_offset_16 MIST_BLOCKS_SCREEN_38    ; MIST_BLOCKS_SCREEN_38
                                            ; [$8475]
    bank_offset_16 MIST_BLOCKS_SCREEN_39    ; MIST_BLOCKS_SCREEN_39
                                            ; [$8477]
    bank_offset_16 MIST_BLOCKS_SCREEN_40    ; MIST_BLOCKS_SCREEN_40
                                            ; [$8479]
    bank_offset_16 MIST_BLOCKS_SCREEN_41    ; MIST_BLOCKS_SCREEN_41
                                            ; [$847b]
    bank_offset_16 MIST_BLOCKS_SCREEN_42    ; MIST_BLOCKS_SCREEN_42
                                            ; [$847d]
    bank_offset_16 MIST_BLOCKS_SCREEN_43    ; MIST_BLOCKS_SCREEN_43
                                            ; [$847f]
    bank_offset_16 MIST_BLOCKS_SCREEN_44    ; MIST_BLOCKS_SCREEN_44
                                            ; [$8481]
    bank_offset_16 MIST_BLOCKS_SCREEN_45    ; MIST_BLOCKS_SCREEN_45
                                            ; [$8483]
    bank_offset_16 MIST_BLOCKS_SCREEN_46    ; MIST_BLOCKS_SCREEN_46
                                            ; [$8485]
    bank_offset_16 MIST_BLOCKS_SCREEN_47    ; MIST_BLOCKS_SCREEN_47
                                            ; [$8487]
    bank_offset_16 MIST_BLOCKS_SCREEN_48    ; MIST_BLOCKS_SCREEN_48
                                            ; [$8489]
    bank_offset_16 MIST_BLOCKS_SCREEN_49    ; MIST_BLOCKS_SCREEN_49
                                            ; [$848b]
    bank_offset_16 MIST_BLOCKS_SCREEN_50    ; MIST_BLOCKS_SCREEN_50
                                            ; [$848d]
    bank_offset_16 MIST_BLOCKS_SCREEN_51    ; MIST_BLOCKS_SCREEN_51
                                            ; [$848f]
    bank_offset_16 MIST_BLOCKS_SCREEN_52    ; MIST_BLOCKS_SCREEN_52
                                            ; [$8491]
    bank_offset_16 MIST_BLOCKS_SCREEN_53    ; MIST_BLOCKS_SCREEN_53
                                            ; [$8493]
    bank_offset_16 MIST_BLOCKS_SCREEN_54    ; MIST_BLOCKS_SCREEN_54
                                            ; [$8495]
    bank_offset_16 MIST_BLOCKS_SCREEN_55    ; MIST_BLOCKS_SCREEN_55
                                            ; [$8497]
    bank_offset_16 MIST_BLOCKS_SCREEN_56    ; MIST_BLOCKS_SCREEN_56
                                            ; [$8499]
    bank_offset_16 MIST_BLOCKS_SCREEN_57    ; MIST_BLOCKS_SCREEN_57
                                            ; [$849b]
    bank_offset_16 MIST_BLOCKS_SCREEN_58    ; MIST_BLOCKS_SCREEN_58
                                            ; [$849d]
    bank_offset_16 MIST_BLOCKS_SCREEN_59    ; MIST_BLOCKS_SCREEN_59
                                            ; [$849f]
    bank_offset_16 MIST_BLOCKS_SCREEN_60    ; MIST_BLOCKS_SCREEN_60
                                            ; [$84a1]
    bank_offset_16 MIST_BLOCKS_SCREEN_61    ; MIST_BLOCKS_SCREEN_61
                                            ; [$84a3]
    bank_offset_16 MIST_BLOCKS_SCREEN_62    ; MIST_BLOCKS_SCREEN_62
                                            ; [$84a5]
    bank_offset_16 MIST_BLOCKS_SCREEN_63    ; MIST_BLOCKS_SCREEN_63
                                            ; [$84a7]
    bank_offset_16 MIST_BLOCKS_SCREEN_64    ; MIST_BLOCKS_SCREEN_64
                                            ; [$84a9]
    bank_offset_16 MIST_BLOCKS_SCREEN_65    ; MIST_BLOCKS_SCREEN_65
                                            ; [$84ab]
    bank_offset_16 MIST_BLOCKS_SCREEN_66    ; MIST_BLOCKS_SCREEN_66
                                            ; [$84ad]
    bank_offset_16 MIST_BLOCKS_SCREEN_67    ; MIST_BLOCKS_SCREEN_67
                                            ; [$84af]
    bank_offset_16 MIST_BLOCKS_SCREEN_68    ; MIST_BLOCKS_SCREEN_68
                                            ; [$84b1]
    bank_offset_16 MIST_BLOCKS_SCREEN_69    ; MIST_BLOCKS_SCREEN_69
                                            ; [$84b3]
    bank_offset_16 MIST_BLOCKS_SCREEN_70    ; MIST_BLOCKS_SCREEN_70
                                            ; [$84b5]
    bank_offset_16 MIST_BLOCKS_SCREEN_71    ; MIST_BLOCKS_SCREEN_71
                                            ; [$84b7]
    bank_offset_16 MIST_BLOCKS_SCREEN_72    ; MIST_BLOCKS_SCREEN_72
                                            ; [$84b9]
    bank_offset_16 MIST_BLOCKS_SCREEN_73    ; MIST_BLOCKS_SCREEN_73
                                            ; [$84bb]
    bank_offset_16 MIST_BLOCKS_SCREEN_74    ; MIST_BLOCKS_SCREEN_74
                                            ; [$84bd]
    bank_offset_16 MIST_BLOCKS_SCREEN_75    ; MIST_BLOCKS_SCREEN_75
                                            ; [$84bf]
    bank_offset_16 MIST_BLOCKS_SCREEN_76    ; MIST_BLOCKS_SCREEN_76
                                            ; [$84c1]
    bank_offset_16 MIST_BLOCKS_SCREEN_77    ; MIST_BLOCKS_SCREEN_77
                                            ; [$84c3]
    bank_offset_16 MIST_BLOCKS_SCREEN_78    ; MIST_BLOCKS_SCREEN_78
                                            ; [$84c5]
    bank_offset_16 MIST_BLOCKS_SCREEN_79    ; MIST_BLOCKS_SCREEN_79
                                            ; [$84c7]
    bank_offset_16 MIST_BLOCKS_SCREEN_80    ; MIST_BLOCKS_SCREEN_80
                                            ; [$84c9]
    bank_offset_16 MIST_BLOCKS_SCREEN_81    ; MIST_BLOCKS_SCREEN_81
                                            ; [$84cb]
    bank_offset_16 MIST_BLOCKS_SCREEN_82    ; MIST_BLOCKS_SCREEN_82
                                            ; [$84cd]

;
; XREFS:
;     MIST_BLOCKS [$8429]
;
MIST_BLOCKS_SCREEN_00_10_11_35_36:          ; [$84cf]
    .byte $c4,$43,$18,$c1,$34,$1c,$13,$25   ; [$84cf] byte
    .byte $c1,$34,$0c,$10,$0c,$30,$70,$4d   ; [$84d7] byte
    .byte $07,$40,$d0,$72,$54,$c6,$32,$8c   ; [$84df] byte
    .byte $47,$1a,$c3,$34,$00,$c1,$31,$d7   ; [$84e7] byte
    .byte $25,$ce,$72,$63,$11,$32,$3c,$97   ; [$84ef] byte
    .byte $24,$c2,$70,$4c,$17,$14,$32,$55   ; [$84f7] byte
    .byte $c9,$b0,$e1,$c8,$f2,$4c,$24,$d3   ; [$84ff] byte
    .byte $30,$5c,$95,$c9,$70,$4c,$33,$26   ; [$8507] byte
    .byte $c3,$b0,$82,$c9,$34,$53,$4c,$d4   ; [$850f] byte
    .byte $30,$4c,$9a,$ce,$74,$1c,$a3,$20   ; [$8517] byte
    .byte $5c,$3b,$24,$d3,$f4,$dd,$28,$d0   ; [$851f] byte
    .byte $f2,$6b,$27,$ca,$1c,$83,$11,$c2   ; [$8527] byte
    .byte $2c,$77,$1e,$d3,$34,$ac,$9b,$27   ; [$852f] byte
    .byte $c9,$b2,$ec,$33,$2f,$d0,$07,$08   ; [$8537] byte
    .byte $c3,$b1,$1c,$93,$25,$c9,$8c,$45   ; [$853f] byte
    .byte $c9,$32,$3c,$17,$28,$d0,$71,$3c   ; [$8547] byte
    .byte $9b,$11,$c8,$f2,$4c,$63,$26,$c4   ; [$854f] byte
    .byte $72,$40,$d4,$32,$75,$72,$6c,$b9   ; [$8557] byte
    .byte $c9,$32,$8c,$9e,$c9,$34,$4d,$1b   ; [$855f] byte
    .byte $45,$72,$5c,$0d,$cb,$dc,$1f,$27   ; [$8567] byte
    .byte $c7,$72,$6c,$93,$25,$d1,$75,$0d   ; [$856f] byte
    .byte $1f,$4a,$72,$8c,$14,$c3,$30,$67   ; [$8577] byte
    .byte $04,$03,$05,$c0,$f0,$50,$00,$57   ; [$857f] byte
    .byte $2f,$c1,$72,$5c,$7b,$25,$50,$32   ; [$8587] byte
    .byte $5d,$03,$03                       ; [$858f] byte

MIST_BLOCKS_SCREEN_01:                      ; [$8592]
    .byte $c4,$43,$18,$c3,$30,$40,$34,$0c   ; [$8592] byte
    .byte $10,$c6,$0c,$13,$0c,$71,$23,$13   ; [$859a] byte
    .byte $c1,$5c,$97,$09,$c2,$b2,$8c,$25   ; [$85a2] byte
    .byte $cf,$cd,$00,$c4,$b0,$5d,$07,$05   ; [$85aa] byte
    .byte $c1,$32,$5c,$30,$0d,$33,$24,$ca   ; [$85b2] byte
    .byte $31,$8c,$a3,$14,$c1,$70,$4c,$4f   ; [$85ba] byte
    .byte $25,$c9,$b0,$cc,$3b,$11,$c8,$f1   ; [$85c2] byte
    .byte $1c,$9f,$28,$c6,$8c,$95,$c1,$b1   ; [$85ca] byte
    .byte $8c,$33,$26,$c3,$b2,$3c,$93,$25   ; [$85d2] byte
    .byte $32,$8c,$77,$0c,$c6,$1c,$9a,$5c   ; [$85da] byte
    .byte $a3,$20,$c4,$72,$7d,$3f,$17,$d1   ; [$85e2] byte
    .byte $74,$4c,$5e,$32,$6c,$a3,$27,$c1   ; [$85ea] byte
    .byte $70,$ec,$83,$11,$32,$4d,$24,$d3   ; [$85f2] byte
    .byte $74,$8d,$43,$27,$c9,$b2,$ec,$31   ; [$85fa] byte
    .byte $c1,$b1,$87,$08,$c4,$b1,$34,$57   ; [$8602] byte
    .byte $25,$b2,$3c,$9f,$28,$c1,$71,$2c   ; [$860a] byte
    .byte $9b,$11,$54,$d1,$97,$14,$ac,$a0   ; [$8612] byte
    .byte $c1,$2c,$11,$c9,$32,$84,$d1,$d1   ; [$861a] byte
    .byte $2c,$61,$c2,$f0,$6c,$4b,$27,$c7   ; [$8622] byte
    .byte $70,$43,$05,$30,$cc,$10,$c2,$f0   ; [$862a] byte
    .byte $cc,$10,$c3,$17,$18,$c4,$f2,$47   ; [$8632] byte
    .byte $24,$c0,$f0,$b7,$1d,$ca,$31,$1c   ; [$863a] byte
    .byte $60,$70,$4c,$17,$13,$32,$57,$05   ; [$8642] byte
    .byte $32,$5c,$17,$25,$43,$03           ; [$864a] byte

MIST_BLOCKS_SCREEN_02:                      ; [$8650]
    .byte $c1,$0c,$17,$14,$c2,$f0,$4d,$03   ; [$8650] byte
    .byte $41,$34,$0c,$bc,$30,$bc,$bf,$1a   ; [$8658] byte
    .byte $c4,$70,$5c,$53,$04,$32,$4c,$04   ; [$8660] byte
    .byte $23,$28,$c0,$f0,$cd,$01,$c4,$b0   ; [$8668] byte
    .byte $4c,$2f,$13,$c9,$30,$1c,$c3,$32   ; [$8670] byte
    .byte $c5,$30,$bc,$13,$24,$c1,$0c,$a3   ; [$8678] byte
    .byte $04,$ca,$31,$8c,$4f,$1d,$c0,$73   ; [$8680] byte
    .byte $03,$00,$cc,$1c,$9e,$c6,$8c,$77   ; [$8688] byte
    .byte $1e,$4c,$32,$c5,$1c,$c9,$cc,$b1   ; [$8690] byte
    .byte $4b,$0c,$c3,$b1,$cc,$9b,$25,$72   ; [$8698] byte
    .byte $0b,$20,$c1,$24,$1c,$97,$11,$c4   ; [$86a0] byte
    .byte $31,$1c,$a3,$27,$4b,$40,$c4,$74   ; [$86a8] byte
    .byte $18,$32,$5c,$61,$0c,$31,$47,$11   ; [$86b0] byte
    .byte $c9,$32,$8c,$79,$c1,$34,$1d,$03   ; [$86b8] byte
    .byte $04,$c9,$f2,$3c,$9f,$28,$0c,$9f   ; [$86c0] byte
    .byte $24,$c9,$5c,$94,$c3,$31,$1c,$63   ; [$86c8] byte
    .byte $28,$c9,$6c,$a0,$0c,$97,$14,$13   ; [$86d0] byte
    .byte $18,$c4,$b1,$8c,$a3,$14,$30,$40   ; [$86d8] byte
    .byte $34,$1c,$13,$40,$d0,$70,$47,$13   ; [$86e0] byte
    .byte $ca,$0c,$50,$c2,$f0,$cc,$60,$0c   ; [$86e8] byte
    .byte $4b,$18,$c4,$f2,$4c,$54,$c0,$f0   ; [$86f0] byte
    .byte $b7,$0b,$ca,$31,$14,$c3,$13,$13   ; [$86f8] byte
    .byte $32,$54,$c5,$32,$57,$25,$43,$03   ; [$8700] byte

MIST_BLOCKS_SCREEN_03:                      ; [$8708]
    .byte $c0,$f0,$4c,$17,$04,$c2,$f0,$4c   ; [$8708] byte
    .byte $0c,$d0,$74,$0c,$0c,$c1,$30,$bc   ; [$8710] byte
    .byte $13,$1a,$c3,$30,$5c,$51,$32,$4b   ; [$8718] byte
    .byte $01,$c1,$30,$3d,$07,$28,$b0,$c7   ; [$8720] byte
    .byte $1d,$c1,$70,$4c,$2f,$13,$c9,$30   ; [$8728] byte
    .byte $12,$30,$bb,$04,$30,$57,$03,$71   ; [$8730] byte
    .byte $8c,$4f,$12,$b0,$b5,$c2,$cc,$4e   ; [$8738] byte
    .byte $4c,$77,$1e,$c2,$f0,$cc,$4b,$11   ; [$8740] byte
    .byte $2c,$97,$0b,$c3,$0c,$4a,$c2,$f0   ; [$8748] byte
    .byte $5c,$9b,$25,$71,$8c,$a3,$20,$c4   ; [$8750] byte
    .byte $31,$2c,$30,$c4,$4c,$43,$11,$c7   ; [$8758] byte
    .byte $70,$6c,$a3,$27,$c3,$31,$2c,$7b   ; [$8760] byte
    .byte $13,$c4,$60,$71,$0c,$93,$1e,$c1   ; [$8768] byte
    .byte $1c,$31,$71,$dc,$07,$25,$c9,$f1   ; [$8770] byte
    .byte $20,$c8,$32,$3c,$4f,$04,$03,$28   ; [$8778] byte
    .byte $31,$e4,$b2,$8c,$77,$13,$c7,$b1   ; [$8780] byte
    .byte $3c,$63,$03,$05,$c1,$00,$c5,$13   ; [$8788] byte
    .byte $1e,$c2,$f0,$cc,$4b,$13,$c5,$32   ; [$8790] byte
    .byte $57,$05,$c4,$f1,$20,$c4,$cc,$10   ; [$8798] byte
    .byte $c3,$31,$6c,$43,$11,$c1,$f0,$cc   ; [$87a0] byte
    .byte $0f,$06,$71,$87,$18,$72,$4c,$0f   ; [$87a8] byte
    .byte $13,$80,$70,$4c,$61,$53,$13,$32   ; [$87b0] byte
    .byte $5c,$56,$31,$4c,$57,$13,$71,$a9   ; [$87b8] byte

MIST_BLOCKS_SCREEN_04:                      ; [$87c0]
    .byte $c0,$32,$fc,$1f,$00,$30,$53,$30   ; [$87c0] byte
    .byte $c3,$30,$53,$04,$d0,$30,$bc,$13   ; [$87c8] byte
    .byte $05,$cb,$f0,$55,$33,$24,$03,$41   ; [$87d0] byte
    .byte $70,$4c,$4e,$b0,$00,$cc,$73,$01   ; [$87d8] byte
    .byte $32,$5c,$0f,$0b,$30,$c7,$03,$cf   ; [$87e0] byte
    .byte $5c,$c0,$4c,$ca,$c0,$5c,$4f,$28   ; [$87e8] byte
    .byte $c3,$31,$1c,$63,$0c,$73,$0c,$10   ; [$87f0] byte
    .byte $83,$01,$c0,$dc,$9b,$0c,$c4,$71   ; [$87f8] byte
    .byte $8c,$33,$08,$50,$0c,$07,$25,$c2   ; [$8800] byte
    .byte $f0,$cc,$43,$11,$c6,$32,$6c,$39   ; [$8808] byte
    .byte $73,$57,$32,$31,$43,$03,$5c,$4b   ; [$8810] byte
    .byte $24,$ca,$30,$4d,$07,$04,$c1,$b2   ; [$8818] byte
    .byte $5a,$c0,$47,$25,$c3,$32,$3c,$83   ; [$8820] byte
    .byte $26,$c3,$30,$e3,$11,$71,$3b,$1e   ; [$8828] byte
    .byte $72,$5c,$2d,$c8,$32,$4c,$30,$d0   ; [$8830] byte
    .byte $30,$83,$23,$cf,$72,$0b,$28,$c9   ; [$8838] byte
    .byte $72,$6c,$9f,$13,$32,$8c,$97,$04   ; [$8840] byte
    .byte $c3,$9c,$43,$24,$71,$31,$c9,$b2   ; [$8848] byte
    .byte $3c,$33,$11,$31,$ac,$9b,$11,$c4   ; [$8850] byte
    .byte $03,$26,$c1,$43,$3f,$0c,$17,$3d   ; [$8858] byte
    .byte $cf,$f0,$5c,$fc,$30,$50,$c1,$8c   ; [$8860] byte
    .byte $ff,$06,$70,$5c,$1b,$3f,$c1,$ac   ; [$8868] byte
    .byte $18,$00                           ; [$8870] byte

MIST_BLOCKS_SCREEN_05:                      ; [$8872]
    .byte $c0,$f0,$bc,$1f,$05,$31,$1c,$23   ; [$8872] byte
    .byte $10,$c4,$70,$4c,$17,$04,$d0,$30   ; [$887a] byte
    .byte $4c,$2c,$cb,$f0,$57,$03,$c1,$10   ; [$8882] byte
    .byte $c3,$32,$4c,$0f,$0b,$0c,$4d,$c4   ; [$888a] byte
    .byte $f0,$37,$26,$c4,$72,$4c,$81,$c9   ; [$8892] byte
    .byte $32,$55,$30,$c7,$03,$c4,$72,$7c   ; [$889a] byte
    .byte $4f,$25,$b2,$73,$25,$c2,$cc,$a2   ; [$88a2] byte
    .byte $c3,$31,$1c,$63,$0c,$c4,$31,$2c   ; [$88aa] byte
    .byte $97,$26,$c3,$87,$13,$c3,$07,$0c   ; [$88b2] byte
    .byte $c4,$71,$8c,$33,$08,$c3,$9c,$4f   ; [$88ba] byte
    .byte $20,$70,$8c,$4a,$c9,$b2,$77,$04   ; [$88c2] byte
    .byte $c6,$30,$40,$0d,$00,$c1,$31,$07   ; [$88ca] byte
    .byte $40,$c1,$17,$41,$c5,$5c,$98,$c4   ; [$88d2] byte
    .byte $71,$dc,$07,$25,$c9,$f1,$2c,$63   ; [$88da] byte
    .byte $04,$c4,$72,$3c,$4f,$0c,$32,$6c   ; [$88e2] byte
    .byte $3b,$11,$c9,$32,$5c,$9b,$27,$b2   ; [$88ea] byte
    .byte $8c,$96,$c7,$72,$5c,$30,$30,$83   ; [$88f2] byte
    .byte $23,$c9,$72,$6c,$44,$c4,$f0,$b0   ; [$88fa] byte
    .byte $c9,$41,$c3,$9c,$43,$24,$c9,$dc   ; [$8902] byte
    .byte $1f,$12,$72,$5c,$a0,$0c,$9b,$11   ; [$890a] byte
    .byte $c4,$03,$26,$c1,$47,$3f,$c9,$70   ; [$8912] byte
    .byte $50,$cf,$f0,$53,$08,$30,$50,$c1   ; [$891a] byte
    .byte $87,$25,$c0,$f2,$fc,$1b,$3f,$c1   ; [$8922] byte
    .byte $ac,$13,$23,$c9,$32,$5c,$18       ; [$892a] byte

MIST_BLOCKS_SCREEN_06:                      ; [$8931]
    .byte $c5,$30,$33,$25,$c9,$b2,$7c,$0f   ; [$8931] byte
    .byte $25,$30,$b3,$28,$c3,$32,$4c,$13   ; [$8939] byte
    .byte $25,$c4,$f0,$bc,$07,$26,$c4,$4c   ; [$8941] byte
    .byte $a3,$26,$c4,$b2,$8c,$97,$26,$c9   ; [$8949] byte
    .byte $32,$82,$53,$0c,$c8,$f2,$4c,$9b   ; [$8951] byte
    .byte $27,$ca,$32,$5c,$9b,$27,$ca,$30   ; [$8959] byte
    .byte $34,$c4,$ac,$a0,$c9,$70,$cc,$77   ; [$8961] byte
    .byte $1e,$c9,$b2,$7c,$a7,$24,$c9,$70   ; [$8969] byte
    .byte $7b,$05,$72,$5d,$00,$c1,$34,$0c   ; [$8971] byte
    .byte $7b,$14,$d0,$30,$4d,$03,$09,$c1   ; [$8979] byte
    .byte $1c,$13,$06,$c9,$f4,$0b,$09,$0c   ; [$8981] byte
    .byte $53,$4f,$c5,$f0,$9d,$3f,$4a,$c5   ; [$8989] byte
    .byte $dc,$91,$c3,$31,$2d,$28,$34,$2d   ; [$8991] byte
    .byte $14,$34,$2d,$28,$1c,$95,$c8,$f2   ; [$8999] byte
    .byte $4d,$27,$4d,$d2,$20,$0d,$27,$4d   ; [$89a1] byte
    .byte $d2,$1c,$14,$c3,$32,$67,$42,$74   ; [$89a9] byte
    .byte $93,$46,$d2,$07,$42,$73,$0c,$1b   ; [$89b1] byte
    .byte $18,$c7,$72,$87,$46,$53,$47,$47   ; [$89b9] byte
    .byte $46,$55,$72,$57,$47,$70,$50,$07   ; [$89c1] byte
    .byte $47,$5c,$f7,$05,$00,$0c,$19,$c1   ; [$89c9] byte
    .byte $9c,$1b,$05,$00,$0c,$19,$c1,$90   ; [$89d1] byte
    .byte $00,$c1,$9c,$19                   ; [$89d9] byte

MIST_BLOCKS_SCREEN_07:                      ; [$89dd]
    .byte $c1,$b0,$3c,$33,$05,$c6,$32,$4c   ; [$89dd] byte
    .byte $9b,$11,$c9,$f2,$8c,$98,$c4,$71   ; [$89e5] byte
    .byte $2c,$4f,$20,$c1,$0c,$17,$41,$c4   ; [$89ed] byte
    .byte $f2,$5c,$83,$1d,$c9,$2b,$11,$1c   ; [$89f5] byte
    .byte $93,$28,$70,$3b,$03,$c9,$b2,$7c   ; [$89fd] byte
    .byte $a3,$26,$c9,$f1,$2b,$20,$32,$4c   ; [$8a05] byte
    .byte $a0,$c1,$71,$4c,$2f,$2f,$c8,$23   ; [$8a0d] byte
    .byte $0e,$31,$1c,$4f,$28,$72,$8c,$1f   ; [$8a15] byte
    .byte $27,$c1,$b0,$3c,$97,$04,$b1,$1c   ; [$8a1d] byte
    .byte $3b,$08,$c4,$32,$4c,$a0,$c9,$70   ; [$8a25] byte
    .byte $45,$c1,$72,$53,$0c,$b4,$17,$04   ; [$8a2d] byte
    .byte $d0,$30,$4d,$03,$25,$c0,$c7,$41   ; [$8a35] byte
    .byte $c1,$93,$20,$c3,$b1,$1c,$93,$25   ; [$8a3d] byte
    .byte $c0,$70,$bc,$9b,$27,$85,$c1,$72   ; [$8a45] byte
    .byte $83,$13,$c4,$b2,$3c,$97,$03,$32   ; [$8a4d] byte
    .byte $5c,$83,$24,$71,$47,$13,$c1,$b2   ; [$8a55] byte
    .byte $5c,$9b,$12,$ca,$0c,$0f,$01,$c5   ; [$8a5d] byte
    .byte $1c,$2f,$25,$c5,$0c,$a1,$c1,$72   ; [$8a65] byte
    .byte $6c,$48,$70,$3c,$07,$30,$b0,$3c   ; [$8a6d] byte
    .byte $9f,$14,$b2,$8c,$2f,$20,$c1,$b0   ; [$8a75] byte
    .byte $74,$c1,$0d,$03,$04,$d0,$30,$4d   ; [$8a7d] byte
    .byte $03,$28,$c9,$b1,$2c,$9d,$c1,$1c   ; [$8a85] byte
    .byte $10,$c4,$f2,$6c,$9f,$13,$32,$8c   ; [$8a8d] byte
    .byte $33,$04,$00,$c0,$dc,$48,$0c,$4f   ; [$8a95] byte
    .byte $0c,$c4,$8c,$83,$24,$c9,$b2,$8c   ; [$8a9d] byte
    .byte $9b,$0c                           ; [$8aa5] byte

MIST_BLOCKS_SCREEN_08:                      ; [$8aa7]
    .byte $c4,$72,$4c,$2f,$18,$c3,$32,$8c   ; [$8aa7] byte
    .byte $53,$32,$c5,$0c,$33,$12,$c3,$8c   ; [$8aaf] byte
    .byte $4b,$0c,$5c,$30,$c4,$54,$30,$b7   ; [$8ab7] byte
    .byte $0e,$04,$c9,$30,$b7,$11,$c3,$b1   ; [$8abf] byte
    .byte $29,$c2,$f0,$cc,$38,$31,$0c,$8f   ; [$8ac7] byte
    .byte $24,$c9,$70,$cc,$4f,$0e,$c2,$2b   ; [$8acf] byte
    .byte $0b,$c3,$31,$1c,$49,$c4,$0c,$4b   ; [$8ad7] byte
    .byte $13,$72,$6b,$11,$b2,$3c,$93,$28   ; [$8adf] byte
    .byte $c4,$6c,$38,$1c,$9b,$25,$c9,$b0   ; [$8ae7] byte
    .byte $ec,$a3,$20,$c8,$f2,$4c,$94,$c3   ; [$8aef] byte
    .byte $30,$e3,$11,$0c,$4b,$27,$c3,$32   ; [$8af7] byte
    .byte $4c,$9b,$27,$c9,$40,$5c,$4b,$28   ; [$8aff] byte
    .byte $4c,$8f,$24,$c9,$72,$6c,$3b,$11   ; [$8b07] byte
    .byte $c4,$b1,$37,$0c,$c3,$8c,$93,$0c   ; [$8b0f] byte
    .byte $c9,$f2,$3c,$9f,$28,$c3,$30,$e1   ; [$8b17] byte
    .byte $5c,$33,$0e,$32,$4c,$33,$28,$c9   ; [$8b1f] byte
    .byte $b1,$0c,$47,$12,$5c,$93,$26,$c3   ; [$8b27] byte
    .byte $b1,$1c,$38,$c9,$32,$57,$26,$c4   ; [$8b2f] byte
    .byte $30,$87,$13,$c8,$f2,$4c,$9b,$0e   ; [$8b37] byte
    .byte $32,$e3,$12,$c4,$f0,$cc,$3b,$2e   ; [$8b3f] byte
    .byte $c2,$2b,$2e,$c1,$43,$2f,$c1,$40   ; [$8b47] byte
    .byte $03,$2f,$c1,$40,$cb,$c0,$00,$00   ; [$8b4f] byte
    .byte $00                               ; [$8b57] byte

MIST_BLOCKS_SCREEN_09:                      ; [$8b58]
    .byte $c4,$72,$4c,$2f,$18,$c3,$32,$8c   ; [$8b58] byte
    .byte $53,$32,$c5,$0c,$a3,$20,$c1,$f0   ; [$8b60] byte
    .byte $ec,$13,$0c,$5c,$30,$c4,$54,$30   ; [$8b68] byte
    .byte $bc,$94,$9c,$4b,$05,$c9,$30,$bc   ; [$8b70] byte
    .byte $6b,$11,$c8,$dc,$0d,$c2,$f0,$cc   ; [$8b78] byte
    .byte $9f,$28,$ac,$8f,$06,$c9,$70,$cc   ; [$8b80] byte
    .byte $47,$0e,$c9,$30,$33,$07,$c3,$31   ; [$8b88] byte
    .byte $1c,$4a,$5c,$49,$70,$40,$51,$c1   ; [$8b90] byte
    .byte $03,$1d,$4c,$9b,$05,$c9,$b0,$ec   ; [$8b98] byte
    .byte $a3,$24,$c0,$cc,$11,$c3,$30,$ec   ; [$8ba0] byte
    .byte $45,$45,$c3,$32,$4c,$9b,$27,$c9   ; [$8ba8] byte
    .byte $45,$5c,$4b,$24,$72,$8c,$1f,$06   ; [$8bb0] byte
    .byte $c9,$72,$6c,$3b,$11,$c4,$b1,$39   ; [$8bb8] byte
    .byte $c3,$b1,$1c,$93,$25,$ca,$b2,$b5   ; [$8bc0] byte
    .byte $c3,$30,$e1,$5c,$33,$0e,$32,$4c   ; [$8bc8] byte
    .byte $33,$28,$ce,$b3,$bc,$2f,$05,$5c   ; [$8bd0] byte
    .byte $93,$26,$c3,$b1,$1c,$38,$c9,$32   ; [$8bd8] byte
    .byte $57,$26,$ca,$b2,$bc,$97,$80,$c8   ; [$8be0] byte
    .byte $f2,$4c,$9b,$0e,$32,$e3,$12,$c4   ; [$8be8] byte
    .byte $f0,$cc,$3b,$2e,$ce,$b3,$b5,$c1   ; [$8bf0] byte
    .byte $43,$2f,$c1,$40,$03,$2f,$c1,$40   ; [$8bf8] byte
    .byte $cb,$c0,$00,$00,$00               ; [$8c00] byte

MIST_BLOCKS_SCREEN_12:                      ; [$8c05]
    .byte $c1,$32,$4c,$2f,$18,$c3,$30,$4c   ; [$8c05] byte
    .byte $14,$c1,$32,$5c,$33,$12,$c3,$30   ; [$8c0d] byte
    .byte $ec,$33,$04,$c1,$5c,$30,$c9,$30   ; [$8c15] byte
    .byte $5c,$a3,$25,$a3,$05,$30,$4c,$4a   ; [$8c1d] byte
    .byte $70,$bc,$13,$05,$30,$4c,$97,$14   ; [$8c25] byte
    .byte $2c,$97,$27,$ca,$29,$70,$cc,$bf   ; [$8c2d] byte
    .byte $23,$c9,$32,$5c,$53,$30,$44,$c0   ; [$8c35] byte
    .byte $69,$c1,$34,$1c,$13,$25,$c5,$33   ; [$8c3d] byte
    .byte $0c,$c8,$0b,$32,$c0,$f2,$5c,$1b   ; [$8c45] byte
    .byte $25,$70,$3c,$07,$14,$cc,$30,$00   ; [$8c4d] byte
    .byte $17,$03,$c9,$70,$bc,$17,$04,$c5   ; [$8c55] byte
    .byte $30,$7c,$53,$07,$cc,$80,$31,$4c   ; [$8c5d] byte
    .byte $97,$28,$c3,$0c,$8e,$c0,$5c,$15   ; [$8c65] byte
    .byte $c0,$f1,$43,$01,$c0,$f2,$5c,$a3   ; [$8c6d] byte
    .byte $0c,$c4,$72,$3c,$9d,$70,$3c,$19   ; [$8c75] byte
    .byte $c9,$71,$3c,$94,$0c,$33,$11,$31   ; [$8c7d] byte
    .byte $3c,$45,$e0,$25,$c9,$b1,$1c,$9c   ; [$8c85] byte
    .byte $c9,$32,$67,$27,$c4,$f0,$cc,$49   ; [$8c8d] byte
    .byte $55,$c3,$b2,$ec,$93,$25,$32,$83   ; [$8c95] byte
    .byte $13,$1c,$93,$04,$81,$c1,$4c,$07   ; [$8c9d] byte
    .byte $04,$70,$4c,$4f,$25,$c1,$32,$4c   ; [$8ca5] byte
    .byte $a1,$cb,$c1,$c1,$85,$5c,$94,$72   ; [$8cad] byte
    .byte $55                               ; [$8cb5] byte

MIST_BLOCKS_SCREEN_13:                      ; [$8cb6]
    .byte $c4,$b2,$4c,$2f,$04,$c3,$30,$5c   ; [$8cb6] byte
    .byte $10,$0c,$14,$30,$4c,$30,$70,$4c   ; [$8cbe] byte
    .byte $17,$0c,$b1,$2c,$19,$c4,$70,$8c   ; [$8cc6] byte
    .byte $3b,$13,$c2,$72,$6c,$17,$04,$72   ; [$8cce] byte
    .byte $7c,$9b,$08,$c3,$97,$0e,$c8,$30   ; [$8cd6] byte
    .byte $e3,$23,$c3,$32,$4c,$0d,$70,$5c   ; [$8cde] byte
    .byte $38,$c4,$b2,$5c,$13,$24,$c9,$6c   ; [$8ce6] byte
    .byte $8f,$24,$34,$f7,$06,$8c,$48,$c9   ; [$8cee] byte
    .byte $31,$43,$32,$c5,$2c,$93,$4f,$d3   ; [$8cf6] byte
    .byte $74,$57,$05,$32,$33,$25,$cc,$30   ; [$8cfe] byte
    .byte $00,$5c,$e7,$49,$74,$87,$25,$c8   ; [$8d06] byte
    .byte $0c,$93,$32,$00,$73,$9c,$31,$d0   ; [$8d0e] byte
    .byte $97,$05,$c1,$32,$4c,$1f,$14,$03   ; [$8d16] byte
    .byte $39,$32,$55,$d1,$97,$06,$a7,$04   ; [$8d1e] byte
    .byte $c1,$40,$30,$4c,$45,$d1,$d5,$c1   ; [$8d26] byte
    .byte $33,$04,$00,$0b,$05,$03,$04,$c1   ; [$8d2e] byte
    .byte $50,$c5,$00,$10,$07,$1d,$71,$40   ; [$8d36] byte
    .byte $30,$37,$03,$70,$3c,$50,$70,$51   ; [$8d3e] byte
    .byte $cb,$f0,$30,$0c,$05,$c9,$5c,$97   ; [$8d46] byte
    .byte $41,$50                           ; [$8d4e] byte

MIST_BLOCKS_SCREEN_14:                      ; [$8d50]
    .byte $c4,$b0,$50,$c0,$70,$5c,$13,$0c   ; [$8d50] byte
    .byte $30,$4c,$14,$0c,$13,$05,$c1,$1c   ; [$8d58] byte
    .byte $07,$0b,$30,$ca,$30,$5c,$98,$c9   ; [$8d60] byte
    .byte $f2,$6c,$3a,$b0,$1c,$2c,$c3,$31   ; [$8d68] byte
    .byte $2c,$22,$32,$6c,$3b,$23,$c3,$32   ; [$8d70] byte
    .byte $4c,$0d,$c1,$9c,$30,$c2,$30,$ec   ; [$8d78] byte
    .byte $77,$24,$c9,$72,$0c,$8f,$24,$32   ; [$8d80] byte
    .byte $77,$20,$70,$cc,$3b,$08,$c3,$b1   ; [$8d88] byte
    .byte $1c,$93,$25,$c5,$2c,$a3,$0b,$c3   ; [$8d90] byte
    .byte $1c,$a1,$c1,$71,$1c,$22,$c4,$71   ; [$8d98] byte
    .byte $3c,$97,$14,$1c,$e7,$0c,$c3,$b1   ; [$8da0] byte
    .byte $1c,$4d,$c1,$b1,$8b,$1c,$5c,$a3   ; [$8da8] byte
    .byte $0c,$32,$7c,$33,$0e,$31,$dc,$95   ; [$8db0] byte
    .byte $71,$37,$12,$ca,$0c,$9b,$11,$01   ; [$8db8] byte
    .byte $c4,$1c,$0d,$c1,$72,$5c,$a0,$32   ; [$8dc0] byte
    .byte $6c,$44,$c3,$b1,$2c,$3b,$10,$c9   ; [$8dc8] byte
    .byte $30,$bc,$9b,$11,$c1,$b3,$09,$c6   ; [$8dd0] byte
    .byte $31,$13,$0e,$c2,$2c,$8f,$13,$c9   ; [$8dd8] byte
    .byte $5c,$31,$70,$7c,$a3,$11,$c4,$9c   ; [$8de0] byte
    .byte $10,$03,$25,$c2,$f0,$c3,$08,$c1   ; [$8de8] byte
    .byte $5c,$10,$0c,$a3,$25,$c5,$32,$5c   ; [$8df0] byte
    .byte $a2,$00,$1c,$97,$03,$32,$5c,$53   ; [$8df8] byte
    .byte $03,$b0,$38,$ca,$32,$5c,$a1       ; [$8e00] byte

MIST_BLOCKS_SCREEN_15:                      ; [$8e07]
    .byte $c4,$b0,$5c,$1f,$14,$c9,$70,$4c   ; [$8e07] byte
    .byte $17,$04,$0c,$17,$11,$32,$4c,$13   ; [$8e0f] byte
    .byte $05,$30,$47,$30,$b0,$cc,$69,$31   ; [$8e17] byte
    .byte $8c,$98,$c9,$f2,$6b,$06,$33,$07   ; [$8e1f] byte
    .byte $01,$c9,$5c,$43,$11,$c6,$32,$6c   ; [$8e27] byte
    .byte $3b,$23,$c3,$32,$4c,$0d,$31,$4c   ; [$8e2f] byte
    .byte $07,$03,$72,$8c,$47,$24,$c9,$72   ; [$8e37] byte
    .byte $0c,$8f,$24,$32,$5c,$9b,$05,$cb   ; [$8e3f] byte
    .byte $f1,$3c,$0f,$25,$ca,$31,$eb,$25   ; [$8e47] byte
    .byte $c5,$2c,$a3,$0b,$c9,$47,$20,$c2   ; [$8e4f] byte
    .byte $f0,$cc,$97,$28,$c7,$8c,$97,$14   ; [$8e57] byte
    .byte $0c,$e7,$25,$c9,$b2,$7c,$4f,$05   ; [$8e5f] byte
    .byte $c4,$71,$8c,$13,$1d,$70,$4c,$53   ; [$8e67] byte
    .byte $04,$4c,$13,$26,$c3,$b2,$4c,$1f   ; [$8e6f] byte
    .byte $06,$71,$2c,$8f,$24,$71,$4c,$2c   ; [$8e77] byte
    .byte $c4,$cc,$9a,$05,$72,$4c,$a0,$32   ; [$8e7f] byte
    .byte $6c,$60,$c4,$4c,$63,$1d,$ca,$30   ; [$8e87] byte
    .byte $bc,$95,$71,$8c,$9d,$c9,$b1,$13   ; [$8e8f] byte
    .byte $0e,$c4,$30,$eb,$13,$c9,$5c,$31   ; [$8e97] byte
    .byte $c3,$0c,$10,$00,$30,$8b,$12,$b0   ; [$8e9f] byte
    .byte $c3,$04,$0c,$0c,$0c,$a3,$25,$40   ; [$8ea7] byte
    .byte $00,$30,$3c,$95,$32,$5c,$53,$03   ; [$8eaf] byte
    .byte $b0,$3c,$94,$ca,$32,$5c,$a1       ; [$8eb7] byte

MIST_BLOCKS_SCREEN_16:                      ; [$8ebe]
    .byte $c1,$b0,$7c,$10,$c4,$40,$32,$7c   ; [$8ebe] byte
    .byte $9b,$27,$ca,$31,$3c,$38,$c1,$57   ; [$8ec6] byte
    .byte $11,$c4,$9c,$93,$20,$c9,$32,$5c   ; [$8ece] byte
    .byte $a3,$11,$b2,$64,$c1,$9c,$3b,$24   ; [$8ed6] byte
    .byte $c9,$71,$3c,$9b,$11,$72,$8c,$9b   ; [$8ede] byte
    .byte $23,$c9,$54,$70,$ec,$93,$25,$32   ; [$8ee6] byte
    .byte $83,$24,$c9,$72,$6c,$8f,$24,$c9   ; [$8eee] byte
    .byte $b0,$e0,$cb,$f2,$4c,$04,$c0,$f1   ; [$8ef6] byte
    .byte $ec,$10,$0c,$4b,$13,$c1,$00,$c1   ; [$8efe] byte
    .byte $b0,$1c,$1d,$c5,$2c,$97,$0c,$c3   ; [$8f06] byte
    .byte $b1,$1c,$8f,$25,$c9,$b2,$7c,$4f   ; [$8f0e] byte
    .byte $11,$c1,$47,$04,$0c,$4f,$0e,$c4   ; [$8f16] byte
    .byte $72,$3c,$93,$26,$c3,$b1,$10,$17   ; [$8f1e] byte
    .byte $24,$c2,$f2,$64,$c9,$0c,$9b,$11   ; [$8f26] byte
    .byte $00,$30,$4c,$a0,$c6,$b1,$13,$12   ; [$8f2e] byte
    .byte $c9,$f1,$3c,$61,$31,$34,$cb,$f4   ; [$8f36] byte
    .byte $0c,$9f,$0c,$c3,$84,$31,$29,$c9   ; [$8f3e] byte
    .byte $32,$8c,$31,$c1,$b0,$4c,$47,$0e   ; [$8f46] byte
    .byte $c2,$08,$71,$33,$24,$c0,$c9,$cb   ; [$8f4e] byte
    .byte $c0,$00,$00,$00,$c1,$40,$00,$00   ; [$8f56] byte
    .byte $00                               ; [$8f5e] byte

MIST_BLOCKS_SCREEN_17:                      ; [$8f5f]
    .byte $c4,$43,$24,$c9,$70,$cc,$44,$32   ; [$8f5f] byte
    .byte $7c,$9b,$27,$ca,$31,$3d,$07,$04   ; [$8f67] byte
    .byte $4c,$93,$25,$c3,$30,$e4,$00,$b2   ; [$8f6f] byte
    .byte $6d,$01,$71,$2c,$97,$13,$c3,$b1   ; [$8f77] byte
    .byte $1c,$93,$28,$c9,$32,$87,$0e,$c4   ; [$8f7f] byte
    .byte $dc,$4d,$71,$33,$0c,$c4,$72,$4c   ; [$8f87] byte
    .byte $a2,$c9,$72,$6c,$8e,$c9,$b0,$e7   ; [$8f8f] byte
    .byte $05,$b4,$0c,$13,$41,$c1,$34,$1c   ; [$8f97] byte
    .byte $13,$03,$cc,$30,$4c,$0f,$13,$c1   ; [$8f9f] byte
    .byte $31,$25,$c4,$71,$8c,$4b,$08,$c4   ; [$8fa7] byte
    .byte $b1,$3c,$0f,$01,$4c,$53,$0c,$c3   ; [$8faf] byte
    .byte $b1,$13,$04,$57,$11,$72,$87,$14   ; [$8fb7] byte
    .byte $47,$26,$c2,$31,$0c,$13,$05,$71   ; [$8fbf] byte
    .byte $29,$c2,$2c,$4f,$25,$8c,$9b,$08   ; [$8fc7] byte
    .byte $c4,$31,$1c,$14,$5c,$a1,$71,$0c   ; [$8fcf] byte
    .byte $47,$12,$c9,$8c,$23,$10,$c4,$72   ; [$8fd7] byte
    .byte $81,$c4,$b1,$33,$0c,$a8,$c4,$70   ; [$8fdf] byte
    .byte $8c,$43,$11,$ca,$0c,$9b,$46,$44   ; [$8fe7] byte
    .byte $c4,$a3,$08,$31,$0c,$8f,$24,$72   ; [$8fef] byte
    .byte $6c,$3b,$47,$cb,$c0,$00,$00,$00   ; [$8ff7] byte
    .byte $c1,$40,$00,$00,$00               ; [$8fff] byte

MIST_BLOCKS_SCREEN_18:                      ; [$9004]
    .byte $ca,$30,$cc,$17,$07,$c1,$4c,$47   ; [$9004] byte
    .byte $40,$c4,$70,$4c,$9b,$27,$c1,$31   ; [$900c] byte
    .byte $3c,$97,$04,$c3,$31,$1c,$19,$c1   ; [$9014] byte
    .byte $b2,$04,$00,$b2,$6c,$93,$01,$ca   ; [$901c] byte
    .byte $30,$51,$c1,$72,$83,$26,$c3,$87   ; [$9024] byte
    .byte $0e,$c9,$1c,$4d,$c1,$70,$4c,$a1   ; [$902c] byte
    .byte $c0,$70,$37,$24,$32,$6c,$8f,$24   ; [$9034] byte
    .byte $c9,$b1,$d7,$25,$c1,$b2,$8c,$95   ; [$903c] byte
    .byte $cc,$b1,$43,$25,$31,$3c,$0f,$13   ; [$9044] byte
    .byte $31,$27,$28,$c1,$72,$5c,$05,$47   ; [$904c] byte
    .byte $01,$4c,$13,$0c,$31,$1c,$77,$01   ; [$9054] byte
    .byte $c1,$25,$70,$17,$25,$07,$40,$c6   ; [$905c] byte
    .byte $b1,$0c,$10,$ca,$2c,$95,$c5,$32   ; [$9064] byte
    .byte $5c,$4d,$ca,$1c,$98,$c4,$31,$1c   ; [$906c] byte
    .byte $93,$28,$c4,$dc,$a3,$01,$c9,$72   ; [$9074] byte
    .byte $8c,$33,$12,$c9,$8c,$23,$10,$c4   ; [$907c] byte
    .byte $72,$4c,$a0,$30,$6c,$4f,$0c,$c4   ; [$9084] byte
    .byte $f0,$cc,$3b,$10,$c4,$70,$8c,$40   ; [$908c] byte
    .byte $c9,$32,$80,$1c,$16,$c4,$b1,$1c   ; [$9094] byte
    .byte $14,$c2,$31,$0c,$8f,$24,$ca,$32   ; [$909c] byte
    .byte $54,$32,$f0,$0c,$18,$cb,$c0,$00   ; [$90a4] byte
    .byte $4c,$9b,$24,$c1,$30,$50,$00,$00   ; [$90ac] byte

MIST_BLOCKS_SCREEN_19:                      ; [$90b4]
    .byte $c0,$4c,$a0,$c1,$30,$53,$04,$30   ; [$90b4] byte
    .byte $50,$c1,$00,$4c,$0d,$c1,$ac,$94   ; [$90bc] byte
    .byte $c0,$70,$33,$0c,$c9,$f2,$6c,$91   ; [$90c4] byte
    .byte $71,$4c,$13,$05,$b2,$53,$03,$32   ; [$90cc] byte
    .byte $5c,$9b,$0e,$1c,$4f,$01,$c5,$33   ; [$90d4] byte
    .byte $03,$01,$c9,$41,$32,$63,$10,$71   ; [$90dc] byte
    .byte $d7,$25,$5c,$50,$9c,$0e,$30,$cc   ; [$90e4] byte
    .byte $38,$31,$2b,$03,$4c,$04,$c9,$71   ; [$90ec] byte
    .byte $3c,$10,$c3,$30,$ec,$11,$c4,$71   ; [$90f4] byte
    .byte $d3,$04,$00,$ca,$30,$4c,$47,$12   ; [$90fc] byte
    .byte $5c,$23,$11,$c7,$70,$4c,$0c,$32   ; [$9104] byte
    .byte $5c,$0c,$32,$5c,$4e,$b0,$8c,$41   ; [$910c] byte
    .byte $c4,$cc,$93,$28,$c4,$dc,$a3,$25   ; [$9114] byte
    .byte $31,$33,$12,$c3,$97,$12,$72,$4c   ; [$911c] byte
    .byte $a0,$23,$0c,$c9,$8c,$33,$0e,$c2   ; [$9124] byte
    .byte $31,$0c,$8d,$72,$8c,$95,$1c,$9b   ; [$912c] byte
    .byte $11,$c4,$b0,$cc,$3b,$08,$32,$3c   ; [$9134] byte
    .byte $93,$28,$c9,$b2,$78,$cb,$c0,$00   ; [$913c] byte
    .byte $00,$00,$c1,$50,$0c,$14,$00,$00   ; [$9144] byte

MIST_BLOCKS_SCREEN_20:                      ; [$914c]
    .byte $c1,$b0,$1c,$97,$28,$c9,$b2,$7c   ; [$914c] byte
    .byte $0f,$14,$0c,$0f,$28,$c1,$f2,$8c   ; [$9154] byte
    .byte $0f,$06,$c1,$1c,$0f,$0c,$c4,$71   ; [$915c] byte
    .byte $2c,$4f,$25,$70,$1c,$9b,$0c,$c9   ; [$9164] byte
    .byte $f2,$6c,$93,$05,$c0,$71,$4c,$4d   ; [$916c] byte
    .byte $c3,$b1,$0c,$46,$c0,$f2,$57,$0e   ; [$9174] byte
    .byte $1c,$4f,$01,$c5,$32,$5c,$a3,$26   ; [$917c] byte
    .byte $c2,$04,$b2,$63,$10,$c1,$27,$25   ; [$9184] byte
    .byte $5c,$4f,$04,$1c,$3b,$12,$70,$cc   ; [$918c] byte
    .byte $38,$31,$2c,$77,$03,$c1,$0c,$a3   ; [$9194] byte
    .byte $11,$4a,$c1,$01,$c4,$71,$d3,$25   ; [$919c] byte
    .byte $82,$95,$c9,$11,$c7,$70,$cc,$a0   ; [$91a4] byte
    .byte $72,$5c,$a3,$26,$c3,$b0,$8c,$3b   ; [$91ac] byte
    .byte $24,$ca,$32,$6c,$3b,$11,$c4,$cc   ; [$91b4] byte
    .byte $95,$c4,$d7,$20,$c4,$6c,$8f,$28   ; [$91bc] byte
    .byte $c9,$b1,$2c,$43,$12,$72,$5c,$a0   ; [$91c4] byte
    .byte $22,$c3,$00,$c4,$b1,$0c,$8d,$72   ; [$91cc] byte
    .byte $89,$1c,$9b,$11,$87,$12,$c2,$32   ; [$91d4] byte
    .byte $3c,$93,$28,$c9,$b2,$78,$cb,$c0   ; [$91dc] byte
    .byte $00,$00,$00,$c1,$50,$0c,$14,$00   ; [$91e4] byte
    .byte $00                               ; [$91ec] byte

MIST_BLOCKS_SCREEN_21:                      ; [$91ed]
    .byte $c0,$f0,$50,$c9,$b0,$50,$30,$4c   ; [$91ed] byte
    .byte $0f,$04,$c1,$4c,$0c,$c1,$70,$1c   ; [$91f5] byte
    .byte $97,$0c,$c1,$31,$2c,$4f,$25,$ca   ; [$91fd] byte
    .byte $30,$1c,$9b,$06,$c4,$8b,$04,$c0   ; [$9205] byte
    .byte $72,$5c,$4d,$c1,$70,$ec,$46,$70   ; [$920d] byte
    .byte $5c,$13,$05,$71,$dc,$4e,$1c,$a3   ; [$9215] byte
    .byte $26,$c4,$43,$24,$c9,$72,$6c,$1b   ; [$921d] byte
    .byte $1c,$c4,$70,$bc,$33,$25,$2c,$4f   ; [$9225] byte
    .byte $11,$c1,$5c,$93,$25,$32,$8c,$17   ; [$922d] byte
    .byte $1d,$c7,$b0,$cc,$77,$03,$43,$28   ; [$9235] byte
    .byte $72,$4c,$94,$0c,$9b,$27,$ca,$15   ; [$923d] byte
    .byte $c0,$5c,$a3,$26,$81,$c2,$f0,$cc   ; [$9245] byte
    .byte $17,$0c,$b0,$3c,$a0,$95,$32,$7c   ; [$924d] byte
    .byte $4f,$03,$c3,$30,$e3,$11,$c4,$cc   ; [$9255] byte
    .byte $95,$c4,$d7,$20,$c4,$47,$28,$c9   ; [$925d] byte
    .byte $9c,$23,$12,$72,$5c,$a3,$01,$a2   ; [$9265] byte
    .byte $45,$c5,$71,$1b,$27,$72,$8c,$79   ; [$926d] byte
    .byte $5c,$9b,$27,$c4,$f2,$4c,$a0,$c3   ; [$9275] byte
    .byte $30,$eb,$24,$c3,$31,$d5,$cb,$c0   ; [$927d] byte
    .byte $00,$00,$00,$c1,$50,$0c,$14,$00   ; [$9285] byte
    .byte $00                               ; [$928d] byte

MIST_BLOCKS_SCREEN_22:                      ; [$928e]
    .byte $c1,$70,$7c,$9f,$03,$03,$25,$c9   ; [$928e] byte
    .byte $b2,$7c,$93,$03,$0c,$10,$71,$2c   ; [$9296] byte
    .byte $93,$28,$0c,$97,$13,$32,$4c,$0f   ; [$929e] byte
    .byte $25,$c2,$70,$cc,$91,$71,$1c,$4f   ; [$92a6] byte
    .byte $0c,$32,$6c,$4c,$c9,$4c,$27,$26   ; [$92ae] byte
    .byte $d3,$31,$dc,$9b,$05,$13,$26,$c3   ; [$92b6] byte
    .byte $8c,$47,$24,$72,$6c,$31,$c3,$9c   ; [$92be] byte
    .byte $1f,$06,$c1,$0c,$4f,$04,$0c,$93   ; [$92c6] byte
    .byte $07,$72,$8c,$17,$0e,$c1,$07,$05   ; [$92ce] byte
    .byte $c9,$43,$26,$c3,$b1,$1c,$95,$c1   ; [$92d6] byte
    .byte $4c,$47,$24,$c9,$47,$06,$4c,$33   ; [$92de] byte
    .byte $0e,$32,$4c,$a3,$13,$70,$cc,$93   ; [$92e6] byte
    .byte $45,$34,$a5,$c5,$32,$8c,$47,$08   ; [$92ee] byte
    .byte $72,$7c,$4f,$12,$72,$4d,$17,$4d   ; [$92f6] byte
    .byte $34,$87,$05,$72,$5c,$81,$c4,$47   ; [$92fe] byte
    .byte $28,$70,$1d,$27,$42,$1c,$a3,$01   ; [$9306] byte
    .byte $70,$b7,$16,$c3,$b2,$4c,$14,$c0   ; [$930e] byte
    .byte $47,$46,$5c,$97,$05,$57,$11,$c9   ; [$9316] byte
    .byte $30,$53,$01,$30,$37,$47,$5c,$4f   ; [$931e] byte
    .byte $06,$cb,$c0,$00,$00,$00,$c1,$50   ; [$9326] byte
    .byte $0c,$14,$00,$00                   ; [$932e] byte

MIST_BLOCKS_SCREEN_23:                      ; [$9332]
    .byte $c0,$f2,$5d,$07,$30,$c0,$72,$5c   ; [$9332] byte
    .byte $9b,$04,$0c,$9f,$0c,$31,$3c,$30   ; [$933a] byte
    .byte $c9,$72,$6c,$47,$40,$c1,$34,$1c   ; [$9342] byte
    .byte $13,$12,$c4,$5d,$07,$04,$d0,$5c   ; [$934a] byte
    .byte $9b,$04,$07,$26,$c3,$b0,$8c,$3b   ; [$9352] byte
    .byte $08,$c9,$0c,$a3,$13,$c4,$70,$43   ; [$935a] byte
    .byte $18,$c1,$b2,$67,$04,$43,$24,$c2   ; [$9362] byte
    .byte $70,$3c,$07,$25,$c9,$b1,$ac,$63   ; [$936a] byte
    .byte $24,$c1,$30,$54,$c4,$32,$43,$09   ; [$9372] byte
    .byte $d3,$33,$3c,$e5,$c3,$31,$dc,$93   ; [$937a] byte
    .byte $01,$cf,$e7,$10,$c9,$34,$5d,$37   ; [$9382] byte
    .byte $49,$d2,$30,$9c,$05,$c6,$31,$1c   ; [$938a] byte
    .byte $9f,$28,$c1,$30,$6c,$3b,$24,$d3   ; [$9392] byte
    .byte $d1,$4c,$c3,$39,$c9,$92,$c8,$dc   ; [$939a] byte
    .byte $93,$25,$d2,$74,$8d,$35,$47,$25   ; [$93a2] byte
    .byte $71,$2c,$22,$c9,$30,$5c,$13,$45   ; [$93aa] byte
    .byte $5d,$29,$47,$39,$70,$cc,$bb,$20   ; [$93b2] byte
    .byte $c9,$4c,$1b,$4c,$75,$0d,$35,$d4   ; [$93ba] byte
    .byte $1c,$03,$04,$d0,$03,$04,$c0,$70   ; [$93c2] byte
    .byte $cc,$17,$49,$34,$8d,$19,$d2,$05   ; [$93ca] byte
    .byte $cb,$b1,$2c,$4d,$c3,$30,$ec,$11   ; [$93d2] byte
    .byte $35,$0d,$1d,$d4,$1c,$13,$24,$ca   ; [$93da] byte
    .byte $32,$50,$c3,$8c,$16,$c1,$40,$30   ; [$93e2] byte
    .byte $4c,$bf,$28,$c0,$c4               ; [$93ea] byte

MIST_BLOCKS_SCREEN_24:                      ; [$93ef]
    .byte $d0,$32,$5c,$47,$04,$d0,$30,$4c   ; [$93ef] byte
    .byte $9b,$04,$31,$1c,$13,$40,$c3,$31   ; [$93f7] byte
    .byte $3c,$13,$0c,$c1,$32,$6c,$13,$40   ; [$93ff] byte
    .byte $c4,$4b,$12,$c4,$68,$c1,$0c,$9b   ; [$9407] byte
    .byte $11,$2c,$47,$26,$c3,$b0,$8c,$3b   ; [$940f] byte
    .byte $08,$c9,$0c,$a3,$13,$83,$18,$c8   ; [$9417] byte
    .byte $32,$3c,$23,$0e,$31,$1c,$90,$c5   ; [$941f] byte
    .byte $30,$3c,$07,$25,$c9,$b1,$ac,$63   ; [$9427] byte
    .byte $24,$ca,$32,$6c,$3b,$11,$c9,$32   ; [$942f] byte
    .byte $8c,$94,$73,$3c,$e5,$c3,$31,$dc   ; [$9437] byte
    .byte $93,$01,$57,$24,$ca,$32,$5c,$50   ; [$943f] byte
    .byte $0c,$05,$c6,$31,$1c,$9f,$28,$c9   ; [$9447] byte
    .byte $b0,$ec,$4b,$13,$c5,$00,$0c,$c3   ; [$944f] byte
    .byte $0c,$c9,$92,$c8,$f1,$13,$27,$ca   ; [$9457] byte
    .byte $10,$0c,$33,$0e,$34,$0c,$10,$c9   ; [$945f] byte
    .byte $32,$8c,$82,$72,$54,$30,$cc,$38   ; [$9467] byte
    .byte $c4,$70,$cc,$15,$32,$58,$c9,$e0   ; [$946f] byte
    .byte $c3,$30,$e3,$08,$c1,$2c,$12,$70   ; [$9477] byte
    .byte $c4,$31,$3d,$00,$30,$4c,$20,$71   ; [$947f] byte
    .byte $2c,$4e,$d0,$0c,$13,$40,$0c,$a3   ; [$9487] byte
    .byte $0c,$c3,$8d,$03,$04,$d0,$2c,$94   ; [$948f] byte
    .byte $c3,$b2,$80,$0c,$33,$11,$03,$28   ; [$9497] byte
    .byte $c0,$c4                           ; [$949f] byte

MIST_BLOCKS_SCREEN_25:                      ; [$94a1]
    .byte $c3,$b0,$4c,$47,$0e,$c1,$43,$04   ; [$94a1] byte
    .byte $c3,$b1,$1c,$17,$40,$c1,$30,$5c   ; [$94a9] byte
    .byte $13,$05,$70,$89,$c4,$b2,$4c,$97   ; [$94b1] byte
    .byte $28,$c8,$30,$48,$c3,$b0,$8c,$3a   ; [$94b9] byte
    .byte $c4,$69,$c9,$31,$34,$8c,$83,$13   ; [$94c1] byte
    .byte $8c,$91,$ca,$31,$6b,$27,$c9,$72   ; [$94c9] byte
    .byte $81,$c5,$30,$3b,$25,$c9,$b2,$4c   ; [$94d1] byte
    .byte $10,$c9,$72,$0c,$45,$70,$33,$01   ; [$94d9] byte
    .byte $73,$3c,$e5,$ca,$32,$59,$72,$67   ; [$94e1] byte
    .byte $28,$70,$1c,$10,$d0,$0c,$11,$c6   ; [$94e9] byte
    .byte $30,$7c,$9d,$c3,$30,$ec,$4b,$13   ; [$94f1] byte
    .byte $c5,$00,$0c,$2f,$0c,$d0,$1c,$10   ; [$94f9] byte
    .byte $0d,$03,$04,$90,$0c,$0f,$28,$c3   ; [$9501] byte
    .byte $9c,$39,$c9,$32,$8c,$83,$0e,$c4   ; [$9509] byte
    .byte $ac,$95,$30,$33,$0c,$c4,$70,$c1   ; [$9511] byte
    .byte $32,$57,$11,$c9,$32,$80,$c4,$f1   ; [$9519] byte
    .byte $9c,$6b,$11,$c9,$1c,$10,$32,$80   ; [$9521] byte
    .byte $c9,$5c,$0f,$07,$c3,$8c,$41,$c3   ; [$9529] byte
    .byte $31,$2c,$3b,$05,$d0,$1c,$0c,$09   ; [$9531] byte
    .byte $c1,$70,$4d,$03,$05,$d0,$30,$5c   ; [$9539] byte
    .byte $10,$91,$32,$8c,$31,$c1,$34,$1b   ; [$9541] byte
    .byte $28,$70,$4b,$25                   ; [$9549] byte

MIST_BLOCKS_SCREEN_26:                      ; [$954d]
    .byte $d0,$32,$8c,$97,$26,$31,$33,$07   ; [$954d] byte
    .byte $c4,$f1,$1c,$13,$03,$c1,$30,$e0   ; [$9555] byte
    .byte $c1,$72,$5b,$27,$c4,$4c,$61,$c9   ; [$955d] byte
    .byte $72,$0a,$c3,$b0,$87,$04,$c1,$b2   ; [$9565] byte
    .byte $80,$c9,$b1,$07,$25,$32,$8b,$13   ; [$956d] byte
    .byte $c4,$70,$4a,$70,$7c,$98,$c3,$8c   ; [$9575] byte
    .byte $49,$c0,$cb,$25,$c9,$a9,$5c,$10   ; [$957d] byte
    .byte $03,$26,$c9,$f0,$bc,$33,$12,$ca   ; [$9585] byte
    .byte $15,$70,$1c,$0f,$28,$c4,$72,$4c   ; [$958d] byte
    .byte $2f,$20,$c4,$70,$cc,$44,$b0,$c9   ; [$9595] byte
    .byte $5c,$97,$26,$c8,$f1,$4c,$07,$28   ; [$959d] byte
    .byte $9c,$3b,$08,$5c,$3b,$04,$72,$5c   ; [$95a5] byte
    .byte $9b,$11,$c4,$d3,$0b,$c4,$f1,$8c   ; [$95ad] byte
    .byte $45,$c7,$14,$c1,$72,$f3,$0e,$ac   ; [$95b5] byte
    .byte $07,$25,$c8,$31,$1c,$3b,$1c,$c9   ; [$95bd] byte
    .byte $11,$c4,$70,$63,$20,$c4,$b1,$ab   ; [$95c5] byte
    .byte $28,$c9,$ac,$8f,$24,$c9,$9c,$3b   ; [$95cd] byte
    .byte $08,$c8,$30,$5c,$bc,$2c,$77,$0c   ; [$95d5] byte
    .byte $c3,$b1,$2c,$9f,$26,$c4,$71,$2c   ; [$95dd] byte
    .byte $22,$ca,$31,$18,$0c,$bd,$c2,$2c   ; [$95e5] byte
    .byte $13,$2f,$c2,$0c,$bf,$05,$c5,$2c   ; [$95ed] byte
    .byte $83,$04,$00,$03,$05,$c1,$0c,$14   ; [$95f5] byte

MIST_BLOCKS_SCREEN_27:                      ; [$95fd]
    .byte $d0,$32,$8c,$97,$26,$31,$33,$28   ; [$95fd] byte
    .byte $c4,$f1,$1c,$13,$03,$c1,$31,$1c   ; [$9605] byte
    .byte $4b,$13,$c1,$72,$5b,$27,$71,$1c   ; [$960d] byte
    .byte $91,$c9,$72,$0c,$92,$ca,$32,$0c   ; [$9615] byte
    .byte $3b,$04,$72,$80,$c8,$32,$5c,$33   ; [$961d] byte
    .byte $25,$0c,$0c,$c9,$70,$4c,$4b,$27   ; [$9625] byte
    .byte $70,$7c,$98,$c9,$30,$37,$27,$c0   ; [$962d] byte
    .byte $c3,$28,$c3,$31,$1b,$13,$5c,$10   ; [$9635] byte
    .byte $03,$12,$c4,$f2,$5c,$9b,$11,$c3   ; [$963d] byte
    .byte $97,$27,$5c,$0f,$28,$c0,$cc,$83   ; [$9645] byte
    .byte $11,$31,$2c,$47,$0e,$30,$c9,$5c   ; [$964d] byte
    .byte $96,$c0,$73,$0c,$96,$2c,$21,$c4   ; [$9655] byte
    .byte $9c,$9f,$04,$c4,$5c,$a1,$cc,$31   ; [$965d] byte
    .byte $43,$0b,$c4,$f1,$88,$32,$4c,$0c   ; [$9665] byte
    .byte $71,$25,$1c,$07,$25,$c0,$f2,$83   ; [$966d] byte
    .byte $20,$c9,$32,$57,$13,$4c,$4d,$ca   ; [$9675] byte
    .byte $31,$33,$28,$c4,$e2,$c0,$cc,$33   ; [$967d] byte
    .byte $18,$4c,$62,$c8,$31,$8c,$77,$0c   ; [$9685] byte
    .byte $c3,$b1,$87,$26,$70,$cc,$47,$0e   ; [$968d] byte
    .byte $c1,$70,$4c,$15,$c3,$2c,$17,$04   ; [$9695] byte
    .byte $30,$5c,$13,$2f,$c3,$30,$8c,$43   ; [$969d] byte
    .byte $24,$54,$00,$07,$05,$c1,$0c,$17   ; [$96a5] byte
    .byte $04                               ; [$96ad] byte

MIST_BLOCKS_SCREEN_28:                      ; [$96ae]
    .byte $ca,$30,$53,$04,$c9,$b1,$3c,$14   ; [$96ae] byte
    .byte $c1,$30,$33,$25,$c1,$03,$13,$72   ; [$96b6] byte
    .byte $5c,$a3,$27,$70,$4c,$a3,$25,$c0   ; [$96be] byte
    .byte $ec,$97,$04,$32,$5c,$a2,$c1,$44   ; [$96c6] byte
    .byte $c1,$32,$5c,$07,$03,$c0,$5c,$17   ; [$96ce] byte
    .byte $03,$c9,$72,$7c,$4b,$27,$c4,$b2   ; [$96d6] byte
    .byte $8c,$99,$c9,$30,$13,$14,$30,$33   ; [$96de] byte
    .byte $28,$c3,$31,$1c,$3b,$13,$ca,$00   ; [$96e6] byte
    .byte $31,$40,$c9,$4c,$9b,$12,$c3,$97   ; [$96ee] byte
    .byte $27,$c3,$1c,$0d,$c0,$cc,$97,$28   ; [$96f6] byte
    .byte $30,$cc,$47,$0e,$30,$c9,$ca,$30   ; [$96fe] byte
    .byte $1c,$97,$04,$c6,$71,$ac,$63,$20   ; [$9706] byte
    .byte $c3,$31,$1c,$21,$c4,$9c,$9f,$24   ; [$970e] byte
    .byte $c2,$f2,$5c,$a3,$0c,$c4,$70,$e3   ; [$9716] byte
    .byte $12,$c4,$f1,$88,$32,$4c,$0c,$ca   ; [$971e] byte
    .byte $30,$c3,$11,$c3,$ac,$8e,$b2,$8c   ; [$9726] byte
    .byte $9b,$20,$c9,$32,$57,$13,$5c,$8f   ; [$972e] byte
    .byte $20,$72,$4c,$a3,$20,$ac,$83,$13   ; [$9736] byte
    .byte $c0,$cc,$33,$18,$5c,$93,$05,$c1   ; [$973e] byte
    .byte $07,$1a,$c4,$6b,$27,$b0,$cc,$47   ; [$9746] byte
    .byte $0e,$c0,$f0,$4c,$17,$06,$72,$08   ; [$974e] byte
    .byte $11,$ca,$13,$04,$30,$63,$04,$c9   ; [$9756] byte
    .byte $31,$3c,$47,$12,$c4,$f0,$53,$04   ; [$975e] byte
    .byte $c1,$41                           ; [$9766] byte

MIST_BLOCKS_SCREEN_29:                      ; [$9768]
    .byte $d0,$30,$5c,$13,$05,$c1,$30,$5c   ; [$9768] byte
    .byte $33,$04,$c3,$30,$5c,$10,$c1,$4c   ; [$9770] byte
    .byte $10,$30,$67,$27,$b0,$cc,$13,$25   ; [$9778] byte
    .byte $a8,$c3,$30,$48,$c0,$e3,$28,$32   ; [$9780] byte
    .byte $4c,$07,$03,$53,$03,$c9,$72,$7c   ; [$9788] byte
    .byte $4b,$27,$c4,$b2,$8c,$99,$c9,$70   ; [$9790] byte
    .byte $33,$28,$c3,$0c,$0f,$28,$c3,$31   ; [$9798] byte
    .byte $1c,$3b,$13,$ca,$32,$58,$c3,$32   ; [$97a0] byte
    .byte $6c,$9f,$26,$c3,$b2,$7c,$9b,$12   ; [$97a8] byte
    .byte $c3,$97,$27,$c3,$2c,$33,$0e,$31   ; [$97b0] byte
    .byte $13,$08,$31,$1b,$0e,$30,$c9,$ca   ; [$97b8] byte
    .byte $30,$1c,$10,$d0,$30,$4d,$00,$c1   ; [$97c0] byte
    .byte $34,$0c,$13,$40,$c1,$0c,$9f,$24   ; [$97c8] byte
    .byte $c2,$f2,$57,$0c,$c9,$b2,$7c,$a3   ; [$97d0] byte
    .byte $0c,$c4,$b2,$87,$11,$32,$48,$ca   ; [$97d8] byte
    .byte $30,$c3,$11,$c3,$b2,$47,$11,$53   ; [$97e0] byte
    .byte $20,$c9,$32,$5c,$0f,$13,$5c,$8f   ; [$97e8] byte
    .byte $20,$c9,$30,$33,$20,$c3,$ac,$83   ; [$97f0] byte
    .byte $26,$c9,$f0,$3c,$33,$18,$5c,$4b   ; [$97f8] byte
    .byte $0c,$ca,$32,$5c,$99,$c4,$6b,$27   ; [$9800] byte
    .byte $c4,$f0,$cc,$47,$0e,$c1,$00,$c9   ; [$9808] byte
    .byte $72,$0c,$13,$27,$b0,$49,$c1,$00   ; [$9810] byte
    .byte $c1,$b1,$37,$13,$71,$37,$28,$c4   ; [$9818] byte
    .byte $dc,$30,$70,$5c,$31               ; [$9820] byte

MIST_BLOCKS_SCREEN_30:                      ; [$9825]
    .byte $c5,$30,$5c,$30,$c1,$30,$5c,$33   ; [$9825] byte
    .byte $04,$c3,$30,$5c,$10,$c1,$4c,$13   ; [$982d] byte
    .byte $0e,$c1,$1c,$10,$c1,$70,$c3,$25   ; [$9835] byte
    .byte $88,$c4,$b0,$e7,$05,$31,$41,$32   ; [$983d] byte
    .byte $4c,$13,$03,$c3,$0c,$a0,$c7,$72   ; [$9845] byte
    .byte $77,$27,$c4,$b2,$8c,$4f,$28,$c9   ; [$984d] byte
    .byte $70,$33,$28,$71,$dc,$2f,$25,$c3   ; [$9855] byte
    .byte $2c,$3b,$13,$ca,$32,$5b,$26,$c4   ; [$985d] byte
    .byte $f1,$41,$c8,$32,$7c,$4f,$03,$c4   ; [$9865] byte
    .byte $f2,$6c,$6b,$27,$c3,$2c,$33,$0e   ; [$986d] byte
    .byte $c4,$a7,$03,$ab,$0b,$c1,$ec,$77   ; [$9875] byte
    .byte $13,$ca,$30,$1c,$83,$12,$c7,$72   ; [$987d] byte
    .byte $44,$b0,$cc,$47,$13,$70,$40,$0d   ; [$9885] byte
    .byte $03,$04,$d0,$71,$43,$04,$31,$1c   ; [$988d] byte
    .byte $23,$04,$5c,$4b,$20,$ca,$30,$c3   ; [$9895] byte
    .byte $11,$c9,$1c,$a3,$0c,$c4,$b0,$e1   ; [$989d] byte
    .byte $c4,$71,$dc,$a1,$5c,$8f,$24,$ca   ; [$98a5] byte
    .byte $30,$33,$20,$c3,$83,$11,$c9,$f2   ; [$98ad] byte
    .byte $8c,$32,$1c,$4b,$28,$32,$5c,$99   ; [$98b5] byte
    .byte $c4,$43,$27,$c4,$f0,$cc,$93,$25   ; [$98bd] byte
    .byte $c1,$03,$05,$03,$04,$c1,$4c,$10   ; [$98c5] byte
    .byte $30,$5c,$13,$05,$c1,$b1,$3c,$1f   ; [$98cd] byte
    .byte $13,$c9,$71,$3c,$12,$8c,$33,$28   ; [$98d5] byte
    .byte $0c,$32                           ; [$98dd] byte

MIST_BLOCKS_SCREEN_31:                      ; [$98df]
    .byte $cc,$f4,$10,$03,$01,$d0,$4c,$07   ; [$98df] byte
    .byte $41,$0c,$07,$41,$c1,$2c,$13,$1e   ; [$98e7] byte
    .byte $c9,$72,$6c,$9f,$04,$c9,$b2,$7c   ; [$98ef] byte
    .byte $27,$25,$c9,$8c,$10,$c9,$72,$8c   ; [$98f7] byte
    .byte $27,$0b,$c4,$f1,$10,$c9,$20,$c4   ; [$98ff] byte
    .byte $b2,$4c,$97,$20,$ca,$30,$4d,$e3   ; [$9907] byte
    .byte $26,$1c,$77,$28,$c3,$31,$6c,$47   ; [$990f] byte
    .byte $24,$c9,$70,$9c,$53,$09,$c2,$f0   ; [$9917] byte
    .byte $cc,$4b,$0e,$32,$4c,$27,$25,$c8   ; [$991f] byte
    .byte $31,$1c,$93,$45,$c5,$f7,$87,$78   ; [$9927] byte
    .byte $c3,$31,$0c,$3b,$23,$c9,$34,$fd   ; [$992f] byte
    .byte $e3,$0c,$c9,$b2,$4d,$14,$34,$cd   ; [$9937] byte
    .byte $13,$25,$c4,$32,$3c,$93,$45,$0d   ; [$993f] byte
    .byte $33,$28,$c9,$2d,$27,$48,$d2,$8c   ; [$9947] byte
    .byte $97,$26,$c8,$f2,$4d,$e3,$42,$0d   ; [$994f] byte
    .byte $87,$15,$c4,$f1,$27,$50,$d0,$b4   ; [$9957] byte
    .byte $d7,$0c,$c9,$33,$3d,$33,$4d,$d2   ; [$995f] byte
    .byte $b4,$dd,$33,$30,$c9,$72,$47,$48   ; [$9967] byte
    .byte $74,$bc,$4f,$12,$c9,$70,$27,$48   ; [$996f] byte
    .byte $d1,$b4,$97,$00,$cd,$f3,$67,$50   ; [$9977] byte
    .byte $d1,$b4,$3c,$97,$18,$c0,$55,$d1   ; [$997f] byte
    .byte $d5,$30,$a7,$48,$d1,$d5,$c1,$0c   ; [$9987] byte
    .byte $17,$3f,$c1,$4c,$fc,$c1,$40,$0c   ; [$998f] byte
    .byte $13,$05,$c4,$c3,$04,$31,$20,$0c   ; [$9997] byte
    .byte $10,$17,$13                       ; [$999f] byte

MIST_BLOCKS_SCREEN_32:                      ; [$99a2]
    .byte $c1,$34,$13,$03,$d0,$43,$04,$ca   ; [$99a2] byte
    .byte $34,$1d,$03,$41,$0c,$13,$41,$ca   ; [$99aa] byte
    .byte $30,$cc,$13,$1e,$c9,$70,$c0,$b0   ; [$99b2] byte
    .byte $9c,$94,$c9,$8c,$30,$4c,$e6,$c4   ; [$99ba] byte
    .byte $dc,$47,$23,$c9,$37,$8c,$98,$c4   ; [$99c2] byte
    .byte $b2,$0c,$47,$24,$ce,$70,$97,$26   ; [$99ca] byte
    .byte $31,$1c,$93,$28,$c3,$32,$3c,$47   ; [$99d2] byte
    .byte $12,$c9,$1c,$93,$25,$77,$8c,$9b   ; [$99da] byte
    .byte $0e,$32,$4c,$97,$45,$34,$8c,$83   ; [$99e2] byte
    .byte $24,$ca,$32,$6c,$9f,$28,$32,$6c   ; [$99ea] byte
    .byte $3b,$23,$c9,$34,$fc,$13,$4d,$d0   ; [$99f2] byte
    .byte $9c,$94,$c9,$b1,$2c,$91,$c9,$b1   ; [$99fa] byte
    .byte $1c,$1f,$24,$c1,$00,$9c,$7b,$0b   ; [$9a02] byte
    .byte $c8,$32,$4c,$97,$0c,$c4,$70,$e7   ; [$9a0a] byte
    .byte $04,$0c,$91,$1c,$95,$c9,$72,$63   ; [$9a12] byte
    .byte $11,$32,$4d,$41,$c3,$b2,$4d,$13   ; [$9a1a] byte
    .byte $45,$4c,$79,$c9,$b1,$2c,$44,$c9   ; [$9a22] byte
    .byte $f4,$fd,$21,$c9,$34,$fd,$0b,$46   ; [$9a2a] byte
    .byte $95,$d0,$34,$1d,$03,$41,$c9,$34   ; [$9a32] byte
    .byte $25,$c1,$f4,$97,$47,$d0,$9c,$97   ; [$9a3a] byte
    .byte $20,$c5,$b1,$2c,$97,$18,$c1,$70   ; [$9a42] byte
    .byte $40,$70,$5c,$fc,$c1,$5c,$2f,$26   ; [$9a4a] byte
    .byte $c3,$b2,$4c,$9b,$0e,$c4,$c3,$05   ; [$9a52] byte
    .byte $70,$4c,$4b,$05,$c1,$0c,$97,$28   ; [$9a5a] byte
    .byte $c9,$32,$6c,$3b,$24               ; [$9a62] byte

MIST_BLOCKS_SCREEN_33:                      ; [$9a67]
    .byte $c1,$30,$ec,$93,$03,$c9,$b4,$13   ; [$9a67] byte
    .byte $01,$ca,$34,$0c,$17,$1a,$c1,$31   ; [$9a6f] byte
    .byte $ac,$17,$41,$ca,$2c,$a3,$26,$c1   ; [$9a77] byte
    .byte $32,$5c,$16,$c1,$4c,$10,$c9,$8c   ; [$9a7f] byte
    .byte $32,$43,$04,$c9,$4c,$32,$c4,$71   ; [$9a87] byte
    .byte $dc,$98,$b2,$0c,$45,$ce,$70,$cc   ; [$9a8f] byte
    .byte $13,$25,$30,$cc,$3b,$11,$cb,$b1   ; [$9a97] byte
    .byte $2c,$3b,$12,$2c,$17,$04,$5c,$4f   ; [$9a9f] byte
    .byte $28,$c3,$30,$ec,$23,$1d,$c8,$30   ; [$9aa7] byte
    .byte $e3,$11,$c9,$30,$5c,$9f,$0b,$ca   ; [$9aaf] byte
    .byte $32,$6c,$4b,$1a,$c3,$b0,$8c,$8d   ; [$9ab7] byte
    .byte $71,$1c,$bb,$24,$c9,$b0,$4b,$04   ; [$9abf] byte
    .byte $c9,$b1,$17,$0e,$c2,$2c,$77,$1e   ; [$9ac7] byte
    .byte $72,$3c,$93,$01,$c8,$32,$4c,$95   ; [$9acf] byte
    .byte $c4,$70,$e7,$2e,$b2,$3c,$93,$25   ; [$9ad7] byte
    .byte $03,$0b,$c9,$72,$63,$06,$72,$4c   ; [$9adf] byte
    .byte $82,$72,$4c,$97,$26,$c4,$cc,$79   ; [$9ae7] byte
    .byte $c9,$b1,$2c,$8d,$c1,$00,$c9,$32   ; [$9aef] byte
    .byte $8c,$9b,$11,$c4,$89,$c3,$30,$ec   ; [$9af7] byte
    .byte $91,$c3,$8c,$93,$25,$0c,$10,$03   ; [$9aff] byte
    .byte $20,$c5,$b0,$7c,$97,$04,$c4,$b2   ; [$9b07] byte
    .byte $4c,$a0,$72,$6c,$31,$c3,$02,$1c   ; [$9b0f] byte
    .byte $13,$05,$c4,$c3,$26,$31,$20,$0c   ; [$9b17] byte
    .byte $95,$c9,$1c,$3a                   ; [$9b1f] byte

MIST_BLOCKS_SCREEN_34:                      ; [$9b23]
    .byte $c1,$30,$ec,$93,$03,$c9,$b4,$13   ; [$9b23] byte
    .byte $01,$ca,$34,$0c,$17,$1a,$c1,$31   ; [$9b2b] byte
    .byte $ac,$17,$41,$ca,$2c,$a3,$26,$c1   ; [$9b33] byte
    .byte $32,$5c,$16,$c1,$4c,$10,$c9,$8c   ; [$9b3b] byte
    .byte $8e,$43,$04,$c9,$4c,$32,$c4,$71   ; [$9b43] byte
    .byte $dc,$98,$c4,$4c,$93,$7a,$ce,$70   ; [$9b4b] byte
    .byte $cc,$13,$25,$30,$cc,$3b,$11,$cb   ; [$9b53] byte
    .byte $b1,$2c,$38,$c4,$b1,$dc,$95,$5c   ; [$9b5b] byte
    .byte $4f,$28,$c3,$30,$ec,$23,$1d,$c8   ; [$9b63] byte
    .byte $32,$4c,$9b,$11,$c9,$32,$81,$ca   ; [$9b6b] byte
    .byte $32,$6c,$4b,$1a,$c3,$b0,$8c,$8d   ; [$9b73] byte
    .byte $ca,$32,$6c,$47,$23,$ca,$32,$5c   ; [$9b7b] byte
    .byte $1d,$c9,$b1,$17,$0e,$c2,$2c,$77   ; [$9b83] byte
    .byte $1e,$72,$07,$27,$de,$85,$c4,$70   ; [$9b8b] byte
    .byte $ec,$93,$28,$b2,$3c,$93,$25,$30   ; [$9b93] byte
    .byte $cc,$4b,$7a,$ce,$b3,$b5,$72,$4c   ; [$9b9b] byte
    .byte $97,$26,$72,$4c,$97,$26,$c4,$f2   ; [$9ba3] byte
    .byte $3d,$e8,$ca,$b2,$b5,$72,$63,$11   ; [$9bab] byte
    .byte $c9,$32,$8c,$9b,$11,$c4,$b7,$a0   ; [$9bb3] byte
    .byte $ce,$b3,$b7,$80,$c3,$8c,$93,$07   ; [$9bbb] byte
    .byte $c9,$4d,$e8,$00,$ca,$b2,$b5,$c4   ; [$9bc3] byte
    .byte $b2,$4c,$a1,$c1,$4c,$ff,$05,$cf   ; [$9bcb] byte
    .byte $f0,$5c,$ff,$05,$00,$c4,$c1,$40   ; [$9bd3] byte
    .byte $00,$00                           ; [$9bdb] byte

MIST_BLOCKS_SCREEN_37:                      ; [$9bdd]
    .byte $c1,$30,$3c,$13,$03,$c9,$b0,$4c   ; [$9bdd] byte
    .byte $9b,$27,$ca,$31,$d3,$0c,$c4,$b1   ; [$9be5] byte
    .byte $3c,$17,$41,$c0,$6c,$a3,$26,$c4   ; [$9bed] byte
    .byte $f2,$5b,$13,$30,$4c,$a3,$23,$c1   ; [$9bf5] byte
    .byte $2c,$8f,$04,$07,$20,$b2,$7c,$a3   ; [$9bfd] byte
    .byte $26,$c4,$4c,$9f,$20,$32,$3c,$93   ; [$9c05] byte
    .byte $13,$c0,$70,$b3,$25,$b2,$4c,$9b   ; [$9c0d] byte
    .byte $11,$c3,$8c,$93,$28,$c9,$f1,$dc   ; [$9c15] byte
    .byte $97,$04,$70,$7c,$4f,$28,$b2,$6c   ; [$9c1d] byte
    .byte $8e,$c8,$32,$4c,$a0,$c1,$f2,$8c   ; [$9c25] byte
    .byte $13,$13,$5d,$e8,$32,$4b,$1d,$c1   ; [$9c2d] byte
    .byte $00,$72,$59,$5c,$eb,$3b,$72,$6c   ; [$9c35] byte
    .byte $4b,$24,$ca,$32,$07,$27,$57,$04   ; [$9c3d] byte
    .byte $5c,$ab,$2b,$70,$43,$25,$ce,$6b   ; [$9c45] byte
    .byte $24,$c9,$70,$cc,$9f,$13,$4c,$eb   ; [$9c4d] byte
    .byte $3b,$72,$4c,$94,$c5,$32,$5c,$2f   ; [$9c55] byte
    .byte $25,$c3,$30,$e3,$04,$e0,$1d,$e8   ; [$9c5d] byte
    .byte $ca,$0c,$9b,$27,$c9,$8c,$9f,$0c   ; [$9c65] byte
    .byte $c8,$dc,$93,$20,$57,$0c,$c1,$f2   ; [$9c6d] byte
    .byte $57,$24,$c8,$31,$1c,$3b,$23,$c9   ; [$9c75] byte
    .byte $f0,$41,$de,$83,$24,$70,$4d,$03   ; [$9c7d] byte
    .byte $04,$c4,$f0,$4d,$07,$04,$d0,$2c   ; [$9c85] byte
    .byte $a2,$c1,$74,$0c,$4f,$20,$71,$1c   ; [$9c8d] byte
    .byte $4f,$0c,$4c,$a0,$03,$40           ; [$9c95] byte

MIST_BLOCKS_SCREEN_38:                      ; [$9c9b]
    .byte $c1,$30,$5c,$13,$03,$c1,$0c,$14   ; [$9c9b] byte
    .byte $0c,$10,$c4,$b0,$4c,$17,$04,$c0   ; [$9ca3] byte
    .byte $72,$5b,$39,$72,$5e,$03,$39,$c4   ; [$9cab] byte
    .byte $f2,$7c,$a3,$20,$ac,$8e,$c9,$70   ; [$9cb3] byte
    .byte $3c,$10,$c9,$b2,$7c,$a3,$26,$c4   ; [$9cbb] byte
    .byte $49,$32,$3c,$93,$25,$c0,$70,$4c   ; [$9cc3] byte
    .byte $2f,$25,$c8,$23,$0e,$32,$3c,$93   ; [$9ccb] byte
    .byte $28,$72,$4c,$97,$03,$c1,$30,$3c   ; [$9cd3] byte
    .byte $97,$28,$c3,$31,$1c,$3b,$08,$c8   ; [$9cdb] byte
    .byte $f2,$4c,$a0,$c9,$72,$8c,$0e,$72   ; [$9ce3] byte
    .byte $53,$0c,$c3,$b0,$87,$23,$c9,$32   ; [$9ceb] byte
    .byte $8c,$94,$c0,$c9,$c0,$53,$20,$4c   ; [$9cf3] byte
    .byte $47,$24,$c0,$70,$bc,$9b,$27,$85   ; [$9cfb] byte
    .byte $70,$4c,$a1,$c4,$72,$3c,$93,$14   ; [$9d03] byte
    .byte $72,$5c,$83,$24,$70,$cc,$9d,$4c   ; [$9d0b] byte
    .byte $96,$b2,$4c,$94,$9c,$2f,$25,$c3   ; [$9d13] byte
    .byte $30,$ec,$4b,$13,$c1,$1c,$a0,$01   ; [$9d1b] byte
    .byte $ca,$32,$6c,$9f,$0c,$c3,$b1,$1c   ; [$9d23] byte
    .byte $93,$20,$c0,$70,$b7,$07,$c9,$f2   ; [$9d2b] byte
    .byte $5c,$9a,$c9,$b1,$1c,$38,$c4,$31   ; [$9d33] byte
    .byte $2c,$4d,$c0,$f0,$41,$c1,$0d,$03   ; [$9d3b] byte
    .byte $04,$0d,$07,$10,$c1,$70,$4c,$17   ; [$9d43] byte
    .byte $04,$5c,$95,$4c,$4f,$0c,$4c,$83   ; [$9d4b] byte
    .byte $24,$c1,$32,$8b,$0c               ; [$9d53] byte

MIST_BLOCKS_SCREEN_39:                      ; [$9d58]
    .byte $c1,$b0,$3c,$33,$05,$c1,$f2,$4c   ; [$9d58] byte
    .byte $9b,$11,$c9,$f2,$8c,$98,$c4,$71   ; [$9d60] byte
    .byte $2c,$4f,$20,$c1,$0c,$17,$41,$c4   ; [$9d68] byte
    .byte $f2,$5c,$83,$1d,$c9,$2b,$11,$1c   ; [$9d70] byte
    .byte $93,$28,$70,$3b,$03,$c9,$b2,$7c   ; [$9d78] byte
    .byte $a3,$26,$c9,$f1,$2b,$20,$32,$4c   ; [$9d80] byte
    .byte $a0,$c0,$71,$4c,$2f,$2f,$c8,$23   ; [$9d88] byte
    .byte $0e,$31,$1c,$4f,$28,$72,$8c,$1f   ; [$9d90] byte
    .byte $27,$c5,$30,$3c,$97,$04,$b1,$1c   ; [$9d98] byte
    .byte $3b,$08,$c4,$32,$4c,$a0,$c9,$70   ; [$9da0] byte
    .byte $45,$72,$53,$0c,$b4,$17,$04,$d0   ; [$9da8] byte
    .byte $30,$4d,$03,$25,$c0,$c7,$41,$ca   ; [$9db0] byte
    .byte $13,$20,$c3,$b1,$1c,$93,$25,$c0   ; [$9db8] byte
    .byte $70,$bc,$9b,$27,$85,$c9,$63,$13   ; [$9dc0] byte
    .byte $c4,$b2,$3c,$97,$03,$32,$5c,$83   ; [$9dc8] byte
    .byte $24,$71,$47,$13,$c0,$6c,$9b,$12   ; [$9dd0] byte
    .byte $ca,$0c,$0f,$01,$c5,$1c,$2f,$25   ; [$9dd8] byte
    .byte $c5,$0c,$a1,$32,$6c,$48,$70,$3c   ; [$9de0] byte
    .byte $07,$30,$b0,$3c,$9f,$14,$b2,$8c   ; [$9de8] byte
    .byte $2f,$20,$c4,$80,$c1,$0d,$03,$04   ; [$9df0] byte
    .byte $d0,$30,$4d,$03,$28,$c9,$b1,$2c   ; [$9df8] byte
    .byte $9d,$c1,$00,$c4,$f2,$6c,$9f,$13   ; [$9e00] byte
    .byte $32,$8c,$33,$04,$00,$c0,$f1,$20   ; [$9e08] byte
    .byte $0c,$4f,$0c,$c4,$8c,$83,$24,$c9   ; [$9e10] byte
    .byte $b2,$8c,$9b,$0c                   ; [$9e18] byte

MIST_BLOCKS_SCREEN_40:                      ; [$9e1c]
    .byte $c9,$70,$3c,$04,$33,$0c,$cf,$25   ; [$9e1c] byte
    .byte $c1,$30,$5c,$13,$05,$c4,$70,$7c   ; [$9e24] byte
    .byte $17,$20,$c0,$f0,$13,$30,$ce,$72   ; [$9e2c] byte
    .byte $5c,$e6,$c9,$32,$87,$11,$17,$04   ; [$9e34] byte
    .byte $c9,$5c,$ca,$c2,$f2,$7c,$a0,$c9   ; [$9e3c] byte
    .byte $d3,$20,$32,$4c,$a3,$06,$c0,$71   ; [$9e44] byte
    .byte $4c,$e7,$0b,$c3,$32,$63,$24,$c0   ; [$9e4c] byte
    .byte $71,$4c,$96,$72,$8c,$31,$c9,$70   ; [$9e54] byte
    .byte $3c,$97,$04,$c4,$70,$ec,$10,$d0   ; [$9e5c] byte
    .byte $30,$4d,$03,$04,$c9,$70,$c3,$04   ; [$9e64] byte
    .byte $34,$0c,$13,$0c,$c3,$b2,$3c,$93   ; [$9e6c] byte
    .byte $30,$c5,$32,$5c,$47,$25,$b4,$1c   ; [$9e74] byte
    .byte $13,$28,$32,$53,$20,$c8,$f0,$cc   ; [$9e7c] byte
    .byte $6b,$19,$c9,$72,$63,$27,$8c,$31   ; [$9e84] byte
    .byte $c9,$63,$13,$c3,$31,$1c,$4b,$0e   ; [$9e8c] byte
    .byte $c4,$31,$2c,$83,$24,$71,$47,$13   ; [$9e94] byte
    .byte $c0,$6c,$9b,$12,$c8,$1c,$3b,$08   ; [$9e9c] byte
    .byte $c9,$32,$63,$25,$c5,$2c,$49,$32   ; [$9ea4] byte
    .byte $6c,$48,$ca,$1c,$8f,$24,$c9,$ac   ; [$9eac] byte
    .byte $9f,$14,$30,$cc,$3b,$20,$c4,$80   ; [$9eb4] byte
    .byte $c3,$30,$ec,$93,$26,$b0,$4d,$07   ; [$9ebc] byte
    .byte $04,$c3,$31,$1c,$23,$12,$c1,$0d   ; [$9ec4] byte
    .byte $07,$04,$34,$13,$04,$c1,$72,$8c   ; [$9ecc] byte
    .byte $30,$b0,$50,$c0,$f1,$28,$c1,$6c   ; [$9ed4] byte
    .byte $17,$0c,$c4,$8c,$83,$24,$c9,$a1   ; [$9edc] byte

MIST_BLOCKS_SCREEN_41:                      ; [$9ee4]
    .byte $c1,$70,$3c,$13,$12,$c1,$0c,$cf   ; [$9ee4] byte
    .byte $25,$c2,$f0,$6c,$13,$25,$c2,$70   ; [$9eec] byte
    .byte $cc,$3b,$18,$c1,$0c,$06,$ce,$72   ; [$9ef4] byte
    .byte $5c,$17,$0c,$30,$4c,$27,$28,$d3   ; [$9efc] byte
    .byte $1c,$11,$c1,$70,$1c,$cb,$05,$30   ; [$9f04] byte
    .byte $cc,$13,$11,$c3,$8d,$33,$0c,$32   ; [$9f0c] byte
    .byte $4c,$27,$0c,$c0,$71,$4c,$e7,$0b   ; [$9f14] byte
    .byte $52,$1c,$33,$24,$d1,$4d,$33,$04   ; [$9f1c] byte
    .byte $c9,$70,$3c,$97,$0c,$5c,$44,$0c   ; [$9f24] byte
    .byte $93,$45,$34,$27,$06,$ca,$03,$26   ; [$9f2c] byte
    .byte $b2,$3c,$93,$28,$c8,$32,$4d,$3f   ; [$9f34] byte
    .byte $4d,$d0,$b4,$d5,$72,$5c,$33,$11   ; [$9f3c] byte
    .byte $c8,$f2,$5c,$04,$c9,$72,$6d,$33   ; [$9f44] byte
    .byte $48,$d2,$b4,$95,$c9,$70,$cc,$4b   ; [$9f4c] byte
    .byte $27,$c3,$31,$33,$19,$c6,$b2,$05   ; [$9f54] byte
    .byte $d1,$95,$c2,$f1,$ac,$46,$c9,$31   ; [$9f5c] byte
    .byte $5c,$97,$28,$31,$35,$d1,$d5,$c4   ; [$9f64] byte
    .byte $f2,$7c,$57,$25,$cc,$f0,$40,$cc   ; [$9f6c] byte
    .byte $ec,$13,$05,$03,$04,$c4,$8c,$9b   ; [$9f74] byte
    .byte $27,$cd,$b2,$7c,$db,$25,$cd,$a2   ; [$9f7c] byte
    .byte $c3,$31,$1c,$13,$06,$cb,$c0,$00   ; [$9f84] byte
    .byte $c1,$72,$f3,$05,$a2,$b0,$43,$06   ; [$9f8c] byte
    .byte $30,$4c,$1b,$04,$c1,$b0,$42,$c9   ; [$9f94] byte
    .byte $a2                               ; [$9f9c] byte

MIST_BLOCKS_SCREEN_42:                      ; [$9f9d]
    .byte $c0,$c0,$0c,$14,$c4,$cc,$a3,$25   ; [$9f9d] byte
    .byte $c5,$32,$8c,$33,$05,$72,$54,$c9   ; [$9fa5] byte
    .byte $70,$5c,$31,$c1,$30,$50,$c9,$b2   ; [$9fad] byte
    .byte $07,$18,$70,$1c,$13,$05,$c1,$0c   ; [$9fb5] byte
    .byte $47,$08,$72,$7c,$a3,$20,$b0,$4c   ; [$9fbd] byte
    .byte $9a,$c0,$72,$5c,$1b,$25,$c9,$b0   ; [$9fc5] byte
    .byte $cb,$10,$c3,$ac,$9b,$23,$c1,$32   ; [$9fcd] byte
    .byte $6c,$a3,$04,$c9,$70,$5c,$13,$0c   ; [$9fd5] byte
    .byte $70,$57,$11,$c9,$32,$5c,$83,$24   ; [$9fdd] byte
    .byte $ca,$32,$52,$30,$3c,$a3,$26,$b2   ; [$9fe5] byte
    .byte $3c,$93,$28,$c0,$d0,$0c,$a0,$c0   ; [$9fed] byte
    .byte $f0,$4c,$33,$11,$c8,$f2,$50,$c0   ; [$9ff5] byte
    .byte $5c,$53,$01,$41,$c1,$32,$0c,$4b   ; [$9ffd] byte
    .byte $27,$c3,$31,$33,$28,$c0,$c0,$72   ; [$a005] byte
    .byte $6c,$9d,$72,$8a,$c9,$31,$5c,$95   ; [$a00d] byte
    .byte $30,$bc,$33,$27,$c4,$f1,$12,$c1   ; [$a015] byte
    .byte $72,$5c,$57,$25,$cc,$f0,$bc,$db   ; [$a01d] byte
    .byte $0b,$c1,$00,$05,$70,$3c,$1f,$27   ; [$a025] byte
    .byte $cd,$b0,$40,$c9,$f2,$8c,$9b,$13   ; [$a02d] byte
    .byte $c3,$31,$18,$cb,$f0,$47,$04,$32   ; [$a035] byte
    .byte $8c,$33,$18,$72,$6c,$44,$c8,$e3   ; [$a03d] byte
    .byte $0e,$c1,$b0,$57,$1a,$31,$8c,$38   ; [$a045] byte
    .byte $c4,$4c,$4b,$0e,$c9,$32,$6c,$38   ; [$a04d] byte

MIST_BLOCKS_SCREEN_43:                      ; [$a055]
    .byte $c0,$cc,$13,$05,$c1,$30,$5c,$94   ; [$a055] byte
    .byte $c4,$f0,$5c,$13,$05,$0c,$13,$11   ; [$a05d] byte
    .byte $c1,$0c,$97,$03,$b2,$5c,$13,$05   ; [$a065] byte
    .byte $ca,$0a,$c9,$b2,$0a,$c1,$70,$1c   ; [$a06d] byte
    .byte $0f,$04,$b2,$8c,$9b,$27,$c1,$32   ; [$a075] byte
    .byte $7b,$20,$c4,$8c,$9b,$24,$c0,$72   ; [$a07d] byte
    .byte $59,$ca,$32,$6c,$38,$ac,$9b,$23   ; [$a085] byte
    .byte $72,$6c,$a0,$c9,$70,$33,$0b,$71   ; [$a08d] byte
    .byte $17,$11,$b1,$2c,$47,$27,$ca,$32   ; [$a095] byte
    .byte $51,$1c,$a3,$26,$c3,$32,$0c,$93   ; [$a09d] byte
    .byte $28,$c8,$24,$c4,$dc,$a3,$0c,$4c   ; [$a0a5] byte
    .byte $33,$11,$c8,$f2,$50,$53,$24,$c9   ; [$a0ad] byte
    .byte $4c,$10,$72,$0c,$4b,$27,$c3,$31   ; [$a0b5] byte
    .byte $37,$28,$c3,$1c,$4b,$13,$72,$6c   ; [$a0bd] byte
    .byte $33,$24,$c9,$b2,$7a,$c9,$32,$53   ; [$a0c5] byte
    .byte $0c,$c3,$b1,$0c,$47,$24,$c1,$0c   ; [$a0cd] byte
    .byte $a0,$c8,$32,$4c,$57,$25,$cc,$f0   ; [$a0d5] byte
    .byte $bc,$33,$0e,$31,$2c,$93,$26,$c3   ; [$a0dd] byte
    .byte $32,$83,$27,$c1,$00,$cd,$b0,$c1   ; [$a0e5] byte
    .byte $c4,$72,$4c,$10,$4c,$9e,$c3,$31   ; [$a0ed] byte
    .byte $0c,$47,$2f,$80,$0c,$bf,$11,$c8   ; [$a0f5] byte
    .byte $d1,$c4,$43,$1a,$31,$8c,$38,$c4   ; [$a0fd] byte
    .byte $4c,$4b,$0e,$c9,$32,$6c,$91       ; [$a105] byte

MIST_BLOCKS_SCREEN_44:                      ; [$a10c]
    .byte $cb,$f2,$5c,$33,$07,$c1,$30,$50   ; [$a10c] byte
    .byte $00,$c1,$30,$53,$04,$c2,$f2,$8c   ; [$a114] byte
    .byte $d9,$00,$00,$2c,$9f,$0c,$5c,$2f   ; [$a11c] byte
    .byte $28,$c9,$b2,$7c,$a3,$26,$31,$2c   ; [$a124] byte
    .byte $47,$12,$4a,$c0,$72,$5c,$07,$25   ; [$a12c] byte
    .byte $c8,$32,$4c,$83,$11,$c3,$b0,$8c   ; [$a134] byte
    .byte $43,$0e,$9c,$82,$c9,$70,$3c,$a3   ; [$a13c] byte
    .byte $33,$c0,$f2,$5c,$a2,$43,$23,$c9   ; [$a144] byte
    .byte $32,$52,$ca,$01,$c5,$12,$9c,$47   ; [$a14c] byte
    .byte $24,$c4,$dc,$a3,$04,$00,$c9,$70   ; [$a154] byte
    .byte $17,$20,$c4,$ec,$93,$28,$c9,$4c   ; [$a15c] byte
    .byte $33,$20,$ca,$03,$26,$c9,$d7,$28   ; [$a164] byte
    .byte $c3,$30,$ec,$9d,$72,$6c,$10,$c9   ; [$a16c] byte
    .byte $b2,$7c,$83,$04,$32,$51,$71,$0c   ; [$a174] byte
    .byte $10,$0c,$a3,$0c,$c8,$32,$4c,$57   ; [$a17c] byte
    .byte $25,$30,$bc,$a3,$26,$c1,$0c,$93   ; [$a184] byte
    .byte $26,$c3,$32,$8c,$33,$23,$80,$c1   ; [$a18c] byte
    .byte $00,$c4,$72,$4c,$30,$0c,$6b,$10   ; [$a194] byte
    .byte $71,$0c,$45,$00,$03,$11,$c8,$d3   ; [$a19c] byte
    .byte $0e,$c4,$43,$1a,$31,$8c,$38,$c4   ; [$a1a4] byte
    .byte $4c,$4b,$0e,$c9,$32,$6c,$38       ; [$a1ac] byte

MIST_BLOCKS_SCREEN_45:                      ; [$a1b3]
    .byte $cb,$f2,$5c,$0c,$c1,$f1,$4c,$0f   ; [$a1b3] byte
    .byte $25,$ca,$32,$6c,$4f,$28,$c9,$72   ; [$a1bb] byte
    .byte $83,$1e,$c1,$b2,$8c,$d9,$5c,$06   ; [$a1c3] byte
    .byte $c9,$b1,$1c,$33,$27,$11,$5c,$2f   ; [$a1cb] byte
    .byte $28,$c5,$07,$25,$70,$e3,$11,$4c   ; [$a1d3] byte
    .byte $97,$14,$c1,$72,$5c,$07,$25,$70   ; [$a1db] byte
    .byte $1c,$97,$28,$c8,$30,$8c,$41,$c8   ; [$a1e3] byte
    .byte $f2,$5c,$79,$c1,$30,$3c,$1f,$32   ; [$a1eb] byte
    .byte $c0,$73,$99,$70,$e3,$23,$c9,$1c   ; [$a1f3] byte
    .byte $50,$c1,$67,$04,$a1,$5c,$47,$24   ; [$a1fb] byte
    .byte $c4,$f1,$e4,$c0,$d7,$32,$ce,$5c   ; [$a203] byte
    .byte $97,$20,$c4,$ec,$93,$28,$c9,$44   ; [$a20b] byte
    .byte $ca,$30,$5c,$c3,$01,$c0,$d7,$28   ; [$a213] byte
    .byte $c3,$31,$2c,$4d,$73,$9c,$c0,$c9   ; [$a21b] byte
    .byte $b0,$6c,$07,$03,$32,$51,$71,$1a   ; [$a223] byte
    .byte $41,$c8,$30,$5c,$0f,$25,$30,$bc   ; [$a22b] byte
    .byte $a3,$26,$c4,$70,$e9,$c3,$32,$87   ; [$a233] byte
    .byte $33,$c3,$30,$48,$c0,$d5,$43,$12   ; [$a23b] byte
    .byte $4c,$6b,$13,$71,$09,$0c,$13,$05   ; [$a243] byte
    .byte $00,$30,$40,$c4,$43,$1a,$c1,$14   ; [$a24b] byte
    .byte $c4,$4c,$49,$c9,$32,$67,$05       ; [$a253] byte

MIST_BLOCKS_SCREEN_46:                      ; [$a25a]
    .byte $c1,$34,$1c,$17,$03,$d0,$4c,$0f   ; [$a25a] byte
    .byte $40,$32,$6d,$03,$28,$c9,$74,$0c   ; [$a262] byte
    .byte $a0,$c0,$4c,$13,$41,$c1,$31,$4d   ; [$a26a] byte
    .byte $02,$c9,$ac,$33,$27,$d0,$32,$89   ; [$a272] byte
    .byte $cc,$31,$43,$40,$c5,$0c,$07,$25   ; [$a27a] byte
    .byte $2c,$3b,$04,$8c,$97,$04,$73,$2c   ; [$a282] byte
    .byte $c2,$32,$53,$28,$c8,$1c,$43,$11   ; [$a28a] byte
    .byte $c8,$f2,$53,$14,$43,$32,$cc,$70   ; [$a292] byte
    .byte $11,$c9,$b0,$e3,$23,$c9,$1c,$52   ; [$a29a] byte
    .byte $40,$9d,$03,$04,$d0,$70,$4d,$03   ; [$a2a2] byte
    .byte $24,$c4,$d0,$43,$32,$c5,$1c,$97   ; [$a2aa] byte
    .byte $20,$c4,$f1,$1c,$93,$28,$c9,$74   ; [$a2b2] byte
    .byte $00,$4c,$52,$c0,$72,$53,$28,$32   ; [$a2ba] byte
    .byte $0c,$4d,$73,$9c,$53,$01,$71,$4c   ; [$a2c2] byte
    .byte $07,$03,$11,$02,$4c,$a3,$25,$5c   ; [$a2ca] byte
    .byte $0f,$25,$30,$bc,$a3,$26,$c4,$b1   ; [$a2d2] byte
    .byte $30,$c3,$32,$8c,$33,$33,$c5,$30   ; [$a2da] byte
    .byte $bc,$97,$26,$c1,$1c,$33,$0e,$0c   ; [$a2e2] byte
    .byte $49,$4c,$6b,$27,$c1,$43,$04,$0c   ; [$a2ea] byte
    .byte $14,$30,$43,$05,$30,$40,$c4,$43   ; [$a2f2] byte
    .byte $1a,$70,$50,$c1,$0d,$04,$c9,$34   ; [$a2fa] byte
    .byte $1d,$03,$39                       ; [$a302] byte

MIST_BLOCKS_SCREEN_47:                      ; [$a305]
    .byte $c1,$34,$1c,$a3,$07,$ca,$32,$4c   ; [$a305] byte
    .byte $0f,$25,$c9,$8c,$38,$c4,$70,$ec   ; [$a30d] byte
    .byte $a3,$04,$31,$1c,$4e,$31,$4c,$97   ; [$a315] byte
    .byte $0c,$70,$ec,$33,$20,$2b,$05,$ca   ; [$a31d] byte
    .byte $31,$3b,$25,$c5,$0c,$a3,$20,$c4   ; [$a325] byte
    .byte $72,$4c,$9b,$27,$ca,$32,$4c,$9b   ; [$a32d] byte
    .byte $04,$c9,$72,$08,$72,$50,$ca,$32   ; [$a335] byte
    .byte $6c,$43,$11,$b2,$5c,$47,$05,$c0   ; [$a33d] byte
    .byte $e8,$d0,$03,$28,$c9,$b0,$e3,$23   ; [$a345] byte
    .byte $c9,$87,$04,$cc,$2b,$28,$c9,$70   ; [$a34d] byte
    .byte $1c,$96,$c1,$34,$0c,$10,$ca,$31   ; [$a355] byte
    .byte $1d,$05,$d0,$03,$33,$43,$20,$c4   ; [$a35d] byte
    .byte $f1,$1c,$93,$26,$1c,$17,$40,$c2   ; [$a365] byte
    .byte $f0,$13,$14,$c0,$53,$28,$32,$0c   ; [$a36d] byte
    .byte $9b,$11,$30,$5c,$13,$30,$c9,$53   ; [$a375] byte
    .byte $03,$b0,$b5,$c9,$b1,$1c,$38,$54   ; [$a37d] byte
    .byte $4c,$0f,$25,$27,$26,$c4,$b0,$e3   ; [$a385] byte
    .byte $11,$c1,$70,$4c,$4f,$28,$72,$8b   ; [$a38d] byte
    .byte $26,$c3,$2c,$33,$0e,$0c,$4b,$13   ; [$a395] byte
    .byte $5c,$a3,$03,$c1,$00,$03,$05,$30   ; [$a39d] byte
    .byte $4c,$14,$c1,$32,$8c,$2c,$c4,$41   ; [$a3a5] byte
    .byte $d0,$4c,$83,$11,$c4,$b2,$3d,$05   ; [$a3ad] byte
    .byte $48                               ; [$a3b5] byte

MIST_BLOCKS_SCREEN_48:                      ; [$a3b6]
    .byte $ce,$f2,$10,$00,$00,$00,$77,$dd   ; [$a3b6] byte
    .byte $6c,$df,$35,$bd,$f3,$5b,$df,$35   ; [$a3be] byte
    .byte $bd,$f3,$5b,$df,$35,$bd,$f3,$5b   ; [$a3c6] byte
    .byte $76,$8d,$d3,$75,$dc,$f7,$4d,$cf   ; [$a3ce] byte
    .byte $75,$dc,$f7,$4d,$cf,$75,$dc,$f7   ; [$a3d6] byte
    .byte $4d,$cf,$75,$77,$bd,$ab,$5c,$75   ; [$a3de] byte
    .byte $c7,$5c,$75,$c7,$5c,$75,$c7,$5c   ; [$a3e6] byte
    .byte $5d,$9f,$70,$77,$07,$70,$77,$07   ; [$a3ee] byte
    .byte $70,$77,$07,$70,$76,$9d,$bf,$5c   ; [$a3f6] byte
    .byte $77,$67,$77,$77,$67,$77,$77,$67   ; [$a3fe] byte
    .byte $77,$76,$8d,$53,$5d,$75,$c7,$5c   ; [$a406] byte
    .byte $75,$c7,$5c,$75,$c7,$5c,$5d,$57   ; [$a40e] byte
    .byte $70,$77,$07,$70,$77,$07,$70,$77   ; [$a416] byte
    .byte $07,$7a,$75,$90,$00,$03,$6a,$77   ; [$a41e] byte
    .byte $ad,$93,$6e,$76,$8d,$53,$2c,$dc   ; [$a426] byte
    .byte $f2,$cd,$cf,$2c,$dc,$f2,$cd,$cf   ; [$a42e] byte
    .byte $2c,$76,$ed,$f3,$0f,$5c,$3c,$70   ; [$a436] byte
    .byte $f7,$57,$75,$77,$57,$de,$b6,$ad   ; [$a43e] byte
    .byte $cf,$54,$5d,$ef,$6a,$75,$47,$54   ; [$a446] byte
    .byte $75,$57,$54,$76,$87,$0f,$de,$47   ; [$a44e] byte
    .byte $79,$00,$00,$00                   ; [$a456] byte

MIST_BLOCKS_SCREEN_49:                      ; [$a45a]
    .byte $c8,$40,$00,$00,$de,$80,$d6,$cd   ; [$a45a] byte
    .byte $f3,$5b,$df,$75,$bd,$f3,$5b,$0d   ; [$a462] byte
    .byte $f3,$5b,$43,$7d,$d5,$30,$fd,$cf   ; [$a46a] byte
    .byte $54,$c3,$f5,$7d,$cf,$54,$d5,$4d   ; [$a472] byte
    .byte $cf,$54,$db,$9d,$a7,$6f,$c3,$f5   ; [$a47a] byte
    .byte $77,$5c,$d5,$f5,$c7,$5c,$cb,$35   ; [$a482] byte
    .byte $c7,$5c,$cb,$2d,$f3,$5c,$75,$57   ; [$a48a] byte
    .byte $70,$b7,$07,$70,$b7,$07,$70,$b7   ; [$a492] byte
    .byte $0d,$cf,$70,$57,$5c,$d7,$67,$5c   ; [$a49a] byte
    .byte $d7,$67,$5c,$d7,$67,$5c,$75,$45   ; [$a4a2] byte
    .byte $dc,$15,$dc,$15,$dc,$15,$de,$b6   ; [$a4aa] byte
    .byte $a7,$70,$cb,$27,$70,$d5,$e7,$70   ; [$a4b2] byte
    .byte $cb,$27,$70,$d6,$ed,$93,$2c,$07   ; [$a4ba] byte
    .byte $2c,$07,$2c,$07,$2c,$c3,$f6,$ed   ; [$a4c2] byte
    .byte $bd,$dc,$15,$dc,$15,$dc,$15,$75   ; [$a4ca] byte
    .byte $4d,$eb,$6a,$d5,$30,$f7,$57,$c3   ; [$a4d2] byte
    .byte $f5,$77,$57,$c3,$f5,$77,$54,$77   ; [$a4da] byte
    .byte $b7,$68,$c3,$f5,$77,$54,$75,$57   ; [$a4e2] byte
    .byte $54,$75,$47,$0f,$de,$5d,$e4,$00   ; [$a4ea] byte
    .byte $00,$00                           ; [$a4f2] byte

MIST_BLOCKS_SCREEN_50:                      ; [$a4f4]
    .byte $de,$80,$00,$03,$66,$de,$83,$2a   ; [$a4f4] byte
    .byte $4d,$99,$d9,$9d,$99,$d9,$9d,$f7   ; [$a4fc] byte
    .byte $5b,$df,$5d,$ef,$3a,$d6,$cd,$f3   ; [$a504] byte
    .byte $5b,$13,$7d,$d6,$ed,$93,$54,$d5   ; [$a50c] byte
    .byte $76,$67,$2a,$c3,$f5,$7d,$cf,$5c   ; [$a514] byte
    .byte $d5,$f6,$67,$68,$c3,$f6,$ed,$cb   ; [$a51c] byte
    .byte $5c,$cb,$36,$e7,$3a,$d7,$35,$57   ; [$a524] byte
    .byte $70,$b6,$e9,$d4,$77,$0d,$cf,$2c   ; [$a52c] byte
    .byte $d4,$67,$2a,$d7,$67,$5c,$d7,$6d   ; [$a534] byte
    .byte $f3,$56,$d9,$c0,$07,$3a,$dc,$15   ; [$a53c] byte
    .byte $dc,$1d,$cf,$5c,$dc,$35,$cd,$f3   ; [$a544] byte
    .byte $5c,$dc,$35,$c7,$2a,$cb,$27,$70   ; [$a54c] byte
    .byte $cb,$27,$70,$d5,$ed,$cf,$70,$d5   ; [$a554] byte
    .byte $e7,$3a,$c3,$e7,$2c,$07,$2c,$07   ; [$a55c] byte
    .byte $2c,$07,$2a,$cb,$25,$df,$95,$df   ; [$a564] byte
    .byte $95,$df,$97,$3a,$c3,$f5,$47,$0f   ; [$a56c] byte
    .byte $b5,$57,$55,$b5,$57,$57,$b5,$4d   ; [$a574] byte
    .byte $f3,$2a,$75,$55,$35,$77,$54,$d5   ; [$a57c] byte
    .byte $d7,$54,$c3,$dd,$cf,$3a,$de,$43   ; [$a584] byte
    .byte $6a,$77,$a0,$36,$ac,$b3,$7a,$03   ; [$a58c] byte
    .byte $2a                               ; [$a594] byte

MIST_BLOCKS_SCREEN_51:                      ; [$a595]
    .byte $ce,$f2,$10,$00,$00,$00,$77,$d0   ; [$a595] byte
    .byte $00,$03,$5b,$df,$40,$5d,$70,$00   ; [$a59d] byte
    .byte $00,$00,$5d,$74,$00,$00,$00,$5d   ; [$a5a5] byte
    .byte $d3,$75,$dd,$37,$5d,$d3,$75,$dd   ; [$a5ad] byte
    .byte $37,$5d,$d3,$75,$dd,$37,$5d,$d3   ; [$a5b5] byte
    .byte $75,$5d,$da,$b7,$7d,$da,$b7,$7d   ; [$a5bd] byte
    .byte $da,$b7,$7d,$da,$5d,$d2,$dd,$ed   ; [$a5c5] byte
    .byte $d2,$dd,$ed,$d2,$dd,$ed,$d2,$5d   ; [$a5cd] byte
    .byte $db,$77,$b7,$0d,$db,$77,$ad,$db   ; [$a5d5] byte
    .byte $77,$ad,$db,$77,$5c,$b3,$1b,$cb   ; [$a5dd] byte
    .byte $30,$fc,$b3,$0f,$cb,$30,$fc,$b3   ; [$a5e5] byte
    .byte $0f,$cb,$30,$fc,$b3,$0f,$77,$bd   ; [$a5ed] byte
    .byte $46,$d5,$6d,$46,$d5,$6d,$46,$df   ; [$a5f5] byte
    .byte $ad,$46,$5d,$67,$67,$d6,$76,$7d   ; [$a5fd] byte
    .byte $67,$67,$d6,$76,$73,$59,$36,$7d   ; [$a605] byte
    .byte $64,$5d,$a7,$5d,$35,$7d,$74,$d5   ; [$a60d] byte
    .byte $f5,$d3,$54,$d7,$4c,$3f,$5d,$5d   ; [$a615] byte
    .byte $a1,$30,$f4,$d5,$13,$55,$4d,$55   ; [$a61d] byte

MIST_BLOCKS_SCREEN_52:                      ; [$a625]
    .byte $c8,$40,$00,$00,$00,$df,$4d,$6c   ; [$a625] byte
    .byte $00,$00,$03,$3a,$d7,$00,$00,$37   ; [$a62d] byte
    .byte $33,$2d,$cb,$35,$ed,$7f,$2a,$d7   ; [$a635] byte
    .byte $40,$03,$7e,$d7,$72,$dc,$d3,$5e   ; [$a63d] byte
    .byte $d7,$f2,$dd,$8f,$3a,$dd,$37,$5d   ; [$a645] byte
    .byte $d3,$75,$dd,$37,$57,$70,$37,$ec   ; [$a64d] byte
    .byte $fb,$63,$cb,$35,$ed,$7f,$2a,$dd   ; [$a655] byte
    .byte $77,$7d,$da,$b7,$7d,$c3,$74,$dd   ; [$a65d] byte
    .byte $6d,$cf,$5e,$d7,$f2,$dd,$8f,$3a   ; [$a665] byte
    .byte $dd,$ed,$d2,$dd,$ed,$73,$76,$dd   ; [$a66d] byte
    .byte $f5,$cc,$fb,$63,$cb,$35,$ed,$7f   ; [$a675] byte
    .byte $2a,$dd,$ad,$db,$77,$ad,$c2,$37   ; [$a67d] byte
    .byte $0d,$cf,$5e,$d7,$f2,$dc,$d3,$3a   ; [$a685] byte
    .byte $cb,$30,$fc,$b3,$1b,$cb,$30,$fc   ; [$a68d] byte
    .byte $b2,$32,$dd,$8c,$cb,$35,$ed,$7f   ; [$a695] byte
    .byte $2a,$c3,$ed,$38,$4d,$38,$cb,$37   ; [$a69d] byte
    .byte $33,$5e,$d7,$f2,$dd,$8f,$3a,$d6   ; [$a6a5] byte
    .byte $43,$67,$d6,$76,$7d,$67,$67,$d6   ; [$a6ad] byte
    .byte $76,$73,$59,$36,$7d,$67,$2a,$d7   ; [$a6b5] byte
    .byte $4d,$5f,$5d,$35,$7d,$74,$d5,$f5   ; [$a6bd] byte
    .byte $d3,$54,$d7,$4c,$3f,$3a,$45,$30   ; [$a6c5] byte
    .byte $f4,$d5,$13,$55,$4d,$57,$2a       ; [$a6cd] byte

MIST_BLOCKS_SCREEN_53:                      ; [$a6d4]
    .byte $c8,$4d,$ef,$21,$00,$00,$00,$ce   ; [$a6d4] byte
    .byte $f7,$d7,$7d,$df,$35,$b3,$7c,$d6   ; [$a6dc] byte
    .byte $cd,$f3,$5b,$37,$cd,$6f,$3a,$76   ; [$a6e4] byte
    .byte $87,$68,$dc,$f2,$dc,$d3,$73,$cb   ; [$a6ec] byte
    .byte $73,$4d,$cf,$2d,$cd,$37,$3c,$b7   ; [$a6f4] byte
    .byte $2a,$55,$76,$21,$d8,$87,$62,$1d   ; [$a6fc] byte
    .byte $8b,$3a,$55,$72,$c1,$df,$b2,$c7   ; [$a704] byte
    .byte $2c,$1d,$53,$2a,$55,$5d,$51,$cb   ; [$a70c] byte
    .byte $07,$7e,$5c,$b3,$3a,$5d,$bb,$6f   ; [$a714] byte
    .byte $77,$4d,$d5,$dd,$37,$57,$74,$dd   ; [$a71c] byte
    .byte $5d,$d3,$2a,$5c,$3c,$75,$c1,$d7   ; [$a724] byte
    .byte $07,$5c,$1d,$73,$3a,$57,$1b,$77   ; [$a72c] byte
    .byte $6d,$dd,$dd,$b7,$77,$76,$dd,$dd   ; [$a734] byte
    .byte $ef,$2a,$76,$70,$00,$00,$07,$67   ; [$a73c] byte
    .byte $76,$8c,$3c,$00,$00,$0d,$bb,$6f   ; [$a744] byte
    .byte $5d,$ef,$6a,$cb,$04,$cb,$04,$cb   ; [$a74c] byte
    .byte $08,$77,$97,$79,$00,$00,$00       ; [$a754] byte

MIST_BLOCKS_SCREEN_54:                      ; [$a75b]
    .byte $ce,$f7,$bd,$e4,$00,$00,$00,$50   ; [$a75b] byte
    .byte $36,$0d,$ec,$36,$01,$0d,$83,$7b   ; [$a763] byte
    .byte $50,$14,$13,$7b,$05,$77,$dd,$6c   ; [$a76b] byte
    .byte $43,$7d,$51,$00,$76,$8d,$d3,$75   ; [$a773] byte
    .byte $db,$9d,$a7,$6f,$5d,$ec,$df,$75   ; [$a77b] byte
    .byte $b7,$7d,$5d,$db,$77,$c3,$ed,$bf   ; [$a783] byte
    .byte $1b,$43,$69,$db,$f5,$7d,$bb,$6f   ; [$a78b] byte
    .byte $77,$ad,$ab,$55,$c3,$60,$db,$9d   ; [$a793] byte
    .byte $a7,$6f,$c6,$f5,$4c,$3c,$5d,$a1   ; [$a79b] byte
    .byte $d5,$35,$cd,$d3,$75,$d7,$2d,$bf   ; [$a7a3] byte
    .byte $5c,$dd,$37,$5d,$71,$76,$9b,$6a   ; [$a7ab] byte
    .byte $d7,$35,$dd,$db,$77,$d7,$63,$5d   ; [$a7b3] byte
    .byte $dd,$b7,$7d,$76,$d6,$76,$87,$68   ; [$a7bb] byte
    .byte $dc,$37,$6d,$de,$b7,$03,$76,$dd   ; [$a7c3] byte
    .byte $eb,$70,$c3,$cd,$ba,$da,$b5,$7c   ; [$a7cb] byte
    .byte $3c,$d5,$f0,$f0,$d5,$70,$fd,$53   ; [$a7d3] byte
    .byte $0f,$01,$da,$32,$cd,$d3,$75,$cb   ; [$a7db] byte
    .byte $0d,$d3,$75,$cb,$0d,$d3,$75,$de   ; [$a7e3] byte
    .byte $40,$00,$00,$00                   ; [$a7eb] byte

MIST_BLOCKS_SCREEN_55:                      ; [$a7ef]
    .byte $de,$43,$68,$c3,$f7,$90,$36,$ac   ; [$a7ef] byte
    .byte $3f,$79,$03,$3a,$de,$c1,$76,$ed   ; [$a7f7] byte
    .byte $6c,$36,$87,$6e,$d6,$c0,$df,$41   ; [$a7ff] byte
    .byte $d3,$8c,$3f,$4e,$30,$fd,$38,$c3   ; [$a807] byte
    .byte $f4,$e3,$0f,$dd,$b7,$7c,$6f,$0f   ; [$a80f] byte
    .byte $dd,$b7,$7d,$5f,$76,$dd,$dd,$db   ; [$a817] byte
    .byte $77,$77,$6d,$dd,$cb,$37,$0c,$3c   ; [$a81f] byte
    .byte $dc,$32,$cd,$57,$70,$cb,$1d,$c3   ; [$a827] byte
    .byte $7b,$da,$b7,$0c,$b1,$00,$03,$57   ; [$a82f] byte
    .byte $c3,$cd,$5d,$d9,$c0,$43,$55,$c3   ; [$a837] byte
    .byte $53,$55,$4d,$57,$6e,$db,$f5,$4c   ; [$a83f] byte
    .byte $3c,$35,$6d,$9f,$2a,$ca,$f6,$a7   ; [$a847] byte
    .byte $54,$40,$0d,$5d,$32,$cc,$f3,$3a   ; [$a84f] byte
    .byte $ce,$f6,$70,$03,$6a,$75,$5b,$54   ; [$a857] byte
    .byte $43,$2a,$ca,$f6,$9c,$f0,$03,$0f   ; [$a85f] byte
    .byte $35,$44,$32,$c7,$3a,$ce,$f6,$8c   ; [$a867] byte
    .byte $3f,$4e,$d7,$35,$4d,$3b,$5c,$d5   ; [$a86f] byte
    .byte $74,$ed,$47,$57,$4d,$ed,$77,$bd   ; [$a877] byte
    .byte $ab,$2c,$d7,$72,$c3,$5d,$cb,$0d   ; [$a87f] byte
    .byte $4f,$2c,$de,$45,$5d,$e4,$00,$00   ; [$a887] byte

MIST_BLOCKS_SCREEN_56:                      ; [$a88f]
    .byte $ce,$f7,$bd,$a3,$5d,$30,$fd,$74   ; [$a88f] byte
    .byte $c3,$f5,$d3,$0f,$d7,$4c,$3f,$5d   ; [$a897] byte
    .byte $df,$57,$70,$35,$cd,$c0,$d7,$37   ; [$a89f] byte
    .byte $03,$5c,$dc,$0d,$73,$70,$c3,$f6   ; [$a8a7] byte
    .byte $ed,$bf,$74,$dd,$6d,$d3,$75,$b7   ; [$a8af] byte
    .byte $4d,$d6,$dd,$37,$5b,$74,$4d,$73   ; [$a8b7] byte
    .byte $76,$dd,$f5,$cd,$db,$77,$d7,$37   ; [$a8bf] byte
    .byte $6d,$df,$5c,$dd,$b7,$7d,$73,$76   ; [$a8c7] byte
    .byte $4d,$c3,$0f,$37,$0d,$57,$0f,$dc   ; [$a8cf] byte
    .byte $35,$7d,$53,$70,$c3,$cd,$c3,$0f   ; [$a8d7] byte
    .byte $d6,$76,$70,$d6,$76,$ac,$3f,$57   ; [$a8df] byte
    .byte $d5,$b5,$93,$67,$00,$83,$55,$c3   ; [$a8e7] byte
    .byte $70,$f3,$55,$c3,$cd,$57,$0f,$35   ; [$a8ef] byte
    .byte $4c,$3c,$35,$5d,$5e,$03,$54,$40   ; [$a8f7] byte
    .byte $0d,$5d,$35,$4d,$3b,$54,$74,$ed   ; [$a8ff] byte
    .byte $53,$55,$d3,$93,$4e,$75,$5d,$3b   ; [$a907] byte
    .byte $54,$4d,$47,$0f,$d5,$f5,$1d,$57   ; [$a90f] byte
    .byte $0f,$d4,$53,$51,$75,$4d,$47,$0f   ; [$a917] byte
    .byte $34,$ed,$4d,$d3,$b5,$3c,$3f,$4e   ; [$a91f] byte
    .byte $d4,$f5,$4d,$3b,$53,$d5,$74,$ed   ; [$a927] byte
    .byte $4f,$57,$72,$c5,$cb,$17,$2c,$72   ; [$a92f] byte
    .byte $c1,$cb,$07,$2c,$de,$40,$00,$00   ; [$a937] byte
    .byte $00                               ; [$a93f] byte

MIST_BLOCKS_SCREEN_57:                      ; [$a940]
    .byte $d7,$71,$bc,$3f,$5d,$30,$fd,$74   ; [$a940] byte
    .byte $c3,$f5,$d3,$0f,$d7,$4c,$3f,$21   ; [$a948] byte
    .byte $dc,$35,$c3,$70,$35,$cd,$c0,$d7   ; [$a950] byte
    .byte $37,$03,$5c,$dc,$0d,$73,$5b,$dd   ; [$a958] byte
    .byte $63,$74,$dd,$6d,$d3,$75,$b7,$4d   ; [$a960] byte
    .byte $d6,$dd,$37,$5b,$74,$dd,$f5,$c3   ; [$a968] byte
    .byte $76,$dd,$f5,$cd,$db,$77,$d7,$37   ; [$a970] byte
    .byte $6d,$df,$5c,$dd,$b7,$7d,$73,$76   ; [$a978] byte
    .byte $c3,$f7,$03,$0f,$37,$0d,$57,$0f   ; [$a980] byte
    .byte $dc,$35,$7d,$53,$70,$c3,$cd,$c3   ; [$a988] byte
    .byte $0f,$d6,$76,$70,$d6,$76,$70,$35   ; [$a990] byte
    .byte $93,$67,$00,$83,$55,$c3,$70,$f3   ; [$a998] byte
    .byte $55,$c3,$cd,$57,$0f,$35,$4c,$3c   ; [$a9a0] byte
    .byte $31,$bd,$5e,$00,$00,$0d,$5d,$0d   ; [$a9a8] byte
    .byte $39,$34,$ed,$53,$55,$d3,$93,$4e   ; [$a9b0] byte
    .byte $75,$5d,$3b,$54,$4d,$45,$d5,$f5   ; [$a9b8] byte
    .byte $1d,$57,$0f,$d4,$53,$51,$75,$4d   ; [$a9c0] byte
    .byte $47,$0f,$34,$ed,$4d,$d3,$b5,$3c   ; [$a9c8] byte
    .byte $3f,$4e,$d4,$f5,$4d,$3b,$53,$d5   ; [$a9d0] byte
    .byte $74,$ed,$4f,$57,$72,$c5,$cb,$17   ; [$a9d8] byte
    .byte $2c,$72,$c1,$cb,$07,$2c,$de,$40   ; [$a9e0] byte
    .byte $00,$00,$00                       ; [$a9e8] byte

MIST_BLOCKS_SCREEN_58:                      ; [$a9eb]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$a9eb] byte
    .byte $00,$03,$3a,$dd,$77,$03,$74,$dd   ; [$a9f3] byte
    .byte $77,$0d,$d3,$75,$dc,$37,$4d,$d7   ; [$a9fb] byte
    .byte $70,$dd,$37,$5d,$c3,$2a,$dd,$f5   ; [$aa03] byte
    .byte $c3,$76,$dd,$f5,$cd,$db,$77,$d7   ; [$aa0b] byte
    .byte $37,$6d,$df,$5c,$dd,$b7,$7d,$73   ; [$aa13] byte
    .byte $3a,$c3,$f7,$03,$22,$37,$0c,$88   ; [$aa1b] byte
    .byte $dc,$35,$7d,$53,$70,$c3,$cd,$c3   ; [$aa23] byte
    .byte $2a,$d6,$76,$70,$d6,$76,$7d,$67   ; [$aa2b] byte
    .byte $6a,$d5,$b5,$9d,$ab,$22,$43,$3a   ; [$aa33] byte
    .byte $c3,$c3,$55,$c3,$70,$f3,$55,$c3   ; [$aa3b] byte
    .byte $cd,$5b,$67,$da,$b5,$4d,$ef,$2a   ; [$aa43] byte
    .byte $71,$bd,$5e,$00,$00,$d5,$b6,$77   ; [$aa4b] byte
    .byte $3a,$4d,$39,$34,$ed,$53,$55,$d3   ; [$aa53] byte
    .byte $93,$4e,$b5,$57,$2a,$74,$ed,$45   ; [$aa5b] byte
    .byte $d3,$b5,$1d,$57,$4e,$d4,$5d,$3b   ; [$aa63] byte
    .byte $51,$75,$4d,$bb,$3a,$75,$5d,$4d   ; [$aa6b] byte
    .byte $d5,$75,$3c,$3e,$d4,$f5,$4d,$57   ; [$aa73] byte
    .byte $53,$d5,$6d,$57,$2a,$72,$c7,$22   ; [$aa7b] byte
    .byte $cb,$1c,$8b,$2c,$72,$2c,$b1,$cb   ; [$aa83] byte
    .byte $32,$21,$de,$40,$00,$00,$00       ; [$aa8b] byte

MIST_BLOCKS_SCREEN_59:                      ; [$aa92]
    .byte $ca,$f7,$dd,$ec,$03,$7d,$d6,$c0   ; [$aa92] byte
    .byte $00,$5d,$6c,$07,$69,$cb,$03,$57   ; [$aa9a] byte
    .byte $c3,$cc,$b3,$0f,$5c,$b0,$07,$68   ; [$aaa2] byte
    .byte $4d,$56,$d5,$32,$c1,$54,$0d,$bb   ; [$aaaa] byte
    .byte $6f,$40,$30,$f0,$54,$cb,$53,$2d   ; [$aab2] byte
    .byte $40,$c3,$64,$77,$bd,$a9,$25,$75   ; [$aaba] byte
    .byte $7c,$b5,$de,$f6,$a4,$5d,$9c,$00   ; [$aac2] byte
    .byte $d9,$20,$76,$70,$5d,$7b,$5f,$cb   ; [$aaca] byte
    .byte $73,$4c,$b0,$37,$e7,$7e,$76,$8c   ; [$aad2] byte
    .byte $b3,$3a,$5d,$a3,$2c,$d7,$b5,$fc   ; [$aada] byte
    .byte $fb,$34,$4c,$b6,$57,$2a,$77,$dd   ; [$aae2] byte
    .byte $7b,$5f,$cb,$73,$4d,$79,$72,$dd   ; [$aaea] byte
    .byte $52,$db,$b6,$fc,$3f,$3a,$5c,$b0   ; [$aaf2] byte
    .byte $d7,$b5,$fc,$f9,$4b,$2c,$b2,$cd   ; [$aafa] byte
    .byte $57,$2a,$5d,$7b,$5f,$cb,$73,$4d   ; [$ab02] byte
    .byte $79,$72,$d8,$01,$de,$40,$00,$00   ; [$ab0a] byte
    .byte $03,$3a                           ; [$ab12] byte

MIST_BLOCKS_SCREEN_60:                      ; [$ab14]
    .byte $ca,$f7,$d0,$00,$d6,$c0,$00,$c3   ; [$ab14] byte
    .byte $c0,$00,$0d,$5b,$67,$da,$b0,$f0   ; [$ab1c] byte
    .byte $32,$c1,$cb,$07,$2c,$17,$59,$72   ; [$ab24] byte
    .byte $c1,$1c,$3c,$75,$45,$c3,$c5,$70   ; [$ab2c] byte
    .byte $f5,$00,$35,$54,$05,$50,$00,$0d   ; [$ab34] byte
    .byte $5d,$37,$b5,$de,$e4,$d6,$4d,$9c   ; [$ab3c] byte
    .byte $d6,$76,$ab,$56,$d9,$d5,$76,$70   ; [$ab44] byte
    .byte $ce,$f7,$dc,$3c,$c6,$c7,$2c,$15   ; [$ab4c] byte
    .byte $da,$76,$fc,$b3,$0f,$ca,$d7,$5c   ; [$ab54] byte
    .byte $75,$c7,$5c,$55,$da,$b5,$c7,$5c   ; [$ab5c] byte
    .byte $ce,$dd,$73,$5d,$b5,$db,$5d,$b6   ; [$ab64] byte
    .byte $e5,$00,$ca,$dd,$c1,$dc,$1d,$c1   ; [$ab6c] byte
    .byte $20,$00,$77,$bd,$aa,$c3,$ec,$3e   ; [$ab74] byte
    .byte $0d,$5b,$67,$da,$b7,$0d,$ef,$6a   ; [$ab7c] byte
    .byte $ce,$dd,$e4,$00,$00,$07,$79       ; [$ab84] byte

MIST_BLOCKS_SCREEN_61:                      ; [$ab8b]
    .byte $ca,$f7,$dd,$ef,$3a,$ce,$f7,$bd   ; [$ab8b] byte
    .byte $f4,$d6,$c0,$03,$3a,$c3,$c5,$5d   ; [$ab93] byte
    .byte $a3,$0f,$0d,$54,$c3,$c1,$72,$cd   ; [$ab9b] byte
    .byte $bb,$5b,$17,$2c,$72,$cd,$53,$2c   ; [$aba3] byte
    .byte $72,$c7,$2a,$5c,$3f,$56,$d6,$65   ; [$abab] byte
    .byte $55,$57,$3a,$41,$76,$ac,$3c,$0d   ; [$abb3] byte
    .byte $57,$0f,$03,$2a,$41,$5d,$5d,$0d   ; [$abbb] byte
    .byte $53,$57,$4d,$ef,$3a,$d6,$4d,$9f   ; [$abc3] byte
    .byte $6a,$cb,$35,$6d,$64,$d9,$c0,$07   ; [$abcb] byte
    .byte $2a,$cb,$30,$fc,$b3,$0f,$c6,$cc   ; [$abd3] byte
    .byte $3c,$03,$55,$c3,$c7,$3a,$75,$c7   ; [$abdb] byte
    .byte $5c,$de,$f6,$a7,$5c,$75,$c7,$5c   ; [$abe3] byte
    .byte $d5,$f5,$c7,$2a,$d6,$76,$73,$59   ; [$abeb] byte
    .byte $76,$8d,$73,$5d,$b5,$db,$5d,$b5   ; [$abf3] byte
    .byte $dd,$bb,$3a,$d7,$00,$db,$b6,$fd   ; [$abfb] byte
    .byte $c1,$dc,$1d,$c1,$dc,$1d,$c3,$2a   ; [$ac03] byte
    .byte $dc,$00,$d5,$35,$7c,$3e,$d5,$6d   ; [$ac0b] byte
    .byte $52,$c3,$ed,$5f,$3a,$de,$40,$00   ; [$ac13] byte
    .byte $00,$00                           ; [$ac1b] byte

MIST_BLOCKS_SCREEN_62:                      ; [$ac1d]
    .byte $ce,$f7,$bd,$f7,$5b,$00,$00,$0d   ; [$ac1d] byte
    .byte $ef,$3a,$ca,$dd,$a3,$0f,$00,$0d   ; [$ac25] byte
    .byte $54,$c3,$c5,$57,$3e,$cd,$35,$ed   ; [$ac2d] byte
    .byte $7f,$3e,$cd,$35,$ed,$7f,$3e,$cd   ; [$ac35] byte
    .byte $35,$e7,$2a,$57,$54,$d5,$72,$c3   ; [$ac3d] byte
    .byte $57,$c3,$f2,$c3,$54,$d5,$72,$c7   ; [$ac45] byte
    .byte $3a,$ce,$dd,$9c,$03,$6a,$cb,$36   ; [$ac4d] byte
    .byte $70,$07,$2a,$ca,$dd,$a3,$0f,$0c   ; [$ac55] byte
    .byte $b0,$0d,$53,$57,$c3,$c7,$3a,$ce   ; [$ac5d] byte
    .byte $d5,$d7,$1d,$d3,$75,$dd,$37,$5d   ; [$ac65] byte
    .byte $5f,$5c,$47,$2a,$ca,$d7,$74,$dd   ; [$ac6d] byte
    .byte $4d,$da,$d5,$f7,$7d,$d0,$dd,$57   ; [$ac75] byte
    .byte $3a,$ce,$f6,$9d,$bf,$76,$37,$7d   ; [$ac7d] byte
    .byte $53,$57,$dd,$f7,$5d,$db,$77,$1d   ; [$ac85] byte
    .byte $bb,$2a,$da,$f1,$bc,$3f,$55,$d5   ; [$ac8d] byte
    .byte $f5,$4d,$db,$77,$dd,$ad,$57,$54   ; [$ac95] byte
    .byte $c3,$c3,$3a,$db,$32,$20,$d5,$2c   ; [$ac9d] byte
    .byte $b0,$0c,$88,$03,$2a,$de,$40,$00   ; [$aca5] byte
    .byte $00,$00,$00,$00,$00,$00           ; [$acad] byte

MIST_BLOCKS_SCREEN_63:                      ; [$acb3]
    .byte $c8,$40,$00,$00,$00,$ca,$f7,$dd   ; [$acb3] byte
    .byte $6c,$00,$00,$00,$76,$9c,$b3,$5e   ; [$acbb] byte
    .byte $d7,$f2,$cd,$53,$5c,$0c,$3f,$54   ; [$acc3] byte
    .byte $d5,$f5,$c0,$76,$85,$5d,$d3,$75   ; [$accb] byte
    .byte $dc,$37,$4d,$d5,$dd,$37,$5d,$c3   ; [$acd3] byte
    .byte $74,$ce,$d5,$5d,$db,$77,$d7,$37   ; [$acdb] byte
    .byte $6d,$df,$0f,$dd,$b7,$7d,$73,$76   ; [$ace3] byte
    .byte $ca,$d5,$5d,$57,$74,$77,$5c,$3f   ; [$aceb] byte
    .byte $57,$d5,$77,$47,$75,$ce,$d5,$5c   ; [$acf3] byte
    .byte $3f,$76,$dc,$37,$7d,$5e,$b7,$6d   ; [$acfb] byte
    .byte $c3,$77,$ca,$d5,$53,$5c,$cb,$35   ; [$ad03] byte
    .byte $cc,$b1,$35,$cc,$3f,$5c,$55,$5c   ; [$ad0b] byte
    .byte $3f,$5d,$c3,$f5,$dc,$3c,$35,$d7   ; [$ad13] byte
    .byte $5d,$ce,$f7,$bd,$a9,$57,$7e,$5d   ; [$ad1b] byte
    .byte $57,$54,$d5,$f7,$e5,$ca,$dd,$9c   ; [$ad23] byte
    .byte $0d,$ab,$5d,$d5,$17,$0f,$35,$dd   ; [$ad2b] byte
    .byte $5d,$ce,$dd,$eb,$6a,$d7,$b5,$fc   ; [$ad33] byte
    .byte $b3,$67,$0d,$ab,$67,$0d,$ab,$67   ; [$ad3b] byte
    .byte $57,$68,$cf,$b3,$47,$0f,$d7,$37   ; [$ad43] byte
    .byte $0d,$73,$0f,$d7,$37,$0d,$73,$0f   ; [$ad4b] byte

MIST_BLOCKS_SCREEN_64:                      ; [$ad53]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$ad53] byte
    .byte $00,$00,$c3,$f5,$4d,$57,$5c,$0c   ; [$ad5b] byte
    .byte $3f,$54,$c3,$f5,$c0,$c3,$f1,$bc   ; [$ad63] byte
    .byte $3c,$dd,$75,$5d,$d3,$75,$dc,$37   ; [$ad6b] byte
    .byte $4d,$d7,$55,$dd,$37,$5d,$c3,$74   ; [$ad73] byte
    .byte $dd,$60,$dd,$f0,$fd,$db,$77,$d7   ; [$ad7b] byte
    .byte $37,$6d,$df,$54,$dd,$b7,$7d,$73   ; [$ad83] byte
    .byte $76,$dd,$d3,$3a,$b5,$4b,$5c,$0d   ; [$ad8b] byte
    .byte $54,$c3,$f5,$c0,$c3,$cd,$ed,$71   ; [$ad93] byte
    .byte $bd,$5f,$70,$0c,$6f,$0f,$d5,$f7   ; [$ad9b] byte
    .byte $00,$d5,$b6,$75,$cb,$1c,$b3,$5c   ; [$ada3] byte
    .byte $cb,$35,$cc,$b2,$cb,$35,$cc,$b3   ; [$adab] byte
    .byte $5c,$cb,$30,$f5,$c3,$dd,$5f,$5d   ; [$adb3] byte
    .byte $c3,$f5,$dc,$6f,$0f,$35,$dc,$3f   ; [$adbb] byte
    .byte $5d,$c3,$f0,$dd,$b9,$75,$4c,$3d   ; [$adc3] byte
    .byte $5c,$3e,$77,$ed,$55,$d5,$e1,$75   ; [$adcb] byte
    .byte $55,$c6,$dc,$6e,$d5,$35,$dd,$5d   ; [$add3] byte
    .byte $c3,$cc,$35,$d6,$47,$56,$d6,$4d   ; [$addb] byte
    .byte $ab,$56,$d9,$f5,$9d,$ab,$56,$d9   ; [$ade3] byte
    .byte $f5,$9d,$a9,$d7,$37,$0d,$72,$d7   ; [$adeb] byte
    .byte $37,$0d,$73,$1b,$d7,$37,$0d,$73   ; [$adf3] byte
    .byte $70,$d7,$30,$f1                   ; [$adfb] byte

MIST_BLOCKS_SCREEN_65:                      ; [$adff]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$adff] byte
    .byte $00,$00,$c3,$f5,$4d,$7b,$5f,$cf   ; [$ae07] byte
    .byte $b2,$cc,$fb,$2c,$cf,$b2,$cd,$7b   ; [$ae0f] byte
    .byte $5f,$cf,$b2,$cc,$fb,$2c,$d5,$dc   ; [$ae17] byte
    .byte $b0,$cf,$1d,$7b,$5f,$b3,$cc,$fb   ; [$ae1f] byte
    .byte $2c,$cf,$1d,$7b,$5f,$ce,$f5,$90   ; [$ae27] byte
    .byte $00,$00,$00,$76,$9c,$fb,$2c,$cf   ; [$ae2f] byte
    .byte $32,$cd,$7b,$5f,$cf,$b2,$cc,$fb   ; [$ae37] byte
    .byte $2c,$35,$ec,$b3,$5e,$76,$8d,$7b   ; [$ae3f] byte
    .byte $5f,$80,$35,$eb,$5e,$cb,$6a,$5c   ; [$ae47] byte
    .byte $fb,$2c,$35,$e7,$5e,$cf,$ab,$2d   ; [$ae4f] byte
    .byte $cb,$35,$ea,$5c,$b3,$5e,$cb,$6b   ; [$ae57] byte
    .byte $2d,$cb,$35,$ea,$cf,$2a,$57,$2d   ; [$ae5f] byte
    .byte $cb,$35,$ea,$aa,$35,$e8,$5c,$3f   ; [$ae67] byte
    .byte $5e,$ac,$b6,$93,$3c,$54,$77,$ad   ; [$ae6f] byte
    .byte $ab,$2c,$75,$eb,$3c,$8c,$f2,$ac   ; [$ae77] byte
    .byte $f1,$77,$90,$00,$00,$00           ; [$ae7f] byte

MIST_BLOCKS_SCREEN_66:                      ; [$ae85]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$ae85] byte
    .byte $00,$00,$cb,$72,$cd,$7b,$5f,$cf   ; [$ae8d] byte
    .byte $b3,$4c,$fb,$34,$cf,$b2,$cd,$7b   ; [$ae95] byte
    .byte $5f,$cf,$b3,$4c,$fb,$34,$5c,$b7   ; [$ae9d] byte
    .byte $2c,$da,$6d,$7b,$5f,$76,$9c,$fb   ; [$aea5] byte
    .byte $2c,$da,$61,$d9,$cd,$67,$5f,$cf   ; [$aead] byte
    .byte $b3,$4c,$b0,$73,$4d,$7b,$5f,$cf   ; [$aeb5] byte
    .byte $b3,$45,$cb,$36,$9c,$fb,$56,$d9   ; [$aebd] byte
    .byte $cd,$67,$5f,$5c,$fb,$34,$35,$e5   ; [$aec5] byte
    .byte $76,$8d,$7b,$5f,$cb,$03,$56,$d9   ; [$aecd] byte
    .byte $cd,$67,$5e,$cb,$65,$5c,$b7,$2c   ; [$aed5] byte
    .byte $35,$e7,$5e,$cf,$b2,$cd,$7b,$56   ; [$aedd] byte
    .byte $d9,$c3,$59,$57,$5e,$cb,$6b,$2d   ; [$aee5] byte
    .byte $cb,$35,$ea,$da,$72,$cd,$7b,$2c   ; [$aeed] byte
    .byte $d7,$a4,$cb,$35,$ea,$aa,$35,$e8   ; [$aef5] byte
    .byte $53,$5e,$ac,$b6,$93,$69,$54,$36   ; [$aefd] byte
    .byte $9c,$b6,$75,$eb,$69,$8d,$a6,$ad   ; [$af05] byte
    .byte $a5,$de,$40,$00,$00,$00           ; [$af0d] byte

MIST_BLOCKS_SCREEN_67:                      ; [$af13]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$af13] byte
    .byte $00,$00,$cb,$76,$30,$33,$4c,$fb   ; [$af1b] byte
    .byte $34,$cf,$b2,$cd,$7b,$5f,$cf,$b3   ; [$af23] byte
    .byte $4c,$fb,$34,$50,$1d,$7b,$5f,$76   ; [$af2b] byte
    .byte $9c,$fb,$2c,$da,$61,$53,$34,$cb   ; [$af33] byte
    .byte $00,$73,$4d,$7b,$5f,$cf,$b5,$90   ; [$af3b] byte
    .byte $76,$9c,$f9,$43,$5f,$75,$90,$35   ; [$af43] byte
    .byte $ec,$fb,$5e,$76,$8d,$7b,$5f,$75   ; [$af4b] byte
    .byte $90,$36,$ac,$b3,$5e,$cb,$73,$4b   ; [$af53] byte
    .byte $34,$d9,$c0,$35,$ec,$b3,$5e,$cf   ; [$af5b] byte
    .byte $b2,$cd,$7b,$3e,$cd,$33,$ea,$cb   ; [$af63] byte
    .byte $36,$8c,$d3,$5e,$cb,$73,$4b,$2d   ; [$af6b] byte
    .byte $cb,$35,$ea,$da,$72,$cd,$7b,$2c   ; [$af73] byte
    .byte $ac,$b4,$cd,$35,$ec,$b2,$ab,$3e   ; [$af7b] byte
    .byte $cd,$35,$ec,$fb,$34,$50,$cf,$a7   ; [$af83] byte
    .byte $3e,$cd,$33,$ec,$d3,$2c,$00,$36   ; [$af8b] byte
    .byte $9c,$b7,$34,$75,$1b,$51,$b5,$17   ; [$af93] byte
    .byte $51,$cf,$b5,$1c,$d1,$de,$40,$00   ; [$af9b] byte
    .byte $00,$00                           ; [$afa3] byte

MIST_BLOCKS_SCREEN_68:                      ; [$afa5]
    .byte $c8,$40,$00,$00,$00,$d6,$f7,$dd   ; [$afa5] byte
    .byte $6f,$7d,$d6,$f7,$dd,$6c,$00,$03   ; [$afad] byte
    .byte $3a,$cb,$32,$dd,$8f,$68,$d8,$f6   ; [$afb5] byte
    .byte $8c,$fb,$34,$cf,$b2,$cd,$7b,$5f   ; [$afbd] byte
    .byte $cf,$b3,$4c,$fb,$2a,$5c,$d3,$3e   ; [$afc5] byte
    .byte $73,$4d,$7b,$5f,$76,$9c,$fb,$2c   ; [$afcd] byte
    .byte $da,$63,$3a,$d6,$43,$2d,$cd,$33   ; [$afd5] byte
    .byte $eb,$3e,$cd,$0d,$7b,$5f,$cf,$b2   ; [$afdd] byte
    .byte $c3,$2a,$cb,$76,$9c,$f3,$56,$d9   ; [$afe5] byte
    .byte $cd,$67,$5f,$b6,$30,$cb,$35,$ec   ; [$afed] byte
    .byte $fb,$3a,$76,$8c,$b3,$5f,$cb,$72   ; [$aff5] byte
    .byte $c3,$56,$d9,$cd,$67,$5e,$cb,$73   ; [$affd] byte
    .byte $4d,$ef,$2a,$cb,$00,$35,$e7,$5e   ; [$b005] byte
    .byte $cf,$b2,$cd,$7b,$56,$d6,$47,$3a   ; [$b00d] byte
    .byte $76,$8c,$d3,$5e,$cb,$73,$4b,$2d   ; [$b015] byte
    .byte $cb,$35,$ea,$cb,$07,$2a,$4c,$b4   ; [$b01d] byte
    .byte $cd,$35,$ec,$b2,$ab,$3e,$cd,$35   ; [$b025] byte
    .byte $ed,$a7,$3a,$40,$00,$00,$03,$2a   ; [$b02d] byte
    .byte $75,$1c,$b7,$51,$cf,$b5,$1c,$d3   ; [$b035] byte
    .byte $51,$cf,$b5,$1c,$d3,$51,$cf,$b5   ; [$b03d] byte
    .byte $1c,$d3,$3a,$de,$40,$00,$00,$00   ; [$b045] byte

MIST_BLOCKS_SCREEN_69:                      ; [$b04d]
    .byte $c8,$40,$00,$00,$00,$ce,$f7,$d0   ; [$b04d] byte
    .byte $00,$00,$00,$76,$8d,$d3,$75,$cb   ; [$b055] byte
    .byte $35,$7d,$d3,$75,$cb,$35,$4d,$d3   ; [$b05d] byte
    .byte $75,$cb,$35,$4d,$d3,$75,$5d,$d6   ; [$b065] byte
    .byte $b7,$4d,$d6,$b7,$4d,$d6,$b7,$4d   ; [$b06d] byte
    .byte $d6,$5d,$c0,$00,$00,$00,$5d,$5b   ; [$b075] byte
    .byte $67,$35,$9d,$ab,$5c,$d5,$b5,$9d   ; [$b07d] byte
    .byte $ab,$5c,$d5,$b6,$70,$5d,$70,$03   ; [$b085] byte
    .byte $5d,$83,$5d,$80,$5d,$77,$70,$d7   ; [$b08d] byte
    .byte $77,$0d,$77,$70,$df,$b7,$0d,$77   ; [$b095] byte
    .byte $70,$b7,$0d,$77,$70,$5d,$c3,$2c   ; [$b09d] byte
    .byte $b2,$cb,$2c,$b2,$cb,$2c,$b2,$cb   ; [$b0a5] byte
    .byte $2c,$5d,$39,$d3,$9d,$39,$d3,$9d   ; [$b0ad] byte
    .byte $39,$d3,$9d,$39,$da,$f6,$fd,$45   ; [$b0b5] byte
    .byte $d4,$5d,$45,$d4,$5d,$45,$d4,$5d   ; [$b0bd] byte
    .byte $45,$db,$32,$2d,$4f,$22,$d4,$f2   ; [$b0c5] byte
    .byte $2d,$4f,$22,$d4,$f2,$2d,$4f,$22   ; [$b0cd] byte
    .byte $d4,$f2,$2d,$4d,$de,$40,$00,$00   ; [$b0d5] byte
    .byte $00                               ; [$b0dd] byte

MIST_BLOCKS_SCREEN_70:                      ; [$b0de]
    .byte $c8,$40,$00,$00,$00,$df,$40,$00   ; [$b0de] byte
    .byte $00,$00,$cb,$35,$5d,$d3,$75,$cb   ; [$b0e6] byte
    .byte $35,$7d,$d3,$75,$cb,$35,$4d,$d3   ; [$b0ee] byte
    .byte $75,$cb,$35,$4d,$d3,$75,$37,$4d   ; [$b0f6] byte
    .byte $d6,$b7,$4d,$d6,$b7,$4d,$d6,$b7   ; [$b0fe] byte
    .byte $4d,$d6,$dc,$00,$00,$00,$00,$d9   ; [$b106] byte
    .byte $c0,$35,$9d,$ab,$5c,$d5,$b6,$7d   ; [$b10e] byte
    .byte $67,$6a,$d7,$35,$6d,$9c,$d7,$03   ; [$b116] byte
    .byte $5d,$d7,$03,$5d,$80,$d7,$60,$d7   ; [$b11e] byte
    .byte $77,$0d,$77,$70,$b7,$0d,$77,$70   ; [$b126] byte
    .byte $df,$b7,$0d,$77,$70,$77,$0d,$77   ; [$b12e] byte
    .byte $70,$32,$cb,$2c,$b2,$cb,$2c,$b2   ; [$b136] byte
    .byte $cb,$2c,$b2,$cb,$2c,$d3,$9d,$39   ; [$b13e] byte
    .byte $d3,$9d,$39,$d3,$9d,$39,$d3,$9d   ; [$b146] byte
    .byte $39,$d4,$5d,$45,$d4,$5d,$45,$d4   ; [$b14e] byte
    .byte $5d,$45,$d4,$5d,$45,$d4,$f2,$2d   ; [$b156] byte
    .byte $4f,$22,$d4,$f2,$2d,$4f,$22,$d4   ; [$b15e] byte
    .byte $f2,$2d,$4f,$22,$d4,$f2,$2d,$4d   ; [$b166] byte
    .byte $de,$40,$00,$00,$00               ; [$b16e] byte

MIST_BLOCKS_SCREEN_71:                      ; [$b173]
    .byte $c8,$40,$00,$00,$00,$df,$40,$00   ; [$b173] byte
    .byte $00,$00,$cb,$35,$5d,$d3,$75,$cb   ; [$b17b] byte
    .byte $35,$7d,$d3,$75,$cb,$35,$4d,$d3   ; [$b183] byte
    .byte $75,$cb,$35,$4d,$d3,$75,$37,$4d   ; [$b18b] byte
    .byte $d6,$b7,$4d,$d6,$b7,$4d,$d6,$b7   ; [$b193] byte
    .byte $4d,$d6,$dc,$00,$00,$00,$0d,$ef   ; [$b19b] byte
    .byte $6a,$d9,$c0,$00,$35,$9d,$ab,$5c   ; [$b1a3] byte
    .byte $d5,$b6,$77,$2a,$d7,$00,$00,$03   ; [$b1ab] byte
    .byte $5d,$87,$3a,$d7,$77,$0d,$77,$70   ; [$b1b3] byte
    .byte $d7,$77,$0d,$77,$70,$df,$b7,$0d   ; [$b1bb] byte
    .byte $77,$70,$b7,$07,$2a,$dc,$32,$cb   ; [$b1c3] byte
    .byte $2c,$b2,$cb,$2c,$b2,$cb,$2c,$b2   ; [$b1cb] byte
    .byte $c7,$3a,$d3,$9d,$39,$d3,$9d,$39   ; [$b1d3] byte
    .byte $d3,$9d,$39,$d3,$9d,$bb,$2a,$d4   ; [$b1db] byte
    .byte $5d,$45,$d4,$5d,$45,$d4,$5d,$45   ; [$b1e3] byte
    .byte $d4,$5d,$47,$3a,$d4,$f2,$2d,$4f   ; [$b1eb] byte
    .byte $22,$d4,$f2,$2d,$4f,$22,$d4,$f2   ; [$b1f3] byte
    .byte $2d,$4f,$22,$d4,$f2,$2d,$4f,$2a   ; [$b1fb] byte
    .byte $de,$40,$00,$00,$03,$3a           ; [$b203] byte

MIST_BLOCKS_SCREEN_72:                      ; [$b209]
    .byte $c8,$77,$bd,$eb,$68,$d7,$b5,$fc   ; [$b209] byte
    .byte $d3,$5d,$00,$00,$df,$55,$cb,$73   ; [$b211] byte
    .byte $4c,$b1,$dc,$1d,$c1,$dc,$1d,$c1   ; [$b219] byte
    .byte $cb,$15,$d7,$b5,$fb,$70,$d7,$2d   ; [$b221] byte
    .byte $72,$d7,$2d,$72,$dd,$55,$cb,$73   ; [$b229] byte
    .byte $4c,$b3,$5d,$00,$00,$95,$d7,$b5   ; [$b231] byte
    .byte $fb,$5c,$dc,$35,$cd,$c3,$5c,$dc   ; [$b239] byte
    .byte $35,$cd,$c3,$5c,$ca,$d5,$cb,$73   ; [$b241] byte
    .byte $4c,$b3,$5d,$b5,$db,$5d,$b5,$db   ; [$b249] byte
    .byte $5d,$ce,$d5,$d7,$b5,$fb,$70,$b7   ; [$b251] byte
    .byte $0b,$70,$b7,$0b,$70,$ca,$d7,$7b   ; [$b259] byte
    .byte $da,$b7,$bd,$ab,$74,$77,$5b,$74   ; [$b261] byte
    .byte $77,$5b,$74,$ce,$d5,$de,$9d,$a3   ; [$b269] byte
    .byte $76,$dc,$37,$7d,$73,$76,$dc,$37   ; [$b271] byte
    .byte $7d,$73,$76,$ca,$f7,$dd,$6c,$76   ; [$b279] byte
    .byte $9d,$bf,$54,$c3,$f5,$4d,$77,$54   ; [$b281] byte
    .byte $c3,$f5,$5d,$77,$0f,$ce,$f6,$8d   ; [$b289] byte
    .byte $57,$54,$76,$8c,$3f,$55,$ad,$fb   ; [$b291] byte
    .byte $55,$2d,$f9,$ca,$dc,$3d,$5d,$50   ; [$b299] byte
    .byte $c3,$f5,$5d,$77,$0f,$d5,$ed,$77   ; [$b2a1] byte
    .byte $55,$ce,$f7,$90,$00,$00,$00       ; [$b2a9] byte

MIST_BLOCKS_SCREEN_73:                      ; [$b2b0]
    .byte $d7,$40,$00,$00,$0c,$b3,$3a,$dc   ; [$b2b0] byte
    .byte $1d,$c1,$dc,$1d,$c1,$dc,$1d,$c1   ; [$b2b8] byte
    .byte $dc,$15,$d7,$2d,$72,$d7,$2d,$72   ; [$b2c0] byte
    .byte $d7,$2d,$72,$d7,$25,$d7,$40,$03   ; [$b2c8] byte
    .byte $7e,$d7,$40,$05,$dc,$35,$cd,$c3   ; [$b2d0] byte
    .byte $5c,$dc,$35,$cd,$c3,$5c,$dc,$35   ; [$b2d8] byte
    .byte $cd,$c3,$5c,$dc,$35,$c5,$d7,$35   ; [$b2e0] byte
    .byte $db,$5d,$b5,$db,$5d,$b5,$db,$5d   ; [$b2e8] byte
    .byte $b5,$d7,$6e,$d7,$77,$0b,$70,$b7   ; [$b2f0] byte
    .byte $0b,$70,$b7,$0b,$70,$d5,$f7,$04   ; [$b2f8] byte
    .byte $77,$5b,$74,$b7,$5b,$74,$b7,$5b   ; [$b300] byte
    .byte $74,$b7,$5d,$ef,$6a,$dc,$37,$7d   ; [$b308] byte
    .byte $73,$76,$77,$7d,$73,$76,$77,$7d   ; [$b310] byte
    .byte $73,$76,$77,$77,$3a,$d5,$35,$5d   ; [$b318] byte
    .byte $77,$0f,$d5,$70,$fd,$77,$0f,$35   ; [$b320] byte
    .byte $4d,$77,$54,$c3,$f5,$5d,$b9,$c3   ; [$b328] byte
    .byte $d5,$07,$55,$d5,$2d,$fb,$55,$2d   ; [$b330] byte
    .byte $f9,$d5,$67,$54,$47,$0f,$35,$5d   ; [$b338] byte
    .byte $77,$0f,$d5,$ed,$75,$de,$40,$00   ; [$b340] byte
    .byte $00,$01                           ; [$b348] byte

MIST_BLOCKS_SCREEN_74:                      ; [$b34a]
    .byte $ce,$f2,$10,$00,$00,$00,$77,$dd   ; [$b34a] byte
    .byte $6c,$00,$00,$00,$76,$8d,$d3,$75   ; [$b352] byte
    .byte $cb,$35,$4d,$d3,$75,$cb,$35,$7d   ; [$b35a] byte
    .byte $d3,$75,$d5,$32,$cd,$d3,$75,$5d   ; [$b362] byte
    .byte $d6,$b7,$4d,$d6,$b7,$4d,$d6,$b7   ; [$b36a] byte
    .byte $4d,$d6,$77,$bd,$df,$70,$00,$00   ; [$b372] byte
    .byte $00,$d6,$dd,$9f,$6a,$d5,$75,$6d   ; [$b37a] byte
    .byte $9c,$00,$00,$d7,$76,$ed,$bf,$70   ; [$b382] byte
    .byte $d7,$00,$00,$00,$75,$4d,$ef,$6a   ; [$b38a] byte
    .byte $d7,$43,$70,$d7,$77,$0d,$77,$70   ; [$b392] byte
    .byte $d7,$77,$0d,$77,$70,$ce,$f5,$97   ; [$b39a] byte
    .byte $68,$dc,$1d,$c3,$2c,$b2,$cb,$2c   ; [$b3a2] byte
    .byte $b2,$cb,$2c,$76,$8d,$bb,$6f,$d3   ; [$b3aa] byte
    .byte $ad,$3b,$57,$d3,$b5,$4d,$3b,$54   ; [$b3b2] byte
    .byte $d3,$b5,$5d,$3b,$54,$5d,$73,$0f   ; [$b3ba] byte
    .byte $d4,$6d,$72,$d4,$6d,$72,$d4,$6d   ; [$b3c2] byte
    .byte $72,$5d,$77,$54,$d4,$ed,$77,$51   ; [$b3ca] byte
    .byte $d4,$ed,$77,$51,$d4,$ed,$77,$51   ; [$b3d2] byte
    .byte $de,$40,$00,$00,$00               ; [$b3da] byte

MIST_BLOCKS_SCREEN_75:                      ; [$b3df]
    .byte $c8,$40,$00,$00,$00,$d6,$f7,$dd   ; [$b3df] byte
    .byte $6c,$00,$00,$00,$cb,$0d,$d3,$75   ; [$b3e7] byte
    .byte $cb,$35,$4d,$d3,$75,$cb,$35,$7d   ; [$b3ef] byte
    .byte $d3,$75,$d5,$32,$cd,$d3,$75,$37   ; [$b3f7] byte
    .byte $4d,$d6,$b7,$4d,$d6,$b7,$4d,$d6   ; [$b3ff] byte
    .byte $b7,$4d,$d6,$dd,$f7,$00,$00,$00   ; [$b407] byte
    .byte $00,$d9,$c0,$35,$9d,$ab,$0f,$d5   ; [$b40f] byte
    .byte $b6,$70,$00,$d7,$00,$00,$00,$00   ; [$b417] byte
    .byte $dc,$35,$d3,$70,$d7,$43,$70,$d7   ; [$b41f] byte
    .byte $77,$0d,$77,$70,$d7,$77,$0d,$77   ; [$b427] byte
    .byte $70,$cb,$1d,$c3,$2c,$9d,$c3,$2c   ; [$b42f] byte
    .byte $b2,$cb,$2c,$b2,$cb,$2c,$d3,$b7   ; [$b437] byte
    .byte $0d,$3b,$0f,$d3,$ad,$3b,$57,$d3   ; [$b43f] byte
    .byte $b5,$4d,$3b,$54,$d3,$b5,$5d,$3b   ; [$b447] byte
    .byte $54,$d4,$6d,$72,$d4,$6d,$72,$d4   ; [$b44f] byte
    .byte $6d,$72,$d4,$6d,$72,$d4,$ed,$77   ; [$b457] byte
    .byte $51,$d4,$ed,$77,$51,$d4,$ed,$77   ; [$b45f] byte
    .byte $51,$d4,$ed,$77,$51,$de,$40,$00   ; [$b467] byte
    .byte $00,$00                           ; [$b46f] byte

MIST_BLOCKS_SCREEN_76:                      ; [$b471]
    .byte $c8,$40,$00,$00,$00,$d6,$f7,$dd   ; [$b471] byte
    .byte $6c,$00,$00,$03,$2a,$cb,$0d,$d3   ; [$b479] byte
    .byte $75,$cb,$35,$4d,$d3,$75,$cb,$35   ; [$b481] byte
    .byte $7d,$d3,$75,$d5,$32,$cd,$ef,$3a   ; [$b489] byte
    .byte $dd,$77,$4d,$d6,$d5,$b6,$70,$00   ; [$b491] byte
    .byte $07,$2a,$dd,$f7,$03,$56,$da,$b7   ; [$b499] byte
    .byte $00,$00,$07,$3a,$d9,$cd,$67,$6a   ; [$b4a1] byte
    .byte $c3,$f5,$43,$57,$c3,$cd,$57,$0f   ; [$b4a9] byte
    .byte $d5,$35,$77,$2a,$d7,$00,$00,$00   ; [$b4b1] byte
    .byte $07,$3a,$dc,$35,$dd,$c0,$35,$d3   ; [$b4b9] byte
    .byte $70,$d7,$43,$70,$d7,$77,$07,$2a   ; [$b4c1] byte
    .byte $cb,$1c,$eb,$3b,$d9,$1d,$c3,$2c   ; [$b4c9] byte
    .byte $9d,$c3,$2c,$b2,$c7,$3a,$d3,$b7   ; [$b4d1] byte
    .byte $0c,$ab,$2b,$da,$37,$0d,$3b,$57   ; [$b4d9] byte
    .byte $d3,$ad,$3b,$55,$d3,$b5,$5d,$bb   ; [$b4e1] byte
    .byte $2a,$d4,$6c,$eb,$3b,$74,$ed,$72   ; [$b4e9] byte
    .byte $d4,$6d,$72,$d4,$6d,$73,$3a,$d4   ; [$b4f1] byte
    .byte $ec,$ab,$2b,$de,$b6,$4d,$77,$51   ; [$b4f9] byte
    .byte $d4,$ed,$77,$51,$d4,$ed,$77,$2a   ; [$b501] byte
    .byte $de,$40,$00,$00,$00               ; [$b509] byte

MIST_BLOCKS_SCREEN_77:                      ; [$b50e]
    .byte $c8,$40,$00,$00,$00,$ce,$f7,$dd   ; [$b50e] byte
    .byte $6c,$00,$00,$00,$76,$8d,$57,$74   ; [$b516] byte
    .byte $d7,$37,$5d,$d3,$5c,$dd,$77,$4d   ; [$b51e] byte
    .byte $73,$75,$d5,$f0,$f0,$5c,$b3,$76   ; [$b526] byte
    .byte $dc,$37,$7d,$db,$70,$dd,$f7,$6d   ; [$b52e] byte
    .byte $c3,$77,$cb,$0d,$51,$75,$93,$5c   ; [$b536] byte
    .byte $00,$00,$c3,$dd,$5b,$59,$76,$8c   ; [$b53e] byte
    .byte $3f,$5d,$d5,$b5,$d3,$56,$d7,$4d   ; [$b546] byte
    .byte $5b,$7e,$75,$6d,$ab,$0f,$5d,$f9   ; [$b54e] byte
    .byte $d7,$13,$5c,$4d,$73,$5d,$40,$5c   ; [$b556] byte
    .byte $b1,$dc,$13,$70,$4d,$c1,$cb,$37   ; [$b55e] byte
    .byte $bd,$a9,$5d,$51,$d7,$13,$5c,$4d   ; [$b566] byte
    .byte $71,$c3,$dd,$9e,$5c,$3f,$76,$b7   ; [$b56e] byte
    .byte $7d,$da,$dd,$f7,$6b,$77,$d5,$76   ; [$b576] byte
    .byte $ed,$59,$57,$54,$70,$fd,$51,$d5   ; [$b57e] byte
    .byte $70,$f7,$55,$d5,$35,$75,$5c,$b0   ; [$b586] byte
    .byte $72,$c1,$cb,$07,$2c,$05,$de,$40   ; [$b58e] byte
    .byte $00,$00,$00                       ; [$b596] byte

MIST_BLOCKS_SCREEN_78:                      ; [$b599]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$b599] byte
    .byte $00,$00,$c3,$cd,$57,$0f,$d5,$35   ; [$b5a1] byte
    .byte $5c,$3f,$55,$d5,$f0,$f3,$54,$c3   ; [$b5a9] byte
    .byte $f5,$5c,$3f,$57,$cb,$0d,$ef,$6a   ; [$b5b1] byte
    .byte $cb,$07,$2c,$1c,$b3,$55,$cb,$0d   ; [$b5b9] byte
    .byte $52,$d6,$47,$68,$c3,$d5,$d5,$57   ; [$b5c1] byte
    .byte $54,$9c,$3c,$d9,$f6,$8d,$bb,$6f   ; [$b5c9] byte
    .byte $d5,$47,$55,$35,$7d,$53,$0f,$d5   ; [$b5d1] byte
    .byte $b6,$a7,$56,$5c,$3c,$75,$4a,$21   ; [$b5d9] byte
    .byte $54,$77,$bd,$ab,$5c,$b5,$c1,$d7   ; [$b5e1] byte
    .byte $37,$bd,$ab,$5c,$77,$b9,$5d,$9f   ; [$b5e9] byte
    .byte $64,$b7,$02,$dc,$1d,$9e,$5d,$9c   ; [$b5f1] byte
    .byte $36,$9d,$bf,$74,$37,$5d,$d3,$75   ; [$b5f9] byte
    .byte $36,$ed,$59,$75,$bd,$3b,$0f,$03   ; [$b601] byte
    .byte $76,$55,$dd,$f7,$65,$d5,$34,$ed   ; [$b609] byte
    .byte $45,$0c,$b0,$dc,$00,$cb,$05,$cb   ; [$b611] byte
    .byte $0d,$4d,$de,$40,$00,$00,$00       ; [$b619] byte

MIST_BLOCKS_SCREEN_79:                      ; [$b620]
    .byte $c8,$40,$00,$00,$03,$3a,$d6,$c0   ; [$b620] byte
    .byte $00,$00,$03,$2a,$dd,$37,$5d,$73   ; [$b628] byte
    .byte $74,$dd,$75,$cd,$d3,$75,$d7,$37   ; [$b630] byte
    .byte $4d,$d7,$5c,$dd,$37,$5d,$73,$3a   ; [$b638] byte
    .byte $dd,$b7,$7d,$c3,$76,$dd,$f7,$0d   ; [$b640] byte
    .byte $db,$77,$dc,$37,$6d,$df,$70,$dd   ; [$b648] byte
    .byte $b7,$7d,$c3,$2a,$d7,$0d,$53,$5c   ; [$b650] byte
    .byte $35,$7d,$70,$d5,$75,$c3,$54,$d7   ; [$b658] byte
    .byte $0d,$ef,$3a,$d9,$c0,$00,$00,$35   ; [$b660] byte
    .byte $97,$2a,$c3,$f5,$5c,$3f,$55,$35   ; [$b668] byte
    .byte $4d,$57,$0f,$35,$53,$0f,$0d,$bb   ; [$b670] byte
    .byte $3a,$75,$4d,$5f,$54,$70,$fb,$57   ; [$b678] byte
    .byte $40,$03,$2a,$d9,$c0,$00,$00,$03   ; [$b680] byte
    .byte $3a,$cf,$34,$ec,$f0,$d3,$b3,$c3   ; [$b688] byte
    .byte $4e,$cf,$0d,$3b,$3c,$34,$ec,$f3   ; [$b690] byte
    .byte $2a,$d3,$b5,$1c,$3f,$4e,$d4,$70   ; [$b698] byte
    .byte $fd,$3b,$51,$c3,$f4,$ed,$47,$0f   ; [$b6a0] byte
    .byte $d3,$b5,$1c,$3f,$6b,$c3,$f5,$34   ; [$b6a8] byte
    .byte $d4,$d3,$53,$4d,$4d,$35,$37,$6c   ; [$b6b0] byte
    .byte $de,$40,$00,$00,$00               ; [$b6b8] byte

MIST_BLOCKS_SCREEN_80:                      ; [$b6bd]
    .byte $c8,$40,$00,$00,$00,$ce,$f7,$dd   ; [$b6bd] byte
    .byte $6c,$00,$00,$00,$ca,$f6,$8d,$53   ; [$b6c5] byte
    .byte $55,$30,$fd,$57,$0f,$00,$d5,$70   ; [$b6cd] byte
    .byte $f0,$ce,$dc,$b0,$d5,$f2,$c3,$54   ; [$b6d5] byte
    .byte $cb,$07,$2c,$72,$c7,$2c,$ca,$f6   ; [$b6dd] byte
    .byte $70,$d6,$76,$ad,$57,$57,$75,$45   ; [$b6e5] byte
    .byte $d5,$15,$ce,$f6,$8d,$5f,$54,$35   ; [$b6ed] byte
    .byte $53,$67,$00,$35,$9d,$9c,$ca,$dc   ; [$b6f5] byte
    .byte $3c,$d5,$70,$fd,$53,$0f,$35,$7c   ; [$b6fd] byte
    .byte $3c,$d5,$35,$5c,$3f,$55,$ce,$dd   ; [$b705] byte
    .byte $70,$de,$f6,$ad,$ef,$6a,$d7,$00   ; [$b70d] byte
    .byte $de,$f6,$ad,$ef,$6a,$ca,$dd,$74   ; [$b715] byte
    .byte $76,$77,$68,$d7,$40,$75,$97,$68   ; [$b71d] byte
    .byte $ce,$dd,$c0,$db,$b4,$ed,$bb,$6f   ; [$b725] byte
    .byte $dc,$00,$db,$b4,$ed,$bb,$6f,$ca   ; [$b72d] byte
    .byte $dd,$af,$0f,$d4,$76,$7d,$47,$57   ; [$b735] byte
    .byte $d7,$35,$1d,$70,$d4,$75,$9d,$47   ; [$b73d] byte
    .byte $5c,$ce,$dd,$b1,$d4,$f4,$ed,$4f   ; [$b745] byte
    .byte $55,$d7,$75,$3d,$74,$d4,$f4,$ed   ; [$b74d] byte
    .byte $4f,$5d,$de,$40,$00,$00,$00       ; [$b755] byte

MIST_BLOCKS_SCREEN_81:                      ; [$b75c]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$b75c] byte
    .byte $00,$00,$c3,$cd,$53,$55,$30,$fd   ; [$b764] byte
    .byte $57,$0f,$00,$d5,$70,$f0,$cb,$1c   ; [$b76c] byte
    .byte $b0,$d5,$f2,$c3,$54,$cb,$07,$2c   ; [$b774] byte
    .byte $72,$c7,$2c,$14,$c3,$c7,$57,$75   ; [$b77c] byte
    .byte $45,$d5,$15,$d9,$f5,$9d,$ab,$55   ; [$b784] byte
    .byte $d5,$b6,$70,$00,$35,$9d,$9c,$c3   ; [$b78c] byte
    .byte $f5,$cc,$3f,$5c,$b0,$fd,$53,$0f   ; [$b794] byte
    .byte $d7,$35,$7d,$70,$d5,$35,$cc,$3f   ; [$b79c] byte
    .byte $5c,$75,$db,$5d,$de,$f6,$ad,$ef   ; [$b7a4] byte
    .byte $6a,$d7,$6d,$74,$de,$f6,$ad,$ef   ; [$b7ac] byte
    .byte $6a,$50,$76,$77,$68,$40,$75,$97   ; [$b7b4] byte
    .byte $68,$d4,$77,$00,$db,$b4,$ed,$bb   ; [$b7bc] byte
    .byte $6f,$dc,$00,$db,$b4,$ed,$bb,$6f   ; [$b7c4] byte
    .byte $d4,$f0,$fd,$47,$0f,$d4,$76,$7d   ; [$b7cc] byte
    .byte $47,$57,$d4,$75,$cd,$47,$5c,$d4   ; [$b7d4] byte
    .byte $75,$9d,$47,$5c,$5d,$4f,$57,$d4   ; [$b7dc] byte
    .byte $f4,$ed,$4f,$55,$d4,$f5,$dd,$4f   ; [$b7e4] byte
    .byte $5d,$d4,$f4,$ed,$4f,$5d,$de,$40   ; [$b7ec] byte
    .byte $00,$00,$00                       ; [$b7f4] byte

MIST_BLOCKS_SCREEN_82:                      ; [$b7f7]
    .byte $c8,$40,$00,$00,$00,$d6,$c0,$00   ; [$b7f7] byte
    .byte $00,$03,$3a,$c3,$cd,$53,$55,$30   ; [$b7ff] byte
    .byte $fd,$57,$0f,$d5,$70,$fd,$57,$0f   ; [$b807] byte
    .byte $d5,$4d,$5f,$2a,$cb,$1c,$b0,$d5   ; [$b80f] byte
    .byte $f2,$c3,$54,$cb,$0d,$53,$2c,$77   ; [$b817] byte
    .byte $bd,$ab,$3a,$54,$c3,$c7,$57,$75   ; [$b81f] byte
    .byte $4d,$5f,$56,$d9,$dd,$67,$2a,$d9   ; [$b827] byte
    .byte $c0,$00,$d6,$76,$ad,$56,$c3,$f6   ; [$b82f] byte
    .byte $ed,$bf,$3a,$c3,$f5,$cd,$53,$5c   ; [$b837] byte
    .byte $d5,$70,$fd,$53,$0f,$d7,$00,$23   ; [$b83f] byte
    .byte $2a,$d5,$f5,$db,$5d,$de,$f6,$ad   ; [$b847] byte
    .byte $ef,$6a,$d7,$40,$1d,$ef,$3a,$d5   ; [$b84f] byte
    .byte $1d,$c1,$76,$77,$68,$dc,$1d,$c1   ; [$b857] byte
    .byte $dc,$35,$97,$2a,$d4,$77,$0d,$46   ; [$b85f] byte
    .byte $db,$b4,$ed,$bb,$6f,$d4,$6d,$46   ; [$b867] byte
    .byte $d4,$74,$ed,$bb,$3a,$d4,$f5,$5d   ; [$b86f] byte
    .byte $4f,$0f,$d4,$76,$7d,$47,$57,$d4   ; [$b877] byte
    .byte $f5,$cd,$4f,$5c,$d4,$f5,$5d,$47   ; [$b87f] byte
    .byte $2a,$70,$f7,$57,$d4,$f4,$ed,$4f   ; [$b887] byte
    .byte $55,$75,$d7,$5d,$74,$ed,$4f,$3a   ; [$b88f] byte
    .byte $de,$40,$00,$00,$00               ; [$b897] byte

TOWNS_BLOCKS:                               ; [$b89c]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_00   ; TOWNS_BLOCKS_SCREEN_00
                                            ; [$b89c]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_01   ; TOWNS_BLOCKS_SCREEN_01
                                            ; [$b89e]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_02   ; TOWNS_BLOCKS_SCREEN_02
                                            ; [$b8a0]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_03   ; TOWNS_BLOCKS_SCREEN_03
                                            ; [$b8a2]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_04   ; TOWNS_BLOCKS_SCREEN_04
                                            ; [$b8a4]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_05   ; TOWNS_BLOCKS_SCREEN_05
                                            ; [$b8a6]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_06   ; TOWNS_BLOCKS_SCREEN_06
                                            ; [$b8a8]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_07   ; TOWNS_BLOCKS_SCREEN_07
                                            ; [$b8aa]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_08   ; TOWNS_BLOCKS_SCREEN_08
                                            ; [$b8ac]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_09   ; TOWNS_BLOCKS_SCREEN_09
                                            ; [$b8ae]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_10   ; TOWNS_BLOCKS_SCREEN_10
                                            ; [$b8b0]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_11   ; TOWNS_BLOCKS_SCREEN_11
                                            ; [$b8b2]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_12   ; TOWNS_BLOCKS_SCREEN_12
                                            ; [$b8b4]
    bank_offset_16 TOWNS_BLOCKS_SCREEN_13   ; TOWNS_BLOCKS_SCREEN_13
                                            ; [$b8b6]

;
; XREFS:
;     TOWNS_BLOCKS [$b89c]
;
TOWNS_BLOCKS_SCREEN_00:                     ; [$b8b8]
    .byte $d3,$70,$90,$00,$34,$dc,$24,$00   ; [$b8b8] byte
    .byte $44,$00,$08,$40,$14,$03,$4d,$47   ; [$b8c0] byte
    .byte $09,$00,$00,$00,$ca,$b4,$d0,$00   ; [$b8c8] byte
    .byte $40,$03,$20,$c9,$32,$17,$6f,$d1   ; [$b8d0] byte
    .byte $74,$4d,$07,$6f,$4c,$ab,$45,$d0   ; [$b8d8] byte
    .byte $34,$1c,$ab,$1f,$d5,$72,$25,$c7   ; [$b8e0] byte
    .byte $f2,$4c,$89,$4d,$af,$3f,$d1,$34   ; [$b8e8] byte
    .byte $2d,$af,$5d,$d7,$f5,$e7,$14,$d3   ; [$b8f0] byte
    .byte $b5,$5c,$db,$19,$4d,$93,$6a,$0d   ; [$b8f8] byte
    .byte $93,$59,$d5,$b5,$85,$c4,$c0,$4d   ; [$b900] byte
    .byte $af,$68,$d6,$b6,$9d,$af,$5d,$d7   ; [$b908] byte
    .byte $f5,$ed,$bf,$4f,$d4,$35,$cd,$40   ; [$b910] byte
    .byte $d3,$1d,$93,$67,$ce,$b6,$7d,$93   ; [$b918] byte
    .byte $59,$d5,$35,$87,$4e,$d8,$73,$ad   ; [$b920] byte
    .byte $83,$28,$57,$52,$ce,$f5,$27,$39   ; [$b928] byte
    .byte $d4,$f5,$75,$ca,$33,$bc,$a0,$c0   ; [$b930] byte
    .byte $80,$00,$00,$00,$c0,$40,$00,$00   ; [$b938] byte
    .byte $00                               ; [$b940] byte

TOWNS_BLOCKS_SCREEN_01:                     ; [$b941]
    .byte $c2,$4d,$34,$c2,$72,$ac,$24,$00   ; [$b941] byte
    .byte $00,$34,$d3,$09,$c8,$32,$3d,$bf   ; [$b949] byte
    .byte $4d,$4d,$34,$40,$00,$c7,$dc,$8a   ; [$b951] byte
    .byte $10,$00,$d3,$43,$6f,$c5,$72,$5c   ; [$b959] byte
    .byte $5b,$00,$74,$6d,$1d,$00,$db,$c7   ; [$b961] byte
    .byte $14,$c6,$31,$9c,$63,$1a,$73,$ed   ; [$b969] byte
    .byte $03,$41,$db,$c0,$85,$31,$2c,$5c   ; [$b971] byte
    .byte $d1,$73,$fd,$13,$42,$b0,$04,$c6   ; [$b979] byte
    .byte $31,$97,$15,$c4,$30,$fc,$47,$16   ; [$b981] byte
    .byte $cb,$72,$e0,$cf,$70,$9d,$13,$1a   ; [$b989] byte
    .byte $c4,$c7,$03,$c2,$b0,$ec,$2b,$1e   ; [$b991] byte
    .byte $cb,$32,$fc,$df,$38,$cf,$31,$9c   ; [$b999] byte
    .byte $4f,$17,$d4,$33,$c5,$c1,$30,$5c   ; [$b9a1] byte
    .byte $1d,$ca,$f3,$2c,$cf,$34,$cd,$b4   ; [$b9a9] byte
    .byte $fd,$43,$36,$ca,$33,$65,$c1,$b1   ; [$b9b1] byte
    .byte $cc,$21,$73,$1c,$eb,$35,$74,$ed   ; [$b9b9] byte
    .byte $53,$4b,$55,$71,$d5,$73,$0c,$ef   ; [$b9c1] byte
    .byte $36,$1d,$4d,$c0,$80,$00,$00,$00   ; [$b9c9] byte
    .byte $c0,$40,$00,$00,$00               ; [$b9d1] byte

TOWNS_BLOCKS_SCREEN_02:                     ; [$b9d6]
    .byte $d3,$40,$36,$fd,$34,$00,$00,$00   ; [$b9d6] byte
    .byte $03,$6f,$4d,$bc,$40,$00,$0d,$bc   ; [$b9de] byte
    .byte $40,$c2,$41,$00,$04,$d1,$b4,$74   ; [$b9e6] byte
    .byte $41,$00,$07,$4d,$cf,$b4,$0d,$05   ; [$b9ee] byte
    .byte $41,$00,$db,$cb,$45,$cf,$f4,$4d   ; [$b9f6] byte
    .byte $0a,$c5,$31,$8c,$6a,$4c,$27,$6f   ; [$b9fe] byte
    .byte $34,$dc,$27,$1f,$cb,$72,$ec,$f7   ; [$ba06] byte
    .byte $22,$71,$3c,$5d,$41,$30,$9b,$5d   ; [$ba0e] byte
    .byte $d7,$c3,$5e,$c5,$75,$ac,$59,$40   ; [$ba16] byte
    .byte $c2,$43,$59,$d3,$b5,$bc,$db,$58   ; [$ba1e] byte
    .byte $c0,$f0,$dc,$31,$d3,$10,$41,$75   ; [$ba26] byte
    .byte $45,$71,$c7,$4d,$50,$74,$d5,$75   ; [$ba2e] byte
    .byte $35,$71,$d5,$c0,$80,$00,$00,$00   ; [$ba36] byte
    .byte $c0,$40,$00,$00,$00               ; [$ba3e] byte

TOWNS_BLOCKS_SCREEN_03:                     ; [$ba43]
    .byte $d3,$4d,$bc,$0d,$34,$0d,$bf,$4d   ; [$ba43] byte
    .byte $00,$07,$2a,$d3,$43,$6f,$40,$00   ; [$ba4b] byte
    .byte $0c,$ab,$62,$90,$90,$00,$0d,$88   ; [$ba53] byte
    .byte $1d,$bc,$80,$00,$31,$47,$18,$71   ; [$ba5b] byte
    .byte $a8,$00,$00,$db,$dc,$4f,$12,$c4   ; [$ba63] byte
    .byte $f1,$7d,$bf,$45,$d0,$34,$17,$63   ; [$ba6b] byte
    .byte $71,$4c,$63,$19,$b1,$5c,$43,$0f   ; [$ba73] byte
    .byte $c4,$71,$6c,$ab,$1f,$cb,$b2,$2c   ; [$ba7b] byte
    .byte $53,$62,$c6,$9c,$4c,$db,$f0,$3c   ; [$ba83] byte
    .byte $2b,$0e,$c2,$b0,$cd,$3f,$5d,$cd   ; [$ba8b] byte
    .byte $f5,$e7,$13,$c5,$f4,$fc,$e3,$3c   ; [$ba93] byte
    .byte $5c,$13,$05,$c1,$dd,$3b,$59,$cc   ; [$ba9b] byte
    .byte $f5,$8d,$3f,$50,$cf,$34,$ed,$5b   ; [$baa3] byte
    .byte $36,$5c,$1b,$1c,$c2,$15,$d5,$1d   ; [$baab] byte
    .byte $3b,$3a,$cd,$9d,$53,$4b,$57,$1d   ; [$bab3] byte
    .byte $57,$39,$d4,$f5,$77,$3b,$5d,$4d   ; [$babb] byte
    .byte $c0,$80,$00,$00,$00,$c0,$40,$00   ; [$bac3] byte
    .byte $00,$00                           ; [$bacb] byte

TOWNS_BLOCKS_SCREEN_04:                     ; [$bacd]
    .byte $db,$cd,$34,$00,$00,$00,$41,$00   ; [$bacd] byte
    .byte $0d,$bc,$01,$74,$d4,$01,$36,$f0   ; [$bad5] byte
    .byte $01,$40,$34,$d0,$00,$00,$40,$01   ; [$badd] byte
    .byte $36,$f0,$00,$0d,$17,$40,$d0,$51   ; [$bae5] byte
    .byte $1d,$37,$63,$d3,$71,$4c,$63,$19   ; [$baed] byte
    .byte $4c,$7f,$23,$c8,$91,$db,$cc,$53   ; [$baf5] byte
    .byte $62,$c6,$9c,$4c,$72,$0c,$93,$5c   ; [$bafd] byte
    .byte $b2,$15,$47,$13,$c5,$f4,$fd,$43   ; [$bb05] byte
    .byte $3c,$74,$6c,$b7,$2e,$cf,$74,$74   ; [$bb0d] byte
    .byte $0c,$57,$5b,$c5,$b4,$ed,$6b,$36   ; [$bb15] byte
    .byte $d3,$1d,$3f,$3a,$cf,$14,$0c,$0f   ; [$bb1d] byte
    .byte $1c,$c3                           ; [$bb25] byte

;
; XREFS:
;     CastMagic_RunUpdateSpellHandler
;
BYTE_bb27:                                  ; [$bb27]
    .byte $1c                               ; [$bb27] byte

;
; XREFS:
;     CastMagic_RunUpdateSpellHandler
;
BYTE_bb28:                                  ; [$bb28]
    .byte $e9,$5c,$cb,$3b,$cd,$94,$07,$1d   ; [$bb28] byte
    .byte $5c,$ed,$c0,$80,$00,$00,$00,$c0   ; [$bb30] byte
    .byte $40,$00,$00,$00                   ; [$bb38] byte

TOWNS_BLOCKS_SCREEN_05:                     ; [$bb3c]
    .byte $d3,$40,$00,$00,$00,$00,$00,$00   ; [$bb3c] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$34   ; [$bb44] byte
    .byte $5d,$03,$41,$40,$00,$00,$31,$fc   ; [$bb4c] byte
    .byte $8f,$22,$40,$00,$00,$c8,$34,$e7   ; [$bb54] byte
    .byte $36,$c8,$50,$c4,$c3,$45,$d1,$34   ; [$bb5c] byte
    .byte $14,$c7,$f2,$fc,$df,$38,$c8,$90   ; [$bb64] byte
    .byte $c5,$72,$5c,$5b,$1f,$c9,$32,$24   ; [$bb6c] byte
    .byte $d3,$cc,$cf,$3c,$10,$c0,$f5,$6c   ; [$bb74] byte
    .byte $33,$4f,$d4,$33,$cc,$67,$17,$d3   ; [$bb7c] byte
    .byte $b3,$1c,$f3,$35,$cd,$90,$71,$c7   ; [$bb84] byte
    .byte $4e,$ce,$b3,$6c,$98,$73,$0c,$ea   ; [$bb8c] byte
    .byte $53,$4c,$71,$d5,$ce,$dc,$c3,$28   ; [$bb94] byte
    .byte $5c,$ef,$36,$11,$c0,$80,$00,$00   ; [$bb9c] byte
    .byte $00,$c0,$40,$00,$00,$00           ; [$bba4] byte

TOWNS_BLOCKS_SCREEN_06:                     ; [$bbaa]
    .byte $d3,$40,$00,$00,$00,$03,$2a,$40   ; [$bbaa] byte
    .byte $00,$00,$0c,$83,$24,$c8,$50,$00   ; [$bbb2] byte
    .byte $00,$34,$cc,$7d,$c8,$90,$00,$00   ; [$bbba] byte
    .byte $32,$0c,$93,$44,$b2,$14,$00,$00   ; [$bbc2] byte
    .byte $31,$fc,$28,$32,$24,$c5,$31,$2c   ; [$bbca] byte
    .byte $4f,$12,$c5,$d0,$31,$5c,$13,$0f   ; [$bbd2] byte
    .byte $c1,$f1,$64,$71,$30,$71,$9c,$4f   ; [$bbda] byte
    .byte $17,$70,$3c,$1b,$0e,$c2,$30,$c4   ; [$bbe2] byte
    .byte $d3,$f2,$fc,$df,$2f,$cf,$34,$dc   ; [$bbea] byte
    .byte $9b,$3c,$57,$0b,$5c,$67,$13,$cc   ; [$bbf2] byte
    .byte $8c,$cf,$34,$cd,$b3,$0c,$a3,$36   ; [$bbfa] byte
    .byte $d3,$17,$1c,$5d,$37,$25,$73,$1c   ; [$bc02] byte
    .byte $eb,$35,$5d,$51,$57,$1d,$5c,$03   ; [$bc0a] byte
    .byte $0b,$73,$0c,$ef,$22,$5d,$4d,$c0   ; [$bc12] byte
    .byte $80,$00,$00,$00,$c0,$40,$00,$00   ; [$bc1a] byte
    .byte $00                               ; [$bc22] byte

TOWNS_BLOCKS_SCREEN_07:                     ; [$bc23]
    .byte $d3,$40,$00,$00,$00,$00,$00,$00   ; [$bc23] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$bc2b] byte
    .byte $00,$03,$45,$d0,$34,$17,$2a,$70   ; [$bc33] byte
    .byte $90,$04,$ca,$9c,$ab,$3f,$d5,$b4   ; [$bc3b] byte
    .byte $2c,$83,$24,$c8,$50,$01,$d9,$36   ; [$bc43] byte
    .byte $ad,$93,$2d,$cb,$b3,$dc,$7d,$c8   ; [$bc4b] byte
    .byte $93,$2d,$cb,$83,$3d,$75,$b7,$5d   ; [$bc53] byte
    .byte $d7,$f5,$ed,$3f,$50,$cf,$13,$4f   ; [$bc5b] byte
    .byte $d1,$35,$0d,$13,$3c,$76,$77,$59   ; [$bc63] byte
    .byte $ca,$35,$8c,$cb,$5a,$cd,$93,$2d   ; [$bc6b] byte
    .byte $cb,$b5,$cc,$bb,$3d,$73,$a5,$d5   ; [$bc73] byte
    .byte $1d,$3b,$54,$76,$f3,$4f,$33,$ac   ; [$bc7b] byte
    .byte $f3,$4b,$73,$b5,$d4,$d7,$53,$53   ; [$bc83] byte
    .byte $4e,$33,$bc,$d9,$c0,$80,$00,$00   ; [$bc8b] byte
    .byte $00,$c0,$40,$00,$00,$00           ; [$bc93] byte

TOWNS_BLOCKS_SCREEN_08:                     ; [$bc99]
    .byte $db,$cd,$34,$00,$00,$00,$41,$00   ; [$bc99] byte
    .byte $0d,$bc,$01,$74,$d4,$03,$20,$c8   ; [$bca1] byte
    .byte $72,$ac,$83,$21,$41,$40,$32,$ad   ; [$bca9] byte
    .byte $37,$1f,$c8,$b6,$bc,$7f,$22,$d3   ; [$bcb1] byte
    .byte $40,$74,$6d,$1d,$c8,$32,$3c,$87   ; [$bcb9] byte
    .byte $15,$c5,$b6,$4c,$57,$16,$db,$c0   ; [$bcc1] byte
    .byte $33,$ed,$03,$41,$c7,$dc,$8b,$03   ; [$bcc9] byte
    .byte $c3,$32,$5c,$0f,$0c,$c7,$b1,$9c   ; [$bcd1] byte
    .byte $63,$19,$d3,$73,$fd,$13,$42,$da   ; [$bcd9] byte
    .byte $f6,$ad,$ad,$70,$f5,$c6,$71,$30   ; [$bce1] byte
    .byte $db,$f4,$f3,$36,$d9,$35,$bd,$91   ; [$bce9] byte
    .byte $70,$e5,$d3,$cc,$df,$3c,$74,$ec   ; [$bcf1] byte
    .byte $8d,$76,$a5,$c5,$31,$3c,$5d,$d3   ; [$bcf9] byte
    .byte $8c,$cf,$36,$d3,$1c,$e9,$da,$f5   ; [$bd01] byte
    .byte $4d,$ad,$c1,$31,$cc,$1d,$73,$1c   ; [$bd09] byte
    .byte $eb,$35,$5c,$ed,$d9,$35,$3d,$91   ; [$bd11] byte
    .byte $c1,$b1,$dc,$21,$73,$0c,$ef,$36   ; [$bd19] byte
    .byte $c0,$80,$00,$00,$00,$c0,$40,$00   ; [$bd21] byte
    .byte $00,$00                           ; [$bd29] byte

TOWNS_BLOCKS_SCREEN_09:                     ; [$bd2b]
    .byte $db,$cd,$34,$00,$00,$00,$41,$00   ; [$bd2b] byte
    .byte $0d,$bc,$01,$74,$d4,$01,$00,$41   ; [$bd33] byte
    .byte $40,$34,$d0,$00,$00,$74,$d1,$d3   ; [$bd3b] byte
    .byte $40,$ca,$81,$db,$c0,$c5,$d0,$03   ; [$bd43] byte
    .byte $20,$cc,$b2,$3c,$d3,$21,$80,$50   ; [$bd4b] byte
    .byte $03,$1f,$c9,$03,$22,$c6,$71,$3c   ; [$bd53] byte
    .byte $5d,$cf,$10,$03,$15,$c5,$b5,$ac   ; [$bd5b] byte
    .byte $57,$16,$d3,$f3,$8c,$f1,$cd,$90   ; [$bd63] byte
    .byte $03,$03,$c3,$32,$5c,$0f,$0c,$ca   ; [$bd6b] byte
    .byte $f5,$cc,$d9,$50,$01,$71,$c5,$d3   ; [$bd73] byte
    .byte $b5,$47,$4c,$50,$01,$71,$d5,$75   ; [$bd7b] byte
    .byte $35,$c0,$80,$00,$00,$00,$c0,$40   ; [$bd83] byte
    .byte $00,$00,$00                       ; [$bd8b] byte

TOWNS_BLOCKS_SCREEN_10:                     ; [$bd8e]
    .byte $db,$cd,$34,$00,$00,$00,$41,$00   ; [$bd8e] byte
    .byte $0d,$bc,$01,$74,$d4,$01,$00,$41   ; [$bd96] byte
    .byte $40,$34,$d0,$32,$0c,$85,$00,$74   ; [$bd9e] byte
    .byte $d3,$2a,$d3,$74,$5d,$03,$41,$71   ; [$bda6] byte
    .byte $fc,$89,$36,$f0,$8c,$83,$23,$c8   ; [$bdae] byte
    .byte $71,$fc,$e3,$22,$c8,$33,$2c,$d3   ; [$bdb6] byte
    .byte $21,$d1,$74,$4d,$07,$4d,$0c,$7d   ; [$bdbe] byte
    .byte $c8,$b4,$ec,$8f,$36,$c7,$f3,$1c   ; [$bdc6] byte
    .byte $d7,$36,$c6,$71,$3c,$5d,$0d,$3f   ; [$bdce] byte
    .byte $56,$cf,$31,$5c,$97,$16,$c5,$72   ; [$bdd6] byte
    .byte $53,$16,$d3,$f3,$8c,$f1,$0d,$3b   ; [$bdde] byte
    .byte $5f,$cd,$b0,$3d,$6b,$0c,$c0,$f0   ; [$bde6] byte
    .byte $d3,$0c,$cc,$b5,$cc,$d9,$d3,$17   ; [$bdee] byte
    .byte $3a,$5c,$71,$71,$cd,$6d,$d3,$b5   ; [$bdf6] byte
    .byte $45,$57,$3b,$5c,$75,$71,$dc,$2d   ; [$bdfe] byte
    .byte $75,$35,$c0,$80,$00,$00,$00,$c0   ; [$be06] byte
    .byte $40,$00,$00,$00                   ; [$be0e] byte

TOWNS_BLOCKS_SCREEN_11:                     ; [$be12]
    .byte $db,$cd,$34,$0c,$ab,$4d,$00,$00   ; [$be12] byte
    .byte $41,$32,$0c,$93,$21,$4d,$bc,$01   ; [$be1a] byte
    .byte $74,$d4,$31,$fc,$f7,$22,$40,$41   ; [$be22] byte
    .byte $40,$ca,$b1,$5c,$4b,$16,$ca,$90   ; [$be2a] byte
    .byte $00,$74,$d1,$d8,$b1,$0c,$3f,$11   ; [$be32] byte
    .byte $d8,$90,$03,$6f,$83,$2a,$70,$3c   ; [$be3a] byte
    .byte $3b,$0c,$72,$a4,$d1,$74,$4d,$06   ; [$be42] byte
    .byte $03,$62,$c4,$f0,$a0,$c5,$e4,$cb   ; [$be4a] byte
    .byte $72,$ec,$f5,$03,$04,$c5,$70,$4c   ; [$be52] byte
    .byte $97,$07,$c5,$b0,$74,$d3,$f5,$0c   ; [$be5a] byte
    .byte $f1,$03,$06,$c0,$f0,$6c,$2f,$08   ; [$be62] byte
    .byte $c3,$30,$8c,$9b,$22,$d3,$b5,$fc   ; [$be6a] byte
    .byte $d9,$01,$5c,$71,$5c,$c3,$36,$75   ; [$be72] byte
    .byte $47,$4c,$41,$5c,$75,$55,$75,$35   ; [$be7a] byte
    .byte $c0,$80,$00,$00,$00,$c0,$40,$00   ; [$be82] byte
    .byte $00,$00                           ; [$be8a] byte

TOWNS_BLOCKS_SCREEN_12:                     ; [$be8c]
    .byte $db,$c0,$00,$00,$00,$03,$2a,$40   ; [$be8c] byte
    .byte $00,$00,$0c,$83,$24,$c8,$50,$00   ; [$be94] byte
    .byte $00,$0c,$7d,$c8,$b4,$d4,$00,$00   ; [$be9c] byte
    .byte $32,$0c,$28,$32,$14,$00,$00,$31   ; [$bea4] byte
    .byte $fc,$13,$0f,$c1,$f2,$24,$00,$00   ; [$beac] byte
    .byte $30,$a3,$0e,$c2,$87,$14,$c6,$31   ; [$beb4] byte
    .byte $9c,$63,$1a,$40,$31,$5c,$13,$05   ; [$bebc] byte
    .byte $c1,$f1,$e5,$c4,$c3,$17,$c6,$71   ; [$bec4] byte
    .byte $33,$17,$70,$3c,$1b,$0b,$c2,$30   ; [$becc] byte
    .byte $c7,$4f,$d7,$75,$cd,$7b,$3c,$cc   ; [$bed4] byte
    .byte $35,$bd,$43,$3c,$d3,$17,$1c,$57   ; [$bedc] byte
    .byte $4e,$d6,$73,$ad,$63,$36,$75,$4c   ; [$bee4] byte
    .byte $a3,$36,$57,$1d,$55,$73,$b5,$75   ; [$beec] byte
    .byte $35,$c0,$80,$00,$00,$00,$c0,$40   ; [$bef4] byte
    .byte $00,$00,$00                       ; [$befc] byte

TOWNS_BLOCKS_SCREEN_13:                     ; [$beff]
    .byte $db,$cd,$34,$db,$c0,$00,$00,$04   ; [$beff] byte
    .byte $74,$d7,$4d,$74,$d1,$00,$07,$6f   ; [$bf07] byte
    .byte $85,$5d,$bc,$00,$00,$01,$07,$4d   ; [$bf0f] byte
    .byte $10,$0d,$17,$40,$d0,$50,$00,$44   ; [$bf17] byte
    .byte $c2,$74,$5c,$ff,$44,$d0,$a7,$45   ; [$bf1f] byte
    .byte $d0,$03,$41,$91,$71,$fc,$b7,$2e   ; [$bf27] byte
    .byte $cf,$72,$27,$1f,$c9,$03,$22,$45   ; [$bf2f] byte
    .byte $74,$fc,$dc,$33,$6c,$9b,$4f,$35   ; [$bf37] byte
    .byte $6c,$f3,$36,$c6,$71,$3c,$5f,$3c   ; [$bf3f] byte
    .byte $74,$ec,$cb,$33,$cd,$1c,$c3,$4e   ; [$bf47] byte
    .byte $d7,$75,$fd,$79,$c5,$75,$ac,$59   ; [$bf4f] byte
    .byte $d3,$5c,$c7,$3a,$cd,$55,$d6,$73   ; [$bf57] byte
    .byte $ad,$61,$c0,$f1,$cc,$33,$4b,$5c   ; [$bf5f] byte
    .byte $c3,$3b,$cf,$15,$73,$b5,$71,$d5   ; [$bf67] byte
    .byte $c0,$80,$00,$00,$00,$c0,$40,$00   ; [$bf6f] byte
    .byte $00,$00,$ff,$ff,$ff,$ff,$6f,$ff   ; [$bf77] byte
    .byte $00,$04,$7f,$fe,$ff,$ff,$ff,$ff   ; [$bf7f] byte
    .byte $20,$22,$fb,$ff,$f3,$ff,$ff,$ff   ; [$bf87] byte
    .byte $00,$00,$ff,$77,$ff,$ff,$ff,$ff   ; [$bf8f] byte
    .byte $00,$58,$df,$ff,$f7,$ff,$ff,$ff   ; [$bf97] byte
    .byte $00,$00,$ff,$ff,$ff,$ff,$fb,$fd   ; [$bf9f] byte
    .byte $00,$a0,$df,$ff,$ff,$ff,$fb,$ff   ; [$bfa7] byte
    .byte $00,$62,$ff,$f7,$7f,$ff,$9d,$ff   ; [$bfaf] byte
    .byte $00,$40,$ff,$ff,$ff,$ff,$6f,$ff   ; [$bfb7] byte
    .byte $00,$00,$ff,$f1,$ff,$ff,$ff,$ff   ; [$bfbf] byte
    .byte $29,$00,$ff,$ef,$df,$7e,$fe,$ff   ; [$bfc7] byte
    .byte $00,$20,$bf,$eb,$ff,$ff,$ff,$ff   ; [$bfcf] byte
    .byte $00,$04,$ff,$ff,$ff,$ff,$aa,$ff   ; [$bfd7] byte
    .byte $80,$00,$ff,$be,$ff,$7b,$ff,$ff   ; [$bfdf] byte
    .byte $2d,$01,$ff,$fb,$ff,$ff,$ff,$ff   ; [$bfe7] byte
    .byte $00,$00,$ff,$ff,$ff,$ff,$99,$ff   ; [$bfef] byte
    .byte $80,$00,$ff,$bf,$fe,$ff,$ff,$ff   ; [$bff7] byte
    .byte $00                               ; [$bfff] byte
