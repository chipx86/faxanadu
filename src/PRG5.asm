;============================================================================
; Faxanadu (U).nes
;
; PRG5 ($8000 - $bfff)
;============================================================================

    .segment "PRG5"
    .reloc


;============================================================================
; Initialize sound effect playback.
;
; This is a thunking function that wraps
; SoundEffects_Init.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     SoundEffects_Init
;
; XREFS:
;     Game_InitScreenAndMusic
;============================================================================
thunk_SoundEffects_Init:                    ; [$8000]
    JMP SoundEffects_Init


;============================================================================
; Handle sound effects on hardware interrupt.
;
; This is a thunking function that wraps
; SoundEffects_HandleOnInterrupt.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     SoundEffects_HandleOnInterrupt
;
; XREFS:
;     OnInterrupt
;============================================================================
thunk_SoundEffects_HandleOnInterrupt:       ; [$8003]
    JMP SoundEffects_HandleOnInterrupt


;============================================================================
; Initialize the playing state for music and sound effects.
;
; This is a thunking function that wraps
; Audio_InitPlayingState.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Audio_InitPlayingState
;
; XREFS:
;     Game_InitScreenAndMusic
;============================================================================
thunk_Audio_InitPlayingState:               ; [$8006]
    JMP Audio_InitPlayingState


;============================================================================
; Handle music on interrupt.
;
; This is a thunking function that wraps
; Music_HandleOnInterrupt.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Music_HandleOnInterrupt
;
; XREFS:
;     OnInterrupt
;============================================================================
thunk_Music_HandleOnInterrupt:              ; [$8009]
    JMP Music_HandleOnInterrupt
    .byte $ff                               ; Unused padding byte.


;============================================================================
; Handle music on interrupt.
;
; If the game is paused, no music will play.
;
; If no music or sound effects are set, audio will be reset.
;
; If music is set but not playing, the music data will be
; loaded.
;
; If music is set and playing, the next actions or notes of
; the MScripts will be invoked, playing parts of the music.
;
; INPUTS:
;     Game_PausedState:
;         Whether the game is paused.
;
;     Music_Current:
;         The currently-set music.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Audio_HandlePaused
;     Audio_ResetIfNothingSet
;     Music_Load
;     Music_PlayNext
;
; XREFS:
;     thunk_Music_HandleOnInterrupt
;============================================================================
Music_HandleOnInterrupt:                    ; [$800d]
    LDA a:Game_PausedState                  ; Load the paused state.
    BNE Audio_HandlePaused                  ; If paused, then jump.


    ;
    ; The game is not paused. Music can be played.
    ;
    LDA Music_Current                       ; Load the current music to play.
    BEQ Audio_ResetIfNothingSet             ; If unset, jump to reset audio
                                            ; if nothing else is playing.


    ;
    ; There is music to play.
    ;
    ; If bit 0x80 is set, then it's already playing. We'll just
    ; continue to play it.
    ;
    ; If it's not set, load the new music.
    ;
    BPL Music_Load                          ; Jump to load the music.


    ;
    ; Music is currently playing. Play the next piece of the
    ; music.
    ;
    JMP Music_PlayNext                      ; Jump to play the next part of
                                            ; the current music.


;============================================================================
; Initialize the music and sound effects state.
;
; This will clear out the music and sound effects
; in preparation for loading a new part of the game.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Game_PausedState:
;     Music_Current:
;     SoundEffect_HandlerIndex:
;     SND_CHN:
;     SoundEffect_Current:
;     SoundEffect_Unused_PriorityID:
;         Cleared.
;
; XREFS:
;     thunk_Audio_InitPlayingState
;============================================================================
Audio_InitPlayingState:                     ; [$801b]
    LDA #$00
    STA Music_Current                       ; Clear the current music.
    STA SoundEffect_Current                 ; Clear the next sound effect.
    STA a:SoundEffect_HandlerIndex
    STA a:SND_CHN                           ; Clear the sound channel.
    STA a:Game_PausedState                  ; Clear the paused flag.
    STA a:SoundEffect_Unused_PriorityID     ; Clear the ID of the
                                            ; highest-priority sound effect.
    RTS


;============================================================================
; Pause audio when the game is paused.
;
; This will mark the audio as paused in response to the game
; being paused.
;
; If there's no music set, and no sound effects set, then
; this will also trigger a full audio reset.
;
; INPUTS:
;     N:
;         The game/audio paused state.
;
;         See Game_PausedState for documentation.
;
;     Music_Current:
;         The current music to check.
;
;     SoundEffect_TicksRemaining:
;         The list of sound effect slots to check.
;
; OUTPUTS:
;     Game_PausedState:
;         The updated paused state.
;
; CALLS:
;     Audio_Reset
;     Audio_ResetIfNothingSet
;
; XREFS:
;     Music_HandleOnInterrupt
;============================================================================
Audio_HandlePaused:                         ; [$802e]
    ;
    ; First, check if we've already handled an audio pause state.
    ;
    BMI Audio_ResetIfNothingSet             ; If the audio paused state is
                                            ; already set, then jump.


    ;
    ; The game is paused, but audio is not. Set that bit and
    ; reset audio.
    ;
    ORA #$80                                ; Set bit 7 (audio paused).
    STA a:Game_PausedState                  ; Store it.
    JSR Audio_Reset                         ; Reset audio.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Reset the audio state if no music or sounds are set.
;
; If there's no music set, and no sound effects set, then
; this will trigger a full audio reset.
;
; INPUTS:
;     Music_Current:
;         The current music to check.
;
;     SoundEffect_TicksRemaining:
;         The list of sound effect slots to check.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Audio_Reset
;
; XREFS:
;     Audio_HandlePaused
;     Music_HandleOnInterrupt
;============================================================================
Audio_ResetIfNothingSet:                    ; [$8038]
    LDA Music_Current                       ; Load the current music.
    BNE @_return                            ; If it's set, return. Nothing to
                                            ; do.


    ;
    ; There's no music playing. Check if sound effects
    ; are playing.
    ;
    LDX #$03                                ; X = 3 (loop counter).

  @_checkSoundEffectLoop:                   ; [$803e]
    LDA SoundEffect_TicksRemaining,X        ; Load the sound effect at the
                                            ; current index.
    BNE @_return                            ; If it's set, then return.
    DEX                                     ; X-- (loop counter).
    BPL @_checkSoundEffectLoop              ; If >= 0, loop.


    ;
    ; This has looped through all sound effects, and none
    ; were set. Audio can now be reset.
    ;
    JMP Audio_Reset                         ; Reset the audio.

  @_return:                                 ; [$8049]
    RTS


;============================================================================
; Reset all audio channels.
;
; Square Wave 1 Hi/Lo and Noise Volume will be set to 16.
; Everything else will be set to 0.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     SQ1_HI:
;     SQ1_LO:
;     NOISE_VOL:
;         Set to 16.
;
;     NOISE_HI:
;     NOISE_LO:
;     SQ1_SWEEP:
;     SQ1_VOL:
;     SQ2_HI:
;     SQ2_LO:
;     SQ2_SWEEP:
;     SQ2_VOL:
;     TRI_HI:
;     TRI_LINEAR:
;     TRI_LO:
;         Set to 0.
;
; XREFS:
;     Audio_HandlePaused
;     Audio_ResetIfNothingSet
;     Music_Load
;     SoundEffects_Init
;============================================================================
Audio_Reset:                                ; [$804a]
    LDA #$10
    STA a:SQ1_VOL                           ; Set to 16.
    STA a:SQ2_VOL                           ; Set to 16.
    STA a:NOISE_VOL                         ; Set to 16.
    LDA #$00
    STA a:SQ1_SWEEP                         ; Set to 0.
    STA a:SQ1_LO                            ; Set to 0.
    STA a:SQ1_HI                            ; Set to 0.
    STA a:SQ2_SWEEP                         ; Set to 0.
    STA a:SQ2_LO                            ; Set to 0.
    STA a:SQ2_HI                            ; Set to 0.
    STA a:TRI_LINEAR                        ; Set to 0.
    STA a:TRI_LO                            ; Set to 0.
    STA a:TRI_HI                            ; Set to 0.
    STA a:NOISE_LO                          ; Set to 0.
    STA a:NOISE_HI                          ; Set to 0.
    RTS


;============================================================================
; Load channel and MScript state for music.
;
; XREFS:
;     Music_HandleOnInterrupt
;============================================================================
Music_Load:                                 ; [$8079]
    ;
    ; Load the current music to play.
    ;
    LDA Music_Current                       ; Load the current music.
    ORA #$80                                ; Mark as currently playing.
    STA Music_Current                       ; Store that.


    ;
    ; Convert to a lookup index for the table.
    ;
    ; This will be multiplied by 8, giving us word boundaries
    ; across 4 channels.
    ;
    ASL A                                   ; Convert to a word boundary.
    ASL A                                   ; And multiply by 4 channels.
    ASL A
    TAY                                     ; Y = result (Music lookup
                                            ; index).


    ;
    ; Begin loading the starting MScripts.
    ;
    ; This will load all 4 channels of MScripts for the selected
    ; piece of music, indexed from last channel to first.
    ;
    ; Bear in mind, the loop counter is looping over addresses, so
    ; it loops 8 times, or 2 bytes * 4 channels. Indexes will be
    ; based off the music ID, though, not the loop counter.
    ;
    LDX #$07                                ; X = 7 (loop counter).

  @_loadMusicLoop:                          ; [$8085]
    LDA MSCRIPTS_LOOKUP,Y                   ; Load the MScript channel
                                            ; address at Y.
    STA Music_CurrentScriptAddrs,X          ; Store it in the list of channel
                                            ; addresses.


    ;
    ; BUG: This tries to save the address for a return/repeat, but
    ;      it always saves in the first channel slot, which is
    ;      incorrect.
    ;
    STA a:MScript_SavedAddr                 ; Store it as the latest saved
                                            ; address as well, for push/pop
                                            ; purposes.


    ;
    ; Prepare for the next loop iteration and lookup.
    ;
    DEY                                     ; Y-- (lookup index).
    DEX                                     ; X-- (loop counter).
    BPL @_loadMusicLoop                     ; If X >= 0, loop.


    ;
    ; We're out of the loop. Clear a bunch of state.
    ;
    INX                                     ; Set X back to 0 (-1 + 1 == 0).
    STX a:Music_Global_Transpose
    STX a:Music_Channel_Transpose
    STX a:Music_Channel_Transpose_1_
    STX a:Music_Channel_Transpose_2_
    STX a:Music_SQ_Fades
    STX a:Music_SQ_Fades_1_
    STX a:Music_SQEnvelope_Mode
    STX a:Music_SQEnvelope_Mode_1_
    STX a:Music_SQEnvelope_Phase
    STX a:Music_SQEnvelope_Phase_1_
    STX a:Music_Current_SQ_Low
    STX a:Music_Current_SQ_Low_1_
    STX a:Music_Note_Period_Low
    STX a:Music_Note_Period_High
    STX a:MScript_Unused_RawValue
    STX a:Something_Music_Triangle_017e
    STX a:Music_Noise_Remaining
    STX a:Music_SQEffect_Delta
    STX a:MScript_CurValue
    STX a:Music_SQPitchDelta_Mask
    STX a:Music_SQPitchDelta_Mask_1_
    STX a:Music_SQ2_TimerLowBias


    ;
    ; Set the following to 1.
    ;
    INX                                     ; X = 1
    STX a:Music_NoteTicksRemaining
    STX a:Music_NoteTicksRemaining_1_
    STX a:Music_NoteTicksRemaining_2_
    STX a:Music_NoteTicksRemaining_3_


    ;
    ; Clear the repeat counts for each channel.
    ;
    STX a:MScript_NoteDurations
    STX a:MScript_NoteDurations_1_
    STX a:MScript_NoteDurations_2_
    STX a:MScript_NoteDurations_3_


    ;
    ; Set the following to 8.
    ;
    LDA #$08                                ; A = 8
    STA a:Music_SQ_Note_Lengths
    STA a:Music_Note_Length_High
    STA a:Music_Unused_0166
    STA a:Music_Unused_0166_1_


    ;
    ; Set the following to 144.
    ;
    LDA #$90                                ; A = 144
    STA a:Music_SQ_ControlBits
    STA a:Music_SQ_ControlBits_1_


    ;
    ; Reset audio channels.
    ;
    JMP Audio_Reset                         ; Reset the audio channels.


;============================================================================
; Play the next op in each MScript channel.
;
; This will perform the next operation for each channel,
; unsetting the music if all are complete.
;
; If a channel has a repeat set, its repeat count will
; be reduced by 1 and the current note/value will be played.
; Otherwise, the next operation in the MScript will be
; invoked.
;
; Once all channels are marked completed, the music will be
; unset.
;
; INPUTS:
;     Music_NoteTicksRemaining:
;         The repeat counters for each channel.
;
; OUTPUTS:
;     Music_NoteTicksRemaining:
;         The updated repeat counters for each channel.
;
;     Music_NumChannelsCompleted:
;         The number of channels completed after this run.
;
;     Music_Current:
;         Unset, if all channels completed.
;
;     MScript_CurrentChannel:
;         Clobbered.
;
; CALLS:
;     MScripts_InvokeNext
;     Music_PlayForChannel
;
; XREFS:
;     Music_HandleOnInterrupt
;============================================================================
Music_PlayNext:                             ; [$8106]
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
    DEC Music_NoteTicksRemaining,X
    BNE @_play
    JSR MScripts_InvokeNext

  @_play:                                   ; [$8119]
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
    STA Music_Current                       ; Unset the current music.

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
;     Music_PlayNext
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
    LDA SoundEffect_TicksRemaining,X        ; Load the current sound effect
                                            ; on the Triangle Wave channel.
    BNE @_clearTriangleWave                 ; If one is set, jump to clear
                                            ; it.


    ;
    ; No sound effect is playing on the Triangle Wave channel.
    ;
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
    LDY Music_SQEnvelope_Mode,X
    BEQ Music_PlaySQEnvelopeModeLinearTrailoff
    DEY
    BEQ Music_PlaySQEnvelopeModeCurveButHeld
    DEY
    BEQ Music_PlaySQEnvelopeModePluck
    RTS


;============================================================================
; Play SQ envelope mode 0: Linear, trails off.
;
; This updates the Square Wave channel's volume level,
; optionally applying a square pitch effect.
;
; This is used to smoothly fade out the volume.
;
; INPUTS:
;     MScript_CurrentChannel:
;         The current MScript channel.
;
;     Music_SQEnvelope_Value:
;         The counter values for the mode, across
;         SQ channels.
;
;     SoundEffect_TicksRemaining:
;         The currently-playing sound effects.
;
; OUTPUTS:
;     Music_SQEnvelope_Value:
;         The updated counter values.
;
;     MScript_CurValue:
;         The updated volume.
;
; CALLS:
;     Music_ApplySQPitchEffectToLO:
;     Music_UpdateSQVolRegister
;
; XREFS:
;     Music_PlayForChannel
;============================================================================
Music_PlaySQEnvelopeModeLinearTrailoff:     ; [$816f]
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.


    ;
    ; Check if the counter is 0. If so, it'll stay that way
    ; until playback finishes.
    ;
    LDA Music_SQEnvelope_Value,X            ; Load the fade-out counter value
                                            ; for the mode.
    BEQ @LAB_PRG5__817d                     ; If it's 0, jump.


    ;
    ; The counter is a positive value. Subtract 3 and store it.
    ;
    SEC
    SBC #$03                                ; Subtract 3 from the counter.
    STA Music_SQEnvelope_Value,X            ; Store the new counter.


    ;
    ; Convert the value to a value between 0-15.
    ;
    ; This effectively shifts any value into the lower nibble.
    ;
  @LAB_PRG5__817d:                          ; [$817d]
    LSR A                                   ; Shift into the lower nibble.
    LSR A
    LSR A
    LSR A
    AND #$0f                                ; Mask out the upper nibble.
    STA a:MScript_CurValue                  ; Store as the new volume value
                                            ; for the Square Wave.


    ;
    ; Check if any special effects are playing on this channel.
    ;
    LDA SoundEffect_TicksRemaining,X        ; Load any current special
                                            ; effects on this channel.
    BNE @_return                            ; If set, return.
    JSR Music_UpdateSQVolRegister           ; Update the volume and flags the
                                            ; SQ*_VOL register.
    JSR Music_ApplySQPitchEffectToLO        ; Apply the mode's pitch effect
                                            ; to the SQ*_LO register.

  @_return:                                 ; [$8191]
    RTS
;============================================================================
; TODO: Document Music_PlaySQEnvelopeModeCurveButHeld
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
Music_PlaySQEnvelopeModeCurveButHeld:       ; [$8192]
    ;
    ; This is SQ Mode 1: Curve but held
    ;
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    LDA Music_SQEnvelope_Value,X
    AND #$0f
    STA Music_SQEnvelope_Value,X
    CMP #$0d
    BCC @LAB_PRG5__81a7
    DEC Music_SQEnvelope_Value,X
    DEC Music_SQEnvelope_Value,X

  @LAB_PRG5__81a7:                          ; [$81a7]
    INC Music_SQEnvelope_Phase,X
    LDA Music_SQEnvelope_Value,X
    STA a:MScript_CurValue
    LDA SoundEffect_TicksRemaining,X
    BNE @_return
    JSR Music_UpdateSQVolRegister
    JSR Music_ApplySQPitchEffectToLO

  @_return:                                 ; [$81bb]
    RTS
;============================================================================
; TODO: Document Music_PlaySQEnvelopeModePluck
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
Music_PlaySQEnvelopeModePluck:              ; [$81bc]
    ;
    ; This is SQ Mode 2: Table-based envelope (pluck effect)
    ;
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    LDA Music_SQEnvelope_Phase,X
    LSR A
    LSR A
    TAY
    LDA SQ_MODE_2_PLUCK_VALUES,Y
    BEQ @LAB_PRG5__81cd
    INC Music_SQEnvelope_Phase,X

  @LAB_PRG5__81cd:                          ; [$81cd]
    STA a:MScript_CurValue
    LDA SoundEffect_TicksRemaining,X
    BNE @_return
    JSR Music_UpdateSQVolRegister
    JSR Music_ApplySQPitchEffectToLO

  @_return:                                 ; [$81db]
    RTS

;
; XREFS:
;     Music_PlaySQEnvelopeModePluck
;
SQ_MODE_2_PLUCK_VALUES:                     ; [$81dc]
    .byte $07                               ; [0]:
    .byte $0a                               ; [1]:
    .byte $0d                               ; [2]:
    .byte $0f                               ; [3]:
    .byte $0e                               ; [4]:
    .byte $0d                               ; [5]:
    .byte $0c                               ; [6]:
    .byte $0b                               ; [7]:
    .byte $0a                               ; [8]:
    .byte $09                               ; [9]:
    .byte $08                               ; [10]:
    .byte $07                               ; [11]:
    .byte $06                               ; [12]:
    .byte $05                               ; [13]:
    .byte $04                               ; [14]:
    .byte $03                               ; [15]:
    .byte $02                               ; [16]:
    .byte $02                               ; [17]:
    .byte $01                               ; [18]:
    .byte $01                               ; [19]:
    .byte $00                               ; [20]:


;============================================================================
; Update the Square Wave volume and control bits.
;
; This will load in the pending value for square wave volume
; and reduce it by any fade set by an MScript op. This will
; be the volume for the SQ1_VOL or
; SQ2_VOL channel.
;
; The control bits (duty cycle, length counter halt,
; constant volume/envelope flag) will then be applied to
; the register.
;
; See https://www.nesdev.org/wiki/APU_Pulse
;
; INPUTS:
;     MScript_CurrentChannel:
;         The current channel being processed (0 or 1).
;
;     MScript_CurValue:
;         The current volume value to use as a base.
;
;     Music_SQ_Fades:
;         The fade values to subtract from the volume
;         (indexed by channel).
;
;     Music_SQ_ControlBits:
;         The control bits to set for the register.
;
; OUTPUTS:
;     SQ1_VOL:
;     SQ2_VOL:
;         The updated Square Wave register.
;
; XREFS:
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;============================================================================
Music_UpdateSQVolRegister:                  ; [$81f1]
    ;
    ; Compute the address for the Square Wave volume register.
    ;
    LDX a:MScript_CurrentChannel            ; Load the MScript channel.
    TXA                                     ; A = result.
    ASL A                                   ; Convert to a word boundary.
    ASL A                                   ; And double, giving us the start
                                            ; of either SQ channel volume
                                            ; addresses.
    TAY                                     ; Y = resulting index.


    ;
    ; Apply any fade set.
    ;
    LDA a:MScript_CurValue                  ; Load the volume to set.
    SEC
    SBC Music_SQ_Fades,X                    ; Subtract any fade that was set.
    BCS @_setVolume                         ; If positive, jump.


    ;
    ; The volume went negative. Cap to 0.
    ;
    LDA #$00                                ; Set the volume to 0.

  @_setVolume:                              ; [$8203]
    LDX a:MScript_CurrentChannel            ; Load the current SQ channel as
                                            ; an index.
    ORA Music_SQ_ControlBits,X              ; Apply control bits to the value
                                            ; to set for the register.
    STA SQ1_VOL,Y                           ; And set the register.
    RTS

;============================================================================
; TODO: Document Music_ApplySQPitchEffectToLO
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;============================================================================
Music_ApplySQPitchEffectToLO:               ; [$820d]
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.


    ;
    ; Make sure the phase counter reached 18 before we make any
    ; changes. This provides a delay.
    ;
    LDA Music_SQEnvelope_Phase,X            ; Load the phase counter for the
                                            ; channel.
    CMP #$12                                ; Is it < 18?
    BCC @_return                            ; If so, end.


    ;
    ; The counter hit 18, so we can begin updating state.
    ;
    ; First we'll divide the counter by 4, giving a quarter speed.
    ; Then we'll AND with the depth mask, defining the range (e.g.,
    ; $04 == 0..4 repeating).
    ;
    ; The result is a delta used later.
    ;
    LSR A                                   ; Divide by 4, giving quarter
                                            ; speed.
    LSR A
    AND Music_SQPitchDelta_Mask,X           ; AND with our depth mask,
                                            ; defining the range.
    STA a:Music_SQEffect_Delta              ; Store as the delta.
    LDA SoundEffect_TicksRemaining,X        ; Check for sound effects on this
                                            ; channel.
    BNE @_return                            ; If any are set, skip playing on
                                            ; this channel.


    ;
    ; No sound effects are playing, so we can continue.
    ;
    LDA a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    ASL A                                   ; Convert to a word boundary.
    ASL A                                   ; And multiply by 2 for the
                                            ; channel offset.
    TAY                                     ; Y = resulting index.


    ;
    ; Don't apply the effect if the base is too small to subtract from.
    ;
    LDA Music_Current_SQ_Low,X              ; Load the low value .
    CMP Music_SQPitchDelta_Mask,X           ; Is it less than the depth mask?
    BCC @_return                            ; If so, return.


    ;
    ; Subtract the delta and store it in the SQ*_LO register.
    ;
    SEC
    SBC a:Music_SQEffect_Delta              ; Subtract the delta calculated
                                            ; above.
    STA SQ1_LO,Y                            ; And store it in the register.

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
;     MScript_Op_BeginLoop
;     MScript_Op_EndLoop
;     MScript_Op_JumpSubroutine
;     MScript_Op_NextLoopIfNCompleted
;     MScript_Op_NoOp
;     MScript_Op_RestartChannel
;     MScript_Op_RestoreAddr
;     MScript_Op_Return
;     MScript_Op_SaveAddr
;     MScript_Op_SetChannelTranspose
;     MScript_Op_SetControlBits
;     MScript_Op_SetGlobalTranspose
;     MScript_Op_SetSQ2Detune
;     MScript_Op_SetSQEnvelopeMode
;     MScript_Op_SetSQPitchEffectDepth
;     MScript_Op_SetSQVol
;     MScripts_SetNoteLengthFromValue
;     Music_PlayNext
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
    BCC MScripts_SetNoteLengthFromNext      ; If so, jump.


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
    pointer MScript_Op_End-1                ; MScript_Op_End
                                            ; [$PRG5::826a]
    pointer MScript_Op_RestoreAddr-1        ; MScript_Op_RestoreAddr
                                            ; [$PRG5::826c]
    pointer MScript_Op_BeginLoop-1          ; MScript_Op_BeginLoop
                                            ; [$PRG5::826e]
    pointer MScript_Op_EndLoop-1            ; MScript_Op_EndLoop
                                            ; [$PRG5::8270]
    pointer MScript_Op_NextLoopIfNCompleted-1 ; MScript_Op_NextLoopIfNCompleted
                                              ; [$PRG5::8272]
    pointer MScript_Op_NoOp-1               ; MScript_Op_NoOp
                                            ; [$PRG5::8274]
    pointer MScript_Op_SaveAddr-1           ; MScript_Op_SaveAddr
                                            ; [$PRG5::8276]
    pointer MScript_Op_JumpSubroutine-1     ; MScript_Op_JumpSubroutine
                                            ; [$PRG5::8278]
    pointer MScript_Op_SetGlobalTranspose-1 ; MScript_Op_SetGlobalTranspose
                                            ; [$PRG5::827a]
    pointer MScript_Op_SetChannelTranspose-1 ; MScript_Op_SetChannelTranspose
                                             ; [$PRG5::827c]
    pointer MScript_Op_Return-1             ; MScript_Op_Return
                                            ; [$PRG5::827e]
    pointer MScript_Op_RestartChannel-1     ; MScript_Op_RestartChannel
                                            ; [$PRG5::8280]
    pointer MScript_Op_RepeatValue-1        ; MScript_Op_RepeatValue
                                            ; [$PRG5::8282]
    pointer MScript_Op_SetControlBits-1     ; MScript_Op_SetControlBits
                                            ; [$PRG5::8284]
    pointer MScript_Op_SetSQVol-1           ; MScript_Op_SetSQVol
                                            ; [$PRG5::8286]
    pointer MScript_Op_SetSQEnvelopeMode-1  ; MScript_Op_SetSQEnvelopeMode
                                            ; [$PRG5::8288]
    pointer MScript_Op_SetSQPitchEffectDepth-1 ; MScript_Op_SetSQPitchEffectDepth
                                               ; [$PRG5::828a]
    pointer MScript_Op_SetSQ2Detune-1       ; MScript_Op_SetSQ2Detune
                                            ; [$PRG5::828c]

;============================================================================
; TODO: Document MScripts_SetNoteLengthFromNext
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
MScripts_SetNoteLengthFromNext:             ; [$828e]
    LDA a:MScript_CurValue                  ; Load the current script value.
    AND #$7f                                ; Discard bit 7.
    BPL MScripts_SetNoteLengthFromValue

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document MScript_Op_RepeatValue
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_RepeatValue:                     ; [$8295]
    JSR MScripts_GetNextValue               ; Get the next value in the
                                            ; script.

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document MScripts_SetNoteLengthFromValue
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MScripts_SetNoteLengthFromNext
;============================================================================
MScripts_SetNoteLengthFromValue:            ; [$8298]
    LDX a:MScript_CurrentChannel
    STA MScript_NoteDurations,X
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
    BCS @_beginCheckOffsets
    ASL A
    ASL A
    ASL A
    ASL A
    ORA #$08
    STA Music_SQ_Note_Lengths,X
    CMP #$08
    BNE @_invokeNext
    LDA #$18
    BNE @_storeLength

  @_beginCheckOffsets:                      ; [$82cc]
    LDY #$00

  @_checkOffsetLoop:                        ; [$82ce]
    CMP MUSIC_CHANNEL_NOTE_OFFSETS_3_,Y
    BCS @_loadLength
    INY
    INY
    BNE @_checkOffsetLoop

  @_loadLength:                             ; [$82d7]
    LDA BYTE_PRG5__8570,Y

  @_storeLength:                            ; [$82da]
    STA Music_SQ_Note_Lengths,X

  @_invokeNext:                             ; [$82dd]
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
    JMP Music_StoreNoteDuration

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
    LDA a:SoundEffect_TicksRemaining_3_
    BEQ @LAB_PRG5__830a
    JMP Music_StoreNoteDuration

  @LAB_PRG5__830a:                          ; [$830a]
    LDA a:Music_Noise_Index
    BNE @LAB_PRG5__8312
    JMP Music_StoreNoteDuration

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
    JMP Music_StoreNoteDuration

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
    LDA SoundEffect_TicksRemaining,X
    BEQ @_setNote
    JMP Music_StoreNoteDuration

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
    STA a:Music_SQEnvelope_Phase
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
    CMP a:Music_SQ2_TimerLowBias
    BCC @_setSQ2HiLo
    SEC
    SBC a:Music_SQ2_TimerLowBias

  @_setSQ2HiLo:                             ; [$838d]
    STA a:SQ2_LO
    STA a:Music_Current_SQ_Low_1_
    LDA a:Music_Note_Period_High
    ORA a:Music_Note_Length_High
    STA a:SQ2_HI
    LDA #$00
    STA a:Music_SQEnvelope_Phase_1_

  @_finish:                                 ; [$83a1]
    LDX a:MScript_CurrentChannel
    LDA #$ff
    STA Music_SQEnvelope_Value,X
    JSR Music_StoreNoteDuration
    RTS


;============================================================================
; Set the current per-channel repeat duration.
;
; MScripts maintain a per-channel "repeat count", which
; controls how many update ticks the current
; note/rest/noise value should be held before the script
; advances to the next byte.
;
; This copies MScript_NoteDurations (set by a script) into
; Music_NoteTicksRemaining (used for play back) for the
; current channel, which is decremented by the main music
; update loop to delay script advancement.
;
; INPUTS:
;     MScript_CurrentChannel:
;         The current MScript channel.
;
;     MScript_NoteDurations:
;         The per-channel repeat counts set by the script.
;
; OUTPUTS:
;     Music_NoteTicksRemaining:
;         The remaining tick counts for playback.
;
; XREFS:
;     MScripts_PlayIfHasValue
;     Music_PlayNoise
;     Music_PlayTriangleWave
;     Music_PlayWave
;============================================================================
Music_StoreNoteDuration:                    ; [$83ad]
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    LDA MScript_NoteDurations,X             ; Load the repeat counts for this
                                            ; channel.
    STA Music_NoteTicksRemaining,X          ; Copy them over.
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
    JSR Music_StoreNoteDuration
    STA a:MScript_CurValue
    LSR A
    LSR A
    STA a:Music_SQEffect_Delta
    LDA a:MScript_CurValue
    SEC
    SBC a:Music_SQEffect_Delta
    STA a:Something_Music_Triangle_017e
    RTS


;============================================================================
; Set the note value to play.
;
; Note values are relative semitone indices, not absolute
; pitches. They are are converted into a playable frequency
; through several transformations.
;
; The final pitch depends on:
;
; 1. The channel base offset (MUSIC_CHANNEL_NOTE_OFFSETS)
; 2. The channel transposition (Music_Channel_Transpose)
; 3. The global transposition (Music_Global_Transpose)
; 4. An octave normalization loop (12 semitones per octave)
;
; A value of 0x00 represents a rest. Any other value is
; processed through the above steps.
;
; As a result, the same byte value in different MScripts
; (or on different channels) does not necessarily produce
; the same audible pitch.
;
; XREFS:
;     Music_PlayWave
;============================================================================
Music_SetNote:                              ; [$83cd]
    LDX a:MScript_CurrentChannel
    LDA a:MScript_CurValue
    CLC
    ADC MUSIC_CHANNEL_NOTE_OFFSETS,X
    CLC
    ADC Music_Channel_Transpose,X
    CLC
    ADC a:Music_Global_Transpose
    STY a:MScript_Unused_RawValue


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
; MScript Op 0xFF: End the channel's script.
;
; XREFS:
;     MSCRIPT_OP_HANDLERS [$PRG5::826a]
;============================================================================
MScript_Op_End:                             ; [$8408]
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.


    ;
    ; Repeat this every time it's called.
    ;
    ; This ensures that this channel stays on this
    ; instruction until every channel has completed.
    ;
    LDA #$01
    STA Music_NoteTicksRemaining,X          ; Set this to repeat 1 more time
                                            ; (infinitely).
    TXA                                     ; A = MScript channel.
    ASL A                                   ; Convert to a word boundary for
                                            ; an address index.
    TAX                                     ; X = result.


    ;
    ; Decrement the offset into the script to keep it on this
    ; 0xFF operation until all channels complete.
    ;
    LDA Music_CurrentScriptAddrs,X          ; Load the current script address
                                            ; for this channel.
    BNE @_setAddr                           ; If lower byte is not 0, jump.


    ;
    ; Lower byte of the address is 0. We'll need to decrement
    ; the upper byte.
    ;
    DEC Music_CurrentScriptAddrs+1,X        ; Decrement the upper byte of the
                                            ; address.

  @_setAddr:                                ; [$8419]
    DEC Music_CurrentScriptAddrs,X          ; Decrement the lower byte of the
                                            ; address.


    ;
    ; Mark this channel as completed.
    ;
    INC a:Music_NumChannelsCompleted        ; Mark the channel as complete.
    RTS


