;============================================================================
; Faxanadu (U).nes
;
; PRG15_MIRROR ($c000 - $ffff)
;============================================================================

    .segment "PRG15_MIRROR"
    .reloc


;============================================================================
; Write attribute data for the HUD to the PPU.
;
; The attribute data will be written from
; HUD_ATTRIBUTE_DATA_BY_INDEX based on the
; UI_AttributeDataIndex set when loading the
; screen.
;
; INPUTS:
;     UI_AttributeDataIndex:
;         The index into the lookup table for the current
;         screen.
;
;     HUD_ATTRIBUTE_DATA_BY_INDEX:
;         The lookup table of attribute data to write.
;
; OUTPUTS:
;     PPUADDR:
;         The updated PPU address.
;
;     PPUDATA:
;         The written data.
;
; CALLS:
;     UI_DrawHUD
;
; XREFS:
;     Screen_SetupNew
;============================================================================
UI_SetHUDPPUAttributes:                     ; [$c000]
    ;
    ; Set the PPUADDR to 0x23C0, the top row where the status
    ; bar resides.
    ;
    LDA #$23
    STA a:PPUADDR                           ; Set upper PPUADDR as 0x23.
    LDA #$c0
    STA a:PPUADDR                           ; Set upper PPUADDR as 0xC0.
    LDX a:UI_AttributeDataIndex             ; X = HUD attribute data index,
                                            ; computed when setting up the
                                            ; screen.
    LDA HUD_ATTRIBUTE_DATA_BY_INDEX,X       ; Load the value for the
                                            ; attribute data.


    ;
    ; Write 8 bytes based on data from the lookup table
    ; HUD_ATTRIBUTE_DATA_BY_INDEX at index
    ; UI_AttributeDataIndex.
    ;
    LDX #$08                                ; X = 8 (loop counter).

  @_writeLoop:                              ; [$c012]
    STA a:PPUDATA                           ; Write to the PPU.
    DEX                                     ; X--
    BNE @_writeLoop                         ; If X > 0, loop.


    ;
    ; Draw the HUD.
    ;
    JMP UI_DrawHUD                          ; Jump to draw the HUD.


;============================================================================
; Attribute data used for the HUD.
;
; These are indexed by values from lookup table
; PALETTE_INDEX_TO_UI_BG_ATTRIBUTE_INDEX (stored in
; UI_AttributeDataIndex.
;
; Only values 0, 1, 2, and 3 are used.
;
; The rest seem to be unused, but many end up styled to
; better match regions of the game.
;
; XREFS:
;     UI_SetHUDPPUAttributes
;============================================================================

;
; XREFS:
;     UI_SetHUDPPUAttributes
;
HUD_ATTRIBUTE_DATA_BY_INDEX:                ; [$c01b]
    .byte $00                               ; [0]: Dartmoor, Castle of
                                            ; Fraternal, King Grieve's Room
    .byte $55                               ; [1]: Start Screen
    .byte $aa                               ; [2]: Most exterior areas.
    .byte $ff                               ; [3]: Most interior areas.
    .byte $41                               ; [4]: Here and below are unused.
    .byte $20                               ; [5]:
    .byte $04                               ; [6]:
    .byte $07                               ; [7]:
    .byte $08                               ; [8]:
    .byte $09                               ; [9]:
    .byte $0a                               ; [10]:
    .byte $61                               ; [11]:
    .byte $20                               ; [12]:
    .byte $04                               ; [13]:
    .byte $0b                               ; [14]:
    .byte $0c                               ; [15]:
    .byte $0d                               ; [16]:
    .byte $0e                               ; [17]:
    .byte $56                               ; [18]:
    .byte $20                               ; [19]:
    .byte $03                               ; [20]:
    .byte $0f                               ; [21]:
    .byte $10                               ; [22]:
    .byte $11                               ; [23]:


;============================================================================
; DEADCODE
;============================================================================
DEADCODE_FUN_PRG15_MIRROR__c033:            ; [$c033]
    LDY #$00
    LDA (Temp_Addr_L),Y
    STA PPU_TargetAddr
    INY
    LDA (Temp_Addr_L),Y
    STA PPU_TargetAddr_U
    INY
    LDA (Temp_Addr_L),Y
    PHA
    JSR PPUBuffer_QueueCommandOrLength
    PLA
    STA Temp_00
    LDY #$03

  @LAB_PRG15_MIRROR__c04a:                  ; [$c04a]
    LDA (Temp_Addr_L),Y
    STA PPUBuffer,X
    INX
    INY
    DEC Temp_00
    BNE @LAB_PRG15_MIRROR__c04a
    STX PPUBuffer_WriteOffset
    RTS


;============================================================================
; Draw the player's state on the HUD UI.
;
; INPUTS:
;     Player_MP:
;         The player's current MP.
;
; OUTPUTS:
;     None
;
; CALLS:
;     UI_DrawTimeValue
;     UI_DrawGoldValue
;     UI_DrawPlayerExperience
;     UI_DrawPlayerHP
;     Player_SetMP
;     PPUBuffer_DrawAll
;
; XREFS:
;     UI_SetHUDPPUAttributes
;============================================================================
UI_DrawHUD:                                 ; [$c058]
    LDA #$00
    JSR UI_DrawTimeValue                    ; Draw the time value.
    JSR UI_DrawGoldValue                    ; Draw the gold value.
    JSR PPUBuffer_DrawAll                   ; Flush to the PPU.
    JSR UI_DrawPlayerExperience             ; Draw the player experience
                                            ; value.
    JSR PPUBuffer_DrawAll                   ; Flush to the PPU.
    JSR PPUBuffer_DrawAll                   ; Flush to the PPU.
    JSR UI_DrawPlayerHP                     ; Draw the player's HP bar.
    JSR PPUBuffer_DrawAll                   ; Flush to the PPU.
    LDA a:Player_MP                         ; Load the player's MP.
    JSR Player_SetMP                        ; Set it and draw.
    JMP PPUBuffer_DrawAll                   ; Flush to the PPU.


;============================================================================
; Increase the player's HP.
;
; This will be capped to 80HP.
;
; INPUTS:
;     A:
;         The number of health points to add.
;
;     Player_HP_U:
;         The upper byte of player health to add to.
;
; OUTPUTS:
;     Player_HP_U:
;         The new upper byte of player health.
;
; CALLS:
;     UI_DrawPlayerHPValue
;
; XREFS:
;     Player_HandleTouchBread
;     Player_FillHPAndMP
;     Player_UseRedPotion
;============================================================================
Player_AddHP:                               ; [$c07b]
    ;
    ; Update the player's HP with the provided value.
    ;
    CLC                                     ; Clear carry so it's not added.
    ADC a:Player_HP_U                       ; Add the provided HP to the
                                            ; player's health.
    STA a:Player_HP_U                       ; Store as the new health.


    ;
    ; Check against the cap.
    ;
    CMP #$50                                ; Cap at 80 HP.
    BCC @_drawHP                            ; Jump if it's under.
    LDA #$50                                ; Else, cap it to 80HP.
    STA a:Player_HP_U                       ; Store as the new health.

  @_drawHP:                                 ; [$c08b]
    JMP UI_DrawPlayerHPValue


;============================================================================
; Decrease the player's HP.
;
; If the HP hits <= 0, and an elixir is in the inventory, it will be used.
; If it hits <= 0 and there's no elixir, the player will die.
;
; INPUTS
;     Player_HP_U:
;     Player_HP_L:
;         The player's current health.
;
;     Arg_PlayerHealthDelta_U:
;     Arg_PlayerHealthDelta_L:
;         The health to add.
;
;     SpecialItems:
;         The player's current special items.
;
; OUTPUTS:
;     Player_HP_U:
;     Player_HP_L:
;         The new player health.
;
;     PlayerIsDead:
;         Set to 1 if the player dies.
;
; CALLS:
;     UI_DrawPlayerHP
;     Player_UseElixir
;
; XREFS:
;     Player_ApplyDamage
;     Player_HandleHitByMagic
;     SpriteBehavior_FlashScreenHitPlayer
;============================================================================
Player_ReduceHP:                            ; [$c08e]
    ;
    ; Reduce the lower byte of player health.
    ;
    LDA a:Player_HP_L                       ; Load the lower byte of the
                                            ; player's health.
    SEC
    SBC a:Arg_PlayerHealthDelta_L           ; Subtract the specified lower
                                            ; byte of health.
    STA a:Player_HP_L                       ; Store it as the new player
                                            ; health.


    ;
    ; Reduce the upper byte of player health.
    ;
    LDA a:Player_HP_U                       ; Load the upper byte of the
                                            ; player's health.
    SBC a:Arg_PlayerHealthDelta_U           ; Subtract the specified upper
                                            ; byte of health.
    STA a:Player_HP_U                       ; Store it as the new player
                                            ; health.
    BCS @_isStillAlive                      ; If there's still health left,
                                            ; the player is still alive.


    ;
    ; The player is out of health. They may die.
    ;
    LDA #$00
    STA a:Player_HP_U                       ; Set the player's upper byte of
                                            ; health to 0.
    JSR UI_DrawPlayerHP                     ; Draw the health.


    ;
    ; Check if the player has an elixir before killing them.
    ;
    LDA a:SpecialItems                      ; Load the player's special
                                            ; items.
    AND #$08                                ; Check if the player has an
                                            ; elixir.
    BEQ @_killPlayer                        ; If not, kill the player.


    ;
    ; The player has an elixir. Fill up their health instead
    ; of killing the player.
    ;
    JMP Player_UseElixir                    ; Use the Elixir.


    ;
    ; Mark the player as dead.
    ;
  @_killPlayer:                             ; [$c0b5]
    LDA #$01                                ; Mark the player as dead.
    STA a:PlayerIsDead                      ; Store that.


    ;
    ; Draw the player's health.
    ;
  @_isStillAlive:                           ; [$c0ba]
    JMP UI_DrawPlayerHP                     ; Draw player health.


;============================================================================
; Draw the player's health.
;
; INPUTS:
;     Player_HP_U:
;         The full value of the player's health.
;
; OUTPUTS:
;     None
;
; CALLS:
;     UI_DrawPlayerHPValue
;
; XREFS:
;     Player_ReduceHP
;     Player_UseHourGlass
;     UI_DrawHUD
;============================================================================
UI_DrawPlayerHP:                            ; [$c0bd]
    LDA a:Player_HP_U                       ; Load the player's current
                                            ; health.
    JMP UI_DrawPlayerHPValue                ; Draw it.


;============================================================================
; Decrement the MP for a spell.
;
; This will look at the selected magic type and deduct the
; cost from the player's total MP if there's enough to cast.
;
; INPUTS:
;     Player_MP:
;         The player's current MP.
;
;     SelectedMagic:
;         The selected magic.
;
;     MAGIC_COSTS:
;         The table of magic costs per spell.
;
; OUTPUTS:
;     C:
;         0 = Cost deducted for the spell.
;         1 = Not enough MP for the spell.
;
;     Player_MP:
;         The new MP amount.
;
; CALLS:
;     Player_SetMP
;
; XREFS:
;     Player_CastMagic
;============================================================================
Player_ReduceMP:                            ; [$c0c3]
    LDX a:SelectedMagic                     ; Load the selected magic spell.
    LDA a:Player_MP                         ; Load the player's total MP.
    SEC
    SBC MAGIC_COSTS,X                       ; Look up the cost of this spell.
    BCC @_notEnoughMP                       ; If there's not enough MP for
                                            ; the spell, then jump.


    ;
    ; The player has enough MP for the spell.
    ;
    STA a:Player_MP                         ; Else, store the reduced MP.
    JSR Player_SetMP                        ; Set that on the player and
                                            ; draw.
    CLC                                     ; Clear the carry flag to
                                            ; indicate a success.
    RTS


    ;
    ; The player does not have enough mana.
    ;
  @_notEnoughMP:                            ; [$c0d7]
    SEC                                     ; Set the carry flag to 1 to
                                            ; indicate not enough MP.
    RTS


;============================================================================
; Add points to the player's MP.
;
; This will be capped to 80 points.
;
; INPUTS:
;     A:
;         The MP to add.
;
;     Player_MP:
;         The player's current MP.
;
; OUTPUTS:
;     Player_MP:
;         The new MP.
;
; CALLS:
;     Player_SetMP
;
; XREFS:
;     Player_FillHPAndMP
;============================================================================
Player_AddMP:                               ; [$c0d9]
    ;
    ; Add the provided MP to the player's MP.
    ;
    CLC                                     ; Clear carry so it's not added.
    ADC a:Player_MP                         ; Add to the player's  MP.
    STA a:Player_MP                         ; Store it.
    CMP #$50                                ; Check if it's > 80 points.
    BCC @_drawMP                            ; If we're under the cap, return.


    ;
    ; Cap the MP to the total allowed amount.
    ;
    LDA #$50                                ; Cap to 80 points.


    ;
    ; Store it.
    ;
    STA a:Player_MP

  @_drawMP:                                 ; [$c0e9]
    JMP Player_SetMP                        ; Set the player's mana points
                                            ; and draw.


;============================================================================
; NOTE: This is used exclusively by the Unknown 29 sprite behavior.
;
; XREFS:
;     SpriteBehavior_Unknown_29_SomeSetup
;============================================================================
Player_Something_ChangeHP:                  ; [$c0ec]
    TXA
    PHA
    LDA #$00
    STA a:Temp1_SomethingChangedHP
    STA a:Temp2_SomethingChangedHP
    LDX #$10
    ROL a:Arg_PlayerHealthDelta_L
    ROL a:Arg_PlayerHealthDelta_U

  @LAB_PRG15_MIRROR__c0fe:                  ; [$c0fe]
    ROL a:Temp1_SomethingChangedHP
    ROL a:Temp2_SomethingChangedHP
    LDA a:Temp1_SomethingChangedHP
    CMP a:SpriteBehaviorUnknown20_SomethingXOrY
    LDA a:Temp2_SomethingChangedHP
    SBC a:BYTE_04bf
    BCC @LAB_PRG15_MIRROR__c124
    LDA a:Temp1_SomethingChangedHP
    SBC a:SpriteBehaviorUnknown20_SomethingXOrY
    STA a:Temp1_SomethingChangedHP
    LDA a:Temp2_SomethingChangedHP
    SBC a:BYTE_04bf
    STA a:Temp2_SomethingChangedHP

  @LAB_PRG15_MIRROR__c124:                  ; [$c124]
    ROL a:Arg_PlayerHealthDelta_L
    ROL a:Arg_PlayerHealthDelta_U
    DEX
    BNE @LAB_PRG15_MIRROR__c0fe
    PLA
    TAX
    RTS


;============================================================================
; Clear sprite state.
;
; This will clear out all the current sprites and the
; selected weapon, and reset the screen color mode.
;
; INPUTS:
;     PPU_Mask:
;         The current screen color mode.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;         The cleared sprite entities.
;
;     CurrentSprites_HP:
;         The cleared sprite HPs.
;
;     CurrentSprites_HitCounter:
;         The cleared sprite hit counters.
;
;     CurrentSprites_Behaviors:
;         The cleared sprite subtypes.
;
;     PPU_Mask:
;         The new color mode with greyscale removed.
;
;     IScript_PortraitID:
;         Set to 0xFF.
;
; CALLS:
;     CurrentSprite_ResetPPUTileOffset
;
; XREFS:
;     EndGame_Begin
;     Game_MainLoop
;     Player_HandleDeath
;     Screen_SetupSprites
;============================================================================
Screen_ClearSprites:                        ; [$c130]
    LDX #$07                                ; X = 7 (loop counter -- looping
                                            ; 8 times)

  @_clearSpritesLoop:                       ; [$c132]
    LDA #$ff
    STA CurrentSprites_Entities,X           ; Set sprite to 0xFF (cleared).
    LDA #$00
    STA CurrentSprites_HP,X                 ; Set sprite hit points to 0.
    STA CurrentSprites_HitCounter,X         ; Set sprite hit counter to 0.
    STA CurrentSprites_Behaviors,X          ; Set sprite subtype to 0.
    DEX                                     ; X--
    BPL @_clearSpritesLoop                  ; If we're not done, loop.


    ;
    ; We're out of the loop. Reset the PPU draw offset and restore
    ; screen state.
    ;
    JSR CurrentSprite_ResetPPUTileOffset    ; Reset the PPU offset.
    LDA #$ff
    STA a:IScript_PortraitID                ; Clear any portrait shown on
                                            ; screen.
    LDA PPU_Mask                            ; Load the current screen color
                                            ; mode.
    AND #$fe                                ; Set to color mode (clear bit 1)
    STA PPU_Mask                            ; Store the new color mode.
    RTS


;============================================================================
; Load extra information about the contents of the screen.
;
; This may include data such as sprite values, NPC IScript
; entrypoints, and special screen events (such as boss kill
; triggers).
;
; INPUTS:
;     Area_CurrentArea:
;         The area being loaded.
;
;     Area_CurrentScreen:
;         The screen being loaded within the area.
;
;     AREA_SPRITE_ADDRESSES:
;         The table of areas to screen lists.
;
; OUTPUTS:
;     Sprites_ReadInfoAddr:
;         The starting read address for the screen info.
;
;     CurrentScreen_SpecialEventID:
;         The screen's loaded special event ID (0xFF if
;         there is none).
;
;     Screen_ExtraInfoAddr:
;     Temp_Addr_L:
;         Used internally and clobbered.
;
; CALLS:
;     Screen_LoadSpecialEventID
;
; XREFS:
;     Screen_LoadSpriteInfo
;============================================================================
Screen_LoadAllScreenInfo:                   ; [$c154]
    ;
    ; Set the address of the sprites-for-screen lookup table
    ; for the area.
    ;
    LDA Area_CurrentArea                    ; A = Current area index.
    ASL A                                   ; Convert to a word offset for
                                            ; the lookup table.


    ;
    ; Set the starting address of the screen data.
    ;
    TAY                                     ; Y = A
    LDA AREA_SPRITE_ADDRESSES,Y             ; Load the upper byte of the
                                            ; address.
    STA Temp_Addr_L                         ; Store for reading.
    LDA AREA_SPRITE_ADDRESSES+1,Y           ; Load the lower byte of thea
                                            ; ddress.
    STA Temp_Addr_U                         ; Store it.


    ;
    ; Check the first byte of the address. If 0xFF,
    ; nothing will be loaded.
    ;
    LDY #$01                                ; Y = 1
    LDA (Temp_Addr_L),Y                     ; Load the address for the
                                            ; screens list.
    CMP #$ff                                ; Is it 0xFF?
    BEQ RETURN_C1B3                         ; If so, there's nothing to load.
                                            ; Return.


    ;
    ; Set the start address for a screen's sprite and metadata
    ; information.
    ;
    LDA Area_CurrentScreen                  ; A = Current screen index.
    ASL A                                   ; Convert to a word offset for
                                            ; the lookup table.
    TAY                                     ; Y = A


    ;
    ; Read the address for the screen information.
    ;
    LDA (Temp_Addr_L),Y                     ; Load the lower byte of the
                                            ; screen address.
    STA Sprites_ReadInfoAddr                ; Store it as the lower byte of
                                            ; the of the sprites read
                                            ; address.
    INY                                     ; Y++
    LDA (Temp_Addr_L),Y                     ; Load the upper byte.
    STA Sprites_ReadInfoAddr_U              ; And store it.


    ;
    ; Find the end of the sprites list for the screen.
    ;
    ; Sprites are in 2-byte pairs of (Entity ID, Sprite Value).
    ; This will skip those bytes until the end of the list is
    ; hit.
    ;
    LDY #$00                                ; Y = 0

  @_readLoop:                               ; [$c179]
    LDA (Sprites_ReadInfoAddr),Y            ; Load the next byte from the
                                            ; screen data.
    CMP #$ff                                ; Is it 0xFF?
    BNE @_prepareNextLoopIter               ; If not, jump to prepare for the
                                            ; next loop


    ;
    ; The sprite information is 0xFF, so we're done looping.
    ; Read the screen information.
    ;
    INY                                     ; Y++
    TYA                                     ; A = Y
    CLC
    ADC Sprites_ReadInfoAddr                ; Increment the read address by 2
                                            ; bytes.
    STA Screen_ExtraInfoAddr
    LDA Sprites_ReadInfoAddr_U              ; Load the upper byte.
    ADC #$00                                ; Add carry, if lower byte
                                            ; overflowed.
    STA Screen_ExtraInfoAddr_U              ; Store as the new upper byte.
    JMP Screen_LoadSpecialEventID           ; Read the extra screen
                                            ; information.


    ;
    ; Increment by 2 (the sprite entity and value).
    ;
  @_prepareNextLoopIter:                    ; [$c18f]
    INY                                     ; Y++
    INY                                     ; Y++
    BNE @_readLoop                          ; If Y > 0, loop.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Clear the special event ID for the current screen.
;
; This disables any custom logic specific to certain screens.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     CurrentScreen_SpecialEventID:
;         Set to 0xFF (unset).
;
; XREFS:
;     Screen_LoadSpecialEventID
;============================================================================
Screen_SetNoSpecialEventID:                 ; [$c193]
    ;
    ; No special event information was found for the screen.
    ; Clear that state (set to 0xFF).
    ;
    LDA #$ff
    STA a:CurrentScreen_SpecialEventID      ; Clear the special event ID
                                            ; (0xFF).
    RTS


;============================================================================
; Load extra information about the current screen.
;
; Screens may contain a special event ID, which adds custom
; logic to perform on each tick on a screen. This is used
; for three things:
;
; 1. Managing the pushable block status on the path to
;    Mascon.
; 2. Boss battle logic.
; 3. Final boss logic.
;
; INPUTS:
;     Screen_ExtraInfoAddr:
;     Screen_ExtraInfoAddr+1:
;         The address containing the extra screen
;         information.
;
; OUTPUTS:
;     CurrentScreen_SpecialEventID:
;         The special event ID loaded from the screen info,
;         or 0xFF (unset) if not found.
;
; XREFS:
;     Screen_LoadAllScreenInfo
;============================================================================
Screen_LoadSpecialEventID:                  ; [$c199]
    ;
    ; Begin scanning for a 0xFF in the screen information. This
    ; will indicate the start of extra information for the screen
    ; (special screen event states, IScripts entrypoint references).
    ;
    LDY #$00                                ; Y = 0 (loop counter)

  @_scanLoop:                               ; [$c19b]
    LDA (Screen_ExtraInfoAddr),Y            ; Load the next byte in the
                                            ; screen info data.
    CMP #$ff                                ; Is it 0xFF?
    BNE @_noFFMarker                        ; If so, we found the start of
                                            ; the extra data to load. Jump.


    ;
    ; We found the start of the extra info for the screen. We're
    ; looking for 0x80, which indicates special event code will
    ; run on this screen every tick. The type of event will be
    ; indicated in the following byte.
    ;
    ; An example of this would be running code when a boss is
    ; defeated, producing an item.
    ;
    INY                                     ; Y++
    LDA (Screen_ExtraInfoAddr),Y            ; Load the next byte to see what
                                            ; we're working with.
    CMP #$80                                ; Is it 0x80?
    BNE Screen_SetNoSpecialEventID          ; If not, then we won't be
                                            ; running special event code on
                                            ; this screen.


    ;
    ; This screen runs special event code. Load it.
    ;
    INY                                     ; Y++
    LDA (Screen_ExtraInfoAddr),Y            ; Load the next byte containing
                                            ; the special event ID.
    STA a:CurrentScreen_SpecialEventID      ; Store it while on the screen.
    RTS

  @_noFFMarker:                             ; [$c1af]
    INY                                     ; Y++


    ;
    ; If we hit 256 loops, we're done.
    ;
    BNE @_scanLoop                          ; If we haven't wrapped, then
                                            ; loop.
    RTS                                     ; Else, we're done.

    ;
    ; XREFS:
    ;     Screen_LoadAllScreenInfo
    ;
RETURN_C1B3:                                ; [$c1b3]
    RTS


;============================================================================
; Load information on a sprite from the screens list.
;
; This will read the next sprite entity ID in the screen
; information, followed by the block X/Y position where
; the sprite should be placed.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
;     Sprites_ReadInfoAddr:
;     Sprites_ReadInfoAddr+1:
;         The address in the screens table to read from.
;
; OUTPUTS:
;     CurrentSprite_Entity:
;         The loaded sprite entity ID.
;
;     CurrentSprite_XPos:
;         The loaded block X position of the sprite.
;
;     CurrentSprite_YPos:
;         The loaded block Y position of the sprite.
;
;     Sprites_ReadInfoAddr:
;     Sprites_ReadInfoAddr+1:
;         The updated address in the screens table to read
;         from.
;
; CALLS:
;     Screen_LoadAllScreenInfo
;     Sprites_PopulateNextAvailableSprite
;     MMC1_UpdateROMBank
;     MMC1_UpdatePRGBankToStackA
;
; XREFS:
;     Game_MainLoop
;     Screen_SetupSprites
;============================================================================
Screen_LoadSpriteInfo:                      ; [$c1b4]
    ;
    ; Switch to ROM bank 11, where sprite information lives.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b
    JSR MMC1_UpdateROMBank                  ; Switch to bank 11.


    ;
    ; Load all the sprites for this screen.
    ;
    JSR Screen_LoadAllScreenInfo            ; Load the sprite information for
                                            ; the screen.


    ;
    ; Switch bank to our previous bank.
    ;
    PLA                                     ; Pop A (our saved bank).
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; And switch back to it.


    ;
    ; Begin our loop for reading all sprites for the screen.
    ;
  @_readSpriteLoop:                         ; [$c1c5]
    LDY #$00                                ; Y =  0 (info read offset)


    ;
    ; Switch back to ROM bank 11 (sprite info).
    ;
    LDA a:CurrentROMBank                    ; A = current ROM bank
    PHA                                     ; Push to the stack.
    LDX #$0b
    JSR MMC1_UpdateROMBank                  ; Switch to bank 11.


    ;
    ; Read information on the next sprite on the screen.
    ;
    LDA (Sprites_ReadInfoAddr),Y            ; Read the current byte of the
                                            ; screen information.
    CMP #$ff                                ; Is it 0xFF (our end-of-sprites
                                            ; list)?
    BEQ @_restoreBankAndReturn              ; If it is, we're done. Restore
                                            ; our bank and return.


    ;
    ; Store the sprite's entity ID.
    ;
    STA a:CurrentSprite_Entity              ; Store this byte as the sprite
                                            ; entity ID.


    ;
    ; Load the sprite's Y block position.
    ;
    ; This will be the upper nibble of the byte following the
    ; sprite entity ID.
    ;
    INY                                     ; Y++
    LDA (Sprites_ReadInfoAddr),Y            ; Load the next byte.
    AND #$f0                                ; Take only the upper nibble.
    STA a:CurrentSprite_YPos                ; Store it as the sprite's
                                            ; starting Y position.


    ;
    ; Load the sprite's X block position.
    ;
    ; This will be the lower nibble, which will then be placed
    ; in the upper nibble.
    ;
    LDA (Sprites_ReadInfoAddr),Y            ; Load the same byte.
    ASL A                                   ; Shift the X coordinate from the
                                            ; lower nibble to the upper
                                            ; nibble.
    ASL A
    ASL A
    ASL A
    STA a:CurrentSprite_XPos                ; Store as the sprite's X
                                            ; position.


    ;
    ; Restore our bank.
    ;
    PLA                                     ; Pull A (the saved bank) from
                                            ; the stack.
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; And switch back to it.


    ;
    ; Finish processing this sprite. We'll add to the next
    ; available slot and fill in any information needed based
    ; on what we loaded.
    ;
    JSR Sprites_PopulateNextAvailableSprite ; Add this sprite to the next
                                            ; available slot.


    ;
    ; Increment the read address for the next sprite in the
    ; screen data.
    ;
    LDA Sprites_ReadInfoAddr                ; A = lower byte of the screen
                                            ; information address
    CLC
    ADC #$02                                ; Increment by 2 (sprite entity
                                            ; ID and position).
    STA Sprites_ReadInfoAddr                ; Store as the new lower byte of
                                            ; the address.
    LDA Sprites_ReadInfoAddr_U              ; A = upper byte of the screen
                                            ; information address
    ADC #$00                                ; Add carry if the lower byte
                                            ; overflowed.
    STA Sprites_ReadInfoAddr_U              ; Store it as the new upper byte
                                            ; of the address.
    JMP @_readSpriteLoop                    ; Loop to read the next sprite.

  @_restoreBankAndReturn:                   ; [$c202]
    JMP MMC1_UpdatePRGBankToStackA


;============================================================================
; Populate the loaded sprite in the next available slot.
;
; This will set the default state of the sprite, the
; sprite's HP, hitbox type, subtype, and behavior
; addresses.
;
; If the sprite can't fit on the screen, it will not be
; loaded.
;
; INPUTS:
;     CurrentSprite_Entity:
;         The loaded sprite entity ID.
;
;     CurrentSprite_XPos:
;         The loaded block X position.
;
;     CurrentSprite_YPos:
;         The loaded block Y position.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;         The updated sprite entities.
;
;     CurrentSprites_Flags:
;         The updated sprite flags.
;
;     CurrentSprites_Phases:
;         The updated sprite phases.
;
;     CurrentSprites_HitByMagicBehavior:
;         The updated behaviors when hit by magic.
;
;     CurrentSprites_XPos_Full:
;         The updated sprite X positions.
;
;     CurrentSprites_YPos:
;         The updated sprite Y positions.
;
;     CurrentSprites_HitBoxTypes:
;         The updated sprite hit box types.
;
;     CurrentSprites_HP:
;         The updated sprite HPs.
;
;     CurrentSprites_BehaviorAddrs_L:
;         The updated sprite behavior address lower bytes.
;
;     CurrentSprites_BehaviorAddrs_U:
;         The updated sprite behavior address upper bytes.
;
;     CurrentSprites_Behaviors:
;         The updated sprite subtypes.
;
; CALLS:
;     Sprites_LoadSpriteValue
;
; XREFS:
;     Screen_LoadSpriteInfo
;============================================================================
Sprites_PopulateNextAvailableSprite:        ; [$c205]
    ;
    ; Prepare the sprite loop.
    ;
    LDX #$07                                ; 7 = loop counter

  @_loop:                                   ; [$c207]
    STX a:CurrentSpriteIndex                ; Set it
    LDA CurrentSprites_Entities,X           ; Load the sprite entity at this
                                            ; index.
    CMP #$ff                                ; Is it 0xFF (unset)?
    BNE @_prepareNextIter                   ; If not, jump to prepare for
                                            ; next loop.


    ;
    ; This sprite index is unset. Populate it.
    ;
    LDA #$00                                ; 0 = unset
    STA CurrentSprites_Phases,X             ; Clear the sprite phase.
    STA CurrentSprites_Flags,X              ; Clear the sprite flags.
    LDA #$ff                                ; 0xFF = unset
    STA CurrentSprites_HitByMagicBehavior,X ; Clear the hit by magic
                                            ; behavior.


    ;
    ; Set the sprite's starting X/Y position.
    ;
    LDA a:CurrentSprite_XPos                ; Load the current sprite X
                                            ; position to set.
    STA CurrentSprites_XPos_Full,X          ; Set for the sprite index.
    LDA a:CurrentSprite_YPos                ; Load the Y position.
    STA CurrentSprites_YPos,X               ; Set for the sprite index.
    LDA a:CurrentSprite_Entity              ; Load the sprite entity.
    STA CurrentSprites_Entities,X           ; Set it.
    TAY                                     ; Y = A (entity)
    LDA SPRITE_ENTITIES_HITBOX_TYPES,Y      ; Load the hitbox type for the
                                            ; entity.
    STA CurrentSprites_HitBoxTypes,X        ; Set it.
    LDA SPRITE_ENTITIES_HP,Y                ; Load the HP for the entity.
    STA CurrentSprites_HP,X                 ; Set it.


    ;
    ; Prepare the behavior scripts for the entity.
    ;
    TYA                                     ; A = Y (entity)
    ASL A                                   ; Convert to a word boundary.
    TAY                                     ; Y = A
    LDA SPRITE_BSCRIPTS,Y                   ; Load the lower byte of the
                                            ; behavior script for the entity.
    STA CurrentSprites_BehaviorAddrs_L,X    ; Set the lower byte of the
                                            ; address.
    LDA SPRITE_BSCRIPTS+1,Y                 ; Load the upper byte.
    STA CurrentSprites_BehaviorAddrs_U,X    ; Set the upper byte.
    LDA #$ff                                ; A = 0xFF (unset)
    STA CurrentSprites_Behaviors,X          ; Clear the current behavior
                                            ; state.
    JMP Sprites_LoadSpriteValue             ; Load the value for the sprite
                                            ; and return.

  @_prepareNextIter:                        ; [$c252]
    LDX a:CurrentSpriteIndex                ; X = current sprite index.
    DEX                                     ; X--
    BPL @_loop                              ; If >= 0, loop.
    RTS


;============================================================================
; Banks storing the images for a range of sprites.
;
; XREFS:
;     Sprites_StoreBankForCurrentSprite
;============================================================================

;
; XREFS:
;     Sprites_StoreBankForCurrentSprite
;
SPRITE_IMAGE_BANKS:                         ; [$c259]
    .byte $06                               ; [0]: Bank for sprites 0-54

;
; XREFS:
;     Sprites_StoreBankForCurrentSprite
;
SPRITE_IMAGE_BANKS_1_:                      ; [$c25a]
    .byte $07                               ; [1]: Bank for sprites 55-100


;============================================================================
; Load the value for a sprite from the screen's sprite info table.
;
; This loads the value information associated with a sprite
; on the screen. This may represent a message ID or some
; other value, depending on the sprite and situation.
;
; INPUTS:
;     X:
;         The sprite index to load the value for,
;
;     CurrentROMBank:
;         The currently-loaded ROM bank.
;
;     Screen_ExtraInfoAddr:
;     Screen_ExtraInfoAddr+1:
;         The current address for the extra sprite values
;         on the screen.
;
; OUTPUTS:
;     CurrentSprites_Values:
;         The updated sprite values.
;
;     Screen_ExtraInfoAddr:
;     Screen_ExtraInfoAddr+1:
;         The incremented address for the extra sprite
;         values on the screen.
;
; CALLS:
;     MMC1_UpdateROMBank
;     MMC1_UpdatePRGBankToStackA
;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;============================================================================
Sprites_LoadSpriteValue:                    ; [$c25b]
    TXA                                     ; A = X (sprite index)
    TAY                                     ; Y = A


    ;
    ; Save the current ROM bank and switch to bank 11.
    ;
    LDA a:CurrentROMBank                    ; Get the current ROM bank.
    PHA                                     ; Push to the stack.
    LDX #$0b                                ; X = 11 (bank)
    JSR MMC1_UpdateROMBank                  ; Switch to bank 11.


    ;
    ; Restore our sprite index to X so it's not clobbered
    ; when this returns.
    ;
    TYA                                     ; A = Y
    TAX                                     ; X = A


    ;
    ; Load the extra information for this sprite and store it
    ; in the sprite list.
    ;
    LDY #$00                                ; Y = 0
    LDA (Screen_ExtraInfoAddr),Y            ; A = Extra information for the
                                            ; sprite.
    STA CurrentSprites_Values,X             ; Store in
                                            ; CurrentSprites_Values.
    CMP #$ff                                ; Is it 0xFF (unset)?
    BEQ @_restoreBankAndReturn              ; If so, we're done. Jump.


    ;
    ; Increment the position in the info data.
    ;
    INC Screen_ExtraInfoAddr                ; Increment the lower byte of the
                                            ; offset in the extra info data.
    BNE @_restoreBankAndReturn              ; If this didn't wrap to 0, we're
                                            ; done. Jump.
    INC Screen_ExtraInfoAddr_U              ; Else, increment the upper byte
                                            ; as well.

  @_restoreBankAndReturn:                   ; [$c279]
    JMP MMC1_UpdatePRGBankToStackA          ; Restore the bank saved to the
                                            ; stack.


;============================================================================
; Determine and store the bank for images for the current sprite.
;
; This will determine which bank would store images for the
; currently-processed sprite.
;
; If the sprite entity ID is 0-54, this will be bank 6.
;
; If the sprite entity ID is 55-100, this will be bank 7.
;
; INPUTS:
;     CurrentSprite_Entity:
;         The entity ID for the currently-processed sprite.
;
;     SPRITE_IMAGE_BANKS:
;         The lookup table for sprite entity IDs to banks.
;
; OUTPUTS:
;     CurrentSprite_TilesBank:
;         The bank for the images for this sprite.
;
; XREFS:
;     GameLoop_LoadSpriteImages
;============================================================================
Sprites_StoreBankForCurrentSprite:          ; [$c27c]
    LDY #$00                                ; Y = 0
    LDA a:CurrentSprite_Entity              ; A = current sprite entity
    CMP #$37                                ; Is it < sprite 55 (Unused Child
                                            ; sprite)?
    BCC @_loadBank                          ; If yes, then load bank from
                                            ; table at index 0.
    INY                                     ; Else, load bank from table at
                                            ; index 1.


    ;
    ; Load the image for the bank.
    ;
  @_loadBank:                               ; [$c286]
    LDA SPRITE_IMAGE_BANKS,Y                ; Load the address for the sprite
                                            ; entity.
    STA a:CurrentSprite_TilesBank           ; Store as the bank for this
                                            ; sprite.

  @_return:                                 ; [$c28c]
    RTS


;============================================================================
; Load images for all sprites on the scren.
;
; This will loop through each sprite and load the images,
; drawing them in the PPU buffer.
;
; If any sprites become off-screen (vertically), they'll be
; removed.
;
; As a special case, if the sprite is the boss Pakukame, a
; Lilith will be spawned.
;
; INPUTS:
;     CurrentSpriteIndex:
;         The current sprite index at the start of this
;         call.
;
;     CurrentSprites_Entities:
;         The list of sprite entities for all sprites on
;         screen.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;         Updated if sprites are removed or added.
;
;     CurrentSprites_PPUOffsets:
;         PPU tile offsets for sprite data.
;
;     CurrentSprite_Entity:
;         Clobbered.
;
; CALLS:
;     CurrentSprite_ResetPPUTileOffset
;     PPUBuffer_WaitUntilClear
;     Sprites_LoadImageForCurrentSprite
;     Sprites_StoreBankForCurrentSprite
;
; XREFS:
;     Game_MainLoop
;     Game_SetupAndLoadOutsideArea
;     Game_SetupEnterBuilding
;     Game_SetupEnterScreen
;     Game_SetupExitBuilding
;     Game_SetupNewArea
;     Game_Start
;     IScripts_ClearPortraitImage
;============================================================================
GameLoop_LoadSpriteImages:                  ; [$c28d]
    ;
    ; Save state and prepare for image loading.
    ;
    LDA a:CurrentSpriteIndex                ; A = current sprite index
    PHA                                     ; Push it to the stack.
    JSR CurrentSprite_ResetPPUTileOffset    ; Reset the PPU drawing
                                            ; coordinates.


    ;
    ; Begin our loop for all 7 sprite slots.
    ;
    LDX #$07                                ; X = 7 (sprite index counter)


    ;
    ; Set this as the currently-processed sprite, and update
    ; the entity.
    ;
    ; We'll only process if the entity is not unset.
    ;
  @_loop:                                   ; [$c296]
    STX a:CurrentSpriteIndex                ; Store it as the
                                            ; currently-processed sprite
                                            ; index.
    LDA CurrentSprites_Entities,X           ; Load the associated sprite
                                            ; entity ID.
    CMP #$ff                                ; Is it 0xFF (unset)?
    BEQ @_nextLoop                          ; If so, jump and prepare for the
                                            ; next loop.
    STA a:CurrentSprite_Entity              ; Store this as the entity at
                                            ; this index.


    ;
    ; Load the image for this sprite.
    ;
    JSR Sprites_StoreBankForCurrentSprite   ; Store the image bank for the
                                            ; current sprite.
    JSR Sprites_LoadImageForCurrentSprite   ; Load the sprite's image from
                                            ; the bank.


    ;
    ; Special-case the Pakukame boss. If that was placed, then
    ; replace it with a Lilith instead. They spawn Liliths.
    ;
    LDA a:CurrentSprite_Entity              ; Load the current entity.
    CMP #$30                                ; Is it the Pakukame boss?
    BNE @_loadSpriteInfo                    ; If not, jump.


    ;
    ; This is the Pakukame. Swap in a Lilith and load the image.
    ;
    ; This will then restore the entity back to Pakukame.
    ; Effectively, each Lilith on screen seems to be backed by
    ; a Pakukame.
    ;
    LDA a:CurrentSprite_Entity              ; Load the Pakukame entity ID
    PHA                                     ; Push to the stack.
    LDA CurrentSprite_StartPPUTileOffset    ; Load the sprite's starting PPU
                                            ; tile offset.
    PHA                                     ; Push it to the stack.
    LDA #$09                                ; A = 9 (Lilith)
    STA a:CurrentSprite_Entity              ; Store as the new entity.
    JSR Sprites_StoreBankForCurrentSprite   ; Store the bank for Lilith.
    JSR Sprites_LoadImageForCurrentSprite   ; Load Lilth's image from the
                                            ; bank.
    PLA                                     ; Pop the PPU offset row.
    STA CurrentSprite_StartPPUTileOffset    ; Store it again.
    PLA                                     ; Pop the current sprite entity.
    STA a:CurrentSprite_Entity              ; Store it again.


    ;
    ; Store the starting PPU tile offset for the sprite.
    ;
    ; This will be stored in this sprite's slot in the current
    ; sprites information.
    ;
  @_loadSpriteInfo:                         ; [$c2c9]
    LDX a:CurrentSpriteIndex                ; X = current sprite index
    LDA CurrentSprite_StartPPUTileOffset    ; A = Start PPU tile offset
    STA CurrentSprites_PPUOffsets,X         ; Set this in the PPU tile
                                            ; offsets for this sprite.


    ;
    ; Check if the sprite is on-screen or off-screen.
    ;
    ; If the Y position is off the screen (row 30 or higher),
    ; then the sprite will be unset.
    ;
    LDA CurrentSprites_YPos,X               ; Load the Y position for this
                                            ; sprite.
    CMP #$f0                                ; Is it less than 0xF0?
    BCC @_nextLoop                          ; If so, loop.


    ;
    ; It's off-screen. Unset it.
    ;
    LDA #$ff                                ; Else, it's off the screen.
    STA CurrentSprites_Entities,X           ; Unset the entity.


    ;
    ; Done with any loading required for the sprite. Prepare for
    ; the next loop, if needed.
    ;
  @_nextLoop:                               ; [$c2dc]
    LDX a:CurrentSpriteIndex                ; X = current sprite index (loop
                                            ; counter).
    DEX                                     ; X--
    BPL @_loop                              ; If X >= 0, loop.


    ;
    ; We're done. Restore the original current sprite index and
    ; wait until everything's drawn to the screen.
    ;
    PLA                                     ; Pull A (current sprite index)
                                            ; from the stack.
    STA a:CurrentSpriteIndex                ; Store that back as the current
                                            ; sprite index.
    JMP PPUBuffer_WaitUntilClear            ; Wait until everything's drawn
                                            ; to the screen.


;============================================================================
; Update a magic spell and run a magic-dependent handler.
;
; This is called for every tick of a magic spell. It's put
; on the stack by CastMagic_RunSpellHandler.
;
; This will update the visibility of the magic, set
; X/Y positions factoring in the screen scroll, and
; then set some state that ultimately is not used by
; the production build of Faxanadu.
;
; It will then call a magic-dependent update handler.
;
; INPUTS:
;     CastMagic_Type:
;         The magic type that was cast.
;
;     CastMagic_XPos_Full:
;         The X position of the magic.
;
;     CastMagic_YPos_Full:
;         The Y position of the magic.
;
;     Screen_Maybe_ScrollXCounter:
;     Player_Something_ScrollPosY:
;         Referenced but ultimately unused.
;
; OUTPUTS:
;     Arg_DrawSprite_PosX:
;     Arg_DrawSprite_PosY:
;         X and Y coordinates for the magic, used
;         for appearance management.
;
;     Unused_Sprite_ScrollPosX:
;     Unused_Sprite_ScrollPosY:
;         Set but unused.
;
; CALLS:
;     CastMagic_CalculateVisibility
;============================================================================
CastMagic_RunUpdateSpellHandler:            ; [$c2e9]
    ;
    ; These two lines are deadcode. It might be the developers
    ; attempting to hard-code Deluge and Thunder during testing?
    ; Each gets overriden immediately.
    ;
    LDA #$00                                ; A = 0 (deadcode)
    LDA #$01                                ; A = 1 (deadcode)
    LDA a:CastMagic_Type                    ; A = Cast magic type


    ;
    ; If 0xFF, return.
    ;
    BMI @_return


    ;
    ; This was an active, cast magic spell. Set state.
    ;
    JSR CastMagic_CalculateVisibility       ; Calculate visibility for the
                                            ; magic spell based on foreground
                                            ; elements.


    ;
    ; Manage the X position of the spell.
    ;
    LDA a:CastMagic_XPos_Full               ; Load the magic's X position.
    STA Arg_DrawSprite_PosX                 ; Set as an argument for future
                                            ; appearance updates.


    ;
    ; Set some unused state not used in the finished game.
    ;
    LDA Screen_Maybe_ScrollXCounter
    STA Unused_Sprite_ScrollPosX


    ;
    ; Manage the Y position of the spell.
    ;
    LDA a:CastMagic_YPos_Full
    STA Arg_DrawSprite_PosY                 ; Set as an argument for future
                                            ; appearance updates.


    ;
    ; Set more unused state not used in the finished game.
    ;
    LDA Player_Something_ScrollPosY
    STA Unused_Sprite_ScrollPosY


    ;
    ; Set the finish handler for this type as the next function
    ; to run.
    ;
    LDA a:CastMagic_Type                    ; Load the magic type.
    ASL A                                   ; Convert to a word boundary for
                                            ; the lookup table.
    TAY                                     ; Y = A
    LDA BYTE_bb28,Y                         ; Load the lower byte of the
                                            ; finish handler.
    PHA                                     ; Push to the stack.
    LDA BYTE_bb27,Y                         ; Load the upper byte.
    PHA                                     ; Push.

  @_return:                                 ; [$c314]
    RTS                                     ; Return and then call the
                                            ; function.


;============================================================================
; Calculate the visibility of the cast magic.
;
; This will check the cast magic against any foreground
; blocks, checking if it's fully visible, partially
; obscured, or fully obscured.
;
; INPUTS:
;     CastMagic_XPos_Full:
;         The X pixel position of the magic.
;
;     CastMagic_YPos_Full:
;         The Y pixel position of the magic.
;
; OUTPUTS:
;     Temp_MovingSpriteVisibility:
;         The visibility state of the cast magic.
;
;     MovingSpriteVisibility:
;         The visibility state of the cast magic.
;
;     Arg_PixelPosX:
;     Arg_PixelPosX:
;         Clobbered.
;
; CALLS:
;     Area_ConvertPixelsToBlockPos
;     ScreenBuffer_LoadBlockProperty
;
; XREFS:
;     CastMagic_RunUpdateSpellHandler
;============================================================================
CastMagic_CalculateVisibility:              ; [$c315]
    ;
    ; Set the default to visible.
    ;
    LDA #$00
    STA Temp_MovingSpriteVisibility         ; Set the default visibility to
                                            ; visible.


    ;
    ; Convert the cast magic's position to block positions.
    ;
    LDA a:CastMagic_YPos_Full               ; Load the magic's Y position.
    STA Arg_PixelPosY                       ; Set it as an argument for
                                            ; getting the block property.
    LDA a:CastMagic_XPos_Full               ; Load the magic's X position.
    CLC
    ADC #$04                                ; Add 4 to that to better check
                                            ; block alignment.
    STA Arg_PixelPosX                       ; Set it as an argument.
    JSR Area_ConvertPixelsToBlockPos        ; Convert to a block position.
    JSR ScreenBuffer_LoadBlockProperty      ; Get the block property for this
                                            ; position.


    ;
    ; Check if a block overlaps the left.
    ;
    CMP #$04                                ; Is this block type 4?
    BEQ @_leftIsObscured                    ; If so, the left is obscured.
    CMP #$0d                                ; Else, is this block type 13?
    BEQ @_leftIsObscured                    ; If so, the left is obscured.
    CMP #$09                                ; Else, is this block type 9?
    BNE @_checkRightObscured                ; If not, the left is not
                                            ; obscured. Start checking the
                                            ; right.


    ;
    ; This is a foreground layer block. The trailing part
    ; is obscured.
    ;
  @_leftIsObscured:                         ; [$c338]
    LDA Temp_MovingSpriteVisibility         ; Load the cast magic's
                                            ; visibility state.
    ORA #$01                                ; Mark the left-hand side as
                                            ; obscured.
    STA Temp_MovingSpriteVisibility         ; Store it.


    ;
    ; Now check the right-hand side of the magic.
    ;
  @_checkRightObscured:                     ; [$c33e]
    LDA Arg_PixelPosX                       ; Load the pixel X position.
    CLC
    ADC #$08                                ; Add 8 to it, to better check
                                            ; the right side.
    STA Arg_PixelPosX                       ; Store as the new pixel
                                            ; argument.
    JSR Area_ConvertPixelsToBlockPos        ; Convert to a block position.
    JSR ScreenBuffer_LoadBlockProperty      ; Load the block property.


    ;
    ; Check if a block overlaps the right.
    ;
    CMP #$04                                ; Is this block 4?
    BNE @_checkNeedToFlipBits               ; If not, it's not obscured.
    CMP #$04                                ; Again, is this block 4?
    BEQ @_rightIsObscured                   ; If so, the right is obscured.
    CMP #$0d                                ; Else, is this block 13?
    BEQ @_rightIsObscured                   ; If so, the right is obscured.
    CMP #$09                                ; Else, is this block 9?
    BNE @_checkNeedToFlipBits               ; If not, it's not obscured. Move
                                            ; to the next step.


    ;
    ; The trailing side of the magic is obscured.
    ;
  @_rightIsObscured:                        ; [$c35b]
    LDA Temp_MovingSpriteVisibility         ; Load the cast magic's
                                            ; visibility state.
    ORA #$02                                ; Mark the right-hand side as
                                            ; obscured.
    STA Temp_MovingSpriteVisibility         ; Store it.


    ;
    ; Check if the magic is partially-obscured (just left or
    ; right). If so, make sure the flips are flipped for the
    ; facing direction.
    ;
  @_checkNeedToFlipBits:                    ; [$c361]
    LDX a:CurrentSpriteIndex                ; X = current sprite index.
    LDA a:CastMagic_Flags                   ; A = cast magic flags.
    AND #$40                                ; Is it facing right?
    BEQ @_facingRight                       ; If so, there's nothing to do.
                                            ; We're done.
    LDA Temp_MovingSpriteVisibility         ; A = cast magic visibility
    BEQ @_storeVisibility                   ; If the block is fully visible,
                                            ; jump.
    CMP #$03                                ; Else, is it full obscured?
    BEQ @_storeVisibility                   ; If yes, jump.


    ;
    ; Swap the bits to face the other direction.
    ;
    EOR #$03                                ; Swap the visibility of leading
                                            ; and trailing flags.
    JMP @_storeVisibility                   ; Jump to store.

  @_facingRight:                            ; [$c378]
    LDA Temp_MovingSpriteVisibility         ; Load the previously-calculated
                                            ; visibility from above.

  @_storeVisibility:                        ; [$c37a]
    STA MovingSpriteVisibility              ; Store the new visibility state.
    RTS


;============================================================================
; Set the appearance of the magic sprite.
;
; This will take in an offset into the magic's list of
; frames and set that as the new appearance.
;
; INPUTS:
;     A:
;         The offset into the list of frames.
;
;     CastMagic_Type:
;         The type of cast magic.
;
;     SPRITE_MAGIC_IMAGE_ADDRS_U:
;         The lookup table of upper addresses of magic
;         sprite images.
;
; CALLS:
;     Sprite_SetAppearanceAddrFromOffset
;
; XREFS:
;     CastMagic_FinishHandler_Death
;     CastMagic_FinishHandler_Deluge
;     CastMagic_FinishHandler_DelugeOrDeathAfterHit
;     CastMagic_FinishHandler_Fire
;     CastMagic_FinishHandler_HitWallEffect
;     CastMagic_FinishHandler_Thunder
;     CastMagic_FinishHandler_Tilte
;     CastMagic_FinishHandler_TilteAfterFirstHit
;============================================================================
CastMagic_SetAppearance:                    ; [$c37d]
    LDY a:CastMagic_Type                    ; Y = cast magic type
    CLC
    ADC SPRITE_MAGIC_IMAGE_ADDRS_U,Y        ; Add the value from the lookup
                                            ; table.
    JMP Sprite_SetAppearanceAddrFromOffset  ; Set the sprite appearance.


;============================================================================
; Table of upper address bytes for magic sprite images.
;
; XREFS:
;     CastMagic_SetAppearance
;============================================================================

;
; XREFS:
;     CastMagic_SetAppearance
;
SPRITE_MAGIC_IMAGE_ADDRS_U:                 ; [$c387]
    .byte $95                               ; [0]: Deluge
    .byte $99                               ; [1]: Thunder
    .byte $9b                               ; [2]: Fire
    .byte $9d                               ; [3]: Death
    .byte $a1                               ; [4]: Tilte
    .byte $a5                               ; [5]: UNUSED: Deluge after first
                                            ; hit
    .byte $99                               ; [6]: Thunder after first hit
    .byte $9b                               ; [7]: Fire after first hit
    .byte $a5                               ; [8]: UNUSED: Death after first
                                            ; hit
    .byte $a5                               ; [9]: UNUSED
    .byte $a5                               ; [10]: UNUSED: Hit wall effect
    .byte $a5                               ; [11]: Tilte after first hit


;============================================================================
; Set whether a cast magic's sprite is flipped based on the cast direction.
;
; INPUTS:
;     CastMagic_Flags:
;         The cast magic's flags.
;
; OUTPUTS:
;     CurrentSprite_FlipMask:
;         The sprite's flip state.
;
; XREFS:
;     CastMagic_FinishHandler_Death
;     CastMagic_FinishHandler_Deluge
;     CastMagic_FinishHandler_DelugeOrDeathAfterHit
;     CastMagic_FinishHandler_Fire
;     CastMagic_FinishHandler_Thunder
;     CastMagic_FinishHandler_Tilte
;============================================================================
CastMagic_UpdateSpriteDirection:            ; [$c393]
    LDA a:CastMagic_Flags                   ; Load the cast magic's flags.
    AND #$40                                ; Take only the facing direction
                                            ; bit.
    STA CurrentSprite_FlipMask              ; Set as the sprite's flip mask.
    RTS


;============================================================================
; Finish updating the Deluge spell.
;
; This will maintain the sprite's direction and update
; the appearance.
;
; INPUTS:
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     CastMagic_UpdateSpriteDirection
;     CastMagic_SetAppearance
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb27]
;============================================================================
CastMagic_FinishHandler_Deluge:             ; [$c39b]
    JSR CastMagic_UpdateSpriteDirection     ; Set the sprite's direction.
    LDA InterruptCounter                    ; Load the interrupt counter.
    LSR A                                   ; Shift the interrupt counter to
                                            ; generate an appearance index.
    LSR A
    AND #$03                                ; Keep the 2 right-most bits
                                            ; (effectively, bits 3 and 4 of
                                            ; the interrupt counter).
    JMP CastMagic_SetAppearance             ; Set that as the appearance
                                            ; index.


;============================================================================
; Finish updating the Thunder spell.
;
; This will maintain the sprite's direction and update
; the appearance.
;
; It will update the appearance for 2 frames at a time,
; and wait 2 frames in-between.
;
; INPUTS:
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     CastMagic_UpdateSpriteDirection
;     CastMagic_SetAppearance
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb29]
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb33]
;============================================================================
CastMagic_FinishHandler_Thunder:            ; [$c3a7]
    JSR CastMagic_UpdateSpriteDirection     ; Set the sprite's direction.
    LDA InterruptCounter                    ; Load the interrupt counter.
    LSR A                                   ; Shift the interrupt counter to
                                            ; generate a value to check
                                            ; against.
    LSR A
    BCS @_return                            ; If this should not update the
                                            ; appearance, return.
    AND #$01                                ; Keep the right-most bit
                                            ; (effectively, bit 2 of the
                                            ; interrupt counter).
    JMP CastMagic_SetAppearance             ; Set that as the appearance
                                            ; index.

  @_return:                                 ; [$c3b5]
    RTS


;============================================================================
; Finish updating the Fire spell.
;
; This will maintain the sprite's direction and update
; the appearance.
;
; It will run for 2 frames, skip 2 frames, run for 2 frames,
; etc.
;
; INPUTS:
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     CastMagic_UpdateSpriteDirection
;     CastMagic_SetAppearance
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb2b]
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb35]
;============================================================================
CastMagic_FinishHandler_Fire:               ; [$c3b6]
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$02                                ; Is bit 1 set?
    BNE @_updateFire                        ; If so, jump to update.
    RTS

  @_updateFire:                             ; [$c3bd]
    JSR CastMagic_UpdateSpriteDirection     ; Set the sprite's direction.
    LDA InterruptCounter                    ; Load the interrupt counter.
    LSR A                                   ; Shift the interrupt counter to
                                            ; generate an appearance index.
    LSR A
    AND #$01                                ; Keep the right-most bit
                                            ; (effectively, bit 2 of the
                                            ; interrupt counter).
    JMP CastMagic_SetAppearance             ; Set that as the appearance
                                            ; index.


;============================================================================
; Finish updating the Death spell.
;
; This will maintain the sprite's direction and update
; the appearance.
;
; INPUTS:
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     CastMagic_UpdateSpriteDirection
;     CastMagic_SetAppearance
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb2d]
;============================================================================
CastMagic_FinishHandler_Death:              ; [$c3c9]
    JSR CastMagic_UpdateSpriteDirection     ; Update the sprite's direction.
    LDA InterruptCounter                    ; Load the interrupt counter.
    LSR A                                   ; Shift the interrupt counter to
                                            ; generate an appearance index.
    LSR A
    LSR A
    AND #$03                                ; Keep the 2 right-most bits
                                            ; (effectively, bits 3 and 4 of
                                            ; the interrupt counter).
    JMP CastMagic_SetAppearance             ; Set that as the appearance
                                            ; index.


;============================================================================
; Finish updating the Tilte spell.
;
; This will set the appearance to 0, 1, 2, or 3,
; based on the current phase of the magic spell and
; the interrupt counter.
;
; The appearance will be:
;
; * 0: Magic phase is even;
;      Interrupt counter has bit 3 set.
;
; * 1: Magic phase is even;
;      Interrupt counter does not have bit 3 set.
;
; * 2: Magic phase is odd;
;      Interrupt counter has bit 1 and 2 unset.
;
; * 3: Magic phase is odd;
;      Interrupt counter has bit 1 unset and 2 set.
;
; INPUTS:
;     CastMagic_Phase:
;         The phase of the magic spell.
;
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     CastMagic_SetAppearance
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb2f]
;============================================================================
CastMagic_FinishHandler_Tilte:              ; [$c3d6]
    JSR CastMagic_UpdateSpriteDirection     ; Update the sprite's direction.


    ;
    ; Check if the first bit of the magic's phase is 0 or 1.
    ;
    LDA a:CastMagic_Phase                   ; Load the magic's phase.
    LSR A                                   ; Shift bit 0 into Carry.
    BCS @_phaseIs1                          ; If it's set, jump.


    ;
    ; The magic phase is 0. Update the appearance.
    ;
    ; The appearance value will be 1 if the interrupt counter
    ; does not have bit 3 set.
    ;
    LDY #$00                                ; Y = 0
    LDA InterruptCounter                    ; A = interrupt counter
    AND #$08                                ; Keep bit 3.
    BEQ @_setAppearance1                    ; If 0, jump to use 0 as the
                                            ; appearance value.
    INY                                     ; Y++ (appearance value == 1)

  @_setAppearance1:                         ; [$c3e8]
    TYA                                     ; A = 0 or 1 (appearance value)
    JMP CastMagic_SetAppearance             ; Set the appearance of the
                                            ; magic.


    ;
    ; The magic phase is 1. Update the appearance if the
    ; interrupt counter has bit 1 unset.
    ;
  @_phaseIs1:                               ; [$c3ec]
    LDA InterruptCounter                    ; Load the interrupt counter.
    LSR A                                   ; Divide by 2.
    LSR A                                   ; And place in Carry.
    BCC @_setAppearance2                    ; If 0, jump to update
                                            ; appearance.
    RTS


    ;
    ; The appearance will be updated based on the interrupt
    ; counter. It will be 3 if bit 2 is unset, or 4 if set.
    ;
  @_setAppearance2:                         ; [$c3f3]
    AND #$01                                ; Keep bit 0.
    CLC
    ADC #$02                                ; Add 2.
    JMP CastMagic_SetAppearance             ; Set the appearance of the
                                            ; magic.


;============================================================================
; UNUSED: Finish handling updates to Deluge and Death spells that have
; collided at least once.
;
; This would maintain the sprite's direction and appearance.
;
; It's never actually run, due to both these spells clearing
; immediately when colliding.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     CastMagic_SetAppearance
;     CastMagic_UpdateSpriteDirection
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb31]
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb37]
;============================================================================
CastMagic_FinishHandler_DelugeOrDeathAfterHit: ; [$c3fb]
    JSR CastMagic_UpdateSpriteDirection     ; Update the sprite direction.
    LDA #$00
    JMP CastMagic_SetAppearance             ; Set the appearance to 0.


;============================================================================
; UNUSED: Add a Magic Hit Wall effect.
;
; This was meant to be used by the Deluge and Fire magic.
; Upon hitting a wall, it would briefly spawn two explosion
; sprites (using the diagonal Tilte sprite) up against the
; collided block, before disappearing.
;
; This may have been wired off because there appears to be
; a race condition in the Fire spell, where it may not
; always show.
;
; This can be reactivated using the following Game Genie
; codes:
;
; ZAVLOUNN
; ZEUUSUNN
;
; INPUTS:
;     CastMagic_Unused_HitWallDeltaPosY:
;         The delta Y position for the hit wall sprite.
;
;     CastMagic_YPos_Full:
;         The Y position of the magic sprite.
;
; OUTPUTS:
;     CurrentSprite_FlipMask:
;         Set to 0.
;
;     Arg_DrawSprite_PosY:
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     CastMagic_SetAppearance
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb3b]
;============================================================================
CastMagic_FinishHandler_HitWallEffect:      ; [$c403]
    ;
    ; Set the default flip mask of the sprite to 0 (face right).
    ;
    LDA #$00
    STA CurrentSprite_FlipMask              ; Set flip mask to face right.


    ;
    ; Calculate a multiplier used to position the explosion
    ; sprites.
    ;
    ; This will be the delta Y position * 2.
    ;
    LDA a:CastMagic_Unused_HitWallDeltaPosY ; A = Delta Y position.
    ASL A                                   ; A *= 2
    STA Temp_00                             ; Save it temporarily.


    ;
    ; Position and draw the top explosion sprite.
    ;
    ; This will be MagicY - (DeltaY * 2).
    ;
    LDA a:CastMagic_YPos_Full               ; A = Magic Y position.
    SEC
    SBC Temp_00                             ; A -= Effect delta Y position.
    STA Arg_DrawSprite_PosY                 ; Set as the new sprite's Y
                                            ; position.
    LDA #$02
    JSR CastMagic_SetAppearance             ; Draw the top explosion sprite
                                            ; at that position.


    ;
    ; Position and draw the bottom explosion sprite.
    ;
    ; This will be MagicY + 16 + (DeltaY * 2).
    ;
    LDA a:CastMagic_Unused_HitWallDeltaPosY ; A = Delta Y position.
    ASL A                                   ; A *= 2
    CLC
    ADC #$10                                ; A += 16
    CLC
    ADC a:CastMagic_YPos_Full               ; A += Magic Y position.
    STA Arg_DrawSprite_PosY                 ; Save it as the new sprite's Y
                                            ; position.
    LDA #$03
    JMP CastMagic_SetAppearance             ; Draw the bottom explosion
                                            ; sprite at that position.

;============================================================================
; TODO: Document CastMagic_FinishHandler_TilteAfterFirstHit
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_UPDATE_FINISH_HANDLERS [$PRG14::bb3d]
;============================================================================
CastMagic_FinishHandler_TilteAfterFirstHit: ; [$c42c]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDX #$03

  @_loop:                                   ; [$c432]
    LDA a:CastMagic_Counter
    ASL A
    PHA
    STA Temp_00
    EOR MAGICHITHANDLER_c42c_ARRAY1,X
    BPL @LAB_PRG15_MIRROR__c442
    STA Temp_00
    INC Temp_00

  @LAB_PRG15_MIRROR__c442:                  ; [$c442]
    LDA a:CastMagic_XPos_Full
    CLC
    ADC Temp_00
    STA Arg_DrawSprite_PosX
    PLA
    STA Temp_00
    EOR $c470,X
    BPL @LAB_PRG15_MIRROR__c456
    STA Temp_00
    INC Temp_00

  @LAB_PRG15_MIRROR__c456:                  ; [$c456]
    LDA a:CastMagic_YPos_Full
    CLC
    ADC Temp_00
    STA Arg_DrawSprite_PosY
    TXA
    PHA
    LDA $c474,X
    JSR CastMagic_SetAppearance
    PLA
    TAX
    DEX
    BPL @_loop
    RTS

MAGICHITHANDLER_c42c_ARRAY1:                ; [$c46c]
    .byte $ff                               ; [0]:
    .byte $00                               ; [1]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
MAGICHITHANDLER_c42c_ARRAY1_2_:             ; [$c46e]
    .byte $ff                               ; [2]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
MAGICHITHANDLER_c42c_ARRAY1_3_:             ; [$c46f]
    .byte $00                               ; [3]:
    .byte $ff                               ; [0]:
    .byte $ff                               ; [1]:
    .byte $00                               ; [2]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
BYTE_ARRAY_PRG15_MIRROR__c470_3_:           ; [$c473]
    .byte $00                               ; [3]:
    .byte $00                               ; [0]:
    .byte $02                               ; [1]:
    .byte $01                               ; [2]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
BYTE_ARRAY_PRG15_MIRROR__c474_3_:           ; [$c477]
    .byte $03                               ; [3]:


;============================================================================
; Check whether the user wants to use the selected item.
;
; This will check if the player has both initiated an action
; to use the item and is in a position to use one.
;
; If these conditions are met, the action handler for the
; item will be invoked.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
;     Joy1_ButtonMask:
;         The currently-held buttons.
;
;     Joy1_ChangedButtonMask:
;         The newly-pressed buttons.
;
;     SelectedItem:
;         The selected item.
;
; OUTPUTS:
;     None
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
GameLoop_CheckUseCurrentItem:               ; [$c478]
    LDA Player_Flags                        ; Load the player's flags.


    ;
    ; Check if the player is in a state where they'd be allowed
    ; to use an item.
    ;
    AND #$05
    BNE GameLoop_UseItem_Return


    ;
    ; Check if the Down button has been pressed. If not, return.
    ;
    LDA Joy1_ButtonMask                     ; Load the button mask.
    AND #$04                                ; Check if the Down button is
                                            ; pressed.
    BEQ GameLoop_UseItem_Return             ; If not, return.


    ;
    ; Check if the B button has been pressed. If not, return.
    ;
    LDA a:Joy1_ChangedButtonMask            ; Load the changed button mask.
    AND #$40                                ; Check if the B button is
                                            ; pressed.
    BEQ GameLoop_UseItem_Return             ; If not, return.


    ;
    ; Down-B was pressed. The item can be used, if a valid one is
    ; selected. Figure out if there's a valid one first...
    ;
    LDA a:SelectedItem                      ; Load the selected item.
    ASL A                                   ; Multiply by 2 to get a word
                                            ; boundary for address lookup.
    TAY                                     ; Y = A
    CPY #$22                                ; Is it a valid item?
    BCS GameLoop_UseItem_Return             ; If not, return.


    ;
    ; Look up this item in the jump table and run it.
    ;
    LDA USE_ITEM_JUMP_TABLE+1,Y             ; Load the lower byte of the item
                                            ; handler address.
    PHA                                     ; Push it.
    LDA USE_ITEM_JUMP_TABLE,Y               ; Load the upper byte.
    PHA                                     ; Push it.

    ;
    ; XREFS:
    ;     GameLoop_CheckUseCurrentItem
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c49d]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c49f]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4a1]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4a3]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4a5]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4a7]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4a9]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4ab]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4ad]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4b1]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4b3]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4b5]
    ;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4b9]
    ;
GameLoop_UseItem_Return:                    ; [$c49c]
    RTS


;============================================================================
; Handler functions for using specific items.
;
; XREFS:
;     GameLoop_CheckUseCurrentItem
;============================================================================

;
; XREFS:
;     GameLoop_CheckUseCurrentItem
;
USE_ITEM_JUMP_TABLE:                        ; [$c49d]
    pointer GameLoop_UseItem_Return-1       ; [0]: Ring of Elf
    pointer GameLoop_UseItem_Return-1       ; [1]: Ring of Ruby
    pointer GameLoop_UseItem_Return-1       ; [2]: Ring of Dworf
    pointer GameLoop_UseItem_Return-1       ; [3]: Demon's Ring
    pointer GameLoop_UseItem_Return-1       ; [4]: "A" Key
    pointer GameLoop_UseItem_Return-1       ; [5]: "K" Key
    pointer GameLoop_UseItem_Return-1       ; [6]: "Q" Key
    pointer GameLoop_UseItem_Return-1       ; [7]: "J" Key
    pointer GameLoop_UseItem_Return-1       ; [8]: "Jo" Key
    pointer Player_UseMattock-1             ; [9]: Mattock
    pointer GameLoop_UseItem_Return-1       ; [10]: Magical Rod
    pointer GameLoop_UseItem_Return-1       ; [11]: Crystal
    pointer GameLoop_UseItem_Return-1       ; [12]: Lamp
    pointer Player_UseHourGlass-1           ; [13]: Hour Glass
    pointer GameLoop_UseItem_Return-1       ; [14]: Book
    pointer Player_UseWingBoots-1           ; [15]: Wing Boots
    pointer Player_UseRedPotion-1           ; [16]: Red Potion


;============================================================================
; Clear the selected item.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     SelectedItem:
;         The cleared item selection.
;
; CALLS:
;     UI_ClearSelectedItemPic
;
; XREFS:
;     Player_UseHourGlass
;     Player_UseMattock
;     Player_UseRedPotion
;     Player_UseWingBoots
;============================================================================
Player_ClearSelectedItem:                   ; [$c4bf]
    PHA                                     ; Push A to the stack.
    LDA #$ff
    STA a:SelectedItem                      ; Set selected item to 0xFF
                                            ; (unset).
    JSR UI_ClearSelectedItemPic             ; Update the UI for the cleared
                                            ; image.
    PLA                                     ; Pop A from the stack.
    RTS


;============================================================================
; Use the player's Elixir.
;
; This will remove the Elixir from the inventory and update the player's
; health.
;
; This then falls through to Player_FillHPAndMP.
;
; INPUTS:
;     SpecialItems:
;         The special items bitmask to update.
;
;     Player_HP_U:
;         The player's HP.
;
;     Player_MP:
;         The player's MP.
;
; OUTPUTS:
;     SpecialItems:
;         The new special items bitmask with the
;         Elixir removed.
;
;     Player_HP_U:
;         The player's updated HP.
;
;     Player_MP:
;         The player's updated MP.
;
; CALLS:
;     Player_AddHP
;     Player_AddMP
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     WaitForNextFrame
;     Sprites_FlipRanges
;
; XREFS:
;     Player_ReduceHP
;============================================================================
Player_UseElixir:                           ; [$c4ca]
    LDA a:SpecialItems                      ; Load the special items.
    AND #$f7                                ; Clear the elixir bit.
    STA a:SpecialItems                      ; Store it.


    ;
    ; Run the "Use Elixir" IScript.
    ;
    ; IScript 0x85 via jump to IScripts_Begin.
    ;
    LDA #$85                                ; 0x85 == Use Elixir.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


;============================================================================
; Progressively fill the player's HP and MP.
;
; This will add 4HP and 4MP at a time, playing a sound
; effect for each segment. This appears to the player as
; the HP and MP bars filling up.
;
; INPUTS:
;     SpecialItems:
;         The special items bitmask to update.
;
;     Player_HP_U:
;         The player's HP.
;
;     Player_MP:
;         The player's MP.
;
; OUTPUTS:
;     SpecialItems:
;         The new special items bitmask with the
;         Elixir removed.
;
;     Player_HP_U:
;         The player's updated HP.
;
;     Player_MP:
;         The player's updated MP.
;
; CALLS:
;     Player_AddHP
;     Player_AddMP
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     WaitForNextFrame
;     Sprites_FlipRanges
;
; XREFS:
;     Player_FillHPAndMP
;============================================================================
Player_FillHPAndMP:                         ; [$c4da]
    ;
    ; Progressively fill the HP, 4 units at a time.
    ;
    ; Start by playing the sound.
    ;
    LDA #$13                                ; Set sound 0x13 (fill HP/MP
                                            ; bar).
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the HP.
    ;
    LDA #$04                                ; Set the HP to 4 units.
    JSR Player_AddHP                        ; Add it to the player.
    JSR Game_DrawScreenInFrozenState        ; Draw the screen, and prevent
                                            ; updating until done.


    ;
    ; Wait 4 frames of updates before filling up the next units
    ; of HP, to help animate the bar.
    ;
    JSR WaitForNextFrame                    ; Wait a bit.
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges


    ;
    ; Check if we're done filling up HP.
    ;
    LDA a:Player_HP_U                       ; Load the player's HP.
    CMP #$50                                ; Is it below the cap of 80HP?
    BCC Player_FillHPAndMP                  ; If so, loop.


    ;
    ; Progressively fill the MP, 4 units at a time.
    ;
    ; Start by playing the sound.
    ;
  @_fillMPLoop:                             ; [$c506]
    LDA #$13                                ; Set sound 0x13 (fill HP/MP
                                            ; bar).
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the MP.
    ;
    LDA #$04                                ; Set the MP to 4 units.
    JSR Player_AddMP                        ; Add it to the player.
    JSR Game_DrawScreenInFrozenState        ; Draw the screen but keep all
                                            ; sprites frozen.


    ;
    ; Wait 4 frames of updates before filling up the next units
    ; of MP, to help animate the bar.
    ;
    JSR WaitForNextFrame                    ; Wait a bit.
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges


    ;
    ; Check if we're done filling up MP.
    ;
    LDA a:Player_MP                         ; Load the player's MP.
    CMP #$50                                ; Is it below the cap of 80MP?
    BCC @_fillMPLoop                        ; If so, loop.
    RTS


;============================================================================
; Use the Red Potion item.
;
; This will play the Red Potion message and a sound
; effect, and remove the item from the inventory.
;
; Health will be progressively filled.
;
; INPUTS:
;     Player_HP_U:
;         The player's HP.
;
; OUTPUTS:
;     Player_HP_U:
;         The player's updated HP.
;
; CALLS:
;     Game_DrawScreenInFrozenState
;     MMC1_LoadBankAndJump
;     Player_ClearSelectedItem
;     Player_AddHP
;     Sound_PlayEffect
;     Sprites_FlipRanges
;     WaitForNextFrame
;
; XREFS:
;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4bd]
;============================================================================
Player_UseRedPotion:                        ; [$c533]
    ;
    ; Run the "Used Red Potion" IScript.
    ;
    ; IScript 0x80 via jump to IScripts_Begin.
    ;
    LDA #$80                                ; 0x80 == Use Red Potion IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$c53b]
    JSR Player_ClearSelectedItem            ; Clear the selected item.


    ;
    ; Play the initial sound effect.
    ;
    LDA #$1a                                ; 0x1A == Initial item used sound
                                            ; effect.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Set up the HP fill loop. This will fill up to 80.
    ;
    LDX #$50                                ; X = Maximum HP / our loop
                                            ; counter.

  @_loop:                                   ; [$c545]
    TXA                                     ; A = X
    PHA                                     ; Push it to the stack.


    ;
    ; Play the unit fill sound effect.
    ;
    LDA #$13                                ; 0x13 = Unit of HP fill sound
                                            ; effect.
    JSR Sound_PlayEffect                    ; Play the sound.


    ;
    ; Add 2HP.
    ;
    LDA #$02
    JSR Player_AddHP                        ; Add the 2HP to the player.
    JSR Game_DrawScreenInFrozenState


    ;
    ; Wait 4 frames worth of updates before filling the next 2HP.
    ;
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges


    ;
    ; Check if we're done.
    ;
    PLA                                     ; Pop the max HP.
    TAX                                     ; X = A
    LDA a:Player_HP_U                       ; Load the player's current HP.
    CMP #$50                                ; Is the player at max HP?
    BCS @_return                            ; If so, return.
    DEX                                     ; X--
    BNE @_loop                              ; If X > 0, loop.

  @_return:                                 ; [$c578]
    RTS


;============================================================================
; Use the Wing Boots item.
;
; This will play the Wing Boots message and a sound
; effect, and remove the item from the inventory.
;
; The duration of the Wing Boots will depend on the
; player's title:
;
; * 40 seconds: Novice, Aspirant, Battler, Fighter
; * 30 seconds: Adept, Chevalier, Veteran, Warrior
; * 20 seconds: Swordman, Hero, Soldier, Myrmidon
; * 10 seconds: Champion, Superhero, Paladin, Lor
;
; INPUTS:
;     PlayerTitle:
;         The player's current title.
;
;     TITLE_TO_WINGBOOTS_DURATION:
;         The table of player titles to Wingboots duration.
;
; OUTPUTS:
;     DurationWingBoots:
;         The starting number of seconds remaining for the
;         Wing Boots.
;
; CALLS:
;     Player_ClearSelectedItem:
;     Sound_PlayEffect
;     MMC1_LoadBankAndJump
;     UI_DrawTimeValue
;
; XREFS:
;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4bb]
;============================================================================
Player_UseWingBoots:                        ; [$c579]
    ;
    ; Run the "Wing Boots Used" IScript.
    ;
    ; IScript 0x83 via jump to IScripts_Begin.
    ;
    LDA #$83                                ; 0x83 == Wing Boots used
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Remove the item.
    ;
  @_afterFarJump:                           ; [$c581]
    JSR Player_ClearSelectedItem            ; Clear the selected item.


    ;
    ; Play a sound effect for the item usage.
    ;
    LDA #$1a                                ; Set the sound to play to 0x1A
                                            ; (special item sound).
    JSR Sound_PlayEffect                    ; Play the sound.


    ;
    ; Calculate the index into the duration table based on
    ; the player's title.
    ;
    LDA a:PlayerTitle                       ; Load the player's title.
    LSR A                                   ; Divide by 4.
    LSR A
    TAX                                     ; X = A (index)
    LDA TITLE_TO_WINGBOOTS_DURATION,X       ; Look up in the duration table.
    STA a:DurationWingBoots                 ; Set that as the starting
                                            ; duration.
    JSR UI_DrawTimeValue                    ; Draw the time on the HUD.
    RTS


;============================================================================
; Wing Boots durations by player title.
;
; The duration decreases every 4 player titles.
;
; XREFS:
;     Player_UseWingBoots
;============================================================================

;
; XREFS:
;     Player_UseWingBoots
;
TITLE_TO_WINGBOOTS_DURATION:                ; [$c599]
    .byte $28                               ; [0]: 40 seconds: Novice,
                                            ; Aspirant, Battler, Fighter
    .byte $1e                               ; [1]: 30 seconds: Adept,
                                            ; Chevalier, Veteran, Warrior
    .byte $14                               ; [2]: 20 seconds: Swordman,
                                            ; Hero, Soldier, Myrmidon
    .byte $0a                               ; [3]: 10 seconds: Champion,
                                            ; Superhero, Paladin, Lord


;============================================================================
; Decrement the Wing Boot's duration.
;
; This will decrement and then draw the time in the HUD.
;
; INPUTS:
;     DurationWingBoots:
;         The remaining duration for the Wing Boots.
;
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     DurationWingBoots:
;         The new duration for the Wing Boots.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     UI_DrawTimeValue
;
; XREFS:
;     GameLoop_CountdownItems
;============================================================================
Game_DecWingBootsDuration:                  ; [$c59d]
    ;
    ; Check if there's any time remaining on the Wing Boots.
    ;
    LDA a:DurationWingBoots                 ; Load the remaining time on the
                                            ; Wing Boots.
    BMI @_return                            ; If the counter is unset (0xFF),
                                            ; return.


    ;
    ; Update the player's status to mark Wing Boots as on.
    ;
    LDA Player_StatusFlag                   ; Load the player's status flags.
    ORA #$80                                ; Enable the Wing Boots bit.
    STA Player_StatusFlag                   ; Store it.


    ;
    ; Update at most once every second.
    ;
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$3f                                ; Check if we're at the 1 second
                                            ; mark.
    BNE @_return                            ; If not, return.


    ;
    ; Reduce time on the Wing Boots by a second.
    ;
    DEC a:DurationWingBoots                 ; Decrement the remaining time
                                            ; for the Wing Boots.
    LDA a:DurationWingBoots                 ; Load that duration
    BMI @_wingBootsDone                     ; If it wrapped from 0 to 0xFF,
                                            ; it's used up. Jump.
    JMP UI_DrawTimeValue                    ; Else, draw the time remaining.


    ;
    ; The Wing Boots ran out. Remove the flag from the player's
    ; status.
    ;
  @_wingBootsDone:                          ; [$c5b9]
    LDA Player_StatusFlag                   ; Load the player's status flags.
    AND #$7f                                ; Clear the Wing Boots flag.
    STA Player_StatusFlag                   ; Store it.


    ;
    ; Run "Wing Boots are gone" IScript.
    ;
    ; IScript 0x96 via jump to IScripts_Begin.
    ;
    LDA #$96                                ; 0x96 == Wing Boots are gone
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; It will resume here.
    ;
  @_return:                                 ; [$c5c7]
    RTS


;============================================================================
; Use the Hour Glass.
;
; This will invoke the IScript for the Hour Glass's
; message, play a sound, and begin the Hour Glass
; effect.
;
; The player's health will be reduced by half in the
; process.
;
; INPUTS:
;     Player_HP_U:
;     Player_HP_L:
;         The player's current health.
;
; OUTPUTS:
;     Player_HP_U:
;     Player_HP_L:
;         The player's new health, reduced by half.
;
;     DurationHourGlass:
;         The duration of the Hour Glass.
;
;     Music_Current:
;         The music to play while the Hour Glass is
;         active.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Player_ClearSelectedItem
;     Sound_PlayEffect
;     UI_DrawPlayerHP
;
; XREFS:
;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4b7]
;============================================================================
Player_UseHourGlass:                        ; [$c5c8]
    ;
    ; Run the "Hour Glass Used" IScript.
    ;
    ; IScript 0x82 via jump to IScripts_Begin.
    ;
    LDA #$82                                ; Set the IScript to run to 0x82.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Remove the item.
    ;
  @_afterFarJump:                           ; [$c5d0]
    JSR Player_ClearSelectedItem            ; Clear the selected item.


    ;
    ; Play a sound effect for the item usage.
    ;
    LDA #$1a                                ; Set the sound to play to 0x1A
                                            ; (special item sound).
    JSR Sound_PlayEffect                    ; Play the sound.


    ;
    ; Reduce the player's health by half. This is the cost of
    ; the Hour Glass.
    ;
    LSR a:Player_HP_U                       ; Divide the upper value of the
                                            ; player's HP by half.
    ROR a:Player_HP_L                       ; Divide the lower byte of the
                                            ; player's HP by half, and add
                                            ; carry from the upper.
    JSR UI_DrawPlayerHP                     ; Draw the new HP.


    ;
    ; Set the duration of the Hour Glass to 15 seconds.
    ;
    LDA #$0f                                ; Set the duration to 15 seconds.
    STA a:DurationHourGlass


    ;
    ; Change the music.
    ;
    LDA #$0b                                ; Set the new music to play.
    STA Music_Current                       ; And play it.
    RTS


;============================================================================
; Decrement the Hour Glass's duration.
;
; INPUTS:
;     DurationHourGlass:
;         The remaining duration for the Hour Glass.
;
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     DurationHourGlass:
;         The new duration for the Hour Glass..
;
;     Music_Current:
;         The restored music for the area.
;
; CALLS:
;     MMC1_LoadBankAndJump
;
; XREFS:
;     GameLoop_CountdownItems
;============================================================================
Game_DecHourGlassDuration:                  ; [$c5eb]
    ;
    ; Check if there's any time remaining on the Hour Glass.
    ;
    LDA a:DurationHourGlass                 ; Load the remaining time on the
                                            ; Hour Glass.
    BMI @_return                            ; If the counter is unset (0xFF),
                                            ; return.


    ;
    ; Update at most once every second.
    ;
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$3f                                ; Check if we're at the 1 second
                                            ; mark.
    BNE @_return                            ; If not, return.


    ;
    ; Reduce time on the Hour Glass by a second.
    ;
    DEC a:DurationHourGlass                 ; Decrement the remaining time
                                            ; for the Hour Glass.
    BPL @_return                            ; If it wrapped from 0 to 0xFF,
                                            ; it's used up. Jump.


    ;
    ; Run "Hour Glass is gone" IScript.
    ;
    ; IScript 0x97 via jump to IScripts_Begin.
    ;
    LDA #$97                                ; 0x97 == Hour Glass is gone
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Load the area's default music.
    ;
  @_afterFarJump:                           ; [$c603]
    LDA a:Areas_DefaultMusic                ; Load the music for the area.
    STA Music_Current                       ; Store it.

  @_return:                                 ; [$c608]
    RTS


;============================================================================
; Add 100XP to the player's experience.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     Temp_Int24:
;     Temp_Int24+1:
;         Clobbered.
;
; CALLS:
;     Player_UpdateExperience
;
; XREFS:
;     Player_PickUpGlove
;     Player_PickUpOintment
;============================================================================
Player_Add100XP:                            ; [$c609]
    LDA #$64                                ; A = 100 (lower byte of XP)
    STA a:Temp_Int24                        ; Store it as an argument.
    LDA #$00                                ; A = 0 (upper byte of XP).
    STA a:Temp_Int24_M                      ; Store it as an argument.
    JMP Player_UpdateExperience             ; Update the player's experience
                                            ; using those values.


;============================================================================
; Use the Mattock.
;
; This will check if the Mattock can be used at the current
; player position. If so, it will invoke the IScript for the
; Mattock's message, play a sound, and update the level state.
;
; INPUTS:
;     Area_CurrentArea:
;         The current area.
;
;     Player_PosX_Block:
;         The player's current X position.
;
;     Player_PosY:
;         The player's current Y position.
;
;     Player_Flags:
;         The player's flags.
;
;     USE_MATTOCK_BLOCK_DISTANCES:
;         TODO
;
; OUTPUTS:
;     Arg_PixelPosX:
;     Arg_PixelPosY:
;         Clobbered.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Player_ClearSelectedItem
;     Sound_PlayEffect
;     WaitForNextFrame
;     Area_SetBlocks
;
; XREFS:
;     USE_ITEM_JUMP_TABLE [$PRG15_MIRROR::c4af]
;============================================================================
Player_UseMattock:                          ; [$c616]
    ;
    ; Check if the block check position will be in bounds.
    ;
    ; The offset will be dependent on the facing direction.
    ;
    ; If facing left, this will check the block immediately
    ; to the left (0xFF -- wrapping around the screen).
    ;
    ; If facing right, this will check block + 16 (within or
    ; at the end of the blocks to clear).
    ;
    LDY #$00                                ; Lookup table index = 0
                                            ; (default)
    LDA Player_Flags                        ; Load the player's flags.
    AND #$40                                ; Is the player facing right?
    BEQ @LAB_PRG15_MIRROR__c61f             ; If not, jump.


    ;
    ; The player is facing right. Set our offset into the block
    ; distances table to 1.
    ;
    INY                                     ; Lookup table index = 1

  @LAB_PRG15_MIRROR__c61f:                  ; [$c61f]
    LDA Player_PosX_Block                   ; Get the player's X position.
    CLC
    ADC USE_MATTOCK_BLOCK_DISTANCES,Y       ; Add the block distance for the
                                            ; facing direction.
    CMP #$f0                                ; Is the player too near to the
                                            ; right edge of the screen?
    BCS @_return                            ; If so, return.


    ;
    ; Begin fetching the block at this offset.
    ;
    ; Same logic as above for block calculation.
    ;
    STA Arg_PixelPosX                       ; Store the calculated position
                                            ; as the X argument.
    LDA Player_PosY                         ; Load the player's current Y
                                            ; position.
    STA Arg_PixelPosY                       ; Store that as the Y argument.
    JSR Area_ConvertPixelsToBlockPos        ; Convert those pixel positions
                                            ; to block positions.


    ;
    ; Check if the screen buffer contains the blocks to clear.
    ; If not, there's nothing to do.
    ;
    ; Each block is composed of 4 tiles, which are represented
    ; in the lookup table. This only needs to check for the
    ; presence of one of those blocks.
    ;
    LDA Area_CurrentArea                    ; Load the current area.
    ASL A                                   ; Convert to a 4 byte index.
    ASL A
    TAY                                     ; Y = index
    LDA ScreenBuffer,X                      ; Load the value from the screen
                                            ; buffer.
    CMP USE_MATTOCK_BLOCK_TRANSITIONS,Y     ; Is this block already cleared
                                            ; by the Mattock?
    BEQ @_useMattock                        ; If not, use the Mattock to
                                            ; clear them.
    RTS                                     ; Else, return.


    ;
    ; The Mattock will be used. Store the offsets into the
    ; screen buffer and array on the stack for later.
    ;
  @_useMattock:                             ; [$c640]
    TXA                                     ; A = X
    PHA                                     ; Push to the stack.
    TYA                                     ; A = Y
    PHA                                     ; Push to the stack.


    ;
    ; Run the "Used Mattock" IScript.
    ;
    ; IScript 0x81 via jump to IScripts_Begin.
    ;
    LDA #$81
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Remove the Mattock.
    ;
  @_afterFarJump:                           ; [$c64c]
    JSR Player_ClearSelectedItem            ; Clear the selected item.


    ;
    ; Play the sound effect for the Mattock usage.
    ;
    LDA #$1a                                ; 0x1A == Special item sound
                                            ; effect.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Prepare for the loop.
    ;
    ; This loop will handle animating the destruction/crumbling
    ; of blocks. This uses 4 frames of animation, all defined in
    ; USE_MATTOCK_BLOCK_TRANSITIONS.
    ;
    PLA                                     ; Pull A from the stack.
    TAY                                     ; Y = A
    PLA                                     ; Pull A from the stack.
    TAX                                     ; X = A


    ;
    ; Only update every 4 frames, to get a quick animation effect.
    ;
  @_loop:                                   ; [$c658]
    JSR WaitForNextFrame                    ; Wait for 4 frames.
    JSR WaitForNextFrame
    JSR WaitForNextFrame
    JSR WaitForNextFrame


    ;
    ; Update the screen to place the next block in the sequence.
    ;
    TYA                                     ; A = Y
    PHA                                     ; Push to the stack.
    TXA                                     ; A = X
    PHA                                     ; Push to the stack.
    LDA USE_MATTOCK_BLOCK_TRANSITIONS,Y     ; Load the block for this
                                            ; position.
    STA ScreenBuffer,X                      ; And store it in the screen
                                            ; buffer.
    JSR Area_SetBlocks                      ; Update the level data.


    ;
    ; Update to the next block.
    ;
    TXA                                     ; A = X
    CLC
    ADC #$10                                ; A += 32
    TAX                                     ; X = A
    LDA a:Arg_BlockAttributesIndex          ; Load a value.
    STA ScreenBuffer,X                      ; And write it to the screen
                                            ; buffer.
    JSR Area_SetBlocks                      ; Upate the level data.


    ;
    ; Prepare for the next loop iteration.
    ;
    PLA                                     ; Pull A from the stack.
    TAX                                     ; X = A
    PLA                                     ; Pull A from the stack.
    TAY                                     ; Y = A
    INY                                     ; Y++
    TYA                                     ; A = Y
    AND #$03                                ; Have we finished updating the
                                            ; blocks?
    BEQ @_return                            ; If so, return.
    JMP @_loop                              ; Else, loop.

  @_return:                                 ; [$c68c]
    RTS


;============================================================================
; Block distances for checking if a player is on-screen.
;
; This is used when using the Mattock.
;
; XREFS:
;     Player_UseMattock
;============================================================================

;
; XREFS:
;     Player_UseMattock
;
USE_MATTOCK_BLOCK_DISTANCES:                ; [$c68d]
    .byte $ff                               ; [0]:

;
; XREFS:
;     Player_UseMattock
;
USE_MATTOCK_BLOCK_DISTANCES_1_:             ; [$c68e]
    .byte $10                               ; [1]:


;============================================================================
; New block IDs to place when clearing blocks.
;
; This is divided into regions, each with 4 blocks.
; Those 4 blocks are an animation transition between
; the placed blocks (index 0 within a group) and
; cleared blocks (index 3).
;
; XREFS:
;     Player_UseMattock
;============================================================================

;
; XREFS:
;     Player_UseMattock
;
USE_MATTOCK_BLOCK_TRANSITIONS:              ; [$c68f]
    .byte $00                               ; [0]: Eolis
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $63                               ; [4]: Apolune
    .byte $85                               ; [5]:
    .byte $86                               ; [6]:
    .byte $42                               ; [7]:
    .byte $00                               ; [8]: Forepaw
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]: Mascon
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $00                               ; [16]: Victim
    .byte $00                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]: Conflate
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $00                               ; [24]: Daybreak
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $00                               ; [28]: Evil Fortress
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:


;============================================================================
; Clear timers on all temporary status items.
;
; This applies to the Glove, Ointment, Wing Boots, and
; Hour Glass.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     DurationGlove:
;     DurationHourGlass:
;     DurationOintment:
;     DurationWingBoots:
;         All set to 0xFF (not active).
;
; XREFS:
;     Game_Start
;     Player_Spawn
;============================================================================
Game_ClearTimedItems:                       ; [$c6af]
    LDA #$ff
    STA a:DurationGlove                     ; Clear the Glove duration.
    STA a:DurationOintment                  ; Clear the Ointment duration.
    STA a:DurationWingBoots                 ; Clear the Wing Boots duration.
    STA a:DurationHourGlass                 ; Clear the Hour Glass duration.
    RTS


;============================================================================
; Handle picking up the Hour Glass.
;
; This will invoke the IScript, play the sound, and add
; the Hour Glass to the inventory.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     Player_PickUpItem
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpHourGlass:                     ; [$c6be]
    ;
    ; Run the "Got Hour Glass" IScript.
    ;
    ; IScript 0x8A via jump to IScripts_Begin.
    ;
    LDA #$8a                                ; 0x8A == Hour Glass picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c6c6]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Pick up the item.
    ;
    LDA #$0d                                ; 0xD == Hour Glass.
    JMP Player_PickUpItem                   ; Pick it up.


;============================================================================
; Handle picking up the Wing Boots for the quest.
;
; This will invoke the IScript, play the sound, and add
; the Wing Boots to the inventory.
;
; INPUTS:
;     Quests:
;         The player's current completed quests.
;
; OUTPUTS:
;     Quests:
;         The updated set of completed quests.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Player_PickUpItem
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpWingBootsWithQuest:            ; [$c6d0]
    LDA a:Quests                            ; Load the completed quests.
    ORA #$08                                ; Mark this quest as completed.
    STA a:Quests                            ; Store it back out.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Handle picking up the Wing Boots.
;
; This will invoke the IScript, play the sound, and add
; the Wing Boots to the inventory.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Player_PickUpItem
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpWingBoots:                     ; [$c6d8]
    ;
    ; Run the "Got Wing Boots" IScript.
    ;
    ; IScript 0x89 via jump to IScripts_Begin.
    ;
    LDA #$89                                ; 0x89 == Wing boots picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c6e0]
    LDA #$08                                ; 0x8 == Item pick-up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Pick up the item.
    ;
    LDA #$0f                                ; 0xF == Wing Boots.
    JMP Player_PickUpItem                   ; Pick it up.


;============================================================================
; Pick up the Battle Suit and add to the inventory.
;
; This will invoke the IScript, play the sound, and then
; attempt to cap the armor insert position and add the item
; there.
;
; BUGS:
;     This has a bug where it checks the caps against the
;     WEAPON slots, not the ARMOR slots!
;
;     Player_PickUpDragonSlayer has the inverse
;     bug.
;
; INPUTS:
;     NumberOfWeapons:
;         The number of weapons the player is carrying.
;
; OUTPUTS:
;     ArmorInventory:
;         The updated armor inventory.
;
;     NumberOfArmors:
;         The number of armors in the inventory.
;
;     See CALLS.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpBattleSuit:                    ; [$c6ea]
    ;
    ; Run the "Got Battle Suit" IScript.
    ;
    ; IScript 0x8B via jump to IScripts_Begin.
    ;
    LDA #$8b                                ; 0x8B == Battle Suit picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c6f2]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Cap the number of WEAPONS in the inventory.
    ;
    ; Yes, weapons. This *should* be armor. This code is swapped
    ; with the code that equips the Dragon Slayer.
    ;
    LDX a:NumberOfWeapons                   ; X = Number of weapons.
    CPX #$04                                ; If < 4
    BCC @_addItem                           ; Then, add it to the latest
                                            ; slot.
    LDX #$03                                ; Else, cap X to 3.


    ;
    ; Add the Battle Suit to the inventory.
    ;
  @_addItem:                                ; [$c700]
    LDA #$03                                ; 0x03 == Battle Suit
    STA ArmorInventory,X                    ; Set in the inventory slot


    ;
    ; Increase the number of armors collected.
    ;
    INX                                     ; X++
    STX a:NumberOfArmors                    ; Store as the number of armors.
    RTS


;============================================================================
; Pick up the Battle Helmet and add to the inventory.
;
; This will invoke the IScript, play the sound, and then
; cap the shield insertion point and add the item there.
;
; Keep in mind, the Battle Helmet is considered a shield in
; this game.
;
; INPUTS:
;     NumberOfShields:
;         The number of shields the player is carrying.
;
; OUTPUTS:
;     ShieldInventory:
;         The updated armor inventory.
;
;     NumberOfShields:
;         The number of armors in the inventory.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpBattleHelmet:                  ; [$c70a]
    ;
    ; Run the "Got Battle Helmet" IScript.
    ;
    ; IScript 0x8C via jump to IScripts_Begin.
    ;
    LDA #$8c                                ; 0x8C == Battle Helmet picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run it.
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c712]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Cap the number of shields in the inventory.
    ;
    LDX a:NumberOfShields                   ; X = Number of shields.
    CPX #$04                                ; If X < 4:
    BCC @_addItem                           ; Then, add to the latest slot.
    LDX #$03                                ; Else, cap X to 3.


    ;
    ; Add the Battle Helmet to the inventory.
    ;
  @_addItem:                                ; [$c720]
    LDA #$03                                ; 0x03 == Battle Helmet.
    STA ShieldInventory,X                   ; Set in the inventory slot.


    ;
    ; Increase the number of shields collected.
    ;
    INX                                     ; X++
    STX a:NumberOfShields                   ; Store as the number of shields.
    RTS


;============================================================================
; Pick up the Dragon Slayer and add to the inventory.
;
; This will invoke the IScript, play the sound, and then
; attempt to cap the armor insert position and add the item
; there.
;
; BUGS:
;     This has a bug where it checks the caps against the
;     ARMOR slots, not the WEAPON slots!
;
;     Player_PickUpBattleSuit has the inverse
;     bug.
;
; INPUTS:
;     NumberOfArmors:
;         The number of armors the player is carrying.
;
; OUTPUTS:
;     WeaponInventory:
;         The updated weapon inventory.
;
;     NumberOfWeapons:
;         The number of weapons in the inventory.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpDragonSlayer:                  ; [$c72a]
    ;
    ; Run the "Got Dragon Slayer" IScript.
    ;
    ; IScript 0x8D via jump to IScripts_Begin.
    ;
    LDA #$8d                                ; 0x8D == Dragon Slayer picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run it.
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c732]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Cap the number of ARMORS in the inventory.
    ;
    ; Yes, armors. This *should* be weapons. This code is swapped
    ; with the code that equips the Battle Suit.
    ;
    LDX a:NumberOfArmors                    ; X = number of armors.
    CPX #$04                                ; If < 4
    BCC @_addItem                           ; Then, add it to the latest
                                            ; slot.
    LDX #$03                                ; Else, cap X to 3.


    ;
    ; Add the Dragon Slayer to the inventory.
    ;
  @_addItem:                                ; [$c740]
    LDA #$03                                ; 0x03 == Dragon Slayer
    STA WeaponInventory,X                   ; Set in the inventory slot.


    ;
    ; Increase the number of weapons collected.
    ;
    INX                                     ; X++
    STX a:NumberOfWeapons                   ; Store as the number of weapons.
    RTS


;============================================================================
; Handle picking up the Mattock for the quest.
;
; This will invoke the IScript, play the sound, and set
; the Mattock bit in the quests and in the inventory.
;
; INPUTS:
;     Quests:
;         The current completed quests.
;
; OUTPUTS:
;     Quests:
;         The updated completed quests.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Player_PickUpItem
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpMattockWithQuest:              ; [$c74a]
    LDA a:Quests                            ; Load the quests bitmask.
    ORA #$10                                ; Bit 0x10 == Mattock
    STA a:Quests                            ; Save it.

    ;
    ; v-- Fall through to the next function. --v
    ;


;============================================================================
; Handle picking up the Mattock.
;
; This will invoke the IScript, play the sound, and add
; the Mattock to the inventory.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Player_PickUpItem
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpMattock:                       ; [$c752]
    ;
    ; Run the "Got Mattock" IScript.
    ;
    ; IScript 0x88 via jump to IScripts_Begin.
    ;
    LDA #$88                                ; 0x88 == Mattock picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c75a]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Load the Mattock into the inventory.
    ;
    LDA #$09                                ; 0x09 == Mattock
    JMP Player_PickUpItem                   ; Pick up the Mattock.


;============================================================================
; Handle picking up an item.
;
; INPUTS:
;     A:
;         The sprite entity that was interacted with.
;
;         This will determine the proper handler for the
;         item pick-up.
;
; OUTPUTS:
;     See CALLS.
;
; CALLS:
;     Player_PickUpBattleHelmet
;     Player_PickUpBattleSuit
;     Player_PickUpBlackOnyx
;     Player_PickUpDragonSlayer
;     Player_PickUpElixir
;     PRG15::87cf
;     Player_PickUpHourGlass
;     Player_PickUpMagicalRod
;     Player_PickUpMattock
;     Player_PickUpMattockWithQuest
;     Player_PickUpOintment
;     Player_PickUpPendant
;     Player_PickUpPoison
;     Player_PickUpRedPotion
;     Player_PickUpWingBoots
;     Player_PickUpWingBootsWithQuest
;
; XREFS:
;     Player_HandleTouchItem
;============================================================================
Player_PickUp:                              ; [$c764]
    ;
    ; Check if this is the Mattock.
    ;
    CMP #$50                                ; 0x50 == Mattock
    BEQ Player_PickUpMattock                ; If 0x50, this is the Mattock.
                                            ; Pick it up.


    ;
    ; Check if this is the Magical Rod.
    ;
    CMP #$57                                ; 0x57 == Magical Rod
    BNE @_checkBattleSuit
    JMP Player_PickUpMagicalRod             ; This is the Magical Rod. Pick
                                            ; it up.


    ;
    ; Check if this is the battle suit.
    ;
  @_checkBattleSuit:                        ; [$c76f]
    CMP #$58                                ; 0x58 == Battle Suit
    BNE @_checkBattleHelmet
    JMP Player_PickUpBattleSuit             ; This is the Battle Suit. Pick
                                            ; it up.


    ;
    ; Check if this is the battle helmet.
    ;
  @_checkBattleHelmet:                      ; [$c776]
    CMP #$59                                ; 0x59 == Battle Helmet
    BEQ Player_PickUpBattleHelmet           ; This is the Battle Helmet. Pick
                                            ; it up.


    ;
    ; Check if this is the Dragon Slayer.
    ;
    CMP #$5a                                ; 0x5A == Dragon Slayer
    BEQ Player_PickUpDragonSlayer           ; This is the Dragon Slayer. Pick
                                            ; it up.


    ;
    ; Check if this is the Mattock.
    ;
    CMP #$5b                                ; 0x5B == Mattock
    BEQ Player_PickUpMattockWithQuest       ; This is the Mattock. Pick it
                                            ; up.


    ;
    ; Check if this is the Wing Boots.
    ;
    CMP #$55                                ; 0x55 == Wing Boots
    BNE @_checkWingBootsQuest8
    JMP Player_PickUpWingBoots              ; This is the Wing Boots. Pick it
                                            ; up.


    ;
    ; Check if this is the Wing Boots (with Quest 0x08).
    ;
  @_checkWingBootsQuest8:                   ; [$c789]
    CMP #$5c                                ; 0x5C == Wing Boots for Quest 8
    BNE @_checkHourGlass
    JMP Player_PickUpWingBootsWithQuest     ; This is the Wing Boots for
                                            ; Quest 8. Pick it up.


    ;
    ; Check if this is the Hour Glass.
    ;
  @_checkHourGlass:                         ; [$c790]
    CMP #$56                                ; 0x56 == Hour Glass
    BNE @_checkRedPotion
    JMP Player_PickUpHourGlass              ; This is the Hour Glass.  Pick
                                            ; it up.


    ;
    ; Check if this is the Red Potion.
    ;
  @_checkRedPotion:                         ; [$c797]
    CMP #$5d                                ; 0x5D == Red Potion (1)
    BNE @_checkPoison
    JMP Player_PickUpRedPotion              ; This is the Red Potion (1).
                                            ; Pick it up.


    ;
    ; Check if this is the Poison.
    ;
  @_checkPoison:                            ; [$c79e]
    CMP #$5e                                ; 0x5E == Poison
    BNE @_checkGlove1
    JMP Player_PickUpPoison                 ; This is the Poison.  Pick it
                                            ; up.

  @_checkGlove1:                            ; [$c7a5]
    CMP #$5f                                ; 0x5F == Glove
    BEQ Player_PickUpGlove                  ; This is the Glove.  Pick it up.


    ;
    ; Check if this is the Ointment.
    ;
    CMP #$60                                ; 0x60 == Ointment
    BNE @_checkGlove2
    JMP Player_PickUpOintment               ; This is the Ointment.  Pick it
                                            ; up.

  @_checkGlove2:                            ; [$c7b0]
    SEC
    SBC #$48
    TAY
    BEQ Player_PickUpGlove                  ; This is the Glove. Pick it up.


    ;
    ; Check if this is the Black Onyx.
    ;
    DEY                                     ; 0x49 == Black Onyx
    BEQ Player_PickUpBlackOnyx              ; If 0x49, this is the Black
                                            ; Onyx.  Pick it up.


    ;
    ; Check if this is the Pendant.
    ;
    DEY                                     ; 0x4A == Pendant
    BEQ Player_PickUpPendant                ; If 0x4A, this is the pendant.
                                            ; Pick it up.


    ;
    ; Check if this is the Red Potion (another variant).
    ;
    DEY                                     ; 0x4B == Red Potion (2)
    BEQ Player_PickUpRedPotion              ; If 0x4B, this is the Red Potion
                                            ; (2).  Pick it up.


    ;
    ; Check if this is the Poison.
    ;
    DEY                                     ; 0x4C == Poison
    BEQ Player_PickUpPoison                 ; If 0x4C, this is the Poison.
                                            ; Pick it up.


    ;
    ; Check if this is the Elixir.
    ;
    DEY                                     ; 0x4D == Elixir
    BNE @_checkOintment
    JMP Player_PickUpElixir                 ; This is the Elixir.  Pick it
                                            ; up.


    ;
    ; Check if this is the Ointment.
    ;
  @_checkOintment:                          ; [$c7c8]
    DEY                                     ; 0x4E == Ointment
    BNE @_exit
    JMP Player_PickUpOintment               ; This is the Ointment.  Pick it
                                            ; up.

  @_exit:                                   ; [$c7ce]
    RTS


;============================================================================
; Handle picking up the Glove.
;
; This will invoke the IScript, play the sound, and enable
; the Glove state.
;
; Picking up the glove awards 100XP.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     Player_Add100XP
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpGlove:                         ; [$c7cf]
    ;
    ; Run the "Got Glove" IScript.
    ;
    ; IScript 0x92 via jump to IScripts_Begin.
    ;
    LDA #$92                                ; 0x92 == Glove picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c7d7]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Activate the Glove by setting its duration, and then
    ; add 100XP to the player.
    ;
    LDA #$14                                ; A = 20 seconds.
    STA a:DurationGlove                     ; Set as the Glove duration.
    JMP Player_Add100XP                     ; Give the player 100XP.


;============================================================================
; Handle picking up the Black Onyx.
;
; This will invoke the IScript, play the sound, and add
; the Black Onyx to the special items inventory.
;
; INPUTS:
;     SpecialItems:
;         The player's special items.
;
; OUTPUTS:
;     SpecialItems:
;         The updated special items.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpBlackOnyx:                     ; [$c7e4]
    ;
    ; Run the "Got Black Onyx" IScript.
    ;
    ; IScript 0x8E via jump to IScripts_Begin.
    ;
    LDA #$8e                                ; 0x8E == Black Onyx picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c7ec]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the item to the player's special items list.
    ;
    LDA a:SpecialItems                      ; Load the current special items
                                            ; bitmask.
    ORA #$01                                ; Bit 0x01 == Black Onyx.
    STA a:SpecialItems                      ; Save it back out.
    RTS


;============================================================================
; Handle picking up the Pendant.
;
; This will invoke the IScript, play the sound, and add
; the Pendant to the special items inventory.
;
; INPUTS:
;     SpecialItems:
;         The player's special items.
;
; OUTPUTS:
;     SpecialItems:
;         The updated special items.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpPendant:                       ; [$c7fa]
    ;
    ; Run the "Got Glove" IScript.
    ;
    ; IScript 0x8F via jump to IScripts_Begin.
    ;
    LDA #$8f                                ; 0x8F = Pendant picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c802]
    LDA #$08                                ; 0x08 = Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the item to the player's special items list.
    ;
    LDA a:SpecialItems                      ; Load the curent special items
                                            ; bitmask.
    ORA #$02                                ; Bit 0x02 == Pendant.
    STA a:SpecialItems                      ; Save it back out.
    RTS


;============================================================================
; Handle picking up the Magical Rod.
;
; This will invoke the IScript, play the sound, and add
; the Magical Rod to the special items inventory.
;
; INPUTS:
;     SpecialItems:
;         The player's special items.
;
; OUTPUTS:
;     SpecialItems:
;         The updated special items.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpMagicalRod:                    ; [$c810]
    ;
    ; Run the "Got Magical Rod" IScript.
    ;
    ; IScript 0x90 via jump to IScripts_Begin.
    ;
    LDA #$90                                ; 0x90 == Magical Rod picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c818]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the Magical Rod to the inventory.
    ;
    LDA a:SpecialItems                      ; Load the current special items
                                            ; bitmask.
    ORA #$04                                ; Bit 0x04 == Magical Rod.
    STA a:SpecialItems                      ; Store it.
    RTS


;============================================================================
; Handle picking up the Red Potion.
;
; This will invoke the IScript, play the sound, and add
; the Red Potion to the inventory.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     X:
;         Set to the current sprite index.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     Player_PickUpItem
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpRedPotion:                     ; [$c826]
    ;
    ; Run the "Got Red Potion" IScript.
    ;
    ; IScript 0x87 via jump to IScripts_Begin.
    ;
    LDA #$87                                ; 0x87 == Red Potion picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c82e]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the Red Potion to the inventory.
    ;
    LDA #$10                                ; 0x10 == Red Potion.
    JSR Player_PickUpItem                   ; Pick up the item.
    LDX a:CurrentSpriteIndex                ; X = current sprite index
                                            ; (restored?)
    RTS


;============================================================================
; Handle picking up the Poison.
;
; This will invoke the IScript, play the sound, and decrease
; the player health.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     X:
;         Set to the current sprite index.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     Player_ReduceHP
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpPoison:                        ; [$c83c]
    ;
    ; Run the "Got Poison" IScript.
    ;
    ; IScript 0x91 via jump to IScripts_Begin.
    ;
    LDA #$91                                ; 0x91 = Poison picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for the player taking damage.
    ;
  @_afterFarJump:                           ; [$c844]
    LDA #$04                                ; 0x084 = Player took damage
                                            ; sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Set temporary invincibility frames for the player.
    ;
    LDA #$3c                                ; A = 60 iframes
    STA Player_InvincibilityPhase           ; Set it as the starting
                                            ; invincibility phase.


    ;
    ; Mark the player as hit.
    ;
    LDA Player_StatusFlag                   ; Load the player's status flags.
    ORA #$02                                ; Bit 0x02 == Player was hit.
    STA Player_StatusFlag                   ; Save it.


    ;
    ; Remove 16 points from the player's health.
    ;
    LDA #$00                                ; A = 0
    STA a:Arg_PlayerHealthDelta_L           ; Store as the lower byte of HP
                                            ; to remove.
    LDA #$10                                ; A = 16
    STA a:Arg_PlayerHealthDelta_U           ; Store as the upper byte of HP
                                            ; to remove.
    JSR Player_ReduceHP                     ; Reduce the HP by that amount.
    LDX a:CurrentSpriteIndex                ; X = current sprite index
                                            ; (restored?)
    RTS


;============================================================================
; Handle picking up the Elixir.
;
; This will invoke the IScript, play the sound, and add
; the Elixir to the special items inventory.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     X:
;         Set to the current sprite index.
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpElixir:                        ; [$c864]
    ;
    ; Run the "Got Elixir" IScript.
    ;
    ; IScript 0x86 via jump to IScripts_Begin.
    ;
    LDA #$86                                ; 0x86 == Elixir picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c86c]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Add the Elixir to the inventory.
    ;
    LDA a:SpecialItems                      ; Load the current special items
                                            ; bitmask.
    ORA #$08                                ; Bit 0x08 == Elixir.
    STA a:SpecialItems                      ; Save it back out.
    RTS


;============================================================================
; Handle picking up the Ointment.
;
; This will invoke the IScript, play the sound, and set
; the Ointment state.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     MMC1_LoadBankAndJump
;     Sound_PlayEffect
;     Player_Add100XP
;
; XREFS:
;     Player_PickUp
;============================================================================
Player_PickUpOintment:                      ; [$c87a]
    ;
    ; Run "Got Ointment" IScript.
    ;
    ; IScript 0x94 via jump to IScripts_Begin.
    ;
    LDA #$94                                ; 0x94 == Ointment picked up
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin


    ;
    ; Play the sound effect for picking up an item.
    ;
  @_afterFarJump:                           ; [$c882]
    LDA #$08                                ; 0x08 == Item picked up sound.
    JSR Sound_PlayEffect                    ; Play it.


    ;
    ; Activate the Ointment by setting its duration, and then
    ; add 100XP to the player.
    ;
    ; Duration is initially set to a base of 30, but will be
    ; modified by level separately.
    ;
    LDA #$1e                                ; A = 30 seconds.
    STA a:DurationOintment                  ; Set as the Ointment duration.
    JMP Player_Add100XP                     ; Give the player 100XP.


;============================================================================
; Count down all the player's special items.
;
; This will count down the Hour Glass, Wing Boots,
; Glove, and Ointment durations.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     Game_DecHourGlassDuration
;     Game_DecWingBootsDuration
;     Game_DecGloveDuration
;     Game_DecOintmentDuration
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
GameLoop_CountdownItems:                    ; [$c88f]
    JSR Game_DecHourGlassDuration
    JSR Game_DecWingBootsDuration
    JSR Game_DecGloveDuration
    JMP Game_DecOintmentDuration


;============================================================================
; Decrement the Glove's duration.
;
; INPUTS:
;     DurationGlove:
;         The remaining duration for the glove.
;
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     DurationGlove:
;         The new duration for the glove.
;
; CALLS:
;     MMC1_LoadBankAndJump
;
; XREFS:
;     GameLoop_CountdownItems
;============================================================================
Game_DecGloveDuration:                      ; [$c89b]
    ;
    ; Check if the Glove is active.
    ;
    LDA a:DurationGlove                     ; Load the Glove's duration.
    BMI @_return                            ; If it's 0xFF (not activated),
                                            ; return.


    ;
    ; Check if a second has passed.
    ;
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$3f                                ; Check if it's an even second
                                            ; boundary.
    BNE @_return                            ; If not, return.


    ;
    ; Decrement and check if the Glove is still active.
    ;
    DEC a:DurationGlove                     ; Decrement the Glove's duration
                                            ; by 1 second.
    BPL @_return                            ; If it's >= 0, it's still
                                            ; active. Return.


    ;
    ; Countdown finished.
    ;
    ; Run "Glove is gone" IScript.
    ;
    ; IScript 0x93 via jump to IScripts_Begin.
    ;
    LDA #$93                                ; 0x93 == Glove is gone IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_return:                                 ; [$c8b3]
    RTS


;============================================================================
; Decrement the Ointment's duration.
;
; INPUTS:
;     DurationOintment:
;         The remaining duration for the Ointment.
;
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     DurationOintment:
;         The new duration for the Ointment.
;
; CALLS:
;     MMC1_LoadBankAndJump
;
; XREFS:
;     GameLoop_CountdownItems
;============================================================================
Game_DecOintmentDuration:                   ; [$c8b4]
    ;
    ; Check if the Ointment is active.
    ;
    LDA a:DurationOintment                  ; Load the Ointment's duration.
    BMI @_return                            ; If it's 0xFF (not activated),
                                            ; return.


    ;
    ; Check if a second has passed.
    ;
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$3f                                ; Check if it's an even second
                                            ; boundary.
    BNE @_return                            ; If not, return.


    ;
    ; Decrement and check if the Ointment is still active.
    ;
    DEC a:DurationOintment                  ; Decrement the Ointment's
                                            ; duration by 1 second.
    BPL @_return                            ; If it's >= 0, it's still
                                            ; active. Return.


    ;
    ; Countdown finished.
    ;
    ; Run "Ointment is gone" IScript.
    ;
    ; IScript 0x95 via jump to IScripts_Begin.
    ;
    LDA #$95                                ; 0x95 == Ointment is gone
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_return:                                 ; [$c8cc]
    RTS


;============================================================================
; Pick up a standard item and place it in the inventory.
;
; This will be placed in the last available inventory slot.
; If the inventory is full, this does nothing.
;
; INPUTS:
;     A:
;         The ID of the item to place in the inventory.
;
;     NumberOfItems:
;         The number of items the player has.
;
; OUTPUTS:
;     ItemInventory:
;         The updated item inventory.
;
;     NumberOfItems:
;         The new number of items the player has.
;
; XREFS:
;     Player_PickUpHourGlass
;     Player_PickUpMattock
;     Player_PickUpRedPotion
;     Player_PickUpWingBoots
;============================================================================
Player_PickUpItem:                          ; [$c8cd]
    ;
    ; Check first if the inventory is full.
    ;
    LDX a:NumberOfItems                     ; Load the number of items in the
                                            ; inventory.
    CPX #$08                                ; Is there room?
    BCS @_return                            ; If full, exit.


    ;
    ; There's room. Set the item in the inventory and increment
    ; the item counter.
    ;
    STA ItemInventory,X                     ; Store the item in the next
                                            ; available slot.
    INX                                     ; Set the next available slot.
    STX a:NumberOfItems

  @_return:                                 ; [$c8db]
    RTS


;============================================================================
; Clear the selected item picture from the HUD.
;
; This will loop through the 4 tiles of the selected item
; attribute area in the HUD, setting all to 0.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         New upper bounds of the PPU buffer.
;
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         Clobbered.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Game_UnlockDoorWithUsableItem
;     Player_ClearSelectedItem
;============================================================================
UI_ClearSelectedItemPic:                    ; [$c8dc]
    ;
    ; Set the draw position to 0x13C0 (top-left of selected
    ; item tiles).
    ;
    LDA #$13                                ; A = 0x13
    STA a:PPU_TargetAddr_U                  ; Set as upper byte.
    LDA #$c0                                ; A = 0xC0
    STA a:PPU_TargetAddr                    ; Set as lower byte.


    ;
    ; Begin the draw loop. This will draw 4 tiles of the sprite.
    ; All 4 tiles making up the sprite are adjacent within this
    ; tile attribute.
    ;
    LDX #$04                                ; X = 4 (counter).

  @_vertLoop:                               ; [$c8e8]
    TXA                                     ; A = X
    PHA                                     ; Push A to the stack.


    ;
    ; Set the draw length as 16 bytes (this tile).
    ;
    LDA #$10                                ; A = 16
    JSR PPUBuffer_QueueCommandOrLength      ; Write as the length.
    LDY #$10                                ; Y = 16
    LDA #$00                                ; A = 0

  @_horizLoop:                              ; [$c8f3]
    STA PPUBuffer,X                         ; Write a 0 to the PPU buffer.
    INX                                     ; X++
    DEY                                     ; Y--
    BNE @_horizLoop                         ; If not 0, loop.


    ;
    ; This row is finished. Prepare to draw the next (if any).
    ;
    STX PPUBuffer_WriteOffset               ; Store X as the new upper
                                            ; bounds.
    LDA a:PPU_TargetAddr                    ; A = target address to draw to.
    CLC
    ADC #$10                                ; Increment by 16 (next tile).
    STA a:PPU_TargetAddr                    ; Store as the new lower byte of
                                            ; the target address.
    LDA a:PPU_TargetAddr_U                  ; Load the upper byte.
    ADC #$00                                ; Add the carry flag, if any.
    STA a:PPU_TargetAddr_U                  ; And save it.
    PLA                                     ; Pull A from the stack (full
                                            ; 0..4 loop counter).
    TAX                                     ; X = A
    DEX                                     ; X--
    BNE @_vertLoop                          ; If > 0, loop.
    RTS


;============================================================================
; Main entry point for the game.
;
; This sets up the PPU, clears out the PPU buffer,
; initializes the MMC1 chip, the screen, the music,
; and then sets up the start splash screen.
;
; INPUTS:
;     {@symbl PPUSTATUS}:
;         Read to ensure writes occur in the right order.
;
; OUTPUTS:
;     Temp_0200:
;     PPUBuffer:
;     ScreenBuffer:
;     SPRITE_0_RANGE_1_START:
;     CurrentSprites_InternalBehaviorStates:
;     FirstColumnInRightScreen:
;         Cleared.
;
;     PPUMASK:
;         Cleared.
;
;     PPUCTRL:
;         Set to the initial flags for writing.
;
; CALLS:
;     Game_InitMMCAndBank
;     Game_InitScreenAndMusic
;     Game_InitStateForStartScreen
;
; XREFS:
;     IScriptAction_FinishGame
;============================================================================
Game_Init:                                  ; [$c913]
    SEI
    CLD
    LDX #$ff                                ; X = 0xFF
    TXS                                     ; Push to stack.


    ;
    ; Set the PPU settings.
    ;
    ; For PPUMASK:
    ;
    ; * Color
    ; * Show background and sprites in leftmost 8 pixels
    ;
    ;
    ; For PPUCTRL:
    ;
    ; * Base nametable address = 0x2000
    ; * VRAM address increment per CPU read/write: add 1, going across
    ; * Sprite pattern table address for 8x8 sprites: 0x1000
    ; * Background pattern table address: 0x1000
    ; * Sprite size: 8x8 pixels
    ; * PPU master/slave select: Read backdrop from EXT pins
    ; * Vblank NMI disabled
    ;
    LDA #$00                                ; A = 0
    STA a:PPUMASK                           ; Set as the PPU mask.
    LDA #$18                                ; A = 0x18
    STA a:PPUCTRL                           ; Set as the PPU control.


    ;
    ; Read the PPUSTATUS register several times before writing.
    ;
    ; NESdev says this is common to ensure writes occur in the
    ; correct order.
    ;
    LDA a:PPUSTATUS                         ; Read PPU status.

  @_readPPUStatus1:                         ; [$c925]
    LDA a:PPUSTATUS                         ; Read PPU status.
    BPL @_readPPUStatus1                    ; If > -1, loop.

  @_readPPUStatus2:                         ; [$c92a]
    LDA a:PPUSTATUS                         ; Read PPU status.
    BPL @_readPPUStatus2                    ; If > -1, loop.


    ;
    ; Set PPUMASK to 0 to allow transferring large amounts of
    ; Data to VRAM.
    ;
    LDA #$00                                ; A = 0
    STA a:PPUMASK                           ; Set as the PPU mask.
    LDX #$ff                                ; X = 0xFF
    TXS                                     ; Transfer to stack.


    ;
    ; Clear RAM, setting all ranges of bytes used for state to 0.
    ;
    LDX #$00                                ; X = 0 (loop counter)

  @_loop:                                   ; [$c939]
    CPX #$fc                                ; Is X >= 252?
    BCS @_clearState                        ; If so, jump.
    STA Temp_00,X                           ; Clear memory at address X.

  @_clearState:                             ; [$c93f]
    STA Temp_0200,X                         ; Clear memory at $0200 + X
    STA CurrentSprites_InternalBehaviorStates_4_,X ; Clear memory at $0300 +
                                                   ; X
    STA FirstColumnInRightScreen_10_,X      ; Clear memory at $0400 + X
    STA PPUBuffer,X                         ; Clear memory at $0500 + X
    STA ScreenBuffer,X                      ; Clear memory at $0600 + X
    STA SPRITE_0_RANGE_1_START,X            ; Clear memory at $0700 + X
    INX                                     ; X++
    BNE @_loop                              ; If X != 0, loop.
    JSR Game_InitMMCAndBank                 ; Initialize the MMC1 chip and
                                            ; bank.
    JSR Game_InitScreenAndMusic             ; Initialize the screen and
                                            ; music.
    JMP Game_InitStateForStartScreen        ; Initialize the start screen.


    ;
    ; Check whether the OAM needs to be reset.
    ;
    ;
    ; XREFS:
    ;     OnInterrupt
    ;
OnInterrupt__updatePPUOAMAndAudio:          ; [$c95d]
    LDA Game_NeedOAMReset                   ; Check the reset flag.
    BEQ OnInterrupt__updatePPUAndAudio      ; If 0, don't reset. Jump to
                                            ; PPU/audio management.
    LDA #$00
    STA a:OAMADDR                           ; Reset OAMADDR to 0.
    STA Game_NeedOAMReset                   ; Clear the reset flag.
    LDA #$07
    STA a:OAMDMA                            ; Initialize the OAM, writing
                                            ; from $0700.


    ;
    ; Update the PPU.
    ;
    ;
    ; XREFS:
    ;     OnInterrupt
    ;
OnInterrupt__updatePPUAndAudio:             ; [$c96d]
    JSR PPU_HandleOnInterrupt               ; Run PPU on-interrupt handlers.


    ;
    ; Update the audio so music keeps playing.
    ;
    ;
    ; XREFS:
    ;     OnInterrupt
    ;
OnInterrupt__updateAudio:                   ; [$c970]
    INC InterruptCounter                    ; Increment the interrupt
                                            ; counter.
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$05
    JSR MMC1_EnsurePRG                      ; Switch to bank 5.
    JSR thunk_Music_HandleOnInterrupt       ; Run audio interrupt handlers.
    JSR thunk_SoundEffects_HandleOnInterrupt ; Run sound playback interrupt
                                             ; handlers.
    PLA                                     ; Pop the bank from the stack.
    TAX
    JSR MMC1_EnsurePRG                      ; Switch back to the bank.
    JMP OnInterrupt__popAndReturn           ; Prepare to exit the interrupt
                                            ; handler.


    ;
    ; Main interrupt handling code won't be run. Update the
    ; paused interrupt counter state and clear the PPU mask
    ; to enable transfering large amounts of data to VRAM.
    ;
    ;
    ; XREFS:
    ;     OnInterrupt
    ;
OnInterrupt__noProcessInterrupts:           ; [$c989]
    LDX PauseInterruptCounter               ; Load the interrupt counter.
    CPX #$02                                ; Is it < 2?
    BCS @_clearPPUMask                      ; If so, jump.
    INC PauseInterruptCounter               ; Increment the counter.

  @_clearPPUMask:                           ; [$c991]
    LDA #$00
    STA a:PPUMASK                           ; Clear PPUMASK.
    JMP OnInterrupt__updateAudio            ; Update the audio.


;============================================================================
; Main interrupt handler for the game.
;
; This controls PPU interactions, audio playback, and
; controller input. Normally, these will run every
; two frames.
;
; Processing of these can be enabled or disabled
; by other code as needed by other code by setting
; Game_InterruptHandlersEnabled and
; Game_NeedOAMReset.
;
; Even if main input handlers are disabled, this will
; generally write to the PPU and play audio (so music
; doesn't skip).
;
; INPUTS:
;     Game_InterruptHandlersEnabled:
;         Whether to run game state interrupt handlers.
;
;     PauseInterruptCounter:
;         A counter indicating if interrupt handlers have
;         been paused (range 0..2).
;
;     Game_InterruptsHandledLatch:
;         The current frame toggle. Game state interrupt
;         handlers will only be run if 0.
;
;     InterruptCounter:
;         The current interrupt counter to increment.
;
;     Game_NeedOAMReset:
;         If > 0, OAM will be reset.
;
; OUTPUTS:
;     PPUMASK:
;         May be cleared.
;
;     Game_InterruptsHandledLatch:
;         May be set to 1 to skip the next frame.
;
;     InterruptCounter:
;         The updated interrupt counter.
;
;     PauseInterruptCounter:
;         Incremented if interrupt handlers are paused
;         (capped to 2).
;
;     Game_NeedOAMReset:
;     OAMADDR
;         May be set to 0.
;
;     OAMDMA:
;         May be set to 7.
;
; CALLS:
;     MMC1_EnsurePRG
;     Music_HandleOnInterrupt
;     Input_HandleOnInterrupt
;     PPU_HandleOnInterrupt
;     SoundEffects_HandleOnInterrupt
;============================================================================
OnInterrupt:                                ; [$c999]
    ;
    ; Push all registers to the stack.
    ;
    PHA                                     ; Push A to the stack.
    TXA                                     ; Set A = X.
    PHA                                     ; Push A (X) to the stack.
    TYA                                     ; Set A = Y.
    PHA                                     ; Push A (Y) to the stack.


    ;
    ; Check what will be handled this interrupt.
    ;
    LDA Game_InterruptHandlersEnabled       ; Check whether interrupt
                                            ; handling code should be run.
    BEQ OnInterrupt__noProcessInterrupts    ; If not, jump.


    ;
    ; Interrupts may be run. See if it's time to run them.
    ;
    LDA Game_InterruptsHandledLatch         ; Check if we're on a frame where
                                            ; we should run interrupts.
    BNE OnInterrupt__updatePPUOAMAndAudio   ; Jump to update the PPU, OAM,
                                            ; and Audio.


    ;
    ; Ready to handle routine operations.
    ;
    INC Game_InterruptsHandledLatch         ; Flip the toggle.


    ;
    ; Reset the OAM.
    ;
    ; This will write $00 to OAMADDR and then use OAMDMA.
    ;
    LDA #$00
    STA a:OAMADDR                           ; Clear OAMADDR.
    STA Game_NeedOAMReset                   ; Turn off the reset flag.
    LDA #$07
    STA a:OAMDMA                            ; Initialize the OAM, writing
                                            ; from
                                            ; SPRITE_0_RANGE_1_START
                                            ; ($0700).


    ;
    ; Update the PPU state.
    ;
    JSR PPU_HandleOnInterrupt


    ;
    ; Switch to bank 5 (audio logic) and run audio updates.
    ;
    LDA a:CurrentROMBank                    ; Load the current bank.
    PHA                                     ; Push it to the stack.
    LDX #$05
    JSR MMC1_EnsurePRG                      ; Switch to bank 5.
    JSR thunk_Music_HandleOnInterrupt       ; Run audio interrupt handling
                                            ; code.
    JSR thunk_SoundEffects_HandleOnInterrupt ; Run sound playback interrupt
                                             ; handling code.
    PLA                                     ; Pop the previous bank from the
                                            ; stack.
    TAX
    JSR MMC1_EnsurePRG                      ; Switch back to it.


    ;
    ; Handle input management and final state.
    ;
    JSR Input_HandleOnInterrupt             ; Run input interrupt handlers.
    INC InterruptCounter                    ; Increment the interrupt
                                            ; counter.


    ;
    ; Restore all registers from the stack.
    ;
    ;
    ; XREFS:
    ;     OnInterrupt
    ;
OnInterrupt__popAndReturn:                  ; [$c9d0]
    PLA                                     ; Pull A from the stack.
    TAY                                     ; Set Y = A
    PLA                                     ; Pull A from the stack.
    TAX                                     ; Set X = A
    PLA                                     ; Pull A from the satck

OnHardwareInterrupt:                        ; [$c9d5]
    RTI                                     ; Return from interrupt


;============================================================================
; Update the PPU on interrupt.
;
; This will run any screen scroll handlers, ensure the right
; PPU flags pertaining to scroll, and then set the new scroll
; screen and offsets.
;
; INPUTS:
;     PPU_Mask:
;         The screen mask to set.
;
;     PPU_ControlFlags:
;         The saved PPU control flags.
;
;     Sprites_Sprite0Mode:
;         The current sprite 0 placement mode for the
;         screen, dictating the flags to set.
;
;     PPU_ScrollScreen:
;         The scroll screen to set.
;
;     PPU_ScrollX:
;         The horizontal scroll offset to set.
;
; OUTPUTS:
;     PPUCTRL:
;     PPUMASK:
;     PPUSCROLL:
;         The updated PPU state.
;
; CALLS:
;     PPUBuffer_Draw
;     Screen_RunWriteScrollDataHandler
;
; XREFS:
;     OnInterrupt
;============================================================================
PPU_HandleOnInterrupt:                      ; [$c9d6]
    ;
    ; Handle any scrolling-related screen updates and flush
    ; the PPU buffer to the screen.
    ;
    JSR Screen_RunWriteScrollDataHandler    ; Run the handler for any screen
                                            ; scrolling.
    JSR PPUBuffer_Draw                      ; Flush the PPU buffer to the
                                            ; screen.
    LDA PPU_Mask                            ; Load the stored PPU mask.
    STA a:PPUMASK                           ; And set it on the PPU.
    LDA Sprites_Sprite0Mode                 ; Load the sprite 0 mode.
    BMI @_setScroll                         ; If 0xFF (no sprite 0), jump.
    LDA PPU_ForceLowerPatternTables         ; Load the Force Lower Pattern
                                            ; Tables setting.
    BEQ @_clearNametable2400                ; If not forcing, then jump.


    ;
    ; Clear the following flags:
    ;
    ; * Nametable 2400
    ; * Sprite pattern 1000
    ; * BGTable Addr 1000
    ;
    LDA PPU_ControlFlags                    ; Load the saved PPU control
                                            ; flags.
    AND #$e6                                ; Clear flags.
    STA a:PPUCTRL                           ; Set it on the PPU.
    JMP @_resetScroll                       ; Jump to update scroll
                                            ; positions.


    ;
    ; Clear the Nametable 2400 flag.
    ;
  @_clearNametable2400:                     ; [$c9f3]
    LDA PPU_ControlFlags
    AND #$fe
    STA a:PPUCTRL


    ;
    ; Reset the screen scroll.
    ;
  @_resetScroll:                            ; [$c9fa]
    LDA #$00
    STA a:PPUSCROLL                         ; Clear horizontal screen scroll.
    STA a:PPUSCROLL                         ; Clear vertical screen scroll.


    ;
    ; Wait until sprite 0 isn't hit in the sprite update.
    ;
  @_waitSprite0NotHitLoop:                  ; [$ca02]
    BIT a:PPUSTATUS                         ; Test the Sprite 0 Hit flag.
    BVS @_waitSprite0NotHitLoop             ; If set, loop.


    ;
    ; Now wait until it is hit.
    ;
  @_waitSprite0Hit:                         ; [$ca07]
    BIT a:PPUSTATUS                         ; Test the Sprite 0 Hit flag.
    BVC @_waitSprite0Hit                    ; if not set, loop.


    ;
    ; Loop 160 times, giving the screen time to update.
    ;
    LDX #$a0                                ; X = 160 (loop counter).

  @_loop160Times:                           ; [$ca0e]
    DEX                                     ; X--
    BNE @_loop160Times                      ; If > 0, loop.


    ;
    ; Set the scroll state for the PPU.
    ;
    ; This will set the nametable for the scroll screen and
    ; set the horizontal scroll offset. Vertical will stay 0.
    ;
  @_setScroll:                              ; [$ca11]
    LDA PPU_ScrollScreen                    ; Load the current scroll screen.
    AND #$01                                ; Convert to an even/odd value (0
                                            ; or 1) to select the nametable.
    ORA PPU_ControlFlags                    ; OR with the PPU controls.
    STA a:PPUCTRL                           ; Store as the new PPU control
                                            ; flags.
    LDA PPU_ScrollX                         ; Load the calculated scroll X.
    STA a:PPUSCROLL                         ; Write as the horizontal scroll
                                            ; offset.
    LDA #$00                                ; Hard-code scroll Y as 0.
    STA a:PPUSCROLL                         ; Write as the vertical scroll
                                            ; offset.
    RTS


;============================================================================
; Wait for the next frame.
;
; This will wait for the next frame, looping until
; the frame change occurs.
;
; INPUTS:
;     Game_InterruptsHandledLatch:
;         The frame toggle flag.
;
; OUTPUTS:
;     None
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;     PasswordScreen_WaitForInput
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     EndGame_Begin
;     EndGame_MainLoop
;     GameLoop_CheckPauseGame
;     Game_MainLoop
;     Game_SetupAndLoadOutsideArea
;     Game_SetupEnterBuilding
;     Game_SetupEnterScreen
;     Game_SetupExitBuilding
;     Game_SetupNewArea
;     Game_ShowStartScreen
;     Game_Start
;     Player_FillHPAndMP
;     Player_HandleDeath
;     Player_UseMattock
;     Player_UseRedPotion
;============================================================================
WaitForNextFrame:                           ; [$ca25]
    LDA #$00                                ; A = 0
    STA Game_InterruptsHandledLatch         ; Set as the frame toggle state.

  @_loop:                                   ; [$ca29]
    LDA Game_InterruptsHandledLatch         ; Load the frame toggle state
                                            ; from the interrupt handler.
    BEQ @_loop                              ; If it's 0, loop.
    RTS                                     ; Else, return.


;============================================================================
; Wait for the next interrupt.
;
; This will loop until the interrupt counter has changed.
;
; INPUTS:
;     InterruptCounter:
;         The interrupt counter.
;
; OUTTPUTS:
;     None
;
; XREFS:
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_HandleDeath
;     Screen_FadeToBlack
;============================================================================
WaitForInterrupt:                           ; [$ca2e]
    LDA InterruptCounter                    ; Load the interrupt count.

  @_loop:                                   ; [$ca30]
    CMP InterruptCounter                    ; Has the interrupt counter
                                            ; changed?
    BEQ @_loop                              ; If not, loop.
    RTS


;============================================================================
; Handle input management on interrupt.
;
; This will read from the controller ports, storing
; the current button bitmasks and determining which buttons
; have been held down and which have changed since the last
; time the interrupt handler was run.
;
; Controller 2 is read for the purpose of the debug level
; switch code at Debug_ChooseArea.
;
; INPUTS:
;     JOY1:
;     JOY2:
;         The controller inputs.
;
;     Joy1_ButtonMask:
;         The previous controller 1 button mask.
;
; OUTPUTS:
;     Joy1_ButtonMask:
;         The new controller 1 button mask.
;
;     Joy1_ChangedButtonMask:
;         The buttons that changed since the last interrupt.
;
;     Joy1_PrevButtonMask:
;         The buttons held down since last interrupt.
;
;     Joy2_ButtonMask:
;         The new controller 2 button mask.
;
; XREFS:
;     OnInterrupt
;============================================================================
Input_HandleOnInterrupt:                    ; [$ca35]
    ;
    ; Store the current button mask as the new previous button mask.
    ;
    LDA Joy1_ButtonMask                     ; A = Stored controller 1 button
                                            ; mask
    STA Joy1_PrevButtonMask                 ; Store as the previous button
                                            ; mask.


    ;
    ; Prepare to read the controller state.
    ;
    LDA #$01                                ; A = 1
    STA a:JOY1                              ; Trigger loading controller 1
                                            ; bits.
    LDA #$00
    STA a:JOY1                              ; Prepare for read.
    STA Joy1_ButtonMask                     ; Reset controller 1 button mask
                                            ; to 0.
    STA Joy2_ButtonMask                     ; Reset controller 2 button mask
                                            ; to 0.


    ;
    ; Read the controller 1 state into the button mask.
    ;
    LDX #$08                                ; X = 8 (loop counter)

  @_loop1:                                  ; [$ca49]
    LDA a:JOY1                              ; A = Current controller 1 state.
    AND #$03                                ; Take the first two bits.
    LSR A                                   ; Shift right 1. Bit 0 goes into
                                            ; Carry.
    ROL Joy1_ButtonMask                     ; Rotate the target bitmask left,
                                            ; moving Carry into bit 0.
    ORA Joy1_ButtonMask                     ; OR to the generated bitmask.
    STA Joy1_ButtonMask                     ; Store as the new button mask.
    DEX                                     ; X--
    BNE @_loop1                             ; If > 0, loop.


    ;
    ; Read the controller 2 state into the button mask.
    ;
    ; This is only used for the debug level skip code.
    ;
    LDX #$08                                ; X = 8 (loop counter).

  @_loop2:                                  ; [$ca5a]
    LDA a:JOY2                              ; A = Current controller 2 state.
    AND #$01                                ; Take the first bit.
    LSR A                                   ; Shift right 1. Bit 0 goes into
                                            ; Carry.
    ROL Joy2_ButtonMask                     ; Rotate the target bitmask left,
                                            ; moving Carry into bit 0.
    DEX                                     ; X--
    BNE @_loop2                             ; If > 0, loop.


    ;
    ; Compute the changed button mask between the last read and now.
    ;
    LDA Joy1_ButtonMask                     ; Load the controller 1 button
                                            ; mask.
    EOR Joy1_PrevButtonMask                 ; XOR with the
                                            ; previously-changed, yielding
                                            ; the button differences.
    AND Joy1_ButtonMask                     ; AND with the new button mask.
    STA Joy1_ChangedButtonMask              ; And store as the changed button
                                            ; mask.
    RTS


;============================================================================
; Return a pseudo-random value.
;
; Every time this is called, a new pseudo-random value will
; be returned.
;
; The set of random values is the first 256 bytes of bank
; 14. If any buttons are pressed, the button bitmask will
; affect the random value (the result value and button
; bitmask is XOR'd).
;
; INPUTS:
;     Random_Offset:
;         The current offset into the bank.
;
;     Joy1_ButtonMask:
;         The controller 1 button mask.
;
; OUTPUTS:
;     A:
;         The pseudo-random value.
;
;     Random_Offset:
;         The incremented offset (which will wrap from 0xFF
;         to 0x00).
;
; XREFS:
;     BScript_Action_RandomlyFlipXDirection
;     BScript_Action_RandomlyFlipYDirection
;============================================================================
GetRandom:                                  ; [$ca6e]
    LDX Random_Offset                       ; Load the current offset into
                                            ; the bank.
    LDA Sprites_UpdateAll,X                 ; Load the byte value at that
                                            ; offset.
    EOR Joy1_ButtonMask                     ; XOR with the controler 1 button
                                            ; mask.
    INC Random_Offset                       ; Increment the offset.
    RTS


;============================================================================
; Initialize all the game state.
;
; This is called early at startup to set initial state
; for the game, including the PPU, scroll positions,
; PPU attribute tables, sound, sound effects, pause flag,
; and more.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     PPU_ControlFlags:
;         The updated PPU control flags.
;
;     PPU_ScrollX:
;         The scroll X position (set to 0).
;
;     PPU_ScrollY:
;         The scroll Y position (set to 0).
;
;     PPU_ScrollScreen:
;         The new scroll screen (set to 0).
;
;     PPU_Mask:
;         The new screen color mode.
;
;     Game_PausedState:
;         Set to 0 (false).
;
;     Maybe_Game_Ready:
;         Set to 0 (false).
;
;     PPU_ForceLowerPatternTables:
;         Set to 0 (false).
;
;     Game_InterruptHandlersEnabled:
;         Set to 0 (false).
;
;     Game_InterruptsHandledLatch:
;         Set to 0 (false).
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPU_InitAttributeAndNameTables
;     PPU_InitVBlank
;     Screen_ResetSpritesForNonGame
;     thunk_SoundEffects_Init
;     thunk_Audio_InitPlayingState
;
; XREFS:
;     Game_Init
;============================================================================
Game_InitScreenAndMusic:                    ; [$ca78]
    ;
    ; Initialize PPU settings.
    ;
    LDA #$10
    STA PPU_ControlFlags                    ; Set PPU control flags to
                                            ; BGTable and Address $1000.
    LDA #$00
    STA PPU_ScrollX                         ; Clear scroll X.
    STA PPU_ScrollScreen                    ; Clear scroll screen.
    STA PPU_ScrollY                         ; Clear scroll Y.
    LDA #$1e
    STA PPU_Mask                            ; Set screen color mode to enable
                                            ; sprites, BG, and showing
                                            ; left-most 8 pixels.
    JSR Screen_ResetSpritesForNonGame       ; Reset sprites for a non-game
                                            ; screen.
    JSR PPU_InitAttributeAndNameTables      ; Initialize attributes and
                                            ; nametables.


    ;
    ; Stop any interrupt handling for the game.
    ;
    LDA #$00
    STA Game_InterruptHandlersEnabled       ; Disable interrupt handlers.
    STA a:Maybe_Game_Ready                  ; Disable the game ready state.


    ;
    ; Switch to bank 5 and set up sound.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$05                                ; Bank 5 = Sound.
    JSR MMC1_UpdateROMBank                  ; Switch to it.
    JSR thunk_Audio_InitPlayingState        ; Initialize the sound play
                                            ; state.
    JSR thunk_SoundEffects_Init             ; Initialize sound.
    PLA                                     ; Pop the previous bank from the
                                            ; stack.
    TAX                                     ; X = previous bank.
    JSR MMC1_UpdateROMBank                  ; And switch back to it.


    ;
    ; Re-enable the game.
    ;
    LDA #$00
    STA Game_InterruptsHandledLatch         ; Disable the interrupt handlers
                                            ; latch.
    STA a:Game_PausedState                  ; Disable the pause state.
    STA PPU_ForceLowerPatternTables         ; Disable forcing lower pattern
                                            ; tables.
    JMP PPU_InitVBlank                      ; Initialize VBlank.


;============================================================================
; Set the PPU address to the specified value.
;
; INPUTS:
;     A:
;         The upper byte of the address.
;
;     X:
;         The lower byte of the address.
;
; OUTPUTS:
;     PPUADDR:
;         The updated address.
;
; XREFS:
;     PPU_InitAttributeAndNameTables
;============================================================================
PPU_SetAddr:                                ; [$cab5]
    STA a:PPUADDR                           ; Set the upper byte.
    STX a:PPUADDR                           ; Set the lower byte.
    RTS

;============================================================================
; TODO: Document PPU_InitAttributeAndNameTables
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
PPU_InitAttributeAndNameTables:             ; [$cabc]
    LDA #$20
    STA Temp_PPU_NameTableValue


    ;
    ; Set address 0x2000: Name table 0.
    ;
    ; Write 32 to 8 bytes.
    ;
    LDA #$20
    LDX #$00
    JSR PPU_SetAddr
    LDY #$08
    LDX #$00
    LDA Temp_PPU_NameTableValue
    JSR PPU_FillGrid


    ;
    ; Set address 0x23C0: Attribute table 0.
    ;
    ; Write 64 entries of byte 0x55 to the table. This is color bit 01
    ; for each quadrant of each sprite.
    ;
    LDA #$23
    LDX #$c0
    JSR PPU_SetAddr
    LDX #$40
    LDY #$01
    LDA #$55
    JSR PPU_FillGrid


    ;
    ; Set address 0x27C0: Attribute table 1.
    ;
    ; Write 64 entries here with the same information.
    ;
    LDA #$27
    LDX #$c0
    JSR PPU_SetAddr
    LDX #$40
    LDY #$01
    LDA #$55

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Fills a grid in the PPU with a value.
;
; This writes a value to the PPU up to X times, and then
; again 256 * Y times.
;
; This seems a bit strange, but in practice it's never
; really used this way. Always 256 columns for every row,
; or only ever one row.
;
; INPUTS:
;     A:
;         The value to write.
;
;     X:
;         Initial number of columns for the first row
;         (256 columns per row after).
;
;     Y:
;         The number of rows.
;
; OUTPUTS:
;     PPUDATA:
;         Updated with the new written data.
;
; XREFS:
;     PPU_FillGrid
;     PPU_InitAttributeAndNameTables
;============================================================================
PPU_FillGrid:                               ; [$caed]
    STA a:PPUDATA                           ; Write the value to PPUDATA.
    DEX                                     ; X--
    BNE PPU_FillGrid                        ; If X > 0, loop.


    ;
    ; An inner loop was finished. Decrement and begin again.
    ;
    ; It appears it should write 256 more times on this iteration.
    ;
    DEY                                     ; Y--
    BNE PPU_FillGrid                        ; If Y > 0, loop
    RTS


;============================================================================
; Wait until all buffered data to the PPU is flushed.
;
; INPUTS:
;     PPUBuffer_WriteOffset:
;         The upper bounds of the PPU buffer to write.
;
;     PPUBuffer_ReadOffset:
;         The current offset within the PPU buffer to write.
;
; OUTPUTS:
;     None
;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     StartScreen_Draw
;     Game_InitStateForSpawn
;     Game_MainLoop
;     Game_SetupAndLoadOutsideArea
;     Game_SetupEnterBuilding
;     Game_SetupEnterScreen
;     Game_SetupExitBuilding
;     Game_SetupNewArea
;     Game_Start
;     PPU_WaitUntilFlushed
;============================================================================
PPU_WaitUntilFlushed:                       ; [$caf7]
    ;
    ; Wait until the PPU buffer has been emptied (flushed to the
    ; PPU).
    ;
    LDA PPUBuffer_WriteOffset               ; Load the upper bounds of the
                                            ; PPU buffer.
    CMP PPUBuffer_ReadOffset                ; Has the read offset hit the
                                            ; upper bounds?
    BNE PPU_WaitUntilFlushed                ; If not, loop until it's
                                            ; cleared.


    ;
    ; Pause interrupt handling for 2 interrupts.
    ;
    LDA #$00
    STA PauseInterruptCounter               ; Reset the paused interrupt
                                            ; counter.
    STA Game_InterruptHandlersEnabled       ; Disable processing of
                                            ; interrupts.
    STA PPU_ForceLowerPatternTables


    ;
    ; Wait for 2 interrupts (at least).
    ;
  @_waitForInterruptLoop:                   ; [$cb05]
    LDA PauseInterruptCounter               ; Load the paused interrupt
                                            ; counter.
    CMP #$02                                ; Has it reached 2 interrupts?
    BCC @_waitForInterruptLoop              ; If not, loop.
    RTS


;============================================================================
; DEADCODE
;
; XREFS:
;     DEADCODE_FUN_PRG15_MIRROR__cb0c
;============================================================================
DEADCODE_FUN_PRG15_MIRROR__cb0c:            ; [$cb0c]
    LDA a:PPUSTATUS
    BMI DEADCODE_FUN_PRG15_MIRROR__cb0c

  @LAB_PRG15_MIRROR__cb11:                  ; [$cb11]
    LDA a:PPUSTATUS
    BPL @LAB_PRG15_MIRROR__cb11
    RTS


;============================================================================
; Reset the screen for game play mode.
;
; This is called to reset the sprites state and enable
; interrupt handlers for game play screens.
;
; This is called when entering/exiting buildings or
; switching areas.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Game_InterruptHandlersEnabled:
;         Set to 1 (true).
;
; CALLS:
;     Screen_ResetSpritesForGamePlay
;
; XREFS:
;     Game_MainLoop
;     Game_SetupAndLoadOutsideArea
;     Game_SetupEnterBuilding
;     Game_SetupEnterScreen
;     Game_SetupExitBuilding
;     Game_SetupNewArea
;     Game_Start
;============================================================================
Screen_ResetForGamePlay:                    ; [$cb17]
    JSR Screen_ResetSpritesForGamePlay      ; Reset the sprites for game play
                                            ; mode.
    LDA #$01
    STA Game_InterruptHandlersEnabled       ; Enable interrupt handlers.
    RTS


;============================================================================
; DEADCODE
;============================================================================
DEADCODE_FUN_PRG15_MIRROR__cb1f:            ; [$cb1f]
    JSR DEADCODE_Sprites_ResetForDefaultsMode1
    LDA #$01
    STA Game_InterruptHandlersEnabled
    RTS


;============================================================================
; Reset the screen for non-game mode.
;
; This is called to reset the sprites state and enable
; interrupt handlers for non-game screens. That includes:
;
; * The title screen.
; * The password screen.
; * Intro animation.
; * Outro (end game) animation.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Game_InterruptHandlersEnabled:
;         Set to 1 (true).
;
; CALLS:
;     Screen_ResetSpritesForNonGame
;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     StartScreen_Draw
;============================================================================
Screen_ResetForNonGame:                     ; [$cb27]
    JSR Screen_ResetSpritesForNonGame       ; Reset the sprites for a
                                            ; non-game mode.
    LDA #$01
    STA Game_InterruptHandlersEnabled       ; Enable interrupt handlers.
    RTS


;============================================================================
; Initialize VBlank for the PPU.
;
; INPUTS:
;     PPU_ControlFlags:
;         The current PPU control flags.
;
; OUTPUTS:
;     PPU_ControlFlags:
;         The updated PPU control flags.
;
; XREFS:
;     Game_InitScreenAndMusic
;============================================================================
PPU_InitVBlank:                             ; [$cb2f]
    ;
    ; Enable VBlank NMI.
    ;
    LDA PPU_ControlFlags                    ; Load the PPU control flags.
    ORA #$80                                ; Enable the VBlank bit.
    BNE @_savePPUCtrl                       ; If not 0, jump. (DEADCODE: It
                                            ; will never be 0, so always
                                            ; jump).


    ;
    ; DEADCODE: Disable VBlank NMI.
    ;
    ; We should never actually end up here, since the
    ; value we compare against 0 above is always at least
    ; 0x80.
    ;
    LDA PPU_ControlFlags
    AND #$7f


    ;
    ; Write our copy of the bitmask and set on the PPU.
    ;
  @_savePPUCtrl:                            ; [$cb39]
    STA PPU_ControlFlags                    ; Store the saved PPU control
                                            ; flags.
    STA a:PPUCTRL                           ; Store the flags in the PPU.
    RTS


;============================================================================
; DEADCODE
;
; XREFS:
;     DEADCODE_FUN_PRG15_MIRROR__cb1f
;============================================================================
DEADCODE_Sprites_ResetForDefaultsMode1:     ; [$cb3f]
    LDA #$01
    STA Sprites_Sprite0Mode
    STA PPU_ForceLowerPatternTables
    BNE Sprites_Reset

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Reset sprite content for a gameplay screen.
;
; This will set sprite 0 to X=8, Y=23 (where the "P"
; symbol is placed for health), disable forcing
; lower pattern tables, and then reset the sprites.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Sprites_Sprite0Mode:
;         Set to mode 0 (X=8, Y=23).
;
;     PPU_ForceLowerPatternTables:
;         Set to 0 (false).
;
; CALLS:
;     Sprites_Reset
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     EndGame_Begin
;     EndGame_MainLoop
;     Game_MainLoop
;     Game_WaitForOAMReset
;     Player_HandleDeath
;     Screen_ResetForGamePlay
;============================================================================
Screen_ResetSpritesForGamePlay:             ; [$cb47]
    LDA #$00
    STA Sprites_Sprite0Mode                 ; Set sprite 0 to X=8, Y=23.
    STA PPU_ForceLowerPatternTables         ; Disable forcing lower pattern
                                            ; tables.
    BEQ Sprites_Reset                       ; Reset sprites. This will always
                                            ; jump.


;============================================================================
; Reset sprite content for a non-gameplay screen.
;
; This will remove sprite 0 and clear out the sprite slots.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A:
;         The start of the slot range for new sprites.
;
;     Sprites_Sprite0Mode:
;         Set to 0xFF (no sprite 0).
;
;     Sprites_PPUOffset:
;     Sprites_Unused_0034:
;     Sprites_Unused_0035:
;     Sprites_Unused_0037:
;     Sprites_Unused_0038:
;     Sprites_SlotsFull:
;         Cleared.
;
;     SPRITE_0_RANGE_1_START:
;         The cleared sprite information.
;
;     Sprites_StartSlotRange:
;         The start of the slot range for sprites. This will
;         be 0 or 32.
;
; CALLS:
;     Sprites_Reset
;
; XREFS:
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;     PasswordScreen_WaitForInput
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     Game_InitScreenAndMusic
;     Game_ShowStartScreen
;     Screen_ResetForNonGame
;============================================================================
Screen_ResetSpritesForNonGame:              ; [$cb4f]
    LDA #$ff                                ; A = 0xFF (no sprite 0)
    STA Sprites_Sprite0Mode                 ; Store it.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Reset the state for the sprites on screen.
;
; This will clear out the sprite slots, fill out all
; available sprite information in the OAM with default
; values, and optionally add a sprite 0.
;
; Sprite 0 will be added if Sprites_Sprite0Mode
; is 0 or 1. This is used for Sprite 0 hits (see
; https://www.nesdev.org/wiki/PPU_OAM#Sprite_0_hits).
;
; In practice, only mode 0 is used. 1 seems to be a
; hold-over from an earlier design.
;
; INPUTS:
;     Sprites_Sprite0Mode:
;         The mode used for sprite 0 defaults.
;
;     SPRITES_START_XY:
;         The X, Y positions for sprite 0, based on the
;         defaults mode.
;
; OUTPUTS:
;     SPRITE_0_RANGE_1_START:
;         The populated sprite information.
;
;     Sprites_StartSlotRange:
;         The start of the slot range for sprites. This will
;         be 0 or 32.
;
;     Sprites_PPUOffset:
;     Sprites_SlotsFull:
;     Sprites_Unused_0034:
;     Sprites_Unused_0035:
;     Sprites_Unused_0037:
;     Sprites_Unused_0038:
;         Cleared to 0.
;
; XREFS:
;     DEADCODE_Sprites_ResetForDefaultsMode1
;     Screen_ResetSpritesForGamePlay
;============================================================================
Sprites_Reset:                              ; [$cb53]
    ;
    ; Reset state.
    ;
    ; Some of this seem to be remnants from an older design.
    ;
    LDY #$00                                ; Y = 0
    STY Sprites_PPUOffset                   ; Sprites_PPUOffset
                                            ; = 0
    STY Sprites_Unused_0034                 ; Sprites_Unused_0034
                                            ; = 0
    STY Sprites_Unused_0035                 ; Sprites_Unused_0035
                                            ; = 0
    STY Sprites_Unused_0038                 ; Sprites_Unused_0038
                                            ; = 0
    STY Sprites_Unused_0037                 ; Sprites_Unused_0037
                                            ; = 0
    STY Sprites_SlotsFull                   ; Set sprite slots to not be
                                            ; full.
    STY Sprites_SpriteSlot                  ; Set the starting sprite slot to
                                            ; 0.
    LDA Sprites_Sprite0Mode                 ; Load our byte from before.


    ;
    ; Check whether sprite 0 should be hard-coded.
    ;
    BMI @_beginFillSpriteSlots              ; If 0xFF, then jump.
    INC Sprites_SpriteSlot                  ; Increment the sprite slot
                                            ; (start new sprites at sprite
                                            ; 1).
    TAY                                     ; Y = A (index)


    ;
    ; Set the sprite 0 to:
    ;
    ;     X =  8 if Sprites_Sprite0Mode is 0
    ;          0 if Sprites_Sprite0Mode is 1
    ;     Y = 23 if Sprites_Sprite0Mode is 0
    ;         72 if Sprites_Sprite0Mode is 1
    ;     Tile ID = 127
    ;     Attributes = Palette 3, background priority
    ;
    ; NOTE: Sprites_Sprite0Mode is never 1 in the shipped game.
    ;
    ; When 0, this will be the location of the "P" symbol for the
    ; HP bar.
    ;
    LDA SPRITES_START_XY,Y                  ; Load the Y for the sprite.
    STA a:SPRITE_0_RANGE_1_START            ; Store for sprite 0's Y.
    LDA #$7f                                ; 0x7F == tile ID
    STA a:SPRITE0_TILE                      ; Store for sprite 0's tile ID.
    LDA #$23                                ; 0x23 == Palette index 3, behind
                                            ; background
    STA a:SPRITE0_ATTRS                     ; Store for sprite 0's
                                            ; attributes.
    LDA $cb98,Y                             ; Load the X for the sprite.
    STA a:SPRITE0_X                         ; Store for sprite 0's X.
    LDY #$04                                ; Y = 4 (loop counter).


    ;
    ; Begin filling all sprite slots with a Y = 240 (off-screen).
    ;
  @_beginFillSpriteSlots:                   ; [$cb82]
    LDA #$f0                                ; A = 0xF0 (default Y for unused
                                            ; slots).

  @_fillSpriteSlotsLoop:                    ; [$cb84]
    STA SPRITE_0_RANGE_1_START,Y            ; Set it for this sprite slot's
                                            ; Y.
    INY                                     ; Increment slot byte by 4.
    INY
    INY
    INY
    BNE @_fillSpriteSlotsLoop               ; If not 0, loop.


    ;
    ; Flip the start of the sprite slot range between 0 and 32.
    ;
    LDA Sprites_StartSlotRange              ; Load the frame flags.
    AND #$80                                ; Cap to 0 or 32.
    EOR #$80                                ; Flip it between 0 and 32.
    STA Sprites_StartSlotRange              ; Store it.
    RTS


;============================================================================
; Start X/Y locations for the default sprite 0.
;============================================================================
SPRITES_START_XY:                           ; [$cb96]
    .byte $17                               ; [0]:
                                            ; SPRITE_0_RANGE_1_START
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0
    .byte $48                               ; [1]:
                                            ; SPRITE_0_RANGE_1_START
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0xFF
    .byte $08                               ; [2]:
                                            ; SPRITE0_X
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0
    .byte $00                               ; [3]:
                                            ; SPRITE0_X
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0xFF


;============================================================================
; Request a reset of the OAM and wait for the next interrupt.
;
; INPUTS:
;     InterruptCounter:
;         The current interrupt counter.
;
; OUTPUTS:
;     Game_NeedOAMReset:
;         Set to 1 to request a reset.
;
; CALLS:
;     Screen_ResetSpritesForGamePlay
;
; XREFS:
;     IScripts_ClearPortraitImage
;     IScripts_LoadPortraitTiles
;============================================================================
Game_WaitForOAMReset:                       ; [$cb9a]
    JSR Screen_ResetSpritesForGamePlay
    LDA #$01
    STA Game_NeedOAMReset
    LDA InterruptCounter

  @_waitForInterruptLoop:                   ; [$cba3]
    CMP InterruptCounter
    BEQ @_waitForInterruptLoop
    RTS


;============================================================================
; Flip sprite data between slot ranges.
;
; This updates the OAM data for the sprites, copying between
; ranges 0-31 and 32-63. Only data in sprites 1 onward are
; copied. Sprite 0 is left alone.
;
; INPUTS:
;     SPRITE_0_RANGE_1_START:
;         The start of the sprite data.
;
; OUTPUTS:
;     SPRITE_0_RANGE_1_START:
;         The start of the updated sprite data.
;
; XREFS:
;     GameLoop_CheckPauseGame
;     Player_FillHPAndMP
;     Player_UseRedPotion
;============================================================================
Sprites_FlipRanges:                         ; [$cba8]
    LDX #$04                                ; X = 4 (sprite data offset)
    LDY #$84                                ; Y = 0x84 (start of loop
                                            ; counter)

  @_loop:                                   ; [$cbac]
    LDA SPRITE_0_RANGE_1_START,X            ; Load the sprite Y from this
                                            ; offset in range 1.
    PHA                                     ; Push it to the stack.
    LDA SPRITE_0_RANGE_1_START,Y            ; Load the sprite Y from this
                                            ; offset in range 2.
    STA SPRITE_0_RANGE_1_START,X            ; Copy to range 1.
    PLA                                     ; Pop the previous Y from the
                                            ; stack.
    STA SPRITE_0_RANGE_1_START,Y            ; Copy it to range 2.
    INX                                     ; X++ (sprite data offset)
    INY                                     ; Y++ (loop counter)
    BNE @_loop                              ; If not wrapped to 0, loop.
    RTS


;============================================================================
; Initialize the MMC1 chip and switch to bank 14.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     MMC1_ShiftSync:
;         Set to 0.
;
;     CurrentROMBank:
;         Set to bank 14.
;
;     SavedPRGBank:
;         Set to bank 14.
;
; CALLS:
;     MMC1_Init
;     MMC1_UpdateROMBank
;
; XREFS:
;     Game_Init
;============================================================================
Game_InitMMCAndBank:                        ; [$cbbf]
    LDA #$00
    STA MMC1_ShiftSync
    JSR MMC1_Init                           ; Initialize the MMC1 chipset.
    LDX #$0e
    STX a:CurrentROMBank                    ; Set the previous and current
                                            ; ROM banks to 14.
    STX SavedPRGBank
    JMP MMC1_UpdateROMBank                  ; Switch to the bank.


;============================================================================
; Initialize the MMC1 chip.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; XREFS:
;     Game_InitMMCAndBank
;============================================================================
MMC1_Init:                                  ; [$cbd0]
    LDA #$ff
    STA a:MMC1_SERIAL
    LDA #$0e                                ; Horizontal Mirroring Regular
                                            ; Mirroring Swap ROM bank at
                                            ; 0x8000 Swap 8K of VROM at PPU
                                            ; 0x0000 Don't reset
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff                             ; VROM_SIZE_SELECT
    LDA #$00                                ; Select VROM bank at 0x0000
                                            ; Switch 4KB only Don't reset
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff                             ; VROM_PAGE_SELECT_1
    LDA #$00                                ; Select VROM bank at 0x1000
                                            ; Switch 4KB only Don't reset
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    RTS


;============================================================================
; Save the current ROM bank and switch to a new one.
;
; INPUTS:
;     X:
;         The new bank to switch to.
;
; OUTPUTS:
;     CurrentROMBank:
;         The new ROM bank.
;
;     SavedPRGBank:
;         The previously-saved ROM bank.
;
;     MMC1_ShiftSync:
;         Flag used to manage/reinitialize MMC1 state.
;
; XREFS:
;     Area_LoadScrollDataRight
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
MMC1_SaveROMBankAndUpdateTo:                ; [$cc15]
    LDA a:CurrentROMBank                    ; Get the currently-loaded ROM
                                            ; bank
    STA SavedPRGBank

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Switch the active ROM bank.
;
; INPUTS:
;     X:
;         The new bank to switch to.
;
; OUTPUTS:
;     CurrentROMBank:
;         The new ROM bank.
;
;     MMC1_ShiftSync:
;         Flag used to manage/reinitialize MMC1 state.
;
; XREFS:
;     Area_LoadBlockProperties
;     Area_LoadScrollDataRight
;     Area_LoadTiles
;     Area_SetBlocks
;     Area_SetStateFromDoorDestination
;     CurrentSprite_LoadTilesInfo
;     EndGame_MainLoop
;     Game_DrawScreenInFrozenState
;     Game_InitMMCAndBank
;     Game_InitScreenAndMusic
;     Game_LoadAreaTable
;     Game_MainLoop
;     IScripts_DrawPortraitTileToPPU
;     IScripts_LoadPortraitTilesAddress
;     MMC1_LoadBankAndJump
;     MMC1_RestorePrevROMBank
;     MMC1_UpdatePRGBankToStackA
;     Messages_Load
;     PPU_LoadGlyphsForStrings
;     PPU_WriteTilesFromCHRRAM
;     Player_HandleDeath
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
;     Sprite_Draw_Finish
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
MMC1_UpdateROMBank:                         ; [$cc1a]
    STX a:CurrentROMBank                    ; Set the bank we're switching
                                            ; to.

  @_setupMMC1:                              ; [$cc1d]
    LDA #$01
    STA MMC1_ShiftSync


    ;
    ; Write 5 LSBs of A to $FFFF, one bit per write (MMC1 serial protocol):
    ;
    TXA                                     ; ROM_PAGE_SELECT parameter in X
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL


    ;
    ; Check the MMC1 synchronization state.
    ;
    ; If 0, this will re-initialize the MMC1 and switch banks.
    ;
    ; If 1, the interrupt handler is already switching banks.
    ; This can then return.
    ;
    LDA MMC1_ShiftSync
    CMP #$01
    BEQ @_finish


    ;
    ; Slow path. Re-initialize the MMC1.
    ;
    LDA #$ff
    STA a:MMC1_SERIAL                       ; Reset the MMC1
                                            ; shifter/controler.
    LDA #$0e                                ; Horizontal Mirroring Regular
                                            ; Mirroring Swap ROM bank at
                                            ; 0x8000 Swap 8K of VROM at PPU
                                            ; 0x000 Don't reset


    ;
    ; Set the CHR banking mode.
    ;
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff


    ;
    ; Set CHR bank 0 = 0.
    ;
    LDA #$00                                ; Select VROM bank at 0x000
                                            ; Switch 4K only Don't reset
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff


    ;
    ; Set CHR bank 1 = 0.
    ;
    LDA #$00                                ; Select VROM bank at 0x1000
                                            ; Switch 4K only Don't reset
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    JMP @_setupMMC1

  @_finish:                                 ; [$cc82]
    DEC MMC1_ShiftSync
    RTS


;============================================================================
; Watchdog handler to ensure the correct ROM bank is set.
;
; This is called by the interrupt handler to keep the MMC1
; in a known configuration and keep the desired ROM bank
; set.
;
; If other code is in the middle of switching ROM banks,
; this will notice and perform a full MMC1 re-initialization
; before setting the bank.
;
; INPUTS:
;     X:
;         The ROM bank to ensure is set.
;
;     MMC1_ShiftSync:
;         Flag indicating if a ROM bank is currently being
;         set.
;
; OUTPUTS:
;     CurrentROMBank:
;         The new ROM bank.
;
;     MMC1_ShiftSync:
;         Flag used to manage/reinitialize MMC1 state.
;
; XREFS:
;     OnInterrupt
;============================================================================
MMC1_EnsurePRG:                             ; [$cc85]
    STX a:CurrentROMBank


    ;
    ; Check if any code was in the process of switching banks.
    ;
    ; If 0, we can exit.
    ;
    ; If 1, MMC1_UpdateROMBank was in the process of
    ; switching banks.
    ;
    LDA MMC1_ShiftSync
    BEQ @_fastPath


    ;
    ; The sync state was set, so something is switching banks.
    ; Increment the sync state and reset the MMC1 chip.
    ;
    INC MMC1_ShiftSync


    ;
    ; Reset MMC1.
    ;
    LDA #$ff
    STA a:MMC1_SERIAL
    LDA #$0e                                ; Horizontal Mirroring Regular
                                            ; Mirroring Swap ROM bank at
                                            ; 0x8000 Swap 8K of VROM at PPU
                                            ; 0x000 Don't reset

  @_setMMC1State:                           ; [$cc95]
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff
    LSR A
    STA a:$9fff


    ;
    ; Set CHR bank 0 = 0
    ;
    LDA #$00
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff
    LSR A
    STA a:$bfff


    ;
    ; Set CHR bank 1 = 0.
    ;
    LDA #$00
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff
    LSR A
    STA a:$dfff


    ;
    ; Set the bank.
    ;
  @_fastPath:                               ; [$ccd2]
    TXA
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    LSR A
    STA a:MMC1_SERIAL
    RTS


;============================================================================
; Restore the previously-saved ROM bank.
;
; This will switch to the bank stored in
; SavedPRGBank.
;
; INPUTS:
;     SavedPRGBank:
;         The saved ROM bank to switch back to.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Area_LoadScrollDataRight
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
MMC1_RestorePrevROMBank:                    ; [$cce7]
    LDX SavedPRGBank
    JMP MMC1_UpdateROMBank
;============================================================================
; TODO: Document PPUBuffer_DrawCommand_RemoveVerticalLines
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfc8]
;============================================================================
PPUBuffer_DrawCommand_RemoveVerticalLines:  ; [$ccec]
    ;
    ; Read the first byte from the buffer as the phase.
    ;
    LDX PPUBuffer_ReadOffset                ; Load our current PPU buffer
                                            ; offset into X.
    LDA PPUBuffer,X                         ; Load the first address byte
                                            ; from the buffer into A.
    INX                                     ; Increment buffer offset (X = X
                                            ; + 1).
    STA Temp_08                             ; Store the upper byte (A) into a
                                            ; temporary variable.


    ;
    ; Read the upper address from the buffer and set in PPUADDR.
    ;
    LDA PPUBuffer,X                         ; Load the next byte from the
                                            ; buffer into A.
    INX                                     ; Increment buffer offset.
    TAY                                     ; Y = lower byte.
    STY a:PPUADDR                           ; Write the upper byte to
                                            ; PPUADDR.


    ;
    ; Read the lower address from the buffer and set in PPUADDR.
    ;
    LDA PPUBuffer,X
    INX
    STX PPUBuffer_ReadOffset                ; Set the new offset.
    TAX
    STX a:PPUADDR                           ; Write the lower byte to
                                            ; PPUADDR.


    ;
    ; Begin preparing for the loop. There will be 16 iterations.
    ;
    LDA #$10                                ; Set to 16 iterations in
                                            ; Temp_06.
    STA Temp_06
    LDA a:PPUDATA                           ; Read a byte from PPUDATA.

  @_loop:                                   ; [$cd0d]
    STX Temp_07                             ; Store X (offset) into our temp
                                            ; state.
    LDA a:PPUDATA                           ; Read the next byte of data.


    ;
    ; Set the address again. The PPUDATA read advanced the offset.
    ;
    STY a:PPUADDR                           ; Set upper byte of PPU address
                                            ; to Y.
    STX a:PPUADDR                           ; Set lower byte of PPU address
                                            ; to X.


    ;
    ; Add the phase byte and loop index together and get the three
    ; least-significant bits. This will be our index into the lookup
    ; table.
    ;
    PHA
    LDA Temp_06                             ; Load the loop index.
    CLC
    ADC Temp_08                             ; Add the phase byte to it.
    AND #$07                                ; Retain only the 3
                                            ; least-significant bits.
    TAX                                     ; Store in X.
    PLA


    ;
    ; Take the PPU data we loaded before and AND the value in the
    ; lookup table. This will be the replacement for the data we
    ; loaded.
    ;
    AND PPUBUFFER_DRAWCOMMAND_0xFA_MASKS,X
    STA a:PPUDATA                           ; Set as the new PPU data.


    ;
    ; Load the offset into the buffer and increment.
    ;
    LDX Temp_07                             ; Load the saved offset.
    INX                                     ; Increment by 1.


    ;
    ; Prepare either for the next loop or for termination.
    ;
    LDA a:PPUDATA                           ; Load our next PPU data byte for
                                            ; the next loop.
    DEC Temp_06                             ; Decrement our loop index by 1.
    BNE @_loop                              ; If not 0, loop.
    RTS

;
; XREFS:
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;
PPUBUFFER_DRAWCOMMAND_0xFA_MASKS:           ; [$cd33]
    .byte $fe                               ; [0]:
    .byte $df                               ; [1]:
    .byte $f7                               ; [2]:
    .byte $fd                               ; [3]:
    .byte $bf                               ; [4]:
    .byte $ef                               ; [5]:
    .byte $7f                               ; [6]:
    .byte $fb                               ; [7]:


;============================================================================
; Rotate 16 bytes of tiles right by 1 pixel.
;
; This PPUBuffer draw command will read the upper and
; lower bytes of a PPU address and then iterate over the
; next 16 bytes at that address, rotating all data right
; by 1 pixel.
;
; INPUTS:
;     {@sybmol PPUBuffer}:
;         The PPU buffer to read from.
;
;     PPUBuffer_ReadOffset:
;         The offset within the PPU buffer to read from.
;
;     PPUADDR:
;         The PPU address to read and write.
;
;     PPUDATA:
;         The PPU data to read and write.
;
; OUTPUTS:
;     PPUBuffer_ReadOffset:
;         The updated offset within the PPU buffer.
;
;     PPUADDR:
;         The written PPU address.
;
;     PPUDATA:
;         The written PPU data.
;
; TEMP VARIABLES:
;     Temp_06
;
; XREFS:
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfc4]
;============================================================================
PPUBuffer_DrawCommand_RotateTilesRight1Pixel: ; [$cd3b]
    ;
    ; Read the first two bytes from the offset and set as
    ; the PPUADDR.
    ;
    LDX PPUBuffer_ReadOffset                ; Load our current PPU buffer
                                            ; offset.
    LDA PPUBuffer,X                         ; Load the first address byte
                                            ; from the buffer.
    INX
    TAY                                     ; Y = byte 1
    STY a:PPUADDR                           ; Set as the upper byte of the
                                            ; PPU address.
    LDA PPUBuffer,X                         ; Load the next address byte.
    INX
    STX PPUBuffer_ReadOffset                ; Update the offset to skip these
                                            ; bytes.
    TAX
    STX a:PPUADDR                           ; Set as the lower byte of the
                                            ; PPU address.


    ;
    ; Begin preparing for drawing.
    ;
    ; We'll draw 16 bytes from the buffer.
    ;
    LDA #$10                                ; Set our loop for 16 bytes.
    STA Temp_06
    LDA a:PPUDATA                           ; Load byte 1 from the PPU.

  @_loop:                                   ; [$cd56]
    LDA a:PPUDATA                           ; Load a byte from the PPU.


    ;
    ; Set the address again. The PPUDATA read advanced the offset.
    ;
    STY a:PPUADDR                           ; Set upper byte of PPU address
                                            ; to Y.
    STX a:PPUADDR                           ; Set lower byte of PPU address
                                            ; to X.


    ;
    ; Rotate the tile data from this address right by 1 pixel.
    ;
    PHA
    LSR A                                   ; Rotate the pixel data right by
                                            ; 1.
    PLA
    ROR A                                   ; OR it to the data rotated left
                                            ; by 7.
    STA a:PPUDATA                           ; Store the rotated data.
    INX                                     ; Increment the lower byte of the
                                            ; PPU address.
    LDA a:PPUDATA


    ;
    ; Check if we're at the end of the loop.
    ;
    ; If we've processed 16 entries, we're done.
    ;
    DEC Temp_06                             ; Decrement our loop counter.
    BNE @_loop                              ; If it's > 0, loop.
    RTS


;============================================================================
; Reset the PPU tile offset for loading sprite tiles.
;
; This will reset to a value of $0900.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CurrentSprite_TargetPPUTileAddr:
;     CurrentSprite_TargetPPUTileAddr+1:
;         The updated offset ($0900).
;
; XREFS:
;     GameLoop_LoadSpriteImages
;     Screen_ClearSprites
;============================================================================
CurrentSprite_ResetPPUTileOffset:           ; [$cd6f]
    LDA #$09
    STA CurrentSprite_TargetPPUTileAddr_U   ; Set upper to 0x09.
    LDA #$00
    STA CurrentSprite_TargetPPUTileAddr     ; Set lower to 0x00.
    RTS


;============================================================================
; Look up tile information needed to draw a sprite.
;
; This will take the sprite entity ID and look up the starting
; address for tile data and the number of tiles to draw.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank to switch back to after load.
;
;     CurrentSprite_Entity:
;         The current sprite entity being loaded.
;
;     CurrentSprite_TilesBank:
;         The tiles bank for the current sprite.
;
;     SPRITES_PPU_TILE_COUNTS:
;         The lookup table of entity ID to tile count.
;
; OUTPUTS:
;     CurrentSprite_LoadTileAddr+1:
;     CurrentSprite_LoadTileAddr:
;         The address for the tiles to load.
;
;     CurrentSprite_LoadTileCount:
;         The number of tiles to load.
;
;     Temp_Addr_U:
;     Temp_Addr_L:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Sprites_LoadImageForCurrentSprite
;============================================================================
CurrentSprite_LoadTilesInfo:                ; [$cd78]
    ;
    ; Save the current ROM bank to the stack.
    ;
    LDA a:CurrentROMBank                    ; Load the current bank.
    PHA                                     ; Push to the stack.


    ;
    ; Switch to the bank for the current sprite's images.
    ;
    LDX a:CurrentSprite_TilesBank           ; Load the bank where the images
                                            ; for the current sprite are
                                            ; found
    JSR MMC1_UpdateROMBank


    ;
    ; Read the first byte of the ROM bank and store as the start of
    ; the lower byte of the sprite images address.
    ;
    LDA a:ROMBankStart                      ; Read byte from $8000.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address.


    ;
    ; Read the second byte as the upper address, and add 0x80 to it.
    ;
    LDA a:ROMBankStart+1                    ; Read byte from $8001.
    CLC
    ADC #$80                                ; Add 0x80.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address.


    ;
    ; Compute the starting index for the sprite based on the
    ; entity ID.
    ;
    ; Entities 0-55 are in the first sprite bank. 56+ are in
    ; the second.
    ;
    LDA a:CurrentSprite_Entity              ; Load the current sprite ID
    CMP #$37                                ; Check if we're on the next
                                            ; bank.
    BCC @_loadImages
    SBC #$37                                ; We are, so subtract 55 for the
                                            ; new sprite index.


    ;
    ; Compute the address for the sprite image.
    ;
  @_loadImages:                             ; [$cd98]
    ASL A                                   ; Convert the sprite ID to a word
                                            ; boundary.
    TAY                                     ; Y = A
    LDA (Temp_Addr_L),Y                     ; Get the pointer to the sprite
                                            ; data from the bank address
                                            ; computed above.
    STA CurrentSprite_LoadTileAddr          ; A = Lower byte of the image
                                            ; data address.
    INY
    LDA (Temp_Addr_L),Y                     ; A = Upper byte of the address.
    CLC
    ADC #$80                                ; Add 0x80 to the upper address.
    STA CurrentSprite_LoadTileAddr_U        ; Upper byte of pointer to the
                                            ; sprite bitmap


    ;
    ; Get the PPU tile numbers for the sprite entity and store
    ; it for lookup.
    ;
    LDA a:CurrentSprite_Entity              ; Load the current sprite ID
    TAY
    LDA SPRITES_PPU_TILE_COUNTS,Y           ; Get the number of tiles needed
    STA CurrentSprite_LoadTileCount         ; Store that for the render


    ;
    ; Restore the previous bank.
    ;
    PLA                                     ; Pop the previous bank.
    TAX                                     ; Transfer to X.
    JSR MMC1_UpdateROMBank                  ; Update to the bank.
    RTS


;============================================================================
; Load all tiles required for a sprite into the PPU.
;
; This will load information on the tiles needed for the
; current sprite entity, and will then iterate through each
; tile, writing it to the PPU buffer.
;
; INPUTS:
;     CurrentSprite_TargetPPUTileAddr+1:
;     CurrentSprite_TargetPPUTileAddr:
;         The target PPU address to begin writing to.
;
; OUTPUTS:
;     CurrentSprite_TargetPPUTileAddr+1:
;     CurrentSprite_TargetPPUTileAddr:
;         The new target PPU address for the next sprite.
;
;     PPUBuffer:
;         The PPU buffer populated with new tile data.
;
;     PPUBuffer_WriteOffset:
;         The new PPU buffer write offset.
;
;     CurrentSprite_LoadTileAddr+1:
;     CurrentSprite_LoadTileAddr:
;     CurrentSprite_LoadTileCount:
;     PPU_TargetAddr+1:
;     PPU_TargetAddr:
;         Clobbered.
;
; CALLS:
;     CurrentSprite_LoadTilesInfo
;     MMC1_UpdateROMBank
;
; XREFS:
;     GameLoop_LoadSpriteImages
;============================================================================
Sprites_LoadImageForCurrentSprite:          ; [$cdb5]
    ;
    ; Calculate the starting PPU tile offset for this sprite.
    ;
    ; This is equivalent to:
    ;
    ;     // Lower byte
    ;     Temp_00 =
    ;     (byte)(CurrentSprite_TargetPPUTileAddr << 4);
    ;
    ;     // Upper byte
    ;     CurrentSprite_StartPPUTileOffset = (byte)(
    ;         (CurrentSprite_TargetPPUTileAddr+1 << 4) |
    ;         (CurrentSprite_TargetPPUTileAddr >> 4)
    ;     );
    ;
    LDA CurrentSprite_TargetPPUTileAddr     ; Load the lower byte of the
                                            ; current PPU tile address to
                                            ; read from.
    STA Temp_00                             ; Store it temporarily.
    LDA CurrentSprite_TargetPPUTileAddr_U   ; Load the upper byte of the PPU
                                            ; tile address.
    ASL Temp_00                             ; Multiply by 16.
    ROL A
    ASL Temp_00
    ROL A
    ASL Temp_00
    ROL A
    ASL Temp_00
    ROL A                                   ; A = Lower byte of the offset.
    STA CurrentSprite_StartPPUTileOffset    ; Store the upper byte as the
                                            ; starting offset.


    ;
    ; Load the tile information for the sprite, and proceed to
    ; load into the PPU if the sprite entity has tiles.
    ;
    JSR CurrentSprite_LoadTilesInfo         ; Look up the sprite data pointer
                                            ; for this.
    LDA CurrentSprite_LoadTileCount         ; A = Tile count.
    BNE @_loadSpriteToPPUBuffer             ; If count > 0, jump to load tile
                                            ; data.
    RTS


    ;
    ; Switch to the bank containing the tiles to load.
    ;
  @_loadSpriteToPPUBuffer:                  ; [$cdd1]
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX a:CurrentSprite_TilesBank           ; X = Bank for the tiles.
    JSR MMC1_UpdateROMBank                  ; Switch to that bank.


    ;
    ; Set the PPU address to load tiles into.
    ;
    LDA CurrentSprite_TargetPPUTileAddr_U   ; Load the upper byte of the
                                            ; target PPU address.
    STA PPU_TargetAddr_U                    ; Set it.
    LDA CurrentSprite_TargetPPUTileAddr     ; Load the lower byte.
    STA PPU_TargetAddr                      ; Set it.


    ;
    ; Queue loading 16 bytes for the current tile.
    ;
    LDA #$10                                ; A = 16 (bytes)
    JSR PPUBuffer_QueueCommandOrLength      ; Queue as the length, and set X
                                            ; as the write index.


    ;
    ; Copy the sprite data for this tile to the PPU buffer.
    ;
    LDY #$00                                ; Y = 0 (loop counter)

  @_copySpriteImage:                        ; [$cdea]
    LDA (CurrentSprite_LoadTileAddr),Y      ; Load a byte from the tile.
    STA PPUBuffer,X                         ; Write to the PPU buffer at X.
    INX                                     ; X++ (write offset)
    INY                                     ; Y++ (loop counter)
    CPY #$10                                ; Is X < 16?
    BCC @_copySpriteImage                   ; If so, loop.


    ;
    ; 16 bytes of sprite data was written to the PPU buffer.
    ; Update the new write position for the buffer.
    ;
    STX PPUBuffer_WriteOffset               ; Store the resulting PPU buffer
                                            ; write offset.


    ;
    ; Restore the previous bank.
    ;
    PLA                                     ; Pull the previous bank from the
                                            ; stack.
    TAX                                     ; Set to X.
    JSR MMC1_UpdateROMBank                  ; And switch to it.


    ;
    ; Update the source tile address to advance to the next tile.
    ;
    LDA CurrentSprite_LoadTileAddr          ; Load the lower byte of the tile
                                            ; address.
    CLC
    ADC #$10                                ; Add 16 (the bytes we just
                                            ; read).
    STA CurrentSprite_LoadTileAddr          ; And store it.
    LDA CurrentSprite_LoadTileAddr_U        ; Load the upper byte.
    ADC #$00                                ; Add Carry, if the lower byte
                                            ; wrapped.
    STA CurrentSprite_LoadTileAddr_U        ; And store it.


    ;
    ; Update the target PPU tile address to advance to the next
    ; tile.
    ;
    LDA CurrentSprite_TargetPPUTileAddr     ; Load the lower byte of the
                                            ; target address.
    CLC
    ADC #$10                                ; Add 16.
    STA CurrentSprite_TargetPPUTileAddr     ; And store it.
    LDA CurrentSprite_TargetPPUTileAddr_U   ; Load the upper byte.
    ADC #$00                                ; Add Carry, if the lower byte
                                            ; wrapped.
    STA CurrentSprite_TargetPPUTileAddr_U   ; And store it.


    ;
    ; Decrement the tile count, and loop if there are tiles
    ; remaining.
    ;
    DEC CurrentSprite_LoadTileCount         ; Decrement the remaining tile
                                            ; count.
    BNE @_loadSpriteToPPUBuffer             ; If > 0, loop.
    RTS


;============================================================================
; The number of PPU tiles each sprite needs.
;
; XREFS:
;     CurrentSprite_LoadTilesInfo
;============================================================================

;
; XREFS:
;     CurrentSprite_LoadTilesInfo
;
SPRITES_PPU_TILE_COUNTS:                    ; [$ce1b]
    .byte $01                               ; [0]:
    .byte $01                               ; [1]: Dropped: Bread
    .byte $01                               ; [2]: Dropped: Coin
    .byte $01                               ; [3]: Enemy: ?
    .byte $10                               ; [4]: Enemy: Raiden
    .byte $10                               ; [5]: Enemy: Necron Aides
    .byte $10                               ; [6]: Enemy: Zombie
    .byte $08                               ; [7]: Enemy: Hornet
    .byte $06                               ; [8]: Enemy: Bihoruda
    .byte $06                               ; [9]: Enemy: Lilith
    .byte $07                               ; [10]: Magic: ?
    .byte $06                               ; [11]: Enemy: Yuinaru
    .byte $0c                               ; [12]: Enemy: Snowman
    .byte $10                               ; [13]: Enemy: Nash
    .byte $10                               ; [14]: Enemy: Fire Giant
    .byte $12                               ; [15]: Enemy: Ishiisu
    .byte $0d                               ; [16]: Enemy: Execution Hood
    .byte $26                               ; [17]: Boss: Rokusutahn
    .byte $10                               ; [18]: Boss: unused (round body
                                            ; of snake boss)
    .byte $00                               ; [19]: Effect: Enemy death
    .byte $00                               ; [20]: Effect: Lightning ball
    .byte $16                               ; [21]: Enemy: Charron
    .byte $17                               ; [22]: Enemy: ? (Unused)
    .byte $10                               ; [23]: Enemy: Geributa
    .byte $0e                               ; [24]: Enemy: Sugata
    .byte $12                               ; [25]: Enemy: Grimlock
    .byte $0c                               ; [26]: Enemy: Giant Bees
    .byte $0e                               ; [27]: Enemy: Myconid
    .byte $10                               ; [28]: Enemy: Naga
    .byte $10                               ; [29]: Enemy: Skeleton Knight
                                            ; (unused)
    .byte $12                               ; [30]: Enemy: Giant Strider
    .byte $12                               ; [31]: Enemy: Sir Gawaine
    .byte $1f                               ; [32]: Enemy: Maskman
    .byte $16                               ; [33]: Enemy: Wolfman
    .byte $0f                               ; [34]: Enemy: Yareeka
    .byte $10                               ; [35]: Enemy: Magman
    .byte $13                               ; [36]: Enemy: Curly-tailed guy
                                            ; with spear (unused)
    .byte $10                               ; [37]: Enemy: ? (unused)
    .byte $11                               ; [38]: Enemy: Ikeda
    .byte $10                               ; [39]: Enemy: Muppet guy
                                            ; (unused)
    .byte $10                               ; [40]: Enemy: Lamprey
    .byte $10                               ; [41]: Enemy: ? (unused)
    .byte $13                               ; [42]: Enemy: Monodron
    .byte $0c                               ; [43]: Enemy: Winged skeleton
                                            ; (unused)
    .byte $12                               ; [44]: Enemy: Tamazutsu
    .byte $3e                               ; [45]: Boss: Ripasheiku
    .byte $33                               ; [46]: Boss: Zoradohna
    .byte $1c                               ; [47]: Boss: Borabohra
    .byte $0e                               ; [48]: Boss: Pakukame
    .byte $25                               ; [49]: Boss: Zorugeriru
    .byte $54                               ; [50]: Boss: King Grieve
    .byte $69                               ; [51]: Boss: Shadow Eura
    .byte $10                               ; [52]: NPC: Walking Man 1
    .byte $10                               ; [53]: NPC: Blue lady (unused)
    .byte $09                               ; [54]: NPC: Child (unused)
    .byte $08                               ; [55]: NPC: Armor Salesman
    .byte $0b                               ; [56]: NPC: Martial Artist
    .byte $0b                               ; [57]: NPC: Priest
    .byte $14                               ; [58]: NPC: King
    .byte $0c                               ; [59]: NPC: Magic Teacher
    .byte $08                               ; [60]: NPC: Key Salesman
    .byte $0a                               ; [61]: NPC: Smoking Man
    .byte $0e                               ; [62]: NPC: Man in Chair
    .byte $0a                               ; [63]: NPC: Sitting Man
    .byte $0d                               ; [64]: NPC: Meat Salesman
    .byte $10                               ; [65]: NPC: Lady in Blue Dress
                                            ; with Cup
    .byte $10                               ; [66]: NPC: Guard
    .byte $0b                               ; [67]: NPC: Doctor
    .byte $0e                               ; [68]: NPC: Walking Woman 1
    .byte $0d                               ; [69]: NPC: Walking Woman 2
    .byte $09                               ; [70]: Enemy: Eyeball (unused)
    .byte $08                               ; [71]: Enemy: Zozura
    .byte $02                               ; [72]: Item: Glove
    .byte $02                               ; [73]: Item: Black Onyx
    .byte $04                               ; [74]: Item: Pendant
    .byte $02                               ; [75]: Item: Red Potion
    .byte $02                               ; [76]: Item: Poison
    .byte $04                               ; [77]: Item: Elixir
    .byte $02                               ; [78]: Item: Ointment
    .byte $00                               ; [79]: Trigger: Intro
    .byte $02                               ; [80]: Item: Mattock
    .byte $00                               ; [81]: Magic: ?
    .byte $0c                               ; [82]: Effect: Fountain
    .byte $00                               ; [83]: Magic: ?
    .byte $00                               ; [84]: Magic: Enemy Fireball
    .byte $04                               ; [85]: Item: Wing Boots
    .byte $02                               ; [86]: Item: Hour Glass
    .byte $04                               ; [87]: Item: Magical Rod
    .byte $02                               ; [88]: Item: Battle Suit
    .byte $04                               ; [89]: Item: Battle Helmet
    .byte $04                               ; [90]: Item: Dragon Slayer
    .byte $02                               ; [91]: Item: Mattock
    .byte $04                               ; [92]: Item: Wing Boots (from
                                            ; quest)
    .byte $02                               ; [93]: Item: Red Potion
    .byte $02                               ; [94]: Item: Poison
    .byte $02                               ; [95]: Item: Glove
    .byte $02                               ; [96]: Item: Ointment
    .byte $0c                               ; [97]: Effect: Spring of Trunk
    .byte $0c                               ; [98]: Effect: Spring of Sky
    .byte $0c                               ; [99]: Effect: Spring of Tower
    .byte $00                               ; [100]: Effect: Boss Death


;============================================================================
; Load common sprites from bank 8.
;
; This will load 80 sprites (5 passes of 16 sprites at
; 1,280 bytes total) from bank 8 into the PPU.
;
; The sprites consist of the coins, bread, damage effects,
; magic, HUD and textbox symbols, and the hand cursor.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     PPUADDR:
;     PPUDATA:
;         Written sprite data.
;
;     Temp_00:
;     Temp_Addr_L:
;     Temp_Addr_U:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Game_InitStateForSpawn
;     Screen_SetupNew
;============================================================================
Sprites_LoadCommon:                         ; [$ce80]
    ;
    ; Save the current ROM bank and switch to bank 8.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$08                                ; Bank 8 == sprite data.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Set the start address for the sprites to load.
    ;
    LDA a:TILES_COMMON_START_REF            ; Load the lower byte of the
                                            ; address of the first sprite (a
                                            ; coin).
    STA Temp_Addr_L                         ; Store it.
    LDA a:TILES_COMMON_START_REF+1          ; Load the upper byte.
    CLC                                     ; Clear Carry.
    ADC #$80                                ; Add 0x80 to the upper byte.
    STA Temp_Addr_U                         ; And store as the upper byte of
                                            ; the address.


    ;
    ; Set the sprite tile load count to 5 passes of 256 bytes,
    ; yielding 80 sprites.
    ;
    LDA #$05                                ; 5 = number of passes of 256
                                            ; bytes of sprite tiles to load.
    STA Temp_00                             ; Store it for the loop.


    ;
    ; Set the PPU address to $0400 (within the loaded PPU tiles).
    ;
    LDA #$04                                ; 0x04 == Upper byte.
    STA a:PPUADDR                           ; Write it.
    LDY #$00                                ; 0x00 == Lower byte and loop
                                            ; counter.
    STY a:PPUADDR                           ; Write it.


    ;
    ; Begin loading and writing sprites, 5 passes of 256 bytes.
    ;
  @_loadLoop:                               ; [$cea4]
    LDA (Temp_Addr_L),Y                     ; Load the address of the sprite.
    STA a:PPUDATA                           ; Write to the PPU data.
    INY                                     ; Y++ (loop counter).
    BNE @_loadLoop                          ; If not incremented back up to
                                            ; 0, loop.
    INC Temp_Addr_U                         ; Increment the upper byte of the
                                            ; write address.
    DEC Temp_00                             ; Decrement the number of passes
                                            ; remaining.
    BNE @_loadLoop                          ; If > 0, loop.


    ;
    ; Loading is complete. Restore the previous bank.
    ;
    PLA                                     ; Pop the previous bank from the
                                            ; stack.
    TAX                                     ; X = A (bank)
    JSR MMC1_UpdateROMBank                  ; Switch back to the bank.
    RTS


;============================================================================
; Load the tiles for the area into CHR RAM.
;
; The tiles will be loaded from bank 4.
;
; INPUTS:
;     Area_TilesReadAddress:
;         The tiles address in the PPU.
;
;     Area_TilesIndex:
;         The index of the tileset to load.
;
;     CurrentROMBank:
;         The current ROM bank.
;
;     TILE_INDEX_TO_ADDR:
;         Lookup table of addresses in bank 4 containing
;         the tiles.
;
;     TILE_INDEX_TO_PPU_ADDR_UPPER:
;         Lookup table of upper bytes of the PPU addresses
;         to write to.
;
; OUTPUTS:
;     PPUADDR:
;     PPUDATA:
;         The loaded PPU tile data.
;
;     Temp_08:
;     Temp_09:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPU_SetVRAMIncrementAdd1Across
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
Area_LoadTiles:                             ; [$ceb8]
    ;
    ; Load the address for the tile data based on the tiles index.
    ;
    LDA Area_TilesIndex                     ; Set A = tileset index
    ASL A                                   ; Set A = tileset index * 2 (word
                                            ; offset)
    TAY                                     ; Set Y = word offset into the
                                            ; pointer table
    LDA TILE_INDEX_TO_ADDR,Y                ; Read the low byte from the
                                            ; table
    STA Area_TilesReadAddress               ; Save low byte to TilesAddress
    LDA TILE_INDEX_TO_ADDR+1,Y              ; Read the high byte from the
                                            ; table
    STA Area_TilesReadAddress+1             ; Set high byte to TilesAddress


    ;
    ; Set the PPU to increment by +1 after each PPUDATA write.
    ;
    JSR PPU_SetVRAMIncrementAdd1Across      ; Set PPUDATA to increment by 1
                                            ; per write.


    ;
    ; Load and set the PPU address for the current set of
    ; tiles. Set the upper byte from the table and lower
    ; byte to 0.
    ;
    ; Upper byte will be 0x18 or 0x1A.
    ;
    LDY Area_TilesIndex                     ; Load the tiles index.
    LDA TILE_INDEX_TO_PPU_ADDR_UPPER,Y      ; Convert to a PPU address via
                                            ; lookup table (0x18 or 0x1A).
    STA a:PPUADDR                           ; Write as the upper byte.
    LDA #$00                                ; 0x00 = Lower byte (start of
                                            ; page).
    STA a:PPUADDR                           ; Write as the lower byte.


    ;
    ; Set the remaining number of tiles.
    ;
    ; This is a 16-bit integer composed of:
    ;
    ;     Temp_08: Lower byte
    ;     Temp_09: Upper byte
    ;
    STA Temp_08                             ; Set lower byte of the remaining
                                            ; tile count to 0.
    LDA TILE_INDEX_TO_NUM_CHR_PAGES,Y       ; Load the number of pages to
                                            ; load.
    STA Temp_09                             ; Set as the upper byte.


    ;
    ; Save the current bank and switch to bank 4 (tile data).
    ;
    LDA a:CurrentROMBank                    ; A = Current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$04                                ; 4 = Tiles
    JSR MMC1_UpdateROMBank                  ; Switch to bank 4 (tile data)


    ;
    ; Begin loading tiles into PPUDATA.
    ;
    LDY #$00                                ; Set Y = 0 (start page of loop)


    ;
    ; Stream 1 byte from tiles to the PPU.
    ;
  @_copyLoop:                               ; [$cee8]
    LDA (Area_TilesReadAddress),Y           ; Load a byte from the tiles.
    STA a:PPUDATA                           ; Write to the PPU.


    ;
    ; Increment our source pointer (Y++).
    ;
    ; If it wraps up to 0, we need to increment the upper byte
    ; of the tiles address it's loading from.
    ;
    INY                                     ; Y++ (source pointer).
    BNE @_noCarry                           ; If wrapped to 0, jump.
    INC Area_TilesReadAddress+1             ; Increment the upper byte of the
                                            ; tiles address.


    ;
    ; Decrement the 16-bit remaining tile count.
    ;
  @_noCarry:                                ; [$cef2]
    LDA Temp_08                             ; Load the lower byte of the
                                            ; remaining count.
    SEC
    SBC #$01                                ; Subtract 1.
    STA Temp_08                             ; And set it.
    LDA Temp_09                             ; Load the upper byte of the
                                            ; remaining count.
    SBC #$00                                ; Subtract carry, if lower
                                            ; wrapped.
    STA Temp_09                             ; And set it.
    BCS @_copyLoop                          ; If count > 0, loop.


    ;
    ; Switch back to the previous bank.
    ;
    PLA                                     ; Pop the previous bank.
    TAX                                     ; Transfer to X.
    JSR MMC1_UpdateROMBank                  ; And switch to it.
    RTS


;============================================================================
; Offsets of the tiles in the bank
;
; Index into the table are based on Area_TilesIndex.
;
; TODO
;
; XREFS:
;     Area_LoadTiles
;============================================================================

;
; XREFS:
;     Area_LoadTiles
;
TILE_INDEX_TO_ADDR:                         ; [$cf07]
    pointer AREA_TILESETS_EOLIS             ; [0]: Eolis
    pointer AREA_TILESETS_BRANCHES          ; [1]: Branches
    pointer AREA_TILESETS_TRUNK             ; [2]: Trunk
    pointer AREA_TILESETS_MIST              ; [3]: Mist
    pointer AREA_TILESETS_DARTMOOR_EVIL_LAIR ; [4]: Dartmoor Castle Evil Lair
    pointer AREA_TILESETS_TOWNS             ; [5]: Towns
    pointer AREA_TILESETS_KINGSROOM_GURU_HOSPITAL ; [6]: King's Room Guru
                                                  ; Room Hospital
    pointer AREA_TILESETS_SHOPS_HOUSE_TAVERN ; [7]: Tavern Tool Shop Key Shop
                                             ; House Meat Shop
    pointer AREA_TILESETS_MARTIALARTS_MAGICTRAINER ; [8]: Martial Arts Magic
                                                   ; Trainer


;============================================================================
; Which parts of the PPU tiles are loaded.
;
; Index into the table are based on Area_TilesIndex.
;
; XREFS:
;     Area_LoadTiles
;============================================================================

;
; XREFS:
;     Area_LoadTiles
;
TILE_INDEX_TO_PPU_ADDR_UPPER:               ; [$cf19]
    .byte $18                               ; [0]: Eolis
    .byte $18                               ; [1]: Branches
    .byte $18                               ; [2]: Trunk
    .byte $18                               ; [3]: Mist
    .byte $18                               ; [4]: Dartmoor Castle Evil Lair
    .byte $18                               ; [5]: Towns
    .byte $1a                               ; [6]: King's Room Guru Room
                                            ; Hospital
    .byte $1a                               ; [7]: Tavern Tool Shop Key Shop
                                            ; House Meat Shop
    .byte $1a                               ; [8]: Martial Arts Magic Trainer


;============================================================================
; The number of CHR pages to load for a tiles index.
;
; Index into the table are based on Area_TilesIndex.
;
; The results are further translated as:
;
;     8 == 0x80
;     6 == 0x60
;     4 == 0x40
;
; XREFS:
;     Area_LoadTiles
;============================================================================

;
; XREFS:
;     Area_LoadTiles
;
TILE_INDEX_TO_NUM_CHR_PAGES:                ; [$cf22]
    .byte $08                               ; [0]: Eolis
    .byte $08                               ; [1]: Branches
    .byte $08                               ; [2]: Trunk
    .byte $08                               ; [3]: Mist
    .byte $08                               ; [4]: Dartmoor Castle Evil Lair
    .byte $08                               ; [5]: Towns
    .byte $06                               ; [6]: King's Room Guru Room
                                            ; Hospital
    .byte $06                               ; [7]: Tavern Tool Shop Key Shop
                                            ; House Meat Shop
    .byte $04                               ; [8]: Martial Arts Magic Trainer


;============================================================================
; Set the VRAM address increment per CPU read/write of PPUDATA to 0: Add 1,
; going across.
;
; INPUTS:
;     PPU_ControlFlags:
;         The saved PPU control flags.
;
; OUTPUTS:
;     PPUCTRL:
;     PPU_ControlFlags:
;         The updated PPU control flags.
;
; XREFS:
;     Area_LoadTiles
;============================================================================
PPU_SetVRAMIncrementAdd1Across:             ; [$cf2b]
    LDA PPU_ControlFlags                    ; Load the PPU control flags.
    AND #$fb                                ; Set VRAM address increment per
                                            ; CPU read/write of PPUDATA to 0:
                                            ; Add 1, going across.
    STA PPU_ControlFlags                    ; Set it to SavedPPUCtrl.
    STA a:PPUCTRL                           ; Set it to PPUCTRL.
    RTS


;============================================================================
; MAYBE DEADCODE: Clear the PPU buffer.
;
; Both the offset and upper bounds will be reset back to 0.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     PPUBuffer_ReadOffset:
;         The offset to clear.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds value to clear.
;============================================================================
PPUBuffer_Clear:                            ; [$cf35]
    LDA #$00
    STA PPUBuffer_ReadOffset                ; Set offset = 0
    STA PPUBuffer_WriteOffset               ; Set upper bounds = 0

    ;
    ; XREFS:
    ;     PPUBuffer_Draw
    ;
RETURN_CF3B:                                ; [$cf3b]
    RTS


;============================================================================
; Draw from the PPU buffer to the PPU.
;
; This will take the entries in the current buffer and draw
; them to the PPU. Buffer entries may contain a command
; opcode, or it may contain values to write.
;
; Let's look into the two methods for drawing.
;
; 1. Command control
;
;    If the first byte to process in the buffer is a value
;    decreasing from 0x00 to 0xFA, it will be treated as a
;    command, and the entry in
;    PPUBUFFER_DRAW_COMMANDS will
;    process the remaining bytes (or just return).
;
;    The following commands are supported:
;
;    0x00: Write palette data
;
;          PPUBuffer_DrawCommand_WritePalette
;
;    0xFC: Rotate 16 pixels of tiles right by 1 pixel at
;          a given address (at the next two bytes from
;          the buffer).
;
;          PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;
;    0xFA: TODO
;    PPUBuffer_DrawCommand_RemoveVerticalLines
;
;    Commands 0xFF, 0xFE, 0xFD, and 0xFB just return.
;
;    Once a command is processed, the operation is complete.
;    Further entries in the buffer will be processed in
;    future calls.
;
; 2. Data drawing
;
;    The first byte at the buffer offset will contain a
;    value with a PPUCTRL flag in bit 7 and the number of
;    bytes to write in the remaining bit.
;
;    The second and third contain the upper and lower bytes
;    of PPUADDR (respectively).
;
;    Additional bytes are the <length> bytes to write.
;
;    Drawing finishes after any of the following conditions
;    are met:
;
;    1. The buffer is empty.
;    2. 6 entries from the buffer have been drawn.
;    3. A maximum number of bytes have been written
;       (48 bytes).
;
; INPUTS:
;     PPUBuffer:
;         The PPU buffer to process.
;
;     PPUBuffer_ReadOffset:
;         The offset within the PPU buffer to process.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds within the PPU buffer to process.
;
; OUTPUTS:
;     PPUCTRL:
;         PPU control flags.
;
;     PPUADDR:
;         PPU write address (reset back to 0).
;
;     PPUDATA:
;         PPU draw data.
;
; TEMP VARIABLES:
;     PPUBuffer_Temp_PendingEntryCount:
;         The maximum number of entries remaining to
;         process.
;
;     PPUBuffer_Temp_TotalByteLength:
;         The total number of bytes processed.
;
; CALLS:
;     PPUBuffer_DrawCommand_WritePalette
;     PPUBuffer_DrawCommand_RotateTilesRight1Pixel
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;
; XREFS:
;     PPUBuffer_DrawAll
;     PPU_HandleOnInterrupt
;     Player_DrawSpriteImmediately
;============================================================================
PPUBuffer_Draw:                             ; [$cf3c]
    ;
    ; Check if there's anything in the buffer to write.
    ; If not, we're done.
    ;
    LDA PPUBuffer_ReadOffset                ; A = current buffer offset
    CMP PPUBuffer_WriteOffset               ; Compare against the upper bound
                                            ; of the PPU buffer.
    BEQ RETURN_CF3B                         ; If they're the same, we have
                                            ; nothing to write. We're done.


    ;
    ; Check the value in the offset and see if it appears to
    ; be a command opcode of some sort (an index into
    ; PPUBUFFER_DRAW_COMMANDS.
    ;
    LDX PPUBuffer_ReadOffset                ; X = current PPU offset
    LDA #$00                                ; Take a value from $00 to $FA
                                            ; (decreasing) and turn it into
                                            ; an index.  $00 = 0 $FF = 1 $FE
                                            ; = 2 $FD = 3 $FC = 4 $FB = 5 $FA
                                            ; = 6
    SEC
    SBC PPUBuffer,X                         ; Get the value from the buffer
                                            ; at this offset.
    CMP #$07                                ; Check if it's a command code.
    BCS @_beginDraw                         ; If not, draw normally.


    ;
    ; It is a command code. Increment to the next byte, look up
    ; the entry for the command in our table, and schedule the
    ; address following for the execution after this returns.
    ;
    INC PPUBuffer_ReadOffset                ; Consume the byte in the buffer.
    ASL A
    TAY                                     ; Begin looking up in the table.
    LDA PPUBUFFER_DRAW_COMMANDS+1,Y         ; High byte of the command
                                            ; address.
    PHA                                     ; Push to the stack.
    LDA PPUBUFFER_DRAW_COMMANDS,Y           ; Low byte of the command
                                            ; address.
    PHA                                     ; Push to the stack.
    RTS                                     ; Return. The next address
                                            ; following will execute.


    ;
    ; This is standard data to write to the PPU, not a command.
    ;
  @_beginDraw:                              ; [$cf5b]
    LDA #$d0                                ; Total byte length that can be
                                            ; written.
    STA PPUBuffer_Temp_TotalByteLength      ; Set it.
    LDA #$06                                ; Max number of entries in the
                                            ; buffer that can be written.
    STA PPUBuffer_Temp_PendingEntryCount    ; Set it.


    ;
    ; Loop through the buffer until either it's cleared or we've
    ; processed 6 entries.
    ;
  @_loopBuffer:                             ; [$cf63]
    LDX PPUBuffer_ReadOffset                ; X = Read offset into the
                                            ; buffer.
    CPX PPUBuffer_WriteOffset               ; Compare it to the write offset.
    BEQ @_finishLoop                        ; If it's the same, the loop is
                                            ; finished.


    ;
    ; Compute the PPUCTRL to set for this series of writes.
    ;
    ; If the most-significant bit is set, we'll set it to
    ; Add32 Down mode. Otherwise, we'll set it to Add1 Across
    ; mode.
    ;
    LDA PPU_ControlFlags                    ; A = PPU control flags.
    AND #$fb                                ; Set to Add 1 Across.
    TAY                                     ; Y = Resulting flags.
    LDA PPUBuffer,X                         ; Load the byte from the buffer.
    BPL @_processData                       ; If bit 7 is set, jump.
    AND #$7f                                ; Else, set VBLank Disable.
    INY                                     ; And Inc Add 32 Down.
    INY
    INY
    INY

  @_processData:                            ; [$cf79]
    STY a:PPUCTRL                           ; Store the new control flags.


    ;
    ; Load the first byte from the buffer at our offset.
    ; Mask out bit 7 (our flag above). This will be our
    ; data length counter.
    ;
    LDA PPUBuffer,X                         ; A = value from the buffer
    AND #$7f                                ; Mask out control bit 7.
    TAY                                     ; Y = A (save until we load the
                                            ; address)
    INX                                     ; Set to the next byte.
    LDA PPUBuffer,X                         ; Load the upper PPU byte address
                                            ; from the buffer.
    STA a:PPUADDR                           ; Set as the upper byte in
                                            ; PPUADDR.
    INX                                     ; X = X + 1
    LDA PPUBuffer,X                         ; Load the lower PPU byte address
                                            ; from the buffer.
    STA a:PPUADDR                           ; Set as the lower byte in
                                            ; PPUADDR.
    INX                                     ; X = X + 1
    TYA                                     ; Y = A (restore from above)
    CLC
    ADC PPUBuffer_Temp_TotalByteLength      ; Add the length to our running
                                            ; total.
    STA PPUBuffer_Temp_TotalByteLength


    ;
    ; Begin writing <length> bytes from the buffer to the PPU.
    ;
  @_loopData:                               ; [$cf97]
    LDA PPUBuffer,X                         ; Load the byte to draw at our
                                            ; current offset.
    INX                                     ; Increment the offset.
    STA a:PPUDATA                           ; Set the byte in our PPUDATA.
    DEY                                     ; Decrement the nuber of bytes to
                                            ; write.
    BNE @_loopData                          ; If we're not done yet, loop.


    ;
    ; We're done writing the data bytes. We can now update the
    ; offset and check whether to move on to the next, or if
    ; we're done with the buffer for now.
    ;
    ; We're done with the buffer if we've hit 6 entries, maxed
    ; out our byte length counter, or hit a new command opcode.
    ;
    STX PPUBuffer_ReadOffset                ; Increment our offset into the
                                            ; buffer to skip the length and
                                            ; address bytes and all the data
                                            ; bytes.
    DEC PPUBuffer_Temp_PendingEntryCount    ; Decrement our total allowed
                                            ; entries for this operation.
    BEQ @_finishLoop                        ; If we can't do any more, we're
                                            ; done.
    LDY PPUBuffer,X                         ; Load the next byte to process
                                            ; from the buffer.
    DEY
    CPY #$f9                                ; Check if it's a command byte.
    BCS @_finishLoop                        ; If it is, we're done. This will
                                            ; be handled next call.
    LDA PPUBuffer_Temp_TotalByteLength      ; Check the total byte length.
    BMI @_loopBuffer                        ; If there's room to go, loop.


    ;
    ; We're done with everything. Clear out the PPU addresses and
    ; return.
    ;
  @_finishLoop:                             ; [$cfb3]
    LDA #$00
    STA a:PPUADDR                           ; Set upper PPUADDR to 0.
    STA a:PPUADDR                           ; Set lower PPUADDR to 0.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; No-op draw command.
;
; This is just used as a destination for the draw commands
; lookup table below. It's also the end of the function.
; above.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfbe]
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfc0]
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfc2]
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfc6]
;============================================================================
PPUBuffer_DrawCommand_Noop:                 ; [$cfbb]
    RTS


;============================================================================
; Handlers for special PPU buffer draw commands.
;
; XREFS:
;     PPUBuffer_Draw
;============================================================================

;
; XREFS:
;     PPUBuffer_Draw
;
PPUBUFFER_DRAW_COMMANDS:                    ; [$cfbc]
    pointer PPUBuffer_DrawCommand_WritePalette-1 ; [0]: Command 0x00: Write
                                                 ; Palette to PPU
    pointer PPUBuffer_DrawCommand_Noop-1    ; [1]: Command 0xFF
    pointer PPUBuffer_DrawCommand_Noop-1    ; [2]: Command 0xFE
    pointer PPUBuffer_DrawCommand_Noop-1    ; [3]: Command 0xFD
    pointer PPUBuffer_DrawCommand_RotateTilesRight1Pixel-1 ; [4]: Command
                                                           ; 0xFC: Rotate
                                                           ; Tiles Right
    pointer PPUBuffer_DrawCommand_Noop-1    ; [5]: Command 0xFB
    pointer PPUBuffer_DrawCommand_RemoveVerticalLines-1 ; [6]: Command 0xFA:
                                                        ; Remove Vertical
                                                        ; Lines


;============================================================================
; Wait for capacity in the PPU buffer.
;
; This will block until the PPU buffer has been flushed and
; there's at least 36 bytes remaining.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     PPUBuffer_HasCapacity
;
; XREFS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_WaitForCapacity
;============================================================================
PPUBuffer_WaitForCapacity:                  ; [$cfca]
    JSR PPUBuffer_HasCapacity               ; Is there capacity?
    BCC PPUBuffer_WaitForCapacity           ; If not, loop.
    RTS


;============================================================================
; Return whether there's at least 36 bytes of PPU buffer free.
;
; XXX Not right. Re-analyze this.
;
; INPUTS:
;     PPUBuffer_ReadOffset:
;         The current offset into the PPU buffer.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds of the PPU buffer.
;
; OUTPUTS:
;     C:
;         0 = Fewer than 36 bytes available in the buffer.
;         1 = 36 or more bytes available in the buffer.
;
; XREFS:
;     PPUBuffer_WaitForCapacity
;============================================================================
PPUBuffer_HasCapacity:                      ; [$cfd0]
    LDA PPUBuffer_ReadOffset                ; A = PPU buffer offset.
    SEC
    SBC PPUBuffer_WriteOffset               ; A = offset - upper
    BEQ @_return                            ; If (offset - upper) == 0, jump
                                            ; to return false.
    CMP #$24                                ; Set whether there's at least 36
                                            ; bytes difference.

  @_return:                                 ; [$cfd9]
    RTS
    .byte $09,$80                           ; [$cfda] word


;============================================================================
; Queue for writing PPU data to the target address.
;
; This will wait for capacity in the PPU buffer and then
; write the given command or length, followed by the target
; PPU address to write to. That's a total of 3 bytes.
;
; Callers can then write additional data to the buffer.
;
; This doesn't update PPUBuffer_WriteOffset. Callers
; are responsible for that.
;
; INPUTS:
;     A:
;         The command or length to write.
;
;     PPU_TargetAddr:
;         The PPU target address to write to.
;
;     PPUBuffer_WriteOffset:
;         The current upper bounds of the PPU target buffer.
;         This is where the state will be written to.
;
; OUTPUTS:
;     X:
;         The new write offset in the PPU buffer.
;
;     PPUBuffer:
;         The updated PPU buffer.
;
; CALLS:
;     PPUBuffer_WaitForCapacity
;
; XREFS:
;     DEADCODE_FUN_PRG12__9041
;     IScriptAction_AddInventoryItem_ClearTextBox
;     PasswordScreen_DrawMessage
;     PasswordScreen_WriteCharTile
;     TextBox_Close
;     TextBox_DrawItemImage
;     TextBox_FillBackground
;     UI_DrawString
;     Area_SetBlocks_SetAttributes
;     Area_SetBlocks_WriteBlockData12
;     Area_SetBlocks_WriteBlockData34
;     DEADCODE_FUN_PRG15_MIRROR__c033
;     IScripts_DrawPortraitTileToPPU
;     PPUBuffer_WriteValueMany
;     Player_LoadWeaponTile
;     Sprites_LoadImageForCurrentSprite
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;     TextBox_LoadItemSourceTiles
;     TextBox_QueuePPUBufferTextBoxLength
;     TextBox_WriteChar
;     UI_ClearSelectedItemPic
;     UI_DrawDigitsZeroPadded
;     UI_DrawManaOrHPBar
;============================================================================
PPUBuffer_QueueCommandOrLength:             ; [$cfdc]
    ;
    ; Wait for capacity in the buffer.
    ;
    PHA                                     ; Push the length/command to the
                                            ; stack.
    JSR PPUBuffer_WaitForCapacity           ; Wait for capacity in the
                                            ; buffer.


    ;
    ; There's capacity. Set up to write.
    ;
    ; Start with the length or command byte.
    ;
    PLA
    LDX PPUBuffer_WriteOffset               ; Load the upper bounds of the
                                            ; buffer.
    STA PPUBuffer,X                         ; Store the provided value (A)
                                            ; there.
    INX
    LDA PPU_TargetAddr_U                    ; Load the upper address byte.
    STA PPUBuffer,X                         ; Write it to the buffer.
    INX
    LDA PPU_TargetAddr                      ; Load the lower address byte.
    STA PPUBuffer,X                         ; Write it to the buffer.
    INX
    RTS


;============================================================================
; Wait until the PPU buffer is clear.
;
; This will continuously loop until the PPU buffer's
; offset and upper bounds match.
;
; INPUTS:
;     PPUBuffer_ReadOffset:
;         The offset to compare.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds to compare.
;
; OUTPUTS:
;     None
;
; XREFS:
;     GameLoop_LoadSpriteImages
;     Game_MainLoop
;     PPUBuffer_WaitUntilClear
;============================================================================
PPUBuffer_WaitUntilClear:                   ; [$cff4]
    LDA PPUBuffer_WriteOffset               ; Load the upper bounds of the
                                            ; buffer.
    CMP PPUBuffer_ReadOffset                ; Does it == the offset?
    BNE PPUBuffer_WaitUntilClear            ; If not, loop.
    RTS


;============================================================================
; Invoke all draws on the PPU buffer until it's cleared.
;
; This will continuously run PPUBuffer_Draw until
; the
; draw buffer has been cleared.
;
; INPUTS:
;     PPUBuffer_ReadOffset:
;         The offset to compare.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds to compare.
;
; OUTPUTS:
;     None
;
; CALLS:
;     PPUBuffer_Draw
;
; XREFS:
;     PPUBuffer_DrawAll
;     UI_DrawHUD
;============================================================================
PPUBuffer_DrawAll:                          ; [$cffb]
    JSR PPUBuffer_Draw                      ; Draw from the buffer.
    LDA PPUBuffer_WriteOffset               ; Load the upper bounds.
    CMP PPUBuffer_ReadOffset                ; Does it match the offset?
    BNE PPUBuffer_DrawAll                   ; If not, loop.
    RTS


;============================================================================
; DEADCODE
;
; This would have loaded background palette 4 and queue
; writing it to the PPU.
;
; It's not used in the shipped game.
;============================================================================
UNUSED_PPUBuffer_DrawCommand_WriteBackgroundPalette4: ; [$d005]
    LDA #$04
    JSR Screen_LoadUIPalette
    JMP PPUBuffer_WritePalette


;============================================================================
; DEADCODE
;
; This would have loaded the background palette for the
; current screen and queue writing it to the PPU.
;
; It's not used in the shipped game.
;============================================================================
UNUSED_WriteCurrentBackgroundPalette:       ; [$d00d]
    LDA a:Screen_PaletteIndex
    JSR Screen_LoadUIPalette
    JMP PPUBuffer_WritePalette


;============================================================================
; Draw Command 0x00: Write the screen palette.
;
; This flushes Screen_PaletteData_Tiles to the PPU,
; writing both the background and sprite palette.
;
; INPUTS:
;     Screen_PaletteData_Tiles:
;         The screen palette to write.
;
; OUTPUTS:
;     PPUADDR:
;     PPUDATA:
;         The written PPU data.
;
; XREFS:
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfbc]
;============================================================================
PPUBuffer_DrawCommand_WritePalette:         ; [$d016]
    ;
    ; Write all 32 palettes to 0x3F00.
    ;
    LDA #$3f                                ; 0x3F == Upper byte.
    STA a:PPUADDR                           ; Write as the upper PPU address.
    LDX #$00                                ; 0x00 == Lower byte.
    STX a:PPUADDR                           ; Write as the lower PPU address.


    ;
    ; Loop through 32 bytes of palette data and write to the PPU.
    ;
    LDY #$20                                ; Y = 32 (loop counter).

  @_paletteLoop:                            ; [$d022]
    LDA Screen_PaletteData_Tiles,X          ; A = Palette byte at the index.
    STA a:PPUDATA                           ; Write to the PPU.
    INX                                     ; Increment the PPU address.
    DEY                                     ; Y-- (loop counter).
    BNE @_paletteLoop                       ; If > 0, loop.


    ;
    ; Avoid palette corruption by setting to address 0x3F00,
    ; and then zeroing out (0x0000).
    ;
    ; See https://www.nesdev.org/wiki/PPU_registers#Palette_corruption
    ;
    LDA #$3f                                ; 0x3F == Upper byte.
    STA a:PPUADDR                           ; Write as the upper PPU address.
    STY a:PPUADDR                           ; Zero out the lower byte.
    STY a:PPUADDR                           ; Now zero out the upper byte.
    STY a:PPUADDR                           ; And the lower again.
    RTS


;============================================================================
; Populate the palette data for HUD/textbox elements.
;
; This will load the palette data for the background of
; the HUD and textbox data stored in bank 11 at the
; address stored in Temp_08 and populate
; Screen_PaletteData_Tiles.
;
; INPUTS:
;     Y:
;         The palette destination index to load into.
;
;     Temp_08:
;         The address to load data from in bank 11.
;
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     Screen_PaletteData_Tiles:
;         The resulting palette data.
;
;     Palette_SpritePaletteIndex:
;         The index of the loaded palette.
;
;     UI_AttributeDataIndex:
;         The index of the background color used for
;         textboxes and the HUD.
;
;     Temp_08:
;     Temp_09:
;         Clobbered
;
; CALLS:
;     MMC1_UpdateROMBank
;     Palette_IndexToROMOffset16
;
; XREFS:
;     StartScreen_Draw
;     Player_HandleDeath
;     Screen_SetupNew
;     UNUSED_PPUBuffer_DrawCommand_WriteBackgroundPalette4
;     UNUSED_WriteCurrentBackgroundPalette
;============================================================================
Screen_LoadUIPalette:                       ; [$d03b]
    TAY                                     ; Y = A (palette index).


    ;
    ; Save the current bank and load bank 11 (palette data).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b
    JSR MMC1_UpdateROMBank                  ; Switch to bank 11.


    ;
    ; Set the attribute data index for the HUD.
    ;
    LDA BYTE_81f0,Y                         ; Load the HUD attribute data for
                                            ; this index.
    STA a:UI_AttributeDataIndex             ; Set it for the HUD/textboxes.


    ;
    ; Restore our current bank.
    ;
    PLA                                     ; Pop A (previous bank) from the
                                            ; stack.
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; Switch back to the bank.


    ;
    ; Get the offset into the bank.
    ;
    TYA                                     ; A = Y (palette index).
    JSR Palette_IndexToROMOffset16          ; Convert to a relative offset
                                            ; into the bank.
    ADC #$00                                ; Add 0 + C (also 0) to the lower
                                            ; byte.
    STA Temp_08                             ; Store it.
    LDA Temp_09                             ; Load the computed upper byte.
    ADC #$80                                ; Add 0x80.
    STA Temp_09                             ; Store it.


    ;
    ; Write that palette into the sprite palette.
    ;
    LDY #$0f                                ; Start writing into index 16
                                            ; (sprite palette).
    BNE Screen_SetPaletteData               ; Load it.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Populate the sprite palette data for the screen.
;
; This will load the palette data for sprites from the
; data stored in bank 11 at the address stored in
; Temp_08 and populate
; Screen_PaletteData_Tiles.
;
; INPUTS:
;     Y:
;         The palette destination index to load into.
;
;     Temp_08:
;         The address to load data from in bank 11.
;
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     Screen_PaletteData_Tiles:
;         The resulting palette data.
;
;     Palette_SpritePaletteIndex:
;         The index of the loaded palette.
;
;     Temp_08:
;     Temp_09:
;         Clobbered
;
; CALLS:
;     MMC1_UpdateROMBank
;     Palette_IndexToROMOffset16
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     IScripts_ClearPortraitImage
;     IScripts_LoadPortraitTiles
;     Screen_Load
;============================================================================
Screen_LoadSpritePalette:                   ; [$d062]
    STA a:Palette_SpritePaletteIndex        ; Set the palette index based on
                                            ; the provided A.


    ;
    ; Compute the ROM address for this palette.
    ;
    ; This should be 0x81C0 + palette offset.
    ;
    JSR Palette_IndexToROMOffset16          ; Convert the relative address
                                            ; for the palette.
    ADC #$c0                                ; Add 0xC0 to the lower byte.
    STA Temp_08                             ; Store it.
    LDA Temp_09                             ; Load the computed upper byte.
    ADC #$81                                ; Add 0x81 to it.
    STA Temp_09                             ; Store it back.


    ;
    ; Save the previous bank and switch to bank 11 (palette data).
    ;
    LDY #$1f                                ; Y = Destination for the palette
                                            ; (31).

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Populate palette data for the screen.
;
; This will load the palette data from the data stored
; in bank 11 at the address stored in Temp_08 and
; populate Screen_PaletteData_Tiles.
;
; This is common to both Screen_LoadUIPalette
; and Screen_LoadSpritePalette.
;
; INPUTS:
;     Y:
;         The palette destination index to load into.
;
;     Temp_08:
;         The address to load data from in bank 11.
;
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     Screen_PaletteData_Tiles:
;         The resulting palette data.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Screen_LoadUIPalette
;============================================================================
Screen_SetPaletteData:                      ; [$d074]
    ;
    ; Save the current bank.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b
    JSR MMC1_UpdateROMBank                  ; Switch to bank 11.


    ;
    ; Copy 16 bytes of palette into ROM.
    ;
    TYA                                     ; A = Y (palette data index)
    TAX                                     ; X = A
    LDY #$0f                                ; Y = 15 (loop counter)

  @_loadPaletteLoop:                        ; [$d081]
    LDA (Temp_08),Y                         ; Load the byte to copy.
    STA Screen_PaletteData_Tiles,X          ; Store as the palette data at
                                            ; the index.
    DEX                                     ; X-- (destination index)
    DEY                                     ; Y-- (loop counter)
    BPL @_loadPaletteLoop                   ; If >= 0, loop.


    ;
    ; Switch bank to the previous bank.
    ;
    PLA                                     ; Pop the previous bank.
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.
    RTS


;============================================================================
; Queue writing the palette to the PPU.
;
; This will write Draw Command 0 to the PPU buffer,
; responsible for writing the palette.
;
; INPUTS:
;     Screen_PaletteData_Tiles:
;         The palette data to write.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds of the buffer.
;
; OUTPUTS:
;     PPUBuffer:
;         The PPU buffer to append to.
;
;     PPUBuffer_WriteOffset:
;         The new size of the buffer.
;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     SplashAnimation_Intro_SomethingA708
;     StartScreen_Draw
;     IScripts_ClearPortraitImage
;     IScripts_LoadPortraitTiles
;     Player_HandleDeath
;     Screen_SetFadeOutPalette
;     Screen_SetupSprites
;     UNUSED_PPUBuffer_DrawCommand_WriteBackgroundPalette4
;     UNUSED_WriteCurrentBackgroundPalette
;============================================================================
PPUBuffer_WritePalette:                     ; [$d090]
    LDA #$00                                ; A = 0
    LDX PPUBuffer_WriteOffset               ; X = upper bounds of the buffer
    STA PPUBuffer,X                         ; Store the 0 in the buffer at
                                            ; the upper bounds.
    INX                                     ; Increment the upper bounds.
    STX PPUBuffer_WriteOffset
    RTS


;============================================================================
; Return a 16-bit offset for a value.
;
; This multiplies the provided index by 16 and splits the
; 16-bit result into a low byte (A) and a high byte
; (Temp_09).
;
; Carry is cleared on exit so the caller can 16-bit add a
; base address with ADC (low) / ADC (high) cleanly.
;
; This is used by palette code to build a ROM pointer in
; the form of:
;
;     PaletteAddr = Base + (index * 16)
;
; INPUTS:
;     A:
;         The index to convert to a 16-byte offset.
;
; OUTPUTS:
;     Temp_09:
;         The high byte (index * 16)
;
;     A:
;         The low byte (index * 16)
;
;     C (Carry):
;         Cleared (0) for subsequent 16-bit ADC adds.
;
;     Y:
;         Set to 0 (clobbered).
;
; XREFS:
;     Screen_LoadSpritePalette
;     Screen_LoadUIPalette
;     Screen_SetFadeOutPalette
;============================================================================
Palette_IndexToROMOffset16:                 ; [$d09b]
    LDY #$00                                ; Y = 0
    STY Temp_09                             ; Store it temporarily.
    ASL A                                   ; Shift left, upper bit into
                                            ; Carry.
    ROL Temp_09                             ; Rotate left, carry into bit 0,
                                            ; bit 7 into carry.
    ASL A                                   ; Repeat 3 more times, moving
                                            ; lower nibble into A, upper
                                            ; nibble into
                                            ; Temp_09.
    ROL Temp_09
    ASL A
    ROL Temp_09
    ASL A
    ROL Temp_09
    CLC                                     ; Clear carry.
    RTS                                     ; Return A and
                                            ; Temp_09.


;============================================================================
; Update the current palette for the fade-out stage.
;
; This will iterate through the background palette,
; subtracting a value from each byte depending on the stage
; (increasing along with the stage's value). It works out
; as:
;
;     Screen_PaletteData_Tiles[i] =
;     Screen_FadeOutStage * 0x10
;
; INPUTS:
;     A:
;         The index of the palette to use as a source.
;
;     CurrentROMBank:
;         The current ROM bank.
;
;     Screen_FadeOutStage:
;         The current stage of fade-out, between 0 and 3.
;
;     FADE_OUT_DELTA_TABLE:
;         The table of palette values to subtract, based on
;         the stage.
;
; OUTPUTS:
;     Screen_PaletteData_Tiles:
;         The modified background palette data.
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPUBuffer_WritePalette
;     Palette_IndexToROMOffset16.
;
; XREFS:
;     Screen_NextTransitionState
;============================================================================
Screen_SetFadeOutPalette:                   ; [$d0ad]
    ;
    ; Get an address for the provided palette in bank 11.
    ;
    JSR Palette_IndexToROMOffset16          ; Convert the palette to a 16-bit
                                            ; integer.
    ADC #$00                                ; Add 0 and carry (which is also
                                            ; 0) to the lower byte.
    STA Temp_08                             ; Store temporarily as the lower
                                            ; byte.
    LDA Temp_09                             ; Load it back into A.
    ADC #$80                                ; Add 0x80.
    STA Temp_09                             ; Store as the upper byte.


    ;
    ; Save the current bank and switch to bank 11.
    ;
    LDA a:CurrentROMBank                    ; Load the current bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b                                ; 11 = Sprite info/palettes bank.
    JSR MMC1_UpdateROMBank                  ; Switch to that bank.
    LDX a:Screen_FadeOutStage


    ;
    ; Beginning looping through the 16 bytes of palette.
    ;
    ; This will load the palette for the current screen and
    ; then subtract a value from a fade-out table
    ; (FADE_OUT_DELTA_TABLE) based on the fade-out
    ; cycle (Screen_FadeOutStage).
    ;
    LDY #$0f                                ; Y = 15 (loop counter).

  @_loop:                                   ; [$d0c8]
    LDA (Temp_08),Y                         ; Load the palette data at Y.
    SEC                                     ; Set C = 1 so SBC won't subtract
                                            ; C.
    SBC FADE_OUT_DELTA_TABLE,X              ; Subtract the value form the
                                            ; lookup table at the transition
                                            ; index.
    BCS @_setPaletteData                    ; If > 0, jump to use this value
                                            ; as the palette.


    ;
    ; The subtraction yielded a palette value <= 0, so
    ; hard-code to 15.
    ;
    LDA #$0f                                ; Set palette = 15.

  @_setPaletteData:                         ; [$d0d2]
    STA Screen_PaletteData_Tiles,Y          ; Set the palette data to A at
                                            ; index Y.
    DEY                                     ; Y--
    BPL @_loop                              ; If >= 0, loop.


    ;
    ; Restore the previous bank.
    ;
    PLA                                     ; Pull the previous bank from the
                                            ; stack.
    TAX                                     ; Set in X.
    JSR MMC1_UpdateROMBank                  ; And switch to that bank.
    JMP PPUBuffer_WritePalette              ; Append to the PPU buffer to
                                            ; trigger a screen update.


;============================================================================
; Table of values to subtract from a palette to fade-out the current screen.
;
; XREFS:
;     Screen_SetFadeOutPalette
;============================================================================

;
; XREFS:
;     Screen_SetFadeOutPalette
;
FADE_OUT_DELTA_TABLE:                       ; [$d0e0]
    .byte $10                               ; [0]:
    .byte $20                               ; [1]:
    .byte $30                               ; [2]:
    .byte $40                               ; [3]:


;============================================================================
; Play a sound effect.
;
; INPUTS:
;     A:
;         The sound ID to play.
;
; OUTPUTS:
;     Temp_SoundIDToPlay:
;         Clobbered.
;
; CALLS:
;     SoundEffect_SetCurrent
;
; XREFS:
;     IScripts_PlayFillingSound
;     IScripts_PlayGoldChangeSound
;     Menu_UpdateAndDraw
;     PasswordScreen_DrawAndHandleInputLoop
;     PlayerMenu_EquipItem
;     PlayerMenu_HandleInvalidChoice
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     Sound_PlayInputSound
;     Sound_PlayMoveCursorSound
;     SplashAnimation_Maybe_AnimPlayerStep
;     StartScreen_CheckHandleInput
;     CastMagic_UpdateDeluge
;     CastMagic_UpdateFire
;     Player_CastMagic
;     Player_HandleShieldHitByMagic
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchEnemy
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior_BossDeath
;     SpriteBehavior_FlashScreenHitPlayer
;     SpriteBehavior_Garbled3
;     SpriteBehavior_Pakukame
;     Sprites_ReplaceWithCoinDrop
;     Game_DropLadderToMascon
;     Game_UnlockDoor
;     Player_CheckPushingBlock
;     Player_FillHPAndMP
;     Player_HandleDeath
;     Player_PickUpBattleHelmet
;     Player_PickUpBattleSuit
;     Player_PickUpBlackOnyx
;     Player_PickUpDragonSlayer
;     Player_PickUpElixir
;     Player_PickUpGlove
;     Player_PickUpHourGlass
;     Player_PickUpMattock
;     Player_PickUpOintment
;     Player_PickUpRedPotion
;     Player_PickUpWingBoots
;     Player_UseHourGlass
;     Player_UseMattock
;     Player_UseRedPotion
;     Player_UseWingBoots
;     ScreenEvents_HandleFinalBossKilled
;     TextBox_ShowMessageWithSound
;============================================================================
Sound_PlayEffect:                           ; [$d0e4]
    STA a:Temp_SoundIDToPlay                ; Store the provided sound effect
                                            ; to play.


    ;
    ; Push X and Y on the stack. They will be clobbered when
    ; playing the sound.
    ;
    TXA                                     ; Push X
    PHA
    TYA                                     ; Push Y
    PHA
    LDA a:Temp_SoundIDToPlay                ; Load the sound ID we stored.
    JSR SoundEffect_SetCurrent              ; Play the sound.


    ;
    ; Pop X and Y from the stack and restore.
    ;
    PLA                                     ; Pop A into Y.
    TAY
    PLA                                     ; Pop A into X.
    TAX
    RTS

;============================================================================
; TODO: Document Area_ScrollScreenRight
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_SetupNew
;============================================================================
Area_ScrollScreenRight:                     ; [$d0f6]
    LDA #$00
    STA Screen_Maybe_ScrollHorizDirection
    STA MaybeUnused_006d
    STA Screen_Maybe_ScrollHorizDirection
    LDA #$00
    STA PPU_ScrollY
    STA PPU_ScrollX
    STA PPU_ScrollScreen
    STA Screen_LoadBlocksStage
    STA Screen_NeighborBlocksLoadedByDirection
    STA Screen_ScrollHorizBlocksLoaded
    STA Screen_MaybeUnused_0075
    STA Screen_ScrollHorizAttrsLoaded
    LDX #$00
    STX PPU_ScrollX
    INX
    STX PPU_ScrollScreen
    LDX #$01
    JSR Area_LoadScrollDataRight

  @_loop:                                   ; [$d11c]
    JSR Screen_HandleScroll
    JSR Screen_RunWriteScrollDataHandler
    LDA Screen_ScrollDirection
    BPL @_loop
    RTS

;============================================================================
; TODO: Document Area_LoadScrollDataRight
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_ScrollScreenRight
;     Area_ScrollTo
;============================================================================
Area_LoadScrollDataRight:                   ; [$d127]
    STX Screen_ScrollDirection
    LDA PPU_ScrollScreen
    STA PPU_ScrollScreenHoriz
    LDA PPU_ScrollX
    STA Screen_ScrollHorizLoadCounter
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    LDA #$00
    STA Temp_Addr_U
    LDA Area_CurrentScreen
    ASL A
    ROL Temp_Addr_U
    ASL A
    ROL Temp_Addr_U
    CLC
    ADC CurrentArea_ScrollingDataAddr
    STA Temp_Addr_L
    LDA Temp_Addr_U
    ADC ScrollingData_U
    STA Temp_Addr_U
    LDY #$00

  @_loadScrollData:                         ; [$d153]
    LDA (Temp_Addr_L),Y
    STA Area_ScreenToTheLeft,Y
    INY
    CPY #$04
    BCC @_loadScrollData
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    LDX CurrentArea_ROMBank
    JSR MMC1_SaveROMBankAndUpdateTo


    ;
    ; Load blocks to the left of the screen.
    ;
    LDA Area_ScreenToTheLeft
    JSR Area_LoadBlocks
    LDX #$0f
    LDY #$00

  @_copyLastColumnLeftScreenLoop:           ; [$d170]
    LDA ScreenBuffer,X
    STA LastColumnLeftScreen,Y
    TXA
    CLC
    ADC #$10
    TAX
    INY
    CPY #$10
    BCC @_copyLastColumnLeftScreenLoop


    ;
    ; Load blocks to the right of the screen.
    ;
    LDA Area_ScreenToTheRight
    JSR Area_LoadBlocks
    LDX #$00
    LDY #$00

  @_copyRowScreenAboveLoop:                 ; [$d189]
    LDA ScreenBuffer,X
    STA FirstColumnInRightScreen,Y
    TXA
    CLC
    ADC #$10
    TAX
    INY
    CPY #$10
    BCC @_copyRowScreenAboveLoop


    ;
    ; Load blocks from the screen above.
    ;
    LDA Area_ScreenAbove
    JSR Area_LoadBlocks                     ; Load blocks from screen above.
    LDX #$f0                                ; X = 240

  @_copyRowScreenBelowLoop:                 ; [$d1a0]
    LDA $05d0,X
    STA $0316,X
    INX                                     ; X++
    BNE @_copyRowScreenBelowLoop


    ;
    ; Load blocks from the screen below.
    ;
    LDA Area_ScreenBelow
    JSR Area_LoadBlocks                     ; Load blocks from screen below.
    LDX #$f0

  @LAB_PRG15_MIRROR__d1b0:                  ; [$d1b0]
    LDA $0510,X
    STA $0326,X
    INX
    BNE @LAB_PRG15_MIRROR__d1b0


    ;
    ; Load blocks for the current screen.
    ;
    LDA Area_CurrentScreen
    JSR Area_LoadBlocks
    JSR MMC1_RestorePrevROMBank
    LDA Screen_ScrollDirection
    CMP #$02
    BCS @_VerticalScroll
    TAX
    LDA #$00
    STA Screen_ScrollPlayerTransitionCounter
    LDA Player_PosY
    STA Maybe_PlayerY_ForScroll
    LDA SCREEN_MAYBE_PLAYERX_FOR_SCROLL_MODE,X
    STA Maybe_PlayerX_ForScroll
    RTS

  @_VerticalScroll:                         ; [$d1d6]
    AND #$01
    TAX
    LDA Player_PosX_Block
    STA Maybe_PlayerX_ForScroll
    LDA #$00
    STA Screen_ScrollPlayerTransitionCounter
    LDA SCREEN_MAYBE_PLAYERX_FOR_SCROLL_MODE_2_,X
    STA Maybe_PlayerY_ForScroll
    RTS

;
; XREFS:
;     Area_LoadScrollDataRight
;
SCREEN_MAYBE_PLAYERX_FOR_SCROLL_MODE:       ; [$d1e7]
    .byte $00                               ; [0]:
    .byte $f0                               ; [1]:

;
; XREFS:
;     Area_LoadScrollDataRight
;
SCREEN_MAYBE_PLAYERX_FOR_SCROLL_MODE_2_:    ; [$d1e9]
    .byte $00                               ; [2]:
    .byte $d0                               ; [3]:


;============================================================================
; Fill the screen buffer with 0s.
;
; This will clear 256 bytes of screen data from $0600
; to $06FF.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     ScreenBuffer:
;         256 bytes of screen buffer will be cleared.
;
; XREFS:
;     Area_LoadBlocks
;============================================================================
ScreenBuffer_Clear:                         ; [$d1eb]
    LDX #$00                                ; X = 0
    LDA #$00                                ; A = 0


    ;
    ; Begin writing empty blocks.
    ;
  @_loop:                                   ; [$d1ef]
    STA ScreenBuffer,X                      ; Write 0 to the screen buffer.
    INX                                     ; X = X + 1
    BNE @_loop                              ; If X hasn't wrapped back to 0,
                                            ; loop.
    RTS


;============================================================================
; Load blocks for the given screen from the level data.
;
; This will load the compressed block data for a given
; screen. Data is stored in by using a control byte and
; optional data bytes.
;
; Control bytes dictate where the next block comes from.
; The following are supported:
;
; 0x00: Copy the block from one position to the left
;       (or last block on previous row, if at column 0).
;
; 0x01: Copy from the block in the row directly above.
;
; 0x02: Copy from the block directly up and to the left
;       (or last block 2 rows up, if at column 0)
;
; 0x03: Read the next value as the block.
;
; INPUTS:
;     A:
;         The index of the screen to load.
;
;     Area_ScreenBlocksOffset:
;         The offset into the blocks data for the current
;         screen.
;
; OUTPUTS:
;     ScreenBuffer:
;         Updated with loaded block data.
;
;     LoadCompressedScreenData_ByteOffset:
;     LoadCompressedScreenData_BitOffset:
;     Temp_LoadedBlockValue:
;     Temp_LoadedBlocksCount:
;     Temp_08:
;     Temp_09:
;         Clobbered.
;
; CALLS:
;     Area_LoadNextCompressedScreenBit
;     ScreenBuffer_Clear
;
; XREFS:
;     Area_LoadScrollDataRight
;============================================================================
Area_LoadBlocks:                            ; [$d1f6]
    CMP #$ff                                ; Check if the screen index is
                                            ; set.
    BEQ ScreenBuffer_Clear                  ; If not, then clear the screen
                                            ; buffer.


    ;
    ; We'll be loading blocks for this screen. Calculate
    ; the address we'll be loading from.
    ;
    ASL A                                   ; Multiply screen index by 2
    TAY                                     ; Y = New screen index offset
                                            ; value
    LDA (Area_ScreenBlocksOffset),Y         ; Set the lower block data
                                            ; address for this screen index.
    STA Temp_08                             ; Store it.
    INY                                     ; Y++
    LDA (Area_ScreenBlocksOffset),Y         ; Set the upper block data
                                            ; address for this screen index.
    CLC
    ADC #$80                                ; Add 0x80 to the upper byte.
    STA Temp_09                             ; Store this as our total CHR
                                            ; page count.


    ;
    ; Set our initial state for compressed block loading.
    ;
    LDA #$00                                ; A = 0
    STA LoadCompressedScreenData_ByteOffset ; Set byte offset to 0.
    STA Temp_LoadedBlocksCount              ; Set count to 0.
    STA LoadCompressedScreenData_BitOffset  ; Set bit offset to 0.


    ;
    ; Load the control bits for the block. This will dictate
    ; how loading will proceed.
    ;
  @_nextBlock:                              ; [$d210]
    LDA #$00
    STA Temp_LoadedBlockValue               ; Begin loading this block.


    ;
    ; Shift our block value left by 2 and add load the next two
    ; compressed bits into those spots.
    ;
    JSR Area_LoadNextCompressedScreenBit    ; Load next bit from compressed
                                            ; data.
    ROL Temp_LoadedBlockValue               ; Shift our block to the left 1
                                            ; and add the bit.
    JSR Area_LoadNextCompressedScreenBit    ; Load next bit from compressed
                                            ; data.
    ROL Temp_LoadedBlockValue               ; Shift our block to the left 1
                                            ; and add the bit.


    ;
    ; Check what bits we just loaded.
    ;
    LDA Temp_LoadedBlockValue               ; Load the current block value.
    AND #$03                                ; Check the 2 least-significant
                                            ; bits we loaded.
    TAX                                     ; X = Our loaded bits value
    CPX #$03                                ; Is the value 3?
    BEQ @_read8BitBlock                     ; If so, start a new block.


    ;
    ; Control 0x00, 0x01, or 0x02:
    ;
    ; Load the block value stored in the screen buffer at
    ; the current offset + bitValue-specific offset.
    ;
    LDA Temp_LoadedBlocksCount              ; Else, load our blocks count.
    CLC
    ADC BLOCK_DATA_OFFSETS_FOR_BIT_VALUES,X ; Add that to the value for this
                                            ; bit in the lookup table.
    TAX                                     ; Set as X
    LDA ScreenBuffer,X                      ; Load the block value from the
                                            ; screen buffer at the offset for
                                            ; this bit value.
    JMP @_storeBlock                        ; Proceed to store the block.


    ;
    ; Control 0x03: Read an 8-bit block.
    ;
  @_read8BitBlock:                          ; [$d234]
    LDX #$08                                ; X = 8 (total bits)
    LDA #$00                                ; A = 0 (new block value)
    STA Temp_LoadedBlockValue               ; Store that value.


    ;
    ; Load the block data. We'll load 8 bits worth.
    ;
    ; This is essentially going to be the same as the byte
    ; value, except the bits loaded may span multiple bytes.
    ;
  @_load8BitsOfBlockData:                   ; [$d23a]
    JSR Area_LoadNextCompressedScreenBit    ; Load next bit from compressed
                                            ; data.
    ROL Temp_LoadedBlockValue               ; Shift our block to the left 1
                                            ; and add the bit.
    DEX                                     ; X-- (total bits)
    BNE @_load8BitsOfBlockData              ; If we're not at 0, loop.
    LDA Temp_LoadedBlockValue               ; Else, load the resulting block
                                            ; value.


    ;
    ; Store the block value in the screen buffer at the
    ; current offset.
    ;
  @_storeBlock:                             ; [$d244]
    LDX Temp_LoadedBlocksCount              ; X = loaded block count, as our
                                            ; new offset
    STA ScreenBuffer,X                      ; Store the byte in the screen
                                            ; buffer at that offset.
    INC Temp_LoadedBlocksCount              ; Increment our block count.
    BNE @_nextBlock                         ; If we haven't loaded 256
                                            ; blocks, loop.


    ;
    ; We're done loading the blocks. We now need to
    ; fill in the last row of 16 blocks with zeroes.
    ;
    LDX #$f0                                ; X = 0xF0 (offset into the
                                            ; screen buffer to fill)
    LDA #$00                                ; A = 0 (value to store)


    ;
    ; Fill the last line.
    ;
  @_fillLastLine:                           ; [$d251]
    STA ScreenBuffer,X                      ; Store in the screen buffer.
    INX                                     ; X++
    BNE @_fillLastLine                      ; If we haven't hit 16 blocks
                                            ; (value 256 and wrapped around),
                                            ; then loop.
    RTS


;============================================================================
; Load the next bit from compressed data.
;
; This is used when decompressing screen data. It will
; process a bit at a time and make that result available
; to the caller.
;
; INPUTS:
;     Temp_07+1:
;         The address of the table of bytes to load from,
;         based on the byte offset.
;
;     LoadCompressedScreenData_ByteOffset:
;         The current byte offset.
;
;     LoadCompressedScreenData_BitOffset:
;         The current bit offset within the byte offset.
;
; OUTPUTS:
;     LoadCompressedScreenData_ByteOffset:
;         The new byte offset.
;
;     LoadCompressedScreenData_BitOffset:
;         The new bit offset.
;
;     LoadCompressedScreenData_CurByte:
;         The new loaded byte.
;
; XREFS:
;     Area_LoadBlocks
;============================================================================
Area_LoadNextCompressedScreenBit:           ; [$d258]
    LDA LoadCompressedScreenData_BitOffset  ; Load the current bit.
    BNE @_update                            ; Is this 0? If so, branch.


    ;
    ; We're at the first bit. We need to load the byte we'll be
    ; working with from RAM as an index into Temp_07+1.
    ;
    LDY LoadCompressedScreenData_ByteOffset ; Get the offset of the byte
                                            ; we'll be processing.
    LDA (Temp_08),Y                         ; Load the next byte.
    STA LoadCompressedScreenData_CurByte


    ;
    ; Shift the current byte left by 1 and increment the bit
    ; offset by 1, for comparison.
    ;
  @_update:                                 ; [$d262]
    ASL LoadCompressedScreenData_CurByte    ; Shift the current byte we're
                                            ; processing.
    PHP                                     ; Save all flags.
    INC LoadCompressedScreenData_BitOffset  ; Increment the next bit in the
                                            ; byte.


    ;
    ; See if the lower 3 bits are cleared. If so, we need to
    ; advance the byte offset and reset the bit offset.
    ;
    LDA LoadCompressedScreenData_BitOffset  ; Check if we've hit the last bit
                                            ; in the byte.
    AND #$07
    BNE @_return                            ; If we have any data in bits
                                            ; 1-3...
    STA LoadCompressedScreenData_BitOffset  ; Reset the current bit to 0.
    INC LoadCompressedScreenData_ByteOffset ; Increase the byte offset.

  @_return:                                 ; [$d271]
    PLP                                     ; Restore all flags.
    RTS

;
; XREFS:
;     Area_LoadBlocks
;
BLOCK_DATA_OFFSETS_FOR_BIT_VALUES:          ; [$d273]
    .byte $ff                               ; [0]:
    .byte $f0                               ; [1]:
    .byte $ef                               ; [2]:


;============================================================================
; Load block properties from Bank 3 into RAM.
;
; This will loop through all block properties for the
; current area, loading it into a table in RAM.
;
; Each pair of bytes in the block properties come
; together as the two nibbles for a new byte. The
; first byte represents the lower nibble, and the
; second byte's value is shifted into the upper nibble.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank to save and restore.
;
;     CurrentArea_BlockPropertiesAddr:
;         The address of the current area's block
;         properties data.
;
; OUTPUTS:
;     BlockProperties:
;         The block properties in RAM to update.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Screen_StopScrollAndLoadBlockProperties
;============================================================================
Area_LoadBlockProperties:                   ; [$d276]
    ;
    ; Switch to bank 3, where the level data is stored.
    ;
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank


    ;
    ; Prepare for the read loop.
    ;
    LDY #$00                                ; Y = 0
    LDX #$00                                ; X = 0


    ;
    ; Load the lower nibble from the block properties.
    ;
  @_nextBlockProperty:                      ; [$d283]
    LDA (CurrentArea_BlockPropertiesAddr),Y ; A = block property in the
                                            ; current area at offset Y.
    AND #$0f                                ; Retain the lower nibble.
    STA Temp_00                             ; Store that for later lookup.


    ;
    ; Load the next block property as the upper nibble.
    ;
    INY                                     ; Increment the index in the
                                            ; block properties table.;
    LDA (CurrentArea_BlockPropertiesAddr),Y ; Load it into A.
    ASL A                                   ; Move the lower nibble to the
                                            ; upper nibble.
    ASL A
    ASL A
    ASL A


    ;
    ; Combine the two nibbles for the new value and store it in
    ; BlockProperties.
    ;
    ORA Temp_00                             ; OR it to the lower nibble we
                                            ; saved.
    STA BlockProperties,X                   ; Store it.


    ;
    ; Keep going while the index is positive.
    ;
    INY                                     ; Y = Y + 1
    INX                                     ; X = X + 1
    BPL @_nextBlockProperty                 ; If we haven't overflowed, loop.


    ;
    ; We're done. Switch back to our previous bank.
    ;
    PLA                                     ; Pull our saved bank.
    TAX                                     ; Set to X and...
    JSR MMC1_UpdateROMBank                  ; Switch banks.
    RTS

;============================================================================
; TODO: Document Screen_StopScrollAndLoadBlockProperties
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_HandleScrollDown
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_HandleScrollUp
;============================================================================
Screen_StopScrollAndLoadBlockProperties:    ; [$d29f]
    LDA #$ff
    STA Screen_ScrollDirection
    JMP Area_LoadBlockProperties

;============================================================================
; TODO: Document Screen_HandleScrollUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_HandleScroll
;============================================================================
Screen_HandleScrollUp:                      ; [$d2a6]
    LDA PPU_ScrollY
    BNE @LAB_PRG15_MIRROR__d2ac
    LDA #$d0

  @LAB_PRG15_MIRROR__d2ac:                  ; [$d2ac]
    SEC
    SBC #$01
    STA PPU_ScrollY
    BNE @LAB_PRG15_MIRROR__d2b8
    DEC PPU_ScrollScreenVert
    JSR Screen_StopScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d2b8:                  ; [$d2b8]
    LDA PPU_ScrollY
    STA Screen_ScrollVertLoadCounter
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    JSR Screen_LoadDataUp
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    RTS

;============================================================================
; TODO: Document Screen_UpdateForScroll
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_UpdateForScroll
;     Screen_UpdateForScroll
;============================================================================
Screen_UpdateForScroll:                     ; [$d2ce]
    JSR Game_UpdatePlayerOnScroll           ; Update the player position
                                            ; during scroll.
    JSR Screen_HandleScroll                 ; Update the screen state/tiles
                                            ; on scroll.
    JSR Screen_RunWriteScrollDataHandler    ; Write data to the PPU based on
                                            ; the scroll direction.
    LDA Screen_ScrollDirection              ; Load the scroll direction.
    CMP #$02                                ; Is it left or right?
    BCS @_isLeftOrRight


    ;
    ; The screen is scrolling up, down, or not at all.
    ;
    LDA PPU_ScrollX                         ; Load the scroll X delta.
    BNE Screen_UpdateForScroll              ; If it's not 0, loop.
    RTS


    ;
    ; The screen is scrolling left or right.
    ;
  @_isLeftOrRight:                          ; [$d2e2]
    LDA PPU_ScrollY                         ; Load the scroll Y delta.
    BNE Screen_UpdateForScroll              ; If it's not 0, loop.

    ;
    ; XREFS:
    ;     Screen_HandleScroll
    ;
RETURN_D2E6:                                ; [$d2e6]
    RTS                                     ; Else, return.

;============================================================================
; TODO: Document Screen_HandleScroll
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_ScrollScreenRight
;     Game_MainLoop
;     Screen_UpdateForScroll
;============================================================================
Screen_HandleScroll:                        ; [$d2e7]
    LDX Screen_ScrollDirection              ; Load the scroll direction.
    BEQ Screen_HandleScrollLeft             ; If 0, jump to scroll left.
    DEX
    BEQ Screen_HandleScrollRight            ; If 1, jump to scroll right.
    DEX
    BEQ Screen_HandleScrollUp               ; If 2, jump to scroll up.
    DEX
    BNE RETURN_D2E6                         ; If anything but 3 (down),
                                            ; return.

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document Screen_HandleScrollDown
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
Screen_HandleScrollDown:                    ; [$d2f4]
    ;
    ; The screen is scrolling down.
    ;
    LDA PPU_ScrollY
    CLC
    ADC #$01
    STA PPU_ScrollY
    CMP #$d0
    BCC @LAB_PRG15_MIRROR__d308
    LDA #$00
    STA PPU_ScrollY
    INC PPU_ScrollScreenVert
    JSR Screen_StopScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d308:                  ; [$d308]
    LDA PPU_ScrollY
    STA Screen_ScrollVertLoadCounter
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    JSR Screen_LoadBlocksDown
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    RTS
;============================================================================
; TODO: Document Screen_HandleScrollRight
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_HandleScroll
;============================================================================
Screen_HandleScrollRight:                   ; [$d31e]
    ;
    ; The screen is scrolling right.
    ;
    LDA PPU_ScrollX
    CLC
    ADC #$01
    STA PPU_ScrollX
    PHP
    LDA PPU_ScrollScreenHoriz
    ADC #$00
    STA PPU_ScrollScreenHoriz
    STA PPU_ScrollScreen
    PLP
    BCC @LAB_PRG15_MIRROR__d334
    JSR Screen_StopScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d334:                  ; [$d334]
    LDA PPU_ScrollX
    STA Screen_ScrollHorizLoadCounter
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    JSR Screen_LoadDataRight
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    RTS
;============================================================================
; TODO: Document Screen_HandleScrollLeft
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_HandleScroll
;============================================================================
Screen_HandleScrollLeft:                    ; [$d34a]
    ;
    ; The screen is scrolling left.
    ;
    LDA Screen_ScrollHorizLoadCounter       ; Load the screen blocks
                                            ; horizontal load counter.
    CMP #$fc                                ; Is it >= 0xFC?
    BCS @_checkLoadBlocks                   ; If so, jump.


    ;
    ; We haven't loaded 252 columns yet.
    ;
    ; Start by reducing the scroll X counter by 1.
    ;
    LDA PPU_ScrollX                         ; Load the scroll X counter.
    SEC
    SBC #$01                                ; Subtract 1.
    STA PPU_ScrollX                         ; And store it.
    PHP                                     ; Push flags to the stack.
    LDA PPU_ScrollScreen                    ; Load the scroll screen we're
                                            ; using.
    SBC #$00                                ; Subtract carry from above.
    STA PPU_ScrollScreen                    ; Store it.
    PLP                                     ; Pop flags from the stack.
    BNE @_checkLoadBlocks                   ; If scroll X > 0, jump.


    ;
    ; PPU_ScrollX hit 0, so we can stop scrolling and load
    ; the block properties for the new screen.
    ;
    JSR Screen_StopScrollAndLoadBlockProperties ; Stop scrolling and load the
                                                ; block properties.

  @_checkLoadBlocks:                        ; [$d364]
    LDA Screen_ScrollHorizLoadCounter       ; Load the screen blocks
                                            ; horizontal load counter.
    SEC
    SBC #$01                                ; Subtract 1.
    STA Screen_ScrollHorizLoadCounter       ; Store it.
    LDA PPU_ScrollScreenHoriz               ; Load the index of the screen
                                            ; using for scrolling
                                            ; horizontally.
    SBC #$00                                ; Subtract carry, if wrapping
                                            ; above.
    STA PPU_ScrollScreenHoriz               ; Store it.


    ;
    ; Check if we're ready to load blocks to the left.
    ;
    ; This will only load if the screen index has changed or
    ; the scroll X is >= 4.
    ;
    CMP PPU_ScrollScreen                    ; Is the horizontal scroll screen
                                            ; the same as the current screen?
    BNE @_loadBlocks                        ; If not, jump to load blocks.
    LDA PPU_ScrollX                         ; Load the scroll X position.
    CMP #$04                                ; Is it >= 4?
    BCS @_loadBlocks                        ; If so, jump to load blocks.
    RTS                                     ; Else, we're done.


    ;
    ; Save the current ROM bank and switch to bank 3 (Area metadata).
    ;
  @_loadBlocks:                             ; [$d37c]
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$03                                ; Bank 3 = Area metadata.
    JSR MMC1_UpdateROMBank                  ; Switch to it.


    ;
    ; Load data for the screen to the left of the current screen.
    ;
    JSR Screen_LoadDataLeft                 ; Load data to the left of the
                                            ; current screen.


    ;
    ; Switch back to the saved bank.
    ;
    PLA                                     ; Pull the current bank from the
                                            ; stack.
    TAX                                     ; X = A (bank).
    JSR MMC1_UpdateROMBank                  ; Switch back to that bank.
    RTS


;============================================================================
; Load block attributes when scrolling vertically.
;
; This sets the loading mode to load attributes, and then
; load a round of blocks vertically.
;
; INPUTS:
;     X:
;         0 = Load blocks to the top.
;         1 = Load blocks to the bottom.
;
; OUTPUTS:
;     Screen_ScrollLoadMode:
;         The mode set to loading attributes.
;
; CALLS:
;     Screen_LoadBlockDataVert
;
; XREFS:
;     Screen_LoadBlocksDown
;     Screen_LoadDataUp
;============================================================================
Screen_LoadAttrsVert:                       ; [$d38e]
    INC Screen_ScrollLoadMode               ; Set load mode to 1 (load
                                            ; attributes)
    JMP Screen_LoadBlockDataVert            ; Load the data.


;============================================================================
; Load screen data for the screen above.
;
; Every 8 counts (7, 15, 23, ...), this will load
; attribute data.
;
; Every 8 counts (3, 11, 19, ...), this will load
; tile data.
;
; INPUTS:
;     Screen_ScrollVertLoadCounter:
;         The load counter for blocks.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Screen_LoadAttrsVert
;     Screen_LoadBlockDataVert
;
; XREFS:
;     Screen_HandleScrollUp
;============================================================================
Screen_LoadDataUp:                          ; [$d393]
    LDX #$00                                ; 0 = Load Tiles mode
    STX Screen_ScrollLoadMode               ; Set as the default mode.
    LDA Screen_ScrollVertLoadCounter        ; A = Vertical blocks counter
    AND #$0f                                ; Keep the lower nibble.
    CMP #$07                                ; Is it 7 (every 8 blocks,
                                            ; starting at 7)?
    BEQ Screen_LoadAttrsVert                ; If so, load attributes.
    AND #$07                                ; Else, keep the lower 3 bits.
    CMP #$03                                ; Is it 3 (every 8 blocks,
                                            ; starting at 3)?
    BEQ Screen_LoadBlockDataVert            ; If so, load tiles.
    RTS                                     ; Else, return.


;============================================================================
; Load screen data for the screen below.
;
; Every 16 counts (8, 24, 40, ...), this will load
; attribute data.
;
; Every 8 counts (4, 12, 20, ...), this will load
; tile data.
;
; INPUTS:
;     Screen_ScrollVertLoadCounter:
;         The load counter for blocks.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Screen_LoadAttrsVert
;     Screen_LoadBlockDataVert
;
; XREFS:
;     Screen_HandleScrollDown
;============================================================================
Screen_LoadBlocksDown:                      ; [$d3a6]
    LDX #$00                                ; 0 = Load Tiles mode
    STX Screen_ScrollLoadMode               ; Set as the default mode.
    INX                                     ; X++ (reuse as "is down" flag,
                                            ; set to 1).
    LDA Screen_ScrollVertLoadCounter        ; A = Vertical blocks counter
    AND #$0f                                ; Keep the lower nibble.
    CMP #$08                                ; Is it 8 (every 16 blocks,
                                            ; starting at 8)?
    BEQ Screen_LoadAttrsVert                ; If so, load attributes.
    AND #$07                                ; Else, keep the lower 3 bits.
    CMP #$04                                ; Is it 4 (every 8 blocks,
                                            ; starting at 4)?
    BEQ Screen_LoadBlockDataVert            ; If so, load tiles.
    RTS                                     ; Else, return.


;============================================================================
; TODO
;
; direction:
;     1 = up
;     0 = down
;
; XREFS:
;     Screen_LoadAttrsVert
;     Screen_LoadBlocksDown
;     Screen_LoadDataUp
;============================================================================
Screen_LoadBlockDataVert:                   ; [$d3ba]
    LDA Screen_ScrollVertLoadCounter
    CLC
    ADC $d4cb,X
    STA Temp_00
    LDA PPU_ScrollScreenVert
    ADC #$00
    STA Unused_Blocks_0049
    LDA Area_CurrentScreen
    STA MaybeUnused_006d
    LDA Temp_00
    AND #$f0
    STA Temp_Blocks_0048
    LDA #$00
    CLC
    ADC Temp_Blocks_0048
    STA Temp_08
    LDA #$06
    ADC #$00
    STA Temp_09
    LDA Screen_ScrollLoadMode
    BEQ @LAB_PRG15_MIRROR__d3e6
    JMP @LAB_PRG15_MIRROR__d445

  @LAB_PRG15_MIRROR__d3e6:                  ; [$d3e6]
    LDY #$00
    LDX #$00

  @LAB_PRG15_MIRROR__d3ea:                  ; [$d3ea]
    STY Temp_06
    LDA (Temp_08),Y
    TAY
    LDA (CurrentArea_BlockData1StartAddr),Y
    STA CurrentArea_BlockData1CurAddr
    LDA (CurrentArea_BlockData2StartAddr),Y
    STA CurrentArea_BlockData2CurAddr
    LDA (CurrentArea_BlockData3StartAddr),Y
    STA CurrentArea_BlockData3CurAddr
    LDA (CurrentArea_BlockData4StartAddr),Y
    STA CurrentArea_BlockData4CurAddr
    LDA Screen_ScrollVertLoadCounter
    AND #$08
    LSR A
    LSR A
    TAY
    LDA CurrentArea_BlockData1CurAddr,Y
    STA DataArray,X
    LDA CurrentArea_BlockData2CurAddr,Y
    STA DataArray_1_,X
    INX
    INX
    LDY Temp_06
    INY
    CPY #$10
    BCC @LAB_PRG15_MIRROR__d3ea
    LDA #$00
    STA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    LDA Screen_ScrollVertLoadCounter
    AND #$f8
    ASL A
    ROL Screen_ScrollVertBlocks_PPUTileMapAddr_U
    ASL A
    ROL Screen_ScrollVertBlocks_PPUTileMapAddr_U
    CLC
    ADC #$80
    STA Screen_ScrollVertBlocks_PPUTileMapAddr_L
    LDA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    ADC #$00
    STA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    LDA PPU_ScrollScreenHoriz
    AND #$01
    ASL A
    ASL A
    ORA #$20
    ORA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    STA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    LDA #$01
    STA Screen_NeighborBlocksLoadedByDirection
    RTS

  @LAB_PRG15_MIRROR__d445:                  ; [$d445]
    LDA Screen_ScrollVertLoadCounter
    AND #$16
    LSR A
    LSR A
    LSR A
    STA Temp_01
    LDY #$f8
    LDA #$00

  @LAB_PRG15_MIRROR__d452:                  ; [$d452]
    STA $0192,Y
    INY
    BNE @LAB_PRG15_MIRROR__d452

  @LAB_PRG15_MIRROR__d458:                  ; [$d458]
    STY Temp_06
    LDA (Temp_08),Y
    TAY
    LDA (CurrentArea_BlockAttributesAddr),Y
    STA Temp_00
    LDA Temp_06
    AND #$01
    ORA Temp_01
    TAY
    LDA Temp_00
    AND BLOCK_ATTRS_BITMASKS,Y
    PHA
    LDA Temp_06
    LSR A
    TAY
    PLA
    ORA Screen_ScrollVertPPUAttrData,Y
    STA Screen_ScrollVertPPUAttrData,Y
    LDY Temp_06
    INY
    CPY #$10
    BCC @LAB_PRG15_MIRROR__d458
    LDX #$f0
    LDA Screen_ScrollVertLoadCounter
    AND #$10
    BEQ @LAB_PRG15_MIRROR__d48a
    LDX #$0f

  @LAB_PRG15_MIRROR__d48a:                  ; [$d48a]
    STX Temp_06
    LDA Screen_ScrollVertLoadCounter
    AND #$e0
    LSR A
    LSR A
    STA Temp_00
    CLC
    ADC #$08
    TAY
    CLC
    ADC #$c0
    STA Screen_ScrollVertBlocks_PPUAttrAddr_L
    LDA PPU_ScrollScreenHoriz
    AND #$01
    TAX
    ASL A
    ASL A
    ORA #$23
    STA Screen_ScrollVertBlocks_PPUAttrAddr_U
    LDA SET_BLOCKS_TILEMAP_OFFSETS_L,X
    STA Temp_08
    LDA SET_BLOCKS_TILEMAP_OFFSETS_U,X
    STA Temp_09
    LDX #$00

  @LAB_PRG15_MIRROR__d4b4:                  ; [$d4b4]
    LDA (Temp_08),Y
    AND Temp_06
    ORA Screen_ScrollVertPPUAttrData,X
    STA (Temp_08),Y
    STA Screen_ScrollVertPPUAttrData,X
    INY
    INX
    CPX #$08
    BCC @LAB_PRG15_MIRROR__d4b4
    LDA #$01
    STA Screen_MaybeUnused_0075
    RTS
    .byte $00                               ; [0]:

;
; XREFS:
;     Screen_LoadBlockDataVert
;
BYTE_ARRAY_PRG15_MIRROR__d4cb_1_:           ; [$d4cc]
    .byte $00                               ; [1]:
    .byte $00,$08                           ; [$d4cd] byte

;
; XREFS:
;     Area_SetBlocks_SetAttributes
;     Screen_LoadBlockDataVert
;     Screen_LoadBlocksHoriz
;
SET_BLOCKS_TILEMAP_OFFSETS_L:               ; [$d4cf]
    .byte $42                               ; [0]:
    .byte $42                               ; [1]:

;
; XREFS:
;     Area_SetBlocks_SetAttributes
;     Screen_LoadBlockDataVert
;     Screen_LoadBlocksHoriz
;
SET_BLOCKS_TILEMAP_OFFSETS_U:               ; [$d4d1]
    .byte $02                               ; [0]:
    .byte $02                               ; [1]:


;============================================================================
; Block attribute masks during screen scrolling.
;
; This is used for both vertical and horizontal scrolling.
;
; XREFS:
;     Screen_LoadBlockDataVert
;     Screen_LoadBlocksHoriz
;============================================================================

;
; XREFS:
;     Screen_LoadBlockDataVert
;     Screen_LoadBlocksHoriz
;
BLOCK_ATTRS_BITMASKS:                       ; [$d4d3]
    .byte $03                               ; [0]: Mask bits 0 and 1
    .byte $0c                               ; [1]: Mask bits 2 and 3
    .byte $30                               ; [2]: Mask bits 4 and 5
    .byte $c0                               ; [3]: Mask bits 6 and 7


;============================================================================
; Load block attributes when scrolling horizontally.
;
; This sets the loading mode to load attributes, and then
; load a round of blocks horizontally.
;
; INPUTS:
;     X:
;         0 = Load blocks to the left.
;         1 = Load blocks to the right.
;
; OUTPUTS:
;     Screen_ScrollLoadMode:
;         The mode set to loading attributes.
;
; CALLS:
;     Screen_LoadBlocksHoriz
;
; XREFS:
;     Screen_LoadDataLeft
;     Screen_LoadDataRight
;============================================================================
Screen_LoadAttrsHoriz:                      ; [$d4d7]
    INC Screen_ScrollLoadMode               ; Set load mode to 1 (load
                                            ; attributes).
    JMP Screen_LoadBlocksHoriz              ; Load the data.


;============================================================================
; Load screen data for the screen to the right.
;
; Every 4 counts (2, 6, 10, ...), this will load
; attribute data.
;
; Every 4 counts (1, 5, 9, ...), this will load
; tile data.
;
; INPUTS:
;     Screen_ScrollHorizLoadCounter:
;         The load counter for blocks.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Screen_LoadAttrsHoriz
;     Screen_LoadBlocksHoriz
;
; XREFS:
;     Screen_HandleScrollRight
;============================================================================
Screen_LoadDataRight:                       ; [$d4dc]
    LDX #$00                                ; 0 = Load Tiles mode
    STX Screen_ScrollLoadMode               ; Set as the default mode.
    INX                                     ; X++ (reuse as "is right" flag,
                                            ; set to 1).
    LDA Screen_ScrollHorizLoadCounter       ; A = Horizontal blocks counter
    AND #$0f                                ; Keep the lower nibble.
    CMP #$02                                ; Is it 2 (every 4 blocks,
                                            ; starting at 2)?
    BEQ Screen_LoadAttrsHoriz               ; If so, load attributes.
    AND #$07                                ; Else, keep the lower 3 bits.
    CMP #$01                                ; Is it 1 (every 4 blocks,
                                            ; starting at 1)?
    BEQ Screen_LoadBlocksHoriz              ; If so, load tiles.
    RTS                                     ; Else, return.


;============================================================================
; Load screen data for the screen to the left.
;
; Every 16 counts (values 15, 31, 47, ...), this will load
; attribute data.
;
; Every 8 counts (values 6, 14, 22, ...), this will load
; tile data.
;
; INPUTS:
;     Screen_ScrollHorizLoadCounter:
;         The load counter for blocks.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Screen_LoadAttrsHoriz
;     Screen_LoadBlocksHoriz
;
; XREFS:
;     Screen_HandleScrollLeft
;============================================================================
Screen_LoadDataLeft:                        ; [$d4f0]
    LDX #$00                                ; 0 = Load Tiles mode
    STX Screen_ScrollLoadMode               ; Set as the default mode.
    LDA Screen_ScrollHorizLoadCounter       ; A = Horizontal blocks counter
    AND #$0f                                ; Keep the lower nibble.
    CMP #$0f                                ; Is it 0xF (every 16, starting
                                            ; at 15)?
    BEQ Screen_LoadAttrsHoriz               ; If so, load attributes.
    AND #$07                                ; Else, keep the lower 3 bits.
    CMP #$06                                ; Is it 6 (every 8 blocks,
                                            ; starting at 6)?
    BEQ Screen_LoadBlocksHoriz              ; If so, load tiles.
    RTS                                     ; Else, return.

;============================================================================
; TODO: Document Screen_LoadBlocksHoriz
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_LoadAttrsHoriz
;     Screen_LoadDataLeft
;     Screen_LoadDataRight
;============================================================================
Screen_LoadBlocksHoriz:                     ; [$d503]
    LDA Screen_ScrollHorizLoadCounter
    CLC
    ADC SCROLL_HORIZ_END_POS,X
    STA Temp_00
    LDA PPU_ScrollScreenHoriz
    ADC BYTE_ARRAY_PRG15_MIRROR__d61b,X
    STA Screen_Maybe_ScrollHorizDirection
    LDA Area_CurrentScreen
    STA MaybeUnused_006d
    LDA Temp_00
    LSR A
    LSR A
    LSR A
    LSR A
    STA Screen_ScrollHorizLoadOffset
    LDA #$00
    STA Temp_08
    LDA #$06
    STA Temp_09
    LDA Screen_ScrollLoadMode
    BNE @_loadPPUData


    ;
    ; Load 30 blocks to render in the next draw phase.
    ;
    LDX #$00                                ; X = 0 (loop counter)


    ;
    ; Determine the offset for the blocks to load.
    ;
    ; This is data populated by Area_LoadBlocks.
    ;
  @_loadBlocksLoop:                         ; [$d52c]
    LDY Screen_ScrollHorizLoadOffset        ; Y = Load offset.
    LDA (Temp_08),Y                         ; A = Loaded block data at Y.


    ;
    ; Load the blocks information.
    ;
    TAY                                     ; Y = A (block data).
    LDA (CurrentArea_BlockData1StartAddr),Y ; A = Block data 1 address at Y.
    STA CurrentArea_BlockData1CurAddr       ; Store it for processing.
    LDA (CurrentArea_BlockData3StartAddr),Y ; A = Block data 3 address at Y.
    STA CurrentArea_BlockData2CurAddr       ; Store it for processing.
    LDA (CurrentArea_BlockData2StartAddr),Y ; A = Block data 2 address at Y.
    STA CurrentArea_BlockData3CurAddr       ; Store it for processing.
    LDA (CurrentArea_BlockData4StartAddr),Y ; A = Block data 4 address at Y.
    STA CurrentArea_BlockData4CurAddr       ; Store it for processing.


    ;
    ; Convert the block counter to a tile width and use it
    ; to determine which part of the block data to load.
    ;
    ; If the load counter
    ;
    LDA Screen_ScrollHorizLoadCounter       ; A = Horizontal load counter.
    AND #$08                                ; Every 8...
    LSR A                                   ; Divide by 4 (convert to 0 or
                                            ; 2).
    LSR A
    TAY
    LDA CurrentArea_BlockData1CurAddr,Y     ; A = Block data 1 or 3.
    STA Temp_0200,X                         ; Store it temporarily.
    LDA CurrentArea_BlockData2CurAddr,Y     ; A = Block data 2 or 4.
    STA Temp_0201,X                         ; Store it temporarily.
    LDA Temp_08                             ; Load the dest screen buffer
                                            ; address.
    CLC
    ADC #$10                                ; Increment by 16.
    STA Temp_08                             ; Store the lower byte of the new
                                            ; address.
    LDA Temp_09                             ; Load the upper byte.
    ADC #$00                                ; Add carry, if wrapped.
    STA Temp_09                             ; Store the upper byte.


    ;
    ; Advance the loop counter by 2.
    ;
    INX                                     ; X++ (loop counter).
    INX                                     ; X++ (loop counter).
    CPX #$1e
    BCC @_loadBlocksLoop
    LDA #$01
    STA Screen_ScrollHorizBlocksLoaded
    TYA
    LSR A
    PHA
    LDA Screen_ScrollHorizLoadOffset
    ASL A
    STA Screen_ScrollHorizLoadOffset
    PLA
    CLC
    ADC Screen_ScrollHorizLoadOffset
    CLC
    ADC #$80
    STA Screen_ScrollHorizBlocks_PPUTileMapAddr_L
    LDA Screen_Maybe_ScrollHorizDirection
    AND #$01
    ASL A
    ASL A
    ORA #$20
    STA Screen_ScrollHorizBlocks_PPUTileMapAddr_U
    RTS


    ;
    ; Clear 8 bytes of memory.
    ;
    ; This isn't used for any data management purposes. It
    ; may be to delay some aspect of screen scrolling.
    ;
  @_loadPPUData:                            ; [$d587]
    LDY #$f8                                ; Y = 0xF8 (loop counter)
    LDA #$00                                ; A = 0 (value to write)

  @_clearLoop:                              ; [$d58b]
    STA Screen_ScrollHoriz_ZeroData,Y       ; Write a 0 to this empty block.
    INY                                     ; Y++
    BNE @_clearLoop                         ; If != 0, loop.


    ;
    ; Begin loading PPU attribute data and scheduling to draw.
    ;
    LDX #$00                                ; X = 0 (loop counter)


    ;
    ; Start by storing the data load offset and the block
    ; attribute value from area data, storing in temp.
    ;
    ; The screen buffer data will contain the offset into the
    ; block attributes data.
    ;
  @_loadAttrDataLoop:                       ; [$d593]
    LDY Screen_ScrollHorizLoadOffset        ; Y = Attr data load offset
    LDA (Temp_08),Y                         ; A = Screen buffer data at
                                            ; offset (block attribute offset)
    TAY                                     ; Y = A
    LDA (CurrentArea_BlockAttributesAddr),Y ; A = block attribute at
                                            ; resulting screen buffer data
                                            ; offset value
    STA Temp_00                             ; Store it temporarily.


    ;
    ; Generate an index 0-3 into a lookup table. This will be:
    ;
    ; 0 = Bits 0-1 -- Even loop counter, even load offset
    ; 1 = Bits 2-3 -- Even loop counter, odd load offset
    ; 2 = Bits 4-5 -- Odd loop counter, even load offset
    ; 3 = Bits 6-7 -- Odd loop counter, odd load offset
    ;
    LDA Screen_ScrollHorizLoadOffset        ; A = Attr data load offset
    AND #$01                                ; Keep the least-significant bit
                                            ; (even/odd).
    STA Temp_01                             ; Store it temporarily.
    TXA                                     ; A = X (loop counter)
    AND #$01                                ; Keep the loop counter's
                                            ; least-significant bit
                                            ; (even/odd).
    ASL A                                   ; A *= 2
    ORA Temp_01                             ; OR with the load offset's
                                            ; even/odd bit.
    TAY                                     ; Y = A (result)


    ;
    ; Mask 2 bits of the block attributes based on that index.
    ;
    LDA Temp_00                             ; A = Loaded block attribute
    AND BLOCK_ATTRS_BITMASKS,Y              ; AND with the bitmask based on
                                            ; our computed index.
    PHA                                     ; Push the result to the stack.


    ;
    ; Generate the destination index into the PPU attribute data.
    ;
    ; This will be the loop counter / 2.
    ;
    TXA                                     ; A = X (loop counter)
    LSR A                                   ; A = A / 2
    TAY                                     ; Y = A


    ;
    ; OR the result with the value already loaded at this loop
    ; index, and store it back.
    ;
    PLA                                     ; Pop the masked block attribute
                                            ; from stack.
    ORA Screen_ScrollHorizPPUAttrData,Y     ; OR with the data already set.
    STA Screen_ScrollHorizPPUAttrData,Y     ; And store it.


    ;
    ; Advance the screen buffer address by 16 bytes.
    ;
    LDA Temp_08                             ; A = Lower byte of Current
                                            ; screen buffer address.
    CLC
    ADC #$10                                ; A += 16
    STA Temp_08                             ; Store as the new lower byte.
    LDA Temp_09                             ; A = Upper byte of Current
                                            ; screen buffer address.
    ADC #$00                                ; A += Carry from lower increment
    STA Temp_09                             ; Store as the new upper byte.


    ;
    ; Advance the loop counter, and loop if < 15.
    ;
    INX                                     ; X++ (loop counter)
    CPX #$0f                                ; Is this < 15?
    BCC @_loadAttrDataLoop                  ; If so, loop.


    ;
    ; Generate a bitmask that will be ANDed to screen
    ; buffer data and OR'd back to scroll PPU attribute
    ; data futher below.
    ;
    LDX #$cc                                ; Default bitmask to enable bits
                                            ; 2-3, 6-7 (11001100)
    LDA Screen_ScrollHorizLoadOffset        ; Load the data load offset.
    AND #$01                                ; Is it even?
    BEQ @_updatePPUAttrAddr                 ; If so, jump to skip.
    LDX #$33                                ; Set bitmask to enable bits 0-1,
                                            ; 4-5 (00110011)

  @_updatePPUAttrAddr:                      ; [$d5d5]
    STX Temp_06                             ; Store for later.
    LDA Screen_ScrollHorizLoadOffset        ; A = Data load offset.
    LSR A                                   ; A = A / 2
    CLC
    ADC #$08                                ; A += 8
    TAY                                     ; Y = A (new screen buffer write
                                            ; offset)
    CLC
    ADC #$c0                                ; A += 0xC0
    STA Screen_ScrollHorizBlocks_PPUAttrAddr_L ; Set as the lower byte of the
                                               ; PPU attr address.
    LDA Screen_Maybe_ScrollHorizDirection
    AND #$01
    TAX
    ASL A
    ASL A
    ORA #$23
    STA Screen_ScrollHorizBlocks_PPUAttrAddr_U ; Set as the upper byte of the
                                               ; PPU attr address.
    LDA SET_BLOCKS_TILEMAP_OFFSETS_L,X
    STA Temp_08
    LDA SET_BLOCKS_TILEMAP_OFFSETS_U,X
    STA Temp_09


    ;
    ; Update 64 blocks of PPU attribute data.
    ;
    ; This will OR the bitmask above to each of the 64
    ; bytes of PPU attribute data already computed.
    ;
    LDX #$00                                ; X = 0 (loop counter)

  @_updatePPUAttrDataLoop:                  ; [$d5fa]
    LDA (Temp_08),Y                         ; Load the value from the screen
                                            ; buffer write offset at Y.
    AND Temp_06                             ; AND with the bitmask computed
                                            ; above.
    ORA Screen_ScrollHorizPPUAttrData,X     ; OR with the existing PPU
                                            ; attribute data
    STA Screen_ScrollHorizPPUAttrData,X     ; And store it.
    STA (Temp_08),Y                         ; Store it back in the screen
                                            ; buffer at write offset Y.
    INX                                     ; X++ (loop counter)


    ;
    ; The next three instructions are effectively unused.
    ; Legacy code?
    ;
    TXA                                     ; <unused>
    AND #$07                                ; <unused>
    TXA                                     ; <unused>


    ;
    ; Advance the earlier loop counter (which should start at 15)
    ; by 8 each loop iteration.
    ;
    TYA                                     ; A = Y (loop counter from
                                            ; initial attribute loading)
    CLC
    ADC #$08                                ; A += 8
    TAY                                     ; Y = A
    CPY #$40                                ; Is it < 64?
    BCC @_updatePPUAttrDataLoop             ; If so, loop.


    ;
    ; Mark the attribute data as loaded.
    ;
    LDA #$01
    STA Screen_ScrollHorizAttrsLoaded       ; Set attribute data loaded.
    RTS

;
; XREFS:
;     Screen_LoadBlocksHoriz
;
SCROLL_HORIZ_END_POS:                       ; [$d619]
    .byte $00                               ; [0]:
    .byte $ff                               ; [1]:

;
; XREFS:
;     Screen_LoadBlocksHoriz
;
BYTE_ARRAY_PRG15_MIRROR__d61b:              ; [$d61b]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:

;============================================================================
; TODO: Document Screen_RunWriteScrollDataHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_ScrollScreenRight
;     PPU_HandleOnInterrupt
;     Screen_UpdateForScroll
;============================================================================
Screen_RunWriteScrollDataHandler:           ; [$d61d]
    LDA #$03
    STA Temp_06
    LDX Screen_LoadBlocksStage

  @_loop:                                   ; [$d623]
    LDA Screen_NeighborBlocksLoadedByDirection,X
    BNE @LAB_PRG15_MIRROR__d631
    INX
    TXA
    AND #$03
    TAX
    DEC Temp_06
    BPL @_loop
    RTS

  @LAB_PRG15_MIRROR__d631:                  ; [$d631]
    LDA #$00
    STA Screen_NeighborBlocksLoadedByDirection,X
    STX Temp_06
    INX
    TXA
    AND #$03
    TAX
    STX Screen_LoadBlocksStage
    LDA Temp_06
    AND #$03
    TAX
    LDA SCREEN_WRITESCROLL_HANDLERS_U,X
    PHA
    LDA SCREEN_WRITESCROLL_HANDLERS_L,X
    PHA
    RTS

;
; XREFS:
;     Screen_RunWriteScrollDataHandler
;
SCREEN_WRITESCROLL_HANDLERS_L:              ; [$d64c]
    .byte <(Screen_WriteScrollVertPPUTileData-1) ; [0]:
    .byte <(Screen_WriteScrollHorizPPUTileData-1) ; [1]:
    .byte <(Screen_WriteScrollVertPPUAttrData-1) ; [2]:
    .byte <(Screen_WriteScrollHorizPPUAttrData-1) ; [3]:

;
; XREFS:
;     Screen_RunWriteScrollDataHandler
;
SCREEN_WRITESCROLL_HANDLERS_U:              ; [$d650]
    .byte >(Screen_WriteScrollVertPPUTileData-1) ; [0]:
    .byte >(Screen_WriteScrollHorizPPUTileData-1) ; [1]:
    .byte >(Screen_WriteScrollVertPPUAttrData-1) ; [2]:
    .byte >(Screen_WriteScrollHorizPPUAttrData-1) ; [3]:

;============================================================================
; TODO: Document Screen_WriteScrollVertPPUTileData
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SCREEN_WRITESCROLL_HANDLERS_L
;     [$PRG15_MIRROR::d64c]
;     SCREEN_WRITESCROLL_HANDLERS_U
;     [$PRG15_MIRROR::d650]
;============================================================================
Screen_WriteScrollVertPPUTileData:          ; [$d654]
    LDA PPU_ControlFlags
    AND #$fb
    STA a:PPUCTRL
    LDA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    STA a:PPUADDR
    LDA Screen_ScrollVertBlocks_PPUTileMapAddr_L
    STA a:PPUADDR
    LDX #$00

  @_loop:                                   ; [$d667]
    LDA DataArray,X
    STA a:PPUDATA
    INX
    CPX #$20
    BCC @_loop
    RTS

;============================================================================
; TODO: Document Screen_WriteScrollHorizPPUTileData
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     SCREEN_WRITESCROLL_HANDLERS_L
;     [$PRG15_MIRROR::d64d]
;     SCREEN_WRITESCROLL_HANDLERS_U
;     [$PRG15_MIRROR::d651]
;============================================================================
Screen_WriteScrollHorizPPUTileData:         ; [$d673]
    LDA PPU_ControlFlags
    ORA #$04
    STA a:PPUCTRL
    LDA Screen_ScrollHorizBlocks_PPUTileMapAddr_U
    STA a:PPUADDR
    LDA Screen_ScrollHorizBlocks_PPUTileMapAddr_L
    STA a:PPUADDR
    LDX #$00

  @_loop:                                   ; [$d686]
    LDA Temp_0200,X
    STA a:PPUDATA
    INX
    CPX #$1a
    BCC @_loop
    LDA PPU_ControlFlags
    AND #$fb
    STA a:PPUCTRL
    RTS

;============================================================================
; TODO: Document Screen_WriteScrollVertPPUAttrData
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     SCREEN_WRITESCROLL_HANDLERS_L
;     [$PRG15_MIRROR::d64e]
;     SCREEN_WRITESCROLL_HANDLERS_U
;     [$PRG15_MIRROR::d652]
;============================================================================
Screen_WriteScrollVertPPUAttrData:          ; [$d699]
    LDA Screen_ScrollVertBlocks_PPUAttrAddr_U
    STA a:PPUADDR
    LDA Screen_ScrollVertBlocks_PPUAttrAddr_L
    STA a:PPUADDR
    LDX #$00

  @_loop:                                   ; [$d6a5]
    LDA Screen_ScrollVertPPUAttrData,X
    STA a:PPUDATA
    INX
    CPX #$08
    BCC @_loop
    RTS

;============================================================================
; TODO: Document Screen_WriteScrollHorizPPUAttrData
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     SCREEN_WRITESCROLL_HANDLERS_L
;     [$PRG15_MIRROR::d64f]
;     SCREEN_WRITESCROLL_HANDLERS_U
;     [$PRG15_MIRROR::d653]
;============================================================================
Screen_WriteScrollHorizPPUAttrData:         ; [$d6b1]
    LDX #$00

  @_loop:                                   ; [$d6b3]
    LDA Screen_ScrollHorizBlocks_PPUAttrAddr_U
    STA a:PPUADDR
    TXA
    ASL A
    ASL A
    ASL A
    CLC
    ADC Screen_ScrollHorizBlocks_PPUAttrAddr_L
    STA a:PPUADDR
    LDA Screen_ScrollHorizPPUAttrData,X
    STA a:PPUDATA
    INX
    CPX #$07
    BCC @_loop
    RTS


;============================================================================
; Handle a breakable floor block the player is standing on.
;
; This is called when the game determines the player is
; standing on a breakable floor block.
;
; The block will be taken through a transition phase,
; depending on the duration in which the player has been
; on the block. This will go through 3 transitions.
;
; The transitions go from:
;
;     0x34 -> 0x2C -> 0x5C -> 0x13
;
; INPUTS:
;     X:
;         The block position to update.
;
;     Blocks_Result:
;         The block type at the offset.
;
;     BREAKABLE_FLOOR_TRANSITIONS:
;         Sequence of breakable floor block types.
;
; OUTPUTS:
;     ScreenBuffer:
;         The updated screen buffer.
;
;     Arg_BlockAttributesIndex:
;         Updated block type.
;
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Area_SetBlocks
;
; XREFS:
;     Player_CheckOnBreakableBlock
;============================================================================
Area_HandleBreakableFloor:                  ; [$d6ce]
    STX Temp_00                             ; Temporarily store the block
                                            ; position.
    LDX #$00                                ; X = 0 (loop counter)
    LDA Blocks_Result                       ; A = block type (value to search
                                            ; for)

  @_checkBlockLoop:                         ; [$d6d4]
    CMP BREAKABLE_FLOOR_TRANSITIONS,X       ; Does the block match the table
                                            ; at this index?
    BEQ @_finishLoop                        ; If so, jump.
    INX                                     ; Else, X++
    CPX #$03                                ; Is X < 3?
    BCC @_checkBlockLoop                    ; If so, loop.
    BCS @_updateBlocks                      ; Else, jump to update the block.

  @_finishLoop:                             ; [$d6e0]
    INX                                     ; X++ (table index of block to
                                            ; set)

  @_updateBlocks:                           ; [$d6e1]
    LDA BREAKABLE_FLOOR_TRANSITIONS,X       ; Load the block to set to.
    STA a:Arg_BlockAttributesIndex          ; DEADCODE: This is overridden in
                                            ; Area_SetBlocks
    LDX Temp_00                             ; X = Block position (stored
                                            ; earlier)
    STA ScreenBuffer,X                      ; Store in the screen buffer as
                                            ; the new block.
    JMP Area_SetBlocks                      ; And set it for the area data.


;============================================================================
; Sequence of block types for breakable floor transitions.
;
; XREFS:
;     Area_HandleBreakableFloor
;============================================================================

;
; XREFS:
;     Area_HandleBreakableFloor
;
BREAKABLE_FLOOR_TRANSITIONS:                ; [$d6ef]
    .byte $34                               ; [0]:

;
; XREFS:
;     Area_HandleBreakableFloor
;
BREAKABLE_FLOOR_TRANSITIONS_1_:             ; [$d6f0]
    .byte $2c                               ; [1]:

;
; XREFS:
;     Area_HandleBreakableFloor
;
BREAKABLE_FLOOR_TRANSITIONS_2_:             ; [$d6f1]
    .byte $5c                               ; [2]:
    .byte $13                               ; [3]:


;============================================================================
; Screen PPU start addresses for updating blocks.
;
; This maps a value to the upper byte of the PPU
; start address for use when updating blocks on the
; screen.
;
; This is used in Area_SetBlocks_SetAttributes.
;
; XREFS:
;     Area_SetBlocks_SetAttributes
;============================================================================

;
; XREFS:
;     Area_SetBlocks_SetAttributes
;
SET_BLOCKS_SCREEN_TILEMAP_ADDRS_U:          ; [$d6f3]
    .byte $20                               ; [0]: Screen 0
    .byte $24                               ; [1]: Screen 1


;============================================================================
; Open the path to Mascon.
;
; This will animate the removal of the stone coverings on
; the fountain and then drop down the ladder so it can be
; climbed to Mascon.
;
; INPUTS:
;     PathToMascon_FountainCoverPos:
;         The block position of the top of the fountain
;         cover.
;
;     GAME_LADDER_TO_MASCON_BLOCK_OFFSETS:
;         The offsets for animating the fountain cover.
;
; OUTPUTS:
;     PathToMascon_LadderBlocksRemaining:
;         The number of ladder blocks remaining to place.
;
;     PathToMascon_LadderPos:
;         The position of the next ladder block to place.
;
;     ScreenBuffer:
;         The updated screen buffer.
;
; CALLS:
;     Area_SetBlocks
;     Game_DropLadderToMascon
;     WaitForInterrupt
;
; XREFS:
;     Player_CheckPushingBlock
;     ScreenEvents_HandlePathToMasconEvent
;============================================================================
Game_OpenPathToMascon:                      ; [$d6f5]
    ;
    ; Push the stone covering block offset to the stack for later.
    ;
    TXA                                     ; A = X
    PHA                                     ; Push A to the stack.


    ;
    ; Clear the top stone covering.
    ;
    LDX PathToMascon_FountainCoverPos       ; X = Block position (in $YX
                                            ; form).
    LDA a:MASCON_FOUNTAIN_BLOCK_1_AIR       ; A = Block ID to place.
    STA ScreenBuffer,X                      ; Store it in the screen buffer
                                            ; at the target location.
    JSR Area_SetBlocks                      ; Update the block on the screen.


    ;
    ; Clear the bottom stone covering.
    ;
    LDA PathToMascon_FountainCoverPos       ; X = Block position (in $YX
                                            ; form).
    CLC
    ADC #$10                                ; X += 16 (next row down; YPos +=
                                            ; 1).
    TAX                                     ; X = A
    LDA a:MASCON_FOUNTAIN_BLOCK_2_AIR       ; A = Block ID to place.
    STA ScreenBuffer,X                      ; Store it in the screen buffer
                                            ; at the target location.
    JSR Area_SetBlocks                      ; Update the block on the screen.


    ;
    ; Pop the original stone covering block offset.
    ;
    PLA                                     ; Pull A from the stack (original
                                            ; block position)
    TAX                                     ; X = A
    LDA GAME_LADDER_TO_MASCON_BLOCK_OFFSETS,X ; A = Block position offset,
                                              ; based on the arguments.
    CLC
    ADC PathToMascon_FountainCoverPos       ; A += Target block position.
    TAX                                     ; X = A
    STX PathToMascon_FountainCoverPos       ; Update the block position.


    ;
    ; Place the top stone covering.
    ;
    LDA a:MASCON_FOUNTAIN_BLOCK_1_STONE     ; A = Stone block.
    STA ScreenBuffer,X                      ; Place it in the screen buffer
                                            ; at the offset.
    JSR Area_SetBlocks                      ; Update the block on the screen.


    ;
    ; Place the bottom stone covering.
    ;
    LDA PathToMascon_FountainCoverPos       ; A = Block position.
    CLC
    ADC #$10                                ; A += 16 (next row).
    TAX                                     ; X = A
    LDA a:MASCON_FOUNTAIN_BLOCK_2_STONE     ; A = Stone block.
    STA ScreenBuffer,X                      ; Place it in the screen buffer.
    JSR Area_SetBlocks                      ; Update the block on the screen.


    ;
    ; Prepare to animate the dropping of the ladder.
    ;
    LDA #$07
    STA PathToMascon_LadderBlocksRemaining  ; Set the ladder block count to
                                            ; 7.
    LDA #$22
    STA PathToMascon_LadderPos              ; Set the position of the top of
                                            ; the ladder to X=2, Y=2.


    ;
    ; Check if the Path to Mascon quest is not yet complete.
    ;
    LDA a:Quests                            ; Load the completed quests.
    AND #$20                                ; Is Path to Mascon completed?
    BNE @_clearCoverings                    ; If it is, jump.


    ;
    ; Path to Mascon is not complete. Wait for 30 interrupts.
    ;
    LDX #$1e                                ; X = 30 (loop counter)

  @_waitforInterruptLoop:                   ; [$d745]
    JSR WaitForInterrupt                    ; Wait for an interrupt.
    DEX                                     ; X--;
    BNE @_waitforInterruptLoop              ; If not 0, loop.


    ;
    ; Clear the top stone block on the fountain.
    ;
  @_clearCoverings:                         ; [$d74b]
    LDX PathToMascon_FountainCoverPos       ; X = Fountain cover block
                                            ; position.
    LDA a:MASCON_FOUNTAIN_BLOCK_1_AIR       ; A = Air block.
    STA ScreenBuffer,X                      ; Set in the screen buffer at the
                                            ; cover position.
    JSR Area_SetBlocks                      ; Update the block on the screen.


    ;
    ; Clear the bottom stone block on the fountain.
    ;
    LDA PathToMascon_FountainCoverPos       ; A = Fountain cover block
                                            ; position.
    CLC
    ADC #$10                                ; A += 16 (next row).
    TAX                                     ; X = A
    LDA a:MASCON_FOUNTAIN_BLOCK_2_AIR       ; A = Air block.
    STA ScreenBuffer,X                      ; Set in the screen buffer at the
                                            ; cover position.
    JSR Area_SetBlocks                      ; Update the block on the screen.


    ;
    ; Drop the ladder to the path to Mascon.
    ;
    JMP Game_DropLadderToMascon             ; Drop the ladder.


;============================================================================
; Two cleared fountain stone block coverings.
;
; XREFS:
;     Game_OpenPathToMascon
;============================================================================

;
; XREFS:
;     Game_OpenPathToMascon
;
MASCON_FOUNTAIN_BLOCK_1_AIR:                ; [$d768]
    .byte $42                               ; Air

;
; XREFS:
;     Game_OpenPathToMascon
;
MASCON_FOUNTAIN_BLOCK_2_AIR:                ; [$d769]
    .byte $42                               ; Air


;============================================================================
; Two set fountain stone block coverings.
;
; XREFS:
;     Game_OpenPathToMascon
;============================================================================

;
; XREFS:
;     Game_OpenPathToMascon
;
MASCON_FOUNTAIN_BLOCK_1_STONE:              ; [$d76a]
    .byte $88                               ; Stone cover

;
; XREFS:
;     Game_OpenPathToMascon
;
MASCON_FOUNTAIN_BLOCK_2_STONE:              ; [$d76b]
    .byte $88                               ; Stone cover


;============================================================================
; Lookup table for quickly calculating a relative X or Y position for placing
; a block.
;
; At index 0, X will be incremented by 1.
;
; At index 1, Y will be incremented by 1 (screen wrap-around).
;
; XREFS:
;     Game_OpenPathToMascon
;============================================================================

;
; XREFS:
;     Game_OpenPathToMascon
;
GAME_LADDER_TO_MASCON_BLOCK_OFFSETS:        ; [$d76c]
    .byte $01                               ; [0]: X + 1
    .byte $ff                               ; [1]: Y + 1


;============================================================================
; Drop the ladder down to open the path to Mascon.
;
; This will animate placing all the ladder blocks, clearing
; a path up to the door to Mascon.
;
; Despite this only ever being called from the screen leading
; to Mascon, this will first check if it's on that screen.
; This appears to be code from some older design.
;
; INPUTS:
;     Area_Region:
;         The current region.
;
;     Area_CurrentScreen:
;         The current screen.
;
;     PathToMascon_LadderPos:
;         The starting ladder position to place.
;
;     PathToMascon_LadderBlocksRemaining:
;         The total number of ladder blocks to place.
;
; OUTPUTS:
;     ScreenBuffer:
;         The updated screen buffer.
;
;     PathToMascon_LadderPos:
;     PathToMascon_LadderBlocksRemaining:
;         Clobbered.
;
;     PathToMascon_Opening:
;         Cleared (0).
;
; CALLS:
;     Area_SetBlocks
;     Sound_PlayEffect
;     WaitForInterrupt
;
; XREFS:
;     Game_OpenPathToMascon
;============================================================================
Game_DropLadderToMascon:                    ; [$d76e]
    ;
    ; Check if we're on the screen with the path to Mascon.
    ;
    ; NOTE: This is only ever called from this screen,
    ;       so it's interesting that this check exists.
    ;
    LDA a:Area_Region                       ; Load the current region.
    CMP #$01                                ; Are we in Trunk?
    BNE @_dropLadderLoop                    ; If not, jump.
    LDA Area_CurrentScreen                  ; Load the current screen.
    CMP #$28                                ; Is it the screen with the
                                            ; blocked path?
    BNE @_dropLadderLoop                    ; If not, jump.


    ;
    ; We're on the right screen. Mark the path as opened.
    ;
    LDA a:Quests                            ; Load the quests.
    ORA #$20                                ; Mark the path to Mascon opened.
    STA a:Quests                            ; Store it.


    ;
    ; Wait for 4 interrupts.
    ;
  @_dropLadderLoop:                         ; [$d783]
    JSR WaitForInterrupt
    JSR WaitForInterrupt
    JSR WaitForInterrupt
    JSR WaitForInterrupt


    ;
    ; Play the Drop Ladder sound effect.
    ;
    LDA #$17                                ; 0x17 == Drop ladder sound
                                            ; effect.
    JSR Sound_PlayEffect                    ; Play the sound effect.


    ;
    ; Place the ladder block.
    ;
    LDX PathToMascon_LadderPos              ; X = Next ladder block position.
    LDA a:DROP_LADDER_TO_MASCON_LADDER_BLOCK ; A = Ladder block.
    STA ScreenBuffer,X                      ; Store in the screen buffer at
                                            ; X.
    JSR Area_SetBlocks                      ; Update blocks on the screen.


    ;
    ; Increment the ladder position, decrement the number of blocks
    ; to place, and loop.
    ;
    LDA PathToMascon_LadderPos              ; A = Ladder position.
    CLC
    ADC #$10                                ; A += 16 (next row)
    STA PathToMascon_LadderPos              ; Store as the new position.
    DEC PathToMascon_LadderBlocksRemaining  ; Decrement the number of ladder
                                            ; blocks to place.
    BNE @_dropLadderLoop                    ; If there are still blocks
                                            ; remaining, loop.


    ;
    ; Clear the "Opening Path" flag.
    ;
    LDA #$00
    STA PathToMascon_Opening                ; Set opening to 0.
    RTS

;
; XREFS:
;     Game_DropLadderToMascon
;
DROP_LADDER_TO_MASCON_LADDER_BLOCK:         ; [$d7af]
    .byte $20                               ; Ladder block

;============================================================================
; TODO: Document SpriteBehavior_EnemyUnused18_SomethingSetBlocks
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SpriteBehavior_EnemyUnused18__9991
;============================================================================
SpriteBehavior_EnemyUnused18_SomethingSetBlocks: ; [$d7b0]
    TXA
    PHA
    TYA
    PHA
    LDX a:Something_UnusedSprite_ScreenBufferOffset
    LDA a:Something_UnusedSprite_BlockOffset
    STA ScreenBuffer,X
    JSR Area_SetBlocks
    PLA
    TAY
    PLA
    TAX
    RTS

;============================================================================
; TODO: Document Area_SetBlocks
;
; INPUTS:
;     A
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     Area_HandleBreakableFloor
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_UseMattock
;     SpriteBehavior_EnemyUnused18_SomethingSetBlocks
;============================================================================
Area_SetBlocks:                             ; [$d7c5]
    STA a:Arg_BlockAttributesIndex
    STX Temp_00
    TXA
    PHA
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    LDA Temp_00
    PHA
    TAX
    JSR Area_SetPPUAddrForBlockIndex
    JSR Area_SetBlocks_WriteBlockData12
    LDA a:PPU_TargetAddr
    CLC
    ADC #$20
    STA a:PPU_TargetAddr
    LDA a:PPU_TargetAddr_U
    ADC #$00
    STA a:PPU_TargetAddr_U
    JSR Area_SetBlocks_WriteBlockData34
    PLA
    JSR Area_SetBlocks_SetAttributes
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    PLA
    TAX
    RTS


;============================================================================
; Write two blocks from area data 1 and 2 to the PPU buffer.
;
; This will load two tiles from the area data from
; CurrentArea_BlockData1StartAddr and
; CurrentArea_BlockData2StartAddr at offset
; Arg_BlockAttributesIndex and write them to the PPU
; buffer at the provided offset.
;
; INPUTS:
;     X:
;         The offset within the PPU buffer to write to.
;
;     CurrentArea_BlockData1StartAddr:
;         The block data used for the first block.
;
;     CurrentArea_BlockData2StartAddr:
;         The block data used for the second block.
;
;     Arg_BlockAttributesIndex:
;         The offset within the area block data to read from.
;
; OUTPUTS:
;     PPUBuffer:
;         The updated PPU buffer.
;
;     PPUBuffer_WriteOffset:
;         The updated upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Area_SetBlocks
;============================================================================
Area_SetBlocks_WriteBlockData12:            ; [$d7ff]
    ;
    ; Set the tile length to 2.
    ;
    LDA #$02
    JSR PPUBuffer_QueueCommandOrLength      ; Write length of 2.


    ;
    ; Load the first block and write to the PPU.
    ;
    LDY a:Arg_BlockAttributesIndex          ; Load the block position within
                                            ; the level.
    LDA (CurrentArea_BlockData1StartAddr),Y ; Load the block at that
                                            ; position.
    STA PPUBuffer,X                         ; Store it the PPU buffer.


    ;
    ; Load the second block and write to the PPU.
    ;
    INX                                     ; X++
    LDA (CurrentArea_BlockData2StartAddr),Y ; Load the block position within
                                            ; the level.
    STA PPUBuffer,X                         ; Load the block at that
                                            ; position.Store it the PPU
                                            ; buffer.
    INX                                     ; X++


    ;
    ; Set the new upper bounds of the buffer.
    ;
    STX PPUBuffer_WriteOffset               ; Set X as the new upper bounds
                                            ; of the PPU buffer.
    RTS


;============================================================================
; Write two blocks from area data 3 and 4 to the PPU buffer.
;
; This will load two tiles from the area data from
; CurrentArea_BlockData3StartAddr and
; CurrentArea_BlockData4StartAddr at offset
; Arg_BlockAttributesIndex and write them to the PPU
; buffer at the provided offset.
;
; INPUTS:
;     X:
;         The offset within the PPU buffer to write to.
;
;     CurrentArea_BlockData3StartAddr:
;         The block data used for the first block.
;
;     CurrentArea_BlockData4StartAddr:
;         The block data used for the second block.
;
;     Arg_BlockAttributesIndex:
;         The offset within the area block data to read from.
;
; OUTPUTS:
;     PPUBuffer:
;         The updated PPU buffer.
;
;     PPUBuffer_WriteOffset:
;         The updated upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Area_SetBlocks
;============================================================================
Area_SetBlocks_WriteBlockData34:            ; [$d816]
    ;
    ; Set the tile length to 2.
    ;
    LDA #$02
    JSR PPUBuffer_QueueCommandOrLength


    ;
    ; Load the first block and write to the PPU.
    ;
    LDY a:Arg_BlockAttributesIndex
    LDA (CurrentArea_BlockData3StartAddr),Y
    STA PPUBuffer,X


    ;
    ; Load the second block and write to the PPU.
    ;
    INX
    LDA (CurrentArea_BlockData4StartAddr),Y
    STA PPUBuffer,X
    INX


    ;
    ; Set the new upper bounds of the buffer.
    ;
    STX PPUBuffer_WriteOffset
    RTS
;============================================================================
; TODO: Document Area_SetBlocks_SetAttributes
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_SetBlocks
;============================================================================
Area_SetBlocks_SetAttributes:               ; [$d82d]
    ;
    ; Create a normalized offset from the index.
    ;
    ; This will be the index + 32.
    ;
    ; Effectively, this is ensuring we always have bit 5
    ; set, and are starting at a value of >= 32 for the
    ; bit math.
    ;
    CLC
    ADC #$20                                ; A = index + 32
    STA Temp_00                             ; Store it.


    ;
    ; Create a floored offset from the index.
    ;
    ; This will be one of 0, 8, 16, 24, 32, 40, 48, or 56.
    ; It will be stored in PPU_TargetAddr for later.
    ;
    LSR A                                   ; A = A / 4
    LSR A
    AND #$38                                ; Round down to a multiple of 8.
    STA a:PPU_TargetAddr                    ; Store it.


    ;
    ; Compute the lower starting byte for the PPU address.
    ;
    ; This is where the block will be written to on the
    ; screen.
    ;
    ; Result is the floored offset (multiple of 8) OR'd
    ; with half the lower nibble of the normalized offset.
    ;
    LDA Temp_00                             ; A = normalized offset.
    AND #$0f                                ; A = lower nibble of A.
    LSR A                                   ; A = A / 2
    ORA a:PPU_TargetAddr                    ; OR with the floored offset.
    STA a:PPU_TargetAddr                    ; And store it.


    ;
    ; Compute a corner index (0..3) based on the offset.
    ;
    ; The corner is composed of bits 0 and 4, packed into
    ; 2 bits. So:
    ;
    ;     0000 0000 == 0
    ;     0000 0001 == 1
    ;     0001 0000 == 2
    ;     0001 0001 == 3
    ;
    LDA Temp_00                             ; A = normalized offset.
    AND #$10                                ; Keep bit 4 (result = 0 or 16)
    LSR A                                   ; Convert to value 0 or 2.
    LSR A
    LSR A
    STA Temp_06                             ; Store the result.
    LDA Temp_00                             ; A = floored offset.
    AND #$01                                ; Keep bit 0 (result = 0 or 1).
    ORA Temp_06                             ; OR with the value we just
                                            ; calculated (result = 0..3)
    STA Temp_06                             ; Store it.


    ;
    ; Load the block attributes for this block.
    ;
    LDY a:Arg_BlockAttributesIndex          ; Y = block attributes index for
                                            ; the new block.
    LDA (CurrentArea_BlockAttributesAddr),Y ; A = block attributes for that
                                            ; index.
    LDX Temp_06                             ; X = corner (0..3 value from
                                            ; above).
    AND SET_BLOCKS_TILE_CORNER_MASK,X       ; A = block attributes for the
                                            ; given corner.
    PHA                                     ; Push it to the stack.


    ;
    ; Get the screen index we're drawing to.
    ;
    LDA PPU_ScrollScreen                    ; A = Scroll screen to update.
    AND #$01                                ; Keep the right-most bit (0 or
                                            ; 1)
    TAX                                     ; X = result as an index for the
                                            ; lookup tables.


    ;
    ; Compute a start address for that screen.
    ;
    ; NOTE: Despite using a lookup table, this will always
    ;       be $0242 (TextBox_AttributeData), since all
    ;       values in the tables are the same for all indexes.
    ;
    ;       This is code that could be optimized away.
    ;
    LDA SET_BLOCKS_TILEMAP_OFFSETS_L,X      ; A = lower byte of PPU address
    STA Temp_Addr_L                         ; Store it.
    LDA SET_BLOCKS_TILEMAP_OFFSETS_U,X      ; A = upper byte of PPU address
    STA Temp_Addr_U                         ; Store it.


    ;
    ; Compute the upper starting byte for the PPU address.
    ;
    LDA SET_BLOCKS_SCREEN_TILEMAP_ADDRS_U,X ; A = tilemap address for the
                                            ; screen.
    STA a:PPU_TargetAddr_U                  ; Store as the upper byte of the
                                            ; tilemap address.


    ;
    ; Combine the new data for this corner with the existing
    ; data.
    ;
    LDY a:PPU_TargetAddr                    ; Y = lower byte of tilemap
                                            ; address computed above.
    LDA (Temp_Addr_L),Y                     ; Load the data for this block.
    LDX Temp_06                             ; X = corner value (0..3)
    AND SET_BLOCKS_TILE_CORNER_MASK_INVERT,X ; Invert the corner mask (keep
                                             ; all non-updated corner data).
    STA Temp_06                             ; Store as the new value.
    PLA                                     ; Pull the updated block
                                            ; attributes for the corner.
    ORA Temp_06                             ; OR it with the non-updating
                                            ; corner values.
    STA (Temp_Addr_L),Y                     ; And store it.
    PHA                                     ; And push it to the stack.


    ;
    ; Create a final PPU attribute target address to draw to.
    ;
    ; This is going to be an address starting at $23C0.
    ;
    LDA a:PPU_TargetAddr_U                  ; Load the upper byte of the PPU
                                            ; address.
    ORA #$03                                ; Ensure it starts at 0x03
                                            ; (address >= $03XX).
                                            ; Realistically, $23C0 (we
                                            ; guarantee 0x20 or 0x24 above
                                            ; for the screen).
    STA a:PPU_TargetAddr_U                  ; Store as the new upper byte.
    LDA a:PPU_TargetAddr                    ; Load the lower byte.
    ORA #$c0                                ; Ensure it starts at 0xC0
                                            ; (address >= $XXC0)
    STA a:PPU_TargetAddr                    ; Store it.


    ;
    ; Write the attribute data to the PPU buffer.
    ;
    LDA #$01
    JSR PPUBuffer_QueueCommandOrLength      ; Queue 1 byte.
    PLA                                     ; Pull the attribute data to
                                            ; write from stack.
    STA PPUBuffer,X                         ; Store it in the buffer at X.
    INX                                     ; X++ (new offset)
    STX PPUBuffer_WriteOffset               ; Store it.
    RTS

;
; XREFS:
;     Area_SetBlocks_SetAttributes
;
SET_BLOCKS_TILE_CORNER_MASK:                ; [$d8a4]
    .byte $03                               ; [0]:
    .byte $0c                               ; [1]:
    .byte $30                               ; [2]:
    .byte $c0                               ; [3]:

;
; XREFS:
;     Area_SetBlocks_SetAttributes
;
SET_BLOCKS_TILE_CORNER_MASK_INVERT:         ; [$d8a8]
    .byte $fc                               ; [0]:
    .byte $f3                               ; [1]:
    .byte $cf                               ; [2]:
    .byte $3f                               ; [3]:
;============================================================================
; TODO: Document Area_SetPPUAddrForBlockIndex
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_SetBlocks
;============================================================================
Area_SetPPUAddrForBlockIndex:               ; [$d8ac]
    ;
    ; Build an address based on the X, Y position.
    ;
    ; X = X * 2
    ; Y = Y * 4
    ;
    LDA #$00
    STA a:PPU_TargetAddr_U
    TXA
    AND #$0f
    ASL A
    STA a:PPU_TargetAddr
    TXA
    AND #$f0
    ASL A
    ROL a:PPU_TargetAddr_U
    ASL A
    ROL a:PPU_TargetAddr_U
    CLC
    ADC a:PPU_TargetAddr
    STA a:PPU_TargetAddr
    LDA PPU_ScrollScreen
    AND #$01
    TAY
    LDA a:PPU_TargetAddr_U
    ORA BYTE_ARRAY_PRG15_MIRROR__d8ea,Y
    STA a:PPU_TargetAddr_U
    LDA a:PPU_TargetAddr
    CLC
    ADC #$80
    STA a:PPU_TargetAddr
    LDA a:PPU_TargetAddr_U
    ADC #$00
    STA a:PPU_TargetAddr_U
    RTS

;
; XREFS:
;     Area_SetPPUAddrForBlockIndex
;
BYTE_ARRAY_PRG15_MIRROR__d8ea:              ; [$d8ea]
    .byte $20                               ; [0]:
    .byte $24                               ; [1]:


;============================================================================
; Reset the state for the player upon death.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
; OUTPUTS:
;     Player_InvincibilityPhase:
;     Player_MovementTick:
;     Player_StatusFlag:
;         Cleared.
;
; CALLS:
;     Screen_ClearSprites
;     Screen_LoadUIPalette
;     MMC1_LoadBankAndJump
;     Screen_ResetSpritesForGamePlay
;     Player_DrawSprite
;     PPUBuffer_WritePalette
;     PlayerDeath_ResetSelectedItemState
;     Player_DrawBody
;     Player_DrawDeathAnimation
;     Player_Spawn
;     Screen_FadeToBlack
;     Screen_NextTransitionState
;     Game_InitStateForSpawn
;     WaitForInterrupt
;     WaitForNextFrame
;
; XREFS:
;     Game_MainLoop
;============================================================================
Player_HandleDeath:                         ; [$d8ec]
    LDX #$ff                                ; X = 0xFF
    TXS                                     ; Set as stack pointer


    ;
    ; Switch to bank 14 (Logic)
    ;
    LDX #$0e
    JSR MMC1_UpdateROMBank                  ; Switch to bank 14.


    ;
    ; Clear all player bits but the facing direction.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$40                                ; Remove all but the facing
                                            ; direction bit.
    STA Player_Flags                        ; Store it back.


    ;
    ; Clear out more player state.
    ;
    LDA #$00
    STA Player_StatusFlag                   ; Set player status to 0.
    STA Player_MovementTick                 ; Set the movement tick to 0.
    STA Player_InvincibilityPhase           ; Set invincibility phase to 0.


    ;
    ; Push the inventory state to the stack.
    ;
    LDA a:SelectedWeapon                    ; Load the selected weapon.
    PHA                                     ; Push to the stack.
    LDA a:SelectedArmor                     ; Load the selected armor.
    PHA                                     ; Push to the stack.
    LDA a:SelectedShield                    ; Load the selected shield.
    PHA                                     ; Push to the stack.
    LDA a:SelectedMagic                     ; Load the selected magic.
    PHA                                     ; Push to the stack.
    LDA a:SelectedItem                      ; Load the selected item.
    PHA                                     ; Push to the stack.


    ;
    ; Wait for interrupt and call other functions to
    ; reset state.
    ;
    JSR WaitForInterrupt                    ; Wait for interrupt.
    JSR Screen_ResetSpritesForGamePlay      ; Reset animations.
    JSR PlayerDeath_ResetSelectedItemState  ; Reset selected item state.
    JSR Player_DrawSprite                   ; Update player sprite.


    ;
    ; Prepare state for screen transitions.
    ;
    LDA #$00
    STA a:Screen_TransitionCounter          ; Clear the screen transition
                                            ; counter.


    ;
    ; Reset the player death state.
    ;
    STA a:PlayerIsDead                      ; Clear the dead flag.
    LDA #$ff
    STA a:Player_DeathAnimationPhase        ; Clear the death animation
                                            ; phase.
    STA a:Player_DeathAnimationCounter      ; Clear the death animation
                                            ; counter.
    STA a:Screen_FadeOutStage               ; Clear the palette index.


    ;
    ; Clear the sprites and music.
    ;
    JSR Screen_ClearSprites                 ; Clear sprites from the screen.
    LDA #$00
    STA Music_Current                       ; Clear the music.


    ;
    ; Play the death sound effect.
    ;
    LDA #$16                                ; 0x16 == Player death sound.
    JSR Sound_PlayEffect                    ; Play the sound effect.


    ;
    ; Begin our death animation loop.
    ;
    ; This will dissolve the user's sprite.
    ;
  @_dissolvePlayerLoop:                     ; [$d941]
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Screen_ResetSpritesForGamePlay      ; Reset animations.
    JSR Screen_NextTransitionState          ; Prepare for the next screen
                                            ; state.
    JSR Player_DrawBody                     ; Draw the player.
    JSR Player_DrawDeathAnimation           ; Draw the next cycle of the
                                            ; death animation.


    ;
    ; Check whether to reset the animation state.
    ;
    LDA a:Player_DeathAnimationPhase        ; Load the animation phase.
    CMP #$ff                                ; Is it 0xFF (complete)?
    BNE @_prepareNextLoop                   ; If not, prepare for the next
                                            ; loop.
    LDA a:Screen_TransitionCounter          ; Load the screen transition
                                            ; counter.
    CMP #$10                                ; Is it >= 16?
    BCC @_prepareNextLoop                   ; If so, prepare for next loop.


    ;
    ; Clear animation state.
    ;
    LDA #$00
    STA a:Player_DeathAnimationPhase        ; Clear the animation phase.
    STA a:Player_DeathAnimationCounter      ; Clear the animation counter.

  @_prepareNextLoop:                        ; [$d966]
    INC a:Screen_TransitionCounter          ; Increment the screen transition
                                            ; counter.
    BNE @_continueDissolvePlayerLoop        ; If transition counter != 0,
                                            ; loop.


    ;
    ; We're past the player death animation.
    ;
    ; Load the palette and update the screen.
    ;
    LDA a:Screen_PaletteIndex
    JSR Screen_LoadUIPalette                ; Load the palette.
    JSR PPUBuffer_WritePalette              ; Append 0 to the PPU buffer.


    ;
    ; Restore the player's inventory.
    ;
    PLA                                     ; Pop the selected item from the
                                            ; stack.
    STA a:SelectedItem                      ; Set it.
    PLA                                     ; Pop the magic from the stack.
    STA a:SelectedMagic                     ; Set it.
    PLA                                     ; Pop the shield from the stack.
    STA a:SelectedShield                    ; Set it.
    PLA                                     ; Pop the armor from the stack.
    STA a:SelectedArmor                     ; Set it.
    PLA                                     ; Pop the weapon from the stack.
    STA a:SelectedWeapon                    ; Set it.


    ;
    ; Set the death music.
    ;
    LDA #$08                                ; 0x08 == Death music.
    STA Music_Current                       ; Set as the current music.


    ;
    ; Clear the sprite loaded state.
    ;
    LDA #$ff
    STA Screen_ReadyState                   ; Set loaded state to 0xFF.


    ;
    ; Run IScript 0xFF via jump to IScripts_Begin.
    ;
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterIScriptFarJump:                    ; [$d996]
    LDA #$00                                ; 0 = No music
    STA Music_Current                       ; Set it.


    ;
    ; Set initial gold and experience via jump
    ; to Player_SetInitialExpAndGold.
    ;
    JSR MMC1_LoadBankAndJump                ; Run:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer Player_SetInitialExpAndGold-1   ; Address =
                                            ; Player_SetInitialExpAndGold

  @_afterSetExpGoldFarJump:                 ; [$d9a0]
    JSR Screen_FadeToBlack                  ; Fade the screen to black.
    JSR Game_InitStateForSpawn              ; Reset state for spawn.
    JMP Player_Spawn                        ; Spawn the player.

  @_continueDissolvePlayerLoop:             ; [$d9a9]
    JMP @_dissolvePlayerLoop


;============================================================================
; Begin the end-game sequence following the final boss kill.
;
; This will freeze the game briefly, fade to black, and then
; briefly wait while playing music before moving the player
; into the King's room for the final dialogue sequence.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     EndGame_BeginKingsRoomSequence
;     Screen_ClearSprites
;     Screen_ResetSpritesForGamePlay
;     Game_DrawScreenInFrozenState
;     Screen_FadeToBlack
;     WaitForNextFrame
;
; XREFS:
;     ScreenEvents_HandleFinalBossKilled
;============================================================================
EndGame_Begin:                              ; [$d9ac]
    ;
    ; Clear all sprites from the screen.
    ;
    JSR Screen_ClearSprites                 ; Clear sprites.


    ;
    ; Wait 120 frames before beginning the fade-out.
    ;
    LDX #$78                                ; X = 120 (loop counter)

  @_beforeFadeLoop:                         ; [$d9b1]
    TXA                                     ; A = X
    PHA                                     ; Push to the stack.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Screen_ResetSpritesForGamePlay      ; Reset for this frame.
    JSR Game_DrawScreenInFrozenState        ; Draw the screen and player in a
                                            ; semi-paused state.
    PLA                                     ; Pop our loop counter.
    TAX                                     ; X = A
    DEX                                     ; X--
    BNE @_beforeFadeLoop                    ; If > 0, loop.


    ;
    ; Fade the screen to black.
    ;
    JSR Screen_FadeToBlack                  ; Fade to black.


    ;
    ; Wait another 120 frames before switching screens.
    ;
    LDX #$78                                ; X = 120 (loop counter)

  @_beforeTransitionLoop:                   ; [$d9c6]
    TXA                                     ; A = X (loop counter)
    PHA                                     ; Push to the stack.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Screen_ResetSpritesForGamePlay      ; Reset for this frame.
    PLA                                     ; Pop our loop counter.
    TAX                                     ; X = A (loop counter)
    DEX                                     ; X--
    BNE @_beforeTransitionLoop              ; If > 0, loop.


    ;
    ; Move the player to the King's room and begin the
    ; end-game dialogue sequence.
    ;
    JMP EndGame_BeginKingsRoomSequence      ; Begin the next transition into
                                            ; the King's room.


;============================================================================
; Draw the player's death animation.
;
; This will make us of the Clear Vertical Lines PPU
; draw command
; (PPUBuffer_DrawCommand_RemoveVerticalLines),
; clearing away lines from the player sprite in a set
; pattern until a counter is reached and the player is gone.
;
; This will run for 250 frames.
;
; INPUTS:
;     Player_DeathAnimationPhase:
;         The phase to pass to the draw command.
;
;     Player_DeathAnimationCounter:
;         The animation counter, which will govern
;         phase, tile address, and total animation
;         time.
;
;     InterruptCounter:
;         The current interrupt counter.
;
;     PPUBuffer_WriteOffset:
;         The upper bounds of the PPU buffer.
;
;     DEATH_ANIMATION_DRAW_ADDR_LOWER:
;         A mapping of counter values to player tile
;         lower address bytes.
;
; OUTPUTS:
;     Player_DeathAnimationCounter:
;         The updated death animation counter.
;
;     Player_DeathAnimationPhase:
;         The updated death animation phase.
;
;     PPUBuffer:
;         The PPU buffer to write to.
;
;     PPUBuffer_WriteOffset:
;         The new upper bounds of the PPU buffer.
;
; XREFS:
;     Player_HandleDeath
;============================================================================
Player_DrawDeathAnimation:                  ; [$d9d6]
    LDA a:Player_DeathAnimationPhase        ; Load the death animation phase.
    CMP #$08                                ; Is it >= 8?
    BCS @_return                            ; If so, return.
    LDA a:Player_DeathAnimationCounter      ; Load the animation death
                                            ; counter.
    BPL @_dissolveSprite                    ; If >= 0, jump to dissolve the
                                            ; sprite.
    LDA InterruptCounter                    ; Else, load the interrupt
                                            ; counter.
    AND #$03                                ; Every 3 out of 4 ticks...
    BNE @_return                            ; Return.
    LDA #$00
    STA a:Player_DeathAnimationCounter      ; Clear the death counter.


    ;
    ; Queue draw command 0xFA, dissolving the character's sprite
    ; by removal of vertical lines.
    ;
    ; This is
    ; PPUBuffer_DrawCommand_RemoveVerticalLines.
    ;
    ; Draw 250 frames.
    ;
  @_dissolveSprite:                         ; [$d9ed]
    LDX PPUBuffer_WriteOffset               ; X = PPU buffer upper bounds.
    LDA #$fa                                ; A = 0xFA (Remove Vertical Lines
                                            ; draw command).
    STA PPUBuffer,X                         ; Set that as the command to
                                            ; execute.


    ;
    ; Set the current player phase for the draw.
    ;
    INX                                     ; X++
    LDA a:Player_DeathAnimationPhase        ; Load the animation phase.
    STA PPUBuffer,X                         ; Set that as the phase
                                            ; parameter.


    ;
    ; Set the upper byte of the address to 0.
    ;
    INX                                     ; X++
    LDA #$00
    STA PPUBuffer,X                         ; Set 0 as the upper address.


    ;
    ; Set the lower byte of the address based on the counter.
    ;
    INX                                     ; X++
    LDY a:Player_DeathAnimationCounter      ; Load the animation counter.
    LDA DEATH_ANIMATION_DRAW_ADDR_LOWER,Y   ; Load the lower address for Y.
    STA PPUBuffer,X                         ; Set it as the lower address.


    ;
    ; Store the new upper bounds of the PPU buffer.
    ;
    INX                                     ; X++
    STX PPUBuffer_WriteOffset               ; Set as the new upper bounds for
                                            ; the PPU buffer.


    ;
    ; Update the animation counter.
    ;
    INC a:Player_DeathAnimationCounter      ; Increment the animation
                                            ; counter.


    ;
    ; If >= 8, reset the counter and increment the phase.
    ;
    LDA a:Player_DeathAnimationCounter      ; Load the new animation counter.
    CMP #$08                                ; Is it < 8?
    BCC @_return                            ; If so, return.


    ;
    ; Reset the animation counter and increment the phase.
    ; Player_HandleDeath will see this and prepare the
    ; next
    ; round of vertical line removals.
    ;
    LDA #$ff
    STA a:Player_DeathAnimationCounter      ; Set the animation counter to
                                            ; 0xFF.
    INC a:Player_DeathAnimationPhase        ; Increment the animation phase.

  @_return:                                 ; [$da20]
    RTS


;============================================================================
; Lower bytes for the player's tiles to update during death animation.
;
; XREFS:
;     Player_DrawDeathAnimation
;============================================================================

;
; XREFS:
;     Player_DrawDeathAnimation
;
DEATH_ANIMATION_DRAW_ADDR_LOWER:            ; [$da21]
    .byte $00                               ; [0]:
    .byte $10                               ; [1]:
    .byte $20                               ; [2]:
    .byte $30                               ; [3]:
    .byte $40                               ; [4]:
    .byte $50                               ; [5]:
    .byte $60                               ; [6]:
    .byte $70                               ; [7]:


;============================================================================
; DEADCODE: Clear the fade-out stage for the screen transitions.
;============================================================================
UNUSED_Screen_ClearFadeOutStage:            ; [$da29]
    LDA #$ff
    STA a:Screen_FadeOutStage
    RTS


;============================================================================
; Fade the screen out to black.
;
; This is called during door transitions or after
; dissolving a character during death.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     Screen_FadeOutStage:
;         Clobbered.
;
; CALLS:
;     WaitForInterrupt
;     Screen_NextTransitionState
;
; XREFS:
;     EndGame_Begin
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToInside
;     Player_EnterDoorToOutside
;     _afterSetExpGoldFarJump
;     [$PRG15_MIRROR::d9a0]
;============================================================================
Screen_FadeToBlack:                         ; [$da2f]
    LDA #$00                                ; X = 0 (loop counter)
    STA a:Screen_FadeOutStage               ; Set as the index into the
                                            ; screen palette lookup.

  @_loop:                                   ; [$da34]
    JSR WaitForInterrupt                    ; Wait for the next interrupt.
    JSR Screen_NextTransitionState          ; Update the screen for this
                                            ; palete.
    LDA a:Screen_FadeOutStage               ; Load the palette index.
    CMP #$04                                ; Is it < 4?
    BCC @_loop                              ; If so, loop.
    RTS


;============================================================================
; Handle the next state for a screen transition.
;
; This may be used when entering a building or when dying.
; An outer loop will call this each tick. It won't begin
; the fadeout until Screen_FadeOutStage is a value 0-4.
;
; The palette will increase at periodic intervals,
; eventually ending with a black screen.
;
; INPUTS:
;     Screen_FadeOutStage:
;         The current palette index.
;
;     Screen_FadeOutCounter:
;         The counter for this loop.
;
;     Screen_PaletteIndex:
;         The palette index to apply for the transition.
;
; OUTPUTS:
;     Screen_FadeOutStage:
;         The new palette index.
;
;     Screen_FadeOutCounter:
;         The fade-out counter.
;
; XREFS:
;     Player_HandleDeath
;     Screen_FadeToBlack
;============================================================================
Screen_NextTransitionState:                 ; [$da42]
    LDA a:Screen_FadeOutStage               ; Load the current palette index.
    CMP #$04                                ; Is it >= 4?
    BCS @_doneFadeOut                       ; If so, jump to finish up.
    LDA a:Screen_FadeOutCounter             ; A = fadeout counter.
    CLC
    ADC #$32                                ; A += 0x32 (50)
    STA a:Screen_FadeOutCounter             ; Store as the new value.
    BCC @_doneFadeOut                       ; If 0, don't alter the palette.


    ;
    ; Fade out to the next palette towards black.
    ;
    LDA a:Screen_PaletteIndex               ; Load the screen palette index.
    JSR Screen_SetFadeOutPalette            ; Load the palette into memory.
    INC a:Screen_FadeOutStage               ; Increment the palette index to
                                            ; the next transition state.

  @_doneFadeOut:                            ; [$da5d]
    LDA a:Screen_TransitionCounter          ; Load the screen transition
                                            ; counter.
    CMP #$50                                ; Is it < 80?
    BNE @_return                            ; If so, return.


    ;
    ; We're doing player death, and have finished dissolving
    ; the player. We can now begin fading to black.
    ;
    LDA #$00
    STA a:Screen_FadeOutStage               ; Set the palette to 0.

  @_return:                                 ; [$da69]
    RTS


;============================================================================
; Initialize the state for the Faxanadu start screen.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Area_CurrentArea:
;         Set to Eolis.
;
;     Area_Region:
;         Set to Eolis.
;
; CALLS:
;     Player_InitInventoryState
;     Game_InitStateForSpawn
;     Game_ShowStartScreen
;
; XREFS:
;     Game_Init
;============================================================================
Game_InitStateForStartScreen:               ; [$da6a]
    LDX #$ff                                ; X = 0xFF
    TXS                                     ; Copy to stack pointer.
    LDA #$00                                ; A = 0
    STA Area_CurrentArea                    ; Set as the current area (Eolis)
    STA a:Area_Region                       ; Set as the current region
                                            ; (Eolis)
    JSR Player_InitInventoryState           ; Initialize the player
                                            ; inventory.
    JSR Game_InitStateForSpawn              ; Initiate the spawn state.
    JMP Game_ShowStartScreen                ; Show the start screen.

;============================================================================
; TODO: Document Game_InitStateForSpawn
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_InitStateForStartScreen
;============================================================================
Game_InitStateForSpawn:                     ; [$da7d]
    JSR PPU_WaitUntilFlushed                ; Wait until the PPU is flushed.
    LDA #$00
    STA a:PlayerIsDead                      ; Set the player as alive.
    STA PPUBuffer_WriteOffset               ; Reset PPU buffer upper bounds
                                            ; to 0.
    STA PPUBuffer_ReadOffset                ; Reset PPU buffer offset to 0.
    STA Screen_ReadyState                   ; Mark the screen as loaded and
                                            ; ready.
    JSR Player_SetInitialState              ; Initialize the player's initial
                                            ; state.
    JSR Player_ClearVisibleMagic            ; Clear any visible magic on
                                            ; screen.
    JSR Sprites_LoadCommon                  ; Load sprites from bank 8.
    LDA #$01
    STA a:Maybe_Game_Ready                  ; Set that the game is ready to
                                            ; play.
    LDA #$00
    STA PPU_ScrollX                         ; Clear the scrolling screen
                                            ; pixel state.
    STA PPU_ScrollScreen                    ; Clear the scrolling screen
                                            ; state.
    RTS


;============================================================================
; Setup state for entering a new screen.
;
; This is called when switching screens or entering through
; a door.
;
; This will set up the game and screen state for the
; destination and load new sprites.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Screen_ResetForGamePlay
;     GameLoop_LoadSpriteImages
;     PPU_WaitUntilFlushed
;     Screen_Load
;     WaitForNextFrame
;
; XREFS:
;     Player_CheckHandleEnterDoor
;============================================================================
Game_SetupEnterScreen:                      ; [$daa0]
    JSR PPU_WaitUntilFlushed                ; Wait until the PPU is flushed.
    JSR Screen_Load                         ; Load the screen state.
    JSR Screen_ResetForGamePlay             ; Reset the screen and enable
                                            ; interrupts.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JMP GameLoop_LoadSpriteImages           ; Load the sprite images.


;============================================================================
; Setup state for entering a building.
;
; This will set up the game and screen state for the
; destination building and load new sprites.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Game_EnterBuilding
;     Screen_ResetForGamePlay
;     GameLoop_LoadSpriteImages
;     PPU_WaitUntilFlushed
;     WaitForNextFrame
;
; XREFS:
;     EndGame_MoveToKingsRoom
;     Player_EnterDoorToInside
;     Player_Spawn
;============================================================================
Game_SetupEnterBuilding:                    ; [$daaf]
    JSR PPU_WaitUntilFlushed                ; Wait until the PPU is flushed.
    JSR Game_EnterBuilding                  ; Load state for the building.
    JSR Screen_ResetForGamePlay             ; Reset the screen and enable
                                            ; interrupts.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JMP GameLoop_LoadSpriteImages           ; Load the sprite images.


;============================================================================
; Setup state for exiting a building.
;
; This will set up the game and screen state for the
; area outside the building and load new sprites.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Game_ExitBuilding
;     Screen_ResetForGamePlay
;     GameLoop_LoadSpriteImages
;     PPU_WaitUntilFlushed
;     WaitForNextFrame
;
; XREFS:
;     Game_BeginExitBuilding
;============================================================================
Game_SetupExitBuilding:                     ; [$dabe]
    JSR PPU_WaitUntilFlushed                ; Wait until the PPU is flushed.
    JSR Game_ExitBuilding                   ; Load state for the area outside
                                            ; the building.
    JSR Screen_ResetForGamePlay             ; Reset the screen and enable
                                            ; interrupts.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JMP GameLoop_LoadSpriteImages           ; Load the sprite images.


;============================================================================
; Setup state for a new area.
;
; This will set up the game and screen state for the
; area and load new sprites.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Game_EnterAreaHandler
;     Screen_ResetForGamePlay
;     GameLoop_LoadSpriteImages
;     PPU_WaitUntilFlushed
;     WaitForNextFrame
;
; XREFS:
;     Player_CheckSwitchScreen_SwitchAreaHoriz
;============================================================================
Game_SetupNewArea:                          ; [$dacd]
    JSR PPU_WaitUntilFlushed                ; Wait until the PPU is flushed.
    JSR Game_EnterAreaHandler               ; Load state for the new area.
    JSR Screen_ResetForGamePlay             ; Reset the screen and enable
                                            ; interrupts.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JMP GameLoop_LoadSpriteImages           ; Load the sprite images.


;============================================================================
; Setup state for an area in a new region of the game.
;
; This will set up the game and screen state for the
; area and load new sprites.
;
; This is used when exiting a door to the outside, or
; when using the controller 2 debug code to switch areas.
;
; INPUTS:
;     DOOR_OUTSIDE_REGION_INDEXES:
;         Mapping of regions to areas to place the player.
;
; OUTPUTS:
;     Area_CurrentArea:
;         The new area to set.
;
; CALLS:
;     Game_LoadCurrentArea
;     Game_MainLoop
;     Screen_ResetForGamePlay
;     GameLoop_LoadSpriteImages
;     PPU_WaitUntilFlushed
;     WaitForNextFrame
;
; XREFS:
;     Debug_ChooseArea
;     Player_EnterDoorToOutside
;============================================================================
Game_SetupAndLoadOutsideArea:               ; [$dadc]
    JSR PPU_WaitUntilFlushed                ; Wait until the PPU is flushed.
    LDX a:Area_Region                       ; Load the region.
    LDA DOOR_OUTSIDE_REGION_INDEXES,X       ; Load the area of the game to
                                            ; place the player for this
                                            ; region.
    STA Area_CurrentArea                    ; Store as the new area.
    JSR Game_LoadCurrentArea                ; Load data for the area.
    JSR Screen_ResetForGamePlay             ; Reset the screen and enable
                                            ; interrupts.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR GameLoop_LoadSpriteImages           ; Load the sprite images.
    JMP Game_MainLoop                       ; Run the game mainloop.


;============================================================================
; DEADCODE
;
; Would assign the area based on transitioning from another.
;============================================================================
FUN_PRG15_MIRROR__daf6:                     ; [$daf6]
    LDX a:Area_Region
    LDA DOOR_OUTSIDE_REGION_INDEXES,X
    STA Area_CurrentArea

;
; XREFS:
;     FUN_PRG15_MIRROR__daf6
;     Game_SetupAndLoadOutsideArea
;
DOOR_OUTSIDE_REGION_INDEXES:                ; [$dafe]
    .byte AREA_EOLIS                        ; [0]: Eolis
    .byte AREA_TRUNK                        ; [1]: Trunk
    .byte AREA_MIST                         ; [2]: Mist
    .byte AREA_BRANCH                       ; [3]: Branch
    .byte AREA_DARTMOOR                     ; [4]: Dartmoor
    .byte AREA_ZENIS                        ; [5]: Evil Fortress


;============================================================================
; Place the player in the King's room and move toward the King.
;
; This is part of the end-game sequence, and takes place
; immediately after the final boss is killed and the screen
; fades out.
;
; The player will be placed back in the King's room, and
; will then begin moving automatically toward the King.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     EndGame_MoveToKingsRoom
;     EndGame_MainLoop
;
; XREFS:
;     EndGame_Begin
;============================================================================
EndGame_BeginKingsRoomSequence:             ; [$db04]
    JSR EndGame_MoveToKingsRoom             ; Place the player in the King's
                                            ; room.
    JMP EndGame_MainLoop                    ; Move the player toward the
                                            ; King.


;============================================================================
; Spawn the player.
;
; This will set the player's HP and MP to max, reset
; quest state and timed items, and place the player in
; the latest temple.
;
; INPUTS:
;     Quests:
;         The completed quests.
;
; OUTPUTS:
;     Quests:
;         The updated completed quests.
;
;     Player_HP_U:
;         The filled player HP.
;
;     Player_MP:
;         The filled player MP.
;
; CALLS:
;     Game_ClearTimedItems
;     Game_SpawnInTemple
;     Game_SetupEnterBuilding
;     Game_MainLoop
;
; XREFS:
;     Game_ShowStartScreen
;============================================================================
Player_Spawn:                               ; [$db0a]
    LDA #$50
    STA a:Player_HP_U                       ; Set the initial player HP to
                                            ; 80.
    STA a:Player_MP                         ; Set the initial player MP to
                                            ; 80.
    LDA a:Quests                            ; Load the completed quests.
    AND #$ef                                ; Disable the Mattock barrier to
                                            ; Mascon quest.
    STA a:Quests                            ; Store it.
    JSR Game_ClearTimedItems                ; Cleared all timed items.
    JSR Game_SpawnInTemple                  ; Spawn in the temple.
    JSR Game_SetupEnterBuilding             ; Change the state to be inside a
                                            ; building.
    JMP Game_MainLoop                       ; Start the mainloop.


;============================================================================
; Start the game.
;
; This runs after the intro animation finishes, placing
; the player at the gates of Eolis with no MP and no
; experience.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     Player_MP:
;         Set to 0.
;
;     Experience:
;         Set to 0.
;
;     See Fallthrough.
;
; CALLS:
;     Screen_ResetForGamePlay
;     Game_ClearTimedItems
;     Game_LoadFirstLevel
;     GameLoop_LoadSpriteImages
;     PPU_WaitUntilFlushed
;     WaitForNextFrame
;
; FALLTHROUGH:
;     Game_MainLoop
;
; XREFS:
;     Game_ShowStartScreen
;============================================================================
Game_Start:                                 ; [$db26]
    JSR Game_ClearTimedItems                ; Clear all timed items.
    JSR PPU_WaitUntilFlushed                ; Wait until everything is drawn
                                            ; to the screen.
    JSR Game_LoadFirstLevel                 ; Load the first level.


    ;
    ; Clear the player's MP.
    ;
    LDA #$00
    STA a:Player_MP                         ; Set MP to 0.


    ;
    ; Clear the player's experience.
    ;
    LDA #$00
    STA a:Experience                        ; Set lower byte of experience to
                                            ; 0.
    STA a:Experience_U                      ; And upper byte.


    ;
    ; Prepare state for the first screen of Eolis, including the
    ; intro trigger sprite entity.
    ;
    JSR Screen_ResetForGamePlay             ; Reset the screen and enable
                                            ; interrupts.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR GameLoop_LoadSpriteImages           ; Load images for the current
                                            ; sprite entities (which will be
                                            ; the intro trigger).

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Mainloop for the game.
;
; This controls all input, rendering, and eventing while
; playing the game.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; XREFS:
;     Game_MainLoop
;     Game_SetupAndLoadOutsideArea
;     Player_Spawn
;============================================================================
Game_MainLoop:                              ; [$db45]
    LDX #$ff                                ; X = 0xFF
    TXS                                     ; Transfer to the stack.


    ;
    ; Switch to bank 14 to run sprite logic.
    ;
    LDX #$0e                                ; Bank 14 = Logic
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Prepare to draw sprites.
    ;
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Screen_ResetSpritesForGamePlay      ; Reset the sprite state for the
                                            ; screen.
    JSR GameLoop_UpdatePlayer
    JSR Player_DrawShield                   ; Draw the player's shield
                                            ; sprite.
    JSR Player_DrawBody                     ; Draw the player's body sprite.
    JSR Player_DrawWeapon                   ; Draw the player's weapon
                                            ; sprite.
    JSR Player_CastMagic                    ; Check and handle casting magic.
    JSR GameLoop_CheckUseCurrentItem        ; Active selected item?
    JSR Sprites_UpdateAll                   ; Update all sprites.
    JSR GameLoop_CountdownItems
    JSR Fog_OnTick
    JSR GameLoop_CheckShowPlayerMenu
    JSR GameLoop_RunScreenEventHandlers
    JSR GameLoop_CheckPauseGame
    LDA a:PlayerIsDead
    BEQ @_playerIsNotDead
    JMP Player_HandleDeath

  @_playerIsNotDead:                        ; [$db7f]
    LDA Screen_ScrollDirection
    BMI Game_MainLoop
    JSR PPUBuffer_WaitUntilClear
    LDA a:Maybe_Game_Ready
    BEQ @LAB_PRG15_MIRROR__db91
    LDA Screen_ScrollDirection
    CMP #$02
    BCC @LAB_PRG15_MIRROR__dbaf

  @LAB_PRG15_MIRROR__db91:                  ; [$db91]
    JSR Screen_ResetSpritesForGamePlay
    JSR WaitForNextFrame
    JSR Screen_ClearSprites
    JSR Screen_LoadSpriteInfo
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages
    JSR PPU_WaitUntilFlushed
    JSR Game_UpdateForScroll
    JSR Screen_ResetForGamePlay
    JMP Game_MainLoop

  @LAB_PRG15_MIRROR__dbaf:                  ; [$dbaf]
    JSR WaitForNextFrame
    JSR Screen_ResetSpritesForGamePlay
    JSR Player_DrawShield
    JSR Player_DrawBody
    JSR Player_DrawWeapon
    JSR Screen_ClearSprites
    JSR Screen_LoadSpriteInfo
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages

  @_scrolling:                              ; [$dbca]
    JSR WaitForNextFrame
    JSR Screen_ResetSpritesForGamePlay
    JSR Game_UpdatePlayerOnScroll
    JSR Player_DrawShield
    JSR Player_DrawBody
    JSR Player_DrawWeapon
    JSR Screen_HandleScroll
    JSR Screen_HandleScroll
    JSR Screen_HandleScroll
    JSR Screen_HandleScroll
    LDA Screen_ScrollDirection
    BPL @_scrolling
    JMP Game_MainLoop


;============================================================================
; Mainloop for the end of the game.
;
; This will act as a normal mainloop, except the button
; inputs will be simulated to approach the King and trigger
; the dialogue.
;
; The actual ending-game sequence happens after interacting
; with the King, which uses an IScript action to initiate
; the end-game outro sequence.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     EndGame_MovePlayerTowardKing
;     MMC1_UpdateROMBank
;     Fog_OnTick
;     GameLoop_CheckShowPlayerMenu
;     GameLoop_CheckUseCurrentItem
;     GameLoop_CountdownItems
;     GameLoop_RunScreenEventHandlers
;     Screen_ResetSpritesForGamePlay
;     Player_CastMagic
;     Player_DrawBody
;     Player_DrawShield
;     Player_DrawWeapon
;     Sprites_UpdateAll
;     WaitForNextFrame
;
; XREFS:
;     EndGame_BeginKingsRoomSequence
;     EndGame_MainLoop
;============================================================================
EndGame_MainLoop:                           ; [$dbef]
    LDX #$ff                                ; X = 0xFF (unused -- noop)


    ;
    ; Switch to bank 14.
    ;
    LDX #$0e
    JSR MMC1_UpdateROMBank                  ; Set bank to 14 (Logic).


    ;
    ; Wait for a frame and prepare for renders.
    ;
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Screen_ResetSpritesForGamePlay


    ;
    ; Move the player a step/jump toward the King, or begin
    ; interaction, depending on position.
    ;
    JSR EndGame_MovePlayerTowardKing        ; Simulate the player's button
                                            ; press.
    JSR GameLoop_UpdatePlayer               ; Update the player's
                                            ; position/state.


    ;
    ; Perform all the standard mainloop operations.
    ;
    JSR Player_DrawShield                   ; Draw the shield.
    JSR Player_DrawBody                     ; Draw the armor.
    JSR Player_DrawWeapon                   ; Draw the weapon.
    JSR Player_CastMagic                    ; No-op
    JSR GameLoop_CheckUseCurrentItem        ; No-op
    JSR Sprites_UpdateAll                   ; Update sprites.
    JSR GameLoop_CountdownItems             ; No-op
    JSR Fog_OnTick                          ; No-op
    JSR GameLoop_CheckShowPlayerMenu        ; No-op
    JSR GameLoop_RunScreenEventHandlers     ; No-op
    JMP EndGame_MainLoop                    ; Loop.


;============================================================================
; Move the player toward the King in the end-game.
;
; This will move the player by simulating holding down the
; Left joypad button, pressing the A button when at the
; stairs, and pressing Up when at the King.
;
; This is all done by factoring in the current player position:
;
; 1. Press Left until at X=79.
;
; 2. At X=79, keep pressing Jump and left.
;
; 3. At X=68, release and press Up.
;
; INPUTS:
;     Player_PosX_Block:
;         The current player X position.
;
; OUTPUTS:
;     Joy1_ButtonMask:
;     Joy1_ChangedButtonMask:
;         The simulated button presses.
;
; XREFS:
;     EndGame_MainLoop
;============================================================================
EndGame_MovePlayerTowardKing:               ; [$dc23]
    LDA Player_PosX_Block                   ; A = player X.
    CMP #$61                                ; Is it >= 97?
    BCS @_setButtonsLeft                    ; If so, jump to just press Left.
    CMP #$50                                ; Is it >= 80?
    BCS @_setJumpLeft                       ; If so, jump to press Left+A.
    CMP #$44                                ; Is it >= 68?
    BCS @_setButtonsLeft                    ; If so, jump to press Left.


    ;
    ; Simulate pressing Up to engage with the King.
    ;
    LDA #$08                                ; 0x08 == Up button bitmask.
    STA Joy1_ButtonMask                     ; Set as the current button mask.
    STA Joy1_ChangedButtonMask              ; Set as the changed button mask.
    RTS


    ;
    ; Simulate pressing Left.
    ;
  @_setButtonsLeft:                         ; [$dc38]
    LDA #$02                                ; 0x02 == Left button bitmask.
    STA Joy1_ButtonMask                     ; Set as the current button mask.
    STA Joy1_ChangedButtonMask              ; Set as the changed button mask.
    RTS


    ;
    ; Simulate pressing Left+A to jump left.
    ;
  @_setJumpLeft:                            ; [$dc3f]
    LDA #$82                                ; 0x82 == Left + A button
                                            ; bitmask.
    STA Joy1_ButtonMask                     ; Set as the current button mask.
    STA Joy1_ChangedButtonMask              ; Set as the changed button mask.

    ;
    ; XREFS:
    ;     Game_DrawScreenInFrozenState
    ;
RETURN_DC45:                                ; [$dc45]
    RTS


;============================================================================
; Draw the player and sprites in a frozen state.
;
; This is used when needing to draw sprites without anything
; moving around or interacting with each other.
;
; It's invoked when writing messages, filling HP/MP, or in
; the end-game sequence.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
;     Screen_ReadyState:
;         The loaded state for the sprites.
;
;         If 0xFF, this function will immediately return.
;
;     Player_StatusFlag:
;         The player's current status flag.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Player_DrawBody
;     Player_DrawShield
;     Player_DrawWeapon
;     Sprites_UpdateAll
;     MMC1_UpdateROMBank
;     MMC1_UpdatePRGBankToStackA
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     EndGame_Begin
;     Player_FillHPAndMP
;     Player_UseRedPotion
;============================================================================
Game_DrawScreenInFrozenState:               ; [$dc46]
    LDA Screen_ReadyState                   ; Load the loaded state.
    CMP #$ff                                ; Is it 0xFF?
    BEQ RETURN_DC45                         ; If so, then return.


    ;
    ; Switch to bank 14.
    ;
    LDA a:CurrentROMBank                    ; Load the current bank.
    PHA                                     ; Push to the stack.
    LDX #$0e
    JSR MMC1_UpdateROMBank                  ; Switch to bank 14.


    ;
    ; Temporarily clear Wing Boots state.
    ;
    LDA Player_StatusFlag                   ; Load the player's status flag.
    PHA                                     ; Push to the stack so it can be
                                            ; restored later.
    AND #$7f                                ; Keep all but the Wing Boots
                                            ; flag.
    STA Player_StatusFlag                   ; Store it.


    ;
    ; Draw the player.
    ;
    JSR Player_DrawShield                   ; Draw the shield.
    JSR Player_DrawBody                     ; Draw the armor.
    JSR Player_DrawWeapon                   ; Draw the weapon.


    ;
    ; Restore the player's status flags.
    ;
    PLA                                     ; Pop the status flag.
    STA Player_StatusFlag                   ; Store it.


    ;
    ; Draw all the sprites, but with sprites paused.
    ;
    ; This flag will will disable all behavioral updates for
    ; sprites.
    ;
    LDA #$01                                ; A = 1
    STA a:Sprites_UpdatesPaused             ; Set as the paused state for
                                            ; sprites.
    JSR Sprites_UpdateAllStates             ; Update all sprites.
    LDA #$00                                ; A = 0
    STA a:Sprites_UpdatesPaused             ; Clear the paused state.
    JMP MMC1_UpdatePRGBankToStackA          ; Restore the previous bank.
;============================================================================
; TODO: Document Game_LoadAreaTable
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
Game_LoadAreaTable:                         ; [$dc78]
    ;
    ; XXX Set the address for the area in the areas table.
    ;
    ASL A
    TAY
    LDA ROMBankStart,Y
    STA Area_ScreenBlocksOffset
    LDA ROMBankStart+1,Y
    CLC
    ADC #$80
    STA Area_ScreenBlocksOffset_U


    ;
    ; Save the current ROM bank and switch to bank 3, where the
    ; areas table lives.
    ;
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    LDA a:ROMBankStart


    ;
    ; Set the start of the area's pointer table in
    ; 0x{@address 007C}.
    ;
    ; This will be AREAS_TABLE_PTR in Bank 3.
    ;
    STA Temp_Addr_L
    LDA a:AREAS_TABLE_PTR+1
    CLC
    ADC #$80
    STA Temp_Addr_U
    LDA Area_CurrentArea
    ASL A
    TAY
    LDA (Temp_Addr_L),Y
    STA CurrentArea_TableAddr
    INY
    LDA (Temp_Addr_L),Y
    CLC
    ADC #$80
    STA CurrentArea_TableAddr_U
    LDY #$00
    LDA (CurrentArea_TableAddr),Y
    STA Temp_Addr_L
    INY
    LDA (CurrentArea_TableAddr),Y
    CLC
    ADC #$80
    STA Temp_Addr_U


    ;
    ; Store the addresses of the block attributes and 4 groups of
    ; block data in addresses {@address 007E}.
    ;
    LDY #$00
    LDX #$05

  @LAB_PRG15_MIRROR__dcbf:                  ; [$dcbf]
    LDA (Temp_Addr_L),Y
    STA CurrentArea_BlockAttributesAddr,Y
    INY
    LDA (Temp_Addr_L),Y
    CLC
    ADC #$80
    STA CurrentArea_BlockAttributesAddr,Y
    INY
    DEX
    BNE @LAB_PRG15_MIRROR__dcbf
    LDY #$02


    ;
    ; Load the block properties, scrolling data, door locations,
    ; and door destinations addresses.
    ;
    LDA (CurrentArea_TableAddr),Y
    STA CurrentArea_BlockPropertiesAddr
    INY
    LDA (CurrentArea_TableAddr),Y
    CLC
    ADC #$80
    STA CurrentArea_BlockPropertiesAddr_U
    LDY #$04
    LDA (CurrentArea_TableAddr),Y
    STA CurrentArea_ScrollingDataAddr
    INY
    LDA (CurrentArea_TableAddr),Y
    CLC
    ADC #$80
    STA ScrollingData_U
    LDY #$06
    LDA (CurrentArea_TableAddr),Y
    STA CurrentArea_DoorLocationsAddr
    INY
    LDA (CurrentArea_TableAddr),Y
    CLC
    ADC #$80
    STA CurrentArea_DoorLocationsAddr_U
    LDY #$08
    LDA (CurrentArea_TableAddr),Y
    STA CurrentArea_DoorDestinationsAddr
    INY
    LDA (CurrentArea_TableAddr),Y
    CLC
    ADC #$80
    STA CurrentArea_DoorDestinationsAddr_U


    ;
    ; Switch back to the previous bank.
    ;
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    RTS


;============================================================================
; Update the scroll state during a mainloop iteration.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Screen_UpdateForScroll
;
; XREFS:
;     Game_MainLoop
;============================================================================
Game_UpdateForScroll:                       ; [$dd0f]
    JSR Screen_UpdateForScroll
    RTS


;============================================================================
; Set up state for a new screen.
;
; This is called when loading a new screen or entering a
; building. It's responsible for the following:
;
; * Setting the player sprite position and drawing it.
; * Loading common sprites.
; * Setting area/screen state (palette, positions,
;   scrolling).
; * Drawing the HUD.
;
; INPUTS:
;     Area_LoadingScreenIndex:
;         The screen index being loaded in the area.
;
;     Screen_DestPaletteOrIndex:
;         The screen palette being loaded.
;
;     Screen_StartPosYX:
;         The starting position for the player.
;
; OUTPUTS:
;     Area_CurrentScreen:
;         The loaded screen index.
;
;     Player_Something_ScrollPosY:
;         The player's Y scroll position, set to 0.
;
;     Player_PosX_Block:
;     Player_PosY:
;         The starting position for the player on the
;         screen, based on Screen_StartPosYX.
;
;     PPU_ScrollScreenHoriz:
;     PPU_ScrollScreenVert:
;         The scroll screen, set to 0.
;
;     Screen_PaletteIndex:
;         The loaded palette.
;
;     Screen_Maybe_ScrollXCounter:
;         The horizontal scroll counter, set to 0.
;
; CALLS:
;     Area_ScrollScreenRight
;     Player_DrawSpriteImmediately
;     Screen_LoadUIPalette
;     Sprites_LoadCommon
;     UI_DrawHUDSprites
;     UI_SetHUDPPUAttributes
;
; XREFS:
;     Game_EnterBuilding
;     Screen_Load
;============================================================================
Screen_SetupNew:                            ; [$dd13]
    JSR Player_DrawSpriteImmediately        ; Draw the player sprite.
    JSR Sprites_LoadCommon
    LDA Area_LoadingScreenIndex
    STA Area_CurrentScreen
    JSR Area_ScrollScreenRight
    JSR UI_DrawHUDSprites
    LDA Screen_DestPaletteOrIndex
    STA a:Screen_PaletteIndex
    JSR Screen_LoadUIPalette
    LDA #$00
    STA PPU_ScrollScreenHoriz
    STA PPU_ScrollScreenVert
    STA Screen_Maybe_ScrollXCounter
    STA Player_Something_ScrollPosY
    LDA Screen_StartPosYX
    AND #$f0
    STA Player_PosY
    LDA Screen_StartPosYX
    ASL A
    ASL A
    ASL A
    ASL A
    STA Player_PosX_Block
    JMP UI_SetHUDPPUAttributes


;============================================================================
; Load the current screen.
;
; This will set up the palette, reset sprites, load
; metadata for the screen (sprites, values, and special
; events), and prepare for rendering.
;
; INPUTS:
;     Screen_ReadyState:
;         The current loaded state.
;
; OUTPUTS:
;     Screen_ReadyState:
;         The new loaded state (0).
;
; CALLS:
;     Screen_SetupNew
;     Screen_ClearSprites
;     Screen_LoadSpriteInfo
;     Screen_LoadSpritePalette
;     PPUBuffer_WritePalette
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SetupEnterScreen
;============================================================================
Screen_Load:                                ; [$dd46]
    JSR Screen_SetupNew                     ; Draw the HUD and prepare setup
                                            ; for the screen.
    LDA #$00
    JSR Screen_LoadSpritePalette            ; Load the palette.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Set up sprites and palette for the screen.
;
; This will clear out the existing sprites and then load
; in new ones.
;
; After load, the screen will be set as ready and the
; palette written.
;
; INPUTS:
;     Screen_ReadyState:
;         The screen's current ready state.
;
; OUTPUTS:
;     Screen_ReadyState:
;         The new state, set to ready.
;
; CALLS:
;     Screen_ClearSprites
;     Screen_LoadSpriteInfo
;     PPUBuffer_WritePalette
;
; XREFS:
;     Game_EnterBuilding
;============================================================================
Screen_SetupSprites:                        ; [$dd4e]
    ;
    ; Clear all the sprite data for the screen and load in
    ; new sprites.
    ;
    ; Note that this code checks Screen_ReadyState
    ; and only loads if it's not 1, but in the shipped game the
    ; only values are 0 and 0xFF, so the path always runs.
    ;
    JSR Screen_ClearSprites                 ; Clear current sprite data.
    LDA Screen_ReadyState                   ; Get the screen state.
    CMP #$01                                ; Is it 1? (DEADCODE: It never
                                            ; will be).
    BEQ @_setReady                          ; If not, skip loading sprites.


    ;
    ; Load sprite information. Despite the conditional, this
    ; will always execute, since the screen state is never 1
    ; in the shipped again.
    ;
    JSR Screen_LoadSpriteInfo               ; Load information for the
                                            ; screen.


    ;
    ; Mark the screen as ready, and write the palette.
    ;
  @_setReady:                               ; [$dd5a]
    LDA #$00
    STA Screen_ReadyState                   ; Set the state to ready.
    JMP PPUBuffer_WritePalette              ; Write the palette to the PPU
                                            ; buffer.


;============================================================================
; Spawn the player in a temple.
;
; This is called when starting up a new life for the player.
; The player will be spawned in a temple, placed in the
; specified area and screen, using the correct palette and
; player positions.
;
; INPUTS:
;     TempleSpawnPoint:
;         The index of the template in which the player will
;         be spawned.
;
; OUTPUTS:
;     Area_CurrentScreen:
;         The starting screen outside the template.
;
;     Area_Region:
;         The area in which the player will be placed outside
;         the template.
;
;     Player_PosX_Block:
;         The X position the player will be in outside the
;         temple.
;
;     Player_PosY:
;         The Y position the player will be in outside the
;         temple.
;
;     Area_DestScreen:
;         TODO
;
;     Area_CurrentArea:
;         TODO
;
;     Screen_PaletteIndex:
;         TODO: The index of the palette outside the temple?
;
;     Area_Music_Outside:
;         The music to play outside the temple.
;
;     Screen_DestPaletteOrIndex:
;         The palette inside the temple.
;
;     Building_TilesIndex:
;         Index for the building tiles.
;
;     Screen_StartPosYX:
;         The start position inside the temple.
;
;     Areas_DefaultMusic:
;         The music to play inside the temple.
;
;     Area_LoadingScreenIndex:
;         TODO
;
;     Player_Flags:
;         The new player flags (set to face left inside
;         the temple).
;
; XREFS:
;     Player_Spawn
;============================================================================
Game_SpawnInTemple:                         ; [$dd61]
    ;
    ; Set the starting area/screen/position information outside the
    ; temple.
    ;
    LDX a:TempleSpawnPoint                  ; X = index of the temple spawn
                                            ; point.
    LDA START_SCREEN_FOR_TEMPLE_SPAWN,X     ; Set the current screen for
                                            ; outside the temple.
    STA Area_CurrentScreen
    LDA START_MAYBE_NEXT_AREA_FOR_TEMPLE_SPAWN,X
    STA a:Area_Region
    LDA START_PLAYERPOSX_FULL_FOR_TEMPLE_SPAWN,X
    STA Player_PosX_Block
    LDA MAYBE_START_PLAYERPOSY_FOR_TEMPLE_SPAWN,X
    STA Player_PosY
    LDA DEST_SCREEN_FOR_TEMPLE_SPAWN,X
    STA a:Area_DestScreen
    LDY CURRENT_REGION_FOR_TEMPLE_SPAWN,X
    STY Area_CurrentArea
    LDA AREA_PALETTE_INDEXES,Y
    STA a:Screen_PaletteIndex
    LDA AREA_TO_MUSIC_TABLE,Y
    STA a:Area_Music_Outside
    LDA #$12
    STA Screen_DestPaletteOrIndex
    LDA #$06
    STA a:Building_TilesIndex
    LDA #$9e
    STA Screen_StartPosYX
    LDA #$0e
    STA a:Areas_DefaultMusic
    LDA #$01
    STA Area_LoadingScreenIndex


    ;
    ; Set the player to face left inside the temple.
    ;
    LDA Player_Flags
    AND #$bf
    STA Player_Flags
    RTS


;============================================================================
; A mapping of Temple spawn positions to regions.
;
; XREFS:
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_SpawnInTemple
;
CURRENT_REGION_FOR_TEMPLE_SPAWN:            ; [$ddad]
    .byte REGION_EOLIS                      ; [0]: First town
    .byte REGION_BRANCH                     ; [1]: Apolune
    .byte REGION_BRANCH                     ; [2]: Forepaw
    .byte REGION_MIST                       ; [3]: Fog
    .byte REGION_BRANCH                     ; [4]: Victim
    .byte REGION_BRANCH                     ; [5]: Conflate
    .byte REGION_BRANCH                     ; [6]: Daybreak
    .byte REGION_BRANCH                     ; [7]: Final town


;============================================================================
; A mapping of Temple spawn positions to outside X positions.
;
; XREFS:
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_SpawnInTemple
;
START_PLAYERPOSX_FULL_FOR_TEMPLE_SPAWN:     ; [$ddb5]
    .byte $50                               ; [0]: First town
    .byte $50                               ; [1]: Apolune
    .byte $30                               ; [2]: Forepaw
    .byte $90                               ; [3]: Fog
    .byte $30                               ; [4]: Victim
    .byte $90                               ; [5]: Conflate
    .byte $60                               ; [6]: Daybreak
    .byte $30                               ; [7]: Final town


;============================================================================
; A mapping of Temple spawn positions to outside Y positions.
;
; XREFS:
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_SpawnInTemple
;
MAYBE_START_PLAYERPOSY_FOR_TEMPLE_SPAWN:    ; [$ddbd]
    .byte $90                               ; [0]: First town
    .byte $90                               ; [1]: Apolune
    .byte $90                               ; [2]: Forepaw
    .byte $80                               ; [3]: Fog
    .byte $90                               ; [4]: Victim
    .byte $90                               ; [5]: Conflate
    .byte $90                               ; [6]: Daybreak
    .byte $90                               ; [7]: Final town


;============================================================================
; TODO: A mapping of Temple spawn positions to <TODO>.
;
; XREFS:
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_SpawnInTemple
;
DEST_SCREEN_FOR_TEMPLE_SPAWN:               ; [$ddc5]
    .byte $02                               ; [0]: First town
    .byte $0b                               ; [1]: Apolune
    .byte $10                               ; [2]: Forepaw
    .byte $1e                               ; [3]: Fog
    .byte $23                               ; [4]: Victim
    .byte $2b                               ; [5]: Conflate
    .byte $33                               ; [6]: Daybreak
    .byte $3c                               ; [7]: Final town


;============================================================================
; A mapping of Temple spawn positions to next areas.
;
; XREFS:
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_SpawnInTemple
;
START_MAYBE_NEXT_AREA_FOR_TEMPLE_SPAWN:     ; [$ddcd]
    .byte REGION_EOLIS                      ; [0]: First town
    .byte REGION_TRUNK                      ; [1]: Apolune
    .byte REGION_TRUNK                      ; [2]: Forepaw
    .byte REGION_MIST                       ; [3]: Fog
    .byte REGION_MIST                       ; [4]: Victim
    .byte REGION_BRANCH                     ; [5]: Conflate
    .byte REGION_BRANCH                     ; [6]: Daybreak
    .byte REGION_DARTMOOR                   ; [7]: Final town


;============================================================================
; A mapping of Temple spawn positions to start screens.
;
; XREFS:
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_SpawnInTemple
;
START_SCREEN_FOR_TEMPLE_SPAWN:              ; [$ddd5]
    .byte $02                               ; [0]: First town
    .byte $01                               ; [1]: Apolune
    .byte $03                               ; [2]: Forepaw
    .byte $06                               ; [3]: Fog
    .byte $06                               ; [4]: Victim
    .byte $08                               ; [5]: Conflate
    .byte $0b                               ; [6]: Daybreak
    .byte $0c                               ; [7]: Final town


;============================================================================
; Move the player to the King's Room for the end-game.
;
; This sets the state to load the King's Room and places
; the player in the correct place. The Temple music will
; be played while in the room.
;
; INPUTS:
;     Player_Flags:
;         The player's flags.
;
; OUTPUTS:
;     Areas_DefaultMusic:
;         The music to play for the area (Temple music).
;
;     Area_CurrentScreen:
;     Area_DestScreen:
;         The screen to load (68).
;
;     Area_LoadingScreenIndex:
;         The new loading screen index.
;
;     Screen_DestPaletteOrIndex:
;         The palette for the room.
;
;     Area_Region:
;         The updated region (Eolis).
;
;     Screen_StartPosYX:
;         The starting X/Y position (X=13, Y=9).
;
;     Player_Flags:
;         The updated player's flags.
;
;     Building_TilesIndex:
;         The tiles for the room.
;
; CALLS:
;     Game_SetupEnterBuilding
;
; XREFS:
;     EndGame_BeginKingsRoomSequence
;============================================================================
EndGame_MoveToKingsRoom:                    ; [$dddd]
    ;
    ; Move the player back to Eolis.
    ;
    LDA #$00
    STA Area_LoadingScreenIndex             ; Set the screen index to 0.
    STA a:Area_Region                       ; Set the region to Eolis.


    ;
    ; Play the Temple music.
    ;
    LDA #$0d
    STA a:Areas_DefaultMusic                ; Play the Temple music.


    ;
    ; Move the player to the right of the room.
    ;
    LDA #$9d
    STA Screen_StartPosYX                   ; Set the start position to X=13,
                                            ; Y=9.


    ;
    ; Load the palette for the King's room.
    ;
    LDA #$11
    STA Screen_DestPaletteOrIndex           ; Set the Palette for the King's
                                            ; room.


    ;
    ; Set the King's Room screen.
    ;
    LDA #$44
    STA Area_CurrentScreen                  ; Set the screen to 68.
    STA a:Area_DestScreen
    LDA #$06
    STA a:Building_TilesIndex               ; Set the tiles to 6.


    ;
    ; Face the player to the left.
    ;
    LDA Player_Flags                        ; Load the player flags.
    AND #$bf                                ; Set to facing left.
    STA Player_Flags                        ; Store it.
    JMP Game_SetupEnterBuilding             ; Trigger the Enter Building
                                            ; logic.
;============================================================================
; TODO: Document Game_EnterBuilding
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_SetupEnterBuilding
;============================================================================
Game_EnterBuilding:                         ; [$de06]
    ;
    ; Unset the player's current weapon. Players can't attack in
    ; buildings.
    ;
    LDA #$ff
    STA a:Player_CurWeapon                  ; Clear the weapon.


    ;
    ; Set the music for this area.
    ;
    LDA a:Areas_DefaultMusic                ; Load the default music for the
                                            ; area.
    STA Music_Current                       ; Set as the current music.


    ;
    ; Push a buch of state to return to when exiting the door.
    ;
    LDA Area_CurrentArea                    ; Load the current area.
    STA a:Area_SavedArea                    ; Save it for when exiting the
                                            ; building.
    LDA Area_CurrentScreen                  ; Load the current screen in the
                                            ; area.
    STA a:Area_SavedScreen                  ; Save it.
    LDA a:Screen_PaletteIndex               ; Load the current palette.
    STA a:Screen_SavedPalette               ; Save it.


    ;
    ; Save the player's X/Y position (rounded to the nearest
    ; block).
    ;
    LDA Player_PosY                         ; Load the player's Y position.
    AND #$f0                                ; Normalize to a block offset.
    STA a:Player_SavedPosXY                 ; Save it.
    LDA Player_PosX_Block                   ; Load the player's block X
                                            ; position.
    AND #$f0                                ; Normalize it to a block offset.
    LSR A                                   ; Shift to the lower byte.
    LSR A
    LSR A
    LSR A
    ORA a:Player_SavedPosXY                 ; Combine it with the saved X/Y
                                            ; position.
    STA a:Player_SavedPosXY                 ; And save it.


    ;
    ; Set the new area to enter and load it.
    ;
    LDX #$04
    STX Area_CurrentArea                    ; Set the current area to 4
                                            ; (inside buildings)
    LDA AREA_TO_SCREEN_DATA_BANKS,X         ; Load the bank for this area.
    STA CurrentArea_ROMBank                 ; Store as the current area ROM
                                            ; bank.
    LDX CurrentArea_ROMBank
    JSR MMC1_SaveROMBankAndUpdateTo         ; Push the current bank and
                                            ; switch to the new one.
    LDX Area_CurrentArea                    ; Load the current area again.
    LDA AREA_TO_BANK_OFFSET,X               ; Get the index into the screen
                                            ; data table in this bank.
    JSR Game_LoadAreaTable                  ; Load the area table for the
                                            ; screen.
    JSR MMC1_RestorePrevROMBank             ; Restore the previous bank.


    ;
    ; Set the index into the tiles for this area and load them.
    ;
    LDA a:Building_TilesIndex
    STA Area_TilesIndex
    JSR Area_LoadTiles


    ;
    ; Load the palette.
    ;
    LDA #$01
    JSR Screen_LoadSpritePalette


    ;
    ; Set up the screen and the sprites.
    ;
    JSR Screen_SetupNew
    LDA a:Area_DestScreen
    STA Area_CurrentScreen
    JMP Screen_SetupSprites

;============================================================================
; TODO: Document Game_ExitBuilding
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_SetupExitBuilding
;============================================================================
Game_ExitBuilding:                          ; [$de66]
    LDA a:SelectedWeapon
    STA a:Player_CurWeapon
    LDA a:Areas_DefaultMusic
    STA Music_Current
    LDX a:Area_SavedArea
    STX Area_CurrentArea
    LDA AREA_TO_SCREEN_DATA_BANKS,X
    STA CurrentArea_ROMBank
    LDX CurrentArea_ROMBank
    JSR MMC1_SaveROMBankAndUpdateTo
    LDX Area_CurrentArea
    LDA AREA_TO_BANK_OFFSET,X
    JSR Game_LoadAreaTable
    JSR MMC1_RestorePrevROMBank
    LDX Area_CurrentArea
    LDA CURRENT_AREA_TO_TILES_INDEX_TABLE,X
    STA Area_TilesIndex
    JSR Area_LoadTiles
    LDA a:Area_SavedScreen
    STA Area_LoadingScreenIndex
    LDA a:Screen_SavedPalette
    STA Screen_DestPaletteOrIndex
    LDA a:Player_SavedPosXY
    STA Screen_StartPosYX
    JMP Screen_Load


;============================================================================
; Load the very first level.
;
; This will load the gates to Eolis, loading in all the
; area data, screen, tile data, and music.
;
; It also takes care of setting the player's initial HP.
;
; INPUTS:
;     AREA_TO_SCREEN_DATA_BANKS:
;         Mapping of areas to PRG ROM banks.
;
;     AREA_TO_BANK_OFFSET:
;         Mapping of areas to sprite banks.
;
;     CURRENT_AREA_TO_TILES_INDEX_TABLE:
;         Mapping of areas to tile indexes.
;
;     AREA_TO_MUSIC_TABLE:
;         Mapping of areas to music.
;
; OUTPUTS:
;     Area_CurrentArea:
;         The current area (Eolis).
;
;     Area_CurrentScreen:
;         The current screen.
;
;     Screen_DestPaletteOrIndex:
;         The palette for the area.
;
;     Area_LoadingScreenIndex:
;         The current screen index.
;
;     Screen_StartPosYX:
;         The starting X/Y position.
;
;     Areas_DefaultMusic:
;         The default music for the area.
;
;     CurrentROMBank:
;         The starting ROM bank.
;
;     Music_Current:
;         The current music to play.
;
;     Player_HP_U:
;         The player's starting HP (16).
;
;     Area_TilesIndex:
;         The tiles index for the area.
;
; CALLS:
;     Area_LoadTiles
;     Screen_Load
;     MMC1_RestorePrevROMBank
;     MMC1_SaveROMBankAndUpdateTo
;     Screen_LoadSpritePalette
;     Player_SetInitialState
;
; XREFS:
;     Game_Start
;============================================================================
Game_LoadFirstLevel:                        ; [$dea7]
    LDA #$00                                ; A = 0


    ;
    ; Set this as the current town.
    ;
    STA Area_CurrentArea                    ; Set the current area to 0
                                            ; (Eolis).


    ;
    ; Set the initial state of the player, and hard-code their
    ; health to the starting amount of 16HP.
    ;
    JSR Player_SetInitialState              ; Set the initial player state.
    LDA #$10
    STA a:Player_HP_U                       ; Set the HP to 16.
    LDX Area_CurrentArea                    ; X = Current area


    ;
    ; Load the block properties for this area.
    ;
    ; The bank containing the properties for the area will
    ; be loaded temporarily while fetching the block properties.
    ;
    LDA AREA_TO_SCREEN_DATA_BANKS,X         ; A = PRG bank for the area.
    STA CurrentArea_ROMBank                 ; Store as the current bank.
    LDX CurrentArea_ROMBank                 ; X = current bank.
    JSR MMC1_SaveROMBankAndUpdateTo         ; Push the current bank and
                                            ; update to this area's bank.


    ;
    ; Load the area information.
    ;
    ; NOTE: There's a bug here. This *should* be passing in the
    ;       area index, but it's mistakenly passing in the resulting
    ;       ROM bank. In the shipped game, this is 0 in both cases,
    ;       but it means that any shuffling around of banks will do
    ;       the wrong thing if not starting with area 0, bank 0.
    ;
    LDA AREA_TO_BANK_OFFSET,X               ; A = sprite bank for the area.
    JSR Game_LoadAreaTable                  ; Load the area information.
    JSR MMC1_RestorePrevROMBank             ; Restore the previous bank.


    ;
    ; Start on the current screen.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA #$00
    STA Area_CurrentScreen                  ; Current screen = 0
    STA Area_LoadingScreenIndex             ; Screen index = 0


    ;
    ; Load the tiles and images for the area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA CURRENT_AREA_TO_TILES_INDEX_TABLE,X ; A = tiles index.
    STA Area_TilesIndex                     ; Store that.
    JSR Area_LoadTiles                      ; Load the tileset pages for that
                                            ; index.


    ;
    ; Load the palette for the area.
    ;
    LDA #$00
    JSR Screen_LoadSpritePalette            ; Load the palette for that
                                            ; index.
    LDX Area_CurrentArea                    ; X = current area.
    LDA AREA_PALETTE_INDEXES,X              ; Load the palette.
    STA Screen_DestPaletteOrIndex           ; And store it as the current one
                                            ; for the area.


    ;
    ; Load the music for this area.
    ;
    LDA AREA_TO_MUSIC_TABLE,X               ; Load the music for the area.
    STA Music_Current                       ; And store it as the current
                                            ; music.
    STA a:Areas_DefaultMusic                ; And as the default for the
                                            ; area.


    ;
    ; Set the start X/Y position for the player as X=1, Y=9.
    ;
    LDA #$91
    STA Screen_StartPosYX                   ; Set start position.
    JMP Screen_Load                         ; Load this screen.


;============================================================================
; Load the information on the current area.
;
; This will load the area data, tile data, palette, and
; music.
;
; INPUTS:
;     AREA_TO_SCREEN_DATA_BANKS:
;         Mapping of areas to PRG ROM banks.
;
;     AREA_TO_BANK_OFFSET:
;         Mapping of areas to sprite banks.
;
;     CURRENT_AREA_TO_TILES_INDEX_TABLE:
;         Mapping of areas to tile indexes.
;
;     AREA_TO_MUSIC_TABLE:
;         Mapping of areas to music.
;
; OUTPUTS:
;     Area_CurrentScreen:
;         The current screen.
;
;     Screen_DestPaletteOrIndex:
;         The palette for the area.
;
;     Areas_DefaultMusic:
;         The default music for the area.
;
;     CurrentROMBank:
;         The starting ROM bank.
;
;     Music_Current:
;         The current music to play.
;
;     Area_TilesIndex:
;         The tiles index for the area.
;
; CALLS:
;     Area_LoadTiles
;     Screen_Load
;     MMC1_RestorePrevROMBank
;     MMC1_SaveROMBankAndUpdateTo
;     Screen_LoadSpritePalette
;     Player_SetInitialState
;
; XREFS:
;     Game_SetupAndLoadOutsideArea
;============================================================================
Game_LoadCurrentArea:                       ; [$def5]
    JSR Player_SetInitialState              ; Set the initial player state.


    ;
    ; Load the bank for this area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA AREA_TO_SCREEN_DATA_BANKS,X         ; Load the ROM bank for the area.
    STA CurrentArea_ROMBank                 ; Store that as the current bank.
    LDX CurrentArea_ROMBank                 ; X = current bank.
    JSR MMC1_SaveROMBankAndUpdateTo         ; Save the current bank and
                                            ; switch to it.


    ;
    ; Load the bank for the sprites for this area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA AREA_TO_BANK_OFFSET,X               ; A = bank for the sprites.


    ;
    ; Load information on the area.
    ;
    JSR Game_LoadAreaTable                  ; Load the table of information
                                            ; on this area.
    JSR MMC1_RestorePrevROMBank             ; Restore to the previous bank.
    LDA Area_LoadingScreenIndex             ; A = current screen index.
    STA Area_CurrentScreen                  ; Store as the current screen.


    ;
    ; Load the tiles for the area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA CURRENT_AREA_TO_TILES_INDEX_TABLE,X ; A = tiles index for the area.
    STA Area_TilesIndex                     ; Store as the current tiles
                                            ; index.
    JSR Area_LoadTiles                      ; Load all tileset images for
                                            ; that index.


    ;
    ; Load the palette for the area.
    ;
    LDA #$00
    JSR Screen_LoadSpritePalette            ; Load palette 0.
    LDX Area_CurrentArea                    ; X = current area.
    LDA AREA_PALETTE_INDEXES,X              ; Load the palette for the area.
    STA Screen_DestPaletteOrIndex           ; Store as the current palette.


    ;
    ; Load the music for the area.
    ;
    LDA AREA_TO_MUSIC_TABLE,X               ; Load the music for the area.
    STA Music_Current                       ; Set as the current music.
    STA a:Areas_DefaultMusic                ; Store as the default.
    JMP Screen_Load                         ; Load this screen.


;============================================================================
; A mapping of areas to the ROM banks containing block/area data.
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================

;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
AREA_TO_SCREEN_DATA_BANKS:                  ; [$df34]
    .byte BANK_0_AREA_DATA                  ; [0]: Eolis
    .byte BANK_1_AREA_DATA                  ; [1]: Trunk
    .byte BANK_0_AREA_DATA                  ; [2]: Mist
    .byte BANK_0_AREA_DATA                  ; [3]: Towns

;
; XREFS:
;     Game_EnterBuilding
;
AREA_TO_SCREEN_DATA_BANKS_4_:               ; [$df38]
    .byte BANK_2_AREA_DATA                  ; [4]: Buildings
    .byte BANK_1_AREA_DATA                  ; [5]: Branch
    .byte BANK_2_AREA_DATA                  ; [6]: Dartmoor
    .byte BANK_2_AREA_DATA                  ; [7]: Zenis


;============================================================================
; A mapping of areas to the starting pointer offsets within the ROM banks
; above.
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================

;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
AREA_TO_BANK_OFFSET:                        ; [$df3c]
    .byte $00                               ; [0]: Eolis
    .byte $00                               ; [1]: Trunk
    .byte $01                               ; [2]: Mist
    .byte $02                               ; [3]: Towns

;
; XREFS:
;     Game_EnterBuilding
;
AREA_TO_BANK_OFFSET_4_:                     ; [$df40]
    .byte $01                               ; [4]: Buildings
    .byte $01                               ; [5]: Branch
    .byte $00                               ; [6]: Dartmoor
    .byte $02                               ; [7]: Zenis


;============================================================================
; Pointers into 0xCF07 addressed by chunk ID
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================

;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
CURRENT_AREA_TO_TILES_INDEX_TABLE:          ; [$df44]
    .byte $00                               ; [0]: Eolis
    .byte $02                               ; [1]: First town
    .byte $03                               ; [2]:
    .byte $05                               ; [3]:
    .byte $06                               ; [4]:
    .byte $01                               ; [5]:
    .byte $04                               ; [6]:
    .byte $04                               ; [7]: Final boss room


;============================================================================
; Mapping of areas to palette indexes.
;
; XREFS:
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;============================================================================

;
; XREFS:
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;
AREA_PALETTE_INDEXES:                       ; [$df4c]
    .byte PALETTE_EOLIS                     ; [0]: Eolis
    .byte PALETTE_OUTSIDE                   ; [1]:
    .byte PALETTE_MIST                      ; [2]:
    .byte PALETTE_TOWN                      ; [3]:
    .byte PALETTE_TOWN                      ; [4]:
    .byte PALETTE_BRANCH                    ; [5]:
    .byte PALETTE_DARTMOOR                  ; [6]:
    .byte PALETTE_EVIL_FORTRESS             ; [7]:
    .byte $00,$00,$00,$00,$00,$00,$00,$00   ; [$df54] undefined

;
; XREFS:
;     Game_EnterAreaHandler
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;
AREA_TO_MUSIC_TABLE:                        ; [$df5c]
    .byte MUSIC_EOLIS                       ; [0]: Eolis
    .byte MUSIC_APOLUNE                     ; [1]: Apolune
    .byte MUSIC_FOREPAW                     ; [2]: Forepaw
    .byte MUSIC_MASCON_VICTIM               ; [3]: Mascon
    .byte MUSIC_MASCON_VICTIM               ; [4]: Victim
    .byte MUSIC_CONFLATE                    ; [5]: Conflate
    .byte MUSIC_DAYBREAK                    ; [6]: Daybreak
    .byte MUSIC_EVIL_FORTRESS               ; [7]: Evil Fortress

;============================================================================
; TODO: Document Game_EnterAreaHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_SetupNewArea
;============================================================================
Game_EnterAreaHandler:                      ; [$df64]
    LDX Area_CurrentArea
    LDA AREA_TO_SCREEN_DATA_BANKS,X
    STA CurrentArea_ROMBank
    LDX CurrentArea_ROMBank
    JSR MMC1_SaveROMBankAndUpdateTo
    LDX Area_CurrentArea
    LDA AREA_TO_BANK_OFFSET,X
    JSR Game_LoadAreaTable
    JSR MMC1_RestorePrevROMBank
    LDA Area_LoadingScreenIndex
    STA Area_CurrentScreen
    LDX Area_CurrentArea
    LDA AREA_TO_MUSIC_TABLE,X
    STA Music_Current
    STA a:Areas_DefaultMusic
    LDA CURRENT_AREA_TO_TILES_INDEX_TABLE,X
    STA Area_TilesIndex
    JSR Area_LoadTiles
    LDA #$00
    JSR Screen_LoadSpritePalette
    JMP Screen_Load


;============================================================================
; Debug code to switch the current area region.
;
; This allows the player to control which part of the game
; they're in.
;
; By pressing Up on the second controller, the player will
; be moved up a region.
;
; By pressing Down, they player will be moved down a region.
;
; This isn't activated by default, but can be swapped in
; through the following Game Genie codes (overriding the
; ability to pause):
;
;     OPYISU
;     NIYIVU
;
; INPUTS:
;     Joy2_ButtonMask:
;         The second controller's button mask.
;
; OUTPUTS:
;     Area_Region:
;         The updated region.
;
;     Area_CurrentScreen:
;         Set to 0.
;
; CALLS:
;     Game_SetupAndLoadOutsideArea
;============================================================================
Debug_ChooseArea:                           ; [$df99]
    LDA Joy2_ButtonMask                     ; Load the player 2 controller
                                            ; buttons.
    AND #$0c                                ; Is Up or Down pressed?
    BEQ RETURN_DFDD                         ; If not, return.


    ;
    ; Figure out which region to switch to based on button press.
    ;
    AND #$04                                ; Is Down pressed?
    BNE @_nextArea                          ; If so, switch to the next area.


    ;
    ; Up was pressed. Go forward a region.
    ;
    INC a:Area_Region                       ; Increment the region.
    LDA a:Area_Region                       ; A = incremented region.
    CMP #$06                                ; Is it in bounds?
    BCC @_switchArea                        ; If so, switch to the area.
    LDA #$00                                ; Else...
    STA a:Area_Region                       ; Set the region to (Eolis).
    BEQ @_switchArea                        ; And switch to it.


    ;
    ; Down was pressed. Go back a region.
    ;
  @_nextArea:                               ; [$dfb4]
    DEC a:Area_Region                       ; Decrement the region.
    BPL @_switchArea                        ; If it's in bounds, switch to
                                            ; the previous area.
    LDA #$05                                ; Else, set the region to the
                                            ; final fortress.
    STA a:Area_Region                       ; Store as the new region.


    ;
    ; Set the current screen to 0 and load it.
    ;
  @_switchArea:                             ; [$dfbe]
    LDA #$00
    STA Area_CurrentScreen                  ; Set current screen to 0.
    JMP Game_SetupAndLoadOutsideArea        ; Load the area.


;============================================================================
; Update the fog state on tick.
;
; This will first check if the area supports fog (Forepaw
; area with the Mist palette).
;
; If fog is allowed, it will proceed to animate fog
; every odd tick and update fog state every even tick.
;
; INPUTS:
;     Area_CurrentArea:
;         The current area.
;
;     Screen_PaletteIndex:
;         The screen's palette.
;
;     Fog_StateIndex:
;         The current fog index.
;
;     Fog_TileIndex:
;         The current fog generator value.
;
; OUTPUTS:
;     Fog_StateIndex:
;         The updated fog index.
;
;     Fog_TileIndex:
;         The updated fog generator value.
;
; CALLS:
;     Fog_UpdateTiles
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
Fog_OnTick:                                 ; [$dfc5]
    LDA Area_CurrentArea                    ; Load the current area.
    CMP #$02                                ; Is it Forepaw?
    BNE RETURN_E011                         ; If not, return.
    LDA a:Screen_PaletteIndex               ; Load the current palette.
    CMP #$0a                                ; Is it Mist?
    BNE RETURN_E011                         ; If not, return.
    LDA Fog_StateIndex                      ; Load the fog index.
    LSR A                                   ; Is it an odd value?
    BCC Fog_UpdateTiles                     ; If so, jump to rotate tiles.


    ;
    ; Decrement the fog generator and check if it reached 0.
    ; If so, increment the fog index.
    ;
    DEC Fog_TileIndex                       ; Decrement the fog generator.
    BNE RETURN_E011                         ; If != 0, return.
    INC Fog_StateIndex                      ; Else, increment the fog index.

    ;
    ; XREFS:
    ;     Debug_ChooseArea
    ;
RETURN_DFDD:                                ; [$dfdd]
    RTS


;============================================================================
; Animate a fog tile and update fog generation state.
;
; This will take a fog tile represented by the current
; fog generation value and rotate each row of its contents
; one pixel to the right, wrapping around to the left.
;
; The fog generation value is then incremented by 2,
; wrapping around from 7 to 0. If it hits 0, the fog
; index is inremented and a new starting fog generation
; value is chosen based on that index.
;
; INPUTS:
;     Fog_TileIndex:
;         The current fog generator value.
;
;     Fog_StateIndex:
;         The current fog index value.
;
;     PPUBuffer_WriteOffset:
;         The current upper bounds of the PPU buffer.
;
; OUTPUTS:
;     Fog_TileIndex:
;         The updated fog generator value.
;
;     Fog_StateIndex:
;         The updated fog index value.
;
;     PPUBuffer:
;         The updated PPU buffer, with the rotate-right
;         command scheduled.
;
;     PPUBuffer_WriteOffset:
;         The updated upper bounds of the PPU buffer.
;
;
; XREFS:
;     Fog_OnTick
;============================================================================
Fog_UpdateTiles:                            ; [$dfde]
    LDX PPUBuffer_WriteOffset               ; Load the upper bounds of the
                                            ; fog generator.


    ;
    ; Queue drawing command "Rotate tiles right."
    ;
    LDA #$fc                                ; 0xFC == Rotate Tiles Right draw
                                            ; command.
    STA PPUBuffer,X                         ; Set as the command.


    ;
    ; Set the upper byte of the tile address to 0x18.
    ;
    INX                                     ; X++
    LDA #$18                                ; 0x18 == Upper byte of the
                                            ; sprite tile address.
    STA PPUBuffer,X                         ; Set it as the upper byte for
                                            ; the draw command.


    ;
    ; Calculate a lower byte for the tile based on the
    ; fog tile index.
    ;
    ; This will be the existing value * 16 (tile data size).
    ;
    INX                                     ; X++
    LDA Fog_TileIndex                       ; Load the fog generator value.
    INC Fog_TileIndex                       ; Increment for later (not
                                            ; involved in the math).
    ASL A                                   ; Multiply the value we loaded by
                                            ; 16.
    ASL A
    ASL A
    ASL A
    STA PPUBuffer,X                         ; Set as the lower byte for the
                                            ; draw command.


    ;
    ; Set the new upper bounds for the PPU buffer.
    ;
    ; This will increment by 3.
    ;
    INX                                     ; X++
    STX PPUBuffer_WriteOffset               ; Set as the new upper bounds.


    ;
    ; Update the fog tile index.
    ;
    ; It'll increment by 2 (from above and here), keeping and
    ; wrapping around with a value range of 0..7.
    ;
    INC Fog_TileIndex                       ; Increment the fog generator
                                            ; value.
    LDA Fog_TileIndex                       ; Load the result.
    AND #$07                                ; Keep it in range 0..7.
    STA Fog_TileIndex                       ; Store it back.
    BNE RETURN_E011                         ; If != 0, we're done.


    ;
    ; The fog generator value hit 0. Increment the fog
    ; index and look up a new starting fog generator value.
    ;
    INC Fog_StateIndex                      ; Increment the fog index.
    LDA Fog_StateIndex                      ; Load it.
    LSR A                                   ; Divide by 2.
    AND #$03                                ; And convert to an index in the
                                            ; lookup table.
    TAX                                     ; X = A
    LDA FOG_START_TILE_INDEXES,X            ; Load a starting fog generator
                                            ; value at that index.
    STA Fog_TileIndex                       ; And set it.

    ;
    ; XREFS:
    ;     Fog_OnTick
    ;     Fog_UpdateTiles
    ;
RETURN_E011:                                ; [$e011]
    RTS

;
; XREFS:
;     Fog_UpdateTiles
;
FOG_START_TILE_INDEXES:                     ; [$e012]
    .byte $18                               ; [0]:
    .byte $06                               ; [1]:
    .byte $30                               ; [2]:
    .byte $0c                               ; [3]:


;============================================================================
; Check whether the Player Menu can and should be shown.
;
; The menu can be shown anywhere other than the first
; screen of the first town (where the game begins).
;
; If the menu can be shown, then it will be shown if
; the Select button has been pressed.
;
; INPUTS:
;     Area_CurrentArea:
;         The current area.
;
;     Area_CurrentScreen:
;         The current screen of the current area.
;
;     Joy1_ChangedButtonMask:
;         The bitmask of newly-pressed buttons.
;
; OUTPUTS:
;     None
;
; CALLS:
;     MMC1_LoadBankAndJump
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
GameLoop_CheckShowPlayerMenu:               ; [$e016]
    ;
    ; Check to make sure we're not outside the walls of Eolis.
    ;
    LDA Area_CurrentArea                    ; A = current area.
    BNE @_allowInventory                    ; If it's > Eolis, the player can
                                            ; open the inventory. Jump.
    LDA Area_CurrentScreen                  ; A = current screen.
    BEQ RETURN_E02A                         ; If it's 0, then we're outside
                                            ; the walls. No inventory
                                            ; allowed. Return.

  @_allowInventory:                         ; [$e01e]
    LDA Joy1_ChangedButtonMask              ; A = controller 1 button mask.
    AND #$20                                ; Is Select pressed?
    BEQ RETURN_E02A                         ; If not, return.


    ;
    ; Open the inventory via jump to PlayerMenu_Show.
    ;
    JSR MMC1_LoadBankAndJump                ; Open the Player Menu.
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer PlayerMenu_Show-1               ; Address =
                                            ; PlayerMenu_Show

    ;
    ; XREFS:
    ;     GameLoop_CheckPauseGame
    ;     GameLoop_CheckShowPlayerMenu
    ;
RETURN_E02A:                                ; [$e02a]
    RTS


;============================================================================
; Check whether the player has paused.
;
; If they have, then stay paused until the player
; unpauses.
;
; This function won't return until the player unpaused.
; While paused, Game_PausedState will be set.
;
; INPUTS:
;     Joy1_ChangedButtonMask:
;         The changed button mask to check.
;
; OUTPUTS:
;     Game_PausedState:
;         1 while paused. 0 on return.
;
; CALLS:
;     WaitForNextFrame
;     Sprites_FlipRanges
;
; XREFS:
;     Game_MainLoop
;============================================================================
GameLoop_CheckPauseGame:                    ; [$e02b]
    ;
    ; Check if the player pressed Start.
    ;
    LDA Joy1_ChangedButtonMask              ; Load the button state.
    AND #$10                                ; Check if the Pause button is
                                            ; pressed.
    BEQ RETURN_E02A                         ; If paused...


    ;
    ; The player paused. Set the flag and wait until unpaused.
    ;
    LDA #$01
    STA a:Game_PausedState                  ; Set the Paused flag.

  @_waitForUnpause:                         ; [$e036]
    JSR WaitForNextFrame                    ; Wait...
    JSR Sprites_FlipRanges


    ;
    ; Check if the player unpaused.
    ;
    LDA Joy1_ChangedButtonMask              ; Check if the Pause button was
                                            ; pressed again.
    AND #$10
    BEQ @_waitForUnpause                    ; Until pause is pressed again,
                                            ; loop.


    ;
    ; Unpause the game.
    ;
    LDA #$00                                ; Clear the Paused flag.
    STA a:Game_PausedState
    RTS


;============================================================================
; Update player state during a screen scroll.
;
; This will preserve the controller buttons that were
; pressed at the beginning of the screen scroll, regardless
; of any changes made to those buttons since.
;
; It will then position the player based off of a scroll
; transition counter, and increment that counter. This
; counter helps coordinate at which points the player's
; sprite appears to move and where it ends up.
;
; INPUTS:
;     Joy1_PrevButtonMask:
;         The controller 1 buttons pressed at the beginning
;         of the screen scroll.
;
;     Screen_ScrollPlayerTransitionCounter:
;         The counter used to control player position during
;         scroll.
;
; OUTPUTS:
;     Joy1_ButtonMask:
;         The restored button mask.
;
;     Screen_ScrollPlayerTransitionCounter:
;         The updated counter.
;
; CALLS:
;     Game_MovePlayerOnScroll
;
; XREFS:
;     Game_MainLoop
;     Screen_UpdateForScroll
;============================================================================
Game_UpdatePlayerOnScroll:                  ; [$e048]
    ;
    ; Preserve the previous pressed buttons while scrolling.
    ;
    LDA Joy1_PrevButtonMask                 ; Load the previous button mask.
    STA Joy1_ButtonMask                     ; Set it as the current button
                                            ; mask.
    JSR Game_MovePlayerOnScroll             ; Update the player position.
    INC Screen_ScrollPlayerTransitionCounter ; Increment the screen scroll
                                             ; transition counter.
    RTS
;============================================================================
; TODO: Document Game_MovePlayerOnScrollLeft
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_MovePlayerOnScroll
;============================================================================
Game_MovePlayerOnScrollLeft:                ; [$e052]
    ;
    ; The screen is scrolling to the screen to the left.
    ;
    ; If we're in the first 4 frames of the screen transition,
    ; move the player left 4px per frame until it wraps the
    ; screen.
    ;
    LDA Screen_ScrollPlayerTransitionCounter ; Load the transition counter.
    CMP #$04                                ; Is it >= 4?
    BCS @LAB_PRG15_MIRROR__e065             ; If so, jump.
    LDA Player_PosX_Block                   ; Load the player X position.
    SEC
    SBC #$04                                ; Subtract 4.
    STA Player_PosX_Block                   ; Store it.
    LDA Screen_Maybe_ScrollXCounter         ; Load our screen scroll counter.
    SBC #$00                                ; Subtract carry.
    STA Screen_Maybe_ScrollXCounter         ; Store it.


    ;
    ; Update Maybe_PlayerX_ForScroll based on the
    ; player's X position.
    ;
  @LAB_PRG15_MIRROR__e065:                  ; [$e065]
    LDA Player_PosX_Block
    STA Maybe_PlayerX_ForScroll
    RTS


;============================================================================
; Move the player while the screen is scrolling.
;
; This will position the player on the screen based on the
; state of the screen scroll.
;
; When scrolling horizontally, it will inch the player
; toward the nearest screen boundary until it wraps.
;
; When scrolling vertically, nothing useful happens.
;
; NOTE: The function is full of useless code that's not
;       needed. Conditionals and variable settings that
;       never get used by anything else.
;
;       Y scrolling effects aren't in Faxanadu, and the
;       code managing that doesn't end up doing anything
;       useful.
;
;       For X scrolling, we set some variables that also
;       either don't get used or don't have any true
;       impact on the logic in which they're used.
;
; INPUTS:
;     Screen_ScrollDirection:
;         The direction in which the screen is scrolling.
;
;     Screen_ScrollPlayerTransitionCounter:
;         The transition counter used during screen scroll
;         to help position the player.
;
;     Player_PosX_Block:
;         The player's current X position.
;
; OUTPUTS:
;     Player_PosX_Block:
;         The updated player position.
;
;     Screen_Maybe_ScrollXCounter:
;         An updated X value used during screen scroll.
;         This is set in the first 4 frames of scrolling
;         left or right, but is thought to ultimately be
;         useless.
;
;     Maybe_PlayerX_ForScroll:
;     Maybe_PlayerY_ForScroll
;         Ultimately unused values. Remnants of dead code.
;
; XREFS:
;     Game_UpdatePlayerOnScroll
;============================================================================
Game_MovePlayerOnScroll:                    ; [$e06a]
    ;
    ; Check which direction the screen is scrolling.
    ;
    LDX Screen_ScrollDirection              ; Load the screen scroll
                                            ; direction.
    BEQ Game_MovePlayerOnScrollLeft         ; If 0, jump to handle scrolling
                                            ; left.
    DEX
    BEQ @_scrollRight                       ; If 1, jump to handle scrolling
                                            ; right.
    DEX
    BEQ @_scrollUp                          ; If 2, jump to handle scrolling
                                            ; up.


    ;
    ; The screen is scrolling to the screen below.
    ;
    LDA Screen_ScrollPlayerTransitionCounter ; Load the transition counter.
    CMP #$08                                ; Is it < 8?
    BCC @_return1                           ; If so, return.
    LDA Maybe_PlayerY_ForScroll             ; Load the player's Y position
                                            ; during scroll.
    SEC
    SBC #$04                                ; Subtract 4
    STA Maybe_PlayerY_ForScroll             ; Store it.
    SEC

  @_return1:                                ; [$e082]
    RTS


    ;
    ; The screen is scrolling to the screen above.
    ;
  @_scrollUp:                               ; [$e083]
    LDA Screen_ScrollPlayerTransitionCounter ; Load the transition counter.
    CMP #$08                                ; Is it < 8?
    BCC @_return2                           ; If so, return.
    LDA Maybe_PlayerY_ForScroll             ; Load the player Y position
                                            ; during scroll.
    CLC
    ADC #$04                                ; Add 4.
    STA Maybe_PlayerY_ForScroll             ; Store it.
    SEC

  @_return2:                                ; [$e091]
    RTS


    ;
    ; The screen is scrolling to the screen to the right.
    ;
    ; If we're in the first 4 frames of the screen transition,
    ; move the player right 4px per frame until it wraps the
    ; screen.
    ;
  @_scrollRight:                            ; [$e092]
    LDA Screen_ScrollPlayerTransitionCounter ; Load the transition counter.
    CMP #$04                                ; Is it >= 4?
    BCS @_finishScrollRight                 ; If so, jump.
    LDA Player_PosX_Block                   ; Load the player X position.
    CLC
    ADC #$04                                ; Add 4.
    STA Player_PosX_Block                   ; Store it.
    LDA Screen_Maybe_ScrollXCounter         ; Load our screen scroll counter.
    ADC #$00                                ; Add carry.
    STA Screen_Maybe_ScrollXCounter         ; Store it.


    ;
    ; Update Maybe_PlayerX_ForScroll based on the
    ; player's X position.
    ;
  @_finishScrollRight:                      ; [$e0a5]
    LDA Player_PosX_Block
    STA Maybe_PlayerX_ForScroll
    RTS


;============================================================================
; Set the initial state for a player on level load.
;
; This will face the player right, set their movement
; speed, status, disable invincibility, and other state.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     Screen_Maybe_ScrollXCounter:
;         TODO
;
;     Player_Something_ScrollPosY:
;         TODO
;
;     PPU_ScrollScreenHoriz:
;         TODO
;
;     Player_MoveAcceleration:
;         The initial player movement speed (0 in
;         lower byte).
;
;     Player_StatusFlag:
;         The player's status (0).
;
;     Player_InvincibilityPhase:
;         The invincibility phase (0).
;
;     Player_Flags:
;         The player will be facing right.
;
;     Player_DrawTileReadOffset:
;         TODO (set to 0xFF).
;
;     Player_Unused_00ab:
;         TODO (set to 2).
;
; XREFS:
;     Game_InitStateForSpawn
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
Player_SetInitialState:                     ; [$e0aa]
    ;
    ; Clear scroll state.
    ;
    LDA #$00
    STA Screen_Maybe_ScrollXCounter
    STA Player_Something_ScrollPosY
    STA PPU_ScrollScreenVert                ; DEADCODE: Overridden below.
    STA PPU_ScrollScreenHoriz


    ;
    ; Set the starting speed, status, and iframes.
    ;
    STA Player_MoveAcceleration             ; Set the player speed to 0.
    STA Player_StatusFlag                   ; Set the player status to 0.
    STA Player_InvincibilityPhase           ; Set the invincibility phase to
                                            ; 0.
    STA PPU_ScrollScreenVert                ; Set the vertical scroll to 0.


    ;
    ; Face the player to the right.
    ;
    LDA #$40                                ; 0x04 = Face player right bit.
    STA Player_Flags                        ; Set that on the player's flags.


    ;
    ; Set the accessory information.
    ;
    LDA #$ff
    STA Player_DrawTileReadOffset


    ;
    ; Unused value. This is written to but never read from.
    ;
    LDA #$02
    STA Player_Unused_00ab
    RTS

    ;
    ; XREFS:
    ;     GameLoop_UpdatePlayer
    ;
RETURN_E0C9:                                ; [$e0c9]
    RTS


;============================================================================
; Check and update state for the player.
;
; This is run on every game tick to check what the
; player is doing and to update its state.
;
; This checks for attacking, climbing, jumping, iframes,
; entering doors, falling to the ground, pushing blocks,
; and moving between screens.
;
; INPUTS:
;     Screen_ScrollDirection:
;         The current screen scroll direction.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Player_CheckHandleAttack
;     Player_CheckHandleClimb
;     Player_CheckHandleJump
;     Player_HandleIFrames
;     Player_CheckHandleEnterDoor
;     Player_CheckOnBreakableBlock
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
GameLoop_UpdatePlayer:                      ; [$e0ca]
    JSR Player_CheckHandleAttack            ; Check if the player has
                                            ; attacked and handle it.
    JSR Player_CheckHandleClimb
    JSR Player_CheckHandleJump              ; Check if the player has jumped
                                            ; and handle it.
    JSR Player_HandleIFrames                ; Handle any pending iframes.


    ;
    ; Check if screen scrolling is occurring.
    ;
    LDA Screen_ScrollDirection              ; A = scrolling activity.
    CMP #$04                                ; Is the screen scrolling in
                                            ; either direction?
    BCC RETURN_E0C9                         ; If so, return.


    ;
    ; The screen is not scrolling.
    ;
    JSR Player_CheckHandleEnterDoor         ; Check if the player is entering
                                            ; a door.
    JSR Player_CheckOnBreakableBlock
    JSR Player_CheckPushingBlock            ; Check if the player is pushing
                                            ; the block to open a path to
                                            ; Mascon.
    JMP Player_CheckSwitchScreen            ; Check the block the player is
                                            ; on and handle it.


;============================================================================
; Handle any invincibility frames that may be set.
;
; Invincibility frames start at 0x3C.
;
; If the player has invincibility frames, the frame counter
; will be reduced by 1.
;
; The user's knockback will be reset when the counter hits
; 0x38, at which point the player can safely move.
;
; The user is invincible until the counter hits 0.
;
; INPUTS:
;     Player_InvincibilityPhase:
;         The current invincibility phase, from 0x3C to 0.
;
;     Player_StatusFlag:
;         The player's current status flag.
;
; OUTPUTS:
;     Player_StatusFlag:
;         The new status flag with knockback removed, when
;         hitting 0x39 or lower.
;
; CALLS:
;     Player_SetStandardAcceleration
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_HandleIFrames:                       ; [$e0e8]
    LDA Player_InvincibilityPhase           ; Check the current invincibility
                                            ; phase.
    BEQ @_removeIFrames                     ; If the phase is now 1, remove
                                            ; iframe status.


    ;
    ; Invincibility is active. Reduce it by 1.
    ;
    DEC Player_InvincibilityPhase           ; Reduce our invincibility phase
                                            ; by 1.


    ;
    ; Check where we are in the phase. It starts at 0x3C, and
    ; until it hits 0x39, it will be in knockback phase.
    ;
    LDA Player_InvincibilityPhase           ; Check the invincibility phase.
    CMP #$39                                ; Is it 0x39?
    BEQ @_resetSpeed                        ; If so, reset the speed but
                                            ; don't change the player status.
    BCC @_removeIFrames                     ; If not over, update the player
                                            ; status.


    ;
    ; Set the knockback speed and return, leaving the knockback
    ; state intact.
    ;
    JMP Player_SetStandardAcceleration      ; Set standard acceleration.


    ;
    ; Set the knockback speed, but then clear the knockback.
    ;
  @_resetSpeed:                             ; [$e0f9]
    JSR Player_SetStandardAcceleration      ; Reset the player speed.


    ;
    ; Clear knockback from the player flags.
    ;
  @_removeIFrames:                          ; [$e0fc]
    LDA Player_StatusFlag                   ; Load the player's flags.
    AND #$fd                                ; Clear the knockback bit.
    STA Player_StatusFlag                   ; Save them.
    RTS

;============================================================================
; TODO: Document Player_CheckHandleAttack
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckHandleAttack:                   ; [$e103]
    LDA Player_Flags                        ; Load the player's flags.
    BMI @_updateHitPhase                    ; If already attacking, jump.


    ;
    ; The player is not yet attacking. Check first if the
    ; player is allowed to attack.
    ;
    JSR Player_IsClimbing                   ; Is the player climbing?
    BCS @_clearAttacking                    ; If so, clear any attacking
                                            ; state and return.


    ;
    ; The player isn't climbing. Check if they've attacked.
    ;
    LDA Joy1_ChangedButtonMask              ; Load the controller 1 button
                                            ; mask.
    AND #$40                                ; Is the B button set?
    BEQ @_clearAttacking                    ; If not, clear any attacking
                                            ; state and return.
    LDA Player_StatusFlag                   ; Load the player's status flags.
    AND #$01                                ; Was the player in attack mode?
    BEQ @_setAttacking                      ; If so, set the attacking state.
    RTS


    ;
    ; Clear the attacking state for the player.
    ;
  @_clearAttacking:                         ; [$e119]
    LDA Player_StatusFlag                   ; Load the player's flags.
    AND #$fe                                ; Clear the Attacking bit.
    STA Player_StatusFlag                   ; Store it.
    RTS


    ;
    ; Set the attacking state for the player.
    ;
    ; This will update the flags and begin the animation
    ; phase timer.
    ;
  @_setAttacking:                           ; [$e120]
    LDA Player_Flags                        ; Load the player's flags.
    ORA #$80                                ; Set the Attacking bit.
    STA Player_Flags                        ; Store it.
    LDA Player_StatusFlag                   ; Load the player's status flags.
    ORA #$01                                ; Set the Attacking bit.
    STA Player_StatusFlag                   ; Store it.


    ;
    ; Clear the phase state.
    ;
    LDA #$00
    STA PlayerHitsPhaseTimer                ; Set phase timer to 0.
    STA PlayerHitsPhaseCounter              ; Set phase counter to 0.

  @_updateHitPhase:                         ; [$e132]
    INC PlayerHitsPhaseTimer                ; Increment the current phase
                                            ; timer.
    LDA PlayerHitsPhaseTimer                ; A = updated phase timer.
    LDX PlayerHitsPhaseCounter              ; X = phase counter.
    CMP PLAYER_HIT_PHASES,X                 ; Check against the phase lookup
                                            ; table.
    BCC @_return                            ; If we're not transitioning to
                                            ; the next phase count, return.


    ;
    ; We're done with that phase. Move to the next and
    ; reset the timer.
    ;
    LDA #$00
    STA PlayerHitsPhaseTimer                ; Reset the current phase's timer
                                            ; to 0.
    INX                                     ; Phase counter++
    CPX #$03                                ; Is it >= 3 (end of phases)?
    BCS @_finishAttacking                   ; If so, finish the attacking
                                            ; state.
    STX PlayerHitsPhaseCounter              ; Else, increment the phase
                                            ; counter for the next frame.

  @_return:                                 ; [$e148]
    RTS

  @_finishAttacking:                        ; [$e149]
    LDA Player_Flags                        ; Load the player's flags.
    AND #$7f                                ; Clear the Attacking flag.
    STA Player_Flags                        ; Store it.

    ;
    ; XREFS:
    ;     Player_CheckHandleJump
    ;
RETURN_E14F:                                ; [$e14f]
    RTS

;
; XREFS:
;     Player_CheckHandleAttack
;
PLAYER_HIT_PHASES:                          ; [$e150]
    .byte $08                               ; [0]: 8 frames thrusting out
                                            ; weapon
    .byte $03                               ; [1]: 3 frames of waiting
    .byte $08                               ; [2]: 8 frames withdrawing
                                            ; weapon


;============================================================================
; Handle knockback when getting hit.
;
; This will knock the player back in the direction opposite
; where the player was facing.
;
; It will temporarily flip the facing bit and then move in
; that direction. The original bit will then be restored.
;
; INPUTS:
;     Player_Flags:
;         The player's flags.
;
; OUTPUTS:
;     Player_Flags:
;         The updated flags, with any new state applied
;         from the move but the flipped bit retained.
;
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Player_KnockbackHoriz
;
; XREFS:
;     Player_CheckHandleJump
;============================================================================
Player_HandleKnockback:                     ; [$e153]
    ;
    ; Temporarily store the player's current flags.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$40                                ; Take only the facing bit.
    PHA                                     ; Push it to the stack.


    ;
    ; Flip the facing bit and knock back in the flipped direction.
    ;
    EOR #$40                                ; Flip the facing bit temporarily
                                            ; for the purpose of knockback.
    STA Player_Flags                        ; Store as the new flags.
    JSR Player_KnockbackHoriz               ; Move based on the facing bit.


    ;
    ; Restore the original flags, merging with any updated bits
    ; from the move.
    ;
    PLA                                     ; Pop the original flags.
    STA Temp_00                             ; Store it.
    LDA Player_Flags                        ; Load the flags set above.
    AND #$bf                                ; Clear the facing bit.
    ORA Temp_00                             ; OR with the original facing
                                            ; bit.
    STA Player_Flags                        ; Store it.
    RTS


;============================================================================
; Move the player left or right due to knockback.
;
; The player will be knocked back based on the direction
; they're facing.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Player_TryMoveLeft
;     Player_TryMoveRight
;
; XREFS:
;     Player_HandleKnockback
;============================================================================
Player_KnockbackHoriz:                      ; [$e16b]
    LDA Player_Flags                        ; Load the player's flags.
    AND #$40                                ; Is the player facing right?
    BNE Player_TryMoveRight                 ; If so, move right.
    JMP Player_TryMoveLeft

;============================================================================
; TODO: Document Player_CheckHandleJump
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckHandleJump:                     ; [$e174]
    LDA Screen_ScrollDirection
    BPL RETURN_E14F
    LDA Player_StatusFlag
    AND #$02
    BNE Player_HandleKnockback
    LDA Player_StatusFlag
    BMI @_playerCanFly
    LDA Player_Flags
    AND #$05
    BEQ @_playerCanFly
    LDA Player_Flags
    AND #$20
    BEQ @_playerNotMoving
    LDA Player_Flags
    AND #$40
    BNE Player_TryMoveRight
    JMP Player_TryMoveLeft

  @_playerCanFly:                           ; [$e197]
    LDA Player_Flags
    BMI @LAB_PRG15_MIRROR__e1be
    LDA Joy1_ButtonMask
    AND #$03
    BEQ @_playerNotMoving
    INC Player_MovementTick
    LSR A
    BCS Player_TryMoveRight
    LSR A
    BCC @_playerNotMoving
    JMP Player_TryMoveLeft

  @_playerNotMoving:                        ; [$e1ac]
    LDA Joy1_ButtonMask
    AND #$0c
    BEQ @LAB_PRG15_MIRROR__e1be
    LDA Player_PosX_Block
    AND #$0f
    BEQ @LAB_PRG15_MIRROR__e1be
    LDA Player_Flags
    AND #$08
    BNE @LAB_PRG15_MIRROR__e1c5

  @LAB_PRG15_MIRROR__e1be:                  ; [$e1be]
    LDA Player_Flags
    AND #$df
    STA Player_Flags
    RTS

  @LAB_PRG15_MIRROR__e1c5:                  ; [$e1c5]
    INC Player_MovementTick
    LDA Player_PosX_Block
    AND #$0f
    CMP #$08
    BCC Player_TryMoveLeft


;============================================================================
; Try moving the player right.
;
; This is used when handling knockback or jumping. It will
; move based on any existing acceleration, or the default
; if the player wasn't previously moving, and then try to
; position the player. That may position up againt a block,
; at the edge of the screen, or onto the next screen.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
;     Player_PosX_Block:
;     Player_PosX_Frac:
;         The player's current X position.
;
;     Area_ScreenToTheRight:
;         The ID of the screen to the right.
;
;     Screen_Maybe_ScrollXCounter:
;         The counter used for scrolling.
;
; OUTPUTS:
;     Player_Flags:
;         The updated flags.
;
;     Player_PosX_Block:
;     Player_PosX_Frac:
;         The updated player X position.
;
;     Player_MoveAcceleration:
;         The updated move acceleration.
;
;     Area_CurrentScreen:
;         The new screen, if switching screens.
;
;     Screen_Maybe_ScrollXCounter:
;         The updated counter used for scrolling.
;
;     Screen_ScrollPlayerTransitionCounter:
;         The transition counter for the player movement,
;         if scrolling screens.
;
; CALLS:
;     Area_ScrollTo
;     Player_UpdateAcceleration
;     Player_SetStandardAcceleration
;     Player_CheckIfPassable
;     Player_SetPosAtRightEdge
;     Screen_IsEdge
;
; XREFS:
;     Player_CheckHandleJump
;     Player_KnockbackHoriz
;============================================================================
Player_TryMoveRight:                        ; [$e1cf]
    ;
    ; Check whether the player is moving.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$20                                ; Check the moving bit.
    BNE @_setMoving                         ; If set, jump to handle
                                            ; movement.


    ;
    ; The player is not moving. Reset the movement speed.
    ;
    JSR Player_SetStandardAcceleration      ; Start with the standard
                                            ; acceleration.


    ;
    ; Calculate movement speed and set the player to move to
    ; the right.
    ;
  @_setMoving:                              ; [$e1d8]
    JSR Player_UpdateAcceleration           ; Calculate the new walking
                                            ; speed.
    LDA Player_Flags                        ; Load the player's flags.
    ORA #$60                                ; Set moving and to the right.
    STA Player_Flags                        ; Store as the new flags.


    ;
    ; Update the player's X position to factor in acceleration.
    ;
    LDA Player_PosX_Frac                    ; Load the fractional X position.
    CLC
    ADC Player_MoveAcceleration             ; Add the move acceleration.
    STA Player_PosX_Frac                    ; Store as the new fractional
                                            ; position.
    LDA Player_PosX_Block                   ; Load the full X position.
    ADC Player_MoveAcceleration_U           ; Add the move acceleration.
    STA Player_PosX_Block                   ; And store it.


    ;
    ; Check if the block there is passable.
    ;
    LDX #$01
    JSR Player_CheckIfPassable              ; Is the block to the right
                                            ; passable?
    BEQ @_checkAtRightEdge                  ; If not, jump to check for an
                                            ; edge or transition boundary.


    ;
    ; The block is not passable. Cap the position.
    ;
    LDA Player_PosX_Block                   ; Load the player X position.
    AND #$f0                                ; Cap it.
    STA Player_PosX_Block                   ; And store it.
    JMP @_return


    ;
    ; Check if the player is far enough to the right for
    ; any screen transition logic.
    ;
  @_checkAtRightEdge:                       ; [$e1fe]
    LDA Player_PosX_Block                   ; X = Player X position.
    CMP #$f1                                ; Is it too far left to perform a
                                            ; screen transition?
    BCC @_return                            ; If so, return.


    ;
    ; Check if the player is at the edge and can scroll.
    ;
    LDY #$01
    JSR Screen_IsEdge                       ; Check if the screen is the
                                            ; right-most edge.
    BCS Player_SetPosAtRightEdge            ; If so, jump to set the position
                                            ; there.


    ;
    ; There's a screen to the right. Transition there.
    ;
    LDA Area_ScreenToTheRight               ; A = Neighboring screen to the
                                            ; right.
    STA Area_CurrentScreen                  ; Store as the new current
                                            ; screen.
    LDX #$01
    JSR Area_ScrollTo                       ; Begin scrolling to the right.
    INC Screen_Maybe_ScrollXCounter         ; Increment the scroll counter.
    LDA #$00
    STA Screen_ScrollPlayerTransitionCounter ; Clear the transition counter.

  @_return:                                 ; [$e21a]
    RTS


;============================================================================
; Position the player at the right edge of the screen.
;
; The player will be positioned at 0xF0.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Player_PosX_Block:
;         The updated X position.
;
; XREFS:
;     Player_TryMoveRight
;============================================================================
Player_SetPosAtRightEdge:                   ; [$e21b]
    LDA #$f0
    STA Player_PosX_Block                   ; Set the X position to 0xF0.
    RTS


;============================================================================
; Try moving the player left.
;
; This is used when handling knockback or jumping. It will
; move based on any existing acceleration, or the default
; if the player wasn't previously moving, and then try to
; position the player. That may position up againt a block,
; at the edge of the screen, or onto the next screen.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
;     Player_PosX_Block:
;     Player_PosX_Frac:
;         The player's current X position.
;
;     Area_ScreenToTheLeft:
;         The ID of the screen to the left.
;
;     Screen_Maybe_ScrollXCounter:
;         The counter used for scrolling.
;
; OUTPUTS:
;     Player_Flags:
;         The updated flags.
;
;     Player_PosX_Block:
;     Player_PosX_Frac:
;         The updated player X position.
;
;     Player_MoveAcceleration:
;         The updated move acceleration.
;
;     Area_CurrentScreen:
;         The new screen, if switching screens.
;
;     Screen_Maybe_ScrollXCounter:
;         The updated counter used for scrolling.
;
;     Screen_ScrollPlayerTransitionCounter:
;         The transition counter for the player movement,
;         if scrolling screens.
;
; CALLS:
;     Area_ScrollTo
;     Player_UpdateAcceleration
;     Player_SetStandardAcceleration
;     Player_CheckIfPassable
;     Player_SetPosAtRightEdge
;     Screen_IsEdge
;
; XREFS:
;     Player_CheckHandleJump
;     Player_KnockbackHoriz
;============================================================================
Player_TryMoveLeft:                         ; [$e220]
    ;
    ; Check whether the player is moving.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$20                                ; Check the moving bit.
    BNE @_setMoving                         ; If set, jump to handle
                                            ; movement.


    ;
    ; The player is not moving. Reset the movement speed.
    ;
    JSR Player_SetStandardAcceleration      ; Start with the standard
                                            ; acceleration.


    ;
    ; Calculate movement speed and set the player to move to
    ; the left.
    ;
  @_setMoving:                              ; [$e229]
    JSR Player_UpdateAcceleration           ; Calculate the new walking
                                            ; speed.
    LDA Player_Flags                        ; Load the player's flags.
    AND #$bf                                ; Set the player to face left.
    ORA #$20                                ; Set the player to moving.
    STA Player_Flags                        ; Store as the new flags.


    ;
    ; Update the player's X position to factor in acceleration.
    ;
    LDA Player_PosX_Frac                    ; Load the fractional X position.
    SEC
    SBC Player_MoveAcceleration             ; Subtract the move acceleration.
    STA Player_PosX_Frac                    ; Store as the new fractional
                                            ; position.
    LDA Player_PosX_Block                   ; Load the full X position.
    SBC Player_MoveAcceleration_U           ; Subtract the move acceleration.
    PHP                                     ; Push all flags.
    BCS @_saveFlags                         ; If >= 0, jump.
    LDA #$00                                ; Else, cap at 0, so it doesn't
                                            ; wrap.

  @_saveFlags:                              ; [$e244]
    STA Player_PosX_Block                   ; Store the new X position.


    ;
    ; Check if the block there is passable.
    ;
    LDX #$00
    JSR Player_CheckIfPassable              ; Is the block to the left
                                            ; passable?
    BEQ @_checkAtLeftEdge                   ; If not, jump to check for an
                                            ; edge or transition boundary.


    ;
    ; The block is not passable. Cap the position.
    ;
    PLP                                     ; Pop the flags from the
                                            ; acceleration calculation.
    LDA Player_PosX_Block                   ; Load the player X position.
    AND #$0f                                ; Is this in the first 16 pixels?
    BEQ @_return1                           ; If so, we're done.
    LDA Player_PosX_Block                   ; Load the player X position.
    AND #$f0                                ; Keep all but pixels 0-16.
    CLC
    ADC #$10                                ; Add 16 pixels.
    STA Player_PosX_Block                   ; Store as the new position.

  @_return1:                                ; [$e25d]
    RTS                                     ; And we're done.


    ;
    ; Check if the player is far enough to the left for
    ; any screen transition logic.
    ;
  @_checkAtLeftEdge:                        ; [$e25e]
    PLP                                     ; Pop the flags from the
                                            ; acceleration calculation.
    BCS @_return2                           ; If it didn't overflow off the
                                            ; left, return.


    ;
    ; Check if the player is at the edge and can scroll.
    ;
    LDY #$00
    JSR Screen_IsEdge                       ; Check if the screen is the
                                            ; left-most edge.
    BCS @_setAtLeftEdge                     ; If at the edge, jump to cap the
                                            ; position.


    ;
    ; There's a screen to the left. Transition there.
    ;
    LDA Area_ScreenToTheLeft                ; A = Neighboring screen to the
                                            ; left.
    STA Area_CurrentScreen                  ; Store as the new current
                                            ; screen.
    LDX #$00
    JSR Area_ScrollTo                       ; Begin scrolling to the left.
    LDA #$00
    STA Player_PosX_Block                   ; Set the X position to 0.
    STA Screen_ScrollPlayerTransitionCounter ; Clear the transition counter.

  @_return2:                                ; [$e277]
    RTS


    ;
    ; The player is at the left-most edge, but didn't pass it.
    ;
  @_setAtLeftEdge:                          ; [$e278]
    LDA #$00
    STA Player_PosX_Block                   ; Set the X position to 0.
    RTS                                     ; And return.
    .byte $00                               ; [0]:
    .byte $0f                               ; [1]:


;============================================================================
; Set the standard player acceleration.
;
; This will set to the default aceleration of 0xC0.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Player_MoveAcceleration:
;     Player_MoveAcceleration+1:
;         The default acceleration (0xC0).
;
; XREFS:
;     Player_HandleIFrames
;     Player_TryMoveLeft
;     Player_TryMoveRight
;     Player_UpdateAcceleration
;============================================================================
Player_SetStandardAcceleration:             ; [$e27f]
    LDA #$c0
    STA Player_MoveAcceleration             ; Set the lower byte of movement
                                            ; acceleation to 0xC0.
    LDA #$00
    STA Player_MoveAcceleration_U           ; Set the upper byte to 0.
    RTS


;============================================================================
; Update the player's position based on knockback.
;
; This will accelerate the player by 8 pixels when its
; position is next updated.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Player_MoveAcceleration:
;     Player_MoveAcceleration+1:
;         The updated acceleration.
;
; XREFS:
;     Player_UpdateAcceleration
;============================================================================
Player_UpdatePosFromKnockback:              ; [$e288]
    ;
    ; The player's in knockback state. Bump the player
    ; back a bunch.
    ;
    LDA #$00
    STA Player_MoveAcceleration             ; Set lower acceleration byte to
                                            ; 0.
    LDA #$08
    STA Player_MoveAcceleration_U           ; Set upper to 8.
    RTS

;============================================================================
; TODO: Document Player_UpdateAcceleration
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Player_TryMoveLeft
;     Player_TryMoveRight
;============================================================================
Player_UpdateAcceleration:                  ; [$e291]
    LDA Player_StatusFlag
    AND #$02
    BNE Player_UpdatePosFromKnockback
    LDA Joy1_ButtonMask
    AND #$0c
    BEQ @LAB_PRG15_MIRROR__e2a3
    LDA Player_Flags
    AND #$08
    BNE Player_SetStandardAcceleration

  @LAB_PRG15_MIRROR__e2a3:                  ; [$e2a3]
    LDA Player_MoveAcceleration
    CMP #$80
    LDA Player_MoveAcceleration_U
    SBC #$01
    BCS @_return
    LDA a:PlayerTitle
    LSR A
    LSR A
    AND #$03
    TAX
    LDA Player_MoveAcceleration
    CLC
    ADC BYTE_ARRAY_PRG15_MIRROR__e2c4,X
    STA Player_MoveAcceleration
    LDA Player_MoveAcceleration_U
    ADC #$00
    STA Player_MoveAcceleration_U

  @_return:                                 ; [$e2c3]
    RTS

;
; XREFS:
;     Player_UpdateAcceleration
;
BYTE_ARRAY_PRG15_MIRROR__e2c4:              ; [$e2c4]
    .byte $02                               ; [0]:
    .byte $04                               ; [1]:
    .byte $06                               ; [2]:
    .byte $08                               ; [3]:

;============================================================================
; TODO: Document Player_CheckHandleClimb
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckHandleClimb:                    ; [$e2c8]
    LDA Player_StatusFlag                   ; A = Player status flags.
    BPL @LAB_PRG15_MIRROR__e2d6
    LDA Joy1_ButtonMask
    BPL @LAB_PRG15_MIRROR__e2d6
    JSR Player_CheckIfOnLadder
    JMP @LAB_PRG15_MIRROR__e2f4

  @LAB_PRG15_MIRROR__e2d6:                  ; [$e2d6]
    JSR Player_CheckIfOnLadder
    LDA Player_Flags
    AND #$08
    BEQ @LAB_PRG15_MIRROR__e2fe
    LDA Joy1_ButtonMask
    AND #$0c
    BEQ @LAB_PRG15_MIRROR__e2fe
    LDA Player_Flags
    ORA #$10
    STA Player_Flags
    LDA Player_PosX_Block
    AND #$0f
    BEQ @LAB_PRG15_MIRROR__e2f4
    JMP Player_CheckHandleClimbMaybeSide

  @LAB_PRG15_MIRROR__e2f4:                  ; [$e2f4]
    LDA Joy1_ButtonMask
    LSR A
    LSR A
    LSR A
    BCS Player_CheckHandleClimbDown
    LSR A
    BCS Player_CheckHandleClimbUp

  @LAB_PRG15_MIRROR__e2fe:                  ; [$e2fe]
    JMP Player_CheckHandleClimbMaybeSide

;============================================================================
; TODO: Document Player_CheckHandleClimbUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimb
;============================================================================
Player_CheckHandleClimbUp:                  ; [$e301]
    LDA Player_Flags
    AND #$da
    STA Player_Flags
    LDX #$02
    JSR Player_CheckIfPassable
    BNE @LAB_PRG15_MIRROR__e343
    INC Player_MovementTick
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__e31e
    LDA Player_PosY
    SEC
    SBC #$01
    STA Player_PosY
    JMP @LAB_PRG15_MIRROR__e32b

  @LAB_PRG15_MIRROR__e31e:                  ; [$e31e]
    LDA BYTE_00a0
    SEC
    SBC #$a0
    STA BYTE_00a0
    LDA Player_PosY
    SBC #$00
    STA Player_PosY

  @LAB_PRG15_MIRROR__e32b:                  ; [$e32b]
    BCS @LAB_PRG15_MIRROR__e343
    LDY #$02
    JSR Screen_IsEdge
    BCS @LAB_PRG15_MIRROR__e344
    LDA Area_ScreenAbove
    STA Area_CurrentScreen
    LDX #$02
    JSR Area_ScrollTo
    DEC Player_Something_ScrollPosY
    LDA #$c0
    STA Player_PosY

  @LAB_PRG15_MIRROR__e343:                  ; [$e343]
    RTS

  @LAB_PRG15_MIRROR__e344:                  ; [$e344]
    LDA #$00
    STA Player_PosY
    RTS

;============================================================================
; TODO: Document Player_CheckHandleClimbDown
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimb
;============================================================================
Player_CheckHandleClimbDown:                ; [$e349]
    LDA Player_Flags
    AND #$da
    STA Player_Flags
    LDX #$03
    JSR Player_CheckIfPassable
    BNE RETURN_E393
    INC Player_MovementTick
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__e36c
    LDA BYTE_00a0
    CLC
    ADC #$80
    STA BYTE_00a0
    LDA Player_PosY
    ADC #$01
    STA Player_PosY
    JMP Player_MoveDownScreen

  @LAB_PRG15_MIRROR__e36c:                  ; [$e36c]
    LDA BYTE_00a0
    CLC
    ADC #$c0
    STA BYTE_00a0
    LDA Player_PosY
    ADC #$00
    STA Player_PosY

;============================================================================
; TODO: Document Player_MoveDownScreen
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimbDown
;============================================================================
Player_MoveDownScreen:                      ; [$e379]
    CMP #$c1
    BCC RETURN_E393
    LDY #$03
    JSR Screen_IsEdge
    BCS Player_SetPosAtBottomEdge
    LDA Area_ScreenBelow
    STA Area_CurrentScreen
    LDX #$03
    JSR Area_ScrollTo
    INC Player_Something_ScrollPosY
    LDA #$00
    STA Player_PosY

    ;
    ; XREFS:
    ;     Player_CheckHandleClimbDown
    ;     Player_MoveDownScreen
    ;
RETURN_E393:                                ; [$e393]
    RTS


;============================================================================
; Set the player at the bottom-most position of the screen.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Player_PosY:
;         The updated player position (set to 0xC0).
;
; XREFS:
;     Player_MoveDownScreen
;============================================================================
Player_SetPosAtBottomEdge:                  ; [$e394]
    LDA #$c0
    STA Player_PosY                         ; Set player Y position to 0xC0
                                            ; (192).
    RTS

;============================================================================
; TODO: Document Player_CheckHandleClimbMaybeSide
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimb
;============================================================================
Player_CheckHandleClimbMaybeSide:           ; [$e399]
    LDA Something_Player_ClimbLadderCheckPos
    CMP #$20
    BCC @LAB_PRG15_MIRROR__e3a5


    ;
    ; Clear the player's Jumping state.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$fe                                ; Clear the Jumping bit.
    STA Player_Flags                        ; Save it back.

  @LAB_PRG15_MIRROR__e3a5:                  ; [$e3a5]
    LDA Player_Flags
    LSR A
    BCC @LAB_PRG15_MIRROR__e3ad
    JMP Player_StayOnLadderAndContinue

  @LAB_PRG15_MIRROR__e3ad:                  ; [$e3ad]
    LDA #$03
    JSR Player_CheckIfPassable
    BEQ @LAB_PRG15_MIRROR__e3b7
    JMP Player_StayOnLadderAndContinue

  @LAB_PRG15_MIRROR__e3b7:                  ; [$e3b7]
    JSR Area_CheckCanClimbAdjacent
    LDA Blocks_Result
    BEQ @LAB_PRG15_MIRROR__e3cd
    LDA Maybe_ClimbLadderOffset
    CMP #$08
    BCS @LAB_PRG15_MIRROR__e3c9
    INC Maybe_ClimbLadderOffset
    JMP Player_ContinueHandleClimbOrJump

  @LAB_PRG15_MIRROR__e3c9:                  ; [$e3c9]
    LDA #$00
    STA Maybe_ClimbLadderOffset

  @LAB_PRG15_MIRROR__e3cd:                  ; [$e3cd]
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__e3d1

  @LAB_PRG15_MIRROR__e3d1:                  ; [$e3d1]
    LDA Player_Flags
    ORA #$04
    STA Player_Flags
    LDA Player_Flags
    AND #$08
    BNE Player_StayOnLadderAndContinue
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__e3f5
    LDA Joy1_ButtonMask
    BPL @LAB_PRG15_MIRROR__e3f5
    LDA BYTE_00a0
    CLC
    ADC #$00
    STA BYTE_00a0
    LDA Player_PosY
    ADC #$01
    STA Player_PosY
    JMP Area_ScrollScreenDown

  @LAB_PRG15_MIRROR__e3f5:                  ; [$e3f5]
    LDA Player_PosY
    CLC
    ADC #$08
    STA Player_PosY

;============================================================================
; TODO: Document Area_ScrollScreenDown
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimbMaybeSide
;============================================================================
Area_ScrollScreenDown:                      ; [$e3fc]
    CMP #$c1
    BCC @LAB_PRG15_MIRROR__e41e
    LDY #$03
    JSR Screen_IsEdge
    BCC @LAB_PRG15_MIRROR__e40e
    LDA #$c0
    STA Player_PosY
    JMP @LAB_PRG15_MIRROR__e42c

  @LAB_PRG15_MIRROR__e40e:                  ; [$e40e]
    LDA Area_ScreenBelow
    STA Area_CurrentScreen
    LDX #$03
    JSR Area_ScrollTo
    INC Player_Something_ScrollPosY
    LDA #$00
    STA Player_PosY
    RTS

  @LAB_PRG15_MIRROR__e41e:                  ; [$e41e]
    LDX #$03
    JSR Player_CheckIfPassable
    BEQ @LAB_PRG15_MIRROR__e42b
    LDA Player_PosY
    AND #$f0
    STA Player_PosY

  @LAB_PRG15_MIRROR__e42b:                  ; [$e42b]
    RTS

  @LAB_PRG15_MIRROR__e42c:                  ; [$e42c]
    LDA Player_Flags
    AND #$fb
    STA Player_Flags
    RTS

;============================================================================
; TODO: Document Player_ClearJumpingAndHoldingToClimb
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_ContinueHandleClimbOrJump
;============================================================================
Player_ClearJumpingAndHoldingToClimb:       ; [$e433]
    LDA Player_Flags
    AND #$fc
    STA Player_Flags

    ;
    ; XREFS:
    ;     Player_ContinueHandleClimbOrJump
    ;
RETURN_E439:                                ; [$e439]
    RTS
;============================================================================
; TODO: Document Player_StayOnLadderAndContinue
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimbMaybeSide
;============================================================================
Player_StayOnLadderAndContinue:             ; [$e43a]
    ;
    ; Clear the Falling Off state.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$fb                                ; Clear the Falling Off flag.
    STA Player_Flags                        ; Save it back.
    LDA #$00
    STA Maybe_ClimbLadderOffset

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document Player_ContinueHandleClimbOrJump
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimbMaybeSide
;============================================================================
Player_ContinueHandleClimbOrJump:           ; [$e444]
    ;
    ; Check if the player is jumping.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    LSR A                                   ; Shift the Jump flag into Carry.
    BCS @_isJumping                         ; If set (player is jumping),
                                            ; then jump (branch).


    ;
    ; The player is not jumping.
    ;
    LDX Joy1_ChangedButtonMask              ; X = Controller 1 changed button
                                            ; mask.
    BPL Player_ClearJumpingAndHoldingToClimb ; If the player is holding down
                                             ; A, then check grabbing for a
                                             ; ladder and return.
    JSR Player_IsClimbing
    BCS RETURN_E439
    LDX #$02
    JSR Player_CheckIfPassable
    BNE RETURN_E4B6
    LDA Player_Flags
    ORA #$03
    STA Player_Flags
    LDA #$00
    STA Something_Player_ClimbLadderCheckPos

  @_isJumping:                              ; [$e463]
    LDX Something_Player_ClimbLadderCheckPos
    CPX #$10
    BCC @LAB_PRG15_MIRROR__e46b
    BCS @LAB_PRG15_MIRROR__e4a2

  @LAB_PRG15_MIRROR__e46b:                  ; [$e46b]
    LDA Player_PosY
    SEC
    SBC BYTE_ARRAY_PRG15_MIRROR__e4d6,X
    STA Player_PosY
    BCS @LAB_PRG15_MIRROR__e481
    LDY #$02
    JSR Screen_IsEdge
    BCC Area_ScrollScreenUp
    LDA #$00
    JMP @LAB_PRG15_MIRROR__e49a

  @LAB_PRG15_MIRROR__e481:                  ; [$e481]
    LDX #$02
    JSR Player_CheckIfPassable
    BEQ Area_Something_IncDAT00a6
    LDX Something_Player_ClimbLadderCheckPos
    LDA Player_PosY
    AND #$0f
    TAX
    LDA Player_PosY
    AND #$f0
    CPX #$00
    BEQ @LAB_PRG15_MIRROR__e49a
    CLC
    ADC #$10

  @LAB_PRG15_MIRROR__e49a:                  ; [$e49a]
    STA Player_PosY
    LDA #$0f
    STA Something_Player_ClimbLadderCheckPos
    BNE Area_Something_IncDAT00a6

  @LAB_PRG15_MIRROR__e4a2:                  ; [$e4a2]
    LDA Player_PosY
    CLC
    ADC BYTE_ARRAY_PRG15_MIRROR__e4d6,X
    STA Player_PosY
    LDX #$03
    JSR Player_CheckIfPassable
    BNE Maybe_SetPlayerForScrollUp

    ;
    ; XREFS:
    ;     Player_ContinueHandleClimbOrJump
    ;
Area_Something_IncDAT00a6:                  ; [$e4b1]
    LDX Something_Player_ClimbLadderCheckPos
    INX
    STX Something_Player_ClimbLadderCheckPos

    ;
    ; XREFS:
    ;     Player_ContinueHandleClimbOrJump
    ;
RETURN_E4B6:                                ; [$e4b6]
    RTS

;============================================================================
; TODO: Document Area_ScrollScreenUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_ContinueHandleClimbOrJump
;============================================================================
Area_ScrollScreenUp:                        ; [$e4b7]
    LDA Area_ScreenAbove
    STA Area_CurrentScreen
    LDX #$02
    JSR Area_ScrollTo
    DEC Player_Something_ScrollPosY
    LDA #$c0
    STA Player_PosY
    JMP Maybe_SetPlayerForScrollUp

;============================================================================
; TODO: Document Maybe_SetPlayerForScrollUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_ScrollScreenUp
;============================================================================
Maybe_SetPlayerForScrollUp:                 ; [$e4c9]
    LDA Player_PosY
    AND #$f0
    STA Player_PosY
    LDA Player_Flags
    AND #$fe
    STA Player_Flags
    RTS

;
; XREFS:
;     Player_ContinueHandleClimbOrJump
;
BYTE_ARRAY_PRG15_MIRROR__e4d6:              ; [$e4d6]
    .byte $08                               ; [0]:
    .byte $04                               ; [1]:
    .byte $04                               ; [2]:
    .byte $04                               ; [3]:
    .byte $04                               ; [4]:
    .byte $02                               ; [5]:
    .byte $02                               ; [6]:
    .byte $01                               ; [7]:
    .byte $01                               ; [8]:
    .byte $01                               ; [9]:
    .byte $01                               ; [10]:
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
    .byte $01                               ; [21]:
    .byte $01                               ; [22]:
    .byte $01                               ; [23]:
    .byte $01                               ; [24]:
    .byte $02                               ; [25]:
    .byte $02                               ; [26]:
    .byte $04                               ; [27]:
    .byte $04                               ; [28]:
    .byte $04                               ; [29]:
    .byte $04                               ; [30]:
    .byte $08                               ; [31]:

;============================================================================
; TODO: Document Area_CheckCanClimbAdjacent
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimbMaybeSide
;============================================================================
Area_CheckCanClimbAdjacent:                 ; [$e4f6]
    LDX #$00
    LDA Joy1_ChangedButtonMask              ; Load the controller 1 button
                                            ; mask.
    AND #$03                                ; If Left or Right pressed?
    BEQ @_returnFalse                       ; If not, jump to return a false
                                            ; result.
    AND #$01                                ; Keep the Right Button bit.
    BEQ @LAB_PRG15_MIRROR__e503
    INX

  @LAB_PRG15_MIRROR__e503:                  ; [$e503]
    LDA Player_PosX_Block
    CLC
    ADC BYTE_PRG15_MIRROR__e524,X
    STA Arg_PixelPosX
    LDA Player_PosY
    CLC
    ADC #$20
    STA Arg_PixelPosY
    CMP #$f0
    BCC @_returnFalse
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_IsBlockImpassable
    STA Blocks_Result
    RTS

  @_returnFalse:                            ; [$e51f]
    LDA #$00                                ; A = 0 (false).
    STA Blocks_Result                       ; Store it as the result.
    RTS

;
; XREFS:
;     Area_CheckCanClimbAdjacent
;
BYTE_PRG15_MIRROR__e524:                    ; [$e524]
    .byte $00                               ; [$e524] byte

;
; XREFS:
;     Area_CheckCanClimbAdjacent
;
BYTE_PRG15_MIRROR__e525:                    ; [$e525]
    .byte $0f                               ; [$e525] byte

;============================================================================
; TODO: Document Player_CheckHandleEnterDoor
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckHandleEnterDoor:                ; [$e526]
    LDA Joy1_ChangedButtonMask
    AND #$08
    BEQ @_return
    JSR Area_SetStateFromDoorDestination    ; Set the new state based on the
                                            ; other end of the door.
    LDA Blocks_Result                       ; Check the result of that.
    BEQ @_return
    LDA Temp_BlockPos2
    CMP #$fe
    BCS Player_EnterDoorToOutside


    ;
    ; The player is going inside.
    ;
    JSR Game_RunDoorRequirementHandler
    LDA a:CurrentDoor_KeyRequirement
    BNE @_return


    ;
    ; The door is not locked.
    ;
    LDA Temp_BlockPos2
    CMP #$20
    BCS Player_EnterDoorToInside
    JSR Screen_FadeToBlack
    LDX #$06

  @_paletteCheckLoop:                       ; [$e54c]
    LDA Screen_DestPaletteOrIndex
    CMP @_return+1,X
    BEQ @_setupArea
    DEX
    BPL @_paletteCheckLoop
    BMI @_enterScreen

  @_setupArea:                              ; [$e558]
    LDA $e570,X
    CMP a:Areas_DefaultMusic
    BEQ @_enterScreen
    STA Music_Current
    STA a:Areas_DefaultMusic

  @_enterScreen:                            ; [$e565]
    JMP Game_SetupEnterScreen

  @_return:                                 ; [$e568]
    RTS


;============================================================================
; Mapping of palettes to accompanying music.
;
; These two tables work together, along with a loop, to
; match up palettes to the music that should play when
; switching screens.
;============================================================================
    .byte PALETTE_OUTSIDE                   ; [0]:
    .byte PALETTE_TOWER                     ; [1]:
    .byte PALETTE_MIST                      ; [2]:
    .byte PALETTE_SUFFER                    ; [3]:
    .byte PALETTE_DARTMOOR                  ; [4]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Palette_ARRAY_PRG15_MIRROR__e569_5_:        ; [$e56e]
    .byte PALETTE_FRATERNAL                 ; [5]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Palette_ARRAY_PRG15_MIRROR__e569_6_:        ; [$e56f]
    .byte PALETTE_KING_GRIEVES_ROOM         ; [6]:
    .byte MUSIC_APOLUNE                     ; [0]:
    .byte MUSIC_MAYBE_TOWER                 ; [1]:
    .byte MUSIC_FOREPAW                     ; [2]:
    .byte MUSIC_MAYBE_TOWER                 ; [3]:
    .byte MUSIC_DAYBREAK                    ; [4]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Music_ARRAY_PRG15_MIRROR__e570_5_:          ; [$e575]
    .byte MUSIC_MAYBE_TOWER                 ; [5]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Music_ARRAY_PRG15_MIRROR__e570_6_:          ; [$e576]
    .byte MUSIC_MAYBE_TOWER                 ; [6]:

;============================================================================
; TODO: Document Player_EnterDoorToInside
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleEnterDoor
;============================================================================
Player_EnterDoorToInside:                   ; [$e577]
    LDX Area_LoadingScreenIndex
    STX a:Area_DestScreen
    LDA Screen_DestPaletteOrIndex
    STA Area_LoadingScreenIndex
    TAX
    LDA BUILDING_PALETTES,X
    STA Screen_DestPaletteOrIndex
    LDA BUILDING_MAYBE_TILES_INDEXES,X
    STA a:Building_TilesIndex
    LDA BUILDING_START_POSITIONS,X
    STA Screen_StartPosYX
    LDA a:Areas_DefaultMusic
    STA a:Area_Music_Outside
    LDA BUILDING_MUSIC,X
    STA a:Areas_DefaultMusic
    LDA Area_CurrentArea


    ;
    ; Where does this door take the player?
    ;
    CMP #$04
    BNE @LAB_PRG15_MIRROR__e5a6
    JMP Game_BeginExitBuilding

  @LAB_PRG15_MIRROR__e5a6:                  ; [$e5a6]
    LDA Player_Flags
    AND #$bf
    STA Player_Flags
    JSR Screen_FadeToBlack
    JMP Game_SetupEnterBuilding
;============================================================================
; TODO: Document Player_EnterDoorToOutside
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleEnterDoor
;============================================================================
Player_EnterDoorToOutside:                  ; [$e5b2]
    ;
    ; The player opened a door back to the outside.
    ;
    LSR A
    LDA a:Area_Region
    ROL A
    PHA
    TAY


    ;
    ; Check if the door is locked.
    ;
    LDA DOOR_LOOKUP_REQUIREMENTS,Y
    STA a:CurrentDoor_KeyRequirement
    JSR Game_RunDoorRequirementHandler
    PLA
    TAY
    LDA a:CurrentDoor_KeyRequirement
    BNE SUB_RETURN_E5DA


    ;
    ; This door is not locked.
    ;
    LDA MAYBE_REGION_TRANSITION_MAP,Y
    STA a:Area_Region
    LDA MAYBE_SCREEN_TRANSITION_MAP,Y
    STA Area_LoadingScreenIndex
    JSR Screen_FadeToBlack
    JMP Game_SetupAndLoadOutsideArea

    ;
    ; XREFS:
    ;     Area_SetStateFromDoorDestination
    ;     Player_EnterDoorToOutside
    ;
SUB_RETURN_E5DA:                            ; [$e5da]
    RTS

;
; XREFS:
;     Player_EnterDoorToOutside
;
DOOR_LOOKUP_REQUIREMENTS:                   ; [$e5db]
    .byte $00                               ; [0]: No key required
    .byte $04                               ; [1]: "J" key required
    .byte $00                               ; [2]: No key required
    .byte $03                               ; [3]: "Q" key required
    .byte $00                               ; [4]: No key required
    .byte $01                               ; [5]: "A" key required
    .byte $00                               ; [6]: No key required
    .byte $07                               ; [7]: Ring of Dworf required
    .byte $00                               ; [8]: No key required
    .byte $08                               ; [9]: Demon's Ring required
    .byte $00                               ; [10]: No key required
    .byte $00                               ; [11]: No key required

;
; XREFS:
;     Player_EnterDoorToOutside
;
MAYBE_REGION_TRANSITION_MAP:                ; [$e5e7]
    .byte REGION_EOLIS                      ; [0]:
    .byte REGION_TRUNK                      ; [1]:
    .byte REGION_EOLIS                      ; [2]:
    .byte REGION_MIST                       ; [3]:
    .byte REGION_TRUNK                      ; [4]:
    .byte REGION_BRANCH                     ; [5]:
    .byte REGION_MIST                       ; [6]:
    .byte REGION_DARTMOOR                   ; [7]:
    .byte REGION_BRANCH                     ; [8]:
    .byte REGION_EVIL_FORTRESS              ; [9]:
    .byte REGION_DARTMOOR                   ; [10]:
    .byte REGION_EVIL_FORTRESS              ; [11]:

;
; XREFS:
;     Player_EnterDoorToOutside
;
MAYBE_SCREEN_TRANSITION_MAP:                ; [$e5f3]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $08                               ; [2]:
    .byte $11                               ; [3]:
    .byte $28                               ; [4]:
    .byte $00                               ; [5]:
    .byte $1f                               ; [6]:
    .byte $00                               ; [7]:
    .byte $27                               ; [8]:
    .byte $08                               ; [9]:
    .byte $0e                               ; [10]:
    .byte $0e                               ; [11]:

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_MUSIC:                             ; [$e5ff]
    .byte MUSIC_KINGS_ROOM                  ; [0]: King's Room
    .byte MUSIC_TEMPLE                      ; [1]: Temple
    .byte MUSIC_SHOP                        ; [2]: Hospital
    .byte MUSIC_SHOP                        ; [3]: Tavern
    .byte MUSIC_SHOP                        ; [4]: Tool Shop
    .byte MUSIC_SHOP                        ; [5]: Key Shop
    .byte MUSIC_SHOP                        ; [6]: House
    .byte MUSIC_SHOP                        ; [7]: Meat Shop
    .byte MUSIC_SHOP                        ; [8]: Martial Arts
    .byte MUSIC_SHOP                        ; [9]: Magic Shop


;============================================================================
; Mapping of building indexes to palette indexes.
;
; XREFS:
;     Player_EnterDoorToInside
;============================================================================

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_PALETTES:                          ; [$e609]
    .byte PALETTE_KINGS_ROOM                ; [0]: King's Room
    .byte PALETTE_TEMPLE                    ; [1]: Temple
    .byte PALETTE_HOSPITAL                  ; [2]: Hospital
    .byte PALETTE_TAVERN                    ; [3]: Tavern
    .byte PALETTE_TOOL_SHOP                 ; [4]: Tool Shop
    .byte PALETTE_KEY_SHOP                  ; [5]: Key Shop
    .byte PALETTE_HOUSE                     ; [6]: House
    .byte PALETTE_MEAT_SHOP                 ; [7]: Meat Shop
    .byte PALETTE_MARTIAL_ARTS              ; [8]: Martial Arts
    .byte PALETTE_MAGIC_SHOP                ; [9]: Magic Shop

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_MAYBE_TILES_INDEXES:               ; [$e613]
    .byte $06                               ; [0]: King's Room
    .byte $06                               ; [1]: Temple
    .byte $06                               ; [2]: Hospital
    .byte $07                               ; [3]: Tavern
    .byte $07                               ; [4]: Tool Shop
    .byte $07                               ; [5]: Key Shop
    .byte $07                               ; [6]: House
    .byte $07                               ; [7]: Meat Shop
    .byte $08                               ; [8]: Martial Arts
    .byte $08                               ; [9]: Magic Shop

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_START_POSITIONS:                   ; [$e61d]
    .byte $9e                               ; [0]: King's Room
    .byte $9e                               ; [1]: Temple
    .byte $9e                               ; [2]: Hospital
    .byte $8e                               ; [3]: Tavern
    .byte $7e                               ; [4]: Tool Shop
    .byte $7e                               ; [5]: Key Shop
    .byte $7e                               ; [6]: House
    .byte $7e                               ; [7]: Meat Shop
    .byte $8e                               ; [8]: Martial Arts
    .byte $8e                               ; [9]: Magic Shop


;============================================================================
; Return whether the screen is the edge in a given direction.
;
; INPUTS:
;     Y:
;         The direction to check relative to the screen.
;
;         0 = Screen left
;         1 = Screen right
;         2 = Screen above
;         3 = Screen below
;
; OUTPUTS:
;     C:
;         1 if this screen is the edge.
;         0 if it has a neighboring screen.
;
; XREFS:
;     Area_ScrollScreenDown
;     Player_CheckHandleClimbUp
;     Player_ContinueHandleClimbOrJump
;     Player_MoveDownScreen
;     Player_TryMoveLeft
;     Player_TryMoveRight
;============================================================================
Screen_IsEdge:                              ; [$e627]
    LDA Area_ScreenToTheLeft,Y              ; Load the screen ID at the given
                                            ; neighbor.
    CMP #$ff                                ; If 0xFF, C = 1. Else, C = 0
    RTS

;============================================================================
; TODO: Document Area_CanMoveUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Area_CanPlayerMoveRight
;============================================================================
Area_CanMoveUp:                             ; [$e62d]
    LDA Player_PosY
    LSR A
    LSR A
    LSR A
    LSR A
    TAX
    LDY FirstColumnInRightScreen,X
    JSR Area_IsBlockImpassable
    STA Blocks_Result
    INX
    LDY FirstColumnInRightScreen,X
    JSR Area_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result
    LDA Player_PosY
    AND #$0f
    BEQ @LAB_PRG15_MIRROR__e658
    INX
    LDY FirstColumnInRightScreen,X
    JSR Area_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result

  @LAB_PRG15_MIRROR__e658:                  ; [$e658]
    LDA Blocks_Result
    RTS

;============================================================================
; TODO: Document Area_CanPlayerMoveRight
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Z
;
; XREFS:
;     Player_CheckIfPassable
;============================================================================
Area_CanPlayerMoveRight:                    ; [$e65b]
    LDA Player_PosX_Block
    CLC
    ADC #$10
    STA Arg_PixelPosX
    BCS Area_CanMoveUp

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document Area_CanPlayerMoveAtY
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Area_CanPlayerMoveLeft
;============================================================================
Area_CanPlayerMoveAtY:                      ; [$e664]
    LDA Player_PosY
    STA Arg_PixelPosY
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_IsBlockImpassable
    STA Blocks_Result
    TXA
    CLC
    ADC #$10
    TAX
    JSR ScreenBuffer_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result
    LDA Player_PosY
    AND #$0f
    BEQ @_returnResult
    TXA
    CLC
    ADC #$10
    TAX
    JSR ScreenBuffer_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result

  @_returnResult:                           ; [$e68e]
    LDA Blocks_Result
    RTS

;============================================================================
; TODO: Document Area_CanPlayerMoveLeft
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Z
;
; XREFS:
;     Player_CheckIfPassable
;============================================================================
Area_CanPlayerMoveLeft:                     ; [$e691]
    LDA Player_PosX_Block
    SEC
    SBC #$01
    STA Arg_PixelPosX
    BCS Area_CanPlayerMoveAtY
    LDA Player_PosY
    LSR A
    LSR A
    LSR A
    LSR A
    TAX
    LDY LastColumnLeftScreen,X
    JSR Area_IsBlockImpassable
    STA Blocks_Result
    INX
    LDY LastColumnLeftScreen,X
    JSR Area_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result
    LDA Player_PosY
    AND #$0f
    BEQ @LAB_PRG15_MIRROR__e6c5
    INX
    LDY LastColumnLeftScreen,X
    JSR Area_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result

  @LAB_PRG15_MIRROR__e6c5:                  ; [$e6c5]
    LDA Blocks_Result
    RTS

;============================================================================
; TODO: Document Player_CheckIfPassable
;
; INPUTS:
;     X
;
; OUTPUTS:
;     Z
;
; XREFS:
;     Area_ScrollScreenDown
;     Player_CheckHandleClimbDown
;     Player_CheckHandleClimbMaybeSide
;     Player_CheckHandleClimbUp
;     Player_ContinueHandleClimbOrJump
;     Player_TryMoveLeft
;     Player_TryMoveRight
;============================================================================
Player_CheckIfPassable:                     ; [$e6c8]
    TXA
    BEQ Area_CanPlayerMoveLeft
    DEX
    BEQ Area_CanPlayerMoveRight
    DEX
    BEQ Area_CanPlayerMoveUp
    LDA Player_PosY
    CLC
    ADC #$20
    STA Arg_PixelPosY
    CMP #$d0
    BCC Area_CanMoveImmediatelyRight
    LDA Player_PosX_Block
    LSR A
    LSR A
    LSR A
    LSR A
    TAX
    LDY FirstRowBelowScreen,X
    JSR Area_IsBlockImpassable
    STA Blocks_Result
    LDA Player_PosX_Block
    AND #$0f
    BEQ @_returnResult
    INX
    LDY FirstRowBelowScreen,X
    JSR Area_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result

  @_returnResult:                           ; [$e6fc]
    LDA Blocks_Result
    RTS

;============================================================================
; TODO: Document Area_CanMoveImmediatelyRight
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Area_CanPlayerMoveUp
;     Player_CheckIfPassable
;============================================================================
Area_CanMoveImmediatelyRight:               ; [$e6ff]
    LDA Player_PosX_Block
    CLC
    ADC #$04
    STA Arg_PixelPosX
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_IsBlockImpassable
    STA Blocks_Result
    LDA Player_PosX_Block
    AND #$0f
    SEC
    SBC #$04
    CMP #$08
    BCS @_returnResult
    INX
    JSR ScreenBuffer_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result

  @_returnResult:                           ; [$e721]
    LDA Blocks_Result
    RTS

;============================================================================
; TODO: Document Area_CanPlayerMoveUp
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Z
;
; XREFS:
;     Player_CheckIfPassable
;============================================================================
Area_CanPlayerMoveUp:                       ; [$e724]
    LDA Player_PosY
    SEC
    SBC #$01
    STA Arg_PixelPosY
    CMP #$f0
    BCC Area_CanMoveImmediatelyRight
    LDA Player_PosX_Block
    LSR A
    LSR A
    LSR A
    LSR A
    TAX
    LDY LastRowAboveScreen,X
    JSR Area_IsBlockImpassable
    STA Blocks_Result
    LDA Player_PosX_Block
    AND #$0f
    BEQ @_returnResult
    INX
    LDY LastRowAboveScreen,X
    JSR Area_IsBlockImpassable
    ORA Blocks_Result
    STA Blocks_Result

  @_returnResult:                           ; [$e74f]
    LDA Blocks_Result
    RTS
;============================================================================
; TODO: Document Player_CheckIfOnLadder
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckHandleClimb
;============================================================================
Player_CheckIfOnLadder:                     ; [$e752]
    ;
    ; Build the target block pixel position to look up.
    ;
    ; This will offset the X by +7, which helps grab onto the block
    ; if just to the left of it.
    ;
    LDA Player_PosX_Block                   ; A = player X position
    CLC
    ADC #$07                                ; Add 7.
    STA Arg_PixelPosX                       ; Store the player's new X pixel
                                            ; position
    LDA Player_PosY                         ; Load the player's Y position
    STA Arg_PixelPosY                       ; Store the player's Y pixel
                                            ; position


    ;
    ; Check if the block at this position is climbable.
    ;
    JSR Area_ConvertPixelsToBlockPos        ; Convert to a block position.
    LDY ScreenBuffer,X                      ; Load the block at that
                                            ; position.
    JSR Area_GetBlockProperty               ; Load the block property for
                                            ; that block.
    STA Blocks_Result                       ; Store it.
    JSR Area_IsBlockClimbable               ; Check if it's climbable.
    BCS @_resetCanClimb


    ;
    ; The block is not climbable. Check if the player is
    ; overlapping a block to the right, and check that.
    ;
    LDA Player_PosX_Block                   ; A = player X position.
    AND #$0f
    CMP #$08
    BNE @_checkBlockBelow
    INX
    LDY ScreenBuffer,X
    JSR Area_GetBlockProperty
    STA Blocks_Result
    JSR Area_IsBlockClimbable
    BCS @_resetCanClimb

  @_checkBlockBelow:                        ; [$e783]
    LDA Player_PosX_Block
    CLC
    ADC #$07
    STA Arg_PixelPosX
    LDA Player_PosY
    CLC
    ADC #$1f
    STA Arg_PixelPosY
    JSR Area_ConvertPixelsToBlockPos
    LDY ScreenBuffer,X
    JSR Area_GetBlockProperty
    STA Blocks_Result
    JSR Area_IsBlockClimbable
    BCS @_resetCanClimb
    LDA Player_PosX_Block
    AND #$0f
    CMP #$08
    BNE @_resetCanClimb
    INX
    LDY ScreenBuffer,X
    JSR Area_GetBlockProperty
    STA Blocks_Result


    ;
    ; Reset the can-climb bit.
    ;
  @_resetCanClimb:                          ; [$e7b2]
    LDA Player_Flags                        ; Load the player's flags.
    AND #$f7                                ; Clear the can-climb bit.
    JSR Area_IsBlockClimbable               ; Is the current block climbable?
    BCC @_clearBit5AndReturn                ; If not, jump.


    ;
    ; Set the can-climb bit.
    ;
    ORA #$08                                ; Else, set the can-climbable
                                            ; bit.
    STA Player_Flags                        ; Set the ladder flag bit
    RTS

  @_clearBit5AndReturn:                     ; [$e7c0]
    AND #$ef                                ; Clear bit 5.
    STA Player_Flags                        ; Store it.
    RTS


;============================================================================
; Set state from the area at the other end of the door.
;
; This checks if the player is in front of a door (being
; careful to check any overlapping blocks) and then looks up
; the area at the other end of the door.
;
; If a matching door is found (one that maps to the current
; screen and block position), then a new screen index, start
; position, palette, and door key requirement for the
; current screen will be set. This prepares for switching to
; the new area.
;
; INPUTS:
;     Player_PosX_Block:
;         The X position of the player.
;
;     Player_PosY:
;         The Y position of the player.
;
; OUTPUTS:
;     Blocks_Result:
;         1 if a door could be entered.
;         0 if one could not.
;
;     Screen_StartPosYX:
;         The start position when switching to the new area.
;
;     Area_LoadingScreenIndex:
;         The new screen when switching to the new area.
;
;     Screen_DestPaletteOrIndex:
;         The new palette when switching to the new area.
;
;     CurrentDoor_KeyRequirement:
;         The key requirement for the matching doro when
;         switching to the new area.
;
;     Temp_Addr_L
;     Temp_Addr_U
;     Arg_PixelPosX:
;     Arg_PixelPosX:
;     Temp_BlockPos2
;         Clobbered.
;
; CALLS:
;     Area_ConvertPixelsToBlockPos
;     Area_GetBlockProperty
;
; XREFS:
;     Player_CheckHandleEnterDoor
;============================================================================
Area_SetStateFromDoorDestination:           ; [$e7c5]
    ;
    ; Convert the player position to a normalized block position.
    ;
    LDA Player_PosX_Block                   ; Load the player's full X
                                            ; position.
    CLC
    ADC #$07                                ; Add 7.
    STA Arg_PixelPosX                       ; Store as the X pixel position
                                            ; argument.
    LDA Player_PosY                         ; Load the player's full Y
                                            ; position.
    STA Arg_PixelPosY                       ; Store as the Y pixel position
                                            ; argument.
    JSR Area_ConvertPixelsToBlockPos        ; Conver to block positions.


    ;
    ; Load the block at this position from the screen and
    ; check what it is.
    ;
    LDY ScreenBuffer,X                      ; Load the block from the screen
                                            ; buffer.
    JSR Area_GetBlockProperty               ; Get the block property.
    CMP #$03                                ; Is it a door?
    BEQ @_blockIsDoor


    ;
    ; It's not a door. The player may still be near a door.
    ; Let's round to the nearest block to the right and check
    ; again.
    ;
    LDA Player_PosX_Block                   ; Load the player's full X
                                            ; position.
    AND #$0f                                ; Check the lower nibble.
    CMP #$08                                ; Is it on a full block boundary?
    BNE @_blockIsNotDoor                    ; _blockIsAir
    INX                                     ; Increment the block position.


    ;
    ; We normalized to the next overlapped block. Now check
    ; to see if it's a door.
    ;
    LDY ScreenBuffer,X                      ; Load the block at that
                                            ; position.
    JSR Area_GetBlockProperty               ; Load the block property.
    CMP #$03                                ; Is it a door?
    BEQ @_blockIsDoor                       ; If so, jump.


    ;
    ; The player was not standing in front of a door.
    ; Consider this block passable.
    ;
  @_blockIsNotDoor:                         ; [$e7f0]
    LDA #$00
    STA Blocks_Result                       ; Set the resulting block
                                            ; property as air.
    RTS


    ;
    ; The player is standing in front of a door.
    ;
    ; Check to see where they are.
    ;
  @_blockIsDoor:                            ; [$e7f5]
    LDA Area_CurrentArea                    ; Load the current region.
    CMP #$04                                ; Is this the area around
                                            ; Victim(?) ?
    BNE @LAB_PRG15_MIRROR__e7fe             ; If not, jump and continue on.


    ;
    ; We won't be handling anything in this area. We're done here.
    ;
    JMP SUB_RETURN_E5DA                     ; Else, we're done.

  @LAB_PRG15_MIRROR__e7fe:                  ; [$e7fe]
    LDA #$01
    STA Blocks_Result                       ; Mark the resulting block as
                                            ; solid by default.
    STX Temp_BlockPos                       ; Store our block X position
                                            ; temporarily.


    ;
    ; Get the location of the doors for this area and store
    ; the address for access below.
    ;
    LDA CurrentArea_DoorLocationsAddr       ; Load the lower byte of the
                                            ; doors address.
    STA Temp_Addr_L                         ; Store it temporarily.
    LDA CurrentArea_DoorLocationsAddr_U     ; Load the upper byte.
    STA Temp_Addr_U                         ; Store it temporarily.


    ;
    ; Switch to Bank 3 (level data).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$03
    JSR MMC1_UpdateROMBank                  ; Load bank 3.


    ;
    ; Check the byte stored in address stored starting at
    ; Temp_Addr_L to see if it's an air block or the screen
    ; index.
    ;
  @_doorCheckLoop:                          ; [$e815]
    LDY #$00                                ; Y = 0
    LDA (Temp_Addr_L),Y                     ; Load the first byte from the
                                            ; referenced address.
    CMP #$ff                                ; Is it 0xFF?
    BEQ @_returnAirBlock                    ; If so, consider this air and
                                            ; return.
    CMP Area_CurrentScreen                  ; Is it the current screen index?
    BNE @LAB_PRG15_MIRROR__e852             ; If not, jump.


    ;
    ; That was a match.
    ;
    ; Next, check the next byte in the address referenced by
    ; Temp_Addr_L to see if it's the stored block position
    ; from above (Temp_BlockPos).
    ;
    INY                                     ; Y++
    LDA (Temp_Addr_L),Y                     ; Load the next byte from the
                                            ; referenced address.
    CMP Temp_BlockPos                       ; Is it the block position we
                                            ; stored?
    BNE @LAB_PRG15_MIRROR__e852             ; If not, jump.


    ;
    ; That was a match too.
    ;
    ; Load the next byte referenced in Temp_Addr_L and store
    ; that
    ; as a block position in Temp_BlockPos2.
    ;
    INY                                     ; Y++
    LDA (Temp_Addr_L),Y                     ; Load the next byte from the
                                            ; referenced address.
    STA Temp_BlockPos2                      ; Store that byte as a temporary
                                            ; block position.


    ;
    ; Load the next byte from the address referenced in
    ; Temp_Addr_L and store as the area's start X/Y
    ; location (Screen_StartPosYX).
    ;
    INY                                     ; Y++
    LDA (Temp_Addr_L),Y                     ; Load the next byte from the
                                            ; referenced address.
    STA Screen_StartPosYX                   ; Store as the area's starting
                                            ; X/Y position.
    LDA Temp_BlockPos2                      ; A = Byte we had just stored up
                                            ; above.


    ;
    ; Check the current area. If it's around Mascon somewhere,
    ; we'll need to reduce the value by 32.
    ;
    ; TODO: Check why this is.
    ;
    LDY Area_CurrentArea                    ; Y = current area
    CPY #$03                                ; Is the current area 3?
    BNE @LAB_PRG15_MIRROR__e83d             ; If not, jump.


    ;
    ; We'll need to normalize the block position.
    ;
    SEC
    SBC #$20                                ; Reduce it by 32.

  @LAB_PRG15_MIRROR__e83d:                  ; [$e83d]
    ASL A                                   ; Multiply the block position by
                                            ; 4.
    ASL A


    ;
    ; Load state from the door destination at this block.
    ;
    ; We'll load the screen index, palette, and the key
    ; requirement.
    ;
    TAY                                     ; Y = A (block position)
    LDA (CurrentArea_DoorDestinationsAddr),Y ; Load the screen index from the
                                             ; door destination.
    STA Area_LoadingScreenIndex             ; Store it as the new screen
                                            ; index.
    INY                                     ; Y++
    LDA (CurrentArea_DoorDestinationsAddr),Y ; Load the palette from the door
                                             ; destination.
    STA Screen_DestPaletteOrIndex           ; Store it as the new palette.
    INY                                     ; Y++
    LDA (CurrentArea_DoorDestinationsAddr),Y ; Load the key requirement.
    STA a:CurrentDoor_KeyRequirement        ; Store it.
    JMP @_restoreBankAndReturn              ; We're done. Restore our bank
                                            ; and set our results.


    ;
    ; Skip the 4 bytes of information of the area at the other end
    ; of the door destination. We'll set up to process the next one.
    ;
  @LAB_PRG15_MIRROR__e852:                  ; [$e852]
    LDA Temp_Addr_L                         ; Load the lower byte of the door
                                            ; destination address we stored.
    CLC
    ADC #$04                                ; Add 4 (skip the information
                                            ; found on the other side of that
                                            ; door).
    STA Temp_Addr_L                         ; Store it back out.
    LDA Temp_Addr_U                         ; Load the upper byte of the
                                            ; address.
    ADC #$00                                ; Add the carry flag, if the
                                            ; lower byte overflowed.
    STA Temp_Addr_U                         ; Store it.
    JMP @_doorCheckLoop


    ;
    ; Consider this air.
    ;
  @_returnAirBlock:                         ; [$e862]
    LDA #$00
    STA Blocks_Result                       ; Set the resulting block
                                            ; property to 0 (air).


    ;
    ; Restore the previous ROM bank and return.
    ;
  @_restoreBankAndReturn:                   ; [$e866]
    PLA                                     ; Pop the previous bank from the
                                            ; stack.
    TAX                                     ; X = A (bank)
    JSR MMC1_UpdateROMBank                  ; Update to the bank.
    RTS


;============================================================================
; Convert a screen position from pixels to blocks.
;
; This will operate off of the stored PixelPosX and PixelPosY.
;
; INPUTS:
;     Arg_PixelPosX:
;         The X pixel position to convert.
;
;     Arg_PixelPosY:
;         The Y pixel position to convert.
;
; Outputs:
;     X:
;         The new block position.
;
; XREFS:
;     CastMagic_CheckDirection_CheckImpassable
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__854c
;     Player_CalculateVisibility
;     SpriteBehavior_NecronAides
;     Sprites_MoveRight__86c6
;     Area_CanMoveImmediatelyRight
;     Area_CanPlayerMoveAtY
;     Area_CheckCanClimbAdjacent
;     Area_SetStateFromDoorDestination
;     CastMagic_CalculateVisibility
;     Player_CheckIfOnLadder
;     Player_CheckOnBreakableBlock
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;     Player_UseMattock
;============================================================================
Area_ConvertPixelsToBlockPos:               ; [$e86c]
    LDA Arg_PixelPosY                       ; Load the stored Y coordinate
                                            ; for comparison
    AND #$f0                                ; Clear out the lower nibble
    STA Temp_00
    LDA Arg_PixelPosX                       ; Load the stored X coordinate
                                            ; for comparison
    LSR A                                   ; Convert X to block positions
    LSR A
    LSR A
    LSR A
    ORA Temp_00                             ; Include the Y block position
    TAX                                     ; Store in X and return
    RTS


;============================================================================
; Return whether a block at a given screen buffer index is impassable.
;
; INPUTS:
;     Y:
;         The index into the blocks table.
;
;     BLOCK_PROPERTY_IMPASSABLE_MAP:
;         A map of impassable blocks.
;
; OUTPUTS:
;     A:
;         1 if the block is impassable.
;         0 if it is passable.
;
; CALLS:
;     Area_GetBlockProperty
;
; XREFS:
;     CastMagic_CheckDirection_CheckImpassable
;     CurrentSprite_CanMoveInDirection
;     Sprites_MoveRight__86c6
;     Area_CanMoveImmediatelyRight
;     Area_CanPlayerMoveAtY
;     Area_CheckCanClimbAdjacent
;============================================================================
ScreenBuffer_IsBlockImpassable:             ; [$e87c]
    LDY ScreenBuffer,X                      ; Load the block at the given
                                            ; index, and fall through.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Return whether a block at a given block property index is impassable.
;
; INPUTS:
;     Y:
;         The index into the blocks table.
;
;     BLOCK_PROPERTY_IMPASSABLE_MAP:
;         A map of impassable blocks.
;
; OUTPUTS:
;     A:
;         1 if the block is impassable.
;         0 if it is passable.
;
; CALLS:
;     Area_GetBlockProperty
;
; XREFS:
;     Area_CanMoveUp
;     Area_CanPlayerMoveLeft
;     Area_CanPlayerMoveUp
;     Player_CheckIfPassable
;============================================================================
Area_IsBlockImpassable:                     ; [$e87f]
    JSR Area_GetBlockProperty               ; Get the property of the
                                            ; provided block, and fall
                                            ; through.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Return whether a block property is an impassable type.
;
; INPUTS:
;     A:
;         The block property type.
;
;     BLOCK_PROPERTY_IMPASSABLE_MAP:
;         The map of impassable block properties.
;
; OUTPUTS:
;     A:
;         1 if the block is impassable.
;         0 if it is passable.
;
; XREFS:
;     Area_IsBlockImpassableOrLadder
;============================================================================
Area_GetFromImpassableMap:                  ; [$e882]
    TAY                                     ; Y = A
    LDA BLOCK_PROPERTY_IMPASSABLE_MAP,Y     ; A = Impassable flag for the
                                            ; block property type.
    RTS                                     ; And return it.


;============================================================================
; Return whether a block at the given screen buffer index is impassable or a
; ladder.
;
; INPUTS:
;     X:
;         The index within the screen buffer, for
;         getting the block property index.
;
;     BLOCK_PROPERTY_IMPASSABLE_MAP:
;         A map of impassable block types.
;
; OUTPUTS:
;     A:
;         1 if the block is impassable or a ladder.
;         0 if it is passable.
;
; CALLS:
;     Area_GetBlockProperty
;
; XREFS:
;     FUN_PRG14__854c
;============================================================================
Area_IsBlockImpassableOrLadder:             ; [$e887]
    LDY ScreenBuffer,X                      ; Load the block property offset
                                            ; from the screen buffer at X.
    JSR Area_GetBlockProperty               ; Load the block property.
    CMP #$02                                ; Is it a ladder?
    BNE Area_GetFromImpassableMap           ; If not a ladder, look up from
                                            ; the passable map.


    ;
    ; This is a ladder.
    ;
    LDA #$01                                ; Return true.
    RTS


;============================================================================
; DEADCODE: Set whether a block is truly air.
;
; This loads the specified block property and then
; determines if it's actually air. This will be stored in
; Blocks_Result.
;
; INPUTS:
;     X:
;         The index into the screen buffer.
;
; OUTPUTS:
;     Blocks_Result:
;         The result of the check.
;
;         1 for solid-like.
;         0 for air-like.
;
; CALLS:
;     Area_GetBlockProperty
;============================================================================
Area_StoreBlockIsAir:                       ; [$e894]
    ;
    ; Load the block property at this screen buffer offset.
    ;
    LDY ScreenBuffer,X                      ; Y = block property at screen
                                            ; buffer X
    JSR Area_GetBlockProperty               ; Load the block property.
    STA Blocks_Result                       ; Store that in a temporary
                                            ; variable.


    ;
    ; Check if this is a solid block.
    ;
    CMP #$01                                ; Is it solid?
    BEQ @_blockIsSolid                      ; If so, then jump.


    ;
    ; Check if this is a ladder.
    ;
    CMP #$02                                ; Is it a ladder?
    BEQ @_blockIsSolid                      ; If so, then jump.


    ;
    ; Check if this is a block transitioning to another screen.
    ;
    CMP #$0a                                ; Is this a transition to a
                                            ; screen?
    BEQ @_blockIsSolid                      ; If so, then jump.


    ;
    ; It's not solid. Store a result of 0 (air).
    ;
    LDA #$00
    STA Blocks_Result                       ; Set result = 0.
    RTS


    ;
    ; It is solid. Store a result of 1 (solid).
    ;
  @_blockIsSolid:                           ; [$e8ad]
    LDA #$01
    STA Blocks_Result                       ; Set result = 1.
    RTS


;============================================================================
; Determine if the current block is climbable.
;
; This will check the provided block property (stored in
; a temp variable) and check if it can be climbed.
;
; INPUTS:
;     Blocks_Result:
;         The block property to check.
;
; OUTPUTS:
;     C:
;         1 if it's climbable.
;         0 if it is not.
;
; XREFS:
;     Player_CheckIfOnLadder
;============================================================================
Area_IsBlockClimbable:                      ; [$e8b2]
    PHA                                     ; Push A to the stack.
    LDA Blocks_Result                       ; Load the block property
                                            ; provided in the temp variable.
    CMP #$02                                ; Is it a ladder?
    BEQ @_isLadder                          ; If so, jump.
    CMP #$0a                                ; TODO: Is it... something else
                                            ; ladder-like?
    BNE @_isNotLadder                       ; If not, jump.


    ;
    ; This is a ladder.
    ;
  @_isLadder:                               ; [$e8bd]
    PLA                                     ; Pop A.
    SEC                                     ; Set carry to 1 as a truthy
                                            ; result.
    RTS

  @_isNotLadder:                            ; [$e8c0]
    PLA                                     ; Pop A.
    CLC                                     ; Set carry to 0 as a falsy
                                            ; result.
    RTS


;============================================================================
; Return the block property referenced at the given screen buffer index.
;
; This will load the block property referenced in the screen
; buffer and then fall through to
; Area_GetBlockProperty.
;
; Block properties are stored with upper and lower nibbles
; representing different blocks. This will look up the
; appropriate block property based on whether the provided
; index is even or odd, and return a value with just a lower
; nibble set based on the properties.
;
; INPUTS:
;     X:
;         The index into the screen buffer.
;
;     BlockProperties:
;         The block properties to load from.
;
; OUTPUTS:
;     A:
;         A byte containing the property.
;
; XREFS:
;     CurrentSprite_CalculateVisibility
;     Player_CalculateVisibility
;     SpriteBehavior_NecronAides
;     CastMagic_CalculateVisibility
;     Player_CheckSwitchScreen
;============================================================================
ScreenBuffer_LoadBlockProperty:             ; [$e8c3]
    LDY ScreenBuffer,X                      ; Load the block property index
                                            ; from the screen buffer.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Return the block property at the given index.
;
; Block properties are stored with upper and lower nibbles
; representing different blocks. This will look up the
; appropriate block property based on whether the provided
; index is even or odd, and return a value with just a lower
; nibble set based on the properties.
;
; INPUTS:
;     Y:
;         The index into the block properties.
;
;     BlockProperties:
;         The block properties to load from.
;
; OUTPUTS:
;     A:
;         A byte containing the property.
;
; XREFS:
;     Area_IsBlockImpassable
;     Area_IsBlockImpassableOrLadder
;     Area_SetStateFromDoorDestination
;     Area_StoreBlockIsAir
;     Player_CheckIfOnLadder
;     Player_CheckOnBreakableBlock
;     Player_CheckPushingBlock
;============================================================================
Area_GetBlockProperty:                      ; [$e8c6]
    TYA                                     ; A = Y
    LSR A                                   ; Y = even block offset based on
                                            ; the index.
    TAY                                     ; Y = A
    BCC @_isEven                            ; Check whether this is even or
                                            ; odd.


    ;
    ; Load the block property at the index, moving the data in
    ; the upper nibble to the lower nibble.
    ;
    LDA BlockProperties,Y                   ; Load the block property at the
                                            ; index.
    LSR A                                   ; Shift to the lower nibble.
    LSR A
    LSR A
    LSR A
    RTS


    ;
    ; Load the block property, masking out the upper nibble.
    ;
  @_isEven:                                 ; [$e8d3]
    LDA BlockProperties,Y                   ; Load the block property at the
                                            ; index.
    AND #$0f                                ; Mask out the upper nibble,
                                            ; giving just the lower.
    RTS


;============================================================================
; Map of block property IDs to impassibility flags.
;
; XREFS:
;     Area_GetFromImpassableMap
;============================================================================

;
; XREFS:
;     Area_GetFromImpassableMap
;
BLOCK_PROPERTY_IMPASSABLE_MAP:              ; [$e8d9]
    .byte $00                               ; [0]: Air
    .byte $01                               ; [1]: Solid
    .byte $00                               ; [2]: Ladder
    .byte $00                               ; [3]: Door
    .byte $00                               ; [4]: Foreground
    .byte $01                               ; [5]: Breakable floor
    .byte $01                               ; [6]: Pushable
    .byte $01                               ; [7]: ??
    .byte $01                               ; [8]: ??
    .byte $00                               ; [9]: Maybe: Transition down
    .byte $00                               ; [10]: Maybe: Transition up
    .byte $01                               ; [11]: Breakable by Mattock
    .byte $00                               ; [12]: Area transition
                                            ; left-to-right
    .byte $00                               ; [13]: Area transition
                                            ; right-to-left
    .byte $00                               ; [14]: ??
    .byte $00                               ; [15]: ??


;============================================================================
; Begin scrolling to an adjacent room.
;
; This will begin clearing out state for the current room
; and then begin scrolling to the next in the given
; direction.
;
; INPUTS:
;     Areas_DefaultMusic:
;         The default music for the current area.
;
;     CurrentScreen_SpecialEventID:
;         The event ID for the current screen being
;         scrolled from.
;
; OUTPUTS:
;     CastMagic_Type:
;         The cast magic type, reset to 0xFF.
;
;     InterruptCounter:
;         The interrupt counter, reset to 0.
;
;     Player_MovementTick:
;         The player movement tick, reset to 0.
;
; CALLS:
;     Area_LoadScrollDataRight
;
; XREFS:
;     Area_ScrollScreenDown
;     Area_ScrollScreenUp
;     Player_CheckHandleClimbUp
;     Player_MoveDownScreen
;     Player_TryMoveLeft
;     Player_TryMoveRight
;============================================================================
Area_ScrollTo:                              ; [$e8e9]
    LDA a:CurrentScreen_SpecialEventID      ; Load the current screen's event
                                            ; ID.
    AND #$7f                                ; Keep the numeric ID.
    CMP #$01                                ; Is it 1 (boss room)?
    BNE @_clearStates                       ; If not, jump.


    ;
    ; The player is scrolling from a boss room. Reset the music
    ; back to the default music for the area.
    ;
    LDA a:Areas_DefaultMusic                ; Load the default music for the
                                            ; area.
    STA Music_Current                       ; Set as the current music.

  @_clearStates:                            ; [$e8f7]
    LDA #$00                                ; A = 0
    STA Player_MovementTick                 ; Set player movement tick to 0.
    STA InterruptCounter                    ; Set interrupt counter to 0.


    ;
    ; Clear any cast magic.
    ;
    LDA #$ff                                ; A = 0xFF (unset)
    STA a:CastMagic_Type                    ; Set as the magic type on
                                            ; screen.
    JMP Area_LoadScrollDataRight            ; Now scroll to the room.


;============================================================================
; Check if the player is on a breakable block.
;
; This will check the blocks below the player to see if
; they're on a breakable block. If so, the block breaking
; logic will activate.
;
; This is not checked on every frame.
;
; INPUTS:
;     InterruptCounter:
;         The current interrupt counter.
;
;     Player_Flags:
;         The player's current flags, used to determine
;         the facing direction.
;
;     Player_PosX_Block:
;         The player's current X position in blocks.
;
;     Player_PosY:
;         The player's current Y position.
;
; OUTPUTS:
;     Arg_PixelPosX:
;     Arg_PixelPosY:
;     Blocks_Result:
;         Clobbered.
;
; CALLS:
;     Area_ConvertPixelsToBlockPos
;     Area_GetBlockProperty
;     Area_HandleBreakableFloor
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckOnBreakableBlock:               ; [$e905]
    ;
    ; Only check for falling periodically.
    ;
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$07                                ; Are we ready to check for
                                            ; falling?
    BNE @_return                            ; If not, return.


    ;
    ; Begin checking against a block 32 pixels down.
    ;
    LDA Player_PosY                         ; A = Player's Y position.
    CLC
    ADC #$20                                ; A += 32
    STA Arg_PixelPosY                       ; Store as the Y argument for
                                            ; block checks.
    CMP #$f0                                ; Is it >= 0xEF? (one block below
                                            ; the screen)
    BCS @_return                            ; If so, stop falling.


    ;
    ; The player may be permitted to fall. Check the block
    ; it's on.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$40                                ; Keep only the facing bit.
    ROL A                                   ; Shift this into bit 0.
    ROL A
    ROL A
    AND #$01                                ; Mask out everything else.
    PHA                                     ; Push it to the stack.


    ;
    ; Check the first block the player is overlapping.
    ;
    TAX                                     ; X = facing value.
    LDA Player_PosX_Block                   ; A = Player X position.
    CLC
    ADC @_CHECK_BREAKABLE_BLOCK_X_OFFSETS,X ; Load a block offset to round to
                                            ; the nearest overlapping blocks.
    STA Arg_PixelPosX                       ; Store as the X position to
                                            ; check.
    JSR Area_ConvertPixelsToBlockPos        ; Convert it to a block position.
    LDY ScreenBuffer,X                      ; Load the block value from the
                                            ; screen.
    STY Blocks_Result                       ; Store as the block result.
    JSR Area_GetBlockProperty               ; And get its corresponding
                                            ; property.
    CMP #$05                                ; Is it 5 (breakable floor)?
    BNE @_checkNextBlock                    ; If not, check the next
                                            ; overlapping block.
    PLA                                     ; Pop the facing bit from the
                                            ; stack.
    JMP Area_HandleBreakableFloor           ; Handle breakable floor logic.


    ;
    ; Check the second block the player is overlapping.
    ;
  @_checkNextBlock:                         ; [$e93c]
    PLA                                     ; Pop the facing bit from the
                                            ; stack.
    EOR #$01                                ; XOR the facing bit to check the
                                            ; other direction.
    TAX                                     ; X = A
    LDA Player_PosX_Block                   ; A = Player X position.
    CLC
    ADC @_CHECK_BREAKABLE_BLOCK_X_OFFSETS,X ; Load a block offset to round to
                                            ; the next overlapping blocks.
    STA Arg_PixelPosX                       ; Store as the X position to
                                            ; check.
    JSR Area_ConvertPixelsToBlockPos        ; Convert it to a block position.
    LDY ScreenBuffer,X                      ; Load the block value from the
                                            ; screen.
    STY Blocks_Result                       ; Store as the block result.
    JSR Area_GetBlockProperty
    CMP #$05                                ; Is it 5 (breakable floor)?
    BNE @_return                            ; If not, return.
    JMP Area_HandleBreakableFloor           ; Handle breakable floor logic.

  @_return:                                 ; [$e95a]
    RTS


;============================================================================
; Map of facing bit values to block X offsets for checking breakable blocks.
;
; XREFS:
;     Player_CheckOnBreakableBlock
;============================================================================
  @_CHECK_BREAKABLE_BLOCK_X_OFFSETS:        ; [$e95b]
    .byte $04                               ; [0]: Facing left
    .byte $0c                               ; [1]: Facing right

;============================================================================
; TODO: Document Player_CheckPushingBlock
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckPushingBlock:                   ; [$e95d]
    LDA Joy1_ButtonMask
    AND #$03
    BEQ @LAB_PRG15_MIRROR__e9b9
    LDA a:SpecialItems
    AND #$40
    BEQ @LAB_PRG15_MIRROR__e9b9
    LDA a:Quests
    AND #$07
    CMP #$07
    BNE @LAB_PRG15_MIRROR__e9b9
    LDA Player_Flags
    AND #$40
    ROL A
    ROL A
    ROL A
    AND #$01
    TAX
    LDA Player_PosY
    STA Arg_PixelPosY
    LDA Player_PosX_Block
    CLC
    ADC BYTE_ARRAY_PRG15_MIRROR__e9be,X
    STA Arg_PixelPosX


    ;
    ; Fetch the block property at this position.
    ;
    JSR Area_ConvertPixelsToBlockPos
    LDY ScreenBuffer,X
    JSR Area_GetBlockProperty


    ;
    ; Check if the block is pushable. If so, we'll handle it.
    ;
    CMP #$06
    BNE @LAB_PRG15_MIRROR__e9b9


    ;
    ; This is pushable. Increase the push counter.
    ;
    ; We'll play a sound when we hit 0x3F, and finish pushing
    ; after 0x60.
    ;
    INC BlockPushCounter
    LDA BlockPushCounter
    CMP #$3f
    BNE @LAB_PRG15_MIRROR__e9a3
    LDA #$0f
    JSR Sound_PlayEffect

  @LAB_PRG15_MIRROR__e9a3:                  ; [$e9a3]
    LDA BlockPushCounter
    CMP #$60
    BCC @_return
    LDA #$01
    STA PathToMascon_Opening
    STX PathToMascon_FountainCoverPos
    LDA Joy1_ButtonMask
    LSR A
    AND #$01
    TAX
    JMP Game_OpenPathToMascon

  @_return:                                 ; [$e9b8]
    RTS

  @LAB_PRG15_MIRROR__e9b9:                  ; [$e9b9]
    LDA #$00
    STA BlockPushCounter
    RTS

;
; XREFS:
;     Player_CheckPushingBlock
;
BYTE_ARRAY_PRG15_MIRROR__e9be:              ; [$e9be]
    .byte $ff                               ; [0]:
    .byte $10                               ; [1]:
;============================================================================
; TODO: Document Player_CheckSwitchScreen
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_UpdatePlayer
;============================================================================
Player_CheckSwitchScreen:                   ; [$e9c0]
    ;
    ; Check the current block the player is on.
    ;
    LDA Player_PosY
    STA Arg_PixelPosY
    LDA Player_PosX_Block
    STA Arg_PixelPosX
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_LoadBlockProperty
    CMP #$09
    BEQ @LAB_PRG15_MIRROR__e9de
    CMP #$0a
    BEQ @LAB_PRG15_MIRROR__e9de
    CMP #$0d
    BEQ @LAB_PRG15_MIRROR__e9de
    CMP #$0c
    BNE @_return


    ;
    ; Check the next block.
    ;
  @LAB_PRG15_MIRROR__e9de:                  ; [$e9de]
    LDA Player_PosX_Block
    CLC
    ADC #$0f
    STA Arg_PixelPosX
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_LoadBlockProperty
    CMP #$09
    BEQ @LAB_PRG15_MIRROR__e9fb
    CMP #$0a
    BEQ @LAB_PRG15_MIRROR__e9fb
    CMP #$0d
    BEQ @LAB_PRG15_MIRROR__e9fb
    CMP #$0c
    BNE @_return


    ;
    ; Check if this is a horizontal transition block. If so,
    ; switch the area.
    ;
  @LAB_PRG15_MIRROR__e9fb:                  ; [$e9fb]
    CMP #$0c
    BEQ Player_CheckSwitchScreen_SwitchAreaHoriz
    CMP #$0d
    BEQ Player_CheckSwitchScreen_SwitchAreaHoriz


    ;
    ; This is a vertical transition block. Switch the
    ; area.
    ;
    LDA Area_CurrentArea
    ASL A
    TAX
    LDA AREA_SCREEN_COMPARATORS,X
    STA Temp_Addr_L
    LDA AREA_SCREEN_COMPARATORS+1,X
    STA Temp_Addr_U
    LDY #$00

  @LAB_PRG15_MIRROR__ea13:                  ; [$ea13]
    LDA (Temp_Addr_L),Y
    CMP #$ff
    BEQ @_return
    CMP Area_CurrentScreen
    BNE @LAB_PRG15_MIRROR__ea2f
    INY
    LDA (Temp_Addr_L),Y
    STA Area_LoadingScreenIndex
    INY
    LDA (Temp_Addr_L),Y
    STA Screen_StartPosYX
    INY
    LDA (Temp_Addr_L),Y
    STA Screen_DestPaletteOrIndex
    JMP Game_SetupEnterScreen

  @LAB_PRG15_MIRROR__ea2f:                  ; [$ea2f]
    INY
    INY
    INY
    INY
    JMP @LAB_PRG15_MIRROR__ea13

  @_return:                                 ; [$ea36]
    RTS

;
; XREFS:
;     Player_CheckSwitchScreen
;
AREA_SCREEN_COMPARATORS:                    ; [$ea37]
    pointer BYTE_PRG15_MIRROR__ea4f         ; Eolis
    pointer BYTE_PRG15_MIRROR__ea47         ; Apolune
    pointer BYTE_PRG15_MIRROR__ea4f         ; Forepaw
    pointer BYTE_PRG15_MIRROR__ea4f         ; Mascon
    pointer BYTE_PRG15_MIRROR__ea4f         ; Victim
    pointer BYTE_PRG15_MIRROR__ea4f         ; Conflate
    pointer BYTE_PRG15_MIRROR__ea4f         ; Daybreak
    pointer BYTE_PRG15_MIRROR__ea4f         ; Evil Fortress

BYTE_PRG15_MIRROR__ea47:                    ; [$ea47]
    .byte $0c                               ; Current screen comparator
    .byte $16                               ; New screen index
    .byte $b3                               ; Y, X
    .byte $06                               ; Area
    .byte $16                               ; Current screen comparator
    .byte $0c                               ; New screen index
    .byte $2d                               ; Y, X
    .byte $06                               ; Area

;
; XREFS:
;     AREA_SCREEN_COMPARATORS
;     [$PRG15_MIRROR::ea37]
;
BYTE_PRG15_MIRROR__ea4f:                    ; [$ea4f]
    .byte $ff                               ; [$ea4f] byte


;============================================================================
; Begin exiting a building.
;
; This will face the player to the right and begin playing the
; music in the outside world.
;
; It will then proceed to set up state for the outside area.
;
; INPUTS:
;     Player_Flags:
;         The current player's flags.
;
;     Area_Music_Outside:
;         The music played outside in this area.
;
; OUTPUTS:
;     Player_Flags:
;         The updated player's flags, facing right.
;
;     Areas_DefaultMusic:
;         The updated music to play.
;
; CALLS:
;     Game_SetupExitBuilding
;
; XREFS:
;     Player_CheckSwitchScreen_SwitchAreaHoriz
;     Player_EnterDoorToInside
;============================================================================
Game_BeginExitBuilding:                     ; [$ea50]
    ;
    ; Face the player to the right.
    ;
    LDA Player_Flags                        ; Load the player flags.
    ORA #$40                                ; Face the player right.
    STA Player_Flags                        ; Store the flags.
    LDA a:Area_Music_Outside                ; Load the music used outside the
                                            ; building.
    STA a:Areas_DefaultMusic                ; Set as the music to play.
    JMP Game_SetupExitBuilding              ; Jump to finish the
                                            ; exit-building logic.
;============================================================================
; TODO: Document Player_CheckSwitchScreen_SwitchAreaHoriz
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckSwitchScreen
;============================================================================
Player_CheckSwitchScreen_SwitchAreaHoriz:   ; [$ea5f]
    ;
    ; Check if the player is in the area of Victim.
    ;
    LDA Area_CurrentArea
    CMP #$04
    BEQ Game_BeginExitBuilding
    ASL A
    TAY
    LDA AREA_TOWN_TRANSITIONS_DATA,Y
    STA Temp_Addr_L
    LDA AREA_TOWN_TRANSITIONS_DATA+1,Y
    STA Temp_Addr_U
    LDY #$00

  @LAB_PRG15_MIRROR__ea73:                  ; [$ea73]
    LDA (Temp_Addr_L),Y
    CMP #$ff
    BEQ @_return
    CMP Area_CurrentScreen
    BNE @LAB_PRG15_MIRROR__ea94
    INY
    LDA (Temp_Addr_L),Y
    STA Area_CurrentArea
    INY
    LDA (Temp_Addr_L),Y
    STA Area_LoadingScreenIndex
    INY
    LDA (Temp_Addr_L),Y
    STA Screen_StartPosYX
    INY
    LDA (Temp_Addr_L),Y
    STA Screen_DestPaletteOrIndex
    JMP Game_SetupNewArea

  @LAB_PRG15_MIRROR__ea94:                  ; [$ea94]
    TYA
    CLC
    ADC #$05
    TAY
    BCC @LAB_PRG15_MIRROR__ea73

  @_return:                                 ; [$ea9b]
    RTS

;
; XREFS:
;     Player_CheckSwitchScreen_SwitchAreaHoriz
;
AREA_TOWN_TRANSITIONS_DATA:                 ; [$ea9c]
    pointer TOWN_TRANSITIONS_EMPTY          ; [0]: Eolis
    pointer TOWN_TRANSITIONS_TRUNK          ; [1]: Trunk
    pointer TOWN_TRANSITIONS_MIST           ; [2]: Mist
    pointer TOWN_TRANSITIONS_TOWNS          ; [3]: Towns
    pointer TOWN_TRANSITIONS_EMPTY          ; [4]: Buildings
    pointer TOWN_TRANSITIONS_BRANCH         ; [5]: Branch
    pointer TOWN_TRANSITIONS_DARTMOOR       ; [6]: Dartmoor
    pointer TOWN_TRANSITIONS_EMPTY          ; [7]: Zenis

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::ea9e]
;
TOWN_TRANSITIONS_TRUNK:                     ; [$eaac]
    .byte $00                               ; [$eaac] byte

    .byte AREA_TOWNS
    .byte $02,$92                           ; [$eaae] byte

    .byte PALETTE_TOWN
    .byte $07                               ; Entering Trunk from Trunk
                                            ; (screen 7)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $00                               ;   |-> Screen index 0
    .byte $92                               ;   |-> Start position Y=9, X=2
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $08                               ; [$eab6] byte

    .byte AREA_TOWNS
    .byte $01,$9e                           ; [$eab8] byte

    .byte PALETTE_TOWN
    .byte $1a                               ; Entering Trunk from Trunk
                                            ; (screen 26)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $02                               ;   |-> Screen index 2
    .byte $92                               ;   |-> Start position X=2, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $1d                               ; [$eac0] byte

    .byte AREA_TOWNS
    .byte $03,$9e                           ; [$eac2] byte

    .byte PALETTE_TOWN
    .byte $ff                               ; [$eac5] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa2]
;
TOWN_TRANSITIONS_TOWNS:                     ; [$eac6]
    .byte $00                               ; Exiting left from Apolune
                                            ; screen 0
    .byte AREA_TRUNK                        ;   |-> Switch to area 1
    .byte $07                               ;   |-> Screen index 6
    .byte $7e                               ;   |-> Start position Y=7, X=14
    .byte PALETTE_OUTSIDE                   ;   '-> Palette 6
    .byte $01                               ; Exit right from Apolune screen
                                            ; 1
    .byte AREA_TRUNK                        ;   |-> Switch to area 1
    .byte $08                               ;   |-> Screen index 8
    .byte $71                               ;   |-> Start position Y=7, X=1
    .byte PALETTE_OUTSIDE                   ;   '-> Palette 6
    .byte $02                               ; Exiting left from Forepaw to
                                            ; Trunk (screen 2)
    .byte AREA_TRUNK                        ;   |-> Switch to area 1
    .byte $1a                               ;   |-> Screen index 26
    .byte $7e                               ;   |-> Start position X=14, Y=7
    .byte PALETTE_OUTSIDE                   ;   '-> Palette 6
    .byte $03                               ; Exiting right from Forepaw to
                                            ; Branch (screen 3)
    .byte AREA_TRUNK                        ;   |-> Switch to area 3
    .byte $1d                               ;   |-> Screen index 29
    .byte $71                               ;   |-> Start position X=1, Y=7
    .byte PALETTE_OUTSIDE                   ;   |-> Palette 6
    .byte $04                               ; Exiting left from Mascon to
                                            ; Mist (screen 4)
    .byte AREA_MIST                         ;   |-> Switch to area 2
    .byte $09                               ;   |-> Screen index 9
    .byte $9e                               ;   |-> Start position X=14, Y=9
    .byte PALETTE_MIST                      ;   '-> Palette 10
    .byte $05                               ; Exiting right from Mascon to
                                            ; Mist (screen 5)
    .byte AREA_MIST                         ;   |-> Switch to area 2
    .byte $0c                               ;   |-> Screen index 12
    .byte $91                               ;   |-> Start position X=1, Y=9
    .byte PALETTE_MIST                      ;   '-> Palette 10
    .byte $06                               ; Exit left from Victim to Mist
                                            ; from screen 6
    .byte AREA_MIST                         ;   |-> Switch to area 2
    .byte $22                               ;   |-> Screen index 34
    .byte $9e                               ;   |-> Start position X=14, Y=9
    .byte PALETTE_MIST                      ;   '-> Palette 10
    .byte $07                               ; Exit right from Victim to Mist
                                            ; on screen 7
    .byte AREA_MIST                         ;   |-> Switch to area 7
    .byte $25                               ;   |-> Screen index = 37
    .byte $91                               ;   |-> Start position X=1, Y=9
    .byte PALETTE_MIST                      ;   '-> Palette 10
    .byte $08                               ; Exit left from Conflate to
                                            ; Branch
    .byte AREA_BRANCH                       ;   |-> Switch to area 5
    .byte $0d                               ;   |-> Screen index 13
    .byte $7e                               ;   |-> Start position X=14, Y=7
    .byte PALETTE_BRANCH                    ;   '-> Palette 8
    .byte $0a                               ; Exit left from Daybreak to
                                            ; Branch
    .byte AREA_BRANCH                       ;   |-> Switch to area 5
    .byte $23                               ;   |-> Screen index 35
    .byte $7e                               ;   |-> Start position X=14, Y=7
    .byte PALETTE_BRANCH                    ;   '-> Palette 8
    .byte $0b                               ; Exit right from Daybreak to
                                            ; Branch
    .byte AREA_BRANCH                       ;   |-> Switch to area 5
    .byte $24                               ;   |-> Screen index 36
    .byte $71                               ;   |-> Start position X=1, Y=7
    .byte PALETTE_BRANCH                    ;   '-> Palette 8
    .byte $0c                               ; Exit left from Dartmoor to
                                            ; Branch (screen 12)
    .byte AREA_DARTMOOR                     ;   |-> Switch to area 6
    .byte $03                               ;   |-> Screen index 3
    .byte $7e                               ;   |-> Start position X=14, Y=7
    .byte PALETTE_DARTMOOR                  ;   '-> Palette 12
    .byte $ff                               ; [$eb02] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa0]
;
TOWN_TRANSITIONS_MIST:                      ; [$eb03]
    .byte $09                               ; Entering Mascon from Mist
                                            ; (screen 9)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $04                               ;   |-> Screen index 4
    .byte $91                               ;   |-> Start position X=1, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $0c                               ; Entering left to Mascon from
                                            ; Mist
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $05                               ;   |-> Screen index 5
    .byte $9e                               ;   |-> Start position X=14, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $22                               ; Enering right to Victim from
                                            ; Mist (screen 34)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $06                               ;   |-> Screen index 6
    .byte $91                               ;   |-> Start position X=1, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $25                               ; Entering left to Victim from
                                            ; Mist (screen 37)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $07                               ;   |-> Screen index 7
    .byte $9e                               ;   |-> Start position X=14, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $ff                               ; [$eb17] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa6]
;
TOWN_TRANSITIONS_BRANCH:                    ; [$eb18]
    .byte $0d                               ; Entering right to Conflate from
                                            ; Branch (screen 13)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $08                               ;   |-> Screen index 8
    .byte $91                               ;   |-> Start position X=1, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $23                               ; Entering Daybreak from Branch
                                            ; (screen 35)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $0a                               ;   |-> Screen index 10
    .byte $92                               ;   |-> Start position X=2, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $24                               ; Entering Daybreak from Branch
                                            ; (screen 36)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $0b                               ;   |-> Screen index 11
    .byte $9e                               ;   |-> Start position X=14, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $ff                               ; [$eb27] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa8]
;
TOWN_TRANSITIONS_DARTMOOR:                  ; [$eb28]
    .byte $03                               ; Entering right to Dartmoor from
                                            ; Branch (screen 3)
    .byte AREA_TOWNS                        ;   |-> Switch to area 3
    .byte $0c                               ;   |-> Screen index 12
    .byte $92                               ;   |-> Start position X=2, Y=9
    .byte PALETTE_TOWN                      ;   '-> Palette 27
    .byte $ff                               ; [$eb2d] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::ea9c]
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa4]
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaaa]
;
TOWN_TRANSITIONS_EMPTY:                     ; [$eb2e]
    .byte $ff                               ; [$eb2e] byte


;============================================================================
; Run the door requirement handler function for the current door.
;
; This will look up the door requirement handler function
; corresponding to CurrentDoor_KeyRequirement and run it,
; checking that the requirements for the door have been met.
; The Checks and behavior are entirely up to that function.
;
; INPUTS:
;     CurrentDoor_KeyRequirement:
;         The key requirement for the current door.
;
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS:
;         The lookup table of door requirement handlers.
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToOutside
;============================================================================
Game_RunDoorRequirementHandler:             ; [$eb2f]
    LDA a:CurrentDoor_KeyRequirement
    BEQ RETURN_EB3E
    ASL A
    TAY
    LDA DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS+1,Y
    PHA
    LDA DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS,Y
    PHA

;============================================================================
; TODO: Document RETURN_EB3E
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb3f]
;     Game_RunDoorRequirementHandler
;============================================================================
RETURN_EB3E:                                ; [$eb3e]
    RTS


;============================================================================
; A mapping of door requirement lookup function addresses.
;
; XREFS:
;     Game_RunDoorRequirementHandler
;============================================================================

;
; XREFS:
;     Game_RunDoorRequirementHandler
;
DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS:         ; [$eb3f]
    pointer RETURN_EB3E-1                   ; [0]: [0]: No key, return
    pointer Game_OpenDoorWithAKey-1         ; [0]: [1]: "A" Key
    pointer Game_OpenDoorWithKKey-1         ; [0]: [2]: "K" Key
    pointer Game_OpenDoorWithQKey-1         ; [0]: [3]: "Q" Key
    pointer Game_OpenDoorWithJKey-1         ; [0]: [4]: "J" Key
    pointer Game_OpenDoorWithJoKey-1        ; [0]: [5]: "Jo" Key
    pointer Game_OpenDoorWithRingOfElf-1    ; [0]: [6]: Ring of Elf
    pointer Game_OpenDoorWithRingOfDworf-1  ; [0]: [7]: Ring of Dworf
    pointer Game_OpenDoorWithDemonsRing-1   ; [0]: [8]: Demon's Ring


;============================================================================
; Attempt to open a door marked with the "A" Key.
;
; This will check if the player has the "A" Key, and
; if they do, the door will be unlocked and entered.
; The key will be consumed.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb41]
;============================================================================
Game_OpenDoorWithAKey:                      ; [$eb51]
    LDA a:SelectedItem                      ; Load the selected item.
    CMP #$04                                ; Is this the "A" Key?
    BEQ Game_UnlockDoorWithUsableItem       ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7D (via jump to IScripts_Begin).
    ;
    LDA #$7d                                ; 0x7D == "A" Key required
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$eb60]
    RTS


;============================================================================
; Attempt to open a door marked with the "K" Key.
;
; This will check if the player has the "K" Key, and
; if they do, the door will be unlocked and entered.
; The key will be consumed.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb43]
;============================================================================
Game_OpenDoorWithKKey:                      ; [$eb61]
    LDA a:SelectedItem                      ; Load the selected item.
    CMP #$05                                ; Is this the "K" Key?
    BEQ Game_UnlockDoorWithUsableItem       ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7C (via jump to IScripts_Begin).
    ;
    LDA #$7c                                ; 0x7C == "K" Key required
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$eb70]
    RTS


;============================================================================
; Attempt to open a door marked with the "Q" Key.
;
; This will check if the player has the "Q" Key, and
; if they do, the door will be unlocked and entered.
; The key will be consumed.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb45]
;============================================================================
Game_OpenDoorWithQKey:                      ; [$eb71]
    LDA a:SelectedItem                      ; Load the selected item.
    CMP #$06                                ; Is this the "Q" Key?
    BEQ Game_UnlockDoorWithUsableItem       ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7B (via jump to IScripts_Begin).
    ;
    LDA #$7b                                ; 0x7B == "Q" Key required
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$eb80]
    RTS


;============================================================================
; Attempt to open a door marked with the "J" Key.
;
; This will check if the player has the "J" Key, and
; if they do, the door will be unlocked and entered.
; The key will be consumed.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb47]
;============================================================================
Game_OpenDoorWithJKey:                      ; [$eb81]
    LDA a:SelectedItem                      ; Load the selected item.
    CMP #$07                                ; Is this the "J" Key?
    BEQ Game_UnlockDoorWithUsableItem       ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7 (via jump to IScripts_Begin).
    ;
    LDA #$02                                ; 0x02 == "J" Key required
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$eb90]
    RTS


;============================================================================
; Attempt to open a door marked with the "Jo" Key.
;
; This will check if the player has the "Jo" Key, and
; if they do, the door will be unlocked and entered.
; The key will be consumed.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb49]
;============================================================================
Game_OpenDoorWithJoKey:                     ; [$eb91]
    LDA a:SelectedItem                      ; Load the selected item.
    CMP #$08                                ; Is this the "Jo" Key?
    BEQ Game_UnlockDoorWithUsableItem       ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7E (via jump to IScripts_Begin).
    ;
    LDA #$7e                                ; 0x7E == "Jo" Key required
                                            ; IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$eba0]
    RTS


;============================================================================
; Attempt to open a door marked with the Ring of Elf.
;
; This will check if the player has the Ring of Elf, and
; if they do, the door will be unlocked and entered.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb4b]
;============================================================================
Game_OpenDoorWithRingOfElf:                 ; [$eba1]
    LDA a:SpecialItems                      ; Load the special items.
    AND #$80                                ; Does the player have the Ring
                                            ; of Elf?
    BNE Game_UnlockDoor                     ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7F (via jump to IScripts_Begin).
    ;
    LDA #$7f                                ; 0x7F == Ring required IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$ebb0]
    RTS


;============================================================================
; Attempt to open a door marked with the Ring of Dworf.
;
; This will check if the player has the Ring of Dworf, and
; if they do, the door will be unlocked and entered.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb4d]
;============================================================================
Game_OpenDoorWithRingOfDworf:               ; [$ebb1]
    LDA a:SpecialItems                      ; Load the special items.
    AND #$20                                ; Does the player have the Ring
                                            ; of Dworf?
    BNE Game_UnlockDoor                     ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7F (via jump to IScripts_Begin).
    ;
    LDA #$7f                                ; 0x7F == Ring required IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$ebc0]
    RTS


;============================================================================
; Attempt to open a door marked with the Demon's Ring.
;
; This will check if the player has the Demon's Ring, and
; if they do, the door will be unlocked and entered.
;
; If the door can't be unlocked, a message will be
; displayed.
;
; INPUTS:
;     SelectedItem:
;         The selected item.
;
; CALLS:
;     Game_UnlockDoorWithUsableItem
;     MMC1_LoadBankAndJump
;
; XREFS:
;     DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS
;     [$PRG15_MIRROR::eb4f]
;============================================================================
Game_OpenDoorWithDemonsRing:                ; [$ebc1]
    LDA a:SpecialItems                      ; Load the special items.
    AND #$10                                ; Does the player have the
                                            ; Demon's Ring?
    BNE Game_UnlockDoor                     ; If so, unlock the door and
                                            ; enter.


    ;
    ; Run IScript 0x7F (via jump to IScripts_Begin).
    ;
    LDA #$7f                                ; 0x7F == Ring required IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$ebd0]
    RTS
;============================================================================
; TODO: Document Game_UnlockDoorWithUsableItem
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_OpenDoorWithAKey
;     Game_OpenDoorWithJKey
;     Game_OpenDoorWithJoKey
;     Game_OpenDoorWithKKey
;     Game_OpenDoorWithQKey
;============================================================================
Game_UnlockDoorWithUsableItem:              ; [$ebd1]
    ;
    ; Run IScript 0x84 (via jump to IScripts_Begin).
    ;
    LDA #$84                                ; 0x84 == Used key IScript.
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer IScripts_Begin-1                ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$ebd9]
    LDA #$ff
    STA a:SelectedItem
    JSR UI_ClearSelectedItemPic

;============================================================================
; TODO: Document Game_UnlockDoor
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_OpenDoorWithDemonsRing
;     Game_OpenDoorWithRingOfDworf
;     Game_OpenDoorWithRingOfElf
;============================================================================
Game_UnlockDoor:                            ; [$ebe1]
    LDA #$00
    STA a:CurrentDoor_KeyRequirement
    LDA #$84
    LDA #$06
    JSR Sound_PlayEffect
    RTS

;============================================================================
; TODO: Document Player_DrawBody
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     EndGame_MainLoop
;     Game_DrawScreenInFrozenState
;     Game_MainLoop
;     Player_HandleDeath
;============================================================================
Player_DrawBody:                            ; [$ebee]
    LDA a:IScript_PortraitID
    BMI @LAB_PRG15_MIRROR__ebf4
    RTS


    ;
    ; Check the loaded state for the screen to determine
    ; the arguments to use.
    ;
    ; NOTE: This seems to be old code. Nothing sets
    ; Screen_ReadyState to anything but 0x00 or 0xFF.
    ; It appears that at some point they simplified this, which
    ; makes all of this dead code.
    ;
  @LAB_PRG15_MIRROR__ebf4:                  ; [$ebf4]
    LDA Screen_ReadyState
    CMP #$01
    BEQ @LAB_PRG15_MIRROR__ec11
    CMP #$05
    BEQ @LAB_PRG15_MIRROR__ec11


    ;
    ; Ths code path should always be hit when this function is
    ; called.
    ;
    LDA Player_PosX_Block
    STA Arg_DrawSprite_PosX
    LDA Screen_Maybe_ScrollXCounter
    STA Unused_Sprite_ScrollPosX
    LDA Player_PosY
    STA Arg_DrawSprite_PosY
    LDA Player_Something_ScrollPosY
    STA Unused_Sprite_ScrollPosY
    JMP @LAB_PRG15_MIRROR__ec21


    ;
    ; This whole section seems unreachable. Screen_ReadyState
    ; should never reach these values. This may be dead code.
    ;
  @LAB_PRG15_MIRROR__ec11:                  ; [$ec11]
    LDA Maybe_PlayerX_ForScroll
    STA Arg_DrawSprite_PosX
    LDA PPU_ScrollScreenHoriz
    STA Unused_Sprite_ScrollPosX
    LDA Maybe_PlayerY_ForScroll
    STA Arg_DrawSprite_PosY
    LDA PPU_ScrollScreenVert
    STA Unused_Sprite_ScrollPosY

  @LAB_PRG15_MIRROR__ec21:                  ; [$ec21]
    JSR Player_CalculateVisibility
    JSR Player_SetFacingLeft
    JSR Player_GetBodySpriteFrameOffset
    PHA
    LDA a:SelectedArmor
    ASL A
    STA Temp_00
    LDA a:SelectedShield
    CMP #$03
    LDA #$00
    ROL A
    EOR #$01
    ORA Temp_00
    TAX
    PLA
    CLC
    ADC PLAYER_BODY_TILEINFO_START_OFFSETS,X
    JSR Sprite_SetPlayerAppearanceAddr
    JMP FUN_PRG15_MIRROR__ec58

;
; XREFS:
;     Player_DrawBody
;
PLAYER_BODY_TILEINFO_START_OFFSETS:         ; [$ec49]
    .byte $00                               ; [0]: Leather Armor
    .byte $08                               ; [1]: Leather Armor + Shield
    .byte $10                               ; [2]: Studded Mail
    .byte $18                               ; [3]: Studded Mail + Shield
    .byte $20                               ; [4]: Full Plate
    .byte $28                               ; [5]: Full Plate + Shield
    .byte $30                               ; [6]: Battle Suit
    .byte $38                               ; [7]: Battle Suit + Shield

;============================================================================
; TODO: Document Player_SetFacingLeft
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawBody
;============================================================================
Player_SetFacingLeft:                       ; [$ec51]
    LDA Player_Flags
    AND #$40
    STA CurrentSprite_FlipMask
    RTS

;============================================================================
; TODO: Document FUN_PRG15_MIRROR__ec58
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawBody
;============================================================================
FUN_PRG15_MIRROR__ec58:                     ; [$ec58]
    LDA Player_Flags
    BPL @_return
    LDA PlayerHitsPhaseCounter
    CMP #$02
    BNE @_return
    LDY #$00
    LDA Player_Flags
    AND #$40
    BEQ @LAB_PRG15_MIRROR__ec6b
    INY

  @LAB_PRG15_MIRROR__ec6b:                  ; [$ec6b]
    LDA BYTE_ARRAY_PRG15_MIRROR__eca2,Y
    JSR Player_CalcValueAndFFForNeg
    LDA Player_PosX_Block
    CLC
    ADC Temp_04
    STA Arg_DrawSprite_PosX
    LDA Player_PosX_Block
    ADC Temp_05
    CMP Player_PosX_Block
    BNE @_return
    LDA Player_PosY
    STA Arg_DrawSprite_PosY
    JSR Player_CalculateVisibility
    LDA a:SelectedArmor
    ASL A
    STA Temp_00
    LDY #$00
    LDA a:SelectedShield
    CMP #$03
    BCS @LAB_PRG15_MIRROR__ec97
    INY

  @LAB_PRG15_MIRROR__ec97:                  ; [$ec97]
    TYA
    ORA Temp_00
    TAY
    LDA BYTE_ARRAY_PRG15_MIRROR__eca4,Y
    JMP Sprite_SetPlayerAppearanceAddr

  @_return:                                 ; [$eca1]
    RTS

;
; XREFS:
;     FUN_PRG15_MIRROR__ec58
;
BYTE_ARRAY_PRG15_MIRROR__eca2:              ; [$eca2]
    .byte $f8                               ; [0]:

;
; XREFS:
;     FUN_PRG15_MIRROR__ec58
;
BYTE_ARRAY_PRG15_MIRROR__eca2_1_:           ; [$eca3]
    .byte $10                               ; [1]:

;
; XREFS:
;     FUN_PRG15_MIRROR__ec58
;
BYTE_ARRAY_PRG15_MIRROR__eca4:              ; [$eca4]
    .byte $63                               ; [0]: Leather Armor
    .byte $67                               ; [1]: Leather Armor + Shield
    .byte $64                               ; [2]: Studded Mail
    .byte $68                               ; [3]: Studded Mail + Shield
    .byte $65                               ; [4]: Full Plate
    .byte $69                               ; [5]: Full Plate + Shield
    .byte $66                               ; [6]: Battle Suit
    .byte $6a                               ; [7]: Battle Suit + Shield

;============================================================================
; TODO: Document Player_GetBodySpriteFrameOffset
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Player_DrawBody
;============================================================================
Player_GetBodySpriteFrameOffset:            ; [$ecac]
    LDA Player_Flags
    LSR A
    BCC @LAB_PRG15_MIRROR__ecb8
    LDA Player_Flags
    BMI @LAB_PRG15_MIRROR__eccc
    LDA #$03
    RTS

  @LAB_PRG15_MIRROR__ecb8:                  ; [$ecb8]
    JSR Player_IsClimbing
    BCC @LAB_PRG15_MIRROR__ecc8
    LDA Player_MovementTick
    AND #$10
    ASL A
    ASL A
    STA CurrentSprite_FlipMask
    LDA #$07
    RTS

  @LAB_PRG15_MIRROR__ecc8:                  ; [$ecc8]
    LDA Player_Flags
    BPL @LAB_PRG15_MIRROR__ecd2

  @LAB_PRG15_MIRROR__eccc:                  ; [$eccc]
    LDX PlayerHitsPhaseCounter
    LDA BYTE_ARRAY_PRG15_MIRROR__ecf3,X
    RTS

  @LAB_PRG15_MIRROR__ecd2:                  ; [$ecd2]
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__ecdd
    LDA Joy1_ButtonMask
    BPL @LAB_PRG15_MIRROR__ecdd
    LDA #$03
    RTS

  @LAB_PRG15_MIRROR__ecdd:                  ; [$ecdd]
    LDA Player_Flags
    AND #$20
    BEQ @LAB_PRG15_MIRROR__ecea
    LDA Player_MovementTick
    LSR A
    LSR A
    LSR A
    AND #$03

  @LAB_PRG15_MIRROR__ecea:                  ; [$ecea]
    TAX
    LDA BYTE_ARRAY_PRG15_MIRROR__ecef,X
    RTS

;
; XREFS:
;     Player_GetBodySpriteFrameOffset
;
BYTE_ARRAY_PRG15_MIRROR__ecef:              ; [$ecef]
    .byte $00                               ; [0]:
    .byte $01                               ; [1]:
    .byte $02                               ; [2]:
    .byte $01                               ; [3]:

;
; XREFS:
;     Player_GetBodySpriteFrameOffset
;
BYTE_ARRAY_PRG15_MIRROR__ecf3:              ; [$ecf3]
    .byte $04                               ; [0]:
    .byte $05                               ; [1]:
    .byte $06                               ; [2]:


;============================================================================
; Return whether the player is climbing a ladder.
;
; This will depend on the following conditions:
;
; 1. Whether the player is in front of a ladder.
;
; 2. Whether the player is either:
;
;    1. Directly on a ladder block, or
;
;    2. Not falling off the ladder.
;
; 3. Whether the climbing bit is set.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
;     Player_PosX_Block:
;         The full X position of the player.
;
; OUTPUTS:
;     C:
;         1 if the player is climbing.
;         0 if the player is not.
;
; XREFS:
;     Player_CastMagic
;     Player_CheckHandleAttack
;     Player_ContinueHandleClimbOrJump
;     Player_GetBodySpriteFrameOffset
;============================================================================
Player_IsClimbing:                          ; [$ecf6]
    ;
    ; Check if the player can currently climb an available ladder.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$08                                ; Can the player currently climb?
    BEQ @_returnFalse                       ; If not, return false.


    ;
    ; A ladder is available to climb.
    ;
    ; Check if the player's X position is on an even block boundary.
    ;
    LDA Player_PosX_Block                   ; Load the player's X position.
    AND #$0f                                ; Is it on a block boundary?
    BEQ @_checkClimbing                     ; If not, then jump to check if
                                            ; the player is climbing.


    ;
    ; The player's X position is on an even byte boundary.
    ;
    ; Check if the player is currently falling off a ledge or
    ; ladder.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$04                                ; Is the player currently
                                            ; falling?
    BNE @_returnFalse                       ; If so, return false.


    ;
    ; Check if the player is currently climbing.
    ;
  @_checkClimbing:                          ; [$ed08]
    LDA Player_Flags                        ; Load the player's flags.
    AND #$10                                ; Is the player climbing?
    BEQ @_returnFalse                       ; If not, return false.
    SEC                                     ; Set C = 1 to return true.
    RTS

  @_returnFalse:                            ; [$ed10]
    CLC                                     ; Set C = 0 to return false.
    RTS


;============================================================================
; Draw the player sprite immediately.
;
; This will load the body/armor and draw it, followed by the
; weapon (if equipped) and then the shield (if equipped and
; not the Battle Helmet).
;
; The sprite will be flushed to the PPU immediately. This
; is done during screen setup, and differs from the normal
; behavior in Player_DrawSprite.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Player_DrawTileReadOffset:
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Player_LoadArmorTile
;     Player_LoadShieldTile
;     Player_LoadWeaponTile
;     Player_LoadArmorTilesToPPU
;     Player_LoadShieldTilesToPPU
;     Player_LoadWeaponTilesToPPU
;     PPUBuffer_Draw
;
; XREFS:
;     Screen_SetupNew
;============================================================================
Player_DrawSpriteImmediately:               ; [$ed12]
    ;
    ; Load and draw the player's sprite.
    ;
    JSR Player_LoadArmorTilesToPPU          ; Load the armor sprite
                                            ; information.

  @_drawArmorLoop:                          ; [$ed15]
    JSR Player_LoadArmorTile                ; Draw a tile of armor.
    JSR PPUBuffer_Draw                      ; Draw to the PPU.
    INC Player_DrawTileReadOffset           ; Increment the read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawArmorLoop                     ; If >= 0, loop.


    ;
    ; Load and draw the weapon sprite, if one is equipped.
    ;
    JSR Player_LoadWeaponTilesToPPU         ; Load the weapon sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Get the tile read offset.
    BMI @_loadShield                        ; If < 0, skip weapon drawing.


    ;
    ; The player has a weapon equipped. Draw the tiles.
    ;
  @_drawWeaponLoop:                         ; [$ed28]
    JSR Player_LoadWeaponTile               ; Draw a tile of the weapon.
    JSR PPUBuffer_Draw                      ; Draw to the PPU.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawWeaponLoop                    ; If >= 0, loop.


    ;
    ; Load and draw the shield sprite.
    ;
  @_loadShield:                             ; [$ed34]
    JSR Player_LoadShieldTilesToPPU         ; Load the shield sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Load the tile read offset.
    BMI @_return                            ; If < 0 (unset), return.

  @_drawShieldLoop:                         ; [$ed3b]
    JSR Player_LoadShieldTile               ; Draw a tile of the shield.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawShieldLoop                    ; If >= 0, loop.

  @_return:                                 ; [$ed44]
    RTS


;============================================================================
; Draw the player sprite.
;
; This will load the body/armor and draw it, followed by the
; weapon (if equipped) and then the shield (if equipped and
; not the Battle Helmet).
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Player_DrawTileReadOffset:
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Player_LoadArmorTile
;     Player_LoadShieldTile
;     Player_LoadWeaponTile
;     Player_LoadArmorTilesToPPU
;     Player_LoadShieldTilesToPPU
;     Player_LoadWeaponTilesToPPU
;
; XREFS:
;     Player_HandleDeath
;     Player_SetArmor
;     Player_SetShield
;     Player_SetWeapon
;============================================================================
Player_DrawSprite:                          ; [$ed45]
    ;
    ; Load and draw the player's sprite.
    ;
    JSR Player_LoadArmorTilesToPPU          ; Load the armor sprite
                                            ; information.

  @_drawArmorLoop:                          ; [$ed48]
    JSR Player_LoadArmorTile                ; Draw a tile of armor.
    INC Player_DrawTileReadOffset           ; Increment the read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawArmorLoop                     ; If >= 0, loop.


    ;
    ; Load and draw the weapon sprite, if one is equipped.
    ;
    JSR Player_LoadWeaponTilesToPPU         ; Load the weapon sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Get the tile read offset.
    BMI @_loadShield                        ; If < 0, skip weapon drawing.


    ;
    ; The player has a weapon equipped. Draw the tiles.
    ;
  @_drawWeaponLoop:                         ; [$ed58]
    JSR Player_LoadWeaponTile               ; Draw a tile of the weapon.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawWeaponLoop                    ; If >= 0, loop.


    ;
    ; Load and draw the shield sprite.
    ;
  @_loadShield:                             ; [$ed61]
    JSR Player_LoadShieldTilesToPPU         ; Load the shield sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Load the tile read offset.
    BMI @_return                            ; If < 0 (unset), return.

  @_drawShieldLoop:                         ; [$ed68]
    JSR Player_LoadShieldTile               ; Draw a tile of the shield.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawShieldLoop                    ; If >= 0, loop.

  @_return:                                 ; [$ed71]
    RTS


;============================================================================
; Load all tiles for the player's armor into the PPU.
;
; This will load the tiles for the selected armor into
; the PPU, for all poses (walking, climbing, jumping, etc.).
; These tiles come from TILES_PLAYER_ARMOR_ADDRS_INDEX.
;
; Different sets of tiles are chosen based on whether
; there's a shield equipped.
;
; It's called when spawning a player or when changing
; weapons/armor.
;
; INPUTS:
;     SelectedArmor:
;         The currently-selected armor.
;
;     SelectedShield:
;         The currently-selected shield.
;
;     PLAYER_ARMOR_TILE_COUNTS:
;         Tile counts for all poses for each armor.
;
; OUTPUTS:
;     Player_ArmorLookupIndex:
;     Player_DrawTileReadOffset:
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Player_LoadArmorSpriteTilesAddr
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadArmorTilesToPPU:                 ; [$ed72]
    ;
    ; Clear initial state for drawing the armor.
    ;
    LDA #$00
    STA Player_DrawTileReadOffset           ; Set the tile read offset to 0.
    STA Player_SpriteSegmentPPUAddr_L       ; Set the sprite segment PPU
                                            ; addresses to 0.
    STA Player_SpriteSegmentPPUAddr_U


    ;
    ; Calculate an index into the tile information tables for the
    ; armor (and possibly armor + shield, if the Battle Suit isn't
    ; equipped).
    ;
    LDA a:SelectedArmor                     ; Load the selected armor.
    ASL A                                   ; Convert to a word boundary.
    LDY a:SelectedShield                    ; Load the selected shield.
    CPY #$03                                ; Is it the Battle Helmet?
    BCS @_loadArmor                         ; If so, jump (skip special armor
                                            ; + shield logic).


    ;
    ; There's a shield equipped, and the player isn't wielding
    ; the full Battle Suit + Battle Helmet. Set the index to be
    ; odd so we look up a sprite entry compatible with a shield.
    ;
    ORA #$01                                ; Offset the lookup index to
                                            ; include armor + shield tiles.

  @_loadArmor:                              ; [$ed87]
    STA Player_ArmorLookupIndex             ; Store the lookup index based on
                                            ; the armor word boundary and
                                            ; possibly the shield bit.
    TAX                                     ; X = result.


    ;
    ; Determine the number of tiles to load from the lookup table.
    ;
    ; The caller will use this to iterate through the tiles to
    ; load.
    ;
    LDA PLAYER_ARMOR_TILE_COUNTS,X          ; Load the tile count.
    STA Temp_00                             ; Store it for the parent caller
                                            ; to use.


    ;
    ; Normalize the lookup index to be based on a 4-byte
    ; boundary (2 bytes for the armor address, 2 for the
    ; armor + shield address), and then load the sprite
    ; tiles.
    ;
    TXA                                     ; A = Lookup index.
    ASL A                                   ; Multiply by 2 (so index
                                            ; considers armor and armor +
                                            ; shield entries).
    TAY                                     ; Y = result.
    JMP Player_LoadArmorSpriteTilesAddr     ; Load the sprite tiles
                                            ; information.


;============================================================================
; The number of available tiles used for all player poses
; for a given armor/shield combination.
;
; XREFS:
;     Player_LoadArmorTilesToPPU
;============================================================================

;
; XREFS:
;     Player_LoadArmorTilesToPPU
;
PLAYER_ARMOR_TILE_COUNTS:                   ; [$ed95]
    .byte $33                               ; [0]: Leather Armor (51 tiles)
    .byte $27                               ; [1]: Leather Armor + Shield (39
                                            ; tiles)
    .byte $33                               ; [2]: Studded Mail (51 tiles)
    .byte $27                               ; [3]: Studded Mail + Shield (39
                                            ; tiles)
    .byte $34                               ; [4]: Full Plate (52 tiles)
    .byte $28                               ; [5]: Full Plate + Shield (40
                                            ; tiles)
    .byte $32                               ; [6]: Battle Helmet (50 tiles)
    .byte $32                               ; [7]: Battle Helmet + Shield (50
                                            ; tiles)


;============================================================================
; Load all tiles for the player's weapon into the PPU.
;
; This will load the tiles for the selected weapon into
; the PPU, for all poses (walking, swinging, etc.).
; These tiles come from TILES_PLAYER_WEAPON_ADDRS_INDEX.
;
; It's called when spawning a player or when changing
; weapons/armor.
;
; INPUTS:
;     Player_CurWeapon:
;         The currently-selected weapon.
;
;     PLAYER_WEAPON_TILE_COUNTS:
;         Tile counts for all poses for each weapon.
;
; OUTPUTS:
;     Player_DrawTileReadOffset:
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Player_LoadWeaponSpriteTileAddrs
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadWeaponTilesToPPU:                ; [$ed9d]
    LDA #$00
    STA Player_DrawTileReadOffset           ; Set the tile read offset to 0.
    LDA a:Player_CurWeapon                  ; Load the selected weapon.
    CMP #$ff                                ; Is it 0xFF (unset)?
    BNE @_loadWeaponTiles                   ; If not, jump to load tiles.


    ;
    ; No sword is equipped. Set the offset to 0xFF, to disable
    ; drawing.
    ;
    STA Player_DrawTileReadOffset           ; Set the read offset to 0xFF.
    RTS


    ;
    ; Determine the number of tiles to load from the lookup table.
    ;
    ; The caller will use this to iterate through the tiles to
    ; load.
    ;
  @_loadWeaponTiles:                        ; [$edab]
    TAX                                     ; X = weapon.
    LDA PLAYER_WEAPON_TILE_COUNTS,X         ; Load the tile count.
    STA Temp_00                             ; Store it for the parent caller
                                            ; to use.


    ;
    ; Set the PPU address to load tiles into and load them.
    ;
    TXA                                     ; X = tile count.
    ASL A                                   ; Convert to a word boundary.
    TAY                                     ; Y = resulting index.
    LDA PLAYER_WEAPON_TILE_PPU_ADDRS,Y      ; Load the lower byte of the
                                            ; target PPU address for weapons.
    STA Player_SpriteSegmentPPUAddr_L       ; Set it for load.
    LDA PLAYER_WEAPON_TILE_PPU_ADDRS+1,Y    ; Load the upper byte of the
                                            ; target PPU address for weapons.
    STA Player_SpriteSegmentPPUAddr_U       ; Set it for load.
    JMP Player_LoadWeaponSpriteTileAddrs    ; Load the sprite tiles
                                            ; information.


;============================================================================
; The number of available tiles used for all player poses
; for a given weapon.
;
; XREFS:
;     Player_LoadWeaponTilesToPPU
;============================================================================

;
; XREFS:
;     Player_LoadWeaponTilesToPPU
;
PLAYER_WEAPON_TILE_COUNTS:                  ; [$edc1]
    .byte $02                               ; [0]: Dagger
    .byte $05                               ; [1]: Long Sword
    .byte $06                               ; [2]: Giant Blade
    .byte $08                               ; [3]: Dragon Slayer


;============================================================================
; PPU target addresses for each weapon type's loaded tiles.
;
; XREFS:
;     Player_LoadWeaponTilesToPPU
;============================================================================

;
; XREFS:
;     Player_LoadWeaponTilesToPPU
;
PLAYER_WEAPON_TILE_PPU_ADDRS:               ; [$edc5]
    .word $0380                             ; [0]: Dagger
    .word $0380                             ; [1]: Long Sword
    .word $0380                             ; [2]: Giant Blade
    .word $0340                             ; [3]: Dragon Slayer


;============================================================================
; Load all tiles for the player's shield into the PPU.
;
; This will load the tiles for the selected shield into
; the PPU, for all poses (walking, swinging, etc.).
; These tiles come from a range starting at
; TILES_SHIELDS_START_SMALL_SHIELD_01.
;
; It's called when spawning a player or when changing
; weapons/armor.
;
; Tile indexes and counts are static. They aren't loaded
; from a lookup table like with weapons/armor. There are
; always 5 tiles for a shield.
;
; The exception is the Battle Helmet, which is not rendered
; directly, as it's part of the armor tiles.
;
; INPUTS:
;     SelectedShield:
;         The currently-selected shield.
;
; OUTPUTS:
;     Player_DrawTileReadOffset:
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;     Temp_00:
;         Clobbered.
;
; CALLS:
;     Player_LoadShieldSpriteTileAddrs
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadShieldTilesToPPU:                ; [$edcd]
    LDA #$00
    STA Player_DrawTileReadOffset           ; Set the tile read offset to 0.
    LDA a:SelectedShield                    ; Load the selected shield.
    CMP #$03                                ; Is it the Battle Helmet (or
                                            ; unset -- 0xFF)?
    BCC @_loadShieldTiles                   ; If not, then jump to handle
                                            ; standard shields.


    ;
    ; This is the Battle Helmet or there's no helmet equipped.
    ; In either case, set the loaded value as the result.
    ;
    STA Player_DrawTileReadOffset           ; Set the read offset to the
                                            ; shield value. This will be 3 or
                                            ; 0xFF.
    RTS                                     ; And return.


    ;
    ; An actual shield is equipped. Begin setting the lookup
    ; index for the shield and a tile count of 5.
    ;
  @_loadShieldTiles:                        ; [$eddb]
    ASL A                                   ; Convert the shield index to a
                                            ; word value for lookup.
    TAY                                     ; Y = resulting index.
    LDA #$05                                ; 5 tiles.
    STA Temp_00                             ; Set as the tile count for the
                                            ; load loop.


    ;
    ; Set the PPU address to load into to 0x0300.
    ;
    LDA #$00
    STA Player_SpriteSegmentPPUAddr_L       ; Set the lower byte of the PPU
                                            ; address to 0.
    LDA #$03
    STA Player_SpriteSegmentPPUAddr_U       ; And upper to 3.
    JMP Player_LoadShieldSpriteTileAddrs    ; Load the sprite tiles
                                            ; information.


;============================================================================
; Set the player's current weapon.
;
; If the player is in an area where the weapon can be
; equipped, then equip and redraw the player sprite.
;
; INPUTS:
;     A:
;         The weapon to set:
;
;         0 = Hand Dagger
;         1 = Long Sword
;         2 = Giant Blade
;         3 = Dragon Slayer
;
; OUTPUTS:
;     SelectedWeapon:
;         The updated selected weapon.
;
;     Player_CurWeapon:
;         The weapon currently equipped by the player,
;         if in an area allowing that.
;
; CALLS:
;     Player_DrawSprite
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetWeapon:                           ; [$edec]
    PHA                                     ; Push the weapon to the stack.


    ;
    ; Check that the player is not in a building.
    ;
    ; A weapon cannot be set while in a building.
    ;
    LDA Area_CurrentArea                    ; Set A = current area.
    CMP #$04                                ; Is this the building?
    BEQ @_cannotEquip                       ; If so, branch.


    ;
    ; The weapon can be equipped. Equip it and redraw the player.
    ;
    PLA                                     ; Pop the weapon from the stack.
    STA a:SelectedWeapon                    ; Set as the current weapon in
                                            ; the inventory.
    STA a:Player_CurWeapon                  ; Store as the current weapon.
    JSR Player_DrawSprite                   ; Draw the player sprite.
    CLC                                     ; Clear Carry.
    RTS


    ;
    ; The weapon cannot currently be equipped. Set the weapon
    ; but do not draw.
    ;
  @_cannotEquip:                            ; [$edff]
    PLA                                     ; Pop the weapon from the stack.
    STA a:SelectedWeapon                    ; Set as the current weapon.
    CLC                                     ; Clear Carry.
    RTS


;============================================================================
; Set the player's current armor.
;
; The armor will be equipped and the player sprite redrawn.
;
; INPUTS:
;     A:
;         0 = Leather
;         1 = Studded Mail
;         2 = Full Plate
;         3 = Battle Suit
;
; OUTPUTS:
;     SelectedArmor:
;         The new selected armor.
;
; CALLS:
;     Player_DrawSprite
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetArmor:                            ; [$ee05]
    STA a:SelectedArmor                     ; Set the selected armor.
    JSR Player_DrawSprite                   ; Draw the player sprite.
    CLC                                     ; Clear Carry.
    RTS


;============================================================================
; Set the player's current shield.
;
; The shield will be equipped and the player sprite redrawn.
;
; INPUTS:
;     A:
;         The shield to set:
;
;         0 = Small
;         1 = Large
;         2 = Magic
;         3 = Battle Helmet
;
; OUTPUTS:
;     SelectedShield:
;         The new selected armor
;
; CALLS:
;     Player_DrawSprite
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetShield:                           ; [$ee0d]
    STA a:SelectedShield                    ; Set the selected shield.
    JSR Player_DrawSprite                   ; Draw the player sprite.
    CLC                                     ; Clear Carry.
    RTS


;============================================================================
; Load the start address for the current armor's tiles.
;
; This will locate the address in bank 8 where the tiles
; can be read, in preparation for drawing to the screen.
;
; The initial address in bank 8 ({@address PRG8::8000}) points to an
; index table mapping armor IDs to tile start addresses.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     Player_SpriteTileReadAddr_U:
;     Player_SpriteTileReadAddr_L:
;         Address where tile data can be read.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Player_LoadArmorTilesToPPU
;============================================================================
Player_LoadArmorSpriteTilesAddr:            ; [$ee15]
    ;
    ; Save the current ROM bank and switch to bank 8 (sprites).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push the bank to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the address of the index of armor types to tile IDs.
    ;
    LDA a:TILES_ARMOR_ADDRS_INDEX_REF       ; Load the lower byte of the
                                            ; address of the armor index.
    STA Player_SpriteTileReadAddr_L         ; Set as the lower byte.
    LDA a:TILES_ARMOR_ADDRS_INDEX_REF+1     ; Load the upper byte.
    CLC
    ADC #$80                                ; Add 0x80 to the upper byte.
    STA Player_SpriteTileReadAddr_U         ; And set it as the upper byte.


    ;
    ; Load the tiles start address of the armor type from the index.
    ;
    LDA (Player_SpriteTileReadAddr_L),Y     ; Read the lower byte of the
                                            ; tiles start address.
    PHA                                     ; Push it to the stack.
    INY                                     ; Increment the offset.
    LDA (Player_SpriteTileReadAddr_L),Y     ; Read the upper byte of the
                                            ; tiles start address.
    CLC
    ADC #$80                                ; Add 0x80 to it.
    STA Player_SpriteTileReadAddr_U         ; And store as the upper byte of
                                            ; the address.
    PLA                                     ; Pop the lower byte.
    STA Player_SpriteTileReadAddr_L         ; And store it as the lower byte
                                            ; of the address.


    ;
    ; Switch back to the saved bank.
    ;
    PLA                                     ; Pop the saved ROM bank from the
                                            ; stack.
    TAX                                     ; Set it to X
    JSR MMC1_UpdateROMBank                  ; And switch back to it.
    RTS


;============================================================================
; Load the start address for the current weapon's tiles.
;
; This will locate the address in bank 8 where the tiles
; can be read, in preparation for drawing to the screen.
;
; The initial address in bank 8 ({@address PRG8::8002}) points to an
; index table mapping weapon IDs to tile start addresses.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     Player_SpriteTileReadAddr_U:
;     Player_SpriteTileReadAddr_L:
;         Address where tile data can be read.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Player_LoadWeaponTilesToPPU
;============================================================================
Player_LoadWeaponSpriteTileAddrs:           ; [$ee3f]
    ;
    ; Save the current ROM bank and switch to bank 8 (sprites).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push the bank to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the address of the index of weapon types to tile IDs.
    ;
    LDA a:TILES_WEAPON_ADDRS_INDEX_REF      ; Load the lower byte of the
                                            ; address of the weapon index.
    STA Player_SpriteTileReadAddr_L         ; Set as the lower byte.
    LDA a:TILES_WEAPON_ADDRS_INDEX_REF+1    ; Load the upper byte.
    CLC
    ADC #$80                                ; Add 0x80 to the upper byte.
    STA Player_SpriteTileReadAddr_U         ; And set it as the upper byte.


    ;
    ; Load the tiles start address of the weapon type from the
    ; index.
    ;
    LDA (Player_SpriteTileReadAddr_L),Y     ; Read the lower byte of the
                                            ; tiles start address.
    PHA                                     ; Push it to the stack.
    INY                                     ; Increment the offset.
    LDA (Player_SpriteTileReadAddr_L),Y     ; Read the upper byte of the
                                            ; tiles start address.
    CLC
    ADC #$80                                ; Add 0x80 to it.
    STA Player_SpriteTileReadAddr_U         ; And store as the upper byte of
                                            ; the address.
    PLA                                     ; Pop the lower byte.
    STA Player_SpriteTileReadAddr_L         ; And store it as the lower byte
                                            ; of the address.


    ;
    ; Switch back to the saved bank.
    ;
    PLA                                     ; Pop the saved ROM bank from the
                                            ; stack.
    TAX                                     ; Set it to X
    JSR MMC1_UpdateROMBank                  ; And switch back to it.
    RTS


;============================================================================
; Load the start address for the current shield's tiles.
;
; This will locate the address in bank 8 where the tiles
; can be read, in preparation for drawing to the screen.
;
; The initial address in bank 8 ({@address PRG8::800C}) points to an
; index table mapping shield IDs to tile start addresses.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     Player_SpriteTileReadAddr_U:
;     Player_SpriteTileReadAddr_L:
;         Address where tile data can be read.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Player_LoadShieldTilesToPPU
;============================================================================
Player_LoadShieldSpriteTileAddrs:           ; [$ee69]
    ;
    ; Save the current ROM bank and switch to bank 8 (sprites).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push the bank to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the address of the index of shield types to tile IDs.
    ;
    LDA a:TILES_SHIELDS_ADDRS_INDEX_REF     ; Load the lower byte of the
                                            ; address of the shield index.
    STA Player_SpriteTileReadAddr_L         ; Set as the lower byte.
    LDA a:TILES_SHIELDS_ADDRS_INDEX_REF+1   ; Load the upper byte.
    CLC
    ADC #$80                                ; Add 0x80 to the upper byte.
    STA Player_SpriteTileReadAddr_U         ; And set it as the upper byte.


    ;
    ; Load the tiles start address of the shield type from the index.
    ;
    LDA (Player_SpriteTileReadAddr_L),Y     ; Read the lower byte of the
                                            ; tiles start address.
    PHA                                     ; Push it to the stack.
    INY                                     ; Increment the offset.
    LDA (Player_SpriteTileReadAddr_L),Y     ; Read the upper byte of the
                                            ; tiles start address.
    CLC
    ADC #$80                                ; Add 0x80 to it.
    STA Player_SpriteTileReadAddr_U         ; And store as the upper byte of
                                            ; the address.
    PLA                                     ; Pop the lower byte.
    STA Player_SpriteTileReadAddr_L         ; And store it as the lower byte
                                            ; of the address.


    ;
    ; Switch back to the saved bank.
    ;
    PLA                                     ; Pop the saved ROM bank from the
                                            ; stack.
    TAX                                     ; Set it to X.
    JSR MMC1_UpdateROMBank                  ; And switch back to it.
    RTS


;============================================================================
; Load a tile of the player's shield into the PPU.
;
; This is repeatedly called in a loop.
;
; The process for loading a tile involves:
;
; 1. Switching to bank 8.
; 2. Loading the start of the tiles address.
; 3. Splitting the nibbles of the tile ID to a 2-byte
;    offset into the tile address.
; 4. Writing to the PPU buffer, to load into the PPU.
;
; As a note, there's a lot of back-and-forth bank switching
; that seems entirely unnecessary. Probably an area that
; could be optimized.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;         Current address in the PPU to write to.
;
; OUTPUTS:
;     PPUBuffer:
;     PPUBuffer_WriteOffset:
;         Updated to queue PPU tile loading.
;
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;         Next address in the PPU to write to.
;
;     Temp_Addr_L:
;     Temp_Addr_U:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadShieldTile:                      ; [$ee93]
    ;
    ; Save the current ROM bank and switch to bank 8 (sprites).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push the bank to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the address for the start of the shield tile IDs.
    ;
    LDA a:TILES_SHIELDS_START_REF           ; Load the lower byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address to read from.
    LDA a:TILES_SHIELDS_START_REF+1         ; Load the upper byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address to read from.


    ;
    ; Draw the shield tile.
    ;
    JMP Player_LoadSpriteTile               ; Draw the tile.


;============================================================================
; Load a tile of the player's armor into the PPU.
;
; This is repeatedly called in a loop.
;
; The process for loading a tile involves:
;
; 1. Switching to bank 8.
; 2. Loading the start of the tiles address.
; 3. Splitting the nibbles of the tile ID to a 2-byte
;    offset into the tile address.
; 4. Writing to the PPU buffer, to load into the PPU.
;
; As a note, there's a lot of back-and-forth bank switching
; that seems entirely unnecessary. Probably an area that
; could be optimized.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;         Current address in the PPU to write to.
;
; OUTPUTS:
;     PPUBuffer:
;     PPUBuffer_WriteOffset:
;         Updated to queue PPU tile loading.
;
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;         Next address in the PPU to write to.
;
;     Temp_Addr_L:
;     Temp_Addr_U:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadArmorTile:                       ; [$eea9]
    ;
    ; Save the current ROM bank and switch to bank 8 (sprites).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push the bank to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the address for the start of the armor tile IDs.
    ;
    LDA a:TILES_ARMOR_START_REF             ; Load the lower byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address to read from.
    LDA a:TILES_ARMOR_START_REF+1           ; Load the upper byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address to read from.


    ;
    ; Draw the armor tile.
    ;
    JMP Player_LoadSpriteTile               ; Draw the tile.


;============================================================================
; Load a tile of the player's weapon into the PPU.
;
; This is called when spawning a player or when changing
; weapons/armor.
;
; This is repeatedly called in a loop.
;
; The process for loading a tile involves:
;
; 1. Switching to bank 8.
; 2. Loading the start of the tiles address.
; 3. Splitting the nibbles of the tile ID to a 2-byte
;    offset into the tile address.
; 4. Writing to the PPU buffer, to load into the PPU.
;
; As a note, there's a lot of back-and-forth bank switching
; that seems entirely unnecessary. Probably an area that
; could be optimized.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;         Current address in the PPU to write to.
;
; OUTPUTS:
;     PPUBuffer:
;     PPUBuffer_WriteOffset:
;         Updated to queue PPU tile loading.
;
;     Player_SpriteSegmentPPUAddr_U:
;     Player_SpriteSegmentPPUAddr_L:
;         Next address in the PPU to write to.
;
;     Temp_Addr_L:
;     Temp_Addr_U:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadWeaponTile:                      ; [$eebf]
    ;
    ; Save the current ROM bank and switch to bank 8 (sprites).
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push the bank to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the address for the start of the weapon tile IDs.
    ;
    LDA a:TILES_WEAPONS_START_REF           ; Load the lower byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address to read from.
    LDA a:TILES_WEAPONS_START_REF+1         ; Load the upper byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address to read from.

    ;
    ; v-- Fall through --v
    ;


    ;
    ; Restore the previously-saved bank.
    ;
    ;
    ; XREFS:
    ;     Player_LoadArmorTile
    ;     Player_LoadShieldTile
    ;
Player_LoadSpriteTile:                      ; [$eed2]
    PLA                                     ; Pop the saved ROM bank from the
                                            ; stack.
    TAX                                     ; Set it to X.
    JSR MMC1_UpdateROMBank                  ; And switch back to it.


    ;
    ; And then save it again and switch away again, back to
    ; bank 8.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$08                                ; 8 = Sprites bank.
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Prepare the read address for the tile.
    ;
    LDY Player_DrawTileReadOffset           ; Load the tile read offset.
    LDA #$00                                ; A = 0
    STA Temp_05                             ; Store it temporarily.


    ;
    ; Convert to a 2-byte value. The lower nibble will be stored
    ; as the lower byte in Temp_04, and the upper nibble
    ; as the upper byte in Temp_05. Effectively, splitting
    ; the nibbles into two bytes.
    ;
    LDA (Player_SpriteTileReadAddr_L),Y     ; Load the tile ID at the offset.
    ASL A                                   ; Shift left, upper bit into
                                            ; Carry.
    ROL Temp_05                             ; Rotate left, carry into bit 0,
                                            ; bit 7 into carry.
    ASL A                                   ; Repeat 3 more times, moving
                                            ; lower nibble into A, upper
                                            ; nibble into
                                            ; Temp_05.
    ROL Temp_05
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05                             ; Final storage of the upper
                                            ; byte.
    STA Temp_04                             ; Final storage of the lower
                                            ; byte.


    ;
    ; Restore the saved bank.
    ;
    PLA                                     ; Pop the saved ROM bank from the
                                            ; stack.
    TAX                                     ; Set it to X.
    JSR MMC1_UpdateROMBank                  ; And switch back to it.


    ;
    ; Convert the normalized 16-bit tile ID to an address.
    ;
    ; 0x80 + the upper byte of the tiles address will be
    ; added to the upper byte from the tile ID.
    ;
    ; The lower byte of the tiles address will be added to the
    ; lower byte from the tile ID.
    ;
    ; The result is the tile data address.
    ;
    ; Start with the lower byte of the address.
    ;
    LDA Temp_04                             ; Load the lower byte from the
                                            ; normalized tile ID.
    CLC
    ADC Temp_Addr_L                         ; Add to the start of the tile
                                            ; IDs.
    STA Temp_04                             ; Store as the new lower byte.


    ;
    ; Now handle the upper byte of the address.
    ;
    LDA Temp_05                             ; Load the upper byte from the
                                            ; normalized tile ID.
    ADC Temp_Addr_U                         ; Add the upper byte of the
                                            ; address.
    CLC
    ADC #$80                                ; Add 0x80.
    STA Temp_05                             ; Store as the new upper byte.


    ;
    ; Switch bank to bank 8 (where this probably should have
    ; stayed all along).
    ;
    LDA a:CurrentROMBank                    ; Load the current bank again.
    PHA                                     ; Push it to the stack.
    LDX #$08                                ; 8 = Sprites bank
    JSR MMC1_UpdateROMBank                  ; Switch to it again.


    ;
    ; Set the target PPU address to write the tiles to for the
    ; PPU buffer draw command.
    ;
    LDA Player_SpriteSegmentPPUAddr_U       ; Load the upper byte of the PPU
                                            ; address of the sprite data.
    STA a:PPU_TargetAddr_U                  ; Store as the upper byte to
                                            ; write to for the PPU draw
                                            ; command.
    LDA Player_SpriteSegmentPPUAddr_L       ; Load the lower byte.
    STA a:PPU_TargetAddr                    ; And store it.


    ;
    ; Queue 16 bytes (1 tile) to draw to the PPU.
    ;
    LDA #$10                                ; A = 16 bytes.
    JSR PPUBuffer_QueueCommandOrLength      ; Queue it as the draw length.


    ;
    ; Prepare a loop for writing bytes for the tile.
    ;
    LDY #$00                                ; Y = 0 (loop counter/read
                                            ; offset).

  @_copyLoop:                               ; [$ef25]
    LDA (Temp_04),Y                         ; Load a byte of the tile.
    STA PPUBuffer,X                         ; Write it to the PPU buffer.
    INX                                     ; X++ (buffer position).
    INY                                     ; Y++ (loop counter).
    CPY #$10                                ; Is it < 16?
    BCC @_copyLoop                          ; If so, loop.


    ;
    ; 16 bytes are written. Update the PPU buffer write offset
    ; and restore the bank.
    ;
    STX PPUBuffer_WriteOffset               ; Update the PPU buffer write
                                            ; offset.
    PLA                                     ; Pop the saved bank from the
                                            ; stack.
    TAX                                     ; Set in X.
    JSR MMC1_UpdateROMBank                  ; And update to the bank.


    ;
    ; Increment the PPU address for the next tile.
    ;
    LDA Player_SpriteSegmentPPUAddr_L       ; Load the lower byte of the PPU
                                            ; address.
    CLC
    ADC #$10                                ; Add 16 (next tile).
    STA Player_SpriteSegmentPPUAddr_L       ; Store it.
    LDA Player_SpriteSegmentPPUAddr_U       ; Load the upper byte.
    ADC #$00                                ; Add Carry (if the lower byte
                                            ; wrapped).
    STA Player_SpriteSegmentPPUAddr_U       ; And store it.
    RTS


;============================================================================
; DEAD CODE: Unset the special event ID.
;
; This is not used in the game.
;============================================================================
UNUSED_ClearScreenSpecialEventID:           ; [$ef45]
    LDA #$ff
    STA a:CurrentScreen_SpecialEventID
    RTS


;============================================================================
; Run special event handlers for the current screen.
;
; This will run code specific to some screens in the game,
; as indicated by the special event ID stored in a screen's
; metadata.
;
; See Screen_LoadSpecialEventID.
;
; If a handler is found, it will be run directly following
; this function.
;
; INPUTS:
;     CurrentScreen_SpecialEventID:
;         The loaded special event ID for the current
;         screen.
;
;     SPECIAL_SCREEN_EVENT_LOOKUP_TABLE:
;         Table mapping special event IDs to handler
;         functions.
;
; OUTPUTS:
;     Stack (A):
;         The address of the handler to run, if any.
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
GameLoop_RunScreenEventHandlers:            ; [$ef4b]
    ;
    ; Check if this screen has a special event ID.
    ;
    LDA a:CurrentScreen_SpecialEventID      ; Load the screen's special event
                                            ; ID.
    CMP #$ff                                ; Is it 0xFF?
    BEQ @_return                            ; If so, nothing to run. Return.


    ;
    ; Check if there's an entry in the table.
    ;
    AND #$7f                                ; Take the lower 7 bits.
    ASL A                                   ; Convert to a word boundary for
                                            ; the lookup table.
    CMP #$06                                ; Is it >= 6 (out of bounds)?
    BCS @_return                            ; If so, return.


    ;
    ; Load the address of the handler and push as the new address
    ; to run.
    ;
    TAY                                     ; Y = A
    LDA SPECIAL_SCREEN_EVENT_LOOKUP_TABLE+1,Y ; Load the lower byte of the
                                              ; handler address.
    PHA                                     ; Push it to the stack.
    LDA SPECIAL_SCREEN_EVENT_LOOKUP_TABLE,Y ; Load the upper byte.
    PHA                                     ; Push it.

  @_return:                                 ; [$ef62]
    RTS


;============================================================================
; Special screen events lookup table.
;
; Each maps a special event ID to a handler that will run
; on each tick while on the screen.
;
; MOD NOTES:
;     By moving this table later into the bank and updating
;     both the address in
;     GameLoop_RunScreenEventHandlers
;     and the table length in that function (6), you could
;     likely add new special handlers for screens
;
; XREFS:
;     GameLoop_RunScreenEventHandlers
;============================================================================

;
; XREFS:
;     GameLoop_RunScreenEventHandlers
;
SPECIAL_SCREEN_EVENT_LOOKUP_TABLE:          ; [$ef63]
    pointer ScreenEvents_HandlePathToMasconEvent-1 ; [0]: Handle pushable
                                                   ; block on path to Mascon.
    pointer ScreenEvents_HandleBoss-1       ; [1]: Handle a standard boss
                                            ; battle.
    pointer ScreenEvents_HandleFinalBossKilled-1 ; [2]: Handle end-game
                                                 ; sequence after killing the
                                                 ; final boss.


;============================================================================
; Handle checking the path to Mascon at the final fountain.
;
; This is a special screen event handler that checks whether
; the player has completed the quests to reach Mascon.
;
; This is only executed on the first tick for the screen,
; and disabled immediately after. If the fountains were
; completed, this will remove the block obscuring the
; ladder to Mascon and then drop down the ladder.
;
; INPUTS:
;     Quests:
;         The quests completed.
;
; OUTPUTS:
;     CurrentScreen_SpecialEventID:
;         The unset special event ID, to prevent this from
;         running more than once.
;
;     PathToMascon_FountainCoverPos:
;         Set to the block position to clear.
;
;     PathToMascon_Opening:
;         Set to 1.
;
; CALLS:
;     Game_OpenPathToMascon
;
; XREFS:
;     SPECIAL_SCREEN_EVENT_LOOKUP_TABLE
;     [$PRG15_MIRROR::ef63]
;============================================================================
ScreenEvents_HandlePathToMasconEvent:       ; [$ef69]
    ;
    ; Check if the path to Mascon has been opened.
    ;
    LDA a:Quests                            ; Load the list of completed
                                            ; quests.
    AND #$20                                ; Is the Mascon path completed?
    BEQ @_notCompleted                      ; If not, jump to return.


    ;
    ; The quest has been completed. Turn off this handler (clear
    ; the event ID) and manage the transition for the path to
    ; Mascon.
    ;
    LDA #$ff
    STA a:CurrentScreen_SpecialEventID      ; Unset the special event ID.
    LDA #$01
    STA PathToMascon_Opening                ; Set the path to Mascon as
                                            ; opened.
    LDA #$56
    STA PathToMascon_FountainCoverPos       ; Set the pushable block to X=6,
                                            ; Y=5.
    LDX #$00
    JMP Game_OpenPathToMascon               ; Drop the ladder down to reach
                                            ; Mascon.


    ;
    ; The criteria for the path wasn't set. Clear out this event
    ; ID so it won't be run until the next time the player is
    ; on the screen.
    ;
  @_notCompleted:                           ; [$ef82]
    LDA #$ff
    STA a:CurrentScreen_SpecialEventID      ; Unset the special event ID.
    RTS


;============================================================================
; DEADCODE: Check if there are sprites not of a given entity.
;
; This does not appear to be used anywhere. It only
; references itself.
;============================================================================
Sprites_HasSpritesNotOfType:                ; [$ef88]
    STA Temp_00
    LDX #$07

  @_loop:                                   ; [$ef8c]
    LDA CurrentSprites_Entities,X
    CMP #$ff
    BEQ @_prepareNextIter
    CMP Temp_00
    BEQ @_prepareNextIter
    SEC
    RTS

  @_prepareNextIter:                        ; [$ef99]
    DEX
    BPL @_loop
    CLC
    RTS


;============================================================================
; Handle checking for a boss on the screen.
;
; This is a special event handler used for boss rooms.
; It will default the music to boss battle music, and then
; check for the presence of a boss on every game tick.
;
; Once a boss has been defeated, the music will be set back
; to the default for the area and the handler will be shut
; down.
;
; INPUTS:
;     CurrentScreen_SpecialEventID:
;         The special event ID for the screen, used to
;         determine which bits of logic should run.
;
;     Areas_DefaultMusic:
;         The default music for the area.
;
; OUTPUTS:
;     Music_Current:
;         The current music being played.
;
;     CurrentScreen_SpecialEventID:
;         The updated special event ID.
;
; CALLS:
;     Sprites_HasBoss
;
; XREFS:
;     SPECIAL_SCREEN_EVENT_LOOKUP_TABLE
;     [$PRG15_MIRROR::ef65]
;============================================================================
ScreenEvents_HandleBoss:                    ; [$ef9e]
    ;
    ; Check if bit 7 is set. If not, prepare the boss battle music
    ; and initial state. This would only be done once on the screen.
    ;
    LDA a:CurrentScreen_SpecialEventID
    BMI @_checkForBoss


    ;
    ; This is the first tick on a boss battle screen. Take the
    ; opportunity to cap any item durations, and default the music
    ; to the boss battle music.
    ;
    ORA #$80                                ; Set bit 7 to only run this
                                            ; conditional on the first game
                                            ; tick.
    STA a:CurrentScreen_SpecialEventID      ; Save it.
    JSR LimitItemDurations                  ; Cap item durations within
                                            ; bounds.
    LDA #$0a
    STA Music_Current                       ; Set the music to the boss
                                            ; battle music.


    ;
    ; Check if there's a boss on screen.
    ;
  @_checkForBoss:                           ; [$efaf]
    JSR Sprites_HasBoss                     ; Check for a boss.
    BCS @_return                            ; If there is one, we're done.
                                            ; Return.


    ;
    ; The boss has been defeated. Restore the game state.
    ;
    LDA a:Areas_DefaultMusic                ; Load the default music for the
                                            ; area.
    STA Music_Current                       ; Set it as the current music.
    LDA #$ff
    STA a:CurrentScreen_SpecialEventID      ; Clear the special event ID so
                                            ; this doesn't run again.

  @_return:                                 ; [$efbe]
    RTS


;============================================================================
; Ensure Ointment and Hour Glass durations don't go below 0.
;
; If either goes below 0, it will be set to 0.
;
; INPUTS:
;     DurationOintment:
;         The Ointment duration.
;
;     DurationHourGlass:
;         The Hour Glass duration.
;
; OUTPUTS:
;     DurationOintment:
;         The updated Ointment duration.
;
;     DurationHourGlass:
;         The updated Hour Glass duration.
;
; XREFS:
;     ScreenEvents_HandleBoss
;============================================================================
LimitItemDurations:                         ; [$efbf]
    LDA a:DurationOintment                  ; Load the Ointment duration.
    BMI @_checkHourGlass                    ; If >= 0, move on to the Hour
                                            ; Glass.
    LDA #$00
    STA a:DurationOintment                  ; Set the Ointment duration to 0.

  @_checkHourGlass:                         ; [$efc9]
    LDA a:DurationHourGlass                 ; Load the Hour Glass duration.
    BMI @_return                            ; If >= 0, we're done.
    LDA #$00
    STA a:DurationHourGlass                 ; Set the Hour Glass duration to
                                            ; 0.

  @_return:                                 ; [$efd3]
    RTS


;============================================================================
; Handle checking for the death of the final boss.
;
; This is a special event handler used for the final boss
; room.
;
; If the boss dies (rather, if all sprite entities are
; cleared from the screen), this will switch back to the
; opening music and area, placing the player back in the
; King's room for the end game outro.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Music_Current:
;         Set to the Eolis music.
;
; CALLS:
;     Sound_PlayEffect
;     Sprites_HasCurrentSprites
;     EndGame_Begin
;
; XREFS:
;     SPECIAL_SCREEN_EVENT_LOOKUP_TABLE
;     [$PRG15_MIRROR::ef67]
;============================================================================
ScreenEvents_HandleFinalBossKilled:         ; [$efd4]
    JSR Sprites_HasCurrentSprites           ; Are there sprites on screen?
    BCS @_return                            ; If so, return.


    ;
    ; The final boss is dead. Transition toward the end game
    ; sequence.
    ;
    ; Start by switching the music to the Eolis music.
    ;
    LDA #$07                                ; 0x07 == Eolis music
    STA Music_Current                       ; Set as the current music.


    ;
    ; Play the "Player got hit" sound.
    ;
    LDA #$04                                ; 0x04 == Player hit sound
                                            ; effect.
    JSR Sound_PlayEffect                    ; Play it.
    JMP EndGame_Begin                       ; Begin the end-game sequence.

  @_return:                                 ; [$efe5]
    RTS


;============================================================================
; Return whether the given sprite entity is *not* on the screen.
;
; This will loop through the sprites on screen and check if any
; match the entity type provided.
;
; INPUTS:
;     A:
;         The sprite entity to check for.
;
;     CurrentSprites_Entities:
;         The list of current sprite entities on screen.
;
; OUTPUTS:
;     C:
;         0 = Sprite entity is on screen.
;         1 = Sprite entity is not on screen.
;
;     Temp_00:
;         Clobbered.
;
; XREFS:
;     SpriteBehavior_BattleHelmetDroppedByZoradohna
;     SpriteBehavior_BattleSuitDroppedByZoradohna
;     SpriteBehavior_BlackOnyxDropFromZoradohna
;     SpriteBehavior_DragonSlayerDroppedByKingGrieve
;     SpriteBehavior_MattockDroppedFromRipasheiku
;     SpriteBehavior_PendantDroppedFromRipasheiku
;     SpriteBehavior_WingBootsDroppedByZorugeriru
;============================================================================
Maybe_IsSpriteEntityNotOnScreen:            ; [$efe6]
    STA Temp_00                             ; Temp_00 =
                                            ; Sprite type for comparison.
    LDY #$07                                ; Y = 7


    ;
    ; Check the entity for this index in the current sprites list.
    ;
  @_spriteLoop:                             ; [$efea]
    LDA CurrentSprites_Entities,Y           ; Load the entity of the sprite
                                            ; at loop index.
    CMP Temp_00                             ; Is it the entity the caller is
                                            ; checking for?
    BNE @_prepareNextLoopIter               ; If not, prepare for the next
                                            ; loop iteration.


    ;
    ; The sprite entity is on the screen. Clear carry as the result.
    ;
    CLC                                     ; Return false.
    RTS

  @_prepareNextLoopIter:                    ; [$eff3]
    DEY                                     ; Y--
    BPL @_spriteLoop                        ; If Y >= 0, loop.


    ;
    ; The sprite entity is not on the screen. Set carry as the
    ; result.
    ;
    SEC                                     ; Return true.
    RTS


;============================================================================
; Return whether there's a boss on screen.
;
; This loops through all the sprite entities on the screen,
; looks up the category for each, and checks if that
; category is a boss.
;
; INPUTS:
;     CurrentSprites_Entities:
;         The list of current sprite entities on screen.
;
;     SPRITE_CATEGORIES_BY_ENTITY:
;         Lookup table of entities to categories.
;
; OUTPUTS:
;     C:
;         0 if there is no boss on screen.
;         1 if there is a boss on screen.
;
; XREFS:
;     ScreenEvents_HandleBoss
;============================================================================
Sprites_HasBoss:                            ; [$eff8]
    LDX #$07                                ; X = 7 (loop counter).


    ;
    ; Check if this sprite is a boss.
    ;
  @_loop:                                   ; [$effa]
    LDY CurrentSprites_Entities,X           ; Load the sprite entity at that
                                            ; index.
    LDA SPRITE_CATEGORIES_BY_ENTITY,Y       ; Load the category for the
                                            ; entity.
    CMP #$07                                ; Is it 7 (boss)?
    BNE @_notBoss                           ; If not, jump.


    ;
    ; There is a boss on screen. Return true.
    ;
    SEC                                     ; Return true.
    RTS

  @_notBoss:                                ; [$f006]
    DEX                                     ; X--
    BPL @_loop                              ; If X >= 0, loop.


    ;
    ; There is no boss on screen. Return false.
    ;
    CLC                                     ; Return false.
    RTS


;============================================================================
; Return whether any sprites are currently on screen.
;
; INPUTS:
;     CurrentSprites_Entities:
;         The types of sprites currently on the screen.
;
; OUTPUTS:
;     C:
;         1 if there are sprites on the screen.
;         0 if there are no sprites.
;
; XREFS:
;     ScreenEvents_HandleFinalBossKilled
;============================================================================
Sprites_HasCurrentSprites:                  ; [$f00b]
    LDY #$07                                ; Y = 7 (loop counter).

  @_loop:                                   ; [$f00d]
    LDA CurrentSprites_Entities,Y           ; Load the sprite entity at that
                                            ; index.
    CMP #$ff                                ; Is it unset?
    BEQ @_prepareNextLoopIter               ; If yes, jump to prepare for the
                                            ; next loop iteration.


    ;
    ; A sprite entity was found. Return true.
    ;
    SEC                                     ; Return true.
    RTS

  @_prepareNextLoopIter:                    ; [$f016]
    DEY                                     ; Y--
    BPL @_loop                              ; If Y >= 0, loop.


    ;
    ; A sprite entity was not found. Return false.
    ;
    CLC                                     ; Return false.
    RTS


;============================================================================
; Draw part of a portrait to the screen as sprites.
;
; This will load the portrait tileinfo as an offset from
; the value referenced in PORTRAIT_APPEARANCES_OFFSET
; (TILEINFO_PORTRAITS_ADDRS) and drawn as a sprite to
; the screen.
;
; INPUTS:
;     A:
;         The offset into the portrait tileinfo table.
;
;     CurrentROMBank:
;         The current ROM bank to switch back to.
;
; OUTPUTS:
;     Temp_Addr_U:
;     Temp_Addr_L:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     Sprite_Draw
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================
Sprite_DrawPortraitPartAppearance:          ; [$f01b]
    TAY                                     ; Y = A (appearance offset).


    ;
    ; Save the current ROM bank and switch to bank 7.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$07                                ; Bank 7 = Sprites
    JSR MMC1_UpdateROMBank                  ; Switch to it.


    ;
    ; Load the address to load sprite images from.
    ;
    ; With the addresses stored in PORTRAIT_APPEARANCES_OFFSET
    ; and
    ; PORTRAIT_APPEARANCES_OFFSET+1, this should put us at a
    ; starting point of {@address PRG7::AFD5}, or {@address PRG7::B0D5} if
    ; offset overflowed.
    ;
    TYA                                     ; A = Y (appearance offset).
    ASL A                                   ; Convert to a word boundary for
                                            ; an index into the tileinfo
                                            ; table.
    TAY                                     ; Y = A (index).
    PHP                                     ; Push flags to the stack.
    LDA a:PORTRAIT_APPEARANCES_OFFSET       ; Load the lower byte of the
                                            ; portraits tileinfo address.
    STA Temp_Addr_L                         ; Store as the lower byte in the
                                            ; read address.
    LDA a:PORTRAIT_APPEARANCES_OFFSET+1     ; Load the upper byte of the
                                            ; portraits tileinfo address.
    PLP                                     ; Pop flags from the stack.
    ADC #$80                                ; Add 0x80 to the upper byte.
    STA Temp_Addr_U                         ; And store it.
    JMP Sprite_Draw                         ; Draw the portrait sprite.

;============================================================================
; TODO: Document Sprite_SetPlayerAppearanceAddr
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawShield
;     Player_DrawWeapon
;     FUN_PRG15_MIRROR__ec58
;     Player_DrawBody
;============================================================================
Sprite_SetPlayerAppearanceAddr:             ; [$f039]
    TAY
    LDA a:CurrentROMBank
    PHA
    LDX #$07
    JSR MMC1_UpdateROMBank
    TYA


    ;
    ; Load the address to load sprite images from.
    ;
    ; With the addresses stored in PLAYER_APPEARANCES_OFFSET
    ; and
    ; PLAYER_APPEARANCES_OFFSET+1, this should put us at a
    ; starting
    ; point of {@address PRG7::A9F1}, or {@address PRG7::AAF1} if offset
    ; overflowed.
    ;
    ASL A
    TAY
    PHP
    LDA a:PLAYER_APPEARANCES_OFFSET
    STA Temp_Addr_L
    LDA a:PLAYER_APPEARANCES_OFFSET+1
    PLP
    ADC #$80
    STA Temp_Addr_U
    JMP Sprite_Draw
;============================================================================
; TODO: Document Sprite_SetAppearanceAddrFromOffset
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_EnterNextAppearancePhase
;     CastMagic_SetAppearance
;     UI_DrawPromptInputSymbol
;============================================================================
Sprite_SetAppearanceAddrFromOffset:         ; [$f057]
    ;
    ; Switch to ROM bank 7 (PRG).
    ;
    TAY                                     ; Y = A (offset)
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$07
    JSR MMC1_UpdateROMBank                  ; Switch to bank 7 (PRG).


    ;
    ; Load the address to load sprite images from.
    ;
    ; With the addresses stored in SPRITE_APPEARANCES_OFFSET
    ; and
    ; SPRITE_APPEARANCES_OFFSET+1, this should put us at a
    ; starting
    ; point of {@address PRG7::9036}, or {@address PRG7::9136} if offset
    ; overflowed.
    ;
    TYA                                     ; A = Y (restore offset)
    ASL A                                   ; Multiply offset by 2, to get
                                            ; word boundaries in the lookup
                                            ; table.
    TAY                                     ; Y = A (updated offset)
    PHP                                     ; Push flags and stack pointer.
    LDA a:SPRITE_APPEARANCES_OFFSET         ; Load the lower byte of the
                                            ; address to read from.
    STA Temp_Addr_L                         ; Store it for processing.
    LDA a:SPRITE_APPEARANCES_OFFSET+1       ; Load the upper byte.
    PLP                                     ; Pop the flags and stack
                                            ; pointer.
    ADC #$80                                ; Add 0x80 + carry to the upper
                                            ; byte.
    STA Temp_Addr_U                         ; Store it.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Begin drawing a sprite.
;
; This will load the tiles information for a sprite,
; determining the main bounding box, the extents, the
; pivot point when flipping, and generating a suitable
; X and Y position to begin drawing tiles.
;
; Tile information begins with a header in the following
; form:
;
;     Byte 0: Upper nibble = Row count - 1
;             Lower nibble = Column count -1
;     Byte 1: Offset X in pixels (if positive, extends the
;             sprite right; if negative, extends left)
;     Byte 2: Offset Y in pixels (if positive, extends the
;             sprite downward; if negative, extends upward)
;     Byte 3: Block-aligned X pixel pivot position used to
;             render the main body of the sprite in a stable
;             position when flipping horizontally (only used
;             in Sprite_Draw_FlippedHoriz.
;
; This is followed by bytes pointing to tile indexes for the
; list of available tiles for the sprite (with 0xFF meaning
; "empty tile"). Sprite_Draw_Standard and
; Sprite_Draw_FlippedHoriz handles this.
;
; INPUTS:
;
;
; XREFS:
;     Sprite_DrawPortraitPartAppearance
;     Sprite_SetPlayerAppearanceAddr
;============================================================================
Sprite_Draw:                                ; [$f072]
    ;
    ; Load the offset within our starting address stored in
    ; Temp_Addr_L.
    ;
    LDA (Temp_Addr_L),Y                     ; Load the offset for the lower
                                            ; byte.
    STA Sprite_TileInfo_ReadAddr_L          ; Store it.
    INY                                     ; Y++ (offset)
    LDA (Temp_Addr_L),Y                     ; Load the upper byte.
    ADC #$80                                ; Add 0x80 + carry to it.
    STA Sprite_TileInfo_ReadAddr_U          ; Store it.


    ;
    ; Load a byte from that offset. The upper nibble will be
    ; stored at Temp_Sprites_RowsRemaining and the lower nibble
    ; will
    ; be in Temp_Sprites_ColsRemaining.
    ;
    LDY #$00                                ; Y = 0 (read offset)
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the value at that address.
    AND #$0f                                ; Discard the upper nibble.
    STA Temp_Sprites_ColsRemaining          ; Store it.
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load it again.
    LSR A                                   ; Move upper nibble to lower.
    LSR A
    LSR A
    LSR A
    STA Temp_Sprites_RowsRemaining          ; Store it.


    ;
    ; Initialize Sprite_TileInfo_OffsetX and
    ; Sprite_TileInfo_OffsetY
    ; to 0 by default.
    ;
    LDA #$00                                ; A = 0
    STA Sprite_TileInfo_OffsetX             ; Set to 0.
    STA Sprite_TileInfo_OffsetY             ; Set to 0.


    ;
    ; Load the X offset extending from the main bounding box
    ; to fill with tiles.
    ;
    ; This may be negative (filling tiles left of the main bounding
    ; box of the sprite) or positive (adding padding left of the
    ; sprite).
    ;
    INY                                     ; Y++ (read offset)
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the X offset byte.
    BPL @_calcX                             ; If > 0, jump.
    DEC Sprite_TileInfo_OffsetX             ; Set to 0xFF. This will set C=1
                                            ; for the add below.

  @_calcX:                                  ; [$f09a]
    CLC
    ADC Arg_DrawSprite_PosX                 ; Add
                                            ; Arg_DrawSprite_PosX
                                            ; to the X offset (which may be
                                            ; negative, extending left).
    STA Temp_Sprites_NormXPos               ; Store it.


    ;
    ; Calculate the new value for Sprite_TileInfo_OffsetX.
    ;
    LDA #$00                                ; A = 0
    ADC Sprite_TileInfo_OffsetX             ; Add our stored value.
    STA Sprite_TileInfo_OffsetX             ; Store it back out.


    ;
    ; Update the drawn X position to factor in any screen scrolling
    ; offsets.
    ;
    LDA Temp_Sprites_NormXPos               ; Load the new calculated X
                                            ; position.
    SEC
    SBC PPU_ScrollX                         ; Subtract any scrolling offset
                                            ; that may be set.
    STA Temp_Sprites_NormXPos               ; Store it back.


    ;
    ; Load the Y offset extending from the main bounding box
    ; to fill with tiles.
    ;
    ; This may be negative (filling tiles above the main bounding
    ; box of the sprite) or positive (adding padding above the
    ; sprite).
    ;
    INY                                     ; Y++ (read offset)
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the Y offset byte.
    BPL @_calcY                             ; If > 0, jump.
    DEC Sprite_TileInfo_OffsetY             ; Set to 0xFF. This will set C=1
                                            ; for the add below.

  @_calcY:                                  ; [$f0b3]
    CLC
    ADC Arg_DrawSprite_PosY                 ; Add
                                            ; Arg_DrawSprite_PosY
                                            ; to the Y offset (which may be
                                            ; negative, extending up).
    STA Temp_Sprites_NormYPos               ; Store it.


    ;
    ; Add Carry to the offset, if it's set.
    ;
    LDA #$00
    ADC Sprite_TileInfo_OffsetY             ; A = Y offset + carry (from
                                            ; above).
    STA Sprite_TileInfo_OffsetY             ; Store it.


    ;
    ; And then always offset by 32 pixels (the HUD height).
    ;
    LDA Temp_Sprites_NormYPos               ; Load the normalized Y position.
    CLC
    ADC #$20                                ; Add 32 (HUD height in pixels).
    STA Temp_Sprites_NormYPos               ; Store it.


    ;
    ; Add Carry again to the Y offset, if set. This happens if
    ; the HUD offset causes the value to overflow.
    ;
    LDA Sprite_TileInfo_OffsetY             ; Load the Y offset.
    ADC #$00                                ; Add Carry, if set.
    STA Sprite_TileInfo_OffsetY             ; Store it.


    ;
    ; Load the block-aligned X pixel pivot point into the sprite
    ; used to anchor the sprite when flipping. This is generally
    ; the left-most tile of the main body of the sprite. When
    ; the sprite turns around, it pivots at this point.
    ;
    ; Only Sprite_Draw_FlippedHoriz uses this.
    ;
    INY                                     ; Y++ (read offset).
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the pivot point in pixels.
    STA Temp_Addr_L                         ; Store it for use if drawing
                                            ; flipped.


    ;
    ; Advance our start read address for this sprite to skip the 4
    ; bytes we just read.
    ;
    LDA Sprite_TileInfo_ReadAddr_L          ; Load the lower byte of the
                                            ; sprite address.
    CLC
    ADC #$04                                ; Advance by 4 (skipping loaded
                                            ; state).
    STA Sprite_TileInfo_ReadAddr_L          ; Set as the new lower byte of
                                            ; the address.
    LDA Sprite_TileInfo_ReadAddr_U          ; Load the upper byte.
    ADC #$00                                ; Add the carry, if lower
                                            ; overflowed.
    STA Sprite_TileInfo_ReadAddr_U          ; Set it.


    ;
    ; We'll continue on based on whether the sprite is flipped.
    ;
    LDA CurrentSprite_FlipMask              ; Load the flip mask.
    AND #$c0                                ; Keep only the horiz/vert flip
                                            ; bits.
    STA CurrentSprite_FlipMask              ; Store as a new flip mask.
    LDA CurrentSprite_FlipMask              ; Load the resulting flip mask.
    AND #$40                                ; Check if it's flipped
                                            ; horizontally.
    BEQ Sprite_Draw_Standard                ; If not, draw in standard
                                            ; orientation.
    JMP Sprite_Draw_FlippedHoriz            ; Else, draw horizontally
                                            ; flipped.


;============================================================================
; Draw all tiles for a sprite in the standard orientation.
;
; This will loop through all rows of the sprite, then all
; columns in a row, drawing each tile of the sprite.
;
; Tiles are read from the sprite information in bank 7,
; which is in the following form:
;
;     Byte 0: Upper = Row count - 1
;             Lower = Column count -1
;     Byte 1: Offset X (between first tile and "front" tile
;             used for alignment)
;     Byte 2: Offset Y
;     Byte 3: Block-aligned pixel position of the "front"
;             tile for alignment when flipping horizontally
;
; Followed by bytes pointing to tile indexes for the list
; of available tiles for the sprite (with 0xFF meaning
; "empty tile").
;
; INPUTS:
;
;
; XREFS:
;     Sprite_Draw
;============================================================================
Sprite_Draw_Standard:                       ; [$f0ec]
    ;
    ; The sprite is not flipped.
    ;
    LDA #$00                                ; A = 0.
    STA Temp_Sprites_TileYOffset            ; Store it as the starting tiles
                                            ; Y offset.
    TAY                                     ; Y = A (0, loop counter).

  @_drawRowLoop:                            ; [$f0f1]
    LDA Temp_Sprites_ColsRemaining          ; Load the number of tile columns
                                            ; remaining.
    PHA                                     ; Push it to the stack.
    LDA #$00                                ; A = 0.
    STA Temp_Sprites_TileXOffset            ; Store as the start tiles X
                                            ; offset.


    ;
    ; Check if the current sprite data value is not 0xFF (unset).
    ;
  @_drawColLoop:                            ; [$f0f8]
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the value at the sprite
                                            ; data read address.
    CMP #$ff                                ; Is it 0xFF?
    BEQ @_prepareNextCol                    ; If so, skip this row.


    ;
    ; It's not unset.
    ;
    ; Begin checking if we can add to the PPU.
    ;
    ; First we'll check if we can add sprites, or if the slots
    ; are full.
    ;
    LDA Sprites_SlotsFull                   ; Can we add sprites this frame?
    BNE @_endColLoop                        ; If not, jump, try the next row.


    ;
    ; We can add sprites.
    ;
    ; Calculate the X coordinate as:
    ;
    ;     X = Temp_Sprites_NormXPos +
    ;         SPRITE_TILE_BLOCK_POSITIONS[Temp_Sprites_TileXOffset]
    ;
    ; With Temp_Sprites_TileXOffset being a block
    ; offset (each block being 16 pixels), the sprites are
    ; effectively started at a block position and then added
    ; normalized to a pixel position.
    ;
    LDX Temp_Sprites_TileXOffset            ; X = tile X offset.
    LDA Temp_Sprites_NormXPos               ; A = normalized X position.
    ADC SPRITE_TILE_BLOCK_POSITIONS,X       ; A += the offset from the lookup
                                            ; table at X.
    STA Temp_00                             ; Store it temporarily.


    ;
    ; Check if this tile would fit on screen in the X direction.
    ;
    LDA Sprite_TileInfo_OffsetX             ; Load the default X position.
    ADC #$00                                ; Add carry (from overflow), if
                                            ; set.
    BNE @_endColLoop                        ; If it doesn't fit on screen,
                                            ; jump.


    ;
    ; X could fit on screen. Check Y.
    ;
    ; This will be calculated as:
    ;
    ;     Y = Temp_Sprites_NormYPos +
    ;         SPRITE_TILE_BLOCK_POSITIONS[Temp_Sprites_TileYOffset]
    ;
    ; Same logic applies as aboe.
    ;
    LDX Temp_Sprites_TileYOffset            ; X = tile Y offset.
    LDA Temp_Sprites_NormYPos               ; A = normalized Y position.
    ADC SPRITE_TILE_BLOCK_POSITIONS,X       ; A += the offset from the lookup
                                            ; table at X.
    STA Temp_01                             ; Store it temporarily.


    ;
    ; Check if this tile would fit on screen in the Y direction.
    ;
    LDA Sprite_TileInfo_OffsetY             ; Load the default Y position.
    ADC #$00                                ; Add carry (from overflow), if
                                            ; set.
    BNE @_endColLoop                        ; If it doesn't fit on screen,
                                            ; jump.


    ;
    ; The sprite fits on screen.
    ;
    ; We'll begin writing the sprite to DMA.
    ;
    TYA                                     ; A = Y (loop counter)
    PHA                                     ; Push our loop counter to the
                                            ; stack.
    LDA Sprites_SpriteSlot                  ; Load the slot for this sprite.
    ASL A                                   ; Multiply by 4 (for Y, tile ID,
                                            ; attributes, X bytes).
    ASL A
    EOR Sprites_StartSlotRange


    ;
    ; Write the sprite Y position to DMA.
    ;
    TAX                                     ; X = A (read offset)
    LDA Temp_01                             ; Load the Y position.
    STA SPRITE_0_RANGE_1_START,X            ; Write the Y position to DMA.


    ;
    ; Write the sprite tile ID to DMA.
    ;
    ; The byte value is an index into the list of PPU tile IDs.
    ;
    INX                                     ; X++ (read offset)
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the tile index.
    CLC
    ADC Sprites_PPUOffset                   ; Add the PPU starting offset for
                                            ; the list of tiles.
    STA SPRITE_0_RANGE_1_START,X            ; Write the tile ID to DMA.


    ;
    ; Write the sprite attributes.
    ;
    ; This will primarily be the palette, but it may also contain
    ; a flip mask. The flip mask will be normalized based on
    ; whether the full sprite is flipped.
    ;
    INX                                     ; X++ (read offset)
    INY                                     ; Y++ (loop counter)
    LDA (Sprite_TileInfo_ReadAddr_L),Y      ; Load the attribute.
    EOR CurrentSprite_FlipMask              ; XOR with the flip mask.
    STA Temp_01                             ; And store it.


    ;
    ; Calculate visibility for this tile.
    ;
    ; This will check if the tile is even or odd, using that
    ; as an index into DRAW_SPRITE_VISIBILITY_MASK.
    ;
    ; If the tile is not visible, it will be set to background
    ; priority.
    ;
    LDA Temp_Sprites_TileXOffset            ; Load the tile X offset.
    AND #$01                                ; Convert to an even/odd value
                                            ; for the visibility lookup
                                            ; table.
    TAY                                     ; Y = result.
    LDA MovingSpriteVisibility              ; Load the moving visibility of
                                            ; the sprite.
    AND DRAW_SPRITE_VISIBILITY_MASK,Y       ; AND with the lookup table,
                                            ; determining priority.
    BEQ @_storeAttribute                    ; If non-0, keep foreground
                                            ; priority. Else...


    ;
    ; The tile is obscured. Set the sprite to be a
    ; background sprite.
    ;
    LDA Temp_01                             ; Load the attribute calculated
                                            ; above.
    ORA #$20                                ; Set background priority.
    STA Temp_01                             ; And store it.


    ;
    ; Write the tile attribute to DMA.
    ;
  @_storeAttribute:                         ; [$f151]
    LDA Temp_01                             ; Load the calculated attribute.
    STA SPRITE_0_RANGE_1_START,X            ; Store the tile attributes to
                                            ; DMA.


    ;
    ; Write the sprite X position to DMA.
    ;
    INX                                     ; X++ (read offset)
    LDA Temp_00                             ; Load the X position.
    STA SPRITE_0_RANGE_1_START,X            ; Write the X coordinate to DMA.


    ;
    ; Prepare for the next column.
    ;
    JSR Sprites_IncNextSpriteSlot           ; Finish up with this sprite's
                                            ; state.
    PLA                                     ; Pull A (loop counter) from
                                            ; stack.
    TAY                                     ; Y = A (loop counter)

  @_endColLoop:                             ; [$f161]
    INY                                     ; Y++ (loop counter)

  @_prepareNextCol:                         ; [$f162]
    INY                                     ; Y++ (loop counter)
    INC Temp_Sprites_TileXOffset            ; Increment the tile X offset.
    DEC Temp_Sprites_ColsRemaining          ; Decrement the number of columns
                                            ; remaining.
    BPL @_drawColLoop                       ; If there are columns remaining,
                                            ; loop.


    ;
    ; We're on the next row. Reset the column count and advance
    ; the row counter.
    ;
    PLA                                     ; Pop the original total columns
                                            ; remaining.
    STA Temp_Sprites_ColsRemaining          ; Store as the new columns count
                                            ; for the next row.
    INC Temp_Sprites_TileYOffset            ; Increment the tile Y offset.
    DEC Temp_Sprites_RowsRemaining          ; Decrement the number of rows
                                            ; remaining.
    BMI Sprite_Draw_Finish                  ; If there are no more rows,
                                            ; finish the drawing.
    JMP @_drawRowLoop                       ; Else, loop to draw the next
                                            ; row.

;============================================================================
; TODO: Document Sprite_Draw_Finish
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_Draw_FlippedHoriz
;     Sprite_Draw_Standard
;============================================================================
Sprite_Draw_Finish:                         ; [$f175]
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    LDA #$00
    STA Sprites_PPUOffset
    STA MovingSpriteVisibility
    RTS
;============================================================================
; TODO: Document Sprite_Draw_FlippedHoriz
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_Draw
;============================================================================
Sprite_Draw_FlippedHoriz:                   ; [$f181]
    ;
    ; The sprite is flipped.
    ;
    LDA #$00
    STA Temp_05                             ; Set Temp_05 =
                                            ; 0.
    LDY Temp_Sprites_ColsRemaining          ; Load the number of columns
                                            ; remaining for a row.
    INY                                     ; Y++ (convert from 0-based
                                            ; count)
    TYA                                     ; A = result
    ASL A                                   ; Multiply the columns by 8.
    ASL A
    ASL A
    STA Temp_04                             ; Store for temporary use.
    LDA Temp_Addr_L                         ; A = 4th byte from the sprite
                                            ; information.
    ASL A                                   ; A = A * 2
    SEC
    SBC Temp_04                             ; A = A - normalized column
                                            ; value.
    BPL @LAB_PRG15_MIRROR__f198             ; If negative, jump.
    DEC Temp_05                             ; Else, it's positive. Decrement
                                            ; Temp_05.

  @LAB_PRG15_MIRROR__f198:                  ; [$f198]
    CLC
    ADC Temp_Sprites_NormXPos               ; A = A + normalized X position
    STA Temp_Sprites_NormXPos               ; Store as the new position.
    LDA Sprite_TileInfo_OffsetX
    ADC Temp_05
    STA Sprite_TileInfo_OffsetX
    LDA #$00
    STA Temp_Sprites_TileYOffset
    TAY

  @LAB_PRG15_MIRROR__f1a8:                  ; [$f1a8]
    LDA Temp_Sprites_ColsRemaining
    STA Temp_Sprites_TileXOffset

  @LAB_PRG15_MIRROR__f1ac:                  ; [$f1ac]
    LDA (Sprite_TileInfo_ReadAddr_L),Y
    CMP #$ff
    BEQ @LAB_PRG15_MIRROR__f216
    LDA Sprites_SlotsFull
    BNE @LAB_PRG15_MIRROR__f215
    LDX Temp_Sprites_TileXOffset
    LDA Temp_Sprites_NormXPos
    ADC SPRITE_TILE_BLOCK_POSITIONS,X
    STA Temp_00
    LDA Sprite_TileInfo_OffsetX
    ADC #$00
    BNE @LAB_PRG15_MIRROR__f215
    LDX Temp_Sprites_TileYOffset
    LDA Temp_Sprites_NormYPos
    ADC SPRITE_TILE_BLOCK_POSITIONS,X
    STA Temp_01
    LDA Sprite_TileInfo_OffsetY
    ADC #$00
    BNE @LAB_PRG15_MIRROR__f215
    TYA
    PHA
    LDA Sprites_SpriteSlot
    ASL A
    ASL A
    EOR Sprites_StartSlotRange
    TAX
    LDA Temp_01
    STA SPRITE_0_RANGE_1_START,X
    INX
    LDA (Sprite_TileInfo_ReadAddr_L),Y
    CLC
    ADC Sprites_PPUOffset
    STA SPRITE_0_RANGE_1_START,X
    INX
    INY
    LDA (Sprite_TileInfo_ReadAddr_L),Y
    EOR CurrentSprite_FlipMask
    STA Temp_01
    LDA Temp_Sprites_TileXOffset
    AND #$01
    TAY
    LDA MovingSpriteVisibility
    AND BYTE_ARRAY_PRG15_MIRROR__f226,Y
    BEQ @LAB_PRG15_MIRROR__f205
    LDA Temp_01
    ORA #$20
    STA Temp_01

  @LAB_PRG15_MIRROR__f205:                  ; [$f205]
    LDA Temp_01
    STA SPRITE_0_RANGE_1_START,X
    INX
    LDA Temp_00
    STA SPRITE_0_RANGE_1_START,X
    JSR Sprites_IncNextSpriteSlot
    PLA
    TAY

  @LAB_PRG15_MIRROR__f215:                  ; [$f215]
    INY

  @LAB_PRG15_MIRROR__f216:                  ; [$f216]
    INY
    DEC Temp_Sprites_TileXOffset
    BPL @LAB_PRG15_MIRROR__f1ac
    INC Temp_Sprites_TileYOffset
    DEC Temp_Sprites_RowsRemaining
    BPL @LAB_PRG15_MIRROR__f1a8
    JMP Sprite_Draw_Finish

;
; XREFS:
;     Sprite_Draw_Standard
;
DRAW_SPRITE_VISIBILITY_MASK:                ; [$f224]
    .byte $01                               ; [0]: Trailing visibility
    .byte $02                               ; [1]: Leading visibility

;
; XREFS:
;     Sprite_Draw_FlippedHoriz
;
BYTE_ARRAY_PRG15_MIRROR__f226:              ; [$f226]
    .byte $02                               ; [0]:
    .byte $01                               ; [1]:


;============================================================================
; Increment the sprite slot, and mark when full.
;
; This alternates the sprite slots between 0-31 and 32-63.
; When populating 0-31, it will track whether all slots are
; full, and if so, Sprites_SlotsFull will be set
; to prevent further sprites from being added.
;
; INPUTS:
;     Sprites_SpriteSlot:
;         The current slot for the next sprite.
;
; OUTPUTS:
;     Sprites_SpriteSlot:
;         The next slot for the next sprite, if updated.
;
;     Sprites_SlotsFull:
;         Set to 1 (rather, incremented, but practically)
;         if the slots are full.
;
; XREFS:
;     Sprite_Draw_FlippedHoriz
;     Sprite_Draw_Standard
;============================================================================
Sprites_IncNextSpriteSlot:                  ; [$f228]
    ;
    ; Alternate between sprites 0-31 and sprites 32-63.
    ;
    ; The bit being flipped is bit 5, value 32.
    ;
    LDA Sprites_SpriteSlot                  ; Load the sprite slot ID.
    EOR #$20                                ; Cap the value to < 32.
    STA Sprites_SpriteSlot                  ; Store the result.


    ;
    ; If we're populating sprites 0-31, we'll check if we've
    ; hit the cap. If we're populating 32-63, we're done.
    ;
    AND #$20                                ; Check if we're in 32-63.
    BNE @_return                            ; If so, return.


    ;
    ; It's in sprite range 0-31.
    ;
    INC Sprites_SpriteSlot                  ; Increase the sprite slot.
    LDA Sprites_SpriteSlot                  ; Load the new slot.
    CMP #$20                                ; Are there slots left?
    BCC @_return                            ; If so, return.


    ;
    ; The slots are full. Mark it.
    ;
    INC Sprites_SlotsFull                   ; Mark slots as full.

  @_return:                                 ; [$f23c]
    RTS

;
; XREFS:
;     Sprite_Draw_FlippedHoriz
;     Sprite_Draw_Standard
;
SPRITE_TILE_BLOCK_POSITIONS:                ; [$f23d]
    .byte $00                               ; [0]:
    .byte $08                               ; [1]:
    .byte $10                               ; [2]:
    .byte $18                               ; [3]:
    .byte $20                               ; [4]:
    .byte $28                               ; [5]:
    .byte $30                               ; [6]:
    .byte $38                               ; [7]:
    .byte $40                               ; [8]:
    .byte $48                               ; [9]:
    .byte $50                               ; [10]:
    .byte $58                               ; [11]:
    .byte $60                               ; [12]:
    .byte $68                               ; [13]:
    .byte $70                               ; [14]:
    .byte $78                               ; [15]:


;============================================================================
; Draw the portrait to the PPU.
;
; This will load the portrait tiles and palette and
; draw them to the PPU.
;
; INPUTS:
;     A:
;         The portrait ID to draw.
;
; OUTPUTS:
;     IScript_PortraitID:
;         The new portrait ID.
;
;     Palette_SavedIndex:
;         A saved copy of the current palette ID.
;
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         Clobbered.
;
; CALLS:
;     Game_WaitForOAMReset
;     IScripts_LoadPortraitTilesAddress
;     IScripts_DrawPortraitTileToPPU
;     PPUBuffer_WritePalette
;     Screen_LoadSpritePalette
;
; XREFS:
;     IScripts_Begin
;============================================================================
IScripts_LoadPortraitTiles:                 ; [$f24d]
    ;
    ; Check if a portrait ID is set.
    ;
    STA a:IScript_PortraitID                ; Set the current portrait ID.
    TAX                                     ; X = result.
    BMI @_return                            ; If unset, return.


    ;
    ; The portrait ID is set. Load the address and wait for an
    ; OAM reset.
    ;
    JSR IScripts_LoadPortraitTilesAddress   ; Load the tiles address for this
                                            ; portrait ID.
    JSR Game_WaitForOAMReset                ; Wait for OAM reset.


    ;
    ; Save the sprite palette and switch to palette 2 for the
    ; portrait.
    ;
    LDA a:Palette_SpritePaletteIndex        ; Load the current sprite palette
                                            ; index
    STA a:Palette_SavedIndex                ; And save it for later.
    LDA #$02
    JSR Screen_LoadSpritePalette            ; Load palette 2.
    JSR PPUBuffer_WritePalette              ; Write the palette to the PPU.


    ;
    ; Set the target PPU address to draw the portrait to.
    ; This will be $0900.
    ;
    LDA #$09                                ; Upper byte = 0x09.
    STA PPU_TargetAddr_U                    ; Set it.
    LDA #$00                                ; Lower byte = 0x00.
    STA PPU_TargetAddr                      ; Set it.


    ;
    ; Begin drawing the portrait. This will loop up to
    ; 256 times, drawing 16 tiles each.
    ;
    LDY #$00                                ; Y = 0 (loop counter).

  @_drawLoop:                               ; [$f271]
    TYA                                     ; A = Y (loop counter).
    PHA                                     ; Push it to the stack.
    JSR IScripts_DrawPortraitTileToPPU      ; Draw a 16-byte tile to the PPU.
    BCS @_finishDrawing
    PLA                                     ; Pop the loop counter from the
                                            ; stack.
    TAY                                     ; Set back in Y.
    INY                                     ; Y++
    BNE @_drawLoop                          ; If not wrapped to 0, loop.

  @_return:                                 ; [$f27d]
    RTS


    ;
    ; The portrait is finished.
    ;
  @_finishDrawing:                          ; [$f27e]
    PLA                                     ; Pop the loop counter from the
                                            ; stack.
    TAY                                     ; Set back in Y.
    RTS


;============================================================================
; Clear the portrait from the textbox.
;
; INPUTS:
;     Palette_SavedIndex:
;         The palette index to restore.
;
; OUTPUTS:
;     IScript_PortraitID:
;         Set to 0xFF.
;
; CALLS:
;     Game_WaitForOAMReset
;     Screen_LoadSpritePalette
;     PPUBuffer_WritePalette
;     MMC1_LoadBankAndJump
;     GameLoop_LoadSpriteImages
;
; XREFS:
;     IScriptAction_EndScript
;============================================================================
IScripts_ClearPortraitImage:                ; [$f281]
    LDA #$ff
    STA a:IScript_PortraitID                ; Clear the portrait ID.
    JSR Game_WaitForOAMReset                ; Wait for OAM reset.
    LDA a:Palette_SavedIndex                ; Load the saved sprite palette
                                            ; ID.
    JSR Screen_LoadSpritePalette            ; Load that palette's data.
    JSR PPUBuffer_WritePalette              ; Write to the PPU buffer.


    ;
    ; Switch to bank 14 and run
    ; GameLoop_LoadSpriteImages
    ; (from bank 15).
    ;
    JSR MMC1_LoadBankAndJump                ; Load sprite imagesin bank 14.
    .byte BANK_14_LOGIC                     ; Bank = 14 Address =
                                            ; GameLoop_LoadSpriteImages
    pointer GameLoop_LoadSpriteImages-1     ; GameLoop_LoadSpriteImages
                                            ; [$PRG15_MIRROR::f296]

  @_afterFarJump:                           ; [$f298]
    RTS


    ;
    ; The portrait ID is unset. There's nothing to do.
    ;
    ;
    ; XREFS:
    ;     IScripts_DrawPortraitAnimationFrame
    ;
IScripts_DrawPortraitAnimationFrame_Unset:  ; [$f299]
    PLA                                     ; Clean up the stack, popping the
                                            ; pushed frame.
    RTS


;============================================================================
; Draw a frame of portrait animation.
;
; This will draw the general portrait image and then
; layer on the eyes and mouth, animating them.
;
; Eyes will blink every other frame. Mouths will move
; every other frame.
;
; INPUTS:
;     IScript_PortraitID:
;         The current portrait ID.
;
; OUTPUTS:
;     Sprites_PPUOffset:
;         Clobbered.
;
; CALLS:
;     IScripts_GetPortraitOffset
;     Sprite_DrawPortraitPartAppearance
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;============================================================================
IScripts_DrawPortraitAnimationFrame:        ; [$f29b]
    PHA                                     ; Push the frame to the stack.
    LDA a:IScript_PortraitID                ; Load the current portrait ID.
    BMI IScripts_DrawPortraitAnimationFrame_Unset ; If 0xFF, jump to finish.


    ;
    ; There's an active portrait. Begin preparing by clearing
    ; the flip mask state.
    ;
    LDA #$00
    STA CurrentSprite_FlipMask              ; Set the flip mask to 0 (not
                                            ; flipped).


    ;
    ; Update the general portrait image.
    ;
    LDA #$90
    STA Sprites_PPUOffset                   ; Set the PPU offset to $0090.
    JSR IScripts_GetPortraitOffset          ; Get the portrait offset into
                                            ; the tileinfo for the ID.
    JSR Sprite_DrawPortraitPartAppearance   ; Draw as the portrait.


    ;
    ; Update the eye animation.
    ;
    ; This will switch to new tiles every frame.
    ;
    LDA #$90
    STA Sprites_PPUOffset                   ; Set the PPU offset to $0090.
    PLA                                     ; Pull the frame from the stack.
    PHA                                     ; Push it again. We still have it
                                            ; in A.
    AND #$01                                ; Generate an even/odd index from
                                            ; it.
    TAX                                     ; X = result.
    JSR IScripts_GetPortraitOffset          ; Get the offset into the table
                                            ; for the portrait ID.
    CLC
    ADC PORTRAIT_EYE_APPEARANCE_OFFSETS,X   ; Add the eyes animation offset
                                            ; for this even/odd frame.
    JSR Sprite_DrawPortraitPartAppearance   ; Draw as the eyes.


    ;
    ; Update the mouth animation.
    ;
    ; This will switch to new tiles every other frame.
    ;
    LDA #$90
    STA Sprites_PPUOffset                   ; Set the PPU offset to $0090.
    PLA                                     ; Pull the frame from the stack.
    LSR A                                   ; Divide the frame by 2 (reducing
                                            ; the animation rate to switch
                                            ; every other frame).
    AND #$01                                ; Convert that to an even/odd
                                            ; value.
    TAX                                     ; X = result.
    JSR IScripts_GetPortraitOffset          ; Get the offset into the table
                                            ; for the portrait ID.
    CLC
    ADC PORTRAIT_MOUTH_APPEARANCE_OFFSETS,X ; Add the mouth animation offset
                                            ; for this even/odd frame.
    JMP Sprite_DrawPortraitPartAppearance   ; Draw as the mouth.


;============================================================================
; Return the offset into the portraits table for the ID.
;
; This takes a portrait ID and returns an offset into
; TILEINFO_PORTRAITS_ADDRS.
;
; INPUTS:
;     IScript_PortraitID:
;         The current portrait ID.
;
; OUTPUTS:
;     A:
;         The offset into the table.
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================
IScripts_GetPortraitOffset:                 ; [$f2d5]
    LDA a:IScript_PortraitID                ; Load the current portrait ID.
    ASL A                                   ; Multiply by 4.
    ASL A
    CLC
    ADC a:IScript_PortraitID                ; And add the ID again
                                            ; (effectively multiplying by a
                                            ; total of 5).
    RTS                                     ; Return it as A.


;============================================================================
; Offsets for the portrait eye blinking animation frames.
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================

;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;
PORTRAIT_EYE_APPEARANCE_OFFSETS:            ; [$f2df]
    .byte $01                               ; [0]:
    .byte $02                               ; [1]:


;============================================================================
; Offsets for the portrait mouth movement animation frames.
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================

;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;
PORTRAIT_MOUTH_APPEARANCE_OFFSETS:          ; [$f2e1]
    .byte $03                               ; [0]:
    .byte $04                               ; [1]:


;============================================================================
; Load the address for portrait tiles.
;
; This will switch to bank 8 and load the address used for
; the portrait tiles for the current portrait ID.
;
; Tiles are loaded from offsets into
; SPRITE_TILES_PORTRAITS_ADDRS_INDEX.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank to switch back to after load.
;
;     IScript_PortraitID:
;         The current portrait ID.
;
;     SPRITE_TILES_PORTRAITS_ADDRS_INDEX:
;         The pointer to the start of the portrait tiles
;         list.
;
; OUTPUTS:
;     Temp_Addr_U:
;     Temp_Addr_L:
;         The address for the portrait tiles.
;
; CALLS:
;     MMC1_UpdatePRGBankToStackA
;     MMC1_UpdateROMBank
;
; XREFS:
;     IScripts_LoadPortraitTiles
;============================================================================
IScripts_LoadPortraitTilesAddress:          ; [$f2e3]
    ;
    ; Switch to bank 8 for the portrait sprites.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$08                                ; Bank 8 = Sprites
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Convert a portrait ID to a word boundary for later lookup.
    ;
    LDA a:IScript_PortraitID                ; Load the portrait ID.
    ASL A                                   ; Convert to a word boundary.
    TAY                                     ; Y = result


    ;
    ; Load the address for the portrait tiles table.
    ;
    LDA a:TILES_PORTRAITS_ADDRS_INDEX_REF   ; Load the lower byte of the
                                            ; start address for the portrait
                                            ; tiles.
    STA Temp_Addr_L                         ; Store as the lower byte.
    LDA a:TILES_PORTRAITS_ADDRS_INDEX_REF+1 ; Load the upper byte of the
                                            ; portrait address.
    CLC
    ADC #$80                                ; Add 0x80 to it.
    STA Temp_Addr_U                         ; And store as the upper byte.


    ;
    ; Load the portrait from the sprite tiles list, using the
    ; portrait ID as the index.
    ;
    LDA (Temp_Addr_L),Y                     ; Load the lower byte of the
                                            ; address based on the potrait
                                            ; ID.
    PHA                                     ; Push it to the stack.
    INY                                     ; Y++ (next offset)
    LDA (Temp_Addr_L),Y                     ; Load the upper byte of the
                                            ; tile.
    CLC
    ADC #$80                                ; Add 0x80 to it.
    STA Temp_Addr_U                         ; Store as the new upper byte.
    PLA                                     ; Pop the lower byte.
    STA Temp_Addr_L                         ; Store as the lower byte.


    ;
    ; Switch back to the stored bank.
    ;
    JMP MMC1_UpdatePRGBankToStackA          ; Switch to the previous bank.


    ;
    ; The byte for the tile was 0xFF. Restore the bank
    ; and set a result of C=1, causing drawing to finish.
    ;
    ;
    ; XREFS:
    ;     IScripts_DrawPortraitTileToPPU
    ;
IScripts_DrawPortraitTileToPPU_IsDone:      ; [$f30f]
    PLA                                     ; Pop the saved bank from the
                                            ; stack.
    TAX                                     ; X = A (bank)
    JSR MMC1_UpdateROMBank                  ; Switch to it.
    SEC                                     ; Set C=1 for the result.
    RTS                                     ; Return it.


;============================================================================
; Draw a portrait tile to the PPU.
;
; This will load the next byte for the portrait, which
; represents an offset into the portrait tile list.
;
; If this is 0xFF, then drawing is complete, and this will
; return with C=1.
;
; Otherwise, the tile will be drawn to the PPU and state
; will be prepared for the next tile.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank to return to.
;
;     Temp_Addr_U:
;     Temp_Addr_L:
;         The tile information address to read from.
;
; OUTPUTS:
;     C:
;         1 = Drawing is finished (byte was 0xFF).
;         0 = There are more tiles to draw.
;
;     PPUBuffer:
;     PPUBuffer_WriteOffset:
;         The updated PPU buffer state.
;
;     PPU_TargetAddr:
;         The updated PPU target address (incremented
;         by 16).
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     IScripts_LoadPortraitTiles
;============================================================================
IScripts_DrawPortraitTileToPPU:             ; [$f316]
    ;
    ; Save the current bank and switch to bank 8.
    ;
    LDA a:CurrentROMBank                    ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$08                                ; Bank 8 = Portrait sprites
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.


    ;
    ; Load the tile and see if it's set or if it's 0xFF.
    ;
    LDA (Temp_Addr_L),Y                     ; Load the tile index from the
                                            ; tiles address.
    CMP #$ff                                ; Is it 0xFF?
    BEQ IScripts_DrawPortraitTileToPPU_IsDone ; If so, jump to finish.


    ;
    ; Generate an offset into the tiles list, turning each nibble
    ; of the loaded byte into a 16-bit value.
    ;
    ; This is equivalent to:
    ;
    ;           A (lower) = (byte << 4) & 0xFF
    ;     Temp_05 (upper) = (byte >> 4) & 0xFF
    ;
    LDA #$00                                ; A = 0 (offset).
    STA Temp_05
    LDA (Temp_Addr_L),Y
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05
    CLC


    ;
    ; Make the above relative to the address stored in
    ; TILES_PORTRAITS_START_REF (+ $8000).
    ;
    ADC a:TILES_PORTRAITS_START_REF         ; Add the tile ID to the lower
                                            ; byte.
    STA Temp_04                             ; Store in
                                            ; Temp_04.
    LDA Temp_05                             ; Load the calculated upper byte.
    ADC a:TILES_PORTRAITS_START_REF+1       ; Add the upper byte for the
                                            ; relative start address.
    CLC
    ADC #$80                                ; Add 0x80.
    STA Temp_05                             ; And store as a new upper byte.


    ;
    ; Begin writing to the PPU buffer.
    ;
    LDA #$10                                ; Length = 16 (tile bytes).
    JSR PPUBuffer_QueueCommandOrLength      ; Queue that as the PPU buffer
                                            ; length.


    ;
    ; Begin populating the buffer with the tile's bytes.
    ;
    LDY #$00                                ; Y = 0 (loop counter).

  @_drawLoop:                               ; [$f34e]
    LDA (Temp_04),Y                         ; Load the next byte for the
                                            ; tile.
    STA PPUBuffer,X                         ; Store it in the PPU buffer.
    INX                                     ; X++ (destination).
    INY                                     ; Y++ (loop counter).
    CPY #$10                                ; Have we hit 16 bytes?
    BCC @_drawLoop                          ; If not, loop.


    ;
    ; All tiles have been drawn. Update the write offset and
    ; advance the PPU address.
    ;
    STX PPUBuffer_WriteOffset               ; Store the new PPU buffer write
                                            ; offset.
    LDA PPU_TargetAddr                      ; Load the lower byte of the
                                            ; target address.
    CLC
    ADC #$10                                ; Advance by 16 bytes.
    STA PPU_TargetAddr                      ; Store it.
    LDA PPU_TargetAddr_U                    ; Load the upper byte of the
                                            ; target address.
    ADC #$00                                ; Add carry, if lower wrapped.
    STA PPU_TargetAddr_U                    ; Store it.


    ;
    ; Restore the previous bank.
    ;
    PLA                                     ; Pop the bank from the stack.
    TAX                                     ; X = A (bank).
    JSR MMC1_UpdateROMBank                  ; Switch to it.
    CLC                                     ; Set C=0 for the result.
    RTS


;============================================================================
; Set the ID of the sound effect to play.
;
; This assigns the sound effect to play during the next
; hardware interrupt.
;
; In theory, it also works off of a priority table to
; determine which sound effect should be playing, but
; in practice this was either disabled or never fully
; implemented. See the notes in the code.
;
; INPUTS:
;     A:
;         The ID of the sound effect to set.
;
;     SoundEffect_Unused_PriorityID:
;         The currently-played sound effect.
;
;     SOUND_PRIORITIES:
;         The table of sound effect priorities.
;
; OUTPUTS:
;     SoundEffect_Unused_PriorityID:
;         The new value for the current sound ID, if set.
;
;     SoundEffect_Current:
;         The new value for the next sound effect, if set.
;
; XREFS:
;     Sound_PlayEffect
;============================================================================
SoundEffect_SetCurrent:                     ; [$f36f]
    CMP #$1d                                ; Length of sound IDs array
    BCS @_return                            ; If out of bounds, return.


    ;
    ; DEADCODE: Check the priority level of this sound effect.
    ;
    ; This code is run, but nothing really happens. Let's explore
    ; what it's doing:
    ;
    ; 1. It's taking SoundEffect_Unused_PriorityID and
    ;    comparing it to the ID of the sound effect to play.
    ;
    ; 2. If the new sound effect has a lower value, the variable
    ;    will be set to the new sound effect ID.
    ;
    ; 3. It then returns.
    ;
    ; This seems to work like a priority level. I'm guessing it's
    ; to choose a higher-priority ID.
    ;
    ; HOWEVER, this ID never gets used anywhere else, and it's only
    ; ever set to 0. That means any time this is called, the current
    ; sound effect ID's value in the table is compared against the
    ; first (ID=0) entry, which is 0, and therefore the sound effect's
    ; value will never be less (nothing in there has bit 7 set).
    ;
    ; This makes all this code a bit worthless, and a candidate for
    ; removal.
    ;
    TAX                                     ; X = new sound ID
    LDY a:SoundEffect_Unused_PriorityID     ; Y = current sound ID
    LDA SOUND_PRIORITIES,Y                  ; A = Sound type for current
                                            ; sound from map
    CMP SOUND_PRIORITIES,X                  ; Is this already the current
                                            ; sound?
    BEQ @_queueNext                         ; If yes, then jump
    BCC @_queueNext                         ; If it's a lower priority
                                            ; (larger number), then jump.
    STX a:SoundEffect_Unused_PriorityID     ; Set as the current sound.
    RTS


    ;
    ; Set the sound effect to play at the next hardware interrupt.
    ;
  @_queueNext:                              ; [$f385]
    STX SoundEffect_Current                 ; Queue this up as the next
                                            ; effect.

  @_return:                                 ; [$f387]
    RTS


;============================================================================
; DEADCODE: Table of sound effect priorities, indexed by sound ID.
;
; While code does reference this, no ID but 0 will ever be
; used. See the note in SoundEffect_SetCurrent.
;
; XREFS:
;     SoundEffect_SetCurrent
;============================================================================

;
; XREFS:
;     SoundEffect_SetCurrent
;
SOUND_PRIORITIES:                           ; [$f388]
    .byte $00                               ; [0]:
    .byte $08                               ; [1]:
    .byte $15                               ; [2]: Hit enemy with weapon
    .byte $14                               ; [3]: Enemy is dead
    .byte $04                               ; [4]: Player hit
    .byte $19                               ; [5]: Magic
    .byte $0b                               ; [6]: Open door
    .byte $0d                               ; [7]:
    .byte $10                               ; [8]: Item picked up
    .byte $11                               ; [9]: Touched coin
    .byte $17                               ; [10]: Cast magic hit an
                                            ; obstacle
    .byte $09                               ; [11]: Cursor moved
    .byte $13                               ; [12]: Text input
    .byte $0a                               ; [13]:
    .byte $07                               ; [14]: Password character
                                            ; entered
    .byte $0c                               ; [15]: Block pushed
    .byte $12                               ; [16]: Coin dropped
    .byte $0f                               ; [17]:
    .byte $0e                               ; [18]:
    .byte $06                               ; [19]: Filling HP or MP
    .byte $18                               ; [20]: Tilte magic cast
    .byte $04                               ; [21]: Player taking step
    .byte $01                               ; [22]:
    .byte $02                               ; [23]:
    .byte $03                               ; [24]:
    .byte $05                               ; [25]: Gold changed
    .byte $03                               ; [26]: Item used
    .byte $10                               ; [27]: Touched meat
    .byte $02                               ; [28]:


;============================================================================
; Load glyph data for all strings into the PPU tile map.
;
; Glyph data is located in Bank 13 at $8000.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
; OUTPUTS:
;     PPUADDR:
;         Updated with the write position.
;
;     Temp_Int24:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     PPU_WriteGlyphTile
;
; XREFS:
;     PasswordScreen_Show
;============================================================================
PPU_LoadGlyphsForStrings:                   ; [$f3a5]
    LDA a:CurrentROMBank
    PHA
    LDX #$0d
    JSR MMC1_UpdateROMBank
    LDA #$00
    STA Temp_Int24
    LDA #$80
    STA Temp_Int24_M
    LDA #$12
    STA a:PPUADDR
    LDA #$00
    STA a:PPUADDR
    LDX #$60

  @LAB_PRG15_MIRROR__f3c2:                  ; [$f3c2]
    JSR PPU_WriteGlyphTile
    JSR PPU_WriteGlyphTile
    LDA Temp_Int24
    CLC
    ADC #$08
    BCC @LAB_PRG15_MIRROR__f3d1
    INC Temp_Int24_M

  @LAB_PRG15_MIRROR__f3d1:                  ; [$f3d1]
    STA Temp_Int24
    DEX
    BNE @LAB_PRG15_MIRROR__f3c2


;============================================================================
; Update the ROM bank in register A pushed to the stack.
;
; INPUTS:
;     Stack (A):
;         The stack to pop A from, containing the bank.
;
; OUTPUTS:
;     Stack (A):
;         The stack will be popped.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Game_DrawScreenInFrozenState
;     IScripts_LoadPortraitTilesAddress
;     Screen_LoadSpriteInfo
;     Sprites_LoadSpriteValue
;     TextBox_LoadAndShowMessage
;     TextBox_LoadItemSourceTiles
;     TextBox_ShowNextChar
;     TextBox_WriteChar
;     UI_DrawSelectedItem
;============================================================================
MMC1_UpdatePRGBankToStackA:                 ; [$f3d6]
    PLA                                     ; Pop the bank from the stack.
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.
    RTS


;============================================================================
; Write a glyph to the list of tiles in the PPU.
;
; This is used by PPU_LoadGlyphsForStrings to
; write a glyph tile for later use.
;
; INPUTS:
;     Temp_Int24:
;         The temporary address to read bytes from.
;
; OUTPUTS:
;     PPUDATA:
;         Data will be written to the PPU.
;
; XREFS:
;     PPU_LoadGlyphsForStrings
;============================================================================
PPU_WriteGlyphTile:                         ; [$f3dc]
    LDY #$00                                ; Y = 0

  @_loop:                                   ; [$f3de]
    LDA (Temp_Int24),Y                      ; Load the byte from the temp
                                            ; string address.
    STA a:PPUDATA                           ; Write to the PPU.
    INY                                     ; Y++
    CPY #$08                                ; Have we written 8 bytes?
    BNE @_loop                              ; If not, loop.
    RTS


;============================================================================
; Load the specified message and progressively show it.
;
; Each character in the message will be shown one-by-one.
;
; INPUTS:
;     A:
;         The message ID to show.
;
; OUTPUTS:
;     None
;
; CALLS:
;     Messages_Load
;     TextBox_LoadAndShowMessage
;
; XREFS:
;     IScriptAction_ShowBuySellMenu
;============================================================================
IScripts_LoadAndShowMessage:                ; [$f3e9]
    JSR Messages_Load                       ; Load the message.

  @_loop:                                   ; [$f3ec]
    JSR TextBox_LoadAndShowMessage          ; Show the next character from
                                            ; the message.
    LDA a:MessageID                         ; Is it 0xFF (end of message)?
    BNE @_loop                              ; If not, loop.
    RTS


;============================================================================
; Load a message from the message list.
;
; This will switch to Bank 13 and load a message from
; there at the specified message index.
;
; This works by scanning strings. It starts at the first
; message ($8300) and walks up to the messag index (or,
; technically, down from the message index - 1 to 0),
; scanning every character until the message terminator
; (0xFF) is hit.
;
; When we both hit the last message and hit the last
; terminator, we're done. We'll have the address of
; the message and the length.
;
; After loading, this will restore the bank and then
; fall through to TextBox_ClearPasswordSize.
;
; INPUTS:
;     A:
;         The 1-based index of the message to load.
;
;     MESSAGE_STRINGS:
;         The list of messages to scan.
;
; OUTPUTS:
;     Message_ProcessedLength:
;         The length of the message string.
;
;     TextBox_Timer:
;         The starting message character position (0).
;
;     Message_StartAddr+1:
;     Message_StartAddr:
;         The address of the start of the message string.
;
;     PPU_TargetAddr+1:
;     PPU_TargetAddr:
;         Set to address $1400.
;
;     TextBox_MessagePaused:
;     TextBox_CharPosForLine:
;     TextBox_DrawnLineNum:
;     TextBox_LineScrollOffset:
;     Textbox_TitleCharOffset:
;         All set to 0.
;
;     Unused_Arg_Text_NumLines:
;         Set to 4.
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowMessage
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowQuestionMessageCheckIfDismissed
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     IScripts_ShowFinalMessage
;     IScripts_LoadAndShowMessage
;============================================================================
Messages_Load:                              ; [$f3f5]
    STA a:MessageID


    ;
    ; Save our current bank.
    ;
    LDA a:CurrentROMBank                    ; A = Our current bank
    PHA                                     ; Push A to the stack.


    ;
    ; Switch to Bank 13 for the strings.
    ;
    LDX #$0d                                ; Update to Bank 13.
    JSR MMC1_UpdateROMBank


    ;
    ; Set the start of the messages string (MESSAGE_STRINGS).
    ;
    LDX #$00                                ; Set the lower byte of the
                                            ; address for the strings.
    STX Temp_Int24
    LDX #$83                                ; Set the upper byte of the
                                            ; address for the strings.
    STX Temp_Int24_M


    ;
    ; Set the start of our message length for the
    ; string scan.
    ;
    LDY #$00                                ; Y = 0 (start of our lookup
                                            ; offset)
    STY a:TextBox_Timer                     ; Set start character pos to 0


    ;
    ; Prepare to loop through the message characters, starting
    ; at Message ID - 1 and going through 0.
    ;
    ; This will effectively from message ID 0 to the end of the
    ; provided message ID. We'll be doing a full string scan of
    ; every string along the way (there's no lookup table).
    ;
    LDX a:MessageID                         ; X = MessageID
    DEX                                     ; X--
    BEQ @_afterLoops                        ; If 0, don't do the message
                                            ; string index loop.


    ;
    ; Loop through characters in the current message string.
    ;
    ; We'll loop until we hit the end of a string.
    ;
  @_messageLoop:                            ; [$f414]
    LDA (Temp_Int24),Y                      ; A = Character at Y from the
                                            ; current string.
    INY                                     ; Y++


    ;
    ; If Y == 0, increment our upper byte position. This
    ; will happen when Y wraps around from 0xFF to 0.
    ;
    BNE @_checkChar                         ; If Y != 0, jump.
    INC Temp_Int24_M                        ; Y is 0. Increment upper byte
                                            ; position.


    ;
    ; Check if we hit a string terminator (0xFF). If so,
    ; decrement the local message ID index.
    ;
  @_checkChar:                              ; [$f41b]
    CMP #$ff                                ; Is A (the character) 0xFF?
    BNE @_messageLoop                       ; If not 0xFF, loop.
    DEX                                     ; A is 0xFF. X-- to the previous
                                            ; message ID.
    BNE @_messageLoop                       ; If X != 0, loop.


    ;
    ; We found the start position of our string (or were there
    ; already). We're done. Begin storing state.
    ;
  @_afterLoops:                             ; [$f422]
    STY a:Message_ProcessedLength           ; Message length = Y
    LDA Temp_Int24                          ; Load the new lower byte of the
                                            ; string position.
    STA a:Message_StartAddr                 ; Store it.
    LDA Temp_Int24_M                        ; Load the new upper byte of the
                                            ; string position.
    STA a:Message_StartAddr_U               ; Store it.


    ;
    ; Restore our previous bank.
    ;
    PLA                                     ; Pop A (our previous bank) off
                                            ; the stack.
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; Switch bank to the bank.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Clear the size of the password text box.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     PPU_TargetAddr+1:
;     PPU_TargetAddr:
;         Set to address $1400.
;
;     TextBox_MessagePaused:
;     TextBox_CharPosForLine:
;     TextBox_DrawnLineNum:
;     TextBox_LineScrollOffset:
;     Textbox_TitleCharOffset:
;         All set to 0.
;
;     Unused_Arg_Text_NumLines:
;         Set to 4.
;
; CALLS:
;     PPU_IncrementAddrBy32
;     PPUBuffer_WriteValueMany
;
; XREFS:
;     IScriptAction_ShowPassword
;============================================================================
TextBox_ClearPasswordSize:                  ; [$f434]
    LDA #$00
    STA a:TextBox_LineScrollOffset          ; Set line scroll offset to 0.
    STA a:TextBox_CharPosForLine            ; Set character position in line
                                            ; to 0.
    STA a:TextBox_DrawnLineNum              ; Set the drawn line number to 0.
    STA a:TextBox_MessagePaused             ; Clear the message paused state.
    STA a:Textbox_TitleCharOffset           ; Set the title character offset
                                            ; to 0.
    LDA #$04
    STA a:Unused_Arg_Text_NumLines          ; Set the textbo height to 4.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Clear the text tiles from the textbox.
;
; This will loop through the text tiles and clear them out.
; Tiles $1400 through $1800 will be cleared.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     PPU_TargetAddr:
;         The PPU target address ($1400).
;
; CALLS:
;     PPU_IncrementAddrBy32
;     PPUBuffer_WriteValueMany
;
; XREFS:
;     IScripts_FillPlaceholderText
;============================================================================
TextBox_ClearTextTiles:                     ; [$f44a]
    ;
    ; Set the PPU target address to $1400. These are the
    ; text tiles.
    ;
    LDA #$14                                ; 0x14 == upper byte of the PPU
                                            ; address.
    STA PPU_TargetAddr_U                    ; Store it.
    LDA #$00                                ; 0x00 == lower byte.
    STA PPU_TargetAddr                      ; Store it.
    LDY #$20                                ; Y = 32 (loop counter).


    ;
    ; Write the value 0x00 for bytes $1400 through $1800.
    ;
  @_writeLoop:                              ; [$f454]
    TYA                                     ; A = Y (loop counter)
    PHA                                     ; Push to the stack.
    LDA #$00                                ; A = 0
    LDY #$20                                ; Y = 32
    JSR PPUBuffer_WriteValueMany            ; Write 0x00 32 times to the PPU
                                            ; buffer.
    JSR PPU_IncrementAddrBy32               ; Address += 32
    PLA                                     ; Pull A from the stack.
    TAY                                     ; Y = A (loop counter)
    DEY                                     ; Y--
    BNE @_writeLoop                         ; If > 0, loop.

    ;
    ; XREFS:
    ;     Maybe_TextBox_ShowCurrentMessageID
    ;
TextBox_ClearShopSizeAtOffset_return:       ; [$f465]
    RTS


;============================================================================
; Show the next character in a textbox.
;
; This will temporarily switch to bank 13 (strings),
; increment the position to show, and show it.
;
; INPUTS:
;     CurrentROMBank:
;         The current ROM bank.
;
;     TextBox_Timer:
;         The current message character position.
;
; OUTPUTS:
;     TextBox_Timer:
;         The incremented position.
;
;     TextBox_PlayTextSound:
;         Set to 1.
;
; CALLS:
;     MMC1_UpdateROMBank
;     MMC1_UpdatePRGBankToStackA
;     Maybe_TextBox_ShowCurrentMessageID
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowMessage
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowQuestionMessageCheckIfDismissed
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     IScripts_ShowFinalMessage
;============================================================================
TextBox_ShowNextChar:                       ; [$f466]
    ;
    ; Save the current bank and switch to bank 13 (strings).
    ;
    LDA a:CurrentROMBank                    ; A = current bank
    PHA                                     ; Push it to the stack.
    LDX #$0d                                ; X = 13 (bank)
    JSR MMC1_UpdateROMBank                  ; Switch to bank 13.


    ;
    ; Show the next character.
    ;
    INC a:TextBox_Timer                     ; Increment the next character
                                            ; position.
    LDA #$01                                ; A = 1
    STA a:TextBox_PlayTextSound             ; Store it.
    JSR Maybe_TextBox_ShowCurrentMessageID  ; Show this character in the
                                            ; message.


    ;
    ; Restore the bank and return.
    ;
    JMP MMC1_UpdatePRGBankToStackA          ; Restore the pushed bank.
;============================================================================
; TODO: Document TextBox_LoadAndShowMessage
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_LoadAndShowMessage
;============================================================================
TextBox_LoadAndShowMessage:                 ; [$f47d]
    ;
    ; Save the current ROM.
    ;
    LDA a:CurrentROMBank
    PHA


    ;
    ; Switch to Bank 13, where the strings are.
    ;
    LDX #$0d
    JSR MMC1_UpdateROMBank
    LDA #$00
    STA a:TextBox_PlayTextSound
    JSR TextBox_DisplayMessage


    ;
    ; Restore the previous bank.
    ;
    JMP MMC1_UpdatePRGBankToStackA

;============================================================================
; TODO: Document Maybe_TextBox_ShowCurrentMessageID
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_ShowNextChar
;============================================================================
Maybe_TextBox_ShowCurrentMessageID:         ; [$f491]
    LDA a:MessageID                         ; Load the message ID to show.
    BEQ TextBox_ClearShopSizeAtOffset_return ; If unset, return.
    LDA a:TextBox_MessagePaused
    BNE TextBox_ClearShopSizeAtOffset_return
    LDA a:TextBox_Timer                     ; Load the character position to
                                            ; display.
    AND #$03                                ; Check the first 2 bits.
    BNE TextBox_ClearShopSizeAtOffset_return ; If neither bit is set, return.

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document TextBox_DisplayMessage
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_LoadAndShowMessage
;============================================================================
TextBox_DisplayMessage:                     ; [$f4a2]
    LDA a:Textbox_TitleCharOffset
    BEQ TextBox_ShowMessage_LoadMessage
    CMP #$90
    BEQ @LAB_PRG15_MIRROR__f4c3
    AND #$0f
    STA Temp_Int24


    ;
    ; Convert the player's title to an index in the string list.
    ;
    LDA a:PlayerTitle                       ; Load the player's title.
    ASL A                                   ; Shift left 4, converting to an
                                            ; index.
    ASL A
    ASL A
    ASL A
    ORA Temp_Int24
    TAX                                     ; X = A
    LDA PLAYER_TITLE_STRINGS,X              ; Look up the string.
    INC a:Textbox_TitleCharOffset
    CMP #$20
    BNE TextBox_ShowMessageWithSound

  @LAB_PRG15_MIRROR__f4c3:                  ; [$f4c3]
    LDA #$00
    STA a:Textbox_TitleCharOffset

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document TextBox_ShowMessage_LoadMessage
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_DisplayMessage
;     TextBox_ShowMessage_Newline
;============================================================================
TextBox_ShowMessage_LoadMessage:            ; [$f4c8]
    LDA a:Message_StartAddr
    STA Temp_Int24
    LDA a:Message_StartAddr_U
    STA Temp_Int24_M
    LDY a:Message_ProcessedLength
    INC a:Message_ProcessedLength
    BNE @LAB_PRG15_MIRROR__f4dd
    INC a:Message_StartAddr_U

  @LAB_PRG15_MIRROR__f4dd:                  ; [$f4dd]
    LDA (Temp_Int24),Y
    CMP #$ff
    BEQ TextBox_ShowMessage_EndOfMessage
    CMP #$fe
    BEQ TextBox_ShowMessage_Newline
    CMP #$fd
    BEQ TextBox_ShowMessage_Space
    CMP #$fb
    BEQ TextBox_ShowMessage_ShowPlayerTitle
    CMP #$fc
    BEQ TextBox_ShowMessage_Pause

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document TextBox_ShowMessageWithSound
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_DisplayMessage
;     TextBox_ShowMessage_ShowPlayerTitle
;============================================================================
TextBox_ShowMessageWithSound:               ; [$f4f3]
    LDX a:TextBox_PlayTextSound
    BEQ TextBox_ShowMessage


    ;
    ; Play the message sound effect.
    ;
    PHA                                     ; Push A to the stack.
    LDA #$01                                ; 0x01 == Message sound effect.
    JSR Sound_PlayEffect                    ; Play it.
    PLA                                     ; Pop A.

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document TextBox_ShowMessage
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PasswordScreen_ShowNextChar
;     TextBox_ShowMessageWithSound
;============================================================================
TextBox_ShowMessage:                        ; [$f4ff]
    JSR TextBox_WriteChar

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document TextBox_ShowMessage_Space
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_ShowMessage_LoadMessage
;============================================================================
TextBox_ShowMessage_Space:                  ; [$f502]
    ;
    ; If it's 0xFD, it's a space.
    ;
    INC a:TextBox_CharPosForLine
    LDA a:TextBox_CharPosForLine
    CMP #$10
    BCC TextBox_ShowMessage_Return


    ;
    ; Load the next character in the message string.
    ;
    LDA a:Message_StartAddr
    STA Temp_Int24
    LDA a:Message_StartAddr_U
    STA Temp_Int24_M
    LDY a:Message_ProcessedLength
    LDA (Temp_Int24),Y


    ;
    ; If it's 0xFF, the message ends.
    ;
    CMP #$ff
    BEQ TextBox_ShowMessage_EndOfMessage


    ;
    ; If it's 0xFC, finish this part of the message.
    ;
    CMP #$fc
    BEQ TextBox_ShowMessage_Return

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document TextBox_ShowMessage_Newline
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_ShowMessage_LoadMessage
;============================================================================
TextBox_ShowMessage_Newline:                ; [$f523]
    ;
    ; If it's 0xFE, it's a newline.
    ;
    LDA a:TextBox_CharPosForLine
    BEQ TextBox_ShowMessage_LoadMessage

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document TextBox_ShowMessage_IncLineAndReset
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_ShowMessage_Prepare4Lines
;============================================================================
TextBox_ShowMessage_IncLineAndReset:        ; [$f528]
    ;
    ; Increment the line and reset the character position.
    ;
    LDA #$00                                ; A = 0
    STA a:TextBox_CharPosForLine            ; Set as the character position.
    LDY a:TextBox_DrawnLineNum              ; Y = line number
    INY                                     ; Y++


    ;
    ; Check if we've reached the end of the textbox.
    ; If so, prepare the state for the next 4 lines.
    ;
    CPY #$04                                ; Is the line number 4?
    BEQ TextBox_ShowMessage_Fill4Lines      ; If so, jump.


    ;
    ; We're not at the end of the textbox. Increment and return.
    ;
    STY a:TextBox_DrawnLineNum              ; Els, set as the number of drawn
                                            ; lines.
    RTS


;============================================================================
; Prepare a 4-line textbox for writing.
;
; This will set the initial draw position and data for
; a textbox covering 4 lines. It will then fill it with
; placeholder data and then clear it.
;
; This ensures state is set up to write text, and that
; the buffer is prepared.
;
; INPUTS:
;     TextBox_CharPosForLine:
;         The 1-based starting character position.
;
;         If 0, this will just return.
;
;     TextBox_DrawnLineNum:
;         The last drawn line number.
;
;     TextBox_LineScrollOffset:
;         The line scroll offset of the tex tbox.
;
;     TextBox_X:
;         The X position of the text box.
;
;     TextBox_Y:
;         The Y position of the text box.
;
; OUTPUTS:
;     TextBox_ContentsX:
;         The X position to begin writing to.
;
;     TextBox_ContentsY:
;         The Y position to begin writing to.
;
;     TextBox_LineScrollOffset:
;         The scroll offset of the line.
;
;     TextBox_DrawnLineNum:
;         The drawn line number.
;
; CALLS:
;     PPU_IncrementAddrBy16
;     PPU_SetAddrForTextBoxPos
;     PPUBuffer_WriteValueMany
;     TextBox_FillPlaceholderTextForLineCapped
;
; XREFS:
;     TextBox_PrepareContinueMessage
;============================================================================
TextBox_ShowMessage_Prepare4Lines:          ; [$f539]
    ;
    ; Check if anything's ready to be written for this line.
    ;
    LDA a:TextBox_CharPosForLine            ; Load the character position
                                            ; (1-based; 0 for not ready).
    BNE TextBox_ShowMessage_IncLineAndReset ; If > 0, the line can be drawn.
    RTS


;============================================================================
; Handle a pause in the message the player must acknowledge.
;
; This is message code 0xFC.
;
; If the very next code is 0xFF, this will simply end the
; message.
;
; INPUTS:
;     Message_ProcessedLength:
;          The processed number of bytes of the message.
;
;     Message_StartAddr:
;     Message_StartAddr+1:
;         The address of the loaded message string.
;
; OUTPUTS:
;     MessageID:
;         Set to 0 if the message ends.
;
;     TextBox_MessagePaused:
;         Set to 0xFF if paused.
;
;     Temp_Int24:
;     Temp_Int24+1:
;         Clobbered.
;
; XREFS:
;     TextBox_ShowMessage_LoadMessage
;============================================================================
TextBox_ShowMessage_Pause:                  ; [$f53f]
    LDA a:Message_StartAddr                 ; Load the lower byte of the
                                            ; message string address.
    STA Temp_Int24                          ; Store it for length
                                            ; calculation.
    LDA a:Message_StartAddr_U               ; Load the upper byte.
    STA Temp_Int24_M                        ; Store it.


    ;
    ; Check if the next byte is 0xFF, in which case we just want
    ; to end the message immediately.
    ;
    LDY a:Message_ProcessedLength           ; Load the message length.
    LDA (Temp_Int24),Y                      ; Load the next byte of the
                                            ; message.
    CMP #$ff                                ; Is it 0xFF (end of message)?
    BEQ TextBox_ShowMessage_EndOfMessage    ; If true, then end message.


    ;
    ; The message isn't ending. We're paused instead.
    ;
    LDA #$ff
    STA a:TextBox_MessagePaused             ; Set the message as paused.

    ;
    ; XREFS:
    ;     TextBox_ShowMessage_Space
    ;
TextBox_ShowMessage_Return:                 ; [$f557]
    RTS


    ;
    ; This is the end of the message.
    ;
    ;
    ; XREFS:
    ;     TextBox_ShowMessage_LoadMessage
    ;     TextBox_ShowMessage_Pause
    ;     TextBox_ShowMessage_Space
    ;
TextBox_ShowMessage_EndOfMessage:           ; [$f558]
    LDA #$00                                ; A = 0
    STA a:MessageID                         ; Store as the message ID
                                            ; (terminating message).
    RTS


;============================================================================
; Show the player's current title in the textbox.
;
; This is message code 0xFB.
;
; INPUTS:
;     PlayerTitle:
;         The player's current title.
;
;     PLAYER_TITLE_STRINGS:
;         The table of title strings.
;
; OUTPUTS:
;     Textbox_TitleCharOffset:
;         The start offset/counter for title writing.
;
; CALLS:
;     TextBox_ShowMessageWithSound
;
; XREFS:
;     TextBox_ShowMessage_LoadMessage
;============================================================================
TextBox_ShowMessage_ShowPlayerTitle:        ; [$f55e]
    ;
    ; If it's 0xFB, the title rank will be inserted.
    ;
    LDA #$81                                ; A = 0x81
    STA a:Textbox_TitleCharOffset           ; Store it.
    LDA a:PlayerTitle                       ; Load the player's title.
    ASL A                                   ; Convert to an index in the
                                            ; Player Titles table.
    ASL A
    ASL A
    ASL A
    TAX                                     ; X = A
    LDA PLAYER_TITLE_STRINGS,X              ; Load the title string at X.
    JMP TextBox_ShowMessageWithSound        ; Show this title in the textbox.
;============================================================================
; TODO: Document TextBox_ShowMessage_Fill4Lines
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_ShowMessage_IncLineAndReset
;============================================================================
TextBox_ShowMessage_Fill4Lines:             ; [$f571]
    ;
    ; Set the start position where text will be drawn.
    ;
    LDA a:TextBox_X                         ; X = textbox tile X coordinate.
    CLC
    ADC #$02                                ; X += 2
    STA TextBox_ContentsX                   ; Store as the text X start
                                            ; position.
    LDA a:TextBox_Y                         ; Y = textbox tile Y coordinate.
    CLC
    ADC #$02                                ; Y += 2
    STA TextBox_ContentsY                   ; Store as the text Y start
                                            ; position.


    ;
    ; Write 3 lines.
    ;
    ; This will be the available text characters, filling
    ; up the buffer. It will contain:
    ;
    ;     @ABCDEFGHIJKLMNO
    ;     PQRSTUVWXYZ[\]^_
    ;     `abcdefghijklmno
    ;     pqrstuvwxyz{}|~.
    ;
    ; This will effectively reserve space in the buffer.
    ;
    JSR PPU_SetAddrForTextBoxPos            ; Set the PPU address for the
                                            ; text position.
    LDX a:TextBox_LineScrollOffset          ; X = scroll line offset
    JSR TextBox_FillPlaceholderTextForLineCapped ; Write a line and advance.
    JSR TextBox_FillPlaceholderTextForLineCapped ; Write a line and advance.
    JSR TextBox_FillPlaceholderTextForLineCapped ; Write a line and advance.


    ;
    ; Clear the final line.
    ;
    LDA #$00                                ; A = 0 (start offset)
    LDY #$10                                ; Y = 16 (line length)
    JSR PPUBuffer_WriteValueMany            ; Write '0' 16 times, clearing
                                            ; the line.


    ;
    ; Set the starting text position to the beginning text char/pos
    ; of the text box we just wrote to.
    ;
    LDA #$00                                ; A = 0
    STA PPU_TargetAddr                      ; Store A as the lower byte of
                                            ; the PPU target address.
    LDA a:TextBox_LineScrollOffset          ; A = scroll-aware line offset.
    CLC
    ADC #$14                                ; A += 20
    STA PPU_TargetAddr_U                    ; Store as the upper byte of the
                                            ; PPU target addres.


    ;
    ; Clear out each of the lines that were just written.
    ;
    LDX #$10                                ; X = 16

  @LAB_PRG15_MIRROR__f5a5:                  ; [$f5a5]
    TXA                                     ; A = X
    PHA                                     ; Push A to the stack.
    LDA #$00                                ; A = 0
    LDY #$10                                ; Y = 16
    JSR PPUBuffer_WriteValueMany            ; Write '0' 16 times, clearing
                                            ; the line.
    JSR PPU_IncrementAddrBy16               ; Increment the offset by 16.
    PLA                                     ; Pop A from the  stack (now 16).
    TAX                                     ; X = A
    DEX                                     ; X--
    BNE @LAB_PRG15_MIRROR__f5a5             ; If X > 0, loop.


    ;
    ; Increase the Y position to draw to by 3, after these lines.
    ;
    INC TextBox_ContentsY                   ; TextBox_ContentsY
                                            ; += 3
    INC TextBox_ContentsY
    INC TextBox_ContentsY


    ;
    ; Draw a line of text to fill the address.
    ;
    ; This will be:
    ;
    ;     PQRSTUVWXYZ[\]^_
    ;
    JSR PPU_SetAddrForTextBoxPos            ; Set the text draw position
                                            ; back.
    LDA a:TextBox_LineScrollOffset          ; A = line scroll offset.
    JSR TextBox_FillPlaceholderTextForLine  ; Write a line of text.


    ;
    ; Store the new line number offset.
    ;
    INX                                     ; X++
    TXA                                     ; A = X
    AND #$03                                ; Cap the line number from 0..4.
    STA a:TextBox_LineScrollOffset          ; Store it.
    RTS


;============================================================================
; Write a line of arbitrary text, taking into account textbox scrolling.
;
; The text will be placeholder text, intended to be
; cleared later.
;
; This is used when a maximum of 4 lines will be shown.
; The provided line number will be capped to a value
; between 0 and 4 and written to the textbox draw address.
;
; INPUTS:
;     X:
;         The line number to write to.
;
;         This will be capped to a displayed line number.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPU_IncrementAddrBy32
;
; XREFS:
;     TextBox_ShowMessage_Fill4Lines
;============================================================================
TextBox_FillPlaceholderTextForLineCapped:   ; [$f5cd]
    INX                                     ; lineNum++
    TXA                                     ; A = X


    ;
    ; Cap the linenum to lines 0-4.
    ;
    AND #$03

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Write a line of arbitrary text.
;
; The text will be placeholder text, intended to be
; cleared later.
;
; INPUTS:
;     A:
;         The line number to write to.
;
;         This will be a 0-based index into the textbox.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPU_IncrementAddrBy32
;
; XREFS:
;     TextBox_ShowMessage_Fill4Lines
;============================================================================
TextBox_FillPlaceholderTextForLine:         ; [$f5d1]
    TAX                                     ; X = A


    ;
    ; Calculate a character offset for the line number.
    ; Lines are 16 characters per line.
    ;
    ASL A                                   ; Multiply by 16.
    ASL A
    ASL A
    ASL A


    ;
    ; Add 64, giving us a value of "A".
    ;
    ADC #$40                                ; Add 64 (character code of "A").
    TAY                                     ; Y = A

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Write a line of arbitrary text, starting with a character.
;
; The text will be placeholder text, intended to be
; cleared later.
;
; INPUTS:
;     A:
;         The line number to write to.
;
;         This will be a 0-based index into the textbox.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPU_IncrementAddrBy32
;
; XREFS:
;     IScripts_FillPlaceholderText
;============================================================================
TextBox_FillPlaceholderTextAtLineWithStartChar: ; [$f5d9]
    TXA                                     ; A = X (offset)
    PHA                                     ; Push A to the stack.


    ;
    ; Set the write length to 16 characters (max for a line).
    ;
    LDA #$10                                ; A = 16
    JSR PPUBuffer_QueueCommandOrLength      ; Queue this as the write length.
    TYA                                     ; A = Y


    ;
    ; Begin the write loop.
    ;
    LDY #$10                                ; Y = 16

  @_loop:                                   ; [$f5e3]
    JSR PPUBuffer_Set                       ; Write the value to the buffer.
    CLC
    ADC #$01                                ; A++ (next character value)
    DEY                                     ; Y--
    BNE @_loop                              ; If Y > 0, loop.
    STX PPUBuffer_WriteOffset               ; Store the new offset as the PPU
                                            ; upper bounds.
    PLA                                     ; Pop A from the stack.
    TAX                                     ; X = A
    JMP PPU_IncrementAddrBy32               ; Increment the PPU address by
                                            ; 32.


;============================================================================
; Write an ASCII value to the textbox at the next position.
;
; INPUTS:
;     A:
;         The ASCII value to write.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new upper bounds of the PPU buffer.
;
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The PPU target address to write to.
;
;     Temp_Int24:
;     Temp_Int24+1:
;         Clobbered.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPU_IncrementAddrBy32
;     TextBox_Write8BytesFromTemp
;
; XREFS:
;     TextBox_ShowMessage
;============================================================================
TextBox_WriteChar:                          ; [$f5f3]
    ;
    ; Normalize the ASCII value into an index in the characters
    ; table.
    ;
    SEC                                     ; C = 1
    SBC #$20                                ; A -= 32 (normalize the value to
                                            ; a character lookup table)


    ;
    ; Set the address of the string address.
    ;
    ; Each glyph is 8 bytes, so this will normalize the character
    ; index to the proper byte offset.
    ;
    LDX #$00                                ; X = 0
    STX Temp_Int24_M                        ; Set middle byte of string
                                            ; address to 0.
    ASL A                                   ; A = A * 8 (each glyph is 8
                                            ; bytes)
    ASL A
    ROL Temp_Int24_M                        ; Rotate upper byte left and add
                                            ; carry.
    ASL A
    ROL Temp_Int24_M
    ADC #$00
    STA Temp_Int24


    ;
    ; Make the address relative to $8000.
    ;
    LDA Temp_Int24_M                        ; Load the upper byte of of the
                                            ; address.
    ADC #$80                                ; Add 0x80 to it.
    STA Temp_Int24_M                        ; Store it back.


    ;
    ; Compute the PPU target address.
    ;
    LDA #$00                                ; A = 0
    STA PPU_TargetAddr_U                    ; Store as the starting upper
                                            ; byte of the PPU target address.
    LDA a:TextBox_CharPosForLine            ; A = character position.
    ASL A                                   ; Convert to a 16 byte address
                                            ; boundary.
    ASL A
    ASL A
    ASL A
    STA PPU_TargetAddr                      ; Store as the lower byte of the
                                            ; PPU target address.
    LDA a:TextBox_DrawnLineNum              ; A = drawn line number.
    CLC
    ADC a:TextBox_LineScrollOffset          ; A += line scroll offset
    AND #$03                                ; Cap to a 0..4 line number.
    ADC #$14                                ; A += 20
    STA PPU_TargetAddr_U                    ; Set as the new upper byte of
                                            ; the PPU target address.


    ;
    ; Save the current bank and switch to bank 13 (strings).
    ;
    LDA a:CurrentROMBank                    ; A = current bank
    PHA                                     ; Push A to the stack.
    LDX #$0d                                ; A = bank 13
    JSR MMC1_UpdateROMBank                  ; Switch to it.


    ;
    ; Queue up the drawn line.
    ;
    LDA #$10                                ; A = 16 (line length)
    JSR PPUBuffer_QueueCommandOrLength      ; Queue as the line length.
    JSR TextBox_Write8BytesFromTemp         ; Write the first half of the
                                            ; line.
    JSR TextBox_Write8BytesFromTemp         ; Write the second half.


    ;
    ; Finish up and restore the bank.
    ;
    STX PPUBuffer_WriteOffset               ; Store the new upper bounds for
                                            ; the PPU buffer.
    JMP MMC1_UpdatePRGBankToStackA          ; Restore to the previous bank.


;============================================================================
; Write values from temp to the PPU buffer.
;
; This will write all values from Temp_Int24
; until a value 128-255 are hit.
;
; INPUTS:
;     X:
;         The destination index into the buffer to write to.
;
; OUTPUTS:
;     None
;
; CALLS:
;     PPUBuffer_WriteFromTemp
;
; XREFS:
;     TextBox_WriteChar
;============================================================================
TextBox_Write8BytesFromTemp:                ; [$f63e]
    LDY #$00                                ; Y = 0

  @_loop:                                   ; [$f640]
    JSR PPUBuffer_WriteFromTemp             ; Write a value from temp.
    TYA                                     ; A = Y
    AND #$07                                ; Consider values 0-127.
    BNE @_loop                              ; If not 0, loop.
    RTS

;
; XREFS:
;     TextBox_DisplayMessage
;     TextBox_ShowMessage_ShowPlayerTitle
;
PLAYER_TITLE_STRINGS:                       ; [$f649]
    .byte "Novice  "                        ; [$f649] char
    .byte "        "                        ; [$f651] char
    .byte "Aspirant"                        ; [$f659] char
    .byte "        "                        ; [$f661] char
    .byte "Battler "                        ; [$f669] char
    .byte "        "                        ; [$f671] char
    .byte "Fighter "                        ; [$f679] char
    .byte "        "                        ; [$f681] char
    .byte "Adept   "                        ; [$f689] char
    .byte "        "                        ; [$f691] char
    .byte "Chevalie"                        ; [$f699] char
    .byte "r       "                        ; [$f6a1] char
    .byte "Veteran "                        ; [$f6a9] char
    .byte "        "                        ; [$f6b1] char
    .byte "Warrior "                        ; [$f6b9] char
    .byte "        "                        ; [$f6c1] char
    .byte "Swordman"                        ; [$f6c9] char
    .byte "        "                        ; [$f6d1] char
    .byte "Hero    "                        ; [$f6d9] char
    .byte "        "                        ; [$f6e1] char
    .byte "Soldier "                        ; [$f6e9] char
    .byte "        "                        ; [$f6f1] char
    .byte "Myrmidon"                        ; [$f6f9] char
    .byte "        "                        ; [$f701] char
    .byte "Champion"                        ; [$f709] char
    .byte "        "                        ; [$f711] char
    .byte "Superher"                        ; [$f719] char
    .byte "o       "                        ; [$f721] char
    .byte "Paladin "                        ; [$f729] char
    .byte "        "                        ; [$f731] char
    .byte "Lord    "                        ; [$f739] char
    .byte "        "                        ; [$f741] char


;============================================================================
; Experience requirements for each title.
;
; XREFS:
;     Player_SetInitialExpAndGold
;     Player_CheckReachedNextTitle
;============================================================================

;
; XREFS:
;     Player_SetInitialExpAndGold
;     Player_CheckReachedNextTitle
;
PLAYER_TITLE_EXP_NEEDED:                    ; [$f749]
    .word $03e8                             ; [0]: Aspirant (1,000 exp)

;
; XREFS:
;     PlayerMenu_ShowStatusMenu
;
PLAYER_TITLE_EXP_NEEDED_1_:                 ; [$f74b]
    .word $0898                             ; [1]: Battler (2,200 exp)
    .word $0dac                             ; [2]: Fighter (3,500 exp)
    .word $12c0                             ; [3]: Adept (4,800 exp)
    .word $1838                             ; [4]: Chevalier (6,200 exp)
    .word $1f40                             ; [5]: Veteran (8,000 exp)
    .word $2710                             ; [6]: Warrior (10,000 exp)
    .word $30d4                             ; [7]: Swordman (12,500 exp)
    .word $3a98                             ; [8]: Hero (15,000 exp)
    .word $4650                             ; [9]: Soldier (18,000 exp)
    .word $55f0                             ; [10]: Myrmidon (22,000 exp)
    .word $6590                             ; [11]: Champion (26,000 exp)
    .word $7530                             ; [12]: Superhero (30,000 exp)
    .word $88b8                             ; [13]: Paladin (35,000 exp)
    .word $afc8                             ; [14]: Lord (45,000 exp)


;============================================================================
; Starting gold at each player title.
;
; XREFS:
;     Player_SetInitialExpAndGold
;============================================================================

;
; XREFS:
;     Player_SetInitialExpAndGold
;
PLAYER_TITLE_GOLD:                          ; [$f767]
    .word $01f4                             ; [0]:
    .word $0320                             ; [1]:
    .word $04b0                             ; [2]:
    .word $0640                             ; [3]:
    .word $0834                             ; [4]:
    .word $0af0                             ; [5]:
    .word $0dac                             ; [6]:
    .word $10cc                             ; [7]:
    .word $1450                             ; [8]:
    .word $1838                             ; [9]:
    .word $1d4c                             ; [10]:
    .word $2328                             ; [11]:
    .word $2904                             ; [12]:
    .word $32c8                             ; [13]:
    .word $3a98                             ; [14]:


;============================================================================
; Return the inventory for the given item.
;
; This takes an item with inventory bits and returns the
; inventory it resides in as a number between 1-5.
;
; INPUTS:
;     A:
;         The inventory item with inventory bits set.
;
; OUTPUTS:
;     A:
;         The index of the inventory:
;
;         0 = Weapons
;         1 = Armor
;         2 = Shields
;         3 = Magic
;         4 = Special
;
; XREFS:
;     IScriptAction_OpenShop
;     Player_AddToInventory
;     Player_Equip
;     Player_LacksItem
;     Player_RemoveItem
;     Shop_GetPlayerHasSelectedItem
;     TextBox_DrawItemName
;     TextBox_LoadItemSourceTiles
;============================================================================
Player_GetInventoryIndexForItem:            ; [$f785]
    LSR A                                   ; Shift right 5, turning
                                            ; inventory bits into an index.
    LSR A
    LSR A
    LSR A
    LSR A
    RTS


;============================================================================
; Convert an inventory index to a bit for an item.
;
; This takes an inventory index and shifts it left 5,
; which turns it into an inventory bitmask that can be
; OR'd with an item ID.
;
; INPUTS:
;     A:
;         The inventory index.
;
;         0 = Weapons
;         1 = Armor
;         2 = Shields
;         3 = Magic
;         4 = Special
;
; OUTPUTS:
;     A:
;         The inventory bitmask.
;
; XREFS:
;     IScriptAction_ShowSellMenu
;     PlayerMenu_DrawInventoryItems
;     PlayerMenu_EquipItem
;     PlayerMenu_ShowStatusMenu
;============================================================================
Player_GetInventoryBitForIndex:             ; [$f78b]
    ASL A                                   ; Shift left 5 (here and the next
                                            ; 4 after falling through).


;============================================================================
; Multiply a value by 16.
;
; This seems to be primarily used for textbox widths.
; 16 is the max width of text in a box.
;
; INPUTS:
;     A:
;         The value to multiply.
;
; OUTPUTS:
;     A:
;         The resulting value.
;
; XREFS:
;     Menu_UpdateAndDraw
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     TextBox_DrawItemName
;     TextBox_GetBackingAttributeData
;============================================================================
Math_MultiplyBy16:                          ; [$f78c]
    ASL A                                   ; Shift left 4.
    ASL A
    ASL A
    ASL A
    RTS


;============================================================================
; Return the attribute data for a given position in a textbox.
;
; This will load the data from the current area's block attributes.
;
; INPUTS:
;     CurrentArea_BlockAttributesAddr:
;         The address of the loaded block attributes data
;         for the screen.
;
;     CurrentROMBank:
;         The current ROM bank.
;
;     ScreenBuffer:
;         The loaded screen buffer.
;
;     TextBox_ContentsX:
;         The X position to load.
;
;     TextBox_ContentsY:
;         The Y position to load.
;
; OUTPUTS:
;     A:
;         The loaded attribute data.
;
;     Temp_Int24:
;         Clobbered.
;
; CALLS:
;     MMC1_UpdateROMBank
;     Math_MultiplyBy16
;
; XREFS:
;     TextBox_GetBackgroundAttributeData
;============================================================================
TextBox_GetBackingAttributeData:            ; [$f791]
    ;
    ; Preserve X and Y on the stack.
    ;
    TYA                                     ; A = Y
    PHA                                     ; Push it to the stack.
    TXA                                     ; A = X
    PHA                                     ; Push it to the stack.


    ;
    ; Preserve the current ROM bank.
    ;
    LDA a:CurrentROMBank                    ; A = Current ROM bank.
    PHA                                     ; Push it to the stack.


    ;
    ; Switch to bank 3 (area metadata).
    ;
    LDX #$03                                ; X = 3 (Area metadata bank)
    JSR MMC1_UpdateROMBank                  ; Switch to the bank.
    LDA a:TextBox_ContentsY                 ; A = Tile Y position for the
                                            ; text in the textbox.
    JSR Math_MultiplyBy16                   ; Convert to an index in the
                                            ; block attributes data.
    AND #$f0                                ; Keep the upper nibble.
    STA Temp_Int24                          ; Store for the final result.
    ORA a:TextBox_ContentsX                 ; OR the index with the tile X
                                            ; position for the text.
    SEC
    SBC #$20                                ; Subtract 32.


    ;
    ; Load the data attribute from the screen buffer at this index.
    ;
    TAX                                     ; X = A (screen buffer lookup
                                            ; index)
    LDY ScreenBuffer,X                      ; Y = Screen buffer data at the
                                            ; index.
    LDA (CurrentArea_BlockAttributesAddr),Y ; Load the block attributes at
                                            ; the given offset.
    JMP textBox_GetAreaBehindTextBox_restoreAndReturn ; Jump to finish
                                                      ; loading.

;============================================================================
; TODO: Document Textbox_Maybe_GetAreaBehindTextbox
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     TextBox_Close
;============================================================================
Textbox_Maybe_GetAreaBehindTextbox:         ; [$f7b7]
    TYA
    PHA
    TXA
    PHA
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    LDA a:TextBox_ContentsY
    ASL A
    ASL A
    ASL A
    AND #$f0
    STA Temp_Int24
    LDA a:TextBox_ContentsX
    LSR A
    ORA Temp_Int24
    SEC
    SBC #$20
    TAX
    LDY ScreenBuffer,X
    LDA a:TextBox_ContentsX
    AND #$01
    STA Temp_Int24
    LDA a:TextBox_ContentsY
    ASL A
    AND #$02
    ORA Temp_Int24
    ASL A
    TAX
    LDA CurrentArea_BlockData1StartAddr,X
    STA Temp_Int24
    LDA CurrentArea_BlockData1StartAddr+1,X
    STA Temp_Int24_M
    LDA (Temp_Int24),Y

    ;
    ; XREFS:
    ;     TextBox_GetBackingAttributeData
    ;
textBox_GetAreaBehindTextBox_restoreAndReturn: ; [$f7f6]
    STA Temp_Int24                          ; Store the result temporarily.


    ;
    ; Restore the previous ROM bank.
    ;
    PLA                                     ; Pull the save ROM bank from the
                                            ; stack.
    TAX                                     ; X = A (ROM bank).
    JSR MMC1_UpdateROMBank                  ; Restore the bank.


    ;
    ; Restore the original X and Y registers from the stack.
    ;
    PLA                                     ; Pull the original X from the
                                            ; stack.
    TAX                                     ; Set back as X.
    PLA                                     ; Pull the original Y from the
                                            ; stack.
    TAY                                     ; Set back as Y.


    ;
    ; Load the result we calculated and return it.
    ;
    LDA Temp_Int24                          ; Load the calculated result.
    RTS                                     ; And return it.


;============================================================================
; Set the PPU address for drawing text.
;
; INPUTS:
;     PPU_ScrollScreen:
;         The screen being drawn into.
;
;     TextBox_ContentsX:
;         The X position to draw text into.
;
;     TextBox_ContentsY:
;         The Y position to draw text into.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The target address to draw to.
;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     IScripts_FillPlaceholderText
;     PlayerMenu_DrawStringLines
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     TextBox_Close
;     TextBox_DrawItemImage
;     TextBox_DrawItemName
;     TextBox_Open
;     TextBox_DrawZeroPaddedNumber
;     TextBox_ShowMessage_Fill4Lines
;     UI_DrawDigitsNoLeadingZeroes
;============================================================================
PPU_SetAddrForTextBoxPos:                   ; [$f804]
    LDA PPU_ScrollScreen                    ; A = Scroll screen used for
                                            ; drawing.
    AND #$01                                ; Convert to 0/1 (even/odd).
    ORA #$08                                ; A += 8
    STA PPU_TargetAddr_U                    ; Store as the PPU target
                                            ; address.
    LDA a:TextBox_ContentsY                 ; Load the text Y position.
    ASL A                                   ; A = A * 16
    ASL A
    ASL A
    ASL A
    ROL PPU_TargetAddr_U                    ; Rotate the upper byte of the
                                            ; target address left.
    ASL A                                   ; A << 1
    ROL PPU_TargetAddr_U                    ; Rotate the upper byte of the
                                            ; target address left.
    ORA a:TextBox_ContentsX                 ; OR it with the X position.
    STA PPU_TargetAddr                      ; Store as the lower byte of the
                                            ; target address.
    RTS


;============================================================================
; Increment the PPU target address by 16.
;
; INPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The updated PPU target address.
;
; XREFS:
;     TextBox_LoadItemSourceTiles
;     TextBox_ShowMessage_Fill4Lines
;============================================================================
PPU_IncrementAddrBy16:                      ; [$f81e]
    LDA #$10                                ; A = 16
    BNE PPU_IncrementAddrBy                 ; Unconditionally jump to
                                            ; PPU_IncrementAddrBy.


;============================================================================
; Increment the PPU target address by 8.
;
; INPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The updated PPU target address.
;
; XREFS:
;     TextBox_FillBackground
;============================================================================
PPU_IncrementAddrBy8:                       ; [$f822]
    LDA #$08                                ; A = 8
    BNE PPU_IncrementAddrBy                 ; Unconditionally jump to
                                            ; PPU_IncrementAddrBy.


;============================================================================
; Increment the PPU target address by 32.
;
; INPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The updated PPU target address.
;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     TextBox_Close
;     TextBox_DrawItemImage
;     TextBox_Open
;     TextBox_ClearTextTiles
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;============================================================================
PPU_IncrementAddrBy32:                      ; [$f826]
    LDA #$20                                ; Set the offset to 32.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Increment the PPU target address by a specified amount.
;
; INPUTS:
;     A:
;         The amount to increment by.
;
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         The updated PPU target address.
;
; XREFS:
;     PlayerMenu_DrawStringLines
;     PPU_IncrementAddrBy16
;     PPU_IncrementAddrBy8
;============================================================================
PPU_IncrementAddrBy:                        ; [$f828]
    CLC
    ADC PPU_TargetAddr                      ; A += PPU_TargetAddr
    BCC @_storeAndReturn                    ; If it overflowed, jump. No need
                                            ; to increment the upper byte.
    INC PPU_TargetAddr_U                    ; Else, increment the upper byte
                                            ; by 1.

  @_storeAndReturn:                         ; [$f82f]
    STA PPU_TargetAddr                      ; Set the new target address.
    RTS


;============================================================================
; Queue a write to the PPU buffer for the textbox width.
;
; INPUTS:
;     TextBox_Width:
;         The width of the textbox.
;
; OUTPUTS:
;     Y:
;         The textbox width.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     TextBox_Open
;============================================================================
TextBox_QueuePPUBufferTextBoxLength:        ; [$f832]
    LDA a:TextBox_Width                     ; A = Textbox width
    TAY                                     ; Y = A
    JMP PPUBuffer_QueueCommandOrLength      ; Queue as the length.


;============================================================================
; Fill a line of text within a textbox with a value.
;
; This will write to the PPU buffer for a given width. The
; width is expected to be at the last text position within
; the textbox. It will stop before it hits the padding
; before the text on the line.
;
; INPUTS:
;     A:
;         The value to write.
;
;     X:
;         The offset to write to.
;
;     Y:
;         The text position (+ 2).
;
; OUTPUTS:
;     None.
;
; CALLS:
;     PPUBuffer_Set
;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     TextBox_Open
;     TextBox_FillPPUBufferForTextWidth
;============================================================================
TextBox_FillPPUBufferForTextWidth:          ; [$f839]
    JSR PPUBuffer_Set                       ; Set the value in the buffer at
                                            ; the given offset.
    DEY                                     ; Y--
    CPY #$02                                ; Is it 2?
    BNE TextBox_FillPPUBufferForTextWidth   ; If not, loop.
    RTS


;============================================================================
; Write a value from a temp location to the PPU buffer.
;
; This will load a byte from Temp_Int24 and write
; it to the PPU buffer. The source offset will be
; advanced by 1.
;
; INPUTS:
;     X:
;         The destination index within the PPU buffer.
;
;     Y:
;         The offset from the address to load from.
;
;     Temp_Int24:
;         The location of the address to load from.
;
; OUTPUTS:
;     X:
;         The new offset to write to (X + 1).
;
; XREFS:
;     PasswordScreen_DrawMessage
;     TextBox_LoadItemSourceTiles
;     TextBox_Write8BytesFromTemp
;============================================================================
PPUBuffer_WriteFromTemp:                    ; [$f842]
    LDA (Temp_Int24),Y                      ; Load the value from
                                            ; Temp_Int24 at
                                            ; offset Y.
    INY                                     ; Y++

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Write a value to the PPU buffer.
;
; This will write the value and then increment the offset.
;
; INPUTS:
;     A:
;         The value to write.
;
;     X:
;         The offset at which to write the buffer.
;
; OUTPUTS:
;     X:
;         The new offset to write to (X + 1).
;
;     PPUBuffer:
;         The PPU buffer to write to.
;
; XREFS:
;     DEADCODE_FUN_PRG12__9041
;     PasswordScreen_WriteCharTile
;     TextBox_Close
;     TextBox_DrawItemImage
;     TextBox_FillBackground
;     TextBox_Open
;     UI_DrawString
;     PPUBuffer_WriteValueMany
;     TextBox_FillPPUBufferForTextWidth
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;     UI_DrawDigitsZeroPadded
;     UI_DrawManaOrHPBar
;============================================================================
PPUBuffer_Set:                              ; [$f845]
    STA PPUBuffer,X                         ; Store A in the PPU buffer at X.
    INX                                     ; X++
    RTS


;============================================================================
; Write a value many types to the PPU buffer.
;
; This will write the provided value the specified number
; of times, starting at a given offset.
;
; The first byte written will be the length, and the
; remaining bytes will be the provided value repeated.
;
; INPUTS:
;     A:
;         The value to write.
;
;     Y:
;         The number of times to write the value.
;
; OUTPUTS:
;     X:
;         The new offset in the buffer after these values.
;
; XREFS:
;     TextBox_ClearTextTiles
;     TextBox_ShowMessage_Fill4Lines
;============================================================================
PPUBuffer_WriteValueMany:                   ; [$f84a]
    PHA                                     ; Push A to the stack
    TYA                                     ; A = Y (length)
    JSR PPUBuffer_QueueCommandOrLength      ; Write the length to the buffer.
    PLA                                     ; Pop A from the stack

  @_loop:                                   ; [$f850]
    JSR PPUBuffer_Set                       ; Set the value in the PPU
                                            ; buffer.
    DEY                                     ; Y--
    BNE @_loop                              ; If Y > 0, loop
    STX PPUBuffer_WriteOffset               ; Set the upper bounds to write.
    RTS                                     ; Return with the new offset.


;============================================================================
; Performs a "Far JSR" to a code in another PRG bank.
;
; This takes in a bank in a the address within the bank (as
; an upper byte and a lower byte) from the next three bytes
; following this call. Specifically, it:
;
; 1. Steals the JSR return address off the stack to locate
;    the inline data.
;
; 2. Rewrites the return address so RTS will skip past the
;    3 data bytes.
;
; 3. Reads the inline bytes via (Temp_Int24),Y to
;    get the bank/target.
;
; 4. Switches to the bank.
;
; 5. Pushes a trampoline address ($C5F8) and the target
;    address so that RTS returns into the trampoline, which
;    then JSRs to the target and later restores the original
;    bank before returning to the caller.
;
; This is notably used for invoking IScripts.
;
; INPUTS:
;     A:
;         The bank, upper address byte, and lower address
;         byte in stack order.
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_CheckHandlePressUpOnNPC
;     Player_HandleTouchNPC
;     GameLoop_CheckShowPlayerMenu
;     Game_DecGloveDuration
;     Game_DecHourGlassDuration
;     Game_DecOintmentDuration
;     Game_DecWingBootsDuration
;     Game_OpenDoorWithAKey
;     Game_OpenDoorWithDemonsRing
;     Game_OpenDoorWithJKey
;     Game_OpenDoorWithJoKey
;     Game_OpenDoorWithKKey
;     Game_OpenDoorWithQKey
;     Game_OpenDoorWithRingOfDworf
;     Game_OpenDoorWithRingOfElf
;     Game_ShowStartScreen
;     Game_UnlockDoorWithUsableItem
;     IScripts_ClearPortraitImage
;     Player_HandleDeath
;     Player_PickUpBattleHelmet
;     Player_PickUpBattleSuit
;     Player_PickUpBlackOnyx
;     Player_PickUpDragonSlayer
;     Player_PickUpElixir
;     Player_PickUpGlove
;     Player_PickUpHourGlass
;     Player_PickUpMagicalRod
;     Player_PickUpMattock
;     Player_PickUpOintment
;     Player_PickUpPendant
;     Player_PickUpPoison
;     Player_PickUpRedPotion
;     Player_PickUpWingBoots
;     Player_UseElixir
;     Player_UseHourGlass
;     Player_UseMattock
;     Player_UseRedPotion
;     Player_UseWingBoots
;============================================================================
MMC1_LoadBankAndJump:                       ; [$f859]
    ;
    ; Save out the X, Y, and Z values to temporary variables.
    ;
    STA BankedCallSetup_SavedA              ; Set
                                            ; BankedCallSetup_SavedA
                                            ; = A
    STX BankedCallSetup_SavedX              ; Set
                                            ; BankedCallSetup_SavedX
                                            ; = X
    STY BankedCallSetup_SavedY              ; Set
                                            ; BankedCallSetup_SavedY
                                            ; = Y


    ;
    ; Pop two bytes of A from the stack and transfer to the lower
    ; and middle bytes (in order) of Temp_Int24.
    ;
    PLA                                     ; Pop A from the stack.
    STA Temp_Int24                          ; Lower byte of
                                            ; Temp_Int24 =
                                            ; A
    PLA                                     ; Pull A from the stack.
    STA Temp_Int24_M                        ; Middle byte of
                                            ; Temp_Int24 =
                                            ; A


    ;
    ; Save A to X. We'll increment this below if we overflow
    ; the add.
    ;
    TAX                                     ; X = A


    ;
    ; Compute a new return low = Temp_Int24.L + 3.
    ;
    LDA Temp_Int24                          ; A = lower byte of
                                            ; Temp_Int24.
    CLC                                     ; C = 0
    ADC #$03                                ; A = A + 3
    STA Temp_Int24_U                        ; Upper byte of
                                            ; Temp_Int24 =
                                            ; A


    ;
    ; If the upper byte overflowed, increment X.
    ;
    BCC @_storeCurrentAddress               ; If carry is cleared, jump.
    INX                                     ; X = X + 1


    ;
    ; Preserve the target address and ROM bank on the stack.
    ;
  @_storeCurrentAddress:                    ; [$f870]
    TXA                                     ; A = X (our adjusted offset)
    PHA                                     ; Push A to stack
    LDA Temp_Int24_U                        ; A = upper byte of
                                            ; Temp_Int24
    PHA                                     ; Push A to stack
    LDA a:CurrentROMBank                    ; A =
                                            ; CurrentROMBank
    PHA                                     ; Push A to stack


    ;
    ; Store the loaded address and bank to jump to.
    ;
    LDY #$03                                ; Y = 3
    LDA (Temp_Int24),Y                      ; A = Upper byte of the address
                                            ; to jump to.
    STA Maybe_Temp4                         ; Maybe_Temp4 =
                                            ; A
    DEY                                     ; Y-- (2)
    LDA (Temp_Int24),Y                      ; A = Lower byte of the address
                                            ; to jump to.
    STA Temp_Int24_U                        ; Upper byte of
                                            ; Temp_Int24 =
                                            ; A
    DEY                                     ; Y-- (1)
    LDA (Temp_Int24),Y                      ; A = Bank to load
    TAX                                     ; X = A
    JSR MMC1_UpdateROMBank                  ; Update the ROM bank to X.


    ;
    ; Push the trampoline address $C5F8.
    ;
    LDA #$f8                                ; A = 0xF8
    PHA                                     ; Push A to stack
    LDA #$c5                                ; A = 0xC5
    PHA                                     ; Push A to stack


    ;
    ; Push the target address for the trampoline.
    ;
    LDA Maybe_Temp4                         ; A =
                                            ; Maybe_Temp4
    PHA                                     ; Push A to stack
    LDA Temp_Int24_U                        ; A = upper byte of
                                            ; Temp_Int24.
    PHA                                     ; Push A to stack


    ;
    ; Restore the original values for A, X, and Y.
    ;
    LDA BankedCallSetup_SavedA              ; A =
                                            ; BankedCallSetup_SavedA
    LDX BankedCallSetup_SavedX              ; X =
                                            ; BankedCallSetup_SavedX
    LDY BankedCallSetup_SavedY              ; Y =
                                            ; BankedCallSetup_SavedY
    RTS

;============================================================================
; TODO: Document PPU_WriteTilesFromCHRRAM
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_DrawScenery
;     StartScreen_Draw
;     UI_DrawHUDSprites
;============================================================================
PPU_WriteTilesFromCHRRAM:                   ; [$f89e]
    LDA a:CurrentROMBank
    PHA
    JSR MMC1_UpdateROMBank
    STY Temp_Int24
    LDA PPU_TargetAddr_U
    STA a:PPUADDR
    LDA PPU_TargetAddr
    STA a:PPUADDR
    LDY #$00

  @LAB_PRG15_MIRROR__f8b3:                  ; [$f8b3]
    LDX #$10

  @LAB_PRG15_MIRROR__f8b5:                  ; [$f8b5]
    LDA (IScriptOrCHRAddr),Y
    STA a:PPUDATA
    INY
    BNE @LAB_PRG15_MIRROR__f8bf
    INC IScriptOrCHRAddr_U

  @LAB_PRG15_MIRROR__f8bf:                  ; [$f8bf]
    DEX
    BNE @LAB_PRG15_MIRROR__f8b5
    DEC Temp_Int24
    BNE @LAB_PRG15_MIRROR__f8b3
    PLA
    TAX
    JMP MMC1_UpdateROMBank


;============================================================================
; PPU address locations where statuc symbols are positioned.
;
; XREFS:
;     UI_DrawHUDSprites
;============================================================================

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_SYMBOL_PPU_ADDR_L:                ; [$f8cb]
    .byte $41                               ; [0]: 0x2041 -- "M" (Magic)

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_SYMBOL_PPU_ADDR_L_1_:             ; [$f8cc]
    .byte $61                               ; [1]: 0x2061 -- "P" (Power)
    .byte $6e                               ; [2]: 0x206E -- "G" (Gold)
    .byte $4e                               ; [3]: 0x204E -- "E" (Experience)
    .byte $56                               ; [4]: 0x2056 -- "T" (Time)
    .byte $5b                               ; [5]: 0x205B -- Top-left of "["
                                            ; (Selected item)
    .byte $7b                               ; [6]: 0x207B -- Bottom-left of
                                            ; "[" (Selected item)


;============================================================================
; Tile indexes to display in the status area.
;
; Each of these will be placed horizontally at a start
; location (by UI_STATUS_SYMBOL_PPU_ADDR_L).
;
; A 0x00 means to end the run.
;
; XREFS:
;     UI_DrawHUDSprites
;============================================================================

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_TILES:                            ; [$f8d2]
    .byte $1c                               ; [0]: "M" (Magic)

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_TILES_1_:                         ; [$f8d3]
    .byte $0a                               ; [1]: ":"

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_TILES_2_:                         ; [$f8d4]
    .byte $00                               ; [2]:
    .byte $1f                               ; [3]: "P" (Power)
    .byte $0a                               ; [4]: ":"
    .byte $00                               ; [5]:
    .byte $16                               ; [6]: "G" (Gold)
    .byte $3a                               ; [7]: ":"
    .byte $00                               ; [8]:
    .byte $14                               ; [9]: "E" (Experience)
    .byte $3a                               ; [10]: ":"
    .byte $00                               ; [11]:
    .byte $23                               ; [12]: "T" (Time)
    .byte $3a                               ; [13]: ":"
    .byte $00                               ; [14]:
    .byte $2c                               ; [15]: Top of "[" (current item)
    .byte $3c                               ; [16]: <blank space>
    .byte $3d                               ; [17]: <blank space>
    .byte $2e                               ; [18]: Top of "]" (current item)
    .byte $00                               ; [19]:
    .byte $2d                               ; [20]: Bottom of "[" (current
                                            ; item)
    .byte $3e                               ; [21]: <blank space>
    .byte $3f                               ; [22]: <blank space>
    .byte $2f                               ; [23]: Bottom of "]" (current
                                            ; item)
    .byte $00                               ; [24]:


;============================================================================
; Draw the status symbols on the screen.
;
; This will draw the following:
;
;     "P" (Power)
;     "M" (Magic)
;     "E" (Experience)
;     "G" (Gold)
;     "T" (Time)
;     Parts of "[ ]" for item selection
;
; It will also draw the selected item.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     Screen_SetupNew
;============================================================================
UI_DrawHUDSprites:                          ; [$f8eb]
    LDA #$0a
    STA a:UI_MPAndHPBarWidth


    ;
    ; Fill the entire status area with 0 (blank).
    ; This is 4 rows of tiles.
    ;
    LDA #$20                                ; Set the upper byte for the draw
                                            ; position.
    STA a:PPUADDR                           ; Store it.
    LDA #$00                                ; Set the lower byte for the draw
                                            ; position.
    STA a:PPUADDR                           ; Store it.
    LDY #$80                                ; Set Y = 128 (number of tiles to
                                            ; draw)
    LDA #$00                                ; Set the value to draw (blank
                                            ; tile).
    JSR PPU_FillData                        ; Clear all 128 tiles.


    ;
    ; Prepare to draw the symbols.
    ;
    ; This will loop through all positions, and then all tiles
    ; for that position. These are done as two separate lookup
    ; tables:
    ;
    ; 1. UI_STATUS_SYMBOL_PPU_ADDR_L: The lower
    ; addresses
    ;    of the PPU draw positions for placing each set of tiles.
    ;
    ;    This is incremented by 1 every time we finish placing tiles
    ;    for that area.
    ;
    ; 2. UI_STATUS_TILES: The tiles to draw at the
    ; current
    ;
    ;    Each run of tiles terminates with a 0x00. The next index would
    ;    then match the next position. This is incremented by 1 every
    ;    time we place a tile.
    ;
    LDX #$00                                ; Set X = 0 (start index in
                                            ; UI_STATUS_SYMBOL_PPU_ADDR_L.
    LDY #$00                                ; Set Y = 0 (start index at
                                            ; UI_STATUS_TILES.


    ;
    ; Set the PPUADDR to $20XX, where XX comes from the
    ; UI_STATUS_SYMBOL_PPU_ADDR_L lookup table.
    ;
    ; Each of these will be the location of a static symbol
    ; to show in the status area.
    ;
  @_goToNextPosition:                       ; [$f905]
    LDA #$20
    STA a:PPUADDR                           ; Store the upper draw position
                                            ; byte as 0x20.
    LDA UI_STATUS_SYMBOL_PPU_ADDR_L,X       ; Load the lower byte from the
                                            ; lookup table based on the
                                            ; index.
    STA a:PPUADDR                           ; Store it as the lower byte.


    ;
    ; Lay out tiles for UI elements starting at the current symbol
    ; address.
    ;
    ; This will write data from the UI_STATUS_TILES
    ; table
    ; until it hits an end market (0x00).
    ;
    ; This is generally 2-4 tiles per address.
    ;
  @_drawTiles:                              ; [$f910]
    LDA UI_STATUS_TILES,Y                   ; Load the tile to draw at the
                                            ; current tile index.
    BEQ @_advanceIndexes                    ; If this is 0x00, we've reached
                                            ; the end of the run. Advance
                                            ; indexes.
    STA a:PPUDATA                           ; Else, write the tile.
    INY                                     ; tileIndex++
    BNE @_drawTiles                         ; Loop.


    ;
    ; Advance to the next set of tiles and the next lower address
    ; (draw position) in the lookup tables.
    ;
  @_advanceIndexes:                         ; [$f91b]
    INY                                     ; tileIndex++
    INX                                     ; position++


    ;
    ; Check if we've completed the lookup table.
    ;
    ; There's only 7 addresses/positions to work with.
    ;
    CPX #$07                                ; Have we reached the end (draw
                                            ; position 7)?
    BNE @_goToNextPosition                  ; If not, loop.


    ;
    ; We've finished drawing the status UI.
    ;
    JSR UI_DrawSelectedItem
    LDA #$40
    STA IScriptOrCHRAddr
    LDA #$81
    STA IScriptOrCHRAddr_U
    LDA #$00
    STA PPU_TargetAddr
    LDA #$10
    STA PPU_TargetAddr_U
    LDX #$0a
    LDY #$3c
    JSR PPU_WriteTilesFromCHRRAM
    RTS


;============================================================================
; Check if the player reached the next title.
;
; If the player's experience passed the necessary threshold,
; the title will be increased by 1. It will never go up more
; than 1.
;
; INPUTS:
;     Experience_U:
;         The upper byte of the experience to check.
;
;     Experience:
;         The lower byte of the experience to check.
;
;     NextPlayerTitle:
;         The current player title is checked.
;
; OUTPUTS:
;     NextPlayerTitle:
;         The player title is updated as needed.
;
; XREFS:
;     Player_UpdateExperience
;============================================================================
Player_CheckReachedNextTitle:               ; [$f93c]
    LDA a:NextPlayerTitle
    CMP #$0f                                ; Have we hit the max title?
                                            ; (There are 15)
    BEQ @_return                            ; If yes, exit.
    ASL A                                   ; Convert to an index in the
                                            ; lookup table.


    ;
    ; Load the 16-bit experience level for the title.
    ;
    TAX
    LDA a:Experience                        ; Load the lower byte from the
                                            ; lookup table.
    CMP PLAYER_TITLE_EXP_NEEDED,X           ; Compare it.
    LDA a:Experience_U                      ; Load the upper byte from the
                                            ; lookup table.
    SBC PLAYER_TITLE_EXP_NEEDED+1,X         ; Compare it.
    BCC @_return                            ; If we're under, exit.


    ;
    ; The player has met the next title's requirements.
    ;
    INC a:NextPlayerTitle                   ; We have enough. Increase the
                                            ; player's next title.

  @_return:                                 ; [$f956]
    RTS


;============================================================================
; Update experience for the player.
;
; This will update from upper and lower values in RAM.
;
; INPUTS:
;     Temp_Int24:
;         The lower byte of experience to add.
;
;     Temp_Int24+1:
;         The upper byte of experience to add.
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_AddExperienceFromSprite
;     Player_Add100XP
;============================================================================
Player_UpdateExperience:                    ; [$f957]
    ;
    ; Update the lower byte of experience.
    ;
    LDA a:Experience                        ; Load the current lower byte of
                                            ; experience.
    CLC
    ADC Temp_Int24
    STA a:Experience                        ; Set the new lower byte of
                                            ; experience.


    ;
    ; Update the upper byte of experience.
    ;
    LDA a:Experience_U                      ; Load the current upper byte of
                                            ; experience.
    ADC Temp_Int24_M
    STA a:Experience_U                      ; Set the new upper byte of
                                            ; experience.
    BCC @LAB_PRG15_MIRROR__f972             ; Can we add to the experience,
                                            ; or did we hit a max?


    ;
    ; We hit the maximum amount of experience. Make sure
    ; this is capped.
    ;
    LDA #$ff
    STA a:Experience                        ; Set lower byte of experience to
                                            ; max.
    STA a:Experience_U                      ; Set upper byte of experience to
                                            ; max.

  @LAB_PRG15_MIRROR__f972:                  ; [$f972]
    JSR Player_CheckReachedNextTitle        ; Check if the next title has
                                            ; been hit.

    ;
    ; Fall through to the next function.
    ;


;============================================================================
; Render the player experience.
;
; This will set the draw position to 0x2050 (the location of
; the first digit of the experience), store out the experience
; to render, and then trigger the render.
;
; INPUTS:
;     Experience_U:
;         The upper byte of the experience.
;
;     Experience:
;         The lower byte of the experience.
;
; OUTPUTS:
;     PPU_TargetAddr+1:
;         The upper byte of the location to render to.
;
;     PPU_TargetAddr:
;         The lower byte of the location to render to.
;
;     $ee:
;         TODO: Currently unknown.
;
; CALLS:
;     UI_DrawDigitsZeroPadded
;
; XREFS:
;     UI_DrawHUD
;============================================================================
UI_DrawPlayerExperience:                    ; [$f975]
    ;
    ; Set the address of the first digit of the experience to write
    ; (0x2050).
    ;
    LDA #$20
    STA PPU_TargetAddr_U                    ; Store 0x20 as the upper byte.
    LDA #$50
    STA PPU_TargetAddr                      ; Store 0x50 as the upper byte.


    ;
    ; Store the new experience back out to Temp_Int24 and
    ; Temp_Int24+1.
    ;
    LDA a:Experience                        ; Load the lower byte of the
                                            ; experience.
    STA Temp_Int24                          ; Save to
                                            ; Temp_Int24.
    LDA a:Experience_U                      ; Load the upper byte of the
                                            ; experience.
    STA Temp_Int24_M                        ; Save to
                                            ; Temp_Int24+1.
    LDA #$00
    STA Temp_Int24_U
    LDY #$05
    JMP UI_DrawDigitsZeroPadded             ; Trigger the render.


;============================================================================
; Draw the number of seconds remaining for an item.
;
; This is used for items like the Wingboots and Glove.
;
; Only the lower byte of the 24-bit value is ever needed.
;
; INPUTS:
;     A:
;         The number of seconds to draw.
;
; OUTPUTS:
;     None
;
; SIDE EFFECTS:
;     $ee:
;     Temp_Int24+1:
;     Temp_Int24:
;     PPU_TargetAddr+1:
;     PPU_TargetAddr:
;         Clobbered.
;
; CALLS:
;     UI_DrawDigitsZeroPadded
;
; XREFS:
;     Game_DecWingBootsDuration
;     Player_UseWingBoots
;     UI_DrawHUD
;============================================================================
UI_DrawTimeValue:                           ; [$f990]
    ;
    ; Set the number of seconds remaining as a 24-bit integer.
    ;
    ; Only the lower byte is used. The rest are 0'd out.
    ;
    STA Temp_Int24                          ; Set number of seconds as the
                                            ; lower byte.
    LDA #$00
    STA Temp_Int24_M                        ; Set middle byte = 0.
    STA Temp_Int24_U                        ; Set upper byte = 0.


    ;
    ; Set the draw position (first digit of time remaining).
    ; This is 0x2058.
    ;
    LDA #$20
    STA PPU_TargetAddr_U                    ; Set high byte of position as
                                            ; 0x20.
    LDA #$58
    STA PPU_TargetAddr                      ; Set high byte of position as
                                            ; 0x58.


    ;
    ; Draw the digits with zero-padding.
    ;
    LDY #$02                                ; Set the number of digits to
                                            ; draw.
    JMP UI_DrawDigitsZeroPadded             ; Draw the digits with
                                            ; zero-padding.


;============================================================================
; Subtract gold from the player.
;
; This takes in gold as the 24-bit
; $ee:Temp_Int24+1:Temp_Int24
; and reduces those values from the player's gold.
;
; After subtracting, this will be drawn to the screen.
;
; INPUTS:
;     $ee:
;         The upper byte of the 24-bit gold value to subtract.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit gold value to
;         subtract.
;
;     Temp_Int24:
;         The lower byte of the 24-bit gold value to
;         subtract.
;
; OUTPUTS:
;     Gold_U:
;         The new upper byte of the current gold value.
;
;     Gold_M:
;         The new middle byte of the current gold value.
;
;     Gold:
;         The new lower byte of the current gold value.
;
; CALLS:
;     UI_DrawGoldValue
;
; XREFS:
;     IScripts_ProgressivelySubtractGold
;============================================================================
Player_SubtractGold:                        ; [$f9a5]
    ;
    ; Subtract from the lower byte.
    ;
    LDA a:Gold                              ; Load the lower byte of the
                                            ; current amount.
    SEC
    SBC Temp_Int24                          ; Subtract the provided value.
    STA a:Gold                              ; Store as the new lower byte.


    ;
    ; Subtract from the middle byte.
    ;
    LDA a:Gold_M                            ; Load the middle byte of the
                                            ; current amount.
    SBC Temp_Int24_M                        ; Subtract the provided value and
                                            ; the carry.
    STA a:Gold_M                            ; Store as the new middle byte.


    ;
    ; Subtract from the upper byte.
    ;
    LDA a:Gold_U                            ; Load the upper byte of the
                                            ; current amount.
    SBC #$00                                ; Subtract the carry.
    STA a:Gold_U                            ; Store as the new upper byte.


    ;
    ; Draw the new amount.
    ;
    JMP UI_DrawGoldValue                    ; Draw the new amount of gold.


;============================================================================
; Add gold to the player.
;
; This takes in gold as the 24-bit
; $ee:Temp_Int24+1:Temp_Int24
; and adds those values from the player's gold.
;
; After adding, this will be drawn to the screen.
;
; INPUTS:
;     $ee:
;         The upper byte of the 24-bit gold value to add.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit gold value to add.
;
;     Temp_Int24:
;         The lower byte of the 24-bit gold value to add.
;
; OUTPUTS:
;     Gold_U:
;         The new upper byte of the current gold value.
;
;     Gold_M:
;         The new middle byte of the current gold value.
;
;     Gold:
;         The new lower byte of the current gold value.
;
; CALLS:
;     UI_DrawDigitsZeroPadded
;
; XREFS:
;     IScripts_ProgressivelyAddGold
;============================================================================
Player_AddGold:                             ; [$f9c1]
    ;
    ; Add to the lower byte.
    ;
    LDA a:Gold                              ; Load the lower byte of the
                                            ; current amount.
    CLC
    ADC Temp_Int24                          ; Add the new amount.
    STA a:Gold                              ; Store as the new lower byte.


    ;
    ; Add to the middle byte.
    ;
    LDA a:Gold_M                            ; Load the middle byte of the
                                            ; current amount.
    ADC Temp_Int24_M                        ; Add the new amount + carry.
    STA a:Gold_M                            ; Store as the new middle byte.


    ;
    ; Add to the upper byte.
    ;
    LDA a:Gold_U                            ; Load the upper byte of the
                                            ; current amount.
    ADC #$00                                ; Add the carry.
    STA a:Gold_U                            ; Store as the new upper byte.


    ;
    ; If there's no carry, draw the value. Otherwise, we've
    ; maxed out the gold, so set that explicitly and then draw.
    ;
    BCC UI_DrawGoldValue                    ; If no carry, draw the current
                                            ; amount.


    ;
    ; Carry was set. We're maxed. Make it official.
    ;
    LDA #$ff
    STA a:Gold                              ; Set lower to max.
    STA a:Gold_M                            ; Set middle to max.
    STA a:Gold_U                            ; Set upper to max.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Draw the current gold display in the status UI.
;
; The gold will be rendered at the start position of
; 0x2070 (first digit of the gold amount).
;
; This is rendered zero-padded.
;
; INPUTS:
;     Gold_U:
;         Upper byte of the 24-bit gold value.
;
;     Gold_M:
;         Middle byte of the 24-bit gold value.
;
;     Gold:
;         Lower byte of the 24-bit gold value.
;
; OUTPUTS:
;     Temp_Int24:
;     Temp_Int24+1:
;     $ee:
;     PPU_TargetAddr:
;     PPU_TargetAddr+1:
;         Clobbered.
;
; CALLS:
;     UI_DrawDigitsZeroPadded;;
;
; XREFS:
;     Player_HandleTouchCoin
;     Player_AddGold
;     Player_SubtractGold
;     UI_DrawHUD
;============================================================================
UI_DrawGoldValue:                           ; [$f9e7]
    ;
    ; Set the draw position for the first digit of gold.
    ; This is 0x2070.
    ;
    LDA #$20
    STA PPU_TargetAddr_U                    ; Set the upper byte to 0x20.
    LDA #$70
    STA PPU_TargetAddr                      ; Set the lower byte to 0x70.


    ;
    ; Load the gold into the 24-bit temporary integer used for
    ; drawing digits.
    ;
    LDA a:Gold                              ; Load the lower byte of the gold
                                            ; value.
    STA Temp_Int24                          ; Set a the lower byte for the
                                            ; digits to draw.
    LDA a:Gold_M                            ; Load the middle byte of the
                                            ; gold value.
    STA Temp_Int24_M                        ; Set a the middle byte for the
                                            ; digits to draw.
    LDA a:Gold_U                            ; Load the upper byte of the gold
                                            ; value.
    STA Temp_Int24_U                        ; Set a the upper byte for the
                                            ; digits to draw.


    ;
    ; Draw the new amount as 7 digits, zero-padded.
    ;
    LDY #$07
    JMP UI_DrawDigitsZeroPadded             ; Draw 7 digits of gold.


;============================================================================
; Draw a 0-padded 24-bit number at the textbox draw position.
;
; This will draw a number up to a specific number of digits
; (maximum of 7) at the current textbox draw position,
; filling the width with leading zeros.
;
; It starts by populating all zeros, and then follows up
; by filling in any values from the number.
;
; INPUTS:
;     Y:
;         The number of digits in total.
;
;     $ee:
;         The upper byte of the 24-bit value.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit value.
;
;     Temp_Int24:
;         The lower byte of the 24-bit value.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new write offset into the PPU buffer.
;
; CALLS:
;     PPU_SetAddrForTextBoxPos
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     UI_PopulateDigits
;
; XREFS:
;     PlayerMenu_ShowStatusMenu
;============================================================================
TextBox_DrawZeroPaddedNumber:               ; [$fa03]
    JSR PPU_SetAddrForTextBoxPos            ; Set the PPU position address
                                            ; for the text.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Draw a 0-padded 24-bit number to the screen.
;
; This will draw a number up to a specific number of digits
; (maximum of 7) at the current PPU target address, filling
; the width with leading zeros.
;
; It starts by populating all zeros, and then follows up
; by filling in any values from the number.
;
; INPUTS:
;     Y:
;         The number of digits in total.
;
;     $ee:
;         The upper byte of the 24-bit value.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit value.
;
;     Temp_Int24:
;         The lower byte of the 24-bit value.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new write offset into the PPU buffer.
;
; CALLS:
;     PPU_SetAddrForTextBoxPos
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     UI_PopulateDigits
;
; XREFS:
;     UI_DrawGoldValue
;     UI_DrawPlayerExperience
;     UI_DrawTimeValue
;============================================================================
UI_DrawDigitsZeroPadded:                    ; [$fa06]
    TYA                                     ; A = Y (number of digits).
    PHA                                     ; Push it to the stack.
    JSR UI_PopulateDigits                   ; Populate the ASCII digits to
                                            ; render.


    ;
    ; Queue the number of tiles to draw in the PPU buffer.
    ;
    ;
    ; XREFS:
    ;     UI_DrawDigitsNoLeadingZeroes
    ;
UI_DrawDigitsZeroPadded_Populated:          ; [$fa0b]
    PLA                                     ; Pull the number of digits from
                                            ; the stack.
    TAY                                     ; Y = A
    JSR PPUBuffer_QueueCommandOrLength      ; Set as the number of tiles to
                                            ; draw in the PPU buffer.
    STY Temp_Int24                          ; Store the number temporarily.
    LDA #$07                                ; A = 7 (maximum number of
                                            ; digits).
    SEC
    SBC Temp_Int24                          ; Subtract the number of tiles to
                                            ; draw.
    TAY                                     ; Y = result (loop counter).

  @_drawDigitsLoop:                         ; [$fa18]
    LDA UI_DigitsToRender,Y                 ; Load the digit to draw at this
                                            ; index.
    JSR PPUBuffer_Set                       ; Set it in the PPU buffer.
    INY                                     ; Y++
    CPY #$07                                ; Is it 7 (max)?
    BNE @_drawDigitsLoop                    ; If not, loop.
    STX PPUBuffer_WriteOffset               ; Store the resulting PPU buffer
                                            ; write offset.
    RTS


;============================================================================
; Draw a space-padded 24-bit number to the screen.
;
; This will draw a number up to a specific number of digits
; (maximum of 7) at the current PPU target address, filling
; the width with spaces.
;
; It starts by populating all spaces, and then follows up
; by filling in any values from the number.
;
; INPUTS:
;     Y:
;         The number of digits in total.
;
;     $ee:
;         The upper byte of the 24-bit value.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit value.
;
;     Temp_Int24:
;         The lower byte of the 24-bit value.
;
; OUTPUTS:
;     PPUBuffer_WriteOffset:
;         The new write offset into the PPU buffer.
;
; CALLS:
;     PPU_SetAddrForTextBoxPos
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     UI_PopulateDigitsNoLeadingZeroes
;
; XREFS:
;     Shop_Draw
;============================================================================
UI_DrawDigitsNoLeadingZeroes:               ; [$fa26]
    JSR PPU_SetAddrForTextBoxPos            ; Set the PPU position address
                                            ; for the text.
    TYA                                     ; A = Y (number of digits)
    PHA                                     ; Push it to the stack.
    JSR UI_PopulateDigitsNoLeadingZeroes    ; Populate the digits with no
                                            ; leading zeros.
    JMP UI_DrawDigitsZeroPadded_Populated   ; Draw the digits.


;============================================================================
; Populate digits but with leading "0"s empty.
;
; This will populate the digits and then loop through them
; (up to 6 digits), NULing out all leading "0" digits so
; they don't display.
;
; INPUTS:
;     X:
;         The starting index into the digits.
;
; OUTPUTS:
;     UI_DigitsToRender:
;         The updated digits.
;
; CALLS:
;     UI_PopulateDigits
;
; XREFS:
;     UI_DrawDigitsNoLeadingZeroes
;============================================================================
UI_PopulateDigitsNoLeadingZeroes:           ; [$fa31]
    JSR UI_PopulateDigits                   ; Populate the ASCII digits.
    INX                                     ; Start at the provided index +
                                            ; 1.


    ;
    ; Check if the digit displays "0". If not, we're done.
    ;
  @_loop:                                   ; [$fa35]
    LDA UI_DigitsToRender,X                 ; Load the current ASCII digit.
    CMP #$30                                ; Is it an ASCII "0"?
    BNE @_return                            ; If not, we're done.


    ;
    ; Clear out the digit entirely.
    ;
    LDA #$00                                ; NUL out this digit.
    STA UI_DigitsToRender,X                 ; Store that as the new digit
                                            ; value.
    INX                                     ; i++
    CPX #$06                                ; Are we at the end of the loop?
    BNE @_loop                              ; If not, loop again.

  @_return:                                 ; [$fa46]
    RTS


;============================================================================
; Populate RAM with the digits to set based in the status UI.
;
; This will take the 24-bit value stored in
; $ee:Temp_Int24+1:Temp_Int24.
;
; It will loop through every digit, convert to ASCII, and
; store in UI_DigitsToRender for render.
;
; INPUTS:
;     $ee:
;         The upper byte of the 24-bit value.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit value.
;
;     Temp_Int24:
;         The lower byte of the 24-bit value.
;
; OUTPUTS:
;     UI_DigitsToRender:
;         The resulting digits in ASCII form.
;
; CALLS:
;     UI_GetValueForDigit
;
; XREFS:
;     UI_DrawDigitsZeroPadded
;     UI_PopulateDigitsNoLeadingZeroes
;============================================================================
UI_PopulateDigits:                          ; [$fa47]
    ;
    ; Prepare to loop 7 times (the max number of digits).
    ;
    LDX #$06                                ; Set the upper bound for the
                                            ; loop. We'll count down.


    ;
    ; Get the value for the next digit and convert to ASCII.
    ;
  @_loop:                                   ; [$fa49]
    JSR UI_GetValueForDigit                 ; Get the value for this digit.
    ORA #$30                                ; Normalize the value to an ASCII
                                            ; digit.
    STA UI_DigitsToRender,X                 ; Store in the target position in
                                            ; RAM.
    DEX                                     ; i--
    BPL @_loop                              ; Loop if we're not done.
    RTS


;============================================================================
; Return a numeric value for status line UI display.
;
; This takes a 24-bit value (representing the gold or
; experience, in practice) and converts it to a numeric
; value between 0 and 9.
;
; It does this by considering the unsigned integer value
; (stored as
; $ee:Temp_Int24+1:Temp_Int24).
;
; It loops for each of the 24 bits, left-shifting and
; rotating the most-significant bit into A (the resulting
; value). If A >= 10, it will subtract 10 and set the
; quotient bit incrementing @{symbol Temp3_L}. Rinse and
; repeat.
;
; After 24 iterations, the the remainder will be in A, and
; this will be a value between 0 and 9.
;
; The upper, middle, and lower values will be modified to
; divide by 10, which allows this to be called repeatedly
; to get every digit.
;
; INPUTS:
;     $ee:
;         The upper byte of the 24-bit value.
;
;     Temp_Int24+1:
;         The middle byte of the 24-bit value.
;
;     Temp_Int24:
;         The lower byte of the 24-bit value.
;
; OUTPUTS:
;     A:
;         The resulting digit (between 0 and 9).
;
;     $ee:
;         Upper byte of the floor of the value / 10.
;
;     Temp_Int24+1:
;         Middle byte of the floor of the value / 10.
;
;     Temp_Int24:
;         Lower byte of the floor of the value / 10.
;
; XREFS:
;     UI_PopulateDigits
;============================================================================
UI_GetValueForDigit:                        ; [$fa55]
    LDY #$18                                ; Prepare to loop over the 24
                                            ; bits.
    LDA #$00                                ; Set A (our value) = 0.

  @_loop:                                   ; [$fa59]
    ASL Temp_Int24                          ; Shift the low byte << 1; Set C
                                            ; as the out going bit.
    ROL Temp_Int24_M                        ; Set mid byte = (mid << 1) | C
    ROL Temp_Int24_U                        ; Set high byte = (high << 1) | C
    ROL A                                   ; Set A = (A << 1) | outgoing bit
                                            ; of high byte


    ;
    ; If the remainder (A) >= 10, subtract 10 and set the
    ; quotient bit (by incrementing Temp_Int24).
    ;
    CMP #$0a                                ; Is A >= 10?
    BCC @_finishLoopIter                    ; Branch if not.
    SBC #$0a                                ; A >= 10, so subtract 10.
    INC Temp_Int24                          ; Set quotient bit to 1.

  @_finishLoopIter:                         ; [$fa68]
    DEY                                     ; i-- (process next bit)
    BNE @_loop                              ; Loop until we hit 0.
    RTS

STATUS_BAR_PPU_ADDR_L:                      ; [$fa6c]
    .byte $63                               ; [0]: Power bar

;
; XREFS:
;     UI_DrawManaOrHPBar
;
STATUS_BAR_PPU_ADDR_L_1_:                   ; [$fa6d]
    .byte $43                               ; [1]: Mana bar
    .byte $08                               ; [0]: Power bar

;
; XREFS:
;     UI_DrawManaOrHPBar
;
BYTE_ARRAY_PRG15_MIRROR__fa6e_1_:           ; [$fa6f]
    .byte $09                               ; [1]: Manab ar
    .byte $0c                               ; [0]: Power bar

;
; XREFS:
;     UI_DrawManaOrHPBar
;
BYTE_ARRAY_PRG15_MIRROR__fa70_1_:           ; [$fa71]
    .byte $0d                               ; [1]: Mana bar

BYTE_ARRAY_PRG15_MIRROR__fa72:              ; [$fa72]
    .byte $c0                               ; [0]:

BYTE_ARRAY_PRG15_MIRROR__fa72_1_:           ; [$fa73]
    .byte $d0                               ; [1]:
    .byte $60                               ; [2]:
;============================================================================
; TODO: Document UI_DrawPlayerHPValue
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddHP
;     Player_AddHP
;     UI_DrawPlayerHP
;============================================================================
UI_DrawPlayerHPValue:                       ; [$fa75]
    ;
    ; Cap the amount of HP to 80, if over.
    ;
    CMP #$51
    BCC @LAB_PRG15_MIRROR__fa7b
    LDA #$50

  @LAB_PRG15_MIRROR__fa7b:                  ; [$fa7b]
    STA a:Temp_AddedHPValue
    STA a:Player_HP_U
    LDY #$00
    BEQ UI_DrawManaOrHPBar

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Set the number of mana points for the player.
;
; Once set, the mana bar will be drawn to reflect the new amount.
;
; INPUT:
;     A:
;         The mana points to set.
;
; OUTPUT:
;     None
;
; XREFS:
;     IScriptAction_AddMP
;     Player_AddMP
;     Player_ReduceMP
;     UI_DrawHUD
;============================================================================
Player_SetMP:                               ; [$fa85]
    ;
    ; Cap the number of mana points to 80, if over.
    ;
    CMP #$51                                ; Check if over 80 mana points.
    BCC @_storePoints                       ; If not over, we'll store what
                                            ; was passed in.
    LDA #$50                                ; Cap to 80 mana points.

  @_storePoints:                            ; [$fa8b]
    STA a:Player_MP                         ; Set the player's current mana
                                            ; points.
    LDY #$01

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document UI_DrawManaOrHPBar
;
; INPUTS:
;     A
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     UI_DrawPlayerHPValue
;============================================================================
UI_DrawManaOrHPBar:                         ; [$fa90]
    ;
    ; Set the upper byte of the 24-bit integer of the value to draw.
    ;
    STA Temp_Int24_U
    LDA a:UI_MPAndHPBarWidth
    ASL A
    ASL A
    ASL A
    CMP Temp_Int24_U
    BCS @LAB_PRG15_MIRROR__fa9e
    STA Temp_Int24_U

  @LAB_PRG15_MIRROR__fa9e:                  ; [$fa9e]
    STY Maybe_Temp4


    ;
    ; Set the draw position for the bar to update.
    ; This will be based on the lower address from the
    ; STATUS_BAR_PPU_ADDR_L lookup table.
    ;
    ; Bar 0 is the Mana bar.
    ; Bar 1 is the Power bar.
    ;
    LDA #$20
    STA PPU_TargetAddr_U
    LDA STATUS_BAR_PPU_ADDR_L,Y
    STA PPU_TargetAddr
    LDX a:UI_MPAndHPBarWidth
    INX
    TXA
    JSR PPUBuffer_QueueCommandOrLength
    LDA Temp_Int24_U
    LSR A
    LSR A
    LSR A
    BEQ @LAB_PRG15_MIRROR__fac6
    PHA
    STA Temp_Int24
    LDA $fa6e,Y

  @LAB_PRG15_MIRROR__fabe:                  ; [$fabe]
    JSR PPUBuffer_Set
    DEC Temp_Int24
    BNE @LAB_PRG15_MIRROR__fabe
    PLA

  @LAB_PRG15_MIRROR__fac6:                  ; [$fac6]
    CMP a:UI_MPAndHPBarWidth
    BEQ @LAB_PRG15_MIRROR__fae2
    PHA
    LDA $fa70,Y
    JSR PPUBuffer_Set
    PLA
    TAY
    LDA #$07

  @LAB_PRG15_MIRROR__fad6:                  ; [$fad6]
    INY
    CPY a:UI_MPAndHPBarWidth
    BEQ @LAB_PRG15_MIRROR__fae2
    JSR PPUBuffer_Set
    JMP @LAB_PRG15_MIRROR__fad6

  @LAB_PRG15_MIRROR__fae2:                  ; [$fae2]
    LDA #$0b
    JSR PPUBuffer_Set
    STX PPUBuffer_WriteOffset
    LDA Temp_Int24_U
    AND #$07
    JSR Math_MultiplyBy16
    TAY
    LDA #$10
    STA PPU_TargetAddr_U
    LDX Maybe_Temp4
    LDA BYTE_ARRAY_PRG15_MIRROR__fa72,X
    STA PPU_TargetAddr
    LDA #$10
    JSR PPUBuffer_QueueCommandOrLength
    LDA Maybe_Temp4
    BNE @LAB_PRG15_MIRROR__fb14


    ;
    ; DEADCODE: All this is wired off behind Maybe_Temp4, which
    ;           is never actually set. This appears to be code they
    ;           were working on but never completed/got right. Which
    ;           would not be a shock since part of it reaches into
    ;           program code instead of an array of values.
    ;
  @LAB_PRG15_MIRROR__fb05:                  ; [$fb05]
    LDA BYTE_PRG15_MIRROR__fb2f,Y
    INY
    JSR PPUBuffer_Set
    TYA
    AND #$0f
    BNE @LAB_PRG15_MIRROR__fb05
    STX PPUBuffer_WriteOffset
    RTS

  @LAB_PRG15_MIRROR__fb14:                  ; [$fb14]
    LDA BYTE_PRG15_MIRROR__fb37,Y
    INY
    JSR PPUBuffer_Set
    TYA
    AND #$07
    BNE @LAB_PRG15_MIRROR__fb14


    ;
    ; XXX Is this correct? It's reading from program code.
    ;
  @LAB_PRG15_MIRROR__fb20:                  ; [$fb20]
    LDA @LAB_PRG15_MIRROR__fb27,Y
    INY
    JSR PPUBuffer_Set

  @LAB_PRG15_MIRROR__fb27:                  ; [$fb27]
    TYA
    AND #$07
    BNE @LAB_PRG15_MIRROR__fb20
    STX PPUBuffer_WriteOffset
    RTS

;
; XREFS:
;     LAB_PRG15_MIRROR__fb05 [$PRG15_MIRROR::fb05]
;
BYTE_PRG15_MIRROR__fb2f:                    ; [$fb2f]
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb2f] byte

;
; XREFS:
;     LAB_PRG15_MIRROR__fb14 [$PRG15_MIRROR::fb14]
;
BYTE_PRG15_MIRROR__fb37:                    ; [$fb37]
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb37] byte
    .byte $00,$ff,$80,$80,$80,$80,$ff,$00   ; [$fb3f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb47] byte
    .byte $00,$ff,$c0,$c0,$c0,$c0,$ff,$00   ; [$fb4f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb57] byte
    .byte $00,$ff,$e0,$e0,$e0,$e0,$ff,$00   ; [$fb5f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb67] byte
    .byte $00,$ff,$f0,$f0,$f0,$f0,$ff,$00   ; [$fb6f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb77] byte
    .byte $00,$ff,$f8,$f8,$f8,$f8,$ff,$00   ; [$fb7f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb87] byte
    .byte $00,$ff,$fc,$fc,$fc,$fc,$ff,$00   ; [$fb8f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fb97] byte
    .byte $00,$ff,$fe,$fe,$fe,$fe,$ff,$00   ; [$fb9f] byte
    .byte $00,$ff,$00,$00,$00,$00,$ff,$00   ; [$fba7] byte

;============================================================================
; TODO: Document UI_DrawSelectedItem
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     UI_DrawHUDSprites
;============================================================================
UI_DrawSelectedItem:                        ; [$fbaf]
    LDA #$13
    STA a:PPUADDR
    LDA #$c0
    STA a:PPUADDR
    LDA a:SelectedItem
    BPL @LAB_PRG15_MIRROR__fbc5
    LDY #$40
    LDA #$00
    JMP PPU_FillData

  @LAB_PRG15_MIRROR__fbc5:                  ; [$fbc5]
    ASL A
    ASL A
    TAY
    LDA a:CurrentROMBank
    PHA
    LDX #$0a
    JSR MMC1_UpdateROMBank

  @LAB_PRG15_MIRROR__fbd1:                  ; [$fbd1]
    LDA ITEM_TILEMAP_INDEXES,Y
    JSR UI_Maybe_GetItemSpritePPUTileAddr
    TYA
    PHA
    LDY #$00

  @LAB_PRG15_MIRROR__fbdb:                  ; [$fbdb]
    LDA (Temp_Int24),Y
    STA a:PPUDATA
    INY
    CPY #$10
    BNE @LAB_PRG15_MIRROR__fbdb
    PLA
    TAY
    INY
    TYA
    AND #$03
    BNE @LAB_PRG15_MIRROR__fbd1
    JMP MMC1_UpdatePRGBankToStackA

;============================================================================
; TODO: Document UI_Maybe_GetItemSpritePPUTileAddr
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_LoadItemSourceTiles
;     UI_DrawSelectedItem
;============================================================================
UI_Maybe_GetItemSpritePPUTileAddr:          ; [$fbf0]
    STA Temp_Int24_M
    LDA #$00
    LSR Temp_Int24_M
    ROR A
    LSR Temp_Int24_M
    ROR A
    LSR Temp_Int24_M
    ROR A
    LSR Temp_Int24_M
    ROR A
    ADC #$00
    STA Temp_Int24
    LDA Temp_Int24_M
    ADC #$85
    STA Temp_Int24_M
    RTS

;============================================================================
; TODO: Document Player_SetItem
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetItem:                             ; [$fc0b]
    STA a:SelectedItem
    LDX #$13
    STX PPU_TargetAddr_U
    LDX #$c0
    STX PPU_TargetAddr
    ORA #$80

;============================================================================
; TODO: Document TextBox_LoadItemSourceTiles
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_DrawItemImage
;============================================================================
TextBox_LoadItemSourceTiles:                ; [$fc18]
    PHA
    JSR Player_GetInventoryIndexForItem
    TAX
    LDA FUN_PRG15_MIRROR__fc0b__LOWER_ADDR_TABLE,X
    STA Temp_Int24_U
    LDA FUN_PRG15_MIRROR__fc0b__UPPER_ADDR_TABLE,X
    STA Maybe_Temp4
    PLA
    AND #$1f
    ASL A
    ASL A
    TAY
    LDA a:CurrentROMBank
    PHA
    LDX #$0a
    JSR MMC1_UpdateROMBank

  @LAB_PRG15_MIRROR__fc36:                  ; [$fc36]
    LDA (Temp_Int24_U),Y
    JSR UI_Maybe_GetItemSpritePPUTileAddr
    TYA
    PHA
    LDA #$10
    JSR PPUBuffer_QueueCommandOrLength
    LDY #$00

  @LAB_PRG15_MIRROR__fc44:                  ; [$fc44]
    JSR PPUBuffer_WriteFromTemp
    CPY #$10
    BNE @LAB_PRG15_MIRROR__fc44
    STX PPUBuffer_WriteOffset
    JSR PPU_IncrementAddrBy16
    PLA
    TAY
    INY
    TYA
    AND #$03
    BNE @LAB_PRG15_MIRROR__fc36
    JMP MMC1_UpdatePRGBankToStackA

;
; XREFS:
;     TextBox_LoadItemSourceTiles
;
FUN_PRG15_MIRROR__fc0b__LOWER_ADDR_TABLE:   ; [$fc5b]
    .byte $a0                               ; [0]:
    .byte $b0                               ; [1]:
    .byte $c0                               ; [2]:
    .byte $d0                               ; [3]:
    .byte $e4                               ; [4]:

;
; XREFS:
;     TextBox_LoadItemSourceTiles
;
FUN_PRG15_MIRROR__fc0b__UPPER_ADDR_TABLE:   ; [$fc60]
    .byte $b4                               ; [0]:
    .byte $b4                               ; [1]:
    .byte $b4                               ; [2]:
    .byte $b4                               ; [3]:
    .byte $b4                               ; [4]:


;============================================================================
; Show the start screen and handle game start or password selection.
;
; This is shown just after the game boots. The screen will
; be drawn and will wait on input from the player, allowing
; them to start the game or enter the password screen.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Game_Start
;     MMC1_LoadBankAndJump
;     PasswordScreen_Show
;     Player_SetInitialExpAndGold
;     Player_SetStartGameState
;     Player_Spawn
;     Screen_ResetSpritesForNonGame
;     SplashAnimation_RunIntro
;     StartScreen_CheckHandleInput
;     StartScreen_Draw
;     WaitForNextFrame
;
; XREFS:
;     Game_InitStateForStartScreen
;============================================================================
Game_ShowStartScreen:                       ; [$fc65]
    LDX #$ff                                ; X = 0xFF
    TXS                                     ; Store X in memory.


    ;
    ; Switch to bank 12 and run StartScreen_Draw.
    ;
    JSR MMC1_LoadBankAndJump                ; Jump to:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer StartScreen_Draw-1              ; Address =
                                            ; StartScreen_Draw


    ;
    ; Wait for a choice at the game's start screen.
    ;
  @_waitForInput:                           ; [$fc6e]
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Screen_ResetSpritesForNonGame


    ;
    ; Switch to bank 12 and run StartScreen_CheckHandleInput.
    ;
    JSR MMC1_LoadBankAndJump                ; Jump to:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer StartScreen_CheckHandleInput-1  ; Address =
                                            ; StartScreen_CheckHandleInput

  @_afterCheckHandleInputFarJump:           ; [$fc7a]
    LDA Joy1_ChangedButtonMask              ; Check the changed controller 1
                                            ; button mask.
    AND #$10                                ; Was the Start button pressed?
    BEQ @_waitForInput                      ; If not, loop.


    ;
    ; The player pressed Start. Check what they chose.
    ;
    ; But first, play the titlescreen music.
    ;
    LDA #$08
    STA Music_Current
    LDA a:DAT_0687                          ; Check the chosen option.
    BEQ @_startGame                         ; If 0, they chose to start the
                                            ; game. Else, fall through.


    ;
    ; The player chose to enter the Password screen.
    ;
    ; Switch to bank 12 and run PasswordScreen_Show.
    ;
    JSR MMC1_LoadBankAndJump                ; Jump to:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer PasswordScreen_Show-1           ; Address =
                                            ; PasswordScreen_Show


    ;
    ; Switch to bank 12 and run Player_SetInitialExpAndGold.
    ;
  @_afterPasswordScreenShow:                ; [$fc8f]
    JSR MMC1_LoadBankAndJump                ; Jump to:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer Player_SetInitialExpAndGold-1   ; Address =
                                            ; Player_SetInitialExpAndGold

  @_afterSetExpGoldFarJump:                 ; [$fc95]
    JMP Player_Spawn


    ;
    ; The player chose to start the game.
    ;
    ; Switch to bank 12 and run SplashAnimation_RunIntro.
    ;
  @_startGame:                              ; [$fc98]
    JSR MMC1_LoadBankAndJump                ; Jump to:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer SplashAnimation_RunIntro-1      ; Address =
                                            ; SplashAnimation_RunIntro


    ;
    ; Switch to bank 12 and run Player_SetStartGameState.
    ;
  @_afterRunIntroFarJump:                   ; [$fc9e]
    JSR MMC1_LoadBankAndJump                ; Jump to:
    .byte BANK_12_LOGIC                     ; Bank = 12
    pointer Player_SetStartGameState-1      ; Address =
                                            ; Player_SetStartGameState


    ;
    ; Begin the game.
    ;
  @_afterSetStartGameStateFarJump:          ; [$fca4]
    JMP Game_Start


;============================================================================
; Draw an input-requesting symbol.
;
; This is used to position and animate a symbol indicating
; a need for input.
;
; This is used for terminator symbols on textboxes and for the
; item selection symbols on the start screen and Buy/Sell menus.
;
; INPUTS:
;     A:
;         The sprite and animation frame offset.
;
;     X:
;         The X position of the symbol.
;
;     Y:
;         The Y position of the symbol.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Sprite_SetAppearanceAddrFromOffset
;
; XREFS:
;     Menu_UpdateAndDraw
;     PasswordScreen_DrawSelectionCursor
;     StartScreen_CheckHandleInput
;     TextBox_DrawDownArrowTerminatorSymbol
;     TextBox_DrawQuestionMarkTerminatorSymbol
;     TextBox_DrawUpArrowTerminatorSymbol
;============================================================================
UI_DrawPromptInputSymbol:                   ; [$fca7]
    STX Arg_DrawSprite_PosX                 ; Set the X argument.
    STY Arg_DrawSprite_PosY                 ; Set the Y argument.
    LDX #$00
    STX CurrentSprite_FlipMask              ; Clear the flip mask.
    JMP Sprite_SetAppearanceAddrFromOffset  ; Set the animation frame and
                                            ; offset of the sprite.


;============================================================================
; Fill the PPU with a single byte repeated `count` times.
;
; This will always write the value at least once and then
; decrement. If a count of 0 is passed, it will decrement
; to 0xFF, and then loop back down to 0.
;
; INPUTS:
;     A:
;         The value to write.
;
;     Y:
;         The number of times to write the value.
;
;         If 0, this will write 256 times.
;
; OUTPUTS:
;     PPUDATA:
;         This will be filled with values.
;
; XREFS:
;     PasswordScreen_Show
;     PPU_ClearAllTilemaps
;     PPU_FillData
;     UI_DrawHUDSprites
;     UI_DrawSelectedItem
;============================================================================
PPU_FillData:                               ; [$fcb2]
    STA a:PPUDATA                           ; Store the value in PPUDATA.
    DEY                                     ; Y--
    BNE PPU_FillData                        ; If not 0, loop.
    RTS


;============================================================================
; Clear all tiles across all nametables.
;
; This will fill every tile with 0.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     PPUADDR:
;         The updated address.
;
; CALLS:
;     PPU_FillData
;
; XREFS:
;     PasswordScreen_Show
;     StartScreen_Draw
;============================================================================
PPU_ClearAllTilemaps:                       ; [$fcb9]
    ;
    ; Set the start position to the top-left ($2000).
    ;
    LDA #$20
    STA a:PPUADDR
    LDA #$00
    STA a:PPUADDR


    ;
    ; Prepare the value and loop counter.
    ;
    TAY                                     ; Y = 0 (value to write)
    LDX #$04                                ; X = 4 (loop counter)


    ;
    ; Begin the loop.
    ;
  @_loop:                                   ; [$fcc6]
    JSR PPU_FillData                        ; Fill 256 bytes of data.
    DEX                                     ; X--
    BNE @_loop                              ; If not 0, loop.
    RTS
    .byte $bd,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fccd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fcd5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fcdd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fce5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fced] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fcf5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fcfd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd05] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd0d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd15] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd1d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd25] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd2d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd35] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd3d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd45] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd4d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd55] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd5d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd65] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd6d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd75] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd7d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd85] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd8d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd95] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fd9d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fda5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdad] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdb5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdbd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdc5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdcd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdd5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fddd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fde5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fded] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdf5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fdfd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe05] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe0d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe15] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe1d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe25] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe2d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe35] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe3d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe45] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe4d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe55] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe5d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe65] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe6d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe75] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe7d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe85] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe8d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe95] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fe9d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fea5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fead] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$feb5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$febd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fec5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fecd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fed5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fedd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fee5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$feed] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fef5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$fefd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff05] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff0d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff15] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff1d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff25] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff2d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff35] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff3d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff45] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff4d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff55] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff5d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff65] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff6d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff75] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff7d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff85] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff8d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff95] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ff9d] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffa5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffad] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffb5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffbd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffc5] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffcd] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ffd5] undefined
    .byte $ff,$ff,$ff                       ; [$ffdd] undefined

    .byte $20                               ; Game title
    .byte $20,$20,$20,$20,$20,$20,$20,$46   ; [$ffe1] string
    .byte $41,$58,$41,$4e,$41,$44,$55       ; [$ffe9] string

    .word $4227                             ; PRG Checksum
    .word $0000                             ; CHR CHecksum
    .byte $48                               ; CHR size: 0 = 8KiB CHR type: 0
                                            ; = CHR ROM PRG size: 5 = 512KiB
    .byte $04                               ; Mapper:    4 = MMC Nametable: 0
                                            ; = Horizontal arrangement
    .byte $01                               ; Title encoding: 1 = ASCII
    .byte $07                               ; Title length: 8 bytes
    .byte $18                               ; Licensee Code: Hudson Soft
    .byte $94                               ; Header validation byte
    pointer OnInterrupt                     ; OnInterrupt
                                            ; [$PRG15_MIRROR::fffa]
    pointer Game_Init                       ; Game_Init
                                            ; [$PRG15_MIRROR::fffc]
    .byte $d5                               ; [$fffe] undefined

;
; XREFS:
;     MMC1_Init
;
MMC1_SERIAL:                                ; [$ffff]
    .byte $c9                               ; [$ffff] undefined
