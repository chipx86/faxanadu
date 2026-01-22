;============================================================================
; Faxanadu (U).nes
;
; PRG1 ($8000 - $bfff)
;============================================================================

    .segment "PRG1"
    .reloc

    bank_offset_16 TRUNK_BLOCKS             ; Trunk
    bank_offset_16 BRANCH_BLOCKS            ; Branch

TRUNK_BLOCKS:                               ; [$8004]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_00_27 ; TRUNK_BLOCKS_SCREEN_00_27
                                             ; [$PRG1::8004]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_01   ; TRUNK_BLOCKS_SCREEN_01
                                            ; [$PRG1::8006]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_02   ; TRUNK_BLOCKS_SCREEN_02
                                            ; [$PRG1::8008]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_03   ; TRUNK_BLOCKS_SCREEN_03
                                            ; [$PRG1::800a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_04   ; TRUNK_BLOCKS_SCREEN_04
                                            ; [$PRG1::800c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_05   ; TRUNK_BLOCKS_SCREEN_05
                                            ; [$PRG1::800e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_06   ; TRUNK_BLOCKS_SCREEN_06
                                            ; [$PRG1::8010]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_07   ; TRUNK_BLOCKS_SCREEN_07
                                            ; [$PRG1::8012]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_08   ; TRUNK_BLOCKS_SCREEN_08
                                            ; [$PRG1::8014]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_09   ; TRUNK_BLOCKS_SCREEN_09
                                            ; [$PRG1::8016]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_10   ; TRUNK_BLOCKS_SCREEN_10
                                            ; [$PRG1::8018]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_11   ; TRUNK_BLOCKS_SCREEN_11
                                            ; [$PRG1::801a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_12   ; TRUNK_BLOCKS_SCREEN_12
                                            ; [$PRG1::801c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_13   ; TRUNK_BLOCKS_SCREEN_13
                                            ; [$PRG1::801e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_14   ; TRUNK_BLOCKS_SCREEN_14
                                            ; [$PRG1::8020]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_15   ; TRUNK_BLOCKS_SCREEN_15
                                            ; [$PRG1::8022]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_16   ; TRUNK_BLOCKS_SCREEN_16
                                            ; [$PRG1::8024]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_17   ; TRUNK_BLOCKS_SCREEN_17
                                            ; [$PRG1::8026]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_18   ; TRUNK_BLOCKS_SCREEN_18
                                            ; [$PRG1::8028]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_19   ; TRUNK_BLOCKS_SCREEN_19
                                            ; [$PRG1::802a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_20   ; TRUNK_BLOCKS_SCREEN_20
                                            ; [$PRG1::802c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_21   ; TRUNK_BLOCKS_SCREEN_21
                                            ; [$PRG1::802e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_22   ; TRUNK_BLOCKS_SCREEN_22
                                            ; [$PRG1::8030]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_23   ; TRUNK_BLOCKS_SCREEN_23
                                            ; [$PRG1::8032]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_24   ; TRUNK_BLOCKS_SCREEN_24
                                            ; [$PRG1::8034]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_25   ; TRUNK_BLOCKS_SCREEN_25
                                            ; [$PRG1::8036]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_26   ; TRUNK_BLOCKS_SCREEN_26
                                            ; [$PRG1::8038]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_00_27 ; TRUNK_BLOCKS_SCREEN_00_27
                                             ; [$PRG1::803a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_28   ; TRUNK_BLOCKS_SCREEN_28
                                            ; [$PRG1::803c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_29   ; TRUNK_BLOCKS_SCREEN_29
                                            ; [$PRG1::803e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_30   ; TRUNK_BLOCKS_SCREEN_30
                                            ; [$PRG1::8040]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_31   ; TRUNK_BLOCKS_SCREEN_31
                                            ; [$PRG1::8042]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_32   ; TRUNK_BLOCKS_SCREEN_32
                                            ; [$PRG1::8044]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_33   ; TRUNK_BLOCKS_SCREEN_33
                                            ; [$PRG1::8046]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_34   ; TRUNK_BLOCKS_SCREEN_34
                                            ; [$PRG1::8048]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_35   ; TRUNK_BLOCKS_SCREEN_35
                                            ; [$PRG1::804a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_36   ; TRUNK_BLOCKS_SCREEN_36
                                            ; [$PRG1::804c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_37   ; TRUNK_BLOCKS_SCREEN_37
                                            ; [$PRG1::804e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_38   ; TRUNK_BLOCKS_SCREEN_38
                                            ; [$PRG1::8050]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_39   ; TRUNK_BLOCKS_SCREEN_39
                                            ; [$PRG1::8052]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_40   ; TRUNK_BLOCKS_SCREEN_40
                                            ; [$PRG1::8054]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_41   ; TRUNK_BLOCKS_SCREEN_41
                                            ; [$PRG1::8056]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_42   ; TRUNK_BLOCKS_SCREEN_42
                                            ; [$PRG1::8058]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_43   ; TRUNK_BLOCKS_SCREEN_43
                                            ; [$PRG1::805a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_44   ; TRUNK_BLOCKS_SCREEN_44
                                            ; [$PRG1::805c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_45   ; TRUNK_BLOCKS_SCREEN_45
                                            ; [$PRG1::805e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_46   ; TRUNK_BLOCKS_SCREEN_46
                                            ; [$PRG1::8060]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_47   ; TRUNK_BLOCKS_SCREEN_47
                                            ; [$PRG1::8062]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_48   ; TRUNK_BLOCKS_SCREEN_48
                                            ; [$PRG1::8064]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_49   ; TRUNK_BLOCKS_SCREEN_49
                                            ; [$PRG1::8066]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_50   ; TRUNK_BLOCKS_SCREEN_50
                                            ; [$PRG1::8068]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_51   ; TRUNK_BLOCKS_SCREEN_51
                                            ; [$PRG1::806a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_52   ; TRUNK_BLOCKS_SCREEN_52
                                            ; [$PRG1::806c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_53   ; TRUNK_BLOCKS_SCREEN_53
                                            ; [$PRG1::806e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_54   ; TRUNK_BLOCKS_SCREEN_54
                                            ; [$PRG1::8070]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_55   ; TRUNK_BLOCKS_SCREEN_55
                                            ; [$PRG1::8072]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_56   ; TRUNK_BLOCKS_SCREEN_56
                                            ; [$PRG1::8074]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_57   ; TRUNK_BLOCKS_SCREEN_57
                                            ; [$PRG1::8076]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_58   ; TRUNK_BLOCKS_SCREEN_58
                                            ; [$PRG1::8078]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_59   ; TRUNK_BLOCKS_SCREEN_59
                                            ; [$PRG1::807a]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_60   ; TRUNK_BLOCKS_SCREEN_60
                                            ; [$PRG1::807c]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_61   ; TRUNK_BLOCKS_SCREEN_61
                                            ; [$PRG1::807e]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_62   ; TRUNK_BLOCKS_SCREEN_62
                                            ; [$PRG1::8080]
    bank_offset_16 TRUNK_BLOCKS_SCREEN_63   ; TRUNK_BLOCKS_SCREEN_63
                                            ; [$PRG1::8082]

;
; XREFS:
;     TRUNK_BLOCKS [$PRG1::8004]
;
TRUNK_BLOCKS_SCREEN_00_27:                  ; [$8084]
    .byte $c0,$40,$00,$00,$36,$2c,$4f,$17   ; [$8084] byte
    .byte $40,$00,$00,$15,$40,$00,$00,$15   ; [$808c] byte
    .byte $40,$00,$00,$15,$c2,$10,$00,$03   ; [$8094] byte
    .byte $02,$c0,$f0,$60,$c6,$10,$00,$30   ; [$809c] byte
    .byte $2c,$0f,$06,$31,$ec,$8b,$24,$50   ; [$80a4] byte
    .byte $03,$02,$c0,$f0,$63,$0a,$c7,$b1   ; [$80ac] byte
    .byte $dc,$28,$c2,$04,$30,$2c,$0f,$06   ; [$80b4] byte
    .byte $03,$15,$c7,$6c,$93,$1e,$d4,$31   ; [$80bc] byte
    .byte $87,$02,$c0,$f0,$6c,$3f,$1e,$32   ; [$80c4] byte
    .byte $2c,$9f,$28,$c9,$b0,$6c,$2b,$06   ; [$80cc] byte
    .byte $d6,$70,$8c,$0f,$06,$c7,$b2,$c0   ; [$80d4] byte
    .byte $31,$6c,$a7,$2a,$c1,$b0,$fc,$78   ; [$80dc] byte
    .byte $d5,$33,$1c,$1f,$0e,$c2,$f0,$cc   ; [$80e4] byte
    .byte $2f,$0c,$c3,$70,$63,$0f,$c1,$f0   ; [$80ec] byte
    .byte $ec,$18,$d5,$71,$5c,$93,$15,$c9   ; [$80f4] byte
    .byte $31,$dc,$88,$32,$7c,$1f,$0e,$c5   ; [$80fc] byte
    .byte $70,$93,$1d,$c2,$00,$00,$00,$00   ; [$8104] byte

TRUNK_BLOCKS_SCREEN_01:                     ; [$810c]
    .byte $c4,$f0,$8c,$04,$00,$00,$00,$71   ; [$810c] byte
    .byte $84,$00,$00,$00,$5c,$21,$00,$00   ; [$8114] byte
    .byte $00,$71,$b7,$1b,$c2,$10,$00,$30   ; [$811c] byte
    .byte $2c,$10,$c4,$33,$1c,$c1,$41,$30   ; [$8124] byte
    .byte $2c,$13,$05,$c0,$f0,$60,$c7,$70   ; [$812c] byte
    .byte $7c,$3b,$31,$cc,$35,$0c,$63,$02   ; [$8134] byte
    .byte $c0,$f0,$63,$0f,$c1,$f0,$ec,$28   ; [$813c] byte
    .byte $c6,$70,$60,$c2,$b0,$fc,$23,$06   ; [$8144] byte
    .byte $30,$fc,$1f,$0e,$c1,$84,$c7,$71   ; [$814c] byte
    .byte $ec,$28,$c7,$72,$2c,$c7,$22,$c1   ; [$8154] byte
    .byte $f0,$ec,$1b,$15,$c7,$71,$ec,$93   ; [$815c] byte
    .byte $1e,$c1,$8c,$57,$07,$ca,$43,$2a   ; [$8164] byte
    .byte $c2,$b2,$2c,$9f,$28,$c9,$b0,$6c   ; [$816c] byte
    .byte $2b,$06,$c7,$71,$ec,$77,$0f,$c7   ; [$8174] byte
    .byte $b2,$20,$c1,$f0,$ec,$2f,$0c,$c1   ; [$817c] byte
    .byte $b0,$fc,$78,$8c,$2f,$0c,$c1,$8c   ; [$8184] byte
    .byte $2f,$0c,$c1,$83,$0f,$c1,$f0,$ec   ; [$818c] byte
    .byte $18,$b1,$5c,$77,$1e,$31,$dc,$78   ; [$8194] byte
    .byte $c7,$72,$7c,$1f,$0e,$c5,$70,$93   ; [$819c] byte
    .byte $1d,$c2,$00,$00,$00,$00           ; [$81a4] byte

TRUNK_BLOCKS_SCREEN_02:                     ; [$81aa]
    .byte $c0,$4d,$8b,$08,$c4,$31,$3c,$04   ; [$81aa] byte
    .byte $00,$00,$07,$2b,$c6,$f0,$84,$00   ; [$81b2] byte
    .byte $00,$30,$2c,$5f,$18,$a9,$00,$30   ; [$81ba] byte
    .byte $2c,$14,$c0,$f0,$63,$3d,$b0,$8a   ; [$81c2] byte
    .byte $c6,$f0,$8c,$13,$05,$c0,$f0,$60   ; [$81ca] byte
    .byte $c4,$30,$a3,$08,$95,$d3,$f3,$0c   ; [$81d2] byte
    .byte $18,$00,$c2,$83,$31,$8d,$3f,$30   ; [$81da] byte
    .byte $30,$6c,$29,$c2,$9c,$3f,$07,$c6   ; [$81e2] byte
    .byte $70,$60,$b3,$0d,$33,$0a,$c1,$b0   ; [$81ea] byte
    .byte $fc,$88,$30,$7c,$3b,$0a,$c7,$71   ; [$81f2] byte
    .byte $e3,$1d,$c8,$b1,$e0,$c1,$f2,$90   ; [$81fa] byte
    .byte $ca,$b0,$a3,$06,$0c,$2b,$2e,$cb   ; [$8202] byte
    .byte $f2,$1c,$1b,$0a,$32,$2c,$90,$c2   ; [$820a] byte
    .byte $80,$c7,$71,$ec,$76,$c1,$b2,$ec   ; [$8212] byte
    .byte $bf,$22,$c1,$f0,$ec,$18,$30,$fc   ; [$821a] byte
    .byte $78,$c1,$8c,$2f,$0c,$43,$0d,$c1   ; [$8222] byte
    .byte $83,$0f,$c1,$f0,$ec,$18,$b1,$5c   ; [$822a] byte
    .byte $77,$1e,$31,$dc,$78,$c7,$72,$7c   ; [$8232] byte
    .byte $1f,$0e,$c5,$70,$93,$1d,$c2,$00   ; [$823a] byte
    .byte $00,$00,$00                       ; [$8242] byte

TRUNK_BLOCKS_SCREEN_03:                     ; [$8245]
    .byte $c0,$4d,$8b,$10,$c4,$f1,$fc,$5f   ; [$8245] byte
    .byte $10,$c6,$32,$0c,$60,$00,$45,$55   ; [$824d] byte
    .byte $cf,$5c,$f4,$04,$c1,$70,$3c,$5d   ; [$8255] byte
    .byte $71,$65,$c2,$1c,$20,$04,$c1,$81   ; [$825d] byte
    .byte $c3,$70,$6c,$40,$cc,$50,$14,$c3   ; [$8265] byte
    .byte $f0,$7c,$29,$0c,$3f,$07,$c3,$ac   ; [$826d] byte
    .byte $c0,$54,$c3,$b0,$a1,$00,$31,$d3   ; [$8275] byte
    .byte $22,$5c,$f5,$c2,$b0,$60,$c5,$72   ; [$827d] byte
    .byte $20,$30,$fc,$1f,$0e,$49,$c7,$b1   ; [$8285] byte
    .byte $dc,$7b,$1d,$c1,$f0,$ec,$2f,$0c   ; [$828d] byte
    .byte $cb,$b2,$fc,$77,$1e,$cc,$55,$c1   ; [$8295] byte
    .byte $8c,$2b,$0c,$c2,$8c,$1b,$0a,$32   ; [$829d] byte
    .byte $2c,$90,$c2,$97,$3d,$c7,$71,$ec   ; [$82a5] byte
    .byte $76,$c1,$b1,$ec,$77,$22,$c1,$f0   ; [$82ad] byte
    .byte $ec,$18,$33,$14,$c1,$8c,$2f,$0c   ; [$82b5] byte
    .byte $43,$0d,$c3,$f2,$23,$0f,$c1,$f0   ; [$82bd] byte
    .byte $e4,$c7,$b1,$5c,$77,$1e,$32,$23   ; [$82c5] byte
    .byte $07,$ca,$43,$0e,$c5,$70,$94,$00   ; [$82cd] byte
    .byte $00,$00,$00                       ; [$82d5] byte

TRUNK_BLOCKS_SCREEN_04:                     ; [$82d8]
    .byte $c0,$40,$00,$00,$0c,$5f,$10,$40   ; [$82d8] byte
    .byte $00,$c0,$b0,$50,$07,$24,$40,$0c   ; [$82e0] byte
    .byte $0b,$03,$c1,$80,$31,$03,$25,$40   ; [$82e8] byte
    .byte $c0,$b0,$3c,$40,$70,$fc,$55,$13   ; [$82f0] byte
    .byte $22,$4c,$0b,$03,$c4,$0c,$3f,$07   ; [$82f8] byte
    .byte $c3,$b0,$d3,$0a,$70,$a7,$25,$4d   ; [$8300] byte
    .byte $8b,$10,$0c,$18,$c8,$b1,$d3,$22   ; [$8308] byte
    .byte $c7,$71,$e7,$24,$47,$06,$c5,$72   ; [$8310] byte
    .byte $23,$07,$ca,$72,$ac,$1b,$0b,$c3   ; [$8318] byte
    .byte $30,$d7,$25,$47,$1d,$c1,$f2,$9c   ; [$8320] byte
    .byte $3b,$15,$b2,$fc,$77,$1e,$c9,$0c   ; [$8328] byte
    .byte $56,$47,$0c,$c5,$72,$7c,$1e,$c1   ; [$8330] byte
    .byte $80,$c2,$b2,$51,$47,$0a,$c4,$f1   ; [$8338] byte
    .byte $fc,$5f,$22,$c1,$f0,$e4,$30,$fc   ; [$8340] byte
    .byte $40,$47,$0c,$57,$0d,$c3,$f2,$23   ; [$8348] byte
    .byte $0f,$c1,$f0,$ec,$18,$47,$1e,$57   ; [$8350] byte
    .byte $07,$ca,$72,$0c,$a7,$0e,$c5,$70   ; [$8358] byte
    .byte $9c,$88,$47,$08,$00,$1c,$20,$00   ; [$8360] byte

TRUNK_BLOCKS_SCREEN_05:                     ; [$8368]
    .byte $c4,$f1,$7c,$43,$0a,$c4,$31,$3c   ; [$8368] byte
    .byte $04,$c0,$b0,$3c,$18,$c6,$f0,$8c   ; [$8370] byte
    .byte $6f,$08,$57,$1e,$5c,$0b,$08,$c6   ; [$8378] byte
    .byte $f0,$8c,$6f,$08,$55,$c9,$70,$a3   ; [$8380] byte
    .byte $1b,$c2,$31,$bc,$23,$1b,$aa,$aa   ; [$8388] byte
    .byte $c7,$b1,$d7,$5a,$d4,$2d,$3f,$28   ; [$8390] byte
    .byte $d4,$2d,$3f,$57,$d4,$2d,$3f,$57   ; [$8398] byte
    .byte $c2,$83,$10,$d4,$72,$bc,$8f,$42   ; [$83a0] byte
    .byte $d0,$72,$bc,$8f,$42,$32,$bc,$8f   ; [$83a8] byte
    .byte $42,$c7,$85,$35,$3c,$c9,$ce,$75   ; [$83b0] byte
    .byte $35,$35,$35,$c4,$30,$a3,$06,$c5   ; [$83b8] byte
    .byte $73,$dd,$33,$2e,$d4,$73,$d5,$33   ; [$83c0] byte
    .byte $d5,$53,$0f,$c1,$f3,$17,$06,$32   ; [$83c8] byte
    .byte $ec,$c9,$07,$45,$5c,$1f,$0e,$c1   ; [$83d0] byte
    .byte $b0,$a0,$40,$c2,$b2,$53,$10,$c1   ; [$83d8] byte
    .byte $80,$c2,$83,$22,$c1,$f0,$e4,$30   ; [$83e0] byte
    .byte $fc,$40,$4c,$2b,$0c,$8c,$5f,$0d   ; [$83e8] byte
    .byte $c3,$f2,$23,$0f,$c1,$f0,$ec,$18   ; [$83f0] byte
    .byte $c8,$83,$1e,$31,$dc,$7b,$07,$ca   ; [$83f8] byte
    .byte $43,$0e,$c5,$70,$9c,$88,$c2,$0c   ; [$8400] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$8408] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$8410] byte
    .byte $08                               ; [$8418] byte

TRUNK_BLOCKS_SCREEN_06:                     ; [$8419]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$8419] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c7   ; [$8421] byte
    .byte $f4,$23,$08,$55,$57,$4f,$d5,$f5   ; [$8429] byte
    .byte $9d,$73,$5a,$53,$2b,$aa,$ab,$4b   ; [$8431] byte
    .byte $d7,$b6,$0d,$87,$60,$d7,$f4,$97   ; [$8439] byte
    .byte $53,$d4,$1d,$3f,$28,$d4,$1d,$3f   ; [$8441] byte
    .byte $40,$d6,$31,$7c,$c7,$13,$d6,$f4   ; [$8449] byte
    .byte $a7,$3d,$d0,$b2,$bc,$8f,$4a,$d0   ; [$8451] byte
    .byte $72,$bc,$8f,$42,$d0,$5c,$41,$d2   ; [$8459] byte
    .byte $74,$23,$08,$75,$37,$42,$35,$35   ; [$8461] byte
    .byte $ce,$5d,$52,$cb,$b5,$17,$48,$73   ; [$8469] byte
    .byte $d5,$33,$d5,$d1,$5d,$55,$c7,$b1   ; [$8471] byte
    .byte $dc,$83,$51,$25,$0c,$5b,$0e,$c6   ; [$8479] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$87,$1b   ; [$8481] byte
    .byte $c4,$32,$ed,$45,$d1,$70,$ec,$28   ; [$8489] byte
    .byte $d6,$73,$00,$07,$30,$4c,$1b,$25   ; [$8491] byte
    .byte $c1,$b0,$a3,$22,$c1,$f0,$ec,$2b   ; [$8499] byte
    .byte $0f,$c4,$35,$b7,$1c,$c1,$8c,$2b   ; [$84a1] byte
    .byte $0c,$4c,$5f,$0d,$c3,$f2,$2c,$1f   ; [$84a9] byte
    .byte $0e,$c4,$f1,$fd,$23,$4a,$c8,$83   ; [$84b1] byte
    .byte $1e,$31,$dc,$7b,$07,$ca,$70,$ec   ; [$84b9] byte
    .byte $40,$5d,$08,$c2,$31,$bc,$23,$1b   ; [$84c1] byte
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$84c9] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b       ; [$84d1] byte

TRUNK_BLOCKS_SCREEN_07:                     ; [$84d8]
    .byte $d3,$f5,$0c,$23,$4f,$d4,$30,$8d   ; [$84d8] byte
    .byte $3f,$28,$35,$0c,$6f,$08,$c6,$f0   ; [$84e0] byte
    .byte $8c,$6f,$08,$c8,$f5,$73,$4b,$c7   ; [$84e8] byte
    .byte $35,$7d,$2f,$1c,$d0,$34,$1d,$5f   ; [$84f0] byte
    .byte $2b,$00,$74,$20,$33,$9d,$03,$42   ; [$84f8] byte
    .byte $33,$93,$3d,$00,$50,$0d,$06,$4d   ; [$8500] byte
    .byte $07,$1b,$c2,$31,$bc,$23,$1b,$50   ; [$8508] byte
    .byte $00,$0c,$e7,$08,$aa,$50,$33,$91   ; [$8510] byte
    .byte $07,$1b,$aa,$d0,$80,$34,$1d,$01   ; [$8518] byte
    .byte $07,$08,$aa,$0c,$bb,$51,$40,$07   ; [$8520] byte
    .byte $84,$d3,$f5,$0e,$08,$cc,$0c,$87   ; [$8528] byte
    .byte $27,$d2,$50,$0d,$05,$ca,$35,$74   ; [$8530] byte
    .byte $c7,$00,$d2,$90,$0c,$e5,$d2,$f4   ; [$8538] byte
    .byte $84,$d0,$80,$00,$ce,$55,$d2,$73   ; [$8540] byte
    .byte $97,$83,$40,$03,$41,$d0,$15,$55   ; [$8548] byte
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$8550] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$c2   ; [$8558] byte
    .byte $31,$bc,$23,$1b                   ; [$8560] byte

TRUNK_BLOCKS_SCREEN_08:                     ; [$8564]
    .byte $c6,$f0,$8c,$6f,$08,$d5,$c0,$35   ; [$8564] byte
    .byte $0c,$23,$4f,$d5,$cd,$8b,$10,$ca   ; [$856c] byte
    .byte $c0,$c7,$f4,$ad,$08,$0c,$af,$23   ; [$8574] byte
    .byte $d0,$85,$cf,$40,$74,$20,$0d,$4d   ; [$857c] byte
    .byte $47,$24,$c2,$31,$bc,$20,$73,$94   ; [$8584] byte
    .byte $0c,$f5,$47,$1d,$c6,$e9,$c6,$f0   ; [$858c] byte
    .byte $8c,$6f,$08,$d2,$5c,$21,$47,$25   ; [$8594] byte
    .byte $c2,$2a,$b4,$fd,$5c,$51,$47,$10   ; [$859c] byte
    .byte $c6,$ea,$34,$9d,$08,$00,$07,$1d   ; [$85a4] byte
    .byte $e0,$8d,$3f,$50,$e1,$14,$ce,$50   ; [$85ac] byte
    .byte $07,$0e,$4c,$a3,$49,$54,$73,$84   ; [$85b4] byte
    .byte $07,$10,$45,$54,$d0,$69,$d1,$70   ; [$85bc] byte
    .byte $ec,$1b,$1e,$e0,$d5,$54,$ce,$74   ; [$85c4] byte
    .byte $2d,$17,$0e,$c1,$b1,$0c,$1f,$0e   ; [$85cc] byte
    .byte $55,$5d,$17,$0e,$c2,$f0,$cc,$78   ; [$85d4] byte
    .byte $c8,$83,$09,$c2,$31,$bc,$23,$1b   ; [$85dc] byte
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$85e4] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b       ; [$85ec] byte

TRUNK_BLOCKS_SCREEN_09:                     ; [$85f3]
    .byte $c4,$0d,$6f,$57,$35,$0c,$6f,$4f   ; [$85f3] byte
    .byte $d5,$c0,$35,$0c,$6f,$4f,$71,$3d   ; [$85fb] byte
    .byte $2f,$42,$34,$1c,$af,$23,$d0,$80   ; [$8603] byte
    .byte $34,$1c,$af,$23,$5d,$25,$33,$9d   ; [$860b] byte
    .byte $4d,$73,$9c,$e1,$33,$9d,$4d,$55   ; [$8613] byte
    .byte $0c,$f5,$d0,$34,$1d,$08,$1c,$f5   ; [$861b] byte
    .byte $55,$01,$d0,$b3,$94,$03,$39,$5d   ; [$8623] byte
    .byte $2d,$00,$ce,$60,$00,$c7,$9c,$cb   ; [$862b] byte
    .byte $49,$40,$33,$84,$00,$cb,$b0,$6c   ; [$8633] byte
    .byte $5f,$2e,$d4,$50,$ce,$69,$00,$c1   ; [$863b] byte
    .byte $b1,$07,$10,$c1,$b2,$ed,$45,$73   ; [$8643] byte
    .byte $8a,$40,$c1,$dc,$7b,$1d,$31,$0c   ; [$864b] byte
    .byte $1b,$2e,$d4,$6a,$0d,$17,$0e,$c4   ; [$8653] byte
    .byte $0c,$18,$c9,$72,$48,$c1,$b0,$d0   ; [$865b] byte
    .byte $0c,$1b,$0f,$c8,$8c,$7b,$0f,$c9   ; [$8663] byte
    .byte $31,$dc,$79,$23,$0f,$c8,$83,$09   ; [$866b] byte
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$8673] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$c2   ; [$867b] byte
    .byte $31,$bc,$23,$1b                   ; [$8683] byte

TRUNK_BLOCKS_SCREEN_10:                     ; [$8687]
    .byte $d6,$31,$ec,$43,$15,$d6,$f5,$0c   ; [$8687] byte
    .byte $6f,$4f,$d6,$31,$7c,$40,$d6,$f5   ; [$868f] byte
    .byte $0c,$6f,$4f,$ce,$71,$7c,$57,$13   ; [$8697] byte
    .byte $d2,$74,$1c,$af,$23,$d0,$b6,$2c   ; [$869f] byte
    .byte $93,$13,$d2,$74,$1c,$af,$23,$d0   ; [$86a7] byte
    .byte $9c,$39,$73,$9d,$4d,$5c,$1d,$73   ; [$86af] byte
    .byte $9d,$4d,$ce,$5c,$29,$74,$2c,$f5   ; [$86b7] byte
    .byte $d0,$1c,$91,$5c,$f5,$d0,$9c,$75   ; [$86bf] byte
    .byte $51,$d0,$9c,$3d,$74,$23,$39,$1c   ; [$86c7] byte
    .byte $95,$50,$ce,$5c,$91,$50,$5c,$75   ; [$86cf] byte
    .byte $50,$1c,$35,$50,$5c,$79,$cc,$90   ; [$86d7] byte
    .byte $c9,$b0,$6c,$75,$50,$d1,$5c,$2f   ; [$86df] byte
    .byte $10,$c1,$b2,$ed,$47,$26,$c1,$b1   ; [$86e7] byte
    .byte $0c,$97,$10,$cb,$b5,$17,$45,$c1   ; [$86ef] byte
    .byte $f1,$0c,$7b,$1d,$31,$ec,$8b,$06   ; [$86f7] byte
    .byte $c3,$cc,$7b,$1d,$c3,$f1,$0c,$37   ; [$86ff] byte
    .byte $06,$c4,$0c,$18,$c3,$f0,$7c,$3b   ; [$8707] byte
    .byte $10,$b0,$bc,$33,$10,$53,$0f,$c8   ; [$870f] byte
    .byte $8c,$7b,$0f,$c9,$31,$dc,$7b,$06   ; [$8717] byte
    .byte $b0,$fc,$7b,$0f,$c8,$83,$09,$c2   ; [$871f] byte
    .byte $31,$bc,$23,$1b,$c2,$31,$bc,$23   ; [$8727] byte
    .byte $1b,$c2,$31,$bc,$23,$1b,$c2,$31   ; [$872f] byte
    .byte $bc,$23,$1b                       ; [$8737] byte

TRUNK_BLOCKS_SCREEN_11:                     ; [$873a]
    .byte $d5,$c0,$d6,$31,$73,$64,$d3,$31   ; [$873a] byte
    .byte $7c,$43,$64,$d3,$31,$0d,$6f,$57   ; [$8742] byte
    .byte $ce,$74,$20,$2d,$7b,$60,$d7,$ed   ; [$874a] byte
    .byte $7b,$60,$d7,$f5,$bc,$7f,$42,$00   ; [$8752] byte
    .byte $33,$9b,$59,$d7,$b6,$0d,$7f,$5a   ; [$875a] byte
    .byte $d6,$f1,$fd,$08,$ce,$50,$0b,$17   ; [$8762] byte
    .byte $b5,$cd,$6b,$13,$c7,$f3,$94,$00   ; [$876a] byte
    .byte $0d,$79,$d7,$b6,$4d,$7d,$d7,$e4   ; [$8772] byte
    .byte $00,$0d,$61,$d8,$b6,$1c,$4c,$d6   ; [$877a] byte
    .byte $d4,$00,$01,$d6,$75,$cd,$69,$c7   ; [$8782] byte
    .byte $f4,$20,$00,$0d,$79,$d7,$b6,$4d   ; [$878a] byte
    .byte $7d,$d7,$e4,$c3,$b0,$bc,$bb,$51   ; [$8792] byte
    .byte $4d,$61,$cf,$f3,$0c,$fd,$d6,$d4   ; [$879a] byte
    .byte $c1,$f1,$0c,$7b,$1d,$cb,$b5,$1d   ; [$87a2] byte
    .byte $15,$74,$c5,$c7,$f4,$20,$c4,$0c   ; [$87aa] byte
    .byte $18,$01,$75,$45,$cc,$93,$45,$c8   ; [$87b2] byte
    .byte $8c,$7b,$0f,$c9,$31,$dc,$7a,$75   ; [$87ba] byte
    .byte $57,$0a,$32,$ec,$3b,$0a,$c2,$31   ; [$87c2] byte
    .byte $bc,$23,$1b,$c2,$31,$bc,$23,$1b   ; [$87ca] byte
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$87d2] byte
    .byte $23,$1b                           ; [$87da] byte

TRUNK_BLOCKS_SCREEN_12:                     ; [$87dc]
    .byte $d5,$f5,$0c,$23,$4f,$d5,$c0,$35   ; [$87dc] byte
    .byte $0c,$23,$4f,$d5,$f8,$0d,$43,$08   ; [$87e4] byte
    .byte $ce,$74,$2c,$af,$23,$d0,$8c,$e7   ; [$87ec] byte
    .byte $42,$33,$9c,$af,$23,$d0,$b2,$0d   ; [$87f4] byte
    .byte $27,$2b,$d0,$8d,$4d,$73,$9c,$e1   ; [$87fc] byte
    .byte $0d,$4d,$74,$87,$53,$ce,$55,$5d   ; [$8804] byte
    .byte $05,$05,$4c,$e5,$d0,$85,$40,$07   ; [$880c] byte
    .byte $2b,$d2,$51,$4c,$f5,$72,$0d,$25   ; [$8814] byte
    .byte $32,$0c,$f4,$5c,$81,$4c,$6f,$08   ; [$881c] byte
    .byte $c6,$dc,$6f,$08,$c6,$dc,$6f,$08   ; [$8824] byte
    .byte $c6,$f0,$85,$4d,$41,$d3,$dd,$41   ; [$882c] byte
    .byte $d3,$dd,$5c,$05,$4c,$e1,$d5,$dd   ; [$8834] byte
    .byte $27,$2b,$c8,$dd,$27,$42,$33,$95   ; [$883c] byte
    .byte $73,$99,$d2,$74,$87,$53,$74,$85   ; [$8844] byte
    .byte $d0,$74,$0d,$21,$d4,$63,$63,$d0   ; [$884c] byte
    .byte $81,$74,$20,$0d,$15,$c2,$b2,$ed   ; [$8854] byte
    .byte $45,$43,$3d,$5d,$17,$0e,$c2,$f0   ; [$885c] byte
    .byte $cc,$1b,$3d,$c2,$31,$bc,$23,$1b   ; [$8864] byte
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$886c] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b       ; [$8874] byte

TRUNK_BLOCKS_SCREEN_13:                     ; [$887b]
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$887b] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$c2   ; [$8883] byte
    .byte $31,$bc,$23,$1b,$cd,$b4,$fd,$43   ; [$888b] byte
    .byte $36,$d3,$f5,$0c,$db,$4f,$d4,$33   ; [$8893] byte
    .byte $6d,$3f,$50,$cd,$b4,$fd,$43,$36   ; [$889b] byte
    .byte $ca,$f4,$cd,$3b,$43,$d3,$33,$ed   ; [$88a3] byte
    .byte $0f,$4c,$cf,$b4,$3d,$33,$3e,$d0   ; [$88ab] byte
    .byte $f4,$cc,$fb,$43,$d4,$dd,$6f,$58   ; [$88b3] byte
    .byte $d9,$b5,$bd,$63,$66,$d6,$f5,$8d   ; [$88bb] byte
    .byte $9b,$5b,$d6,$36,$6d,$6f,$58,$5c   ; [$88c3] byte
    .byte $03,$6a,$d9,$30,$0d,$ab,$64,$c0   ; [$88cb] byte
    .byte $36,$ad,$93,$00,$da,$b6,$4c,$03   ; [$88d3] byte
    .byte $6a,$55,$57,$61,$5d,$85,$76,$15   ; [$88db] byte
    .byte $73,$63,$08,$d3,$34,$ec,$6f,$36   ; [$88e3] byte
    .byte $30,$8d,$33,$4e,$c6,$f3,$6c,$6f   ; [$88eb] byte
    .byte $36,$74,$33,$7c,$5d,$f3,$43,$37   ; [$88f3] byte
    .byte $c5,$d0,$cd,$f3,$43,$d1,$34,$cc   ; [$88fb] byte
    .byte $fb,$4d,$cf,$b4,$dc,$fb,$4d,$cf   ; [$8903] byte
    .byte $b4,$dc,$fb,$4d,$cf,$b4,$dc,$fb   ; [$890b] byte
    .byte $4d,$d5,$1d,$3b,$74,$d3,$b7,$4d   ; [$8913] byte
    .byte $3b,$74,$d3,$b7,$4d,$3b,$74,$d3   ; [$891b] byte
    .byte $b7,$4d,$3b,$74,$d5,$5c,$fa,$cf   ; [$8923] byte
    .byte $ac,$fa,$cf,$ac,$fa,$cf,$ac,$fa   ; [$892b] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$8933] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$893b] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$8943] byte

TRUNK_BLOCKS_SCREEN_14:                     ; [$894b]
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$894b] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$c2   ; [$8953] byte
    .byte $31,$bc,$23,$1b,$d4,$33,$6d,$3f   ; [$895b] byte
    .byte $50,$cd,$b4,$fd,$43,$36,$d3,$f5   ; [$8963] byte
    .byte $0c,$db,$4f,$d0,$f5,$0a,$d3,$b4   ; [$896b] byte
    .byte $3d,$33,$4e,$d0,$f4,$cd,$3b,$43   ; [$8973] byte
    .byte $d3,$34,$ed,$0f,$4c,$d3,$b3,$ec   ; [$897b] byte
    .byte $ac,$d6,$f5,$8d,$f3,$5b,$d6,$37   ; [$8983] byte
    .byte $cd,$6f,$58,$df,$35,$bd,$63,$7c   ; [$898b] byte
    .byte $d6,$f5,$8d,$4c,$c0,$36,$ad,$93   ; [$8993] byte
    .byte $00,$da,$b6,$4c,$03,$6a,$d9,$30   ; [$899b] byte
    .byte $0d,$ab,$64,$c0,$36,$a4,$5d,$85   ; [$89a3] byte
    .byte $72,$05,$d8,$57,$61,$5c,$f4,$c6   ; [$89ab] byte
    .byte $f3,$63,$4c,$cf,$9c,$6f,$36,$30   ; [$89b3] byte
    .byte $8d,$33,$4e,$c6,$f0,$8c,$6f,$36   ; [$89bb] byte
    .byte $d0,$c1,$d3,$9d,$f3,$43,$37,$c7   ; [$89c3] byte
    .byte $3e,$d0,$cd,$f3,$43,$d3,$b4,$dc   ; [$89cb] byte
    .byte $fb,$4d,$cf,$b3,$1c,$c3,$4d,$cf   ; [$89d3] byte
    .byte $b4,$dc,$fb,$4d,$b4,$dc,$fb,$4d   ; [$89db] byte
    .byte $cf,$b7,$4d,$3b,$74,$d3,$b7,$4d   ; [$89e3] byte
    .byte $3b,$74,$d3,$b7,$4d,$3b,$74,$d3   ; [$89eb] byte
    .byte $b7,$4d,$3b,$74,$74,$ec,$fa,$cf   ; [$89f3] byte
    .byte $ac,$fa,$cf,$ac,$fa,$cf,$ac,$fa   ; [$89fb] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$8a03] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$8a0b] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$8a13] byte

TRUNK_BLOCKS_SCREEN_15:                     ; [$8a1b]
    .byte $c2,$31,$bc,$83,$1b,$c2,$33,$63   ; [$8a1b] byte
    .byte $1b,$c2,$31,$bc,$23,$1b,$c2,$31   ; [$8a23] byte
    .byte $bc,$23,$1b,$74,$f7,$43,$0d,$43   ; [$8a2b] byte
    .byte $08,$d3,$f6,$9d,$0c,$0d,$42,$ca   ; [$8a33] byte
    .byte $f6,$ac,$c7,$4c,$d3,$b3,$ec,$7b   ; [$8a3b] byte
    .byte $43,$d3,$33,$ed,$3b,$1e,$c9,$f1   ; [$8a43] byte
    .byte $dc,$7b,$2b,$d4,$dc,$fb,$4e,$cf   ; [$8a4b] byte
    .byte $ab,$4e,$cf,$b4,$ea,$cf,$b2,$0d   ; [$8a53] byte
    .byte $33,$53,$1d,$3a,$aa,$aa,$97,$3d   ; [$8a5b] byte
    .byte $33,$63,$4c,$71,$bc,$23,$1b,$c2   ; [$8a63] byte
    .byte $34,$cb,$1b,$c2,$1c,$6f,$08,$cd   ; [$8a6b] byte
    .byte $b4,$31,$cf,$b3,$1c,$c0,$1d,$3b   ; [$8a73] byte
    .byte $31,$cc,$1d,$42,$d0,$f4,$cd,$37   ; [$8a7b] byte
    .byte $3e,$d3,$6d,$37,$3e,$d3,$73,$ed   ; [$8a83] byte
    .byte $37,$3e,$d3,$5d,$33,$2b,$d3,$b3   ; [$8a8b] byte
    .byte $ed,$d1,$dd,$34,$ed,$d3,$4e,$dd   ; [$8a93] byte
    .byte $1d,$d1,$dd,$33,$1d,$d3,$53,$cf   ; [$8a9b] byte
    .byte $ac,$f3,$5b,$df,$35,$8c,$f3,$5b   ; [$8aa3] byte
    .byte $df,$35,$8c,$f3,$5b,$df,$35,$8c   ; [$8aab] byte
    .byte $f1,$5d,$93,$69,$36,$ad,$93,$69   ; [$8ab3] byte
    .byte $36,$ad,$93,$69,$36,$ad,$93,$3d   ; [$8abb] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$8ac3] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$8acb] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$8ad3] byte

TRUNK_BLOCKS_SCREEN_16:                     ; [$8adb]
    .byte $c6,$c0,$33,$63,$1b,$c2,$31,$bc   ; [$8adb] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$30   ; [$8ae3] byte
    .byte $8d,$3f,$43,$d4,$30,$8d,$3f,$69   ; [$8aeb] byte
    .byte $d4,$2d,$3f,$69,$d4,$2d,$3f,$69   ; [$8af3] byte
    .byte $5c,$5b,$5c,$1c,$5b,$5c,$1c,$5b   ; [$8afb] byte
    .byte $5c,$1c,$5b,$5c,$c2,$34,$fd,$33   ; [$8b03] byte
    .byte $4d,$cf,$b3,$1d,$33,$4d,$cf,$b3   ; [$8b0b] byte
    .byte $1d,$33,$4d,$cf,$b3,$1d,$33,$4e   ; [$8b13] byte
    .byte $73,$3d,$3b,$74,$d3,$ad,$3b,$74   ; [$8b1b] byte
    .byte $d3,$ad,$3b,$74,$d3,$ad,$3b,$3e   ; [$8b23] byte
    .byte $74,$cc,$fa,$cf,$aa,$cf,$aa,$cf   ; [$8b2b] byte
    .byte $aa,$75,$bc,$03,$59,$d6,$b0,$0d   ; [$8b33] byte
    .byte $62,$aa,$aa,$70,$0c,$83,$62,$c5   ; [$8b3b] byte
    .byte $13,$4e,$aa,$aa,$57,$08,$da,$9d   ; [$8b43] byte
    .byte $03,$3e,$ab,$5b,$d6,$75,$ad,$62   ; [$8b4b] byte
    .byte $55,$cb,$57,$3c,$d6,$f5,$8c,$f3   ; [$8b53] byte
    .byte $00,$d8,$b1,$3d,$0b,$4e,$57,$1b   ; [$8b5b] byte
    .byte $8c,$bf,$64,$d5,$f6,$ad,$93,$16   ; [$8b63] byte
    .byte $c5,$f1,$0c,$bf,$3e,$c6,$e7,$08   ; [$8b6b] byte
    .byte $9c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$8b73] byte
    .byte $c6,$f0,$8c,$6f,$08,$27,$1b,$aa   ; [$8b7b] byte
    .byte $aa,$aa                           ; [$8b83] byte

