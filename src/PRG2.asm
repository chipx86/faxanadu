;============================================================================
; Faxanadu (U).nes
;
; PRG2 ($8000 - $bfff)
;============================================================================

    .segment "PRG2"
    .reloc

    bank_offset_16 ZENITH_BLOCKS            ; Zenith
    bank_offset_16 BUILDINGS_BLOCKS         ; Buildings
    bank_offset_16 DARTMOOR_BLOCKS          ; Dartmoor

ZENITH_BLOCKS:                              ; [$8006]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_00  ; ZENITH_BLOCKS_SCREEN_00
                                            ; [$PRG2::8006]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_01  ; ZENITH_BLOCKS_SCREEN_01
                                            ; [$PRG2::8008]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_02  ; ZENITH_BLOCKS_SCREEN_02
                                            ; [$PRG2::800a]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_03  ; ZENITH_BLOCKS_SCREEN_03
                                            ; [$PRG2::800c]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_04  ; ZENITH_BLOCKS_SCREEN_04
                                            ; [$PRG2::800e]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_05  ; ZENITH_BLOCKS_SCREEN_05
                                            ; [$PRG2::8010]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_06  ; ZENITH_BLOCKS_SCREEN_06
                                            ; [$PRG2::8012]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_07  ; ZENITH_BLOCKS_SCREEN_07
                                            ; [$PRG2::8014]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_08  ; ZENITH_BLOCKS_SCREEN_08
                                            ; [$PRG2::8016]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_09  ; ZENITH_BLOCKS_SCREEN_09
                                            ; [$PRG2::8018]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_10  ; ZENITH_BLOCKS_SCREEN_10
                                            ; [$PRG2::801a]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_11  ; ZENITH_BLOCKS_SCREEN_11
                                            ; [$PRG2::801c]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_12  ; ZENITH_BLOCKS_SCREEN_12
                                            ; [$PRG2::801e]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_13  ; ZENITH_BLOCKS_SCREEN_13
                                            ; [$PRG2::8020]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_14  ; ZENITH_BLOCKS_SCREEN_14
                                            ; [$PRG2::8022]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_15  ; ZENITH_BLOCKS_SCREEN_15
                                            ; [$PRG2::8024]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_16  ; ZENITH_BLOCKS_SCREEN_16
                                            ; [$PRG2::8026]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_17  ; ZENITH_BLOCKS_SCREEN_17
                                            ; [$PRG2::8028]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_18  ; ZENITH_BLOCKS_SCREEN_18
                                            ; [$PRG2::802a]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_19  ; ZENITH_BLOCKS_SCREEN_19
                                            ; [$PRG2::802c]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_20  ; ZENITH_BLOCKS_SCREEN_20
                                            ; [$PRG2::802e]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_21  ; ZENITH_BLOCKS_SCREEN_21
                                            ; [$PRG2::8030]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_22  ; ZENITH_BLOCKS_SCREEN_22
                                            ; [$PRG2::8032]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_23  ; ZENITH_BLOCKS_SCREEN_23
                                            ; [$PRG2::8034]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_24  ; ZENITH_BLOCKS_SCREEN_24
                                            ; [$PRG2::8036]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_25  ; ZENITH_BLOCKS_SCREEN_25
                                            ; [$PRG2::8038]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_26  ; ZENITH_BLOCKS_SCREEN_26
                                            ; [$PRG2::803a]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_27  ; ZENITH_BLOCKS_SCREEN_27
                                            ; [$PRG2::803c]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_28  ; ZENITH_BLOCKS_SCREEN_28
                                            ; [$PRG2::803e]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_29  ; ZENITH_BLOCKS_SCREEN_29
                                            ; [$PRG2::8040]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_30  ; ZENITH_BLOCKS_SCREEN_30
                                            ; [$PRG2::8042]
    bank_offset_16 ZENITH_BLOCKS_SCREEN_31  ; ZENITH_BLOCKS_SCREEN_31
                                            ; [$PRG2::8044]

;
; XREFS:
;     ZENITH_BLOCKS [$PRG2::8006]
;
ZENITH_BLOCKS_SCREEN_00:                    ; [$8046]
    .byte $c4,$30,$2c,$07,$04,$c0,$f0,$2c   ; [$8046] byte
    .byte $07,$04,$c0,$f0,$2c,$43,$02,$c4   ; [$804e] byte
    .byte $31,$2c,$07,$02,$c6,$71,$63,$18   ; [$8056] byte
    .byte $c6,$71,$63,$18,$c6,$71,$6c,$57   ; [$805e] byte
    .byte $16,$c6,$31,$9c,$0f,$04,$c3,$b1   ; [$8066] byte
    .byte $a3,$0e,$31,$a3,$0e,$31,$a0,$c3   ; [$806e] byte
    .byte $8c,$07,$02,$c3,$30,$dc,$33,$0d   ; [$8076] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$807e] byte
    .byte $33,$0d,$c3,$30,$dc,$0f,$04,$c3   ; [$8086] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$808e] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$8096] byte
    .byte $fc,$07,$02,$c3,$30,$dc,$33,$0d   ; [$809e] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$80a6] byte
    .byte $57,$1f,$c3,$30,$dc,$0f,$04,$c4   ; [$80ae] byte
    .byte $b1,$b0,$00,$31,$07,$12,$c0,$70   ; [$80b6] byte
    .byte $2c,$07,$02,$c4,$70,$2c,$07,$11   ; [$80be] byte
    .byte $30,$2c,$07,$11,$c4,$b0,$17,$02   ; [$80c6] byte
    .byte $c0,$f0,$4c,$0f,$04,$c6,$71,$63   ; [$80ce] byte
    .byte $18,$c6,$71,$63,$18,$c6,$71,$67   ; [$80d6] byte
    .byte $16,$c6,$31,$9c,$07,$02,$c3,$b1   ; [$80de] byte
    .byte $a3,$0e,$31,$a3,$0e,$31,$ac,$64   ; [$80e6] byte
    .byte $c3,$8c,$0f,$04,$70,$fc,$38,$c3   ; [$80ee] byte
    .byte $ec,$3d,$c3,$e0,$c3,$d3,$39,$c3   ; [$80f6] byte
    .byte $70,$cc,$37,$0c,$c3,$70,$cc,$37   ; [$80fe] byte
    .byte $0c,$c3,$70,$cc,$37,$0c,$c3,$70   ; [$8106] byte
    .byte $cc,$37,$3a,$c0,$70,$2c,$07,$02   ; [$810e] byte
    .byte $c0,$70,$2c,$07,$02,$c0,$70,$2c   ; [$8116] byte
    .byte $07,$02,$c0,$70,$2c,$07,$02       ; [$811e] byte

ZENITH_BLOCKS_SCREEN_01:                    ; [$8125]
    .byte $c4,$b0,$1c,$4b,$10,$c0,$b1,$ec   ; [$8125] byte
    .byte $07,$12,$c4,$30,$2c,$07,$12,$c4   ; [$812d] byte
    .byte $30,$2c,$07,$12,$c6,$71,$6c,$63   ; [$8135] byte
    .byte $19,$c5,$b1,$5c,$5b,$18,$c6,$71   ; [$813d] byte
    .byte $63,$18,$c6,$71,$63,$18,$c3,$b1   ; [$8145] byte
    .byte $ac,$38,$c6,$9c,$67,$0e,$31,$a3   ; [$814d] byte
    .byte $0e,$31,$a3,$0e,$c3,$30,$dc,$33   ; [$8155] byte
    .byte $0d,$c3,$2c,$83,$0d,$c3,$30,$dc   ; [$815d] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$b0   ; [$8165] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$816d] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$8175] byte
    .byte $3b,$0f,$c3,$30,$dc,$33,$0d,$c3   ; [$817d] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$8185] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c7,$b1   ; [$818d] byte
    .byte $b0,$00,$00,$03,$10,$c0,$70,$2c   ; [$8195] byte
    .byte $07,$11,$c0,$b1,$ec,$07,$11,$30   ; [$819d] byte
    .byte $2c,$07,$11,$30,$2c,$07,$11,$c0   ; [$81a5] byte
    .byte $f0,$4c,$5b,$18,$c5,$b1,$5c,$5b   ; [$81ad] byte
    .byte $18,$c6,$71,$63,$18,$c6,$71,$63   ; [$81b5] byte
    .byte $18,$c6,$83,$0e,$c6,$8c,$67,$0e   ; [$81bd] byte
    .byte $31,$a3,$0e,$31,$a3,$0e,$30,$fc   ; [$81c5] byte
    .byte $38,$c3,$f0,$ec,$3d,$c3,$ec,$3d   ; [$81cd] byte
    .byte $c3,$ec,$3d,$c3,$70,$cc,$57,$0c   ; [$81d5] byte
    .byte $c3,$70,$cc,$37,$0c,$c3,$70,$cc   ; [$81dd] byte
    .byte $37,$0c,$c3,$70,$cc,$37,$0c,$c4   ; [$81e5] byte
    .byte $b1,$e7,$1d,$c4,$30,$2c,$3f,$0e   ; [$81ed] byte
    .byte $c3,$f0,$ec,$07,$02,$c0,$70,$2c   ; [$81f5] byte
    .byte $07,$02                           ; [$81fd] byte

ZENITH_BLOCKS_SCREEN_02:                    ; [$81ff]
    .byte $c0,$71,$13,$02,$c0,$71,$13,$02   ; [$81ff] byte
    .byte $c7,$b0,$1c,$4b,$10,$c0,$b0,$1c   ; [$8207] byte
    .byte $47,$12,$c5,$f3,$2c,$d3,$16,$33   ; [$820f] byte
    .byte $2c,$ab,$16,$c5,$71,$6c,$cb,$34   ; [$8217] byte
    .byte $c5,$8c,$cb,$2a,$73,$0c,$8b,$2a   ; [$821f] byte
    .byte $cc,$b2,$2c,$8f,$29,$cd,$32,$9c   ; [$8227] byte
    .byte $87,$22,$ca,$b3,$2c,$8b,$23,$73   ; [$822f] byte
    .byte $fc,$c7,$23,$c8,$73,$17,$24,$72   ; [$8237] byte
    .byte $57,$31,$c8,$f2,$1c,$c5,$73,$0c   ; [$823f] byte
    .byte $b9,$72,$e7,$30,$cf,$72,$37,$2e   ; [$8247] byte
    .byte $5c,$b9,$73,$fc,$bd,$72,$f5,$c5   ; [$824f] byte
    .byte $57,$2f,$5c,$bd,$c0,$f1,$1c,$0b   ; [$8257] byte
    .byte $10,$c4,$40,$71,$10,$31,$2c,$07   ; [$825f] byte
    .byte $02,$c0,$71,$2c,$5b,$01,$c0,$b1   ; [$8267] byte
    .byte $07,$02,$70,$17,$12,$c0,$70,$2c   ; [$826f] byte
    .byte $0f,$04,$c5,$f1,$93,$03,$c1,$31   ; [$8277] byte
    .byte $93,$16,$71,$6c,$63,$19,$c0,$f0   ; [$827f] byte
    .byte $4c,$63,$19,$72,$0c,$3b,$1a,$30   ; [$8287] byte
    .byte $e3,$1a,$0c,$38,$c6,$8c,$38,$5c   ; [$828f] byte
    .byte $3e,$c3,$dc,$3e,$c3,$f0,$ec,$3d   ; [$8297] byte
    .byte $c3,$f0,$ec,$3d,$c5,$9c,$37,$0c   ; [$829f] byte
    .byte $c3,$70,$cc,$37,$0c,$c3,$70,$cc   ; [$82a7] byte
    .byte $37,$0c,$c3,$70,$cc,$37,$0c,$c0   ; [$82af] byte
    .byte $70,$2c,$6c,$00,$00,$03,$01       ; [$82b7] byte

ZENITH_BLOCKS_SCREEN_03:                    ; [$82be]
    .byte $c4,$b0,$1c,$57,$01,$c0,$b2,$0c   ; [$82be] byte
    .byte $37,$0c,$c3,$70,$cc,$43,$02,$c0   ; [$82c6] byte
    .byte $71,$2c,$43,$12,$c7,$71,$67,$03   ; [$82ce] byte
    .byte $c1,$1c,$3f,$0e,$c3,$f0,$ec,$67   ; [$82d6] byte
    .byte $16,$31,$93,$1d,$c5,$f1,$97,$19   ; [$82de] byte
    .byte $c6,$b0,$e0,$5d,$33,$26,$c6,$4c   ; [$82e6] byte
    .byte $9b,$55,$72,$0c,$6b,$20,$c3,$30   ; [$82ee] byte
    .byte $dc,$33,$0d,$c3,$34,$8c,$9b,$2c   ; [$82f6] byte
    .byte $cd,$72,$7c,$b3,$54,$5c,$3b,$0f   ; [$82fe] byte
    .byte $c3,$b0,$fc,$3b,$1d,$c7,$f0,$fc   ; [$8306] byte
    .byte $87,$50,$cc,$b3,$4d,$41,$5c,$57   ; [$830e] byte
    .byte $1f,$c3,$30,$dc,$33,$17,$c8,$31   ; [$8316] byte
    .byte $57,$34,$cc,$f2,$29,$c0,$f0,$27   ; [$831e] byte
    .byte $20,$c3,$b0,$fc,$3b,$03,$c0,$9d   ; [$8326] byte
    .byte $0b,$1d,$cc,$34,$ec,$07,$04,$c7   ; [$832e] byte
    .byte $b1,$75,$c3,$30,$dc,$33,$1e,$c5   ; [$8336] byte
    .byte $d7,$17,$5c,$5f,$1e,$c0,$70,$45   ; [$833e] byte
    .byte $c3,$b0,$fc,$3b,$01,$c1,$17,$16   ; [$8346] byte
    .byte $5c,$0f,$02,$c5,$f1,$95,$c3,$30   ; [$834e] byte
    .byte $dc,$33,$17,$c6,$71,$ac,$87,$24   ; [$8356] byte
    .byte $cc,$f1,$3c,$53,$17,$32,$0c,$69   ; [$835e] byte
    .byte $c3,$b0,$fc,$39,$c8,$30,$f7,$30   ; [$8366] byte
    .byte $cb,$b5,$1d,$33,$62,$5c,$33,$0d   ; [$836e] byte
    .byte $c3,$31,$5c,$7d,$70,$d5,$cb,$f2   ; [$8376] byte
    .byte $35,$c5,$b0,$1c,$4b,$01,$c4,$9c   ; [$837e] byte
    .byte $77,$03,$c4,$40,$00               ; [$8386] byte

ZENITH_BLOCKS_SCREEN_04:                    ; [$838b]
    .byte $c4,$b0,$1c,$44,$c5,$f1,$5c,$07   ; [$838b] byte
    .byte $11,$30,$2c,$64,$c0,$71,$2c,$43   ; [$8393] byte
    .byte $12,$c4,$30,$4c,$64,$c5,$9c,$5b   ; [$839b] byte
    .byte $19,$31,$6c,$83,$0e,$c5,$b1,$93   ; [$83a3] byte
    .byte $1d,$c6,$8c,$38,$c6,$9c,$67,$0e   ; [$83ab] byte
    .byte $c6,$8c,$38,$c6,$b0,$e3,$17,$c3   ; [$83b3] byte
    .byte $30,$dc,$33,$0d,$c3,$2c,$83,$0d   ; [$83bb] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$83c3] byte
    .byte $31,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$83cb] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$83d3] byte
    .byte $c3,$b0,$fc,$39,$c3,$30,$dc,$33   ; [$83db] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$83e3] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$31,$c7   ; [$83eb] byte
    .byte $71,$c0,$31,$fc,$3b,$1d,$c7,$f0   ; [$83f3] byte
    .byte $fc,$6c,$c7,$f0,$fc,$07,$04,$c0   ; [$83fb] byte
    .byte $f1,$13,$12,$c7,$72,$0c,$33,$17   ; [$8403] byte
    .byte $c8,$30,$dc,$07,$02,$c8,$30,$dc   ; [$840b] byte
    .byte $5f,$1e,$c4,$b1,$90,$c5,$9c,$3b   ; [$8413] byte
    .byte $16,$70,$fc,$0f,$04,$70,$fc,$0f   ; [$841b] byte
    .byte $02,$c6,$b0,$e0,$c6,$9c,$33,$1a   ; [$8423] byte
    .byte $70,$dc,$68,$70,$dc,$6b,$17,$c3   ; [$842b] byte
    .byte $b0,$f7,$0f,$b0,$fc,$3b,$0f,$c3   ; [$8433] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$39   ; [$843b] byte
    .byte $c0,$70,$2c,$07,$02,$c0,$70,$2c   ; [$8443] byte
    .byte $07,$02,$c0,$70,$2c,$07,$02,$c0   ; [$844b] byte
    .byte $70,$2c,$77,$16,$c0,$f0,$4c,$0f   ; [$8453] byte
    .byte $04,$c0,$f0,$4c,$0f,$04,$c0,$f0   ; [$845b] byte
    .byte $4c,$0f,$04,$c0,$f0,$4c,$0f,$12   ; [$8463] byte

ZENITH_BLOCKS_SCREEN_05:                    ; [$846b]
    .byte $c0,$71,$13,$02,$c0,$71,$13,$02   ; [$846b] byte
    .byte $c0,$71,$13,$02,$c0,$71,$1c,$4b   ; [$8473] byte
    .byte $01,$c5,$f1,$93,$16,$31,$93,$16   ; [$847b] byte
    .byte $31,$93,$16,$31,$93,$16,$72,$0c   ; [$8483] byte
    .byte $3b,$1a,$30,$e3,$1a,$30,$e3,$1a   ; [$848b] byte
    .byte $30,$e3,$1a,$5c,$33,$0d,$c3,$30   ; [$8493] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$849b] byte
    .byte $c3,$30,$dc,$33,$0d,$5c,$3b,$0f   ; [$84a3] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$84ab] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$5c   ; [$84b3] byte
    .byte $57,$1f,$c3,$30,$dc,$33,$0d,$c3   ; [$84bb] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$84c3] byte
    .byte $0d,$c0,$f0,$27,$01,$c4,$b1,$0c   ; [$84cb] byte
    .byte $44,$31,$2c,$43,$11,$31,$2c,$43   ; [$84d3] byte
    .byte $12,$c7,$b1,$77,$17,$c4,$2b,$12   ; [$84db] byte
    .byte $c4,$17,$12,$c4,$15,$c0,$70,$45   ; [$84e3] byte
    .byte $c6,$71,$ac,$67,$1a,$c6,$71,$ac   ; [$84eb] byte
    .byte $67,$1a,$c6,$71,$ac,$67,$1a,$c5   ; [$84f3] byte
    .byte $f1,$95,$c8,$30,$ec,$3f,$0e,$c3   ; [$84fb] byte
    .byte $f0,$ec,$3f,$0e,$c3,$f0,$ec,$3f   ; [$8503] byte
    .byte $0e,$72,$05,$70,$fa,$aa,$aa,$55   ; [$850b] byte
    .byte $c7,$0c,$7f,$0d,$c3,$31,$b0,$03   ; [$8513] byte
    .byte $1d,$c0,$f1,$27,$03,$c4,$71,$2c   ; [$851b] byte
    .byte $83,$0f,$c3,$b1,$0c,$44,$03,$04   ; [$8523] byte

ZENITH_BLOCKS_SCREEN_06:                    ; [$852b]
    .byte $c0,$70,$2c,$57,$01,$c4,$b1,$dc   ; [$852b] byte
    .byte $83,$0f,$c3,$b0,$1c,$47,$12,$c4   ; [$8533] byte
    .byte $30,$2c,$43,$02,$c5,$87,$16,$c4   ; [$853b] byte
    .byte $30,$47,$0d,$c3,$31,$6c,$7b,$19   ; [$8543] byte
    .byte $c6,$b0,$3c,$4b,$17,$c5,$40,$07   ; [$854b] byte
    .byte $0f,$c3,$b1,$a3,$0e,$21,$c6,$80   ; [$8553] byte
    .byte $07,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$855b] byte
    .byte $30,$dc,$31,$c3,$b0,$fc,$3b,$0f   ; [$8563] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$856b] byte
    .byte $3b,$0f,$c3,$b0,$fc,$39,$c3,$30   ; [$8573] byte
    .byte $dc,$33,$0d,$70,$dc,$33,$0d,$c3   ; [$857b] byte
    .byte $30,$dc,$33,$0d,$c3,$31,$5c,$7d   ; [$8583] byte
    .byte $c7,$71,$ec,$7f,$0f,$c7,$71,$fc   ; [$858b] byte
    .byte $3b,$1d,$c7,$f0,$fc,$07,$11,$c0   ; [$8593] byte
    .byte $9c,$07,$04,$c0,$f1,$2c,$83,$0d   ; [$859b] byte
    .byte $c5,$f2,$0c,$33,$17,$c8,$30,$dc   ; [$85a3] byte
    .byte $5f,$10,$c1,$1c,$5f,$1e,$c0,$57   ; [$85ab] byte
    .byte $0f,$c5,$9c,$3b,$16,$70,$fc,$0f   ; [$85b3] byte
    .byte $11,$c4,$9c,$0f,$12,$c5,$f1,$97   ; [$85bb] byte
    .byte $0d,$c6,$b0,$ec,$33,$1a,$70,$dc   ; [$85c3] byte
    .byte $68,$00,$72,$0c,$3b,$0f,$c3,$b0   ; [$85cb] byte
    .byte $fb,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$85d3] byte
    .byte $b0,$fc,$38,$5c,$33,$0d,$c3,$30   ; [$85db] byte
    .byte $dc,$33,$0d,$c4,$31,$13,$12,$c7   ; [$85e3] byte
    .byte $f0,$dc,$33,$0d,$c0,$f1,$1c,$4b   ; [$85eb] byte
    .byte $01,$c0,$b0,$1c,$0b,$01,$c0,$b0   ; [$85f3] byte
    .byte $1c,$0b,$01,$c0,$b1,$0c,$44       ; [$85fb] byte

ZENITH_BLOCKS_SCREEN_07:                    ; [$8602]
    .byte $c4,$b0,$1c,$44,$0c,$0b,$01,$c4   ; [$8602] byte
    .byte $4c,$0b,$01,$c4,$71,$2c,$07,$02   ; [$860a] byte
    .byte $c4,$30,$4c,$54,$0c,$58,$c5,$4c   ; [$8612] byte
    .byte $58,$c6,$4c,$5b,$17,$c6,$87,$19   ; [$861a] byte
    .byte $c6,$9c,$67,$1a,$4c,$67,$1a,$c3   ; [$8622] byte
    .byte $8c,$69,$c3,$30,$db,$20,$c3,$2c   ; [$862a] byte
    .byte $83,$0d,$8c,$83,$0d,$c3,$30,$dc   ; [$8632] byte
    .byte $33,$16,$c3,$b0,$fc,$3b,$0f,$c3   ; [$863a] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$8642] byte
    .byte $0f,$c3,$b0,$fc,$3b,$1a,$c3,$30   ; [$864a] byte
    .byte $dc,$57,$1f,$c3,$30,$dc,$33,$0d   ; [$8652] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$865a] byte
    .byte $33,$0d,$c7,$71,$e7,$20,$c3,$b0   ; [$8662] byte
    .byte $fc,$43,$02,$c7,$f0,$fc,$07,$12   ; [$866a] byte
    .byte $c7,$f0,$fc,$07,$02,$c0,$f1,$25   ; [$8672] byte
    .byte $c3,$30,$dc,$77,$16,$c8,$30,$dc   ; [$867a] byte
    .byte $5b,$1d,$c8,$30,$dc,$0f,$04,$c0   ; [$8682] byte
    .byte $55,$c3,$b0,$fc,$0f,$12,$70,$fc   ; [$868a] byte
    .byte $0f,$04,$70,$fc,$43,$02,$c5,$f1   ; [$8692] byte
    .byte $9c,$69,$c3,$30,$dc,$68,$70,$dc   ; [$869a] byte
    .byte $68,$70,$dc,$6b,$17,$32,$0c,$3b   ; [$86a2] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$86aa] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$39,$1c   ; [$86b2] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$86ba] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$31   ; [$86c2] byte
    .byte $c0,$f1,$1c,$4b,$01,$c0,$b0,$1c   ; [$86ca] byte
    .byte $0b,$01,$c0,$b0,$1c,$0b,$01,$c0   ; [$86d2] byte
    .byte $b1,$0c,$47,$04                   ; [$86da] byte

ZENITH_BLOCKS_SCREEN_08:                    ; [$86de]
    .byte $c0,$71,$2c,$07,$11,$c4,$b0,$1c   ; [$86de] byte
    .byte $4b,$01,$c4,$4c,$0b,$01,$c4,$71   ; [$86e6] byte
    .byte $2c,$07,$11,$c5,$f1,$0c,$13,$32   ; [$86ee] byte
    .byte $ca,$b1,$6c,$57,$16,$c5,$4c,$58   ; [$86f6] byte
    .byte $c5,$4c,$5b,$1e,$73,$2c,$d3,$42   ; [$86fe] byte
    .byte $c8,$f1,$50,$00,$03,$19,$73,$0c   ; [$8706] byte
    .byte $b7,$21,$71,$9c,$68,$00,$00,$73   ; [$870e] byte
    .byte $fc,$bb,$42,$72,$0c,$3b,$0f,$c3   ; [$8716] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$39   ; [$871e] byte
    .byte $73,$0c,$bf,$21,$71,$5c,$7f,$0d   ; [$8726] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$872e] byte
    .byte $33,$0d,$c0,$f1,$10,$c4,$9c,$76   ; [$8736] byte
    .byte $c3,$b1,$dc,$7f,$0f,$c7,$71,$fc   ; [$873e] byte
    .byte $3b,$1d,$c7,$b0,$17,$12,$c5,$4c   ; [$8746] byte
    .byte $5f,$20,$c3,$31,$7c,$83,$0d,$c5   ; [$874e] byte
    .byte $f2,$0c,$33,$17,$c0,$71,$2c,$54   ; [$8756] byte
    .byte $31,$9c,$59,$c3,$b1,$67,$0f,$c5   ; [$875e] byte
    .byte $9c,$39,$31,$9c,$68,$32,$0c,$69   ; [$8766] byte
    .byte $c3,$31,$a7,$0d,$c6,$9c,$31,$32   ; [$876e] byte
    .byte $0c,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$8776] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$877e] byte
    .byte $39,$1c,$33,$0d,$c3,$30,$dc,$33   ; [$8786] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$878e] byte
    .byte $dc,$31,$c0,$f1,$1c,$4b,$01,$c0   ; [$8796] byte
    .byte $b0,$1c,$0b,$01,$c0,$b0,$1c,$0b   ; [$879e] byte
    .byte $01,$c0,$b1,$0c,$47,$04           ; [$87a6] byte

