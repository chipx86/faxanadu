;============================================================================
; Faxanadu (U).nes
;
; APU_IO ($4000 - $4017)
;============================================================================

    BASE $4000

;
; XREFS:
;     Audio_Reset
;     Music_UpdateSQVol
;     SoundEffect_Handler_PlayerDied
;
SQ1_VOL:                                    ; [$4000]
    db $00                                  ; [$4000] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_Handler_PlayerDied
;
SQ1_SWEEP:                                  ; [$4001]
    db $00                                  ; [$4001] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     Music_UpdateSQLo
;     SoundEffect_Handler_PlayerDied
;
SQ1_LO:                                     ; [$4002]
    db $00                                  ; [$4002] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_Handler_PlayerDied
;
SQ1_HI:                                     ; [$4003]
    db $00                                  ; [$4003] undefined

;
; XREFS:
;     Audio_Reset
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_BreadTouched
;     SoundEffect_Handler_CharacterInput
;     SoundEffect_Handler_CoinDropped
;     SoundEffect_Handler_CoinTouchedCommon
;     SoundEffect_Handler_CursorMoved
;     SoundEffect_Handler_FillHPOrMP
;     SoundEffect_Handler_GoldAmountChanged
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_HitPlayer
;     SoundEffect_Handler_ItemPickedUp
;     SoundEffect_Handler_Magic
;     SoundEffect_Handler_Maybe_Typing
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_Pakukame
;     SoundEffect_Handler_PasswordCharInput
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_ShieldHitByMagic
;     SoundEffect_Handler_ShowPlayerMenu
;     SoundEffect_Handler_Tilte
;
SQ2_VOL:                                    ; [$4004]
    db $00                                  ; [$4004] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_BreadTouched
;     SoundEffect_Handler_CharacterInput
;     SoundEffect_Handler_CoinDropped
;     SoundEffect_Handler_CoinTouchedCommon
;     SoundEffect_Handler_CursorMoved
;     SoundEffect_Handler_FillHPOrMP
;     SoundEffect_Handler_GoldAmountChanged
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_HitPlayer
;     SoundEffect_Handler_ItemPickedUp
;     SoundEffect_Handler_Magic
;     SoundEffect_Handler_Maybe_Typing
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_Pakukame
;     SoundEffect_Handler_PasswordCharInput
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_ShieldHitByMagic
;     SoundEffect_Handler_ShowPlayerMenu
;     SoundEffect_Handler_Tilte
;
SQ2_SWEEP:                                  ; [$4005]
    db $00                                  ; [$4005] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_BreadTouched
;     SoundEffect_Handler_CharacterInput
;     SoundEffect_Handler_CoinDropped
;     SoundEffect_Handler_CoinTouchedCommon
;     SoundEffect_Handler_CursorMoved
;     SoundEffect_Handler_FillHPOrMP
;     SoundEffect_Handler_GoldAmountChanged
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_HitPlayer
;     SoundEffect_Handler_ItemPickedUp
;     SoundEffect_Handler_Magic
;     SoundEffect_Handler_Maybe_Typing
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_Pakukame
;     SoundEffect_Handler_PasswordCharInput
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_ShieldHitByMagic
;     SoundEffect_Handler_ShowPlayerMenu
;     SoundEffect_Handler_Tilte
;
SQ2_LO:                                     ; [$4006]
    db $00                                  ; [$4006] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_BreadTouched
;     SoundEffect_Handler_CharacterInput
;     SoundEffect_Handler_CoinDropped
;     SoundEffect_Handler_CoinTouchedCommon
;     SoundEffect_Handler_CursorMoved
;     SoundEffect_Handler_FillHPOrMP
;     SoundEffect_Handler_GoldAmountChanged
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_HitPlayer
;     SoundEffect_Handler_ItemPickedUp
;     SoundEffect_Handler_Magic
;     SoundEffect_Handler_Maybe_Typing
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_Pakukame
;     SoundEffect_Handler_PasswordCharInput
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_ShieldHitByMagic
;     SoundEffect_Handler_ShowPlayerMenu
;     SoundEffect_Handler_Tilte
;
SQ2_HI:                                     ; [$4007]
    db $00                                  ; [$4007] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayForChannel
;     Music_PlayWave
;     SoundEffect_Handler_PlayerDied
;
TRI_LINEAR:                                 ; [$4008]
    db $00,$00                              ; [$4008] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;     SoundEffect_Handler_PlayerDied
;
TRI_LO:                                     ; [$400a]
    db $00                                  ; [$400a] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayWave
;
TRI_HI:                                     ; [$400b]
    db $00                                  ; [$400b] undefined

;
; XREFS:
;     Audio_Reset
;     Music_PlayNoise
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_EnemyDied
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_LadderDropped
;     SoundEffect_Handler_MagicHitObstacle
;     SoundEffect_Handler_Maybe_Step
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_Message
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_PushBlock
;     SoundEffect_Handler_Tilte
;
NOISE_VOL:                                  ; [$400c]
    db $00                                  ; [$400c] undefined1

;
; XREFS:
;     Music_PlayNoise
;
DAT_400d:                                   ; [$400d]
    db $00                                  ; [$400d] undefined1

;
; XREFS:
;     Audio_Reset
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_EnemyDied
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_LadderDropped
;     SoundEffect_Handler_MagicHitObstacle
;     SoundEffect_Handler_Maybe_Step
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_Message
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_PushBlock
;     SoundEffect_Handler_Tilte
;
NOISE_LO:                                   ; [$400e]
    db $00                                  ; [$400e] undefined

;
; XREFS:
;     Audio_Reset
;     SoundEffect_Handler_0x48
;     SoundEffect_Handler_EnemyDied
;     SoundEffect_Handler_HitEnemy
;     SoundEffect_Handler_LadderDropped
;     SoundEffect_Handler_MagicHitObstacle
;     SoundEffect_Handler_Maybe_Step
;     SoundEffect_Handler_Maybe_UseSpecialItem2
;     SoundEffect_Handler_Message
;     SoundEffect_Handler_OpenDoor
;     SoundEffect_Handler_PlayerDied
;     SoundEffect_Handler_PushBlock
;     SoundEffect_Handler_Tilte
;
NOISE_HI:                                   ; [$400f]
    db $00                                  ; [$400f] undefined

DMC_FREQ:                                   ; [$4010]
    db $00                                  ; [$4010] undefined

;
; XREFS:
;     Sound_Init
;
DMC_RAW:                                    ; [$4011]
    db $00                                  ; [$4011] undefined

DMC_START:                                  ; [$4012]
    db $00                                  ; [$4012] undefined

DMC_LEN:                                    ; [$4013]
    db $00                                  ; [$4013] undefined

;
; XREFS:
;     OnInterrupt
;
OAMDMA:                                     ; [$4014]
    db $00                                  ; [$4014] undefined

;
; XREFS:
;     Sound_Init
;     Sound_InitPlayingState
;
SND_CHN:                                    ; [$4015]
    db $00                                  ; [$4015] SoundChannels

;
; XREFS:
;     Input_HandleOnInterrupt
;
JOY1:                                       ; [$4016]
    db $00                                  ; [$4016] undefined1

;
; XREFS:
;     Input_HandleOnInterrupt
;
JOY2:                                       ; [$4017]
    db $00                                  ; [$4017] undefined1