TRUNK_BLOCKS_SCREEN_17:                     ; [$8b85]
    .byte $c6,$c0,$33,$63,$1b,$c2,$31,$bc   ; [$8b85] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$d4   ; [$8b8d] byte
    .byte $30,$8d,$3f,$43,$d4,$30,$8d,$3f   ; [$8b95] byte
    .byte $69,$d4,$2d,$3f,$69,$d4,$2d,$3f   ; [$8b9d] byte
    .byte $69,$d7,$1c,$5b,$5c,$1c,$5b,$5c   ; [$8ba5] byte
    .byte $1c,$5b,$5c,$1c,$5b,$5c,$d3,$b3   ; [$8bad] byte
    .byte $1d,$33,$4d,$cf,$b3,$1d,$33,$4d   ; [$8bb5] byte
    .byte $cf,$b3,$1d,$33,$4d,$cf,$b3,$1d   ; [$8bbd] byte
    .byte $33,$4e,$cf,$a3,$74,$d3,$ad,$3b   ; [$8bc5] byte
    .byte $74,$d3,$ad,$3b,$74,$d3,$ad,$3b   ; [$8bcd] byte
    .byte $3e,$1c,$fa,$cf,$aa,$cf,$aa,$cf   ; [$8bd5] byte
    .byte $aa,$2a,$aa,$ab,$5b,$d6,$75,$ac   ; [$8bdd] byte
    .byte $03,$58,$cf,$aa,$aa,$ab,$6a,$d8   ; [$8be5] byte
    .byte $b1,$34,$d3,$ab,$5b,$d6,$75,$ad   ; [$8bed] byte
    .byte $62,$a9,$54,$cf,$ab,$00,$d8,$b1   ; [$8bf5] byte
    .byte $3d,$03,$3c,$d6,$f5,$8c,$f1,$54   ; [$8bfd] byte
    .byte $d3,$ab,$16,$c4,$1c,$bf,$64,$d5   ; [$8c05] byte
    .byte $f6,$ad,$93,$16,$c5,$f1,$0c,$bf   ; [$8c0d] byte
    .byte $16,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$8c15] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$8c1d] byte
    .byte $c6,$f0,$8c,$6f,$08,$2a,$aa,$aa   ; [$8c25] byte
    .byte $aa                               ; [$8c2d] byte

TRUNK_BLOCKS_SCREEN_18:                     ; [$8c2e]
    .byte $c6,$f0,$8c,$6f,$08,$c8,$31,$bc   ; [$8c2e] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$c2   ; [$8c36] byte
    .byte $31,$bc,$23,$1b,$d4,$1d,$3f,$43   ; [$8c3e] byte
    .byte $76,$90,$00,$0d,$42,$d7,$1c,$5b   ; [$8c46] byte
    .byte $5c,$cc,$74,$cc,$fb,$4e,$cf,$b4   ; [$8c4e] byte
    .byte $ec,$fb,$4e,$cf,$b4,$ed,$71,$d3   ; [$8c56] byte
    .byte $b3,$1d,$33,$4e,$cf,$b4,$e4,$aa   ; [$8c5e] byte
    .byte $ab,$2b,$cf,$a3,$3e,$a8,$aa,$b2   ; [$8c66] byte
    .byte $07,$53,$5c,$fb,$1b,$c2,$31,$bc   ; [$8c6e] byte
    .byte $23,$1b,$c2,$0d,$33,$3a,$c2,$1c   ; [$8c76] byte
    .byte $6d,$d3,$ab,$31,$dc,$40,$0d,$ff   ; [$8c7e] byte
    .byte $6b,$dc,$5d,$a5,$cf,$aa,$dc,$36   ; [$8c86] byte
    .byte $bd,$bf,$70,$d7,$76,$bd,$bf,$70   ; [$8c8e] byte
    .byte $cf,$9d,$cd,$d6,$75,$ac,$03,$58   ; [$8c96] byte
    .byte $9d,$6f,$69,$d6,$37,$0d,$6f,$69   ; [$8c9e] byte
    .byte $d6,$33,$1d,$31,$c5,$f1,$3c,$e4   ; [$8ca6] byte
    .byte $77,$0d,$ab,$5c,$36,$1d,$ab,$5c   ; [$8cae] byte
    .byte $36,$1c,$f9,$71,$0c,$bb,$2f,$76   ; [$8cb6] byte
    .byte $4d,$33,$65,$36,$4d,$33,$3e,$d3   ; [$8cbe] byte
    .byte $b6,$4d,$3b,$44,$c6,$f0,$8c,$6f   ; [$8cc6] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$8cce] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$8cd6] byte
    .byte $2a,$aa,$aa,$aa                   ; [$8cde] byte

TRUNK_BLOCKS_SCREEN_19:                     ; [$8ce2]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f3,$6c   ; [$8ce2] byte
    .byte $23,$36,$c6,$f3,$6c,$6f,$36,$c2   ; [$8cea] byte
    .byte $33,$6c,$23,$1b,$c2,$0d,$3f,$43   ; [$8cf2] byte
    .byte $df,$34,$3d,$f3,$43,$df,$34,$3d   ; [$8cfa] byte
    .byte $f3,$43,$df,$34,$33,$7c,$74,$fd   ; [$8d02] byte
    .byte $a4,$33,$00,$d7,$33,$0d,$70,$cc   ; [$8d0a] byte
    .byte $35,$c0,$74,$cc,$fb,$4e,$cf,$b4   ; [$8d12] byte
    .byte $ec,$f8,$d3,$b3,$ed,$3b,$3e,$d3   ; [$8d1a] byte
    .byte $b3,$ed,$3b,$3e,$ca,$f5,$8d,$93   ; [$8d22] byte
    .byte $20,$d3,$28,$aa,$aa,$d4,$f6,$ac   ; [$8d2a] byte
    .byte $6d,$c6,$f0,$8d,$31,$c6,$f0,$8c   ; [$8d32] byte
    .byte $6f,$08,$d3,$30,$8d,$33,$08,$5d   ; [$8d3a] byte
    .byte $f1,$d6,$37,$cd,$6f,$00,$00,$d6   ; [$8d42] byte
    .byte $37,$cd,$6f,$00,$5d,$93,$6a,$da   ; [$8d4a] byte
    .byte $76,$4c,$00,$00,$36,$4c,$03,$69   ; [$8d52] byte
    .byte $5d,$85,$d3,$b6,$1d,$ab,$69,$35   ; [$8d5a] byte
    .byte $cd,$c7,$5c,$36,$1d,$70,$71,$bc   ; [$8d62] byte
    .byte $23,$39,$71,$bc,$23,$4c,$cf,$b1   ; [$8d6a] byte
    .byte $bc,$23,$4c,$d3,$b0,$8c,$6f,$08   ; [$8d72] byte
    .byte $cf,$76,$a0,$e0,$33,$8c,$c1,$d9   ; [$8d7a] byte
    .byte $73,$1c,$c1,$73,$1c,$c0,$c6,$f0   ; [$8d82] byte
    .byte $8c,$6f,$08,$70,$8c,$6f,$08,$c6   ; [$8d8a] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$8d92] byte
    .byte $08,$2a,$71,$ba,$aa,$aa           ; [$8d9a] byte

TRUNK_BLOCKS_SCREEN_20:                     ; [$8da0]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f3,$6c   ; [$8da0] byte
    .byte $23,$36,$c6,$f3,$6c,$6f,$36,$c2   ; [$8da8] byte
    .byte $33,$6c,$23,$1b,$df,$34,$3d,$f3   ; [$8db0] byte
    .byte $43,$df,$34,$3d,$f3,$43,$df,$34   ; [$8db8] byte
    .byte $3d,$63,$7c,$d6,$f4,$3d,$43,$7c   ; [$8dc0] byte
    .byte $d7,$00,$da,$73,$00,$d7,$33,$0d   ; [$8dc8] byte
    .byte $73,$64,$da,$b5,$c3,$64,$cf,$b4   ; [$8dd0] byte
    .byte $ec,$fb,$4e,$cf,$b4,$e3,$3e,$d3   ; [$8dd8] byte
    .byte $b3,$ed,$39,$73,$ed,$3b,$61,$d3   ; [$8de0] byte
    .byte $aa,$a4,$ab,$61,$74,$e9,$c2,$34   ; [$8de8] byte
    .byte $cb,$08,$c6,$f0,$83,$4c,$b0,$8c   ; [$8df0] byte
    .byte $6f,$08,$c6,$f0,$8d,$31,$c0,$37   ; [$8df8] byte
    .byte $c3,$00,$df,$35,$8c,$f3,$5b,$df   ; [$8e00] byte
    .byte $30,$0d,$63,$3c,$d6,$f7,$cd,$6d   ; [$8e08] byte
    .byte $40,$da,$70,$0d,$93,$00,$03,$61   ; [$8e10] byte
    .byte $c0,$0d,$09,$d7,$00,$0d,$87,$69   ; [$8e18] byte
    .byte $0d,$c5,$74,$5d,$71,$c6,$f0,$8c   ; [$8e20] byte
    .byte $6f,$08,$d3,$33,$ec,$6f,$08,$d3   ; [$8e28] byte
    .byte $33,$ec,$6f,$08,$d3,$33           ; [$8e30] byte

;
; XREFS:
;     BANK7_SPRITEADDRS_START [$PRG7::8060]
;
BYTE_PRG1__8e36:                            ; [$8e36]
    .byte $ec,$6f,$08,$cc,$00,$74,$ec,$c7   ; [$8e36] byte
    .byte $30,$74,$ec,$c7,$30,$73,$1c,$c0   ; [$8e3e] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$8e46] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$8e4e] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$8e56] byte

TRUNK_BLOCKS_SCREEN_21:                     ; [$8e5e]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$8e5e] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$8e66] byte
    .byte $f0,$83,$1b,$d6,$f4,$3d,$63,$7c   ; [$8e6e] byte
    .byte $c0,$37,$10,$00,$03,$2b,$d7,$03   ; [$8e76] byte
    .byte $61,$da,$b7,$0d,$ac,$03,$70,$da   ; [$8e7e] byte
    .byte $cd,$bf,$53,$cf,$b4,$ec,$f9,$75   ; [$8e86] byte
    .byte $c9,$db,$d3,$71,$4d,$b9,$d3,$a9   ; [$8e8e] byte
    .byte $74,$0d,$61,$db,$b7,$03,$61,$76   ; [$8e96] byte
    .byte $ed,$71,$c2,$00,$74,$ec,$fb,$70   ; [$8e9e] byte
    .byte $cf,$b4,$ec,$fb,$4e,$dc,$35,$cc   ; [$8ea6] byte
    .byte $f9,$c0,$37,$c3,$61,$73,$ea,$d6   ; [$8eae] byte
    .byte $f7,$cd,$63,$3c,$d7,$37,$cd,$6d   ; [$8eb6] byte
    .byte $43,$64,$74,$ea,$c0,$03,$61,$df   ; [$8ebe] byte
    .byte $30,$0d,$09,$d7,$03,$61,$73,$e8   ; [$8ec6] byte
    .byte $da,$4d,$c5,$c0,$34,$5d,$71,$c6   ; [$8ece] byte
    .byte $f0,$81,$57,$3e,$d3,$33,$ed,$3b   ; [$8ed6] byte
    .byte $3e,$d3,$b3,$ed,$39,$c2,$24,$74   ; [$8ede] byte
    .byte $ec,$c7,$30,$74,$ea,$ab,$3d,$c6   ; [$8ee6] byte
    .byte $e9,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$8eee] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$8ef6] byte
    .byte $2a,$aa,$aa,$aa                   ; [$8efe] byte