ZENITH_BLOCKS_SCREEN_09:                    ; [$87ac]
    .byte $c4,$4c,$4b,$10,$c4,$b1,$0c,$4b   ; [$87ac] byte
    .byte $10,$c4,$b1,$0c,$4b,$10,$c4,$b1   ; [$87b4] byte
    .byte $0c,$47,$02,$c6,$80,$00,$00,$03   ; [$87bc] byte
    .byte $17,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$87c4] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$87cc] byte
    .byte $c3,$b0,$fc,$39,$c3,$31,$c0,$00   ; [$87d4] byte
    .byte $00,$0c,$7d,$c4,$70,$2c,$67,$1a   ; [$87dc] byte
    .byte $00,$00,$0c,$81,$c7,$71,$6c,$83   ; [$87e4] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$87ec] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$31,$c0   ; [$87f4] byte
    .byte $f1,$27,$1b,$00,$00,$03,$04,$c7   ; [$87fc] byte
    .byte $b1,$d7,$01,$c4,$4c,$0b,$01,$c4   ; [$8804] byte
    .byte $40,$0c,$0b,$1e,$c0,$71,$27,$16   ; [$880c] byte
    .byte $c6,$71,$5c,$58,$c6,$31,$a0,$0c   ; [$8814] byte
    .byte $0f,$12,$c5,$f1,$97,$1a,$c8,$1c   ; [$881c] byte
    .byte $67,$1a,$c8,$30,$dc,$33,$0d,$c3   ; [$8824] byte
    .byte $30,$db,$17,$32,$0c,$3b,$0f,$c3   ; [$882c] byte
    .byte $b1,$ac,$83,$0f,$c3,$b0,$fc,$3b   ; [$8834] byte
    .byte $1d,$c7,$f0,$fc,$39,$1c,$33,$0d   ; [$883c] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$8844] byte
    .byte $33,$17,$c8,$31,$5c,$7d,$c0,$f1   ; [$884c] byte
    .byte $2c,$07,$02,$c0,$70,$2c,$07,$02   ; [$8854] byte
    .byte $c0,$70,$2c,$07,$02,$c7,$5c,$43   ; [$885c] byte
    .byte $04                               ; [$8864] byte

ZENITH_BLOCKS_SCREEN_10:                    ; [$8865]
    .byte $c0,$71,$1c,$4b,$01,$c0,$b1,$0c   ; [$8865] byte
    .byte $4b,$10,$c4,$b0,$1c,$0b,$10,$c4   ; [$886d] byte
    .byte $b1,$0c,$4b,$10,$c5,$f1,$9c,$6b   ; [$8875] byte
    .byte $03,$c1,$31,$9c,$68,$30,$3c,$13   ; [$887d] byte
    .byte $19,$c6,$80,$72,$0c,$3a,$30,$fc   ; [$8885] byte
    .byte $3b,$0f,$c3,$a3,$0f,$c3,$b0,$fc   ; [$888d] byte
    .byte $3b,$0f,$5c,$33,$0d,$c3,$30,$dc   ; [$8895] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$889d] byte
    .byte $30,$dc,$33,$0d,$5c,$3b,$0f,$c3   ; [$88a5] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$88ad] byte
    .byte $0f,$c3,$b0,$fc,$77,$01,$5c,$33   ; [$88b5] byte
    .byte $10,$c4,$40,$03,$12,$c7,$f0,$dc   ; [$88bd] byte
    .byte $5c,$1c,$3b,$1a,$00,$00,$c3,$b0   ; [$88c5] byte
    .byte $f7,$16,$71,$ec,$7f,$0d,$c3,$30   ; [$88cd] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$88d5] byte
    .byte $c3,$31,$57,$1e,$c0,$f1,$10,$00   ; [$88dd] byte
    .byte $00,$c4,$9c,$0f,$02,$c7,$71,$9c   ; [$88e5] byte
    .byte $68,$00,$00,$1c,$67,$17,$32,$0c   ; [$88ed] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$88f5] byte
    .byte $b0,$fc,$3b,$0f,$c3,$ac,$81,$1c   ; [$88fd] byte
    .byte $57,$1f,$c3,$30,$dc,$33,$0d,$c3   ; [$8905] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$31   ; [$890d] byte
    .byte $31,$d7,$1d,$c4,$31,$2c,$07,$02   ; [$8915] byte
    .byte $c0,$70,$2c,$07,$02,$c0,$70,$2c   ; [$891d] byte
    .byte $43,$04                           ; [$8925] byte

ZENITH_BLOCKS_SCREEN_11:                    ; [$8927]
    .byte $c0,$71,$2c,$07,$11,$30,$2c,$07   ; [$8927] byte
    .byte $12,$c4,$30,$2c,$07,$12,$c4,$30   ; [$892f] byte
    .byte $2c,$43,$02,$c5,$f1,$0c,$13,$19   ; [$8937] byte
    .byte $c6,$b1,$63,$19,$c6,$b1,$63,$19   ; [$893f] byte
    .byte $c6,$b0,$3c,$4b,$17,$31,$9c,$6b   ; [$8947] byte
    .byte $20,$c3,$a3,$0f,$c3,$a3,$0f,$c3   ; [$894f] byte
    .byte $a1,$32,$0c,$33,$0d,$c3,$30,$dc   ; [$8957] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$895f] byte
    .byte $30,$dc,$33,$16,$5c,$3b,$0f,$c3   ; [$8967] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$896f] byte
    .byte $0f,$c3,$b0,$fc,$3b,$1a,$75,$fc   ; [$8977] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$897f] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$8987] byte
    .byte $0d,$5c,$77,$1f,$c3,$b0,$fc,$3b   ; [$898f] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$8997] byte
    .byte $fc,$3b,$0f,$5c,$5b,$20,$c3,$30   ; [$899f] byte
    .byte $1c,$0b,$1f,$c3,$30,$1c,$0b,$1f   ; [$89a7] byte
    .byte $c3,$30,$dc,$07,$02,$c5,$9c,$49   ; [$89af] byte
    .byte $c3,$b1,$63,$20,$c3,$b1,$63,$20   ; [$89b7] byte
    .byte $c3,$b0,$fc,$58,$c6,$b1,$9c,$69   ; [$89bf] byte
    .byte $c3,$31,$a1,$c3,$31,$a1,$c3,$30   ; [$89c7] byte
    .byte $dc,$68,$c3,$b0,$fc,$3b,$0f,$c3   ; [$89cf] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$89d7] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$30   ; [$89df] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$89e7] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$89ef] byte
    .byte $33,$0d,$c4,$4c,$4b,$01,$c0,$b0   ; [$89f7] byte
    .byte $1c,$0b,$01,$c0,$b0,$1c,$0b,$01   ; [$89ff] byte
    .byte $c0,$b0,$1c,$0b,$01               ; [$8a07] byte

ZENITH_BLOCKS_SCREEN_12:                    ; [$8a0c]
    .byte $c0,$70,$2c,$07,$02,$c0,$70,$2c   ; [$8a0c] byte
    .byte $43,$12,$c4,$31,$2c,$43,$02,$c7   ; [$8a14] byte
    .byte $74,$cc,$0f,$04,$c0,$f0,$4c,$0f   ; [$8a1c] byte
    .byte $04,$c0,$f0,$4d,$17,$46,$c6,$74   ; [$8a24] byte
    .byte $5d,$1b,$16,$d7,$9c,$43,$02,$cd   ; [$8a2c] byte
    .byte $0c,$ab,$47,$c6,$4d,$0f,$44,$cd   ; [$8a34] byte
    .byte $74,$ad,$13,$35,$d2,$dc,$65,$c8   ; [$8a3c] byte
    .byte $8c,$8f,$48,$4c,$db,$2a,$cc,$b3   ; [$8a44] byte
    .byte $6c,$ab,$32,$ca,$9c,$83,$17,$cc   ; [$8a4c] byte
    .byte $57,$4c,$33,$5d,$0b,$23,$cb,$b4   ; [$8a54] byte
    .byte $2c,$8f,$30,$c8,$d5,$c8,$85,$cd   ; [$8a5c] byte
    .byte $72,$75,$cb,$d5,$5c,$07,$04,$cc   ; [$8a64] byte
    .byte $57,$32,$ca,$45,$c7,$b3,$77,$10   ; [$8a6c] byte
    .byte $c4,$b1,$0c,$13,$1e,$c8,$87,$30   ; [$8a74] byte
    .byte $cb,$72,$2c,$9c,$00,$0b,$02,$cf   ; [$8a7c] byte
    .byte $47,$3f,$cf,$4c,$a7,$34,$00,$ca   ; [$8a84] byte
    .byte $b4,$cc,$67,$17,$cf,$80,$0c,$87   ; [$8a8c] byte
    .byte $22,$d3,$b2,$2d,$37,$22,$c8,$dc   ; [$8a94] byte
    .byte $81,$c0,$b3,$7d,$07,$4e,$d0,$74   ; [$8a9c] byte
    .byte $e7,$24,$c9,$5c,$93,$25,$55,$33   ; [$8aa4] byte
    .byte $0d,$03,$22,$d0,$32,$2c,$af,$30   ; [$8aac] byte
    .byte $c8,$f2,$bc,$c3,$23,$ca,$d5,$c0   ; [$8ab4] byte
    .byte $f1,$2c,$07,$02,$c0,$70,$2c,$07   ; [$8abc] byte
    .byte $02,$c0,$70,$2c,$07,$02,$c0,$70   ; [$8ac4] byte
    .byte $2c,$43,$04                       ; [$8acc] byte

ZENITH_BLOCKS_SCREEN_13:                    ; [$8acf]
    .byte $c0,$70,$2c,$57,$01,$c4,$71,$2c   ; [$8acf] byte
    .byte $07,$02,$c0,$70,$2c,$07,$02,$c0   ; [$8ad7] byte
    .byte $70,$2c,$07,$02,$c5,$87,$03,$5c   ; [$8adf] byte
    .byte $0f,$04,$c0,$f0,$4c,$0f,$04,$c0   ; [$8ae7] byte
    .byte $f0,$4c,$0f,$04,$c6,$87,$1d,$c6   ; [$8aef] byte
    .byte $71,$a0,$d1,$f4,$5d,$1b,$4c,$d1   ; [$8af7] byte
    .byte $74,$6c,$a7,$34,$c3,$b1,$53,$17   ; [$8aff] byte
    .byte $c8,$30,$fc,$3b,$0f,$d2,$34,$3d   ; [$8b07] byte
    .byte $11,$d0,$f4,$4d,$0b,$22,$c7,$53   ; [$8b0f] byte
    .byte $16,$70,$c3,$0d,$73,$6c,$a9,$cd   ; [$8b17] byte
    .byte $b2,$ac,$85,$c5,$dc,$67,$1a,$c3   ; [$8b1f] byte
    .byte $b0,$fc,$57,$48,$cd,$74,$2c,$8f   ; [$8b27] byte
    .byte $35,$d0,$b2,$3d,$09,$5c,$83,$0d   ; [$8b2f] byte
    .byte $c3,$31,$d7,$26,$c9,$c0,$0c,$85   ; [$8b37] byte
    .byte $57,$0f,$c3,$b1,$77,$2b,$ca,$b3   ; [$8b3f] byte
    .byte $2c,$d0,$32,$ad,$09,$57,$0d,$c3   ; [$8b47] byte
    .byte $17,$2c,$d3,$f3,$fc,$b3,$4f,$cd   ; [$8b4f] byte
    .byte $f2,$3c,$87,$3d,$57,$0f,$c5,$5c   ; [$8b57] byte
    .byte $65,$cc,$33,$ec,$af,$30,$cf,$83   ; [$8b5f] byte
    .byte $1d,$71,$97,$0d,$5c,$81,$74,$1c   ; [$8b67] byte
    .byte $b1,$d0,$72,$2d,$07,$17,$32,$0c   ; [$8b6f] byte
    .byte $3b,$0f,$55,$74,$0c,$ad,$d0,$1d   ; [$8b77] byte
    .byte $01,$30,$1c,$0b,$01,$c0,$b0,$1c   ; [$8b7f] byte
    .byte $0b,$01,$c0,$b0,$1c,$0b,$01,$c0   ; [$8b87] byte
    .byte $b0,$1c,$09                       ; [$8b8f] byte

ZENITH_BLOCKS_SCREEN_14:                    ; [$8b92]
    .byte $c5,$f1,$0c,$0b,$10,$c0,$b1,$0c   ; [$8b92] byte
    .byte $5f,$01,$c0,$b0,$1c,$47,$12,$c4   ; [$8b9a] byte
    .byte $30,$2c,$43,$02,$71,$9c,$0f,$12   ; [$8ba2] byte
    .byte $c0,$f1,$27,$16,$0c,$78,$30,$3c   ; [$8baa] byte
    .byte $4b,$16,$32,$0c,$68,$07,$19,$c6   ; [$8bb2] byte
    .byte $80,$00,$1c,$3b,$0f,$c3,$30,$d7   ; [$8bba] byte
    .byte $15,$c7,$f0,$dc,$33,$0d,$c3,$30   ; [$8bc2] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$8bca] byte
    .byte $c3,$b0,$fc,$59,$c0,$71,$13,$02   ; [$8bd2] byte
    .byte $c0,$71,$13,$12,$c3,$b0,$fc,$3b   ; [$8bda] byte
    .byte $0f,$c3,$30,$dc,$69,$c5,$b4,$5d   ; [$8be2] byte
    .byte $1b,$03,$c1,$31,$93,$1d,$c3,$30   ; [$8bea] byte
    .byte $dc,$33,$0d,$c3,$b0,$fc,$39,$c9   ; [$8bf2] byte
    .byte $b4,$3d,$13,$26,$d3,$1c,$83,$17   ; [$8bfa] byte
    .byte $c0,$70,$2c,$3b,$0f,$c3,$30,$dc   ; [$8c02] byte
    .byte $33,$47,$cb,$34,$2c,$8f,$2c,$72   ; [$8c0a] byte
    .byte $0c,$3b,$16,$0c,$33,$0d,$c3,$b0   ; [$8c12] byte
    .byte $fc,$3b,$21,$cf,$80,$c8,$f0,$1c   ; [$8c1a] byte
    .byte $47,$02,$c6,$8c,$3b,$1d,$31,$f5   ; [$8c22] byte
    .byte $d4,$b5,$3c,$07,$11,$30,$4c,$67   ; [$8c2a] byte
    .byte $1d,$c3,$30,$dc,$33,$17,$29,$cc   ; [$8c32] byte
    .byte $32,$ec,$5f,$2e,$c8,$f4,$cc,$e7   ; [$8c3a] byte
    .byte $17,$c3,$b0,$fc,$39,$c0,$f0,$4c   ; [$8c42] byte
    .byte $81,$c8,$b2,$f7,$2f,$5c,$e9,$c0   ; [$8c4a] byte
    .byte $b0,$1c,$0b,$03,$c4,$40,$0c,$13   ; [$8c52] byte
    .byte $10,$c4,$b1,$0c,$47,$04           ; [$8c5a] byte

ZENITH_BLOCKS_SCREEN_15:                    ; [$8c60]
    .byte $c0,$70,$2c,$07,$11,$00,$00,$c0   ; [$8c60] byte
    .byte $8c,$57,$02,$c5,$f1,$63,$32,$cd   ; [$8c68] byte
    .byte $03,$2a,$c9,$b1,$9c,$9b,$19,$c5   ; [$8c70] byte
    .byte $b1,$77,$17,$31,$9c,$a7,$3d,$d4   ; [$8c78] byte
    .byte $b5,$3c,$f7,$23,$33,$5c,$b3,$20   ; [$8c80] byte
    .byte $c6,$95,$32,$0c,$87,$24,$cc,$33   ; [$8c88] byte
    .byte $2c,$95,$cd,$72,$71,$c3,$31,$65   ; [$8c90] byte
    .byte $17,$30,$c0,$70,$2c,$ab,$2b,$cc   ; [$8c98] byte
    .byte $b3,$4c,$a9,$c3,$b1,$a1,$1c,$b3   ; [$8ca0] byte
    .byte $2e,$c5,$cc,$ef,$2c,$cc,$32,$ec   ; [$8ca8] byte
    .byte $8d,$c3,$30,$dc,$31,$31,$57,$2f   ; [$8cb0] byte
    .byte $4c,$f1,$72,$f5,$c3,$b0,$fc,$39   ; [$8cb8] byte
    .byte $1c,$07,$12,$4c,$07,$02,$c0,$70   ; [$8cc0] byte
    .byte $2c,$07,$02,$c0,$70,$2c,$75,$1c   ; [$8cc8] byte
    .byte $0f,$11,$c1,$1c,$0f,$04,$c0,$f0   ; [$8cd0] byte
    .byte $4c,$0f,$04,$c0,$f0,$4c,$59,$1c   ; [$8cd8] byte
    .byte $07,$12,$c0,$6c,$07,$12,$c0,$71   ; [$8ce0] byte
    .byte $2c,$07,$12,$c0,$71,$1c,$09,$31   ; [$8ce8] byte
    .byte $9c,$5b,$19,$c5,$b1,$9c,$5b,$19   ; [$8cf0] byte
    .byte $c5,$b1,$9c,$5b,$19,$c5,$b1,$9c   ; [$8cf8] byte
    .byte $0f,$04,$72,$0c,$6b,$20,$c6,$b2   ; [$8d00] byte
    .byte $0c,$6b,$20,$c6,$b2,$0c,$6b,$20   ; [$8d08] byte
    .byte $c6,$b2,$0c,$6b,$39,$5c,$3b,$0f   ; [$8d10] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$8d18] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$3a       ; [$8d20] byte

ZENITH_BLOCKS_SCREEN_16:                    ; [$8d27]
    .byte $c0,$71,$2c,$07,$11,$00,$c0,$b0   ; [$8d27] byte
    .byte $1c,$44,$0c,$0b,$01,$c5,$f1,$0c   ; [$8d2f] byte
    .byte $13,$19,$00,$c5,$8c,$64,$0c,$58   ; [$8d37] byte
    .byte $71,$9c,$6b,$0e,$00,$c6,$8c,$38   ; [$8d3f] byte
    .byte $0c,$68,$72,$0c,$33,$0d,$c3,$30   ; [$8d47] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$8d4f] byte
    .byte $c3,$30,$dc,$33,$0d,$5c,$3b,$0f   ; [$8d57] byte
    .byte $c3,$b0,$fc,$07,$12,$c0,$71,$2c   ; [$8d5f] byte
    .byte $07,$12,$c0,$71,$2c,$07,$12,$c5   ; [$8d67] byte
    .byte $9c,$33,$0d,$c3,$30,$dc,$5f,$10   ; [$8d6f] byte
    .byte $c1,$31,$0c,$13,$1d,$c5,$f1,$0c   ; [$8d77] byte
    .byte $13,$10,$c6,$9c,$3b,$0f,$c3,$b0   ; [$8d7f] byte
    .byte $1c,$13,$19,$c6,$83,$03,$c1,$31   ; [$8d87] byte
    .byte $9c,$68,$c3,$30,$dc,$33,$0d,$c3   ; [$8d8f] byte
    .byte $30,$3c,$0b,$15,$c7,$f0,$dc,$32   ; [$8d97] byte
    .byte $32,$0c,$33,$0d,$c3,$b0,$fc,$3b   ; [$8d9f] byte
    .byte $0f,$c0,$70,$2c,$5d,$c7,$6c,$3b   ; [$8da7] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$ce,$70   ; [$8daf] byte
    .byte $dc,$33,$0d,$c5,$c1,$c5,$f2,$0c   ; [$8db7] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$ce   ; [$8dbf] byte
    .byte $b0,$fc,$43,$5c,$c1,$30,$3c,$11   ; [$8dc7] byte
    .byte $5c,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$8dcf] byte
    .byte $c0,$70,$2c,$07,$02,$c0,$70,$2c   ; [$8dd7] byte
    .byte $75,$70,$1c,$4b,$1d,$c0,$70,$2c   ; [$8ddf] byte
    .byte $77,$1e,$c0,$f0,$4c,$0f,$04,$c0   ; [$8de7] byte
    .byte $f0,$4c,$5d,$c0,$f0,$4c,$43,$04   ; [$8def] byte
    .byte $c0,$f0,$4c,$0f,$12               ; [$8df7] byte

ZENITH_BLOCKS_SCREEN_17:                    ; [$8dfc]
    .byte $c4,$40,$c0,$b0,$1c,$44,$0c,$0b   ; [$8dfc] byte
    .byte $01,$c4,$40,$c6,$40,$c5,$8c,$64   ; [$8e04] byte
    .byte $0c,$58,$c6,$40,$c3,$80,$c6,$8c   ; [$8e0c] byte
    .byte $83,$0e,$0c,$68,$c8,$30,$e0,$c3   ; [$8e14] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$8e1c] byte
    .byte $15,$c7,$f0,$dc,$33,$0d,$c3,$30   ; [$8e24] byte
    .byte $dc,$33,$0d,$c0,$71,$2c,$07,$12   ; [$8e2c] byte
    .byte $c0,$71,$2c,$75,$c4,$30,$2c,$7f   ; [$8e34] byte
    .byte $0f,$c3,$b0,$fc,$07,$02,$c1,$2c   ; [$8e3c] byte
    .byte $13,$10,$c1,$31,$ec,$5d,$c6,$71   ; [$8e44] byte
    .byte $6c,$83,$0d,$c3,$30,$dc,$5b,$17   ; [$8e4c] byte
    .byte $c4,$2c,$67,$1a,$0c,$59,$c8,$31   ; [$8e54] byte
    .byte $a7,$0f,$c3,$b0,$fc,$69,$c6,$8c   ; [$8e5c] byte
    .byte $83,$0d,$c3,$30,$d8,$70,$dc,$33   ; [$8e64] byte
    .byte $0d,$c3,$30,$dc,$31,$c3,$b0,$fc   ; [$8e6c] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$8e74] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$39   ; [$8e7c] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$8e84] byte
    .byte $30,$c7,$71,$fc,$33,$0d,$c3,$30   ; [$8e8c] byte
    .byte $dc,$31,$c3,$b0,$fc,$3b,$0f,$c3   ; [$8e94] byte
    .byte $b0,$fc,$3b,$15,$c5,$f2,$0c,$3b   ; [$8e9c] byte
    .byte $0f,$c3,$b0,$fc,$39,$c0,$70,$2c   ; [$8ea4] byte
    .byte $07,$02,$c0,$70,$2c,$75,$70,$1c   ; [$8eac] byte
    .byte $4b,$1d,$c0,$70,$2c,$75,$c0,$f0   ; [$8eb4] byte
    .byte $4c,$0f,$04,$c0,$f0,$4c,$59,$c0   ; [$8ebc] byte
    .byte $f0,$4c,$43,$04,$c0,$f0,$4c,$0f   ; [$8ec4] byte
    .byte $04                               ; [$8ecc] byte

ZENITH_BLOCKS_SCREEN_18:                    ; [$8ecd]
    .byte $c4,$40,$c0,$b0,$1c,$44,$00,$31   ; [$8ecd] byte
    .byte $2c,$07,$02,$c6,$40,$c5,$8c,$64   ; [$8ed5] byte
    .byte $00,$0c,$5b,$17,$c3,$80,$c6,$8c   ; [$8edd] byte
    .byte $83,$0e,$00,$c8,$30,$ec,$69,$c3   ; [$8ee5] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$8eed] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$8ef5] byte
    .byte $dc,$55,$c0,$71,$2c,$07,$12,$c0   ; [$8efd] byte
    .byte $71,$10,$00,$30,$25,$c5,$ac,$13   ; [$8f05] byte
    .byte $10,$c1,$31,$93,$1a,$c6,$71,$ac   ; [$8f0d] byte
    .byte $67,$1a,$31,$65,$c0,$71,$2c,$67   ; [$8f15] byte
    .byte $1a,$31,$fc,$3b,$0f,$c3,$b0,$fc   ; [$8f1d] byte
    .byte $3b,$0f,$c3,$a5,$31,$8c,$83,$0d   ; [$8f25] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$8f2d] byte
    .byte $33,$0d,$c3,$30,$d5,$32,$0c,$3b   ; [$8f35] byte
    .byte $0f,$c7,$71,$fc,$3b,$0f,$c3,$b0   ; [$8f3d] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$69,$1c   ; [$8f45] byte
    .byte $33,$01,$c1,$32,$0c,$33,$0d,$c3   ; [$8f4d] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$31   ; [$8f55] byte
    .byte $1c,$57,$17,$c6,$5c,$3b,$0f,$c3   ; [$8f5d] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$39   ; [$8f65] byte
    .byte $31,$d5,$c0,$70,$2c,$07,$02,$c0   ; [$8f6d] byte
    .byte $70,$2c,$07,$02,$c0,$70,$2c,$75   ; [$8f75] byte
    .byte $c0,$f0,$45,$c0,$f0,$4c,$0f,$04   ; [$8f7d] byte
    .byte $c0,$f0,$4c,$0f,$04,$c0,$f0,$4c   ; [$8f85] byte
    .byte $0f,$04                           ; [$8f8d] byte

ZENITH_BLOCKS_SCREEN_19:                    ; [$8f8f]
    .byte $c0,$70,$2c,$43,$11,$00,$30,$2c   ; [$8f8f] byte
    .byte $07,$11,$00,$c5,$f1,$6c,$64,$00   ; [$8f97] byte
    .byte $31,$63,$19,$00,$71,$9c,$3b,$0f   ; [$8f9f] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b1,$a3   ; [$8fa7] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$71,$5c   ; [$8faf] byte
    .byte $7f,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$8fb7] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$8fbf] byte
    .byte $0d,$5c,$07,$11,$00,$0c,$4b,$1d   ; [$8fc7] byte
    .byte $c4,$30,$2c,$43,$02,$5c,$5b,$19   ; [$8fcf] byte
    .byte $c6,$b1,$93,$1a,$c6,$4c,$6b,$03   ; [$8fd7] byte
    .byte $c4,$b0,$3b,$16,$5c,$67,$20,$c3   ; [$8fdf] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3a   ; [$8fe7] byte
    .byte $c6,$71,$aa,$5c,$83,$0d,$c3,$30   ; [$8fef] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$8ff7] byte
    .byte $c3,$30,$db,$17,$31,$9c,$3b,$0f   ; [$8fff] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$9007] byte
    .byte $3b,$1d,$c7,$f0,$fc,$39,$32,$0c   ; [$900f] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$9017] byte
    .byte $30,$dc,$33,$03,$c0,$ac,$31,$1c   ; [$901f] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9027] byte
    .byte $b1,$5c,$7f,$1a,$c5,$f2,$0c,$39   ; [$902f] byte
    .byte $31,$dc,$07,$02,$c0,$70,$2c,$07   ; [$9037] byte
    .byte $02,$c7,$5c,$07,$02,$c0,$f1,$2c   ; [$903f] byte
    .byte $75,$c0,$f0,$4c,$0f,$04,$c0,$f0   ; [$9047] byte
    .byte $4c,$0f,$04,$c5,$9c,$0f,$04,$c4   ; [$904f] byte
    .byte $1c,$0f,$04                       ; [$9057] byte

