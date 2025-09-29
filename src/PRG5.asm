;============================================================================
; Faxanadu (U).nes
;
; PRG5 ($8000 - $bfff)
;============================================================================

BASE $8000


;============================================================================
; TODO: Document thunk_Sound_Init
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_InitScreenAndMusic
;============================================================================
thunk_Sound_Init:                           ; [$8000]
    JMP Sound_Init


;============================================================================
; TODO: Document thunk_Sound_HandleOnInterrupt
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     OnInterrupt
;============================================================================
thunk_Sound_HandleOnInterrupt:              ; [$8003]
    JMP Sound_HandleOnInterrupt


;============================================================================
; TODO: Document thunk_Sound_InitPlayingState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_InitScreenAndMusic
;============================================================================
thunk_Sound_InitPlayingState:               ; [$8006]
    JMP Sound_InitPlayingState


;============================================================================
; TODO: Document thunk_Audio_HandleOnInterrupt
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     OnInterrupt
;============================================================================
thunk_Audio_HandleOnInterrupt:              ; [$8009]
    JMP Audio_HandleOnInterrupt
    db $ff                                  ; [$800c] undefined


;============================================================================
; TODO: Document Audio_HandleOnInterrupt
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     thunk_Audio_HandleOnInterrupt
;============================================================================
Audio_HandleOnInterrupt:                    ; [$800d]
    LDA a:PauseFlag
    BNE Audio_HandleIsPaused
    LDA CurrentMusic
    BEQ Audio_HandleNoMusic
    BPL Audio_HandleMusicIsFF
    JMP FUN_PRG5__8106


;============================================================================
; TODO: Document Sound_InitPlayingState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     thunk_Sound_InitPlayingState
;============================================================================
Sound_InitPlayingState:                     ; [$801b]
    LDA #$00
    STA CurrentMusic
    STA NextSoundEffect
    STA a:SOUND_DAT_0122
    STA a:SND_CHN
    STA a:PauseFlag
    STA a:CurrentSoundIndex
    RTS

    ;
    ; XREFS:
    ;     Audio_HandleOnInterrupt
    ;
Audio_HandleIsPaused:                       ; [$802e]
    BMI Audio_HandleNoMusic
    ORA #$80
    STA a:PauseFlag
    JSR ResetAudio

    ;
    ; XREFS:
    ;     Audio_HandleOnInterrupt
    ;
Audio_HandleNoMusic:                        ; [$8038]
    LDA CurrentMusic
    BNE @_return
    LDX #$03

  @_loop:                                   ; [$803e]
    LDA SOUND_DAT_0123,X
    BNE @_return
    DEX
    BPL @_loop
    JMP ResetAudio

  @_return:                                 ; [$8049]
    RTS


;============================================================================
; TODO: Document ResetAudio
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Audio_HandleOnInterrupt
;     Sound_Init
;============================================================================
ResetAudio:                                 ; [$804a]
    LDA #$10
    STA a:SQ1_VOL
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    LDA #$00
    STA a:SQ1_SWEEP
    STA a:SQ1_LO
    STA a:SQ1_HI
    STA a:SQ2_SWEEP
    STA a:SQ2_LO
    STA a:SQ2_HI
    STA a:TRI_LINEAR
    STA a:TRI_LO
    STA a:TRI_HI
    STA a:NOISE_LO
    STA a:NOISE_HI
    RTS

    ;
    ; XREFS:
    ;     Audio_HandleOnInterrupt
    ;
Audio_HandleMusicIsFF:                      ; [$8079]
    LDA CurrentMusic
    ORA #$80
    STA CurrentMusic
    ASL A
    ASL A
    ASL A
    TAY
    LDX #$07

  @_musicLoop:                              ; [$8085]
    LDA #$8efa,Y
    STA CurrentMusicInfo1,X
    STA a:DAT_0150
    DEY
    DEX
    BPL @_musicLoop
    INX
    STX a:Music_Something_8Counter
    STX a:Something_Music_0161
    STX a:Something_Music_0162
    STX a:Something_Music_0163
    STX a:Something_Music_0174
    STX a:Something_Music_0175
    STX a:Something_Music_0176
    STX a:Something_Music_0177
    STX a:Something_Music_0179
    STX a:Something_Music_017a
    STX a:Something_Music_017c
    STX a:Something_Music_017d
    STX a:Something_Music_016d
    STX a:Something_Music_016e
    STX a:Something_Music_016f
    STX a:Something_Music_017e
    STX a:Something_Music_0169
    STX a:Something_Music_0178
    STX a:Something_Music_016c
    STX a:Something_Music_017f
    STX a:Something_Music_0180
    STX a:Something_Music_0181
    INX
    STX a:Something_Music_0130
    STX a:Something_Music_0131
    STX a:Something_Music_0132
    STX a:Something_Music_0133
    STX a:BYTE_012c
    STX a:Something_Music_012d
    STX a:Something_Music_012e
    STX a:Something_Music_012f
    LDA #$08
    STA a:Something_Music_0164
    STA a:Something_Music_0165
    STA a:Something_Music_0166
    STA a:Something_Music_0167
    LDA #$90
    STA a:Something_Music_0172
    STA a:Something_Music_0173
    JMP ResetAudio


;============================================================================
; TODO: Document FUN_PRG5__8106
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Audio_HandleOnInterrupt
;============================================================================
FUN_PRG5__8106:                             ; [$8106]
    LDA #$00
    STA a:Maybe_Something_MusicCounter
    STA a:Maybe_SomethingMusicDestOffset

  @LAB_PRG5__810e:                          ; [$810e]
    LDX a:Maybe_SomethingMusicDestOffset
    DEC Something_Music_0130,X
    BNE @LAB_PRG5__8119
    JSR FUN_PRG5__823a

  @LAB_PRG5__8119:                          ; [$8119]
    JSR FUN_PRG5__8132
    INC a:Maybe_SomethingMusicDestOffset
    LDA a:Maybe_SomethingMusicDestOffset
    CMP #$04
    BCC @LAB_PRG5__810e
    LDA a:Maybe_Something_MusicCounter
    CMP #$04
    BNE @_return
    LDA #$00
    STA CurrentMusic

  @_return:                                 ; [$8131]
    RTS


;============================================================================
; TODO: Document FUN_PRG5__8132
;
; INPUTS:
;     A
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG5__8106
;============================================================================
FUN_PRG5__8132:                             ; [$8132]
    LDX a:Maybe_SomethingMusicDestOffset
    BEQ @LAB_PRG5__8160
    DEX
    BEQ @LAB_PRG5__8160
    DEX
    BEQ @LAB_PRG5__813e
    RTS

  @LAB_PRG5__813e:                          ; [$813e]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA a:Something_Music_017e
    BEQ @LAB_PRG5__814b
    DEC a:Something_Music_017e
    LDA #$c0

  @LAB_PRG5__814b:                          ; [$814b]
    STA a:Something_Music_016c
    LDA SOUND_DAT_0123,X
    BNE @LAB_PRG5__815a
    LDA a:Something_Music_016c
    STA a:TRI_LINEAR
    RTS

  @LAB_PRG5__815a:                          ; [$815a]
    LDA #$00
    STA a:TRI_LINEAR
    RTS

  @LAB_PRG5__8160:                          ; [$8160]
    LDX a:Maybe_SomethingMusicDestOffset
    LDY Something_Music_0176,X
    BEQ @LAB_PRG5__816f
    DEY
    BEQ @LAB_PRG5__8192
    DEY
    BEQ @LAB_PRG5__81bc
    RTS

  @LAB_PRG5__816f:                          ; [$816f]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA #$0170,X
    BEQ @LAB_PRG5__817d
    SEC
    SBC #$03
    STA #$0170,X

  @LAB_PRG5__817d:                          ; [$817d]
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$0f
    STA a:Something_Music_016c
    LDA SOUND_DAT_0123,X
    BNE @_return1
    JSR FUN_PRG5__81f1
    JSR FUN_PRG5__820d

  @_return1:                                ; [$8191]
    RTS

  @LAB_PRG5__8192:                          ; [$8192]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA #$0170,X
    AND #$0f
    STA #$0170,X
    CMP #$0d
    BCC @LAB_PRG5__81a7
    DEC #$0170,X
    DEC #$0170,X

  @LAB_PRG5__81a7:                          ; [$81a7]
    INC Something_Music_0179,X
    LDA #$0170,X
    STA a:Something_Music_016c
    LDA SOUND_DAT_0123,X
    BNE @_return2
    JSR FUN_PRG5__81f1
    JSR FUN_PRG5__820d

  @_return2:                                ; [$81bb]
    RTS

  @LAB_PRG5__81bc:                          ; [$81bc]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA Something_Music_0179,X
    LSR A
    LSR A
    TAY
    LDA #$81dc,Y
    BEQ @LAB_PRG5__81cd
    INC Something_Music_0179,X

  @LAB_PRG5__81cd:                          ; [$81cd]
    STA a:Something_Music_016c
    LDA SOUND_DAT_0123,X
    BNE @_return3
    JSR FUN_PRG5__81f1
    JSR FUN_PRG5__820d

  @_return3:                                ; [$81db]
    RTS

;
; XREFS:
;     FUN_PRG5__8132
;
BYTE_ARRAY_PRG5__81dc:                      ; [$81dc]
    db $07                                  ; [0]:
    db $0a                                  ; [1]:
    db $0d                                  ; [2]:
    db $0f                                  ; [3]:
    db $0e                                  ; [4]:
    db $0d                                  ; [5]:
    db $0c                                  ; [6]:
    db $0b                                  ; [7]:
    db $0a                                  ; [8]:
    db $09                                  ; [9]:
    db $08                                  ; [10]:
    db $07                                  ; [11]:
    db $06                                  ; [12]:
    db $05                                  ; [13]:
    db $04                                  ; [14]:
    db $03                                  ; [15]:
    db $02                                  ; [16]:
    db $02                                  ; [17]:
    db $01                                  ; [18]:
    db $01                                  ; [19]:
    db $00                                  ; [20]:


;============================================================================
; TODO: Document FUN_PRG5__81f1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__8132
;============================================================================
FUN_PRG5__81f1:                             ; [$81f1]
    LDX a:Maybe_SomethingMusicDestOffset
    TXA
    ASL A
    ASL A
    TAY
    LDA a:Something_Music_016c
    SEC
    SBC Something_Music_0174,X
    BCS @LAB_PRG5__8203
    LDA #$00

  @LAB_PRG5__8203:                          ; [$8203]
    LDX a:Maybe_SomethingMusicDestOffset
    ORA Something_Music_0172,X
    STA SQ1_VOL,Y
    RTS


;============================================================================
; TODO: Document FUN_PRG5__820d
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__8132
;============================================================================
FUN_PRG5__820d:                             ; [$820d]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA Something_Music_0179,X
    CMP #$12
    BCC @_return
    LSR A
    LSR A
    AND Something_Music_017f,X
    STA a:Something_Music_0178
    LDA SOUND_DAT_0123,X
    BNE @_return
    LDA a:Maybe_SomethingMusicDestOffset
    ASL A
    ASL A
    TAY
    LDA Something_Music_017c,X
    CMP Something_Music_017f,X
    BCC @_return
    SEC
    SBC a:Something_Music_0178
    STA SQ1_LO,Y

  @_return:                                 ; [$8239]
    RTS


;============================================================================
; TODO: Document FUN_PRG5__823a
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__8106
;     FUN_PRG5__8298
;     FUN_PRG5__841f
;     FUN_PRG5__843d
;     FUN_PRG5__8458
;     FUN_PRG5__8483
;     FUN_PRG5__848f
;     FUN_PRG5__84a5
;     FUN_PRG5__84b7
;     FUN_PRG5__84d0
;     FUN_PRG5__84f0
;     FUN_PRG5__8502
;     FUN_PRG5__850e
;     FUN_PRG5__8517
;     FUN_PRG5__8523
;     FUN_PRG5__852f
;     FUN_PRG5__853b
;     thunk_FUN_PRG5__823a
;============================================================================
FUN_PRG5__823a:                             ; [$823a]
    LDX a:Maybe_SomethingMusicDestOffset
    CPX #$03
    BNE @LAB_PRG5__8249
    LDA a:Something_Music_0169
    BEQ @LAB_PRG5__8249
    JMP FUN_PRG5__82ff

  @LAB_PRG5__8249:                          ; [$8249]
    JSR FUN_PRG5__8544
    STA a:Something_Music_016c
    TAY
    BMI @LAB_PRG5__8255
    JMP FUN_PRG5__82e3

  @LAB_PRG5__8255:                          ; [$8255]
    CMP #$ee
    BCC FUN_PRG5__828e
    SEC
    LDA #$ff
    SBC a:Something_Music_016c
    ASL A
    TAY
    LDA #$826b,Y
    PHA
    LDA #$826a,Y
    PHA
    RTS

;
; XREFS:
;     FUN_PRG5__823a
;
USHORT_PRG5__826a:                          ; [$826a]
    dw FUN_PRG5__8408-1
    dw FUN_PRG5__84a5-1
    dw FUN_PRG5__841f-1
    dw FUN_PRG5__8458-1
    dw FUN_PRG5__843d-1
    dw thunk_FUN_PRG5__823a-1
    dw FUN_PRG5__848f-1
    dw FUN_PRG5__84d0-1
    dw FUN_PRG5__850e-1
    dw FUN_PRG5__8502-1
    dw FUN_PRG5__84f0-1
    dw FUN_PRG5__84b7-1
    dw FUN_PRG5__8295-1
    dw FUN_PRG5__8483-1
    dw FUN_PRG5__8517-1
    dw FUN_PRG5__8523-1
    dw FUN_PRG5__852f-1
    dw FUN_PRG5__853b-1


;============================================================================
; TODO: Document FUN_PRG5__828e
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__823a
;============================================================================
FUN_PRG5__828e:                             ; [$828e]
    LDA a:Something_Music_016c
    AND #$7f
    BPL FUN_PRG5__8298

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG5__8295
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8295:                             ; [$8295]
    JSR FUN_PRG5__8544

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG5__8298
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__828e
;============================================================================
FUN_PRG5__8298:                             ; [$8298]
    LDX a:Maybe_SomethingMusicDestOffset
    STA #$012c,X
    STA a:Something_Music_016c
    LDX a:Maybe_SomethingMusicDestOffset
    CPX #$02
    BEQ FUN_PRG5__823a
    LDA a:Something_Music_016c
    PHA
    LSR A
    LSR A
    LSR A
    STA a:Something_Music_016c
    PLA
    SEC
    SBC a:Something_Music_016c
    CMP #$10
    BCS @LAB_PRG5__82cc
    ASL A
    ASL A
    ASL A
    ASL A
    ORA #$08
    STA Something_Music_0164,X
    CMP #$08
    BNE @LAB_PRG5__82dd
    LDA #$18
    BNE @LAB_PRG5__82da

  @LAB_PRG5__82cc:                          ; [$82cc]
    LDY #$00

  @LAB_PRG5__82ce:                          ; [$82ce]
    CMP #$856f,Y
    BCS @LAB_PRG5__82d7
    INY
    INY
    BNE @LAB_PRG5__82ce

  @LAB_PRG5__82d7:                          ; [$82d7]
    LDA #$8570,Y

  @LAB_PRG5__82da:                          ; [$82da]
    STA Something_Music_0164,X

  @LAB_PRG5__82dd:                          ; [$82dd]
    JMP FUN_PRG5__823a
    JMP FUN_PRG5__823a                      ; Unreachable?


;============================================================================
; TODO: Document FUN_PRG5__82e3
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__823a
;============================================================================
FUN_PRG5__82e3:                             ; [$82e3]
    CMP #$00
    BNE @LAB_PRG5__82ea
    JMP FUN_PRG5__83ad

  @LAB_PRG5__82ea:                          ; [$82ea]
    LDX a:Maybe_SomethingMusicDestOffset
    CPX #$03
    BNE FUN_PRG5__8326
    PHA
    AND #$0f
    STA a:Something_Music_0169
    PLA
    LSR A
    LSR A
    LSR A
    LSR A
    STA a:BYTE_0168


;============================================================================
; TODO: Document FUN_PRG5__82ff
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__823a
;============================================================================
FUN_PRG5__82ff:                             ; [$82ff]
    DEC a:Something_Music_0169
    LDA a:SOUND_DAT_0126
    BEQ @LAB_PRG5__830a
    JMP FUN_PRG5__83ad

  @LAB_PRG5__830a:                          ; [$830a]
    LDA a:BYTE_0168
    BNE @LAB_PRG5__8312
    JMP FUN_PRG5__83ad

  @LAB_PRG5__8312:                          ; [$8312]
    ASL A
    ASL A
    TAX
    LDY #$00

  @LAB_PRG5__8317:                          ; [$8317]
    LDA #$857f,X
    STA NOISE_VOL,Y
    INX
    INY
    CPY #$04
    BCC @LAB_PRG5__8317
    JMP FUN_PRG5__83ad


;============================================================================
; TODO: Document FUN_PRG5__8326
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__82e3
;============================================================================
FUN_PRG5__8326:                             ; [$8326]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA SOUND_DAT_0123,X
    BEQ @LAB_PRG5__8331
    JMP FUN_PRG5__83ad

  @LAB_PRG5__8331:                          ; [$8331]
    LDX a:Maybe_SomethingMusicDestOffset
    BEQ @LAB_PRG5__8355
    DEX
    BEQ @LAB_PRG5__8376
    LDA #$c0
    STA a:TRI_LINEAR
    JSR FUN_PRG5__83cd
    LDA a:Something_Music_016d
    STA a:TRI_LO
    LDX a:Maybe_SomethingMusicDestOffset
    LDA a:Something_Music_016e
    ORA #$f8
    STA a:TRI_HI
    JMP FUN_PRG5__83b7

  @LAB_PRG5__8355:                          ; [$8355]
    JSR FUN_PRG5__83cd
    LDA #$00
    STA a:SQ1_SWEEP
    LDA a:Something_Music_016d
    STA a:SQ1_LO
    STA a:Something_Music_017c
    LDA a:Something_Music_016e
    ORA a:Something_Music_0164
    STA a:SQ1_HI
    LDA #$00
    STA a:Something_Music_0179
    BEQ @LAB_PRG5__83a1

  @LAB_PRG5__8376:                          ; [$8376]
    JSR FUN_PRG5__83cd
    LDA #$00
    STA a:SQ2_SWEEP
    LDY a:Something_Music_016c
    LDA a:Something_Music_016d
    CMP a:Something_Music_0181
    BCC @LAB_PRG5__838d
    SEC
    SBC a:Something_Music_0181

  @LAB_PRG5__838d:                          ; [$838d]
    STA a:SQ2_LO
    STA a:Something_Music_017d
    LDA a:Something_Music_016e
    ORA a:Something_Music_0165
    STA a:SQ2_HI
    LDA #$00
    STA a:Something_Music_017a

  @LAB_PRG5__83a1:                          ; [$83a1]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA #$ff
    STA #$0170,X
    JSR FUN_PRG5__83ad
    RTS


;============================================================================
; TODO: Document FUN_PRG5__83ad
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__82e3
;     FUN_PRG5__82ff
;     FUN_PRG5__8326
;     FUN_PRG5__83b7
;============================================================================
FUN_PRG5__83ad:                             ; [$83ad]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA #$012c,X
    STA Something_Music_0130,X
    RTS


;============================================================================
; TODO: Document FUN_PRG5__83b7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__8326
;============================================================================
FUN_PRG5__83b7:                             ; [$83b7]
    JSR FUN_PRG5__83ad
    STA a:Something_Music_016c
    LSR A
    LSR A
    STA a:Something_Music_0178
    LDA a:Something_Music_016c
    SEC
    SBC a:Something_Music_0178
    STA a:Something_Music_017e
    RTS


;============================================================================
; TODO: Document FUN_PRG5__83cd
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__8326
;============================================================================
FUN_PRG5__83cd:                             ; [$83cd]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA a:Something_Music_016c
    CLC
    ADC #$856c,X
    CLC
    ADC Something_Music_0161,X
    CLC
    ADC a:Music_Something_8Counter
    STY a:Something_Music_016f
    LDY #$01
    SEC

  @LAB_PRG5__83e5:                          ; [$83e5]
    SBC #$0c
    INY
    BCS @LAB_PRG5__83e5
    DEY
    ADC #$0d
    ASL A
    TAX
    LDA #$8552,X
    STA a:Something_Music_016d
    LDA #$8553,X
    STA a:Something_Music_016e

  @LAB_PRG5__83fb:                          ; [$83fb]
    DEY
    BEQ @LAB_PRG5__8407
    LSR a:Something_Music_016e
    ROR a:Something_Music_016d
    JMP @LAB_PRG5__83fb

  @LAB_PRG5__8407:                          ; [$8407]
    RTS


;============================================================================
; TODO: Document FUN_PRG5__8408
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     USHORT_PRG5__826a [$PRG5::826a]
;============================================================================
FUN_PRG5__8408:                             ; [$8408]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA #$01
    STA Something_Music_0130,X
    TXA
    ASL A
    TAX
    LDA CurrentMusicInfo1,X
    BNE @LAB_PRG5__8419
    DEC CurrentMusicInfo2,X

  @LAB_PRG5__8419:                          ; [$8419]
    DEC CurrentMusicInfo1,X
    INC a:Maybe_Something_MusicCounter
    RTS


;============================================================================
; TODO: Document FUN_PRG5__841f
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__841f:                             ; [$841f]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    STA #$0148,X
    LDA #$01
    STA #$014c,X
    TXA
    ASL A
    TAX
    LDA CurrentMusicInfo1,X
    STA #$0138,X
    LDA CurrentMusicInfo2,X
    STA #$0139,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__843d
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__843d:                             ; [$843d]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    CMP #$014c,X
    BCS @LAB_PRG5__8455
    TXA
    ASL A
    TAX
    LDA #$0140,X
    STA CurrentMusicInfo1,X
    LDA #$0141,X
    STA CurrentMusicInfo2,X

  @LAB_PRG5__8455:                          ; [$8455]
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__8458
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8458:                             ; [$8458]
    LDX a:Maybe_SomethingMusicDestOffset
    LDA #$014c,X
    CMP #$0148,X
    BCS @LAB_PRG5__847d
    INC #$014c,X
    TXA
    ASL A
    TAX
    LDA CurrentMusicInfo1,X
    STA #$0140,X
    LDA CurrentMusicInfo2,X
    STA #$0141,X
    LDA #$0138,X
    STA CurrentMusicInfo1,X
    LDA #$0139,X
    STA CurrentMusicInfo2,X

  @LAB_PRG5__847d:                          ; [$847d]
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document thunk_FUN_PRG5__823a
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
thunk_FUN_PRG5__823a:                       ; [$8480]
    JMP FUN_PRG5__823a                      ; Unreachable?


;============================================================================
; TODO: Document FUN_PRG5__8483
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8483:                             ; [$8483]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    STA Something_Music_0172,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__848f
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__848f:                             ; [$848f]
    JSR FUN_PRG5__8495
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__8495
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__848f
;============================================================================
FUN_PRG5__8495:                             ; [$8495]
    LDA a:Maybe_SomethingMusicDestOffset
    ASL A
    TAX
    LDA CurrentMusicInfo1,X
    STA #$0150,X
    LDA CurrentMusicInfo2,X
    STA #$0151,X
    RTS