;============================================================================
; MScript Op $FD: Begin Loop.
;
; Marks the start of a loop. This address will be used
; when looping.
;
; The loop will end when after it completes the specified
; number of loops, or when another operation breaks out
; of the loop.
;
; The initial loop counter is set to 1 internally.
;
; Loops cannot be nested.
;
; ARGS:
;     1. Number of iterations (1 byte)
;============================================================================
MScript_Op_BeginLoop:                       ; [$841f]
    ;
    ; Read the number of iterations to loop from the script.
    ;
    JSR MScripts_GetNextValue               ; Load the next value from the
                                            ; script.
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    STA MScript_LoopLength,X                ; Store the length of this loop
                                            ; to the next value.


    ;
    ; Set the starting value for the loop counter (1).
    ;
    LDA #$01
    STA MScript_LoopCounter,X               ; Set the starting loop counter
                                            ; to 1.


    ;
    ; Store the start address of the loop.
    ;
    TXA                                     ; A = Loop length.
    ASL A                                   ; Convert to a word boundary for
                                            ; an index.
    TAX                                     ; X = resulting index.
    LDA Music_CurrentScriptAddrs,X          ; Load the lower byte of the
                                            ; current script address for the
                                            ; channel.
    STA MScript_LoopStartAddrs,X            ; Store as the lower byte of the
                                            ; starting address for the loop.
    LDA Music_CurrentScriptAddrs+1,X        ; Load the upper byte.
    STA MScript_LoopStartAddrs+1,X          ; Store that.


    ;
    ; We're done. Invoke the next op in the script.
    ;
    JMP MScripts_InvokeNext                 ; Invoke the next operation.


;============================================================================
; MSCript Op $FE: Restart Loop If >= N Iterations
;
; If >= N iterations have been completed, restart the
; loop, advancing the loop iteration count.
;
; If < N iterations have been completed, proceed with
; the next operation in the script.
;
; ARGS:
;     1. Number of iterations to check (1 byte)
;============================================================================
MScript_Op_NextLoopIfNCompleted:            ; [$843d]
    JSR MScripts_GetNextValue               ; Load the current MScript
                                            ; channel.
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    CMP MScript_LoopCounter,X               ; Has the specified number of
                                            ; loops been completed?
    BCS @_invokeNext                        ; If so, invoke the next
                                            ; operation within this loop.


    ;
    ; The specified number of loops have not been completed.
    ; Restart the loop.
    ;
    TXA                                     ; A = Current channel.
    ASL A                                   ; Convert to a word boundary for
                                            ; lookup tables.
    TAX                                     ; X = result.
    LDA MScript_LoopEndAddrs,X              ; Load the lower byte of the loop
                                            ; end address.
    STA Music_CurrentScriptAddrs,X          ; Set as the lower byte of the
                                            ; next address.
    LDA MScript_LoopEndAddrs+1,X            ; Load the upper byte of the loop
                                            ; end address.
    STA Music_CurrentScriptAddrs+1,X        ; Set as the upper byte of the
                                            ; next address.

  @_invokeNext:                             ; [$8455]
    JMP MScripts_InvokeNext


;============================================================================
; MScript Op $FC: End Loop.
;
; Marks the end of the loop.
;
; If the loop counter has hit the loop length (and
; remember, the loop counter is 1-based), the loop will
; end.
;
; If it's under the loop length, the loop will restart.
;============================================================================
MScript_Op_EndLoop:                         ; [$8458]
    LDX a:MScript_CurrentChannel            ; Load the current MScript
                                            ; channel.
    LDA MScript_LoopCounter,X               ; Load the current loop counter.
    CMP MScript_LoopLength,X                ; Is it >= the loop length?
    BCS @_invokeNext                        ; If so, invoke the next
                                            ; operation after the loop.


    ;
    ; The script can continue to loop.
    ;
    INC MScript_LoopCounter,X               ; Increment the loop counter.
    TXA                                     ; A = MScript channel.
    ASL A                                   ; Convert to a word boundary for
                                            ; lookup tables.
    TAX                                     ; X = resulting index.


    ;
    ; Set the current script address as the end of the loop.
    ;
    LDA Music_CurrentScriptAddrs,X          ; Load the lower byte of the
                                            ; current script address.
    STA MScript_LoopEndAddrs,X              ; Set as the lower byte of the
                                            ; end of the loop.
    LDA Music_CurrentScriptAddrs+1,X        ; Load the upper byte of the
                                            ; current script address.
    STA MScript_LoopEndAddrs+1,X            ; Set as the upper byte of the
                                            ; end of the loop.


    ;
    ; Set the start of the loop as the current script address.
    ;
    LDA MScript_LoopStartAddrs,X            ; Load the lower byte of the
                                            ; address of the start of the
                                            ; loop.
    STA Music_CurrentScriptAddrs,X          ; Set as the lower byte of the
                                            ; current script address.
    LDA MScript_LoopStartAddrs+1,X          ; Load the upper byte of the
                                            ; address of the start of the
                                            ; loop.
    STA Music_CurrentScriptAddrs+1,X        ; Set as the upper byte of the
                                            ; current script address.


    ;
    ; We're done. Proceed with the script, either looping or
    ; moving on from the loop.
    ;
  @_invokeNext:                             ; [$847d]
    JMP MScripts_InvokeNext                 ; Invoke the next operation in
                                            ; the script.


;============================================================================
; MScript Op $FA: No-Op
;
; Does nothing. Simply acts as padding to help keep
; scripts across channels in sync.
;============================================================================
MScript_Op_NoOp:                            ; [$8480]
    JMP MScripts_InvokeNext                 ; Invoke the next operation in
                                            ; the script.

;============================================================================
; TODO: Document MScript_Op_SetControlBits
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SetControlBits:                  ; [$8483]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_SQ_ControlBits,X
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
    JSR MScript_Op_SaveAddr_Store
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_SaveAddr_Store
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
MScript_Op_SaveAddr_Store:                  ; [$8495]
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
; TODO: Document MScript_Op_RestartChannel
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_RestartChannel:                  ; [$84b7]
    LDA Music_Current
    ASL A
    ASL A
    SEC
    SBC #$04
    ASL A
    TAY
    LDX #$00

  @_loop:                                   ; [$84c2]
    LDA MSCRIPTS_TITLESCREEN,Y
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
; TODO: Document MScript_Op_SetChannelTranspose
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SetChannelTranspose:             ; [$8502]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_Channel_Transpose,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_SetGlobalTranspose
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SetGlobalTranspose:              ; [$850e]
    JSR MScripts_GetNextValue
    STA a:Music_Global_Transpose
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
    STA Music_SQ_Fades,X
    JMP MScripts_InvokeNext


;============================================================================
; MScript Op $F0: Set the envelope mode for the Square Wave.
;
; This supports the following values:
;
; 0: Volume decay
;
;    Ramps down the volume smoothly.
;
; 1: Curve but held
;
;    Clamps the envelope into a range 0..15 and then slows
;    the decay.
;
; 2: Pre-built attack/decay curve
;
;    Pitches up and then down in a set pattern.
;============================================================================
MScript_Op_SetSQEnvelopeMode:               ; [$8523]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_SQEnvelope_Mode,X
    JMP MScripts_InvokeNext

;============================================================================
; TODO: Document MScript_Op_SetSQPitchEffectDepth
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
MScript_Op_SetSQPitchEffectDepth:           ; [$852f]
    JSR MScripts_GetNextValue
    LDX a:MScript_CurrentChannel
    STA Music_SQPitchDelta_Mask,X
    JMP MScripts_InvokeNext


;============================================================================
; MScript Op $EE: Set the SQ2 pitch bias (detune).
;
; This operation applies a SQ2-only pitch adjustment by
; subtracting a small value from the low byte of the
; square wave timer period before writing to SQ2_LO.
;
; The value is compared against the computed timer low
; byte and clamped to avoid underflow. This produces a
; subtle upward pitch shift when non-zero.
;
; This is not related to note length or envelope timing.
; It is a pitch modification applied after note
; calculation, before writing to the APU.
;
; This may be used to provide a simple chorus/harmony
; effect.
;
; A value of 0 disables this effect.
;============================================================================
MScript_Op_SetSQ2Detune:                    ; [$853b]
    JSR MScripts_GetNextValue
    STA a:Music_SQ2_TimerLowBias
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
;     MScript_Op_BeginLoop
;     MScript_Op_JumpSubroutine
;     MScript_Op_NextLoopIfNCompleted
;     MScript_Op_RepeatValue
;     MScript_Op_SetChannelTranspose
;     MScript_Op_SetControlBits
;     MScript_Op_SetGlobalTranspose
;     MScript_Op_SetSQ2Detune
;     MScript_Op_SetSQEnvelopeMode
;     MScript_Op_SetSQPitchEffectDepth
;     MScript_Op_SetSQVol
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
; Base note lookup table for 12 semitones (C..B), used
; with octave normalization.
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
    .word $0000                             ; [0]: Unused/padding
    .word $06ae                             ; [1]: C2
    .word $064e                             ; [2]: C2#2
    .word $05f3                             ; [3]: D2
    .word $059f                             ; [4]: D2#2
    .word $054d                             ; [5]: E2
    .word $0501                             ; [6]: F2
    .word $04b9                             ; [7]: F2#2
    .word $0475                             ; [8]: G2
    .word $0435                             ; [9]: G2#2
    .word $03f8                             ; [10]: A2
    .word $03bf                             ; [11]: A2#2
    .word $0389                             ; [12]: B2


;============================================================================
; Signed semitone offsets for pitched channels.
;
; Noise appears to be a sentinel.
;
; XREFS:
;     Music_SetNote
;============================================================================

;
; XREFS:
;     Music_SetNote
;
MUSIC_CHANNEL_NOTE_OFFSETS:                 ; [$856c]
    .byte $f4                               ; [0]: SQ1 (one octave down)
    .byte $f4                               ; [1]: SQ2 (one octave down)
    .byte $0c                               ; [2]: Triangle (1 octave up)

;
; XREFS:
;     MScripts_SetNoteLengthFromValue
;
MUSIC_CHANNEL_NOTE_OFFSETS_3_:              ; [$856f]
    .byte $7f                               ; [3]: Noise (sentinel?)

;
; XREFS:
;     MScripts_SetNoteLengthFromValue
;
BYTE_PRG5__8570:                            ; [$8570]
    .byte $08                               ; [$8570] byte

;
; XREFS:
;     MScripts_SetNoteLengthFromValue
;
BYTE_PRG5__8571:                            ; [$8571]
    .byte $60                               ; [$8571] byte

;
; XREFS:
;     MScripts_SetNoteLengthFromValue
;
BYTE_PRG5__8572:                            ; [$8572]
    .byte $c0,$50,$40,$30,$b0,$28,$30,$24   ; [$8572] byte
    .byte $d0,$1e,$50,$18,$a0               ; [$857a] byte

;
; XREFS:
;     Music_PlayNoise
;
MUSIC_NOISE_VALUES:                         ; [$857f]
    .byte $14                               ; [0]:
    .byte $20                               ; [1]:
    .byte $00                               ; [2]:
    .byte $f0                               ; [3]:
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $0f                               ; [2]:
    .byte $20                               ; [3]:
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $0a                               ; [2]:
    .byte $10                               ; [3]:
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $05                               ; [2]:
    .byte $00                               ; [3]:
    .byte $ff                               ; [$858f] byte


;============================================================================
; Table of sound effects to handler table indexes.
;
; XREFS:
;     SoundEffects_HandleOnInterrupt
;============================================================================

;
; XREFS:
;     SoundEffects_HandleOnInterrupt
;
SOUND_EFFECT_HANDLER_INDEXES:               ; [$8590]
    .byte $00                               ; [0]: Set up sound effects
    .byte $2c                               ; [1]: Message
    .byte $60                               ; [2]: Hit Enemy
    .byte $5c                               ; [3]: Enemy died
    .byte $64                               ; [4]: Player hit
    .byte $70                               ; [5]: Magic
    .byte $38                               ; [6]: Open door
    .byte $40                               ; [7]: Typing
    .byte $4c                               ; [8]: Item picked up
    .byte $50                               ; [9]: Coin touched
    .byte $68                               ; [10]: Magic hit by obstacle
    .byte $30                               ; [11]: Cursor moved
    .byte $58                               ; [12]: Shield hit by magic
    .byte $34                               ; [13]: Character inputted
    .byte $28                               ; [14]: Password character
                                            ; entered
    .byte $3c                               ; [15]: Pushing block
    .byte $54                               ; [16]: Coin dropped
    .byte $48                               ; [17]: ?? Unused
    .byte $44                               ; [18]: Pakukame
    .byte $24                               ; [19]: Fill HP or MP
    .byte $6c                               ; [20]: Tilte magic spell
    .byte $1c                               ; [21]: Step sound
    .byte $10                               ; [22]: Player died
    .byte $14                               ; [23]: Ladder dropped
    .byte $18                               ; [24]: Show player menu
    .byte $20                               ; [25]: Changed gold amount
    .byte $0c                               ; [26]: Use special item 2
    .byte $08                               ; [27]: Bread touched
    .byte $04                               ; [28]: Coin touched


;============================================================================
; A jump table of sound effect handler functions.
;
; This table is in pairs of sound effect setup and on-tick
; handlers. The setup handler runs when loading a new sound
; effect, and the on-tick handler runs for any existing
; loaded sound effect.
;
; These may be separate functions, or two parts of
; essentially the same function.
;
; XREFS:
;     SoundEffects_HandleOnInterrupt
;============================================================================

;
; XREFS:
;     SoundEffects_HandleOnInterrupt
;
SOUND_EFFECT_HANDLERS:                      ; [$85ad]
    pointer SoundEffects_Init-1             ; SoundEffects_Init
                                            ; [$PRG5::85ad]
    pointer SoundEffect_NoOp-1              ; SoundEffect_NoOp
                                            ; [$PRG5::85af]
    pointer SoundEffect_CoinTouched_Setup-1 ; 0x04
    pointer SoundEffect_CoinTouched_OnTick-1 ; SoundEffect_CoinTouched_OnTick
                                             ; [$PRG5::85b3]
    pointer SoundEffect_BreadTouched_Setup-1 ; 0x08
    pointer SoundEffect_BreadTouched_OnTick-1 ; SoundEffect_BreadTouched_OnTick
                                              ; [$PRG5::85b7]
    pointer SoundEffect_Maybe_UseSpecialItem2_Setup-1 ; 0x0C
    pointer SoundEffect_Maybe_UseSpecialItem2_OnTick-1 ; SoundEffect_Maybe_UseSpecialItem2_OnTick
                                                       ; [$PRG5::85bb]
    pointer SoundEffect_PlayerDied_Setup-1  ; 0x10
    pointer SoundEffect_PlayerDied_OnTick-1 ; SoundEffect_PlayerDied_OnTick
                                            ; [$PRG5::85bf]
    pointer SoundEffect_LadderDropped_Setup-1 ; 0x14
    pointer SoundEffect_LadderDropped_OnTick-1 ; SoundEffect_LadderDropped_OnTick
                                               ; [$PRG5::85c3]
    pointer SoundEffect_ShowPlayerMenu_Setup-1 ; 0x18
    pointer SoundEffect_ShowPlayerMenu_OnTick-1 ; SoundEffect_ShowPlayerMenu_OnTick
                                                ; [$PRG5::85c7]
    pointer SoundEffect_Maybe_Step_Setup-1  ; 0x1C
    pointer SoundEffect_Maybe_Step_OnTick-1 ; SoundEffect_Maybe_Step_OnTick
                                            ; [$PRG5::85cb]
    pointer SoundEffect_GoldAmountChanged_Setup-1 ; 0x20
    pointer SoundEffects_DecrementCounter-1 ; SoundEffects_DecrementCounter
                                            ; [$PRG5::85cf]
    pointer SoundEffect_FillHPOrMP_Setup-1  ; 0x24
    pointer SoundEffect_FillHPOrMP_OnTick-1 ; SoundEffect_FillHPOrMP_OnTick
                                            ; [$PRG5::85d3]
    pointer SoundEffect_PasswordCharInput_Setup-1 ; 0x28
    pointer SoundEffects_DecrementCounter-1 ; SoundEffects_DecrementCounter
                                            ; [$PRG5::85d7]
    pointer SoundEffect_Message_Setup-1     ; 0x2C
    pointer SoundEffect_Message_OnTick-1    ; SoundEffect_Message_OnTick
                                            ; [$PRG5::85db]
    pointer SoundEffect_CursorMoved_Setup-1 ; 0x30
    pointer SoundEffect_CursorMoved_OnTick-1 ; SoundEffect_CursorMoved_OnTick
                                             ; [$PRG5::85df]
    pointer SoundEffect_CharacterInput_Setup-1 ; 0x34
    pointer SoundEffect_CharacterInput_OnTick-1 ; SoundEffect_CharacterInput_OnTick
                                                ; [$PRG5::85e3]
    pointer SoundEffect_OpenDoor_Setup-1    ; 0x38
    pointer SoundEffect_OpenDoor_OnTick-1   ; SoundEffect_OpenDoor_OnTick
                                            ; [$PRG5::85e7]
    pointer SoundEffect_PushBlock_Setup-1   ; 0x3C
    pointer SoundEffect_PushBlock_OnTick-1  ; SoundEffect_PushBlock_OnTick
                                            ; [$PRG5::85eb]
    pointer SoundEffect_Maybe_Typing_Setup-1 ; 0x40
    pointer SoundEffect_Maybe_Typing_OnTick-1 ; SoundEffect_Maybe_Typing_OnTick
                                              ; [$PRG5::85ef]
    pointer SoundEffect_Pakukame_Setup-1    ; 0x44
    pointer SoundEffect_Pakukame_OnTick-1   ; SoundEffect_Pakukame_OnTick
                                            ; [$PRG5::85f3]
    pointer SoundEffect_0x48_Setup-1        ; 0x48
    pointer SoundEffect_0x48_OnTick-1       ; SoundEffect_0x48_OnTick
                                            ; [$PRG5::85f7]
    pointer SoundEffect_ItemPickedUp_Setup-1 ; 0x4C
    pointer SoundEffect_ItemPickedUp_OnTick-1 ; SoundEffect_ItemPickedUp_OnTick
                                              ; [$PRG5::85fb]
    pointer SoundEffect_CoinTouchedCommon_Setup-1 ; 0x50
    pointer SoundEffect_CoinTouchedCommon_OnTick-1 ; SoundEffect_CoinTouchedCommon_OnTick
                                                   ; [$PRG5::85ff]
    pointer SoundEffect_CoinDropped_Setup-1 ; 0x54
    pointer SoundEffect_CoinDropped_OnTick-1 ; SoundEffect_CoinDropped_OnTick
                                             ; [$PRG5::8603]
    pointer SoundEffect_ShieldHitByMagic_Setup-1 ; 0x58
    pointer SoundEffect_ShieldHitByMagic_OnTick-1 ; SoundEffect_ShieldHitByMagic_OnTick
                                                  ; [$PRG5::8607]
    pointer SoundEffect_EnemyDied_Setup-1   ; 0x5C
    pointer SoundEffect_EnemyDied_OnTick-1  ; SoundEffect_EnemyDied_OnTick
                                            ; [$PRG5::860b]
    pointer SoundEffect_HitEnemy_Setup-1    ; 0x60
    pointer SoundEffect_HitEnemy_OnTick-1   ; SoundEffect_HitEnemy_OnTick
                                            ; [$PRG5::860f]
    pointer SoundEffect_HitPlayer_Setup-1   ; 0x64
    pointer SoundEffect_HitPlayer_OnTick-1  ; SoundEffect_HitPlayer_OnTick
                                            ; [$PRG5::8613]
    pointer SoundEffect_MagicHitObstacle_Setup-1 ; 0x68
    pointer SoundEffect_MagicHitObstacle_OnTick-1 ; SoundEffect_MagicHitObstacle_OnTick
                                                  ; [$PRG5::8617]
    pointer SoundEffect_Tilte_Setup-1       ; 0x6C
    pointer SoundEffect_Tilte_OnTick-1      ; SoundEffect_Tilte_OnTick
                                            ; [$PRG5::861b]
    pointer SoundEffect_Magic_Setup-1       ; 0x70
    pointer SoundEffect_Magic_OnTick-1      ; SoundEffect_Magic_OnTick
                                            ; [$PRG5::861f]

;============================================================================
; TODO: Document SoundEffects_DecrementCounter
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffects_DecrementCounter:              ; [$8621]
    DEC a:SoundEffect_State_Counter
    BNE Sound_ResetCurrentSound_Return

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
;     SoundEffect_0x48_OnTick
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_CoinDropped_OnTick
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_EnemyDied_OnTick
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_LadderDropped_OnTick
;     SoundEffect_MagicHitObstacle_OnTick
;     SoundEffect_Magic_OnTick
;     SoundEffect_Maybe_Step_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Message_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_PushBlock_OnTick
;     SoundEffect_ShieldHitByMagic_OnTick
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_Tilte_OnTick
;     SoundEffects_HandleOnInterrupt
;============================================================================
Sound_ResetCurrentSound:                    ; [$8626]
    LDA #$00
    STA a:SoundEffect_HandlerIndex
    STA a:SoundEffect_Unused_PriorityID

    ;
    ; XREFS:
    ;     SoundEffects_DecrementCounter
    ;
Sound_ResetCurrentSound_Return:             ; [$862e]
    RTS
;============================================================================
; TODO: Document SoundEffects_HandleOnInterrupt
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     thunk_SoundEffects_HandleOnInterrupt
;============================================================================
SoundEffects_HandleOnInterrupt:             ; [$862f]
    ;
    ; Loop through all channels, decrementing the sound effect
    ; tick count for each.
    ;
    LDX #$03                                ; X = 3 (channel loop counter).

  @_checkActiveEffectsLoop:                 ; [$8631]
    LDA SoundEffect_TicksRemaining,X        ; Load the sound effect ticks
                                            ; remaining for this channel.
    BEQ @_prepareNextActiveEffectsLoopIter  ; If this channel is done,
                                            ; prepare for the next iteration.
    DEC SoundEffect_TicksRemaining,X        ; Reduce the ticks remaining by
                                            ; 1.

  @_prepareNextActiveEffectsLoopIter:       ; [$8639]
    DEX                                     ; X-- (loop counter).
    BPL @_checkActiveEffectsLoop            ; If >= 0, loop.


    ;
    ; Check if the current sound effect is playing or just set.
    ;
    ; Playing is indicated by bit 7 == 1.
    ;
    LDA SoundEffect_Current                 ; Load the ID of the sound effect
                                            ; that's set.
    BMI @_runOnTickHandler                  ; If the sound effect is playing
                                            ; (bit 7 is set), jump to load
                                            ; the current handler.


    ;
    ; The sound effect is set but not currently playing.
    ; Mark it as playing.
    ;
    TAX                                     ; X = A (sound effect ID).
    ORA #$80                                ; Set the Playing state (bit 7).
    STA SoundEffect_Current                 ; Update the sound effect.
    CPX #$1d                                ; Is this sound ID in range?
    BCS @_runOnTickHandler                  ; If so, load and run the on-tick
                                            ; handler.


    ;
    ; The sound effect ID is in range. Check if we have a
    ; computed sound effect handler for it.
    ;
    LDA a:SoundEffect_HandlerIndex          ; Load the current sound effect
                                            ; handler index.
    BEQ @_newHandler                        ; If 0 (init sound), we're ready
                                            ; to jump to load a new handler.


    ;
    ; There's an existing sound effect handler being used.
    ; Check if it matches the sound effect to play, and then
    ; either use it or load a new handler.
    ;
    LDA SOUND_EFFECT_HANDLER_INDEXES,X      ; Load the sound effect handler
                                            ; index for this sound effect.
    CMP a:SoundEffect_HandlerIndex          ; Does it match the existing
                                            ; handler?
    BCC @_newHandler                        ; If not, look for a new handler
                                            ; and reset for the sound.
    BNE @_runOnTickHandler                  ; Else, it's a match, so just
                                            ; load the handler to run it.


    ;
    ; Reset the sound effect handler and state for a new sound
    ; effect.
    ;
  @_newHandler:                             ; [$8658]
    LDA SOUND_EFFECT_HANDLER_INDEXES,X      ; Load the sound effect handler
                                            ; index for this ID.
    STA a:SoundEffect_HandlerIndex          ; Store as the new index.
    TAX                                     ; X = A (index).


    ;
    ; Clear out the number of ticks remaining for the old sound
    ; effect.
    ;
    LDA #$00
    STA a:SoundEffect_TicksRemaining        ; SQ1 ticks remaining = 0
    STA a:SoundEffect_TicksRemaining_1_     ; SQ2 ticks remaining = 0
    STA a:SoundEffect_TicksRemaining_2_     ; TRI ticks remaining = 0
    STA a:SoundEffect_TicksRemaining_3_     ; Noise ticks remaining = 0
    BEQ @_checkAndRunHandler                ; Immediately jump to check and
                                            ; run the setup handler for the
                                            ; sound effect.


    ;
    ; Load the secondary, on-tick stage for the sound effect
    ; handler.
    ;
    ; Every sound effect handler has a setup stage and an
    ; on-tick stage. Pairs of each are in the sound effect
    ; handlers table.
    ;
  @_runOnTickHandler:                       ; [$866f]
    LDX a:SoundEffect_HandlerIndex          ; Load the index of the sound
                                            ; effect handler.
    INX                                     ; Advance to the next address for
                                            ; the on-tick handler.
    INX


    ;
    ; Check if the sound effect index is within bounds of the
    ; handlers table.
    ;
    ; Note that the last sound effect handler index is 0x70, but
    ; 0x72 would be the last on-tick handler. This is checking
    ; that this is < 0x74, with the idea being that 0x73 would
    ; never be set (unless there was a major programming flaw).
    ;
  @_checkAndRunHandler:                     ; [$8674]
    CPX #$74                                ; Is this a valid sound effect
                                            ; within the handlers lookup
                                            ; table?
    BCS Sound_ResetCurrentSound             ; If not, reset the current sound
                                            ; effect.
    LDA SOUND_EFFECT_HANDLERS+1,X           ; Load the upper byte of the
                                            ; handler address.
    PHA                                     ; Push it to the stack.
    LDA SOUND_EFFECT_HANDLERS,X             ; Load the lower byte.
    PHA                                     ; Push it to the stack.

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_NoOp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_NoOp:                           ; [$8680]
    RTS


;============================================================================
; Initialize support for sound effects.
;
; This will clear out state, perform an audio reset, and
; then enable the SQ1, SQ2, TRI, and Noise channels.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     DMC_RAW:
;         Set to 0.
;
;     SND_CHN:
;         Set to 0xF (SQ1/SQ2/TRI/Noise).
;
;     SoundEffect_Unused_PriorityID:
;     SoundEffect_TicksRemaining:
;     SoundEffect_TicksRemaining+1:
;     $0125:
;     $0126:
;         Set to 0.
;
; CALLS:
;     Audio_Reset
;
; XREFS:
;     SOUND_EFFECT_HANDLERS [$PRG5::85ad]
;     thunk_SoundEffects_Init
;============================================================================
SoundEffects_Init:                          ; [$8681]
    LDA #$00
    STA a:DMC_RAW                           ; Disable raw DMC.


    ;
    ; Clear the ticks remaining for all sound effect channels.
    ;
    STA a:SoundEffect_TicksRemaining        ; Set SQ1 ticks remaining = 0.
    STA a:SoundEffect_TicksRemaining_1_     ; Set SQ2 ticks remaining = 0.
    STA a:SoundEffect_TicksRemaining_2_     ; Set TRI ticks remaining = 0.
    STA a:SoundEffect_TicksRemaining_3_     ; Set Noise ticks remaining = 0.
    STA a:SoundEffect_Unused_PriorityID     ; Set priority ID (unused) to 0.


    ;
    ; Perform an audio reset and then enable the SQ1/SQ2/TRI/Noise
    ; channels.
    ;
    JSR Audio_Reset                         ; Reset the audio.
    LDA #$0f
    STA a:SND_CHN                           ; Enable channels.
    RTS

;============================================================================
; TODO: Document SoundEffect_Message_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Message_Setup:                  ; [$869e]
    LDA #$06
    STA a:SoundEffect_TicksRemaining_3_     ; Set TRI ticks remaining to 6.
    LDA #$00
    STA a:SoundEffect_State_Counter         ; Set state counter to 0.

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Message_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Message_OnTick:                 ; [$86a8]
    LDA #$1f
    STA a:NOISE_VOL                         ; Set Noise volume to 31.


    ;
    ; Load a value from the lookup table for NOISE_LO.
    ;
    ; This switches sounds every 2 ticks, producing a typing
    ; sound.
    ;
    ; BUG:
    ;     And this is fascinating. The loud clack-clack typing
    ;     sound, reminiscent of an old typewriter, appears to
    ;     be a bug.
    ;
    ;     SOUNDEFFECT_MESSAGE_NOISE_LO defines the
    ;     typing sounds, and produces a much softer sound, one
    ;     that feels more appropriate considering other NES
    ;     games.
    ;
    ;     That's not what's used, though. The AND #$02 instruction
    ;     produces an offset of 0 or 2, with 2 causing an
    ;     out-of-bounds read, pulling #$A9 out of the following
    ;     function (an LDA instruction). This is much sharper than
    ;     #$01, producing that sound.
    ;
    ;     My guess is they originally had an AND #$01, and wanted
    ;     to reduce the sound change from every tick to every
    ;     other tick, but didn't update the table with a padding
    ;     byte, so it overflowed.
    ;
    ;     Maybe they were aiming for this as a hack at this
    ;     point, or maybe they messed up but nobody really noticed
    ;     because the sound ended up sounding so good and thus
    ;     passed QA. In any case, the shipped behavior does not
    ;     match the original intent of this code.
    ;
    LDA a:SoundEffect_State_Counter         ; Load the sound effect counter.
    AND #$02                                ; Keep bit 1 (on 2 ticks, off 2
                                            ; ticks).
    TAX                                     ; X = result.
    LDA SOUNDEFFECT_MESSAGE_NOISE_LO,X      ; Load the NOISE_LO value for
                                            ; this state.
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_State_Counter
    LDA a:SoundEffect_State_Counter
    CMP #$04
    BCC @_return
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$86d0]
    RTS

;
; XREFS:
;     SoundEffect_Message_OnTick
;
SOUNDEFFECT_MESSAGE_NOISE_LO:               ; [$86d1]
    .byte $10                               ; [0]:
    .byte $01                               ; [1]:

;============================================================================
; TODO: Document SoundEffect_HitEnemy_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_HitEnemy_Setup:                 ; [$86d3]
    LDA #$14
    STA a:SoundEffect_TicksRemaining_1_
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$00
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_HitEnemy_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_HitEnemy_OnTick:                ; [$86e0]
    LDX a:SoundEffect_State_Counter
    LDA SOUNDEFFECT_HIT_ENEMY_NOTES,X
    CMP #$ff
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$86f5]
    JSR SoundEffect_SetNote
    LDA #$5f
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    LDA a:SoundEffect_State_Counter
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
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_HitEnemy_OnTick
;
SOUNDEFFECT_HIT_ENEMY_NOTES:                ; [$8724]
    .byte $62                               ; [0]:
    .byte $4e                               ; [1]:
    .byte $3c                               ; [2]:
    .byte $50                               ; [3]:
    .byte $48                               ; [4]:
    .byte $65                               ; [5]:
    .byte $51                               ; [6]:
    .byte $48                               ; [7]:
    .byte $56                               ; [8]:
    .byte $52                               ; [9]:
    .byte $5f                               ; [10]:
    .byte $58                               ; [11]:
    .byte $65                               ; [12]:
    .byte $4d                               ; [13]:
    .byte $55                               ; [14]:
    .byte $ff                               ; [15]:

;============================================================================
; TODO: Document SoundEffect_EnemyDied_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_EnemyDied_Setup:                ; [$8734]
    LDA #$16
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$14
    STA a:SoundEffect_State_Counter
    LDA #$00
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_EnemyDied_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_EnemyDied_OnTick:               ; [$8743]
    DEC a:SoundEffect_State_Counter
    BNE @_play
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8750]
    LDX a:SoundEffect_State_0128
    LDA #$1f
    STA a:NOISE_VOL
    LDA SOUNDEFFECT_ENEMY_DIED_NOISE_LO,X
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_State_0128
    RTS