TRUNK_BLOCKS_SCREEN_22:                     ; [$8f02]
    .byte $c2,$32,$0d,$5c,$03,$17,$c7,$71   ; [$8f02] byte
    .byte $e3,$10,$c8,$8c,$7b,$10,$ca,$dd   ; [$8f0a] byte
    .byte $2f,$42,$d0,$74,$0d,$0b,$58,$c4   ; [$8f12] byte
    .byte $1c,$57,$27,$d5,$cd,$63,$17,$d4   ; [$8f1a] byte
    .byte $f1,$fd,$25,$ce,$73,$84,$d8,$b1   ; [$8f22] byte
    .byte $dc,$4f,$4b,$d0,$81,$55,$24,$72   ; [$8f2a] byte
    .byte $57,$49,$41,$71,$bc,$21,$03,$45   ; [$8f32] byte
    .byte $c5,$f0,$6c,$43,$2e,$cb,$5c,$9b   ; [$8f3a] byte
    .byte $10,$71,$fa,$34,$5c,$ab,$10,$c7   ; [$8f42] byte
    .byte $b1,$dc,$7b,$0a,$c1,$b2,$5c,$67   ; [$8f4a] byte
    .byte $15,$5d,$66,$71,$bc,$23,$1b,$c2   ; [$8f52] byte
    .byte $31,$bc,$23,$1b,$c2,$31,$bc,$23   ; [$8f5a] byte
    .byte $1b,$5c,$5e,$d7,$00,$03,$59,$35   ; [$8f62] byte
    .byte $c0,$57,$15,$c1,$b1,$5c,$8b,$09   ; [$8f6a] byte
    .byte $c8,$8c,$93,$17,$c4,$00,$71,$6c   ; [$8f72] byte
    .byte $7b,$1d,$d6,$f4,$bc,$70,$0d,$61   ; [$8f7a] byte
    .byte $c7,$71,$ec,$91,$cf,$73,$3d,$6f   ; [$8f82] byte
    .byte $20,$d2,$74,$20,$01,$c9,$71,$0c   ; [$8f8a] byte
    .byte $1b,$0f,$c6,$f0,$8c,$6d,$c6,$f0   ; [$8f92] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$8f9a] byte
    .byte $c6,$f0,$8c,$6f,$08,$2b,$80,$c2   ; [$8fa2] byte
    .byte $2a,$aa,$aa                       ; [$8faa] byte

TRUNK_BLOCKS_SCREEN_23:                     ; [$8fad]
    .byte $c4,$00,$0c,$88,$c9,$f1,$dc,$88   ; [$8fad] byte
    .byte $c7,$b1,$0c,$4f,$08,$4c,$3f,$24   ; [$8fb5] byte
    .byte $c5,$72,$2d,$6f,$57,$03,$58,$c5   ; [$8fbd] byte
    .byte $d5,$c7,$70,$7c,$3a,$d6,$f5,$7d   ; [$8fc5] byte
    .byte $2b,$42,$03,$39,$d8,$95,$c4,$2c   ; [$8fcd] byte
    .byte $7b,$13,$d2,$73,$9d,$08,$0d,$17   ; [$8fd5] byte
    .byte $0e,$c4,$05,$72,$5c,$41,$74,$20   ; [$8fdd] byte
    .byte $d1,$70,$ec,$83,$4c,$45,$c7,$71   ; [$8fe5] byte
    .byte $e5,$5c,$6f,$08,$c6,$f0,$87,$08   ; [$8fed] byte
    .byte $34,$c5,$31,$bc,$23,$0f,$5d,$23   ; [$8ff5] byte
    .byte $57,$07,$57,$71,$bc,$23,$1b,$d7   ; [$8ffd] byte
    .byte $03,$13,$74,$1b,$1c,$d2,$f4,$17   ; [$9005] byte
    .byte $33,$d6,$75,$ca,$c4,$31,$ec,$41   ; [$900d] byte
    .byte $74,$2d,$02,$0d,$23,$17,$c4,$05   ; [$9015] byte
    .byte $72,$55,$50,$34,$5c,$39,$c7,$71   ; [$901d] byte
    .byte $ec,$c5,$c7,$71,$e4,$cb,$b5,$17   ; [$9025] byte
    .byte $45,$c3,$b0,$ac,$3c,$c9,$71,$0c   ; [$902d] byte
    .byte $4f,$1b,$30,$8c,$6f,$08,$c6,$f0   ; [$9035] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$903d] byte
    .byte $c6,$f0,$8c,$6f,$08,$2a,$aa,$aa   ; [$9045] byte
    .byte $aa                               ; [$904d] byte

TRUNK_BLOCKS_SCREEN_24:                     ; [$904e]
    .byte $c2,$0c,$6f,$08,$c6,$f0,$8c,$6f   ; [$904e] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$9056] byte
    .byte $8c,$6f,$08,$d4,$f4,$fd,$5c,$d4   ; [$905e] byte
    .byte $1d,$3f,$57,$d4,$1d,$3f,$57,$d4   ; [$9066] byte
    .byte $1d,$3f,$57,$71,$fd,$0b,$41,$ce   ; [$906e] byte
    .byte $73,$dd,$27,$41,$d0,$33,$dd,$27   ; [$9076] byte
    .byte $39,$33,$dd,$27,$42,$57,$40,$d0   ; [$907e] byte
    .byte $b4,$87,$39,$b4,$87,$42,$34,$85   ; [$9086] byte
    .byte $54,$00,$00,$00,$70,$8d,$25,$ce   ; [$908e] byte
    .byte $73,$84,$ce,$73,$84,$0d,$17,$0e   ; [$9096] byte
    .byte $74,$f7,$39,$c6,$f0,$8d,$27,$39   ; [$909e] byte
    .byte $c6,$f0,$8d,$27,$39,$c6,$f0,$8c   ; [$90a6] byte
    .byte $6f,$08,$71,$fd,$08,$d2,$35,$77   ; [$90ae] byte
    .byte $42,$d2,$35,$77,$42,$d2,$35,$9d   ; [$90b6] byte
    .byte $70,$54,$00,$00,$ce,$71,$7c,$77   ; [$90be] byte
    .byte $1e,$54,$00,$03,$45,$c3,$b1,$0c   ; [$90c6] byte
    .byte $97,$10,$cf,$72,$0d,$25,$00,$34   ; [$90ce] byte
    .byte $5c,$3b,$10,$c9,$72,$4c,$77,$1e   ; [$90d6] byte
    .byte $c6,$dc,$6f,$08,$c6,$f0,$8c,$6f   ; [$90de] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$90e6] byte
    .byte $8c,$6f,$08,$1c,$22,$aa,$aa,$aa   ; [$90ee] byte

TRUNK_BLOCKS_SCREEN_25:                     ; [$90f6]
    .byte $c2,$0c,$6f,$08,$c6,$f0,$8c,$6f   ; [$90f6] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$90fe] byte
    .byte $8c,$6f,$08,$d4,$1d,$3f,$59,$d7   ; [$9106] byte
    .byte $00,$00,$d6,$b5,$0b,$4f,$d0,$b4   ; [$910e] byte
    .byte $4d,$27,$17,$c4,$31,$dc,$5f,$0f   ; [$9116] byte
    .byte $c8,$83,$1e,$c3,$f2,$dc,$f7,$4c   ; [$911e] byte
    .byte $74,$8c,$9b,$06,$c9,$f2,$6c,$7b   ; [$9126] byte
    .byte $5b,$d2,$f1,$c3,$58,$c5,$f1,$0c   ; [$912e] byte
    .byte $c5,$d1,$70,$ec,$1b,$27,$c9,$b1   ; [$9136] byte
    .byte $ed,$6f,$4a,$d0,$83,$39,$50,$c1   ; [$913e] byte
    .byte $b0,$ac,$83,$4c,$c7,$b5,$bc,$83   ; [$9146] byte
    .byte $49,$ce,$73,$85,$70,$fc,$77,$1e   ; [$914e] byte
    .byte $c6,$f0,$87,$1b,$c2,$07,$1b,$c2   ; [$9156] byte
    .byte $0c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$915e] byte
    .byte $cc,$07,$50,$74,$f7,$57,$00,$d6   ; [$9166] byte
    .byte $75,$cc,$c3,$5c,$c7,$71,$ec,$c7   ; [$916e] byte
    .byte $5a,$ca,$f4,$bd,$23,$4a,$d0,$b3   ; [$9176] byte
    .byte $9c,$e3,$39,$c5,$cc,$77,$17,$c9   ; [$917e] byte
    .byte $70,$6c,$43,$13,$d4,$f4,$ad,$08   ; [$9186] byte
    .byte $01,$71,$0c,$97,$10,$c9,$31,$dc   ; [$918e] byte
    .byte $79,$cf,$74,$94,$03,$26,$72,$4c   ; [$9196] byte
    .byte $77,$1e,$c6,$f0,$8c,$6f,$08,$c6   ; [$919e] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$91a6] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$2a,$aa   ; [$91ae] byte
    .byte $aa,$aa                           ; [$91b6] byte

TRUNK_BLOCKS_SCREEN_26:                     ; [$91b8]
    .byte $c2,$0c,$6f,$08,$c6,$f0,$8c,$6f   ; [$91b8] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$91c0] byte
    .byte $8c,$6f,$08,$d7,$0d,$6b,$50,$b4   ; [$91c8] byte
    .byte $fd,$67,$5a,$d5,$f5,$0b,$4f,$d5   ; [$91d0] byte
    .byte $cc,$ac,$c4,$0c,$4f,$49,$cf,$75   ; [$91d8] byte
    .byte $7c,$5f,$13,$d2,$74,$1d,$23,$4a   ; [$91e0] byte
    .byte $d0,$8d,$4c,$43,$2e,$ca,$72,$ac   ; [$91e8] byte
    .byte $41,$74,$20,$04,$40,$31,$ec,$75   ; [$91f0] byte
    .byte $53,$39,$44,$c7,$71,$5c,$7b,$4c   ; [$91f8] byte
    .byte $4c,$95,$5c,$e7,$08,$c6,$f0,$8c   ; [$9200] byte
    .byte $f4,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$9208] byte
    .byte $8c,$6f,$08,$5d,$2d,$d3,$f5,$08   ; [$9210] byte
    .byte $cc,$0d,$70,$c7,$f3,$0d,$73,$5a   ; [$9218] byte
    .byte $5d,$27,$84,$d2,$f4,$ae,$08,$c4   ; [$9220] byte
    .byte $31,$ec,$77,$5b,$c9,$b1,$03,$13   ; [$9228] byte
    .byte $d2,$dd,$05,$d2,$b4,$24,$70,$6c   ; [$9230] byte
    .byte $97,$10,$01,$d2,$5c,$e5,$73,$97   ; [$9238] byte
    .byte $83,$c9,$31,$dc,$79,$00,$cb,$b2   ; [$9240] byte
    .byte $9c,$39,$55,$c6,$f0,$8c,$6f,$08   ; [$9248] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9250] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$2a   ; [$9258] byte
    .byte $aa,$aa,$aa                       ; [$9260] byte

TRUNK_BLOCKS_SCREEN_28:                     ; [$9263]
    .byte $c6,$f4,$9d,$08,$ce,$76,$2c,$7b   ; [$9263] byte
    .byte $1d,$c2,$b0,$fc,$7b,$10,$00,$c2   ; [$926b] byte
    .byte $14,$5c,$1b,$25,$c4,$30,$cc,$1b   ; [$9273] byte
    .byte $15,$c1,$d0,$54,$1c,$40,$30,$6c   ; [$927b] byte
    .byte $40,$32,$4c,$57,$0f,$72,$04,$ce   ; [$9283] byte
    .byte $5c,$77,$1e,$d3,$30,$fc,$77,$1e   ; [$928b] byte
    .byte $c9,$f0,$7c,$3b,$10,$5c,$6f,$08   ; [$9293] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$929b] byte
    .byte $6f,$08,$c3,$f1,$dc,$7b,$27,$75   ; [$92a3] byte
    .byte $70,$35,$9d,$70,$33,$0d,$42,$b1   ; [$92ab] byte
    .byte $bc,$23,$1b,$74,$9d,$08,$ce,$76   ; [$92b3] byte
    .byte $2c,$40,$c8,$8d,$72,$aa,$17,$45   ; [$92bb] byte
    .byte $c3,$b1,$03,$27,$d2,$f1,$cd,$63   ; [$92c3] byte
    .byte $59,$d7,$35,$ac,$70,$c6,$ec,$3b   ; [$92cb] byte
    .byte $10,$0c,$4f,$49,$d0,$8c,$e7,$17   ; [$92d3] byte
    .byte $c4,$30,$6c,$bb,$2f,$c2,$2b,$4c   ; [$92db] byte
    .byte $45,$73,$91,$c7,$a3,$06,$c6,$e1   ; [$92e3] byte
    .byte $c9,$31,$d5,$74,$5c,$3b,$10,$c7   ; [$92eb] byte
    .byte $4c,$7b,$09,$5c,$6e,$c6,$f0,$8c   ; [$92f3] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$92fb] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$9303] byte

TRUNK_BLOCKS_SCREEN_29:                     ; [$930b]
    .byte $c6,$f0,$8c,$6f,$08,$c8,$30,$8c   ; [$930b] byte
    .byte $6f,$08,$30,$fc,$7b,$13,$c0,$40   ; [$9313] byte
    .byte $ca,$f5,$9d,$73,$20,$35,$7d,$41   ; [$931b] byte
    .byte $d3,$f0,$7c,$41,$40,$c6,$35,$8c   ; [$9323] byte
    .byte $5f,$31,$cc,$35,$93,$53,$c9,$b0   ; [$932b] byte
    .byte $65,$40,$74,$2b,$10,$c2,$8c,$43   ; [$9333] byte
    .byte $3d,$d3,$30,$fc,$1d,$40,$cf,$74   ; [$933b] byte
    .byte $9a,$c8,$34,$c7,$5c,$71,$01,$40   ; [$9343] byte
    .byte $c6,$cc,$20,$5c,$57,$24,$c5,$71   ; [$934b] byte
    .byte $e5,$40,$e0,$b4,$fd,$43,$3d,$5c   ; [$9353] byte
    .byte $7b,$25,$c4,$01,$40,$72,$8d,$27   ; [$935b] byte
    .byte $48,$5c,$40,$01,$40,$57,$42,$d6   ; [$9363] byte
    .byte $5c,$23,$4c,$4c,$29,$40,$e0,$d5   ; [$936b] byte
    .byte $d8,$b1,$dc,$ad,$71,$5c,$75,$40   ; [$9373] byte
    .byte $5c,$82,$72,$5d,$4d,$c7,$9c,$1d   ; [$937b] byte
    .byte $40,$c6,$f0,$87,$08,$71,$05,$c7   ; [$9383] byte
    .byte $6c,$19,$40,$c2,$27,$1b,$55,$c9   ; [$938b] byte
    .byte $71,$01,$40                       ; [$9393] byte

TRUNK_BLOCKS_SCREEN_30:                     ; [$9396]
    .byte $c6,$f0,$8c,$83,$08,$c5,$f1,$3d   ; [$9396] byte
    .byte $4f,$17,$c2,$b0,$fc,$7b,$13,$c0   ; [$939e] byte
    .byte $40,$d5,$c7,$57,$55,$c4,$30,$cc   ; [$93a6] byte
    .byte $19,$40,$cb,$b2,$fd,$23,$49,$55   ; [$93ae] byte
    .byte $70,$6c,$41,$40,$c3,$f0,$ac,$bb   ; [$93b6] byte
    .byte $0e,$c1,$95,$d3,$30,$fc,$75,$40   ; [$93be] byte
    .byte $c7,$71,$ec,$3f,$1e,$c2,$b0,$fc   ; [$93c6] byte
    .byte $f7,$58,$b1,$01,$40,$c2,$31,$bc   ; [$93ce] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$57,$a7   ; [$93d6] byte
    .byte $1b,$c2,$10,$c6,$ea,$ad,$5f,$49   ; [$93de] byte
    .byte $d0,$ab,$31,$ac,$6f,$08,$d5,$c0   ; [$93e6] byte
    .byte $0d,$27,$42,$07,$1d,$d6,$76,$1d   ; [$93ee] byte
    .byte $6b,$01,$d0,$80,$00,$d1,$72,$ac   ; [$93f6] byte
    .byte $1b,$25,$d9,$1d,$91,$cb,$b2,$f4   ; [$93fe] byte
    .byte $0d,$17,$0e,$c1,$8c,$3f,$17,$75   ; [$9406] byte
    .byte $45,$c3,$f0,$6c,$bb,$2f,$d1,$70   ; [$940e] byte
    .byte $ec,$1b,$0f,$c7,$8c,$77,$1e,$75   ; [$9416] byte
    .byte $55,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$941e] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$9426] byte
    .byte $c6,$f0,$8c,$6f,$08,$2a,$aa,$aa   ; [$942e] byte
    .byte $aa                               ; [$9436] byte

TRUNK_BLOCKS_SCREEN_31:                     ; [$9437]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$9437] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$943f] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9447] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$944f] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9457] byte
    .byte $00,$00,$00,$00,$00,$c6,$f0,$8c   ; [$945f] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$9467] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$946f] byte
    .byte $08,$2a,$aa,$aa,$aa               ; [$9477] byte

TRUNK_BLOCKS_SCREEN_32:                     ; [$947c]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$947c] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9484] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$948c] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9494] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$949c] byte
    .byte $0c,$0b,$03,$40,$00,$00,$c0,$b0   ; [$94a4] byte
    .byte $3c,$1b,$1b,$30,$8c,$6f,$08,$c6   ; [$94ac] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$94b4] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$2a,$aa   ; [$94bc] byte
    .byte $aa,$aa                           ; [$94c4] byte

TRUNK_BLOCKS_SCREEN_33:                     ; [$94c6]
    .byte $c0,$40,$00,$36,$2c,$40,$0c,$f7   ; [$94c6] byte
    .byte $53,$40,$00,$1c,$5f,$1d,$c7,$9c   ; [$94ce] byte
    .byte $21,$40,$00,$14,$c1,$9c,$c5,$40   ; [$94d6] byte
    .byte $00,$17,$10,$30,$fc,$51,$40,$00   ; [$94de] byte
    .byte $1c,$7b,$1d,$c7,$b0,$7c,$31,$40   ; [$94e6] byte
    .byte $03,$02,$c0,$f1,$7c,$1b,$25,$c5   ; [$94ee] byte
    .byte $f0,$6c,$5d,$40,$03,$17,$c7,$9c   ; [$94f6] byte
    .byte $57,$0f,$c7,$b1,$01,$4c,$0b,$04   ; [$94fe] byte
    .byte $c1,$70,$4c,$15,$c9,$5c,$43,$25   ; [$9506] byte
    .byte $c4,$0c,$9d,$c0,$b0,$3c,$18,$0c   ; [$950e] byte
    .byte $3d,$c4,$1c,$9f,$21,$c9,$f1,$7c   ; [$9516] byte
    .byte $ad,$c1,$80,$c3,$f0,$7c,$3b,$10   ; [$951e] byte
    .byte $32,$7c,$9b,$2e,$ca,$9c,$df,$3d   ; [$9526] byte
    .byte $c2,$00,$00,$00,$03,$1b,$1c,$6d   ; [$952e] byte
    .byte $c6,$dc,$6d,$c6,$dc,$6d,$c6,$dc   ; [$9536] byte
    .byte $6e,$2a,$aa,$aa,$aa               ; [$953e] byte

TRUNK_BLOCKS_SCREEN_34:                     ; [$9543]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$9543] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$954b] byte
    .byte $00,$00,$00,$00,$03,$2b,$40,$00   ; [$9553] byte
    .byte $00,$03,$53,$40,$00,$00,$30,$2c   ; [$955b] byte
    .byte $0d,$40,$00,$03,$02,$c0,$f1,$0c   ; [$9563] byte
    .byte $ad,$40,$00,$30,$2c,$0f,$06,$30   ; [$956b] byte
    .byte $fc,$df,$3d,$40,$00,$c6,$c0,$00   ; [$9573] byte
    .byte $40,$00,$35,$9d,$70,$0c,$ac,$40   ; [$957b] byte
    .byte $00,$36,$2c,$40,$0d,$4c,$40,$00   ; [$9583] byte
    .byte $14,$04                           ; [$958b] byte

TRUNK_BLOCKS_SCREEN_35:                     ; [$958d]
    .byte $c6,$f0,$8c,$04,$0c,$6f,$08,$c6   ; [$958d] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$9595] byte
    .byte $08,$c0,$40,$00,$00,$00,$00,$00   ; [$959d] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$95a5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$95ad] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$95b5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$95bd] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$95c5] byte
    .byte $00,$00                           ; [$95cd] byte

TRUNK_BLOCKS_SCREEN_36:                     ; [$95cf]
    .byte $d4,$f0,$10,$00,$00,$03,$53,$10   ; [$95cf] byte
    .byte $00,$00,$01,$1d,$d5,$dd,$5d,$d5   ; [$95d7] byte
    .byte $dd,$5d,$d5,$dd,$51,$1d,$ed,$de   ; [$95df] byte
    .byte $dd,$ed,$de,$dd,$ed,$de,$d1,$cf   ; [$95e7] byte
    .byte $5d,$c9,$dc,$9d,$c9,$dc,$9d,$c9   ; [$95ef] byte
    .byte $dc,$93,$3d,$c6,$f0,$8c,$6f,$08   ; [$95f7] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$95ff] byte
    .byte $6f,$08,$13,$08,$ca,$f0,$10,$0d   ; [$9607] byte
    .byte $d7,$01,$dd,$70,$1d,$d7,$01,$dd   ; [$960f] byte
    .byte $53,$2b,$d4,$d0,$0d,$ed,$de,$dd   ; [$9617] byte
    .byte $ed,$de,$d3,$53,$10,$05,$55,$51   ; [$961f] byte
    .byte $cf,$50,$0d,$c9,$dc,$9d,$c9,$dc   ; [$9627] byte
    .byte $93,$3d,$c6,$f0,$84,$0c,$6f,$08   ; [$962f] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9637] byte
    .byte $6f,$08,$04,$0c,$22,$aa,$aa,$14   ; [$963f] byte
    .byte $0c,$6e,$aa,$aa                   ; [$9647] byte

TRUNK_BLOCKS_SCREEN_37:                     ; [$964b]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$964b] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$9653] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$d5   ; [$965b] byte
    .byte $81,$00,$00,$03,$1b,$c2,$32,$bc   ; [$9663] byte
    .byte $6f,$08,$40,$ca,$d0,$03,$2b,$75   ; [$966b] byte
    .byte $3c,$23,$2b,$43,$2b,$d4,$d0,$03   ; [$9673] byte
    .byte $53,$c0,$5c,$07,$53,$43,$53,$10   ; [$967b] byte
    .byte $03,$3d,$57,$3d,$41,$10,$00,$33   ; [$9683] byte
    .byte $d4,$01,$10,$00,$00,$01,$10,$00   ; [$968b] byte
    .byte $00,$01                           ; [$9693] byte

TRUNK_BLOCKS_SCREEN_38:                     ; [$9695]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9695] byte
    .byte $6f,$08,$c6,$f0,$8d,$33,$13,$c0   ; [$969d] byte
    .byte $40,$d6,$b5,$70,$00,$35,$95,$40   ; [$96a5] byte
    .byte $c4,$f4,$9d,$0b,$39,$ce,$34,$23   ; [$96ad] byte
    .byte $41,$c9,$b0,$6c,$41,$40,$54,$b4   ; [$96b5] byte
    .byte $07,$26,$c1,$b0,$fc,$1d,$40,$c4   ; [$96bd] byte
    .byte $32,$ed,$45,$d1,$72,$ac,$97,$06   ; [$96c5] byte
    .byte $c8,$b2,$0d,$31,$40,$c2,$31,$bc   ; [$96cd] byte
    .byte $23,$1b,$c2,$34,$cc,$43,$1b,$c2   ; [$96d5] byte
    .byte $15,$40,$d7,$00,$1c,$5f,$5c,$cc   ; [$96dd] byte
    .byte $15,$40,$c4,$00,$c8,$8c,$9f,$58   ; [$96e5] byte
    .byte $c4,$15,$40,$c9,$31,$d7,$13,$d2   ; [$96ed] byte
    .byte $f1,$c0,$c5,$f5,$c5,$40,$d6,$32   ; [$96f5] byte
    .byte $55,$d2,$74,$23,$39,$71,$01,$40   ; [$96fd] byte
    .byte $d0,$b1,$75,$c8,$25,$71,$5c,$1d   ; [$9705] byte
    .byte $40,$c6,$f0,$8c,$6f,$08,$70,$8c   ; [$970d] byte
    .byte $6f,$08,$31,$ec,$19,$40,$c2,$2a   ; [$9715] byte
    .byte $71,$ba,$71,$01,$40               ; [$971d] byte

TRUNK_BLOCKS_SCREEN_39:                     ; [$9722]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9722] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$972a] byte
    .byte $f0,$8c,$6f,$08,$d6,$b5,$9d,$73   ; [$9732] byte
    .byte $5a,$d9,$35,$70,$00,$d6,$75,$c0   ; [$973a] byte
    .byte $d8,$35,$fd,$7b,$60,$d7,$cd,$27   ; [$9742] byte
    .byte $41,$d0,$34,$23,$41,$c5,$f1,$dc   ; [$974a] byte
    .byte $7b,$10,$c7,$b0,$fd,$37,$17,$75   ; [$9752] byte
    .byte $b7,$42,$0d,$17,$0e,$71,$ec,$19   ; [$975a] byte
    .byte $1d,$d3,$13,$d6,$f4,$9d,$08,$d1   ; [$9762] byte
    .byte $70,$ec,$1b,$1d,$c7,$85,$c2,$31   ; [$976a] byte
    .byte $bc,$23,$1b,$c2,$17,$1b,$c2,$31   ; [$9772] byte
    .byte $bc,$23,$1b,$c2,$31,$bc,$20,$d7   ; [$977a] byte
    .byte $03,$5a,$d2,$f4,$a7,$48,$d6,$75   ; [$9782] byte
    .byte $c0,$00,$d6,$31,$ed,$93,$13,$d2   ; [$978a] byte
    .byte $74,$20,$d6,$31,$7d,$93,$10,$c7   ; [$9792] byte
    .byte $b2,$23,$1d,$d0,$b6,$25,$5c,$e7   ; [$979a] byte
    .byte $38,$ce,$57,$13,$d6,$f1,$c3,$58   ; [$97a2] byte
    .byte $5d,$85,$5d,$07,$42,$76,$2d,$85   ; [$97aa] byte
    .byte $d2,$74,$23,$41,$5c,$79,$50,$5c   ; [$97b2] byte
    .byte $79,$50,$c6,$f0,$8c,$6f,$08,$c6   ; [$97ba] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$97c2] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$2a,$aa   ; [$97ca] byte
    .byte $aa,$a8                           ; [$97d2] byte

TRUNK_BLOCKS_SCREEN_40:                     ; [$97d4]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$97d4] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$97dc] byte
    .byte $f0,$8c,$6f,$08,$d5,$31,$3d,$5f   ; [$97e4] byte
    .byte $2b,$ca,$35,$70,$03,$64,$d6,$75   ; [$97ec] byte
    .byte $cd,$6b,$59,$d5,$5c,$83,$3d,$c7   ; [$97f4] byte
    .byte $f4,$20,$33,$9d,$78,$d8,$35,$fd   ; [$97fc] byte
    .byte $7b,$60,$c2,$00,$50,$0d,$63,$62   ; [$9804] byte
    .byte $c5,$f5,$4c,$5f,$0f,$ca,$f5,$70   ; [$980c] byte
    .byte $d2,$50,$0d,$06,$75,$57,$25,$d4   ; [$9814] byte
    .byte $f1,$fd,$08,$0e,$21,$02,$71,$bc   ; [$981c] byte
    .byte $23,$1b,$54,$05,$03,$39,$75,$c0   ; [$9824] byte
    .byte $54,$35,$6c,$af,$56,$d2,$51,$76   ; [$982c] byte
    .byte $4c,$8b,$5b,$54,$d5,$b5,$3c,$63   ; [$9834] byte
    .byte $53,$a5,$5c,$4f,$49,$57,$39,$d4   ; [$983c] byte
    .byte $33,$d0,$d3,$d5,$76,$15,$cf,$57   ; [$9844] byte
    .byte $1b,$cd,$80,$30,$85,$71,$e5,$c6   ; [$984c] byte
    .byte $f0,$8c,$6f,$08,$b0,$8c,$6f,$08   ; [$9854] byte
    .byte $c6,$dc,$6f,$08,$c6,$f0,$8c,$6f   ; [$985c] byte
    .byte $08,$2a,$aa,$aa,$a8               ; [$9864] byte