;============================================================================
; TODO: Document FUN_PRG5__84a5
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__84a5:                             ; [$84a5]
    LDA a:Maybe_SomethingMusicDestOffset
    ASL A
    TAX
    LDA #$0150,X
    STA CurrentMusicInfo1,X
    LDA #$0151,X
    STA CurrentMusicInfo2,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__84b7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__84b7:                             ; [$84b7]
    LDA CurrentMusic
    ASL A
    ASL A
    SEC
    SBC #$04
    ASL A
    TAY
    LDX #$00

  @LAB_PRG5__84c2:                          ; [$84c2]
    LDA #$8efb,Y
    STA CurrentMusicInfo1,X
    INY
    INX
    CPX #$08
    BNE @LAB_PRG5__84c2
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__84d0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__84d0:                             ; [$84d0]
    JSR FUN_PRG5__8544
    PHA
    JSR FUN_PRG5__8544
    PHA
    LDA a:Maybe_SomethingMusicDestOffset
    ASL A
    TAX
    LDA CurrentMusicInfo1,X
    STA #$0158,X
    LDA CurrentMusicInfo2,X
    STA #$0159,X
    PLA
    STA CurrentMusicInfo2,X
    PLA
    STA CurrentMusicInfo1,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__84f0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__84f0:                             ; [$84f0]
    LDA a:Maybe_SomethingMusicDestOffset
    ASL A
    TAX
    LDA #$0158,X
    STA CurrentMusicInfo1,X
    LDA #$0159,X
    STA CurrentMusicInfo2,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__8502
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8502:                             ; [$8502]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    STA Something_Music_0161,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__850e
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__850e:                             ; [$850e]
    JSR FUN_PRG5__8544
    STA a:Music_Something_8Counter
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__8517
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8517:                             ; [$8517]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    STA Something_Music_0174,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__8523
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8523:                             ; [$8523]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    STA Something_Music_0176,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__852f
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__852f:                             ; [$852f]
    JSR FUN_PRG5__8544
    LDX a:Maybe_SomethingMusicDestOffset
    STA Something_Music_017f,X
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__853b
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__853b:                             ; [$853b]
    JSR FUN_PRG5__8544
    STA a:Something_Music_0181
    JMP FUN_PRG5__823a


;============================================================================
; TODO: Document FUN_PRG5__8544
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG5__823a
;     FUN_PRG5__8295
;     FUN_PRG5__841f
;     FUN_PRG5__843d
;     FUN_PRG5__8483
;     FUN_PRG5__84d0
;     FUN_PRG5__8502
;     FUN_PRG5__850e
;     FUN_PRG5__8517
;     FUN_PRG5__8523
;     FUN_PRG5__852f
;     FUN_PRG5__853b
;============================================================================
FUN_PRG5__8544:                             ; [$8544]
    LDA a:Maybe_SomethingMusicDestOffset
    ASL A
    TAX
    LDA (CurrentMusicInfo1,X)
    INC CurrentMusicInfo1,X
    BNE @_return
    INC CurrentMusicInfo2,X

  @_return:                                 ; [$8551]
    RTS

;
; XREFS:
;     FUN_PRG5__83cd
;     FUN_PRG5__8ed1
;
BYTE_PRG5__8552:                            ; [$8552]
    db $00                                  ; [$8552] byte

;
; XREFS:
;     FUN_PRG5__83cd
;     FUN_PRG5__8ed1
;
BYTE_PRG5__8553:                            ; [$8553]
    db $00,$ae,$06,$4e,$06,$f3,$05,$9f,$05,$4d,$05,$01,$05,$b9,$04,$75 ; [$8553]
                                                                       ; byte
    db $04,$35,$04,$f8,$03,$bf,$03,$89,$03  ; [$8563] byte

;
; XREFS:
;     FUN_PRG5__83cd
;
BYTE_PRG5__856c:                            ; [$856c]
    db $f4,$f4,$0c                          ; [$856c] byte

;
; XREFS:
;     FUN_PRG5__8298
;
BYTE_PRG5__856f:                            ; [$856f]
    db $7f                                  ; [$856f] byte

;
; XREFS:
;     FUN_PRG5__8298
;
BYTE_PRG5__8570:                            ; [$8570]
    db $08                                  ; [$8570] byte

;
; XREFS:
;     FUN_PRG5__8298
;
BYTE_PRG5__8571:                            ; [$8571]
    db $60                                  ; [$8571] byte

;
; XREFS:
;     FUN_PRG5__8298
;
BYTE_PRG5__8572:                            ; [$8572]
    db $c0,$50,$40,$30,$b0,$28,$30,$24,$d0,$1e,$50,$18,$a0 ; [$8572] byte

;
; XREFS:
;     FUN_PRG5__82ff
;
BYTE_PRG5__857f:                            ; [$857f]
    db $14,$20,$00,$f0,$00,$00,$0f,$20,$00,$00,$0a,$10,$00,$00,$05,$00 ; [$857f]
                                                                       ; byte
    db $ff                                  ; [$858f] byte

;
; XREFS:
;     Sound_HandleOnInterrupt
;
SOMETHING_NEXT_SOUND_EFFECT_MAP:            ; [$8590]
    db $00                                  ; [0]:
    db $2c                                  ; [1]:
    db $60                                  ; [2]:
    db $5c                                  ; [3]:
    db $64                                  ; [4]:
    db $70                                  ; [5]:
    db $38                                  ; [6]:
    db $40                                  ; [7]:
    db $4c                                  ; [8]:
    db $50                                  ; [9]:
    db $68                                  ; [10]:
    db $30                                  ; [11]:
    db $58                                  ; [12]:
    db $34                                  ; [13]:
    db $28                                  ; [14]:
    db $3c                                  ; [15]:
    db $54                                  ; [16]:
    db $48                                  ; [17]:
    db $44                                  ; [18]:
    db $24                                  ; [19]:
    db $6c                                  ; [20]:
    db $1c                                  ; [21]:
    db $10                                  ; [22]:
    db $14                                  ; [23]:
    db $18                                  ; [24]:
    db $20                                  ; [25]:
    db $0c                                  ; [26]:
    db $08                                  ; [27]:
    db $04                                  ; [28]:

;
; XREFS:
;     Sound_HandleOnInterrupt
;
BYTE_PRG5__85ad:                            ; [$85ad]
    db $80                                  ; [$85ad] byte

;
; XREFS:
;     Sound_HandleOnInterrupt
;
BYTE_PRG5__85ae:                            ; [$85ae]
    db $86,$7f,$86,$ca,$8e,$cd,$8e,$75,$8e,$87,$8e,$d7,$8d,$ea,$8d,$9b ; [$85ae]
                                                                       ; byte
    db $8c,$b3,$8c,$2b,$8d,$35,$8d,$5e,$8d,$70,$8d,$68,$8c,$72,$8c,$b8 ; [$85be]
                                                                       ; byte
    db $8d,$20,$86,$b2,$8b,$c4,$8b,$7d,$8a,$20,$86,$9d,$86,$a7,$86,$a7 ; [$85ce]
                                                                       ; byte
    db $89,$b1,$89,$3c,$8a,$46,$8a,$09,$88,$1e,$88,$9c,$8a,$a6,$8a,$6c ; [$85de]
                                                                       ; byte
    db $88,$76,$88,$64,$8b,$6e,$8b,$07,$8b,$1e,$8b,$c4,$88,$d1,$88,$1e ; [$85ee]
                                                                       ; byte
    db $89,$2d,$89,$cf,$8a,$d9,$8a,$04,$8a,$0e,$8a,$33,$87,$42,$87,$d2 ; [$85fe]
                                                                       ; byte
    db $86,$df,$86,$70,$87,$7a,$87,$72,$89,$81,$89,$06,$8c,$1d,$8c,$b4 ; [$860e]
                                                                       ; byte
    db $87,$c1,$87,$ce,$27,$01,$d0,$08      ; [$861e] byte


;============================================================================
; TODO: Document Sound_ResetCurrentSound
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sound_HandleOnInterrupt
;============================================================================
Sound_ResetCurrentSound:                    ; [$8626]
    LDA #$00
    STA a:SOUND_DAT_0122
    STA a:CurrentSoundIndex
    RTS


;============================================================================
; TODO: Document Sound_HandleOnInterrupt
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     thunk_Sound_HandleOnInterrupt
;============================================================================
Sound_HandleOnInterrupt:                    ; [$862f]
    LDX #$03

  @LAB_PRG5__8631:                          ; [$8631]
    LDA SOUND_DAT_0123,X
    BEQ @LAB_PRG5__8639
    DEC SOUND_DAT_0123,X

  @LAB_PRG5__8639:                          ; [$8639]
    DEX
    BPL @LAB_PRG5__8631
    LDA NextSoundEffect
    BMI @LAB_PRG5__866f
    TAX
    ORA #$80
    STA NextSoundEffect
    CPX #$1d
    BCS @LAB_PRG5__866f
    LDA a:SOUND_DAT_0122
    BEQ @LAB_PRG5__8658
    LDA #$8590,X
    CMP a:SOUND_DAT_0122
    BCC @LAB_PRG5__8658
    BNE @LAB_PRG5__866f

  @LAB_PRG5__8658:                          ; [$8658]
    LDA #$8590,X
    STA a:SOUND_DAT_0122
    TAX
    LDA #$00
    STA a:SOUND_DAT_0123
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0125
    STA a:SOUND_DAT_0126
    BEQ @LAB_PRG5__8674

  @LAB_PRG5__866f:                          ; [$866f]
    LDX a:SOUND_DAT_0122
    INX
    INX

  @LAB_PRG5__8674:                          ; [$8674]
    CPX #$74
    BCS Sound_ResetCurrentSound
    LDA #$85ae,X
    PHA
    LDA #$85ad,X
    PHA
    RTS


;============================================================================
; TODO: Document Sound_Init
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     thunk_Sound_Init
;============================================================================
Sound_Init:                                 ; [$8681]
    LDA #$00
    STA a:DMC_RAW
    STA a:SOUND_DAT_0123
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0125
    STA a:SOUND_DAT_0126
    STA a:CurrentSoundIndex
    JSR ResetAudio
    LDA #$0f
    STA a:SND_CHN
    RTS
    hex a9 06 8d 26 01 a9 00 8d 27 01 a9 1f 8d 0c 40 ad ; [$869e] undefined
    hex 27 01 29 02 aa bd d1 86 8d 0e 40 a9 00 8d 0f 40 ; [$86ae] undefined
    hex ee 27 01 ad 27 01 c9 04 90 08 a9 10 8d 0c 40 4c ; [$86be] undefined
    db $26,$86,$60                          ; [$86ce] undefined

    db $10,$01,$a9,$14,$8d,$24,$01,$8d,$26,$01,$a9,$00,$8d,$27,$01,$ae ; [$86d2]
                                                                       ; byte
    db $27,$01,$bd,$24,$87,$c9,$ff,$d0,$0b,$a9,$10,$8d,$04,$40,$8d,$0c ; [$86e1]
                                                                       ; byte
    db $40,$4c,$26,$86,$20,$d1,$8e,$a9,$5f,$8d,$04,$40,$8d,$0c,$40,$ad ; [$86f1]
                                                                       ; byte
    db $27,$01,$49,$0f,$09,$98,$8d,$05,$40,$ad,$2a,$01,$8d,$06,$40,$29 ; [$8701]
                                                                       ; byte
    db $07,$8d,$0e,$40,$a9,$00,$8d,$0f,$40,$ad,$2b,$01,$8d,$07,$40,$ee ; [$8711]
                                                                       ; byte
    db $27,$01,$60,$62,$4e,$3c,$50,$48,$65,$51,$48,$56,$52,$5f,$58,$65 ; [$8721]
                                                                       ; byte
    db $4d,$55,$ff,$a9,$16,$8d,$26,$01,$a9,$14,$8d,$27,$01,$a9,$00,$8d ; [$8731]
                                                                       ; byte
    db $28,$01,$ce,$27,$01,$d0,$08,$a9,$10,$8d,$0c,$40,$4c,$26,$86,$ae ; [$8741]
                                                                       ; byte
    db $28,$01,$a9,$1f,$8d,$0c,$40,$bd,$67,$87,$8d,$0e,$40,$a9,$00,$8d ; [$8751]
                                                                       ; byte
    db $0f,$40,$ee,$28,$01,$60,$0f,$0c,$0e,$0b,$0d,$09,$03,$02,$01,$00 ; [$8761]
                                                                       ; byte
    db $a9,$0f,$8d,$24,$01,$a9,$00,$8d,$27,$01,$ae,$27,$01,$bd,$aa,$87 ; [$8771]
                                                                       ; byte
    db $c9,$ff,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$20,$d1,$8e,$a9 ; [$8781]
                                                                       ; byte
    db $df,$8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$2a,$01,$8d,$06,$40,$ad ; [$8791]
                                                                       ; byte
    db $2b,$01,$8d,$07,$40,$ee,$27,$01,$60,$29,$24,$28,$22,$1f,$29,$2b ; [$87a1]
                                                                       ; byte
    db $2c,$2d,$2a,$ff,$a9,$32,$8d,$24,$01,$a9,$00,$8d,$27,$01,$8d,$28 ; [$87b1]
                                                                       ; byte
    db $01,$ae,$28,$01,$bd,$00,$88,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26 ; [$87c1]
                                                                       ; byte
    db $86,$09,$50,$8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$27,$01,$29,$03 ; [$87d1]
                                                                       ; byte
    db $aa,$bd,$06,$88,$8d,$06,$40,$a9,$00,$8d,$07,$40,$ee,$27,$01,$ad ; [$87e1]
                                                                       ; byte
    db $27,$01,$c9,$08,$d0,$08,$a9,$00,$8d,$27,$01,$ee,$28,$01,$60,$0f ; [$87f1]
                                                                       ; byte
    db $0b,$07,$04,$01,$00,$b0,$a0,$a8,$98,$a9,$3c,$8d,$24,$01,$8d,$26 ; [$8801]
                                                                       ; byte
    db $01,$a9,$37,$8d,$29,$01,$a9,$00,$8d,$27,$01,$8d,$28,$01,$ce,$29 ; [$8811]
                                                                       ; byte
    db $01,$d0,$0b,$a9,$10,$8d,$04,$40,$8d,$0c,$40,$4c,$26,$86,$ad,$27 ; [$8821]
                                                                       ; byte
    db $01,$4a,$4a,$49,$ff,$29,$0f,$09,$50,$8d,$0c,$40,$8d,$04,$40,$a9 ; [$8831]
                                                                       ; byte
    db $00,$8d,$05,$40,$ad,$27,$01,$29,$07,$a8,$a9,$60,$38,$f9,$65,$88 ; [$8841]
                                                                       ; byte
    db $8d,$06,$40,$29,$0f,$8d,$0e,$40,$a9,$00,$8d,$07,$40,$8d,$0f,$40 ; [$8851]
                                                                       ; byte
    db $ee,$27,$01,$60,$00,$03,$0a,$15,$25,$15,$0a,$03,$a9,$28,$8d,$24 ; [$8861]
                                                                       ; byte
    db $01,$a9,$00,$8d,$27,$01,$ad,$24,$01,$29,$01,$d0,$35,$ae,$27,$01 ; [$8871]
                                                                       ; byte
    db $bd,$b4,$88,$c9,$ff,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$20 ; [$8881]
                                                                       ; byte
    db $d1,$8e,$ee,$27,$01,$ad,$27,$01,$49,$ff,$29,$0f,$09,$d4,$8d,$04 ; [$8891]
                                                                       ; byte
    db $40,$a9,$91,$8d,$05,$40,$ad,$2a,$01,$8d,$06,$40,$ad,$2b,$01,$8d ; [$88a1]
                                                                       ; byte
    db $07,$40,$60,$2b,$2d,$2f,$24,$38,$2a,$37,$39,$3b,$24,$38,$42,$2b ; [$88b1]
                                                                       ; byte
    db $2d,$2f,$18,$ff,$a9,$3c,$8d,$24,$01,$a9,$00,$8d,$27,$01,$8d,$28 ; [$88c1]
                                                                       ; byte
    db $01,$ae,$27,$01,$bd,$18,$89,$c9,$ff,$d0,$09,$ee,$28,$01,$a9,$00 ; [$88d1]
                                                                       ; byte
    db $8d,$27,$01,$60,$20,$d1,$8e,$ae,$28,$01,$bd,$12,$89,$d0,$08,$a9 ; [$88e1]
                                                                       ; byte
    db $10,$8d,$04,$40,$4c,$26,$86,$09,$90,$8d,$04,$40,$a9,$00,$8d,$05 ; [$88f1]
                                                                       ; byte
    db $40,$ad,$2a,$01,$8d,$06,$40,$ad,$2b,$01,$8d,$07,$40,$ee,$27,$01 ; [$8901]
                                                                       ; byte
    db $60,$0f,$0c,$09,$05,$02,$00,$3f,$43,$4a,$55,$5b,$60,$ff,$a9,$1e ; [$8911]
                                                                       ; byte
    db $8d,$24,$01,$a9,$50,$8d,$27,$01,$a9,$00,$8d,$28,$01,$ae,$28,$01 ; [$8921]
                                                                       ; byte
    db $bd,$6d,$89,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$09,$d0,$8d ; [$8931]
                                                                       ; byte
    db $04,$40,$a9,$00,$8d,$05,$40,$ad,$27,$01,$8d,$06,$40,$18,$69,$04 ; [$8941]
                                                                       ; byte
    db $8d,$06,$40,$a9,$00,$8d,$07,$40,$ad,$27,$01,$38,$e9,$10,$8d,$27 ; [$8951]
                                                                       ; byte
    db $01,$d0,$08,$ee,$28,$01,$a9,$50,$8d,$27,$01,$60,$0f,$0c,$09,$06 ; [$8961]
                                                                       ; byte
    db $03,$00,$a9,$1e,$8d,$26,$01,$a9,$20,$8d,$27,$01,$a9,$00,$8d,$28 ; [$8971]
                                                                       ; byte
    db $01,$ce,$27,$01,$d0,$08,$a9,$10,$8d,$0c,$40,$4c,$26,$86,$ad,$27 ; [$8981]
                                                                       ; byte
    db $01,$4a,$29,$0f,$09,$10,$8d,$0c,$40,$ad,$27,$01,$29,$0f,$8d,$0e ; [$8991]
                                                                       ; byte
    db $40,$a9,$00,$8d,$0f,$40,$60,$a9,$16,$8d,$24,$01,$a9,$0f,$8d,$27 ; [$89a1]
                                                                       ; byte
    db $01,$ad,$27,$01,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$ad,$27 ; [$89b1]
                                                                       ; byte
    db $01,$29,$0f,$09,$50,$8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$27,$01 ; [$89c1]
                                                                       ; byte
    db $29,$07,$a8,$ad,$27,$01,$29,$02,$8d,$28,$01,$ad,$27,$01,$29,$01 ; [$89d1]
                                                                       ; byte
    db $18,$6d,$28,$01,$aa,$bd,$f9,$89,$38,$f9,$fd,$89,$8d,$06,$40,$a9 ; [$89e1]
                                                                       ; byte
    db $00,$8d,$07,$40,$ce,$27,$01,$60,$51,$34,$b8,$93,$00,$01,$03,$06 ; [$89f1]
                                                                       ; byte
    db $0a,$06,$03,$01,$a9,$14,$8d,$24,$01,$a9,$10,$8d,$27,$01,$ce,$27 ; [$8a01]
                                                                       ; byte
    db $01,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$ad,$27,$01,$09,$90 ; [$8a11]
                                                                       ; byte
    db $8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$27,$01,$29,$01,$aa,$bd,$3b ; [$8a21]
                                                                       ; byte
    db $8a,$8d,$06,$40,$a9,$00,$8d,$07,$40,$60,$30,$1a,$a9,$1e,$8d,$24 ; [$8a31]
                                                                       ; byte
    db $01,$a9,$00,$8d,$27,$01,$ee,$27,$01,$ad,$27,$01,$4a,$4a,$aa,$bd ; [$8a41]
                                                                       ; byte
    db $79,$8a,$c9,$ff,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$20,$d1 ; [$8a51]
                                                                       ; byte
    db $8e,$a9,$bf,$8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$2a,$01,$8d,$06 ; [$8a61]
                                                                       ; byte
    db $40,$ad,$2b,$01,$8d,$07,$40,$60,$37,$39,$32,$34,$ff,$a9,$0a,$8d ; [$8a71]
                                                                       ; byte
    db $24,$01,$a9,$02,$8d,$27,$01,$a9,$81,$8d,$04,$40,$a9,$00,$8d,$05 ; [$8a81]
                                                                       ; byte
    db $40,$a9,$8e,$8d,$06,$40,$a9,$10,$8d,$07,$40,$60,$a9,$20,$8d,$26 ; [$8a91]
                                                                       ; byte
    db $01,$a9,$1e,$8d,$27,$01,$ad,$27,$01,$d0,$08,$a9,$10,$8d,$0c,$40 ; [$8aa1]
                                                                       ; byte
    db $4c,$26,$86,$a9,$1f,$8d,$0c,$40,$ad,$27,$01,$29,$01,$aa,$bd,$ce ; [$8ab1]
                                                                       ; byte
    db $8a,$8d,$0e,$40,$a9,$00,$8d,$0f,$40,$ce,$27,$01,$60,$0f,$0b,$a9 ; [$8ac1]
                                                                       ; byte
    db $32,$8d,$24,$01,$a9,$08,$8d,$27,$01,$a9,$86,$8d,$04,$40,$a9,$00 ; [$8ad1]
                                                                       ; byte
    db $8d,$05,$40,$ad,$27,$01,$c9,$05,$d0,$0a,$a9,$35,$8d,$06,$40,$a9 ; [$8ae1]
                                                                       ; byte
    db $20,$8d,$07,$40,$ce,$27,$01,$d0,$0d,$a9,$20,$8d,$06,$40,$a9,$30 ; [$8af1]
                                                                       ; byte
    db $8d,$07,$40,$4c,$26,$86,$60,$a9,$23,$8d,$24,$01,$8d,$26,$01,$a9 ; [$8b01]
                                                                       ; byte
    db $16,$8d,$28,$01,$a9,$00,$8d,$27,$01,$a9,$1e,$8d,$29,$01,$ce,$29 ; [$8b11]
                                                                       ; byte
    db $01,$d0,$0b,$a9,$10,$8d,$04,$40,$8d,$0c,$40,$4c,$26,$86,$ad,$24 ; [$8b21]
                                                                       ; byte
    db $01,$29,$01,$d0,$2e,$a9,$df,$8d,$04,$40,$a9,$16,$8d,$0c,$40,$a9 ; [$8b31]
                                                                       ; byte
    db $a3,$8d,$05,$40,$ad,$27,$01,$8d,$06,$40,$18,$69,$10,$8d,$27,$01 ; [$8b41]
                                                                       ; byte
    db $ce,$28,$01,$ad,$28,$01,$29,$0f,$8d,$0e,$40,$a9,$12,$8d,$07,$40 ; [$8b51]
                                                                       ; byte
    db $8d,$0f,$40,$60,$a9,$46,$8d,$24,$01,$a9,$00,$8d,$27,$01,$ad,$24 ; [$8b61]
                                                                       ; byte
    db $01,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$ad,$27,$01,$29,$3c ; [$8b71]
                                                                       ; byte
    db $4a,$4a,$29,$0f,$09,$f0,$8d,$04,$40,$a9,$00,$8d,$05,$40,$a9,$01 ; [$8b81]
                                                                       ; byte
    db $8d,$07,$40,$ad,$27,$01,$29,$07,$aa,$ad,$27,$01,$18,$69,$32,$38 ; [$8b91]
                                                                       ; byte
    db $fd,$ab,$8b,$8d,$06,$40,$ee,$27,$01,$60,$00,$08,$14,$20,$2d,$20 ; [$8ba1]
                                                                       ; byte
    db $14,$08,$a9,$23,$8d,$24,$01,$a9,$00,$8d,$27,$01,$a9,$19,$8d,$29 ; [$8bb1]
                                                                       ; byte
    db $01,$8d,$28,$01,$ce,$28,$01,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26 ; [$8bc1]
                                                                       ; byte
    db $86,$ad,$27,$01,$29,$03,$a8,$b9,$01,$8c,$8d,$04,$40,$a9,$aa,$8d ; [$8bd1]
                                                                       ; byte
    db $05,$40,$ad,$27,$01,$29,$01,$aa,$bd,$05,$8c,$0d,$29,$01,$ed,$27 ; [$8be1]
                                                                       ; byte
    db $01,$8d,$29,$01,$8d,$06,$40,$a9,$00,$8d,$07,$40,$ee,$27,$01,$60 ; [$8bf1]
                                                                       ; byte
    db $1f,$5f,$9f,$df,$60,$30,$a9,$1e,$8d,$24,$01,$8d,$26,$01,$a9,$0f ; [$8c01]
                                                                       ; byte
    db $8d,$29,$01,$a9,$01,$8d,$27,$01,$a9,$07,$8d,$28,$01,$ce,$27,$01 ; [$8c11]
                                                                       ; byte
    db $d0,$45,$ce,$28,$01,$ad,$28,$01,$8d,$27,$01,$d0,$0b,$a9,$10,$8d ; [$8c21]
                                                                       ; byte
    db $04,$40,$8d,$0c,$40,$4c,$26,$86,$a9,$48,$8d,$04,$40,$a9,$00,$8d ; [$8c31]
                                                                       ; byte
    db $05,$40,$ad,$29,$01,$09,$10,$8d,$0c,$40,$ad,$29,$01,$29,$07,$8d ; [$8c41]
                                                                       ; byte
    db $0e,$40,$a9,$00,$8d,$0f,$40,$ad,$29,$01,$09,$18,$8d,$06,$40,$a9 ; [$8c51]
                                                                       ; byte
    db $00,$8d,$07,$40,$ce,$29,$01,$60,$a9,$05,$8d,$26,$01,$a9,$03,$8d ; [$8c61]
                                                                       ; byte
    db $27,$01,$a9,$01,$8d,$0c,$40,$ad,$27,$01,$c9,$03,$d0,$0a,$a9,$0a ; [$8c71]
                                                                       ; byte
    db $8d,$0e,$40,$a9,$00,$8d,$0f,$40,$ce,$27,$01,$d0,$0d,$a9,$02,$8d ; [$8c81]
                                                                       ; byte
    db $0e,$40,$a9,$10,$8d,$0f,$40,$4c,$26,$86,$60,$a9,$41,$8d,$23,$01 ; [$8c91]
                                                                       ; byte
    db $8d,$24,$01,$8d,$25,$01,$8d,$26,$01,$a9,$00,$8d,$27,$01,$a9,$3c ; [$8ca1]
                                                                       ; byte
    db $8d,$28,$01,$a9,$00,$8d,$08,$40,$8d,$0a,$40,$8d,$0a,$40,$ce,$28 ; [$8cb1]
                                                                       ; byte
    db $01,$d0,$0e,$a9,$10,$8d,$00,$40,$8d,$04,$40,$8d,$0c,$40,$4c,$26 ; [$8cc1]
                                                                       ; byte
    db $86,$ad,$27,$01,$49,$ff,$4a,$4a,$29,$0f,$09,$d0,$8d,$04,$40,$29 ; [$8cd1]
                                                                       ; byte
    db $5f,$8d,$00,$40,$a9,$1f,$8d,$0c,$40,$a9,$00,$8d,$05,$40,$8d,$01 ; [$8ce1]
                                                                       ; byte
    db $40,$ad,$27,$01,$29,$03,$aa,$bd,$28,$8d,$20,$d1,$8e,$ad,$2a,$01 ; [$8cf1]
                                                                       ; byte
    db $18,$6d,$27,$01,$8d,$06,$40,$18,$69,$10,$8d,$02,$40,$ad,$2b,$01 ; [$8d01]
                                                                       ; byte
    db $8d,$07,$40,$8d,$03,$40,$ad,$27,$01,$29,$03,$8d,$0e,$40,$a9,$00 ; [$8d11]
                                                                       ; byte
    db $8d,$0f,$40,$ee,$27,$01,$60,$4f,$32,$4c,$3c,$a9,$0a,$8d,$26,$01 ; [$8d21]
                                                                       ; byte
    db $a9,$03,$8d,$27,$01,$a9,$07,$8d,$0c,$40,$ad,$27,$01,$c9,$03,$d0 ; [$8d31]
                                                                       ; byte
    db $0a,$a9,$0f,$8d,$0e,$40,$a9,$18,$8d,$0f,$40,$ce,$27,$01,$d0,$0d ; [$8d41]
                                                                       ; byte
    db $a9,$05,$8d,$0e,$40,$a9,$18,$8d,$0f,$40,$4c,$26,$86,$60,$a9,$23 ; [$8d51]
                                                                       ; byte
    db $8d,$24,$01,$a9,$00,$8d,$27,$01,$8d,$28,$01,$a9,$20,$8d,$29,$01 ; [$8d61]
                                                                       ; byte
    db $ce,$29,$01,$ad,$29,$01,$4a,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26 ; [$8d71]
                                                                       ; byte
    db $86,$09,$d0,$8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$28,$01,$29,$03 ; [$8d81]
                                                                       ; byte
    db $aa,$bd,$b5,$8d,$20,$d1,$8e,$ad,$2a,$01,$38,$ed,$27,$01,$8d,$06 ; [$8d91]
                                                                       ; byte
    db $40,$ad,$2b,$01,$8d,$07,$40,$ee,$27,$01,$ee,$27,$01,$ee,$27,$01 ; [$8da1]
                                                                       ; byte
    db $ee,$28,$01,$60,$5b,$4f,$43,$37,$a9,$0a,$8d,$24,$01,$a9,$02,$8d ; [$8db1]
                                                                       ; byte
    db $27,$01,$a9,$82,$8d,$04,$40,$a9,$00,$8d,$05,$40,$a9,$28,$8d,$06 ; [$8dc1]
                                                                       ; byte
    db $40,$a9,$10,$8d,$07,$40,$60,$a9,$44,$8d,$24,$01,$8d,$26,$01,$a9 ; [$8dd1]
                                                                       ; byte
    db $00,$8d,$27,$01,$8d,$28,$01,$8d,$29,$01,$ad,$29,$01,$4a,$aa,$bd ; [$8de1]
                                                                       ; byte
    db $5f,$8e,$d0,$0b,$a9,$10,$8d,$04,$40,$8d,$0c,$40,$4c,$26,$86,$09 ; [$8df1]
                                                                       ; byte
    db $90,$8d,$0c,$40,$8d,$04,$40,$a9,$00,$8d,$05,$40,$ad,$27,$01,$0a ; [$8e01]
                                                                       ; byte
    db $8d,$28,$01,$ae,$27,$01,$bd,$66,$8e,$c9,$ff,$f0,$38,$20,$d1,$8e ; [$8e11]
                                                                       ; byte
    db $ad,$2a,$01,$18,$6d,$28,$01,$8d,$06,$40,$ad,$2b,$01,$8d,$07,$40 ; [$8e21]
                                                                       ; byte
    db $ad,$27,$01,$29,$01,$aa,$bd,$64,$8e,$18,$6d,$27,$01,$29,$0f,$8d ; [$8e31]
                                                                       ; byte
    db $0e,$40,$a9,$00,$8d,$0f,$40,$ee,$27,$01,$ad,$27,$01,$29,$07,$d0 ; [$8e41]
                                                                       ; byte
    db $03,$ee,$29,$01,$60,$a9,$00,$8d,$27,$01,$ee,$29,$01,$60,$0f,$0d ; [$8e51]
                                                                       ; byte
    db $09,$05,$00,$0c,$07,$24,$27,$2b,$30,$48,$4b,$4f,$54,$33,$44,$52 ; [$8e61]
                                                                       ; byte
    db $57,$57,$5c,$62,$ff,$a9,$18,$8d,$24,$01,$a9,$ff,$8d,$27,$01,$a9 ; [$8e71]
                                                                       ; byte
    db $00,$8d,$28,$01,$8d,$29,$01,$ad,$28,$01,$4a,$4a,$aa,$bd,$c5,$8e ; [$8e81]
                                                                       ; byte
    db $8d,$29,$01,$d0,$08,$a9,$10,$8d,$04,$40,$4c,$26,$86,$a9,$df,$8d ; [$8e91]
                                                                       ; byte
    db $04,$40,$a9,$00,$8d,$05,$40,$ad,$27,$01,$38,$ed,$29,$01,$8d,$27 ; [$8ea1]
                                                                       ; byte
    db $01,$8d,$06,$40,$8a,$29,$03,$aa,$bd,$c5,$8e,$29,$01,$8d,$07,$40 ; [$8eb1]
                                                                       ; byte
    db $ee,$28,$01,$60,$1f,$36,$63,$76,$c8,$00,$4c,$1f,$89,$4c,$2e,$89 ; [$8ec1]
                                                                       ; byte


