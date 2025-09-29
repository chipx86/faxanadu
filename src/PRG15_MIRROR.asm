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
; HUD_AttributeDataIndex set when loading the
; screen.
;
; INPUTS:
;     HUD_AttributeDataIndex:
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
;     Something_SetupNewScreen
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
    LDX a:HUD_AttributeDataIndex            ; X = HUD attribute data index,
                                            ; computed when setting up the
                                            ; screen.
    LDA #$c01b,X                            ; Load the value for the
                                            ; attribute data.

    ;
    ; Write 8 bytes based on data from the lookup table
    ; HUD_ATTRIBUTE_DATA_BY_INDEX at index
    ; HUD_AttributeDataIndex.
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
; PALETTE_INDEX_TO_HUD_ATTRIBUTE_INDEX (stored in
; HUD_AttributeDataIndex.
;
; Only values 0, 1, 2, and 3 are used.
;
; The rest seem to be unused, but many end up styled to
; better match regions of the game.
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
FUN_PRG15_MIRROR__c033:                     ; [$c033]
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
    STX PPUBuffer_UpperBounds
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
;     HandlePlayerHitByMagic
;     Player_ApplyDamage
;     SpriteBehavior__MaybeSugata
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
; TODO: Document Player_Something_ChangeHP
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG14__8329
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
    CMP a:BYTE_04be
    LDA a:Temp2_SomethingChangedHP
    SBC a:BYTE_04bf
    BCC @LAB_PRG15_MIRROR__c124
    LDA a:Temp1_SomethingChangedHP
    SBC a:BYTE_04be
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
;     CurrentSprites_Subtypes:
;         The cleared sprite subtypes.
;
;     ScreenColorMode:
;         The new color mode with greyscale removed.
;
;     Temp_03C7:
;         Set to 0xFF.
;
; CALLS:
;     PPUResetOffset
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
    STA CurrentSprites_Subtypes,X           ; Set sprite subtype to 0.
    DEX                                     ; X--
    BPL @_clearSpritesLoop                  ; If we're not done, loop.

    ;
    ; We're out of the loop. Reset the PPU draw offset and restore
    ; screen state.
    ;
    JSR PPUResetOffset                      ; Reset the PPU offset.
    LDA #$ff
    STA a:Temp_03C7
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
;     CurrentROMBank2:
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
;     MMC1_UpdatePRGBank
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
    LDA a:CurrentROMBank2                   ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 11.

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
    JSR MMC1_UpdatePRGBank                  ; And switch back to it.

    ;
    ; Begin our loop for reading all sprites for the screen.
    ;
  @_readSpriteLoop:                         ; [$c1c5]
    LDY #$00                                ; Y =  0 (info read offset)

    ;
    ; Switch back to ROM bank 11 (sprite info).
    ;
    LDA a:CurrentROMBank2                   ; A = current ROM bank
    PHA                                     ; Push to the stack.
    LDX #$0b
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 11.

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
    JSR MMC1_UpdatePRGBank                  ; And switch back to it.

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
;     CurrentSprites_XPos:
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
;     CurrentSprites_Subtypes:
;         The updated sprite subtypes.
;
; CALLS:
;     Sprites_LoadSpriteValue
;
; XREFS:
;     GameLoop_LoadSpriteInfo
;============================================================================
Sprites_PopulateNextAvailableSprite:        ; [$c205]
    LDX #$07

  @LAB_PRG15_MIRROR__c207:                  ; [$c207]
    STX a:CurrentSpriteIndex
    LDA CurrentSprites_Entities,X
    CMP #$ff
    BNE @LAB_PRG15_MIRROR__c252
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_Flags,X
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,X
    LDA a:CurrentSprite_XPos
    STA CurrentSprites_XPos,X
    LDA a:CurrentSprite_YPos
    STA CurrentSprites_YPos,X
    LDA a:CurrentSprite_Entity
    STA CurrentSprites_Entities,X
    TAY
    LDA #$b4df,Y
    STA CurrentSprites_HitBoxTypes,X
    LDA #$b5a9,Y
    STA CurrentSprites_HP,X
    TYA
    ASL A
    TAY
    LDA #$ad2d,Y
    STA CurrentSprites_BehaviorAddrs_L,X
    LDA #$ad2e,Y
    STA CurrentSprites_BehaviorAddrs_U,X
    LDA #$ff
    STA CurrentSprites_Subtypes,X
    JMP Sprites_LoadSpriteValue

  @LAB_PRG15_MIRROR__c252:                  ; [$c252]
    LDX a:CurrentSpriteIndex
    DEX
    BPL @LAB_PRG15_MIRROR__c207
    RTS


;============================================================================
; Banks storing the images for a range of sprites.
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
;     MMC1_UpdatePRGBank
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
    LDA a:CurrentROMBank2                   ; Get the current ROM bank.
    PHA                                     ; Push to the stack.
    LDX #$0b                                ; X = 11 (bank)
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 11.

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
;     PPUResetOffset
;     PPUBuffer_WaitUntilClear
;     Sprites_LoadImageForCurrentSprite
;     Sprites_StoreBankForCurrentSprite
;
; XREFS:
;     FUN_PRG15_MIRROR__dacd
;     Game_MainLoop
;     Game_SetupAndLoadArea
;     Game_Start
;     IScripts_ClearPortrait
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
    JSR PPUResetOffset                      ; Reset the PPU drawing
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
; TODO: Document CastMagic_Maybe_FinishHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
CastMagic_Maybe_FinishHandler:              ; [$c2e9]
    LDA #$00
    LDA #$01
    LDA a:CastMagic_Type
    BMI @_return
    JSR CastMagic_CalculateVisibility
    LDA a:CastMagic_XPos_Full
    STA Maybe_Arg_CurrentSprite_PosX
    LDA Screen_Maybe_ScrollXCounter
    STA Unused_Sprite_ScrollPosX
    LDA a:CastMagic_YPos_Full
    STA Maybe_Arg_CurrentSprite_PosY
    LDA Player_Something_ScrollPosY
    STA Unused_Sprite_ScrollPosY
    LDA a:CastMagic_Type
    ASL A
    TAY
    LDA #$bb28,Y
    PHA
    LDA #$bb27,Y
    PHA

  @_return:                                 ; [$c314]
    RTS


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
;     CastMagic_Maybe_FinishHandler
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
; TODO: Document CastMagic_Maybe_SetAppearance
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitHandler__c39b
;     MagicHitHandler__c3a7
;     MagicHitHandler__c3b6
;     MagicHitHandler__c3c9
;     MagicHitHandler__c3d6
;     MagicHitHandler__c3fb
;     MagicHitHandler__c403
;     MagicHitHandler__c42c
;============================================================================
CastMagic_Maybe_SetAppearance:              ; [$c37d]
    LDY a:CastMagic_Type                    ; Y = cast magic
    CLC
    ADC #$c387,Y                            ; Add the value from the lookup
                                            ; table.
    JMP Sprite_Maybe_SetAppearanceAddrFromOffset ; Set the sprite appearance.

;
; XREFS:
;     CastMagic_Maybe_SetAppearance
;
SPRITE_MAGIC_IMAGE_ADDRS_U:                 ; [$c387]
    db $95                                  ; [0]: Deluge
    db $99                                  ; [1]: Thunder
    db $9b                                  ; [2]: Fire
    db $9d                                  ; [3]: Death
    db $a1                                  ; [4]: Tilte
    db $a5                                  ; [5]:
    db $99                                  ; [6]:
    db $9b                                  ; [7]:
    db $a5                                  ; [8]:
    db $a5                                  ; [9]:
    db $a5                                  ; [10]:
    db $a5                                  ; [11]:


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
;     MagicHitHandler__c39b
;     MagicHitHandler__c3a7
;     MagicHitHandler__c3b6
;     MagicHitHandler__c3c9
;     MagicHitHandler__c3d6
;     MagicHitHandler__c3fb
;============================================================================
CastMagic_UpdateSpriteDirection:            ; [$c393]
    LDA a:CastMagic_Flags                   ; Load the cast magic's flags.
    AND #$40                                ; Take only the facing direction
                                            ; bit.
    STA CurrentSprite_FlipMask              ; Set as the sprite's flip mask.
    RTS


;============================================================================
; TODO: Document MagicHitHandler__c39b
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb27]
;============================================================================
MagicHitHandler__c39b:                      ; [$c39b]
    JSR CastMagic_UpdateSpriteDirection
    LDA InterruptCounter
    LSR A
    LSR A
    AND #$03
    JMP CastMagic_Maybe_SetAppearance


;============================================================================
; TODO: Document MagicHitHandler__c3a7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb29]
;     MagicHitsHandler [$PRG14::bb33]
;============================================================================
MagicHitHandler__c3a7:                      ; [$c3a7]
    JSR CastMagic_UpdateSpriteDirection
    LDA InterruptCounter
    LSR A
    LSR A
    BCS @_return
    AND #$01
    JMP CastMagic_Maybe_SetAppearance

  @_return:                                 ; [$c3b5]
    RTS


;============================================================================
; TODO: Document MagicHitHandler__c3b6
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb2b]
;     MagicHitsHandler [$PRG14::bb35]
;============================================================================
MagicHitHandler__c3b6:                      ; [$c3b6]
    LDA InterruptCounter
    AND #$02
    BNE @LAB_PRG15_MIRROR__c3bd
    RTS

  @LAB_PRG15_MIRROR__c3bd:                  ; [$c3bd]
    JSR CastMagic_UpdateSpriteDirection
    LDA InterruptCounter
    LSR A
    LSR A
    AND #$01
    JMP CastMagic_Maybe_SetAppearance


;============================================================================
; TODO: Document MagicHitHandler__c3c9
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb2d]
;============================================================================
MagicHitHandler__c3c9:                      ; [$c3c9]
    JSR CastMagic_UpdateSpriteDirection
    LDA InterruptCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    JMP CastMagic_Maybe_SetAppearance


;============================================================================
; TODO: Document MagicHitHandler__c3d6
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb2f]
;============================================================================
MagicHitHandler__c3d6:                      ; [$c3d6]
    JSR CastMagic_UpdateSpriteDirection
    LDA a:CastMagic_Phase
    LSR A
    BCS @LAB_PRG15_MIRROR__c3ec
    LDY #$00
    LDA InterruptCounter
    AND #$08
    BEQ @LAB_PRG15_MIRROR__c3e8
    INY

  @LAB_PRG15_MIRROR__c3e8:                  ; [$c3e8]
    TYA
    JMP CastMagic_Maybe_SetAppearance

  @LAB_PRG15_MIRROR__c3ec:                  ; [$c3ec]
    LDA InterruptCounter
    LSR A
    LSR A
    BCC @LAB_PRG15_MIRROR__c3f3
    RTS

  @LAB_PRG15_MIRROR__c3f3:                  ; [$c3f3]
    AND #$01
    CLC
    ADC #$02
    JMP CastMagic_Maybe_SetAppearance


;============================================================================
; TODO: Document MagicHitHandler__c3fb
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb31]
;     MagicHitsHandler [$PRG14::bb37]
;============================================================================
MagicHitHandler__c3fb:                      ; [$c3fb]
    JSR CastMagic_UpdateSpriteDirection
    LDA #$00
    JMP CastMagic_Maybe_SetAppearance


;============================================================================
; TODO: Document MagicHitHandler__c403
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb3b]
;============================================================================
MagicHitHandler__c403:                      ; [$c403]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA a:CastMagic_Something_Appearance
    ASL A
    STA Temp_00
    LDA a:CastMagic_YPos_Full
    SEC
    SBC Temp_00
    STA Maybe_Arg_CurrentSprite_PosY
    LDA #$02
    JSR CastMagic_Maybe_SetAppearance
    LDA a:CastMagic_Something_Appearance
    ASL A
    CLC
    ADC #$10
    CLC
    ADC a:CastMagic_YPos_Full
    STA Maybe_Arg_CurrentSprite_PosY
    LDA #$03
    JMP CastMagic_Maybe_SetAppearance


;============================================================================
; TODO: Document MagicHitHandler__c42c
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb3d]
;============================================================================
MagicHitHandler__c42c:                      ; [$c42c]
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
    JSR CastMagic_Maybe_SetAppearance
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
;     MagicHitHandler__c42c
;
DAT_PRG15_MIRROR__c46e:                     ; [$c46e]
    db $ff                                  ; [$c46e] undefined1

;
; XREFS:
;     MagicHitHandler__c42c
;
DAT_PRG15_MIRROR__c46f:                     ; [$c46f]
    db $00                                  ; [$c46f] undefined1

    db $ff,$ff,$00                          ; [$c471] undefined

;
; XREFS:
;     MagicHitHandler__c42c
;
DAT_PRG15_MIRROR__c473:                     ; [$c473]
    db $00                                  ; [$c473] undefined1

    db $00,$02,$01                          ; [$c475] undefined

;
; XREFS:
;     MagicHitHandler__c42c
;
DAT_PRG15_MIRROR__c477:                     ; [$c477]
    db $03                                  ; [$c477] undefined1


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
;     Wait3969Cycles
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
;     Wait3969Cycles
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
    JSR Game_DrawScreenInFrozenState

    ;
    ; Wait a short period of time before filling up the
    ; next units of HP, to help animate the bar.
    ;
    JSR WaitForNextFrame                    ; Wait a bit.
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
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
    JSR Game_DrawScreenInFrozenState

    ;
    ; Wait a short period of time before filling up the
    ; next units of MP, to help animate the bar.
    ;
    JSR WaitForNextFrame                    ; Wait a bit.
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
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
;     Wait3969Cycles
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
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles
    JSR WaitForNextFrame
    JSR Wait3969Cycles

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
;     Maybe_Player_PickUpGlove
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
;     PlayerPosX_Full:
;         The player's current X position.
;
;     PlayerPosY:
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
    LDA PlayerPosX_Full                     ; Get the player's X position.
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
    LDA PlayerPosY                          ; Load the player's current Y
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
    LDA a:Something_Maybe_BlockOffset       ; Load a value.
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
    BNE @LAB_PRG15_MIRROR__c7a5
    JMP Player_PickUpPoison                 ; This is the Poison.  Pick it
                                            ; up.

  @LAB_PRG15_MIRROR__c7a5:                  ; [$c7a5]
    CMP #$5f                                ; 0x5F == Glove
    BEQ Maybe_Player_PickUpGlove            ; This is the Glove.  Pick it up.

    ;
    ; Check if this is the Ointment.
    ;
    CMP #$60                                ; 0x60 == Ointment
    BNE @LAB_PRG15_MIRROR__c7b0
    JMP Player_PickUpOintment               ; This is the Ointment.  Pick it
                                            ; up.

  @LAB_PRG15_MIRROR__c7b0:                  ; [$c7b0]
    SEC
    SBC #$48
    TAY
    BEQ Maybe_Player_PickUpGlove            ; This is the Glove. Pick it up.

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
Maybe_Player_PickUpGlove:                   ; [$c7cf]
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
    ; Run the "Got Pendant" IScript.
    ;
    ; IScript 0x90 via jump to IScripts_Begin.
    ;
    LDA #$90                                ; 0x90 == Pendant picked up
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
;     PPUBuffer_UpperBounds:
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
    STX PPUBuffer_UpperBounds               ; Store X as the new upper
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
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     IScriptAction_FinishGame
;============================================================================
Game_Init:                                  ; [$c913]
    SEI
    CLD
    LDX #$ff
    TXS

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
    LDA #$00
    STA a:PPUMASK
    LDA #$18
    STA a:PPUCTRL

    ;
    ; Read the PPUSTATUS register several times before writing.
    ;
    ; NESdev says this is common to ensure writes occur in the
    ; correct order.
    ;
    LDA a:PPUSTATUS

  @LAB_PRG15_MIRROR__c925:                  ; [$c925]
    LDA a:PPUSTATUS
    BPL @LAB_PRG15_MIRROR__c925

  @LAB_PRG15_MIRROR__c92a:                  ; [$c92a]
    LDA a:PPUSTATUS
    BPL @LAB_PRG15_MIRROR__c92a

    ;
    ; Set PPUMASK to 0 to allow transferring large amounts of
    ; Data to VRAM.
    ;
    LDA #$00
    STA a:PPUMASK
    LDX #$ff
    TXS

    ;
    ; Clear RAM, setting all ranges of bytes used for state to 0.
    ;
    LDX #$00

  @_loop:                                   ; [$c939]
    CPX #$fc
    BCS @LAB_PRG15_MIRROR__c93f
    STA Temp_00,X

  @LAB_PRG15_MIRROR__c93f:                  ; [$c93f]
    STA Temp_0200,X
    STA #$0300,X
    STA #$0400,X
    STA PPUBuffer,X
    STA ScreenBuffer,X
    STA #$0700,X
    INX
    BNE @_loop
    JSR Game_InitMMCAndBank
    JSR Game_InitScreenAndMusic
    JMP Game_InitStateForStartScreen

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
    LDA a:CurrentROMBank2                   ; Load the current ROM bank.
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
                                            ; from $0700.

    ;
    ; Update the PPU state.
    ;
    JSR PPU_HandleOnInterrupt

    ;
    ; Switch to bank 5 (audio logic) and run audio updates.
    ;
    LDA a:CurrentROMBank2                   ; Load the current bank.
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
    JSR FUN_PRG15_MIRROR__d61d
    JSR PPUBuffer_Draw
    LDA ScreenColorMode
    STA a:PPUMASK
    LDA PPU_Something_PauseUpdates
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
    JMP @LAB_PRG15_MIRROR__c9fa

    ;
    ; Clear the Nametable 2400 flag.
    ;
  @_clearNametable2400:                     ; [$c9f3]
    LDA SavedPPUCtrl
    AND #$fe
    STA a:PPUCTRL

  @LAB_PRG15_MIRROR__c9fa:                  ; [$c9fa]
    LDA #$00
    STA a:PPUSCROLL
    STA a:PPUSCROLL

  @LAB_PRG15_MIRROR__ca02:                  ; [$ca02]
    BIT a:PPUSTATUS
    BVS @LAB_PRG15_MIRROR__ca02

  @LAB_PRG15_MIRROR__ca07:                  ; [$ca07]
    BIT a:PPUSTATUS
    BVC @LAB_PRG15_MIRROR__ca07
    LDX #$a0

  @LAB_PRG15_MIRROR__ca0e:                  ; [$ca0e]
    DEX
    BNE @LAB_PRG15_MIRROR__ca0e

  @LAB_PRG15_MIRROR__ca11:                  ; [$ca11]
    LDA ScrollHelp_Screen
    AND #$01
    ORA SavedPPUCtrl
    STA a:PPUCTRL
    LDA ScrollHelp_Pixel
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
;     FUN_PRG12__8b71
;     IScripts_UpdatePortraitAnimation
;     PasswordScreen_Show
;     Shop_Something__8d5a
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     UI_ShowPlayerMenu
;     _handleWrongPassword [$PRG12::9162]
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
    LDA Joy1_ButtonMask
    STA Joy1_PrevButtonMask
    LDA #$01
    STA a:JOY1
    LDA #$00
    STA a:JOY1
    STA Joy1_ButtonMask
    STA Joy2_ButtonMask
    LDX #$08

  @_loop1:                                  ; [$ca49]
    LDA a:JOY1
    AND #$03
    LSR A
    ROL Joy1_ButtonMask
    ORA Joy1_ButtonMask
    STA Joy1_ButtonMask
    DEX
    BNE @_loop1
    LDX #$08

  @_loop2:                                  ; [$ca5a]
    LDA a:JOY2
    AND #$01
    LSR A
    ROL Joy2_ButtonMask
    DEX
    BNE @_loop2
    LDA Joy1_ButtonMask
    EOR Joy1_PrevButtonMask
    AND Joy1_ButtonMask
    STA Joy1_ChangedButtonMask
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
;     CurrentSprite_RandomlyChangeHorizDirection
;     CurrentSprite_RandomlyChangeVertDirection
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
    STA ScrollHelp_Pixel
    STA ScrollHelp_Screen
    STA Something_ScrollIndex
    LDA #$1e
    STA ScreenColorMode
    JSR Something_FrameAltToggleWithPausePPU
    JSR PPU_InitAttributeAndNameTables
    LDA #$00
    STA Game_EnableInterruptHandlers
    STA a:Maybe_GameScreenStart
    LDA a:CurrentROMBank2

    ;
    ; Switch to bank 5 and set up sound.
    ;
    PHA
    LDX #$05
    JSR MMC1_UpdatePRGBank
    JSR #$8006
    JSR ROMBankStart
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
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
;     PPUBuffer_UpperBounds:
;         The upper bounds of the PPU buffer to write.
;
;     PPUBuffer_Offset:
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
    LDA PPUBuffer_UpperBounds               ; Load the upper bounds of the
                                            ; PPU buffer.
    CMP PPUBuffer_Offset                    ; Has the read offset hit the
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
; TODO: Document FUN_PRG15_MIRROR__cb17
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
FUN_PRG15_MIRROR__cb17:                     ; [$cb17]
    JSR GameLoop_Maybe_SetupDrawState
    LDA #$01
    STA Game_EnableInterruptHandlers
    RTS


;============================================================================
; MAYBE DEADCODE
;============================================================================
MAYBE_UNUSED_FUN_PRG15_MIRROR__cb1f:        ; [$cb1f]
    JSR FUN_PRG15_MIRROR__cb3f
    LDA #$01
    STA Game_EnableInterruptHandlers
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__cb27
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
FUN_PRG15_MIRROR__cb27:                     ; [$cb27]
    JSR Something_FrameAltToggleWithPausePPU
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
;     MAYBE_UNUSED_FUN_PRG15_MIRROR__cb1f
;============================================================================
FUN_PRG15_MIRROR__cb3f:                     ; [$cb3f]
    LDA #$01
    STA PPU_Something_PauseUpdates
    STA PPU_ForceLowerPatternTables
    BNE Something_FrameAltToggle

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document GameLoop_Maybe_SetupDrawState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__8b71
;     IScripts_UpdatePortraitAnimation
;     Shop_Something__8d5a
;     UI_ShowPlayerMenu
;     EndGame_Begin
;     EndGame_MainLoop
;     FUN_PRG15_MIRROR__cb17
;     Game_MainLoop
;     Game_WaitForOAMReset
;     Player_HandleDeath
;============================================================================
GameLoop_Maybe_SetupDrawState:              ; [$cb47]
    LDA #$00
    STA PPU_Something_PauseUpdates
    STA PPU_ForceLowerPatternTables
    BEQ Something_FrameAltToggle

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Something_FrameAltToggleWithPausePPU
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;     FUN_PRG15_MIRROR__cb27
;     Game_InitScreenAndMusic
;     Game_ShowStartScreen
;============================================================================
Something_FrameAltToggleWithPausePPU:       ; [$cb4f]
    LDA #$ff                                ; A = 0xFF
    STA PPU_Something_PauseUpdates          ; Store it.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Something_FrameAltToggle
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__cb3f
;     GameLoop_Maybe_SetupDrawState
;============================================================================
Something_FrameAltToggle:                   ; [$cb53]
    LDY #$00                                ; Y = 0
    STY Maybe_CurrentSprite_PPUOffset       ; Maybe_CurrentSprite_PPUOffset
                                            ; = 0
    STY Maybe_Unused_0034                   ; Maybe_Unused_0034
                                            ; = 0
    STY Maybe_Unused_0035                   ; Maybe_Unused_0035
                                            ; = 0
    STY Maybe_Unused_0038                   ; Maybe_Unused_0038
                                            ; = 0
    STY Maybe_Unused_0037                   ; Maybe_Unused_0037
                                            ; = 0
    STY Something_Sprites_ResetAtFrame      ; Something_Sprites_ResetAtFrame
                                            ; = 0
    STY BYTE_0025                           ; BYTE_0025 = 0
    LDA PPU_Something_PauseUpdates          ; Load our byte from before.
    BMI @LAB_PRG15_MIRROR__cb82             ; If 0xFF, then jump.
    INC BYTE_0025
    TAY                                     ; Y = A
    LDA #$cb96,Y
    STA a:BYTE_0700
    LDA #$7f
    STA a:DAT_0701
    LDA #$23
    STA a:DAT_0702
    LDA #$cb98,Y
    STA a:DAT_0703
    LDY #$04                                ; Y = 4 (loop counter).

  @LAB_PRG15_MIRROR__cb82:                  ; [$cb82]
    LDA #$f0

  @LAB_PRG15_MIRROR__cb84:                  ; [$cb84]
    STA #$0700,Y
    INY                                     ; Y += 4
    INY
    INY
    INY
    BNE @LAB_PRG15_MIRROR__cb84             ; If not 0, loop.

    ;
    ; Flip bit 7.
    ;
    LDA Maybe_FrameAltToggleFlags           ; Load the frame flags.
    AND #$80                                ; Discard all but bit 7.
    EOR #$80                                ; Flip bit 7.
    STA Maybe_FrameAltToggleFlags           ; Store the flags.
    RTS
    db $17                                  ; [0]:
    db $48                                  ; [1]:
    db $08                                  ; [2]:
    db $00                                  ; [3]:


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
;     GameLoop_Maybe_SetupDrawState
;
; XREFS:
;     FUN_PRG15_MIRROR__f24d
;     IScripts_ClearPortrait
;============================================================================
Game_WaitForOAMReset:                       ; [$cb9a]
    JSR GameLoop_Maybe_SetupDrawState
    LDA #$01
    STA Game_NeedOAMReset
    LDA InterruptCounter

  @_waitForInterruptLoop:                   ; [$cba3]
    CMP InterruptCounter
    BEQ @_waitForInterruptLoop
    RTS


