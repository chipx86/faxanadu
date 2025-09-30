;============================================================================
; Faxanadu (U).nes
;
; RAM ($0000 - $07ff)
;============================================================================

BASE $0000


;============================================================================
; Temporary variables used throughout the game.
;
; Some of these are used for specific purposes (e.g., addresses), and some
; are more generally-used.
;
; MOD NOTES:
;     These should be safe for custom code to use outside
;     of referenced code paths.
;============================================================================

;
; Generic temporary variable for 1-byte values.
;
;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__9991
;     FUN_PRG14__9d78
;     FUN_PRG14__9df7
;     FUN_PRG14__9e13
;     Maybe_Sprite_HandleDeathDrop
;     Player_DrawShield
;     Player_DrawWeapon
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__97ae
;     SpriteBehavior__a154
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     Sprite_CheckHitByCastMagic
;     Sprite_MoveTowardsPlayerX
;     Sprites_CalcYFromGravity
;     Sprites_IsSpriteOutOfWeaponRange
;     WasPlayerHitByMagic
;     Area_ConvertPixelsToBlockPos
;     Area_LoadBlockProperties
;     Area_SetBlocks
;     CastMagic_FinishHandler_HitWallEffect
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     FUN_PRG15_MIRROR__c033
;     FUN_PRG15_MIRROR__d6ce
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__ec58
;     Maybe_Area_LoadBlocks
;     Maybe_IsSpriteEntityNotOnScreen
;     Maybe_LoadSpritesFromBank8
;     Maybe_Player_DrawSprite
;     Maybe_Player_UpdateArmorSprite
;     Maybe_Player_UpdateVisibleItemStates
;     Maybe_Player_UpdateWeaponSprite
;     Player_DrawBody
;     Player_HandleKnockback
;     Player_Something_ShieldState
;     Screen_Something_ScrollHorizInternal
;     Sprite_Maybe_SetAppearanceAddr
;     Sprites_HasSpritesNotOfType
;     Sprites_LoadImageForCurrentSprite
;
Temp_00:                                    ; [$0000]
    db $00                                  ; [$0000] byte

;
; Generic temporary variable for 1-byte values.
;
;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;     Player_HitEnemyWithMagic
;     Sprite_CheckHitByCastMagic
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_01:                                    ; [$0001]
    db $00                                  ; [$0001] byte

;
; Temporary variable used for address reads.
;
;
; XREFS:
;     GetSpriteBox
;     Player_ApplyDamage
;     Player_DrawWeapon
;     Player_HitEnemyWithMagic
;     Sprite_SomethingFunc__a84f
;     Area_ChangeArea
;     Area_ScrollToNextRoom
;     Area_SetStateFromDoorDestination
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__ee93
;     FUN_PRG15_MIRROR__eea9
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f01b
;     FUN_PRG15_MIRROR__f039
;     FUN_PRG15_MIRROR__f2e3
;     Game_LoadAreaTable
;     LAB_PRG15_MIRROR__e852 [$PRG15_MIRROR::e852]
;     LAB_PRG15_MIRROR__ea13 [$PRG15_MIRROR::ea13]
;     LookupSpriteDataPointer
;     Maybe_LoadSpritesFromBank8
;     Player_CheckSwitchScreen
;     Screen_LoadAllScreenInfo
;     Sprite_Maybe_SetAppearanceAddr
;     Sprite_Maybe_SetAppearanceAddrFromOffset
;
Temp_Addr_L:                                ; [$0002]
    db $00                                  ; [$0002] byte

;
; XREFS:
;     GetSpriteBox
;     Player_ApplyDamage
;     Player_DrawWeapon
;     Sprite_SomethingFunc__a84f
;     Area_ChangeArea
;     Area_ScrollToNextRoom
;     Area_SetStateFromDoorDestination
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__ee93
;     FUN_PRG15_MIRROR__eea9
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f01b
;     FUN_PRG15_MIRROR__f039
;     FUN_PRG15_MIRROR__f2e3
;     Game_LoadAreaTable
;     LookupSpriteDataPointer
;     Maybe_LoadSpritesFromBank8
;     Player_CheckSwitchScreen
;     Screen_LoadAllScreenInfo
;     Sprite_Maybe_SetAppearanceAddrFromOffset
;
Temp_Addr_U:                                ; [$0003]
    db $00                                  ; [$0003] byte

;
; XREFS:
;     Player_ApplyDamage
;     Player_DrawWeapon
;     Something_SetValueAndFFForNeg
;     FUN_PRG15_MIRROR__ec58
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f316
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_04:                                    ; [$0004]
    db $00                                  ; [$0004] byte

;
; XREFS:
;     Player_ApplyDamage
;     Player_DrawWeapon
;     Something_SetValueAndFFForNeg
;     FUN_PRG15_MIRROR__ec58
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f316
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_05:                                    ; [$0005]
    db $00                                  ; [$0005] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d61d
;     FUN_PRG15_MIRROR__d82d
;     Maybe_Area_LoadBlocks
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     Screen_Something_ScrollHorizInternal
;
Temp_06:                                    ; [$0006]
    db $00                                  ; [$0006] byte

;
; Temporary variable used only for vertical line removal.
;
; This is used by
; PPUBuffer_DrawCommand_RemoveVerticalLines,
; which is used during the player death animation.
;
; Outside of that, it's unused by Faxanadu.
;
;
; XREFS:
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;
Temp_07:                                    ; [$0007]
    db $00                                  ; [$0007] byte

;
; XREFS:
;     Area_LoadBlocks
;     Area_LoadNextCompressedScreenBit
;     CHR_LoadTilesetPages
;     LoadPalette2
;     LoadPalette
;     Maybe_Area_LoadBlocks
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     Palette_LoadFromIndex
;     Palette_PopulateData
;     Screen_Something_ScrollHorizInternal
;
Temp_08:                                    ; [$0008]
    db $00                                  ; [$0008] undefined

;
; XREFS:
;     Area_LoadBlocks
;     CHR_LoadTilesetPages
;     LoadPalette2
;     LoadPalette
;     Maybe_Area_LoadBlocks
;     Palette_IndexToROMOffset16
;     Palette_LoadFromIndex
;     Screen_Something_ScrollHorizInternal
;
Temp_09:                                    ; [$0009]
    db $00                                  ; [$0009] byte


;============================================================================
; Saved flags for PPUCTRL.
;
; These are set here so that the intended flags can be applied whenever
; necessary.
;============================================================================

;
; XREFS:
;     FUN_PRG15_MIRROR__d654
;     FUN_PRG15_MIRROR__d673
;     Game_InitScreenAndMusic
;     PPUBuffer_Draw
;     PPU_HandleOnInterrupt
;     PPU_InitVBlank
;     PPU_SetVRAMIncrementAdd1Across
;
SavedPPUCtrl:                               ; [$000a]
    db $00                                  ; [$000a] PPUCtrlFlags


;============================================================================
; The color mode of the screen.
;
; 0 = Color
; 1 = Grayscale
;============================================================================

;
; XREFS:
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__MaybeSugata
;     GameLoop_ClearSprites
;     Game_InitScreenAndMusic
;     PPU_HandleOnInterrupt
;
ScreenColorMode:                            ; [$000b]
    db $00                                  ; [$000b] PPUMaskFlags


;============================================================================
; X delta in pixels used during scrolling
;============================================================================

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Area_ScrollToNextRoom
;     FUN_PRG15_MIRROR__d2ce
;     Game_InitScreenAndMusic
;     Game_InitStateForSpawn
;     PPU_HandleOnInterrupt
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Sprite_Maybe_SetAppearanceAddr
;
ScrollHelp_Pixel:                           ; [$000c]
    db $00                                  ; [$000c] byte


;============================================================================
; X delta in screens used during scrolling
;============================================================================

;
; XREFS:
;     Maybe_Draw_Textbox_Something8F51
;     Area_Maybe_ShowRoomTransition
;     Area_ScrollToNextRoom
;     FUN_PRG15_MIRROR__d82d
;     Game_InitScreenAndMusic
;     Game_InitStateForSpawn
;     PPU_HandleOnInterrupt
;     PPU_SetAddrForTextPos
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Something_SetPPUAddrForXYTransformed
;
ScrollHelp_Screen:                          ; [$000d]
    db $00                                  ; [$000d] byte


;============================================================================
; The ready state for the screen.
;
; This has two states:
;
;     0 = Ready
;     1 = Not Ready (Game not yet playable)
;
; NOTE:
;     Some code checks against alternative states: 1 and 5.
;
;     These do not seem to be used, and appear to be remnants
;     of an older design.
;============================================================================

;
; XREFS:
;     Game_DrawScreenInFrozenState
;     Game_InitStateForSpawn
;     Player_DrawBody
;     Player_HandleDeath
;     Screen_SetupSprites
;
Maybe_ScreenReadyState:                     ; [$000e]
    db $00                                  ; [$000e] LoadedState


;============================================================================
; UNUSED: Fully available for mod purposes.
;============================================================================
    db $00                                  ; [$000f] undefined


;============================================================================
; A latch managing interrupt handling logic.
;
; This is set to 1 when interrupt handlers have been run.
; That includes:
;
; * PPU handling
; * OAM reset
; * Audio/sound playback
; * Input handling.
; * Advancing InterruptCounter
;
; If already 1, PRG15_MIRROR:c999 won't run handlers again.
;
; Callers can set to 0 to request running interrupt handlers.
;============================================================================

;
; XREFS:
;     Game_InitScreenAndMusic
;     OnInterrupt
;     WaitForNextFrame
;
Game_InterruptsHandledLatch:                ; [$0010]
    db $00                                  ; [$0010] bool


;============================================================================
; The previous ROM bank saved before switching to a new bank.
;
; This allows for pushing to a new bank and then popping
; back to this bank.
;============================================================================

;
; XREFS:
;     Game_InitMMCAndBank
;     MMC1_RestorePrevPRGBank
;     MMC1_SavePRGBankAndUpdateTo
;
SavedROMBank:                               ; [$0011]
    db $00                                  ; [$0011] ROMBank


;============================================================================
; State used to help synchronize MMC1 operations.
;
;   0 = Idle
;   1 = Writing to MMC1 (switching banks).
; > 1 = MMC1 is re-initializing.
;============================================================================

;
; XREFS:
;     Game_InitMMCAndBank
;     MMC1_EnsurePRG
;     MMC1_UpdatePRGBank
;
MMC1_ShiftSync:                             ; [$0012]
    db $00                                  ; [$0012] byte


;============================================================================
; Whether to process standard behavior on interrupts.
;
; If 1, then the interrupt handler will manage game
; state, audio, and read button inputs.
;
; If 0, this will all be paused.
;============================================================================

;
; XREFS:
;     FUN_PRG15_MIRROR__cb17
;     FUN_PRG15_MIRROR__cb27
;     Game_InitScreenAndMusic
;     MAYBE_UNUSED_FUN_PRG15_MIRROR__cb1f
;     OnInterrupt
;     PPU_WaitUntilFlushed
;
Game_EnableInterruptHandlers:               ; [$0013]
    db $00                                  ; [$0013] bool


;============================================================================
; Counter tracking state for temporary pausing of interrupt handlers.
;
; When interrupt handlers are paused (by setting
; Game_EnableInterruptHandlers to 0), this will be
; incremented up to a value of 2.
;
; PPU_WaitUntilFlushed will wait for this to hit 2
; before returning, ensuring there's time for the PPU to
; flush before returning to the caller.
;============================================================================

;
; XREFS:
;     OnInterrupt
;     PPU_WaitUntilFlushed
;
PauseInterruptCounter:                      ; [$0014]
    db $00                                  ; [$0014] byte


;============================================================================
; UNUSED: Fully available for mod purposes.
;============================================================================
    db $00                                  ; [$0015] byte


;============================================================================
; Controller port and button state management.
;============================================================================

;
; Buttons last pressed by the player in controller port 1.
;
; Bit 0: Right
; Bit 1: Left
; Bit 2: Down
; Bit 3: Up
; Bit 4: Start
; Bit 5: Select
; Bit 6: B
; Bit 7: A
;
;
; XREFS:
;     PasswordScreen_GetDPadBits
;     Maybe_Player_CalcAnimFrame
;     Player_CastMagic
;     EndGame_MovePlayerTowardKing
;     GameLoop_CheckUseCurrentItem
;     Game_UpdatePlayerOnScroll
;     GetRandom
;     Input_HandleOnInterrupt
;     Maybe_Player_CalcSpeed
;     Player_CheckHandleClimb
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleJump
;     Player_CheckPushingBlock
;     Player_GetBodySpriteFrameOffset
;
Joy1_ButtonMask:                            ; [$0016]
    db $00                                  ; [$0016] ButtonBitmask

;
; Buttons last pressed by the player in controller port 2.
;
; Bit 0: Right
; Bit 1: Left
; Bit 2: Down
; Bit 3: Up
; Bit 4: Start
; Bit 5: Select
; Bit 6: B
; Bit 7: A
;
;
; XREFS:
;     Debug_ChooseArea
;     Input_HandleOnInterrupt
;
Joy2_ButtonMask:                            ; [$0017]
    db $00                                  ; [$0017] ButtonBitmask

;
; Buttons previously pressed before the latest button presses.
;
; This is used to restore any movement or actions invoked
; before a screen scroll or similar.
;
; Bit 0: Right
; Bit 1: Left
; Bit 2: Down
; Bit 3: Up
; Bit 4: Start
; Bit 5: Select
; Bit 6: B
; Bit 7: A
;
;
; XREFS:
;     Game_UpdatePlayerOnScroll
;     Input_HandleOnInterrupt
;
Joy1_PrevButtonMask:                        ; [$0018]
    db $00                                  ; [$0018] ButtonBitmask

;
; Button bits changed since the last interrupt.
;
; Bit 0: Right
; Bit 1: Left
; Bit 2: Down
; Bit 3: Up
; Bit 4: Start
; Bit 5: Select
; Bit 6: B
; Bit 7: A
;
;
; XREFS:
;     FUN_PRG12__84ed
;     FUN_PRG12__8b71
;     FUN_PRG12__9969
;     IScriptAction_AddInventoryItem
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowPassword
;     IScripts_IsBPressed
;     IScripts_Something_992A
;     IScripts_Something_9980
;     Menu_Draw
;     Menu_Something_9405
;     PasswordScreen_GetDPadBits
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Something_9956
;     StartScreen_CheckHandleInput
;     UI_ShowPlayerMenu
;     Player_CastMagic
;     Player_CheckHandlePressUpOnNPC
;     Area_CheckCanClimbAdjacent
;     EndGame_MovePlayerTowardKing
;     GameLoop_CheckPauseGame
;     GameLoop_CheckShowPlayerMenu
;     GameLoop_CheckUseCurrentItem
;     Game_ShowStartScreen
;     Input_HandleOnInterrupt
;     Player_CheckHandleAttack
;     Player_CheckHandleEnterDoor
;     Player_ContinueHandleClimbOrJump
;
Joy1_ChangedButtonMask:                     ; [$0019]
    db $00                                  ; [$0019] ButtonBitmask


;============================================================================
; Additional interrupt handling state.
;============================================================================

;
; A running counter tracking the number of interrupt handlers
; run.
;
;
; XREFS:
;     IScripts_PlayFillingSound
;     IScripts_PlayGoldChangeSound
;     IScripts_Something_99DB
;     IScripts_Something_SetXYAndOffset_99a1
;     IScripts_Something_SetXYAndOffset_99be
;     IScripts_UpdatePortraitAnimation
;     PasswordScreen_Maybe_DrawChar
;     PasswordScreen_WriteWrongPassword
;     SplashAnimation_RunOutro
;     SplashAnimation_SomethingOutroUpdate
;     FUN_PRG14__850d
;     Area_BeginScrollToNextRoom
;     CastMagic_FinishHandler_Death
;     CastMagic_FinishHandler_Deluge
;     CastMagic_FinishHandler_Fire
;     CastMagic_FinishHandler_Thunder
;     CastMagic_FinishHandler_Tilte
;     Game_DecGloveDuration
;     Game_DecHourGlassDuration
;     Game_DecOintmentDuration
;     Game_DecWingBootsDuration
;     Game_WaitForOAMReset
;     OnInterrupt
;     Player_DrawDeathAnimation
;     Player_FallToGround
;     WaitForInterrupt
;
InterruptCounter:                           ; [$001a]
    db $00                                  ; [$001a] byte

;
; Whether the OAM needs to be reset at the next
; interrupt handler.
;
;
; XREFS:
;     Game_WaitForOAMReset
;     OnInterrupt
;
Game_NeedOAMReset:                          ; [$001b]
    db $00                                  ; [$001b] bool

;
; XREFS:
;     Something_FrameAltToggle
;     Sprite_Maybe_SetAppearanceAddr
;
Maybe_FrameAltToggleFlags:                  ; [$001c]
    db $00                                  ; [$001c] undefined1


;============================================================================
; State for animating the fog in the area of Mist.
;============================================================================

;
; Tile offset for a fog tile to animate in Mist.
;
;
; XREFS:
;     Fog_OnTick
;     Fog_UpdateTiles
;
Fog_TileIndex:                              ; [$001d]
    db $00                                  ; [$001d] byte

;
; State index used to determine when to animate fog tiles
; and when to compute new starting tile indexes.
;
;
; XREFS:
;     Fog_OnTick
;     Fog_UpdateTiles
;
Fog_StateIndex:                             ; [$001e]
    db $00                                  ; [$001e] byte


;============================================================================
; PPU ring buffer state.
;
; This is used to schedule draws, utilizing a ring buffer.
; Contents may either be a length count and data up to that
; length to draw, or one or more draw commands up with
; arguments.
;
; See PPUBuffer_Draw.
;============================================================================

;
; Current offset within the buffer to begin adding to or
; drawing from.
;
;
; XREFS:
;     Game_InitStateForSpawn
;     PPUBuffer_Clear
;     PPUBuffer_Draw
;     PPUBuffer_DrawAll
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_SomethingCompareTo0x24
;     PPUBuffer_WaitUntilClear
;     PPU_WaitUntilFlushed
;
PPUBuffer_Offset:                           ; [$001f]
    db $00                                  ; [$001f] byte

;
; Current upper bounds of the ring buffer.
;
; This may wrap from 0xFF -> 0.
;
; Drawing occurs until the offset meets the upper bounds.
;
;
; XREFS:
;     FUN_PRG12__9041
;     FUN_PRG12__92ed
;     IScriptAction_AddItem_Something8EC1
;     Maybe_DrawItemName
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PasswordScreen_DrawMessage
;     Strings_Draw
;     TextBox_Maybe_Draw
;     Area_WriteTwoBlocksFromData12ToPPUBuffer
;     Area_WriteTwoBlocksFromData34ToPPUBuffer
;     FUN_PRG15_MIRROR__c033
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f316
;     Fog_UpdateTiles
;     Game_InitStateForSpawn
;     PPUBuffer_Append0
;     PPUBuffer_Clear
;     PPUBuffer_Draw
;     PPUBuffer_DrawAll
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_SomethingCompareTo0x24
;     PPUBuffer_WaitUntilClear
;     PPUBuffer_WriteValueMany
;     PPU_WaitUntilFlushed
;     Player_DrawDeathAnimation
;     Player_DrawItemInternal
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;     TextBox_Maybe_WriteLineOfChars
;     UI_ClearSelectedItemPic
;     UI_DrawDigitsZeroPadded
;
PPUBuffer_UpperBounds:                      ; [$0020]
    db $00                                  ; [$0020] byte

;
; Temporary state used when drawing from the PPU buffer.
;
; MOD NOTES:
;     This is clobbered by PPUBuffer_Draw, but is
;     otherwise unused and can be reused in self-contained code.
;
;
; XREFS:
;     PPUBuffer_Draw
;
PPUBuffer_Temp_PendingEntryCount:           ; [$0021]
    db $00                                  ; [$0021] byte

;
; Temporary state used when drawing from the PPU buffer.
;
; MOD NOTES:
;     This is clobbered by PPUBuffer_Draw, but is
;     otherwise unused and can be reused in self-contained code.
;
;
; XREFS:
;     PPUBuffer_Draw
;
PPUBuffer_Temp_TotalByteLength:             ; [$0022]
    db $00                                  ; [$0022] byte


;============================================================================
; Temporary value used when populating the PPU nametable.
;
; MOD NOTES:
;     This is clobbered by
;     PPU_InitAttributeAndNameTables,
;     but is otherwise unused and can be reused in
;     self-contained code.
;============================================================================

;
; XREFS:
;     PPU_InitAttributeAndNameTables
;
Temp_PPU_NametableValue:                    ; [$0023]
    db $00                                  ; [$0023] byte


;============================================================================
; The current area the player is in.
;
; $00 = Eolis
; $01 = Apolune
; $02 = Forepaw
; $03 = Mascon
; $04 = Victim
; $05 = Conflate
; $06 = Daybreak
; $07 = Evil Fortress
;============================================================================

;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG14__9991
;     Area_ChangeArea
;     Area_SetStateFromDoorDestination
;     FUN_PRG15_MIRROR__daf6
;     FUN_PRG15_MIRROR__df64
;     Fog_OnTick
;     GameLoop_CheckShowPlayerMenu
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_InitStateForStartScreen
;     Game_LoadAreaTable
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SetupAndLoadArea
;     Game_SpawnInTemple
;     Player_CheckSwitchScreen
;     Player_EnterDoorToInside
;     Player_SetWeapon
;     Player_UseMattock
;     Screen_LoadAllScreenInfo
;
Area_CurrentArea:                           ; [$0024]
    db $00                                  ; [$0024] Area

;
; XREFS:
;     Something_FrameAltToggle
;     Sprite_Maybe_SetAppearanceAddr
;     Sprite_Something_ChangeBitsAndMaybeInc
;
BYTE_0025:                                  ; [$0025]
    db $00                                  ; [$0025] byte


;============================================================================
; Current sprite state.
;============================================================================

;
; Visibility state for the current sprite being processed.
;
; This tracks whether the current sprite is:
;
; $00 = Fully visible by foreground elements
; $01 = Obscured only on the trailing side of the sprite.
; $02 = Obscured only on the leading side of the sprite.
; $03 = Fully obscured
;
; The trailing and leading sides have to do with the direction
; the sprite is facing.
;
;
; XREFS:
;     SUB_PRG14__ba48 [$PRG14::ba48]
;     Something_SetDAT26 [$PRG14::8c7f]
;     SpriteUpdateHandler_Invisible
;     CastMagic_CalculateVisibility
;     Sprite_Maybe_SetAppearanceAddr
;
MovingSpriteVisibility:                     ; [$0026]
    db $00                                  ; [$0026] MovingSpriteVisibility

;
; An argument to Sprite_EnterNextAppearancePhase.
;
; This specifies the X position of the sprite.
;
;
; XREFS:
;     Portrait_SetInnerSpriteXY
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     CurrentSprite_UpdateState
;     Player_DrawShield
;     Player_DrawWeapon
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Unused18
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_Maybe_FinishHandler
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;     Something_SetXYAndAnimOffset
;     Sprite_Maybe_SetAppearanceAddr
;
Maybe_Arg_CurrentSprite_PosX:               ; [$0027]
    db $00                                  ; [$0027] byte

;
; An argument to Sprite_EnterNextAppearancePhase.
;
; This specifies the Y position of the sprite.
;
;
; XREFS:
;     Portrait_SetInnerSpriteXY
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     CurrentSprite_UpdateState
;     Player_DrawShield
;     Player_DrawWeapon
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Unused18
;     CastMagic_FinishHandler_HitWallEffect
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_Maybe_FinishHandler
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;     Something_SetXYAndAnimOffset
;     Sprite_Maybe_SetAppearanceAddr
;
Maybe_Arg_CurrentSprite_PosY:               ; [$0028]
    db $00                                  ; [$0028] byte

