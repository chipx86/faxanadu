;============================================================================
; Faxanadu (U).nes
;
; PRG15_MIRROR ($c000 - $ffff)
;============================================================================

    BASE $c000


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
    LDA #$c01b,X                            ; Load the value for the
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
    db $00                                  ; [0]: Dartmoor, Castle of
                                            ; Fraternal, King Grieve's Room
    db $55                                  ; [1]: Start Screen
    db $aa                                  ; [2]: Most exterior areas.
    db $ff                                  ; [3]: Most interior areas.
    db $41                                  ; [4]: Here and below are unused.
    db $20                                  ; [5]:
    db $04                                  ; [6]:
    db $07                                  ; [7]:
    db $08                                  ; [8]:
    db $09                                  ; [9]:
    db $0a                                  ; [10]:
    db $61                                  ; [11]:
    db $20                                  ; [12]:
    db $04                                  ; [13]:
    db $0b                                  ; [14]:
    db $0c                                  ; [15]:
    db $0d                                  ; [16]:
    db $0e                                  ; [17]:
    db $56                                  ; [18]:
    db $20                                  ; [19]:
    db $03                                  ; [20]:
    db $0f                                  ; [21]:
    db $10                                  ; [22]:
    db $11                                  ; [23]:


;============================================================================
; XXX Maybe unused?
;============================================================================
UNUSED_FUN_PRG15_MIRROR__c033:              ; [$c033]
    LDY #$00
    LDA (Temp_Addr_L),Y
    STA PPU_TargetAddr
    INY
    LDA (Temp_Addr_L),Y
    STA PPU_TargetAddr.U
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
    SBC #$b7a9,X                            ; Look up the cost of this spell.
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
; This will clear out all the current sprites and the selected
; weapon, and reset the screen color mode.
;
; INPUTS:
;     ScreenColorMode:
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
;     ScreenColorMode:
;         The new color mode with greyscale removed.
;
;     IScript_PortraitID:
;         Set to 0xFF.
;
; CALLS:
;     PPU_ResetOffset
;
; XREFS:
;     EndGame_Begin
;     Game_MainLoop
;     Player_HandleDeath
;     Screen_SetupSprites
;============================================================================
GameLoop_ClearSprites:                      ; [$c130]
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
    JSR PPU_ResetOffset                     ; Reset the PPU offset.
    LDA #$ff
    STA a:IScript_PortraitID                ; Clear any portrait shown on
                                            ; screen.
    LDA ScreenColorMode                     ; Load the current screen color
                                            ; mode.
    AND #$fe                                ; Set to color mode (clear bit 1)
    STA ScreenColorMode                     ; Store the new color mode.
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
;     GameLoop_LoadSpriteInfo
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
    LDA #$8210,Y                            ; Load the upper byte of the
                                            ; address.
    STA Temp_Addr_L                         ; Store for reading.
    LDA #$8211,Y                            ; Load the lower byte of thea
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
    STA Sprites_ReadInfoAddr.U              ; And store it.


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
    LDA Sprites_ReadInfoAddr.U              ; Load the upper byte.
    ADC #$00                                ; Add carry, if lower byte
                                            ; overflowed.
    STA Screen_ExtraInfoAddr.U              ; Store as the new upper byte.
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
;     #$cd:
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
;     #$cb:
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
;     #$cb:
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
GameLoop_LoadSpriteInfo:                    ; [$c1b4]
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
    LDA Sprites_ReadInfoAddr.U              ; A = upper byte of the screen
                                            ; information address
    ADC #$00                                ; Add carry if the lower byte
                                            ; overflowed.
    STA Sprites_ReadInfoAddr.U              ; Store it as the new upper byte
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
;     GameLoop_LoadSpriteInfo
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
    LDA #$b4df,Y                            ; Load the hitbox type for the
                                            ; entity.
    STA CurrentSprites_HitBoxTypes,X        ; Set it.
    LDA #$b5a9,Y                            ; Load the HP for the entity.
    STA CurrentSprites_HP,X                 ; Set it.


    ;
    ; Prepare the behavior scripts for the entity.
    ;
    TYA                                     ; A = Y (entity)
    ASL A                                   ; Convert to a word boundary.
    TAY                                     ; Y = A
    LDA #$ad2d,Y                            ; Load the lower byte of the
                                            ; behavior script for the entity.
    STA CurrentSprites_BehaviorAddrs_L,X    ; Set the lower byte of the
                                            ; address.
    LDA #$ad2e,Y                            ; Load the upper byte.
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
    db $06                                  ; [0]: Bank for sprites 0-54

;
; XREFS:
;     Sprites_StoreBankForCurrentSprite
;
SPRITE_IMAGE_BANKS_1_:                      ; [$c25a]
    db $07                                  ; [1]: Bank for sprites 55-100


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
;     #$cd:
;         The current address for the extra sprite values
;         on the screen.
;
; OUTPUTS:
;     CurrentSprites_Values:
;         The updated sprite values.
;
;     Screen_ExtraInfoAddr:
;     #$cd:
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
    INC Screen_ExtraInfoAddr.U              ; Else, increment the upper byte
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
;     CurrentSprite_ImagesBank:
;         The bank for the images for this sprite.
;
; XREFS:
;     GameLoop_LoadSpriteImages
;============================================================================
Sprites_StoreBankForCurrentSprite:          ; [$c27c]
    ;
    ; Y = 0
    ;
    LDY #$00
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
    LDA #$c259,Y                            ; Load the address for the sprite
                                            ; entity.
    STA a:CurrentSprite_ImagesBank          ; Store as the bank for this
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
;     CurrentSprites_PPUAddrs:
;         PPU addresses for sprite data.
;
;     CurrentSprite_Entity:
;         Clobbered.
;
; CALLS:
;     PPU_ResetOffset
;     PPUBuffer_WaitUntilClear
;     Sprites_LoadImageForCurrentSprite
;     Sprites_StoreBankForCurrentSprite
;
; XREFS:
;     FUN_PRG15_MIRROR__dacd
;     Game_MainLoop
;     Game_SetupAndLoadArea
;     Game_Start
;     IScripts_ClearPortraitImage
;     Maybe_Game_EnterBuildingHandler
;     Maybe_Game_EnterScreenHandler
;     Maybe_Game_ExitBuildingHandler
;============================================================================
GameLoop_LoadSpriteImages:                  ; [$c28d]
    ;
    ; Save state and prepare for image loading.
    ;
    LDA a:CurrentSpriteIndex                ; A = current sprite index
    PHA                                     ; Push it to the stack.
    JSR PPU_ResetOffset                     ; Reset the PPU drawing
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
    ; Effectively, each Lilith on screen seems t be backed by
    ; a Pakukame.
    ;
    LDA a:CurrentSprite_Entity              ; Load the Pakukame entity ID
    PHA                                     ; Push to the stack.
    LDA PPUOffset_Index                     ; Load the offset row.
    PHA                                     ; Push it to the stack.
    LDA #$09                                ; A = 9 (Lilith)
    STA a:CurrentSprite_Entity              ; Store as the new entity.
    JSR Sprites_StoreBankForCurrentSprite   ; Store the bank for Lilith.
    JSR Sprites_LoadImageForCurrentSprite   ; Load Lilth's image from the
                                            ; bank.
    PLA                                     ; Pop the PPU offset row.
    STA PPUOffset_Index                     ; Store it again.
    PLA                                     ; Pop the current sprite entity.
    STA a:CurrentSprite_Entity              ; Store it again.


    ;
    ; Load the PPU address and Y posiiton for the sprite.
    ;
    ; If the Y position is off the screen (row 30 or higher),
    ; then the sprite will be unset.
    ;
  @_loadSpriteInfo:                         ; [$c2c9]
    LDX a:CurrentSpriteIndex                ; X = current sprite index
    LDA PPUOffset_Index                     ; A = PPU offset row
    STA CurrentSprites_PPUAddrs,X           ; Set this in the PPU addresses
                                            ; for this sprite.
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
;     Maybe_Arg_CurrentSprite_PosX:
;     Maybe_Arg_CurrentSprite_PosY:
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
    STA Maybe_Arg_CurrentSprite_PosX        ; Set as an argument for future
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
    STA Maybe_Arg_CurrentSprite_PosY        ; Set as an argument for future
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
    LDA #$bb28,Y                            ; Load the lower byte of the
                                            ; finish handler.
    PHA                                     ; Push to the stack.
    LDA #$bb27,Y                            ; Load the upper byte.
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
    ADC #$c387,Y                            ; Add the value from the lookup
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
    db $95                                  ; [0]: Deluge
    db $99                                  ; [1]: Thunder
    db $9b                                  ; [2]: Fire
    db $9d                                  ; [3]: Death
    db $a1                                  ; [4]: Tilte
    db $a5                                  ; [5]: UNUSED: Deluge after first
                                            ; hit
    db $99                                  ; [6]: Thunder after first hit
    db $9b                                  ; [7]: Fire after first hit
    db $a5                                  ; [8]: UNUSED: Death after first
                                            ; hit
    db $a5                                  ; [9]: UNUSED
    db $a5                                  ; [10]: UNUSED: Hit wall effect
    db $a5                                  ; [11]: Tilte after first hit


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
;     Maybe_Arg_CurrentSprite_PosY:
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
    STA Maybe_Arg_CurrentSprite_PosY        ; Set as the new sprite's Y
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
    STA Maybe_Arg_CurrentSprite_PosY        ; Save it as the new sprite's Y
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

  @LAB_PRG15_MIRROR__c432:                  ; [$c432]
    LDA a:CastMagic_Counter
    ASL A
    PHA
    STA Temp_00
    EOR #$c46c,X
    BPL @LAB_PRG15_MIRROR__c442
    STA Temp_00
    INC Temp_00

  @LAB_PRG15_MIRROR__c442:                  ; [$c442]
    LDA a:CastMagic_XPos_Full
    CLC
    ADC Temp_00
    STA Maybe_Arg_CurrentSprite_PosX
    PLA
    STA Temp_00
    EOR #$c470,X
    BPL @LAB_PRG15_MIRROR__c456
    STA Temp_00
    INC Temp_00

  @LAB_PRG15_MIRROR__c456:                  ; [$c456]
    LDA a:CastMagic_YPos_Full
    CLC
    ADC Temp_00
    STA Maybe_Arg_CurrentSprite_PosY
    TXA
    PHA
    LDA #$c474,X
    JSR CastMagic_SetAppearance
    PLA
    TAX
    DEX
    BPL @LAB_PRG15_MIRROR__c432
    RTS

MAGICHITHANDLER_c42c_ARRAY1:                ; [$c46c]
    db $ff                                  ; [0]:
    db $00                                  ; [1]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
MAGICHITHANDLER_c42c_ARRAY1_2_:             ; [$c46e]
    db $ff                                  ; [2]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
MAGICHITHANDLER_c42c_ARRAY1_3_:             ; [$c46f]
    db $00                                  ; [3]:
    db $ff                                  ; [0]:
    db $ff                                  ; [1]:
    db $00                                  ; [2]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
BYTE_ARRAY_PRG15_MIRROR__c470_3_:           ; [$c473]
    db $00                                  ; [3]:
    db $00                                  ; [0]:
    db $02                                  ; [1]:
    db $01                                  ; [2]:

;
; XREFS:
;     CastMagic_FinishHandler_TilteAfterFirstHit
;
BYTE_ARRAY_PRG15_MIRROR__c474_3_:           ; [$c477]
    db $03                                  ; [3]:


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
    BNE @_return


    ;
    ; Check if the Down button has been pressed. If not, return.
    ;
    LDA Joy1_ButtonMask                     ; Load the button mask.
    AND #$04                                ; Check if the Down button is
                                            ; pressed.
    BEQ @_return                            ; If not, return.


    ;
    ; Check if the B button has been pressed. If not, return.
    ;
    LDA a:Joy1_ChangedButtonMask            ; Load the changed button mask.
    AND #$40                                ; Check if the B button is
                                            ; pressed.
    BEQ @_return                            ; If not, return.


    ;
    ; Down-B was pressed. The item can be used, if a valid one is
    ; selected. Figure out if there's a valid one first...
    ;
    LDA a:SelectedItem                      ; Load the selected item.
    ASL A                                   ; Multiply by 2 to get a word
                                            ; boundary for address lookup.
    TAY                                     ; Y = A
    CPY #$22                                ; Is it a valid item?
    BCS @_return                            ; If not, return.


    ;
    ; Look up this item in the jump table and run it.
    ;
    LDA #$c49e,Y                            ; Load the lower byte of the item
                                            ; handler address.
    PHA                                     ; Push it.
    LDA #$c49d,Y                            ; Load the upper byte.
    PHA                                     ; Push it.

  @_return:                                 ; [$c49c]
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
    dw $c49b                                ; [0]: Ring of Elf
    dw $c49b                                ; [1]: Ring of Ruby
    dw $c49b                                ; [2]: Ring of Dworf
    dw $c49b                                ; [3]: Demon's Ring
    dw $c49b                                ; [4]: "A" Key
    dw $c49b                                ; [5]: "K" Key
    dw $c49b                                ; [6]: "Q" Key
    dw $c49b                                ; [7]: "J" Key
    dw $c49b                                ; [8]: "Jo" Key
    dw Player_UseMattock-1                  ; [9]: Mattock
    dw $c49b                                ; [10]: Magical Rod
    dw $c49b                                ; [11]: Crystal
    dw $c49b                                ; [12]: Lamp
    dw Player_UseHourGlass-1                ; [13]: Hour Glass
    dw $c49b                                ; [14]: Book
    dw Player_UseWingBoots-1                ; [15]: Wing Boots
    dw Player_UseRedPotion-1                ; [16]: Red Potion


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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    ; Wait a short period of time before filling up the
    ; next units of HP, to help animate the bar.
    ;
    JSR WaitForNextFrame                    ; Wait a bit.
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
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
    ; Wait a short period of time before filling up the
    ; next units of MP, to help animate the bar.
    ;
    JSR WaitForNextFrame                    ; Wait a bit.
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
    JSR WaitForNextFrame
    JSR Sprites_FlipRanges
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    ; Wait a bit before filling the next 2HP.
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    LDA #$c599,X                            ; Look up in the duration table.
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
    db $28                                  ; [0]: 40 seconds: Novice,
                                            ; Aspirant, Battler, Fighter
    db $1e                                  ; [1]: 30 seconds: Adept,
                                            ; Chevalier, Veteran, Warrior
    db $14                                  ; [2]: 20 seconds: Swordman,
                                            ; Hero, Soldier, Myrmidon
    db $0a                                  ; [3]: 10 seconds: Champion,
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
;     CurrentMusic:
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    STA CurrentMusic                        ; And play it.
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
;     CurrentMusic:
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
                                            ; IScripts_Begin


    ;
    ; Load the area's default music.
    ;
  @_afterFarJump:                           ; [$c603]
    LDA a:Areas_DefaultMusic                ; Load the music for the area.
    STA CurrentMusic                        ; Store it.

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
;     #$ed:
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
    STA a:Temp_Int24.M                      ; Store it as an argument.
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
    ADC #$c68d,Y                            ; Add the block distance for the
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
    CMP #$c68f,Y                            ; Is this block already cleared
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    LDA #$c68f,Y                            ; Load the block for this
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
    db $ff                                  ; [0]:

