;============================================================================
; Faxanadu (U).nes
;
; PRG13 ($8000 - $bfff)
;============================================================================

    .segment "PRG13"
    .ORG $8000


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
TILE_GLYPH_SPACE:                           ; [$8000]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8000] byte


;
; ....█...
; ...██...
; ...██...
; ...█....
; ...█....
; ........
; ..██....
; ........
;
TILE_GLYPH_EXCLAMATION_MARK:                ; [$8008]
    .byte $08,$18,$18,$10,$10,$00,$30,$00   ; [$8008] byte


;
; ........
; ........
; ..█.█...
; ..█.█...
; ..█.█...
; ........
; ........
; ........
;
TILE_GLYPH_DOUBLE_QUOTES:                   ; [$8010]
    .byte $00,$00,$28,$28,$28,$00,$00,$00   ; [$8010] byte


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
TILE_GLYPH_EMPTY1:                          ; [$8018]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8018] byte


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
TILE_GLYPH_EMPTY2:                          ; [$8020]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8020] byte


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
TILE_GLYPH_EMPTY3:                          ; [$8028]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8028] byte


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
TILE_GLYPH_EMPTY4:                          ; [$8030]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8030] byte


;
; ....█...
; ...██...
; ...█....
; ........
; ........
; ........
; ........
; ........
;
TILE_GLYPH_SINGLE_QUOTE:                    ; [$8038]
    .byte $08,$18,$10,$00,$00,$00,$00,$00   ; [$8038] byte


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
TILE_GLYPH_EMPTY5:                          ; [$8040]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8040] byte


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
TILE_GLYPH_EMPTY6:                          ; [$8048]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8048] byte


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
TILE_GLYPH_EMPTY7:                          ; [$8050]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8050] byte


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
TILE_GLYPH_EMPTY8:                          ; [$8058]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8058] byte


;
; ........
; ........
; ........
; .██.....
; .██.....
; ..█.....
; .█......
; ........
;
TILE_GLYPH_COMMA:                           ; [$8060]
    .byte $00,$00,$00,$60,$60,$20,$40,$00   ; [$8060] byte


;
; ........
; ........
; ........
; .██████.
; ........
; ........
; ........
; ........
;
TILE_GLYPH_DASH:                            ; [$8068]
    .byte $00,$00,$00,$7e,$00,$00,$00,$00   ; [$8068] byte


;
; ........
; ........
; ........
; ........
; ........
; ..██....
; ..██....
; ........
;
TILE_GLYPH_PERIOD:                          ; [$8070]
    .byte $00,$00,$00,$00,$00,$30,$30,$00   ; [$8070] byte


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
TILE_GLYPH_EMPTY9:                          ; [$8078]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8078] byte


;
; .█████..
; ██...██.
; ██...██.
; ██...██.
; ██...██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_0:                               ; [$8080]
    .byte $7c,$c6,$c6,$c6,$c6,$c6,$7c,$00   ; [$8080] byte


;
; ...██...
; ..███...
; ...██...
; ...██...
; ...██...
; ...██...
; ..████..
; ........
;
TILE_GLYPH_1:                               ; [$8088]
    .byte $18,$38,$18,$18,$18,$18,$3c,$00   ; [$8088] byte


;
; .█████..
; ██...██.
; ....███.
; ..████..
; .███....
; ███.....
; ███████.
; ........
;
TILE_GLYPH_2:                               ; [$8090]
    .byte $7c,$c6,$0e,$3c,$70,$e0,$fe,$00   ; [$8090] byte


;
; .██████.
; ....██..
; ...██...
; ..████..
; .....██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_3:                               ; [$8098]
    .byte $7e,$0c,$18,$3c,$06,$c6,$7c,$00   ; [$8098] byte


;
; ...███..
; ..████..
; .██.██..
; ██..██..
; ██..██..
; ███████.
; ....██..
; ........
;
TILE_GLYPH_4:                               ; [$80a0]
    .byte $1c,$3c,$6c,$cc,$cc,$fe,$0c,$00   ; [$80a0] byte


;
; ███████.
; ██......
; ██████..
; ....███.
; .....██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_5:                               ; [$80a8]
    .byte $fe,$c0,$fc,$0e,$06,$c6,$7c,$00   ; [$80a8] byte


;
; ..████..
; .██.....
; ██......
; ██████..
; ██...██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_6:                               ; [$80b0]
    .byte $3c,$60,$c0,$fc,$c6,$c6,$7c,$00   ; [$80b0] byte


;
; ███████.
; ██...██.
; ....██..
; ...██...
; ..██....
; ..██....
; ..██....
; ........
;
TILE_GLYPH_7:                               ; [$80b8]
    .byte $fe,$c6,$0c,$18,$30,$30,$30,$00   ; [$80b8] byte


;
; .█████..
; ██...██.
; ██...██.
; .█████..
; ██...██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_8:                               ; [$80c0]
    .byte $7c,$c6,$c6,$7c,$c6,$c6,$7c,$00   ; [$80c0] byte


;
; .█████..
; ██...██.
; ██...██.
; .██████.
; .....██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_9:                               ; [$80c8]
    .byte $7c,$c6,$c6,$7e,$06,$c6,$7c,$00   ; [$80c8] byte


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
TILE_GLYPH_EMPTY10:                         ; [$80d0]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$80d0] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$80d8] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$80e0] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$80e8] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$80f0] byte


;
; .█████..
; ██...██.
; █....██.
; ..████..
; ..██....
; ........
; ..██....
; ........
;
TILE_GLYPH_QUESTION_MASK:                   ; [$80f8]
    .byte $7c,$c6,$86,$3c,$30,$00,$30,$00   ; [$80f8] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$8100] byte


;
; ..███...
; ..███...
; ..█.██..
; .██..█..
; .██████.
; .█...██.
; ██..███.
; ........
;
TILE_GLYPH_A:                               ; [$8108]
    .byte $38,$38,$2c,$64,$7e,$46,$ce,$00   ; [$8108] byte


;
; ██████..
; .██...█.
; .███.██.
; .██.██..
; .██...█.
; .██..██.
; ██████..
; ........
;
TILE_GLYPH_B:                               ; [$8110]
    .byte $fc,$62,$76,$6c,$62,$66,$fc,$00   ; [$8110] byte


;
; .█████..
; ███..██.
; ██....█.
; ██......
; ██......
; ███..██.
; .█████..
; ........
;
TILE_GLYPH_C:                               ; [$8118]
    .byte $7c,$e6,$c2,$c0,$c0,$e6,$7c,$00   ; [$8118] byte


;
; █████...
; .█..██..
; .█...██.
; .█...██.
; .█...██.
; ██..███.
; ██████..
; ........
;
TILE_GLYPH_D:                               ; [$8120]
    .byte $f8,$4c,$46,$46,$46,$ce,$fc,$00   ; [$8120] byte


;
; ███████.
; .██..██.
; .████...
; .█████..
; .██.....
; .██..██.
; ██████..
; ........
;
TILE_GLYPH_E:                               ; [$8128]
    .byte $fe,$66,$78,$7c,$60,$66,$fc,$00   ; [$8128] byte


;
; ███████.
; .██..██.
; .████...
; .█████..
; .██.....
; .██.....
; ████....
; ........
;
TILE_GLYPH_F:                               ; [$8130]
    .byte $fe,$66,$78,$7c,$60,$60,$f0,$00   ; [$8130] byte


;
; .█████..
; ███..██.
; ██......
; ██..███.
; ██...██.
; ███..██.
; .█████..
; ........
;
TILE_GLYPH_G:                               ; [$8138]
    .byte $7c,$e6,$c0,$ce,$c6,$e6,$7c,$00   ; [$8138] byte


;
; ███.███.
; .██..██.
; .███.██.
; .██.███.
; .██..██.
; .██..██.
; ███.████
; ........
;
TILE_GLYPH_H:                               ; [$8140]
    .byte $ee,$66,$76,$6e,$66,$66,$ef,$00   ; [$8140] byte


;
; ..████..
; ...██...
; ...██...
; ...██...
; ...██...
; ...██...
; ..████..
; ........
;
TILE_GLYPH_I:                               ; [$8148]
    .byte $3c,$18,$18,$18,$18,$18,$3c,$00   ; [$8148] byte


;
; ....███.
; .....██.
; .....██.
; ██...██.
; ██...██.
; ██..███.
; .█████..
; ........
;
TILE_GLYPH_J:                               ; [$8150]
    .byte $0e,$06,$06,$c6,$c6,$ce,$7c,$00   ; [$8150] byte


;
; ██..███.
; ██.███..
; █████...
; ████....
; █████.█.
; ██.████.
; ██..██..
; ........
;
TILE_GLYPH_K:                               ; [$8158]
    .byte $ce,$dc,$f8,$f0,$fa,$de,$cc,$00   ; [$8158] byte


;
; ██......
; ██......
; ██......
; ██......
; ██....█.
; ██...██.
; ███████.
; ........
;
TILE_GLYPH_L:                               ; [$8160]
    .byte $c0,$c0,$c0,$c0,$c2,$c6,$fe,$00   ; [$8160] byte


;
; ██...██.
; ███.███.
; ███████.
; ██.█.██.
; ██...██.
; ██...██.
; ██...██.
; ........
;
TILE_GLYPH_M:                               ; [$8168]
    .byte $c6,$ee,$fe,$d6,$c6,$c6,$c6,$00   ; [$8168] byte


;
; ██...██.
; ███..██.
; ████.██.
; ██.████.
; ██..███.
; ██...██.
; ██....█.
; ........
;
TILE_GLYPH_N:                               ; [$8170]
    .byte $c6,$e6,$f6,$de,$ce,$c6,$c2,$00   ; [$8170] byte


;
; .█████..
; ███.███.
; ██...██.
; ██...██.
; ██...██.
; ███.██..
; .████...
; ........
;
TILE_GLYPH_O:                               ; [$8178]
    .byte $7c,$ee,$c6,$c6,$c6,$ec,$78,$00   ; [$8178] byte


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
TILE_GLYPH_P:                               ; [$8180]
    .byte $fc,$c6,$e6,$e6,$dc,$c0,$c0,$00   ; [$8180] byte


;
; .█████..
; ██..███.
; ██...██.
; ██...██.
; ██.████.
; ███.██..
; .██████.
; ........
;
TILE_GLYPH_Q:                               ; [$8188]
    .byte $7c,$ce,$c6,$c6,$de,$ec,$7e,$00   ; [$8188] byte


;
; ██████..
; .█...██.
; .██..██.
; .█████..
; .█.██...
; ██..██..
; ███..██.
; ........
;
TILE_GLYPH_R:                               ; [$8190]
    .byte $fc,$46,$66,$7c,$58,$cc,$e6,$00   ; [$8190] byte


;
; .█████..
; ██...██.
; ██....█.
; .█████..
; .....██.
; ██...██.
; .█████..
; ........
;
TILE_GLYPH_S:                               ; [$8198]
    .byte $7c,$c6,$c2,$7c,$06,$c6,$7c,$00   ; [$8198] byte


;
; ███████.
; ██.█.██.
; █..█..█.
; ...█....
; ...█....
; ...█....
; ..███...
; ........
;
TILE_GLYPH_T:                               ; [$81a0]
    .byte $fe,$d6,$92,$10,$10,$10,$38,$00   ; [$81a0] byte


;
; ███..██.
; ███..██.
; ██....█.
; ██....█.
; ██....█.
; ███..██.
; .█████..
; ........
;
TILE_GLYPH_U:                               ; [$81a8]
    .byte $e6,$e6,$c2,$c2,$c2,$e6,$7c,$00   ; [$81a8] byte


;
; ██...██.
; ██...██.
; ██...██.
; .██.███.
; .██.██..
; ..████..
; ...██...
; ........
;
TILE_GLYPH_V:                               ; [$81b0]
    .byte $c6,$c6,$c6,$6e,$6c,$3c,$18,$00   ; [$81b0] byte


;
; ██.██.█.
; ██.██.█.
; █..██.█.
; █████.█.
; ███████.
; ███.███.
; .█...█..
; ........
;
TILE_GLYPH_W:                               ; [$81b8]
    .byte $da,$da,$9a,$fa,$fe,$ee,$44,$00   ; [$81b8] byte


;
; █....██.
; ██..███.
; .████...
; ..██....
; .████...
; ██..███.
; █....██.
; ........
;
TILE_GLYPH_X:                               ; [$81c0]
    .byte $86,$ce,$78,$30,$78,$ce,$86,$00   ; [$81c0] byte


;
; ██...██.
; ██...██.
; ██...██.
; .█████..
; ..███...
; ...██...
; ..███...
; ........
;
TILE_GLYPH_Y:                               ; [$81c8]
    .byte $c6,$c6,$c6,$7c,$38,$18,$38,$00   ; [$81c8] byte


;
; .██████.
; ██..███.
; █..██...
; ..██....
; .██...█.
; ███..██.
; ██████..
; ........
;
TILE_GLYPH_Z:                               ; [$81d0]
    .byte $7e,$ce,$98,$30,$62,$e6,$fc,$00   ; [$81d0] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$81d8] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$81e0] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$81e8] byte


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
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$81f0] byte


;
; ........
; ........
; ........
; ........
; ........
; ........
; ........
; .██████.
;
TILE_GLYPH_UNDERSCORE:                      ; [$81f8]
    .byte $00,$00,$00,$00,$00,$00,$00,$7e   ; [$81f8] byte


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
TILE_GLYPH_CURSOR:                          ; [$8200]
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8200] byte


;
; ........
; ..███...
; ....██..
; ..████..
; .██.██..
; .██.███.
; ..█████.
; ........
;
TILE_GLYPH_a:                               ; [$8208]
    .byte $00,$38,$0c,$3c,$6c,$6e,$3e,$00   ; [$8208] byte


;
; .█......
; .██.....
; .██.....
; .████...
; .██.██..
; .██.██..
; ..███...
; ........
;
TILE_GLYPH_b:                               ; [$8210]
    .byte $40,$60,$60,$78,$6c,$6c,$38,$00   ; [$8210] byte


;
; ........
; ........
; ..███...
; .█████..
; .██.....
; .██..█..
; ..███...
; ........
;
TILE_GLYPH_c:                               ; [$8218]
    .byte $00,$00,$38,$7c,$60,$64,$38,$00   ; [$8218] byte


;
; .....█..
; ....██..
; ....██..
; ..████..
; .██.██..
; .██.██..
; ..███...
; ........
;
TILE_GLYPH_d:                               ; [$8220]
    .byte $04,$0c,$0c,$3c,$6c,$6c,$38,$00   ; [$8220] byte


;
; ........
; ........
; ..███...
; .██..█..
; .█████..
; .██.....
; ..████..
; ........
;
TILE_GLYPH_e:                               ; [$8228]
    .byte $00,$00,$38,$64,$7c,$60,$3c,$00   ; [$8228] byte


;
; ...███..
; ...██...
; .██████.
; ...██...
; ...██...
; ...██...
; ...██...
; ........
;
TILE_GLYPH_f:                               ; [$8230]
    .byte $1c,$18,$7e,$18,$18,$18,$18,$00   ; [$8230] byte


;
; ........
; ..███...
; .██.██..
; .██.██..
; ..████..
; ....██..
; .██.██..
; ..███...
;
TILE_GLYPH_g:                               ; [$8238]
    .byte $00,$38,$6c,$6c,$3c,$0c,$6c,$38   ; [$8238] byte


;
; .██.....
; .██.....
; .██.....
; .████...
; .██.██..
; .██.██..
; .██.██..
; ........
;
TILE_GLYPH_h:                               ; [$8240]
    .byte $60,$60,$60,$78,$6c,$6c,$6c,$00   ; [$8240] byte


;
; ..██....
; ..██....
; ........
; ..██....
; ..██....
; ..██....
; ..██....
; ........
;
TILE_GLYPH_i:                               ; [$8248]
    .byte $30,$30,$00,$30,$30,$30,$30,$00   ; [$8248] byte


;
; ...██...
; ...██...
; ........
; ...██...
; ...██...
; .█.██...
; .█.██...
; ..██....
;
TILE_GLYPH_j:                               ; [$8250]
    .byte $18,$18,$00,$18,$18,$58,$58,$30   ; [$8250] byte


;
; .██.....
; .██.....
; .██..█..
; .██.██..
; .████...
; .████...
; .██.██..
; ........
;
TILE_GLYPH_k:                               ; [$8258]
    .byte $60,$60,$64,$6c,$78,$78,$6c,$00   ; [$8258] byte


;
; ...█....
; ...██...
; ...██...
; ...██...
; ...██...
; ...██...
; ...██...
; ........
;
TILE_GLYPH_l:                               ; [$8260]
    .byte $10,$18,$18,$18,$18,$18,$18,$00   ; [$8260] byte


;
; ........
; ........
; .██.██..
; .█.█.██.
; .█.█.██.
; .█.█.██.
; .█.█.██.
; ........
;
TILE_GLYPH_m:                               ; [$8268]
    .byte $00,$00,$6c,$56,$56,$56,$56,$00   ; [$8268] byte


;
; ........
; ........
; .████...
; .██.██..
; .██.██..
; .██.██..
; .██.██..
; ........
;
TILE_GLYPH_n:                               ; [$8270]
    .byte $00,$00,$78,$6c,$6c,$6c,$6c,$00   ; [$8270] byte


;
; ........
; ........
; ..███...
; .██.██..
; .██.██..
; .██.██..
; ..███...
; ........
;
TILE_GLYPH_o:                               ; [$8278]
    .byte $00,$00,$38,$6c,$6c,$6c,$38,$00   ; [$8278] byte


;
; ........
; ........
; .████...
; .██.██..
; .██.██..
; .████...
; .██.....
; .██.....
;
TILE_GLYPH_p:                               ; [$8280]
    .byte $00,$00,$78,$6c,$6c,$78,$60,$60   ; [$8280] byte


;
; ........
; ........
; ..████..
; .██.██..
; .██.██..
; ..████..
; ....██..
; ....██..
;
TILE_GLYPH_q:                               ; [$8288]
    .byte $00,$00,$3c,$6c,$6c,$3c,$0c,$0c   ; [$8288] byte


;
; ........
; ........
; .██.██..
; .█████..
; .███....
; .██.....
; .██.....
; ........
;
TILE_GLYPH_r:                               ; [$8290]
    .byte $00,$00,$6c,$7c,$70,$60,$60,$00   ; [$8290] byte


;
; ........
; ........
; ..████..
; .██.....
; .█████..
; ....██..
; .████...
; ........
;
TILE_GLYPH_s:                               ; [$8298]
    .byte $00,$00,$3c,$60,$7c,$0c,$78,$00   ; [$8298] byte


;
; ...█....
; ...██...
; .█████..
; ...██...
; ...██...
; ...██...
; ....██..
; ........
;
TILE_GLYPH_t:                               ; [$82a0]
    .byte $10,$18,$7c,$18,$18,$18,$0c,$00   ; [$82a0] byte


;
; ........
; ........
; .█..█...
; .██.██..
; .██.██..
; .██.██..
; ..██.█..
; ........
;
TILE_GLYPH_u:                               ; [$82a8]
    .byte $00,$00,$48,$6c,$6c,$6c,$34,$00   ; [$82a8] byte


;
; ........
; ........
; .█..█...
; .██.██..
; .██.██..
; ..███...
; ...█....
; ........
;
TILE_GLYPH_v:                               ; [$82b0]
    .byte $00,$00,$48,$6c,$6c,$38,$10,$00   ; [$82b0] byte


;
; ........
; ........
; .█.█..█.
; .█.█.██.
; .█.█.██.
; .█.█.██.
; ..█.██..
; ........
;
TILE_GLYPH_w:                               ; [$82b8]
    .byte $00,$00,$52,$56,$56,$56,$2c,$00   ; [$82b8] byte


;
; ........
; ........
; .██..██.
; ..████..
; ...██...
; ..█.██..
; .█...██.
; ........
;
TILE_GLYPH_x:                               ; [$82c0]
    .byte $00,$00,$66,$3c,$18,$2c,$46,$00   ; [$82c0] byte


;
; ........
; ........
; ..█..█..
; .██.██..
; .██.██..
; ..████..
; ...██...
; .███....
;
TILE_GLYPH_y:                               ; [$82c8]
    .byte $00,$00,$24,$6c,$6c,$3c,$18,$70   ; [$82c8] byte


