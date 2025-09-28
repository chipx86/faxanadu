;============================================================================
; Faxanadu (U).nes
;
; PRG13 ($8000 - $bfff)
;============================================================================

BASE $8000

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8000] byte

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
    db $08,$18,$18,$10,$10,$00,$30,$00      ; [$8008] byte

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
    db $00,$00,$28,$28,$28,$00,$00,$00      ; [$8010] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8018] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8020] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8028] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8030] byte

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
    db $08,$18,$10,$00,$00,$00,$00,$00      ; [$8038] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8040] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8048] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8050] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8058] byte

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
    db $00,$00,$00,$60,$60,$20,$40,$00      ; [$8060] byte

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
    db $00,$00,$00,$7e,$00,$00,$00,$00      ; [$8068] byte

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
    db $00,$00,$00,$00,$00,$30,$30,$00      ; [$8070] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8078] byte

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
    db $7c,$c6,$c6,$c6,$c6,$c6,$7c,$00      ; [$8080] byte

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
    db $18,$38,$18,$18,$18,$18,$3c,$00      ; [$8088] byte

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
    db $7c,$c6,$0e,$3c,$70,$e0,$fe,$00      ; [$8090] byte

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
    db $7e,$0c,$18,$3c,$06,$c6,$7c,$00      ; [$8098] byte

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
    db $1c,$3c,$6c,$cc,$cc,$fe,$0c,$00      ; [$80a0] byte

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
    db $fe,$c0,$fc,$0e,$06,$c6,$7c,$00      ; [$80a8] byte

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
    db $3c,$60,$c0,$fc,$c6,$c6,$7c,$00      ; [$80b0] byte

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
    db $fe,$c6,$0c,$18,$30,$30,$30,$00      ; [$80b8] byte

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
    db $7c,$c6,$c6,$7c,$c6,$c6,$7c,$00      ; [$80c0] byte

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
    db $7c,$c6,$c6,$7e,$06,$c6,$7c,$00      ; [$80c8] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$80d0] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$80d8] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$80e0] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$80e8] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$80f0] byte

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
    db $7c,$c6,$86,$3c,$30,$00,$30,$00      ; [$80f8] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$8100] byte

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
    db $38,$38,$2c,$64,$7e,$46,$ce,$00      ; [$8108] byte

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
    db $fc,$62,$76,$6c,$62,$66,$fc,$00      ; [$8110] byte

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
    db $7c,$e6,$c2,$c0,$c0,$e6,$7c,$00      ; [$8118] byte

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
    db $f8,$4c,$46,$46,$46,$ce,$fc,$00      ; [$8120] byte

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
    db $fe,$66,$78,$7c,$60,$66,$fc,$00      ; [$8128] byte

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
    db $fe,$66,$78,$7c,$60,$60,$f0,$00      ; [$8130] byte

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
    db $7c,$e6,$c0,$ce,$c6,$e6,$7c,$00      ; [$8138] byte

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
    db $ee,$66,$76,$6e,$66,$66,$ef,$00      ; [$8140] byte

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
    db $3c,$18,$18,$18,$18,$18,$3c,$00      ; [$8148] byte

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
    db $0e,$06,$06,$c6,$c6,$ce,$7c,$00      ; [$8150] byte

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
    db $ce,$dc,$f8,$f0,$fa,$de,$cc,$00      ; [$8158] byte

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
    db $c0,$c0,$c0,$c0,$c2,$c6,$fe,$00      ; [$8160] byte

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
    db $c6,$ee,$fe,$d6,$c6,$c6,$c6,$00      ; [$8168] byte

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
    db $c6,$e6,$f6,$de,$ce,$c6,$c2,$00      ; [$8170] byte

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
    db $7c,$ee,$c6,$c6,$c6,$ec,$78,$00      ; [$8178] byte

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
    db $fc,$c6,$e6,$e6,$dc,$c0,$c0,$00      ; [$8180] byte

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
    db $7c,$ce,$c6,$c6,$de,$ec,$7e,$00      ; [$8188] byte

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
    db $fc,$46,$66,$7c,$58,$cc,$e6,$00      ; [$8190] byte

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
    db $7c,$c6,$c2,$7c,$06,$c6,$7c,$00      ; [$8198] byte

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
    db $fe,$d6,$92,$10,$10,$10,$38,$00      ; [$81a0] byte

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
    db $e6,$e6,$c2,$c2,$c2,$e6,$7c,$00      ; [$81a8] byte

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
    db $c6,$c6,$c6,$6e,$6c,$3c,$18,$00      ; [$81b0] byte

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
    db $da,$da,$9a,$fa,$fe,$ee,$44,$00      ; [$81b8] byte

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
    db $86,$ce,$78,$30,$78,$ce,$86,$00      ; [$81c0] byte

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
    db $c6,$c6,$c6,$7c,$38,$18,$38,$00      ; [$81c8] byte

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
    db $7e,$ce,$98,$30,$62,$e6,$fc,$00      ; [$81d0] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$81d8] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$81e0] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$81e8] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$81f0] byte

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
    db $00,$00,$00,$00,$00,$00,$00,$7e      ; [$81f8] byte

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
    db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff      ; [$8200] byte

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
    db $00,$38,$0c,$3c,$6c,$6e,$3e,$00      ; [$8208] byte

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
    db $40,$60,$60,$78,$6c,$6c,$38,$00      ; [$8210] byte

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
    db $00,$00,$38,$7c,$60,$64,$38,$00      ; [$8218] byte

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
    db $04,$0c,$0c,$3c,$6c,$6c,$38,$00      ; [$8220] byte

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
    db $00,$00,$38,$64,$7c,$60,$3c,$00      ; [$8228] byte

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
    db $1c,$18,$7e,$18,$18,$18,$18,$00      ; [$8230] byte

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
    db $00,$38,$6c,$6c,$3c,$0c,$6c,$38      ; [$8238] byte

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
    db $60,$60,$60,$78,$6c,$6c,$6c,$00      ; [$8240] byte

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
    db $30,$30,$00,$30,$30,$30,$30,$00      ; [$8248] byte

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
    db $18,$18,$00,$18,$18,$58,$58,$30      ; [$8250] byte

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
    db $60,$60,$64,$6c,$78,$78,$6c,$00      ; [$8258] byte

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
    db $10,$18,$18,$18,$18,$18,$18,$00      ; [$8260] byte

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
    db $00,$00,$6c,$56,$56,$56,$56,$00      ; [$8268] byte

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
    db $00,$00,$78,$6c,$6c,$6c,$6c,$00      ; [$8270] byte

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
    db $00,$00,$38,$6c,$6c,$6c,$38,$00      ; [$8278] byte

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
    db $00,$00,$78,$6c,$6c,$78,$60,$60      ; [$8280] byte

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
    db $00,$00,$3c,$6c,$6c,$3c,$0c,$0c      ; [$8288] byte

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
    db $00,$00,$6c,$7c,$70,$60,$60,$00      ; [$8290] byte

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
    db $00,$00,$3c,$60,$7c,$0c,$78,$00      ; [$8298] byte

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
    db $10,$18,$7c,$18,$18,$18,$0c,$00      ; [$82a0] byte

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
    db $00,$00,$48,$6c,$6c,$6c,$34,$00      ; [$82a8] byte

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
    db $00,$00,$48,$6c,$6c,$38,$10,$00      ; [$82b0] byte

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
    db $00,$00,$52,$56,$56,$56,$2c,$00      ; [$82b8] byte

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
    db $00,$00,$66,$3c,$18,$2c,$46,$00      ; [$82c0] byte

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
    db $00,$00,$24,$6c,$6c,$3c,$18,$70      ; [$82c8] byte

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
    db $00,$00,$7c,$1c,$38,$70,$7c,$00      ; [$82d0] byte

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
    db $00,$00,$1f,$1f,$1f,$00,$00,$00      ; [$82d8] byte

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
    db $00,$00,$ff,$ff,$ff,$00,$00,$00      ; [$82e0] byte

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
    db $80,$c0,$e0,$f0,$e0,$c0,$80,$00      ; [$82e8] byte

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
    db $01,$03,$07,$0f,$07,$03,$01,$00      ; [$82f0] byte

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
    db $00,$00,$f8,$f8,$f8,$00,$00,$00      ; [$82f8] byte


;============================================================================
; All messages available for display.
;
; Indexes are 1-based.
;============================================================================
MESSAGE_HELP_WITH_ANYTHING:                 ; [$8300]
MESSAGE_STRINGS:
    db "H"                                  ; Message 1
    db "ello.",$fe,"Could",$fd,"I",$fd,"he" ; [$8301] char
    db "lp",$fd,"youwith",$fd,"anyth"       ; [$8311] char
    db "ing.",$fc,"What",$fe,"would",$fd    ; [$8321] char
    db "you",$fd,"like?",$ff                ; [$8331] char

MESSAGE_THANK_YOU_FOR_SHOPPING:             ; [$833b]
    db "T"                                  ; Message 2
    db "hank",$fd,"you",$fe,"for",$fd,"sho" ; [$833c] char
    db "pping.",$ff                         ; [$834c] char

MESSAGE_NOT_ENOUGH_GOLD:                    ; [$8353]
    db "T"                                  ; Message 3
    db "his",$fd,"is",$fd,"not",$fe,"enoug" ; [$8354] char
    db "h",$fd,"Golds.",$ff                 ; [$8364] char

MESSAGE_ANYTHING_ELSE:                      ; [$836d]
    db "A"                                  ; Message 4
    db "nything",$fd,"else?",$ff            ; [$836e] char

MESSAGE_COME_BACK_AGAIN:                    ; [$837c]
    db "C"                                  ; Message 5
    db "ome",$fd,"back",$fd,"again.",$ff    ; [$837d] char

MESSAGE_CANT_CARRY_MORE:                    ; [$838d]
    db "Y"                                  ; Message 6
    db "ou",$fd,"can't",$fd,"carry",$fe,"a" ; [$838e] char
    db "ny",$fd,"more.",$ff                 ; [$839e] char

MESSAGE_DRIED_MEAT_50G:                     ; [$83a7]
    db "D"                                  ; Message 7
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$83a8] char
    db "ng",$fd,"energy",$fe,"for",$fd,"50" ; [$83b8] char
    db $fd,"Golds.",$ff                     ; [$83c8] char

MESSAGE_DRIED_MEAT_150G:                    ; [$83d0]
    db "D"                                  ; Message 8
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$83d1] char
    db "ng",$fd,"energy",$fe,"for",$fd,"15" ; [$83e1] char
    db "0",$fd,"Golds.",$ff                 ; [$83f1] char

MESSAGE_DRIED_MEAT_180G:                    ; [$83fa]
    db "D"                                  ; Message 9
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$83fb] char
    db "ng",$fd,"energy",$fe,"for",$fd,"18" ; [$840b] char
    db "0",$fd,"Golds.",$ff                 ; [$841b] char

MESSAGE_DRIED_MEAT_250G:                    ; [$8424]
    db "D"                                  ; Message 10
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$8425] char
    db "ng",$fd,"energy",$fe,"for",$fd,"25" ; [$8435] char
    db "0",$fd,"Golds.",$ff                 ; [$8445] char

MESSAGE_DRIED_MEAT_350G:                    ; [$844e]
    db "D"                                  ; Message 11
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$844f] char
    db "ng",$fd,"energy",$fe,"for",$fd,"35" ; [$845f] char
    db "0",$fd,"Golds.",$ff                 ; [$846f] char

MESSAGE_DRIED_MEAT_500G:                    ; [$8478]
    db "D"                                  ; Message 12
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$8479] char
    db "ng",$fd,"energy",$fe,"for",$fd,"50" ; [$8489] char
    db "0",$fd,"Golds.",$ff                 ; [$8499] char

MESSAGE_DRIED_MEAT_800G:                    ; [$84a2]
    db "D"                                  ; Message 13
    db "ried",$fd,"meat",$fd,"to",$fe,"bri" ; [$84a3] char
    db "ng",$fd,"energy",$fe,"for",$fd,"80" ; [$84b3] char
    db "0",$fd,"Golds.",$ff                 ; [$84c3] char

MESSAGE_I_SELL_KEYS:                        ; [$84cc]
    db "H"                                  ; Message 14
    db "ello.",$fe,"I",$fd,"sell",$fd,"key" ; [$84cd] char
    db "s.",$fe,"What",$fe,"would",$fd,"yo" ; [$84dd] char
    db "u",$fd,"like?",$ff                  ; [$84ed] char

MESSAGE_I_SELL_TOOLS:                       ; [$84f5]
    db "H"                                  ; Message 15
    db "ello.",$fe,"I",$fd,"sell",$fd,"too" ; [$84f6] char
    db "ls.",$fe,"What",$fe,"would",$fd,"y" ; [$8506] char
    db "ou",$fd,"like?",$ff                 ; [$8516] char

MESSAGE_COME_HERE_TO_BUY_SELL:              ; [$851f]
    db "C"                                  ; Message 16
    db "ome",$fd,"here",$fe,"to",$fd,"buy." ; [$8520] char
    db $fe,"Come",$fd,"here",$fe,"to",$fd,"se" ; [$8530] char
    db "ll.",$ff                            ; [$8540] char

MESSAGE_NO_KEY:                             ; [$8544]
    db "Y"                                  ; Message 17
    db "ou",$fd,"don't",$fe,"have",$fd,"a",$fd ; [$8545] char
    db "key.",$ff                           ; [$8555] char

MESSAGE_NOTHING_TO_BUY:                     ; [$855a]
    db "Y"                                  ; Message 18
    db "ou",$fd,"have",$fe,"nothing",$fd    ; [$855b] char
    db "to",$fd,"buy.",$ff                  ; [$856b] char