;
; XREFS:
;     Player_UseMattock
;
USE_MATTOCK_BLOCK_DISTANCES_1_:             ; [$c68e]
    db $10                                  ; [1]:


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
    db $00                                  ; [0]: Eolis
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $63                                  ; [4]: Apolune
    db $85                                  ; [5]:
    db $86                                  ; [6]:
    db $42                                  ; [7]:
    db $00                                  ; [8]: Forepaw
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $00                                  ; [11]:
    db $00                                  ; [12]: Mascon
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:
    db $00                                  ; [16]: Victim
    db $00                                  ; [17]:
    db $00                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]: Conflate
    db $00                                  ; [21]:
    db $00                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [24]: Daybreak
    db $00                                  ; [25]:
    db $00                                  ; [26]:
    db $00                                  ; [27]:
    db $00                                  ; [28]: Evil Fortress
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:


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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
;     Player_PickUpGlove
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
;     #$e9:
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
    STA a:PPU_TargetAddr.U                  ; Set as upper byte.
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
    LDA a:PPU_TargetAddr.U                  ; Load the upper byte.
    ADC #$00                                ; Add the carry flag, if any.
    STA a:PPU_TargetAddr.U                  ; And save it.
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
    STA #$0300,X                            ; Clear memory at $0300 + X
    STA #$0400,X                            ; Clear memory at $0400 + X
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
    JSR #$8009                              ; Run audio interrupt handlers.
    JSR #$8003                              ; Run sound playback interrupt
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
; Game_EnableInterruptHandlers and
; Game_NeedOAMReset.
;
; Even if main input handlers are disabled, this will
; generally write to the PPU and play audio (so music
; doesn't skip).
;
; INPUTS:
;     Game_EnableInterruptHandlers:
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
;     Audio_HandleOnInterrupt
;     Input_HandleOnInterrupt
;     PPU_HandleOnInterrupt
;     Sound_HandleOnInterrupt
;============================================================================
OnInterrupt:                                ; [$c999]
    ;
    ; Push all registers to the stack.
    ;
    PHA
    TXA
    PHA
    TYA
    PHA


    ;
    ; Check what will be handled this interrupt.
    ;
    LDA Game_EnableInterruptHandlers        ; Check whether interrupt
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
    JSR #$8009                              ; Run audio interrupt handling
                                            ; code.
    JSR #$8003                              ; Run sound playback interrupt
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
; TODO: Document PPU_HandleOnInterrupt
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
PPU_HandleOnInterrupt:                      ; [$c9d6]
    JSR Screen_RunWriteScrollDataHandler
    JSR PPUBuffer_Draw
    LDA ScreenColorMode
    STA a:PPUMASK
    LDA Sprites_Sprite0Mode
    BMI @LAB_PRG15_MIRROR__ca11
    LDA PPU_ForceLowerPatternTables
    BEQ @_clearNametable2400


    ;
    ; Clear the following flags:
    ;
    ; * Nametable 2400
    ; * Sprite pattern 1000
    ; * BGTable Addr 1000
    ;
    LDA SavedPPUCtrl
    AND #$e6
    STA a:PPUCTRL
    JMP @_resetScroll


    ;
    ; Clear the Nametable 2400 flag.
    ;
  @_clearNametable2400:                     ; [$c9f3]
    LDA SavedPPUCtrl
    AND #$fe
    STA a:PPUCTRL

  @_resetScroll:                            ; [$c9fa]
    LDA #$00
    STA a:PPUSCROLL
    STA a:PPUSCROLL

  @_waitSprite0NotHitLoop:                  ; [$ca02]
    BIT a:PPUSTATUS
    BVS @_waitSprite0NotHitLoop

  @_waitSprite0Hit:                         ; [$ca07]
    BIT a:PPUSTATUS
    BVC @_waitSprite0Hit
    LDX #$a0

  @_loop160Times:                           ; [$ca0e]
    DEX
    BNE @_loop160Times

  @LAB_PRG15_MIRROR__ca11:                  ; [$ca11]
    LDA PPU_ScrollScreen
    AND #$01
    ORA SavedPPUCtrl
    STA a:PPUCTRL
    LDA PPU_ScrollX
    STA a:PPUSCROLL
    LDA #$00
    STA a:PPUSCROLL
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
;     FUN_PRG15_MIRROR__dacd
;     GameLoop_CheckPauseGame
;     Game_MainLoop
;     Game_SetupAndLoadArea
;     Game_ShowStartScreen
;     Game_Start
;     Maybe_Game_EnterBuildingHandler
;     Maybe_Game_EnterScreenHandler
;     Maybe_Game_ExitBuildingHandler
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
    STA a:JOY1
    LDA #$00
    STA a:JOY1
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
;     SpriteAction_RandomlyFlipXDirection
;     SpriteAction_RandomlyFlipYDirection
;============================================================================
GetRandom:                                  ; [$ca6e]
    LDX Random_Offset                       ; Load the current offset into
                                            ; the bank.
    LDA ROMBankStart,X                      ; Load the byte value at that
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
;     None
;
;
; XREFS:
;     Game_Init
;============================================================================
Game_InitScreenAndMusic:                    ; [$ca78]
    LDA #$10
    STA SavedPPUCtrl
    LDA #$00
    STA PPU_ScrollX
    STA PPU_ScrollScreen
    STA PPU_ScrollY
    LDA #$1e
    STA ScreenColorMode
    JSR Sprites_ResetWithNoSprite0
    JSR PPU_InitAttributeAndNameTables
    LDA #$00
    STA Game_EnableInterruptHandlers
    STA a:Maybe_Game_Ready
    LDA a:CurrentROMBank


    ;
    ; Switch to bank 5 and set up sound.
    ;
    PHA
    LDX #$05
    JSR MMC1_UpdateROMBank
    JSR EOLIS_BLOCKS
    JSR ROMBankStart
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    LDA #$00
    STA Game_InterruptsHandledLatch
    STA a:PauseFlag
    STA PPU_ForceLowerPatternTables
    JMP PPU_InitVBlank


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
    STA Temp_PPU_NametableValue


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
    LDA Temp_PPU_NametableValue
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
;     FUN_PRG15_MIRROR__dacd
;     Game_InitStateForSpawn
;     Game_MainLoop
;     Game_SetupAndLoadArea
;     Game_Start
;     Maybe_Game_EnterBuildingHandler
;     Maybe_Game_EnterScreenHandler
;     Maybe_Game_ExitBuildingHandler
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
    STA Game_EnableInterruptHandlers        ; Disable processing of
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
; TODO: Document Game_DrawAndEnableInterrupts
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__dacd
;     Game_MainLoop
;     Game_SetupAndLoadArea
;     Game_Start
;     Maybe_Game_EnterBuildingHandler
;     Maybe_Game_EnterScreenHandler
;     Maybe_Game_ExitBuildingHandler
;============================================================================
Game_DrawAndEnableInterrupts:               ; [$cb17]
    JSR Sprites_ResetForGameScreen          ; Set up the draw state.
    LDA #$01
    STA Game_EnableInterruptHandlers        ; Enable interrupt handlers.
    RTS


;============================================================================
; MAYBE DEADCODE
;============================================================================
UNUSED_FUN_PRG15_MIRROR__cb1f:              ; [$cb1f]
    JSR UNUSED_Sprites_ResetForDefaultsMode1
    LDA #$01
    STA Game_EnableInterruptHandlers
    RTS

;============================================================================
; TODO: Document SplashAnimation_Something_cb27
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     StartScreen_Draw
;============================================================================
SplashAnimation_Something_cb27:             ; [$cb27]
    JSR Sprites_ResetWithNoSprite0
    LDA #$01
    STA Game_EnableInterruptHandlers
    RTS


;============================================================================
; Initialize VBlank for the PPU.
;
; INPUTS:
;     SavedPPUCtrl:
;         The current PPU control flags.
;
; OUTPUTS:
;     SavedPPUCtrl:
;         The updated PPU control flags.
;
; XREFS:
;     Game_InitScreenAndMusic
;============================================================================
PPU_InitVBlank:                             ; [$cb2f]
    ;
    ; Enable VBlank NMI.
    ;
    LDA SavedPPUCtrl                        ; Load the PPU control flags.
    ORA #$80                                ; Enable the VBlank bit.
    BNE @_savePPUCtrl                       ; If SavedPPUCtrl was zero, undo
                                            ; this  ??


    ;
    ; Disable VBlank NMI.
    ;
    LDA SavedPPUCtrl
    AND #$7f


    ;
    ; Write our copy of the bitmask and set on the PPU.
    ;
  @_savePPUCtrl:                            ; [$cb39]
    STA SavedPPUCtrl
    STA a:PPUCTRL
    RTS


;============================================================================
; MAYBE DEADCODE
;
; XREFS:
;     UNUSED_FUN_PRG15_MIRROR__cb1f
;============================================================================
UNUSED_Sprites_ResetForDefaultsMode1:       ; [$cb3f]
    LDA #$01
    STA Sprites_Sprite0Mode
    STA PPU_ForceLowerPatternTables
    BNE Sprites_Reset

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document Sprites_ResetForGameScreen
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;     PlayerMenu_HandleInventoryMenuInput
;     PlayerMenu_Show
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     EndGame_Begin
;     EndGame_MainLoop
;     Game_DrawAndEnableInterrupts
;     Game_MainLoop
;     Game_WaitForOAMReset
;     Player_HandleDeath
;============================================================================
Sprites_ResetForGameScreen:                 ; [$cb47]
    LDA #$00
    STA Sprites_Sprite0Mode
    STA PPU_ForceLowerPatternTables
    BEQ Sprites_Reset

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document Sprites_ResetWithNoSprite0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;     PasswordScreen_WaitForInput
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     Game_InitScreenAndMusic
;     Game_ShowStartScreen
;     SplashAnimation_Something_cb27
;============================================================================
Sprites_ResetWithNoSprite0:                 ; [$cb4f]
    LDA #$ff                                ; A = 0xFF
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
;     Sprites_ResetForGameScreen
;     UNUSED_Sprites_ResetForDefaultsMode1
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
    LDA #$cb96,Y                            ; Load the Y for the sprite.
    STA a:SPRITE_0_RANGE_1_START            ; Store for sprite 0's Y.
    LDA #$7f                                ; 0x7F == tile ID
    STA a:SPRITE0_TILE                      ; Store for sprite 0's tile ID.
    LDA #$23                                ; 0x23 == Palette index 3, behind
                                            ; background
    STA a:SPRITE0_ATTRS                     ; Store for sprite 0's
                                            ; attributes.
    LDA #$cb98,Y                            ; Load the X for the sprite.
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
    db $17                                  ; [0]:
                                            ; SPRITE_0_RANGE_1_START
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0
    db $48                                  ; [1]:
                                            ; SPRITE_0_RANGE_1_START
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0xFF
    db $08                                  ; [2]:
                                            ; SPRITE0_X
                                            ; when
                                            ; Sprites_Sprite0Mode
                                            ; == 0
    db $00                                  ; [3]:
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
;     Sprites_ResetForGameScreen
;
; XREFS:
;     IScripts_ClearPortraitImage
;     IScripts_ShowPortraitImage
;============================================================================
Game_WaitForOAMReset:                       ; [$cb9a]
    JSR Sprites_ResetForGameScreen
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
    STA a:#$ffff
    LDA #$0e                                ; Horizontal Mirroring Regular
                                            ; Mirroring Swap ROM bank at
                                            ; 0x8000 Swap 8K of VROM at PPU
                                            ; 0x0000 Don't reset
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff                            ; VROM_SIZE_SELECT
    LDA #$00                                ; Select VROM bank at 0x0000
                                            ; Switch 4KB only Don't reset
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff                            ; VROM_PAGE_SELECT_1
    LDA #$00                                ; Select VROM bank at 0x1000
                                            ; Switch 4KB only Don't reset
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
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
;     Area_ScrollToNextRoom
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
MMC1_SavePRGBankAndUpdateTo:                ; [$cc15]
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
;     Area_LoadTiles
;     Area_ScrollToNextRoom
;     Area_SetBlocks
;     Area_SetStateFromDoorDestination
;     EndGame_MainLoop
;     FUN_PRG15_MIRROR__f2e3
;     GameLoop_LoadSpriteInfo
;     Game_DrawScreenInFrozenState
;     Game_InitMMCAndBank
;     Game_InitScreenAndMusic
;     Game_LoadAreaTable
;     Game_MainLoop
;     IScripts_Maybe_DrawSpriteToPPU
;     LookupSpriteDataPointer
;     MMC1_LoadBankAndJump
;     MMC1_RestorePrevPRGBank
;     MMC1_UpdatePRGBankToStackA
;     Messages_Load
;     PPU_LoadGlyphsForStrings
;     PPU_WriteTilesFromCHRRAM
;     Player_DrawArmorTile
;     Player_DrawShieldTile
;     Player_DrawWeaponTile
;     Player_HandleDeath
;     Player_LoadArmorSpriteTilesAddr
;     Player_LoadShieldSpriteTileAddrs
;     Player_LoadWeaponSpriteTileAddrs
;     Screen_HandleScrollDown
;     Screen_HandleScrollLeft
;     Screen_HandleScrollRight
;     Screen_HandleScrollUp
;     Screen_LoadBackgroundPalette
;     Screen_LoadPalette
;     Screen_SetFadeOutPalette
;     Sprite_Draw_Finish
;     Sprite_SetAppearanceAddrFromOffset
;     Sprite_SetPlayerAppearanceAddr
;     Sprite_SetPortraitAppearanceAddr
;     Sprites_LoadCommon
;     Sprites_LoadSpriteValue
;     TextBox_GetBackingAttributeData
;     TextBox_LoadAndShowMessage
;     TextBox_LoadItemSourceTiles
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowNextChar
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
    STA a:#$ffff
    LSR A
    STA a:#$ffff
    LSR A
    STA a:#$ffff
    LSR A
    STA a:#$ffff
    LSR A
    STA a:#$ffff


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
    STA a:#$ffff                            ; Reset the MMC1
                                            ; shifter/controler.
    LDA #$0e                                ; Horizontal Mirroring Regular
                                            ; Mirroring Swap ROM bank at
                                            ; 0x8000 Swap 8K of VROM at PPU
                                            ; 0x000 Don't reset


    ;
    ; Set the CHR banking mode.
    ;
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff


    ;
    ; Set CHR bank 0 = 0.
    ;
    LDA #$00                                ; Select VROM bank at 0x000
                                            ; Switch 4K only Don't reset
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff


    ;
    ; Set CHR bank 1 = 0.
    ;
    LDA #$00                                ; Select VROM bank at 0x1000
                                            ; Switch 4K only Don't reset
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
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
    STA a:#$ffff
    LDA #$0e                                ; Horizontal Mirroring Regular
                                            ; Mirroring Swap ROM bank at
                                            ; 0x8000 Swap 8K of VROM at PPU
                                            ; 0x000 Don't reset

  @_setMMC1State:                           ; [$cc95]
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff
    LSR A
    STA a:#$9fff


    ;
    ; Set CHR bank 0 = 0
    ;
    LDA #$00
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff
    LSR A
    STA a:#$bfff


    ;
    ; Set CHR bank 1 = 0.
    ;
    LDA #$00
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff
    LSR A
    STA a:#$dfff


    ;
    ; Set the bank.
    ;
  @_fastPath:                               ; [$ccd2]
    TXA
    STA a:#$ffff
    LSR A
    STA a:#$ffff
    LSR A
    STA a:#$ffff
    LSR A
    STA a:#$ffff
    LSR A
    STA a:#$ffff
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
;     Area_ScrollToNextRoom
;     Game_EnterAreaHandler
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
MMC1_RestorePrevPRGBank:                    ; [$cce7]
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
    AND #$cd33,X
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
    db $fe                                  ; [0]:
    db $df                                  ; [1]:
    db $f7                                  ; [2]:
    db $fd                                  ; [3]:
    db $bf                                  ; [4]:
    db $ef                                  ; [5]:
    db $7f                                  ; [6]:
    db $fb                                  ; [7]:


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
; Reset the PPU draw offset.
;
; The row will be set to 9 and the column to 0.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     PPUOffset_Col:
;         The updated column (set to 0).
;
;     PPUOffset_Row:
;         The updated row (set to 9).
;
; XREFS:
;     GameLoop_ClearSprites
;     GameLoop_LoadSpriteImages
;============================================================================
PPU_ResetOffset:                            ; [$cd6f]
    LDA #$09
    STA PPUOffset_Row                       ; Set row to 9.
    LDA #$00
    STA PPUOffset_Col                       ; Set column to 0.
    RTS


;============================================================================
; Look up the offset of the sprite data for a given sprite ID.
;
; This will also load the number of PPU tiles needed to draw the sprite.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     Sprites_LoadImageForCurrentSprite
;============================================================================
LookupSpriteDataPointer:                    ; [$cd78]
    ;
    ; Save the current ROM bank to the stack.
    ;
    LDA a:CurrentROMBank                    ; Load the current bank.
    PHA                                     ; Push to the stack.


    ;
    ; Switch to the bank for the current sprite's images.
    ;
    LDX a:CurrentSprite_ImagesBank          ; Load the bank where the images
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
    LDA a:#$8001                            ; Read byte from $8001.
    CLC
    ADC #$80                                ; Add 0x80.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address.


    ;
    ; Compute the starting index for the sprite based on the
    ; entity ID.
    ;
    ; Entities 0-55 are in the first sprite bank. 56+
    ; are in the second.
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
    STA CurrentSprite_Image_L               ; A = Lower byte of the image
                                            ; data address.
    INY
    LDA (Temp_Addr_L),Y                     ; A = Upper byte of the address.
    CLC
    ADC #$80                                ; Add 0x80 to the upper address.
    STA CurrentSprite_Image_U               ; Upper byte of pointer to the
                                            ; sprite bitmap


    ;
    ; Get the PPU tile numbers for the sprite entity and store
    ; it for lookup.
    ;
    LDA a:CurrentSprite_Entity              ; Load the current sprite ID
    TAY
    LDA #$ce1b,Y                            ; Get the number of tiles needed
    STA CurrentSprite_PPUTileCount          ; Store that for the render


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
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     GameLoop_LoadSpriteImages
;============================================================================
Sprites_LoadImageForCurrentSprite:          ; [$cdb5]
    LDA PPUOffset_Col
    STA Temp_00
    LDA PPUOffset_Row
    ASL Temp_00
    ROL A
    ASL Temp_00
    ROL A
    ASL Temp_00
    ROL A
    ASL Temp_00
    ROL A
    STA PPUOffset_Index
    JSR LookupSpriteDataPointer
    LDA CurrentSprite_PPUTileCount
    BNE @_loadSpriteToPPUBuffer
    RTS


    ;
    ; Transfer all PPU tiles for a sprite to the PPU buffer.
    ;
  @_loadSpriteToPPUBuffer:                  ; [$cdd1]
    LDA a:CurrentROMBank
    PHA
    LDX a:CurrentSprite_ImagesBank
    JSR MMC1_UpdateROMBank
    LDA PPUOffset_Row
    STA PPU_TargetAddr.U
    LDA PPUOffset_Col
    STA PPU_TargetAddr
    LDA #$10
    JSR PPUBuffer_QueueCommandOrLength


    ;
    ; Copy the sprite data for this tile to the PPU buffer.
    ;
    LDY #$00

  @_copySpriteImage:                        ; [$cdea]
    LDA (CurrentSprite_Image_L),Y
    STA PPUBuffer,X
    INX
    INY
    CPY #$10
    BCC @_copySpriteImage
    STX PPUBuffer_WriteOffset
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    LDA CurrentSprite_Image_L
    CLC
    ADC #$10
    STA CurrentSprite_Image_L
    LDA CurrentSprite_Image_U
    ADC #$00
    STA CurrentSprite_Image_U
    LDA PPUOffset_Col
    CLC
    ADC #$10
    STA PPUOffset_Col
    LDA PPUOffset_Row
    ADC #$00
    STA PPUOffset_Row
    DEC CurrentSprite_PPUTileCount
    BNE @_loadSpriteToPPUBuffer
    RTS


;============================================================================
; The number of PPU tiles each sprite needs.
;
; XREFS:
;     LookupSpriteDataPointer
;============================================================================

;
; XREFS:
;     LookupSpriteDataPointer
;
SPRITES_PPU_TILE_COUNTS:                    ; [$ce1b]
    db $01                                  ; [0]:
    db $01                                  ; [1]: Dropped bread
    db $01                                  ; [2]: Dropped coin
    db $01                                  ; [3]: TODO: Garbled 3
    db $10                                  ; [4]: Enemy: Raiden
    db $10                                  ; [5]: Enemy: Necron Aides
    db $10                                  ; [6]: Enemy: Zombie
    db $08                                  ; [7]: Enemy: Hornet
    db $06                                  ; [8]: Enemy: Bihoruda
    db $06                                  ; [9]: Enemy: Lilith
    db $07                                  ; [10]: TODO: Garbled 10
    db $06                                  ; [11]: Enemy: Yuinaru
    db $0c                                  ; [12]: Enemy: Snowman
    db $10                                  ; [13]: Enemy: Nash
    db $10                                  ; [14]: Enemy: Fire Giant
    db $12                                  ; [15]: Enemy: Ishiisu
    db $0d                                  ; [16]: Enemy: Execution Hood
    db $26                                  ; [17]: Boss: Rokusutahn
    db $10                                  ; [18]: Enemy: Unused #18
    db $00                                  ; [19]: Effect: Enemy Death
    db $00                                  ; [20]: Effect: Lightning Ball
    db $16                                  ; [21]: Enemy: Charron
    db $17                                  ; [22]: Enemy: Unused 22
    db $10                                  ; [23]: Enemy: Geributa
    db $0e                                  ; [24]: Enemy: Sugata
    db $12                                  ; [25]: Enemy: Grimlock
    db $0c                                  ; [26]: Enemy: Giant Bees
    db $0e                                  ; [27]: Enemy: Myconid
    db $10                                  ; [28]: Enemy: Naga
    db $10                                  ; [29]: Enemy: Unused #29
    db $12                                  ; [30]: Enemy: Giant Strider
    db $12                                  ; [31]: Enemy: Sir Gawaine
    db $1f                                  ; [32]: Enemy: Maskman
    db $16                                  ; [33]: Enemy: Wolfman
    db $0f                                  ; [34]: Enemy: Yareeka
    db $10                                  ; [35]: Enemy: Magman
    db $13                                  ; [36]: Enemy: Unused #36
    db $10                                  ; [37]: Enemy: Unused #37
    db $11                                  ; [38]: Enemy: Ikeda
    db $10                                  ; [39]: Enemy: Unused #39
    db $10                                  ; [40]: Enemy: Lamprey
    db $10                                  ; [41]: Enemy: Unused #41
    db $13                                  ; [42]: Enemy: Monodron
    db $0c                                  ; [43]: Unused #43
    db $12                                  ; [44]: Enemy: Tamazutsu
    db $3e                                  ; [45]: Boss: Ripasheiku
    db $33                                  ; [46]: Boss: Zoradohna
    db $1c                                  ; [47]: Boss: Borabohra
    db $0e                                  ; [48]: Boss: Pakukame
    db $25                                  ; [49]: Boss: Zorugeriru
    db $54                                  ; [50]: Boss: King Grieve
    db $69                                  ; [51]: Boss: Shadow Eura
    db $10                                  ; [52]: NPC: Walking man 1
    db $10                                  ; [53]: NPC: Unused Blue Lady
    db $09                                  ; [54]: NPC: Unused Child
    db $08                                  ; [55]: NPC: Armor Salesman
    db $0b                                  ; [56]: NPC: Martial Arts
    db $0b                                  ; [57]: NPC: Priest
    db $14                                  ; [58]: NPC: King
    db $0c                                  ; [59]: NPC: Magic Teacher
    db $08                                  ; [60]: NPC: Key Salesman
    db $0a                                  ; [61]: NPC: Smoking Man
    db $0e                                  ; [62]: NPC: Man in Chair
    db $0a                                  ; [63]: NPC: Sitting Man 1
    db $0d                                  ; [64]: NPC: Meat Salesman
    db $10                                  ; [65]: NPC: Lady in blue dress
                                            ; with cup
    db $10                                  ; [66]: NPC: King's Guard
    db $0b                                  ; [67]: NPC: Doctor
    db $0e                                  ; [68]: NPC: Walking Woman 1
    db $0d                                  ; [69]: NPC: Walking Woman 2
    db $09                                  ; [70]: Enemy: Unused eyeball
    db $08                                  ; [71]: Enemy: Zozura
    db $02                                  ; [72]: Item: Glove
    db $02                                  ; [73]: Item: Black Onyx
    db $04                                  ; [74]: Item: Pendant
    db $02                                  ; [75]: Item: Red Potion
    db $02                                  ; [76]: Item: Poison
    db $04                                  ; [77]: Item: Elixir
    db $02                                  ; [78]: Item: Ointment
    db $00                                  ; [79]: Item: Intro trigger start
                                            ; point
    db $02                                  ; [80]: Item: Mattock
    db $00                                  ; [81]: TODO: Garbled #81
    db $0c                                  ; [82]: Deco: Fountain
    db $00                                  ; [83]: TODO: Unknown #83
    db $00                                  ; [84]: TODO: Unknown #84
    db $04                                  ; [85]: Item: Wing Boots
    db $02                                  ; [86]: Item: Hour Glass
    db $04                                  ; [87]: Item: Magical Rod
    db $02                                  ; [88]: Item: Battle Suit
    db $04                                  ; [89]: Item: Battle Helmet
    db $04                                  ; [90]: Item: Dragon Slayer
    db $02                                  ; [91]: Item: Mattock #2
    db $04                                  ; [92]: Item: Wing Boots (for
                                            ; quest)
    db $02                                  ; [93]: Item: Red Potion #2
    db $02                                  ; [94]: Item: Poison #2
    db $02                                  ; [95]: Item: Glove #2
    db $02                                  ; [96]: Item: Ointment #2
    db $0c                                  ; [97]:
    db $0c                                  ; [98]:
    db $0c                                  ; [99]:
    db $00                                  ; [100]: Effect: Boss Death


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
    LDA a:#$8008                            ; Load the lower byte of the
                                            ; address of the first sprite (a
                                            ; coin).
    STA Temp_Addr_L                         ; Store it.
    LDA a:#$8009                            ; Load the upper byte.
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
    LDA #$cf07,Y                            ; Read the low byte from the
                                            ; table
    STA Area_TilesReadAddress               ; Save low byte to TilesAddress
    LDA #$cf08,Y                            ; Read the high byte from the
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
    LDA #$cf19,Y                            ; Convert to a PPU address via
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
    LDA #$cf22,Y                            ; Load the number of pages to
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
    dw $8000                                ; [0]: First town
    dw $9800                                ; [1]: Tree world
    dw $8800                                ; [2]: Between first town and Fog
    dw $9000                                ; [3]: Fog
    dw $b800                                ; [4]: Last World, Final Maze
    dw $a000                                ; [5]: Town
    dw $a800                                ; [6]: Building
    dw $ae00                                ; [7]: ?
    dw $b400                                ; [8]: ?


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
    db $18                                  ; [0]: 0x1800 - First Town
    db $18                                  ; [1]: 0x1800 - Tree World
    db $18                                  ; [2]: 0x1800 - Between first
                                            ; town and fog
    db $18                                  ; [3]: 0x1800 - Fog
    db $18                                  ; [4]: 0x1800 - Last world, final
                                            ; maze
    db $18                                  ; [5]: 0x1800 - Town
    db $1a                                  ; [6]: 0x1A00 - Building
    db $1a                                  ; [7]: 0x1A00 - ?
    db $1a                                  ; [8]: 0x1A00 - ?


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
    db $08                                  ; [0]: First town
    db $08                                  ; [1]: Tree world
    db $08                                  ; [2]: Between first town and fog
    db $08                                  ; [3]: Fog
    db $08                                  ; [4]: Last world, final maze
    db $08                                  ; [5]: Town
    db $06                                  ; [6]: Building
    db $06                                  ; [7]: ?
    db $04                                  ; [8]: ?


;============================================================================
; Set the VRAM address increment per CPU read/write of PPUDATA to 0: Add 1,
; going across.
;
; INPUTS:
;     SavedPPUCtrl:
;         The saved PPU control flags.
;
; OUTPUTS:
;     PPUCTRL:
;     SavedPPUCtrl:
;         The updated PPU control flags.
;
; XREFS:
;     Area_LoadTiles
;============================================================================
PPU_SetVRAMIncrementAdd1Across:             ; [$cf2b]
    LDA SavedPPUCtrl                        ; Load the PPU control flags.
    AND #$fb                                ; Set VRAM address increment per
                                            ; CPU read/write of PPUDATA to 0:
                                            ; Add 1, going across.
    STA SavedPPUCtrl                        ; Set it to SavedPPUCtrl.
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
    LDA #$cfbd,Y                            ; High byte of the command
                                            ; address.
    PHA                                     ; Push to the stack.
    LDA #$cfbc,Y                            ; Low byte of the command
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
    LDA SavedPPUCtrl                        ; A = PPU control flags.
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
    dw PPUBuffer_DrawCommand_WritePalette-1 ; [0]: Command 0x00: Write
                                            ; Palette to PPU
    dw PPUBuffer_DrawCommand_Noop-1         ; [1]: Command 0xFF
    dw PPUBuffer_DrawCommand_Noop-1         ; [2]: Command 0xFE
    dw PPUBuffer_DrawCommand_Noop-1         ; [3]: Command 0xFD
    dw PPUBuffer_DrawCommand_RotateTilesRight1Pixel-1 ; [4]: Command 0xFC:
                                                      ; Rotate Tiles Right
    dw PPUBuffer_DrawCommand_Noop-1         ; [5]: Command 0xFB
    dw PPUBuffer_DrawCommand_RemoveVerticalLines-1 ; [6]: Command 0xFA:
                                                   ; Remove Vertical Lines


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
    db $09,$80                              ; [$cfda] word


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
;     IScripts_Maybe_DrawSpriteToPPU
;     PPUBuffer_WriteValueMany
;     Player_DrawWeaponTile
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;     TextBox_LoadItemSourceTiles
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_QueuePPUBufferTextBoxLength
;     UI_ClearSelectedItemPic
;     UI_DrawDigitsZeroPadded
;     UI_DrawManaOrHPBar
;     UNUSED_FUN_PRG15_MIRROR__c033
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
    LDA PPU_TargetAddr.U                    ; Load the upper address byte.
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
    JSR Screen_LoadBackgroundPalette
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
    LDA a:Screen_Paletteindex
    JSR Screen_LoadBackgroundPalette
    JMP PPUBuffer_WritePalette


;============================================================================
; Draw Command 0x00: Write the screen palette.
;
; This flushes Screen_PaletteData to the PPU,
; writing both the background and sprite palette.
;
; INPUTS:
;     Screen_PaletteData:
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
    LDA Screen_PaletteData,X                ; A = Palette byte at the index.
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
; Populate the background palette data for the screen.
;
; This will load the background data for sprites from the
; data stored in bank 11 at the address stored in
; Temp_08 and populate
; Screen_PaletteData.
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
;     Screen_PaletteData:
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
Screen_LoadBackgroundPalette:               ; [$d03b]
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
    LDA #$81f0,Y                            ; Load the HUD attribute data for
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
    LDY #$0f                                ; Set the destination palette
                                            ; index to 16.
    BNE Screen_LoadPalette

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Populate the sprite palette data for the screen.
;
; This will load the palette data for sprites from the
; data stored in bank 11 at the address stored in
; Temp_08 and populate
; Screen_PaletteData.
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
;     Screen_PaletteData:
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
;     IScripts_ShowPortraitImage
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
; populate Screen_PaletteData.
;
; This is common to both
; Screen_LoadBackgroundPalette
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
;     Screen_PaletteData:
;         The resulting palette data.
;
; CALLS:
;     MMC1_UpdateROMBank
;
; XREFS:
;     Screen_LoadBackgroundPalette
;============================================================================
Screen_LoadPalette:                         ; [$d074]
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
    STA Screen_PaletteData,X                ; Store as the palette data at
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
;     Screen_PaletteData:
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
;     IScripts_ShowPortraitImage
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
;     Screen_LoadBackgroundPalette
;     Screen_LoadSpritePalette
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
;     Screen_PaletteData[i] =
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
;     Screen_PaletteData:
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
    SBC #$d0e0,X                            ; Subtract the value form the
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
    STA Screen_PaletteData,Y                ; Set the palette data to A at
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
    db $10                                  ; [0]:
    db $20                                  ; [1]:
    db $30                                  ; [2]:
    db $40                                  ; [3]:


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
;     PlaySoundInner
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
;     FUN_PRG14__87cb
;     Player_CastMagic
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
    JSR PlaySoundInner                      ; Play the sound.


    ;
    ; Pop X and Y from the stack and restore.
    ;
    PLA                                     ; Pop A into Y.
    TAY
    PLA                                     ; Pop A into X.
    TAX
    RTS

;============================================================================
; TODO: Document Area_Maybe_ShowRoomTransition
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
Area_Maybe_ShowRoomTransition:              ; [$d0f6]
    LDA #$00
    STA Screen_Maybe_ScrollHorizDirection
    STA MaybeUnused_006d
    STA Screen_Maybe_ScrollHorizDirection
    LDA #$00
    STA PPU_ScrollY
    STA PPU_ScrollX
    STA PPU_ScrollScreen
    STA SomethingScroll_0077
    STA Screen_ScrollVertBlocksLoaded
    STA Screen_ScrollHorizBlocksLoaded
    STA Screen_MaybeUnused_0075
    STA Screen_ScrollHorizAttrsLoaded
    LDX #$00
    STX PPU_ScrollX
    INX
    STX PPU_ScrollScreen
    LDX #$01
    JSR Area_ScrollToNextRoom

  @LAB_PRG15_MIRROR__d11c:                  ; [$d11c]
    JSR Screen_HandleScroll
    JSR Screen_RunWriteScrollDataHandler
    LDA Screen_ScrollDirection
    BPL @LAB_PRG15_MIRROR__d11c
    RTS

;============================================================================
; TODO: Document Area_ScrollToNextRoom
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_BeginScrollToNextRoom
;     Area_Maybe_ShowRoomTransition
;============================================================================
Area_ScrollToNextRoom:                      ; [$d127]
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
    JSR MMC1_SavePRGBankAndUpdateTo


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
    LDA #$05d0,X
    STA #$0316,X
    INX                                     ; X++
    BNE @_copyRowScreenBelowLoop


    ;
    ; Load blocks from the screen below.
    ;
    LDA Area_ScreenBelow
    JSR Area_LoadBlocks                     ; Load blocks from screen below.
    LDX #$f0

  @LAB_PRG15_MIRROR__d1b0:                  ; [$d1b0]
    LDA #$0510,X
    STA #$0326,X
    INX
    BNE @LAB_PRG15_MIRROR__d1b0


    ;
    ; Load blocks for the current screen.
    ;
    LDA Area_CurrentScreen
    JSR Area_LoadBlocks
    JSR MMC1_RestorePrevPRGBank
    LDA Screen_ScrollDirection
    CMP #$02
    BCS @_VerticalScroll
    TAX
    LDA #$00
    STA Screen_ScrollPlayerTransitionCounter
    LDA Player_PosY
    STA Maybe_PlayerY_ForScroll
    LDA #$d1e7,X
    STA Maybe_PlayerX_ForScroll
    RTS

  @_VerticalScroll:                         ; [$d1d6]
    AND #$01
    TAX
    LDA Player_PosX_Block
    STA Maybe_PlayerX_ForScroll
    LDA #$00
    STA Screen_ScrollPlayerTransitionCounter
    LDA #$d1e9,X
    STA Maybe_PlayerY_ForScroll
    RTS

;
; XREFS:
;     Area_ScrollToNextRoom
;
SCREEN_MAYBE_PLAYERX_FOR_SCROLL_MODE:       ; [$d1e7]
    db $00                                  ; [0]:
    db $f0                                  ; [1]:

;
; XREFS:
;     Area_ScrollToNextRoom
;
SCREEN_MAYBE_PLAYERX_FOR_SCROLL_MODE_2_:    ; [$d1e9]
    db $00                                  ; [2]:
    db $d0                                  ; [3]:


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
;     Area_ScrollToNextRoom
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
    ADC #$d273,X                            ; Add that to the value for this
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
;     0x08:
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
    ; working with from RAM as an index into 0x08.
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
    db $ff                                  ; [0]:
    db $f0                                  ; [1]:
    db $ef                                  ; [2]:


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
;     Area_Maybe_ShowRoomTransition
;     Game_MainLoop
;     Screen_UpdateForScroll
;============================================================================
Screen_HandleScroll:                        ; [$d2e7]
    LDX Screen_ScrollDirection
    BEQ Screen_HandleScrollLeft
    DEX
    BEQ Screen_HandleScrollRight
    DEX
    BEQ Screen_HandleScrollUp
    DEX
    BNE RETURN_D2E6

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
    LDA Screen_ScrollHorizLoadCounter
    CMP #$fc
    BCS @LAB_PRG15_MIRROR__d364
    LDA PPU_ScrollX
    SEC
    SBC #$01
    STA PPU_ScrollX
    PHP
    LDA PPU_ScrollScreen
    SBC #$00
    STA PPU_ScrollScreen
    PLP
    BNE @LAB_PRG15_MIRROR__d364
    JSR Screen_StopScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d364:                  ; [$d364]
    LDA Screen_ScrollHorizLoadCounter
    SEC
    SBC #$01
    STA Screen_ScrollHorizLoadCounter
    LDA PPU_ScrollScreenHoriz
    SBC #$00
    STA PPU_ScrollScreenHoriz
    CMP PPU_ScrollScreen
    BNE @LAB_PRG15_MIRROR__d37c
    LDA PPU_ScrollX
    CMP #$04
    BCS @LAB_PRG15_MIRROR__d37c
    RTS

  @LAB_PRG15_MIRROR__d37c:                  ; [$d37c]
    LDA a:CurrentROMBank
    PHA
    LDX #$03
    JSR MMC1_UpdateROMBank
    JSR Screen_LoadDataLeft
    PLA
    TAX
    JSR MMC1_UpdateROMBank
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
    ADC #$d4cb,X
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
    STA UI_Menu_IDs,X
    LDA CurrentArea_BlockData2CurAddr,Y
    STA #$0221,X
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
    STA Screen_ScrollVertBlocksLoaded
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
    STA #$0192,Y
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
    AND #$d4d3,Y
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
    LDA #$d4cf,X
    STA Temp_08
    LDA #$d4d1,X
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
    db $00                                  ; [0]:

;
; XREFS:
;     Screen_LoadBlockDataVert
;
BYTE_ARRAY_PRG15_MIRROR__d4cb_1_:           ; [$d4cc]
    db $00                                  ; [1]:
    db $00,$08                              ; [$d4cd] byte

  @_SET_BLOCKS_TILEMAP_OFFSETS_L:           ; [$d4cf]
    db $42                                  ; [0]:
    db $42                                  ; [1]:

  @_SET_BLOCKS_TILEMAP_OFFSETS_U:           ; [$d4d1]
    db $02                                  ; [0]:
    db $02                                  ; [1]:


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
    db $03                                  ; [0]: Mask bits 0 and 1
    db $0c                                  ; [1]: Mask bits 2 and 3
    db $30                                  ; [2]: Mask bits 4 and 5
    db $c0                                  ; [3]: Mask bits 6 and 7


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
    ADC #$d619,X
    STA Temp_00
    LDA PPU_ScrollScreenHoriz
    ADC #$d61b,X
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
    LDX #$00                                ; X = 0 (counter)


    ;
    ; Determine the offset for the blocks to load.
    ;
  @_loadBlocksLoop:                         ; [$d52c]
    LDY Screen_ScrollHorizLoadOffset
    LDA (Temp_08),Y


    ;
    ; Load the blocks information.
    ;
    TAY
    LDA (CurrentArea_BlockData1StartAddr),Y
    STA CurrentArea_BlockData1CurAddr
    LDA (CurrentArea_BlockData3StartAddr),Y
    STA CurrentArea_BlockData2CurAddr
    LDA (CurrentArea_BlockData2StartAddr),Y
    STA CurrentArea_BlockData3CurAddr
    LDA (CurrentArea_BlockData4StartAddr),Y
    STA CurrentArea_BlockData4CurAddr


    ;
    ; Convert the block counter to a tile width.
    ;
    LDA Screen_ScrollHorizLoadCounter
    AND #$08
    LSR A
    LSR A
    TAY
    LDA CurrentArea_BlockData1CurAddr,Y
    STA Temp_0200,X
    LDA CurrentArea_BlockData2CurAddr,Y
    STA Temp_0201,X
    LDA Temp_08
    CLC
    ADC #$10
    STA Temp_08
    LDA Temp_09
    ADC #$00
    STA Temp_09
    INX
    INX
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
    AND #$d4d3,Y                            ; AND with the bitmask based on
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
    LDA #$d4cf,X
    STA Temp_08
    LDA #$d4d1,X
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
    db $00                                  ; [0]:
    db $ff                                  ; [1]:

;
; XREFS:
;     Screen_LoadBlocksHoriz
;
BYTE_ARRAY_PRG15_MIRROR__d61b:              ; [$d61b]
    db $00                                  ; [0]:
    db $00                                  ; [1]:

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
;     Area_Maybe_ShowRoomTransition
;     PPU_HandleOnInterrupt
;     Screen_UpdateForScroll
;============================================================================
Screen_RunWriteScrollDataHandler:           ; [$d61d]
    LDA #$03
    STA Temp_06
    LDX SomethingScroll_0077

  @LAB_PRG15_MIRROR__d623:                  ; [$d623]
    LDA Screen_ScrollVertBlocksLoaded,X
    BNE @LAB_PRG15_MIRROR__d631
    INX
    TXA
    AND #$03
    TAX
    DEC Temp_06
    BPL @LAB_PRG15_MIRROR__d623
    RTS

  @LAB_PRG15_MIRROR__d631:                  ; [$d631]
    LDA #$00
    STA Screen_ScrollVertBlocksLoaded,X
    STX Temp_06
    INX
    TXA
    AND #$03
    TAX
    STX SomethingScroll_0077
    LDA Temp_06
    AND #$03
    TAX
    LDA #$d650,X
    PHA
    LDA #$d64c,X
    PHA
    RTS

;
; XREFS:
;     Screen_RunWriteScrollDataHandler
;
SCREEN_WRITESCROLL_HANDLERS_L:              ; [$d64c]
    db $53                                  ; [0]:
    db $72                                  ; [1]:
    db $98                                  ; [2]:
    db $b0                                  ; [3]:

;
; XREFS:
;     Screen_RunWriteScrollDataHandler
;
SCREEN_WRITESCROLL_HANDLERS_U:              ; [$d650]
    db $d6                                  ; [0]:
    db $d6                                  ; [1]:
    db $d6                                  ; [2]:
    db $d6                                  ; [3]:

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
;============================================================================
Screen_WriteScrollVertPPUTileData:          ; [$d654]
    LDA SavedPPUCtrl
    AND #$fb
    STA a:PPUCTRL
    LDA Screen_ScrollVertBlocks_PPUTileMapAddr_U
    STA a:PPUADDR
    LDA Screen_ScrollVertBlocks_PPUTileMapAddr_L
    STA a:PPUADDR
    LDX #$00

  @_loop:                                   ; [$d667]
    LDA UI_Menu_IDs,X
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
;============================================================================
Screen_WriteScrollHorizPPUTileData:         ; [$d673]
    LDA SavedPPUCtrl
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
    LDA SavedPPUCtrl
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
;============================================================================
Screen_WriteScrollHorizPPUAttrData:         ; [$d6b1]
    LDX #$00

  @LAB_PRG15_MIRROR__d6b3:                  ; [$d6b3]
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
    BCC @LAB_PRG15_MIRROR__d6b3
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
;     @_BREAKABLE_FLOOR_TRANSITIONS:
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
    CMP #$d6ef,X                            ; Does the block match the table
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
    LDA #$d6ef,X                            ; Load the block to set to.
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
  @_BREAKABLE_FLOOR_TRANSITIONS:            ; [$d6ef]
    db $34                                  ; [0]:

  @_BREAKABLE_FLOOR_TRANSITIONS_1_:         ; [$d6f0]
    db $2c                                  ; [1]:

  @_BREAKABLE_FLOOR_TRANSITIONS_2_:         ; [$d6f1]
    db $5c                                  ; [2]:
    db $13                                  ; [3]:


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
  @_SET_BLOCKS_SCREEN_TILEMAP_ADDRS_U:      ; [$d6f3]
    db $20                                  ; [0]: Screen 0
    db $24                                  ; [1]: Screen 1


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
    LDA #$d76c,X                            ; A = Block position offset,
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
    db $42                                  ; Air

;
; XREFS:
;     Game_OpenPathToMascon
;
MASCON_FOUNTAIN_BLOCK_2_AIR:                ; [$d769]
    db $42                                  ; Air


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
    db $88                                  ; Stone cover

;
; XREFS:
;     Game_OpenPathToMascon
;
MASCON_FOUNTAIN_BLOCK_2_STONE:              ; [$d76b]
    db $88                                  ; Stone cover


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
    db $01                                  ; [0]: X + 1
    db $ff                                  ; [1]: Y + 1


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
    db $20                                  ; Ladder block

;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d7b0
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG14__9991
;============================================================================
FUN_PRG15_MIRROR__d7b0:                     ; [$d7b0]
    TXA
    PHA
    TYA
    PHA
    LDX a:BYTE_03cf
    LDA a:BYTE_03ce
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
;     FUN_PRG15_MIRROR__d7b0
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_UseMattock
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
    LDA a:PPU_TargetAddr.U
    ADC #$00
    STA a:PPU_TargetAddr.U
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
    AND #$d8a4,X                            ; A = block attributes for the
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
    LDA #$d4cf,X                            ; A = lower byte of PPU address
    STA Temp_Addr_L                         ; Store it.
    LDA #$d4d1,X                            ; A = upper byte of PPU address
    STA Temp_Addr_U                         ; Store it.


    ;
    ; Compute the upper starting byte for the PPU address.
    ;
    LDA #$d6f3,X                            ; A = tilemap address for the
                                            ; screen.
    STA a:PPU_TargetAddr.U                  ; Store as the upper byte of the
                                            ; tilemap address.


    ;
    ; Combine the new data for this corner with the exising
    ; data.
    ;
    LDY a:PPU_TargetAddr                    ; Y = lower byte of tilemap
                                            ; address computed above.
    LDA (Temp_Addr_L),Y                     ; Load the data for this block.
    LDX Temp_06                             ; X = corner value (0..3)
    AND #$d8a8,X                            ; Invert the corner mask (keep
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
    LDA a:PPU_TargetAddr.U                  ; Load the upper byte of the PPU
                                            ; address.
    ORA #$03                                ; Ensure it starts at 0x03
                                            ; (address >= $03XX).
                                            ; Realistically, $23C0 (we
                                            ; guarantee 0x20 or 0x24 above
                                            ; for the screen).
    STA a:PPU_TargetAddr.U                  ; Store as the new upper byte.
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

  @_SET_BLOCKS_TILE_CORNER_MASK:            ; [$d8a4]
    db $03                                  ; [0]:
    db $0c                                  ; [1]:
    db $30                                  ; [2]:
    db $c0                                  ; [3]:

  @_SET_BLOCKS_TILE_CORNER_MASK_INVERT:     ; [$d8a8]
    db $fc                                  ; [0]:
    db $f3                                  ; [1]:
    db $cf                                  ; [2]:
    db $3f                                  ; [3]:
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
    STA a:PPU_TargetAddr.U
    TXA
    AND #$0f
    ASL A
    STA a:PPU_TargetAddr
    TXA
    AND #$f0
    ASL A
    ROL a:PPU_TargetAddr.U
    ASL A
    ROL a:PPU_TargetAddr.U
    CLC
    ADC a:PPU_TargetAddr
    STA a:PPU_TargetAddr
    LDA PPU_ScrollScreen
    AND #$01
    TAY
    LDA a:PPU_TargetAddr.U
    ORA #$d8ea,Y
    STA a:PPU_TargetAddr.U
    LDA a:PPU_TargetAddr
    CLC
    ADC #$80
    STA a:PPU_TargetAddr
    LDA a:PPU_TargetAddr.U
    ADC #$00
    STA a:PPU_TargetAddr.U
    RTS

;
; XREFS:
;     Area_SetPPUAddrForBlockIndex
;
BYTE_ARRAY_PRG15_MIRROR__d8ea:              ; [$d8ea]
    db $20                                  ; [0]:
    db $24                                  ; [1]:


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
;     GameLoop_ClearSprites
;     Screen_LoadBackgroundPalette
;     MMC1_LoadBankAndJump
;     Sprites_ResetForGameScreen
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
    JSR Sprites_ResetForGameScreen          ; Reset animations.
    JSR #$b7bf                              ; Reset selected item state.
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
    JSR GameLoop_ClearSprites               ; Clear sprites from the screen.
    LDA #$00
    STA CurrentMusic                        ; Clear the music.


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
    JSR Sprites_ResetForGameScreen          ; Reset animations.
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
    LDA a:Screen_Paletteindex
    JSR Screen_LoadBackgroundPalette        ; Load the palette.
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
    STA CurrentMusic                        ; Set as the current music.


    ;
    ; Clear the sprite loaded state.
    ;
    LDA #$ff
    STA Maybe_ScreenReadyState              ; Set loaded state to 0xFF.


    ;
    ; Run IScript 0xFF via jump to IScripts_Begin.
    ;
    JSR MMC1_LoadBankAndJump                ; Run the IScript:
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
                                            ; IScripts_Begin

  @_afterIScriptFarJump:                    ; [$d996]
    LDA #$00                                ; 0 = No music
    STA CurrentMusic                        ; Set it.


    ;
    ; Set initial gold and experience via jump
    ; to Player_SetInitialExpAndGold.
    ;
    JSR MMC1_LoadBankAndJump                ; Run:
    db BANK_12_LOGIC                        ; Bank = 12
    dw Player_SetInitialExpAndGold-1        ; Address =
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
;     GameLoop_ClearSprites
;     Sprites_ResetForGameScreen
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
    JSR GameLoop_ClearSprites               ; Clear sprites.


    ;
    ; Wait 120 frames before beginning the fade-out.
    ;
    LDX #$78                                ; X = 120 (loop counter)

  @_beforeFadeLoop:                         ; [$d9b1]
    TXA                                     ; A = X
    PHA                                     ; Push to the stack.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Sprites_ResetForGameScreen          ; Reset for this frame.
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
    JSR Sprites_ResetForGameScreen          ; Reset for this frame.
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
    LDA #$da21,Y                            ; Load the lower address for Y.
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
    db $00                                  ; [0]:
    db $10                                  ; [1]:
    db $20                                  ; [2]:
    db $30                                  ; [3]:
    db $40                                  ; [4]:
    db $50                                  ; [5]:
    db $60                                  ; [6]:
    db $70                                  ; [7]:


;============================================================================
; DEADCODE: Set palette index to 0xFF.
;============================================================================
UNUSED_SetPalette0xFF:                      ; [$da29]
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
;     Screen_Paletteindex:
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
    LDA a:Screen_Paletteindex               ; Load the screen palette index.
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
    JSR #$b7ae                              ; Initialize the player
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
    STA Maybe_ScreenReadyState              ; Mark the screen as loaded and
                                            ; ready.
    JSR Player_SetInitialState              ; Initialize the player's initial
                                            ; state.
    JSR #$ba55                              ; Clear any visible magic on
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
; TODO: Document Maybe_Game_EnterScreenHandler
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
Maybe_Game_EnterScreenHandler:              ; [$daa0]
    JSR PPU_WaitUntilFlushed
    JSR Screen_Load
    JSR Game_DrawAndEnableInterrupts
    JSR WaitForNextFrame
    JMP GameLoop_LoadSpriteImages

;============================================================================
; TODO: Document Maybe_Game_EnterBuildingHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     EndGame_MoveToKingsRoom
;     Player_EnterDoorToInside
;     Player_Spawn
;============================================================================
Maybe_Game_EnterBuildingHandler:            ; [$daaf]
    JSR PPU_WaitUntilFlushed
    JSR Game_EnterBuilding
    JSR Game_DrawAndEnableInterrupts
    JSR WaitForNextFrame
    JMP GameLoop_LoadSpriteImages

;============================================================================
; TODO: Document Maybe_Game_ExitBuildingHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Game_MainExitBuildingHandler
;============================================================================
Maybe_Game_ExitBuildingHandler:             ; [$dabe]
    JSR PPU_WaitUntilFlushed
    JSR Game_ExitBuilding
    JSR Game_DrawAndEnableInterrupts
    JSR WaitForNextFrame
    JMP GameLoop_LoadSpriteImages

;============================================================================
; TODO: Document FUN_PRG15_MIRROR__dacd
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckSwitchScreen_SwitchAreaHoriz
;============================================================================
FUN_PRG15_MIRROR__dacd:                     ; [$dacd]
    JSR PPU_WaitUntilFlushed
    JSR Game_EnterAreaHandler
    JSR Game_DrawAndEnableInterrupts
    JSR WaitForNextFrame
    JMP GameLoop_LoadSpriteImages

;============================================================================
; TODO: Document Game_SetupAndLoadArea
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Debug_ChooseArea
;     Player_EnterDoorToOutside
;============================================================================
Game_SetupAndLoadArea:                      ; [$dadc]
    JSR PPU_WaitUntilFlushed
    LDX a:Area_Region
    LDA #$dafe,X
    STA Area_CurrentArea
    JSR Game_LoadCurrentArea
    JSR Game_DrawAndEnableInterrupts
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages
    JMP Game_MainLoop


;============================================================================
; DEADCODE
;
; Would assign the area based on transitioning from another.
;============================================================================
FUN_PRG15_MIRROR__daf6:                     ; [$daf6]
    LDX a:Area_Region
    LDA #$dafe,X
    STA Area_CurrentArea

;
; XREFS:
;     FUN_PRG15_MIRROR__daf6
;     Game_SetupAndLoadArea
;
MAYBE_OUTSIDE_REGION_INDEXES:               ; [$dafe]
    db AREA_EOLIS                           ; [0]: Eolis
    db AREA_APOLUNE                         ; [1]: Trunk
    db AREA_FOREPAW                         ; [2]: Mist
    db AREA_CONFLATE                        ; [3]: Branch
    db AREA_DAYBREAK                        ; [4]: Dartmoor
    db AREA_EVIL_FORTRESS                   ; [5]: Evil Fortress


;============================================================================
; Place the player in the King's room and move toward the King.
;
; This is part of the end-game sequence, and takes place
; immediately after the final boss is killed and the screen
; fades out.
;
; The player will be placed back in the King's room, and will
; then begin moving automatically toward the King.
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
;     Maybe_Game_EnterBuildingHandler
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
    JSR Maybe_Game_EnterBuildingHandler     ; Change the state to be inside a
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
;     Game_DrawAndEnableInterrupts
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
    STA a:Player_MP


    ;
    ; Clear the player's experience.
    ;
    LDA #$00
    STA a:Experience
    STA a:Experience_U


    ;
    ; Prepare state for the first screen of Eolis, including the
    ; intro trigger sprite entity.
    ;
    JSR Game_DrawAndEnableInterrupts
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR GameLoop_LoadSpriteImages           ; Load images for the current
                                            ; sprite entities (which will be
                                            ; the intro trigger).

    ;
    ; v-- Fall through --v
    ;

;============================================================================
; TODO: Document Game_MainLoop
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_MainLoop
;     Game_SetupAndLoadArea
;     Player_Spawn
;============================================================================
Game_MainLoop:                              ; [$db45]
    LDX #$ff
    TXS
    LDX #$0e
    JSR MMC1_UpdateROMBank
    JSR WaitForNextFrame
    JSR Sprites_ResetForGameScreen
    JSR GameLoop_UpdatePlayer
    JSR #$b982                              ; Draw the player's shield
                                            ; sprite.
    JSR Player_DrawBody                     ; Draw the player's body sprite.
    JSR #$b7d6                              ; Draw the player's weapon
                                            ; sprite.
    JSR #$ba5b                              ; Check and handle casting magic.
    JSR GameLoop_CheckUseCurrentItem        ; Active selected item?
    JSR ROMBankStart                        ; Update all sprites.
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
    JSR Sprites_ResetForGameScreen
    JSR WaitForNextFrame
    JSR GameLoop_ClearSprites
    JSR GameLoop_LoadSpriteInfo
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages
    JSR PPU_WaitUntilFlushed
    JSR Game_UpdateForScroll
    JSR Game_DrawAndEnableInterrupts
    JMP Game_MainLoop

  @LAB_PRG15_MIRROR__dbaf:                  ; [$dbaf]
    JSR WaitForNextFrame
    JSR Sprites_ResetForGameScreen
    JSR #$b982
    JSR Player_DrawBody
    JSR #$b7d6
    JSR GameLoop_ClearSprites
    JSR GameLoop_LoadSpriteInfo
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages

  @_scrolling:                              ; [$dbca]
    JSR WaitForNextFrame
    JSR Sprites_ResetForGameScreen
    JSR Game_UpdatePlayerOnScroll
    JSR #$b982
    JSR Player_DrawBody
    JSR #$b7d6
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
;     Sprites_ResetForGameScreen
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
    JSR Sprites_ResetForGameScreen


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
    JSR #$b982                              ; Draw the shield.
    JSR Player_DrawBody                     ; Draw the armor.
    JSR #$b7d6                              ; Draw the weapon.
    JSR #$ba5b                              ; No-op
    JSR GameLoop_CheckUseCurrentItem        ; No-op
    JSR ROMBankStart                        ; Update sprites.
    JSR GameLoop_CountdownItems             ; No-op
    JSR Fog_OnTick                          ; No-op
    JSR GameLoop_CheckShowPlayerMenu        ; No-op
    JSR GameLoop_RunScreenEventHandlers     ; No-op
    JMP EndGame_MainLoop                    ; Loop.


;============================================================================
; Move the player toward the King in the end-game.
;
; This will move the player by simulating holding down the
; Left joypad button, pressing the A button when at the stairs,
; and pressing Up when at the King.
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
;     Maybe_ScreenReadyState:
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
    LDA Maybe_ScreenReadyState              ; Load the loaded state.
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
    JSR #$b982                              ; Draw the shield.
    JSR Player_DrawBody                     ; Draw the armor.
    JSR #$b7d6                              ; Draw the weapon.


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
    JSR #$8070                              ; Update all sprites.
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
    LDA #$8001,Y
    CLC
    ADC #$80
    STA Area_ScreenBlocksOffset.U


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
    LDA a:#$8001
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
    STA CurrentArea_TableAddr.U
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
    STA CurrentArea_BlockPropertiesAddr.U
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
    STA CurrentArea_DoorLocationsAddr.U
    LDY #$08
    LDA (CurrentArea_TableAddr),Y
    STA CurrentArea_DoorDestinationsAddr
    INY
    LDA (CurrentArea_TableAddr),Y
    CLC
    ADC #$80
    STA CurrentArea_DoorDestinationsAddr.U


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
;     Screen_Palette:
;         The loaded palette.
;
;     Screen_Maybe_ScrollXCounter:
;         The horizontal scroll counter, set to 0.
;
; CALLS:
;     Area_Maybe_ShowRoomTransition
;     Player_DrawSpriteImmediately
;     Screen_LoadBackgroundPalette
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
    JSR Area_Maybe_ShowRoomTransition
    JSR UI_DrawHUDSprites
    LDA Screen_DestPaletteOrIndex
    STA a:Screen_Paletteindex
    JSR Screen_LoadBackgroundPalette
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
;     Maybe_ScreenReadyState:
;         The current loaded state.
;
; OUTPUTS:
;     Maybe_ScreenReadyState:
;         The new loaded state (0).
;
; CALLS:
;     Screen_SetupNew
;     GameLoop_ClearSprites
;     GameLoop_LoadSpriteInfo
;     Screen_LoadSpritePalette
;     PPUBuffer_WritePalette
;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Maybe_Game_EnterScreenHandler
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
; TODO: Document Screen_SetupSprites
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_EnterBuilding
;============================================================================
Screen_SetupSprites:                        ; [$dd4e]
    JSR GameLoop_ClearSprites               ; Clear current sprite data.
    LDA Maybe_ScreenReadyState              ; Get the loaded state.
    CMP #$01                                ; Is it 1?
    BEQ @LAB_PRG15_MIRROR__dd5a             ; If not, finish up.
    JSR GameLoop_LoadSpriteInfo             ; Load information for the
                                            ; screen.

  @LAB_PRG15_MIRROR__dd5a:                  ; [$dd5a]
    LDA #$00
    STA Maybe_ScreenReadyState              ; Set loaded state to 0.
    JMP PPUBuffer_WritePalette              ; Append a 0 to the PPU buffer.


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
;     Something_Maybe_NewCurrentScreen:
;         TODO
;
;     Area_CurrentArea:
;         TODO
;
;     Screen_Paletteindex:
;         TODO: The index of the palette outside the temple?
;
;     Area_Music_Outside:
;         The music to play outside the temple.
;
;     CurrentPalette:
;         The palette inside the temple.
;
;     Building_TilesIndex:
;         TODO
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
    LDA #$ddd5,X                            ; Set the current screen for
                                            ; outside the temple.
    STA Area_CurrentScreen
    LDA #$ddcd,X
    STA a:Area_Region
    LDA #$ddb5,X
    STA Player_PosX_Block
    LDA #$ddbd,X
    STA Player_PosY
    LDA #$ddc5,X
    STA a:Something_Maybe_NewCurrentScreen
    LDY #$ddad,X
    STY Area_CurrentArea
    LDA #$df4c,Y
    STA a:Screen_Paletteindex
    LDA #$df5c,Y
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
    db REGION_EOLIS                         ; [0]: First town
    db REGION_BRANCH                        ; [1]: Apolune
    db REGION_BRANCH                        ; [2]: Forepaw
    db REGION_MIST                          ; [3]: Fog
    db REGION_BRANCH                        ; [4]: Victim
    db REGION_BRANCH                        ; [5]: Conflate
    db REGION_BRANCH                        ; [6]: Daybreak
    db REGION_BRANCH                        ; [7]: Final town


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
    db $50                                  ; [0]: First town
    db $50                                  ; [1]: Apolune
    db $30                                  ; [2]: Forepaw
    db $90                                  ; [3]: Fog
    db $30                                  ; [4]: Victim
    db $90                                  ; [5]: Conflate
    db $60                                  ; [6]: Daybreak
    db $30                                  ; [7]: Final town


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
    db $90                                  ; [0]: First town
    db $90                                  ; [1]: Apolune
    db $90                                  ; [2]: Forepaw
    db $80                                  ; [3]: Fog
    db $90                                  ; [4]: Victim
    db $90                                  ; [5]: Conflate
    db $90                                  ; [6]: Daybreak
    db $90                                  ; [7]: Final town


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
MAYBE_START_BYTE_03DA_FOR_TEMPLE_SPAWN:     ; [$ddc5]
    db $02                                  ; [0]: First town
    db $0b                                  ; [1]: Apolune
    db $10                                  ; [2]: Forepaw
    db $1e                                  ; [3]: Fog
    db $23                                  ; [4]: Victim
    db $2b                                  ; [5]: Conflate
    db $33                                  ; [6]: Daybreak
    db $3c                                  ; [7]: Final town


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
    db $00                                  ; [0]: First town
    db $01                                  ; [1]: Apolune
    db $01                                  ; [2]: Forepaw
    db $02                                  ; [3]: Fog
    db $02                                  ; [4]: Victim
    db $03                                  ; [5]: Conflate
    db $03                                  ; [6]: Daybreak
    db $04                                  ; [7]: Final town


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
    db $02                                  ; [0]: First town
    db $01                                  ; [1]: Apolune
    db $03                                  ; [2]: Forepaw
    db $06                                  ; [3]: Fog
    db $06                                  ; [4]: Victim
    db $08                                  ; [5]: Conflate
    db $0b                                  ; [6]: Daybreak
    db $0c                                  ; [7]: Final town


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
;     Something_Maybe_NewCurrentScreen:
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
;     Maybe_Game_EnterBuildingHandler
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
    STA a:Something_Maybe_NewCurrentScreen
    LDA #$06
    STA a:Building_TilesIndex               ; Set the tiles to 6.


    ;
    ; Face the player to the left.
    ;
    LDA Player_Flags                        ; Load the player flags.
    AND #$bf                                ; Set to facing left.
    STA Player_Flags                        ; Store it.
    JMP Maybe_Game_EnterBuildingHandler     ; Trigger the Enter Building
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
;     Maybe_Game_EnterBuildingHandler
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
    STA CurrentMusic                        ; Set as the current music.


    ;
    ; Push a buch of state to return to when exiting the door.
    ;
    LDA Area_CurrentArea                    ; Load the current area.
    STA a:Area_SavedArea                    ; Save it for when exiting the
                                            ; building.
    LDA Area_CurrentScreen                  ; Load the current screen in the
                                            ; area.
    STA a:Area_SavedScreen                  ; Save it.
    LDA a:Screen_Paletteindex               ; Load the current palette.
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
    LDA #$df34,X                            ; Load the bank for this area.
    STA CurrentArea_ROMBank                 ; Store as the current area ROM
                                            ; bank.
    LDX CurrentArea_ROMBank
    JSR MMC1_SavePRGBankAndUpdateTo         ; Push the current bank and
                                            ; switch to the new one.
    LDX Area_CurrentArea                    ; Load the current area again.
    LDA #$df3c,X                            ; Get the index into the screen
                                            ; data table in this bank.
    JSR Game_LoadAreaTable                  ; Load the area table for the
                                            ; screen.
    JSR MMC1_RestorePrevPRGBank             ; Restore the previous bank.


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
    LDA a:Something_Maybe_NewCurrentScreen
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
;     Maybe_Game_ExitBuildingHandler
;============================================================================
Game_ExitBuilding:                          ; [$de66]
    LDA a:SelectedWeapon
    STA a:Player_CurWeapon
    LDA a:Areas_DefaultMusic
    STA CurrentMusic
    LDX a:Area_SavedArea
    STX Area_CurrentArea
    LDA #$df34,X
    STA CurrentArea_ROMBank
    LDX CurrentArea_ROMBank
    JSR MMC1_SavePRGBankAndUpdateTo
    LDX Area_CurrentArea
    LDA #$df3c,X
    JSR Game_LoadAreaTable
    JSR MMC1_RestorePrevPRGBank
    LDX Area_CurrentArea
    LDA #$df44,X
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
;     AREA_TO_SCREEN_DATA_BANK_INDEX:
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
;     CurrentMusic:
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
;     MMC1_RestorePrevPRGBank
;     MMC1_SavePRGBankAndUpdateTo
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
    LDA #$df34,X                            ; A = PRG bank for the area.
    STA CurrentArea_ROMBank                 ; Store as the current bank.
    LDX CurrentArea_ROMBank                 ; X = current bank.
    JSR MMC1_SavePRGBankAndUpdateTo         ; Push the current bank and
                                            ; update to this area's bank.


    ;
    ; Load the area information.
    ;
    LDA #$df3c,X                            ; A = sprite bank for the area.
    JSR Game_LoadAreaTable                  ; Load the area information.
    JSR MMC1_RestorePrevPRGBank             ; Restore the previous bank.


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
    LDA #$df44,X                            ; A = tiles index.
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
    LDA #$df4c,X                            ; Load the palette.
    STA Screen_DestPaletteOrIndex           ; And store it as the current one
                                            ; for the area.


    ;
    ; Load the music for this area.
    ;
    LDA #$df5c,X                            ; Load the music for the area.
    STA CurrentMusic                        ; And store it as the current
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
;     AREA_TO_SCREEN_DATA_BANK_INDEX:
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
;     CurrentMusic:
;         The current music to play.
;
;     Area_TilesIndex:
;         The tiles index for the area.
;
; CALLS:
;     Area_LoadTiles
;     Screen_Load
;     MMC1_RestorePrevPRGBank
;     MMC1_SavePRGBankAndUpdateTo
;     Screen_LoadSpritePalette
;     Player_SetInitialState
;
; XREFS:
;     Game_SetupAndLoadArea
;============================================================================
Game_LoadCurrentArea:                       ; [$def5]
    JSR Player_SetInitialState              ; Set the initial player state.


    ;
    ; Load the bank for this area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA #$df34,X                            ; Load the ROM bank for the area.
    STA CurrentArea_ROMBank                 ; Store that as the current bank.
    LDX CurrentArea_ROMBank                 ; X = current bank.
    JSR MMC1_SavePRGBankAndUpdateTo         ; Save the current bank and
                                            ; switch to it.


    ;
    ; Load the bank for the sprites for this area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA #$df3c,X                            ; A = bank for the sprites.


    ;
    ; Load information on the area.
    ;
    JSR Game_LoadAreaTable                  ; Load the table of information
                                            ; on this area.
    JSR MMC1_RestorePrevPRGBank             ; Restore to the previous bank.
    LDA Area_LoadingScreenIndex             ; A = current screen index.
    STA Area_CurrentScreen                  ; Store as the current screen.


    ;
    ; Load the tiles for the area.
    ;
    LDX Area_CurrentArea                    ; X = current area.
    LDA #$df44,X                            ; A = tiles index for the area.
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
    LDA #$df4c,X                            ; Load the palette for the area.
    STA Screen_DestPaletteOrIndex           ; Store as the current palette.


    ;
    ; Load the music for the area.
    ;
    LDA #$df5c,X                            ; Load the music for the area.
    STA CurrentMusic                        ; Set as the current music.
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
    db BANK_0_AREA_DATA                     ; [0]: Eolis
    db BANK_1_AREA_DATA                     ; [1]: Apolune
    db BANK_0_AREA_DATA                     ; [2]: Forepaw
    db BANK_0_AREA_DATA                     ; [3]: Mascon

;
; XREFS:
;     Game_EnterBuilding
;
AREA_TO_SCREEN_DATA_BANKS_4_:               ; [$df38]
    db BANK_2_AREA_DATA                     ; [4]: Victim
    db BANK_1_AREA_DATA                     ; [5]: Conflate
    db BANK_2_AREA_DATA                     ; [6]: Daybreak
    db BANK_2_AREA_DATA                     ; [7]: Evil Fortress

;
; XREFS:
;     Game_EnterAreaHandler
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
AREA_TO_SCREEN_DATA_BANK_INDEX:             ; [$df3c]
    db $00                                  ; [0]: Eolis
    db $00                                  ; [1]: Apolune
    db $01                                  ; [2]: Forepaw
    db $02                                  ; [3]: Mascon

;
; XREFS:
;     Game_EnterBuilding
;
AREA_TO_SCREEN_DATA_BANK_INDEX_4_:          ; [$df40]
    db $01                                  ; [4]: Victim
    db $01                                  ; [5]: Conflate
    db $00                                  ; [6]: Daybreak
    db $02                                  ; [7]: Evil Fortress


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
    db $00                                  ; [0]: Outside first town
    db $02                                  ; [1]: First town
    db $03                                  ; [2]:
    db $05                                  ; [3]:
    db $06                                  ; [4]:
    db $01                                  ; [5]:
    db $04                                  ; [6]:
    db $04                                  ; [7]: Final boss room

;
; XREFS:
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;
PALETTES:                                   ; [$df4c]
    db PALETTE_EOLIS                        ; [0]:
    db PALETTE_OUTSIDE                      ; [1]:
    db PALETTE_MIST                         ; [2]:
    db PALETTE_TOWN                         ; [3]:
    db PALETTE_TOWN                         ; [4]:
    db PALETTE_BRANCH                       ; [5]:
    db PALETTE_DARTMOOR                     ; [6]:
    db PALETTE_EVIL_FORTRESS                ; [7]:
    hex 00 00 00 00 00 00 00 00             ; [$df54] undefined

;
; XREFS:
;     Game_EnterAreaHandler
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;
AREA_TO_MUSIC_TABLE:                        ; [$df5c]
    db MUSIC_EOLIS                          ; [0]: Eolis
    db MUSIC_APOLUNE                        ; [1]: Apolune
    db MUSIC_FOREPAW                        ; [2]: Forepaw
    db MUSIC_MASCON_VICTIM                  ; [3]: Mascon
    db MUSIC_MASCON_VICTIM                  ; [4]: Victim
    db MUSIC_CONFLATE                       ; [5]: Conflate
    db MUSIC_DAYBREAK                       ; [6]: Daybreak
    db MUSIC_EVIL_FORTRESS                  ; [7]: Evil Fortress

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
;     FUN_PRG15_MIRROR__dacd
;============================================================================
Game_EnterAreaHandler:                      ; [$df64]
    LDX Area_CurrentArea
    LDA #$df34,X
    STA CurrentArea_ROMBank
    LDX CurrentArea_ROMBank
    JSR MMC1_SavePRGBankAndUpdateTo
    LDX Area_CurrentArea
    LDA #$df3c,X
    JSR Game_LoadAreaTable
    JSR MMC1_RestorePrevPRGBank
    LDA Area_LoadingScreenIndex
    STA Area_CurrentScreen
    LDX Area_CurrentArea
    LDA #$df5c,X
    STA CurrentMusic
    STA a:Areas_DefaultMusic
    LDA #$df44,X
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
;     Game_SetupAndLoadArea
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
    JMP Game_SetupAndLoadArea               ; Load the area.


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
;     Screen_Paletteindex:
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
    LDA a:Screen_Paletteindex               ; Load the current palette.
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
    LDA #$e012,X                            ; Load a starting fog generator
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
    db $18                                  ; [0]:
    db $06                                  ; [1]:
    db $30                                  ; [2]:
    db $0c                                  ; [3]:


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
    db BANK_12_LOGIC                        ; Bank = 12
    dw PlayerMenu_Show-1                    ; Address =
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
; While paused, PauseFlag will be set.
;
; INPUTS:
;     Joy1_ChangedButtonMask:
;         The changed button mask to check.
;
; OUTPUTS:
;     PauseFlag:
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
    STA a:PauseFlag                         ; Set the Paused flag.

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
    STA a:PauseFlag
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
    STA PPU_ScrollScreenVert
    STA PPU_ScrollScreenHoriz               ; DEADCODE: Overridden below.


    ;
    ; Set the starting speed, status, and iframes.
    ;
    STA Player_MoveAcceleration             ; Set the player speed to 0.
    STA Player_StatusFlag                   ; Set the player status to 0.
    STA Player_InvincibilityPhase           ; Set the invincibility phase to
                                            ; 0.
    STA PPU_ScrollScreenVert                ; Set this again, apparently.


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
    CMP #$e150,X                            ; Check against the phase lookup
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
    db $08                                  ; [0]: 8 frames thrusting out
                                            ; weapon
    db $03                                  ; [1]: 3 frames of waiting
    db $08                                  ; [2]: 8 frames withdrawing
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
;     Area_BeginScrollToNextRoom
;     Maybe_Player_CalcSpeed
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
    JSR Maybe_Player_CalcSpeed              ; Calculate the new walking
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
    ADC Player_MoveAcceleration.U           ; Add the move acceleration.
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
    JSR Area_BeginScrollToNextRoom          ; Begin scrolling to the right.
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
;     Area_BeginScrollToNextRoom
;     Maybe_Player_CalcSpeed
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
    JSR Maybe_Player_CalcSpeed              ; Calculate the new walking
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
    SBC Player_MoveAcceleration.U           ; Subtract the move acceleration.
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
    JSR Area_BeginScrollToNextRoom          ; Begin scrolling to the left.
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
    db $00                                  ; [0]:
    db $0f                                  ; [1]:


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
;     #$aa:
;         The default acceleration (0xC0).
;
; XREFS:
;     Maybe_Player_CalcSpeed
;     Player_HandleIFrames
;     Player_TryMoveLeft
;     Player_TryMoveRight
;============================================================================
Player_SetStandardAcceleration:             ; [$e27f]
    LDA #$c0
    STA Player_MoveAcceleration             ; Set the lower byte of movement
                                            ; acceleation to 0xC0.
    LDA #$00
    STA Player_MoveAcceleration.U           ; Set the upper byte to 0.
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
;     #$aa:
;         The updated acceleration.
;
; XREFS:
;     Maybe_Player_CalcSpeed
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
    STA Player_MoveAcceleration.U           ; Set upper to 8.
    RTS

;============================================================================
; TODO: Document Maybe_Player_CalcSpeed
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
Maybe_Player_CalcSpeed:                     ; [$e291]
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
    LDA Player_MoveAcceleration.U
    SBC #$01
    BCS @_return
    LDA a:PlayerTitle
    LSR A
    LSR A
    AND #$03
    TAX
    LDA Player_MoveAcceleration
    CLC
    ADC #$e2c4,X
    STA Player_MoveAcceleration
    LDA Player_MoveAcceleration.U
    ADC #$00
    STA Player_MoveAcceleration.U

  @_return:                                 ; [$e2c3]
    RTS

;
; XREFS:
;     Maybe_Player_CalcSpeed
;
BYTE_ARRAY_PRG15_MIRROR__e2c4:              ; [$e2c4]
    db $02                                  ; [0]:
    db $04                                  ; [1]:
    db $06                                  ; [2]:
    db $08                                  ; [3]:

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
    JSR Area_BeginScrollToNextRoom
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
    JSR Area_BeginScrollToNextRoom
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
    JMP Maybe_MoveDownOneScreen

  @LAB_PRG15_MIRROR__e3f5:                  ; [$e3f5]
    LDA Player_PosY
    CLC
    ADC #$08
    STA Player_PosY

;============================================================================
; TODO: Document Maybe_MoveDownOneScreen
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
Maybe_MoveDownOneScreen:                    ; [$e3fc]
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
    JSR Area_BeginScrollToNextRoom
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
    SBC #$e4d6,X
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
    ADC #$e4d6,X
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
    JSR Area_BeginScrollToNextRoom
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
    db $08                                  ; [0]:
    db $04                                  ; [1]:
    db $04                                  ; [2]:
    db $04                                  ; [3]:
    db $04                                  ; [4]:
    db $02                                  ; [5]:
    db $02                                  ; [6]:
    db $01                                  ; [7]:
    db $01                                  ; [8]:
    db $01                                  ; [9]:
    db $01                                  ; [10]:
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
    db $01                                  ; [21]:
    db $01                                  ; [22]:
    db $01                                  ; [23]:
    db $01                                  ; [24]:
    db $02                                  ; [25]:
    db $02                                  ; [26]:
    db $04                                  ; [27]:
    db $04                                  ; [28]:
    db $04                                  ; [29]:
    db $04                                  ; [30]:
    db $08                                  ; [31]:

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
    ADC #$e524,X
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
    db $00                                  ; [$e524] byte

;
; XREFS:
;     Area_CheckCanClimbAdjacent
;
BYTE_PRG15_MIRROR__e525:                    ; [$e525]
    db $0f                                  ; [$e525] byte

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
    CMP #$e569,X
    BEQ @_setupArea
    DEX
    BPL @_paletteCheckLoop
    BMI @_enterScreen

  @_setupArea:                              ; [$e558]
    LDA #$e570,X
    CMP a:Areas_DefaultMusic
    BEQ @_enterScreen
    STA CurrentMusic
    STA a:Areas_DefaultMusic

  @_enterScreen:                            ; [$e565]
    JMP Maybe_Game_EnterScreenHandler

  @_return:                                 ; [$e568]
    RTS


;============================================================================
; Mapping of palettes to accompanying music.
;
; These two tables work together, along with a loop, to
; match up palettes to the music that should play when
; switching screens.
;============================================================================
    db PALETTE_OUTSIDE                      ; [0]:
    db PALETTE_TOWER                        ; [1]:
    db PALETTE_MIST                         ; [2]:
    db PALETTE_SUFFER                       ; [3]:
    db PALETTE_DARTMOOR                     ; [4]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Palette_ARRAY_PRG15_MIRROR__e569_5_:        ; [$e56e]
    db PALETTE_FRATERNAL                    ; [5]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Palette_ARRAY_PRG15_MIRROR__e569_6_:        ; [$e56f]
    db PALETTE_KING_GRIEVES_ROOM            ; [6]:
    db MUSIC_APOLUNE                        ; [0]:
    db MUSIC_MAYBE_TOWER                    ; [1]:
    db MUSIC_FOREPAW                        ; [2]:
    db MUSIC_MAYBE_TOWER                    ; [3]:
    db MUSIC_DAYBREAK                       ; [4]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Music_ARRAY_PRG15_MIRROR__e570_5_:          ; [$e575]
    db MUSIC_MAYBE_TOWER                    ; [5]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
Music_ARRAY_PRG15_MIRROR__e570_6_:          ; [$e576]
    db MUSIC_MAYBE_TOWER                    ; [6]:

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
    STX a:Something_Maybe_NewCurrentScreen
    LDA Screen_DestPaletteOrIndex
    STA Area_LoadingScreenIndex
    TAX
    LDA #$e609,X
    STA Screen_DestPaletteOrIndex
    LDA #$e613,X
    STA a:Building_TilesIndex
    LDA #$e61d,X
    STA Screen_StartPosYX
    LDA a:Areas_DefaultMusic
    STA a:Area_Music_Outside
    LDA #$e5ff,X
    STA a:Areas_DefaultMusic
    LDA Area_CurrentArea


    ;
    ; Where does this door take the player?
    ;
    CMP #$04
    BNE @LAB_PRG15_MIRROR__e5a6
    JMP Maybe_Game_MainExitBuildingHandler

  @LAB_PRG15_MIRROR__e5a6:                  ; [$e5a6]
    LDA Player_Flags
    AND #$bf
    STA Player_Flags
    JSR Screen_FadeToBlack
    JMP Maybe_Game_EnterBuildingHandler
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
    LDA #$e5db,Y
    STA a:CurrentDoor_KeyRequirement
    JSR Game_RunDoorRequirementHandler
    PLA
    TAY
    LDA a:CurrentDoor_KeyRequirement
    BNE SUB_RETURN_E5DA


    ;
    ; This door is not locked.
    ;
    LDA #$e5e7,Y
    STA a:Area_Region
    LDA #$e5f3,Y
    STA Area_LoadingScreenIndex
    JSR Screen_FadeToBlack
    JMP Game_SetupAndLoadArea

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
    db $00                                  ; [0]: No key required
    db $04                                  ; [1]: "J" key required
    db $00                                  ; [2]: No key required
    db $03                                  ; [3]: "Q" key required
    db $00                                  ; [4]: No key required
    db $01                                  ; [5]: "A" key required
    db $00                                  ; [6]: No key required
    db $07                                  ; [7]: Ring of Dworf required
    db $00                                  ; [8]: No key required
    db $08                                  ; [9]: Demon's Ring required
    db $00                                  ; [10]: No key required
    db $00                                  ; [11]: No key required

;
; XREFS:
;     Player_EnterDoorToOutside
;
MAYBE_REGION_TRANSITION_MAP:                ; [$e5e7]
    db REGION_EOLIS                         ; [0]:
    db REGION_TRUNK                         ; [1]:
    db REGION_EOLIS                         ; [2]:
    db REGION_MIST                          ; [3]:
    db REGION_TRUNK                         ; [4]:
    db REGION_BRANCH                        ; [5]:
    db REGION_MIST                          ; [6]:
    db REGION_DARTMOOR                      ; [7]:
    db REGION_BRANCH                        ; [8]:
    db REGION_EVIL_FORTRESS                 ; [9]:
    db REGION_DARTMOOR                      ; [10]:
    db REGION_EVIL_FORTRESS                 ; [11]:

;
; XREFS:
;     Player_EnterDoorToOutside
;
MAYBE_SCREEN_TRANSITION_MAP:                ; [$e5f3]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $08                                  ; [2]:
    db $11                                  ; [3]:
    db $28                                  ; [4]:
    db $00                                  ; [5]:
    db $1f                                  ; [6]:
    db $00                                  ; [7]:
    db $27                                  ; [8]:
    db $08                                  ; [9]:
    db $0e                                  ; [10]:
    db $0e                                  ; [11]:

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_MUSIC:                             ; [$e5ff]
    db MUSIC_KINGS_ROOM                     ; [0]: King's Room
    db MUSIC_TEMPLE                         ; [1]: Temple
    db MUSIC_SHOP                           ; [2]: Hospital
    db MUSIC_SHOP                           ; [3]: Tavern
    db MUSIC_SHOP                           ; [4]: Tool Shop
    db MUSIC_SHOP                           ; [5]: Key Shop
    db MUSIC_SHOP                           ; [6]: House
    db MUSIC_SHOP                           ; [7]: Meat Shop
    db MUSIC_SHOP                           ; [8]: Martial Arts
    db MUSIC_SHOP                           ; [9]: Magic Shop

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_PALETTES:                          ; [$e609]
    db PALETTTE_KINGS_ROOM                  ; [0]: King's Room
    db PALETTE_TEMPLE                       ; [1]: Temple
    db PALETTE_HOSPITAL                     ; [2]: Hospital
    db PALETTE_TAVERN                       ; [3]: Tavern
    db PALETTE_TOOL_SHOP                    ; [4]: Tool Shop
    db PALETTE_KEY_SHOP                     ; [5]: Key Shop
    db PALETTE_HOUSE                        ; [6]: House
    db PALETTE_MEAT_SHOP                    ; [7]: Meat Shop
    db PALETTE_MARTIAL_ARTS                 ; [8]: Martial Arts
    db PALETTE_MAGIC_SHOP                   ; [9]: Magic Shop

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_MAYBE_TILES_INDEXES:               ; [$e613]
    db $06                                  ; [0]: King's Room
    db $06                                  ; [1]: Temple
    db $06                                  ; [2]: Hospital
    db $07                                  ; [3]: Tavern
    db $07                                  ; [4]: Tool Shop
    db $07                                  ; [5]: Key Shop
    db $07                                  ; [6]: House
    db $07                                  ; [7]: Meat Shop
    db $08                                  ; [8]: Martial Arts
    db $08                                  ; [9]: Magic Shop

;
; XREFS:
;     Player_EnterDoorToInside
;
BUILDING_START_POSITIONS:                   ; [$e61d]
    db $9e                                  ; [0]: King's Room
    db $9e                                  ; [1]: Temple
    db $9e                                  ; [2]: Hospital
    db $8e                                  ; [3]: Tavern
    db $7e                                  ; [4]: Tool Shop
    db $7e                                  ; [5]: Key Shop
    db $7e                                  ; [6]: House
    db $7e                                  ; [7]: Meat Shop
    db $8e                                  ; [8]: Martial Arts
    db $8e                                  ; [9]: Magic Shop


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
;     Maybe_MoveDownOneScreen
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
;     Maybe_MoveDownOneScreen
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
    LDA CurrentArea_DoorLocationsAddr.U     ; Load the upper byte.
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
;     CastMagic_Maybe_CheckImpassableY
;     CurrentSprite_CalculateVisibility
;     CurrentSprite_CalculateVisibility_MaybeWithArg
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__854c
;     FUN_PRG14__86c6
;     SpriteBehavior_NecronAides
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
;     CastMagic_Maybe_CheckImpassableY
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__86c6
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
    LDA #$e8d9,Y                            ; A = Impassable flag for the
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
;     CurrentSprite_CalculateVisibility_MaybeWithArg
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
    db $00                                  ; [0]: Air
    db $01                                  ; [1]: Solid
    db $00                                  ; [2]: Ladder
    db $00                                  ; [3]: Door
    db $00                                  ; [4]: Foreground
    db $01                                  ; [5]: Breakable floor
    db $01                                  ; [6]: Pushable
    db $01                                  ; [7]: ??
    db $01                                  ; [8]: ??
    db $00                                  ; [9]: Maybe: Transition down
    db $00                                  ; [10]: Maybe: Transition up
    db $01                                  ; [11]: Breakable by Mattock
    db $00                                  ; [12]: Area transition
                                            ; left-to-right
    db $00                                  ; [13]: Area transition
                                            ; right-to-left
    db $00                                  ; [14]: ??
    db $00                                  ; [15]: ??


;============================================================================
; Begin scrolling to the next room.
;
; This will begin clearing out state for the current room
; and then begin scrolling to the next.
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
;     Area_ScrollToNextRoom
;
; XREFS:
;     Area_ScrollScreenUp
;     Maybe_MoveDownOneScreen
;     Player_CheckHandleClimbUp
;     Player_MoveDownScreen
;     Player_TryMoveLeft
;     Player_TryMoveRight
;============================================================================
Area_BeginScrollToNextRoom:                 ; [$e8e9]
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
    STA CurrentMusic                        ; Set as the current music.

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
    JMP Area_ScrollToNextRoom               ; Now scroll to the room.


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
    ADC #$e95b,X                            ; Load a block offset to round to
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
    ADC #$e95b,X                            ; Load a block offset to round to
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
    db $04                                  ; [0]: Facing left
    db $0c                                  ; [1]: Facing right

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
    ADC #$e9be,X
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
    db $ff                                  ; [0]:
    db $10                                  ; [1]:
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
    LDA #$ea37,X
    STA Temp_Addr_L
    LDA #$ea38,X
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
    JMP Maybe_Game_EnterScreenHandler

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
USHORT_PRG15_MIRROR__ea37:                  ; [$ea37]
    dw $ea4f                                ; Eolis
    dw $ea47                                ; Apolune
    dw $ea4f                                ; Forepaw
    dw $ea4f                                ; Mascon
    dw $ea4f                                ; Victim
    dw $ea4f                                ; Conflate
    dw $ea4f                                ; Daybreak
    dw $ea4f                                ; Evil Fortress

BYTE_PRG15_MIRROR__ea47:                    ; [$ea47]
    db $0c                                  ; Current screen comparator
    db $16                                  ; New screen index
    db $b3                                  ; Y, X
    db $06                                  ; Area
    db $16                                  ; Current screen comparator
    db $0c                                  ; New screen index
    db $2d                                  ; Y, X
    db $06                                  ; Area

;
; XREFS:
;     USHORT_PRG15_MIRROR__ea37
;     [$PRG15_MIRROR::ea37]
;
BYTE_PRG15_MIRROR__ea4f:                    ; [$ea4f]
    db $ff                                  ; [$ea4f] byte

;============================================================================
; TODO: Document Maybe_Game_MainExitBuildingHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_CheckSwitchScreen_SwitchAreaHoriz
;     Player_EnterDoorToInside
;============================================================================
Maybe_Game_MainExitBuildingHandler:         ; [$ea50]
    LDA Player_Flags
    ORA #$40
    STA Player_Flags
    LDA a:Area_Music_Outside
    STA a:Areas_DefaultMusic
    JMP Maybe_Game_ExitBuildingHandler
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
    BEQ Maybe_Game_MainExitBuildingHandler
    ASL A
    TAY
    LDA #$ea9c,Y
    STA Temp_Addr_L
    LDA #$ea9d,Y
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
    JMP FUN_PRG15_MIRROR__dacd

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
    dw $eb2e                                ; [0]: Eolis
    dw $eaac                                ; [1]: Apolune
    dw $eb03                                ; [2]: Forepaw
    dw $eac6                                ; [3]: Mascon
    dw $eb2e                                ; [4]: Victim
    dw $eb18                                ; [5]: Conflate
    dw $eb28                                ; [6]: Daybreak
    dw $eb2e                                ; [7]: Evil Fortress

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::ea9e]
;
TOWN_TRANSITIONS_APOLUNE:                   ; [$eaac]
    db $00                                  ; [$eaac] byte

    db AREA_MASCON
    db $02,$92                              ; [$eaae] byte

    db PALETTE_TOWN
    db $07                                  ; Entering Apolune from Trunk
                                            ; (screen 7)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $00                                  ;   |-> Screen index 0
    db $92                                  ;   |-> Start position Y=9, X=2
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $08                                  ; [$eab6] byte

    db AREA_MASCON
    db $01,$9e                              ; [$eab8] byte

    db PALETTE_TOWN
    db $1a                                  ; Entering Forepaw from Trunk
                                            ; (screen 26)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $02                                  ;   |-> Screen index 2
    db $92                                  ;   |-> Start position X=2, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $1d                                  ; [$eac0] byte

    db AREA_MASCON
    db $03,$9e                              ; [$eac2] byte

    db PALETTE_TOWN
    db $ff                                  ; [$eac5] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa2]