;
; The current sprite's flip mask.
;
; This indicates if the sprite is flipped horizontally,
; utilizing only the Facing bit of a sprite or player's flags.
;
; The following values are allowed:
;
; $00 = Facing right (default)
; $40 = Facing left (flipped)
;
;
; XREFS:
;     CurrentSprite_UpdateFlipMask
;     Maybe_Player_CalcAnimFrame
;     Player_DrawShield
;     Player_DrawWeapon
;     SpriteUpdateHandler_Bread
;     SpriteUpdateHandler_Coin
;     SpriteUpdateHandler_Deco_Fountain
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Lamprey
;     SpriteUpdateHandler_Item_Special
;     SpriteUpdateHandler_Item_Standard
;     SpriteUpdateHandler_NPC_ArmorSalesman
;     SpriteUpdateHandler_NPC_Doctor
;     SpriteUpdateHandler_NPC_KeySalesman_Others
;     SpriteUpdateHandler_NPC_King
;     SpriteUpdateHandler_TODO_Garbled_81
;     SpriteUpdateHandler_TODO_Unknown_83
;     CastMagic_FinishHandler_HitWallEffect
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_UpdateSpriteDirection
;     IScripts_DrawPortraitAnimationFrame
;     Player_GetBodySpriteFrameOffset
;     Player_SetFacingLeft
;     Something_SetXYAndAnimOffset
;     Sprite_Maybe_SetAppearanceAddr
;
CurrentSprite_FlipMask:                     ; [$0029]
    db $00                                  ; [$0029] byte

;
; UNUSED: Y scroll position for a sprite.
;
; This is written to but never read from.
;
;
; XREFS:
;     CurrentSprite_UpdateState
;     CastMagic_Maybe_FinishHandler
;     Player_DrawBody
;
Unused_Sprite_ScrollPosY:                   ; [$002a]
    db $00                                  ; [$002a] byte

;
; UNUSED: X scroll position for a sprite.
;
; This is written to but never read from.
;
;
; XREFS:
;     CurrentSprite_UpdateState
;     CastMagic_Maybe_FinishHandler
;     Player_DrawBody
;
Unused_Sprite_ScrollPosX:                   ; [$002b]
    db $00                                  ; [$002b] byte

;
; UNUSED: The following 7 bytes are unused in memory.
;
    db $00,$00,$00,$00,$00,$00,$00          ; [$002c] undefined

;
; XREFS:
;     CurrentSprite_UpdateState
;     Player_DrawShield
;     Player_DrawWeapon
;     SpriteUpdateHandler_Bread
;     SpriteUpdateHandler_Effect_BossDeath
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Unused18
;     SpriteUpdateHandler_Invisible
;     IScripts_DrawPortraitAnimationFrame
;     Something_FrameAltToggle
;     Sprite_Maybe_SetAppearanceAddr
;
Maybe_CurrentSprite_PPUOffset:              ; [$0033]
    db $00                                  ; [$0033] byte

;
; UNUSED: The following 5 bytes are either unused or only
;         written to, never read from.
;
;         All but $0036 are unsafe to use.
;
;
; XREFS:
;     Something_FrameAltToggle
;
Maybe_Unused_0034:                          ; [$0034]
    db $00                                  ; [$0034] byte

;
; XREFS:
;     Something_FrameAltToggle
;
Maybe_Unused_0035:                          ; [$0035]
    db $00,$00                              ; [$0035] byte

;
; XREFS:
;     Something_FrameAltToggle
;
Maybe_Unused_0037:                          ; [$0037]
    db $00                                  ; [$0037] byte

;
; XREFS:
;     Something_FrameAltToggle
;
Maybe_Unused_0038:                          ; [$0038]
    db $00                                  ; [$0038] byte


;============================================================================
; TODO:
;
; A counter set when adding a sprite and reset at each frame.
;
; This seems to be used to limit sprite rendering per-frame.
; Sprite_Maybe_SetAppearanceAddr will only add a
; sprite
; to the screen buffer if this is 0, and will then set it
; to 1 based on some conditions.
;============================================================================

;
; XREFS:
;     Something_FrameAltToggle
;     Sprite_Maybe_SetAppearanceAddr
;     Sprite_Something_ChangeBitsAndMaybeInc
;
Something_Sprites_ResetAtFrame:             ; [$0039]
    db $00                                  ; [$0039] byte

;
; Temporary variable for the lower byte of a sprite's
; image data.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Maybe_Temp_Sprite_L:                        ; [$003a]
    db $00                                  ; [$003a] byte

;
; Temporary variable for the upper byte of a sprite's
; image data.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Maybe_Temp_Sprite_U:                        ; [$003b]
    db $00                                  ; [$003b] byte

;
; Temporary variable for the normalized X position of a sprite.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_Sprites_NormXPos:                      ; [$003c]
    db $00                                  ; [$003c] byte

;
; Temporary variable for the normalized Y position of a sprite.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_Sprites_NormYPos:                      ; [$003d]
    db $00                                  ; [$003d] byte

;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Something_SpriteData_X:                     ; [$003e]
    db $00                                  ; [$003e] byte

;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Something_SpriteData_Y:                     ; [$003f]
    db $00                                  ; [$003f] byte

;
; Temporary variable for the number of sprite tile columns
; remaining to draw.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_Sprites_ColsRemaining:                 ; [$0040]
    db $00                                  ; [$0040] byte

;
; Temporary variable for the number of sprite tile rows
; remaining to draw.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_Sprites_RowsRemaining:                 ; [$0041]
    db $00                                  ; [$0041] byte

;
; Temporary variable for the current X tile offset to draw for
; the sprite.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_Sprites_TileXOffset:                   ; [$0042]
    db $00                                  ; [$0042] byte

;
; Temporary variable for the current Y tile offset to draw for
; the sprite.
;
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
Temp_Sprites_TileYOffset:                   ; [$0043]
    db $00                                  ; [$0043] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d393
;     FUN_PRG15_MIRROR__d3a6
;     Maybe_Area_LoadBlocks
;     Screen_HandleScrollDown
;     Screen_HandleScrollUp
;
Something_Blocks_0044:                      ; [$0044]
    db $00                                  ; [$0044] byte

;
; XREFS:
;     Area_ScrollToNextRoom
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_Something_ScrollHorizInternal
;     Screen_Something_ScrollLeft
;     Screen_Something_ScrollRight
;
Something_Blocks_0045:                      ; [$0045]
    db $00                                  ; [$0045] byte

;
; XREFS:
;     Screen_Something_ScrollHorizInternal
;
Something_Blocks_0046:                      ; [$0046]
    db $00                                  ; [$0046] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Screen_Something_ScrollHorizInternal
;
Something_Blocks_0047:                      ; [$0047]
    db $00                                  ; [$0047] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;
Temp_Blocks_0048:                           ; [$0048]
    db $00                                  ; [$0048] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;
Unused_Blocks_0049:                         ; [$0049]
    db $00                                  ; [$0049] byte

;
; UNUSED: The next 2 bytes are unused by Faxanadu.
;
    db $00,$00                              ; [$004a] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d673
;     Screen_Something_ScrollHorizInternal
;
Something_Blocks_PPUAddr_L:                 ; [$004c]
    db $00                                  ; [$004c] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d673
;     Screen_Something_ScrollHorizInternal
;
Something_Blocks_PPUAddr_U:                 ; [$004d]
    db $00                                  ; [$004d] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d654
;     Maybe_Area_LoadBlocks
;
Something_ShopItem_PPUAddr_L:               ; [$004e]
    db $00                                  ; [$004e] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d654
;     Maybe_Area_LoadBlocks
;
Something_ShopItem_PPUAddr_U:               ; [$004f]
    db $00                                  ; [$004f] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d6b1
;     Screen_Something_ScrollHorizInternal
;
Something_PPUAddr_L:                        ; [$0050]
    db $00                                  ; [$0050] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d6b1
;     Screen_Something_ScrollHorizInternal
;
Something_PPUAddr_U:                        ; [$0051]
    db $00                                  ; [$0051] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d699
;     Maybe_Area_LoadBlocks
;
Something_Blocks_PPUAddr2_L:                ; [$0052]
    db $00                                  ; [$0052] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d699
;     Maybe_Area_LoadBlocks
;
Something_Blocks_PPUAddr2_U:                ; [$0053]
    db $00                                  ; [$0053] byte


;============================================================================
; The screen scrolling direction.
;
; 0 = Left
; 1 = Right
; 2 = Up
; 3 = Down
;============================================================================

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Area_ScrollToNextRoom
;     FUN_PRG15_MIRROR__d2ce
;     GameLoop_UpdatePlayer
;     Game_MainLoop
;     Game_MovePlayerOnScroll
;     Player_CheckHandleJump
;     Screen_HandleScroll
;     Screen_StopScrollAndLoadBlockProperties
;
Screen_ScrollDirection:                     ; [$0054]
    db $00                                  ; [$0054] ScreenScrollDirection

;
; UNUSED: The next 2 bytes are unused by Faxanadu.
;
    db $00,$00                              ; [$0055] undefined

;
; The following are pending a deep-dive. A lot of these
; variables depend on each other.
;
;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     FUN_PRG15_MIRROR__d2ce
;     Game_InitScreenAndMusic
;     Screen_HandleScrollDown
;     Screen_HandleScrollUp
;
Something_ScrollIndex:                      ; [$0057]
    db $00                                  ; [$0057] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;     Player_DrawBody
;     Player_SetInitialState
;     Screen_HandleScrollDown
;     Screen_HandleScrollUp
;     Something_SetupNewScreen
;
Something_Player_ScrollY:                   ; [$0058]
    db $00                                  ; [$0058] byte

;
; XREFS:
;     Area_ScrollToNextRoom
;     Maybe_Area_LoadBlocks
;     Player_DrawBody
;     Player_SetInitialState
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_Something_ScrollHorizInternal
;     Something_SetupNewScreen
;
Something_Player_ScrollX:                   ; [$0059]
    db $00                                  ; [$0059] byte


;============================================================================
; Additional PPU state.
;============================================================================

;
; TODO: Flag that seems to be used to prevent certain kinds of
;       PPU updates. This needs to be investigated further.
;
;
; XREFS:
;     FUN_PRG15_MIRROR__cb3f
;     GameLoop_Maybe_SetupDrawState
;     PPU_HandleOnInterrupt
;     Something_FrameAltToggle
;     Something_FrameAltToggleWithPausePPU
;
PPU_Something_PauseUpdates:                 ; [$005a]
    db $00                                  ; [$005a] bool

;
; Whether to force lower pattern tables when updating the PPU.
;
;
; XREFS:
;     FUN_PRG15_MIRROR__cb3f
;     GameLoop_Maybe_SetupDrawState
;     Game_InitScreenAndMusic
;     PPU_HandleOnInterrupt
;     PPU_WaitUntilFlushed
;
PPU_ForceLowerPatternTables:                ; [$005b]
    db $00                                  ; [$005b] bool


;============================================================================
; Screen block loading state.
;============================================================================

;
; Temporary variable used while loading blocks.
;
;
; XREFS:
;     Area_LoadBlocks
;
Temp_LoadedBlockValue:                      ; [$005c]
    db $00                                  ; [$005c] byte

;
; Temporary variable used to store the loaded blocks count.
;
;
; XREFS:
;     Area_LoadBlocks
;
Temp_LoadedBlocksCount:                     ; [$005d]
    db $00                                  ; [$005d] byte

;
; Current byte offset into the compressed screen data.
;
;
; XREFS:
;     Area_LoadBlocks
;     Area_LoadNextCompressedScreenBit
;
LoadCompressedScreenData_ByteOffset:        ; [$005e]
    db $00                                  ; [$005e] byte

;
; Current bit offset into the current compressed screen byte.
;
;
; XREFS:
;     Area_LoadBlocks
;     Area_LoadNextCompressedScreenBit
;
LoadCompressedScreenData_BitOffset:         ; [$005f]
    db $00                                  ; [$005f] byte

;
; Current compressed screen byte being loaded from.
;
;
; XREFS:
;     Area_LoadNextCompressedScreenBit
;
LoadCompressedScreenData_CurByte:           ; [$0060]
    db $00                                  ; [$0060] byte


;============================================================================
; Player/equipment sprite addresses.
;
; This is used to store the address of each piece of
; equipment the player is wearing. That includes the
; player body/armor, the shield, and the weapon.
;============================================================================

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;     Maybe_Player_LoadArmorSprite
;     Maybe_Player_LoadShieldSprite
;     Maybe_Player_LoadWeaponSprite
;
PlayerSprite_ReadAddr_L:                    ; [$0061]
    db $00                                  ; [$0061] byte

;
; XREFS:
;     Maybe_Player_LoadArmorSprite
;     Maybe_Player_LoadShieldSprite
;     Maybe_Player_LoadWeaponSprite
;
PlayerSprite_ReadAddr_U:                    ; [$0062]
    db $00                                  ; [$0062] byte


;============================================================================
; Area/screen information.
;============================================================================

;
; The (outside) area the player is in.
;
; This is used to reference screens and other information,
; and to restore the appropriate area when exiting a
; building.
;
;
; XREFS:
;     Area_ChangeArea
;     Area_ScrollScreenUp
;     Area_ScrollToNextRoom
;     Debug_ChooseArea
;     EndGame_MoveToKingsRoom
;     FUN_PRG15_MIRROR__df64
;     GameLoop_CheckShowPlayerMenu
;     Game_DropLadderToMascon
;     Game_EnterBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;     Maybe_Area_LoadBlocks
;     Maybe_MoveDownOneScreen
;     Player_CheckHandleClimbUp
;     Player_MoveDownScreen
;     Player_TryMoveLeft
;     Player_TryMoveRight
;     Screen_LoadAllScreenInfo
;     Screen_Something_ScrollHorizInternal
;     Something_SetupNewScreen
;
Area_CurrentScreen:                         ; [$0063]
    db $00                                  ; [$0063] byte

;
; The index of the screen being loaded.
;
;
; XREFS:
;     Area_ChangeArea
;     EndGame_MoveToKingsRoom
;     FUN_PRG15_MIRROR__df64
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;     Player_EnterDoorToOutside
;     Something_SetupNewScreen
;
Area_LoadingScreenIndex:                    ; [$0064]
    db $00                                  ; [$0064] byte

;
; TODO: The area for the current screen.
;
; This isn't quite it.
;
;
; XREFS:
;     Area_ChangeArea
;     EndGame_MoveToKingsRoom
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToInside
;     Something_SetupNewScreen
;
Maybe_Screen_Area:                          ; [$0065]
    db $00                                  ; [$0065] Area

;
; Screen to the left of the currently-visible screen.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     Player_TryMoveLeft
;
Area_ScreenToTheLeft:                       ; [$0066]
    db $00                                  ; [$0066] byte

;
; Screen to the right of the currently-visible screen.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     Player_TryMoveRight
;
Area_ScreenToTheRight:                      ; [$0067]
    db $00                                  ; [$0067] byte

;
; Screen above the currently-visible screen.
;
;
; XREFS:
;     Area_ScrollScreenUp
;     Area_ScrollToNextRoom
;     Player_CheckHandleClimbUp
;
Area_ScreenAbove:                           ; [$0068]
    db $00                                  ; [$0068] byte

;
; Screen below the currently-visible screen.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     Maybe_MoveDownOneScreen
;     Player_MoveDownScreen
;
Area_ScreenBelow:                           ; [$0069]
    db $00                                  ; [$0069] byte

;
; Temporary variable used to store a block position.
;
;
; XREFS:
;     Area_SetStateFromDoorDestination
;
Temp_BlockPos:                              ; [$006a]
    db $00                                  ; [$006a] byte

;
; Temporary variable used to store a block position.
;
;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Temp_BlockPos2:                             ; [$006b]
    db $00                                  ; [$006b] byte

;
; Starting position for a player when changing screens.
;
; This is in $YX position:
;
; Upper nibble = Y position
; Lower nibble = X position / 16
;
;
; XREFS:
;     Area_ChangeArea
;     EndGame_MoveToKingsRoom
;     Game_ExitBuilding
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;     Something_SetupNewScreen
;
Screen_StartPosYX:                          ; [$006c]
    db $00                                  ; [$006c] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
MaybeUnused_006d:                           ; [$006d]
    db $00                                  ; [$006d] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d38e
;     FUN_PRG15_MIRROR__d393
;     FUN_PRG15_MIRROR__d3a6
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHoriz
;     Screen_Something_ScrollHorizInternal
;     Screen_Something_ScrollLeft
;     Screen_Something_ScrollRight
;
Something_Blocks_Counter_006E:              ; [$006e]
    db $00                                  ; [$006e] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData1CurAddr:              ; [$006f]
    db $00                                  ; [$006f] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData2CurAddr:              ; [$0070]
    db $00                                  ; [$0070] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData3CurAddr:              ; [$0071]
    db $00                                  ; [$0071] byte

;
; XREFS:
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData4CurAddr:              ; [$0072]
    db $00                                  ; [$0072] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     FUN_PRG15_MIRROR__d61d
;     Maybe_Area_LoadBlocks
;
Something_0073:                             ; [$0073]
    db $00                                  ; [$0073] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Screen_Something_ScrollHorizInternal
;
Something_0074:                             ; [$0074]
    db $00                                  ; [$0074] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Maybe_Area_LoadBlocks
;
Something_0075:                             ; [$0075]
    db $00                                  ; [$0075] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     Screen_Something_ScrollHorizInternal
;
Something_0076:                             ; [$0076]
    db $00                                  ; [$0076] byte

;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     FUN_PRG15_MIRROR__d61d
;
Something_0077:                             ; [$0077]
    db $00                                  ; [$0077] byte

    db $00,$00                              ; [$0079] undefined

;
; XREFS:
;     Area_LoadBlocks
;     Game_LoadAreaTable
;
Area_ScreenBlocksOffset:                    ; [$007a]
    db $00                                  ; [$007a] byte

;
; XREFS:
;     Game_LoadAreaTable
;
Area_ScreenBlocksOffset.U:                  ; [$007b]
    db $00                                  ; [$007b] byte

;
; XREFS:
;     Game_LoadAreaTable
;
CurrentArea_TableAddr:                      ; [$007c]
    db $00                                  ; [$007c] byte

;
; XREFS:
;     Game_LoadAreaTable
;
CurrentArea_TableAddr.U:                    ; [$007d]
    db $00                                  ; [$007d] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d82d
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;     TextBox_Maybe_GetPaletteBehindTextbox
;
CurrentArea_BlockAttributesAddr:            ; [$007e]
    db $00,$00                              ; [$007e] byte

;
; XREFS:
;     Area_WriteTwoBlocksFromData12ToPPUBuffer
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData1StartAddr:            ; [$0080]
    db $00,$00                              ; [$0080] byte

;
; XREFS:
;     Area_WriteTwoBlocksFromData12ToPPUBuffer
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData2StartAddr:            ; [$0082]
    db $00,$00                              ; [$0082] byte

;
; XREFS:
;     Area_WriteTwoBlocksFromData34ToPPUBuffer
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData3StartAddr:            ; [$0084]
    db $00,$00                              ; [$0084] byte

;
; XREFS:
;     Area_WriteTwoBlocksFromData34ToPPUBuffer
;     Maybe_Area_LoadBlocks
;     Screen_Something_ScrollHorizInternal
;
CurrentArea_BlockData4StartAddr:            ; [$0086]
    db $00,$00                              ; [$0086] byte

;
; XREFS:
;     Area_LoadBlockProperties
;     Game_LoadAreaTable
;
CurrentArea_BlockPropertiesAddr:            ; [$0088]
    db $00                                  ; [$0088] byte

;
; XREFS:
;     Game_LoadAreaTable
;
CurrentArea_BlockPropertiesAddr.U:          ; [$0089]
    db $00                                  ; [$0089] byte

;
; XREFS:
;     Area_ScrollToNextRoom
;     Game_LoadAreaTable
;
CurrentArea_ScrollingDataAddr:              ; [$008a]
    db $00                                  ; [$008a] byte

;
; XREFS:
;     Area_ScrollToNextRoom
;     Game_LoadAreaTable
;
ScrollingData_U:                            ; [$008b]
    db $00                                  ; [$008b] byte

;
; Current area's ROM bank.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
CurrentArea_ROMBank:                        ; [$008c]
    db $00                                  ; [$008c] ROMBank

;
; XREFS:
;     Area_SetStateFromDoorDestination
;     Game_LoadAreaTable
;
CurrentArea_DoorLocationsAddr:              ; [$008d]
    db $00                                  ; [$008d] byte

;
; XREFS:
;     Area_SetStateFromDoorDestination
;     Game_LoadAreaTable
;
CurrentArea_DoorLocationsAddr.U:            ; [$008e]
    db $00                                  ; [$008e] byte

;
; XREFS:
;     Game_LoadAreaTable
;
CurrentArea_DoorDestinationsAddr:           ; [$008f]
    db $00                                  ; [$008f] byte

;
; XREFS:
;     Game_LoadAreaTable
;
CurrentArea_DoorDestinationsAddr.U:         ; [$0090]
    db $00                                  ; [$0090] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;     Maybe_Player_UpdateArmorSprite
;     Maybe_Player_UpdateWeaponSprite
;     Player_Something_ShieldState
;
Maybe_Player_AccessorySpriteAddr_U:         ; [$0091]
    db $00                                  ; [$0091] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;     Maybe_Player_UpdateArmorSprite
;     Maybe_Player_UpdateWeaponSprite
;     Player_Something_ShieldState
;
Maybe_Player_AccessorySpriteAddr_L:         ; [$0092]
    db $00                                  ; [$0092] byte

;
; XREFS:
;     CHR_LoadTilesetPages
;
TilesAddress:                               ; [$0093]
    dw $0000                                ; [$0093] ushort

;
; XREFS:
;     CHR_LoadTilesetPages
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
TilesIndex:                                 ; [$0095]
    db $00                                  ; [$0095] byte


;============================================================================
; Image data addresses for the sprite being drawn.
;============================================================================

;
; Lower byte of pointer to bitmap data of current sprite.
;
;
; XREFS:
;     LookupSpriteDataPointer
;     _copySpriteImage [$PRG15_MIRROR::cdea]
;
CurrentSprite_Image_L:                      ; [$0096]
    db $00                                  ; [$0096] byte

;
; Upper byte of pointer to bitmap data of current sprite.
;
;
; XREFS:
;     LookupSpriteDataPointer
;
CurrentSprite_Image_U:                      ; [$0097]
    db $00                                  ; [$0097] byte


;============================================================================
; PPU row/column information for pending draws.
;============================================================================

;
; The PPU column of the next tile
;
;
; XREFS:
;     PPUResetOffset
;     Sprites_LoadImageForCurrentSprite
;
PPUOffset_Col:                              ; [$0098]
    db $00                                  ; [$0098] byte

;
; The PPU row of the next tile
;
;
; XREFS:
;     PPUResetOffset
;     Sprites_LoadImageForCurrentSprite
;
PPUOffset_Row:                              ; [$0099]
    db $00                                  ; [$0099] byte

;
; The PPU index of the next tile.
;
;
; XREFS:
;     GameLoop_LoadSpriteImages
;     Sprites_LoadImageForCurrentSprite
;
PPUOffset_Index:                            ; [$009a]
    db $00                                  ; [$009a] byte


;============================================================================
; Number of PPU tiles the current sprite needs.
;============================================================================

;
; XREFS:
;     LookupSpriteDataPointer
;     Sprites_LoadImageForCurrentSprite
;
CurrentSprite_PPUTileCount:                 ; [$009b]
    db $00                                  ; [$009b] byte

UNUSED_009C:                                ; [$009c]
    db $00                                  ; [$009c] undefined


;============================================================================
; Player information.
;============================================================================

;
; X position of the player (fractional points).
;
;
; XREFS:
;     Player_TryMoveLeft
;     Player_TryMoveRight
;
PlayerPosX_Frac:                            ; [$009d]
    db $00                                  ; [$009d] byte