MESSAGE_WHICH_TO_SELL:                      ; [$8573]
    db "W"                                  ; Message 19
    db "hich",$fd,"one",$fd,"would",$fe,"l" ; [$8574] char
    db "ike",$fd,"to",$fd,"sell?",$ff       ; [$8584] char

MESSAGE_WHAT_WOULD_YOU_LIKE:                ; [$8591]
    db "W"                                  ; Message 20
    db "hat",$fe,"would",$fd,"you",$fd,"li" ; [$8592] char
    db "ke?",$ff                            ; [$85a2] char

MESSAGE_MAGIC_200G:                         ; [$85a6]
    db "I"                                  ; Message 21
    db $fd,"shall",$fd,"give",$fe,"magi"    ; [$85a7] char
    db "c",$fe,"for",$fd,"200",$fd,"Golds." ; [$85b7] char
    db $ff                                  ; [$85c7] char

MESSAGE_WATCH_POWER_LEVEL:                  ; [$85c8]
    db "W"                                  ; Message 22
    db "atch",$fd,"your",$fe,"remain"       ; [$85c9] char
    db "ing",$fe,"power",$fd,"level."       ; [$85d9] char
    db $ff                                  ; [$85e9] char

MESSAGE_MAGIC_FIRE_3000G:                   ; [$85ea]
    db "D"                                  ; Message 23
    db "o",$fd,"you",$fd,"know",$fd,"the",$fe,"m" ; [$85eb] char
    db "agic",$fd,"of",$fd,"fire?",$fe,"I'" ; [$85fb] char
    db "ll",$fd,"teach",$fd,"you",$fe,"for" ; [$860b] char
    db $fd,"3000",$fd,"Golds.",$ff          ; [$861b] char

MESSAGE_DONT_RELY_ON_MAGIC:                 ; [$8628]
    db "D"                                  ; Message 24
    db "on't",$fd,"rely",$fd,"too",$fe,"mu" ; [$8629] char
    db "ch",$fd,"on",$fd,"magic.",$ff       ; [$8639] char

MESSAGE_MARTIAL_ARTS_200G:                  ; [$8646]
    db "D"                                  ; Message 25
    db "o",$fd,"you",$fd,"want",$fe,"a",$fd,"mar" ; [$8647] char
    db "tial",$fd,"art",$fe,"lesson",$fe    ; [$8657] char
    db "for",$fd,"200",$fd,"Golds?",$ff     ; [$8667] char

MESSAGE_DO_YOU_WANT_TREATMENT:              ; [$8676]
    db "D"                                  ; Message 26
    db "o",$fd,"you",$fd,"want",$fe,"a",$fd,"tre" ; [$8677] char
    db "atment?",$ff                        ; [$8687] char

MESSAGE_DONT_TRY_TOO_HARD:                  ; [$868f]
    db "D"                                  ; Message 27
    db "on't",$fd,"try",$fe,"too",$fd,"har" ; [$8690] char
    db "d.",$ff                             ; [$86a0] char

MESSAGE_250G_PLEASE:                        ; [$86a3]
    db "I"                                  ; Message 28
    db "t",$fd,"is",$fd,"250",$fd,"Golds",$fe,"," ; [$86a4] char
    db "please.",$ff                        ; [$86b4] char

MESSAGE_500G_PLEASE:                        ; [$86bc]
    db "I"                                  ; Message 29
    db "t",$fd,"is",$fd,"500",$fd,"Golds",$fe,"," ; [$86bd] char
    db "please.",$ff                        ; [$86cd] char

MESSAGE_1000G_PLEASE:                       ; [$86d5]
    db "I"                                  ; Message 30
    db "t",$fd,"is",$fd,"1000",$fd,"Golds," ; [$86d6] char
    db "please.",$ff                        ; [$86e6] char

MESSAGE_2500G_PLEASE:                       ; [$86ee]
    db "I"                                  ; Message 31
    db "t",$fd,"is",$fd,"2500",$fd,"Golds," ; [$86ef] char
    db "please.",$ff                        ; [$86ff] char

MESSAGE_1800G_PLEASE:                       ; [$8707]
    db "I"                                  ; Message 32
    db "t",$fd,"is",$fd,"1800",$fd,"Golds," ; [$8708] char
    db "please.",$ff                        ; [$8718] char

MESSAGE_3000G_PLEASE:                       ; [$8720]
    db "I"                                  ; Message 33
    db "t",$fd,"is",$fd,"3000",$fd,"Golds," ; [$8721] char
    db "please.",$ff                        ; [$8731] char

MESSAGE_MEDITATE_WITH_YOU:                  ; [$8739]
    db "Y"                                  ; Message 34
    db "ou",$fd,"need",$fd,"peace",$fe,"of" ; [$873a] char
    db $fd,"mind.",$fe,"I",$fd,"will",$fd,"me" ; [$874a] char
    db "ditate",$fe,"with",$fd,"you."       ; [$875a] char
    db $ff                                  ; [$876a] char

MESSAGE_NEW_TITLE:                          ; [$876b]
    db "I"                                  ; Message 36
    db $fd,"shall",$fd,"give",$fd,"youa"    ; [$876c] char
    db $fd,"title.",$fe,"'",$fb,"'",$fc,"Make" ; [$877c] char
    db $fd,"sure",$fd,"you",$fe,"live",$fd,"u" ; [$878c] char
    db "p",$fd,"to",$fd,"it.",$ff           ; [$879c] char

MESSAGE_REMEMBER_YOUR_MANTRA:               ; [$87a5]
    db "D"                                  ; Message 36
    db "on't",$fd,"have",$fe,"negati"       ; [$87a6] char
    db "ve",$fe,"thoughts.",$fc,"Rem"       ; [$87b6] char
    db "ember",$fe,"your",$fd,"mantr"       ; [$87c6] char
    db "a.",$ff                             ; [$87d6] char

MESSAGE_HEAR_AGAIN:                         ; [$87d9]
    db "D"                                  ; Message 37
    db "o",$fd,"you",$fd,"want",$fe,"to",$fd,"he" ; [$87da] char
    db "ar",$fd,"it",$fe,"once",$fd,"more?" ; [$87ea] char
    db $ff                                  ; [$87fa] char

MESSAGE_INTRO:                              ; [$87fb]
    db "I"                                  ; Message 38
    db "'ve",$fd,"been",$fd,"on",$fe,"a",$fd,"lo" ; [$87fc] char
    db "ng",$fd,"journey.",$fc,"I",$fd,"ca" ; [$880c] char
    db "me",$fd,"back",$fd,"to",$fe,"my",$fd,"ho" ; [$881c] char
    db "me",$fd,"town",$fe,"to",$fd,"find",$fd ; [$882c] char
    db "it",$fd,"is",$fe,"almost",$fd,"des" ; [$883c] char
    db "erted.",$fc,"The",$fd,"gate",$fd    ; [$884c] char
    db "is",$fe,"closed,",$fe,"peopl"       ; [$885c] char
    db "e",$fd,"are",$fd,"gone,",$fc,"and",$fd ; [$886c] char
    db "the",$fd,"walls",$fe,"are",$fd,"cr" ; [$887c] char
    db "umbling.",$fc,"I",$fd,"wonde"       ; [$888c] char
    db "r",$fe,"what",$fd,"happened."       ; [$889c] char
    db $ff                                  ; [$88ac] char

MESSAGE_GO_SEE_KING:                        ; [$88ad]
    db "I"                                  ; Message 39
    db $fd,"want",$fd,"you",$fe,"to",$fd,"see" ; [$88ae] char
    db $fd,"the",$fd,"king",$fe,"right",$fd ; [$88be] char
    db "away",$fc,"although",$fd,"yo"       ; [$88ce] char
    db "u've",$fe,"just",$fd,"arrive"       ; [$88de] char
    db "d.",$ff                             ; [$88ee] char

MESSAGE_DIRECTIONS_APOLUNE:                 ; [$88f1]
    db "G"                                  ; Message 40
    db "o",$fd,"straight",$fe,"ahead"       ; [$88f2] char
    db $fd,"and",$fd,"you'llfind",$fd       ; [$8902] char
    db "the",$fd,"town",$fd,"ofApolu"       ; [$8912] char
    db "ne.",$ff                            ; [$8922] char

MESSAGE_MARK_OF_JACK:                       ; [$8926]
    db "T"                                  ; Message 41
    db "here",$fd,"is",$fd,"a",$fd,"mark",$fe,"o" ; [$8927] char
    db "f",$fd,"\"Jack\"",$fe,"by",$fd,"the",$fd ; [$8937] char
    db "key",$fd,"hole.",$ff                ; [$8947] char

MESSAGE_THIS_IS_EOLIS:                      ; [$8951]
    db "T"                                  ; Message 42
    db "his",$fd,"is",$fd,"the",$fd,"Elf",$fe,"t" ; [$8952] char
    db "own",$fd,"of",$fd,"Eolis.",$fc,"It" ; [$8962] char
    db $fd,"is",$fd,"located",$fd,"atth"    ; [$8972] char
    db "e",$fd,"bottom",$fd,"of",$fe,"the",$fd ; [$8982] char
    db "World",$fd,"Tree",$fc,"and",$fd,"t" ; [$8992] char
    db "he",$fd,"Elves",$fe,"live",$fd,"he" ; [$89a2] char
    db "re.",$fc,"Go",$fd,"to",$fd,"see",$fd,"th" ; [$89b2] char
    db "e",$fe,"Guru",$fd,"before",$fd,"yo" ; [$89c2] char
    db "u",$fe,"see",$fd,"the",$fd,"king.",$ff ; [$89d2] char

MESSAGE_LOOK_FOR_RINGS:                     ; [$89e2]
    db "T"                                  ; Message 43
    db "here",$fd,"are",$fd,"many",$fe,"ri" ; [$89e3] char
    db "ngs",$fd,"with",$fe,"differe"       ; [$89f3] char
    db "nt",$fd,"magic.",$fc,"Look",$fd,"f" ; [$8a03] char
    db "or",$fd,"them",$fe,"one",$fd,"by",$fd,"o" ; [$8a13] char
    db "ne.",$ff                            ; [$8a23] char

MESSAGE_TAKE_RING_TO_KING:                  ; [$8a27]
    db "I"                                  ; Message 44
    db "f",$fd,"you",$fd,"are",$fd,"goingt" ; [$8a28] char
    db "o",$fd,"see",$fd,"the",$fd,"king,t" ; [$8a38] char
    db "ake",$fd,"this",$fd,"ring.",$fc,"T" ; [$8a48] char
    db "his",$fd,"ring",$fd,"will",$fe,"id" ; [$8a58] char
    db "entify",$fd,"you.",$fe,"Don'"       ; [$8a68] char
    db "t",$fd,"lose",$fd,"it.",$ff         ; [$8a78] char

MESSAGE_VISIT_GURUS_GET_TITLE:              ; [$8a83]
    db "V"                                  ; Message 45
    db "isit",$fd,"all",$fd,"Gurus",$fe,"o" ; [$8a84] char
    db "n",$fd,"your",$fd,"way.",$fc,"You'" ; [$8a94] char
    db "ll",$fd,"get",$fd,"a",$fe,"title",$fd,"a" ; [$8aa4] char
    db "ccording",$fe,"to",$fd,"your"       ; [$8ab4] char
    db $fe,"experience.",$ff                ; [$8ac4] char

MESSAGE_LAST_WELL_ALMOST_DRY:               ; [$8ad1]
    db "T"                                  ; Message 46
    db "he",$fd,"last",$fd,"well",$fd,"isa" ; [$8ad2] char
    db "lmost",$fd,"dry.",$ff               ; [$8ae2] char

MESSAGE_THIS_IS_FOREPAW:                    ; [$8aed]
    db "T"                                  ; Message 47
    db "here",$fd,"is",$fe,"a",$fd,"founta" ; [$8aee] char
    db "in",$fe,"in",$fd,"the",$fd,"town",$fd,"o" ; [$8afe] char
    db "f",$fe,"Forepaw.",$ff               ; [$8b0e] char

MESSAGE_DWARVES_ARE_HERE:                   ; [$8b19]
    db "T"                                  ; Message 48
    db "he",$fd,"Dwarfs",$fd,"are",$fe,"al" ; [$8b1a] char
    db "ready",$fd,"in",$fd,"town.It"       ; [$8b2a] char
    db $fd,"looks",$fd,"like",$fe,"the",$fd ; [$8b3a] char
    db "end",$fd,"is",$fd,"near.",$ff       ; [$8b4a] char

MESSAGE_DO_YOU_HAVE_WEAPON:                 ; [$8b57]
    db "D"                                  ; Message 49
    db "o",$fd,"you",$fd,"have",$fe,"a",$fd,"wea" ; [$8b58] char
    db "pon",$fe,"for",$fd,"fighting"       ; [$8b68] char
    db "?",$ff                              ; [$8b78] char

MESSAGE_CANT_LET_YOU_GO:                    ; [$8b7a]
    db "I"                                  ; Message 50
    db $fd,"can't",$fe,"let",$fd,"you",$fd,"g" ; [$8b7b] char
    db "o.",$ff                             ; [$8b8b] char

MESSAGE_KING_IS_WAITING:                    ; [$8b8e]
    db "T"                                  ; Message 51
    db "he",$fd,"King",$fd,"is",$fe,"waiti" ; [$8b8f] char
    db "ng",$fd,"for",$fd,"you.",$ff        ; [$8b9f] char

MESSAGE_GOOD_LUCK:                          ; [$8bab]
    db "G"                                  ; Message 52
    db "ood",$fd,"luck!",$ff                ; [$8bac] char