;
; ........
; ........
; .█████..
; ...███..
; ..███...
; .███....
; .█████..
; ........
;
TILE_GLYPH_z:                               ; [$82d0]
    .byte $00,$00,$7c,$1c,$38,$70,$7c,$00   ; [$82d0] byte


;
; ........
; ........
; ...█████
; ...█████
; ...█████
; ........
; ........
; ........
;
TILE_GLYPH_RIGHT_ARROW_START:               ; [$82d8]
    .byte $00,$00,$1f,$1f,$1f,$00,$00,$00   ; [$82d8] byte


;
; ........
; ........
; ████████
; ████████
; ████████
; ........
; ........
; ........
;
TILE_GLYPH_ARROW_MIDDLE:                    ; [$82e0]
    .byte $00,$00,$ff,$ff,$ff,$00,$00,$00   ; [$82e0] byte


;
; █.......
; ██......
; ███.....
; ████....
; ███.....
; ██......
; █.......
; ........
;
TILE_GLYPH_RIGHT_ARROW_END:                 ; [$82e8]
    .byte $80,$c0,$e0,$f0,$e0,$c0,$80,$00   ; [$82e8] byte


;
; .......█
; ......██
; .....███
; ....████
; .....███
; ......██
; .......█
; ........
;
TILE_GLYPH_LEFT_ARROW_END:                  ; [$82f0]
    .byte $01,$03,$07,$0f,$07,$03,$01,$00   ; [$82f0] byte


;
; ........
; ........
; █████...
; █████...
; █████...
; ........
; ........
; ........
;
TILE_GLYPH_LEFT_ARROW_START:                ; [$82f8]
    .byte $00,$00,$f8,$f8,$f8,$00,$00,$00   ; [$82f8] byte


;============================================================================
; All messages available for display.
;
; Indexes are 1-based.
;============================================================================
MESSAGE_HELP_WITH_ANYTHING:                 ; [$8300]
MESSAGE_STRINGS:
    .byte "H"                               ; Message 1
    .byte "ello.",$fe,"Co"                  ; [$8301] char
    .byte "uld",$fd,"I",$fd,"he"            ; [$8309] char
    .byte "lp",$fd,"youwi"                  ; [$8311] char
    .byte "th",$fd,"anyth"                  ; [$8319] char
    .byte "ing.",$fc,"Wha"                  ; [$8321] char
    .byte "t",$fe,"would",$fd               ; [$8329] char
    .byte "you",$fd,"like"                  ; [$8331] char
    .byte "?",$ff                           ; [$8339] char

MESSAGE_THANK_YOU_FOR_SHOPPING:             ; [$833b]
    .byte "T"                               ; Message 2
    .byte "hank",$fd,"you"                  ; [$833c] char
    .byte $fe,"for",$fd,"sho"               ; [$8344] char
    .byte "pping.",$ff                      ; [$834c] char

MESSAGE_NOT_ENOUGH_GOLD:                    ; [$8353]
    .byte "T"                               ; Message 3
    .byte "his",$fd,"is",$fd,"n"            ; [$8354] char
    .byte "ot",$fe,"enoug"                  ; [$835c] char
    .byte "h",$fd,"Golds."                  ; [$8364] char
    .byte $ff                               ; [$836c] char

MESSAGE_ANYTHING_ELSE:                      ; [$836d]
    .byte "A"                               ; Message 4
    .byte "nything",$fd                     ; [$836e] char
    .byte "else?",$ff                       ; [$8376] char

MESSAGE_COME_BACK_AGAIN:                    ; [$837c]
    .byte "C"                               ; Message 5
    .byte "ome",$fd,"back"                  ; [$837d] char
    .byte $fd,"again.",$ff                  ; [$8385] char

MESSAGE_CANT_CARRY_MORE:                    ; [$838d]
    .byte "Y"                               ; Message 6
    .byte "ou",$fd,"can't"                  ; [$838e] char
    .byte $fd,"carry",$fe,"a"               ; [$8396] char
    .byte "ny",$fd,"more."                  ; [$839e] char
    .byte $ff                               ; [$83a6] char

MESSAGE_DRIED_MEAT_50G:                     ; [$83a7]
    .byte "D"                               ; Message 7
    .byte "ried",$fd,"mea"                  ; [$83a8] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$83b0] char
    .byte "ng",$fd,"energ"                  ; [$83b8] char
    .byte "y",$fe,"for",$fd,"50"            ; [$83c0] char
    .byte $fd,"Golds.",$ff                  ; [$83c8] char

MESSAGE_DRIED_MEAT_150G:                    ; [$83d0]
    .byte "D"                               ; Message 8
    .byte "ried",$fd,"mea"                  ; [$83d1] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$83d9] char
    .byte "ng",$fd,"energ"                  ; [$83e1] char
    .byte "y",$fe,"for",$fd,"15"            ; [$83e9] char
    .byte "0",$fd,"Golds."                  ; [$83f1] char
    .byte $ff                               ; [$83f9] char

MESSAGE_DRIED_MEAT_180G:                    ; [$83fa]
    .byte "D"                               ; Message 9
    .byte "ried",$fd,"mea"                  ; [$83fb] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$8403] char
    .byte "ng",$fd,"energ"                  ; [$840b] char
    .byte "y",$fe,"for",$fd,"18"            ; [$8413] char
    .byte "0",$fd,"Golds."                  ; [$841b] char
    .byte $ff                               ; [$8423] char

MESSAGE_DRIED_MEAT_250G:                    ; [$8424]
    .byte "D"                               ; Message 10
    .byte "ried",$fd,"mea"                  ; [$8425] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$842d] char
    .byte "ng",$fd,"energ"                  ; [$8435] char
    .byte "y",$fe,"for",$fd,"25"            ; [$843d] char
    .byte "0",$fd,"Golds."                  ; [$8445] char
    .byte $ff                               ; [$844d] char

MESSAGE_DRIED_MEAT_350G:                    ; [$844e]
    .byte "D"                               ; Message 11
    .byte "ried",$fd,"mea"                  ; [$844f] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$8457] char
    .byte "ng",$fd,"energ"                  ; [$845f] char
    .byte "y",$fe,"for",$fd,"35"            ; [$8467] char
    .byte "0",$fd,"Golds."                  ; [$846f] char
    .byte $ff                               ; [$8477] char

MESSAGE_DRIED_MEAT_500G:                    ; [$8478]
    .byte "D"                               ; Message 12
    .byte "ried",$fd,"mea"                  ; [$8479] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$8481] char
    .byte "ng",$fd,"energ"                  ; [$8489] char
    .byte "y",$fe,"for",$fd,"50"            ; [$8491] char
    .byte "0",$fd,"Golds."                  ; [$8499] char
    .byte $ff                               ; [$84a1] char

MESSAGE_DRIED_MEAT_800G:                    ; [$84a2]
    .byte "D"                               ; Message 13
    .byte "ried",$fd,"mea"                  ; [$84a3] char
    .byte "t",$fd,"to",$fe,"bri"            ; [$84ab] char
    .byte "ng",$fd,"energ"                  ; [$84b3] char
    .byte "y",$fe,"for",$fd,"80"            ; [$84bb] char
    .byte "0",$fd,"Golds."                  ; [$84c3] char
    .byte $ff                               ; [$84cb] char

MESSAGE_I_SELL_KEYS:                        ; [$84cc]
    .byte "H"                               ; Message 14
    .byte "ello.",$fe,"I",$fd               ; [$84cd] char
    .byte "sell",$fd,"key"                  ; [$84d5] char
    .byte "s.",$fe,"What",$fe               ; [$84dd] char
    .byte "would",$fd,"yo"                  ; [$84e5] char
    .byte "u",$fd,"like?",$ff               ; [$84ed] char

MESSAGE_I_SELL_TOOLS:                       ; [$84f5]
    .byte "H"                               ; Message 15
    .byte "ello.",$fe,"I",$fd               ; [$84f6] char
    .byte "sell",$fd,"too"                  ; [$84fe] char
    .byte "ls.",$fe,"What"                  ; [$8506] char
    .byte $fe,"would",$fd,"y"               ; [$850e] char
    .byte "ou",$fd,"like?"                  ; [$8516] char
    .byte $ff                               ; [$851e] char

MESSAGE_COME_HERE_TO_BUY_SELL:              ; [$851f]
    .byte "C"                               ; Message 16
    .byte "ome",$fd,"here"                  ; [$8520] char
    .byte $fe,"to",$fd,"buy."               ; [$8528] char
    .byte $fe,"Come",$fd,"he"               ; [$8530] char
    .byte "re",$fe,"to",$fd,"se"            ; [$8538] char
    .byte "ll.",$ff                         ; [$8540] char

MESSAGE_NO_KEY:                             ; [$8544]
    .byte "Y"                               ; Message 17
    .byte "ou",$fd,"don't"                  ; [$8545] char
    .byte $fe,"have",$fd,"a",$fd            ; [$854d] char
    .byte "key.",$ff                        ; [$8555] char

MESSAGE_NOTHING_TO_BUY:                     ; [$855a]
    .byte "Y"                               ; Message 18
    .byte "ou",$fd,"have",$fe               ; [$855b] char
    .byte "nothing",$fd                     ; [$8563] char
    .byte "to",$fd,"buy.",$ff               ; [$856b] char

MESSAGE_WHICH_TO_SELL:                      ; [$8573]
    .byte "W"                               ; Message 19
    .byte "hich",$fd,"one"                  ; [$8574] char
    .byte $fd,"would",$fe,"l"               ; [$857c] char
    .byte "ike",$fd,"to",$fd,"s"            ; [$8584] char
    .byte "ell?",$ff                        ; [$858c] char

MESSAGE_WHAT_WOULD_YOU_LIKE:                ; [$8591]
    .byte "W"                               ; Message 20
    .byte "hat",$fe,"woul"                  ; [$8592] char
    .byte "d",$fd,"you",$fd,"li"            ; [$859a] char
    .byte "ke?",$ff                         ; [$85a2] char

MESSAGE_MAGIC_200G:                         ; [$85a6]
    .byte "I"                               ; Message 21
    .byte $fd,"shall",$fd,"g"               ; [$85a7] char
    .byte "ive",$fe,"magi"                  ; [$85af] char
    .byte "c",$fe,"for",$fd,"20"            ; [$85b7] char
    .byte "0",$fd,"Golds."                  ; [$85bf] char
    .byte $ff                               ; [$85c7] char

MESSAGE_WATCH_POWER_LEVEL:                  ; [$85c8]
    .byte "W"                               ; Message 22
    .byte "atch",$fd,"you"                  ; [$85c9] char
    .byte "r",$fe,"remain"                  ; [$85d1] char
    .byte "ing",$fe,"powe"                  ; [$85d9] char
    .byte "r",$fd,"level."                  ; [$85e1] char
    .byte $ff                               ; [$85e9] char

MESSAGE_MAGIC_FIRE_3000G:                   ; [$85ea]
    .byte "D"                               ; Message 23
    .byte "o",$fd,"you",$fd,"kn"            ; [$85eb] char
    .byte "ow",$fd,"the",$fe,"m"            ; [$85f3] char
    .byte "agic",$fd,"of",$fd               ; [$85fb] char
    .byte "fire?",$fe,"I'"                  ; [$8603] char
    .byte "ll",$fd,"teach"                  ; [$860b] char
    .byte $fd,"you",$fe,"for"               ; [$8613] char
    .byte $fd,"3000",$fd,"Go"               ; [$861b] char
    .byte "lds.",$ff                        ; [$8623] char

MESSAGE_DONT_RELY_ON_MAGIC:                 ; [$8628]
    .byte "D"                               ; Message 24
    .byte "on't",$fd,"rel"                  ; [$8629] char
    .byte "y",$fd,"too",$fe,"mu"            ; [$8631] char
    .byte "ch",$fd,"on",$fd,"ma"            ; [$8639] char
    .byte "gic.",$ff                        ; [$8641] char

MESSAGE_MARTIAL_ARTS_200G:                  ; [$8646]
    .byte "D"                               ; Message 25
    .byte "o",$fd,"you",$fd,"wa"            ; [$8647] char
    .byte "nt",$fe,"a",$fd,"mar"            ; [$864f] char
    .byte "tial",$fd,"art"                  ; [$8657] char
    .byte $fe,"lesson",$fe                  ; [$865f] char
    .byte "for",$fd,"200",$fd               ; [$8667] char
    .byte "Golds?",$ff                      ; [$866f] char

MESSAGE_DO_YOU_WANT_TREATMENT:              ; [$8676]
    .byte "D"                               ; Message 26
    .byte "o",$fd,"you",$fd,"wa"            ; [$8677] char
    .byte "nt",$fe,"a",$fd,"tre"            ; [$867f] char
    .byte "atment?",$ff                     ; [$8687] char

MESSAGE_DONT_TRY_TOO_HARD:                  ; [$868f]
    .byte "D"                               ; Message 27
    .byte "on't",$fd,"try"                  ; [$8690] char
    .byte $fe,"too",$fd,"har"               ; [$8698] char
    .byte "d.",$ff                          ; [$86a0] char

MESSAGE_250G_PLEASE:                        ; [$86a3]
    .byte "I"                               ; Message 28
    .byte "t",$fd,"is",$fd,"250"            ; [$86a4] char
    .byte $fd,"Golds",$fe,","               ; [$86ac] char
    .byte "please.",$ff                     ; [$86b4] char

MESSAGE_500G_PLEASE:                        ; [$86bc]
    .byte "I"                               ; Message 29
    .byte "t",$fd,"is",$fd,"500"            ; [$86bd] char
    .byte $fd,"Golds",$fe,","               ; [$86c5] char
    .byte "please.",$ff                     ; [$86cd] char

MESSAGE_1000G_PLEASE:                       ; [$86d5]
    .byte "I"                               ; Message 30
    .byte "t",$fd,"is",$fd,"100"            ; [$86d6] char
    .byte "0",$fd,"Golds,"                  ; [$86de] char
    .byte "please.",$ff                     ; [$86e6] char

MESSAGE_2500G_PLEASE:                       ; [$86ee]
    .byte "I"                               ; Message 31
    .byte "t",$fd,"is",$fd,"250"            ; [$86ef] char
    .byte "0",$fd,"Golds,"                  ; [$86f7] char
    .byte "please.",$ff                     ; [$86ff] char

MESSAGE_1800G_PLEASE:                       ; [$8707]
    .byte "I"                               ; Message 32
    .byte "t",$fd,"is",$fd,"180"            ; [$8708] char
    .byte "0",$fd,"Golds,"                  ; [$8710] char
    .byte "please.",$ff                     ; [$8718] char

MESSAGE_3000G_PLEASE:                       ; [$8720]
    .byte "I"                               ; Message 33
    .byte "t",$fd,"is",$fd,"300"            ; [$8721] char
    .byte "0",$fd,"Golds,"                  ; [$8729] char
    .byte "please.",$ff                     ; [$8731] char

MESSAGE_MEDITATE_WITH_YOU:                  ; [$8739]
    .byte "Y"                               ; Message 34
    .byte "ou",$fd,"need",$fd               ; [$873a] char
    .byte "peace",$fe,"of"                  ; [$8742] char
    .byte $fd,"mind.",$fe,"I"               ; [$874a] char
    .byte $fd,"will",$fd,"me"               ; [$8752] char
    .byte "ditate",$fe,"w"                  ; [$875a] char
    .byte "ith",$fd,"you."                  ; [$8762] char
    .byte $ff                               ; [$876a] char

MESSAGE_NEW_TITLE:                          ; [$876b]
    .byte "I"                               ; Message 36
    .byte $fd,"shall",$fd,"g"               ; [$876c] char
    .byte "ive",$fd,"youa"                  ; [$8774] char
    .byte $fd,"title.",$fe                  ; [$877c] char
    .byte "'",$fb,"'",$fc,"Make"            ; [$8784] char
    .byte $fd,"sure",$fd,"yo"               ; [$878c] char
    .byte "u",$fe,"live",$fd,"u"            ; [$8794] char
    .byte "p",$fd,"to",$fd,"it."            ; [$879c] char
    .byte $ff                               ; [$87a4] char

MESSAGE_REMEMBER_YOUR_MANTRA:               ; [$87a5]
    .byte "D"                               ; Message 36
    .byte "on't",$fd,"hav"                  ; [$87a6] char
    .byte "e",$fe,"negati"                  ; [$87ae] char
    .byte "ve",$fe,"thoug"                  ; [$87b6] char
    .byte "hts.",$fc,"Rem"                  ; [$87be] char
    .byte "ember",$fe,"yo"                  ; [$87c6] char
    .byte "ur",$fd,"mantr"                  ; [$87ce] char
    .byte "a.",$ff                          ; [$87d6] char

MESSAGE_HEAR_AGAIN:                         ; [$87d9]
    .byte "D"                               ; Message 37
    .byte "o",$fd,"you",$fd,"wa"            ; [$87da] char
    .byte "nt",$fe,"to",$fd,"he"            ; [$87e2] char
    .byte "ar",$fd,"it",$fe,"on"            ; [$87ea] char
    .byte "ce",$fd,"more?"                  ; [$87f2] char
    .byte $ff                               ; [$87fa] char

MESSAGE_INTRO:                              ; [$87fb]
    .byte "I"                               ; Message 38
    .byte "'ve",$fd,"been"                  ; [$87fc] char
    .byte $fd,"on",$fe,"a",$fd,"lo"         ; [$8804] char
    .byte "ng",$fd,"journ"                  ; [$880c] char
    .byte "ey.",$fc,"I",$fd,"ca"            ; [$8814] char
    .byte "me",$fd,"back",$fd               ; [$881c] char
    .byte "to",$fe,"my",$fd,"ho"            ; [$8824] char
    .byte "me",$fd,"town",$fe               ; [$882c] char
    .byte "to",$fd,"find",$fd               ; [$8834] char
    .byte "it",$fd,"is",$fe,"al"            ; [$883c] char
    .byte "most",$fd,"des"                  ; [$8844] char
    .byte "erted.",$fc,"T"                  ; [$884c] char
    .byte "he",$fd,"gate",$fd               ; [$8854] char
    .byte "is",$fe,"close"                  ; [$885c] char
    .byte "d,",$fe,"peopl"                  ; [$8864] char
    .byte "e",$fd,"are",$fd,"go"            ; [$886c] char
    .byte "ne,",$fc,"and",$fd               ; [$8874] char
    .byte "the",$fd,"wall"                  ; [$887c] char
    .byte "s",$fe,"are",$fd,"cr"            ; [$8884] char
    .byte "umbling."                        ; [$888c] char
    .byte $fc,"I",$fd,"wonde"               ; [$8894] char
    .byte "r",$fe,"what",$fd,"h"            ; [$889c] char
    .byte "appened."                        ; [$88a4] char
    .byte $ff                               ; [$88ac] char

MESSAGE_GO_SEE_KING:                        ; [$88ad]
    .byte "I"                               ; Message 39
    .byte $fd,"want",$fd,"yo"               ; [$88ae] char
    .byte "u",$fe,"to",$fd,"see"            ; [$88b6] char
    .byte $fd,"the",$fd,"kin"               ; [$88be] char
    .byte "g",$fe,"right",$fd               ; [$88c6] char
    .byte "away",$fc,"alt"                  ; [$88ce] char
    .byte "hough",$fd,"yo"                  ; [$88d6] char
    .byte "u've",$fe,"jus"                  ; [$88de] char
    .byte "t",$fd,"arrive"                  ; [$88e6] char
    .byte "d.",$ff                          ; [$88ee] char

MESSAGE_DIRECTIONS_APOLUNE:                 ; [$88f1]
    .byte "G"                               ; Message 40
    .byte "o",$fd,"straig"                  ; [$88f2] char
    .byte "ht",$fe,"ahead"                  ; [$88fa] char
    .byte $fd,"and",$fd,"you"               ; [$8902] char
    .byte "'llfind",$fd                     ; [$890a] char
    .byte "the",$fd,"town"                  ; [$8912] char
    .byte $fd,"ofApolu"                     ; [$891a] char
    .byte "ne.",$ff                         ; [$8922] char

MESSAGE_MARK_OF_JACK:                       ; [$8926]
    .byte "T"                               ; Message 41
    .byte "here",$fd,"is",$fd               ; [$8927] char
    .byte "a",$fd,"mark",$fe,"o"            ; [$892f] char
    .byte "f",$fd,"\"Jack\""                ; [$8937] char
    .byte $fe,"by",$fd,"the",$fd            ; [$893f] char
    .byte "key",$fd,"hole"                  ; [$8947] char
    .byte ".",$ff                           ; [$894f] char