;
TOWN_TRANSITIONS_MASCON:                    ; [$eac6]
    db $00                                  ; Exiting left from Apolune
                                            ; screen 0
    db AREA_APOLUNE                         ;   |-> Switch to area 1
    db $07                                  ;   |-> Screen index 6
    db $7e                                  ;   |-> Start position Y=7, X=14
    db PALETTE_OUTSIDE                      ;   '-> Palette 6
    db $01                                  ; Exit right from Apolune screen
                                            ; 1
    db AREA_APOLUNE                         ;   |-> Switch to area 1
    db $08                                  ;   |-> Screen index 8
    db $71                                  ;   |-> Start position Y=7, X=1
    db PALETTE_OUTSIDE                      ;   '-> Palette 6
    db $02                                  ; Exiting left from Forepaw to
                                            ; Trunk (screen 2)
    db AREA_APOLUNE                         ;   |-> Switch to area 1
    db $1a                                  ;   |-> Screen index 26
    db $7e                                  ;   |-> Start position X=14, Y=7
    db PALETTE_OUTSIDE                      ;   '-> Palette 6
    db $03                                  ; Exiting right from Forepaw to
                                            ; Branch (screen 3)
    db AREA_APOLUNE                         ;   |-> Switch to area 3
    db $1d                                  ;   |-> Screen index 29
    db $71                                  ;   |-> Start position X=1, Y=7
    db PALETTE_OUTSIDE                      ;   |-> Palette 6
    db $04                                  ; Exiting left from Mascon to
                                            ; Mist (screen 4)
    db AREA_FOREPAW                         ;   |-> Switch to area 2
    db $09                                  ;   |-> Screen index 9
    db $9e                                  ;   |-> Start position X=14, Y=9
    db PALETTE_MIST                         ;   '-> Palette 10
    db $05                                  ; Exiting right from Mascon to
                                            ; Mist (screen 5)
    db AREA_FOREPAW                         ;   |-> Switch to area 2
    db $0c                                  ;   |-> Screen index 12
    db $91                                  ;   |-> Start position X=1, Y=9
    db PALETTE_MIST                         ;   '-> Palette 10
    db $06                                  ; Exit left from Victim to Mist
                                            ; from screen 6
    db AREA_FOREPAW                         ;   |-> Switch to area 2
    db $22                                  ;   |-> Screen index 34
    db $9e                                  ;   |-> Start position X=14, Y=9
    db PALETTE_MIST                         ;   '-> Palette 10
    db $07                                  ; Exit right from Victim to Mist
                                            ; on screen 7
    db AREA_FOREPAW                         ;   |-> Switch to area 7
    db $25                                  ;   |-> Screen index = 37
    db $91                                  ;   |-> Start position X=1, Y=9
    db PALETTE_MIST                         ;   '-> Palette 10
    db $08                                  ; Exit left from Conflate to
                                            ; Branch
    db AREA_CONFLATE                        ;   |-> Switch to area 5
    db $0d                                  ;   |-> Screen index 13
    db $7e                                  ;   |-> Start position X=14, Y=7
    db PALETTE_BRANCH                       ;   '-> Palette 8
    db $0a                                  ; Exit left from Daybreak to
                                            ; Branch
    db AREA_CONFLATE                        ;   |-> Switch to area 5
    db $23                                  ;   |-> Screen index 35
    db $7e                                  ;   |-> Start position X=14, Y=7
    db PALETTE_BRANCH                       ;   '-> Palette 8
    db $0b                                  ; Exit right from Daybreak to
                                            ; Branch
    db AREA_CONFLATE                        ;   |-> Switch to area 5
    db $24                                  ;   |-> Screen index 36
    db $71                                  ;   |-> Start position X=1, Y=7
    db PALETTE_BRANCH                       ;   '-> Palette 8
    db $0c                                  ; Exit left from Dartmoor to
                                            ; Branch (screen 12)
    db AREA_DAYBREAK                        ;   |-> Switch to area 6
    db $03                                  ;   |-> Screen index 3
    db $7e                                  ;   |-> Start position X=14, Y=7
    db PALETTE_DARTMOOR                     ;   '-> Palette 12
    db $ff                                  ; [$eb02] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa0]