MESSAGE_KING_EXPOSITION:                    ; [$8bb6]
    db "G"                                  ; Message 53
    db "lad",$fd,"you",$fd,"could",$fe,"co" ; [$8bb7] char
    db "me.",$fe,"Disaster",$fd,"has"       ; [$8bc7] char
    db $fe,"befallen",$fd,"us.",$fc,"Th"    ; [$8bd7] char
    db "e",$fd,"Elf",$fe,"fountain",$fd,"w" ; [$8be7] char
    db "ater,",$fe,"our",$fd,"life",$fd,"s" ; [$8bf7] char
    db "ource,has",$fd,"stoppe"             ; [$8c07] char
    db "d.",$fc,"The",$fd,"wells",$fd,"are" ; [$8c17] char
    db $fe,"drying",$fd,"up.",$fc,"Many"    ; [$8c27] char
    db $fd,"men",$fd,"went",$fe,"out",$fd,"an" ; [$8c37] char
    db "d",$fd,"nobody",$fe,"came",$fd,"ba" ; [$8c47] char
    db "ck.",$fc,"You",$fd,"are",$fd,"our",$fd ; [$8c57] char
    db "lasthope.",$fe,"I",$fd,"shal"       ; [$8c67] char
    db "l",$fd,"give",$fd,"you1500",$fd,"G" ; [$8c77] char
    db "olds.",$fc,"Prepare",$fe,"fo"       ; [$8c87] char
    db "r",$fd,"your",$fd,"journeywi"       ; [$8c97] char
    db "th",$fd,"this",$fd,"money.",$fc,"I" ; [$8ca7] char
    db "t",$fd,"will",$fd,"be",$fd,"a",$fe,"dang" ; [$8cb7] char
    db "erous",$fe,"journey.",$fc,"T"       ; [$8cc7] char
    db "ake",$fd,"care",$fe,"of",$fd,"your" ; [$8cd7] char
    db "self.",$ff                          ; [$8ce7] char

MESSAGE_NOTHING_MORE_TO_HELP:               ; [$8ced]
    db "T"                                  ; Message 54
    db "here",$fd,"is",$fd,"nothingm"       ; [$8cee] char
    db "ore",$fd,"I",$fd,"can",$fd,"do",$fd,"toh" ; [$8cfe] char
    db "elp",$fd,"you.",$fc,"Looking"       ; [$8d0e] char
    db $fd,"forward",$fe,"to",$fd,"good"    ; [$8d1e] char
    db $fd,"news.",$ff                      ; [$8d2e] char

MESSAGE_DWARVES_ROBBING_ELVES:              ; [$8d35]
    db "T"                                  ; Message 55
    db "he",$fd,"Dwarfs",$fe,"are",$fd,"ro" ; [$8d36] char
    db "bbing",$fe,"the",$fd,"Elves'"       ; [$8d46] char
    db $fd,"moneyand",$fd,"jewelr"          ; [$8d56] char
    db "y.",$ff                             ; [$8d66] char

MESSAGE_METEORITE_EXPOSITION:               ; [$8d69]
    db "A"                                  ; Message 56
    db $fd,"meteorite",$fd,"felli"          ; [$8d6a] char
    db "nto",$fd,"the",$fd,"World",$fe,"Tr" ; [$8d7a] char
    db "ee",$fd,"and",$fe,"created",$fd,"h" ; [$8d8a] char
    db "avoc.",$fc,"At",$fd,"the",$fd,"end" ; [$8d9a] char
    db $fd,"of",$fe,"the",$fd,"confusio"    ; [$8daa] char
    db "n,",$fc,"the",$fd,"Dwarfs",$fd,"of" ; [$8dba] char
    db $fe,"the",$fd,"underworld",$fe       ; [$8dca] char
    db "came",$fd,"up",$fc,"and",$fd,"atta" ; [$8dda] char
    db "cked",$fe,"the",$fd,"Elves.",$fe    ; [$8dea] char
    db "Nobody",$fd,"knows",$fe,"the"       ; [$8dfa] char
    db $fd,"reason.",$ff                    ; [$8e0a] char

MESSAGE_LISTEN_TO_PEOPLE:                   ; [$8e13]
    db "L"                                  ; Message 57
    db "isten",$fd,"to",$fe,"people."       ; [$8e14] char
    db $fc,"You'll",$fd,"only",$fd,"get"    ; [$8e24] char
    db $fe,"frustrated",$fe,"if",$fd,"y"    ; [$8e34] char
    db "ou",$fd,"just",$fd,"walkarou"       ; [$8e44] char
    db "nd.",$ff                            ; [$8e54] char

MESSAGE_DONT_TRY_TOO_HARD_2:                ; [$8e58]
    db "D"                                  ; Message 58
    db "on't",$fd,"try",$fe,"too",$fd,"har" ; [$8e59] char
    db "d.",$ff                             ; [$8e69] char

MESSAGE_WELCOME_TO_APOLUNE:                 ; [$8e6c]
    db "W"                                  ; Message 59
    db "elcome",$fd,"to",$fd,"the",$fe,"to" ; [$8e6d] char
    db "wn",$fd,"of",$fd,"Apolune.",$ff     ; [$8e7d] char

MESSAGE_DIRECTIONS_FOREPAW:                 ; [$8e8c]
    db "T"                                  ; Message 60
    db "here",$fd,"is",$fd,"the",$fe,"town" ; [$8e8d] char
    db $fd,"of",$fd,"Forepaw",$fe,"ahea"    ; [$8e9d] char
    db "d",$fd,"of",$fd,"you.",$ff          ; [$8ead] char

MESSAGE_DIRECTIONS_TO_TRUNK:                ; [$8eb7]
    db "T"                                  ; Message 61
    db "here",$fd,"are",$fd,"Dwarfsa"       ; [$8eb8] char
    db "ll",$fd,"over",$fd,"in",$fd,"the",$fe,"T" ; [$8ec8] char
    db "ower",$fd,"of",$fd,"Trunk.",$fc,"G" ; [$8ed8] char
    db "o",$fd,"out",$fd,"of",$fd,"town,",$fe,"t" ; [$8ee8] char
    db "urn",$fd,"right",$fd,"and",$fe,"go" ; [$8ef8] char
    db $fd,"straight,",$fc,"then",$fd       ; [$8f08] char
    db "you'll",$fd,"findthe",$fd,"T"       ; [$8f18] char
    db "ower",$fe,"of",$fd,"Trunk.",$ff     ; [$8f28] char

MESSAGE_GOOD_LUCK_2:                        ; [$8f37]
    db "G"                                  ; Message 62
    db "ood",$fd,"luck.",$ff                ; [$8f38] char

MESSAGE_SHOULD_HAVE_SHIELD:                 ; [$8f42]
    db "Y"                                  ; Message 63
    db "ou",$fd,"should",$fd,"have",$fe,"a" ; [$8f43] char
    db $fd,"shield.",$fd,"It'll",$fe,"p"    ; [$8f53] char
    db "rotect",$fd,"you",$fd,"fromD"       ; [$8f63] char
    db "warf",$fd,"attacks.",$ff            ; [$8f73] char

MESSAGE_MATTOCK_IN_TOWER:                   ; [$8f81]
    db "T"                                  ; Message 64
    db "he",$fd,"Mattock",$fe,"shoul"       ; [$8f82] char
    db "d",$fd,"be",$fd,"in",$fd,"theTower" ; [$8f92] char
    db ".",$fc,"You",$fd,"can",$fd,"get",$fd,"it" ; [$8fa2] char
    db $fe,"by",$fd,"defeating",$fd,"a",$fe ; [$8fb2] char
    db "Dwarf.",$ff                         ; [$8fc2] char

MESSAGE_BLOCKED_PASSAGE:                    ; [$8fc9]
    db "W"                                  ; Message 65
    db "e",$fd,"blocked",$fd,"the",$fe,"pa" ; [$8fca] char
    db "ssage",$fd,"to",$fd,"the",$fe,"nex" ; [$8fda] char
    db "t",$fd,"town",$fd,"by",$fe,"buildi" ; [$8fea] char
    db "ng",$fd,"a",$fd,"wall,",$fc,"but",$fd,"t" ; [$8ffa] char
    db "he",$fd,"Dwarfs",$fe,"keep",$fd,"c" ; [$900a] char
    db "oming.",$ff                         ; [$901a] char

MESSAGE_MATTOCK_BREAKS_WALL:                ; [$9021]
    db "I"                                  ; Message 66
    db "f",$fd,"you",$fd,"have",$fd,"the",$fe,"M" ; [$9022] char
    db "attock,you",$fd,"can",$fe,"b"       ; [$9032] char
    db "reak",$fd,"the",$fd,"wall,",$fc,"b" ; [$9042] char
    db "ut",$fd,"if",$fd,"you",$fd,"don'th" ; [$9052] char
    db "ave",$fd,"it...",$ff                ; [$9062] char

MESSAGE_YOU_NEED_KEY:                       ; [$906c]
    db "Y"                                  ; Message 67
    db "ou",$fd,"need",$fd,"a",$fd,"key.",$ff ; [$906d] char

MESSAGE_YOU_NEED_DIFFERENT_KEY:             ; [$907c]
    db "Y"                                  ; Message 68
    db "ou",$fd,"need",$fd,"a",$fe,"differ" ; [$907d] char
    db "ent",$fd,"key.",$ff                 ; [$908d] char

MESSAGE_DOCTOR_CAN_HELP:                    ; [$9096]
    db "A"                                  ; Message 69
    db "re",$fd,"you",$fd,"hurt?",$fe,"Our" ; [$9097] char
    db $fd,"doctor",$fe,"can",$fd,"help"    ; [$90a7] char
    db ".",$ff                              ; [$90b7] char

MESSAGE_POISON_IS_BAD:                      ; [$90b9]
    db "W"                                  ; Message 70
    db "atch",$fd,"out",$fd,"for",$fe,"the" ; [$90ba] char
    db $fd,"jar",$fd,"of",$fe,"poison.",$fc ; [$90ca] char
    db "The",$fd,"poison",$fd,"will",$fe    ; [$90da] char
    db "take",$fd,"your",$fd,"energy"       ; [$90ea] char
    db "away.",$ff                          ; [$90fa] char

MESSAGE_LEARN_MANTRAS:                      ; [$9100]
    db "D"                                  ; Message 71
    db "id",$fd,"you",$fd,"learn",$fe,"the" ; [$9101] char
    db $fd,"Guru's",$fe,"mantra?",$fc       ; [$9111] char
    db "The",$fd,"mantra",$fd,"will",$fe    ; [$9121] char
    db "return",$fd,"you",$fd,"to",$fe,"th" ; [$9131] char
    db "is",$fd,"world.",$fc,"Hold",$fd,"o" ; [$9141] char
    db "n",$fd,"to",$fd,"the",$fe,"mantra." ; [$9151] char
    db $ff                                  ; [$9161] char

MESSAGE_SECRET_GURU_IN_TOWER:               ; [$9162]
    db "T"                                  ; Message 72
    db "here",$fd,"is",$fd,"a",$fe,"secret" ; [$9163] char
    db $fd,"Guru",$fd,"in",$fe,"the",$fd,"Tow" ; [$9173] char
    db "er",$fd,"of",$fe,"Fortress.",$fc    ; [$9183] char
    db "You'll",$fd,"find",$fe,"impo"       ; [$9193] char
    db "rtant",$fd,"infor-mati"             ; [$91a3] char
    db "on",$fd,"and",$fe,"a",$fd,"key",$fd,"the" ; [$91b3] char
    db "re.",$ff                            ; [$91c3] char

MESSAGE_CARRY_ITEMS:                        ; [$91c7]
    db "Y"                                  ; Message 73
    db "ou",$fd,"can",$fd,"carry",$fd,"8",$fe,"i" ; [$91c8] char
    db "tems.",$fd,"They",$fd,"are",$fe,"a" ; [$91d8] char
    db "ll",$fd,"important.",$fe,"Ch"       ; [$91e8] char
    db "oose",$fd,"well.",$ff               ; [$91f8] char

MESSAGE_WELCOME_TO_FOREPAW:                 ; [$9203]
    db "T"                                  ; Message 74
    db "his",$fd,"is",$fd,"the",$fd,"towno" ; [$9204] char
    db "f",$fd,"Forepaw.",$ff               ; [$9214] char

MESSAGE_FOUNTAIN_WILL_FLOW_TO_TOWN:         ; [$921f]
    db "I"                                  ; Message 75
    db "f",$fd,"the",$fd,"fountain",$fe,"f" ; [$9220] char
    db "lows,water",$fd,"willc"             ; [$9230] char
    db "ome",$fd,"back",$fd,"to",$fd,"thet" ; [$9240] char
    db "own.",$ff                           ; [$9250] char

MESSAGE_FIND_3_SPRINGS:                     ; [$9255]
    db "W"                                  ; Message 76
    db "ater",$fd,"from",$fd,"3",$fe,"spri" ; [$9256] char
    db "ngs",$fd,"flows",$fe,"into",$fd,"t" ; [$9266] char
    db "he",$fe,"fountain.",$fc,"Fin"       ; [$9276] char
    db "d",$fd,"the",$fd,"3",$fe,"springs",$fd ; [$9286] char
    db "and",$fe,"return",$fd,"the",$fd,"w" ; [$9296] char
    db "aterto",$fd,"the",$fd,"fount"       ; [$92a6] char
    db "ain.",$ff                           ; [$92b6] char

MESSAGE_WATER_IS_FLOWING:                   ; [$92bb]
    db "W"                                  ; Message 77
    db "ater",$fd,"is",$fd,"flowingi"       ; [$92bc] char
    db "n",$fd,"our",$fd,"fountain.T"       ; [$92cc] char
    db "hanks",$fd,"to",$fe,"your",$fd,"he" ; [$92dc] char
    db "lp.",$ff                            ; [$92ec] char