;
; X position of the player (full points).
;
; MAYBE: Outside only? See Game_SpawnInTemple.
;
;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__82f8
;     FUN_PRG14__846c
;     FUN_PRG14__9aa1
;     FUN_PRG14__9e13
;     Maybe_Player_CalcAnimFrame
;     Player_CastMagic
;     Player_DrawShield
;     Player_DrawWeapon
;     SpriteBehavior__9060
;     SpriteBehavior__9129
;     SpriteBehavior__95c0
;     SpriteBehavior__97ae
;     Sprite_MoveTowardsPlayerX
;     Area_CanMoveImmediatelyRight
;     Area_CanPlayerMoveLeft
;     Area_CanPlayerMoveRight
;     Area_CanPlayerMoveUp
;     Area_CheckCanClimbAdjacent
;     Area_ScrollToNextRoom
;     Area_SetStateFromDoorDestination
;     EndGame_MovePlayerTowardKing
;     FUN_PRG15_MIRROR__ec58
;     Game_EnterBuilding
;     Game_MovePlayerOnScroll
;     Game_SpawnInTemple
;     Player_CheckHandleClimb
;     Player_CheckHandleJump
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;     Player_DrawBody
;     Player_FallToGround
;     Player_IsClimbing
;     Player_Maybe_MoveIfPassable
;     Player_SetPosAtRightEdge
;     Player_TryMoveLeft
;     Player_TryMoveRight
;     Player_UseMattock
;     Something_SetupNewScreen
;
PlayerPosX_Full:                            ; [$009e]
    db $00                                  ; [$009e] byte

;
; MAYBE: Some kind of counter used when scrolling a screen.
;
; When scrolling to the right, this increments by 2 (via a
; manual increment and by adding carry from updating the
; player position).
;
; When scrolling to the left, this decrements by 1 (via
; subtracting carry from updating player position).
;
;
; XREFS:
;     CurrentSprite_UpdateState
;     Player_DrawWeapon
;     CastMagic_Maybe_FinishHandler
;     Game_MovePlayerOnScroll
;     Player_DrawBody
;     Player_SetInitialState
;     Player_TryMoveRight
;     Something_SetupNewScreen
;
Screen_Maybe_ScrollXCounter:                ; [$009f]
    db $00                                  ; [$009f] byte

;
; XREFS:
;     Player_CheckHandleClimbDown
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleClimbUp
;
BYTE_00a0:                                  ; [$00a0]
    db $00                                  ; [$00a0] byte

;
; Y position of the player
;
; MAYBE: Outside only? See Game_SpawnInTemple.
;
;
; XREFS:
;     GetTextBoxCoordinates
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__831b
;     Player_CastMagic
;     Player_DrawShield
;     Player_DrawWeapon
;     SpriteBehavior__95c0
;     SpriteBehavior__97ae
;     Sprite_MoveTowardsPlayerY
;     Area_CanMoveUp
;     Area_CanPlayerMoveAtY
;     Area_CanPlayerMoveLeft
;     Area_CanPlayerMoveUp
;     Area_CheckCanClimbAdjacent
;     Area_ScrollScreenUp
;     Area_ScrollToNextRoom
;     Area_SetStateFromDoorDestination
;     FUN_PRG15_MIRROR__ec58
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     LAB_PRG15_MIRROR__e49a [$PRG15_MIRROR::e49a]
;     LAB_PRG15_MIRROR__e4a2 [$PRG15_MIRROR::e4a2]
;     Maybe_MoveDownOneScreen
;     Maybe_SetPlayerForScrollUp
;     Player_CheckHandleClimbDown
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleClimbUp
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;     Player_ContinueHandleClimbOrJump
;     Player_DrawBody
;     Player_FallToGround
;     Player_Maybe_MoveIfPassable
;     Player_MoveDownScreen
;     Player_SetPosAtBottomEdge
;     Player_UseMattock
;     Something_SetupNewScreen
;
PlayerPosY:                                 ; [$00a1]
    db $00                                  ; [$00a1] byte

;
; XREFS:
;     CurrentSprite_UpdateState
;     Player_DrawWeapon
;     Area_ScrollScreenUp
;     CastMagic_Maybe_FinishHandler
;     Maybe_MoveDownOneScreen
;     Player_CheckHandleClimbUp
;     Player_DrawBody
;     Player_MoveDownScreen
;     Player_SetInitialState
;     Something_SetupNewScreen
;
Player_Something_ScrollPosY:                ; [$00a2]
    db $00                                  ; [$00a2] undefined1

;
; Tick counter that updates only while moving horizontally.
;
; This will update regardless of whether the player
; is moving horizontally or vertically.
;
;
; XREFS:
;     Maybe_Player_CalcAnimFrame
;     Area_BeginScrollToNextRoom
;     Player_CheckHandleClimbDown
;     Player_CheckHandleClimbUp
;     Player_CheckHandleJump
;     Player_GetBodySpriteFrameOffset
;     Player_HandleDeath
;
Player_MovementTick:                        ; [$00a3]
    db $00                                  ; [$00a3] byte

;
; Current player flags.
;
; Bit 0: Jumping
; Bit 1: Holding to Climb (from jump/move)
; Bit 2: Falling off ledge/ladder
; Bit 3: Can climb
; Bit 4: Climbing
; Bit 5: Moving (actively walking or climbing)
; Bit 6: Facing right (1) or left (0)
; Bit 7: Attacking
;
;
; XREFS:
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     Maybe_Player_CalcAnimFrame
;     Player_CastMagic
;     Player_DrawShield
;     Player_DrawWeapon
;     Player_HitSpriteWithWeapon
;     Player_SetDamagedBySprite
;     SpriteBehavior__9060
;     SpriteBehavior__9129
;     SpriteBehavior__9497
;     SpriteBehavior__95c0
;     SpriteBehavior__97ae
;     EndGame_MoveToKingsRoom
;     FUN_PRG15_MIRROR__ec58
;     GameLoop_CheckUseCurrentItem
;     Game_SpawnInTemple
;     LAB_PRG15_MIRROR__e42c [$PRG15_MIRROR::e42c]
;     Maybe_Game_MainExitBuildingHandler
;     Maybe_Player_CalcSpeed
;     Maybe_SetPlayerForScrollUp
;     Player_CheckHandleAttack
;     Player_CheckHandleClimb
;     Player_CheckHandleClimbDown
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleClimbUp
;     Player_CheckHandleJump
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_ClearJumpingAndHoldingToClimb
;     Player_ContinueHandleClimbOrJump
;     Player_EnterDoorToInside
;     Player_FallToGround
;     Player_GetBodySpriteFrameOffset
;     Player_HandleDeath
;     Player_HandleKnockback
;     Player_IsClimbing
;     Player_KnockbackHoriz
;     Player_SetFacingLeft
;     Player_SetInitialState
;     Player_StayOnLadderAndContinue
;     Player_TryMoveLeft
;     Player_TryMoveRight
;     Player_UseMattock
;
Player_Flags:                               ; [$00a4]
    db $00                                  ; [$00a4] PlayerFlags

;
; Player status bits.
;
; Bit 0: Is attacking
; Bit 1: In knockback
; Bit 7: Wing boots active
;
;
; XREFS:
;     Maybe_Player_CalcAnimFrame
;     Player_SetDamagedBySprite
;     SpriteBehavior__MaybeSugata
;     Game_DecWingBootsDuration
;     Game_DrawScreenInFrozenState
;     Maybe_Player_CalcSpeed
;     Player_CheckHandleAttack
;     Player_CheckHandleClimb
;     Player_CheckHandleClimbDown
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleClimbUp
;     Player_CheckHandleJump
;     Player_GetBodySpriteFrameOffset
;     Player_HandleDeath
;     Player_HandleIFrames
;     Player_SetInitialState
;
Player_StatusFlag:                          ; [$00a5]
    db $00                                  ; [$00a5] PlayerStatusFlags

;
; XREFS:
;     Area_Something_IncDAT00a6
;     [$PRG15_MIRROR::e4b1]
;     Player_CheckHandleClimbMaybeSide
;     Player_ContinueHandleClimbOrJump
;
Something_Player_ClimbLadderCheckPos:       ; [$00a6]
    db $00                                  ; [$00a6] byte

;
; XREFS:
;     Player_DrawWeapon
;     Maybe_Player_UpdateArmorSprite
;
Maybe_Player_NormArmorState:                ; [$00a7]
    db $00                                  ; [$00a7] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;     Maybe_Player_DrawSprite
;     Maybe_Player_UpdateArmorSprite
;     Maybe_Player_UpdateVisibleItemStates
;     Maybe_Player_UpdateWeaponSprite
;     Player_SetInitialState
;     Player_Something_ShieldState
;
Maybe_Player_DAT_00a8:                      ; [$00a8]
    db $00                                  ; [$00a8] byte

;
; Player's walk/run aceleration.
;
; Seems to start around 0xC0, end around 0x180.
;
;
; XREFS:
;     Maybe_Player_CalcSpeed
;     Player_SetInitialState
;     Player_SetStandardAcceleration
;     Player_TryMoveLeft
;     Player_TryMoveRight
;     Player_UpdatePosFromKnockback
;
Player_MoveAcceleration:                    ; [$00a9]
    db $00                                  ; [$00a9] byte

;
; XREFS:
;     Maybe_Player_CalcSpeed
;     Player_SetStandardAcceleration
;     Player_TryMoveLeft
;     Player_TryMoveRight
;     Player_UpdatePosFromKnockback
;
Player_MoveAcceleration.U:                  ; [$00aa]
    db $00                                  ; [$00aa] byte

;
; XREFS:
;     Player_SetInitialState
;
Maybe_Player_DAT_00ab:                      ; [$00ab]
    db $00                                  ; [$00ab] undefined

;
; Time spent in the current attack phase.
;
;
; XREFS:
;     Player_CheckHandleAttack
;
PlayerHitsPhaseTimer:                       ; [$00ac]
    db $00                                  ; [$00ac] byte

;
; Remaining time of invincibility after player was hit by enemy.
;
;
; XREFS:
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     Player_SetDamagedBySprite
;     SpriteBehavior__MaybeSugata
;     Player_HandleDeath
;     Player_HandleIFrames
;     Player_SetInitialState
;
Player_InvincibilityPhase:                  ; [$00ad]
    db $00                                  ; [$00ad] byte

;
; Current attack phase of the player.
;
;
; XREFS:
;     Maybe_Player_CalcAnimFrame
;     Player_HitSpriteWithWeapon
;     FUN_PRG15_MIRROR__ec58
;     Player_CheckHandleAttack
;     Player_GetBodySpriteFrameOffset
;
PlayerHitsPhaseCounter:                     ; [$00ae]
    db $00                                  ; [$00ae] byte

    db $00,$00                              ; [$00b0] undefined

;
; XREFS:
;     Player_CheckHandleClimbMaybeSide
;     Player_StayOnLadderAndContinue
;
Maybe_ClimbLadderOffset:                    ; [$00b1]
    db $00                                  ; [$00b1] byte

;
; Player X position managed during screen scroll.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     Game_MovePlayerOnScroll
;     Player_DrawBody
;
Maybe_PlayerX_ForScroll:                    ; [$00b2]
    db $00                                  ; [$00b2] byte

;
; Player Y position managed during screen scroll.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     Game_MovePlayerOnScroll
;     Player_DrawBody
;
Maybe_PlayerY_ForScroll:                    ; [$00b3]
    db $00                                  ; [$00b3] byte

;
; Counter incrementing while the screen scrolls.
;
; This is used to update the player position at different
; points during a screen scroll.
;
;
; XREFS:
;     Area_ScrollToNextRoom
;     Game_MovePlayerOnScroll
;     Game_UpdatePlayerOnScroll
;     Player_TryMoveLeft
;     Player_TryMoveRight
;
Screen_ScrollPlayerTransitionCounter:       ; [$00b4]
    db $00                                  ; [$00b4] byte


;============================================================================
; Arguments and results for block-related lookups.
;============================================================================

;
; X coordinates of an object (see
; Area_ConvertPixelsToBlockPos).
;
;
; XREFS:
;     CastMagic_Maybe_CheckRightEdgeOrImpassable
;     CastMagic_Maybe_CheckXOrImpassable
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__854c
;     FUN_PRG14__86bd
;     MoveRight
;     SpriteBehavior_MaybeFlyingSomething
;     Area_CanMoveImmediatelyRight
;     Area_CanPlayerMoveLeft
;     Area_CanPlayerMoveRight
;     Area_CheckCanClimbAdjacent
;     Area_ConvertPixelsToBlockPos
;     Area_SetStateFromDoorDestination
;     CastMagic_CalculateVisibility
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;     Player_FallToGround
;     Player_UseMattock
;
Arg_PixelPosX:                              ; [$00b5]
    db $00                                  ; [$00b5] byte

;
; Y coordinates of an object (see
; Area_ConvertPixelsToBlockPos).
;
;
; XREFS:
;     CastMagic_Maybe_CheckImpassableY
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__854c
;     FUN_PRG14__86c6
;     SpriteBehavior_MaybeFlyingSomething
;     Area_CanPlayerMoveAtY
;     Area_CanPlayerMoveUp
;     Area_CheckCanClimbAdjacent
;     Area_ConvertPixelsToBlockPos
;     Area_SetStateFromDoorDestination
;     CastMagic_CalculateVisibility
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;     Player_FallToGround
;     Player_Maybe_MoveIfPassable
;     Player_UseMattock
;
Arg_PixelPosY:                              ; [$00b6]
    db $00                                  ; [$00b6] byte

;
; Result from a block-related computation.
;
; This is used for many different types of operations.
;
;
; XREFS:
;     CastMagic_Maybe_CheckImpassableY
;     CastMagic_SetShouldDisperse
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__864a
;     FUN_PRG14__86c6
;     FUN_PRG14__bd8f
;     MoveSpriteHorizIfPossible
;     MoveSpriteVerticalIfPossible
;     Sprites_SetBlockIsMovingResult
;     Sprites_SetCurrentSpriteCanWalk
;     Area_CanMoveImmediatelyRight
;     Area_CanMoveUp
;     Area_CanPlayerMoveAtY
;     Area_CanPlayerMoveLeft
;     Area_CanPlayerMoveUp
;     Area_CheckCanClimbAdjacent
;     Area_IsBlockClimbable
;     Area_SetStateFromDoorDestination
;     Area_StoreBlockIsAir
;     FUN_PRG15_MIRROR__d6ce
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleEnterDoor
;     Player_CheckIfOnLadder
;     Player_FallToGround
;     Player_Maybe_MoveIfPassable
;
Blocks_Result:                              ; [$00b7]
    db $00                                  ; [$00b7] byte


;============================================================================
; Sprite management.
;============================================================================

;
; Visibility status of the currently-moving sprite.
;
; 0 = Fully visible
; 1 = Trailing side of sprite obscured
; 2 = Leading side of sprite obscured
; 3 = Sprite fully obscured
;
;
; XREFS:
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     CastMagic_CalculateVisibility
;
Temp_MovingSpriteVisibility:                ; [$00b8]
    db $00                                  ; [$00b8] MovingSpriteVisibility

;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__86c6
;
Temp_HitBoxValue:                           ; [$00b9]
    db $00                                  ; [$00b9] byte

;
; X coordinates of the current 8 active sprites.
;
;
; XREFS:
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_UpdateState
;     FUN_PRG14__854c
;     MoveSpriteHorizIfPossible
;     Sprite_CheckHitByCastMagic
;
CurrentSprites_XPos:                        ; [$00ba]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_XPos_7_:                     ; [$00c1]
    db $00                                  ; [7]:

;
; Y coordinates of the current 8 active sprites.
;
;
; XREFS:
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_UpdateState
;     Sprite_CheckHitByCastMagic
;     Sprites_CanSpriteWalk
;
CurrentSprites_YPos:                        ; [$00c2]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     GameLoop_LoadSpriteImages
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_YPos_7_:                     ; [$00c9]
    db $00                                  ; [7]:

;
; An address used to read sprite-related information.
;
; This is used for two purposes:
;
; 1. To store the address of the per-screen sprite
;    information while loading sprites onto the screen.
;
; 2. To store the address of a sprite entity's behavior
;    state when processing a sprite.
;
;
; XREFS:
;     FUN_PRG14__a6bc
;     FUN_PRG14__a734
;     FUN_PRG14__a7f8
;     Screen_IncSpriteInfoAddr
;     SpriteBehavior_Hopper
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior_Walking
;     SpriteBehavior__a8d7
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     SpriteBehavior__aafa
;     Sprite_SomethingFunc__a6e8
;     Sprite_SomethingFunc__a6ff
;     Sprite_SomethingFunc__a74c
;     Sprite_SomethingFunc__a772
;     Sprite_SomethingFunc__a7e5
;     Sprite_SomethingFunc__a84f
;     Sprite_Something__a82a
;     Sprites_Maybe_UpdateBehavior
;     GameLoop_LoadSpriteInfo
;     Screen_LoadAllScreenInfo
;
Sprites_ReadInfoAddr:                       ; [$00ca]
    db $00                                  ; [$00ca] byte

;
; XREFS:
;     FUN_PRG14__a734
;     FUN_PRG14__a7f8
;     Screen_IncSpriteInfoAddr
;     Sprite_SomethingFunc__a74c
;     Sprite_Something__a82a
;     Sprites_Maybe_UpdateBehavior
;     GameLoop_LoadSpriteInfo
;     Screen_LoadAllScreenInfo
;
Sprites_ReadInfoAddr.U:                     ; [$00cb]
    db $00                                  ; [$00cb] byte

;
; XREFS:
;     Screen_LoadAllScreenInfo
;     Screen_LoadSpecialEventID
;     Sprites_LoadSpriteValue
;
Screen_ExtraInfoAddr:                       ; [$00cc]
    db $00                                  ; [$00cc] byte

;
; XREFS:
;     Screen_LoadAllScreenInfo
;     Sprites_LoadSpriteValue
;
Screen_ExtraInfoAddr.U:                     ; [$00cd]
    db $00                                  ; [$00cd] byte

;
; XREFS:
;     Player_DrawWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
PlayerPosXPlus10:                           ; [$00ce]
    db $00                                  ; [$00ce] byte

;
; XREFS:
;     Player_DrawWeapon
;
Maybe_Something_PosX:                       ; [$00cf]
    db $00                                  ; [$00cf] byte

;
; XREFS:
;     Player_DrawWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Maybe_Something_PosY:                       ; [$00d0]
    db $00                                  ; [$00d0] byte

;
; XREFS:
;     Player_DrawWeapon
;
DrawWeapon_Unused_00D1:                     ; [$00d1]
    db $00                                  ; [$00d1] byte


;============================================================================
; Range of the currently-selected weapon
;============================================================================

;
; XREFS:
;     Player_DrawWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Maybe_WeaponRange_X:                        ; [$00d2]
    db $00                                  ; [$00d2] byte

;
; XREFS:
;     Player_DrawWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Maybe_WeaponRange_Y:                        ; [$00d3]
    db $00                                  ; [$00d3] byte


;============================================================================
; State for the blocked path to Mascon.
;
; This is normally completed by opening all fountains
; and clearing the final block, dropping down a ladder
; to Mascon.
;============================================================================

;
; Whether the path to Mascon is currently being opened.
;
; This is set when opening the path. It's never read or
; otherwise used.
;
;
; XREFS:
;     Game_DropLadderToMascon
;     Player_CheckPushingBlock
;     ScreenEvents_HandlePathToMasconEvent
;
PathToMascon_Opening:                       ; [$00d4]
    db $00                                  ; [$00d4] bool

;
; The position of the fountain covering block before Mascon.
;
; This is in $YX byte form.
;
;
; XREFS:
;     Game_OpenPathToMascon
;     Player_CheckPushingBlock
;     ScreenEvents_HandlePathToMasconEvent
;
PathToMascon_FountainCoverPos:              ; [$00d5]
    db $00                                  ; [$00d5] byte

    db $00                                  ; Unused


;============================================================================
; Counts for how long the player pushed against the block before Mascon
;============================================================================

;
; XREFS:
;     Player_CheckPushingBlock
;
BlockPushCounter:                           ; [$00d7]
    db $00                                  ; [$00d7] byte


;============================================================================
; State for animating the ladder on the path to Mascon.
;============================================================================

;
; The current block position for the ladder on the path to
; Mascon.
;
;
; XREFS:
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;
PathToMascon_LadderPos:                     ; [$00d8]
    db $00                                  ; [$00d8] byte

;
; The number of ladder blocks remaining to place when dropping
; down the ladder to Mascon.
;
;
; XREFS:
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;
PathToMascon_LadderBlocksRemaining:         ; [$00d9]
    db $00                                  ; [$00d9] byte


;============================================================================
; An offset into Bank 14 used to generate a random value.
;
; This is used by GetRandom to help generate
; pseudo-random values based on the first 256 bytes of bank 14
; XOR'd with the controller 1 bitmask.
;============================================================================

;
; XREFS:
;     GetRandom
;
Random_Offset:                              ; [$00da]
    db $00                                  ; [$00da] byte


;============================================================================
; IScript and cross-bank call invocation.
;============================================================================

;
; The address of either the IScript being executed or CHR
; data being loaded/drawn.
;
;
; XREFS:
;     IScripts_Begin
;     IScripts_JumpToNextAddr
;     IScripts_LoadByte
;     SplashAnimation_DrawScenery
;     StartScreen_Draw
;     PPU_WriteTilesFromCHRRAM
;     UI_DrawStatusSymbols
;
IScriptOrCHRAddr:                           ; [$00db]
    db $00                                  ; [$00db] byte

;
; XREFS:
;     IScripts_Begin
;     IScripts_JumpToNextAddr
;     IScripts_LoadByte
;     SplashAnimation_DrawScenery
;     StartScreen_Draw
;     PPU_WriteTilesFromCHRRAM
;     UI_DrawStatusSymbols
;
IScriptOrCHRAddr.U:                         ; [$00dc]
    db $00                                  ; [$00dc] byte

;
; The current offset into the IScript being executed.
;
;
; XREFS:
;     IScripts_Begin
;     IScripts_JumpToNextAddr
;     IScripts_LoadByte
;
IScriptOffset:                              ; [$00dd]
    db $00                                  ; [$00dd] byte

;
; Contents of the "A" register saved before performing a
; banked call for an IScript or other operation.
;
;
; XREFS:
;     MMC1_LoadBankAndJump
;
BankedCallSetup_SavedA:                     ; [$00de]
    db $00                                  ; [$00de] byte

;
; Contents of the "X" register saved before performing a
; banked call for an IScript or other operation.
;
;
; XREFS:
;     MMC1_LoadBankAndJump
;
BankedCallSetup_SavedX:                     ; [$00df]
    db $00                                  ; [$00df] byte

;
; Contents of the "Y" register saved before performing a
; banked call for an IScript or other operation.
;
;
; XREFS:
;     MMC1_LoadBankAndJump
;
BankedCallSetup_SavedY:                     ; [$00e0]
    db $00                                  ; [$00e0] byte


;============================================================================
; UNUSED: The following 7 bytes are unused by Faxanadu.
;============================================================================
    db $00,$00,$00,$00,$00,$00,$00          ; [$00e1] undefined


;============================================================================
; PPU drawing-related state.
;============================================================================

;
; The target address in the PPU being drawn to.
;
;
; XREFS:
;     FUN_PRG12__92ed
;     Maybe_DrawItemName
;     Maybe_Draw_Textbox_Something8F51
;     PasswordScreen_DrawMessage
;     SplashAnimation_DrawScenery
;     StartScreen_Draw
;     Area_SetBlocks
;     FUN_PRG15_MIRROR__c033
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f24d
;     FUN_PRG15_MIRROR__f316
;     PPUBuffer_QueueCommandOrLength
;     PPU_IncrementAddrBy
;     PPU_SetAddrForTextPos
;     PPU_WriteTilesFromCHRRAM
;     Player_SetItem
;     Something_SetPPUAddrForXYTransformed
;     TextBox_ClearSizeAtOffset
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_Fill4Lines
;     UI_ClearSelectedItemPic
;     UI_DrawGoldValue
;     UI_DrawManaOrHPBar
;     UI_DrawPlayerExperience
;     UI_DrawStatusSymbols
;     UI_DrawTimeValue
;
PPU_TargetAddr:                             ; [$00e8]
    db $00                                  ; [$00e8] byte