TRUNK_BLOCKS_SCREEN_41:                     ; [$9869]
    .byte $c2,$31,$bc,$83,$1b,$c2,$33,$63   ; [$9869] byte
    .byte $1b,$c2,$31,$bc,$23,$1b,$c2,$31   ; [$9871] byte
    .byte $bc,$23,$1b,$74,$f7,$43,$d4,$31   ; [$9879] byte
    .byte $bc,$20,$d3,$f6,$9d,$0c,$0d,$42   ; [$9881] byte
    .byte $36,$ac,$c7,$4c,$d3,$b3,$1c,$c0   ; [$9889] byte
    .byte $d3,$33,$ed,$3b,$1e,$c9,$f1,$dc   ; [$9891] byte
    .byte $79,$ca,$dc,$fb,$4e,$cf,$ac,$fb   ; [$9899] byte
    .byte $3b,$cf,$b4,$ec,$ee,$cf,$b3,$bc   ; [$98a1] byte
    .byte $fb,$31,$c6,$31,$bc,$23,$58,$b5   ; [$98a9] byte
    .byte $bd,$62,$d6,$f5,$8b,$5b,$d6,$2d   ; [$98b1] byte
    .byte $6f,$58,$74,$fd,$a4,$dd,$76,$9d   ; [$98b9] byte
    .byte $c7,$75,$da,$77,$1d,$d7,$71,$37   ; [$98c1] byte
    .byte $5d,$c4,$76,$ad,$33,$4e,$de,$f6   ; [$98c9] byte
    .byte $8d,$77,$7b,$df,$b6,$bd,$ef,$7e   ; [$98d1] byte
    .byte $d7,$77,$bd,$fb,$6b,$57,$3e,$76   ; [$98d9] byte
    .byte $7d,$b5,$76,$f7,$6e,$db,$57,$6f   ; [$98e1] byte
    .byte $57,$4e,$76,$8c,$f9,$74,$c7,$68   ; [$98e9] byte
    .byte $d3,$97,$6e,$5d,$53,$3e,$76,$7d   ; [$98f1] byte
    .byte $39,$db,$97,$67,$cf,$9d,$bb,$4c   ; [$98f9] byte
    .byte $cf,$5d,$57,$4e,$dc,$b6,$8c,$fb   ; [$9901] byte
    .byte $72,$d9,$f4,$ed,$cb,$68,$d3,$b7   ; [$9909] byte
    .byte $2d,$9f,$4e,$c6,$f0,$8c,$6f,$08   ; [$9911] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9919] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$2a   ; [$9921] byte
    .byte $aa,$aa,$aa                       ; [$9929] byte

TRUNK_BLOCKS_SCREEN_42:                     ; [$992c]
    .byte $c2,$31,$bc,$23,$1b,$c2,$33,$63   ; [$992c] byte
    .byte $1b,$c2,$31,$bc,$23,$1b,$c2,$31   ; [$9934] byte
    .byte $bc,$23,$1b,$74,$fd,$a7,$50,$8d   ; [$993c] byte
    .byte $3f,$69,$d4,$17,$4f,$d0,$cd,$42   ; [$9944] byte
    .byte $36,$ac,$c3,$4c,$cc,$73,$0d,$70   ; [$994c] byte
    .byte $33,$1c,$c0,$c9,$f1,$dc,$7b,$31   ; [$9954] byte
    .byte $d7,$1c,$fb,$4e,$cf,$b4,$ec,$fb   ; [$995c] byte
    .byte $3b,$cf,$b4,$ec,$ef,$4e,$72,$1c   ; [$9964] byte
    .byte $f9,$d3,$b5,$bd,$61,$d6,$f5,$8b   ; [$996c] byte
    .byte $5b,$d6,$1d,$6f,$00,$de,$0b,$22   ; [$9974] byte
    .byte $dd,$76,$93,$75,$da,$77,$1d,$d7   ; [$997c] byte
    .byte $71,$37,$5d,$c4,$dd,$cb,$69,$de   ; [$9984] byte
    .byte $f7,$ed,$33,$7b,$d9,$f5,$dd,$ef   ; [$998c] byte
    .byte $7e,$da,$f7,$bd,$fb,$6f,$42,$76   ; [$9994] byte
    .byte $e5,$da,$36,$d5,$db,$dd,$bb,$1a   ; [$999c] byte
    .byte $77,$80,$76,$7d,$39,$d9,$f3,$e5   ; [$99a4] byte
    .byte $db,$9d,$a3,$3e,$41,$76,$8c,$e9   ; [$99ac] byte
    .byte $da,$34,$e7,$6e,$c6,$9d,$9f,$4e   ; [$99b4] byte
    .byte $40,$dc,$b6,$77,$72,$d9,$f3,$ed   ; [$99bc] byte
    .byte $cb,$67,$d3,$b7,$2d,$a3,$3e,$40   ; [$99c4] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$99cc] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$99d4] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$99dc] byte

TRUNK_BLOCKS_SCREEN_43:                     ; [$99e4]
    .byte $c2,$31,$bc,$23,$36,$c2,$31,$bc   ; [$99e4] byte
    .byte $83,$1b,$cd,$b1,$bc,$23,$36,$c2   ; [$99ec] byte
    .byte $31,$bc,$db,$1b,$74,$fd,$a7,$43   ; [$99f4] byte
    .byte $d4,$17,$08,$d3,$f7,$c3,$43,$df   ; [$99fc] byte
    .byte $34,$30,$da,$74,$cc,$fb,$4e,$cc   ; [$9a04] byte
    .byte $74,$3c,$03,$43,$da,$4c,$c3,$5c   ; [$9a0c] byte
    .byte $cc,$00,$d3,$b3,$ed,$3b,$4d,$ac   ; [$9a14] byte
    .byte $c3,$5c,$d3,$33,$ed,$3b,$4d,$d3   ; [$9a1c] byte
    .byte $b4,$dd,$3b,$3e,$2b,$74,$cf,$ac   ; [$9a24] byte
    .byte $fb,$4e,$cf,$b4,$eb,$74,$cf,$b7   ; [$9a2c] byte
    .byte $4c,$fa,$2c,$23,$36,$c6,$f0,$8c   ; [$9a34] byte
    .byte $db,$08,$d3,$2c,$6f,$08,$c6,$f3   ; [$9a3c] byte
    .byte $6c,$6f,$36,$cf,$ac,$c7,$43,$df   ; [$9a44] byte
    .byte $0d,$0f,$7c,$de,$0d,$0f,$7c,$34   ; [$9a4c] byte
    .byte $3d,$f3,$43,$5c,$fb,$27,$c8,$83   ; [$9a54] byte
    .byte $27,$dd,$c8,$00,$5c,$9f,$78,$00   ; [$9a5c] byte
    .byte $40,$01,$03,$77,$00,$00,$00,$00   ; [$9a64] byte
    .byte $00,$00,$00,$c6,$f0,$8c,$6f,$08   ; [$9a6c] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9a74] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$2a   ; [$9a7c] byte
    .byte $aa,$aa,$aa                       ; [$9a84] byte

TRUNK_BLOCKS_SCREEN_44:                     ; [$9a87]
    .byte $c2,$31,$bc,$23,$36,$c2,$0d,$33   ; [$9a87] byte
    .byte $1b,$cd,$b1,$bc,$23,$36,$c2,$31   ; [$9a8f] byte
    .byte $bc,$db,$08,$da,$77,$cd,$0f,$50   ; [$9a97] byte
    .byte $c6,$d1,$c2,$34,$fd,$0c,$df,$35   ; [$9a9f] byte
    .byte $09,$74,$cc,$fb,$4e,$d0,$f7,$c0   ; [$9aa7] byte
    .byte $d0,$f6,$9d,$33,$4e,$cf,$b4,$ea   ; [$9aaf] byte
    .byte $d3,$b3,$ed,$3b,$4d,$b3,$1c,$c0   ; [$9ab7] byte
    .byte $d3,$33,$ed,$3b,$3e,$ab,$08,$d6   ; [$9abf] byte
    .byte $f5,$8c,$f3,$5b,$d6,$33,$cd,$6f   ; [$9ac7] byte
    .byte $58,$cf,$35,$bd,$63,$3c,$d6,$f5   ; [$9acf] byte
    .byte $8c,$f1,$c6,$f0,$8d,$93,$69,$cc   ; [$9ad7] byte
    .byte $36,$4d,$a7,$5c,$d9,$36,$9c,$c3   ; [$9adf] byte
    .byte $64,$da,$73,$0d,$91,$de,$0c,$6f   ; [$9ae7] byte
    .byte $36,$c6,$f0,$8c,$6b,$3e,$74,$cc   ; [$9aef] byte
    .byte $f9,$d3,$32,$05,$dd,$cd,$f3,$43   ; [$9af7] byte
    .byte $df,$0d,$33,$27,$c2,$33,$6c,$23   ; [$9aff] byte
    .byte $36,$c2,$1c,$6c,$4d,$93,$00,$c5   ; [$9b07] byte
    .byte $b6,$4b,$00,$d9,$34,$3d,$f3,$64   ; [$9b0f] byte
    .byte $df,$1d,$93,$08,$de,$07,$6a,$d3   ; [$9b17] byte
    .byte $1c,$03,$6a,$70,$01,$c0,$05,$dd   ; [$9b1f] byte
    .byte $c5,$5d,$a7,$4c,$76,$9c,$c1,$da   ; [$9b27] byte
    .byte $73,$07,$1b,$30,$8c,$6f,$08,$c6   ; [$9b2f] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$9b37] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$2a,$aa   ; [$9b3f] byte
    .byte $aa,$aa                           ; [$9b47] byte

TRUNK_BLOCKS_SCREEN_45:                     ; [$9b49]
    .byte $c2,$32,$0c,$23,$36,$c2,$33,$6c   ; [$9b49] byte
    .byte $23,$36,$c2,$31,$bc,$db,$1b,$0c   ; [$9b51] byte
    .byte $20,$1d,$0c,$df,$34,$3d,$f3,$43   ; [$9b59] byte
    .byte $df,$0d,$0f,$7c,$dc,$49,$ca,$f5   ; [$9b61] byte
    .byte $cc,$33,$0b,$c3,$30,$bc,$bb,$2d   ; [$9b69] byte
    .byte $dc,$75,$ed,$93,$5f,$dc,$36,$b8   ; [$9b71] byte
    .byte $c6,$35,$bd,$63,$6c,$d6,$f5,$8d   ; [$9b79] byte
    .byte $b3,$5b,$d7,$76,$2d,$87,$13,$da   ; [$9b81] byte
    .byte $a8,$77,$13,$75,$dc,$4d,$d7,$67   ; [$9b89] byte
    .byte $db,$55,$44,$c6,$cc,$23,$7b,$df   ; [$9b91] byte
    .byte $b6,$bd,$ef,$5e,$36,$00,$d7,$cd   ; [$9b99] byte
    .byte $c1,$cd,$f4,$fd,$a7,$52,$5d,$4b   ; [$9ba1] byte
    .byte $58,$c7,$40,$c3,$f5,$bd,$a9,$ca   ; [$9ba9] byte
    .byte $f6,$ac,$fb,$7b,$76,$fd,$ef,$67   ; [$9bb1] byte
    .byte $d9,$35,$9d,$87,$5a,$d9,$30,$05   ; [$9bb9] byte
    .byte $c6,$1d,$3b,$52,$76,$ed,$49,$76   ; [$9bc1] byte
    .byte $27,$13,$55,$5c,$fb,$7b,$db,$b3   ; [$9bc9] byte
    .byte $ed,$ed,$5d,$51,$57,$70,$cf,$5c   ; [$9bd1] byte
    .byte $83,$72,$d9,$dd,$c9,$5d,$55,$76   ; [$9bd9] byte
    .byte $90,$c6,$f0,$87,$63,$c6,$f0,$8c   ; [$9be1] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$9be9] byte
    .byte $f0,$8c,$6f,$08,$27,$1b,$c2,$2a   ; [$9bf1] byte
    .byte $aa,$aa                           ; [$9bf9] byte

TRUNK_BLOCKS_SCREEN_46:                     ; [$9bfb]
    .byte $c2,$31,$bc,$d8,$00,$c2,$31,$bc   ; [$9bfb] byte
    .byte $db,$1b,$0c,$20,$34,$fd,$0f,$50   ; [$9c03] byte
    .byte $c6,$f0,$8d,$3f,$43,$df,$35,$0b   ; [$9c0b] byte
    .byte $08,$d3,$f4,$3d,$41,$dc,$4d,$37   ; [$9c13] byte
    .byte $3e,$cc,$73,$0d,$33,$4d,$cf,$b4   ; [$9c1b] byte
    .byte $ec,$c7,$30,$d3,$74,$ec,$fb,$31   ; [$9c23] byte
    .byte $da,$cd,$d1,$d3,$b3,$ed,$3b,$74   ; [$9c2b] byte
    .byte $d3,$ab,$3e,$dd,$33,$ea,$4d,$33   ; [$9c33] byte
    .byte $4e,$aa,$cf,$aa,$b2,$0c,$6a,$47   ; [$9c3b] byte
    .byte $3e,$aa,$aa,$c2,$1c,$6f,$08,$76   ; [$9c43] byte
    .byte $f7,$4e,$aa,$aa,$cc,$5d,$a7,$2b   ; [$9c4b] byte
    .byte $76,$e7,$3e,$aa,$aa,$9d,$33,$53   ; [$9c53] byte
    .byte $dc,$36,$ac,$fb,$4e,$aa,$aa,$b3   ; [$9c5b] byte
    .byte $15,$c5,$b3,$0d,$3a,$aa,$aa,$ad   ; [$9c63] byte
    .byte $39,$d3,$34,$ec,$fa,$aa,$aa,$ab   ; [$9c6b] byte
    .byte $3d,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$9c73] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$9c7b] byte
    .byte $c6,$f0,$8c,$6f,$08,$2a,$aa,$aa   ; [$9c83] byte
    .byte $aa                               ; [$9c8b] byte

TRUNK_BLOCKS_SCREEN_47:                     ; [$9c8c]
    .byte $c2,$31,$bc,$db,$08,$c6,$f0,$8c   ; [$9c8c] byte
    .byte $6f,$36,$c2,$31,$bc,$db,$1b,$0c   ; [$9c94] byte
    .byte $20,$34,$fd,$0f,$58,$db,$35,$bd   ; [$9c9c] byte
    .byte $a7,$75,$da,$75,$8d,$b3,$5b,$df   ; [$9ca4] byte
    .byte $36,$90,$0d,$33,$3e,$dd,$76,$7d   ; [$9cac] byte
    .byte $33,$7b,$da,$34,$ed,$d7,$67,$cf   ; [$9cb4] byte
    .byte $b4,$ec,$fb,$4e,$33,$ed,$39,$de   ; [$9cbc] byte
    .byte $f6,$8d,$39,$d9,$f3,$ed,$ef,$68   ; [$9cc4] byte
    .byte $d3,$b5,$ca,$2a,$dc,$9c,$fb,$72   ; [$9ccc] byte
    .byte $da,$34,$ed,$cb,$67,$c8,$34,$cc   ; [$9cd4] byte
    .byte $fa,$c6,$f0,$8d,$33,$1b,$c2,$31   ; [$9cdc] byte
    .byte $bc,$23,$1b,$c2,$31,$bc,$23,$1b   ; [$9ce4] byte
    .byte $5d,$3a,$ca,$f6,$97,$58,$db,$35   ; [$9cec] byte
    .byte $bd,$a7,$75,$da,$75,$8d,$b3,$5b   ; [$9cf4] byte
    .byte $5c,$fa,$d4,$f6,$ac,$6b,$1e,$dd   ; [$9cfc] byte
    .byte $76,$8d,$3b,$7b,$d9,$f3,$ed,$d7   ; [$9d04] byte
    .byte $68,$5d,$3a,$57,$4e,$de,$f6,$7c   ; [$9d0c] byte
    .byte $f9,$da,$34,$ed,$ef,$67,$cc,$5c   ; [$9d14] byte
    .byte $fa,$5c,$7b,$3e,$76,$8d,$39,$d9   ; [$9d1c] byte
    .byte $f3,$e7,$68,$d7,$33,$ed,$3a,$cf   ; [$9d24] byte
    .byte $5c,$fb,$4e,$dc,$b6,$7c,$83,$72   ; [$9d2c] byte
    .byte $da,$34,$ed,$cb,$67,$cf,$b4,$eb   ; [$9d34] byte
    .byte $75,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$9d3c] byte
    .byte $87,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$9d44] byte
    .byte $f0,$8c,$6f,$08,$2a,$a7,$1b,$aa   ; [$9d4c] byte
    .byte $aa                               ; [$9d54] byte

TRUNK_BLOCKS_SCREEN_48:                     ; [$9d55]
    .byte $c2,$32,$0d,$33,$3e,$de,$f6,$7c   ; [$9d55] byte
    .byte $fb,$7b,$da,$31,$bc,$23,$1b,$c2   ; [$9d5d] byte
    .byte $31,$bc,$20,$da,$57,$4e,$76,$8d   ; [$9d65] byte
    .byte $39,$d9,$dc,$d8,$1c,$d9,$57,$3e   ; [$9d6d] byte
    .byte $76,$7c,$f9,$da,$33,$1d,$0c,$36   ; [$9d75] byte
    .byte $9d,$0f,$69,$d3,$b3,$17,$66,$76   ; [$9d7d] byte
    .byte $8d,$39,$d9,$f6,$4d,$33,$64,$d3   ; [$9d85] byte
    .byte $36,$4d,$33,$64,$cf,$ac,$fb,$4e   ; [$9d8d] byte
    .byte $76,$7c,$fb,$72,$da,$15,$55,$d3   ; [$9d95] byte
    .byte $a8,$dc,$b6,$8d,$39,$d9,$d5,$55   ; [$9d9d] byte
    .byte $cf,$b1,$bc,$db,$1b,$cd,$b1,$bc   ; [$9da5] byte
    .byte $23,$36,$03,$1b,$c2,$33,$63,$1b   ; [$9dad] byte
    .byte $d3,$b3,$1d,$0f,$7c,$d0,$f7,$c3   ; [$9db5] byte
    .byte $43,$03,$7c,$34,$33,$5c,$cf,$ac   ; [$9dbd] byte
    .byte $fb,$4e,$cf,$b4,$ec,$fb,$4e,$36   ; [$9dc5] byte
    .byte $4d,$33,$64,$d3,$36,$4d,$33,$64   ; [$9dcd] byte
    .byte $d6,$f5,$8c,$f3,$5b,$d6,$33,$cd   ; [$9dd5] byte
    .byte $6f,$58,$cf,$15,$55,$da,$76,$ad   ; [$9ddd] byte
    .byte $d7,$69,$37,$5d,$a4,$d3,$95,$55   ; [$9de5] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9ded] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$9df5] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$9dfd] byte

TRUNK_BLOCKS_SCREEN_49:                     ; [$9e05]
    .byte $c2,$31,$bc,$23,$1b,$c2,$31,$bc   ; [$9e05] byte
    .byte $23,$1b,$c2,$31,$bc,$20,$d3,$31   ; [$9e0d] byte
    .byte $7c,$9f,$26,$5c,$d8,$73,$65,$cd   ; [$9e15] byte
    .byte $81,$5c,$3b,$17,$df,$0d,$0c,$df   ; [$9e1d] byte
    .byte $34,$3d,$f0,$d0,$f5,$0c,$6d,$50   ; [$9e25] byte
    .byte $df,$f6,$4d,$ff,$64,$df,$f6,$4d   ; [$9e2d] byte
    .byte $ff,$64,$df,$f0,$ac,$c7,$30,$50   ; [$9e35] byte
    .byte $d3,$1d,$31,$d3,$1d,$31,$d3,$10   ; [$9e3d] byte
    .byte $c5,$c0,$55,$55,$72,$0d,$33,$3e   ; [$9e45] byte
    .byte $40,$c2,$31,$bc,$db,$1b,$cd,$b1   ; [$9e4d] byte
    .byte $bc,$23,$36,$c2,$17,$4e,$40,$df   ; [$9e55] byte
    .byte $33,$1d,$0f,$7c,$d0,$f7,$c3,$43   ; [$9e5d] byte
    .byte $15,$40,$df,$f6,$4d,$ff,$64,$df   ; [$9e65] byte
    .byte $f6,$4d,$ff,$64,$df,$f3,$17,$17   ; [$9e6d] byte
    .byte $03,$27,$d3,$1d,$31,$d3,$1d,$31   ; [$9e75] byte
    .byte $d3,$34,$ec,$f9,$0c,$3f,$26,$55   ; [$9e7d] byte
    .byte $55,$73,$e9,$30,$fc,$9b,$10,$c6   ; [$9e85] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$9e8d] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$9e95] byte
    .byte $8c,$6f,$08,$2a,$aa,$aa,$aa       ; [$9e9d] byte

TRUNK_BLOCKS_SCREEN_50:                     ; [$9ea4]
    .byte $d4,$f2,$0d,$f3,$64,$df,$34,$cd   ; [$9ea4] byte
    .byte $3b,$3e,$d3,$b3,$ed,$3b,$3e,$d3   ; [$9eac] byte
    .byte $b3,$ed,$3b,$53,$36,$ad,$a5,$d3   ; [$9eb4] byte
    .byte $34,$ec,$77,$1e,$31,$da,$a9,$34   ; [$9ebc] byte
    .byte $cc,$9d,$76,$6c,$9f,$7c,$32,$6c   ; [$9ec4] byte
    .byte $96,$d9,$a9,$d1,$1c,$f9,$74,$ec   ; [$9ecc] byte
    .byte $fb,$4e,$cf,$b4,$ec,$fb,$4e,$b4   ; [$9ed4] byte
    .byte $ec,$81,$c6,$f0,$8c,$6f,$08,$c6   ; [$9edc] byte
    .byte $f0,$8c,$6f,$08,$d3,$30,$ac,$6f   ; [$9ee4] byte
    .byte $08,$c6,$f0,$85,$c4,$35,$bd,$63   ; [$9eec] byte
    .byte $10,$d6,$f5,$8c,$43,$5b,$d6,$34   ; [$9ef4] byte
    .byte $ed,$6f,$58,$d3,$b5,$b5,$d9,$36   ; [$9efc] byte
    .byte $9c,$c3,$64,$da,$73,$0d,$93,$30   ; [$9f04] byte
    .byte $36,$4d,$a7,$30,$d9,$33,$05,$74   ; [$9f0c] byte
    .byte $cc,$f9,$d3,$33,$e7,$4c,$cf,$9d   ; [$9f14] byte
    .byte $33,$3e,$74,$c5,$5d,$39,$74,$e5   ; [$9f1c] byte
    .byte $d3,$97,$4e,$5c,$c5,$5c,$f9,$73   ; [$9f24] byte
    .byte $e5,$cf,$97,$3e,$5c,$f9,$5d,$39   ; [$9f2c] byte
    .byte $74,$e5,$d3,$97,$4e,$5d,$3b,$3d   ; [$9f34] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$9f3c] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$9f44] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$9f4c] byte

TRUNK_BLOCKS_SCREEN_51:                     ; [$9f54]
    .byte $c6,$f0,$8c,$6f,$36,$30,$8c,$6f   ; [$9f54] byte
    .byte $36,$0c,$6f,$08,$cd,$b0,$8c,$6f   ; [$9f5c] byte
    .byte $08,$cd,$f4,$fd,$43,$37,$d3,$f5   ; [$9f64] byte
    .byte $0c,$df,$4f,$d4,$33,$7d,$3f,$50   ; [$9f6c] byte
    .byte $cd,$f4,$fd,$43,$37,$d4,$f6,$ad   ; [$9f74] byte
    .byte $9b,$3d,$da,$b6,$6c,$f7,$6a,$d9   ; [$9f7c] byte
    .byte $b3,$dd,$ab,$66,$cf,$76,$ad,$9b   ; [$9f84] byte
    .byte $2b,$74,$cc,$fb,$31,$d3,$34,$ec   ; [$9f8c] byte
    .byte $c7,$4c,$cf,$b3,$1d,$33,$4e,$cc   ; [$9f94] byte
    .byte $74,$cd,$3b,$53,$1d,$3a,$d3,$b3   ; [$9f9c] byte
    .byte $eb,$3e,$d3,$ad,$3b,$3e,$b3,$e5   ; [$9fa4] byte
    .byte $38,$0a,$aa,$aa,$ac,$81,$1c,$6f   ; [$9fac] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$9fb4] byte
    .byte $8c,$6f,$08,$c6,$f0,$85,$1c,$af   ; [$9fbc] byte
    .byte $69,$00,$00,$07,$3d,$5d,$4f,$4c   ; [$9fc4] byte
    .byte $d6,$f5,$8c,$f3,$5b,$d6,$33,$cd   ; [$9fcc] byte
    .byte $6f,$58,$cf,$35,$bd,$63,$3c,$55   ; [$9fd4] byte
    .byte $c0,$36,$ad,$d7,$00,$da,$b7,$5c   ; [$9fdc] byte
    .byte $03,$6a,$dd,$70,$03,$75,$cf,$5c   ; [$9fe4] byte
    .byte $f5,$da,$75,$cd,$cb,$69,$d7,$37   ; [$9fec] byte
    .byte $2d,$a7,$5c,$dc,$b6,$9d,$73,$72   ; [$9ff4] byte
    .byte $c6,$dc,$6f,$08,$c6,$f0,$8c,$6f   ; [$9ffc] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$a004] byte
    .byte $8c,$6f,$08,$1c,$22,$aa,$aa,$aa   ; [$a00c] byte

TRUNK_BLOCKS_SCREEN_52:                     ; [$a014]
    .byte $c6,$f0,$8d,$33,$08,$d3,$30,$8d   ; [$a014] byte
    .byte $33,$08,$d3,$30,$8d,$33,$08,$d3   ; [$a01c] byte
    .byte $30,$8c,$6f,$08,$cd,$f4,$fd,$ff   ; [$a024] byte
    .byte $31,$df,$f3,$1d,$ff,$31,$df,$f3   ; [$a02c] byte
    .byte $1d,$ff,$31,$df,$f3,$1d,$43,$37   ; [$a034] byte
    .byte $d4,$f6,$ad,$3b,$3e,$d3,$b3,$ed   ; [$a03c] byte
    .byte $3b,$3e,$d3,$b3,$ed,$3b,$3e,$d3   ; [$a044] byte
    .byte $b3,$ed,$9b,$2b,$5c,$fa,$aa,$aa   ; [$a04c] byte
    .byte $ac,$83,$53,$31,$b0,$00,$00,$05   ; [$a054] byte
    .byte $36,$90,$00,$00,$05,$36,$ad,$37   ; [$a05c] byte
    .byte $3e,$d3,$b4,$dd,$3b,$3e,$d3,$73   ; [$a064] byte
    .byte $ed,$3b,$4d,$d3,$b3,$e5,$cf,$5d   ; [$a06c] byte
    .byte $d3,$4e,$b7,$4c,$fa,$dd,$34,$eb   ; [$a074] byte
    .byte $74,$cf,$a5,$d6,$f5,$8c,$f3,$5b   ; [$a07c] byte
    .byte $d6,$33,$cd,$6f,$58,$cf,$35,$bd   ; [$a084] byte
    .byte $63,$3c,$d6,$f5,$8c,$f1,$c0,$0d   ; [$a08c] byte
    .byte $ef,$00,$37,$bc,$00,$de,$f0,$03   ; [$a094] byte
    .byte $7b,$c0,$0d,$ed,$da,$73,$07,$69   ; [$a09c] byte
    .byte $cc,$1d,$a7,$30,$76,$9c,$c1,$da   ; [$a0a4] byte
    .byte $73,$07,$3d,$c6,$f0,$8c,$6f,$08   ; [$a0ac] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a0b4] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$2a   ; [$a0bc] byte
    .byte $aa,$aa,$aa                       ; [$a0c4] byte