MESSAGE_FOUNTAIN_IN_SKY:                    ; [$92f0]
    db "I"                                  ; Message 78
    db $fd,"hear",$fe,"quite",$fd,"ofte"    ; [$92f1] char
    db "n",$fe,"about",$fd,"a",$fd,"founta" ; [$9301] char
    db "inin",$fd,"the",$fd,"sky.",$fc,"Wh" ; [$9311] char
    db "en",$fd,"you",$fd,"go",$fd,"downfr" ; [$9321] char
    db "om",$fd,"the",$fd,"town,",$fc,"you" ; [$9331] char
    db "'ll",$fd,"come",$fd,"to",$fd,"apla" ; [$9341] char
    db "ce",$fd,"where",$fd,"the",$fe,"sky" ; [$9351] char
    db $fd,"opens",$fd,"above.",$fc,"Th"    ; [$9361] char
    db "ey",$fd,"say",$fd,"a",$fe,"fountai" ; [$9371] char
    db "n",$fd,"is",$fd,"up",$fe,"in",$fd,"the",$fd,"s" ; [$9381] char
    db "ky,",$fc,"but",$fd,"you",$fd,"need" ; [$9391] char
    db $fe,"Wing",$fd,"Boots...",$ff        ; [$93a1] char

MESSAGE_PUSH_FOUNTAIN_ROCK:                 ; [$93b0]
    db "I"                                  ; Message 79
    db "f",$fd,"you",$fd,"can",$fd,"push",$fe,"t" ; [$93b1] char
    db "he",$fd,"rock",$fd,"away",$fe,"fro" ; [$93c1] char
    db "m",$fd,"the",$fe,"fountain,",$fc    ; [$93d1] char
    db "you'll",$fd,"find",$fd,"the",$fe    ; [$93e1] char
    db "way",$fd,"to",$fd,"Mascon.",$fc,"B" ; [$93f1] char
    db "ut,",$fd,"you",$fd,"can't",$fe,"mo" ; [$9401] char
    db "ve",$fd,"it",$fd,"without",$fe,"th" ; [$9411] char
    db "e",$fd,"Ring",$fd,"of",$fe,"Ruby.",$fc ; [$9421] char
    db "The",$fd,"old",$fd,"man",$fd,"of",$fe,"t" ; [$9431] char
    db "he",$fd,"spring",$fd,"will",$fe,"h" ; [$9441] char
    db "ave",$fd,"it.",$fe,"Ask",$fd,"him." ; [$9451] char
    db $ff                                  ; [$9461] char

MESSAGE_SPRING_IN_TOWER:                    ; [$9462]
    db "T"                                  ; Message 80
    db "here",$fd,"is",$fd,"a",$fe,"spring" ; [$9463] char
    db $fe,"in",$fd,"the",$fd,"tower",$fd,"of" ; [$9473] char
    db $fe,"Fortress.",$fc,"You'l"          ; [$9483] char
    db "l",$fd,"find",$fd,"the",$fe,"dried" ; [$9493] char
    db $fd,"up",$fe,"fountain",$fc,"and"    ; [$94a3] char
    db $fd,"the",$fd,"entranceto",$fd       ; [$94b3] char
    db "the",$fd,"tower",$fe,"right",$fd    ; [$94c3] char
    db "above",$fe,"this",$fd,"town."       ; [$94d3] char
    db $fc,"So",$fd,"long.",$ff             ; [$94e3] char

MESSAGE_WINGBOOTS_IN_TOWER:                 ; [$94ed]
    db "T"                                  ; Message 81
    db "he",$fd,"Dwarf",$fe,"who",$fd,"liv" ; [$94ee] char
    db "es",$fe,"in",$fd,"the",$fd,"tower",$fe ; [$94fe] char
    db "has",$fd,"Wing",$fd,"boots.",$fc    ; [$950e] char
    db "When",$fd,"you",$fd,"get",$fe,"the" ; [$951e] char
    db "m,",$fd,"look",$fd,"for",$fe,"a",$fd,"fo" ; [$952e] char
    db "untain",$fe,"in",$fd,"the",$fd,"sk" ; [$953e] char
    db "y.",$ff                             ; [$954e] char

MESSAGE_DIRECTIONS_TO_MASCON:               ; [$9551]
    db "W"                                  ; Message 82
    db "hen",$fd,"you",$fd,"push",$fe,"the" ; [$9552] char
    db $fd,"rock",$fe,"away",$fd,"from",$fd ; [$9562] char
    db "the",$fe,"fountain,",$fc,"yo"       ; [$9572] char
    db "u'll",$fd,"find",$fe,"the",$fd,"pa" ; [$9582] char
    db "ssage",$fe,"to",$fd,"Mascon,"       ; [$9592] char
    db $fc,"but",$fd,"you",$fd,"need",$fe,"th" ; [$95a2] char
    db "e",$fd,"Ring",$fe,"of",$fd,"Ruby.",$ff ; [$95b2] char

MESSAGE_LOOK_FOR_WINGBOOTS:                 ; [$95c2]
    db "L"                                  ; Message 83
    db "ook",$fd,"for",$fe,"Wing",$fd,"Boo" ; [$95c3] char
    db "ts.",$ff                            ; [$95d3] char

MESSAGE_FOUNTAIN_IN_SKY_HINT:               ; [$95d7]
    db "G"                                  ; Message 84
    db "o",$fd,"below",$fd,"the",$fe,"blue" ; [$95d8] char
    db $fd,"sky.",$fd,"You'llfind"          ; [$95e8] char
    db $fd,"a",$fd,"fountain",$fe,"in",$fd,"t" ; [$95f8] char
    db "he",$fd,"sky.",$ff                  ; [$9608] char

MESSAGE_USE_THIS_KEY_FOR_FIRST_SPRING:      ; [$9610]
    db "U"                                  ; Message 85
    db "se",$fd,"this",$fd,"key",$fe,"to",$fd,"o" ; [$9611] char
    db "pen",$fd,"the",$fd,"doorbelo"       ; [$9621] char
    db "w.",$fc,"You'll",$fd,"find",$fd,"t" ; [$9631] char
    db "he",$fe,"first",$fd,"spring."       ; [$9641] char
    db $ff                                  ; [$9651] char

MESSAGE_GET_JOKER_OR_COME_BACK:             ; [$9652]
    db "I"                                  ; Message 86
    db "f",$fd,"you",$fd,"don't",$fe,"have" ; [$9653] char
    db $fd,"a",$fd,"Joker",$fe,"key,",$fe,"co" ; [$9663] char
    db "me",$fd,"back",$fd,"again.",$ff     ; [$9673] char

MESSAGE_HO_HO_HO_ZZZ:                       ; [$9682]
    db "H"                                  ; Message 87
    db "o,",$fd,"ho,",$fd,"ho.",$fe,"I'll",$fd ; [$9683] char
    db "tell",$fd,"you",$fe,"about",$fd,"t" ; [$9693] char
    db "he",$fd,"water",$fe,"of",$fd,"the",$fd ; [$96a3] char
    db "spring.",$fc,".....",$fe,".."       ; [$96b3] char
    db "...",$fe,"Oops!",$fe,"..fall"       ; [$96c3] char
    db "en",$fd,"asleep.",$fc,"The",$fd,"w" ; [$96d3] char
    db "ater",$fd,"was",$fe,"poisone"       ; [$96e3] char
    db "d.",$fc,"The",$fd,"posion",$fd,"is" ; [$96f3] char
    db $fe,"almost",$fd,"gone",$fd,"so",$fe ; [$9703] char
    db "it's",$fd,"all",$fd,"right",$fe,"t" ; [$9713] char
    db "o",$fd,"wake",$fd,"him",$fd,"up.",$fc,"W" ; [$9723] char
    db "atch.",$fe,".....",$fd,"...."       ; [$9733] char
    db ".",$fe,"Something",$fd,"is",$fe,"w" ; [$9743] char
    db "rong...",$fc,"Oops!",$ff            ; [$9753] char

MESSAGE_GET_KEY_FIND_FOUNTAIN:              ; [$9761]
    db "G"                                  ; Message 88
    db "et",$fd,"the",$fd,"key",$fd,"fromt" ; [$9762] char
    db "he",$fd,"Guri",$fd,"in",$fd,"the",$fe,"t" ; [$9772] char
    db "ower",$fd,"of",$fe,"Fortress"       ; [$9782] char
    db $fd,"and",$fc,"search",$fd,"for",$fd ; [$9792] char
    db "the",$fe,"undiscovered"             ; [$97a2] char
    db $fe,"first",$fd,"fountain."          ; [$97b2] char
    db $ff                                  ; [$97c2] char

MESSAGE_THIS_IS_SPRING_OF_TRUNK_GET_ELIXIR: ; [$97c3]
    db "Y"                                  ; Message 89
    db "ou've",$fd,"done",$fd,"wellt"       ; [$97c4] char
    db "o",$fd,"get",$fd,"here.",$fe,"This" ; [$97d4] char
    db $fd,"is",$fd,"the",$fe,"spring",$fd,"o" ; [$97e4] char
    db "f",$fd,"Trunk.",$fc,"You",$fd,"nee" ; [$97f4] char
    db "d",$fd,"Elixir",$fe,"to",$fd,"revi" ; [$9804] char
    db "ve",$fd,"the",$fe,"spring.",$fc,"W" ; [$9814] char
    db "ill",$fd,"you",$fd,"give",$fd,"mey" ; [$9824] char
    db "our",$fd,"medicine?",$ff            ; [$9834] char

MESSAGE_2_MORE_SPRINGS:                     ; [$9842]
    db "T"                                  ; Message 90
    db "his",$fd,"spring",$fd,"willf"       ; [$9843] char
    db "low",$fd,"again.",$fe,"There"       ; [$9853] char
    db $fd,"are",$fe,"two",$fd,"more.",$fc,"Y" ; [$9863] char
    db "ou'd",$fd,"better",$fd,"go",$fe,"a" ; [$9873] char
    db "nd",$fd,"find",$fd,"them.",$ff      ; [$9883] char

MESSAGE_COME_BACK_WITH_MEDICINE:            ; [$9891]
    db "C"                                  ; Message 91
    db "ome",$fd,"back",$fd,"with",$fe,"th" ; [$9892] char
    db "e",$fd,"medicine.",$ff              ; [$98a2] char

MESSAGE_FIND_POISON_IN_MASCON:              ; [$98ae]
    db "A"                                  ; Message 92
    db "s",$fd,"soon",$fd,"as",$fd,"waterf" ; [$98af] char
    db "lows",$fd,"in",$fd,"the",$fe,"foun" ; [$98bf] char
    db "tain,",$fc,"go",$fd,"to",$fd,"Masc" ; [$98cf] char
    db "on",$fd,"andfind",$fd,"the",$fd,"p" ; [$98df] char
    db "oison",$fe,"the",$fd,"Dwarfs"       ; [$98ef] char
    db $fd,"hide,",$fc,"otherwise"          ; [$98ff] char
    db $fd,"the",$fe,"Elves",$fd,"will",$fd ; [$990f] char
    db "be",$fe,"destroyed.",$ff            ; [$991f] char

MESSAGE_WILL_REVIVE_SPRING:                 ; [$992d]
    db "T"                                  ; Message 93
    db "hank",$fd,"you",$fd,"for",$fe,"com" ; [$992e] char
    db "ing.",$fc,"I",$fd,"will",$fd,"revi" ; [$993e] char
    db "ve",$fe,"the",$fd,"spring",$fe,"ri" ; [$994e] char
    db "ght",$fd,"away.",$ff                ; [$995e] char

MESSAGE_GIVING_RING_OF_RUBY:                ; [$9968]
    db "I"                                  ; Message 94
    db "'ll",$fd,"give",$fd,"you",$fe,"the" ; [$9969] char
    db $fd,"Ring",$fd,"of",$fe,"Ruby.",$fc,"N" ; [$9979] char
    db "ow,",$fd,"push",$fd,"the",$fe,"roc" ; [$9989] char
    db "k",$fd,"away",$fd,"from",$fe,"the",$fd ; [$9999] char
    db "fountain.",$ff                      ; [$99a9] char

MESSAGE_TRUST_YOUR_POWER:                   ; [$99b3]
    db "T"                                  ; Message 95
    db "rust",$fe,"your",$fd,"power."       ; [$99b4] char
    db $fc,"You",$fd,"are",$fd,"the",$fe,"cho" ; [$99c4] char
    db "sen",$fd,"warrior",$fe,"to",$fd,"r" ; [$99d4] char
    db "escue",$fe,"this",$fd,"world"       ; [$99e4] char
    db ".",$ff                              ; [$99f4] char

MESSAGE_WELCOME_TO_MASCON:                  ; [$99f6]
    db "W"                                  ; Message 96
    db "hat",$fd,"business",$fd,"doy"       ; [$99f7] char
    db "ou",$fd,"have",$fd,"here?",$fc,"Th" ; [$9a07] char
    db "is",$fd,"is",$fd,"the",$fe,"misty",$fd ; [$9a17] char
    db "town",$fd,"of",$fe,"Mascon.",$ff    ; [$9a27] char

MESSAGE_PREPARE_BEFORE_FOREPAW:             ; [$9a37]
    db "T"                                  ; Message 97
    db "he",$fd,"tower",$fd,"of",$fe,"Fore" ; [$9a38] char
    db "paw",$fd,"is",$fd,"stillfar",$fd    ; [$9a48] char
    db "away.",$fc,"Prepare",$fd,"we"       ; [$9a58] char
    db "ll",$fe,"and",$fd,"go.",$ff         ; [$9a68] char