;
TOWN_TRANSITIONS_FOREPAW:                   ; [$eb03]
    db $09                                  ; Entering Mascon from Mist
                                            ; (screen 9)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $04                                  ;   |-> Screen index 4
    db $91                                  ;   |-> Start position X=1, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $0c                                  ; Entering left to Mascon from
                                            ; Mist
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $05                                  ;   |-> Screen index 5
    db $9e                                  ;   |-> Start position X=14, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $22                                  ; Enering right to Victim from
                                            ; Mist (screen 34)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $06                                  ;   |-> Screen index 6
    db $91                                  ;   |-> Start position X=1, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $25                                  ; Entering left to Victim from
                                            ; Mist (screen 37)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $07                                  ;   |-> Screen index 7
    db $9e                                  ;   |-> Start position X=14, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $ff                                  ; [$eb17] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa6]
;
TOWN_TRANSITIONS_CONFLATE:                  ; [$eb18]
    db $0d                                  ; Entering right to Conflate from
                                            ; Branch (screen 13)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $08                                  ;   |-> Screen index 8
    db $91                                  ;   |-> Start position X=1, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $23                                  ; Entering Daybreak from Branch
                                            ; (screen 35)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $0a                                  ;   |-> Screen index 10
    db $92                                  ;   |-> Start position X=2, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $24                                  ; Entering Daybreak from Branch
                                            ; (screen 36)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $0b                                  ;   |-> Screen index 11
    db $9e                                  ;   |-> Start position X=14, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $ff                                  ; [$eb27] byte

