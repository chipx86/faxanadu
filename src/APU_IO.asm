;============================================================================
; Faxanadu (U).nes
;
; APU_IO ($4000 - $4017)
;============================================================================

    .segment "APU_IO"
    .ORG $4000

;
; XREFS:
;     Audio_Reset
;     Music_UpdateSQVolRegister
;     SoundEffect_PlayerDied_OnTick
;
SQ1_VOL:                                    ; [$4000]
    .byte $00                               ; [$4000] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_PlayerDied_OnTick
;
SQ1_SWEEP:                                  ; [$4001]
    .byte $00                               ; [$4001] undefined

;
; XREFS:
;     Audio_Reset
;     Music_ApplySQPitchEffectToLO
;     Music_PlayWave
;     SoundEffect_PlayerDied_OnTick
;
SQ1_LO:                                     ; [$4002]
    .byte $00                               ; [$4002] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_PlayerDied_OnTick
;
SQ1_HI:                                     ; [$4003]
    .byte $00                               ; [$4003] undefined

;
; XREFS:
;     Audio_Reset
;     SoundEffect_0x48_OnTick
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_CoinDropped_OnTick
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_GoldAmountChanged_Setup
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Magic_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_PasswordCharInput_Setup
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_ShieldHitByMagic_OnTick
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_Tilte_OnTick
;
SQ2_VOL:                                    ; [$4004]
    .byte $00                               ; [$4004] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_0x48_OnTick
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_CoinDropped_OnTick
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_GoldAmountChanged_Setup
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Magic_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_PasswordCharInput_Setup
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_ShieldHitByMagic_OnTick
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_Tilte_OnTick
;
SQ2_SWEEP:                                  ; [$4005]
    .byte $00                               ; [$4005] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_0x48_OnTick
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_CoinDropped_OnTick
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_GoldAmountChanged_Setup
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Magic_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_PasswordCharInput_Setup
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_ShieldHitByMagic_OnTick
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_Tilte_OnTick
;
SQ2_LO:                                     ; [$4006]
    .byte $00                               ; [$4006] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_0x48_OnTick
;     SoundEffect_BreadTouched_OnTick
;     SoundEffect_CharacterInput_OnTick
;     SoundEffect_CoinDropped_OnTick
;     SoundEffect_CoinTouchedCommon_OnTick
;     SoundEffect_CursorMoved_OnTick
;     SoundEffect_FillHPOrMP_OnTick
;     SoundEffect_GoldAmountChanged_Setup
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_HitPlayer_OnTick
;     SoundEffect_ItemPickedUp_OnTick
;     SoundEffect_Magic_OnTick
;     SoundEffect_Maybe_Typing_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_Pakukame_OnTick
;     SoundEffect_PasswordCharInput_Setup
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_ShieldHitByMagic_OnTick
;     SoundEffect_ShowPlayerMenu_OnTick
;     SoundEffect_Tilte_OnTick
;
SQ2_HI:                                     ; [$4007]
    .byte $00                               ; [$4007] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayForChannel
;     Music_PlayWave
;     SoundEffect_PlayerDied_OnTick
;
TRI_LINEAR:                                 ; [$4008]
    .byte $00,$00                           ; [$4008] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_PlayerDied_OnTick
;
TRI_LO:                                     ; [$400a]
    .byte $00                               ; [$400a] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;
TRI_HI:                                     ; [$400b]
    .byte $00                               ; [$400b] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayNoise
;     SoundEffect_0x48_OnTick
;     SoundEffect_EnemyDied_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_LadderDropped_OnTick
;     SoundEffect_MagicHitObstacle_OnTick
;     SoundEffect_Maybe_Step_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Message_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_PushBlock_OnTick
;     SoundEffect_Tilte_OnTick
;
NOISE_VOL:                                  ; [$400c]
    .byte $00                               ; [$400c] undefined1

;
; XREFS:
;     Music_PlayNoise
;
DAT_400d:                                   ; [$400d]
    .byte $00                               ; [$400d] undefined1

;
; XREFS:
;     Audio_Reset
;     SoundEffect_0x48_OnTick
;     SoundEffect_EnemyDied_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_LadderDropped_OnTick
;     SoundEffect_MagicHitObstacle_OnTick
;     SoundEffect_Maybe_Step_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Message_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_PushBlock_OnTick
;     SoundEffect_Tilte_OnTick
;
NOISE_LO:                                   ; [$400e]
    .byte $00                               ; [$400e] undefined

;
; XREFS:
;     Audio_Reset
;     SoundEffect_0x48_OnTick
;     SoundEffect_EnemyDied_OnTick
;     SoundEffect_HitEnemy_OnTick
;     SoundEffect_LadderDropped_OnTick
;     SoundEffect_MagicHitObstacle_OnTick
;     SoundEffect_Maybe_Step_OnTick
;     SoundEffect_Maybe_UseSpecialItem2_OnTick
;     SoundEffect_Message_OnTick
;     SoundEffect_OpenDoor_OnTick
;     SoundEffect_PlayerDied_OnTick
;     SoundEffect_PushBlock_OnTick
;     SoundEffect_Tilte_OnTick
;
NOISE_HI:                                   ; [$400f]
    .byte $00                               ; [$400f] undefined

DMC_FREQ:                                   ; [$4010]
    .byte $00                               ; [$4010] undefined

;
; XREFS:
;     SoundEffects_Init
;
DMC_RAW:                                    ; [$4011]
    .byte $00                               ; [$4011] undefined

DMC_START:                                  ; [$4012]
    .byte $00                               ; [$4012] undefined

DMC_LEN:                                    ; [$4013]
    .byte $00                               ; [$4013] undefined

;
; XREFS:
;     OnInterrupt
;
OAMDMA:                                     ; [$4014]
    .byte $00                               ; [$4014] undefined

;
; XREFS:
;     Audio_InitPlayingState
;     SoundEffects_Init
;
SND_CHN:                                    ; [$4015]
    .byte $00                               ; [$4015] SoundChannels

;
; XREFS:
;     Input_HandleOnInterrupt
;
JOY1:                                       ; [$4016]
    .byte $00                               ; [$4016] undefined1

;
; XREFS:
;     Input_HandleOnInterrupt
;
JOY2:                                       ; [$4017]
    .byte $00                               ; [$4017] undefined1