MESSAGE_METEORITE_BECOMES_POISON:           ; [$9a73]
    db "W"                                  ; Message 98
    db "hen",$fd,"the",$fd,"meteor-i"       ; [$9a74] char
    db "te",$fd,"is",$fd,"dissolvedi"       ; [$9a84] char
    db "n",$fd,"water,",$fc,"it",$fd,"beco" ; [$9a94] char
    db "mes",$fe,"poison",$fd,"which"       ; [$9aa4] char
    db $fe,"will",$fd,"bring",$fe,"sick"    ; [$9ab4] char
    db "ness.",$fc,"It",$fd,"started"       ; [$9ac4] char
    db $fd,"when",$fe,"the",$fd,"Dwarfs"    ; [$9ad4] char
    db $fe,"brought",$fd,"it",$fd,"into"    ; [$9ae4] char
    db $fe,"the",$fd,"World",$fd,"Tree."    ; [$9af4] char
    db $ff                                  ; [$9b04] char

MESSAGE_DID_YOU_GET_PENDANT:                ; [$9b05]
    db "D"                                  ; Message 99
    db "id",$fd,"you",$fd,"get",$fd,"the",$fe,"p" ; [$9b06] char
    db "endant?",$fd,"It",$fd,"wills"       ; [$9b16] char
    db "trengthen",$fd,"your",$fe,"o"       ; [$9b26] char
    db "ffense",$fd,"power.",$ff            ; [$9b36] char

MESSAGE_STORES_OUTSIDE_TOWN:                ; [$9b44]
    db "T"                                  ; Message 100
    db "here",$fd,"are",$fd,"storeso"       ; [$9b45] char
    db "utside",$fd,"town.",$fc,"The"       ; [$9b55] char
    db "y",$fd,"sell",$fd,"usefulite"       ; [$9b65] char
    db "ms,",$fc,"though",$fd,"it's",$fe    ; [$9b75] char
    db "inconvenient",$fd,"to",$fe          ; [$9b85] char
    db "get",$fd,"there.",$fc,"I",$fd,"won" ; [$9b95] char
    db "der",$fd,"if",$fd,"you",$fe,"could" ; [$9ba5] char
    db $fd,"find",$fd,"them.Look",$fd       ; [$9bb5] char
    db "up",$fd,"while",$fe,"you",$fd,"wal" ; [$9bc5] char
    db "k.",$ff                             ; [$9bd5] char

MESSAGE_THIS_IS_LARGE_SHIELD:               ; [$9bd8]
    db "I"                                  ; Message 101
    db "t",$fd,"is",$fd,"a",$fd,"large",$fe,"and" ; [$9bd9] char
    db $fd,"beautiful",$fe,"shiel"          ; [$9be9] char
    db "d.",$ff                             ; [$9bf9] char

MESSAGE_DIRECTIONS_TO_SUFFER:               ; [$9bfc]
    db "T"                                  ; Message 102
    db "he",$fd,"meteorite",$fd,"ism"       ; [$9bfd] char
    db "editated",$fd,"on",$fe,"at",$fd,"t" ; [$9c0d] char
    db "he",$fd,"tower",$fd,"of",$fe,"Suff" ; [$9c1d] char
    db "er.",$fc,"You'll",$fd,"find",$fd    ; [$9c2d] char
    db "the",$fe,"Tower",$fd,"above",$fd    ; [$9c3d] char
    db "a",$fe,"Guru.",$fe,"Be",$fd,"caref" ; [$9c4d] char
    db "ul.",$ff                            ; [$9c5d] char

MESSAGE_NEED_WING_BOOTS_FOR_MIST:           ; [$9c61]
    db "Y"                                  ; Message 103
    db "ou",$fd,"need",$fd,"Wing",$fe,"Boo" ; [$9c62] char
    db "ts",$fc,"in",$fd,"order",$fd,"to",$fd,"g" ; [$9c72] char
    db "et",$fe,"to",$fd,"the",$fd,"misty",$fe ; [$9c82] char
    db "town",$fd,"of",$fd,"Victim.",$fc    ; [$9c92] char
    db "Look",$fd,"for",$fd,"them",$fd,"in" ; [$9ca2] char
    db "the",$fd,"Tower",$fd,"of",$fe,"Suf" ; [$9cb2] char
    db "fer.",$ff                           ; [$9cc2] char

MESSAGE_WELCOME_TO_MIST:                    ; [$9cc7]
    db "T"                                  ; Message 104
    db "his",$fd,"town",$fd,"has",$fe,"bee" ; [$9cc8] char
    db "n",$fd,"covered",$fe,"with",$fd,"a" ; [$9cd8] char
    db $fd,"mist",$fd,"ever",$fc,"since"    ; [$9ce8] char
    db $fd,"the",$fd,"mete-",$fe,"orite"    ; [$9cf8] char
    db $fd,"hit",$fd,"the",$fe,"town.",$fc,"S" ; [$9d08] char
    db "ome",$fd,"areas",$fe,"might",$fd    ; [$9d18] char
    db "still",$fe,"be",$fd,"burning"       ; [$9d28] char
    db ".",$ff                              ; [$9d38] char

MESSAGE_HOUSE_OUTSIDE_ABANDONED:            ; [$9d3a]
    db "T"                                  ; Message 105
    db "he",$fd,"house",$fe,"outside"       ; [$9d3b] char
    db $fd,"town",$fd,"wasabandon"          ; [$9d4b] char
    db "ed",$fc,"and",$fd,"the",$fd,"Dwarf" ; [$9d5b] char
    db "s",$fe,"are",$fd,"living",$fe,"the" ; [$9d6b] char
    db "re.",$fc,"Watch",$fd,"out",$fd,"fo" ; [$9d7b] char
    db "r",$fe,"them.",$ff                  ; [$9d8b] char

MESSAGE_TOWER_OF_SUFFER_SOON:               ; [$9d93]
    db "Y"                                  ; Message 106
    db "ou'll",$fd,"get",$fd,"to",$fe,"the" ; [$9d94] char
    db $fd,"Tower",$fd,"of",$fe,"Suffer"    ; [$9da4] char
    db $fd,"soon.",$ff                      ; [$9db4] char

MESSAGE_KEEP_PENDANT:                       ; [$9dbb]
    db "T"                                  ; Message 107
    db "he",$fd,"pendant",$fd,"has",$fe,"b" ; [$9dbc] char
    db "een",$fd,"a",$fd,"treasure",$fe,"o" ; [$9dcc] char
    db "f",$fd,"the",$fd,"town.",$fc,"But",$fd ; [$9ddc] char
    db "it",$fd,"is",$fd,"best",$fe,"for",$fd,"t" ; [$9dec] char
    db "he",$fd,"town",$fd,"if",$fe,"you",$fd,"k" ; [$9dfc] char
    db "eep",$fd,"it.",$ff                  ; [$9e0c] char

MESSAGE_DWARVES_CHANTING:                   ; [$9e14]
    db "T"                                  ; Message 108
    db "he",$fd,"Dwarfs",$fd,"are",$fe,"ch" ; [$9e15] char
    db "anting",$fd,"their",$fe,"man"       ; [$9e25] char
    db "tras",$fc,"to",$fd,"a",$fd,"segmen" ; [$9e35] char
    db "t",$fd,"of",$fe,"the",$fd,"meteori" ; [$9e45] char
    db "te.",$fc,"They",$fd,"believe"       ; [$9e55] char
    db $fd,"it",$fe,"has",$fd,"special",$fe ; [$9e65] char
    db "cosmic",$fd,"power.",$ff            ; [$9e75] char

MESSAGE_METEORITE_WAS_MOVED:                ; [$9e83]
    db "T"                                  ; Message 109
    db "he",$fd,"meteorite",$fe,"whi"       ; [$9e84] char
    db "ch",$fd,"was",$fd,"in",$fd,"theTow" ; [$9e94] char
    db "er",$fd,"of",$fd,"Suffer",$fc,"has" ; [$9ea4] char
    db $fd,"been",$fd,"moved",$fe,"to",$fd,"t" ; [$9eb4] char
    db "he",$fd,"Tower",$fd,"of",$fe,"Mist" ; [$9ec4] char
    db ".",$fc,"The",$fd,"Dwarfs",$fd,"mus" ; [$9ed4] char
    db "t",$fe,"have",$fd,"learned",$fd,"o" ; [$9ee4] char
    db "f",$fe,"your",$fd,"coming.",$ff     ; [$9ef4] char

MESSAGE_HOUR_GLASS:                         ; [$9f03]
    db "T"                                  ; Message 110
    db "hey",$fd,"say",$fd,"the",$fe,"Hour" ; [$9f04] char
    db $fd,"Glass",$fd,"will",$fe,"enab"    ; [$9f14] char
    db "le",$fd,"you",$fc,"to",$fd,"move",$fd,"a" ; [$9f24] char
    db "round",$fe,"while",$fd,"the",$fd    ; [$9f34] char
    db "time",$fe,"stops.",$ff              ; [$9f44] char

MESSAGE_HOUR_GLASS_USES_ENERGY:             ; [$9f50]
    db "T"                                  ; Message 111
    db "he",$fd,"Hour",$fd,"Glass",$fe,"wi" ; [$9f51] char
    db "ll",$fd,"exhaust",$fe,"your",$fd    ; [$9f61] char
    db "energy,",$fc,"so",$fd,"be",$fd,"ca" ; [$9f71] char
    db "reful",$fe,"when",$fd,"you",$fd,"u" ; [$9f81] char
    db "se",$fd,"it.",$ff                   ; [$9f91] char

MESSAGE_WELCOME_TO_VICTIM:                  ; [$9f98]
    db "W"                                  ; Message 112
    db "elcome",$fd,"to",$fd,"the",$fe,"To" ; [$9f99] char
    db "wn",$fd,"of",$fd,"Victim.",$fc,"I",$fd ; [$9fa9] char
    db "have",$fd,"been",$fe,"unable"       ; [$9fb9] char
    db $fd,"to",$fd,"leave",$fe,"town.",$ff ; [$9fc9] char

MESSAGE_DANGEROUS_WITHOUT_MAGIC:            ; [$9fd9]
    db "I"                                  ; Message 113
    db "t",$fd,"is",$fd,"dangerous",$fe,"t" ; [$9fda] char
    db "o",$fd,"leave",$fd,"town",$fe,"unl" ; [$9fea] char
    db "ess",$fd,"you",$fd,"have",$fe,"a",$fd,"m" ; [$9ffa] char
    db "agic",$fd,"shield.",$ff             ; [$a00a] char

MESSAGE_MAGIC_HALL_OUTSIDE_TOWN:            ; [$a017]
    db "T"                                  ; Message 114
    db "here",$fd,"is",$fd,"a",$fd,"magich" ; [$a018] char
    db "all",$fd,"outside",$fe,"town"       ; [$a028] char
    db ".",$ff                              ; [$a038] char

MESSAGE_MAGIC_CANE:                         ; [$a03a]
    db "T"                                  ; Message 115
    db "here",$fd,"is",$fd,"a",$fd,"magicc" ; [$a03b] char
    db "ane",$fd,"which",$fd,"will",$fe,"g" ; [$a04b] char
    db "ive",$fd,"you",$fd,"magic",$fe,"po" ; [$a05b] char
    db "wer.",$ff                           ; [$a06b] char

MESSAGE_GO_TO_CAPITAL:                      ; [$a070]
    db "T"                                  ; Message 116
    db "he",$fd,"door",$fd,"to",$fd,"the",$fe,"C" ; [$a071] char
    db "apital",$fd,"town",$fe,"belo"       ; [$a081] char
    db "w",$fd,"is",$fd,"open.",$fe,"Go",$fd,"to" ; [$a091] char
    db $fd,"it",$fd,"now.",$ff              ; [$a0a1] char

MESSAGE_GOT_ARMOR_FOR_BOTTLE:               ; [$a0aa]
    db "I"                                  ; Message 117
    db "t",$fd,"was",$fd,"only",$fd,"a",$fe,"rum" ; [$a0ab] char
    db "or.",$fd,"Sorry",$fe,"about",$fd    ; [$a0bb] char
    db "that.",$fc,"I",$fd,"got",$fd,"this" ; [$a0cb] char
    db $fd,"armorin",$fd,"exchang"          ; [$a0db] char
    db "e",$fd,"for",$fe,"a",$fd,"bottle.",$fc ; [$a0eb] char
    db "If",$fd,"you",$fd,"wish,",$fe,"you" ; [$a0fb] char
    db $fd,"can",$fd,"have",$fd,"it.",$ff   ; [$a10b] char

MESSAGE_ILL_HAVE_DRINK:                     ; [$a119]
    db "I"                                  ; Message 118
    db "'ll",$fd,"have",$fd,"a",$fe,"drink" ; [$a11a] char
    db ".",$fe,"Well...",$fe,"not",$fd,"ye" ; [$a12a] char
    db "t.",$ff                             ; [$a13a] char

MESSAGE_IM_LOST:                            ; [$a13d]
    db "L"                                  ; Message 119
    db "ooks",$fd,"like",$fe,"I'm",$fd,"lo" ; [$a13e] char
    db "st.",$ff                            ; [$a14e] char

MESSAGE_IM_LOST_MAGIC_DOES_NOT_WORK:        ; [$a152]
    db "I"                                  ; Message 120
    db "'m",$fd,"lost.",$fe,"My",$fd,"magi" ; [$a153] char
    db "c",$fe,"does",$fd,"not",$fd,"work." ; [$a163] char
    db $ff                                  ; [$a173] char

MESSAGE_MAGIC_OF_JUSTICE_OR_DESTRUCTION:    ; [$a174]
    db "I"                                  ; Message 121
    db "t",$fd,"can",$fd,"be",$fd,"magic",$fe,"o" ; [$a175] char
    db "f",$fd,"justice",$fe,"or",$fd,"a",$fd,"m" ; [$a185] char
    db "agic",$fd,"of",$fe,"destruct"       ; [$a195] char
    db "ion.",$fc,"It",$fd,"all",$fd,"depe" ; [$a1a5] char
    db "nds",$fe,"on",$fd,"who",$fd,"uses",$fd ; [$a1b5] char
    db "it.",$ff                            ; [$a1c5] char

