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
    BEQ Audio_HandleNotPlaying
    BPL Audio_LoadMusic
    JMP Audio_PlayMusic

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

;============================================================================
; TODO: Document Audio_HandleIsPaused
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Audio_HandleOnInterrupt
;============================================================================
Audio_HandleIsPaused:                       ; [$802e]
    BMI Audio_HandleNotPlaying
    ORA #$80
    STA a:PauseFlag
    JSR Audio_Reset

    ;
    ; XREFS:
    ;     Audio_HandleIsPaused
    ;     Audio_HandleOnInterrupt
    ;
Audio_HandleNotPlaying:                     ; [$8038]
    LDA CurrentMusic
    BNE @_return
    LDX #$03

  @_loop:                                   ; [$803e]
    LDA SoundEffects,X
    BNE @_return
    DEX
    BPL @_loop
    JMP Audio_Reset

  @_return:                                 ; [$8049]
    RTS

;============================================================================
; TODO: Document Audio_Reset
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Audio_HandleIsPaused
;     Audio_LoadMusic
;     Sound_Init
;============================================================================
Audio_Reset:                                ; [$804a]
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
;============================================================================
; TODO: Document Audio_LoadMusic
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
Audio_LoadMusic:                            ; [$8079]
    ;
    ; Load the current music to play.
    ;
    LDA CurrentMusic
    ORA #$80                                ; Mark as currently playing.
    STA CurrentMusic                        ; Store that.


    ;
    ; Convert to a lookup index for the table.
    ;
    ASL A                                   ; Music *= 8
    ASL A
    ASL A
    TAY                                     ; Y = A (Music lookup index)


    ;
    ; Begin loading the starting MScripts.
    ;
    LDX #$07                                ; X = 7 (loop counter)

  @_loadMusicLoop:                          ; [$8085]
    LDA MUSIC_LOOKUP,Y
    STA Music_CurrentScriptAddrs,X
    STA a:MScript_SavedAddr
    DEY
    DEX
    BPL @_loadMusicLoop
    INX
    STX a:MScript_Maybe_8BitCounter
    STX a:Music_Wave_Length_Highs
    STX a:Something_Music_0162
    STX a:Something_Music_0163
    STX a:Music_SQ_Vol
    STX a:Something_Music_0175
    STX a:Music_SQEffect_Mode
    STX a:Something_Music_0177
    STX a:Music_SQEffect_Counter
    STX a:Something_Music_017a
    STX a:Music_Current_SQ_Low
    STX a:Music_SQ2_Low
    STX a:Music_Note_Period_Low
    STX a:Music_Note_Period_High
    STX a:Maybe_Unused_Music_016f
    STX a:Something_Music_Triangle_017e
    STX a:Music_Noise_Remaining
    STX a:Something_Music_0178
    STX a:MScript_CurValue
    STX a:Music_Something_SQ_017f
    STX a:Something_Music_0180
    STX a:Music_SQ2_Length_Reduction
    INX
    STX a:Music_Repeats
    STX a:Something_Music_0131
    STX a:Something_Music_0132
    STX a:Something_Music_0133
    STX a:MScript_RepeatCounts
    STX a:Something_Music_012d
    STX a:Something_Music_012e
    STX a:Something_Music_012f
    LDA #$08
    STA a:Music_SQ_Note_Lengths
    STA a:Music_Note_Length_High
    STA a:Music_Unused
    STA a:Music_Unused_1_
    LDA #$90
    STA a:Something_Music_SQ_0172
    STA a:Something_Music_0173
    JMP Audio_Reset
;============================================================================
; TODO: Document Audio_PlayMusic
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
Audio_PlayMusic:                            ; [$8106]
    ;
    ; Set the initial state for tracking per-channel playback
    ; for this invocation.
    ;
    LDA #$00
    STA a:Music_NumChannelsCompleted        ; Clear the number of completed
                                            ; channels.
    STA a:MScript_CurrentChannel            ; Clear the current channel
                                            ; index.


    ;
    ; Loop through each of the channels.
    ;
    ; For each channel, the current value will be played and
    ; only advanced when the repeat count for the value hits 0.
    ;
  @_loop:                                   ; [$810e]
    LDX a:MScript_CurrentChannel            ; X = Current channel index
    DEC Music_Repeats,X
    BNE @LAB_PRG5__8119
    JSR MScripts_InvokeNext

  @LAB_PRG5__8119:                          ; [$8119]
    JSR Music_PlayForChannel                ; Play music on this channel.
    INC a:MScript_CurrentChannel            ; Move to the next channel.
    LDA a:MScript_CurrentChannel            ; Load that channel index.
    CMP #$04                                ; Is it < 4?
    BCC @_loop                              ; If so, loop.


    ;
    ; Check if all channels have finished.
    ;
    LDA a:Music_NumChannelsCompleted        ; Load the number of completed
                                            ; channels.
    CMP #$04                                ; Is it 4?
    BNE @_return                            ; If not, return.


    ;
    ; All channels have finished, so clear the current music.
    ;
    LDA #$00
    STA CurrentMusic                        ; Unset the current music.

  @_return:                                 ; [$8131]
    RTS

;============================================================================
; TODO: Document Music_PlayForChannel
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Audio_PlayMusic
;============================================================================
Music_PlayForChannel:                       ; [$8132]
    LDX a:MScript_CurrentChannel            ; Load the current channel index.
    BEQ @_isSquareWave                      ; If it's Square Wave 1, jump.
    DEX
    BEQ @_isSquareWave                      ; If it's Square Wave 2, jump.
    DEX
    BEQ @_isTriangleWave                    ; If it's Triangle Wave, jump.
    RTS                                     ; Else, return.


    ;
    ; This is the Triangle Wave channel.
    ;
  @_isTriangleWave:                         ; [$813e]
    LDX a:MScript_CurrentChannel            ; Load the current channel index.
    LDA a:Something_Music_Triangle_017e
    BEQ @_checkSoundEffectOnTri
    DEC a:Something_Music_Triangle_017e
    LDA #$c0

  @_checkSoundEffectOnTri:                  ; [$814b]
    STA a:MScript_CurValue


    ;
    ; Check if there's currently a sound effect playing
    ; on the Triangle Wave channel.
    ;
    LDA SoundEffects,X                      ; Load the current sound effect
                                            ; on the Triangle Wave channel.
    BNE @_clearTriangleWave                 ; If one is set, jump.
    LDA a:MScript_CurValue                  ; Load the value to play.
    STA a:TRI_LINEAR                        ; Set it on the channel.
    RTS                                     ; And return.

  @_clearTriangleWave:                      ; [$815a]
    LDA #$00
    STA a:TRI_LINEAR                        ; Clear the Triangle Wave
                                            ; channel.
    RTS                                     ; And return.


    ;
    ; This is a Square Wave channel.
    ;
  @_isSquareWave:                           ; [$8160]
    LDX a:MScript_CurrentChannel
    LDY Music_SQEffect_Mode,X
    BEQ @LAB_PRG5__816f
    DEY
    BEQ @LAB_PRG5__8192
    DEY
    BEQ @LAB_PRG5__81bc
    RTS


    ;
    ; XXX 0: Linear, trails off
    ;
  @LAB_PRG5__816f:                          ; [$816f]
    LDX a:MScript_CurrentChannel
    LDA Music_SQEffect_CurValue,X
    BEQ @LAB_PRG5__817d
    SEC
    SBC #$03
    STA Music_SQEffect_CurValue,X

  @LAB_PRG5__817d:                          ; [$817d]
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$0f
    STA a:MScript_CurValue
    LDA SoundEffects,X
    BNE @_return1
    JSR Music_UpdateSQVol
    JSR Music_UpdateSQLo

  @_return1:                                ; [$8191]
    RTS


    ;
    ; XXX 1: Curve but held
    ;
  @LAB_PRG5__8192:                          ; [$8192]
    LDX a:MScript_CurrentChannel
    LDA Music_SQEffect_CurValue,X
    AND #$0f
    STA Music_SQEffect_CurValue,X
    CMP #$0d
    BCC @LAB_PRG5__81a7
    DEC Music_SQEffect_CurValue,X
    DEC Music_SQEffect_CurValue,X

  @LAB_PRG5__81a7:                          ; [$81a7]
    INC Music_SQEffect_Counter,X
    LDA Music_SQEffect_CurValue,X
    STA a:MScript_CurValue
    LDA SoundEffects,X
    BNE @_return2
    JSR Music_UpdateSQVol
    JSR Music_UpdateSQLo

  @_return2:                                ; [$81bb]
    RTS


    ;
    ; XXX 2
    ;
  @LAB_PRG5__81bc:                          ; [$81bc]
    LDX a:MScript_CurrentChannel
    LDA Music_SQEffect_Counter,X
    LSR A
    LSR A
    TAY
    LDA @_return3+1,Y
    BEQ @LAB_PRG5__81cd
    INC Music_SQEffect_Counter,X

  @LAB_PRG5__81cd:                          ; [$81cd]
    STA a:MScript_CurValue
    LDA SoundEffects,X
    BNE @_return3
    JSR Music_UpdateSQVol
    JSR Music_UpdateSQLo

  @_return3:                                ; [$81db]
    RTS

;
; XREFS:
;     Music_PlayForChannel
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
; TODO: Document Music_UpdateSQVol
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Music_PlayForChannel
;============================================================================
Music_UpdateSQVol:                          ; [$81f1]
    LDX a:MScript_CurrentChannel
    TXA
    ASL A
    ASL A
    TAY
    LDA a:MScript_CurValue
    SEC
    SBC Music_SQ_Vol,X
    BCS @LAB_PRG5__8203
    LDA #$00

  @LAB_PRG5__8203:                          ; [$8203]
    LDX a:MScript_CurrentChannel
    ORA Something_Music_SQ_0172,X
    STA SQ1_VOL,Y
    RTS

;============================================================================
; TODO: Document Music_UpdateSQLo
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Music_PlayForChannel
;============================================================================
Music_UpdateSQLo:                           ; [$820d]
    LDX a:MScript_CurrentChannel
    LDA Music_SQEffect_Counter,X
    CMP #$12
    BCC @_return
    LSR A
    LSR A
    AND Music_Something_SQ_017f,X
    STA a:Something_Music_0178
    LDA SoundEffects,X
    BNE @_return
    LDA a:MScript_CurrentChannel
    ASL A
    ASL A
    TAY
    LDA Music_Current_SQ_Low,X
    CMP Music_Something_SQ_017f,X
    BCC @_return
    SEC
    SBC a:Something_Music_0178
    STA SQ1_LO,Y

  @_return:                                 ; [$8239]
    RTS

;============================================================================
; TODO: Document MScripts_InvokeNext
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Audio_PlayMusic
;     MScript_Op_0xEE
;     MScript_Op_0xEF
;     MScript_Op_0xF0
;     MScript_Op_0xF2
;     MScript_Op_0xF7
;     MScript_Op_BeginLoop
;     MScript_Op_ContinueIfNLoops
;     MScript_Op_EndLoop
;     MScript_Op_JumpSubroutine
;     MScript_Op_NoOp
;     MScript_Op_Restart
;     MScript_Op_RestoreAddr
;     MScript_Op_Return
;     MScript_Op_SaveAddr
;     MScript_Op_SetSQVol
;     MScript_Op_SetWaveHigh
;     MScripts_InvokeNext_Something_8298
;============================================================================
MScripts_InvokeNext:                        ; [$823a]
    LDX a:MScript_CurrentChannel            ; X = Channel index being
                                            ; processed
    CPX #$03                                ; Is this the noise channel?
    BNE @_loadNextValue                     ; If not, jump.
    LDA a:Music_Noise_Remaining             ; Is there noise to play?
    BEQ @_loadNextValue                     ; If not, process the next value
                                            ; in the script.
    JMP Music_PlayNoise                     ; Else, play the noise.

  @_loadNextValue:                          ; [$8249]
    JSR MScripts_GetNextValue               ; Get the next value from the
                                            ; MScript.
    STA a:MScript_CurValue                  ; Store it.
    TAY                                     ; Y = Value
    BMI @_handleScriptValue                 ; If the script value is >= 0x80,
                                            ; jump to handle it.
    JMP MScripts_PlayIfHasValue             ; Play if there's a value, or
                                            ; finish if 0.


    ;
    ; Check if this is an MScript op (>= 0xEE).
    ;
  @_handleScriptValue:                      ; [$8255]
    CMP #$ee                                ; Is this < 0xEE?
    BCC MScripts_InvokeNext_Something_828e  ; If so, jump.


    ;
    ; Determine the op handler to invoke.
    ;
    SEC
    LDA #$ff                                ; A = 0xFF
    SBC a:MScript_CurValue                  ; Subtract the opcode, giving an
                                            ; index into the lookup table.
    ASL A                                   ; Normalize to a word boundary
                                            ; for the lookup table.
    TAY                                     ; Y = A
    LDA MSCRIPT_OP_HANDLERS+1,Y             ; Load the address of the handler
                                            ; and push to the stack.
    PHA
    LDA MSCRIPT_OP_HANDLERS,Y
    PHA
    RTS


;============================================================================
; Lookup table of MScript operation handlers.
;
; XREFS:
;     MScripts_InvokeNext
;============================================================================

;
; XREFS:
;     MScripts_InvokeNext
;
MSCRIPT_OP_HANDLERS:                        ; [$826a]
    dw MScript_Op_End-1                     ; MScript_Op_End
                                            ; [$PRG5::826a]
    dw MScript_Op_RestoreAddr-1             ; MScript_Op_RestoreAddr
                                            ; [$PRG5::826c]
    dw MScript_Op_BeginLoop-1               ; MScript_Op_BeginLoop
                                            ; [$PRG5::826e]
    dw MScript_Op_EndLoop-1                 ; MScript_Op_EndLoop
                                            ; [$PRG5::8270]
    dw MScript_Op_ContinueIfNLoops-1        ; MScript_Op_ContinueIfNLoops
                                            ; [$PRG5::8272]
    dw MScript_Op_NoOp-1                    ; MScript_Op_NoOp
                                            ; [$PRG5::8274]
    dw MScript_Op_SaveAddr-1                ; MScript_Op_SaveAddr
                                            ; [$PRG5::8276]
    dw MScript_Op_JumpSubroutine-1          ; MScript_Op_JumpSubroutine
                                            ; [$PRG5::8278]
    dw MScript_Op_0xF7-1                    ; MScript_Op_0xF7
                                            ; [$PRG5::827a]
    dw MScript_Op_SetWaveHigh-1             ; MScript_Op_SetWaveHigh
                                            ; [$PRG5::827c]
    dw MScript_Op_Return-1                  ; MScript_Op_Return
                                            ; [$PRG5::827e]
    dw MScript_Op_Restart-1                 ; MScript_Op_Restart
                                            ; [$PRG5::8280]
    dw MScript_Op_0xF3-1                    ; MScript_Op_0xF3
                                            ; [$PRG5::8282]
    dw MScript_Op_0xF2-1                    ; MScript_Op_0xF2
                                            ; [$PRG5::8284]
    dw MScript_Op_SetSQVol-1                ; MScript_Op_SetSQVol
                                            ; [$PRG5::8286]
    dw MScript_Op_0xF0-1                    ; MScript_Op_0xF0
                                            ; [$PRG5::8288]
    dw MScript_Op_0xEF-1                    ; MScript_Op_0xEF
                                            ; [$PRG5::828a]
    dw MScript_Op_0xEE-1                    ; MScript_Op_0xEE
                                            ; [$PRG5::828c]

;============================================================================
; TODO: Document MScripts_InvokeNext_Something_828e
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_InvokeNext
;============================================================================
MScripts_InvokeNext_Something_828e:         ; [$828e]
    LDA a:MScript_CurValue                  ; Load the current script value.
    AND #$7f                                ; Discard bit 7.
    BPL MScripts_InvokeNext_Something_8298

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document MScript_Op_0xF3
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_0xF3:                            ; [$8295]
    JSR MScripts_GetNextValue               ; Get the next value in the
                                            ; script.

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document MScripts_InvokeNext_Something_8298
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_InvokeNext_Something_828e
;============================================================================
MScripts_InvokeNext_Something_8298:         ; [$8298]
    LDX a:MScript_CurrentChannel
    STA MScript_RepeatCounts,X
    STA a:MScript_CurValue
    LDX a:MScript_CurrentChannel
    CPX #$02
    BEQ MScripts_InvokeNext
    LDA a:MScript_CurValue
    PHA
    LSR A
    LSR A
    LSR A
    STA a:MScript_CurValue
    PLA
    SEC
    SBC a:MScript_CurValue
    CMP #$10
    BCS @LAB_PRG5__82cc
    ASL A
    ASL A
    ASL A
    ASL A
    ORA #$08
    STA Music_SQ_Note_Lengths,X
    CMP #$08
    BNE @LAB_PRG5__82dd
    LDA #$18
    BNE @LAB_PRG5__82da

  @LAB_PRG5__82cc:                          ; [$82cc]
    LDY #$00

  @LAB_PRG5__82ce:                          ; [$82ce]
    CMP $856f,Y
    BCS @LAB_PRG5__82d7
    INY
    INY
    BNE @LAB_PRG5__82ce

  @LAB_PRG5__82d7:                          ; [$82d7]
    LDA $8570,Y

  @LAB_PRG5__82da:                          ; [$82da]
    STA Music_SQ_Note_Lengths,X

  @LAB_PRG5__82dd:                          ; [$82dd]
    JMP MScripts_InvokeNext
    JMP MScripts_InvokeNext                 ; Unreachable?

;============================================================================
; TODO: Document MScripts_PlayIfHasValue
;
; INPUTS:
;     A
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_InvokeNext
;============================================================================
MScripts_PlayIfHasValue:                    ; [$82e3]
    CMP #$00
    BNE Music_PlayWaveOrNoise
    JMP Music_StoreRepeat

;============================================================================
; TODO: Document Music_PlayWaveOrNoise
;
; INPUTS:
;     A
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_PlayIfHasValue
;============================================================================
Music_PlayWaveOrNoise:                      ; [$82ea]
    LDX a:MScript_CurrentChannel
    CPX #$03
    BNE Music_PlayWave


    ;
    ; This is the Noise channel.
    ;
    PHA
    AND #$0f
    STA a:Music_Noise_Remaining
    PLA
    LSR A
    LSR A
    LSR A
    LSR A
    STA a:Music_Noise_Index

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document Music_PlayNoise
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_InvokeNext
;============================================================================
Music_PlayNoise:                            ; [$82ff]
    DEC a:Music_Noise_Remaining
    LDA a:SOUND_DAT_0126
    BEQ @LAB_PRG5__830a
    JMP Music_StoreRepeat

  @LAB_PRG5__830a:                          ; [$830a]
    LDA a:Music_Noise_Index
    BNE @LAB_PRG5__8312
    JMP Music_StoreRepeat

  @LAB_PRG5__8312:                          ; [$8312]
    ASL A
    ASL A
    TAX
    LDY #$00

  @LAB_PRG5__8317:                          ; [$8317]
    LDA MUSIC_NOISE_VALUES,X
    STA NOISE_VOL,Y
    INX
    INY
    CPY #$04
    BCC @LAB_PRG5__8317
    JMP Music_StoreRepeat

;============================================================================
; TODO: Document Music_PlayWave
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Music_PlayWaveOrNoise
;============================================================================
Music_PlayWave:                             ; [$8326]
    LDX a:MScript_CurrentChannel
    LDA SoundEffects,X
    BEQ @_setNote
    JMP Music_StoreRepeat

  @_setNote:                                ; [$8331]
    LDX a:MScript_CurrentChannel
    BEQ @_setSquareWave1
    DEX
    BEQ @_setSquareWave2Sweep


    ;
    ; This is the Triangle Wave channel.
    ;
    LDA #$c0
    STA a:TRI_LINEAR
    JSR Music_SetNote
    LDA a:Music_Note_Period_Low
    STA a:TRI_LO
    LDX a:MScript_CurrentChannel
    LDA a:Music_Note_Period_High            ; Load the note period to play.
    ORA #$f8                                ; Set the full play length.
    STA a:TRI_HI                            ; And set as the Triangle High.
    JMP Music_PlayTriangleWave


    ;
    ; This is the Square Wave 1 channel.
    ;
  @_setSquareWave1:                         ; [$8355]
    JSR Music_SetNote
    LDA #$00
    STA a:SQ1_SWEEP
    LDA a:Music_Note_Period_Low
    STA a:SQ1_LO
    STA a:Music_Current_SQ_Low
    LDA a:Music_Note_Period_High
    ORA a:Music_SQ_Note_Lengths
    STA a:SQ1_HI
    LDA #$00
    STA a:Music_SQEffect_Counter
    BEQ @_finish


    ;
    ; This is the Square Wave 2 channel.
    ;
  @_setSquareWave2Sweep:                    ; [$8376]
    JSR Music_SetNote
    LDA #$00
    STA a:SQ2_SWEEP
    LDY a:MScript_CurValue
    LDA a:Music_Note_Period_Low
    CMP a:Music_SQ2_Length_Reduction
    BCC @_setSQ2HiLo
    SEC
    SBC a:Music_SQ2_Length_Reduction

  @_setSQ2HiLo:                             ; [$838d]
    STA a:SQ2_LO
    STA a:Music_SQ2_Low
    LDA a:Music_Note_Period_High
    ORA a:Music_Note_Length_High
    STA a:SQ2_HI
    LDA #$00
    STA a:Something_Music_017a

  @_finish:                                 ; [$83a1]
    LDX a:MScript_CurrentChannel
    LDA #$ff
    STA Music_SQEffect_CurValue,X
    JSR Music_StoreRepeat
    RTS

;============================================================================
; TODO: Document Music_StoreRepeat
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_PlayIfHasValue
;     Music_PlayNoise
;     Music_PlayTriangleWave
;     Music_PlayWave
;============================================================================
Music_StoreRepeat:                          ; [$83ad]
    LDX a:MScript_CurrentChannel
    LDA MScript_RepeatCounts,X
    STA Music_Repeats,X
    RTS

;============================================================================
; TODO: Document Music_PlayTriangleWave
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Music_PlayWave
;============================================================================
Music_PlayTriangleWave:                     ; [$83b7]
    JSR Music_StoreRepeat
    STA a:MScript_CurValue
    LSR A
    LSR A
    STA a:Something_Music_0178
    LDA a:MScript_CurValue
    SEC
    SBC a:Something_Music_0178
    STA a:Something_Music_Triangle_017e
    RTS

;============================================================================
; TODO: Document Music_SetNote
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Music_PlayWave
;============================================================================
Music_SetNote:                              ; [$83cd]
    LDX a:MScript_CurrentChannel
    LDA a:MScript_CurValue
    CLC
    ADC $856c,X
    CLC
    ADC Music_Wave_Length_Highs,X
    CLC
    ADC a:MScript_Maybe_8BitCounter
    STY a:Maybe_Unused_Music_016f


    ;
    ; Loop, subtracting 12 (number of notes in our lookup
    ; table) each iteration, until < 0.
    ;
    ; The number of loop iterations will be used later to
    ; normalize the resulting note for the right octave.
    ;
    LDY #$01
    SEC

  @_loop1:                                  ; [$83e5]
    SBC #$0c
    INY
    BCS @_loop1


    ;
    ; TODO: Out of the loop.
    ;
    DEY
    ADC #$0d
    ASL A
    TAX
    LDA AUDIO_NOTES,X
    STA a:Music_Note_Period_Low
    LDA AUDIO_NOTES+1,X
    STA a:Music_Note_Period_High


    ;
    ; Convert to the note in the right octave based on
    ; the starting value.
    ;
  @_octaveLoop:                             ; [$83fb]
    DEY
    BEQ @_return
    LSR a:Music_Note_Period_High
    ROR a:Music_Note_Period_Low
    JMP @_octaveLoop

  @_return:                                 ; [$8407]
    RTS

;============================================================================
; TODO: Document MScript_Op_End
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MSCRIPT_OP_HANDLERS [$PRG5::826a]
;============================================================================
MScript_Op_End:                             ; [$8408]
    LDX a:MScript_CurrentChannel


    ;
    ; Repeat this every time it's called.
    ;
    ; This ensures that this channel stays on this
    ; instruction until every channel has completed.
    ;
    LDA #$01
    STA Music_Repeats,X
    TXA
    ASL A
    TAX


    ;
    ; Decrement the offset into the script to keep it on this
    ; 0xFF until all channels complete.
    ;
    LDA Music_CurrentScriptAddrs,X
    BNE @LAB_PRG5__8419
    DEC Music_CurrentScriptAddrs+1,X

  @LAB_PRG5__8419:                          ; [$8419]
    DEC Music_CurrentScriptAddrs,X


    ;
    ; Mark this channel as completed.
    ;
    INC a:Music_NumChannelsCompleted
    RTS

;============================================================================
; TODO: Document MScript_Op_BeginLoop
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_BeginLoop:                       ; [$841f]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA MScript_LoopLength,X
    LDA #$01
    STA MScript_LoopCounter,X
    TXA
    ASL A
    TAX
    LDA Music_CurrentScriptAddrs,X
    STA MScript_LoopStartAddrs,X
    LDA Music_CurrentScriptAddrs+1,X
    STA MScript_LoopStartAddrs+1,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_ContinueIfNLoops
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_ContinueIfNLoops:                ; [$843d]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    CMP MScript_LoopCounter,X
    BCS @_invokeNext
    TXA
    ASL A
    TAX
    LDA MScript_LoopEndAddrs,X
    STA Music_CurrentScriptAddrs,X
    LDA MScript_LoopEndAddrs+1,X
    STA Music_CurrentScriptAddrs+1,X

  @_invokeNext:                             ; [$8455]
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_EndLoop
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_EndLoop:                         ; [$8458]
    LDX a:MScript_CurrentChannel
    LDA MScript_LoopCounter,X
    CMP MScript_LoopLength,X
    BCS @_invokeNext
    INC MScript_LoopCounter,X
    TXA
    ASL A
    TAX


    ;
    ; ..
    ;
    LDA Music_CurrentScriptAddrs,X
    STA MScript_LoopEndAddrs,X
    LDA Music_CurrentScriptAddrs+1,X
    STA MScript_LoopEndAddrs+1,X


    ;
    ; ..
    ;
    LDA MScript_LoopStartAddrs,X
    STA Music_CurrentScriptAddrs,X
    LDA MScript_LoopStartAddrs+1,X
    STA Music_CurrentScriptAddrs+1,X

  @_invokeNext:                             ; [$847d]
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_NoOp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_NoOp:                            ; [$8480]
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_0xF2
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_0xF2:                            ; [$8483]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Something_Music_SQ_0172,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_SaveAddr
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SaveAddr:                        ; [$848f]
    JSR MScript_Op_SaveAddr_Inner
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_SaveAddr_Inner
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScript_Op_SaveAddr
;============================================================================
MScript_Op_SaveAddr_Inner:                  ; [$8495]
    LDA a:MScript_CurrentChannel
    ASL A
    TAX
    LDA Music_CurrentScriptAddrs,X
    STA MScript_SavedAddr,X
    LDA Music_CurrentScriptAddrs+1,X
    STA MScript_SavedAddr+1,X
    RTS