;
; XREFS:
;     AREA_TOWN_TRANSITIONS_DATA
;     [$PRG15_MIRROR::eaa8]
;
TOWN_TRANSITIONS_DAYBREAK:                  ; [$eb28]
    db $03                                  ; Entering right to Dartmoor from
                                            ; Branch (screen 3)
    db AREA_MASCON                          ;   |-> Switch to area 3
    db $0c                                  ;   |-> Screen index 12
    db $92                                  ;   |-> Start position X=2, Y=9
    db PALETTE_TOWN                         ;   '-> Palette 27
    db $ff                                  ; [$eb2d] byte

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
    db $ff                                  ; [$eb2e] byte


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
    BEQ @_return
    ASL A
    TAY
    LDA #$eb40,Y
    PHA
    LDA #$eb3f,Y
    PHA

  @_return:                                 ; [$eb3e]
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
    db $3d                                  ; [0]: No key, return

;
; XREFS:
;     Game_RunDoorRequirementHandler
;
DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS_0__1:    ; [$eb40]
    db $eb                                  ; [0]:
    db $50                                  ; [1]: "A" Key
    db $eb                                  ; [1]:
    db $60                                  ; [2]: "K" Key
    db $eb                                  ; [2]:
    db $70                                  ; [3]: "Q" Key
    db $eb                                  ; [3]:
    db $80                                  ; [4]: "J" Key
    db $eb                                  ; [4]:
    db $90                                  ; [5]: "Jo" Key
    db $eb                                  ; [5]:
    db $a0                                  ; [6]: Ring of Elf
    db $eb                                  ; [6]:
    db $b0                                  ; [7]: Ring of Dworf
    db $eb                                  ; [7]:
    db $c0                                  ; [8]: Demon's Ring
    db $eb                                  ; [8]:


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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
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
    ; Maybe_ScreenReadyState to anything but 0x00 or 0xFF.
    ; It appears that at some point they simplified this, which
    ; makes all of this dead code.
    ;
  @LAB_PRG15_MIRROR__ebf4:                  ; [$ebf4]
    LDA Maybe_ScreenReadyState
    CMP #$01
    BEQ @LAB_PRG15_MIRROR__ec11
    CMP #$05
    BEQ @LAB_PRG15_MIRROR__ec11


    ;
    ; Ths code path should always be hit when this function is
    ; called.
    ;
    LDA Player_PosX_Block
    STA Maybe_Arg_CurrentSprite_PosX
    LDA Screen_Maybe_ScrollXCounter
    STA Unused_Sprite_ScrollPosX
    LDA Player_PosY
    STA Maybe_Arg_CurrentSprite_PosY
    LDA Player_Something_ScrollPosY
    STA Unused_Sprite_ScrollPosY
    JMP @LAB_PRG15_MIRROR__ec21


    ;
    ; This whole section seems unreachable.
    ; Maybe_ScreenReadyState
    ; should never reach these values. This may be dead code.
    ;
  @LAB_PRG15_MIRROR__ec11:                  ; [$ec11]
    LDA Maybe_PlayerX_ForScroll
    STA Maybe_Arg_CurrentSprite_PosX
    LDA PPU_ScrollScreenHoriz
    STA Unused_Sprite_ScrollPosX
    LDA Maybe_PlayerY_ForScroll
    STA Maybe_Arg_CurrentSprite_PosY
    LDA PPU_ScrollScreenVert
    STA Unused_Sprite_ScrollPosY

  @LAB_PRG15_MIRROR__ec21:                  ; [$ec21]
    JSR #$b9ed
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
    ADC #$ec49,X
    JSR Sprite_SetPlayerAppearanceAddr
    JMP FUN_PRG15_MIRROR__ec58