;
; XREFS:
;     SoundEffect_EnemyDied_OnTick
;
SOUNDEFFECT_ENEMY_DIED_NOISE_LO:            ; [$8767]
    .byte $0f                               ; [0]:
    .byte $0c                               ; [1]:
    .byte $0e                               ; [2]:
    .byte $0b                               ; [3]:
    .byte $0d                               ; [4]:
    .byte $09                               ; [5]:
    .byte $03                               ; [6]:
    .byte $02                               ; [7]:
    .byte $01                               ; [8]:
    .byte $00                               ; [9]:

;============================================================================
; TODO: Document SoundEffect_HitPlayer_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_HitPlayer_Setup:                ; [$8771]
    LDA #$0f
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_HitPlayer_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_HitPlayer_OnTick:               ; [$877b]
    LDX a:SoundEffect_State_Counter
    LDA SOUNDEFFECT_HITPLAYER_NOTES,X
    CMP #$ff
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$878d]
    JSR SoundEffect_SetNote
    LDA #$df
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_HitPlayer_OnTick
;
SOUNDEFFECT_HITPLAYER_NOTES:                ; [$87aa]
    .byte $29                               ; [0]:
    .byte $24                               ; [1]:
    .byte $28                               ; [2]:
    .byte $22                               ; [3]:
    .byte $1f                               ; [4]:
    .byte $29                               ; [5]:
    .byte $2b                               ; [6]:
    .byte $2c                               ; [7]:
    .byte $2d                               ; [8]:
    .byte $2a                               ; [9]:
    .byte $ff                               ; [10]:

;============================================================================
; TODO: Document SoundEffect_Magic_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Magic_Setup:                    ; [$87b5]
    LDA #$32
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Magic_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Magic_OnTick:                   ; [$87c2]
    LDX a:SoundEffect_State_0128
    LDA SOUNDEFFECT_MAGIC_SQ2_VOL,X
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$87d2]
    ORA #$50
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    AND #$03
    TAX
    LDA SOUNDEFFECT_MAGIC_SQ2_LO,X
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    INC a:SoundEffect_State_Counter
    LDA a:SoundEffect_State_Counter
    CMP #$08
    BNE @_return
    LDA #$00
    STA a:SoundEffect_State_Counter
    INC a:SoundEffect_State_0128

  @_return:                                 ; [$87ff]
    RTS

;
; XREFS:
;     SoundEffect_Magic_OnTick
;
SOUNDEFFECT_MAGIC_SQ2_VOL:                  ; [$8800]
    .byte $0f,$0b,$07,$04,$01,$00           ; [$8800] byte

;
; XREFS:
;     SoundEffect_Magic_OnTick
;
SOUNDEFFECT_MAGIC_SQ2_LO:                   ; [$8806]
    .byte $b0,$a0,$a8,$98                   ; [$8806] byte

;============================================================================
; TODO: Document SoundEffect_OpenDoor_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_OpenDoor_Setup:                 ; [$880a]
    LDA #$3c
    STA a:SoundEffect_TicksRemaining_1_
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$37
    STA a:SoundEffect_State_0129
    LDA #$00
    STA a:SoundEffect_State_Counter
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_OpenDoor_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_OpenDoor_OnTick:                ; [$881f]
    DEC a:SoundEffect_State_0129
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$882f]
    LDA a:SoundEffect_State_Counter
    LSR A
    LSR A
    EOR #$ff
    AND #$0f
    ORA #$50
    STA a:NOISE_VOL
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    AND #$07
    TAY
    LDA #$60
    SEC
    SBC SOUNDEFFECT_OPEN_DOOR_SQ2_NOISE_LO,Y
    STA a:SQ2_LO
    AND #$0f
    STA a:NOISE_LO
    LDA #$00
    STA a:SQ2_HI
    STA a:NOISE_HI
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_OpenDoor_OnTick
;
SOUNDEFFECT_OPEN_DOOR_SQ2_NOISE_LO:         ; [$8865]
    .byte $00,$03,$0a,$15,$25,$15,$0a,$03   ; [$8865] byte

;============================================================================
; TODO: Document SoundEffect_Maybe_Typing_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Maybe_Typing_Setup:             ; [$886d]
    LDA #$28
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Maybe_Typing_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Maybe_Typing_OnTick:            ; [$8877]
    LDA a:SoundEffect_TicksRemaining_1_
    AND #$01
    BNE @_return
    LDX a:SoundEffect_State_Counter
    LDA SOUNDEFFECT_MAYBE_TYPING_NOTES,X
    CMP #$ff
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8890]
    JSR SoundEffect_SetNote
    INC a:SoundEffect_State_Counter
    LDA a:SoundEffect_State_Counter
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
;     SoundEffect_Maybe_Typing_OnTick
;
SOUNDEFFECT_MAYBE_TYPING_NOTES:             ; [$88b4]
    .byte $2b,$2d,$2f,$24,$38,$2a,$37,$39   ; [$88b4] byte
    .byte $3b,$24,$38,$42,$2b,$2d,$2f,$18   ; [$88bc] byte
    .byte $ff                               ; [$88c4] byte

;============================================================================
; TODO: Document SoundEffect_ItemPickedUp_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_ItemPickedUp_Setup:             ; [$88c5]
    LDA #$3c
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_ItemPickedUp_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_ItemPickedUp_OnTick:            ; [$88d2]
    LDX a:SoundEffect_State_Counter
    LDA SOUNDEFFECT_ITEM_PICKED_UP_NOTES,X
    CMP #$ff
    BNE @_playNote
    INC a:SoundEffect_State_0128
    LDA #$00
    STA a:SoundEffect_State_Counter
    RTS

  @_playNote:                               ; [$88e5]
    JSR SoundEffect_SetNote
    LDX a:SoundEffect_State_0128
    LDA SOUNDEFFECT_ITEM_PICKED_UP_SQ2_VOLS,X
    BNE @_playSQ2
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_playSQ2:                                ; [$88f8]
    ORA #$90
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_Note_Low
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_ItemPickedUp_OnTick
;
SOUNDEFFECT_ITEM_PICKED_UP_SQ2_VOLS:        ; [$8912]
    .byte $0f,$0c,$09,$05,$02,$00           ; [$8912] byte

;
; XREFS:
;     SoundEffect_ItemPickedUp_OnTick
;
SOUNDEFFECT_ITEM_PICKED_UP_NOTES:           ; [$8918]
    .byte $3f,$43,$4a,$55,$5b,$60,$ff       ; [$8918] byte

;============================================================================
; TODO: Document SoundEffect_CoinTouchedCommon_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SoundEffect_CoinTouched_Setup
;============================================================================
SoundEffect_CoinTouchedCommon_Setup:        ; [$891f]
    LDA #$1e
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$50
    STA a:SoundEffect_State_Counter
    LDA #$00
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_CoinTouchedCommon_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     SoundEffect_CoinTouched_OnTick
;============================================================================
SoundEffect_CoinTouchedCommon_OnTick:       ; [$892e]
    LDX a:SoundEffect_State_0128
    LDA SOUNDEFFECT_COIN_TOUCHED_SQ2_VOL,X
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$893e]
    ORA #$d0
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    STA a:SQ2_LO
    CLC
    ADC #$04
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    LDA a:SoundEffect_State_Counter
    SEC
    SBC #$10
    STA a:SoundEffect_State_Counter
    BNE @_return
    INC a:SoundEffect_State_0128
    LDA #$50
    STA a:SoundEffect_State_Counter

  @_return:                                 ; [$896c]
    RTS

;
; XREFS:
;     SoundEffect_CoinTouchedCommon_OnTick
;
SOUNDEFFECT_COIN_TOUCHED_SQ2_VOL:           ; [$896d]
    .byte $0f,$0c,$09,$06,$03,$00           ; [$896d] byte

;============================================================================
; TODO: Document SoundEffect_MagicHitObstacle_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_MagicHitObstacle_Setup:         ; [$8973]
    LDA #$1e
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$20
    STA a:SoundEffect_State_Counter
    LDA #$00
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_MagicHitObstacle_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_MagicHitObstacle_OnTick:        ; [$8982]
    DEC a:SoundEffect_State_Counter
    BNE @_play
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$898f]
    LDA a:SoundEffect_State_Counter
    LSR A
    AND #$0f
    ORA #$10
    STA a:NOISE_VOL
    LDA a:SoundEffect_State_Counter
    AND #$0f
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    RTS

;============================================================================
; TODO: Document SoundEffect_CursorMoved_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_CursorMoved_Setup:              ; [$89a8]
    LDA #$16
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$0f
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_CursorMoved_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_CursorMoved_OnTick:             ; [$89b2]
    LDA a:SoundEffect_State_Counter
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$89bf]
    LDA a:SoundEffect_State_Counter
    AND #$0f
    ORA #$50
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    AND #$07
    TAY
    LDA a:SoundEffect_State_Counter
    AND #$02
    STA a:SoundEffect_State_0128
    LDA a:SoundEffect_State_Counter
    AND #$01
    CLC
    ADC a:SoundEffect_State_0128
    TAX
    LDA SOUNDEFFECT_CURSOR_MOVED_SQ2_LO,X
    SEC
    SBC SOUNDEFFECT_CURSORMOVED_SQ2_LO_DELTA,Y
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    DEC a:SoundEffect_State_Counter
    RTS

SOUNDEFFECT_CURSOR_MOVED_SQ2_LO:            ; [$89f9]
    .byte $51,$34,$b8                       ; [$89f9] byte

;
; XREFS:
;     SoundEffect_CursorMoved_OnTick
;
BYTE_PRG5__89fc:                            ; [$89fc]
    .byte $93                               ; [$89fc] byte

SOUNDEFFECT_CURSORMOVED_SQ2_LO_DELTA:       ; [$89fd]
    .byte $00,$01,$03,$06,$0a,$06,$03       ; [$89fd] byte

;
; XREFS:
;     SoundEffect_CursorMoved_OnTick
;
BYTE_PRG5__8a04:                            ; [$8a04]
    .byte $01                               ; [$8a04] byte

;============================================================================
; TODO: Document SoundEffect_ShieldHitByMagic_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_ShieldHitByMagic_Setup:         ; [$8a05]
    LDA #$14
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$10
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_ShieldHitByMagic_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_ShieldHitByMagic_OnTick:        ; [$8a0f]
    DEC a:SoundEffect_State_Counter
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8a1c]
    LDA a:SoundEffect_State_Counter
    ORA #$90
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    AND #$01
    TAX
    LDA SOUNDEFFECT_SHIELD_HIT_BY_MAGIC_SQ2_LO,X
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    RTS

SOUNDEFFECT_SHIELD_HIT_BY_MAGIC_SQ2_LO:     ; [$8a3b]
    .byte $30                               ; [0]:

;
; XREFS:
;     SoundEffect_ShieldHitByMagic_OnTick
;
SOUNDEFFECT_SHIELD_HIT_BY_MAGIC_SQ2_LO_1_:  ; [$8a3c]
    .byte $1a                               ; [1]:

;============================================================================
; TODO: Document SoundEffect_CharacterInput_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_CharacterInput_Setup:           ; [$8a3d]
    LDA #$1e
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_CharacterInput_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_CharacterInput_OnTick:          ; [$8a47]
    INC a:SoundEffect_State_Counter
    LDA a:SoundEffect_State_Counter
    LSR A
    LSR A
    TAX
    LDA SOUNDEFFECT_CHAR_INPUT_NOTES,X
    CMP #$ff
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8a5f]
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
;     SoundEffect_CharacterInput_OnTick
;
SOUNDEFFECT_CHAR_INPUT_NOTES:               ; [$8a79]
    .byte $37                               ; [0]:
    .byte $39                               ; [1]:
    .byte $32                               ; [2]:
    .byte $34                               ; [3]:
    .byte $ff                               ; [4]:

;============================================================================
; TODO: Document SoundEffect_PasswordCharInput_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_PasswordCharInput_Setup:        ; [$8a7e]
    LDA #$0a
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$02
    STA a:SoundEffect_State_Counter
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
; TODO: Document SoundEffect_PushBlock_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_PushBlock_Setup:                ; [$8a9d]
    LDA #$20
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$1e
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_PushBlock_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_PushBlock_OnTick:               ; [$8aa7]
    LDA a:SoundEffect_State_Counter
    BNE @_play
    LDA #$10
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8ab4]
    LDA #$1f
    STA a:NOISE_VOL
    LDA a:SoundEffect_State_Counter
    AND #$01
    TAX
    LDA SOUNDEFFECT_PUSH_BLOCK_NOISE_LO,X
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    DEC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_PushBlock_OnTick
;
SOUNDEFFECT_PUSH_BLOCK_NOISE_LO:            ; [$8ace]
    .byte $0f,$0b                           ; [$8ace] byte

;============================================================================
; TODO: Document SoundEffect_CoinDropped_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_CoinDropped_Setup:              ; [$8ad0]
    LDA #$32
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$08
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_CoinDropped_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_CoinDropped_OnTick:             ; [$8ada]
    LDA #$86
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    CMP #$05
    BNE @_checkUpdateCounter
    LDA #$35
    STA a:SQ2_LO
    LDA #$20
    STA a:SQ2_HI

  @_checkUpdateCounter:                     ; [$8af5]
    DEC a:SoundEffect_State_Counter
    BNE @_return
    LDA #$20
    STA a:SQ2_LO
    LDA #$30
    STA a:SQ2_HI
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$8b07]
    RTS

;============================================================================
; TODO: Document SoundEffect_0x48_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_0x48_Setup:                     ; [$8b08]
    LDA #$23
    STA a:SoundEffect_TicksRemaining_1_
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$16
    STA a:SoundEffect_State_0128
    LDA #$00
    STA a:SoundEffect_State_Counter
    LDA #$1e
    STA a:SoundEffect_State_0129

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_0x48_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_0x48_OnTick:                    ; [$8b1f]
    DEC a:SoundEffect_State_0129
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8b2f]
    LDA a:SoundEffect_TicksRemaining_1_
    AND #$01
    BNE @_return
    LDA #$df
    STA a:SQ2_VOL
    LDA #$16
    STA a:NOISE_VOL
    LDA #$a3
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    STA a:SQ2_LO
    CLC
    ADC #$10
    STA a:SoundEffect_State_Counter
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
; TODO: Document SoundEffect_Pakukame_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Pakukame_Setup:                 ; [$8b65]
    LDA #$46
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Pakukame_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Pakukame_OnTick:                ; [$8b6f]
    LDA a:SoundEffect_TicksRemaining_1_
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8b7c]
    LDA a:SoundEffect_State_Counter
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
    LDA a:SoundEffect_State_Counter
    AND #$07
    TAX
    LDA a:SoundEffect_State_Counter
    CLC
    ADC #$32
    SEC
    SBC SOUNDEFFECT_PAKUKAME_SQ2_LO,X
    STA a:SQ2_LO
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_Pakukame_OnTick
;
SOUNDEFFECT_PAKUKAME_SQ2_LO:                ; [$8bab]
    .byte $00,$08,$14,$20,$2d,$20,$14,$08   ; [$8bab] byte

;============================================================================
; TODO: Document SoundEffect_FillHPOrMP_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_FillHPOrMP_Setup:               ; [$8bb3]
    LDA #$23
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter
    LDA #$19
    STA a:SoundEffect_State_0129
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_FillHPOrMP_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_FillHPOrMP_OnTick:              ; [$8bc5]
    DEC a:SoundEffect_State_0128
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8bd2]
    LDA a:SoundEffect_State_Counter
    AND #$03
    TAY
    LDA SOUNDEFFECT_FILL_HP_OR_MP_SQ2_VOL,Y
    STA a:SQ2_VOL
    LDA #$aa
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    AND #$01
    TAX
    LDA SOUNDEFFECT_FILL_HP_OR_MP_SQ2_LO,X
    ORA a:SoundEffect_State_0129
    SBC a:SoundEffect_State_Counter
    STA a:SoundEffect_State_0129
    STA a:SQ2_LO
    LDA #$00
    STA a:SQ2_HI
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_FillHPOrMP_OnTick
;
SOUNDEFFECT_FILL_HP_OR_MP_SQ2_VOL:          ; [$8c01]
    .byte $1f,$5f,$9f,$df                   ; [$8c01] byte

;
; XREFS:
;     SoundEffect_FillHPOrMP_OnTick
;
SOUNDEFFECT_FILL_HP_OR_MP_SQ2_LO:           ; [$8c05]
    .byte $60,$30                           ; [$8c05] byte

;============================================================================
; TODO: Document SoundEffect_Tilte_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Tilte_Setup:                    ; [$8c07]
    LDA #$1e
    STA a:SoundEffect_TicksRemaining_1_
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$0f
    STA a:SoundEffect_State_0129
    LDA #$01
    STA a:SoundEffect_State_Counter
    LDA #$07
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Tilte_OnTick
;
; INPUTS:
;     A
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Tilte_OnTick:                   ; [$8c1e]
    DEC a:SoundEffect_State_Counter
    BNE @_return
    DEC a:SoundEffect_State_0128
    LDA a:SoundEffect_State_0128
    STA a:SoundEffect_State_Counter
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8c39]
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
; TODO: Document SoundEffect_Maybe_Step_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Maybe_Step_Setup:               ; [$8c69]
    LDA #$05
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$03
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Maybe_Step_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Maybe_Step_OnTick:              ; [$8c73]
    LDA #$01
    STA a:NOISE_VOL
    LDA a:SoundEffect_State_Counter
    CMP #$03
    BNE @_updateCheckCounter
    LDA #$0a
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI

  @_updateCheckCounter:                     ; [$8c89]
    DEC a:SoundEffect_State_Counter
    BNE @_return
    LDA #$02
    STA a:NOISE_LO
    LDA #$10
    STA a:NOISE_HI
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$8c9b]
    RTS

;============================================================================
; TODO: Document SoundEffect_PlayerDied_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_PlayerDied_Setup:               ; [$8c9c]
    LDA #$41
    STA a:SoundEffect_TicksRemaining
    STA a:SoundEffect_TicksRemaining_1_
    STA a:SoundEffect_TicksRemaining_2_
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$00
    STA a:SoundEffect_State_Counter
    LDA #$3c
    STA a:SoundEffect_State_0128

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_PlayerDied_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_PlayerDied_OnTick:              ; [$8cb4]
    LDA #$00
    STA a:TRI_LINEAR
    STA a:TRI_LO
    STA a:TRI_LO
    DEC a:SoundEffect_State_0128
    BNE @_play
    LDA #$10
    STA a:SQ1_VOL
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8cd2]
    LDA a:SoundEffect_State_Counter
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
    LDA a:SoundEffect_State_Counter
    AND #$03
    TAX
    LDA SOUNDEFFECT_PLAYER_DIED_NOTES,X
    JSR SoundEffect_SetNote
    LDA a:SoundEffect_Note_Low
    CLC
    ADC a:SoundEffect_State_Counter
    STA a:SQ2_LO
    CLC
    ADC #$10
    STA a:SQ1_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    STA a:SQ1_HI
    LDA a:SoundEffect_State_Counter
    AND #$03
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_State_Counter
    RTS

;
; XREFS:
;     SoundEffect_PlayerDied_OnTick
;
SOUNDEFFECT_PLAYER_DIED_NOTES:              ; [$8d28]
    .byte $4f,$32,$4c,$3c                   ; [$8d28] byte

;============================================================================
; TODO: Document SoundEffect_LadderDropped_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_LadderDropped_Setup:            ; [$8d2c]
    LDA #$0a
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$03
    STA a:SoundEffect_State_Counter

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_LadderDropped_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_LadderDropped_OnTick:           ; [$8d36]
    LDA #$07
    STA a:NOISE_VOL
    LDA a:SoundEffect_State_Counter
    CMP #$03
    BNE @_updateCheckCounter
    LDA #$0f
    STA a:NOISE_LO
    LDA #$18
    STA a:NOISE_HI

  @_updateCheckCounter:                     ; [$8d4c]
    DEC a:SoundEffect_State_Counter
    BNE @_return
    LDA #$05
    STA a:NOISE_LO
    LDA #$18
    STA a:NOISE_HI
    JMP Sound_ResetCurrentSound

  @_return:                                 ; [$8d5e]
    RTS

;============================================================================
; TODO: Document SoundEffect_ShowPlayerMenu_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_ShowPlayerMenu_Setup:           ; [$8d5f]
    LDA #$23
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$00
    STA a:SoundEffect_State_Counter
    STA a:SoundEffect_State_0128
    LDA #$20
    STA a:SoundEffect_State_0129

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_ShowPlayerMenu_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_ShowPlayerMenu_OnTick:          ; [$8d71]
    DEC a:SoundEffect_State_0129
    LDA a:SoundEffect_State_0129
    LSR A
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8d82]
    ORA #$d0
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_0128
    AND #$03
    TAX
    LDA SOUNDEFFECT_SHOW_PLAYER_MENU_NOTES,X
    JSR SoundEffect_SetNote
    LDA a:SoundEffect_Note_Low
    SEC
    SBC a:SoundEffect_State_Counter
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    INC a:SoundEffect_State_Counter
    INC a:SoundEffect_State_Counter
    INC a:SoundEffect_State_Counter
    INC a:SoundEffect_State_0128
    RTS

;
; XREFS:
;     SoundEffect_ShowPlayerMenu_OnTick
;
SOUNDEFFECT_SHOW_PLAYER_MENU_NOTES:         ; [$8db5]
    .byte $5b,$4f,$43,$37                   ; [$8db5] byte

;============================================================================
; TODO: Document SoundEffect_GoldAmountChanged_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_GoldAmountChanged_Setup:        ; [$8db9]
    LDA #$0a
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$02
    STA a:SoundEffect_State_Counter
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
; TODO: Document SoundEffect_Maybe_UseSpecialItem2_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_Maybe_UseSpecialItem2_Setup:    ; [$8dd8]
    LDA #$44
    STA a:SoundEffect_TicksRemaining_1_
    STA a:SoundEffect_TicksRemaining_3_
    LDA #$00
    STA a:SoundEffect_State_Counter
    STA a:SoundEffect_State_0128
    STA a:SoundEffect_State_0129

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_Maybe_UseSpecialItem2_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_Maybe_UseSpecialItem2_OnTick:   ; [$8deb]
    LDA a:SoundEffect_State_0129
    LSR A
    TAX
    LDA SOUNDEFFECT_SPECIALITEM2_NOISE_VOL,X
    BNE @_hasNoise
    LDA #$10
    STA a:SQ2_VOL
    STA a:NOISE_VOL
    JMP Sound_ResetCurrentSound

  @_hasNoise:                               ; [$8e00]
    ORA #$90
    STA a:NOISE_VOL
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    ASL A
    STA a:SoundEffect_State_0128
    LDX a:SoundEffect_State_Counter
    LDA SOUNDEFFECT_SPECIALITEM2_NOTES,X
    CMP #$ff
    BEQ @_hasNotes
    JSR SoundEffect_SetNote
    LDA a:SoundEffect_Note_Low
    CLC
    ADC a:SoundEffect_State_0128
    STA a:SQ2_LO
    LDA a:SoundEffect_Note_High
    STA a:SQ2_HI
    LDA a:SoundEffect_State_Counter
    AND #$01
    TAX
    LDA SOUNDEFFECT_SPECIALITEM2_NOISE_LO,X
    CLC
    ADC a:SoundEffect_State_Counter
    AND #$0f
    STA a:NOISE_LO
    LDA #$00
    STA a:NOISE_HI
    INC a:SoundEffect_State_Counter
    LDA a:SoundEffect_State_Counter
    AND #$07
    BNE @_return
    INC a:SoundEffect_State_0129

  @_return:                                 ; [$8e55]
    RTS

  @_hasNotes:                               ; [$8e56]
    LDA #$00
    STA a:SoundEffect_State_Counter
    INC a:SoundEffect_State_0129
    RTS

;
; XREFS:
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;
SOUNDEFFECT_SPECIALITEM2_NOISE_VOL:         ; [$8e5f]
    .byte $0f,$0d,$09,$05,$00               ; [$8e5f] byte

;
; XREFS:
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;
SOUNDEFFECT_SPECIALITEM2_NOISE_LO:          ; [$8e64]
    .byte $0c,$07                           ; [$8e64] byte

;
; XREFS:
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;
SOUNDEFFECT_SPECIALITEM2_NOTES:             ; [$8e66]
    .byte $24,$27,$2b,$30,$48,$4b,$4f,$54   ; [$8e66] byte
    .byte $33,$44,$52,$57,$57,$5c,$62,$ff   ; [$8e6e] byte

;============================================================================
; TODO: Document SoundEffect_BreadTouched_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_BreadTouched_Setup:             ; [$8e76]
    LDA #$18
    STA a:SoundEffect_TicksRemaining_1_
    LDA #$ff
    STA a:SoundEffect_State_Counter
    LDA #$00
    STA a:SoundEffect_State_0128
    STA a:SoundEffect_State_0129

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document SoundEffect_BreadTouched_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_BreadTouched_OnTick:            ; [$8e88]
    LDA a:SoundEffect_State_0128
    LSR A
    LSR A
    TAX
    LDA SOUNDEFFECT_BREADTOUCHED_SQ2_HI,X
    STA a:SoundEffect_State_0129
    BNE @_play
    LDA #$10
    STA a:SQ2_VOL
    JMP Sound_ResetCurrentSound

  @_play:                                   ; [$8e9e]
    LDA #$df
    STA a:SQ2_VOL
    LDA #$00
    STA a:SQ2_SWEEP
    LDA a:SoundEffect_State_Counter
    SEC
    SBC a:SoundEffect_State_0129
    STA a:SoundEffect_State_Counter
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
;     SoundEffect_BreadTouched_OnTick
;
SOUNDEFFECT_BREADTOUCHED_SQ2_HI:            ; [$8ec5]
    .byte $1f,$36,$63,$76,$c8,$00           ; [$8ec5] byte

;============================================================================
; TODO: Document SoundEffect_CoinTouched_Setup
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
SoundEffect_CoinTouched_Setup:              ; [$8ecb]
    JMP SoundEffect_CoinTouchedCommon_Setup