MESSAGE_THIS_IS_EOLIS:                      ; [$8951]
    .byte "T"                               ; Message 42
    .byte "his",$fd,"is",$fd,"t"            ; [$8952] char
    .byte "he",$fd,"Elf",$fe,"t"            ; [$895a] char
    .byte "own",$fd,"of",$fd,"E"            ; [$8962] char
    .byte "olis.",$fc,"It"                  ; [$896a] char
    .byte $fd,"is",$fd,"loca"               ; [$8972] char
    .byte "ted",$fd,"atth"                  ; [$897a] char
    .byte "e",$fd,"bottom"                  ; [$8982] char
    .byte $fd,"of",$fe,"the",$fd            ; [$898a] char
    .byte "World",$fd,"Tr"                  ; [$8992] char
    .byte "ee",$fc,"and",$fd,"t"            ; [$899a] char
    .byte "he",$fd,"Elves"                  ; [$89a2] char
    .byte $fe,"live",$fd,"he"               ; [$89aa] char
    .byte "re.",$fc,"Go",$fd,"t"            ; [$89b2] char
    .byte "o",$fd,"see",$fd,"th"            ; [$89ba] char
    .byte "e",$fe,"Guru",$fd,"b"            ; [$89c2] char
    .byte "efore",$fd,"yo"                  ; [$89ca] char
    .byte "u",$fe,"see",$fd,"th"            ; [$89d2] char
    .byte "e",$fd,"king.",$ff               ; [$89da] char

MESSAGE_LOOK_FOR_RINGS:                     ; [$89e2]
    .byte "T"                               ; Message 43
    .byte "here",$fd,"are"                  ; [$89e3] char
    .byte $fd,"many",$fe,"ri"               ; [$89eb] char
    .byte "ngs",$fd,"with"                  ; [$89f3] char
    .byte $fe,"differe"                     ; [$89fb] char
    .byte "nt",$fd,"magic"                  ; [$8a03] char
    .byte ".",$fc,"Look",$fd,"f"            ; [$8a0b] char
    .byte "or",$fd,"them",$fe               ; [$8a13] char
    .byte "one",$fd,"by",$fd,"o"            ; [$8a1b] char
    .byte "ne.",$ff                         ; [$8a23] char

MESSAGE_TAKE_RING_TO_KING:                  ; [$8a27]
    .byte "I"                               ; Message 44
    .byte "f",$fd,"you",$fd,"ar"            ; [$8a28] char
    .byte "e",$fd,"goingt"                  ; [$8a30] char
    .byte "o",$fd,"see",$fd,"th"            ; [$8a38] char
    .byte "e",$fd,"king,t"                  ; [$8a40] char
    .byte "ake",$fd,"this"                  ; [$8a48] char
    .byte $fd,"ring.",$fc,"T"               ; [$8a50] char
    .byte "his",$fd,"ring"                  ; [$8a58] char
    .byte $fd,"will",$fe,"id"               ; [$8a60] char
    .byte "entify",$fd,"y"                  ; [$8a68] char
    .byte "ou.",$fe,"Don'"                  ; [$8a70] char
    .byte "t",$fd,"lose",$fd,"i"            ; [$8a78] char
    .byte "t.",$ff                          ; [$8a80] char

MESSAGE_VISIT_GURUS_GET_TITLE:              ; [$8a83]
    .byte "V"                               ; Message 45
    .byte "isit",$fd,"all"                  ; [$8a84] char
    .byte $fd,"Gurus",$fe,"o"               ; [$8a8c] char
    .byte "n",$fd,"your",$fd,"w"            ; [$8a94] char
    .byte "ay.",$fc,"You'"                  ; [$8a9c] char
    .byte "ll",$fd,"get",$fd,"a"            ; [$8aa4] char
    .byte $fe,"title",$fd,"a"               ; [$8aac] char
    .byte "ccording"                        ; [$8ab4] char
    .byte $fe,"to",$fd,"your"               ; [$8abc] char
    .byte $fe,"experie"                     ; [$8ac4] char
    .byte "nce.",$ff                        ; [$8acc] char

MESSAGE_LAST_WELL_ALMOST_DRY:               ; [$8ad1]
    .byte "T"                               ; Message 46
    .byte "he",$fd,"last",$fd               ; [$8ad2] char
    .byte "well",$fd,"isa"                  ; [$8ada] char
    .byte "lmost",$fd,"dr"                  ; [$8ae2] char
    .byte "y.",$ff                          ; [$8aea] char

MESSAGE_THIS_IS_FOREPAW:                    ; [$8aed]
    .byte "T"                               ; Message 47
    .byte "here",$fd,"is",$fe               ; [$8aee] char
    .byte "a",$fd,"founta"                  ; [$8af6] char
    .byte "in",$fe,"in",$fd,"th"            ; [$8afe] char
    .byte "e",$fd,"town",$fd,"o"            ; [$8b06] char
    .byte "f",$fe,"Forepa"                  ; [$8b0e] char
    .byte "w.",$ff                          ; [$8b16] char

MESSAGE_DWARVES_ARE_HERE:                   ; [$8b19]
    .byte "T"                               ; Message 48
    .byte "he",$fd,"Dwarf"                  ; [$8b1a] char
    .byte "s",$fd,"are",$fe,"al"            ; [$8b22] char
    .byte "ready",$fd,"in"                  ; [$8b2a] char
    .byte $fd,"town.It"                     ; [$8b32] char
    .byte $fd,"looks",$fd,"l"               ; [$8b3a] char
    .byte "ike",$fe,"the",$fd               ; [$8b42] char
    .byte "end",$fd,"is",$fd,"n"            ; [$8b4a] char
    .byte "ear.",$ff                        ; [$8b52] char

MESSAGE_DO_YOU_HAVE_WEAPON:                 ; [$8b57]
    .byte "D"                               ; Message 49
    .byte "o",$fd,"you",$fd,"ha"            ; [$8b58] char
    .byte "ve",$fe,"a",$fd,"wea"            ; [$8b60] char
    .byte "pon",$fe,"for",$fd               ; [$8b68] char
    .byte "fighting"                        ; [$8b70] char
    .byte "?",$ff                           ; [$8b78] char

MESSAGE_CANT_LET_YOU_GO:                    ; [$8b7a]
    .byte "I"                               ; Message 50
    .byte $fd,"can't",$fe,"l"               ; [$8b7b] char
    .byte "et",$fd,"you",$fd,"g"            ; [$8b83] char
    .byte "o.",$ff                          ; [$8b8b] char

MESSAGE_KING_IS_WAITING:                    ; [$8b8e]
    .byte "T"                               ; Message 51
    .byte "he",$fd,"King",$fd               ; [$8b8f] char
    .byte "is",$fe,"waiti"                  ; [$8b97] char
    .byte "ng",$fd,"for",$fd,"y"            ; [$8b9f] char
    .byte "ou.",$ff                         ; [$8ba7] char

MESSAGE_GOOD_LUCK:                          ; [$8bab]
    .byte "G"                               ; Message 52
    .byte "ood",$fd,"luck"                  ; [$8bac] char
    .byte "!",$ff                           ; [$8bb4] char

MESSAGE_KING_EXPOSITION:                    ; [$8bb6]
    .byte "G"                               ; Message 53
    .byte "lad",$fd,"you",$fd               ; [$8bb7] char
    .byte "could",$fe,"co"                  ; [$8bbf] char
    .byte "me.",$fe,"Disa"                  ; [$8bc7] char
    .byte "ster",$fd,"has"                  ; [$8bcf] char
    .byte $fe,"befalle"                     ; [$8bd7] char
    .byte "n",$fd,"us.",$fc,"Th"            ; [$8bdf] char
    .byte "e",$fd,"Elf",$fe,"fo"            ; [$8be7] char
    .byte "untain",$fd,"w"                  ; [$8bef] char
    .byte "ater,",$fe,"ou"                  ; [$8bf7] char
    .byte "r",$fd,"life",$fd,"s"            ; [$8bff] char
    .byte "ource,ha"                        ; [$8c07] char
    .byte "s",$fd,"stoppe"                  ; [$8c0f] char
    .byte "d.",$fc,"The",$fd,"w"            ; [$8c17] char
    .byte "ells",$fd,"are"                  ; [$8c1f] char
    .byte $fe,"drying",$fd                  ; [$8c27] char
    .byte "up.",$fc,"Many"                  ; [$8c2f] char
    .byte $fd,"men",$fd,"wen"               ; [$8c37] char
    .byte "t",$fe,"out",$fd,"an"            ; [$8c3f] char
    .byte "d",$fd,"nobody"                  ; [$8c47] char
    .byte $fe,"came",$fd,"ba"               ; [$8c4f] char
    .byte "ck.",$fc,"You",$fd               ; [$8c57] char
    .byte "are",$fd,"our",$fd               ; [$8c5f] char
    .byte "lasthope"                        ; [$8c67] char
    .byte ".",$fe,"I",$fd,"shal"            ; [$8c6f] char
    .byte "l",$fd,"give",$fd,"y"            ; [$8c77] char
    .byte "ou1500",$fd,"G"                  ; [$8c7f] char
    .byte "olds.",$fc,"Pr"                  ; [$8c87] char
    .byte "epare",$fe,"fo"                  ; [$8c8f] char
    .byte "r",$fd,"your",$fd,"j"            ; [$8c97] char
    .byte "ourneywi"                        ; [$8c9f] char
    .byte "th",$fd,"this",$fd               ; [$8ca7] char
    .byte "money.",$fc,"I"                  ; [$8caf] char
    .byte "t",$fd,"will",$fd,"b"            ; [$8cb7] char
    .byte "e",$fd,"a",$fe,"dang"            ; [$8cbf] char
    .byte "erous",$fe,"jo"                  ; [$8cc7] char
    .byte "urney.",$fc,"T"                  ; [$8ccf] char
    .byte "ake",$fd,"care"                  ; [$8cd7] char
    .byte $fe,"of",$fd,"your"               ; [$8cdf] char
    .byte "self.",$ff                       ; [$8ce7] char

MESSAGE_NOTHING_MORE_TO_HELP:               ; [$8ced]
    .byte "T"                               ; Message 54
    .byte "here",$fd,"is",$fd               ; [$8cee] char
    .byte "nothingm"                        ; [$8cf6] char
    .byte "ore",$fd,"I",$fd,"ca"            ; [$8cfe] char
    .byte "n",$fd,"do",$fd,"toh"            ; [$8d06] char
    .byte "elp",$fd,"you."                  ; [$8d0e] char
    .byte $fc,"Looking"                     ; [$8d16] char
    .byte $fd,"forward"                     ; [$8d1e] char
    .byte $fe,"to",$fd,"good"               ; [$8d26] char
    .byte $fd,"news.",$ff                   ; [$8d2e] char

MESSAGE_DWARVES_ROBBING_ELVES:              ; [$8d35]
    .byte "T"                               ; Message 55
    .byte "he",$fd,"Dwarf"                  ; [$8d36] char
    .byte "s",$fe,"are",$fd,"ro"            ; [$8d3e] char
    .byte "bbing",$fe,"th"                  ; [$8d46] char
    .byte "e",$fd,"Elves'"                  ; [$8d4e] char
    .byte $fd,"moneyan"                     ; [$8d56] char
    .byte "d",$fd,"jewelr"                  ; [$8d5e] char
    .byte "y.",$ff                          ; [$8d66] char

MESSAGE_METEORITE_EXPOSITION:               ; [$8d69]
    .byte "A"                               ; Message 56
    .byte $fd,"meteori"                     ; [$8d6a] char
    .byte "te",$fd,"felli"                  ; [$8d72] char
    .byte "nto",$fd,"the",$fd               ; [$8d7a] char
    .byte "World",$fe,"Tr"                  ; [$8d82] char
    .byte "ee",$fd,"and",$fe,"c"            ; [$8d8a] char
    .byte "reated",$fd,"h"                  ; [$8d92] char
    .byte "avoc.",$fc,"At"                  ; [$8d9a] char
    .byte $fd,"the",$fd,"end"               ; [$8da2] char
    .byte $fd,"of",$fe,"the",$fd            ; [$8daa] char
    .byte "confusio"                        ; [$8db2] char
    .byte "n,",$fc,"the",$fd,"D"            ; [$8dba] char
    .byte "warfs",$fd,"of"                  ; [$8dc2] char
    .byte $fe,"the",$fd,"und"               ; [$8dca] char
    .byte "erworld",$fe                     ; [$8dd2] char
    .byte "came",$fd,"up",$fc               ; [$8dda] char
    .byte "and",$fd,"atta"                  ; [$8de2] char
    .byte "cked",$fe,"the"                  ; [$8dea] char
    .byte $fd,"Elves.",$fe                  ; [$8df2] char
    .byte "Nobody",$fd,"k"                  ; [$8dfa] char
    .byte "nows",$fe,"the"                  ; [$8e02] char
    .byte $fd,"reason."                     ; [$8e0a] char
    .byte $ff                               ; [$8e12] char

MESSAGE_LISTEN_TO_PEOPLE:                   ; [$8e13]
    .byte "L"                               ; Message 57
    .byte "isten",$fd,"to"                  ; [$8e14] char
    .byte $fe,"people."                     ; [$8e1c] char
    .byte $fc,"You'll",$fd                  ; [$8e24] char
    .byte "only",$fd,"get"                  ; [$8e2c] char
    .byte $fe,"frustra"                     ; [$8e34] char
    .byte "ted",$fe,"if",$fd,"y"            ; [$8e3c] char
    .byte "ou",$fd,"just",$fd               ; [$8e44] char
    .byte "walkarou"                        ; [$8e4c] char
    .byte "nd.",$ff                         ; [$8e54] char

MESSAGE_DONT_TRY_TOO_HARD_2:                ; [$8e58]
    .byte "D"                               ; Message 58
    .byte "on't",$fd,"try"                  ; [$8e59] char
    .byte $fe,"too",$fd,"har"               ; [$8e61] char
    .byte "d.",$ff                          ; [$8e69] char

MESSAGE_WELCOME_TO_APOLUNE:                 ; [$8e6c]
    .byte "W"                               ; Message 59
    .byte "elcome",$fd,"t"                  ; [$8e6d] char
    .byte "o",$fd,"the",$fe,"to"            ; [$8e75] char
    .byte "wn",$fd,"of",$fd,"Ap"            ; [$8e7d] char
    .byte "olune.",$ff                      ; [$8e85] char

MESSAGE_DIRECTIONS_FOREPAW:                 ; [$8e8c]
    .byte "T"                               ; Message 60
    .byte "here",$fd,"is",$fd               ; [$8e8d] char
    .byte "the",$fe,"town"                  ; [$8e95] char
    .byte $fd,"of",$fd,"Fore"               ; [$8e9d] char
    .byte "paw",$fe,"ahea"                  ; [$8ea5] char
    .byte "d",$fd,"of",$fd,"you"            ; [$8ead] char
    .byte ".",$ff                           ; [$8eb5] char

MESSAGE_DIRECTIONS_TO_TRUNK:                ; [$8eb7]
    .byte "T"                               ; Message 61
    .byte "here",$fd,"are"                  ; [$8eb8] char
    .byte $fd,"Dwarfsa"                     ; [$8ec0] char
    .byte "ll",$fd,"over",$fd               ; [$8ec8] char
    .byte "in",$fd,"the",$fe,"T"            ; [$8ed0] char
    .byte "ower",$fd,"of",$fd               ; [$8ed8] char
    .byte "Trunk.",$fc,"G"                  ; [$8ee0] char
    .byte "o",$fd,"out",$fd,"of"            ; [$8ee8] char
    .byte $fd,"town,",$fe,"t"               ; [$8ef0] char
    .byte "urn",$fd,"righ"                  ; [$8ef8] char
    .byte "t",$fd,"and",$fe,"go"            ; [$8f00] char
    .byte $fd,"straigh"                     ; [$8f08] char
    .byte "t,",$fc,"then",$fd               ; [$8f10] char
    .byte "you'll",$fd,"f"                  ; [$8f18] char
    .byte "indthe",$fd,"T"                  ; [$8f20] char
    .byte "ower",$fe,"of",$fd               ; [$8f28] char
    .byte "Trunk.",$ff                      ; [$8f30] char

MESSAGE_GOOD_LUCK_2:                        ; [$8f37]
    .byte "G"                               ; Message 62
    .byte "ood",$fd,"luck"                  ; [$8f38] char
    .byte ".",$ff                           ; [$8f40] char

MESSAGE_SHOULD_HAVE_SHIELD:                 ; [$8f42]
    .byte "Y"                               ; Message 63
    .byte "ou",$fd,"shoul"                  ; [$8f43] char
    .byte "d",$fd,"have",$fe,"a"            ; [$8f4b] char
    .byte $fd,"shield."                     ; [$8f53] char
    .byte $fd,"It'll",$fe,"p"               ; [$8f5b] char
    .byte "rotect",$fd,"y"                  ; [$8f63] char
    .byte "ou",$fd,"fromD"                  ; [$8f6b] char
    .byte "warf",$fd,"att"                  ; [$8f73] char
    .byte "acks.",$ff                       ; [$8f7b] char

MESSAGE_MATTOCK_IN_TOWER:                   ; [$8f81]
    .byte "T"                               ; Message 64
    .byte "he",$fd,"Matto"                  ; [$8f82] char
    .byte "ck",$fe,"shoul"                  ; [$8f8a] char
    .byte "d",$fd,"be",$fd,"in",$fd         ; [$8f92] char
    .byte "theTower"                        ; [$8f9a] char
    .byte ".",$fc,"You",$fd,"ca"            ; [$8fa2] char
    .byte "n",$fd,"get",$fd,"it"            ; [$8faa] char
    .byte $fe,"by",$fd,"defe"               ; [$8fb2] char
    .byte "ating",$fd,"a",$fe               ; [$8fba] char
    .byte "Dwarf.",$ff                      ; [$8fc2] char

MESSAGE_BLOCKED_PASSAGE:                    ; [$8fc9]
    .byte "W"                               ; Message 65
    .byte "e",$fd,"blocke"                  ; [$8fca] char
    .byte "d",$fd,"the",$fe,"pa"            ; [$8fd2] char
    .byte "ssage",$fd,"to"                  ; [$8fda] char
    .byte $fd,"the",$fe,"nex"               ; [$8fe2] char
    .byte "t",$fd,"town",$fd,"b"            ; [$8fea] char
    .byte "y",$fe,"buildi"                  ; [$8ff2] char
    .byte "ng",$fd,"a",$fd,"wal"            ; [$8ffa] char
    .byte "l,",$fc,"but",$fd,"t"            ; [$9002] char
    .byte "he",$fd,"Dwarf"                  ; [$900a] char
    .byte "s",$fe,"keep",$fd,"c"            ; [$9012] char
    .byte "oming.",$ff                      ; [$901a] char

MESSAGE_MATTOCK_BREAKS_WALL:                ; [$9021]
    .byte "I"                               ; Message 66
    .byte "f",$fd,"you",$fd,"ha"            ; [$9022] char
    .byte "ve",$fd,"the",$fe,"M"            ; [$902a] char
    .byte "attock,y"                        ; [$9032] char
    .byte "ou",$fd,"can",$fe,"b"            ; [$903a] char
    .byte "reak",$fd,"the"                  ; [$9042] char
    .byte $fd,"wall,",$fc,"b"               ; [$904a] char
    .byte "ut",$fd,"if",$fd,"yo"            ; [$9052] char
    .byte "u",$fd,"don'th"                  ; [$905a] char
    .byte "ave",$fd,"it.."                  ; [$9062] char
    .byte ".",$ff                           ; [$906a] char

MESSAGE_YOU_NEED_KEY:                       ; [$906c]
    .byte "Y"                               ; Message 67
    .byte "ou",$fd,"need",$fd               ; [$906d] char
    .byte "a",$fd,"key.",$ff                ; [$9075] char

MESSAGE_YOU_NEED_DIFFERENT_KEY:             ; [$907c]
    .byte "Y"                               ; Message 68
    .byte "ou",$fd,"need",$fd               ; [$907d] char
    .byte "a",$fe,"differ"                  ; [$9085] char
    .byte "ent",$fd,"key."                  ; [$908d] char
    .byte $ff                               ; [$9095] char

MESSAGE_DOCTOR_CAN_HELP:                    ; [$9096]
    .byte "A"                               ; Message 69
    .byte "re",$fd,"you",$fd,"h"            ; [$9097] char
    .byte "urt?",$fe,"Our"                  ; [$909f] char
    .byte $fd,"doctor",$fe                  ; [$90a7] char
    .byte "can",$fd,"help"                  ; [$90af] char
    .byte ".",$ff                           ; [$90b7] char