MESSAGE_MAGIC_INDIVIDUAL_POWERS:            ; [$a1c9]
    db "M"                                  ; Message 122
    db "agics",$fd,"have",$fe,"indiv"       ; [$a1ca] char
    db "idual",$fe,"powers.",$ff            ; [$a1da] char

MESSAGE_MAGIC_CONSUMES_POWER:               ; [$a1e8]
    db "M"                                  ; Message 123
    db "agic",$fd,"of",$fd,"offencei"       ; [$a1e9] char
    db "s",$fd,"effective,",$fe,"but"       ; [$a1f9] char
    db $fd,"it",$fd,"consumes",$fe,"pow"    ; [$a209] char
    db "er.",$ff                            ; [$a219] char

MESSAGE_METEORITE_BECOMES_BLACK_ONYX:       ; [$a21d]
    db "W"                                  ; Message 124
    db "hen",$fd,"you",$fd,"hold",$fe,"the" ; [$a21e] char
    db $fd,"Dwarf's",$fe,"meteori"          ; [$a22e] char
    db "te",$fd,"in",$fe,"your",$fd,"hand," ; [$a23e] char
    db $fc,"it",$fd,"will",$fd,"become",$fe ; [$a24e] char
    db "Black",$fd,"Onyx",$fd,"with",$fe    ; [$a25e] char
    db "power",$fd,"inside.",$ff            ; [$a26e] char

MESSAGE_DIRECTIONS_TO_TOWER_OF_MIST:        ; [$a27c]
    db "I"                                  ; Message 125
    db "f",$fd,"you",$fd,"go",$fe,"straigh" ; [$a27d] char
    db "t",$fd,"ahead,",$fc,"you",$fd,"wil" ; [$a28d] char
    db "l",$fd,"get",$fd,"to",$fe,"the",$fd,"Tow" ; [$a29d] char
    db "er",$fd,"of",$fe,"Mist.",$fc,"If",$fd,"y" ; [$a2ad] char
    db "ou",$fd,"defeat",$fe,"the",$fd,"dw" ; [$a2bd] char
    db "arf",$fd,"who",$fe,"lives",$fd,"in" ; [$a2cd] char
    db $fd,"the",$fe,"Tower",$fc,"and",$fd,"g" ; [$a2dd] char
    db "et",$fd,"the",$fe,"meteorite"       ; [$a2ed] char
    db ",",$fe,"come",$fd,"back",$fd,"here" ; [$a2fd] char
    db ".",$ff                              ; [$a30d] char

MESSAGE_USE_KEY_FOR_CONFLATE:               ; [$a30f]
    db "A"                                  ; Message 126
    db "s",$fd,"long",$fd,"as",$fd,"therea" ; [$a310] char
    db "re",$fd,"crazed",$fe,"Dwarfs"       ; [$a320] char
    db ",",$fc,"the",$fd,"deadly",$fe,"thr" ; [$a330] char
    db "eat",$fd,"of",$fd,"the",$fe,"meteo" ; [$a340] char
    db "rite",$fc,"will",$fd,"loom",$fd,"o" ; [$a350] char
    db "ver",$fe,"the",$fd,"Elves.",$fc,"U" ; [$a360] char
    db "se",$fd,"this",$fd,"key",$fd,"to",$fe,"o" ; [$a370] char
    db "pen",$fd,"the",$fd,"next",$fe,"doo" ; [$a380] char
    db "r",$fd,"to",$fd,"get",$fd,"to",$fe,"Conf" ; [$a390] char
    db "late.",$fc,"Fight",$fd,"for",$fd    ; [$a3a0] char
    db "the",$fe,"Elves.",$ff               ; [$a3b0] char

MESSAGE_YOU_NEED_KEY_ACE:                   ; [$a3bb]
    db "I"                                  ; Message 127
    db $fd,"give",$fd,"keys",$fd,"to",$fe,"tr" ; [$a3bc] char
    db "avelers",$fd,"like",$fe,"you"       ; [$a3cc] char
    db "rself.",$fc,"You",$fd,"have",$fd    ; [$a3dc] char
    db "an",$fe,"\"Ace\"",$fd,"key,",$fe,"do" ; [$a3ec] char
    db "n't",$fd,"you?",$ff                 ; [$a3fc] char

MESSAGE_WELCOME_TO_CONFLATE:                ; [$a405]
    db "T"                                  ; Message 128
    db "his",$fd,"is",$fd,"a",$fe,"trading" ; [$a406] char
    db $fd,"town",$fe,"called",$fe,"Con"    ; [$a416] char
    db "flate.",$ff                         ; [$a426] char

MESSAGE_LEGENDARY_SHIELD_HELMET:            ; [$a42d]
    db "Y"                                  ; Message 129
    db "ou'll",$fd,"find",$fd,"the",$fe,"l" ; [$a42e] char
    db "egendary",$fd,"shielda"             ; [$a43e] char
    db "nd",$fd,"helmet",$fc,"in",$fd,"the" ; [$a44e] char
    db $fd,"World",$fd,"of",$fe,"Branch"    ; [$a45e] char
    db ".",$ff                              ; [$a46e] char

MESSAGE_TOWN_SURROUNDED_BY_DOORS:           ; [$a470]
    db "T"                                  ; Message 130
    db "he",$fd,"town",$fd,"is",$fe,"surro" ; [$a471] char
    db "unded",$fd,"by",$fe,"doors",$fd,"f" ; [$a481] char
    db "or",$fe,"protection.",$ff           ; [$a491] char

MESSAGE_SEE_GURU_AFTER_SHIELD_HELMET:       ; [$a4a0]
    db "W"                                  ; Message 131
    db "hen",$fd,"you",$fd,"get",$fd,"thes" ; [$a4a1] char
    db "hield",$fd,"and",$fe,"helmet"       ; [$a4b1] char
    db ",",$fd,"go",$fd,"to",$fe,"see",$fd,"the",$fd ; [$a4c1] char
    db "Guru.",$ff                          ; [$a4d1] char

MESSAGE_GUARDIAN_OF_GURU:                   ; [$a4d7]
    db "I"                                  ; Message 132
    db $fd,"am",$fd,"a",$fd,"guardian",$fe,"o" ; [$a4d8] char
    db "f",$fd,"the",$fd,"Guru.",$fe,"He",$fd,"i" ; [$a4e8] char
    db "s",$fd,"an",$fd,"im-",$fe,"portant" ; [$a4f8] char
    db $fd,"person.",$ff                    ; [$a508] char

MESSAGE_SOMETHING_YOU_CAN_GET:              ; [$a511]
    db "T"                                  ; Message 133
    db "here",$fd,"should",$fd,"be",$fe,"s" ; [$a512] char
    db "omething",$fd,"you",$fe,"can"       ; [$a522] char
    db $fd,"get.",$ff                       ; [$a532] char

MESSAGE_DONT_RELY_ON_MAGIC_FINAL_BATTLE:    ; [$a538]
    db "D"                                  ; Message 134
    db "on't",$fd,"rely",$fd,"on",$fe,"you" ; [$a539] char
    db "r",$fd,"magic",$fd,"power",$fc,"du" ; [$a549] char
    db "ring",$fd,"the",$fd,"finalba"       ; [$a559] char
    db "ttle",$fd,"with",$fd,"the",$fe,"Dw" ; [$a569] char
    db "arfs.",$ff                          ; [$a579] char

MESSAGE_USED_TO_TRADE_WITH_DWARVES:         ; [$a57f]
    db "T"                                  ; Message 135
    db "he",$fd,"town",$fd,"used",$fd,"top" ; [$a580] char
    db "rosper",$fd,"from",$fe,"trad"       ; [$a590] char
    db "ing",$fd,"with",$fd,"theDwar"       ; [$a5a0] char
    db "fs.",$ff                            ; [$a5b0] char

MESSAGE_USED_TO_BE_SKILLED:                 ; [$a5b4]
    db "T"                                  ; Message 136
    db "hey",$fd,"are",$fe,"terrible"       ; [$a5b5] char
    db $fd,"now,",$fc,"but",$fd,"they",$fd,"u" ; [$a5c5] char
    db "sed",$fd,"tobe",$fd,"skilled"       ; [$a5d5] char
    db $fe,"craftsmen.",$ff                 ; [$a5e5] char

MESSAGE_USED_TO_VISIT_DWARVES:              ; [$a5f1]
    db "I"                                  ; Message 137
    db $fd,"used",$fd,"to",$fd,"go",$fd,"to",$fe,"t" ; [$a5f2] char
    db "he",$fd,"town",$fd,"of",$fe,"Dwarf" ; [$a602] char
    db "s",$fd,"quite",$fe,"often",$fc,"wh" ; [$a612] char
    db "en",$fd,"we",$fd,"had",$fe,"busine" ; [$a622] char
    db "ss",$fd,"with",$fe,"them.",$ff      ; [$a632] char

MESSAGE_I_AM_PICKPOCKET:                    ; [$a640]
    db "D"                                  ; Message 138
    db "o",$fd,"you",$fd,"want",$fd,"to",$fe,"kn" ; [$a641] char
    db "ow",$fd,"what",$fd,"I",$fd,"do?",$fc,"I",$fd ; [$a651] char
    db "am",$fe,"the",$fd,"pickpocke"       ; [$a661] char
    db "t",$fe,"Gingi.",$fc,"I'm",$fd,"an",$fd ; [$a671] char
    db "importantperson",$fd                ; [$a681] char
    db "around",$fe,"here.",$ff             ; [$a691] char

MESSAGE_NEED_FINAL_WEAPON_ARMOR:            ; [$a69e]
    db "D"                                  ; Message 139
    db "on't",$fd,"rely",$fd,"on",$fe,"you" ; [$a69f] char
    db "r",$fd,"magic",$fd,"power",$fc,"on" ; [$a6af] char
    db "ly",$fd,"during",$fd,"the",$fe,"fi" ; [$a6bf] char
    db "nal",$fd,"fight",$fe,"agains"       ; [$a6cf] char
    db "t",$fd,"the",$fe,"Dwarfs.",$fc,"Yo" ; [$a6df] char
    db "u",$fd,"can",$fd,"wear",$fd,"theBa" ; [$a6ef] char
    db "ttle",$fd,"Helmet",$fe,"and",$fd    ; [$a6ff] char
    db "Battle",$fd,"Suit",$fc,"only"       ; [$a70f] char
    db $fd,"when",$fd,"you",$fe,"have",$fd,"t" ; [$a71f] char
    db "he",$fd,"Dragon",$fe,"Slayer"       ; [$a72f] char
    db ".",$fc,"You",$fd,"will",$fd,"not",$fd,"b" ; [$a73f] char
    db "e",$fe,"able",$fd,"to",$fd,"return" ; [$a74f] char
    db $fe,"us",$fd,"the",$fd,"Dragon",$fe,"S" ; [$a75f] char
    db "layer",$fc,"until",$fd,"we",$fd,"h" ; [$a76f] char
    db "ave",$fe,"true",$fd,"peace",$fd,"h" ; [$a77f] char
    db "ere.",$ff                           ; [$a78f] char

MESSAGE_DIRECTIONS_DARTMORE:                ; [$a794]
    db "D"                                  ; Message 140
    db "on't",$fd,"rely",$fd,"on",$fe,"you" ; [$a795] char
    db "r",$fd,"magic",$fd,"power",$fc,"al" ; [$a7a5] char
    db "one",$fd,"during",$fd,"thela"       ; [$a7b5] char
    db "st",$fd,"fight",$fe,"against"       ; [$a7c5] char
    db $fd,"the",$fe,"Dwarfs.",$fc,"You"    ; [$a7d5] char
    db $fd,"can",$fd,"wear",$fd,"theBat"    ; [$a7e5] char
    db "tle",$fd,"Helmet",$fe,"and",$fd,"B" ; [$a7f5] char
    db "attle",$fd,"Suit",$fc,"only",$fd    ; [$a805] char
    db "when",$fd,"you",$fe,"have",$fd,"th" ; [$a815] char
    db "e",$fd,"Dragon",$fe,"Slayer."       ; [$a825] char
    db $fc,"You",$fd,"will",$fd,"not",$fd,"be" ; [$a835] char
    db $fe,"able",$fd,"to",$fd,"return",$fe ; [$a845] char
    db "us",$fd,"the",$fd,"Dragon",$fe,"Sl" ; [$a855] char
    db "ayer",$fc,"until",$fd,"we",$fd,"ha" ; [$a865] char
    db "ve",$fe,"true",$fd,"peace",$fd,"he" ; [$a875] char
    db "re.",$fc,"This",$fd,"ring",$fd,"wi" ; [$a885] char
    db "ll",$fe,"open",$fd,"the",$fd,"door" ; [$a895] char
    db $fd,"toDartmoor.",$fd,"Tak"          ; [$a8a5] char
    db "e",$fe,"it",$fd,"with",$fd,"you.",$ff ; [$a8b5] char

MESSAGE_DIRECTIONS_DAYBREAK:                ; [$a8c4]
    db "D"                                  ; Message 141
    db "aydreak",$fd,"is",$fd,"a",$fe,"tow" ; [$a8c5] char
    db "n",$fd,"at",$fd,"the",$fe,"border." ; [$a8d5] char
    db $ff                                  ; [$a8e5] char

