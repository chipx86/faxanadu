;============================================================================
; Faxanadu (U).nes
;
; RAM ($0100 - $07ff)
;============================================================================

    .segment "RAM"
    .reloc


;============================================================================
; The currently-loaded ROM bank used for logic.
;
; XREFS:
;     Area_LoadBlockProperties
;     Area_LoadScrollDataRight
;     Area_LoadTiles
;     Area_SetBlocks
;     Area_SetStateFromDoorDestination
;     CurrentSprite_LoadTilesInfo
;     Game_DrawScreenInFrozenState
;     Game_InitMMCAndBank
;     Game_InitScreenAndMusic
;     Game_LoadAreaTable
;     IScripts_DrawPortraitTileToPPU
;     IScripts_LoadPortraitTilesAddress
;     MMC1_EnsurePRG
;     MMC1_LoadBankAndJump
;     MMC1_SaveROMBankAndUpdateTo
;     MMC1_UpdateROMBank
;     Messages_Load
;     OnInterrupt
;     PPU_LoadGlyphsForStrings
;     PPU_WriteTilesFromCHRRAM
;     Player_LoadArmorSpriteTilesAddr
;     Player_LoadArmorTile
;     Player_LoadShieldSpriteTileAddrs
;     Player_LoadShieldTile
;     Player_LoadWeaponSpriteTileAddrs
;     Player_LoadWeaponTile
;     Screen_HandleScrollDown
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_HandleScrollUp
;     Screen_LoadSpriteInfo
;     Screen_LoadUIPalette
;     Screen_SetFadeOutPalette
;     Screen_SetPaletteData
;     Sprite_DrawPortraitPartAppearance
;     Sprite_SetAppearanceAddrFromOffset
;     Sprite_SetPlayerAppearanceAddr
;     Sprites_LoadCommon
;     Sprites_LoadImageForCurrentSprite
;     Sprites_LoadSpriteValue
;     TextBox_GetBackingAttributeData
;     TextBox_LoadAndShowMessage
;     TextBox_LoadItemSourceTiles
;     TextBox_ShowNextChar
;     TextBox_WriteChar
;     Textbox_Maybe_GetAreaBehindTextbox
;     UI_DrawSelectedItem
;============================================================================

;
; XREFS:
;     Area_LoadBlockProperties
;     Area_LoadScrollDataRight
;     Area_LoadTiles
;     Area_SetBlocks
;     Area_SetStateFromDoorDestination
;     CurrentSprite_LoadTilesInfo
;     Game_DrawScreenInFrozenState
;     Game_InitMMCAndBank
;     Game_InitScreenAndMusic
;     Game_LoadAreaTable
;     IScripts_DrawPortraitTileToPPU
;     IScripts_LoadPortraitTilesAddress
;     MMC1_EnsurePRG
;     MMC1_LoadBankAndJump
;     MMC1_SaveROMBankAndUpdateTo
;     MMC1_UpdateROMBank
;     Messages_Load
;     OnInterrupt
;     PPU_LoadGlyphsForStrings
;     PPU_WriteTilesFromCHRRAM
;     Player_LoadArmorSpriteTilesAddr
;     Player_LoadArmorTile
;     Player_LoadShieldSpriteTileAddrs
;     Player_LoadShieldTile
;     Player_LoadWeaponSpriteTileAddrs
;     Player_LoadWeaponTile
;     Screen_HandleScrollDown
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_HandleScrollUp
;     Screen_LoadSpriteInfo
;     Screen_LoadUIPalette
;     Screen_SetFadeOutPalette
;     Screen_SetPaletteData
;     Sprite_DrawPortraitPartAppearance
;     Sprite_SetAppearanceAddrFromOffset
;     Sprite_SetPlayerAppearanceAddr
;     Sprites_LoadCommon
;     Sprites_LoadImageForCurrentSprite
;     Sprites_LoadSpriteValue
;     TextBox_GetBackingAttributeData
;     TextBox_LoadAndShowMessage
;     TextBox_LoadItemSourceTiles
;     TextBox_ShowNextChar
;     TextBox_WriteChar
;     Textbox_Maybe_GetAreaBehindTextbox
;     UI_DrawSelectedItem
;
CurrentROMBank:                             ; [$0100]
    .byte $00                               ; [$0100] ROMBank


;============================================================================
; MOD NOTES: 31 unused bytes of RAM.
;============================================================================
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0101] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0109] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0111] undefined
    .byte $00,$00,$00,$00,$00,$00,$00       ; [$0119] undefined


;============================================================================
; Whether audio is playing or paused.
;
; If bit 0 is set, the game has been paused.
; If bit 7 is set, then audio has been paused.
;
; Audio will be paused following the game being paused,
; at the next hardware interrupt.
;
; XREFS:
;     GameLoop_CheckPauseGame
;     Game_InitScreenAndMusic
;     Audio_HandlePaused
;     Audio_InitPlayingState
;     Music_HandleOnInterrupt
;============================================================================

;
; XREFS:
;     GameLoop_CheckPauseGame
;     Game_InitScreenAndMusic
;     Audio_HandlePaused
;     Audio_InitPlayingState
;     Music_HandleOnInterrupt
;
Game_PausedState:                           ; [$0120]
    .byte $00                               ; [$0120] byte


;============================================================================
; The ID of the highest-priority sound being played.
;
; This is an index into SOUND_PRIORITIES, and
; helps
; manage which sound effect should be playing based on
; its priority level.
;
; XREFS:
;     SoundEffect_SetCurrent
;     Audio_InitPlayingState
;     SoundEffects_Init
;     Sound_ResetCurrentSound
;============================================================================

;
; XREFS:
;     SoundEffect_SetCurrent
;     Audio_InitPlayingState
;     SoundEffects_Init
;     Sound_ResetCurrentSound
;
SoundEffect_Unused_PriorityID:              ; [$0121]
    .byte $00                               ; [$0121] byte

;
; XREFS:
;     Audio_InitPlayingState
;     SoundEffects_HandleOnInterrupt
;     Sound_ResetCurrentSound
;
SoundEffect_HandlerIndex:                   ; [$0122]
    .byte $00                               ; [$0122] byte


;============================================================================
; Number of ticks remaining for sound effect playback.
;
; Each index corresponds to a channel:
;
; 0: SQ1
; 1: SQ2
; 2: Triangle
; 3: Noise
;
; XREFS:
;     Music_ApplySQPitchEffectToLO
;     Music_PlayForChannel
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;     Music_PlayWave
;     SoundEffect_PlayerDied_Setup
;     SoundEffects_HandleOnInterrupt
;     SoundEffects_Init
;============================================================================

;
; XREFS:
;     Music_ApplySQPitchEffectToLO
;     Music_PlayForChannel
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;     Music_PlayWave
;     SoundEffect_PlayerDied_Setup
;     SoundEffects_HandleOnInterrupt
;     SoundEffects_Init
;
SoundEffect_TicksRemaining:                 ; [$0123]
    .byte $00                               ; [0]:

;
; XREFS:
;     SoundEffect_0x48_OnTick
;     SoundEffect_0x48_Setup
;     SoundEffect_BreadTouched_Setup
;     SoundEffect_CharacterInput_Setup
;     SoundEffect_CoinDropped_Setup
;     SoundEffect_CoinTouchedCommon_Setup
;     SoundEffect_CursorMoved_Setup
;     SoundEffect_FillHPOrMP_Setup
;     SoundEffect_GoldAmountChanged_Setup
;     SoundEffect_HitEnemy_Setup
;     SoundEffect_HitPlayer_Setup
;     SoundEffect_ItemPickedUp_Setup
;     SoundEffect_Magic_Setup
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_Typing_Setup
;     SoundEffect_Maybe_UseSpecialItem2_Setup
;     SoundEffect_OpenDoor_Setup
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_Pakukame_Setup
;     SoundEffect_PasswordCharInput_Setup
;     SoundEffect_PlayerDied_Setup
;     SoundEffect_ShieldHitByMagic_Setup
;     SoundEffect_ShowPlayerMenu_Setup
;     SoundEffect_Tilte_Setup
;     SoundEffects_HandleOnInterrupt
;     SoundEffects_Init
;
SoundEffect_TicksRemaining_1_:              ; [$0124]
    .byte $00                               ; [1]:

;
; XREFS:
;     Audio_ResetIfNothingSet
;     SoundEffect_PlayerDied_Setup
;     SoundEffects_HandleOnInterrupt
;     SoundEffects_Init
;
SoundEffect_TicksRemaining_2_:              ; [$0125]
    .byte $00                               ; [2]:

;
; XREFS:
;     Audio_ResetIfNothingSet
;     Music_PlayNoise
;     SoundEffect_0x48_Setup
;     SoundEffect_EnemyDied_Setup
;     SoundEffect_HitEnemy_Setup
;     SoundEffect_LadderDropped_Setup
;     SoundEffect_MagicHitObstacle_Setup
;     SoundEffect_Maybe_Step_Setup
;     SoundEffect_Maybe_UseSpecialItem2_Setup
;     SoundEffect_Message_Setup
;     SoundEffect_OpenDoor_Setup
;     SoundEffect_PlayerDied_Setup
;     SoundEffect_PushBlock_Setup
;     SoundEffect_Tilte_Setup
;     SoundEffects_HandleOnInterrupt
;     SoundEffects_Init
;
SoundEffect_TicksRemaining_3_:              ; [$0126]
    .byte $00                               ; [3]:

;
; XREFS:
;     SoundEffect_0x48_OnTick
;     SoundEffect_0x48_Setup
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_BreadTouched_Setup
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_CharacterInput_Setup
;     SoundEffect_CoinDropped_OnTick
;     SoundEffect_CoinDropped_Setup
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CoinTouchedCommon_Setup
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_CursorMoved_Setup
;     SoundEffect_EnemyDied_OnTick
;     SoundEffect_EnemyDied_Setup
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_FillHPOrMP_Setup
;     SoundEffect_GoldAmountChanged_Setup
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitEnemy_Setup
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_HitPlayer_Setup
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_ItemPickedUp_Setup
;     SoundEffect_LadderDropped_OnTick
;     SoundEffect_LadderDropped_Setup
;     SoundEffect_MagicHitObstacle_OnTick
;     SoundEffect_MagicHitObstacle_Setup
;     SoundEffect_Magic_OnTick
;     SoundEffect_Magic_Setup
;     SoundEffect_Maybe_Step_OnTick
;     SoundEffect_Maybe_Step_Setup
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_Typing_Setup
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_Setup
;     SoundEffect_Message_OnTick
;     SoundEffect_Message_Setup
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_OpenDoor_Setup
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_Pakukame_Setup
;     SoundEffect_PasswordCharInput_Setup
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_PlayerDied_Setup
;     SoundEffect_PushBlock_OnTick
;     SoundEffect_PushBlock_Setup
;     SoundEffect_ShieldHitByMagic_OnTick
;     SoundEffect_ShieldHitByMagic_Setup
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_ShowPlayerMenu_Setup
;     SoundEffect_Tilte_OnTick
;     SoundEffect_Tilte_Setup
;     SoundEffects_DecrementCounter
;
SoundEffect_State_Counter:                  ; [$0127]
    .byte $00                               ; [$0127] byte

;
; XREFS:
;     SoundEffect_0x48_OnTick
;     SoundEffect_0x48_Setup
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_BreadTouched_Setup
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CoinTouchedCommon_Setup
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_EnemyDied_OnTick
;     SoundEffect_EnemyDied_Setup
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_FillHPOrMP_Setup
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_ItemPickedUp_Setup
;     SoundEffect_MagicHitObstacle_Setup
;     SoundEffect_Magic_OnTick
;     SoundEffect_Magic_Setup
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_Setup
;     SoundEffect_OpenDoor_Setup
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_PlayerDied_Setup
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_ShowPlayerMenu_Setup
;     SoundEffect_Tilte_OnTick
;     SoundEffect_Tilte_Setup
;
SoundEffect_State_0128:                     ; [$0128]
    .byte $00                               ; [$0128] byte

;
; XREFS:
;     SoundEffect_0x48_OnTick
;     SoundEffect_0x48_Setup
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_BreadTouched_Setup
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_FillHPOrMP_Setup
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_Setup
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_OpenDoor_Setup
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_ShowPlayerMenu_Setup
;     SoundEffect_Tilte_OnTick
;     SoundEffect_Tilte_Setup
;
SoundEffect_State_0129:                     ; [$0129]
    .byte $00                               ; [$0129] byte

;
; XREFS:
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_SetNote
;     SoundEffect_ShowPlayerMenu_OnTick
;
SoundEffect_Note_Low:                       ; [$012a]
    .byte $00                               ; [$012a] byte

;
; XREFS:
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_SetNote
;     SoundEffect_ShowPlayerMenu_OnTick
;
SoundEffect_Note_High:                      ; [$012b]
    .byte $00                               ; [$012b] byte

;
; XREFS:
;     MScripts_SetNoteLengthFromValue
;     Music_Load
;     Music_StoreNoteDuration
;
MScript_NoteDurations:                      ; [$012c]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
MScript_NoteDurations_1_:                   ; [$012d]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_Load
;
MScript_NoteDurations_2_:                   ; [$012e]
    .byte $00                               ; [2]:

;
; XREFS:
;     Music_Load
;
MScript_NoteDurations_3_:                   ; [$012f]
    .byte $00                               ; [3]:

;
; XREFS:
;     MScript_Op_End
;     Music_Load
;     Music_PlayNext
;     Music_StoreNoteDuration
;
Music_NoteTicksRemaining:                   ; [$0130]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;     Music_PlayNext
;
Music_NoteTicksRemaining_1_:                ; [$0131]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_Load
;
Music_NoteTicksRemaining_2_:                ; [$0132]
    .byte $00                               ; [2]:

;
; XREFS:
;     Music_Load
;
Music_NoteTicksRemaining_3_:                ; [$0133]
    .byte $00                               ; [3]:
    .byte $00,$00,$00,$00                   ; [$0134] undefined

;
; XREFS:
;     MScript_Op_BeginLoop
;     MScript_Op_EndLoop
;
MScript_LoopStartAddrs:                     ; [$0138]
    .word $0000                             ; [0]:
    .word $0000                             ; [1]:
    .word $0000                             ; [2]:
    .word $0000                             ; [3]:

;
; XREFS:
;     MScript_Op_EndLoop
;     MScript_Op_NextLoopIfNCompleted
;
MScript_LoopEndAddrs:                       ; [$0140]
    .word $0000                             ; [0]:
    .word $0000                             ; [1]:
    .word $0000                             ; [2]:
    .word $0000                             ; [3]:

;
; XREFS:
;     MScript_Op_BeginLoop
;     MScript_Op_EndLoop
;
MScript_LoopLength:                         ; [$0148]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:

;
; XREFS:
;     MScript_Op_BeginLoop
;     MScript_Op_EndLoop
;     MScript_Op_NextLoopIfNCompleted
;
MScript_LoopCounter:                        ; [$014c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:


;============================================================================
; The saved MScript addresses that can be restored back to.
;
; There is 1 address per channel.
;
; XREFS:
;     MScript_Op_RestoreAddr
;     MScript_Op_SaveAddr_Store
;     Music_Load
;============================================================================

;
; XREFS:
;     MScript_Op_RestoreAddr
;     MScript_Op_SaveAddr_Store
;     Music_Load
;
MScript_SavedAddr:                          ; [$0150]
    .word $0000                             ; [0]:
    .word $0000                             ; [1]:
    .word $0000                             ; [2]:
    .word $0000                             ; [3]:


;============================================================================
; Pushed MScript addresses for jumping to/returning from subroutines.
;
; There's one per channel.
;
; XREFS:
;     MScript_Op_JumpSubroutine
;     MScript_Op_Return
;============================================================================

;
; XREFS:
;     MScript_Op_JumpSubroutine
;     MScript_Op_Return
;
MScript_PushedAddrs:                        ; [$0158]
    .word $0000,$0000,$0000,$0000           ; [$0158] ushort

;
; XREFS:
;     MScript_Op_SetGlobalTranspose
;     Music_Load
;     Music_SetNote
;
Music_Global_Transpose:                     ; [$0160]
    .byte $00                               ; [$0160] byte

;
; XREFS:
;     MScript_Op_SetChannelTranspose
;     Music_Load
;     Music_SetNote
;
Music_Channel_Transpose:                    ; [$0161]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
Music_Channel_Transpose_1_:                 ; [$0162]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_Load
;
Music_Channel_Transpose_2_:                 ; [$0163]
    .byte $00                               ; [2]:

;
; XREFS:
;     MScripts_SetNoteLengthFromValue
;     Music_Load
;     Music_PlayWave
;
Music_SQ_Note_Lengths:                      ; [$0164]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;     Music_PlayWave
;
Music_Note_Length_High:                     ; [$0165]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_Load
;
Music_Unused_0166:                          ; [$0166]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
Music_Unused_0166_1_:                       ; [$0167]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_PlayNoise
;     Music_PlayWaveOrNoise
;
Music_Noise_Index:                          ; [$0168]
    .byte $00                               ; [$0168] byte

;
; XREFS:
;     MScripts_InvokeNext
;     Music_Load
;     Music_PlayNoise
;     Music_PlayWaveOrNoise
;
Music_Noise_Remaining:                      ; [$0169]
    .byte $00                               ; [$0169] byte


;============================================================================
; The index into the sound channel data.
;
; Sound channels are in the following order:
;
; 0 = Square wave 1
; 1 = Square wave 2
; 2 = Triangle wave
; 3 = Noise
;
; XREFS:
;     MScript_Op_BeginLoop
;     MScript_Op_End
;     MScript_Op_EndLoop
;     MScript_Op_JumpSubroutine
;     MScript_Op_NextLoopIfNCompleted
;     MScript_Op_RestoreAddr
;     MScript_Op_Return
;     MScript_Op_SaveAddr_Store
;     MScript_Op_SetChannelTranspose
;     MScript_Op_SetControlBits
;     MScript_Op_SetSQEnvelopeMode
;     MScript_Op_SetSQPitchEffectDepth
;     MScript_Op_SetSQVol
;     MScripts_GetNextValue
;     MScripts_InvokeNext
;     MScripts_SetNoteLengthFromValue
;     Music_ApplySQPitchEffectToLO
;     Music_PlayForChannel
;     Music_PlayNext
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;     Music_PlayWave
;     Music_PlayWaveOrNoise
;     Music_SetNote
;     Music_StoreNoteDuration
;     Music_UpdateSQVolRegister
;============================================================================

;
; XREFS:
;     MScript_Op_BeginLoop
;     MScript_Op_End
;     MScript_Op_EndLoop
;     MScript_Op_JumpSubroutine
;     MScript_Op_NextLoopIfNCompleted
;     MScript_Op_RestoreAddr
;     MScript_Op_Return
;     MScript_Op_SaveAddr_Store
;     MScript_Op_SetChannelTranspose
;     MScript_Op_SetControlBits
;     MScript_Op_SetSQEnvelopeMode
;     MScript_Op_SetSQPitchEffectDepth
;     MScript_Op_SetSQVol
;     MScripts_GetNextValue
;     MScripts_InvokeNext
;     MScripts_SetNoteLengthFromValue
;     Music_ApplySQPitchEffectToLO
;     Music_PlayForChannel
;     Music_PlayNext
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;     Music_PlayWave
;     Music_PlayWaveOrNoise
;     Music_SetNote
;     Music_StoreNoteDuration
;     Music_UpdateSQVolRegister
;
MScript_CurrentChannel:                     ; [$016a]
    .byte $00                               ; [$016a] byte


;============================================================================
; Number of channels completed for the current song.
;
; This starts at 0. Once it hits 4, playback finishes and
; Music_Current is cleared.
;
; XREFS:
;     MScript_Op_End
;     Music_PlayNext
;============================================================================

;
; XREFS:
;     MScript_Op_End
;     Music_PlayNext
;
Music_NumChannelsCompleted:                 ; [$016b]
    .byte $00                               ; [$016b] byte

;
; XREFS:
;     MScripts_InvokeNext
;     MScripts_SetNoteLengthFromNext
;     MScripts_SetNoteLengthFromValue
;     Music_Load
;     Music_PlayForChannel
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlaySQEnvelopeModePluck
;     Music_PlayTriangleWave
;     Music_PlayWave
;     Music_SetNote
;     Music_UpdateSQVolRegister
;
MScript_CurValue:                           ; [$016c]
    .byte $00                               ; [$016c] byte

;
; XREFS:
;     Music_Load
;     Music_PlayWave
;     Music_SetNote
;
Music_Note_Period_Low:                      ; [$016d]
    .byte $00                               ; [$016d] byte

;
; XREFS:
;     Music_Load
;     Music_PlayWave
;     Music_SetNote
;
Music_Note_Period_High:                     ; [$016e]
    .byte $00                               ; [$016e] byte

;
; XREFS:
;     Music_Load
;     Music_SetNote
;
MScript_Unused_RawValue:                    ; [$016f]
    .byte $00                               ; [$016f] byte


;============================================================================
; Value used for Square Wave envelope modes.
;
; This is used differently in the different modes:
;
; Mode 0: Fixed-point, with volume in the upper nibble.
; Mode 1: A volume value between 0-15 (in the lower nibble).
; Mode 2: A volume from the pre-built table (between 0-15).
;
; XREFS:
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlayWave
;============================================================================

;
; XREFS:
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModeLinearTrailoff
;     Music_PlayWave
;
Music_SQEnvelope_Value:                     ; [$0170]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:

;
; XREFS:
;     MScript_Op_SetControlBits
;     Music_Load
;     Music_UpdateSQVolRegister
;
Music_SQ_ControlBits:                       ; [$0172]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
Music_SQ_ControlBits_1_:                    ; [$0173]
    .byte $00                               ; [1]:

;
; XREFS:
;     MScript_Op_SetSQVol
;     Music_Load
;     Music_UpdateSQVolRegister
;
Music_SQ_Fades:                             ; [$0174]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
Music_SQ_Fades_1_:                          ; [$0175]
    .byte $00                               ; [1]:


;============================================================================
; The envelope mode for each Square Wave channel.
;
; This supports the following values:
;
; 0: Volume decay
;
;    Ramps down the volume smoothly
;
; 1: Curve but held
;
;    Clamps the envelope into a range 0..15 and then slows the decay
;
; 2: Pre-built attack/decay curve
;
;    Pitches up and then down in a set pattern
;
; XREFS:
;     MScript_Op_SetSQEnvelopeMode
;     Music_Load
;     Music_PlayForChannel
;============================================================================

;
; XREFS:
;     MScript_Op_SetSQEnvelopeMode
;     Music_Load
;     Music_PlayForChannel
;
Music_SQEnvelope_Mode:                      ; [$0176]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
Music_SQEnvelope_Mode_1_:                   ; [$0177]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_ApplySQPitchEffectToLO
;     Music_Load
;     Music_PlayTriangleWave
;
Music_SQEffect_Delta:                       ; [$0178]
    .byte $00                               ; [$0178] undefined1

;
; XREFS:
;     Music_ApplySQPitchEffectToLO
;     Music_Load
;     Music_PlaySQEnvelopeModeCurveButHeld
;     Music_PlaySQEnvelopeModePluck
;     Music_PlayWave
;
Music_SQEnvelope_Phase:                     ; [$0179]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;     Music_PlayWave
;
Music_SQEnvelope_Phase_1_:                  ; [$017a]
    .byte $00                               ; [1]:
    .byte $00                               ; [$017b] undefined

;
; XREFS:
;     Music_ApplySQPitchEffectToLO
;     Music_Load
;     Music_PlayWave
;
Music_Current_SQ_Low:                       ; [$017c]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;     Music_PlayWave
;
Music_Current_SQ_Low_1_:                    ; [$017d]
    .byte $00                               ; [1]:

;
; XREFS:
;     Music_Load
;     Music_PlayForChannel
;     Music_PlayTriangleWave
;
Something_Music_Triangle_017e:              ; [$017e]
    .byte $00                               ; [$017e] byte

;
; XREFS:
;     MScript_Op_SetSQPitchEffectDepth
;     Music_ApplySQPitchEffectToLO
;     Music_Load
;
Music_SQPitchDelta_Mask:                    ; [$017f]
    .byte $00                               ; [0]:

;
; XREFS:
;     Music_Load
;
Music_SQPitchDelta_Mask_1_:                 ; [$0180]
    .byte $00                               ; [1]:

;
; XREFS:
;     MScript_Op_SetSQ2Detune
;     Music_Load
;     Music_PlayWave
;
Music_SQ2_TimerLowBias:                     ; [$0181]
    .byte $00                               ; [$0181] undefined


;============================================================================
; MOD NOTES: 8 unused bytes of RAM.
;============================================================================
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0182] undefined


;============================================================================
; Data zero'd out during horizontal screen scroll.
;
; This is written to but never read or otherwise used.
;
; XREFS:
;     Screen_LoadBlocksHoriz
;============================================================================

;
; XREFS:
;     Screen_LoadBlocksHoriz
;
Screen_ScrollHoriz_ZeroData:                ; [$018a]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0192] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$019a] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01a2] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01aa] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01b2] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01ba] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01c2] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01ca] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01d2] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01da] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01e2] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01ea] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$01f2] undefined
    .byte $00,$00,$00,$00,$00,$00           ; [$01fa] undefined

;
; XREFS:
;     IScripts_Begin
;     Game_Init
;     Screen_LoadBlocksHoriz
;     Screen_WriteScrollHorizPPUTileData
;
Temp_0200:                                  ; [$0200]
    .byte $00                               ; [$0200] byte

;
; XREFS:
;     IScriptAction_EndScript
;     IScripts_Begin
;     IScripts_UpdatePortraitAnimation
;     TextBox_SetCoordsForNPC
;     Screen_LoadBlocksHoriz
;     Screen_WriteScrollHorizPPUTileData
;
Temp_0201:                                  ; [$0201]
    .byte $00                               ; [$0201] byte

;
; XREFS:
;     IScriptAction_AddGold
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     IScriptAction_SpendGold
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     Screen_LoadBlocksHoriz
;
Temp_0202:                                  ; [$0202]
    .byte $00                               ; [$0202] byte

;
; XREFS:
;     IScriptAction_AddGold
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     IScriptAction_SpendGold
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     Screen_LoadBlocksHoriz
;
Temp_0203:                                  ; [$0203]
    .byte $00                               ; [$0203] byte

    .byte $00

;
; XREFS:
;     IScriptAction_ShowSellMenu
;
Maybe_Shop_InventoryBitmask:                ; [$0205]
    .byte $00                               ; [$0205] byte

;
; XREFS:
;     IScriptAction_AddHP
;     IScriptAction_AddMP
;
IScript_HPOrMPValueToAdd:                   ; [$0206]
    .byte $00                               ; [$0206] byte

;
; XREFS:
;     IScriptAction_ShowPassword
;
IScripts_Unused_207:                        ; [$0207]
    .byte $00                               ; [$0207] byte


;============================================================================
; X tile position of a displayed textbox.
;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddInventoryItem_ClearTextBox
;     IScripts_PositionAndFillPlaceholderText
;     PlayerMenu_Close
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_DrawDownArrowTerminatorSymbol
;     TextBox_DrawQuestionMarkTerminatorSymbol
;     TextBox_DrawUpArrowTerminatorSymbol
;     TextBox_FillBackground
;     TextBox_GetXPixelCoord
;     TextBox_Open
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;     TextBox_ShowMessage_Fill4Lines
;============================================================================

;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddInventoryItem_ClearTextBox
;     IScripts_PositionAndFillPlaceholderText
;     PlayerMenu_Close
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_DrawDownArrowTerminatorSymbol
;     TextBox_DrawQuestionMarkTerminatorSymbol
;     TextBox_DrawUpArrowTerminatorSymbol
;     TextBox_FillBackground
;     TextBox_GetXPixelCoord
;     TextBox_Open
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_X:                                  ; [$0208]
    .byte $00                               ; [$0208] byte


;============================================================================
; Y tile position of a displayed textbox.
;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddInventoryItem_ClearTextBox
;     IScripts_PositionAndFillPlaceholderText
;     PlayerMenu_Close
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_DrawDownArrowTerminatorSymbol
;     TextBox_DrawQuestionMarkTerminatorSymbol
;     TextBox_DrawUpArrowTerminatorSymbol
;     TextBox_FillBackground
;     TextBox_GetYPixelCoord
;     TextBox_Open
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;     TextBox_ShowMessage_Fill4Lines
;============================================================================

;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddInventoryItem_ClearTextBox
;     IScripts_PositionAndFillPlaceholderText
;     PlayerMenu_Close
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_DrawDownArrowTerminatorSymbol
;     TextBox_DrawQuestionMarkTerminatorSymbol
;     TextBox_DrawUpArrowTerminatorSymbol
;     TextBox_FillBackground
;     TextBox_GetYPixelCoord
;     TextBox_Open
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_Y:                                  ; [$0209]
    .byte $00                               ; [$0209] byte


;============================================================================
; Width of a displayed textbox.
;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     PlayerMenu_Close
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_FillBackground
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;     TextBox_QueuePPUBufferTextBoxLength
;============================================================================

;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     PlayerMenu_Close
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_FillBackground
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;     TextBox_QueuePPUBufferTextBoxLength
;
TextBox_Width:                              ; [$020a]
    .byte $00                               ; [$020a] byte


;============================================================================
; Height of a displayed textbox.
;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     PlayerMenu_Close
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_FillBackground
;     TextBox_Open
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;============================================================================

;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     PlayerMenu_Close
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     TextBox_ClearForPortraitAndText
;     TextBox_Close
;     TextBox_FillBackground
;     TextBox_Open
;     TextBox_SetCoordsForNPC
;     TextBox_SetCoordsForPortrait
;
TextBox_Height:                             ; [$020b]
    .byte $00                               ; [$020b] byte


;============================================================================
; Whether the textbox is closed.
;
; 0 = Open
; 1 = Closed
;
; Note that at game startup, this may be a garbage value.
;
; XREFS:
;     TextBox_Close
;     TextBox_GetBackgroundAttributeData
;     TextBox_Open
;============================================================================

;
; XREFS:
;     TextBox_Close
;     TextBox_GetBackgroundAttributeData
;     TextBox_Open
;
TextBox_Closed:                             ; [$020c]
    .byte $00                               ; [$020c] bool

    .byte $00                               ; Unused


;============================================================================
; Inventory corresponding to the Player Menu selection.
;
; XREFS:
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_EquipItem
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_ShowSubmenu
;============================================================================

;
; XREFS:
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_EquipItem
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_ShowSubmenu
;
PlayerMenu_SelectedInventory:               ; [$020e]
    .byte $00                               ; [$020e] byte

    .byte $00                               ; Unused


;============================================================================
; Temporary state for the new inventory item.
;
; This is used when equipping an item in Player_Equip
; to store the new item for the purpose of equipping it.
;
; XREFS:
;     Player_Equip
;============================================================================

;
; XREFS:
;     Player_Equip
;
Temp_EquipingItem:                          ; [$0210]
    .byte $00                               ; [$0210] byte


;============================================================================
; Temporary state for the previous inventory item.
;
; This is used when equipping an item in Player_Equip
; to store the previous item for the purpose of unequipping it.
;
; XREFS:
;     Player_Equip
;============================================================================

;
; XREFS:
;     Player_Equip
;
Temp_PrevInventoryItem:                     ; [$0211]
    .byte $00                               ; [$0211] byte

;
; XREFS:
;     TextBox_LoadAndShowMessage
;     TextBox_ShowMessageWithSound
;     TextBox_ShowNextChar
;
TextBox_PlayTextSound:                      ; [$0212]
    .byte $00                               ; [$0212] bool


;============================================================================
; ID of the message to show in a textbox.
;
; This would be a 1-based index into MESSAGE_STRINGS.
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     TextBox_CheckShouldContinue
;     TextBox_CheckShouldContinueOrDismissMessage
;     TextBox_CheckShouldContinueOrDismissQuestion
;     IScripts_LoadAndShowMessage
;     Maybe_TextBox_ShowCurrentMessageID
;     Messages_Load
;     TextBox_ShowMessage_Pause
;============================================================================

;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     TextBox_CheckShouldContinue
;     TextBox_CheckShouldContinueOrDismissMessage
;     TextBox_CheckShouldContinueOrDismissQuestion
;     IScripts_LoadAndShowMessage
;     Maybe_TextBox_ShowCurrentMessageID
;     Messages_Load
;     TextBox_ShowMessage_Pause
;
MessageID:                                  ; [$0213]
    .byte $00                               ; [$0213] Message


;============================================================================
; The number of bytes processed in a message string.
;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;============================================================================

;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;
Message_ProcessedLength:                    ; [$0214]
    .byte $00                               ; [$0214] byte


;
; Flag indicating if a message display is paused.
;
; 0x00 = Message is not paused.
; 0xFF = Message is paused.
;
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     TextBox_CheckForDismiss
;     TextBox_CheckShouldContinue
;     TextBox_CheckShouldContinueOrDismissQuestion
;     TextBox_PrepareContinueMessage
;     Maybe_TextBox_ShowCurrentMessageID
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_Pause
;
TextBox_MessagePaused:                      ; [$0215]
    .byte $00                               ; [$0215] byte

;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_IncLineAndReset
;     TextBox_ShowMessage_Newline
;     TextBox_ShowMessage_Prepare4Lines
;     TextBox_ShowMessage_Space
;     TextBox_WriteChar
;
TextBox_CharPosForLine:                     ; [$0216]
    .byte $00                               ; [$0216] byte


;============================================================================
; Last drawn line number (0-based).
;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_IncLineAndReset
;     TextBox_WriteChar
;============================================================================

;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_IncLineAndReset
;     TextBox_WriteChar
;
TextBox_DrawnLineNum:                       ; [$0217]
    .byte $00                               ; [$0217] byte

;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;
Message_StartAddr:                          ; [$0218]
    .byte $00                               ; [$0218] byte

;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;
Message_StartAddr_U:                        ; [$0219]
    .byte $00                               ; [$0219] byte

;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_Fill4Lines
;     TextBox_WriteChar
;
TextBox_LineScrollOffset:                   ; [$021a]
    .byte $00                               ; [$021a] byte

;
; XREFS:
;     TextBox_PrepareContinueMessage
;     TextBox_ClearPasswordSize
;
Unused_Arg_Text_NumLines:                   ; [$021b]
    .byte $00                               ; [$021b] byte


;
; Offset into the process of writing a player title in a
; textbox.
;
; This is a value from 0x81 to 0x90 that is incremented with
; every character of the player title written in a textbox. It's
; used for IScripts that list the player title using code 0xFB
; (namely, Guru title rank scripts).
;
; The values are indexes 1 through 16 (length of the player
; title strings), with the MSB set.
;
;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_DisplayMessage
;     TextBox_ShowMessage_ShowPlayerTitle
;
Textbox_TitleCharOffset:                    ; [$021c]
    .byte $00                               ; [$021c] byte


;============================================================================
; Count-up timer used to control the rate at which
; characters are shown in textboxes.
;
; This will increment up by 1 every tick of the message box.
; Maybe_TextBox_ShowCurrentMessageID will AND this
; with
; 3 and only process/display the next character if the
; result is 0.
;
; XREFS:
;     Maybe_TextBox_ShowCurrentMessageID
;     Messages_Load
;     TextBox_ShowNextChar
;============================================================================

;
; XREFS:
;     Maybe_TextBox_ShowCurrentMessageID
;     Messages_Load
;     TextBox_ShowNextChar
;
TextBox_Timer:                              ; [$021d]
    .byte $00                               ; [$021d] byte

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowSellMenu
;     Menu_UpdateAndDraw
;     PlayerMenu_EquipItem
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     PlayerMenu_ShowInventoryMenu
;     PlayerMenu_ShowSubmenu
;     Shop_Draw
;     Shop_GetPlayerHasSelectedItem
;     Shop_Populate
;
Menu_CursorPos:                             ; [$021e]
    .byte $00                               ; [$021e] byte

;
; XREFS:
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowSellMenu
;     Menu_UpdateAndDraw
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_Show
;     PlayerMenu_ShowInventoryMenu
;     PlayerMenu_ShowStatusMenu
;     Shop_Draw
;     Shop_Populate
;
Arg_StringsCount:                           ; [$021f]
    .byte $00                               ; [$021f] byte


;============================================================================
; Temporary data used for multiple purposes:
;
; 1. Shop items
; 2. Player menu items
; 3. Vertical screen scroll PPU tile data
;
; For #3, the data will overflow through $0240.
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_EquipItem
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     PlayerMenu_ShowInventoryMenu
;     PlayerMenu_ShowStatusMenu
;     Shop_Draw
;     Shop_GetPlayerHasSelectedItem
;     Shop_Populate
;     Screen_LoadBlockDataVert
;     Screen_WriteScrollVertPPUTileData
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_DrawStringLines
;     PlayerMenu_EquipItem
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     PlayerMenu_ShowInventoryMenu
;     PlayerMenu_ShowStatusMenu
;     Shop_Draw
;     Shop_GetPlayerHasSelectedItem
;     Shop_Populate
;     Screen_LoadBlockDataVert
;     Screen_WriteScrollVertPPUTileData
;
DataArray:                                  ; [$0220]
    .byte $00                               ; [0]:

;
; XREFS:
;     PlayerMenu_Show
;     PlayerMenu_ShowInventoryMenu
;     PlayerMenu_ShowStatusMenu
;     Screen_LoadBlockDataVert
;     Screen_WriteScrollVertPPUTileData
;
DataArray_1_:                               ; [$0221]
    .byte $00                               ; [1]:

;
; XREFS:
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     Screen_LoadBlockDataVert
;
DataArray_2_:                               ; [$0222]
    .byte $00                               ; [2]:

;
; XREFS:
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     Screen_LoadBlockDataVert
;
DataArray_3_:                               ; [$0223]
    .byte $00                               ; [3]:

;
; XREFS:
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;
DataArray_4_:                               ; [$0224]
    .byte $00                               ; [4]:

;
; XREFS:
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;
DataArray_5_:                               ; [$0225]
    .byte $00                               ; [5]:

;
; XREFS:
;     PlayerMenu_ShowStatusMenu
;
DataArray_6_:                               ; [$0226]
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; Lower byte of costs of items currently shown in the shop.
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Shop_Draw
;     Shop_Populate
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Shop_Draw
;     Shop_Populate
;
ShopItemCostsL:                             ; [$0228]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; Upper byte of costs of items currently shown in the shop.
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Shop_Draw
;     Shop_Populate
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Shop_Draw
;     Shop_Populate
;
ShopItemCostsU:                             ; [$0230]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; ASCII digits to render in the Gold or Experience area.
;
; Each digit corresponds to a single digit, populating based
; on the gold or experience.
;
; XREFS:
;     UI_DrawDigitsZeroPadded
;     UI_PopulateDigitsNoLeadingZeroes
;============================================================================

;
; XREFS:
;     UI_DrawDigitsZeroPadded
;     UI_PopulateDigitsNoLeadingZeroes
;
UI_DigitsToRender:                          ; [$0238]
    .byte $00,$00,$00,$00,$00,$00           ; [$0238] char

;
; XREFS:
;     UI_PopulateDigits
;
CHAR_ARRAY_023e:                            ; [$023e]
    .byte $00,$00,$00,$00                   ; [$023e] char


;
; PPU Attribute Data for a textbox.
;
; XREFS:
;     DEADCODE_FUN_PRG12__9041
;     TextBox_FillBackground
;     TextBox_SetNextAttributeData
;
TextBox_AttributeData:                      ; [$0242]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:

ScreenBlocks:                               ; [$024a]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$024a] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0252] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$025a] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0262] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$026a] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0272] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$027a] byte

;
; XREFS:
;     Screen_LoadBlocksHoriz
;     Screen_WriteScrollHorizPPUAttrData
;
Screen_ScrollHorizPPUAttrData:              ; [$0282]
    .byte $00                               ; [0]:

;
; XREFS:
;     Screen_LoadBlocksHoriz
;     Screen_WriteScrollHorizPPUAttrData
;
Screen_ScrollHorizPPUAttrData_1_:           ; [$0283]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:

;
; XREFS:
;     Screen_LoadBlockDataVert
;     Screen_WriteScrollVertPPUAttrData
;
Screen_ScrollVertPPUAttrData:               ; [$028a]
    .byte $00                               ; [0]:

;
; XREFS:
;     Screen_LoadBlockDataVert
;     Screen_WriteScrollVertPPUAttrData
;
Screen_ScrollVertPPUAttrData_1_:            ; [$028b]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [$0292] undefined

;
; XREFS:
;     PPUBuffer_DrawCommand_WritePalette
;
Screen_PaletteData_Tiles:                   ; [$0293]
    .byte $00                               ; [0]:

;
; XREFS:
;     PPUBuffer_DrawCommand_WritePalette
;
Screen_PaletteData_Tiles_1_:                ; [$0294]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:

;
; XREFS:
;     Screen_SetFadeOutPalette
;
Screen_PaletteData_Tiles_15_:               ; [$02a2]
    .byte $00                               ; [15]:

Screen_PaletteData_Sprites:                 ; [$02a3]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:

;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     SplashAnimation_Intro_SomethingA708
;     StartScreen_Draw
;     Screen_SetPaletteData
;
Screen_PaletteData_Sprites_14_:             ; [$02b1]
    .byte $00                               ; [14]:

;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     SplashAnimation_Intro_SomethingA708
;     StartScreen_Draw
;     Screen_SetPaletteData
;
Screen_PaletteData_Sprites_15_:             ; [$02b2]
    .byte $00                               ; [15]:


;============================================================================
; Magic-related variables.
;
; XREFS:
;     CastMagic_CheckDirection_CheckImpassable
;     CastMagic_CheckDirection_Right
;     CastMagic_Clear
;     CastMagic_HitHandler_Death
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CastMagic_HitHandler_Thunder
;     CastMagic_HitHandler_Tilte
;     CastMagic_RunSpellHandler
;     CastMagic_Unused_UpdateDelugeAfterFirstHit
;     CastMagic_Unused_UpdateHitWallEffect
;     CastMagic_UpdateDeathAfterFirstHit
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateFireAfterFirstHit
;     CastMagic_UpdateThunderAfterFirstHit
;     CastMagic_UpdateTilteAfterFirstHit
;     CastMagic_UpdateXPosition
;     Player_CastMagic
;     Player_ClearVisibleMagic
;     Sprite_CheckHitByCastMagic
;     Area_ScrollTo
;     CastMagic_RunUpdateSpellHandler
;     CastMagic_SetAppearance
;============================================================================

;
; The type of magic currently on screen.
;
; This may also contain results of a spell, including
; explosion effects.
;
;
; XREFS:
;     CastMagic_CheckDirection_CheckImpassable
;     CastMagic_CheckDirection_Right
;     CastMagic_Clear
;     CastMagic_HitHandler_Death
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CastMagic_HitHandler_Thunder
;     CastMagic_HitHandler_Tilte
;     CastMagic_RunSpellHandler
;     CastMagic_Unused_UpdateDelugeAfterFirstHit
;     CastMagic_Unused_UpdateHitWallEffect
;     CastMagic_UpdateDeathAfterFirstHit
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateFireAfterFirstHit
;     CastMagic_UpdateThunderAfterFirstHit
;     CastMagic_UpdateTilteAfterFirstHit
;     CastMagic_UpdateXPosition
;     Player_CastMagic
;     Player_ClearVisibleMagic
;     Sprite_CheckHitByCastMagic
;     Area_ScrollTo
;     CastMagic_RunUpdateSpellHandler
;     CastMagic_SetAppearance
;
CastMagic_Type:                             ; [$02b3]
    .byte $00                               ; [$02b3] SelectedMagic


;
; Flags dictating direction and movement for a cast magic spell.
;
;
; XREFS:
;     CastMagic_UpdateFire
;     CastMagic_UpdateTilte
;     CastMagic_UpdateXPosition
;     CastMagic_UpdateYPosition
;     Player_CastMagic
;     Sprite_CheckHitByCastMagic
;     CastMagic_CalculateVisibility
;     CastMagic_UpdateSpriteDirection
;
CastMagic_Flags:                            ; [$02b4]
    .byte $00                               ; [$02b4] CastMagicFlags


;
; The fractional (lower byte) X position of any visible magic.
;
;
; XREFS:
;     CastMagic_UpdateXPosition
;     Player_CastMagic
;
CastMagic_XPos_Frac:                        ; [$02b5]
    .byte $00                               ; [$02b5] byte


;
; The block (upper byte) X position of any visible magic.
;
;
; XREFS:
;     CastMagic_CheckDirection_Left
;     CastMagic_CheckDirection_Right
;     CastMagic_HitHandler_Deluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateXPosition
;     Player_CastMagic
;     Sprite_CheckHitByCastMagic
;     CastMagic_CalculateVisibility
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_RunUpdateSpellHandler
;
CastMagic_XPos_Full:                        ; [$02b6]
    .byte $00                               ; [$02b6] byte


;
; The fractional (lower byte) Y position of any visible magic.
;
;
; XREFS:
;     CastMagic_UpdateYPosition
;     Player_CastMagic
;
CastMagic_YPos_Frac:                        ; [$02b7]
    .byte $00                               ; [$02b7] byte


;
; The block (upper byte) Y position of any visible magic.
;
;
; XREFS:
;     CastMagic_CheckDirection_CheckImpassable
;     CastMagic_UpdateYPosition
;     Player_CastMagic
;     Sprite_CheckHitByCastMagic
;     CastMagic_CalculateVisibility
;     CastMagic_FinishHandler_HitWallEffect
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_RunUpdateSpellHandler
;
CastMagic_YPos_Full:                        ; [$02b8]
    .byte $00                               ; [$02b8] byte

;
; XREFS:
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CastMagic_HitHandler_Thunder
;     CastMagic_HitHandler_Tilte
;     CastMagic_Unused_UpdateDelugeAfterFirstHit
;     CastMagic_UpdateFireAfterFirstHit
;     CastMagic_UpdateThunderAfterFirstHit
;     CastMagic_UpdateTilte
;     CastMagic_UpdateTilteAfterFirstHit
;     Player_CastMagic
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
CastMagic_Counter:                          ; [$02b9]
    .byte $00                               ; [$02b9] byte


;
; The phase of the current spell.
;
; This is spell-dependent.
;
;
; XREFS:
;     CastMagic_UpdateTilte
;     Player_CastMagic
;     CastMagic_FinishHandler_Tilte
;
CastMagic_Phase:                            ; [$02ba]
    .byte $00                               ; [$02ba] byte


;
; Relative Y position used for the magic's Hit Wall effect.
;
; This is set but never actually used in Faxanadu. The game
; wired it off, but it was intended for the Deluge and Fire
; spells. It would be the center Y position of the explosion
; relative to the magic's Y position.
;
; It can be enabled via these Game Genie codes:
;
; ZAVLOUNN
; ZEUUSUNN
;
;
; XREFS:
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_FinishHandler_HitWallEffect
;
CastMagic_Unused_HitWallDeltaPosY:          ; [$02bb]
    .byte $00                               ; [$02bb] byte

;
; XREFS:
;     Sprite_AddPosX
;     Sprite_SubtractPosX
;
CurrentSprites_XPos_Frac:                   ; [$02bc]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:

;
; XREFS:
;     Sprite_CalculateNewVertPos
;
CurrentSprites_YPos_Frac:                   ; [$02c4]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; Sprite IDs of the 8 active sprites
;
; XREFS:
;     BScript_Action_CastMagic
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_HandleFall
;     CurrentSprite_UpdateState
;     FUN_PRG14__a1cc
;     Player_AddExperienceFromSprite
;     Player_ApplyDamage
;     Player_CheckShieldHitByMagic
;     Player_HandleHitByMagic
;     Player_HandleShieldHitByMagic
;     Player_HandleTouchBreadOrCoin
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     Player_HandleTouchItem
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_BossDeath
;     SpriteBehavior_EnemyMagic
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_ExecutionHood__a0ad
;     SpriteBehavior_Garbled3
;     SpriteBehavior_LightningBallOrCharron
;     SpriteBehavior_MaybeFallingRocks__ClearEntity
;     SpriteBehavior_Pakukame
;     SpriteBehavior_ShadowEura__a12d
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Zorugeriru__9e13
;     SpriteBehavior_a25f_ClearEntity
;     Sprite_CastMagic
;     Sprite_CheckHitByCastMagic
;     Sprite_EnterNextAppearancePhase
;     Sprite_GetBounds
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_HasAnyEnemyOnScreen
;     Sprites_IsSpriteOutOfWeaponRange
;     Sprites_Remove
;     Sprites_UpdateBehavior
;============================================================================

;
; XREFS:
;     BScript_Action_CastMagic
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_HandleFall
;     CurrentSprite_UpdateState
;     FUN_PRG14__a1cc
;     Player_AddExperienceFromSprite
;     Player_ApplyDamage
;     Player_CheckShieldHitByMagic
;     Player_HandleHitByMagic
;     Player_HandleShieldHitByMagic
;     Player_HandleTouchBreadOrCoin
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     Player_HandleTouchItem
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_BossDeath
;     SpriteBehavior_EnemyMagic
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_ExecutionHood__a0ad
;     SpriteBehavior_Garbled3
;     SpriteBehavior_LightningBallOrCharron
;     SpriteBehavior_MaybeFallingRocks__ClearEntity
;     SpriteBehavior_Pakukame
;     SpriteBehavior_ShadowEura__a12d
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Zorugeriru__9e13
;     SpriteBehavior_a25f_ClearEntity
;     Sprite_CastMagic
;     Sprite_CheckHitByCastMagic
;     Sprite_EnterNextAppearancePhase
;     Sprite_GetBounds
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_HasAnyEnemyOnScreen
;     Sprites_IsSpriteOutOfWeaponRange
;     Sprites_Remove
;     Sprites_UpdateBehavior
;
CurrentSprites_Entities:                    ; [$02cc]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:

;
; XREFS:
;     SpriteBehavior_Pakukame__9d78
;     SpriteBehavior_Zorugeriru__9df7
;     Sprites_ClearAllEntities
;     Sprites_HasAnyEnemyOnScreen
;     Sprites_HasMaxOnScreen
;     _Sprites_ReplaceWithMattock_HasMaxOnScreen
;     GameLoop_LoadSpriteImages
;     Maybe_IsSpriteEntityNotOnScreen
;     Screen_ClearSprites
;     Sprites_HasBoss
;     Sprites_HasCurrentSprites
;     Sprites_HasSpritesNotOfType
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Entities_6_:                 ; [$02d2]
    .byte $00                               ; [6]:

;
; XREFS:
;     SpriteBehavior_Pakukame__9d78
;     SpriteBehavior_Zorugeriru__9df7
;     Sprites_ClearAllEntities
;     Sprites_HasAnyEnemyOnScreen
;     Sprites_HasMaxOnScreen
;     _Sprites_ReplaceWithMattock_HasMaxOnScreen
;     GameLoop_LoadSpriteImages
;     Maybe_IsSpriteEntityNotOnScreen
;     Screen_ClearSprites
;     Sprites_HasBoss
;     Sprites_HasCurrentSprites
;     Sprites_HasSpritesNotOfType
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Entities_7_:                 ; [$02d3]
    .byte $00                               ; [7]:


;============================================================================
; Subtype of the currently-active sprites
;
; XREFS:
;     BScript_Op_GoTo
;     BScript_Op_MaybeDisableAndGoTo
;     BScript_Op_RunAction
;     BScript_Op_SetPhase
;     BScript_Op_SwitchBehavior
;     BScripts_LoadNextOp
;     SpriteOp_CheckDistanceToPlayer_X
;     SpriteOp_CheckDistanceToPlayer_Y
;     Sprite_FinishBehavior
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_UpdateBehavior
;============================================================================

;
; XREFS:
;     BScript_Op_GoTo
;     BScript_Op_MaybeDisableAndGoTo
;     BScript_Op_RunAction
;     BScript_Op_SetPhase
;     BScript_Op_SwitchBehavior
;     BScripts_LoadNextOp
;     SpriteOp_CheckDistanceToPlayer_X
;     SpriteOp_CheckDistanceToPlayer_Y
;     Sprite_FinishBehavior
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_UpdateBehavior
;
CurrentSprites_Behaviors:                   ; [$02d4]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:

;
; XREFS:
;     Screen_ClearSprites
;
CurrentSprites_Behaviors_6_:                ; [$02da]
    .byte $00                               ; [6]:

;
; XREFS:
;     Screen_ClearSprites
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Behaviors_7_:                ; [$02db]
    .byte $00                               ; [7]:

;
; XREFS:
;     BScript_Action_CastMagic
;     BScript_Action_FacePlayerX
;     BScript_Action_FacePlayerY
;     BScript_Action_FlipXDirection
;     BScript_Action_FlipYDirection
;     BScript_Action_RandomlyFlipXDirection
;     BScript_Action_RandomlyFlipYDirection
;     BScript_Action_RiseUp
;     CurrentSpriteFlags_SetBit5
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_HandleFall
;     CurrentSprite_UpdateFlipMask
;     FUN_PRG14__844b
;     FUN_PRG14__849a
;     FUN_PRG14__854c
;     FUN_PRG14__a1cc
;     MoveSpriteHorizIfPossible
;     MoveSpriteVerticalIfPossible
;     Player_HitSpriteWithWeapon
;     Player_SetDamagedBySprite
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood__a0ad
;     SpriteBehavior_Garbled3
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Hop
;     SpriteBehavior_Ishiisu
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_KingGrieve_9f65
;     SpriteBehavior_KingGrieve_MoveDown
;     SpriteBehavior_Lilith
;     SpriteBehavior_MoveTowardPlayer
;     SpriteBehavior_Naga
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Pakukame
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura__a077
;     SpriteBehavior_ShadowEura__a12d
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Something_850d
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Zorugeriru__9e13
;     SpriteBehavior__a8d7
;     SpriteBehavior__a91e
;     Sprite_CalculateNewVertPos
;     Sprite_CapToBlockOppositeFalling
;     Sprite_CastMagic
;     Sprite_CheckHitByCastMagic
;     Sprite_ClearFlags
;     Sprite_IsBehaviorNotReady
;     Sprite_Maybe_AddFacingPosX
;     Sprite_Maybe_ResetState
;     Sprite_Maybe_TurnAroundIfAtScreenEdgeHoriz
;     Sprite_Maybe_TurnAroundIfAtScreenEdgeVert
;     Sprite_MoveHorizAndTurnAroundIfNeeded
;     Sprite_MoveVertAndFlipIfNeeded
;     Sprite_SetBehaviorNotReady
;     Sprite_SetBehaviorReady
;     Sprite_SetVisible
;     Sprites_HideSprite
;     Sprites_IsSpriteHidden
;     Sprites_SetCurrentSpriteCanMove
;
CurrentSprites_Flags:                       ; [$02dc]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Flags_7_:                    ; [$02e3]
    .byte $00                               ; [7]:

;
; XREFS:
;     BScript_Op_GoTo
;     BScript_Op_SetPhase
;     BScript_Op_SwitchBehavior
;     FUN_PRG14__9693
;     FUN_PRG14__9699
;     FUN_PRG14__9917
;     FUN_PRG14__9a3c
;     FUN_PRG14__9a61
;     FUN_PRG14__9ac6
;     Player_HandleTouchEnemy
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     SpriteBehavior_BlackOnyxDropFromZoradohna
;     SpriteBehavior_Borabohra
;     SpriteBehavior_BossDeath
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_BuzzAround
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     SpriteBehavior_EnemyUnused18
;     SpriteBehavior_EnemyUnused18__994a
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused39
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_Garbled3
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Ishiisu
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_KingGrieve_9f86
;     SpriteBehavior_KingGrieve_MoveDown
;     SpriteBehavior_Lilith
;     SpriteBehavior_Magman
;     SpriteBehavior_MattockDroppedFromRipasheiku
;     SpriteBehavior_Naga
;     SpriteBehavior_Nash
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Pakukame
;     SpriteBehavior_PendantDroppedFromRipasheiku
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SirGawaineWolfman
;     SpriteBehavior_SpringOfFortress
;     SpriteBehavior_SpringOfJoker
;     SpriteBehavior_SpringOfSky
;     SpriteBehavior_Springs_UpdateFlowing
;     SpriteBehavior_Tamazutsu
;     SpriteBehavior_WingBootsDroppedByZorugeriru
;     SpriteBehavior_Yareeka
;     SpriteBehavior_Zorugeriru
;     SpriteBehavior_Zorugeriru__9e13
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Boss_KingGrieve
;     SpriteUpdateHandler_Boss_Pakukame
;     SpriteUpdateHandler_Boss_Ripasheiku
;     SpriteUpdateHandler_Boss_Zorugeriru
;     SpriteUpdateHandler_Effect_BossDeath
;     SpriteUpdateHandler_Effect_Spring
;     SpriteUpdateHandler_Enemy_Charron
;     SpriteUpdateHandler_Enemy_ExecutionHood
;     SpriteUpdateHandler_Enemy_FireGiant
;     SpriteUpdateHandler_Enemy_Geributa
;     SpriteUpdateHandler_Enemy_GiantStrider
;     SpriteUpdateHandler_Enemy_Grimlock
;     SpriteUpdateHandler_Enemy_Ishiisu
;     SpriteUpdateHandler_Enemy_Magman
;     SpriteUpdateHandler_Enemy_Maskman
;     SpriteUpdateHandler_Enemy_Myconid
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_NecronAides
;     SpriteUpdateHandler_Enemy_Raiden
;     SpriteUpdateHandler_Enemy_SirGawaine_Wolfman
;     SpriteUpdateHandler_Enemy_Snowman
;     SpriteUpdateHandler_Enemy_Tamazutsu
;     SpriteUpdateHandler_Enemy_Unused29
;     SpriteUpdateHandler_Enemy_Unused_CurlyTail
;     SpriteUpdateHandler_Garbled03
;     SpriteUpdateHandler_NPC_King
;     SpriteUpdateHandler_NPC_Walking
;     Sprite_GetBounds
;     Sprite_GetPreviousSpritePhase
;     Sprite_Maybe_ResetState
;     Sprite_SetPhase2
;     Sprites_MaybeResetPhaseAndEnable
;
CurrentSprites_Phases:                      ; [$02e4]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Phases_7_:                   ; [$02eb]
    .byte $00                               ; [7]:

;
; XREFS:
;     FUN_PRG14__9593
;     FUN_PRG14__9699
;     FUN_PRG14__9917
;     FUN_PRG14__9a61
;     FUN_PRG14__9a87
;     FUN_PRG14__9aa1
;     FUN_PRG14__9ac6
;     LAB_PRG14__9735 [$PRG14::9735]
;     Maybe_SpriteBody__99f3
;     SpriteBehavior_Bihoruda
;     SpriteBehavior_Borabohra
;     SpriteBehavior_BossDeath
;     SpriteBehavior_BuzzAround
;     SpriteBehavior_EnemyUnused18__994a
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused39
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_FlashScreenHitPlayer
;     SpriteBehavior_Garbled3
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Ishiisu
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_KingGrieve_9f86
;     SpriteBehavior_KingGrieve_MoveDown
;     SpriteBehavior_LightningBallOrCharron
;     SpriteBehavior_Lilith
;     SpriteBehavior_Magman
;     SpriteBehavior_MoveTowardPlayer
;     SpriteBehavior_Nash
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Pakukame
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_Springs_UpdateFlowing
;     SpriteBehavior_Tamazutsu
;     SpriteBehavior_WalkForward
;     SpriteBehavior_Yareeka
;     SpriteBehavior_Yuinaru
;     SpriteBehavior_Zorugeriru
;     SpriteBehavior__8f9a [$PRG14::8f9a]
;     SpriteBehavior__a8d7
;     SpriteBehavior__a91e
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Effect_Spring
;     SpriteUpdateHandler_Enemy_Bihoruda
;     SpriteUpdateHandler_Enemy_Ishiisu
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_Tamazutsu
;     SpriteUpdateHandler_Enemy_Yuinaru
;     SpriteUpdateHandler_Garbled03
;     Sprite_SetDeathEntity
;
CurrentSprites_BehaviorData2:               ; [$02ec]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; Tick counter used for some behaviors.
;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__9aa1
;     FUN_PRG14__9ac6
;     LAB_PRG14__8fb7 [$PRG14::8fb7]
;     SpriteBehavior_Bihoruda
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_EnemyUnused18
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_Garbled3
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Hop
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_KingGrieve_9f86
;     SpriteBehavior_Lilith
;     SpriteBehavior_MoveTowardPlayer
;     SpriteBehavior_Naga
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Springs_UpdateFlowing
;     SpriteBehavior_WalkForward
;     SpriteBehavior_Yuinaru
;     SpriteBehavior__a8d7
;     SpriteBehavior__a91e
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;============================================================================

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__9aa1
;     FUN_PRG14__9ac6
;     LAB_PRG14__8fb7 [$PRG14::8fb7]
;     SpriteBehavior_Bihoruda
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_EnemyUnused18
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_Garbled3
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Hop
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_KingGrieve_9f86
;     SpriteBehavior_Lilith
;     SpriteBehavior_MoveTowardPlayer
;     SpriteBehavior_Naga
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Springs_UpdateFlowing
;     SpriteBehavior_WalkForward
;     SpriteBehavior_Yuinaru
;     SpriteBehavior__a8d7
;     SpriteBehavior__a91e
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
CurrentSprites_BehaviorData3:               ; [$02f4]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; XXX Some lookup map.
;
; XREFS:
;     FUN_PRG14__9aa1
;     Maybe_SpriteBody__99f3
;     Maybe_Sprite_HandleDeathDrop
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_EnemyUnused18__994a
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_Hop
;     SpriteBehavior_Lilith
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteUpdateHandler_Boss_ShadowEura
;     SpriteUpdateHandler_Coin
;     SpriteUpdateHandler_Magic_83
;     Sprite_SetDeathEntity
;============================================================================

;
; XREFS:
;     FUN_PRG14__9aa1
;     Maybe_SpriteBody__99f3
;     Maybe_Sprite_HandleDeathDrop
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_EnemyUnused18__994a
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_Hop
;     SpriteBehavior_Lilith
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteUpdateHandler_Boss_ShadowEura
;     SpriteUpdateHandler_Coin
;     SpriteUpdateHandler_Magic_83
;     Sprite_SetDeathEntity
;
CurrentSprites_InternalBehaviorStates:      ; [$02fc]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:

;
; XREFS:
;     Game_Init
;
CurrentSprites_InternalBehaviorStates_4_:   ; [$0300]
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:

;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__9917
;     SpriteBehavior_Borabohra
;     SpriteBehavior_Garbled3
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_Pakukame
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_Zorugeriru
;     Sprite_CalcDistanceXToPlayer
;     Sprite_CanClimb
;     Sprite_CheckHitByCastMagic
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprites_CanSpriteWalk
;     Sprites_MoveRight
;     Sprites_MoveRight__86c6
;
CurrentSprites_HitBoxTypes:                 ; [$0304]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:

;
; XREFS:
;     Screen_LoadBlockDataVert
;
CurrentSprites_HitBoxTypes_2_:              ; [$0306]
    .byte $00                               ; [2]:

;
; XREFS:
;     Screen_LoadBlockDataVert
;
CurrentSprites_HitBoxTypes_3_:              ; [$0307]
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_HitBoxTypes_7_:              ; [$030b]
    .byte $00                               ; [7]:


;============================================================================
; XXX Some lookup map.
;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_Hop
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;============================================================================