MESSAGE_POISON_IS_BAD:                      ; [$90b9]
    .byte "W"                               ; Message 70
    .byte "atch",$fd,"out"                  ; [$90ba] char
    .byte $fd,"for",$fe,"the"               ; [$90c2] char
    .byte $fd,"jar",$fd,"of",$fe            ; [$90ca] char
    .byte "poison.",$fc                     ; [$90d2] char
    .byte "The",$fd,"pois"                  ; [$90da] char
    .byte "on",$fd,"will",$fe               ; [$90e2] char
    .byte "take",$fd,"you"                  ; [$90ea] char
    .byte "r",$fd,"energy"                  ; [$90f2] char
    .byte "away.",$ff                       ; [$90fa] char

MESSAGE_LEARN_MANTRAS:                      ; [$9100]
    .byte "D"                               ; Message 71
    .byte "id",$fd,"you",$fd,"l"            ; [$9101] char
    .byte "earn",$fe,"the"                  ; [$9109] char
    .byte $fd,"Guru's",$fe                  ; [$9111] char
    .byte "mantra?",$fc                     ; [$9119] char
    .byte "The",$fd,"mant"                  ; [$9121] char
    .byte "ra",$fd,"will",$fe               ; [$9129] char
    .byte "return",$fd,"y"                  ; [$9131] char
    .byte "ou",$fd,"to",$fe,"th"            ; [$9139] char
    .byte "is",$fd,"world"                  ; [$9141] char
    .byte ".",$fc,"Hold",$fd,"o"            ; [$9149] char
    .byte "n",$fd,"to",$fd,"the"            ; [$9151] char
    .byte $fe,"mantra."                     ; [$9159] char
    .byte $ff                               ; [$9161] char

MESSAGE_SECRET_GURU_IN_TOWER:               ; [$9162]
    .byte "T"                               ; Message 72
    .byte "here",$fd,"is",$fd               ; [$9163] char
    .byte "a",$fe,"secret"                  ; [$916b] char
    .byte $fd,"Guru",$fd,"in"               ; [$9173] char
    .byte $fe,"the",$fd,"Tow"               ; [$917b] char
    .byte "er",$fd,"of",$fe,"Fo"            ; [$9183] char
    .byte "rtress.",$fc                     ; [$918b] char
    .byte "You'll",$fd,"f"                  ; [$9193] char
    .byte "ind",$fe,"impo"                  ; [$919b] char
    .byte "rtant",$fd,"in"                  ; [$91a3] char
    .byte "for-mati"                        ; [$91ab] char
    .byte "on",$fd,"and",$fe,"a"            ; [$91b3] char
    .byte $fd,"key",$fd,"the"               ; [$91bb] char
    .byte "re.",$ff                         ; [$91c3] char

MESSAGE_CARRY_ITEMS:                        ; [$91c7]
    .byte "Y"                               ; Message 73
    .byte "ou",$fd,"can",$fd,"c"            ; [$91c8] char
    .byte "arry",$fd,"8",$fe,"i"            ; [$91d0] char
    .byte "tems.",$fd,"Th"                  ; [$91d8] char
    .byte "ey",$fd,"are",$fe,"a"            ; [$91e0] char
    .byte "ll",$fd,"impor"                  ; [$91e8] char
    .byte "tant.",$fe,"Ch"                  ; [$91f0] char
    .byte "oose",$fd,"wel"                  ; [$91f8] char
    .byte "l.",$ff                          ; [$9200] char

MESSAGE_WELCOME_TO_FOREPAW:                 ; [$9203]
    .byte "T"                               ; Message 74
    .byte "his",$fd,"is",$fd,"t"            ; [$9204] char
    .byte "he",$fd,"towno"                  ; [$920c] char
    .byte "f",$fd,"Forepa"                  ; [$9214] char
    .byte "w.",$ff                          ; [$921c] char

MESSAGE_FOUNTAIN_WILL_FLOW_TO_TOWN:         ; [$921f]
    .byte "I"                               ; Message 75
    .byte "f",$fd,"the",$fd,"fo"            ; [$9220] char
    .byte "untain",$fe,"f"                  ; [$9228] char
    .byte "lows,wat"                        ; [$9230] char
    .byte "er",$fd,"willc"                  ; [$9238] char
    .byte "ome",$fd,"back"                  ; [$9240] char
    .byte $fd,"to",$fd,"thet"               ; [$9248] char
    .byte "own.",$ff                        ; [$9250] char

MESSAGE_FIND_3_SPRINGS:                     ; [$9255]
    .byte "W"                               ; Message 76
    .byte "ater",$fd,"fro"                  ; [$9256] char
    .byte "m",$fd,"3",$fe,"spri"            ; [$925e] char
    .byte "ngs",$fd,"flow"                  ; [$9266] char
    .byte "s",$fe,"into",$fd,"t"            ; [$926e] char
    .byte "he",$fe,"fount"                  ; [$9276] char
    .byte "ain.",$fc,"Fin"                  ; [$927e] char
    .byte "d",$fd,"the",$fd,"3",$fe         ; [$9286] char
    .byte "springs",$fd                     ; [$928e] char
    .byte "and",$fe,"retu"                  ; [$9296] char
    .byte "rn",$fd,"the",$fd,"w"            ; [$929e] char
    .byte "aterto",$fd,"t"                  ; [$92a6] char
    .byte "he",$fd,"fount"                  ; [$92ae] char
    .byte "ain.",$ff                        ; [$92b6] char

MESSAGE_WATER_IS_FLOWING:                   ; [$92bb]
    .byte "W"                               ; Message 77
    .byte "ater",$fd,"is",$fd               ; [$92bc] char
    .byte "flowingi"                        ; [$92c4] char
    .byte "n",$fd,"our",$fd,"fo"            ; [$92cc] char
    .byte "untain.T"                        ; [$92d4] char
    .byte "hanks",$fd,"to"                  ; [$92dc] char
    .byte $fe,"your",$fd,"he"               ; [$92e4] char
    .byte "lp.",$ff                         ; [$92ec] char

MESSAGE_FOUNTAIN_IN_SKY:                    ; [$92f0]
    .byte "I"                               ; Message 78
    .byte $fd,"hear",$fe,"qu"               ; [$92f1] char
    .byte "ite",$fd,"ofte"                  ; [$92f9] char
    .byte "n",$fe,"about",$fd               ; [$9301] char
    .byte "a",$fd,"founta"                  ; [$9309] char
    .byte "inin",$fd,"the"                  ; [$9311] char
    .byte $fd,"sky.",$fc,"Wh"               ; [$9319] char
    .byte "en",$fd,"you",$fd,"g"            ; [$9321] char
    .byte "o",$fd,"downfr"                  ; [$9329] char
    .byte "om",$fd,"the",$fd,"t"            ; [$9331] char
    .byte "own,",$fc,"you"                  ; [$9339] char
    .byte "'ll",$fd,"come"                  ; [$9341] char
    .byte $fd,"to",$fd,"apla"               ; [$9349] char
    .byte "ce",$fd,"where"                  ; [$9351] char
    .byte $fd,"the",$fe,"sky"               ; [$9359] char
    .byte $fd,"opens",$fd,"a"               ; [$9361] char
    .byte "bove.",$fc,"Th"                  ; [$9369] char
    .byte "ey",$fd,"say",$fd,"a"            ; [$9371] char
    .byte $fe,"fountai"                     ; [$9379] char
    .byte "n",$fd,"is",$fd,"up",$fe         ; [$9381] char
    .byte "in",$fd,"the",$fd,"s"            ; [$9389] char
    .byte "ky,",$fc,"but",$fd               ; [$9391] char
    .byte "you",$fd,"need"                  ; [$9399] char
    .byte $fe,"Wing",$fd,"Bo"               ; [$93a1] char
    .byte "ots...",$ff                      ; [$93a9] char

MESSAGE_PUSH_FOUNTAIN_ROCK:                 ; [$93b0]
    .byte "I"                               ; Message 79
    .byte "f",$fd,"you",$fd,"ca"            ; [$93b1] char
    .byte "n",$fd,"push",$fe,"t"            ; [$93b9] char
    .byte "he",$fd,"rock",$fd               ; [$93c1] char
    .byte "away",$fe,"fro"                  ; [$93c9] char
    .byte "m",$fd,"the",$fe,"fo"            ; [$93d1] char
    .byte "untain,",$fc                     ; [$93d9] char
    .byte "you'll",$fd,"f"                  ; [$93e1] char
    .byte "ind",$fd,"the",$fe               ; [$93e9] char
    .byte "way",$fd,"to",$fd,"M"            ; [$93f1] char
    .byte "ascon.",$fc,"B"                  ; [$93f9] char
    .byte "ut,",$fd,"you",$fd               ; [$9401] char
    .byte "can't",$fe,"mo"                  ; [$9409] char
    .byte "ve",$fd,"it",$fd,"wi"            ; [$9411] char
    .byte "thout",$fe,"th"                  ; [$9419] char
    .byte "e",$fd,"Ring",$fd,"o"            ; [$9421] char
    .byte "f",$fe,"Ruby.",$fc               ; [$9429] char
    .byte "The",$fd,"old",$fd               ; [$9431] char
    .byte "man",$fd,"of",$fe,"t"            ; [$9439] char
    .byte "he",$fd,"sprin"                  ; [$9441] char
    .byte "g",$fd,"will",$fe,"h"            ; [$9449] char
    .byte "ave",$fd,"it.",$fe               ; [$9451] char
    .byte "Ask",$fd,"him."                  ; [$9459] char
    .byte $ff                               ; [$9461] char

MESSAGE_SPRING_IN_TOWER:                    ; [$9462]
    .byte "T"                               ; Message 80
    .byte "here",$fd,"is",$fd               ; [$9463] char
    .byte "a",$fe,"spring"                  ; [$946b] char
    .byte $fe,"in",$fd,"the",$fd            ; [$9473] char
    .byte "tower",$fd,"of"                  ; [$947b] char
    .byte $fe,"Fortres"                     ; [$9483] char
    .byte "s.",$fc,"You'l"                  ; [$948b] char
    .byte "l",$fd,"find",$fd,"t"            ; [$9493] char
    .byte "he",$fe,"dried"                  ; [$949b] char
    .byte $fd,"up",$fe,"foun"               ; [$94a3] char
    .byte "tain",$fc,"and"                  ; [$94ab] char
    .byte $fd,"the",$fd,"ent"               ; [$94b3] char
    .byte "ranceto",$fd                     ; [$94bb] char
    .byte "the",$fd,"towe"                  ; [$94c3] char
    .byte "r",$fe,"right",$fd               ; [$94cb] char
    .byte "above",$fe,"th"                  ; [$94d3] char
    .byte "is",$fd,"town."                  ; [$94db] char
    .byte $fc,"So",$fd,"long"               ; [$94e3] char
    .byte ".",$ff                           ; [$94eb] char

MESSAGE_WINGBOOTS_IN_TOWER:                 ; [$94ed]
    .byte "T"                               ; Message 81
    .byte "he",$fd,"Dwarf"                  ; [$94ee] char
    .byte $fe,"who",$fd,"liv"               ; [$94f6] char
    .byte "es",$fe,"in",$fd,"th"            ; [$94fe] char
    .byte "e",$fd,"tower",$fe               ; [$9506] char
    .byte "has",$fd,"Wing"                  ; [$950e] char
    .byte $fd,"boots.",$fc                  ; [$9516] char
    .byte "When",$fd,"you"                  ; [$951e] char
    .byte $fd,"get",$fe,"the"               ; [$9526] char
    .byte "m,",$fd,"look",$fd               ; [$952e] char
    .byte "for",$fe,"a",$fd,"fo"            ; [$9536] char
    .byte "untain",$fe,"i"                  ; [$953e] char
    .byte "n",$fd,"the",$fd,"sk"            ; [$9546] char
    .byte "y.",$ff                          ; [$954e] char

MESSAGE_DIRECTIONS_TO_MASCON:               ; [$9551]
    .byte "W"                               ; Message 82
    .byte "hen",$fd,"you",$fd               ; [$9552] char
    .byte "push",$fe,"the"                  ; [$955a] char
    .byte $fd,"rock",$fe,"aw"               ; [$9562] char
    .byte "ay",$fd,"from",$fd               ; [$956a] char
    .byte "the",$fe,"foun"                  ; [$9572] char
    .byte "tain,",$fc,"yo"                  ; [$957a] char
    .byte "u'll",$fd,"fin"                  ; [$9582] char
    .byte "d",$fe,"the",$fd,"pa"            ; [$958a] char
    .byte "ssage",$fe,"to"                  ; [$9592] char
    .byte $fd,"Mascon,"                     ; [$959a] char
    .byte $fc,"but",$fd,"you"               ; [$95a2] char
    .byte $fd,"need",$fe,"th"               ; [$95aa] char
    .byte "e",$fd,"Ring",$fe,"o"            ; [$95b2] char
    .byte "f",$fd,"Ruby.",$ff               ; [$95ba] char

MESSAGE_LOOK_FOR_WINGBOOTS:                 ; [$95c2]
    .byte "L"                               ; Message 83
    .byte "ook",$fd,"for",$fe               ; [$95c3] char
    .byte "Wing",$fd,"Boo"                  ; [$95cb] char
    .byte "ts.",$ff                         ; [$95d3] char

MESSAGE_FOUNTAIN_IN_SKY_HINT:               ; [$95d7]
    .byte "G"                               ; Message 84
    .byte "o",$fd,"below",$fd               ; [$95d8] char
    .byte "the",$fe,"blue"                  ; [$95e0] char
    .byte $fd,"sky.",$fd,"Yo"               ; [$95e8] char
    .byte "u'llfind"                        ; [$95f0] char
    .byte $fd,"a",$fd,"fount"               ; [$95f8] char
    .byte "ain",$fe,"in",$fd,"t"            ; [$9600] char
    .byte "he",$fd,"sky.",$ff               ; [$9608] char

MESSAGE_USE_THIS_KEY_FOR_FIRST_SPRING:      ; [$9610]
    .byte "U"                               ; Message 85
    .byte "se",$fd,"this",$fd               ; [$9611] char
    .byte "key",$fe,"to",$fd,"o"            ; [$9619] char
    .byte "pen",$fd,"the",$fd               ; [$9621] char
    .byte "doorbelo"                        ; [$9629] char
    .byte "w.",$fc,"You'l"                  ; [$9631] char
    .byte "l",$fd,"find",$fd,"t"            ; [$9639] char
    .byte "he",$fe,"first"                  ; [$9641] char
    .byte $fd,"spring."                     ; [$9649] char
    .byte $ff                               ; [$9651] char

MESSAGE_GET_JOKER_OR_COME_BACK:             ; [$9652]
    .byte "I"                               ; Message 86
    .byte "f",$fd,"you",$fd,"do"            ; [$9653] char
    .byte "n't",$fe,"have"                  ; [$965b] char
    .byte $fd,"a",$fd,"Joker"               ; [$9663] char
    .byte $fe,"key,",$fe,"co"               ; [$966b] char
    .byte "me",$fd,"back",$fd               ; [$9673] char
    .byte "again.",$ff                      ; [$967b] char

MESSAGE_HO_HO_HO_ZZZ:                       ; [$9682]
    .byte "H"                               ; Message 87
    .byte "o,",$fd,"ho,",$fd,"h"            ; [$9683] char
    .byte "o.",$fe,"I'll",$fd               ; [$968b] char
    .byte "tell",$fd,"you"                  ; [$9693] char
    .byte $fe,"about",$fd,"t"               ; [$969b] char
    .byte "he",$fd,"water"                  ; [$96a3] char
    .byte $fe,"of",$fd,"the",$fd            ; [$96ab] char
    .byte "spring.",$fc                     ; [$96b3] char
    .byte ".....",$fe,".."                  ; [$96bb] char
    .byte "...",$fe,"Oops"                  ; [$96c3] char
    .byte "!",$fe,"..fall"                  ; [$96cb] char
    .byte "en",$fd,"aslee"                  ; [$96d3] char
    .byte "p.",$fc,"The",$fd,"w"            ; [$96db] char
    .byte "ater",$fd,"was"                  ; [$96e3] char
    .byte $fe,"poisone"                     ; [$96eb] char
    .byte "d.",$fc,"The",$fd,"p"            ; [$96f3] char
    .byte "osion",$fd,"is"                  ; [$96fb] char
    .byte $fe,"almost",$fd                  ; [$9703] char
    .byte "gone",$fd,"so",$fe               ; [$970b] char
    .byte "it's",$fd,"all"                  ; [$9713] char
    .byte $fd,"right",$fe,"t"               ; [$971b] char
    .byte "o",$fd,"wake",$fd,"h"            ; [$9723] char
    .byte "im",$fd,"up.",$fc,"W"            ; [$972b] char
    .byte "atch.",$fe,".."                  ; [$9733] char
    .byte "...",$fd,"...."                  ; [$973b] char
    .byte ".",$fe,"Someth"                  ; [$9743] char
    .byte "ing",$fd,"is",$fe,"w"            ; [$974b] char
    .byte "rong...",$fc                     ; [$9753] char
    .byte "Oops!",$ff                       ; [$975b] char

MESSAGE_GET_KEY_FIND_FOUNTAIN:              ; [$9761]
    .byte "G"                               ; Message 88
    .byte "et",$fd,"the",$fd,"k"            ; [$9762] char
    .byte "ey",$fd,"fromt"                  ; [$976a] char
    .byte "he",$fd,"Guri",$fd               ; [$9772] char
    .byte "in",$fd,"the",$fe,"t"            ; [$977a] char
    .byte "ower",$fd,"of",$fe               ; [$9782] char
    .byte "Fortress"                        ; [$978a] char
    .byte $fd,"and",$fc,"sea"               ; [$9792] char
    .byte "rch",$fd,"for",$fd               ; [$979a] char
    .byte "the",$fe,"undi"                  ; [$97a2] char
    .byte "scovered"                        ; [$97aa] char
    .byte $fe,"first",$fd,"f"               ; [$97b2] char
    .byte "ountain."                        ; [$97ba] char
    .byte $ff                               ; [$97c2] char

MESSAGE_THIS_IS_SPRING_OF_TRUNK_GET_ELIXIR: ; [$97c3]
    .byte "Y"                               ; Message 89
    .byte "ou've",$fd,"do"                  ; [$97c4] char
    .byte "ne",$fd,"wellt"                  ; [$97cc] char
    .byte "o",$fd,"get",$fd,"he"            ; [$97d4] char
    .byte "re.",$fe,"This"                  ; [$97dc] char
    .byte $fd,"is",$fd,"the",$fe            ; [$97e4] char
    .byte "spring",$fd,"o"                  ; [$97ec] char
    .byte "f",$fd,"Trunk."                  ; [$97f4] char
    .byte $fc,"You",$fd,"nee"               ; [$97fc] char
    .byte "d",$fd,"Elixir"                  ; [$9804] char
    .byte $fe,"to",$fd,"revi"               ; [$980c] char
    .byte "ve",$fd,"the",$fe,"s"            ; [$9814] char
    .byte "pring.",$fc,"W"                  ; [$981c] char
    .byte "ill",$fd,"you",$fd               ; [$9824] char
    .byte "give",$fd,"mey"                  ; [$982c] char
    .byte "our",$fd,"medi"                  ; [$9834] char
    .byte "cine?",$ff                       ; [$983c] char

MESSAGE_2_MORE_SPRINGS:                     ; [$9842]
    .byte "T"                               ; Message 90
    .byte "his",$fd,"spri"                  ; [$9843] char
    .byte "ng",$fd,"willf"                  ; [$984b] char
    .byte "low",$fd,"agai"                  ; [$9853] char
    .byte "n.",$fe,"There"                  ; [$985b] char
    .byte $fd,"are",$fe,"two"               ; [$9863] char
    .byte $fd,"more.",$fc,"Y"               ; [$986b] char
    .byte "ou'd",$fd,"bet"                  ; [$9873] char
    .byte "ter",$fd,"go",$fe,"a"            ; [$987b] char
    .byte "nd",$fd,"find",$fd               ; [$9883] char
    .byte "them.",$ff                       ; [$988b] char