;
; XREFS:
;     FUN_PRG12__92ed
;     Maybe_DrawItemName
;     Maybe_Draw_Textbox_Something8F51
;     PasswordScreen_DrawMessage
;     SplashAnimation_DrawScenery
;     StartScreen_Draw
;     Area_SetBlocks
;     FUN_PRG15_MIRROR__c033
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f24d
;     FUN_PRG15_MIRROR__f316
;     PPUBuffer_QueueCommandOrLength
;     PPU_IncrementAddrBy
;     PPU_SetAddrForTextPos
;     PPU_WriteTilesFromCHRRAM
;     Player_SetItem
;     Something_SetPPUAddrForXYTransformed
;     TextBox_ClearSizeAtOffset
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_Fill4Lines
;     UI_ClearSelectedItemPic
;     UI_DrawGoldValue
;     UI_DrawManaOrHPBar
;     UI_DrawPlayerExperience
;     UI_DrawStatusSymbols
;     UI_DrawTimeValue
;
PPU_TargetAddr.U:                           ; [$00e9]
    db $00                                  ; [$00e9] byte

;
; Tile X position where text will be drawn in a textbox.
;
;
; XREFS:
;     FUN_PRG12__87fe
;     FUN_PRG12__880e
;     FUN_PRG12__8c04
;     FUN_PRG12__9041
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddItem_Something8EC1
;     IScripts_Something_81E8
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Draw
;     Shop_DrawItemStrings
;     SplashAnimation_FuncAA94
;     TextBox_Maybe_Draw
;     UI_ShowPlayerMenu
;     FUN_PRG15_MIRROR__f7b7
;     PPU_SetAddrForTextPos
;     TextBox_Maybe_GetPaletteBehindTextbox
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_TextX:                              ; [$00ea]
    db $00                                  ; [$00ea] byte

;
; Tile Y position where text will be drawn in a textbox.
;
;
; XREFS:
;     FUN_PRG12__87fe
;     FUN_PRG12__880e
;     FUN_PRG12__8c04
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddItem_Something8EC1
;     IScripts_Something_81E8
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Draw
;     Shop_DrawItemStrings
;     SplashAnimation_FuncAA94
;     TextBox_Maybe_Draw
;     UI_ShowPlayerMenu
;     FUN_PRG15_MIRROR__f7b7
;     PPU_SetAddrForTextPos
;     TextBox_Maybe_GetPaletteBehindTextbox
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_TextY:                              ; [$00eb]
    db $00                                  ; [$00eb] byte


;============================================================================
; Additional temporary variables.
;============================================================================

;
; Temporary variable most often used for 24-bit values.
;
; This is not exclusive to 24-bit values. In some places, this
; is used for 16-bit values. In others, 8-bit values.
;
;
; XREFS:
;     FUN_PRG12__880e
;     FUN_PRG12__9075
;     FUN_PRG12__aa20
;     FUN_PRG12__aa46
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     IScriptAction_SpendGold
;     IScripts_CheckEnoughMoney
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     IScripts_SellMenu_Something8704
;     Maybe_DrawItemName
;     Maybe_DrawItemTitle
;     Maybe_Draw_Textbox_Something8F51
;     PasswordScreen_DrawMessage
;     PasswordScreen_Show
;     Password_DecodeValue
;     Password_EncodeValue
;     PlayerMenu_Maybe_ShowStatus
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Shop_Draw
;     Shop_Populate
;     Something_ShopCursorInventory
;     SplashAnimation_A90F
;     SplashAnimation_DrawScenery
;     SplashAnimation_FuncAA94
;     SplashAnimation_Maybe_NextAnimState1
;     SplashAnimation_Maybe_NextAnimState2
;     StartScreen_Draw
;     Strings_Draw
;     UI_DrawText
;     UI_ShowPlayerMenu
;     Player_AddExperienceFromSprite
;     FUN_PRG15_MIRROR__f7b7
;     FUN_PRG15_MIRROR__fbaf
;     FUN_PRG15_MIRROR__fbf0
;     MMC1_LoadBankAndJump
;     Messages_Load
;     PPUBuffer_WriteFromTemp
;     PPU_LoadGlyphsForStrings
;     PPU_WriteGlyphTile
;     PPU_WriteTilesFromCHRRAM
;     Player_Add100XP
;     Player_AddGold
;     Player_SubtractGold
;     Player_UpdateExperience
;     TextBox_Maybe_GetPaletteBehindTextbox
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;     TextBox_Something_ShowMessage_f4a2
;     UI_DrawDigitsZeroPadded
;     UI_DrawGoldValue
;     UI_DrawManaOrHPBar
;     UI_DrawPlayerExperience
;     UI_DrawTimeValue
;     UI_GetValueForDigit
;
Temp_Int24:                                 ; [$00ec]
    db $00                                  ; [$00ec] byte

;
; XREFS:
;     FUN_PRG12__87fe
;     FUN_PRG12__880e
;     FUN_PRG12__aa20
;     FUN_PRG12__aa46
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     IScriptAction_SpendGold
;     IScripts_CheckEnoughMoney
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     Maybe_DrawItemTitle
;     PasswordScreen_DrawMessage
;     PasswordScreen_Show
;     Password_EncodeValue
;     PlayerMenu_Maybe_ShowStatus
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Shop_Draw
;     Something_ShopCursorInventory
;     SplashAnimation_DrawScenery
;     SplashAnimation_FuncAA94
;     SplashAnimation_Maybe_NextAnimState1
;     SplashAnimation_Maybe_NextAnimState2
;     StartScreen_Draw
;     UI_ShowPlayerMenu
;     Player_AddExperienceFromSprite
;     FUN_PRG15_MIRROR__f7b7
;     FUN_PRG15_MIRROR__fbf0
;     MMC1_LoadBankAndJump
;     Messages_Load
;     PPU_LoadGlyphsForStrings
;     Player_Add100XP
;     Player_AddGold
;     Player_SubtractGold
;     Player_UpdateExperience
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;     UI_DrawGoldValue
;     UI_DrawPlayerExperience
;     UI_DrawTimeValue
;     UI_GetValueForDigit
;
Temp_Int24.M:                               ; [$00ed]
    db $00                                  ; [$00ed] byte

;
; XREFS:
;     IScriptAction_ShowSellMenu
;     Password_DecodeValueList
;     Password_EncodeGameState
;     Password_EncodeValueList
;     Password_Load
;     PlayerMenu_Maybe_ShowStatus
;     Player_AddToInventory
;     Player_RemoveItem
;     Shop_Draw
;     SplashAnimation_FuncAA94
;     StartScreen_Draw
;     Strings_Draw
;     MMC1_LoadBankAndJump
;     Player_DrawItemInternal
;     UI_DrawGoldValue
;     UI_DrawManaOrHPBar
;     UI_DrawPlayerExperience
;     UI_DrawTimeValue
;     UI_GetValueForDigit
;
Temp_Int24.U:                               ; [$00ee]
    db $00                                  ; [$00ee] byte

;
; XREFS:
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     Player_RemoveItem
;     MMC1_LoadBankAndJump
;     Player_DrawItemInternal
;     UI_DrawManaOrHPBar
;
Maybe_Temp4:                                ; [$00ef]
    db $00                                  ; [$00ef] byte


;============================================================================
; UNUSED: The following 2 bytes are unused by Faxanadu.
;============================================================================
    db $00,$00                              ; [$00f0] undefined


;============================================================================
; All music notes being played.
;============================================================================
CurrentMusicInfo1:                          ; [$00f2]
    db $00                                  ; [$00f2] byte

CurrentMusicInfo2:                          ; [$00f3]
    db $00                                  ; [$00f3] byte

CurrentMusicInfo3:                          ; [$00f4]
    db $00                                  ; [$00f4] byte

CurrentMusicInfo4:                          ; [$00f5]
    db $00                                  ; [$00f5] byte

CurrentMusicInfo5:                          ; [$00f6]
    db $00                                  ; [$00f6] byte

CurrentMusicInfo6:                          ; [$00f7]
    db $00                                  ; [$00f7] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
CurrentMusicInfo7:                          ; [$00f8]
    db $00                                  ; [$00f8] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
CurrentMusicInfo8:                          ; [$00f9]
    db $00                                  ; [$00f9] byte


;============================================================================
; XXX Music, but MSB seems to be set when playing?
;============================================================================

;
; XREFS:
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     StartScreen_Draw
;     SpriteBehavior__9fe3
;     Area_BeginScrollToNextRoom
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_ShowStartScreen
;     Player_CheckHandleEnterDoor
;     Player_HandleDeath
;     Player_UseHourGlass
;     ScreenEvents_HandleBoss
;     ScreenEvents_HandleFinalBossKilled
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8106
;     FUN_PRG5__84b7
;     Sound_InitPlayingState
;
CurrentMusic:                               ; [$00fa]
    db $00                                  ; [$00fa] Music

;
; XREFS:
;     PlaySoundInner
;     Sound_HandleOnInterrupt
;     Sound_InitPlayingState
;
NextSoundEffect:                            ; [$00fb]
    db $00                                  ; [$00fb] byte

    db $00,$00,$00                          ; [$00fd] undefined

irq:                                        ; [$00ff]
    db $00                                  ; [$00ff] undefined


;============================================================================
; The currently-loaded ROM bank
;============================================================================

;
; XREFS:
;     Area_LoadBlockProperties
;     Area_ScrollToNextRoom
;     Area_SetBlocks
;     Area_SetStateFromDoorDestination
;     CHR_LoadTilesetPages
;     FUN_PRG15_MIRROR__ee93
;     FUN_PRG15_MIRROR__eea9
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f01b
;     FUN_PRG15_MIRROR__f039
;     FUN_PRG15_MIRROR__f2e3
;     FUN_PRG15_MIRROR__f316
;     FUN_PRG15_MIRROR__f7b7
;     FUN_PRG15_MIRROR__fbaf
;     GameLoop_LoadSpriteInfo
;     Game_DrawScreenInFrozenState
;     Game_InitMMCAndBank
;     Game_InitScreenAndMusic
;     Game_LoadAreaTable
;     LoadPalette2
;     LoadPalette
;     LookupSpriteDataPointer
;     MMC1_EnsurePRG
;     MMC1_LoadBankAndJump
;     MMC1_SavePRGBankAndUpdateTo
;     MMC1_UpdatePRGBank
;     Maybe_LoadSpritesFromBank8
;     Maybe_Player_LoadArmorSprite
;     Maybe_Player_LoadShieldSprite
;     Maybe_Player_LoadWeaponSprite
;     Messages_Load
;     OnInterrupt
;     PPU_LoadGlyphsForStrings
;     PPU_WriteTilesFromCHRRAM
;     Palette_PopulateData
;     Player_DrawItemInternal
;     Screen_HandleScrollDown
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_HandleScrollUp
;     Sprite_Maybe_SetAppearanceAddrFromOffset
;     Sprites_LoadSpriteValue
;     TextBox_Maybe_GetPaletteBehindTextbox
;     TextBox_Maybe_ShowNextCharFromBank
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowNextChar
;     _loadSpriteToPPUBuffer [$PRG15_MIRROR::cdd1]
;
CurrentROMBank2:                            ; [$0100]
    db $00                                  ; [$0100] ROMBank
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$0101] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$0111] undefined


;============================================================================
; Whether the game is currently paused.
;============================================================================

;
; XREFS:
;     GameLoop_CheckPauseGame
;     Game_InitScreenAndMusic
;     Audio_HandleOnInterrupt
;     Sound_InitPlayingState
;
PauseFlag:                                  ; [$0120]
    db $00                                  ; [$0120] bool


;============================================================================
; The ID of the current sound being played.
;============================================================================

;
; XREFS:
;     PlaySoundInner
;     Sound_Init
;     Sound_InitPlayingState
;     Sound_ResetCurrentSound
;
CurrentSoundIndex:                          ; [$0121]
    db $00                                  ; [$0121] byte

;
; XREFS:
;     Sound_HandleOnInterrupt
;     Sound_InitPlayingState
;     Sound_ResetCurrentSound
;
SOUND_DAT_0122:                             ; [$0122]
    db $00                                  ; [$0122] byte

;
; XREFS:
;     FUN_PRG5__8132
;     FUN_PRG5__820d
;     FUN_PRG5__8326
;     Sound_HandleOnInterrupt
;     Sound_Init
;
SOUND_DAT_0123:                             ; [$0123]
    db $00                                  ; [0]:

;
; XREFS:
;     Sound_HandleOnInterrupt
;     Sound_Init
;
SOUND_DAT_0124:                             ; [$0124]
    db $00                                  ; [1]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;     Sound_HandleOnInterrupt
;     Sound_Init
;
SOUND_DAT_0125:                             ; [$0125]
    db $00                                  ; [2]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__82ff
;     Sound_HandleOnInterrupt
;     Sound_Init
;
SOUND_DAT_0126:                             ; [$0126]
    db $00                                  ; [3]:
    db $00                                  ; [$0127] undefined1

    db $00,$00                              ; [$0129] undefined

;
; XREFS:
;     FUN_PRG5__8ed1
;
BYTE_012a:                                  ; [$012a]
    db $00                                  ; [$012a] byte

;
; XREFS:
;     FUN_PRG5__8ed1
;
BYTE_012b:                                  ; [$012b]
    db $00                                  ; [$012b] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8298
;     FUN_PRG5__83ad
;
BYTE_012c:                                  ; [$012c]
    db $00                                  ; [$012c] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_012d:                       ; [$012d]
    db $00                                  ; [$012d] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_012e:                       ; [$012e]
    db $00                                  ; [$012e] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_012f:                       ; [$012f]
    db $00                                  ; [$012f] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8106
;     FUN_PRG5__83ad
;     FUN_PRG5__8408
;
Something_Music_0130:                       ; [$0130]
    db $00                                  ; [0]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8106
;
Something_Music_0131:                       ; [$0131]
    db $00                                  ; [1]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0132:                       ; [$0132]
    db $00                                  ; [2]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0133:                       ; [$0133]
    db $00                                  ; [3]:
    db $00,$00,$00,$00                      ; [$0134] undefined

;
; XREFS:
;     FUN_PRG5__841f
;     FUN_PRG5__8458
;
DAT_0138:                                   ; [$0138]
    db $00                                  ; [$0138] undefined

;
; XREFS:
;     FUN_PRG5__841f
;     FUN_PRG5__8458
;
DAT_0139:                                   ; [$0139]
    db $00,$00,$00,$00,$00,$00,$00          ; [$0139] undefined

;
; XREFS:
;     FUN_PRG5__843d
;     FUN_PRG5__8458
;
DAT_0140:                                   ; [$0140]
    db $00                                  ; [$0140] undefined

;
; XREFS:
;     FUN_PRG5__843d
;     FUN_PRG5__8458
;
DAT_0141:                                   ; [$0141]
    db $00,$00,$00,$00,$00,$00,$00          ; [$0141] undefined

;
; XREFS:
;     FUN_PRG5__841f
;     FUN_PRG5__8458
;
DAT_0148:                                   ; [$0148]
    db $00,$00,$00,$00                      ; [$0148] undefined

;
; XREFS:
;     FUN_PRG5__841f
;     FUN_PRG5__843d
;     FUN_PRG5__8458
;
DAT_014c:                                   ; [$014c]
    db $00,$00,$00,$00                      ; [$014c] undefined

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8495
;     FUN_PRG5__84a5
;
DAT_0150:                                   ; [$0150]
    db $00                                  ; [$0150] undefined

;
; XREFS:
;     FUN_PRG5__8495
;     FUN_PRG5__84a5
;
DAT_0151:                                   ; [$0151]
    db $00,$00,$00,$00,$00,$00,$00          ; [$0151] undefined

;
; XREFS:
;     FUN_PRG5__84d0
;     FUN_PRG5__84f0
;
DAT_0158:                                   ; [$0158]
    db $00                                  ; [$0158] undefined

;
; XREFS:
;     FUN_PRG5__84d0
;     FUN_PRG5__84f0
;
DAT_0159:                                   ; [$0159]
    db $00,$00,$00,$00,$00,$00,$00          ; [$0159] undefined

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__83cd
;     FUN_PRG5__850e
;
Music_Something_8Counter:                   ; [$0160]
    db $00                                  ; [$0160] undefined1

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__83cd
;     FUN_PRG5__8502
;
Something_Music_0161:                       ; [$0161]
    db $00                                  ; [$0161] undefined

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0162:                       ; [$0162]
    db $00                                  ; [$0162] undefined

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0163:                       ; [$0163]
    db $00                                  ; [$0163] undefined

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8298
;     FUN_PRG5__8326
;
Something_Music_0164:                       ; [$0164]
    db $00                                  ; [0]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8326
;
Something_Music_0165:                       ; [$0165]
    db $00                                  ; [1]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0166:                       ; [$0166]
    db $00                                  ; [2]:

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0167:                       ; [$0167]
    db $00                                  ; [3]:

;
; XREFS:
;     FUN_PRG5__82e3
;     FUN_PRG5__82ff
;
BYTE_0168:                                  ; [$0168]
    db $00                                  ; [$0168] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__823a
;     FUN_PRG5__82e3
;     FUN_PRG5__82ff
;
Something_Music_0169:                       ; [$0169]
    db $00                                  ; [$0169] byte

;
; XREFS:
;     FUN_PRG5__8106
;     FUN_PRG5__8132
;     FUN_PRG5__81f1
;     FUN_PRG5__820d
;     FUN_PRG5__823a
;     FUN_PRG5__8298
;     FUN_PRG5__82e3
;     FUN_PRG5__8326
;     FUN_PRG5__83ad
;     FUN_PRG5__83cd
;     FUN_PRG5__8408
;     FUN_PRG5__841f
;     FUN_PRG5__843d
;     FUN_PRG5__8458
;     FUN_PRG5__8483
;     FUN_PRG5__8495
;     FUN_PRG5__84a5
;     FUN_PRG5__84d0
;     FUN_PRG5__84f0
;     FUN_PRG5__8502
;     FUN_PRG5__8517
;     FUN_PRG5__8523
;     FUN_PRG5__852f
;     FUN_PRG5__8544
;
Maybe_SomethingMusicDestOffset:             ; [$016a]
    db $00                                  ; [$016a] byte

;
; XREFS:
;     FUN_PRG5__8106
;     FUN_PRG5__8408
;
Maybe_Something_MusicCounter:               ; [$016b]
    db $00                                  ; [$016b] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8132
;     FUN_PRG5__81f1
;     FUN_PRG5__823a
;     FUN_PRG5__828e
;     FUN_PRG5__8298
;     FUN_PRG5__8326
;     FUN_PRG5__83b7
;     FUN_PRG5__83cd
;
Something_Music_016c:                       ; [$016c]
    db $00                                  ; [$016c] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8326
;     FUN_PRG5__83cd
;
Something_Music_016d:                       ; [$016d]
    db $00                                  ; [$016d] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8326
;     FUN_PRG5__83cd
;
Something_Music_016e:                       ; [$016e]
    db $00                                  ; [$016e] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__83cd
;
Something_Music_016f:                       ; [$016f]
    db $00                                  ; [$016f] byte

;
; XREFS:
;     FUN_PRG5__8132
;     FUN_PRG5__8326
;
BYTE_0170:                                  ; [$0170]
    db $00,$00                              ; [$0170] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__81f1
;     FUN_PRG5__8483
;
Something_Music_0172:                       ; [$0172]
    db $00                                  ; [$0172] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0173:                       ; [$0173]
    db $00                                  ; [$0173] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__81f1
;     FUN_PRG5__8517
;
Something_Music_0174:                       ; [$0174]
    db $00                                  ; [$0174] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0175:                       ; [$0175]
    db $00                                  ; [$0175] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8132
;     FUN_PRG5__8523
;
Something_Music_0176:                       ; [$0176]
    db $00                                  ; [$0176] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0177:                       ; [$0177]
    db $00                                  ; [$0177] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__820d
;     FUN_PRG5__83b7
;
Something_Music_0178:                       ; [$0178]
    db $00                                  ; [$0178] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8132
;     FUN_PRG5__820d
;     FUN_PRG5__8326
;
Something_Music_0179:                       ; [$0179]
    db $00                                  ; [$0179] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8326
;
Something_Music_017a:                       ; [$017a]
    db $00,$00                              ; [$017a] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__820d
;     FUN_PRG5__8326
;
Something_Music_017c:                       ; [$017c]
    db $00                                  ; [$017c] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8326
;
Something_Music_017d:                       ; [$017d]
    db $00                                  ; [$017d] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8132
;     FUN_PRG5__83b7
;
Something_Music_017e:                       ; [$017e]
    db $00                                  ; [$017e] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__820d
;     FUN_PRG5__852f
;
Something_Music_017f:                       ; [$017f]
    db $00                                  ; [$017f] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;
Something_Music_0180:                       ; [$0180]
    db $00                                  ; [$0180] byte

;
; XREFS:
;     Audio_HandleOnInterrupt
;     FUN_PRG5__8326
;     FUN_PRG5__853b
;
Something_Music_0181:                       ; [$0181]
    db $00                                  ; [$0181] byte

    hex 00 00 00 00 00 00 00 00             ; [$0183] undefined

;
; XREFS:
;     Screen_Something_ScrollHorizInternal
;
DAT_018a:                                   ; [$018a]
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$018a] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$019a] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$01aa] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$01ba] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$01ca] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$01da] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$01ea] undefined
    db $00,$00,$00,$00,$00,$00              ; [$01fa] undefined

;
; XREFS:
;     IScripts_Begin
;     FUN_PRG15_MIRROR__d673
;     Game_Init
;     Screen_Something_ScrollHorizInternal
;
Temp_0200:                                  ; [$0200]
    db $00                                  ; [$0200] byte

;
; XREFS:
;     GetTextBoxCoordinates
;     IScriptAction_EndScript
;     IScripts_Begin
;     IScripts_UpdatePortraitAnimation
;     FUN_PRG15_MIRROR__d673
;     Screen_Something_ScrollHorizInternal
;
IScriptEntity:                              ; [$0201]
    db $00                                  ; [$0201] IScriptEntity

;
; XREFS:
;     IScriptAction_AddGold
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     IScriptAction_SpendGold
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     Screen_Something_ScrollHorizInternal
;
Temp_0202:                                  ; [$0202]
    db $00                                  ; [$0202] byte

;
; XREFS:
;     IScriptAction_AddGold
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     IScriptAction_SpendGold
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     Screen_Something_ScrollHorizInternal
;
Temp_0203:                                  ; [$0203]
    db $00                                  ; [$0203] byte

    db $00

;
; XREFS:
;     IScriptAction_ShowSellMenu
;
Maybe_Shop_InventoryBitmask:                ; [$0205]
    db $00                                  ; [$0205] byte

;
; XREFS:
;     IScriptAction_AddHP
;     IScriptAction_AddMP
;
IScript_HPOrMPValueToAdd:                   ; [$0206]
    db $00                                  ; [$0206] byte

;
; XREFS:
;     IScriptAction_ShowPassword
;
IScripts_Unused_207:                        ; [$0207]
    db $00                                  ; [$0207] byte


;============================================================================
; X tile position of a displayed textbox.
;============================================================================

;
; XREFS:
;     FUN_PRG12__8bed
;     FUN_PRG12__8c04
;     GetTextBoxCoordinates
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddItem_Something8EC1
;     IScripts_Something_81E8
;     IScripts_Something_99DB
;     IScripts_Something_SetXYAndOffset_99a1
;     IScripts_Something_SetXYAndOffset_99be
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PlayerMenu_Maybe_ShowStatus
;     Portrait_Clear
;     Portrait_SetCoords
;     Shop_Draw
;     Shop_DrawItemStrings
;     TextBox_GetCursorXForTileX1
;     TextBox_Maybe_Draw
;     UI_ShowPlayerMenu
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_X:                                  ; [$0208]
    db $00                                  ; [$0208] byte