ZENITH_BLOCKS_SCREEN_20:                    ; [$905a]
    .byte $c4,$40,$c0,$b0,$1c,$44,$c0,$b0   ; [$905a] byte
    .byte $1c,$44,$30,$2c,$43,$02,$c6,$40   ; [$9062] byte
    .byte $c5,$8c,$64,$c5,$8c,$64,$30,$3c   ; [$906a] byte
    .byte $4b,$17,$c3,$80,$c6,$8c,$83,$0e   ; [$9072] byte
    .byte $c6,$8c,$38,$31,$a1,$c3,$31,$5c   ; [$907a] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$9082] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$31   ; [$908a] byte
    .byte $c7,$9c,$7f,$0f,$c3,$b0,$fc,$3b   ; [$9092] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$909a] byte
    .byte $fc,$39,$c0,$9c,$83,$0d,$c3,$30   ; [$90a2] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$90aa] byte
    .byte $c3,$30,$dc,$31,$17,$0f,$c3,$b0   ; [$90b2] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$15   ; [$90ba] byte
    .byte $c7,$f0,$fc,$39,$1c,$43,$12,$c8   ; [$90c2] byte
    .byte $31,$0c,$47,$12,$c8,$31,$0c,$09   ; [$90ca] byte
    .byte $c8,$30,$dc,$31,$31,$a0,$71,$a0   ; [$90d2] byte
    .byte $71,$ac,$5f,$19,$70,$fc,$39,$32   ; [$90da] byte
    .byte $0c,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$90e2] byte
    .byte $c3,$30,$d7,$20,$c3,$30,$dc,$e5   ; [$90ea] byte
    .byte $1c,$3b,$0f,$c3,$b0,$fc,$57,$1f   ; [$90f2] byte
    .byte $c3,$b0,$f5,$c7,$f0,$fc,$e9,$31   ; [$90fa] byte
    .byte $dc,$07,$02,$c0,$70,$27,$01,$c0   ; [$9102] byte
    .byte $b0,$1c,$13,$1d,$c0,$70,$2c,$75   ; [$910a] byte
    .byte $c0,$f0,$4c,$0f,$04,$c0,$f0,$47   ; [$9112] byte
    .byte $03,$c1,$31,$6c,$42,$c0,$f0,$4c   ; [$911a] byte
    .byte $0f,$04                           ; [$9122] byte

ZENITH_BLOCKS_SCREEN_21:                    ; [$9124]
    .byte $c0,$71,$2c,$07,$11,$c4,$b1,$d3   ; [$9124] byte
    .byte $1e,$c7,$4c,$43,$11,$c0,$b1,$e0   ; [$912c] byte
    .byte $d5,$31,$ec,$5b,$0b,$c5,$31,$1c   ; [$9134] byte
    .byte $13,$0b,$c0,$f1,$2c,$2f,$14,$c7   ; [$913c] byte
    .byte $b0,$b3,$55,$30,$50,$00,$00,$01   ; [$9144] byte
    .byte $d5,$30,$60,$30,$bc,$1b,$0b,$c1   ; [$914c] byte
    .byte $b0,$bc,$18,$30,$9c,$2b,$54,$b0   ; [$9154] byte
    .byte $5c,$23,$07,$c2,$30,$50,$30,$8c   ; [$915c] byte
    .byte $17,$07,$c1,$43,$55,$b0,$60,$00   ; [$9164] byte
    .byte $03,$09,$c2,$b0,$9c,$2b,$54,$b0   ; [$916c] byte
    .byte $8c,$17,$08,$c1,$f0,$50,$c1,$f0   ; [$9174] byte
    .byte $53,$08,$c1,$70,$8c,$17,$55,$b0   ; [$917c] byte
    .byte $60,$c2,$70,$ac,$18,$30,$9c,$2b   ; [$9184] byte
    .byte $06,$03,$54,$b0,$5c,$23,$05,$0c   ; [$918c] byte
    .byte $1f,$05,$03,$08,$c1,$41,$33,$97   ; [$9194] byte
    .byte $09,$c2,$b0,$63,$0b,$c1,$80,$01   ; [$919c] byte
    .byte $d5,$73,$a7,$05,$c1,$f0,$8c,$14   ; [$91a4] byte
    .byte $0c,$23,$05,$0c,$21,$30,$1c,$0b   ; [$91ac] byte
    .byte $01,$c4,$b1,$0c,$0b,$01,$c4,$b1   ; [$91b4] byte
    .byte $0c,$0b,$01,$c4,$b1,$0c,$49,$c0   ; [$91bc] byte
    .byte $f0,$4c,$5b,$03,$c4,$4c,$13,$03   ; [$91c4] byte
    .byte $c4,$4c,$13,$03,$c4,$43,$04       ; [$91cc] byte

ZENITH_BLOCKS_SCREEN_22:                    ; [$91d3]
    .byte $c4,$30,$2c,$07,$11,$c4,$b1,$0c   ; [$91d3] byte
    .byte $0b,$10,$c4,$71,$2c,$07,$11,$30   ; [$91db] byte
    .byte $2c,$77,$1e,$c2,$f1,$6c,$0f,$0b   ; [$91e3] byte
    .byte $31,$4c,$5f,$01,$70,$2c,$0f,$0b   ; [$91eb] byte
    .byte $c5,$31,$6c,$0f,$02,$c1,$43,$07   ; [$91f3] byte
    .byte $c1,$4c,$5a,$c5,$31,$7c,$2f,$06   ; [$91fb] byte
    .byte $30,$bc,$53,$16,$c1,$80,$0c,$2e   ; [$9203] byte
    .byte $c2,$f1,$6c,$18,$30,$9c,$2b,$1d   ; [$920b] byte
    .byte $c1,$4c,$23,$07,$c2,$30,$5c,$23   ; [$9213] byte
    .byte $05,$30,$8c,$17,$07,$c1,$4c,$43   ; [$921b] byte
    .byte $04,$c1,$80,$03,$1d,$c2,$b1,$dc   ; [$9223] byte
    .byte $1b,$09,$c2,$b0,$1c,$4b,$1e,$c1   ; [$922b] byte
    .byte $70,$8c,$17,$08,$c1,$f0,$53,$03   ; [$9233] byte
    .byte $c4,$70,$4c,$17,$08,$c1,$71,$6c   ; [$923b] byte
    .byte $77,$02,$c1,$80,$c2,$70,$ac,$1b   ; [$9243] byte
    .byte $0b,$c5,$b0,$bc,$18,$c7,$71,$0c   ; [$924b] byte
    .byte $13,$17,$c1,$4c,$23,$05,$00,$03   ; [$9253] byte
    .byte $08,$c0,$f1,$1c,$09,$c1,$83,$09   ; [$925b] byte
    .byte $c2,$b0,$60,$03,$01,$c4,$b1,$5c   ; [$9263] byte
    .byte $5c,$c1,$70,$7c,$14,$c1,$f0,$8c   ; [$926b] byte
    .byte $14,$c1,$f0,$5c,$23,$17,$c7,$54   ; [$9273] byte
    .byte $c4,$b1,$0c,$0b,$01,$c4,$b1,$0c   ; [$927b] byte
    .byte $0b,$01,$c4,$b1,$0c,$09,$c5,$9c   ; [$9283] byte
    .byte $59,$c4,$4c,$13,$03,$c4,$4c,$13   ; [$928b] byte
    .byte $03,$c4,$4c,$13,$03,$c4,$b5,$fc   ; [$9293] byte
    .byte $43,$04                           ; [$929b] byte

ZENITH_BLOCKS_SCREEN_23:                    ; [$929d]
    .byte $c0,$71,$10,$0c,$0b,$15,$c0,$71   ; [$929d] byte
    .byte $10,$31,$2c,$07,$02,$c5,$b1,$90   ; [$92a5] byte
    .byte $31,$ec,$59,$c5,$b1,$ec,$64,$0c   ; [$92ad] byte
    .byte $5b,$17,$c6,$b0,$e0,$31,$a1,$c6   ; [$92b5] byte
    .byte $71,$ac,$38,$0c,$69,$c3,$30,$dc   ; [$92bd] byte
    .byte $33,$0d,$c3,$30,$dc,$32,$c8,$30   ; [$92c5] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$31,$c3   ; [$92cd] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$92d5] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$92dd] byte
    .byte $fc,$39,$c3,$30,$dc,$33,$0d,$c3   ; [$92e5] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$92ed] byte
    .byte $0d,$c3,$30,$dc,$55,$c7,$71,$c3   ; [$92f5] byte
    .byte $1f,$c3,$b0,$fc,$3b,$0f,$c4,$31   ; [$92fd] byte
    .byte $1c,$0b,$01,$c4,$71,$25,$c1,$30   ; [$9305] byte
    .byte $1c,$4b,$20,$c3,$30,$dc,$33,$0d   ; [$930d] byte
    .byte $c6,$8c,$58,$c6,$71,$a7,$16,$c0   ; [$9315] byte
    .byte $6c,$65,$c3,$b0,$fc,$3b,$0f,$c3   ; [$931d] byte
    .byte $b0,$f8,$c8,$30,$f7,$19,$c5,$f1   ; [$9325] byte
    .byte $9c,$83,$0d,$c3,$30,$dc,$33,$0d   ; [$932d] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$9335] byte
    .byte $6b,$20,$72,$0c,$3b,$0f,$c3,$b0   ; [$933d] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$9345] byte
    .byte $c3,$b0,$fc,$3b,$0f,$5c,$33,$0d   ; [$934d] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$9355] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$70   ; [$935d] byte
    .byte $1c,$0b,$01,$c0,$b0,$1c,$0b,$01   ; [$9365] byte
    .byte $c0,$b0,$1c,$0b,$01,$c0,$b0,$1c   ; [$936d] byte
    .byte $0b,$01                           ; [$9375] byte

ZENITH_BLOCKS_SCREEN_24:                    ; [$9377]
    .byte $c0,$70,$2c,$57,$01,$c4,$40,$c0   ; [$9377] byte
    .byte $b1,$ec,$07,$11,$31,$2c,$07,$02   ; [$937f] byte
    .byte $c5,$f1,$67,$16,$c7,$b1,$9c,$68   ; [$9387] byte
    .byte $c5,$b1,$9c,$5b,$19,$c6,$8c,$0f   ; [$938f] byte
    .byte $04,$71,$97,$19,$c6,$b2,$0c,$38   ; [$9397] byte
    .byte $b2,$0c,$6b,$20,$c3,$88,$72,$0c   ; [$939f] byte
    .byte $6b,$20,$c3,$30,$dc,$33,$0d,$c3   ; [$93a7] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$93af] byte
    .byte $0d,$5c,$3b,$0f,$c3,$b0,$fc,$3b   ; [$93b7] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$93bf] byte
    .byte $fc,$3b,$0f,$c5,$9c,$33,$0d,$c3   ; [$93c7] byte
    .byte $30,$dc,$33,$0d,$c3,$31,$5c,$7c   ; [$93cf] byte
    .byte $c3,$30,$dc,$33,$0d,$c0,$71,$2c   ; [$93d7] byte
    .byte $6c,$00,$c7,$5c,$77,$10,$c4,$71   ; [$93df] byte
    .byte $2c,$07,$02,$c1,$31,$90,$00,$c5   ; [$93e7] byte
    .byte $9c,$5b,$19,$0c,$5f,$16,$c6,$b0   ; [$93ef] byte
    .byte $e0,$00,$c6,$9c,$67,$20,$c3,$b0   ; [$93f7] byte
    .byte $fc,$0f,$12,$c3,$30,$dc,$33,$0d   ; [$93ff] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$2c,$83   ; [$9407] byte
    .byte $0d,$c3,$30,$dc,$68,$c3,$b0,$fc   ; [$940f] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9417] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$941f] byte
    .byte $0f,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$9427] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$942f] byte
    .byte $c3,$30,$dc,$33,$0d,$c0,$b0,$1c   ; [$9437] byte
    .byte $0b,$01,$c0,$b0,$1c,$0b,$01,$c0   ; [$943f] byte
    .byte $b0,$1c,$0b,$01,$c0,$b0,$1c,$0b   ; [$9447] byte
    .byte $01                               ; [$944f] byte

ZENITH_BLOCKS_SCREEN_25:                    ; [$9450]
    .byte $c0,$70,$2c,$43,$11,$30,$2c,$43   ; [$9450] byte
    .byte $11,$c0,$b1,$5c,$07,$11,$31,$2c   ; [$9458] byte
    .byte $07,$02,$c0,$f0,$4c,$64,$30,$3c   ; [$9460] byte
    .byte $4b,$19,$c5,$9c,$5b,$19,$c4,$1c   ; [$9468] byte
    .byte $0f,$04,$c6,$8c,$38,$31,$a3,$0e   ; [$9470] byte
    .byte $c6,$9c,$67,$20,$c6,$80,$c3,$30   ; [$9478] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$9480] byte
    .byte $c3,$2c,$83,$0d,$c3,$30,$dc,$33   ; [$9488] byte
    .byte $0d,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$9490] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$9498] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$30,$dc   ; [$94a0] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$94a8] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$94b0] byte
    .byte $0d,$c7,$71,$ec,$43,$11,$c4,$b0   ; [$94b8] byte
    .byte $1c,$0b,$1f,$c3,$b0,$fc,$3b,$0f   ; [$94c0] byte
    .byte $c4,$31,$1c,$4b,$10,$c0,$f1,$2c   ; [$94c8] byte
    .byte $64,$30,$3c,$13,$20,$c3,$31,$ec   ; [$94d0] byte
    .byte $7f,$0d,$71,$2c,$64,$c6,$8c,$83   ; [$94d8] byte
    .byte $0f,$c3,$b1,$a1,$c3,$9c,$83,$0f   ; [$94e0] byte
    .byte $c6,$8c,$38,$c3,$30,$dc,$33,$0d   ; [$94e8] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$31,$a7   ; [$94f0] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$b0,$fc   ; [$94f8] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9500] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$57   ; [$9508] byte
    .byte $1f,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$9510] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$9518] byte
    .byte $c3,$31,$d7,$1d,$c0,$b0,$1c,$0b   ; [$9520] byte
    .byte $01,$c0,$b0,$1c,$0b,$01,$c0,$b0   ; [$9528] byte
    .byte $1c,$0b,$01,$c0,$b1,$77,$17       ; [$9530] byte

ZENITH_BLOCKS_SCREEN_26:                    ; [$9537]
    .byte $c0,$71,$10,$30,$2c,$57,$01,$c4   ; [$9537] byte
    .byte $4c,$0b,$1e,$c0,$71,$13,$02,$c5   ; [$953f] byte
    .byte $b1,$90,$31,$67,$16,$c6,$4c,$0f   ; [$9547] byte
    .byte $11,$c1,$31,$93,$16,$c6,$b2,$0c   ; [$954f] byte
    .byte $38,$c6,$87,$19,$c3,$b1,$a0,$30   ; [$9557] byte
    .byte $e3,$1a,$c3,$30,$dc,$33,$0d,$c3   ; [$955f] byte
    .byte $30,$db,$20,$c3,$30,$dc,$33,$0d   ; [$9567] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$b0,$fc   ; [$956f] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9577] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$957f] byte
    .byte $0f,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$9587] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$958f] byte
    .byte $c3,$30,$dc,$33,$0d,$c4,$b1,$0c   ; [$9597] byte
    .byte $47,$12,$c4,$31,$1c,$4b,$10,$c4   ; [$959f] byte
    .byte $71,$2c,$43,$11,$c4,$b1,$0c,$47   ; [$95a7] byte
    .byte $12,$c6,$83,$10,$b1,$9c,$68,$00   ; [$95af] byte
    .byte $0b,$02,$c3,$b0,$fc,$3a,$32,$0c   ; [$95b7] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$95bf] byte
    .byte $b0,$fc,$3b,$1d,$c3,$30,$dc,$33   ; [$95c7] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$95cf] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$17   ; [$95d7] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$95df] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$95e7] byte
    .byte $b0,$fc,$39,$c7,$72,$0c,$33,$0d   ; [$95ef] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$95f7] byte
    .byte $33,$0d,$c3,$30,$dc,$31,$30,$1c   ; [$95ff] byte
    .byte $0b,$01,$c0,$b0,$1c,$0b,$01,$c0   ; [$9607] byte
    .byte $b0,$1c,$0b,$01,$c0,$b0,$1c,$09   ; [$960f] byte

ZENITH_BLOCKS_SCREEN_27:                    ; [$9617]
    .byte $c0,$71,$1c,$4b,$01,$c4,$70,$2c   ; [$9617] byte
    .byte $43,$12,$c0,$71,$1c,$0b,$10,$c4   ; [$961f] byte
    .byte $70,$2c,$07,$11,$c5,$b1,$93,$16   ; [$9627] byte
    .byte $c5,$71,$6c,$64,$c5,$b1,$5c,$5b   ; [$962f] byte
    .byte $19,$31,$63,$19,$c6,$b2,$0c,$3b   ; [$9637] byte
    .byte $1a,$71,$9c,$83,$0e,$c6,$9c,$67   ; [$963f] byte
    .byte $20,$c3,$b1,$a3,$20,$c3,$30,$dc   ; [$9647] byte
    .byte $33,$0d,$b2,$0c,$33,$0d,$c3,$2c   ; [$964f] byte
    .byte $83,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$9657] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$965f] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$9667] byte
    .byte $fc,$3b,$0f,$c3,$30,$dc,$33,$0d   ; [$966f] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$9677] byte
    .byte $33,$0d,$c3,$30,$dc,$57,$1f,$c7   ; [$967f] byte
    .byte $71,$0c,$47,$02,$c7,$f0,$fc,$07   ; [$9687] byte
    .byte $02,$c7,$f0,$fc,$07,$02,$c7,$f0   ; [$968f] byte
    .byte $f7,$1d,$c0,$f1,$13,$04,$c8,$30   ; [$9697] byte
    .byte $dc,$0f,$04,$c8,$30,$dc,$0f,$04   ; [$969f] byte
    .byte $c8,$30,$d7,$17,$b1,$9c,$68,$70   ; [$96a7] byte
    .byte $fc,$68,$70,$fc,$68,$70,$f5,$32   ; [$96af] byte
    .byte $0c,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$96b7] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$96bf] byte
    .byte $69,$1c,$3b,$0f,$c3,$b0,$fc,$3b   ; [$96c7] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$96cf] byte
    .byte $fc,$39,$1c,$57,$1f,$c3,$30,$dc   ; [$96d7] byte
    .byte $33,$0d,$c3,$30,$dc,$33,$0d,$c3   ; [$96df] byte
    .byte $30,$dc,$31,$31,$d7,$1d,$c4,$30   ; [$96e7] byte
    .byte $2c,$07,$12,$c7,$71,$c0,$0c,$79   ; [$96ef] byte

ZENITH_BLOCKS_SCREEN_28:                    ; [$96f7]
    .byte $c4,$70,$2c,$7b,$01,$c4,$43,$12   ; [$96f7] byte
    .byte $c4,$31,$10,$c0,$b1,$ec,$07,$11   ; [$96ff] byte
    .byte $c6,$71,$6c,$57,$16,$c6,$40,$00   ; [$9707] byte
    .byte $c0,$f1,$1c,$13,$10,$c3,$b1,$a7   ; [$970f] byte
    .byte $19,$c3,$80,$00,$c6,$8c,$64,$c3   ; [$9717] byte
    .byte $30,$db,$20,$c3,$30,$dc,$33,$0d   ; [$971f] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$9727] byte
    .byte $33,$0d,$c3,$b0,$fc,$3b,$0f,$c3   ; [$972f] byte
    .byte $b0,$fc,$3b,$0f,$c3,$b0,$fc,$3b   ; [$9737] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$30   ; [$973f] byte
    .byte $dc,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$9747] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$974f] byte
    .byte $33,$1f,$c0,$71,$1c,$4b,$1f,$c3   ; [$9757] byte
    .byte $b0,$1c,$4b,$1e,$c4,$30,$2c,$07   ; [$975f] byte
    .byte $12,$c7,$b1,$0c,$09,$c5,$f1,$93   ; [$9767] byte
    .byte $0d,$c3,$31,$6c,$64,$31,$63,$19   ; [$976f] byte
    .byte $0c,$5b,$20,$72,$0c,$3b,$0f,$c3   ; [$9777] byte
    .byte $b1,$ac,$83,$0f,$c3,$b1,$a3,$20   ; [$977f] byte
    .byte $c3,$b0,$fc,$69,$5c,$33,$0d,$c3   ; [$9787] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$33   ; [$978f] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$5c,$3b   ; [$9797] byte
    .byte $0f,$c3,$b0,$fc,$3b,$0f,$c3,$b0   ; [$979f] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$97a7] byte
    .byte $5c,$33,$0d,$c3,$30,$dc,$33,$0d   ; [$97af] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$97b7] byte
    .byte $33,$0d,$71,$ec,$43,$11,$31,$2c   ; [$97bf] byte
    .byte $43,$11,$31,$2c,$43,$11,$31,$23   ; [$97c7] byte
    .byte $01                               ; [$97cf] byte

ZENITH_BLOCKS_SCREEN_29:                    ; [$97d0]
    .byte $c4,$4c,$0b,$01,$c4,$4c,$0b,$15   ; [$97d0] byte
    .byte $c0,$71,$13,$02,$c0,$71,$13,$02   ; [$97d8] byte
    .byte $c4,$b1,$9c,$58,$c6,$4c,$59,$c5   ; [$97e0] byte
    .byte $b1,$93,$16,$31,$93,$16,$c6,$80   ; [$97e8] byte
    .byte $c3,$8c,$69,$c6,$72,$0c,$3b,$1a   ; [$97f0] byte
    .byte $30,$e3,$1a,$c3,$30,$dc,$33,$0d   ; [$97f8] byte
    .byte $c3,$30,$dc,$32,$c8,$30,$dc,$33   ; [$9800] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$b0   ; [$9808] byte
    .byte $fc,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$9810] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$9818] byte
    .byte $3b,$0f,$c3,$30,$dc,$33,$0d,$c3   ; [$9820] byte
    .byte $31,$fc,$33,$0d,$c3,$30,$dc,$33   ; [$9828] byte
    .byte $0d,$c5,$71,$fc,$33,$0d,$c3,$b0   ; [$9830] byte
    .byte $fc,$3b,$0f,$c3,$b0,$1c,$47,$12   ; [$9838] byte
    .byte $c4,$30,$2c,$07,$12,$70,$2c,$7b   ; [$9840] byte
    .byte $1d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$9848] byte
    .byte $3c,$4b,$19,$31,$63,$19,$70,$3c   ; [$9850] byte
    .byte $47,$04,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9858] byte
    .byte $b1,$9c,$6b,$20,$c3,$b1,$a3,$20   ; [$9860] byte
    .byte $71,$9c,$6b,$1d,$c3,$30,$dc,$33   ; [$9868] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$9870] byte
    .byte $dc,$33,$0d,$c6,$b2,$0c,$33,$17   ; [$9878] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$9880] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9888] byte
    .byte $b0,$fc,$39,$c3,$30,$dc,$33,$0d   ; [$9890] byte
    .byte $c3,$30,$dc,$33,$0d,$c3,$30,$dc   ; [$9898] byte
    .byte $33,$0d,$c3,$30,$dc,$31,$c4,$b1   ; [$98a0] byte
    .byte $0c,$44,$c4,$b1,$0c,$44,$c4,$b1   ; [$98a8] byte
    .byte $0c,$44,$c4,$b1,$0c,$47,$04       ; [$98b0] byte

ZENITH_BLOCKS_SCREEN_30:                    ; [$98b7]
    .byte $c0,$71,$10,$00,$00,$30,$2c,$57   ; [$98b7] byte
    .byte $1d,$c5,$f1,$ec,$64,$00,$03,$10   ; [$98bf] byte
    .byte $70,$47,$17,$31,$9c,$3b,$1a,$c3   ; [$98c7] byte
    .byte $b1,$ac,$3b,$1a,$c3,$87,$1a,$05   ; [$98cf] byte
    .byte $32,$0c,$33,$0d,$c3,$30,$dc,$33   ; [$98d7] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$98df] byte
    .byte $d5,$1c,$57,$1f,$c3,$b0,$fc,$3b   ; [$98e7] byte
    .byte $0f,$c3,$b4,$85,$c3,$b0,$f5,$c0   ; [$98ef] byte
    .byte $f0,$27,$01,$c4,$b1,$dc,$7f,$0d   ; [$98f7] byte
    .byte $c7,$74,$5d,$1b,$01,$c0,$b1,$f5   ; [$98ff] byte
    .byte $c0,$70,$47,$16,$c4,$30,$4c,$66   ; [$9907] byte
    .byte $c5,$b4,$3d,$13,$03,$c1,$32,$0c   ; [$990f] byte
    .byte $69,$31,$97,$19,$5c,$d7,$27,$d2   ; [$9917] byte
    .byte $f3,$6c,$ab,$19,$c6,$9c,$31,$32   ; [$991f] byte
    .byte $07,$20,$ca,$72,$ac,$cb,$34,$ca   ; [$9927] byte
    .byte $b4,$2c,$8f,$4c,$c3,$30,$fc,$39   ; [$992f] byte
    .byte $1c,$69,$d0,$b2,$3c,$c3,$2d,$c8   ; [$9937] byte
    .byte $d5,$70,$dc,$31,$1c,$33,$0d,$57   ; [$993f] byte
    .byte $2e,$55,$70,$fc,$39,$1c,$3b,$0f   ; [$9947] byte
    .byte $c8,$57,$2f,$72,$17,$47,$70,$dc   ; [$994f] byte
    .byte $31,$31,$0c,$0b,$01,$c0,$b0,$1c   ; [$9957] byte
    .byte $0b,$01,$c0,$b0,$1c,$0b,$01,$c0   ; [$995f] byte
    .byte $b0,$1c,$49                       ; [$9967] byte