MESSAGE_COME_BACK_WITH_MEDICINE:            ; [$9891]
    .byte "C"                               ; Message 91
    .byte "ome",$fd,"back"                  ; [$9892] char
    .byte $fd,"with",$fe,"th"               ; [$989a] char
    .byte "e",$fd,"medici"                  ; [$98a2] char
    .byte "ne.",$ff                         ; [$98aa] char

MESSAGE_FIND_POISON_IN_MASCON:              ; [$98ae]
    .byte "A"                               ; Message 92
    .byte "s",$fd,"soon",$fd,"a"            ; [$98af] char
    .byte "s",$fd,"waterf"                  ; [$98b7] char
    .byte "lows",$fd,"in",$fd               ; [$98bf] char
    .byte "the",$fe,"foun"                  ; [$98c7] char
    .byte "tain,",$fc,"go"                  ; [$98cf] char
    .byte $fd,"to",$fd,"Masc"               ; [$98d7] char
    .byte "on",$fd,"andfi"                  ; [$98df] char
    .byte "nd",$fd,"the",$fd,"p"            ; [$98e7] char
    .byte "oison",$fe,"th"                  ; [$98ef] char
    .byte "e",$fd,"Dwarfs"                  ; [$98f7] char
    .byte $fd,"hide,",$fc,"o"               ; [$98ff] char
    .byte "therwise"                        ; [$9907] char
    .byte $fd,"the",$fe,"Elv"               ; [$990f] char
    .byte "es",$fd,"will",$fd               ; [$9917] char
    .byte "be",$fe,"destr"                  ; [$991f] char
    .byte "oyed.",$ff                       ; [$9927] char

MESSAGE_WILL_REVIVE_SPRING:                 ; [$992d]
    .byte "T"                               ; Message 93
    .byte "hank",$fd,"you"                  ; [$992e] char
    .byte $fd,"for",$fe,"com"               ; [$9936] char
    .byte "ing.",$fc,"I",$fd,"w"            ; [$993e] char
    .byte "ill",$fd,"revi"                  ; [$9946] char
    .byte "ve",$fe,"the",$fd,"s"            ; [$994e] char
    .byte "pring",$fe,"ri"                  ; [$9956] char
    .byte "ght",$fd,"away"                  ; [$995e] char
    .byte ".",$ff                           ; [$9966] char

MESSAGE_GIVING_RING_OF_RUBY:                ; [$9968]
    .byte "I"                               ; Message 94
    .byte "'ll",$fd,"give"                  ; [$9969] char
    .byte $fd,"you",$fe,"the"               ; [$9971] char
    .byte $fd,"Ring",$fd,"of"               ; [$9979] char
    .byte $fe,"Ruby.",$fc,"N"               ; [$9981] char
    .byte "ow,",$fd,"push"                  ; [$9989] char
    .byte $fd,"the",$fe,"roc"               ; [$9991] char
    .byte "k",$fd,"away",$fd,"f"            ; [$9999] char
    .byte "rom",$fe,"the",$fd               ; [$99a1] char
    .byte "fountain"                        ; [$99a9] char
    .byte ".",$ff                           ; [$99b1] char

MESSAGE_TRUST_YOUR_POWER:                   ; [$99b3]
    .byte "T"                               ; Message 95
    .byte "rust",$fe,"you"                  ; [$99b4] char
    .byte "r",$fd,"power."                  ; [$99bc] char
    .byte $fc,"You",$fd,"are"               ; [$99c4] char
    .byte $fd,"the",$fe,"cho"               ; [$99cc] char
    .byte "sen",$fd,"warr"                  ; [$99d4] char
    .byte "ior",$fe,"to",$fd,"r"            ; [$99dc] char
    .byte "escue",$fe,"th"                  ; [$99e4] char
    .byte "is",$fd,"world"                  ; [$99ec] char
    .byte ".",$ff                           ; [$99f4] char

MESSAGE_WELCOME_TO_MASCON:                  ; [$99f6]
    .byte "W"                               ; Message 96
    .byte "hat",$fd,"busi"                  ; [$99f7] char
    .byte "ness",$fd,"doy"                  ; [$99ff] char
    .byte "ou",$fd,"have",$fd               ; [$9a07] char
    .byte "here?",$fc,"Th"                  ; [$9a0f] char
    .byte "is",$fd,"is",$fd,"th"            ; [$9a17] char
    .byte "e",$fe,"misty",$fd               ; [$9a1f] char
    .byte "town",$fd,"of",$fe               ; [$9a27] char
    .byte "Mascon.",$ff                     ; [$9a2f] char

MESSAGE_PREPARE_BEFORE_FOREPAW:             ; [$9a37]
    .byte "T"                               ; Message 97
    .byte "he",$fd,"tower"                  ; [$9a38] char
    .byte $fd,"of",$fe,"Fore"               ; [$9a40] char
    .byte "paw",$fd,"is",$fd,"s"            ; [$9a48] char
    .byte "tillfar",$fd                     ; [$9a50] char
    .byte "away.",$fc,"Pr"                  ; [$9a58] char
    .byte "epare",$fd,"we"                  ; [$9a60] char
    .byte "ll",$fe,"and",$fd,"g"            ; [$9a68] char
    .byte "o.",$ff                          ; [$9a70] char

MESSAGE_METEORITE_BECOMES_POISON:           ; [$9a73]
    .byte "W"                               ; Message 98
    .byte "hen",$fd,"the",$fd               ; [$9a74] char
    .byte "meteor-i"                        ; [$9a7c] char
    .byte "te",$fd,"is",$fd,"di"            ; [$9a84] char
    .byte "ssolvedi"                        ; [$9a8c] char
    .byte "n",$fd,"water,"                  ; [$9a94] char
    .byte $fc,"it",$fd,"beco"               ; [$9a9c] char
    .byte "mes",$fe,"pois"                  ; [$9aa4] char
    .byte "on",$fd,"which"                  ; [$9aac] char
    .byte $fe,"will",$fd,"br"               ; [$9ab4] char
    .byte "ing",$fe,"sick"                  ; [$9abc] char
    .byte "ness.",$fc,"It"                  ; [$9ac4] char
    .byte $fd,"started"                     ; [$9acc] char
    .byte $fd,"when",$fe,"th"               ; [$9ad4] char
    .byte "e",$fd,"Dwarfs"                  ; [$9adc] char
    .byte $fe,"brought"                     ; [$9ae4] char
    .byte $fd,"it",$fd,"into"               ; [$9aec] char
    .byte $fe,"the",$fd,"Wor"               ; [$9af4] char
    .byte "ld",$fd,"Tree."                  ; [$9afc] char
    .byte $ff                               ; [$9b04] char

MESSAGE_DID_YOU_GET_PENDANT:                ; [$9b05]
    .byte "D"                               ; Message 99
    .byte "id",$fd,"you",$fd,"g"            ; [$9b06] char
    .byte "et",$fd,"the",$fe,"p"            ; [$9b0e] char
    .byte "endant?",$fd                     ; [$9b16] char
    .byte "It",$fd,"wills"                  ; [$9b1e] char
    .byte "trengthe"                        ; [$9b26] char
    .byte "n",$fd,"your",$fe,"o"            ; [$9b2e] char
    .byte "ffense",$fd,"p"                  ; [$9b36] char
    .byte "ower.",$ff                       ; [$9b3e] char

MESSAGE_STORES_OUTSIDE_TOWN:                ; [$9b44]
    .byte "T"                               ; Message 100
    .byte "here",$fd,"are"                  ; [$9b45] char
    .byte $fd,"storeso"                     ; [$9b4d] char
    .byte "utside",$fd,"t"                  ; [$9b55] char
    .byte "own.",$fc,"The"                  ; [$9b5d] char
    .byte "y",$fd,"sell",$fd,"u"            ; [$9b65] char
    .byte "sefulite"                        ; [$9b6d] char
    .byte "ms,",$fc,"thou"                  ; [$9b75] char
    .byte "gh",$fd,"it's",$fe               ; [$9b7d] char
    .byte "inconven"                        ; [$9b85] char
    .byte "ient",$fd,"to",$fe               ; [$9b8d] char
    .byte "get",$fd,"ther"                  ; [$9b95] char
    .byte "e.",$fc,"I",$fd,"won"            ; [$9b9d] char
    .byte "der",$fd,"if",$fd,"y"            ; [$9ba5] char
    .byte "ou",$fe,"could"                  ; [$9bad] char
    .byte $fd,"find",$fd,"th"               ; [$9bb5] char
    .byte "em.Look",$fd                     ; [$9bbd] char
    .byte "up",$fd,"while"                  ; [$9bc5] char
    .byte $fe,"you",$fd,"wal"               ; [$9bcd] char
    .byte "k.",$ff                          ; [$9bd5] char

MESSAGE_THIS_IS_LARGE_SHIELD:               ; [$9bd8]
    .byte "I"                               ; Message 101
    .byte "t",$fd,"is",$fd,"a",$fd,"l"      ; [$9bd9] char
    .byte "arge",$fe,"and"                  ; [$9be1] char
    .byte $fd,"beautif"                     ; [$9be9] char
    .byte "ul",$fe,"shiel"                  ; [$9bf1] char
    .byte "d.",$ff                          ; [$9bf9] char

MESSAGE_DIRECTIONS_TO_SUFFER:               ; [$9bfc]
    .byte "T"                               ; Message 102
    .byte "he",$fd,"meteo"                  ; [$9bfd] char
    .byte "rite",$fd,"ism"                  ; [$9c05] char
    .byte "editated"                        ; [$9c0d] char
    .byte $fd,"on",$fe,"at",$fd,"t"         ; [$9c15] char
    .byte "he",$fd,"tower"                  ; [$9c1d] char
    .byte $fd,"of",$fe,"Suff"               ; [$9c25] char
    .byte "er.",$fc,"You'"                  ; [$9c2d] char
    .byte "ll",$fd,"find",$fd               ; [$9c35] char
    .byte "the",$fe,"Towe"                  ; [$9c3d] char
    .byte "r",$fd,"above",$fd               ; [$9c45] char
    .byte "a",$fe,"Guru.",$fe               ; [$9c4d] char
    .byte "Be",$fd,"caref"                  ; [$9c55] char
    .byte "ul.",$ff                         ; [$9c5d] char

MESSAGE_NEED_WING_BOOTS_FOR_MIST:           ; [$9c61]
    .byte "Y"                               ; Message 103
    .byte "ou",$fd,"need",$fd               ; [$9c62] char
    .byte "Wing",$fe,"Boo"                  ; [$9c6a] char
    .byte "ts",$fc,"in",$fd,"or"            ; [$9c72] char
    .byte "der",$fd,"to",$fd,"g"            ; [$9c7a] char
    .byte "et",$fe,"to",$fd,"th"            ; [$9c82] char
    .byte "e",$fd,"misty",$fe               ; [$9c8a] char
    .byte "town",$fd,"of",$fd               ; [$9c92] char
    .byte "Victim.",$fc                     ; [$9c9a] char
    .byte "Look",$fd,"for"                  ; [$9ca2] char
    .byte $fd,"them",$fd,"in"               ; [$9caa] char
    .byte "the",$fd,"Towe"                  ; [$9cb2] char
    .byte "r",$fd,"of",$fe,"Suf"            ; [$9cba] char
    .byte "fer.",$ff                        ; [$9cc2] char

MESSAGE_WELCOME_TO_MIST:                    ; [$9cc7]
    .byte "T"                               ; Message 104
    .byte "his",$fd,"town"                  ; [$9cc8] char
    .byte $fd,"has",$fe,"bee"               ; [$9cd0] char
    .byte "n",$fd,"covere"                  ; [$9cd8] char
    .byte "d",$fe,"with",$fd,"a"            ; [$9ce0] char
    .byte $fd,"mist",$fd,"ev"               ; [$9ce8] char
    .byte "er",$fc,"since"                  ; [$9cf0] char
    .byte $fd,"the",$fd,"met"               ; [$9cf8] char
    .byte "e-",$fe,"orite"                  ; [$9d00] char
    .byte $fd,"hit",$fd,"the"               ; [$9d08] char
    .byte $fe,"town.",$fc,"S"               ; [$9d10] char
    .byte "ome",$fd,"area"                  ; [$9d18] char
    .byte "s",$fe,"might",$fd               ; [$9d20] char
    .byte "still",$fe,"be"                  ; [$9d28] char
    .byte $fd,"burning"                     ; [$9d30] char
    .byte ".",$ff                           ; [$9d38] char

MESSAGE_HOUSE_OUTSIDE_ABANDONED:            ; [$9d3a]
    .byte "T"                               ; Message 105
    .byte "he",$fd,"house"                  ; [$9d3b] char
    .byte $fe,"outside"                     ; [$9d43] char
    .byte $fd,"town",$fd,"wa"               ; [$9d4b] char
    .byte "sabandon"                        ; [$9d53] char
    .byte "ed",$fc,"and",$fd,"t"            ; [$9d5b] char
    .byte "he",$fd,"Dwarf"                  ; [$9d63] char
    .byte "s",$fe,"are",$fd,"li"            ; [$9d6b] char
    .byte "ving",$fe,"the"                  ; [$9d73] char
    .byte "re.",$fc,"Watc"                  ; [$9d7b] char
    .byte "h",$fd,"out",$fd,"fo"            ; [$9d83] char
    .byte "r",$fe,"them.",$ff               ; [$9d8b] char

MESSAGE_TOWER_OF_SUFFER_SOON:               ; [$9d93]
    .byte "Y"                               ; Message 106
    .byte "ou'll",$fd,"ge"                  ; [$9d94] char
    .byte "t",$fd,"to",$fe,"the"            ; [$9d9c] char
    .byte $fd,"Tower",$fd,"o"               ; [$9da4] char
    .byte "f",$fe,"Suffer"                  ; [$9dac] char
    .byte $fd,"soon.",$ff                   ; [$9db4] char

MESSAGE_KEEP_PENDANT:                       ; [$9dbb]
    .byte "T"                               ; Message 107
    .byte "he",$fd,"penda"                  ; [$9dbc] char
    .byte "nt",$fd,"has",$fe,"b"            ; [$9dc4] char
    .byte "een",$fd,"a",$fd,"tr"            ; [$9dcc] char
    .byte "easure",$fe,"o"                  ; [$9dd4] char
    .byte "f",$fd,"the",$fd,"to"            ; [$9ddc] char
    .byte "wn.",$fc,"But",$fd               ; [$9de4] char
    .byte "it",$fd,"is",$fd,"be"            ; [$9dec] char
    .byte "st",$fe,"for",$fd,"t"            ; [$9df4] char
    .byte "he",$fd,"town",$fd               ; [$9dfc] char
    .byte "if",$fe,"you",$fd,"k"            ; [$9e04] char
    .byte "eep",$fd,"it.",$ff               ; [$9e0c] char

MESSAGE_DWARVES_CHANTING:                   ; [$9e14]
    .byte "T"                               ; Message 108
    .byte "he",$fd,"Dwarf"                  ; [$9e15] char
    .byte "s",$fd,"are",$fe,"ch"            ; [$9e1d] char
    .byte "anting",$fd,"t"                  ; [$9e25] char
    .byte "heir",$fe,"man"                  ; [$9e2d] char
    .byte "tras",$fc,"to",$fd               ; [$9e35] char
    .byte "a",$fd,"segmen"                  ; [$9e3d] char
    .byte "t",$fd,"of",$fe,"the"            ; [$9e45] char
    .byte $fd,"meteori"                     ; [$9e4d] char
    .byte "te.",$fc,"They"                  ; [$9e55] char
    .byte $fd,"believe"                     ; [$9e5d] char
    .byte $fd,"it",$fe,"has",$fd            ; [$9e65] char
    .byte "special",$fe                     ; [$9e6d] char
    .byte "cosmic",$fd,"p"                  ; [$9e75] char
    .byte "ower.",$ff                       ; [$9e7d] char

MESSAGE_METEORITE_WAS_MOVED:                ; [$9e83]
    .byte "T"                               ; Message 109
    .byte "he",$fd,"meteo"                  ; [$9e84] char
    .byte "rite",$fe,"whi"                  ; [$9e8c] char
    .byte "ch",$fd,"was",$fd,"i"            ; [$9e94] char
    .byte "n",$fd,"theTow"                  ; [$9e9c] char
    .byte "er",$fd,"of",$fd,"Su"            ; [$9ea4] char
    .byte "ffer",$fc,"has"                  ; [$9eac] char
    .byte $fd,"been",$fd,"mo"               ; [$9eb4] char
    .byte "ved",$fe,"to",$fd,"t"            ; [$9ebc] char
    .byte "he",$fd,"Tower"                  ; [$9ec4] char
    .byte $fd,"of",$fe,"Mist"               ; [$9ecc] char
    .byte ".",$fc,"The",$fd,"Dw"            ; [$9ed4] char
    .byte "arfs",$fd,"mus"                  ; [$9edc] char
    .byte "t",$fe,"have",$fd,"l"            ; [$9ee4] char
    .byte "earned",$fd,"o"                  ; [$9eec] char
    .byte "f",$fe,"your",$fd,"c"            ; [$9ef4] char
    .byte "oming.",$ff                      ; [$9efc] char

MESSAGE_HOUR_GLASS:                         ; [$9f03]
    .byte "T"                               ; Message 110
    .byte "hey",$fd,"say",$fd               ; [$9f04] char
    .byte "the",$fe,"Hour"                  ; [$9f0c] char
    .byte $fd,"Glass",$fd,"w"               ; [$9f14] char
    .byte "ill",$fe,"enab"                  ; [$9f1c] char
    .byte "le",$fd,"you",$fc,"t"            ; [$9f24] char
    .byte "o",$fd,"move",$fd,"a"            ; [$9f2c] char
    .byte "round",$fe,"wh"                  ; [$9f34] char
    .byte "ile",$fd,"the",$fd               ; [$9f3c] char
    .byte "time",$fe,"sto"                  ; [$9f44] char
    .byte "ps.",$ff                         ; [$9f4c] char

MESSAGE_HOUR_GLASS_USES_ENERGY:             ; [$9f50]
    .byte "T"                               ; Message 111
    .byte "he",$fd,"Hour",$fd               ; [$9f51] char
    .byte "Glass",$fe,"wi"                  ; [$9f59] char
    .byte "ll",$fd,"exhau"                  ; [$9f61] char
    .byte "st",$fe,"your",$fd               ; [$9f69] char
    .byte "energy,",$fc                     ; [$9f71] char
    .byte "so",$fd,"be",$fd,"ca"            ; [$9f79] char
    .byte "reful",$fe,"wh"                  ; [$9f81] char
    .byte "en",$fd,"you",$fd,"u"            ; [$9f89] char
    .byte "se",$fd,"it.",$ff                ; [$9f91] char

MESSAGE_WELCOME_TO_VICTIM:                  ; [$9f98]
    .byte "W"                               ; Message 112
    .byte "elcome",$fd,"t"                  ; [$9f99] char
    .byte "o",$fd,"the",$fe,"To"            ; [$9fa1] char
    .byte "wn",$fd,"of",$fd,"Vi"            ; [$9fa9] char
    .byte "ctim.",$fc,"I",$fd               ; [$9fb1] char
    .byte "have",$fd,"bee"                  ; [$9fb9] char
    .byte "n",$fe,"unable"                  ; [$9fc1] char
    .byte $fd,"to",$fd,"leav"               ; [$9fc9] char
    .byte "e",$fe,"town.",$ff               ; [$9fd1] char

MESSAGE_DANGEROUS_WITHOUT_MAGIC:            ; [$9fd9]
    .byte "I"                               ; Message 113
    .byte "t",$fd,"is",$fd,"dan"            ; [$9fda] char
    .byte "gerous",$fe,"t"                  ; [$9fe2] char
    .byte "o",$fd,"leave",$fd               ; [$9fea] char
    .byte "town",$fe,"unl"                  ; [$9ff2] char
    .byte "ess",$fd,"you",$fd               ; [$9ffa] char
    .byte "have",$fe,"a",$fd,"m"            ; [$a002] char
    .byte "agic",$fd,"shi"                  ; [$a00a] char
    .byte "eld.",$ff                        ; [$a012] char

MESSAGE_MAGIC_HALL_OUTSIDE_TOWN:            ; [$a017]
    .byte "T"                               ; Message 114
    .byte "here",$fd,"is",$fd               ; [$a018] char
    .byte "a",$fd,"magich"                  ; [$a020] char
    .byte "all",$fd,"outs"                  ; [$a028] char
    .byte "ide",$fe,"town"                  ; [$a030] char
    .byte ".",$ff                           ; [$a038] char