;============================================================================
; TODO: Document Wait3969Cycles
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_CheckPauseGame
;     Player_FillHPAndMP
;     Player_UseRedPotion
;============================================================================
Wait3969Cycles:                             ; [$cba8]
    LDX #$04
    LDY #$84

  @_loop:                                   ; [$cbac]
    LDA #$0700,X
    PHA
    LDA #$0700,Y
    STA #$0700,X
    PLA
    STA #$0700,Y
    INX
    INY
    BNE @_loop
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
;     CurrentROMBank2:
;         Set to bank 14.
;
;     SavedROMBank:
;         Set to bank 14.
;
; CALLS:
;     MMC1_Init
;     MMC1_UpdatePRGBank
;
; XREFS:
;     Game_Init
;============================================================================
Game_InitMMCAndBank:                        ; [$cbbf]
    LDA #$00
    STA MMC1_ShiftSync
    JSR MMC1_Init                           ; Initialize the MMC1 chipset.
    LDX #$0e
    STX a:CurrentROMBank2                   ; Set the previous and current
                                            ; ROM banks to 14.
    STX SavedROMBank
    JMP MMC1_UpdatePRGBank                  ; Switch to the bank.


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
;     CurrentROMBank2:
;         The new ROM bank.
;
;     SavedROMBank:
;         The previously-saved ROM bank.
;
;     MMC1_ShiftSync:
;         Flag used to manage/reinitialize MMC1 state.
;
; XREFS:
;     Area_ScrollToNextRoom
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
MMC1_SavePRGBankAndUpdateTo:                ; [$cc15]
    LDA a:CurrentROMBank2                   ; Get the currently-loaded ROM
                                            ; bank
    STA SavedROMBank

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Switch the active PRG ROM bank.
;
; INPUTS:
;     X:
;         The new bank to switch to.
;
; OUTPUTS:
;     CurrentROMBank2:
;         The new ROM bank.
;
;     MMC1_ShiftSync:
;         Flag used to manage/reinitialize MMC1 state.
;
; XREFS:
;     Area_LoadBlockProperties
;     Area_ScrollToNextRoom
;     Area_SetBlocks
;     Area_SetStateFromDoorDestination
;     CHR_LoadTilesetPages
;     EndGame_MainLoop
;     FUN_PRG15_MIRROR__ce80
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
;     Game_MainLoop
;     LoadPalette2
;     LoadPalette
;     LookupSpriteDataPointer
;     MMC1_LoadBankAndJump
;     MMC1_RestorePrevPRGBank
;     MMC1_UpdatePRGBankToStackA
;     Maybe_Player_LoadArmorSprite
;     Maybe_Player_LoadShieldSprite
;     Maybe_Player_LoadWeaponSprite
;     Maybe_Screen_Scroll
;     Maybe_Screen_Scroll_D2A6
;     Messages_Load
;     PPU_LoadGlyphsForStrings
;     PPU_WriteTilesFromCHRRAM
;     Palette_PopulateData
;     Player_DrawItemInternal
;     Player_HandleDeath
;     Sprite_Maybe_SetAppearanceAddr
;     Sprite_Maybe_SetAppearanceAddrFromOffset
;     Sprites_LoadSpriteValue
;     TextBox_Maybe_GetPaletteBehindTextbox
;     TextBox_Maybe_ShowNextCharFromBank
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowNextChar
;============================================================================
MMC1_UpdatePRGBank:                         ; [$cc1a]
    STX a:CurrentROMBank2                   ; Set the bank we're switching
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
;     CurrentROMBank2:
;         The new ROM bank.
;
;     MMC1_ShiftSync:
;         Flag used to manage/reinitialize MMC1 state.
;
; XREFS:
;     OnInterrupt
;============================================================================
MMC1_EnsurePRG:                             ; [$cc85]
    STX a:CurrentROMBank2

    ;
    ; Check if any code was in the process of switching banks.
    ;
    ; If 0, we can exit.
    ;
    ; If 1, MMC1_UpdatePRGBank was in the process of
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
; SavedROMBank.
;
; INPUTS:
;     SavedROMBank:
;         The saved ROM bank to switch back to.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     MMC1_UpdatePRGBank
;
; XREFS:
;     Area_ScrollToNextRoom
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
MMC1_RestorePrevPRGBank:                    ; [$cce7]
    LDX SavedROMBank
    JMP MMC1_UpdatePRGBank


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
    LDX PPUBuffer_Offset                    ; Load our current PPU buffer
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
    STX PPUBuffer_Offset                    ; Set the new offset.
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
    ; Add the phase byte and oop index together and get the three
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
;     PPUBuffer_Offset:
;         The offset within the PPU buffer to read from.
;
;     PPUADDR:
;         The PPU address to read and write.
;
;     PPUDATA:
;         The PPU data to read and write.
;
; OUTPUTS:
;     PPUBuffer_Offset:
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
PPUBuffer_Command_RotateTilesRight1Pixel:   ; [$cd3b]
    ;
    ; Read the first two bytes from the offset and set as
    ; the PPUADDR.
    ;
    LDX PPUBuffer_Offset                    ; Load our current PPU buffer
                                            ; offset.
    LDA PPUBuffer,X                         ; Load the first address byte
                                            ; from the buffer.
    INX
    TAY                                     ; Y = byte 1
    STY a:PPUADDR                           ; Set as the upper byte of the
                                            ; PPU address.
    LDA PPUBuffer,X                         ; Load the next address byte.
    INX
    STX PPUBuffer_Offset                    ; Update the offset to skip these
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
PPUResetOffset:                             ; [$cd6f]
    LDA #$09
    STA PPUOffset_Row
    LDA #$00
    STA PPUOffset_Col
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
    LDA a:CurrentROMBank2
    PHA

    ;
    ; Switch to the bank for the current sprite's images.
    ;
    LDX a:CurrentSprite_ImagesBank          ; Load the bank where the images
                                            ; for the current sprite are
                                            ; found
    JSR MMC1_UpdatePRGBank

    ;
    ; Read the first byte of the ROM bank and store as the start of
    ; the lower byte of the sprite images address.
    ;
    LDA a:ROMBankStart
    STA Temp_Addr_L

    ;
    ; Read the second byte as the upper address, and add 0x80 to it.
    ;
    LDA a:#$8001
    CLC
    ADC #$80
    STA Temp_Addr_U

    ;
    ; Compute the starting index for the sprite based on the
    ; entity ID.
    ;
    ; Entities 0-55 are in the first sprite bank. 56+
    ; are in the second.
    ;
    LDA a:CurrentSprite_Entity              ; Load the current sprite ID
    CMP #$37                                ; Each bank has 0x37 sprites.
                                            ; Check if we're on the next
                                            ; bank.
    BCC @_loadImages
    SBC #$37                                ; We are, so subtract 0x37 for
                                            ; the new sprite ID.

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
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
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
    LDA a:CurrentROMBank2
    PHA
    LDX a:CurrentSprite_ImagesBank
    JSR MMC1_UpdatePRGBank
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
    STX PPUBuffer_UpperBounds
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
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
; TODO: Document FUN_PRG15_MIRROR__ce80
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_InitStateForSpawn
;     Something_SetupNewScreen
;============================================================================
FUN_PRG15_MIRROR__ce80:                     ; [$ce80]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:#$8008
    STA Temp_Addr_L
    LDA a:#$8009
    CLC
    ADC #$80
    STA Temp_Addr_U
    LDA #$05
    STA Temp_00
    LDA #$04
    STA a:PPUADDR
    LDY #$00
    STY a:PPUADDR

  @LAB_PRG15_MIRROR__cea4:                  ; [$cea4]
    LDA (Temp_Addr_L),Y
    STA a:PPUDATA
    INY
    BNE @LAB_PRG15_MIRROR__cea4
    INC Temp_Addr_U
    DEC Temp_00
    BNE @LAB_PRG15_MIRROR__cea4
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; Load tilesets from PRG ROM (bank 4) into CHR RAM.
;
; INPUTS:
;     TilesIndex:
;         The index of the tileset to load.
;
; OUTPUTS:
;     None
;
; XREFS:
;     FUN_PRG15_MIRROR__df64
;     Game_EnterBuilding
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
CHR_LoadTilesetPages:                       ; [$ceb8]
    ;
    ; Load the address for the tile data based on the tiles index.
    ;
    LDA TilesIndex                          ; Set A = tileset index
    ASL A                                   ; Set A = tileset index * 2 (word
                                            ; offset)
    TAY                                     ; Set Y = word offset into the
                                            ; pointer table
    LDA #$cf07,Y                            ; Read the low byte from the
                                            ; table
    STA TilesAddress                        ; Save low byte to TilesAddress
    LDA #$cf08,Y                            ; Read the high byte from the
                                            ; table
    STA TilesAddress+1                      ; Set high byte to TilesAddress

    ;
    ; Set the PPU to increment by +1 after each PPUDATA write.
    ;
    JSR PPU_SetVRAMIncrementAdd1Across

    ;
    ; Load and set the PPU address for the current set of
    ; tiles. Set the upper byte from the table and lower
    ; byte to 0.
    ;
    LDY TilesIndex
    LDA #$cf19,Y
    STA a:PPUADDR                           ; Set the high byte of the PPU
                                            ; address (0x18 or 0x1A)
    LDA #$00
    STA a:PPUADDR                           ; Set the low byte (0x00 -- start
                                            ; of page)
    STA Temp_08                             ; Set the low byte of the
                                            ; remaining page count to 0

    ;
    ; Set the 16-bit total byte count to (CHRPageCount << 8) | 0.
    ;
    LDA #$cf22,Y
    STA Temp_09

    ;
    ; Save the current bank and switch to bank 4 (tile data).
    ;
    LDA a:CurrentROMBank2
    PHA
    LDX #$04
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 4 (tile data)

    ;
    ; Begin loading tiles into PPUDATA.
    ;
    LDY #$00                                ; Set Y = 0 (start page of loop)

    ;
    ; Stream 1 byte from PRG to PPU.
    ;
  @_copyLoop:                               ; [$cee8]
    LDA (TilesAddress),Y
    STA a:PPUDATA

    ;
    ; Increment our source pointer (Y++).
    ;
    ; Carries into high on wrap.
    ;
    INY
    BNE @_noCarry
    INC TilesAddress+1

    ;
    ; Decrement the 16-bit remaining count.
    ;
  @_noCarry:                                ; [$cef2]
    LDA Temp_08
    SEC
    SBC #$01
    STA Temp_08                             ; Low--
    LDA Temp_09
    SBC #$00
    STA Temp_09                             ; High -= borrow
    BCS @_copyLoop                          ; Keep going until the total
                                            ; reaches 0
    PLA
    TAX

    ;
    ; Switch back to our previous bank.
    ;
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; Offsets of the tiles in the bank
;
; Index into the table are based on TilesIndex.
;============================================================================

;
; XREFS:
;     CHR_LoadTilesetPages
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
; Index into the table are based on TilesIndex.
;============================================================================

;
; XREFS:
;     CHR_LoadTilesetPages
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
; Index into the table are based on TilesIndex.
;
; The results are further translated as:
;
;     8 == 0x80
;     6 == 0x60
;     4 == 0x40
;============================================================================

;
; XREFS:
;     CHR_LoadTilesetPages
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
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     CHR_LoadTilesetPages
;============================================================================
PPU_SetVRAMIncrementAdd1Across:             ; [$cf2b]
    LDA SavedPPUCtrl
    AND #$fb                                ; Set VRAM address increment per
                                            ; CPU read/write of PPUDATA to 0:
                                            ; Add 1, going across.
    STA SavedPPUCtrl                        ; Set it to SavedPPUCtrl.
    STA a:PPUCTRL                           ; Set it to PPUCTRL.
    RTS


;============================================================================
; Clear the PPU buffer.
;
; Both the offset and upper bounds will be reset back to 0.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     PPUBuffer_Offset:
;         The offset to clear.
;
;     PPUBuffer_UpperBounds:
;         The upper bounds value to clear.
;============================================================================
PPUBuffer_Clear:                            ; [$cf35]
    LDA #$00
    STA PPUBuffer_Offset                    ; Set offset = 0
    STA PPUBuffer_UpperBounds               ; Set upper bounds = 0