ZENITH_BLOCKS_SCREEN_31:                    ; [$996a]
    .byte $c0,$70,$2c,$57,$1d,$c7,$b0,$1c   ; [$996a] byte
    .byte $47,$02,$c0,$70,$2c,$43,$11,$30   ; [$9972] byte
    .byte $2c,$43,$02,$c5,$f1,$67,$03,$c4   ; [$997a] byte
    .byte $b1,$6c,$67,$16,$0c,$66,$70,$4c   ; [$9982] byte
    .byte $67,$17,$31,$97,$19,$c6,$8c,$3b   ; [$998a] byte
    .byte $1a,$0c,$3b,$1a,$0c,$39,$32,$0c   ; [$9992] byte
    .byte $6b,$20,$c3,$30,$dc,$33,$0d,$c3   ; [$999a] byte
    .byte $30,$dc,$33,$0d,$c3,$30,$dc,$31   ; [$99a2] byte
    .byte $1c,$3b,$0f,$c3,$b0,$fc,$3b,$0f   ; [$99aa] byte
    .byte $c3,$b0,$fc,$3b,$0f,$c3,$b0,$fc   ; [$99b2] byte
    .byte $39,$1c,$33,$0d,$c3,$30,$dc,$57   ; [$99ba] byte
    .byte $1f,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$99c2] byte
    .byte $dc,$31,$c0,$f0,$2c,$7f,$01,$c4   ; [$99ca] byte
    .byte $b1,$d7,$1d,$c4,$30,$2c,$7f,$01   ; [$99d2] byte
    .byte $c4,$b0,$1c,$47,$04,$c0,$71,$2c   ; [$99da] byte
    .byte $83,$16,$c4,$30,$47,$03,$c4,$b1   ; [$99e2] byte
    .byte $6c,$83,$03,$c4,$70,$4c,$43,$02   ; [$99ea] byte
    .byte $c5,$f1,$97,$1a,$07,$19,$c6,$87   ; [$99f2] byte
    .byte $1a,$ca,$73,$4c,$ab,$17,$32,$0c   ; [$99fa] byte
    .byte $33,$0d,$c3,$30,$db,$20,$c3,$30   ; [$9a02] byte
    .byte $dc,$33,$0d,$c8,$73,$1c,$8d,$1c   ; [$9a0a] byte
    .byte $3b,$0f,$c3,$b0,$fc,$3b,$0f,$c3   ; [$9a12] byte
    .byte $b0,$fc,$3b,$0f,$72,$e5,$1c,$33   ; [$9a1a] byte
    .byte $0d,$c3,$30,$dc,$33,$0d,$c3,$30   ; [$9a22] byte
    .byte $dc,$33,$0d,$72,$f5,$31,$0c,$0b   ; [$9a2a] byte
    .byte $01,$c0,$b0,$1c,$0b,$01,$c0,$b0   ; [$9a32] byte
    .byte $1c,$0b,$01,$c0,$b0,$1c,$09       ; [$9a3a] byte

BUILDINGS_BLOCKS:                           ; [$9a41]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_00 ; BUILDINGS_BLOCKS_SCREEN_00
                                              ; [$PRG2::9a41]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_01 ; BUILDINGS_BLOCKS_SCREEN_01
                                              ; [$PRG2::9a43]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_02 ; BUILDINGS_BLOCKS_SCREEN_02
                                              ; [$PRG2::9a45]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_03 ; BUILDINGS_BLOCKS_SCREEN_03
                                              ; [$PRG2::9a47]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_04 ; BUILDINGS_BLOCKS_SCREEN_04
                                              ; [$PRG2::9a49]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_05 ; BUILDINGS_BLOCKS_SCREEN_05
                                              ; [$PRG2::9a4b]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_06 ; BUILDINGS_BLOCKS_SCREEN_06
                                              ; [$PRG2::9a4d]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_07 ; BUILDINGS_BLOCKS_SCREEN_07
                                              ; [$PRG2::9a4f]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_08 ; BUILDINGS_BLOCKS_SCREEN_08
                                              ; [$PRG2::9a51]
    bank_offset_16 BUILDINGS_BLOCKS_SCREEN_09 ; BUILDINGS_BLOCKS_SCREEN_09
                                              ; [$PRG2::9a53]

;
; XREFS:
;     BUILDINGS_BLOCKS [$PRG2::9a41]
;
BUILDINGS_BLOCKS_SCREEN_00:                 ; [$9a55]
    .byte $c1,$70,$4c,$17,$04,$c1,$70,$4c   ; [$9a55] byte
    .byte $17,$04,$c1,$70,$4c,$17,$04,$c1   ; [$9a5d] byte
    .byte $70,$4c,$17,$04,$2a,$aa,$aa,$aa   ; [$9a65] byte
    .byte $2a,$aa,$aa,$aa,$c1,$c0,$00,$00   ; [$9a6d] byte
    .byte $00,$c0,$f1,$5c,$3b,$0f,$c6,$31   ; [$9a75] byte
    .byte $bc,$3f,$10,$c6,$31,$bc,$3f,$10   ; [$9a7d] byte
    .byte $c0,$30,$f0,$c0,$71,$6c,$33,$0a   ; [$9a85] byte
    .byte $c6,$71,$ac,$37,$06,$c6,$71,$ac   ; [$9a8d] byte
    .byte $73,$01,$c3,$70,$a0,$71,$77,$09   ; [$9a95] byte
    .byte $c7,$70,$9c,$77,$01,$c2,$f0,$9c   ; [$9a9d] byte
    .byte $75,$c2,$f0,$9c,$77,$09,$71,$5c   ; [$9aa5] byte
    .byte $4b,$0a,$01,$c3,$70,$a1,$c3,$70   ; [$9aad] byte
    .byte $a0,$5c,$4f,$0b,$c7,$70,$9c,$75   ; [$9ab5] byte
    .byte $c2,$f0,$9c,$75,$c2,$f0,$9c,$77   ; [$9abd] byte
    .byte $2f,$50,$30,$dc,$29,$c3,$70,$a1   ; [$9ac5] byte
    .byte $c3,$70,$a3,$2e,$c0,$90,$0c,$2f   ; [$9acd] byte
    .byte $02,$c2,$f0,$93,$02,$c2,$f0,$9c   ; [$9ad5] byte
    .byte $77,$2f,$c7,$80,$00,$00,$00,$c2   ; [$9add] byte
    .byte $00,$00,$00,$00                   ; [$9ae5] byte

BUILDINGS_BLOCKS_SCREEN_01:                 ; [$9ae9]
    .byte $c1,$70,$4c,$17,$04,$c1,$70,$4c   ; [$9ae9] byte
    .byte $17,$04,$c1,$70,$4c,$17,$04,$c1   ; [$9af1] byte
    .byte $70,$4c,$17,$04,$2a,$aa,$aa,$aa   ; [$9af9] byte
    .byte $2a,$aa,$aa,$aa,$c1,$c0,$00,$00   ; [$9b01] byte
    .byte $00,$c0,$f0,$0c,$ac,$00,$00,$00   ; [$9b09] byte
    .byte $c0,$72,$6c,$b0,$32,$2c,$b3,$22   ; [$9b11] byte
    .byte $cb,$32,$2c,$ab,$22,$ca,$80,$72   ; [$9b19] byte
    .byte $7c,$a9,$32,$37,$23,$72,$37,$23   ; [$9b21] byte
    .byte $40,$72,$8c,$b0,$32,$47,$24,$ca   ; [$9b29] byte
    .byte $b2,$47,$24,$72,$c4,$72,$0c,$87   ; [$9b31] byte
    .byte $2a,$ca,$f2,$a7,$2a,$00,$17,$32   ; [$9b39] byte
    .byte $71,$6c,$a7,$2d,$80,$00,$01,$c0   ; [$9b41] byte
    .byte $b1,$7c,$54,$32,$d4,$00,$01,$c7   ; [$9b49] byte
    .byte $80,$00,$00,$00,$c2,$00,$00,$00   ; [$9b51] byte
    .byte $00                               ; [$9b59] byte

BUILDINGS_BLOCKS_SCREEN_02:                 ; [$9b5a]
    .byte $c1,$70,$4c,$17,$04,$c1,$70,$4c   ; [$9b5a] byte
    .byte $17,$04,$c1,$70,$4c,$17,$04,$c1   ; [$9b62] byte
    .byte $70,$4c,$17,$04,$2a,$aa,$aa,$aa   ; [$9b6a] byte
    .byte $2a,$aa,$aa,$aa,$c1,$c0,$00,$00   ; [$9b72] byte
    .byte $00,$c0,$cc,$3b,$0f,$00,$0c,$43   ; [$9b7a] byte
    .byte $0f,$c4,$30,$f0,$c0,$4c,$33,$30   ; [$9b82] byte
    .byte $c2,$43,$0b,$c7,$4c,$07,$0b,$c1   ; [$9b8a] byte
    .byte $b0,$bc,$74,$45,$73,$15,$45,$c0   ; [$9b92] byte
    .byte $54,$70,$2c,$87,$09,$a1,$45,$54   ; [$9b9a] byte
    .byte $71,$5c,$5b,$30,$a5,$45,$57,$32   ; [$9ba2] byte
    .byte $5c,$7f,$31,$01,$45,$57,$33,$c5   ; [$9baa] byte
    .byte $43,$14,$c7,$40,$0c,$09,$c0,$95   ; [$9bb2] byte
    .byte $c7,$80,$00,$00,$00,$c2,$00,$00   ; [$9bba] byte
    .byte $00,$00                           ; [$9bc2] byte

BUILDINGS_BLOCKS_SCREEN_03:                 ; [$9bc4]
    .byte $d0,$80,$00,$00,$00,$d1,$c0,$00   ; [$9bc4] byte
    .byte $00,$00,$00,$00,$00,$00,$d1,$80   ; [$9bcc] byte
    .byte $00,$00,$00,$d0,$f5,$7d,$14,$00   ; [$9bd4] byte
    .byte $00,$00,$b5,$4d,$63,$54,$d1,$34   ; [$9bdc] byte
    .byte $8d,$10,$0d,$23,$44,$d2,$0d,$13   ; [$9be4] byte
    .byte $48,$d0,$d5,$4d,$4b,$48,$d4,$b4   ; [$9bec] byte
    .byte $8d,$49,$d4,$b4,$40,$d1,$97,$48   ; [$9bf4] byte
    .byte $74,$8d,$4f,$5f,$d4,$dd,$4f,$48   ; [$9bfc] byte
    .byte $d4,$d0,$d0,$f4,$5d,$5b,$4a,$d6   ; [$9c04] byte
    .byte $b4,$bd,$33,$5e,$d4,$74,$4d,$2f   ; [$9c0c] byte
    .byte $4c,$d3,$75,$17,$90,$d1,$97,$49   ; [$9c14] byte
    .byte $d6,$75,$bd,$3b,$4f,$d4,$13,$4e   ; [$9c1c] byte
    .byte $d3,$f5,$05,$d0,$80,$00,$00,$00   ; [$9c24] byte
    .byte $d1,$c0,$00,$00,$00,$00,$00,$00   ; [$9c2c] byte
    .byte $00                               ; [$9c34] byte

BUILDINGS_BLOCKS_SCREEN_04:                 ; [$9c35]
    .byte $d8,$c0,$00,$00,$00,$00,$00,$00   ; [$9c35] byte
    .byte $00,$00,$00,$00,$00,$34,$50,$00   ; [$9c3d] byte
    .byte $00,$01,$36,$cd,$a7,$68,$00,$00   ; [$9c45] byte
    .byte $01,$36,$1d,$9f,$65,$37,$1d,$97   ; [$9c4d] byte
    .byte $71,$d9,$77,$1d,$97,$6b,$db,$b6   ; [$9c55] byte
    .byte $51,$17,$6b,$d9,$b6,$c7,$6f,$76   ; [$9c5d] byte
    .byte $67,$70,$11,$17,$65,$36,$d7,$6e   ; [$9c65] byte
    .byte $da,$f6,$fb,$6c,$da,$d1,$37,$4d   ; [$9c6d] byte
    .byte $d4,$dc,$f7,$67,$70,$0d,$97,$70   ; [$9c75] byte
    .byte $13,$78,$54,$74,$5d,$90,$00,$03   ; [$9c7d] byte
    .byte $91,$d0,$80,$00,$00,$00,$d1,$c0   ; [$9c85] byte
    .byte $00,$00,$00,$00,$00,$00,$00       ; [$9c8d] byte

BUILDINGS_BLOCKS_SCREEN_05:                 ; [$9c94]
    .byte $d8,$c0,$00,$00,$00,$00,$00,$00   ; [$9c94] byte
    .byte $00,$d8,$00,$00,$00,$00,$d1,$80   ; [$9c9c] byte
    .byte $00,$00,$00,$dd,$37,$3d,$d7,$45   ; [$9ca4] byte
    .byte $00,$00,$03,$74,$17,$61,$d9,$00   ; [$9cac] byte
    .byte $00,$01,$17,$54,$e2,$78,$ad,$23   ; [$9cb4] byte
    .byte $8b,$d4,$b4,$8d,$4b,$48,$d4,$b4   ; [$9cbc] byte
    .byte $8d,$11,$17,$56,$e2,$38,$43,$8c   ; [$9cc4] byte
    .byte $e2,$78,$ad,$10,$09,$17,$59,$d6   ; [$9ccc] byte
    .byte $b8,$5e,$1f,$44,$34,$87,$48,$74   ; [$9cd4] byte
    .byte $83,$72,$55,$d6,$f4,$9e,$1b,$64   ; [$9cdc] byte
    .byte $00,$0e,$44,$d0,$80,$00,$00,$00   ; [$9ce4] byte
    .byte $d1,$c0,$00,$00,$00,$00,$00,$00   ; [$9cec] byte
    .byte $00                               ; [$9cf4] byte

BUILDINGS_BLOCKS_SCREEN_06:                 ; [$9cf5]
    .byte $d1,$00,$00,$00,$00,$d8,$00,$00   ; [$9cf5] byte
    .byte $00,$00,$d1,$80,$00,$00,$00,$00   ; [$9cfd] byte
    .byte $00,$00,$00,$d0,$80,$00,$00,$00   ; [$9d05] byte
    .byte $dd,$37,$3e,$4b,$8d,$0d,$17,$8d   ; [$9d0d] byte
    .byte $00,$03,$74,$1d,$5f,$64,$0e,$5b   ; [$9d15] byte
    .byte $64,$0e,$6b,$64,$e6,$b6,$41,$1d   ; [$9d1d] byte
    .byte $87,$95,$d2,$35,$e7,$44,$d2,$39   ; [$9d25] byte
    .byte $bd,$a7,$48,$da,$79,$cd,$21,$1d   ; [$9d2d] byte
    .byte $ff,$4f,$e6,$f9,$ee,$4f,$9f,$e6   ; [$9d35] byte
    .byte $34,$ce,$67,$51,$b4,$47,$72,$53   ; [$9d3d] byte
    .byte $78,$e7,$5d,$b9,$e5,$f4,$ed,$3f   ; [$9d45] byte
    .byte $50,$d1,$03,$90,$d8,$00,$00,$00   ; [$9d4d] byte
    .byte $00,$d0,$80,$00,$00,$00,$d2,$00   ; [$9d55] byte
    .byte $00,$00,$00                       ; [$9d5d] byte

BUILDINGS_BLOCKS_SCREEN_07:                 ; [$9d60]
    .byte $d8,$c0,$00,$00,$00,$00,$00,$00   ; [$9d60] byte
    .byte $00,$d8,$00,$00,$00,$00,$dc,$f4   ; [$9d68] byte
    .byte $50,$00,$00,$03,$74,$77,$ed,$a7   ; [$9d70] byte
    .byte $68,$df,$b6,$80,$37,$e3,$68,$01   ; [$9d78] byte
    .byte $76,$1d,$9f,$7b,$de,$b8,$0d,$c3   ; [$9d80] byte
    .byte $7a,$0d,$c3,$80,$d5,$36,$7d,$95   ; [$9d88] byte
    .byte $77,$a7,$83,$dc,$37,$ce,$0c,$e0   ; [$9d90] byte
    .byte $85,$55,$5d,$ff,$7a,$e0,$37,$dd   ; [$9d98] byte
    .byte $c3,$61,$dc,$38,$15,$d9,$41,$77   ; [$9da0] byte
    .byte $4d,$d7,$73,$dd,$b6,$54,$01,$43   ; [$9da8] byte
    .byte $78,$55,$d1,$50,$00,$03,$94,$d0   ; [$9db0] byte
    .byte $80,$00,$00,$00,$d1,$c0,$00,$00   ; [$9db8] byte
    .byte $00,$00,$00,$00,$00               ; [$9dc0] byte

BUILDINGS_BLOCKS_SCREEN_08:                 ; [$9dc5]
    .byte $f2,$00,$00,$00,$00,$3c,$40,$00   ; [$9dc5] byte
    .byte $00,$00,$7c,$57,$c5,$7c,$57,$c5   ; [$9dcd] byte
    .byte $7c,$57,$c5,$7c,$57,$c5,$40,$00   ; [$9dd5] byte
    .byte $00,$00,$3c,$7f,$27,$c7,$f2,$7c   ; [$9ddd] byte
    .byte $70,$f4,$8f,$1c,$3c,$9f,$1d,$1f   ; [$9de5] byte
    .byte $2b,$cc,$f2,$bc,$cf,$18,$f4,$cf   ; [$9ded] byte
    .byte $18,$3c,$af,$31,$15,$5f,$53,$d5   ; [$9df5] byte
    .byte $47,$d4,$f5,$55,$15,$5f,$5b,$d7   ; [$9dfd] byte
    .byte $47,$d6,$f5,$d5,$1f,$2d,$5f,$18   ; [$9e05] byte
    .byte $7c,$60,$17,$d8,$43,$ce,$f3,$fc   ; [$9e0d] byte
    .byte $ef,$47,$cd,$01,$3d,$07,$d9,$f0   ; [$9e15] byte
    .byte $40,$00,$00,$00,$f0,$80,$00,$00   ; [$9e1d] byte
    .byte $00,$f0,$c0,$00,$00,$00           ; [$9e25] byte

BUILDINGS_BLOCKS_SCREEN_09:                 ; [$9e2b]
    .byte $f8,$00,$00,$00,$00,$f2,$40,$00   ; [$9e2b] byte
    .byte $00,$00,$f6,$80,$00,$00,$00,$3d   ; [$9e33] byte
    .byte $c7,$dc,$7d,$c7,$dc,$7d,$c7,$dc   ; [$9e3b] byte
    .byte $7d,$c4,$f1,$7c,$7f,$27,$c7,$f2   ; [$9e43] byte
    .byte $7c,$7f,$27,$c7,$00,$3c,$9f,$1d   ; [$9e4b] byte
    .byte $1f,$6f,$cc,$f6,$fc,$cf,$6f,$cc   ; [$9e53] byte
    .byte $f7,$7c,$cf,$1b,$dd,$f3,$3d,$bf   ; [$9e5b] byte
    .byte $31,$f1,$55,$55,$f7,$bd,$f7,$de   ; [$9e63] byte
    .byte $f7,$d5,$15,$55,$f1,$80,$15,$f1   ; [$9e6b] byte
    .byte $5f,$2d,$55,$40,$17,$d8,$83,$ce   ; [$9e73] byte
    .byte $f3,$fc,$ef,$3d,$f3,$5f,$34,$3c   ; [$9e7b] byte
    .byte $f7,$d9,$f0,$40,$00,$00,$00,$f0   ; [$9e83] byte
    .byte $80,$00,$00,$00,$f0,$c0,$00,$00   ; [$9e8b] byte
    .byte $00                               ; [$9e93] byte

DARTMOOR_BLOCKS:                            ; [$9e94]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_00 ; DARTMOOR_BLOCKS_SCREEN_00
                                             ; [$PRG2::9e94]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_01 ; DARTMOOR_BLOCKS_SCREEN_01
                                             ; [$PRG2::9e96]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_02 ; DARTMOOR_BLOCKS_SCREEN_02
                                             ; [$PRG2::9e98]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_03 ; DARTMOOR_BLOCKS_SCREEN_03
                                             ; [$PRG2::9e9a]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_04 ; DARTMOOR_BLOCKS_SCREEN_04
                                             ; [$PRG2::9e9c]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_05 ; DARTMOOR_BLOCKS_SCREEN_05
                                             ; [$PRG2::9e9e]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_06 ; DARTMOOR_BLOCKS_SCREEN_06
                                             ; [$PRG2::9ea0]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_07 ; DARTMOOR_BLOCKS_SCREEN_07
                                             ; [$PRG2::9ea2]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_08 ; DARTMOOR_BLOCKS_SCREEN_08
                                             ; [$PRG2::9ea4]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_09 ; DARTMOOR_BLOCKS_SCREEN_09
                                             ; [$PRG2::9ea6]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_10 ; DARTMOOR_BLOCKS_SCREEN_10
                                             ; [$PRG2::9ea8]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_11 ; DARTMOOR_BLOCKS_SCREEN_11
                                             ; [$PRG2::9eaa]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_12 ; DARTMOOR_BLOCKS_SCREEN_12
                                             ; [$PRG2::9eac]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_13 ; DARTMOOR_BLOCKS_SCREEN_13
                                             ; [$PRG2::9eae]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_14 ; DARTMOOR_BLOCKS_SCREEN_14
                                             ; [$PRG2::9eb0]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_15 ; DARTMOOR_BLOCKS_SCREEN_15
                                             ; [$PRG2::9eb2]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_16 ; DARTMOOR_BLOCKS_SCREEN_16
                                             ; [$PRG2::9eb4]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_17 ; DARTMOOR_BLOCKS_SCREEN_17
                                             ; [$PRG2::9eb6]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_18 ; DARTMOOR_BLOCKS_SCREEN_18
                                             ; [$PRG2::9eb8]
    bank_offset_16 DARTMOOR_BLOCKS_SCREEN_19 ; DARTMOOR_BLOCKS_SCREEN_19
                                             ; [$PRG2::9eba]

;
; XREFS:
;     DARTMOOR_BLOCKS [$PRG2::9e94]
;
DARTMOOR_BLOCKS_SCREEN_00:                  ; [$9ebc]
    .byte $c0,$71,$9c,$3c,$0c,$0b,$01,$c0   ; [$9ebc] byte
    .byte $b0,$1c,$67,$0f,$0c,$9f,$02,$c3   ; [$9ec4] byte
    .byte $71,$ec,$cb,$2a,$ca,$cc,$6b,$0d   ; [$9ecc] byte
    .byte $31,$ac,$e3,$29,$ca,$b2,$bc,$7b   ; [$9ed4] byte
    .byte $0d,$c6,$f3,$8c,$d7,$23,$cc,$32   ; [$9edc] byte
    .byte $2c,$e6,$33,$8c,$c7,$21,$c8,$f3   ; [$9ee4] byte
    .byte $0c,$e5,$c7,$33,$1c,$29,$70,$ba   ; [$9eec] byte
    .byte $ca,$cc,$bb,$0a,$5c,$89,$c6,$dc   ; [$9ef4] byte
    .byte $85,$72,$23,$0b,$c8,$83,$21,$5c   ; [$9efc] byte
    .byte $1d,$c7,$1c,$29,$72,$4c,$97,$2d   ; [$9f04] byte
    .byte $c9,$32,$57,$0a,$5c,$8b,$1a,$c6   ; [$9f0c] byte
    .byte $dc,$85,$73,$2c,$ab,$08,$cc,$b2   ; [$9f14] byte
    .byte $a7,$21,$57,$05,$c7,$1c,$29,$4c   ; [$9f1c] byte
    .byte $8f,$09,$cc,$32,$3c,$b7,$0a,$57   ; [$9f24] byte
    .byte $06,$c6,$dc,$85,$47,$08,$5c,$8b   ; [$9f2c] byte
    .byte $21,$5c,$1f,$1f,$c7,$1c,$29,$47   ; [$9f34] byte
    .byte $09,$5c,$b7,$0a,$5c,$8b,$0e,$c6   ; [$9f3c] byte
    .byte $dc,$85,$47,$08,$5c,$8b,$21,$55   ; [$9f44] byte
    .byte $c7,$1c,$29,$47,$09,$5c,$b7,$0a   ; [$9f4c] byte
    .byte $57,$0c,$c0,$f2,$70,$00,$00,$c6   ; [$9f54] byte
    .byte $4c,$9f,$04                       ; [$9f5c] byte

DARTMOOR_BLOCKS_SCREEN_01:                  ; [$9f5f]
    .byte $c0,$71,$9c,$3c,$32,$70,$03,$0f   ; [$9f5f] byte
    .byte $0c,$67,$02,$c7,$31,$ec,$cb,$2a   ; [$9f67] byte
    .byte $ca,$f2,$9c,$ab,$2b,$ca,$72,$ac   ; [$9f6f] byte
    .byte $af,$29,$ca,$b2,$6c,$83,$0c,$c6   ; [$9f77] byte
    .byte $f2,$bc,$d7,$23,$cc,$32,$1c,$8f   ; [$9f7f] byte
    .byte $30,$c8,$72,$3c,$c3,$21,$c8,$f2   ; [$9f87] byte
    .byte $b3,$0d,$73,$0c,$85,$55,$55,$73   ; [$9f8f] byte
    .byte $0c,$8b,$0e,$55,$55,$55,$57,$1c   ; [$9f97] byte
    .byte $c5,$95,$55,$55,$57,$1b,$c1,$72   ; [$9f9f] byte
    .byte $25,$55,$55,$57,$1c,$c1,$95,$55   ; [$9fa7] byte
    .byte $55,$5c,$77,$1b,$c0,$72,$7c,$3c   ; [$9faf] byte
    .byte $00,$03,$20,$cb,$1c,$70,$c3,$b3   ; [$9fb7] byte
    .byte $8c,$a7,$2a,$ca,$f2,$9c,$ab,$2b   ; [$9fbf] byte
    .byte $ca,$72,$ac,$af,$29,$ca,$b1,$dc   ; [$9fc7] byte
    .byte $6c,$c3,$33,$1c,$87,$23,$cc,$32   ; [$9fcf] byte
    .byte $1c,$8f,$30,$c8,$72,$3c,$c3,$21   ; [$9fd7] byte
    .byte $c8,$f0,$cc,$73,$0e,$c7,$1c,$57   ; [$9fdf] byte
    .byte $2c,$55,$55,$c7,$71,$ac,$37,$0c   ; [$9fe7] byte
    .byte $c0,$f2,$07,$03,$c4,$40,$00,$c1   ; [$9fef] byte
    .byte $31,$0c,$10                       ; [$9ff7] byte