;============================================================================
; Y tile position of a displayed textbox.
;============================================================================

;
; XREFS:
;     FUN_PRG12__8bed
;     FUN_PRG12__8c04
;     GetTextBoxCoordinates
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddItem_Something8EC1
;     IScripts_Something_81E8
;     IScripts_Something_99DB
;     IScripts_Something_SetXYAndOffset_99a1
;     IScripts_Something_SetXYAndOffset_99be
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PlayerMenu_Maybe_ShowStatus
;     Portrait_Clear
;     Portrait_SetCoords
;     Shop_Draw
;     Shop_DrawItemStrings
;     TextBox_GetCursorYForTileY2
;     TextBox_Maybe_Draw
;     UI_ShowPlayerMenu
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_Y:                                  ; [$0209]
    db $00                                  ; [$0209] byte


;============================================================================
; Width of a displayed textbox.
;============================================================================

;
; XREFS:
;     FUN_PRG12__8bed
;     GetTextBoxCoordinates
;     IScriptAction_AddItem_Something8EC1
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PlayerMenu_Maybe_ShowStatus
;     Portrait_Clear
;     Portrait_SetCoords
;     Shop_Draw
;     UI_ShowPlayerMenu
;     TextBox_QueueRightCoordInPPUBuffer
;
TextBox_Width:                              ; [$020a]
    db $00                                  ; [$020a] byte


;============================================================================
; Height of a displayed textbox.
;============================================================================

;
; XREFS:
;     FUN_PRG12__8bed
;     GetTextBoxCoordinates
;     IScriptAction_AddItem_Something8EC1
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PlayerMenu_Maybe_ShowStatus
;     Portrait_Clear
;     Portrait_SetCoords
;     Shop_Draw
;     TextBox_Maybe_Draw
;     UI_ShowPlayerMenu
;
TextBox_Height:                             ; [$020b]
    db $00                                  ; [$020b] byte

;
; XREFS:
;     Maybe_Draw_Textbox
;     TextBox_Maybe_Draw
;     TextBox_Maybe_GetPalette
;
Maybe_TextBox_Dismissed:                    ; [$020c]
    db $00                                  ; [$020c] byte

    db $00                                  ; Unused


;============================================================================
; Inventory corresponding to the Player Menu selection.
;============================================================================

;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG12__8bce
;     FUN_PRG12__8c04
;     UI_ShowPlayerMenu
;
PlayerMenu_SelectedInventory:               ; [$020e]
    db $00                                  ; [$020e] byte

    db $00                                  ; Unused


;============================================================================
; Temporary state for the new inventory item.
;
; This is used when equipping an item in Player_Equip
; to store the new item for the purpose of equipping it.
;============================================================================

;
; XREFS:
;     Player_Equip
;
Temp_EquipingItem:                          ; [$0210]
    db $00                                  ; [$0210] byte


;============================================================================
; Temporary state for the previous inventory item.
;
; This is used when equipping an item in Player_Equip
; to store the previous item for the purpose of unequipping it.
;============================================================================

;
; XREFS:
;     Player_Equip
;
Temp_PrevInventoryItem:                     ; [$0211]
    db $00                                  ; [$0211] byte

;
; XREFS:
;     TextBox_Maybe_ShowNextCharFromBank
;     TextBox_ShowMessageWithSound
;     TextBox_ShowNextChar
;
TextBox_PlayTextSound:                      ; [$0212]
    db $00                                  ; [$0212] bool


;============================================================================
; ID of the message to show in a textbox.
;
; This would be a 1-based index into MESSAGE_STRINGS.
;============================================================================

;
; XREFS:
;     IScripts_Something_992A
;     IScripts_Something_9980
;     IScripts_UpdatePortraitAnimation
;     Shop_Something_9956
;     Maybe_Menu_ShowMessageID
;     Maybe_TextBox_ShowCurrentMessageID
;     Messages_Load
;     TextBox_ShowMessage_Pause
;
MessageID:                                  ; [$0213]
    db $00                                  ; [$0213] Message

;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;
Maybe_MessageLength:                        ; [$0214]
    db $00                                  ; [$0214] byte

;
; Flag indicating if a message has finished displaying.
;
; 0x00 = Message has not finished.
; 0xFF = Message has finished.
;
;
; XREFS:
;     FUN_PRG12__9969
;     IScripts_Something_992A
;     IScripts_Something_9980
;     IScripts_UpdatePortraitAnimation
;     Shops_Something_9949
;     Maybe_TextBox_ShowCurrentMessageID
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_Pause
;
TextBox_MessageEnded:                       ; [$0215]
    db $00                                  ; [$0215] byte

;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_IncLineAndReset
;     TextBox_ShowMessage_Newline
;     TextBox_ShowMessage_Prepare4Lines
;     TextBox_ShowMessage_Space
;
TextBox_CharPosForLine:                     ; [$0216]
    db $00                                  ; [$0216] byte


;============================================================================
; Last drawn line number (0-based).
;============================================================================

;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_IncLineAndReset
;
TextBox_DrawnLineNum:                       ; [$0217]
    db $00                                  ; [$0217] byte

;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;
LoadedMessageAddr:                          ; [$0218]
    db $00                                  ; [$0218] byte

;
; XREFS:
;     Messages_Load
;     TextBox_ShowMessage_LoadMessage
;     TextBox_ShowMessage_Pause
;     TextBox_ShowMessage_Space
;
LoadedMessageAddr.U:                        ; [$0219]
    db $00                                  ; [$0219] byte

;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowMessage_Fill4Lines
;
TextBox_LineScrollOffset:                   ; [$021a]
    db $00                                  ; [$021a] byte

;
; XREFS:
;     Shops_Something_9949
;     TextBox_ClearPasswordSize
;
MaybeUnused_Arg_TextBox_Height:             ; [$021b]
    db $00                                  ; [$021b] byte

;
; Offset into the process of writing a player title in a textbox.
;
; This is a value from 0x81 to 0x90 that is incremented with
; every character of the player title written in a textbox. It's
; used for IScripts that list the player title using code 0xFB
; (namely, Guru title rank scripts).
;
; The values are indexes 1 through 16 (length of the player title
; strings), with the MSB set.
;
;
; XREFS:
;     TextBox_ClearPasswordSize
;     TextBox_ShowMessage_ShowPlayerTitle
;     TextBox_Something_ShowMessage_f4a2
;
Textbox_TitleCharOffset:                    ; [$021c]
    db $00                                  ; [$021c] byte

;
; XREFS:
;     Maybe_TextBox_ShowCurrentMessageID
;     Messages_Load
;     TextBox_ShowNextChar
;
Maybe_MessageCharPos:                       ; [$021d]
    db $00                                  ; [$021d] byte

;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG12__8bce
;     FUN_PRG12__906d
;     FUN_PRG12__9075
;     IScriptAction_OpenShop
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowSellMenu
;     Menu_Draw
;     Shop_Draw
;     Shop_Populate
;     Something_ShopCursorInventory
;     UI_ShowPlayerMenu
;
Menu_CursorPos:                             ; [$021e]
    db $00                                  ; [$021e] byte

;
; XREFS:
;     FUN_PRG12__8c04
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowSellMenu
;     Menu_Draw
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Draw
;     Shop_DrawItemStrings
;     Shop_Populate
;     UI_ShowPlayerMenu
;
Menu_LastPos:                               ; [$021f]
    db $00                                  ; [$021f] byte


;============================================================================
; A list of items shown in the shop.
;============================================================================

;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG12__8bce
;     FUN_PRG12__8c04
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Draw
;     Shop_DrawItemStrings
;     Shop_Populate
;     Something_ShopCursorInventory
;     UI_ShowPlayerMenu
;     FUN_PRG15_MIRROR__d654
;     Maybe_Area_LoadBlocks
;
ShopItems:                                  ; [$0220]
    db $00                                  ; [0]:

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;     UI_ShowPlayerMenu
;     FUN_PRG15_MIRROR__d654
;     Maybe_Area_LoadBlocks
;
ShopItems_1_:                               ; [$0221]
    db $00                                  ; [1]:

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;     UI_ShowPlayerMenu
;     Maybe_Area_LoadBlocks
;
ShopItems_2_:                               ; [$0222]
    db $00                                  ; [2]:

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;     UI_ShowPlayerMenu
;     Maybe_Area_LoadBlocks
;
ShopItems_3_:                               ; [$0223]
    db $00                                  ; [3]:

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;     UI_ShowPlayerMenu
;
ShopItems_4_:                               ; [$0224]
    db $00                                  ; [4]:

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;     UI_ShowPlayerMenu
;
ShopItems_5_:                               ; [$0225]
    db $00                                  ; [5]:

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;
ShopItems_6_:                               ; [$0226]
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; Lower byte of costs of items currently shown in the shop.
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Shop_Draw
;     Shop_Populate
;
ShopItemCostsL:                             ; [$0228]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; Upper byte of costs of items currently shown in the shop.
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Shop_Draw
;     Shop_Populate
;
ShopItemCostsU:                             ; [$0230]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; ASCII digits to render in the Gold or Experience area.
;
; Each digit corresponds to a single digit, populating based
; on the gold or experience.
;============================================================================

;
; XREFS:
;     UI_DrawDigitsZeroPadded
;     UI_PopulateDigitsNoLeadingZeroes
;
UI_DigitsToRender:                          ; [$0238]
    db $00,$00,$00,$00,$00,$00              ; [$0238] char

;
; XREFS:
;     UI_PopulateDigits
;
CHAR_ARRAY_023e:                            ; [$023e]
    db $00,$00,$00,$00                      ; [$023e] char

;
; XREFS:
;     FUN_PRG12__880e
;     FUN_PRG12__9041
;     Maybe_Draw_Textbox_Something8F51
;
Something_ValuesToDraw:                     ; [$0242]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:

ScreenBlocks:                               ; [$024a]
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$024a]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$025a]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; [$026a]
                                                                       ; byte
    db $00,$00,$00,$00,$00,$00,$00,$00      ; [$027a] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d6b1
;     Screen_Something_ScrollHorizInternal
;
Something_PPUData:                          ; [$0282]
    db $00                                  ; [0]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d6b1
;     Screen_Something_ScrollHorizInternal
;
Something_PPUData_1_:                       ; [$0283]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d699
;     Maybe_Area_LoadBlocks
;
Something_BlocksPPUData:                    ; [$028a]
    db $00                                  ; [0]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d699
;     Maybe_Area_LoadBlocks
;
Something_BlocksPPUData_1_:                 ; [$028b]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [$0292] undefined

;
; XREFS:
;     PPUBuffer_DrawCommand_WritePalette
;
CurrentPaletteData:                         ; [$0293]
    db $00                                  ; [0]:

;
; XREFS:
;     PPUBuffer_DrawCommand_WritePalette
;
CurrentPaletteData_1_:                      ; [$0294]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:

;
; XREFS:
;     LoadPalette
;
CurrentPaletteData_15_:                     ; [$02a2]
    db $00                                  ; [15]:
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:

;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     SplashAnimation_SomethingA708
;     StartScreen_Draw
;     Palette_PopulateData
;
CurrentPaletteData_30_:                     ; [$02b1]
    db $00                                  ; [30]:

;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     SplashAnimation_SomethingA708
;     StartScreen_Draw
;     Palette_PopulateData
;
CurrentPaletteData_31_:                     ; [$02b2]
    db $00                                  ; [31]:


;============================================================================
; Magic-related variables.
;============================================================================

;
; The type of magic currently on screen.
;
; This may also contain results of a spell, including
; explosion effects.
;
;
; XREFS:
;     CastMagic_Clear
;     CastMagic_HitHandler_Death
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CastMagic_HitHandler_Thunder
;     CastMagic_HitHandler_Tilte
;     CastMagic_Maybe_CheckImpassableY
;     CastMagic_Maybe_CheckXOrImpassable
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
;     Area_BeginScrollToNextRoom
;     CastMagic_Maybe_FinishHandler
;     CastMagic_Maybe_SetAppearance
;
CastMagic_Type:                             ; [$02b3]
    db $00                                  ; [$02b3] SelectedMagic

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
    db $00                                  ; [$02b4] CastMagicFlags

;
; The fractional X position of any visible magic.
;
;
; XREFS:
;     CastMagic_UpdateXPosition
;     Player_CastMagic
;
CastMagic_XPos_Frac:                        ; [$02b5]
    db $00                                  ; [$02b5] byte

;
; The full X position of any visible magic.
;
;
; XREFS:
;     CastMagic_HitHandler_Deluge
;     CastMagic_Maybe_CheckRightEdgeOrImpassable
;     CastMagic_Maybe_CheckXOrImpassable
;     CastMagic_UpdateFire
;     CastMagic_UpdateXPosition
;     Player_CastMagic
;     Sprite_CheckHitByCastMagic
;     CastMagic_CalculateVisibility
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_Maybe_FinishHandler
;
CastMagic_XPos_Full:                        ; [$02b6]
    db $00                                  ; [$02b6] byte

;
; The fractional Y position of any visible magic.
;
;
; XREFS:
;     CastMagic_UpdateYPosition
;     Player_CastMagic
;
CastMagic_YPos_Frac:                        ; [$02b7]
    db $00                                  ; [$02b7] byte

;
; The full Y position of any visible magic.
;
;
; XREFS:
;     CastMagic_Maybe_CheckImpassableY
;     CastMagic_UpdateYPosition
;     Player_CastMagic
;     Sprite_CheckHitByCastMagic
;     CastMagic_CalculateVisibility
;     CastMagic_FinishHandler_HitWallEffect
;     CastMagic_FinishHandler_TilteAfterFirstHit
;     CastMagic_Maybe_FinishHandler
;
CastMagic_YPos_Full:                        ; [$02b8]
    db $00                                  ; [$02b8] byte

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
    db $00                                  ; [$02b9] byte

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
    db $00                                  ; [$02ba] byte

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
    db $00                                  ; [$02bb] byte

;
; XREFS:
;     FUN_PRG14__84a0
;     FUN_PRG14__84b2
;
CurrentSprites_SomethingX:                  ; [$02bc]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     CalculateNewVertPos
;
CurrentSprites_SomethingY:                  ; [$02c4]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; Sprite IDs of the 8 active sprites
;============================================================================

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_UpdateState
;     FUN_PRG14__864a
;     FUN_PRG14__87cb
;     FUN_PRG14__9991
;     FUN_PRG14__9e13
;     FUN_PRG14__a0ad
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     FUN_PRG14__a1cc
;     GetSpriteBox
;     HandlePlayerHitByMagic
;     Player_AddExperienceFromSprite
;     Player_ApplyDamage
;     Player_HandleTouchBreadOrCoin
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     Player_HandleTouchItem
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_MaybeFallingRocks__ClearEntity
;     SpriteBehavior__9cf2
;     SpriteBehavior__9e6d
;     SpriteBehavior__a0cb
;     SpriteBehavior__a154
;     SpriteBehavior__ab67
;     SpriteBehavior__abcc
;     SpriteBehavior_a25f_ClearEntity
;     Sprite_CheckHitByCastMagic
;     Sprite_EnterNextAppearancePhase
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprite_SomethingSpawnMagic
;     Sprites_IsSpriteOutOfWeaponRange
;     Sprites_Maybe_UpdateBehavior
;     Sprites_Remove
;     WasPlayerHitByMagic
;
CurrentSprites_Entities:                    ; [$02cc]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:

;
; XREFS:
;     FUN_PRG14__9d78
;     FUN_PRG14__9df7
;     Maybe_Sprites_HasAnyEnemyOnScreen
;     Sprites_ClearAllEntities
;     Sprites_HasMaxOnScreen
;     _Sprites_ReplaceWithMattock_HasMaxOnScreen
;     GameLoop_ClearSprites
;     GameLoop_LoadSpriteImages
;     Maybe_IsSpriteEntityNotOnScreen
;     Sprites_HasBoss
;     Sprites_HasCurrentSprites
;     Sprites_HasSpritesNotOfType
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Entities_6_:                 ; [$02d2]
    db $00                                  ; [6]:

;
; XREFS:
;     FUN_PRG14__9d78
;     FUN_PRG14__9df7
;     Maybe_Sprites_HasAnyEnemyOnScreen
;     Sprites_ClearAllEntities
;     Sprites_HasMaxOnScreen
;     _Sprites_ReplaceWithMattock_HasMaxOnScreen
;     GameLoop_ClearSprites
;     GameLoop_LoadSpriteImages
;     Maybe_IsSpriteEntityNotOnScreen
;     Sprites_HasBoss
;     Sprites_HasCurrentSprites
;     Sprites_HasSpritesNotOfType
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Entities_7_:                 ; [$02d3]
    db $00                                  ; [7]:


;============================================================================
; Subtype of the currently-active sprites
;============================================================================

;
; XREFS:
;     FUN_PRG14__a6bc
;     FUN_PRG14__a7f8
;     Sprite_ClearBehaviorReadyAndSetSubtypeBit7
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprite_SomethingFunc__a6e8
;     Sprite_SomethingFunc__a6ff
;     Sprite_SomethingFunc__a72c
;     Sprite_SomethingFunc__a74c
;     Sprite_SomethingFunc__a772
;     Sprite_Something__a82a
;     Sprites_Maybe_UpdateBehavior
;
CurrentSprites_Subtypes:                    ; [$02d4]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:

;
; XREFS:
;     GameLoop_ClearSprites
;
CurrentSprites_Subtypes_6_:                 ; [$02da]
    db $00                                  ; [6]:

;
; XREFS:
;     GameLoop_ClearSprites
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Subtypes_7_:                 ; [$02db]
    db $00                                  ; [7]:

;
; XREFS:
;     CalculateNewVertPos
;     CurrentSpriteFlags_SetBit5
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_RandomlyChangeHorizDirection
;     CurrentSprite_RandomlyChangeVertDirection
;     CurrentSprite_UpdateFlipMask
;     FUN_PRG14__8427
;     FUN_PRG14__844b
;     FUN_PRG14__846c
;     FUN_PRG14__849a
;     FUN_PRG14__850d
;     FUN_PRG14__854c
;     FUN_PRG14__859c
;     FUN_PRG14__864a
;     FUN_PRG14__9b45
;     FUN_PRG14__9e13
;     FUN_PRG14__a077
;     FUN_PRG14__a0ad
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     FUN_PRG14__a1cc
;     FUN_PRG14__a91e
;     MoveSpriteHorizIfPossible
;     MoveSpriteVertBorder
;     MoveSpriteVerticalIfPossible
;     Player_HitSpriteWithWeapon
;     Player_SetDamagedBySprite
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior__8f2e
;     SpriteBehavior__9129
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__97ae
;     SpriteBehavior__9b83
;     SpriteBehavior__9cf2
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9f03__MoveDown
;     SpriteBehavior__a154
;     SpriteBehavior__a8d7
;     SpriteBehavior__aa86
;     Sprite_ChangeYDirection
;     Sprite_CheckHitByCastMagic
;     Sprite_ClearFlags
;     Sprite_DisableBehavior
;     Sprite_EnableBehavior
;     Sprite_IsSpriteBehaviorDisabled
;     Sprite_Maybe_ResetState
;     Sprite_MoveAndTurnAroundIfNeeded
;     Sprite_MoveTowardsPlayerX
;     Sprite_SetMaybeHidden
;     Sprite_SomethingSpawnMagic
;     Sprite_ToggleMoveRight
;     Sprite_UnsetFalling
;     Sprites_HasSpriteHitRightScreen
;     Sprites_HideSprite
;     Sprites_IsSpriteVisible
;     Sprites_SetCurrentSpriteCanWalk
;
CurrentSprites_Flags:                       ; [$02dc]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Flags_7_:                    ; [$02e3]
    db $00                                  ; [7]:

;
; XREFS:
;     FUN_PRG14__9693
;     FUN_PRG14__9699
;     FUN_PRG14__96b8
;     FUN_PRG14__96d5
;     FUN_PRG14__9917
;     FUN_PRG14__994a
;     FUN_PRG14__9a3c
;     FUN_PRG14__9a61
;     FUN_PRG14__9ac6
;     FUN_PRG14__9b45
;     FUN_PRG14__9e13
;     FUN_PRG14__a51b
;     FUN_PRG14__a59d
;     GetSpriteBox
;     Player_HandleTouchEnemy
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior__8e77
;     SpriteBehavior__8f2e
;     SpriteBehavior__9060
;     SpriteBehavior__9129
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9497
;     SpriteBehavior__9538
;     SpriteBehavior__95c0
;     SpriteBehavior__9632
;     SpriteBehavior__971d
;     SpriteBehavior__97ae
;     SpriteBehavior__9865
;     SpriteBehavior__9a32
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__9cf2
;     SpriteBehavior__9da9
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9f03__MoveDown
;     SpriteBehavior__9fe3
;     SpriteBehavior__a354
;     SpriteBehavior__a384
;     SpriteBehavior__a3bf
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
;     SpriteBehavior__a558
;     SpriteBehavior__a56f
;     SpriteBehavior__a586
;     SpriteBehavior__ab67
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Boss_KingGrieve
;     SpriteUpdateHandler_Boss_Pakukame
;     SpriteUpdateHandler_Boss_Ripasheiku
;     SpriteUpdateHandler_Boss_Zorugeriru
;     SpriteUpdateHandler_Effect_BossDeath
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
;     SpriteUpdateHandler_Enemy_Unused36
;     SpriteUpdateHandler_Garbled03
;     SpriteUpdateHandler_NPC_King
;     SpriteUpdateHandler_NPC_Walking
;     SpriteUpdateHandler__a5d2
;     Sprite_GetPreviousSpritePhase
;     Sprite_Maybe_ResetState
;     Sprite_SetPhase2
;     Sprite_SomethingFunc__a6e8
;     Sprite_SomethingFunc__a6ff
;     Sprite_SomethingFunc__a74c
;
CurrentSprites_Phases:                      ; [$02e4]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_Phases_7_:                   ; [$02eb]
    db $00                                  ; [7]:

;
; XREFS:
;     FUN_PRG14__9593
;     FUN_PRG14__9699
;     FUN_PRG14__96b8
;     FUN_PRG14__96d5
;     FUN_PRG14__9735
;     FUN_PRG14__9917
;     FUN_PRG14__994a
;     FUN_PRG14__9991
;     FUN_PRG14__99f3
;     FUN_PRG14__9a61
;     FUN_PRG14__9a87
;     FUN_PRG14__9aa1
;     FUN_PRG14__9ac6
;     FUN_PRG14__9b45
;     FUN_PRG14__a59d
;     FUN_PRG14__a91e
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior_Walking
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__9060
;     SpriteBehavior__9129
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__9538
;     SpriteBehavior__95c0
;     SpriteBehavior__9632
;     SpriteBehavior__971d
;     SpriteBehavior__9865
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__9cf2
;     SpriteBehavior__9da9
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9f03__MoveDown
;     SpriteBehavior__9fe3
;     SpriteBehavior__MaybeSugata
;     SpriteBehavior__a8d7
;     SpriteBehavior__ab67
;     SpriteBehavior__abcc
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Bihoruda
;     SpriteUpdateHandler_Enemy_Ishiisu
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_Tamazutsu
;     SpriteUpdateHandler_Enemy_Yuinaru
;     SpriteUpdateHandler_Garbled03
;     SpriteUpdateHandler__a5d2
;     Sprite_SetDeathEntity
;
CurrentSprites_TickCounters:                ; [$02ec]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; XXX Some lookup map.
;============================================================================

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__9aa1
;     FUN_PRG14__9ac6
;     FUN_PRG14__9b45
;     FUN_PRG14__a59d
;     FUN_PRG14__a91e
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior_Walking
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9a32
;     SpriteBehavior__9b83
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     SpriteBehavior__a8d7
;     SpriteBehavior__aa86
;     SpriteUpdateHandler_Enemy_Unused18
;
CurrentSprites_StateCounter:                ; [$02f4]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; XXX Some lookup map.
;============================================================================