;============================================================================
; TODO: Document MScript_Op_RestoreAddr
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_RestoreAddr:                     ; [$84a5]
    LDA a:MScript_CurrentChannel
    ASL A
    TAX
    LDA MScript_SavedAddr,X
    STA Music_CurrentScriptAddrs,X
    LDA MScript_SavedAddr+1,X
    STA Music_CurrentScriptAddrs+1,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_Restart
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_Restart:                         ; [$84b7]
    LDA CurrentMusic
    ASL A
    ASL A
    SEC
    SBC #$04
    ASL A
    TAY
    LDX #$00

  @_loop:                                   ; [$84c2]
    LDA MUSIC_LOOKUP_START_THEME,Y
    STA Music_CurrentScriptAddrs,X
    INY
    INX
    CPX #$08
    BNE @_loop
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_JumpSubroutine
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_JumpSubroutine:                  ; [$84d0]
    JSR MScripts_GetNextValue
    PHA
    JSR MScripts_GetNextValue
    PHA
    LDA a:MScript_CurrentChannel
    ASL A
    TAX
    LDA Music_CurrentScriptAddrs,X
    STA MScript_PushedAddrs,X
    LDA Music_CurrentScriptAddrs+1,X
    STA MScript_PushedAddrs+1,X
    PLA
    STA Music_CurrentScriptAddrs+1,X
    PLA
    STA Music_CurrentScriptAddrs,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_Return
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_Return:                          ; [$84f0]
    LDA a:MScript_CurrentChannel            ; Load the current channel.
    ASL A                                   ; Shift to a word boundary.
    TAX                                     ; X = Result.
    LDA MScript_PushedAddrs,X               ; Load the lower byte of the
                                            ; pushed address.
    STA Music_CurrentScriptAddrs,X          ; Set for the script address.
    LDA MScript_PushedAddrs+1,X             ; Load the upper byte.
    STA Music_CurrentScriptAddrs+1,X        ; And set that.
    JMP MScripts_InvokeNext                 ; Invoke the script there.

;============================================================================
; TODO: Document MScript_Op_SetWaveHigh
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SetWaveHigh:                     ; [$8502]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_Wave_Length_Highs,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_0xF7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_0xF7:                            ; [$850e]
    JSR MScripts_GetNextValue
    STA a:MScript_Maybe_8BitCounter
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_SetSQVol
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SetSQVol:                        ; [$8517]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_SQ_Vol,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_0xF0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_0xF0:                            ; [$8523]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_SQEffect_Mode,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_0xEF
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_0xEF:                            ; [$852f]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_Something_SQ_017f,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_0xEE
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_0xEE:                            ; [$853b]
    JSR MScripts_GetNextValue
    STA a:Music_SQ2_Length_Reduction
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScripts_GetNextValue
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     MScript_Op_0xEE
;     MScript_Op_0xEF
;     MScript_Op_0xF0
;     MScript_Op_0xF2
;     MScript_Op_0xF3
;     MScript_Op_0xF7
;     MScript_Op_BeginLoop
;     MScript_Op_ContinueIfNLoops
;     MScript_Op_JumpSubroutine
;     MScript_Op_SetSQVol
;     MScript_Op_SetWaveHigh
;     MScripts_InvokeNext
;============================================================================
MScripts_GetNextValue:                      ; [$8544]
    LDA a:MScript_CurrentChannel
    ASL A
    TAX
    LDA (Music_CurrentScriptAddrs,X)
    INC Music_CurrentScriptAddrs,X
    BNE @_return
    INC Music_CurrentScriptAddrs+1,X

  @_return:                                 ; [$8551]
    RTS


;============================================================================
; Base note lookup table for C2 through B2.
;
; XREFS:
;     Music_SetNote
;     SoundEffect_SetNote
;============================================================================

;
; XREFS:
;     Music_SetNote
;     SoundEffect_SetNote
;
AUDIO_NOTES:                                ; [$8552]
    dw $0000                                ; [0]:
    dw $06ae                                ; [1]: C2
    dw $064e                                ; [2]: C2#2
    dw $05f3                                ; [3]: D2
    dw $059f                                ; [4]: D2#2
    dw $054d                                ; [5]: E2
    dw $0501                                ; [6]: F2
    dw $04b9                                ; [7]: F2#2
    dw $0475                                ; [8]: G2
    dw $0435                                ; [9]: G2#2
    dw $03f8                                ; [10]: A2
    dw $03bf                                ; [11]: A2#2
    dw $0389                                ; [12]: B2

;
; XREFS:
;     Music_SetNote
;
BYTE_ARRAY_PRG5__856c:                      ; [$856c]
    db $f4                                  ; [0]:
    db $f4                                  ; [1]:
    db $0c                                  ; [2]:

;
; XREFS:
;     MScripts_InvokeNext_Something_8298
;
BYTE_ARRAY_PRG5__856c_3_:                   ; [$856f]
    db $7f                                  ; [3]:

;
; XREFS:
;     MScripts_InvokeNext_Something_8298
;
BYTE_PRG5__8570:                            ; [$8570]
    db $08                                  ; [$8570] byte

;
; XREFS:
;     MScripts_InvokeNext_Something_8298
;
BYTE_PRG5__8571:                            ; [$8571]
    db $60                                  ; [$8571] byte

;
; XREFS:
;     MScripts_InvokeNext_Something_8298
;
BYTE_PRG5__8572:                            ; [$8572]
    db $c0,$50,$40,$30,$b0,$28,$30,$24,$d0,$1e,$50,$18,$a0 ; [$8572] byte

;
; XREFS:
;     Music_PlayNoise
;
MUSIC_NOISE_VALUES:                         ; [$857f]
    db $14                                  ; [0]:
    db $20                                  ; [1]:
    db $00                                  ; [2]:
    db $f0                                  ; [3]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $0f                                  ; [2]:
    db $20                                  ; [3]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $0a                                  ; [2]:
    db $10                                  ; [3]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $05                                  ; [2]:
    db $00                                  ; [3]:
    db $ff                                  ; [$858f] byte


;============================================================================
; Table of sound effects to handler table indexes.
;
; XREFS:
;     Sound_HandleOnInterrupt
;============================================================================

;
; XREFS:
;     Sound_HandleOnInterrupt
;
SOUND_EFFECT_HANDLER_INDEXES:               ; [$8590]
    db $00                                  ; [0]:
    db $2c                                  ; [1]: Message
    db $60                                  ; [2]: Hit Enemy
    db $5c                                  ; [3]: Enemy died
    db $64                                  ; [4]: Player hit
    db $70                                  ; [5]: Magic
    db $38                                  ; [6]: Open door
    db $40                                  ; [7]: Typing
    db $4c                                  ; [8]: Item picked up
    db $50                                  ; [9]: Coin touched
    db $68                                  ; [10]: Magic hit by obstacle
    db $30                                  ; [11]: Cursor moved
    db $58                                  ; [12]: Shield hit by magic
    db $34                                  ; [13]: Character inputted
    db $28                                  ; [14]: Password character
                                            ; entered
    db $3c                                  ; [15]: Pushing block
    db $54                                  ; [16]: Coin dropped
    db $48                                  ; [17]:
    db $44                                  ; [18]: Pakukame
    db $24                                  ; [19]: Fill HP or MP
    db $6c                                  ; [20]: Tilte magic spell
    db $1c                                  ; [21]: Step sound
    db $10                                  ; [22]: Player died
    db $14                                  ; [23]: Ladder dropped
    db $18                                  ; [24]:
    db $20                                  ; [25]: Changed gold amount
    db $0c                                  ; [26]: Use special item 2
    db $08                                  ; [27]: Bread touched
    db $04                                  ; [28]:

;
; XREFS:
;     Sound_HandleOnInterrupt
;
SOUND_EFFECT_HANDLERS:                      ; [$85ad]
    dw Sound_Init-1                         ; Sound_Init
                                            ; [$PRG5::85ad]
    dw $867f                                ; _return
                                            ; [$PRG5::85af]
    dw SoundEffect_Handler_CoinTouched-1    ; 0x04
    dw FUN_PRG5__8ece-1                     ; FUN_PRG5__8ece
                                            ; [$PRG5::85b3]
    dw SoundEffect_Handler_BreadTouched-1   ; 0x08
    dw $8e87                                ; [$85b7] ushort
    dw SoundEffect_Handler_Maybe_UseSpecialItem2-1 ; 0x0C
    dw $8dea                                ; [$85bb] ushort
    dw SoundEffect_Handler_PlayerDied-1     ; 0x10
    dw $8cb3                                ; [$85bf] ushort
    dw SoundEffect_Handler_LadderDropped-1  ; 0x14
    dw $8d35                                ; [$85c3] ushort
    dw SoundEffect_Handler_ShowPlayerMenu-1 ; 0x18
    dw $8d70                                ; [$85c7] ushort
    dw SoundEffect_Handler_Maybe_Step-1     ; 0x1C
    dw $8c72                                ; [$85cb] ushort
    dw SoundEffect_Handler_GoldAmountChanged-1 ; 0x20
    dw $8620                                ; [$85cf] ushort
    dw SoundEffect_Handler_FillHPOrMP-1     ; 0x24
    dw $8bc4                                ; [$85d3] ushort
    dw SoundEffect_Handler_PasswordCharInput-1 ; 0x28
    dw $8620                                ; [$85d7] ushort
    dw SoundEffect_Handler_Message-1        ; 0x2C
    dw $86a7                                ; [$85db] ushort
    dw SoundEffect_Handler_CursorMoved-1    ; 0x30
    dw $89b1                                ; [$85df] ushort
    dw SoundEffect_Handler_CharacterInput-1 ; 0x34
    dw $8a46                                ; [$85e3] ushort
    dw SoundEffect_Handler_OpenDoor-1       ; 0x38
    dw $881e                                ; [$85e7] ushort
    dw SoundEffect_Handler_PushBlock-1      ; 0x3C
    dw $8aa6                                ; [$85eb] ushort
    dw SoundEffect_Handler_Maybe_Typing-1   ; 0x40
    dw $8876                                ; [$85ef] ushort
    dw SoundEffect_Handler_Pakukame-1       ; 0x44
    dw $8b6e                                ; [$85f3] ushort
    dw SoundEffect_Handler_0x48-1           ; 0x48
    dw $8b1e                                ; [$85f7] ushort
    dw SoundEffect_Handler_ItemPickedUp-1   ; 0x4C
    dw $88d1                                ; [$85fb] ushort
    dw SoundEffect_Handler_CoinTouchedCommon-1 ; 0x50
    dw $892d                                ; [$85ff] ushort
    dw SoundEffect_Handler_CoinDropped-1    ; 0x54
    dw $8ad9                                ; [$8603] ushort
    dw SoundEffect_Handler_ShieldHitByMagic-1 ; 0x58
    dw $8a0e                                ; [$8607] ushort
    dw SoundEffect_Handler_EnemyDied-1      ; 0x5C
    dw $8742                                ; [$860b] ushort
    dw SoundEffect_Handler_HitEnemy-1       ; 0x60
    dw $86df                                ; [$860f] ushort
    dw SoundEffect_Handler_HitPlayer-1      ; 0x64
    dw $877a                                ; [$8613] ushort
    dw SoundEffect_Handler_MagicHitObstacle-1 ; 0x68
    dw $8981                                ; [$8617] ushort
    dw SoundEffect_Handler_Tilte-1          ; 0x6C
    dw $8c1d                                ; [$861b] ushort
    dw SoundEffect_Handler_Magic-1          ; 0x70
    dw $87c1                                ; [$861f] ushort

    db $ce,$27,$01,$d0,$08                  ; [$8622] undefined

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
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_BreadTouched
;     SoundEffect_Handler_CharacterInput
;     SoundEffect_Handler_CoinDropped
;     SoundEffect_Handler_CoinTouchedCommon
;     SoundEffect_Handler_CursorMoved
;     SoundEffect_Handler_EnemyDied
;     SoundEffect_Handler_FillHPOrMP
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_HitPlayer
;     SoundEffect_Handler_ItemPickedUp
;     SoundEffect_Handler_LadderDropped
;     SoundEffect_Handler_Magic
;     SoundEffect_Handler_MagicHitObstacle
;     SoundEffect_Handler_Maybe_Step
;     SoundEffect_Handler_Maybe_Typing
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_Message
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_Pakukame
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_PushBlock
;     SoundEffect_Handler_ShieldHitByMagic
;     SoundEffect_Handler_ShowPlayerMenu
;     SoundEffect_Handler_Tilte
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
    LDA SoundEffects,X
    BEQ @LAB_PRG5__8639
    DEC SoundEffects,X

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
    LDA SOUND_EFFECT_HANDLER_INDEXES,X
    CMP a:SOUND_DAT_0122
    BCC @LAB_PRG5__8658
    BNE @LAB_PRG5__866f

  @LAB_PRG5__8658:                          ; [$8658]
    LDA SOUND_EFFECT_HANDLER_INDEXES,X
    STA a:SOUND_DAT_0122
    TAX
    LDA #$00
    STA a:SoundEffects
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
    LDA SOUND_EFFECT_HANDLERS+1,X
    PHA
    LDA SOUND_EFFECT_HANDLERS,X
    PHA

  @_return:                                 ; [$8680]
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
;     SOUND_EFFECT_HANDLERS [$PRG5::85ad]
;     thunk_Sound_Init
;============================================================================
Sound_Init:                                 ; [$8681]
    LDA #$00
    STA a:DMC_RAW
    STA a:SoundEffects
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0125
    STA a:SOUND_DAT_0126
    STA a:CurrentSoundIndex
    JSR Audio_Reset
    LDA #$0f
    STA a:SND_CHN
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_Message
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_Message:                ; [$869e]
    LDA #$06
    STA a:SOUND_DAT_0126
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDA #$1f
    STA a:NOISE_VOL
    LDA a:SoundEffect_MaybeIndex
    AND #$02
    TAX
    LDA @_return+1,X
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    CMP #$04
    BCC @_return
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$86d0]
    RTS

;
; XREFS:
;     SoundEffect_Handler_Message
;
BYTE_PRG5__86d1:                            ; [$86d1]
    db $10,$01                              ; [$86d1] byte

;============================================================================
; TODO: Document SoundEffect_Handler_HitEnemy
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_HitEnemy:               ; [$86d3]
    LDA #$14
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0126
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDX a:SoundEffect_MaybeIndex
    LDA $8724,X
    CMP #$ff
    BNE @LAB_PRG5__86f5
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__86f5:                          ; [$86f5]
    JSR SoundEffect_SetNote
    LDA #$5f
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    LDA a:SoundEffect_MaybeIndex
    EOR #$0f
    ORA #$98
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    AND #$07
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_HitEnemy
;
DAT_PRG5__8724:                             ; [$8724]
    db $62                                  ; [$8724] undefined1

    hex 4e 3c 50 48 65 51 48 56 52 5f 58 65 4d 55 ff ; [$8726] undefined

;============================================================================
; TODO: Document SoundEffect_Handler_EnemyDied
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_EnemyDied:              ; [$8734]
    LDA #$16
    STA a:SOUND_DAT_0126
    LDA #$14
    STA a:SoundEffect_MaybeIndex
    LDA #$00
    STA a:SoundEffect_State_0128
    DEC a:SoundEffect_MaybeIndex
    BNE @LAB_PRG5__8750
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8750:                          ; [$8750]
    LDX a:SoundEffect_State_0128
    LDA #$1f
    STA a:NOISE_VOL
    LDA $8767,X
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_State_0128
    RTS

;
; XREFS:
;     SoundEffect_Handler_EnemyDied
;
DAT_PRG5__8767:                             ; [$8767]
    db $0f                                  ; [$8767] undefined1

    hex 0c 0e 0b 0d 09 03 02 01 00          ; [$8769] undefined

;============================================================================
; TODO: Document SoundEffect_Handler_HitPlayer
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_HitPlayer:              ; [$8771]
    LDA #$0f
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDX a:SoundEffect_MaybeIndex
    LDA SOUNDEFFECT_HITPLAYER_NOTES,X
    CMP #$ff
    BNE @LAB_PRG5__878d
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__878d:                          ; [$878d]
    JSR SoundEffect_SetNote
    LDA #$df
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_HitPlayer
;
SOUNDEFFECT_HITPLAYER_NOTES:                ; [$87aa]
    db $29,$24,$28,$22,$1f,$29,$2b,$2c,$2d,$2a,$ff ; [$87aa] byte

;============================================================================
; TODO: Document SoundEffect_Handler_Magic
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_Magic:                  ; [$87b5]
    LDA #$32
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    STA a:SoundEffect_State_0128
    LDX a:SoundEffect_State_0128
    LDA @_return+1,X
    BNE @LAB_PRG5__87d2
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__87d2:                          ; [$87d2]
    ORA #$50
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    AND #$03
    TAX
    LDA $8806,X
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    INC a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    CMP #$08
    BNE @_return
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    INC a:SoundEffect_State_0128

  @_return:                                 ; [$87ff]
    RTS

;
; XREFS:
;     SoundEffect_Handler_Magic
;
BYTE_PRG5__8800:                            ; [$8800]
    db $0f,$0b,$07,$04,$01,$00              ; [$8800] byte

;
; XREFS:
;     SoundEffect_Handler_Magic
;
BYTE_PRG5__8806:                            ; [$8806]
    db $b0,$a0,$a8,$98                      ; [$8806] byte

;============================================================================
; TODO: Document SoundEffect_Handler_OpenDoor
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_OpenDoor:               ; [$880a]
    LDA #$3c
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0126
    LDA #$37
    STA a:SoundEffect_State_0129
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    STA a:SoundEffect_State_0128
    DEC a:SoundEffect_State_0129
    BNE @LAB_PRG5__882f
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__882f:                          ; [$882f]
    LDA a:SoundEffect_MaybeIndex
    LSR A
    LSR A
    EOR #$ff
    AND #$0f
    ORA #$50
    STA a:NOISE_VOL
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    AND #$07
    TAY
    LDA #$60
    SEC
    SBC $8865,Y
    STA a:SQ2_LO
    AND #$0f
    STA a:NOISE_LO
    LDA #$00
    STA a:SQ2_HI
    STA a:NOISE_HI
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_OpenDoor
;
BYTE_PRG5__8865:                            ; [$8865]
    db $00,$03,$0a,$15,$25,$15,$0a,$03      ; [$8865] byte

;============================================================================
; TODO: Document SoundEffect_Handler_Maybe_Typing
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_Maybe_Typing:           ; [$886d]
    LDA #$28
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDA a:SOUND_DAT_0124
    AND #$01
    BNE @_return
    LDX a:SoundEffect_MaybeIndex
    LDA SOUNDEFFECT_MAYBE_TYPING_NOTES,X
    CMP #$ff
    BNE @LAB_PRG5__8890
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8890:                          ; [$8890]
    JSR SoundEffect_SetNote
    INC a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    EOR #$ff
    AND #$0f
    ORA #$d4
    STA a:SQ2_VOL
    LDA #$91
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI

  @_return:                                 ; [$88b3]
    RTS

;
; XREFS:
;     SoundEffect_Handler_Maybe_Typing
;
SOUNDEFFECT_MAYBE_TYPING_NOTES:             ; [$88b4]
    db $2b,$2d,$2f,$24,$38,$2a,$37,$39,$3b,$24,$38,$42,$2b,$2d,$2f,$18 ; [$88b4]
                                                                       ; byte
    db $ff                                  ; [$88c4] byte

;============================================================================
; TODO: Document SoundEffect_Handler_ItemPickedUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_ItemPickedUp:           ; [$88c5]
    LDA #$3c
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    STA a:SoundEffect_State_0128
    LDX a:SoundEffect_MaybeIndex
    LDA SOUNDEFFECT_ITEMPICKEDUP_NOTES,X
    CMP #$ff
    BNE @LAB_PRG5__88e5
    INC a:SoundEffect_State_0128
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    RTS

  @LAB_PRG5__88e5:                          ; [$88e5]
    JSR SoundEffect_SetNote
    LDX a:SoundEffect_State_0128
    LDA SOUNDEFFECT_ITEMPICKEDUP_SQ2_VOLS,X
    BNE @LAB_PRG5__88f8
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__88f8:                          ; [$88f8]
    ORA #$90
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_ItemPickedUp
;
SOUNDEFFECT_ITEMPICKEDUP_SQ2_VOLS:          ; [$8912]
    db $0f,$0c,$09,$05,$02,$00              ; [$8912] byte

;
; XREFS:
;     SoundEffect_Handler_ItemPickedUp
;
SOUNDEFFECT_ITEMPICKEDUP_NOTES:             ; [$8918]
    db $3f,$43,$4a,$55,$5b,$60,$ff          ; [$8918] byte

;============================================================================
; TODO: Document SoundEffect_Handler_CoinTouchedCommon
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SoundEffect_Handler_CoinTouched
;============================================================================
SoundEffect_Handler_CoinTouchedCommon:      ; [$891f]
    LDA #$1e
    STA a:SOUND_DAT_0124
    LDA #$50
    STA a:SoundEffect_MaybeIndex
    LDA #$00
    STA a:SoundEffect_State_0128

    ;
    ; XREFS:
    ;     FUN_PRG5__8ece
    ;
SoundEffect_Handler_CoinTouchedCommon__Loop: ; [$892e]
    LDX a:SoundEffect_State_0128
    LDA SOUNDEFFECT_COIN_TOUCHED_SQ2_VOL_SEQUENCE,X
    BNE @LAB_PRG5__893e
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__893e:                          ; [$893e]
    ORA #$d0
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    STA a:SQ2_LO
    CLC
    ADC #$04
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    LDA a:SoundEffect_MaybeIndex
    SEC
    SBC #$10
    STA a:SoundEffect_MaybeIndex
    BNE @_return
    INC a:SoundEffect_State_0128
    LDA #$50
    STA a:SoundEffect_MaybeIndex

  @_return:                                 ; [$896c]
    RTS

;
; XREFS:
;     SoundEffect_Handler_CoinTouchedCommon
;
SOUNDEFFECT_COIN_TOUCHED_SQ2_VOL_SEQUENCE:  ; [$896d]
    db $0f,$0c,$09,$06,$03,$00              ; [$896d] byte

;============================================================================
; TODO: Document SoundEffect_Handler_MagicHitObstacle
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_MagicHitObstacle:       ; [$8973]
    LDA #$1e
    STA a:SOUND_DAT_0126
    LDA #$20
    STA a:SoundEffect_MaybeIndex
    LDA #$00
    STA a:SoundEffect_State_0128
    DEC a:SoundEffect_MaybeIndex
    BNE @LAB_PRG5__898f
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__898f:                          ; [$898f]
    LDA a:SoundEffect_MaybeIndex
    LSR A
    AND #$0f
    ORA #$10
    STA a:NOISE_VOL
    LDA a:SoundEffect_MaybeIndex
    AND #$0f
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_CursorMoved
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_CursorMoved:            ; [$89a8]
    LDA #$16
    STA a:SOUND_DAT_0124
    LDA #$0f
    STA a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    BNE @LAB_PRG5__89bf
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__89bf:                          ; [$89bf]
    LDA a:SoundEffect_MaybeIndex
    AND #$0f
    ORA #$50
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    AND #$07
    TAY
    LDA a:SoundEffect_MaybeIndex
    AND #$02
    STA a:SoundEffect_State_0128
    LDA a:SoundEffect_MaybeIndex
    AND #$01
    CLC
    ADC a:SoundEffect_State_0128
    TAX
    LDA SOUNDEFFECT_CURSORMOVED_SQ2_LO,X
    SEC
    SBC SOUNDEFFECT_CURSORMOVED_SQ2_LO_DELTA,Y
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    DEC a:SoundEffect_MaybeIndex
    RTS

SOUNDEFFECT_CURSORMOVED_SQ2_LO:             ; [$89f9]
    db $51,$34,$b8                          ; [$89f9] byte

;
; XREFS:
;     SoundEffect_Handler_CursorMoved
;
BYTE_PRG5__89fc:                            ; [$89fc]
    db $93                                  ; [$89fc] byte

SOUNDEFFECT_CURSORMOVED_SQ2_LO_DELTA:       ; [$89fd]
    db $00,$01,$03,$06,$0a,$06,$03          ; [$89fd] byte

;
; XREFS:
;     SoundEffect_Handler_CursorMoved
;
BYTE_PRG5__8a04:                            ; [$8a04]
    db $01                                  ; [$8a04] byte

;============================================================================
; TODO: Document SoundEffect_Handler_ShieldHitByMagic
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_ShieldHitByMagic:       ; [$8a05]
    LDA #$14
    STA a:SOUND_DAT_0124
    LDA #$10
    STA a:SoundEffect_MaybeIndex
    DEC a:SoundEffect_MaybeIndex
    BNE @LAB_PRG5__8a1c
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8a1c:                          ; [$8a1c]
    LDA a:SoundEffect_MaybeIndex
    ORA #$90
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    AND #$01
    TAX
    LDA SOUNDEFFECT_SHIELD_HIT_BY_MAGIC_SQ2_LO_SEQUENCE,X
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    RTS

SOUNDEFFECT_SHIELD_HIT_BY_MAGIC_SQ2_LO_SEQUENCE: ; [$8a3b]
    db $30                                  ; [0]:

;
; XREFS:
;     SoundEffect_Handler_ShieldHitByMagic
;
SOUNDEFFECT_SHIELD_HIT_BY_MAGIC_SQ2_LO_SEQUENCE_1_: ; [$8a3c]
    db $1a                                  ; [1]:

;============================================================================
; TODO: Document SoundEffect_Handler_CharacterInput
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_CharacterInput:         ; [$8a3d]
    LDA #$1e
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    INC a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    LSR A
    LSR A
    TAX
    LDA SOUNDEFFECT_CHARINPUT_NOTES,X
    CMP #$ff
    BNE @LAB_PRG5__8a5f
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8a5f:                          ; [$8a5f]
    JSR SoundEffect_SetNote
    LDA #$bf
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    RTS

;
; XREFS:
;     SoundEffect_Handler_CharacterInput
;
SOUNDEFFECT_CHARINPUT_NOTES:                ; [$8a79]
    db $37                                  ; [0]:
    db $39                                  ; [1]:
    db $32                                  ; [2]:
    db $34                                  ; [3]:
    db $ff                                  ; [4]:

;============================================================================
; TODO: Document SoundEffect_Handler_PasswordCharInput
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_PasswordCharInput:      ; [$8a7e]
    LDA #$0a
    STA a:SOUND_DAT_0124
    LDA #$02
    STA a:SoundEffect_MaybeIndex
    LDA #$81
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA #$8e
    STA a:SQ2_LO
    LDA #$10
    STA a:SQ2_HI
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_PushBlock
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Handler_PushBlock:              ; [$8a9d]
    LDA #$20
    STA a:SOUND_DAT_0126
    LDA #$1e
    STA a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    BNE @LAB_PRG5__8ab4
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8ab4:                          ; [$8ab4]
    LDA #$1f
    STA a:NOISE_VOL
    LDA a:SoundEffect_MaybeIndex
    AND #$01
    TAX
    LDA SOUNDEFFECT_PUSH_BLOCK_NOISE_LO_SEQUENCE,X
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    DEC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_PushBlock
;
SOUNDEFFECT_PUSH_BLOCK_NOISE_LO_SEQUENCE:   ; [$8ace]
    db $0f,$0b                              ; [$8ace] byte