DARTMOOR_BLOCKS_SCREEN_02:                  ; [$9ffa]
    .byte $c0,$71,$9c,$3c,$03,$20,$cc,$32   ; [$9ffa] byte
    .byte $3c,$c3,$21,$c9,$b1,$83,$02,$c0   ; [$a002] byte
    .byte $f2,$0c,$cb,$2a,$ca,$f2,$9c,$ab   ; [$a00a] byte
    .byte $2b,$cd,$55,$ca,$b2,$b3,$1a,$ca   ; [$a012] byte
    .byte $b2,$bc,$d7,$23,$cc,$32,$1c,$8f   ; [$a01a] byte
    .byte $30,$c8,$55,$c8,$f3,$0c,$8b,$29   ; [$a022] byte
    .byte $c8,$f3,$0c,$85,$55,$55,$57,$21   ; [$a02a] byte
    .byte $cb,$15,$55,$55,$55,$c0,$72,$0c   ; [$a032] byte
    .byte $dd,$55,$71,$5c,$bd,$55,$c6,$f3   ; [$a03a] byte
    .byte $8c,$d5,$55,$5c,$7b,$26,$c8,$31   ; [$a042] byte
    .byte $ec,$a1,$c7,$33,$1c,$85,$55,$5c   ; [$a04a] byte
    .byte $e3,$29,$ca,$b2,$b1,$c6,$95,$55   ; [$a052] byte
    .byte $72,$ac,$af,$21,$c8,$f3,$0c,$89   ; [$a05a] byte
    .byte $c7,$d5,$55,$72,$3c,$c1,$55,$c7   ; [$a062] byte
    .byte $15,$55,$55,$55,$55,$5c,$57,$1f   ; [$a06a] byte
    .byte $cd,$dc,$7f,$37,$c7,$f2,$f5,$c0   ; [$a072] byte
    .byte $f1,$8c,$3c,$c6,$71,$27,$0c,$cc   ; [$a07a] byte
    .byte $1c,$73,$30,$c7,$33,$1c,$07,$18   ; [$a082] byte

DARTMOOR_BLOCKS_SCREEN_03:                  ; [$a08a]
    .byte $c0,$72,$0c,$c3,$23,$c9,$b1,$13   ; [$a08a] byte
    .byte $02,$c0,$71,$13,$20,$ce,$33,$0c   ; [$a092] byte
    .byte $9b,$02,$c6,$b3,$8c,$d5,$ce,$b2   ; [$a09a] byte
    .byte $9c,$ab,$1a,$33,$8c,$af,$29,$ca   ; [$a0a2] byte
    .byte $9c,$e7,$1a,$ca,$b2,$bc,$85,$cc   ; [$a0aa] byte
    .byte $32,$1c,$8f,$38,$ca,$72,$ac,$c3   ; [$a0b2] byte
    .byte $21,$c8,$dc,$8b,$29,$c8,$f3,$05   ; [$a0ba] byte
    .byte $57,$30,$c8,$72,$35,$57,$21,$55   ; [$a0c2] byte
    .byte $55,$55,$55,$55,$55,$55,$55,$c9   ; [$a0ca] byte
    .byte $b2,$0c,$dd,$c9,$b0,$fc,$9f,$02   ; [$a0d2] byte
    .byte $c0,$72,$7c,$3f,$20,$cb,$1c,$9b   ; [$a0da] byte
    .byte $27,$ca,$b2,$bc,$d5,$ce,$b2,$9c   ; [$a0e2] byte
    .byte $ab,$1a,$33,$8c,$af,$29,$ca,$9c   ; [$a0ea] byte
    .byte $e7,$29,$c8,$f3,$0c,$85,$cc,$32   ; [$a0f2] byte
    .byte $1c,$8f,$3a,$ca,$72,$ac,$c3,$21   ; [$a0fa] byte
    .byte $c8,$dc,$8b,$21,$55,$57,$30,$c8   ; [$a102] byte
    .byte $72,$35,$55,$55,$55,$55,$55,$55   ; [$a10a] byte
    .byte $55,$55,$55,$c6,$72,$7c,$3f,$27   ; [$a112] byte
    .byte $c3,$f2,$73,$0f,$c9,$cc,$3f,$27   ; [$a11a] byte
    .byte $30,$fc,$9c                       ; [$a122] byte

DARTMOOR_BLOCKS_SCREEN_04:                  ; [$a125]
    .byte $c0,$72,$0c,$9b,$0f,$30,$4c,$e3   ; [$a125] byte
    .byte $30,$c8,$72,$3c,$c3,$03,$c6,$70   ; [$a12d] byte
    .byte $fc,$63,$11,$c6,$b3,$8c,$a7,$2a   ; [$a135] byte
    .byte $ca,$f2,$9c,$a9,$57,$29,$ca,$b2   ; [$a13d] byte
    .byte $b3,$29,$ca,$b2,$bc,$87,$23,$cc   ; [$a145] byte
    .byte $32,$1c,$8d,$57,$21,$c8,$f3,$0c   ; [$a14d] byte
    .byte $8b,$21,$c8,$f3,$05,$55,$55,$55   ; [$a155] byte
    .byte $55,$55,$55,$55,$55,$55,$55,$55   ; [$a15d] byte
    .byte $c3,$f0,$2c,$dd,$55,$55,$57,$01   ; [$a165] byte
    .byte $ca,$b0,$3c,$4b,$2c,$55,$c7,$b2   ; [$a16d] byte
    .byte $c5,$5c,$43,$04,$c8,$f2,$bc,$a7   ; [$a175] byte
    .byte $2a,$55,$ca,$72,$a5,$5c,$e7,$29   ; [$a17d] byte
    .byte $73,$0c,$87,$23,$55,$c8,$72,$35   ; [$a185] byte
    .byte $5c,$8b,$21,$55,$55,$55,$55,$55   ; [$a18d] byte
    .byte $72,$6c,$83,$2f,$5c,$9b,$20,$cb   ; [$a195] byte
    .byte $15,$c6,$72,$7c,$3f,$27,$c4,$72   ; [$a19d] byte
    .byte $0c,$e3,$2b,$5c,$ae,$c9,$f0,$fc   ; [$a1a5] byte
    .byte $9f,$11                           ; [$a1ad] byte

DARTMOOR_BLOCKS_SCREEN_05:                  ; [$a1af]
    .byte $c9,$f1,$13,$20,$cc,$72,$1c,$8f   ; [$a1af] byte
    .byte $30,$c8,$72,$6c,$47,$02,$c0,$71   ; [$a1b7] byte
    .byte $1c,$4b,$10,$c9,$b2,$0c,$cb,$2a   ; [$a1bf] byte
    .byte $ca,$d5,$72,$ac,$af,$1a,$33,$8c   ; [$a1c7] byte
    .byte $af,$29,$ca,$b2,$bc,$d7,$23,$cc   ; [$a1cf] byte
    .byte $15,$72,$3c,$c3,$29,$ca,$b2,$bc   ; [$a1d7] byte
    .byte $8b,$21,$c8,$f3,$0c,$85,$55,$57   ; [$a1df] byte
    .byte $21,$c8,$f3,$05,$55,$55,$55,$55   ; [$a1e7] byte
    .byte $55,$55,$55,$55,$c9,$b0,$fc,$83   ; [$a1ef] byte
    .byte $2c,$55,$55,$5c,$9b,$02,$ca,$b2   ; [$a1f7] byte
    .byte $bc,$a7,$2a,$55,$55,$5c,$e7,$0d   ; [$a1ff] byte
    .byte $c8,$f3,$0c,$87,$23,$55,$57,$15   ; [$a207] byte
    .byte $cb,$1c,$8b,$0e,$55,$55,$55,$c7   ; [$a20f] byte
    .byte $f2,$f5,$55,$55,$55,$c3,$b3,$15   ; [$a217] byte
    .byte $55,$55,$55,$71,$5c,$a3,$0c,$c6   ; [$a21f] byte
    .byte $70,$f0,$c6,$31,$9c,$3c,$c6,$31   ; [$a227] byte
    .byte $9c,$3f,$18,$c1,$1c,$67,$04       ; [$a22f] byte

DARTMOOR_BLOCKS_SCREEN_06:                  ; [$a236]
    .byte $c9,$b0,$2c,$57,$01,$c8,$30,$1c   ; [$a236] byte
    .byte $3c,$c9,$f0,$fc,$9f,$0f,$32,$7c   ; [$a23e] byte
    .byte $3c,$ca,$b1,$a7,$1a,$ce,$31,$6c   ; [$a246] byte
    .byte $e3,$2b,$ca,$72,$ac,$af,$29,$ca   ; [$a24e] byte
    .byte $b2,$b3,$29,$c8,$f3,$a7,$38,$ca   ; [$a256] byte
    .byte $f2,$9c,$ab,$30,$c8,$72,$3c,$c3   ; [$a25e] byte
    .byte $21,$c8,$f3,$0c,$8b,$21,$73,$0c   ; [$a266] byte
    .byte $a7,$2a,$cc,$32,$1c,$8d,$55,$55   ; [$a26e] byte
    .byte $5c,$87,$23,$55,$55,$55,$55,$55   ; [$a276] byte
    .byte $55,$5c,$57,$37,$5c,$7b,$2c,$72   ; [$a27e] byte
    .byte $6c,$9c,$00,$32,$07,$30,$5c,$a7   ; [$a286] byte
    .byte $2a,$72,$9c,$ab,$2b,$ca,$72,$ac   ; [$a28e] byte
    .byte $af,$29,$ca,$b2,$b7,$1f,$5c,$87   ; [$a296] byte
    .byte $23,$71,$fc,$b3,$30,$c8,$72,$3c   ; [$a29e] byte
    .byte $c3,$21,$c8,$f3,$07,$0e,$55,$70   ; [$a2a6] byte
    .byte $ec,$e1,$55,$5c,$e5,$c7,$f2,$f5   ; [$a2ae] byte
    .byte $55,$55,$5c,$89,$33,$15,$5c,$55   ; [$a2b6] byte
    .byte $55,$57,$0c,$c0,$f1,$8c,$47,$19   ; [$a2be] byte
    .byte $c3,$f0,$47,$26,$c3,$f2,$7c,$13   ; [$a2c6] byte
    .byte $26,$c3,$cc,$63,$04               ; [$a2ce] byte

DARTMOOR_BLOCKS_SCREEN_07:                  ; [$a2d3]
    .byte $c3,$f0,$2c,$07,$18,$c6,$70,$2c   ; [$a2d3] byte
    .byte $57,$1f,$cc,$32,$3c,$3b,$30,$c3   ; [$a2db] byte
    .byte $b3,$1c,$07,$02,$ca,$b1,$a3,$38   ; [$a2e3] byte
    .byte $ca,$f1,$a7,$1a,$5c,$69,$c6,$9c   ; [$a2eb] byte
    .byte $6b,$0d,$c8,$f2,$bc,$a7,$2a,$cc   ; [$a2f3] byte
    .byte $32,$94,$5c,$af,$35,$ca,$b2,$bc   ; [$a2fb] byte
    .byte $e7,$0e,$73,$0c,$87,$23,$72,$17   ; [$a303] byte
    .byte $38,$cd,$5c,$c3,$21,$c8,$f3,$0c   ; [$a30b] byte
    .byte $89,$55,$5c,$ab,$2b,$c8,$55,$55   ; [$a313] byte
    .byte $57,$26,$c8,$33,$7c,$8f,$30,$55   ; [$a31b] byte
    .byte $55,$57,$2a,$ca,$f3,$55,$55,$55   ; [$a323] byte
    .byte $c7,$f2,$f7,$23,$cc,$32,$1c,$07   ; [$a32b] byte
    .byte $0f,$0c,$0b,$37,$5c,$55,$c5,$f3   ; [$a333] byte
    .byte $15,$5c,$33,$38,$ca,$72,$ac,$0f   ; [$a33b] byte
    .byte $18,$c6,$72,$05,$55,$5c,$69,$c8   ; [$a343] byte
    .byte $72,$3c,$af,$29,$ca,$b2,$b5,$55   ; [$a34b] byte
    .byte $5c,$ab,$2b,$5c,$c3,$21,$c8,$f3   ; [$a353] byte
    .byte $0c,$e5,$55,$5c,$8f,$30,$5c,$57   ; [$a35b] byte
    .byte $37,$5c,$8b,$0c,$c0,$f1,$9c,$3f   ; [$a363] byte
    .byte $27,$30,$f3,$27,$c3,$f2,$07,$26   ; [$a36b] byte
    .byte $c3,$cc,$63,$04                   ; [$a373] byte

DARTMOOR_BLOCKS_SCREEN_08:                  ; [$a377]
    .byte $c0,$71,$9c,$3c,$c9,$f2,$0c,$e3   ; [$a377] byte
    .byte $30,$c8,$72,$3c,$c3,$10,$c4,$43   ; [$a37f] byte
    .byte $02,$c3,$6c,$44,$c8,$33,$2c,$a9   ; [$a387] byte
    .byte $57,$29,$c9,$9c,$0b,$17,$c3,$b1   ; [$a38f] byte
    .byte $ac,$cb,$2a,$ca,$f3,$5c,$8d,$57   ; [$a397] byte
    .byte $21,$ca,$b2,$bc,$68,$72,$bc,$d7   ; [$a39f] byte
    .byte $23,$cc,$32,$15,$55,$c8,$f3,$0c   ; [$a3a7] byte
    .byte $e7,$29,$73,$0c,$85,$55,$55,$5c   ; [$a3af] byte
    .byte $8b,$21,$55,$55,$55,$5c,$b5,$c0   ; [$a3b7] byte
    .byte $f1,$1c,$4b,$2c,$57,$1e,$c7,$f1   ; [$a3bf] byte
    .byte $ec,$bd,$5c,$9b,$02,$c7,$f2,$bc   ; [$a3c7] byte
    .byte $a7,$2a,$57,$2b,$c6,$b3,$8c,$ad   ; [$a3cf] byte
    .byte $5c,$e7,$0d,$c3,$b3,$0c,$87,$23   ; [$a3d7] byte
    .byte $57,$30,$ca,$72,$ac,$c1,$5c,$8b   ; [$a3df] byte
    .byte $0e,$15,$55,$c8,$72,$35,$55,$30   ; [$a3e7] byte
    .byte $55,$55,$55,$71,$fc,$a1,$30,$65   ; [$a3ef] byte
    .byte $cb,$97,$2e,$5c,$bb,$15,$cb,$30   ; [$a3f7] byte
    .byte $ec,$c5,$c0,$f1,$9c,$3c,$00,$c9   ; [$a3ff] byte
    .byte $f1,$1c,$09,$c9,$b0,$45           ; [$a407] byte

DARTMOOR_BLOCKS_SCREEN_09:                  ; [$a40d]
    .byte $c0,$71,$8c,$67,$02,$c0,$71,$8c   ; [$a40d] byte
    .byte $67,$02,$c0,$71,$8c,$67,$02,$c0   ; [$a415] byte
    .byte $71,$5c,$9b,$02,$c3,$73,$8c,$a7   ; [$a41d] byte
    .byte $1a,$33,$2c,$ab,$1a,$33,$8c,$af   ; [$a425] byte
    .byte $1a,$15,$c6,$9c,$87,$2a,$ca,$f3   ; [$a42d] byte
    .byte $5c,$8f,$3a,$ca,$72,$ac,$c3,$29   ; [$a435] byte
    .byte $ca,$9c,$e3,$0d,$ca,$b2,$b7,$23   ; [$a43d] byte
    .byte $cc,$32,$17,$30,$c8,$72,$37,$21   ; [$a445] byte
    .byte $c8,$f3,$ac,$af,$0e,$c8,$f2,$e5   ; [$a44d] byte
    .byte $55,$55,$73,$0c,$89,$71,$5c,$dd   ; [$a455] byte
    .byte $55,$55,$57,$0c,$c7,$dc,$7b,$2c   ; [$a45d] byte
    .byte $72,$6c,$3c,$00,$0c,$9f,$04,$c3   ; [$a465] byte
    .byte $9c,$cb,$2a,$72,$9c,$ab,$2b,$ca   ; [$a46d] byte
    .byte $72,$ac,$af,$29,$ca,$b2,$b0,$5c   ; [$a475] byte
    .byte $c3,$23,$72,$1c,$8f,$30,$c8,$72   ; [$a47d] byte
    .byte $3c,$c3,$21,$c8,$f3,$0c,$88,$73   ; [$a485] byte
    .byte $8c,$d5,$55,$55,$54,$73,$1c,$85   ; [$a48d] byte
    .byte $55,$55,$57,$1f,$55,$55,$55,$71   ; [$a495] byte
    .byte $5c,$a3,$0e,$c0,$f1,$2c,$dd,$c4   ; [$a49d] byte
    .byte $31,$8c,$4b,$2f,$71,$0c,$60,$c8   ; [$a4a5] byte
    .byte $1c,$9b,$04                       ; [$a4ad] byte

DARTMOOR_BLOCKS_SCREEN_10:                  ; [$a4b0]
    .byte $c0,$71,$2c,$07,$19,$c3,$f2,$0c   ; [$a4b0] byte
    .byte $57,$26,$c3,$c0,$03,$02,$c3,$71   ; [$a4b8] byte
    .byte $0c,$13,$38,$ca,$f2,$97,$38,$ca   ; [$a4c0] byte
    .byte $72,$ac,$ac,$03,$1a,$c5,$f3,$8c   ; [$a4c8] byte
    .byte $a7,$2a,$cc,$32,$1c,$ab,$2b,$c8   ; [$a4d0] byte
    .byte $72,$3c,$c3,$15,$ca,$32,$23,$29   ; [$a4d8] byte
    .byte $9c,$87,$23,$5c,$8f,$30,$55,$c7   ; [$a4e0] byte
    .byte $e7,$21,$ca,$b2,$b5,$55,$55,$c3   ; [$a4e8] byte
    .byte $b3,$15,$c8,$f3,$05,$70,$1c,$67   ; [$a4f0] byte
    .byte $18,$c6,$4c,$81,$55,$55,$71,$7c   ; [$a4f8] byte
    .byte $e0,$ca,$72,$ac,$ad,$c3,$55,$71   ; [$a500] byte
    .byte $5c,$dd,$71,$f7,$30,$c8,$72,$3c   ; [$a508] byte
    .byte $c1,$c0,$f1,$9c,$3c,$c7,$dc,$c1   ; [$a510] byte
    .byte $70,$d5,$55,$ce,$0c,$9b,$02,$c3   ; [$a518] byte
    .byte $b3,$8c,$d7,$01,$c3,$f0,$45,$57   ; [$a520] byte
    .byte $29,$ca,$b2,$b3,$0d,$73,$1c,$87   ; [$a528] byte
    .byte $0c,$ce,$32,$9c,$a9,$57,$21,$c8   ; [$a530] byte
    .byte $f3,$0c,$8b,$0e,$15,$c5,$72,$1c   ; [$a538] byte
    .byte $8d,$55,$55,$c0,$f1,$8c,$67,$04   ; [$a540] byte
    .byte $71,$0c,$44,$00,$03,$04           ; [$a548] byte

DARTMOOR_BLOCKS_SCREEN_11:                  ; [$a54e]
    .byte $c0,$71,$13,$19,$c0,$b1,$fc,$e3   ; [$a54e] byte
    .byte $30,$c8,$72,$3c,$57,$01,$c3,$c3   ; [$a556] byte
    .byte $02,$c6,$b1,$ec,$cb,$2a,$c6,$b1   ; [$a55e] byte
    .byte $65,$57,$1a,$c7,$b2,$b3,$1a,$ca   ; [$a566] byte
    .byte $b2,$bc,$d7,$23,$ce,$b2,$9c,$a9   ; [$a56e] byte
    .byte $57,$32,$ca,$b3,$0c,$8b,$29,$c8   ; [$a576] byte
    .byte $f3,$0c,$85,$cc,$32,$1c,$8d,$5c   ; [$a57e] byte
    .byte $eb,$35,$c8,$d7,$21,$55,$55,$5c   ; [$a586] byte
    .byte $c3,$21,$55,$55,$55,$55,$55,$5c   ; [$a58e] byte
    .byte $9b,$27,$c8,$33,$75,$55,$c9,$b0   ; [$a596] byte
    .byte $f0,$c7,$f2,$fc,$a7,$2a,$ca,$f3   ; [$a59e] byte
    .byte $5c,$77,$2f,$71,$fc,$bd,$ca,$b2   ; [$a5a6] byte
    .byte $bc,$99,$c3,$b3,$1c,$87,$23,$cc   ; [$a5ae] byte
    .byte $32,$1c,$5f,$31,$70,$ec,$c5,$c8   ; [$a5b6] byte
    .byte $f3,$0c,$e7,$29,$55,$70,$1c,$11   ; [$a5be] byte
    .byte $70,$3c,$7f,$37,$5c,$8b,$21,$55   ; [$a5c6] byte
    .byte $70,$dc,$e3,$2b,$72,$ac,$37,$30   ; [$a5ce] byte
    .byte $55,$c3,$15,$c7,$97,$30,$72,$3c   ; [$a5d6] byte
    .byte $3b,$1e,$cb,$15,$c0,$f1,$9c,$3c   ; [$a5de] byte
    .byte $c6,$30,$45,$5c,$0f,$0f,$00       ; [$a5e6] byte

DARTMOOR_BLOCKS_SCREEN_12:                  ; [$a5ed]
    .byte $c0,$71,$8c,$47,$19,$c0,$b3,$0c   ; [$a5ed] byte
    .byte $8f,$30,$c8,$72,$3c,$c3,$01,$c6   ; [$a5f5] byte
    .byte $31,$1c,$67,$02,$c6,$b3,$8c,$a7   ; [$a5fd] byte
    .byte $2a,$c6,$95,$57,$1a,$ce,$32,$b3   ; [$a605] byte
    .byte $1a,$ca,$b2,$bc,$87,$23,$ca,$f3   ; [$a60d] byte
    .byte $55,$57,$29,$ca,$b3,$0c,$8b,$29   ; [$a615] byte
    .byte $c8,$f3,$05,$cc,$32,$15,$57,$21   ; [$a61d] byte
    .byte $c8,$d7,$21,$55,$55,$55,$c9,$b2   ; [$a625] byte
    .byte $0c,$a1,$55,$55,$55,$ca,$b2,$b1   ; [$a62d] byte
    .byte $c3,$f0,$2c,$dd,$55,$55,$c8,$f3   ; [$a635] byte
    .byte $0c,$89,$70,$4c,$c1,$55,$55,$55   ; [$a63d] byte
    .byte $ca,$b2,$bc,$d5,$55,$55,$55,$c8   ; [$a645] byte
    .byte $f3,$0c,$85,$55,$55,$55,$55,$55   ; [$a64d] byte
    .byte $55,$55,$55,$71,$0c,$0b,$2f,$70   ; [$a655] byte
    .byte $1c,$4b,$37,$55,$c6,$4c,$47,$02   ; [$a65d] byte
    .byte $cb,$f2,$9c,$37,$31,$70,$dc,$af   ; [$a665] byte
    .byte $35,$c0,$71,$1c,$60               ; [$a66d] byte

DARTMOOR_BLOCKS_SCREEN_13:                  ; [$a672]
    .byte $c0,$71,$9c,$3c,$c9,$f0,$2c,$9b   ; [$a672] byte
    .byte $20,$c0,$71,$2c,$7b,$15,$ce,$33   ; [$a67a] byte
    .byte $0c,$8b,$0e,$c6,$b3,$8c,$a7,$2a   ; [$a682] byte
    .byte $ca,$f0,$3c,$63,$19,$c1,$31,$50   ; [$a68a] byte
    .byte $55,$ca,$b2,$bc,$87,$23,$cc,$31   ; [$a692] byte
    .byte $53,$38,$ca,$53,$32,$ca,$95,$c8   ; [$a69a] byte
    .byte $f3,$05,$5c,$e3,$2b,$c8,$5c,$e3   ; [$a6a2] byte
    .byte $35,$c8,$d7,$0c,$55,$72,$9c,$ab   ; [$a6aa] byte
    .byte $30,$72,$ac,$af,$21,$5c,$9b,$04   ; [$a6b2] byte
    .byte $55,$72,$1c,$8d,$72,$3c,$c1,$5c   ; [$a6ba] byte
    .byte $e7,$29,$55,$55,$55,$5c,$8b,$21   ; [$a6c2] byte
    .byte $55,$c7,$f3,$77,$1f,$cd,$d5,$55   ; [$a6ca] byte
    .byte $55,$c3,$33,$07,$0d,$cc,$15,$57   ; [$a6d2] byte
    .byte $1f,$57,$01,$c1,$17,$03,$c0,$b2   ; [$a6da] byte
    .byte $c5,$57,$0d,$57,$1b,$ca,$f3,$57   ; [$a6e2] byte
    .byte $3a,$c7,$33,$85,$57,$1b,$5c,$79   ; [$a6ea] byte
    .byte $cc,$32,$17,$30,$c6,$f1,$fc,$bd   ; [$a6f2] byte
    .byte $57,$0d,$c3,$cc,$9f,$04,$71,$fc   ; [$a6fa] byte
    .byte $b1,$c7,$30,$3c,$67,$0f,$0c,$63   ; [$a702] byte
    .byte $04                               ; [$a70a] byte

DARTMOOR_BLOCKS_SCREEN_14:                  ; [$a70b]
    .byte $c0,$72,$0c,$c3,$23,$ca,$f2,$9c   ; [$a70b] byte
    .byte $ab,$2b,$c8,$72,$6c,$3c,$c0,$b1   ; [$a713] byte
    .byte $5c,$07,$02,$c3,$73,$8c,$d5,$cc   ; [$a71b] byte
    .byte $32,$1c,$8f,$30,$72,$ac,$af,$1f   ; [$a723] byte
    .byte $c6,$9c,$30,$33,$1c,$85,$55,$72   ; [$a72b] byte
    .byte $3c,$c3,$0c,$ce,$1c,$5c,$c7,$15   ; [$a733] byte
    .byte $55,$55,$73,$a7,$1a,$15,$c0,$71   ; [$a73b] byte
    .byte $9c,$44,$c6,$70,$2c,$43,$04,$73   ; [$a743] byte
    .byte $0c,$6b,$2b,$ca,$b2,$b5,$c3,$71   ; [$a74b] byte
    .byte $ec,$e3,$2b,$ca,$71,$ac,$e3,$29   ; [$a753] byte
    .byte $ca,$9c,$e7,$35,$c8,$f3,$05,$c7   ; [$a75b] byte
    .byte $33,$2c,$ab,$30,$c8,$72,$ac,$af   ; [$a763] byte
    .byte $21,$c8,$dc,$8b,$21,$55,$73,$0c   ; [$a76b] byte
    .byte $8d,$72,$3c,$c1,$55,$55,$55,$55   ; [$a773] byte
    .byte $57,$1f,$32,$f5,$c6,$d5,$55,$57   ; [$a77b] byte
    .byte $0e,$33,$15,$c7,$15,$55,$55,$31   ; [$a783] byte
    .byte $fc,$dd,$c3,$1c,$57,$2f,$55,$57   ; [$a78b] byte
    .byte $0d,$70,$3c,$47,$12,$c0,$f2,$07   ; [$a793] byte
    .byte $26,$c4,$40,$0c,$67,$04           ; [$a79b] byte