;============================================================================
; TODO: Document SoundEffect_CoinTouched_OnTick
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;============================================================================
SoundEffect_CoinTouched_OnTick:             ; [$8ece]
    JMP SoundEffect_CoinTouchedCommon_OnTick

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
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_ShowPlayerMenu_OnTick
;============================================================================
SoundEffect_SetNote:                        ; [$8ed1]
    SEC
    SBC #$18


    ;
    ; Loop, subtracting 12 (number of semitones in our lookup
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
;     Music_Load
;============================================================================

;
; XREFS:
;     Music_Load
;
MSCRIPTS_LOOKUP:                            ; [$8efa]
    .byte $ff                               ; [$8efa] byte

;
; XREFS:
;     MScript_Op_RestartChannel
;
MSCRIPTS_TITLESCREEN:                       ; [$8efb]
    pointer MSCRIPT_TITLESCREEN_SQ1         ; [0]:
    pointer MSCRIPT_TITLESCREEN_SQ2         ; [1]:
    pointer MSCRIPT_TITLESCREEN_TRI         ; [2]:
    pointer BYTE_PRG5__928e                 ; [3]:

MSCRIPTS_DAYBREAK:                          ; [$8f03]
    pointer MSCRIPT_DAYBREAK_SQ1            ; [0]:
    pointer MSCRIPT_DAYBREAK_SQ2            ; [1]:
    pointer MSCRIPT_DAYBREAK_TRI            ; [2]:
    pointer MSCRIPT_DAYBREAK_NOISE          ; [3]:

MSCRIPTS_APOLUNE:                           ; [$8f0b]
    pointer MSCRIPT_APOLUNE_SQ1             ; [0]:
    pointer MSCRIPT_APOLUNE_SQ2             ; [1]:
    pointer MSCRIPT_APOLUNE_TRI             ; [2]:
    pointer MSCRIPT_APOLUNE_NOISE           ; [3]:

MSCRIPTS_CONFLATE:                          ; [$8f13]
    pointer MSCRIPT_CONFLATE_SQ1            ; [0]:
    pointer MSCRIPT_CONFLATE_SQ2            ; [1]:
    pointer MSCRIPT_CONFLATE_TRI            ; [2]:
    pointer MSCRIPT_CONFLATE_NOISE          ; [3]:

MSCRIPTS_FOREPAW:                           ; [$8f1b]
    pointer MSCRIPT_FOREPAW_SQ1             ; [0]:
    pointer MSCRIPT_FOREPAW_SQ2             ; [1]:
    pointer MSCRIPT_FOREPAW_TRI             ; [2]:
    pointer MSCRIPT_FOREPAW_NOISE           ; [3]:

MSCRIPTS_TOWER:                             ; [$8f23]
    pointer MSCRIPT_TOWER_SQ1               ; [0]:
    pointer MSCRIPT_TOWER_SQ2               ; [1]:
    pointer MSCRIPT_TOWER_TRI               ; [2]:
    pointer MSCRIPT_TOWER_NOISE             ; [3]:

MSCRIPTS_EOLIS:                             ; [$8f2b]
    pointer MSCRIPT_EOLIS_SQ1               ; [0]:
    pointer MSCRIPT_EOLIS_SQ2               ; [1]:
    pointer MSCRIPT_EOLIS_TRI               ; [2]:
    pointer MSCRIPT_EOLIS_NOISE             ; [3]:

MSCRIPTS_MANTRA:                            ; [$8f33]
    pointer MSCRIPT_MANTRA_SQ1              ; [0]:
    pointer MSCRIPT_MANTRA_SQ2              ; [1]:
    pointer MSCRIPT_MANTRA_TRI              ; [2]:
    pointer MSCRIPT_MANTRA_NOISE            ; [3]:

MSCRIPTS_MASCON_VICTIM:                     ; [$8f3b]
    pointer MSCRIPT_MASCON_VICTIM_SQ1       ; [0]:
    pointer MSCRIPT_MASCON_VICTIM_SQ2       ; [1]:
    pointer MSCRIPT_MASCON_VICTIM_TRI       ; [2]:
    pointer MSCRIPT_MASCON_VICTIM_NOISE     ; [3]:

MSCRIPTS_BOSS:                              ; [$8f43]
    pointer MSCRIPT_BOSS_SQ1                ; [0]:
    pointer MSCRIPT_BOSS_SQ2                ; [1]:
    pointer MSCRIPT_BOSS_TRI                ; [2]:
    pointer MSCRIPT_BOSS_NOISE              ; [3]:

MSCRIPTS_HOURGLASS:                         ; [$8f4b]
    pointer MSCRIPT_HOURGLASS_SQ1           ; [0]:
    pointer MSCRIPT_HOURGLASS_SQ2           ; [1]:
    pointer MSCRIPT_HOURGLASS_TRI           ; [2]:
    pointer MSCRIPT_HOURGLASS_NOISE         ; [3]:

MSCRIPTS_ENDING:                            ; [$8f53]
    pointer MSCRIPT_ENDING_SQ1              ; [0]:
    pointer MSCRIPT_ENDING_SQ2              ; [1]:
    pointer MSCRIPT_ENDING_TRI              ; [2]:
    pointer MSCRIPT_ENDING_NOISE            ; [3]:

MSCRIPTS_KINGS_ROOM:                        ; [$8f5b]
    pointer MSCRIPT_KINGS_ROOM_SQ1          ; [0]:
    pointer MSCRIPT_KINGS_ROOM_SQ2          ; [1]:
    pointer MSCRIPT_KINGS_ROOM_TRI          ; [2]:
    pointer MSCRIPT_KINGS_ROOM_NOISE        ; [3]:

MSCRIPTS_TEMPLE:                            ; [$8f63]
    pointer MSCRIPT_TEMPLE_SQ1              ; [0]:
    pointer MSCRIPT_TEMPLE_SQ2              ; [1]:
    pointer MSCRIPT_TEMPLE_TRI              ; [2]:
    pointer MSCRIPT_TEMPLE_NOISE            ; [3]:

MSCRIPTS_SHOP:                              ; [$8f6b]
    pointer MSCRIPT_SHOP_SQ1                ; [0]:
    pointer MSCRIPT_SHOP_SQ2                ; [1]:
    pointer MSCRIPT_SHOP_TRI                ; [2]:
    pointer MSCRIPT_SHOP_NOISE              ; [3]:

MSCRIPTS_EVIL_FORTRESS:                     ; [$8f73]
    pointer MSCRIPT_EVIL_FORTRESS_SQ1       ; [0]:
    pointer MSCRIPT_EVIL_FORTRESS_SQ2       ; [1]:
    pointer MSCRIPT_EVIL_FORTRESS_TRI       ; [2]:
    pointer MSCRIPT_EVIL_FORTRESS_NOISE     ; [3]:
    .byte $ff                               ; [$8f7b] byte


;============================================================================
; Music for the start screen.
;
; XREFS:
;     MSCRIPTS_TITLESCREEN [$PRG5::8efb]
;============================================================================

;
; XREFS:
;     MSCRIPTS_TITLESCREEN [$PRG5::8efb]
;
MSCRIPT_TITLESCREEN_SQ1:                    ; [$8f7c]
    .byte MSCRIPT_OP_SET_GLOBAL_TRANSPOSE   ; Op: Set global transpose
    .byte $ff                               ;  '- Down 1 semitone
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $00                               ;  '- Reduce volume by 0
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $d0                               ;  '- Duty cycle 3     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte $86                               ; Note length: 6
    .byte $1f                               ; F#2
    .byte $21                               ; G#2
    .byte $23                               ; A#2
    .byte $24                               ; B2
    .byte $26                               ; C#3
    .byte $28                               ; D#3
    .byte $29                               ; E3
    .byte $2a                               ; F3
    .byte $2b                               ; F#3
    .byte $2d                               ; G#3
    .byte $2f                               ; A#3
    .byte $30                               ; B3
    .byte $32                               ; C#4
    .byte $34                               ; D#4
    .byte $35                               ; E4
    .byte $36                               ; F4
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $d0                               ;  '- Duty cycle 3     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $45                               ; G#5
    .byte $c8                               ; Note length: 72
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $3f                               ; D5
    .byte $3c                               ; B4
    .byte $3f                               ; D5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3b                               ; A#4
    .byte $98                               ; Note length: 24
    .byte $37                               ; F#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $a4                               ; Note length: 36
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $41                               ; E5
    .byte $41                               ; E5
    .byte $40                               ; D#5
    .byte $a4                               ; Note length: 36
    .byte $3c                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $37                               ; F#4
    .byte $39                               ; G#4
    .byte $a4                               ; Note length: 36
    .byte $3a                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A4
    .byte $39                               ; G#4
    .byte $3a                               ; A4
    .byte $39                               ; G#4
    .byte $bc                               ; Note length: 60
    .byte $37                               ; F#4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loops
    .byte $86                               ; Note length: 6
    .byte $37                               ; F#4
    .byte $39                               ; G#4
    .byte $3b                               ; A#4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $40                               ; D#5
    .byte $41                               ; E5
    .byte $42                               ; F5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $86                               ; Note length: 6
    .byte $3c                               ; B4
    .byte $3b                               ; A#4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $40                               ; D#5
    .byte $41                               ; E5
    .byte $42                               ; F5
    .byte $43                               ; F#5
    .byte $b0                               ; Note length: 48
    .byte $44                               ; G5
    .byte $46                               ; A5
    .byte $c8                               ; Note length: 72
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $3f                               ; D5
    .byte $3f                               ; D5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $3a                               ; A4
    .byte $98                               ; Note length: 24
    .byte $37                               ; F#4
    .byte $86                               ; Note length: 6
    .byte $38                               ; G4
    .byte $37                               ; F#4
    .byte $8c                               ; Note length: 12
    .byte $35                               ; E4
    .byte $92                               ; Note length: 18
    .byte $37                               ; F#4
    .byte $86                               ; Note length: 6
    .byte $30                               ; B3
    .byte $33                               ; D4
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $3f                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $44                               ; G5
    .byte $46                               ; A5
    .byte $bc                               ; Note length: 60
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $3f                               ; D5
    .byte $3f                               ; D5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $98                               ; Note length: 24
    .byte $3a                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $3f                               ; D5
    .byte $3f                               ; D5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $3a                               ; A4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $cc                               ;  '- 204 ticks
    .byte $3c                               ; B4
    .byte $d4                               ; Note length: 84
    .byte $00                               ; Rest
    .byte $ec                               ; Note length: 108
    .byte $3c                               ; B4
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TITLESCREEN [$PRG5::8efd]
;
MSCRIPT_TITLESCREEN_SQ2:                    ; [$9020]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $03                               ;  '- Reduce volume by 3
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $02                               ;  '- 2
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $21                               ; A2
    .byte $23                               ; B2
    .byte $24                               ; C3
    .byte $26                               ; D3
    .byte $28                               ; E3
    .byte $29                               ; F3
    .byte $2b                               ; G3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $32                               ; D4
    .byte $33                               ; D#4
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $00                               ;  '- 0
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $2b                               ; G3
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $2b                               ; G3
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $2d                               ; A3
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $2d                               ; A3
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $2b                               ; G3
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $22                               ; A#2
    .byte $26                               ; D3
    .byte $2b                               ; G3
    .byte $2f                               ; B3
    .byte $32                               ; D4
    .byte $2f                               ; B3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $27                               ; D#3
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $33                               ; D#4
    .byte $37                               ; G4
    .byte $33                               ; D#4
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $29                               ; F3
    .byte $2d                               ; A3
    .byte $30                               ; C4
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $2b                               ; G3
    .byte $26                               ; D3
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loops
    .byte $86                               ; Note length: 6
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $3f                               ; D#5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $86                               ; Note length: 6
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $3f                               ; D#5
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte $41                               ; F5
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $24                               ; C3
    .byte $28                               ; E3
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $28                               ; E3
    .byte $24                               ; C3
    .byte $28                               ; E3
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $35                               ; F4
    .byte $32                               ; D4
    .byte $2e                               ; A#3
    .byte $29                               ; F3
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $32                               ; D4
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loops
    .byte $8c                               ; Note length: 12
    .byte $33                               ; D#4
    .byte $86                               ; Note length: 6
    .byte $35                               ; F4
    .byte $33                               ; D#4
    .byte $8c                               ; Note length: 12
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $86                               ; Note length: 6
    .byte $24                               ; C3
    .byte $27                               ; D#3
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $27                               ; D#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $86                               ; Note length: 6
    .byte $33                               ; D#4
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $33                               ; D#4
    .byte $38                               ; G#4
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A#4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $92                               ; Note length: 18
    .byte $34                               ; E4
    .byte $86                               ; Note length: 6
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $28                               ; E3
    .byte $2b                               ; G3
    .byte $24                               ; C3
    .byte $28                               ; E3
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $28                               ; E3
    .byte $2b                               ; G3
    .byte $24                               ; C3
    .byte $28                               ; E3
    .byte $32                               ; D4
    .byte $2e                               ; A#3
    .byte $29                               ; F3
    .byte $2e                               ; A#3
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $22                               ; A#2
    .byte $26                               ; D3
    .byte $32                               ; D4
    .byte $2e                               ; A#3
    .byte $29                               ; F3
    .byte $2e                               ; A#3
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $22                               ; A#2
    .byte $26                               ; D3
    .byte $30                               ; C4
    .byte $2c                               ; G#3
    .byte $27                               ; D#3
    .byte $2c                               ; G#3
    .byte $24                               ; C3
    .byte $27                               ; D#3
    .byte $20                               ; G#2
    .byte $24                               ; C3
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $27                               ; D#3
    .byte $2c                               ; G#3
    .byte $ec                               ; Note length: 108
    .byte $27                               ; D#3
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TITLESCREEN [$PRG5::8eff]
;
MSCRIPT_TITLESCREEN_TRI:                    ; [$9161]
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $23                               ; B4
    .byte $24                               ; C5
    .byte $26                               ; D5
    .byte $28                               ; E5
    .byte $29                               ; F5
    .byte $2b                               ; G5
    .byte $2d                               ; A5
    .byte $2f                               ; B5
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $20                               ; G#4
    .byte $20                               ; G#4
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $1b                               ; D#4
    .byte $1b                               ; D#4
    .byte $1b                               ; D#4
    .byte $1b                               ; D#4
    .byte $1b                               ; D#4
    .byte $00                               ; Rest
    .byte $1b                               ; D#4
    .byte $1b                               ; D#4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $16                               ; A#3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $16                               ; A#3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $16                               ; A#3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $98                               ; Note length: 24
    .byte $18                               ; C4
    .byte $8c                               ; Note length: 12
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $ec                               ; Note length: 108
    .byte $20                               ; G#4
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TITLESCREEN [$PRG5::8f01]
;
BYTE_PRG5__928e:                            ; [$928e]
    .byte $8c,$21,$00,$21,$00,$86,$31,$21   ; [$928e] byte
    .byte $31,$31,$31,$21,$31,$31           ; [$9296] byte

    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$929e] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$92a6] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$92ae] byte
    .byte $21,$86,$31,$31,$31,$00,$31,$31   ; [$92b6] byte
    .byte $8c,$21,$86,$31,$31,$31,$00,$31   ; [$92be] byte
    .byte $31,$8c,$21,$86,$31,$31,$31,$00   ; [$92c6] byte
    .byte $31,$31,$8c,$21,$21,$21,$21,$21   ; [$92ce] byte
    .byte $21,$86,$31,$00,$8c,$21,$21,$86   ; [$92d6] byte
    .byte $21,$21                           ; [$92de] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$92e3] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$92eb] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$92f3] byte
    .byte $21,$86,$31,$31,$31,$00,$31,$31   ; [$92fb] byte
    .byte $8c,$21,$86,$31,$31,$31,$00,$31   ; [$9303] byte
    .byte $31,$8c,$21,$86,$31,$31,$31,$00   ; [$930b] byte
    .byte $31,$31,$8c,$21,$86,$31,$31,$31   ; [$9313] byte
    .byte $00,$31,$31,$8c,$21,$86,$31,$31   ; [$931b] byte
    .byte $31,$00,$31,$31,$21,$21,$21,$00   ; [$9323] byte
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$932e] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$9336] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$933e] byte
    .byte $21,$86,$31,$31,$31,$00,$31,$31   ; [$9346] byte
    .byte $8c,$21,$86,$31,$31               ; [$934e] byte

    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$9355] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$935d] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$9365] byte
    .byte $21,$86,$31,$31,$31,$00,$8c,$21   ; [$936d] byte
    .byte $86,$21,$21,$21,$00               ; [$9375] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c,$21,$21,$21,$21,$86,$31,$31   ; [$937d] byte
    .byte $8c,$21,$21,$86,$21,$21,$8c,$21   ; [$9385] byte
    .byte $21,$21,$21,$00,$21,$21           ; [$938d] byte

    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$31,$00,$31   ; [$9395] byte
    .byte $31,$31,$00,$31,$31,$31,$00,$31   ; [$939d] byte
    .byte $31                               ; [$93a5] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $31,$00,$31,$31,$31,$00,$31,$31   ; [$93a7] byte
    .byte $31,$00,$31,$31,$31,$31,$ec,$31   ; [$93af] byte
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for Daybreak.
;
; XREFS:
;     MSCRIPTS_DAYBREAK [$PRG5::8f03]
;============================================================================

;
; XREFS:
;     MSCRIPTS_DAYBREAK [$PRG5::8f03]
;
MSCRIPT_DAYBREAK_SQ1:                       ; [$93b9]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $01                               ;  '- Reduce volume by 1
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_SET_SQ_PITCH_EFFECT_DEPTH ; Op: Set SQ2 envelope depth
    .byte $02                               ;  '- 2
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $c8                               ; Note length: 72
    .byte $36                               ; F#4
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $c8                               ; Note length: 72
    .byte $35                               ; F4
    .byte $98                               ; Note length: 24
    .byte $2f                               ; B3
    .byte $e0                               ; Note length: 96
    .byte $34                               ; E4
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $c8                               ; Note length: 72
    .byte $36                               ; F#4
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $c8                               ; Note length: 72
    .byte $35                               ; F4
    .byte $98                               ; Note length: 24
    .byte $2f                               ; B3
    .byte $e0                               ; Note length: 96
    .byte $2f                               ; B3
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $3c                               ; C5
    .byte $c8                               ; Note length: 72
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $38                               ; G#4
    .byte $c8                               ; Note length: 72
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $30                               ; C4
    .byte $98                               ; Note length: 24
    .byte $30                               ; C4
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $3b                               ; B4
    .byte $e0                               ; Note length: 96
    .byte $3b                               ; B4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $e0                               ; Note length: 96
    .byte $34                               ; E4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $a4                               ; Note length: 36
    .byte $34                               ; E4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $98                               ; Note length: 24
    .byte $3f                               ; D#5
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $38                               ; G#4
    .byte $a4                               ; Note length: 36
    .byte $39                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $98                               ; Note length: 24
    .byte $40                               ; E5
    .byte $41                               ; F5
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $a4                               ; Note length: 36
    .byte $3a                               ; A#4
    .byte $8c                               ; Note length: 12
    .byte $41                               ; F5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $38                               ; G#4
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $2c                               ; G#3
    .byte $8c                               ; Note length: 12
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $38                               ; G#4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $38                               ; G#4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_DAYBREAK [$PRG5::8f05]
;
MSCRIPT_DAYBREAK_SQ2:                       ; [$9458]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $05                               ;  '- Reduce volume by 5
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $13                               ;  '- Duty cycle 0     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $c8                               ; Note length: 72
    .byte $36                               ; F#4
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $c8                               ; Note length: 72
    .byte $35                               ; F4
    .byte $98                               ; Note length: 24
    .byte $2f                               ; B3
    .byte $e0                               ; Note length: 96
    .byte $34                               ; E4
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $c8                               ; Note length: 72
    .byte $36                               ; F#4
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $c8                               ; Note length: 72
    .byte $35                               ; F4
    .byte $98                               ; Note length: 24
    .byte $2f                               ; B3
    .byte $e0                               ; Note length: 96
    .byte $2f                               ; B3
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $3c                               ; C5
    .byte $c8                               ; Note length: 72
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $38                               ; G#4
    .byte $c8                               ; Note length: 72
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $30                               ; C4
    .byte $98                               ; Note length: 24
    .byte $30                               ; C4
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $3b                               ; B4
    .byte $e0                               ; Note length: 96
    .byte $3b                               ; B4
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $03                               ;  '- Reduce volume by 3
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $32                               ; D4
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte $2c                               ; G#3
    .byte $29                               ; F3
    .byte $28                               ; E3
    .byte $26                               ; D3
    .byte $24                               ; C3
    .byte $28                               ; E3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $28                               ; E3
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $28                               ; E3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $32                               ; D4
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte $2c                               ; G#3
    .byte $28                               ; E3
    .byte $00                               ; Rest
    .byte $31                               ; C#4
    .byte $2d                               ; A3
    .byte $31                               ; C#4
    .byte $2d                               ; A3
    .byte $2a                               ; F#3
    .byte $27                               ; D#3
    .byte $b0                               ; Note length: 48
    .byte $24                               ; C3
    .byte $98                               ; Note length: 24
    .byte $28                               ; E3
    .byte $2d                               ; A3
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $a4                               ; Note length: 36
    .byte $30                               ; C4
    .byte $8c                               ; Note length: 12
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $39                               ; A4
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $32                               ; D4
    .byte $32                               ; D4
    .byte $a4                               ; Note length: 36
    .byte $30                               ; C4
    .byte $8c                               ; Note length: 12
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $3e                               ; D5
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $3b                               ; B4
    .byte $3b                               ; B4
    .byte $a4                               ; Note length: 36
    .byte $35                               ; F4
    .byte $8c                               ; Note length: 12
    .byte $3e                               ; D5
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $38                               ; G#4
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $30                               ; C4
    .byte $98                               ; Note length: 24
    .byte $28                               ; E3
    .byte $27                               ; D#3
    .byte $8c                               ; Note length: 12
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $03                               ;  '- Reduce volume by 3
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte $30                               ; C4
    .byte $31                               ; C#4
    .byte $32                               ; D4
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $33                               ; D#4
    .byte $32                               ; D4
    .byte $31                               ; C#4
    .byte $30                               ; C4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $30                               ; C4
    .byte $31                               ; C#4
    .byte $32                               ; D4
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $33                               ; D#4
    .byte $32                               ; D4
    .byte $31                               ; C#4
    .byte $30                               ; C4
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_DAYBREAK [$PRG5::8f07]
;
MSCRIPT_DAYBREAK_TRI:                       ; [$9540]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $18                               ; C4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $17                               ; B3
    .byte $21                               ; A4
    .byte $1a                               ; D4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1a                               ; D4
    .byte $21                               ; A4
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $18                               ; C4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $17                               ; B3
    .byte $21                               ; A4
    .byte $1a                               ; D4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1a                               ; D4
    .byte $21                               ; A4
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $1a                               ; D4
    .byte $26                               ; D5
    .byte $21                               ; A4
    .byte $26                               ; D5
    .byte $00                               ; Rest
    .byte $26                               ; D5
    .byte $21                               ; A4
    .byte $26                               ; D5
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $18                               ; C4
    .byte $21                               ; A4
    .byte $1b                               ; D#4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1b                               ; D#4
    .byte $21                               ; A4
    .byte $13                               ; G3
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $21                               ; A4
    .byte $1b                               ; D#4
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1e                               ; F#4
    .byte $21                               ; A4
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $1d                               ; F4
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $1a                               ; D4
    .byte $17                               ; B3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $15                               ; A3
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $98                               ; Note length: 24
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $98                               ; Note length: 24
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $15                               ; A3
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $98                               ; Note length: 24
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $98                               ; Note length: 24
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $15                               ; A3
    .byte $98                               ; Note length: 24
    .byte $15                               ; A3
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $98                               ; Note length: 24
    .byte $18                               ; C4
    .byte $17                               ; B3
    .byte $8c                               ; Note length: 12
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $17                               ; B3
    .byte $18                               ; C4
    .byte $19                               ; C#4
    .byte $86                               ; Note length: 6
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $20                               ; G#4
    .byte $2c                               ; G#5
    .byte $20                               ; G#4
    .byte $2c                               ; G#5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $8c                               ; Note length: 12
    .byte $19                               ; C#4
    .byte $18                               ; C4
    .byte $17                               ; B3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $86                               ; Note length: 6
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $17                               ; B3
    .byte $18                               ; C4
    .byte $19                               ; C#4
    .byte $86                               ; Note length: 6
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $20                               ; G#4
    .byte $2c                               ; G#5
    .byte $20                               ; G#4
    .byte $2c                               ; G#5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $19                               ; C#4
    .byte $25                               ; C#5
    .byte $8c                               ; Note length: 12
    .byte $19                               ; C#4
    .byte $18                               ; C4
    .byte $17                               ; B3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_DAYBREAK [$PRG5::8f09]