MESSAGE_FRIENDS_IN_DARTMOOR:                ; [$a8e6]
    db "I"                                  ; Message 142
    db $fd,"have",$fd,"friends",$fe,"in"    ; [$a8e7] char
    db $fd,"Dartmoor",$fc,"which",$fd       ; [$a8f7] char
    db "is",$fd,"known",$fe,"as",$fd,"an",$fd,"e" ; [$a907] char
    db "vil",$fe,"place.",$ff               ; [$a917] char

MESSAGE_LOOK_FOR_BATTLE_SUIT:               ; [$a922]
    db "L"                                  ; Message 143
    db "ook",$fd,"for",$fd,"the",$fe,"Batt" ; [$a923] char
    db "le",$fd,"Suit.",$ff                 ; [$a933] char

MESSAGE_FIND_MAGIC_CANE:                    ; [$a93c]
    db "D"                                  ; Message 144
    db "id",$fd,"you",$fd,"find",$fd,"them" ; [$a93d] char
    db "agic",$fd,"cane?",$ff               ; [$a94d] char

MESSAGE_YOU_ARE_FAMOUS_GOOD_LOOKING:        ; [$a958]
    db "Y"                                  ; Message 145
    db "ou",$fd,"are",$fd,"the",$fe,"famou" ; [$a959] char
    db "s",$fd,"warrior.",$fc,"You",$fd,"a" ; [$a969] char
    db "re",$fd,"as",$fd,"good",$fe,"looki" ; [$a979] char
    db "ng",$fd,"as",$fd,"I've",$fe,"heard" ; [$a989] char
    db ".",$ff                              ; [$a999] char

MESSAGE_AUTOGRAPH:                          ; [$a99b]
    db "Y"                                  ; Message 146
    db "ou",$fd,"are",$fd,"the",$fe,"warri" ; [$a99c] char
    db "or",$fd,"everyoneis",$fd,"ta"       ; [$a9ac] char
    db "lking",$fe,"about.",$fc,"Cou"       ; [$a9bc] char
    db "ld",$fd,"I",$fd,"have",$fe,"your",$fd,"a" ; [$a9cc] char
    db "utograph?",$fc,"Are",$fd,"yo"       ; [$a9dc] char
    db "u",$fd,"busy",$fe,"now?",$fd,"Well" ; [$a9ec] char
    db ",",$fd,"will",$fe,"you",$fd,"come",$fd ; [$a9fc] char
    db "to",$fe,"visit",$fd,"me?",$fc,"My",$fd ; [$aa0c] char
    db "name",$fd,"is",$fd,"Moto.Ple"       ; [$aa1c] char
    db "ase",$fd,"don't",$fe,"forget"       ; [$aa2c] char
    db ".",$ff                              ; [$aa3c] char

MESSAGE_WHEN_TAKE_BATH:                     ; [$aa3e]
    db "L"                                  ; Message 147
    db "ook",$fd,"at",$fd,"you!",$fe,"When" ; [$aa3f] char
    db $fd,"did",$fd,"you",$fe,"last",$fd,"ta" ; [$aa4f] char
    db "ke",$fd,"a",$fe,"bath?",$ff         ; [$aa5f] char

MESSAGE_GURU_CONFLATE_HAS_RING_DWARVES:     ; [$aa6a]
    db "T"                                  ; Message 148
    db "he",$fd,"Guru",$fd,"of",$fe,"Confl" ; [$aa6b] char
    db "ate",$fd,"has",$fd,"theRing",$fd    ; [$aa7b] char
    db "of",$fd,"Dwarfs.",$ff               ; [$aa8b] char

MESSAGE_DID_YOU_GET_BATTLE_SUIT:            ; [$aa96]
    db "D"                                  ; Message 149
    db "id",$fd,"you",$fd,"get",$fd,"the",$fe,"B" ; [$aa97] char
    db "attle",$fd,"Suit?",$ff              ; [$aaa7] char

MESSAGE_DARTMORE_IS_MAZE:                   ; [$aab3]
    db "T"                                  ; Message 150
    db "he",$fd,"castle",$fd,"of",$fe,"Dar" ; [$aab4] char
    db "tmoor",$fd,"is",$fd,"a",$fe,"compl" ; [$aac4] char
    db "ex",$fd,"maze.",$ff                 ; [$aad4] char

MESSAGE_IS_FIRST_VISIT_TO_STORE:            ; [$aadd]
    db "I"                                  ; Message 151
    db "s",$fd,"this",$fd,"your",$fe,"firs" ; [$aade] char
    db "t",$fd,"visit",$fd,"to",$fe,"this",$fd ; [$aaee] char
    db "store?",$fe,"It",$fd,"is",$fd,"my",$fd ; [$aafe] char
    db "first.",$ff                         ; [$ab0e] char

MESSAGE_MAGIC_CANE_ABOVE_TOWER:             ; [$ab15]
    db "H"                                  ; Message 152
    db "ave",$fd,"not",$fd,"seen",$fe,"you" ; [$ab16] char
    db $fd,"for",$fd,"a",$fd,"while.You"    ; [$ab26] char
    db "'ll",$fd,"find",$fd,"a",$fe,"magic" ; [$ab36] char
    db $fd,"cane",$fc,"when",$fd,"you",$fd,"g" ; [$ab46] char
    db "et",$fe,"above",$fd,"the",$fd,"tow" ; [$ab56] char
    db "er",$fe,"of",$fd,"Pillar.",$ff      ; [$ab66] char

MESSAGE_DIRECTIONS_TO_FRATERNAL:            ; [$ab74]
    db "T"                                  ; Message 153
    db "here",$fd,"is",$fd,"the",$fe,"Cast" ; [$ab75] char
    db "le",$fd,"of",$fe,"Fraternal",$fc    ; [$ab85] char
    db "down",$fd,"below",$fd,"the",$fe,"t" ; [$ab95] char
    db "own",$fd,"of",$fe,"Dartmoor."       ; [$aba5] char
    db $ff                                  ; [$abb5] char

MESSAGE_YOU_NEED_DEMONS_RING:               ; [$abb6]
    db "Y"                                  ; Message 154
    db "ou",$fd,"need",$fd,"the",$fe,"Demo" ; [$abb7] char
    db "n's",$fd,"Ring",$fc,"to",$fd,"get",$fd ; [$abc7] char
    db "into",$fd,"the",$fe,"fortres"       ; [$abd7] char
    db "s",$fd,"of",$fe,"Zenis.",$ff        ; [$abe7] char

MESSAGE_KING_GRIEVE_HAS_DRAGON_SLAYER:      ; [$abf3]
    db "D"                                  ; Message 155
    db "ragon",$fd,"Slayer",$fd,"isi"       ; [$abf4] char
    db "n",$fd,"the",$fd,"hands",$fd,"of",$fe,"k" ; [$ac04] char
    db "ing",$fd,"of",$fd,"the",$fe,"Dwarf" ; [$ac14] char
    db "s.",$ff                             ; [$ac24] char

MESSAGE_DEFEAT_EVIL_WITH_DRAGON_SLAYER:     ; [$ac27]
    db "D"                                  ; Message 156
    db "efeat",$fd,"the",$fd,"Evil",$fe,"o" ; [$ac28] char
    db "ne",$fd,"with",$fd,"Dragon",$fe,"S" ; [$ac38] char
    db "layer.",$ff                         ; [$ac48] char

MESSAGE_GO_TO_FRATERNAL_GURU:               ; [$ac4f]
    db "G"                                  ; Message 157
    db "o",$fd,"to",$fd,"see",$fd,"the",$fe,"Gur" ; [$ac50] char
    db "u",$fd,"in",$fd,"the",$fe,"Castle",$fd ; [$ac60] char
    db "of",$fe,"Fraternal.",$ff            ; [$ac70] char

MESSAGE_GURU_HAS_DEMONS_RING:               ; [$ac7e]
    db "I"                                  ; Message 158
    db "f",$fd,"you",$fd,"see",$fd,"the",$fe,"Gu" ; [$ac7f] char
    db "ru,",$fd,"he'll",$fd,"giveyo"       ; [$ac8f] char
    db "u",$fd,"the",$fd,"Demon's",$fe,"Ri" ; [$ac9f] char
    db "ng.",$ff                            ; [$acaf] char

MESSAGE_SEARCH_CASTLE_FOR_GURU:             ; [$acb3]
    db "S"                                  ; Message 159
    db "earch",$fd,"inside",$fe,"the"       ; [$acb4] char
    db $fd,"castle.",$fe,"You",$fd,"sho"    ; [$acc4] char
    db "uld",$fd,"find",$fe,"a",$fd,"Guru." ; [$acd4] char
    db $ff                                  ; [$ace4] char

MESSAGE_EVIL_IMMUNE_TO_MAGIC:               ; [$ace5]
    db "T"                                  ; Message 160
    db "he",$fd,"magic",$fd,"of",$fe,"offe" ; [$ace6] char
    db "nce",$fd,"does",$fd,"notwork"       ; [$acf6] char
    db $fd,"against",$fd,"theEvil"          ; [$ad06] char
    db $fd,"one.",$ff                       ; [$ad16] char

MESSAGE_METEORITE_EXPOSITION_2:             ; [$ad1c]
    db "T"                                  ; Message 161
    db "he",$fd,"Dwarfs",$fd,"re-",$fe,"ga" ; [$ad1d] char
    db "rd",$fd,"the",$fd,"meteor-it"       ; [$ad2d] char
    db "e",$fd,"as",$fd,"a",$fd,"cosmic",$fe,"me" ; [$ad3d] char
    db "ssenger.",$fc,"It",$fd,"is",$fd,"a" ; [$ad4d] char
    db $fd,"dreadfulthing",$fd,"a"          ; [$ad5d] char
    db "s",$fd,"you",$fe,"already",$fd,"kn" ; [$ad6d] char
    db "ow.",$fc,"It",$fd,"turns",$fd,"int" ; [$ad7d] char
    db "o",$fd,"a",$fe,"poison",$fd,"when",$fe ; [$ad8d] char
    db "dissolved",$fd,"in",$fe,"wat"       ; [$ad9d] char
    db "er.",$fc,"It",$fd,"is",$fd,"not",$fd,"in" ; [$adad] char
    db "con-ceivable",$fd,"tha"             ; [$adbd] char
    db "t",$fc,"you",$fd,"would",$fd,"ex-",$fe ; [$adcd] char
    db "perience",$fd,"mental",$fe          ; [$addd] char
    db "and",$fd,"physical",$fe,"cha"       ; [$aded] char
    db "nges",$fc,"when",$fd,"you",$fd,"ar" ; [$adfd] char
    db "e",$fe,"near",$fd,"or",$fd,"touch",$fe ; [$ae0d] char
    db "it.",$fc,"That",$fd,"is",$fd,"why",$fd ; [$ae1d] char
    db "the",$fe,"Dwarfs",$fd,"have",$fe    ; [$ae2d] char
    db "changed",$fd,"and",$fd,"gone"       ; [$ae3d] char
    db "crazy.",$ff                         ; [$ae4d] char

MESSAGE_DEFEATED_KING_GRIEVE:               ; [$ae54]
    db "T"                                  ; Message 162
    db "he",$fd,"monster",$fe,"you'v"       ; [$ae55] char
    db "e",$fd,"just",$fd,"de-",$fe,"feate" ; [$ae65] char
    db "d",$fd,"is",$fd,"King",$fe,"Grieve" ; [$ae75] char
    db ",",$fc,"the",$fd,"king",$fd,"of",$fd,"th" ; [$ae85] char
    db "e",$fe,"Dwarfs.",$fd,"The",$fd,"Ev" ; [$ae95] char
    db "ilOne",$fd,"changed",$fd,"hi"       ; [$aea5] char
    db "s",$fe,"appearance.",$fc,"Th"       ; [$aeb5] char
    db "e",$fd,"king",$fd,"pro-",$fe,"tect" ; [$aec5] char
    db "ed",$fd,"the",$fd,"swordfrom"       ; [$aed5] char
    db $fd,"the",$fd,"Evil",$fe,"One",$fc,"by" ; [$aee5] char
    db $fd,"hiding",$fd,"it",$fe,"withi"    ; [$aef5] char
    db "n",$fd,"his",$fd,"own",$fe,"body.",$fc ; [$af05] char
    db "Use",$fd,"the",$fd,"sword",$fd,"to" ; [$af15] char
    db "defeat",$fd,"the",$fd,"Evil",$fe    ; [$af25] char
    db "One",$fd,"in",$fd,"the",$fe,"fortr" ; [$af35] char
    db "ess.",$fc,"This",$fd,"will",$fd,"o" ; [$af45] char
    db "pen",$fe,"the",$fd,"door",$fd,"to",$fd ; [$af55] char
    db "the",$fe,"fortress.",$ff            ; [$af65] char

MESSAGE_ILL_MEDITATE_FOR_YOU:               ; [$af73]
    db "I"                                  ; Message 163
    db "'ll",$fd,"meditate",$fe,"for"       ; [$af74] char
    db $fd,"you.",$ff                       ; [$af84] char

MESSAGE_GLAD_YOURE_BACK:                    ; [$af8a]
    db "G"                                  ; Message 164
    db "lad",$fd,"to",$fd,"have",$fd,"youb" ; [$af8b] char
    db "ack",$fd,"safely.",$fc,"It",$fd,"w" ; [$af9b] char
    db "ill",$fd,"take",$fe,"time,",$fe,"b" ; [$afab] char
    db "ut",$fd,"the",$fd,"Elves",$fe,"and" ; [$afbb] char
    db $fd,"the",$fd,"Dwarfs",$fc,"will"    ; [$afcb] char
    db $fd,"become",$fe,"friends",$fd       ; [$afdb] char
    db "and",$fd,"re-",$fe,"turn",$fd,"the" ; [$afeb] char
    db $fd,"peace",$fe,"to",$fd,"this",$fd,"l" ; [$affb] char
    db "and",$fc,"as",$fd,"it",$fd,"used",$fd,"t" ; [$b00b] char
    db "o",$fe,"be.",$fd,"I",$fd,"understa" ; [$b01b] char
    db "ndyou",$fd,"will",$fd,"leave"       ; [$b02b] char
    db $fc,"to",$fd,"continue",$fd,"you"    ; [$b03b] char
    db "rjourney.",$fe,"What",$fd,"a"       ; [$b04b] char
    db $fd,"restless",$fe,"guy!",$ff        ; [$b05b] char