TRUNK_BLOCKS_SCREEN_53:                     ; [$a0c7]
    .byte $c6,$f2,$0d,$43,$08,$d3,$f6,$9d   ; [$a0c7] byte
    .byte $43,$08,$d3,$f6,$9d,$43,$08,$d3   ; [$a0cf] byte
    .byte $f5,$0c,$6f,$4f,$c2,$37,$6d,$73   ; [$a0d7] byte
    .byte $6c,$da,$75,$c3,$6c,$da,$4d,$73   ; [$a0df] byte
    .byte $6c,$dd,$b6,$9d,$70,$5d,$3b,$75   ; [$a0e7] byte
    .byte $d9,$f3,$ed,$9b,$75,$d9,$f3,$ed   ; [$a0ef] byte
    .byte $9b,$75,$d9,$f3,$ed,$3b,$3e,$5c   ; [$a0f7] byte
    .byte $fb,$52,$da,$34,$eb,$52,$da,$34   ; [$a0ff] byte
    .byte $eb,$52,$da,$34,$e8,$c6,$ed,$33   ; [$a107] byte
    .byte $7b,$d9,$f3,$eb,$7b,$d9,$f3,$eb   ; [$a10f] byte
    .byte $7b,$d9,$f3,$e9,$57,$72,$da,$34   ; [$a117] byte
    .byte $eb,$72,$da,$34,$eb,$72,$da,$34   ; [$a11f] byte
    .byte $ea,$c2,$07,$1b,$c2,$31,$bc,$23   ; [$a127] byte
    .byte $1b,$c2,$31,$bc,$20,$c6,$b3,$ec   ; [$a12f] byte
    .byte $6f,$08,$cf,$74,$fd,$63,$6c,$d6   ; [$a137] byte
    .byte $f6,$9d,$63,$6c,$d6,$f0,$0d,$63   ; [$a13f] byte
    .byte $6c,$d6,$f5,$85,$d4,$f0,$0d,$db   ; [$a147] byte
    .byte $75,$dd,$b5,$c3,$75,$dd,$b5,$c3   ; [$a14f] byte
    .byte $75,$dd,$b1,$bc,$22,$5d,$33,$52   ; [$a157] byte
    .byte $da,$36,$6d,$3b,$52,$da,$36,$6d   ; [$a15f] byte
    .byte $3b,$52,$c6,$f0,$8a,$cf,$57,$72   ; [$a167] byte
    .byte $74,$ec,$fb,$72,$74,$ec,$fb,$72   ; [$a16f] byte
    .byte $dd,$aa,$30,$8c,$6f,$08,$c6,$f0   ; [$a177] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$a17f] byte
    .byte $c6,$f0,$8a,$2a,$aa,$aa,$aa       ; [$a187] byte

TRUNK_BLOCKS_SCREEN_54:                     ; [$a18e]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$c3,$08   ; [$a18e] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a196] byte
    .byte $6f,$08,$d6,$36,$cd,$6f,$58,$db   ; [$a19e] byte
    .byte $35,$bd,$63,$6c,$d6,$f5,$8d,$b3   ; [$a1a6] byte
    .byte $5b,$d6,$36,$cd,$6f,$2b,$d7,$37   ; [$a1ae] byte
    .byte $5d,$db,$5c,$dd,$77,$6d,$73,$75   ; [$a1b6] byte
    .byte $dd,$b5,$c3,$76,$d7,$03,$53,$ce   ; [$a1be] byte
    .byte $b5,$2d,$9f,$4e,$d4,$b6,$7c,$fb   ; [$a1c6] byte
    .byte $52,$da,$34,$ec,$fb,$4e,$cf,$b4   ; [$a1ce] byte
    .byte $ec,$f9,$77,$b7,$3e,$de,$f6,$8d   ; [$a1d6] byte
    .byte $3b,$7b,$d9,$f3,$ea,$a9,$77,$27   ; [$a1de] byte
    .byte $4e,$dc,$b6,$7c,$fb,$72,$da,$32   ; [$a1e6] byte
    .byte $0d,$a7,$58,$b5,$bd,$61,$c2,$31   ; [$a1ee] byte
    .byte $bc,$db,$1b,$c2,$33,$6c,$23,$1b   ; [$a1f6] byte
    .byte $c2,$1d,$ab,$7d,$ce,$b7,$dd,$e1   ; [$a1fe] byte
    .byte $c6,$ed,$3f,$58,$db,$35,$bd,$63   ; [$a206] byte
    .byte $6c,$d6,$d7,$78,$37,$71,$c2,$34   ; [$a20e] byte
    .byte $fd,$db,$4e,$dd,$77,$6d,$73,$75   ; [$a216] byte
    .byte $dd,$b6,$ad,$f7,$77,$25,$70,$0d   ; [$a21e] byte
    .byte $33,$3e,$de,$f6,$8d,$3b,$7b,$da   ; [$a226] byte
    .byte $1d,$df,$78,$55,$72,$07,$4e,$76   ; [$a22e] byte
    .byte $7c,$f9,$54,$03,$3d,$5c,$6f,$08   ; [$a236] byte
    .byte $70,$8c,$6d,$c6,$f0,$8c,$6f,$08   ; [$a23e] byte
    .byte $c6,$f0,$8c,$6f,$08,$1d,$a4,$76   ; [$a246] byte
    .byte $91,$da,$6a,$aa                   ; [$a24e] byte

TRUNK_BLOCKS_SCREEN_55:                     ; [$a252]
    .byte $c2,$34,$cc,$fb,$3a,$cf,$b1,$73   ; [$a252] byte
    .byte $27,$c5,$f1,$0c,$9f,$17,$c4,$f1   ; [$a25a] byte
    .byte $7c,$6f,$08,$ca,$dc,$c7,$30,$d6   ; [$a262] byte
    .byte $1c,$ff,$21,$4c,$85,$5d,$70,$d4   ; [$a26a] byte
    .byte $f3,$3c,$fb,$3a,$cc,$57,$26,$72   ; [$a272] byte
    .byte $7c,$4d,$72,$7c,$9b,$10,$72,$0a   ; [$a27a] byte
    .byte $c2,$53,$10,$72,$65,$c7,$72,$6c   ; [$a282] byte
    .byte $40,$5c,$6f,$08,$13,$0f,$45,$c9   ; [$a28a] byte
    .byte $71,$77,$13,$5d,$63,$3e,$d6,$f5   ; [$a292] byte
    .byte $87,$07,$47,$27,$c4,$d1,$5d,$df   ; [$a29a] byte
    .byte $4e,$df,$77,$74,$31,$07,$26,$51   ; [$a2a2] byte
    .byte $54,$04,$17,$17,$53,$27,$77,$d4   ; [$a2aa] byte
    .byte $0c,$75,$1c,$55,$5c,$9f,$26,$54   ; [$a2b2] byte
    .byte $01,$1c,$9d,$5c,$9b,$1b,$cf,$54   ; [$a2ba] byte
    .byte $03,$1d,$71,$3c,$99,$72,$79,$30   ; [$a2c2] byte
    .byte $8c,$6f,$08,$c6,$f0,$8c,$6f,$08   ; [$a2ca] byte
    .byte $d3,$1c,$5c,$72,$65,$c2,$2a,$aa   ; [$a2d2] byte
    .byte $8c,$6f,$08,$c9,$f1,$7c,$6f,$08   ; [$a2da] byte

TRUNK_BLOCKS_SCREEN_56:                     ; [$a2e2]
    .byte $c2,$31,$bc,$23,$1b,$cd,$b1,$bc   ; [$a2e2] byte
    .byte $23,$1b,$cd,$b1,$bc,$23,$1b,$cd   ; [$a2ea] byte
    .byte $b1,$bc,$83,$08,$ca,$f5,$8c,$f3   ; [$a2f2] byte
    .byte $5b,$d0,$f5,$8c,$f3,$5b,$d0,$f5   ; [$a2fa] byte
    .byte $8c,$f3,$5b,$d0,$f5,$87,$2b,$d4   ; [$a302] byte
    .byte $f6,$ad,$f3,$76,$d7,$0d,$f3,$76   ; [$a30a] byte
    .byte $d7,$0d,$f3,$76,$d7,$07,$53,$34   ; [$a312] byte
    .byte $cd,$37,$4c,$d3,$74,$ed,$37,$4c   ; [$a31a] byte
    .byte $d3,$74,$ed,$37,$4c,$d3,$74,$e5   ; [$a322] byte
    .byte $1d,$d3,$4e,$dd,$1d,$d3,$4e,$dd   ; [$a32a] byte
    .byte $1d,$d3,$4e,$dd,$15,$1d,$3b,$3e   ; [$a332] byte
    .byte $b3,$eb,$3e,$b3,$eb,$3e,$b3,$e5   ; [$a33a] byte
    .byte $36,$9c,$fa,$aa,$aa,$a5,$35,$bd   ; [$a342] byte
    .byte $63,$64,$d6,$f5,$8d,$93,$5b,$d6   ; [$a34a] byte
    .byte $36,$4d,$6f,$58,$d9,$35,$bd,$61   ; [$a352] byte
    .byte $38,$0d,$a9,$da,$73,$07,$69,$cc   ; [$a35a] byte
    .byte $1d,$a7,$30,$76,$9c,$c1,$1c,$6c   ; [$a362] byte
    .byte $d3,$33,$ec,$6f,$36,$c6,$cc,$d8   ; [$a36a] byte
    .byte $c6,$f0,$8d,$31,$1d,$ab,$5a,$74   ; [$a372] byte
    .byte $ed,$67,$43,$df,$35,$9d,$0f,$7c   ; [$a37a] byte
    .byte $d6,$77,$c5,$17,$64,$73,$ed,$93   ; [$a382] byte
    .byte $4c,$cf,$b6,$4d,$33,$3e,$d9,$36   ; [$a38a] byte
    .byte $9c,$f9,$15,$74,$ec,$c5,$d3,$b3   ; [$a392] byte
    .byte $17,$4e,$cc,$74,$cd,$39           ; [$a39a] byte

TRUNK_BLOCKS_SCREEN_57:                     ; [$a3a0]
    .byte $c5,$f1,$1d,$ab,$1b,$cd,$8c,$23   ; [$a3a0] byte
    .byte $1b,$cd,$8c,$6c,$cd,$8c,$6f,$08   ; [$a3a8] byte
    .byte $57,$08,$d3,$f4,$3d,$43,$37,$d3   ; [$a3b0] byte
    .byte $f4,$3d,$43,$37,$d3,$f4,$3d,$43   ; [$a3b8] byte
    .byte $37,$57,$2b,$d3,$37,$13,$75,$dc   ; [$a3c0] byte
    .byte $43,$75,$dc,$43,$75,$57,$3d,$75   ; [$a3c8] byte
    .byte $dd,$af,$7b,$df,$b6,$bd,$bf,$7b   ; [$a3d0] byte
    .byte $df,$b6,$bd,$bf,$7b,$57,$08,$76   ; [$a3d8] byte
    .byte $d5,$5d,$b9,$5d,$b9,$57,$31,$73   ; [$a3e0] byte
    .byte $ed,$75,$77,$0d,$31,$77,$0d,$31   ; [$a3e8] byte
    .byte $57,$1b,$c2,$2d,$b5,$71,$bc,$23   ; [$a3f0] byte
    .byte $1b,$c2,$05,$57,$08,$d3,$dd,$39   ; [$a3f8] byte
    .byte $db,$b6,$9c,$c3,$75,$cc,$05,$55   ; [$a400] byte
    .byte $da,$73,$ec,$3d,$74,$dd,$3b,$7b   ; [$a408] byte
    .byte $d9,$f4,$dd,$39,$57,$2b,$d3,$30   ; [$a410] byte
    .byte $fc,$99,$da,$37,$4c,$f9,$da,$37   ; [$a418] byte
    .byte $4c,$f9,$57,$53,$72,$7c,$77,$72   ; [$a420] byte
    .byte $d9,$f3,$ed,$3b,$72,$d9,$f3,$ed   ; [$a428] byte
    .byte $3b,$72,$55,$71,$bc,$20,$c6,$f0   ; [$a430] byte
    .byte $80,$c6,$f0,$8c,$6f,$08,$5c,$23   ; [$a438] byte
    .byte $3d,$57,$1b,$a7,$1b,$aa           ; [$a440] byte

TRUNK_BLOCKS_SCREEN_58:                     ; [$a446]
    .byte $cd,$b0,$8c,$6f,$08,$cd,$8c,$23   ; [$a446] byte
    .byte $1b,$cd,$8c,$6c,$cd,$8c,$6f,$08   ; [$a44e] byte
    .byte $d0,$f7,$cd,$43,$37,$d3,$f4,$3d   ; [$a456] byte
    .byte $43,$37,$d3,$f4,$3d,$43,$37,$d3   ; [$a45e] byte
    .byte $f4,$3d,$43,$37,$da,$43,$75,$da   ; [$a466] byte
    .byte $77,$13,$75,$dc,$43,$75,$dc,$43   ; [$a46e] byte
    .byte $75,$d9,$f3,$ed,$3b,$7b,$d9,$f5   ; [$a476] byte
    .byte $dd,$af,$7b,$df,$b6,$b3,$7b,$df   ; [$a47e] byte
    .byte $b6,$bd,$bf,$7b,$da,$34,$e9,$da   ; [$a486] byte
    .byte $36,$d5,$51,$5d,$b9,$d9,$f3,$e9   ; [$a48e] byte
    .byte $d9,$f3,$ed,$75,$5d,$bd,$77,$0d   ; [$a496] byte
    .byte $31,$da,$34,$e9,$da,$1d,$b5,$5d   ; [$a49e] byte
    .byte $b9,$db,$b5,$ce,$03,$72,$d9,$f3   ; [$a4a6] byte
    .byte $e9,$d9,$f4,$e1,$db,$b7,$0c,$c1   ; [$a4ae] byte
    .byte $da,$33,$e7,$2b,$da,$32,$0d,$31   ; [$a4b6] byte
    .byte $da,$33,$ec,$3d,$75,$cc,$f9,$d9   ; [$a4be] byte
    .byte $f4,$ec,$c7,$53,$d9,$dc,$21,$d9   ; [$a4c6] byte
    .byte $f0,$f9,$da,$34,$e5,$da,$33,$e9   ; [$a4ce] byte
    .byte $da,$17,$72,$da,$33,$ed,$3b,$72   ; [$a4d6] byte
    .byte $d9,$f3,$eb,$72,$d9,$f4,$e3,$3d   ; [$a4de] byte
    .byte $c6,$dc,$6e,$c6,$f0,$8c,$6f,$08   ; [$a4e6] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a4ee] byte
    .byte $6f,$08,$1c,$22,$aa,$aa,$aa       ; [$a4f6] byte

TRUNK_BLOCKS_SCREEN_59:                     ; [$a4fd]
    .byte $cd,$b0,$8c,$6f,$08,$cd,$8c,$23   ; [$a4fd] byte
    .byte $1b,$cd,$8c,$6c,$cd,$8c,$6f,$08   ; [$a505] byte
    .byte $d0,$f7,$cd,$43,$37,$d3,$f4,$3d   ; [$a50d] byte
    .byte $43,$37,$d3,$f4,$3d,$43,$37,$d3   ; [$a515] byte
    .byte $f4,$3d,$43,$37,$dd,$b5,$c3,$75   ; [$a51d] byte
    .byte $dd,$b5,$c3,$75,$dd,$b5,$c3,$75   ; [$a525] byte
    .byte $dd,$b5,$c3,$31,$d9,$f3,$ed,$3b   ; [$a52d] byte
    .byte $7b,$d9,$f3,$ed,$3b,$7b,$d9,$f4   ; [$a535] byte
    .byte $ec,$fb,$7b,$da,$34,$ec,$fb,$4e   ; [$a53d] byte
    .byte $da,$34,$e9,$da,$34,$e9,$73,$e9   ; [$a545] byte
    .byte $c2,$31,$bc,$23,$1b,$d9,$f3,$e9   ; [$a54d] byte
    .byte $d9,$f3,$e9,$da,$34,$e9,$cc,$75   ; [$a555] byte
    .byte $0a,$da,$34,$e9,$da,$15,$d9,$f3   ; [$a55d] byte
    .byte $e9,$d9,$f5,$cc,$c7,$69,$ca,$f4   ; [$a565] byte
    .byte $c9,$d9,$f4,$e1,$da,$34,$e9,$da   ; [$a56d] byte
    .byte $33,$ed,$38,$d4,$dc,$fb,$72,$da   ; [$a575] byte
    .byte $33,$ec,$3f,$72,$d9,$f5,$c7,$72   ; [$a57d] byte
    .byte $d9,$f4,$e9,$5c,$6f,$08,$c6,$b0   ; [$a585] byte
    .byte $fc,$6f,$08,$c6,$b4,$ec,$6f,$08   ; [$a58d] byte
    .byte $c6,$b3,$ec,$6f,$08,$cf,$71,$bc   ; [$a595] byte
    .byte $22,$b1,$bc,$22,$b1,$bc,$22,$b1   ; [$a59d] byte
    .byte $bc,$22,$30,$8a,$aa,$aa,$aa,$d4   ; [$a5a5] byte
    .byte $1d,$3f,$50,$b4,$fd,$42,$d3,$f5   ; [$a5ad] byte
    .byte $0b,$4f,$d4,$2a                   ; [$a5b5] byte

TRUNK_BLOCKS_SCREEN_60:                     ; [$a5b9]
    .byte $cd,$b1,$bc,$23,$1b,$c2,$34,$cc   ; [$a5b9] byte
    .byte $5f,$10,$31,$3d,$33,$17,$c4,$f1   ; [$a5c1] byte
    .byte $7c,$6f,$08,$d3,$f7,$cd,$41,$55   ; [$a5c9] byte
    .byte $32,$75,$5c,$c7,$30,$dd,$b5,$c1   ; [$a5d1] byte
    .byte $55,$32,$ec,$bf,$27,$c6,$9c,$40   ; [$a5d9] byte
    .byte $d3,$b2,$0d,$39,$55,$32,$4c,$9f   ; [$a5e1] byte
    .byte $07,$ca,$97,$17,$c2,$1c,$21,$55   ; [$a5e9] byte
    .byte $31,$3c,$9b,$17,$c9,$d3,$1b,$d3   ; [$a5f1] byte
    .byte $dd,$42,$d3,$d5,$1c,$5f,$27,$c8   ; [$a5f9] byte
    .byte $34,$cc,$6c,$d3,$33,$1d,$31,$da   ; [$a601] byte
    .byte $97,$27,$c7,$71,$e7,$1b,$71,$b3   ; [$a609] byte
    .byte $43,$cf,$b4,$e1,$5c,$9f,$26,$c1   ; [$a611] byte
    .byte $b1,$37,$59,$76,$ad,$73,$13,$d3   ; [$a619] byte
    .byte $a3,$1b,$9c,$97,$17,$c4,$14,$8c   ; [$a621] byte
    .byte $5d,$c2,$0c,$6f,$08,$1c,$5c,$57   ; [$a629] byte
    .byte $06,$c9,$f1,$71,$cf,$71,$ba,$d3   ; [$a631] byte
    .byte $f1,$a7,$0f,$c7,$5c,$9f,$45,$ca   ; [$a639] byte
    .byte $91,$c6,$f0,$8b,$4f,$d3,$31,$7c   ; [$a641] byte
    .byte $9f,$26,$c9,$5c,$9b,$17,$c6,$f0   ; [$a649] byte
    .byte $8c,$6f,$08,$53,$4c,$c5,$f2,$7c   ; [$a651] byte
    .byte $9b,$17,$1c,$5c,$d4,$2a           ; [$a659] byte

TRUNK_BLOCKS_SCREEN_61:                     ; [$a65f]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a65f] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$a667] byte
    .byte $f0,$8c,$6f,$08,$da,$40,$03,$71   ; [$a66f] byte
    .byte $d4,$1d,$3f,$71,$0d,$43,$2b,$d3   ; [$a677] byte
    .byte $33,$ed,$3b,$3e,$d3,$b3,$ed,$3b   ; [$a67f] byte
    .byte $3e,$ce,$b3,$1d,$77,$6b,$0d,$bb   ; [$a687] byte
    .byte $53,$74,$eb,$4d,$b4,$db,$4d,$b4   ; [$a68f] byte
    .byte $ed,$b7,$56,$0d,$31,$c2,$31,$bc   ; [$a697] byte
    .byte $23,$1b,$c2,$31,$bc,$23,$1b,$c2   ; [$a69f] byte
    .byte $31,$bc,$23,$36,$31,$bc,$21,$d6   ; [$a6a7] byte
    .byte $f6,$9d,$63,$31,$d6,$f6,$9d,$63   ; [$a6af] byte
    .byte $31,$cc,$0d,$c7,$43,$36,$9d,$c5   ; [$a6b7] byte
    .byte $df,$77,$8d,$df,$4e,$df,$77,$82   ; [$a6bf] byte
    .byte $cf,$33,$ed,$77,$6b,$db,$b3,$ed   ; [$a6c7] byte
    .byte $39,$77,$73,$7d,$37,$70,$ad,$b5   ; [$a6cf] byte
    .byte $d3,$35,$bd,$a5,$50,$00,$31,$7d   ; [$a6d7] byte
    .byte $3b,$70,$da,$77,$71,$50,$00,$17   ; [$a6df] byte
    .byte $3e,$d3,$b3,$ed,$39,$50,$00,$30   ; [$a6e7] byte
    .byte $fc,$fa,$ac,$83,$3d,$c6,$f0,$8c   ; [$a6ef] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$a6f7] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$87,$08   ; [$a6ff] byte
    .byte $2a,$aa,$aa,$a7,$1b               ; [$a707] byte

TRUNK_BLOCKS_SCREEN_62:                     ; [$a70c]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a70c] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$a714] byte
    .byte $f0,$8c,$6f,$08,$34,$fd,$41,$d3   ; [$a71c] byte
    .byte $f5,$0b,$4f,$d4,$1d,$3f,$50,$b4   ; [$a724] byte
    .byte $fd,$41,$34,$cd,$3b,$43,$d3,$33   ; [$a72c] byte
    .byte $ed,$f3,$4c,$ce,$b7,$cd,$33,$3e   ; [$a734] byte
    .byte $df,$34,$cd,$3b,$7c,$ca,$f7,$c2   ; [$a73c] byte
    .byte $cf,$b4,$eb,$4e,$cf,$b4,$ec,$fb   ; [$a744] byte
    .byte $4e,$b4,$ec,$fa,$d4,$f5,$c2,$2a   ; [$a74c] byte
    .byte $aa,$a8,$c6,$30,$0d,$63,$3c,$d6   ; [$a754] byte
    .byte $e3,$58,$df,$0d,$6f,$08,$d3,$30   ; [$a75c] byte
    .byte $8d,$33,$08,$d4,$dd,$a7,$64,$da   ; [$a764] byte
    .byte $75,$c0,$03,$31,$73,$17,$31,$c6   ; [$a76c] byte
    .byte $36,$ad,$71,$d3,$35,$bd,$f3,$58   ; [$a774] byte
    .byte $cf,$b4,$ed,$6f,$7c,$35,$8c,$fb   ; [$a77c] byte
    .byte $5b,$d4,$f4,$cd,$95,$76,$ad,$73   ; [$a784] byte
    .byte $4c,$d9,$0d,$ab,$5c,$34,$cd,$93   ; [$a78c] byte
    .byte $69,$c6,$35,$4d,$39,$4d,$3b,$3e   ; [$a794] byte
    .byte $4d,$33,$3e,$d3,$b3,$e7,$4c,$cf   ; [$a79c] byte
    .byte $75,$5c,$f9,$4c,$fa,$47,$4e,$a5   ; [$a7a4] byte
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a7ac] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$a7b4] byte
    .byte $f0,$8c,$6f,$08,$2a,$aa,$aa,$aa   ; [$a7bc] byte

TRUNK_BLOCKS_SCREEN_63:                     ; [$a7c4]
    .byte $c6,$f0,$8c,$6f,$08,$c6,$f0,$8c   ; [$a7c4] byte
    .byte $6f,$08,$c6,$f0,$8c,$6f,$08,$c6   ; [$a7cc] byte
    .byte $f0,$8c,$6f,$08,$34,$fd,$41,$d3   ; [$a7d4] byte
    .byte $f5,$0b,$4f,$d4,$1d,$3f,$50,$b4   ; [$a7dc] byte
    .byte $fd,$41,$df,$34,$cd,$3b,$43,$d3   ; [$a7e4] byte
    .byte $33,$ed,$f3,$4c,$ce,$b7,$cd,$33   ; [$a7ec] byte
    .byte $3e,$df,$34,$cd,$3b,$2b,$cf,$a2   ; [$a7f4] byte
    .byte $cf,$b4,$eb,$4e,$cf,$b4,$ec,$fb   ; [$a7fc] byte
    .byte $4e,$b4,$ec,$fb,$18,$d3,$ad,$3a   ; [$a804] byte
    .byte $2a,$aa,$ab,$3d,$c2,$33,$6c,$20   ; [$a80c] byte
    .byte $d3,$30,$8d,$33,$1b,$cd,$b4,$cc   ; [$a814] byte
    .byte $23,$1a,$c2,$34,$cc,$6f,$08,$df   ; [$a81c] byte
    .byte $34,$3d,$f0,$73,$17,$43,$1d,$f3   ; [$a824] byte
    .byte $4c,$cc,$5d,$41,$dc,$4d,$63,$64   ; [$a82c] byte
    .byte $d6,$f7,$c3,$58,$d9,$35,$bd,$c4   ; [$a834] byte
    .byte $d6,$36,$6d,$6f,$2b,$d7,$76,$bd   ; [$a83c] byte
    .byte $b9,$da,$75,$c0,$76,$9d,$b7,$6b   ; [$a844] byte
    .byte $db,$b7,$cd,$ab,$18,$db,$55,$d3   ; [$a84c] byte
    .byte $33,$ed,$3b,$3e,$74,$c3,$70,$d3   ; [$a854] byte
    .byte $b3,$15,$cf,$b7,$0d,$31,$74,$ea   ; [$a85c] byte
    .byte $77,$3c,$ac,$34,$cc,$fb,$3d,$c6   ; [$a864] byte
    .byte $f0,$8c,$6f,$08,$c6,$f0,$8c,$6f   ; [$a86c] byte
    .byte $08,$c6,$f0,$8c,$6f,$08,$c6,$f0   ; [$a874] byte
    .byte $8c,$6f,$08,$2a,$aa,$aa,$aa       ; [$a87c] byte