MESSAGE_MAGIC_CANE:                         ; [$a03a]
    .byte "T"                               ; Message 115
    .byte "here",$fd,"is",$fd               ; [$a03b] char
    .byte "a",$fd,"magicc"                  ; [$a043] char
    .byte "ane",$fd,"whic"                  ; [$a04b] char
    .byte "h",$fd,"will",$fe,"g"            ; [$a053] char
    .byte "ive",$fd,"you",$fd               ; [$a05b] char
    .byte "magic",$fe,"po"                  ; [$a063] char
    .byte "wer.",$ff                        ; [$a06b] char

MESSAGE_GO_TO_CAPITAL:                      ; [$a070]
    .byte "T"                               ; Message 116
    .byte "he",$fd,"door",$fd               ; [$a071] char
    .byte "to",$fd,"the",$fe,"C"            ; [$a079] char
    .byte "apital",$fd,"t"                  ; [$a081] char
    .byte "own",$fe,"belo"                  ; [$a089] char
    .byte "w",$fd,"is",$fd,"ope"            ; [$a091] char
    .byte "n.",$fe,"Go",$fd,"to"            ; [$a099] char
    .byte $fd,"it",$fd,"now."               ; [$a0a1] char
    .byte $ff                               ; [$a0a9] char

MESSAGE_GOT_ARMOR_FOR_BOTTLE:               ; [$a0aa]
    .byte "I"                               ; Message 117
    .byte "t",$fd,"was",$fd,"on"            ; [$a0ab] char
    .byte "ly",$fd,"a",$fe,"rum"            ; [$a0b3] char
    .byte "or.",$fd,"Sorr"                  ; [$a0bb] char
    .byte "y",$fe,"about",$fd               ; [$a0c3] char
    .byte "that.",$fc,"I",$fd               ; [$a0cb] char
    .byte "got",$fd,"this"                  ; [$a0d3] char
    .byte $fd,"armorin"                     ; [$a0db] char
    .byte $fd,"exchang"                     ; [$a0e3] char
    .byte "e",$fd,"for",$fe,"a",$fd         ; [$a0eb] char
    .byte "bottle.",$fc                     ; [$a0f3] char
    .byte "If",$fd,"you",$fd,"w"            ; [$a0fb] char
    .byte "ish,",$fe,"you"                  ; [$a103] char
    .byte $fd,"can",$fd,"hav"               ; [$a10b] char
    .byte "e",$fd,"it.",$ff                 ; [$a113] char

MESSAGE_ILL_HAVE_DRINK:                     ; [$a119]
    .byte "I"                               ; Message 118
    .byte "'ll",$fd,"have"                  ; [$a11a] char
    .byte $fd,"a",$fe,"drink"               ; [$a122] char
    .byte ".",$fe,"Well.."                  ; [$a12a] char
    .byte ".",$fe,"not",$fd,"ye"            ; [$a132] char
    .byte "t.",$ff                          ; [$a13a] char

MESSAGE_IM_LOST:                            ; [$a13d]
    .byte "L"                               ; Message 119
    .byte "ooks",$fd,"lik"                  ; [$a13e] char
    .byte "e",$fe,"I'm",$fd,"lo"            ; [$a146] char
    .byte "st.",$ff                         ; [$a14e] char

MESSAGE_IM_LOST_MAGIC_DOES_NOT_WORK:        ; [$a152]
    .byte "I"                               ; Message 120
    .byte "'m",$fd,"lost."                  ; [$a153] char
    .byte $fe,"My",$fd,"magi"               ; [$a15b] char
    .byte "c",$fe,"does",$fd,"n"            ; [$a163] char
    .byte "ot",$fd,"work."                  ; [$a16b] char
    .byte $ff                               ; [$a173] char

MESSAGE_MAGIC_OF_JUSTICE_OR_DESTRUCTION:    ; [$a174]
    .byte "I"                               ; Message 121
    .byte "t",$fd,"can",$fd,"be"            ; [$a175] char
    .byte $fd,"magic",$fe,"o"               ; [$a17d] char
    .byte "f",$fd,"justic"                  ; [$a185] char
    .byte "e",$fe,"or",$fd,"a",$fd,"m"      ; [$a18d] char
    .byte "agic",$fd,"of",$fe               ; [$a195] char
    .byte "destruct"                        ; [$a19d] char
    .byte "ion.",$fc,"It",$fd               ; [$a1a5] char
    .byte "all",$fd,"depe"                  ; [$a1ad] char
    .byte "nds",$fe,"on",$fd,"w"            ; [$a1b5] char
    .byte "ho",$fd,"uses",$fd               ; [$a1bd] char
    .byte "it.",$ff                         ; [$a1c5] char

MESSAGE_MAGIC_INDIVIDUAL_POWERS:            ; [$a1c9]
    .byte "M"                               ; Message 122
    .byte "agics",$fd,"ha"                  ; [$a1ca] char
    .byte "ve",$fe,"indiv"                  ; [$a1d2] char
    .byte "idual",$fe,"po"                  ; [$a1da] char
    .byte "wers.",$ff                       ; [$a1e2] char

MESSAGE_MAGIC_CONSUMES_POWER:               ; [$a1e8]
    .byte "M"                               ; Message 123
    .byte "agic",$fd,"of",$fd               ; [$a1e9] char
    .byte "offencei"                        ; [$a1f1] char
    .byte "s",$fd,"effect"                  ; [$a1f9] char
    .byte "ive,",$fe,"but"                  ; [$a201] char
    .byte $fd,"it",$fd,"cons"               ; [$a209] char
    .byte "umes",$fe,"pow"                  ; [$a211] char
    .byte "er.",$ff                         ; [$a219] char

MESSAGE_METEORITE_BECOMES_BLACK_ONYX:       ; [$a21d]
    .byte "W"                               ; Message 124
    .byte "hen",$fd,"you",$fd               ; [$a21e] char
    .byte "hold",$fe,"the"                  ; [$a226] char
    .byte $fd,"Dwarf's"                     ; [$a22e] char
    .byte $fe,"meteori"                     ; [$a236] char
    .byte "te",$fd,"in",$fe,"yo"            ; [$a23e] char
    .byte "ur",$fd,"hand,"                  ; [$a246] char
    .byte $fc,"it",$fd,"will"               ; [$a24e] char
    .byte $fd,"become",$fe                  ; [$a256] char
    .byte "Black",$fd,"On"                  ; [$a25e] char
    .byte "yx",$fd,"with",$fe               ; [$a266] char
    .byte "power",$fd,"in"                  ; [$a26e] char
    .byte "side.",$ff                       ; [$a276] char

MESSAGE_DIRECTIONS_TO_TOWER_OF_MIST:        ; [$a27c]
    .byte "I"                               ; Message 125
    .byte "f",$fd,"you",$fd,"go"            ; [$a27d] char
    .byte $fe,"straigh"                     ; [$a285] char
    .byte "t",$fd,"ahead,"                  ; [$a28d] char
    .byte $fc,"you",$fd,"wil"               ; [$a295] char
    .byte "l",$fd,"get",$fd,"to"            ; [$a29d] char
    .byte $fe,"the",$fd,"Tow"               ; [$a2a5] char
    .byte "er",$fd,"of",$fe,"Mi"            ; [$a2ad] char
    .byte "st.",$fc,"If",$fd,"y"            ; [$a2b5] char
    .byte "ou",$fd,"defea"                  ; [$a2bd] char
    .byte "t",$fe,"the",$fd,"dw"            ; [$a2c5] char
    .byte "arf",$fd,"who",$fe               ; [$a2cd] char
    .byte "lives",$fd,"in"                  ; [$a2d5] char
    .byte $fd,"the",$fe,"Tow"               ; [$a2dd] char
    .byte "er",$fc,"and",$fd,"g"            ; [$a2e5] char
    .byte "et",$fd,"the",$fe,"m"            ; [$a2ed] char
    .byte "eteorite"                        ; [$a2f5] char
    .byte ",",$fe,"come",$fd,"b"            ; [$a2fd] char
    .byte "ack",$fd,"here"                  ; [$a305] char
    .byte ".",$ff                           ; [$a30d] char

MESSAGE_USE_KEY_FOR_CONFLATE:               ; [$a30f]
    .byte "A"                               ; Message 126
    .byte "s",$fd,"long",$fd,"a"            ; [$a310] char
    .byte "s",$fd,"therea"                  ; [$a318] char
    .byte "re",$fd,"craze"                  ; [$a320] char
    .byte "d",$fe,"Dwarfs"                  ; [$a328] char
    .byte ",",$fc,"the",$fd,"de"            ; [$a330] char
    .byte "adly",$fe,"thr"                  ; [$a338] char
    .byte "eat",$fd,"of",$fd,"t"            ; [$a340] char
    .byte "he",$fe,"meteo"                  ; [$a348] char
    .byte "rite",$fc,"wil"                  ; [$a350] char
    .byte "l",$fd,"loom",$fd,"o"            ; [$a358] char
    .byte "ver",$fe,"the",$fd               ; [$a360] char
    .byte "Elves.",$fc,"U"                  ; [$a368] char
    .byte "se",$fd,"this",$fd               ; [$a370] char
    .byte "key",$fd,"to",$fe,"o"            ; [$a378] char
    .byte "pen",$fd,"the",$fd               ; [$a380] char
    .byte "next",$fe,"doo"                  ; [$a388] char
    .byte "r",$fd,"to",$fd,"get"            ; [$a390] char
    .byte $fd,"to",$fe,"Conf"               ; [$a398] char
    .byte "late.",$fc,"Fi"                  ; [$a3a0] char
    .byte "ght",$fd,"for",$fd               ; [$a3a8] char
    .byte "the",$fe,"Elve"                  ; [$a3b0] char
    .byte "s.",$ff                          ; [$a3b8] char

MESSAGE_YOU_NEED_KEY_ACE:                   ; [$a3bb]
    .byte "I"                               ; Message 127
    .byte $fd,"give",$fd,"ke"               ; [$a3bc] char
    .byte "ys",$fd,"to",$fe,"tr"            ; [$a3c4] char
    .byte "avelers",$fd                     ; [$a3cc] char
    .byte "like",$fe,"you"                  ; [$a3d4] char
    .byte "rself.",$fc,"Y"                  ; [$a3dc] char
    .byte "ou",$fd,"have",$fd               ; [$a3e4] char
    .byte "an",$fe,"\"Ace\""                ; [$a3ec] char
    .byte $fd,"key,",$fe,"do"               ; [$a3f4] char
    .byte "n't",$fd,"you?"                  ; [$a3fc] char
    .byte $ff                               ; [$a404] char

MESSAGE_WELCOME_TO_CONFLATE:                ; [$a405]
    .byte "T"                               ; Message 128
    .byte "his",$fd,"is",$fd,"a"            ; [$a406] char
    .byte $fe,"trading"                     ; [$a40e] char
    .byte $fd,"town",$fe,"ca"               ; [$a416] char
    .byte "lled",$fe,"Con"                  ; [$a41e] char
    .byte "flate.",$ff                      ; [$a426] char

MESSAGE_LEGENDARY_SHIELD_HELMET:            ; [$a42d]
    .byte "Y"                               ; Message 129
    .byte "ou'll",$fd,"fi"                  ; [$a42e] char
    .byte "nd",$fd,"the",$fe,"l"            ; [$a436] char
    .byte "egendary"                        ; [$a43e] char
    .byte $fd,"shielda"                     ; [$a446] char
    .byte "nd",$fd,"helme"                  ; [$a44e] char
    .byte "t",$fc,"in",$fd,"the"            ; [$a456] char
    .byte $fd,"World",$fd,"o"               ; [$a45e] char
    .byte "f",$fe,"Branch"                  ; [$a466] char
    .byte ".",$ff                           ; [$a46e] char

MESSAGE_TOWN_SURROUNDED_BY_DOORS:           ; [$a470]
    .byte "T"                               ; Message 130
    .byte "he",$fd,"town",$fd               ; [$a471] char
    .byte "is",$fe,"surro"                  ; [$a479] char
    .byte "unded",$fd,"by"                  ; [$a481] char
    .byte $fe,"doors",$fd,"f"               ; [$a489] char
    .byte "or",$fe,"prote"                  ; [$a491] char
    .byte "ction.",$ff                      ; [$a499] char

MESSAGE_SEE_GURU_AFTER_SHIELD_HELMET:       ; [$a4a0]
    .byte "W"                               ; Message 131
    .byte "hen",$fd,"you",$fd               ; [$a4a1] char
    .byte "get",$fd,"thes"                  ; [$a4a9] char
    .byte "hield",$fd,"an"                  ; [$a4b1] char
    .byte "d",$fe,"helmet"                  ; [$a4b9] char
    .byte ",",$fd,"go",$fd,"to",$fe         ; [$a4c1] char
    .byte "see",$fd,"the",$fd               ; [$a4c9] char
    .byte "Guru.",$ff                       ; [$a4d1] char

MESSAGE_GUARDIAN_OF_GURU:                   ; [$a4d7]
    .byte "I"                               ; Message 132
    .byte $fd,"am",$fd,"a",$fd,"gu"         ; [$a4d8] char
    .byte "ardian",$fe,"o"                  ; [$a4e0] char
    .byte "f",$fd,"the",$fd,"Gu"            ; [$a4e8] char
    .byte "ru.",$fe,"He",$fd,"i"            ; [$a4f0] char
    .byte "s",$fd,"an",$fd,"im-"            ; [$a4f8] char
    .byte $fe,"portant"                     ; [$a500] char
    .byte $fd,"person."                     ; [$a508] char
    .byte $ff                               ; [$a510] char

MESSAGE_SOMETHING_YOU_CAN_GET:              ; [$a511]
    .byte "T"                               ; Message 133
    .byte "here",$fd,"sho"                  ; [$a512] char
    .byte "uld",$fd,"be",$fe,"s"            ; [$a51a] char
    .byte "omething"                        ; [$a522] char
    .byte $fd,"you",$fe,"can"               ; [$a52a] char
    .byte $fd,"get.",$ff                    ; [$a532] char

MESSAGE_DONT_RELY_ON_MAGIC_FINAL_BATTLE:    ; [$a538]
    .byte "D"                               ; Message 134
    .byte "on't",$fd,"rel"                  ; [$a539] char
    .byte "y",$fd,"on",$fe,"you"            ; [$a541] char
    .byte "r",$fd,"magic",$fd               ; [$a549] char
    .byte "power",$fc,"du"                  ; [$a551] char
    .byte "ring",$fd,"the"                  ; [$a559] char
    .byte $fd,"finalba"                     ; [$a561] char
    .byte "ttle",$fd,"wit"                  ; [$a569] char
    .byte "h",$fd,"the",$fe,"Dw"            ; [$a571] char
    .byte "arfs.",$ff                       ; [$a579] char

MESSAGE_USED_TO_TRADE_WITH_DWARVES:         ; [$a57f]
    .byte "T"                               ; Message 135
    .byte "he",$fd,"town",$fd               ; [$a580] char
    .byte "used",$fd,"top"                  ; [$a588] char
    .byte "rosper",$fd,"f"                  ; [$a590] char
    .byte "rom",$fe,"trad"                  ; [$a598] char
    .byte "ing",$fd,"with"                  ; [$a5a0] char
    .byte $fd,"theDwar"                     ; [$a5a8] char
    .byte "fs.",$ff                         ; [$a5b0] char

MESSAGE_USED_TO_BE_SKILLED:                 ; [$a5b4]
    .byte "T"                               ; Message 136
    .byte "hey",$fd,"are",$fe               ; [$a5b5] char
    .byte "terrible"                        ; [$a5bd] char
    .byte $fd,"now,",$fc,"bu"               ; [$a5c5] char
    .byte "t",$fd,"they",$fd,"u"            ; [$a5cd] char
    .byte "sed",$fd,"tobe"                  ; [$a5d5] char
    .byte $fd,"skilled"                     ; [$a5dd] char
    .byte $fe,"craftsm"                     ; [$a5e5] char
    .byte "en.",$ff                         ; [$a5ed] char

MESSAGE_USED_TO_VISIT_DWARVES:              ; [$a5f1]
    .byte "I"                               ; Message 137
    .byte $fd,"used",$fd,"to"               ; [$a5f2] char
    .byte $fd,"go",$fd,"to",$fe,"t"         ; [$a5fa] char
    .byte "he",$fd,"town",$fd               ; [$a602] char
    .byte "of",$fe,"Dwarf"                  ; [$a60a] char
    .byte "s",$fd,"quite",$fe               ; [$a612] char
    .byte "often",$fc,"wh"                  ; [$a61a] char
    .byte "en",$fd,"we",$fd,"ha"            ; [$a622] char
    .byte "d",$fe,"busine"                  ; [$a62a] char
    .byte "ss",$fd,"with",$fe               ; [$a632] char
    .byte "them.",$ff                       ; [$a63a] char

MESSAGE_I_AM_PICKPOCKET:                    ; [$a640]
    .byte "D"                               ; Message 138
    .byte "o",$fd,"you",$fd,"wa"            ; [$a641] char
    .byte "nt",$fd,"to",$fe,"kn"            ; [$a649] char
    .byte "ow",$fd,"what",$fd               ; [$a651] char
    .byte "I",$fd,"do?",$fc,"I",$fd         ; [$a659] char
    .byte "am",$fe,"the",$fd,"p"            ; [$a661] char
    .byte "ickpocke"                        ; [$a669] char
    .byte "t",$fe,"Gingi."                  ; [$a671] char
    .byte $fc,"I'm",$fd,"an",$fd            ; [$a679] char
    .byte "importan"                        ; [$a681] char
    .byte "tperson",$fd                     ; [$a689] char
    .byte "around",$fe,"h"                  ; [$a691] char
    .byte "ere.",$ff                        ; [$a699] char

MESSAGE_NEED_FINAL_WEAPON_ARMOR:            ; [$a69e]
    .byte "D"                               ; Message 139
    .byte "on't",$fd,"rel"                  ; [$a69f] char
    .byte "y",$fd,"on",$fe,"you"            ; [$a6a7] char
    .byte "r",$fd,"magic",$fd               ; [$a6af] char
    .byte "power",$fc,"on"                  ; [$a6b7] char
    .byte "ly",$fd,"durin"                  ; [$a6bf] char
    .byte "g",$fd,"the",$fe,"fi"            ; [$a6c7] char
    .byte "nal",$fd,"figh"                  ; [$a6cf] char
    .byte "t",$fe,"agains"                  ; [$a6d7] char
    .byte "t",$fd,"the",$fe,"Dw"            ; [$a6df] char
    .byte "arfs.",$fc,"Yo"                  ; [$a6e7] char
    .byte "u",$fd,"can",$fd,"we"            ; [$a6ef] char
    .byte "ar",$fd,"theBa"                  ; [$a6f7] char
    .byte "ttle",$fd,"Hel"                  ; [$a6ff] char
    .byte "met",$fe,"and",$fd               ; [$a707] char
    .byte "Battle",$fd,"S"                  ; [$a70f] char
    .byte "uit",$fc,"only"                  ; [$a717] char
    .byte $fd,"when",$fd,"yo"               ; [$a71f] char
    .byte "u",$fe,"have",$fd,"t"            ; [$a727] char
    .byte "he",$fd,"Drago"                  ; [$a72f] char
    .byte "n",$fe,"Slayer"                  ; [$a737] char
    .byte ".",$fc,"You",$fd,"wi"            ; [$a73f] char
    .byte "ll",$fd,"not",$fd,"b"            ; [$a747] char
    .byte "e",$fe,"able",$fd,"t"            ; [$a74f] char
    .byte "o",$fd,"return"                  ; [$a757] char
    .byte $fe,"us",$fd,"the",$fd            ; [$a75f] char
    .byte "Dragon",$fe,"S"                  ; [$a767] char
    .byte "layer",$fc,"un"                  ; [$a76f] char
    .byte "til",$fd,"we",$fd,"h"            ; [$a777] char
    .byte "ave",$fe,"true"                  ; [$a77f] char
    .byte $fd,"peace",$fd,"h"               ; [$a787] char
    .byte "ere.",$ff                        ; [$a78f] char