;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_Hop
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;
CurrentSprites_BehaviorState_XFull:         ; [$030c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; XXX Some lookup map.
;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_MoveVertically
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;============================================================================

;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_MoveVertically
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;
CurrentSprites_BehaviorState_YFull:         ; [$0314]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; XXX Some sprites lookup map.
;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_Hop
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;============================================================================

;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_Hop
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;
CurrentSprites_BehaviorState_XFrac:         ; [$031c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; XXX Some lookup map.
;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_MoveVertically
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;============================================================================

;
; XREFS:
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_MoveVertically
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Unknown_29_SomeSetup
;
CurrentSprites_BehaviorState_YFrac:         ; [$0324]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; Loaded PPU offsets where the first tile of the sprite is stored.
;
; XREFS:
;     BScript_Action_CastMagic
;     CurrentSprite_UpdateState
;     FUN_PRG14__a1cc
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_ExecutionHood__a0ad
;     SpriteBehavior_Pakukame
;     SpriteBehavior_ShadowEura__a12d
;     SpriteBehavior_Zorugeriru__9e13
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;     Sprite_CastMagic
;     Sprite_ReplaceWithMattock
;============================================================================

;
; XREFS:
;     BScript_Action_CastMagic
;     CurrentSprite_UpdateState
;     FUN_PRG14__a1cc
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_ExecutionHood__a0ad
;     SpriteBehavior_Pakukame
;     SpriteBehavior_ShadowEura__a12d
;     SpriteBehavior_Zorugeriru__9e13
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;     Sprite_CastMagic
;     Sprite_ReplaceWithMattock
;
CurrentSprites_PPUOffsets:                  ; [$032c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     GameLoop_LoadSpriteImages
;
CurrentSprites_PPUOffsets_7_:               ; [$0333]
    .byte $00                               ; [7]:


;============================================================================
; Magic type the sprite was hit by
;
; $FF = Not hit by magic
;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;     SpriteBehavior_Zorugeriru__9e13
;     Sprite_CheckHitByCastMagic
;     Sprite_Maybe_ResetState
;     Sprite_SetDeathEntity
;     Sprites_Maybe_UpdateHitByMagic
;============================================================================

;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;     SpriteBehavior_Zorugeriru__9e13
;     Sprite_CheckHitByCastMagic
;     Sprite_Maybe_ResetState
;     Sprite_SetDeathEntity
;     Sprites_Maybe_UpdateHitByMagic
;
CurrentSprites_HitByMagicBehavior:          ; [$0334]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_HitByMagicBehavior_7_:       ; [$033b]
    .byte $00                               ; [7]:

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;     Sprites_Maybe_UpdateHitByMagic
;
CurrentSprites_HitByMagicIFrames:           ; [$033c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:

;
; XREFS:
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_Pakukame
;
CurrentSprites_HP:                          ; [$0344]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:

;
; XREFS:
;     Screen_ClearSprites
;
CurrentSprites_HP_6_:                       ; [$034a]
    .byte $00                               ; [6]:

;
; XREFS:
;     Screen_ClearSprites
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_HP_7_:                       ; [$034b]
    .byte $00                               ; [7]:


;============================================================================
; Counter used after sprite was hit
;
; XREFS:
;     CurrentSprite_UpdateState
;     Maybe_Sprite_HandleDeathDrop
;     Player_HitSpriteWithWeapon
;     _handleHit [$PRG14::804e]
;============================================================================

;
; XREFS:
;     CurrentSprite_UpdateState
;     Maybe_Sprite_HandleDeathDrop
;     Player_HitSpriteWithWeapon
;     _handleHit [$PRG14::804e]
;
CurrentSprites_HitCounter:                  ; [$034c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:

;
; XREFS:
;     Screen_ClearSprites
;
CurrentSprites_HitCounter_6_:               ; [$0352]
    .byte $00                               ; [6]:

;
; XREFS:
;     _handleHit [$PRG14::804e]
;     Screen_ClearSprites
;
CurrentSprites_HitCounter_7_:               ; [$0353]
    .byte $00                               ; [7]:

;
; XREFS:
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_UpdateBehavior
;
CurrentSprites_BehaviorAddrs_L:             ; [$0354]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_BehaviorAddrs_L_7_:          ; [$035b]
    .byte $00                               ; [7]:

;
; XREFS:
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_UpdateBehavior
;
CurrentSprites_BehaviorAddrs_U:             ; [$035c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_BehaviorAddrs_U_7_:          ; [$0363]
    .byte $00                               ; [7]:

;
; XREFS:
;     BScript_Op_SwitchBehavior
;     SpriteBehavior_Hop
;     Sprites_CountdownBehavior
;
CurrentSprites_BehaviorArg1:                ; [$0364]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:


;============================================================================
; Message IDs of the NPC messages
;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchNPC
;     Sprites_LoadSpriteValue
;============================================================================

;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchNPC
;     Sprites_LoadSpriteValue
;
CurrentSprites_Values:                      ; [$036c]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:

;
; XREFS:
;     Sprites_LoadSpriteValue
;
CurrentSprites_Values_7_:                   ; [$0373]
    .byte $00                               ; [7]:

;
; XREFS:
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateThunderOrDeath
;     CastMagic_UpdateTilte
;     CastMagic_UpdateXPosition
;     FUN_PRG14__83a8
;     FUN_PRG14__848a
;     SpriteBehavior_BuzzAround
;     SpriteBehavior_EnemyMagic
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Hop
;     SpriteBehavior_Ishiisu
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_Lilith
;     SpriteBehavior_NecronAides
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SirGawaineWolfman
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_WalkForward
;     SpriteBehavior_Yareeka
;     SpriteBehavior__a91e
;     Sprite_AddPosX
;     Sprite_MoveHorizOneBlockOrTurnAround
;     Sprite_SubtractPosX
;     Sprites_CalcHorizSpriteMovement
;     Sprites_Maybe_UpdateHitByMagic
;
Arg_DeltaX_Frac:                            ; [$0374]
    .byte $00                               ; [$0374] byte

;
; XREFS:
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateThunderOrDeath
;     CastMagic_UpdateTilte
;     CastMagic_UpdateXPosition
;     FUN_PRG14__83a8
;     FUN_PRG14__848a
;     FUN_PRG14__9593
;     SpriteBehavior_Bihoruda
;     SpriteBehavior_BuzzAround
;     SpriteBehavior_EnemyMagic
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_GiantBees
;     SpriteBehavior_Hop
;     SpriteBehavior_Ishiisu
;     SpriteBehavior_KingGrieve
;     SpriteBehavior_Lilith
;     SpriteBehavior_NecronAides
;     SpriteBehavior_ShadowEura
;     SpriteBehavior_SirGawaineWolfman
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_SomethingZoradohna_18
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_WalkForward
;     SpriteBehavior_Yareeka
;     SpriteBehavior_Yuinaru
;     SpriteBehavior__a91e
;     Sprite_AddPosX
;     Sprite_MoveHorizOneBlockOrTurnAround
;     Sprite_SubtractPosX
;     Sprites_CalcHorizSpriteMovement
;     Sprites_Maybe_UpdateHitByMagic
;
Arg_DeltaX_Full:                            ; [$0375]
    .byte $00                               ; [$0375] byte

;
; XREFS:
;     CastMagic_UpdateTilte
;     CastMagic_UpdateYPosition
;     FUN_PRG14__83a8
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_BuzzAround
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_GiantBees
;     SpriteBehavior_KingGrieve_MoveDown
;     SpriteBehavior_MoveVertically
;     SpriteBehavior_Naga
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_Unknown_29
;     Sprite_CalculateNewVertPos
;     Sprites_CalcVerticalSpriteMovement
;
Arg_DeltaY_Frac:                            ; [$0376]
    .byte $00                               ; [$0376] byte

;
; XREFS:
;     CastMagic_UpdateTilte
;     CastMagic_UpdateYPosition
;     FUN_PRG14__83a8
;     SpriteBehavior_Bihoruda
;     SpriteBehavior_BounceAndExpire
;     SpriteBehavior_BuzzAround
;     SpriteBehavior_EnemyUnused36
;     SpriteBehavior_EnemyUnused43
;     SpriteBehavior_ExecutionHood
;     SpriteBehavior_GiantBees
;     SpriteBehavior_KingGrieve_MoveDown
;     SpriteBehavior_MoveVertically
;     SpriteBehavior_Naga
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Ripasheiku
;     SpriteBehavior_SomethingEyeball_17
;     SpriteBehavior_Unknown_29
;     SpriteBehavior_Yuinaru
;     Sprite_CalculateNewVertPos
;     Sprites_CalcVerticalSpriteMovement
;
Arg_DeltaY_Full:                            ; [$0377]
    .byte $00                               ; [$0377] byte


;============================================================================
; Currently-active sprite
;
; XREFS:
;     BScript_Action_RandomlyFlipXDirection
;     BScript_Action_RandomlyFlipYDirection
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CanMoveInDirection
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_HandleFall
;     CurrentSprite_UpdateState
;     FUN_PRG14__84f4
;     FUN_PRG14__9a61
;     LAB_PRG14__8043 [$PRG14::8043]
;     MoveSpriteHorizIfPossible
;     MoveSpriteVerticalIfPossible
;     Player_AddExperienceFromSprite
;     Player_CheckHandlePressUpOnNPC
;     Player_CheckShieldHitByMagic
;     Player_HandleHitByMagic
;     Player_HandleShieldHitByMagic
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchEnemyMagic
;     Player_HandleTouchItem
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_FlashScreenHitPlayer
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Pakukame
;     SpriteBehavior_RestoreXRegister
;     SpriteBehavior_Something_850d
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;     Sprite_CheckHitByCastMagic
;     Sprite_HandleDeathDropIfPossible
;     Sprites_HasAnyEnemyOnScreen
;     Sprites_MoveRight__86c6
;     Sprites_SetBlockIsMovingResult
;     Sprites_SetCurrentSpriteCanMove
;     Sprites_UpdateAllStates
;     Sprites_UpdateBehavior
;     _afterFarJump [$PRG14::89ff]
;     _updateSpriteLoop [$PRG14::8011]
;     CastMagic_CalculateVisibility
;     GameLoop_LoadSpriteImages
;     Player_PickUpRedPotion
;     Sprites_PopulateNextAvailableSprite
;============================================================================

;
; XREFS:
;     BScript_Action_RandomlyFlipXDirection
;     BScript_Action_RandomlyFlipYDirection
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CanMoveInDirection
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_HandleFall
;     CurrentSprite_UpdateState
;     FUN_PRG14__84f4
;     FUN_PRG14__9a61
;     LAB_PRG14__8043 [$PRG14::8043]
;     MoveSpriteHorizIfPossible
;     MoveSpriteVerticalIfPossible
;     Player_AddExperienceFromSprite
;     Player_CheckHandlePressUpOnNPC
;     Player_CheckShieldHitByMagic
;     Player_HandleHitByMagic
;     Player_HandleShieldHitByMagic
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchEnemyMagic
;     Player_HandleTouchItem
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_FlashScreenHitPlayer
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Pakukame
;     SpriteBehavior_RestoreXRegister
;     SpriteBehavior_Something_850d
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;     Sprite_CheckHitByCastMagic
;     Sprite_HandleDeathDropIfPossible
;     Sprites_HasAnyEnemyOnScreen
;     Sprites_MoveRight__86c6
;     Sprites_SetBlockIsMovingResult
;     Sprites_SetCurrentSpriteCanMove
;     Sprites_UpdateAllStates
;     Sprites_UpdateBehavior
;     _afterFarJump [$PRG14::89ff]
;     _updateSpriteLoop [$PRG14::8011]
;     CastMagic_CalculateVisibility
;     GameLoop_LoadSpriteImages
;     Player_PickUpRedPotion
;     Sprites_PopulateNextAvailableSprite
;
CurrentSpriteIndex:                         ; [$0378]
    .byte $00                               ; [$0378] byte

;
; XREFS:
;     FUN_PRG14__9917
;     Maybe_BodyHandler__9a57
;     Maybe_BodyHandler__9a7a
;     Maybe_SpriteBody__99f3
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
Sprite12BodyPartHandler:                    ; [$0379]
    .byte $00                               ; [0]:

;
; XREFS:
;     FUN_PRG14__9917
;     Maybe_SpriteBody__99f3
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
Sprite12BodyPartHandler_1_:                 ; [$037a]
    .byte $00                               ; [1]:

;
; XREFS:
;     FUN_PRG14__9917
;     Maybe_SpriteBody__99f3
;     SpriteBehavior_EnemyUnused18__994a
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
Sprite12BodyPartHandler_2_:                 ; [$037b]
    .byte $00                               ; [2]:

;
; XREFS:
;     FUN_PRG14__9917
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
Sprite12BodyPartHandler_3_:                 ; [$037c]
    .byte $00                               ; [3]:

;
; XREFS:
;     FUN_PRG14__9917
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
Sprite12BodyPartHandler_4_:                 ; [$037d]
    .byte $00                               ; [4]:

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__9ac6
;     SpriteBehavior_EnemyUnused18__994a
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;
Sprite12BodyPartHandler_5_:                 ; [$037e]
    .byte $00                               ; [5]:

;
; XREFS:
;     Player_HitSpriteWithWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Something_Maybe_WeaponDistanceX:            ; [$037f]
    .byte $00                               ; [$037f] byte

;
; XREFS:
;     Player_HitSpriteWithWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Something_Maybe_WeaponDistanceY:            ; [$0380]
    .byte $00                               ; [$0380] byte

    .byte $00,$00                           ; [$0382] undefined

;
; XREFS:
;     FUN_PRG14__a2eb
;     SpriteBehavior_KingGrieve_9f65
;     SpriteBehavior_NecronAides
;     SpriteBehavior_Pakukame
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_SirGawaineWolfman
;     SpriteBehavior_Unknown_29
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Boss_KingGrieve
;     SpriteUpdateHandler_Boss_Ripasheiku
;     SpriteUpdateHandler_Boss_Rokusutahn
;     SpriteUpdateHandler_Boss_Zoradohna
;     SpriteUpdateHandler_Boss_Zorugeriru
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_Fountain
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_EnemyMagic
;     SpriteUpdateHandler_Enemy_Charron
;     SpriteUpdateHandler_Enemy_ExecutionHood
;     SpriteUpdateHandler_Enemy_FireGiant
;     SpriteUpdateHandler_Enemy_Geributa
;     SpriteUpdateHandler_Enemy_GiantBees
;     SpriteUpdateHandler_Enemy_GiantStrider
;     SpriteUpdateHandler_Enemy_Grimlock
;     SpriteUpdateHandler_Enemy_Hornet
;     SpriteUpdateHandler_Enemy_Ikeda
;     SpriteUpdateHandler_Enemy_Ishiisu
;     SpriteUpdateHandler_Enemy_Lamprey
;     SpriteUpdateHandler_Enemy_Lilith
;     SpriteUpdateHandler_Enemy_Magman
;     SpriteUpdateHandler_Enemy_Maskman
;     SpriteUpdateHandler_Enemy_MuppetGuy
;     SpriteUpdateHandler_Enemy_Myconid
;     SpriteUpdateHandler_Enemy_Naga
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_NecronAides
;     SpriteUpdateHandler_Enemy_Raiden
;     SpriteUpdateHandler_Enemy_Snowman
;     SpriteUpdateHandler_Enemy_Sugata
;     SpriteUpdateHandler_Enemy_Unused29
;     SpriteUpdateHandler_Enemy_Unused_CurlyTail
;     SpriteUpdateHandler_Enemy_Unused_SnakeRoundPart
;     SpriteUpdateHandler_Enemy_Unused_WingedSkeleton
;     SpriteUpdateHandler_Enemy_Yareeka
;     SpriteUpdateHandler_Enemy_Zombie
;     SpriteUpdateHandler_Magic_81
;     SpriteUpdateHandler_NPC_ArmorSalesman
;     SpriteUpdateHandler_NPC_King
;     SpriteUpdateHandler_NPC_MagicTeacher
;     SpriteUpdateHandler_NPC_MartialArts
;     SpriteUpdateHandler_NPC_Priest
;     SpriteUpdateHandler_NPC_Walking
;     SpriteUpdateHandler_TODO_Garbled10
;     Sprites_UpdateAll
;
SpriteUpdateCounter:                        ; [$0383]
    .byte $00                               ; [$0383] byte

;
; XREFS:
;     FUN_PRG14__a1cc
;     SpriteBehavior_KingGrieve_9f65
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura__a077
;     SpriteBehavior_ShadowEura__a12d
;     Sprite_CastMagic
;
CurrentSprite_Arg_CastMagicX:               ; [$0384]
    .byte $00                               ; [$0384] byte

;
; XREFS:
;     FUN_PRG14__a1cc
;     SpriteBehavior_KingGrieve_9f65
;     SpriteBehavior_Ripasheiku_CastMagicOrUpdatePos
;     SpriteBehavior_ShadowEura__a077
;     SpriteBehavior_ShadowEura__a12d
;     Sprite_CastMagic
;
CurrentSprite_Arg_CastMagicY:               ; [$0385]
    .byte $00                               ; [$0385] byte


;============================================================================
; ROM bank where images of the current sprite can be found.
;
; This is set based on the table in
; SPRITE_IMAGE_BANKS.
;
; XREFS:
;     CurrentSprite_LoadTilesInfo
;     Sprites_LoadImageForCurrentSprite
;     Sprites_StoreBankForCurrentSprite
;============================================================================

;
; XREFS:
;     CurrentSprite_LoadTilesInfo
;     Sprites_LoadImageForCurrentSprite
;     Sprites_StoreBankForCurrentSprite
;
CurrentSprite_TilesBank:                    ; [$0386]
    .byte $00                               ; [$0386] byte

    .byte $00,$00                           ; [$0388] undefined


;============================================================================
; X coordinate of the sprite being processed.
;
; XREFS:
;     Screen_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;============================================================================

;
; XREFS:
;     Screen_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprite_XPos:                         ; [$0389]
    .byte $00                               ; [$0389] byte


;============================================================================
; Y coordinate of the sprite being processed.
;
; XREFS:
;     Screen_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;============================================================================

;
; XREFS:
;     Screen_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprite_YPos:                         ; [$038a]
    .byte $00                               ; [$038a] byte


;============================================================================
; Entity ID of the sprite being processed.
;
; XREFS:
;     CurrentSprite_LoadTilesInfo
;     GameLoop_LoadSpriteImages
;     Screen_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;     Sprites_StoreBankForCurrentSprite
;============================================================================

;
; XREFS:
;     CurrentSprite_LoadTilesInfo
;     GameLoop_LoadSpriteImages
;     Screen_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;     Sprites_StoreBankForCurrentSprite
;
CurrentSprite_Entity:                       ; [$038b]
    .byte $00                               ; [$038b] SpriteEntity


;============================================================================
; Numeric value of the sprite being processed.
;
; For items like coins and bread, this will contain the value
; to add to the player's gold and HP, respectively.
;
; For NPCs, this will be the IScript entrypoint index to
; activate upon interaction.
;
; XREFS:
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchNPC
;============================================================================

;
; XREFS:
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchNPC
;
CurrentSprite_Value:                        ; [$038c]
    .byte $00                               ; [$038c] byte


;============================================================================
; Index into HUD_ATTRIBUTE_DATA_BY_INDEX where the
; HUD palette can be found.
;
; XREFS:
;     TextBox_GetBackgroundAttributeData
;     Screen_LoadUIPalette
;     UI_SetHUDPPUAttributes
;============================================================================

;
; XREFS:
;     TextBox_GetBackgroundAttributeData
;     Screen_LoadUIPalette
;     UI_SetHUDPPUAttributes
;
UI_AttributeDataIndex:                      ; [$038d]
    .byte $00                               ; [$038d] byte

    .byte $00,$00                           ; [$038f] undefined


;============================================================================
; The player's experience as a 16-bit value.
;
; This is in Lower, Upper byte order.
;
; XREFS:
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Game_Start
;     Player_CheckReachedNextTitle
;     Player_UpdateExperience
;     UI_DrawPlayerExperience
;============================================================================

;
; XREFS:
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Game_Start
;     Player_CheckReachedNextTitle
;     Player_UpdateExperience
;     UI_DrawPlayerExperience
;
Experience:                                 ; [$0390]
    .byte $00                               ; [$0390] byte


;============================================================================
; Upper byte of player's experience
;
; XREFS:
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Game_Start
;     Player_CheckReachedNextTitle
;     Player_UpdateExperience
;     UI_DrawPlayerExperience
;============================================================================

;
; XREFS:
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Game_Start
;     Player_CheckReachedNextTitle
;     Player_UpdateExperience
;     UI_DrawPlayerExperience
;
Experience_U:                               ; [$0391]
    .byte $00                               ; [$0391] byte


;============================================================================
; The player's gold as a 24-bit value.
;
; This is in Lower, Middle, Upper byte order.
;
; XREFS:
;     IScriptAction_IfPlayerHasGold
;     IScripts_CheckEnoughMoney
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawGoldValue
;============================================================================

;
; XREFS:
;     IScriptAction_IfPlayerHasGold
;     IScripts_CheckEnoughMoney
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawGoldValue
;
Gold:                                       ; [$0392]
    .byte $00                               ; [$0392] byte


;============================================================================
; Middle byte of player's gold
;
; XREFS:
;     IScriptAction_IfPlayerHasGold
;     IScripts_CheckEnoughMoney
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawGoldValue
;============================================================================

;
; XREFS:
;     IScriptAction_IfPlayerHasGold
;     IScripts_CheckEnoughMoney
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawGoldValue
;
Gold_M:                                     ; [$0393]
    .byte $00                               ; [$0393] byte


;============================================================================
; Upper byte of player's gold
;
; XREFS:
;     IScriptAction_IfPlayerHasGold
;     IScripts_CheckEnoughMoney
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawGoldValue
;============================================================================

;
; XREFS:
;     IScriptAction_IfPlayerHasGold
;     IScripts_CheckEnoughMoney
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawGoldValue
;
Gold_U:                                     ; [$0394]
    .byte $00                               ; [$0394] byte

    .byte $00,$00,$00,$00                   ; [$0396] undefined


;============================================================================
; Temporary variable used when adding or showing player HP.
;
; XREFS:
;     IScriptAction_AddHP
;     UI_DrawPlayerHPValue
;============================================================================

;
; XREFS:
;     IScriptAction_AddHP
;     UI_DrawPlayerHPValue
;
Temp_AddedHPValue:                          ; [$0399]
    .byte $00                               ; [$0399] byte


;============================================================================
; The player's available MP.
;
; XREFS:
;     IScriptAction_AddMP
;     Game_Start
;     Player_AddMP
;     Player_FillHPAndMP
;     Player_ReduceMP
;     Player_SetMP
;     Player_Spawn
;     UI_DrawHUD
;============================================================================

;
; XREFS:
;     IScriptAction_AddMP
;     Game_Start
;     Player_AddMP
;     Player_FillHPAndMP
;     Player_ReduceMP
;     Player_SetMP
;     Player_Spawn
;     UI_DrawHUD
;
Player_MP:                                  ; [$039a]
    .byte $00                               ; [$039a] byte

;
; XREFS:
;     Player_CheckShieldHitByMagic
;     Player_DrawShield
;
Player_ShieldPositionX:                     ; [$039b]
    .byte $00                               ; [$039b] byte

;
; XREFS:
;     Player_CheckShieldHitByMagic
;     Player_DrawShield
;
Player_ShieldPositionY:                     ; [$039c]
    .byte $00                               ; [$039c] byte


;============================================================================
; Inventory of the player's weapons.
;
; They can have up to 4 weapons in the inventory.
;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b29]
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     Player_PickUpDragonSlayer
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b29]
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     Player_PickUpDragonSlayer
;
WeaponInventory:                            ; [$039d]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:

;
; XREFS:
;     Player_PickUpDragonSlayer
;
WeaponInventory_3_:                         ; [$03a0]
    .byte $00                               ; [3]:


;============================================================================
; Inventory of the player's armor.
;
; They can have up to 4 armors in the inventory.
;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2a]
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     Player_PickUpBattleSuit
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2a]
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     Player_PickUpBattleSuit
;
ArmorInventory:                             ; [$03a1]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:

;
; XREFS:
;     Player_PickUpBattleSuit
;
ArmorInventory_3_:                          ; [$03a4]
    .byte $00                               ; [3]:


;============================================================================
; Inventory of the player's shields.
;
; They can have up to 4 shields in the inventory.
;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2b]
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     Player_PickUpBattleHelmet
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2b]
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     Player_PickUpBattleHelmet
;
ShieldInventory:                            ; [$03a5]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:

;
; XREFS:
;     Player_PickUpBattleHelmet
;
ShieldInventory_3_:                         ; [$03a8]
    .byte $00                               ; [3]:


;============================================================================
; Inventory of the player's magic spells.
;
; They can have up to 5 magic spells in the inventory.
;
; XXX It seems there's only room for 4 though? Check on this.
;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2c]
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2c]
;
MagicInventory:                             ; [$03a9]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:


;============================================================================
; Inventory of the player's items.
;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2d]
;     Player_PickUpItem
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2d]
;     Player_PickUpItem
;
ItemInventory:                              ; [$03ad]
    .byte $00                               ; [0]: [0]:
    .byte $00                               ; [0]: [1]:
    .byte $00                               ; [0]: [2]:
    .byte $00                               ; [0]: [3]:
    .byte $00                               ; [0]: [4]:
    .byte $00                               ; [0]: [5]:
    .byte $00                               ; [0]: [6]:
    .byte $00                               ; [0]: [7]:
    .byte $00                               ; [1]: [0]:
    .byte $00                               ; [1]: [1]:
    .byte $00                               ; [1]: [2]:
    .byte $00                               ; [1]: [3]:
    .byte $00                               ; [1]: [4]:
    .byte $00                               ; [1]: [5]:
    .byte $00                               ; [1]: [6]:
    .byte $00                               ; [1]: [7]:


;============================================================================
; The currently-selected weapon:
;
; 0 = Hand Dagger
; 1 = Long Sword
; 2 = Giant Blade
; 3 = Dragon Slayer
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_ShowStatusMenu
;     Player_Equip
;     Player_LacksItem
;     Player_SetStartGameState
;     Shop_GetPlayerHasSelectedItem
;     PlayerDeath_ResetSelectedItemState
;     Game_ExitBuilding
;     Player_HandleDeath
;     Player_SetWeapon
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_ShowStatusMenu
;     Player_Equip
;     Player_LacksItem
;     Player_SetStartGameState
;     Shop_GetPlayerHasSelectedItem
;     PlayerDeath_ResetSelectedItemState
;     Game_ExitBuilding
;     Player_HandleDeath
;     Player_SetWeapon
;
Inventories:                                ; [$03bd]
SelectedWeapon:
    .byte $00                               ; [$03bd] WeaponInventory


;============================================================================
; The currently-selected armor:
;
; 0 = Leather Armor
; 1 = Studded Mail
; 2 = Full Plate
; 3 = Battle Suit
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_ApplyDamage
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;     Player_HandleDeath
;     Player_LoadArmorTilesToPPU
;     Player_SetArmor
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_ApplyDamage
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;     Player_HandleDeath
;     Player_LoadArmorTilesToPPU
;     Player_SetArmor
;
SelectedArmor:                              ; [$03be]
    .byte $00                               ; [$03be] ArmorInventory


;============================================================================
; The currently-selected shield.
;
; 0 = Small Shield
; 1 = Large Shield
; 2 = Magic Shield
; 3 = Battle Helmet
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_CheckShieldHitByMagic
;     Player_DrawShield
;     Player_HandleHitByMagic
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;     Player_HandleDeath
;     Player_LoadArmorTilesToPPU
;     Player_LoadShieldTilesToPPU
;     Player_SetShield
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_CheckShieldHitByMagic
;     Player_DrawShield
;     Player_HandleHitByMagic
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;     Player_HandleDeath
;     Player_LoadArmorTilesToPPU
;     Player_LoadShieldTilesToPPU
;     Player_SetShield
;
SelectedShield:                             ; [$03bf]
    .byte $00                               ; [$03bf] ShieldInventory


;============================================================================
; The currently-selected magic spell.
;
; 0x00 = Deluge
; 0x01 = Thunder
; 0x02 = Fire
; 0x03 = Death
; 0x04 = Tilte
; 0xFF = None
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetMagic
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_CastMagic
;     Player_HandleDeath
;     Player_ReduceMP
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetMagic
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_CastMagic
;     Player_HandleDeath
;     Player_ReduceMP
;
SelectedMagic:                              ; [$03c0]
    .byte $00                               ; [$03c0] SelectedMagic