BRANCH_BLOCKS:                              ; [$a883]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_00  ; BRANCH_BLOCKS_SCREEN_00
                                            ; [$PRG1::a883]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_01  ; BRANCH_BLOCKS_SCREEN_01
                                            ; [$PRG1::a885]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_02  ; BRANCH_BLOCKS_SCREEN_02
                                            ; [$PRG1::a887]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_03  ; BRANCH_BLOCKS_SCREEN_03
                                            ; [$PRG1::a889]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_04  ; BRANCH_BLOCKS_SCREEN_04
                                            ; [$PRG1::a88b]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_05  ; BRANCH_BLOCKS_SCREEN_05
                                            ; [$PRG1::a88d]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_06  ; BRANCH_BLOCKS_SCREEN_06
                                            ; [$PRG1::a88f]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_07  ; BRANCH_BLOCKS_SCREEN_07
                                            ; [$PRG1::a891]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_08  ; BRANCH_BLOCKS_SCREEN_08
                                            ; [$PRG1::a893]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_09  ; BRANCH_BLOCKS_SCREEN_09
                                            ; [$PRG1::a895]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_10  ; BRANCH_BLOCKS_SCREEN_10
                                            ; [$PRG1::a897]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_11  ; BRANCH_BLOCKS_SCREEN_11
                                            ; [$PRG1::a899]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_12  ; BRANCH_BLOCKS_SCREEN_12
                                            ; [$PRG1::a89b]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_13  ; BRANCH_BLOCKS_SCREEN_13
                                            ; [$PRG1::a89d]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_14  ; BRANCH_BLOCKS_SCREEN_14
                                            ; [$PRG1::a89f]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_15  ; BRANCH_BLOCKS_SCREEN_15
                                            ; [$PRG1::a8a1]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_16  ; BRANCH_BLOCKS_SCREEN_16
                                            ; [$PRG1::a8a3]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_17  ; BRANCH_BLOCKS_SCREEN_17
                                            ; [$PRG1::a8a5]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_18  ; BRANCH_BLOCKS_SCREEN_18
                                            ; [$PRG1::a8a7]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_19  ; BRANCH_BLOCKS_SCREEN_19
                                            ; [$PRG1::a8a9]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_20  ; BRANCH_BLOCKS_SCREEN_20
                                            ; [$PRG1::a8ab]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_21  ; BRANCH_BLOCKS_SCREEN_21
                                            ; [$PRG1::a8ad]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_22  ; BRANCH_BLOCKS_SCREEN_22
                                            ; [$PRG1::a8af]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_23  ; BRANCH_BLOCKS_SCREEN_23
                                            ; [$PRG1::a8b1]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_24  ; BRANCH_BLOCKS_SCREEN_24
                                            ; [$PRG1::a8b3]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_25  ; BRANCH_BLOCKS_SCREEN_25
                                            ; [$PRG1::a8b5]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_26  ; BRANCH_BLOCKS_SCREEN_26
                                            ; [$PRG1::a8b7]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_27  ; BRANCH_BLOCKS_SCREEN_27
                                            ; [$PRG1::a8b9]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_28  ; BRANCH_BLOCKS_SCREEN_28
                                            ; [$PRG1::a8bb]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_29  ; BRANCH_BLOCKS_SCREEN_29
                                            ; [$PRG1::a8bd]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_30  ; BRANCH_BLOCKS_SCREEN_30
                                            ; [$PRG1::a8bf]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_31  ; BRANCH_BLOCKS_SCREEN_31
                                            ; [$PRG1::a8c1]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_32  ; BRANCH_BLOCKS_SCREEN_32
                                            ; [$PRG1::a8c3]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_33  ; BRANCH_BLOCKS_SCREEN_33
                                            ; [$PRG1::a8c5]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_34  ; BRANCH_BLOCKS_SCREEN_34
                                            ; [$PRG1::a8c7]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_35  ; BRANCH_BLOCKS_SCREEN_35
                                            ; [$PRG1::a8c9]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_36  ; BRANCH_BLOCKS_SCREEN_36
                                            ; [$PRG1::a8cb]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_37  ; BRANCH_BLOCKS_SCREEN_37
                                            ; [$PRG1::a8cd]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_38  ; BRANCH_BLOCKS_SCREEN_38
                                            ; [$PRG1::a8cf]
    bank_offset_16 BRANCH_BLOCKS_SCREEN_39  ; BRANCH_BLOCKS_SCREEN_39
                                            ; [$PRG1::a8d1]

;
; XREFS:
;     BRANCH_BLOCKS [$PRG1::a883]
;
BRANCH_BLOCKS_SCREEN_00:                    ; [$a8d3]
    .byte $c0,$40,$00,$00,$00,$00,$00,$c0   ; [$a8d3] byte
    .byte $b0,$5c,$0f,$0b,$c3,$30,$d0,$40   ; [$a8db] byte
    .byte $30,$2c,$17,$03,$c1,$b0,$a3,$17   ; [$a8e3] byte
    .byte $c6,$31,$dc,$3c,$40,$c2,$30,$6c   ; [$a8eb] byte
    .byte $57,$18,$c3,$c3,$16,$c7,$31,$ac   ; [$a8f3] byte
    .byte $73,$1a,$4c,$0b,$03,$c5,$71,$dc   ; [$a8fb] byte
    .byte $3f,$1c,$c6,$83,$1b,$c2,$72,$3c   ; [$a903] byte
    .byte $27,$23,$71,$ec,$a3,$0f,$c6,$71   ; [$a90b] byte
    .byte $a3,$09,$c8,$c3,$22,$72,$47,$24   ; [$a913] byte
    .byte $71,$f7,$1a,$c8,$c1,$c9,$32,$dc   ; [$a91b] byte
    .byte $44,$55,$c7,$b2,$8c,$73,$23,$c8   ; [$a923] byte
    .byte $b2,$5c,$99,$c9,$b2,$c7,$26,$72   ; [$a92b] byte
    .byte $67,$26,$c8,$1c,$27,$22,$c9,$71   ; [$a933] byte
    .byte $1c,$ad,$ca,$f2,$d7,$2b,$72,$b7   ; [$a93b] byte
    .byte $2b,$c7,$95,$51,$c9,$31,$10,$72   ; [$a943] byte
    .byte $47,$24,$c8,$15,$72,$95,$50,$55   ; [$a94b] byte
    .byte $c0,$72,$15,$72,$ac,$4d,$c5,$13   ; [$a953] byte
    .byte $13,$72,$e7,$26,$72,$0c,$3c,$00   ; [$a95b] byte
    .byte $00,$00                           ; [$a963] byte

BRANCH_BLOCKS_SCREEN_01:                    ; [$a965]
    .byte $c0,$40,$00,$00,$00,$c3,$73,$0c   ; [$a965] byte
    .byte $bd,$00,$00,$00,$c3,$f3,$8c,$1b   ; [$a96d] byte
    .byte $30,$cb,$d0,$00,$00,$c6,$b1,$cc   ; [$a975] byte
    .byte $df,$38,$c1,$b3,$0c,$bd,$00,$c0   ; [$a97d] byte
    .byte $b0,$40,$c8,$f0,$9c,$6f,$1c,$cd   ; [$a985] byte
    .byte $f3,$9c,$e3,$30,$c1,$0c,$17,$03   ; [$a98d] byte
    .byte $c5,$71,$dc,$3c,$c4,$5c,$af,$09   ; [$a995] byte
    .byte $c8,$b1,$a3,$37,$ce,$0c,$77,$0f   ; [$a99d] byte
    .byte $c5,$b2,$2c,$ff,$1a,$c9,$9c,$99   ; [$a9a5] byte
    .byte $c9,$b2,$33,$3f,$c6,$b1,$cc,$8b   ; [$a9ad] byte
    .byte $1b,$c4,$b2,$4c,$27,$24,$ca,$dc   ; [$a9b5] byte
    .byte $ad,$c5,$32,$5c,$47,$09,$c8,$f0   ; [$a9bd] byte
    .byte $9c,$93,$11,$c2,$55,$c4,$5c,$91   ; [$a9c5] byte
    .byte $71,$11,$c9,$15,$55,$55,$53,$3a   ; [$a9cd] byte
    .byte $cb,$b3,$a7,$13,$ce,$b2,$ec,$eb   ; [$a9d5] byte
    .byte $34,$73,$ac,$bb,$3a,$53,$26,$cd   ; [$a9dd] byte
    .byte $33,$5c,$d3,$35,$cd,$33,$5c,$d3   ; [$a9e5] byte
    .byte $35,$b3,$5c,$d3,$35,$cd,$33,$5c   ; [$a9ed] byte
    .byte $9b,$0f,$cc,$73,$9c,$c4,$ce,$73   ; [$a9f5] byte
    .byte $10,$c3,$c3,$31,$cc,$83,$33,$c0   ; [$a9fd] byte
    .byte $40,$00                           ; [$aa05] byte

BRANCH_BLOCKS_SCREEN_02:                    ; [$aa07]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$aa07] byte
    .byte $00,$00,$00,$00,$00,$cb,$f0,$2c   ; [$aa0f] byte
    .byte $13,$05,$cb,$d0,$00,$c0,$b0,$40   ; [$aa17] byte
    .byte $ce,$4c,$3f,$37,$c1,$b3,$0c,$14   ; [$aa1f] byte
    .byte $c1,$0c,$17,$03,$c1,$b1,$dc,$3c   ; [$aa27] byte
    .byte $cf,$b2,$2c,$ff,$1a,$b0,$fc,$e4   ; [$aa2f] byte
    .byte $03,$0f,$c5,$b2,$2c,$ff,$22,$cf   ; [$aa37] byte
    .byte $72,$5c,$27,$22,$33,$fc,$8b,$3f   ; [$aa3f] byte
    .byte $c6,$f3,$fc,$8b,$1a,$cf,$72,$5c   ; [$aa47] byte
    .byte $27,$24,$57,$24,$c4,$70,$9c,$93   ; [$aa4f] byte
    .byte $09,$c9,$30,$9c,$93,$23,$55,$5c   ; [$aa57] byte
    .byte $e9,$73,$a7,$3a,$57,$11,$5c,$e9   ; [$aa5f] byte
    .byte $cd,$33,$5c,$d3,$35,$cd,$33,$5c   ; [$aa67] byte
    .byte $d3,$35,$c9,$b3,$a5,$5c,$d3,$35   ; [$aa6f] byte
    .byte $c9,$b3,$1c,$c8,$03,$21,$cd,$33   ; [$aa77] byte
    .byte $5c,$d3,$35,$cd,$33,$5c,$c7,$33   ; [$aa7f] byte
    .byte $c0,$40,$03,$20,$ce,$f3,$1c,$c8   ; [$aa87] byte
    .byte $33,$3c,$04,$00,$00,$00,$00       ; [$aa8f] byte

BRANCH_BLOCKS_SCREEN_03:                    ; [$aa96]
    .byte $c0,$40,$00,$00,$00,$00,$00,$0c   ; [$aa96] byte
    .byte $0b,$05,$c0,$f0,$bc,$33,$0d,$40   ; [$aa9e] byte
    .byte $00,$c0,$b0,$3c,$5f,$18,$00,$cb   ; [$aaa6] byte
    .byte $f0,$2c,$13,$05,$cb,$f0,$2c,$0f   ; [$aaae] byte
    .byte $1d,$c3,$cc,$5b,$1c,$00,$ce,$4c   ; [$aab6] byte
    .byte $3f,$37,$c3,$f1,$6c,$73,$1b,$c8   ; [$aabe] byte
    .byte $b3,$ec,$6f,$09,$03,$1b,$c8,$b3   ; [$aac6] byte
    .byte $f0,$0c,$27,$3c,$cb,$73,$dc,$95   ; [$aace] byte
    .byte $03,$3c,$c4,$70,$90,$01,$c4,$57   ; [$aad6] byte
    .byte $3a,$41,$50,$01,$cd,$33,$5c,$d3   ; [$aade] byte
    .byte $35,$9c,$e9,$73,$a7,$3a,$73,$a1   ; [$aae6] byte
    .byte $ca,$ea,$b3,$4c,$d7,$26,$cd,$33   ; [$aaee] byte
    .byte $5c,$d3,$35,$cd,$33,$5c,$d3,$35   ; [$aaf6] byte
    .byte $cd,$33,$5c,$a3,$32,$0c,$cf,$01   ; [$aafe] byte
    .byte $b3,$13,$32,$03,$3b,$cc,$73,$2c   ; [$ab06] byte
    .byte $cf,$01,$00,$00,$00,$00,$00,$00   ; [$ab0e] byte
    .byte $00,$00,$00                       ; [$ab16] byte

BRANCH_BLOCKS_SCREEN_04:                    ; [$ab19]
    .byte $cd,$30,$fd,$03,$39,$ce,$33,$0c   ; [$ab19] byte
    .byte $17,$04,$c1,$70,$3c,$2f,$0c,$cc   ; [$ab21] byte
    .byte $32,$fc,$04,$c9,$b3,$f7,$1b,$c7   ; [$ab29] byte
    .byte $33,$7c,$e4,$cd,$f3,$83,$15,$c3   ; [$ab31] byte
    .byte $cd,$0d,$70,$97,$25,$c2,$72,$2c   ; [$ab39] byte
    .byte $fc,$31,$c3,$09,$c8,$b3,$fc,$a3   ; [$ab41] byte
    .byte $42,$c3,$d5,$72,$4c,$24,$0c,$6d   ; [$ab49] byte
    .byte $c9,$30,$97,$43,$c6,$d5,$54,$0c   ; [$ab51] byte
    .byte $95,$73,$a7,$44,$c8,$9c,$ad,$54   ; [$ab59] byte
    .byte $05,$72,$63,$45,$c4,$5c,$93,$11   ; [$ab61] byte
    .byte $5c,$e8,$07,$3a,$c9,$8c,$e3,$42   ; [$ab69] byte
    .byte $73,$a5,$ce,$b3,$4c,$d7,$34,$cd   ; [$ab71] byte
    .byte $73,$4c,$d7,$34,$cd,$73,$2c,$cf   ; [$ab79] byte
    .byte $01,$cd,$33,$5c,$d3,$35,$cd,$33   ; [$ab81] byte
    .byte $5c,$c4,$0c,$c8,$cc,$f0,$10,$cc   ; [$ab89] byte
    .byte $43,$32,$33,$3c,$04,$00,$00,$00   ; [$ab91] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$ab99] byte
    .byte $00,$00,$00                       ; [$aba1] byte

BRANCH_BLOCKS_SCREEN_05:                    ; [$aba4]
    .byte $c0,$43,$03,$c9,$b3,$4c,$d7,$40   ; [$aba4] byte
    .byte $c9,$73,$7d,$0f,$01,$00,$0c,$7f   ; [$abac] byte
    .byte $38,$cd,$74,$8c,$f1,$5c,$a3,$30   ; [$abb4] byte
    .byte $cb,$f0,$2c,$17,$2f,$4c,$a3,$34   ; [$abbc] byte
    .byte $73,$cc,$45,$5c,$62,$33,$8c,$18   ; [$abc4] byte
    .byte $4d,$07,$38,$55,$70,$eb,$15,$c5   ; [$abcc] byte
    .byte $f1,$6c,$73,$0f,$4c,$7b,$28,$c9   ; [$abd4] byte
    .byte $b2,$27,$2b,$71,$1c,$70,$33,$fc   ; [$abdc] byte
    .byte $6f,$48,$4c,$83,$38,$73,$cc,$b6   ; [$abe4] byte
    .byte $0c,$24,$0c,$f3,$11,$4c,$7b,$34   ; [$abec] byte
    .byte $cd,$6c,$b1,$04,$05,$4c,$83,$21   ; [$abf4] byte
    .byte $c9,$b4,$8c,$b5,$04,$0c,$d7,$26   ; [$abfc] byte
    .byte $42,$ce,$33,$4c,$d7,$2c,$4c,$e8   ; [$ac04] byte
    .byte $0c,$f3,$25,$40,$d0,$71,$8a,$cd   ; [$ac0c] byte
    .byte $33,$5c,$d3,$35,$cd,$33,$5c,$d3   ; [$ac14] byte
    .byte $35,$40,$34,$cc,$ef,$32,$0c,$c4   ; [$ac1c] byte
    .byte $33,$2c,$3f,$26,$40,$00,$00,$0c   ; [$ac24] byte
    .byte $79,$40,$00,$00,$0c,$83,$21       ; [$ac2c] byte

BRANCH_BLOCKS_SCREEN_06:                    ; [$ac33]
    .byte $c0,$40,$00,$00,$00,$00,$00,$03   ; [$ac33] byte
    .byte $02,$cb,$d0,$cc,$32,$f7,$02,$c0   ; [$ac3b] byte
    .byte $f3,$0c,$bd,$30,$2c,$0f,$17,$ce   ; [$ac43] byte
    .byte $33,$0c,$bd,$ce,$43,$0f,$c5,$b1   ; [$ac4b] byte
    .byte $cc,$df,$0f,$00,$cf,$f3,$7c,$a3   ; [$ac53] byte
    .byte $43,$d2,$0c,$fb,$48,$c6,$cd,$23   ; [$ac5b] byte
    .byte $3e,$d2,$0c,$fc,$c2,$74,$87,$44   ; [$ac63] byte
    .byte $c4,$4c,$f7,$25,$c4,$43,$3d,$c9   ; [$ac6b] byte
    .byte $71,$1c,$24,$32,$57,$45,$72,$6c   ; [$ac73] byte
    .byte $d3,$35,$cd,$33,$5c,$d3,$35,$cd   ; [$ac7b] byte
    .byte $33,$54,$ce,$b2,$6c,$e3,$42,$d2   ; [$ac83] byte
    .byte $74,$80,$cf,$c3,$48,$07,$3a,$cd   ; [$ac8b] byte
    .byte $71,$5c,$cf,$01,$d2,$b2,$5c,$44   ; [$ac93] byte
    .byte $c2,$43,$25,$c4,$4c,$eb,$34,$c5   ; [$ac9b] byte
    .byte $74,$5c,$04,$d2,$d4,$41,$c9,$83   ; [$aca3] byte
    .byte $15,$d1,$70,$10,$c9,$9d,$03,$2c   ; [$acab] byte
    .byte $ce,$83,$26,$31,$5c,$c7,$33,$c0   ; [$acb3] byte
    .byte $40,$cd,$73,$77,$37,$c3,$f3,$2c   ; [$acbb] byte
    .byte $cf,$20,$ce,$f3,$3c,$04,$00,$73   ; [$acc3] byte
    .byte $a7,$26,$d1,$30,$10,$00,$00       ; [$accb] byte

BRANCH_BLOCKS_SCREEN_07:                    ; [$acd2]
    .byte $c0,$40,$00,$0c,$0b,$03,$c3,$73   ; [$acd2] byte
    .byte $7c,$e7,$0f,$40,$30,$2c,$13,$05   ; [$acda] byte
    .byte $c0,$f0,$dc,$e7,$16,$c7,$31,$ac   ; [$ace2] byte
    .byte $8b,$48,$40,$c2,$33,$8c,$63,$39   ; [$acea] byte
    .byte $c5,$b1,$cc,$6f,$22,$c6,$f2,$3c   ; [$acf2] byte
    .byte $97,$11,$43,$02,$ce,$33,$7c,$6b   ; [$acfa] byte
    .byte $1b,$0c,$97,$11,$00,$70,$2c,$0f   ; [$ad02] byte
    .byte $15,$c6,$8c,$8f,$48,$c9,$71,$10   ; [$ad0a] byte
    .byte $00,$c7,$b2,$8d,$27,$1c,$c6,$cc   ; [$ad12] byte
    .byte $97,$11,$00,$00,$c8,$1d,$2b,$1a   ; [$ad1a] byte
    .byte $c8,$b2,$5c,$44,$00,$00,$c0,$57   ; [$ad22] byte
    .byte $23,$c9,$71,$10,$00,$00,$74,$17   ; [$ad2a] byte
    .byte $22,$50,$00,$00,$4d,$2d,$50,$00   ; [$ad32] byte
    .byte $00,$4c,$99,$50,$00,$00,$4d,$33   ; [$ad3a] byte
    .byte $3b,$00,$00,$03,$32,$40,$00,$00   ; [$ad42] byte
    .byte $00                               ; [$ad4a] byte

BRANCH_BLOCKS_SCREEN_08:                    ; [$ad4b]
    .byte $c3,$c3,$39,$00,$0c,$c3,$2f,$c0   ; [$ad4b] byte
    .byte $b0,$3c,$d3,$35,$d2,$33,$ec,$88   ; [$ad53] byte
    .byte $cf,$f2,$2c,$1f,$22,$c1,$f2,$2c   ; [$ad5b] byte
    .byte $d3,$35,$cd,$33,$5c,$4b,$24,$c4   ; [$ad63] byte
    .byte $73,$dc,$97,$11,$c2,$72,$47,$24   ; [$ad6b] byte
    .byte $72,$4c,$ff,$22,$d2,$0c,$25,$55   ; [$ad73] byte
    .byte $55,$5c,$27,$24,$c4,$45,$55,$55   ; [$ad7b] byte
    .byte $55,$4c,$e9,$57,$40,$ce,$b3,$4c   ; [$ad83] byte
    .byte $d7,$34,$cd,$74,$87,$34,$cd,$73   ; [$ad8b] byte
    .byte $4c,$d7,$22,$55,$cd,$33,$5c,$8b   ; [$ad93] byte
    .byte $07,$c8,$b2,$d7,$22,$c1,$f2,$2c   ; [$ad9b] byte
    .byte $1f,$2b,$55,$cf,$f2,$2c,$b5,$cd   ; [$ada3] byte
    .byte $33,$57,$24,$72,$47,$24,$57,$2b   ; [$adab] byte
    .byte $c2,$72,$4c,$45,$c9,$34,$8c,$e9   ; [$adb3] byte
    .byte $55,$57,$11,$55,$73,$4c,$d7,$22   ; [$adbb] byte
    .byte $55,$55,$ce,$95,$72,$bd,$23,$2d   ; [$adc3] byte
    .byte $57,$34,$ce,$c0,$00,$00,$03,$32   ; [$adcb] byte
    .byte $c0,$40,$00,$00,$00               ; [$add3] byte

BRANCH_BLOCKS_SCREEN_09:                    ; [$add8]
    .byte $cd,$33,$5c,$d3,$35,$cd,$33,$5c   ; [$add8] byte
    .byte $d3,$35,$cc,$32,$fc,$04,$00,$d2   ; [$ade0] byte
    .byte $30,$7c,$8b,$07,$c8,$b0,$7c,$8b   ; [$ade8] byte
    .byte $07,$cd,$33,$5d,$0d,$00,$c9,$1c   ; [$adf0] byte
    .byte $91,$c9,$1c,$91,$c8,$b4,$8d,$1b   ; [$adf8] byte
    .byte $47,$d1,$b4,$7d,$1b,$47,$55,$55   ; [$ae00] byte
    .byte $c9,$31,$1c,$ff,$48,$cf,$f4,$8c   ; [$ae08] byte
    .byte $ff,$29,$55,$55,$5c,$eb,$24,$ce   ; [$ae10] byte
    .byte $b2,$4c,$eb,$2a,$55,$55,$73,$7c   ; [$ae18] byte
    .byte $cb,$3b,$00,$55,$5c,$9b,$34,$cd   ; [$ae20] byte
    .byte $74,$5c,$04,$00,$55,$72,$63,$32   ; [$ae28] byte
    .byte $cc,$f0,$10,$00,$57,$34,$cd,$73   ; [$ae30] byte
    .byte $2c,$cf,$01,$00,$00,$5c,$d3,$35   ; [$ae38] byte
    .byte $d1,$70,$10,$00,$00,$c9,$b3,$4c   ; [$ae40] byte
    .byte $d7,$45,$c0,$40,$00,$00,$cc,$73   ; [$ae48] byte
    .byte $2c,$cf,$01,$00,$00,$00,$00,$00   ; [$ae50] byte
    .byte $00,$00                           ; [$ae58] byte

BRANCH_BLOCKS_SCREEN_10:                    ; [$ae5a]
    .byte $c0,$40,$00,$00,$00,$00,$c0,$b0   ; [$ae5a] byte
    .byte $3c,$2f,$0c,$c3,$73,$0c,$bf,$02   ; [$ae62] byte
    .byte $cb,$d0,$d1,$b4,$7c,$d3,$35,$c9   ; [$ae6a] byte
    .byte $80,$03,$4d,$ce,$34,$3c,$0b,$2f   ; [$ae72] byte
    .byte $ca,$74,$ec,$ff,$4e,$cf,$f4,$8c   ; [$ae7a] byte
    .byte $ff,$48,$cf,$f4,$8c,$ff,$48,$c7   ; [$ae82] byte
    .byte $34,$dc,$3c,$ca,$b4,$fc,$eb,$4f   ; [$ae8a] byte
    .byte $ce,$b2,$4c,$eb,$24,$ce,$b2,$4c   ; [$ae92] byte
    .byte $eb,$24,$c2,$74,$8c,$ff,$22,$ce   ; [$ae9a] byte
    .byte $cc,$d3,$35,$00,$01,$72,$4c,$27   ; [$aea2] byte
    .byte $24,$c0,$40,$00,$d3,$33,$bc,$d2   ; [$aeaa] byte
    .byte $55,$40,$00,$0d,$33,$21,$cd,$33   ; [$aeb2] byte
    .byte $5c,$9b,$34,$40,$00,$03,$20,$ce   ; [$aeba] byte
    .byte $f3,$23,$3b,$40,$00,$00,$00,$00   ; [$aec2] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$aeca] byte
    .byte $00,$00,$00                       ; [$aed2] byte

BRANCH_BLOCKS_SCREEN_11:                    ; [$aed5]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$aed5] byte
    .byte $00,$30,$2c,$13,$05,$cb,$d0,$00   ; [$aedd] byte
    .byte $00,$c3,$c0,$ce,$34,$34,$03,$02   ; [$aee5] byte
    .byte $c0,$f0,$f0,$d2,$33,$f0,$cd,$ec   ; [$aeed] byte
    .byte $c3,$2f,$70,$2c,$0f,$1d,$c5,$b3   ; [$aef5] byte
    .byte $cc,$ff,$22,$c4,$73,$ac,$24,$b1   ; [$aefd] byte
    .byte $c3,$4d,$c3,$cc,$67,$12,$1c,$27   ; [$af05] byte
    .byte $24,$72,$b9,$0c,$6f,$1a,$31,$bc   ; [$af0d] byte
    .byte $4b,$09,$15,$cd,$6a,$4c,$8b,$23   ; [$af15] byte
    .byte $34,$8c,$24,$1c,$eb,$35,$cd,$2a   ; [$af1d] byte
    .byte $9c,$f3,$11,$07,$3a,$33,$53,$32   ; [$af25] byte
    .byte $d0,$6a,$a5,$0c,$eb,$35,$cd,$1d   ; [$af2d] byte
    .byte $17,$01,$2a,$a7,$40,$cb,$33,$4c   ; [$af35] byte
    .byte $d7,$06,$cc,$b3,$3c,$04,$0b,$38   ; [$af3d] byte
    .byte $c9,$b3,$4c,$d5,$cd,$33,$5c,$1b   ; [$af45] byte
    .byte $45,$c0,$40,$02,$cd,$33,$5d,$21   ; [$af4d] byte
    .byte $cf,$33,$7c,$cf,$01,$00           ; [$af55] byte

BRANCH_BLOCKS_SCREEN_12:                    ; [$af5b]
    .byte $c0,$40,$c7,$f3,$7c,$f3,$11,$d0   ; [$af5b] byte
    .byte $33,$4c,$d7,$44,$c0,$40,$03,$1f   ; [$af63] byte
    .byte $c6,$73,$f5,$ca,$f2,$2c,$a1,$40   ; [$af6b] byte
    .byte $30,$2c,$0f,$19,$cf,$f0,$97,$40   ; [$af73] byte
    .byte $cb,$33,$4c,$d7,$06,$cc,$32,$fc   ; [$af7b] byte
    .byte $0b,$05,$c3,$cc,$73,$3f,$c2,$45   ; [$af83] byte
    .byte $cd,$f1,$6c,$73,$1d,$ce,$40,$d2   ; [$af8b] byte
    .byte $0c,$6f,$09,$07,$2b,$d2,$31,$b3   ; [$af93] byte
    .byte $3f,$03,$22,$c4,$4c,$ad,$07,$11   ; [$af9b] byte
    .byte $03,$09,$03,$3c,$43,$3a,$05,$01   ; [$afa3] byte
    .byte $01,$cd,$73,$4c,$d7,$34,$cd,$73   ; [$afab] byte
    .byte $4c,$d7,$34,$cd,$43,$3a,$01,$cc   ; [$afb3] byte
    .byte $80,$33,$1c,$c8,$33,$14,$00,$c0   ; [$afbb] byte
    .byte $40,$00,$0d,$33,$3b,$cc,$73,$20   ; [$afc3] byte
    .byte $40,$00,$00,$00,$00,$00,$00,$00   ; [$afcb] byte
    .byte $00,$00,$00,$00                   ; [$afd3] byte