;
; XREFS:
;     FUN_PRG14__994a
;     FUN_PRG14__9991
;     FUN_PRG14__99f3
;     FUN_PRG14__9aa1
;     Maybe_Sprite_HandleDeathDrop
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior__8f2e
;     SpriteBehavior__9b83
;     SpriteBehavior__9fe3
;     SpriteBehavior__a154
;     SpriteBehavior__aa86
;     SpriteUpdateHandler_Boss_ShadowEura
;     SpriteUpdateHandler_Coin
;     SpriteUpdateHandler_TODO_Unknown_83
;     Sprite_SetDeathEntity
;
CurrentSprites_InternalBehaviorStates:      ; [$02fc]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:

;
; XREFS:
;     Game_Init
;
CurrentSprites_InternalBehaviorStates_4_:   ; [$0300]
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__82f8
;     FUN_PRG14__86c6
;     FUN_PRG14__9917
;     MoveRight
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__9cf2
;     SpriteBehavior__9da9
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     Sprite_CanClimb
;     Sprite_CheckHitByCastMagic
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprites_CanSpriteWalk
;
CurrentSprites_HitBoxTypes:                 ; [$0304]
    db $00                                  ; [0]:
    db $00                                  ; [1]:

;
; XREFS:
;     Maybe_Area_LoadBlocks
;
CurrentSprites_HitBoxTypes_2_:              ; [$0306]
    db $00                                  ; [2]:

;
; XREFS:
;     Maybe_Area_LoadBlocks
;
CurrentSprites_HitBoxTypes_3_:              ; [$0307]
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_HitBoxTypes_7_:              ; [$030b]
    db $00                                  ; [7]:


;============================================================================
; XXX Some lookup map.
;============================================================================

;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_Hopper
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;
CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c: ; [$030c]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; XXX Some lookup map.
;============================================================================

;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aafa
;
CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314: ; [$0314]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; XXX Some sprites lookup map.
;============================================================================

;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior_Hopper
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;
CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c: ; [$031c]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; XXX Some lookup map.
;============================================================================

;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__8398
;     FUN_PRG14__83a8
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aafa
;
CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324: ; [$0324]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; PPU address where the first tile of the sprite is stored
;============================================================================

;
; XREFS:
;     CurrentSprite_UpdateState
;     FUN_PRG14__9e13
;     FUN_PRG14__a0ad
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     FUN_PRG14__a1cc
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior__9cf2
;     SpriteUpdateHandler_Enemy_Unused18
;     Sprite_ReplaceWithMattock
;     Sprite_SomethingSpawnMagic
;
CurrentSprites_PPUAddrs:                    ; [$032c]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     GameLoop_LoadSpriteImages
;
CurrentSprites_PPUAddrs_7_:                 ; [$0333]
    db $00                                  ; [7]:


;============================================================================
; Magic type the sprite was hit by
;
; $FF = Not hit by magic
;============================================================================

;
; XREFS:
;     FUN_PRG14__9e13
;     Maybe_Sprite_HandleDeathDrop
;     Sprite_CheckHitByCastMagic
;     Sprite_Maybe_ResetState
;     Sprite_SetDeathEntity
;     Sprites_Maybe_UpdateHitByMagic
;
CurrentSprites_HitByMagicBehavior:          ; [$0334]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_HitByMagicBehavior_7_:       ; [$033b]
    db $00                                  ; [7]:

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;     Sprites_Maybe_UpdateHitByMagic
;
CurrentSprites_HitByMagicIFrames:           ; [$033c]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__9cf2
;
CurrentSprites_HP:                          ; [$0344]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:

;
; XREFS:
;     GameLoop_ClearSprites
;
CurrentSprites_HP_6_:                       ; [$034a]
    db $00                                  ; [6]:

;
; XREFS:
;     GameLoop_ClearSprites
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_HP_7_:                       ; [$034b]
    db $00                                  ; [7]:


;============================================================================
; Counter used after sprite was hit
;============================================================================

;
; XREFS:
;     CurrentSprite_UpdateState
;     Maybe_Sprite_HandleDeathDrop
;     Player_HitSpriteWithWeapon
;     _handleHit [$PRG14::804e]
;
CurrentSprites_HitCounter:                  ; [$034c]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:

;
; XREFS:
;     GameLoop_ClearSprites
;
CurrentSprites_HitCounter_6_:               ; [$0352]
    db $00                                  ; [6]:

;
; XREFS:
;     _handleHit [$PRG14::804e]
;     GameLoop_ClearSprites
;
CurrentSprites_HitCounter_7_:               ; [$0353]
    db $00                                  ; [7]:

;
; XREFS:
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_Maybe_UpdateBehavior
;
CurrentSprites_BehaviorAddrs_L:             ; [$0354]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_BehaviorAddrs_L_7_:          ; [$035b]
    db $00                                  ; [7]:

;
; XREFS:
;     Sprite_Maybe_ResetState
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;     Sprites_Maybe_UpdateBehavior
;
CurrentSprites_BehaviorAddrs_U:             ; [$035c]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprites_BehaviorAddrs_U_7_:          ; [$0363]
    db $00                                  ; [7]:

;
; XREFS:
;     FUN_PRG14__a6af
;     SpriteBehavior_Hopper
;     Sprite_SomethingFunc__a6ff
;
BYTE_ARRAY_0364:                            ; [$0364]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; Message IDs of the NPC messages
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
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:

;
; XREFS:
;     Sprites_LoadSpriteValue
;
CurrentSprites_Values_7_:                   ; [$0373]
    db $00                                  ; [7]:

;
; XREFS:
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateThunderOrDeath
;     CastMagic_UpdateTilte
;     CastMagic_UpdateXPosition
;     FUN_PRG14__83a8
;     FUN_PRG14__83c1
;     FUN_PRG14__848a
;     FUN_PRG14__84a0
;     FUN_PRG14__84b2
;     FUN_PRG14__96b8
;     FUN_PRG14__9735
;     FUN_PRG14__9c43
;     FUN_PRG14__a91e
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_Walking
;     SpriteBehavior__8e77
;     SpriteBehavior__8f2e
;     SpriteBehavior__9129
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__9497
;     SpriteBehavior__9538
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     SpriteBehavior__a0cb
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     Sprites_Maybe_UpdateHitByMagic
;
Arg_DeltaX_Frac:                            ; [$0374]
    db $00                                  ; [$0374] byte

;
; XREFS:
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     CastMagic_UpdateThunderOrDeath
;     CastMagic_UpdateTilte
;     CastMagic_UpdateXPosition
;     FUN_PRG14__83a8
;     FUN_PRG14__83c1
;     FUN_PRG14__848a
;     FUN_PRG14__84a0
;     FUN_PRG14__84b2
;     FUN_PRG14__9593
;     FUN_PRG14__96b8
;     FUN_PRG14__9735
;     FUN_PRG14__9c43
;     FUN_PRG14__a91e
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_Walking
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8fe7
;     SpriteBehavior__9129
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__9497
;     SpriteBehavior__9538
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     SpriteBehavior__a0cb
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     Sprites_Maybe_UpdateHitByMagic
;
Arg_DeltaX_Full:                            ; [$0375]
    db $00                                  ; [$0375] byte

;
; XREFS:
;     CalcVerticalSpriteMovement
;     CalculateNewVertPos
;     CastMagic_UpdateTilte
;     CastMagic_UpdateYPosition
;     FUN_PRG14__83a8
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior__8e77
;     SpriteBehavior__8f9a
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__97ae
;     SpriteBehavior__9b83
;     SpriteBehavior__9f03__MoveDown
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aafa
;
Arg_DeltaY_Frac:                            ; [$0376]
    db $00                                  ; [$0376] byte

;
; XREFS:
;     CalcVerticalSpriteMovement
;     CalculateNewVertPos
;     CastMagic_UpdateTilte
;     CastMagic_UpdateYPosition
;     FUN_PRG14__83a8
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9b83
;     SpriteBehavior__9f03__MoveDown
;     SpriteBehavior__a154
;     SpriteBehavior__a997
;     SpriteBehavior__aafa
;
Arg_DeltaY_Full:                            ; [$0377]
    db $00                                  ; [$0377] byte


;============================================================================
; Currently-active sprite
;============================================================================

;
; XREFS:
;     CastMagic_HitHandler_Deluge
;     CastMagic_HitHandler_Fire
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CanMoveInDirection
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_RandomlyChangeHorizDirection
;     CurrentSprite_RandomlyChangeVertDirection
;     CurrentSprite_UpdateState
;     FUN_PRG14__84f4
;     FUN_PRG14__850d
;     FUN_PRG14__864a
;     FUN_PRG14__86c6
;     FUN_PRG14__87cb
;     FUN_PRG14__9991
;     FUN_PRG14__9a61
;     FUN_PRG14__ac21
;     HandlePlayerHitByMagic
;     LAB_PRG14__8043 [$PRG14::8043]
;     Maybe_Sprites_HasAnyEnemyOnScreen
;     MoveSpriteHorizIfPossible
;     MoveSpriteVerticalIfPossible
;     Player_AddExperienceFromSprite
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchEnemyMagic
;     Player_HandleTouchItem
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_RestoreXRegister
;     SpriteBehavior__9cf2
;     SpriteBehavior__MaybeSugata
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Unused18
;     Sprite_CheckHitByCastMagic
;     Sprites_Maybe_UpdateBehavior
;     Sprites_SetBlockIsMovingResult
;     Sprites_SetCurrentSpriteCanWalk
;     Sprites_UpdateAllStates
;     WasPlayerHitByMagic
;     _afterFarJump [$PRG14::89ff]
;     _updateSprite [$PRG14::8011]
;     CastMagic_CalculateVisibility
;     GameLoop_LoadSpriteImages
;     Player_PickUpRedPotion
;     Sprites_PopulateNextAvailableSprite
;
CurrentSpriteIndex:                         ; [$0378]
    db $00                                  ; [$0378] byte

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__9991
;     FUN_PRG14__99f3
;     FUN_PRG14__9a57
;     FUN_PRG14__9a7a
;     SpriteUpdateHandler_Enemy_Unused18
;
Sprite12BodyPartHandler:                    ; [$0379]
    db $00                                  ; [0]:

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__99f3
;     SpriteUpdateHandler_Enemy_Unused18
;
Sprite12BodyPartHandler_1_:                 ; [$037a]
    db $00                                  ; [1]:

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__994a
;     FUN_PRG14__99f3
;     SpriteUpdateHandler_Enemy_Unused18
;
Sprite12BodyPartHandler_2_:                 ; [$037b]
    db $00                                  ; [2]:

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__9991
;     SpriteUpdateHandler_Enemy_Unused18
;
Sprite12BodyPartHandler_3_:                 ; [$037c]
    db $00                                  ; [3]:

;
; XREFS:
;     FUN_PRG14__9917
;     SpriteUpdateHandler_Enemy_Unused18
;
Sprite12BodyPartHandler_4_:                 ; [$037d]
    db $00                                  ; [4]:

;
; XREFS:
;     FUN_PRG14__9917
;     FUN_PRG14__994a
;     FUN_PRG14__9ac6
;     SpriteUpdateHandler_Enemy_Unused18
;
Sprite12BodyPartHandler_5_:                 ; [$037e]
    db $00                                  ; [5]:

;
; XREFS:
;     Player_HitSpriteWithWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Something_Maybe_WeaponDistanceX:            ; [$037f]
    db $00                                  ; [$037f] byte

;
; XREFS:
;     Player_HitSpriteWithWeapon
;     Sprites_IsSpriteOutOfWeaponRange
;
Something_Maybe_WeaponDistanceY:            ; [$0380]
    db $00                                  ; [$0380] byte

    db $00,$00                              ; [$0382] undefined

;
; XREFS:
;     FUN_PRG14__9b45
;     FUN_PRG14__a2eb
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior__9497
;     SpriteBehavior__9cf2
;     SpriteBehavior__9f03
;     SpriteBehavior__a154
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Boss_KingGrieve
;     SpriteUpdateHandler_Boss_Ripasheiku
;     SpriteUpdateHandler_Boss_Rokusutahn
;     SpriteUpdateHandler_Boss_Zoradohna
;     SpriteUpdateHandler_Boss_Zorugeriru
;     SpriteUpdateHandler_Deco_Fountain
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
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
;     SpriteUpdateHandler_Enemy_Myconid
;     SpriteUpdateHandler_Enemy_Naga
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_NecronAides
;     SpriteUpdateHandler_Enemy_Raiden
;     SpriteUpdateHandler_Enemy_Snowman
;     SpriteUpdateHandler_Enemy_Sugata
;     SpriteUpdateHandler_Enemy_Unused18
;     SpriteUpdateHandler_Enemy_Unused29
;     SpriteUpdateHandler_Enemy_Unused36
;     SpriteUpdateHandler_Enemy_Unused39
;     SpriteUpdateHandler_Enemy_Unused43
;     SpriteUpdateHandler_Enemy_Yareeka
;     SpriteUpdateHandler_Enemy_Zombie
;     SpriteUpdateHandler_NPC_ArmorSalesman
;     SpriteUpdateHandler_NPC_King
;     SpriteUpdateHandler_NPC_MagicTeacher
;     SpriteUpdateHandler_NPC_MartialArts
;     SpriteUpdateHandler_NPC_Priest
;     SpriteUpdateHandler_NPC_Walking
;     SpriteUpdateHandler_TODO_Garbled10
;     SpriteUpdateHandler_TODO_Garbled_81
;     SpriteUpdateHandler_TODO_Unknown84
;     Sprites_UpdateAll
;
SpriteUpdateCounter:                        ; [$0383]
    db $00                                  ; [$0383] byte

;
; XREFS:
;     FUN_PRG14__9b45
;     FUN_PRG14__a077
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     FUN_PRG14__a1cc
;     SpriteBehavior__9f03
;
BYTE_0384:                                  ; [$0384]
    db $00                                  ; [$0384] byte

;
; XREFS:
;     FUN_PRG14__9b45
;     FUN_PRG14__a077
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     FUN_PRG14__a1cc
;     SpriteBehavior__9f03
;
BYTE_0385:                                  ; [$0385]
    db $00                                  ; [$0385] byte


;============================================================================
; ROM bank where images of the current sprite can be found.
;============================================================================

;
; XREFS:
;     LookupSpriteDataPointer
;     Sprites_StoreBankForCurrentSprite
;
CurrentSprite_ImagesBank:                   ; [$0386]
    db $00                                  ; [$0386] byte

    db $00,$00                              ; [$0388] undefined


;============================================================================
; X coordinate of the sprite being processed.
;============================================================================

;
; XREFS:
;     GameLoop_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprite_XPos:                         ; [$0389]
    db $00                                  ; [$0389] byte


;============================================================================
; Y coordinate of the sprite being processed.
;============================================================================

;
; XREFS:
;     GameLoop_LoadSpriteInfo
;     Sprites_PopulateNextAvailableSprite
;
CurrentSprite_YPos:                         ; [$038a]
    db $00                                  ; [$038a] byte


;============================================================================
; Entity ID of the sprite being processed.
;============================================================================

;
; XREFS:
;     GameLoop_LoadSpriteImages
;     GameLoop_LoadSpriteInfo
;     LookupSpriteDataPointer
;     Sprites_PopulateNextAvailableSprite
;     Sprites_StoreBankForCurrentSprite
;
CurrentSprite_Entity:                       ; [$038b]
    db $00                                  ; [$038b] SpriteEntity


;============================================================================
; Numeric value of the sprite being processed.
;
; For items like coins and bread, this will contain the value
; to add to the player's gold and HP, respectively.
;
; For NPCs, this will be the IScript entrypoint index to
; activate upon interaction.
;============================================================================

;
; XREFS:
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchNPC
;
CurrentSprite_Value:                        ; [$038c]
    db $00                                  ; [$038c] byte


;============================================================================
; Index into HUD_ATTRIBUTE_DATA_BY_INDEX where the
; HUD palette can be found.
;============================================================================

;
; XREFS:
;     TextBox_Maybe_GetPalette
;     LoadPalette2
;     UI_SetHUDPPUAttributes
;
HUD_AttributeDataIndex:                     ; [$038d]
    db $00                                  ; [$038d] byte

    db $00,$00                              ; [$038f] undefined


;============================================================================
; The player's experience as a 16-bit value.
;
; This is in Lower, Upper byte order.
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
    db $00                                  ; [$0390] byte


;============================================================================
; Upper byte of player's experience
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
    db $00                                  ; [$0391] byte


;============================================================================
; The player's gold as a 24-bit value.
;
; This is in Lower, Middle, Upper byte order.
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
    db $00                                  ; [$0392] byte


;============================================================================
; Middle byte of player's gold
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
    db $00                                  ; [$0393] byte


;============================================================================
; Upper byte of player's gold
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
    db $00                                  ; [$0394] byte

    db $00,$00,$00,$00                      ; [$0396] undefined


;============================================================================
; Temporary variable used when adding or showing player HP.
;============================================================================

;
; XREFS:
;     IScriptAction_AddHP
;     UI_DrawPlayerHPValue
;
Temp_AddedHPValue:                          ; [$0399]
    db $00                                  ; [$0399] byte


;============================================================================
; The player's available MP.
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
    db $00                                  ; [$039a] byte

;
; XREFS:
;     Player_DrawShield
;     WasPlayerHitByMagic
;
Player_ShieldPositionX:                     ; [$039b]
    db $00                                  ; [$039b] byte

;
; XREFS:
;     Player_DrawShield
;     WasPlayerHitByMagic
;
Player_ShieldPositionY:                     ; [$039c]
    db $00                                  ; [$039c] byte


;============================================================================
; Inventory of the player's weapons.
;
; They can have up to 4 weapons in the inventory.
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b29]
;     SpriteBehavior__a3bf
;     Player_PickUpDragonSlayer
;
WeaponInventory:                            ; [$039d]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:

;
; XREFS:
;     Player_PickUpDragonSlayer
;
WeaponInventory_3_:                         ; [$03a0]
    db $00                                  ; [3]:


;============================================================================
; Inventory of the player's armor.
;
; They can have up to 4 armors in the inventory.
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2a]
;     SpriteBehavior__a354
;     Player_PickUpBattleSuit
;
ArmorInventory:                             ; [$03a1]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:

;
; XREFS:
;     Player_PickUpBattleSuit
;
ArmorInventory_3_:                          ; [$03a4]
    db $00                                  ; [3]:


;============================================================================
; Inventory of the player's shields.
;
; They can have up to 4 shields in the inventory.
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2b]
;     SpriteBehavior__a384
;     Player_PickUpBattleHelmet
;
ShieldInventory:                            ; [$03a5]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:

;
; XREFS:
;     Player_PickUpBattleHelmet
;
ShieldInventory_3_:                         ; [$03a8]
    db $00                                  ; [3]:


;============================================================================
; Inventory of the player's magic spells.
;
; They can have up to 5 magic spells in the inventory.
;
; XXX It seems there's only room for 4 though? Check on this.
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2c]
;
MagicInventory:                             ; [$03a9]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:


;============================================================================
; Inventory of the player's items.
;============================================================================

;
; XREFS:
;     INVENTORY_CATEGORY_L [$PRG12::9b2d]
;     Player_PickUpItem
;
ItemInventory:                              ; [$03ad]
    db $00                                  ; [0]: [0]:
    db $00                                  ; [0]: [1]:
    db $00                                  ; [0]: [2]:
    db $00                                  ; [0]: [3]:
    db $00                                  ; [0]: [4]:
    db $00                                  ; [0]: [5]:
    db $00                                  ; [0]: [6]:
    db $00                                  ; [0]: [7]:
    db $00                                  ; [1]: [0]:
    db $00                                  ; [1]: [1]:
    db $00                                  ; [1]: [2]:
    db $00                                  ; [1]: [3]:
    db $00                                  ; [1]: [4]:
    db $00                                  ; [1]: [5]:
    db $00                                  ; [1]: [6]:
    db $00                                  ; [1]: [7]:


;============================================================================
; The currently-selected weapon:
;
; 0 = Hand Dagger
; 1 = Long Sword
; 2 = Giant Blade
; 3 = Dragon Slayer
;============================================================================

;
; XREFS:
;     FUN_PRG12__8b71
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_Maybe_ShowStatus
;     Player_Equip
;     Player_LacksItem
;     Player_SetStartGameState
;     Something_ShopCursorInventory
;     PlayerDeath_ResetSelectedItemState
;     Game_ExitBuilding
;     Player_HandleDeath
;     Player_SetWeapon
;
Inventories:                                ; [$03bd]
SelectedWeapon:
    db $00                                  ; [$03bd] WeaponInventory


;============================================================================
; The currently-selected armor:
;
; 0 = Leather Armor
; 1 = Studded Mail
; 2 = Full Plate
; 3 = Battle Suit
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     Player_ApplyDamage
;     SpriteBehavior__a354
;     FUN_PRG15_MIRROR__ec58
;     Maybe_Player_UpdateArmorSprite
;     Player_DrawBody
;     Player_HandleDeath
;     Player_SetArmor
;
SelectedArmor:                              ; [$03be]
    db $00                                  ; [$03be] ArmorInventory


;============================================================================
; The currently-selected shield.
;
; 0 = Small Shield
; 1 = Large Shield
; 2 = Magic Shield
; 3 = Battle Helmet
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     HandlePlayerHitByMagic
;     PlayerDeath_ResetSelectedItemState
;     Player_DrawShield
;     SpriteBehavior__a384
;     WasPlayerHitByMagic
;     FUN_PRG15_MIRROR__ec58
;     Maybe_Player_UpdateArmorSprite
;     Player_DrawBody
;     Player_HandleDeath
;     Player_SetShield
;     Player_Something_ShieldState
;
SelectedShield:                             ; [$03bf]
    db $00                                  ; [$03bf] ShieldInventory


;============================================================================
; The currently-selected magic spell.
;
; 0x00 = Deluge
; 0x01 = Thunder
; 0x02 = Fire
; 0x03 = Death
; 0x04 = Tilte
; 0xFF = None
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
    db $00                                  ; [$03c0] SelectedMagic


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
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     PlayerDeath_ResetSelectedItemState
;     FUN_PRG15_MIRROR__fbaf
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
;
SelectedItem:                               ; [$03c1]
    db $00                                  ; [$03c1] ItemInventory


;============================================================================
; Number of weapons in the player's inventory
;============================================================================

;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Player_SetStartGameState
;     Something_ShopCursorInventory
;     UI_ShowPlayerMenu
;     Init_PlayerInventoryState
;     SpriteBehavior__a3bf
;     Player_PickUpBattleSuit
;     Player_PickUpDragonSlayer
;
AllInventories:                             ; [$03c2]
NumberOfWeapons:
    db $00                                  ; [$03c2] byte


;============================================================================
; Number of armors in the player's inventory
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Init_PlayerInventoryState
;     SpriteBehavior__a354
;     Player_PickUpBattleSuit
;     Player_PickUpDragonSlayer
;
NumberOfArmors:                             ; [$03c3]
    db $00                                  ; [$03c3] byte


;============================================================================
; Number of shields in the player's inventory
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Init_PlayerInventoryState
;     SpriteBehavior__a384
;     Player_PickUpBattleHelmet
;
NumberOfShields:                            ; [$03c4]
    db $00                                  ; [$03c4] byte


;============================================================================
; Number of magic spells in the player's inventory
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Init_PlayerInventoryState
;
NumberOfMagicSpells:                        ; [$03c5]
    db $00                                  ; [$03c5] byte


;============================================================================
; Number of items in the player's inventory
;============================================================================

;
; XREFS:
;     IScriptAction_ShowSellMenu
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     Init_PlayerInventoryState
;     Player_PickUpItem
;
NumberOfItems:                              ; [$03c6]
    db $00                                  ; [$03c6] byte

;
; XREFS:
;     IScriptAction_ShowSellMenu
;     CurrentSprite_UpdateState
;     Player_DrawShield
;     Player_DrawWeapon
;     FUN_PRG15_MIRROR__f24d
;     FUN_PRG15_MIRROR__f2e3
;     GameLoop_ClearSprites
;     IScripts_ClearPortrait
;     IScripts_DrawPortraitAnimationFrame
;     Player_DrawBody
;     Something_Temp03C7Times5
;
Temp_03C7:                                  ; [$03c7]
    db $00                                  ; [$03c7] byte