MESSAGE_DIRECTIONS_DARTMORE:                ; [$a794]
    .byte "D"                               ; Message 140
    .byte "on't",$fd,"rel"                  ; [$a795] char
    .byte "y",$fd,"on",$fe,"you"            ; [$a79d] char
    .byte "r",$fd,"magic",$fd               ; [$a7a5] char
    .byte "power",$fc,"al"                  ; [$a7ad] char
    .byte "one",$fd,"duri"                  ; [$a7b5] char
    .byte "ng",$fd,"thela"                  ; [$a7bd] char
    .byte "st",$fd,"fight"                  ; [$a7c5] char
    .byte $fe,"against"                     ; [$a7cd] char
    .byte $fd,"the",$fe,"Dwa"               ; [$a7d5] char
    .byte "rfs.",$fc,"You"                  ; [$a7dd] char
    .byte $fd,"can",$fd,"wea"               ; [$a7e5] char
    .byte "r",$fd,"theBat"                  ; [$a7ed] char
    .byte "tle",$fd,"Helm"                  ; [$a7f5] char
    .byte "et",$fe,"and",$fd,"B"            ; [$a7fd] char
    .byte "attle",$fd,"Su"                  ; [$a805] char
    .byte "it",$fc,"only",$fd               ; [$a80d] char
    .byte "when",$fd,"you"                  ; [$a815] char
    .byte $fe,"have",$fd,"th"               ; [$a81d] char
    .byte "e",$fd,"Dragon"                  ; [$a825] char
    .byte $fe,"Slayer."                     ; [$a82d] char
    .byte $fc,"You",$fd,"wil"               ; [$a835] char
    .byte "l",$fd,"not",$fd,"be"            ; [$a83d] char
    .byte $fe,"able",$fd,"to"               ; [$a845] char
    .byte $fd,"return",$fe                  ; [$a84d] char
    .byte "us",$fd,"the",$fd,"D"            ; [$a855] char
    .byte "ragon",$fe,"Sl"                  ; [$a85d] char
    .byte "ayer",$fc,"unt"                  ; [$a865] char
    .byte "il",$fd,"we",$fd,"ha"            ; [$a86d] char
    .byte "ve",$fe,"true",$fd               ; [$a875] char
    .byte "peace",$fd,"he"                  ; [$a87d] char
    .byte "re.",$fc,"This"                  ; [$a885] char
    .byte $fd,"ring",$fd,"wi"               ; [$a88d] char
    .byte "ll",$fe,"open",$fd               ; [$a895] char
    .byte "the",$fd,"door"                  ; [$a89d] char
    .byte $fd,"toDartm"                     ; [$a8a5] char
    .byte "oor.",$fd,"Tak"                  ; [$a8ad] char
    .byte "e",$fe,"it",$fd,"wit"            ; [$a8b5] char
    .byte "h",$fd,"you.",$ff                ; [$a8bd] char

MESSAGE_DIRECTIONS_DAYBREAK:                ; [$a8c4]
    .byte "D"                               ; Message 141
    .byte "aydreak",$fd                     ; [$a8c5] char
    .byte "is",$fd,"a",$fe,"tow"            ; [$a8cd] char
    .byte "n",$fd,"at",$fd,"the"            ; [$a8d5] char
    .byte $fe,"border."                     ; [$a8dd] char
    .byte $ff                               ; [$a8e5] char

MESSAGE_FRIENDS_IN_DARTMOOR:                ; [$a8e6]
    .byte "I"                               ; Message 142
    .byte $fd,"have",$fd,"fr"               ; [$a8e7] char
    .byte "iends",$fe,"in"                  ; [$a8ef] char
    .byte $fd,"Dartmoo"                     ; [$a8f7] char
    .byte "r",$fc,"which",$fd               ; [$a8ff] char
    .byte "is",$fd,"known"                  ; [$a907] char
    .byte $fe,"as",$fd,"an",$fd,"e"         ; [$a90f] char
    .byte "vil",$fe,"plac"                  ; [$a917] char
    .byte "e.",$ff                          ; [$a91f] char

MESSAGE_LOOK_FOR_BATTLE_SUIT:               ; [$a922]
    .byte "L"                               ; Message 143
    .byte "ook",$fd,"for",$fd               ; [$a923] char
    .byte "the",$fe,"Batt"                  ; [$a92b] char
    .byte "le",$fd,"Suit."                  ; [$a933] char
    .byte $ff                               ; [$a93b] char

MESSAGE_FIND_MAGIC_CANE:                    ; [$a93c]
    .byte "D"                               ; Message 144
    .byte "id",$fd,"you",$fd,"f"            ; [$a93d] char
    .byte "ind",$fd,"them"                  ; [$a945] char
    .byte "agic",$fd,"can"                  ; [$a94d] char
    .byte "e?",$ff                          ; [$a955] char

MESSAGE_YOU_ARE_FAMOUS_GOOD_LOOKING:        ; [$a958]
    .byte "Y"                               ; Message 145
    .byte "ou",$fd,"are",$fd,"t"            ; [$a959] char
    .byte "he",$fe,"famou"                  ; [$a961] char
    .byte "s",$fd,"warrio"                  ; [$a969] char
    .byte "r.",$fc,"You",$fd,"a"            ; [$a971] char
    .byte "re",$fd,"as",$fd,"go"            ; [$a979] char
    .byte "od",$fe,"looki"                  ; [$a981] char
    .byte "ng",$fd,"as",$fd,"I'"            ; [$a989] char
    .byte "ve",$fe,"heard"                  ; [$a991] char
    .byte ".",$ff                           ; [$a999] char

MESSAGE_AUTOGRAPH:                          ; [$a99b]
    .byte "Y"                               ; Message 146
    .byte "ou",$fd,"are",$fd,"t"            ; [$a99c] char
    .byte "he",$fe,"warri"                  ; [$a9a4] char
    .byte "or",$fd,"every"                  ; [$a9ac] char
    .byte "oneis",$fd,"ta"                  ; [$a9b4] char
    .byte "lking",$fe,"ab"                  ; [$a9bc] char
    .byte "out.",$fc,"Cou"                  ; [$a9c4] char
    .byte "ld",$fd,"I",$fd,"hav"            ; [$a9cc] char
    .byte "e",$fe,"your",$fd,"a"            ; [$a9d4] char
    .byte "utograph"                        ; [$a9dc] char
    .byte "?",$fc,"Are",$fd,"yo"            ; [$a9e4] char
    .byte "u",$fd,"busy",$fe,"n"            ; [$a9ec] char
    .byte "ow?",$fd,"Well"                  ; [$a9f4] char
    .byte ",",$fd,"will",$fe,"y"            ; [$a9fc] char
    .byte "ou",$fd,"come",$fd               ; [$aa04] char
    .byte "to",$fe,"visit"                  ; [$aa0c] char
    .byte $fd,"me?",$fc,"My",$fd            ; [$aa14] char
    .byte "name",$fd,"is",$fd               ; [$aa1c] char
    .byte "Moto.Ple"                        ; [$aa24] char
    .byte "ase",$fd,"don'"                  ; [$aa2c] char
    .byte "t",$fe,"forget"                  ; [$aa34] char
    .byte ".",$ff                           ; [$aa3c] char

MESSAGE_WHEN_TAKE_BATH:                     ; [$aa3e]
    .byte "L"                               ; Message 147
    .byte "ook",$fd,"at",$fd,"y"            ; [$aa3f] char
    .byte "ou!",$fe,"When"                  ; [$aa47] char
    .byte $fd,"did",$fd,"you"               ; [$aa4f] char
    .byte $fe,"last",$fd,"ta"               ; [$aa57] char
    .byte "ke",$fd,"a",$fe,"bat"            ; [$aa5f] char
    .byte "h?",$ff                          ; [$aa67] char

MESSAGE_GURU_CONFLATE_HAS_RING_DWARVES:     ; [$aa6a]
    .byte "T"                               ; Message 148
    .byte "he",$fd,"Guru",$fd               ; [$aa6b] char
    .byte "of",$fe,"Confl"                  ; [$aa73] char
    .byte "ate",$fd,"has",$fd               ; [$aa7b] char
    .byte "theRing",$fd                     ; [$aa83] char
    .byte "of",$fd,"Dwarf"                  ; [$aa8b] char
    .byte "s.",$ff                          ; [$aa93] char

MESSAGE_DID_YOU_GET_BATTLE_SUIT:            ; [$aa96]
    .byte "D"                               ; Message 149
    .byte "id",$fd,"you",$fd,"g"            ; [$aa97] char
    .byte "et",$fd,"the",$fe,"B"            ; [$aa9f] char
    .byte "attle",$fd,"Su"                  ; [$aaa7] char
    .byte "it?",$ff                         ; [$aaaf] char

MESSAGE_DARTMORE_IS_MAZE:                   ; [$aab3]
    .byte "T"                               ; Message 150
    .byte "he",$fd,"castl"                  ; [$aab4] char
    .byte "e",$fd,"of",$fe,"Dar"            ; [$aabc] char
    .byte "tmoor",$fd,"is"                  ; [$aac4] char
    .byte $fd,"a",$fe,"compl"               ; [$aacc] char
    .byte "ex",$fd,"maze."                  ; [$aad4] char
    .byte $ff                               ; [$aadc] char

MESSAGE_IS_FIRST_VISIT_TO_STORE:            ; [$aadd]
    .byte "I"                               ; Message 151
    .byte "s",$fd,"this",$fd,"y"            ; [$aade] char
    .byte "our",$fe,"firs"                  ; [$aae6] char
    .byte "t",$fd,"visit",$fd               ; [$aaee] char
    .byte "to",$fe,"this",$fd               ; [$aaf6] char
    .byte "store?",$fe,"I"                  ; [$aafe] char
    .byte "t",$fd,"is",$fd,"my",$fd         ; [$ab06] char
    .byte "first.",$ff                      ; [$ab0e] char

MESSAGE_MAGIC_CANE_ABOVE_TOWER:             ; [$ab15]
    .byte "H"                               ; Message 152
    .byte "ave",$fd,"not",$fd               ; [$ab16] char
    .byte "seen",$fe,"you"                  ; [$ab1e] char
    .byte $fd,"for",$fd,"a",$fd,"w"         ; [$ab26] char
    .byte "hile.You"                        ; [$ab2e] char
    .byte "'ll",$fd,"find"                  ; [$ab36] char
    .byte $fd,"a",$fe,"magic"               ; [$ab3e] char
    .byte $fd,"cane",$fc,"wh"               ; [$ab46] char
    .byte "en",$fd,"you",$fd,"g"            ; [$ab4e] char
    .byte "et",$fe,"above"                  ; [$ab56] char
    .byte $fd,"the",$fd,"tow"               ; [$ab5e] char
    .byte "er",$fe,"of",$fd,"Pi"            ; [$ab66] char
    .byte "llar.",$ff                       ; [$ab6e] char

MESSAGE_DIRECTIONS_TO_FRATERNAL:            ; [$ab74]
    .byte "T"                               ; Message 153
    .byte "here",$fd,"is",$fd               ; [$ab75] char
    .byte "the",$fe,"Cast"                  ; [$ab7d] char
    .byte "le",$fd,"of",$fe,"Fr"            ; [$ab85] char
    .byte "aternal",$fc                     ; [$ab8d] char
    .byte "down",$fd,"bel"                  ; [$ab95] char
    .byte "ow",$fd,"the",$fe,"t"            ; [$ab9d] char
    .byte "own",$fd,"of",$fe,"D"            ; [$aba5] char
    .byte "artmoor."                        ; [$abad] char
    .byte $ff                               ; [$abb5] char

MESSAGE_YOU_NEED_DEMONS_RING:               ; [$abb6]
    .byte "Y"                               ; Message 154
    .byte "ou",$fd,"need",$fd               ; [$abb7] char
    .byte "the",$fe,"Demo"                  ; [$abbf] char
    .byte "n's",$fd,"Ring"                  ; [$abc7] char
    .byte $fc,"to",$fd,"get",$fd            ; [$abcf] char
    .byte "into",$fd,"the"                  ; [$abd7] char
    .byte $fe,"fortres"                     ; [$abdf] char
    .byte "s",$fd,"of",$fe,"Zen"            ; [$abe7] char
    .byte "is.",$ff                         ; [$abef] char

MESSAGE_KING_GRIEVE_HAS_DRAGON_SLAYER:      ; [$abf3]
    .byte "D"                               ; Message 155
    .byte "ragon",$fd,"Sl"                  ; [$abf4] char
    .byte "ayer",$fd,"isi"                  ; [$abfc] char
    .byte "n",$fd,"the",$fd,"ha"            ; [$ac04] char
    .byte "nds",$fd,"of",$fe,"k"            ; [$ac0c] char
    .byte "ing",$fd,"of",$fd,"t"            ; [$ac14] char
    .byte "he",$fe,"Dwarf"                  ; [$ac1c] char
    .byte "s.",$ff                          ; [$ac24] char

MESSAGE_DEFEAT_EVIL_WITH_DRAGON_SLAYER:     ; [$ac27]
    .byte "D"                               ; Message 156
    .byte "efeat",$fd,"th"                  ; [$ac28] char
    .byte "e",$fd,"Evil",$fe,"o"            ; [$ac30] char
    .byte "ne",$fd,"with",$fd               ; [$ac38] char
    .byte "Dragon",$fe,"S"                  ; [$ac40] char
    .byte "layer.",$ff                      ; [$ac48] char

MESSAGE_GO_TO_FRATERNAL_GURU:               ; [$ac4f]
    .byte "G"                               ; Message 157
    .byte "o",$fd,"to",$fd,"see"            ; [$ac50] char
    .byte $fd,"the",$fe,"Gur"               ; [$ac58] char
    .byte "u",$fd,"in",$fd,"the"            ; [$ac60] char
    .byte $fe,"Castle",$fd                  ; [$ac68] char
    .byte "of",$fe,"Frate"                  ; [$ac70] char
    .byte "rnal.",$ff                       ; [$ac78] char

MESSAGE_GURU_HAS_DEMONS_RING:               ; [$ac7e]
    .byte "I"                               ; Message 158
    .byte "f",$fd,"you",$fd,"se"            ; [$ac7f] char
    .byte "e",$fd,"the",$fe,"Gu"            ; [$ac87] char
    .byte "ru,",$fd,"he'l"                  ; [$ac8f] char
    .byte "l",$fd,"giveyo"                  ; [$ac97] char
    .byte "u",$fd,"the",$fd,"De"            ; [$ac9f] char
    .byte "mon's",$fe,"Ri"                  ; [$aca7] char
    .byte "ng.",$ff                         ; [$acaf] char

MESSAGE_SEARCH_CASTLE_FOR_GURU:             ; [$acb3]
    .byte "S"                               ; Message 159
    .byte "earch",$fd,"in"                  ; [$acb4] char
    .byte "side",$fe,"the"                  ; [$acbc] char
    .byte $fd,"castle."                     ; [$acc4] char
    .byte $fe,"You",$fd,"sho"               ; [$accc] char
    .byte "uld",$fd,"find"                  ; [$acd4] char
    .byte $fe,"a",$fd,"Guru."               ; [$acdc] char
    .byte $ff                               ; [$ace4] char

MESSAGE_EVIL_IMMUNE_TO_MAGIC:               ; [$ace5]
    .byte "T"                               ; Message 160
    .byte "he",$fd,"magic"                  ; [$ace6] char
    .byte $fd,"of",$fe,"offe"               ; [$acee] char
    .byte "nce",$fd,"does"                  ; [$acf6] char
    .byte $fd,"notwork"                     ; [$acfe] char
    .byte $fd,"against"                     ; [$ad06] char
    .byte $fd,"theEvil"                     ; [$ad0e] char
    .byte $fd,"one.",$ff                    ; [$ad16] char

MESSAGE_METEORITE_EXPOSITION_2:             ; [$ad1c]
    .byte "T"                               ; Message 161
    .byte "he",$fd,"Dwarf"                  ; [$ad1d] char
    .byte "s",$fd,"re-",$fe,"ga"            ; [$ad25] char
    .byte "rd",$fd,"the",$fd,"m"            ; [$ad2d] char
    .byte "eteor-it"                        ; [$ad35] char
    .byte "e",$fd,"as",$fd,"a",$fd,"c"      ; [$ad3d] char
    .byte "osmic",$fe,"me"                  ; [$ad45] char
    .byte "ssenger."                        ; [$ad4d] char
    .byte $fc,"It",$fd,"is",$fd,"a"         ; [$ad55] char
    .byte $fd,"dreadfu"                     ; [$ad5d] char
    .byte "lthing",$fd,"a"                  ; [$ad65] char
    .byte "s",$fd,"you",$fe,"al"            ; [$ad6d] char
    .byte "ready",$fd,"kn"                  ; [$ad75] char
    .byte "ow.",$fc,"It",$fd,"t"            ; [$ad7d] char
    .byte "urns",$fd,"int"                  ; [$ad85] char
    .byte "o",$fd,"a",$fe,"pois"            ; [$ad8d] char
    .byte "on",$fd,"when",$fe               ; [$ad95] char
    .byte "dissolve"                        ; [$ad9d] char
    .byte "d",$fd,"in",$fe,"wat"            ; [$ada5] char
    .byte "er.",$fc,"It",$fd,"i"            ; [$adad] char
    .byte "s",$fd,"not",$fd,"in"            ; [$adb5] char
    .byte "con-ceiv"                        ; [$adbd] char
    .byte "able",$fd,"tha"                  ; [$adc5] char
    .byte "t",$fc,"you",$fd,"wo"            ; [$adcd] char
    .byte "uld",$fd,"ex-",$fe               ; [$add5] char
    .byte "perience"                        ; [$addd] char
    .byte $fd,"mental",$fe                  ; [$ade5] char
    .byte "and",$fd,"phys"                  ; [$aded] char
    .byte "ical",$fe,"cha"                  ; [$adf5] char
    .byte "nges",$fc,"whe"                  ; [$adfd] char
    .byte "n",$fd,"you",$fd,"ar"            ; [$ae05] char
    .byte "e",$fe,"near",$fd,"o"            ; [$ae0d] char
    .byte "r",$fd,"touch",$fe               ; [$ae15] char
    .byte "it.",$fc,"That"                  ; [$ae1d] char
    .byte $fd,"is",$fd,"why",$fd            ; [$ae25] char
    .byte "the",$fe,"Dwar"                  ; [$ae2d] char
    .byte "fs",$fd,"have",$fe               ; [$ae35] char
    .byte "changed",$fd                     ; [$ae3d] char
    .byte "and",$fd,"gone"                  ; [$ae45] char
    .byte "crazy.",$ff                      ; [$ae4d] char

MESSAGE_DEFEATED_KING_GRIEVE:               ; [$ae54]
    .byte "T"                               ; Message 162
    .byte "he",$fd,"monst"                  ; [$ae55] char
    .byte "er",$fe,"you'v"                  ; [$ae5d] char
    .byte "e",$fd,"just",$fd,"d"            ; [$ae65] char
    .byte "e-",$fe,"feate"                  ; [$ae6d] char
    .byte "d",$fd,"is",$fd,"Kin"            ; [$ae75] char
    .byte "g",$fe,"Grieve"                  ; [$ae7d] char
    .byte ",",$fc,"the",$fd,"ki"            ; [$ae85] char
    .byte "ng",$fd,"of",$fd,"th"            ; [$ae8d] char
    .byte "e",$fe,"Dwarfs"                  ; [$ae95] char
    .byte ".",$fd,"The",$fd,"Ev"            ; [$ae9d] char
    .byte "ilOne",$fd,"ch"                  ; [$aea5] char
    .byte "anged",$fd,"hi"                  ; [$aead] char
    .byte "s",$fe,"appear"                  ; [$aeb5] char
    .byte "ance.",$fc,"Th"                  ; [$aebd] char
    .byte "e",$fd,"king",$fd,"p"            ; [$aec5] char
    .byte "ro-",$fe,"tect"                  ; [$aecd] char
    .byte "ed",$fd,"the",$fd,"s"            ; [$aed5] char
    .byte "wordfrom"                        ; [$aedd] char
    .byte $fd,"the",$fd,"Evi"               ; [$aee5] char
    .byte "l",$fe,"One",$fc,"by"            ; [$aeed] char
    .byte $fd,"hiding",$fd                  ; [$aef5] char
    .byte "it",$fe,"withi"                  ; [$aefd] char
    .byte "n",$fd,"his",$fd,"ow"            ; [$af05] char
    .byte "n",$fe,"body.",$fc               ; [$af0d] char
    .byte "Use",$fd,"the",$fd               ; [$af15] char
    .byte "sword",$fd,"to"                  ; [$af1d] char
    .byte "defeat",$fd,"t"                  ; [$af25] char
    .byte "he",$fd,"Evil",$fe               ; [$af2d] char
    .byte "One",$fd,"in",$fd,"t"            ; [$af35] char
    .byte "he",$fe,"fortr"                  ; [$af3d] char
    .byte "ess.",$fc,"Thi"                  ; [$af45] char
    .byte "s",$fd,"will",$fd,"o"            ; [$af4d] char
    .byte "pen",$fe,"the",$fd               ; [$af55] char
    .byte "door",$fd,"to",$fd               ; [$af5d] char
    .byte "the",$fe,"fort"                  ; [$af65] char
    .byte "ress.",$ff                       ; [$af6d] char