;============================================================================
; TODO: Document SoundEffect_Handler_CoinDropped
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_CoinDropped:            ; [$8ad0]
    LDA #$32
    STA a:SOUND_DAT_0124
    LDA #$08
    STA a:SoundEffect_MaybeIndex
    LDA #$86
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    CMP #$05
    BNE @LAB_PRG5__8af5
    LDA #$35
    STA a:SQ2_LO
    LDA #$20
    STA a:SQ2_HI

  @LAB_PRG5__8af5:                          ; [$8af5]
    DEC a:SoundEffect_MaybeIndex
    BNE @_return
    LDA #$20
    STA a:SQ2_LO
    LDA #$30
    STA a:SQ2_HI
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$8b07]
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_0x48
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_0x48:                   ; [$8b08]
    LDA #$23
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0126
    LDA #$16
    STA a:SoundEffect_State_0128
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDA #$1e
    STA a:SoundEffect_State_0129
    DEC a:SoundEffect_State_0129
    BNE @LAB_PRG5__8b2f
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8b2f:                          ; [$8b2f]
    LDA a:SOUND_DAT_0124
    AND #$01
    BNE @_return
    LDA #$df
    STA a:SQ2_VOL
    LDA #$16
    STA a:NOISE_VOL
    LDA #$a3
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    STA a:SQ2_LO
    CLC
    ADC #$10
    STA a:SoundEffect_MaybeIndex
    DEC a:SoundEffect_State_0128
    LDA a:SoundEffect_State_0128
    AND #$0f
    STA a:NOISE_LO
    LDA #$12
    STA a:SQ2_HI
    STA a:NOISE_HI

  @_return:                                 ; [$8b64]
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_Pakukame
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_Pakukame:               ; [$8b65]
    LDA #$46
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDA a:SOUND_DAT_0124
    BNE @LAB_PRG5__8b7c
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8b7c:                          ; [$8b7c]
    LDA a:SoundEffect_MaybeIndex
    AND #$3c
    LSR A
    LSR A
    AND #$0f
    ORA #$f0
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA #$01
    STA a:SQ2_HI
    LDA a:SoundEffect_MaybeIndex
    AND #$07
    TAX
    LDA a:SoundEffect_MaybeIndex
    CLC
    ADC #$32
    SEC
    SBC SOUNDEFFECT_PAKUKAME_SQ2_LO_SEQUENCE,X
    STA a:SQ2_LO
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_Pakukame
;
SOUNDEFFECT_PAKUKAME_SQ2_LO_SEQUENCE:       ; [$8bab]
    db $00,$08,$14,$20,$2d,$20,$14,$08      ; [$8bab] byte

;============================================================================
; TODO: Document SoundEffect_Handler_FillHPOrMP
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_FillHPOrMP:             ; [$8bb3]
    LDA #$23
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDA #$19
    STA a:SoundEffect_State_0129
    STA a:SoundEffect_State_0128
    DEC a:SoundEffect_State_0128
    BNE @LAB_PRG5__8bd2
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8bd2:                          ; [$8bd2]
    LDA a:SoundEffect_MaybeIndex
    AND #$03
    TAY
    LDA SOUNDEFFECT_FILLHPORMP_SQ2_VOL_SEQUENCE,Y
    STA a:SQ2_VOL
    LDA #$aa
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    AND #$01
    TAX
    LDA FOREPAW_BLOCKS_SCREEN_12,X
    ORA a:SoundEffect_State_0129
    SBC a:SoundEffect_MaybeIndex
    STA a:SoundEffect_State_0129
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_FillHPOrMP
;
SOUNDEFFECT_FILLHPORMP_SQ2_VOL_SEQUENCE:    ; [$8c01]
    db $1f,$5f,$9f,$df                      ; [$8c01] byte

;
; XREFS:
;     SoundEffect_Handler_FillHPOrMP
;
BYTE_PRG5__8c05:                            ; [$8c05]
    db $60,$30                              ; [$8c05] byte

;============================================================================
; TODO: Document SoundEffect_Handler_Tilte
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_Tilte:                  ; [$8c07]
    LDA #$1e
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0126
    LDA #$0f
    STA a:SoundEffect_State_0129
    LDA #$01
    STA a:SoundEffect_MaybeIndex
    LDA #$07
    STA a:SoundEffect_State_0128
    DEC a:SoundEffect_MaybeIndex
    BNE @_return
    DEC a:SoundEffect_State_0128
    LDA a:SoundEffect_State_0128
    STA a:SoundEffect_MaybeIndex
    BNE @LAB_PRG5__8c39
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8c39:                          ; [$8c39]
    LDA #$48
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_0129
    ORA #$10
    STA a:NOISE_VOL
    LDA a:SoundEffect_State_0129
    AND #$07
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    LDA a:SoundEffect_State_0129
    ORA #$18
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    DEC a:SoundEffect_State_0129

  @_return:                                 ; [$8c68]
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_Maybe_Step
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_Maybe_Step:             ; [$8c69]
    LDA #$05
    STA a:SOUND_DAT_0126
    LDA #$03
    STA a:SoundEffect_MaybeIndex
    LDA #$01
    STA a:NOISE_VOL
    LDA a:SoundEffect_MaybeIndex
    CMP #$03
    BNE @LAB_PRG5__8c89
    LDA #$0a
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI

  @LAB_PRG5__8c89:                          ; [$8c89]
    DEC a:SoundEffect_MaybeIndex
    BNE @_return
    LDA #$02
    STA a:NOISE_LO
    LDA #$10
    STA a:NOISE_HI
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$8c9b]
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_PlayerDied
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_PlayerDied:             ; [$8c9c]
    LDA #$41
    STA a:SoundEffects
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0125
    STA a:SOUND_DAT_0126
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    LDA #$3c
    STA a:SoundEffect_State_0128
    LDA #$00
    STA a:TRI_LINEAR
    STA a:TRI_LO
    STA a:TRI_LO
    DEC a:SoundEffect_State_0128
    BNE @LAB_PRG5__8cd2
    LDA #$10
    STA a:SQ1_VOL
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8cd2:                          ; [$8cd2]
    LDA a:SoundEffect_MaybeIndex
    EOR #$ff
    LSR A
    LSR A
    AND #$0f
    ORA #$d0
    STA a:SQ2_VOL
    AND #$5f
    STA a:SQ1_VOL
    LDA #$1f
    STA a:NOISE_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    STA a:SQ1_SWEEP
    LDA a:SoundEffect_MaybeIndex
    AND #$03
    TAX
    LDA SOUNDEFFECT_PLAYERDIED_NOTES,X
    JSR SoundEffect_SetNote
    LDA a:SoundEffect_Note_Low
    CLC
    ADC a:SoundEffect_MaybeIndex
    STA a:SQ2_LO
    CLC
    ADC #$10
    STA a:SQ1_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    STA a:SQ1_HI
    LDA a:SoundEffect_MaybeIndex
    AND #$03
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_MaybeIndex
    RTS

;
; XREFS:
;     SoundEffect_Handler_PlayerDied
;
SOUNDEFFECT_PLAYERDIED_NOTES:               ; [$8d28]
    db $4f,$32,$4c,$3c                      ; [$8d28] byte

;============================================================================
; TODO: Document SoundEffect_Handler_LadderDropped
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_LadderDropped:          ; [$8d2c]
    LDA #$0a
    STA a:SOUND_DAT_0126
    LDA #$03
    STA a:SoundEffect_MaybeIndex
    LDA #$07
    STA a:NOISE_VOL
    LDA a:SoundEffect_MaybeIndex
    CMP #$03
    BNE @LAB_PRG5__8d4c
    LDA #$0f
    STA a:NOISE_LO
    LDA #$18
    STA a:NOISE_HI

  @LAB_PRG5__8d4c:                          ; [$8d4c]
    DEC a:SoundEffect_MaybeIndex
    BNE @_return
    LDA #$05
    STA a:NOISE_LO
    LDA #$18
    STA a:NOISE_HI
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$8d5e]
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_ShowPlayerMenu
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_ShowPlayerMenu:         ; [$8d5f]
    LDA #$23
    STA a:SOUND_DAT_0124
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    STA a:SoundEffect_State_0128
    LDA #$20
    STA a:SoundEffect_State_0129
    DEC a:SoundEffect_State_0129
    LDA a:SoundEffect_State_0129
    LSR A
    BNE @LAB_PRG5__8d82
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8d82:                          ; [$8d82]
    ORA #$d0
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_0128
    AND #$03
    TAX
    LDA SOUNDEFFECT_SHOWPLAYERMENU_NOTES,X
    JSR SoundEffect_SetNote
    LDA a:SoundEffect_Note_Low
    SEC
    SBC a:SoundEffect_MaybeIndex
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_MaybeIndex
    INC a:SoundEffect_MaybeIndex
    INC a:SoundEffect_MaybeIndex
    INC a:SoundEffect_State_0128
    RTS

;
; XREFS:
;     SoundEffect_Handler_ShowPlayerMenu
;
SOUNDEFFECT_SHOWPLAYERMENU_NOTES:           ; [$8db5]
    db $5b,$4f,$43,$37                      ; [$8db5] byte

;============================================================================
; TODO: Document SoundEffect_Handler_GoldAmountChanged
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_GoldAmountChanged:      ; [$8db9]
    LDA #$0a
    STA a:SOUND_DAT_0124
    LDA #$02
    STA a:SoundEffect_MaybeIndex
    LDA #$82
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA #$28
    STA a:SQ2_LO
    LDA #$10
    STA a:SQ2_HI
    RTS

;============================================================================
; TODO: Document SoundEffect_Handler_Maybe_UseSpecialItem2
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_Maybe_UseSpecialItem2:  ; [$8dd8]
    LDA #$44
    STA a:SOUND_DAT_0124
    STA a:SOUND_DAT_0126
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    STA a:SoundEffect_State_0128
    STA a:SoundEffect_State_0129
    LDA a:SoundEffect_State_0129
    LSR A
    TAX
    LDA SOUNDEFFECT_SPECIALITEM2_NOISE_VOL,X
    BNE @LAB_PRG5__8e00
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8e00:                          ; [$8e00]
    ORA #$90
    STA a:NOISE_VOL
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    ASL A
    STA a:SoundEffect_State_0128
    LDX a:SoundEffect_MaybeIndex
    LDA SOUNDEFFECT_SPECIALITEM2_NOTES,X
    CMP #$ff
    BEQ @LAB_PRG5__8e56
    JSR SoundEffect_SetNote
    LDA a:SoundEffect_Note_Low
    CLC
    ADC a:SoundEffect_State_0128
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    LDA a:SoundEffect_MaybeIndex
    AND #$01
    TAX
    LDA SOUNDEFFECT_SPECIALITEM2_NOISE_LO,X
    CLC
    ADC a:SoundEffect_MaybeIndex
    AND #$0f
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_MaybeIndex
    LDA a:SoundEffect_MaybeIndex
    AND #$07
    BNE @_return
    INC a:SoundEffect_State_0129

  @_return:                                 ; [$8e55]
    RTS

  @LAB_PRG5__8e56:                          ; [$8e56]
    LDA #$00
    STA a:SoundEffect_MaybeIndex
    INC a:SoundEffect_State_0129
    RTS

;
; XREFS:
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;
SOUNDEFFECT_SPECIALITEM2_NOISE_VOL:         ; [$8e5f]
    db $0f,$0d,$09,$05,$00                  ; [$8e5f] byte

;
; XREFS:
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;
SOUNDEFFECT_SPECIALITEM2_NOISE_LO:          ; [$8e64]
    db $0c,$07                              ; [$8e64] byte

;
; XREFS:
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;
SOUNDEFFECT_SPECIALITEM2_NOTES:             ; [$8e66]
    db $24,$27,$2b,$30,$48,$4b,$4f,$54,$33,$44,$52,$57,$57,$5c,$62,$ff ; [$8e66]
                                                                       ; byte

;============================================================================
; TODO: Document SoundEffect_Handler_BreadTouched
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_BreadTouched:           ; [$8e76]
    LDA #$18
    STA a:SOUND_DAT_0124
    LDA #$ff
    STA a:SoundEffect_MaybeIndex
    LDA #$00
    STA a:SoundEffect_State_0128
    STA a:SoundEffect_State_0129
    LDA a:SoundEffect_State_0128
    LSR A
    LSR A
    TAX
    LDA SOUNDEFFECT_BREADTOUCHED_SQ2_HI,X
    STA a:SoundEffect_State_0129
    BNE @LAB_PRG5__8e9e
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @LAB_PRG5__8e9e:                          ; [$8e9e]
    LDA #$df
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_MaybeIndex
    SEC
    SBC a:SoundEffect_State_0129
    STA a:SoundEffect_MaybeIndex
    STA a:SQ2_LO
    TXA
    AND #$03
    TAX
    LDA SOUNDEFFECT_BREADTOUCHED_SQ2_HI,X
    AND #$01
    STA a:SQ2_HI
    INC a:SoundEffect_State_0128
    RTS

;
; XREFS:
;     SoundEffect_Handler_BreadTouched
;
SOUNDEFFECT_BREADTOUCHED_SQ2_HI:            ; [$8ec5]
    db $1f,$36,$63,$76,$c8,$00              ; [$8ec5] byte

;============================================================================
; TODO: Document SoundEffect_Handler_CoinTouched
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Handler_CoinTouched:            ; [$8ecb]
    JMP SoundEffect_Handler_CoinTouchedCommon

;============================================================================
; TODO: Document FUN_PRG5__8ece
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
FUN_PRG5__8ece:                             ; [$8ece]
    JMP SoundEffect_Handler_CoinTouchedCommon__Loop

;============================================================================
; TODO: Document SoundEffect_SetNote
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SoundEffect_Handler_CharacterInput
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_HitPlayer
;     SoundEffect_Handler_ItemPickedUp
;     SoundEffect_Handler_Maybe_Typing
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_ShowPlayerMenu
;============================================================================
SoundEffect_SetNote:                        ; [$8ed1]
    SEC
    SBC #$18


    ;
    ; Loop, subtracting 12 (number of notes in our lookup
    ; table) each iteration, until < 0.
    ;
    ; The number of loop iterations will be used later to
    ; normalize the resulting note for the right octave.
    ;
    LDY #$01
    SEC

  @_loop:                                   ; [$8ed7]
    SBC #$0c
    INY
    BCS @_loop
    DEY
    ADC #$0d
    ASL A
    TAX
    LDA AUDIO_NOTES,X
    STA a:SoundEffect_Note_Low
    LDA AUDIO_NOTES+1,X
    STA a:SoundEffect_Note_High


    ;
    ; Convert to the note in the right octave based on
    ; the starting value.
    ;
  @_octaveLoop:                             ; [$8eed]
    DEY
    BEQ @_return
    LSR a:SoundEffect_Note_High
    ROR a:SoundEffect_Note_Low
    JMP @_octaveLoop

  @_return:                                 ; [$8ef9]
    RTS


;============================================================================
; Music lookup table.
;
; Entries are groups of 2-byte addresses containing the
; music data for each channel.
;
; XREFS:
;     Audio_LoadMusic
;============================================================================

;
; XREFS:
;     Audio_LoadMusic
;
MUSIC_LOOKUP:                               ; [$8efa]
    db $ff                                  ; [$8efa] byte

;
; XREFS:
;     MScript_Op_Restart
;
MUSIC_LOOKUP_START_THEME:                   ; [$8efb]
    dw $8f7c                                ; [0]:
    dw $9020                                ; [1]:
    dw $9161                                ; [2]:
    dw $928e                                ; [3]:

MUSIC_LOOKUP_DAYBREAK:                      ; [$8f03]
    dw $93b9                                ; [0]:
    dw $9458                                ; [1]:
    dw $9540                                ; [2]:
    dw $9660                                ; [3]:

MUSIC_LOOKUP_APOLUNE:                       ; [$8f0b]
    dw $9662                                ; [0]:
    dw $971c                                ; [1]:
    dw $987a                                ; [2]:
    dw $9a48                                ; [3]:

MUSIC_LOOKUP_CONFLATE:                      ; [$8f13]
    dw $9a92                                ; [0]:
    dw $9b15                                ; [1]:
    dw $9bbd                                ; [2]:
    dw $9c5f                                ; [3]:

MUSIC_LOOKUP_FOREPAW:                       ; [$8f1b]
    dw $9d38                                ; [0]:
    dw $9daf                                ; [1]:
    dw $9e73                                ; [2]:
    dw $9ee0                                ; [3]:

MUSIC_LOOKUP_TOWER:                         ; [$8f23]
    dw $9ee2                                ; [0]:
    dw $9f67                                ; [1]:
    dw $9ffa                                ; [2]:
    dw $a0b1                                ; [3]:

MUSIC_LOOKUP_EOLIS:                         ; [$8f2b]
    dw $a163                                ; [0]:
    dw $a21b                                ; [1]:
    dw $a2d1                                ; [2]:
    dw $a3b8                                ; [3]:

MUSIC_LOOKUP_DEATH:                         ; [$8f33]
    dw $a4a1                                ; [0]:
    dw $a530                                ; [1]:
    dw $a5bb                                ; [2]:
    dw $a65c                                ; [3]:

MUSIC_LOOKUP_MASCON_VICTIM:                 ; [$8f3b]
    dw $a65e                                ; [0]:
    dw $a6b0                                ; [1]:
    dw $a700                                ; [2]:
    dw $a78a                                ; [3]:

MUSIC_LOOKUP_BOSS:                          ; [$8f43]
    dw $a7b9                                ; [0]:
    dw $a816                                ; [1]:
    dw $a874                                ; [2]:
    dw $a8f8                                ; [3]:

MUSIC_LOOKUP_HOURGLASS:                     ; [$8f4b]
    dw $a8fa                                ; [0]:
    dw $a93e                                ; [1]:
    dw $a982                                ; [2]:
    dw $aa1c                                ; [3]:

MUSIC_LOOKUP_ENDING:                        ; [$8f53]
    dw $aa87                                ; [0]:
    dw $ab47                                ; [1]:
    dw $ac99                                ; [2]:
    dw $addd                                ; [3]:

MUSIC_LOOKUP_KINGS_ROOM:                    ; [$8f5b]
    dw $af20                                ; [0]:
    dw $af49                                ; [1]:
    dw $af72                                ; [2]:
    dw $afaa                                ; [3]:

MUSIC_LOOKUP_TEMPLE:                        ; [$8f63]
    dw $afac                                ; [0]:
    dw $b007                                ; [1]:
    dw $b042                                ; [2]:
    dw $b073                                ; [3]:

MUSIC_LOOKUP_SHOP:                          ; [$8f6b]
    dw $b075                                ; [0]:
    dw $b0b8                                ; [1]:
    dw $b0fb                                ; [2]:
    dw $b142                                ; [3]:

MUSIC_LOOKUP_EVIL_FORTRESS:                 ; [$8f73]
    dw $b144                                ; [0]:
    dw $b1cc                                ; [1]:
    dw $b277                                ; [2]:
    dw $b321                                ; [3]:
    db $ff                                  ; [$8f7b] byte


;============================================================================
; Music for the start screen.
;
; XREFS:
;     MUSIC_LOOKUP_START_THEME [$PRG5::8efb]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_START_THEME [$PRG5::8efb]
;
MSCRIPT_START_THEME_SQ1:                    ; [$8f7c]
    db MSCRIPT_OP_MAYBE_SET_8BITCOUNTER     ; [$8f7c] MScriptOp
    db $ff                                  ; [$8f7d] byte

    db MSCRIPT_OP_SET_SQ_VOL
    db $00                                  ; [$8f7f] byte

    db MSCRIPT_OP_MAYBE_SET_0172
    db $d0                                  ; [$8f81] byte

    db MSCRIPT_OP_SET_SQ_DECAY_MODE
    db $00                                  ; [$8f83] byte

    db MSCRIPT_OP_SET_SQ1_HIGH
    db $f4,$86,$1f,$21,$23,$24,$26,$28,$29,$2a,$2b,$2d,$2f,$30,$32,$34 ; [$8f85]
                                                                       ; byte
    db $35,$36                              ; [$8f95] byte

    db MSCRIPT_OP_MAYBE_SET_0172
    db $d0                                  ; [$8f98] byte

    db MSCRIPT_OP_BEGIN_LOOP
    db $02,$b0,$37,$3c,$3e,$45,$c8,$43,$8c,$3c,$3e,$3f,$3c,$3f,$3e,$00 ; [$8f9a]
                                                                       ; byte
    db $3b,$98,$37                          ; [$8faa] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_BEGIN_LOOP                ; [$8fae] MScriptOp
    db $02,$a4,$43,$8c,$3c,$b0,$3c,$8c,$41,$41,$40,$a4,$3c,$8c,$37,$39 ; [$8faf]
                                                                       ; byte
    db $a4,$3a,$8c,$3a,$39,$3a,$39,$bc,$37  ; [$8fbf] byte

    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS  ; If i >, continue.
    db $01,$86,$37,$39,$3b,$3c,$3e,$40,$41,$42 ; [$8fc9] byte

    db MSCRIPT_OP_END_LOOP                  ; End loop.
    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS  ; [$8fd4] MScriptOp
    db $02,$86,$3c,$3b,$3c,$3e,$40,$41,$42,$43,$b0,$44,$46,$c8,$43,$8c ; [$8fd5]
                                                                       ; byte
    db $3c,$3e,$3f,$3f,$41,$3e,$00,$3c,$3a,$98,$37,$86,$38,$37,$8c,$35 ; [$8fe5]
                                                                       ; byte
    db $92,$37,$86,$30,$33,$37,$3c,$37,$3c,$3f,$b0,$44,$46,$bc,$43,$8c ; [$8ff5]
                                                                       ; byte
    db $3c,$3c,$3e,$3f,$3f,$41,$3e,$00,$3c,$98,$3a,$8c,$3f,$3f,$41,$3e ; [$9005]
                                                                       ; byte
    db $00,$3c,$3a                          ; [$9015] byte

    db MSCRIPT_OP_SET_REPEATED              ; Set repeated 204 times.
    db $cc,$3c,$d4,$00,$ec,$3c              ; [$9019] byte

    db MSCRIPT_OP_MAYBE_END

;
; XREFS:
;     MUSIC_LOOKUP_START_THEME [$PRG5::8efd]
;
MSCRIPT_START_THEME_SQ2:                    ; [$9020]
    db MSCRIPT_OP_SET_SQ_VOL                ; Set volume to 3.
    db $03                                  ; [$9021] byte

    db MSCRIPT_OP_MAYBE_SET_0172
    db $90                                  ; [$9023] byte

    db MSCRIPT_OP_SET_SQ_DECAY_MODE
    db $00                                  ; [$9025] byte

    db MSCRIPT_OP_MAYBE_SET_0181
    db $02,$98,$00,$86,$21,$23,$24,$26,$28,$29,$2b,$2d,$2f,$30,$32,$33 ; [$9027]
                                                                       ; byte
    db MSCRIPT_OP_MAYBE_SET_0181            ; [$9037] MScriptOp
    db $00                                  ; [$9038] byte

    db MSCRIPT_OP_MAYBE_SET_0172
    db $50                                  ; [$903a] byte

    db MSCRIPT_OP_BEGIN_LOOP
    db $02                                  ; Loops = 2
    db $86,$34,$34,$34,$00,$3c,$2b,$34,$34,$34,$34,$34,$00,$3c,$2b,$34 ; [$903d]
                                                                       ; byte
    db $34,$35,$35,$35,$00,$3c,$2d,$35,$35,$35,$35,$35,$00,$3c,$2d,$35 ; [$904d]
                                                                       ; byte
    db $35,$34,$34,$34,$00,$3c,$2b,$34,$34,$34,$30,$2b,$30,$34,$34,$37 ; [$905d]
                                                                       ; byte
    db $37,$2c,$30,$33,$38,$3c,$38,$2b,$00,$00,$00,$22,$26,$2b,$2f,$32 ; [$906d]
                                                                       ; byte
    db $2f                                  ; [$907d] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_BEGIN_LOOP                ; [$907f] MScriptOp
    db $02                                  ; Loops = 2
    db $86,$34,$37,$2b,$30,$34,$37,$2b,$30,$34,$37,$2b,$30,$34,$37,$2b ; [$9081]
                                                                       ; byte
    db $30,$35,$37,$2b,$30,$34,$37,$2b,$30,$34,$37,$2b,$30,$34,$37,$30 ; [$9091]
                                                                       ; byte
    db $34,$27,$2b,$2e,$33,$37,$33,$2e,$2b,$29,$2d,$30,$35,$30,$2d,$2b ; [$90a1]
                                                                       ; byte
    db $26                                  ; [$90b1] byte

    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS
    db $01,$86,$2b,$30,$34,$30,$2b,$30,$34,$30,$34,$35,$37,$39,$3b,$3c ; [$90b3]
                                                                       ; byte
    db $3e,$3f                              ; [$90c3] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS  ; [$90c6] MScriptOp
    db $02                                  ; Loops = 2
    db $86,$2b,$30,$34,$30,$2b,$30,$34,$30,$34,$33,$34,$35,$37,$39,$3b ; [$90c8]
                                                                       ; byte
    db $3c                                  ; [$90d8] byte

    db MSCRIPT_OP_BEGIN_LOOP                ; Loop 2 times
    db $02,$86,$2c,$30,$33,$38,$3c,$3f,$3c,$38,$2e,$32,$35,$3a,$3e,$41 ; [$90da]
                                                                       ; byte
    db $3e,$3a,$24,$28,$2b,$30,$34,$37,$3c,$40,$3c,$37,$34,$30,$2b,$28 ; [$90ea]
                                                                       ; byte
    db $24,$28,$2c,$30,$33,$38,$3c,$38,$35,$32,$2e,$29,$2e,$32,$35,$32 ; [$90fa]
                                                                       ; byte
    db $2e,$32                              ; [$910a] byte

    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS  ; Skip to end of loop if 1 loop
                                            ; completed
    db $01,$8c,$33,$86,$35,$33,$8c,$30,$30,$86,$24,$27,$2b,$30,$33,$30 ; [$910d]
                                                                       ; byte
    db $2b,$27                              ; [$911d] byte

    db MSCRIPT_OP_END_LOOP                  ; End of loop
    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS  ; [$9120] MScriptOp
    db $02,$86,$33,$38,$3c,$38,$33,$38,$8c,$3a,$00,$35,$37,$92,$34,$86 ; [$9121]
                                                                       ; byte
    db $30,$2b,$30,$28,$2b,$24,$28,$34,$30,$2b,$30,$28,$2b,$24,$28,$32 ; [$9131]
                                                                       ; byte
    db $2e,$29,$2e,$26,$29,$22,$26,$32,$2e,$29,$2e,$26,$29,$22,$26,$30 ; [$9141]
                                                                       ; byte
    db $2c,$27,$2c,$24,$27,$20,$24,$33,$30,$2c,$30,$27,$2c,$ec,$27 ; [$9151]
                                                                   ; byte

    db MSCRIPT_OP_MAYBE_END                 ; End.