;
MSCRIPT_DAYBREAK_NOISE:                     ; [$9660]
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for Apolune.
;
; XREFS:
;     MSCRIPTS_APOLUNE [$PRG5::8f0b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_APOLUNE [$PRG5::8f0b]
;
MSCRIPT_APOLUNE_SQ1:                        ; [$9662]
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $96C3
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $96C3
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $00                               ;  '- Reduce volume by 0
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte $8c                               ; Note length: 12
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $86                               ; Note length: 6
    .byte $39                               ; A4
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $35                               ; F4
    .byte $8c                               ; Note length: 12
    .byte $37                               ; G4
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $40                               ; E5
    .byte $8c                               ; Note length: 12
    .byte $3d                               ; C#5
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $3d                               ; C#5
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3b                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $86                               ; Note length: 6
    .byte $39                               ; A4
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $35                               ; F4
    .byte $8c                               ; Note length: 12
    .byte $37                               ; G4
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $40                               ; E5
    .byte $8c                               ; Note length: 12
    .byte $3d                               ; C#5
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $3d                               ; C#5
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3b                               ; B4
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

  @_subroutine:                             ; [$96c3]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $d0                               ;  '- Duty cycle 3     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $38                               ; G#4
    .byte $39                               ; A4
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3a                               ; A#4
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A#4
    .byte $bc                               ; Note length: 60
    .byte $3e                               ; D5
    .byte $98                               ; Note length: 24
    .byte $38                               ; G#4
    .byte $41                               ; F5
    .byte $40                               ; E5
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $3e                               ; D5
    .byte $3d                               ; C#5
    .byte $00                               ; Rest
    .byte $bc                               ; Note length: 60
    .byte $40                               ; E5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $38                               ; G#4
    .byte $39                               ; A4
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3a                               ; A#4
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A#4
    .byte $bc                               ; Note length: 60
    .byte $3e                               ; D5
    .byte $98                               ; Note length: 24
    .byte $38                               ; G#4
    .byte $41                               ; F5
    .byte $40                               ; E5
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $3e                               ; D5
    .byte $3d                               ; C#5
    .byte $00                               ; Rest
    .byte $bc                               ; Note length: 60
    .byte $40                               ; E5
    .byte $b0                               ; Note length: 48
    .byte $41                               ; F5
    .byte $98                               ; Note length: 24
    .byte $40                               ; E5
    .byte $3e                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $98                               ; Note length: 24
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $c8                               ; Note length: 72
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $ec                               ; Note length: 108
    .byte $39                               ; A4
    .byte $b0                               ; Note length: 48
    .byte $41                               ; F5
    .byte $98                               ; Note length: 24
    .byte $40                               ; E5
    .byte $3e                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $98                               ; Note length: 24
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $c8                               ; Note length: 72
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $ec                               ; Note length: 108
    .byte $39                               ; A4
    .byte $f5                               ; Op: Return from subroutine

;
; XREFS:
;     MSCRIPTS_APOLUNE [$PRG5::8f0d]
;
MSCRIPT_APOLUNE_SQ2:                        ; [$971c]
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $97A6
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $97A6
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte $86                               ; Note length: 6
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $32                               ; A9
    .byte $34                               ; A9
    .byte $36                               ; A9
    .byte $86                               ; Note length: 6
    .byte $37                               ; A9
    .byte $36                               ; A9
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $39                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $36                               ; A9
    .byte $86                               ; Note length: 6
    .byte $39                               ; A9
    .byte $39                               ; A9
    .byte $39                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $35                               ; A9
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $30                               ; A9
    .byte $86                               ; Note length: 6
    .byte $35                               ; A9
    .byte $34                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $35                               ; A9
    .byte $86                               ; Note length: 6
    .byte $3d                               ; A9
    .byte $31                               ; A9
    .byte $3d                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A9
    .byte $98                               ; Note length: 24
    .byte $31                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $34                               ; A9
    .byte $86                               ; Note length: 6
    .byte $39                               ; A9
    .byte $34                               ; A9
    .byte $31                               ; A9
    .byte $2d                               ; A9
    .byte $3b                               ; A9
    .byte $2f                               ; A9
    .byte $3b                               ; A9
    .byte $00                               ; Rest
    .byte $37                               ; A9
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $2f                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $32                               ; A9
    .byte $86                               ; Note length: 6
    .byte $37                               ; A9
    .byte $32                               ; A9
    .byte $2f                               ; A9
    .byte $2b                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $32                               ; A9
    .byte $34                               ; A9
    .byte $36                               ; A9
    .byte $86                               ; Note length: 6
    .byte $37                               ; A9
    .byte $36                               ; A9
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $39                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $36                               ; A9
    .byte $86                               ; Note length: 6
    .byte $39                               ; A9
    .byte $39                               ; A9
    .byte $39                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $35                               ; A9
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $30                               ; A9
    .byte $86                               ; Note length: 6
    .byte $35                               ; A9
    .byte $34                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $35                               ; A9
    .byte $86                               ; Note length: 6
    .byte $3d                               ; A9
    .byte $31                               ; A9
    .byte $3d                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A9
    .byte $98                               ; Note length: 24
    .byte $31                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $34                               ; A9
    .byte $86                               ; Note length: 6
    .byte $39                               ; A9
    .byte $34                               ; A9
    .byte $31                               ; A9
    .byte $2d                               ; A9
    .byte $3b                               ; A9
    .byte $2f                               ; A9
    .byte $3b                               ; A9
    .byte $00                               ; Rest
    .byte $37                               ; A9
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $2f                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $32                               ; A9
    .byte $86                               ; Note length: 6
    .byte $37                               ; A9
    .byte $32                               ; A9
    .byte $2f                               ; A9
    .byte $2b                               ; A9
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

  @_subroutine:                             ; [$97a6]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $04                               ;  '- Reduce volume by 4
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte $8c                               ; Note length: 12
    .byte $30                               ; A9
    .byte $2f                               ; A9
    .byte $30                               ; A9
    .byte $b0                               ; Note length: 48
    .byte $34                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $30                               ; A9
    .byte $98                               ; Note length: 24
    .byte $32                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $32                               ; A9
    .byte $98                               ; Note length: 24
    .byte $3a                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $35                               ; A9
    .byte $32                               ; A9
    .byte $35                               ; A9
    .byte $98                               ; Note length: 24
    .byte $34                               ; A9
    .byte $3e                               ; A9
    .byte $3c                               ; A9
    .byte $3b                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A9
    .byte $39                               ; A9
    .byte $00                               ; Rest
    .byte $34                               ; A9
    .byte $31                               ; A9
    .byte $86                               ; Note length: 6
    .byte $34                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $31                               ; A9
    .byte $86                               ; Note length: 6
    .byte $34                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $30                               ; A9
    .byte $2f                               ; A9
    .byte $30                               ; A9
    .byte $b0                               ; Note length: 48
    .byte $34                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $30                               ; A9
    .byte $98                               ; Note length: 24
    .byte $32                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $32                               ; A9
    .byte $98                               ; Note length: 24
    .byte $3a                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $35                               ; A9
    .byte $32                               ; A9
    .byte $35                               ; A9
    .byte $98                               ; Note length: 24
    .byte $34                               ; A9
    .byte $3e                               ; A9
    .byte $3c                               ; A9
    .byte $3b                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A9
    .byte $39                               ; A9
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $31                               ; A9
    .byte $34                               ; A9
    .byte $39                               ; A9
    .byte $3d                               ; A9
    .byte $40                               ; A9
    .byte $45                               ; A9
    .byte $40                               ; A9
    .byte $3d                               ; A9
    .byte $39                               ; A9
    .byte $34                               ; A9
    .byte $29                               ; A9
    .byte $00                               ; Rest
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $29                               ; A9
    .byte $00                               ; Rest
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $26                               ; A9
    .byte $00                               ; Rest
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $24                               ; A9
    .byte $00                               ; Rest
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $24                               ; A9
    .byte $00                               ; Rest
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $23                               ; A9
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $34                               ; A9
    .byte $21                               ; A9
    .byte $29                               ; A9
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $1f                               ; A9
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2f                               ; A9
    .byte $00                               ; Rest
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2f                               ; A9
    .byte $1f                               ; A9
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2f                               ; A9
    .byte $28                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $25                               ; A9
    .byte $86                               ; Note length: 6
    .byte $21                               ; A9
    .byte $00                               ; Rest
    .byte $26                               ; A9
    .byte $2a                               ; A9
    .byte $36                               ; A9
    .byte $32                               ; A9
    .byte $2d                               ; A9
    .byte $2a                               ; A9
    .byte $21                               ; A9
    .byte $00                               ; Rest
    .byte $26                               ; A9
    .byte $2a                               ; A9
    .byte $36                               ; A9
    .byte $32                               ; A9
    .byte $2d                               ; A9
    .byte $2a                               ; A9
    .byte $29                               ; A9
    .byte $2b                               ; A9
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $29                               ; A9
    .byte $2b                               ; A9
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $00                               ; Rest
    .byte $2b                               ; A9
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $26                               ; A9
    .byte $2b                               ; A9
    .byte $2e                               ; A9
    .byte $32                               ; A9
    .byte $24                               ; A9
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $34                               ; A9
    .byte $24                               ; A9
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $34                               ; A9
    .byte $00                               ; Rest
    .byte $29                               ; A9
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $21                               ; A9
    .byte $29                               ; A9
    .byte $2d                               ; A9
    .byte $30                               ; A9
    .byte $1f                               ; A9
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2f                               ; A9
    .byte $1f                               ; A9
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2f                               ; A9
    .byte $1f                               ; A9
    .byte $28                               ; A9
    .byte $2b                               ; A9
    .byte $2f                               ; A9
    .byte $28                               ; A9
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $25                               ; A9
    .byte $86                               ; Note length: 6
    .byte $21                               ; A9
    .byte $26                               ; A9
    .byte $2a                               ; A9
    .byte $2d                               ; A9
    .byte $32                               ; A9
    .byte $2d                               ; A9
    .byte $2a                               ; A9
    .byte $2d                               ; A9
    .byte $21                               ; A9
    .byte $26                               ; A9
    .byte $2a                               ; A9
    .byte $2d                               ; A9
    .byte $32                               ; A9
    .byte $2d                               ; A9
    .byte $8c                               ; Note length: 12
    .byte $26                               ; A9
    .byte MSCRIPT_OP_RET                    ; Op: Return from subroutine

;
; XREFS:
;     MSCRIPTS_APOLUNE [$PRG5::8f0f]
;
MSCRIPT_APOLUNE_TRI:                        ; [$987a]
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $86                               ; Note length: 6
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $86                               ; Note length: 6
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $13                               ; G3
    .byte $86                               ; Note length: 6
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $12                               ; F#3
    .byte $12                               ; F#3
    .byte $1e                               ; F#4
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $86                               ; Note length: 6
    .byte $21                               ; A4
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $86                               ; Note length: 6
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $12                               ; F#3
    .byte $12                               ; F#3
    .byte $1e                               ; F#4
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $9927
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $9927
    .byte $0e                               ; F6
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $0e                               ; F6
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $0e                               ; F6
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $00                               ; Rest
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $00                               ; Rest
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $00                               ; Rest
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $15                               ; C7
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $1c                               ; G7
    .byte $1c                               ; G7
    .byte $13                               ; A#6
    .byte $00                               ; Rest
    .byte $1a                               ; F7
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $00                               ; Rest
    .byte $1a                               ; F7
    .byte $1f                               ; A#7
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $1f                               ; A#7
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $1f                               ; A#7
    .byte $0e                               ; F6
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $0e                               ; F6
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $0e                               ; F6
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $00                               ; Rest
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $00                               ; Rest
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $11                               ; G#6
    .byte $00                               ; Rest
    .byte $18                               ; D#7
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $15                               ; C7
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $15                               ; C7
    .byte $00                               ; Rest
    .byte $1c                               ; G7
    .byte $1c                               ; G7
    .byte $13                               ; A#6
    .byte $00                               ; Rest
    .byte $1a                               ; F7
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $00                               ; Rest
    .byte $1a                               ; F7
    .byte $1f                               ; A#7
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $1f                               ; A#7
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $1f                               ; A#7
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

  @_subroutine:                             ; [$9927]
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $14                               ; B6
    .byte $86                               ; Note length: 6
    .byte $20                               ; B7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $14                               ; B6
    .byte $86                               ; Note length: 6
    .byte $20                               ; B7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; G6
    .byte $86                               ; Note length: 6
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; G6
    .byte $86                               ; Note length: 6
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $16                               ; C#7
    .byte $86                               ; Note length: 6
    .byte $22                               ; C#8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $14                               ; B6
    .byte $86                               ; Note length: 6
    .byte $20                               ; B7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $14                               ; B6
    .byte $86                               ; Note length: 6
    .byte $20                               ; B7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; G6
    .byte $86                               ; Note length: 6
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; G6
    .byte $86                               ; Note length: 6
    .byte $1c                               ; G7
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $15                               ; C7
    .byte $86                               ; Note length: 6
    .byte $21                               ; C8
    .byte $00                               ; Rest
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $13                               ; A#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $11                               ; G#6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $10                               ; G6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte $0e                               ; F6
    .byte MSCRIPT_OP_RET                    ; Op: Return from subroutine

;
; XREFS:
;     MSCRIPTS_APOLUNE [$PRG5::8f11]
;
MSCRIPT_APOLUNE_NOISE:                      ; [$9a48]
    .byte $8c,$00,$31,$00,$31,$00,$31,$00   ; [$9a48] byte
    .byte $31,$00,$31,$00,$31,$00,$31,$86   ; [$9a50] byte
    .byte $31,$31,$8c,$31                   ; [$9a58] byte

    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $9A70
    .byte MSCRIPT_OP_JSR                    ; Op: Jump to subroutine
    pointer @_subroutine                    ;  '- $9A70
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $08                               ;  '- 8 iterations
    .byte $8c,$00,$21,$00,$21,$00,$21,$00   ; [$9a64] byte
    .byte $21                               ; [$9a6c] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

  @_subroutine:                             ; [$9a70]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $08                               ;  '- 8 iterations
    .byte $8c,$00,$21,$00,$21,$00,$21,$00   ; [$9a72] byte
    .byte $21                               ; [$9a7a] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $08                               ;  '- 8 iterations
    .byte $86,$31,$00,$31,$31,$31,$00,$31   ; [$9a7e] byte
    .byte $31,$31,$00,$31,$31,$31,$00,$31   ; [$9a86] byte
    .byte $31                               ; [$9a8e] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RET                    ; Op: Return from subroutine
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for Conflate.
;
; XREFS:
;     MSCRIPTS_CONFLATE [$PRG5::8f13]
;============================================================================

;
; XREFS:
;     MSCRIPTS_CONFLATE [$PRG5::8f13]
;
MSCRIPT_CONFLATE_SQ1:                       ; [$9a92]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $a4                               ; Note length: 36
    .byte $33                               ; D#4
    .byte $bc                               ; Note length: 60
    .byte $34                               ; E4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $3b                               ; B4
    .byte $37                               ; G4
    .byte $34                               ; E4
    .byte $98                               ; Note length: 24
    .byte $3d                               ; C#5
    .byte $8c                               ; Note length: 12
    .byte $35                               ; F4
    .byte $bc                               ; Note length: 60
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $98                               ; Note length: 24
    .byte $43                               ; G5
    .byte $8c                               ; Note length: 12
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $a4                               ; Note length: 36
    .byte $42                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $32                               ; D4
    .byte $b0                               ; Note length: 48
    .byte $35                               ; F4
    .byte $a4                               ; Note length: 36
    .byte $33                               ; D#4
    .byte $8c                               ; Note length: 12
    .byte $32                               ; D4
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $36                               ; F#4
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $fc                               ; Op: End loop
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $3b                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $3b                               ; B4
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $00                               ; Rest
    .byte $3b                               ; B4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3f                               ; D#5
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $3f                               ; D#5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $3f                               ; D#5
    .byte $41                               ; F5
    .byte $3f                               ; D#5
    .byte $2d                               ; A3
    .byte $2d                               ; A3
    .byte $33                               ; D#4
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $3f                               ; D#5
    .byte $40                               ; E5
    .byte $98                               ; Note length: 24
    .byte $41                               ; F5
    .byte $8c                               ; Note length: 12
    .byte $3d                               ; C#5
    .byte $3a                               ; A#4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $3d                               ; C#5
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $3d                               ; C#5
    .byte $3a                               ; A#4
    .byte $00                               ; Rest
    .byte $3a                               ; A#4
    .byte $3d                               ; C#5
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte $3f                               ; D#5
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $36                               ; F#4
    .byte $33                               ; D#4
    .byte $36                               ; F#4
    .byte $33                               ; D#4
    .byte $32                               ; D4
    .byte $32                               ; D4
    .byte $32                               ; D4
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_CONFLATE [$PRG5::8f15]
;
MSCRIPT_CONFLATE_SQ2:                       ; [$9b15]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte $a4                               ; Note length: 36
    .byte $2a                               ; F#3
    .byte $8c                               ; Note length: 12
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $22                               ; A#2
    .byte $23                               ; B2
    .byte $2b                               ; G3
    .byte $2f                               ; B3
    .byte $34                               ; E4
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $2f                               ; B3
    .byte $2b                               ; G3
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $2d                               ; A3
    .byte $39                               ; A4
    .byte $00                               ; Rest
    .byte $39                               ; A4
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $01                               ;  '- 1
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $05                               ;  '- Reduce volume by 5
    .byte $86                               ; Note length: 6
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $92                               ; Note length: 18
    .byte $43                               ; G5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $00                               ;  '- 0
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte $a4                               ; Note length: 36
    .byte $3e                               ; D5
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A#4
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $86                               ; Note length: 6
    .byte $27                               ; D#3
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $32                               ; D4
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $25                               ; C#3
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $8c                               ; Note length: 12
    .byte $2f                               ; B3
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $32                               ; D4
    .byte $37                               ; G4
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $fc                               ; Op: End loop
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $00                               ; Rest
    .byte $28                               ; E3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $2b                               ; G3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $39                               ; A4
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $29                               ; F3
    .byte $29                               ; F3
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $98                               ; Note length: 24
    .byte $3d                               ; C#5
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $31                               ; C#4
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $3d                               ; C#5
    .byte $3d                               ; C#5
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $31                               ; C#4
    .byte $35                               ; F4
    .byte $31                               ; C#4
    .byte $86                               ; Note length: 6
    .byte $3a                               ; A#4
    .byte $32                               ; D4
    .byte $3a                               ; A#4
    .byte $33                               ; D#4
    .byte $3a                               ; A#4
    .byte $32                               ; D4
    .byte $36                               ; F#4
    .byte $2e                               ; A#3
    .byte $33                               ; D#4
    .byte $2a                               ; F#3
    .byte $2e                               ; A#3
    .byte $27                               ; D#3
    .byte $2a                               ; F#3
    .byte $22                               ; A#2
    .byte $2e                               ; A#3
    .byte $27                               ; D#3
    .byte $8c                               ; Note length: 12
    .byte $2b                               ; G3
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_CONFLATE [$PRG5::8f17]
;
MSCRIPT_CONFLATE_TRI:                       ; [$9bbd]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $10                               ; E3
    .byte $17                               ; B3
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte $86                               ; Note length: 6
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $10                               ; E3
    .byte $17                               ; B3
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte $86                               ; Note length: 6
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $15                               ; A3
    .byte $11                               ; F3
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $11                               ; F3
    .byte $86                               ; Note length: 6
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $98                               ; Note length: 24
    .byte $1f                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $86                               ; Note length: 6
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $8c                               ; Note length: 12
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $16                               ; A#3
    .byte $13                               ; G3
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $13                               ; G3
    .byte $86                               ; Note length: 6
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $8c                               ; Note length: 12
    .byte $0f                               ; D#3
    .byte $0f                               ; D#3
    .byte $16                               ; A#3
    .byte $86                               ; Note length: 6
    .byte $1b                               ; D#4
    .byte $0f                               ; D#3
    .byte $8c                               ; Note length: 12
    .byte $0d                               ; C#3
    .byte $0d                               ; C#3
    .byte $14                               ; G#3
    .byte $86                               ; Note length: 6
    .byte $19                               ; C#4
    .byte $0d                               ; C#3
    .byte $a4                               ; Note length: 36
    .byte $13                               ; G3
    .byte $86                               ; Note length: 6
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $8c                               ; Note length: 12
    .byte $16                               ; A#3
    .byte $1a                               ; D4
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $1d                               ; F4
    .byte $1b                               ; D#4
    .byte $1a                               ; D4
    .byte $16                               ; A#3
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $1c                               ; E4
    .byte $23                               ; B4
    .byte $1f                               ; G4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $1c                               ; E4
    .byte $23                               ; B4
    .byte $1f                               ; G4
    .byte $21                               ; A4
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $18                               ; C4
    .byte $21                               ; A4
    .byte $1d                               ; F4
    .byte $1f                               ; G4
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $0c                               ; C3
    .byte $11                               ; F3
    .byte $18                               ; C4
    .byte $21                               ; A4
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $18                               ; C4
    .byte $11                               ; F3
    .byte $16                               ; A#3
    .byte $1d                               ; F4
    .byte $22                               ; A#4
    .byte $1d                               ; F4
    .byte $24                               ; C5
    .byte $22                               ; A#4
    .byte $00                               ; Rest
    .byte $11                               ; F3
    .byte $16                               ; A#3
    .byte $1d                               ; F4
    .byte $24                               ; C5
    .byte $22                               ; A#4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $16                               ; A#3
    .byte $11                               ; F3
    .byte $0f                               ; D#3
    .byte $16                               ; A#3
    .byte $1b                               ; D#4
    .byte $16                               ; A#3
    .byte $1d                               ; F4
    .byte $1b                               ; D#4
    .byte $16                               ; A#3
    .byte $0f                               ; D#3
    .byte $0e                               ; D3
    .byte $0e                               ; D3
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_CONFLATE [$PRG5::8f19]
;
MSCRIPT_CONFLATE_NOISE:                     ; [$9c5f]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$00,$00,$31,$00,$00   ; [$9c61] byte
    .byte $00,$86,$31,$00,$31,$00,$8c,$21   ; [$9c69] byte
    .byte $21,$86,$31,$00,$31,$00,$8c,$21   ; [$9c71] byte
    .byte $86,$31,$00,$31,$00,$31,$00,$8c   ; [$9c79] byte
    .byte $21,$21,$86,$31,$00,$31,$00,$8c   ; [$9c81] byte
    .byte $21,$86,$31,$00,$31,$00,$31,$00   ; [$9c89] byte
    .byte $8c,$21,$21,$86,$31,$00,$31,$00   ; [$9c91] byte
    .byte $8c,$21,$21,$86,$31,$00,$31,$00   ; [$9c99] byte
    .byte $31,$00,$31,$00,$31,$00,$8c,$21   ; [$9ca1] byte
    .byte $21,$86,$21,$21,$31,$00,$31,$00   ; [$9ca9] byte
    .byte $8c,$21,$21,$86,$31,$00,$31,$00   ; [$9cb1] byte
    .byte $8c,$21,$86,$31,$00,$31,$00,$31   ; [$9cb9] byte
    .byte $00,$8c,$21,$86,$31,$00,$31,$00   ; [$9cc1] byte
    .byte $8c,$21,$86,$31,$00,$8c,$21,$86   ; [$9cc9] byte
    .byte $31,$00,$00,$00,$31,$00,$00,$00   ; [$9cd1] byte
    .byte $8c,$21,$21,$21,$21               ; [$9cd9] byte

    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c,$00,$86,$31,$31,$8c,$21,$00   ; [$9ce0] byte
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $b0,$00,$8c,$00,$31,$86,$31,$31   ; [$9ceb] byte
    .byte $31,$00,$8c,$00,$00,$31,$00,$00   ; [$9cf3] byte
    .byte $31,$00,$00,$00,$00,$31,$00,$00   ; [$9cfb] byte
    .byte $31,$00,$00,$00,$00,$31,$00,$00   ; [$9d03] byte
    .byte $31,$00,$00,$00,$00,$31,$00,$00   ; [$9d0b] byte
    .byte $31,$00,$86,$31,$31,$8c,$00,$00   ; [$9d13] byte
    .byte $31,$00,$00,$31,$00,$00,$00,$00   ; [$9d1b] byte
    .byte $31,$00,$00,$31,$00,$00,$00,$00   ; [$9d23] byte
    .byte $31,$00,$00,$31,$31,$00,$31,$31   ; [$9d2b] byte
    .byte $31,$00                           ; [$9d33] byte

    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for Forepaw.
;
; XREFS:
;     MSCRIPTS_FOREPAW [$PRG5::8f1b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_FOREPAW [$PRG5::8f1b]
;
MSCRIPT_FOREPAW_SQ1:                        ; [$9d38]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $03                               ;  '- Reduce volume by 3
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte MSCRIPT_OP_PUSH_ADDR              ; Op: Save address
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $a0                               ; Note length: 32
    .byte $32                               ; D4
    .byte $33                               ; D#4
    .byte $c0                               ; Note length: 64
    .byte $38                               ; G#4
    .byte $a0                               ; Note length: 32
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $c0                               ; Note length: 64
    .byte $3e                               ; D5
    .byte $a0                               ; Note length: 32
    .byte $3d                               ; C#5
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $c0                               ; Note length: 64
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $34                               ; E4
    .byte $2c                               ; G#3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $34                               ; E4
    .byte $2c                               ; G#3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $31                               ; C#4
    .byte $39                               ; A4
    .byte $31                               ; C#4
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $31                               ; C#4
    .byte $39                               ; A4
    .byte $31                               ; C#4
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $25                               ; C#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_POP_ADDR               ; Op: Jump to saved address
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_FOREPAW [$PRG5::8f1d]
;
MSCRIPT_FOREPAW_SQ2:                        ; [$9daf]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $05                               ;  '- Reduce volume by 5
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $02                               ;  '- 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $11                               ;  '- Duty cycle 0     Constant
                                            ; volume/envelope
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $88                               ; Note length: 8
    .byte $26                               ; D3
    .byte MSCRIPT_OP_PUSH_ADDR              ; Op: Save address
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $22                               ; A#2
    .byte $2a                               ; F#3
    .byte $88                               ; Note length: 8
    .byte $26                               ; D3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $32                               ; D4
    .byte $2d                               ; A3
    .byte $2a                               ; F#3
    .byte $28                               ; E3
    .byte $33                               ; D#4
    .byte $2d                               ; A3
    .byte $2a                               ; F#3
    .byte $28                               ; E3
    .byte $38                               ; G#4
    .byte $32                               ; D4
    .byte $2d                               ; A3
    .byte $2a                               ; F#3
    .byte $28                               ; E3
    .byte $26                               ; D3
    .byte $21                               ; A2
    .byte $1f                               ; G2
    .byte $36                               ; F#4
    .byte $32                               ; D4
    .byte $2d                               ; A3
    .byte $2a                               ; F#3
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte $2c                               ; G#3
    .byte $28                               ; E3
    .byte $3e                               ; D5
    .byte $3b                               ; B4
    .byte $34                               ; E4
    .byte $2f                               ; B3
    .byte $2a                               ; F#3
    .byte $27                               ; D#3
    .byte $26                               ; D3
    .byte $26                               ; D3
    .byte $3d                               ; C#5
    .byte $39                               ; A4
    .byte $36                               ; F#4
    .byte $32                               ; D4
    .byte $39                               ; A4
    .byte $36                               ; F#4
    .byte $32                               ; D4
    .byte $2d                               ; A3
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte $2d                               ; A3
    .byte $3b                               ; B4
    .byte $36                               ; F#4
    .byte $34                               ; E4
    .byte $2f                               ; B3
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte $2f                               ; B3
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $26                               ; D3
    .byte $23                               ; B2
    .byte $1f                               ; G2
    .byte $32                               ; D4
    .byte $2f                               ; B3
    .byte $2b                               ; G3
    .byte $28                               ; E3
    .byte $26                               ; D3
    .byte $23                               ; B2
    .byte $1f                               ; G2
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $34                               ; E4
    .byte $2c                               ; G#3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $88                               ; Note length: 8
    .byte $29                               ; F3
    .byte $29                               ; F3
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $34                               ; E4
    .byte $2c                               ; G#3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $90                               ; Note length: 16
    .byte $29                               ; F3
    .byte $90                               ; Note length: 16
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $31                               ; C#4
    .byte $39                               ; A4
    .byte $31                               ; C#4
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $90                               ; Note length: 16
    .byte $2e                               ; A#3
    .byte $90                               ; Note length: 16
    .byte $2b                               ; G3
    .byte $2e                               ; A#3
    .byte $31                               ; C#4
    .byte $39                               ; A4
    .byte $31                               ; C#4
    .byte $2e                               ; A#3
    .byte $2b                               ; G3
    .byte $88                               ; Note length: 8
    .byte $25                               ; C#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_POP_ADDR               ; Op: Jump to saved address
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_FOREPAW [$PRG5::8f1f]
;
MSCRIPT_FOREPAW_TRI:                        ; [$9e73]
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $80                               ;  '- 128 ticks
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_PUSH_ADDR              ; Op: Save address
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#6
    .byte $37                               ; G6
    .byte $c0                               ; Note length: 64
    .byte $39                               ; A6
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#6
    .byte $37                               ; G6
    .byte $c0                               ; Note length: 64
    .byte $34                               ; E6
    .byte $2d                               ; A5
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#6
    .byte $37                               ; G6
    .byte $c0                               ; Note length: 64
    .byte $39                               ; A6
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#6
    .byte $37                               ; G6
    .byte $34                               ; E6
    .byte $33                               ; D#6
    .byte $32                               ; D6
    .byte $d0                               ; Note length: 80
    .byte $2d                               ; A5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $04                               ;  '- 4 iterations
    .byte $88                               ; Note length: 8
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $a0                               ; Note length: 32
    .byte $1a                               ; D4
    .byte $88                               ; Note length: 8
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $a0                               ; Note length: 32
    .byte $1a                               ; D4
    .byte $88                               ; Note length: 8
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $a0                               ; Note length: 32
    .byte $1a                               ; D4
    .byte $88                               ; Note length: 8
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $a0                               ; Note length: 32
    .byte $1a                               ; D4
    .byte $88                               ; Note length: 8
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $28                               ; E5
    .byte $20                               ; G#4
    .byte $90                               ; Note length: 16
    .byte $1a                               ; D4
    .byte $1d                               ; F4
    .byte $a0                               ; Note length: 32
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $28                               ; E5
    .byte $20                               ; G#4
    .byte $90                               ; Note length: 16
    .byte $1a                               ; D4
    .byte $1d                               ; F4
    .byte $a0                               ; Note length: 32
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $2d                               ; A5
    .byte $25                               ; C#5
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G4
    .byte $22                               ; A#4
    .byte $a0                               ; Note length: 32
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $2d                               ; A5
    .byte $25                               ; C#5
    .byte $90                               ; Note length: 16
    .byte $1f                               ; G4
    .byte $22                               ; A#4
    .byte $a0                               ; Note length: 32
    .byte $19                               ; C#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_POP_ADDR               ; Op: Jump to saved address
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_FOREPAW [$PRG5::8f21]
;
MSCRIPT_FOREPAW_NOISE:                      ; [$9ee0]
    .byte $ff,$ff                           ; [$9ee0] byte


;============================================================================
; Music for Tower.
;
; XREFS:
;     MSCRIPTS_TOWER [$PRG5::8f23]
;============================================================================

;
; XREFS:
;     MSCRIPTS_TOWER [$PRG5::8f23]
;
MSCRIPT_TOWER_SQ1:                          ; [$9ee2]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $3a                               ; A#4
    .byte $39                               ; A4
    .byte $35                               ; F4
    .byte $38                               ; G#4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $88                               ; Note length: 8
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $3a                               ; A#4
    .byte $39                               ; A4
    .byte $35                               ; F4
    .byte $38                               ; G#4
    .byte $39                               ; A4
    .byte $38                               ; G#4
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $90                               ; Note length: 16
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $90                               ; Note length: 16
    .byte $34                               ; E4
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $3a                               ; A#4
    .byte $3a                               ; A#4
    .byte $3c                               ; C5
    .byte $3c                               ; C5
    .byte $3d                               ; C#5
    .byte $a0                               ; Note length: 32
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $88                               ; Note length: 8
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $30                               ; C4
    .byte $31                               ; C#4
    .byte $30                               ; C4
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $31                               ; C#4
    .byte $30                               ; C4
    .byte $90                               ; Note length: 16
    .byte $35                               ; F4
    .byte $a0                               ; Note length: 32
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $35                               ; F4
    .byte $a0                               ; Note length: 32
    .byte $3d                               ; C#5
    .byte $88                               ; Note length: 8
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $33                               ; D#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TOWER [$PRG5::8f25]
;
MSCRIPT_TOWER_SQ2:                          ; [$9f67]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $04                               ;  '- 4
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $2d                               ; A3
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $00                               ;  '- 0
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $88                               ; Note length: 8
    .byte $33                               ; D#4
    .byte $32                               ; D4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $33                               ; D#4
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $90                               ; Note length: 16
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $90                               ; Note length: 16
    .byte $2f                               ; B3
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $3a                               ; A#4
    .byte $a0                               ; Note length: 32
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $88                               ; Note length: 8
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $2c                               ; G#3
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte $32                               ; D4
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $2e                               ; A#3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $07                               ;  '- Reduce volume by 7
    .byte MSCRIPT_OP_SET_SQ2_PITCH_BIAS     ; Op: Set SQ2 pitch bias
    .byte $01                               ;  '- 1
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $31                               ; C#4
    .byte $30                               ; C4
    .byte $90                               ; Note length: 16
    .byte $35                               ; F4
    .byte $a0                               ; Note length: 32
    .byte $34                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $35                               ; F4
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $35                               ; F4
    .byte $9c                               ; Note length: 28
    .byte $3d                               ; C#5
    .byte $88                               ; Note length: 8
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $84                               ; Note length: 4
    .byte $33                               ; D#4
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $04                               ;  '- Reduce volume by 4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TOWER [$PRG5::8f27]
;
MSCRIPT_TOWER_TRI:                          ; [$9ffa]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $90                               ; Note length: 16
    .byte $18                               ; C4
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $0c                               ; C3
    .byte $18                               ; C4
    .byte $0c                               ; C3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $18                               ; C4
    .byte $19                               ; C#4
    .byte $00                               ; Rest
    .byte $19                               ; C#4
    .byte $18                               ; C4
    .byte $13                               ; G3
    .byte $90                               ; Note length: 16
    .byte $0c                               ; C3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $17                               ; B3
    .byte $18                               ; C4
    .byte $0c                               ; C3
    .byte $0d                               ; C#3
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $20                               ; G#4
    .byte $18                               ; C4
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $00                               ; Rest
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $00                               ; Rest
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $a0                               ; Note length: 32
    .byte $14                               ; G#3
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $a0                               ; Note length: 32
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $1f                               ; G4
    .byte $88                               ; Note length: 8
    .byte $18                               ; C4
    .byte $90                               ; Note length: 16
    .byte $0c                               ; C3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $0c                               ; C3
    .byte $0c                               ; C3
    .byte $90                               ; Note length: 16
    .byte $0c                               ; C3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $0c                               ; C3
    .byte $0c                               ; C3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $24                               ; C5
    .byte $1e                               ; F#4
    .byte $1d                               ; F4
    .byte $1c                               ; E4
    .byte $14                               ; G#3
    .byte $a0                               ; Note length: 32
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $18                               ; C4
    .byte $17                               ; B3
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TOWER [$PRG5::8f29]
;
MSCRIPT_TOWER_NOISE:                        ; [$a0b1]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $04                               ;  '- 4 iterations
    .byte $88,$21,$31,$31,$21,$31,$31,$21   ; [$a0b3] byte
    .byte $31,$21,$31,$31,$21,$31,$31,$21   ; [$a0bb] byte
    .byte $31                               ; [$a0c3] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88,$21,$21,$21,$21,$21,$00,$31   ; [$a0c7] byte
    .byte $31,$31,$31,$31,$31,$21,$00,$00   ; [$a0cf] byte
    .byte $21,$11,$11,$11,$00,$85,$31,$31   ; [$a0d7] byte
    .byte $86,$31,$88,$31,$31,$31,$31,$21   ; [$a0df] byte
    .byte $00,$21,$00,$21,$21,$31,$00,$31   ; [$a0e7] byte
    .byte $00,$31,$31,$21,$00,$31,$00,$31   ; [$a0ef] byte
    .byte $31,$31,$31,$21,$21,$31,$00,$31   ; [$a0f7] byte
    .byte $00,$31,$00,$31,$00,$85,$31,$31   ; [$a0ff] byte
    .byte $86,$31,$88,$31,$31,$21,$21,$31   ; [$a107] byte
    .byte $00,$31,$31,$31,$31,$21,$31,$31   ; [$a10f] byte
    .byte $31,$31,$31,$31,$31,$21,$31,$31   ; [$a117] byte
    .byte $31,$a0,$00,$88,$21,$21,$21,$21   ; [$a11f] byte
    .byte $85,$31,$31,$86,$31,$88,$31,$31   ; [$a127] byte
    .byte $85,$31,$31,$86,$31,$88,$21,$21   ; [$a12f] byte
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88,$31,$00,$00,$31,$00,$00,$31   ; [$a13a] byte
    .byte $00,$31,$00,$00,$31,$00,$00,$31   ; [$a142] byte
    .byte $31                               ; [$a14a] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88,$31,$11,$11,$31,$11,$11,$31   ; [$a14e] byte
    .byte $11,$31,$11,$11,$31,$11,$11,$31   ; [$a156] byte
    .byte $31                               ; [$a15e] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for Eolis.
;
; XREFS:
;     MSCRIPTS_EOLIS [$PRG5::8f2b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_EOLIS [$PRG5::8f2b]
;
MSCRIPT_EOLIS_SQ1:                          ; [$a163]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $38                               ; G#4
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $38                               ; G#4
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $40                               ; E5
    .byte $41                               ; F5
    .byte $3f                               ; D#5
    .byte $40                               ; E5
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $37                               ; G4
    .byte $8c                               ; Note length: 12
    .byte $36                               ; F#4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3a                               ; A#4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $3f                               ; D#5
    .byte $3d                               ; C#5
    .byte $3e                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $3f                               ; D#5
    .byte $8c                               ; Note length: 12
    .byte $43                               ; G5
    .byte $41                               ; F5
    .byte $3c                               ; C5
    .byte $00                               ; Rest
    .byte $3e                               ; D5
    .byte $00                               ; Rest
    .byte $3e                               ; D5
    .byte $41                               ; F5
    .byte $3f                               ; D#5
    .byte $00                               ; Rest
    .byte $3a                               ; A#4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $3f                               ; D#5
    .byte $00                               ; Rest
    .byte $3f                               ; D#5
    .byte $00                               ; Rest
    .byte $38                               ; G#4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $3f                               ; D#5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $38                               ; G#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $3f                               ; D#5
    .byte $00                               ; Rest
    .byte $3f                               ; D#5
    .byte $34                               ; E4
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte $34                               ; E4
    .byte $2d                               ; A3
    .byte $32                               ; D4
    .byte $00                               ; Rest
    .byte $2f                               ; B3
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $40                               ; E5
    .byte $98                               ; Note length: 24
    .byte $39                               ; A4
    .byte $40                               ; E5
    .byte $3f                               ; D#5
    .byte $8c                               ; Note length: 12
    .byte $41                               ; F5
    .byte $98                               ; Note length: 24
    .byte $40                               ; E5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $32                               ; D4
    .byte $8c                               ; Note length: 12
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $28                               ; E3
    .byte $2d                               ; A3
    .byte $2c                               ; G#3
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $33                               ; D#4
    .byte $2f                               ; B3
    .byte $32                               ; D4
    .byte $31                               ; C#4
    .byte $2d                               ; A3
    .byte $30                               ; C4
    .byte $fc                               ; Op: End loop
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $c8                               ; Note length: 72
    .byte $00                               ; Rest
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $29                               ; F3
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_EOLIS [$PRG5::8f2d]
;
MSCRIPT_EOLIS_SQ2:                          ; [$a21b]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $28                               ; E3
    .byte $33                               ; D#4
    .byte $32                               ; D4
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $30                               ; C4
    .byte $8c                               ; Note length: 12
    .byte $2f                               ; B3
    .byte $32                               ; D4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $2e                               ; A#3
    .byte $8c                               ; Note length: 12
    .byte $2d                               ; A3
    .byte $30                               ; C4
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3a                               ; A#4
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $3a                               ; A#4
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $a4                               ; Note length: 36
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $3f                               ; D#5
    .byte $3e                               ; D5
    .byte $39                               ; A4
    .byte $00                               ; Rest
    .byte $3a                               ; A#4
    .byte $00                               ; Rest
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte $3c                               ; C5
    .byte $00                               ; Rest
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c                               ; Note length: 12
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $33                               ; D#4
    .byte $32                               ; D4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c                               ; Note length: 12
    .byte $33                               ; D#4
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $28                               ; E3
    .byte $24                               ; C3
    .byte $2d                               ; A3
    .byte $24                               ; C3
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $98                               ; Note length: 24
    .byte $34                               ; E4
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $3e                               ; D5
    .byte $98                               ; Note length: 24
    .byte $3c                               ; C5
    .byte $8c                               ; Note length: 12
    .byte $39                               ; A4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $32                               ; D4
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $2f                               ; B3
    .byte $8c                               ; Note length: 12
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $23                               ; B2
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $23                               ; B2
    .byte $28                               ; E3
    .byte $27                               ; D#3
    .byte $24                               ; C3
    .byte $21                               ; A2
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $23                               ; B2
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $2f                               ; B3
    .byte $2e                               ; A#3
    .byte $2a                               ; F#3
    .byte $2d                               ; A3
    .byte $2c                               ; G#3
    .byte $28                               ; E3
    .byte $2b                               ; G3
    .byte $fc                               ; Op: End loop
    .byte $2a                               ; F#3
    .byte $00                               ; Rest
    .byte $c8                               ; Note length: 72
    .byte $00                               ; Rest
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $8c                               ; Note length: 12
    .byte $00                               ; Rest
    .byte $26                               ; D3
    .byte $25                               ; C#3
    .byte $24                               ; C3
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_EOLIS [$PRG5::8f2f]
;
MSCRIPT_EOLIS_TRI:                          ; [$a2d1]
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $17                               ; B3
    .byte $18                               ; C4
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $15                               ; A3
    .byte $8c                               ; Note length: 12
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $15                               ; A3
    .byte $1f                               ; G4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $15                               ; A3
    .byte $10                               ; E3
    .byte $98                               ; Note length: 24
    .byte $13                               ; G3
    .byte $8c                               ; Note length: 12
    .byte $1f                               ; G4
    .byte $1a                               ; D4
    .byte $0e                               ; D3
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $0e                               ; D3
    .byte $13                               ; G3
    .byte $1d                               ; F4
    .byte $1f                               ; G4
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $16                               ; A#3
    .byte $13                               ; G3
    .byte $0e                               ; D3
    .byte $0c                               ; C3
    .byte $0c                               ; C3
    .byte $18                               ; C4
    .byte $0c                               ; C3
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $11                               ; F3
    .byte $16                               ; A#3
    .byte $00                               ; Rest
    .byte $22                               ; A#4
    .byte $0f                               ; D#3
    .byte $00                               ; Rest
    .byte $1b                               ; D#4
    .byte $16                               ; A#3
    .byte $0f                               ; D#3
    .byte $14                               ; G#3
    .byte $1a                               ; D4
    .byte $14                               ; G#3
    .byte $1b                               ; D#4
    .byte $00                               ; Rest
    .byte $1b                               ; D#4
    .byte $00                               ; Rest
    .byte $0f                               ; D#3
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c                               ; Note length: 12
    .byte $14                               ; G#3
    .byte $20                               ; G#4
    .byte $14                               ; G#3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $12                               ; F#3
    .byte $14                               ; G#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c                               ; Note length: 12
    .byte $14                               ; G#3
    .byte $20                               ; G#4
    .byte $14                               ; G#3
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $12                               ; F#3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $17                               ; B3
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8c                               ; Note length: 12
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $14                               ; G#3
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $98                               ; Note length: 24
    .byte $10                               ; E3
    .byte $8c                               ; Note length: 12
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $20                               ; G#4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $12                               ; F#3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $1b                               ; D#4
    .byte $1a                               ; D4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8c                               ; Note length: 12
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte $00                               ; Rest
    .byte $11                               ; F3
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $1b                               ; D#4
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte $00                               ; Rest
    .byte $11                               ; F3
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte $00                               ; Rest
    .byte $12                               ; F#3
    .byte $11                               ; F3
    .byte $10                               ; E3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $00                               ; Rest
    .byte $21                               ; A4
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1c                               ; E4
    .byte $00                               ; Rest
    .byte $10                               ; E3
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $21                               ; A4
    .byte $20                               ; G#4
    .byte $00                               ; Rest
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_EOLIS [$PRG5::8f31]
;
MSCRIPT_EOLIS_NOISE:                        ; [$a3b8]
    .byte $8c,$3c,$3c,$30,$3c,$3c,$30,$3c   ; [$a3b8] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$30,$3c   ; [$a3c0] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$30,$3c   ; [$a3c8] byte
    .byte $3c,$30,$30,$30,$30,$00,$3c,$3c   ; [$a3d0] byte
    .byte $3c                               ; [$a3d8] byte

    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8c,$3c,$3c,$30,$3c,$3c,$3c,$30   ; [$a3db] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$3c,$30   ; [$a3e3] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$3c,$30   ; [$a3eb] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$3c,$30   ; [$a3f3] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$3c,$30   ; [$a3fb] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$30,$30   ; [$a403] byte
    .byte $30,$3c,$3c,$30,$3c,$3c,$30,$3c   ; [$a40b] byte
    .byte $3c                               ; [$a413] byte

    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c,$3c,$3c,$30,$3c,$3c,$30,$3c   ; [$a416] byte
    .byte $3c                               ; [$a41e] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c,$3c,$3c,$30,$3c,$30,$3c,$3c   ; [$a422] byte
    .byte $3c,$30,$30,$30,$30,$00,$30,$30   ; [$a42a] byte
    .byte $00                               ; [$a432] byte

    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8c,$3c,$3c,$30,$3c,$3c,$30,$00   ; [$a435] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$30,$00   ; [$a43d] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$30,$00   ; [$a445] byte
    .byte $3c,$3c,$3c,$30,$3c,$3c,$30,$30   ; [$a44d] byte
    .byte $30                               ; [$a455] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8c,$3c,$3c,$3c,$3c,$3c,$30,$3c   ; [$a459] byte
    .byte $3c,$3c,$3c,$3c,$3c,$3c,$30,$30   ; [$a461] byte
    .byte $30,$3c,$3c,$3c,$3c,$3c,$30,$3c   ; [$a469] byte
    .byte $3c,$3c,$30,$3c,$3c,$3c,$3c,$86   ; [$a471] byte
    .byte $3c,$3c,$8c,$30                   ; [$a479] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $3c,$00,$30,$3c,$3c,$30,$3c,$3c   ; [$a47e] byte
    .byte $3c,$00,$30,$3c,$3c,$30,$3c,$3c   ; [$a486] byte
    .byte $3c,$00,$30,$3c,$3c,$30,$3c,$3c   ; [$a48e] byte
    .byte $3c,$3c,$30,$3c,$3c,$30,$30,$30   ; [$a496] byte
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for the death screen.
;
; XREFS:
;     MSCRIPTS_MANTRA [$PRG5::8f33]
;============================================================================

;
; XREFS:
;     MSCRIPTS_MANTRA [$PRG5::8f33]
;
MSCRIPT_MANTRA_SQ1:                         ; [$a4a1]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $04                               ;  '- Reduce volume by 4
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $02                               ;  '- Mode 2: Pluck
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $a0                               ; Note length: 32
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $36                               ; F#4
    .byte $90                               ; Note length: 16
    .byte $3b                               ; B4
    .byte $b0                               ; Note length: 48
    .byte $37                               ; G4
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $a0                               ; Note length: 32
    .byte $39                               ; A4
    .byte $90                               ; Note length: 16
    .byte $3e                               ; D5
    .byte $c0                               ; Note length: 64
    .byte $3b                               ; B4
    .byte $90                               ; Note length: 16
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $b0                               ; Note length: 48
    .byte $39                               ; A4
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#4
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $a0                               ; Note length: 32
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $33                               ; D#4
    .byte $34                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $36                               ; F#4
    .byte $90                               ; Note length: 16
    .byte $3b                               ; B4
    .byte $b0                               ; Note length: 48
    .byte $37                               ; G4
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $a0                               ; Note length: 32
    .byte $39                               ; A4
    .byte $90                               ; Note length: 16
    .byte $3e                               ; D5
    .byte $c0                               ; Note length: 64
    .byte $3b                               ; B4
    .byte $90                               ; Note length: 16
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $b0                               ; Note length: 48
    .byte $39                               ; A4
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#4
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $90                               ; Note length: 16
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $b0                               ; Note length: 48
    .byte $3b                               ; B4
    .byte $a0                               ; Note length: 32
    .byte $2f                               ; B3
    .byte $90                               ; Note length: 16
    .byte $3b                               ; B4
    .byte $3b                               ; B4
    .byte $3b                               ; B4
    .byte $3b                               ; B4
    .byte $a0                               ; Note length: 32
    .byte $3b                               ; B4
    .byte $90                               ; Note length: 16
    .byte $3e                               ; D5
    .byte $d0                               ; Note length: 80
    .byte $3c                               ; C5
    .byte $90                               ; Note length: 16
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $a0                               ; Note length: 32
    .byte $36                               ; F#4
    .byte $40                               ; E5
    .byte $3e                               ; D5
    .byte $39                               ; A4
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $a0                               ; Note length: 32
    .byte $3b                               ; B4
    .byte $90                               ; Note length: 16
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $40                               ; E5
    .byte $90                               ; Note length: 16
    .byte $37                               ; G4
    .byte $c0                               ; Note length: 64
    .byte $37                               ; G4
    .byte $a0                               ; Note length: 32
    .byte $3e                               ; D5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $d6                               ; Note length: 86
    .byte $3b                               ; B4
    .byte $95                               ; Note length: 21
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $a0                               ; Note length: 32
    .byte $36                               ; F#4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_MANTRA [$PRG5::8f35]
;
MSCRIPT_MANTRA_SQ2:                         ; [$a530]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $06                               ;  '- Reduce volume by 6
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $02                               ;  '- Mode 2: Pluck
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $80                               ;  '- 128 ticks
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $a0                               ; Note length: 32
    .byte $2b                               ; G3
    .byte $90                               ; Note length: 16
    .byte $2a                               ; F#3
    .byte $2b                               ; G3
    .byte $a0                               ; Note length: 32
    .byte $2d                               ; A3
    .byte $90                               ; Note length: 16
    .byte $2a                               ; F#3
    .byte $b0                               ; Note length: 48
    .byte $2f                               ; B3
    .byte $90                               ; Note length: 16
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $a0                               ; Note length: 32
    .byte $30                               ; C4
    .byte $90                               ; Note length: 16
    .byte $36                               ; F#4
    .byte $c0                               ; Note length: 64
    .byte $32                               ; D4
    .byte $90                               ; Note length: 16
    .byte $2f                               ; B3
    .byte $34                               ; E4
    .byte $32                               ; D4
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $b0                               ; Note length: 48
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $31                               ; C#4
    .byte $33                               ; D#4
    .byte $31                               ; C#4
    .byte $2f                               ; B3
    .byte $2d                               ; A3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $2b                               ; G3
    .byte $28                               ; E3
    .byte $2a                               ; F#3
    .byte $2b                               ; G3
    .byte $2d                               ; A3
    .byte $2a                               ; F#3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $26                               ; D3
    .byte $2b                               ; G3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $2d                               ; A3
    .byte $36                               ; F#4
    .byte $32                               ; D4
    .byte $2b                               ; G3
    .byte $2f                               ; B3
    .byte $2b                               ; G3
    .byte $2f                               ; B3
    .byte $34                               ; E4
    .byte $32                               ; D4
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $31                               ; C#4
    .byte $34                               ; E4
    .byte $31                               ; C#4
    .byte $a0                               ; Note length: 32
    .byte $33                               ; D#4
    .byte $90                               ; Note length: 16
    .byte $2b                               ; G3
    .byte $a0                               ; Note length: 32
    .byte $2a                               ; F#3
    .byte $90                               ; Note length: 16
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $38                               ; G#4
    .byte $a0                               ; Note length: 32
    .byte $38                               ; G#4
    .byte $90                               ; Note length: 16
    .byte $3b                               ; B4
    .byte $d0                               ; Note length: 80
    .byte $39                               ; A4
    .byte $90                               ; Note length: 16
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $34                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $32                               ; D4
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $36                               ; F#4
    .byte $b0                               ; Note length: 48
    .byte $38                               ; G#4
    .byte $a0                               ; Note length: 32
    .byte $37                               ; G4
    .byte $90                               ; Note length: 16
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; C5
    .byte $90                               ; Note length: 16
    .byte $34                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $39                               ; A4
    .byte $32                               ; D4
    .byte $39                               ; A4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $2b                               ; G3
    .byte $34                               ; E4
    .byte $2d                               ; A3
    .byte $d6                               ; Note length: 86
    .byte $34                               ; E4
    .byte $95                               ; Note length: 21
    .byte $36                               ; F#4
    .byte $34                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $33                               ; D#4
    .byte $e0                               ; Note length: 96
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_MANTRA [$PRG5::8f37]
;
MSCRIPT_MANTRA_TRI:                         ; [$a5bb]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $1c                               ; E4
    .byte $28                               ; E5
    .byte $23                               ; B4
    .byte $1c                               ; E4
    .byte $1e                               ; F#4
    .byte $28                               ; E5
    .byte $27                               ; D#5
    .byte $23                               ; B4
    .byte $1f                               ; G4
    .byte $28                               ; E5
    .byte $23                               ; B4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $2b                               ; G5
    .byte $28                               ; E5
    .byte $1e                               ; F#4
    .byte $1f                               ; G4
    .byte $2b                               ; G5
    .byte $26                               ; D5
    .byte $1f                               ; G4
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $1f                               ; G4
    .byte $18                               ; C4
    .byte $1e                               ; F#4
    .byte $2a                               ; F#5
    .byte $25                               ; C#5
    .byte $1e                               ; F#4
    .byte $23                               ; B4
    .byte $27                               ; D#5
    .byte $2a                               ; F#5
    .byte $23                               ; B4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $10                               ; E3
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte $12                               ; F#3
    .byte $1c                               ; E4
    .byte $1b                               ; D#4
    .byte $17                               ; B3
    .byte $13                               ; G3
    .byte $1c                               ; E4
    .byte $17                               ; B3
    .byte $10                               ; E3
    .byte $15                               ; A3
    .byte $1f                               ; G4
    .byte $1c                               ; E4
    .byte $12                               ; F#3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $1a                               ; D4
    .byte $13                               ; G3
    .byte $0c                               ; C3
    .byte $18                               ; C4
    .byte $13                               ; G3
    .byte $0c                               ; C3
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $90                               ; Note length: 16
    .byte $12                               ; F#3
    .byte $1e                               ; F#4
    .byte $19                               ; C#4
    .byte $12                               ; F#3
    .byte $17                               ; B3
    .byte $23                               ; B4
    .byte $1e                               ; F#4
    .byte $17                               ; B3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $90                               ; Note length: 16
    .byte $12                               ; F#3
    .byte $19                               ; C#4
    .byte $1c                               ; E4
    .byte $a0                               ; Note length: 32
    .byte $17                               ; B3
    .byte $90                               ; Note length: 16
    .byte $17                               ; B3
    .byte $18                               ; C4
    .byte $17                               ; B3
    .byte $1c                               ; E4
    .byte $23                               ; B4
    .byte $28                               ; E5
    .byte $23                               ; B4
    .byte $1c                               ; E4
    .byte $20                               ; G#4
    .byte $23                               ; B4
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $18                               ; C4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $15                               ; A3
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $0e                               ; D3
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $15                               ; A3
    .byte $0e                               ; D3
    .byte $12                               ; F#3
    .byte $15                               ; A3
    .byte $1a                               ; D4
    .byte $1b                               ; D#4
    .byte $18                               ; C4
    .byte $14                               ; G#3
    .byte $a0                               ; Note length: 32
    .byte $13                               ; G3
    .byte $90                               ; Note length: 16
    .byte $1a                               ; D4
    .byte $1f                               ; G4
    .byte $1a                               ; D4
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $1f                               ; G4
    .byte $24                               ; C5
    .byte $1f                               ; G4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $13                               ; G3
    .byte $15                               ; A3
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $21                               ; A4
    .byte $21                               ; A4
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $15                               ; A3
    .byte $12                               ; F#3
    .byte $15                               ; A3
    .byte $18                               ; C4
    .byte $1c                               ; E4
    .byte $96                               ; Note length: 22
    .byte $1e                               ; F#4
    .byte $95                               ; Note length: 21
    .byte $1c                               ; E4
    .byte $18                               ; C4
    .byte $90                               ; Note length: 16
    .byte $17                               ; B3
    .byte $00                               ; Rest
    .byte $84                               ; Note length: 4
    .byte $23                               ; B4
    .byte $24                               ; C5
    .byte $88                               ; Note length: 8
    .byte $23                               ; B4
    .byte $a0                               ; Note length: 32
    .byte $23                               ; B4
    .byte $90                               ; Note length: 16
    .byte $21                               ; A4
    .byte $1f                               ; G4
    .byte $1e                               ; F#4
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_MANTRA [$PRG5::8f39]
;
MSCRIPT_MANTRA_NOISE:                       ; [$a65c]
    .byte MSCRIPT_OP_END                    ; [$a65c] MScriptOp
    .byte MSCRIPT_OP_END                    ; [$a65d] MScriptOp


;============================================================================
; Music for Macon/Victim.
;
; XREFS:
;     MSCRIPTS_MASCON_VICTIM [$PRG5::8f3b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_MASCON_VICTIM [$PRG5::8f3b]
;
MSCRIPT_MASCON_VICTIM_SQ1:                  ; [$a65e]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $a0                               ;  '- 160 ticks
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $03                               ;  '- 3 iterations
    .byte $8a                               ; Note length: 10
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $2b                               ; G3
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_MASCON_VICTIM [$PRG5::8f3d]
;
MSCRIPT_MASCON_VICTIM_SQ2:                  ; [$a6b0]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $a0                               ;  '- 160 ticks
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $03                               ;  '- 3 iterations
    .byte $8a                               ; Note length: 10
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $28                               ; E3
    .byte $29                               ; F3
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $2d                               ; A3
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $27                               ; D#3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $27                               ; D#3
    .byte $00                               ; Rest
    .byte $27                               ; D#3
    .byte $26                               ; D3
    .byte $27                               ; D#3
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_MASCON_VICTIM [$PRG5::8f3f]
;
MSCRIPT_MASCON_VICTIM_TRI:                  ; [$a700]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8a                               ; Note length: 10
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1e                               ; F#4
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $18                               ; C4
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $1c                               ; E4
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1d                               ; F4
    .byte $1e                               ; F#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8a                               ; Note length: 10
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $12                               ; F#3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $0e                               ; D3
    .byte $0c                               ; C3
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $10                               ; E3
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $11                               ; F3
    .byte $12                               ; F#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_MASCON_VICTIM [$PRG5::8f41]
;
MSCRIPT_MASCON_VICTIM_NOISE:                ; [$a78a]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $08                               ;  '- 8 iterations
    .byte $8a,$31,$31,$31,$31,$31,$31,$31   ; [$a78c] byte
    .byte $31,$31,$31,$31,$31,$31,$31,$85   ; [$a794] byte
    .byte $31,$31,$31,$31,$8a,$31,$31,$31   ; [$a79c] byte
    .byte $31,$31,$31,$31,$31,$31,$31,$31   ; [$a7a4] byte
    .byte $31,$85,$31,$31,$31,$31,$8a,$31   ; [$a7ac] byte
    .byte $31                               ; [$a7b4] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for boss battles.
;
; XREFS:
;     MSCRIPTS_BOSS [$PRG5::8f43]
;============================================================================

;
; XREFS:
;     MSCRIPTS_BOSS [$PRG5::8f43]
;
MSCRIPT_BOSS_SQ1:                           ; [$a7b9]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8f                               ; Note length: 15
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $33                               ; D#4
    .byte $27                               ; D#3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $2e                               ; A#3
    .byte $22                               ; A#2
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $33                               ; D#4
    .byte $27                               ; D#3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $2e                               ; A#3
    .byte $22                               ; A#2
    .byte $35                               ; F4
    .byte $29                               ; F3
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $30                               ; C4
    .byte $24                               ; C3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $35                               ; F4
    .byte $29                               ; F3
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $30                               ; C4
    .byte $24                               ; C3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte $97                               ; Note length: 23
    .byte $3a                               ; A#4
    .byte $87                               ; Note length: 7
    .byte $39                               ; A4
    .byte $97                               ; Note length: 23
    .byte $2d                               ; A3
    .byte $87                               ; Note length: 7
    .byte $2e                               ; A#3
    .byte $97                               ; Note length: 23
    .byte $3d                               ; C#5
    .byte $87                               ; Note length: 7
    .byte $3c                               ; C5
    .byte $97                               ; Note length: 23
    .byte $30                               ; C4
    .byte $87                               ; Note length: 7
    .byte $31                               ; C#4
    .byte $85                               ; Note length: 5
    .byte $43                               ; G5
    .byte $42                               ; F#5
    .byte $41                               ; F5
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $3a                               ; A#4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $29                               ; F3
    .byte $24                               ; C3
    .byte $23                               ; B2
    .byte $22                               ; A#2
    .byte $18                               ; C2
    .byte $19                               ; C#2
    .byte $1a                               ; D2
    .byte $1b                               ; D#2
    .byte $1c                               ; E2
    .byte $1d                               ; F2
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_BOSS [$PRG5::8f45]
;
MSCRIPT_BOSS_SQ2:                           ; [$a816]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $04                               ;  '- Reduce volume by 4
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $17                               ;  '- Duty cycle 0     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $8f                               ; Note length: 15
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $33                               ; D#4
    .byte $27                               ; D#3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $2e                               ; A#3
    .byte $22                               ; A#2
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $33                               ; D#4
    .byte $27                               ; D#3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $2e                               ; A#3
    .byte $22                               ; A#2
    .byte $35                               ; F4
    .byte $29                               ; F3
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $30                               ; C4
    .byte $24                               ; C3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $35                               ; F4
    .byte $29                               ; F3
    .byte $34                               ; E4
    .byte $28                               ; E3
    .byte $30                               ; C4
    .byte $24                               ; C3
    .byte $2f                               ; B3
    .byte $23                               ; B2
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte $38                               ; G#4
    .byte $37                               ; G4
    .byte $2c                               ; G#3
    .byte $2d                               ; A3
    .byte $97                               ; Note length: 23
    .byte $3a                               ; A#4
    .byte $87                               ; Note length: 7
    .byte $39                               ; A4
    .byte $97                               ; Note length: 23
    .byte $2d                               ; A3
    .byte $87                               ; Note length: 7
    .byte $2e                               ; A#3
    .byte $97                               ; Note length: 23
    .byte $3d                               ; C#5
    .byte $87                               ; Note length: 7
    .byte $3c                               ; C5
    .byte $97                               ; Note length: 23
    .byte $30                               ; C4
    .byte $87                               ; Note length: 7
    .byte $31                               ; C#4
    .byte $85                               ; Note length: 5
    .byte $43                               ; G5
    .byte $42                               ; F#5
    .byte $41                               ; F5
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $3a                               ; A#4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $2c                               ; G#3
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $29                               ; F3
    .byte $24                               ; C3
    .byte $23                               ; B2
    .byte $22                               ; A#2
    .byte $18                               ; C2
    .byte $19                               ; C#2
    .byte $1a                               ; D2
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#2
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_BOSS [$PRG5::8f47]
;
MSCRIPT_BOSS_TRI:                           ; [$a874]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $fd                               ;  '- Down 3 semitones
    .byte $8a                               ; Note length: 10
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $13                               ; G3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $00                               ;  '- Reset
    .byte $88                               ; Note length: 8
    .byte $0f                               ; D#3
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $27                               ; D#5
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $0f                               ; D#3
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $27                               ; D#5
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $0f                               ; D#3
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $27                               ; D#5
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $0f                               ; D#3
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $27                               ; D#5
    .byte $87                               ; Note length: 7
    .byte $1b                               ; D#4
    .byte $88                               ; Note length: 8
    .byte $11                               ; F3
    .byte $87                               ; Note length: 7
    .byte $1d                               ; F4
    .byte $88                               ; Note length: 8
    .byte $29                               ; F5
    .byte $87                               ; Note length: 7
    .byte $1d                               ; F4
    .byte $88                               ; Note length: 8
    .byte $11                               ; F3
    .byte $87                               ; Note length: 7
    .byte $1d                               ; F4
    .byte $88                               ; Note length: 8
    .byte $29                               ; F5
    .byte $87                               ; Note length: 7
    .byte $1d                               ; F4
    .byte $88                               ; Note length: 8
    .byte $14                               ; G#3
    .byte $87                               ; Note length: 7
    .byte $20                               ; G#4
    .byte $88                               ; Note length: 8
    .byte $2c                               ; G#5
    .byte $87                               ; Note length: 7
    .byte $20                               ; G#4
    .byte $88                               ; Note length: 8
    .byte $14                               ; G#3
    .byte $87                               ; Note length: 7
    .byte $20                               ; G#4
    .byte $88                               ; Note length: 8
    .byte $2c                               ; G#5
    .byte $87                               ; Note length: 7
    .byte $20                               ; G#4
    .byte $94                               ; Note length: 20
    .byte $37                               ; G6
    .byte $38                               ; G#6
    .byte $2f                               ; B5
    .byte $23                               ; B4
    .byte $8a                               ; Note length: 10
    .byte $29                               ; F5
    .byte $2a                               ; F#5
    .byte $23                               ; B4
    .byte $24                               ; C5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_BOSS [$PRG5::8f49]
;
MSCRIPT_BOSS_NOISE:                         ; [$a8f8]
    .byte $ff,$ff                           ; [$a8f8] byte


;============================================================================
; TODO: Music 0x0B
;
; XREFS:
;     MSCRIPTS_HOURGLASS [$PRG5::8f4b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_HOURGLASS [$PRG5::8f4b]
;
MSCRIPT_HOURGLASS_SQ1:                      ; [$a8fa]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $80                               ;  '- 128 ticks
    .byte $00                               ; Rest
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $03                               ;  '- 3 iterations
    .byte $84                               ; Note length: 4
    .byte $1f                               ; G2
    .byte $24                               ; C3
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C3
    .byte $29                               ; F3
    .byte $24                               ; C3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $2e                               ; A#3
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_HOURGLASS [$PRG5::8f4d]
;
MSCRIPT_HOURGLASS_SQ2:                      ; [$a93e]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $13                               ;  '- Duty cycle 0     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $80                               ;  '- 128 ticks
    .byte $00                               ; Rest
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $03                               ;  '- 3 iterations
    .byte $84                               ; Note length: 4
    .byte $00                               ; Rest
    .byte $1f                               ; G2
    .byte $24                               ; C3
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C3
    .byte $29                               ; F3
    .byte $24                               ; C3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $30                               ; C4
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $29                               ; F3
    .byte $2e                               ; A#3
    .byte $29                               ; F3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_HOURGLASS [$PRG5::8f4f]
;
MSCRIPT_HOURGLASS_TRI:                      ; [$a982]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $84                               ; Note length: 4
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $84                               ; Note length: 4
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $0e                               ; D3
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte $24                               ; C5
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_HOURGLASS [$PRG5::8f51]
;
MSCRIPT_HOURGLASS_NOISE:                    ; [$aa1c]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $03                               ;  '- 3 iterations
    .byte $84,$31,$00,$00,$00,$31,$00,$00   ; [$aa1e] byte
    .byte $00,$31,$00,$00,$00,$31,$00,$00   ; [$aa26] byte
    .byte $00,$31,$00,$00,$00,$31,$00,$00   ; [$aa2e] byte
    .byte $00,$31,$00,$00,$00,$31,$00,$00   ; [$aa36] byte
    .byte $00,$31,$00,$00,$00,$31,$00,$00   ; [$aa3e] byte
    .byte $00,$31,$00,$00,$00,$31,$00,$00   ; [$aa46] byte
    .byte $00                               ; [$aa4e] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $84,$31,$00,$31,$00,$31,$00,$31   ; [$aa52] byte
    .byte $00,$31,$00,$31,$00,$31,$00,$31   ; [$aa5a] byte
    .byte $00,$31,$00,$31,$00,$31,$00,$31   ; [$aa62] byte
    .byte $00,$31,$00,$31,$00,$31,$00,$31   ; [$aa6a] byte
    .byte $00,$31,$00,$31,$00,$31,$00,$31   ; [$aa72] byte
    .byte $00,$31,$00,$31,$00,$31,$00,$31   ; [$aa7a] byte
    .byte $00                               ; [$aa82] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for the ending outro sequence.
;
; XREFS:
;     MSCRIPTS_ENDING [$PRG5::8f53]
;============================================================================

;
; XREFS:
;     MSCRIPTS_ENDING [$PRG5::8f53]
;
MSCRIPT_ENDING_SQ1:                         ; [$aa87]
    .byte MSCRIPT_OP_SET_GLOBAL_TRANSPOSE   ; Op: Set global transpose
    .byte $ff                               ;  '- Down 1 semitone
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $00                               ;  '- Reduce volume by 0
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $d0                               ;  '- Duty cycle 3     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_SET_SQ_PITCH_EFFECT_DEPTH ; Op: Set SQ2 envelope depth
    .byte $02                               ;  '- 2
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte $86                               ; Note length: 6
    .byte $1f                               ; F#2
    .byte $21                               ; G#2
    .byte $23                               ; A#2
    .byte $24                               ; B2
    .byte $26                               ; C#3
    .byte $28                               ; D#3
    .byte $29                               ; E3
    .byte $2a                               ; F3
    .byte $2b                               ; F#3
    .byte $2d                               ; G#3
    .byte $2f                               ; A#3
    .byte $30                               ; B3
    .byte $32                               ; C#4
    .byte $34                               ; D#4
    .byte $35                               ; E4
    .byte $36                               ; F4
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $45                               ; G#5
    .byte $c8                               ; Note length: 72
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $3f                               ; D5
    .byte $3c                               ; B4
    .byte $3f                               ; D5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3b                               ; A#4
    .byte $98                               ; Note length: 24
    .byte $37                               ; F#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $a4                               ; Note length: 36
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $b0                               ; Note length: 48
    .byte $3c                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $41                               ; E5
    .byte $41                               ; E5
    .byte $40                               ; D#5
    .byte $a4                               ; Note length: 36
    .byte $3c                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $37                               ; F#4
    .byte $39                               ; G#4
    .byte $a4                               ; Note length: 36
    .byte $3a                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $3a                               ; A4
    .byte $39                               ; G#4
    .byte $3a                               ; A4
    .byte $39                               ; G#4
    .byte $bc                               ; Note length: 60
    .byte $37                               ; F#4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $86                               ; Note length: 6
    .byte $37                               ; F#4
    .byte $39                               ; G#4
    .byte $3b                               ; A#4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $40                               ; D#5
    .byte $41                               ; E5
    .byte $42                               ; F5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $86                               ; Note length: 6
    .byte $3c                               ; B4
    .byte $3b                               ; A#4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $40                               ; D#5
    .byte $41                               ; E5
    .byte $42                               ; F5
    .byte $43                               ; F#5
    .byte $b0                               ; Note length: 48
    .byte $44                               ; G5
    .byte $46                               ; A5
    .byte $c8                               ; Note length: 72
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $3f                               ; D5
    .byte $3f                               ; D5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $3a                               ; A4
    .byte $98                               ; Note length: 24
    .byte $37                               ; F#4
    .byte $86                               ; Note length: 6
    .byte $38                               ; G4
    .byte $37                               ; F#4
    .byte $8c                               ; Note length: 12
    .byte $35                               ; E4
    .byte $92                               ; Note length: 18
    .byte $37                               ; F#4
    .byte $86                               ; Note length: 6
    .byte $30                               ; B3
    .byte $33                               ; D4
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $3f                               ; D5
    .byte $b0                               ; Note length: 48
    .byte $44                               ; G5
    .byte $46                               ; A5
    .byte $bc                               ; Note length: 60
    .byte $43                               ; F#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; B4
    .byte $3c                               ; B4
    .byte $3e                               ; C#5
    .byte $3f                               ; D5
    .byte $3f                               ; D5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $98                               ; Note length: 24
    .byte $3a                               ; A4
    .byte $8c                               ; Note length: 12
    .byte $3f                               ; D5
    .byte $3f                               ; D5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $3a                               ; A4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $cc                               ;  '- 204 ticks
    .byte $3c                               ; B4
    .byte $86                               ; Note length: 6
    .byte $3f                               ; D5
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $3f                               ; D5
    .byte $44                               ; G5
    .byte $00                               ; Rest
    .byte $3f                               ; D5
    .byte $44                               ; G5
    .byte $46                               ; A5
    .byte $41                               ; E5
    .byte $3e                               ; C#5
    .byte $3a                               ; A4
    .byte $3c                               ; B4
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $3c                               ; B4
    .byte $88                               ; Note length: 8
    .byte $3c                               ; B4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $3c                               ; B4
    .byte $37                               ; F#4
    .byte $3c                               ; B4
    .byte $40                               ; D#5
    .byte $98                               ; Note length: 24
    .byte $3c                               ; B4
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_ENDING [$PRG5::8f55]
;
MSCRIPT_ENDING_SQ2:                         ; [$ab47]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $04                               ;  '- Reduce volume by 4
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $d0                               ;  '- Duty cycle 3     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_SQ_PITCH_EFFECT_DEPTH ; Op: Set SQ2 envelope depth
    .byte $00                               ;  '- 0
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $13                               ;  '- Duty cycle 0     Constant
                                            ; volume/envelope
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $2d                               ; A3
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte $32                               ; D4
    .byte $34                               ; E4
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $3c                               ; C5
    .byte $3e                               ; D5
    .byte $3f                               ; D#5
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $50                               ;  '- Duty cycle 1     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $00                               ; Rest
    .byte $48                               ; C6
    .byte $37                               ; G4
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $00                               ; Rest
    .byte $48                               ; C6
    .byte $37                               ; G4
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $00                               ; Rest
    .byte $48                               ; C6
    .byte $39                               ; A4
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $00                               ; Rest
    .byte $48                               ; C6
    .byte $39                               ; A4
    .byte $41                               ; F5
    .byte $41                               ; F5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $00                               ; Rest
    .byte $48                               ; C6
    .byte $37                               ; G4
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $43                               ; G5
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $3f                               ; D#5
    .byte $44                               ; G#5
    .byte $48                               ; C6
    .byte $44                               ; G#5
    .byte $37                               ; G4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $37                               ; G4
    .byte $3b                               ; B4
    .byte $3e                               ; D5
    .byte $3b                               ; B4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $41                               ; F5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $33                               ; D#4
    .byte $37                               ; G4
    .byte $3a                               ; A#4
    .byte $3f                               ; D#5
    .byte $43                               ; G5
    .byte $3f                               ; D#5
    .byte $3a                               ; A#4
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $41                               ; F5
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $86                               ; Note length: 6
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $41                               ; F5
    .byte $43                               ; G5
    .byte $45                               ; A5
    .byte $47                               ; B5
    .byte $48                               ; C6
    .byte $4a                               ; D6
    .byte $4b                               ; D#6
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $86                               ; Note length: 6
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3f                               ; D#5
    .byte $40                               ; E5
    .byte $41                               ; F5
    .byte $43                               ; G5
    .byte $45                               ; A5
    .byte $47                               ; B5
    .byte $48                               ; C6
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $3f                               ; D#5
    .byte $44                               ; G#5
    .byte $48                               ; C6
    .byte $4b                               ; D#6
    .byte $48                               ; C6
    .byte $44                               ; G#5
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte $41                               ; F5
    .byte $46                               ; A#5
    .byte $4a                               ; D6
    .byte $4d                               ; F6
    .byte $4a                               ; D6
    .byte $46                               ; A#5
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $43                               ; G5
    .byte $48                               ; C6
    .byte $4c                               ; E6
    .byte $48                               ; C6
    .byte $43                               ; G5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $38                               ; G#4
    .byte $3c                               ; C5
    .byte $3f                               ; D#5
    .byte $44                               ; G#5
    .byte $48                               ; C6
    .byte $44                               ; G#5
    .byte $41                               ; F5
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte $41                               ; F5
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $3e                               ; D5
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $8c                               ; Note length: 12
    .byte $3f                               ; D#5
    .byte $86                               ; Note length: 6
    .byte $41                               ; F5
    .byte $3f                               ; D#5
    .byte $8c                               ; Note length: 12
    .byte $3c                               ; C5
    .byte $3c                               ; C5
    .byte $86                               ; Note length: 6
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $3f                               ; D#5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $33                               ; D#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $86                               ; Note length: 6
    .byte $3f                               ; D#5
    .byte $44                               ; G#5
    .byte $48                               ; C6
    .byte $44                               ; G#5
    .byte $3f                               ; D#5
    .byte $44                               ; G#5
    .byte $8c                               ; Note length: 12
    .byte $46                               ; A#5
    .byte $00                               ; Rest
    .byte $41                               ; F5
    .byte $43                               ; G5
    .byte $92                               ; Note length: 18
    .byte $40                               ; E5
    .byte $86                               ; Note length: 6
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $3a                               ; A#4
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $2e                               ; A#3
    .byte $32                               ; D4
    .byte $3c                               ; C5
    .byte $38                               ; G#4
    .byte $33                               ; D#4
    .byte $38                               ; G#4
    .byte $30                               ; C4
    .byte $33                               ; D#4
    .byte $2c                               ; G#3
    .byte $30                               ; C4
    .byte $41                               ; F5
    .byte $3e                               ; D5
    .byte $3a                               ; A#4
    .byte $35                               ; F4
    .byte $3e                               ; D5
    .byte $00                               ; Rest
    .byte $3e                               ; D5
    .byte $3e                               ; D5
    .byte $88                               ; Note length: 8
    .byte $34                               ; E4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $34                               ; E4
    .byte $37                               ; G4
    .byte $98                               ; Note length: 24
    .byte $34                               ; E4
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_ENDING [$PRG5::8f57]
;
MSCRIPT_ENDING_TRI:                         ; [$ac99]
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $e8                               ;  '- Down 2 octaves
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $86                               ; Note length: 6
    .byte $3b                               ; B6
    .byte $3c                               ; C7
    .byte $3e                               ; D7
    .byte $40                               ; E7
    .byte $41                               ; F7
    .byte $43                               ; G7
    .byte $45                               ; A7
    .byte $47                               ; B7
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $38                               ; G#6
    .byte $38                               ; G#6
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2b                               ; G5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $37                               ; G6
    .byte $37                               ; G6
    .byte $2b                               ; G5
    .byte $2b                               ; G5
    .byte $2b                               ; G5
    .byte $2b                               ; G5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86                               ; Note length: 6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $33                               ; D#6
    .byte $33                               ; D#6
    .byte $33                               ; D#6
    .byte $33                               ; D#6
    .byte $33                               ; D#6
    .byte $00                               ; Rest
    .byte $33                               ; D#6
    .byte $33                               ; D#6
    .byte $35                               ; F6
    .byte $35                               ; F6
    .byte $35                               ; F6
    .byte $35                               ; F6
    .byte $35                               ; F6
    .byte $00                               ; Rest
    .byte $35                               ; F6
    .byte $35                               ; F6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2e                               ; A#5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2e                               ; A#5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2e                               ; A#5
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $8c                               ; Note length: 12
    .byte $30                               ; C6
    .byte $86                               ; Note length: 6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $86                               ; Note length: 6
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2c                               ; G#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $00                               ; Rest
    .byte $2e                               ; A#5
    .byte $2e                               ; A#5
    .byte $88                               ; Note length: 8
    .byte $30                               ; C6
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $34                               ; E6
    .byte $30                               ; C6
    .byte $30                               ; C6
    .byte $98                               ; Note length: 24
    .byte $30                               ; C6
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_ENDING [$PRG5::8f59]
;
MSCRIPT_ENDING_NOISE:                       ; [$addd]
    .byte $8c,$21,$86,$31,$31,$8c,$21,$86   ; [$addd] byte
    .byte $31,$31,$21,$21,$21,$21,$21,$21   ; [$ade5] byte
    .byte $21,$21                           ; [$aded] byte

    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$adf1] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$adf9] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$ae01] byte
    .byte $21,$86,$31,$31,$31,$00,$31,$31   ; [$ae09] byte
    .byte $8c,$21,$86,$31,$31,$31,$00,$31   ; [$ae11] byte
    .byte $31,$8c,$21,$86,$31,$31,$31,$00   ; [$ae19] byte
    .byte $31,$31,$8c,$21,$21,$21,$21,$21   ; [$ae21] byte
    .byte $21,$86,$31,$00,$8c,$21,$21,$86   ; [$ae29] byte
    .byte $21,$21                           ; [$ae31] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$ae36] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$ae3e] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$ae46] byte
    .byte $21,$86,$31,$31,$31,$00,$31,$31   ; [$ae4e] byte
    .byte $8c,$21,$86,$31,$31,$31,$00,$31   ; [$ae56] byte
    .byte $31,$8c,$21,$86,$31,$31,$31,$00   ; [$ae5e] byte
    .byte $31,$31,$8c,$21,$86,$31,$31,$31   ; [$ae66] byte
    .byte $00,$31,$31,$8c,$21,$86,$31,$31   ; [$ae6e] byte
    .byte $31,$00,$31,$31,$21,$21,$21,$31   ; [$ae76] byte
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$ae81] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$ae89] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$ae91] byte
    .byte $21,$86,$31,$31,$31,$00,$31,$31   ; [$ae99] byte
    .byte $8c,$21,$86,$31,$31               ; [$aea1] byte

    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $01                               ;  '- 1 loop
    .byte $86,$31,$00,$31,$31,$8c,$21,$86   ; [$aea8] byte
    .byte $31,$31,$31,$00,$31,$31,$8c,$21   ; [$aeb0] byte
    .byte $86,$31,$31,$31,$00,$31,$31,$8c   ; [$aeb8] byte
    .byte $21,$86,$31,$31,$31,$00,$8c,$21   ; [$aec0] byte
    .byte $86,$21,$21,$21,$31               ; [$aec8] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS   ; Op: Next loop if looped N times
    .byte $02                               ;  '- 2 loops
    .byte $8c,$21,$21,$21,$21,$86,$31,$00   ; [$aed0] byte
    .byte $8c,$21,$21,$86,$21,$21,$8c,$21   ; [$aed8] byte
    .byte $21,$21,$21,$00,$21,$21,$21       ; [$aee0] byte

    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $86,$31,$00,$31,$31,$31,$00,$31   ; [$aee9] byte
    .byte $31,$31,$00,$31,$31,$31,$00,$31   ; [$aef1] byte
    .byte $31                               ; [$aef9] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte $86,$31,$00,$31,$31,$31,$00,$31   ; [$aefb] byte
    .byte $31,$31,$00,$31,$31,$86,$21,$00   ; [$af03] byte
    .byte $21,$21,$88,$21,$00,$84,$21,$21   ; [$af0b] byte
    .byte $21,$21,$88,$21,$21,$21,$21,$98   ; [$af13] byte
    .byte $21,$88,$00                       ; [$af1b] byte

    .byte MSCRIPT_OP_END                    ; Op: End
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Music for the King's room.
;
; XREFS:
;     MSCRIPTS_KINGS_ROOM [$PRG5::8f5b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_KINGS_ROOM [$PRG5::8f5b]
;
MSCRIPT_KINGS_ROOM_SQ1:                     ; [$af20]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $00                               ;  '- Reduce volume by 0
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $b0                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $30                               ; C4
    .byte $37                               ; G4
    .byte $c0                               ; Note length: 64
    .byte $37                               ; G4
    .byte $90                               ; Note length: 16
    .byte $35                               ; F4
    .byte $34                               ; E4
    .byte $e0                               ; Note length: 96
    .byte $35                               ; F4
    .byte $c0                               ; Note length: 64
    .byte $35                               ; F4
    .byte $90                               ; Note length: 16
    .byte $34                               ; E4
    .byte $32                               ; D4
    .byte $b0                               ; Note length: 48
    .byte $34                               ; E4
    .byte $30                               ; C4
    .byte $c0                               ; Note length: 64
    .byte $34                               ; E4
    .byte $90                               ; Note length: 16
    .byte $2d                               ; A3
    .byte $30                               ; C4
    .byte $b0                               ; Note length: 48
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_KINGS_ROOM [$PRG5::8f5d]
;
MSCRIPT_KINGS_ROOM_SQ2:                     ; [$af49]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $b0                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $b0                               ; Note length: 48
    .byte $28                               ; E3
    .byte $28                               ; E3
    .byte $28                               ; E3
    .byte $34                               ; E4
    .byte $c0                               ; Note length: 64
    .byte $2e                               ; A#3
    .byte $90                               ; Note length: 16
    .byte $30                               ; C4
    .byte $2e                               ; A#3
    .byte $e0                               ; Note length: 96
    .byte $2d                               ; A3
    .byte $c0                               ; Note length: 64
    .byte $2c                               ; G#3
    .byte $90                               ; Note length: 16
    .byte $30                               ; C4
    .byte $2c                               ; G#3
    .byte $b0                               ; Note length: 48
    .byte $2b                               ; G3
    .byte $28                               ; E3
    .byte $c0                               ; Note length: 64
    .byte $2a                               ; F#3
    .byte $90                               ; Note length: 16
    .byte $26                               ; D3
    .byte $2a                               ; F#3
    .byte $b0                               ; Note length: 48
    .byte $29                               ; F3
    .byte $26                               ; D3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_KINGS_ROOM [$PRG5::8f5f]
;
MSCRIPT_KINGS_ROOM_TRI:                     ; [$af72]
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $24                               ; C5
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $1d                               ; F4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte $1f                               ; G4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_KINGS_ROOM [$PRG5::8f61]
;
MSCRIPT_KINGS_ROOM_NOISE:                   ; [$afaa]
    .byte $ff,$ff                           ; [$afaa] byte


;============================================================================
; Music for the temples.
;
; XREFS:
;     MSCRIPTS_TEMPLE [$PRG5::8f63]
;============================================================================

;
; XREFS:
;     MSCRIPTS_TEMPLE [$PRG5::8f63]
;
MSCRIPT_TEMPLE_SQ1:                         ; [$afac]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $b0                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $ac                               ; Note length: 44
    .byte $00                               ; Rest
    .byte $32                               ; D4
    .byte $d8                               ; Note length: 88
    .byte $37                               ; G4
    .byte $c2                               ; Note length: 66
    .byte $37                               ; G4
    .byte $8b                               ; Note length: 11
    .byte $36                               ; F#4
    .byte $34                               ; E4
    .byte $d8                               ; Note length: 88
    .byte $36                               ; F#4
    .byte $ac                               ; Note length: 44
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $d8                               ; Note length: 88
    .byte $3e                               ; D5
    .byte $c2                               ; Note length: 66
    .byte $3e                               ; D5
    .byte $8b                               ; Note length: 11
    .byte $3c                               ; C5
    .byte $3b                               ; B4
    .byte $ac                               ; Note length: 44
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $c2                               ; Note length: 66
    .byte $37                               ; G4
    .byte $96                               ; Note length: 22
    .byte $36                               ; F#4
    .byte $d8                               ; Note length: 88
    .byte $36                               ; F#4
    .byte $ac                               ; Note length: 44
    .byte $00                               ; Rest
    .byte $32                               ; D4
    .byte $d8                               ; Note length: 88
    .byte $37                               ; G4
    .byte $c2                               ; Note length: 66
    .byte $37                               ; G4
    .byte $8b                               ; Note length: 11
    .byte $36                               ; F#4
    .byte $34                               ; E4
    .byte $d8                               ; Note length: 88
    .byte $36                               ; F#4
    .byte $ac                               ; Note length: 44
    .byte $00                               ; Rest
    .byte $32                               ; D4
    .byte $37                               ; G4
    .byte $3b                               ; B4
    .byte $c2                               ; Note length: 66
    .byte $3e                               ; D5
    .byte $96                               ; Note length: 22
    .byte $40                               ; E5
    .byte $c2                               ; Note length: 66
    .byte $34                               ; E4
    .byte $96                               ; Note length: 22
    .byte $39                               ; A4
    .byte $ac                               ; Note length: 44
    .byte $37                               ; G4
    .byte $96                               ; Note length: 22
    .byte $36                               ; F#4
    .byte $34                               ; E4
    .byte $8b                               ; Note length: 11
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte $37                               ; G4
    .byte $88                               ; Note length: 8
    .byte $36                               ; F#4
    .byte $87                               ; Note length: 7
    .byte $37                               ; G4
    .byte $87                               ; Note length: 7
    .byte $36                               ; F#4
    .byte $8b                               ; Note length: 11
    .byte $34                               ; E4
    .byte $36                               ; F#4
    .byte $d8                               ; Note length: 88
    .byte $37                               ; G4
    .byte $36                               ; F#4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TEMPLE [$PRG5::8f65]
;
MSCRIPT_TEMPLE_SQ2:                         ; [$b007]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $b0                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $b0                               ;  '- 176 ticks
    .byte $2f                               ; B3
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $84                               ;  '- 132 ticks
    .byte $30                               ; C4
    .byte $ac                               ; Note length: 44
    .byte $30                               ; C4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $b0                               ;  '- 176 ticks
    .byte $32                               ; D4
    .byte $d8                               ; Note length: 88
    .byte $34                               ; E4
    .byte $34                               ; E4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $84                               ;  '- 132 ticks
    .byte $30                               ; C4
    .byte $96                               ; Note length: 22
    .byte $32                               ; D4
    .byte $30                               ; C4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $b0                               ;  '- 176 ticks
    .byte $2f                               ; B3
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $84                               ;  '- 132 ticks
    .byte $30                               ; C4
    .byte $ac                               ; Note length: 44
    .byte $30                               ; C4
    .byte $d8                               ; Note length: 88
    .byte $2f                               ; B3
    .byte $ac                               ; Note length: 44
    .byte $32                               ; D4
    .byte $37                               ; G4
    .byte $c2                               ; Note length: 66
    .byte $37                               ; G4
    .byte $96                               ; Note length: 22
    .byte $3c                               ; C5
    .byte $c2                               ; Note length: 66
    .byte $30                               ; C4
    .byte $96                               ; Note length: 22
    .byte $34                               ; E4
    .byte $d8                               ; Note length: 88
    .byte $30                               ; C4
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $30                               ; C4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TEMPLE [$PRG5::8f67]
;
MSCRIPT_TEMPLE_TRI:                         ; [$b042]
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $e8                               ;  '- Down 2 octaves
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $84                               ;  '- 132 ticks
    .byte $1f                               ; G4
    .byte $ac                               ; Note length: 44
    .byte $1f                               ; G4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $b0                               ;  '- 176 ticks
    .byte $21                               ; A4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $84                               ;  '- 132 ticks
    .byte $23                               ; B4
    .byte $ac                               ; Note length: 44
    .byte $23                               ; B4
    .byte $d8                               ; Note length: 88
    .byte $24                               ; C5
    .byte $25                               ; C#5
    .byte $26                               ; D5
    .byte $26                               ; D5
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $84                               ;  '- 132 ticks
    .byte $1f                               ; G4
    .byte $ac                               ; Note length: 44
    .byte $1f                               ; G4
    .byte MSCRIPT_OP_SET_NOTE_DURATION      ; Op: Set note duration
    .byte $b0                               ;  '- 176 ticks
    .byte $21                               ; A4
    .byte $d8                               ; Note length: 88
    .byte $23                               ; B4
    .byte $23                               ; B4
    .byte $c2                               ; Note length: 66
    .byte $34                               ; E6
    .byte $96                               ; Note length: 22
    .byte $37                               ; G6
    .byte $c2                               ; Note length: 66
    .byte $2d                               ; A5
    .byte $96                               ; Note length: 22
    .byte $30                               ; C6
    .byte $d8                               ; Note length: 88
    .byte $26                               ; D5
    .byte $26                               ; D5
    .byte $1f                               ; G4
    .byte $26                               ; D5
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_TEMPLE [$PRG5::8f69]
;
MSCRIPT_TEMPLE_NOISE:                       ; [$b073]
    .byte $ff,$ff                           ; [$b073] byte


;============================================================================
; Music for the shops.
;
; XREFS:
;     MSCRIPTS_SHOP [$PRG5::8f6b]
;============================================================================

;
; XREFS:
;     MSCRIPTS_SHOP [$PRG5::8f6b]
;
MSCRIPT_SHOP_SQ1:                           ; [$b075]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8e                               ; Note length: 14
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $24                               ; C3
    .byte $25                               ; C#3
    .byte $26                               ; D3
    .byte $1f                               ; G2
    .byte $20                               ; G#2
    .byte $21                               ; A2
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8e                               ; Note length: 14
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $87                               ; Note length: 7
    .byte $30                               ; C4
    .byte $2f                               ; B3
    .byte $8e                               ; Note length: 14
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte $2b                               ; G3
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_SHOP [$PRG5::8f6d]
;
MSCRIPT_SHOP_SQ2:                           ; [$b0b8]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $01                               ;  '- Mode 1: Curve but held
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8e                               ; Note length: 14
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $1f                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C2
    .byte $19                               ; C#2
    .byte $1a                               ; D2
    .byte $13                               ; A9
    .byte $14                               ; A9
    .byte $15                               ; A9
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8e                               ; Note length: 14
    .byte $24                               ; C3
    .byte $00                               ; Rest
    .byte $24                               ; C3
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $87                               ; Note length: 7
    .byte $2b                               ; G3
    .byte $2a                               ; F#3
    .byte $8e                               ; Note length: 14
    .byte $24                               ; C3
    .byte $00                               ; Rest
    .byte $24                               ; C3
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_SHOP [$PRG5::8f6f]
;
MSCRIPT_SHOP_TRI:                           ; [$b0fb]
    .byte MSCRIPT_OP_SET_CHANNEL_TRANSPOSE  ; Op: Set channel transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8e                               ; Note length: 14
    .byte $35                               ; F6
    .byte $00                               ; Rest
    .byte $32                               ; D6
    .byte $37                               ; G6
    .byte $3c                               ; C7
    .byte $00                               ; Rest
    .byte $3b                               ; B6
    .byte $32                               ; D6
    .byte $00                               ; Rest
    .byte $35                               ; F6
    .byte $32                               ; D6
    .byte $37                               ; G6
    .byte $3c                               ; C7
    .byte $3b                               ; B6
    .byte $32                               ; D6
    .byte $00                               ; Rest
    .byte $35                               ; F6
    .byte $00                               ; Rest
    .byte $32                               ; D6
    .byte $37                               ; G6
    .byte $3c                               ; C7
    .byte $00                               ; Rest
    .byte $3b                               ; B6
    .byte $32                               ; D6
    .byte $00                               ; Rest
    .byte $30                               ; C6
    .byte $31                               ; C#6
    .byte $32                               ; D6
    .byte $2b                               ; G5
    .byte $2c                               ; G#5
    .byte $2d                               ; A5
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $8e                               ; Note length: 14
    .byte $26                               ; D5
    .byte $00                               ; Rest
    .byte $26                               ; D5
    .byte $26                               ; D5
    .byte $87                               ; Note length: 7
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte $8e                               ; Note length: 14
    .byte $26                               ; D5
    .byte $00                               ; Rest
    .byte $26                               ; D5
    .byte $26                               ; D5
    .byte $87                               ; Note length: 7
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $00                               ; Rest
    .byte $1a                               ; D4
    .byte $1a                               ; D4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_SHOP [$PRG5::8f71]
;
MSCRIPT_SHOP_NOISE:                         ; [$b142]
    .byte $ff,$ff                           ; [$b142] undefined


;============================================================================
; Music for the Evil Fortress.
;
; XREFS:
;     MSCRIPTS_EVIL_FORTRESS [$PRG5::8f73]
;============================================================================

;
; XREFS:
;     MSCRIPTS_EVIL_FORTRESS [$PRG5::8f73]
;
MSCRIPT_EVIL_FORTRESS_SQ1:                  ; [$b144]
    .byte MSCRIPT_OP_SET_GLOBAL_TRANSPOSE   ; Op: Set global transpose
    .byte $f4                               ;  '- Down 1 octave
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $02                               ;  '- Reduce volume by 2
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $d0                               ;  '- Duty cycle 3     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $3c                               ; C4
    .byte $37                               ; G3
    .byte $32                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $3a                               ; A#3
    .byte $35                               ; F3
    .byte $30                               ; C3
    .byte $2b                               ; G2
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $3c                               ; C4
    .byte $37                               ; G3
    .byte $98                               ; Note length: 24
    .byte $32                               ; D3
    .byte $88                               ; Note length: 8
    .byte $37                               ; G3
    .byte $32                               ; D3
    .byte $00                               ; Rest
    .byte $3a                               ; A#3
    .byte $35                               ; F3
    .byte $90                               ; Note length: 16
    .byte $30                               ; C3
    .byte $88                               ; Note length: 8
    .byte $35                               ; F3
    .byte $30                               ; C3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $39                               ; A3
    .byte $39                               ; A3
    .byte $39                               ; A3
    .byte $39                               ; A3
    .byte $90                               ; Note length: 16
    .byte $37                               ; G3
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $39                               ; A3
    .byte $39                               ; A3
    .byte $39                               ; A3
    .byte $39                               ; A3
    .byte $90                               ; Note length: 16
    .byte $37                               ; G3
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $32                               ; D3
    .byte $37                               ; G3
    .byte $37                               ; G3
    .byte $3c                               ; C4
    .byte $3c                               ; C4
    .byte $41                               ; F4
    .byte $41                               ; F4
    .byte $3c                               ; C4
    .byte $3c                               ; C4
    .byte $37                               ; G3
    .byte $a0                               ; Note length: 32
    .byte $39                               ; A3
    .byte $37                               ; G3
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $2c                               ; G#2
    .byte $2e                               ; A#2
    .byte $88                               ; Note length: 8
    .byte $37                               ; G3
    .byte $37                               ; G3
    .byte $37                               ; G3
    .byte $38                               ; G#3
    .byte $00                               ; Rest
    .byte $38                               ; G#3
    .byte $00                               ; Rest
    .byte $38                               ; G#3
    .byte $3a                               ; A#3
    .byte $3a                               ; A#3
    .byte $3a                               ; A#3
    .byte $38                               ; G#3
    .byte $00                               ; Rest
    .byte $38                               ; G#3
    .byte $00                               ; Rest
    .byte $38                               ; G#3
    .byte $a0                               ; Note length: 32
    .byte $37                               ; G3
    .byte $35                               ; F3
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $98                               ; Note length: 24
    .byte $35                               ; F3
    .byte $39                               ; A3
    .byte $90                               ; Note length: 16
    .byte $3c                               ; C4
    .byte $a0                               ; Note length: 32
    .byte $3b                               ; B3
    .byte $39                               ; A3
    .byte $98                               ; Note length: 24
    .byte $3c                               ; C4
    .byte $40                               ; E4
    .byte $90                               ; Note length: 16
    .byte $39                               ; A3
    .byte $a0                               ; Note length: 32
    .byte $3e                               ; D4
    .byte $88                               ; Note length: 8
    .byte $3b                               ; B3
    .byte $39                               ; A3
    .byte $37                               ; G3
    .byte $36                               ; F#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_EVIL_FORTRESS [$PRG5::8f75]
;
MSCRIPT_EVIL_FORTRESS_SQ2:                  ; [$b1cc]
    .byte MSCRIPT_OP_SET_SQ_FADE            ; Op: Set SQ fade
    .byte $04                               ;  '- Reduce volume by 4
    .byte MSCRIPT_OP_SET_SQ_ENVELOPE_MODE   ; Op: Set envelope mode
    .byte $00                               ;  '- Mode 0: Linear decay
    .byte MSCRIPT_OP_SET_SQ_CONTROL_BITS    ; Op: Set SQ control bits
    .byte $90                               ;  '- Duty cycle 2     Constant
                                            ; volume/envelope
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $26                               ; D3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte $98                               ; Note length: 24
    .byte $2d                               ; A3
    .byte $88                               ; Note length: 8
    .byte $32                               ; D4
    .byte $2d                               ; A3
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $30                               ; C4
    .byte $90                               ; Note length: 16
    .byte $2b                               ; G3
    .byte $88                               ; Note length: 8
    .byte $30                               ; C4
    .byte $2b                               ; G3
    .byte $00                               ; Rest
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $90                               ; Note length: 16
    .byte $32                               ; D4
    .byte $00                               ; Rest
    .byte $b0                               ; Note length: 48
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $35                               ; F4
    .byte $90                               ; Note length: 16
    .byte $32                               ; D4
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $2d                               ; A3
    .byte $32                               ; D4
    .byte $32                               ; D4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $3c                               ; C5
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $32                               ; D4
    .byte $a0                               ; Note length: 32
    .byte $35                               ; F4
    .byte $33                               ; D#4
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $29                               ; F3
    .byte $2c                               ; G#3
    .byte $88                               ; Note length: 8
    .byte $33                               ; D#4
    .byte $33                               ; D#4
    .byte $33                               ; D#4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $00                               ; Rest
    .byte $35                               ; F4
    .byte $a0                               ; Note length: 32
    .byte $33                               ; D#4
    .byte $31                               ; C#4
    .byte $c0                               ; Note length: 64
    .byte $00                               ; Rest
    .byte $fc                               ; Op: End loop
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $90                               ; Note length: 16
    .byte $3c                               ; C5
    .byte $a0                               ; Note length: 32
    .byte $3b                               ; B4
    .byte $a0                               ; Note length: 32
    .byte $39                               ; A4
    .byte $98                               ; Note length: 24
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $90                               ; Note length: 16
    .byte $39                               ; A4
    .byte $9c                               ; Note length: 28
    .byte $3e                               ; D5
    .byte $88                               ; Note length: 8
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $84                               ; Note length: 4
    .byte $36                               ; F#4
    .byte $88                               ; Note length: 8
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $37                               ; G4
    .byte $3b                               ; B4
    .byte $37                               ; G4
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $35                               ; F4
    .byte $32                               ; D4
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $39                               ; A4
    .byte $3c                               ; C5
    .byte $40                               ; E5
    .byte $3c                               ; C5
    .byte $35                               ; F4
    .byte $39                               ; A4
    .byte $3b                               ; B4
    .byte $3e                               ; D5
    .byte $3b                               ; B4
    .byte $8c                               ; Note length: 12
    .byte $37                               ; G4
    .byte $88                               ; Note length: 8
    .byte $3b                               ; B4
    .byte $39                               ; A4
    .byte $37                               ; G4
    .byte $84                               ; Note length: 4
    .byte $36                               ; F#4
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_EVIL_FORTRESS [$PRG5::8f77]
;
MSCRIPT_EVIL_FORTRESS_TRI:                  ; [$b277]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $90                               ; Note length: 16
    .byte $18                               ; C4
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $18                               ; C4
    .byte $18                               ; C4
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $18                               ; C4
    .byte $00                               ; Rest
    .byte $0c                               ; C3
    .byte $18                               ; C4
    .byte $0c                               ; C3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88                               ; Note length: 8
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1d                               ; F4
    .byte $1f                               ; G4
    .byte $00                               ; Rest
    .byte $1f                               ; G4
    .byte $1d                               ; F4
    .byte $1a                               ; D4
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $1d                               ; F4
    .byte $1f                               ; G4
    .byte $11                               ; F3
    .byte $12                               ; F#3
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $11                               ; F3
    .byte $13                               ; G3
    .byte $90                               ; Note length: 16
    .byte $21                               ; A4
    .byte $26                               ; D5
    .byte $26                               ; D5
    .byte $2b                               ; G5
    .byte $2b                               ; G5
    .byte $26                               ; D5
    .byte $26                               ; D5
    .byte $21                               ; A4
    .byte $a0                               ; Note length: 32
    .byte $13                               ; G3
    .byte $90                               ; Note length: 16
    .byte $11                               ; F3
    .byte $88                               ; Note length: 8
    .byte $1d                               ; F4
    .byte $11                               ; F3
    .byte $a0                               ; Note length: 32
    .byte $00                               ; Rest
    .byte $98                               ; Note length: 24
    .byte $22                               ; A#4
    .byte $88                               ; Note length: 8
    .byte $16                               ; A#3
    .byte $22                               ; A#4
    .byte $16                               ; A#3
    .byte $22                               ; A#4
    .byte $22                               ; A#4
    .byte $00                               ; Rest
    .byte $22                               ; A#4
    .byte $16                               ; A#3
    .byte $22                               ; A#4
    .byte $22                               ; A#4
    .byte $16                               ; A#3
    .byte $22                               ; A#4
    .byte $22                               ; A#4
    .byte $00                               ; Rest
    .byte $22                               ; A#4
    .byte $16                               ; A#3
    .byte $22                               ; A#4
    .byte $a0                               ; Note length: 32
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $98                               ; Note length: 24
    .byte $00                               ; Rest
    .byte $88                               ; Note length: 8
    .byte $16                               ; A#3
    .byte $16                               ; A#3
    .byte $15                               ; A3
    .byte $14                               ; G#3
    .byte $12                               ; F#3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $00                               ; Rest
    .byte $00                               ; Rest
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte $90                               ; Note length: 16
    .byte $13                               ; G3
    .byte $88                               ; Note length: 8
    .byte $1f                               ; G4
    .byte $13                               ; G3
    .byte $1f                               ; G4
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End

;
; XREFS:
;     MSCRIPTS_EVIL_FORTRESS [$PRG5::8f79]
;
MSCRIPT_EVIL_FORTRESS_NOISE:                ; [$b321]
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $04                               ;  '- 4 iterations
    .byte $88,$21,$31,$31,$21,$31,$31,$21   ; [$b323] byte
    .byte $31,$21,$31,$31,$21,$31,$31,$21   ; [$b32b] byte
    .byte $31                               ; [$b333] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88,$21,$21,$21,$21,$21,$00,$31   ; [$b337] byte
    .byte $31,$31,$31,$31,$31,$21,$00,$00   ; [$b33f] byte
    .byte $21,$11,$11,$11,$00,$85,$31,$31   ; [$b347] byte
    .byte $86,$31,$88,$31,$31,$31,$31,$21   ; [$b34f] byte
    .byte $00,$21,$00,$21,$21,$31,$00,$31   ; [$b357] byte
    .byte $00,$31,$31,$21,$00,$31,$00,$31   ; [$b35f] byte
    .byte $31,$31,$31,$21,$21,$31,$00,$31   ; [$b367] byte
    .byte $00,$31,$00,$31,$00,$85,$31,$31   ; [$b36f] byte
    .byte $86,$31,$88,$31,$31,$21,$21,$31   ; [$b377] byte
    .byte $00,$31,$31,$31,$31,$21,$31,$31   ; [$b37f] byte
    .byte $31,$31,$31,$31,$31,$21,$31,$31   ; [$b387] byte
    .byte $31,$a0,$00,$88,$21,$21,$21,$21   ; [$b38f] byte
    .byte $85,$31,$31,$86,$31,$88,$31,$31   ; [$b397] byte
    .byte $85,$31,$31,$86,$31,$88,$21,$21   ; [$b39f] byte
    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88,$31,$00,$00,$31,$00,$00,$31   ; [$b3aa] byte
    .byte $00,$31,$00,$00,$31,$00,$00,$31   ; [$b3b2] byte
    .byte $31                               ; [$b3ba] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_BEGIN_LOOP             ; Op: Begin loop
    .byte $02                               ;  '- 2 iterations
    .byte $88,$31,$11,$11,$31,$11,$11,$31   ; [$b3be] byte
    .byte $11,$31,$11,$11,$31,$11,$11,$31   ; [$b3c6] byte
    .byte $31                               ; [$b3ce] byte

    .byte MSCRIPT_OP_END_LOOP               ; Op: End loop
    .byte MSCRIPT_OP_RESTART_CHANNEL        ; Op: Restart channel
    .byte MSCRIPT_OP_END                    ; Op: End


;============================================================================
; Post-MScript data.
;
; At first glance, this appears to be structured data.
; 4 words in a sequence, each with 0xFF00 as the trailing
; value.
;
; There are exceptions to this, though:
;
;   Address | Value
;   --------+------
;   $B878   | F700
;   $B8D0   | F700
;   $BAE0   | DF00
;   $BBF8   | FF20
;   $BD10   | FF01
;   $BE10   | 7F00
;   $BF08   | EF00
;
; If we do assume group of 4 words, though, there are a
; few observations:
;
; 1. Words 1, 2, and 4 usually start with 0xFF.
; 2. Word 3 may be anything.
; 3. 0xFF00 is usually the 4th byte, but as shown above,
;    not always.
;
; I've checked the music engines for various Hudson Soft
; games during, shortly before, and shortly after this
; era, and couldn't find anything matching this. The music
; engines generally match the MScripts here (though
; Faxanadu's is more complex).
;
; It's possible this was floating point data or something
; for SQ envelope curves, but left out.
;
; In any case, this data seems unused by the shipped game.
;============================================================================
    .word $ffa7,$ff75,$6157,$ff00           ; [$b3d2] ushort
    .word $ffe9,$fff8,$fead,$ff00           ; [$b3da] ushort
    .word $ff23,$fffd,$ed29,$ff00           ; [$b3e2] ushort
    .word $ff7c,$ff3a,$4cba,$ff00           ; [$b3ea] ushort
    .word $ff37,$ff7b,$324c,$ff00           ; [$b3f2] ushort
    .word $ff48,$ffbe,$d63a,$ff00           ; [$b3fa] ushort
    .word $ff82,$ff53,$fb4e,$ff00           ; [$b402] ushort
    .word $ff84,$fff8,$ebd8,$ff00           ; [$b40a] ushort
    .word $ff74,$ffef,$dbbd,$ff00           ; [$b412] ushort
    .word $ff39,$ffff,$97ee,$ff00           ; [$b41a] ushort
    .word $ff0a,$ffc6,$ffc5,$ff00           ; [$b422] ushort
    .word $ff02,$ff7d,$f174,$ff00           ; [$b42a] ushort
    .word $ff3e,$ff93,$7bb1,$ff00           ; [$b432] ushort
    .word $ffc6,$ff5d,$73ff,$ff00           ; [$b43a] ushort
    .word $ff84,$ff11,$bfe4,$ff00           ; [$b442] ushort
    .word $ff3c,$ffb3,$7d3f,$ff00           ; [$b44a] ushort
    .word $ff8a,$ff5e,$7fc3,$ff00           ; [$b452] ushort
    .word $ffcc,$ffde,$f83f,$ff00           ; [$b45a] ushort
    .word $ff45,$ffd3,$77ee,$ff00           ; [$b462] ushort
    .word $ff80,$ff85,$7e79,$ff00           ; [$b46a] ushort
    .word $ff95,$ff62,$2f73,$ff00           ; [$b472] ushort
    .word $fff3,$ffff,$ff0c,$ff00           ; [$b47a] ushort
    .word $ff95,$ff82,$7fab,$ff00           ; [$b482] ushort
    .word $ffc0,$ff5a,$9701,$ff00           ; [$b48a] ushort
    .word $ff12,$ff5d,$f3aa,$ff00           ; [$b492] ushort
    .word $fff0,$ff18,$f9f3,$ff00           ; [$b49a] ushort
    .word $ff00,$ff3e,$cb6a,$ff00           ; [$b4a2] ushort
    .word $ff57,$ffbb,$fe78,$ff00           ; [$b4aa] ushort
    .word $ffa7,$ff23,$80d2,$ff00           ; [$b4b2] ushort
    .word $ffa5,$ff6e,$b62f,$ff00           ; [$b4ba] ushort
    .word $ff50,$ff66,$7520,$ff00           ; [$b4c2] ushort
    .word $ff55,$fff7,$ed5b,$ff00           ; [$b4ca] ushort
    .word $ff60,$ffe8,$9e78,$ff00           ; [$b4d2] ushort
    .word $ffd9,$ff13,$ffbd,$ff00           ; [$b4da] ushort
    .word $ffec,$ff0b,$fd26,$ff00           ; [$b4e2] ushort
    .word $ffe2,$ff58,$7736,$ff00           ; [$b4ea] ushort
    .word $ff40,$ffb6,$ff02,$ff00           ; [$b4f2] ushort
    .word $fff9,$ffdf,$58b0,$ff00           ; [$b4fa] ushort
    .word $ffb4,$ff9e,$fbaa,$ff00           ; [$b502] ushort
    .word $ff84,$ff9a,$ff9f,$ff00           ; [$b50a] ushort
    .word $ff34,$ffd3,$9f32,$ff00           ; [$b512] ushort
    .word $ff4a,$ff57,$6d6f,$ff00           ; [$b51a] ushort
    .word $ff2a,$ff64,$ddfe,$ff00           ; [$b522] ushort
    .word $ff94,$ffd1,$efbb,$ff00           ; [$b52a] ushort
    .word $ff2c,$ff5f,$bfcb,$ff00           ; [$b532] ushort
    .word $ffe7,$ff7c,$7df3,$ff00           ; [$b53a] ushort
    .word $ff90,$ff51,$ec33,$ff00           ; [$b542] ushort
    .word $ff59,$ffa4,$7f72,$ff00           ; [$b54a] ushort
    .word $ff1a,$ff0f,$afc5,$ff00           ; [$b552] ushort
    .word $ff2f,$ffe9,$3015,$ff00           ; [$b55a] ushort
    .word $ff03,$ff06,$bf13,$ff00           ; [$b562] ushort
    .word $ff0b,$fffb,$fee2,$ff00           ; [$b56a] ushort
    .word $ffd5,$ffc7,$9f69,$ff00           ; [$b572] ushort
    .word $ff32,$ff76,$06fc,$ff00           ; [$b57a] ushort
    .word $ff14,$ff3c,$0f6f,$ff00           ; [$b582] ushort
    .word $ffad,$ffea,$afdb,$ff00           ; [$b58a] ushort
    .word $ff27,$ffee,$4cf9,$ff00           ; [$b592] ushort
    .word $ff23,$ff5d,$fe57,$ff00           ; [$b59a] ushort
    .word $ff04,$ffb1,$f7e2,$ff00           ; [$b5a2] ushort
    .word $ffa4,$ff53,$fffa,$ff00           ; [$b5aa] ushort
    .word $ff2c,$ff5f,$8cfd,$ff00           ; [$b5b2] ushort
    .word $ff7d,$ff77,$52e8,$ff00           ; [$b5ba] ushort
    .word $ff00,$ff83,$bf35,$ff00           ; [$b5c2] ushort
    .word $ff58,$ffd7,$d7ef,$ff00           ; [$b5ca] ushort
    .word $ff60,$fff8,$ded1,$ff00           ; [$b5d2] ushort
    .word $ff94,$fff3,$cfea,$ff00           ; [$b5da] ushort
    .word $ff08,$ff48,$fb7b,$ff00           ; [$b5e2] ushort
    .word $ff33,$ffd6,$837f,$ff00           ; [$b5ea] ushort
    .word $ff71,$ff4e,$ff45,$ff00           ; [$b5f2] ushort
    .word $fffc,$ef97,$3ef6,$ff00           ; [$b5fa] ushort
    .word $ff40,$ff05,$ff4b,$ff00           ; [$b602] ushort
    .word $ff04,$ff72,$ff69,$ff00           ; [$b60a] ushort
    .word $ff12,$ffc8,$efe9,$ff00           ; [$b612] ushort
    .word $ffd8,$ffdf,$03af,$ff00           ; [$b61a] ushort
    .word $ff27,$ff2c,$ff11,$ff00           ; [$b622] ushort
    .word $ff94,$ff22,$fff2,$ff00           ; [$b62a] ushort
    .word $ffe4,$ffbd,$92f7,$ff00           ; [$b632] ushort
    .word $ff26,$ffff,$65a7,$ff00           ; [$b63a] ushort
    .word $ff61,$ffa8,$beb0,$ff00           ; [$b642] ushort
    .word $ff0d,$ffa2,$a351,$ff00           ; [$b64a] ushort
    .word $fff0,$ffc4,$ae04,$ff00           ; [$b652] ushort
    .word $ff3b,$ff7f,$cf3b,$ff00           ; [$b65a] ushort
    .word $ff01,$ff56,$ff61,$ff00           ; [$b662] ushort
    .word $ff8d,$fffb,$f781,$ff00           ; [$b66a] ushort
    .word $ff12,$ffcb,$df73,$ff00           ; [$b672] ushort
    .word $ff71,$ffd9,$bfb7,$ff00           ; [$b67a] ushort
    .word $ff00,$ff59,$9779,$ff00           ; [$b682] ushort
    .word $ff42,$ff7d,$eab9,$ff00           ; [$b68a] ushort
    .word $ff70,$ffdb,$30fd,$ff00           ; [$b692] ushort
    .word $ff08,$ff67,$8e9f,$ff00           ; [$b69a] ushort
    .word $ff01,$ff1f,$7f27,$ff00           ; [$b6a2] ushort
    .word $ffc0,$ff27,$6f50,$ff00           ; [$b6aa] ushort
    .word $ff63,$ffbe,$cf40,$ff00           ; [$b6b2] ushort
    .word $ffc5,$ffda,$9f1f,$ff00           ; [$b6ba] ushort
    .word $ff28,$ffe5,$b7a3,$ff00           ; [$b6c2] ushort
    .word $ffc2,$ff19,$9f8b,$ff00           ; [$b6ca] ushort
    .word $ff44,$fff7,$efd5,$ff00           ; [$b6d2] ushort
    .word $ff2d,$ffad,$7fd5,$ff00           ; [$b6da] ushort
    .word $ff22,$ff3e,$5f75,$ff00           ; [$b6e2] ushort
    .word $ff01,$ffed,$df14,$ff00           ; [$b6ea] ushort
    .word $ff38,$ff7d,$d3fa,$ff00           ; [$b6f2] ushort
    .word $ff7c,$ffbd,$cede,$ff00           ; [$b6fa] ushort
    .word $ff3e,$ffe7,$e6e1,$ff00           ; [$b702] ushort
    .word $ff38,$ff3a,$f559,$ff00           ; [$b70a] ushort
    .word $ff05,$ef17,$5e75,$ff00           ; [$b712] ushort
    .word $ff6b,$fffd,$34de,$ff00           ; [$b71a] ushort
    .word $ff32,$ff5b,$f300,$ff00           ; [$b722] ushort
    .word $ff20,$ffda,$ff5e,$ff00           ; [$b72a] ushort
    .word $ff04,$ffe0,$f3c1,$ff00           ; [$b732] ushort
    .word $ff49,$ffb7,$ee9e,$ff00           ; [$b73a] ushort
    .word $ff72,$ff34,$d576,$ff00           ; [$b742] ushort
    .word $ff01,$ff69,$fe0d,$ff00           ; [$b74a] ushort
    .word $ffbb,$ff20,$7ee4,$ff00           ; [$b752] ushort
    .word $ff43,$ffb7,$187b,$ff00           ; [$b75a] ushort
    .word $ff61,$ff03,$ffe0,$ff00           ; [$b762] ushort
    .word $ff89,$fff5,$8f66,$ff00           ; [$b76a] ushort
    .word $fffe,$ffc7,$bffd,$ff00           ; [$b772] ushort
    .word $ff28,$ffeb,$ebaf,$ff00           ; [$b77a] ushort
    .word $ff04,$ff0a,$bfc1,$ff00           ; [$b782] ushort
    .word $ff50,$df21,$dbf4,$ff00           ; [$b78a] ushort
    .word $ffdc,$ff9e,$bdff,$ff00           ; [$b792] ushort
    .word $ff8b,$ffbe,$b5cd,$ff00           ; [$b79a] ushort
    .word $ff00,$ff39,$ff1c,$ff00           ; [$b7a2] ushort
    .word $ff08,$ff11,$bfb7,$ff00           ; [$b7aa] ushort
    .word $fff2,$ff77,$f7f4,$ff00           ; [$b7b2] ushort
    .word $ff64,$ff53,$b3ff,$ff00           ; [$b7ba] ushort
    .word $ff81,$ff55,$97cd,$ff00           ; [$b7c2] ushort
    .word $ff1e,$ff39,$fb68,$ff00           ; [$b7ca] ushort
    .word $ffa0,$fffd,$eeca,$ff00           ; [$b7d2] ushort
    .word $dfae,$fbf4,$6b7f,$ff00           ; [$b7da] ushort
    .word $ff44,$ff93,$7cf5,$ff00           ; [$b7e2] ushort
    .word $ff46,$ff04,$7ffd,$ff00           ; [$b7ea] ushort
    .word $ffe0,$df34,$fe7b,$ff00           ; [$b7f2] ushort
    .word $ff5a,$ffeb,$c119,$ff00           ; [$b7fa] ushort
    .word $ff31,$ffa4,$3d26,$ff00           ; [$b802] ushort
    .word $ffe0,$ffb0,$ffe3,$ff00           ; [$b80a] ushort
    .word $fffa,$ff71,$fef9,$ff00           ; [$b812] ushort
    .word $ff3b,$fffe,$decf,$ff00           ; [$b81a] ushort
    .word $ff16,$ffe5,$1dbc,$ff00           ; [$b822] ushort
    .word $ff05,$ff9e,$fbbb,$ff00           ; [$b82a] ushort
    .word $ffb0,$ffbb,$e79e,$ff00           ; [$b832] ushort
    .word $ff50,$ffbc,$a6cd,$ff00           ; [$b83a] ushort
    .word $ff3a,$ff02,$dee2,$ff00           ; [$b842] ushort
    .word $ff42,$ff3a,$33c5,$ff00           ; [$b84a] ushort
    .word $ffd2,$ff67,$7d5b,$ff00           ; [$b852] ushort
    .word $ff6e,$ffd9,$59fd,$ff00           ; [$b85a] ushort
    .word $ff80,$ff0c,$df02,$ff00           ; [$b862] ushort
    .word $ffa4,$ff9a,$ff93,$ff00           ; [$b86a] ushort
    .word $ff06,$ffa7,$df7e,$f700           ; [$b872] ushort
    .word $ff3d,$ff71,$4fee,$ff00           ; [$b87a] ushort
    .word $ff04,$ff10,$bbc8,$ff00           ; [$b882] ushort
    .word $ff12,$ff2f,$74f5,$ff00           ; [$b88a] ushort
    .word $ff30,$fff3,$555e,$ff00           ; [$b892] ushort
    .word $ffc2,$ffde,$b4b6,$ff00           ; [$b89a] ushort
    .word $ff81,$ff6a,$fdf7,$ff00           ; [$b8a2] ushort
    .word $ff93,$ff24,$b647,$ff00           ; [$b8aa] ushort
    .word $ff45,$ff6b,$3717,$ff00           ; [$b8b2] ushort
    .word $ff88,$ff76,$2f7f,$ff00           ; [$b8ba] ushort
    .word $ff00,$ffbe,$fd9a,$ff00           ; [$b8c2] ushort
    .word $ffb2,$ffdb,$afdc,$f700           ; [$b8ca] ushort
    .word $ffaa,$ff7e,$dfed,$ff00           ; [$b8d2] ushort
    .word $ff68,$ffed,$7cbb,$ff00           ; [$b8da] ushort
    .word $ff20,$ff12,$8b39,$ff00           ; [$b8e2] ushort
    .word $ff70,$ffe0,$9d1c,$ff00           ; [$b8ea] ushort
    .word $ff67,$fd83,$93f4,$ff00           ; [$b8f2] ushort
    .word $ff19,$ff79,$7fbf,$ff00           ; [$b8fa] ushort
    .word $ffa1,$ff3a,$f78a,$ff00           ; [$b902] ushort
    .word $ff84,$ff5e,$6bb5,$ff00           ; [$b90a] ushort
    .word $ffb0,$ff65,$f9d6,$ff00           ; [$b912] ushort
    .word $ff72,$ff7b,$8d74,$ff00           ; [$b91a] ushort
    .word $ff08,$ff0d,$bd5d,$ff00           ; [$b922] ushort
    .word $ff00,$ff82,$3f7a,$ff00           ; [$b92a] ushort
    .word $ffe2,$ffb2,$7ea4,$ff00           ; [$b932] ushort
    .word $ffe7,$fe95,$afb5,$ff00           ; [$b93a] ushort
    .word $ff80,$ff10,$f831,$ff00           ; [$b942] ushort
    .word $ff40,$ff6a,$ff7e,$ff00           ; [$b94a] ushort
    .word $ff45,$ff5d,$6721,$ff00           ; [$b952] ushort
    .word $ffc0,$ffaf,$e385,$ff00           ; [$b95a] ushort
    .word $ff00,$ff12,$cf97,$ff00           ; [$b962] ushort
    .word $ffb0,$ff63,$ceb8,$ff00           ; [$b96a] ushort
    .word $fffa,$ff3b,$e5a3,$ff00           ; [$b972] ushort
    .word $ff60,$ff5b,$7689,$ff00           ; [$b97a] ushort
    .word $ff80,$ff52,$7e52,$ff00           ; [$b982] ushort
    .word $ffa0,$ff1f,$d766,$ff00           ; [$b98a] ushort
    .word $ff76,$ff9d,$14f9,$ff00           ; [$b992] ushort
    .word $ffff,$ff2f,$52f7,$ff00           ; [$b99a] ushort
    .word $ff9c,$ff04,$ff76,$ff00           ; [$b9a2] ushort
    .word $ff94,$ff72,$4e7f,$ff00           ; [$b9aa] ushort
    .word $ffa7,$ffc7,$6d66,$ff00           ; [$b9b2] ushort
    .word $ff9d,$ff7f,$267c,$ff00           ; [$b9ba] ushort
    .word $ff26,$ffc7,$ff72,$ff00           ; [$b9c2] ushort
    .word $ff31,$ffb7,$e97e,$ff00           ; [$b9ca] ushort
    .word $ffbc,$ffde,$e4e7,$ff00           ; [$b9d2] ushort
    .word $ff7b,$fef2,$ebf3,$ff00           ; [$b9da] ushort
    .word $ffe8,$ff32,$f79d,$ff00           ; [$b9e2] ushort
    .word $ff80,$ff36,$ff9c,$ff00           ; [$b9ea] ushort
    .word $ff88,$ffeb,$a7eb,$ff00           ; [$b9f2] ushort
    .word $ff8f,$ff77,$79df,$ff00           ; [$b9fa] ushort
    .word $fffa,$ffa6,$ffcd,$ff00           ; [$ba02] ushort
    .word $ffa0,$ffb4,$eb52,$ff00           ; [$ba0a] ushort
    .word $ffdc,$ffbe,$6dc5,$ff00           ; [$ba12] ushort
    .word $ff63,$fffd,$42a2,$ff00           ; [$ba1a] ushort
    .word $ffa4,$ffc1,$fd88,$ff00           ; [$ba22] ushort
    .word $ff30,$ff6a,$7d92,$ff00           ; [$ba2a] ushort
    .word $ff70,$ffbb,$ff76,$ff00           ; [$ba32] ushort
    .word $ffb4,$fff5,$dcfe,$ff00           ; [$ba3a] ushort
    .word $ff80,$ff37,$e7a4,$ff00           ; [$ba42] ushort
    .word $ff40,$ff43,$f77d,$ff00           ; [$ba4a] ushort
    .word $ff12,$fff1,$df57,$ff00           ; [$ba52] ushort
    .word $ffd7,$ffc5,$e73b,$ff00           ; [$ba5a] ushort
    .word $ff6c,$ffde,$5a98,$ff00           ; [$ba62] ushort
    .word $ff82,$ff8e,$5e23,$ff00           ; [$ba6a] ushort
    .word $ff06,$ffbd,$6fa7,$ff00           ; [$ba72] ushort
    .word $ffbc,$ffeb,$0b55,$ff00           ; [$ba7a] ushort
    .word $ffa1,$ffcd,$d715,$ff00           ; [$ba82] ushort
    .word $ffa2,$ffca,$8f2b,$ff00           ; [$ba8a] ushort
    .word $ff6f,$fffe,$68db,$ff00           ; [$ba92] ushort
    .word $ffb8,$ffd7,$55df,$ff00           ; [$ba9a] ushort
    .word $ffb4,$ff06,$bfcd,$ff00           ; [$baa2] ushort
    .word $ffd0,$ff78,$ede6,$ff00           ; [$baaa] ushort
    .word $ffe4,$ffdd,$ceba,$ff00           ; [$bab2] ushort
    .word $ff4d,$ffdf,$95c5,$ff00           ; [$baba] ushort
    .word $ff2a,$ffed,$fe36,$ff00           ; [$bac2] ushort
    .word $ff00,$ffc3,$df7f,$ff00           ; [$baca] ushort
    .word $ff40,$fbf5,$ecb1,$ff00           ; [$bad2] ushort
    .word $ffd8,$ffdf,$bf7d,$df00           ; [$bada] ushort
    .word $ff04,$ffb5,$afe7,$ff00           ; [$bae2] ushort
    .word $ff00,$ff51,$d3ff,$ff00           ; [$baea] ushort
    .word $ff95,$ff74,$8fe4,$ff00           ; [$baf2] ushort
    .word $ffc1,$ff7f,$547f,$ff00           ; [$bafa] ushort
    .word $ff40,$ff0f,$3fd9,$ff00           ; [$bb02] ushort
    .word $ff44,$ff4d,$cfbf,$ff00           ; [$bb0a] ushort
    .word $ff32,$fff9,$f7ab,$ff00           ; [$bb12] ushort
    .word $fff1,$afdf,$027f,$ff00           ; [$bb1a] ushort
    .word $ff54,$ff23,$9f59,$ff00           ; [$bb22] ushort
    .word $ff07,$ffb1,$efa4,$ff00           ; [$bb2a] ushort
    .word $ff30,$ff66,$de6e,$ff00           ; [$bb32] ushort
    .word $ffe2,$ff6f,$bdfb,$ff00           ; [$bb3a] ushort
    .word $ff85,$ff27,$fb13,$ff00           ; [$bb42] ushort
    .word $ff08,$ff52,$bdde,$ff00           ; [$bb4a] ushort
    .word $ffbe,$ffbb,$b7ee,$ff00           ; [$bb52] ushort
    .word $ff23,$fff7,$ae7f,$ff00           ; [$bb5a] ushort
    .word $ff00,$ff8b,$ef31,$ff00           ; [$bb62] ushort
    .word $ffc1,$ff80,$7f9b,$ff00           ; [$bb6a] ushort
    .word $ff76,$ffb0,$b33f,$ff00           ; [$bb72] ushort
    .word $ff55,$ffbf,$aa79,$ff00           ; [$bb7a] ushort
    .word $ff11,$ffc4,$8f38,$ff00           ; [$bb82] ushort
    .word $ff53,$ffe0,$e10a,$ff00           ; [$bb8a] ushort
    .word $ff03,$ff7e,$f75e,$ff00           ; [$bb92] ushort
    .word $ff62,$fff3,$355e,$ff00           ; [$bb9a] ushort
    .word $ff54,$ff41,$df2e,$ff00           ; [$bba2] ushort
    .word $ff03,$ff6c,$5fb5,$ff00           ; [$bbaa] ushort
    .word $ffc4,$ffe2,$df5e,$ff00           ; [$bbb2] ushort
    .word $fff6,$ff5f,$0fa5,$ff00           ; [$bbba] ushort
    .word $ffc1,$ff21,$434f,$ff00           ; [$bbc2] ushort
    .word $ff48,$ff15,$dfe0,$ff00           ; [$bbca] ushort
    .word $ff64,$ff34,$7db1,$ff00           ; [$bbd2] ushort
    .word $fff8,$ffff,$2dbc,$ff00           ; [$bbda] ushort
    .word $ff09,$ffe6,$f64d,$ff00           ; [$bbe2] ushort
    .word $ff60,$ff81,$af15,$ff00           ; [$bbea] ushort
    .word $ff30,$ffa3,$3aba,$ff20           ; [$bbf2] ushort
    .word $ff53,$ff15,$aeed,$ff00           ; [$bbfa] ushort
    .word $ff21,$ff95,$feb3,$ff00           ; [$bc02] ushort
    .word $ffcc,$ffc5,$2f63,$ff00           ; [$bc0a] ushort
    .word $ff68,$ff3a,$ee7e,$ff00           ; [$bc12] ushort
    .word $ffb4,$ff5b,$316e,$ff00           ; [$bc1a] ushort
    .word $ff10,$ffcf,$e798,$ff00           ; [$bc22] ushort
    .word $ff60,$ffa7,$3f21,$ff00           ; [$bc2a] ushort
    .word $ff10,$ffef,$ebcd,$ff00           ; [$bc32] ushort
    .word $ff2e,$ffff,$5ec0,$ff00           ; [$bc3a] ushort
    .word $ff00,$ffbe,$ff31,$ff00           ; [$bc42] ushort
    .word $ff02,$ffde,$ff8a,$ff00           ; [$bc4a] ushort
    .word $ff42,$ffbe,$9cb8,$ff00           ; [$bc52] ushort
    .word $ff95,$ffed,$2efc,$ff00           ; [$bc5a] ushort
    .word $ff04,$fff5,$cf15,$ff00           ; [$bc62] ushort
    .word $ff4e,$ffee,$dc28,$ff00           ; [$bc6a] ushort
    .word $ff0a,$fff1,$765d,$ff00           ; [$bc72] ushort
    .word $ffb1,$ff97,$7a6b,$ff00           ; [$bc7a] ushort
    .word $ff85,$ff39,$cf15,$ff00           ; [$bc82] ushort
    .word $ffc6,$ffcb,$77fb,$ff00           ; [$bc8a] ushort
    .word $ff1f,$ffd7,$e1ac,$ff00           ; [$bc92] ushort
    .word $ff1a,$efc8,$e855,$ff00           ; [$bc9a] ushort
    .word $ff8a,$ffea,$bdf4,$ff00           ; [$bca2] ushort
    .word $ff80,$ff2f,$efd7,$ff00           ; [$bcaa] ushort
    .word $ff72,$ff45,$fdf3,$ff00           ; [$bcb2] ushort
    .word $ffef,$ffef,$238d,$ff00           ; [$bcba] ushort
    .word $ff20,$ff91,$ed9c,$ff00           ; [$bcc2] ushort
    .word $ff45,$ffaa,$ee93,$ff00           ; [$bcca] ushort
    .word $ff06,$ff4f,$9fa3,$ff00           ; [$bcd2] ushort
    .word $ffdd,$ffff,$0dfb,$ff00           ; [$bcda] ushort
    .word $ff28,$ff05,$6d2b,$ff00           ; [$bce2] ushort
    .word $ffd2,$ff51,$fdbc,$ff00           ; [$bcea] ushort
    .word $ff45,$ff86,$faa0,$ff00           ; [$bcf2] ushort
    .word $ffb2,$ffaf,$1471,$ff00           ; [$bcfa] ushort
    .word $ff20,$ff53,$ff57,$ff00           ; [$bd02] ushort
    .word $fff5,$ffbf,$fd35,$ff01           ; [$bd0a] ushort
    .word $ff93,$ffe6,$e8bd,$ff00           ; [$bd12] ushort
    .word $ff5f,$ffb9,$ffb8,$ff00           ; [$bd1a] ushort
    .word $ff70,$ff73,$dfc6,$ff00           ; [$bd22] ushort
    .word $ff03,$ff71,$af89,$ff00           ; [$bd2a] ushort
    .word $ff01,$ffab,$e76d,$ff00           ; [$bd32] ushort
    .word $ffd7,$ff62,$4736,$ff00           ; [$bd3a] ushort
    .word $ff40,$ff34,$ef41,$ff00           ; [$bd42] ushort
    .word $ffb9,$ff39,$6e3e,$ff00           ; [$bd4a] ushort
    .word $ffaf,$ff17,$ff3e,$ff00           ; [$bd52] ushort
    .word $ff69,$ff5d,$2367,$ff00           ; [$bd5a] ushort
    .word $ffa2,$ff1a,$dbf4,$ff00           ; [$bd62] ushort
    .word $ff87,$ffb3,$ae68,$ff00           ; [$bd6a] ushort
    .word $ff63,$ff6b,$fd65,$ff00           ; [$bd72] ushort
    .word $ff09,$fffd,$4cef,$ff00           ; [$bd7a] ushort
    .word $ff01,$ff65,$ea18,$ff00           ; [$bd82] ushort
    .word $ff30,$ffa3,$7fb6,$ff00           ; [$bd8a] ushort
    .word $ff9f,$feea,$be7f,$ff00           ; [$bd92] ushort
    .word $ffde,$ff25,$1edf,$ff00           ; [$bd9a] ushort
    .word $ff11,$ff50,$7e6b,$ff00           ; [$bda2] ushort
    .word $ff86,$fff4,$afb5,$ff00           ; [$bdaa] ushort
    .word $ffd0,$ffe3,$df3d,$ff00           ; [$bdb2] ushort
    .word $ffcd,$ffff,$5975,$ff00           ; [$bdba] ushort
    .word $ff19,$ff33,$bb74,$ff00           ; [$bdc2] ushort
    .word $ff30,$ffee,$fb7e,$ff00           ; [$bdca] ushort
    .word $ff1a,$fff9,$dfed,$ff00           ; [$bdd2] ushort
    .word $ff1d,$ffdd,$39cf,$ff00           ; [$bdda] ushort
    .word $ff00,$ffde,$97c4,$ff00           ; [$bde2] ushort
    .word $ffb4,$ffd3,$ff99,$ff00           ; [$bdea] ushort
    .word $ffa2,$7ee6,$f7b7,$ff00           ; [$bdf2] ushort
    .word $ff5c,$ffb7,$345f,$ff00           ; [$bdfa] ushort
    .word $ff0a,$ffc4,$ffc2,$ff00           ; [$be02] ushort
    .word $ff40,$ff75,$be56,$7f00           ; [$be0a] ushort
    .word $ff2c,$ff99,$7f9b,$ff00           ; [$be12] ushort
    .word $ffcd,$feff,$29dd,$ff00           ; [$be1a] ushort
    .word $ff02,$ff15,$df33,$ff00           ; [$be22] ushort
    .word $ff04,$ff75,$a65e,$ff00           ; [$be2a] ushort
    .word $ff2d,$ff23,$979f,$ff00           ; [$be32] ushort
    .word $ff5f,$fff7,$0392,$ff00           ; [$be3a] ushort
    .word $ff68,$ff46,$fe48,$ff00           ; [$be42] ushort
    .word $ff08,$ff9a,$ffed,$ff00           ; [$be4a] ushort
    .word $ff24,$ff7f,$f763,$ff00           ; [$be52] ushort
    .word $ff28,$ff7d,$dd5a,$ff00           ; [$be5a] ushort
    .word $ff15,$ff02,$fd0a,$ff00           ; [$be62] ushort
    .word $ff06,$ff7c,$38d2,$ff00           ; [$be6a] ushort
    .word $ff33,$ff7b,$c26f,$ff00           ; [$be72] ushort
    .word $ffa9,$ffa8,$dddb,$ff00           ; [$be7a] ushort
    .word $ffc0,$ffbb,$6bfc,$ff00           ; [$be82] ushort
    .word $ff70,$ffb1,$bf49,$ff00           ; [$be8a] ushort
    .word $ff56,$ffbc,$a6e5,$ff00           ; [$be92] ushort
    .word $ff0c,$ff73,$e7ed,$ff00           ; [$be9a] ushort
    .word $ffaa,$ff27,$5b41,$ff00           ; [$bea2] ushort
    .word $ff09,$fb7c,$efee,$ff00           ; [$beaa] ushort
    .word $ff68,$fff8,$6c53,$ff00           ; [$beb2] ushort
    .word $ff39,$ffff,$b87b,$ff00           ; [$beba] ushort
    .word $ff80,$ff66,$7c65,$ff00           ; [$bec2] ushort
    .word $ffdd,$ffff,$839b,$ff00           ; [$beca] ushort
    .word $ef61,$dfc7,$f570,$ff00           ; [$bed2] ushort
    .word $ffed,$fffa,$4cb3,$ff00           ; [$beda] ushort
    .word $ff08,$ff6b,$9710,$ff00           ; [$bee2] ushort
    .word $ffa0,$ff62,$eecd,$ff00           ; [$beea] ushort
    .word $ff50,$fffd,$ef75,$ff00           ; [$bef2] ushort
    .word $ff20,$ff1f,$7bd9,$ff00           ; [$befa] ushort
    .word $ffae,$ff9d,$ffe3,$ef00           ; [$bf02] ushort
    .word $ff82,$ff95,$ff9e,$ff00           ; [$bf0a] ushort
    .word $ffc3,$ffe7,$6fed,$ff00           ; [$bf12] ushort
    .word $ffc0,$ff37,$feff,$ff00           ; [$bf1a] ushort
    .word $ff11,$ff64,$dfc3,$ff00           ; [$bf22] ushort
    .word $ff76,$ff2e,$cb9b,$ff00           ; [$bf2a] ushort
    .word $ff1a,$ffed,$b945,$ff00           ; [$bf32] ushort
    .word $ffcf,$ffeb,$c715,$ff00           ; [$bf3a] ushort
    .word $ff5e,$ff21,$ef23,$ff00           ; [$bf42] ushort
    .word $ff31,$fff0,$75b7,$ff00           ; [$bf4a] ushort
    .word $ff12,$ff3e,$dede,$ff00           ; [$bf52] ushort
    .word $ff45,$fff8,$9feb,$ff00           ; [$bf5a] ushort
    .word $ffb9,$ff17,$fe3f,$ff00           ; [$bf62] ushort
    .word $ff24,$fffc,$bde9,$ff00           ; [$bf6a] ushort
    .word $fffc,$fff1,$bb54,$ff00           ; [$bf72] ushort
    .word $ffc4,$ffaa,$7b53,$ff00           ; [$bf7a] ushort
    .word $ffd0,$ff12,$efb6,$ff00           ; [$bf82] ushort
    .word $ffa1,$ff48,$b6ca,$ff00           ; [$bf8a] ushort
    .word $ff79,$ff51,$3f72,$ff00           ; [$bf92] ushort
    .word $ff7a,$ff73,$99f2,$ff00           ; [$bf9a] ushort
    .word $ff41,$ffd4,$ff19,$ff00           ; [$bfa2] ushort
    .word $ffc0,$ff5c,$c798,$ff00           ; [$bfaa] ushort
    .word $ff6a,$ff7a,$be9c,$ff00           ; [$bfb2] ushort
    .word $ff7d,$fffd,$8ea6,$ff00           ; [$bfba] ushort
    .word $ff29,$ffdb,$9183,$ff00           ; [$bfc2] ushort
    .word $ff81,$ffb5,$79aa,$ff00           ; [$bfca] ushort
    .word $ff0c,$fffe,$e3bf,$ff00           ; [$bfd2] ushort
    .word $ffa6,$ffda,$fafa,$ff00           ; [$bfda] ushort
    .word $ff46,$ff65,$7de2,$ff00           ; [$bfe2] ushort
    .word $fffa,$fff5,$d698,$ff00           ; [$bfea] ushort
    .word $ff22,$fff5,$b3f6,$ff00           ; [$bff2] ushort
    .word $ffa2,$fff7,$bffe                 ; [$bffa] ushort