MESSAGE_ILL_MEDITATE_FOR_YOU:               ; [$af73]
    .byte "I"                               ; Message 163
    .byte "'ll",$fd,"medi"                  ; [$af74] char
    .byte "tate",$fe,"for"                  ; [$af7c] char
    .byte $fd,"you.",$ff                    ; [$af84] char

MESSAGE_GLAD_YOURE_BACK:                    ; [$af8a]
    .byte "G"                               ; Message 164
    .byte "lad",$fd,"to",$fd,"h"            ; [$af8b] char
    .byte "ave",$fd,"youb"                  ; [$af93] char
    .byte "ack",$fd,"safe"                  ; [$af9b] char
    .byte "ly.",$fc,"It",$fd,"w"            ; [$afa3] char
    .byte "ill",$fd,"take"                  ; [$afab] char
    .byte $fe,"time,",$fe,"b"               ; [$afb3] char
    .byte "ut",$fd,"the",$fd,"E"            ; [$afbb] char
    .byte "lves",$fe,"and"                  ; [$afc3] char
    .byte $fd,"the",$fd,"Dwa"               ; [$afcb] char
    .byte "rfs",$fc,"will"                  ; [$afd3] char
    .byte $fd,"become",$fe                  ; [$afdb] char
    .byte "friends",$fd                     ; [$afe3] char
    .byte "and",$fd,"re-",$fe               ; [$afeb] char
    .byte "turn",$fd,"the"                  ; [$aff3] char
    .byte $fd,"peace",$fe,"t"               ; [$affb] char
    .byte "o",$fd,"this",$fd,"l"            ; [$b003] char
    .byte "and",$fc,"as",$fd,"i"            ; [$b00b] char
    .byte "t",$fd,"used",$fd,"t"            ; [$b013] char
    .byte "o",$fe,"be.",$fd,"I",$fd         ; [$b01b] char
    .byte "understa"                        ; [$b023] char
    .byte "ndyou",$fd,"wi"                  ; [$b02b] char
    .byte "ll",$fd,"leave"                  ; [$b033] char
    .byte $fc,"to",$fd,"cont"               ; [$b03b] char
    .byte "inue",$fd,"you"                  ; [$b043] char
    .byte "rjourney"                        ; [$b04b] char
    .byte ".",$fe,"What",$fd,"a"            ; [$b053] char
    .byte $fd,"restles"                     ; [$b05b] char
    .byte "s",$fe,"guy!",$ff                ; [$b063] char

MESSAGE_MARK_OF_QUEEN:                      ; [$b06a]
    .byte "T"                               ; Message 165
    .byte "here",$fd,"is",$fd               ; [$b06b] char
    .byte "the",$fe,"mark"                  ; [$b073] char
    .byte $fd,"of",$fd,"\"Que"              ; [$b07b] char
    .byte "en\"",$fe,"by",$fd,"t"           ; [$b083] char
    .byte "he",$fd,"key",$fd,"h"            ; [$b08b] char
    .byte "ole.",$ff                        ; [$b093] char

MESSAGE_MARK_OF_KING:                       ; [$b098]
    .byte "T"                               ; Message 166
    .byte "here",$fd,"is",$fd               ; [$b099] char
    .byte "the",$fe,"mark"                  ; [$b0a1] char
    .byte $fd,"of",$fd,"\"Kin"              ; [$b0a9] char
    .byte "g\"",$fe,"by",$fd,"th"           ; [$b0b1] char
    .byte "e",$fd,"key",$fd,"ho"            ; [$b0b9] char
    .byte "le.",$ff                         ; [$b0c1] char

MESSAGE_MARK_OF_ACE:                        ; [$b0c5]
    .byte "T"                               ; Message 167
    .byte "here",$fd,"is",$fd               ; [$b0c6] char
    .byte "the",$fe,"mark"                  ; [$b0ce] char
    .byte $fd,"of",$fd,"\"Ace"              ; [$b0d6] char
    .byte "\"",$fe,"by",$fd,"the"           ; [$b0de] char
    .byte $fd,"key",$fd,"hol"               ; [$b0e6] char
    .byte "e.",$ff                          ; [$b0ee] char

MESSAGE_MARK_OF_JOKER:                      ; [$b0f1]
    .byte "T"                               ; Message 168
    .byte "here",$fd,"is",$fd               ; [$b0f2] char
    .byte "the",$fe,"mark"                  ; [$b0fa] char
    .byte $fd,"of",$fd,"\"Jok"              ; [$b102] char
    .byte "er\"",$fe,"by",$fd,"t"           ; [$b10a] char
    .byte "he",$fd,"key",$fd,"h"            ; [$b112] char
    .byte "ole.",$ff                        ; [$b11a] char

MESSAGE_NEED_RING_FOR_DOOR:                 ; [$b11f]
    .byte "D"                               ; Message 169
    .byte "o",$fd,"you",$fd,"ne"            ; [$b120] char
    .byte "ed",$fe,"a",$fd,"rin"            ; [$b128] char
    .byte "g",$fe,"to",$fd,"ope"            ; [$b130] char
    .byte "n",$fd,"a",$fd,"door"            ; [$b138] char
    .byte "?",$ff                           ; [$b140] char

MESSAGE_USED_RED_POTION:                    ; [$b142]
    .byte "I"                               ; Message 170
    .byte "'ve",$fd,"used"                  ; [$b143] char
    .byte $fe,"Red",$fd,"Pot"               ; [$b14b] char
    .byte "ion.",$ff                        ; [$b153] char

MESSAGE_USED_MATTOCK:                       ; [$b158]
    .byte "I"                               ; Message 171
    .byte "'ve",$fd,"used"                  ; [$b159] char
    .byte $fe,"Mattock"                     ; [$b161] char
    .byte ".",$ff                           ; [$b169] char

MESSAGE_USED_HOURGLASS:                     ; [$b16b]
    .byte "I"                               ; Message 172
    .byte "'ve",$fd,"used"                  ; [$b16c] char
    .byte $fe,"Hour",$fd,"Gl"               ; [$b174] char
    .byte "ass.",$ff                        ; [$b17c] char

MESSAGE_USED_WINGBOOTS:                     ; [$b181]
    .byte "I"                               ; Message 173
    .byte "'ve",$fd,"used"                  ; [$b182] char
    .byte $fe,"Wing",$fd,"Bo"               ; [$b18a] char
    .byte "ots.",$ff                        ; [$b192] char

MESSAGE_USED_KEY:                           ; [$b197]
    .byte "I"                               ; Message 174
    .byte "'ve",$fd,"used"                  ; [$b198] char
    .byte $fd,"key.",$ff                    ; [$b1a0] char

MESSAGE_USED_ELIXIR:                        ; [$b1a6]
    .byte "I"                               ; Message 175
    .byte "'ve",$fd,"used"                  ; [$b1a7] char
    .byte $fe,"Elixir."                     ; [$b1af] char
    .byte $ff                               ; [$b1b7] char

MESSAGE_HOLDING_ELIXIR:                     ; [$b1b8]
    .byte "I"                               ; Message 176
    .byte "'m",$fd,"holdi"                  ; [$b1b9] char
    .byte "ng",$fe,"Elixi"                  ; [$b1c1] char
    .byte "r.",$ff                          ; [$b1c9] char

MESSAGE_HOLDING_RED_POTION:                 ; [$b1cc]
    .byte "I"                               ; Message 177
    .byte "'m",$fd,"holdi"                  ; [$b1cd] char
    .byte "ng",$fe,"Red",$fd,"P"            ; [$b1d5] char
    .byte "otion.",$ff                      ; [$b1dd] char

MESSAGE_HOLDING_MATTOCK:                    ; [$b1e4]
    .byte "I"                               ; Message 178
    .byte "'m",$fd,"holdi"                  ; [$b1e5] char
    .byte "ng",$fe,"Matto"                  ; [$b1ed] char
    .byte "ck.",$ff                         ; [$b1f5] char

MESSAGE_HOLDING_WINGBOOTS:                  ; [$b1f9]
    .byte "I"                               ; Message 179
    .byte "'m",$fd,"holdi"                  ; [$b1fa] char
    .byte "ng",$fe,"Wing",$fd               ; [$b202] char
    .byte "Boots.",$ff                      ; [$b20a] char

MESSAGE_HOLDING_HOURGLASS:                  ; [$b211]
    .byte "I"                               ; Message 180
    .byte "'m",$fd,"holdi"                  ; [$b212] char
    .byte "ng",$fe,"Hour",$fd               ; [$b21a] char
    .byte "Glass.",$ff                      ; [$b222] char

MESSAGE_GOT_BATTLE_SUIT:                    ; [$b229]
    .byte "I"                               ; Message 181
    .byte "'ve",$fd,"got",$fe               ; [$b22a] char
    .byte "the",$fd,"Batt"                  ; [$b232] char
    .byte "le",$fd,"Suit."                  ; [$b23a] char
    .byte $ff                               ; [$b242] char

MESSAGE_GOT_BATTLE_HELMET:                  ; [$b243]
    .byte "I"                               ; Message 182
    .byte "'ve",$fd,"got",$fd               ; [$b244] char
    .byte "the",$fe,"Batt"                  ; [$b24c] char
    .byte "le",$fd,"Helme"                  ; [$b254] char
    .byte "t.",$ff                          ; [$b25c] char

MESSAGE_GOT_DRAGON_SLAYER:                  ; [$b25f]
    .byte "I"                               ; Message 183
    .byte "'ve",$fd,"got",$fd               ; [$b260] char
    .byte "the",$fe,"Drag"                  ; [$b268] char
    .byte "on",$fd,"Slaye"                  ; [$b270] char
    .byte "r.",$ff                          ; [$b278] char

MESSAGE_GOT_BLACK_ONYX:                     ; [$b27b]
    .byte "I"                               ; Message 184
    .byte "'ve",$fd,"got",$fe               ; [$b27c] char
    .byte "the",$fd,"Blac"                  ; [$b284] char
    .byte "k",$fd,"Onyx.",$ff               ; [$b28c] char

MESSAGE_GOT_PENDANT:                        ; [$b294]
    .byte "I"                               ; Message 185
    .byte "'ve",$fd,"got",$fe               ; [$b295] char
    .byte "the",$fd,"Pend"                  ; [$b29d] char
    .byte "ant.",$ff                        ; [$b2a5] char

MESSAGE_GOT_MAGICAL_ROD:                    ; [$b2aa]
    .byte "I"                               ; Message 186
    .byte "'ve",$fd,"got",$fd               ; [$b2ab] char
    .byte "the",$fe,"Magi"                  ; [$b2b3] char
    .byte "cal",$fd,"Rod."                  ; [$b2bb] char
    .byte $ff                               ; [$b2c3] char

MESSAGE_TOUCHED_POISON:                     ; [$b2c4]
    .byte "I"                               ; Message 187
    .byte "'ve",$fd,"touc"                  ; [$b2c5] char
    .byte "hed",$fe,"Pois"                  ; [$b2cd] char
    .byte "on.",$ff                         ; [$b2d5] char

MESSAGE_GLOVE_INCREASES_POWER:              ; [$b2d9]
    .byte "T"                               ; Message 188
    .byte "he",$fd,"glove"                  ; [$b2da] char
    .byte $fe,"increas"                     ; [$b2e2] char
    .byte "es",$fe,"offen"                  ; [$b2ea] char
    .byte "sive",$fd,"pow"                  ; [$b2f2] char
    .byte "er.",$ff                         ; [$b2fa] char

MESSAGE_POWER_GLOVE_IS_GONE:                ; [$b2fe]
    .byte "T"                               ; Message 189
    .byte "he",$fd,"power"                  ; [$b2ff] char
    .byte $fd,"of",$fe,"the",$fd            ; [$b307] char
    .byte "Glove",$fe,"is"                  ; [$b30f] char
    .byte $fd,"gone.",$ff                   ; [$b317] char

MESSAGE_USED_OINTMENT:                      ; [$b31e]
    .byte "I"                               ; Message 190
    .byte $fd,"am",$fd,"free"               ; [$b31f] char
    .byte $fd,"from",$fe,"in"               ; [$b327] char
    .byte "jury",$fd,"bec"                  ; [$b32f] char
    .byte "ause",$fe,"of",$fd               ; [$b337] char
    .byte "the",$fd,"oint"                  ; [$b33f] char
    .byte "ment.",$ff                       ; [$b347] char

MESSAGE_OINTMENT_GONE:                      ; [$b34d]
    .byte "T"                               ; Message 191
    .byte "he",$fd,"power"                  ; [$b34e] char
    .byte $fd,"of",$fe,"the",$fd            ; [$b356] char
    .byte "ointment"                        ; [$b35e] char
    .byte $fe,"is",$fd,"gone"               ; [$b366] char
    .byte ".",$ff                           ; [$b36e] char

MESSAGE_WINGBOOTS_GONE:                     ; [$b370]
    .byte "T"                               ; Message 192
    .byte "he",$fd,"power"                  ; [$b371] char
    .byte $fd,"of",$fe,"the",$fd            ; [$b379] char
    .byte "Wing",$fd,"Boo"                  ; [$b381] char
    .byte "ts",$fe,"is",$fd,"go"            ; [$b389] char
    .byte "ne.",$ff                         ; [$b391] char

MESSAGE_HOURGLASS_GONE:                     ; [$b395]
    .byte "T"                               ; Message 193
    .byte "he",$fd,"power"                  ; [$b396] char
    .byte $fd,"of",$fe,"the",$fd            ; [$b39e] char
    .byte "Hour",$fd,"Gla"                  ; [$b3a6] char
    .byte "ss",$fe,"is",$fd,"go"            ; [$b3ae] char
    .byte "ne.",$ff                         ; [$b3b6] char

EXTRA_TILE_GLYPH_END_DOUBLE_QUOTES:         ; [$b3ba]
    .byte $00,$10,$48,$28,$20,$00,$00,$00   ; [$b3ba] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b3c2] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b3ca] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b3d2] byte

EXTRA_TILE_GLYPH_SMALL_SQUARE:              ; [$b3da]
    .byte $00,$78,$48,$48,$78,$00,$00,$00   ; [$b3da] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b3e2] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b3ea] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$b3f2] byte

EXTRA_TILE_GLYPH_LEFT_ARROW_TOP:            ; [$b3fa]
    .byte $00,$00,$00,$00,$02,$06,$0e,$1f   ; [$b3fa] byte

EXTRA_TILE_GLYPH_LEFT_ARROW_BOTTOM:         ; [$b402]
    .byte $1f,$0e,$06,$02,$00,$00,$00,$00   ; [$b402] byte

EXTRA_TILE_GLYPH_EQUAL_TOP:                 ; [$b40a]
    .byte $00,$00,$00,$00,$00,$00,$00,$fc   ; [$b40a] byte

EXTRA_TILE_GLYPH_EQUAL_BOTTOM:              ; [$b412]
    .byte $fc,$00,$00,$00,$00,$00,$00,$00   ; [$b412] byte

EXTRA_TILE_GLYPH_EQUAL2_TOP:                ; [$b41a]
    .byte $00,$00,$00,$00,$00,$00,$00,$1f   ; [$b41a] byte

EXTRA_TILE_GLYPH_EQUAL2_BOTTOM:             ; [$b422]
    .byte $1f,$00,$00,$00,$00,$00,$00,$00   ; [$b422] byte

EXTRA_TILE_GLYPH_RIGHT_ARROW_TOP:           ; [$b42a]
    .byte $00,$00,$00,$00,$20,$30,$38,$fc   ; [$b42a] byte

EXTRA_TILE_GLYPH_RIGHT_ARROW_BOTTOM:        ; [$b432]
    .byte $fc,$38,$30,$20,$00,$00,$00,$00   ; [$b432] byte

EXTRA_TILE_GLYPH_END1_TOP:                  ; [$b43a]
    .byte $00,$00,$00,$7a,$42,$43,$42,$7a   ; [$b43a] byte

EXTRA_TILE_GLYPH_END1_BOTTOM:               ; [$b442]
    .byte $42,$42,$42,$7a,$00,$00,$00,$00   ; [$b442] byte

EXTRA_TILE_GLYPH_END2_TOP:                  ; [$b44a]
    .byte $00,$00,$00,$2c,$2a,$29,$a9,$a9   ; [$b44a] byte

EXTRA_TILE_GLYPH_END2_BOTTOM:               ; [$b452]
    .byte $69,$29,$2a,$2c,$00,$00,$00,$00   ; [$b452] byte
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b45a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b462] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b46a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b472] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b47a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b482] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b48a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b492] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b49a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4a2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4aa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4b2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4ba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4c2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4ca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4d2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4da] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4e2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4ea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4f2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4fa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b502] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b50a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b512] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b51a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b522] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b52a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b532] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b53a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b542] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b54a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b552] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b55a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b562] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b56a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b572] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b57a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b582] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b58a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b592] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b59a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5a2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5aa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5b2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5ba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5c2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5ca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5d2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5da] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5e2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5ea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5f2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5fa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b602] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b60a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b612] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b61a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b622] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b62a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b632] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b63a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b642] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b64a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b652] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b65a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b662] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b66a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b672] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b67a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b682] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b68a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b692] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b69a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6a2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6aa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6b2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6ba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6c2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6ca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6d2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6da] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6e2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6ea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6f2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6fa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b702] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b70a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b712] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b71a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b722] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b72a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b732] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b73a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b742] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b74a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b752] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b75a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b762] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b76a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b772] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b77a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b782] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b78a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b792] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b79a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7a2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7aa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7b2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7ba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7c2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7ca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7d2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7da] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7e2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7ea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7f2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7fa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b802] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b80a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b812] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b81a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b822] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b82a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b832] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b83a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b842] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b84a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b852] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b85a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b862] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b86a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b872] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b87a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b882] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b88a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b892] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b89a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8a2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8aa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8b2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8ba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8c2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8ca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8d2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8da] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8e2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8ea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8f2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8fa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b902] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b90a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b912] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b91a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b922] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b92a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b932] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b93a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b942] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b94a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b952] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b95a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b962] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b96a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b972] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b97a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b982] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b98a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b992] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b99a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9a2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9aa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9b2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9ba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9c2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9ca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9d2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9da] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9e2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9ea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9f2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9fa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba02] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba0a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba12] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba1a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba22] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba2a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba32] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba3a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba42] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba4a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba52] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba5a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba62] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba6a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba72] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba7a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba82] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba8a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba92] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba9a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baa2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baaa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bab2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bac2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bad2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bada] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bae2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baf2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bafa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb02] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb0a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb12] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb1a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb22] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb2a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb32] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb3a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb42] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb4a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb52] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb5a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb62] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb6a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb72] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb7a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb82] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb8a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb92] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb9a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bba2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbaa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbb2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbc2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbd2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbda] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbe2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbf2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbfa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc02] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc0a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc12] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc1a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc22] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc2a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc32] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc3a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc42] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc4a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc52] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc5a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc62] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc6a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc72] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc7a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc82] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc8a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc92] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc9a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bca2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcaa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcb2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcc2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcd2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcda] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bce2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcf2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcfa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd02] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd0a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd12] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd1a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd22] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd2a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd32] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd3a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd42] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd4a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd52] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd5a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd62] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd6a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd72] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd7a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd82] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd8a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd92] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd9a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bda2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdaa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdb2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdc2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdd2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdda] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bde2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdf2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdfa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be02] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be0a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be12] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be1a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be22] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be2a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be32] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be3a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be42] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be4a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be52] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be5a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be62] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be6a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be72] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be7a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be82] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be8a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be92] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be9a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bea2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beaa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beb2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bec2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bed2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beda] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bee2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bef2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$befa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf02] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf0a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf12] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf1a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf22] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf2a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf32] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf3a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf42] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf4a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf52] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf5a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf62] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf6a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf72] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf7a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf82] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf8a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf92] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf9a] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfa2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfaa] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfb2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfba] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfc2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfca] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfd2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfda] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfe2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfea] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bff2] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff           ; [$bffa] undefined