;
; XREFS:
;     Player_DrawBody
;
PLAYER_BODY_TILES:                          ; [$ec49]
    db $00                                  ; [0]:
    db $08                                  ; [1]:
    db $10                                  ; [2]:
    db $18                                  ; [3]:
    db $20                                  ; [4]:
    db $28                                  ; [5]:
    db $30                                  ; [6]:
    db $38                                  ; [7]:

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
    LDA #$eca2,Y
    JSR #$b880
    LDA Player_PosX_Block
    CLC
    ADC Temp_04
    STA Maybe_Arg_CurrentSprite_PosX
    LDA Player_PosX_Block
    ADC Temp_05
    CMP Player_PosX_Block
    BNE @_return
    LDA Player_PosY
    STA Maybe_Arg_CurrentSprite_PosY
    JSR #$b9ed
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
    LDA #$eca4,Y
    JMP Sprite_SetPlayerAppearanceAddr

  @_return:                                 ; [$eca1]
    RTS

;
; XREFS:
;     FUN_PRG15_MIRROR__ec58
;
BYTE_ARRAY_PRG15_MIRROR__eca2:              ; [$eca2]
    db $f8                                  ; [0]:

;
; XREFS:
;     FUN_PRG15_MIRROR__ec58
;
BYTE_ARRAY_PRG15_MIRROR__eca2_1_:           ; [$eca3]
    db $10                                  ; [1]:

;
; XREFS:
;     FUN_PRG15_MIRROR__ec58
;
BYTE_ARRAY_PRG15_MIRROR__eca4:              ; [$eca4]
    db $63                                  ; [0]:
    db $67                                  ; [1]:
    db $64                                  ; [2]:
    db $68                                  ; [3]:
    db $65                                  ; [4]:
    db $69                                  ; [5]:
    db $66                                  ; [6]:
    db $6a                                  ; [7]:

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
    LDA #$ecf3,X
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
    LDA #$ecef,X
    RTS

;
; XREFS:
;     Player_GetBodySpriteFrameOffset
;
BYTE_ARRAY_PRG15_MIRROR__ecef:              ; [$ecef]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:

;
; XREFS:
;     Player_GetBodySpriteFrameOffset
;
BYTE_ARRAY_PRG15_MIRROR__ecf3:              ; [$ecf3]
    db $04                                  ; [0]:
    db $05                                  ; [1]:
    db $06                                  ; [2]:


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
; weapon (if equipped) and then the shield (if equipped and not
; the Battle Helmet).
;
; The sprite will be flushed to the PPU immediately. This is done
; during screen setup, and differs from the normal behavior in
; Player_DrawSprite.
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
;     Player_DrawArmorTile
;     Player_DrawShieldTile
;     Player_DrawWeaponTile
;     Player_LoadArmorSprite
;     Player_LoadShieldSprite
;     Player_LoadWeaponSprite
;     PPUBuffer_Draw
;
; XREFS:
;     Screen_SetupNew
;============================================================================
Player_DrawSpriteImmediately:               ; [$ed12]
    ;
    ; Load and draw the player's sprite.
    ;
    JSR Player_LoadArmorSprite              ; Load the armor sprite
                                            ; information.

  @_drawArmorLoop:                          ; [$ed15]
    JSR Player_DrawArmorTile                ; Draw a tile of armor.
    JSR PPUBuffer_Draw                      ; Draw to the PPU.
    INC Player_DrawTileReadOffset           ; Increment the read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawArmorLoop                     ; If >= 0, loop.


    ;
    ; Load and draw the weapon sprite, if one is equipped.
    ;
    JSR Player_LoadWeaponSprite             ; Load the weapon sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Get the tile read offset.
    BMI @_loadShield                        ; If < 0, skip weapon drawing.


    ;
    ; The player has a weapon equipped. Draw the tiles.
    ;
  @_drawWeaponLoop:                         ; [$ed28]
    JSR Player_DrawWeaponTile               ; Draw a tile of the weapon.
    JSR PPUBuffer_Draw                      ; Draw to the PPU.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawWeaponLoop                    ; If >= 0, loop.


    ;
    ; Load and draw the shield sprite.
    ;
  @_loadShield:                             ; [$ed34]
    JSR Player_LoadShieldSprite             ; Load the shield sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Load the tile read offset.
    BMI @_return                            ; If < 0 (unset), return.

  @_drawShieldLoop:                         ; [$ed3b]
    JSR Player_DrawShieldTile               ; Draw a tile of the shield.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawShieldLoop                    ; If >= 0, loop.

  @_return:                                 ; [$ed44]
    RTS


;============================================================================
; Draw the player sprite.
;
; This will load the body/armor and draw it, followed by the
; weapon (if equipped) and then the shield (if equipped and not
; the Battle Helmet).
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
;     Player_DrawArmorTile
;     Player_DrawShieldTile
;     Player_DrawWeaponTile
;     Player_LoadArmorSprite
;     Player_LoadShieldSprite
;     Player_LoadWeaponSprite
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
    JSR Player_LoadArmorSprite              ; Load the armor sprite
                                            ; information.

  @_drawArmorLoop:                          ; [$ed48]
    JSR Player_DrawArmorTile                ; Draw a tile of armor.
    INC Player_DrawTileReadOffset           ; Increment the read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawArmorLoop                     ; If >= 0, loop.


    ;
    ; Load and draw the weapon sprite, if one is equipped.
    ;
    JSR Player_LoadWeaponSprite             ; Load the weapon sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Get the tile read offset.
    BMI @_loadShield                        ; If < 0, skip weapon drawing.


    ;
    ; The player has a weapon equipped. Draw the tiles.
    ;
  @_drawWeaponLoop:                         ; [$ed58]
    JSR Player_DrawWeaponTile               ; Draw a tile of the weapon.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawWeaponLoop                    ; If >= 0, loop.


    ;
    ; Load and draw the shield sprite.
    ;
  @_loadShield:                             ; [$ed61]
    JSR Player_LoadShieldSprite             ; Load the shield sprite
                                            ; information.
    LDA Player_DrawTileReadOffset           ; Load the tile read offset.
    BMI @_return                            ; If < 0 (unset), return.

  @_drawShieldLoop:                         ; [$ed68]
    JSR Player_DrawShieldTile               ; Draw a tile of the shield.
    INC Player_DrawTileReadOffset           ; Increment the tile read offset.
    DEC Temp_00                             ; Decrement the tile count.
    BPL @_drawShieldLoop                    ; If >= 0, loop.

  @_return:                                 ; [$ed71]
    RTS

;============================================================================
; TODO: Document Player_LoadArmorSprite
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadArmorSprite:                     ; [$ed72]
    LDA #$00
    STA Player_DrawTileReadOffset
    STA Player_SpriteSegmentPPUAddr_L
    STA Player_SpriteSegmentPPUAddr_U
    LDA a:SelectedArmor
    ASL A
    LDY a:SelectedShield
    CPY #$03
    BCS @_loadArmor


    ;
    ; There's a shield equipped, and the player isn't wielding
    ; the full Battle Suit + Battle Helmet. Set the index to be
    ; odd so we look up a sprite entry compatible with a shield.
    ;
    ORA #$01

  @_loadArmor:                              ; [$ed87]
    STA Player_ArmorLookupIndex
    TAX
    LDA #$ed95,X
    STA Temp_00
    TXA
    ASL A
    TAY
    JMP Player_LoadArmorSpriteTilesAddr

;
; XREFS:
;     Player_LoadArmorSprite
;
PLAYER_ARMOR_TILE_IDS:                      ; [$ed95]
    db $33                                  ; [0]: Leather Armor
    db $27                                  ; [1]: Leather Armor + Shield
    db $33                                  ; [2]: Studded Mail
    db $27                                  ; [3]: Studded Mail + Shield
    db $34                                  ; [4]: Full Plate
    db $28                                  ; [5]: Full Plate + Shield
    db $32                                  ; [6]: Battle Helmet
    db $32                                  ; [7]: Battle Helmet + Shield

;============================================================================
; TODO: Document Player_LoadWeaponSprite
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadWeaponSprite:                    ; [$ed9d]
    LDA #$00
    STA Player_DrawTileReadOffset
    LDA a:Player_CurWeapon
    CMP #$ff
    BNE @LAB_PRG15_MIRROR__edab


    ;
    ; No sword is equipped. Set the offset to 0xFF, to disable
    ; drawing.
    ;
    STA Player_DrawTileReadOffset
    RTS

  @LAB_PRG15_MIRROR__edab:                  ; [$edab]
    TAX
    LDA #$edc1,X
    STA Temp_00
    TXA
    ASL A
    TAY
    LDA #$edc5,Y
    STA Player_SpriteSegmentPPUAddr_L
    LDA #$edc6,Y
    STA Player_SpriteSegmentPPUAddr_U
    JMP Player_LoadWeaponSpriteTileAddrs

;
; XREFS:
;     Player_LoadWeaponSprite
;
PLAYER_WEAPON_TILE_COUNTS:                  ; [$edc1]
    db $02                                  ; [0]: Dagger
    db $05                                  ; [1]: Long Sword
    db $06                                  ; [2]: Giant Blade
    db $08                                  ; [3]: Dragon Slayer

;
; XREFS:
;     Player_LoadWeaponSprite
;
PLAYER_WEAPON_TILE_PPU_ADDRS:               ; [$edc5]
    dw $0380                                ; [0]: Dagger
    dw $0380                                ; [1]: Long Sword
    dw $0380                                ; [2]: Giant Blade
    dw $0340                                ; [3]: Dragon Slayer

;============================================================================
; TODO: Document Player_LoadShieldSprite
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawSprite
;     Player_DrawSpriteImmediately
;============================================================================
Player_LoadShieldSprite:                    ; [$edcd]
    LDA #$00
    STA Player_DrawTileReadOffset
    LDA a:SelectedShield
    CMP #$03
    BCC @LAB_PRG15_MIRROR__eddb


    ;
    ; This is the Battle Helmet or there's no helmet equipped.
    ; In either case, set the loaded value as the result.
    ;
    STA Player_DrawTileReadOffset
    RTS

  @LAB_PRG15_MIRROR__eddb:                  ; [$eddb]
    ASL A
    TAY
    LDA #$05
    STA Temp_00
    LDA #$00
    STA Player_SpriteSegmentPPUAddr_L
    LDA #$03
    STA Player_SpriteSegmentPPUAddr_U
    JMP Player_LoadShieldSpriteTileAddrs


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
;     Player_LoadArmorSprite
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
    LDA a:ROMBankStart                      ; Load the lower byte of the
                                            ; address of the armor index.
    STA Player_SpriteTileReadAddr_L         ; Set as the lower byte.
    LDA a:#$8001                            ; Load the upper byte.
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
;     Player_LoadWeaponSprite
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
    LDA a:#$8002                            ; Load the lower byte of the
                                            ; address of the weapon index.
    STA Player_SpriteTileReadAddr_L         ; Set as the lower byte.
    LDA a:#$8003                            ; Load the upper byte.
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
;     Player_LoadShieldSprite
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
    LDA a:#$800c                            ; Load the lower byte of the
                                            ; address of the shield index.
    STA Player_SpriteTileReadAddr_L         ; Set as the lower byte.
    LDA a:#$800d                            ; Load the upper byte.
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
;     #$e9:
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
Player_DrawShieldTile:                      ; [$ee93]
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
    LDA a:USHORT_800a                       ; Load the lower byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address to read from.
    LDA a:USHORT_800a+1                     ; Load the upper byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address to read from.


    ;
    ; Draw the shield tile.
    ;
    JMP Player_DrawSpriteTile               ; Draw the tile.


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
;     #$e9:
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
Player_DrawArmorTile:                       ; [$eea9]
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
    LDA a:USHORT_8004                       ; Load the lower byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address to read from.
    LDA a:USHORT_8004+1                     ; Load the upper byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_U                         ; Store as the upper byte of the
                                            ; address to read from.


    ;
    ; Draw the armor tile.
    ;
    JMP Player_DrawSpriteTile               ; Draw the tile.


;============================================================================
; Load a tile of the player's weapon into the PPU.
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
;     #$e9:
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
Player_DrawWeaponTile:                      ; [$eebf]
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
    LDA a:EOLIS_BLOCKS                      ; Load the lower byte of the tile
                                            ; IDs start address.
    STA Temp_Addr_L                         ; Store as the lower byte of the
                                            ; address to read from.
    LDA a:#$8007                            ; Load the upper byte of the tile
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
    ;     Player_DrawArmorTile
    ;     Player_DrawShieldTile
    ;
Player_DrawSpriteTile:                      ; [$eed2]
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
    STA a:PPU_TargetAddr.U                  ; Store as the upper byte to
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
    LDA #$ef64,Y                            ; Load the lower byte of the
                                            ; handler address.
    PHA                                     ; Push it to the stack.
    LDA #$ef63,Y                            ; Load the upper byte.
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
    db $68                                  ; [0]: Handle pushable block on
                                            ; path to Mascon.

;
; XREFS:
;     GameLoop_RunScreenEventHandlers
;
SPECIAL_SCREEN_EVENT_LOOKUP_TABLE_0__1:     ; [$ef64]
    db $ef                                  ; [0]:
    db $9d                                  ; [1]: Handle a standard boss
                                            ; battle.
    db $ef                                  ; [1]:
    db $d3                                  ; [2]: Handle end-game sequence
                                            ; after killing the final boss.
    db $ef                                  ; [2]:


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

  @LAB_PRG15_MIRROR__ef8c:                  ; [$ef8c]
    LDA CurrentSprites_Entities,X
    CMP #$ff
    BEQ @LAB_PRG15_MIRROR__ef99
    CMP Temp_00
    BEQ @LAB_PRG15_MIRROR__ef99
    SEC
    RTS

  @LAB_PRG15_MIRROR__ef99:                  ; [$ef99]
    DEX
    BPL @LAB_PRG15_MIRROR__ef8c
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
;     CurrentMusic:
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
    STA CurrentMusic                        ; Set the music to the boss
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
    STA CurrentMusic                        ; Set it as the current music.
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
;     CurrentMusic:
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
    STA CurrentMusic                        ; Set as the current music.


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
    LDA #$b544,Y                            ; Load the category for the
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
; TODO: Document Sprite_SetPortraitAppearanceAddr
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================
Sprite_SetPortraitAppearanceAddr:           ; [$f01b]
    TAY
    LDA a:CurrentROMBank
    PHA
    LDX #$07
    JSR MMC1_UpdateROMBank


    ;
    ; Load the address to load sprite images from.
    ;
    ; With the addresses stored in PORTRAIT_APPEARANCES_OFFSET
    ; and
    ; PRG7::800b, this should put us at a starting
    ; point of {@address PRG7::AFD5}, or {@address PRG7::B0D5} if offset
    ; overflowed.
    ;
    TYA
    ASL A
    TAY
    PHP
    LDA a:USHORT_800a
    STA Temp_Addr_L
    LDA a:USHORT_800a+1
    PLP
    ADC #$80
    STA Temp_Addr_U
    JMP Sprite_Draw

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
    ; PRG7::8009, this should put us at a starting
    ; point of {@address PRG7::A9F1}, or {@address PRG7::AAF1} if offset
    ; overflowed.
    ;
    ASL A
    TAY
    PHP
    LDA a:#$8008
    STA Temp_Addr_L
    LDA a:#$8009
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
    TYA                                     ; A = Y (restore offset)


    ;
    ; Load the address to load sprite images from.
    ;
    ; With the addresses stored in SPRITE_APPEARANCES_OFFSET
    ; and
    ; PRG7::8007, this should put us at a starting
    ; point of {@address PRG7::9036}, or {@address PRG7::9136} if offset
    ; overflowed.
    ;
    ASL A                                   ; Multiply offset by 2, to get
                                            ; word boundaries in the lookup
                                            ; table.
    TAY                                     ; Y = A (updated offset)
    PHP                                     ; Push flags and stack pointer.
    LDA a:EOLIS_BLOCKS                      ; Load the lower byte of the
                                            ; address to read from.
    STA Temp_Addr_L                         ; Store it for processing.
    LDA a:#$8007                            ; Load the upper byte.
    PLP                                     ; Pop the flags and stack
                                            ; pointer.
    ADC #$80                                ; Add 0x80 + carry to the upper
                                            ; byte.
    STA Temp_Addr_U                         ; Store it.

    ;
    ; v-- Fall through --v
    ;