;============================================================================
; TODO: Document FUN_PRG5__8ed1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG5__8ed1:                             ; [$8ed1]
    SEC
    SBC #$18
    LDY #$01
    SEC

  @LAB_PRG5__8ed7:                          ; [$8ed7]
    SBC #$0c
    INY
    BCS @LAB_PRG5__8ed7
    DEY
    ADC #$0d
    ASL A
    TAX
    LDA #$8552,X
    STA a:BYTE_012a
    LDA #$8553,X
    STA a:BYTE_012b

  @LAB_PRG5__8eed:                          ; [$8eed]
    DEY
    BEQ @_return
    LSR a:BYTE_012b
    ROR a:BYTE_012a
    JMP @LAB_PRG5__8eed

  @_return:                                 ; [$8ef9]
    RTS


;============================================================================
; Music lookup table.
;
; Entries are 8 bytes.
;============================================================================

;
; XREFS:
;     Audio_HandleOnInterrupt
;
MUSIC_LOOKUP:                               ; [$8efa]
    db $ff                                  ; [$8efa] byte

;
; XREFS:
;     FUN_PRG5__84b7
;
BYTE_PRG5__8efb:                            ; [$8efb]
    db $7c,$8f,$20,$90,$61,$91,$8e,$92,$b9,$93,$58,$94,$40,$95,$60,$96 ; [$8efb]
                                                                       ; byte
    db $62,$96,$1c,$97,$7a,$98,$48,$9a,$92,$9a,$15,$9b,$bd,$9b,$5f,$9c ; [$8f0b]
                                                                       ; byte
    db $38,$9d,$af,$9d,$73,$9e,$e0,$9e,$e2,$9e,$67,$9f,$fa,$9f,$b1,$a0 ; [$8f1b]
                                                                       ; byte
    db $63,$a1,$1b,$a2,$d1,$a2,$b8,$a3,$a1,$a4,$30,$a5,$bb,$a5,$5c,$a6 ; [$8f2b]
                                                                       ; byte
    db $5e,$a6,$b0,$a6,$00,$a7,$8a,$a7,$b9,$a7,$16,$a8,$74,$a8,$f8,$a8 ; [$8f3b]
                                                                       ; byte
    db $fa,$a8,$3e,$a9,$82,$a9,$1c,$aa,$87,$aa,$47,$ab,$99,$ac,$dd,$ad ; [$8f4b]
                                                                       ; byte
    db $20,$af,$49,$af,$72,$af,$aa,$af,$ac,$af,$07,$b0,$42,$b0,$73,$b0 ; [$8f5b]
                                                                       ; byte
    db $75,$b0,$b8,$b0,$fb,$b0,$42,$b1,$44,$b1,$cc,$b1,$77,$b2,$21,$b3 ; [$8f6b]
                                                                       ; byte
    db $ff,$f7,$ff,$f1,$00,$f2,$d0,$f0,$00,$f6,$f4,$86,$1f,$21,$23,$24 ; [$8f7b]
                                                                       ; byte
    db $26,$28,$29,$2a,$2b,$2d,$2f,$30,$32,$34,$35,$36,$f2,$d0,$fd,$02 ; [$8f8b]
                                                                       ; byte
    db $b0,$37,$3c,$3e,$45,$c8,$43,$8c,$3c,$3e,$3f,$3c,$3f,$3e,$00,$3b ; [$8f9b]
                                                                       ; byte
    db $98,$37,$fc,$fd,$02,$a4,$43,$8c,$3c,$b0,$3c,$8c,$41,$41,$40,$a4 ; [$8fab]
                                                                       ; byte
    db $3c,$8c,$37,$39,$a4,$3a,$8c,$3a,$39,$3a,$39,$bc,$37,$fb,$01,$86 ; [$8fbb]
                                                                       ; byte
    db $37,$39,$3b,$3c,$3e,$40,$41,$42,$fc,$fb,$02,$86,$3c,$3b,$3c,$3e ; [$8fcb]
                                                                       ; byte
    db $40,$41,$42,$43,$b0,$44,$46,$c8,$43,$8c,$3c,$3e,$3f,$3f,$41,$3e ; [$8fdb]
                                                                       ; byte
    db $00,$3c,$3a,$98,$37,$86,$38,$37,$8c,$35,$92,$37,$86,$30,$33,$37 ; [$8feb]
                                                                       ; byte
    db $3c,$37,$3c,$3f,$b0,$44,$46,$bc,$43,$8c,$3c,$3c,$3e,$3f,$3f,$41 ; [$8ffb]
                                                                       ; byte
    db $3e,$00,$3c,$98,$3a,$8c,$3f,$3f,$41,$3e,$00,$3c,$3a,$f3,$cc,$3c ; [$900b]
                                                                       ; byte
    db $d4,$00,$ec,$3c,$ff,$f1,$03,$f2,$90,$f0,$00,$ee,$02,$98,$00,$86 ; [$901b]
                                                                       ; byte
    db $21,$23,$24,$26,$28,$29,$2b,$2d,$2f,$30,$32,$33,$ee,$00,$f2,$50 ; [$902b]
                                                                       ; byte
    db $fd,$02,$86,$34,$34,$34,$00,$3c,$2b,$34,$34,$34,$34,$34,$00,$3c ; [$903b]
                                                                       ; byte
    db $2b,$34,$34,$35,$35,$35,$00,$3c,$2d,$35,$35,$35,$35,$35,$00,$3c ; [$904b]
                                                                       ; byte
    db $2d,$35,$35,$34,$34,$34,$00,$3c,$2b,$34,$34,$34,$30,$2b,$30,$34 ; [$905b]
                                                                       ; byte
    db $34,$37,$37,$2c,$30,$33,$38,$3c,$38,$2b,$00,$00,$00,$22,$26,$2b ; [$906b]
                                                                       ; byte
    db $2f,$32,$2f,$fc,$fd,$02,$86,$34,$37,$2b,$30,$34,$37,$2b,$30,$34 ; [$907b]
                                                                       ; byte
    db $37,$2b,$30,$34,$37,$2b,$30,$35,$37,$2b,$30,$34,$37,$2b,$30,$34 ; [$908b]
                                                                       ; byte
    db $37,$2b,$30,$34,$37,$30,$34,$27,$2b,$2e,$33,$37,$33,$2e,$2b,$29 ; [$909b]
                                                                       ; byte
    db $2d,$30,$35,$30,$2d,$2b,$26,$fb,$01,$86,$2b,$30,$34,$30,$2b,$30 ; [$90ab]
                                                                       ; byte
    db $34,$30,$34,$35,$37,$39,$3b,$3c,$3e,$3f,$fc,$fb,$02,$86,$2b,$30 ; [$90bb]
                                                                       ; byte
    db $34,$30,$2b,$30,$34,$30,$34,$33,$34,$35,$37,$39,$3b,$3c,$fd,$02 ; [$90cb]
                                                                       ; byte
    db $86,$2c,$30,$33,$38,$3c,$3f,$3c,$38,$2e,$32,$35,$3a,$3e,$41,$3e ; [$90db]
                                                                       ; byte
    db $3a,$24,$28,$2b,$30,$34,$37,$3c,$40,$3c,$37,$34,$30,$2b,$28,$24 ; [$90eb]
                                                                       ; byte
    db $28,$2c,$30,$33,$38,$3c,$38,$35,$32,$2e,$29,$2e,$32,$35,$32,$2e ; [$90fb]
                                                                       ; byte
    db $32,$fb,$01,$8c,$33,$86,$35,$33,$8c,$30,$30,$86,$24,$27,$2b,$30 ; [$910b]
                                                                       ; byte
    db $33,$30,$2b,$27,$fc,$fb,$02,$86,$33,$38,$3c,$38,$33,$38,$8c,$3a ; [$911b]
                                                                       ; byte
    db $00,$35,$37,$92,$34,$86,$30,$2b,$30,$28,$2b,$24,$28,$34,$30,$2b ; [$912b]
                                                                       ; byte
    db $30,$28,$2b,$24,$28,$32,$2e,$29,$2e,$26,$29,$22,$26,$32,$2e,$29 ; [$913b]
                                                                       ; byte
    db $2e,$26,$29,$22,$26,$30,$2c,$27,$2c,$24,$27,$20,$24,$33,$30,$2c ; [$914b]
                                                                       ; byte
    db $30,$27,$2c,$ec,$27,$ff,$b0,$00,$86,$23,$24,$26,$28,$29,$2b,$2d ; [$915b]
                                                                       ; byte
    db $2f,$fd,$02,$86,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18 ; [$916b]
                                                                       ; byte
    db $18,$00,$18,$18,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18 ; [$917b]
                                                                       ; byte
    db $18,$00,$18,$18,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18 ; [$918b]
                                                                       ; byte
    db $18,$00,$18,$18,$14,$14,$20,$20,$14,$14,$13,$00,$00,$00,$1f,$1f ; [$919b]
                                                                       ; byte
    db $13,$13,$13,$13,$fc,$fd,$02,$86,$18,$18,$18,$18,$18,$00,$18,$18 ; [$91ab]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00,$18,$18 ; [$91bb]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$00,$18,$18,$1b,$1b,$1b,$1b,$1b,$00,$1b,$1b ; [$91cb]
                                                                       ; byte
    db $1d,$1d,$1d,$1d,$1d,$00,$1d,$1d,$18,$18,$18,$18,$18,$00,$18,$18 ; [$91db]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$00,$18,$18,$fc,$14,$14,$14,$14,$14,$14,$14 ; [$91eb]
                                                                       ; byte
    db $14,$16,$16,$16,$16,$16,$16,$16,$16,$18,$18,$18,$18,$18,$00,$18 ; [$91fb]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$00,$18,$18,$14,$14,$14,$14,$14,$14,$16 ; [$920b]
                                                                       ; byte
    db $00,$00,$00,$16,$16,$16,$16,$16,$16,$18,$18,$18,$18,$18,$00,$18 ; [$921b]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$00,$18,$18,$14,$14,$14,$14,$14,$14,$14 ; [$922b]
                                                                       ; byte
    db $14,$16,$16,$16,$16,$16,$16,$16,$16,$18,$18,$18,$18,$18,$00,$18 ; [$923b]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$00,$18,$18,$14,$14,$14,$14,$14,$14,$16 ; [$924b]
                                                                       ; byte
    db $00,$00,$00,$16,$16,$16,$16,$16,$16,$14,$14,$14,$14,$14,$14,$16 ; [$925b]
                                                                       ; byte
    db $00,$00,$00,$16,$16,$16,$16,$98,$18,$8c,$18,$18,$18,$18,$18,$18 ; [$926b]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18 ; [$927b]
                                                                       ; byte
    db $ec,$20,$ff,$8c,$21,$00,$21,$00,$86,$31,$21,$31,$31,$31,$21,$31 ; [$928b]
                                                                       ; byte
    db $31,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$929b]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31 ; [$92ab]
                                                                       ; byte
    db $00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31 ; [$92bb]
                                                                       ; byte
    db $31,$31,$00,$31,$31,$8c,$21,$21,$21,$21,$21,$21,$86,$31,$00,$8c ; [$92cb]
                                                                       ; byte
    db $21,$21,$86,$21,$21,$fc,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86 ; [$92db]
                                                                       ; byte
    db $31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c ; [$92eb]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$92fb]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31 ; [$930b]
                                                                       ; byte
    db $00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$21,$21,$21,$00 ; [$931b]
                                                                       ; byte
    db $fc,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$932b]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31 ; [$933b]
                                                                       ; byte
    db $00,$31,$31,$8c,$21,$86,$31,$31,$fb,$01,$86,$31,$00,$31,$31,$8c ; [$934b]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$935b]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31,$31,$00,$8c,$21,$86,$21,$21,$21,$00,$fc ; [$936b]
                                                                       ; byte
    db $fb,$02,$8c,$21,$21,$21,$21,$86,$31,$31,$8c,$21,$21,$86,$21,$21 ; [$937b]
                                                                       ; byte
    db $8c,$21,$21,$21,$21,$00,$21,$21,$fd,$02,$86,$31,$00,$31,$31,$31 ; [$938b]
                                                                       ; byte
    db $00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$fc,$31,$00,$31,$31 ; [$939b]
                                                                       ; byte
    db $31,$00,$31,$31,$31,$00,$31,$31,$31,$31,$ec,$31,$ff,$ff,$f1,$01 ; [$93ab]
                                                                       ; byte
    db $f2,$90,$f0,$01,$ef,$02,$fd,$02,$98,$2d,$2f,$30,$37,$c8,$36,$98 ; [$93bb]
                                                                       ; byte
    db $32,$c8,$35,$98,$2f,$e0,$34,$98,$2d,$2f,$30,$37,$c8,$36,$98,$32 ; [$93cb]
                                                                       ; byte
    db $c8,$35,$98,$2f,$e0,$2f,$98,$32,$34,$35,$3c,$c8,$3b,$98,$38,$c8 ; [$93db]
                                                                       ; byte
    db $39,$98,$34,$e0,$30,$98,$30,$32,$34,$39,$33,$34,$36,$3b,$e0,$3b ; [$93eb]
                                                                       ; byte
    db $fb,$01,$e0,$34,$fc,$fb,$02,$a4,$34,$8c,$34,$39,$34,$39,$3c,$98 ; [$93fb]
                                                                       ; byte
    db $3f,$3c,$3b,$38,$a4,$39,$8c,$34,$39,$34,$39,$3c,$98,$40,$41,$3c ; [$940b]
                                                                       ; byte
    db $3e,$a4,$3a,$8c,$41,$40,$3c,$3b,$38,$39,$34,$30,$34,$98,$2d,$2c ; [$941b]
                                                                       ; byte
    db $8c,$2b,$00,$00,$f2,$90,$f0,$00,$34,$35,$36,$37,$38,$e0,$00,$a4 ; [$942b]
                                                                       ; byte
    db $00,$8c,$38,$37,$36,$35,$34,$e0,$00,$a4,$00,$8c,$34,$35,$36,$37 ; [$943b]
                                                                       ; byte
    db $38,$e0,$00,$a4,$00,$8c,$38,$37,$36,$35,$34,$f4,$ff,$f1,$05,$f2 ; [$944b]
                                                                       ; byte
    db $13,$f0,$01,$f2,$90,$8c,$00,$98,$2d,$2f,$30,$37,$c8,$36,$98,$32 ; [$945b]
                                                                       ; byte
    db $c8,$35,$98,$2f,$e0,$34,$98,$2d,$2f,$30,$37,$c8,$36,$98,$32,$c8 ; [$946b]
                                                                       ; byte
    db $35,$98,$2f,$e0,$2f,$98,$32,$34,$35,$3c,$c8,$3b,$98,$38,$c8,$39 ; [$947b]
                                                                       ; byte
    db $98,$34,$e0,$30,$98,$30,$32,$34,$39,$33,$34,$36,$3b,$e0,$3b,$f1 ; [$948b]
                                                                       ; byte
    db $03,$8c,$34,$32,$2f,$30,$2d,$2f,$2c,$b0,$00,$98,$2d,$2f,$2d,$2f ; [$949b]
                                                                       ; byte
    db $30,$2d,$2f,$30,$2f,$2d,$2c,$29,$28,$26,$24,$28,$2d,$2f,$2d,$2f ; [$94ab]
                                                                       ; byte
    db $30,$2d,$2f,$2d,$29,$26,$28,$2f,$2c,$28,$00,$00,$32,$30,$2f,$2d ; [$94bb]
                                                                       ; byte
    db $2c,$28,$00,$31,$2d,$31,$2d,$2a,$27,$b0,$24,$98,$28,$2d,$30,$2f ; [$94cb]
                                                                       ; byte
    db $30,$2f,$33,$34,$2d,$2f,$2c,$a4,$30,$8c,$30,$34,$30,$34,$39,$3c ; [$94db]
                                                                       ; byte
    db $3c,$39,$39,$38,$38,$32,$32,$a4,$30,$8c,$30,$34,$30,$34,$39,$3c ; [$94eb]
                                                                       ; byte
    db $3c,$3e,$3e,$34,$34,$3b,$3b,$a4,$35,$8c,$3e,$3c,$39,$38,$32,$34 ; [$94fb]
                                                                       ; byte
    db $30,$2d,$30,$98,$28,$27,$8c,$26,$00,$00,$f1,$03,$f2,$50,$f0,$00 ; [$950b]
                                                                       ; byte
    db $30,$31,$32,$33,$34,$e0,$00,$a4,$00,$8c,$34,$33,$32,$31,$30,$e0 ; [$951b]
                                                                       ; byte
    db $00,$a4,$00,$8c,$30,$31,$32,$33,$34,$e0,$00,$a4,$00,$8c,$34,$33 ; [$952b]
                                                                       ; byte
    db $32,$31,$30,$f4,$ff,$fd,$02,$8c,$15,$21,$1c,$21,$00,$21,$1c,$21 ; [$953b]
                                                                       ; byte
    db $18,$21,$1c,$21,$00,$21,$1c,$21,$17,$21,$1a,$21,$00,$21,$1a,$21 ; [$954b]
                                                                       ; byte
    db $10,$1c,$17,$1c,$00,$1c,$17,$1c,$15,$21,$1c,$21,$00,$21,$1c,$21 ; [$955b]
                                                                       ; byte
    db $18,$21,$1c,$21,$00,$21,$1c,$21,$17,$21,$1a,$21,$00,$21,$1a,$21 ; [$956b]
                                                                       ; byte
    db $10,$1c,$17,$1c,$00,$1c,$17,$1c,$1a,$26,$21,$26,$00,$26,$21,$26 ; [$957b]
                                                                       ; byte
    db $10,$1c,$17,$1c,$00,$1c,$17,$1c,$15,$21,$1c,$21,$00,$21,$1c,$21 ; [$958b]
                                                                       ; byte
    db $18,$21,$1b,$21,$00,$21,$1b,$21,$13,$1c,$18,$1c,$00,$1c,$18,$1c ; [$959b]
                                                                       ; byte
    db $17,$21,$1b,$21,$00,$21,$1e,$21,$10,$1c,$17,$1c,$00,$1c,$17,$1c ; [$95ab]
                                                                       ; byte
    db $fb,$01,$8c,$10,$1c,$1d,$1a,$1c,$18,$1a,$17,$fc,$fb,$02,$8c,$10 ; [$95bb]
                                                                       ; byte
    db $11,$10,$21,$1c,$18,$15,$10,$10,$98,$10,$8c,$10,$10,$98,$10,$8c ; [$95cb]
                                                                       ; byte
    db $10,$21,$1c,$15,$21,$1c,$18,$15,$10,$10,$98,$10,$8c,$10,$10,$98 ; [$95db]
                                                                       ; byte
    db $10,$8c,$10,$16,$16,$1a,$1a,$1c,$1c,$10,$10,$15,$98,$15,$8c,$15 ; [$95eb]
                                                                       ; byte
    db $98,$18,$17,$8c,$16,$16,$16,$16,$16,$17,$18,$19,$86,$19,$25,$19 ; [$95fb]
                                                                       ; byte
    db $25,$1c,$28,$1c,$28,$20,$2c,$20,$2c,$1c,$28,$1c,$28,$19,$25,$19 ; [$960b]
                                                                       ; byte
    db $25,$19,$25,$8c,$19,$18,$17,$16,$15,$86,$15,$21,$15,$21,$18,$24 ; [$961b]
                                                                       ; byte
    db $18,$24,$1c,$28,$1c,$28,$18,$24,$18,$24,$15,$21,$15,$21,$15,$21 ; [$962b]
                                                                       ; byte
    db $8c,$15,$16,$17,$18,$19,$86,$19,$25,$19,$25,$1c,$28,$1c,$28,$20 ; [$963b]
                                                                       ; byte
    db $2c,$20,$2c,$1c,$28,$1c,$28,$19,$25,$19,$25,$19,$25,$8c,$19,$18 ; [$964b]
                                                                       ; byte
    db $17,$16,$15,$f4,$ff,$ff,$ff,$e0,$00,$00,$f8,$c3,$96,$f8,$c3,$96 ; [$965b]
                                                                       ; byte
    db $f1,$00,$f2,$90,$f0,$00,$8c,$32,$34,$36,$37,$86,$39,$00,$98,$3e ; [$966b]
                                                                       ; byte
    db $8c,$39,$98,$3c,$8c,$39,$98,$35,$8c,$37,$98,$39,$40,$8c,$3d,$98 ; [$967b]
                                                                       ; byte
    db $39,$8c,$3b,$98,$3d,$3e,$8c,$3b,$98,$37,$8c,$39,$98,$3b,$8c,$32 ; [$968b]
                                                                       ; byte
    db $34,$36,$37,$86,$39,$00,$98,$3e,$8c,$39,$98,$3c,$8c,$39,$98,$35 ; [$969b]
                                                                       ; byte
    db $8c,$37,$98,$39,$40,$8c,$3d,$98,$39,$8c,$3b,$98,$3d,$3e,$8c,$3b ; [$96ab]
                                                                       ; byte
    db $98,$37,$8c,$39,$98,$3b,$f4,$ff,$f1,$02,$f2,$d0,$f0,$01,$8c,$39 ; [$96bb]
                                                                       ; byte
    db $38,$39,$b0,$3c,$8c,$39,$98,$3a,$8c,$3a,$bc,$3e,$98,$38,$41,$40 ; [$96cb]
                                                                       ; byte
    db $3e,$8c,$3e,$3d,$00,$bc,$40,$8c,$39,$38,$39,$b0,$3c,$8c,$39,$98 ; [$96db]
                                                                       ; byte
    db $3a,$8c,$3a,$bc,$3e,$98,$38,$41,$40,$3e,$8c,$3e,$3d,$00,$bc,$40 ; [$96eb]
                                                                       ; byte
    db $b0,$41,$98,$40,$3e,$b0,$3c,$98,$3b,$39,$c8,$37,$8c,$34,$ec,$39 ; [$96fb]
                                                                       ; byte
    db $b0,$41,$98,$40,$3e,$b0,$3c,$98,$3b,$39,$c8,$37,$8c,$34,$ec,$39 ; [$970b]
                                                                       ; byte
    db $f5,$e0,$00,$00,$f8,$a6,$97,$f8,$a6,$97,$f1,$02,$f2,$50,$f0,$00 ; [$971b]
                                                                       ; byte
    db $86,$00,$8c,$32,$34,$36,$86,$37,$36,$00,$98,$39,$8c,$36,$86,$39 ; [$972b]
                                                                       ; byte
    db $39,$39,$00,$8c,$35,$98,$2d,$8c,$30,$86,$35,$34,$8c,$35,$86,$3d ; [$973b]
                                                                       ; byte
    db $31,$3d,$00,$8c,$39,$98,$31,$8c,$34,$86,$39,$34,$31,$2d,$3b,$2f ; [$974b]
                                                                       ; byte
    db $3b,$00,$37,$00,$98,$2f,$8c,$32,$86,$37,$32,$2f,$2b,$00,$8c,$32 ; [$975b]
                                                                       ; byte
    db $34,$36,$86,$37,$36,$00,$98,$39,$8c,$36,$86,$39,$39,$39,$00,$8c ; [$976b]
                                                                       ; byte
    db $35,$98,$2d,$8c,$30,$86,$35,$34,$8c,$35,$86,$3d,$31,$3d,$00,$8c ; [$977b]
                                                                       ; byte
    db $39,$98,$31,$8c,$34,$86,$39,$34,$31,$2d,$3b,$2f,$3b,$00,$37,$00 ; [$978b]
                                                                       ; byte
    db $98,$2f,$8c,$32,$86,$37,$32,$2f,$2b,$f4,$ff,$f1,$04,$f2,$90,$f0 ; [$979b]
                                                                       ; byte
    db $01,$8c,$30,$2f,$30,$b0,$34,$8c,$30,$98,$32,$8c,$32,$98,$3a,$8c ; [$97ab]
                                                                       ; byte
    db $35,$32,$35,$98,$34,$3e,$3c,$3b,$8c,$39,$39,$00,$34,$31,$86,$34 ; [$97bb]
                                                                       ; byte
    db $00,$8c,$31,$86,$34,$00,$8c,$30,$2f,$30,$b0,$34,$8c,$30,$98,$32 ; [$97cb]
                                                                       ; byte
    db $8c,$32,$98,$3a,$8c,$35,$32,$35,$98,$34,$3e,$3c,$3b,$8c,$39,$39 ; [$97db]
                                                                       ; byte
    db $00,$86,$31,$34,$39,$3d,$40,$45,$40,$3d,$39,$34,$29,$00,$2e,$32 ; [$97eb]
                                                                       ; byte
    db $29,$00,$2e,$32,$28,$2b,$2e,$32,$26,$00,$2e,$32,$24,$00,$2d,$30 ; [$97fb]
                                                                       ; byte
    db $24,$00,$2d,$30,$23,$2d,$30,$34,$21,$29,$2d,$30,$1f,$28,$2b,$2f ; [$980b]
                                                                       ; byte
    db $00,$28,$2b,$2f,$1f,$28,$2b,$2f,$28,$00,$8c,$25,$86,$21,$00,$26 ; [$981b]
                                                                       ; byte
    db $2a,$36,$32,$2d,$2a,$21,$00,$26,$2a,$36,$32,$2d,$2a,$29,$2b,$2e ; [$982b]
                                                                       ; byte
    db $32,$29,$2b,$2e,$32,$00,$2b,$2e,$32,$26,$2b,$2e,$32,$24,$2d,$30 ; [$983b]
                                                                       ; byte
    db $34,$24,$2d,$30,$34,$00,$29,$2d,$30,$21,$29,$2d,$30,$1f,$28,$2b ; [$984b]
                                                                       ; byte
    db $2f,$1f,$28,$2b,$2f,$1f,$28,$2b,$2f,$28,$00,$8c,$25,$86,$21,$26 ; [$985b]
                                                                       ; byte
    db $2a,$2d,$32,$2d,$2a,$2d,$21,$26,$2a,$2d,$32,$2d,$8c,$26,$f5,$8c ; [$986b]
                                                                       ; byte
    db $15,$86,$21,$00,$8c,$10,$86,$1c,$00,$8c,$13,$86,$1f,$00,$12,$12 ; [$987b]
                                                                       ; byte
    db $1e,$00,$8c,$15,$86,$21,$00,$8c,$10,$86,$1c,$00,$13,$13,$1f,$1f ; [$988b]
                                                                       ; byte
    db $12,$12,$1e,$00,$f8,$27,$99,$f8,$27,$99,$0e,$00,$15,$00,$0e,$00 ; [$989b]
                                                                       ; byte
    db $15,$00,$0e,$0e,$15,$00,$0e,$00,$15,$00,$11,$00,$18,$00,$11,$00 ; [$98ab]
                                                                       ; byte
    db $18,$00,$11,$11,$18,$00,$11,$00,$18,$00,$15,$00,$21,$00,$15,$00 ; [$98bb]
                                                                       ; byte
    db $1c,$00,$15,$15,$1c,$00,$15,$00,$1c,$1c,$13,$00,$1a,$00,$13,$00 ; [$98cb]
                                                                       ; byte
    db $1a,$1f,$13,$13,$1f,$00,$13,$00,$13,$1f,$0e,$00,$15,$00,$0e,$00 ; [$98db]
                                                                       ; byte
    db $15,$00,$0e,$0e,$15,$00,$0e,$00,$15,$00,$11,$00,$18,$00,$11,$00 ; [$98eb]
                                                                       ; byte
    db $18,$00,$11,$11,$18,$00,$11,$00,$18,$00,$15,$00,$21,$00,$15,$00 ; [$98fb]
                                                                       ; byte
    db $1c,$00,$15,$15,$1c,$00,$15,$00,$1c,$1c,$13,$00,$1a,$00,$13,$00 ; [$990b]
                                                                       ; byte
    db $1a,$1f,$13,$13,$1f,$00,$13,$00,$13,$1f,$f4,$ff,$8c,$15,$86,$21 ; [$991b]
                                                                       ; byte
    db $00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00 ; [$992b]
                                                                       ; byte
    db $8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00,$8c ; [$993b]
                                                                       ; byte
    db $16,$86,$22,$00,$8c,$14,$86,$20,$00,$8c,$14,$86,$20,$00,$8c,$10 ; [$994b]
                                                                       ; byte
    db $86,$1c,$00,$8c,$10,$86,$1c,$00,$8c,$15,$86,$21,$00,$8c,$15,$86 ; [$995b]
                                                                       ; byte
    db $21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21 ; [$996b]
                                                                       ; byte
    db $00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00 ; [$997b]
                                                                       ; byte
    db $8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00,$8c ; [$998b]
                                                                       ; byte
    db $16,$86,$22,$00,$8c,$14,$86,$20,$00,$8c,$14,$86,$20,$00,$8c,$10 ; [$999b]
                                                                       ; byte
    db $86,$1c,$00,$8c,$10,$86,$1c,$00,$8c,$15,$86,$21,$00,$8c,$15,$86 ; [$99ab]
                                                                       ; byte
    db $21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$13,$13,$13,$13 ; [$99bb]
                                                                       ; byte
    db $13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$11,$11,$11,$11 ; [$99cb]
                                                                       ; byte
    db $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10 ; [$99db]
                                                                       ; byte
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$0e,$0e,$0e,$0e ; [$99eb]
                                                                       ; byte
    db $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$13,$13,$13,$13 ; [$99fb]
                                                                       ; byte
    db $13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$11,$11,$11,$11 ; [$9a0b]
                                                                       ; byte
    db $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10 ; [$9a1b]
                                                                       ; byte
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$0e,$0e,$0e,$0e ; [$9a2b]
                                                                       ; byte
    db $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$f5,$8c,$00,$31 ; [$9a3b]
                                                                       ; byte
    db $00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$86,$31,$31,$8c ; [$9a4b]
                                                                       ; byte
    db $31,$f8,$70,$9a,$f8,$70,$9a,$fd,$08,$8c,$00,$21,$00,$21,$00,$21 ; [$9a5b]
                                                                       ; byte
    db $00,$21,$fc,$f4,$ff,$fd,$08,$8c,$00,$21,$00,$21,$00,$21,$00,$21 ; [$9a6b]
                                                                       ; byte
    db $fc,$fd,$08,$86,$31,$00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31 ; [$9a7b]
                                                                       ; byte
    db $31,$00,$31,$31,$fc,$f5,$ff,$f1,$02,$f2,$90,$f0,$01,$fd,$02,$98 ; [$9a8b]
                                                                       ; byte
    db $37,$36,$a4,$33,$bc,$34,$8c,$34,$37,$3b,$98,$3e,$8c,$3b,$37,$34 ; [$9a9b]
                                                                       ; byte
    db $98,$3d,$8c,$35,$bc,$3c,$8c,$39,$3c,$40,$98,$43,$8c,$40,$3c,$39 ; [$9aab]
                                                                       ; byte
    db $a4,$42,$8c,$3e,$3a,$37,$00,$32,$b0,$35,$a4,$33,$8c,$32,$b0,$00 ; [$9abb]
                                                                       ; byte
    db $8c,$2b,$2e,$32,$36,$b0,$00,$fc,$00,$98,$3b,$8c,$3c,$3e,$00,$34 ; [$9acb]
                                                                       ; byte
    db $00,$00,$3b,$3b,$3c,$3e,$00,$3b,$34,$37,$39,$3f,$00,$b0,$3f,$8c ; [$9adb]
                                                                       ; byte
    db $39,$3f,$41,$3f,$2d,$2d,$33,$00,$86,$3f,$40,$98,$41,$8c,$3d,$3a ; [$9aeb]
                                                                       ; byte
    db $00,$35,$3a,$3d,$41,$41,$3d,$3a,$00,$3a,$3d,$3a,$3e,$3f,$3e,$3a ; [$9afb]
                                                                       ; byte
    db $36,$33,$36,$33,$32,$32,$32,$00,$f4,$ff,$f1,$02,$f2,$90,$fd,$02 ; [$9b0b]
                                                                       ; byte
    db $98,$2f,$2d,$a4,$2a,$8c,$2b,$00,$2b,$22,$23,$2b,$2f,$34,$98,$37 ; [$9b1b]
                                                                       ; byte
    db $8c,$34,$2f,$2b,$98,$39,$8c,$2d,$39,$00,$39,$2c,$2d,$ee,$01,$f1 ; [$9b2b]
                                                                       ; byte
    db $05,$86,$00,$8c,$39,$3c,$40,$92,$43,$8c,$3c,$39,$34,$ee,$00,$f1 ; [$9b3b]
                                                                       ; byte
    db $02,$a4,$3e,$8c,$3a,$37,$32,$00,$2e,$86,$27,$2b,$2e,$32,$35,$32 ; [$9b4b]
                                                                       ; byte
    db $2e,$2b,$25,$29,$2c,$30,$33,$30,$8c,$2f,$b0,$00,$8c,$32,$37,$3a ; [$9b5b]
                                                                       ; byte
    db $3e,$b0,$00,$fc,$00,$98,$37,$8c,$39,$3b,$00,$28,$00,$00,$37,$37 ; [$9b6b]
                                                                       ; byte
    db $39,$3b,$00,$37,$2b,$2f,$30,$39,$00,$98,$39,$8c,$35,$30,$35,$39 ; [$9b7b]
                                                                       ; byte
    db $3c,$39,$29,$29,$2d,$00,$86,$3b,$3c,$98,$3d,$8c,$3a,$35,$00,$31 ; [$9b8b]
                                                                       ; byte
    db $35,$3a,$3d,$3d,$3a,$35,$00,$31,$35,$31,$86,$3a,$32,$3a,$33,$3a ; [$9b9b]
                                                                       ; byte
    db $32,$36,$2e,$33,$2a,$2e,$27,$2a,$22,$2e,$27,$8c,$2b,$2b,$2a,$00 ; [$9bab]
                                                                       ; byte
    db $f4,$ff,$fd,$02,$b0,$00,$8c,$10,$10,$13,$10,$17,$17,$10,$86,$1c ; [$9bbb]
                                                                       ; byte
    db $10,$8c,$10,$10,$13,$10,$17,$17,$10,$86,$1c,$10,$8c,$11,$11,$15 ; [$9bcb]
                                                                       ; byte
    db $11,$18,$18,$11,$86,$1d,$11,$8c,$15,$18,$1c,$98,$1f,$8c,$1c,$15 ; [$9bdb]
                                                                       ; byte
    db $86,$21,$15,$8c,$13,$13,$16,$13,$1a,$1a,$13,$86,$1f,$13,$8c,$0f ; [$9beb]
                                                                       ; byte
    db $0f,$16,$86,$1b,$0f,$8c,$0d,$0d,$14,$86,$19,$0d,$a4,$13,$86,$14 ; [$9bfb]
                                                                       ; byte
    db $15,$8c,$16,$1a,$1f,$13,$fb,$01,$b0,$00,$fc,$fb,$02,$8c,$00,$1f ; [$9c0b]
                                                                       ; byte
    db $1d,$1b,$1a,$16,$13,$14,$15,$1c,$23,$1f,$21,$1c,$00,$13,$15,$1c ; [$9c1b]
                                                                       ; byte
    db $23,$1f,$21,$13,$15,$10,$11,$18,$21,$1d,$1f,$1d,$00,$0c,$11,$18 ; [$9c2b]
                                                                       ; byte
    db $21,$1f,$00,$1d,$18,$11,$16,$1d,$22,$1d,$24,$22,$00,$11,$16,$1d ; [$9c3b]
                                                                       ; byte
    db $24,$22,$00,$1d,$16,$11,$0f,$16,$1b,$16,$1d,$1b,$16,$0f,$0e,$0e ; [$9c4b]
                                                                       ; byte
    db $0e,$00,$f4,$ff,$fd,$02,$86,$31,$00,$00,$00,$31,$00,$00,$00,$86 ; [$9c5b]
                                                                       ; byte
    db $31,$00,$31,$00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21,$86,$31 ; [$9c6b]
                                                                       ; byte
    db $00,$31,$00,$31,$00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21,$86 ; [$9c7b]
                                                                       ; byte
    db $31,$00,$31,$00,$31,$00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21 ; [$9c8b]
                                                                       ; byte
    db $21,$86,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$8c,$21,$21,$86 ; [$9c9b]
                                                                       ; byte
    db $21,$21,$31,$00,$31,$00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21 ; [$9cab]
                                                                       ; byte
    db $86,$31,$00,$31,$00,$31,$00,$8c,$21,$86,$31,$00,$31,$00,$8c,$21 ; [$9cbb]
                                                                       ; byte
    db $86,$31,$00,$8c,$21,$86,$31,$00,$00,$00,$31,$00,$00,$00,$8c,$21 ; [$9ccb]
                                                                       ; byte
    db $21,$21,$21,$fb,$01,$8c,$00,$86,$31,$31,$8c,$21,$00,$fc,$fb,$02 ; [$9cdb]
                                                                       ; byte
    db $b0,$00,$8c,$00,$31,$86,$31,$31,$31,$00,$8c,$00,$00,$31,$00,$00 ; [$9ceb]
                                                                       ; byte
    db $31,$00,$00,$00,$00,$31,$00,$00,$31,$00,$00,$00,$00,$31,$00,$00 ; [$9cfb]
                                                                       ; byte
    db $31,$00,$00,$00,$00,$31,$00,$00,$31,$00,$86,$31,$31,$8c,$00,$00 ; [$9d0b]
                                                                       ; byte
    db $31,$00,$00,$31,$00,$00,$00,$00,$31,$00,$00,$31,$00,$00,$00,$00 ; [$9d1b]
                                                                       ; byte
    db $31,$00,$00,$31,$31,$00,$31,$31,$31,$00,$f4,$ff,$ff,$f1,$03,$f2 ; [$9d2b]
                                                                       ; byte
    db $50,$f0,$00,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$26,$1f,$22,$2a,$26 ; [$9d3b]
                                                                       ; byte
    db $1f,$22,$2a,$26,$f9,$fd,$02,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$26 ; [$9d4b]
                                                                       ; byte
    db $1f,$22,$2a,$26,$1f,$22,$2a,$26,$1f,$22,$2a,$26,$1f,$22,$2a,$26 ; [$9d5b]
                                                                       ; byte
    db $1f,$22,$2a,$26,$1f,$22,$2a,$26,$fc,$fd,$02,$a0,$32,$33,$c0,$38 ; [$9d6b]
                                                                       ; byte
    db $a0,$36,$37,$c0,$3e,$a0,$3d,$39,$3c,$3b,$c0,$37,$32,$fc,$fd,$02 ; [$9d7b]
                                                                       ; byte
    db $90,$26,$29,$2c,$34,$2c,$29,$26,$29,$26,$29,$2c,$34,$2c,$29,$26 ; [$9d8b]
                                                                       ; byte
    db $29,$2b,$2e,$31,$39,$31,$2e,$2b,$2e,$2b,$2e,$31,$39,$31,$2e,$2b ; [$9d9b]
                                                                       ; byte
    db $25,$fc,$fe,$ff,$f1,$05,$f2,$90,$f0,$00,$ee,$02,$f2,$11,$88,$00 ; [$9dab]
                                                                       ; byte
    db $90,$1f,$22,$2a,$26,$1f,$22,$2a,$90,$26,$90,$1f,$22,$2a,$26,$1f ; [$9dbb]
                                                                       ; byte
    db $22,$2a,$88,$26,$f9,$fd,$02,$88,$00,$90,$1f,$22,$2a,$26,$1f,$22 ; [$9dcb]
                                                                       ; byte
    db $2a,$90,$26,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$90,$26,$90,$1f,$22 ; [$9ddb]
                                                                       ; byte
    db $2a,$26,$1f,$22,$2a,$90,$26,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$88 ; [$9deb]
                                                                       ; byte
    db $26,$fc,$fd,$02,$88,$00,$32,$2d,$2a,$28,$33,$2d,$2a,$28,$38,$32 ; [$9dfb]
                                                                       ; byte
    db $2d,$2a,$28,$26,$21,$1f,$36,$32,$2d,$2a,$37,$32,$2c,$28,$3e,$3b ; [$9e0b]
                                                                       ; byte
    db $34,$2f,$2a,$27,$26,$26,$3d,$39,$36,$32,$39,$36,$32,$2d,$3c,$39 ; [$9e1b]
                                                                       ; byte
    db $34,$2d,$3b,$36,$34,$2f,$37,$32,$2f,$2b,$2a,$26,$23,$1f,$32,$2f ; [$9e2b]
                                                                       ; byte
    db $2b,$28,$26,$23,$1f,$fc,$f1,$02,$fd,$02,$88,$00,$90,$26,$29,$2c ; [$9e3b]
                                                                       ; byte
    db $34,$2c,$29,$26,$88,$29,$29,$90,$26,$29,$2c,$34,$2c,$29,$26,$90 ; [$9e4b]
                                                                       ; byte
    db $29,$90,$2b,$2e,$31,$39,$31,$2e,$2b,$90,$2e,$90,$2b,$2e,$31,$39 ; [$9e5b]
                                                                       ; byte
    db $31,$2e,$2b,$88,$25,$fc,$fe,$ff,$f3,$80,$00,$00,$f9,$fd,$02,$90 ; [$9e6b]
                                                                       ; byte
    db $36,$37,$c0,$39,$90,$36,$37,$c0,$34,$2d,$90,$36,$37,$c0,$39,$90 ; [$9e7b]
                                                                       ; byte
    db $36,$37,$34,$33,$32,$d0,$2d,$fc,$fd,$04,$88,$1a,$00,$a0,$1a,$88 ; [$9e8b]
                                                                       ; byte
    db $1a,$1a,$1a,$00,$a0,$1a,$88,$1a,$1a,$1a,$00,$a0,$1a,$88,$1a,$1a ; [$9e9b]
                                                                       ; byte
    db $1a,$00,$a0,$1a,$88,$1a,$1a,$fc,$fd,$02,$b0,$00,$88,$28,$20,$90 ; [$9eab]
                                                                       ; byte
    db $1a,$1d,$a0,$00,$b0,$00,$88,$28,$20,$90,$1a,$1d,$a0,$00,$b0,$00 ; [$9ebb]
                                                                       ; byte
    db $88,$2d,$25,$90,$1f,$22,$a0,$00,$b0,$00,$88,$2d,$25,$90,$1f,$22 ; [$9ecb]
                                                                       ; byte
    db $a0,$19,$fc,$fe,$ff,$ff,$ff,$f1,$02,$f2,$90,$f0,$00,$fd,$02,$88 ; [$9edb]
                                                                       ; byte
    db $00,$3c,$3b,$37,$00,$00,$00,$00,$00,$3a,$39,$35,$38,$00,$00,$00 ; [$9eeb]
                                                                       ; byte
    db $fc,$fd,$02,$88,$00,$3c,$3b,$98,$37,$88,$38,$37,$00,$3a,$39,$35 ; [$9efb]
                                                                       ; byte
    db $38,$39,$38,$00,$fc,$fd,$02,$88,$35,$35,$35,$35,$90,$34,$00,$b0 ; [$9f0b]
                                                                       ; byte
    db $00,$88,$35,$35,$35,$35,$90,$34,$c0,$00,$90,$35,$37,$37,$38,$38 ; [$9f1b]
                                                                       ; byte
    db $3a,$3a,$3c,$3c,$3d,$a0,$35,$34,$00,$30,$88,$35,$37,$00,$37,$00 ; [$9f2b]
                                                                       ; byte
    db $37,$35,$30,$37,$37,$35,$00,$37,$00,$38,$37,$e0,$00,$88,$30,$31 ; [$9f3b]
                                                                       ; byte
    db $30,$00,$fc,$fd,$02,$98,$31,$30,$90,$35,$a0,$34,$35,$98,$37,$34 ; [$9f4b]
                                                                       ; byte
    db $90,$35,$a0,$3d,$88,$37,$35,$34,$33,$fc,$f4,$ff,$f1,$02,$f2,$90 ; [$9f5b]
                                                                       ; byte
    db $f0,$00,$ee,$04,$fd,$02,$88,$00,$30,$2f,$2b,$00,$00,$00,$00,$00 ; [$9f6b]
                                                                       ; byte
    db $2e,$2d,$29,$2c,$00,$00,$00,$fc,$ee,$00,$fd,$02,$88,$00,$37,$36 ; [$9f7b]
                                                                       ; byte
    db $98,$32,$88,$33,$32,$00,$35,$34,$30,$33,$34,$33,$00,$fc,$fd,$02 ; [$9f8b]
                                                                       ; byte
    db $88,$30,$30,$30,$30,$90,$2f,$00,$b0,$00,$88,$00,$00,$30,$30,$90 ; [$9f9b]
                                                                       ; byte
    db $2f,$c0,$00,$90,$2c,$30,$30,$35,$35,$37,$37,$38,$38,$3a,$a0,$30 ; [$9fab]
                                                                       ; byte
    db $2f,$00,$2e,$88,$30,$34,$00,$34,$00,$34,$30,$2c,$34,$34,$32,$00 ; [$9fbb]
                                                                       ; byte
    db $34,$00,$35,$34,$e0,$00,$88,$30,$2f,$2e,$00,$fc,$f1,$07,$ee,$01 ; [$9fcb]
                                                                       ; byte
    db $fd,$02,$88,$00,$98,$31,$30,$90,$35,$a0,$34,$a0,$35,$98,$37,$34 ; [$9fdb]
                                                                       ; byte
    db $90,$35,$9c,$3d,$88,$37,$35,$34,$84,$33,$f1,$04,$fc,$f4,$ff,$fd ; [$9feb]
                                                                       ; byte
    db $02,$88,$18,$00,$00,$18,$00,$00,$18,$00,$18,$00,$00,$18,$00,$00 ; [$9ffb]
                                                                       ; byte
    db $18,$18,$90,$18,$88,$00,$18,$00,$00,$90,$18,$18,$88,$00,$18,$00 ; [$a00b]
                                                                       ; byte
    db $0c,$18,$0c,$fc,$fd,$02,$88,$14,$14,$14,$14,$90,$13,$88,$18,$19 ; [$a01b]
                                                                       ; byte
    db $00,$19,$18,$13,$90,$0c,$88,$00,$00,$14,$14,$90,$13,$00,$88,$17 ; [$a02b]
                                                                       ; byte
    db $18,$0c,$0d,$0e,$00,$90,$00,$88,$20,$18,$11,$11,$00,$11,$1d,$1d ; [$a03b]
                                                                       ; byte
    db $1c,$18,$11,$11,$00,$11,$1d,$1d,$1c,$18,$a0,$14,$90,$13,$88,$1f ; [$a04b]
                                                                       ; byte
    db $13,$a0,$00,$98,$1f,$88,$18,$90,$0c,$88,$00,$18,$00,$18,$0c,$0c ; [$a05b]
                                                                       ; byte
    db $90,$0c,$88,$00,$18,$00,$18,$0c,$0c,$00,$00,$1f,$24,$1e,$1d,$1c ; [$a06b]
                                                                       ; byte
    db $14,$a0,$13,$88,$18,$17,$18,$00,$fc,$fd,$02,$90,$13,$88,$00,$90 ; [$a07b]
                                                                       ; byte
    db $13,$88,$00,$13,$00,$13,$00,$00,$13,$00,$00,$13,$13,$fc,$fd,$02 ; [$a08b]
                                                                       ; byte
    db $90,$13,$88,$1f,$90,$13,$88,$1f,$13,$1f,$13,$13,$1f,$90,$13,$88 ; [$a09b]
                                                                       ; byte
    db $1f,$13,$1f,$fc,$f4,$ff,$fd,$04,$88,$21,$31,$31,$21,$31,$31,$21 ; [$a0ab]
                                                                       ; byte
    db $31,$21,$31,$31,$21,$31,$31,$21,$31,$fc,$fd,$02,$88,$21,$21,$21 ; [$a0bb]
                                                                       ; byte
    db $21,$21,$00,$31,$31,$31,$31,$31,$31,$21,$00,$00,$21,$11,$11,$11 ; [$a0cb]
                                                                       ; byte
    db $00,$85,$31,$31,$86,$31,$88,$31,$31,$31,$31,$21,$00,$21,$00,$21 ; [$a0db]
                                                                       ; byte
    db $21,$31,$00,$31,$00,$31,$31,$21,$00,$31,$00,$31,$31,$31,$31,$21 ; [$a0eb]
                                                                       ; byte
    db $21,$31,$00,$31,$00,$31,$00,$31,$00,$85,$31,$31,$86,$31,$88,$31 ; [$a0fb]
                                                                       ; byte
    db $31,$21,$21,$31,$00,$31,$31,$31,$31,$21,$31,$31,$31,$31,$31,$31 ; [$a10b]
                                                                       ; byte
    db $31,$21,$31,$31,$31,$a0,$00,$88,$21,$21,$21,$21,$85,$31,$31,$86 ; [$a11b]
                                                                       ; byte
    db $31,$88,$31,$31,$85,$31,$31,$86,$31,$88,$21,$21,$fc,$fd,$02,$88 ; [$a12b]
                                                                       ; byte
    db $31,$00,$00,$31,$00,$00,$31,$00,$31,$00,$00,$31,$00,$00,$31,$31 ; [$a13b]
                                                                       ; byte
    db $fc,$fd,$02,$88,$31,$11,$11,$31,$11,$11,$31,$11,$31,$11,$11,$31 ; [$a14b]
                                                                       ; byte
    db $11,$11,$31,$31,$fc,$f4,$ff,$ff,$f1,$02,$f2,$90,$f0,$01,$e0,$00 ; [$a15b]
                                                                       ; byte
    db $00,$00,$b0,$00,$8c,$00,$34,$36,$38,$fd,$02,$98,$39,$8c,$38,$3b ; [$a16b]
                                                                       ; byte
    db $39,$3b,$3c,$3e,$40,$41,$3f,$40,$b0,$00,$98,$37,$8c,$36,$39,$37 ; [$a17b]
                                                                       ; byte
    db $39,$3a,$3c,$3e,$3f,$3d,$3e,$b0,$00,$a4,$3f,$8c,$43,$41,$3c,$00 ; [$a18b]
                                                                       ; byte
    db $3e,$00,$3e,$41,$3f,$00,$3a,$37,$00,$38,$3c,$38,$3f,$00,$3f,$00 ; [$a19b]
                                                                       ; byte
    db $38,$fb,$01,$8c,$3c,$38,$3f,$00,$00,$34,$36,$38,$fc,$fb,$02,$8c ; [$a1ab]
                                                                       ; byte
    db $3c,$38,$3f,$00,$3f,$34,$2f,$2c,$2d,$34,$2d,$32,$00,$2f,$2b,$00 ; [$a1bb]
                                                                       ; byte
    db $fd,$02,$b0,$40,$98,$39,$40,$3f,$8c,$41,$98,$40,$8c,$3c,$39,$34 ; [$a1cb]
                                                                       ; byte
    db $38,$38,$3b,$39,$b0,$00,$98,$32,$8c,$34,$30,$b0,$00,$fc,$fd,$02 ; [$a1db]
                                                                       ; byte
    db $b0,$00,$8c,$00,$2d,$98,$00,$00,$8c,$00,$28,$2d,$2c,$29,$26,$b0 ; [$a1eb]
                                                                       ; byte
    db $00,$8c,$00,$2d,$98,$00,$8c,$00,$34,$33,$2f,$32,$31,$2d,$30,$fc ; [$a1fb]
                                                                       ; byte
    db $2d,$00,$c8,$00,$e0,$00,$00,$b0,$00,$8c,$00,$2b,$2a,$29,$f4,$ff ; [$a20b]
                                                                       ; byte
    db $f1,$02,$f2,$90,$e0,$00,$00,$00,$b0,$00,$8c,$00,$28,$33,$32,$fd ; [$a21b]
                                                                       ; byte
    db $02,$98,$30,$8c,$2f,$32,$30,$34,$39,$3b,$3c,$3e,$3b,$3c,$b0,$00 ; [$a22b]
                                                                       ; byte
    db $98,$2e,$8c,$2d,$30,$2e,$32,$37,$39,$3a,$3c,$39,$3a,$b0,$00,$a4 ; [$a23b]
                                                                       ; byte
    db $3c,$8c,$3f,$3e,$39,$00,$3a,$00,$3a,$3e,$3c,$00,$33,$30,$00,$30 ; [$a24b]
                                                                       ; byte
    db $33,$30,$37,$00,$37,$00,$30,$fb,$01,$8c,$33,$30,$37,$00,$00,$00 ; [$a25b]
                                                                       ; byte
    db $33,$32,$fc,$fb,$02,$8c,$33,$30,$37,$00,$37,$2f,$2c,$28,$24,$2d ; [$a26b]
                                                                       ; byte
    db $24,$2f,$00,$2b,$26,$00,$fd,$02,$b0,$3c,$98,$34,$3c,$3b,$8c,$3e ; [$a27b]
                                                                       ; byte
    db $98,$3c,$8c,$39,$34,$30,$32,$32,$34,$30,$b0,$00,$98,$2f,$8c,$30 ; [$a28b]
                                                                       ; byte
    db $2d,$b0,$00,$fc,$fd,$02,$b0,$00,$8c,$00,$23,$98,$00,$00,$8c,$00 ; [$a29b]
                                                                       ; byte
    db $23,$28,$27,$24,$21,$b0,$00,$8c,$00,$23,$98,$00,$8c,$00,$2f,$2e ; [$a2ab]
                                                                       ; byte
    db $2a,$2d,$2c,$28,$2b,$fc,$2a,$00,$c8,$00,$e0,$00,$00,$b0,$00,$8c ; [$a2bb]
                                                                       ; byte
    db $00,$26,$25,$24,$f4,$ff,$8c,$15,$00,$21,$15,$1a,$1c,$00,$10,$13 ; [$a2cb]
                                                                       ; byte
    db $15,$21,$15,$1a,$1c,$00,$10,$15,$00,$21,$15,$1a,$1c,$10,$13,$15 ; [$a2db]
                                                                       ; byte
    db $17,$18,$1a,$00,$1c,$17,$10,$fd,$02,$98,$15,$8c,$21,$1c,$10,$1c ; [$a2eb]
                                                                       ; byte
    db $00,$10,$15,$1f,$21,$1c,$00,$18,$15,$10,$98,$13,$8c,$1f,$1a,$0e ; [$a2fb]
                                                                       ; byte
    db $1a,$00,$0e,$13,$1d,$1f,$1a,$00,$16,$13,$0e,$0c,$0c,$18,$0c,$11 ; [$a30b]
                                                                       ; byte
    db $1d,$00,$11,$16,$00,$22,$0f,$00,$1b,$16,$0f,$14,$1a,$14,$1b,$00 ; [$a31b]
                                                                       ; byte
    db $1b,$00,$0f,$fb,$01,$8c,$14,$20,$14,$11,$10,$10,$12,$14,$fc,$fb ; [$a32b]
                                                                       ; byte
    db $02,$8c,$14,$20,$14,$00,$10,$10,$12,$14,$15,$1c,$15,$1a,$00,$17 ; [$a33b]
                                                                       ; byte
    db $13,$00,$fd,$02,$8c,$15,$00,$21,$10,$13,$15,$00,$10,$14,$17,$10 ; [$a34b]
                                                                       ; byte
    db $15,$00,$21,$1c,$15,$98,$10,$8c,$1c,$15,$00,$20,$21,$1c,$10,$12 ; [$a35b]
                                                                       ; byte
    db $14,$15,$00,$1c,$1b,$1a,$fc,$fd,$02,$8c,$1c,$10,$11,$10,$00,$11 ; [$a36b]
                                                                       ; byte
    db $00,$10,$1c,$10,$11,$10,$00,$1c,$1b,$17,$10,$10,$11,$10,$00,$11 ; [$a37b]
                                                                       ; byte
    db $00,$10,$00,$10,$11,$10,$00,$12,$11,$10,$fc,$15,$00,$21,$15,$1a ; [$a38b]
                                                                       ; byte
    db $1c,$00,$10,$13,$15,$21,$15,$1a,$1c,$10,$13,$15,$00,$21,$15,$1a ; [$a39b]
                                                                       ; byte
    db $1c,$00,$10,$13,$15,$21,$20,$00,$15,$14,$13,$f4,$ff,$8c,$3c,$3c ; [$a3ab]
                                                                       ; byte
    db $30,$3c,$3c,$30,$3c,$3c,$3c,$3c,$30,$3c,$3c,$30,$3c,$3c,$3c,$3c ; [$a3bb]
                                                                       ; byte
    db $30,$3c,$3c,$30,$3c,$3c,$30,$30,$30,$30,$00,$3c,$3c,$3c,$fd,$02 ; [$a3cb]
                                                                       ; byte
    db $8c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30 ; [$a3db]
                                                                       ; byte
    db $3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30 ; [$a3eb]
                                                                       ; byte
    db $3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$30,$30 ; [$a3fb]
                                                                       ; byte
    db $30,$3c,$3c,$30,$3c,$3c,$30,$3c,$3c,$fb,$01,$8c,$3c,$3c,$30,$3c ; [$a40b]
                                                                       ; byte
    db $3c,$30,$3c,$3c,$fc,$fb,$02,$8c,$3c,$3c,$30,$3c,$30,$3c,$3c,$3c ; [$a41b]
                                                                       ; byte
    db $30,$30,$30,$30,$00,$30,$30,$00,$fd,$02,$8c,$3c,$3c,$30,$3c,$3c ; [$a42b]
                                                                       ; byte
    db $30,$00,$3c,$3c,$3c,$30,$3c,$3c,$30,$00,$3c,$3c,$3c,$30,$3c,$3c ; [$a43b]
                                                                       ; byte
    db $30,$00,$3c,$3c,$3c,$30,$3c,$3c,$30,$30,$30,$fc,$fd,$02,$8c,$3c ; [$a44b]
                                                                       ; byte
    db $3c,$3c,$3c,$3c,$30,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$30,$30,$30,$3c ; [$a45b]
                                                                       ; byte
    db $3c,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$3c,$86,$3c,$3c ; [$a46b]
                                                                       ; byte
    db $8c,$30,$fc,$3c,$00,$30,$3c,$3c,$30,$3c,$3c,$3c,$00,$30,$3c,$3c ; [$a47b]
                                                                       ; byte
    db $30,$3c,$3c,$3c,$00,$30,$3c,$3c,$30,$3c,$3c,$3c,$3c,$30,$3c,$3c ; [$a48b]
                                                                       ; byte
    db $30,$30,$30,$f4,$ff,$ff,$f1,$04,$f2,$90,$f0,$02,$fd,$02,$a0,$34 ; [$a49b]
                                                                       ; byte
    db $90,$33,$34,$a0,$36,$90,$3b,$b0,$37,$90,$36,$37,$a0,$39,$90,$3e ; [$a4ab]
                                                                       ; byte
    db $c0,$3b,$90,$37,$3c,$3b,$39,$37,$b0,$39,$90,$36,$3b,$39,$37,$36 ; [$a4bb]
                                                                       ; byte
    db $fc,$fd,$02,$a0,$34,$90,$33,$34,$a0,$36,$90,$3b,$b0,$37,$90,$36 ; [$a4cb]
                                                                       ; byte
    db $37,$a0,$39,$90,$3e,$c0,$3b,$90,$37,$3c,$3b,$39,$37,$fb,$01,$b0 ; [$a4db]
                                                                       ; byte
    db $39,$90,$36,$3b,$39,$37,$36,$fc,$fb,$02,$90,$39,$37,$36,$b0,$3b ; [$a4eb]
                                                                       ; byte
    db $a0,$2f,$90,$3b,$3b,$3b,$3b,$a0,$3b,$90,$3e,$d0,$3c,$90,$3c,$3b ; [$a4fb]
                                                                       ; byte
    db $39,$37,$a0,$36,$40,$3e,$39,$b0,$3c,$a0,$3b,$90,$3b,$3c,$3e,$b0 ; [$a50b]
                                                                       ; byte
    db $40,$90,$37,$c0,$37,$a0,$3e,$3c,$37,$39,$d6,$3b,$95,$39,$37,$a0 ; [$a51b]
                                                                       ; byte
    db $36,$e0,$00,$f4,$ff,$f1,$06,$f2,$90,$f0,$02,$f3,$80,$00,$00,$00 ; [$a52b]
                                                                       ; byte
    db $00,$fd,$02,$a0,$2b,$90,$2a,$2b,$a0,$2d,$90,$2a,$b0,$2f,$90,$2d ; [$a53b]
                                                                       ; byte
    db $2f,$a0,$30,$90,$36,$c0,$32,$90,$2f,$34,$32,$30,$2f,$b0,$34,$90 ; [$a54b]
                                                                       ; byte
    db $31,$33,$31,$2f,$2d,$fc,$2b,$28,$2a,$2b,$2d,$2a,$2d,$2f,$26,$2b ; [$a55b]
                                                                       ; byte
    db $2d,$2f,$30,$2d,$36,$32,$2b,$2f,$2b,$2f,$34,$32,$30,$2f,$31,$34 ; [$a56b]
                                                                       ; byte
    db $31,$a0,$33,$90,$2b,$a0,$2a,$90,$38,$38,$38,$38,$a0,$38,$90,$3b ; [$a57b]
                                                                       ; byte
    db $d0,$39,$90,$39,$37,$36,$34,$a0,$32,$3c,$39,$36,$b0,$38,$a0,$37 ; [$a58b]
                                                                       ; byte
    db $90,$37,$39,$3b,$b0,$3c,$90,$34,$a0,$34,$90,$30,$34,$39,$32,$39 ; [$a59b]
                                                                       ; byte
    db $30,$34,$2b,$34,$2d,$d6,$34,$95,$36,$34,$a0,$33,$e0,$00,$f4,$ff ; [$a5ab]
                                                                       ; byte
    db $fd,$02,$90,$1c,$28,$23,$1c,$1e,$28,$27,$23,$1f,$28,$23,$1c,$21 ; [$a5bb]
                                                                       ; byte
    db $2b,$28,$1e,$1f,$2b,$26,$1f,$18,$24,$1f,$18,$1e,$2a,$25,$1e,$23 ; [$a5cb]
                                                                       ; byte
    db $27,$2a,$23,$fc,$fd,$02,$90,$10,$1c,$17,$10,$12,$1c,$1b,$17,$13 ; [$a5db]
                                                                       ; byte
    db $1c,$17,$10,$15,$1f,$1c,$12,$13,$1f,$1a,$13,$0c,$18,$13,$0c,$fb ; [$a5eb]
                                                                       ; byte
    db $01,$90,$12,$1e,$19,$12,$17,$23,$1e,$17,$fc,$fb,$02,$90,$12,$19 ; [$a5fb]
                                                                       ; byte
    db $1c,$a0,$17,$90,$17,$18,$17,$1c,$23,$28,$23,$1c,$20,$23,$1c,$15 ; [$a60b]
                                                                       ; byte
    db $18,$21,$1c,$15,$18,$1c,$21,$0e,$15,$1a,$15,$0e,$12,$15,$1a,$1b ; [$a61b]
                                                                       ; byte
    db $18,$14,$a0,$13,$90,$1a,$1f,$1a,$18,$1c,$1f,$24,$1f,$1c,$18,$13 ; [$a62b]
                                                                       ; byte
    db $15,$18,$1c,$21,$21,$1c,$18,$15,$12,$15,$18,$1c,$96,$1e,$95,$1c ; [$a63b]
                                                                       ; byte
    db $18,$90,$17,$00,$84,$23,$24,$88,$23,$a0,$23,$90,$21,$1f,$1e,$f4 ; [$a64b]
                                                                       ; byte
    db $ff,$ff,$ff,$f1,$02,$f2,$50,$f0,$00,$f3,$a0,$00,$00,$00,$00,$fd ; [$a65b]
                                                                       ; byte
    db $03,$8a,$00,$00,$2d,$00,$00,$2f,$00,$00,$30,$00,$00,$2f,$00,$00 ; [$a66b]
                                                                       ; byte
    db $00,$2d,$00,$2d,$2c,$2d,$2f,$00,$2f,$00,$30,$00,$30,$2f,$00,$00 ; [$a67b]
                                                                       ; byte
    db $00,$00,$00,$00,$2b,$00,$00,$2d,$00,$00,$2e,$00,$00,$2d,$00,$00 ; [$a68b]
                                                                       ; byte
    db $00,$2b,$00,$2b,$2a,$2b,$2d,$00,$2d,$00,$2e,$00,$2e,$2d,$00,$00 ; [$a69b]
                                                                       ; byte
    db $00,$00,$fc,$f4,$ff,$f1,$02,$f2,$90,$f3,$a0,$00,$00,$00,$00,$fd ; [$a6ab]
                                                                       ; byte
    db $03,$8a,$00,$00,$29,$00,$00,$2b,$00,$00,$2d,$00,$00,$2b,$00,$00 ; [$a6bb]
                                                                       ; byte
    db $00,$29,$00,$29,$28,$29,$2b,$00,$2b,$00,$2d,$00,$2d,$2b,$00,$00 ; [$a6cb]
                                                                       ; byte
    db $00,$00,$00,$00,$27,$00,$00,$29,$00,$00,$2b,$00,$00,$29,$00,$00 ; [$a6db]
                                                                       ; byte
    db $00,$27,$00,$27,$26,$27,$29,$00,$29,$00,$2b,$00,$2b,$29,$00,$00 ; [$a6eb]
                                                                       ; byte
    db $00,$00,$fc,$f4,$ff,$fd,$02,$8a,$1f,$00,$00,$00,$1f,$00,$00,$1f ; [$a6fb]
                                                                       ; byte
    db $1f,$00,$1f,$00,$00,$00,$00,$00,$1f,$00,$1e,$1f,$00,$1f,$00,$1f ; [$a70b]
                                                                       ; byte
    db $1f,$00,$1f,$00,$00,$00,$1a,$18,$1d,$00,$00,$00,$1d,$00,$00,$1d ; [$a71b]
                                                                       ; byte
    db $1d,$00,$1d,$00,$00,$00,$00,$00,$1d,$00,$1c,$1d,$00,$1d,$00,$1d ; [$a72b]
                                                                       ; byte
    db $1d,$00,$1d,$00,$00,$00,$1d,$1e,$fc,$fd,$02,$8a,$13,$1f,$1f,$13 ; [$a73b]
                                                                       ; byte
    db $13,$1f,$1f,$13,$13,$1f,$13,$1f,$1f,$13,$1f,$1f,$13,$1f,$12,$13 ; [$a74b]
                                                                       ; byte
    db $1f,$13,$1f,$13,$13,$1f,$13,$13,$1f,$13,$0e,$0c,$11,$11,$1d,$1d ; [$a75b]
                                                                       ; byte
    db $11,$1d,$1d,$11,$11,$1d,$11,$1d,$1d,$11,$1d,$1d,$11,$1d,$10,$11 ; [$a76b]
                                                                       ; byte
    db $1d,$11,$1d,$1d,$11,$1d,$11,$11,$1d,$11,$11,$12,$fc,$f4,$ff,$fd ; [$a77b]
                                                                       ; byte
    db $08,$8a,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31 ; [$a78b]
                                                                       ; byte
    db $85,$31,$31,$31,$31,$8a,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31 ; [$a79b]
                                                                       ; byte
    db $31,$31,$85,$31,$31,$31,$31,$8a,$31,$31,$fc,$f4,$ff,$ff,$f1,$02 ; [$a7ab]
                                                                       ; byte
    db $f2,$90,$f0,$01,$fd,$02,$8f,$34,$28,$33,$27,$2f,$23,$2e,$22,$34 ; [$a7bb]
                                                                       ; byte
    db $28,$33,$27,$2f,$23,$2e,$22,$35,$29,$34,$28,$30,$24,$2f,$23,$35 ; [$a7cb]
                                                                       ; byte
    db $29,$34,$28,$30,$24,$2f,$23,$38,$37,$2c,$2d,$38,$37,$2c,$2d,$97 ; [$a7db]
                                                                       ; byte
    db $3a,$87,$39,$97,$2d,$87,$2e,$97,$3d,$87,$3c,$97,$30,$87,$31,$85 ; [$a7eb]
                                                                       ; byte
    db $43,$42,$41,$3c,$3b,$3a,$37,$36,$35,$30,$2f,$2c,$2b,$2a,$29,$24 ; [$a7fb]
                                                                       ; byte
    db $23,$22,$18,$19,$1a,$1b,$1c,$1d,$fc,$f4,$ff,$f1,$04,$f2,$90,$f2 ; [$a80b]
                                                                       ; byte
    db $17,$fd,$02,$88,$00,$8f,$34,$28,$33,$27,$2f,$23,$2e,$22,$34,$28 ; [$a81b]
                                                                       ; byte
    db $33,$27,$2f,$23,$2e,$22,$35,$29,$34,$28,$30,$24,$2f,$23,$35,$29 ; [$a82b]
                                                                       ; byte
    db $34,$28,$30,$24,$2f,$23,$38,$37,$2c,$2d,$38,$37,$2c,$2d,$97,$3a ; [$a83b]
                                                                       ; byte
    db $87,$39,$97,$2d,$87,$2e,$97,$3d,$87,$3c,$97,$30,$87,$31,$85,$43 ; [$a84b]
                                                                       ; byte
    db $42,$41,$3c,$3b,$3a,$37,$36,$35,$30,$2f,$2c,$2b,$2a,$29,$24,$23 ; [$a85b]
                                                                       ; byte
    db $22,$18,$19,$1a,$87,$1b,$fc,$f4,$ff,$fd,$02,$f6,$fd,$8a,$13,$14 ; [$a86b]
                                                                       ; byte
    db $13,$14,$13,$14,$15,$14,$15,$14,$15,$14,$13,$14,$13,$14,$13,$14 ; [$a87b]
                                                                       ; byte
    db $15,$14,$15,$14,$15,$14,$14,$15,$14,$15,$14,$15,$16,$15,$16,$15 ; [$a88b]
                                                                       ; byte
    db $16,$15,$14,$15,$14,$15,$14,$15,$16,$15,$16,$15,$16,$15,$f6,$00 ; [$a89b]
                                                                       ; byte
    db $88,$0f,$87,$1b,$88,$27,$87,$1b,$88,$0f,$87,$1b,$88,$27,$87,$1b ; [$a8ab]
                                                                       ; byte
    db $88,$0f,$87,$1b,$88,$27,$87,$1b,$88,$0f,$87,$1b,$88,$27,$87,$1b ; [$a8bb]
                                                                       ; byte
    db $88,$11,$87,$1d,$88,$29,$87,$1d,$88,$11,$87,$1d,$88,$29,$87,$1d ; [$a8cb]
                                                                       ; byte
    db $88,$14,$87,$20,$88,$2c,$87,$20,$88,$14,$87,$20,$88,$2c,$87,$20 ; [$a8db]
                                                                       ; byte
    db $94,$37,$38,$2f,$23,$8a,$29,$2a,$23,$24,$fc,$f4,$ff,$ff,$ff,$f1 ; [$a8eb]
                                                                       ; byte
    db $02,$f2,$50,$f0,$01,$fd,$02,$f3,$80,$00,$c0,$00,$fc,$fd,$03,$84 ; [$a8fb]
                                                                       ; byte
    db $1f,$24,$1f,$00,$00,$00,$00,$00,$2b,$30,$2b,$00,$00,$00,$00,$00 ; [$a90b]
                                                                       ; byte
    db $24,$29,$24,$00,$00,$00,$00,$00,$30,$35,$30,$00,$00,$00,$00,$00 ; [$a91b]
                                                                       ; byte
    db $29,$2e,$29,$00,$00,$00,$00,$00,$35,$3a,$35,$00,$00,$00,$00,$00 ; [$a92b]
                                                                       ; byte
    db $fc,$f4,$ff,$f1,$02,$f2,$90,$f2,$13,$fd,$02,$f3,$80,$00,$c0,$00 ; [$a93b]
                                                                       ; byte
    db $fc,$fd,$03,$84,$00,$1f,$24,$1f,$00,$00,$00,$00,$00,$2b,$30,$2b ; [$a94b]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$24,$29,$24,$00,$00,$00,$00,$00,$30,$35,$30 ; [$a95b]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$29,$2e,$29,$00,$00,$00,$00,$00,$35,$3a,$35 ; [$a96b]
                                                                       ; byte
    db $00,$00,$00,$00,$fc,$f4,$ff,$fd,$02,$84,$0e,$00,$00,$00,$0e,$00 ; [$a97b]
                                                                       ; byte
    db $00,$00,$1a,$00,$00,$00,$1a,$00,$00,$00,$13,$00,$00,$00,$13,$00 ; [$a98b]
                                                                       ; byte
    db $00,$00,$1f,$00,$00,$00,$1f,$00,$00,$00,$18,$00,$00,$00,$18,$00 ; [$a99b]
                                                                       ; byte
    db $00,$00,$24,$00,$00,$00,$24,$00,$00,$00,$fc,$fd,$02,$84,$0e,$00 ; [$a9ab]
                                                                       ; byte
    db $00,$00,$0e,$00,$00,$00,$1a,$00,$00,$00,$1a,$00,$00,$00,$13,$00 ; [$a9bb]
                                                                       ; byte
    db $00,$00,$13,$00,$00,$00,$1f,$00,$00,$00,$1f,$00,$00,$00,$18,$00 ; [$a9cb]
                                                                       ; byte
    db $00,$00,$18,$00,$00,$00,$24,$00,$00,$00,$24,$00,$00,$00,$fc,$0e ; [$a9db]
                                                                       ; byte
    db $00,$0e,$00,$0e,$00,$0e,$00,$1a,$00,$1a,$00,$1a,$00,$1a,$00,$13 ; [$a9eb]
                                                                       ; byte
    db $00,$13,$00,$13,$00,$13,$00,$1f,$00,$1f,$00,$1f,$00,$1f,$00,$18 ; [$a9fb]
                                                                       ; byte
    db $00,$18,$00,$18,$00,$18,$00,$24,$00,$24,$00,$24,$00,$24,$00,$f4 ; [$aa0b]
                                                                       ; byte
    db $ff,$fd,$03,$84,$31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00 ; [$aa1b]
                                                                       ; byte
    db $31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00 ; [$aa2b]
                                                                       ; byte
    db $31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00 ; [$aa3b]
                                                                       ; byte
    db $31,$00,$00,$00,$fc,$fd,$02,$84,$31,$00,$31,$00,$31,$00,$31,$00 ; [$aa4b]
                                                                       ; byte
    db $31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00 ; [$aa5b]
                                                                       ; byte
    db $31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00 ; [$aa6b]
                                                                       ; byte
    db $31,$00,$31,$00,$31,$00,$31,$00,$fc,$f4,$ff,$ff,$f7,$ff,$f1,$00 ; [$aa7b]
                                                                       ; byte
    db $f2,$d0,$f0,$01,$ef,$02,$f6,$f4,$86,$1f,$21,$23,$24,$26,$28,$29 ; [$aa8b]
                                                                       ; byte
    db $2a,$2b,$2d,$2f,$30,$32,$34,$35,$36,$f2,$90,$fd,$02,$b0,$37,$3c ; [$aa9b]
                                                                       ; byte
    db $3e,$45,$c8,$43,$8c,$3c,$3e,$3f,$3c,$3f,$3e,$00,$3b,$98,$37,$fc ; [$aaab]
                                                                       ; byte
    db $fd,$02,$a4,$43,$8c,$3c,$b0,$3c,$8c,$41,$41,$40,$a4,$3c,$8c,$37 ; [$aabb]
                                                                       ; byte
    db $39,$a4,$3a,$8c,$3a,$39,$3a,$39,$bc,$37,$fb,$01,$86,$37,$39,$3b ; [$aacb]
                                                                       ; byte
    db $3c,$3e,$40,$41,$42,$fc,$fb,$02,$86,$3c,$3b,$3c,$3e,$40,$41,$42 ; [$aadb]
                                                                       ; byte
    db $43,$b0,$44,$46,$c8,$43,$8c,$3c,$3e,$3f,$3f,$41,$3e,$00,$3c,$3a ; [$aaeb]
                                                                       ; byte
    db $98,$37,$86,$38,$37,$8c,$35,$92,$37,$86,$30,$33,$37,$3c,$37,$3c ; [$aafb]
                                                                       ; byte
    db $3f,$b0,$44,$46,$bc,$43,$8c,$3c,$3c,$3e,$3f,$3f,$41,$3e,$00,$3c ; [$ab0b]
                                                                       ; byte
    db $98,$3a,$8c,$3f,$3f,$41,$3e,$00,$3c,$3a,$f3,$cc,$3c,$86,$3f,$00 ; [$ab1b]
                                                                       ; byte
    db $3c,$3f,$44,$00,$3f,$44,$46,$41,$3e,$3a,$3c,$00,$3c,$3c,$88,$3c ; [$ab2b]
                                                                       ; byte
    db $00,$00,$00,$3c,$37,$3c,$40,$98,$3c,$88,$00,$ff,$f1,$04,$f2,$d0 ; [$ab3b]
                                                                       ; byte
    db $f0,$00,$ef,$00,$f6,$f4,$f2,$13,$98,$00,$86,$2d,$2f,$30,$32,$34 ; [$ab4b]
                                                                       ; byte
    db $35,$37,$39,$3b,$3c,$3e,$3f,$f2,$50,$f0,$01,$fd,$02,$86,$40,$40 ; [$ab5b]
                                                                       ; byte
    db $40,$00,$48,$37,$40,$40,$40,$40,$40,$00,$48,$37,$40,$40,$41,$41 ; [$ab6b]
                                                                       ; byte
    db $41,$00,$48,$39,$41,$41,$41,$41,$41,$00,$48,$39,$41,$41,$40,$40 ; [$ab7b]
                                                                       ; byte
    db $40,$00,$48,$37,$40,$40,$40,$3c,$37,$3c,$40,$40,$43,$43,$38,$3c ; [$ab8b]
                                                                       ; byte
    db $3f,$44,$48,$44,$37,$00,$00,$00,$2e,$32,$37,$3b,$3e,$3b,$fc,$fd ; [$ab9b]
                                                                       ; byte
    db $02,$86,$40,$43,$37,$3c,$40,$43,$37,$3c,$40,$43,$37,$3c,$40,$43 ; [$abab]
                                                                       ; byte
    db $37,$3c,$41,$43,$37,$3c,$40,$43,$37,$3c,$40,$43,$37,$3c,$40,$43 ; [$abbb]
                                                                       ; byte
    db $3c,$40,$33,$37,$3a,$3f,$43,$3f,$3a,$37,$35,$39,$3c,$41,$3c,$39 ; [$abcb]
                                                                       ; byte
    db $37,$32,$fb,$01,$86,$37,$3c,$40,$3c,$37,$3c,$40,$3c,$40,$41,$43 ; [$abdb]
                                                                       ; byte
    db $45,$47,$48,$4a,$4b,$fc,$fb,$02,$86,$37,$3c,$40,$3c,$37,$3c,$40 ; [$abeb]
                                                                       ; byte
    db $3c,$40,$3f,$40,$41,$43,$45,$47,$48,$fd,$02,$86,$38,$3c,$3f,$44 ; [$abfb]
                                                                       ; byte
    db $48,$4b,$48,$44,$3a,$3e,$41,$46,$4a,$4d,$4a,$46,$30,$34,$37,$3c ; [$ac0b]
                                                                       ; byte
    db $40,$43,$48,$4c,$48,$43,$40,$3c,$37,$34,$30,$34,$38,$3c,$3f,$44 ; [$ac1b]
                                                                       ; byte
    db $48,$44,$41,$3e,$3a,$35,$3a,$3e,$41,$3e,$3a,$3e,$fb,$01,$8c,$3f ; [$ac2b]
                                                                       ; byte
    db $86,$41,$3f,$8c,$3c,$3c,$86,$30,$33,$37,$3c,$3f,$3c,$37,$33,$fc ; [$ac3b]
                                                                       ; byte
    db $fb,$02,$86,$3f,$44,$48,$44,$3f,$44,$8c,$46,$00,$41,$43,$92,$40 ; [$ac4b]
                                                                       ; byte
    db $86,$3c,$37,$3c,$34,$37,$30,$34,$40,$3c,$37,$3c,$34,$37,$30,$34 ; [$ac5b]
                                                                       ; byte
    db $3e,$3a,$35,$3a,$32,$35,$2e,$32,$3e,$3a,$35,$3a,$32,$35,$2e,$32 ; [$ac6b]
                                                                       ; byte
    db $3c,$38,$33,$38,$30,$33,$2c,$30,$41,$3e,$3a,$35,$3e,$00,$3e,$3e ; [$ac7b]
                                                                       ; byte
    db $88,$34,$00,$00,$00,$34,$30,$34,$37,$98,$34,$88,$00,$ff,$f6,$e8 ; [$ac8b]
                                                                       ; byte
    db $b0,$00,$86,$3b,$3c,$3e,$40,$41,$43,$45,$47,$fd,$02,$86,$30,$30 ; [$ac9b]
                                                                       ; byte
    db $30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30 ; [$acab]
                                                                       ; byte
    db $30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30 ; [$acbb]
                                                                       ; byte
    db $30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30,$2c,$2c ; [$accb]
                                                                       ; byte
    db $38,$38,$2c,$2c,$2b,$00,$00,$00,$37,$37,$2b,$2b,$2b,$2b,$fc,$fd ; [$acdb]
                                                                       ; byte
    db $02,$86,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00 ; [$aceb]
                                                                       ; byte
    db $30,$30,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00 ; [$acfb]
                                                                       ; byte
    db $30,$30,$33,$33,$33,$33,$33,$00,$33,$33,$35,$35,$35,$35,$35,$00 ; [$ad0b]
                                                                       ; byte
    db $35,$35,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00 ; [$ad1b]
                                                                       ; byte
    db $30,$30,$fc,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$2e,$2e,$2e,$2e ; [$ad2b]
                                                                       ; byte
    db $2e,$2e,$2e,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30 ; [$ad3b]
                                                                       ; byte
    db $00,$30,$30,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$00,$00,$00,$2e,$2e,$2e ; [$ad4b]
                                                                       ; byte
    db $2e,$2e,$2e,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30 ; [$ad5b]
                                                                       ; byte
    db $00,$30,$30,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$2e,$2e,$2e,$2e ; [$ad6b]
                                                                       ; byte
    db $2e,$2e,$2e,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30 ; [$ad7b]
                                                                       ; byte
    db $00,$30,$30,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$00,$00,$00,$2e,$2e,$2e ; [$ad8b]
                                                                       ; byte
    db $2e,$2e,$2e,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$00,$00,$00,$2e,$2e,$2e ; [$ad9b]
                                                                       ; byte
    db $2e,$8c,$30,$86,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30 ; [$adab]
                                                                       ; byte
    db $30,$30,$30,$86,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$2e,$2e,$2e ; [$adbb]
                                                                       ; byte
    db $2e,$00,$2e,$2e,$88,$30,$00,$00,$00,$30,$34,$30,$30,$98,$30,$88 ; [$adcb]
                                                                       ; byte
    db $00,$ff,$8c,$21,$86,$31,$31,$8c,$21,$86,$31,$31,$21,$21,$21,$21 ; [$addb]
                                                                       ; byte
    db $21,$21,$21,$21,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$adeb]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86 ; [$adfb]
                                                                       ; byte
    db $31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c ; [$ae0b]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$21,$21,$21,$21,$21,$86 ; [$ae1b]
                                                                       ; byte
    db $31,$00,$8c,$21,$21,$86,$21,$21,$fc,$fd,$02,$86,$31,$00,$31,$31 ; [$ae2b]
                                                                       ; byte
    db $8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00 ; [$ae3b]
                                                                       ; byte
    db $31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$ae4b]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86 ; [$ae5b]
                                                                       ; byte
    db $31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$21 ; [$ae6b]
                                                                       ; byte
    db $21,$21,$31,$fc,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$ae7b]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86 ; [$ae8b]
                                                                       ; byte
    db $31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$fb,$01,$86,$31,$00 ; [$ae9b]
                                                                       ; byte
    db $31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$aeab]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$8c,$21,$86,$21,$21 ; [$aebb]
                                                                       ; byte
    db $21,$31,$fc,$fb,$02,$8c,$21,$21,$21,$21,$86,$31,$00,$8c,$21,$21 ; [$aecb]
                                                                       ; byte
    db $86,$21,$21,$8c,$21,$21,$21,$21,$00,$21,$21,$21,$fd,$02,$86,$31 ; [$aedb]
                                                                       ; byte
    db $00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$fc ; [$aeeb]
                                                                       ; byte
    db $86,$31,$00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$86,$21,$00 ; [$aefb]
                                                                       ; byte
    db $21,$21,$88,$21,$00,$84,$21,$21,$21,$21,$88,$21,$21,$21,$21,$98 ; [$af0b]
                                                                       ; byte
    db $21,$88,$00,$ff,$ff,$f1,$00,$f2,$b0,$f0,$01,$f6,$f4,$fd,$02,$b0 ; [$af1b]
                                                                       ; byte
    db $30,$2b,$30,$37,$c0,$37,$90,$35,$34,$e0,$35,$c0,$35,$90,$34,$32 ; [$af2b]
                                                                       ; byte
    db $b0,$34,$30,$c0,$34,$90,$2d,$30,$b0,$30,$2f,$fc,$f4,$ff,$f1,$02 ; [$af3b]
                                                                       ; byte
    db $f2,$b0,$f6,$f4,$f0,$01,$fd,$02,$b0,$28,$28,$28,$34,$c0,$2e,$90 ; [$af4b]
                                                                       ; byte
    db $30,$2e,$e0,$2d,$c0,$2c,$90,$30,$2c,$b0,$2b,$28,$c0,$2a,$90,$26 ; [$af5b]
                                                                       ; byte
    db $2a,$b0,$29,$26,$fc,$f4,$ff,$f6,$f4,$fd,$02,$90,$18,$18,$18,$18 ; [$af6b]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$24,$18,$18,$18,$18 ; [$af7b]
                                                                       ; byte
    db $18,$24,$18,$18,$1d,$1d,$1d,$1d,$1d,$1d,$18,$18,$18,$18,$18,$18 ; [$af8b]
                                                                       ; byte
    db $1a,$1a,$1a,$1a,$1a,$1a,$1f,$1f,$1f,$1f,$1f,$1f,$fc,$f4,$ff,$ff ; [$af9b]
                                                                       ; byte
    db $ff,$f1,$02,$f2,$b0,$f0,$01,$f6,$f4,$fd,$02,$ac,$00,$32,$d8,$37 ; [$afab]
                                                                       ; byte
    db $c2,$37,$8b,$36,$34,$d8,$36,$ac,$00,$37,$d8,$3e,$c2,$3e,$8b,$3c ; [$afbb]
                                                                       ; byte
    db $3b,$ac,$39,$37,$c2,$37,$96,$36,$d8,$36,$ac,$00,$32,$d8,$37,$c2 ; [$afcb]
                                                                       ; byte
    db $37,$8b,$36,$34,$d8,$36,$ac,$00,$32,$37,$3b,$c2,$3e,$96,$40,$c2 ; [$afdb]
                                                                       ; byte
    db $34,$96,$39,$ac,$37,$96,$36,$34,$8b,$36,$37,$36,$37,$88,$36,$87 ; [$afeb]
                                                                       ; byte
    db $37,$87,$36,$8b,$34,$36,$d8,$37,$36,$fc,$f4,$ff,$f1,$02,$f2,$b0 ; [$affb]
                                                                       ; byte
    db $f0,$01,$f6,$f4,$fd,$02,$f3,$b0,$2f,$f3,$84,$30,$ac,$30,$f3,$b0 ; [$b00b]
                                                                       ; byte
    db $32,$d8,$34,$34,$f3,$84,$30,$96,$32,$30,$f3,$b0,$2f,$f3,$84,$30 ; [$b01b]
                                                                       ; byte
    db $ac,$30,$d8,$2f,$ac,$32,$37,$c2,$37,$96,$3c,$c2,$30,$96,$34,$d8 ; [$b02b]
                                                                       ; byte
    db $30,$30,$2f,$30,$fc,$f4,$ff,$f6,$e8,$fd,$02,$f3,$84,$1f,$ac,$1f ; [$b03b]
                                                                       ; byte
    db $f3,$b0,$21,$f3,$84,$23,$ac,$23,$d8,$24,$25,$26,$26,$f3,$84,$1f ; [$b04b]
                                                                       ; byte
    db $ac,$1f,$f3,$b0,$21,$d8,$23,$23,$c2,$34,$96,$37,$c2,$2d,$96,$30 ; [$b05b]
                                                                       ; byte
    db $d8,$26,$26,$1f,$26,$fc,$f4,$ff,$ff,$ff,$f1,$02,$f2,$90,$f0,$01 ; [$b06b]
                                                                       ; byte
    db $fd,$02,$8e,$26,$00,$00,$00,$26,$00,$00,$00,$26,$00,$00,$00,$26 ; [$b07b]
                                                                       ; byte
    db $00,$00,$00,$26,$00,$00,$00,$26,$00,$00,$00,$00,$24,$25,$26,$1f ; [$b08b]
                                                                       ; byte
    db $20,$21,$00,$fc,$fd,$02,$8e,$2b,$00,$2b,$2d,$00,$00,$00,$87,$30 ; [$b09b]
                                                                       ; byte
    db $2f,$8e,$2b,$00,$2b,$2d,$00,$00,$00,$00,$fc,$f4,$ff,$f1,$02,$f2 ; [$b0ab]
                                                                       ; byte
    db $90,$f0,$01,$fd,$02,$8e,$1f,$00,$00,$00,$1f,$00,$00,$00,$1f,$00 ; [$b0bb]
                                                                       ; byte
    db $00,$00,$1f,$00,$00,$00,$1f,$00,$00,$00,$1f,$00,$00,$00,$00,$18 ; [$b0cb]
                                                                       ; byte
    db $19,$1a,$13,$14,$15,$00,$fc,$fd,$02,$8e,$24,$00,$24,$26,$00,$00 ; [$b0db]
                                                                       ; byte
    db $00,$87,$2b,$2a,$8e,$24,$00,$24,$26,$00,$00,$00,$00,$fc,$f4,$ff ; [$b0eb]
                                                                       ; byte
    db $f6,$f4,$fd,$02,$8e,$35,$00,$32,$37,$3c,$00,$3b,$32,$00,$35,$32 ; [$b0fb]
                                                                       ; byte
    db $37,$3c,$3b,$32,$00,$35,$00,$32,$37,$3c,$00,$3b,$32,$00,$30,$31 ; [$b10b]
                                                                       ; byte
    db $32,$2b,$2c,$2d,$00,$fc,$fd,$02,$8e,$26,$00,$26,$26,$87,$1a,$00 ; [$b11b]
                                                                       ; byte
    db $1a,$00,$1a,$00,$1a,$1a,$8e,$26,$00,$26,$26,$87,$1a,$00,$1a,$00 ; [$b12b]
                                                                       ; byte
    db $1a,$00,$1a,$1a,$fc,$f4,$ff,$ff,$ff,$f7,$f4,$f1,$02,$f0,$00,$f2 ; [$b13b]
                                                                       ; byte
    db $d0,$fd,$02,$88,$00,$3c,$37,$32,$00,$00,$00,$00,$00,$3a,$35,$30 ; [$b14b]
                                                                       ; byte
    db $2b,$00,$00,$00,$fc,$fd,$02,$88,$00,$3c,$37,$98,$32,$88,$37,$32 ; [$b15b]
                                                                       ; byte
    db $00,$3a,$35,$90,$30,$88,$35,$30,$00,$fc,$fd,$02,$88,$39,$39,$39 ; [$b16b]
                                                                       ; byte
    db $39,$90,$37,$00,$b0,$00,$88,$39,$39,$39,$39,$90,$37,$c0,$00,$90 ; [$b17b]
                                                                       ; byte
    db $32,$37,$37,$3c,$3c,$41,$41,$3c,$3c,$37,$a0,$39,$37,$00,$90,$2c ; [$b18b]
                                                                       ; byte
    db $2e,$88,$37,$37,$37,$38,$00,$38,$00,$38,$3a,$3a,$3a,$38,$00,$38 ; [$b19b]
                                                                       ; byte
    db $00,$38,$a0,$37,$35,$c0,$00,$fc,$fd,$02,$98,$35,$39,$90,$3c,$a0 ; [$b1ab]
                                                                       ; byte
    db $3b,$39,$98,$3c,$40,$90,$39,$a0,$3e,$88,$3b,$39,$37,$36,$fc,$f4 ; [$b1bb]
                                                                       ; byte
    db $ff,$f1,$04,$f0,$00,$f2,$90,$fd,$02,$88,$00,$37,$32,$2d,$00,$00 ; [$b1cb]
                                                                       ; byte
    db $00,$00,$00,$35,$30,$2b,$26,$00,$00,$00,$fc,$fd,$02,$88,$00,$37 ; [$b1db]
                                                                       ; byte
    db $32,$98,$2d,$88,$32,$2d,$00,$35,$30,$90,$2b,$88,$30,$2b,$00,$fc ; [$b1eb]
                                                                       ; byte
    db $fd,$02,$88,$35,$35,$35,$35,$90,$32,$00,$b0,$00,$88,$00,$00,$35 ; [$b1fb]
                                                                       ; byte
    db $35,$90,$32,$c0,$00,$90,$2d,$32,$32,$37,$37,$3c,$3c,$37,$37,$32 ; [$b20b]
                                                                       ; byte
    db $a0,$35,$33,$00,$90,$29,$2c,$88,$33,$33,$33,$35,$00,$35,$00,$35 ; [$b21b]
                                                                       ; byte
    db $37,$37,$37,$35,$00,$35,$00,$35,$a0,$33,$31,$c0,$00,$fc,$88,$00 ; [$b22b]
                                                                       ; byte
    db $98,$35,$39,$90,$3c,$a0,$3b,$a0,$39,$98,$3c,$40,$90,$39,$9c,$3e ; [$b23b]
                                                                       ; byte
    db $88,$3b,$39,$37,$84,$36,$88,$32,$35,$32,$35,$39,$35,$39,$3c,$37 ; [$b24b]
                                                                       ; byte
    db $3b,$37,$35,$39,$35,$32,$35,$39,$3c,$39,$3c,$40,$3c,$35,$39,$3b ; [$b25b]
                                                                       ; byte
    db $3e,$3b,$8c,$37,$88,$3b,$39,$37,$84,$36,$f4,$ff,$fd,$02,$88,$18 ; [$b26b]
                                                                       ; byte
    db $00,$00,$18,$00,$00,$18,$00,$18,$00,$00,$18,$00,$00,$18,$18,$90 ; [$b27b]
                                                                       ; byte
    db $18,$88,$00,$18,$00,$00,$90,$18,$18,$88,$00,$18,$00,$0c,$18,$0c ; [$b28b]
                                                                       ; byte
    db $fc,$fd,$02,$88,$13,$13,$13,$13,$90,$13,$88,$1d,$1f,$00,$1f,$1d ; [$b29b]
                                                                       ; byte
    db $1a,$90,$13,$88,$00,$00,$13,$13,$90,$13,$00,$88,$1d,$1f,$11,$12 ; [$b2ab]
                                                                       ; byte
    db $13,$00,$90,$00,$88,$11,$13,$90,$21,$26,$26,$2b,$2b,$26,$26,$21 ; [$b2bb]
                                                                       ; byte
    db $a0,$13,$90,$11,$88,$1d,$11,$a0,$00,$98,$22,$88,$16,$22,$16,$22 ; [$b2cb]
                                                                       ; byte
    db $22,$00,$22,$16,$22,$22,$16,$22,$22,$00,$22,$16,$22,$a0,$16,$16 ; [$b2db]
                                                                       ; byte
    db $98,$00,$88,$16,$16,$15,$14,$12,$fc,$fd,$02,$90,$13,$88,$00,$90 ; [$b2eb]
                                                                       ; byte
    db $13,$88,$00,$13,$00,$13,$00,$00,$13,$00,$00,$13,$13,$fc,$fd,$02 ; [$b2fb]
                                                                       ; byte
    db $90,$13,$88,$1f,$90,$13,$88,$1f,$13,$1f,$13,$13,$1f,$90,$13,$88 ; [$b30b]
                                                                       ; byte
    db $1f,$13,$1f,$fc,$f4,$ff,$fd,$04,$88,$21,$31,$31,$21,$31,$31,$21 ; [$b31b]
                                                                       ; byte
    db $31,$21,$31,$31,$21,$31,$31,$21,$31,$fc,$fd,$02,$88,$21,$21,$21 ; [$b32b]
                                                                       ; byte
    db $21,$21,$00,$31,$31,$31,$31,$31,$31,$21,$00,$00,$21,$11,$11,$11 ; [$b33b]
                                                                       ; byte
    db $00,$85,$31,$31,$86,$31,$88,$31,$31,$31,$31,$21,$00,$21,$00,$21 ; [$b34b]
                                                                       ; byte
    db $21,$31,$00,$31,$00,$31,$31,$21,$00,$31,$00,$31,$31,$31,$31,$21 ; [$b35b]
                                                                       ; byte
    db $21,$31,$00,$31,$00,$31,$00,$31,$00,$85,$31,$31,$86,$31,$88,$31 ; [$b36b]
                                                                       ; byte
    db $31,$21,$21,$31,$00,$31,$31,$31,$31,$21,$31,$31,$31,$31,$31,$31 ; [$b37b]
                                                                       ; byte
    db $31,$21,$31,$31,$31,$a0,$00,$88,$21,$21,$21,$21,$85,$31,$31,$86 ; [$b38b]
                                                                       ; byte
    db $31,$88,$31,$31,$85,$31,$31,$86,$31,$88,$21,$21,$fc,$fd,$02,$88 ; [$b39b]
                                                                       ; byte
    db $31,$00,$00,$31,$00,$00,$31,$00,$31,$00,$00,$31,$00,$00,$31,$31 ; [$b3ab]
                                                                       ; byte
    db $fc,$fd,$02,$88,$31,$11,$11,$31,$11,$11,$31,$11,$31,$11,$11,$31 ; [$b3bb]
                                                                       ; byte
    db $11,$11,$31,$31,$fc,$f4,$ff,$a7,$ff,$75,$ff,$57,$61,$00,$ff,$e9 ; [$b3cb]
                                                                       ; byte
    db $ff,$f8,$ff,$ad,$fe,$00,$ff,$23,$ff,$fd,$ff,$29,$ed,$00,$ff,$7c ; [$b3db]
                                                                       ; byte
    db $ff,$3a,$ff,$ba,$4c,$00,$ff,$37,$ff,$7b,$ff,$4c,$32,$00,$ff,$48 ; [$b3eb]
                                                                       ; byte
    db $ff,$be,$ff,$3a,$d6,$00,$ff,$82,$ff,$53,$ff,$4e,$fb,$00,$ff,$84 ; [$b3fb]
                                                                       ; byte
    db $ff,$f8,$ff,$d8,$eb,$00,$ff,$74,$ff,$ef,$ff,$bd,$db,$00,$ff,$39 ; [$b40b]
                                                                       ; byte
    db $ff,$ff,$ff,$ee,$97,$00,$ff,$0a,$ff,$c6,$ff,$c5,$ff,$00,$ff,$02 ; [$b41b]
                                                                       ; byte
    db $ff,$7d,$ff,$74,$f1,$00,$ff,$3e,$ff,$93,$ff,$b1,$7b,$00,$ff,$c6 ; [$b42b]
                                                                       ; byte
    db $ff,$5d,$ff,$ff,$73,$00,$ff,$84,$ff,$11,$ff,$e4,$bf,$00,$ff,$3c ; [$b43b]
                                                                       ; byte
    db $ff,$b3,$ff,$3f,$7d,$00,$ff,$8a,$ff,$5e,$ff,$c3,$7f,$00,$ff,$cc ; [$b44b]
                                                                       ; byte
    db $ff,$de,$ff,$3f,$f8,$00,$ff,$45,$ff,$d3,$ff,$ee,$77,$00,$ff,$80 ; [$b45b]
                                                                       ; byte
    db $ff,$85,$ff,$79,$7e,$00,$ff,$95,$ff,$62,$ff,$73,$2f,$00,$ff,$f3 ; [$b46b]
                                                                       ; byte
    db $ff,$ff,$ff,$0c,$ff,$00,$ff,$95,$ff,$82,$ff,$ab,$7f,$00,$ff,$c0 ; [$b47b]
                                                                       ; byte
    db $ff,$5a,$ff,$01,$97,$00,$ff,$12,$ff,$5d,$ff,$aa,$f3,$00,$ff,$f0 ; [$b48b]
                                                                       ; byte
    db $ff,$18,$ff,$f3,$f9,$00,$ff,$00,$ff,$3e,$ff,$6a,$cb,$00,$ff,$57 ; [$b49b]
                                                                       ; byte
    db $ff,$bb,$ff,$78,$fe,$00,$ff,$a7,$ff,$23,$ff,$d2,$80,$00,$ff,$a5 ; [$b4ab]
                                                                       ; byte
    db $ff,$6e,$ff,$2f,$b6,$00,$ff,$50,$ff,$66,$ff,$20,$75,$00,$ff,$55 ; [$b4bb]
                                                                       ; byte
    db $ff,$f7,$ff,$5b,$ed,$00,$ff,$60,$ff,$e8,$ff,$78,$9e,$00,$ff,$d9 ; [$b4cb]
                                                                       ; byte
    db $ff,$13,$ff,$bd,$ff,$00,$ff,$ec,$ff,$0b,$ff,$26,$fd,$00,$ff,$e2 ; [$b4db]
                                                                       ; byte
    db $ff,$58,$ff,$36,$77,$00,$ff,$40,$ff,$b6,$ff,$02,$ff,$00,$ff,$f9 ; [$b4eb]
                                                                       ; byte
    db $ff,$df,$ff,$b0,$58,$00,$ff,$b4,$ff,$9e,$ff,$aa,$fb,$00,$ff,$84 ; [$b4fb]
                                                                       ; byte
    db $ff,$9a,$ff,$9f,$ff,$00,$ff,$34,$ff,$d3,$ff,$32,$9f,$00,$ff,$4a ; [$b50b]
                                                                       ; byte
    db $ff,$57,$ff,$6f,$6d,$00,$ff,$2a,$ff,$64,$ff,$fe,$dd,$00,$ff,$94 ; [$b51b]
                                                                       ; byte
    db $ff,$d1,$ff,$bb,$ef,$00,$ff,$2c,$ff,$5f,$ff,$cb,$bf,$00,$ff,$e7 ; [$b52b]
                                                                       ; byte
    db $ff,$7c,$ff,$f3,$7d,$00,$ff,$90,$ff,$51,$ff,$33,$ec,$00,$ff,$59 ; [$b53b]
                                                                       ; byte
    db $ff,$a4,$ff,$72,$7f,$00,$ff,$1a,$ff,$0f,$ff,$c5,$af,$00,$ff,$2f ; [$b54b]
                                                                       ; byte
    db $ff,$e9,$ff,$15,$30,$00,$ff,$03,$ff,$06,$ff,$13,$bf,$00,$ff,$0b ; [$b55b]
                                                                       ; byte
    db $ff,$fb,$ff,$e2,$fe,$00,$ff,$d5,$ff,$c7,$ff,$69,$9f,$00,$ff,$32 ; [$b56b]
                                                                       ; byte
    db $ff,$76,$ff,$fc,$06,$00,$ff,$14,$ff,$3c,$ff,$6f,$0f,$00,$ff,$ad ; [$b57b]
                                                                       ; byte
    db $ff,$ea,$ff,$db,$af,$00,$ff,$27,$ff,$ee,$ff,$f9,$4c,$00,$ff,$23 ; [$b58b]
                                                                       ; byte
    db $ff,$5d,$ff,$57,$fe,$00,$ff,$04,$ff,$b1,$ff,$e2,$f7,$00,$ff,$a4 ; [$b59b]
                                                                       ; byte
    db $ff,$53,$ff,$fa,$ff,$00,$ff,$2c,$ff,$5f,$ff,$fd,$8c,$00,$ff,$7d ; [$b5ab]
                                                                       ; byte
    db $ff,$77,$ff,$e8,$52,$00,$ff,$00,$ff,$83,$ff,$35,$bf,$00,$ff,$58 ; [$b5bb]
                                                                       ; byte
    db $ff,$d7,$ff,$ef,$d7,$00,$ff,$60,$ff,$f8,$ff,$d1,$de,$00,$ff,$94 ; [$b5cb]
                                                                       ; byte
    db $ff,$f3,$ff,$ea,$cf,$00,$ff,$08,$ff,$48,$ff,$7b,$fb,$00,$ff,$33 ; [$b5db]
                                                                       ; byte
    db $ff,$d6,$ff,$7f,$83,$00,$ff,$71,$ff,$4e,$ff,$45,$ff,$00,$ff,$fc ; [$b5eb]
                                                                       ; byte
    db $ff,$97,$ef,$f6,$3e,$00,$ff,$40,$ff,$05,$ff,$4b,$ff,$00,$ff,$04 ; [$b5fb]
                                                                       ; byte
    db $ff,$72,$ff,$69,$ff,$00,$ff,$12,$ff,$c8,$ff,$e9,$ef,$00,$ff,$d8 ; [$b60b]
                                                                       ; byte
    db $ff,$df,$ff,$af,$03,$00,$ff,$27,$ff,$2c,$ff,$11,$ff,$00,$ff,$94 ; [$b61b]
                                                                       ; byte
    db $ff,$22,$ff,$f2,$ff,$00,$ff,$e4,$ff,$bd,$ff,$f7,$92,$00,$ff,$26 ; [$b62b]
                                                                       ; byte
    db $ff,$ff,$ff,$a7,$65,$00,$ff,$61,$ff,$a8,$ff,$b0,$be,$00,$ff,$0d ; [$b63b]
                                                                       ; byte
    db $ff,$a2,$ff,$51,$a3,$00,$ff,$f0,$ff,$c4,$ff,$04,$ae,$00,$ff,$3b ; [$b64b]
                                                                       ; byte
    db $ff,$7f,$ff,$3b,$cf,$00,$ff,$01,$ff,$56,$ff,$61,$ff,$00,$ff,$8d ; [$b65b]
                                                                       ; byte
    db $ff,$fb,$ff,$81,$f7,$00,$ff,$12,$ff,$cb,$ff,$73,$df,$00,$ff,$71 ; [$b66b]
                                                                       ; byte
    db $ff,$d9,$ff,$b7,$bf,$00,$ff,$00,$ff,$59,$ff,$79,$97,$00,$ff,$42 ; [$b67b]
                                                                       ; byte
    db $ff,$7d,$ff,$b9,$ea,$00,$ff,$70,$ff,$db,$ff,$fd,$30,$00,$ff,$08 ; [$b68b]
                                                                       ; byte
    db $ff,$67,$ff,$9f,$8e,$00,$ff,$01,$ff,$1f,$ff,$27,$7f,$00,$ff,$c0 ; [$b69b]
                                                                       ; byte
    db $ff,$27,$ff,$50,$6f,$00,$ff,$63,$ff,$be,$ff,$40,$cf,$00,$ff,$c5 ; [$b6ab]
                                                                       ; byte
    db $ff,$da,$ff,$1f,$9f,$00,$ff,$28,$ff,$e5,$ff,$a3,$b7,$00,$ff,$c2 ; [$b6bb]
                                                                       ; byte
    db $ff,$19,$ff,$8b,$9f,$00,$ff,$44,$ff,$f7,$ff,$d5,$ef,$00,$ff,$2d ; [$b6cb]
                                                                       ; byte
    db $ff,$ad,$ff,$d5,$7f,$00,$ff,$22,$ff,$3e,$ff,$75,$5f,$00,$ff,$01 ; [$b6db]
                                                                       ; byte
    db $ff,$ed,$ff,$14,$df,$00,$ff,$38,$ff,$7d,$ff,$fa,$d3,$00,$ff,$7c ; [$b6eb]
                                                                       ; byte
    db $ff,$bd,$ff,$de,$ce,$00,$ff,$3e,$ff,$e7,$ff,$e1,$e6,$00,$ff,$38 ; [$b6fb]
                                                                       ; byte
    db $ff,$3a,$ff,$59,$f5,$00,$ff,$05,$ff,$17,$ef,$75,$5e,$00,$ff,$6b ; [$b70b]
                                                                       ; byte
    db $ff,$fd,$ff,$de,$34,$00,$ff,$32,$ff,$5b,$ff,$00,$f3,$00,$ff,$20 ; [$b71b]
                                                                       ; byte
    db $ff,$da,$ff,$5e,$ff,$00,$ff,$04,$ff,$e0,$ff,$c1,$f3,$00,$ff,$49 ; [$b72b]
                                                                       ; byte
    db $ff,$b7,$ff,$9e,$ee,$00,$ff,$72,$ff,$34,$ff,$76,$d5,$00,$ff,$01 ; [$b73b]
                                                                       ; byte
    db $ff,$69,$ff,$0d,$fe,$00,$ff,$bb,$ff,$20,$ff,$e4,$7e,$00,$ff,$43 ; [$b74b]
                                                                       ; byte
    db $ff,$b7,$ff,$7b,$18,$00,$ff,$61,$ff,$03,$ff,$e0,$ff,$00,$ff,$89 ; [$b75b]
                                                                       ; byte
    db $ff,$f5,$ff,$66,$8f,$00,$ff,$fe,$ff,$c7,$ff,$fd,$bf,$00,$ff,$28 ; [$b76b]
                                                                       ; byte
    db $ff,$eb,$ff,$af,$eb,$00,$ff,$04,$ff,$0a,$ff,$c1,$bf,$00,$ff,$50 ; [$b77b]
                                                                       ; byte
    db $ff,$21,$df,$f4,$db,$00,$ff,$dc,$ff,$9e,$ff,$ff,$bd,$00,$ff,$8b ; [$b78b]
                                                                       ; byte
    db $ff,$be,$ff,$cd,$b5,$00,$ff,$00,$ff,$39,$ff,$1c,$ff,$00,$ff,$08 ; [$b79b]
                                                                       ; byte
    db $ff,$11,$ff,$b7,$bf,$00,$ff,$f2,$ff,$77,$ff,$f4,$f7,$00,$ff,$64 ; [$b7ab]
                                                                       ; byte
    db $ff,$53,$ff,$ff,$b3,$00,$ff,$81,$ff,$55,$ff,$cd,$97,$00,$ff,$1e ; [$b7bb]
                                                                       ; byte
    db $ff,$39,$ff,$68,$fb,$00,$ff,$a0,$ff,$fd,$ff,$ca,$ee,$00,$ff,$ae ; [$b7cb]
                                                                       ; byte
    db $df,$f4,$fb,$7f,$6b,$00,$ff,$44,$ff,$93,$ff,$f5,$7c,$00,$ff,$46 ; [$b7db]
                                                                       ; byte
    db $ff,$04,$ff,$fd,$7f,$00,$ff,$e0,$ff,$34,$df,$7b,$fe,$00,$ff,$5a ; [$b7eb]
                                                                       ; byte
    db $ff,$eb,$ff,$19,$c1,$00,$ff,$31,$ff,$a4,$ff,$26,$3d,$00,$ff,$e0 ; [$b7fb]
                                                                       ; byte
    db $ff,$b0,$ff,$e3,$ff,$00,$ff,$fa,$ff,$71,$ff,$f9,$fe,$00,$ff,$3b ; [$b80b]
                                                                       ; byte
    db $ff,$fe,$ff,$cf,$de,$00,$ff,$16,$ff,$e5,$ff,$bc,$1d,$00,$ff,$05 ; [$b81b]
                                                                       ; byte
    db $ff,$9e,$ff,$bb,$fb,$00,$ff,$b0,$ff,$bb,$ff,$9e,$e7,$00,$ff,$50 ; [$b82b]
                                                                       ; byte
    db $ff,$bc,$ff,$cd,$a6,$00,$ff,$3a,$ff,$02,$ff,$e2,$de,$00,$ff,$42 ; [$b83b]
                                                                       ; byte
    db $ff,$3a,$ff,$c5,$33,$00,$ff,$d2,$ff,$67,$ff,$5b,$7d,$00,$ff,$6e ; [$b84b]
                                                                       ; byte
    db $ff,$d9,$ff,$fd,$59,$00,$ff,$80,$ff,$0c,$ff,$02,$df,$00,$ff,$a4 ; [$b85b]
                                                                       ; byte
    db $ff,$9a,$ff,$93,$ff,$00,$ff,$06,$ff,$a7,$ff,$7e,$df,$00,$f7,$3d ; [$b86b]
                                                                       ; byte
    db $ff,$71,$ff,$ee,$4f,$00,$ff,$04,$ff,$10,$ff,$c8,$bb,$00,$ff,$12 ; [$b87b]
                                                                       ; byte
    db $ff,$2f,$ff,$f5,$74,$00,$ff,$30,$ff,$f3,$ff,$5e,$55,$00,$ff,$c2 ; [$b88b]
                                                                       ; byte
    db $ff,$de,$ff,$b6,$b4,$00,$ff,$81,$ff,$6a,$ff,$f7,$fd,$00,$ff,$93 ; [$b89b]
                                                                       ; byte
    db $ff,$24,$ff,$47,$b6,$00,$ff,$45,$ff,$6b,$ff,$17,$37,$00,$ff,$88 ; [$b8ab]
                                                                       ; byte
    db $ff,$76,$ff,$7f,$2f,$00,$ff,$00,$ff,$be,$ff,$9a,$fd,$00,$ff,$b2 ; [$b8bb]
                                                                       ; byte
    db $ff,$db,$ff,$dc,$af,$00,$f7,$aa,$ff,$7e,$ff,$ed,$df,$00,$ff,$68 ; [$b8cb]
                                                                       ; byte
    db $ff,$ed,$ff,$bb,$7c,$00,$ff,$20,$ff,$12,$ff,$39,$8b,$00,$ff,$70 ; [$b8db]
                                                                       ; byte
    db $ff,$e0,$ff,$1c,$9d,$00,$ff,$67,$ff,$83,$fd,$f4,$93,$00,$ff,$19 ; [$b8eb]
                                                                       ; byte
    db $ff,$79,$ff,$bf,$7f,$00,$ff,$a1,$ff,$3a,$ff,$8a,$f7,$00,$ff,$84 ; [$b8fb]
                                                                       ; byte
    db $ff,$5e,$ff,$b5,$6b,$00,$ff,$b0,$ff,$65,$ff,$d6,$f9,$00,$ff,$72 ; [$b90b]
                                                                       ; byte
    db $ff,$7b,$ff,$74,$8d,$00,$ff,$08,$ff,$0d,$ff,$5d,$bd,$00,$ff,$00 ; [$b91b]
                                                                       ; byte
    db $ff,$82,$ff,$7a,$3f,$00,$ff,$e2,$ff,$b2,$ff,$a4,$7e,$00,$ff,$e7 ; [$b92b]
                                                                       ; byte
    db $ff,$95,$fe,$b5,$af,$00,$ff,$80,$ff,$10,$ff,$31,$f8,$00,$ff,$40 ; [$b93b]
                                                                       ; byte
    db $ff,$6a,$ff,$7e,$ff,$00,$ff,$45,$ff,$5d,$ff,$21,$67,$00,$ff,$c0 ; [$b94b]
                                                                       ; byte
    db $ff,$af,$ff,$85,$e3,$00,$ff,$00,$ff,$12,$ff,$97,$cf,$00,$ff,$b0 ; [$b95b]
                                                                       ; byte
    db $ff,$63,$ff,$b8,$ce,$00,$ff,$fa,$ff,$3b,$ff,$a3,$e5,$00,$ff,$60 ; [$b96b]
                                                                       ; byte
    db $ff,$5b,$ff,$89,$76,$00,$ff,$80,$ff,$52,$ff,$52,$7e,$00,$ff,$a0 ; [$b97b]
                                                                       ; byte
    db $ff,$1f,$ff,$66,$d7,$00,$ff,$76,$ff,$9d,$ff,$f9,$14,$00,$ff,$ff ; [$b98b]
                                                                       ; byte
    db $ff,$2f,$ff,$f7,$52,$00,$ff,$9c,$ff,$04,$ff,$76,$ff,$00,$ff,$94 ; [$b99b]
                                                                       ; byte
    db $ff,$72,$ff,$7f,$4e,$00,$ff,$a7,$ff,$c7,$ff,$66,$6d,$00,$ff,$9d ; [$b9ab]
                                                                       ; byte
    db $ff,$7f,$ff,$7c,$26,$00,$ff,$26,$ff,$c7,$ff,$72,$ff,$00,$ff,$31 ; [$b9bb]
                                                                       ; byte
    db $ff,$b7,$ff,$7e,$e9,$00,$ff,$bc,$ff,$de,$ff,$e7,$e4,$00,$ff,$7b ; [$b9cb]
                                                                       ; byte
    db $ff,$f2,$fe,$f3,$eb,$00,$ff,$e8,$ff,$32,$ff,$9d,$f7,$00,$ff,$80 ; [$b9db]
                                                                       ; byte
    db $ff,$36,$ff,$9c,$ff,$00,$ff,$88,$ff,$eb,$ff,$eb,$a7,$00,$ff,$8f ; [$b9eb]
                                                                       ; byte
    db $ff,$77,$ff,$df,$79,$00,$ff,$fa,$ff,$a6,$ff,$cd,$ff,$00,$ff,$a0 ; [$b9fb]
                                                                       ; byte
    db $ff,$b4,$ff,$52,$eb,$00,$ff,$dc,$ff,$be,$ff,$c5,$6d,$00,$ff,$63 ; [$ba0b]
                                                                       ; byte
    db $ff,$fd,$ff,$a2,$42,$00,$ff,$a4,$ff,$c1,$ff,$88,$fd,$00,$ff,$30 ; [$ba1b]
                                                                       ; byte
    db $ff,$6a,$ff,$92,$7d,$00,$ff,$70,$ff,$bb,$ff,$76,$ff,$00,$ff,$b4 ; [$ba2b]
                                                                       ; byte
    db $ff,$f5,$ff,$fe,$dc,$00,$ff,$80,$ff,$37,$ff,$a4,$e7,$00,$ff,$40 ; [$ba3b]
                                                                       ; byte
    db $ff,$43,$ff,$7d,$f7,$00,$ff,$12,$ff,$f1,$ff,$57,$df,$00,$ff,$d7 ; [$ba4b]
                                                                       ; byte
    db $ff,$c5,$ff,$3b,$e7,$00,$ff,$6c,$ff,$de,$ff,$98,$5a,$00,$ff,$82 ; [$ba5b]
                                                                       ; byte
    db $ff,$8e,$ff,$23,$5e,$00,$ff,$06,$ff,$bd,$ff,$a7,$6f,$00,$ff,$bc ; [$ba6b]
                                                                       ; byte
    db $ff,$eb,$ff,$55,$0b,$00,$ff,$a1,$ff,$cd,$ff,$15,$d7,$00,$ff,$a2 ; [$ba7b]
                                                                       ; byte
    db $ff,$ca,$ff,$2b,$8f,$00,$ff,$6f,$ff,$fe,$ff,$db,$68,$00,$ff,$b8 ; [$ba8b]
                                                                       ; byte
    db $ff,$d7,$ff,$df,$55,$00,$ff,$b4,$ff,$06,$ff,$cd,$bf,$00,$ff,$d0 ; [$ba9b]
                                                                       ; byte
    db $ff,$78,$ff,$e6,$ed,$00,$ff,$e4,$ff,$dd,$ff,$ba,$ce,$00,$ff,$4d ; [$baab]
                                                                       ; byte
    db $ff,$df,$ff,$c5,$95,$00,$ff,$2a,$ff,$ed,$ff,$36,$fe,$00,$ff,$00 ; [$babb]
                                                                       ; byte
    db $ff,$c3,$ff,$7f,$df,$00,$ff,$40,$ff,$f5,$fb,$b1,$ec,$00,$ff,$d8 ; [$bacb]
                                                                       ; byte
    db $ff,$df,$ff,$7d,$bf,$00,$df,$04,$ff,$b5,$ff,$e7,$af,$00,$ff,$00 ; [$badb]
                                                                       ; byte
    db $ff,$51,$ff,$ff,$d3,$00,$ff,$95,$ff,$74,$ff,$e4,$8f,$00,$ff,$c1 ; [$baeb]
                                                                       ; byte
    db $ff,$7f,$ff,$7f,$54,$00,$ff,$40,$ff,$0f,$ff,$d9,$3f,$00,$ff,$44 ; [$bafb]
                                                                       ; byte
    db $ff,$4d,$ff,$bf,$cf,$00,$ff,$32,$ff,$f9,$ff,$ab,$f7,$00,$ff,$f1 ; [$bb0b]
                                                                       ; byte
    db $ff,$df,$af,$7f,$02,$00,$ff,$54,$ff,$23,$ff,$59,$9f,$00,$ff,$07 ; [$bb1b]
                                                                       ; byte
    db $ff,$b1,$ff,$a4,$ef,$00,$ff,$30,$ff,$66,$ff,$6e,$de,$00,$ff,$e2 ; [$bb2b]
                                                                       ; byte
    db $ff,$6f,$ff,$fb,$bd,$00,$ff,$85,$ff,$27,$ff,$13,$fb,$00,$ff,$08 ; [$bb3b]
                                                                       ; byte
    db $ff,$52,$ff,$de,$bd,$00,$ff,$be,$ff,$bb,$ff,$ee,$b7,$00,$ff,$23 ; [$bb4b]
                                                                       ; byte
    db $ff,$f7,$ff,$7f,$ae,$00,$ff,$00,$ff,$8b,$ff,$31,$ef,$00,$ff,$c1 ; [$bb5b]
                                                                       ; byte
    db $ff,$80,$ff,$9b,$7f,$00,$ff,$76,$ff,$b0,$ff,$3f,$b3,$00,$ff,$55 ; [$bb6b]
                                                                       ; byte
    db $ff,$bf,$ff,$79,$aa,$00,$ff,$11,$ff,$c4,$ff,$38,$8f,$00,$ff,$53 ; [$bb7b]
                                                                       ; byte
    db $ff,$e0,$ff,$0a,$e1,$00,$ff,$03,$ff,$7e,$ff,$5e,$f7,$00,$ff,$62 ; [$bb8b]
                                                                       ; byte
    db $ff,$f3,$ff,$5e,$35,$00,$ff,$54,$ff,$41,$ff,$2e,$df,$00,$ff,$03 ; [$bb9b]
                                                                       ; byte
    db $ff,$6c,$ff,$b5,$5f,$00,$ff,$c4,$ff,$e2,$ff,$5e,$df,$00,$ff,$f6 ; [$bbab]
                                                                       ; byte
    db $ff,$5f,$ff,$a5,$0f,$00,$ff,$c1,$ff,$21,$ff,$4f,$43,$00,$ff,$48 ; [$bbbb]
                                                                       ; byte
    db $ff,$15,$ff,$e0,$df,$00,$ff,$64,$ff,$34,$ff,$b1,$7d,$00,$ff,$f8 ; [$bbcb]
                                                                       ; byte
    db $ff,$ff,$ff,$bc,$2d,$00,$ff,$09,$ff,$e6,$ff,$4d,$f6,$00,$ff,$60 ; [$bbdb]
                                                                       ; byte
    db $ff,$81,$ff,$15,$af,$00,$ff,$30,$ff,$a3,$ff,$ba,$3a,$20,$ff,$53 ; [$bbeb]
                                                                       ; byte
    db $ff,$15,$ff,$ed,$ae,$00,$ff,$21,$ff,$95,$ff,$b3,$fe,$00,$ff,$cc ; [$bbfb]
                                                                       ; byte
    db $ff,$c5,$ff,$63,$2f,$00,$ff,$68,$ff,$3a,$ff,$7e,$ee,$00,$ff,$b4 ; [$bc0b]
                                                                       ; byte
    db $ff,$5b,$ff,$6e,$31,$00,$ff,$10,$ff,$cf,$ff,$98,$e7,$00,$ff,$60 ; [$bc1b]
                                                                       ; byte
    db $ff,$a7,$ff,$21,$3f,$00,$ff,$10,$ff,$ef,$ff,$cd,$eb,$00,$ff,$2e ; [$bc2b]
                                                                       ; byte
    db $ff,$ff,$ff,$c0,$5e,$00,$ff,$00,$ff,$be,$ff,$31,$ff,$00,$ff,$02 ; [$bc3b]
                                                                       ; byte
    db $ff,$de,$ff,$8a,$ff,$00,$ff,$42,$ff,$be,$ff,$b8,$9c,$00,$ff,$95 ; [$bc4b]
                                                                       ; byte
    db $ff,$ed,$ff,$fc,$2e,$00,$ff,$04,$ff,$f5,$ff,$15,$cf,$00,$ff,$4e ; [$bc5b]
                                                                       ; byte
    db $ff,$ee,$ff,$28,$dc,$00,$ff,$0a,$ff,$f1,$ff,$5d,$76,$00,$ff,$b1 ; [$bc6b]
                                                                       ; byte
    db $ff,$97,$ff,$6b,$7a,$00,$ff,$85,$ff,$39,$ff,$15,$cf,$00,$ff,$c6 ; [$bc7b]
                                                                       ; byte
    db $ff,$cb,$ff,$fb,$77,$00,$ff,$1f,$ff,$d7,$ff,$ac,$e1,$00,$ff,$1a ; [$bc8b]
                                                                       ; byte
    db $ff,$c8,$ef,$55,$e8,$00,$ff,$8a,$ff,$ea,$ff,$f4,$bd,$00,$ff,$80 ; [$bc9b]
                                                                       ; byte
    db $ff,$2f,$ff,$d7,$ef,$00,$ff,$72,$ff,$45,$ff,$f3,$fd,$00,$ff,$ef ; [$bcab]
                                                                       ; byte
    db $ff,$ef,$ff,$8d,$23,$00,$ff,$20,$ff,$91,$ff,$9c,$ed,$00,$ff,$45 ; [$bcbb]
                                                                       ; byte
    db $ff,$aa,$ff,$93,$ee,$00,$ff,$06,$ff,$4f,$ff,$a3,$9f,$00,$ff,$dd ; [$bccb]
                                                                       ; byte
    db $ff,$ff,$ff,$fb,$0d,$00,$ff,$28,$ff,$05,$ff,$2b,$6d,$00,$ff,$d2 ; [$bcdb]
                                                                       ; byte
    db $ff,$51,$ff,$bc,$fd,$00,$ff,$45,$ff,$86,$ff,$a0,$fa,$00,$ff,$b2 ; [$bceb]
                                                                       ; byte
    db $ff,$af,$ff,$71,$14,$00,$ff,$20,$ff,$53,$ff,$57,$ff,$00,$ff,$f5 ; [$bcfb]
                                                                       ; byte
    db $ff,$bf,$ff,$35,$fd,$01,$ff,$93,$ff,$e6,$ff,$bd,$e8,$00,$ff,$5f ; [$bd0b]
                                                                       ; byte
    db $ff,$b9,$ff,$b8,$ff,$00,$ff,$70,$ff,$73,$ff,$c6,$df,$00,$ff,$03 ; [$bd1b]
                                                                       ; byte
    db $ff,$71,$ff,$89,$af,$00,$ff,$01,$ff,$ab,$ff,$6d,$e7,$00,$ff,$d7 ; [$bd2b]
                                                                       ; byte
    db $ff,$62,$ff,$36,$47,$00,$ff,$40,$ff,$34,$ff,$41,$ef,$00,$ff,$b9 ; [$bd3b]
                                                                       ; byte
    db $ff,$39,$ff,$3e,$6e,$00,$ff,$af,$ff,$17,$ff,$3e,$ff,$00,$ff,$69 ; [$bd4b]
                                                                       ; byte
    db $ff,$5d,$ff,$67,$23,$00,$ff,$a2,$ff,$1a,$ff,$f4,$db,$00,$ff,$87 ; [$bd5b]
                                                                       ; byte
    db $ff,$b3,$ff,$68,$ae,$00,$ff,$63,$ff,$6b,$ff,$65,$fd,$00,$ff,$09 ; [$bd6b]
                                                                       ; byte
    db $ff,$fd,$ff,$ef,$4c,$00,$ff,$01,$ff,$65,$ff,$18,$ea,$00,$ff,$30 ; [$bd7b]
                                                                       ; byte
    db $ff,$a3,$ff,$b6,$7f,$00,$ff,$9f,$ff,$ea,$fe,$7f,$be,$00,$ff,$de ; [$bd8b]
                                                                       ; byte
    db $ff,$25,$ff,$df,$1e,$00,$ff,$11,$ff,$50,$ff,$6b,$7e,$00,$ff,$86 ; [$bd9b]
                                                                       ; byte
    db $ff,$f4,$ff,$b5,$af,$00,$ff,$d0,$ff,$e3,$ff,$3d,$df,$00,$ff,$cd ; [$bdab]
                                                                       ; byte
    db $ff,$ff,$ff,$75,$59,$00,$ff,$19,$ff,$33,$ff,$74,$bb,$00,$ff,$30 ; [$bdbb]
                                                                       ; byte
    db $ff,$ee,$ff,$7e,$fb,$00,$ff,$1a,$ff,$f9,$ff,$ed,$df,$00,$ff,$1d ; [$bdcb]
                                                                       ; byte
    db $ff,$dd,$ff,$cf,$39,$00,$ff,$00,$ff,$de,$ff,$c4,$97,$00,$ff,$b4 ; [$bddb]
                                                                       ; byte
    db $ff,$d3,$ff,$99,$ff,$00,$ff,$a2,$ff,$e6,$7e,$b7,$f7,$00,$ff,$5c ; [$bdeb]
                                                                       ; byte
    db $ff,$b7,$ff,$5f,$34,$00,$ff,$0a,$ff,$c4,$ff,$c2,$ff,$00,$ff,$40 ; [$bdfb]
                                                                       ; byte
    db $ff,$75,$ff,$56,$be,$00,$7f,$2c,$ff,$99,$ff,$9b,$7f,$00,$ff,$cd ; [$be0b]
                                                                       ; byte
    db $ff,$ff,$fe,$dd,$29,$00,$ff,$02,$ff,$15,$ff,$33,$df,$00,$ff,$04 ; [$be1b]
                                                                       ; byte
    db $ff,$75,$ff,$5e,$a6,$00,$ff,$2d,$ff,$23,$ff,$9f,$97,$00,$ff,$5f ; [$be2b]
                                                                       ; byte
    db $ff,$f7,$ff,$92,$03,$00,$ff,$68,$ff,$46,$ff,$48,$fe,$00,$ff,$08 ; [$be3b]
                                                                       ; byte
    db $ff,$9a,$ff,$ed,$ff,$00,$ff,$24,$ff,$7f,$ff,$63,$f7,$00,$ff,$28 ; [$be4b]
                                                                       ; byte
    db $ff,$7d,$ff,$5a,$dd,$00,$ff,$15,$ff,$02,$ff,$0a,$fd,$00,$ff,$06 ; [$be5b]
                                                                       ; byte
    db $ff,$7c,$ff,$d2,$38,$00,$ff,$33,$ff,$7b,$ff,$6f,$c2,$00,$ff,$a9 ; [$be6b]
                                                                       ; byte
    db $ff,$a8,$ff,$db,$dd,$00,$ff,$c0,$ff,$bb,$ff,$fc,$6b,$00,$ff,$70 ; [$be7b]
                                                                       ; byte
    db $ff,$b1,$ff,$49,$bf,$00,$ff,$56,$ff,$bc,$ff,$e5,$a6,$00,$ff,$0c ; [$be8b]
                                                                       ; byte
    db $ff,$73,$ff,$ed,$e7,$00,$ff,$aa,$ff,$27,$ff,$41,$5b,$00,$ff,$09 ; [$be9b]
                                                                       ; byte
    db $ff,$7c,$fb,$ee,$ef,$00,$ff,$68,$ff,$f8,$ff,$53,$6c,$00,$ff,$39 ; [$beab]
                                                                       ; byte
    db $ff,$ff,$ff,$7b,$b8,$00,$ff,$80,$ff,$66,$ff,$65,$7c,$00,$ff,$dd ; [$bebb]
                                                                       ; byte
    db $ff,$ff,$ff,$9b,$83,$00,$ff,$61,$ef,$c7,$df,$70,$f5,$00,$ff,$ed ; [$becb]
                                                                       ; byte
    db $ff,$fa,$ff,$b3,$4c,$00,$ff,$08,$ff,$6b,$ff,$10,$97,$00,$ff,$a0 ; [$bedb]
                                                                       ; byte
    db $ff,$62,$ff,$cd,$ee,$00,$ff,$50,$ff,$fd,$ff,$75,$ef,$00,$ff,$20 ; [$beeb]
                                                                       ; byte
    db $ff,$1f,$ff,$d9,$7b,$00,$ff,$ae,$ff,$9d,$ff,$e3,$ff,$00,$ef,$82 ; [$befb]
                                                                       ; byte
    db $ff,$95,$ff,$9e,$ff,$00,$ff,$c3,$ff,$e7,$ff,$ed,$6f,$00,$ff,$c0 ; [$bf0b]
                                                                       ; byte
    db $ff,$37,$ff,$ff,$fe,$00,$ff,$11,$ff,$64,$ff,$c3,$df,$00,$ff,$76 ; [$bf1b]
                                                                       ; byte
    db $ff,$2e,$ff,$9b,$cb,$00,$ff,$1a,$ff,$ed,$ff,$45,$b9,$00,$ff,$cf ; [$bf2b]
                                                                       ; byte
    db $ff,$eb,$ff,$15,$c7,$00,$ff,$5e,$ff,$21,$ff,$23,$ef,$00,$ff,$31 ; [$bf3b]
                                                                       ; byte
    db $ff,$f0,$ff,$b7,$75,$00,$ff,$12,$ff,$3e,$ff,$de,$de,$00,$ff,$45 ; [$bf4b]
                                                                       ; byte
    db $ff,$f8,$ff,$eb,$9f,$00,$ff,$b9,$ff,$17,$ff,$3f,$fe,$00,$ff,$24 ; [$bf5b]
                                                                       ; byte
    db $ff,$fc,$ff,$e9,$bd,$00,$ff,$fc,$ff,$f1,$ff,$54,$bb,$00,$ff,$c4 ; [$bf6b]
                                                                       ; byte
    db $ff,$aa,$ff,$53,$7b,$00,$ff,$d0,$ff,$12,$ff,$b6,$ef,$00,$ff,$a1 ; [$bf7b]
                                                                       ; byte
    db $ff,$48,$ff,$ca,$b6,$00,$ff,$79,$ff,$51,$ff,$72,$3f,$00,$ff,$7a ; [$bf8b]
                                                                       ; byte
    db $ff,$73,$ff,$f2,$99,$00,$ff,$41,$ff,$d4,$ff,$19,$ff,$00,$ff,$c0 ; [$bf9b]
                                                                       ; byte
    db $ff,$5c,$ff,$98,$c7,$00,$ff,$6a,$ff,$7a,$ff,$9c,$be,$00,$ff,$7d ; [$bfab]
                                                                       ; byte
    db $ff,$fd,$ff,$a6,$8e,$00,$ff,$29,$ff,$db,$ff,$83,$91,$00,$ff,$81 ; [$bfbb]
                                                                       ; byte
    db $ff,$b5,$ff,$aa,$79,$00,$ff,$0c,$ff,$fe,$ff,$bf,$e3,$00,$ff,$a6 ; [$bfcb]
                                                                       ; byte
    db $ff,$da,$ff,$fa,$fa,$00,$ff,$46,$ff,$65,$ff,$e2,$7d,$00,$ff,$fa ; [$bfdb]
                                                                       ; byte
    db $ff,$f5,$ff,$98,$d6,$00,$ff,$22,$ff,$f5,$ff,$f6,$b3,$00,$ff,$a2 ; [$bfeb]
                                                                       ; byte
    db $ff,$f7,$ff,$fe,$bf                  ; [$bffb] byte