;
; XREFS:
;     MUSIC_LOOKUP_START_THEME [$PRG5::8eff]
;
MSCRIPT_START_THEME_TRI:                    ; [$9161]
    db $b0,$00,$86,$23,$24,$26,$28,$29,$2b,$2d,$2f ; [$9161] byte

    db MSCRIPT_OP_BEGIN_LOOP
    db $02,$86,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00 ; [$916d]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00 ; [$917d]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00 ; [$918d]
                                                                       ; byte
    db $18,$18,$14,$14,$20,$20,$14,$14,$13,$00,$00,$00,$1f,$1f,$13,$13 ; [$919d]
                                                                       ; byte
    db $13,$13                              ; [$91ad] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_BEGIN_LOOP                ; [$91b0] MScriptOp
    db $02,$86,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00 ; [$91b1]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00 ; [$91c1]
                                                                       ; byte
    db $18,$18,$1b,$1b,$1b,$1b,$1b,$00,$1b,$1b,$1d,$1d,$1d,$1d,$1d,$00 ; [$91d1]
                                                                       ; byte
    db $1d,$1d,$18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00 ; [$91e1]
                                                                       ; byte
    db $18,$18                              ; [$91f1] byte

    db MSCRIPT_OP_END_LOOP
    db $14,$14,$14,$14,$14,$14,$14,$14,$16,$16,$16,$16,$16,$16,$16,$16 ; [$91f4]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00,$18,$18 ; [$9204]
                                                                       ; byte
    db $14,$14,$14,$14,$14,$14,$16,$00,$00,$00,$16,$16,$16,$16,$16,$16 ; [$9214]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00,$18,$18 ; [$9224]
                                                                       ; byte
    db $14,$14,$14,$14,$14,$14,$14,$14,$16,$16,$16,$16,$16,$16,$16,$16 ; [$9234]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$00,$18,$18,$18,$18,$18,$18,$18,$00,$18,$18 ; [$9244]
                                                                       ; byte
    db $14,$14,$14,$14,$14,$14,$16,$00,$00,$00,$16,$16,$16,$16,$16,$16 ; [$9254]
                                                                       ; byte
    db $14,$14,$14,$14,$14,$14,$16,$00,$00,$00,$16,$16,$16,$16,$98,$18 ; [$9264]
                                                                       ; byte
    db $8c,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18 ; [$9274]
                                                                       ; byte
    db $18,$18,$18,$18,$18,$18,$18,$ec,$20  ; [$9284] byte

    db MSCRIPT_OP_MAYBE_END

;
; XREFS:
;     MUSIC_LOOKUP_START_THEME [$PRG5::8f01]
;
MSCRIPT_START_THEME_NOISE:                  ; [$928e]
    db $8c,$21,$00,$21,$00,$86,$31,$21,$31,$31,$31,$21,$31,$31 ; [$928e] byte

    db MSCRIPT_OP_BEGIN_LOOP
    db $02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c ; [$929d]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$92ad]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31 ; [$92bd]
                                                                       ; byte
    db $00,$31,$31,$8c,$21,$21,$21,$21,$21,$21,$86,$31,$00,$8c,$21,$21 ; [$92cd]
                                                                       ; byte
    db $86,$21,$21                          ; [$92dd] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_BEGIN_LOOP                ; [$92e1] MScriptOp
    db $02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c ; [$92e2]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$92f2]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31 ; [$9302]
                                                                       ; byte
    db $00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31 ; [$9312]
                                                                       ; byte
    db $31,$31,$00,$31,$31,$21,$21,$21,$00  ; [$9322] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_BEGIN_LOOP                ; [$932c] MScriptOp
    db $02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c ; [$932d]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31 ; [$933d]
                                                                       ; byte
    db $31,$8c,$21,$86,$31,$31              ; [$934d] byte

    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS
    db $01,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c ; [$9354]
                                                                       ; byte
    db $21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$8c ; [$9364]
                                                                       ; byte
    db $21,$86,$21,$21,$21,$00              ; [$9374] byte

    db MSCRIPT_OP_END_LOOP
    db MSCRIPT_OP_CONTINUE_LOOP_IF_N_ITERS  ; [$937b] MScriptOp
    db $02,$8c,$21,$21,$21,$21,$86,$31,$31,$8c,$21,$21,$86,$21,$21,$8c ; [$937c]
                                                                       ; byte
    db $21,$21,$21,$21,$00,$21,$21          ; [$938c] byte

    db MSCRIPT_OP_BEGIN_LOOP
    db $02,$86,$31,$00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$31,$00 ; [$9394]
                                                                       ; byte
    db $31,$31                              ; [$93a4] byte

    db MSCRIPT_OP_END_LOOP
    db $31,$00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$31,$31,$ec,$31 ; [$93a7]
                                                                       ; byte
    db MSCRIPT_OP_MAYBE_END                 ; [$93b7] MScriptOp
    db MSCRIPT_OP_MAYBE_END                 ; [$93b8] MScriptOp


;============================================================================
; Music for Daybreak.
;
; XREFS:
;     MUSIC_LOOKUP_DAYBREAK [$PRG5::8f03]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_DAYBREAK [$PRG5::8f03]
;
MUSIC_DAYBREAK_1:                           ; [$93b9]
    db $f1,$01,$f2,$90,$f0,$01,$ef,$02,$fd,$02,$98,$2d,$2f,$30,$37,$c8 ; [$93b9]
                                                                       ; byte
    db $36,$98,$32,$c8,$35,$98,$2f,$e0,$34,$98,$2d,$2f,$30,$37,$c8,$36 ; [$93c9]
                                                                       ; byte
    db $98,$32,$c8,$35,$98,$2f,$e0,$2f,$98,$32,$34,$35,$3c,$c8,$3b,$98 ; [$93d9]
                                                                       ; byte
    db $38,$c8,$39,$98,$34,$e0,$30,$98,$30,$32,$34,$39,$33,$34,$36,$3b ; [$93e9]
                                                                       ; byte
    db $e0,$3b,$fb,$01,$e0,$34,$fc,$fb,$02,$a4,$34,$8c,$34,$39,$34,$39 ; [$93f9]
                                                                       ; byte
    db $3c,$98,$3f,$3c,$3b,$38,$a4,$39,$8c,$34,$39,$34,$39,$3c,$98,$40 ; [$9409]
                                                                       ; byte
    db $41,$3c,$3e,$a4,$3a,$8c,$41,$40,$3c,$3b,$38,$39,$34,$30,$34,$98 ; [$9419]
                                                                       ; byte
    db $2d,$2c,$8c,$2b,$00,$00,$f2,$90,$f0,$00,$34,$35,$36,$37,$38,$e0 ; [$9429]
                                                                       ; byte
    db $00,$a4,$00,$8c,$38,$37,$36,$35,$34,$e0,$00,$a4,$00,$8c,$34,$35 ; [$9439]
                                                                       ; byte
    db $36,$37,$38,$e0,$00,$a4,$00,$8c,$38,$37,$36,$35,$34,$f4,$ff ; [$9449]
                                                                   ; byte

;
; XREFS:
;     MUSIC_LOOKUP_DAYBREAK [$PRG5::8f05]
;
MUSIC_DAYBREAK_2:                           ; [$9458]
    db $f1,$05,$f2,$13,$f0,$01,$f2,$90,$8c,$00,$98,$2d,$2f,$30,$37,$c8 ; [$9458]
                                                                       ; byte
    db $36,$98,$32,$c8,$35,$98,$2f,$e0,$34,$98,$2d,$2f,$30,$37,$c8,$36 ; [$9468]
                                                                       ; byte
    db $98,$32,$c8,$35,$98,$2f,$e0,$2f,$98,$32,$34,$35,$3c,$c8,$3b,$98 ; [$9478]
                                                                       ; byte
    db $38,$c8,$39,$98,$34,$e0,$30,$98,$30,$32,$34,$39,$33,$34,$36,$3b ; [$9488]
                                                                       ; byte
    db $e0,$3b,$f1,$03,$8c,$34,$32,$2f,$30,$2d,$2f,$2c,$b0,$00,$98,$2d ; [$9498]
                                                                       ; byte
    db $2f,$2d,$2f,$30,$2d,$2f,$30,$2f,$2d,$2c,$29,$28,$26,$24,$28,$2d ; [$94a8]
                                                                       ; byte
    db $2f,$2d,$2f,$30,$2d,$2f,$2d,$29,$26,$28,$2f,$2c,$28,$00,$00,$32 ; [$94b8]
                                                                       ; byte
    db $30,$2f,$2d,$2c,$28,$00,$31,$2d,$31,$2d,$2a,$27,$b0,$24,$98,$28 ; [$94c8]
                                                                       ; byte
    db $2d,$30,$2f,$30,$2f,$33,$34,$2d,$2f,$2c,$a4,$30,$8c,$30,$34,$30 ; [$94d8]
                                                                       ; byte
    db $34,$39,$3c,$3c,$39,$39,$38,$38,$32,$32,$a4,$30,$8c,$30,$34,$30 ; [$94e8]
                                                                       ; byte
    db $34,$39,$3c,$3c,$3e,$3e,$34,$34,$3b,$3b,$a4,$35,$8c,$3e,$3c,$39 ; [$94f8]
                                                                       ; byte
    db $38,$32,$34,$30,$2d,$30,$98,$28,$27,$8c,$26,$00,$00,$f1,$03,$f2 ; [$9508]
                                                                       ; byte
    db $50,$f0,$00,$30,$31,$32,$33,$34,$e0,$00,$a4,$00,$8c,$34,$33,$32 ; [$9518]
                                                                       ; byte
    db $31,$30,$e0,$00,$a4,$00,$8c,$30,$31,$32,$33,$34,$e0,$00,$a4,$00 ; [$9528]
                                                                       ; byte
    db $8c,$34,$33,$32,$31,$30,$f4,$ff      ; [$9538] byte

;
; XREFS:
;     MUSIC_LOOKUP_DAYBREAK [$PRG5::8f07]
;
MUSIC_DAYBREAK_3:                           ; [$9540]
    db $fd,$02,$8c,$15,$21,$1c,$21,$00,$21,$1c,$21,$18,$21,$1c,$21,$00 ; [$9540]
                                                                       ; byte
    db $21,$1c,$21,$17,$21,$1a,$21,$00,$21,$1a,$21,$10,$1c,$17,$1c,$00 ; [$9550]
                                                                       ; byte
    db $1c,$17,$1c,$15,$21,$1c,$21,$00,$21,$1c,$21,$18,$21,$1c,$21,$00 ; [$9560]
                                                                       ; byte
    db $21,$1c,$21,$17,$21,$1a,$21,$00,$21,$1a,$21,$10,$1c,$17,$1c,$00 ; [$9570]
                                                                       ; byte
    db $1c,$17,$1c,$1a,$26,$21,$26,$00,$26,$21,$26,$10,$1c,$17,$1c,$00 ; [$9580]
                                                                       ; byte
    db $1c,$17,$1c,$15,$21,$1c,$21,$00,$21,$1c,$21,$18,$21,$1b,$21,$00 ; [$9590]
                                                                       ; byte
    db $21,$1b,$21,$13,$1c,$18,$1c,$00,$1c,$18,$1c,$17,$21,$1b,$21,$00 ; [$95a0]
                                                                       ; byte
    db $21,$1e,$21,$10,$1c,$17,$1c,$00,$1c,$17,$1c,$fb,$01,$8c,$10,$1c ; [$95b0]
                                                                       ; byte
    db $1d,$1a,$1c,$18,$1a,$17,$fc,$fb,$02,$8c,$10,$11,$10,$21,$1c,$18 ; [$95c0]
                                                                       ; byte
    db $15,$10,$10,$98,$10,$8c,$10,$10,$98,$10,$8c,$10,$21,$1c,$15,$21 ; [$95d0]
                                                                       ; byte
    db $1c,$18,$15,$10,$10,$98,$10,$8c,$10,$10,$98,$10,$8c,$10,$16,$16 ; [$95e0]
                                                                       ; byte
    db $1a,$1a,$1c,$1c,$10,$10,$15,$98,$15,$8c,$15,$98,$18,$17,$8c,$16 ; [$95f0]
                                                                       ; byte
    db $16,$16,$16,$16,$17,$18,$19,$86,$19,$25,$19,$25,$1c,$28,$1c,$28 ; [$9600]
                                                                       ; byte
    db $20,$2c,$20,$2c,$1c,$28,$1c,$28,$19,$25,$19,$25,$19,$25,$8c,$19 ; [$9610]
                                                                       ; byte
    db $18,$17,$16,$15,$86,$15,$21,$15,$21,$18,$24,$18,$24,$1c,$28,$1c ; [$9620]
                                                                       ; byte
    db $28,$18,$24,$18,$24,$15,$21,$15,$21,$15,$21,$8c,$15,$16,$17,$18 ; [$9630]
                                                                       ; byte
    db $19,$86,$19,$25,$19,$25,$1c,$28,$1c,$28,$20,$2c,$20,$2c,$1c,$28 ; [$9640]
                                                                       ; byte
    db $1c,$28,$19,$25,$19,$25,$19,$25,$8c,$19,$18,$17,$16,$15,$f4,$ff ; [$9650]
                                                                       ; byte

;
; XREFS:
;     MUSIC_LOOKUP_DAYBREAK [$PRG5::8f09]
;
MUSIC_DAYBREAK_4:                           ; [$9660]
    db $ff,$ff                              ; [$9660] byte