;============================================================================
; TODO: Document Sprite_Draw
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_SetPlayerAppearanceAddr
;     Sprite_SetPortraitAppearanceAddr
;============================================================================
Sprite_Draw:                                ; [$f072]
    ;
    ; Load the offset within our starting address stored in
    ; Temp_Addr_L.
    ;
    LDA (Temp_Addr_L),Y                     ; Load the offset for the lower
                                            ; byte.
    STA Maybe_Temp_Sprite_L                 ; Store it.
    INY                                     ; Y++ (offset)
    LDA (Temp_Addr_L),Y                     ; Load the upper byte.
    ADC #$80                                ; Add 0x80 + carry to it.
    STA Maybe_Temp_Sprite_U                 ; Store it.


    ;
    ; Load a byte from that offset. The upper nibble will be
    ; stored at Temp_Sprites_RowsRemaining and the lower nibble
    ; will be in
    ; Temp_Sprites_ColsRemaining.
    ;
    LDY #$00                                ; Y = 0
    LDA (Maybe_Temp_Sprite_L),Y             ; Load the value at that address.
    AND #$0f                                ; Discard the upper nibble.
    STA Temp_Sprites_ColsRemaining          ; Store it.
    LDA (Maybe_Temp_Sprite_L),Y             ; Load it again.
    LSR A                                   ; Move upper nibble to lower.
    LSR A
    LSR A
    LSR A
    STA Temp_Sprites_RowsRemaining          ; Store it.


    ;
    ; Initialize Something_SpriteData_X and
    ; Something_SpriteData_Y to 0.
    ;
    LDA #$00                                ; A = 0
    STA Something_SpriteData_X              ; Set to 0.
    STA Something_SpriteData_Y              ; Set to 0.


    ;
    ; Load a byte from the next offset.
    ;
    INY                                     ; Y++
    LDA (Maybe_Temp_Sprite_L),Y             ; Load the byte at the next
                                            ; offset.
    BPL @LAB_PRG15_MIRROR__f09a
    DEC Something_SpriteData_X              ; Set to 0xFF.

  @LAB_PRG15_MIRROR__f09a:                  ; [$f09a]
    CLC
    ADC Maybe_Arg_CurrentSprite_PosX        ; Add the loaded value to
                                            ; Maybe_Arg_CurrentSprite_PosX.
    STA Temp_Sprites_NormXPos               ; Store it.


    ;
    ; Calculate the new value for Something_SpriteData_X.
    ;
    LDA #$00                                ; A = 0
    ADC Something_SpriteData_X              ; Add our stored value.
    STA Something_SpriteData_X              ; Store it back out.
    LDA Temp_Sprites_NormXPos
    SEC
    SBC PPU_ScrollX
    STA Temp_Sprites_NormXPos


    ;
    ; Load a byte from the next offset.
    ;
    INY
    LDA (Maybe_Temp_Sprite_L),Y
    BPL @LAB_PRG15_MIRROR__f0b3
    DEC Something_SpriteData_Y              ; Set to 0xFF

  @LAB_PRG15_MIRROR__f0b3:                  ; [$f0b3]
    CLC
    ADC Maybe_Arg_CurrentSprite_PosY
    STA Temp_Sprites_NormYPos
    LDA #$00
    ADC Something_SpriteData_Y
    STA Something_SpriteData_Y
    LDA Temp_Sprites_NormYPos
    CLC
    ADC #$20
    STA Temp_Sprites_NormYPos


    ;
    ; Calculate the new value for Something_SpriteData_Y.
    ;
    LDA Something_SpriteData_Y
    ADC #$00
    STA Something_SpriteData_Y


    ;
    ; Set a new start address for the next sprite based on the
    ; next byte in the series.
    ;
    INY                                     ; Y++
    LDA (Maybe_Temp_Sprite_L),Y             ; Load the next byte.
    STA Temp_Addr_L                         ; Store that as the new start
                                            ; offset.


    ;
    ; Advance our start read address for this sprite to skip the 4
    ; bytes we just read.
    ;
    LDA Maybe_Temp_Sprite_L
    CLC
    ADC #$04                                ; Advance by 4.
    STA Maybe_Temp_Sprite_L                 ; Set as the new lower byte of
                                            ; the address.
    LDA Maybe_Temp_Sprite_U                 ; Load the upper byte.
    ADC #$00                                ; Add the carry, if lower
                                            ; overflowed.
    STA Maybe_Temp_Sprite_U                 ; Set it.


    ;
    ; We'll continue on based on whether the sprite is flipped.
    ;
    LDA CurrentSprite_FlipMask
    AND #$c0
    STA CurrentSprite_FlipMask
    LDA CurrentSprite_FlipMask
    AND #$40
    BEQ Sprite_Draw_Standard
    JMP Sprite_Draw_FlippedHoriz
;============================================================================
; TODO: Document Sprite_Draw_Standard
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
    LDA (Maybe_Temp_Sprite_L),Y             ; Load the value at the sprite
                                            ; data read address.
    CMP #$ff                                ; Is it 0xFF?
    BEQ @_prepareNextCol                    ; If so, skip this.


    ;
    ; It's not unset.
    ;
    ; Begin checking if we can add to the screen buffer.
    ;
    ; First we'll check if we can add sprites, or if the slots
    ; are full.
    ;
    LDA Sprites_SlotsFull                   ; Can we add sprites this frame?
    BNE @_endColLoop                        ; If not, jump.


    ;
    ; We can add sprites.
    ;
    ; Check if this sprite would fit on screen.
    ;
    LDX Temp_Sprites_TileXOffset            ; X = tile X offset.
    LDA Temp_Sprites_NormXPos               ; A = normalized X position.
    ADC #$f23d,X                            ; A += the offset from the lookup
                                            ; table at X.
    STA Temp_00                             ; Store it temporarily.
    LDA Something_SpriteData_X              ; Load the default X position.
    ADC #$00                                ; Add carry (from overflow), if
                                            ; set.
    BNE @_endColLoop                        ; If it doesn't fit on screen,
                                            ; jump.


    ;
    ; X could fit on screen. Check Y.
    ;
    LDX Temp_Sprites_TileYOffset            ; X = tile Y offset.
    LDA Temp_Sprites_NormYPos               ; A = normalized Y position.
    ADC #$f23d,X                            ; A += the offset from the lookup
                                            ; table at X.
    STA Temp_01                             ; Store it temporarily.
    LDA Something_SpriteData_Y              ; Load the default Y position.
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
    ; Write the sprite Y position.
    ;
    TAX
    LDA Temp_01
    STA SPRITE_0_RANGE_1_START,X


    ;
    ; Write the sprite tile ID.
    ;
    INX
    LDA (Maybe_Temp_Sprite_L),Y
    CLC
    ADC Sprites_PPUOffset
    STA SPRITE_0_RANGE_1_START,X


    ;
    ; Write the sprite attributes.
    ;
    INX
    INY
    LDA (Maybe_Temp_Sprite_L),Y
    EOR CurrentSprite_FlipMask
    STA Temp_01
    LDA Temp_Sprites_TileXOffset
    AND #$01
    TAY
    LDA MovingSpriteVisibility
    AND #$f224,Y
    BEQ @_setSpritePriority


    ;
    ; Set the sprite to be a background sprite.
    ;
    LDA Temp_01
    ORA #$20
    STA Temp_01

  @_setSpritePriority:                      ; [$f151]
    LDA Temp_01                             ; Load the first to store.
    STA SPRITE_0_RANGE_1_START,X            ; Store it in the screen buffer
                                            ; at X.


    ;
    ; Write the sprite Y position.
    ;
    INX                                     ; X++
    LDA Temp_00                             ; Load the second to store.
    STA SPRITE_0_RANGE_1_START,X            ; Store it in the screen buffer
                                            ; at X.
    JSR Sprites_IncNextSpriteSlot           ; Finish up with this sprite's
                                            ; state.
    PLA                                     ; Pull A (loop counter) from
                                            ; stack.
    TAY                                     ; Y = A

  @_endColLoop:                             ; [$f161]
    INY

  @_prepareNextCol:                         ; [$f162]
    INY
    INC Temp_Sprites_TileXOffset
    DEC Temp_Sprites_ColsRemaining
    BPL @_drawColLoop
    PLA
    STA Temp_Sprites_ColsRemaining
    INC Temp_Sprites_TileYOffset
    DEC Temp_Sprites_RowsRemaining
    BMI Sprite_Draw_Finish
    JMP @_drawRowLoop

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
    STA Temp_05
    LDY Temp_Sprites_ColsRemaining
    INY
    TYA
    ASL A
    ASL A
    ASL A
    STA Temp_04
    LDA Temp_Addr_L
    ASL A
    SEC
    SBC Temp_04
    BPL @LAB_PRG15_MIRROR__f198
    DEC Temp_05

  @LAB_PRG15_MIRROR__f198:                  ; [$f198]
    CLC
    ADC Temp_Sprites_NormXPos
    STA Temp_Sprites_NormXPos
    LDA Something_SpriteData_X
    ADC Temp_05
    STA Something_SpriteData_X
    LDA #$00
    STA Temp_Sprites_TileYOffset
    TAY

  @LAB_PRG15_MIRROR__f1a8:                  ; [$f1a8]
    LDA Temp_Sprites_ColsRemaining
    STA Temp_Sprites_TileXOffset

  @LAB_PRG15_MIRROR__f1ac:                  ; [$f1ac]
    LDA (Maybe_Temp_Sprite_L),Y
    CMP #$ff
    BEQ @LAB_PRG15_MIRROR__f216
    LDA Sprites_SlotsFull
    BNE @LAB_PRG15_MIRROR__f215
    LDX Temp_Sprites_TileXOffset
    LDA Temp_Sprites_NormXPos
    ADC #$f23d,X
    STA Temp_00
    LDA Something_SpriteData_X
    ADC #$00
    BNE @LAB_PRG15_MIRROR__f215
    LDX Temp_Sprites_TileYOffset
    LDA Temp_Sprites_NormYPos
    ADC #$f23d,X
    STA Temp_01
    LDA Something_SpriteData_Y
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
    LDA (Maybe_Temp_Sprite_L),Y
    CLC
    ADC Sprites_PPUOffset
    STA SPRITE_0_RANGE_1_START,X
    INX
    INY
    LDA (Maybe_Temp_Sprite_L),Y
    EOR CurrentSprite_FlipMask
    STA Temp_01
    LDA Temp_Sprites_TileXOffset
    AND #$01
    TAY
    LDA MovingSpriteVisibility
    AND #$f226,Y
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
BYTE_ARRAY_PRG15_MIRROR__f224:              ; [$f224]
    db $01                                  ; [0]:
    db $02                                  ; [1]:

;
; XREFS:
;     Sprite_Draw_FlippedHoriz
;
BYTE_ARRAY_PRG15_MIRROR__f226:              ; [$f226]
    db $02                                  ; [0]:
    db $01                                  ; [1]:


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
SPRITE_TILE_OFFSETS:                        ; [$f23d]
    db $00                                  ; [0]:
    db $08                                  ; [1]:
    db $10                                  ; [2]:
    db $18                                  ; [3]:
    db $20                                  ; [4]:
    db $28                                  ; [5]:
    db $30                                  ; [6]:
    db $38                                  ; [7]:
    db $40                                  ; [8]:
    db $48                                  ; [9]:
    db $50                                  ; [10]:
    db $58                                  ; [11]:
    db $60                                  ; [12]:
    db $68                                  ; [13]:
    db $70                                  ; [14]:
    db $78                                  ; [15]:

;============================================================================
; TODO: Document IScripts_ShowPortraitImage
;
; INPUTS:
;     A
;
; OUTPUTS:
;     Y
;
; XREFS:
;     IScripts_Begin
;============================================================================
IScripts_ShowPortraitImage:                 ; [$f24d]
    STA a:IScript_PortraitID
    TAX
    BMI @_return
    JSR FUN_PRG15_MIRROR__f2e3
    JSR Game_WaitForOAMReset
    LDA a:Palette_SpritePaletteIndex
    STA a:Palette_SavedIndex
    LDA #$02
    JSR Screen_LoadSpritePalette
    JSR PPUBuffer_WritePalette
    LDA #$09
    STA PPU_TargetAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDY #$00

  @LAB_PRG15_MIRROR__f271:                  ; [$f271]
    TYA
    PHA
    JSR IScripts_Maybe_DrawSpriteToPPU
    BCS @LAB_PRG15_MIRROR__f27e
    PLA
    TAY
    INY
    BNE @LAB_PRG15_MIRROR__f271

  @_return:                                 ; [$f27d]
    RTS

  @LAB_PRG15_MIRROR__f27e:                  ; [$f27e]
    PLA
    TAY
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
    STA a:IScript_PortraitID
    JSR Game_WaitForOAMReset
    LDA a:Palette_SavedIndex
    JSR Screen_LoadSpritePalette
    JSR PPUBuffer_WritePalette


    ;
    ; Switch to bank 14 and run
    ; GameLoop_LoadSpriteImages
    ; (from bank 15).
    ;
    JSR MMC1_LoadBankAndJump
    db BANK_14_LOGIC                        ; Bank = 14 Address =
                                            ; GameLoop_LoadSpriteImages
    dw GameLoop_LoadSpriteImages-1          ; GameLoop_LoadSpriteImages
                                            ; [$PRG15_MIRROR::f296]

  @_afterFarJump:                           ; [$f298]
    RTS

    ;
    ; XREFS:
    ;     IScripts_DrawPortraitAnimationFrame
    ;
POP_RETURN_F299:                            ; [$f299]
    PLA
    RTS

;============================================================================
; TODO: Document IScripts_DrawPortraitAnimationFrame
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;============================================================================
IScripts_DrawPortraitAnimationFrame:        ; [$f29b]
    PHA
    LDA a:IScript_PortraitID
    BMI POP_RETURN_F299
    LDA #$00
    STA CurrentSprite_FlipMask


    ;
    ; Update the general portrait image.
    ;
    LDA #$90
    STA Sprites_PPUOffset
    JSR IScripts_GetPortraitOffset
    JSR Sprite_SetPortraitAppearanceAddr


    ;
    ; Update the eye animation.
    ;
    LDA #$90
    STA Sprites_PPUOffset
    PLA
    PHA
    AND #$01
    TAX
    JSR IScripts_GetPortraitOffset
    CLC
    ADC #$f2df,X
    JSR Sprite_SetPortraitAppearanceAddr


    ;
    ; Update the mouth animation.
    ;
    LDA #$90
    STA Sprites_PPUOffset
    PLA
    LSR A
    AND #$01
    TAX
    JSR IScripts_GetPortraitOffset
    CLC
    ADC #$f2e1,X
    JMP Sprite_SetPortraitAppearanceAddr

;============================================================================
; TODO: Document IScripts_GetPortraitOffset
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================
IScripts_GetPortraitOffset:                 ; [$f2d5]
    LDA a:IScript_PortraitID
    ASL A
    ASL A
    CLC
    ADC a:IScript_PortraitID
    RTS

;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;
BYTE_ARRAY_PRG15_MIRROR__f2df:              ; [$f2df]
    db $01                                  ; [0]:
    db $02                                  ; [1]:

;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;
BYTE_ARRAY_PRG15_MIRROR__f2e1:              ; [$f2e1]
    db $03                                  ; [0]:
    db $04                                  ; [1]:

;============================================================================
; TODO: Document FUN_PRG15_MIRROR__f2e3
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_ShowPortraitImage
;============================================================================
FUN_PRG15_MIRROR__f2e3:                     ; [$f2e3]
    LDA a:CurrentROMBank
    PHA
    LDX #$08
    JSR MMC1_UpdateROMBank
    LDA a:IScript_PortraitID
    ASL A
    TAY
    LDA a:#$800e
    STA Temp_Addr_L
    LDA a:#$800f
    CLC
    ADC #$80
    STA Temp_Addr_U
    LDA (Temp_Addr_L),Y
    PHA
    INY
    LDA (Temp_Addr_L),Y
    CLC
    ADC #$80
    STA Temp_Addr_U
    PLA
    STA Temp_Addr_L
    JMP MMC1_UpdatePRGBankToStackA

    ;
    ; XREFS:
    ;     IScripts_Maybe_DrawSpriteToPPU
    ;
LABEL_F30F:                                 ; [$f30f]
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    SEC
    RTS

;============================================================================
; TODO: Document IScripts_Maybe_DrawSpriteToPPU
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     IScripts_ShowPortraitImage
;============================================================================
IScripts_Maybe_DrawSpriteToPPU:             ; [$f316]
    LDA a:CurrentROMBank
    PHA
    LDX #$08
    JSR MMC1_UpdateROMBank
    LDA (Temp_Addr_L),Y
    CMP #$ff
    BEQ LABEL_F30F
    LDA #$00
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
    ADC a:#$8010
    STA Temp_04
    LDA Temp_05
    ADC a:#$8011
    CLC
    ADC #$80
    STA Temp_05
    LDA #$10
    JSR PPUBuffer_QueueCommandOrLength
    LDY #$00

  @LAB_PRG15_MIRROR__f34e:                  ; [$f34e]
    LDA (Temp_04),Y
    STA PPUBuffer,X
    INX
    INY
    CPY #$10
    BCC @LAB_PRG15_MIRROR__f34e
    STX PPUBuffer_WriteOffset
    LDA PPU_TargetAddr
    CLC
    ADC #$10
    STA PPU_TargetAddr
    LDA PPU_TargetAddr.U
    ADC #$00
    STA PPU_TargetAddr.U
    PLA
    TAX
    JSR MMC1_UpdateROMBank
    CLC
    RTS


;============================================================================
; Play a sound effect.
;
; This may set the sound effect as the current one or
; it may set it as the next one, depending on the
; priority level of the sound effect.
;
; A lower number in SOUND_PRIORITIES is a higher
; priority.
;
; INPUTS:
;     A:
;         The ID of the sound effect to set.
;
;     CurrentSoundIndex:
;         The currently-played sound effect.
;
;     SOUND_PRIORITIES:
;         The table of sound effect priorities.
;
; OUTPUTS:
;     CurrentSoundIndex:
;         The new value for the current sound ID, if set.
;
;     NextSoundEffect:
;         The new value for the next sound effect, if set.
;
; XREFS:
;     Sound_PlayEffect
;============================================================================
PlaySoundInner:                             ; [$f36f]
    CMP #$1d                                ; Length of sound IDs array
    BCS @_return                            ; Is this under the length?


    ;
    ; XXX Check if we're playing a sound effect in this
    ; table, or playing something else?
    ;
    TAX                                     ; X = new sound ID
    LDY a:CurrentSoundIndex                 ; Y = current sound ID
    LDA #$f388,Y                            ; A = Sound type for current
                                            ; sound from map
    CMP #$f388,X                            ; Is this already the current
                                            ; sound?
    BEQ @_queueNext                         ; If yes, then jump
    BCC @_queueNext                         ; If less than, then jump.
    STX a:CurrentSoundIndex                 ; Set as the current sound.
    RTS

  @_queueNext:                              ; [$f385]
    STX NextSoundEffect                     ; Queue this up as the next
                                            ; effect.

  @_return:                                 ; [$f387]
    RTS


;============================================================================
; Table of sound effect priorities, indexed by sound ID.
;
; XREFS:
;     PlaySoundInner
;============================================================================