;============================================================================
; The currently-selected item:
;
; 0x00 = Ring of Elf
; 0x01 = Ring of Ruby
; 0x02 = Ring of Dworf
; 0x03 = Demons Ring
; 0x04 = Key A
; 0x05 = Key K
; 0x06 = Key Q
; 0x07 = Key J
; 0x08 = Key Jo
; 0x09 = Mattock
; 0x0A = Magical Rod
; 0x0B = Crystal
; 0x0C = Lamp
; 0x0D = Hour Glass
; 0x0E = Book
; 0x0F = Wing Boots
; 0x10 = Red Potion
; 0x11 = Poison
; 0x12 = Elixir
; 0x13 = Pendant
; 0x14 = Black Onyx
; 0x15 = Fire Crystal
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     GameLoop_CheckUseCurrentItem
;     Game_OpenDoorWithAKey
;     Game_OpenDoorWithJKey
;     Game_OpenDoorWithJoKey
;     Game_OpenDoorWithKKey
;     Game_OpenDoorWithQKey
;     Game_UnlockDoorWithUsableItem
;     Player_ClearSelectedItem
;     Player_HandleDeath
;     Player_SetItem
;     UI_DrawSelectedItem
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     GameLoop_CheckUseCurrentItem
;     Game_OpenDoorWithAKey
;     Game_OpenDoorWithJKey
;     Game_OpenDoorWithJoKey
;     Game_OpenDoorWithKKey
;     Game_OpenDoorWithQKey
;     Game_UnlockDoorWithUsableItem
;     Player_ClearSelectedItem
;     Player_HandleDeath
;     Player_SetItem
;     UI_DrawSelectedItem
;
SelectedItem:                               ; [$03c1]
    .byte $00                               ; [$03c1] ItemInventory


;============================================================================
; Number of weapons in the player's inventory
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_ShowSubmenu
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Player_SetStartGameState
;     Shop_GetPlayerHasSelectedItem
;     Player_InitInventoryState
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     Player_PickUpBattleSuit
;     Player_PickUpDragonSlayer
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_ShowSubmenu
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Player_SetStartGameState
;     Shop_GetPlayerHasSelectedItem
;     Player_InitInventoryState
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     Player_PickUpBattleSuit
;     Player_PickUpDragonSlayer
;
AllInventories:                             ; [$03c2]
NumberOfWeapons:
    .byte $00                               ; [$03c2] byte


;============================================================================
; Number of armors in the player's inventory
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     Player_PickUpBattleSuit
;     Player_PickUpDragonSlayer
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     Player_PickUpBattleSuit
;     Player_PickUpDragonSlayer
;
NumberOfArmors:                             ; [$03c3]
    .byte $00                               ; [$03c3] byte


;============================================================================
; Number of shields in the player's inventory
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     Player_PickUpBattleHelmet
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     Player_PickUpBattleHelmet
;
NumberOfShields:                            ; [$03c4]
    .byte $00                               ; [$03c4] byte


;============================================================================
; Number of magic spells in the player's inventory
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;
NumberOfMagicSpells:                        ; [$03c5]
    .byte $00                               ; [$03c5] byte


;============================================================================
; Number of items in the player's inventory
;
; XREFS:
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;     Player_PickUpItem
;============================================================================

;
; XREFS:
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Player_InitInventoryState
;     Player_PickUpItem
;
NumberOfItems:                              ; [$03c6]
    .byte $00                               ; [$03c6] byte


;============================================================================
; The loaded portrait ID from an IScript.
;
; This will be 0xFF if unset.
;
; If set, the player won't be drawn, and instead portrait
; data will be loaded, displayed, and animated.
;
; XREFS:
;     IScriptAction_ShowSellMenu
;     CurrentSprite_UpdateState
;     Player_DrawShield
;     Player_DrawWeapon
;     IScripts_ClearPortraitImage
;     IScripts_DrawPortraitAnimationFrame
;     IScripts_GetPortraitOffset
;     IScripts_LoadPortraitTiles
;     IScripts_LoadPortraitTilesAddress
;     Player_DrawBody
;     Screen_ClearSprites
;============================================================================

;
; XREFS:
;     IScriptAction_ShowSellMenu
;     CurrentSprite_UpdateState
;     Player_DrawShield
;     Player_DrawWeapon
;     IScripts_ClearPortraitImage
;     IScripts_DrawPortraitAnimationFrame
;     IScripts_GetPortraitOffset
;     IScripts_LoadPortraitTiles
;     IScripts_LoadPortraitTilesAddress
;     Player_DrawBody
;     Screen_ClearSprites
;
IScript_PortraitID:                         ; [$03c7]
    .byte $00                               ; [$03c7] byte

;
; XREFS:
;     PlayerDeath_ResetSelectedItemState
;     Player_DrawWeapon
;     Player_GetNormalizedWeaponID
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Player_LoadWeaponTilesToPPU
;     Player_SetWeapon
;
Player_CurWeapon:                           ; [$03c8]
    .byte $00                               ; [$03c8] WeaponInventory

;
; XREFS:
;     Area_HandleBreakableFloor
;     Area_SetBlocks
;     Area_SetBlocks_SetAttributes
;     Area_SetBlocks_WriteBlockData12
;     Area_SetBlocks_WriteBlockData34
;     Player_UseMattock
;
Arg_BlockAttributesIndex:                   ; [$03c9]
    .byte $00                               ; [$03c9] byte

    .byte $00,$00,$00,$00                   ; [$03cb] undefined

;
; XREFS:
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_EnemyUnused18_SomethingSetBlocks
;
Something_UnusedSprite_BlockOffset:         ; [$03ce]
    .byte $00                               ; [$03ce] byte

;
; XREFS:
;     SpriteBehavior_EnemyUnused18__9991
;     SpriteBehavior_EnemyUnused18_SomethingSetBlocks
;
Something_UnusedSprite_ScreenBufferOffset:  ; [$03cf]
    .byte $00                               ; [$03cf] byte

;
; XREFS:
;     Fog_OnTick
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     Player_HandleDeath
;     Screen_NextTransitionState
;     Screen_SetupNew
;     UNUSED_WriteCurrentBackgroundPalette
;
Screen_PaletteIndex:                        ; [$03d0]
    .byte $00                               ; [$03d0] Palette

;
; XREFS:
;     Area_ScrollTo
;     EndGame_MoveToKingsRoom
;     Game_BeginExitBuilding
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToInside
;     ScreenEvents_HandleBoss
;     _afterFarJump [$PRG15_MIRROR::c603]
;
Areas_DefaultMusic:                         ; [$03d1]
    .byte $00                               ; [$03d1] Music

;
; XREFS:
;     Game_BeginExitBuilding
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;
Area_Music_Outside:                         ; [$03d2]
    .byte $00                               ; [$03d2] byte


;============================================================================
; Palette index data.
;
; XREFS:
;     IScripts_ClearPortraitImage
;     IScripts_LoadPortraitTiles
;============================================================================

;
; The saved palette index, when temporarily switching to
; a new one.
;
; This is used in IScripts.
;
;
; XREFS:
;     IScripts_ClearPortraitImage
;     IScripts_LoadPortraitTiles
;
Palette_SavedIndex:                         ; [$03d3]
    .byte $00                               ; [$03d3] byte


;
; The current palette index.
;
; This is set when loading a new palette, and used
; exclusively for the process of restoring palette state
; after showing portraits in IScripts.
;
;
; XREFS:
;     IScripts_LoadPortraitTiles
;     Screen_LoadSpritePalette
;
Palette_SpritePaletteIndex:                 ; [$03d4]
    .byte $00                               ; [$03d4] byte


;============================================================================
; Region and screen information.
;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;============================================================================

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Area_SavedArea:                             ; [$03d5]
    .byte $00                               ; [$03d5] byte

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Area_SavedScreen:                           ; [$03d6]
    .byte $00                               ; [$03d6] byte

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Screen_SavedPalette:                        ; [$03d7]
    .byte $00                               ; [$03d7] byte

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Player_SavedPosXY:                          ; [$03d8]
    .byte $00                               ; [$03d8] byte

;
; XREFS:
;     EndGame_MoveToKingsRoom
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;
Building_TilesIndex:                        ; [$03d9]
    .byte $00                               ; [$03d9] byte

;
; XREFS:
;     EndGame_MoveToKingsRoom
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;
Area_DestScreen:                            ; [$03da]
    .byte $00                               ; [$03da] byte

;
; XREFS:
;     Player_HandleDeath
;     Screen_NextTransitionState
;
Screen_TransitionCounter:                   ; [$03db]
    .byte $00                               ; [$03db] byte

;
; XREFS:
;     Screen_NextTransitionState
;
Screen_FadeOutCounter:                      ; [$03dc]
    .byte $00                               ; [$03dc] byte

;
; XREFS:
;     Player_DrawDeathAnimation
;     Player_HandleDeath
;
Player_DeathAnimationPhase:                 ; [$03dd]
    .byte $00                               ; [$03dd] byte

;
; XREFS:
;     Player_DrawDeathAnimation
;     Player_HandleDeath
;
Player_DeathAnimationCounter:               ; [$03de]
    .byte $00                               ; [$03de] byte

    .byte $00,$00,$00                       ; [$03e0] undefined

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     Player_CheckShieldHitByMagic
;
SpriteBox_Left:                             ; [$03e2]
    .byte $00                               ; [$03e2] byte

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     Player_CheckShieldHitByMagic
;
SpriteBox_Top:                              ; [$03e3]
    .byte $00                               ; [$03e3] byte

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     Player_CheckShieldHitByMagic
;
SpriteBox_Width:                            ; [$03e4]
    .byte $00                               ; [$03e4] byte

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     Player_CheckShieldHitByMagic
;
SpriteBox_Height:                           ; [$03e5]
    .byte $00                               ; [$03e5] byte


;============================================================================
; IDs of blocks in the last column of screen to the left
;
; XREFS:
;     Area_CanPlayerMoveLeft
;     Area_LoadScrollDataRight
;============================================================================

;
; XREFS:
;     Area_CanPlayerMoveLeft
;     Area_LoadScrollDataRight
;
LastColumnLeftScreen:                       ; [$03e6]
    .byte $00                               ; [0]:

;
; XREFS:
;     Area_LoadScrollDataRight
;
LastColumnLeftScreen_1_:                    ; [$03e7]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:


;============================================================================
; IDs of blocks in the first column of screen to the right
;
; XREFS:
;     Area_CanMoveUp
;     Area_LoadScrollDataRight
;============================================================================

;
; XREFS:
;     Area_CanMoveUp
;     Area_LoadScrollDataRight
;
FirstColumnInRightScreen:                   ; [$03f6]
    .byte $00                               ; [0]:

;
; XREFS:
;     Area_LoadScrollDataRight
;
FirstColumnInRightScreen_1_:                ; [$03f7]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:

;
; XREFS:
;     Game_Init
;
FirstColumnInRightScreen_10_:               ; [$0400]
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:


;============================================================================
; IDs of blocks in the last row of screen above
;
; XREFS:
;     Area_CanPlayerMoveUp
;     Area_LoadScrollDataRight
;============================================================================

;
; XREFS:
;     Area_CanPlayerMoveUp
;     Area_LoadScrollDataRight
;
LastRowAboveScreen:                         ; [$0406]
    .byte $00                               ; [0]:

;
; XREFS:
;     Area_LoadScrollDataRight
;
LastRowAboveScreen_1_:                      ; [$0407]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:


;============================================================================
; IDs of blocks in the first row of screen below
;
; XREFS:
;     Area_LoadScrollDataRight
;     Player_CheckIfPassable
;============================================================================

;
; XREFS:
;     Area_LoadScrollDataRight
;     Player_CheckIfPassable
;
FirstRowBelowScreen:                        ; [$0416]
    .byte $00                               ; [0]:

;
; XREFS:
;     Area_LoadScrollDataRight
;
FirstRowBelowScreen_1_:                     ; [$0417]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:


;============================================================================
; Flag indicating whether updates to sprites are paused.
;
; This prevents sprite movement or collision handling when
; set.
;
; XREFS:
;     Sprites_UpdateAll
;     Game_DrawScreenInFrozenState
;============================================================================

;
; XREFS:
;     Sprites_UpdateAll
;     Game_DrawScreenInFrozenState
;
Sprites_UpdatesPaused:                      ; [$0426]
    .byte $00                               ; [$0426] bool


;============================================================================
; Duration of the pointment
;
; XREFS:
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     SpriteBehavior_Ointment
;     Game_ClearTimedItems
;     Game_DecOintmentDuration
;     LimitItemDurations
;     Player_PickUpOintment
;============================================================================

;
; XREFS:
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     SpriteBehavior_Ointment
;     Game_ClearTimedItems
;     Game_DecOintmentDuration
;     LimitItemDurations
;     Player_PickUpOintment
;
DurationOintment:                           ; [$0427]
    .byte $00                               ; [$0427] byte


;============================================================================
; Duration of the gloves
;
; XREFS:
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_Glove
;     Game_ClearTimedItems
;     Game_DecGloveDuration
;     Player_PickUpGlove
;============================================================================

;
; XREFS:
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_Glove
;     Game_ClearTimedItems
;     Game_DecGloveDuration
;     Player_PickUpGlove
;
DurationGlove:                              ; [$0428]
    .byte $00                               ; [$0428] byte


;============================================================================
; Duration of the wing boots
;
; XREFS:
;     Game_ClearTimedItems
;     Game_DecWingBootsDuration
;     Player_UseWingBoots
;============================================================================

;
; XREFS:
;     Game_ClearTimedItems
;     Game_DecWingBootsDuration
;     Player_UseWingBoots
;
DurationWingBoots:                          ; [$0429]
    .byte $00                               ; [$0429] byte


;============================================================================
; Duration of the active hour glass
;
; XREFS:
;     Sprites_UpdateAll
;     Sprites_UpdateBehavior
;     Game_ClearTimedItems
;     Game_DecHourGlassDuration
;     LimitItemDurations
;     Player_UseHourGlass
;============================================================================

;
; XREFS:
;     Sprites_UpdateAll
;     Sprites_UpdateBehavior
;     Game_ClearTimedItems
;     Game_DecHourGlassDuration
;     LimitItemDurations
;     Player_UseHourGlass
;
DurationHourGlass:                          ; [$042a]
    .byte $00                               ; [$042a] byte


;============================================================================
; Key requirement for the current door
;
; XREFS:
;     Game_RunDoorRequirementHandler
;     Game_UnlockDoor
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToOutside
;============================================================================

;
; XREFS:
;     Game_RunDoorRequirementHandler
;     Game_UnlockDoor
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToOutside
;
CurrentDoor_KeyRequirement:                 ; [$042b]
    .byte $00                               ; [$042b] byte


;============================================================================
; 0x01 = Black Onyx
; 0x02 = Pendant
; 0x04 = Magical Rod
; 0x08 = Elixir
; 0x10 = Demons Ring
; 0x20 = Ring of Dworf
; 0x40 = Ring of Ruby
; 0x80 = Ring of Elf
;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_ShowStatusMenu
;     Player_AddSpecialItem
;     Player_LacksItem
;     Player_RemoveItem
;     Player_SetStartGameState
;     Shop_GetPlayerHasSelectedItem
;     Player_ApplyDamage
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_BlackOnyxDropFromZoradohna
;     SpriteBehavior_PendantDroppedFromRipasheiku
;     SpriteBehavior_ShowMagicalRod
;     Game_OpenDoorWithDemonsRing
;     Game_OpenDoorWithRingOfDworf
;     Game_OpenDoorWithRingOfElf
;     Player_CheckPushingBlock
;     Player_PickUpBlackOnyx
;     Player_PickUpElixir
;     Player_ReduceHP
;     Player_UseElixir
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_ShowStatusMenu
;     Player_AddSpecialItem
;     Player_LacksItem
;     Player_RemoveItem
;     Player_SetStartGameState
;     Shop_GetPlayerHasSelectedItem
;     Player_ApplyDamage
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_BlackOnyxDropFromZoradohna
;     SpriteBehavior_PendantDroppedFromRipasheiku
;     SpriteBehavior_ShowMagicalRod
;     Game_OpenDoorWithDemonsRing
;     Game_OpenDoorWithRingOfDworf
;     Game_OpenDoorWithRingOfElf
;     Player_CheckPushingBlock
;     Player_PickUpBlackOnyx
;     Player_PickUpElixir
;     Player_ReduceHP
;     Player_UseElixir
;
SpecialItems:                               ; [$042c]
    .byte $00                               ; [$042c] SpecialItemsBits


;============================================================================
; Special flags for objectives.
;
; 0x01 = Spring of Trunk has been completed (maybe?)
; 0x02 = Spring of Trunk quest has started (maybe?)
; 0x10 = Mattock collected
; 0x20 = Path to Mascon was opened
;
; XREFS:
;     IScriptAction_IfQuestCompleted
;     IScriptAction_SetQuestComplete
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     SpriteBehavior_Fountain
;     SpriteBehavior_MattockDroppedFromRipasheiku
;     SpriteBehavior_SpringOfFortress
;     SpriteBehavior_SpringOfJoker
;     SpriteBehavior_SpringOfSky
;     SpriteBehavior_WingBootsDroppedByZorugeriru
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_CheckPushingBlock
;     Player_PickUpMattockWithQuest
;     Player_PickUpWingBootsWithQuest
;     Player_Spawn
;     ScreenEvents_HandlePathToMasconEvent
;============================================================================

;
; XREFS:
;     IScriptAction_IfQuestCompleted
;     IScriptAction_SetQuestComplete
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     SpriteBehavior_Fountain
;     SpriteBehavior_MattockDroppedFromRipasheiku
;     SpriteBehavior_SpringOfFortress
;     SpriteBehavior_SpringOfJoker
;     SpriteBehavior_SpringOfSky
;     SpriteBehavior_WingBootsDroppedByZorugeriru
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_CheckPushingBlock
;     Player_PickUpMattockWithQuest
;     Player_PickUpWingBootsWithQuest
;     Player_Spawn
;     ScreenEvents_HandlePathToMasconEvent
;
Quests:                                     ; [$042d]
    .byte $00                               ; [$042d] Quests


;============================================================================
; The loaded special event ID for the current screen.
;
; This controls which custom logic is run for a screen,
; and the state around that logic.
;
; Bits 0-2 define the handler in a lookup table (count of
; 0-2), but in theory could be extended for more handlers.
;
; Bit 7 is reserved for the handler's use.
;
; If 0xFF, this is unset. Handlers may set this after
; use.
;
; XREFS:
;     Area_ScrollTo
;     GameLoop_RunScreenEventHandlers
;     ScreenEvents_HandleBoss
;     ScreenEvents_HandlePathToMasconEvent
;     Screen_LoadSpecialEventID
;     Screen_SetNoSpecialEventID
;     UNUSED_ClearScreenSpecialEventID
;============================================================================