MESSAGE_MARK_OF_QUEEN:                      ; [$b06a]
    db "T"                                  ; Message 165
    db "here",$fd,"is",$fd,"the",$fe,"mark" ; [$b06b] char
    db $fd,"of",$fd,"\"Queen\"",$fe,"by",$fd,"t" ; [$b07b] char
    db "he",$fd,"key",$fd,"hole.",$ff       ; [$b08b] char

MESSAGE_MARK_OF_KING:                       ; [$b098]
    db "T"                                  ; Message 166
    db "here",$fd,"is",$fd,"the",$fe,"mark" ; [$b099] char
    db $fd,"of",$fd,"\"King\"",$fe,"by",$fd,"th" ; [$b0a9] char
    db "e",$fd,"key",$fd,"hole.",$ff        ; [$b0b9] char

MESSAGE_MARK_OF_ACE:                        ; [$b0c5]
    db "T"                                  ; Message 167
    db "here",$fd,"is",$fd,"the",$fe,"mark" ; [$b0c6] char
    db $fd,"of",$fd,"\"Ace\"",$fe,"by",$fd,"the" ; [$b0d6] char
    db $fd,"key",$fd,"hole.",$ff            ; [$b0e6] char

MESSAGE_MARK_OF_JOKER:                      ; [$b0f1]
    db "T"                                  ; Message 168
    db "here",$fd,"is",$fd,"the",$fe,"mark" ; [$b0f2] char
    db $fd,"of",$fd,"\"Joker\"",$fe,"by",$fd,"t" ; [$b102] char
    db "he",$fd,"key",$fd,"hole.",$ff       ; [$b112] char

MESSAGE_NEED_RING_FOR_DOOR:                 ; [$b11f]
    db "D"                                  ; Message 169
    db "o",$fd,"you",$fd,"need",$fe,"a",$fd,"rin" ; [$b120] char
    db "g",$fe,"to",$fd,"open",$fd,"a",$fd,"door" ; [$b130] char
    db "?",$ff                              ; [$b140] char

MESSAGE_USED_RED_POTION:                    ; [$b142]
    db "I"                                  ; Message 170
    db "'ve",$fd,"used",$fe,"Red",$fd,"Pot" ; [$b143] char
    db "ion.",$ff                           ; [$b153] char

MESSAGE_USED_MATTOCK:                       ; [$b158]
    db "I"                                  ; Message 171
    db "'ve",$fd,"used",$fe,"Mattock"       ; [$b159] char
    db ".",$ff                              ; [$b169] char

MESSAGE_USED_HOURGLASS:                     ; [$b16b]
    db "I"                                  ; Message 172
    db "'ve",$fd,"used",$fe,"Hour",$fd,"Gl" ; [$b16c] char
    db "ass.",$ff                           ; [$b17c] char

MESSAGE_USED_WINGBOOTS:                     ; [$b181]
    db "I"                                  ; Message 173
    db "'ve",$fd,"used",$fe,"Wing",$fd,"Bo" ; [$b182] char
    db "ots.",$ff                           ; [$b192] char

MESSAGE_USED_KEY:                           ; [$b197]
    db "I"                                  ; Message 174
    db "'ve",$fd,"used",$fd,"key.",$ff      ; [$b198] char

MESSAGE_USED_ELIXIR:                        ; [$b1a6]
    db "I"                                  ; Message 175
    db "'ve",$fd,"used",$fe,"Elixir."       ; [$b1a7] char
    db $ff                                  ; [$b1b7] char

MESSAGE_HOLDING_ELIXIR:                     ; [$b1b8]
    db "I"                                  ; Message 176
    db "'m",$fd,"holding",$fe,"Elixi"       ; [$b1b9] char
    db "r.",$ff                             ; [$b1c9] char

MESSAGE_HOLDING_RED_POTION:                 ; [$b1cc]
    db "I"                                  ; Message 177
    db "'m",$fd,"holding",$fe,"Red",$fd,"P" ; [$b1cd] char
    db "otion.",$ff                         ; [$b1dd] char

MESSAGE_HOLDING_MATTOCK:                    ; [$b1e4]
    db "I"                                  ; Message 178
    db "'m",$fd,"holding",$fe,"Matto"       ; [$b1e5] char
    db "ck.",$ff                            ; [$b1f5] char

MESSAGE_HOLDING_WINGBOOTS:                  ; [$b1f9]
    db "I"                                  ; Message 179
    db "'m",$fd,"holding",$fe,"Wing",$fd    ; [$b1fa] char
    db "Boots.",$ff                         ; [$b20a] char

MESSAGE_HOLDING_HOURGLASS:                  ; [$b211]
    db "I"                                  ; Message 180
    db "'m",$fd,"holding",$fe,"Hour",$fd    ; [$b212] char
    db "Glass.",$ff                         ; [$b222] char

MESSAGE_GOT_BATTLE_SUIT:                    ; [$b229]
    db "I"                                  ; Message 181
    db "'ve",$fd,"got",$fe,"the",$fd,"Batt" ; [$b22a] char
    db "le",$fd,"Suit.",$ff                 ; [$b23a] char

MESSAGE_GOT_BATTLE_HELMET:                  ; [$b243]
    db "I"                                  ; Message 182
    db "'ve",$fd,"got",$fd,"the",$fe,"Batt" ; [$b244] char
    db "le",$fd,"Helmet.",$ff               ; [$b254] char

MESSAGE_GOT_DRAGON_SLAYER:                  ; [$b25f]
    db "I"                                  ; Message 183
    db "'ve",$fd,"got",$fd,"the",$fe,"Drag" ; [$b260] char
    db "on",$fd,"Slayer.",$ff               ; [$b270] char

MESSAGE_GOT_BLACK_ONYX:                     ; [$b27b]
    db "I"                                  ; Message 184
    db "'ve",$fd,"got",$fe,"the",$fd,"Blac" ; [$b27c] char
    db "k",$fd,"Onyx.",$ff                  ; [$b28c] char

MESSAGE_GOT_PENDANT:                        ; [$b294]
    db "I"                                  ; Message 185
    db "'ve",$fd,"got",$fe,"the",$fd,"Pend" ; [$b295] char
    db "ant.",$ff                           ; [$b2a5] char

MESSAGE_GOT_MAGICAL_ROD:                    ; [$b2aa]
    db "I"                                  ; Message 186
    db "'ve",$fd,"got",$fd,"the",$fe,"Magi" ; [$b2ab] char
    db "cal",$fd,"Rod.",$ff                 ; [$b2bb] char

MESSAGE_TOUCHED_POISON:                     ; [$b2c4]
    db "I"                                  ; Message 187
    db "'ve",$fd,"touched",$fe,"Pois"       ; [$b2c5] char
    db "on.",$ff                            ; [$b2d5] char

MESSAGE_GLOVE_INCREASES_POWER:              ; [$b2d9]
    db "T"                                  ; Message 188
    db "he",$fd,"glove",$fe,"increas"       ; [$b2da] char
    db "es",$fe,"offensive",$fd,"pow"       ; [$b2ea] char
    db "er.",$ff                            ; [$b2fa] char

MESSAGE_POWER_GLOVE_IS_GONE:                ; [$b2fe]
    db "T"                                  ; Message 189
    db "he",$fd,"power",$fd,"of",$fe,"the",$fd ; [$b2ff] char
    db "Glove",$fe,"is",$fd,"gone.",$ff     ; [$b30f] char

MESSAGE_USED_OINTMENT:                      ; [$b31e]
    db "I"                                  ; Message 190
    db $fd,"am",$fd,"free",$fd,"from",$fe,"in" ; [$b31f] char
    db "jury",$fd,"because",$fe,"of",$fd    ; [$b32f] char
    db "the",$fd,"ointment.",$ff            ; [$b33f] char

MESSAGE_OINTMENT_GONE:                      ; [$b34d]
    db "T"                                  ; Message 191
    db "he",$fd,"power",$fd,"of",$fe,"the",$fd ; [$b34e] char
    db "ointment",$fe,"is",$fd,"gone"       ; [$b35e] char
    db ".",$ff                              ; [$b36e] char

MESSAGE_WINGBOOTS_GONE:                     ; [$b370]
    db "T"                                  ; Message 192
    db "he",$fd,"power",$fd,"of",$fe,"the",$fd ; [$b371] char
    db "Wing",$fd,"Boots",$fe,"is",$fd,"go" ; [$b381] char
    db "ne.",$ff                            ; [$b391] char

MESSAGE_HOURGLASS_GONE:                     ; [$b395]
    db "T"                                  ; Message 193
    db "he",$fd,"power",$fd,"of",$fe,"the",$fd ; [$b396] char
    db "Hour",$fd,"Glass",$fe,"is",$fd,"go" ; [$b3a6] char
    db "ne.",$ff                            ; [$b3b6] char

EXTRA_TILE_GLYPH_END_DOUBLE_QUOTES:         ; [$b3ba]
    db $00,$10,$48,$28,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$b3ba]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$b3ca]
                                                                       ; byte

EXTRA_TILE_GLYPH_SMALL_SQUARE:              ; [$b3da]
    db $00,$78,$48,$48,$78,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$b3da]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$b3ea]
                                                                       ; byte

EXTRA_TILE_GLYPH_LEFT_ARROW_TOP:            ; [$b3fa]
    db $00,$00,$00,$00,$02,$06,$0e,$1f      ; [$b3fa] byte

EXTRA_TILE_GLYPH_LEFT_ARROW_BOTTOM:         ; [$b402]
    db $1f,$0e,$06,$02,$00,$00,$00,$00      ; [$b402] byte

EXTRA_TILE_GLYPH_EQUAL_TOP:                 ; [$b40a]
    db $00,$00,$00,$00,$00,$00,$00,$fc      ; [$b40a] byte

EXTRA_TILE_GLYPH_EQUAL_BOTTOM:              ; [$b412]
    db $fc,$00,$00,$00,$00,$00,$00,$00      ; [$b412] byte

EXTRA_TILE_GLYPH_EQUAL2_TOP:                ; [$b41a]
    db $00,$00,$00,$00,$00,$00,$00,$1f      ; [$b41a] byte

EXTRA_TILE_GLYPH_EQUAL2_BOTTOM:             ; [$b422]
    db $1f,$00,$00,$00,$00,$00,$00,$00      ; [$b422] byte

EXTRA_TILE_GLYPH_RIGHT_ARROW_TOP:           ; [$b42a]
    db $00,$00,$00,$00,$20,$30,$38,$fc      ; [$b42a] byte

EXTRA_TILE_GLYPH_RIGHT_ARROW_BOTTOM:        ; [$b432]
    db $fc,$38,$30,$20,$00,$00,$00,$00      ; [$b432] byte

EXTRA_TILE_GLYPH_END1_TOP:                  ; [$b43a]
    db $00,$00,$00,$7a,$42,$43,$42,$7a      ; [$b43a] byte

EXTRA_TILE_GLYPH_END1_BOTTOM:               ; [$b442]
    db $42,$42,$42,$7a,$00,$00,$00,$00      ; [$b442] byte

EXTRA_TILE_GLYPH_END2_TOP:                  ; [$b44a]
    db $00,$00,$00,$2c,$2a,$29,$a9,$a9      ; [$b44a] byte

EXTRA_TILE_GLYPH_END2_BOTTOM:               ; [$b452]
    db $69,$29,$2a,$2c,$00,$00,$00,$00      ; [$b452] byte

    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b45b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b46a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b47a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b48a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b49a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4aa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4ba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4ca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4da] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4ea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4fa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b50a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b51a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b52a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b53a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b54a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b55a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b56a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b57a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b58a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b59a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5aa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5ba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5ca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5da] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5ea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5fa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b60a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b61a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b62a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b63a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b64a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b65a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b66a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b67a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b68a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b69a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6aa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6ba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6ca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6da] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6ea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6fa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b70a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b71a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b72a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b73a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b74a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b75a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b76a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b77a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b78a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b79a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7aa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7ba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7ca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7da] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7ea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7fa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b80a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b81a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b82a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b83a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b84a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b85a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b86a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b87a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b88a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b89a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8aa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8ba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8ca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8da] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8ea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8fa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b90a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b91a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b92a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b93a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b94a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b95a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b96a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b97a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b98a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b99a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9aa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9ba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9ca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9da] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9ea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9fa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba0a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba1a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba2a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba3a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba4a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba5a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba6a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba7a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba8a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba9a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baaa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bada] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bafa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb0a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb1a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb2a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb3a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb4a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb5a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb6a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb7a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb8a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb9a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbaa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbda] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbfa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc0a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc1a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc2a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc3a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc4a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc5a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc6a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc7a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc8a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc9a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcaa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcda] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcfa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd0a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd1a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd2a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd3a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd4a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd5a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd6a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd7a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd8a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd9a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdaa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdda] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdfa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be0a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be1a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be2a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be3a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be4a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be5a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be6a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be7a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be8a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be9a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beaa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beda] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beea] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$befa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf0a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf1a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf2a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf3a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf4a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf5a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf6a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf7a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf8a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf9a] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfaa] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfba] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfca] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfda] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfea] undefined
    db $ff,$ff,$ff,$ff,$ff,$ff              ; [$bffa] undefined