BRANCH_BLOCKS_SCREEN_13:                    ; [$afd7]
    .byte $c0,$40,$00,$00,$03,$1f,$40,$00   ; [$afd7] byte
    .byte $00,$0c,$7b,$06,$cb,$d0,$00,$00   ; [$afdf] byte
    .byte $0c,$7d,$ce,$33,$0c,$bf,$02,$c1   ; [$afe7] byte
    .byte $72,$f4,$00,$31,$fc,$60,$c6,$f4   ; [$afef] byte
    .byte $dc,$3f,$39,$c3,$f3,$9c,$e3,$30   ; [$aff7] byte
    .byte $c1,$70,$3c,$c3,$05,$c0,$f3,$8c   ; [$afff] byte
    .byte $29,$d2,$00,$cf,$cc,$df,$0f,$33   ; [$b007] byte
    .byte $9c,$3c,$ce,$53,$17,$c4,$40,$c2   ; [$b00f] byte
    .byte $4c,$8b,$48,$0c,$fc,$c8,$b1,$0c   ; [$b017] byte
    .byte $3b,$54,$40,$4c,$f3,$11,$0c,$24   ; [$b01f] byte
    .byte $cf,$33,$dc,$95,$cd,$33,$5c,$d3   ; [$b027] byte
    .byte $35,$ce,$85,$04,$55,$c0,$43,$41   ; [$b02f] byte
    .byte $cd,$33,$5c,$d3,$35,$cd,$33,$5c   ; [$b037] byte
    .byte $e8,$57,$58,$40,$d3,$33,$bc,$c4   ; [$b03f] byte
    .byte $30,$6c,$d3,$35,$cd,$33,$55,$40   ; [$b047] byte
    .byte $00,$34,$cc,$ef,$31,$33,$bc,$98   ; [$b04f] byte
    .byte $40,$00,$00,$08                   ; [$b057] byte

BRANCH_BLOCKS_SCREEN_14:                    ; [$b05b]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$b05b] byte
    .byte $00,$00,$00,$00,$00,$00,$30,$2c   ; [$b063] byte
    .byte $bd,$00,$00,$00,$c2,$31,$73,$30   ; [$b06b] byte
    .byte $c1,$4c,$bf,$02,$c1,$72,$f4,$03   ; [$b073] byte
    .byte $08,$ce,$30,$ac,$67,$37,$ce,$40   ; [$b07b] byte
    .byte $34,$6d,$1c,$4c,$7b,$38,$cd,$71   ; [$b083] byte
    .byte $cc,$68,$c6,$f3,$ed,$23,$3f,$c8   ; [$b08b] byte
    .byte $b4,$ec,$ff,$29,$4c,$7f,$34,$70   ; [$b093] byte
    .byte $9c,$8b,$23,$c4,$73,$dc,$97,$09   ; [$b09b] byte
    .byte $c9,$34,$fc,$eb,$2a,$71,$fc,$e3   ; [$b0a3] byte
    .byte $35,$c8,$9c,$93,$11,$17,$3a,$74   ; [$b0ab] byte
    .byte $6c,$ec,$c7,$b3,$8c,$d7,$22,$c9   ; [$b0b3] byte
    .byte $55,$17,$46,$d1,$f4,$5c,$04,$c8   ; [$b0bb] byte
    .byte $32,$1c,$d2,$55,$d0,$1d,$1b,$47   ; [$b0c3] byte
    .byte $d1,$70,$10,$0d,$07,$26,$15,$72   ; [$b0cb] byte
    .byte $6c,$df,$45,$c0,$40,$03,$4c,$ce   ; [$b0d3] byte
    .byte $f3,$a5,$73,$4c,$d7,$01,$00       ; [$b0db] byte

BRANCH_BLOCKS_SCREEN_15:                    ; [$b0e2]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$b0e2] byte
    .byte $00,$00,$00,$00,$00,$00,$c0,$b0   ; [$b0ea] byte
    .byte $3c,$2f,$0c,$c3,$73,$0c,$bd,$0c   ; [$b0f2] byte
    .byte $0b,$03,$4c,$0b,$03,$cd,$33,$5c   ; [$b0fa] byte
    .byte $d3,$35,$cd,$33,$5c,$1b,$30,$c1   ; [$b102] byte
    .byte $70,$3d,$1b,$47,$34,$6d,$1f,$34   ; [$b10a] byte
    .byte $cd,$72,$23,$3f,$c8,$8c,$d3,$35   ; [$b112] byte
    .byte $d1,$cc,$ff,$22,$ca,$74,$ec,$ff   ; [$b11a] byte
    .byte $4e,$cf,$f4,$e3,$09,$d3,$83,$3f   ; [$b122] byte
    .byte $d2,$0c,$27,$24,$ca,$b4,$fc,$eb   ; [$b12a] byte
    .byte $4f,$ce,$b4,$f3,$3a,$d3,$c3,$3a   ; [$b132] byte
    .byte $c9,$31,$15,$ce,$c0,$00,$00,$d1   ; [$b13a] byte
    .byte $f2,$c5,$c0,$40,$00,$00,$d0,$6c   ; [$b142] byte
    .byte $e9,$40,$00,$00,$2d,$18,$40,$00   ; [$b14a] byte
    .byte $00,$0d,$33,$3b,$40,$00,$00,$00   ; [$b152] byte

BRANCH_BLOCKS_SCREEN_16:                    ; [$b15a]
    .byte $c0,$40,$c0,$b0,$5c,$0f,$1d,$c3   ; [$b15a] byte
    .byte $c0,$0c,$e0,$4c,$0b,$03,$c5,$4c   ; [$b162] byte
    .byte $67,$50,$c8,$b5,$03,$22,$d4,$32   ; [$b16a] byte
    .byte $2c,$6b,$1c,$c0,$b0,$3c,$77,$0f   ; [$b172] byte
    .byte $31,$6c,$6f,$07,$c9,$30,$71,$c1   ; [$b17a] byte
    .byte $f2,$4c,$af,$1b,$c3,$f1,$6c,$6f   ; [$b182] byte
    .byte $1a,$d4,$31,$bc,$b5,$51,$5c,$44   ; [$b18a] byte
    .byte $c6,$b1,$2c,$8b,$23,$c1,$f2,$4c   ; [$b192] byte
    .byte $45,$51,$74,$0c,$b1,$d2,$30,$9c   ; [$b19a] byte
    .byte $93,$11,$57,$34,$cd,$73,$4c,$d7   ; [$b1a2] byte
    .byte $34,$cd,$5c,$d3,$35,$95,$57,$50   ; [$b1aa] byte
    .byte $c8,$b5,$03,$22,$c1,$dc,$f3,$48   ; [$b1b2] byte
    .byte $55,$57,$07,$c9,$30,$73,$24,$72   ; [$b1ba] byte
    .byte $2c,$97,$11,$15,$55,$51,$72,$4c   ; [$b1c2] byte
    .byte $44,$15,$55,$51,$54,$d1,$f3,$a5   ; [$b1ca] byte
    .byte $55,$51,$5d,$1b,$47,$ce,$c0,$00   ; [$b1d2] byte
    .byte $00,$0c,$cf,$01,$00,$00,$00,$00   ; [$b1da] byte

BRANCH_BLOCKS_SCREEN_17:                    ; [$b1e2]
    .byte $c6,$33,$0c,$bf,$01,$00,$00,$00   ; [$b1e2] byte
    .byte $c7,$33,$7c,$e7,$38,$c3,$4d,$0d   ; [$b1ea] byte
    .byte $00,$30,$2c,$17,$03,$c6,$f3,$fc   ; [$b1f2] byte
    .byte $8b,$1c,$d3,$70,$fd,$15,$00,$33   ; [$b1fa] byte
    .byte $bc,$3c,$c4,$70,$9c,$93,$1b,$d2   ; [$b202] byte
    .byte $33,$ec,$04,$00,$0c,$fb,$3c,$73   ; [$b20a] byte
    .byte $a7,$11,$33,$d4,$00,$0c,$f7,$25   ; [$b212] byte
    .byte $cd,$33,$5d,$21,$14,$00,$05,$d2   ; [$b21a] byte
    .byte $33,$fc,$ad,$1d,$1f,$55,$4d,$54   ; [$b222] byte
    .byte $0c,$ef,$31,$c4,$70,$9c,$91,$d1   ; [$b22a] byte
    .byte $b4,$7d,$17,$01,$00,$00,$73,$ad   ; [$b232] byte
    .byte $1b,$47,$c1,$b4,$5c,$04,$00,$00   ; [$b23a] byte
    .byte $d1,$b4,$7c,$c7,$32,$cc,$f0,$10   ; [$b242] byte
    .byte $00,$00,$cc,$73,$3c,$04,$00,$00   ; [$b24a] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b252] byte
    .byte $00                               ; [$b25a] byte

BRANCH_BLOCKS_SCREEN_18:                    ; [$b25b]
    .byte $c0,$b0,$3c,$34,$cc,$30,$4c,$14   ; [$b25b] byte
    .byte $32,$fc,$04,$00,$c5,$71,$8c,$77   ; [$b263] byte
    .byte $0f,$00,$33,$7d,$0d,$00,$c3,$f1   ; [$b26b] byte
    .byte $cc,$88,$d2,$0d,$43,$22,$d4,$31   ; [$b273] byte
    .byte $ad,$37,$52,$cb,$d0,$d2,$30,$9c   ; [$b27b] byte
    .byte $93,$11,$0c,$1f,$24,$c1,$f2,$2d   ; [$b283] byte
    .byte $23,$50,$d3,$75,$2c,$bd,$c4,$55   ; [$b28b] byte
    .byte $05,$72,$4c,$b7,$07,$d2,$35,$1d   ; [$b293] byte
    .byte $37,$52,$55,$05,$5c,$45,$c9,$32   ; [$b29b] byte
    .byte $bd,$23,$37,$d1,$b4,$7c,$f1,$0c   ; [$b2a3] byte
    .byte $d3,$35,$cd,$33,$5c,$b1,$71,$10   ; [$b2ab] byte
    .byte $d0,$6b,$2c,$4d,$43,$3c,$d4,$32   ; [$b2b3] byte
    .byte $2c,$97,$34,$cd,$73,$4c,$d7,$2c   ; [$b2bb] byte
    .byte $c0,$6a,$9c,$1f,$24,$c1,$f2,$4c   ; [$b2c3] byte
    .byte $47,$50,$c8,$b4,$8c,$ff,$48,$4a   ; [$b2cb] byte
    .byte $a5,$57,$07,$c9,$31,$1c,$27,$24   ; [$b2d3] byte
    .byte $42,$a5,$55,$55,$40,$d3,$33,$bb   ; [$b2db] byte
    .byte $46,$d1,$f3,$c5,$5c,$e9,$40,$03   ; [$b2e3] byte
    .byte $4c,$ce,$c0,$00                   ; [$b2eb] byte

BRANCH_BLOCKS_SCREEN_19:                    ; [$b2ef]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$b2ef] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b2f7] byte
    .byte $00,$cb,$d0,$00,$00,$00,$c3,$f4   ; [$b2ff] byte
    .byte $34,$00,$00,$c0,$b0,$53,$2f,$d1   ; [$b307] byte
    .byte $b4,$79,$00,$0c,$0b,$03,$d1,$b4   ; [$b30f] byte
    .byte $7d,$1b,$47,$ca,$eb,$30,$cb,$f0   ; [$b317] byte
    .byte $2c,$17,$2f,$c0,$b0,$3d,$1b,$47   ; [$b31f] byte
    .byte $d3,$8c,$ff,$48,$c4,$73,$fa,$d1   ; [$b327] byte
    .byte $b4,$7d,$1b,$47,$d1,$b4,$7d,$3b   ; [$b32f] byte
    .byte $3f,$d4,$f4,$fc,$27,$29,$70,$9d   ; [$b337] byte
    .byte $38,$0c,$ff,$4e,$cf,$f4,$ed,$3f   ; [$b33f] byte
    .byte $09,$5c,$eb,$2a,$5d,$4f,$4f,$0c   ; [$b347] byte
    .byte $eb,$53,$ce,$b5,$37,$3a,$d1,$b4   ; [$b34f] byte
    .byte $7d,$1b,$47,$73,$a5,$d1,$b4,$7d   ; [$b357] byte
    .byte $1b,$31,$cc,$b3,$b0,$cc,$f0,$10   ; [$b35f] byte
    .byte $ce,$c0,$cc,$f0,$10,$00,$00       ; [$b367] byte

BRANCH_BLOCKS_SCREEN_20:                    ; [$b36e]
    .byte $c0,$40,$03,$02,$c1,$40,$00,$40   ; [$b36e] byte
    .byte $30,$2c,$0f,$1d,$c3,$c0,$00,$40   ; [$b376] byte
    .byte $c2,$30,$fc,$5b,$3f,$d2,$0c,$ff   ; [$b37e] byte
    .byte $48,$0c,$ff,$48,$4c,$0b,$03,$c6   ; [$b386] byte
    .byte $73,$fc,$6f,$09,$c9,$31,$1c,$27   ; [$b38e] byte
    .byte $24,$c4,$4c,$27,$24,$71,$fc,$5f   ; [$b396] byte
    .byte $19,$c8,$b0,$9c,$91,$55,$45,$c2   ; [$b39e] byte
    .byte $30,$fc,$5b,$48,$17,$3a,$5c,$e9   ; [$b3a6] byte
    .byte $45,$c5,$b1,$bc,$ff,$24,$c4,$57   ; [$b3ae] byte
    .byte $34,$cd,$73,$4c,$d7,$48,$4c,$e9   ; [$b3b6] byte
    .byte $c6,$f2,$5c,$25,$73,$ac,$d3,$35   ; [$b3be] byte
    .byte $cc,$b3,$84,$cb,$1c,$d3,$35,$ca   ; [$b3c6] byte
    .byte $71,$15,$73,$4c,$d7,$45,$c0,$74   ; [$b3ce] byte
    .byte $1c,$a3,$26,$c9,$5c,$ff,$48,$ca   ; [$b3d6] byte
    .byte $9c,$eb,$46,$d1,$f3,$2c,$cf,$01   ; [$b3de] byte
    .byte $31,$fc,$d3,$35,$5c,$27,$24,$d1   ; [$b3e6] byte
    .byte $b4,$7d,$1b,$47,$d1,$70,$10,$c7   ; [$b3ee] byte
    .byte $f3,$4c,$d7,$22,$74,$0c,$eb,$26   ; [$b3f6] byte
    .byte $d3,$33,$b3,$33,$c0,$43,$1f,$cd   ; [$b3fe] byte
    .byte $33,$5c,$ff,$48,$c4,$5c,$d5,$c0   ; [$b406] byte
    .byte $40,$0c,$7f,$34,$cd,$74,$8c,$27   ; [$b40e] byte
    .byte $24,$5c,$d2                       ; [$b416] byte

BRANCH_BLOCKS_SCREEN_21:                    ; [$b419]
    .byte $cd,$f3,$cc,$ff,$24,$c4,$74,$0c   ; [$b419] byte
    .byte $97,$09,$c9,$31,$1c,$27,$24,$c4   ; [$b421] byte
    .byte $73,$4c,$d7,$45,$c5,$b2,$5c,$25   ; [$b429] byte
    .byte $72,$b5,$55,$cd,$33,$5c,$a3,$43   ; [$b431] byte
    .byte $c6,$d5,$41,$55,$ca,$eb,$45,$c4   ; [$b439] byte
    .byte $45,$43,$3a,$5c,$eb,$40,$cd,$33   ; [$b441] byte
    .byte $5d,$13,$01,$45,$73,$4c,$d7,$34   ; [$b449] byte
    .byte $cd,$73,$4c,$d5,$c8,$ab,$43,$4c   ; [$b451] byte
    .byte $e9,$72,$bd,$20,$30,$9d,$21,$c9   ; [$b459] byte
    .byte $72,$ba,$cd,$33,$5c,$d3,$35,$cb   ; [$b461] byte
    .byte $20,$1c,$93,$2b,$cb,$71,$15,$d2   ; [$b469] byte
    .byte $0c,$ff,$48,$c9,$50,$17,$11,$33   ; [$b471] byte
    .byte $4c,$d7,$45,$c4,$4c,$27,$24,$c4   ; [$b479] byte
    .byte $40,$15,$cd,$33,$5d,$13,$01,$4c   ; [$b481] byte
    .byte $e9,$40,$15,$5d,$15,$c9,$b3,$4c   ; [$b489] byte
    .byte $d7,$34,$cd,$72,$c7,$40,$cb,$33   ; [$b491] byte
    .byte $a7,$34,$cd,$73,$3c,$04,$cc,$71   ; [$b499] byte
    .byte $5c,$61,$72,$55,$cd,$33,$5c,$d3   ; [$b4a1] byte
    .byte $35,$cc,$f0,$10,$34,$1c,$d3,$35   ; [$b4a9] byte
    .byte $cf,$d5,$5c,$cb,$33,$c0,$40       ; [$b4b1] byte

BRANCH_BLOCKS_SCREEN_22:                    ; [$b4b8]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$b4b8] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b4c0] byte
    .byte $00,$0d,$1b,$47,$d1,$b4,$7d,$1b   ; [$b4c8] byte
    .byte $47,$d1,$b4,$7d,$1b,$47,$d1,$b4   ; [$b4d0] byte
    .byte $7d,$1b,$47,$d1,$b4,$7c,$6f,$48   ; [$b4d8] byte
    .byte $00,$00,$00,$5c,$f3,$11,$cd,$33   ; [$b4e0] byte
    .byte $5c,$b3,$11,$cd,$33,$5c,$b3,$11   ; [$b4e8] byte
    .byte $cd,$33,$5c,$b3,$11,$5c,$95,$d4   ; [$b4f0] byte
    .byte $0c,$89,$d4,$0c,$89,$d4,$0c,$f1   ; [$b4f8] byte
    .byte $d0,$6b,$2c,$c1,$cc,$f1,$c1,$cc   ; [$b500] byte
    .byte $f1,$c1,$c5,$c0,$6a,$45,$45,$45   ; [$b508] byte
    .byte $49,$45,$45,$45,$43,$4c,$ce,$c0   ; [$b510] byte
    .byte $03,$46,$45,$40,$00,$03,$41,$b4   ; [$b518] byte
    .byte $7d,$1b,$47                       ; [$b520] byte

BRANCH_BLOCKS_SCREEN_23:                    ; [$b523]
    .byte $c0,$40,$00,$00,$00,$00,$00,$00   ; [$b523] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b52b] byte
    .byte $00,$d1,$b4,$7d,$1b,$47,$40,$00   ; [$b533] byte
    .byte $00,$d2,$0c,$6f,$0e,$d1,$b4,$74   ; [$b53b] byte
    .byte $03,$47,$d1,$b4,$7d,$1b,$47,$cd   ; [$b543] byte
    .byte $33,$5c,$b3,$2b,$5d,$1b,$47,$d1   ; [$b54b] byte
    .byte $b4,$7d,$19,$cf,$f2,$2d,$3b,$3e   ; [$b553] byte
    .byte $0c,$97,$11,$d4,$0c,$8b,$48,$d4   ; [$b55b] byte
    .byte $0c,$8b,$48,$c2,$75,$3d,$3f,$3d   ; [$b563] byte
    .byte $05,$c1,$cc,$f3,$11,$c1,$cc,$f3   ; [$b56b] byte
    .byte $11,$55,$05,$45,$45,$ce,$b4,$6d   ; [$b573] byte
    .byte $1f,$46,$45,$45,$47,$46,$d1,$f3   ; [$b57b] byte
    .byte $8d,$17,$01,$45,$45,$45,$74,$5c   ; [$b583] byte
    .byte $04,$d1,$f4,$6d,$1f,$46,$d1,$f4   ; [$b58b] byte
    .byte $6d,$1f,$46,$d1,$f4,$6d,$1f,$32   ; [$b593] byte
    .byte $cc,$f0,$10                       ; [$b59b] byte

BRANCH_BLOCKS_SCREEN_24:                    ; [$b59e]
    .byte $c0,$40,$00,$00,$00,$00,$0c,$0b   ; [$b59e] byte
    .byte $04,$c1,$72,$f4,$00,$00,$0d,$1b   ; [$b5a6] byte
    .byte $47,$d1,$b4,$7d,$0d,$00,$00,$03   ; [$b5ae] byte
    .byte $3e,$c6,$f2,$3a,$40,$00,$03,$3d   ; [$b5b6] byte
    .byte $c9,$71,$1c,$ae,$cc,$32,$fc,$0b   ; [$b5be] byte
    .byte $2f,$d1,$b4,$73,$46,$d1,$f4,$6d   ; [$b5c6] byte
    .byte $1d,$51,$d5,$30,$6d,$1b,$47,$cf   ; [$b5ce] byte
    .byte $b4,$83,$3f,$d2,$33,$ea,$d1,$b4   ; [$b5d6] byte
    .byte $7c,$b3,$46,$b4,$6d,$1f,$3e,$cf   ; [$b5de] byte
    .byte $72,$5c,$47,$09,$c9,$33,$dd,$20   ; [$b5e6] byte
    .byte $cf,$dc,$97,$3f,$d2,$03,$3d,$15   ; [$b5ee] byte
    .byte $5c,$97,$11,$c2,$72,$27,$09,$c9   ; [$b5f6] byte
    .byte $31,$13,$29,$d1,$f4,$6d,$1f,$3a   ; [$b5fe] byte
    .byte $55,$72,$4c,$45,$53,$2a,$c0,$74   ; [$b606] byte
    .byte $cc,$ef,$46,$d1,$d5,$ce,$97,$3a   ; [$b60e] byte
    .byte $d1,$f3,$1c,$ec,$43,$4c,$ce,$ed   ; [$b616] byte
    .byte $1b,$47,$d1,$b4,$7d,$1b,$47,$cc   ; [$b61e] byte
    .byte $f0,$10,$00,$00,$00,$00           ; [$b626] byte

BRANCH_BLOCKS_SCREEN_25:                    ; [$b62c]
    .byte $c0,$43,$02,$c1,$70,$3c,$d3,$35   ; [$b62c] byte
    .byte $c8,$b2,$5c,$27,$24,$c4,$74,$0c   ; [$b634] byte
    .byte $d3,$35,$4c,$7f,$46,$d1,$f2,$63   ; [$b63c] byte
    .byte $3f,$d2,$32,$d5,$72,$b5,$71,$fc   ; [$b644] byte
    .byte $9b,$1b,$cf,$f2,$23,$09,$c9,$31   ; [$b64c] byte
    .byte $15,$73,$4c,$d7,$45,$c7,$b0,$67   ; [$b654] byte
    .byte $25,$c2,$72,$4c,$b5,$5c,$e9,$5c   ; [$b65c] byte
    .byte $df,$01,$c8,$32,$15,$5c,$45,$cd   ; [$b664] byte
    .byte $33,$5c,$d3,$35,$cd,$33,$5d,$15   ; [$b66c] byte
    .byte $d1,$b4,$71,$57,$3a,$5c,$c7,$32   ; [$b674] byte
    .byte $33,$3c,$04,$d2,$33,$fc,$f3,$2d   ; [$b67c] byte
    .byte $57,$34,$cd,$74,$5c,$04,$00,$c4   ; [$b684] byte
    .byte $70,$9c,$93,$11,$5c,$d3,$35,$d1   ; [$b68c] byte
    .byte $70,$10,$00,$ca,$55,$ce,$b3,$4c   ; [$b694] byte
    .byte $d7,$45,$c0,$40,$00,$ca,$b3,$a5   ; [$b69c] byte
    .byte $cd,$33,$5c,$cf,$01,$00,$00,$cd   ; [$b6a4] byte
    .byte $33,$5c,$d3,$35,$cc,$b3,$3c,$04   ; [$b6ac] byte
    .byte $00,$00,$ce,$c3,$33,$c0,$40,$00   ; [$b6b4] byte
    .byte $00,$00,$00,$00,$00               ; [$b6bc] byte

BRANCH_BLOCKS_SCREEN_26:                    ; [$b6c1]
    .byte $c0,$71,$fc,$d3,$35,$c2,$72,$4c   ; [$b6c1] byte
    .byte $47,$40,$cd,$33,$5d,$0f,$01,$00   ; [$b6c9] byte
    .byte $c7,$b3,$4c,$d7,$22,$55,$5d,$11   ; [$b6d1] byte
    .byte $00,$c7,$d5,$55,$5c,$a3,$43,$40   ; [$b6d9] byte
    .byte $d0,$55,$55,$c2,$6b,$39,$cc,$32   ; [$b6e1] byte
    .byte $fc,$0b,$03,$c7,$95,$55,$71,$a0   ; [$b6e9] byte
    .byte $d3,$70,$f0,$c8,$32,$1a,$57,$2b   ; [$b6f1] byte
    .byte $71,$bc,$8f,$3e,$c8,$b1,$bc,$fb   ; [$b6f9] byte
    .byte $23,$c0,$65,$ce,$94,$72,$4c,$47   ; [$b701] byte
    .byte $3d,$c9,$71,$1c,$f7,$25,$4d,$06   ; [$b709] byte
    .byte $b3,$c4,$55,$55,$42,$ac,$b1,$55   ; [$b711] byte
    .byte $55,$40,$aa,$ce,$95,$5c,$d3,$35   ; [$b719] byte
    .byte $40,$c7,$97,$34,$cd,$73,$4c,$d7   ; [$b721] byte
    .byte $34,$cd,$73,$4c,$d7,$31,$40,$c8   ; [$b729] byte
    .byte $33,$b3,$32,$00,$33,$bc,$cf,$01   ; [$b731] byte
    .byte $00,$00,$00,$00                   ; [$b739] byte

BRANCH_BLOCKS_SCREEN_27:                    ; [$b73d]
    .byte $c0,$40,$c0,$b0,$53,$2f,$c0,$40   ; [$b73d] byte
    .byte $0c,$23,$06,$4c,$0b,$03,$c5,$f1   ; [$b745] byte
    .byte $dc,$e7,$38,$cc,$30,$43,$05,$30   ; [$b74d] byte
    .byte $3c,$18,$71,$fc,$77,$0f,$c5,$b3   ; [$b755] byte
    .byte $f3,$0e,$c3,$c0,$03,$16,$c2,$f3   ; [$b75d] byte
    .byte $7c,$6b,$23,$c6,$f0,$93,$22,$d2   ; [$b765] byte
    .byte $00,$33,$fd,$23,$1b,$c7,$33,$ec   ; [$b76d] byte
    .byte $8f,$2d,$c4,$53,$24,$cb,$71,$10   ; [$b775] byte
    .byte $30,$9c,$93,$2d,$b3,$dc,$97,$11   ; [$b77d] byte
    .byte $11,$c4,$40,$17,$11,$15,$33,$a1   ; [$b785] byte
    .byte $74,$0c,$b1,$33,$a5,$15,$cd,$33   ; [$b78d] byte
    .byte $5c,$d3,$35,$c9,$9c,$9a,$73,$4c   ; [$b795] byte
    .byte $d7,$26,$73,$4c,$d7,$34,$cd,$73   ; [$b79d] byte
    .byte $1c,$56,$b2,$2d,$23,$25,$73,$ed   ; [$b7a5] byte
    .byte $20,$cd,$33,$5c,$c8,$cc,$f0,$1d   ; [$b7ad] byte
    .byte $07,$28,$c9,$b3,$cc,$b7,$11,$33   ; [$b7b5] byte
    .byte $dc,$97,$11,$cc,$b3,$3c,$04,$02   ; [$b7bd] byte
    .byte $cd,$33,$5c,$b1,$15,$c0,$40,$00   ; [$b7c5] byte
    .byte $aa,$55,$40,$00,$34,$cc,$ef,$34   ; [$b7cd] byte
    .byte $cd,$73,$4c,$d7,$34               ; [$b7d5] byte