;
; XREFS:
;     PlayerDeath_ResetSelectedItemState
;     Player_DrawWeapon
;     Player_GetNormalizedWeaponID
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__a3bf
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Maybe_Player_UpdateWeaponSprite
;     Player_SetWeapon
;
Player_CurWeapon:                           ; [$03c8]
    db $00                                  ; [$03c8] WeaponInventory

;
; XREFS:
;     Area_SetBlocks
;     Area_WriteTwoBlocksFromData12ToPPUBuffer
;     Area_WriteTwoBlocksFromData34ToPPUBuffer
;     FUN_PRG15_MIRROR__d6ce
;     FUN_PRG15_MIRROR__d82d
;     Player_UseMattock
;
Something_Maybe_BlockOffset:                ; [$03c9]
    db $00                                  ; [$03c9] byte

    db $00,$00,$00,$00                      ; [$03cb] undefined

;
; XREFS:
;     FUN_PRG14__9991
;     FUN_PRG15_MIRROR__d7b0
;
BYTE_03ce:                                  ; [$03ce]
    db $00                                  ; [$03ce] byte

;
; XREFS:
;     FUN_PRG14__9991
;     FUN_PRG15_MIRROR__d7b0
;
BYTE_03cf:                                  ; [$03cf]
    db $00                                  ; [$03cf] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d00d
;     Fog_OnTick
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     Player_HandleDeath
;     Screen_NextTransitionState
;     Something_SetupNewScreen
;
Screen_Palette:                             ; [$03d0]
    db $00                                  ; [$03d0] Palette

;
; XREFS:
;     Area_BeginScrollToNextRoom
;     EndGame_MoveToKingsRoom
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;     Maybe_Game_MainExitBuildingHandler
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToInside
;     ScreenEvents_HandleBoss
;     _afterFarJump [$PRG15_MIRROR::c603]
;
Areas_DefaultMusic:                         ; [$03d1]
    db $00                                  ; [$03d1] Music

;
; XREFS:
;     Game_SpawnInTemple
;     Maybe_Game_MainExitBuildingHandler
;     Player_EnterDoorToInside
;
Area_Music_Outside:                         ; [$03d2]
    db $00                                  ; [$03d2] byte


;============================================================================
; Palette index data.
;============================================================================

;
; The saved palette index, when temporarily switching to a new one.
;
; This is used in IScripts.
;
;
; XREFS:
;     FUN_PRG15_MIRROR__f24d
;     IScripts_ClearPortrait
;
Palette_SavedIndex:                         ; [$03d3]
    db $00                                  ; [$03d3] byte

;
; The current palette index.
;
; This is set when loading a new palette, and used
; exclusively for the process of restoring palette state
; after showing portraits in IScripts.
;
;
; XREFS:
;     FUN_PRG15_MIRROR__f24d
;     Palette_LoadFromIndex
;
Palette_CurrentIndex:                       ; [$03d4]
    db $00                                  ; [$03d4] byte


;============================================================================
; Region and screen information.
;============================================================================

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Area_PrevRegion:                            ; [$03d5]
    db $00                                  ; [$03d5] byte

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Maybe_PrevScreen:                           ; [$03d6]
    db $00                                  ; [$03d6] byte

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Prev_Palette:                               ; [$03d7]
    db $00                                  ; [$03d7] byte

;
; XREFS:
;     Game_EnterBuilding
;     Game_ExitBuilding
;
Prev_PlayerPosXY:                           ; [$03d8]
    db $00                                  ; [$03d8] byte

;
; XREFS:
;     EndGame_MoveToKingsRoom
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;
Something_Maybe_NewTilesIndex:              ; [$03d9]
    db $00                                  ; [$03d9] byte

;
; XREFS:
;     EndGame_MoveToKingsRoom
;     Game_EnterBuilding
;     Game_SpawnInTemple
;     Player_EnterDoorToInside
;
Something_Maybe_NewCurrentScreen:           ; [$03da]
    db $00                                  ; [$03da] byte

;
; XREFS:
;     Player_HandleDeath
;     Screen_NextTransitionState
;
Screen_TransitionCounter:                   ; [$03db]
    db $00                                  ; [$03db] byte

;
; XREFS:
;     Screen_NextTransitionState
;
Screen_FadeOutCounter:                      ; [$03dc]
    db $00                                  ; [$03dc] byte

;
; XREFS:
;     Player_DrawDeathAnimation
;     Player_HandleDeath
;
Player_DeathAnimationPhase:                 ; [$03dd]
    db $00                                  ; [$03dd] byte

;
; XREFS:
;     Player_DrawDeathAnimation
;     Player_HandleDeath
;
Player_DeathAnimationCounter:               ; [$03de]
    db $00                                  ; [$03de] byte

    db $00,$00,$00                          ; [$03e0] undefined

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__8a51
;     WasPlayerHitByMagic
;
SpriteBox_Left:                             ; [$03e2]
    db $00                                  ; [$03e2] byte

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__8a51
;     WasPlayerHitByMagic
;
SpriteBox_Top:                              ; [$03e3]
    db $00                                  ; [$03e3] byte

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__8a51
;     WasPlayerHitByMagic
;
SpriteBox_Width:                            ; [$03e4]
    db $00                                  ; [$03e4] byte

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__8a51
;     WasPlayerHitByMagic
;
SpriteBox_Height:                           ; [$03e5]
    db $00                                  ; [$03e5] byte


;============================================================================
; IDs of blocks in the last column of screen to the left
;============================================================================

;
; XREFS:
;     Area_CanPlayerMoveLeft
;     Area_ScrollToNextRoom
;
LastColumnLeftScreen:                       ; [$03e6]
    db $00                                  ; [0]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
LastColumnLeftScreen_1_:                    ; [$03e7]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:


;============================================================================
; IDs of blocks in the first column of screen to the right
;============================================================================

;
; XREFS:
;     Area_CanMoveUp
;     Area_ScrollToNextRoom
;
FirstColumnInRightScreen:                   ; [$03f6]
    db $00                                  ; [0]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
FirstColumnInRightScreen_1_:                ; [$03f7]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:

;
; XREFS:
;     Game_Init
;
FirstColumnInRightScreen_10_:               ; [$0400]
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:


;============================================================================
; IDs of blocks in the last row of screen above
;============================================================================

;
; XREFS:
;     Area_CanPlayerMoveUp
;     Area_ScrollToNextRoom
;
LastRowAboveScreen:                         ; [$0406]
    db $00                                  ; [0]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
LastRowAboveScreen_1_:                      ; [$0407]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:


;============================================================================
; IDs of blocks in the first row of screen below
;============================================================================

;
; XREFS:
;     Area_ScrollToNextRoom
;     Player_Maybe_MoveIfPassable
;
FirstRowBelowScreen:                        ; [$0416]
    db $00                                  ; [0]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
FirstRowBelowScreen_1_:                     ; [$0417]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:


;============================================================================
; Flag indicating whether updates to sprites are paused.
;
; This prevents sprite movement or collision handling when
; set.
;============================================================================

;
; XREFS:
;     Sprites_UpdateAll
;     Game_DrawScreenInFrozenState
;
Sprites_UpdatesPaused:                      ; [$0426]
    db $00                                  ; [$0426] bool


;============================================================================
; Duration of the pointment
;============================================================================

;
; XREFS:
;     Player_HandleTouchEnemy
;     Player_HandleTouchEnemyMagic
;     SpriteBehavior__a246
;     Game_ClearTimedItems
;     Game_DecOintmentDuration
;     LimitItemDurations
;     Player_PickUpOintment
;
DurationOintment:                           ; [$0427]
    db $00                                  ; [$0427] byte


;============================================================================
; Duration of the gloves
;============================================================================

;
; XREFS:
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__a25f
;     Game_ClearTimedItems
;     Game_DecGloveDuration
;     Player_PickUpGlove
;
DurationGlove:                              ; [$0428]
    db $00                                  ; [$0428] byte


;============================================================================
; Duration of the wing boots
;============================================================================

;
; XREFS:
;     Game_ClearTimedItems
;     Game_DecWingBootsDuration
;     Player_UseWingBoots
;
DurationWingBoots:                          ; [$0429]
    db $00                                  ; [$0429] byte


;============================================================================
; Duration of the active hour glass
;============================================================================

;
; XREFS:
;     Sprites_Maybe_UpdateBehavior
;     Sprites_UpdateAll
;     Game_ClearTimedItems
;     Game_DecHourGlassDuration
;     LimitItemDurations
;     Player_UseHourGlass
;
DurationHourGlass:                          ; [$042a]
    db $00                                  ; [$042a] byte


;============================================================================
; Key requirement for the current door
;============================================================================

;
; XREFS:
;     Game_CheckDoorRequirement
;     Game_UnlockDoor
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToOutside
;
CurrentDoor_KeyRequirement:                 ; [$042b]
    db $00                                  ; [$042b] byte


;============================================================================
; 0x01 = Black Onyx
; 0x02 = Pendant
; 0x04 = Magical Rod
; 0x08 = Elixir
; 0x10 = Demons Ring
; 0x20 = Ring of Dworf
; 0x40 = Ring of Ruby
; 0x80 = Ring of Elf
;============================================================================

;
; XREFS:
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_Maybe_ShowStatus
;     Player_LacksItem
;     Player_RemoveItem
;     Player_SetSpecialItem
;     Player_SetStartGameState
;     Something_ShopCursorInventory
;     Player_ApplyDamage
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
;     SpriteBehavior__a47f
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
    db $00                                  ; [$042c] SpecialItemsBits


;============================================================================
; Special flags for objectives.
;
; 0x01 = Spring of Trunk has been completed (maybe?)
; 0x02 = Spring of Trunk quest has started (maybe?)
; 0x10 = Mattock collected
; 0x20 = Path to Mascon was opened
;============================================================================

;
; XREFS:
;     IScriptAction_IfQuestCompleted
;     IScriptAction_SetQuestComplete
;     Password_EncodeGameState
;     Password_Load
;     Player_SetStartGameState
;     SpriteBehavior__a31e
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a558
;     SpriteBehavior__a56f
;     SpriteBehavior__a586
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_CheckPushingBlock
;     Player_PickUpMattockWithQuest
;     Player_PickUpWingBootsWithQuest
;     Player_Spawn
;     ScreenEvents_HandlePathToMasconEvent
;
Quests:                                     ; [$042d]
    db $00                                  ; [$042d] Quests


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
;============================================================================

;
; XREFS:
;     Area_BeginScrollToNextRoom
;     DEAD_FUN_PRG15_MIRROR__ef45
;     GameLoop_RunScreenEventHandlers
;     ScreenEvents_HandleBoss
;     ScreenEvents_HandlePathToMasconEvent
;     Screen_LoadSpecialEventID
;     Screen_SetNoSpecialEventID
;
CurrentScreen_SpecialEventID:               ; [$042e]
    db $00                                  ; [$042e] byte

;
; XREFS:
;     Game_InitScreenAndMusic
;     Game_InitStateForSpawn
;     Game_MainLoop
;
Maybe_GameScreenStart:                      ; [$042f]
    db $00                                  ; [$042f] byte

;
; XREFS:
;     LoadPalette
;     Player_HandleDeath
;     Screen_FadeToBlack
;     Screen_NextTransitionState
;     UNUSED_FUN_PRG15_MIRROR__da29
;
PaletteIndex:                               ; [$0430]
    db $00                                  ; [$0430] byte


;============================================================================
; Player's health (full)
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
    db $00                                  ; [$0431] byte


;============================================================================
; Player's health (fraction)
;============================================================================

;
; XREFS:
;     Player_ReduceHP
;     Player_UseHourGlass
;
Player_HP_L:                                ; [$0432]
    db $00                                  ; [$0432] byte

    db $00,$00                              ; [$0434] undefined

;
; XREFS:
;     Debug_ChooseArea
;     EndGame_MoveToKingsRoom
;     FUN_PRG15_MIRROR__daf6
;     Game_DropLadderToMascon
;     Game_InitStateForStartScreen
;     Game_SetupAndLoadArea
;     Game_SpawnInTemple
;     Player_EnterDoorToOutside
;
Area_Region:                                ; [$0435]
    db $00                                  ; [$0435] AreasRegion


;============================================================================
; Temporary storage for a sound ID.
;
; The sound ID to play (the A register) is stored here
; in PlaySound() while registers get pushed onto the
; stack. It's then loaded from here before calling
; PlaySoundInner().
;
; This is not used outside of this.
;============================================================================

;
; XREFS:
;     Sound_PlayEffect
;
Temp_SoundIDToPlay:                         ; [$0436]
    db $00                                  ; [$0436] SoundID


;============================================================================
; Player's current title
;============================================================================

;
; XREFS:
;     IScriptAction_CheckUpdatePlayerTitle
;     IScriptAction_IfPlayerHasTitle
;     Password_EncodeGameState
;     Password_Load
;     PlayerMenu_Maybe_ShowStatus
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Maybe_Player_CalcSpeed
;     Player_UseWingBoots
;     TextBox_ShowMessage_ShowPlayerTitle
;     TextBox_Something_ShowMessage_f4a2
;
PlayerTitle:                                ; [$0437]
    db $00                                  ; [$0437] byte


;============================================================================
; 0x00 = Player is alive
; 0x01 = Player is dead
;============================================================================

;
; XREFS:
;     Game_InitStateForSpawn
;     Game_MainLoop
;     Player_HandleDeath
;     Player_ReduceHP
;
PlayerIsDead:                               ; [$0438]
    db $00                                  ; [$0438] bool


;============================================================================
; The temple in which the player will be spawned upon death.
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
    db $00                                  ; [$0439] Temple

;
; XREFS:
;     Something_IncAndCapDAT043a
;
BYTE_043a:                                  ; [$043a]
    db $00                                  ; [$043a] byte

    db $00


;============================================================================
; Block properties of the currently-active screen
;============================================================================

;
; XREFS:
;     Area_GetBlockProperty
;     Area_LoadBlockProperties
;
BlockProperties:                            ; [$043c]
    db $00                                  ; [0]:

;
; XREFS:
;     Area_LoadBlockProperties
;
BlockProperties_1_:                         ; [$043d]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:
    db $00                                  ; [32]:
    db $00                                  ; [33]:
    db $00                                  ; [34]:
    db $00                                  ; [35]:
    db $00                                  ; [36]:
    db $00                                  ; [37]:
    db $00                                  ; [38]:
    db $00                                  ; [39]:
    db $00                                  ; [40]:
    db $00                                  ; [41]:
    db $00                                  ; [42]:
    db $00                                  ; [43]:
    db $00                                  ; [44]:
    db $00                                  ; [45]:
    db $00                                  ; [46]:
    db $00                                  ; [47]:
    db $00                                  ; [48]:
    db $00                                  ; [49]:
    db $00                                  ; [50]:
    db $00                                  ; [51]:
    db $00                                  ; [52]:
    db $00                                  ; [53]:
    db $00                                  ; [54]:
    db $00                                  ; [55]:
    db $00                                  ; [56]:
    db $00                                  ; [57]:
    db $00                                  ; [58]:
    db $00                                  ; [59]:
    db $00                                  ; [60]:
    db $00                                  ; [61]:
    db $00                                  ; [62]:
    db $00                                  ; [63]:
    db $00                                  ; [64]:
    db $00                                  ; [65]:
    db $00                                  ; [66]:
    db $00                                  ; [67]:
    db $00                                  ; [68]:
    db $00                                  ; [69]:
    db $00                                  ; [70]:
    db $00                                  ; [71]:
    db $00                                  ; [72]:
    db $00                                  ; [73]:
    db $00                                  ; [74]:
    db $00                                  ; [75]:
    db $00                                  ; [76]:
    db $00                                  ; [77]:
    db $00                                  ; [78]:
    db $00                                  ; [79]:
    db $00                                  ; [80]:
    db $00                                  ; [81]:
    db $00                                  ; [82]:
    db $00                                  ; [83]:
    db $00                                  ; [84]:
    db $00                                  ; [85]:
    db $00                                  ; [86]:
    db $00                                  ; [87]:
    db $00                                  ; [88]:
    db $00                                  ; [89]:
    db $00                                  ; [90]:
    db $00                                  ; [91]:
    db $00                                  ; [92]:
    db $00                                  ; [93]:
    db $00                                  ; [94]:
    db $00                                  ; [95]:
    db $00                                  ; [96]:
    db $00                                  ; [97]:
    db $00                                  ; [98]:
    db $00                                  ; [99]:
    db $00                                  ; [100]:
    db $00                                  ; [101]:
    db $00                                  ; [102]:
    db $00                                  ; [103]:
    db $00                                  ; [104]:
    db $00                                  ; [105]:
    db $00                                  ; [106]:
    db $00                                  ; [107]:
    db $00                                  ; [108]:
    db $00                                  ; [109]:
    db $00                                  ; [110]:
    db $00                                  ; [111]:
    db $00                                  ; [112]:
    db $00                                  ; [113]:
    db $00                                  ; [114]:
    db $00                                  ; [115]:
    db $00                                  ; [116]:
    db $00                                  ; [117]:
    db $00                                  ; [118]:
    db $00                                  ; [119]:
    db $00                                  ; [120]:
    db $00                                  ; [121]:
    db $00                                  ; [122]:
    db $00                                  ; [123]:
    db $00                                  ; [124]:
    db $00                                  ; [125]:
    db $00                                  ; [126]:
    db $00                                  ; [127]:

;
; XREFS:
;     FUN_PRG14__8329
;     HandlePlayerHitByMagic
;     Player_ApplyDamage
;     SpriteBehavior__MaybeSugata
;     Player_ReduceHP
;     Player_Something_ChangeHP
;
Arg_PlayerHealthDelta_L:                    ; [$04bc]
    db $00                                  ; [$04bc] byte

;
; XREFS:
;     FUN_PRG14__8329
;     HandlePlayerHitByMagic
;     Player_ApplyDamage
;     SpriteBehavior__MaybeSugata
;     Player_ReduceHP
;     Player_Something_ChangeHP
;
Arg_PlayerHealthDelta_U:                    ; [$04bd]
    db $00                                  ; [$04bd] byte

;
; XREFS:
;     FUN_PRG14__8329
;     Player_Something_ChangeHP
;
BYTE_04be:                                  ; [$04be]
    db $00                                  ; [$04be] byte

;
; XREFS:
;     FUN_PRG14__8329
;     Player_Something_ChangeHP
;
BYTE_04bf:                                  ; [$04bf]
    db $00                                  ; [$04bf] byte

;
; XREFS:
;     Player_Something_ChangeHP
;
Temp1_SomethingChangedHP:                   ; [$04c0]
    db $00                                  ; [$04c0] byte

;
; XREFS:
;     Player_Something_ChangeHP
;
Temp2_SomethingChangedHP:                   ; [$04c1]
    db $00                                  ; [$04c1] byte

;
; XREFS:
;     PasswordScreen_GetDPadBits
;     PasswordScreen_Show
;
Password_DPadBits:                          ; [$04c2]
    db $00                                  ; [$04c2] ButtonBitmask


;============================================================================
; A counter used to wait after holding down a direction before auto-repeating
; the cursor movement.
;
; See PasswordScreen_GetDPadBits for usage.
;============================================================================

;
; XREFS:
;     PasswordScreen_GetDPadBits
;     PasswordScreen_Show
;
Password_CounterBeforeAutoRepeatMove:       ; [$04c3]
    db $00,$00,$00                          ; [$04c3] byte

;
; XREFS:
;     Password_EncodeValueList
;
Password_Temp1:                             ; [$04c6]
    db $00                                  ; [$04c6] byte

;
; XREFS:
;     Password_DecodeValueList
;     Password_EncodeValueList
;
Password_Temp2:                             ; [$04c7]
    db $00                                  ; [$04c7] byte

;
; XREFS:
;     Password_DecodeValueList
;     Password_EncodeValueList
;
Password_Temp3:                             ; [$04c8]
    db $00                                  ; [$04c8] byte

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
    db $00                                  ; [$04c9] byte

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
    db $00                                  ; [$04ca] byte

;
; XREFS:
;     Password_GenerateState
;     Password_GetNext6Bits
;
Password_6BitCount:                         ; [$04cb]
    db $00                                  ; [$04cb] byte

;
; XREFS:
;     Password_EncodeValue
;     Password_GenerateState
;     Password_Maybe_CheckPasswordLength
;
Password_Checksum:                          ; [$04cc]
    db $00                                  ; [$04cc] byte

;
; XREFS:
;     Password_DecodeValue
;     Password_EncodeValue
;     Password_GenerateState
;
Password_EncodedState:                      ; [$04cd]
    db $00                                  ; [0]:

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
Password_EncodedState_1_:                   ; [$04ce]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:


;============================================================================
; Title the player will get in the next guru visit
;============================================================================

;
; XREFS:
;     IScriptAction_CheckUpdatePlayerTitle
;     PlayerMenu_Maybe_ShowStatus
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_CheckReachedNextTitle
;
NextPlayerTitle:                            ; [$04ed]
    db $00                                  ; [$04ed] byte

;
; XREFS:
;     UI_DrawManaOrHPBar
;     UI_DrawStatusSymbols
;
Something_ManaOrHPBar:                      ; [$04ee]
    db $00                                  ; [$04ee] byte

    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$04f0] undefined
    db $00                                  ; [$04ff] undefined


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
;============================================================================

;
; XREFS:
;     Area_WriteTwoBlocksFromData12ToPPUBuffer
;     Area_WriteTwoBlocksFromData34ToPPUBuffer
;     FUN_PRG15_MIRROR__c033
;     FUN_PRG15_MIRROR__d82d
;     Fog_UpdateTiles
;     Game_Init
;     PPUBuffer_Append0
;     PPUBuffer_Draw
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     Player_DrawDeathAnimation
;
PPUBuffer:                                  ; [$0500]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:

;
; XREFS:
;     UI_ClearSelectedItemPic
;
PPUBuffer_4_:                               ; [$0504]
    db $00                                  ; [4]:

;
; XREFS:
;     UI_ClearSelectedItemPic
;
PPUBuffer_5_:                               ; [$0505]
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f316
;
PPUBuffer_8_:                               ; [$0508]
    db $00                                  ; [8]:

;
; XREFS:
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f316
;
PPUBuffer_9_:                               ; [$0509]
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:
    db $00                                  ; [32]:
    db $00                                  ; [33]:
    db $00                                  ; [34]:
    db $00                                  ; [35]:
    db $00                                  ; [36]:
    db $00                                  ; [37]:
    db $00                                  ; [38]:
    db $00                                  ; [39]:
    db $00                                  ; [40]:
    db $00                                  ; [41]:
    db $00                                  ; [42]:
    db $00                                  ; [43]:
    db $00                                  ; [44]:
    db $00                                  ; [45]:
    db $00                                  ; [46]:
    db $00                                  ; [47]:
    db $00                                  ; [48]:
    db $00                                  ; [49]:
    db $00                                  ; [50]:
    db $00                                  ; [51]:
    db $00                                  ; [52]:
    db $00                                  ; [53]:
    db $00                                  ; [54]:
    db $00                                  ; [55]:
    db $00                                  ; [56]:
    db $00                                  ; [57]:
    db $00                                  ; [58]:
    db $00                                  ; [59]:
    db $00                                  ; [60]:
    db $00                                  ; [61]:
    db $00                                  ; [62]:
    db $00                                  ; [63]:
    db $00                                  ; [64]:
    db $00                                  ; [65]:
    db $00                                  ; [66]:
    db $00                                  ; [67]:
    db $00                                  ; [68]:
    db $00                                  ; [69]:
    db $00                                  ; [70]:
    db $00                                  ; [71]:
    db $00                                  ; [72]:
    db $00                                  ; [73]:
    db $00                                  ; [74]:
    db $00                                  ; [75]:
    db $00                                  ; [76]:
    db $00                                  ; [77]:
    db $00                                  ; [78]:
    db $00                                  ; [79]:
    db $00                                  ; [80]:
    db $00                                  ; [81]:
    db $00                                  ; [82]:
    db $00                                  ; [83]:
    db $00                                  ; [84]:
    db $00                                  ; [85]:
    db $00                                  ; [86]:
    db $00                                  ; [87]:
    db $00                                  ; [88]:
    db $00                                  ; [89]:
    db $00                                  ; [90]:
    db $00                                  ; [91]:
    db $00                                  ; [92]:
    db $00                                  ; [93]:
    db $00                                  ; [94]:
    db $00                                  ; [95]:
    db $00                                  ; [96]:
    db $00                                  ; [97]:
    db $00                                  ; [98]:
    db $00                                  ; [99]:
    db $00                                  ; [100]:
    db $00                                  ; [101]:
    db $00                                  ; [102]:
    db $00                                  ; [103]:
    db $00                                  ; [104]:
    db $00                                  ; [105]:
    db $00                                  ; [106]:
    db $00                                  ; [107]:
    db $00                                  ; [108]:
    db $00                                  ; [109]:
    db $00                                  ; [110]:
    db $00                                  ; [111]:
    db $00                                  ; [112]:
    db $00                                  ; [113]:
    db $00                                  ; [114]:
    db $00                                  ; [115]:
    db $00                                  ; [116]:
    db $00                                  ; [117]:
    db $00                                  ; [118]:
    db $00                                  ; [119]:
    db $00                                  ; [120]:
    db $00                                  ; [121]:
    db $00                                  ; [122]:
    db $00                                  ; [123]:
    db $00                                  ; [124]:
    db $00                                  ; [125]:
    db $00                                  ; [126]:
    db $00                                  ; [127]:
    db $00                                  ; [128]:
    db $00                                  ; [129]:
    db $00                                  ; [130]:
    db $00                                  ; [131]:
    db $00                                  ; [132]:
    db $00                                  ; [133]:
    db $00                                  ; [134]:
    db $00                                  ; [135]:
    db $00                                  ; [136]:
    db $00                                  ; [137]:
    db $00                                  ; [138]:
    db $00                                  ; [139]:
    db $00                                  ; [140]:
    db $00                                  ; [141]:
    db $00                                  ; [142]:
    db $00                                  ; [143]:
    db $00                                  ; [144]:
    db $00                                  ; [145]:
    db $00                                  ; [146]:
    db $00                                  ; [147]:
    db $00                                  ; [148]:
    db $00                                  ; [149]:
    db $00                                  ; [150]:
    db $00                                  ; [151]:
    db $00                                  ; [152]:
    db $00                                  ; [153]:
    db $00                                  ; [154]:
    db $00                                  ; [155]:
    db $00                                  ; [156]:
    db $00                                  ; [157]:
    db $00                                  ; [158]:
    db $00                                  ; [159]:
    db $00                                  ; [160]:
    db $00                                  ; [161]:
    db $00                                  ; [162]:
    db $00                                  ; [163]:
    db $00                                  ; [164]:
    db $00                                  ; [165]:
    db $00                                  ; [166]:
    db $00                                  ; [167]:
    db $00                                  ; [168]:
    db $00                                  ; [169]:
    db $00                                  ; [170]:
    db $00                                  ; [171]:
    db $00                                  ; [172]:
    db $00                                  ; [173]:
    db $00                                  ; [174]:
    db $00                                  ; [175]:
    db $00                                  ; [176]:
    db $00                                  ; [177]:
    db $00                                  ; [178]:
    db $00                                  ; [179]:
    db $00                                  ; [180]:
    db $00                                  ; [181]:
    db $00                                  ; [182]:
    db $00                                  ; [183]:
    db $00                                  ; [184]:
    db $00                                  ; [185]:
    db $00                                  ; [186]:
    db $00                                  ; [187]:
    db $00                                  ; [188]:
    db $00                                  ; [189]:
    db $00                                  ; [190]:
    db $00                                  ; [191]:
    db $00                                  ; [192]:
    db $00                                  ; [193]:
    db $00                                  ; [194]:
    db $00                                  ; [195]:
    db $00                                  ; [196]:
    db $00                                  ; [197]:
    db $00                                  ; [198]:
    db $00                                  ; [199]:
    db $00                                  ; [200]:
    db $00                                  ; [201]:
    db $00                                  ; [202]:
    db $00                                  ; [203]:
    db $00                                  ; [204]:
    db $00                                  ; [205]:
    db $00                                  ; [206]:
    db $00                                  ; [207]:
    db $00                                  ; [208]:
    db $00                                  ; [209]:
    db $00                                  ; [210]:
    db $00                                  ; [211]:
    db $00                                  ; [212]:
    db $00                                  ; [213]:
    db $00                                  ; [214]:
    db $00                                  ; [215]:
    db $00                                  ; [216]:
    db $00                                  ; [217]:
    db $00                                  ; [218]:
    db $00                                  ; [219]:
    db $00                                  ; [220]:
    db $00                                  ; [221]:
    db $00                                  ; [222]:
    db $00                                  ; [223]:
    db $00                                  ; [224]:
    db $00                                  ; [225]:
    db $00                                  ; [226]:
    db $00                                  ; [227]:
    db $00                                  ; [228]:
    db $00                                  ; [229]:
    db $00                                  ; [230]:
    db $00                                  ; [231]:
    db $00                                  ; [232]:
    db $00                                  ; [233]:
    db $00                                  ; [234]:
    db $00                                  ; [235]:
    db $00                                  ; [236]:
    db $00                                  ; [237]:
    db $00                                  ; [238]:
    db $00                                  ; [239]:
    db $00                                  ; [240]:
    db $00                                  ; [241]:
    db $00                                  ; [242]:
    db $00                                  ; [243]:
    db $00                                  ; [244]:
    db $00                                  ; [245]:
    db $00                                  ; [246]:
    db $00                                  ; [247]:
    db $00                                  ; [248]:
    db $00                                  ; [249]:
    db $00                                  ; [250]:
    db $00                                  ; [251]:
    db $00                                  ; [252]:
    db $00                                  ; [253]:
    db $00                                  ; [254]:
    db $00                                  ; [255]:


;============================================================================
; Uncompressed block data of the current screen
;
; This also overlaps with various other bits of state,
; depending on the screen. The password screen and the
; intro/outro animations also store state within this
; range.
;============================================================================

;
; XREFS:
;     Menu_Draw_Something9312
;     Menu_Something_93EC
;     PasswordScreen_Maybe_WriteCharAtCursor
;     Password_Maybe_CheckPasswordLength
;     Area_IsBlockImpassableOrLadder
;     Area_LoadBlocks
;     Area_ScrollToNextRoom
;     Area_SetStateFromDoorDestination
;     Area_StoreBlockIsAir
;     FUN_PRG15_MIRROR__d6ce
;     FUN_PRG15_MIRROR__d7b0
;     FUN_PRG15_MIRROR__f7b7
;     Game_Init
;     Game_OpenPathToMascon
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_FallToGround
;     Player_UseMattock
;     ScreenBuffer_Clear
;     ScreenBuffer_IsBlockImpassable
;     ScreenBuffer_LoadBlockProperty
;     TextBox_Maybe_GetPaletteBehindTextbox
;
Password_EnteredChars:                      ; [$0600]
ScreenBuffer:
    db $00                                  ; [0]:

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;     Area_ScrollToNextRoom
;     ScreenBuffer_Clear
;
ScreenBuffer_1_:                            ; [$0601]
    db $00                                  ; [1]:

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
ScreenBuffer_2_:                            ; [$0602]
    db $00                                  ; [2]:

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
ScreenBuffer_3_:                            ; [$0603]
    db $00                                  ; [3]:

;
; XREFS:
;     Password_Maybe_CheckPasswordLength
;
ScreenBuffer_4_:                            ; [$0604]
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
ScreenBuffer_15_:                           ; [$060f]
    db $00                                  ; [15]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
ScreenBuffer_16_:                           ; [$0610]
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:

;
; XREFS:
;     PasswordScreen_Show
;
ScreenBuffer_30_:                           ; [$061e]
    db $00                                  ; [30]:

;
; XREFS:
;     PasswordScreen_Show
;     Area_ScrollToNextRoom
;
ScreenBuffer_31_:                           ; [$061f]
    db $00                                  ; [31]:
    db $00                                  ; [32]:
    db $00                                  ; [33]:

;
; XREFS:
;     Game_DropLadderToMascon
;
ScreenBuffer_34_:                           ; [$0622]
    db $00                                  ; [34]:
    db $00                                  ; [35]:
    db $00                                  ; [36]:
    db $00                                  ; [37]:
    db $00                                  ; [38]:
    db $00                                  ; [39]:
    db $00                                  ; [40]:
    db $00                                  ; [41]:
    db $00                                  ; [42]:
    db $00                                  ; [43]:
    db $00                                  ; [44]:
    db $00                                  ; [45]:
    db $00                                  ; [46]:
    db $00                                  ; [47]:
    db $00                                  ; [48]:
    db $00                                  ; [49]:
    db $00                                  ; [50]:
    db $00                                  ; [51]:
    db $00                                  ; [52]:
    db $00                                  ; [53]:
    db $00                                  ; [54]:
    db $00                                  ; [55]:
    db $00                                  ; [56]:
    db $00                                  ; [57]:
    db $00                                  ; [58]:
    db $00                                  ; [59]:
    db $00                                  ; [60]:
    db $00                                  ; [61]:
    db $00                                  ; [62]:
    db $00                                  ; [63]:
    db $00                                  ; [64]:
    db $00                                  ; [65]:
    db $00                                  ; [66]:
    db $00                                  ; [67]:
    db $00                                  ; [68]:
    db $00                                  ; [69]:
    db $00                                  ; [70]:
    db $00                                  ; [71]:
    db $00                                  ; [72]:
    db $00                                  ; [73]:
    db $00                                  ; [74]:
    db $00                                  ; [75]:
    db $00                                  ; [76]:
    db $00                                  ; [77]:
    db $00                                  ; [78]:
    db $00                                  ; [79]:
    db $00                                  ; [80]:
    db $00                                  ; [81]:
    db $00                                  ; [82]:
    db $00                                  ; [83]:
    db $00                                  ; [84]:
    db $00                                  ; [85]:
    db $00                                  ; [86]:
    db $00                                  ; [87]:
    db $00                                  ; [88]:
    db $00                                  ; [89]:
    db $00                                  ; [90]:
    db $00                                  ; [91]:
    db $00                                  ; [92]:
    db $00                                  ; [93]:
    db $00                                  ; [94]:
    db $00                                  ; [95]:
    db $00                                  ; [96]:
    db $00                                  ; [97]:

;
; XREFS:
;     Maybe_Password_CursorHandler
;     Maybe_Password_CursorHandler_Something9545
;     Menu_Something_954F
;     PasswordScreen_SetCusorCol
;     PasswordScreen_Show
;     Password_IsCursorWrapping
;     Password_NormalizeCursorColForBottomRow
;
Password_CursorCol:                         ; [$0662]
    db $00                                  ; [98]:

;
; XREFS:
;     Maybe_Password_CursorHandler
;     Menu_Something_954F
;     PasswordScreen_Show
;     Password_IsCursorWrapping
;
Password_CursorRow:                         ; [$0663]
    db $00                                  ; [99]:

;
; XREFS:
;     FUN_PRG12__92ed
;     LAB_PRG12__93bd [$PRG12::93bd]
;     LAB_PRG12__93d7 [$PRG12::93d7]
;     Menu_Draw_Something9312
;     Menu_Draw_Something9351
;     Menu_Draw_Something9386
;     Menu_Draw_Something93B4 [$PRG12::93b4]
;     Menu_Something_93EC
;     PasswordScreen_Maybe_WriteCharAtCursor
;     PasswordScreen_Show
;
Password_FieldCursorPos:                    ; [$0664]
    db $00                                  ; [100]:

;
; XREFS:
;     Menu_Draw_Something9312
;     Menu_Draw_Something9351
;     Menu_Draw_Something9386
;     PasswordScreen_Show
;
Password_MaxChars:                          ; [$0665]
    db $00                                  ; [101]:

;
; XREFS:
;     Menu_Draw_Something9312
;     Menu_Draw_Something9351
;     Menu_Draw_Something9386
;     Menu_Something_93EC
;     PasswordScreen_Show
;     Password_Maybe_CheckPasswordLength
;
Password_EnteredCharsLength:                ; [$0666]
    db $00                                  ; [102]:
    db $00                                  ; [103]:
    db $00                                  ; [104]:
    db $00                                  ; [105]:
    db $00                                  ; [106]:
    db $00                                  ; [107]:
    db $00                                  ; [108]:
    db $00                                  ; [109]:
    db $00                                  ; [110]:
    db $00                                  ; [111]:
    db $00                                  ; [112]:
    db $00                                  ; [113]:
    db $00                                  ; [114]:
    db $00                                  ; [115]:
    db $00                                  ; [116]:
    db $00                                  ; [117]:
    db $00                                  ; [118]:
    db $00                                  ; [119]:
    db $00                                  ; [120]:
    db $00                                  ; [121]:
    db $00                                  ; [122]:
    db $00                                  ; [123]:
    db $00                                  ; [124]:
    db $00                                  ; [125]:
    db $00                                  ; [126]:
    db $00                                  ; [127]:
    db $00                                  ; [128]:
    db $00                                  ; [129]:
    db $00                                  ; [130]:
    db $00                                  ; [131]:
    db $00                                  ; [132]:
    db $00                                  ; [133]:
    db $00                                  ; [134]:

;
; XREFS:
;     StartScreen_CheckHandleInput
;     StartScreen_Draw
;     Game_ShowStartScreen
;
ScreenBuffer_135_:                          ; [$0687]
    db $00                                  ; [135]:

;
; XREFS:
;     SplashAnimation_FuncAA94
;     SplashAnimation_SomethingUpdateState
;
ScreenBuffer_136_:                          ; [$0688]
    db $00                                  ; [136]:

;
; XREFS:
;     SplashAnimation_A90F
;     SplashAnimation_FuncAA94
;     SplashAnimation_SomethingOutroUpdate
;
ScreenBuffer_137_:                          ; [$0689]
    db $00                                  ; [137]:

;
; XREFS:
;     SplashAnimation_A90F
;     SplashAnimation_FuncAA94
;     SplashAnimation_SomethingOutroUpdate
;
ScreenBuffer_138_:                          ; [$068a]
    db $00                                  ; [138]:

;
; XREFS:
;     SplashAnimation_FuncAA94
;
ScreenBuffer_139_:                          ; [$068b]
    db $00                                  ; [139]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_AnimPlayerStep
;
ScreenBuffer_140_:                          ; [$068c]
    db $00                                  ; [140]:


;============================================================================
; Counter indicating the player size scale in the intro animation.
;
; This goes from 0 to 4. The larger the number, the smaller
; the player.
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
    db $00                                  ; [141]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_NextAnimState1
;
ScreenBuffer_142_:                          ; [$068e]
    db $00                                  ; [142]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_A90F
;     SplashAnimation_Maybe_NextAnimState2
;     SplashAnimation_RunOutro
;
ScreenBuffer_143_:                          ; [$068f]
    db $00                                  ; [143]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_NextAnimState1
;
ScreenBuffer_144_:                          ; [$0690]
    db $00                                  ; [144]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_NextAnimState2
;
ScreenBuffer_145_:                          ; [$0691]
    db $00                                  ; [145]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;     SplashAnimation_Maybe_NextAnimState1
;
ScreenBuffer_146_:                          ; [$0692]
    db $00                                  ; [146]:

;
; XREFS:
;     Maybe_SplashAnimation_InitIntroState
;     Maybe_SplashAnimation_InitOutroState
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;     SplashAnimation_Maybe_NextAnimState2
;
ScreenBuffer_147_:                          ; [$0693]
    db $00                                  ; [147]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     LAB_PRG12__a9f8 [$PRG12::a9f8]
;
ScreenBuffer_148_:                          ; [$0694]
    db $00                                  ; [148]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     LAB_PRG12__a9f8 [$PRG12::a9f8]
;
ScreenBuffer_149_:                          ; [$0695]
    db $00                                  ; [149]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_150_:                          ; [$0696]
    db $00                                  ; [150]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_151_:                          ; [$0697]
    db $00                                  ; [151]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     FUN_PRG12__aa20
;
ScreenBuffer_152_:                          ; [$0698]
    db $00                                  ; [152]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_153_:                          ; [$0699]
    db $00                                  ; [153]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     FUN_PRG12__aa46
;
ScreenBuffer_154_:                          ; [$069a]
    db $00                                  ; [154]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_155_:                          ; [$069b]
    db $00                                  ; [155]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     FUN_PRG12__aa20
;
ScreenBuffer_156_:                          ; [$069c]
    db $00                                  ; [156]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_157_:                          ; [$069d]
    db $00                                  ; [157]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     FUN_PRG12__aa46
;
ScreenBuffer_158_:                          ; [$069e]
    db $00                                  ; [158]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_159_:                          ; [$069f]
    db $00                                  ; [159]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     FUN_PRG12__aa20
;
ScreenBuffer_160_:                          ; [$06a0]
    db $00                                  ; [160]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_161_:                          ; [$06a1]
    db $00                                  ; [161]:

;
; XREFS:
;     FUN_PRG12__a9a2
;     FUN_PRG12__aa46
;
ScreenBuffer_162_:                          ; [$06a2]
    db $00                                  ; [162]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
ScreenBuffer_163_:                          ; [$06a3]
    db $00                                  ; [163]:

;
; XREFS:
;     SplashAnimation_RunIntro
;     SplashAnimation_SomethingA708
;
ScreenBuffer_164_:                          ; [$06a4]
    db $00                                  ; [164]:

;
; XREFS:
;     SplashAnimation_DrawScenery
;
SplashAnimScene:                            ; [$06a5]
    db $00                                  ; [165]:
    db $00                                  ; [166]:
    db $00                                  ; [167]:
    db $00                                  ; [168]:
    db $00                                  ; [169]:
    db $00                                  ; [170]:
    db $00                                  ; [171]:
    db $00                                  ; [172]:
    db $00                                  ; [173]:
    db $00                                  ; [174]:
    db $00                                  ; [175]:
    db $00                                  ; [176]:
    db $00                                  ; [177]:
    db $00                                  ; [178]:
    db $00                                  ; [179]:
    db $00                                  ; [180]:
    db $00                                  ; [181]:
    db $00                                  ; [182]:
    db $00                                  ; [183]:
    db $00                                  ; [184]:
    db $00                                  ; [185]:
    db $00                                  ; [186]:
    db $00                                  ; [187]:
    db $00                                  ; [188]:
    db $00                                  ; [189]:
    db $00                                  ; [190]:
    db $00                                  ; [191]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
ScreenBuffer_192_:                          ; [$06c0]
    db $00                                  ; [192]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
ScreenBuffer_193_:                          ; [$06c1]
    db $00                                  ; [193]:
    db $00                                  ; [194]:
    db $00                                  ; [195]:
    db $00                                  ; [196]:
    db $00                                  ; [197]:
    db $00                                  ; [198]:
    db $00                                  ; [199]:
    db $00                                  ; [200]:
    db $00                                  ; [201]:
    db $00                                  ; [202]:
    db $00                                  ; [203]:
    db $00                                  ; [204]:
    db $00                                  ; [205]:
    db $00                                  ; [206]:
    db $00                                  ; [207]:
    db $00                                  ; [208]:
    db $00                                  ; [209]:
    db $00                                  ; [210]:
    db $00                                  ; [211]:
    db $00                                  ; [212]:
    db $00                                  ; [213]:
    db $00                                  ; [214]:
    db $00                                  ; [215]:
    db $00                                  ; [216]:
    db $00                                  ; [217]:
    db $00                                  ; [218]:
    db $00                                  ; [219]:
    db $00                                  ; [220]:
    db $00                                  ; [221]:
    db $00                                  ; [222]:
    db $00                                  ; [223]:
    db $00                                  ; [224]:
    db $00                                  ; [225]:
    db $00                                  ; [226]:
    db $00                                  ; [227]:
    db $00                                  ; [228]:
    db $00                                  ; [229]:
    db $00                                  ; [230]:
    db $00                                  ; [231]:
    db $00                                  ; [232]:
    db $00                                  ; [233]:
    db $00                                  ; [234]:
    db $00                                  ; [235]:
    db $00                                  ; [236]:
    db $00                                  ; [237]:
    db $00                                  ; [238]:
    db $00                                  ; [239]:

;
; XREFS:
;     Area_LoadBlocks
;
ScreenBuffer_240_:                          ; [$06f0]
    db $00                                  ; [240]:

;
; XREFS:
;     Area_LoadBlocks
;
ScreenBuffer_241_:                          ; [$06f1]
    db $00                                  ; [241]:
    db $00                                  ; [242]:
    db $00                                  ; [243]:
    db $00                                  ; [244]:
    db $00                                  ; [245]:
    db $00                                  ; [246]:
    db $00                                  ; [247]:
    db $00                                  ; [248]:
    db $00                                  ; [249]:
    db $00                                  ; [250]:
    db $00                                  ; [251]:
    db $00                                  ; [252]:
    db $00                                  ; [253]:
    db $00                                  ; [254]:
    db $00                                  ; [255]:

;
; XREFS:
;     SplashAnimation_FuncAA94
;     SplashAnimation_SomethingUpdateState
;     Game_Init
;     Something_FrameAltToggle
;     Sprite_Maybe_SetAppearanceAddr
;
BYTE_0700:                                  ; [$0700]
    db $00                                  ; [$0700] byte

;
; XREFS:
;     SplashAnimation_FuncAA94
;     Something_FrameAltToggle
;
DAT_0701:                                   ; [$0701]
    db $00                                  ; [$0701] undefined

;
; XREFS:
;     SplashAnimation_FuncAA94
;     Something_FrameAltToggle
;
DAT_0702:                                   ; [$0702]
    db $00                                  ; [$0702] undefined

;
; XREFS:
;     SplashAnimation_FuncAA94
;     Something_FrameAltToggle
;
DAT_0703:                                   ; [$0703]
    db $00                                  ; [$0703] undefined

;
; XREFS:
;     SplashAnimation_SomethingUpdateState
;     Something_FrameAltToggle
;     Wait3969Cycles
;
CYCLES_COUNTER_1:                           ; [$0704]
    db $00                                  ; [0]:

;
; XREFS:
;     Wait3969Cycles
;
CYCLES_COUNTER_1_1_:                        ; [$0705]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:

;
; XREFS:
;     Something_FrameAltToggle
;
CYCLES_COUNTER_1_4_:                        ; [$0708]
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:
    db $00                                  ; [32]:
    db $00                                  ; [33]:
    db $00                                  ; [34]:
    db $00                                  ; [35]:
    db $00                                  ; [36]:
    db $00                                  ; [37]:
    db $00                                  ; [38]:
    db $00                                  ; [39]:
    db $00                                  ; [40]:
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$072d] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$073d] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$074d] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$075d] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$076d] undefined
    db $00,$00,$00,$00,$00,$00,$00          ; [$077d] undefined

;
; XREFS:
;     Wait3969Cycles
;
CYCLES_COUNTER_2:                           ; [$0784]
    db $00                                  ; [0]:

;
; XREFS:
;     Wait3969Cycles
;
CYCLES_COUNTER_2_1_:                        ; [$0785]
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:
    db $00                                  ; [16]:
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]:
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:
    db $00                                  ; [32]:
    db $00                                  ; [33]:
    db $00                                  ; [34]:
    db $00                                  ; [35]:
    db $00                                  ; [36]:
    db $00                                  ; [37]:
    db $00                                  ; [38]:
    db $00                                  ; [39]:
    db $00                                  ; [40]:
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$07ad] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$07bd] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$07cd] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$07dd] undefined
    hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ; [$07ed] undefined
    db $00,$00,$00                          ; [$07fd] undefined