DARTMOOR_BLOCKS_SCREEN_15:                  ; [$a7a1]
    .byte $c4,$4c,$4b,$1f,$c5,$72,$6c,$3c   ; [$a7a1] byte
    .byte $32,$7c,$0b,$01,$c4,$4c,$4b,$10   ; [$a7a9] byte
    .byte $ca,$b2,$bc,$9b,$04,$40,$0c,$68   ; [$a7b1] byte
    .byte $ce,$32,$b3,$29,$c8,$f3,$0c,$a7   ; [$a7b9] byte
    .byte $2a,$ca,$f2,$9c,$ab,$2b,$ca,$5c   ; [$a7c1] byte
    .byte $e3,$29,$ca,$b3,$0c,$8b,$21,$5c   ; [$a7c9] byte
    .byte $87,$23,$cc,$32,$1c,$8f,$30,$c8   ; [$a7d1] byte
    .byte $72,$ac,$af,$21,$c8,$d5,$55,$55   ; [$a7d9] byte
    .byte $72,$3c,$c1,$55,$71,$5c,$dd,$55   ; [$a7e1] byte
    .byte $55,$55,$c7,$dc,$c1,$72,$6c,$3c   ; [$a7e9] byte
    .byte $32,$05,$55,$c3,$55,$72,$9c,$ab   ; [$a7f1] byte
    .byte $2b,$ca,$72,$ac,$9b,$0f,$00,$c3   ; [$a7f9] byte
    .byte $b3,$8c,$d5,$72,$1c,$8f,$30,$c8   ; [$a801] byte
    .byte $72,$3c,$af,$29,$ca,$b2,$b3,$29   ; [$a809] byte
    .byte $73,$1c,$85,$55,$5c,$c3,$21,$c8   ; [$a811] byte
    .byte $f3,$0c,$8b,$21,$55,$71,$ec,$7f   ; [$a819] byte
    .byte $1e,$cd,$d5,$55,$72,$6c,$3f,$02   ; [$a821] byte
    .byte $cb,$f2,$9c,$6b,$38,$cd,$70,$1c   ; [$a829] byte
    .byte $67,$0f,$00,$c0,$f1,$13,$04,$ce   ; [$a831] byte
    .byte $32,$1c,$ab,$2b,$c8,$70,$3c,$63   ; [$a839] byte
    .byte $11,$00                           ; [$a841] byte

DARTMOOR_BLOCKS_SCREEN_16:                  ; [$a843]
    .byte $c4,$4c,$0b,$01,$c4,$72,$0c,$e3   ; [$a843] byte
    .byte $30,$c8,$72,$3c,$9b,$11,$c0,$b0   ; [$a84b] byte
    .byte $1c,$4b,$10,$ca,$b2,$6c,$13,$0c   ; [$a853] byte
    .byte $b0,$25,$5c,$07,$02,$c3,$30,$3c   ; [$a85b] byte
    .byte $83,$29,$c8,$f2,$bc,$a7,$16,$c3   ; [$a863] byte
    .byte $45,$5c,$34,$c5,$b2,$b3,$21,$73   ; [$a86b] byte
    .byte $0c,$87,$2a,$c3,$30,$e5,$5c,$3b   ; [$a873] byte
    .byte $0c,$ce,$33,$0c,$89,$57,$23,$c6   ; [$a87b] byte
    .byte $95,$57,$1a,$55,$55,$ca,$d5,$57   ; [$a883] byte
    .byte $32,$ca,$95,$71,$5c,$dd,$cc,$31   ; [$a88b] byte
    .byte $a5,$5c,$6b,$30,$c9,$b1,$9c,$83   ; [$a893] byte
    .byte $37,$c8,$1c,$c1,$72,$9c,$a9,$5c   ; [$a89b] byte
    .byte $af,$35,$ca,$b2,$b3,$10,$ca,$b2   ; [$a8a3] byte
    .byte $bc,$d5,$72,$1c,$8d,$5c,$c3,$21   ; [$a8ab] byte
    .byte $c8,$f3,$0c,$8b,$29,$c8,$f3,$0c   ; [$a8b3] byte
    .byte $85,$55,$55,$57,$21,$55,$55,$55   ; [$a8bb] byte
    .byte $55,$c6,$70,$2c,$dd,$c7,$b1,$fc   ; [$a8c3] byte
    .byte $7b,$1f,$c7,$b1,$fc,$7b,$1f,$cb   ; [$a8cb] byte
    .byte $1c,$7f,$37,$70,$4c,$c1,$c9,$b0   ; [$a8d3] byte
    .byte $4c,$9b,$04,$c9,$b0,$4c,$9b,$04   ; [$a8db] byte
    .byte $ce,$1c,$0f,$11                   ; [$a8e3] byte

DARTMOOR_BLOCKS_SCREEN_17:                  ; [$a8e7]
    .byte $c9,$b0,$2c,$07,$04,$cc,$72,$1c   ; [$a8e7] byte
    .byte $73,$31,$c8,$71,$cc,$c7,$21,$c9   ; [$a8ef] byte
    .byte $b0,$2c,$07,$19,$ca,$b1,$a3,$38   ; [$a8f7] byte
    .byte $ca,$dc,$69,$71,$a5,$ca,$b1,$a3   ; [$a8ff] byte
    .byte $32,$c8,$f2,$bc,$a7,$2a,$cc,$1c   ; [$a907] byte
    .byte $ab,$2b,$72,$ac,$ad,$c8,$f2,$b3   ; [$a90f] byte
    .byte $35,$73,$0c,$87,$23,$5c,$8f,$30   ; [$a917] byte
    .byte $72,$3c,$c1,$73,$0c,$8b,$21,$55   ; [$a91f] byte
    .byte $55,$55,$55,$55,$55,$55,$55,$55   ; [$a927] byte
    .byte $55,$55,$55,$c4,$70,$2c,$07,$20   ; [$a92f] byte
    .byte $cb,$dc,$7b,$26,$c8,$32,$c5,$c9   ; [$a937] byte
    .byte $b1,$2c,$07,$18,$ca,$b1,$a3,$38   ; [$a93f] byte
    .byte $ca,$dc,$ab,$2b,$ca,$72,$a5,$ca   ; [$a947] byte
    .byte $b2,$bc,$6b,$32,$c8,$f2,$bc,$a7   ; [$a94f] byte
    .byte $2a,$cc,$1c,$8f,$30,$c8,$72,$35   ; [$a957] byte
    .byte $c8,$f3,$0c,$e7,$35,$73,$0c,$87   ; [$a95f] byte
    .byte $23,$55,$55,$5c,$8b,$21,$55,$5c   ; [$a967] byte
    .byte $07,$11,$c4,$b2,$c7,$10,$c4,$70   ; [$a96f] byte
    .byte $2c,$a1,$c4,$71,$9c,$60,$31,$1c   ; [$a977] byte
    .byte $13,$2b,$ca,$72,$a7,$29,$ca,$b0   ; [$a97f] byte
    .byte $3c,$67,$11                       ; [$a987] byte

DARTMOOR_BLOCKS_SCREEN_18:                  ; [$a98a]
    .byte $c9,$b1,$9c,$0b,$38,$cc,$31,$7c   ; [$a98a] byte
    .byte $e3,$30,$c0,$71,$8c,$47,$19,$c0   ; [$a992] byte
    .byte $b0,$1c,$44,$ca,$b1,$ec,$31,$71   ; [$a99a] byte
    .byte $65,$c3,$31,$ec,$e3,$29,$c6,$8c   ; [$a9a2] byte
    .byte $e3,$29,$c8,$f2,$bc,$69,$72,$9c   ; [$a9aa] byte
    .byte $a9,$c6,$b3,$8c,$af,$21,$ca,$b2   ; [$a9b2] byte
    .byte $b3,$21,$73,$0c,$a7,$2a,$72,$1c   ; [$a9ba] byte
    .byte $8d,$ca,$72,$ac,$c1,$c8,$f3,$0c   ; [$a9c2] byte
    .byte $89,$5c,$87,$23,$55,$c8,$72,$35   ; [$a9ca] byte
    .byte $55,$55,$55,$55,$55,$72,$e5,$cb   ; [$a9d2] byte
    .byte $97,$2e,$5c,$b9,$c5,$72,$f5,$c4   ; [$a9da] byte
    .byte $70,$2c,$07,$19,$c3,$c0,$03,$02   ; [$a9e2] byte
    .byte $70,$1c,$47,$18,$ca,$b1,$a3,$38   ; [$a9ea] byte
    .byte $ca,$f2,$9c,$ab,$2b,$ca,$72,$ac   ; [$a9f2] byte
    .byte $af,$16,$71,$6c,$e3,$29,$c8,$f2   ; [$a9fa] byte
    .byte $bc,$a7,$2a,$cc,$32,$1c,$8f,$30   ; [$aa02] byte
    .byte $c8,$72,$3c,$c3,$29,$ca,$b2,$b3   ; [$aa0a] byte
    .byte $21,$73,$0c,$87,$23,$5c,$07,$12   ; [$aa12] byte
    .byte $cd,$d7,$21,$c8,$f3,$0c,$89,$55   ; [$aa1a] byte
    .byte $5c,$33,$2b,$cd,$5c,$77,$37,$55   ; [$aa22] byte
    .byte $c4,$70,$fc,$9f,$0f,$c9,$f1,$1c   ; [$aa2a] byte
    .byte $13,$30,$c8,$5c,$0f,$0f,$c9,$f0   ; [$aa32] byte
    .byte $fc,$9f,$11                       ; [$aa3a] byte

DARTMOOR_BLOCKS_SCREEN_19:                  ; [$aa3d]
    .byte $c9,$b0,$f0,$c9,$f0,$2c,$57,$01   ; [$aa3d] byte
    .byte $c6,$70,$f0,$0c,$9f,$02,$ca,$b2   ; [$aa45] byte
    .byte $bc,$a7,$2a,$c9,$b0,$47,$03,$c8   ; [$aa4d] byte
    .byte $33,$8c,$af,$29,$ca,$b2,$bc,$9b   ; [$aa55] byte
    .byte $04,$c8,$f3,$0c,$87,$23,$ca,$f2   ; [$aa5d] byte
    .byte $97,$38,$ca,$72,$ac,$c3,$21,$c8   ; [$aa65] byte
    .byte $f3,$0c,$e7,$29,$55,$cc,$32,$1c   ; [$aa6d] byte
    .byte $ab,$2b,$c8,$72,$35,$5c,$8b,$21   ; [$aa75] byte
    .byte $55,$5c,$8f,$30,$55,$57,$15,$55   ; [$aa7d] byte
    .byte $55,$55,$c0,$70,$2c,$a1,$57,$1f   ; [$aa85] byte
    .byte $cb,$d5,$71,$fc,$bd,$c0,$f0,$4c   ; [$aa8d] byte
    .byte $c5,$c9,$f2,$07,$1a,$cc,$5c,$07   ; [$aa95] byte
    .byte $18,$c6,$70,$4c,$c5,$ca,$b2,$b1   ; [$aa9d] byte
    .byte $ca,$b2,$b7,$2a,$ca,$dc,$6b,$38   ; [$aaa5] byte
    .byte $ca,$72,$ac,$ad,$c8,$f3,$0c,$89   ; [$aaad] byte
    .byte $c8,$f3,$07,$23,$cc,$1c,$ab,$2b   ; [$aab5] byte
    .byte $c8,$72,$3c,$c1,$57,$1f,$55,$5c   ; [$aabd] byte
    .byte $8f,$30,$55,$57,$0c,$55,$5c,$77   ; [$aac5] byte
    .byte $2f,$5c,$77,$37,$57,$17,$c4,$71   ; [$aacd] byte
    .byte $9c,$3f,$18,$c4,$4c,$13,$31,$5c   ; [$aad5] byte
    .byte $0f,$0f,$31,$8c,$67,$04,$d3,$80   ; [$aadd] byte
    .byte $08,$00,$00,$00,$00,$00,$93,$00   ; [$aae5] byte
    .byte $06,$00,$00,$00,$00,$00,$0b,$40   ; [$aaed] byte
    .byte $40,$00,$00,$00,$00,$00,$13,$08   ; [$aaf5] byte
    .byte $08,$00,$00,$00,$00,$00,$a0,$02   ; [$aafd] byte
    .byte $d0,$00,$00,$00,$00,$00,$2b,$00   ; [$ab05] byte
    .byte $00,$00,$00,$00,$00,$00,$1b,$00   ; [$ab0d] byte
    .byte $00,$00,$00,$00,$00,$00,$05,$00   ; [$ab15] byte
    .byte $80,$00,$00,$00,$00,$00,$cb,$00   ; [$ab1d] byte
    .byte $bf,$00,$00,$00,$00,$00,$7a,$00   ; [$ab25] byte
    .byte $18,$00,$00,$00,$00,$00,$ae,$00   ; [$ab2d] byte
    .byte $90,$00,$00,$00,$00,$00,$99,$00   ; [$ab35] byte
    .byte $40,$00,$00,$00,$00,$00,$3e,$00   ; [$ab3d] byte
    .byte $2a,$00,$00,$00,$00,$00,$bf,$00   ; [$ab45] byte
    .byte $50,$00,$00,$00,$00,$00,$fe,$00   ; [$ab4d] byte
    .byte $10,$00,$00,$00,$00,$00,$cf,$00   ; [$ab55] byte
    .byte $48,$00,$00,$00,$00,$00,$fd,$80   ; [$ab5d] byte
    .byte $23,$00,$00,$00,$00,$00,$43,$00   ; [$ab65] byte
    .byte $34,$00,$00,$00,$00,$00,$92,$01   ; [$ab6d] byte
    .byte $0a,$00,$00,$00,$00,$00,$f5,$00   ; [$ab75] byte
    .byte $02,$00,$00,$00,$00,$00,$1f,$00   ; [$ab7d] byte
    .byte $0c,$00,$00,$00,$00,$00,$fc,$00   ; [$ab85] byte
    .byte $20,$00,$00,$00,$00,$00,$7e,$00   ; [$ab8d] byte
    .byte $00,$00,$00,$00,$00,$00,$1e,$00   ; [$ab95] byte
    .byte $00,$00,$00,$00,$00,$00,$a6,$00   ; [$ab9d] byte
    .byte $00,$00,$00,$00,$00,$00,$f0,$00   ; [$aba5] byte
    .byte $41,$00,$00,$00,$00,$00,$2b,$00   ; [$abad] byte
    .byte $60,$00,$00,$00,$00,$00,$02,$00   ; [$abb5] byte
    .byte $00,$00,$00,$00,$00,$00,$ef,$00   ; [$abbd] byte
    .byte $02,$00,$00,$00,$00,$00,$3c,$00   ; [$abc5] byte
    .byte $24,$00,$00,$00,$00,$00,$60,$00   ; [$abcd] byte
    .byte $00,$00,$00,$00,$00,$00,$c0,$00   ; [$abd5] byte
    .byte $20,$00,$00,$00,$00,$00,$f1,$00   ; [$abdd] byte
    .byte $05,$00,$00,$00,$00,$00,$14,$00   ; [$abe5] byte
    .byte $08,$00,$00,$00,$00,$00,$2f,$00   ; [$abed] byte
    .byte $68,$00,$00,$00,$00,$00,$4d,$10   ; [$abf5] byte
    .byte $02,$00,$00,$00,$00,$00,$fd,$00   ; [$abfd] byte
    .byte $19,$00,$00,$00,$00,$00,$dc,$20   ; [$ac05] byte
    .byte $35,$00,$00,$00,$00,$00,$8b,$00   ; [$ac0d] byte
    .byte $91,$00,$00,$00,$00,$00,$4e,$00   ; [$ac15] byte
    .byte $3e,$00,$00,$00,$00,$00,$17,$00   ; [$ac1d] byte
    .byte $0a,$00,$00,$00,$00,$00,$95,$00   ; [$ac25] byte
    .byte $04,$00,$00,$00,$00,$00,$9b,$00   ; [$ac2d] byte
    .byte $41,$00,$00,$00,$00,$00,$5f,$00   ; [$ac35] byte
    .byte $60,$00,$00,$00,$00,$00,$fb,$00   ; [$ac3d] byte
    .byte $81,$00,$00,$00,$00,$00,$96,$00   ; [$ac45] byte
    .byte $19,$00,$00,$00,$00,$00,$4e,$00   ; [$ac4d] byte
    .byte $1a,$00,$00,$00,$00,$00,$59,$00   ; [$ac55] byte
    .byte $19,$00,$00,$00,$00,$00,$6b,$00   ; [$ac5d] byte
    .byte $64,$00,$00,$00,$00,$00,$7c,$00   ; [$ac65] byte
    .byte $00,$00,$00,$00,$00,$20,$b5,$00   ; [$ac6d] byte
    .byte $b4,$00,$00,$00,$00,$00,$79,$00   ; [$ac75] byte
    .byte $68,$00,$00,$00,$00,$00,$e9,$00   ; [$ac7d] byte
    .byte $20,$00,$00,$00,$00,$00,$ec,$00   ; [$ac85] byte
    .byte $80,$00,$00,$00,$00,$00,$8f,$00   ; [$ac8d] byte
    .byte $22,$00,$00,$00,$00,$00,$23,$00   ; [$ac95] byte
    .byte $00,$00,$00,$00,$00,$00,$de,$00   ; [$ac9d] byte
    .byte $52,$00,$00,$00,$00,$00,$29,$00   ; [$aca5] byte
    .byte $02,$00,$00,$00,$00,$00,$92,$04   ; [$acad] byte
    .byte $02,$00,$00,$00,$00,$00,$28,$00   ; [$acb5] byte
    .byte $00,$00,$00,$00,$00,$00,$60,$00   ; [$acbd] byte
    .byte $0a,$00,$00,$00,$00,$80,$b2,$00   ; [$acc5] byte
    .byte $80,$00,$00,$00,$00,$00,$c3,$00   ; [$accd] byte
    .byte $00,$00,$00,$00,$00,$00,$15,$00   ; [$acd5] byte
    .byte $00,$00,$00,$00,$00,$00,$b8,$00   ; [$acdd] byte
    .byte $ca,$00,$00,$00,$00,$00,$85,$00   ; [$ace5] byte
    .byte $81,$00,$00,$00,$00,$00,$d7,$00   ; [$aced] byte
    .byte $22,$00,$00,$00,$00,$00,$93,$02   ; [$acf5] byte
    .byte $04,$00,$00,$00,$00,$00,$ed,$00   ; [$acfd] byte
    .byte $ea,$00,$00,$00,$00,$00,$3f,$20   ; [$ad05] byte
    .byte $08,$00,$00,$00,$00,$00,$d4,$00   ; [$ad0d] byte
    .byte $94,$00,$00,$00,$00,$00,$f6,$00   ; [$ad15] byte
    .byte $00,$00,$00,$00,$00,$00,$d6,$20   ; [$ad1d] byte
    .byte $19,$00,$00,$00,$00,$00,$ec,$20   ; [$ad25] byte
    .byte $b0,$00,$00,$00,$00,$00,$7d,$00   ; [$ad2d] byte
    .byte $20,$00,$00,$00,$00,$00,$51,$00   ; [$ad35] byte
    .byte $01,$00,$00,$00,$00,$00,$c1,$00   ; [$ad3d] byte
    .byte $50,$00,$00,$00,$00,$00,$8a,$00   ; [$ad45] byte
    .byte $c3,$00,$00,$00,$00,$00,$b7,$00   ; [$ad4d] byte
    .byte $03,$00,$00,$00,$00,$00,$95,$00   ; [$ad55] byte
    .byte $1d,$00,$00,$00,$00,$00,$bd,$00   ; [$ad5d] byte
    .byte $40,$00,$00,$00,$00,$00,$e1,$00   ; [$ad65] byte
    .byte $20,$00,$00,$00,$00,$00,$b6,$00   ; [$ad6d] byte
    .byte $90,$00,$00,$00,$00,$00,$f1,$00   ; [$ad75] byte
    .byte $10,$00,$00,$00,$00,$00,$db,$00   ; [$ad7d] byte
    .byte $82,$00,$00,$00,$00,$00,$31,$00   ; [$ad85] byte
    .byte $89,$00,$00,$00,$00,$00,$7c,$00   ; [$ad8d] byte
    .byte $04,$00,$00,$00,$00,$00,$ec,$00   ; [$ad95] byte
    .byte $08,$00,$00,$00,$00,$00,$4e,$00   ; [$ad9d] byte
    .byte $0a,$00,$00,$00,$00,$00,$2b,$00   ; [$ada5] byte
    .byte $0c,$00,$00,$00,$00,$00,$96,$00   ; [$adad] byte
    .byte $91,$00,$00,$00,$00,$00,$0c,$80   ; [$adb5] byte
    .byte $02,$00,$00,$00,$00,$00,$b7,$00   ; [$adbd] byte
    .byte $d0,$00,$00,$00,$00,$00,$98,$00   ; [$adc5] byte
    .byte $08,$00,$00,$00,$00,$00,$16,$00   ; [$adcd] byte
    .byte $21,$00,$00,$00,$00,$00,$1e,$02   ; [$add5] byte
    .byte $30,$00,$00,$00,$00,$00,$eb,$00   ; [$addd] byte
    .byte $c2,$00,$00,$00,$00,$00,$2a,$00   ; [$ade5] byte
    .byte $00,$00,$00,$00,$00,$00,$e7,$00   ; [$aded] byte
    .byte $88,$00,$00,$00,$00,$00,$29,$00   ; [$adf5] byte
    .byte $08,$00,$00,$00,$00,$00,$7b,$00   ; [$adfd] byte
    .byte $98,$00,$00,$00,$00,$00,$f6,$20   ; [$ae05] byte
    .byte $8d,$00,$00,$00,$00,$00,$bf,$00   ; [$ae0d] byte
    .byte $2a,$00,$00,$00,$00,$00,$fa,$00   ; [$ae15] byte
    .byte $08,$00,$00,$00,$00,$00,$b6,$00   ; [$ae1d] byte
    .byte $22,$00,$00,$00,$00,$00,$42,$00   ; [$ae25] byte
    .byte $c6,$00,$00,$00,$00,$00,$46,$00   ; [$ae2d] byte
    .byte $80,$00,$00,$00,$00,$00,$8c,$00   ; [$ae35] byte
    .byte $18,$00,$00,$00,$00,$00,$7a,$00   ; [$ae3d] byte
    .byte $1c,$00,$00,$00,$00,$00,$cd,$40   ; [$ae45] byte
    .byte $12,$00,$00,$00,$00,$00,$72,$00   ; [$ae4d] byte
    .byte $20,$00,$00,$00,$00,$00,$b3,$00   ; [$ae55] byte
    .byte $40,$00,$00,$00,$00,$00,$1b,$00   ; [$ae5d] byte
    .byte $1b,$00,$00,$00,$00,$00,$9a,$00   ; [$ae65] byte
    .byte $58,$00,$00,$00,$00,$00,$46,$00   ; [$ae6d] byte
    .byte $31,$00,$00,$00,$00,$00,$00,$00   ; [$ae75] byte
    .byte $25,$00,$00,$00,$00,$00,$53,$00   ; [$ae7d] byte
    .byte $88,$00,$00,$00,$00,$00,$89,$00   ; [$ae85] byte
    .byte $10,$00,$00,$00,$00,$00,$f1,$00   ; [$ae8d] byte
    .byte $00,$00,$00,$00,$00,$00,$0f,$08   ; [$ae95] byte
    .byte $46,$00,$00,$00,$00,$00,$8e,$00   ; [$ae9d] byte
    .byte $80,$00,$00,$00,$00,$08,$14,$00   ; [$aea5] byte
    .byte $50,$00,$00,$00,$00,$00,$40,$00   ; [$aead] byte
    .byte $00,$00,$00,$00,$00,$00,$28,$00   ; [$aeb5] byte
    .byte $01,$00,$00,$00,$00,$00,$35,$00   ; [$aebd] byte
    .byte $c9,$00,$00,$00,$00,$00,$fb,$80   ; [$aec5] byte
    .byte $08,$00,$00,$00,$00,$00,$81,$20   ; [$aecd] byte
    .byte $04,$00,$00,$00,$00,$00,$89,$00   ; [$aed5] byte
    .byte $80,$00,$00,$00,$00,$00,$59,$00   ; [$aedd] byte
    .byte $d8,$00,$00,$00,$00,$00,$dc,$00   ; [$aee5] byte
    .byte $01,$00,$00,$00,$00,$00,$e8,$00   ; [$aeed] byte
    .byte $08,$00,$00,$00,$00,$00,$c5,$01   ; [$aef5] byte
    .byte $04,$00,$00,$00,$00,$00,$d3,$00   ; [$aefd] byte
    .byte $12,$00,$00,$00,$00,$00,$51,$00   ; [$af05] byte
    .byte $84,$00,$00,$00,$00,$00,$2e,$00   ; [$af0d] byte
    .byte $94,$00,$00,$00,$00,$00,$7e,$00   ; [$af15] byte
    .byte $19,$00,$00,$00,$00,$00,$76,$00   ; [$af1d] byte
    .byte $91,$00,$00,$00,$00,$00,$ea,$00   ; [$af25] byte
    .byte $0a,$00,$00,$00,$00,$00,$db,$10   ; [$af2d] byte
    .byte $a6,$00,$00,$00,$00,$00,$64,$04   ; [$af35] byte
    .byte $1a,$00,$00,$00,$00,$00,$f1,$00   ; [$af3d] byte
    .byte $8f,$00,$00,$00,$00,$00,$b9,$00   ; [$af45] byte
    .byte $12,$00,$00,$00,$00,$00,$59,$00   ; [$af4d] byte
    .byte $05,$00,$00,$00,$00,$00,$b8,$00   ; [$af55] byte
    .byte $04,$00,$00,$00,$00,$00,$31,$00   ; [$af5d] byte
    .byte $0d,$00,$00,$00,$00,$00,$47,$00   ; [$af65] byte
    .byte $00,$00,$00,$00,$00,$00,$99,$00   ; [$af6d] byte
    .byte $12,$00,$00,$00,$00,$04,$44,$20   ; [$af75] byte
    .byte $0c,$00,$00,$00,$00,$00,$3b,$40   ; [$af7d] byte
    .byte $20,$00,$00,$00,$00,$00,$c9,$00   ; [$af85] byte
    .byte $05,$00,$00,$00,$00,$00,$aa,$00   ; [$af8d] byte
    .byte $04,$00,$00,$00,$00,$00,$02,$00   ; [$af95] byte
    .byte $00,$00,$00,$00,$00,$00,$fe,$00   ; [$af9d] byte
    .byte $02,$00,$00,$00,$00,$00,$cd,$00   ; [$afa5] byte
    .byte $23,$00,$00,$00,$00,$00,$5c,$00   ; [$afad] byte
    .byte $00,$00,$00,$00,$00,$00,$c0,$00   ; [$afb5] byte
    .byte $00,$00,$00,$00,$00,$00,$7b,$00   ; [$afbd] byte
    .byte $00,$00,$00,$00,$00,$00,$70,$00   ; [$afc5] byte
    .byte $04,$00,$00,$00,$00,$00,$80,$01   ; [$afcd] byte
    .byte $00,$00,$00,$00,$00,$40,$0e,$00   ; [$afd5] byte
    .byte $00,$00,$00,$00,$00,$00,$a2,$00   ; [$afdd] byte
    .byte $04,$00,$00,$00,$00,$00,$92,$00   ; [$afe5] byte
    .byte $01,$00,$00,$00,$00,$00,$d9,$08   ; [$afed] byte
    .byte $05,$00,$00,$00,$00,$00,$85,$10   ; [$aff5] byte
    .byte $00,$00,$00                       ; [$affd] byte