;============================================================================
; Music for Apolune.
;
; XREFS:
;     MUSIC_LOOKUP_APOLUNE [$PRG5::8f0b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_APOLUNE [$PRG5::8f0b]
;
MUSIC_APOLUNE_1:                            ; [$9662]
    db $e0,$00,$00,$f8,$c3,$96,$f8,$c3,$96,$f1,$00,$f2,$90,$f0,$00,$8c ; [$9662]
                                                                       ; byte
    db $32,$34,$36,$37,$86,$39,$00,$98,$3e,$8c,$39,$98,$3c,$8c,$39,$98 ; [$9672]
                                                                       ; byte
    db $35,$8c,$37,$98,$39,$40,$8c,$3d,$98,$39,$8c,$3b,$98,$3d,$3e,$8c ; [$9682]
                                                                       ; byte
    db $3b,$98,$37,$8c,$39,$98,$3b,$8c,$32,$34,$36,$37,$86,$39,$00,$98 ; [$9692]
                                                                       ; byte
    db $3e,$8c,$39,$98,$3c,$8c,$39,$98,$35,$8c,$37,$98,$39,$40,$8c,$3d ; [$96a2]
                                                                       ; byte
    db $98,$39,$8c,$3b,$98,$3d,$3e,$8c,$3b,$98,$37,$8c,$39,$98,$3b,$f4 ; [$96b2]
                                                                       ; byte
    db $ff,$f1,$02,$f2,$d0,$f0,$01,$8c,$39,$38,$39,$b0,$3c,$8c,$39,$98 ; [$96c2]
                                                                       ; byte
    db $3a,$8c,$3a,$bc,$3e,$98,$38,$41,$40,$3e,$8c,$3e,$3d,$00,$bc,$40 ; [$96d2]
                                                                       ; byte
    db $8c,$39,$38,$39,$b0,$3c,$8c,$39,$98,$3a,$8c,$3a,$bc,$3e,$98,$38 ; [$96e2]
                                                                       ; byte
    db $41,$40,$3e,$8c,$3e,$3d,$00,$bc,$40,$b0,$41,$98,$40,$3e,$b0,$3c ; [$96f2]
                                                                       ; byte
    db $98,$3b,$39,$c8,$37,$8c,$34,$ec,$39,$b0,$41,$98,$40,$3e,$b0,$3c ; [$9702]
                                                                       ; byte
    db $98,$3b,$39,$c8,$37,$8c,$34,$ec,$39,$f5 ; [$9712] byte

;
; XREFS:
;     MUSIC_LOOKUP_APOLUNE [$PRG5::8f0d]
;
MUSIC_APOLUNE_2:                            ; [$971c]
    db $e0,$00,$00,$f8,$a6,$97,$f8,$a6,$97,$f1,$02,$f2,$50,$f0,$00,$86 ; [$971c]
                                                                       ; byte
    db $00,$8c,$32,$34,$36,$86,$37,$36,$00,$98,$39,$8c,$36,$86,$39,$39 ; [$972c]
                                                                       ; byte
    db $39,$00,$8c,$35,$98,$2d,$8c,$30,$86,$35,$34,$8c,$35,$86,$3d,$31 ; [$973c]
                                                                       ; byte
    db $3d,$00,$8c,$39,$98,$31,$8c,$34,$86,$39,$34,$31,$2d,$3b,$2f,$3b ; [$974c]
                                                                       ; byte
    db $00,$37,$00,$98,$2f,$8c,$32,$86,$37,$32,$2f,$2b,$00,$8c,$32,$34 ; [$975c]
                                                                       ; byte
    db $36,$86,$37,$36,$00,$98,$39,$8c,$36,$86,$39,$39,$39,$00,$8c,$35 ; [$976c]
                                                                       ; byte
    db $98,$2d,$8c,$30,$86,$35,$34,$8c,$35,$86,$3d,$31,$3d,$00,$8c,$39 ; [$977c]
                                                                       ; byte
    db $98,$31,$8c,$34,$86,$39,$34,$31,$2d,$3b,$2f,$3b,$00,$37,$00,$98 ; [$978c]
                                                                       ; byte
    db $2f,$8c,$32,$86,$37,$32,$2f,$2b,$f4,$ff,$f1,$04,$f2,$90,$f0,$01 ; [$979c]
                                                                       ; byte
    db $8c,$30,$2f,$30,$b0,$34,$8c,$30,$98,$32,$8c,$32,$98,$3a,$8c,$35 ; [$97ac]
                                                                       ; byte
    db $32,$35,$98,$34,$3e,$3c,$3b,$8c,$39,$39,$00,$34,$31,$86,$34,$00 ; [$97bc]
                                                                       ; byte
    db $8c,$31,$86,$34,$00,$8c,$30,$2f,$30,$b0,$34,$8c,$30,$98,$32,$8c ; [$97cc]
                                                                       ; byte
    db $32,$98,$3a,$8c,$35,$32,$35,$98,$34,$3e,$3c,$3b,$8c,$39,$39,$00 ; [$97dc]
                                                                       ; byte
    db $86,$31,$34,$39,$3d,$40,$45,$40,$3d,$39,$34,$29,$00,$2e,$32,$29 ; [$97ec]
                                                                       ; byte
    db $00,$2e,$32,$28,$2b,$2e,$32,$26,$00,$2e,$32,$24,$00,$2d,$30,$24 ; [$97fc]
                                                                       ; byte
    db $00,$2d,$30,$23,$2d,$30,$34,$21,$29,$2d,$30,$1f,$28,$2b,$2f,$00 ; [$980c]
                                                                       ; byte
    db $28,$2b,$2f,$1f,$28,$2b,$2f,$28,$00,$8c,$25,$86,$21,$00,$26,$2a ; [$981c]
                                                                       ; byte
    db $36,$32,$2d,$2a,$21,$00,$26,$2a,$36,$32,$2d,$2a,$29,$2b,$2e,$32 ; [$982c]
                                                                       ; byte
    db $29,$2b,$2e,$32,$00,$2b,$2e,$32,$26,$2b,$2e,$32,$24,$2d,$30,$34 ; [$983c]
                                                                       ; byte
    db $24,$2d,$30,$34,$00,$29,$2d,$30,$21,$29,$2d,$30,$1f,$28,$2b,$2f ; [$984c]
                                                                       ; byte
    db $1f,$28,$2b,$2f,$1f,$28,$2b,$2f,$28,$00,$8c,$25,$86,$21,$26,$2a ; [$985c]
                                                                       ; byte
    db $2d,$32,$2d,$2a,$2d,$21,$26,$2a,$2d,$32,$2d,$8c,$26,$f5 ; [$986c] byte

;
; XREFS:
;     MUSIC_LOOKUP_APOLUNE [$PRG5::8f0f]
;
MUSIC_APOLUNE_3:                            ; [$987a]
    db $8c,$15,$86,$21,$00,$8c,$10,$86,$1c,$00,$8c,$13,$86,$1f,$00,$12 ; [$987a]
                                                                       ; byte
    db $12,$1e,$00,$8c,$15,$86,$21,$00,$8c,$10,$86,$1c,$00,$13,$13,$1f ; [$988a]
                                                                       ; byte
    db $1f,$12,$12,$1e,$00,$f8,$27,$99,$f8,$27,$99,$0e,$00,$15,$00,$0e ; [$989a]
                                                                       ; byte
    db $00,$15,$00,$0e,$0e,$15,$00,$0e,$00,$15,$00,$11,$00,$18,$00,$11 ; [$98aa]
                                                                       ; byte
    db $00,$18,$00,$11,$11,$18,$00,$11,$00,$18,$00,$15,$00,$21,$00,$15 ; [$98ba]
                                                                       ; byte
    db $00,$1c,$00,$15,$15,$1c,$00,$15,$00,$1c,$1c,$13,$00,$1a,$00,$13 ; [$98ca]
                                                                       ; byte
    db $00,$1a,$1f,$13,$13,$1f,$00,$13,$00,$13,$1f,$0e,$00,$15,$00,$0e ; [$98da]
                                                                       ; byte
    db $00,$15,$00,$0e,$0e,$15,$00,$0e,$00,$15,$00,$11,$00,$18,$00,$11 ; [$98ea]
                                                                       ; byte
    db $00,$18,$00,$11,$11,$18,$00,$11,$00,$18,$00,$15,$00,$21,$00,$15 ; [$98fa]
                                                                       ; byte
    db $00,$1c,$00,$15,$15,$1c,$00,$15,$00,$1c,$1c,$13,$00,$1a,$00,$13 ; [$990a]
                                                                       ; byte
    db $00,$1a,$1f,$13,$13,$1f,$00,$13,$00,$13,$1f,$f4,$ff,$8c,$15,$86 ; [$991a]
                                                                       ; byte
    db $21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21 ; [$992a]
                                                                       ; byte
    db $00,$8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00 ; [$993a]
                                                                       ; byte
    db $8c,$16,$86,$22,$00,$8c,$14,$86,$20,$00,$8c,$14,$86,$20,$00,$8c ; [$994a]
                                                                       ; byte
    db $10,$86,$1c,$00,$8c,$10,$86,$1c,$00,$8c,$15,$86,$21,$00,$8c,$15 ; [$995a]
                                                                       ; byte
    db $86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86 ; [$996a]
                                                                       ; byte
    db $21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21 ; [$997a]
                                                                       ; byte
    db $00,$8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00,$8c,$16,$86,$22,$00 ; [$998a]
                                                                       ; byte
    db $8c,$16,$86,$22,$00,$8c,$14,$86,$20,$00,$8c,$14,$86,$20,$00,$8c ; [$999a]
                                                                       ; byte
    db $10,$86,$1c,$00,$8c,$10,$86,$1c,$00,$8c,$15,$86,$21,$00,$8c,$15 ; [$99aa]
                                                                       ; byte
    db $86,$21,$00,$8c,$15,$86,$21,$00,$8c,$15,$86,$21,$00,$13,$13,$13 ; [$99ba]
                                                                       ; byte
    db $13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$11,$11,$11 ; [$99ca]
                                                                       ; byte
    db $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10 ; [$99da]
                                                                       ; byte
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$0e,$0e,$0e ; [$99ea]
                                                                       ; byte
    db $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$13,$13,$13 ; [$99fa]
                                                                       ; byte
    db $13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$13,$11,$11,$11 ; [$9a0a]
                                                                       ; byte
    db $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10 ; [$9a1a]
                                                                       ; byte
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$0e,$0e,$0e ; [$9a2a]
                                                                       ; byte
    db $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e,$f5 ; [$9a3a] byte

;
; XREFS:
;     MUSIC_LOOKUP_APOLUNE [$PRG5::8f11]
;
MUSIC_APOLUNE_4:                            ; [$9a48]
    db $8c,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$86 ; [$9a48]
                                                                       ; byte
    db $31,$31,$8c,$31,$f8,$70,$9a,$f8,$70,$9a,$fd,$08,$8c,$00,$21,$00 ; [$9a58]
                                                                       ; byte
    db $21,$00,$21,$00,$21,$fc,$f4,$ff,$fd,$08,$8c,$00,$21,$00,$21,$00 ; [$9a68]
                                                                       ; byte
    db $21,$00,$21,$fc,$fd,$08,$86,$31,$00,$31,$31,$31,$00,$31,$31,$31 ; [$9a78]
                                                                       ; byte
    db $00,$31,$31,$31,$00,$31,$31,$fc,$f5,$ff ; [$9a88] byte


;============================================================================
; Music for Conflate.
;
; XREFS:
;     MUSIC_LOOKUP_CONFLATE [$PRG5::8f13]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_CONFLATE [$PRG5::8f13]
;
MUSIC_CONFLATE_1:                           ; [$9a92]
    db $f1,$02,$f2,$90,$f0,$01,$fd,$02,$98,$37,$36,$a4,$33,$bc,$34,$8c ; [$9a92]
                                                                       ; byte
    db $34,$37,$3b,$98,$3e,$8c,$3b,$37,$34,$98,$3d,$8c,$35,$bc,$3c,$8c ; [$9aa2]
                                                                       ; byte
    db $39,$3c,$40,$98,$43,$8c,$40,$3c,$39,$a4,$42,$8c,$3e,$3a,$37,$00 ; [$9ab2]
                                                                       ; byte
    db $32,$b0,$35,$a4,$33,$8c,$32,$b0,$00,$8c,$2b,$2e,$32,$36,$b0,$00 ; [$9ac2]
                                                                       ; byte
    db $fc,$00,$98,$3b,$8c,$3c,$3e,$00,$34,$00,$00,$3b,$3b,$3c,$3e,$00 ; [$9ad2]
                                                                       ; byte
    db $3b,$34,$37,$39,$3f,$00,$b0,$3f,$8c,$39,$3f,$41,$3f,$2d,$2d,$33 ; [$9ae2]
                                                                       ; byte
    db $00,$86,$3f,$40,$98,$41,$8c,$3d,$3a,$00,$35,$3a,$3d,$41,$41,$3d ; [$9af2]
                                                                       ; byte
    db $3a,$00,$3a,$3d,$3a,$3e,$3f,$3e,$3a,$36,$33,$36,$33,$32,$32,$32 ; [$9b02]
                                                                       ; byte
    db $00,$f4,$ff                          ; [$9b12] byte

;
; XREFS:
;     MUSIC_LOOKUP_CONFLATE [$PRG5::8f15]
;
MUSIC_CONFLATE_2:                           ; [$9b15]
    db $f1,$02,$f2,$90,$fd,$02,$98,$2f,$2d,$a4,$2a,$8c,$2b,$00,$2b,$22 ; [$9b15]
                                                                       ; byte
    db $23,$2b,$2f,$34,$98,$37,$8c,$34,$2f,$2b,$98,$39,$8c,$2d,$39,$00 ; [$9b25]
                                                                       ; byte
    db $39,$2c,$2d,$ee,$01,$f1,$05,$86,$00,$8c,$39,$3c,$40,$92,$43,$8c ; [$9b35]
                                                                       ; byte
    db $3c,$39,$34,$ee,$00,$f1,$02,$a4,$3e,$8c,$3a,$37,$32,$00,$2e,$86 ; [$9b45]
                                                                       ; byte
    db $27,$2b,$2e,$32,$35,$32,$2e,$2b,$25,$29,$2c,$30,$33,$30,$8c,$2f ; [$9b55]
                                                                       ; byte
    db $b0,$00,$8c,$32,$37,$3a,$3e,$b0,$00,$fc,$00,$98,$37,$8c,$39,$3b ; [$9b65]
                                                                       ; byte
    db $00,$28,$00,$00,$37,$37,$39,$3b,$00,$37,$2b,$2f,$30,$39,$00,$98 ; [$9b75]
                                                                       ; byte
    db $39,$8c,$35,$30,$35,$39,$3c,$39,$29,$29,$2d,$00,$86,$3b,$3c,$98 ; [$9b85]
                                                                       ; byte
    db $3d,$8c,$3a,$35,$00,$31,$35,$3a,$3d,$3d,$3a,$35,$00,$31,$35,$31 ; [$9b95]
                                                                       ; byte
    db $86,$3a,$32,$3a,$33,$3a,$32,$36,$2e,$33,$2a,$2e,$27,$2a,$22,$2e ; [$9ba5]
                                                                       ; byte
    db $27,$8c,$2b,$2b,$2a,$00,$f4,$ff      ; [$9bb5] byte

;
; XREFS:
;     MUSIC_LOOKUP_CONFLATE [$PRG5::8f17]
;
MUSIC_CONFLATE_3:                           ; [$9bbd]
    db $fd,$02,$b0,$00,$8c,$10,$10,$13,$10,$17,$17,$10,$86,$1c,$10,$8c ; [$9bbd]
                                                                       ; byte
    db $10,$10,$13,$10,$17,$17,$10,$86,$1c,$10,$8c,$11,$11,$15,$11,$18 ; [$9bcd]
                                                                       ; byte
    db $18,$11,$86,$1d,$11,$8c,$15,$18,$1c,$98,$1f,$8c,$1c,$15,$86,$21 ; [$9bdd]
                                                                       ; byte
    db $15,$8c,$13,$13,$16,$13,$1a,$1a,$13,$86,$1f,$13,$8c,$0f,$0f,$16 ; [$9bed]
                                                                       ; byte
    db $86,$1b,$0f,$8c,$0d,$0d,$14,$86,$19,$0d,$a4,$13,$86,$14,$15,$8c ; [$9bfd]
                                                                       ; byte
    db $16,$1a,$1f,$13,$fb,$01,$b0,$00,$fc,$fb,$02,$8c,$00,$1f,$1d,$1b ; [$9c0d]
                                                                       ; byte
    db $1a,$16,$13,$14,$15,$1c,$23,$1f,$21,$1c,$00,$13,$15,$1c,$23,$1f ; [$9c1d]
                                                                       ; byte
    db $21,$13,$15,$10,$11,$18,$21,$1d,$1f,$1d,$00,$0c,$11,$18,$21,$1f ; [$9c2d]
                                                                       ; byte
    db $00,$1d,$18,$11,$16,$1d,$22,$1d,$24,$22,$00,$11,$16,$1d,$24,$22 ; [$9c3d]
                                                                       ; byte
    db $00,$1d,$16,$11,$0f,$16,$1b,$16,$1d,$1b,$16,$0f,$0e,$0e,$0e,$00 ; [$9c4d]
                                                                       ; byte
    db $f4,$ff                              ; [$9c5d] byte

;
; XREFS:
;     MUSIC_LOOKUP_CONFLATE [$PRG5::8f19]
;
MUSIC_CONFLATE_4:                           ; [$9c5f]
    db $fd,$02,$86,$31,$00,$00,$00,$31,$00,$00,$00,$86,$31,$00,$31,$00 ; [$9c5f]
                                                                       ; byte
    db $8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21,$86,$31,$00,$31,$00,$31 ; [$9c6f]
                                                                       ; byte
    db $00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21,$86,$31,$00,$31,$00 ; [$9c7f]
                                                                       ; byte
    db $31,$00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21,$21,$86,$31,$00 ; [$9c8f]
                                                                       ; byte
    db $31,$00,$31,$00,$31,$00,$31,$00,$8c,$21,$21,$86,$21,$21,$31,$00 ; [$9c9f]
                                                                       ; byte
    db $31,$00,$8c,$21,$21,$86,$31,$00,$31,$00,$8c,$21,$86,$31,$00,$31 ; [$9caf]
                                                                       ; byte
    db $00,$31,$00,$8c,$21,$86,$31,$00,$31,$00,$8c,$21,$86,$31,$00,$8c ; [$9cbf]
                                                                       ; byte
    db $21,$86,$31,$00,$00,$00,$31,$00,$00,$00,$8c,$21,$21,$21,$21,$fb ; [$9ccf]
                                                                       ; byte
    db $01,$8c,$00,$86,$31,$31,$8c,$21,$00,$fc,$fb,$02,$b0,$00,$8c,$00 ; [$9cdf]
                                                                       ; byte
    db $31,$86,$31,$31,$31,$00,$8c,$00,$00,$31,$00,$00,$31,$00,$00,$00 ; [$9cef]
                                                                       ; byte
    db $00,$31,$00,$00,$31,$00,$00,$00,$00,$31,$00,$00,$31,$00,$00,$00 ; [$9cff]
                                                                       ; byte
    db $00,$31,$00,$00,$31,$00,$86,$31,$31,$8c,$00,$00,$31,$00,$00,$31 ; [$9d0f]
                                                                       ; byte
    db $00,$00,$00,$00,$31,$00,$00,$31,$00,$00,$00,$00,$31,$00,$00,$31 ; [$9d1f]
                                                                       ; byte
    db $31,$00,$31,$31,$31,$00,$f4,$ff,$ff  ; [$9d2f] byte


;============================================================================
; Music for Forepaw.
;
; XREFS:
;     MUSIC_LOOKUP_FOREPAW [$PRG5::8f1b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_FOREPAW [$PRG5::8f1b]
;
MUSIC_FOREPAW_1:                            ; [$9d38]
    db $f1,$03,$f2,$50,$f0,$00,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$26,$1f ; [$9d38]
                                                                       ; byte
    db $22,$2a,$26,$1f,$22,$2a,$26,$f9,$fd,$02,$90,$1f,$22,$2a,$26,$1f ; [$9d48]
                                                                       ; byte
    db $22,$2a,$26,$1f,$22,$2a,$26,$1f,$22,$2a,$26,$1f,$22,$2a,$26,$1f ; [$9d58]
                                                                       ; byte
    db $22,$2a,$26,$1f,$22,$2a,$26,$1f,$22,$2a,$26,$fc,$fd,$02,$a0,$32 ; [$9d68]
                                                                       ; byte
    db $33,$c0,$38,$a0,$36,$37,$c0,$3e,$a0,$3d,$39,$3c,$3b,$c0,$37,$32 ; [$9d78]
                                                                       ; byte
    db $fc,$fd,$02,$90,$26,$29,$2c,$34,$2c,$29,$26,$29,$26,$29,$2c,$34 ; [$9d88]
                                                                       ; byte
    db $2c,$29,$26,$29,$2b,$2e,$31,$39,$31,$2e,$2b,$2e,$2b,$2e,$31,$39 ; [$9d98]
                                                                       ; byte
    db $31,$2e,$2b,$25,$fc,$fe,$ff          ; [$9da8] byte

;
; XREFS:
;     MUSIC_LOOKUP_FOREPAW [$PRG5::8f1d]
;
MUSIC_FOREPAW_2:                            ; [$9daf]
    db $f1,$05,$f2,$90,$f0,$00,$ee,$02,$f2,$11,$88,$00,$90,$1f,$22,$2a ; [$9daf]
                                                                       ; byte
    db $26,$1f,$22,$2a,$90,$26,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$88,$26 ; [$9dbf]
                                                                       ; byte
    db $f9,$fd,$02,$88,$00,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$90,$26,$90 ; [$9dcf]
                                                                       ; byte
    db $1f,$22,$2a,$26,$1f,$22,$2a,$90,$26,$90,$1f,$22,$2a,$26,$1f,$22 ; [$9ddf]
                                                                       ; byte
    db $2a,$90,$26,$90,$1f,$22,$2a,$26,$1f,$22,$2a,$88,$26,$fc,$fd,$02 ; [$9def]
                                                                       ; byte
    db $88,$00,$32,$2d,$2a,$28,$33,$2d,$2a,$28,$38,$32,$2d,$2a,$28,$26 ; [$9dff]
                                                                       ; byte
    db $21,$1f,$36,$32,$2d,$2a,$37,$32,$2c,$28,$3e,$3b,$34,$2f,$2a,$27 ; [$9e0f]
                                                                       ; byte
    db $26,$26,$3d,$39,$36,$32,$39,$36,$32,$2d,$3c,$39,$34,$2d,$3b,$36 ; [$9e1f]
                                                                       ; byte
    db $34,$2f,$37,$32,$2f,$2b,$2a,$26,$23,$1f,$32,$2f,$2b,$28,$26,$23 ; [$9e2f]
                                                                       ; byte
    db $1f,$fc,$f1,$02,$fd,$02,$88,$00,$90,$26,$29,$2c,$34,$2c,$29,$26 ; [$9e3f]
                                                                       ; byte
    db $88,$29,$29,$90,$26,$29,$2c,$34,$2c,$29,$26,$90,$29,$90,$2b,$2e ; [$9e4f]
                                                                       ; byte
    db $31,$39,$31,$2e,$2b,$90,$2e,$90,$2b,$2e,$31,$39,$31,$2e,$2b,$88 ; [$9e5f]
                                                                       ; byte
    db $25,$fc,$fe,$ff                      ; [$9e6f] byte

;
; XREFS:
;     MUSIC_LOOKUP_FOREPAW [$PRG5::8f1f]
;
MUSIC_FOREPAW_3:                            ; [$9e73]
    db $f3,$80,$00,$00,$f9,$fd,$02,$90,$36,$37,$c0,$39,$90,$36,$37,$c0 ; [$9e73]
                                                                       ; byte
    db $34,$2d,$90,$36,$37,$c0,$39,$90,$36,$37,$34,$33,$32,$d0,$2d,$fc ; [$9e83]
                                                                       ; byte
    db $fd,$04,$88,$1a,$00,$a0,$1a,$88,$1a,$1a,$1a,$00,$a0,$1a,$88,$1a ; [$9e93]
                                                                       ; byte
    db $1a,$1a,$00,$a0,$1a,$88,$1a,$1a,$1a,$00,$a0,$1a,$88,$1a,$1a,$fc ; [$9ea3]
                                                                       ; byte
    db $fd,$02,$b0,$00,$88,$28,$20,$90,$1a,$1d,$a0,$00,$b0,$00,$88,$28 ; [$9eb3]
                                                                       ; byte
    db $20,$90,$1a,$1d,$a0,$00,$b0,$00,$88,$2d,$25,$90,$1f,$22,$a0,$00 ; [$9ec3]
                                                                       ; byte
    db $b0,$00,$88,$2d,$25,$90,$1f,$22,$a0,$19,$fc,$fe,$ff ; [$9ed3] byte

;
; XREFS:
;     MUSIC_LOOKUP_FOREPAW [$PRG5::8f21]
;
MUSIC_FOREPAW_4:                            ; [$9ee0]
    db $ff,$ff                              ; [$9ee0] byte


;============================================================================
; Music for Tower.
;
; XREFS:
;     MUSIC_LOOKUP_TOWER [$PRG5::8f23]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_TOWER [$PRG5::8f23]
;
MUSIC_TOWER_1:                              ; [$9ee2]
    db $f1,$02,$f2,$90,$f0,$00,$fd,$02,$88,$00,$3c,$3b,$37,$00,$00,$00 ; [$9ee2]
                                                                       ; byte
    db $00,$00,$3a,$39,$35,$38,$00,$00,$00,$fc,$fd,$02,$88,$00,$3c,$3b ; [$9ef2]
                                                                       ; byte
    db $98,$37,$88,$38,$37,$00,$3a,$39,$35,$38,$39,$38,$00,$fc,$fd,$02 ; [$9f02]
                                                                       ; byte
    db $88,$35,$35,$35,$35,$90,$34,$00,$b0,$00,$88,$35,$35,$35,$35,$90 ; [$9f12]
                                                                       ; byte
    db $34,$c0,$00,$90,$35,$37,$37,$38,$38,$3a,$3a,$3c,$3c,$3d,$a0,$35 ; [$9f22]
                                                                       ; byte
    db $34,$00,$30,$88,$35,$37,$00,$37,$00,$37,$35,$30,$37,$37,$35,$00 ; [$9f32]
                                                                       ; byte
    db $37,$00,$38,$37,$e0,$00,$88,$30,$31,$30,$00,$fc,$fd,$02,$98,$31 ; [$9f42]
                                                                       ; byte
    db $30,$90,$35,$a0,$34,$35,$98,$37,$34,$90,$35,$a0,$3d,$88,$37,$35 ; [$9f52]
                                                                       ; byte
    db $34,$33,$fc,$f4,$ff                  ; [$9f62] byte

;
; XREFS:
;     MUSIC_LOOKUP_TOWER [$PRG5::8f25]
;
MUSIC_TOWER_2:                              ; [$9f67]
    db $f1,$02,$f2,$90,$f0,$00,$ee,$04,$fd,$02,$88,$00,$30,$2f,$2b,$00 ; [$9f67]
                                                                       ; byte
    db $00,$00,$00,$00,$2e,$2d,$29,$2c,$00,$00,$00,$fc,$ee,$00,$fd,$02 ; [$9f77]
                                                                       ; byte
    db $88,$00,$37,$36,$98,$32,$88,$33,$32,$00,$35,$34,$30,$33,$34,$33 ; [$9f87]
                                                                       ; byte
    db $00,$fc,$fd,$02,$88,$30,$30,$30,$30,$90,$2f,$00,$b0,$00,$88,$00 ; [$9f97]
                                                                       ; byte
    db $00,$30,$30,$90,$2f,$c0,$00,$90,$2c,$30,$30,$35,$35,$37,$37,$38 ; [$9fa7]
                                                                       ; byte
    db $38,$3a,$a0,$30,$2f,$00,$2e,$88,$30,$34,$00,$34,$00,$34,$30,$2c ; [$9fb7]
                                                                       ; byte
    db $34,$34,$32,$00,$34,$00,$35,$34,$e0,$00,$88,$30,$2f,$2e,$00,$fc ; [$9fc7]
                                                                       ; byte
    db $f1,$07,$ee,$01,$fd,$02,$88,$00,$98,$31,$30,$90,$35,$a0,$34,$a0 ; [$9fd7]
                                                                       ; byte
    db $35,$98,$37,$34,$90,$35,$9c,$3d,$88,$37,$35,$34,$84,$33,$f1,$04 ; [$9fe7]
                                                                       ; byte
    db $fc,$f4,$ff                          ; [$9ff7] byte

;
; XREFS:
;     MUSIC_LOOKUP_TOWER [$PRG5::8f27]
;
MUSIC_TOWER_3:                              ; [$9ffa]
    db $fd,$02,$88,$18,$00,$00,$18,$00,$00,$18,$00,$18,$00,$00,$18,$00 ; [$9ffa]
                                                                       ; byte
    db $00,$18,$18,$90,$18,$88,$00,$18,$00,$00,$90,$18,$18,$88,$00,$18 ; [$a00a]
                                                                       ; byte
    db $00,$0c,$18,$0c,$fc,$fd,$02,$88,$14,$14,$14,$14,$90,$13,$88,$18 ; [$a01a]
                                                                       ; byte
    db $19,$00,$19,$18,$13,$90,$0c,$88,$00,$00,$14,$14,$90,$13,$00,$88 ; [$a02a]
                                                                       ; byte
    db $17,$18,$0c,$0d,$0e,$00,$90,$00,$88,$20,$18,$11,$11,$00,$11,$1d ; [$a03a]
                                                                       ; byte
    db $1d,$1c,$18,$11,$11,$00,$11,$1d,$1d,$1c,$18,$a0,$14,$90,$13,$88 ; [$a04a]
                                                                       ; byte
    db $1f,$13,$a0,$00,$98,$1f,$88,$18,$90,$0c,$88,$00,$18,$00,$18,$0c ; [$a05a]
                                                                       ; byte
    db $0c,$90,$0c,$88,$00,$18,$00,$18,$0c,$0c,$00,$00,$1f,$24,$1e,$1d ; [$a06a]
                                                                       ; byte
    db $1c,$14,$a0,$13,$88,$18,$17,$18,$00,$fc,$fd,$02,$90,$13,$88,$00 ; [$a07a]
                                                                       ; byte
    db $90,$13,$88,$00,$13,$00,$13,$00,$00,$13,$00,$00,$13,$13,$fc,$fd ; [$a08a]
                                                                       ; byte
    db $02,$90,$13,$88,$1f,$90,$13,$88,$1f,$13,$1f,$13,$13,$1f,$90,$13 ; [$a09a]
                                                                       ; byte
    db $88,$1f,$13,$1f,$fc,$f4,$ff          ; [$a0aa] byte

;
; XREFS:
;     MUSIC_LOOKUP_TOWER [$PRG5::8f29]
;
MUSIC_TOWER_4:                              ; [$a0b1]
    db $fd,$04,$88,$21,$31,$31,$21,$31,$31,$21,$31,$21,$31,$31,$21,$31 ; [$a0b1]
                                                                       ; byte
    db $31,$21,$31,$fc,$fd,$02,$88,$21,$21,$21,$21,$21,$00,$31,$31,$31 ; [$a0c1]
                                                                       ; byte
    db $31,$31,$31,$21,$00,$00,$21,$11,$11,$11,$00,$85,$31,$31,$86,$31 ; [$a0d1]
                                                                       ; byte
    db $88,$31,$31,$31,$31,$21,$00,$21,$00,$21,$21,$31,$00,$31,$00,$31 ; [$a0e1]
                                                                       ; byte
    db $31,$21,$00,$31,$00,$31,$31,$31,$31,$21,$21,$31,$00,$31,$00,$31 ; [$a0f1]
                                                                       ; byte
    db $00,$31,$00,$85,$31,$31,$86,$31,$88,$31,$31,$21,$21,$31,$00,$31 ; [$a101]
                                                                       ; byte
    db $31,$31,$31,$21,$31,$31,$31,$31,$31,$31,$31,$21,$31,$31,$31,$a0 ; [$a111]
                                                                       ; byte
    db $00,$88,$21,$21,$21,$21,$85,$31,$31,$86,$31,$88,$31,$31,$85,$31 ; [$a121]
                                                                       ; byte
    db $31,$86,$31,$88,$21,$21,$fc,$fd,$02,$88,$31,$00,$00,$31,$00,$00 ; [$a131]
                                                                       ; byte
    db $31,$00,$31,$00,$00,$31,$00,$00,$31,$31,$fc,$fd,$02,$88,$31,$11 ; [$a141]
                                                                       ; byte
    db $11,$31,$11,$11,$31,$11,$31,$11,$11,$31,$11,$11,$31,$31,$fc,$f4 ; [$a151]
                                                                       ; byte
    db $ff,$ff                              ; [$a161] byte


;============================================================================
; Music for Eolis.
;
; XREFS:
;     MUSIC_LOOKUP_EOLIS [$PRG5::8f2b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_EOLIS [$PRG5::8f2b]
;
MUSIC_EOLIS_1:                              ; [$a163]
    db $f1,$02,$f2,$90,$f0,$01,$e0,$00,$00,$00,$b0,$00,$8c,$00,$34,$36 ; [$a163]
                                                                       ; byte
    db $38,$fd,$02,$98,$39,$8c,$38,$3b,$39,$3b,$3c,$3e,$40,$41,$3f,$40 ; [$a173]
                                                                       ; byte
    db $b0,$00,$98,$37,$8c,$36,$39,$37,$39,$3a,$3c,$3e,$3f,$3d,$3e,$b0 ; [$a183]
                                                                       ; byte
    db $00,$a4,$3f,$8c,$43,$41,$3c,$00,$3e,$00,$3e,$41,$3f,$00,$3a,$37 ; [$a193]
                                                                       ; byte
    db $00,$38,$3c,$38,$3f,$00,$3f,$00,$38,$fb,$01,$8c,$3c,$38,$3f,$00 ; [$a1a3]
                                                                       ; byte
    db $00,$34,$36,$38,$fc,$fb,$02,$8c,$3c,$38,$3f,$00,$3f,$34,$2f,$2c ; [$a1b3]
                                                                       ; byte
    db $2d,$34,$2d,$32,$00,$2f,$2b,$00,$fd,$02,$b0,$40,$98,$39,$40,$3f ; [$a1c3]
                                                                       ; byte
    db $8c,$41,$98,$40,$8c,$3c,$39,$34,$38,$38,$3b,$39,$b0,$00,$98,$32 ; [$a1d3]
                                                                       ; byte
    db $8c,$34,$30,$b0,$00,$fc,$fd,$02,$b0,$00,$8c,$00,$2d,$98,$00,$00 ; [$a1e3]
                                                                       ; byte
    db $8c,$00,$28,$2d,$2c,$29,$26,$b0,$00,$8c,$00,$2d,$98,$00,$8c,$00 ; [$a1f3]
                                                                       ; byte
    db $34,$33,$2f,$32,$31,$2d,$30,$fc,$2d,$00,$c8,$00,$e0,$00,$00,$b0 ; [$a203]
                                                                       ; byte
    db $00,$8c,$00,$2b,$2a,$29,$f4,$ff      ; [$a213] byte

;
; XREFS:
;     MUSIC_LOOKUP_EOLIS [$PRG5::8f2d]
;
MUSIC_EOLIS_2:                              ; [$a21b]
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
    db $00,$26,$25,$24,$f4,$ff              ; [$a2cb] byte

;
; XREFS:
;     MUSIC_LOOKUP_EOLIS [$PRG5::8f2f]
;
MUSIC_EOLIS_3:                              ; [$a2d1]
    db $8c,$15,$00,$21,$15,$1a,$1c,$00,$10,$13,$15,$21,$15,$1a,$1c,$00 ; [$a2d1]
                                                                       ; byte
    db $10,$15,$00,$21,$15,$1a,$1c,$10,$13,$15,$17,$18,$1a,$00,$1c,$17 ; [$a2e1]
                                                                       ; byte
    db $10,$fd,$02,$98,$15,$8c,$21,$1c,$10,$1c,$00,$10,$15,$1f,$21,$1c ; [$a2f1]
                                                                       ; byte
    db $00,$18,$15,$10,$98,$13,$8c,$1f,$1a,$0e,$1a,$00,$0e,$13,$1d,$1f ; [$a301]
                                                                       ; byte
    db $1a,$00,$16,$13,$0e,$0c,$0c,$18,$0c,$11,$1d,$00,$11,$16,$00,$22 ; [$a311]
                                                                       ; byte
    db $0f,$00,$1b,$16,$0f,$14,$1a,$14,$1b,$00,$1b,$00,$0f,$fb,$01,$8c ; [$a321]
                                                                       ; byte
    db $14,$20,$14,$11,$10,$10,$12,$14,$fc,$fb,$02,$8c,$14,$20,$14,$00 ; [$a331]
                                                                       ; byte
    db $10,$10,$12,$14,$15,$1c,$15,$1a,$00,$17,$13,$00,$fd,$02,$8c,$15 ; [$a341]
                                                                       ; byte
    db $00,$21,$10,$13,$15,$00,$10,$14,$17,$10,$15,$00,$21,$1c,$15,$98 ; [$a351]
                                                                       ; byte
    db $10,$8c,$1c,$15,$00,$20,$21,$1c,$10,$12,$14,$15,$00,$1c,$1b,$1a ; [$a361]
                                                                       ; byte
    db $fc,$fd,$02,$8c,$1c,$10,$11,$10,$00,$11,$00,$10,$1c,$10,$11,$10 ; [$a371]
                                                                       ; byte
    db $00,$1c,$1b,$17,$10,$10,$11,$10,$00,$11,$00,$10,$00,$10,$11,$10 ; [$a381]
                                                                       ; byte
    db $00,$12,$11,$10,$fc,$15,$00,$21,$15,$1a,$1c,$00,$10,$13,$15,$21 ; [$a391]
                                                                       ; byte
    db $15,$1a,$1c,$10,$13,$15,$00,$21,$15,$1a,$1c,$00,$10,$13,$15,$21 ; [$a3a1]
                                                                       ; byte
    db $20,$00,$15,$14,$13,$f4,$ff          ; [$a3b1] byte

;
; XREFS:
;     MUSIC_LOOKUP_EOLIS [$PRG5::8f31]
;
MUSIC_EOLIS_4:                              ; [$a3b8]
    db $8c,$3c,$3c,$30,$3c,$3c,$30,$3c,$3c,$3c,$3c,$30,$3c,$3c,$30,$3c ; [$a3b8]
                                                                       ; byte
    db $3c,$3c,$3c,$30,$3c,$3c,$30,$3c,$3c,$30,$30,$30,$30,$00,$3c,$3c ; [$a3c8]
                                                                       ; byte
    db $3c,$fd,$02,$8c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c ; [$a3d8]
                                                                       ; byte
    db $3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c ; [$a3e8]
                                                                       ; byte
    db $3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c ; [$a3f8]
                                                                       ; byte
    db $3c,$30,$30,$30,$3c,$3c,$30,$3c,$3c,$30,$3c,$3c,$fb,$01,$8c,$3c ; [$a408]
                                                                       ; byte
    db $3c,$30,$3c,$3c,$30,$3c,$3c,$fc,$fb,$02,$8c,$3c,$3c,$30,$3c,$30 ; [$a418]
                                                                       ; byte
    db $3c,$3c,$3c,$30,$30,$30,$30,$00,$30,$30,$00,$fd,$02,$8c,$3c,$3c ; [$a428]
                                                                       ; byte
    db $30,$3c,$3c,$30,$00,$3c,$3c,$3c,$30,$3c,$3c,$30,$00,$3c,$3c,$3c ; [$a438]
                                                                       ; byte
    db $30,$3c,$3c,$30,$00,$3c,$3c,$3c,$30,$3c,$3c,$30,$30,$30,$fc,$fd ; [$a448]
                                                                       ; byte
    db $02,$8c,$3c,$3c,$3c,$3c,$3c,$30,$3c,$3c,$3c,$3c,$3c,$3c,$3c,$30 ; [$a458]
                                                                       ; byte
    db $30,$30,$3c,$3c,$3c,$3c,$3c,$30,$3c,$3c,$3c,$30,$3c,$3c,$3c,$3c ; [$a468]
                                                                       ; byte
    db $86,$3c,$3c,$8c,$30,$fc,$3c,$00,$30,$3c,$3c,$30,$3c,$3c,$3c,$00 ; [$a478]
                                                                       ; byte
    db $30,$3c,$3c,$30,$3c,$3c,$3c,$00,$30,$3c,$3c,$30,$3c,$3c,$3c,$3c ; [$a488]
                                                                       ; byte
    db $30,$3c,$3c,$30,$30,$30,$f4,$ff,$ff  ; [$a498] byte


;============================================================================
; Music for the death screen.
;
; XREFS:
;     MUSIC_LOOKUP_DEATH [$PRG5::8f33]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_DEATH [$PRG5::8f33]
;
MUSIC_DEATH_1:                              ; [$a4a1]
    db $f1,$04,$f2,$90,$f0,$02,$fd,$02,$a0,$34,$90,$33,$34,$a0,$36,$90 ; [$a4a1]
                                                                       ; byte
    db $3b,$b0,$37,$90,$36,$37,$a0,$39,$90,$3e,$c0,$3b,$90,$37,$3c,$3b ; [$a4b1]
                                                                       ; byte
    db $39,$37,$b0,$39,$90,$36,$3b,$39,$37,$36,$fc,$fd,$02,$a0,$34,$90 ; [$a4c1]
                                                                       ; byte
    db $33,$34,$a0,$36,$90,$3b,$b0,$37,$90,$36,$37,$a0,$39,$90,$3e,$c0 ; [$a4d1]
                                                                       ; byte
    db $3b,$90,$37,$3c,$3b,$39,$37,$fb,$01,$b0,$39,$90,$36,$3b,$39,$37 ; [$a4e1]
                                                                       ; byte
    db $36,$fc,$fb,$02,$90,$39,$37,$36,$b0,$3b,$a0,$2f,$90,$3b,$3b,$3b ; [$a4f1]
                                                                       ; byte
    db $3b,$a0,$3b,$90,$3e,$d0,$3c,$90,$3c,$3b,$39,$37,$a0,$36,$40,$3e ; [$a501]
                                                                       ; byte
    db $39,$b0,$3c,$a0,$3b,$90,$3b,$3c,$3e,$b0,$40,$90,$37,$c0,$37,$a0 ; [$a511]
                                                                       ; byte
    db $3e,$3c,$37,$39,$d6,$3b,$95,$39,$37,$a0,$36,$e0,$00,$f4,$ff ; [$a521]
                                                                   ; byte

;
; XREFS:
;     MUSIC_LOOKUP_DEATH [$PRG5::8f35]
;
MUSIC_DEATH_2:                              ; [$a530]
    db $f1,$06,$f2,$90,$f0,$02,$f3,$80,$00,$00,$00,$00,$fd,$02,$a0,$2b ; [$a530]
                                                                       ; byte
    db $90,$2a,$2b,$a0,$2d,$90,$2a,$b0,$2f,$90,$2d,$2f,$a0,$30,$90,$36 ; [$a540]
                                                                       ; byte
    db $c0,$32,$90,$2f,$34,$32,$30,$2f,$b0,$34,$90,$31,$33,$31,$2f,$2d ; [$a550]
                                                                       ; byte
    db $fc,$2b,$28,$2a,$2b,$2d,$2a,$2d,$2f,$26,$2b,$2d,$2f,$30,$2d,$36 ; [$a560]
                                                                       ; byte
    db $32,$2b,$2f,$2b,$2f,$34,$32,$30,$2f,$31,$34,$31,$a0,$33,$90,$2b ; [$a570]
                                                                       ; byte
    db $a0,$2a,$90,$38,$38,$38,$38,$a0,$38,$90,$3b,$d0,$39,$90,$39,$37 ; [$a580]
                                                                       ; byte
    db $36,$34,$a0,$32,$3c,$39,$36,$b0,$38,$a0,$37,$90,$37,$39,$3b,$b0 ; [$a590]
                                                                       ; byte
    db $3c,$90,$34,$a0,$34,$90,$30,$34,$39,$32,$39,$30,$34,$2b,$34,$2d ; [$a5a0]
                                                                       ; byte
    db $d6,$34,$95,$36,$34,$a0,$33,$e0,$00,$f4,$ff ; [$a5b0] byte

;
; XREFS:
;     MUSIC_LOOKUP_DEATH [$PRG5::8f37]
;
MUSIC_DEATH_3:                              ; [$a5bb]
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
    db $ff                                  ; [$a65b] byte

;
; XREFS:
;     MUSIC_LOOKUP_DEATH [$PRG5::8f39]
;
MUSIC_DEATH_4:                              ; [$a65c]
    db $ff,$ff                              ; [$a65c] byte


;============================================================================
; Music for Macon/Victim.
;
; XREFS:
;     MUSIC_LOOKUP_MASCON_VICTIM [$PRG5::8f3b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_MASCON_VICTIM [$PRG5::8f3b]
;
MUSIC_MASCON_VICTIM_1:                      ; [$a65e]
    db $f1,$02,$f2,$50,$f0,$00,$f3,$a0,$00,$00,$00,$00,$fd,$03,$8a,$00 ; [$a65e]
                                                                       ; byte
    db $00,$2d,$00,$00,$2f,$00,$00,$30,$00,$00,$2f,$00,$00,$00,$2d,$00 ; [$a66e]
                                                                       ; byte
    db $2d,$2c,$2d,$2f,$00,$2f,$00,$30,$00,$30,$2f,$00,$00,$00,$00,$00 ; [$a67e]
                                                                       ; byte
    db $00,$2b,$00,$00,$2d,$00,$00,$2e,$00,$00,$2d,$00,$00,$00,$2b,$00 ; [$a68e]
                                                                       ; byte
    db $2b,$2a,$2b,$2d,$00,$2d,$00,$2e,$00,$2e,$2d,$00,$00,$00,$00,$fc ; [$a69e]
                                                                       ; byte
    db $f4,$ff                              ; [$a6ae] byte

;
; XREFS:
;     MUSIC_LOOKUP_MASCON_VICTIM [$PRG5::8f3d]
;
MUSIC_MASCON_VICTIM_2:                      ; [$a6b0]
    db $f1,$02,$f2,$90,$f3,$a0,$00,$00,$00,$00,$fd,$03,$8a,$00,$00,$29 ; [$a6b0]
                                                                       ; byte
    db $00,$00,$2b,$00,$00,$2d,$00,$00,$2b,$00,$00,$00,$29,$00,$29,$28 ; [$a6c0]
                                                                       ; byte
    db $29,$2b,$00,$2b,$00,$2d,$00,$2d,$2b,$00,$00,$00,$00,$00,$00,$27 ; [$a6d0]
                                                                       ; byte
    db $00,$00,$29,$00,$00,$2b,$00,$00,$29,$00,$00,$00,$27,$00,$27,$26 ; [$a6e0]
                                                                       ; byte
    db $27,$29,$00,$29,$00,$2b,$00,$2b,$29,$00,$00,$00,$00,$fc,$f4,$ff ; [$a6f0]
                                                                       ; byte

;
; XREFS:
;     MUSIC_LOOKUP_MASCON_VICTIM [$PRG5::8f3f]
;
MUSIC_MASCON_VICTIM_3:                      ; [$a700]
    db $fd,$02,$8a,$1f,$00,$00,$00,$1f,$00,$00,$1f,$1f,$00,$1f,$00,$00 ; [$a700]
                                                                       ; byte
    db $00,$00,$00,$1f,$00,$1e,$1f,$00,$1f,$00,$1f,$1f,$00,$1f,$00,$00 ; [$a710]
                                                                       ; byte
    db $00,$1a,$18,$1d,$00,$00,$00,$1d,$00,$00,$1d,$1d,$00,$1d,$00,$00 ; [$a720]
                                                                       ; byte
    db $00,$00,$00,$1d,$00,$1c,$1d,$00,$1d,$00,$1d,$1d,$00,$1d,$00,$00 ; [$a730]
                                                                       ; byte
    db $00,$1d,$1e,$fc,$fd,$02,$8a,$13,$1f,$1f,$13,$13,$1f,$1f,$13,$13 ; [$a740]
                                                                       ; byte
    db $1f,$13,$1f,$1f,$13,$1f,$1f,$13,$1f,$12,$13,$1f,$13,$1f,$13,$13 ; [$a750]
                                                                       ; byte
    db $1f,$13,$13,$1f,$13,$0e,$0c,$11,$11,$1d,$1d,$11,$1d,$1d,$11,$11 ; [$a760]
                                                                       ; byte
    db $1d,$11,$1d,$1d,$11,$1d,$1d,$11,$1d,$10,$11,$1d,$11,$1d,$1d,$11 ; [$a770]
                                                                       ; byte
    db $1d,$11,$11,$1d,$11,$11,$12,$fc,$f4,$ff ; [$a780] byte

;
; XREFS:
;     MUSIC_LOOKUP_MASCON_VICTIM [$PRG5::8f41]
;
MUSIC_MASCON_VICTIM_4:                      ; [$a78a]
    db $fd,$08,$8a,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31 ; [$a78a]
                                                                       ; byte
    db $31,$85,$31,$31,$31,$31,$8a,$31,$31,$31,$31,$31,$31,$31,$31,$31 ; [$a79a]
                                                                       ; byte
    db $31,$31,$31,$85,$31,$31,$31,$31,$8a,$31,$31,$fc,$f4,$ff,$ff ; [$a7aa]
                                                                   ; byte


;============================================================================
; Music for boss battles.
;
; XREFS:
;     MUSIC_LOOKUP_BOSS [$PRG5::8f43]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_BOSS [$PRG5::8f43]
;
MUSIC_BOSS_1:                               ; [$a7b9]
    db $f1,$02,$f2,$90,$f0,$01,$fd,$02,$8f,$34,$28,$33,$27,$2f,$23,$2e ; [$a7b9]
                                                                       ; byte
    db $22,$34,$28,$33,$27,$2f,$23,$2e,$22,$35,$29,$34,$28,$30,$24,$2f ; [$a7c9]
                                                                       ; byte
    db $23,$35,$29,$34,$28,$30,$24,$2f,$23,$38,$37,$2c,$2d,$38,$37,$2c ; [$a7d9]
                                                                       ; byte
    db $2d,$97,$3a,$87,$39,$97,$2d,$87,$2e,$97,$3d,$87,$3c,$97,$30,$87 ; [$a7e9]
                                                                       ; byte
    db $31,$85,$43,$42,$41,$3c,$3b,$3a,$37,$36,$35,$30,$2f,$2c,$2b,$2a ; [$a7f9]
                                                                       ; byte
    db $29,$24,$23,$22,$18,$19,$1a,$1b,$1c,$1d,$fc,$f4,$ff ; [$a809] byte

;
; XREFS:
;     MUSIC_LOOKUP_BOSS [$PRG5::8f45]
;
MUSIC_BOSS_2:                               ; [$a816]
    db $f1,$04,$f2,$90,$f2,$17,$fd,$02,$88,$00,$8f,$34,$28,$33,$27,$2f ; [$a816]
                                                                       ; byte
    db $23,$2e,$22,$34,$28,$33,$27,$2f,$23,$2e,$22,$35,$29,$34,$28,$30 ; [$a826]
                                                                       ; byte
    db $24,$2f,$23,$35,$29,$34,$28,$30,$24,$2f,$23,$38,$37,$2c,$2d,$38 ; [$a836]
                                                                       ; byte
    db $37,$2c,$2d,$97,$3a,$87,$39,$97,$2d,$87,$2e,$97,$3d,$87,$3c,$97 ; [$a846]
                                                                       ; byte
    db $30,$87,$31,$85,$43,$42,$41,$3c,$3b,$3a,$37,$36,$35,$30,$2f,$2c ; [$a856]
                                                                       ; byte
    db $2b,$2a,$29,$24,$23,$22,$18,$19,$1a,$87,$1b,$fc,$f4,$ff ; [$a866] byte

;
; XREFS:
;     MUSIC_LOOKUP_BOSS [$PRG5::8f47]
;
MUSIC_BOSS_3:                               ; [$a874]
    db $fd,$02,$f6,$fd,$8a,$13,$14,$13,$14,$13,$14,$15,$14,$15,$14,$15 ; [$a874]
                                                                       ; byte
    db $14,$13,$14,$13,$14,$13,$14,$15,$14,$15,$14,$15,$14,$14,$15,$14 ; [$a884]
                                                                       ; byte
    db $15,$14,$15,$16,$15,$16,$15,$16,$15,$14,$15,$14,$15,$14,$15,$16 ; [$a894]
                                                                       ; byte
    db $15,$16,$15,$16,$15,$f6,$00,$88,$0f,$87,$1b,$88,$27,$87,$1b,$88 ; [$a8a4]
                                                                       ; byte
    db $0f,$87,$1b,$88,$27,$87,$1b,$88,$0f,$87,$1b,$88,$27,$87,$1b,$88 ; [$a8b4]
                                                                       ; byte
    db $0f,$87,$1b,$88,$27,$87,$1b,$88,$11,$87,$1d,$88,$29,$87,$1d,$88 ; [$a8c4]
                                                                       ; byte
    db $11,$87,$1d,$88,$29,$87,$1d,$88,$14,$87,$20,$88,$2c,$87,$20,$88 ; [$a8d4]
                                                                       ; byte
    db $14,$87,$20,$88,$2c,$87,$20,$94,$37,$38,$2f,$23,$8a,$29,$2a,$23 ; [$a8e4]
                                                                       ; byte
    db $24,$fc,$f4,$ff                      ; [$a8f4] byte

;
; XREFS:
;     MUSIC_LOOKUP_BOSS [$PRG5::8f49]
;
MUSIC_BOSS_4:                               ; [$a8f8]
    db $ff,$ff                              ; [$a8f8] byte


;============================================================================
; TODO: Music 0x0B
;
; XREFS:
;     MUSIC_LOOKUP_HOURGLASS [$PRG5::8f4b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_HOURGLASS [$PRG5::8f4b]
;
MUSIC_HOURGLASS_1:                          ; [$a8fa]
    db $f1,$02,$f2,$50,$f0,$01,$fd,$02,$f3,$80,$00,$c0,$00,$fc,$fd,$03 ; [$a8fa]
                                                                       ; byte
    db $84,$1f,$24,$1f,$00,$00,$00,$00,$00,$2b,$30,$2b,$00,$00,$00,$00 ; [$a90a]
                                                                       ; byte
    db $00,$24,$29,$24,$00,$00,$00,$00,$00,$30,$35,$30,$00,$00,$00,$00 ; [$a91a]
                                                                       ; byte
    db $00,$29,$2e,$29,$00,$00,$00,$00,$00,$35,$3a,$35,$00,$00,$00,$00 ; [$a92a]
                                                                       ; byte
    db $00,$fc,$f4,$ff                      ; [$a93a] byte

;
; XREFS:
;     MUSIC_LOOKUP_HOURGLASS [$PRG5::8f4d]
;
MUSIC_HOURGLASS_2:                          ; [$a93e]
    db $f1,$02,$f2,$90,$f2,$13,$fd,$02,$f3,$80,$00,$c0,$00,$fc,$fd,$03 ; [$a93e]
                                                                       ; byte
    db $84,$00,$1f,$24,$1f,$00,$00,$00,$00,$00,$2b,$30,$2b,$00,$00,$00 ; [$a94e]
                                                                       ; byte
    db $00,$00,$24,$29,$24,$00,$00,$00,$00,$00,$30,$35,$30,$00,$00,$00 ; [$a95e]
                                                                       ; byte
    db $00,$00,$29,$2e,$29,$00,$00,$00,$00,$00,$35,$3a,$35,$00,$00,$00 ; [$a96e]
                                                                       ; byte
    db $00,$fc,$f4,$ff                      ; [$a97e] byte

;
; XREFS:
;     MUSIC_LOOKUP_HOURGLASS [$PRG5::8f4f]
;
MUSIC_HOURGLASS_3:                          ; [$a982]
    db $fd,$02,$84,$0e,$00,$00,$00,$0e,$00,$00,$00,$1a,$00,$00,$00,$1a ; [$a982]
                                                                       ; byte
    db $00,$00,$00,$13,$00,$00,$00,$13,$00,$00,$00,$1f,$00,$00,$00,$1f ; [$a992]
                                                                       ; byte
    db $00,$00,$00,$18,$00,$00,$00,$18,$00,$00,$00,$24,$00,$00,$00,$24 ; [$a9a2]
                                                                       ; byte
    db $00,$00,$00,$fc,$fd,$02,$84,$0e,$00,$00,$00,$0e,$00,$00,$00,$1a ; [$a9b2]
                                                                       ; byte
    db $00,$00,$00,$1a,$00,$00,$00,$13,$00,$00,$00,$13,$00,$00,$00,$1f ; [$a9c2]
                                                                       ; byte
    db $00,$00,$00,$1f,$00,$00,$00,$18,$00,$00,$00,$18,$00,$00,$00,$24 ; [$a9d2]
                                                                       ; byte
    db $00,$00,$00,$24,$00,$00,$00,$fc,$0e,$00,$0e,$00,$0e,$00,$0e,$00 ; [$a9e2]
                                                                       ; byte
    db $1a,$00,$1a,$00,$1a,$00,$1a,$00,$13,$00,$13,$00,$13,$00,$13,$00 ; [$a9f2]
                                                                       ; byte
    db $1f,$00,$1f,$00,$1f,$00,$1f,$00,$18,$00,$18,$00,$18,$00,$18,$00 ; [$aa02]
                                                                       ; byte
    db $24,$00,$24,$00,$24,$00,$24,$00,$f4,$ff ; [$aa12] byte

;
; XREFS:
;     MUSIC_LOOKUP_HOURGLASS [$PRG5::8f51]
;
MUSIC_HOURGLASS_4:                          ; [$aa1c]
    db $fd,$03,$84,$31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31 ; [$aa1c]
                                                                       ; byte
    db $00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31 ; [$aa2c]
                                                                       ; byte
    db $00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31,$00,$00,$00,$31 ; [$aa3c]
                                                                       ; byte
    db $00,$00,$00,$fc,$fd,$02,$84,$31,$00,$31,$00,$31,$00,$31,$00,$31 ; [$aa4c]
                                                                       ; byte
    db $00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31 ; [$aa5c]
                                                                       ; byte
    db $00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31,$00,$31 ; [$aa6c]
                                                                       ; byte
    db $00,$31,$00,$31,$00,$31,$00,$fc,$f4,$ff,$ff ; [$aa7c] byte


;============================================================================
; Music for the ending outro sequence.
;
; XREFS:
;     MUSIC_LOOKUP_ENDING [$PRG5::8f53]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_ENDING [$PRG5::8f53]
;
MUSIC_ENDING_1:                             ; [$aa87]
    db $f7,$ff,$f1,$00,$f2,$d0,$f0,$01,$ef,$02,$f6,$f4,$86,$1f,$21,$23 ; [$aa87]
                                                                       ; byte
    db $24,$26,$28,$29,$2a,$2b,$2d,$2f,$30,$32,$34,$35,$36,$f2,$90,$fd ; [$aa97]
                                                                       ; byte
    db $02,$b0,$37,$3c,$3e,$45,$c8,$43,$8c,$3c,$3e,$3f,$3c,$3f,$3e,$00 ; [$aaa7]
                                                                       ; byte
    db $3b,$98,$37,$fc,$fd,$02,$a4,$43,$8c,$3c,$b0,$3c,$8c,$41,$41,$40 ; [$aab7]
                                                                       ; byte
    db $a4,$3c,$8c,$37,$39,$a4,$3a,$8c,$3a,$39,$3a,$39,$bc,$37,$fb,$01 ; [$aac7]
                                                                       ; byte
    db $86,$37,$39,$3b,$3c,$3e,$40,$41,$42,$fc,$fb,$02,$86,$3c,$3b,$3c ; [$aad7]
                                                                       ; byte
    db $3e,$40,$41,$42,$43,$b0,$44,$46,$c8,$43,$8c,$3c,$3e,$3f,$3f,$41 ; [$aae7]
                                                                       ; byte
    db $3e,$00,$3c,$3a,$98,$37,$86,$38,$37,$8c,$35,$92,$37,$86,$30,$33 ; [$aaf7]
                                                                       ; byte
    db $37,$3c,$37,$3c,$3f,$b0,$44,$46,$bc,$43,$8c,$3c,$3c,$3e,$3f,$3f ; [$ab07]
                                                                       ; byte
    db $41,$3e,$00,$3c,$98,$3a,$8c,$3f,$3f,$41,$3e,$00,$3c,$3a,$f3,$cc ; [$ab17]
                                                                       ; byte
    db $3c,$86,$3f,$00,$3c,$3f,$44,$00,$3f,$44,$46,$41,$3e,$3a,$3c,$00 ; [$ab27]
                                                                       ; byte
    db $3c,$3c,$88,$3c,$00,$00,$00,$3c,$37,$3c,$40,$98,$3c,$88,$00,$ff ; [$ab37]
                                                                       ; byte

;
; XREFS:
;     MUSIC_LOOKUP_ENDING [$PRG5::8f55]
;
MUSIC_ENDING_2:                             ; [$ab47]
    db $f1,$04,$f2,$d0,$f0,$00,$ef,$00,$f6,$f4,$f2,$13,$98,$00,$86,$2d ; [$ab47]
                                                                       ; byte
    db $2f,$30,$32,$34,$35,$37,$39,$3b,$3c,$3e,$3f,$f2,$50,$f0,$01,$fd ; [$ab57]
                                                                       ; byte
    db $02,$86,$40,$40,$40,$00,$48,$37,$40,$40,$40,$40,$40,$00,$48,$37 ; [$ab67]
                                                                       ; byte
    db $40,$40,$41,$41,$41,$00,$48,$39,$41,$41,$41,$41,$41,$00,$48,$39 ; [$ab77]
                                                                       ; byte
    db $41,$41,$40,$40,$40,$00,$48,$37,$40,$40,$40,$3c,$37,$3c,$40,$40 ; [$ab87]
                                                                       ; byte
    db $43,$43,$38,$3c,$3f,$44,$48,$44,$37,$00,$00,$00,$2e,$32,$37,$3b ; [$ab97]
                                                                       ; byte
    db $3e,$3b,$fc,$fd,$02,$86,$40,$43,$37,$3c,$40,$43,$37,$3c,$40,$43 ; [$aba7]
                                                                       ; byte
    db $37,$3c,$40,$43,$37,$3c,$41,$43,$37,$3c,$40,$43,$37,$3c,$40,$43 ; [$abb7]
                                                                       ; byte
    db $37,$3c,$40,$43,$3c,$40,$33,$37,$3a,$3f,$43,$3f,$3a,$37,$35,$39 ; [$abc7]
                                                                       ; byte
    db $3c,$41,$3c,$39,$37,$32,$fb,$01,$86,$37,$3c,$40,$3c,$37,$3c,$40 ; [$abd7]
                                                                       ; byte
    db $3c,$40,$41,$43,$45,$47,$48,$4a,$4b,$fc,$fb,$02,$86,$37,$3c,$40 ; [$abe7]
                                                                       ; byte
    db $3c,$37,$3c,$40,$3c,$40,$3f,$40,$41,$43,$45,$47,$48,$fd,$02,$86 ; [$abf7]
                                                                       ; byte
    db $38,$3c,$3f,$44,$48,$4b,$48,$44,$3a,$3e,$41,$46,$4a,$4d,$4a,$46 ; [$ac07]
                                                                       ; byte
    db $30,$34,$37,$3c,$40,$43,$48,$4c,$48,$43,$40,$3c,$37,$34,$30,$34 ; [$ac17]
                                                                       ; byte
    db $38,$3c,$3f,$44,$48,$44,$41,$3e,$3a,$35,$3a,$3e,$41,$3e,$3a,$3e ; [$ac27]
                                                                       ; byte
    db $fb,$01,$8c,$3f,$86,$41,$3f,$8c,$3c,$3c,$86,$30,$33,$37,$3c,$3f ; [$ac37]
                                                                       ; byte
    db $3c,$37,$33,$fc,$fb,$02,$86,$3f,$44,$48,$44,$3f,$44,$8c,$46,$00 ; [$ac47]
                                                                       ; byte
    db $41,$43,$92,$40,$86,$3c,$37,$3c,$34,$37,$30,$34,$40,$3c,$37,$3c ; [$ac57]
                                                                       ; byte
    db $34,$37,$30,$34,$3e,$3a,$35,$3a,$32,$35,$2e,$32,$3e,$3a,$35,$3a ; [$ac67]
                                                                       ; byte
    db $32,$35,$2e,$32,$3c,$38,$33,$38,$30,$33,$2c,$30,$41,$3e,$3a,$35 ; [$ac77]
                                                                       ; byte
    db $3e,$00,$3e,$3e,$88,$34,$00,$00,$00,$34,$30,$34,$37,$98,$34,$88 ; [$ac87]
                                                                       ; byte
    db $00,$ff                              ; [$ac97] byte

;
; XREFS:
;     MUSIC_LOOKUP_ENDING [$PRG5::8f57]
;
MUSIC_ENDING_3:                             ; [$ac99]
    db $f6,$e8,$b0,$00,$86,$3b,$3c,$3e,$40,$41,$43,$45,$47,$fd,$02,$86 ; [$ac99]
                                                                       ; byte
    db $30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30 ; [$aca9]
                                                                       ; byte
    db $30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30 ; [$acb9]
                                                                       ; byte
    db $30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30 ; [$acc9]
                                                                       ; byte
    db $2c,$2c,$38,$38,$2c,$2c,$2b,$00,$00,$00,$37,$37,$2b,$2b,$2b,$2b ; [$acd9]
                                                                       ; byte
    db $fc,$fd,$02,$86,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30 ; [$ace9]
                                                                       ; byte
    db $30,$00,$30,$30,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30 ; [$acf9]
                                                                       ; byte
    db $30,$00,$30,$30,$33,$33,$33,$33,$33,$00,$33,$33,$35,$35,$35,$35 ; [$ad09]
                                                                       ; byte
    db $35,$00,$35,$35,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30,$30 ; [$ad19]
                                                                       ; byte
    db $30,$00,$30,$30,$fc,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$2e,$2e ; [$ad29]
                                                                       ; byte
    db $2e,$2e,$2e,$2e,$2e,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30 ; [$ad39]
                                                                       ; byte
    db $30,$30,$00,$30,$30,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$00,$00,$00,$2e ; [$ad49]
                                                                       ; byte
    db $2e,$2e,$2e,$2e,$2e,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30 ; [$ad59]
                                                                       ; byte
    db $30,$30,$00,$30,$30,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$2e,$2e ; [$ad69]
                                                                       ; byte
    db $2e,$2e,$2e,$2e,$2e,$30,$30,$30,$30,$30,$00,$30,$30,$30,$30,$30 ; [$ad79]
                                                                       ; byte
    db $30,$30,$00,$30,$30,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$00,$00,$00,$2e ; [$ad89]
                                                                       ; byte
    db $2e,$2e,$2e,$2e,$2e,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$00,$00,$00,$2e ; [$ad99]
                                                                       ; byte
    db $2e,$2e,$2e,$8c,$30,$86,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30 ; [$ada9]
                                                                       ; byte
    db $30,$30,$30,$30,$30,$86,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2e,$2e ; [$adb9]
                                                                       ; byte
    db $2e,$2e,$2e,$00,$2e,$2e,$88,$30,$00,$00,$00,$30,$34,$30,$30,$98 ; [$adc9]
                                                                       ; byte
    db $30,$88,$00,$ff                      ; [$add9] byte

;
; XREFS:
;     MUSIC_LOOKUP_ENDING [$PRG5::8f59]
;
MUSIC_ENDING_4:                             ; [$addd]
    db $8c,$21,$86,$31,$31,$8c,$21,$86,$31,$31,$21,$21,$21,$21,$21,$21 ; [$addd]
                                                                       ; byte
    db $21,$21,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00 ; [$aded]
                                                                       ; byte
    db $31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$adfd]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86 ; [$ae0d]
                                                                       ; byte
    db $31,$31,$31,$00,$31,$31,$8c,$21,$21,$21,$21,$21,$21,$86,$31,$00 ; [$ae1d]
                                                                       ; byte
    db $8c,$21,$21,$86,$21,$21,$fc,$fd,$02,$86,$31,$00,$31,$31,$8c,$21 ; [$ae2d]
                                                                       ; byte
    db $86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31 ; [$ae3d]
                                                                       ; byte
    db $8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00 ; [$ae4d]
                                                                       ; byte
    db $31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$ae5d]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$21,$21,$21 ; [$ae6d]
                                                                       ; byte
    db $31,$fc,$fd,$02,$86,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00 ; [$ae7d]
                                                                       ; byte
    db $31,$31,$8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31 ; [$ae8d]
                                                                       ; byte
    db $31,$00,$31,$31,$8c,$21,$86,$31,$31,$fb,$01,$86,$31,$00,$31,$31 ; [$ae9d]
                                                                       ; byte
    db $8c,$21,$86,$31,$31,$31,$00,$31,$31,$8c,$21,$86,$31,$31,$31,$00 ; [$aead]
                                                                       ; byte
    db $31,$31,$8c,$21,$86,$31,$31,$31,$00,$8c,$21,$86,$21,$21,$21,$31 ; [$aebd]
                                                                       ; byte
    db $fc,$fb,$02,$8c,$21,$21,$21,$21,$86,$31,$00,$8c,$21,$21,$86,$21 ; [$aecd]
                                                                       ; byte
    db $21,$8c,$21,$21,$21,$21,$00,$21,$21,$21,$fd,$02,$86,$31,$00,$31 ; [$aedd]
                                                                       ; byte
    db $31,$31,$00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$fc,$86,$31 ; [$aeed]
                                                                       ; byte
    db $00,$31,$31,$31,$00,$31,$31,$31,$00,$31,$31,$86,$21,$00,$21,$21 ; [$aefd]
                                                                       ; byte
    db $88,$21,$00,$84,$21,$21,$21,$21,$88,$21,$21,$21,$21,$98,$21,$88 ; [$af0d]
                                                                       ; byte
    db $00,$ff,$ff                          ; [$af1d] byte


;============================================================================
; Music for the King's room.
;
; XREFS:
;     MUSIC_LOOKUP_KINGS_ROOM [$PRG5::8f5b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_KINGS_ROOM [$PRG5::8f5b]
;
MUSIC_KINGS_ROOM_1:                         ; [$af20]
    db $f1,$00,$f2,$b0,$f0,$01,$f6,$f4,$fd,$02,$b0,$30,$2b,$30,$37,$c0 ; [$af20]
                                                                       ; byte
    db $37,$90,$35,$34,$e0,$35,$c0,$35,$90,$34,$32,$b0,$34,$30,$c0,$34 ; [$af30]
                                                                       ; byte
    db $90,$2d,$30,$b0,$30,$2f,$fc,$f4,$ff  ; [$af40] byte

;
; XREFS:
;     MUSIC_LOOKUP_KINGS_ROOM [$PRG5::8f5d]
;
MUSIC_KINGS_ROOM_2:                         ; [$af49]
    db $f1,$02,$f2,$b0,$f6,$f4,$f0,$01,$fd,$02,$b0,$28,$28,$28,$34,$c0 ; [$af49]
                                                                       ; byte
    db $2e,$90,$30,$2e,$e0,$2d,$c0,$2c,$90,$30,$2c,$b0,$2b,$28,$c0,$2a ; [$af59]
                                                                       ; byte
    db $90,$26,$2a,$b0,$29,$26,$fc,$f4,$ff  ; [$af69] byte

;
; XREFS:
;     MUSIC_LOOKUP_KINGS_ROOM [$PRG5::8f5f]
;
MUSIC_KINGS_ROOM_3:                         ; [$af72]
    db $f6,$f4,$fd,$02,$90,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18 ; [$af72]
                                                                       ; byte
    db $18,$18,$18,$18,$24,$18,$18,$18,$18,$18,$24,$18,$18,$1d,$1d,$1d ; [$af82]
                                                                       ; byte
    db $1d,$1d,$1d,$18,$18,$18,$18,$18,$18,$1a,$1a,$1a,$1a,$1a,$1a,$1f ; [$af92]
                                                                       ; byte
    db $1f,$1f,$1f,$1f,$1f,$fc,$f4,$ff      ; [$afa2] byte

;
; XREFS:
;     MUSIC_LOOKUP_KINGS_ROOM [$PRG5::8f61]
;
MUSIC_KINGS_ROOM_4:                         ; [$afaa]
    db $ff,$ff                              ; [$afaa] byte


;============================================================================
; Music for the temples.
;
; XREFS:
;     MUSIC_LOOKUP_TEMPLE [$PRG5::8f63]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_TEMPLE [$PRG5::8f63]
;
MUSIC_TEMPLE_1:                             ; [$afac]
    db $f1,$02,$f2,$b0,$f0,$01,$f6,$f4,$fd,$02,$ac,$00,$32,$d8,$37,$c2 ; [$afac]
                                                                       ; byte
    db $37,$8b,$36,$34,$d8,$36,$ac,$00,$37,$d8,$3e,$c2,$3e,$8b,$3c,$3b ; [$afbc]
                                                                       ; byte
    db $ac,$39,$37,$c2,$37,$96,$36,$d8,$36,$ac,$00,$32,$d8,$37,$c2,$37 ; [$afcc]
                                                                       ; byte
    db $8b,$36,$34,$d8,$36,$ac,$00,$32,$37,$3b,$c2,$3e,$96,$40,$c2,$34 ; [$afdc]
                                                                       ; byte
    db $96,$39,$ac,$37,$96,$36,$34,$8b,$36,$37,$36,$37,$88,$36,$87,$37 ; [$afec]
                                                                       ; byte
    db $87,$36,$8b,$34,$36,$d8,$37,$36,$fc,$f4,$ff ; [$affc] byte

;
; XREFS:
;     MUSIC_LOOKUP_TEMPLE [$PRG5::8f65]
;
MUSIC_TEMPLE_2:                             ; [$b007]
    db $f1,$02,$f2,$b0,$f0,$01,$f6,$f4,$fd,$02,$f3,$b0,$2f,$f3,$84,$30 ; [$b007]
                                                                       ; byte
    db $ac,$30,$f3,$b0,$32,$d8,$34,$34,$f3,$84,$30,$96,$32,$30,$f3,$b0 ; [$b017]
                                                                       ; byte
    db $2f,$f3,$84,$30,$ac,$30,$d8,$2f,$ac,$32,$37,$c2,$37,$96,$3c,$c2 ; [$b027]
                                                                       ; byte
    db $30,$96,$34,$d8,$30,$30,$2f,$30,$fc,$f4,$ff ; [$b037] byte

;
; XREFS:
;     MUSIC_LOOKUP_TEMPLE [$PRG5::8f67]
;
MUSIC_TEMPLE_3:                             ; [$b042]
    db $f6,$e8,$fd,$02,$f3,$84,$1f,$ac,$1f,$f3,$b0,$21,$f3,$84,$23,$ac ; [$b042]
                                                                       ; byte
    db $23,$d8,$24,$25,$26,$26,$f3,$84,$1f,$ac,$1f,$f3,$b0,$21,$d8,$23 ; [$b052]
                                                                       ; byte
    db $23,$c2,$34,$96,$37,$c2,$2d,$96,$30,$d8,$26,$26,$1f,$26,$fc,$f4 ; [$b062]
                                                                       ; byte
    db $ff                                  ; [$b072] byte

;
; XREFS:
;     MUSIC_LOOKUP_TEMPLE [$PRG5::8f69]
;
MUSIC_TEMPLE_4:                             ; [$b073]
    db $ff,$ff                              ; [$b073] byte


;============================================================================
; Music for the shops.
;
; XREFS:
;     MUSIC_LOOKUP_SHOP [$PRG5::8f6b]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_SHOP [$PRG5::8f6b]
;
MUSIC_SHOP_1:                               ; [$b075]
    db $f1,$02,$f2,$90,$f0,$01,$fd,$02,$8e,$26,$00,$00,$00,$26,$00,$00 ; [$b075]
                                                                       ; byte
    db $00,$26,$00,$00,$00,$26,$00,$00,$00,$26,$00,$00,$00,$26,$00,$00 ; [$b085]
                                                                       ; byte
    db $00,$00,$24,$25,$26,$1f,$20,$21,$00,$fc,$fd,$02,$8e,$2b,$00,$2b ; [$b095]
                                                                       ; byte
    db $2d,$00,$00,$00,$87,$30,$2f,$8e,$2b,$00,$2b,$2d,$00,$00,$00,$00 ; [$b0a5]
                                                                       ; byte
    db $fc,$f4,$ff                          ; [$b0b5] byte

;
; XREFS:
;     MUSIC_LOOKUP_SHOP [$PRG5::8f6d]
;
MUSIC_SHOP_2:                               ; [$b0b8]
    db $f1,$02,$f2,$90,$f0,$01,$fd,$02,$8e,$1f,$00,$00,$00,$1f,$00,$00 ; [$b0b8]
                                                                       ; byte
    db $00,$1f,$00,$00,$00,$1f,$00,$00,$00,$1f,$00,$00,$00,$1f,$00,$00 ; [$b0c8]
                                                                       ; byte
    db $00,$00,$18,$19,$1a,$13,$14,$15,$00,$fc,$fd,$02,$8e,$24,$00,$24 ; [$b0d8]
                                                                       ; byte
    db $26,$00,$00,$00,$87,$2b,$2a,$8e,$24,$00,$24,$26,$00,$00,$00,$00 ; [$b0e8]
                                                                       ; byte
    db $fc,$f4,$ff                          ; [$b0f8] byte

;
; XREFS:
;     MUSIC_LOOKUP_SHOP [$PRG5::8f6f]
;
MUSIC_SHOP_3:                               ; [$b0fb]
    db $f6,$f4,$fd,$02,$8e,$35,$00,$32,$37,$3c,$00,$3b,$32,$00,$35,$32 ; [$b0fb]
                                                                       ; byte
    db $37,$3c,$3b,$32,$00,$35,$00,$32,$37,$3c,$00,$3b,$32,$00,$30,$31 ; [$b10b]
                                                                       ; byte
    db $32,$2b,$2c,$2d,$00,$fc,$fd,$02,$8e,$26,$00,$26,$26,$87,$1a,$00 ; [$b11b]
                                                                       ; byte
    db $1a,$00,$1a,$00,$1a,$1a,$8e,$26,$00,$26,$26,$87,$1a,$00,$1a,$00 ; [$b12b]
                                                                       ; byte
    db $1a,$00,$1a,$1a,$fc,$f4,$ff          ; [$b13b] byte

;
; XREFS:
;     MUSIC_LOOKUP_SHOP [$PRG5::8f71]
;
MUSIC_SHOP_4:                               ; [$b142]
    db $ff,$ff                              ; [$b142] byte


;============================================================================
; Music for the Evil Fortress.
;
; XREFS:
;     MUSIC_LOOKUP_EVIL_FORTRESS [$PRG5::8f73]
;============================================================================

;
; XREFS:
;     MUSIC_LOOKUP_EVIL_FORTRESS [$PRG5::8f73]
;
MUSIC_EVIL_FORTRESS_1:                      ; [$b144]
    db $f7,$f4,$f1,$02,$f0,$00,$f2,$d0,$fd,$02,$88,$00,$3c,$37,$32,$00 ; [$b144]
                                                                       ; byte
    db $00,$00,$00,$00,$3a,$35,$30,$2b,$00,$00,$00,$fc,$fd,$02,$88,$00 ; [$b154]
                                                                       ; byte
    db $3c,$37,$98,$32,$88,$37,$32,$00,$3a,$35,$90,$30,$88,$35,$30,$00 ; [$b164]
                                                                       ; byte
    db $fc,$fd,$02,$88,$39,$39,$39,$39,$90,$37,$00,$b0,$00,$88,$39,$39 ; [$b174]
                                                                       ; byte
    db $39,$39,$90,$37,$c0,$00,$90,$32,$37,$37,$3c,$3c,$41,$41,$3c,$3c ; [$b184]
                                                                       ; byte
    db $37,$a0,$39,$37,$00,$90,$2c,$2e,$88,$37,$37,$37,$38,$00,$38,$00 ; [$b194]
                                                                       ; byte
    db $38,$3a,$3a,$3a,$38,$00,$38,$00,$38,$a0,$37,$35,$c0,$00,$fc,$fd ; [$b1a4]
                                                                       ; byte
    db $02,$98,$35,$39,$90,$3c,$a0,$3b,$39,$98,$3c,$40,$90,$39,$a0,$3e ; [$b1b4]
                                                                       ; byte
    db $88,$3b,$39,$37,$36,$fc,$f4,$ff      ; [$b1c4] byte

;
; XREFS:
;     MUSIC_LOOKUP_EVIL_FORTRESS [$PRG5::8f75]
;
MUSIC_EVIL_FORTRESS_2:                      ; [$b1cc]
    db $f1,$04,$f0,$00,$f2,$90,$fd,$02,$88,$00,$37,$32,$2d,$00,$00,$00 ; [$b1cc]
                                                                       ; byte
    db $00,$00,$35,$30,$2b,$26,$00,$00,$00,$fc,$fd,$02,$88,$00,$37,$32 ; [$b1dc]
                                                                       ; byte
    db $98,$2d,$88,$32,$2d,$00,$35,$30,$90,$2b,$88,$30,$2b,$00,$fc,$fd ; [$b1ec]
                                                                       ; byte
    db $02,$88,$35,$35,$35,$35,$90,$32,$00,$b0,$00,$88,$00,$00,$35,$35 ; [$b1fc]
                                                                       ; byte
    db $90,$32,$c0,$00,$90,$2d,$32,$32,$37,$37,$3c,$3c,$37,$37,$32,$a0 ; [$b20c]
                                                                       ; byte
    db $35,$33,$00,$90,$29,$2c,$88,$33,$33,$33,$35,$00,$35,$00,$35,$37 ; [$b21c]
                                                                       ; byte
    db $37,$37,$35,$00,$35,$00,$35,$a0,$33,$31,$c0,$00,$fc,$88,$00,$98 ; [$b22c]
                                                                       ; byte
    db $35,$39,$90,$3c,$a0,$3b,$a0,$39,$98,$3c,$40,$90,$39,$9c,$3e,$88 ; [$b23c]
                                                                       ; byte
    db $3b,$39,$37,$84,$36,$88,$32,$35,$32,$35,$39,$35,$39,$3c,$37,$3b ; [$b24c]
                                                                       ; byte
    db $37,$35,$39,$35,$32,$35,$39,$3c,$39,$3c,$40,$3c,$35,$39,$3b,$3e ; [$b25c]
                                                                       ; byte
    db $3b,$8c,$37,$88,$3b,$39,$37,$84,$36,$f4,$ff ; [$b26c] byte

;
; XREFS:
;     MUSIC_LOOKUP_EVIL_FORTRESS [$PRG5::8f77]
;
MUSIC_EVIL_FORTRESS_3:                      ; [$b277]
    db $fd,$02,$88,$18,$00,$00,$18,$00,$00,$18,$00,$18,$00,$00,$18,$00 ; [$b277]
                                                                       ; byte
    db $00,$18,$18,$90,$18,$88,$00,$18,$00,$00,$90,$18,$18,$88,$00,$18 ; [$b287]
                                                                       ; byte
    db $00,$0c,$18,$0c,$fc,$fd,$02,$88,$13,$13,$13,$13,$90,$13,$88,$1d ; [$b297]
                                                                       ; byte
    db $1f,$00,$1f,$1d,$1a,$90,$13,$88,$00,$00,$13,$13,$90,$13,$00,$88 ; [$b2a7]
                                                                       ; byte
    db $1d,$1f,$11,$12,$13,$00,$90,$00,$88,$11,$13,$90,$21,$26,$26,$2b ; [$b2b7]
                                                                       ; byte
    db $2b,$26,$26,$21,$a0,$13,$90,$11,$88,$1d,$11,$a0,$00,$98,$22,$88 ; [$b2c7]
                                                                       ; byte
    db $16,$22,$16,$22,$22,$00,$22,$16,$22,$22,$16,$22,$22,$00,$22,$16 ; [$b2d7]
                                                                       ; byte
    db $22,$a0,$16,$16,$98,$00,$88,$16,$16,$15,$14,$12,$fc,$fd,$02,$90 ; [$b2e7]
                                                                       ; byte
    db $13,$88,$00,$90,$13,$88,$00,$13,$00,$13,$00,$00,$13,$00,$00,$13 ; [$b2f7]
                                                                       ; byte
    db $13,$fc,$fd,$02,$90,$13,$88,$1f,$90,$13,$88,$1f,$13,$1f,$13,$13 ; [$b307]
                                                                       ; byte
    db $1f,$90,$13,$88,$1f,$13,$1f,$fc,$f4,$ff ; [$b317] byte

;
; XREFS:
;     MUSIC_LOOKUP_EVIL_FORTRESS [$PRG5::8f79]
;
MUSIC_EVIL_FORTRESS_4:                      ; [$b321]
    db $fd,$04,$88,$21,$31,$31,$21,$31,$31,$21,$31,$21,$31,$31,$21,$31 ; [$b321]
                                                                       ; byte
    db $31,$21,$31,$fc,$fd,$02,$88,$21,$21,$21,$21,$21,$00,$31,$31,$31 ; [$b331]
                                                                       ; byte
    db $31,$31,$31,$21,$00,$00,$21,$11,$11,$11,$00,$85,$31,$31,$86,$31 ; [$b341]
                                                                       ; byte
    db $88,$31,$31,$31,$31,$21,$00,$21,$00,$21,$21,$31,$00,$31,$00,$31 ; [$b351]
                                                                       ; byte
    db $31,$21,$00,$31,$00,$31,$31,$31,$31,$21,$21,$31,$00,$31,$00,$31 ; [$b361]
                                                                       ; byte
    db $00,$31,$00,$85,$31,$31,$86,$31,$88,$31,$31,$21,$21,$31,$00,$31 ; [$b371]
                                                                       ; byte
    db $31,$31,$31,$21,$31,$31,$31,$31,$31,$31,$31,$21,$31,$31,$31,$a0 ; [$b381]
                                                                       ; byte
    db $00,$88,$21,$21,$21,$21,$85,$31,$31,$86,$31,$88,$31,$31,$85,$31 ; [$b391]
                                                                       ; byte
    db $31,$86,$31,$88,$21,$21,$fc,$fd,$02,$88,$31,$00,$00,$31,$00,$00 ; [$b3a1]
                                                                       ; byte
    db $31,$00,$31,$00,$00,$31,$00,$00,$31,$31,$fc,$fd,$02,$88,$31,$11 ; [$b3b1]
                                                                       ; byte
    db $11,$31,$11,$11,$31,$11,$31,$11,$11,$31,$11,$11,$31,$31,$fc,$f4 ; [$b3c1]
                                                                       ; byte
    db $ff,$a7,$ff                          ; [$b3d1] byte


;============================================================================
; Post-music data.
;============================================================================
    db $75,$ff,$57,$61,$00,$ff,$e9,$ff,$f8,$ff,$ad,$fe,$00,$ff,$23,$ff ; [$b3d4]
                                                                       ; byte
    db $fd,$ff,$29,$ed,$00,$ff,$7c,$ff,$3a,$ff,$ba,$4c,$00,$ff,$37,$ff ; [$b3e4]
                                                                       ; byte
    db $7b,$ff,$4c,$32,$00,$ff,$48,$ff,$be,$ff,$3a,$d6,$00,$ff,$82,$ff ; [$b3f4]
                                                                       ; byte
    db $53,$ff,$4e,$fb,$00,$ff,$84,$ff,$f8,$ff,$d8,$eb,$00,$ff,$74,$ff ; [$b404]
                                                                       ; byte
    db $ef,$ff,$bd,$db,$00,$ff,$39,$ff,$ff,$ff,$ee,$97,$00,$ff,$0a,$ff ; [$b414]
                                                                       ; byte
    db $c6,$ff,$c5,$ff,$00,$ff,$02,$ff,$7d,$ff,$74,$f1,$00,$ff,$3e,$ff ; [$b424]
                                                                       ; byte
    db $93,$ff,$b1,$7b,$00,$ff,$c6,$ff,$5d,$ff,$ff,$73,$00,$ff,$84,$ff ; [$b434]
                                                                       ; byte
    db $11,$ff,$e4,$bf,$00,$ff,$3c,$ff,$b3,$ff,$3f,$7d,$00,$ff,$8a,$ff ; [$b444]
                                                                       ; byte
    db $5e,$ff,$c3,$7f,$00,$ff,$cc,$ff,$de,$ff,$3f,$f8,$00,$ff,$45,$ff ; [$b454]
                                                                       ; byte
    db $d3,$ff,$ee,$77,$00,$ff,$80,$ff,$85,$ff,$79,$7e,$00,$ff,$95,$ff ; [$b464]
                                                                       ; byte
    db $62,$ff,$73,$2f,$00,$ff,$f3,$ff,$ff,$ff,$0c,$ff,$00,$ff,$95,$ff ; [$b474]
                                                                       ; byte
    db $82,$ff,$ab,$7f,$00,$ff,$c0,$ff,$5a,$ff,$01,$97,$00,$ff,$12,$ff ; [$b484]
                                                                       ; byte
    db $5d,$ff,$aa,$f3,$00,$ff,$f0,$ff,$18,$ff,$f3,$f9,$00,$ff,$00,$ff ; [$b494]
                                                                       ; byte
    db $3e,$ff,$6a,$cb,$00,$ff,$57,$ff,$bb,$ff,$78,$fe,$00,$ff,$a7,$ff ; [$b4a4]
                                                                       ; byte
    db $23,$ff,$d2,$80,$00,$ff,$a5,$ff,$6e,$ff,$2f,$b6,$00,$ff,$50,$ff ; [$b4b4]
                                                                       ; byte
    db $66,$ff,$20,$75,$00,$ff,$55,$ff,$f7,$ff,$5b,$ed,$00,$ff,$60,$ff ; [$b4c4]
                                                                       ; byte
    db $e8,$ff,$78,$9e,$00,$ff,$d9,$ff,$13,$ff,$bd,$ff,$00,$ff,$ec,$ff ; [$b4d4]
                                                                       ; byte
    db $0b,$ff,$26,$fd,$00,$ff,$e2,$ff,$58,$ff,$36,$77,$00,$ff,$40,$ff ; [$b4e4]
                                                                       ; byte
    db $b6,$ff,$02,$ff,$00,$ff,$f9,$ff,$df,$ff,$b0,$58,$00,$ff,$b4,$ff ; [$b4f4]
                                                                       ; byte
    db $9e,$ff,$aa,$fb,$00,$ff,$84,$ff,$9a,$ff,$9f,$ff,$00,$ff,$34,$ff ; [$b504]
                                                                       ; byte
    db $d3,$ff,$32,$9f,$00,$ff,$4a,$ff,$57,$ff,$6f,$6d,$00,$ff,$2a,$ff ; [$b514]
                                                                       ; byte
    db $64,$ff,$fe,$dd,$00,$ff,$94,$ff,$d1,$ff,$bb,$ef,$00,$ff,$2c,$ff ; [$b524]
                                                                       ; byte
    db $5f,$ff,$cb,$bf,$00,$ff,$e7,$ff,$7c,$ff,$f3,$7d,$00,$ff,$90,$ff ; [$b534]
                                                                       ; byte
    db $51,$ff,$33,$ec,$00,$ff,$59,$ff,$a4,$ff,$72,$7f,$00,$ff,$1a,$ff ; [$b544]
                                                                       ; byte
    db $0f,$ff,$c5,$af,$00,$ff,$2f,$ff,$e9,$ff,$15,$30,$00,$ff,$03,$ff ; [$b554]
                                                                       ; byte
    db $06,$ff,$13,$bf,$00,$ff,$0b,$ff,$fb,$ff,$e2,$fe,$00,$ff,$d5,$ff ; [$b564]
                                                                       ; byte
    db $c7,$ff,$69,$9f,$00,$ff,$32,$ff,$76,$ff,$fc,$06,$00,$ff,$14,$ff ; [$b574]
                                                                       ; byte
    db $3c,$ff,$6f,$0f,$00,$ff,$ad,$ff,$ea,$ff,$db,$af,$00,$ff,$27,$ff ; [$b584]
                                                                       ; byte
    db $ee,$ff,$f9,$4c,$00,$ff,$23,$ff,$5d,$ff,$57,$fe,$00,$ff,$04,$ff ; [$b594]
                                                                       ; byte
    db $b1,$ff,$e2,$f7,$00,$ff,$a4,$ff,$53,$ff,$fa,$ff,$00,$ff,$2c,$ff ; [$b5a4]
                                                                       ; byte
    db $5f,$ff,$fd,$8c,$00,$ff,$7d,$ff,$77,$ff,$e8,$52,$00,$ff,$00,$ff ; [$b5b4]
                                                                       ; byte
    db $83,$ff,$35,$bf,$00,$ff,$58,$ff,$d7,$ff,$ef,$d7,$00,$ff,$60,$ff ; [$b5c4]
                                                                       ; byte
    db $f8,$ff,$d1,$de,$00,$ff,$94,$ff,$f3,$ff,$ea,$cf,$00,$ff,$08,$ff ; [$b5d4]
                                                                       ; byte
    db $48,$ff,$7b,$fb,$00,$ff,$33,$ff,$d6,$ff,$7f,$83,$00,$ff,$71,$ff ; [$b5e4]
                                                                       ; byte
    db $4e,$ff,$45,$ff,$00,$ff,$fc,$ff,$97,$ef,$f6,$3e,$00,$ff,$40,$ff ; [$b5f4]
                                                                       ; byte
    db $05,$ff,$4b,$ff,$00,$ff,$04,$ff,$72,$ff,$69,$ff,$00,$ff,$12,$ff ; [$b604]
                                                                       ; byte
    db $c8,$ff,$e9,$ef,$00,$ff,$d8,$ff,$df,$ff,$af,$03,$00,$ff,$27,$ff ; [$b614]
                                                                       ; byte
    db $2c,$ff,$11,$ff,$00,$ff,$94,$ff,$22,$ff,$f2,$ff,$00,$ff,$e4,$ff ; [$b624]
                                                                       ; byte
    db $bd,$ff,$f7,$92,$00,$ff,$26,$ff,$ff,$ff,$a7,$65,$00,$ff,$61,$ff ; [$b634]
                                                                       ; byte
    db $a8,$ff,$b0,$be,$00,$ff,$0d,$ff,$a2,$ff,$51,$a3,$00,$ff,$f0,$ff ; [$b644]
                                                                       ; byte
    db $c4,$ff,$04,$ae,$00,$ff,$3b,$ff,$7f,$ff,$3b,$cf,$00,$ff,$01,$ff ; [$b654]
                                                                       ; byte
    db $56,$ff,$61,$ff,$00,$ff,$8d,$ff,$fb,$ff,$81,$f7,$00,$ff,$12,$ff ; [$b664]
                                                                       ; byte
    db $cb,$ff,$73,$df,$00,$ff,$71,$ff,$d9,$ff,$b7,$bf,$00,$ff,$00,$ff ; [$b674]
                                                                       ; byte
    db $59,$ff,$79,$97,$00,$ff,$42,$ff,$7d,$ff,$b9,$ea,$00,$ff,$70,$ff ; [$b684]
                                                                       ; byte
    db $db,$ff,$fd,$30,$00,$ff,$08,$ff,$67,$ff,$9f,$8e,$00,$ff,$01,$ff ; [$b694]
                                                                       ; byte
    db $1f,$ff,$27,$7f,$00,$ff,$c0,$ff,$27,$ff,$50,$6f,$00,$ff,$63,$ff ; [$b6a4]
                                                                       ; byte
    db $be,$ff,$40,$cf,$00,$ff,$c5,$ff,$da,$ff,$1f,$9f,$00,$ff,$28,$ff ; [$b6b4]
                                                                       ; byte
    db $e5,$ff,$a3,$b7,$00,$ff,$c2,$ff,$19,$ff,$8b,$9f,$00,$ff,$44,$ff ; [$b6c4]
                                                                       ; byte
    db $f7,$ff,$d5,$ef,$00,$ff,$2d,$ff,$ad,$ff,$d5,$7f,$00,$ff,$22,$ff ; [$b6d4]
                                                                       ; byte
    db $3e,$ff,$75,$5f,$00,$ff,$01,$ff,$ed,$ff,$14,$df,$00,$ff,$38,$ff ; [$b6e4]
                                                                       ; byte
    db $7d,$ff,$fa,$d3,$00,$ff,$7c,$ff,$bd,$ff,$de,$ce,$00,$ff,$3e,$ff ; [$b6f4]
                                                                       ; byte
    db $e7,$ff,$e1,$e6,$00,$ff,$38,$ff,$3a,$ff,$59,$f5,$00,$ff,$05,$ff ; [$b704]
                                                                       ; byte
    db $17,$ef,$75,$5e,$00,$ff,$6b,$ff,$fd,$ff,$de,$34,$00,$ff,$32,$ff ; [$b714]
                                                                       ; byte
    db $5b,$ff,$00,$f3,$00,$ff,$20,$ff,$da,$ff,$5e,$ff,$00,$ff,$04,$ff ; [$b724]
                                                                       ; byte
    db $e0,$ff,$c1,$f3,$00,$ff,$49,$ff,$b7,$ff,$9e,$ee,$00,$ff,$72,$ff ; [$b734]
                                                                       ; byte
    db $34,$ff,$76,$d5,$00,$ff,$01,$ff,$69,$ff,$0d,$fe,$00,$ff,$bb,$ff ; [$b744]
                                                                       ; byte
    db $20,$ff,$e4,$7e,$00,$ff,$43,$ff,$b7,$ff,$7b,$18,$00,$ff,$61,$ff ; [$b754]
                                                                       ; byte
    db $03,$ff,$e0,$ff,$00,$ff,$89,$ff,$f5,$ff,$66,$8f,$00,$ff,$fe,$ff ; [$b764]
                                                                       ; byte
    db $c7,$ff,$fd,$bf,$00,$ff,$28,$ff,$eb,$ff,$af,$eb,$00,$ff,$04,$ff ; [$b774]
                                                                       ; byte
    db $0a,$ff,$c1,$bf,$00,$ff,$50,$ff,$21,$df,$f4,$db,$00,$ff,$dc,$ff ; [$b784]
                                                                       ; byte
    db $9e,$ff,$ff,$bd,$00,$ff,$8b,$ff,$be,$ff,$cd,$b5,$00,$ff,$00,$ff ; [$b794]
                                                                       ; byte
    db $39,$ff,$1c,$ff,$00,$ff,$08,$ff,$11,$ff,$b7,$bf,$00,$ff,$f2,$ff ; [$b7a4]
                                                                       ; byte
    db $77,$ff,$f4,$f7,$00,$ff,$64,$ff,$53,$ff,$ff,$b3,$00,$ff,$81,$ff ; [$b7b4]
                                                                       ; byte
    db $55,$ff,$cd,$97,$00,$ff,$1e,$ff,$39,$ff,$68,$fb,$00,$ff,$a0,$ff ; [$b7c4]
                                                                       ; byte
    db $fd,$ff,$ca,$ee,$00,$ff,$ae,$df,$f4,$fb,$7f,$6b,$00,$ff,$44,$ff ; [$b7d4]
                                                                       ; byte
    db $93,$ff,$f5,$7c,$00,$ff,$46,$ff,$04,$ff,$fd,$7f,$00,$ff,$e0,$ff ; [$b7e4]
                                                                       ; byte
    db $34,$df,$7b,$fe,$00,$ff,$5a,$ff,$eb,$ff,$19,$c1,$00,$ff,$31,$ff ; [$b7f4]
                                                                       ; byte
    db $a4,$ff,$26,$3d,$00,$ff,$e0,$ff,$b0,$ff,$e3,$ff,$00,$ff,$fa,$ff ; [$b804]
                                                                       ; byte
    db $71,$ff,$f9,$fe,$00,$ff,$3b,$ff,$fe,$ff,$cf,$de,$00,$ff,$16,$ff ; [$b814]
                                                                       ; byte
    db $e5,$ff,$bc,$1d,$00,$ff,$05,$ff,$9e,$ff,$bb,$fb,$00,$ff,$b0,$ff ; [$b824]
                                                                       ; byte
    db $bb,$ff,$9e,$e7,$00,$ff,$50,$ff,$bc,$ff,$cd,$a6,$00,$ff,$3a,$ff ; [$b834]
                                                                       ; byte
    db $02,$ff,$e2,$de,$00,$ff,$42,$ff,$3a,$ff,$c5,$33,$00,$ff,$d2,$ff ; [$b844]
                                                                       ; byte
    db $67,$ff,$5b,$7d,$00,$ff,$6e,$ff,$d9,$ff,$fd,$59,$00,$ff,$80,$ff ; [$b854]
                                                                       ; byte
    db $0c,$ff,$02,$df,$00,$ff,$a4,$ff,$9a,$ff,$93,$ff,$00,$ff,$06,$ff ; [$b864]
                                                                       ; byte
    db $a7,$ff,$7e,$df,$00,$f7,$3d,$ff,$71,$ff,$ee,$4f,$00,$ff,$04,$ff ; [$b874]
                                                                       ; byte
    db $10,$ff,$c8,$bb,$00,$ff,$12,$ff,$2f,$ff,$f5,$74,$00,$ff,$30,$ff ; [$b884]
                                                                       ; byte
    db $f3,$ff,$5e,$55,$00,$ff,$c2,$ff,$de,$ff,$b6,$b4,$00,$ff,$81,$ff ; [$b894]
                                                                       ; byte
    db $6a,$ff,$f7,$fd,$00,$ff,$93,$ff,$24,$ff,$47,$b6,$00,$ff,$45,$ff ; [$b8a4]
                                                                       ; byte
    db $6b,$ff,$17,$37,$00,$ff,$88,$ff,$76,$ff,$7f,$2f,$00,$ff,$00,$ff ; [$b8b4]
                                                                       ; byte
    db $be,$ff,$9a,$fd,$00,$ff,$b2,$ff,$db,$ff,$dc,$af,$00,$f7,$aa,$ff ; [$b8c4]
                                                                       ; byte
    db $7e,$ff,$ed,$df,$00,$ff,$68,$ff,$ed,$ff,$bb,$7c,$00,$ff,$20,$ff ; [$b8d4]
                                                                       ; byte
    db $12,$ff,$39,$8b,$00,$ff,$70,$ff,$e0,$ff,$1c,$9d,$00,$ff,$67,$ff ; [$b8e4]
                                                                       ; byte
    db $83,$fd,$f4,$93,$00,$ff,$19,$ff,$79,$ff,$bf,$7f,$00,$ff,$a1,$ff ; [$b8f4]
                                                                       ; byte
    db $3a,$ff,$8a,$f7,$00,$ff,$84,$ff,$5e,$ff,$b5,$6b,$00,$ff,$b0,$ff ; [$b904]
                                                                       ; byte
    db $65,$ff,$d6,$f9,$00,$ff,$72,$ff,$7b,$ff,$74,$8d,$00,$ff,$08,$ff ; [$b914]
                                                                       ; byte
    db $0d,$ff,$5d,$bd,$00,$ff,$00,$ff,$82,$ff,$7a,$3f,$00,$ff,$e2,$ff ; [$b924]
                                                                       ; byte
    db $b2,$ff,$a4,$7e,$00,$ff,$e7,$ff,$95,$fe,$b5,$af,$00,$ff,$80,$ff ; [$b934]
                                                                       ; byte
    db $10,$ff,$31,$f8,$00,$ff,$40,$ff,$6a,$ff,$7e,$ff,$00,$ff,$45,$ff ; [$b944]
                                                                       ; byte
    db $5d,$ff,$21,$67,$00,$ff,$c0,$ff,$af,$ff,$85,$e3,$00,$ff,$00,$ff ; [$b954]
                                                                       ; byte
    db $12,$ff,$97,$cf,$00,$ff,$b0,$ff,$63,$ff,$b8,$ce,$00,$ff,$fa,$ff ; [$b964]
                                                                       ; byte
    db $3b,$ff,$a3,$e5,$00,$ff,$60,$ff,$5b,$ff,$89,$76,$00,$ff,$80,$ff ; [$b974]
                                                                       ; byte
    db $52,$ff,$52,$7e,$00,$ff,$a0,$ff,$1f,$ff,$66,$d7,$00,$ff,$76,$ff ; [$b984]
                                                                       ; byte
    db $9d,$ff,$f9,$14,$00,$ff,$ff,$ff,$2f,$ff,$f7,$52,$00,$ff,$9c,$ff ; [$b994]
                                                                       ; byte
    db $04,$ff,$76,$ff,$00,$ff,$94,$ff,$72,$ff,$7f,$4e,$00,$ff,$a7,$ff ; [$b9a4]
                                                                       ; byte
    db $c7,$ff,$66,$6d,$00,$ff,$9d,$ff,$7f,$ff,$7c,$26,$00,$ff,$26,$ff ; [$b9b4]
                                                                       ; byte
    db $c7,$ff,$72,$ff,$00,$ff,$31,$ff,$b7,$ff,$7e,$e9,$00,$ff,$bc,$ff ; [$b9c4]
                                                                       ; byte
    db $de,$ff,$e7,$e4,$00,$ff,$7b,$ff,$f2,$fe,$f3,$eb,$00,$ff,$e8,$ff ; [$b9d4]
                                                                       ; byte
    db $32,$ff,$9d,$f7,$00,$ff,$80,$ff,$36,$ff,$9c,$ff,$00,$ff,$88,$ff ; [$b9e4]
                                                                       ; byte
    db $eb,$ff,$eb,$a7,$00,$ff,$8f,$ff,$77,$ff,$df,$79,$00,$ff,$fa,$ff ; [$b9f4]
                                                                       ; byte
    db $a6,$ff,$cd,$ff,$00,$ff,$a0,$ff,$b4,$ff,$52,$eb,$00,$ff,$dc,$ff ; [$ba04]
                                                                       ; byte
    db $be,$ff,$c5,$6d,$00,$ff,$63,$ff,$fd,$ff,$a2,$42,$00,$ff,$a4,$ff ; [$ba14]
                                                                       ; byte
    db $c1,$ff,$88,$fd,$00,$ff,$30,$ff,$6a,$ff,$92,$7d,$00,$ff,$70,$ff ; [$ba24]
                                                                       ; byte
    db $bb,$ff,$76,$ff,$00,$ff,$b4,$ff,$f5,$ff,$fe,$dc,$00,$ff,$80,$ff ; [$ba34]
                                                                       ; byte
    db $37,$ff,$a4,$e7,$00,$ff,$40,$ff,$43,$ff,$7d,$f7,$00,$ff,$12,$ff ; [$ba44]
                                                                       ; byte
    db $f1,$ff,$57,$df,$00,$ff,$d7,$ff,$c5,$ff,$3b,$e7,$00,$ff,$6c,$ff ; [$ba54]
                                                                       ; byte
    db $de,$ff,$98,$5a,$00,$ff,$82,$ff,$8e,$ff,$23,$5e,$00,$ff,$06,$ff ; [$ba64]
                                                                       ; byte
    db $bd,$ff,$a7,$6f,$00,$ff,$bc,$ff,$eb,$ff,$55,$0b,$00,$ff,$a1,$ff ; [$ba74]
                                                                       ; byte
    db $cd,$ff,$15,$d7,$00,$ff,$a2,$ff,$ca,$ff,$2b,$8f,$00,$ff,$6f,$ff ; [$ba84]
                                                                       ; byte
    db $fe,$ff,$db,$68,$00,$ff,$b8,$ff,$d7,$ff,$df,$55,$00,$ff,$b4,$ff ; [$ba94]
                                                                       ; byte
    db $06,$ff,$cd,$bf,$00,$ff,$d0,$ff,$78,$ff,$e6,$ed,$00,$ff,$e4,$ff ; [$baa4]
                                                                       ; byte
    db $dd,$ff,$ba,$ce,$00,$ff,$4d,$ff,$df,$ff,$c5,$95,$00,$ff,$2a,$ff ; [$bab4]
                                                                       ; byte
    db $ed,$ff,$36,$fe,$00,$ff,$00,$ff,$c3,$ff,$7f,$df,$00,$ff,$40,$ff ; [$bac4]
                                                                       ; byte
    db $f5,$fb,$b1,$ec,$00,$ff,$d8,$ff,$df,$ff,$7d,$bf,$00,$df,$04,$ff ; [$bad4]
                                                                       ; byte
    db $b5,$ff,$e7,$af,$00,$ff,$00,$ff,$51,$ff,$ff,$d3,$00,$ff,$95,$ff ; [$bae4]
                                                                       ; byte
    db $74,$ff,$e4,$8f,$00,$ff,$c1,$ff,$7f,$ff,$7f,$54,$00,$ff,$40,$ff ; [$baf4]
                                                                       ; byte
    db $0f,$ff,$d9,$3f,$00,$ff,$44,$ff,$4d,$ff,$bf,$cf,$00,$ff,$32,$ff ; [$bb04]
                                                                       ; byte
    db $f9,$ff,$ab,$f7,$00,$ff,$f1,$ff,$df,$af,$7f,$02,$00,$ff,$54,$ff ; [$bb14]
                                                                       ; byte
    db $23,$ff,$59,$9f,$00,$ff,$07,$ff,$b1,$ff,$a4,$ef,$00,$ff,$30,$ff ; [$bb24]
                                                                       ; byte
    db $66,$ff,$6e,$de,$00,$ff,$e2,$ff,$6f,$ff,$fb,$bd,$00,$ff,$85,$ff ; [$bb34]
                                                                       ; byte
    db $27,$ff,$13,$fb,$00,$ff,$08,$ff,$52,$ff,$de,$bd,$00,$ff,$be,$ff ; [$bb44]
                                                                       ; byte
    db $bb,$ff,$ee,$b7,$00,$ff,$23,$ff,$f7,$ff,$7f,$ae,$00,$ff,$00,$ff ; [$bb54]
                                                                       ; byte
    db $8b,$ff,$31,$ef,$00,$ff,$c1,$ff,$80,$ff,$9b,$7f,$00,$ff,$76,$ff ; [$bb64]
                                                                       ; byte
    db $b0,$ff,$3f,$b3,$00,$ff,$55,$ff,$bf,$ff,$79,$aa,$00,$ff,$11,$ff ; [$bb74]
                                                                       ; byte
    db $c4,$ff,$38,$8f,$00,$ff,$53,$ff,$e0,$ff,$0a,$e1,$00,$ff,$03,$ff ; [$bb84]
                                                                       ; byte
    db $7e,$ff,$5e,$f7,$00,$ff,$62,$ff,$f3,$ff,$5e,$35,$00,$ff,$54,$ff ; [$bb94]
                                                                       ; byte
    db $41,$ff,$2e,$df,$00,$ff,$03,$ff,$6c,$ff,$b5,$5f,$00,$ff,$c4,$ff ; [$bba4]
                                                                       ; byte
    db $e2,$ff,$5e,$df,$00,$ff,$f6,$ff,$5f,$ff,$a5,$0f,$00,$ff,$c1,$ff ; [$bbb4]
                                                                       ; byte
    db $21,$ff,$4f,$43,$00,$ff,$48,$ff,$15,$ff,$e0,$df,$00,$ff,$64,$ff ; [$bbc4]
                                                                       ; byte
    db $34,$ff,$b1,$7d,$00,$ff,$f8,$ff,$ff,$ff,$bc,$2d,$00,$ff,$09,$ff ; [$bbd4]
                                                                       ; byte
    db $e6,$ff,$4d,$f6,$00,$ff,$60,$ff,$81,$ff,$15,$af,$00,$ff,$30,$ff ; [$bbe4]
                                                                       ; byte
    db $a3,$ff,$ba,$3a,$20,$ff,$53,$ff,$15,$ff,$ed,$ae,$00,$ff,$21,$ff ; [$bbf4]
                                                                       ; byte
    db $95,$ff,$b3,$fe,$00,$ff,$cc,$ff,$c5,$ff,$63,$2f,$00,$ff,$68,$ff ; [$bc04]
                                                                       ; byte
    db $3a,$ff,$7e,$ee,$00,$ff,$b4,$ff,$5b,$ff,$6e,$31,$00,$ff,$10,$ff ; [$bc14]
                                                                       ; byte
    db $cf,$ff,$98,$e7,$00,$ff,$60,$ff,$a7,$ff,$21,$3f,$00,$ff,$10,$ff ; [$bc24]
                                                                       ; byte
    db $ef,$ff,$cd,$eb,$00,$ff,$2e,$ff,$ff,$ff,$c0,$5e,$00,$ff,$00,$ff ; [$bc34]
                                                                       ; byte
    db $be,$ff,$31,$ff,$00,$ff,$02,$ff,$de,$ff,$8a,$ff,$00,$ff,$42,$ff ; [$bc44]
                                                                       ; byte
    db $be,$ff,$b8,$9c,$00,$ff,$95,$ff,$ed,$ff,$fc,$2e,$00,$ff,$04,$ff ; [$bc54]
                                                                       ; byte
    db $f5,$ff,$15,$cf,$00,$ff,$4e,$ff,$ee,$ff,$28,$dc,$00,$ff,$0a,$ff ; [$bc64]
                                                                       ; byte
    db $f1,$ff,$5d,$76,$00,$ff,$b1,$ff,$97,$ff,$6b,$7a,$00,$ff,$85,$ff ; [$bc74]
                                                                       ; byte
    db $39,$ff,$15,$cf,$00,$ff,$c6,$ff,$cb,$ff,$fb,$77,$00,$ff,$1f,$ff ; [$bc84]
                                                                       ; byte
    db $d7,$ff,$ac,$e1,$00,$ff,$1a,$ff,$c8,$ef,$55,$e8,$00,$ff,$8a,$ff ; [$bc94]
                                                                       ; byte
    db $ea,$ff,$f4,$bd,$00,$ff,$80,$ff,$2f,$ff,$d7,$ef,$00,$ff,$72,$ff ; [$bca4]
                                                                       ; byte
    db $45,$ff,$f3,$fd,$00,$ff,$ef,$ff,$ef,$ff,$8d,$23,$00,$ff,$20,$ff ; [$bcb4]
                                                                       ; byte
    db $91,$ff,$9c,$ed,$00,$ff,$45,$ff,$aa,$ff,$93,$ee,$00,$ff,$06,$ff ; [$bcc4]
                                                                       ; byte
    db $4f,$ff,$a3,$9f,$00,$ff,$dd,$ff,$ff,$ff,$fb,$0d,$00,$ff,$28,$ff ; [$bcd4]
                                                                       ; byte
    db $05,$ff,$2b,$6d,$00,$ff,$d2,$ff,$51,$ff,$bc,$fd,$00,$ff,$45,$ff ; [$bce4]
                                                                       ; byte
    db $86,$ff,$a0,$fa,$00,$ff,$b2,$ff,$af,$ff,$71,$14,$00,$ff,$20,$ff ; [$bcf4]
                                                                       ; byte
    db $53,$ff,$57,$ff,$00,$ff,$f5,$ff,$bf,$ff,$35,$fd,$01,$ff,$93,$ff ; [$bd04]
                                                                       ; byte
    db $e6,$ff,$bd,$e8,$00,$ff,$5f,$ff,$b9,$ff,$b8,$ff,$00,$ff,$70,$ff ; [$bd14]
                                                                       ; byte
    db $73,$ff,$c6,$df,$00,$ff,$03,$ff,$71,$ff,$89,$af,$00,$ff,$01,$ff ; [$bd24]
                                                                       ; byte
    db $ab,$ff,$6d,$e7,$00,$ff,$d7,$ff,$62,$ff,$36,$47,$00,$ff,$40,$ff ; [$bd34]
                                                                       ; byte
    db $34,$ff,$41,$ef,$00,$ff,$b9,$ff,$39,$ff,$3e,$6e,$00,$ff,$af,$ff ; [$bd44]
                                                                       ; byte
    db $17,$ff,$3e,$ff,$00,$ff,$69,$ff,$5d,$ff,$67,$23,$00,$ff,$a2,$ff ; [$bd54]
                                                                       ; byte
    db $1a,$ff,$f4,$db,$00,$ff,$87,$ff,$b3,$ff,$68,$ae,$00,$ff,$63,$ff ; [$bd64]
                                                                       ; byte
    db $6b,$ff,$65,$fd,$00,$ff,$09,$ff,$fd,$ff,$ef,$4c,$00,$ff,$01,$ff ; [$bd74]
                                                                       ; byte
    db $65,$ff,$18,$ea,$00,$ff,$30,$ff,$a3,$ff,$b6,$7f,$00,$ff,$9f,$ff ; [$bd84]
                                                                       ; byte
    db $ea,$fe,$7f,$be,$00,$ff,$de,$ff,$25,$ff,$df,$1e,$00,$ff,$11,$ff ; [$bd94]
                                                                       ; byte
    db $50,$ff,$6b,$7e,$00,$ff,$86,$ff,$f4,$ff,$b5,$af,$00,$ff,$d0,$ff ; [$bda4]
                                                                       ; byte
    db $e3,$ff,$3d,$df,$00,$ff,$cd,$ff,$ff,$ff,$75,$59,$00,$ff,$19,$ff ; [$bdb4]
                                                                       ; byte
    db $33,$ff,$74,$bb,$00,$ff,$30,$ff,$ee,$ff,$7e,$fb,$00,$ff,$1a,$ff ; [$bdc4]
                                                                       ; byte
    db $f9,$ff,$ed,$df,$00,$ff,$1d,$ff,$dd,$ff,$cf,$39,$00,$ff,$00,$ff ; [$bdd4]
                                                                       ; byte
    db $de,$ff,$c4,$97,$00,$ff,$b4,$ff,$d3,$ff,$99,$ff,$00,$ff,$a2,$ff ; [$bde4]
                                                                       ; byte
    db $e6,$7e,$b7,$f7,$00,$ff,$5c,$ff,$b7,$ff,$5f,$34,$00,$ff,$0a,$ff ; [$bdf4]
                                                                       ; byte
    db $c4,$ff,$c2,$ff,$00,$ff,$40,$ff,$75,$ff,$56,$be,$00,$7f,$2c,$ff ; [$be04]
                                                                       ; byte
    db $99,$ff,$9b,$7f,$00,$ff,$cd,$ff,$ff,$fe,$dd,$29,$00,$ff,$02,$ff ; [$be14]
                                                                       ; byte
    db $15,$ff,$33,$df,$00,$ff,$04,$ff,$75,$ff,$5e,$a6,$00,$ff,$2d,$ff ; [$be24]
                                                                       ; byte
    db $23,$ff,$9f,$97,$00,$ff,$5f,$ff,$f7,$ff,$92,$03,$00,$ff,$68,$ff ; [$be34]
                                                                       ; byte
    db $46,$ff,$48,$fe,$00,$ff,$08,$ff,$9a,$ff,$ed,$ff,$00,$ff,$24,$ff ; [$be44]
                                                                       ; byte
    db $7f,$ff,$63,$f7,$00,$ff,$28,$ff,$7d,$ff,$5a,$dd,$00,$ff,$15,$ff ; [$be54]
                                                                       ; byte
    db $02,$ff,$0a,$fd,$00,$ff,$06,$ff,$7c,$ff,$d2,$38,$00,$ff,$33,$ff ; [$be64]
                                                                       ; byte
    db $7b,$ff,$6f,$c2,$00,$ff,$a9,$ff,$a8,$ff,$db,$dd,$00,$ff,$c0,$ff ; [$be74]
                                                                       ; byte
    db $bb,$ff,$fc,$6b,$00,$ff,$70,$ff,$b1,$ff,$49,$bf,$00,$ff,$56,$ff ; [$be84]
                                                                       ; byte
    db $bc,$ff,$e5,$a6,$00,$ff,$0c,$ff,$73,$ff,$ed,$e7,$00,$ff,$aa,$ff ; [$be94]
                                                                       ; byte
    db $27,$ff,$41,$5b,$00,$ff,$09,$ff,$7c,$fb,$ee,$ef,$00,$ff,$68,$ff ; [$bea4]
                                                                       ; byte
    db $f8,$ff,$53,$6c,$00,$ff,$39,$ff,$ff,$ff,$7b,$b8,$00,$ff,$80,$ff ; [$beb4]
                                                                       ; byte
    db $66,$ff,$65,$7c,$00,$ff,$dd,$ff,$ff,$ff,$9b,$83,$00,$ff,$61,$ef ; [$bec4]
                                                                       ; byte
    db $c7,$df,$70,$f5,$00,$ff,$ed,$ff,$fa,$ff,$b3,$4c,$00,$ff,$08,$ff ; [$bed4]
                                                                       ; byte
    db $6b,$ff,$10,$97,$00,$ff,$a0,$ff,$62,$ff,$cd,$ee,$00,$ff,$50,$ff ; [$bee4]
                                                                       ; byte
    db $fd,$ff,$75,$ef,$00,$ff,$20,$ff,$1f,$ff,$d9,$7b,$00,$ff,$ae,$ff ; [$bef4]
                                                                       ; byte
    db $9d,$ff,$e3,$ff,$00,$ef,$82,$ff,$95,$ff,$9e,$ff,$00,$ff,$c3,$ff ; [$bf04]
                                                                       ; byte
    db $e7,$ff,$ed,$6f,$00,$ff,$c0,$ff,$37,$ff,$ff,$fe,$00,$ff,$11,$ff ; [$bf14]
                                                                       ; byte
    db $64,$ff,$c3,$df,$00,$ff,$76,$ff,$2e,$ff,$9b,$cb,$00,$ff,$1a,$ff ; [$bf24]
                                                                       ; byte
    db $ed,$ff,$45,$b9,$00,$ff,$cf,$ff,$eb,$ff,$15,$c7,$00,$ff,$5e,$ff ; [$bf34]
                                                                       ; byte
    db $21,$ff,$23,$ef,$00,$ff,$31,$ff,$f0,$ff,$b7,$75,$00,$ff,$12,$ff ; [$bf44]
                                                                       ; byte
    db $3e,$ff,$de,$de,$00,$ff,$45,$ff,$f8,$ff,$eb,$9f,$00,$ff,$b9,$ff ; [$bf54]
                                                                       ; byte
    db $17,$ff,$3f,$fe,$00,$ff,$24,$ff,$fc,$ff,$e9,$bd,$00,$ff,$fc,$ff ; [$bf64]
                                                                       ; byte
    db $f1,$ff,$54,$bb,$00,$ff,$c4,$ff,$aa,$ff,$53,$7b,$00,$ff,$d0,$ff ; [$bf74]
                                                                       ; byte
    db $12,$ff,$b6,$ef,$00,$ff,$a1,$ff,$48,$ff,$ca,$b6,$00,$ff,$79,$ff ; [$bf84]
                                                                       ; byte
    db $51,$ff,$72,$3f,$00,$ff,$7a,$ff,$73,$ff,$f2,$99,$00,$ff,$41,$ff ; [$bf94]
                                                                       ; byte
    db $d4,$ff,$19,$ff,$00,$ff,$c0,$ff,$5c,$ff,$98,$c7,$00,$ff,$6a,$ff ; [$bfa4]
                                                                       ; byte
    db $7a,$ff,$9c,$be,$00,$ff,$7d,$ff,$fd,$ff,$a6,$8e,$00,$ff,$29,$ff ; [$bfb4]
                                                                       ; byte
    db $db,$ff,$83,$91,$00,$ff,$81,$ff,$b5,$ff,$aa,$79,$00,$ff,$0c,$ff ; [$bfc4]
                                                                       ; byte
    db $fe,$ff,$bf,$e3,$00,$ff,$a6,$ff,$da,$ff,$fa,$fa,$00,$ff,$46,$ff ; [$bfd4]
                                                                       ; byte
    db $65,$ff,$e2,$7d,$00,$ff,$fa,$ff,$f5,$ff,$98,$d6,$00,$ff,$22,$ff ; [$bfe4]
                                                                       ; byte
    db $f5,$ff,$f6,$b3,$00,$ff,$a2,$ff,$f7,$ff,$fe,$bf ; [$bff4] byte