;
; XREFS:
;     PPUBuffer_Draw
;
RETURN_CF3B:                                ; [$cf3b]
    db $60                                  ; [$cf3b] undefined


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
;          PPUBuffer_Command_RotateTilesRight1Pixel
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
;     PPUBuffer_Offset:
;         The offset within the PPU buffer to process.
;
;     PPUBuffer_UpperBounds:
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
;     PPUBuffer_Command_RotateTilesRight1Pixel
;     PPUBuffer_DrawCommand_RemoveVerticalLines
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     PPUBuffer_DrawAll
;     PPU_HandleOnInterrupt
;============================================================================
PPUBuffer_Draw:                             ; [$cf3c]
    ;
    ; Check if there's anything in the buffer to write.
    ; If not, we're done.
    ;
    LDA PPUBuffer_Offset                    ; A = current buffer offset
    CMP PPUBuffer_UpperBounds               ; Compare against the upper bound
                                            ; of the PPU buffer.
    BEQ RETURN_CF3B                         ; If they're the same, we have
                                            ; nothing to write. We're done.

    ;
    ; Check the value in the offset and see if it appears to
    ; be a command opcode of some sort (an index into
    ; PPUBUFFER_DRAW_COMMANDS.
    ;
    LDX PPUBuffer_Offset                    ; X = current PPU offset
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
    ; the entry for the command in our table, and call it.
    ;
    INC PPUBuffer_Offset                    ; Consume the byte in the buffer.
    ASL A
    TAY                                     ; Begin looking up in the table.
    LDA #$cfbd,Y                            ; High byte of the address.
    PHA
    LDA #$cfbc,Y                            ; Low byte of the address.
    PHA
    RTS

  @_beginDraw:                              ; [$cf5b]
    LDA #$d0
    STA PPUBuffer_Temp_TotalByteLength
    LDA #$06
    STA PPUBuffer_Temp_PendingEntryCount

    ;
    ; Loop through the buffer until either it's cleared or we've
    ; processed 6 entries.
    ;
  @_loopBuffer:                             ; [$cf63]
    LDX PPUBuffer_Offset
    CPX PPUBuffer_UpperBounds
    BEQ @_finishLoop

    ;
    ; Compute the PPUCTRL to set for this series of writes.
    ;
    ; If the most-significant bit is set, we'll set it to
    ; Add32 Down mode. Otherwise, we'll set it to Add1 Across
    ; mode.
    ;
    LDA SavedPPUCtrl
    AND #$fb
    TAY
    LDA PPUBuffer,X
    BPL @_processData
    AND #$7f
    INY
    INY
    INY
    INY

  @_processData:                            ; [$cf79]
    STY a:PPUCTRL

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
    STX PPUBuffer_Offset                    ; Increment our offset into the
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
;============================================================================

;
; XREFS:
;     PPUBuffer_Draw
;
PPUBUFFER_DRAW_COMMANDS:                    ; [$cfbc]
    dw PPUBuffer_DrawCommand_WritePalette-1 ; [0]: Command 0x00
    dw PPUBuffer_DrawCommand_Noop-1         ; [1]: Command 0xFF
    dw PPUBuffer_DrawCommand_Noop-1         ; [2]: Command 0xFE
    dw PPUBuffer_DrawCommand_Noop-1         ; [3]: Command 0xFD
    dw PPUBuffer_Command_RotateTilesRight1Pixel-1 ; [4]: Command 0xFC
    dw PPUBuffer_DrawCommand_Noop-1         ; [5]: Command 0xFB
    dw PPUBuffer_DrawCommand_RemoveVerticalLines-1 ; [6]: Command 0xFA


;============================================================================
; TODO: Document PPUBuffer_WaitForSomething
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_WaitForSomething
;============================================================================
PPUBuffer_WaitForSomething:                 ; [$cfca]
    JSR PPUBuffer_SomethingCompareTo24
    BCC PPUBuffer_WaitForSomething
    RTS


;============================================================================
; TODO: Document PPUBuffer_SomethingCompareTo24
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     PPUBuffer_WaitForSomething
;============================================================================
PPUBuffer_SomethingCompareTo24:             ; [$cfd0]
    LDA PPUBuffer_Offset                    ; A = PPU buffer offset.
    SEC
    SBC PPUBuffer_UpperBounds               ; Subtract the upper bounds.
    BEQ @_return                            ; If it's 0, return.
    CMP #$24

  @_return:                                 ; [$cfd9]
    RTS
    db $09,$80                              ; [$cfda] word


;============================================================================
; TODO: Document PPUBuffer_QueueCommandOrLength
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__9041
;     FUN_PRG12__92ed
;     IScriptAction_AddItem_Something8EC1
;     Maybe_DrawItemName
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     PasswrodScreen_DrawMessage
;     Strings_Draw
;     Area_WriteTwoBlocksFromData12ToPPUBuffer
;     Area_WriteTwoBlocksFromData34ToPPUBuffer
;     FUN_PRG15_MIRROR__c033
;     FUN_PRG15_MIRROR__d82d
;     FUN_PRG15_MIRROR__eebf
;     FUN_PRG15_MIRROR__f316
;     PPUBuffer_WriteValueMany
;     Player_DrawItemInternal
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_QueueRightCoordInPPUBuffer
;     UI_ClearSelectedItemPic
;     UI_DrawDigitsZeroPadded
;     UI_DrawManaOrHPBar
;============================================================================
PPUBuffer_QueueCommandOrLength:             ; [$cfdc]
    PHA
    JSR PPUBuffer_WaitForSomething
    PLA
    LDX PPUBuffer_UpperBounds               ; Load the upper bounds of the
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
;     PPUBuffer_Offset:
;         The offset to compare.
;
;     PPUBuffer_UpperBounds:
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
    LDA PPUBuffer_UpperBounds               ; Load the upper bounds of the
                                            ; buffer.
    CMP PPUBuffer_Offset                    ; Does it == the offset?
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
;     PPUBuffer_Offset:
;         The offset to compare.
;
;     PPUBuffer_UpperBounds:
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
    LDA PPUBuffer_UpperBounds               ; Load the upper bounds.
    CMP PPUBuffer_Offset                    ; Does it match the offset?
    BNE PPUBuffer_DrawAll                   ; If not, loop.
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d005
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG15_MIRROR__d005:                     ; [$d005]
    LDA #$04
    JSR LoadPalette2
    JMP PPUBuffer_Append0


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d00d
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG15_MIRROR__d00d:                     ; [$d00d]
    LDA a:Something_Maybe_PaletteIndex
    JSR LoadPalette2
    JMP PPUBuffer_Append0


;============================================================================
; TODO: Document PPUBuffer_DrawCommand_WritePalette
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PPUBUFFER_DRAW_COMMANDS
;     [$PRG15_MIRROR::cfbc]
;============================================================================
PPUBuffer_DrawCommand_WritePalette:         ; [$d016]
    ;
    ; Write all 32 palettes to 0x3F00.
    ;
    LDA #$3f                                ; Write the the upper byte of the
                                            ; address
    STA a:PPUADDR
    LDX #$00                                ; Write the the lower byte of the
                                            ; address
    STX a:PPUADDR
    LDY #$20

  @_nextPalette:                            ; [$d022]
    LDA CurrentPaletteData,X
    STA a:PPUDATA
    INX
    DEY
    BNE @_nextPalette

    ;
    ; Avoid palette corruption by setting to address 0x3F00,
    ; and then zeroing out (0x0000).
    ;
    ; See https://www.nesdev.org/wiki/PPU_registers#Palette_corruption
    ;
    LDA #$3f                                ; Write the the upper byte of the
                                            ; address
    STA a:PPUADDR
    STY a:PPUADDR                           ; Write the the lower byte of the
                                            ; address
    STY a:PPUADDR                           ; Now zero out
    STY a:PPUADDR
    RTS


;============================================================================
; TODO: Document LoadPalette2
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     StartScreen_Draw
;     FUN_PRG15_MIRROR__d005
;     FUN_PRG15_MIRROR__d00d
;     Player_HandleDeath
;     Something_SetupNewScreen
;============================================================================
LoadPalette2:                               ; [$d03b]
    TAY                                     ; Y = A

    ;
    ; Save the current bank and load bank 11 (palette data).
    ;
    LDA a:CurrentROMBank2                   ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 11.

    ;
    ; Set the attribute data index for the HUD.
    ;
    LDA #$81f0,Y                            ; Load the HUD attribute data for
                                            ; this index.
    STA a:HUD_AttributeDataIndex            ; Set it for the HUD.

    ;
    ; Restore our current bank.
    ;
    PLA                                     ; Pop A (previous bank) from the
                                            ; stack.
    TAX                                     ; X = A
    JSR MMC1_UpdatePRGBank                  ; Switch back to the bank.

    ;
    ; Get the offset into the bank.
    ;
    TYA                                     ; A = Y
    JSR Palette_IndexToROMOffset16
    ADC #$00
    STA Temp_08
    LDA Temp_09
    ADC #$80
    STA Temp_09
    LDY #$0f
    BNE Palette_PopulateData

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Load a 16-byte palette and copy into RAM.
;
; This will load the palette from PRG bank #11, copying
; into the RAM palette buffer.
;
; A ROM address in bank #11 will be calculated as:
;
;     PaletteAddr = 0x81C0 + (paletteIndex * 16)
;
; Then 16 bytes will be copied from PaletteAddr into the
; RAM palette buffer at ${@address 0x0293}..${@address 0x02B2} (entries
; 16-31).
;
; INPUTS:
;     A:
;         The palette index to load.
;
;     Temp_09:
;         The high/low address for the palette pointer.
;
;         These will be overwritten.
;
; OUTPUTS:
;     RAM ${@address 0x0293}..${@address 0x02B2}:
;         The loaded 16-byte palette.
;
;     Palette_CurrentIndex:
;         The new palette index.
;
;     A, X, Y, processor flags:
;         Clobbered/undefined on return.
;
; XREFS:
;     FUN_PRG15_MIRROR__df64
;     FUN_PRG15_MIRROR__f24d
;     Game_EnterBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     IScripts_ClearPortrait
;     Screen_Load
;============================================================================
Palette_LoadFromIndex:                      ; [$d062]
    STA a:Palette_CurrentIndex              ; Store the selected palette
                                            ; index

    ;
    ; Compute the ROM address for this palette.
    ;
    ; This should be 0x81C0 + palette offset.
    ;
    JSR Palette_IndexToROMOffset16
    ADC #$c0
    STA Temp_08
    LDA Temp_09
    ADC #$81
    STA Temp_09

    ;
    ; Save the previous bank and switch to bank 11 (palette data).
    ;
    LDY #$1f

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Populate palette data for the screen.
;
; This will load the palette data from the data stored
; in bank 11 at the address stored in Temp_08 and
; populate CurrentPaletteData.
;
; INPUTS:
;     Y:
;         The index into the data to load.
;
;     Temp_08:
;         The address to load data from in bank 11.
;
;     CurrentROMBank2:
;         The current ROM bank.
;
; OUTPUTS:
;     CurrentPaletteData:
;         The resulting palette data.
;
; CALLS:
;     MMC1_UpdatePRGBank
;
; XREFS:
;     LoadPalette2
;============================================================================
Palette_PopulateData:                       ; [$d074]
    ;
    ; Save the current bank.
    ;
    LDA a:CurrentROMBank2                   ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$0b
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 11.

    ;
    ; Copy 16 bytes into ROM.
    ;
    TYA                                     ; A = Y (palette data index)
    TAX                                     ; X = A
    LDY #$0f                                ; Y = 15 (loop counter)

  @_loop:                                   ; [$d081]
    LDA (Temp_08),Y                         ; Load the byte to copy.
    STA CurrentPaletteData,X                ; Store as the palette data at
                                            ; the index.
    DEX                                     ; X--
    DEY                                     ; Y--
    BPL @_loop                              ; If >= 0, loop.

    ;
    ; Switch bank to the previous bank.
    ;
    PLA                                     ; Pop the previous bank.
    TAX                                     ; X = A
    JSR MMC1_UpdatePRGBank                  ; Switch to the bank.
    RTS


;============================================================================
; Append a 0 value to the PPU buffer.
;
; The end of the buffer will contain a 0, and the buffer
; size will grow.
;
; INPUTS:
;     PPUBuffer_UpperBounds:
;         The upper bounds of the buffer.
;
; OUTPUTS:
;     PPUBuffer:
;         The PPU buffer to append to.
;
;     PPUBuffer_UpperBounds:
;         The new size of the buffer.
;
; XREFS:
;     PasswordScreen_Show
;     SplashAnimation_DrawScenery
;     SplashAnimation_SomethingA708
;     StartScreen_Draw
;     FUN_PRG15_MIRROR__d005
;     FUN_PRG15_MIRROR__d00d
;     FUN_PRG15_MIRROR__f24d
;     IScripts_ClearPortrait
;     LoadPalette
;     Player_HandleDeath
;     Screen_SetupSprites
;============================================================================
PPUBuffer_Append0:                          ; [$d090]
    LDA #$00                                ; A = 0
    LDX PPUBuffer_UpperBounds               ; X = upper bounds of the buffer
    STA PPUBuffer,X                         ; Store the 0 in the buffer at
                                            ; the upper bounds.
    INX                                     ; Increment the upper bounds.
    STX PPUBuffer_UpperBounds
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
;     LoadPalette2
;     LoadPalette
;     Palette_LoadFromIndex
;============================================================================
Palette_IndexToROMOffset16:                 ; [$d09b]
    LDY #$00
    STY Temp_09
    ASL A
    ROL Temp_09
    ASL A
    ROL Temp_09
    ASL A
    ROL Temp_09
    ASL A
    ROL Temp_09
    CLC
    RTS


;============================================================================
; TODO: Document LoadPalette
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Screen_NextTransitionState
;============================================================================
LoadPalette:                                ; [$d0ad]
    JSR Palette_IndexToROMOffset16
    ADC #$00
    STA Temp_08
    LDA Temp_09
    ADC #$80
    STA Temp_09
    LDA a:CurrentROMBank2
    PHA
    LDX #$0b
    JSR MMC1_UpdatePRGBank
    LDX a:PaletteIndex
    LDY #$0f

  @_loop:                                   ; [$d0c8]
    LDA (Temp_08),Y
    SEC
    SBC #$d0e0,X
    BCS @LAB_PRG15_MIRROR__d0d2
    LDA #$0f

  @LAB_PRG15_MIRROR__d0d2:                  ; [$d0d2]
    STA CurrentPaletteData,Y
    DEY
    BPL @_loop
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    JMP PPUBuffer_Append0

;
; XREFS:
;     LoadPalette
;
BYTE_ARRAY_PRG15_MIRROR__d0e0:              ; [$d0e0]
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
;     FUN_PRG12__8b71
;     FUN_PRG12__8bce
;     FUN_PRG12__8be5
;     FUN_PRG12__906d
;     IScripts_PlayFillingSound
;     IScripts_PlayGoldChangeSound
;     Menu_Something_9405
;     Sound_PlayInputSound
;     Sound_PlayMoveCursorSound
;     SplashAnimation_Maybe_AnimPlayerStep
;     StartScreen_CheckHandleInput
;     UI_ShowPlayerMenu
;     CastMagic_HandleDeluge
;     CastMagic_HandleFire
;     FUN_PRG14__87cb
;     Player_CastMagic
;     Player_HandleTouchBread
;     Player_HandleTouchCoin
;     Player_HandleTouchEnemy
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     SpriteBehavior__9cf2
;     SpriteBehavior__9e6d
;     SpriteBehavior__MaybeSugata
;     SpriteBehavior__ab67
;     Sprites_ReplaceWithCoinDrop
;     Game_DropLadderToMascon
;     Game_UnlockDoor
;     Maybe_Player_PickUpGlove
;     Player_CheckPushingBlock
;     Player_FillHPAndMP
;     Player_HandleDeath
;     Player_PickUpBattleHelmet
;     Player_PickUpBattleSuit
;     Player_PickUpBlackOnyx
;     Player_PickUpDragonSlayer
;     Player_PickUpElixir
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
;     Something_SetupNewScreen
;============================================================================
Area_Maybe_ShowRoomTransition:              ; [$d0f6]
    LDA #$00
    STA Something_Blocks_0047
    STA MaybeUnused_006d
    STA Something_Blocks_0047
    LDA #$00
    STA Something_ScrollIndex
    STA ScrollHelp_Pixel
    STA ScrollHelp_Screen
    STA Something_0077
    STA Something_0073
    STA Something_0074
    STA Something_0075
    STA Something_0076
    LDX #$00
    STX ScrollHelp_Pixel
    INX
    STX ScrollHelp_Screen
    LDX #$01
    JSR Area_ScrollToNextRoom

  @LAB_PRG15_MIRROR__d11c:                  ; [$d11c]
    JSR Maybe_Screen_Scroll
    JSR FUN_PRG15_MIRROR__d61d
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
    LDA ScrollHelp_Screen
    STA Something_Player_ScrollX
    LDA ScrollHelp_Pixel
    STA Something_Blocks_0045
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
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
    JSR MMC1_UpdatePRGBank
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
    LDA PlayerPosY
    STA Maybe_PlayerY_ForScroll
    LDA #$d1e7,X
    STA Maybe_PlayerX_ForScroll
    RTS

  @_VerticalScroll:                         ; [$d1d6]
    AND #$01
    TAX
    LDA PlayerPosX_Full
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
; screen. Block data is stored [...]
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
    ; The value will be 0-3.
    ;
    ; 0x00: Copy from previous block value (same row of previous,
    ;       if at column 0)
    ;
    ; 0x01: Copy from the block directly above
    ;
    ; 0x02: Copy from the block directly up and to the left
    ;       (or last block 2 rows up, if at column 0)
    ;
    ; 0x03: Read the block
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
    ; Read an 8-bit block.
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
;     MMC1_UpdatePRGBank
;
; XREFS:
;     Screen_BeginScrollAndLoadBlockProperties
;============================================================================
Area_LoadBlockProperties:                   ; [$d276]
    ;
    ; Switch to bank 3, where the level data is stored.
    ;
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank

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
    JSR MMC1_UpdatePRGBank                  ; Switch banks.
    RTS


;============================================================================
; TODO: Document Screen_BeginScrollAndLoadBlockProperties
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Screen_Scroll
;     Maybe_Screen_Scroll_D2A6
;============================================================================
Screen_BeginScrollAndLoadBlockProperties:   ; [$d29f]
    LDA #$ff
    STA Screen_ScrollDirection
    JMP Area_LoadBlockProperties


;============================================================================
; TODO: Document Maybe_Screen_Scroll_D2A6
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Screen_Scroll
;============================================================================
Maybe_Screen_Scroll_D2A6:                   ; [$d2a6]
    LDA Something_ScrollIndex
    BNE @LAB_PRG15_MIRROR__d2ac
    LDA #$d0

  @LAB_PRG15_MIRROR__d2ac:                  ; [$d2ac]
    SEC
    SBC #$01
    STA Something_ScrollIndex
    BNE @LAB_PRG15_MIRROR__d2b8
    DEC Something_Player_ScrollY
    JSR Screen_BeginScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d2b8:                  ; [$d2b8]
    LDA Something_ScrollIndex
    STA Something_Blocks_0044
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    JSR FUN_PRG15_MIRROR__d393
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d2ce
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__d2ce
;     FUN_PRG15_MIRROR__dd0f
;============================================================================
FUN_PRG15_MIRROR__d2ce:                     ; [$d2ce]
    JSR Game_UpdatePlayerOnScroll
    JSR Maybe_Screen_Scroll
    JSR FUN_PRG15_MIRROR__d61d
    LDA Screen_ScrollDirection
    CMP #$02
    BCS @LAB_PRG15_MIRROR__d2e2
    LDA ScrollHelp_Pixel
    BNE FUN_PRG15_MIRROR__d2ce
    RTS

  @LAB_PRG15_MIRROR__d2e2:                  ; [$d2e2]
    LDA Something_ScrollIndex
    BNE FUN_PRG15_MIRROR__d2ce

    ;
    ; XREFS:
    ;     Maybe_Screen_Scroll
    ;
RETURN_D2E6:                                ; [$d2e6]
    RTS


;============================================================================
; TODO: Document Maybe_Screen_Scroll
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     FUN_PRG15_MIRROR__d2ce
;     Game_MainLoop
;============================================================================
Maybe_Screen_Scroll:                        ; [$d2e7]
    LDX Screen_ScrollDirection
    BEQ @_notScrolling

    ;
    ; The screen is currently scrolling.
    ;
    DEX
    BEQ @LAB_PRG15_MIRROR__d31e
    DEX
    BEQ Maybe_Screen_Scroll_D2A6
    DEX
    BNE RETURN_D2E6
    LDA Something_ScrollIndex
    CLC
    ADC #$01
    STA Something_ScrollIndex
    CMP #$d0
    BCC @LAB_PRG15_MIRROR__d308
    LDA #$00
    STA Something_ScrollIndex
    INC Something_Player_ScrollY
    JSR Screen_BeginScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d308:                  ; [$d308]
    LDA Something_ScrollIndex
    STA Something_Blocks_0044
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    JSR FUN_PRG15_MIRROR__d3a6
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS

  @LAB_PRG15_MIRROR__d31e:                  ; [$d31e]
    LDA ScrollHelp_Pixel
    CLC
    ADC #$01
    STA ScrollHelp_Pixel
    PHP
    LDA Something_Player_ScrollX
    ADC #$00
    STA Something_Player_ScrollX
    STA ScrollHelp_Screen
    PLP
    BCC @LAB_PRG15_MIRROR__d334
    JSR Screen_BeginScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d334:                  ; [$d334]
    LDA ScrollHelp_Pixel
    STA Something_Blocks_0045
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    JSR FUN_PRG15_MIRROR__d4dc
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS

    ;
    ; The screen is not currently scrolling.
    ;
  @_notScrolling:                           ; [$d34a]
    LDA Something_Blocks_0045
    CMP #$fc
    BCS @LAB_PRG15_MIRROR__d364
    LDA ScrollHelp_Pixel
    SEC
    SBC #$01
    STA ScrollHelp_Pixel
    PHP
    LDA ScrollHelp_Screen
    SBC #$00
    STA ScrollHelp_Screen
    PLP
    BNE @LAB_PRG15_MIRROR__d364
    JSR Screen_BeginScrollAndLoadBlockProperties

  @LAB_PRG15_MIRROR__d364:                  ; [$d364]
    LDA Something_Blocks_0045
    SEC
    SBC #$01
    STA Something_Blocks_0045
    LDA Something_Player_ScrollX
    SBC #$00
    STA Something_Player_ScrollX
    CMP ScrollHelp_Screen
    BNE @LAB_PRG15_MIRROR__d37c
    LDA ScrollHelp_Pixel
    CMP #$04
    BCS @LAB_PRG15_MIRROR__d37c
    RTS

  @LAB_PRG15_MIRROR__d37c:                  ; [$d37c]
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    JSR FUN_PRG15_MIRROR__d4f0
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d38e
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__d393
;     FUN_PRG15_MIRROR__d3a6
;============================================================================
FUN_PRG15_MIRROR__d38e:                     ; [$d38e]
    INC Something_Blocks_Counter_006E
    JMP Maybe_Area_LoadBlocks


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d393
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Screen_Scroll_D2A6
;============================================================================
FUN_PRG15_MIRROR__d393:                     ; [$d393]
    LDX #$00
    STX Something_Blocks_Counter_006E
    LDA Something_Blocks_0044
    AND #$0f
    CMP #$07
    BEQ FUN_PRG15_MIRROR__d38e
    AND #$07
    CMP #$03
    BEQ Maybe_Area_LoadBlocks
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d3a6
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Screen_Scroll
;============================================================================
FUN_PRG15_MIRROR__d3a6:                     ; [$d3a6]
    LDX #$00
    STX Something_Blocks_Counter_006E
    INX
    LDA Something_Blocks_0044
    AND #$0f
    CMP #$08
    BEQ FUN_PRG15_MIRROR__d38e
    AND #$07
    CMP #$04
    BEQ Maybe_Area_LoadBlocks
    RTS


;============================================================================
; TODO: Document Maybe_Area_LoadBlocks
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__d38e
;     FUN_PRG15_MIRROR__d393
;     FUN_PRG15_MIRROR__d3a6
;============================================================================
Maybe_Area_LoadBlocks:                      ; [$d3ba]
    LDA Something_Blocks_0044
    CLC
    ADC #$d4cb,X
    STA Temp_00
    LDA Something_Player_ScrollY
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
    LDA Something_Blocks_Counter_006E
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
    LDA Something_Blocks_0044
    AND #$08
    LSR A
    LSR A
    TAY
    LDA CurrentArea_BlockData1CurAddr,Y
    STA ShopItems,X
    LDA CurrentArea_BlockData2CurAddr,Y
    STA #$0221,X
    INX
    INX
    LDY Temp_06
    INY
    CPY #$10
    BCC @LAB_PRG15_MIRROR__d3ea
    LDA #$00
    STA Something_ShopItem_PPUAddr_U
    LDA Something_Blocks_0044
    AND #$f8
    ASL A
    ROL Something_ShopItem_PPUAddr_U
    ASL A
    ROL Something_ShopItem_PPUAddr_U
    CLC
    ADC #$80
    STA Something_ShopItem_PPUAddr_L
    LDA Something_ShopItem_PPUAddr_U
    ADC #$00
    STA Something_ShopItem_PPUAddr_U
    LDA Something_Player_ScrollX
    AND #$01
    ASL A
    ASL A
    ORA #$20
    ORA Something_ShopItem_PPUAddr_U
    STA Something_ShopItem_PPUAddr_U
    LDA #$01
    STA Something_0073
    RTS

  @LAB_PRG15_MIRROR__d445:                  ; [$d445]
    LDA Something_Blocks_0044
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
    ORA Something_BlocksPPUData,Y
    STA Something_BlocksPPUData,Y
    LDY Temp_06
    INY
    CPY #$10
    BCC @LAB_PRG15_MIRROR__d458
    LDX #$f0
    LDA Something_Blocks_0044
    AND #$10
    BEQ @LAB_PRG15_MIRROR__d48a
    LDX #$0f

  @LAB_PRG15_MIRROR__d48a:                  ; [$d48a]
    STX Temp_06
    LDA Something_Blocks_0044
    AND #$e0
    LSR A
    LSR A
    STA Temp_00
    CLC
    ADC #$08
    TAY
    CLC
    ADC #$c0
    STA Something_Blocks_PPUAddr2_L
    LDA Something_Player_ScrollX
    AND #$01
    TAX
    ASL A
    ASL A
    ORA #$23
    STA Something_Blocks_PPUAddr2_U
    LDA #$d4cf,X
    STA Temp_08
    LDA #$d4d1,X
    STA Temp_09
    LDX #$00

  @LAB_PRG15_MIRROR__d4b4:                  ; [$d4b4]
    LDA (Temp_08),Y
    AND Temp_06
    ORA Something_BlocksPPUData,X
    STA (Temp_08),Y
    STA Something_BlocksPPUData,X
    INY
    INX
    CPX #$08
    BCC @LAB_PRG15_MIRROR__d4b4
    LDA #$01
    STA Something_0075
    RTS
    db $00                                  ; [$d4cb] undefined

;
; XREFS:
;     Maybe_Area_LoadBlocks
;
BYTE_PRG15_MIRROR__d4cc:                    ; [$d4cc]
    db $00,$00,$08                          ; [$d4cc] byte

;
; XREFS:
;     FUN_PRG15_MIRROR__d503
;     FUN_PRG15_MIRROR__d82d
;     Maybe_Area_LoadBlocks
;
BYTE_ARRAY_PRG15_MIRROR__d4cf:              ; [$d4cf]
    db $42                                  ; [0]:
    db $42                                  ; [1]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d503
;     FUN_PRG15_MIRROR__d82d
;     Maybe_Area_LoadBlocks
;
BYTE_ARRAY_PRG15_MIRROR__d4d1:              ; [$d4d1]
    db $02                                  ; [0]:
    db $02                                  ; [1]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d503
;     Maybe_Area_LoadBlocks
;
BYTE_ARRAY_PRG15_MIRROR__d4d3:              ; [$d4d3]
    db $03                                  ; [0]:
    db $0c                                  ; [1]:
    db $30                                  ; [2]:
    db $c0                                  ; [3]:


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d4d7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__d4dc
;     FUN_PRG15_MIRROR__d4f0
;============================================================================
FUN_PRG15_MIRROR__d4d7:                     ; [$d4d7]
    INC Something_Blocks_Counter_006E
    JMP FUN_PRG15_MIRROR__d503


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d4dc
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Screen_Scroll
;============================================================================
FUN_PRG15_MIRROR__d4dc:                     ; [$d4dc]
    LDX #$00
    STX Something_Blocks_Counter_006E
    INX
    LDA Something_Blocks_0045
    AND #$0f
    CMP #$02
    BEQ FUN_PRG15_MIRROR__d4d7
    AND #$07
    CMP #$01
    BEQ FUN_PRG15_MIRROR__d503
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d4f0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Screen_Scroll
;============================================================================
FUN_PRG15_MIRROR__d4f0:                     ; [$d4f0]
    LDX #$00
    STX Something_Blocks_Counter_006E
    LDA Something_Blocks_0045
    AND #$0f
    CMP #$0f
    BEQ FUN_PRG15_MIRROR__d4d7
    AND #$07
    CMP #$06
    BEQ FUN_PRG15_MIRROR__d503
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d503
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__d4d7
;     FUN_PRG15_MIRROR__d4dc
;     FUN_PRG15_MIRROR__d4f0
;============================================================================
FUN_PRG15_MIRROR__d503:                     ; [$d503]
    LDA Something_Blocks_0045
    CLC
    ADC #$d619,X
    STA Temp_00
    LDA Something_Player_ScrollX
    ADC #$d61b,X
    STA Something_Blocks_0047
    LDA Area_CurrentScreen
    STA MaybeUnused_006d
    LDA Temp_00
    LSR A
    LSR A
    LSR A
    LSR A
    STA Something_Blocks_0046
    LDA #$00
    STA Temp_08
    LDA #$06
    STA Temp_09
    LDA Something_Blocks_Counter_006E
    BNE @LAB_PRG15_MIRROR__d587
    LDX #$00

  @LAB_PRG15_MIRROR__d52c:                  ; [$d52c]
    LDY Something_Blocks_0046
    LDA (Temp_08),Y
    TAY
    LDA (CurrentArea_BlockData1StartAddr),Y
    STA CurrentArea_BlockData1CurAddr
    LDA (CurrentArea_BlockData3StartAddr),Y
    STA CurrentArea_BlockData2CurAddr
    LDA (CurrentArea_BlockData2StartAddr),Y
    STA CurrentArea_BlockData3CurAddr
    LDA (CurrentArea_BlockData4StartAddr),Y
    STA CurrentArea_BlockData4CurAddr
    LDA Something_Blocks_0045
    AND #$08
    LSR A
    LSR A
    TAY
    LDA CurrentArea_BlockData1CurAddr,Y
    STA Temp_0200,X
    LDA CurrentArea_BlockData2CurAddr,Y
    STA IScriptEntity,X
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
    BCC @LAB_PRG15_MIRROR__d52c
    LDA #$01
    STA Something_0074
    TYA
    LSR A
    PHA
    LDA Something_Blocks_0046
    ASL A
    STA Something_Blocks_0046
    PLA
    CLC
    ADC Something_Blocks_0046
    CLC
    ADC #$80
    STA Something_Blocks_PPUAddr_L
    LDA Something_Blocks_0047
    AND #$01
    ASL A
    ASL A
    ORA #$20
    STA Something_Blocks_PPUAddr_U
    RTS

  @LAB_PRG15_MIRROR__d587:                  ; [$d587]
    LDY #$f8
    LDA #$00

  @LAB_PRG15_MIRROR__d58b:                  ; [$d58b]
    STA #$018a,Y
    INY
    BNE @LAB_PRG15_MIRROR__d58b
    LDX #$00

  @LAB_PRG15_MIRROR__d593:                  ; [$d593]
    LDY Something_Blocks_0046
    LDA (Temp_08),Y
    TAY
    LDA (CurrentArea_BlockAttributesAddr),Y
    STA Temp_00
    LDA Something_Blocks_0046
    AND #$01
    STA Temp_01
    TXA
    AND #$01
    ASL A
    ORA Temp_01
    TAY
    LDA Temp_00
    AND #$d4d3,Y
    PHA
    TXA
    LSR A
    TAY
    PLA
    ORA Something_PPUData,Y
    STA Something_PPUData,Y
    LDA Temp_08
    CLC
    ADC #$10
    STA Temp_08
    LDA Temp_09
    ADC #$00
    STA Temp_09
    INX
    CPX #$0f
    BCC @LAB_PRG15_MIRROR__d593
    LDX #$cc
    LDA Something_Blocks_0046
    AND #$01
    BEQ @LAB_PRG15_MIRROR__d5d5
    LDX #$33

  @LAB_PRG15_MIRROR__d5d5:                  ; [$d5d5]
    STX Temp_06
    LDA Something_Blocks_0046
    LSR A
    CLC
    ADC #$08
    TAY
    CLC
    ADC #$c0
    STA Something_PPUAddr_L
    LDA Something_Blocks_0047
    AND #$01
    TAX
    ASL A
    ASL A
    ORA #$23
    STA Something_PPUAddr_U
    LDA #$d4cf,X
    STA Temp_08
    LDA #$d4d1,X
    STA Temp_09
    LDX #$00

  @LAB_PRG15_MIRROR__d5fa:                  ; [$d5fa]
    LDA (Temp_08),Y
    AND Temp_06
    ORA Something_PPUData,X
    STA Something_PPUData,X
    STA (Temp_08),Y
    INX
    TXA
    AND #$07
    TXA
    TYA
    CLC
    ADC #$08
    TAY
    CPY #$40
    BCC @LAB_PRG15_MIRROR__d5fa
    LDA #$01
    STA Something_0076
    RTS

;
; XREFS:
;     FUN_PRG15_MIRROR__d503
;
BYTE_ARRAY_PRG15_MIRROR__d619:              ; [$d619]
    db $00                                  ; [0]:
    db $ff                                  ; [1]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d503
;
BYTE_ARRAY_PRG15_MIRROR__d61b:              ; [$d61b]
    db $00                                  ; [0]:
    db $00                                  ; [1]:


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d61d
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Area_Maybe_ShowRoomTransition
;     FUN_PRG15_MIRROR__d2ce
;     PPU_HandleOnInterrupt
;============================================================================
FUN_PRG15_MIRROR__d61d:                     ; [$d61d]
    LDA #$03
    STA Temp_06
    LDX Something_0077

  @LAB_PRG15_MIRROR__d623:                  ; [$d623]
    LDA Something_0073,X
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
    STA Something_0073,X
    STX Temp_06
    INX
    TXA
    AND #$03
    TAX
    STX Something_0077
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
;     FUN_PRG15_MIRROR__d61d
;
BYTE_ARRAY_PRG15_MIRROR__d64c:              ; [$d64c]
    db $53                                  ; [0]:
    db $72                                  ; [1]:
    db $98                                  ; [2]:
    db $b0                                  ; [3]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d61d
;
BYTE_ARRAY_PRG15_MIRROR__d650:              ; [$d650]
    db $d6                                  ; [0]:
    db $d6                                  ; [1]:
    db $d6                                  ; [2]:
    db $d6                                  ; [3]:


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d654
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     BYTE_ARRAY_PRG15_MIRROR__d64c
;     [$PRG15_MIRROR::d64c]
;============================================================================
FUN_PRG15_MIRROR__d654:                     ; [$d654]
    LDA SavedPPUCtrl
    AND #$fb
    STA a:PPUCTRL
    LDA Something_ShopItem_PPUAddr_U
    STA a:PPUADDR
    LDA Something_ShopItem_PPUAddr_L
    STA a:PPUADDR
    LDX #$00

  @LAB_PRG15_MIRROR__d667:                  ; [$d667]
    LDA ShopItems,X
    STA a:PPUDATA
    INX
    CPX #$20
    BCC @LAB_PRG15_MIRROR__d667
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d673
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     BYTE_ARRAY_PRG15_MIRROR__d64c
;     [$PRG15_MIRROR::d64d]
;============================================================================
FUN_PRG15_MIRROR__d673:                     ; [$d673]
    LDA SavedPPUCtrl
    ORA #$04
    STA a:PPUCTRL
    LDA Something_Blocks_PPUAddr_U
    STA a:PPUADDR
    LDA Something_Blocks_PPUAddr_L
    STA a:PPUADDR
    LDX #$00

  @LAB_PRG15_MIRROR__d686:                  ; [$d686]
    LDA Temp_0200,X
    STA a:PPUDATA
    INX
    CPX #$1a
    BCC @LAB_PRG15_MIRROR__d686
    LDA SavedPPUCtrl
    AND #$fb
    STA a:PPUCTRL
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d699
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     BYTE_ARRAY_PRG15_MIRROR__d64c
;     [$PRG15_MIRROR::d64e]
;============================================================================
FUN_PRG15_MIRROR__d699:                     ; [$d699]
    LDA Something_Blocks_PPUAddr2_U
    STA a:PPUADDR
    LDA Something_Blocks_PPUAddr2_L
    STA a:PPUADDR
    LDX #$00

  @LAB_PRG15_MIRROR__d6a5:                  ; [$d6a5]
    LDA Something_BlocksPPUData,X
    STA a:PPUDATA
    INX
    CPX #$08
    BCC @LAB_PRG15_MIRROR__d6a5
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d6b1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     BYTE_ARRAY_PRG15_MIRROR__d64c
;     [$PRG15_MIRROR::d64f]
;============================================================================
FUN_PRG15_MIRROR__d6b1:                     ; [$d6b1]
    LDX #$00

  @LAB_PRG15_MIRROR__d6b3:                  ; [$d6b3]
    LDA Something_PPUAddr_U
    STA a:PPUADDR
    TXA
    ASL A
    ASL A
    ASL A
    CLC
    ADC Something_PPUAddr_L
    STA a:PPUADDR
    LDA Something_PPUData,X
    STA a:PPUDATA
    INX
    CPX #$07
    BCC @LAB_PRG15_MIRROR__d6b3
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d6ce
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_FallToGround
;============================================================================
FUN_PRG15_MIRROR__d6ce:                     ; [$d6ce]
    STX Temp_00
    LDX #$00
    LDA Blocks_Result

  @LAB_PRG15_MIRROR__d6d4:                  ; [$d6d4]
    CMP #$d6ef,X
    BEQ @_incI
    INX
    CPX #$03
    BCC @LAB_PRG15_MIRROR__d6d4
    BCS @LAB_PRG15_MIRROR__d6e1

  @_incI:                                   ; [$d6e0]
    INX

  @LAB_PRG15_MIRROR__d6e1:                  ; [$d6e1]
    LDA #$d6ef,X
    STA a:Something_Maybe_BlockOffset
    LDX Temp_00
    STA ScreenBuffer,X
    JMP Area_SetBlocks

;
; XREFS:
;     FUN_PRG15_MIRROR__d6ce
;
BYTE_ARRAY_PRG15_MIRROR__d6ef:              ; [$d6ef]
    db $34                                  ; [0]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d6ce
;
BYTE_ARRAY_PRG15_MIRROR__d6ef_1_:           ; [$d6f0]
    db $2c                                  ; [1]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d6ce
;
BYTE_ARRAY_PRG15_MIRROR__d6ef_2_:           ; [$d6f1]
    db $5c                                  ; [2]:
    db $13                                  ; [3]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d82d
;
BYTE_ARRAY_PRG15_MIRROR__d6f3:              ; [$d6f3]
    db $20                                  ; [0]: Ladder
    db $24                                  ; [1]:


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
;     FUN_PRG15_MIRROR__d6ce
;     FUN_PRG15_MIRROR__d7b0
;     Game_DropLadderToMascon
;     Game_OpenPathToMascon
;     Player_UseMattock
;============================================================================
Area_SetBlocks:                             ; [$d7c5]
    STA a:Something_Maybe_BlockOffset
    STX Temp_00
    TXA
    PHA
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    LDA Temp_00
    PHA
    TAX
    JSR Something_SetPPUAddrForXYTransformed
    JSR Area_WriteTwoBlocksFromData12ToPPUBuffer
    LDA a:PPU_TargetAddr
    CLC
    ADC #$20
    STA a:PPU_TargetAddr
    LDA a:PPU_TargetAddr.U
    ADC #$00
    STA a:PPU_TargetAddr.U
    JSR Area_WriteTwoBlocksFromData34ToPPUBuffer
    PLA
    JSR FUN_PRG15_MIRROR__d82d
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    PLA
    TAX
    RTS


;============================================================================
; Write two blocks from area data 1 and 2 to the PPU buffer.
;
; This will load two tiles from the area data from
; CurrentArea_BlockData1StartAddr and
; CurrentArea_BlockData2StartAddr at offset
; Something_Maybe_BlockOffset and write them to the PPU
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
;     Something_Maybe_BlockOffset:
;         The offset within the area block data to read from.
;
; OUTPUTS:
;     PPUBuffer:
;         The updated PPU buffer.
;
;     PPUBuffer_UpperBounds:
;         The updated upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Area_SetBlocks
;============================================================================
Area_WriteTwoBlocksFromData12ToPPUBuffer:   ; [$d7ff]
    ;
    ; Set the tile length to 2.
    ;
    LDA #$02
    JSR PPUBuffer_QueueCommandOrLength      ; Write length of 2.

    ;
    ; Load the first block and write to the PPU.
    ;
    LDY a:Something_Maybe_BlockOffset       ; Load the block position within
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
    STX PPUBuffer_UpperBounds               ; Set X as the new upper bounds
                                            ; of the PPU buffer.
    RTS


;============================================================================
; Write two blocks from area data 3 and 4 to the PPU buffer.
;
; This will load two tiles from the area data from
; CurrentArea_BlockData3StartAddr and
; CurrentArea_BlockData4StartAddr at offset
; Something_Maybe_BlockOffset and write them to the PPU
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
;     Something_Maybe_BlockOffset:
;         The offset within the area block data to read from.
;
; OUTPUTS:
;     PPUBuffer:
;         The updated PPU buffer.
;
;     PPUBuffer_UpperBounds:
;         The updated upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Area_SetBlocks
;============================================================================
Area_WriteTwoBlocksFromData34ToPPUBuffer:   ; [$d816]
    ;
    ; Set the tile length to 2.
    ;
    LDA #$02
    JSR PPUBuffer_QueueCommandOrLength

    ;
    ; Load the first block and write to the PPU.
    ;
    LDY a:Something_Maybe_BlockOffset
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
    STX PPUBuffer_UpperBounds
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__d82d
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
FUN_PRG15_MIRROR__d82d:                     ; [$d82d]
    CLC
    ADC #$20
    STA Temp_00
    LSR A
    LSR A
    AND #$38
    STA a:PPU_TargetAddr
    LDA Temp_00
    AND #$0f
    LSR A
    ORA a:PPU_TargetAddr
    STA a:PPU_TargetAddr
    LDA Temp_00
    AND #$10
    LSR A
    LSR A
    LSR A
    STA Temp_06
    LDA Temp_00
    AND #$01
    ORA Temp_06
    STA Temp_06
    LDY a:Something_Maybe_BlockOffset
    LDA (CurrentArea_BlockAttributesAddr),Y
    LDX Temp_06
    AND #$d8a4,X
    PHA
    LDA ScrollHelp_Screen
    AND #$01
    TAX
    LDA #$d4cf,X
    STA Temp_Addr_L
    LDA #$d4d1,X
    STA Temp_Addr_U
    LDA #$d6f3,X
    STA a:PPU_TargetAddr.U
    LDY a:PPU_TargetAddr
    LDA (Temp_Addr_L),Y
    LDX Temp_06
    AND #$d8a8,X
    STA Temp_06
    PLA
    ORA Temp_06
    STA (Temp_Addr_L),Y
    PHA
    LDA a:PPU_TargetAddr.U
    ORA #$03
    STA a:PPU_TargetAddr.U
    LDA a:PPU_TargetAddr
    ORA #$c0
    STA a:PPU_TargetAddr
    LDA #$01
    JSR PPUBuffer_QueueCommandOrLength
    PLA
    STA PPUBuffer,X
    INX
    STX PPUBuffer_UpperBounds
    RTS

;
; XREFS:
;     FUN_PRG15_MIRROR__d82d
;
BYTE_ARRAY_PRG15_MIRROR__d8a4:              ; [$d8a4]
    db $03                                  ; [0]:
    db $0c                                  ; [1]:
    db $30                                  ; [2]:
    db $c0                                  ; [3]:

;
; XREFS:
;     FUN_PRG15_MIRROR__d82d
;
BYTE_ARRAY_PRG15_MIRROR__d8a8:              ; [$d8a8]
    db $fc                                  ; [0]:
    db $f3                                  ; [1]:
    db $cf                                  ; [2]:
    db $3f                                  ; [3]:


;============================================================================
; TODO: Document Something_SetPPUAddrForXYTransformed
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
Something_SetPPUAddrForXYTransformed:       ; [$d8ac]
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
    LDA ScrollHelp_Screen
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
;     Something_SetPPUAddrForXYTransformed
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
;     LoadPalette2
;     MMC1_LoadBankAndJump
;     GameLoop_Maybe_SetupDrawState
;     Maybe_Player_UpdateVisibleItemStates
;     PPUBuffer_Append0
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
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 14.

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
    JSR GameLoop_Maybe_SetupDrawState       ; Reset animations.
    JSR #$b7bf                              ; Reset selected item state.
    JSR Maybe_Player_UpdateVisibleItemStates ; Update player sprite.

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
    STA a:PaletteIndex                      ; Clear the palette index.

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
    JSR GameLoop_Maybe_SetupDrawState       ; Reset animations.
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
    LDA a:Something_Maybe_PaletteIndex
    JSR LoadPalette2                        ; Load the palette.
    JSR PPUBuffer_Append0                   ; Append 0 to the PPU buffer.

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
    LDA #$00
    STA CurrentMusic

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
;     GameLoop_Maybe_SetupDrawState
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
    JSR GameLoop_Maybe_SetupDrawState       ; Reset for this frame.
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
    TXA                                     ; A = X
    PHA                                     ; Push to the stack.
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR GameLoop_Maybe_SetupDrawState       ; Reset for this frame.
    PLA                                     ; Pop our loop counter.
    TAX                                     ; X = A
    DEX                                     ; X--
    BNE @_beforeTransitionLoop              ; If > 0, loop.

    ;
    ; Move the player to the King's room and begin the
    ; end-game dialogue sequence.
    ;
    JMP EndGame_BeginKingsRoomSequence      ; Begin the next transition into
                                            ; the King's room.


;============================================================================
; TODO: Document Player_DrawDeathAnimation
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
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
    LDX PPUBuffer_UpperBounds               ; X = PPU buffer upper bounds.
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
    STX PPUBuffer_UpperBounds               ; Set as the new upper bounds for
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
UNUSED_FUN_PRG15_MIRROR__da29:              ; [$da29]
    LDA #$ff
    STA a:PaletteIndex
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
;     PaletteIndex:
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
    STA a:PaletteIndex                      ; Set as the index into the
                                            ; screen palette lookup.

  @_loop:                                   ; [$da34]
    JSR WaitForInterrupt                    ; Wait for the next interrupt.
    JSR Screen_NextTransitionState          ; Update the screen for this
                                            ; palete.
    LDA a:PaletteIndex                      ; Load the palette index.
    CMP #$04                                ; Is it < 4?
    BCC @_loop                              ; If so, loop.
    RTS


;============================================================================
; Handle the next state for a screen transition.
;
; This may be used when entering a building or when dying.
; An outer loop will call this each tick. It won't begin
; the fadeout until PaletteIndex is a value 0-4.
;
; The palette will increase at periodic intervals,
; eventually ending with a black screen.
;
; INPUTS:
;     PaletteIndex:
;         The current palette index.
;
;     Screen_FadeOutCounter:
;         The counter for this loop.
;
;     Something_Maybe_PaletteIndex:
;         The palette index to apply for the transition.
;
; OUTPUTS:
;     PaletteIndex:
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
    LDA a:PaletteIndex                      ; Load the current palette index.
    CMP #$04                                ; Is it >= 4?
    BCS @LAB_PRG15_MIRROR__da5d             ; If so, jump to finish up.
    LDA a:Screen_FadeOutCounter             ; A = fadeout counter.
    CLC
    ADC #$32                                ; A += 0x32 (50)
    STA a:Screen_FadeOutCounter             ; Store as the new value.
    BCC @LAB_PRG15_MIRROR__da5d

    ;
    ; Fade out to the next palette towards black.
    ;
    LDA a:Something_Maybe_PaletteIndex
    JSR LoadPalette
    INC a:PaletteIndex

  @LAB_PRG15_MIRROR__da5d:                  ; [$da5d]
    LDA a:Screen_TransitionCounter
    CMP #$50
    BNE @_return

    ;
    ; We're doing player death, and have finished dissolving
    ; the player. We can now begin fading to black.
    ;
    LDA #$00
    STA a:PaletteIndex

  @_return:                                 ; [$da69]
    RTS


;============================================================================
; TODO: Document Game_InitStateForStartScreen
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_Init
;============================================================================
Game_InitStateForStartScreen:               ; [$da6a]
    LDX #$ff
    TXS
    LDA #$00
    STA Area_CurrentArea
    STA a:Area_Region
    JSR #$b7ae
    JSR Game_InitStateForSpawn
    JMP Game_ShowStartScreen


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
    JSR PPU_WaitUntilFlushed
    LDA #$00
    STA a:PlayerIsDead
    STA PPUBuffer_UpperBounds
    STA PPUBuffer_Offset
    STA Maybe_ScreenReadyState
    JSR Player_SetInitialState
    JSR #$ba55
    JSR FUN_PRG15_MIRROR__ce80
    LDA #$01
    STA a:Maybe_GameScreenStart
    LDA #$00
    STA ScrollHelp_Pixel
    STA ScrollHelp_Screen
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
    JSR FUN_PRG15_MIRROR__cb17
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
    JSR FUN_PRG15_MIRROR__cb17
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
    JSR FUN_PRG15_MIRROR__cb17
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
;     Area_ChangeArea
;============================================================================
FUN_PRG15_MIRROR__dacd:                     ; [$dacd]
    JSR PPU_WaitUntilFlushed
    JSR FUN_PRG15_MIRROR__df64
    JSR FUN_PRG15_MIRROR__cb17
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
    JSR FUN_PRG15_MIRROR__cb17
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages
    JMP Game_MainLoop


;============================================================================
; Dead code that would assign the area based on transitioning from another.
;============================================================================
    hex ae 35 04 bd fe da 85 24             ; [$daf6] undefined

;
; XREFS:
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
;     FUN_PRG15_MIRROR__cb17
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
    JSR FUN_PRG15_MIRROR__cb17
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
    JSR MMC1_UpdatePRGBank
    JSR WaitForNextFrame
    JSR GameLoop_Maybe_SetupDrawState
    JSR GameLoop_UpdatePlayer
    JSR #$b982                              ; Draw shield
    JSR Player_DrawBody                     ; Draw weapon?
    JSR #$b7d6                              ; Draw weapon?
    JSR #$ba5b                              ; Draw magic?
    JSR GameLoop_CheckUseCurrentItem        ; Active selected item?
    JSR ROMBankStart                        ; Sprites
    JSR GameLoop_CountdownItems
    JSR GameLoop_AnimateFog
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
    LDA a:Maybe_GameScreenStart
    BEQ @LAB_PRG15_MIRROR__db91
    LDA Screen_ScrollDirection
    CMP #$02
    BCC @LAB_PRG15_MIRROR__dbaf

  @LAB_PRG15_MIRROR__db91:                  ; [$db91]
    JSR GameLoop_Maybe_SetupDrawState
    JSR WaitForNextFrame
    JSR GameLoop_ClearSprites
    JSR GameLoop_LoadSpriteInfo
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages
    JSR PPU_WaitUntilFlushed
    JSR FUN_PRG15_MIRROR__dd0f
    JSR FUN_PRG15_MIRROR__cb17
    JMP Game_MainLoop

  @LAB_PRG15_MIRROR__dbaf:                  ; [$dbaf]
    JSR WaitForNextFrame
    JSR GameLoop_Maybe_SetupDrawState
    JSR #$b982
    JSR Player_DrawBody
    JSR #$b7d6
    JSR GameLoop_ClearSprites
    JSR GameLoop_LoadSpriteInfo
    JSR WaitForNextFrame
    JSR GameLoop_LoadSpriteImages

  @_scrolling:                              ; [$dbca]
    JSR WaitForNextFrame
    JSR GameLoop_Maybe_SetupDrawState
    JSR Game_UpdatePlayerOnScroll
    JSR #$b982
    JSR Player_DrawBody
    JSR #$b7d6
    JSR Maybe_Screen_Scroll
    JSR Maybe_Screen_Scroll
    JSR Maybe_Screen_Scroll
    JSR Maybe_Screen_Scroll
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
;     MMC1_UpdatePRGBank
;     GameLoop_AnimateFog
;     GameLoop_CheckShowPlayerMenu
;     GameLoop_CheckUseCurrentItem
;     GameLoop_CountdownItems
;     GameLoop_RunScreenEventHandlers
;     GameLoop_Maybe_SetupDrawState
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
    JSR MMC1_UpdatePRGBank                  ; Set bank to 14 (Logic).

    ;
    ; Wait for a frame and prepare for renders.
    ;
    JSR WaitForNextFrame                    ; Wait for the next frame.
    JSR GameLoop_Maybe_SetupDrawState

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
    JSR GameLoop_AnimateFog                 ; No-op
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
;     PlayerPosX_Full:
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
    LDA PlayerPosX_Full                     ; A = player X.
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
;     CurrentROMBank2:
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
;     MMC1_UpdatePRGBank
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
    LDA a:CurrentROMBank2                   ; Load the current bank.
    PHA                                     ; Push to the stack.
    LDX #$0e
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 14.

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
;     FUN_PRG15_MIRROR__df64
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
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    LDA a:ROMBankStart

    ;
    ; Set the start of the area's pointer table in
    ; 0x{@address 007C}.
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
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__dd0f
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_MainLoop
;============================================================================
FUN_PRG15_MIRROR__dd0f:                     ; [$dd0f]
    JSR FUN_PRG15_MIRROR__d2ce
    RTS


;============================================================================
; TODO: Document Something_SetupNewScreen
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_EnterBuilding
;     Screen_Load
;============================================================================
Something_SetupNewScreen:                   ; [$dd13]
    JSR FUN_PRG15_MIRROR__ed12
    JSR FUN_PRG15_MIRROR__ce80
    LDA Area_LoadingScreenIndex
    STA Area_CurrentScreen
    JSR Area_Maybe_ShowRoomTransition
    JSR UI_DrawStatusSymbols
    LDA Screen_Palette
    STA a:Something_Maybe_PaletteIndex
    JSR LoadPalette2
    LDA #$00
    STA Something_Player_ScrollX
    STA Something_Player_ScrollY
    STA Screen_Maybe_ScrollXCounter
    STA Player_Something_ScrollPosY
    LDA Screen_StartPosYX
    AND #$f0
    STA PlayerPosY
    LDA Screen_StartPosYX
    ASL A
    ASL A
    ASL A
    ASL A
    STA PlayerPosX_Full
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
;     Something_SetupNewScreen
;     GameLoop_ClearSprites
;     GameLoop_LoadSpriteInfo
;     Palette_LoadFromIndex
;     PPUBuffer_Append0
;
; XREFS:
;     FUN_PRG15_MIRROR__df64
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Maybe_Game_EnterScreenHandler
;============================================================================
Screen_Load:                                ; [$dd46]
    JSR Something_SetupNewScreen            ; Draw the HUD and prepare setup
                                            ; for the screen.
    LDA #$00
    JSR Palette_LoadFromIndex               ; Load the palette.

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
    JMP PPUBuffer_Append0                   ; Append a 0 to the PPU buffer.


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
;     PlayerPosX_Full:
;         The X position the player will be in outside the
;         temple.
;
;     PlayerPosY:
;         The Y position the player will be in outside the
;         temple.
;
;     Something_Maybe_NewCurrentScreen:
;         TODO
;
;     Area_CurrentArea:
;         TODO
;
;     Something_Maybe_PaletteIndex:
;         TODO: The index of the palette outside the temple?
;
;     Area_Music_Outside:
;         The music to play outside the temple.
;
;     CurrentPalette:
;         The palette inside the temple.
;
;     Something_Maybe_NewTilesIndex:
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
    STA PlayerPosX_Full
    LDA #$ddbd,X
    STA PlayerPosY
    LDA #$ddc5,X
    STA a:Something_Maybe_NewCurrentScreen
    LDY #$ddad,X
    STY Area_CurrentArea
    LDA #$df4c,Y
    STA a:Something_Maybe_PaletteIndex
    LDA #$df5c,Y
    STA a:Area_Music_Outside
    LDA #$12
    STA Screen_Palette
    LDA #$06
    STA a:Something_Maybe_NewTilesIndex
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
; A mapping of Temple spawn positions to areas.
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
;     Screen_Palette:
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
;     Something_Maybe_NewTilesIndex:
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
    STA Screen_Palette                      ; Set the Palette for the King's
                                            ; room.

    ;
    ; Set the King's Room screen.
    ;
    LDA #$44
    STA Area_CurrentScreen                  ; Set the screen to 68.
    STA a:Something_Maybe_NewCurrentScreen
    LDA #$06
    STA a:Something_Maybe_NewTilesIndex     ; Set the tiles to 6.

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
    STA a:Player_CurWeapon
    LDA a:Areas_DefaultMusic
    STA CurrentMusic
    LDA Area_CurrentArea
    STA a:Area_PrevRegion
    LDA Area_CurrentScreen
    STA a:Maybe_PrevScreen
    LDA a:Something_Maybe_PaletteIndex
    STA a:Prev_Palette
    LDA PlayerPosY
    AND #$f0
    STA a:Prev_PlayerPosXY
    LDA PlayerPosX_Full
    AND #$f0
    LSR A
    LSR A
    LSR A
    LSR A
    ORA a:Prev_PlayerPosXY
    STA a:Prev_PlayerPosXY
    LDX #$04
    STX Area_CurrentArea
    LDA #$df34,X
    STA CurrentArea_ROMBank
    LDX CurrentArea_ROMBank
    JSR MMC1_SavePRGBankAndUpdateTo
    LDX Area_CurrentArea
    LDA #$df3c,X
    JSR Game_LoadAreaTable
    JSR MMC1_RestorePrevPRGBank
    LDA a:Something_Maybe_NewTilesIndex
    STA TilesIndex
    JSR CHR_LoadTilesetPages
    LDA #$01
    JSR Palette_LoadFromIndex
    JSR Something_SetupNewScreen
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
    LDX a:Area_PrevRegion
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
    STA TilesIndex
    JSR CHR_LoadTilesetPages
    LDA a:Maybe_PrevScreen
    STA Area_LoadingScreenIndex
    LDA a:Prev_Palette
    STA Screen_Palette
    LDA a:Prev_PlayerPosXY
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
;     MAYBE_AREA_TO_PRG_ROM_BANKS:
;         Mapping of areas to PRG ROM banks.
;
;     MAYBE_AREA_BANK_TO_SPRITE_BANKS:
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
;     Screen_Palette:
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
;     TilesIndex:
;         The tiles index for the area.
;
; CALLS:
;     CHR_LoadTilesetPages
;     Screen_Load
;     MMC1_RestorePrevPRGBank
;     MMC1_SavePRGBankAndUpdateTo
;     Palette_LoadFromIndex
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
    STA TilesIndex                          ; Store that.
    JSR CHR_LoadTilesetPages                ; Load the tileset pages for that
                                            ; index.

    ;
    ; Load the palette for the area.
    ;
    LDA #$00
    JSR Palette_LoadFromIndex               ; Load the palette for that
                                            ; index.
    LDX Area_CurrentArea                    ; X = current area.
    LDA #$df4c,X                            ; Load the palette.
    STA Screen_Palette                      ; And store it as the current one
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
;     MAYBE_AREA_TO_PRG_ROM_BANKS:
;         Mapping of areas to PRG ROM banks.
;
;     MAYBE_AREA_BANK_TO_SPRITE_BANKS:
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
;     Screen_Palette:
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
;     TilesIndex:
;         The tiles index for the area.
;
; CALLS:
;     CHR_LoadTilesetPages
;     Screen_Load
;     MMC1_RestorePrevPRGBank
;     MMC1_SavePRGBankAndUpdateTo
;     Palette_LoadFromIndex
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
    STA TilesIndex                          ; Store as the current tiles
                                            ; index.
    JSR CHR_LoadTilesetPages                ; Load all tileset images for
                                            ; that index.

    ;
    ; Load the palette for the area.
    ;
    LDA #$00
    JSR Palette_LoadFromIndex               ; Load palette 0.
    LDX Area_CurrentArea                    ; X = current area.
    LDA #$df4c,X                            ; Load the palette for the area.
    STA Screen_Palette                      ; Store as the current palette.

    ;
    ; Load the music for the area.
    ;
    LDA #$df5c,X                            ; Load the music for the area.
    STA CurrentMusic                        ; Set as the current music.
    STA a:Areas_DefaultMusic                ; Store as the default.
    JMP Screen_Load                         ; Load this screen.


;============================================================================
; A mapping of areas to the ROM banks containing PRG data.
;============================================================================

;
; XREFS:
;     FUN_PRG15_MIRROR__df64
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
MAYBE_AREA_TO_PRG_ROM_BANKS:                ; [$df34]
    db BANK_0                               ; [0]: First town
    db BANK_1_SPRITES                       ; [1]: Between first town and Fog
    db BANK_0                               ; [2]: Fog
    db BANK_0                               ; [3]: Town

;
; XREFS:
;     Game_EnterBuilding
;
MAYBE_AREA_TO_PRG_ROM_BANKS_4_:             ; [$df38]
    db BANK_2_SPRITES                       ; [4]: Building
    db BANK_1_SPRITES                       ; [5]: Tree world
    db BANK_2_SPRITES                       ; [6]: Last world
    db BANK_2_SPRITES                       ; [7]: Final maze

;
; XREFS:
;     FUN_PRG15_MIRROR__df64
;     Game_ExitBuilding
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;
MAYBE_AREA_BANK_TO_SPRITE_BANKS:            ; [$df3c]
    db BANK_0                               ; [0]:
    db BANK_0                               ; [1]:
    db BANK_1_SPRITES                       ; [2]:
    db BANK_2_SPRITES                       ; [3]:

;
; XREFS:
;     Game_EnterBuilding
;
MAYBE_AREA_BANK_TO_SPRITE_BANKS_4_:         ; [$df40]
    db BANK_1_SPRITES                       ; [4]:
    db BANK_1_SPRITES                       ; [5]:
    db BANK_0                               ; [6]:
    db BANK_2_SPRITES                       ; [7]:


;============================================================================
; Pointers into 0xCF07 addressed by chunk ID
;============================================================================

;
; XREFS:
;     FUN_PRG15_MIRROR__df64
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
;     FUN_PRG15_MIRROR__df64
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;     Game_SpawnInTemple
;
AREA_TO_MUSIC_TABLE:                        ; [$df5c]
    db MUSIC_EOLIS                          ; [0]:
    db MUSIC_MAYBE_BETWEEN_FIRST_TOWN_FOG   ; [1]:
    db MUSIC_MAYBE_FOG                      ; [2]:
    db MUSIC_MAYBE_TOWN_BUILDING            ; [3]:
    db MUSIC_MAYBE_TOWN_BUILDING            ; [4]:
    db MUSIC_MAYBE_TREE_WORLD               ; [5]:
    db MUSIC_MAYBE_LAST_WORLD               ; [6]:
    db MUSIC_MAYBE_FINAL_MAZE               ; [7]:


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__df64
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
FUN_PRG15_MIRROR__df64:                     ; [$df64]
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
    STA TilesIndex
    JSR CHR_LoadTilesetPages
    LDA #$00
    JSR Palette_LoadFromIndex
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
; TODO: Document GameLoop_AnimateFog
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
GameLoop_AnimateFog:                        ; [$dfc5]
    LDA Area_CurrentArea
    CMP #$02
    BNE RETURN_E011
    LDA a:Something_Maybe_PaletteIndex
    CMP #$0a
    BNE RETURN_E011
    LDA Fog_Index
    LSR A
    BCC Game_AnimateFog_UpdatePPU
    DEC FogGenerator
    BNE RETURN_E011
    INC Fog_Index

    ;
    ; XREFS:
    ;     Debug_ChooseArea
    ;
RETURN_DFDD:                                ; [$dfdd]
    RTS


;============================================================================
; TODO: Document Game_AnimateFog_UpdatePPU
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_AnimateFog
;============================================================================
Game_AnimateFog_UpdatePPU:                  ; [$dfde]
    LDX PPUBuffer_UpperBounds
    LDA #$fc
    STA PPUBuffer,X
    INX
    LDA #$18
    STA PPUBuffer,X
    INX
    LDA FogGenerator
    INC FogGenerator
    ASL A
    ASL A
    ASL A
    ASL A
    STA PPUBuffer,X
    INX
    STX PPUBuffer_UpperBounds
    INC FogGenerator
    LDA FogGenerator
    AND #$07
    STA FogGenerator
    BNE RETURN_E011
    INC Fog_Index
    LDA Fog_Index
    LSR A
    AND #$03
    TAX
    LDA #$e012,X
    STA FogGenerator

    ;
    ; XREFS:
    ;     GameLoop_AnimateFog
    ;     Game_AnimateFog_UpdatePPU
    ;
RETURN_E011:                                ; [$e011]
    RTS

;
; XREFS:
;     Game_AnimateFog_UpdatePPU
;
FOG_VALUES:                                 ; [$e012]
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
    ; Open the inventory via jump to UI_ShowPlayerMenu.
    ;
    JSR MMC1_LoadBankAndJump                ; Open the Player Menu.
    db BANK_12_LOGIC                        ; Bank = 12
    dw UI_ShowPlayerMenu-1                  ; Address =
                                            ; UI_ShowPlayerMenu

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
;     Wait3969Cycles
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
    JSR Wait3969Cycles

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
;     @_Game_MovePlayerOnScroll
;
; XREFS:
;     FUN_PRG15_MIRROR__d2ce
;     Game_MainLoop
;============================================================================
Game_UpdatePlayerOnScroll:                  ; [$e048]
    ;
    ; Preserve the previous pressed buttons while scrolling.
    ;
    LDA Joy1_PrevButtonMask                 ; Load the previous button mask.
    STA Joy1_ButtonMask                     ; Set it as the current button
                                            ; mask.
    JSR @_Game_MovePlayerOnScroll           ; Update the player position.
    INC Screen_ScrollPlayerTransitionCounter ; Increment the screen scroll
                                             ; transition counter.
    RTS

    ;
    ; The screen is scrolling to the screen to the left.
    ;
    ; If we're in the first 4 frames of the screen transition,
    ; move the player left 4px per frame until it wraps the
    ; screen.
    ;
  @_scrollLeft:                             ; [$e052]
    LDA Screen_ScrollPlayerTransitionCounter ; Load the transition counter.
    CMP #$04                                ; Is it >= 4?
    BCS @_finishScrollLeft                  ; If so, jump.
    LDA PlayerPosX_Full                     ; Load the player X position.
    SEC
    SBC #$04                                ; Subtract 4.
    STA PlayerPosX_Full                     ; Store it.
    LDA Screen_Maybe_ScrollXCounter         ; Load our screen scroll counter.
    SBC #$00                                ; Subtract carry.
    STA Screen_Maybe_ScrollXCounter         ; Store it.

    ;
    ; Update Maybe_PlayerX_ForScroll based on the
    ; player's X position.
    ;
  @_finishScrollLeft:                       ; [$e065]
    LDA PlayerPosX_Full
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
;     PlayerPosX_Full:
;         The player's current X position.
;
; OUTPUTS:
;     PlayerPosX_Full:
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
  @_Game_MovePlayerOnScroll:                ; [$e06a]
    ;
    ; Check which direction the screen is scrolling.
    ;
    LDX Screen_ScrollDirection              ; Load the screen scroll
                                            ; direction.
    BEQ @_scrollLeft                        ; If 0, jump to handle scrolling
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
    LDA Maybe_PlayerY_ForScroll
    SEC
    SBC #$04
    STA Maybe_PlayerY_ForScroll
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
    LDA Maybe_PlayerY_ForScroll             ; Load the player Y position.
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
    LDA PlayerPosX_Full                     ; Load the player X position.
    CLC
    ADC #$04                                ; Add 4.
    STA PlayerPosX_Full                     ; Store it.
    LDA Screen_Maybe_ScrollXCounter         ; Load our screen scroll counter.
    ADC #$00                                ; Add carry.
    STA Screen_Maybe_ScrollXCounter         ; Store it.

    ;
    ; Update Maybe_PlayerX_ForScroll based on the
    ; player's X position.
    ;
  @_finishScrollRight:                      ; [$e0a5]
    LDA PlayerPosX_Full
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
;     Something_Player_ScrollX:
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
;     Maybe_Player_DAT_00a8:
;         TODO (set to 0xFF).
;
;     Maybe_Player_DAT_00ab:
;         TODO (set to 2).
;
; XREFS:
;     Game_InitStateForSpawn
;     Game_LoadCurrentArea
;     Game_LoadFirstLevel
;============================================================================
Player_SetInitialState:                     ; [$e0aa]
    LDA #$00
    STA Screen_Maybe_ScrollXCounter
    STA Player_Something_ScrollPosY
    STA Something_Player_ScrollY
    STA Something_Player_ScrollX

    ;
    ; Set the starting speed, status, and iframes.
    ;
    STA Player_MoveAcceleration             ; Set the player speed to 0.
    STA Player_StatusFlag                   ; Set the player status to 0.
    STA Player_InvincibilityPhase           ; Set the invincibility phase to
                                            ; 0.
    STA Something_Player_ScrollY

    ;
    ; Face the player to the right.
    ;
    LDA #$40                                ; 0x04 = Face player right bit.
    STA Player_Flags                        ; Set that on the player's flags.
    LDA #$ff
    STA Maybe_Player_DAT_00a8
    LDA #$02
    STA Maybe_Player_DAT_00ab
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
;     Player_FallToGround
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
    JSR Player_FallToGround
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
    JMP Player_SetStandardAcceleration

    ;
    ; Set the knockback speed, but then clear the knockback.
    ;
  @_resetSpeed:                             ; [$e0f9]
    JSR Player_SetStandardAcceleration      ; Reset the player speed.

    ;
    ; Clear knockback from the player flags.
    ;
  @_removeIFrames:                          ; [$e0fc]
    LDA Player_StatusFlag
    AND #$fd
    STA Player_StatusFlag
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
    LDA Player_Flags
    BMI @LAB_PRG15_MIRROR__e132
    JSR Player_IsClimbing
    BCS @LAB_PRG15_MIRROR__e119
    LDA Joy1_ChangedButtonMask
    AND #$40
    BEQ @LAB_PRG15_MIRROR__e119
    LDA Player_StatusFlag
    AND #$01
    BEQ @LAB_PRG15_MIRROR__e120
    RTS

  @LAB_PRG15_MIRROR__e119:                  ; [$e119]
    LDA Player_StatusFlag
    AND #$fe
    STA Player_StatusFlag
    RTS

  @LAB_PRG15_MIRROR__e120:                  ; [$e120]
    LDA Player_Flags
    ORA #$80
    STA Player_Flags
    LDA Player_StatusFlag
    ORA #$01
    STA Player_StatusFlag
    LDA #$00
    STA PlayerHitsPhaseTimer
    STA PlayerHitsPhaseCounter

  @LAB_PRG15_MIRROR__e132:                  ; [$e132]
    INC PlayerHitsPhaseTimer
    LDA PlayerHitsPhaseTimer
    LDX PlayerHitsPhaseCounter
    CMP #$e150,X
    BCC @_return
    LDA #$00
    STA PlayerHitsPhaseTimer
    INX
    CPX #$03
    BCS @LAB_PRG15_MIRROR__e149
    STX PlayerHitsPhaseCounter

  @_return:                                 ; [$e148]
    RTS

  @LAB_PRG15_MIRROR__e149:                  ; [$e149]
    LDA Player_Flags
    AND #$7f
    STA Player_Flags

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
BYTE_ARRAY_PRG15_MIRROR__e150:              ; [$e150]
    db $08                                  ; [0]:
    db $03                                  ; [1]:
    db $08                                  ; [2]:


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
    LDA PlayerPosX_Full
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
    LDA PlayerPosX_Full
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
;     PlayerPosX_Full:
;     PlayerPosX_Frac:
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
;     PlayerPosX_Full:
;     PlayerPosX_Frac:
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
;     Player_Maybe_MoveIfPassable
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
    LDA PlayerPosX_Frac                     ; Load the fractional X position.
    CLC
    ADC Player_MoveAcceleration             ; Add the move acceleration.
    STA PlayerPosX_Frac                     ; Store as the new fractional
                                            ; position.
    LDA PlayerPosX_Full                     ; Load the full X position.
    ADC Player_MoveAcceleration.U           ; Add the move acceleration.
    STA PlayerPosX_Full                     ; And store it.

    ;
    ; Check if the block there is passable.
    ;
    LDX #$01
    JSR Player_Maybe_MoveIfPassable         ; Is the block to the right
                                            ; passable?
    BEQ @_checkAtRightEdge                  ; If not, jump to check for an
                                            ; edge or transition boundary.

    ;
    ; The block is not passable. Cap the position.
    ;
    LDA PlayerPosX_Full                     ; Load the player X position.
    AND #$f0                                ; Cap it.
    STA PlayerPosX_Full                     ; And store it.
    JMP @_return

    ;
    ; Check if the player is far enough to the right for
    ; any screen transition logic.
    ;
  @_checkAtRightEdge:                       ; [$e1fe]
    LDA PlayerPosX_Full                     ; X = Player X position.
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
;     PlayerPosX_Full:
;         The updated X position.
;
; XREFS:
;     Player_TryMoveRight
;============================================================================
Player_SetPosAtRightEdge:                   ; [$e21b]
    LDA #$f0
    STA PlayerPosX_Full                     ; Set the X position to 0xF0.
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
;     PlayerPosX_Full:
;     PlayerPosX_Frac:
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
;     PlayerPosX_Full:
;     PlayerPosX_Frac:
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
;     Player_Maybe_MoveIfPassable
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
    LDA PlayerPosX_Frac                     ; Load the fractional X position.
    SEC
    SBC Player_MoveAcceleration             ; Subtract the move acceleration.
    STA PlayerPosX_Frac                     ; Store as the new fractional
                                            ; position.
    LDA PlayerPosX_Full                     ; Load the full X position.
    SBC Player_MoveAcceleration.U           ; Subtract the move acceleration.
    PHP                                     ; Push all flags.
    BCS @_saveFlags                         ; If >= 0, jump.
    LDA #$00                                ; Else, cap at 0, so it doesn't
                                            ; wrap.

  @_saveFlags:                              ; [$e244]
    STA PlayerPosX_Full                     ; Store the new X position.

    ;
    ; Check if the block there is passable.
    ;
    LDX #$00
    JSR Player_Maybe_MoveIfPassable         ; Is the block to the left
                                            ; passable?
    BEQ @_checkAtLeftEdge                   ; If not, jump to check for an
                                            ; edge or transition boundary.

    ;
    ; The block is not passable. Cap the position.
    ;
    PLP                                     ; Pop the flags from the
                                            ; acceleration calculation.
    LDA PlayerPosX_Full                     ; Load the player X position.
    AND #$0f                                ; Is this in the first 16 pixels?
    BEQ @_return1                           ; If so, we're done.
    LDA PlayerPosX_Full                     ; Load the player X position.
    AND #$f0                                ; Keep all but pixels 0-16.
    CLC
    ADC #$10                                ; Add 16 pixels.
    STA PlayerPosX_Full                     ; Store as the new position.

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
    STA PlayerPosX_Full                     ; Set the X position to 0.
    STA Screen_ScrollPlayerTransitionCounter ; Clear the transition counter.

  @_return2:                                ; [$e277]
    RTS

    ;
    ; The player is at the left-most edge, but didn't pass it.
    ;
  @_setAtLeftEdge:                          ; [$e278]
    LDA #$00
    STA PlayerPosX_Full                     ; Set the X position to 0.
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
    LDA PlayerPosX_Full
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
    JSR Player_Maybe_MoveIfPassable
    BNE @LAB_PRG15_MIRROR__e343
    INC Player_MovementTick
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__e31e
    LDA PlayerPosY
    SEC
    SBC #$01
    STA PlayerPosY
    JMP @LAB_PRG15_MIRROR__e32b

  @LAB_PRG15_MIRROR__e31e:                  ; [$e31e]
    LDA BYTE_00a0
    SEC
    SBC #$a0
    STA BYTE_00a0
    LDA PlayerPosY
    SBC #$00
    STA PlayerPosY

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
    STA PlayerPosY

  @LAB_PRG15_MIRROR__e343:                  ; [$e343]
    RTS

  @LAB_PRG15_MIRROR__e344:                  ; [$e344]
    LDA #$00
    STA PlayerPosY
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
    JSR Player_Maybe_MoveIfPassable
    BNE RETURN_E393
    INC Player_MovementTick
    LDA Player_StatusFlag
    BPL @LAB_PRG15_MIRROR__e36c
    LDA BYTE_00a0
    CLC
    ADC #$80
    STA BYTE_00a0
    LDA PlayerPosY
    ADC #$01
    STA PlayerPosY
    JMP Player_MoveDownScreen

  @LAB_PRG15_MIRROR__e36c:                  ; [$e36c]
    LDA BYTE_00a0
    CLC
    ADC #$c0
    STA BYTE_00a0
    LDA PlayerPosY
    ADC #$00
    STA PlayerPosY


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
    STA PlayerPosY

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
;     PlayerPosY:
;         The updated player position (set to 0xC0).
;
; XREFS:
;     Player_MoveDownScreen
;============================================================================
Player_SetPosAtBottomEdge:                  ; [$e394]
    LDA #$c0
    STA PlayerPosY                          ; Set player Y position to 0xC0
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
    JSR Player_Maybe_MoveIfPassable
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
    LDA PlayerPosY
    ADC #$01
    STA PlayerPosY
    JMP Maybe_MoveDownOneScreen

  @LAB_PRG15_MIRROR__e3f5:                  ; [$e3f5]
    LDA PlayerPosY
    CLC
    ADC #$08
    STA PlayerPosY


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
    STA PlayerPosY
    JMP @LAB_PRG15_MIRROR__e42c

  @LAB_PRG15_MIRROR__e40e:                  ; [$e40e]
    LDA Area_ScreenBelow
    STA Area_CurrentScreen
    LDX #$03
    JSR Area_BeginScrollToNextRoom
    INC Player_Something_ScrollPosY
    LDA #$00
    STA PlayerPosY
    RTS

  @LAB_PRG15_MIRROR__e41e:                  ; [$e41e]
    LDX #$03
    JSR Player_Maybe_MoveIfPassable
    BEQ @LAB_PRG15_MIRROR__e42b
    LDA PlayerPosY
    AND #$f0
    STA PlayerPosY

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
    JSR Player_Maybe_MoveIfPassable
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
    LDA PlayerPosY
    SEC
    SBC #$e4d6,X
    STA PlayerPosY
    BCS @LAB_PRG15_MIRROR__e481
    LDY #$02
    JSR Screen_IsEdge
    BCC Area_ScrollScreenUp
    LDA #$00
    JMP @LAB_PRG15_MIRROR__e49a

  @LAB_PRG15_MIRROR__e481:                  ; [$e481]
    LDX #$02
    JSR Player_Maybe_MoveIfPassable
    BEQ Area_Something_IncDAT00a6
    LDX Something_Player_ClimbLadderCheckPos
    LDA PlayerPosY
    AND #$0f
    TAX
    LDA PlayerPosY
    AND #$f0
    CPX #$00
    BEQ @LAB_PRG15_MIRROR__e49a
    CLC
    ADC #$10

  @LAB_PRG15_MIRROR__e49a:                  ; [$e49a]
    STA PlayerPosY
    LDA #$0f
    STA Something_Player_ClimbLadderCheckPos
    BNE Area_Something_IncDAT00a6

  @LAB_PRG15_MIRROR__e4a2:                  ; [$e4a2]
    LDA PlayerPosY
    CLC
    ADC #$e4d6,X
    STA PlayerPosY
    LDX #$03
    JSR Player_Maybe_MoveIfPassable
    BNE FUN_PRG15_MIRROR__e4c9

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
    STA PlayerPosY
    JMP FUN_PRG15_MIRROR__e4c9


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__e4c9
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
FUN_PRG15_MIRROR__e4c9:                     ; [$e4c9]
    LDA PlayerPosY
    AND #$f0
    STA PlayerPosY
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
    LDA Joy1_ChangedButtonMask
    AND #$03
    BEQ @LAB_PRG15_MIRROR__e51f
    AND #$01
    BEQ @LAB_PRG15_MIRROR__e503
    INX

  @LAB_PRG15_MIRROR__e503:                  ; [$e503]
    LDA PlayerPosX_Full
    CLC
    ADC #$e524,X
    STA Arg_PixelPosX
    LDA PlayerPosY
    CLC
    ADC #$20
    STA Arg_PixelPosY
    CMP #$f0
    BCC @LAB_PRG15_MIRROR__e51f
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_IsBlockImpassable
    STA Blocks_Result
    RTS

  @LAB_PRG15_MIRROR__e51f:                  ; [$e51f]
    LDA #$00
    STA Blocks_Result
    RTS

;
; XREFS:
;     Area_CheckCanClimbAdjacent
;
DAT_PRG15_MIRROR__e524:                     ; [$e524]
    db $00                                  ; [$e524] undefined1

;
; XREFS:
;     Area_CheckCanClimbAdjacent
;
DAT_PRG15_MIRROR__e525:                     ; [$e525]
    db $0f                                  ; [$e525] undefined1


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
    JSR Game_CheckDoorRequirement
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
    LDA Screen_Palette
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
    db $06                                  ; [0]:
    db $07                                  ; [1]:
    db $0a                                  ; [2]:
    db $0b                                  ; [3]:
    db $0c                                  ; [4]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
BYTE_ARRAY_PRG15_MIRROR__e569_5_:           ; [$e56e]
    db $0d                                  ; [5]:

;
; XREFS:
;     Player_CheckHandleEnterDoor
;
BYTE_ARRAY_PRG15_MIRROR__e569_6_:           ; [$e56f]
    db $0e                                  ; [6]:
    db MUSIC_MAYBE_BETWEEN_FIRST_TOWN_FOG   ; [0]:
    db MUSIC_MAYBE_TOWER                    ; [1]:
    db MUSIC_MAYBE_FOG                      ; [2]:
    db MUSIC_MAYBE_TOWER                    ; [3]:
    db MUSIC_MAYBE_LAST_WORLD               ; [4]:

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
    LDA Screen_Palette
    STA Area_LoadingScreenIndex
    TAX
    LDA #$e609,X
    STA Screen_Palette
    LDA #$e613,X
    STA a:Something_Maybe_NewTilesIndex
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
    JSR Game_CheckDoorRequirement
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
AREA_TO_MUSIC:                              ; [$e5ff]
    db $0d                                  ; [0]:
    db $0e                                  ; [1]:
    db $0f                                  ; [2]:
    db $0f                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $0f                                  ; [6]:
    db $0f                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:

;
; XREFS:
;     Player_EnterDoorToInside
;
Maybe_RoomTransitionTable:                  ; [$e609]
    db $11                                  ; [10]:
    db $12                                  ; [11]:
    hex 13 14 15 16 17 18 19 1a             ; [$e60b] undefined

;
; XREFS:
;     Player_EnterDoorToInside
;
AREA_MAYBE_TILES_INDEXES:                   ; [$e613]
    db $06                                  ; [0]:
    db $06                                  ; [1]:
    db $06                                  ; [2]:
    db $07                                  ; [3]:
    db $07                                  ; [4]:
    db $07                                  ; [5]:
    db $07                                  ; [6]:
    db $07                                  ; [7]:
    db $08                                  ; [8]:
    db $08                                  ; [9]:

;
; XREFS:
;     Player_EnterDoorToInside
;
AREA_START_POSITIONS:                       ; [$e61d]
    db $9e                                  ; [0]:
    db $9e                                  ; [1]:
    db $9e                                  ; [2]:
    db $8e                                  ; [3]:
    db $7e                                  ; [4]:
    db $7e                                  ; [5]:
    db $7e                                  ; [6]:
    db $7e                                  ; [7]:
    db $8e                                  ; [8]:
    db $8e                                  ; [9]:


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
    LDA PlayerPosY
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
    LDA PlayerPosY
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
;     Player_Maybe_MoveIfPassable
;============================================================================
Area_CanPlayerMoveRight:                    ; [$e65b]
    LDA PlayerPosX_Full
    CLC
    ADC #$10
    STA Arg_PixelPosX
    BCS Area_CanMoveUp


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
    LDA PlayerPosY
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
    LDA PlayerPosY
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
;     Player_Maybe_MoveIfPassable
;============================================================================
Area_CanPlayerMoveLeft:                     ; [$e691]
    LDA PlayerPosX_Full
    SEC
    SBC #$01
    STA Arg_PixelPosX
    BCS Area_CanPlayerMoveAtY
    LDA PlayerPosY
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
    LDA PlayerPosY
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
; TODO: Document Player_Maybe_MoveIfPassable
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
Player_Maybe_MoveIfPassable:                ; [$e6c8]
    TXA
    BEQ Area_CanPlayerMoveLeft
    DEX
    BEQ Area_CanPlayerMoveRight
    DEX
    BEQ Area_CanPlayerMoveUp
    LDA PlayerPosY
    CLC
    ADC #$20
    STA Arg_PixelPosY
    CMP #$d0
    BCC Area_CanMoveImmediatelyRight
    LDA PlayerPosX_Full
    LSR A
    LSR A
    LSR A
    LSR A
    TAX
    LDY FirstRowBelowScreen,X
    JSR Area_IsBlockImpassable
    STA Blocks_Result
    LDA PlayerPosX_Full
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
;     Player_Maybe_MoveIfPassable
;============================================================================
Area_CanMoveImmediatelyRight:               ; [$e6ff]
    LDA PlayerPosX_Full
    CLC
    ADC #$04
    STA Arg_PixelPosX
    JSR Area_ConvertPixelsToBlockPos
    JSR ScreenBuffer_IsBlockImpassable
    STA Blocks_Result
    LDA PlayerPosX_Full
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
;     Player_Maybe_MoveIfPassable
;============================================================================
Area_CanPlayerMoveUp:                       ; [$e724]
    LDA PlayerPosY
    SEC
    SBC #$01
    STA Arg_PixelPosY
    CMP #$f0
    BCC Area_CanMoveImmediatelyRight
    LDA PlayerPosX_Full
    LSR A
    LSR A
    LSR A
    LSR A
    TAX
    LDY LastRowAboveScreen,X
    JSR Area_IsBlockImpassable
    STA Blocks_Result
    LDA PlayerPosX_Full
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
    LDA PlayerPosX_Full                     ; A = player X position
    CLC
    ADC #$07                                ; Add 7.
    STA Arg_PixelPosX                       ; Store the player's new X pixel
                                            ; position
    LDA PlayerPosY                          ; Load the player's Y position
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
    LDA PlayerPosX_Full                     ; A = player X position.
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
    LDA PlayerPosX_Full
    CLC
    ADC #$07
    STA Arg_PixelPosX
    LDA PlayerPosY
    CLC
    ADC #$1f
    STA Arg_PixelPosY
    JSR Area_ConvertPixelsToBlockPos
    LDY ScreenBuffer,X
    JSR Area_GetBlockProperty
    STA Blocks_Result
    JSR Area_IsBlockClimbable
    BCS @_resetCanClimb
    LDA PlayerPosX_Full
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
;     PlayerPosX_Full:
;         The X position of the player.
;
;     PlayerPosY:
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
;     Screen_Palette:
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
    LDA PlayerPosX_Full                     ; Load the player's full X
                                            ; position.
    CLC
    ADC #$07                                ; Add 7.
    STA Arg_PixelPosX                       ; Store as the X pixel position
                                            ; argument.
    LDA PlayerPosY                          ; Load the player's full Y
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
    LDA PlayerPosX_Full                     ; Load the player's full X
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
    LDA a:CurrentROMBank2                   ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$03
    JSR MMC1_UpdatePRGBank                  ; Load bank 3.

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
    STA Screen_Palette                      ; Store it as the new palette.
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
    JSR MMC1_UpdatePRGBank                  ; Update to the bank.
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
;     SpriteBehavior_MaybeFlyingSomething
;     Area_CanMoveImmediatelyRight
;     Area_CanPlayerMoveAtY
;     Area_CheckCanClimbAdjacent
;     Area_SetStateFromDoorDestination
;     CastMagic_CalculateVisibility
;     Player_CheckIfOnLadder
;     Player_CheckPushingBlock
;     Player_CheckSwitchScreen
;     Player_FallToGround
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
    LDY ScreenBuffer,X

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
;     Player_Maybe_MoveIfPassable
;============================================================================
Area_IsBlockImpassable:                     ; [$e87f]
    JSR Area_GetBlockProperty

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Area_GetFromImpassableMap
;
; INPUTS:
;     A
;
; OUTPUTS:
;     A
;
; XREFS:
;     Area_IsBlockImpassableOrLadder
;============================================================================
Area_GetFromImpassableMap:                  ; [$e882]
    TAY
    LDA #$e8d9,Y
    RTS


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
; Set whether a block is truly air.
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
    ; Check if this is a second ladder-like (??? TODO)
    ;
    CMP #$0a                                ; TODO: Is it... another
                                            ; climbable block?
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
;     SpriteBehavior_MaybeFlyingSomething
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
;     Player_CheckPushingBlock
;     Player_FallToGround
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
    db $00                                  ; [4]:
    db $01                                  ; [5]:
    db $01                                  ; [6]:
    db $01                                  ; [7]:
    db $01                                  ; [8]:
    db $00                                  ; [9]:
    db $00                                  ; [10]:
    db $01                                  ; [11]:
    db $00                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:


;============================================================================
; TODO: Document Area_BeginScrollToNextRoom
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
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
    LDA a:CurrentScreen_SpecialEventID
    AND #$7f
    CMP #$01
    BNE @LAB_PRG15_MIRROR__e8f7
    LDA a:Areas_DefaultMusic
    STA CurrentMusic

  @LAB_PRG15_MIRROR__e8f7:                  ; [$e8f7]
    LDA #$00
    STA Player_MovementTick
    STA InterruptCounter
    LDA #$ff
    STA a:CastMagic_Type
    JMP Area_ScrollToNextRoom


;============================================================================
; TODO: Document Player_FallToGround
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
Player_FallToGround:                        ; [$e905]
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
    LDA PlayerPosY                          ; A = Player's Y position.
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
    LDA PlayerPosX_Full                     ; A = Player X position.
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
    CMP #$05                                ; Is it 5?
    BNE @_checkNextBlock                    ; If not, check the next
                                            ; overlapping block.
    PLA                                     ; Pop the facing bit from the
                                            ; stack.
    JMP FUN_PRG15_MIRROR__d6ce

    ;
    ; Check the second block the player is overlapping.
    ;
  @_checkNextBlock:                         ; [$e93c]
    PLA                                     ; Pop the facing bit from the
                                            ; stack.
    EOR #$01                                ; XOR the facing bit to check the
                                            ; other direction.
    TAX                                     ; X = A
    LDA PlayerPosX_Full                     ; A = Player X position.
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
    CMP #$05                                ; Is it 5?
    BNE @_return                            ; If not, return.
    JMP FUN_PRG15_MIRROR__d6ce

  @_return:                                 ; [$e95a]
    RTS

  @_PLAYER_FALL_TO_GROUND_X_OFFSETS:        ; [$e95b]
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
    LDA PlayerPosY
    STA Arg_PixelPosY
    LDA PlayerPosX_Full
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
    LDA PlayerPosY
    STA Arg_PixelPosY
    LDA PlayerPosX_Full
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
    BNE RETURN_EA36

    ;
    ; Check the next block.
    ;
  @LAB_PRG15_MIRROR__e9de:                  ; [$e9de]
    LDA PlayerPosX_Full
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
    BNE RETURN_EA36

    ;
    ; TODO:
    ;
    ; Two blocks in a row have this property (or the player is firmly
    ; on one block, not overlapping two?).
    ;
  @LAB_PRG15_MIRROR__e9fb:                  ; [$e9fb]
    CMP #$0c
    BEQ Area_ChangeArea
    CMP #$0d
    BEQ Area_ChangeArea
    LDA Area_CurrentArea
    ASL A
    TAX
    LDA #$ea37,X
    STA Temp_Addr_L
    LDA #$ea38,X
    STA Temp_Addr_U
    LDY #$00

SUB_EA13:                                   ; [$ea13]
    LDA (Temp_Addr_L),Y
    CMP #$ff
    BEQ RETURN_EA36
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
    STA Screen_Palette
    JMP Maybe_Game_EnterScreenHandler

  @LAB_PRG15_MIRROR__ea2f:                  ; [$ea2f]
    INY
    INY
    INY
    INY
    JMP SUB_EA13

    ;
    ; XREFS:
    ;     Player_CheckSwitchScreen
    ;
RETURN_EA36:                                ; [$ea36]
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

DAT_PRG15_MIRROR__ea47:                     ; [$ea47]
    hex 0c 16 b3 06 16 0c 2d 06             ; [$ea47] undefined

;
; XREFS:
;     USHORT_PRG15_MIRROR__ea37
;     [$PRG15_MIRROR::ea37]
;
DAT_PRG15_MIRROR__ea4f:                     ; [$ea4f]
    db $ff                                  ; [$ea4f] undefined


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
;     Area_ChangeArea
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
; TODO: Document Area_ChangeArea
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
Area_ChangeArea:                            ; [$ea5f]
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
    BEQ @LAB_PRG15_MIRROR__ea9b
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
    STA Screen_Palette
    JMP FUN_PRG15_MIRROR__dacd

  @LAB_PRG15_MIRROR__ea94:                  ; [$ea94]
    TYA
    CLC
    ADC #$05
    TAY
    BCC @LAB_PRG15_MIRROR__ea73

  @LAB_PRG15_MIRROR__ea9b:                  ; [$ea9b]
    RTS

;
; XREFS:
;     Area_ChangeArea
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
TOWN_TRANSITIONS_TRUNK:                     ; [$eaac]
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
BYTE_PRG15_MIRROR__eac6:                    ; [$eac6]
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
BYTE_PRG15_MIRROR__eb03:                    ; [$eb03]
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
BYTE_PRG15_MIRROR__eb18:                    ; [$eb18]
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
BYTE_PRG15_MIRROR__eb28:                    ; [$eb28]
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
; TODO: Document Game_CheckDoorRequirement
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Player_CheckHandleEnterDoor
;     Player_EnterDoorToOutside
;============================================================================
Game_CheckDoorRequirement:                  ; [$eb2f]
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
;============================================================================

;
; XREFS:
;     Game_CheckDoorRequirement
;
DOOR_REQUIREMENT_LOOKUP_FUNC_ADDRS:         ; [$eb3f]
    db $3d                                  ; [0]: No key, return

;
; XREFS:
;     Game_CheckDoorRequirement
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
    LDA a:Temp_03C7
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
    LDA PlayerPosX_Full
    STA Maybe_Arg_CurrentSprite_PosX
    LDA Screen_Maybe_ScrollXCounter
    STA Unused_Sprite_ScrollPosX
    LDA PlayerPosY
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
    LDA Something_Player_ScrollX
    STA Unused_Sprite_ScrollPosX
    LDA Maybe_PlayerY_ForScroll
    STA Maybe_Arg_CurrentSprite_PosY
    LDA Something_Player_ScrollY
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
    JSR FUN_PRG15_MIRROR__f039
    JMP FUN_PRG15_MIRROR__ec58

;
; XREFS:
;     Player_DrawBody
;
BYTE_ARRAY_PRG15_MIRROR__ec49:              ; [$ec49]
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
    LDA PlayerPosX_Full
    CLC
    ADC Temp_04
    STA Maybe_Arg_CurrentSprite_PosX
    LDA PlayerPosX_Full
    ADC Temp_05
    CMP PlayerPosX_Full
    BNE @_return
    LDA PlayerPosY
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
    JMP FUN_PRG15_MIRROR__f039

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
;     PlayerPosX_Full:
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
    LDA PlayerPosX_Full                     ; Load the player's X position.
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
; TODO: Document FUN_PRG15_MIRROR__ed12
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Something_SetupNewScreen
;============================================================================
FUN_PRG15_MIRROR__ed12:                     ; [$ed12]
    JSR Maybe_Player_UpdateArmorState

  @LAB_PRG15_MIRROR__ed15:                  ; [$ed15]
    JSR FUN_PRG15_MIRROR__eea9
    JSR PPUBuffer_Draw
    INC Maybe_Player_DAT_00a8
    DEC Temp_00
    BPL @LAB_PRG15_MIRROR__ed15
    JSR Maybe_Player_UpdateWeaponSprite
    LDA Maybe_Player_DAT_00a8
    BMI @LAB_PRG15_MIRROR__ed34

  @LAB_PRG15_MIRROR__ed28:                  ; [$ed28]
    JSR FUN_PRG15_MIRROR__eebf
    JSR PPUBuffer_Draw
    INC Maybe_Player_DAT_00a8
    DEC Temp_00
    BPL @LAB_PRG15_MIRROR__ed28

  @LAB_PRG15_MIRROR__ed34:                  ; [$ed34]
    JSR Player_Something_ShieldState
    LDA Maybe_Player_DAT_00a8
    BMI @_return

  @LAB_PRG15_MIRROR__ed3b:                  ; [$ed3b]
    JSR FUN_PRG15_MIRROR__ee93
    INC Maybe_Player_DAT_00a8
    DEC Temp_00
    BPL @LAB_PRG15_MIRROR__ed3b

  @_return:                                 ; [$ed44]
    RTS


;============================================================================
; TODO: Document Maybe_Player_UpdateVisibleItemStates
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_HandleDeath
;     Player_SetArmor
;     Player_SetShield
;     Player_SetWeapon
;============================================================================
Maybe_Player_UpdateVisibleItemStates:       ; [$ed45]
    JSR Maybe_Player_UpdateArmorState

  @LAB_PRG15_MIRROR__ed48:                  ; [$ed48]
    JSR FUN_PRG15_MIRROR__eea9
    INC Maybe_Player_DAT_00a8
    DEC Temp_00
    BPL @LAB_PRG15_MIRROR__ed48
    JSR Maybe_Player_UpdateWeaponSprite
    LDA Maybe_Player_DAT_00a8
    BMI @LAB_PRG15_MIRROR__ed61

  @LAB_PRG15_MIRROR__ed58:                  ; [$ed58]
    JSR FUN_PRG15_MIRROR__eebf
    INC Maybe_Player_DAT_00a8
    DEC Temp_00
    BPL @LAB_PRG15_MIRROR__ed58

  @LAB_PRG15_MIRROR__ed61:                  ; [$ed61]
    JSR Player_Something_ShieldState
    LDA Maybe_Player_DAT_00a8
    BMI @_return

  @LAB_PRG15_MIRROR__ed68:                  ; [$ed68]
    JSR FUN_PRG15_MIRROR__ee93
    INC Maybe_Player_DAT_00a8
    DEC Temp_00
    BPL @LAB_PRG15_MIRROR__ed68

  @_return:                                 ; [$ed71]
    RTS


;============================================================================
; TODO: Document Maybe_Player_UpdateArmorState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     Maybe_Player_UpdateVisibleItemStates
;============================================================================
Maybe_Player_UpdateArmorState:              ; [$ed72]
    LDA #$00
    STA Maybe_Player_DAT_00a8
    STA Maybe_Player_AccessorySpriteAddr_U
    STA Maybe_Player_AccessorySpriteAddr_L
    LDA a:SelectedArmor
    ASL A
    LDY a:SelectedShield
    CPY #$03
    BCS @LAB_PRG15_MIRROR__ed87
    ORA #$01

  @LAB_PRG15_MIRROR__ed87:                  ; [$ed87]
    STA Maybe_Player_NormArmorState
    TAX
    LDA #$ed95,X
    STA Temp_00
    TXA
    ASL A
    TAY
    JMP Maybe_Player_LoadArmorSprite

;
; XREFS:
;     Maybe_Player_UpdateArmorState
;
BYTE_ARRAY_PRG15_MIRROR__ed95:              ; [$ed95]
    db $33                                  ; [0]: Leather armor
    db $27                                  ; [1]:
    db $33                                  ; [2]: Studded Mail
    db $27                                  ; [3]:
    db $34                                  ; [4]: Full Plate
    db $28                                  ; [5]:
    db $32                                  ; [6]: Battle Helmet
    db $32                                  ; [7]:


;============================================================================
; TODO: Document Maybe_Player_UpdateWeaponSprite
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     Maybe_Player_UpdateVisibleItemStates
;============================================================================
Maybe_Player_UpdateWeaponSprite:            ; [$ed9d]
    LDA #$00
    STA Maybe_Player_DAT_00a8
    LDA a:Player_CurWeapon
    CMP #$ff
    BNE @LAB_PRG15_MIRROR__edab
    STA Maybe_Player_DAT_00a8
    RTS

  @LAB_PRG15_MIRROR__edab:                  ; [$edab]
    TAX
    LDA #$edc1,X
    STA Temp_00
    TXA
    ASL A
    TAY
    LDA #$edc5,Y
    STA Maybe_Player_AccessorySpriteAddr_U
    LDA #$edc6,Y
    STA Maybe_Player_AccessorySpriteAddr_L
    JMP Maybe_Player_LoadWeaponSprite

;
; XREFS:
;     Maybe_Player_UpdateWeaponSprite
;
BYTE_ARRAY_PRG15_MIRROR__edc1:              ; [$edc1]
    db $02                                  ; [0]:
    db $05                                  ; [1]:
    db $06                                  ; [2]:
    db $08                                  ; [3]:

;
; XREFS:
;     Maybe_Player_UpdateWeaponSprite
;
MAYBE_WEAPON_SPRITE_ADDRS_U:                ; [$edc5]
    db $80                                  ; [$edc5] undefined

;
; XREFS:
;     Maybe_Player_UpdateWeaponSprite
;
MAYBE_WEAPON_SPRITE_ADDRS_L:                ; [$edc6]
    db $03,$80,$03,$80,$03,$40,$03          ; [$edc6] undefined


;============================================================================
; TODO: Document Player_Something_ShieldState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     Maybe_Player_UpdateVisibleItemStates
;============================================================================
Player_Something_ShieldState:               ; [$edcd]
    LDA #$00
    STA Maybe_Player_DAT_00a8
    LDA a:SelectedShield
    CMP #$03
    BCC @LAB_PRG15_MIRROR__eddb
    STA Maybe_Player_DAT_00a8
    RTS

  @LAB_PRG15_MIRROR__eddb:                  ; [$eddb]
    ASL A
    TAY
    LDA #$05
    STA Temp_00
    LDA #$00
    STA Maybe_Player_AccessorySpriteAddr_U
    LDA #$03
    STA Maybe_Player_AccessorySpriteAddr_L
    JMP Maybe_Player_LoadShieldSprite


;============================================================================
; Set the player's current weapon.
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
;     None
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetWeapon:                           ; [$edec]
    PHA

    ;
    ; Check that the player is not in a building.
    ;
    ; A weapon cannot be set while in a building.
    ;
    LDA Area_CurrentArea                    ; Set A = current area.
    CMP #$04                                ; Is this the building?
    BEQ @_setInInventory                    ; If so, branch.
    PLA
    STA a:SelectedWeapon                    ; Set as the current weapon in
                                            ; the inventory.
    STA a:Player_CurWeapon
    JSR Maybe_Player_UpdateVisibleItemStates
    CLC
    RTS

  @_setInInventory:                         ; [$edff]
    PLA
    STA a:SelectedWeapon
    CLC
    RTS


;============================================================================
; Set the player's current armor.
;
; INPUTS:
;     A:
;         0 = Leather
;         1 = Studded Mail
;         2 = Full Plate
;         3 = Battle Suit
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetArmor:                            ; [$ee05]
    STA a:SelectedArmor
    JSR Maybe_Player_UpdateVisibleItemStates
    CLC
    RTS


;============================================================================
; Set the player's current shield.
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
;     None
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetShield:                           ; [$ee0d]
    STA a:SelectedShield
    JSR Maybe_Player_UpdateVisibleItemStates
    CLC
    RTS


;============================================================================
; TODO: Document Maybe_Player_LoadArmorSprite
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Player_UpdateArmorState
;============================================================================
Maybe_Player_LoadArmorSprite:               ; [$ee15]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:ROMBankStart
    STA PlayerSprite_ReadAddr_L
    LDA a:#$8001
    CLC
    ADC #$80
    STA PlayerSprite_ReadAddr_U
    LDA (PlayerSprite_ReadAddr_L),Y
    PHA
    INY
    LDA (PlayerSprite_ReadAddr_L),Y
    CLC
    ADC #$80
    STA PlayerSprite_ReadAddr_U
    PLA
    STA PlayerSprite_ReadAddr_L
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; TODO: Document Maybe_Player_LoadWeaponSprite
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Player_UpdateWeaponSprite
;============================================================================
Maybe_Player_LoadWeaponSprite:              ; [$ee3f]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:#$8002
    STA PlayerSprite_ReadAddr_L
    LDA a:#$8003
    CLC
    ADC #$80
    STA PlayerSprite_ReadAddr_U
    LDA (PlayerSprite_ReadAddr_L),Y
    PHA
    INY
    LDA (PlayerSprite_ReadAddr_L),Y
    CLC
    ADC #$80
    STA PlayerSprite_ReadAddr_U
    PLA
    STA PlayerSprite_ReadAddr_L
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; TODO: Document Maybe_Player_LoadShieldSprite
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_Something_ShieldState
;============================================================================
Maybe_Player_LoadShieldSprite:              ; [$ee69]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:#$800c
    STA PlayerSprite_ReadAddr_L
    LDA a:#$800d
    CLC
    ADC #$80
    STA PlayerSprite_ReadAddr_U
    LDA (PlayerSprite_ReadAddr_L),Y
    PHA
    INY
    LDA (PlayerSprite_ReadAddr_L),Y
    CLC
    ADC #$80
    STA PlayerSprite_ReadAddr_U
    PLA
    STA PlayerSprite_ReadAddr_L
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__ee93
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     Maybe_Player_UpdateVisibleItemStates
;============================================================================
FUN_PRG15_MIRROR__ee93:                     ; [$ee93]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:#$800a
    STA Temp_Addr_L
    LDA a:#$800b
    STA Temp_Addr_U
    JMP LABEL_EED2


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__eea9
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     Maybe_Player_UpdateVisibleItemStates
;============================================================================
FUN_PRG15_MIRROR__eea9:                     ; [$eea9]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:#$8004
    STA Temp_Addr_L
    LDA a:#$8005
    STA Temp_Addr_U
    JMP LABEL_EED2


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__eebf
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__ed12
;     Maybe_Player_UpdateVisibleItemStates
;============================================================================
FUN_PRG15_MIRROR__eebf:                     ; [$eebf]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:#$8006
    STA Temp_Addr_L
    LDA a:#$8007
    STA Temp_Addr_U

    ;
    ; XREFS:
    ;     FUN_PRG15_MIRROR__ee93
    ;     FUN_PRG15_MIRROR__eea9
    ;
LABEL_EED2:                                 ; [$eed2]
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDY Maybe_Player_DAT_00a8
    LDA #$00
    STA Temp_05
    LDA (PlayerSprite_ReadAddr_L),Y
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05
    ASL A
    ROL Temp_05
    STA Temp_04
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    LDA Temp_04
    CLC
    ADC Temp_Addr_L
    STA Temp_04
    LDA Temp_05
    ADC Temp_Addr_U
    CLC
    ADC #$80
    STA Temp_05
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA Maybe_Player_AccessorySpriteAddr_L
    STA a:PPU_TargetAddr.U
    LDA Maybe_Player_AccessorySpriteAddr_U
    STA a:PPU_TargetAddr
    LDA #$10
    JSR PPUBuffer_QueueCommandOrLength
    LDY #$00

  @LAB_PRG15_MIRROR__ef25:                  ; [$ef25]
    LDA (Temp_04),Y
    STA PPUBuffer,X
    INX
    INY
    CPY #$10
    BCC @LAB_PRG15_MIRROR__ef25
    STX PPUBuffer_UpperBounds
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    LDA Maybe_Player_AccessorySpriteAddr_U
    CLC
    ADC #$10
    STA Maybe_Player_AccessorySpriteAddr_U
    LDA Maybe_Player_AccessorySpriteAddr_L
    ADC #$00
    STA Maybe_Player_AccessorySpriteAddr_L
    RTS


;============================================================================
; DEAD CODE: Unset the special event ID.
;
; This is not used in the game.
;============================================================================
DEAD_FUN_PRG15_MIRROR__ef45:                ; [$ef45]
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
; DEAD CODE: Check if there are sprites not of a given entity.
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
;     SpriteBehavior__a354
;     SpriteBehavior__a384
;     SpriteBehavior__a3bf
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
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
; TODO: Document FUN_PRG15_MIRROR__f01b
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_DrawPortraitAnimationFrame
;============================================================================
FUN_PRG15_MIRROR__f01b:                     ; [$f01b]
    TAY
    LDA a:CurrentROMBank2
    PHA
    LDX #$07
    JSR MMC1_UpdatePRGBank
    TYA
    ASL A
    TAY
    PHP
    LDA a:#$800a
    STA Temp_Addr_L
    LDA a:#$800b
    PLP
    ADC #$80
    STA Temp_Addr_U
    JMP Sprite_Maybe_SetAppearanceAddr


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__f039
;
; INPUTS:
;     None.
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
FUN_PRG15_MIRROR__f039:                     ; [$f039]
    TAY
    LDA a:CurrentROMBank2
    PHA
    LDX #$07
    JSR MMC1_UpdatePRGBank
    TYA
    ASL A
    TAY
    PHP
    LDA a:#$8008
    STA Temp_Addr_L
    LDA a:#$8009
    PLP
    ADC #$80
    STA Temp_Addr_U
    JMP Sprite_Maybe_SetAppearanceAddr


;============================================================================
; TODO: Document Sprite_Maybe_SetAppearanceAddrFromOffset
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_EnterNextAppearancePhase
;     CastMagic_Maybe_SetAppearance
;     Something_SetXYAndAnimOffset
;============================================================================
Sprite_Maybe_SetAppearanceAddrFromOffset:   ; [$f057]
    ;
    ; Switch to ROM bank 7 (PRG).
    ;
    TAY                                     ; Y = A (offset)
    LDA a:CurrentROMBank2                   ; Load the current ROM bank.
    PHA                                     ; Push it to the stack.
    LDX #$07
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 7 (PRG).
    TYA                                     ; A = Y (restore offset)

    ;
    ; Load the address to load sprite images from.
    ;
    ; With the addresses stored in PRG7::8006 and
    ; PRG7::8007, this should put us at a starting
    ; point of {@address PRG7::9036}, or {@address PRG7::9136} if offset
    ; overflowed.
    ;
    ASL A                                   ; Multiply offset by 2, to get
                                            ; word boundaries in the lookup
                                            ; table.
    TAY                                     ; Y = A (updated offset)
    PHP                                     ; Push flags and stack pointer.
    LDA a:#$8006                            ; Load the lower byte of the
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
; TODO: Document Sprite_Maybe_SetAppearanceAddr
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__f01b
;     FUN_PRG15_MIRROR__f039
;============================================================================
Sprite_Maybe_SetAppearanceAddr:             ; [$f072]
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
    SBC ScrollHelp_Pixel
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
    STA Temp_Addr_L                         ;  and store that as the new
                                            ; start offset.

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
    BEQ @LAB_PRG15_MIRROR__f0ec
    JMP @LAB_PRG15_MIRROR__f181

    ;
    ; The sprite is not flipped.
    ;
  @LAB_PRG15_MIRROR__f0ec:                  ; [$f0ec]
    LDA #$00                                ; A = 0
    STA Temp_Sprites_TileYOffset            ; Store it as our tiles Y offset.
    TAY                                     ; Y = 0

  @_spriteDataIsSet:                        ; [$f0f1]
    LDA Temp_Sprites_ColsRemaining          ; Load the number of tile columns
                                            ; remaining.
    PHA                                     ; Push it to the stack.
    LDA #$00                                ; A = 0
    STA Temp_Sprites_TileXOffset            ; Store as the start tiles X
                                            ; offset.

    ;
    ; Check if the current sprite data value is not 0xFF.
    ;
  @_innerLop:                               ; [$f0f8]
    LDA (Maybe_Temp_Sprite_L),Y             ; Load the value at the sprite
                                            ; data read address.
    CMP #$ff                                ; Is it 0xFF?
    BEQ @_prepareNextX                      ; If so, skip this.

    ;
    ; It's not 0xFF.
    ;
    ; Begin checking if we can add to the screen buffer.
    ;
    ; First we'll check if we can add sprites this frame.
    ;
    LDA Something_Sprites_ResetAtFrame      ; Can we add sprites this frame?
    BNE @_finishLoopIter                    ; If not, jump.

    ;
    ; We can add sprites.
    ;
    ; Check if this sprite would fit on screen.
    ;
    LDX Temp_Sprites_TileXOffset            ; X = tile X offset
    LDA Temp_Sprites_NormXPos               ; A = normalized X position
    ADC #$f23d,X                            ; A += the offset from the lookup
                                            ; table at X.
    STA Temp_00                             ; Store it temporarily.
    LDA Something_SpriteData_X              ; Load the default X position.
    ADC #$00                                ; Add carry (from overflow), if
                                            ; set.
    BNE @_finishLoopIter                    ; If it doesn't fit on screen,
                                            ; jump.

    ;
    ; X could fit on screen. Check Y.
    ;
    LDX Temp_Sprites_TileYOffset            ; X = tile Y offset
    LDA Temp_Sprites_NormYPos               ; A = normalized Y position
    ADC #$f23d,X                            ; A += the offset from the lookup
                                            ; table at X
    STA Temp_01                             ; Store it temporarily.
    LDA Something_SpriteData_Y              ; Load the default Y position.
    ADC #$00                                ; Add carry (from overflow), if
                                            ; set.
    BNE @_finishLoopIter                    ; If it doesn't fit on screen,
                                            ; jump.

    ;
    ; The sprite fits on screen.
    ;
    ; We'll begin adding to the screen buffer.
    ;
    TYA                                     ; A = Y
    PHA                                     ; Push our loop counter to the
                                            ; stack.
    LDA BYTE_0025
    ASL A
    ASL A
    EOR Maybe_FrameAltToggleFlags

    ;
    ; Store the result in the screen buffer at X.
    ;
    TAX
    LDA Temp_01
    STA #$0700,X
    INX
    LDA (Maybe_Temp_Sprite_L),Y
    CLC
    ADC Maybe_CurrentSprite_PPUOffset
    STA #$0700,X
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
    BEQ @LAB_PRG15_MIRROR__f151
    LDA Temp_01
    ORA #$20
    STA Temp_01

    ;
    ; Store the result in the screen buffer at X.
    ;
  @LAB_PRG15_MIRROR__f151:                  ; [$f151]
    LDA Temp_01                             ; Load the first to store.
    STA #$0700,X                            ; Store it in the screen buffer
                                            ; at X.
    INX                                     ; X++
    LDA Temp_00                             ; Load the second to store.
    STA #$0700,X                            ; Store it in the screen buffer
                                            ; at X.
    JSR Sprite_Something_ChangeBitsAndMaybeInc ; Finish up with this sprite's
                                               ; state.
    PLA                                     ; Pull A (loop counter) from
                                            ; stack.
    TAY                                     ; Y = A

  @_finishLoopIter:                         ; [$f161]
    INY

  @_prepareNextX:                           ; [$f162]
    INY
    INC Temp_Sprites_TileXOffset
    DEC Temp_Sprites_ColsRemaining
    BPL @_innerLop
    PLA
    STA Temp_Sprites_ColsRemaining
    INC Temp_Sprites_TileYOffset
    DEC Temp_Sprites_RowsRemaining
    BMI @LAB_PRG15_MIRROR__f175
    JMP @_spriteDataIsSet

  @LAB_PRG15_MIRROR__f175:                  ; [$f175]
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    STA MovingSpriteVisibility
    RTS

    ;
    ; The sprite is flipped.
    ;
  @LAB_PRG15_MIRROR__f181:                  ; [$f181]
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
    LDA Something_Sprites_ResetAtFrame
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
    LDA BYTE_0025
    ASL A
    ASL A
    EOR Maybe_FrameAltToggleFlags
    TAX
    LDA Temp_01
    STA #$0700,X
    INX
    LDA (Maybe_Temp_Sprite_L),Y
    CLC
    ADC Maybe_CurrentSprite_PPUOffset
    STA #$0700,X
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
    STA #$0700,X
    INX
    LDA Temp_00
    STA #$0700,X
    JSR Sprite_Something_ChangeBitsAndMaybeInc
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
    JMP @LAB_PRG15_MIRROR__f175

;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
BYTE_ARRAY_PRG15_MIRROR__f224:              ; [$f224]
    db $01                                  ; [0]:
    db $02                                  ; [1]:

;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;
BYTE_ARRAY_PRG15_MIRROR__f226:              ; [$f226]
    db $02                                  ; [0]:
    db $01                                  ; [1]:


;============================================================================
; TODO: Document Sprite_Something_ChangeBitsAndMaybeInc
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
;============================================================================
Sprite_Something_ChangeBitsAndMaybeInc:     ; [$f228]
    LDA BYTE_0025
    EOR #$20
    STA BYTE_0025
    AND #$20
    BNE @_return
    INC BYTE_0025
    LDA BYTE_0025
    CMP #$20
    BCC @_return
    INC Something_Sprites_ResetAtFrame

  @_return:                                 ; [$f23c]
    RTS

;
; XREFS:
;     Sprite_Maybe_SetAppearanceAddr
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
; TODO: Document FUN_PRG15_MIRROR__f24d
;
; INPUTS:
;     A
;
; OUTPUTS:
;     A
;
; XREFS:
;     IScripts_Begin
;============================================================================
FUN_PRG15_MIRROR__f24d:                     ; [$f24d]
    STA a:Temp_03C7
    TAX
    BMI @LAB_PRG15_MIRROR__f27d
    JSR FUN_PRG15_MIRROR__f2e3
    JSR Game_WaitForOAMReset
    LDA a:Palette_CurrentIndex
    STA a:Palette_SavedIndex
    LDA #$02
    JSR Palette_LoadFromIndex
    JSR PPUBuffer_Append0
    LDA #$09
    STA PPU_TargetAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDY #$00

  @LAB_PRG15_MIRROR__f271:                  ; [$f271]
    TYA
    PHA
    JSR FUN_PRG15_MIRROR__f316
    BCS @LAB_PRG15_MIRROR__f27e
    PLA
    TAY
    INY
    BNE @LAB_PRG15_MIRROR__f271

  @LAB_PRG15_MIRROR__f27d:                  ; [$f27d]
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
;     Temp_03C7:
;         Set to 0xFF.
;
; CALLS:
;     Game_WaitForOAMReset
;     Palette_LoadFromIndex
;     PPUBuffer_Append0
;     MMC1_LoadBankAndJump
;     GameLoop_LoadSpriteImages
;
; XREFS:
;     IScriptAction_EndScript
;============================================================================
IScripts_ClearPortrait:                     ; [$f281]
    LDA #$ff
    STA a:Temp_03C7
    JSR Game_WaitForOAMReset
    LDA a:Palette_SavedIndex
    JSR Palette_LoadFromIndex
    JSR PPUBuffer_Append0

    ;
    ; Switch to bank 14 and run
    ; GameLoop_LoadSpriteImages
    ; (from bank 15).
    ;
    JSR MMC1_LoadBankAndJump
    db BANK_14_LOGIC                        ; Bank = 14 Address =
                                            ; GameLoop_LoadSpriteImages
    dw GameLoop_LoadSpriteImages-1

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
    LDA a:Temp_03C7
    BMI POP_RETURN_F299
    LDA #$00
    STA CurrentSprite_FlipMask

    ;
    ; Update the general portrait image.
    ;
    LDA #$90
    STA Maybe_CurrentSprite_PPUOffset
    JSR Something_Temp03C7Times5
    JSR FUN_PRG15_MIRROR__f01b

    ;
    ; Update the eye animation.
    ;
    LDA #$90
    STA Maybe_CurrentSprite_PPUOffset
    PLA
    PHA
    AND #$01
    TAX
    JSR Something_Temp03C7Times5
    CLC
    ADC #$f2df,X
    JSR FUN_PRG15_MIRROR__f01b

    ;
    ; Update the mouth animation.
    ;
    LDA #$90
    STA Maybe_CurrentSprite_PPUOffset
    PLA
    LSR A
    AND #$01
    TAX
    JSR Something_Temp03C7Times5
    CLC
    ADC #$f2e1,X
    JMP FUN_PRG15_MIRROR__f01b


;============================================================================
; TODO: Document Something_Temp03C7Times5
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
Something_Temp03C7Times5:                   ; [$f2d5]
    LDA a:Temp_03C7
    ASL A
    ASL A
    CLC
    ADC a:Temp_03C7
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
;     FUN_PRG15_MIRROR__f24d
;============================================================================
FUN_PRG15_MIRROR__f2e3:                     ; [$f2e3]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
    LDA a:Temp_03C7
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
    ;     FUN_PRG15_MIRROR__f316
    ;
LABEL_F30F:                                 ; [$f30f]
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    SEC
    RTS


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__f316
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG15_MIRROR__f24d
;============================================================================
FUN_PRG15_MIRROR__f316:                     ; [$f316]
    LDA a:CurrentROMBank2
    PHA
    LDX #$08
    JSR MMC1_UpdatePRGBank
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
    STX PPUBuffer_UpperBounds
    LDA PPU_TargetAddr
    CLC
    ADC #$10
    STA PPU_TargetAddr
    LDA PPU_TargetAddr.U
    ADC #$00
    STA PPU_TargetAddr.U
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
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
;     MMC1_UpdatePRGBank
;     PPU_WriteGlyphTile
;
; XREFS:
;     PasswordScreen_Show
;============================================================================
PPU_LoadGlyphsForStrings:                   ; [$f3a5]
    LDA a:CurrentROMBank2
    PHA
    LDX #$0d
    JSR MMC1_UpdatePRGBank
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
;     MMC1_UpdatePRGBank
;
; XREFS:
;     FUN_PRG15_MIRROR__f2e3
;     FUN_PRG15_MIRROR__fbaf
;     GameLoop_LoadSpriteInfo
;     Game_DrawScreenInFrozenState
;     Player_DrawItemInternal
;     Sprites_LoadSpriteValue
;     TextBox_Maybe_ShowNextCharFromBank
;     TextBox_Maybe_WriteLineOfChars
;     TextBox_ShowNextChar
;============================================================================
MMC1_UpdatePRGBankToStackA:                 ; [$f3d6]
    PLA                                     ; Pop the bank from the stack.
    TAX                                     ; X = A
    JSR MMC1_UpdatePRGBank                  ; Switch to the bank.
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
;     TextBox_Maybe_ShowNextCharFromBank
;
; XREFS:
;     IScriptAction_ShowBuySellMenu
;============================================================================
Maybe_Menu_ShowMessageID:                   ; [$f3e9]
    JSR Messages_Load                       ; Load the message.

  @_loop:                                   ; [$f3ec]
    JSR TextBox_Maybe_ShowNextCharFromBank  ; Show the next character from
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
; fall through to TextBox_ClearShopSize.
;
; INPUTS:
;     A:
;         The 1-based index of the message to load.
;
;     MESSAGE_STRINGS:
;         The list of messages to scan.
;
; OUTPUTS:
;     Maybe_MessageLength:
;         The length of the message string.
;
;     Maybe_MessageCharPos:
;         The starting message character position (0).
;
;     #$0219:
;     LoadedMessageAddr:
;         The address of the start of the message string.
;
;     #$e9:
;     PPU_TargetAddr:
;         Set to address $1400.
;
;     TextBox_MessageEnded:
;     TextBox_CharPosForLine:
;     TextBox_DrawnLineNum:
;     TextBox_LineScrollOffset:
;     Textbox_TitleCharOffset:
;         All set to 0.
;
;     MaybeUnused_Arg_TextBox_Height:
;         Set to 4.
;
; XREFS:
;     IScriptAction_22
;     IScriptAction_OpenShop
;     IScriptAction_ShowMessage
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     Shop_ShowMessage
;     Maybe_Menu_ShowMessageID
;============================================================================
Messages_Load:                              ; [$f3f5]
    STA a:MessageID

    ;
    ; Save our current bank.
    ;
    LDA a:CurrentROMBank2                   ; A = Our current bank
    PHA                                     ; Push A to the stack.

    ;
    ; Switch to Bank 13 for the strings.
    ;
    LDX #$0d                                ; Update to Bank 13.
    JSR MMC1_UpdatePRGBank

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
    STY a:Maybe_MessageLength               ; Message length = Y
    LDA Temp_Int24                          ; Load the new lower byte of the
                                            ; string position.
    STA a:LoadedMessageAddr                 ; Store it.
    LDA Temp_Int24.M                        ; Load the new upper byte of the
                                            ; string position.
    STA a:LoadedMessageAddr.U               ; Store it.

    ;
    ; Restore our previous bank.
    ;
    PLA                                     ; Pop A (our previous bank) off
                                            ; the stack.
    TAX                                     ; X = A
    JSR MMC1_UpdatePRGBank                  ; Switch bank to the bank.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO
;
; This falls through to
; TextBox_ClearShopSizeAtOffset.
;
; INPUTS:
;     X:
;         The offset into the PPU to fill.
;
; OUTPUTS:
;     #$e9:
;     PPU_TargetAddr:
;         Set to address $1400.
;
;     TextBox_MessageEnded:
;     TextBox_CharPosForLine:
;     TextBox_DrawnLineNum:
;     TextBox_LineScrollOffset:
;     Textbox_TitleCharOffset:
;         All set to 0.
;
;     MaybeUnused_Arg_TextBox_Height:
;         Set to 4.
;
; XREFS:
;     IScriptAction_ShowPassword
;============================================================================
TextBox_ClearShopSize:                      ; [$f434]
    LDA #$00
    STA a:TextBox_LineScrollOffset
    STA a:TextBox_CharPosForLine
    STA a:TextBox_DrawnLineNum
    STA a:TextBox_MessageEnded
    STA a:Textbox_TitleCharOffset
    LDA #$04
    STA a:MaybeUnused_Arg_TextBox_Height

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document TextBox_ClearShopSizeAtOffset
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_Something_9910
;============================================================================
TextBox_ClearShopSizeAtOffset:              ; [$f44a]
    LDA #$14
    STA PPU_TargetAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDY #$20

  @_writeLoop:                              ; [$f454]
    TYA
    PHA
    LDA #$00
    LDY #$20
    JSR PPUBuffer_WriteValueMany
    JSR PPU_IncrementAddrBy32
    PLA
    TAY
    DEY
    BNE @_writeLoop

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
;     MMC1_UpdatePRGBank
;     MMC1_UpdatePRGBankToStackA
;     Maybe_TextBox_ShowCurrentMessageID
;
; XREFS:
;     IScriptAction_22
;     IScriptAction_OpenShop
;     IScriptAction_ShowMessage
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     Shop_ShowMessage
;============================================================================
TextBox_ShowNextChar:                       ; [$f466]
    ;
    ; Save the current bank and switch to bank 13 (strings).
    ;
    LDA a:CurrentROMBank2                   ; A = current bank
    PHA                                     ; Push it to the stack.
    LDX #$0d                                ; X = 13 (bank)
    JSR MMC1_UpdatePRGBank                  ; Switch to bank 13.

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
; TODO: Document TextBox_Maybe_ShowNextCharFromBank
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Menu_ShowMessageID
;============================================================================
TextBox_Maybe_ShowNextCharFromBank:         ; [$f47d]
    ;
    ; Save the current ROM.
    ;
    LDA a:CurrentROMBank2
    PHA

    ;
    ; Switch to Bank 13, where the strings are.
    ;
    LDX #$0d
    JSR MMC1_UpdatePRGBank
    LDA #$00
    STA a:TextBox_PlayTextSound
    JSR TextBox_Something_ShowMessage_f4a2

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
    LDA a:TextBox_MessageEnded
    BNE TextBox_ClearShopSizeAtOffset_return
    LDA a:Maybe_MessageCharPos              ; Load the character position to
                                            ; display.
    AND #$03                                ; Check the first 2 bits.
    BNE TextBox_ClearShopSizeAtOffset_return ; If neither bit is set, return.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document TextBox_Something_ShowMessage_f4a2
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_Maybe_ShowNextCharFromBank
;============================================================================
TextBox_Something_ShowMessage_f4a2:         ; [$f4a2]
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
;     TextBox_ShowMessage_Newline
;     TextBox_Something_ShowMessage_f4a2
;============================================================================
TextBox_ShowMessage_LoadMessage:            ; [$f4c8]
    LDA a:LoadedMessageAddr
    STA Temp_Int24
    LDA a:LoadedMessageAddr.U
    STA Temp_Int24.M
    LDY a:Maybe_MessageLength
    INC a:Maybe_MessageLength
    BNE @LAB_PRG15_MIRROR__f4dd
    INC a:LoadedMessageAddr.U

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
;     TextBox_ShowMessage_ShowPlayerTitle
;     TextBox_Something_ShowMessage_f4a2
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
    LDA a:LoadedMessageAddr
    STA Temp_Int24
    LDA a:LoadedMessageAddr.U
    STA Temp_Int24.M
    LDY a:Maybe_MessageLength
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
;     TextBox_TextX:
;         The X position to begin writing to.
;
;     TextBox_TextY:
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
;     PPU_SetAddrForTextPos
;     PPUBuffer_WriteValueMany
;     TextBox_FillPlaceholderTextForLineCapped
;
; XREFS:
;     Shops_Something_9949
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
; TODO: Document TextBox_ShowMessage_Pause
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
TextBox_ShowMessage_Pause:                  ; [$f53f]
    ;
    ; If it's 0xFC, it's a pause in the message the player
    ; must acknowledge.
    ;
    LDA a:LoadedMessageAddr                 ; Load the lower byte of the
                                            ; message string address.
    STA Temp_Int24                          ; Store it for length
                                            ; calculation.
    LDA a:LoadedMessageAddr.U               ; Load the upper byte.
    STA Temp_Int24.M                        ; Store it.
    LDY a:Maybe_MessageLength               ; Load the message length.
    LDA (Temp_Int24),Y                      ; Load the next byte of the
                                            ; message.

    ;
    ; If it's 0xFF, the message ends.
    ;
    CMP #$ff                                ; Is it 0xFF (end of message)?
    BEQ TextBox_ShowMessage_EndOfMessage    ; If true, then end message.
    LDA #$ff
    STA a:TextBox_MessageEnded

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
; TODO: Document TextBox_ShowMessage_ShowPlayerTitle
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
    STA TextBox_TextX                       ; Store as the text X start
                                            ; position.
    LDA a:TextBox_Y                         ; Y = textbox tile Y coordinate.
    CLC
    ADC #$02                                ; Y += 2
    STA TextBox_TextY                       ; Store as the text Y start
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
    JSR PPU_SetAddrForTextPos               ; Set the PPU address for the
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
    INC TextBox_TextY                       ; TextBox_TextY
                                            ; += 3
    INC TextBox_TextY
    INC TextBox_TextY

    ;
    ; Draw a line of text to fill the address.
    ;
    ; This will be:
    ;
    ;     PQRSTUVWXYZ[\]^_
    ;
    JSR PPU_SetAddrForTextPos               ; Set the text draw position
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
;     PPUBuffer_UpperBounds:
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
;     PPUBuffer_UpperBounds:
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
;     PPUBuffer_UpperBounds:
;         The new upper bounds of the PPU buffer.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_Set
;     PPU_IncrementAddrBy32
;
; XREFS:
;     IScripts_Something_9910
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
    STX PPUBuffer_UpperBounds               ; Store the new offset as the PPU
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
;     PPUBuffer_UpperBounds:
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
    LDA a:CurrentROMBank2                   ; A = current bank
    PHA                                     ; Push A to the stack.
    LDX #$0d                                ; A = bank 13
    JSR MMC1_UpdatePRGBank                  ; Switch to it.

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
    STX PPUBuffer_UpperBounds               ; Store the new upper bounds for
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
;     TextBox_ShowMessage_ShowPlayerTitle
;     TextBox_Something_ShowMessage_f4a2
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
;     Shop_Something__8d5a
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
;     Maybe_DrawItemTitle
;     Player_AddToInventory
;     Player_Equip
;     Player_LacksItem
;     Player_RemoveItem
;     Something_ShopCursorInventory
;     Player_DrawItemInternal
;============================================================================
GetInventoryIndexForItem:                   ; [$f785]
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
;     FUN_PRG12__8bce
;     FUN_PRG12__8c04
;     IScriptAction_ShowSellMenu
;     Shop_Something__8d5a
;============================================================================
BitShiftLeft5:                              ; [$f78b]
    ASL A                                   ; Shift left 5 (here and the next
                                            ; 4 after falling through).


;============================================================================
; TODO: Document Math_MultiplyBy8
;
; INPUTS:
;     A
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG12__9075
;     Maybe_DrawItemTitle
;     Shop_Something__8d5a
;     UI_ShowPlayerMenu
;     TextBox_Maybe_GetPaletteBehindTextbox
;============================================================================
Math_MultiplyBy8:                           ; [$f78c]
    ASL A                                   ; Shift left 4.
    ASL A
    ASL A
    ASL A
    RTS


;============================================================================
; TODO: Document TextBox_Maybe_GetPaletteBehindTextbox
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     TextBox_Maybe_GetPalette
;============================================================================
TextBox_Maybe_GetPaletteBehindTextbox:      ; [$f791]
    TYA
    PHA
    TXA
    PHA
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    LDA a:TextBox_TextY
    JSR Math_MultiplyBy8
    AND #$f0
    STA Temp_Int24
    ORA a:TextBox_TextX
    SEC
    SBC #$20
    TAX
    LDY ScreenBuffer,X
    LDA (CurrentArea_BlockAttributesAddr),Y
    JMP SUB_PRG15_MIRROR__f7f6


;============================================================================
; TODO: Document FUN_PRG15_MIRROR__f7b7
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     Maybe_Draw_Textbox
;============================================================================
FUN_PRG15_MIRROR__f7b7:                     ; [$f7b7]
    TYA
    PHA
    TXA
    PHA
    LDA a:CurrentROMBank2
    PHA
    LDX #$03
    JSR MMC1_UpdatePRGBank
    LDA a:TextBox_TextY
    ASL A
    ASL A
    ASL A
    AND #$f0
    STA Temp_Int24
    LDA a:TextBox_TextX
    LSR A
    ORA Temp_Int24
    SEC
    SBC #$20
    TAX
    LDY ScreenBuffer,X
    LDA a:TextBox_TextX
    AND #$01
    STA Temp_Int24
    LDA a:TextBox_TextY
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
    ;     TextBox_Maybe_GetPaletteBehindTextbox
    ;
SUB_PRG15_MIRROR__f7f6:                     ; [$f7f6]
    STA Temp_Int24
    PLA
    TAX
    JSR MMC1_UpdatePRGBank
    PLA
    TAX
    PLA
    TAY
    LDA Temp_Int24
    RTS


;============================================================================
; Set the PPU address for drawing text.
;
; INPUTS:
;     ScrollHelp_Screen:
;         The screen being drawn into.
;
;     TextBox_TextX:
;         The X position to draw text into.
;
;     TextBox_TextY:
;         The Y position to draw text into.
;
; OUTPUTS:
;     PPU_TargetAddr:
;     #$e9:
;         The target address to draw to.
;
; XREFS:
;     IScriptAction_AddItem_Something8EC1
;     IScripts_Something_9910
;     Maybe_DrawItemName
;     Maybe_DrawItemTitle
;     Maybe_Draw_Textbox
;     Shop_DrawItemStrings
;     Shop_Something__8d5a
;     TextBox_Maybe_Draw
;     UI_ShowPlayerMenu
;     Maybe_Shop_DrawPrices
;     TextBox_ShowMessage_Fill4Lines
;     UI_DrawDigitsNoLeadingZeroes
;============================================================================
PPU_SetAddrForTextPos:                      ; [$f804]
    LDA ScrollHelp_Screen                   ; A = Scroll screen used for
                                            ; drawing.
    AND #$01                                ; Convert to 0/1 (even/odd).
    ORA #$08                                ; A += 8
    STA PPU_TargetAddr.U                    ; Store as the PPU target
                                            ; address.
    LDA a:TextBox_TextY                     ; Load the text Y position.
    ASL A                                   ; A = A * 16
    ASL A
    ASL A
    ASL A
    ROL PPU_TargetAddr.U                    ; Rotate the upper byte of the
                                            ; target address left.
    ASL A                                   ; A << 1
    ROL PPU_TargetAddr.U                    ; Rotate the upper byte of the
                                            ; target address left.
    ORA a:TextBox_TextX                     ; OR it with the X position.
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
;     Player_DrawItemInternal
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
;     Maybe_Draw_Textbox_Something8F51
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
;     IScriptAction_AddItem_Something8EC1
;     Maybe_DrawItemName
;     Maybe_Draw_Textbox
;     TextBox_Maybe_Draw
;     TextBox_ClearShopSizeAtOffset
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
;     Shop_DrawItemStrings
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
; TODO: Document TextBox_QueueRightCoordInPPUBuffer
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     TextBox_Maybe_Draw
;============================================================================
TextBox_QueueRightCoordInPPUBuffer:         ; [$f832]
    LDA a:TextBox_Width
    TAY
    JMP PPUBuffer_QueueCommandOrLength


;============================================================================
; TODO: Document TextBox_SomethingPPUBuffer_Set
;
; INPUTS:
;     A
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddItem_Something8EC1
;     TextBox_Maybe_Draw
;     TextBox_SomethingPPUBuffer_Set
;============================================================================
TextBox_SomethingPPUBuffer_Set:             ; [$f839]
    JSR PPUBuffer_Set
    DEY
    CPY #$02
    BNE TextBox_SomethingPPUBuffer_Set
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
;     PasswrodScreen_DrawMessage
;     Player_DrawItemInternal
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
; XREFS:
;     FUN_PRG12__9041
;     FUN_PRG12__92ed
;     Maybe_DrawItemName
;     Maybe_Draw_Textbox
;     Maybe_Draw_Textbox_Something8F51
;     Strings_Draw
;     TextBox_Maybe_Draw
;     PPUBuffer_WriteValueMany
;     TextBox_FillPlaceholderTextAtLineWithStartChar
;     TextBox_SomethingPPUBuffer_Set
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
;     X:
;         The starting offset in the buffer to write to.
;
;     Y:
;         The number of times to write the value.
;
; OUTPUTS:
;     X:
;         The new offset in the buffer after these values.
;
; XREFS:
;     TextBox_ClearShopSizeAtOffset
;     TextBox_ShowMessage_Fill4Lines
;============================================================================
PPUBuffer_WriteValueMany:                   ; [$f84a]
    PHA                                     ; Push A to the stack
    TYA                                     ; A = Y
    JSR PPUBuffer_QueueCommandOrLength      ; Write the length to the buffer.
    PLA                                     ; Pop A from the stack

  @_loop:                                   ; [$f850]
    JSR PPUBuffer_Set                       ; Set the value in the PPU
                                            ; buffer.
    DEY                                     ; Y--
    BNE @_loop                              ; If Y > 0, loop
    STX PPUBuffer_UpperBounds               ; Set the upper bounds to write.
    RTS


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
;     IScripts_ClearPortrait
;     Maybe_Player_PickUpGlove
;     Player_HandleDeath
;     Player_PickUpBattleHelmet
;     Player_PickUpBattleSuit
;     Player_PickUpBlackOnyx
;     Player_PickUpDragonSlayer
;     Player_PickUpElixir
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
    LDA a:CurrentROMBank2                   ; A =
                                            ; CurrentROMBank2
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
    JSR MMC1_UpdatePRGBank                  ; Update the ROM bank to X.

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
;     UI_DrawStatusSymbols
;============================================================================
PPU_WriteTilesFromCHRRAM:                   ; [$f89e]
    LDA a:CurrentROMBank2
    PHA
    JSR MMC1_UpdatePRGBank
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
    JMP MMC1_UpdatePRGBank


;============================================================================
; PPU address locations where statuc symbols are positioned.
;============================================================================

;
; XREFS:
;     UI_DrawStatusSymbols
;
UI_STATUS_SYMBOL_PPU_ADDR_L:                ; [$f8cb]
    db $41                                  ; [0]: 0x2041 -- "M" (Magic)

;
; XREFS:
;     UI_DrawStatusSymbols
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
;============================================================================

;
; XREFS:
;     UI_DrawStatusSymbols
;
UI_STATUS_TILES:                            ; [$f8d2]
    db $1c                                  ; [0]: "M" (Magic)

;
; XREFS:
;     UI_DrawStatusSymbols
;
UI_STATUS_TILES_1_:                         ; [$f8d3]
    db $0a                                  ; [1]: ":"

;
; XREFS:
;     UI_DrawStatusSymbols
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
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     Something_SetupNewScreen
;============================================================================
UI_DrawStatusSymbols:                       ; [$f8eb]
    LDA #$0a
    STA a:Something_ManaOrHPBar

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
    JSR FUN_PRG15_MIRROR__fbaf
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
; TODO: Document Maybe_Shop_DrawPrices
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Shop_Something__8d5a
;============================================================================
Maybe_Shop_DrawPrices:                      ; [$fa03]
    JSR PPU_SetAddrForTextPos


;============================================================================
; TODO: Document UI_DrawDigitsZeroPadded
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     UI_DrawGoldValue
;     UI_DrawPlayerExperience
;     UI_DrawTimeValue
;============================================================================
UI_DrawDigitsZeroPadded:                    ; [$fa06]
    TYA
    PHA
    JSR UI_PopulateDigits                   ; Populate the ASCII digits to
                                            ; render.

    ;
    ; XREFS:
    ;     UI_DrawDigitsNoLeadingZeroes
    ;
UI_DrawDigitsZeroPadded_Populated:          ; [$fa0b]
    PLA
    TAY
    JSR PPUBuffer_QueueCommandOrLength
    STY Temp_Int24
    LDA #$07
    SEC
    SBC Temp_Int24
    TAY

  @LAB_PRG15_MIRROR__fa18:                  ; [$fa18]
    LDA UI_DigitsToRender,Y
    JSR PPUBuffer_Set
    INY
    CPY #$07
    BNE @LAB_PRG15_MIRROR__fa18
    STX PPUBuffer_UpperBounds
    RTS


;============================================================================
; TODO: Document UI_DrawDigitsNoLeadingZeroes
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Shop_Draw
;============================================================================
UI_DrawDigitsNoLeadingZeroes:               ; [$fa26]
    JSR PPU_SetAddrForTextPos
    TYA
    PHA
    JSR UI_PopulateDigitsNoLeadingZeroes
    JMP UI_DrawDigitsZeroPadded_Populated


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
    LDA a:Something_ManaOrHPBar
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
    LDX a:Something_ManaOrHPBar
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
    CMP a:Something_ManaOrHPBar
    BEQ @LAB_PRG15_MIRROR__fae2
    PHA
    LDA #$fa70,Y
    JSR PPUBuffer_Set
    PLA
    TAY
    LDA #$07

  @LAB_PRG15_MIRROR__fad6:                  ; [$fad6]
    INY
    CPY a:Something_ManaOrHPBar
    BEQ @LAB_PRG15_MIRROR__fae2
    JSR PPUBuffer_Set
    JMP @LAB_PRG15_MIRROR__fad6

  @LAB_PRG15_MIRROR__fae2:                  ; [$fae2]
    LDA #$0b
    JSR PPUBuffer_Set
    STX PPUBuffer_UpperBounds
    LDA Temp_Int24.U
    AND #$07
    JSR Math_MultiplyBy8
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

  @LAB_PRG15_MIRROR__fb05:                  ; [$fb05]
    LDA #$fb2f,Y
    INY
    JSR PPUBuffer_Set
    TYA
    AND #$0f
    BNE @LAB_PRG15_MIRROR__fb05
    STX PPUBuffer_UpperBounds
    RTS

  @LAB_PRG15_MIRROR__fb14:                  ; [$fb14]
    LDA #$fb37,Y
    INY
    JSR PPUBuffer_Set
    TYA
    AND #$07
    BNE @LAB_PRG15_MIRROR__fb14

  @LAB_PRG15_MIRROR__fb20:                  ; [$fb20]
    LDA #$fb27,Y
    INY
    JSR PPUBuffer_Set

  @LAB_PRG15_MIRROR__fb27:                  ; [$fb27]
    TYA
    AND #$07
    BNE @LAB_PRG15_MIRROR__fb20
    STX PPUBuffer_UpperBounds
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
; TODO: Document FUN_PRG15_MIRROR__fbaf
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     UI_DrawStatusSymbols
;============================================================================
FUN_PRG15_MIRROR__fbaf:                     ; [$fbaf]
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
    LDA a:CurrentROMBank2
    PHA
    LDX #$0a
    JSR MMC1_UpdatePRGBank

  @LAB_PRG15_MIRROR__fbd1:                  ; [$fbd1]
    LDA #$b4e4,Y
    JSR FUN_PRG15_MIRROR__fbf0
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
; TODO: Document FUN_PRG15_MIRROR__fbf0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG15_MIRROR__fbaf
;     Player_DrawItemInternal
;============================================================================
FUN_PRG15_MIRROR__fbf0:                     ; [$fbf0]
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
; TODO: Document Player_DrawItemInternal
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_DrawItemName
;============================================================================
Player_DrawItemInternal:                    ; [$fc18]
    PHA
    JSR GetInventoryIndexForItem
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
    LDA a:CurrentROMBank2
    PHA
    LDX #$0a
    JSR MMC1_UpdatePRGBank

  @LAB_PRG15_MIRROR__fc36:                  ; [$fc36]
    LDA (#$ee),Y
    JSR FUN_PRG15_MIRROR__fbf0
    TYA
    PHA
    LDA #$10
    JSR PPUBuffer_QueueCommandOrLength
    LDY #$00

  @LAB_PRG15_MIRROR__fc44:                  ; [$fc44]
    JSR PPUBuffer_WriteFromTemp
    CPY #$10
    BNE @LAB_PRG15_MIRROR__fc44
    STX PPUBuffer_UpperBounds
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
;     Player_DrawItemInternal
;
FUN_PRG15_MIRROR__fc0b__LOWER_ADDR_TABLE:   ; [$fc5b]
    db $a0                                  ; [0]:
    db $b0                                  ; [1]:
    db $c0                                  ; [2]:
    db $d0                                  ; [3]:
    db $e4                                  ; [4]:

;
; XREFS:
;     Player_DrawItemInternal
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
;     Something_FrameAltToggleWithPausePPU
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
    JSR Something_FrameAltToggleWithPausePPU

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
    LDA a:ScreenBuffer_135_                 ; Check the chosen option.
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
; TODO: Document Something_SetXYAndAnimOffset
;
; INPUTS:
;     A
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__9075
;     IScripts_Something_99DB
;     IScripts_Something_SetXYAndOffset_99a1
;     IScripts_Something_SetXYAndOffset_99be
;     Menu_Something_954F
;     StartScreen_CheckHandleInput
;============================================================================
Something_SetXYAndAnimOffset:               ; [$fca7]
    STX Maybe_Arg_CurrentSprite_PosX
    STY Maybe_Arg_CurrentSprite_PosY
    LDX #$00
    STX CurrentSprite_FlipMask
    JMP Sprite_Maybe_SetAppearanceAddrFromOffset


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
;     FUN_PRG15_MIRROR__fbaf
;     PPU_ClearAllTilemaps
;     PPU_FillData
;     UI_DrawStatusSymbols
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
    hex ff ff ff 20 20 20 20 20 20 20 20 46 41 58 41 4e ; [$ffdd] undefined
    hex 41 44 55 27 42 00 00 48 04 01 07 18 94 99 c9 13 ; [$ffed] undefined
    db $c9,$d5,$c9                          ; [$fffd] undefined