;============================================================================
; TODO: Blocks of 8 bytes. Seems to be:
;
; 0) 00-04 (flags?)
; 1) 0xFF
; 2) value
; 3) 0xFF
; 4) value
; 5) 0xFF
; 6) value
; 7) value
;============================================================================
    .byte $00,$ff,$fc,$ff,$ff,$ff,$f7,$4e   ; [$b000] byte
    .byte $00,$ff,$bf,$ff,$ff,$ff,$ff,$a2   ; [$b008] byte
    .byte $00,$ff,$eb,$ff,$fb,$ff,$ff,$f8   ; [$b010] byte
    .byte $00,$ff,$99,$ff,$df,$ff,$7f,$df   ; [$b018] byte
    .byte $00,$ff,$7f,$ff,$fd,$ff,$fd,$9f   ; [$b020] byte
    .byte $02,$ff,$7f,$ff,$ff,$ff,$df,$fe   ; [$b028] byte
    .byte $01,$ff,$ff,$ff,$fe,$ff,$ff,$77   ; [$b030] byte
    .byte $00,$ff,$6b,$ff,$df,$ff,$ff,$7f   ; [$b038] byte
    .byte $00,$ff,$d7,$ff,$bf,$ff,$ff,$ef   ; [$b040] byte
    .byte $00,$ff,$9f,$ff,$ff,$ff,$b9,$6e   ; [$b048] byte
    .byte $00,$ff,$1f,$ff,$ff,$ff,$ff,$ff   ; [$b050] byte
    .byte $00,$ff,$ee,$ff,$fd,$ff,$ff,$55   ; [$b058] byte
    .byte $00,$ff,$1c,$ff,$ff,$ff,$df,$5a   ; [$b060] byte
    .byte $04,$ff,$bf,$ff,$fe,$ff,$ff,$5f   ; [$b068] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$ff,$7c   ; [$b070] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$ff,$fc   ; [$b078] byte
    .byte $00,$ff,$5b,$ff,$7f,$ff,$ff,$ff   ; [$b080] byte
    .byte $00,$ff,$e3,$ff,$df,$ff,$ff,$6e   ; [$b088] byte
    .byte $00,$ff,$f2,$ff,$ff,$ff,$5f,$9d   ; [$b090] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$ff,$9f   ; [$b098] byte
    .byte $00,$ff,$77,$ff,$df,$ff,$ff,$2d   ; [$b0a0] byte
    .byte $00,$ff,$7d,$ff,$fb,$ff,$d8,$8f   ; [$b0a8] byte
    .byte $00,$ff,$c9,$ff,$ff,$ff,$ff,$44   ; [$b0b0] byte
    .byte $00,$ff,$43,$ff,$ff,$ff,$ff,$fa   ; [$b0b8] byte
    .byte $00,$ff,$6d,$ff,$ff,$ff,$fc,$cb   ; [$b0c0] byte
    .byte $00,$ff,$cb,$ff,$ff,$ff,$ff,$4c   ; [$b0c8] byte
    .byte $00,$ff,$ee,$ff,$ef,$ff,$f7,$f9   ; [$b0d0] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$ff,$ae   ; [$b0d8] byte
    .byte $00,$ff,$1d,$ff,$d3,$ff,$67,$dd   ; [$b0e0] byte
    .byte $00,$ff,$ce,$ff,$df,$ff,$ff,$3e   ; [$b0e8] byte
    .byte $00,$ff,$c9,$ff,$ff,$ff,$ff,$11   ; [$b0f0] byte
    .byte $00,$ff,$f9,$ff,$ff,$ff,$ff,$0e   ; [$b0f8] byte
    .byte $00,$ff,$ed,$ff,$ff,$ff,$f7,$99   ; [$b100] byte
    .byte $00,$ff,$de,$ff,$ff,$ff,$bf,$1a   ; [$b108] byte
    .byte $00,$ff,$af,$ff,$ff,$ff,$fd,$b6   ; [$b110] byte
    .byte $00,$ff,$57,$ff,$fe,$ff,$ef,$eb   ; [$b118] byte
    .byte $00,$ff,$f5,$ff,$ff,$ff,$fa,$b6   ; [$b120] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$7e   ; [$b128] byte
    .byte $00,$ff,$e8,$ff,$ff,$ff,$ff,$63   ; [$b130] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$fb,$f6   ; [$b138] byte
    .byte $00,$ff,$aa,$ff,$7f,$ff,$7f,$72   ; [$b140] byte
    .byte $00,$ff,$7e,$ff,$ff,$ff,$f7,$dd   ; [$b148] byte
    .byte $00,$ff,$e3,$ff,$ff,$ff,$ff,$1d   ; [$b150] byte
    .byte $00,$ff,$74,$ff,$fd,$ff,$ff,$dd   ; [$b158] byte
    .byte $00,$ff,$d5,$ff,$df,$ff,$ff,$79   ; [$b160] byte
    .byte $00,$ff,$f2,$ff,$ed,$ff,$ff,$fd   ; [$b168] byte
    .byte $00,$ff,$f9,$ff,$fe,$ff,$ff,$3f   ; [$b170] byte
    .byte $00,$ff,$ce,$ff,$ff,$ff,$bf,$ca   ; [$b178] byte
    .byte $00,$ff,$ee,$ff,$ff,$ff,$fd,$27   ; [$b180] byte
    .byte $00,$ff,$79,$ff,$7f,$ff,$fb,$cd   ; [$b188] byte
    .byte $00,$ff,$87,$ff,$bf,$ff,$ff,$7b   ; [$b190] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$fd,$5b   ; [$b198] byte
    .byte $00,$ff,$f6,$ff,$ff,$ff,$ef,$ed   ; [$b1a0] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$73   ; [$b1a8] byte
    .byte $00,$ff,$b1,$ff,$ff,$ff,$eb,$db   ; [$b1b0] byte
    .byte $00,$ff,$cd,$ff,$ff,$ff,$ff,$16   ; [$b1b8] byte
    .byte $00,$ff,$63,$ff,$ff,$ff,$fd,$fa   ; [$b1c0] byte
    .byte $00,$ff,$bb,$ff,$ff,$ff,$ff,$3c   ; [$b1c8] byte
    .byte $00,$ff,$dd,$ff,$ff,$ff,$ff,$d6   ; [$b1d0] byte
    .byte $00,$ff,$ff,$ff,$3d,$ff,$ff,$59   ; [$b1d8] byte
    .byte $00,$ff,$99,$ff,$ff,$ff,$ff,$3e   ; [$b1e0] byte
    .byte $00,$ff,$d9,$ff,$7f,$ff,$ed,$92   ; [$b1e8] byte
    .byte $00,$bf,$ce,$ff,$ff,$ff,$fb,$e3   ; [$b1f0] byte
    .byte $08,$ff,$9e,$ff,$ff,$ff,$ff,$a4   ; [$b1f8] byte
    .byte $00,$ff,$fe,$ff,$3e,$ff,$fb,$b7   ; [$b200] byte
    .byte $08,$ff,$dd,$ff,$ff,$ff,$ff,$38   ; [$b208] byte
    .byte $00,$ff,$75,$ff,$ff,$ff,$ff,$27   ; [$b210] byte
    .byte $00,$ff,$f9,$ff,$5f,$ff,$ff,$ad   ; [$b218] byte
    .byte $00,$ff,$de,$ff,$bf,$ff,$ff,$bb   ; [$b220] byte
    .byte $00,$ff,$f9,$ff,$ff,$ff,$ff,$55   ; [$b228] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$ff,$5b   ; [$b230] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$cf,$2d   ; [$b238] byte
    .byte $00,$ff,$e5,$ff,$fb,$ff,$fd,$77   ; [$b240] byte
    .byte $00,$ff,$cb,$ff,$db,$ff,$ff,$79   ; [$b248] byte
    .byte $00,$ff,$ff,$ff,$fe,$ff,$ff,$52   ; [$b250] byte
    .byte $01,$ff,$df,$ff,$fd,$ff,$fe,$b7   ; [$b258] byte
    .byte $00,$ff,$bd,$ff,$ef,$ff,$bd,$33   ; [$b260] byte
    .byte $00,$ff,$73,$ff,$f7,$ff,$fe,$de   ; [$b268] byte
    .byte $00,$ff,$e7,$ff,$ff,$ff,$9f,$bd   ; [$b270] byte
    .byte $00,$ff,$ff,$ff,$fe,$ff,$fb,$bd   ; [$b278] byte
    .byte $00,$ff,$9b,$ff,$7f,$ff,$eb,$ec   ; [$b280] byte
    .byte $00,$ff,$fe,$ff,$fd,$ff,$ff,$51   ; [$b288] byte
    .byte $00,$ff,$83,$ff,$ff,$ff,$ff,$8d   ; [$b290] byte
    .byte $00,$ff,$db,$ff,$ed,$ff,$ff,$8f   ; [$b298] byte
    .byte $00,$ff,$09,$ff,$f7,$ff,$7d,$ff   ; [$b2a0] byte
    .byte $00,$ff,$d1,$ff,$e7,$ff,$fb,$ea   ; [$b2a8] byte
    .byte $00,$ff,$b1,$ff,$df,$ff,$ff,$c5   ; [$b2b0] byte
    .byte $00,$ff,$2f,$ff,$ff,$ff,$ef,$bd   ; [$b2b8] byte
    .byte $00,$ff,$75,$ff,$f5,$ff,$3d,$bf   ; [$b2c0] byte
    .byte $00,$ff,$65,$ff,$7e,$ff,$ff,$9a   ; [$b2c8] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$fe,$cf   ; [$b2d0] byte
    .byte $00,$ff,$f3,$ff,$ff,$ff,$ff,$6f   ; [$b2d8] byte
    .byte $00,$ff,$64,$ff,$db,$ff,$4e,$c7   ; [$b2e0] byte
    .byte $00,$ff,$b8,$ff,$bf,$ff,$ad,$03   ; [$b2e8] byte
    .byte $00,$ff,$d6,$ff,$ef,$ff,$ff,$49   ; [$b2f0] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$f7,$5a   ; [$b2f8] byte
    .byte $00,$ff,$ed,$ff,$ef,$ff,$ff,$aa   ; [$b300] byte
    .byte $00,$ff,$9e,$ff,$7f,$ff,$fd,$fd   ; [$b308] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$ff,$7d   ; [$b310] byte
    .byte $00,$ff,$27,$ff,$ef,$ff,$ff,$d8   ; [$b318] byte
    .byte $00,$ff,$9f,$ff,$ff,$ff,$ff,$bd   ; [$b320] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$f7,$e4   ; [$b328] byte
    .byte $00,$ff,$bf,$ff,$fd,$ff,$ff,$75   ; [$b330] byte
    .byte $00,$ff,$7a,$ff,$ff,$ff,$7d,$e6   ; [$b338] byte
    .byte $00,$ff,$f0,$ff,$ed,$ff,$ff,$d5   ; [$b340] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$bf,$7e   ; [$b348] byte
    .byte $00,$ff,$bf,$ff,$f7,$ff,$ff,$b7   ; [$b350] byte
    .byte $00,$ff,$3f,$ff,$ff,$ff,$ff,$7b   ; [$b358] byte
    .byte $00,$ff,$d7,$ff,$fe,$ff,$fb,$a4   ; [$b360] byte
    .byte $00,$ff,$bc,$ff,$b7,$ff,$f3,$df   ; [$b368] byte
    .byte $20,$ff,$fa,$ff,$ff,$ff,$7f,$51   ; [$b370] byte
    .byte $00,$ff,$fb,$ff,$ef,$ff,$ff,$ff   ; [$b378] byte
    .byte $00,$ff,$0f,$ff,$ff,$ff,$fe,$3e   ; [$b380] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$70   ; [$b388] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$f8   ; [$b390] byte
    .byte $00,$ff,$7d,$ff,$ff,$ff,$df,$85   ; [$b398] byte
    .byte $00,$ff,$b5,$ff,$ff,$ff,$36,$4a   ; [$b3a0] byte
    .byte $00,$ff,$66,$ff,$fd,$ff,$7f,$8c   ; [$b3a8] byte
    .byte $00,$ff,$f1,$ff,$fb,$ff,$ff,$94   ; [$b3b0] byte
    .byte $00,$ff,$f5,$ff,$ff,$ff,$7d,$78   ; [$b3b8] byte
    .byte $00,$ff,$26,$ff,$ff,$ff,$7f,$b5   ; [$b3c0] byte
    .byte $00,$ff,$48,$ff,$fb,$ff,$fd,$e3   ; [$b3c8] byte
    .byte $00,$ff,$d3,$ff,$ff,$ff,$f7,$13   ; [$b3d0] byte
    .byte $80,$ff,$df,$ff,$ff,$ff,$ff,$b4   ; [$b3d8] byte
    .byte $00,$ff,$85,$ff,$fb,$ff,$ff,$c5   ; [$b3e0] byte
    .byte $00,$ff,$df,$ff,$7f,$ff,$77,$2f   ; [$b3e8] byte
    .byte $00,$ff,$6f,$ff,$ff,$ff,$7f,$6c   ; [$b3f0] byte
    .byte $00,$ff,$d7,$ff,$f1,$ff,$ff,$f1   ; [$b3f8] byte
    .byte $00,$ff,$ff,$ff,$f7,$ff,$ff,$35   ; [$b400] byte
    .byte $00,$ff,$fd,$ff,$ff,$ff,$ff,$79   ; [$b408] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$ff,$67   ; [$b410] byte
    .byte $00,$ff,$23,$ff,$ff,$ff,$bf,$fa   ; [$b418] byte
    .byte $00,$ff,$fc,$ff,$b9,$ff,$ff,$bd   ; [$b420] byte
    .byte $00,$ff,$bf,$ff,$ff,$ff,$ff,$d9   ; [$b428] byte
    .byte $00,$ff,$7f,$ff,$f7,$ff,$ff,$a7   ; [$b430] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$fd,$ff   ; [$b438] byte
    .byte $00,$ff,$e9,$ff,$ff,$ff,$fe,$ad   ; [$b440] byte
    .byte $02,$ff,$7d,$ff,$fd,$ff,$ff,$7f   ; [$b448] byte
    .byte $00,$ff,$ea,$ff,$ff,$ff,$ed,$ff   ; [$b450] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$ff,$63   ; [$b458] byte
    .byte $00,$ff,$59,$ff,$ff,$ff,$ff,$e5   ; [$b460] byte
    .byte $00,$ff,$73,$ff,$f7,$ff,$ff,$3f   ; [$b468] byte
    .byte $00,$ff,$77,$ff,$ff,$ff,$f6,$4f   ; [$b470] byte
    .byte $00,$ff,$b5,$ff,$ff,$ff,$7f,$bd   ; [$b478] byte
    .byte $00,$ff,$90,$ff,$d7,$ff,$9f,$df   ; [$b480] byte
    .byte $00,$ff,$7f,$ff,$df,$ff,$f7,$ca   ; [$b488] byte
    .byte $00,$ff,$66,$ff,$fd,$ff,$ff,$ca   ; [$b490] byte
    .byte $00,$ff,$fb,$ff,$ff,$ff,$ff,$27   ; [$b498] byte
    .byte $00,$ff,$c7,$ff,$ff,$ff,$ff,$6e   ; [$b4a0] byte
    .byte $00,$ff,$7d,$ff,$ef,$ff,$ff,$7d   ; [$b4a8] byte
    .byte $00,$ff,$eb,$ff,$ee,$ff,$ed,$ff   ; [$b4b0] byte
    .byte $00,$ff,$fe,$ff,$f7,$ff,$ff,$2e   ; [$b4b8] byte
    .byte $04,$ff,$36,$ff,$fa,$ff,$7b,$19   ; [$b4c0] byte
    .byte $00,$ff,$e4,$ff,$fc,$ff,$df,$37   ; [$b4c8] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$f3,$34   ; [$b4d0] byte
    .byte $00,$ff,$6b,$ff,$fe,$ff,$ff,$38   ; [$b4d8] byte
    .byte $00,$ff,$e3,$ff,$fb,$ff,$f7,$da   ; [$b4e0] byte
    .byte $00,$ff,$f7,$ff,$3e,$ff,$ff,$0c   ; [$b4e8] byte
    .byte $00,$ff,$ae,$ff,$ff,$ff,$ff,$7d   ; [$b4f0] byte
    .byte $00,$ff,$fa,$ff,$df,$ff,$fe,$4f   ; [$b4f8] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$fe,$27   ; [$b500] byte
    .byte $00,$ff,$df,$ff,$be,$ff,$bf,$b5   ; [$b508] byte
    .byte $00,$ff,$b7,$ff,$fe,$ff,$ff,$f7   ; [$b510] byte
    .byte $00,$ff,$dd,$ff,$ff,$ff,$ff,$63   ; [$b518] byte
    .byte $02,$ff,$ff,$ff,$ef,$ff,$ff,$fc   ; [$b520] byte
    .byte $00,$ff,$5f,$ff,$ff,$ff,$ff,$9f   ; [$b528] byte
    .byte $00,$ff,$df,$ff,$df,$ff,$ff,$9c   ; [$b530] byte
    .byte $00,$ff,$37,$ff,$f7,$ff,$ff,$df   ; [$b538] byte
    .byte $00,$ff,$e3,$ff,$fe,$ff,$da,$fb   ; [$b540] byte
    .byte $00,$ff,$b5,$ff,$f7,$ff,$ff,$dd   ; [$b548] byte
    .byte $00,$ff,$f5,$ff,$fe,$ff,$ff,$96   ; [$b550] byte
    .byte $00,$ff,$c7,$ff,$5d,$ff,$de,$b5   ; [$b558] byte
    .byte $00,$ff,$de,$ff,$7d,$ff,$ff,$fd   ; [$b560] byte
    .byte $00,$ff,$73,$ff,$bf,$ff,$fd,$17   ; [$b568] byte
    .byte $00,$ff,$ed,$ff,$f7,$ff,$ff,$fc   ; [$b570] byte
    .byte $00,$ff,$fb,$ff,$ff,$ff,$df,$7f   ; [$b578] byte
    .byte $00,$ff,$79,$ff,$ff,$ff,$ff,$5d   ; [$b580] byte
    .byte $00,$ff,$ff,$ff,$fe,$ff,$ff,$b5   ; [$b588] byte
    .byte $00,$ff,$3b,$ff,$ef,$ff,$fd,$d7   ; [$b590] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$bf,$66   ; [$b598] byte
    .byte $00,$ff,$ec,$ff,$fc,$ff,$ef,$47   ; [$b5a0] byte
    .byte $00,$ff,$ed,$ff,$eb,$ff,$be,$38   ; [$b5a8] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$ff,$d6   ; [$b5b0] byte
    .byte $00,$ff,$7a,$ff,$ff,$ff,$ff,$e7   ; [$b5b8] byte
    .byte $00,$ff,$f5,$ff,$7f,$ff,$ff,$a8   ; [$b5c0] byte
    .byte $00,$ff,$ef,$ff,$bf,$ff,$ff,$8b   ; [$b5c8] byte
    .byte $00,$ff,$f9,$ff,$7d,$ff,$dd,$10   ; [$b5d0] byte
    .byte $00,$ff,$ef,$ff,$ef,$ff,$bf,$2e   ; [$b5d8] byte
    .byte $00,$ff,$66,$ff,$ed,$ff,$f6,$7d   ; [$b5e0] byte
    .byte $00,$ff,$12,$ff,$7f,$ff,$fd,$b5   ; [$b5e8] byte
    .byte $00,$ff,$6f,$ff,$7f,$ff,$ff,$d6   ; [$b5f0] byte
    .byte $00,$ff,$fb,$ff,$fe,$ff,$7f,$27   ; [$b5f8] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$fb,$bb   ; [$b600] byte
    .byte $00,$ff,$e8,$ff,$ff,$ff,$ff,$b5   ; [$b608] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$ff,$ff   ; [$b610] byte
    .byte $00,$ff,$bf,$ff,$ef,$ff,$ff,$cc   ; [$b618] byte
    .byte $00,$ff,$ee,$ff,$9e,$ff,$ff,$dd   ; [$b620] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$ff,$a5   ; [$b628] byte
    .byte $00,$ff,$f1,$ff,$ff,$ff,$ff,$74   ; [$b630] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$ff,$7f   ; [$b638] byte
    .byte $00,$ff,$f7,$ff,$ef,$ff,$be,$ef   ; [$b640] byte
    .byte $00,$ff,$2f,$ff,$ff,$ff,$ff,$ff   ; [$b648] byte
    .byte $00,$ff,$bd,$ff,$ff,$ff,$ff,$d4   ; [$b650] byte
    .byte $00,$ff,$fd,$ff,$ef,$ff,$df,$7f   ; [$b658] byte
    .byte $00,$ff,$32,$ff,$7f,$ff,$be,$fd   ; [$b660] byte
    .byte $00,$ff,$db,$ff,$bf,$ff,$7f,$ff   ; [$b668] byte
    .byte $00,$ff,$db,$ff,$fb,$ff,$9c,$fa   ; [$b670] byte
    .byte $00,$ff,$a5,$ff,$ff,$ff,$7f,$e3   ; [$b678] byte
    .byte $00,$ff,$bb,$ff,$df,$ff,$fb,$3f   ; [$b680] byte
    .byte $00,$ff,$e2,$ff,$fb,$ff,$fe,$e8   ; [$b688] byte
    .byte $00,$ff,$2b,$ff,$db,$ff,$ff,$de   ; [$b690] byte
    .byte $00,$ff,$3d,$ff,$ff,$ff,$ff,$cf   ; [$b698] byte
    .byte $00,$ff,$c9,$ff,$fd,$ff,$d7,$04   ; [$b6a0] byte
    .byte $00,$ff,$4b,$ff,$ff,$ff,$ff,$b3   ; [$b6a8] byte
    .byte $00,$ff,$59,$ff,$ff,$ff,$bf,$5e   ; [$b6b0] byte
    .byte $00,$ff,$fb,$ff,$bf,$ff,$ff,$a8   ; [$b6b8] byte
    .byte $00,$ff,$a2,$ff,$f7,$ff,$df,$fd   ; [$b6c0] byte
    .byte $00,$ff,$1f,$ff,$ff,$ff,$ff,$50   ; [$b6c8] byte
    .byte $00,$ff,$eb,$ff,$fb,$ff,$ff,$e3   ; [$b6d0] byte
    .byte $00,$ff,$f5,$ff,$ff,$ff,$ff,$e2   ; [$b6d8] byte
    .byte $00,$ff,$ae,$ff,$7c,$ff,$ef,$be   ; [$b6e0] byte
    .byte $00,$ff,$df,$ff,$fe,$ff,$ff,$d5   ; [$b6e8] byte
    .byte $00,$ff,$cd,$ff,$ff,$ff,$ff,$6e   ; [$b6f0] byte
    .byte $00,$ff,$7f,$ff,$fb,$ff,$ff,$14   ; [$b6f8] byte
    .byte $00,$ff,$b7,$ff,$6e,$ff,$ff,$5f   ; [$b700] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$df,$6b   ; [$b708] byte
    .byte $00,$ff,$77,$ff,$fd,$ff,$fd,$71   ; [$b710] byte
    .byte $00,$ff,$d9,$ff,$ef,$ff,$7f,$f7   ; [$b718] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$ff,$ce   ; [$b720] byte
    .byte $00,$ff,$af,$ff,$ff,$ff,$7f,$ff   ; [$b728] byte
    .byte $00,$ff,$d7,$ff,$ff,$ff,$ff,$85   ; [$b730] byte
    .byte $00,$ff,$ad,$ff,$ff,$ff,$f7,$eb   ; [$b738] byte
    .byte $00,$ff,$34,$ff,$7f,$ff,$b7,$b3   ; [$b740] byte
    .byte $01,$ff,$f7,$ff,$f7,$ff,$e1,$3d   ; [$b748] byte
    .byte $00,$ff,$cc,$ff,$ff,$ff,$fe,$ff   ; [$b750] byte
    .byte $00,$ff,$f6,$ff,$ee,$ff,$ff,$e7   ; [$b758] byte
    .byte $00,$ff,$77,$ff,$ff,$ff,$ef,$fb   ; [$b760] byte
    .byte $00,$ff,$33,$ff,$ff,$ff,$ff,$59   ; [$b768] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$fb,$59   ; [$b770] byte
    .byte $00,$ff,$fd,$ff,$ff,$ff,$ff,$77   ; [$b778] byte
    .byte $00,$ff,$b7,$ff,$ff,$ff,$ff,$b7   ; [$b780] byte
    .byte $00,$ff,$ca,$ff,$ff,$ff,$be,$3e   ; [$b788] byte
    .byte $00,$ff,$5f,$ff,$ff,$ff,$ff,$6b   ; [$b790] byte
    .byte $00,$ff,$7f,$ff,$df,$ff,$ff,$7d   ; [$b798] byte
    .byte $00,$ff,$ee,$ff,$7f,$ff,$bf,$cf   ; [$b7a0] byte
    .byte $00,$ff,$06,$ff,$ff,$ff,$f7,$3b   ; [$b7a8] byte
    .byte $00,$ff,$7b,$ff,$ff,$ff,$fe,$d4   ; [$b7b0] byte
    .byte $14,$ff,$1a,$ff,$fd,$ff,$db,$29   ; [$b7b8] byte
    .byte $00,$ff,$5f,$ff,$ff,$ff,$ef,$dc   ; [$b7c0] byte
    .byte $00,$ff,$a0,$ff,$ff,$ff,$ff,$8c   ; [$b7c8] byte
    .byte $00,$ff,$6d,$ff,$ef,$ff,$fb,$cb   ; [$b7d0] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$ff,$f0   ; [$b7d8] byte
    .byte $00,$ff,$3a,$ff,$fb,$ff,$df,$bd   ; [$b7e0] byte
    .byte $00,$ff,$ff,$ff,$fd,$ff,$ff,$ab   ; [$b7e8] byte
    .byte $00,$ff,$87,$ff,$ff,$ff,$ff,$d0   ; [$b7f0] byte
    .byte $00,$ff,$7f,$ff,$f9,$ff,$ff,$60   ; [$b7f8] byte
    .byte $04,$ff,$bf,$ff,$bf,$ff,$ff,$ca   ; [$b800] byte
    .byte $00,$ff,$cf,$ff,$ff,$ff,$ef,$f4   ; [$b808] byte
    .byte $00,$ff,$ff,$ff,$7f,$ff,$ff,$4b   ; [$b810] byte
    .byte $00,$ff,$f5,$ff,$fd,$ff,$ff,$ff   ; [$b818] byte
    .byte $00,$ff,$eb,$ff,$ff,$ff,$ff,$df   ; [$b820] byte
    .byte $01,$ff,$fe,$ff,$e7,$ff,$ff,$b9   ; [$b828] byte
    .byte $00,$ff,$7e,$ff,$ef,$ff,$ff,$22   ; [$b830] byte
    .byte $00,$ff,$bf,$ff,$f7,$ff,$ff,$af   ; [$b838] byte
    .byte $00,$ff,$a1,$ff,$ef,$ff,$fe,$ee   ; [$b840] byte
    .byte $00,$ff,$9b,$ff,$ff,$ff,$5f,$f6   ; [$b848] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$b6   ; [$b850] byte
    .byte $00,$ff,$3d,$ff,$ff,$ff,$ff,$f6   ; [$b858] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$fe,$70   ; [$b860] byte
    .byte $10,$ff,$f3,$ff,$7f,$ff,$ff,$f0   ; [$b868] byte
    .byte $00,$ff,$bf,$ff,$ff,$ff,$ff,$9f   ; [$b870] byte
    .byte $00,$ff,$fa,$ff,$ff,$ff,$fb,$c7   ; [$b878] byte
    .byte $00,$ff,$9c,$ff,$7d,$ff,$ff,$e8   ; [$b880] byte
    .byte $00,$ff,$f1,$ff,$fd,$ff,$f7,$1d   ; [$b888] byte
    .byte $00,$ff,$d6,$ff,$ff,$ff,$ff,$39   ; [$b890] byte
    .byte $40,$ff,$5a,$ff,$ff,$ff,$ff,$97   ; [$b898] byte
    .byte $00,$ff,$f4,$ff,$ff,$ff,$f6,$97   ; [$b8a0] byte
    .byte $00,$ff,$e7,$ff,$f7,$ff,$ff,$4a   ; [$b8a8] byte
    .byte $00,$ff,$9d,$ff,$ff,$ff,$6f,$b7   ; [$b8b0] byte
    .byte $00,$ff,$b7,$ff,$ff,$ff,$f7,$ea   ; [$b8b8] byte
    .byte $00,$ff,$8d,$ff,$7f,$ff,$ff,$8b   ; [$b8c0] byte
    .byte $00,$ff,$65,$ff,$ff,$ff,$fb,$37   ; [$b8c8] byte
    .byte $00,$ff,$cf,$ff,$ff,$ff,$bf,$1c   ; [$b8d0] byte
    .byte $00,$ff,$db,$ff,$ff,$ff,$ff,$a6   ; [$b8d8] byte
    .byte $00,$ff,$64,$ff,$2b,$ff,$bf,$e7   ; [$b8e0] byte
    .byte $00,$ff,$a7,$ff,$ff,$ff,$de,$5e   ; [$b8e8] byte
    .byte $00,$ff,$73,$ff,$ff,$ff,$ff,$b6   ; [$b8f0] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$ff,$ce   ; [$b8f8] byte
    .byte $00,$ff,$7c,$ff,$fb,$ff,$ff,$b0   ; [$b900] byte
    .byte $20,$ff,$ff,$ff,$ff,$ff,$ef,$fd   ; [$b908] byte
    .byte $00,$ff,$fd,$ff,$fd,$ff,$f7,$78   ; [$b910] byte
    .byte $00,$ff,$7d,$ff,$ff,$ff,$ff,$ee   ; [$b918] byte
    .byte $00,$ff,$fd,$ff,$ef,$ff,$ff,$be   ; [$b920] byte
    .byte $02,$ff,$f6,$ff,$f7,$ff,$f7,$9d   ; [$b928] byte
    .byte $00,$ff,$d7,$ff,$ff,$ff,$f7,$f5   ; [$b930] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$df,$af   ; [$b938] byte
    .byte $00,$ff,$f2,$ff,$df,$ff,$ff,$af   ; [$b940] byte
    .byte $00,$ff,$62,$ff,$df,$ff,$fd,$3f   ; [$b948] byte
    .byte $00,$ff,$f6,$ff,$ef,$ff,$ff,$36   ; [$b950] byte
    .byte $00,$ff,$dd,$ff,$ff,$ff,$be,$7d   ; [$b958] byte
    .byte $00,$ff,$fd,$ff,$cd,$ff,$ff,$eb   ; [$b960] byte
    .byte $00,$ff,$ce,$ff,$ff,$ff,$fb,$9a   ; [$b968] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$ff,$ec   ; [$b970] byte
    .byte $00,$ff,$5f,$ff,$7f,$ff,$fb,$e4   ; [$b978] byte
    .byte $00,$ff,$c5,$ff,$ff,$ff,$7f,$fc   ; [$b980] byte
    .byte $00,$ff,$3f,$ff,$e9,$ff,$fe,$ef   ; [$b988] byte
    .byte $00,$ff,$ff,$ff,$f7,$ff,$fb,$5a   ; [$b990] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$ff,$2e   ; [$b998] byte
    .byte $00,$ff,$e5,$ff,$f9,$ff,$ff,$d6   ; [$b9a0] byte
    .byte $00,$ff,$e5,$ff,$ff,$ff,$7f,$93   ; [$b9a8] byte
    .byte $00,$ff,$e3,$ff,$fe,$ff,$ff,$a6   ; [$b9b0] byte
    .byte $00,$ff,$f7,$ff,$f5,$ff,$ff,$ef   ; [$b9b8] byte
    .byte $00,$ff,$db,$ff,$df,$ff,$cf,$4b   ; [$b9c0] byte
    .byte $00,$ff,$88,$ff,$bf,$ff,$fe,$f1   ; [$b9c8] byte
    .byte $00,$ff,$ca,$ff,$ff,$ff,$fd,$a2   ; [$b9d0] byte
    .byte $00,$ff,$bf,$ff,$ff,$ff,$7f,$e8   ; [$b9d8] byte
    .byte $00,$ff,$04,$ff,$bd,$ff,$5d,$bf   ; [$b9e0] byte
    .byte $00,$ff,$4f,$ff,$fe,$ff,$ff,$7a   ; [$b9e8] byte
    .byte $00,$ff,$76,$ff,$df,$7f,$bf,$5b   ; [$b9f0] byte
    .byte $00,$ff,$7b,$ff,$ff,$ff,$ff,$62   ; [$b9f8] byte
    .byte $00,$ff,$d7,$ff,$fb,$ff,$3f,$7f   ; [$ba00] byte
    .byte $00,$ff,$de,$ff,$fe,$ff,$df,$74   ; [$ba08] byte
    .byte $00,$ff,$3a,$ff,$ff,$ff,$ff,$85   ; [$ba10] byte
    .byte $00,$ff,$54,$ff,$fd,$ff,$ef,$f6   ; [$ba18] byte
    .byte $00,$ff,$be,$ff,$df,$ff,$df,$ab   ; [$ba20] byte
    .byte $00,$ff,$ff,$ff,$f7,$ff,$ef,$ad   ; [$ba28] byte
    .byte $00,$ff,$f7,$ff,$ff,$ff,$ff,$f9   ; [$ba30] byte
    .byte $00,$ff,$3f,$ff,$ff,$ff,$ff,$76   ; [$ba38] byte
    .byte $00,$ff,$fb,$ff,$f5,$ff,$ef,$af   ; [$ba40] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$ff,$75   ; [$ba48] byte
    .byte $00,$ff,$8b,$ff,$ff,$ff,$df,$7c   ; [$ba50] byte
    .byte $00,$ff,$f7,$ff,$7f,$ff,$ff,$fb   ; [$ba58] byte
    .byte $00,$ff,$bd,$ff,$6f,$ff,$ed,$7c   ; [$ba60] byte
    .byte $00,$ff,$fc,$ff,$6f,$ff,$ff,$ef   ; [$ba68] byte
    .byte $00,$ff,$ff,$ff,$5f,$ff,$ff,$ed   ; [$ba70] byte
    .byte $00,$ff,$f8,$ff,$ff,$ff,$ff,$6c   ; [$ba78] byte
    .byte $00,$ff,$7b,$ff,$ff,$ff,$ff,$7e   ; [$ba80] byte
    .byte $00,$ff,$cb,$ff,$ff,$ff,$f3,$d3   ; [$ba88] byte
    .byte $00,$ff,$7e,$ff,$ff,$ff,$ff,$e8   ; [$ba90] byte
    .byte $00,$ff,$dd,$ff,$fd,$ff,$ff,$d3   ; [$ba98] byte
    .byte $00,$ff,$b7,$ff,$fe,$ff,$df,$72   ; [$baa0] byte
    .byte $00,$ff,$fd,$ff,$ff,$ff,$ef,$f1   ; [$baa8] byte
    .byte $00,$ff,$e9,$ff,$f3,$ff,$fb,$df   ; [$bab0] byte
    .byte $00,$ff,$7d,$ff,$ff,$ff,$ff,$30   ; [$bab8] byte
    .byte $00,$ff,$7e,$ff,$ff,$ff,$eb,$3d   ; [$bac0] byte
    .byte $00,$ff,$c7,$ff,$bf,$ff,$ff,$20   ; [$bac8] byte
    .byte $00,$ff,$fb,$ff,$ef,$ff,$df,$c0   ; [$bad0] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$ff,$73   ; [$bad8] byte
    .byte $00,$ff,$dd,$ff,$76,$ff,$fd,$ff   ; [$bae0] byte
    .byte $00,$ff,$ca,$ff,$3e,$ff,$ff,$bd   ; [$bae8] byte
    .byte $00,$ff,$fa,$ff,$7f,$ff,$f7,$b0   ; [$baf0] byte
    .byte $00,$ff,$71,$ff,$de,$ff,$fd,$d7   ; [$baf8] byte
    .byte $00,$ff,$bf,$ff,$ef,$ff,$7f,$35   ; [$bb00] byte
    .byte $00,$ff,$ad,$ff,$77,$ff,$fd,$9c   ; [$bb08] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$f7,$f9   ; [$bb10] byte
    .byte $00,$ff,$e6,$ff,$fd,$ff,$7f,$fe   ; [$bb18] byte
    .byte $04,$ff,$c3,$ff,$ac,$ff,$7f,$b8   ; [$bb20] byte
    .byte $00,$ff,$5d,$ff,$fd,$ff,$7f,$dd   ; [$bb28] byte
    .byte $00,$ff,$fd,$ff,$ff,$ff,$ff,$ff   ; [$bb30] byte
    .byte $00,$ff,$6d,$ff,$bb,$ff,$ff,$be   ; [$bb38] byte
    .byte $00,$ff,$ed,$ff,$ff,$ff,$f7,$b9   ; [$bb40] byte
    .byte $00,$ff,$6d,$ff,$ef,$ff,$ff,$ff   ; [$bb48] byte
    .byte $00,$ff,$fd,$ff,$ff,$ff,$f7,$fc   ; [$bb50] byte
    .byte $00,$ff,$ee,$ff,$7f,$ff,$ff,$d1   ; [$bb58] byte
    .byte $00,$ff,$ef,$ff,$b7,$ff,$f3,$b3   ; [$bb60] byte
    .byte $00,$ff,$7f,$ff,$fd,$ff,$ff,$b3   ; [$bb68] byte
    .byte $00,$ff,$6a,$ff,$ff,$ff,$ff,$f7   ; [$bb70] byte
    .byte $00,$ff,$f9,$ff,$ff,$ff,$ff,$c2   ; [$bb78] byte
    .byte $00,$ff,$c4,$ff,$ff,$ff,$ff,$a7   ; [$bb80] byte
    .byte $00,$ff,$c7,$ff,$fe,$ff,$ff,$55   ; [$bb88] byte
    .byte $00,$ff,$6d,$ff,$ff,$ff,$fe,$7f   ; [$bb90] byte
    .byte $00,$ff,$f2,$ff,$ff,$ff,$ff,$f8   ; [$bb98] byte
    .byte $00,$ff,$9f,$ff,$ff,$ff,$fb,$2e   ; [$bba0] byte
    .byte $00,$ff,$0b,$ff,$ff,$ff,$ef,$5f   ; [$bba8] byte
    .byte $00,$ff,$ff,$ff,$ef,$ff,$ef,$b1   ; [$bbb0] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$ff,$16   ; [$bbb8] byte
    .byte $00,$ff,$5f,$ff,$cf,$ff,$ff,$99   ; [$bbc0] byte
    .byte $01,$ff,$a0,$ff,$ff,$ff,$ff,$76   ; [$bbc8] byte
    .byte $00,$ff,$af,$ff,$ff,$ff,$bf,$9d   ; [$bbd0] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$ff,$fc   ; [$bbd8] byte
    .byte $00,$ff,$69,$ff,$3e,$ff,$b6,$4c   ; [$bbe0] byte
    .byte $00,$ff,$9f,$ff,$fb,$ff,$cf,$17   ; [$bbe8] byte
    .byte $00,$ff,$fb,$ff,$1f,$ff,$f7,$34   ; [$bbf0] byte
    .byte $00,$ff,$7e,$ff,$f3,$ff,$ff,$bc   ; [$bbf8] byte
    .byte $00,$ff,$db,$ff,$ff,$ff,$ef,$8e   ; [$bc00] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$7f,$be   ; [$bc08] byte
    .byte $00,$ff,$c9,$ff,$fd,$ff,$ff,$76   ; [$bc10] byte
    .byte $00,$ff,$77,$ff,$d3,$ff,$ef,$ef   ; [$bc18] byte
    .byte $00,$ff,$7f,$ff,$ff,$ff,$fe,$c9   ; [$bc20] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$ff,$7e   ; [$bc28] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$f7,$3b   ; [$bc30] byte
    .byte $00,$ff,$fb,$ff,$ff,$ff,$ff,$ff   ; [$bc38] byte
    .byte $00,$ff,$7a,$ff,$df,$ff,$7b,$e7   ; [$bc40] byte
    .byte $00,$ff,$fe,$ff,$ef,$ff,$ff,$17   ; [$bc48] byte
    .byte $00,$ff,$f3,$ff,$ff,$ff,$ff,$c3   ; [$bc50] byte
    .byte $00,$ff,$df,$ff,$f9,$ff,$ff,$3f   ; [$bc58] byte
    .byte $00,$ff,$cf,$ff,$bf,$ff,$ff,$ef   ; [$bc60] byte
    .byte $00,$ff,$cf,$ff,$fa,$ff,$df,$ab   ; [$bc68] byte
    .byte $00,$ff,$69,$ff,$de,$ff,$ff,$eb   ; [$bc70] byte
    .byte $00,$ff,$ff,$ff,$f6,$ff,$df,$7f   ; [$bc78] byte
    .byte $00,$ff,$fd,$ff,$b7,$ff,$ff,$7f   ; [$bc80] byte
    .byte $00,$ff,$5f,$ff,$f7,$ff,$bf,$9b   ; [$bc88] byte
    .byte $00,$ff,$fe,$ff,$ff,$ff,$fd,$ce   ; [$bc90] byte
    .byte $00,$ff,$fb,$ff,$fd,$ff,$ff,$7b   ; [$bc98] byte
    .byte $00,$ff,$01,$ff,$f7,$ff,$6f,$fc   ; [$bca0] byte
    .byte $00,$ff,$f8,$ff,$eb,$ff,$b7,$b1   ; [$bca8] byte
    .byte $00,$ff,$5f,$ff,$ff,$fd,$5f,$c2   ; [$bcb0] byte
    .byte $00,$ff,$df,$ff,$ff,$ff,$ff,$e2   ; [$bcb8] byte
    .byte $00,$ff,$4b,$ff,$ef,$ff,$fa,$b7   ; [$bcc0] byte
    .byte $00,$ff,$cc,$ff,$ff,$ff,$ff,$3d   ; [$bcc8] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$bf,$8f   ; [$bcd0] byte
    .byte $00,$ff,$7f,$ff,$bf,$ff,$ef,$2d   ; [$bcd8] byte
    .byte $00,$ff,$a3,$ff,$be,$ff,$ff,$2b   ; [$bce0] byte
    .byte $00,$ff,$54,$ff,$fb,$ff,$ff,$15   ; [$bce8] byte
    .byte $00,$ff,$4d,$ff,$ff,$ff,$ff,$2e   ; [$bcf0] byte
    .byte $00,$ff,$72,$ff,$ff,$ff,$fd,$fd   ; [$bcf8] byte
    .byte $00,$ff,$5b,$ff,$ff,$ff,$37,$7f   ; [$bd00] byte
    .byte $00,$ff,$d7,$ff,$fe,$ff,$ff,$72   ; [$bd08] byte
    .byte $00,$ff,$a7,$ff,$ff,$ff,$ff,$7f   ; [$bd10] byte
    .byte $00,$ff,$fe,$ff,$bf,$ff,$ff,$f3   ; [$bd18] byte
    .byte $00,$ff,$a5,$ff,$f7,$ff,$ff,$af   ; [$bd20] byte
    .byte $00,$ff,$ee,$ff,$ff,$ff,$f7,$1c   ; [$bd28] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$7f,$77   ; [$bd30] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$e9   ; [$bd38] byte
    .byte $80,$ff,$d4,$ff,$df,$ff,$ff,$db   ; [$bd40] byte
    .byte $00,$ff,$bb,$ff,$fb,$ff,$fb,$7e   ; [$bd48] byte
    .byte $00,$ff,$9f,$ff,$cb,$ff,$fd,$d7   ; [$bd50] byte
    .byte $00,$ff,$fa,$ff,$ff,$ff,$fe,$f7   ; [$bd58] byte
    .byte $00,$ff,$de,$ff,$ed,$ff,$f7,$05   ; [$bd60] byte
    .byte $00,$ff,$a7,$ff,$df,$ff,$ff,$de   ; [$bd68] byte
    .byte $00,$ff,$7b,$ff,$ff,$ff,$fd,$56   ; [$bd70] byte
    .byte $00,$ff,$71,$ff,$ff,$ff,$fe,$f1   ; [$bd78] byte
    .byte $00,$ff,$ef,$ff,$fd,$ff,$ff,$d7   ; [$bd80] byte
    .byte $00,$ff,$3f,$ff,$fb,$ff,$fe,$2f   ; [$bd88] byte
    .byte $00,$ff,$7e,$ff,$bb,$ff,$bf,$ff   ; [$bd90] byte
    .byte $00,$ff,$3d,$ff,$fb,$ff,$df,$3b   ; [$bd98] byte
    .byte $00,$ff,$ac,$ff,$ff,$ff,$fb,$57   ; [$bda0] byte
    .byte $00,$ff,$8c,$ff,$e7,$ff,$ee,$31   ; [$bda8] byte
    .byte $00,$ff,$cf,$ff,$ff,$ff,$fb,$e8   ; [$bdb0] byte
    .byte $00,$ff,$5d,$ff,$fd,$ff,$ff,$4c   ; [$bdb8] byte
    .byte $00,$ff,$d6,$ff,$ff,$ff,$f3,$99   ; [$bdc0] byte
    .byte $00,$ff,$f3,$ff,$ff,$ff,$bb,$7e   ; [$bdc8] byte
    .byte $00,$ff,$dd,$ff,$ff,$ff,$bf,$05   ; [$bdd0] byte
    .byte $00,$ff,$5e,$ff,$ff,$ff,$fe,$33   ; [$bdd8] byte
    .byte $00,$ff,$b6,$ff,$f7,$ff,$ff,$fe   ; [$bde0] byte
    .byte $00,$ff,$5e,$ff,$ff,$ff,$f9,$c6   ; [$bde8] byte
    .byte $00,$ff,$27,$ff,$ea,$ff,$bf,$62   ; [$bdf0] byte
    .byte $00,$ff,$fb,$ff,$ff,$ff,$ff,$28   ; [$bdf8] byte
    .byte $00,$ff,$ef,$ff,$ff,$ff,$fb,$6d   ; [$be00] byte
    .byte $00,$ff,$bb,$ff,$fb,$ff,$ff,$ff   ; [$be08] byte
    .byte $00,$ff,$3f,$ff,$ff,$ff,$fd,$fb   ; [$be10] byte
    .byte $00,$ff,$73,$ff,$f7,$ff,$ff,$b7   ; [$be18] byte
    .byte $00,$ff,$5c,$ff,$fb,$ff,$ff,$bf   ; [$be20] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$fc   ; [$be28] byte
    .byte $00,$ff,$5e,$ff,$bf,$ff,$ff,$f9   ; [$be30] byte
    .byte $00,$ff,$3a,$ff,$df,$ff,$fb,$5a   ; [$be38] byte
    .byte $00,$ff,$fd,$ff,$df,$ff,$ff,$99   ; [$be40] byte
    .byte $00,$ff,$77,$ff,$ff,$ff,$ff,$ba   ; [$be48] byte
    .byte $00,$ff,$fb,$ff,$bf,$ff,$ff,$ad   ; [$be50] byte
    .byte $00,$ff,$d5,$ff,$ff,$ff,$7f,$7c   ; [$be58] byte
    .byte $00,$ff,$e7,$ff,$6b,$ff,$be,$ff   ; [$be60] byte
    .byte $00,$ff,$d4,$ff,$ff,$ff,$ff,$72   ; [$be68] byte
    .byte $00,$ff,$df,$ff,$fa,$ff,$ab,$d9   ; [$be70] byte
    .byte $00,$ff,$fa,$ff,$7f,$ff,$fd,$67   ; [$be78] byte
    .byte $00,$ff,$7e,$ff,$ff,$ff,$e7,$39   ; [$be80] byte
    .byte $00,$ff,$d3,$ff,$ff,$ff,$ff,$dd   ; [$be88] byte
    .byte $00,$ff,$d7,$ff,$ff,$ff,$ef,$23   ; [$be90] byte
    .byte $00,$ff,$fd,$ff,$ff,$ff,$ff,$96   ; [$be98] byte
    .byte $00,$ff,$a6,$ff,$ff,$ff,$de,$3d   ; [$bea0] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$df,$ea   ; [$bea8] byte
    .byte $00,$ff,$c6,$ff,$7f,$ff,$fb,$b2   ; [$beb0] byte
    .byte $00,$ff,$6f,$ff,$ff,$ff,$ff,$3f   ; [$beb8] byte
    .byte $00,$ff,$12,$ff,$6f,$ff,$ff,$a7   ; [$bec0] byte
    .byte $00,$ff,$cb,$ff,$ff,$ff,$bf,$46   ; [$bec8] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$7f,$55   ; [$bed0] byte
    .byte $00,$ff,$1f,$ff,$ff,$ff,$ff,$29   ; [$bed8] byte
    .byte $00,$ff,$dc,$ff,$dd,$ff,$ef,$ff   ; [$bee0] byte
    .byte $00,$ff,$ce,$ff,$fd,$ff,$ff,$15   ; [$bee8] byte
    .byte $00,$ff,$ae,$ff,$ff,$ff,$ff,$bb   ; [$bef0] byte
    .byte $00,$ff,$d9,$ff,$cd,$ff,$ff,$68   ; [$bef8] byte
    .byte $00,$ff,$52,$ff,$de,$ff,$fd,$ed   ; [$bf00] byte
    .byte $00,$ff,$bf,$ff,$ff,$ff,$bf,$be   ; [$bf08] byte
    .byte $00,$ff,$b7,$ff,$ff,$ff,$ff,$df   ; [$bf10] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$ef,$6e   ; [$bf18] byte
    .byte $00,$ff,$3c,$ff,$ff,$ff,$fa,$bf   ; [$bf20] byte
    .byte $00,$ff,$f7,$ff,$ee,$ff,$ef,$c5   ; [$bf28] byte
    .byte $04,$ff,$9b,$ff,$ff,$ff,$ff,$df   ; [$bf30] byte
    .byte $01,$ff,$35,$ff,$ff,$ff,$ff,$fc   ; [$bf38] byte
    .byte $00,$ff,$ff,$ff,$df,$ff,$f7,$b9   ; [$bf40] byte
    .byte $00,$ff,$ff,$ff,$df,$ff,$fe,$bf   ; [$bf48] byte
    .byte $00,$ff,$ff,$ff,$ff,$ff,$bf,$72   ; [$bf50] byte
    .byte $00,$ff,$bd,$ff,$ff,$ff,$f7,$75   ; [$bf58] byte
    .byte $00,$ff,$aa,$ff,$f6,$ff,$bf,$d8   ; [$bf60] byte
    .byte $00,$ff,$ef,$ff,$fb,$ff,$ff,$c4   ; [$bf68] byte
    .byte $00,$ff,$bf,$ff,$bf,$ff,$fc,$8b   ; [$bf70] byte
    .byte $00,$ff,$fe,$ff,$d7,$ff,$fe,$bb   ; [$bf78] byte
    .byte $00,$ff,$18,$ff,$bf,$ff,$fe,$c5   ; [$bf80] byte
    .byte $00,$ff,$7b,$ff,$ff,$ff,$fb,$ba   ; [$bf88] byte
    .byte $00,$ff,$7d,$ff,$ff,$ff,$ff,$3f   ; [$bf90] byte
    .byte $00,$ff,$76,$ff,$ff,$ff,$ff,$73   ; [$bf98] byte
    .byte $00,$ff,$2e,$ff,$fd,$ff,$f7,$fb   ; [$bfa0] byte
    .byte $00,$ff,$fe,$ff,$fd,$ff,$77,$99   ; [$bfa8] byte
    .byte $00,$ff,$d5,$ff,$dd,$ff,$ff,$67   ; [$bfb0] byte
    .byte $00,$ff,$bf,$ff,$ff,$ff,$df,$46   ; [$bfb8] byte
    .byte $00,$ff,$31,$ff,$9f,$ff,$fa,$bd   ; [$bfc0] byte
    .byte $00,$ff,$48,$ff,$ff,$ff,$ff,$86   ; [$bfc8] byte
    .byte $00,$ff,$3f,$ff,$ff,$ff,$ff,$8e   ; [$bfd0] byte
    .byte $00,$ff,$f3,$ff,$ff,$ff,$ff,$8e   ; [$bfd8] byte
    .byte $00,$ff,$98,$ff,$9b,$ff,$bf,$91   ; [$bfe0] byte
    .byte $00,$ff,$e7,$ff,$b7,$ff,$b7,$c0   ; [$bfe8] byte
    .byte $00,$ff,$af,$ff,$ff,$ff,$bf,$2b   ; [$bff0] byte
    .byte $00,$ff,$fb,$ff,$f7,$ff,$fe,$d2   ; [$bff8] byte