BRANCH_BLOCKS_SCREEN_28:                    ; [$b7da]
    .byte $c5,$f1,$9c,$ff,$24,$c4,$4d,$03   ; [$b7da] byte
    .byte $3f,$03,$3c,$c4,$43,$3d,$c3,$f1   ; [$b7e2] byte
    .byte $ac,$25,$4c,$af,$09,$01,$41,$d2   ; [$b7ea] byte
    .byte $32,$35,$43,$3a,$01,$d0,$32,$c5   ; [$b7f2] byte
    .byte $c4,$45,$4c,$d3,$35,$cd,$33,$5c   ; [$b7fa] byte
    .byte $d3,$35,$72,$55,$45,$4c,$fc,$00   ; [$b802] byte
    .byte $c8,$95,$45,$4c,$24,$00,$cf,$31   ; [$b80a] byte
    .byte $11,$45,$4c,$e8,$00,$51,$c9,$b3   ; [$b812] byte
    .byte $4c,$d7,$3c,$73,$4c,$d7,$34,$cd   ; [$b81a] byte
    .byte $73,$4c,$d7,$34,$cd,$72,$c7,$26   ; [$b822] byte
    .byte $d2,$0c,$f9,$73,$f0,$00,$33,$c7   ; [$b82a] byte
    .byte $3e,$c4,$4c,$f7,$25,$70,$90,$00   ; [$b832] byte
    .byte $17,$3d,$45,$5c,$e8,$00,$15,$45   ; [$b83a] byte
    .byte $73,$ac,$d3,$35,$cd,$33,$5c,$d3   ; [$b842] byte
    .byte $35,$cd,$33,$5c,$d3,$35,$c9,$b3   ; [$b84a] byte
    .byte $4c,$d7,$34,$cd,$73,$4c,$d7,$31   ; [$b852] byte
    .byte $cc,$80,$03,$33                   ; [$b85a] byte

BRANCH_BLOCKS_SCREEN_29:                    ; [$b85e]
    .byte $d3,$70,$f0,$0c,$e3,$17,$c6,$33   ; [$b85e] byte
    .byte $0c,$bf,$01,$00,$c8,$b3,$fc,$6f   ; [$b866] byte
    .byte $1a,$c6,$f1,$ac,$3b,$0f,$0c,$e3   ; [$b86e] byte
    .byte $30,$cb,$d0,$d2,$30,$9c,$8b,$23   ; [$b876] byte
    .byte $c8,$b2,$3c,$8b,$1a,$cd,$b1,$a3   ; [$b87e] byte
    .byte $4d,$ce,$34,$34,$c4,$5c,$93,$11   ; [$b886] byte
    .byte $0c,$af,$1b,$32,$32,$d4,$74,$d9   ; [$b88e] byte
    .byte $55,$00,$0c,$ae,$b3,$6c,$d6,$55   ; [$b896] byte
    .byte $00,$03,$14,$b1,$bc,$d3,$26,$55   ; [$b89e] byte
    .byte $00,$00,$0c,$ad,$33,$4c,$d7,$2c   ; [$b8a6] byte
    .byte $40,$00,$0c,$d1,$cf,$83,$25,$40   ; [$b8ae] byte
    .byte $00,$0c,$ad,$cf,$41,$40,$00,$0c   ; [$b8b6] byte
    .byte $d1,$41,$40,$00,$0c,$ad,$cd,$33   ; [$b8be] byte
    .byte $55,$40,$00,$0c,$d3,$35,$ce,$eb   ; [$b8c6] byte
    .byte $34,$cd,$73,$4c,$d7,$34,$cd,$73   ; [$b8ce] byte
    .byte $4c,$d7,$34,$cd,$73,$4c,$d7,$33   ; [$b8d6] byte

BRANCH_BLOCKS_SCREEN_30:                    ; [$b8de]
    .byte $c7,$b3,$4c,$d7,$3c,$c2,$72,$6d   ; [$b8de] byte
    .byte $03,$26,$cf,$f3,$cc,$47,$3d,$cd   ; [$b8e6] byte
    .byte $33,$5d,$0f,$01,$c8,$15,$55,$c2   ; [$b8ee] byte
    .byte $55,$d2,$2a,$b4,$1c,$99,$74,$80   ; [$b8f6] byte
    .byte $72,$45,$c9,$73,$ea,$4a,$ce,$b2   ; [$b8fe] byte
    .byte $4c,$44,$55,$73,$d5,$42,$94,$ce   ; [$b906] byte
    .byte $95,$55,$40,$b3,$4c,$d7,$34,$cd   ; [$b90e] byte
    .byte $73,$4c,$d7,$34,$cd,$73,$4c,$d7   ; [$b916] byte
    .byte $45,$40,$34,$cc,$ec,$00,$0c,$cf   ; [$b91e] byte
    .byte $01,$00,$c0,$b0,$3c,$34,$0c,$c3   ; [$b926] byte
    .byte $2f,$c0,$40,$03,$1f,$cd,$33,$5c   ; [$b92e] byte
    .byte $d3,$35,$cd,$33,$5c,$d3,$35,$d0   ; [$b936] byte
    .byte $d0,$0c,$7f,$34,$cd,$72,$2d,$20   ; [$b93e] byte
    .byte $cf,$8c,$8a,$a4,$31,$fc,$d3,$35   ; [$b946] byte
    .byte $c8,$b2,$5c,$44,$cf,$4c,$97,$2b   ; [$b94e] byte
    .byte $a9,$c7,$f3,$4c,$d7,$22,$c9,$71   ; [$b956] byte
    .byte $1d,$03,$2c,$47,$11,$aa,$cd,$33   ; [$b95e] byte
    .byte $5a,$cd,$33,$57,$34,$cd,$73,$4c   ; [$b966] byte
    .byte $d7,$34,$cd,$57,$34               ; [$b96e] byte

BRANCH_BLOCKS_SCREEN_31:                    ; [$b973]
    .byte $c0,$40,$00,$00,$0c,$0b,$2f,$40   ; [$b973] byte
    .byte $00,$0c,$0b,$05,$30,$3c,$5f,$1d   ; [$b97b] byte
    .byte $40,$00,$c0,$b0,$3c,$77,$0f,$0c   ; [$b983] byte
    .byte $5b,$3e,$40,$03,$08,$c5,$73,$5c   ; [$b98b] byte
    .byte $fb,$48,$0c,$6f,$3d,$40,$0c,$23   ; [$b993] byte
    .byte $15,$cd,$73,$cc,$f7,$25,$c4,$41   ; [$b99b] byte
    .byte $40,$30,$8c,$57,$35,$cf,$f4,$07   ; [$b9a3] byte
    .byte $26,$cd,$33,$5c,$d3,$35,$40,$c7   ; [$b9ab] byte
    .byte $f1,$5c,$d7,$1a,$c2,$5c,$d3,$35   ; [$b9b3] byte
    .byte $cf,$f4,$83,$3e,$43,$08,$c5,$73   ; [$b9bb] byte
    .byte $5c,$6f,$23,$5d,$20,$c2,$72,$4c   ; [$b9c3] byte
    .byte $47,$3d,$4c,$23,$15,$cd,$74,$8c   ; [$b9cb] byte
    .byte $97,$11,$74,$8c,$97,$11,$55,$70   ; [$b9d3] byte
    .byte $8c,$57,$35,$c6,$f2,$5c,$44,$72   ; [$b9db] byte
    .byte $5c,$44,$55,$c7,$b1,$5c,$d7,$1b   ; [$b9e3] byte
    .byte $c9,$74,$0c,$b1,$ce,$94,$55,$c8   ; [$b9eb] byte
    .byte $32,$1c,$d2,$cd,$1c,$d3,$26,$cd   ; [$b9f3] byte
    .byte $33,$5c,$d3,$35,$ce,$97,$26,$c0   ; [$b9fb] byte
    .byte $65,$d2,$1d,$23,$3f,$d2,$0c,$fe   ; [$ba03] byte
    .byte $b3,$4c,$d5                       ; [$ba0b] byte

BRANCH_BLOCKS_SCREEN_32:                    ; [$ba0e]
    .byte $c0,$b0,$5c,$0f,$18,$c7,$70,$f0   ; [$ba0e] byte
    .byte $00,$00,$03,$16,$cf,$b1,$b0,$03   ; [$ba16] byte
    .byte $3f,$c6,$cc,$fb,$1b,$00,$cf,$72   ; [$ba1e] byte
    .byte $5c,$44,$03,$09,$c9,$31,$1c,$f7   ; [$ba26] byte
    .byte $25,$c4,$40,$73,$4c,$d7,$34,$cd   ; [$ba2e] byte
    .byte $72,$c7,$3a,$55,$72,$6c,$d3,$35   ; [$ba36] byte
    .byte $cd,$33,$5c,$ff,$22,$d2,$32,$5c   ; [$ba3e] byte
    .byte $d3,$35,$cd,$33,$5c,$d3,$35,$cd   ; [$ba46] byte
    .byte $33,$5c,$8b,$48,$cf,$f2,$2c,$27   ; [$ba4e] byte
    .byte $24,$c4,$4c,$af,$3f,$c8,$b4,$8c   ; [$ba56] byte
    .byte $fb,$3c,$c8,$b3,$ec,$97,$11,$c2   ; [$ba5e] byte
    .byte $72,$45,$43,$09,$c9,$31,$1c,$f7   ; [$ba66] byte
    .byte $25,$c4,$73,$d5,$55,$41,$55,$55   ; [$ba6e] byte
    .byte $55,$41,$55,$55,$55,$43,$3a,$cd   ; [$ba76] byte
    .byte $33,$5c,$d3,$35,$55,$ce,$9c,$e9   ; [$ba7e] byte
    .byte $73,$4c,$d7,$34,$cd,$73,$13,$33   ; [$ba86] byte
    .byte $cd,$33,$5c,$d3,$35,$cd,$33,$5c   ; [$ba8e] byte
    .byte $d3,$26,$cd,$33,$5c,$c7,$32,$cc   ; [$ba96] byte
    .byte $f0,$10,$c9,$b3,$1c,$c8,$00,$33   ; [$ba9e] byte
    .byte $3c,$04,$00                       ; [$baa6] byte

BRANCH_BLOCKS_SCREEN_33:                    ; [$baa9]
    .byte $c9,$b3,$4c,$d7,$26,$cd,$33,$5c   ; [$baa9] byte
    .byte $f7,$25,$c4,$73,$dc,$97,$11,$d0   ; [$bab1] byte
    .byte $33,$4c,$d7,$44,$d2,$32,$2c,$ff   ; [$bab9] byte
    .byte $22,$15,$55,$52,$c4,$4c,$27,$24   ; [$bac1] byte
    .byte $c4,$72,$65,$55,$5c,$d7,$44,$4c   ; [$bac9] byte
    .byte $e9,$c9,$85,$55,$73,$da,$cd,$33   ; [$bad1] byte
    .byte $5c,$d3,$35,$cd,$33,$59,$55,$ca   ; [$bad9] byte
    .byte $d5,$d2,$0c,$ff,$22,$d2,$33,$ed   ; [$bae1] byte
    .byte $21,$55,$15,$c4,$4c,$27,$24,$c4   ; [$bae9] byte
    .byte $73,$dc,$97,$11,$15,$33,$4c,$d7   ; [$baf1] byte
    .byte $45,$45,$55,$15,$cd,$33,$5d,$17   ; [$baf9] byte
    .byte $01,$45,$55,$33,$4c,$d7,$34,$cd   ; [$bb01] byte
    .byte $74,$5c,$04,$cd,$33,$5c,$e9,$55   ; [$bb09] byte
    .byte $cd,$33,$5c,$c7,$32,$cc,$f0,$10   ; [$bb11] byte
    .byte $d0,$6b,$22,$5d,$03,$34,$cd,$73   ; [$bb19] byte
    .byte $7c,$c3,$2f,$c0,$40,$32,$8a,$cd   ; [$bb21] byte
    .byte $33,$57,$26,$ac,$d3,$35,$d0,$d0   ; [$bb29] byte
    .byte $c7,$f3,$4c,$d7,$22,$cf,$d5,$cf   ; [$bb31] byte
    .byte $f2,$2d,$22,$a4                   ; [$bb39] byte

BRANCH_BLOCKS_SCREEN_34:                    ; [$bb3d]
    .byte $c0,$40,$00,$31,$fc,$d3,$35,$cd   ; [$bb3d] byte
    .byte $33,$5c,$d3,$35,$40,$30,$2c,$14   ; [$bb45] byte
    .byte $c0,$f3,$4c,$d7,$40,$cf,$b2,$2c   ; [$bb4d] byte
    .byte $fe,$40,$c2,$30,$6c,$d3,$35,$cd   ; [$bb55] byte
    .byte $33,$5d,$00,$cf,$72,$5c,$27,$2b   ; [$bb5d] byte
    .byte $43,$08,$cd,$33,$5c,$9b,$40,$03   ; [$bb65] byte
    .byte $48,$57,$24,$4c,$7b,$34,$cd,$74   ; [$bb6d] byte
    .byte $00,$c8,$8d,$23,$25,$55,$4c,$7d   ; [$bb75] byte
    .byte $53,$22,$c9,$71,$10,$cd,$33,$57   ; [$bb7d] byte
    .byte $35,$70,$8c,$d3,$35,$d0,$0c,$8b   ; [$bb85] byte
    .byte $25,$c4,$40,$ca,$f4,$87,$22,$c2   ; [$bb8d] byte
    .byte $33,$4c,$d7,$40,$32,$2c,$97,$11   ; [$bb95] byte
    .byte $03,$40,$cb,$31,$1c,$eb,$24,$cd   ; [$bb9d] byte
    .byte $33,$5c,$89,$cf,$b2,$5c,$f6,$cf   ; [$bba5] byte
    .byte $73,$4c,$d5,$c9,$51,$5d,$22,$cf   ; [$bbad] byte
    .byte $55,$57,$48,$50,$53,$25,$55,$57   ; [$bbb5] byte
    .byte $25,$c4,$40,$c0,$65,$55,$55,$d0   ; [$bbbd] byte
    .byte $32,$c7,$26,$cd,$33,$5c,$ff,$34   ; [$bbc5] byte
    .byte $cd,$73,$4c,$d7,$34,$cd,$57,$34   ; [$bbcd] byte
    .byte $73,$4c,$d5                       ; [$bbd5] byte

BRANCH_BLOCKS_SCREEN_35:                    ; [$bbd8]
    .byte $c0,$b0,$50,$c0,$f0,$dc,$c3,$05   ; [$bbd8] byte
    .byte $30,$3c,$d3,$35,$cd,$33,$5c,$d3   ; [$bbe0] byte
    .byte $35,$cd,$33,$5c,$d3,$35,$cd,$33   ; [$bbe8] byte
    .byte $5c,$d3,$35,$cd,$33,$53,$22,$d2   ; [$bbf0] byte
    .byte $34,$6d,$1c,$c8,$b3,$fc,$8b,$48   ; [$bbf8] byte
    .byte $cf,$b4,$8c,$fb,$48,$cf,$b4,$8c   ; [$bc00] byte
    .byte $fb,$25,$c4,$44,$c4,$70,$9c,$93   ; [$bc08] byte
    .byte $11,$cf,$72,$5c,$f7,$25,$cf,$72   ; [$bc10] byte
    .byte $5c,$f5,$44,$73,$a5,$57,$40,$55   ; [$bc18] byte
    .byte $4d,$19,$c9,$b3,$4c,$d7,$34,$cd   ; [$bc20] byte
    .byte $73,$4c,$d5,$cd,$73,$4c,$d7,$34   ; [$bc28] byte
    .byte $cd,$73,$4c,$d7,$34,$d2,$33,$fd   ; [$bc30] byte
    .byte $20,$ac,$89,$d2,$33,$f3,$22,$d2   ; [$bc38] byte
    .byte $31,$0c,$3b,$28,$c4,$70,$9c,$93   ; [$bc40] byte
    .byte $34,$cd,$74,$8c,$97,$2b,$c9,$70   ; [$bc48] byte
    .byte $93,$3c,$c4,$73,$dc,$95,$57,$2b   ; [$bc50] byte
    .byte $ac,$44,$11,$55,$57,$34,$cd,$74   ; [$bc58] byte
    .byte $8c,$95,$11,$57,$58,$73,$a7,$2b   ; [$bc60] byte
    .byte $ac,$d3,$35,$73,$a1,$55,$cd,$0c   ; [$bc68] byte
    .byte $d7,$34,$cd,$74,$5d,$06,$b3,$4c   ; [$bc70] byte
    .byte $d7,$34,$cd,$73,$4c,$d7,$26,$cc   ; [$bc78] byte
    .byte $73,$20,$cc,$f0,$13,$4c,$ce,$f3   ; [$bc80] byte
    .byte $13,$32,$03,$33                   ; [$bc88] byte

BRANCH_BLOCKS_SCREEN_36:                    ; [$bc8c]
    .byte $cd,$33,$5c,$d3,$35,$cd,$33,$5c   ; [$bc8c] byte
    .byte $c3,$05,$03,$2f,$c0,$43,$02,$c9   ; [$bc94] byte
    .byte $b2,$23,$3f,$1c,$d3,$35,$cd,$33   ; [$bc9c] byte
    .byte $53,$28,$cc,$30,$5c,$0f,$26,$33   ; [$bca4] byte
    .byte $cc,$47,$09,$20,$0c,$d2,$cd,$33   ; [$bcac] byte
    .byte $5c,$d3,$35,$cd,$33,$5c,$b3,$3a   ; [$bcb4] byte
    .byte $20,$00,$00,$c9,$ab,$48,$10,$00   ; [$bcbc] byte
    .byte $00,$57,$26,$cb,$1c,$e8,$40,$03   ; [$bcc4] byte
    .byte $3a,$d5,$30,$ec,$e7,$1a,$c9,$73   ; [$bccc] byte
    .byte $ad,$20,$84,$33,$a3,$3c,$72,$2c   ; [$bcd4] byte
    .byte $fb,$1b,$c4,$72,$bc,$97,$2b,$88   ; [$bcdc] byte
    .byte $33,$cd,$23,$25,$5c,$f7,$25,$40   ; [$bce4] byte
    .byte $0c,$af,$48,$32,$5c,$44,$d6,$15   ; [$bcec] byte
    .byte $4c,$98,$cb,$10,$00,$57,$11,$cd   ; [$bcf4] byte
    .byte $33,$5c,$c7,$35,$a4,$32,$6c,$d3   ; [$bcfc] byte
    .byte $35,$cd,$0c,$d7,$34,$cd,$74,$5c   ; [$bd04] byte
    .byte $07,$41,$b3,$4c,$d7,$34,$cd,$73   ; [$bd0c] byte
    .byte $4c,$cb,$33,$cc,$73,$20,$cc,$f0   ; [$bd14] byte
    .byte $10,$d3,$33,$bc,$c7,$32,$33,$3c   ; [$bd1c] byte
    .byte $04                               ; [$bd24] byte

BRANCH_BLOCKS_SCREEN_37:                    ; [$bd25]
    .byte $c0,$f0,$dc,$2f,$0c,$c3,$73,$0c   ; [$bd25] byte
    .byte $bf,$01,$30,$2c,$0f,$0d,$30,$bc   ; [$bd2d] byte
    .byte $17,$03,$cd,$73,$4c,$d7,$34,$cd   ; [$bd35] byte
    .byte $73,$4c,$d7,$30,$c0,$f3,$4c,$d7   ; [$bd3d] byte
    .byte $34,$cd,$73,$4c,$d7,$34,$cf,$c0   ; [$bd45] byte
    .byte $0a,$cd,$33,$5c,$fc,$00,$c2,$40   ; [$bd4d] byte
    .byte $08,$0c,$24,$00,$00,$00,$00,$00   ; [$bd55] byte
    .byte $ce,$90,$00,$0c,$e8,$00,$d2,$10   ; [$bd5d] byte
    .byte $0c,$e8,$0d,$20,$00,$c4,$73,$a0   ; [$bd65] byte
    .byte $0d,$20,$0c,$97,$11,$00,$32,$bd   ; [$bd6d] byte
    .byte $20,$0c,$97,$11,$00,$00,$00,$00   ; [$bd75] byte
    .byte $03,$34,$cd,$73,$4c,$d7,$2c,$c9   ; [$bd7d] byte
    .byte $b2,$54,$0c,$d3,$35,$cd,$33,$5c   ; [$bd85] byte
    .byte $d3,$35,$cc,$b3,$ba,$cd,$0c,$d7   ; [$bd8d] byte
    .byte $34,$cd,$72,$6c,$c8,$03,$33,$c0   ; [$bd95] byte
    .byte $4d,$07,$26,$cc,$73,$20,$33,$3c   ; [$bd9d] byte
    .byte $04,$00,$00                       ; [$bda5] byte

BRANCH_BLOCKS_SCREEN_38:                    ; [$bda8]
    .byte $cc,$30,$3c,$d3,$35,$cd,$33,$5c   ; [$bda8] byte
    .byte $d3,$35,$cd,$33,$5c,$d3,$35,$cd   ; [$bdb0] byte
    .byte $33,$5c,$d3,$35,$33,$4c,$d7,$3e   ; [$bdb8] byte
    .byte $c8,$b3,$ec,$8b,$3e,$c8,$b3,$ec   ; [$bdc0] byte
    .byte $8b,$3e,$c8,$b3,$ec,$f3,$26,$cf   ; [$bdc8] byte
    .byte $f3,$ec,$8b,$3d,$c9,$73,$dc,$97   ; [$bdd0] byte
    .byte $3d,$c9,$73,$dc,$97,$3d,$c9,$73   ; [$bdd8] byte
    .byte $dc,$97,$2b,$c2,$73,$dc,$95,$55   ; [$bde0] byte
    .byte $55,$57,$11,$73,$4c,$d7,$34,$cd   ; [$bde8] byte
    .byte $55,$55,$d0,$15,$ce,$b3,$fc,$8b   ; [$bdf0] byte
    .byte $3f,$ac,$d3,$35,$cd,$33,$5c,$d3   ; [$bdf8] byte
    .byte $35,$72,$65,$d2,$30,$9c,$93,$09   ; [$be00] byte
    .byte $c8,$b3,$fc,$8b,$3f,$c8,$b3,$fd   ; [$be08] byte
    .byte $23,$3f,$d2,$33,$fc,$89,$15,$c9   ; [$be10] byte
    .byte $30,$9c,$93,$09,$c9,$30,$9c,$93   ; [$be18] byte
    .byte $09,$c9,$30,$9c,$91,$15,$55,$57   ; [$be20] byte
    .byte $3a,$73,$a7,$26,$55,$57,$3a,$73   ; [$be28] byte
    .byte $a7,$34,$cd,$73,$4c,$d5,$33,$a7   ; [$be30] byte
    .byte $3a,$73,$ac,$d3,$35,$cd,$33,$5c   ; [$be38] byte
    .byte $d3,$35,$cc,$b3,$b0,$cd,$0c,$d7   ; [$be40] byte
    .byte $34,$cd,$72,$6c,$c8,$03,$33,$c0   ; [$be48] byte
    .byte $40,$cc,$73,$20,$33,$3c,$04,$00   ; [$be50] byte
    .byte $00                               ; [$be58] byte

BRANCH_BLOCKS_SCREEN_39:                    ; [$be59]
    .byte $cc,$30,$3c,$c3,$03,$c3,$73,$0c   ; [$be59] byte
    .byte $bf,$01,$00,$00,$cd,$73,$4c,$d7   ; [$be61] byte
    .byte $26,$c6,$b1,$cc,$d3,$35,$d0,$d0   ; [$be69] byte
    .byte $00,$c8,$b3,$fc,$8b,$3f,$c8,$f0   ; [$be71] byte
    .byte $9c,$8a,$a4,$00,$c4,$70,$9c,$97   ; [$be79] byte
    .byte $09,$c9,$5c,$97,$3e,$ac,$c3,$2f   ; [$be81] byte
    .byte $40,$73,$a7,$3a,$73,$a7,$3d,$5c   ; [$be89] byte
    .byte $d3,$35,$d0,$d0,$72,$b7,$2b,$cd   ; [$be91] byte
    .byte $33,$5c,$d3,$35,$c9,$b0,$11,$c9   ; [$be99] byte
    .byte $a4,$40,$b4,$83,$3e,$c0,$40,$cd   ; [$bea1] byte
    .byte $33,$59,$40,$03,$3d,$4d,$01,$5d   ; [$bea9] byte
    .byte $11,$cd,$33,$5c,$d3,$35,$cd,$33   ; [$beb1] byte
    .byte $5c,$d3,$35,$cd,$33,$57,$26,$55   ; [$beb9] byte
    .byte $c6,$33,$23,$31,$ce,$73,$8c,$9a   ; [$bec1] byte
    .byte $b3,$fc,$07,$34,$cd,$72,$65,$cc   ; [$bec9] byte
    .byte $f0,$10,$34,$cc,$ef,$35,$ca,$70   ; [$bed1] byte
    .byte $97,$35,$ad,$15,$00,$03,$34,$ca   ; [$bed9] byte
    .byte $b3,$a7,$34,$b4,$5c,$04,$00,$03   ; [$bee1] byte
    .byte $41,$b3,$5c,$98,$d1,$70,$10,$00   ; [$bee9] byte
    .byte $df,$7f,$ff,$ff,$dd,$ff,$02,$00   ; [$bef1] byte
    .byte $ee,$ff,$fe,$ff,$d5,$ff,$00,$ac   ; [$bef9] byte
    .byte $ff,$ff,$ff,$ff,$fb,$ff,$80,$01   ; [$bf01] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$08,$3b   ; [$bf09] byte
    .byte $fd,$ff,$ff,$ff,$5f,$ff,$00,$00   ; [$bf11] byte
    .byte $fe,$ff,$ff,$ff,$57,$ff,$00,$08   ; [$bf19] byte
    .byte $ff,$fb,$ff,$ff,$df,$ff,$00,$40   ; [$bf21] byte
    .byte $ff,$ff,$df,$ff,$fa,$ff,$00,$28   ; [$bf29] byte
    .byte $fd,$ff,$fd,$ff,$fd,$ff,$00,$00   ; [$bf31] byte
    .byte $ff,$ff,$ff,$ff,$e6,$ff,$00,$00   ; [$bf39] byte
    .byte $ff,$fe,$ff,$ff,$ff,$ff,$88,$00   ; [$bf41] byte
    .byte $ff,$ff,$dd,$ff,$f7,$ff,$00,$00   ; [$bf49] byte
    .byte $fb,$ff,$ff,$ff,$ff,$ff,$00,$00   ; [$bf51] byte
    .byte $f7,$ff,$ff,$ff,$ef,$ff,$00,$40   ; [$bf59] byte
    .byte $ff,$ff,$ff,$ff,$db,$ff,$00,$13   ; [$bf61] byte
    .byte $ff,$f7,$ff,$ff,$e7,$ff,$00,$00   ; [$bf69] byte
    .byte $f7,$ff,$ef,$ff,$dd,$ff,$00,$02   ; [$bf71] byte
    .byte $fb,$ff,$ef,$ef,$ed,$ff,$00,$00   ; [$bf79] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$00,$00   ; [$bf81] byte
    .byte $ff,$fe,$ff,$df,$d6,$ff,$00,$c1   ; [$bf89] byte
    .byte $fe,$7f,$ff,$ff,$fe,$ff,$00,$14   ; [$bf91] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$20,$00   ; [$bf99] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$23,$00   ; [$bfa1] byte
    .byte $67,$bb,$bf,$ff,$ff,$ff,$40,$0a   ; [$bfa9] byte
    .byte $fc,$ff,$ee,$ff,$4f,$ff,$00,$40   ; [$bfb1] byte
    .byte $ff,$ff,$ff,$bf,$fe,$ff,$40,$00   ; [$bfb9] byte
    .byte $df,$fb,$ff,$ff,$ff,$fd,$81,$00   ; [$bfc1] byte
    .byte $ff,$df,$7f,$ff,$f1,$df,$02,$00   ; [$bfc9] byte
    .byte $ff,$6f,$7f,$ff,$f4,$ff,$10,$00   ; [$bfd1] byte
    .byte $ff,$ff,$ff,$bf,$ef,$ff,$00,$00   ; [$bfd9] byte
    .byte $ff,$de,$ff,$f7,$ff,$df,$1c,$00   ; [$bfe1] byte
    .byte $ff,$ff,$ff,$ef,$ff,$ff,$01,$10   ; [$bfe9] byte
    .byte $ff,$ff,$ff,$ff,$2f,$ff,$00,$12   ; [$bff1] byte
    .byte $ff,$ff,$ff,$ff,$e7,$ff,$00       ; [$bff9] byte