;
; XREFS:
;     Area_ScrollTo
;     GameLoop_RunScreenEventHandlers
;     ScreenEvents_HandleBoss
;     ScreenEvents_HandlePathToMasconEvent
;     Screen_LoadSpecialEventID
;     Screen_SetNoSpecialEventID
;     UNUSED_ClearScreenSpecialEventID
;
CurrentScreen_SpecialEventID:               ; [$042e]
    .byte $00                               ; [$042e] byte

;
; XREFS:
;     Game_InitScreenAndMusic
;     Game_InitStateForSpawn
;     Game_MainLoop
;
Maybe_Game_Ready:                           ; [$042f]
    .byte $00                               ; [$042f] bool


;============================================================================
; The current phase of the screen fade-out.
;
; This is a value between 0 and 3 (inclusive) that indicates
; the phase when fading out the screen (used during screen
; transitions or death). This is used as a counter as an index
; into a palette delta table,
; FADE_OUT_DELTA_TABLE.
;
; XREFS:
;     Player_HandleDeath
;     Screen_FadeToBlack
;     Screen_NextTransitionState
;     Screen_SetFadeOutPalette
;     UNUSED_Screen_ClearFadeOutStage
;============================================================================

;
; XREFS:
;     Player_HandleDeath
;     Screen_FadeToBlack
;     Screen_NextTransitionState
;     Screen_SetFadeOutPalette
;     UNUSED_Screen_ClearFadeOutStage
;
Screen_FadeOutStage:                        ; [$0430]
    .byte $00                               ; [$0430] byte


;============================================================================
; Player's health (full)
;
; XREFS:
;     Game_LoadFirstLevel
;     Player_AddHP
;     Player_FillHPAndMP
;     Player_ReduceHP
;     Player_Spawn
;     Player_UseHourGlass
;     Player_UseRedPotion
;     UI_DrawPlayerHP
;     UI_DrawPlayerHPValue
;============================================================================

;
; XREFS:
;     Game_LoadFirstLevel
;     Player_AddHP
;     Player_FillHPAndMP
;     Player_ReduceHP
;     Player_Spawn
;     Player_UseHourGlass
;     Player_UseRedPotion
;     UI_DrawPlayerHP
;     UI_DrawPlayerHPValue
;
Player_HP_U:                                ; [$0431]
    .byte $00                               ; [$0431] byte


;============================================================================
; Player's health (fraction)
;
; XREFS:
;     Player_ReduceHP
;     Player_UseHourGlass
;============================================================================

;
; XREFS:
;     Player_ReduceHP
;     Player_UseHourGlass
;
Player_HP_L:                                ; [$0432]
    .byte $00                               ; [$0432] byte

    .byte $00,$00                           ; [$0434] undefined

;
; XREFS:
;     Debug_ChooseArea
;     EndGame_MoveToKingsRoom
;     FUN_PRG15_MIRROR__daf6
;     Game_DropLadderToMascon
;     Game_InitStateForStartScreen
;     Game_SetupAndLoadOutsideArea
;     Game_SpawnInTemple
;     Player_EnterDoorToOutside
;
Area_Region:                                ; [$0435]
    .byte $00                               ; [$0435] AreasRegion


;============================================================================
; Temporary storage for a sound ID.
;
; The sound ID to play (the A register) is stored here
; in PlaySound() while registers get pushed onto the
; stack. It's then loaded from here before calling
; PlaySoundInner().
;
; This is not used outside of this.
;
; XREFS:
;     Sound_PlayEffect
;============================================================================

;
; XREFS:
;     Sound_PlayEffect
;
Temp_SoundIDToPlay:                         ; [$0436]
    .byte $00                               ; [$0436] SoundID


;============================================================================
; Player's current title
;
; XREFS:
;     IScriptAction_CheckUpdatePlayerTitle
;     IScriptAction_IfPlayerHasTitle
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_ShowStatusMenu
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_UpdateAcceleration
;     Player_UseWingBoots
;     TextBox_DisplayMessage
;     TextBox_ShowMessage_ShowPlayerTitle
;============================================================================

;
; XREFS:
;     IScriptAction_CheckUpdatePlayerTitle
;     IScriptAction_IfPlayerHasTitle
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_ShowStatusMenu
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_UpdateAcceleration
;     Player_UseWingBoots
;     TextBox_DisplayMessage
;     TextBox_ShowMessage_ShowPlayerTitle
;
PlayerTitle:                                ; [$0437]
    .byte $00                               ; [$0437] byte


;============================================================================
; 0x00 = Player is alive
; 0x01 = Player is dead
;
; XREFS:
;     Game_InitStateForSpawn
;     Game_MainLoop
;     Player_HandleDeath
;     Player_ReduceHP
;============================================================================

;
; XREFS:
;     Game_InitStateForSpawn
;     Game_MainLoop
;     Player_HandleDeath
;     Player_ReduceHP
;
PlayerIsDead:                               ; [$0438]
    .byte $00                               ; [$0438] bool


;============================================================================
; The temple in which the player will be spawned upon death.
;
; XREFS:
;     IScriptAction_SetSpawnPoint
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     IScriptAction_SetSpawnPoint
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Game_SpawnInTemple
;
TempleSpawnPoint:                           ; [$0439]
    .byte $00                               ; [$0439] Temple


;============================================================================
; A rotating counter tracking a visits to certain screens.
;
; This is used for screens that only show an item once out
; of every 4 visits. It's incremented and then checked by
; Screen_Is3Of4Visits, which is called by some
; item BScripts, to determine whether to hide or show items.
;
; XREFS:
;     Screen_Is3Of4Visits
;============================================================================

;
; XREFS:
;     Screen_Is3Of4Visits
;
Screen_TrackedVisitCount:                   ; [$043a]
    .byte $00,$00                           ; [$043a] undefined


;============================================================================
; Block properties of the currently-active screen
;
; XREFS:
;     Area_GetBlockProperty
;     Area_LoadBlockProperties
;============================================================================

;
; XREFS:
;     Area_GetBlockProperty
;     Area_LoadBlockProperties
;
BlockProperties:                            ; [$043c]
    .byte $00                               ; [0]:

;
; XREFS:
;     Area_LoadBlockProperties
;
BlockProperties_1_:                         ; [$043d]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $00                               ; [16]:
    .byte $00                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]:
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $00                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:
    .byte $00                               ; [32]:
    .byte $00                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $00                               ; [64]:
    .byte $00                               ; [65]:
    .byte $00                               ; [66]:
    .byte $00                               ; [67]:
    .byte $00                               ; [68]:
    .byte $00                               ; [69]:
    .byte $00                               ; [70]:
    .byte $00                               ; [71]:
    .byte $00                               ; [72]:
    .byte $00                               ; [73]:
    .byte $00                               ; [74]:
    .byte $00                               ; [75]:
    .byte $00                               ; [76]:
    .byte $00                               ; [77]:
    .byte $00                               ; [78]:
    .byte $00                               ; [79]:
    .byte $00                               ; [80]:
    .byte $00                               ; [81]:
    .byte $00                               ; [82]:
    .byte $00                               ; [83]:
    .byte $00                               ; [84]:
    .byte $00                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $00                               ; [89]:
    .byte $00                               ; [90]:
    .byte $00                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:
    .byte $00                               ; [94]:
    .byte $00                               ; [95]:
    .byte $00                               ; [96]:
    .byte $00                               ; [97]:
    .byte $00                               ; [98]:
    .byte $00                               ; [99]:
    .byte $00                               ; [100]:
    .byte $00                               ; [101]:
    .byte $00                               ; [102]:
    .byte $00                               ; [103]:
    .byte $00                               ; [104]:
    .byte $00                               ; [105]:
    .byte $00                               ; [106]:
    .byte $00                               ; [107]:
    .byte $00                               ; [108]:
    .byte $00                               ; [109]:
    .byte $00                               ; [110]:
    .byte $00                               ; [111]:
    .byte $00                               ; [112]:
    .byte $00                               ; [113]:
    .byte $00                               ; [114]:
    .byte $00                               ; [115]:
    .byte $00                               ; [116]:
    .byte $00                               ; [117]:
    .byte $00                               ; [118]:
    .byte $00                               ; [119]:
    .byte $00                               ; [120]:
    .byte $00                               ; [121]:
    .byte $00                               ; [122]:
    .byte $00                               ; [123]:
    .byte $00                               ; [124]:
    .byte $00                               ; [125]:
    .byte $00                               ; [126]:
    .byte $00                               ; [127]:

;
; XREFS:
;     Player_ApplyDamage
;     Player_HandleHitByMagic
;     SpriteBehavior_FlashScreenHitPlayer
;     SpriteBehavior_Unknown_29_SomeSetup
;     Player_ReduceHP
;     Player_Something_ChangeHP
;
Arg_PlayerHealthDelta_L:                    ; [$04bc]
    .byte $00                               ; [$04bc] byte

;
; XREFS:
;     Player_ApplyDamage
;     Player_HandleHitByMagic
;     SpriteBehavior_FlashScreenHitPlayer
;     SpriteBehavior_Unknown_29_SomeSetup
;     Player_ReduceHP
;     Player_Something_ChangeHP
;
Arg_PlayerHealthDelta_U:                    ; [$04bd]
    .byte $00                               ; [$04bd] byte

;
; XREFS:
;     SpriteBehavior_Unknown_29_SomeSetup
;     Player_Something_ChangeHP
;
SpriteBehaviorUnknown20_SomethingXOrY:      ; [$04be]
    .byte $00                               ; [$04be] byte

;
; XREFS:
;     SpriteBehavior_Unknown_29_SomeSetup
;     Player_Something_ChangeHP
;
BYTE_04bf:                                  ; [$04bf]
    .byte $00                               ; [$04bf] byte

;
; XREFS:
;     Player_Something_ChangeHP
;
Temp1_SomethingChangedHP:                   ; [$04c0]
    .byte $00                               ; [$04c0] byte

;
; XREFS:
;     Player_Something_ChangeHP
;
Temp2_SomethingChangedHP:                   ; [$04c1]
    .byte $00                               ; [$04c1] byte

;
; XREFS:
;     PasswordScreen_GetDPadBits
;     PasswordScreen_Show
;
Password_DPadBits:                          ; [$04c2]
    .byte $00                               ; [$04c2] ButtonBitmask


;============================================================================
; A counter used to wait after holding down a direction before auto-repeating
; the cursor movement.
;
; See PasswordScreen_GetDPadBits for usage.
;
; XREFS:
;     PasswordScreen_GetDPadBits
;     PasswordScreen_Show
;============================================================================

;
; XREFS:
;     PasswordScreen_GetDPadBits
;     PasswordScreen_Show
;
Password_CounterBeforeAutoRepeatMove:       ; [$04c3]
    .byte $00,$00,$00                       ; [$04c3] byte

;
; XREFS:
;     Password_EncodeValueList
;
Password_TempY:                             ; [$04c6]
    .byte $00                               ; [$04c6] byte

;
; XREFS:
;     Password_DecodeValueList
;     Password_EncodeValueList
;
Password_TempX:                             ; [$04c7]
    .byte $00                               ; [$04c7] byte

;
; XREFS:
;     Password_DecodeValueList
;     Password_EncodeValueList
;
Password_TempA:                             ; [$04c8]
    .byte $00                               ; [$04c8] byte

;
; XREFS:
;     Password_DecodeValue
;     Password_EncodeValue
;     Password_GenerateState
;     Password_GenerateStateAndReset
;     Password_Load
;     Password_Maybe_CheckPasswordLength
;
Password_ByteCounter:                       ; [$04c9]
    .byte $00                               ; [$04c9] byte

;
; XREFS:
;     Password_DecodeValue
;     Password_EncodeValue
;     Password_GenerateState
;     Password_GenerateStateAndReset
;     Password_Load
;     Password_Maybe_CheckPasswordLength
;
Password_BitCounter:                        ; [$04ca]
    .byte $00                               ; [$04ca] byte

;
; XREFS:
;     Password_GenerateState
;     Password_GetNext6Bits
;
Password_6BitCount:                         ; [$04cb]
    .byte $00                               ; [$04cb] byte

;
; XREFS:
;     Password_EncodeValue
;     Password_GenerateState
;     Password_Maybe_CheckPasswordLength
;
Password_Checksum:                          ; [$04cc]
    .byte $00                               ; [$04cc] byte

;
; XREFS:
;     Password_DecodeValue
;     Password_EncodeValue
;     Password_GenerateState
;
Password_EncodedState:                      ; [$04cd]
    .byte $00                               ; [0]:

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
Password_EncodedState_1_:                   ; [$04ce]
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $00                               ; [16]:
    .byte $00                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]:
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $00                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:


;============================================================================
; Title the player will get in the next guru visit.
;
; XREFS:
;     IScriptAction_CheckUpdatePlayerTitle
;     PlayerMenu_ShowStatusMenu
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_CheckReachedNextTitle
;============================================================================

;
; XREFS:
;     IScriptAction_CheckUpdatePlayerTitle
;     PlayerMenu_ShowStatusMenu
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_CheckReachedNextTitle
;
NextPlayerTitle:                            ; [$04ed]
    .byte $00                               ; [$04ed] byte


;============================================================================
; Width of the HP/MP bar.
;
; This gets set when loading a screen, and is used to draw
; the screen width.
;
; It's possible that this was at one point meant to be
; updated based on progression or some other state. Pure
; speculation.
;
; XREFS:
;     UI_DrawHUDSprites
;     UI_DrawManaOrHPBar
;============================================================================

;
; XREFS:
;     UI_DrawHUDSprites
;     UI_DrawManaOrHPBar
;
UI_MPAndHPBarWidth:                         ; [$04ee]
    .byte $00                               ; [$04ee] byte

    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$04f0] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$04f7] undefined
    .byte $00                               ; [$04ff] undefined


;============================================================================
; Buffer of state to write to the PPU.
;
; Entries are in the order of:
;
; 1. Control + length byte
;
;    Bit 7 controls whether to set PPUCTRL to
;    VRAM_INC_ADD32_DOWN mode (if set).
;
;    The rest controls how many bytes to write from the buffer (remaining
;    bits).
;
; 2. Upper byte of PPUADDR to write.
;
; 3. Lower byte of PPUADDR to write.
;
; 4...N. Up to <length> bytes of PPUDATA to write.
;
; XREFS:
;     Area_SetBlocks_SetAttributes
;     Area_SetBlocks_WriteBlockData12
;     Area_SetBlocks_WriteBlockData34
;     DEADCODE_FUN_PRG15_MIRROR__c033
;     Fog_UpdateTiles
;     Game_Init
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPUBuffer_WritePalette
;     Player_DrawDeathAnimation
;     Sprites_LoadImageForCurrentSprite
;============================================================================

;
; XREFS:
;     Area_SetBlocks_SetAttributes
;     Area_SetBlocks_WriteBlockData12
;     Area_SetBlocks_WriteBlockData34
;     DEADCODE_FUN_PRG15_MIRROR__c033
;     Fog_UpdateTiles
;     Game_Init
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPUBuffer_WritePalette
;     Player_DrawDeathAnimation
;     Sprites_LoadImageForCurrentSprite
;
PPUBuffer:                                  ; [$0500]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:

;
; XREFS:
;     UI_ClearSelectedItemPic
;
PPUBuffer_4_:                               ; [$0504]
    .byte $00                               ; [4]:

;
; XREFS:
;     UI_ClearSelectedItemPic
;
PPUBuffer_5_:                               ; [$0505]
    .byte $00                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:

;
; XREFS:
;     IScripts_DrawPortraitTileToPPU
;     Player_LoadWeaponTile
;
PPUBuffer_8_:                               ; [$0508]
    .byte $00                               ; [8]:

;
; XREFS:
;     IScripts_DrawPortraitTileToPPU
;     Player_LoadWeaponTile
;
PPUBuffer_9_:                               ; [$0509]
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $00                               ; [16]:
    .byte $00                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]:
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $00                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:
    .byte $00                               ; [32]:
    .byte $00                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $00                               ; [64]:
    .byte $00                               ; [65]:
    .byte $00                               ; [66]:
    .byte $00                               ; [67]:
    .byte $00                               ; [68]:
    .byte $00                               ; [69]:
    .byte $00                               ; [70]:
    .byte $00                               ; [71]:
    .byte $00                               ; [72]:
    .byte $00                               ; [73]:
    .byte $00                               ; [74]:
    .byte $00                               ; [75]:
    .byte $00                               ; [76]:
    .byte $00                               ; [77]:
    .byte $00                               ; [78]:
    .byte $00                               ; [79]:
    .byte $00                               ; [80]:
    .byte $00                               ; [81]:
    .byte $00                               ; [82]:
    .byte $00                               ; [83]:
    .byte $00                               ; [84]:
    .byte $00                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $00                               ; [89]:
    .byte $00                               ; [90]:
    .byte $00                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:
    .byte $00                               ; [94]:
    .byte $00                               ; [95]:
    .byte $00                               ; [96]:
    .byte $00                               ; [97]:
    .byte $00                               ; [98]:
    .byte $00                               ; [99]:
    .byte $00                               ; [100]:
    .byte $00                               ; [101]:
    .byte $00                               ; [102]:
    .byte $00                               ; [103]:
    .byte $00                               ; [104]:
    .byte $00                               ; [105]:
    .byte $00                               ; [106]:
    .byte $00                               ; [107]:
    .byte $00                               ; [108]:
    .byte $00                               ; [109]:
    .byte $00                               ; [110]:
    .byte $00                               ; [111]:
    .byte $00                               ; [112]:
    .byte $00                               ; [113]:
    .byte $00                               ; [114]:
    .byte $00                               ; [115]:
    .byte $00                               ; [116]:
    .byte $00                               ; [117]:
    .byte $00                               ; [118]:
    .byte $00                               ; [119]:
    .byte $00                               ; [120]:
    .byte $00                               ; [121]:
    .byte $00                               ; [122]:
    .byte $00                               ; [123]:
    .byte $00                               ; [124]:
    .byte $00                               ; [125]:
    .byte $00                               ; [126]:
    .byte $00                               ; [127]:
    .byte $00                               ; [128]:
    .byte $00                               ; [129]:
    .byte $00                               ; [130]:
    .byte $00                               ; [131]:
    .byte $00                               ; [132]:
    .byte $00                               ; [133]:
    .byte $00                               ; [134]:
    .byte $00                               ; [135]:
    .byte $00                               ; [136]:
    .byte $00                               ; [137]:
    .byte $00                               ; [138]:
    .byte $00                               ; [139]:
    .byte $00                               ; [140]:
    .byte $00                               ; [141]:
    .byte $00                               ; [142]:
    .byte $00                               ; [143]:
    .byte $00                               ; [144]:
    .byte $00                               ; [145]:
    .byte $00                               ; [146]:
    .byte $00                               ; [147]:
    .byte $00                               ; [148]:
    .byte $00                               ; [149]:
    .byte $00                               ; [150]:
    .byte $00                               ; [151]:
    .byte $00                               ; [152]:
    .byte $00                               ; [153]:
    .byte $00                               ; [154]:
    .byte $00                               ; [155]:
    .byte $00                               ; [156]:
    .byte $00                               ; [157]:
    .byte $00                               ; [158]:
    .byte $00                               ; [159]:
    .byte $00                               ; [160]:
    .byte $00                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $00                               ; [164]:
    .byte $00                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $00                               ; [168]:
    .byte $00                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:
    .byte $00                               ; [172]:
    .byte $00                               ; [173]:
    .byte $00                               ; [174]:
    .byte $00                               ; [175]:
    .byte $00                               ; [176]:
    .byte $00                               ; [177]:
    .byte $00                               ; [178]:
    .byte $00                               ; [179]:
    .byte $00                               ; [180]:
    .byte $00                               ; [181]:
    .byte $00                               ; [182]:
    .byte $00                               ; [183]:
    .byte $00                               ; [184]:
    .byte $00                               ; [185]:
    .byte $00                               ; [186]:
    .byte $00                               ; [187]:
    .byte $00                               ; [188]:
    .byte $00                               ; [189]:
    .byte $00                               ; [190]:
    .byte $00                               ; [191]:
    .byte $00                               ; [192]:
    .byte $00                               ; [193]:
    .byte $00                               ; [194]:
    .byte $00                               ; [195]:
    .byte $00                               ; [196]:
    .byte $00                               ; [197]:
    .byte $00                               ; [198]:
    .byte $00                               ; [199]:
    .byte $00                               ; [200]:
    .byte $00                               ; [201]:
    .byte $00                               ; [202]:
    .byte $00                               ; [203]:
    .byte $00                               ; [204]:
    .byte $00                               ; [205]:
    .byte $00                               ; [206]:
    .byte $00                               ; [207]:
    .byte $00                               ; [208]:
    .byte $00                               ; [209]:
    .byte $00                               ; [210]:
    .byte $00                               ; [211]:
    .byte $00                               ; [212]:
    .byte $00                               ; [213]:
    .byte $00                               ; [214]:
    .byte $00                               ; [215]:
    .byte $00                               ; [216]:
    .byte $00                               ; [217]:
    .byte $00                               ; [218]:
    .byte $00                               ; [219]:
    .byte $00                               ; [220]:
    .byte $00                               ; [221]:
    .byte $00                               ; [222]:
    .byte $00                               ; [223]:
    .byte $00                               ; [224]:
    .byte $00                               ; [225]:
    .byte $00                               ; [226]:
    .byte $00                               ; [227]:
    .byte $00                               ; [228]:
    .byte $00                               ; [229]:
    .byte $00                               ; [230]:
    .byte $00                               ; [231]:
    .byte $00                               ; [232]:
    .byte $00                               ; [233]:
    .byte $00                               ; [234]:
    .byte $00                               ; [235]:
    .byte $00                               ; [236]:
    .byte $00                               ; [237]:
    .byte $00                               ; [238]:
    .byte $00                               ; [239]:
    .byte $00                               ; [240]:
    .byte $00                               ; [241]:
    .byte $00                               ; [242]:
    .byte $00                               ; [243]:
    .byte $00                               ; [244]:
    .byte $00                               ; [245]:
    .byte $00                               ; [246]:
    .byte $00                               ; [247]:
    .byte $00                               ; [248]:
    .byte $00                               ; [249]:
    .byte $00                               ; [250]:
    .byte $00                               ; [251]:
    .byte $00                               ; [252]:
    .byte $00                               ; [253]:
    .byte $00                               ; [254]:
    .byte $00                               ; [255]:


;============================================================================
; Uncompressed block data of the current screen.
;
; The screen data can be up to 256 bytes.
;
; This section is also used for other places of the game,
; such as the password screen management and intro/outro
; animatinos.
;
; XREFS:
;     PasswordScreen_DrawAtCursorPosition
;     PasswordScreen_HandleDeleteAtCursor
;     PasswordScreen_HandleDeleteLastChar
;     PasswordScreen_HandleInputChar
;     Password_Maybe_CheckPasswordLength
;     Area_HandleBreakableFloor
;     Area_IsBlockImpassableOrLadder
;     Area_LoadBlocks
;     Area_LoadScrollDataRight
;     Area_SetStateFromDoorDestination
;     Area_StoreBlockIsAir
;     Game_Init
;     Game_OpenPathToMascon
;     Player_CheckIfOnLadder
;     Player_CheckOnBreakableBlock
;     Player_CheckPushingBlock
;     Player_UseMattock
;     ScreenBuffer_Clear
;     ScreenBuffer_IsBlockImpassable
;     ScreenBuffer_LoadBlockProperty
;     SpriteBehavior_EnemyUnused18_SomethingSetBlocks
;     TextBox_GetBackingAttributeData
;     Textbox_Maybe_GetAreaBehindTextbox
;============================================================================

;
; XREFS:
;     PasswordScreen_DrawAtCursorPosition
;     PasswordScreen_HandleDeleteAtCursor
;     PasswordScreen_HandleDeleteLastChar
;     PasswordScreen_HandleInputChar
;     Password_Maybe_CheckPasswordLength
;     Area_HandleBreakableFloor
;     Area_IsBlockImpassableOrLadder
;     Area_LoadBlocks
;     Area_LoadScrollDataRight
;     Area_SetStateFromDoorDestination
;     Area_StoreBlockIsAir
;     Game_Init
;     Game_OpenPathToMascon
;     Player_CheckIfOnLadder
;     Player_CheckOnBreakableBlock
;     Player_CheckPushingBlock
;     Player_UseMattock
;     ScreenBuffer_Clear
;     ScreenBuffer_IsBlockImpassable
;     ScreenBuffer_LoadBlockProperty
;     SpriteBehavior_EnemyUnused18_SomethingSetBlocks
;     TextBox_GetBackingAttributeData
;     Textbox_Maybe_GetAreaBehindTextbox
;
Password_EnteredChars:                      ; [$0600]
ScreenBuffer:
    .byte $00                               ; [$0600] byte

;
; XREFS:
;     PasswordScreen_HandleDeleteAtCursor
;     Password_Maybe_CheckPasswordLength
;     Area_LoadScrollDataRight
;     ScreenBuffer_Clear
;
DAT_0601:                                   ; [$0601]
    .byte $00                               ; [$0601] undefined

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
DAT_0602:                                   ; [$0602]
    .byte $00                               ; [$0602] undefined

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
DAT_0603:                                   ; [$0603]
    .byte $00                               ; [$0603] undefined

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
DAT_0604:                                   ; [$0604]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0604] undefined
    .byte $00,$00,$00                       ; [$060c] undefined

;
; XREFS:
;     Area_LoadScrollDataRight
;
DAT_060f:                                   ; [$060f]
    .byte $00                               ; [$060f] undefined

;
; XREFS:
;     Area_LoadScrollDataRight
;
DAT_0610:                                   ; [$0610]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0610] undefined
    .byte $00,$00,$00,$00,$00,$00           ; [$0618] undefined

;
; XREFS:
;     PasswordScreen_Show
;
DAT_061e:                                   ; [$061e]
    .byte $00                               ; [$061e] undefined

;
; XREFS:
;     PasswordScreen_Show
;     Area_LoadScrollDataRight
;
DAT_061f:                                   ; [$061f]
    .byte $00,$00,$00                       ; [$061f] undefined

;
; XREFS:
;     Game_DropLadderToMascon
;
DAT_0622:                                   ; [$0622]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0622] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$062a] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0632] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$063a] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0642] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$064a] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0652] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$065a] undefined


;============================================================================
; Password screen state.
;
; XREFS:
;     PasswordScreen_DrawSelectionCursor
;     PasswordScreen_IsCursorSpotInvalid
;     PasswordScreen_SetCursorCol
;     PasswordScreen_Show
;     PasswordScreen_UpdateCursorMovedFromLastRow
;     PasswordScreen_UpdateCursorMovedToLastRow
;     Password_HandleDPadInput
;============================================================================

;
; The input cursor column in the password screen.
;
;
; XREFS:
;     PasswordScreen_DrawSelectionCursor
;     PasswordScreen_IsCursorSpotInvalid
;     PasswordScreen_SetCursorCol
;     PasswordScreen_Show
;     PasswordScreen_UpdateCursorMovedFromLastRow
;     PasswordScreen_UpdateCursorMovedToLastRow
;     Password_HandleDPadInput
;
Password_CursorCol:                         ; [$0662]
    .byte $00                               ; [$0662] byte


;
; The input cursor row in the password screen.
;
;
; XREFS:
;     PasswordScreen_DrawSelectionCursor
;     PasswordScreen_IsCursorSpotInvalid
;     PasswordScreen_Show
;     Password_HandleDPadInput
;
Password_CursorRow:                         ; [$0663]
    .byte $00                               ; [$0663] byte


;
; The position of the selection cursor in the password field.
;
;
; XREFS:
;     PasswordScreen_DrawAtCursorPosition
;     PasswordScreen_HandleDeleteAtCursor
;     PasswordScreen_HandleDeleteLastChar
;     PasswordScreen_HandleInputChar
;     PasswordScreen_HandleMoveCursorLeft
;     PasswordScreen_HandleMoveCursorRight
;     PasswordScreen_Show
;     PasswordScreen_WriteCharTile
;
Password_FieldCursorPos:                    ; [$0664]
    .byte $00                               ; [$0664] byte


;
; Maximum number of characters allowed for the password.
;
;
; XREFS:
;     PasswordScreen_HandleInputChar
;     PasswordScreen_HandleMoveCursorLeft
;     PasswordScreen_HandleMoveCursorRight
;     PasswordScreen_Show
;
Password_MaxChars:                          ; [$0665]
    .byte $00                               ; [$0665] byte


;
; The number of password characters entered.
;
;
; XREFS:
;     PasswordScreen_HandleDeleteAtCursor
;     PasswordScreen_HandleDeleteLastChar
;     PasswordScreen_HandleInputChar
;     PasswordScreen_HandleMoveCursorLeft
;     PasswordScreen_HandleMoveCursorRight
;     PasswordScreen_Show
;     PasswordScreen_WaitForInput
;     Password_Maybe_CheckPasswordLength
;
Password_EnteredCharsLength:                ; [$0666]
    .byte $00                               ; [$0666] byte

    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0668] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$066f] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0677] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$067f] undefined

;
; XREFS:
;     StartScreen_CheckHandleInput
;     StartScreen_Draw
;     Game_ShowStartScreen
;
DAT_0687:                                   ; [$0687]
    .byte $00                               ; [$0687] undefined

;
; XREFS:
;     SplashAnimation_FuncAA94
;     SplashAnimation_SomethingUpdateState
;
SplashAnimation_0688:                       ; [$0688]
    .byte $00                               ; [$0688] undefined

;
; XREFS:
;     SplashAnimation_A90F
;     SplashAnimation_FuncAA94
;     SplashAnimation_UpdateOutro
;
SplashAnimation_0689:                       ; [$0689]
    .byte $00                               ; [$0689] byte

;
; XREFS:
;     SplashAnimation_A90F
;     SplashAnimation_FuncAA94
;     SplashAnimation_UpdateOutro
;
SplashAnimation_068a:                       ; [$068a]
    .byte $00                               ; [$068a] byte

;
; XREFS:
;     SplashAnimation_FuncAA94
;
DAT_068b:                                   ; [$068b]
    .byte $00                               ; [$068b] undefined

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_AnimPlayerStep
;
SplashAnimation_068c:                       ; [$068c]
    .byte $00                               ; [$068c] undefined


;============================================================================
; Counter indicating the player size scale in the intro animation.
;
; This goes from 0 to 4. The larger the number, the smaller
; the player.
;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_AnimPlayerStep
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;     SplashAnimation_RunIntro
;============================================================================

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_AnimPlayerStep
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;     SplashAnimation_RunIntro
;
IntroAnimation_PlayerSizeCounter:           ; [$068d]
    .byte $00                               ; [$068d] byte

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_NextAnimState1
;
SplashAnimation_068e:                       ; [$068e]
    .byte $00                               ; [$068e] byte

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_NextAnimState2
;     SplashAnimation_RunOutro
;
SplashAnimation_068f:                       ; [$068f]
    .byte $00                               ; [$068f] byte

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_NextAnimState1
;
SplashAnimation_0690:                       ; [$0690]
    .byte $00                               ; [$0690] byte

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_NextAnimState2
;
SplashAnimation_0691:                       ; [$0691]
    .byte $00                               ; [$0691] byte

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;     SplashAnimation_Maybe_NextAnimState1
;
SplashAnimation_0692:                       ; [$0692]
    .byte $00                               ; [$0692] byte

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;     SplashAnimation_Maybe_NextAnimState2
;
SplashAnimation_0693:                       ; [$0693]
    .byte $00                               ; [$0693] byte

;
; XREFS:
;     LAB_PRG12__a9f8 [$PRG12::a9f8]
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_0694:                       ; [$0694]
    .byte $00                               ; [0]:

;
; XREFS:
;     LAB_PRG12__a9f8 [$PRG12::a9f8]
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_0695:                       ; [$0695]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_0696:                       ; [$0696]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_0697:                       ; [$0697]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;     SpashAnimation_SomethingOutro_aa20
;
SplashAnimation_0698:                       ; [$0698]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_0698_1_:                    ; [$0699]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;     SpashAnimation_SomethingOutro_aa46
;
SplashAnimation_069a:                       ; [$069a]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_069a_1_:                    ; [$069b]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;     SpashAnimation_SomethingOutro_aa20
;
SplashAnimation_069c:                       ; [$069c]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_069c_1_:                    ; [$069d]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;     SpashAnimation_SomethingOutro_aa46
;
SplashAnimation_069e:                       ; [$069e]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_069e_1_:                    ; [$069f]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;     SpashAnimation_SomethingOutro_aa20
;
SplashAnimation_06a0:                       ; [$06a0]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_06a0_1_:                    ; [$06a1]
    .byte $00                               ; [1]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;     SpashAnimation_SomethingOutro_aa46
;
SplashAnimation_06a2:                       ; [$06a2]
    .byte $00                               ; [0]:

;
; XREFS:
;     SpashAnimation_SomethingOutro_a9a2
;
SplashAnimation_06a2_1_:                    ; [$06a3]
    .byte $00                               ; [1]:

;
; XREFS:
;     SplashAnimation_Intro_SomethingA708
;     SplashAnimation_RunIntro
;
SplashAnimation_PaletteStage:               ; [$06a4]
    .byte $00                               ; [$06a4] byte

;
; XREFS:
;     SplashAnimation_DrawScenery
;
SplashAnimation_SceneIndex:                 ; [$06a5]
    .byte $00                               ; [$06a5] byte

    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06a7] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06ae] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06b6] undefined
    .byte $00,$00                           ; [$06be] undefined

;
; XREFS:
;     Area_LoadScrollDataRight
;
DAT_06c0:                                   ; [$06c0]
    .byte $00                               ; [$06c0] undefined

;
; XREFS:
;     Area_LoadScrollDataRight
;
DAT_06c1:                                   ; [$06c1]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06c1] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06c9] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06d1] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06d9] undefined
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06e1] undefined
    .byte $00,$00,$00,$00,$00,$00,$00       ; [$06e9] undefined

;
; XREFS:
;     Area_LoadBlocks
;
DAT_06f0:                                   ; [$06f0]
    .byte $00                               ; [$06f0] undefined

;
; XREFS:
;     Area_LoadBlocks
;
DAT_06f1:                                   ; [$06f1]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$06f1] undefined
    .byte $00,$00,$00,$00,$00,$00,$00       ; [$06f9] undefined

;
; XREFS:
;     SplashAnimation_FuncAA94
;     SplashAnimation_SomethingUpdateState
;     Game_Init
;     Sprite_Draw_FlippedHoriz
;     Sprite_Draw_Standard
;     Sprites_Reset
;
SPRITE0_Y:                                  ; [$0700]
SPRITE_0_RANGE_1_START:
    .byte $00                               ; [$0700] byte

;
; XREFS:
;     SplashAnimation_FuncAA94
;     Sprites_Reset
;
SPRITE0_TILE:                               ; [$0701]
    .byte $00                               ; [$0701] byte

;
; XREFS:
;     SplashAnimation_FuncAA94
;     Sprites_Reset
;
SPRITE0_ATTRS:                              ; [$0702]
    .byte $00                               ; [$0702] byte

;
; XREFS:
;     SplashAnimation_FuncAA94
;     Sprites_Reset
;
SPRITE0_X:                                  ; [$0703]
    .byte $00                               ; [$0703] byte

;
; XREFS:
;     SplashAnimation_SomethingUpdateState
;     Sprites_FlipRanges
;     Sprites_Reset
;
SPRITE_1_RANGE_1_START:                     ; [$0704]
    .byte $00                               ; [$0704] byte

;
; XREFS:
;     Sprites_FlipRanges
;
BYTE_0705:                                  ; [$0705]
    .byte $00,$00,$00                       ; [$0705] byte

;
; XREFS:
;     Sprites_Reset
;
BYTE_0708:                                  ; [$0708]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0708] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0710] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0718] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0720] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0728] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0730] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0738] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0740] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0748] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0750] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0758] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0760] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0768] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0770] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0778] byte

SPRITE_0_RANGE_2_START:                     ; [$0780]
    .byte $00,$00,$00,$00                   ; [$0780] byte

;
; XREFS:
;     Sprites_FlipRanges
;
SPRITE_1_RANGE_2_START:                     ; [$0784]
    .byte $00                               ; [$0784] byte

;
; XREFS:
;     Sprites_FlipRanges
;
BYTE_0785:                                  ; [$0785]
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0785] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$078d] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$0795] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$079d] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07a5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07ad] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07b5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07bd] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07c5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07cd] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07d5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07dd] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07e5] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07ed] byte
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$07f5] byte
    .byte $00,$00,$00                       ; [$07fd] byte