;
; XREFS:
;     PlaySoundInner
;
SOUND_PRIORITIES:                           ; [$f388]
    db $00                                  ; [0]:
    db $08                                  ; [1]:
    db $15                                  ; [2]: Hit enemy with weapon
    db $14                                  ; [3]: Enemy is dead
    db $04                                  ; [4]: Player hit
    db $19                                  ; [5]: Magic
    db $0b                                  ; [6]: Open door
    db $0d                                  ; [7]:
    db $10                                  ; [8]: Item picked up
    db $11                                  ; [9]: Touched coin
    db $17                                  ; [10]: Cast magic hit an
                                            ; obstacle
    db $09                                  ; [11]: Cursor moved
    db $13                                  ; [12]: Text input
    db $0a                                  ; [13]:
    db $07                                  ; [14]: Password character
                                            ; entered
    db $0c                                  ; [15]: Block pushed
    db $12                                  ; [16]: Coin dropped
    db $0f                                  ; [17]:
    db $0e                                  ; [18]:
    db $06                                  ; [19]: Filling HP or MP
    db $18                                  ; [20]: Tilte magic cast
    db $04                                  ; [21]: Player taking step
    db $01                                  ; [22]:
    db $02                                  ; [23]:
    db $03                                  ; [24]:
    db $05                                  ; [25]: Gold changed
    db $03                                  ; [26]: Item used
    db $10                                  ; [27]: Touched meat
    db $02                                  ; [28]:


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
    STA Temp_Int24.M
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
    INC Temp_Int24.M

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
;     FUN_PRG15_MIRROR__f2e3
;     GameLoop_LoadSpriteInfo
;     Game_DrawScreenInFrozenState
;     Sprites_LoadSpriteValue
;     TextBox_LoadAndShowMessage
;     TextBox_LoadItemSourceTiles
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowNextChar
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
;     Maybe_MessageCharPos:
;         The starting message character position (0).
;
;     #$0219:
;     Message_StartAddr:
;         The address of the start of the message string.
;
;     #$e9:
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
    STX Temp_Int24.M


    ;
    ; Set the start of our message length for the
    ; string scan.
    ;
    LDY #$00                                ; Y = 0 (start of our lookup
                                            ; offset)
    STY a:Maybe_MessageCharPos              ; Set start character pos to 0


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
    INC Temp_Int24.M                        ; Y is 0. Increment upper byte
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
    LDA Temp_Int24.M                        ; Load the new upper byte of the
                                            ; string position.
    STA a:Message_StartAddr.U               ; Store it.


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
;     #$e9:
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
    STA PPU_TargetAddr.U                    ; Store it.
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
;     Maybe_MessageCharPos:
;         The current message character position.
;
; OUTPUTS:
;     Maybe_MessageCharPos:
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
    INC a:Maybe_MessageCharPos              ; Increment the next character
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
    LDA a:Maybe_MessageCharPos              ; Load the character position to
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
    LDA #$f649,X                            ; Look up the string.
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
    LDA a:Message_StartAddr.U
    STA Temp_Int24.M
    LDY a:Message_ProcessedLength
    INC a:Message_ProcessedLength
    BNE @LAB_PRG15_MIRROR__f4dd
    INC a:Message_StartAddr.U

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
    JSR TextBox_Maybe_WriteLineOfChars

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
    LDA a:Message_StartAddr.U
    STA Temp_Int24.M
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
;     #$0219:
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
;     #$ed:
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
    LDA a:Message_StartAddr.U               ; Load the upper byte.
    STA Temp_Int24.M                        ; Store it.


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
    LDA #$f649,X                            ; Load the title string at X.
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
    STA PPU_TargetAddr.U                    ; Store as the upper byte of the
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
;     #$e9:
;         The PPU target address to write to.
;
;     Temp_Int24:
;     #$ed:
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
TextBox_Maybe_WriteLineOfChars:             ; [$f5f3]
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
    STX Temp_Int24.M                        ; Set middle byte of string
                                            ; address to 0.
    ASL A                                   ; A = A * 8 (each glyph is 8
                                            ; bytes)
    ASL A
    ROL Temp_Int24.M                        ; Rotate upper byte left and add
                                            ; carry.
    ASL A
    ROL Temp_Int24.M
    ADC #$00
    STA Temp_Int24


    ;
    ; Make the address relative to $8000.
    ;
    LDA Temp_Int24.M                        ; Load the upper byte of of the
                                            ; address.
    ADC #$80                                ; Add 0x80 to it.
    STA Temp_Int24.M                        ; Store it back.


    ;
    ; Compute the PPU target address.
    ;
    LDA #$00                                ; A = 0
    STA PPU_TargetAddr.U                    ; Store as the starting upper
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
    STA PPU_TargetAddr.U                    ; Set as the new upper byte of
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
;     TextBox_Maybe_WriteLineOfChars
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
    db "Novice          "                   ; [$f649] char
    db "Aspirant        "                   ; [$f659] char
    db "Battler         "                   ; [$f669] char
    db "Fighter         "                   ; [$f679] char
    db "Adept           "                   ; [$f689] char
    db "Chevalier       "                   ; [$f699] char
    db "Veteran         "                   ; [$f6a9] char
    db "Warrior         "                   ; [$f6b9] char
    db "Swordman        "                   ; [$f6c9] char
    db "Hero            "                   ; [$f6d9] char
    db "Soldier         "                   ; [$f6e9] char
    db "Myrmidon        "                   ; [$f6f9] char
    db "Champion        "                   ; [$f709] char
    db "Superhero       "                   ; [$f719] char
    db "Paladin         "                   ; [$f729] char
    db "Lord            "                   ; [$f739] char


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
    dw $03e8                                ; [0]: Aspirant (1,000 exp)

;
; XREFS:
;     PlayerMenu_ShowStatusMenu
;
PLAYER_TITLE_EXP_NEEDED_1_:                 ; [$f74b]
    dw $0898                                ; [1]: Battler (2,200 exp)
    dw $0dac                                ; [2]: Fighter (3,500 exp)
    dw $12c0                                ; [3]: Adept (4,800 exp)
    dw $1838                                ; [4]: Chevalier (6,200 exp)
    dw $1f40                                ; [5]: Veteran (8,000 exp)
    dw $2710                                ; [6]: Warrior (10,000 exp)
    dw $30d4                                ; [7]: Swordman (12,500 exp)
    dw $3a98                                ; [8]: Hero (15,000 exp)
    dw $4650                                ; [9]: Soldier (18,000 exp)
    dw $55f0                                ; [10]: Myrmidon (22,000 exp)
    dw $6590                                ; [11]: Champion (26,000 exp)
    dw $7530                                ; [12]: Superhero (30,000 exp)
    dw $88b8                                ; [13]: Paladin (35,000 exp)
    dw $afc8                                ; [14]: Lord (45,000 exp)


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
    dw $01f4                                ; [0]:
    dw $0320                                ; [1]:
    dw $04b0                                ; [2]:
    dw $0640                                ; [3]:
    dw $0834                                ; [4]:
    dw $0af0                                ; [5]:
    dw $0dac                                ; [6]:
    dw $10cc                                ; [7]:
    dw $1450                                ; [8]:
    dw $1838                                ; [9]:
    dw $1d4c                                ; [10]:
    dw $2328                                ; [11]:
    dw $2904                                ; [12]:
    dw $32c8                                ; [13]:
    dw $3a98                                ; [14]:


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
    LDA #$81,X
    STA Temp_Int24.M
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
;     #$e9:
;         The target address to draw to.
;
; XREFS:
;     IScriptAction_AddInventoryItem_ClearTextBox
;     IScripts_FillPlaceholderText
;     PlayerMenu_ShowStatusMenu
;     PlayerMenu_ShowSubmenu
;     TextBox_Close
;     TextBox_DrawItemImage
;     TextBox_DrawItemName
;     TextBox_DrawStringLines
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
    STA PPU_TargetAddr.U                    ; Store as the PPU target
                                            ; address.
    LDA a:TextBox_ContentsY                 ; Load the text Y position.
    ASL A                                   ; A = A * 16
    ASL A
    ASL A
    ASL A
    ROL PPU_TargetAddr.U                    ; Rotate the upper byte of the
                                            ; target address left.
    ASL A                                   ; A << 1
    ROL PPU_TargetAddr.U                    ; Rotate the upper byte of the
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
;     #$e9:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     #$e9:
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
;     #$e9:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     #$e9:
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
;     #$e9:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     #$e9:
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
;     #$e9:
;         The existing PPU target address.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     #$e9:
;         The updated PPU target address.
;
; XREFS:
;     TextBox_DrawStringLines
;     PPU_IncrementAddrBy16
;     PPU_IncrementAddrBy8
;============================================================================
PPU_IncrementAddrBy:                        ; [$f828]
    CLC
    ADC PPU_TargetAddr                      ; A += PPU_TargetAddr
    BCC @_storeAndReturn                    ; If it overflowed, jump. No need
                                            ; to increment the upper byte.
    INC PPU_TargetAddr.U                    ; Else, increment the upper byte
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
    STA Temp_Int24.M                        ; Middle byte of
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
    STA Temp_Int24.U                        ; Upper byte of
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
    LDA Temp_Int24.U                        ; A = upper byte of
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
    STA Temp_Int24.U                        ; Upper byte of
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
    LDA Temp_Int24.U                        ; A = upper byte of
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
    LDA PPU_TargetAddr.U
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
    INC IScriptOrCHRAddr.U

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
    db $41                                  ; [0]: 0x2041 -- "M" (Magic)

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_SYMBOL_PPU_ADDR_L_1_:             ; [$f8cc]
    db $61                                  ; [1]: 0x2061 -- "P" (Power)
    db $6e                                  ; [2]: 0x206E -- "G" (Gold)
    db $4e                                  ; [3]: 0x204E -- "E" (Experience)
    db $56                                  ; [4]: 0x2056 -- "T" (Time)
    db $5b                                  ; [5]: 0x205B -- Top-left of "["
                                            ; (Selected item)
    db $7b                                  ; [6]: 0x207B -- Bottom-left of
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
    db $1c                                  ; [0]: "M" (Magic)

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_TILES_1_:                         ; [$f8d3]
    db $0a                                  ; [1]: ":"

;
; XREFS:
;     UI_DrawHUDSprites
;
UI_STATUS_TILES_2_:                         ; [$f8d4]
    db $00                                  ; [2]:
    db $1f                                  ; [3]: "P" (Power)
    db $0a                                  ; [4]: ":"
    db $00                                  ; [5]:
    db $16                                  ; [6]: "G" (Gold)
    db $3a                                  ; [7]: ":"
    db $00                                  ; [8]:
    db $14                                  ; [9]: "E" (Experience)
    db $3a                                  ; [10]: ":"
    db $00                                  ; [11]:
    db $23                                  ; [12]: "T" (Time)
    db $3a                                  ; [13]: ":"
    db $00                                  ; [14]:
    db $2c                                  ; [15]: Top of "[" (current item)
    db $3c                                  ; [16]: <blank space>
    db $3d                                  ; [17]: <blank space>
    db $2e                                  ; [18]: Top of "]" (current item)
    db $00                                  ; [19]:
    db $2d                                  ; [20]: Bottom of "[" (current
                                            ; item)
    db $3e                                  ; [21]: <blank space>
    db $3f                                  ; [22]: <blank space>
    db $2f                                  ; [23]: Bottom of "]" (current
                                            ; item)
    db $00                                  ; [24]:


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
    LDA #$f8cb,X                            ; Load the lower byte from the
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
    LDA #$f8d2,Y                            ; Load the tile to draw at the
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
    STA IScriptOrCHRAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDA #$10
    STA PPU_TargetAddr.U
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
    CMP #$f749,X                            ; Compare it.
    LDA a:Experience_U                      ; Load the upper byte from the
                                            ; lookup table.
    SBC #$f74a,X                            ; Compare it.
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
;     #$ed:
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
    ADC Temp_Int24.M
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
;     #$e9:
;         The upper byte of the location to render to.
;
;     PPU_TargetAddr:
;         The lower byte of the location to render to.
;
;     #$ee:
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
    STA PPU_TargetAddr.U                    ; Store 0x20 as the upper byte.
    LDA #$50
    STA PPU_TargetAddr                      ; Store 0x50 as the upper byte.


    ;
    ; Store the new experience back out to Temp_Int24 and
    ; #$ed.
    ;
    LDA a:Experience                        ; Load the lower byte of the
                                            ; experience.
    STA Temp_Int24                          ; Save to
                                            ; Temp_Int24.
    LDA a:Experience_U                      ; Load the upper byte of the
                                            ; experience.
    STA Temp_Int24.M                        ; Save to #$ed.
    LDA #$00
    STA Temp_Int24.U
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
;     #$ee:
;     #$ed:
;     Temp_Int24:
;     #$e9:
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
    STA Temp_Int24.M                        ; Set middle byte = 0.
    STA Temp_Int24.U                        ; Set upper byte = 0.


    ;
    ; Set the draw position (first digit of time remaining).
    ; This is 0x2058.
    ;
    LDA #$20
    STA PPU_TargetAddr.U                    ; Set high byte of position as
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
; This takes in gold as the 24-bit #$ee:#$ed:Temp_Int24
; and reduces those values from the player's gold.
;
; After subtracting, this will be drawn to the screen.
;
; INPUTS:
;     #$ee:
;         The upper byte of the 24-bit gold value to subtract.
;
;     #$ed:
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
    SBC Temp_Int24.M                        ; Subtract the provided value and
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
; This takes in gold as the 24-bit #$ee:#$ed:Temp_Int24
; and adds those values from the player's gold.
;
; After adding, this will be drawn to the screen.
;
; INPUTS:
;     #$ee:
;         The upper byte of the 24-bit gold value to add.
;
;     #$ed:
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
    ADC Temp_Int24.M                        ; Add the new amount + carry.
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
;     #$ed:
;     #$ee:
;     PPU_TargetAddr:
;     #$e9:
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
    STA PPU_TargetAddr.U                    ; Set the upper byte to 0x20.
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
    STA Temp_Int24.M                        ; Set a the middle byte for the
                                            ; digits to draw.
    LDA a:Gold_U                            ; Load the upper byte of the gold
                                            ; value.
    STA Temp_Int24.U                        ; Set a the upper byte for the
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
;     #$ee:
;         The upper byte of the 24-bit value.
;
;     #$ed:
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
;     #$ee:
;         The upper byte of the 24-bit value.
;
;     #$ed:
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
;     #$ee:
;         The upper byte of the 24-bit value.
;
;     #$ed:
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
; #$ee:#$ed:Temp_Int24.
;
; It will loop through every digit, convert to ASCII, and
; store in UI_DigitsToRender for render.
;
; INPUTS:
;     #$ee:
;         The upper byte of the 24-bit value.
;
;     #$ed:
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
; (stored as #$ee:#$ed:Temp_Int24).
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
;     #$ee:
;         The upper byte of the 24-bit value.
;
;     #$ed:
;         The middle byte of the 24-bit value.
;
;     Temp_Int24:
;         The lower byte of the 24-bit value.
;
; OUTPUTS:
;     A:
;         The resulting digit (between 0 and 9).
;
;     #$ee:
;         Upper byte of the floor of the value / 10.
;
;     #$ed:
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
    ROL Temp_Int24.M                        ; Set mid byte = (mid << 1) | C
    ROL Temp_Int24.U                        ; Set high byte = (high << 1) | C
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
    db $63                                  ; [0]: Power bar

;
; XREFS:
;     UI_DrawManaOrHPBar
;
STATUS_BAR_PPU_ADDR_L_1_:                   ; [$fa6d]
    db $43                                  ; [1]: Mana bar
    db $08                                  ; [0]: Power bar

;
; XREFS:
;     UI_DrawManaOrHPBar
;
BYTE_ARRAY_PRG15_MIRROR__fa6e_1_:           ; [$fa6f]
    db $09                                  ; [1]: Manab ar
    db $0c                                  ; [0]: Power bar

;
; XREFS:
;     UI_DrawManaOrHPBar
;
BYTE_ARRAY_PRG15_MIRROR__fa70_1_:           ; [$fa71]
    db $0d                                  ; [1]: Mana bar

BYTE_ARRAY_PRG15_MIRROR__fa72:              ; [$fa72]
    db $c0                                  ; [0]:

BYTE_ARRAY_PRG15_MIRROR__fa72_1_:           ; [$fa73]
    db $d0                                  ; [1]:
    db $60                                  ; [2]:
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
    STA Temp_Int24.U
    LDA a:UI_MPAndHPBarWidth
    ASL A
    ASL A
    ASL A
    CMP Temp_Int24.U
    BCS @LAB_PRG15_MIRROR__fa9e
    STA Temp_Int24.U

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
    STA PPU_TargetAddr.U
    LDA #$fa6c,Y
    STA PPU_TargetAddr
    LDX a:UI_MPAndHPBarWidth
    INX
    TXA
    JSR PPUBuffer_QueueCommandOrLength
    LDA Temp_Int24.U
    LSR A
    LSR A
    LSR A
    BEQ @LAB_PRG15_MIRROR__fac6
    PHA
    STA Temp_Int24
    LDA #$fa6e,Y

  @LAB_PRG15_MIRROR__fabe:                  ; [$fabe]
    JSR PPUBuffer_Set
    DEC Temp_Int24
    BNE @LAB_PRG15_MIRROR__fabe
    PLA

  @LAB_PRG15_MIRROR__fac6:                  ; [$fac6]
    CMP a:UI_MPAndHPBarWidth
    BEQ @LAB_PRG15_MIRROR__fae2
    PHA
    LDA #$fa70,Y
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
    LDA Temp_Int24.U
    AND #$07
    JSR Math_MultiplyBy16
    TAY
    LDA #$10
    STA PPU_TargetAddr.U
    LDX Maybe_Temp4
    LDA #$fa72,X
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
    LDA #$fb2f,Y
    INY
    JSR PPUBuffer_Set
    TYA
    AND #$0f
    BNE @LAB_PRG15_MIRROR__fb05
    STX PPUBuffer_WriteOffset
    RTS

  @LAB_PRG15_MIRROR__fb14:                  ; [$fb14]
    LDA #$fb37,Y
    INY
    JSR PPUBuffer_Set
    TYA
    AND #$07
    BNE @LAB_PRG15_MIRROR__fb14


    ;
    ; XXX Is this correct? It's reading from program code.
    ;
  @LAB_PRG15_MIRROR__fb20:                  ; [$fb20]
    LDA #$fb27,Y
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
    db $00,$ff,$00,$00,$00,$00,$ff,$00      ; [$fb2f] byte

;
; XREFS:
;     LAB_PRG15_MIRROR__fb14 [$PRG15_MIRROR::fb14]
;
BYTE_PRG15_MIRROR__fb37:                    ; [$fb37]
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$80,$80,$80,$80,$ff,$00 ; [$fb37]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$c0,$c0,$c0,$c0,$ff,$00 ; [$fb47]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$e0,$e0,$e0,$e0,$ff,$00 ; [$fb57]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$f0,$f0,$f0,$f0,$ff,$00 ; [$fb67]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$f8,$f8,$f8,$f8,$ff,$00 ; [$fb77]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$fc,$fc,$fc,$fc,$ff,$00 ; [$fb87]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00,$00,$ff,$fe,$fe,$fe,$fe,$ff,$00 ; [$fb97]
                                                                       ; byte
    db $00,$ff,$00,$00,$00,$00,$ff,$00      ; [$fba7] byte

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
    LDA #$b4e4,Y
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
    STA Temp_Int24.M
    LDA #$00
    LSR Temp_Int24.M
    ROR A
    LSR Temp_Int24.M
    ROR A
    LSR Temp_Int24.M
    ROR A
    LSR Temp_Int24.M
    ROR A
    ADC #$00
    STA Temp_Int24
    LDA Temp_Int24.M
    ADC #$85
    STA Temp_Int24.M
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
    STX PPU_TargetAddr.U
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
    LDA #$fc5b,X
    STA Temp_Int24.U
    LDA #$fc60,X
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
    LDA (#$ee),Y
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
    db $a0                                  ; [0]:
    db $b0                                  ; [1]:
    db $c0                                  ; [2]:
    db $d0                                  ; [3]:
    db $e4                                  ; [4]:

;
; XREFS:
;     TextBox_LoadItemSourceTiles
;
FUN_PRG15_MIRROR__fc0b__UPPER_ADDR_TABLE:   ; [$fc60]
    db $b4                                  ; [0]:
    db $b4                                  ; [1]:
    db $b4                                  ; [2]:
    db $b4                                  ; [3]:
    db $b4                                  ; [4]:


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
;     Sprites_ResetWithNoSprite0
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw StartScreen_Draw-1                   ; Address =
                                            ; StartScreen_Draw


    ;
    ; Wait for a choice at the game's start screen.
    ;
  @_waitForInput:                           ; [$fc6e]
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR Sprites_ResetWithNoSprite0


    ;
    ; Switch to bank 12 and run StartScreen_CheckHandleInput.
    ;
    JSR MMC1_LoadBankAndJump                ; Jump to:
    db BANK_12_LOGIC                        ; Bank = 12
    dw StartScreen_CheckHandleInput-1       ; Address =
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
    STA CurrentMusic
    LDA a:DAT_0687                          ; Check the chosen option.
    BEQ @_startGame                         ; If 0, they chose to start the
                                            ; game. Else, fall through.


    ;
    ; The player chose to enter the Password screen.
    ;
    ; Switch to bank 12 and run PasswordScreen_Show.
    ;
    JSR MMC1_LoadBankAndJump                ; Jump to:
    db BANK_12_LOGIC                        ; Bank = 12
    dw PasswordScreen_Show-1                ; Address =
                                            ; PasswordScreen_Show


    ;
    ; Switch to bank 12 and run Player_SetInitialExpAndGold.
    ;
  @_afterPasswordScreenShow:                ; [$fc8f]
    JSR MMC1_LoadBankAndJump                ; Jump to:
    db BANK_12_LOGIC                        ; Bank = 12
    dw Player_SetInitialExpAndGold-1        ; Address =
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
    db BANK_12_LOGIC                        ; Bank = 12
    dw SplashAnimation_RunIntro-1           ; Address =
                                            ; SplashAnimation_RunIntro


    ;
    ; Switch to bank 12 and run Player_SetStartGameState.
    ;
  @_afterRunIntroFarJump:                   ; [$fc9e]
    JSR MMC1_LoadBankAndJump                ; Jump to:
    db BANK_12_LOGIC                        ; Bank = 12
    dw Player_SetStartGameState-1           ; Address =
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
    STX Maybe_Arg_CurrentSprite_PosX        ; Set the X argument.
    STY Maybe_Arg_CurrentSprite_PosY        ; Set the Y argument.
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
    hex bd ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fccd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fcdd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fced] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fcfd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd0d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd1d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd2d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd3d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd4d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd5d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd6d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd7d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd8d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fd9d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fdad] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fdbd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fdcd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fddd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fded] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fdfd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe0d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe1d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe2d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe3d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe4d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe5d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe6d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe7d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe8d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fe9d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fead] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$febd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fecd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fedd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$feed] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$fefd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff0d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff1d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff2d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff3d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff4d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff5d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff6d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff7d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff8d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ff9d] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ffad] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ffbd] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ffcd] undefined
    db $ff,$ff,$ff                          ; [$ffdd] undefined

    db $20                                  ; Game title
    db $20,$20,$20,$20,$20,$20,$20,$46,$41,$58,$41,$4e,$41,$44,$55 ; [$ffe1]
                                                                   ; string

    dw $4227                                ; PRG Checksum
    dw $0000                                ; CHR CHecksum
    db $48                                  ; CHR size: 0 = 8KiB CHR type: 0
                                            ; = CHR ROM PRG size: 5 = 512KiB
    db $04                                  ; Mapper:    4 = MMC Nametable: 0
                                            ; = Horizontal arrangement
    db $01                                  ; Title encoding: 1 = ASCII
    db $07                                  ; Title length: 8 bytes
    db $18                                  ; Licensee Code: Hudson Soft
    db $94                                  ; Header validation byte
    dw OnInterrupt                          ; OnInterrupt
                                            ; [$PRG15_MIRROR::fffa]
    dw Game_Init                            ; Game_Init
                                            ; [$PRG15_MIRROR::fffc]
    db $d5,$c9                              ; [$fffe] undefined
