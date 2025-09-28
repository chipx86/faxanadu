;============================================================================
; Faxanadu (U).nes
;
; PRG14 ($8000 - $bfff)
;============================================================================

BASE $8000


;============================================================================
; TODO: Document Sprites_UpdateAll
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;     GetRandom
;============================================================================
Sprites_UpdateAll:                          ; [$8000]
    LDA a:Sprites_UpdatesPaused
    BNE @_spritesLoop
    LDA a:DurationHourGlass
    CMP #$ff
    BNE @_spritesLoop

    ;
    ; The Hour Glass isn't being used and sprites aren't paused,
    ; so sprites can be updated.
    ;
    INC a:SpriteUpdateCounter

    ;
    ; Begin the loop.
    ;
  @_spritesLoop:                            ; [$800f]
    LDX #$07

    ;
    ; Process this sprite slot if it's populated with a
    ; valid sprite.
    ;
  @_updateSprite:                           ; [$8011]
    STX a:CurrentSpriteIndex
    LDA CurrentSprites_Entities,X
    BMI @LAB_PRG14__8043

    ;
    ; The sprite at this index has a valid value, so proceed.
    ;
    ; We'll start by making sure that the elixir isn't set (again).
    ;
    LDA a:Sprites_UpdatesPaused
    BNE @_updateSpriteState

    ;
    ; The elixir is not active. Check if the sprite was hit.
    ;
    LDA CurrentSprites_HitCounter,X
    BNE @_handleHit
    LDA CurrentSprites_HitByMagicBehavior,X
    BMI @LAB_PRG14__802e
    JSR Sprites_Maybe_UpdateHitByMagic
    JMP @_updateSpriteState

  @LAB_PRG14__802e:                         ; [$802e]
    JSR FUN_PRG14__a66b
    JSR Player_HitSpriteWithWeapon
    JSR Sprite_CheckHitByCastMagic
    JSR GetSpriteBox
    JSR WasPlayerHitByMagic
    JSR CurrentSprite_CheckHitPlayer

  @_updateSpriteState:                      ; [$8040]
    JSR CurrentSprite_UpdateState

  @LAB_PRG14__8043:                         ; [$8043]
    LDX a:CurrentSpriteIndex
    DEX
    BPL @_updateSprite
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    RTS

    ;
    ; The sprite has been hit. Reduce the hit counter. It'll
    ; eventually get to 0 if it's not hit again recently.
    ;
  @_handleHit:                              ; [$804e]
    DEC CurrentSprites_HitCounter,X
    LDA CurrentSprites_Entities,X

    ;
    ; Check if this sprite is Tamazutsu, Pakukame, or Zorugeriru.
    ;
    CMP #$2c
    BEQ @_updateSpriteState
    CMP #$30
    BEQ @_updateSpriteState
    CMP #$31
    BEQ @_updateSpriteState

    ;
    ; It's not any of those.
    ;
    LDA #$02
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    JMP @_updateSpriteState


;============================================================================
; TODO: Document Sprites_UpdateAllStates
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_DrawScreenInFrozenState
;============================================================================
Sprites_UpdateAllStates:                    ; [$8070]
    LDA a:CurrentSpriteIndex
    PHA
    LDX #$07

  @LAB_PRG14__8076:                         ; [$8076]
    STX a:CurrentSpriteIndex
    JSR CurrentSprite_UpdateState
    LDX a:CurrentSpriteIndex
    DEX
    BPL @LAB_PRG14__8076
    PLA
    STA a:CurrentSpriteIndex
    RTS

;
; XREFS:
;     CurrentSprite_UpdateState
;
SPRITE_UPDATE_HANDLERS:                     ; [$8087]
    dw SpriteUpdateHandler_Invisible-1      ; [0]:
    dw SpriteUpdateHandler_Bread-1          ; [1]: Dropped bread
    dw SpriteUpdateHandler_Coin-1           ; [2]: Dropped coin
    dw SpriteUpdateHandler_Garbled03-1      ; [3]: TODO: Garbled 3
    dw SpriteUpdateHandler_Enemy_Raiden-1   ; [4]: Enemy: Raiden
    dw SpriteUpdateHandler_Enemy_NecronAides-1 ; [5]: Enemy: Necron Aides
    dw SpriteUpdateHandler_Enemy_Zombie-1   ; [6]: Enemy: Zombie
    dw SpriteUpdateHandler_Enemy_Hornet-1   ; [7]: Enemy: Hornet
    dw SpriteUpdateHandler_Enemy_Bihoruda-1 ; [8]: Enemy: Bihoruda
    dw SpriteUpdateHandler_Enemy_Lilith-1   ; [9]: Enemy: Lilith


;============================================================================
; SpriteUpdateHandler_Enemy_Garbled_10
;============================================================================
    dw SpriteUpdateHandler_TODO_Garbled10-1 ; [10]: TODO: Garbled 10
    dw SpriteUpdateHandler_Enemy_Yuinaru-1  ; [11]: Enemy: Yuinaru
    dw SpriteUpdateHandler_Enemy_Snowman-1  ; [12]: Enemy: Snowman
    dw SpriteUpdateHandler_Enemy_Nash-1     ; [13]: Enemy: Nash
    dw SpriteUpdateHandler_Enemy_FireGiant-1 ; [14]: Enemy: Fire Giant
    dw SpriteUpdateHandler_Enemy_Ishiisu-1  ; [15]: Enemy: Ishiisu
    dw SpriteUpdateHandler_Enemy_ExecutionHood-1 ; [16]: Enemy: Execution
                                                 ; Hood
    dw SpriteUpdateHandler_Boss_Rokusutahn-1 ; [17]: Boss: Rokusutahn
    dw SpriteUpdateHandler_Enemy_Unused18-1 ; [18]: Enemy: Unused #18
    dw SpriteUpdateHandler_Effect_EnemyDeath-1 ; [19]: Effect: Enemy Death
    dw SpriteUpdateHandler_Effect_LightningBall20-1 ; [20]: Effect: Lightning
                                                    ; Ball
    dw SpriteUpdateHandler_Enemy_Charron-1  ; [21]: Enemy: Charron
    dw SpriteUpdateHandler_Invisible-1      ; [22]: Enemy: Unused 22
    dw SpriteUpdateHandler_Enemy_Geributa-1 ; [23]: Enemy: Geributa
    dw SpriteUpdateHandler_Enemy_Sugata-1   ; [24]: Enemy: Sugata
    dw SpriteUpdateHandler_Enemy_Grimlock-1 ; [25]: Enemy: Grimlock
    dw SpriteUpdateHandler_Enemy_GiantBees-1 ; [26]: Enemy: Giant Bees
    dw SpriteUpdateHandler_Enemy_Myconid-1  ; [27]: Enemy: Myconid
    dw SpriteUpdateHandler_Enemy_Naga-1     ; [28]: Enemy: Naga
    dw SpriteUpdateHandler_Enemy_Unused29-1 ; [29]: Enemy: Unused #29
    dw SpriteUpdateHandler_Enemy_GiantStrider-1 ; [30]: Enemy: Giant Strider
    dw SpriteUpdateHandler_Enemy_SirGawaine_Wolfman-1 ; [31]: Enemy: Sir
                                                      ; Gawaine
    dw SpriteUpdateHandler_Enemy_Maskman-1  ; [32]: Enemy: Maskman
    dw thunk_SpriteUpdateHandler_Enemy_SirGawaine_Wolfman-1 ; [33]: Enemy:
                                                            ; Wolfman
    dw SpriteUpdateHandler_Enemy_Yareeka-1  ; [34]: Enemy: Yareeka
    dw SpriteUpdateHandler_Enemy_Magman-1   ; [35]: Enemy: Magman
    dw SpriteUpdateHandler_Enemy_Unused36-1 ; [36]: Enemy: Unused #36
    dw SpriteUpdateHandler_Invisible-1      ; [37]: Enemy: Unused #37
    dw SpriteUpdateHandler_Enemy_Ikeda-1    ; [38]: Enemy: Ikeda
    dw SpriteUpdateHandler_Enemy_Unused39-1 ; [39]: Enemy: Unused #39
    dw SpriteUpdateHandler_Enemy_Lamprey-1  ; [40]: Enemy: Lamprey
    dw SpriteUpdateHandler_Invisible-1      ; [41]: Enemy: Unused #41
    dw SpriteUpdateHandler_Enemy_Monodron-1 ; [42]: Enemy: Monodron
    dw SpriteUpdateHandler_Enemy_Unused43-1 ; [43]: Unused #43
    dw SpriteUpdateHandler_Enemy_Tamazutsu-1 ; [44]: Enemy: Tamazutsu
    dw SpriteUpdateHandler_Boss_Ripasheiku-1 ; [45]: Boss: Ripasheiku
    dw SpriteUpdateHandler_Boss_Zoradohna-1 ; [46]: Boss: Zoradohna
    dw SpriteUpdateHandler_Boss_Borabohra-1 ; [47]: Boss: Borabohra
    dw SpriteUpdateHandler_Boss_Pakukame-1  ; [48]: Boss: Pakukame
    dw SpriteUpdateHandler_Boss_Zorugeriru-1 ; [49]: Boss: Zorugeriru
    dw SpriteUpdateHandler_Boss_KingGrieve-1 ; [50]: Boss: King Grieve
    dw SpriteUpdateHandler_Boss_ShadowEura-1 ; [51]: Boss: Shadow Eura
    dw SpriteUpdateHandler_NPC_Walking-1    ; [52]: NPC: Walking man 1
    dw thunk1_SpriteUpdateHandler_NPC_Walking-1 ; [53]: NPC: Unused Blue Lady
    dw thunk2_SpriteUpdateHandler_NPC_Walking-1 ; [54]: NPC: Unused Child
    dw SpriteUpdateHandler_NPC_ArmorSalesman-1 ; [55]: NPC: Armor Salesman
    dw SpriteUpdateHandler_NPC_MartialArts-1 ; [56]: NPC: Martial Arts
    dw SpriteUpdateHandler_NPC_Priest-1     ; [57]: NPC: Priest
    dw SpriteUpdateHandler_NPC_King-1       ; [58]: NPC: King
    dw SpriteUpdateHandler_NPC_MagicTeacher-1 ; [59]: NPC: Magic Teacher
    dw SpriteUpdateHandler_NPC_KeySalesman_Others-1 ; [60]: NPC: Key Salesman
    dw SpriteUpdateHandler_NPC_KeySalesman_Others-1 ; [61]: NPC: Smoking Man
    dw SpriteUpdateHandler_NPC_KeySalesman_Others-1 ; [62]: NPC: Man in Chair
    dw SpriteUpdateHandler_NPC_KeySalesman_Others-1 ; [63]: NPC: Sitting Man
                                                    ; 1
    dw SpriteUpdateHandler_NPC_MeatSalesman_Others-1 ; [64]: NPC: Meat
                                                     ; Salesman
    dw SpriteUpdateHandler_NPC_MeatSalesman_Others-1 ; [65]: NPC: Lady in
                                                     ; blue dress with cup
    dw SpriteUpdateHandler_NPC_MeatSalesman_Others-1 ; [66]: NPC: King's
                                                     ; Guard
    dw SpriteUpdateHandler_NPC_Doctor-1     ; [67]: NPC: Doctor
    dw SpriteUpdateHandler_NPC_MeatSalesman_Others-1 ; [68]: NPC: Walking
                                                     ; Woman 1
    dw SpriteUpdateHandler_NPC_MeatSalesman_Others-1 ; [69]: NPC: Walking
                                                     ; Woman 2
    dw SpriteUpdateHandler_Enemy_UnusedEyeball_Zozura-1 ; [70]: Enemy: Unused
                                                        ; eyeball
    dw SpriteUpdateHandler_Enemy_UnusedEyeball_Zozura-1 ; [71]: Enemy: Zozura
    dw SpriteUpdateHandler_Item_Standard-1  ; [72]: Item: Glove
    dw SpriteUpdateHandler_Item_Special-1   ; [73]: Item: Black Onyx
    dw SpriteUpdateHandler_Item_Special-1   ; [74]: Item: Pendant
    dw SpriteUpdateHandler_Item_Standard-1  ; [75]: Item: Red Potion
    dw SpriteUpdateHandler_Item_Standard-1  ; [76]: Item: Poison
    dw SpriteUpdateHandler_Item_Standard-1  ; [77]: Item: Elixir
    dw SpriteUpdateHandler_Item_Standard-1  ; [78]: Item: Ointment
    dw SpriteUpdateHandler_Invisible-1      ; [79]: Item: Intro trigger start
                                            ; point
    dw SpriteUpdateHandler_Item_Standard-1  ; [80]: Item: Mattock
    dw SpriteUpdateHandler_TODO_Garbled_81-1 ; [81]: TODO: Garbled #81
    dw SpriteUpdateHandler_Deco_Fountain-1  ; [82]: Deco: Fountain
    dw SpriteUpdateHandler_TODO_Unknown_83-1 ; [83]: TODO: Unknown #83
    dw SpriteUpdateHandler_TODO_Unknown84-1 ; [84]: TODO: Unknown #84
    dw SpriteUpdateHandler_Item_Standard-1  ; [85]: Item: Wing Boots
    dw SpriteUpdateHandler_Item_Standard-1  ; [86]: Item: Hour Glass
    dw SpriteUpdateHandler_Item_Special-1   ; [87]: Item: Magical Rod
    dw SpriteUpdateHandler_Item_Special-1   ; [88]: Item: Battle Suit
    dw SpriteUpdateHandler_Item_Special-1   ; [89]: Item: Battle Helmet
    dw SpriteUpdateHandler_Item_Special-1   ; [90]: Item: Dragon Slayer
    dw SpriteUpdateHandler_Item_Standard-1  ; [91]: Item: Mattock #2
    dw SpriteUpdateHandler_Item_Standard-1  ; [92]: Item: Wing Boots (for
                                            ; quest)
    dw SpriteUpdateHandler_Item_Standard-1  ; [93]: Item: Red Potion #2
    dw SpriteUpdateHandler_Item_Standard-1  ; [94]: Item: Poison #2
    dw SpriteUpdateHandler_Item_Standard-1  ; [95]: Item: Glove #2
    dw SpriteUpdateHandler_Item_Standard-1  ; [96]: Item: Ointment #2
    dw SpriteUpdateHandler__a5d2-1          ; [97]:
    dw SpriteUpdateHandler__a5d2-1          ; [98]:
    dw SpriteUpdateHandler__a5d2-1          ; [99]:
    dw SpriteUpdateHandler_Effect_BossDeath-1 ; [100]: Effect: Boss Death


;============================================================================
; TODO: Document Sprites_Maybe_UpdateHitByMagic
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
Sprites_Maybe_UpdateHitByMagic:             ; [$8151]
    LDY CurrentSprites_HitByMagicBehavior,X
    BEQ @LAB_PRG14__8162
    DEY
    BEQ @LAB_PRG14__817a
    DEY
    BEQ @LAB_PRG14__8192
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,X
    RTS

  @LAB_PRG14__8162:                         ; [$8162]
    LDA #$03
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    DEC CurrentSprites_HitByMagicIFrames,X
    BNE @LAB_PRG14__8179
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,X

  @LAB_PRG14__8179:                         ; [$8179]
    RTS

  @LAB_PRG14__817a:                         ; [$817a]
    LDA #$02
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    DEC CurrentSprites_HitByMagicIFrames,X
    BNE @_return1
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,X

  @_return1:                                ; [$8191]
    RTS

  @LAB_PRG14__8192:                         ; [$8192]
    LDA #$04
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    BCC @_return2
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,X

  @_return2:                                ; [$81a6]
    RTS


;============================================================================
; TODO: Document Player_HitEnemyWithMagic
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_CheckHitByCastMagic
;============================================================================
Player_HitEnemyWithMagic:                   ; [$81a7]
    LDA CurrentSprites_Entities,X
    CMP #$05
    BNE @LAB_PRG14__81b6
    LDA CurrentSprites_Phases,X
    ORA #$80
    STA CurrentSprites_Phases,X

  @LAB_PRG14__81b6:                         ; [$81b6]
    LDA #$02
    JSR #$d0e4
    LDA #$b7a0,Y
    STA Temp_00
    LDA a:SpecialItems
    AND #$04
    BEQ @LAB_PRG14__81cf
    LDA Temp_00
    LSR A
    CLC
    ADC Temp_00
    STA Temp_00

  @LAB_PRG14__81cf:                         ; [$81cf]
    LDA #$00
    STA Temp_Addr
    STY Temp_01
    CPY #$00
    BEQ @LAB_PRG14__81fd
    LDY CurrentSprites_Entities,X
    LDA #$b73b,Y

  @LAB_PRG14__81df:                         ; [$81df]
    ASL A
    ROL Temp_Addr
    ASL A
    ROL Temp_Addr
    DEC Temp_01
    BNE @LAB_PRG14__81df
    LDA Temp_Addr
    AND #$03
    TAY
    BEQ @LAB_PRG14__81fd
    LSR Temp_00
    DEY
    BEQ @LAB_PRG14__81fd
    LSR Temp_00
    BEQ @LAB_PRG14__81fd
    LDA #$00
    STA Temp_00

  @LAB_PRG14__81fd:                         ; [$81fd]
    LDA CurrentSprites_HP,X
    SEC
    SBC Temp_00
    STA CurrentSprites_HP,X
    BCS RETURN_822D
    LDA CurrentSprites_Entities,X
    CMP #$18
    BNE @LAB_PRG14__8215

    ;
    ; If the enemy is Sugata, clear the greyscale set when it
    ; attacked so we don't get stuck in greyscale forever.
    ;
    LDA ScreenColorMode                     ; Load the screen color mode.
    AND #$fe                                ; Clear the greyscale bit.
    STA ScreenColorMode                     ; Store it.

    ;
    ; Add experience from the sprite.
    ;
  @LAB_PRG14__8215:                         ; [$8215]
    JSR Player_AddExperienceFromSprite

    ;
    ; Play the killed enemy sound effect.
    ;
    LDA #$03
    JSR #$d0e4

    ;
    ; Check if this is a normal and big enemy. They need to be
    ; handled differently.
    ;
    LDY CurrentSprites_Entities,X
    LDA #$b544,Y
    CMP #$07
    BNE @_isSmallEnemy

    ;
    ; This is a big enemy. Handle cleanup specially.
    ;
    JMP Sprite_ShowBigEnemyDeathByMagicOrWeapon

  @_isSmallEnemy:                           ; [$822a]
    JMP Sprite_ShowNormalEnemyDeathByMagic

    ;
    ; XREFS:
    ;     Player_HitEnemyWithMagic
    ;     SpriteUpdateHandler_Effect_EnemyDeath
    ;     SpriteUpdateHandler_Effect_LightningBall20
    ;
RETURN_822D:                                ; [$822d]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Effect_EnemyDeath
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80ad]
;     SpriteUpdateHandler_Effect_BossDeath
;============================================================================
SpriteUpdateHandler_Effect_EnemyDeath:      ; [$822e]
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    LDA a:SpriteUpdateCounter
    LSR A
    BCS RETURN_822D
    LDA #$00
    STA CurrentSprite_FlipMask
    STA Maybe_CurrentSprite_PPUOffset
    JSR Sprite_EnterNextAppearancePhase
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_TickCounters,X
    ASL A
    ASL A
    EOR #$ff
    STA Temp_00
    INC Temp_00
    LDA CurrentSprites_YPos,X
    CLC
    ADC Temp_00
    STA Maybe_Arg_CurrentSprite_PosY
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    LDA #$01
    JSR Sprite_EnterNextAppearancePhase
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_TickCounters,X
    ASL A
    ASL A
    STA Temp_00
    LDA CurrentSprites_YPos,X
    CLC
    ADC Temp_00
    STA Maybe_Arg_CurrentSprite_PosY
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    LDA #$02
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Effect_BossDeath
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::814f]
;============================================================================
SpriteUpdateHandler_Effect_BossDeath:       ; [$8279]
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    LDA CurrentSprites_Phases,X
    CMP #$02
    BEQ SpriteUpdateHandler_Effect_LightningBall20
    CMP #$07
    BEQ SpriteUpdateHandler_Effect_LightningBall20
    JMP SpriteUpdateHandler_Effect_EnemyDeath


;============================================================================
; TODO: Document SpriteUpdateHandler_Effect_LightningBall20
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80af]
;     SpriteUpdateHandler_Effect_BossDeath
;============================================================================
SpriteUpdateHandler_Effect_LightningBall20: ; [$828b]
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    LDA a:SpriteUpdateCounter
    LSR A
    BCS RETURN_822D
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    JSR Sprite_EnterNextAppearancePhase
    LDY #$03

  @LAB_PRG14__82a2:                         ; [$82a2]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_XPos,X
    STA Maybe_Arg_CurrentSprite_PosX
    LDA CurrentSprites_YPos,X
    STA Maybe_Arg_CurrentSprite_PosY
    LDA CurrentSprites_TickCounters,X
    ASL A
    ASL A
    EOR #$82f0,Y
    STA Temp_00
    BPL @LAB_PRG14__82bb
    INC Temp_00

  @LAB_PRG14__82bb:                         ; [$82bb]
    TYA
    AND #$02
    BNE @LAB_PRG14__82ca
    LDA CurrentSprites_YPos,X
    CLC
    ADC Temp_00
    STA Maybe_Arg_CurrentSprite_PosY
    JMP @LAB_PRG14__82d1

  @LAB_PRG14__82ca:                         ; [$82ca]
    LDA CurrentSprites_XPos,X
    CLC
    ADC Temp_00
    STA Maybe_Arg_CurrentSprite_PosX

  @LAB_PRG14__82d1:                         ; [$82d1]
    LDA #$82f4,Y
    STA CurrentSprite_FlipMask
    LDA #$82ec,Y
    STA Temp_00
    TYA
    PHA
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    LDA Temp_00
    JSR Sprite_EnterNextAppearancePhase
    PLA
    TAY
    DEY
    BPL @LAB_PRG14__82a2
    RTS
    db $01,$02,$03                          ; [$82ec] undefined

;
; XREFS:
;     SpriteUpdateHandler_Effect_LightningBall20
;
DAT_PRG14__82ef:                            ; [$82ef]
    db $03                                  ; [$82ef] undefined1

    db $ff,$00                              ; [$82f1] undefined

;
; XREFS:
;     SpriteUpdateHandler_Effect_LightningBall20
;
DAT_PRG14__82f2:                            ; [$82f2]
    db $ff                                  ; [$82f2] undefined1

;
; XREFS:
;     SpriteUpdateHandler_Effect_LightningBall20
;
DAT_PRG14__82f3:                            ; [$82f3]
    db $00                                  ; [$82f3] undefined1

    db $00,$00,$00                          ; [$82f5] undefined

;
; XREFS:
;     SpriteUpdateHandler_Effect_LightningBall20
;
DAT_PRG14__82f7:                            ; [$82f7]
    db $40                                  ; [$82f7] undefined1


;============================================================================
; TODO: Document FUN_PRG14__82f8
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__96b8
;     FUN_PRG14__a7f8
;     SpriteBehavior__9497
;============================================================================
FUN_PRG14__82f8:                            ; [$82f8]
    LDA CurrentSprites_XPos,X
    SEC
    SBC PlayerPosX_Full
    BCS @LAB_PRG14__8312
    EOR #$ff
    CLC
    ADC #$01
    CLC
    LDY CurrentSprites_HitBoxTypes,X
    SEC
    SBC #$b4d1,Y
    BCS @_returnTrue
    LDA #$00

  @_returnTrue:                             ; [$8310]
    CLC
    RTS

  @LAB_PRG14__8312:                         ; [$8312]
    SEC
    SBC #$10
    BCS @_return
    LDA #$00
    SEC

  @_return:                                 ; [$831a]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__831b
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__9699
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9632
;     Sprite_Something__a82a
;============================================================================
FUN_PRG14__831b:                            ; [$831b]
    LDA CurrentSprites_YPos,X
    SEC
    SBC PlayerPosY
    BCS @_return
    EOR #$ff
    CLC
    ADC #$01
    CLC

  @_return:                                 ; [$8328]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__8329
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a154
;============================================================================
FUN_PRG14__8329:                            ; [$8329]
    JSR Sprite_MoveTowardsPlayerX
    JSR Sprite_MoveTowardsPlayerY
    JSR FUN_PRG14__82f8
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    JSR FUN_PRG14__831b
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    CMP CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    BCS @LAB_PRG14__836c
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    STA a:Arg_PlayerHealthDelta_U
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:BYTE_04be
    LDA #$00
    STA a:Arg_PlayerHealthDelta_L
    STA a:BYTE_04bf
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    JSR #$c0ec
    LDA a:Arg_PlayerHealthDelta_U
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    LDA a:Arg_PlayerHealthDelta_L
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    LDA #$01
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    RTS

  @LAB_PRG14__836c:                         ; [$836c]
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:Arg_PlayerHealthDelta_U
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    STA a:BYTE_04be
    LDA #$00
    STA a:Arg_PlayerHealthDelta_L
    STA a:BYTE_04bf
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    JSR #$c0ec
    LDA a:Arg_PlayerHealthDelta_U
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    LDA a:Arg_PlayerHealthDelta_L
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    LDA #$01
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    RTS


;============================================================================
; TODO: Document FUN_PRG14__8398
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__8398
;============================================================================
FUN_PRG14__8398:                            ; [$8398]
    ASL CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    ROL CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    ASL CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    ROL CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    DEY
    BNE FUN_PRG14__8398
    RTS


;============================================================================
; TODO: Document FUN_PRG14__83a8
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__83a8:                            ; [$83a8]
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:Arg_DeltaX_Frac
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    STA a:Arg_DeltaX_Full
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    STA a:Arg_DeltaY_Frac
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    STA a:Arg_DeltaY_Full
    RTS


;============================================================================
; TODO: Document FUN_PRG14__83c1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9593
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__9c89
;============================================================================
FUN_PRG14__83c1:                            ; [$83c1]
    STA a:Arg_DeltaX_Frac
    LDA #$00

  @LAB_PRG14__83c6:                         ; [$83c6]
    ASL a:Arg_DeltaX_Frac
    ROL A
    DEY
    BNE @LAB_PRG14__83c6
    STA a:Arg_DeltaX_Full
    RTS


;============================================================================
; TODO: Document CalcVerticalSpriteMovement
;
; INPUTS:
;     A
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CastMagic_HandleTilte
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8fe7
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9b83
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__aa86
;============================================================================
CalcVerticalSpriteMovement:                 ; [$83d1]
    STA a:Arg_DeltaY_Frac
    LDA #$00

  @LAB_PRG14__83d6:                         ; [$83d6]
    ASL a:Arg_DeltaY_Frac
    ROL A
    DEY
    BNE @LAB_PRG14__83d6
    STA a:Arg_DeltaY_Full
    RTS


;============================================================================
; TODO: Document Sprites_CalcYFromGravity
;
; INPUTS:
;     A
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CastMagic_HandleTilte
;     FUN_PRG14__9593
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__aa86
;============================================================================
Sprites_CalcYFromGravity:                   ; [$83e1]
    PHA
    AND #$83f7,Y
    STA Temp_00
    PLA
    AND #$83ff,Y
    BEQ @LAB_PRG14__83f4
    LDA #$83f7,Y
    SEC
    SBC Temp_00
    RTS

  @LAB_PRG14__83f4:                         ; [$83f4]
    LDA Temp_00
    RTS

;
; XREFS:
;     SpriteBehavior_Hopper
;     SpriteBehavior__aa86
;     Sprites_CalcYFromGravity
;
SPRITE_BEHAVIORS_HOPPER_CYCLE_TRANSITIONS:  ; [$83f7]
    db $ff                                  ; [0]:
    db $7f                                  ; [1]:
    db $3f                                  ; [2]:
    db $1f                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $03                                  ; [6]:
    db $01                                  ; [7]:

;
; XREFS:
;     Sprites_CalcYFromGravity
;
SPRITES_MAYBE_GRAVITY:                      ; [$83ff]
    db $00                                  ; [0]:
    db $80                                  ; [1]:
    db $40                                  ; [2]:
    db $20                                  ; [3]:
    db $10                                  ; [4]:
    db $08                                  ; [5]:
    db $04                                  ; [6]:
    db $02                                  ; [7]:


;============================================================================
; TODO: Document Sprite_ToggleMoveRight
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a796]
;     SpriteBehavior_Walking
;============================================================================
Sprite_ToggleMoveRight:                     ; [$8407]
    LDA CurrentSprites_Flags,X
    EOR #$01
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document Sprite_ChangeYDirection
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a79a]
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior__8f2e
;     SpriteBehavior__91b3
;     SpriteBehavior__9632
;     SpriteBehavior__aa86
;============================================================================
Sprite_ChangeYDirection:                    ; [$8410]
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document Sprite_MoveAndTurnAroundIfNeeded
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9593
;     FUN_PRG14__96b8
;     FUN_PRG14__9735
;     FUN_PRG14__9c43
;     SpriteBehavior_Walking
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__9129
;     SpriteBehavior__91b3
;     SpriteBehavior__9538
;     SpriteBehavior__9632
;     SpriteBehavior__aa86
;============================================================================
Sprite_MoveAndTurnAroundIfNeeded:           ; [$8419]
    JSR Sprites_Something_SomethingAndMoveHoriz
    BCC @_return
    LDA CurrentSprites_Flags,X
    EOR #$01
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$8426]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__8427
;
; INPUTS:
;     X
;
; OUTPUTS:
;     C
;
; XREFS:
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__92e0
;     SpriteBehavior__a0cb
;     SpriteBehavior__a997
;============================================================================
FUN_PRG14__8427:                            ; [$8427]
    JSR FUN_PRG14__849a
    LDA CurrentSprites_XPos,X
    CMP #$f0
    BCC @_returnFalse
    LDA CurrentSprites_Flags,X
    LSR A
    LDA CurrentSprites_XPos,X
    AND #$f0
    BCS @LAB_PRG14__843d
    CLC
    ADC #$10

  @LAB_PRG14__843d:                         ; [$843d]
    STA CurrentSprites_XPos,X
    LDA CurrentSprites_Flags,X
    EOR #$01
    STA CurrentSprites_Flags,X
    SEC
    RTS

  @_returnFalse:                            ; [$8449]
    CLC
    RTS


;============================================================================
; TODO: Document FUN_PRG14__844b
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__844b:                            ; [$844b]
    JSR FUN_PRG14__846c
    LDA CurrentSprites_XPos,X
    CMP #$f0
    BCC RETURN_846B
    LDA CurrentSprites_Flags,X
    LSR A
    LDA CurrentSprites_XPos,X
    AND #$f0
    BCS @LAB_PRG14__8461
    CLC
    ADC #$10

  @LAB_PRG14__8461:                         ; [$8461]
    STA CurrentSprites_XPos,X
    LDA CurrentSprites_Flags,X
    EOR #$01
    STA CurrentSprites_Flags,X

    ;
    ; XREFS:
    ;     FUN_PRG14__844b
    ;     FUN_PRG14__846c
    ;
RETURN_846B:                                ; [$846b]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__846c
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__844b
;============================================================================
FUN_PRG14__846c:                            ; [$846c]
    LDA CurrentSprites_XPos,X
    CMP PlayerPosX_Full
    BEQ RETURN_846B
    BCC @LAB_PRG14__847e
    LDA CurrentSprites_Flags,X
    AND #$01
    BNE @LAB_PRG14__8488
    JMP FUN_PRG14__84a0

  @LAB_PRG14__847e:                         ; [$847e]
    LDA CurrentSprites_Flags,X
    AND #$01
    BEQ @LAB_PRG14__8488
    JMP FUN_PRG14__84b2

  @LAB_PRG14__8488:                         ; [$8488]
    CLC
    RTS


;============================================================================
; TODO: Document FUN_PRG14__848a
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__848a:                            ; [$848a]
    LDA #$00
    STA a:Arg_DeltaX_Frac
    LDA #$01
    STA a:Arg_DeltaX_Full


;============================================================================
; TODO: Document Sprites_Something_SomethingAndMoveHoriz
;
; INPUTS:
;     X
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG14__a91e
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior__8f2e
;     SpriteBehavior__9497
;     SpriteBehavior__97ae
;     SpriteBehavior__9c89
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     SpriteBehavior__a154
;     Sprite_MoveAndTurnAroundIfNeeded
;     Sprites_Maybe_UpdateHitByMagic
;============================================================================
Sprites_Something_SomethingAndMoveHoriz:    ; [$8494]
    JSR FUN_PRG14__849a
    JMP MoveSpriteHorizIfPossible


;============================================================================
; TODO: Document FUN_PRG14__849a
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__8427
;     Sprites_Something_SomethingAndMoveHoriz
;============================================================================
FUN_PRG14__849a:                            ; [$849a]
    LDA CurrentSprites_Flags,X
    LSR A
    BCS FUN_PRG14__84b2


;============================================================================
; TODO: Document FUN_PRG14__84a0
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__846c
;============================================================================
FUN_PRG14__84a0:                            ; [$84a0]
    LDA CurrentSprites_SomethingX,X
    SEC
    SBC a:Arg_DeltaX_Frac
    STA CurrentSprites_SomethingX,X
    LDA CurrentSprites_XPos,X
    SBC a:Arg_DeltaX_Full
    STA CurrentSprites_XPos,X
    RTS


;============================================================================
; TODO: Document FUN_PRG14__84b2
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__846c
;     FUN_PRG14__849a
;============================================================================
FUN_PRG14__84b2:                            ; [$84b2]
    LDA CurrentSprites_SomethingX,X
    CLC
    ADC a:Arg_DeltaX_Frac
    STA CurrentSprites_SomethingX,X
    LDA CurrentSprites_XPos,X
    ADC a:Arg_DeltaX_Full
    STA CurrentSprites_XPos,X
    RTS


;============================================================================
; Move the sprite horizontally if possible.
;
; If the sprite cannot move, then this will do nothing.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
; OUTPUTS:
;     C:
;         1 if the sprite could move.
;         0 if the sprite could not move.
;
; XREFS:
;     Sprites_Something_SomethingAndMoveHoriz
;============================================================================
MoveSpriteHorizIfPossible:                  ; [$84c4]
    TYA
    PHA
    LDA CurrentSprites_Flags,X              ; Load the sprite flags.
    AND #$01
    TAX
    JSR CurrentSprite_CanMoveInDirection    ; Check if this sprite can move
                                            ; at all
    LDA Blocks_Result                       ; Load the current block
                                            ; properties
    BEQ @_cannotMove                        ; If 0, it cannot move
    LDX a:CurrentSpriteIndex                ; Load the current sprite
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA CurrentSprites_XPos,X               ; Load the X coordinate of the
                                            ; sprite
    AND #$f0                                ; Grab the X pos (top nibble)
    CPY #$01
    BCS @_updateHorizPos
    CLC
    ADC #$10                                ; Add 1 to the block X position

  @_updateHorizPos:                         ; [$84e7]
    STA CurrentSprites_XPos,X               ; Store the block position for
                                            ; the sprite.
    PLA
    TAY
    SEC                                     ; Set carry to indicate it moved
    RTS

  @_cannotMove:                             ; [$84ed]
    PLA                                     ; Restore the registers
    TAY
    LDX a:CurrentSpriteIndex
    CLC                                     ; Clear carry to indicate it
                                            ; can't move
    RTS


;============================================================================
; TODO: Document FUN_PRG14__84f4
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__84f4:                            ; [$84f4]
    JSR Sprites_CanSpriteWalk
    TAX
    BNE SpriteBehavior_RestoreXRegister
    LDX a:CurrentSpriteIndex
    JSR Sprite_CanClimb
    TAX
    BEQ FUN_PRG14__850d
    LDX a:CurrentSpriteIndex
    RTS


;============================================================================
; TODO: Document FUN_PRG14__8507
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9129
;============================================================================
FUN_PRG14__8507:                            ; [$8507]
    JSR Sprites_CanSpriteWalk
    TAX
    BNE SpriteBehavior_RestoreXRegister

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__850d
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__84f4
;============================================================================
FUN_PRG14__850d:                            ; [$850d]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    LSR A
    PHP
    LDA CurrentSprites_XPos,X
    AND #$f0
    PLP
    BCS @LAB_PRG14__851e
    ADC #$10

  @LAB_PRG14__851e:                         ; [$851e]
    STA CurrentSprites_XPos,X
    LDA InterruptCounter
    AND #$3f
    BNE SpriteBehavior_RestoreXRegister
    LDA CurrentSprites_Flags,X
    EOR #$01
    STA CurrentSprites_Flags,X


;============================================================================
; TODO: Document SpriteBehavior_RestoreXRegister
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__84f4
;     FUN_PRG14__8507
;     FUN_PRG14__850d
;============================================================================
SpriteBehavior_RestoreXRegister:            ; [$852e]
    LDX a:CurrentSpriteIndex
    RTS

;
; XREFS:
;     FUN_PRG14__854c
;
SPRITE_WALK_PIXEL_MOVEMENT_TABLE:           ; [$8532]
    db $00                                  ; [0]: 0 pixel movement
    db $0f                                  ; [1]: 15 pixel movement


;============================================================================
; TODO: Document Sprite_CanClimb
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__84f4
;============================================================================
Sprite_CanClimb:                            ; [$8534]
    LDY CurrentSprites_HitBoxTypes,X
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$b4d8,Y
    CLC
    ADC #$10
    JMP FUN_PRG14__854c


;============================================================================
; TODO: Document Sprites_CanSpriteWalk
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG14__84f4
;     FUN_PRG14__8507
;     Sprites_SetCurrentSpriteCanWalk
;============================================================================
Sprites_CanSpriteWalk:                      ; [$8543]
    LDY CurrentSprites_HitBoxTypes,X
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$b4d8,Y

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__854c
;
; INPUTS:
;     A
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_CanClimb
;============================================================================
FUN_PRG14__854c:                            ; [$854c]
    STA Arg_PixelPosY
    INC Arg_PixelPosY
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$8532,Y
    STA Arg_PixelPosX
    JSR #$e86c
    JMP #$e887


;============================================================================
; TODO: Document MoveSpriteVertBorder
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__aafa
;============================================================================
MoveSpriteVertBorder:                       ; [$8564]
    JSR CalculateNewVertPos
    JSR MoveSpriteVerticalIfPossible
    BCC @_return
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$8574]
    RTS


;============================================================================
; TODO: Document MoveSpriteVerticalIfPossible
;
; INPUTS:
;     X
;
; OUTPUTS:
;     C
;
; XREFS:
;     MoveSpriteVertBorder
;     Sprite_MoveVertical
;============================================================================
MoveSpriteVerticalIfPossible:               ; [$8575]
    LDA CurrentSprites_Flags,X
    ROL A
    ROL A
    AND #$01
    ORA #$02
    TAX
    JSR CurrentSprite_CanMoveInDirection
    LDX a:CurrentSpriteIndex
    LDA Blocks_Result
    BEQ @_returnFalse
    LDA CurrentSprites_Flags,X
    ASL A
    LDA CurrentSprites_YPos,X
    AND #$f0
    BCS @_returnTrue
    CLC
    ADC #$10

  @_returnTrue:                             ; [$8596]
    STA CurrentSprites_YPos,X
    SEC
    RTS

  @_returnFalse:                            ; [$859a]
    CLC
    RTS


;============================================================================
; TODO: Document FUN_PRG14__859c
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__8f9a
;     SpriteBehavior__8fe7
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__a997
;============================================================================
FUN_PRG14__859c:                            ; [$859c]
    JSR CalculateNewVertPos
    JSR Sprites_HasSpriteHitRightScreen
    BCC @_return
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$85ac]
    RTS


;============================================================================
; TODO: Document Sprites_HasSpriteHitRightScreen
;
; INPUTS:
;     X
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG14__859c
;============================================================================
Sprites_HasSpriteHitRightScreen:            ; [$85ad]
    LDA CurrentSprites_YPos,X
    CMP #$e0
    BCC @_return
    LDA CurrentSprites_Flags,X
    ASL A
    LDA CurrentSprites_YPos,X
    AND #$f0
    BCS @LAB_PRG14__85c0
    CLC
    ADC #$10

  @LAB_PRG14__85c0:                         ; [$85c0]
    STA CurrentSprites_YPos,X
    SEC

  @_return:                                 ; [$85c3]
    RTS


;============================================================================
; TODO: Document Sprite_MoveVertical
;
; INPUTS:
;     X
;
; OUTPUTS:
;     C
;
; XREFS:
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior__93e5
;     SpriteBehavior__9632
;     SpriteBehavior__97ae
;     SpriteBehavior__9b83
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9f03__MoveDown
;     SpriteBehavior__a154
;     SpriteBehavior__aa86
;============================================================================
Sprite_MoveVertical:                        ; [$85c4]
    JSR CalculateNewVertPos
    JMP MoveSpriteVerticalIfPossible


;============================================================================
; TODO: Document CalculateNewVertPos
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__859c
;     MoveSpriteVertBorder
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior__8f2e
;     Sprite_MoveVertical
;============================================================================
CalculateNewVertPos:                        ; [$85ca]
    LDA CurrentSprites_Flags,X
    BMI @LAB_PRG14__85e1
    LDA CurrentSprites_SomethingY,X
    SEC
    SBC a:Arg_DeltaY_Frac
    STA CurrentSprites_SomethingY,X
    LDA CurrentSprites_YPos,X
    SBC a:Arg_DeltaY_Full
    STA CurrentSprites_YPos,X
    RTS

  @LAB_PRG14__85e1:                         ; [$85e1]
    LDA CurrentSprites_SomethingY,X
    CLC
    ADC a:Arg_DeltaY_Frac
    STA CurrentSprites_SomethingY,X
    LDA CurrentSprites_YPos,X
    ADC a:Arg_DeltaY_Full
    STA CurrentSprites_YPos,X
    RTS
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$861d,Y
    STA Arg_PixelPosX
    LDY CurrentSprites_HitBoxTypes,X
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$b4d8,Y
    STA Arg_PixelPosY
    INC Arg_PixelPosY
    JSR #$e86c
    JSR #$e87c
    STA Blocks_Result
    LDX a:CurrentSpriteIndex
    RTS

BYTE_ARRAY_PRG14__861d:                     ; [$861d]
    db $00                                  ; [0]:
    db $0f                                  ; [1]:


;============================================================================
; TODO: Document Sprites_SetCurrentSpriteCanWalk
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG14__a259
;     FUN_PRG14__a91e
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_StandingStill
;     SpriteBehavior_Walking
;     SpriteBehavior__9497
;     SpriteBehavior__971d
;============================================================================
Sprites_SetCurrentSpriteCanWalk:            ; [$861f]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    AND #$02
    BNE @LAB_PRG14__863d
    JSR Sprites_CanSpriteWalk
    STA Blocks_Result
    BNE @LAB_PRG14__863d
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    ORA #$04
    STA CurrentSprites_Flags,X
    SEC
    RTS

  @LAB_PRG14__863d:                         ; [$863d]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    AND #$fb
    STA CurrentSprites_Flags,X
    CLC
    RTS


;============================================================================
; TODO: Document FUN_PRG14__864a
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a259
;     FUN_PRG14__a91e
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_StandingStill
;     SpriteBehavior_Walking
;     SpriteBehavior__9497
;     SpriteBehavior__971d
;============================================================================
FUN_PRG14__864a:                            ; [$864a]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    AND #$04
    BEQ @LAB_PRG14__8671
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$08
    STA CurrentSprites_YPos,X
    CMP #$c0
    BCS @LAB_PRG14__8675
    LDX #$03
    JSR CurrentSprite_CanMoveInDirection
    LDA Blocks_Result
    BEQ @LAB_PRG14__8671
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_YPos,X
    AND #$f0
    STA CurrentSprites_YPos,X

  @LAB_PRG14__8671:                         ; [$8671]
    LDX a:CurrentSpriteIndex
    RTS

  @LAB_PRG14__8675:                         ; [$8675]
    LDA #$ff
    STA CurrentSprites_Entities,X
    RTS


;============================================================================
; TODO: Document Sprite_MoveTowardsPlayerX
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__8329
;     FUN_PRG14__9735
;     FUN_PRG14__9b45
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a794]
;     SpriteBehavior__8f2e
;     SpriteBehavior__8f9a
;     SpriteBehavior__9060
;     SpriteBehavior__9129
;     SpriteBehavior__91b3
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;     SpriteBehavior__9497
;     SpriteBehavior__95c0
;     SpriteBehavior__97ae
;     SpriteBehavior__9865
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;============================================================================
Sprite_MoveTowardsPlayerX:                  ; [$867b]
    LDA PlayerPosX_Full
    CMP CurrentSprites_XPos,X
    BEQ @_return
    ROL A
    AND #$01
    STA Temp_00
    LDA CurrentSprites_Flags,X
    AND #$fe
    ORA Temp_00
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$8690]
    RTS


;============================================================================
; TODO: Document Sprite_MoveTowardsPlayerY
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__8329
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a798]
;     SpriteBehavior__8f2e
;     SpriteBehavior__8f9a
;     SpriteBehavior__92e0
;     SpriteBehavior__93e5
;============================================================================
Sprite_MoveTowardsPlayerY:                  ; [$8691]
    LDA PlayerPosY
    CMP CurrentSprites_YPos,X
    BEQ @_return
    ROR A
    AND #$80
    STA Temp_00
    LDA CurrentSprites_Flags,X
    AND #$7f
    ORA Temp_00
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$86a6]
    RTS


;============================================================================
; TODO: Document MoveRight
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;============================================================================
MoveRight:                                  ; [$86a7]
    LDX CurrentSprites_HitBoxTypes,Y
    LDA CurrentSprites_XPos,Y
    CLC
    ADC #$b4d1,X
    STA Arg_PixelPosX
    BCC FUN_PRG14__86c6

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Sprites_SetBlockIsMovingResult
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__86bd
;============================================================================
Sprites_SetBlockIsMovingResult:             ; [$86b5]
    ;
    ; Set the block as moving.
    ;
    LDA #$01
    STA Blocks_Result
    LDX a:CurrentSpriteIndex
    RTS


;============================================================================
; TODO: Document FUN_PRG14__86bd
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;============================================================================
FUN_PRG14__86bd:                            ; [$86bd]
    LDA CurrentSprites_XPos,Y
    CMP #$f1
    BCS Sprites_SetBlockIsMovingResult
    STA Arg_PixelPosX

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__86c6
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     MoveRight
;============================================================================
FUN_PRG14__86c6:                            ; [$86c6]
    LDA CurrentSprites_YPos,Y
    STA Arg_PixelPosY
    JSR #$e86c
    JSR #$e87c
    STA Blocks_Result
    BNE @LAB_PRG14__870c
    LDY a:CurrentSpriteIndex
    LDA CurrentSprites_HitBoxTypes,Y
    TAY
    LDA #$b4d8,Y
    STA Temp_HitBoxValue

  @LAB_PRG14__86e1:                         ; [$86e1]
    LDA Temp_HitBoxValue
    SEC
    SBC #$10
    STA Temp_HitBoxValue
    BCC @LAB_PRG14__86f8
    TXA
    CLC
    ADC #$10
    TAX
    JSR #$e87c
    STA Blocks_Result
    BNE @LAB_PRG14__870c
    BEQ @LAB_PRG14__86e1

  @LAB_PRG14__86f8:                         ; [$86f8]
    LDY a:CurrentSpriteIndex
    LDA CurrentSprites_YPos,Y
    AND #$0f
    BEQ @LAB_PRG14__870c
    TXA
    CLC
    ADC #$10
    TAX
    JSR #$e87c
    STA Blocks_Result

  @LAB_PRG14__870c:                         ; [$870c]
    LDX a:CurrentSpriteIndex
    RTS


;============================================================================
; TODO: Document CurrentSprite_CanMoveInDirection
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__864a
;     MoveSpriteHorizIfPossible
;     MoveSpriteVerticalIfPossible
;============================================================================
CurrentSprite_CanMoveInDirection:           ; [$8710]
    LDY a:CurrentSpriteIndex
    TXA
    BEQ FUN_PRG14__86bd
    DEX
    BEQ MoveRight
    DEX
    BEQ @LAB_PRG14__8731
    LDX CurrentSprites_HitBoxTypes,Y
    LDA CurrentSprites_YPos,Y
    CLC
    ADC #$b4d8,X
    STA Arg_PixelPosY
    CMP #$f0
    BCC @LAB_PRG14__873a

  @LAB_PRG14__872c:                         ; [$872c]
    LDA #$01
    STA Blocks_Result
    RTS

  @LAB_PRG14__8731:                         ; [$8731]
    LDA CurrentSprites_YPos,Y
    CMP #$f0
    BCS @LAB_PRG14__872c
    STA Arg_PixelPosY

  @LAB_PRG14__873a:                         ; [$873a]
    LDA CurrentSprites_XPos,Y
    STA Arg_PixelPosX
    JSR #$e86c
    JSR #$e87c
    STA Blocks_Result
    BNE @LAB_PRG14__8778
    LDY a:CurrentSpriteIndex
    LDA CurrentSprites_HitBoxTypes,Y
    TAY
    LDA #$b4d1,Y
    STA Temp_HitBoxValue

  @LAB_PRG14__8755:                         ; [$8755]
    LDA Temp_HitBoxValue
    SEC
    SBC #$10
    STA Temp_HitBoxValue
    BCC @LAB_PRG14__8768
    INX
    JSR #$e87c
    STA Blocks_Result
    BNE @LAB_PRG14__8778
    BEQ @LAB_PRG14__8755

  @LAB_PRG14__8768:                         ; [$8768]
    LDY a:CurrentSpriteIndex
    LDA CurrentSprites_XPos,Y
    AND #$0f
    BEQ @LAB_PRG14__8778
    INX
    JSR #$e87c
    STA Blocks_Result

  @LAB_PRG14__8778:                         ; [$8778]
    LDX a:CurrentSpriteIndex
    RTS


;============================================================================
; TODO: Document WasPlayerHitByMagic
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
WasPlayerHitByMagic:                        ; [$877c]
    LDA a:SelectedShield
    CMP #$03
    BCS RETURN_87CA
    JSR Maybe_Player_CalcAnimFrame
    SEC
    SBC #$04
    CMP #$03
    BCC RETURN_87CA
    LDX a:CurrentSpriteIndex
    LDY CurrentSprites_Entities,X
    CPY #$ff
    BEQ RETURN_87CA
    LDA #$b544,Y
    CMP #$06
    BNE RETURN_87CA
    LDA a:SpriteBox_Width
    CLC
    ADC #$07
    STA Temp_00
    LDA a:Player_ShieldPositionX
    CLC
    ADC #$07
    SEC
    SBC a:SpriteBox_Left
    CMP Temp_00
    BCS RETURN_87CA
    LDA a:SpriteBox_Height
    CLC
    ADC #$0f
    STA Temp_00
    LDA a:Player_ShieldPositionY
    CLC
    ADC #$0f
    SEC
    SBC a:SpriteBox_Top
    CMP Temp_00
    BCC FUN_PRG14__87cb

    ;
    ; XREFS:
    ;     Player_HitSpriteWithWeapon
    ;     WasPlayerHitByMagic
    ;
RETURN_87CA:                                ; [$87ca]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__87cb
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     WasPlayerHitByMagic
;============================================================================
FUN_PRG14__87cb:                            ; [$87cb]
    JSR HandlePlayerHitByMagic
    LDX a:CurrentSpriteIndex
    LDA #$ff
    STA CurrentSprites_Entities,X
    LDA #$0c
    JSR #$d0e4
    RTS


;============================================================================
; TODO: Document HandlePlayerHitByMagic
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__87cb
;============================================================================
HandlePlayerHitByMagic:                     ; [$87dc]
    LDX a:CurrentSpriteIndex
    LDY CurrentSprites_Entities,X
    LDA #$b6d7,Y
    LDY a:SelectedShield

  @LAB_PRG14__87e8:                         ; [$87e8]
    LSR A
    DEY
    BPL @LAB_PRG14__87e8
    STA a:Arg_PlayerHealthDelta_U
    LDA #$00
    STA a:Arg_PlayerHealthDelta_L
    LDA a:Arg_PlayerHealthDelta_U
    BNE @LAB_PRG14__87fa
    RTS

  @LAB_PRG14__87fa:                         ; [$87fa]
    JSR Player_SetDamagedBySprite
    JMP #$c08e
    DEC CurrentSprites_HitCounter,X
    RTS


;============================================================================
; TODO: Document Player_HitSpriteWithWeapon
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
Player_HitSpriteWithWeapon:                 ; [$8804]
    JSR Sprites_IsSpriteVisible

    ;
    ; Check if the sprite is visible. If so, return.
    ;
    BNE RETURN_87CA
    LDA Player_Flags
    BPL RETURN_87CA
    LDY PlayerHitsPhaseCounter
    DEY
    CPY #$02
    BCS RETURN_87CA

    ;
    ; Check if the player has a weapon. If not, return.
    ;
    LDA a:Player_CurWeapon
    BMI RETURN_87CA
    LDX a:CurrentSpriteIndex
    LDY CurrentSprites_Entities,X

    ;
    ; Check if the sprite being hit is an enemy. If not, return.
    ;
    LDA #$b544,Y
    BEQ @LAB_PRG14__8828
    CMP #$07
    BNE RETURN_87CA

  @LAB_PRG14__8828:                         ; [$8828]
    LDA CurrentSprites_XPos,X
    STA a:Something_Maybe_WeaponDistanceX
    LDA CurrentSprites_YPos,X
    STA a:Something_Maybe_WeaponDistanceY
    JSR Sprites_IsSpriteOutOfWeaponRange
    BCC @LAB_PRG14__883a

    ;
    ; The sprite isn't within range. Return.
    ;
    JMP @_return

  @LAB_PRG14__883a:                         ; [$883a]
    LDA CurrentSprites_Entities,X
    CMP #$05
    BNE @LAB_PRG14__8849

    ;
    ; TODO: Figure out why Necron Aides get bit 7 set.
    ;
    LDA CurrentSprites_Phases,X
    ORA #$80
    STA CurrentSprites_Phases,X

  @LAB_PRG14__8849:                         ; [$8849]
    LDA #$02

    ;
    ; Play the Hit Enemy sound.
    ;
    JSR #$d0e4

    ;
    ; Stop the player from walking.
    ;
    LDA Player_Flags
    AND #$df
    STA Player_Flags

    ;
    ; Set the flags and hit counter for the sprite.
    ;
    LDY #$00
    AND #$40
    BEQ @LAB_PRG14__885b
    INY

  @LAB_PRG14__885b:                         ; [$885b]
    STY Temp_00
    LDA CurrentSprites_Flags,X
    AND #$fe
    ORA Temp_00
    STA CurrentSprites_Flags,X
    LDA #$08
    STA CurrentSprites_HitCounter,X
    LDY a:Player_CurWeapon

    ;
    ; Set the base strength of the equipped weapon.
    ;
    LDA #$b7a5,Y
    STA Temp_00
    LDA a:SpecialItems

    ;
    ; If there's no pendant equipped, increase weapon strength by 25%.
    ;
    ; This is the famous Pendant Bug. This should have been inversed. Oops.
    ;
    AND #$02
    BNE @_checkGlove
    LDA Temp_00
    LSR A
    LSR A
    CLC
    ADC Temp_00
    STA Temp_00

    ;
    ; If the player has the glove, add the strength of the
    ; glove based on the weapon strength.
    ;
    ; This is:
    ;
    ;     Hand Dagger:   2HP
    ;     Long Sword:    4HP
    ;     Giant Blade:   8HP
    ;     Dragon Slayer: 10HP
    ;
  @_checkGlove:                             ; [$8884]
    LDA a:DurationGlove                     ; Load the glove duration.
    BMI @_updateSpriteHP                    ; If it's no longer active, jump.
    LDA Temp_00                             ; Load the calculated weapon
                                            ; strength.
    CLC
    ADC #$88c7,Y                            ; Add the glove strength for the
                                            ; current weapon.
    STA Temp_00                             ; Store as the new damage
                                            ; counter.

    ;
    ; Calculate the number of HP remaining for the enemy.
    ;
    ; We'll take the current HP, remove what we've calculated
    ; for the weapon strength.
    ;
  @_updateSpriteHP:                         ; [$8891]
    LDA CurrentSprites_HP,X                 ; Load the current HP for this
                                            ; enemy.
    SEC
    SBC Temp_00                             ; Subtract the current damage.
    STA CurrentSprites_HP,X                 ; Store back as the enemy HP.

    ;
    ; Check if the sprite is still alive. If so, we're done.
    ;
    BCS @_return                            ; If the enemy is dead, we're
                                            ; done here.

    ;
    ; The sprite is dead, so begin handling post-death logic.
    ;
    ; Start by checking if this is Sugata. This is handled specially.
    ; When dead, the screen flashes.
    ;
    LDA CurrentSprites_Entities,X
    CMP #$18                                ; Compare to Sugata.
    BNE @_handleEnemyGeneric                ; If not, jump.

    ;
    ; When Sugata dies, make sure we restore color.
    ;
    ; Sugata will flash the screen, and this prevents the screen
    ; from getting stuck in greyscale.
    ;
    LDA ScreenColorMode                     ; Load the current screen mode.
    AND #$fe                                ; Clear bit 0, setting to
                                            ; greyscale.
    STA ScreenColorMode                     ; Store back as the screen mode.

  @_handleEnemyGeneric:                     ; [$88a9]
    LDA #$03                                ; Play sound #3.

    ;
    ; Play a sound for the enemy kill, reset state, and add
    ; experience.
    ;
    JSR #$d0e4
    LDA #$00
    STA CurrentSprites_HitCounter,X         ; Clear the hit counter for the
                                            ; dead enemy.
    JSR Player_AddExperienceFromSprite      ; Add experience for the current
                                            ; sprite.

    ;
    ; Check if we killed a standard enemy or a boss.
    ;
    LDY CurrentSprites_Entities,X           ; Load the type of this enemy.
    LDA #$b544,Y
    CMP #$07                                ; Is this a big enemy?
    BNE @LAB_PRG14__88c3                    ; If not, jump.

    ;
    ; This was a big enemy (a boss).
    ;
    JMP Sprite_ShowBigEnemyDeathByMagicOrWeapon ; Handle big enemy death
                                                ; cleanup.

    ;
    ; This was a standard enemy.
    ;
  @LAB_PRG14__88c3:                         ; [$88c3]
    JMP Sprite_ShowNormalEnemyDeathByWeapon ; Handle standard enemy death
                                            ; cleanup.

  @_return:                                 ; [$88c6]
    RTS


;============================================================================
; A mapping of weapon types to additional hit power.
;============================================================================

;
; XREFS:
;     Player_HitSpriteWithWeapon
;
WEAPON_TO_GLOVE_STRENGTH:                   ; [$88c7]
    db $02                                  ; [0]: Hand Dagger -- 2HP
    db $04                                  ; [1]: Long Sword -- 4HP
    db $08                                  ; [2]: Giant Blade -- 8HP
    db $0a                                  ; [3]: Dragon Slayer -- 10HP


;============================================================================
; Check if a sprite is out of the player's weapon range.
;
; Range will be checked in both an X and Y direction.
;
; INPUTS:
;     X:
;         The index of the sprite to check.
;
; OUTPUTS:
;     Temp_00:
;         This will be clobbered with the last distance
;         calculation.
;
;     C:
;         1 if out of range.
;         0 if within range.
;
; XREFS:
;     Player_HitSpriteWithWeapon
;============================================================================
Sprites_IsSpriteOutOfWeaponRange:           ; [$88cb]
    ;
    ; First check the distance in the X position between the
    ; weapon and the sprite.
    ;
    LDA CurrentSprites_Entities,X
    ASL A
    TAY
    LDA #$b407,Y
    CLC
    ADC Maybe_WeaponRange_X
    STA Temp_00
    LDA PlayerPosXPlus10
    CLC

    ;
    ; If that wasn't in range...
    ;
    ADC Maybe_WeaponRange_X
    SEC
    SBC a:Something_Maybe_WeaponDistanceX
    CMP Temp_00
    BCS @_return

    ;
    ; Check the distance in the Y direction between the
    ; weapon and the sprite.
    ;
    LDA #$b408,Y
    CLC
    ADC Maybe_WeaponRange_Y
    STA Temp_00
    LDA Maybe_Something_PosY
    CLC
    ADC Maybe_WeaponRange_Y
    SEC
    SBC a:Something_Maybe_WeaponDistanceY
    CMP Temp_00
    BCS @_return

  @_return:                                 ; [$88fa]
    RTS


;============================================================================
; Handle touching an item.
;
; This will cause the player to pick up the sprite.
;
; INPUTS:
;     A:
;         The current sprite index.
;
;     CurrentSprites_Entities:
;         The entities of the sprites on the scren.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;         The new entities of the sprites, with this
;         sprite cleared.
;
; CALLS:
;     Player_PickUp
;============================================================================
Player_HandleTouchItem:                     ; [$88fb]
    LDA CurrentSprites_Entities,X           ; Load the entity at the given
                                            ; index.
    JSR #$c764                              ; Pick up the item.
    LDX a:CurrentSpriteIndex                ; X = current sprite index.

    ;
    ; Remove the item from the screen.
    ;
    LDA #$ff                                ; A = 0xFF (unset)
    STA CurrentSprites_Entities,X           ; Set the entity at this sprite
                                            ; index as 0xFF.

    ;
    ; XREFS:
    ;     CurrentSprite_CheckHitPlayer
    ;
RETURN_8909:                                ; [$8909]
    RTS


;============================================================================
; TODO: Document CurrentSprite_CheckHitPlayer
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
CurrentSprite_CheckHitPlayer:               ; [$890a]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Entities,X
    CMP #$ff
    BEQ RETURN_8909
    JSR Sprites_IsSpriteVisible
    BNE RETURN_8998
    LDA a:SpriteBox_Width
    CLC
    ADC #$0b
    STA Temp_00
    LDA PlayerPosX_Full
    CLC
    ADC #$0b
    SEC
    SBC a:SpriteBox_Left
    CMP Temp_00
    BCS RETURN_8998
    LDA a:SpriteBox_Height
    CLC
    ADC #$1b
    STA Temp_00
    LDA PlayerPosY
    CLC
    ADC #$1b
    SEC
    SBC a:SpriteBox_Top
    CMP Temp_00
    BCS RETURN_8998
    LDY CurrentSprites_Entities,X
    LDA #$b544,Y
    ASL A
    TAY
    CPY #$10
    BCS @_return
    LDA #$8959,Y
    PHA
    LDA #$8958,Y
    PHA

  @_return:                                 ; [$8957]
    RTS


;============================================================================
; Handlers for touching entities in the game.
;============================================================================

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;
SPRITE_COLLISION_HANDLERS:                  ; [$8958]
    dw Player_HandleTouchEnemy-1
    dw Player_HandleTouchBreadOrCoin-1      ; Coin/meat touched
    dw Player_CheckHandlePressUpOnNPC-1     ; Press Up on NPC
    dw $8956                                ; Large animation. Just return.
    dw Player_HandleTouchNPC-1              ; Collide with NPC
    dw Player_HandleTouchItem-1             ; Item touched
    dw Player_HandleTouchEnemyMagic-1       ; Enemy magic touched
    dw Player_HandleTouchEnemy-1            ; Enemy touched


;============================================================================
; Handle touching bread or money.
;
; If touching either of these, the sprite will be removed
; and the handler will be invoked to add HP or gold.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     CurrentSprites_Entities:
;         The current sprite entities on the screen.
;
; OUTPUTS:
;     None
;
; CALLS:
;     Player_HandleTouchCoin
;     Player_HandleTouchBread
;============================================================================
Player_HandleTouchBreadOrCoin:              ; [$8968]
    ;
    ; Check if this is a gold coin or bread.
    ;
    LDA CurrentSprites_Entities,X           ; Load the entity for this
                                            ; sprite.
    CMP #$01                                ; Is it bread?
    BEQ @_isBread                           ; If so, jump.

    ;
    ; This is a gold coin.
    ;
    LDA #$ff
    STA CurrentSprites_Entities,X           ; Clear the sprite.
    JMP Player_HandleTouchCoin              ; Handle touching the gold coin.

    ;
    ; This is bread.
    ;
  @_isBread:                                ; [$8977]
    LDA #$ff
    STA CurrentSprites_Entities,X           ; Clear the sprite.
    JMP Player_HandleTouchBread             ; Handle touching the bread.


;============================================================================
; Handle pressing Up next to an NPC.
;
; This will invoke an IScript for the NPC if the player
; pressed Up.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     Joy1_ChangedButtonMask:
;         The newly-changed button mask.
;
;     CurrentSprites_Values:
;         The values of the current sprites on screen.
;
; OUTPUTS:
;     CurrentSprite_Value:
;         The value of the sprite.
;
; CALLS:
;     MMC1_LoadBankAndJump
;============================================================================
Player_CheckHandlePressUpOnNPC:             ; [$897f]
    ;
    ; Check if Up is pressed.
    ;
    LDA Joy1_ChangedButtonMask              ; Load the changed button mask.
    CMP #$08                                ; Is Up pressed?
    BNE RETURN_8998                         ; If not, return.

    ;
    ; Up was pressed. Get the value for this sprite. This will
    ; be used to invoke the sprite's associated IScript.
    ;
    LDA CurrentSprites_Values,X             ; Load the value for the sprite.
    STA a:CurrentSprite_Value               ; Store it as the current value.
    CMP #$ff                                ; Is it 0xFF?
    BEQ RETURN_8998                         ; If so, return.
    JSR #$f859                              ; Execute the handler.
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
                                            ; IScripts_Begin

  @_afterFarJump:                           ; [$8995]
    LDX a:CurrentSpriteIndex                ; X = current sprite index

    ;
    ; XREFS:
    ;     CurrentSprite_CheckHitPlayer
    ;     Player_CheckHandlePressUpOnNPC
    ;     Player_HandleTouchNPC
    ;
RETURN_8998:                                ; [$8998]
    RTS


;============================================================================
; Handle touching an enemy's magic.
;
; If the player is not invincible via iframes or Ointment,
; this will trigger the same damage process as if the
; player touched the enemy directly.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     Player_InvincibilityPhase:
;         The current invincibility phase of the player.
;
;     DurationOintment:
;         The remaining duration of any ointment.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;         The new entities map with this sprite unset.
;
; CALLS:
;     Player_HandleTouchEnemy
;============================================================================
Player_HandleTouchEnemyMagic:               ; [$8999]
    LDA Player_InvincibilityPhase
    BNE RETURN_89AD
    LDA a:DurationOintment
    BPL RETURN_89AD
    JSR Player_HandleTouchEnemy
    LDX a:CurrentSpriteIndex
    LDA #$ff
    STA CurrentSprites_Entities,X

    ;
    ; XREFS:
    ;     Player_HandleTouchEnemy
    ;     Player_HandleTouchEnemyMagic
    ;
RETURN_89AD:                                ; [$89ad]
    RTS


;============================================================================
; Handle touching an enemy.
;
; If the player is not currently invincible (via iframes or
; Ointment), this will cause the player to take damage.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     Player_InvincibilityPhase:
;         The current invincibility phase of the player.
;
;     DurationOintment:
;         The remaining duration of any ointment.
;
;     CurrentSprites_Entities:
;         The entities of sprites on the screen.
;
;     CurrentSprites_Phases:
;         The state phases of the sprites on the screen.
;
; OUTPUTS:
;     CurrentSprites_Phases:
;         Resulting phase of sprites on the screen.
;
; CALLS:
;     Sound_PlayEffect
;     Player_SetDamagedBySprite
;     Player_ApplyDamage
;
; XREFS:
;     Player_HandleTouchEnemyMagic
;     SPRITE_COLLISION_HANDLERS [$PRG14::8958]
;============================================================================
Player_HandleTouchEnemy:                    ; [$89ae]
    ;
    ; Check if the player currently has iframes.
    ;
    LDA Player_InvincibilityPhase           ; Load the invincibility phase.
    BEQ @_canTakeDamage                     ; If no iframes are available,
                                            ; begin processing the hit.
    RTS                                     ; Else, return.

    ;
    ; Check if the player has Ointment active.
    ;
  @_canTakeDamage:                          ; [$89b3]
    LDA a:DurationOintment                  ; Check the ointment duration.
    BPL RETURN_89AD                         ; If there's time left, no damage
                                            ; will be taken. Return.

    ;
    ; Process special enemy handling.
    ;
    LDA CurrentSprites_Entities,X           ; Load the sprite entity that hit
                                            ; the player.
    CMP #$05                                ; Is it the Necron Aides?
    BNE @_handleDamage                      ; If not, perform standard damage
                                            ; handling.

    ;
    ; This is the Necron Aides enemy.
    ;
    LDA CurrentSprites_Phases,X             ; Load the phase of the enemy.
    ORA #$80                                ; Set the 7th bit.
    STA CurrentSprites_Phases,X             ; Store it.

    ;
    ; Play the sound effect and process damage.
    ;
  @_handleDamage:                           ; [$89c7]
    LDA #$04
    JSR #$d0e4                              ; Play the Player Hit sound.
    JSR Player_SetDamagedBySprite           ; Mark the player as damaged and
                                            ; set state.
    JMP Player_ApplyDamage                  ; Apply damage.
    db $60                                  ; [$89d2] byte

;
; XREFS:
;     Player_SetDamagedBySprite
;
SPRITES_FACING_VALUE_TO_OPPOSITE_PLAYER_FACING_BITMASK: ; [$89d3]
    db $40                                  ; [0]:
    db $00                                  ; [1]:


;============================================================================
; Set the player as damaged by another sprite.
;
; This will set the invincibility phase, giving the
; player iframes.
;
; It will also change the player direction to face
; the enemy, and apply knockback.
;
; INPUTS:
;     Player_Flags:
;         The player's current flags.
;
;     Player_StatusFlag:
;         The player's status flag.
;
; OUTPUTS:
;     Player_InvincibilityPhase:
;         The player's new invincibility phase (60).
;
;     Player_Flags:
;         The new player flags, with the facing direction
;         changed.
;
;     Player_StatusFlag:
;         The new status flag, with knockback applied.
;
; XREFS:
;     HandlePlayerHitByMagic
;     Player_HandleTouchEnemy
;============================================================================
Player_SetDamagedBySprite:                  ; [$89d5]
    ;
    ; Set the invincibility phase to 60.
    ;
    LDA #$3c
    STA Player_InvincibilityPhase           ; Set iframes to 60.

    ;
    ; Set the player's facing direction to face the enemy.
    ;
    LDA CurrentSprites_Flags,X              ; Load the sprite's current
                                            ; flags.
    AND #$01                                ; Grab the direction bit.
    TAY                                     ; Set to Y.
    LDA Player_Flags                        ; Load the player's flags.
    AND #$bf                                ; Unset the Facing Right bit.
    ORA #$89d3,Y                            ; Set facing to the opposite of
                                            ; the sprite's.
    STA Player_Flags                        ; Store it.

    ;
    ; Set knockback on the player.
    ;
    LDA Player_StatusFlag                   ; Load the player's status flag.
    ORA #$02                                ; Set knockback.
    STA Player_StatusFlag                   ; Store it.
    RTS


;============================================================================
; Handle the player touching an NPC.
;
; This will invoke an IScript action when colliding
; with the NPC. It's used for the initial screen when
; approaching the walls of Eolis.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     CurrentSprites_Values:
;         The values of the current sprites on screen.
;
; OUTPUTS:
;     CurrentSprite_Value:
;         The value of this sprite.
;
;     CurrentSprites_Entities:
;         The entities of the current sprites on screen.
;
; CALLS:
;     MMC1_LoadBankAndJump
;============================================================================
Player_HandleTouchNPC:                      ; [$89ef]
    LDA CurrentSprites_Values,X             ; Load the value for this sprite.
    STA a:CurrentSprite_Value               ; Store as the current sprite's
                                            ; value.
    CMP #$ff                                ; Is it 0xFF (unset)?
    BEQ RETURN_8998                         ; If so, return.
    JSR #$f859                              ; Else, execute the IScript at
                                            ; that value.
    db BANK_12_LOGIC                        ; Bank = 12
    dw IScripts_Begin-1                     ; Address =
                                            ; IScripts_Begin

    ;
    ; Clear this sprite.
    ;
  @_afterFarJump:                           ; [$89ff]
    LDX a:CurrentSpriteIndex                ; X = current sprite index.
    LDA #$ff                                ; A = 0xFF
    STA CurrentSprites_Entities,X           ; Set the entity at that index to
                                            ; 0xFF.
    RTS


;============================================================================
; TODO: Document GetSpriteBox
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
GetSpriteBox:                               ; [$8a08]
    LDA #$00
    STA Temp_Addr.U
    LDA CurrentSprites_Entities,X
    ASL A
    ROL Temp_Addr.U
    ASL A
    ROL Temp_Addr.U
    ADC #$73
    STA Temp_Addr
    LDA Temp_Addr.U
    ADC #$b2
    STA Temp_Addr.U
    LDA CurrentSprites_Entities,X
    CMP #$1f
    BEQ @LAB_PRG14__8a2e
    CMP #$20
    BEQ @LAB_PRG14__8a40
    CMP #$21
    BNE FUN_PRG14__8a51

  @LAB_PRG14__8a2e:                         ; [$8a2e]
    LDA CurrentSprites_Phases,X
    CMP #$02
    BNE FUN_PRG14__8a51
    LDA #$71
    STA Temp_Addr
    LDA #$8a
    STA Temp_Addr.U
    JMP FUN_PRG14__8a51

  @LAB_PRG14__8a40:                         ; [$8a40]
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__8a49
    CMP #$04
    BNE FUN_PRG14__8a51

  @LAB_PRG14__8a49:                         ; [$8a49]
    LDA #$75
    STA Temp_Addr
    LDA #$8a
    STA Temp_Addr.U


;============================================================================
; TODO: Document FUN_PRG14__8a51
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GetSpriteBox
;============================================================================
FUN_PRG14__8a51:                            ; [$8a51]
    LDY #$00
    LDA CurrentSprites_XPos,X
    CLC
    ADC (Temp_Addr),Y
    STA a:SpriteBox_Left
    LDA CurrentSprites_YPos,X
    CLC
    INY
    ADC (Temp_Addr),Y
    STA a:SpriteBox_Top
    INY
    LDA (Temp_Addr),Y
    STA a:SpriteBox_Width
    INY
    LDA (Temp_Addr),Y
    STA a:SpriteBox_Height
    RTS
    db $30,$08,$f0,$00,$20,$10,$f8,$00      ; [$8a71] byte


;============================================================================
; TODO: Document Player_ApplyDamage
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_HandleTouchEnemy
;============================================================================
Player_ApplyDamage:                         ; [$8a79]
    LDY CurrentSprites_Entities,X
    LDA #$b6d7,Y
    STA Temp_Addr.U
    STA Temp_05
    LDA #$00
    STA Temp_Addr
    STA Temp_04
    LSR Temp_05
    ROR Temp_04
    LSR Temp_05
    ROR Temp_04
    LSR Temp_05
    ROR Temp_04

    ;
    ; If the player is wearing any armor, apply damage reduction.
    ;
    LDY a:SelectedArmor                     ; Load the current armor.
    BEQ @_applyDamage                       ; If it's 0 (leather), then jump.
    CPY #$04                                ; Is it > 4 (Battle Suit)?
    BCS @_applyDamage                       ; Then jump.

    ;
    ; Apply the armor's defense multiplier.
    ;
    LDA #$8ad8,Y                            ; Load the multiplier for this
                                            ; armor.
    TAY                                     ; Y = A

  @LAB_PRG14__8aa2:                         ; [$8aa2]
    LDA Temp_Addr
    SEC
    SBC Temp_04
    STA Temp_Addr
    LDA Temp_Addr.U
    SBC Temp_05
    STA Temp_Addr.U
    DEY
    BNE @LAB_PRG14__8aa2

  @_applyDamage:                            ; [$8ab2]
    LDA Temp_Addr
    STA a:Arg_PlayerHealthDelta_L
    LDA Temp_Addr.U
    STA a:Arg_PlayerHealthDelta_U
    LDA a:SpecialItems
    AND #$01
    BEQ @LAB_PRG14__8ad4
    LDA a:Arg_PlayerHealthDelta_L
    SEC
    SBC Temp_04
    STA a:Arg_PlayerHealthDelta_L
    LDA a:Arg_PlayerHealthDelta_U
    SBC Temp_05
    STA a:Arg_PlayerHealthDelta_U

  @LAB_PRG14__8ad4:                         ; [$8ad4]
    JMP #$c08e

    ;
    ; XREFS:
    ;     Sprite_CheckHitByCastMagic
    ;
RETURN_8AD7:                                ; [$8ad7]
    RTS


;============================================================================
; Defense multipliers for each armor.
;============================================================================

;
; XREFS:
;     Player_ApplyDamage
;
ARMOR_DEFENSE_MULTIPLIERS:                  ; [$8ad8]
    db $00                                  ; [0]: Leather (0)
    db $01                                  ; [1]: Studded Mail (1)
    db $02                                  ; [2]: Full Plate (2)
    db $04                                  ; [3]: Battle Suit (4)


;============================================================================
; Check if the current sprite has been hit by player magic.
;
; If the player has cast magic, its hitbox will be matched
; against the sprite's.
;
; If there's overlap, the player's hit information will be
; updated.
;
; If the sprite dies, the player's state will be updated.
;
; INPUTS:
;     CastMagic_Type:
;         The currently-cast magic type.
;
;     CastMagic_XPos_Full:
;         The X position of the cast magic.
;
;     CastMagic_YPos_Full:
;         The Y position of the cast magic.
;
;     CastMagic_Flags:
;         The flags for the current magic type.
;
;     CurrentSpriteIndex:
;         The index of the currently-processed sprite.
;
;     CurrentSprites_Entities:
;         The entity types for the current sprites.
;
;     SPRITE_CATEGORIES_BY_ENTITY:
;         The category types for the sprite entity types.
;
;     CurrentSprites_Flags:
;         The flags for the current sprites.
;
;     CAST_MAGIC_HIT_BEHAVIORS:
;         The magic behavior functions for the magic types.
;
;     CurrentSprites_HitBoxTypes:
;         The hitbox types for the current sprites.
;
;     CAST_MAGIC_HIT_WIDTHS:
;         The hitbox widths for the cast magic types.
;
;     CAST_MAGIC_HIT_HEIGHTS:
;         The hitbox heights for the cast magic types.
;
;     SPRITE_HITBOX_WIDTHS:
;         The widths for the hitbox types.
;
;     SPRITE_HITBOX_HEIGHTS:
;         The heights for the hitbox types.
;
; OUTPUTS:
;     CurrentSprites_HitByMagicBehavior:
;         The magic hit behavior for the sprite, if hit.
;
;     CurrentSprites_Flags:
;         The updated flags for the sprite, if hit.
;
;     CurrentSprites_HitByMagicIFrames:
;        The new hit duration for the sprite, if hit.
;
;     Temp_00:
;     Temp_01:
;         Clobbered.
;
; CALLS:
;     Player_HitEnemyWithMagic
;============================================================================
Sprite_CheckHitByCastMagic:                 ; [$8adc]
    ;
    ; Check if there's a valid cast magic type on screen.
    ;
    LDA a:CastMagic_Type                    ; Load the cast magic type.
    CMP #$05                                ; Check against the supported
                                            ; magic types.
    BCS RETURN_8AD7                         ; If not, then return.

    ;
    ; Check if the currently-processed sprite is visible on screen.
    ;
    LDX a:CurrentSpriteIndex                ; Get the current sprite.
    JSR Sprites_IsSpriteVisible             ; Check if the sprite is visible.
    BNE RETURN_8AD7                         ; If not, return.

    ;
    ; Check the sprite type.
    ;
    LDA CurrentSprites_Entities,X           ; Get the type of this sprite.
    CMP #$ff                                ; Is it unset?
    BEQ RETURN_8AD7                         ; If so, return.

    ;
    ; Check if this is either a standard or big enemy.
    ;
    TAY                                     ; Y = A (sprite type)
    LDA #$b544,Y                            ; A = Category type of this
                                            ; sprite
    BEQ @_isEnemy                           ; If it's a standard enemy, jump.
    CMP #$07                                ; Check if it's a big enemy.
    BNE RETURN_8B72

    ;
    ; Check if the magic overlaps the sprite in the X direction.
    ;
  @_isEnemy:                                ; [$8afc]
    LDY a:CastMagic_Type                    ; Load the cast magic type.
    LDA #$8b73,Y                            ; Load the htbox width for the
                                            ; magic.
    STA Temp_01                             ; Store that.
    LDY CurrentSprites_HitBoxTypes,X        ; Load the hitbox type for the
                                            ; sprite.
    LDA #$b4d1,Y                            ; Get the width of the sprite.
    CLC
    ADC Temp_01                             ; Add the hitbox width for this.
    STA Temp_00                             ; Store that.
    LDA a:CastMagic_XPos_Full               ; Load the cast magic X position.
    CLC
    ADC Temp_01                             ; Add the hitbox width.
    SEC
    SBC CurrentSprites_XPos,X               ; Subtract the sprite X position.
    CMP Temp_00                             ; Compare to the magic hitbox.
    BCS RETURN_8B72                         ; If it didn't overlap in the X
                                            ; position, return.

    ;
    ; Check if the magic overlaps the sprite in the Y direction.
    ;
    LDY a:CastMagic_Type                    ; Load the cast magic type.
    LDA #$8b78,Y                            ; Load the hitbox height of the
                                            ; magic.
    STA Temp_01                             ; Store that.
    LDY CurrentSprites_HitBoxTypes,X        ; Load the hitbox type for the
                                            ; sprite.
    LDA #$b4d8,Y                            ; Get the height of the sprite.
    CLC
    ADC Temp_01                             ; Add the hitbox height for this.
    STA Temp_00                             ; Store that.
    LDA a:CastMagic_YPos_Full               ; Load the cast magic Y position.
    CLC
    ADC Temp_01                             ; Add the hitbox height.
    SEC
    SBC CurrentSprites_YPos,X               ; Subtract the sprite Y position.
    CMP Temp_00                             ; Compare to the magic hitbox.
    BCS RETURN_8B72                         ; If it didn't overlap in the Y
                                            ; position, return.

    ;
    ; The magic hit the sprite. Update state on the sprite.
    ;
    LDY a:CastMagic_Type                    ; Load the cast magic type.
    LDA #$8b7d,Y                            ; Load the hit behavior for the
                                            ; magic.
    STA CurrentSprites_HitByMagicBehavior,X ; Store as the hit behavior for
                                            ; the sprite.
    LDA #$8b82,Y                            ; Load the hit behavior timeframe
                                            ; for the magic.
    STA CurrentSprites_HitByMagicIFrames,X  ; Store for the sprite.

    ;
    ; Update the sprite to face the direction the magic is facing.
    ;
    LDA a:CastMagic_Flags                   ; Load the cast magic flags.
    ROL A                                   ; Get the facing direction of the
                                            ; magic.
    ROL A
    ROL A
    AND #$01
    STA Temp_00                             ; Store that.
    LDA CurrentSprites_Flags,X              ; Load the sprite's flags.
    AND #$fe                                ; Clear the facing direction bit.
    ORA Temp_00                             ; Set it to match the magic's
                                            ; direction.
    STA CurrentSprites_Flags,X              ; Store it back out.

    ;
    ; Give the player credit for hitting the enemy with magic.
    ;
    LDY a:CastMagic_Type                    ; Y = Cast magic type.
    JSR Player_HitEnemyWithMagic            ; Update player state.

    ;
    ; Load the magic hit sprite handler for this magic type.
    ;
    LDA a:CastMagic_Type                    ; A = Cast magic type.
    ASL A                                   ; Normalize to an index in the
                                            ; lookup table.
    TAY                                     ; Y = A
    LDA #$bb10,Y                            ; Load the next address from the
                                            ; lookup table.
    PHA
    LDA #$bb0f,Y
    PHA

    ;
    ; XREFS:
    ;     MagicHitsHandler [$PRG14::bb19]
    ;     MagicHitsHandler [$PRG14::bb1b]
    ;     MagicHitsHandler [$PRG14::bb1d]
    ;     MagicHitsHandler [$PRG14::bb1f]
    ;     MagicHitsHandler [$PRG14::bb21]
    ;     MagicHitsHandler [$PRG14::bb23]
    ;     MagicHitsHandler [$PRG14::bb25]
    ;     Sprite_CheckHitByCastMagic
    ;
RETURN_8B72:                                ; [$8b72]
    RTS


;============================================================================
; Hitbox widths for each magic type.
;============================================================================

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;
CAST_MAGIC_HIT_WIDTHS:                      ; [$8b73]
    db $0b                                  ; [0]: Deluge (11)
    db $0b                                  ; [1]: Thunder (11)
    db $1b                                  ; [2]: Fire (27)
    db $0b                                  ; [3]: Death (11)
    db $0b                                  ; [4]: Tilte (11)


;============================================================================
; Hitbox widths for each magic type.
;============================================================================

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;
CAST_MAGIC_HIT_HEIGHTS:                     ; [$8b78]
    db $0b                                  ; [0]: Deluge (11)
    db $1b                                  ; [1]: Thunder (27)
    db $0b                                  ; [2]: Fire (11)
    db $0b                                  ; [3]: Death (11)
    db $0b                                  ; [4]: Tilte (11)


;============================================================================
; Magic behaviors for each magic type.
;============================================================================

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;
CAST_MAGIC_HIT_BEHAVIORS:                   ; [$8b7d]
    db $00                                  ; [0]: Deluge (0)
    db $01                                  ; [1]: Thunder (1)
    db $02                                  ; [2]: Fire (2)
    db $ff                                  ; [3]: Death (none)
    db $ff                                  ; [4]: Tilte (none)


;============================================================================
; Hit iframe time for each magic type.
;============================================================================

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;
CAST_MAGIC_HIT_IFRAMES:                     ; [$8b82]
    db $04                                  ; [0]: Deluge (4)
    db $08                                  ; [1]: Thunder (8)
    db $ff                                  ; [2]: Fire (none)
    db $ff                                  ; [3]: Death (none)
    db $ff                                  ; [4]: Tilte (none)


;============================================================================
; Add player experience based on the current sprite.
;
; This will calculate the 24-bit enemy experience for a
; sprite and add it to the player's experience.
;
; INPUTS:
;     X:
;         The index of the sprite whose experience will be
;         added.
;
; OUTPUTS:
;     X:
;         The current sprite index.
;
;     Temp_Int24:
;     #$ed:
;         Clobbered.
;
; XREFS:
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;============================================================================
Player_AddExperienceFromSprite:             ; [$8b87]
    LDY CurrentSprites_Entities,X           ; Load the current enemy sprite
                                            ; type.
    LDA #$b60e,Y                            ; Load the experience for that
                                            ; type.
    STA Temp_Int24                          ; Store as the lower byte of the
                                            ; experience.
    LDA #$00
    STA Temp_Int24.M                        ; Store 0 as the middle byte.
    JSR #$f957                              ; Update the player's experience.
    LDX a:CurrentSpriteIndex
    RTS


;============================================================================
; Handle touching a gold coin.
;
; This will play the sound when picking up a coin,
; update the 24-bit gold amount, and then render to the
; screen.
;
; INPUTS:
;     A:
;         The index of the coin sprite.
;
; OUTPUTS:
;     X:
;         The current sprite index.
;
;     Gold_M:
;         The new middle byte for the gold.
;
;     Gold:
;         The new lower byte for the gold.
;
; CALLS:
;     Sound_PlayEffect
;     UI_DrawGoldValue
;
; XREFS:
;     Player_HandleTouchBreadOrCoin
;============================================================================
Player_HandleTouchCoin:                     ; [$8b9a]
    LDA #$09
    JSR #$d0e4                              ; Play sound 9 (coin touched).

    ;
    ; Update the lower byte of the gold.
    ;
    LDA a:Gold                              ; Load the lower byte of the
                                            ; gold.
    CLC
    ADC CurrentSprites_Values,X             ; Add the value of the coin; Set
                                            ; Carry = overflow.
    STA a:Gold                              ; Store as the lower byte.

    ;
    ; Update the middle byte of the gold.
    ;
    LDA a:Gold_M                            ; Load the middle byte for the
                                            ; gold.
    ADC #$00                                ; Add with carry, set the carry
                                            ; bit if overflow.
    STA a:Gold_M                            ; Store as the middle byte.

    ;
    ; Update the upper byte of the gold.
    ;
    LDA a:Gold_U                            ; Load the upper byte for the
                                            ; gold.
    ADC #$00                                ; Add with carry, set carry bit
                                            ; if overflow.
    STA a:Gold_U                            ; Store as the upper byte.

    ;
    ; Render and prepare to return.
    ;
    JSR #$f9e7                              ; Render the new gold amount.
    LDX a:CurrentSpriteIndex                ; Set X = current sprite index.
    RTS


;============================================================================
; Handle touching bread.
;
; This will play the sound when picking up bread and
; update the player's health.
;
; INPUTS:
;     @{symbol CurrentSpriteValues}:
;         The values of the current sprites on the screen.
;
; OUTPUTS:
;     None.
;
; CALLS:
;     Sound_PlayEffect
;     Player_AddHP
;
; XREFS:
;     Player_HandleTouchBreadOrCoin
;============================================================================
Player_HandleTouchBread:                    ; [$8bc0]
    LDA #$1b
    JSR #$d0e4                              ; Play sound 0x1B (pick up meat).
    LDX a:CurrentSpriteIndex                ; Load the current sprite index
                                            ; for meat.
    LDA CurrentSprites_Values,X             ; Load the HP value for it.
    JSR #$c07b                              ; Add it to the player's HP.
    LDX a:CurrentSpriteIndex
    RTS


;============================================================================
; TODO: Document CurrentSprite_UpdateState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprites_UpdateAllStates
;     _updateSpriteState [$PRG14::8040]
;============================================================================
CurrentSprite_UpdateState:                  ; [$8bd2]
    LDA a:Temp_03C7
    BPL @_return

    ;
    ; Check if this sprite is set.
    ;
    LDX a:CurrentSpriteIndex                ; X = Current sprite index
    LDY CurrentSprites_Entities,X           ; Y = Current sprite entity
    BMI @_return                            ; If unset, return.

    ;
    ; Check if this sprite is specifically Tamazutsu. It hides and
    ; won't be affected when hidden.
    ;
    CPY #$2c                                ; Check the sprite against
                                            ; Tamazutsu.
    BEQ @_notTamazutsu                      ; If not, handle the enemy
                                            ; normally.

    ;
    ; This is Tamazutsu. Check if it's visible or hiding.
    ;
    JSR Sprites_IsSpriteVisible
    BNE @_return

    ;
    ; Check the sprites hit counter. We'll do further updating
    ; for 2 frames, then stop for 2 frames, and rinse and repeat.
    ;
  @_notTamazutsu:                           ; [$8be8]
    LDA CurrentSprites_HitCounter,X
    AND #$02
    BNE @_return

    ;
    ; Update sprite state.
    ;
    LDA CurrentSprites_XPos,X
    STA Maybe_Arg_CurrentSprite_PosX
    LDA CurrentSprites_YPos,X
    STA Maybe_Arg_CurrentSprite_PosY
    LDA Screen_Maybe_ScrollXCounter
    STA MaybeUnused_Something_ScrollPosX
    LDA Player_Something_ScrollPosY
    STA MaybeUnused_Something_ScrollPosY
    LDA CurrentSprites_PPUAddrs,X
    STA Maybe_CurrentSprite_PPUOffset
    JSR CurrentSprite_CalculateVisibility
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Entities,X
    ASL A
    TAY
    LDA #$8088,Y
    PHA
    LDA #$8087,Y
    PHA

  @_return:                                 ; [$8c17]
    RTS


;============================================================================
; A mapping between a sprite's facing bit to a flipmask.
;
; Sprites store a facing bit in bit 0.
;
; Flipmasks store a flip bit in bit 7.
;============================================================================

;
; XREFS:
;     CurrentSprite_UpdateFlipMask
;
SPRITES_FACING_TO_FLIPMASK:                 ; [$8c18]
    db $00                                  ; [0]:
    db $40                                  ; [1]:


;============================================================================
; TODO: Document CurrentSprite_CalculateVisibility
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CurrentSprite_UpdateState
;============================================================================
CurrentSprite_CalculateVisibility:          ; [$8c1a]
    LDX a:CurrentSpriteIndex
    LDA #$00
    STA Temp_MovingSpriteVisibility

    ;
    ; Get the Y position of the current sprite and store
    ; as an argument for the ConvertPixelsToBlockPos() call.
    ;
    LDA CurrentSprites_YPos,X
    STA Arg_PixelPosY

    ;
    ; Get the X position of the current sprite and store
    ; as an argument for the ConvertPixelsToBlockPos() call.
    ;
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$04
    STA Arg_PixelPosX

    ;
    ; Convert to a block position.
    ;
    JSR #$e86c
    JSR #$e8c3
    CMP #$04
    BEQ @LAB_PRG14__8c3e
    CMP #$0d
    BEQ @LAB_PRG14__8c3e
    CMP #$09
    BNE @LAB_PRG14__8c44

  @LAB_PRG14__8c3e:                         ; [$8c3e]
    LDA Temp_MovingSpriteVisibility
    ORA #$01
    STA Temp_MovingSpriteVisibility

  @LAB_PRG14__8c44:                         ; [$8c44]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$0c
    STA Arg_PixelPosX
    JSR #$e86c
    JSR #$e8c3
    CMP #$04
    BEQ @LAB_PRG14__8c60
    CMP #$0d
    BEQ @LAB_PRG14__8c60
    CMP #$09
    BNE @LAB_PRG14__8c66

  @LAB_PRG14__8c60:                         ; [$8c60]
    LDA Temp_MovingSpriteVisibility
    ORA #$02
    STA Temp_MovingSpriteVisibility

  @LAB_PRG14__8c66:                         ; [$8c66]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Flags,X
    AND #$01
    BEQ @LAB_PRG14__8c7d
    LDA Temp_MovingSpriteVisibility
    BEQ Something_SetDAT26
    CMP #$03
    BEQ Something_SetDAT26
    EOR #$03
    JMP Something_SetDAT26

  @LAB_PRG14__8c7d:                         ; [$8c7d]
    LDA Temp_MovingSpriteVisibility

    ;
    ; XREFS:
    ;     CurrentSprite_CalculateVisibility
    ;
Something_SetDAT26:                         ; [$8c7f]
    STA MovingSpriteVisibility
    RTS


;============================================================================
; Set a sprite's flip mask based on the direction its facing.
;
; INPUTS:
;     CurrentSprites_Flags:
;         The flags for the current sprites.
;
;     SPRITES_FACING_TO_FLIPMASK:
;         The mapping table from a sprite's facing bit to
;         flipmask values.
;
; OUTPUTS:
;     CurrentSprite_FlipMask:
;         The resulting flipmask value.
;
; XREFS:
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Boss_KingGrieve
;     SpriteUpdateHandler_Boss_Ripasheiku
;     SpriteUpdateHandler_Boss_ShadowEura
;     SpriteUpdateHandler_Boss_Zoradohna
;     SpriteUpdateHandler_Boss_Zorugeriru
;     SpriteUpdateHandler_Enemy_Bihoruda
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
;     SpriteUpdateHandler_Enemy_Monodron
;     SpriteUpdateHandler_Enemy_Myconid
;     SpriteUpdateHandler_Enemy_Naga
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_NecronAides
;     SpriteUpdateHandler_Enemy_Raiden
;     SpriteUpdateHandler_Enemy_SirGawaine_Wolfman
;     SpriteUpdateHandler_Enemy_Snowman
;     SpriteUpdateHandler_Enemy_Sugata
;     SpriteUpdateHandler_Enemy_Tamazutsu
;     SpriteUpdateHandler_Enemy_Unused18
;     SpriteUpdateHandler_Enemy_Unused29
;     SpriteUpdateHandler_Enemy_Unused36
;     SpriteUpdateHandler_Enemy_Unused39
;     SpriteUpdateHandler_Enemy_Unused43
;     SpriteUpdateHandler_Enemy_UnusedEyeball_Zozura
;     SpriteUpdateHandler_Enemy_Yareeka
;     SpriteUpdateHandler_Enemy_Yuinaru
;     SpriteUpdateHandler_Enemy_Zombie
;     SpriteUpdateHandler_Garbled03
;     SpriteUpdateHandler_NPC_MagicTeacher
;     SpriteUpdateHandler_NPC_MartialArts
;     SpriteUpdateHandler_NPC_MeatSalesman_Others
;     SpriteUpdateHandler_NPC_Priest
;     SpriteUpdateHandler_NPC_Walking
;     SpriteUpdateHandler_TODO_Garbled10
;     SpriteUpdateHandler_TODO_Unknown84
;     SpriteUpdateHandler__a5d2
;============================================================================
CurrentSprite_UpdateFlipMask:               ; [$8c82]
    LDA CurrentSprites_Flags,X              ; Load flags for this sprite.
    AND #$01                                ; AND for the facing bit.
    TAY                                     ; Y = result
    LDA #$8c18,Y                            ; Load the bitmask from the
                                            ; mapping table.
    STA CurrentSprite_FlipMask              ; Store it.
    RTS


;============================================================================
; TODO: Document Sprite_EnterNextAppearancePhase
;
; INPUTS:
;     A
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a2eb
;     SpriteUpdateHandler_Boss_Borabohra
;     SpriteUpdateHandler_Boss_KingGrieve
;     SpriteUpdateHandler_Boss_Pakukame
;     SpriteUpdateHandler_Boss_Ripasheiku
;     SpriteUpdateHandler_Boss_Rokusutahn
;     SpriteUpdateHandler_Boss_ShadowEura
;     SpriteUpdateHandler_Boss_Zoradohna
;     SpriteUpdateHandler_Boss_Zorugeriru
;     SpriteUpdateHandler_Bread
;     SpriteUpdateHandler_Coin
;     SpriteUpdateHandler_Deco_Fountain
;     SpriteUpdateHandler_Effect_EnemyDeath
;     SpriteUpdateHandler_Effect_LightningBall20
;     SpriteUpdateHandler_Enemy_Bihoruda
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
;     SpriteUpdateHandler_Enemy_Monodron
;     SpriteUpdateHandler_Enemy_Myconid
;     SpriteUpdateHandler_Enemy_Naga
;     SpriteUpdateHandler_Enemy_Nash
;     SpriteUpdateHandler_Enemy_NecronAides
;     SpriteUpdateHandler_Enemy_Raiden
;     SpriteUpdateHandler_Enemy_SirGawaine_Wolfman
;     SpriteUpdateHandler_Enemy_Snowman
;     SpriteUpdateHandler_Enemy_Sugata
;     SpriteUpdateHandler_Enemy_Tamazutsu
;     SpriteUpdateHandler_Enemy_Unused18
;     SpriteUpdateHandler_Enemy_Unused29
;     SpriteUpdateHandler_Enemy_Unused36
;     SpriteUpdateHandler_Enemy_Unused39
;     SpriteUpdateHandler_Enemy_Unused43
;     SpriteUpdateHandler_Enemy_Yareeka
;     SpriteUpdateHandler_Enemy_Yuinaru
;     SpriteUpdateHandler_Enemy_Zombie
;     SpriteUpdateHandler_Garbled03
;     SpriteUpdateHandler_Item_Special
;     SpriteUpdateHandler_Item_Standard
;     SpriteUpdateHandler_NPC_ArmorSalesman
;     SpriteUpdateHandler_NPC_King
;     SpriteUpdateHandler_NPC_MagicTeacher
;     SpriteUpdateHandler_NPC_MartialArts
;     SpriteUpdateHandler_NPC_Priest
;     SpriteUpdateHandler_NPC_Walking
;     SpriteUpdateHandler_TODO_Garbled10
;     SpriteUpdateHandler_TODO_Garbled_81
;     SpriteUpdateHandler_TODO_Unknown84
;     SpriteUpdateHandler_TODO_Unknown_83
;     SpriteUpdateHandler__a5d2
;============================================================================
Sprite_EnterNextAppearancePhase:            ; [$8c8e]
    CLC
    LDY CurrentSprites_Entities,X
    ADC #$8c9f,Y
    JMP #$f057


;============================================================================
; TODO: Document SpriteUpdateHandler_Invisible
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8087]
;     SPRITE_UPDATE_HANDLERS [$PRG14::80b3]
;     SPRITE_UPDATE_HANDLERS [$PRG14::80d1]
;     SPRITE_UPDATE_HANDLERS [$PRG14::80d9]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8125]
;============================================================================
SpriteUpdateHandler_Invisible:              ; [$8c98]
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    STA MovingSpriteVisibility
    RTS

;
; XREFS:
;     Sprite_EnterNextAppearancePhase
;
SPRITE_APPEARANCE_PHASE_OFFSETS:            ; [$8c9f]
    db $00                                  ; [0]:
    db $db                                  ; [1]:
    db $93                                  ; [2]:
    db $83                                  ; [3]:
    db $01                                  ; [4]:
    db $05                                  ; [5]:
    db $07                                  ; [6]:
    db $0a                                  ; [7]:
    db $0c                                  ; [8]:
    db $0e                                  ; [9]:
    db $ef                                  ; [10]:
    db $13                                  ; [11]:
    db $15                                  ; [12]:
    db $17                                  ; [13]:
    db $1a                                  ; [14]:
    db $1d                                  ; [15]:
    db $21                                  ; [16]:
    db $71                                  ; [17]:
    db $6c                                  ; [18]:
    db $a9                                  ; [19]:
    db $a9                                  ; [20]:
    db $23                                  ; [21]:
    db $00                                  ; [22]:
    db $26                                  ; [23]:
    db $29                                  ; [24]:
    db $2b                                  ; [25]:
    db $2f                                  ; [26]:
    db $31                                  ; [27]:
    db $33                                  ; [28]:
    db $35                                  ; [29]:
    db $39                                  ; [30]:
    db $3c                                  ; [31]:
    db $3f                                  ; [32]:
    db $44                                  ; [33]:
    db $47                                  ; [34]:
    db $49                                  ; [35]:
    db $4b                                  ; [36]:
    db $00                                  ; [37]:
    db $4f                                  ; [38]:
    db $52                                  ; [39]:
    db $54                                  ; [40]:
    db $00                                  ; [41]:
    db $58                                  ; [42]: Monodron
    db $5b                                  ; [43]:
    db $5d                                  ; [44]:
    db $79                                  ; [45]:
    db $75                                  ; [46]:
    db $64                                  ; [47]:
    db $7d                                  ; [48]:
    db $83                                  ; [49]:
    db $80                                  ; [50]:
    db $89                                  ; [51]:
    db $ae                                  ; [52]:
    db $b1                                  ; [53]:
    db $b4                                  ; [54]:
    db $b7                                  ; [55]:
    db $b9                                  ; [56]:
    db $bb                                  ; [57]:
    db $bd                                  ; [58]:
    db $c1                                  ; [59]:
    db $c3                                  ; [60]:
    db $c5                                  ; [61]:
    db $c7                                  ; [62]:
    db $c9                                  ; [63]:
    db $cb                                  ; [64]:
    db $cd                                  ; [65]:
    db $cf                                  ; [66]:
    db $d1                                  ; [67]:
    db $d3                                  ; [68]:
    db $d5                                  ; [69]:
    db $d7                                  ; [70]:
    db $d9                                  ; [71]:
    db $dc                                  ; [72]:
    db $dd                                  ; [73]:
    db $de                                  ; [74]:
    db $df                                  ; [75]:
    db $e0                                  ; [76]:
    db $e1                                  ; [77]:
    db $e2                                  ; [78]:
    db $00                                  ; [79]:
    db $e3                                  ; [80]:
    db $f1                                  ; [81]:
    db $e8                                  ; [82]:
    db $f3                                  ; [83]:
    db $95                                  ; [84]:
    db $f6                                  ; [85]:
    db $f7                                  ; [86]:
    db $f8                                  ; [87]:
    db $f9                                  ; [88]:
    db $fa                                  ; [89]:
    db $fb                                  ; [90]:
    db $e3                                  ; [91]:
    db $f6                                  ; [92]:
    db $df                                  ; [93]:
    db $e0                                  ; [94]:
    db $dc                                  ; [95]:
    db $e2                                  ; [96]:
    db $e8                                  ; [97]:
    db $e8                                  ; [98]:
    db $e8                                  ; [99]:
    db $a9                                  ; [100]:


;============================================================================
; TODO: Document SpriteBehavior_MaybeFallingRocks__ClearEntity
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior_MaybeFallingRocks
;============================================================================
SpriteBehavior_MaybeFallingRocks__ClearEntity: ; [$8d04]
    LDA #$ff
    STA CurrentSprites_Entities,X
    RTS


;============================================================================
; TODO: Document SpriteBehavior_MaybeFallingRocks
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5eb]
;============================================================================
SpriteBehavior_MaybeFallingRocks:           ; [$8d0a]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__8d22
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_InternalBehaviorStates,X
    STA CurrentSprites_PPUAddrs,X
    LDA #$80
    STA CurrentSprites_Flags,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__8d22:                         ; [$8d22]
    INC CurrentSprites_InternalBehaviorStates,X
    BEQ SpriteBehavior_MaybeFallingRocks__ClearEntity
    LDY CurrentSprites_Phases,X
    BNE @LAB_PRG14__8d4c
    LDA #$04
    STA a:Arg_DeltaY_Full
    LDA #$00
    STA a:Arg_DeltaY_Frac
    JSR Sprite_MoveVertical
    BCC @_return1
    INC CurrentSprites_Phases,X
    LDA #$20
    STA CurrentSprites_StateCounter,X
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X

  @_return1:                                ; [$8d4b]
    RTS

  @LAB_PRG14__8d4c:                         ; [$8d4c]
    LDA CurrentSprites_StateCounter,X
    LDY #$03
    JSR Sprites_CalcYFromGravity
    LDY #$04
    JSR CalcVerticalSpriteMovement
    JSR Sprite_MoveVertical
    LDA CurrentSprites_Phases,X
    TAY
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$1f
    BNE @_return2
    JSR Sprite_ChangeYDirection

  @_return2:                                ; [$8d6d]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Coin
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::808b]
;============================================================================
SpriteUpdateHandler_Coin:                   ; [$8d6e]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDY #$00
    LDA CurrentSprites_InternalBehaviorStates,X
    AND #$08
    BEQ @LAB_PRG14__8d7c
    INY

  @LAB_PRG14__8d7c:                         ; [$8d7c]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Raiden
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::808f]
;============================================================================
SpriteUpdateHandler_Enemy_Raiden:           ; [$8d80]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_Phases,X
    CMP #$02
    BEQ @LAB_PRG14__8d96
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase

  @LAB_PRG14__8d96:                         ; [$8d96]
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$01
    ORA #$02
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior_MaybeFlyingSomething
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a613]
;============================================================================
SpriteBehavior_MaybeFlyingSomething:        ; [$8da3]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__8db3
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__8db3:                         ; [$8db3]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_Phases,X
    BMI @LAB_PRG14__8e0e
    LDA CurrentSprites_Flags,X
    ROL A
    ROL A
    AND #$01
    TAY
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$8e3a,Y
    STA Arg_PixelPosY
    LDA CurrentSprites_XPos,X
    STA Arg_PixelPosX
    JSR #$e86c
    JSR #$e8c3
    LDX a:CurrentSpriteIndex
    CMP #$02
    BEQ @LAB_PRG14__8de4
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @LAB_PRG14__8de4:                         ; [$8de4]
    LDA a:SpriteUpdateCounter
    CMP #$17
    BEQ @LAB_PRG14__8def
    CMP #$75
    BNE @LAB_PRG14__8df7

  @LAB_PRG14__8def:                         ; [$8def]
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @LAB_PRG14__8df7:                         ; [$8df7]
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$03
    TAY
    LDA #$8e3c,Y
    STA a:Arg_DeltaY_Frac
    LDA #$8e40,Y
    STA a:Arg_DeltaY_Full
    JMP CalculateNewVertPos

  @LAB_PRG14__8e0e:                         ; [$8e0e]
    JSR Sprites_SetCurrentSpriteCanWalk
    BCC @LAB_PRG14__8e16
    JMP FUN_PRG14__864a

  @LAB_PRG14__8e16:                         ; [$8e16]
    LDA a:SpriteUpdateCounter
    CMP #$26
    BEQ @LAB_PRG14__8e25
    CMP #$48
    BEQ @LAB_PRG14__8e25
    CMP #$93
    BNE @LAB_PRG14__8e2d

  @LAB_PRG14__8e25:                         ; [$8e25]
    LDA CurrentSprites_Flags,X
    EOR #$01
    STA CurrentSprites_Flags,X

  @LAB_PRG14__8e2d:                         ; [$8e2d]
    LDA #$00
    STA a:Arg_DeltaX_Frac
    LDA #$01
    STA a:Arg_DeltaX_Full
    JMP Sprites_Something_SomethingAndMoveHoriz

;
; XREFS:
;     SpriteBehavior_MaybeFlyingSomething
;
BYTE_ARRAY_PRG14__8e3a:                     ; [$8e3a]
    db $ff                                  ; [0]:
    db $20                                  ; [1]:

;
; XREFS:
;     SpriteBehavior_MaybeFlyingSomething
;
BYTE_ARRAY_PRG14__8e3c:                     ; [$8e3c]
    db $20                                  ; [0]:
    db $40                                  ; [1]:
    db $80                                  ; [2]:
    db $00                                  ; [3]:

;
; XREFS:
;     SpriteBehavior_MaybeFlyingSomething
;
BYTE_ARRAY_PRG14__8e40:                     ; [$8e40]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_NecronAides
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8091]
;============================================================================
SpriteUpdateHandler_Enemy_NecronAides:      ; [$8e44]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LDY CurrentSprites_Phases,X
    BMI @LAB_PRG14__8e52
    LSR A

  @LAB_PRG14__8e52:                         ; [$8e52]
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Zombie
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8093]
;============================================================================
SpriteUpdateHandler_Enemy_Zombie:           ; [$8e57]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    JSR Sprite_GetPreviousSpritePhase
    LSR A
    BCS @LAB_PRG14__8e6f
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    TAY
    LDA #$8e73,Y
    TAY

  @LAB_PRG14__8e6f:                         ; [$8e6f]
    TYA
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Zombie
;
SPRITEBEHAVIOR_8E57_PHASES:                 ; [$8e73]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__8e77
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a665]
;============================================================================
SpriteBehavior__8e77:                       ; [$8e77]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__8e87
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_TickCounters,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__8e87:                         ; [$8e87]
    LDA #$00
    STA a:Arg_DeltaX_Frac
    LDA #$02
    STA a:Arg_DeltaX_Full
    JSR Sprite_MoveAndTurnAroundIfNeeded
    LDA CurrentSprites_TickCounters,X
    LSR A
    LSR A
    LSR A
    AND #$07
    TAY
    LDA #$8eb0,Y
    STA a:Arg_DeltaY_Frac
    LDA #$8eb8,Y
    STA a:Arg_DeltaY_Full
    JSR MoveSpriteVertBorder
    INC CurrentSprites_TickCounters,X       ; Increment the sprite's tick
                                            ; counter.
    RTS

;
; XREFS:
;     SpriteBehavior__8e77
;
BYTE_ARRAY_PRG14__8eb0:                     ; [$8eb0]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $80                                  ; [2]:
    db $40                                  ; [3]:
    db $00                                  ; [4]:
    db $40                                  ; [5]:
    db $80                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     SpriteBehavior__8e77
;
BYTE_ARRAY_PRG14__8eb8:                     ; [$8eb8]
    db $02                                  ; [0]:
    db $01                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $01                                  ; [7]:
    db $ff                                  ; [8]:
    db $01                                  ; [9]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Hornet
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8095]
;============================================================================
SpriteUpdateHandler_Enemy_Hornet:           ; [$8ec2]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__8ecf
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a615]
;============================================================================
SpriteBehavior__8ecf:                       ; [$8ecf]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__8ee1
    LDA #$00
    STA CurrentSprites_TickCounters,X
    LDA #$40
    STA CurrentSprites_StateCounter,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__8ee1:                         ; [$8ee1]
    LDA CurrentSprites_TickCounters,X
    LDY #$02
    JSR Sprites_CalcYFromGravity
    LDY #$03
    JSR FUN_PRG14__83c1
    LDA a:Arg_DeltaX_Full
    AND #$01
    STA a:Arg_DeltaX_Full
    JSR Sprite_MoveAndTurnAroundIfNeeded
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_StateCounter,X
    LDY #$02
    JSR Sprites_CalcYFromGravity
    LDY #$03
    JSR CalcVerticalSpriteMovement
    LDA a:Arg_DeltaY_Full
    AND #$01
    STA a:Arg_DeltaY_Full
    JSR MoveSpriteVertBorder
    INC CurrentSprites_StateCounter,X
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Bihoruda
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8097]
;============================================================================
SpriteUpdateHandler_Enemy_Bihoruda:         ; [$8f18]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_TickCounters,X
    AND #$7f
    SEC
    SBC #$30
    CMP #$30
    BCC @LAB_PRG14__8f2a
    INY

  @LAB_PRG14__8f2a:                         ; [$8f2a]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__8f2e
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a617]
;============================================================================
SpriteBehavior__8f2e:                       ; [$8f2e]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__8f51
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_Phases,X
    LDA CurrentSprites_Flags,X
    ORA #$80
    STA CurrentSprites_Flags,X
    LDA #$3c
    STA CurrentSprites_InternalBehaviorStates,X
    JSR Sprite_EnableBehavior
    JSR CurrentSprite_RandomlyChangeHorizDirection

  @LAB_PRG14__8f51:                         ; [$8f51]
    LDY CurrentSprites_Phases,X
    BEQ @LAB_PRG14__8f59
    JMP SpriteBehavior__8f9a

  @LAB_PRG14__8f59:                         ; [$8f59]
    LDA #$01
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    LDY #$05
    LDA CurrentSprites_StateCounter,X
    JSR Sprites_CalcYFromGravity
    LDY #$05
    JSR CalcVerticalSpriteMovement
    JSR CalculateNewVertPos
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$0f
    BNE @LAB_PRG14__8f83
    JSR Sprite_ChangeYDirection

  @LAB_PRG14__8f83:                         ; [$8f83]
    DEC CurrentSprites_InternalBehaviorStates,X
    BNE @_return
    INC CurrentSprites_Phases,X
    JSR Sprite_MoveTowardsPlayerX
    JSR Sprite_MoveTowardsPlayerY
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X

  @_return:                                 ; [$8f99]
    RTS


;============================================================================
; TODO: Document SpriteBehavior__8f9a
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__8f2e
;============================================================================
SpriteBehavior__8f9a:                       ; [$8f9a]
    LDA CurrentSprites_TickCounters,X
    LDY #$03
    JSR Sprites_CalcYFromGravity
    LDY #$04
    JSR FUN_PRG14__83c1
    JSR FUN_PRG14__8427
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    AND #$3f
    BNE @LAB_PRG14__8fb7
    JSR Sprite_MoveTowardsPlayerX

  @LAB_PRG14__8fb7:                         ; [$8fb7]
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    CMP #$27
    BEQ @LAB_PRG14__8fc9
    LDA #$00
    STA CurrentSprites_StateCounter,X
    JSR Sprite_MoveTowardsPlayerY

  @LAB_PRG14__8fc9:                         ; [$8fc9]
    LDA #$01
    STA a:Arg_DeltaY_Full
    LDA #$00
    STA a:Arg_DeltaY_Frac
    JMP FUN_PRG14__859c

  @_return:                                 ; [$8fd6]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__8fd7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__8fd7:                            ; [$8fd7]
    LDA #$00

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Lilith
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8099]
;============================================================================
SpriteUpdateHandler_Enemy_Lilith:           ; [$8fd9]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__8fe7
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a619]
;============================================================================
SpriteBehavior__8fe7:                       ; [$8fe7]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__8ff9
    LDA #$00
    STA CurrentSprites_TickCounters,X
    LDA #$80
    STA CurrentSprites_StateCounter,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__8ff9:                         ; [$8ff9]
    LDA CurrentSprites_TickCounters,X
    LDY #$01
    JSR Sprites_CalcYFromGravity
    LDY #$03
    JSR FUN_PRG14__83c1
    LDA a:Arg_DeltaX_Full
    AND #$03
    STA a:Arg_DeltaX_Full
    JSR FUN_PRG14__8427
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    LDY #$02
    JSR Sprites_CalcYFromGravity
    LDY #$03
    JSR CalcVerticalSpriteMovement
    LDA a:Arg_DeltaY_Full
    AND #$01
    STA a:Arg_DeltaY_Full
    JSR FUN_PRG14__859c
    INC CurrentSprites_StateCounter,X
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Yuinaru
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::809d]
;============================================================================
SpriteUpdateHandler_Enemy_Yuinaru:          ; [$9033]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_TickCounters,X
    AND #$08
    BEQ @LAB_PRG14__9040
    INY

  @LAB_PRG14__9040:                         ; [$9040]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Snowman
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::809f]
;============================================================================
SpriteUpdateHandler_Enemy_Snowman:          ; [$9044]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__905c
    TAY
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    CPY #$01
    BNE @LAB_PRG14__9059
    LSR A

  @LAB_PRG14__9059:                         ; [$9059]
    AND #$01
    TAY

  @LAB_PRG14__905c:                         ; [$905c]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9060
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a61b]
;============================================================================
SpriteBehavior__9060:                       ; [$9060]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__906d
    LDA #$78
    STA CurrentSprites_TickCounters,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__906d:                         ; [$906d]
    LDY CurrentSprites_Phases,X
    BEQ @LAB_PRG14__908f
    DEY
    BEQ @LAB_PRG14__90ce
    DEC CurrentSprites_TickCounters,X
    BEQ @LAB_PRG14__9084
    LDA CurrentSprites_TickCounters,X
    CMP #$0a
    BNE @_return
    JMP FUN_PRG14__a0a0

  @LAB_PRG14__9084:                         ; [$9084]
    LDA #$00
    STA CurrentSprites_Phases,X
    LDA #$78
    STA CurrentSprites_TickCounters,X

  @_return:                                 ; [$908e]
    RTS

  @LAB_PRG14__908f:                         ; [$908f]
    JSR Sprite_SetMaybeHidden
    DEC CurrentSprites_TickCounters,X
    BNE @_return1
    JSR Sprites_HideSprite
    INC CurrentSprites_Phases,X
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    LDA Player_Flags
    AND #$40
    BNE @LAB_PRG14__90bd
    LDA PlayerPosX_Full
    CLC
    ADC #$20
    STA CurrentSprites_XPos,X
    BCS @LAB_PRG14__90b5
    CMP #$f0
    BCC @_return1

  @LAB_PRG14__90b5:                         ; [$90b5]
    LDA PlayerPosX_Full
    SEC
    SBC #$20
    STA CurrentSprites_XPos,X
    RTS

  @LAB_PRG14__90bd:                         ; [$90bd]
    LDA PlayerPosX_Full
    SEC
    SBC #$20
    STA CurrentSprites_XPos,X
    BCS @_return1
    LDA PlayerPosX_Full
    CLC
    ADC #$20
    STA CurrentSprites_XPos,X

  @_return1:                                ; [$90cd]
    RTS

  @LAB_PRG14__90ce:                         ; [$90ce]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE @_return2
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    INC CurrentSprites_Phases,X

  @_return2:                                ; [$90de]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Nash
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80a1]
;============================================================================
SpriteUpdateHandler_Enemy_Nash:             ; [$90df]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    BEQ @_return
    CMP #$02
    BEQ @LAB_PRG14__90f7
    LDA a:SpriteUpdateCounter
    AND #$04
    BNE @_return
    LDY #$00
    BEQ @LAB_PRG14__910b

  @_return:                                 ; [$90f6]
    RTS

  @LAB_PRG14__90f7:                         ; [$90f7]
    LDY #$00
    LDA CurrentSprites_TickCounters,X
    SEC
    SBC #$0a
    CMP #$28
    BCS @LAB_PRG14__910b
    LDY #$01
    CMP #$14
    BCS @LAB_PRG14__910b
    LDY #$02

  @LAB_PRG14__910b:                         ; [$910b]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_FireGiant
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80a3]
;============================================================================
SpriteUpdateHandler_Enemy_FireGiant:        ; [$910f]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$02
    LDA CurrentSprites_Phases,X
    CMP #$02
    BNE @LAB_PRG14__9125
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$04
    BEQ @LAB_PRG14__9125
    INY

  @LAB_PRG14__9125:                         ; [$9125]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9129
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a667]
;============================================================================
SpriteBehavior__9129:                       ; [$9129]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9136
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9136:                         ; [$9136]
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__9176
    LDA CurrentSprites_XPos,X
    SEC
    SBC PlayerPosX_Full
    BCS @LAB_PRG14__9147
    EOR #$ff
    ADC #$01

  @LAB_PRG14__9147:                         ; [$9147]
    CMP #$20
    BCC @LAB_PRG14__915e
    JSR Sprite_MoveTowardsPlayerX
    LDA #$c0
    STA a:Arg_DeltaX_Frac
    LDA #$00
    STA a:Arg_DeltaX_Full
    JSR Sprite_MoveAndTurnAroundIfNeeded
    JMP FUN_PRG14__8507

  @LAB_PRG14__915e:                         ; [$915e]
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA Player_Flags
    AND #$40
    EOR #$918c,Y
    BNE @_return1
    INC CurrentSprites_Phases,X
    LDA #$1e
    STA CurrentSprites_TickCounters,X

  @_return1:                                ; [$9175]
    RTS

  @LAB_PRG14__9176:                         ; [$9176]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    BEQ @LAB_PRG14__9188
    CMP #$14
    BNE @_return2
    JMP FUN_PRG14__a0a0

  @LAB_PRG14__9188:                         ; [$9188]
    INC CurrentSprites_Phases,X

  @_return2:                                ; [$918b]
    RTS

;
; XREFS:
;     SpriteBehavior__9129
;
BYTE_ARRAY_PRG14__918c:                     ; [$918c]
    db $40                                  ; [0]:
    db $00                                  ; [1]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Ishiisu
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80a5]
;============================================================================
SpriteUpdateHandler_Enemy_Ishiisu:          ; [$918e]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__91a4
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$04
    BEQ @LAB_PRG14__91af
    LDY #$01
    BNE @LAB_PRG14__91af

  @LAB_PRG14__91a4:                         ; [$91a4]
    LDY #$02
    LDA CurrentSprites_TickCounters,X
    CMP #$14
    BCS @LAB_PRG14__91af
    LDY #$03

  @LAB_PRG14__91af:                         ; [$91af]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__91b3
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a669]
;============================================================================
SpriteBehavior__91b3:                       ; [$91b3]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__91c3
    LDA #$00
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__91c3:                         ; [$91c3]
    LDA CurrentSprites_Phases,X
    AND #$03
    CMP #$03
    BEQ @LAB_PRG14__920b
    LDA #$80
    STA a:Arg_DeltaX_Frac
    LDA #$00
    STA a:Arg_DeltaX_Full
    JSR Sprite_MoveAndTurnAroundIfNeeded
    LDA CurrentSprites_StateCounter,X
    LDY #$05
    JSR Sprites_CalcYFromGravity
    LDY #$05
    JSR CalcVerticalSpriteMovement
    LDA #$00
    STA a:Arg_DeltaY_Full
    JSR FUN_PRG14__859c
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$07
    BNE @LAB_PRG14__91fb
    JSR Sprite_ChangeYDirection

  @LAB_PRG14__91fb:                         ; [$91fb]
    LDA CurrentSprites_StateCounter,X
    AND #$0f
    BNE @_return1
    INC CurrentSprites_Phases,X
    LDA #$0f
    STA CurrentSprites_TickCounters,X

  @_return1:                                ; [$920a]
    RTS

  @LAB_PRG14__920b:                         ; [$920b]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE @_return2
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_StateCounter,X
    JMP FUN_PRG14__a093

  @_return2:                                ; [$921e]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_ExecutionHood
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80a7]
;============================================================================
SpriteUpdateHandler_Enemy_ExecutionHood:    ; [$921f]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_Phases,X
    AND #$03
    CMP #$03
    BNE @LAB_PRG14__9235
    LDA a:SpriteUpdateCounter
    AND #$04
    BEQ @LAB_PRG14__9235
    INY

  @LAB_PRG14__9235:                         ; [$9235]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document Sprite_SomethingSpawnMagic
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a7a2]
;============================================================================
Sprite_SomethingSpawnMagic:                 ; [$9239]
    JSR Sprites_HasMaxOnScreen
    BCS @_return
    LDA CurrentSprites_Flags,X
    AND #$01
    STA CurrentSprites_Flags,Y
    LDA CurrentSprites_XPos,X
    STA CurrentSprites_XPos,Y
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$08
    STA CurrentSprites_YPos,Y
    LDA #$54
    STA CurrentSprites_Entities,Y
    LDA #$00
    STA CurrentSprites_PPUAddrs,Y
    JMP Sprite_Maybe_ResetState

  @_return:                                 ; [$9260]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Charron
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80b1]
;============================================================================
SpriteUpdateHandler_Enemy_Charron:          ; [$9261]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__927b
    CMP #$05
    BEQ @LAB_PRG14__9280
    LSR A
    BCS @LAB_PRG14__927b
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP @LAB_PRG14__927d

  @LAB_PRG14__927b:                         ; [$927b]
    LDA #$01

  @LAB_PRG14__927d:                         ; [$927d]
    JMP Sprite_EnterNextAppearancePhase

  @LAB_PRG14__9280:                         ; [$9280]
    LDA #$02
    BNE @LAB_PRG14__927d


;============================================================================
; TODO: Document _thunk_Sprite_ClearBehaviorReadyAndSetSubtypeBit7
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a623]
;============================================================================
_thunk_Sprite_ClearBehaviorReadyAndSetSubtypeBit7: ; [$9284]
    JMP Sprite_ClearBehaviorReadyAndSetSubtypeBit7


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Geributa
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80b5]
;============================================================================
SpriteUpdateHandler_Enemy_Geributa:         ; [$9287]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$02
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__929b
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$04
    BEQ @LAB_PRG14__929b
    INY

  @LAB_PRG14__929b:                         ; [$929b]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Sugata
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80b7]
;============================================================================
SpriteUpdateHandler_Enemy_Sugata:           ; [$929f]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__92ac
    INY

  @LAB_PRG14__92ac:                         ; [$92ac]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Grimlock
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80b9]
;============================================================================
SpriteUpdateHandler_Enemy_Grimlock:         ; [$92b0]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$03
    LDA CurrentSprites_Phases,X
    CMP #$09
    BEQ @LAB_PRG14__92d8
    CMP #$0b
    BEQ @LAB_PRG14__92d8
    LDY #$00
    CMP #$08
    BCC @LAB_PRG14__92d8
    TAY
    LDA a:SpriteUpdateCounter
    CPY #$0b
    BEQ @LAB_PRG14__92cf
    LSR A

  @LAB_PRG14__92cf:                         ; [$92cf]
    LSR A
    LSR A
    AND #$03
    TAY
    LDA #$92dc,Y
    TAY

  @LAB_PRG14__92d8:                         ; [$92d8]
    TYA
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Grimlock
;
BYTE_ARRAY_PRG14__92dc:                     ; [$92dc]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__92e0
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a627]
;============================================================================
SpriteBehavior__92e0:                       ; [$92e0]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__92ed
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__92ed:                         ; [$92ed]
    LDY CurrentSprites_Phases,X
    BEQ @LAB_PRG14__92f8
    DEY
    BEQ @LAB_PRG14__932b
    JMP @LAB_PRG14__9360

  @LAB_PRG14__92f8:                         ; [$92f8]
    LDA #$00
    STA a:Arg_DeltaY_Frac
    LDA #$04
    STA a:Arg_DeltaY_Full
    JSR FUN_PRG14__859c
    LDA CurrentSprites_YPos,X
    CMP #$20
    BCS @_return1
    INC CurrentSprites_Phases,X
    LDA #$ff
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    JSR Sprite_MoveTowardsPlayerX
    JSR Sprite_MoveTowardsPlayerY

  @_return1:                                ; [$931c]
    RTS

  @LAB_PRG14__931d:                         ; [$931d]
    INC CurrentSprites_Phases,X
    LDA #$40
    STA CurrentSprites_TickCounters,X
    LDA #$00
    STA CurrentSprites_StateCounter,X
    RTS

  @LAB_PRG14__932b:                         ; [$932b]
    LDA CurrentSprites_StateCounter,X
    BEQ @LAB_PRG14__931d
    JSR FUN_PRG14__831b
    CMP #$08
    BCC @LAB_PRG14__931d
    LDA #$00
    STA a:Arg_DeltaX_Frac
    LDA #$01
    STA a:Arg_DeltaX_Full
    JSR FUN_PRG14__8427
    LDA CurrentSprites_StateCounter,X
    LDY #$02
    JSR CalcVerticalSpriteMovement
    JSR FUN_PRG14__859c
    LDA CurrentSprites_StateCounter,X
    SEC
    SBC #$04
    STA CurrentSprites_StateCounter,X
    BCS @_return2
    LDA #$00
    STA CurrentSprites_StateCounter,X

  @_return2:                                ; [$935f]
    RTS

  @LAB_PRG14__9360:                         ; [$9360]
    JSR Sprite_MoveTowardsPlayerX
    LDA #$c0
    STA a:Arg_DeltaX_Frac
    LDA #$00
    STA a:Arg_DeltaX_Full
    JSR FUN_PRG14__8427
    LDA CurrentSprites_StateCounter,X
    LDY #$04
    JSR Sprites_CalcYFromGravity
    LDY #$04
    JSR CalcVerticalSpriteMovement
    LDA #$00
    STA a:Arg_DeltaY_Full
    JSR FUN_PRG14__859c
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$0f
    BNE @LAB_PRG14__9397
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @LAB_PRG14__9397:                         ; [$9397]
    LDA CurrentSprites_StateCounter,X
    AND #$7f
    BNE @_return
    LDA #$00
    STA CurrentSprites_Phases,X
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$93ab]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_GiantBees
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80bb]
;============================================================================
SpriteUpdateHandler_Enemy_GiantBees:        ; [$93ac]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__93b9
    INY

  @LAB_PRG14__93b9:                         ; [$93b9]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Myconid
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80bd]
;============================================================================
SpriteUpdateHandler_Enemy_Myconid:          ; [$93bd]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    CMP #$01
    BEQ @LAB_PRG14__93d4
    CMP #$03
    BEQ @LAB_PRG14__93d4
    CMP #$05
    BEQ @LAB_PRG14__93d4
    LDA #$00
    JMP Sprite_EnterNextAppearancePhase

  @LAB_PRG14__93d4:                         ; [$93d4]
    TAY
    LDA a:SpriteUpdateCounter
    CPY #$05
    BEQ @LAB_PRG14__93dd
    LSR A

  @LAB_PRG14__93dd:                         ; [$93dd]
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__93e5
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a629]
;============================================================================
SpriteBehavior__93e5:                       ; [$93e5]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__93f5
    LDA #$00
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__93f5:                         ; [$93f5]
    JSR Sprite_MoveTowardsPlayerX
    LDA CurrentSprites_StateCounter,X
    LDY #$04
    JSR Sprites_CalcYFromGravity
    LDY #$05
    JSR CalcVerticalSpriteMovement
    LDA a:Arg_DeltaY_Full
    AND #$01
    STA a:Arg_DeltaY_Full
    JSR Sprite_MoveVertical
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$1f
    BNE @LAB_PRG14__9422
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @LAB_PRG14__9422:                         ; [$9422]
    JSR FUN_PRG14__831b
    CMP #$10
    BCC @_return
    LDA CurrentSprites_Flags,X
    PHA
    JSR Sprite_MoveTowardsPlayerY
    LDA #$00
    STA a:Arg_DeltaY_Full
    LDA #$c0
    STA a:Arg_DeltaY_Frac
    JSR Sprite_MoveVertical
    PLA
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$9441]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Naga
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80bf]
;============================================================================
SpriteUpdateHandler_Enemy_Naga:             ; [$9442]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__944f
    INY

  @LAB_PRG14__944f:                         ; [$944f]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Unused29
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80c1]
;============================================================================
SpriteUpdateHandler_Enemy_Unused29:         ; [$9453]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$03
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__946c
    CMP #$02
    BEQ @LAB_PRG14__9470
    LDY #$01
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__946c
    LDY #$02

  @LAB_PRG14__946c:                         ; [$946c]
    TYA
    JMP Sprite_EnterNextAppearancePhase

  @LAB_PRG14__9470:                         ; [$9470]
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$10
    BEQ @LAB_PRG14__946c
    LDY #$02
    BNE @LAB_PRG14__946c


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_GiantStrider
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80c3]
;============================================================================
SpriteUpdateHandler_Enemy_GiantStrider:     ; [$947d]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$02
    LDA CurrentSprites_Phases,X
    CMP #$02
    BEQ @LAB_PRG14__9493
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$04
    BEQ @LAB_PRG14__9493
    INY

  @LAB_PRG14__9493:                         ; [$9493]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9497
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a637]
;============================================================================
SpriteBehavior__9497:                       ; [$9497]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__94a4
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__94a4:                         ; [$94a4]
    JSR Sprites_SetCurrentSpriteCanWalk
    BCC @LAB_PRG14__94ac
    JSR FUN_PRG14__864a

  @LAB_PRG14__94ac:                         ; [$94ac]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR FUN_PRG14__82f8
    CMP #$18
    BEQ @_return1
    BCC @LAB_PRG14__94d5
    JSR Sprite_MoveTowardsPlayerX
    LDA #$01
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @_return1
    INC CurrentSprites_Phases,X

  @_return1:                                ; [$94d4]
    RTS

  @LAB_PRG14__94d5:                         ; [$94d5]
    LDA #$01
    STA CurrentSprites_Phases,X
    LDA Player_Flags
    AND #$01
    BNE @LAB_PRG14__94f3
    JSR Sprite_MoveTowardsPlayerX
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$10
    BEQ @LAB_PRG14__94ee
    LDY #$02

  @LAB_PRG14__94ee:                         ; [$94ee]
    TYA
    STA CurrentSprites_Phases,X
    RTS

  @LAB_PRG14__94f3:                         ; [$94f3]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_MoveTowardsPlayerX
    LDA #$02
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    LDA a:SpriteUpdateCounter
    AND #$04
    BNE @_return2
    INC CurrentSprites_Phases,X

  @_return2:                                ; [$9512]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_SirGawaine_Wolfman
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80c5]
;     thunk_SpriteUpdateHandler_Enemy_SirGawaine_Wolfman
;============================================================================
SpriteUpdateHandler_Enemy_SirGawaine_Wolfman: ; [$9513]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Maskman
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80c7]
;============================================================================
SpriteUpdateHandler_Enemy_Maskman:          ; [$951c]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$04
    LDA CurrentSprites_Phases,X
    LSR A
    BCC @LAB_PRG14__9531
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__9531
    INY

  @LAB_PRG14__9531:                         ; [$9531]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document thunk_SpriteUpdateHandler_Enemy_SirGawaine_Wolfman
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80c9]
;============================================================================
thunk_SpriteUpdateHandler_Enemy_SirGawaine_Wolfman: ; [$9535]
    JMP SpriteUpdateHandler_Enemy_SirGawaine_Wolfman


;============================================================================
; TODO: Document SpriteBehavior__9538
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a62b]
;============================================================================
SpriteBehavior__9538:                       ; [$9538]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9548
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9548:                         ; [$9548]
    LDY CurrentSprites_Phases,X
    CPY #$02
    BEQ @LAB_PRG14__9580
    DEY
    BEQ @LAB_PRG14__9565
    JSR FUN_PRG14__9593
    LDA CurrentSprites_TickCounters,X
    CMP #$40
    BCC @_return1
    INC CurrentSprites_Phases,X
    LDA #$40
    STA CurrentSprites_TickCounters,X

  @_return1:                                ; [$9564]
    RTS

  @LAB_PRG14__9565:                         ; [$9565]
    LDA #$02
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprite_MoveAndTurnAroundIfNeeded
    DEC CurrentSprites_TickCounters,X
    BNE @LAB_PRG14__957f
    INC CurrentSprites_Phases,X
    LDA #$40
    STA CurrentSprites_TickCounters,X

  @LAB_PRG14__957f:                         ; [$957f]
    RTS

  @LAB_PRG14__9580:                         ; [$9580]
    JSR FUN_PRG14__9593
    LDA CurrentSprites_TickCounters,X
    CMP #$80
    BCC @_return2
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_TickCounters,X

  @_return2:                                ; [$9592]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9593
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9699
;     FUN_PRG14__96d5
;     SpriteBehavior__9538
;============================================================================
FUN_PRG14__9593:                            ; [$9593]
    LDA CurrentSprites_TickCounters,X
    INC CurrentSprites_TickCounters,X
    LDY #$02
    JSR Sprites_CalcYFromGravity
    LDY #$03
    JSR FUN_PRG14__83c1
    LDA a:Arg_DeltaX_Full
    AND #$01
    STA a:Arg_DeltaX_Full
    JMP Sprite_MoveAndTurnAroundIfNeeded


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Yareeka
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80cb]
;============================================================================
SpriteUpdateHandler_Enemy_Yareeka:          ; [$95ae]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__95bc
    LDY #$01

  @LAB_PRG14__95bc:                         ; [$95bc]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__95c0
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a62d]
;============================================================================
SpriteBehavior__95c0:                       ; [$95c0]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__95da
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    LDA #$00
    STA CurrentSprites_Phases,X
    LDA #$d0
    STA CurrentSprites_YPos,X
    LDA #$f0
    STA CurrentSprites_XPos,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__95da:                         ; [$95da]
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__9602
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    INC CurrentSprites_Phases,X
    LDA #$78
    STA CurrentSprites_TickCounters,X
    LDY #$30
    LDA Player_Flags
    AND #$40
    BNE @LAB_PRG14__95f7
    LDY #$d0

  @LAB_PRG14__95f7:                         ; [$95f7]
    TYA
    CLC
    ADC PlayerPosX_Full
    STA CurrentSprites_XPos,X
    LDA PlayerPosY
    STA CurrentSprites_YPos,X

  @_return:                                 ; [$9601]
    RTS

  @LAB_PRG14__9602:                         ; [$9602]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE RETURN_961A
    INC CurrentSprites_Phases,X
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    LDA #$d0
    STA CurrentSprites_YPos,X
    LDA #$f0
    STA CurrentSprites_XPos,X

    ;
    ; XREFS:
    ;     SpriteBehavior__95c0
    ;     SpriteUpdateHandler_Enemy_Magman
    ;
RETURN_961A:                                ; [$961a]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Magman
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80cd]
;============================================================================
SpriteUpdateHandler_Enemy_Magman:           ; [$961b]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    LSR A
    BCC RETURN_961A
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__962e
    INY

  @LAB_PRG14__962e:                         ; [$962e]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9632
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a62f]
;============================================================================
SpriteBehavior__9632:                       ; [$9632]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9644
    LDA #$20
    STA CurrentSprites_StateCounter,X
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9644:                         ; [$9644]
    LDA CurrentSprites_Phases,X
    AND #$03
    STA CurrentSprites_Phases,X
    LDA CurrentSprites_StateCounter,X
    LDY #$04
    JSR Sprites_CalcYFromGravity
    LDY #$05
    JSR CalcVerticalSpriteMovement
    LDA a:Arg_DeltaY_Full
    AND #$01
    STA a:Arg_DeltaY_Full
    JSR Sprite_MoveVertical
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$1f
    BNE @LAB_PRG14__9671
    JSR Sprite_ChangeYDirection

  @LAB_PRG14__9671:                         ; [$9671]
    LDA CurrentSprites_Phases,X
    BNE FUN_PRG14__9699
    LDA #$00
    STA a:Arg_DeltaX_Full
    LDA #$c0
    STA a:Arg_DeltaX_Frac
    JSR Sprite_MoveAndTurnAroundIfNeeded
    JSR FUN_PRG14__831b
    CMP #$20
    BCS @_return
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X

  @_return:                                 ; [$9692]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9693
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9699
;============================================================================
FUN_PRG14__9693:                            ; [$9693]
    LDA #$00
    STA CurrentSprites_Phases,X
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9699
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9632
;============================================================================
FUN_PRG14__9699:                            ; [$9699]
    JSR FUN_PRG14__831b
    CMP #$20
    BCS FUN_PRG14__9693
    LDY CurrentSprites_Phases,X
    CPY #$03
    BEQ FUN_PRG14__96d5
    DEY
    BEQ FUN_PRG14__96b8
    JSR FUN_PRG14__9593
    LDA CurrentSprites_TickCounters,X
    CMP #$40
    BCC @_return
    INC CurrentSprites_Phases,X

  @_return:                                 ; [$96b7]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__96b8
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9699
;============================================================================
FUN_PRG14__96b8:                            ; [$96b8]
    LDA #$02
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprite_MoveAndTurnAroundIfNeeded
    JSR FUN_PRG14__82f8
    CMP #$30
    BCS @_return
    INC CurrentSprites_Phases,X
    LDA #$40
    STA CurrentSprites_TickCounters,X

  @_return:                                 ; [$96d4]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__96d5
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9699
;============================================================================
FUN_PRG14__96d5:                            ; [$96d5]
    JSR FUN_PRG14__9593
    LDA CurrentSprites_TickCounters,X
    CMP #$40
    BCC @_return
    LDA #$01
    STA CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X

  @_return:                                 ; [$96e9]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Unused36
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80cf]
;============================================================================
SpriteUpdateHandler_Enemy_Unused36:         ; [$96ea]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    BNE @LAB_PRG14__96f6
    LDY #$00
    BEQ @LAB_PRG14__96f8

  @LAB_PRG14__96f6:                         ; [$96f6]
    LDY #$02

  @LAB_PRG14__96f8:                         ; [$96f8]
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__9700
    INY

  @LAB_PRG14__9700:                         ; [$9700]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Ikeda
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80d3]
;============================================================================
SpriteUpdateHandler_Enemy_Ikeda:            ; [$9704]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$02
    JSR Sprite_GetPreviousSpritePhase
    LSR A
    BCS @LAB_PRG14__9719
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$04
    BEQ @LAB_PRG14__9719
    INY

  @LAB_PRG14__9719:                         ; [$9719]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__971d
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a631]
;============================================================================
SpriteBehavior__971d:                       ; [$971d]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__972d
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_TickCounters,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__972d:                         ; [$972d]
    JSR Sprites_SetCurrentSpriteCanWalk
    BCC FUN_PRG14__9735
    JMP FUN_PRG14__864a


;============================================================================
; TODO: Document FUN_PRG14__9735
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__971d
;============================================================================
FUN_PRG14__9735:                            ; [$9735]
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$13
    BEQ @LAB_PRG14__974b
    CMP #$56
    BEQ @LAB_PRG14__974b
    CMP #$85
    BEQ @LAB_PRG14__974b
    CMP #$c9
    BNE @LAB_PRG14__974e

  @LAB_PRG14__974b:                         ; [$974b]
    JSR FUN_PRG14__a0a0

  @LAB_PRG14__974e:                         ; [$974e]
    JSR Sprite_MoveTowardsPlayerX
    LDA #$40
    STA a:Arg_DeltaX_Frac
    LDA #$00
    STA a:Arg_DeltaX_Full
    JMP Sprite_MoveAndTurnAroundIfNeeded


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Unused39
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80d5]
;============================================================================
SpriteUpdateHandler_Enemy_Unused39:         ; [$975e]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$10
    BNE @LAB_PRG14__976c
    LDY #$01

  @LAB_PRG14__976c:                         ; [$976c]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Lamprey
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80d7]
;============================================================================
SpriteUpdateHandler_Enemy_Lamprey:          ; [$9770]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$07
    TAY
    LDA CurrentSprite_FlipMask
    EOR #$9793,Y
    STA CurrentSprite_FlipMask
    LDA #$978b,Y
    TAY
    TYA
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Lamprey
;
BYTE_ARRAY_PRG14__978b:                     ; [$978b]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $01                                  ; [2]:
    db $00                                  ; [3]:
    db $01                                  ; [4]:
    db $01                                  ; [5]:
    db $00                                  ; [6]:
    db $01                                  ; [7]:

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Lamprey
;
BYTE_ARRAY_PRG14__9793:                     ; [$9793]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $40                                  ; [2]:
    db $40                                  ; [3]:
    db $40                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $40                                  ; [7]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Monodron
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80db]
;============================================================================
SpriteUpdateHandler_Enemy_Monodron:         ; [$979b]
    JSR CurrentSprite_UpdateFlipMask
    JSR Sprite_GetPreviousSpritePhase
    AND #$03
    TAY
    LDA #$97aa,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Monodron
;
SPRITE_MONODRON_APPEARANCE_PHASES:          ; [$97aa]
    db $00                                  ; [0]:
    db $02                                  ; [1]:
    db $00                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__97ae
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a633]
;============================================================================
SpriteBehavior__97ae:                       ; [$97ae]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__97be
    LDA #$00
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__97be:                         ; [$97be]
    JSR Sprite_MoveTowardsPlayerX
    LDA CurrentSprites_StateCounter,X
    LDY #$04
    JSR Sprites_CalcYFromGravity
    LDY #$05
    JSR CalcVerticalSpriteMovement
    LDA a:Arg_DeltaY_Full
    AND #$01
    STA a:Arg_DeltaY_Full
    JSR Sprite_MoveVertical
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$1f
    BNE @LAB_PRG14__97eb
    LDA CurrentSprites_Flags,X
    EOR #$80
    STA CurrentSprites_Flags,X

  @LAB_PRG14__97eb:                         ; [$97eb]
    LDY #$00
    LDA Player_Flags
    AND #$40
    BEQ @LAB_PRG14__97f4
    INY

  @LAB_PRG14__97f4:                         ; [$97f4]
    LDA PlayerPosX_Full
    CLC
    ADC #$9851,Y
    SEC
    SBC CurrentSprites_XPos,X
    BEQ @LAB_PRG14__9820
    LDA #$00
    ROL A
    STA Temp_00
    LDA CurrentSprites_Flags,X
    PHA
    AND #$fe
    ORA Temp_00
    STA CurrentSprites_Flags,X
    LDA #$01
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    PLA
    STA CurrentSprites_Flags,X

  @LAB_PRG14__9820:                         ; [$9820]
    LDA PlayerPosY
    SEC
    SBC #$18
    SEC
    SBC CurrentSprites_YPos,X
    BEQ @_return
    TAY
    LDA #$00
    ROR A
    STA Temp_00
    CPY #$20
    BCC @_return
    LDA CurrentSprites_Flags,X
    PHA
    AND #$7f
    ORA Temp_00
    STA CurrentSprites_Flags,X
    LDA #$01
    STA a:Arg_DeltaY_Full
    LDA #$00
    STA a:Arg_DeltaY_Frac
    JSR Sprite_MoveVertical
    PLA
    STA CurrentSprites_Flags,X

  @_return:                                 ; [$9850]
    RTS

;
; XREFS:
;     SpriteBehavior__97ae
;
BYTE_ARRAY_PRG14__9851:                     ; [$9851]
    db $20                                  ; [0]:

;
; XREFS:
;     SpriteBehavior__97ae
;
BYTE_ARRAY_PRG14__9851_1_:                  ; [$9852]
    db $e0                                  ; [1]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Unused43
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80dd]
;============================================================================
SpriteUpdateHandler_Enemy_Unused43:         ; [$9853]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__9861
    LDY #$01

  @LAB_PRG14__9861:                         ; [$9861]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9865
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a635]
;============================================================================
SpriteBehavior__9865:                       ; [$9865]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9877
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9877:                         ; [$9877]
    JSR Sprite_MoveTowardsPlayerX
    LDY CurrentSprites_Phases,X
    BEQ @LAB_PRG14__9887
    DEY
    BEQ @LAB_PRG14__988f
    DEY
    BEQ @LAB_PRG14__9897
    BNE @LAB_PRG14__989f

  @LAB_PRG14__9887:                         ; [$9887]
    JSR Sprite_SetMaybeHidden
    LDA #$0b
    JMP @LAB_PRG14__98a7

  @LAB_PRG14__988f:                         ; [$988f]
    JSR Sprite_SetMaybeHidden
    LDA #$3c
    JMP @LAB_PRG14__98a7

  @LAB_PRG14__9897:                         ; [$9897]
    JSR Sprites_HideSprite
    LDA #$0b
    JMP @LAB_PRG14__98a7

  @LAB_PRG14__989f:                         ; [$989f]
    JSR Sprite_SetMaybeHidden
    LDA #$3c
    JMP @LAB_PRG14__98a7

  @LAB_PRG14__98a7:                         ; [$98a7]
    DEC CurrentSprites_TickCounters,X
    BNE RETURN_98B2
    INC CurrentSprites_Phases,X
    STA CurrentSprites_TickCounters,X

    ;
    ; XREFS:
    ;     SpriteBehavior__9865
    ;     SpriteUpdateHandler_Enemy_Tamazutsu
    ;
RETURN_98B2:                                ; [$98b2]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Tamazutsu
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80df]
;============================================================================
SpriteUpdateHandler_Enemy_Tamazutsu:        ; [$98b3]
    LDA CurrentSprites_Phases,X
    AND #$03
    STA CurrentSprites_Phases,X
    JSR CurrentSprite_UpdateFlipMask
    LDY CurrentSprites_Phases,X
    BEQ @LAB_PRG14__98cb
    DEY
    BEQ @LAB_PRG14__98dc
    DEY
    BEQ @LAB_PRG14__98e9
    BNE @LAB_PRG14__98f6

  @LAB_PRG14__98cb:                         ; [$98cb]
    LDA CurrentSprites_TickCounters,X
    CMP #$1e
    BCS RETURN_98B2
    LDY #$00
    AND #$08
    BEQ @LAB_PRG14__9900
    LDY #$02
    BNE @LAB_PRG14__9900

  @LAB_PRG14__98dc:                         ; [$98dc]
    LDA CurrentSprites_TickCounters,X
    LSR A
    LSR A
    TAY
    LDA #$9905,Y
    TAY
    JMP @LAB_PRG14__9900

  @LAB_PRG14__98e9:                         ; [$98e9]
    LDY #$0a
    LDA CurrentSprites_TickCounters,X
    AND #$08
    BEQ @LAB_PRG14__9900
    LDY #$0c
    BNE @LAB_PRG14__9900

  @LAB_PRG14__98f6:                         ; [$98f6]
    LDA CurrentSprites_TickCounters,X
    LSR A
    LSR A
    TAY
    LDA #$9908,Y
    TAY

  @LAB_PRG14__9900:                         ; [$9900]
    TYA
    LSR A
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Tamazutsu
;
BYTE_ARRAY_PRG14__9905:                     ; [$9905]
    db $08                                  ; [0]:
    db $06                                  ; [1]:
    db $04                                  ; [2]:

;
; XREFS:
;     SpriteUpdateHandler_Enemy_Tamazutsu
;
BYTE_ARRAY_PRG14__9908:                     ; [$9908]
    db $04                                  ; [0]:
    db $06                                  ; [1]:
    db $08                                  ; [2]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_Rokusutahn
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80a9]
;============================================================================
SpriteUpdateHandler_Boss_Rokusutahn:        ; [$990b]
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$03
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document FUN_PRG14__9917
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_SomethingFunc__a6ff
;============================================================================
FUN_PRG14__9917:                            ; [$9917]
    LDA #$00
    STA CurrentSprites_HitBoxTypes,X
    SEC
    LDA CurrentSprites_YPos,X
    SBC #$10
    STA a:Sprite12BodyPartHandler_3_
    SBC #$10
    STA a:Sprite12BodyPartHandler_4_
    SBC #$10
    STA a:Sprite12BodyPartHandler_5_
    LDA CurrentSprites_XPos,X
    STA a:Sprite12BodyPartHandler
    STA a:Sprite12BodyPartHandler_1_
    STA a:Sprite12BodyPartHandler_2_
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    LDA #$00
    STA CurrentSprites_Phases,X
    RTS

    ;
    ; XREFS:
    ;     FUN_PRG14__994a
    ;
CALL_FUN_PRG14__9a3c:                       ; [$9947]
    JMP FUN_PRG14__9a3c


;============================================================================
; TODO: Document FUN_PRG14__994a
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     CALL_FUN_PRG14__994a [$PRG14::9a2c]
;============================================================================
FUN_PRG14__994a:                            ; [$994a]
    LDA CurrentSprites_Phases,X
    CMP #$03
    BNE CALL_FUN_PRG14__9a3c
    LDA CurrentSprites_InternalBehaviorStates,X
    AND #$03
    LSR A
    BCS @LAB_PRG14__9983
    BEQ @LAB_PRG14__996f
    INC a:Sprite12BodyPartHandler_2_
    DEC a:Sprite12BodyPartHandler_5_
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    INC CurrentSprites_InternalBehaviorStates,X

  @_return:                                 ; [$996e]
    RTS

  @LAB_PRG14__996f:                         ; [$996f]
    DEC a:Sprite12BodyPartHandler_2_
    INC a:Sprite12BodyPartHandler_5_
    DEC CurrentSprites_TickCounters,X
    BNE @_return1
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    INC CurrentSprites_InternalBehaviorStates,X

  @_return1:                                ; [$9982]
    RTS

  @LAB_PRG14__9983:                         ; [$9983]
    DEC CurrentSprites_TickCounters,X
    BNE @_return2
    INC CurrentSprites_InternalBehaviorStates,X
    LDA #$08
    STA CurrentSprites_TickCounters,X

  @_return2:                                ; [$9990]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9991
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CALL_FUN_PRG14__9a2f [$PRG14::9a2f]
;============================================================================
FUN_PRG14__9991:                            ; [$9991]
    LDA CurrentSprites_TickCounters,X
    BEQ FUN_PRG14__99f3
    LDA CurrentSprites_InternalBehaviorStates,X
    AND #$0f
    BNE @LAB_PRG14__99dc
    LDA CurrentSprites_InternalBehaviorStates,X
    BNE @LAB_PRG14__99b6
    LDA CurrentSprites_XPos,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA Temp_00
    LDA CurrentSprites_YPos,X
    AND #$f0
    ORA Temp_00
    STA a:BYTE_03cf
    JMP @LAB_PRG14__99d1

  @LAB_PRG14__99b6:                         ; [$99b6]
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$03
    TAY
    DEY
    LDA Sprite12BodyPartHandler,Y
    LSR A
    LSR A
    LSR A
    LSR A
    STA Temp_00
    LDA #$037c,Y
    AND #$f0
    ORA Temp_00
    STA a:BYTE_03cf

  @LAB_PRG14__99d1:                         ; [$99d1]
    LDY Area_CurrentArea
    LDA #$99ef,Y
    STA a:BYTE_03ce
    JSR #$d7b0

  @LAB_PRG14__99dc:                         ; [$99dc]
    LDX a:CurrentSpriteIndex
    INC CurrentSprites_InternalBehaviorStates,X
    LDA CurrentSprites_InternalBehaviorStates,X
    AND #$c0
    BEQ @_return
    LDA #$ff
    STA CurrentSprites_Entities,X

  @_return:                                 ; [$99ee]
    RTS

;
; XREFS:
;     FUN_PRG14__9991
;
BYTE_ARRAY_PRG14__99ef:                     ; [$99ef]
    db $00                                  ; [0]:
    db $08                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:


;============================================================================
; TODO: Document FUN_PRG14__99f3
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9991
;============================================================================
FUN_PRG14__99f3:                            ; [$99f3]
    LDY #$03
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$0f
    CMP a:Sprite12BodyPartHandler
    BCC @LAB_PRG14__9a03
    INC a:Sprite12BodyPartHandler
    DEY

  @LAB_PRG14__9a03:                         ; [$9a03]
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$1f
    CMP a:Sprite12BodyPartHandler_1_
    BCC @LAB_PRG14__9a11
    INC a:Sprite12BodyPartHandler_1_
    DEY

  @LAB_PRG14__9a11:                         ; [$9a11]
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$2f
    CMP a:Sprite12BodyPartHandler_2_
    BCC @LAB_PRG14__9a1f
    INC a:Sprite12BodyPartHandler_2_
    DEY

  @LAB_PRG14__9a1f:                         ; [$9a1f]
    CPY #$03
    BNE @LAB_PRG14__9a2b
    INC CurrentSprites_TickCounters,X
    LDA #$00
    STA CurrentSprites_InternalBehaviorStates,X

  @LAB_PRG14__9a2b:                         ; [$9a2b]
    RTS

    ;
    ; XREFS:
    ;     SpriteBehavior__9a32
    ;
CALL_FUN_PRG14__994a:                       ; [$9a2c]
    JMP FUN_PRG14__994a

    ;
    ; XREFS:
    ;     SpriteBehavior__9a32
    ;
CALL_FUN_PRG14__9a2f:                       ; [$9a2f]
    JMP FUN_PRG14__9991


;============================================================================
; TODO: Document SpriteBehavior__9a32
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5f3]
;============================================================================
SpriteBehavior__9a32:                       ; [$9a32]
    LDY CurrentSprites_Phases,X
    BMI CALL_FUN_PRG14__9a2f
    LDA CurrentSprites_StateCounter,X
    BNE CALL_FUN_PRG14__994a

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__9a3c
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__994a
;============================================================================
FUN_PRG14__9a3c:                            ; [$9a3c]
    LDA CurrentSprites_Phases,X
    AND #$03
    STA CurrentSprites_Phases,X
    ASL A
    TAY
    LDA #$9a50,Y
    PHA
    LDA #$9a4f,Y
    PHA
    RTS

;
; XREFS:
;     FUN_PRG14__9a3c
;
USHORT_ARRAY_PRG14__9a4f:                   ; [$9a4f]
    dw $9a56                                ; [0]:
    dw $9a79                                ; [1]:
    dw $9a79                                ; [2]:
    dw $9a56                                ; [3]:


;============================================================================
; TODO: Document FUN_PRG14__9a57
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__9a57:                            ; [$9a57]
    JSR FUN_PRG14__9a87
    LDX #$9a91,Y
    DEX
    INC Sprite12BodyPartHandler,X

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__9a61
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9a7a
;============================================================================
FUN_PRG14__9a61:                            ; [$9a61]
    LDX a:CurrentSpriteIndex
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$40
    BCC @_return
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    JMP FUN_PRG14__9aa1

  @_return:                                 ; [$9a79]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9a7a
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__9a7a:                            ; [$9a7a]
    JSR FUN_PRG14__9a87
    LDX #$9a99,Y
    DEX
    DEC Sprite12BodyPartHandler,X
    JMP FUN_PRG14__9a61


;============================================================================
; TODO: Document FUN_PRG14__9a87
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9a57
;     FUN_PRG14__9a7a
;============================================================================
FUN_PRG14__9a87:                            ; [$9a87]
    LDA CurrentSprites_TickCounters,X
    LSR A
    LSR A
    LSR A
    AND #$07
    TAY
    RTS

;
; XREFS:
;     FUN_PRG14__9a57
;
BYTE_ARRAY_PRG14__9a91:                     ; [$9a91]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $03                                  ; [3]:
    db $02                                  ; [4]:
    db $03                                  ; [5]:
    db $03                                  ; [6]:
    db $00                                  ; [7]:

;
; XREFS:
;     FUN_PRG14__9a7a
;
BYTE_ARRAY_PRG14__9a99:                     ; [$9a99]
    db $00                                  ; [0]:
    db $03                                  ; [1]:
    db $03                                  ; [2]:
    db $02                                  ; [3]:
    db $03                                  ; [4]:
    db $02                                  ; [5]:
    db $01                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; TODO: Document FUN_PRG14__9aa1
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9a61
;============================================================================
FUN_PRG14__9aa1:                            ; [$9aa1]
    LDA CurrentSprites_XPos,X
    SEC
    SBC PlayerPosX_Full
    BCS @LAB_PRG14__9aac
    EOR #$ff
    ADC #$01

  @LAB_PRG14__9aac:                         ; [$9aac]
    CMP #$40
    BCS @LAB_PRG14__9ac0
    LDA #$01
    STA CurrentSprites_StateCounter,X
    LDA #$00
    STA CurrentSprites_InternalBehaviorStates,X
    LDA #$08
    STA CurrentSprites_TickCounters,X
    RTS

  @LAB_PRG14__9ac0:                         ; [$9ac0]
    LDA #$00
    STA CurrentSprites_StateCounter,X
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9ac6
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__9ac6:                            ; [$9ac6]
    LDA #$80
    STA CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    LDA CurrentSprites_YPos,X
    SEC
    SBC #$30
    STA a:Sprite12BodyPartHandler_5_
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_Unused18
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80ab]
;============================================================================
SpriteUpdateHandler_Enemy_Unused18:         ; [$9adc]
    JSR CurrentSprite_UpdateFlipMask
    LDA #$04
    JSR Sprite_EnterNextAppearancePhase
    LDX a:CurrentSpriteIndex
    LDA a:Sprite12BodyPartHandler
    STA Maybe_Arg_CurrentSprite_PosX
    LDA a:Sprite12BodyPartHandler_3_
    STA Maybe_Arg_CurrentSprite_PosY
    LDA CurrentSprites_PPUAddrs,X
    STA Maybe_CurrentSprite_PPUOffset
    LDA #$04
    JSR Sprite_EnterNextAppearancePhase
    LDX a:CurrentSpriteIndex
    LDA a:Sprite12BodyPartHandler_1_
    STA Maybe_Arg_CurrentSprite_PosX
    LDA a:Sprite12BodyPartHandler_4_
    STA Maybe_Arg_CurrentSprite_PosY
    LDA CurrentSprites_PPUAddrs,X
    STA Maybe_CurrentSprite_PPUOffset
    LDA #$04
    JSR Sprite_EnterNextAppearancePhase
    LDX a:CurrentSpriteIndex
    LDA a:Sprite12BodyPartHandler_2_
    STA Maybe_Arg_CurrentSprite_PosX
    LDA a:Sprite12BodyPartHandler_5_
    STA Maybe_Arg_CurrentSprite_PosY
    LDA CurrentSprites_PPUAddrs,X
    STA Maybe_CurrentSprite_PPUOffset
    LDA CurrentSprites_StateCounter,X
    BNE @LAB_PRG14__9b36
    LDY #$02
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__9b41
    LDY #$03
    BNE @LAB_PRG14__9b41

  @LAB_PRG14__9b36:                         ; [$9b36]
    LDY #$00
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__9b41
    LDY #$01

  @LAB_PRG14__9b41:                         ; [$9b41]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document FUN_PRG14__9b45
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9b83
;============================================================================
FUN_PRG14__9b45:                            ; [$9b45]
    LDA a:SpriteUpdateCounter
    AND #$3f
    CMP #$20
    BNE @LAB_PRG14__9b68
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$9b81,Y
    STA a:BYTE_0384
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$20
    STA a:BYTE_0385
    JSR FUN_PRG14__a0f6

  @LAB_PRG14__9b68:                         ; [$9b68]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    LDA #$01
    STA CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    JSR Sprite_MoveTowardsPlayerX

  @_return:                                 ; [$9b80]
    RTS

;
; XREFS:
;     FUN_PRG14__9b45
;
BYTE_ARRAY_PRG14__9b81:                     ; [$9b81]
    db $10                                  ; [0]:
    db $00                                  ; [1]:


;============================================================================
; TODO: Document SpriteBehavior__9b83
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5fb]
;============================================================================
SpriteBehavior__9b83:                       ; [$9b83]
    LDA a:Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9b9a
    LDA #$03
    STA CurrentSprites_HitBoxTypes,X
    LDA #$1e
    STA CurrentSprites_TickCounters,X
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9b9a:                         ; [$9b9a]
    LDY CurrentSprites_Phases,X
    BEQ @LAB_PRG14__9ba8
    DEY
    BEQ @LAB_PRG14__9bbc
    DEY
    BNE FUN_PRG14__9b45
    JMP @LAB_PRG14__9c0e

  @LAB_PRG14__9ba8:                         ; [$9ba8]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X

  @_return:                                 ; [$9bbb]
    RTS

  @LAB_PRG14__9bbc:                         ; [$9bbc]
    JSR FUN_PRG14__9c43
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X
    LDA CurrentSprites_YPos,X
    CMP #$30
    BCC @LAB_PRG14__9bfe
    LDA CurrentSprites_StateCounter,X
    BPL @LAB_PRG14__9bde
    LDA #$04
    STA a:Arg_DeltaY_Full
    LDA #$00
    STA a:Arg_DeltaY_Frac
    BEQ @LAB_PRG14__9be8

  @LAB_PRG14__9bde:                         ; [$9bde]
    LDY #$03
    JSR Sprites_CalcYFromGravity
    LDY #$05
    JSR CalcVerticalSpriteMovement

  @LAB_PRG14__9be8:                         ; [$9be8]
    JSR Sprite_MoveVertical
    BCS @_return2
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$1f
    BNE @_return1
    LDA #$ff
    STA CurrentSprites_StateCounter,X

  @_return1:                                ; [$9bfc]
    RTS

  @_return2:                                ; [$9bfd]
    RTS

  @LAB_PRG14__9bfe:                         ; [$9bfe]
    LDA #$00
    STA CurrentSprites_TickCounters,X
    LDA #$ff
    STA CurrentSprites_StateCounter,X
    INC CurrentSprites_Phases,X
    JMP Sprite_MoveTowardsPlayerX

  @LAB_PRG14__9c0e:                         ; [$9c0e]
    JSR FUN_PRG14__9c43
    LDA CurrentSprites_Flags,X
    ORA #$80
    STA CurrentSprites_Flags,X
    LDA CurrentSprites_StateCounter,X
    LDY #$02
    JSR CalcVerticalSpriteMovement
    JSR Sprite_MoveVertical
    BCS @LAB_PRG14__9c31
    LDA CurrentSprites_StateCounter,X
    SEC
    SBC #$04
    STA CurrentSprites_StateCounter,X
    BCS @_return3

  @LAB_PRG14__9c31:                         ; [$9c31]
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_InternalBehaviorStates,X
    JSR Sprite_MoveTowardsPlayerX

  @_return3:                                ; [$9c42]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9c43
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9b83
;============================================================================
FUN_PRG14__9c43:                            ; [$9c43]
    LDA #$01
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprite_MoveAndTurnAroundIfNeeded
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_Ripasheiku
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80e1]
;============================================================================
SpriteUpdateHandler_Boss_Ripasheiku:        ; [$9c51]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__9c6a
    CMP #$03
    BEQ @LAB_PRG14__9c6e
    LDY #$01
    LDA a:SpriteUpdateCounter
    AND #$08
    BEQ @LAB_PRG14__9c6a
    LDY #$02

  @LAB_PRG14__9c6a:                         ; [$9c6a]
    TYA
    JMP Sprite_EnterNextAppearancePhase

  @LAB_PRG14__9c6e:                         ; [$9c6e]
    LDY #$01
    LDA a:SpriteUpdateCounter
    AND #$20
    BEQ @LAB_PRG14__9c6a
    LDY #$03
    BNE @LAB_PRG14__9c6a


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_Zoradohna
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80e3]
;============================================================================
SpriteUpdateHandler_Boss_Zoradohna:         ; [$9c7b]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9c89
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5ff]
;============================================================================
SpriteBehavior__9c89:                       ; [$9c89]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9c9e
    LDA #$02
    STA CurrentSprites_HitBoxTypes,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9c9e:                         ; [$9c9e]
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__9cb5
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$14
    BCC @_return1
    INC CurrentSprites_Phases,X
    JSR Sprite_MoveTowardsPlayerX

  @_return1:                                ; [$9cb4]
    RTS

  @LAB_PRG14__9cb5:                         ; [$9cb5]
    LDA CurrentSprites_TickCounters,X
    LDY #$02
    JSR Sprites_CalcYFromGravity
    LDY #$02
    JSR FUN_PRG14__83c1
    JSR Sprites_Something_SomethingAndMoveHoriz
    INC CurrentSprites_TickCounters,X
    AND #$7f
    BNE @_return2
    JSR Sprite_MoveTowardsPlayerX

  @_return2:                                ; [$9ccf]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_Borabohra
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80e5]
;============================================================================
SpriteUpdateHandler_Boss_Borabohra:         ; [$9cd0]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__9ce2
    LDA CurrentSprites_TickCounters,X
    LSR A
    LSR A
    TAY
    JMP @LAB_PRG14__9ced

  @LAB_PRG14__9ce2:                         ; [$9ce2]
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$06
    CLC
    ADC #$08
    TAY

  @LAB_PRG14__9ced:                         ; [$9ced]
    TYA
    LSR A
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9cf2
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a601]
;============================================================================
SpriteBehavior__9cf2:                       ; [$9cf2]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9d07
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_TickCounters,X
    LDA #$04
    STA CurrentSprites_HitBoxTypes,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9d07:                         ; [$9d07]
    LDA CurrentSprites_Phases,X
    CMP #$01
    BCS @LAB_PRG14__9d2b
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$40
    BCC @_return1
    JSR Sprites_HasMaxOnScreen
    BCS @_return1
    JSR FUN_PRG14__9d78
    BCS @_return1
    INC CurrentSprites_Phases,X
    LDA #$12
    JSR #$d0e4

  @_return1:                                ; [$9d2a]
    RTS

  @LAB_PRG14__9d2b:                         ; [$9d2b]
    LDA a:SpriteUpdateCounter
    AND #$07
    BNE @_return2
    INC CurrentSprites_Phases,X
    LDA CurrentSprites_Phases,X
    CMP #$05
    BCC @LAB_PRG14__9d45
    LDA #$00
    STA CurrentSprites_Phases,X
    STA CurrentSprites_TickCounters,X

  @_return2:                                ; [$9d44]
    RTS

  @LAB_PRG14__9d45:                         ; [$9d45]
    CMP #$03
    BNE @_return2
    JSR Sprites_HasMaxOnScreen
    BCS @_return2
    LDA CurrentSprites_YPos,X
    ADC #$10
    STA CurrentSprites_YPos,Y
    LDA CurrentSprites_XPos,X
    ADC #$08
    STA CurrentSprites_XPos,Y
    LDA #$9e
    STA CurrentSprites_PPUAddrs,Y
    LDA #$00
    STA CurrentSprites_Flags,Y
    LDA #$09
    STA CurrentSprites_Entities,Y
    TAX
    LDA #$b5a9,X
    STA CurrentSprites_HP,Y
    LDX a:CurrentSpriteIndex
    JMP Sprite_Maybe_ResetState


;============================================================================
; TODO: Document FUN_PRG14__9d78
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     SpriteBehavior__9cf2
;============================================================================
FUN_PRG14__9d78:                            ; [$9d78]
    LDY #$07
    LDA #$00
    STA Temp_00

  @LAB_PRG14__9d7e:                         ; [$9d7e]
    LDA CurrentSprites_Entities,Y
    CMP #$09
    BNE @LAB_PRG14__9d8f
    INC Temp_00
    LDA Temp_00
    CMP #$03
    BCC @LAB_PRG14__9d8f
    SEC
    RTS

  @LAB_PRG14__9d8f:                         ; [$9d8f]
    DEY
    BPL @LAB_PRG14__9d7e
    CLC
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_Pakukame
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80e7]
;============================================================================
SpriteUpdateHandler_Boss_Pakukame:          ; [$9d94]
    LDY #$00
    LDA CurrentSprites_Phases,X
    BEQ @LAB_PRG14__9d9f
    LDY CurrentSprites_Phases,X
    DEY

  @LAB_PRG14__9d9f:                         ; [$9d9f]
    LDA #$9da5,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Boss_Pakukame
;
BYTE_ARRAY_PRG14__9da5:                     ; [$9da5]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__9da9
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a603]
;============================================================================
SpriteBehavior__9da9:                       ; [$9da9]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9dbe
    LDA #$04
    STA CurrentSprites_HitBoxTypes,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9dbe:                         ; [$9dbe]
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__9de1
    DEC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    AND #$0f
    BNE @LAB_PRG14__9de0
    JSR Sprites_HasMaxOnScreen
    BCS @LAB_PRG14__9de0
    JSR FUN_PRG14__9df7
    BCS @LAB_PRG14__9de0
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X

  @LAB_PRG14__9de0:                         ; [$9de0]
    RTS

  @LAB_PRG14__9de1:                         ; [$9de1]
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$20
    BCC @_return
    INC CurrentSprites_Phases,X
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    JMP FUN_PRG14__9e13

  @_return:                                 ; [$9df6]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9df7
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     SpriteBehavior__9da9
;============================================================================
FUN_PRG14__9df7:                            ; [$9df7]
    LDY #$07
    LDA #$00
    STA Temp_00

  @LAB_PRG14__9dfd:                         ; [$9dfd]
    LDA CurrentSprites_Entities,Y
    CMP #$03
    BNE @LAB_PRG14__9e0e
    INC Temp_00
    LDA Temp_00
    CMP #$04
    BCC @LAB_PRG14__9e0e
    SEC
    RTS

  @LAB_PRG14__9e0e:                         ; [$9e0e]
    DEY
    BPL @LAB_PRG14__9dfd
    CLC

    ;
    ; XREFS:
    ;     FUN_PRG14__9e13
    ;
RETURN_9E12:                                ; [$9e12]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__9e13
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9da9
;============================================================================
FUN_PRG14__9e13:                            ; [$9e13]
    JSR Sprites_HasMaxOnScreen
    BCS RETURN_9E12
    LDA #$03
    STA CurrentSprites_Entities,Y
    LDA #$00
    STA CurrentSprites_Phases,Y
    STA CurrentSprites_Flags,Y
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,Y
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$10
    STA Temp_00
    LDA PlayerPosX_Full
    CMP CurrentSprites_XPos,X
    BCC @LAB_PRG14__9e3e
    CMP Temp_00
    BCS @LAB_PRG14__9e3e
    SEC
    SBC #$10

  @LAB_PRG14__9e3e:                         ; [$9e3e]
    STA CurrentSprites_XPos,Y
    LDA #$20
    STA CurrentSprites_YPos,Y
    LDA CurrentSprites_PPUAddrs,X
    STA CurrentSprites_PPUAddrs,Y
    JMP Sprite_Maybe_ResetState


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_Zorugeriru
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80e9]
;============================================================================
SpriteUpdateHandler_Boss_Zorugeriru:        ; [$9e4f]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_Phases,X
    LSR A
    BCC @LAB_PRG14__9e63
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    TAY

  @LAB_PRG14__9e63:                         ; [$9e63]
    LDA #$9e69,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Boss_Zorugeriru
;
BYTE_ARRAY_PRG14__9e69:                     ; [$9e69]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__9e6d
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5ed]
;============================================================================
SpriteBehavior__9e6d:                       ; [$9e6d]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9e82
    LDA #$00
    STA CurrentSprites_HitBoxTypes,X
    LDA #$00
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9e82:                         ; [$9e82]
    LDY CurrentSprites_Phases,X
    DEY
    BEQ @LAB_PRG14__9ebc
    DEY
    BEQ @LAB_PRG14__9ed9
    LDA CurrentSprites_Flags,X
    ORA #$80
    STA CurrentSprites_Flags,X
    LDA CurrentSprites_StateCounter,X
    LDY #$05
    JSR CalcVerticalSpriteMovement
    JSR Sprite_MoveVertical
    BCS @LAB_PRG14__9eae
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    CMP #$41
    BCC @LAB_PRG14__9ebb
    DEC CurrentSprites_StateCounter,X
    RTS

  @LAB_PRG14__9eae:                         ; [$9eae]
    INC CurrentSprites_Phases,X
    LDA #$05
    STA CurrentSprites_TickCounters,X
    LDA #$07
    JSR #$d0e4

  @LAB_PRG14__9ebb:                         ; [$9ebb]
    RTS

  @LAB_PRG14__9ebc:                         ; [$9ebc]
    LDA CurrentSprites_TickCounters,X
    AND #$01
    ASL A
    ASL A
    SEC
    SBC #$02
    CLC
    ADC CurrentSprites_YPos,X
    STA CurrentSprites_YPos,X
    DEC CurrentSprites_TickCounters,X
    BNE @LAB_PRG14__9ed8
    LDA #$0f
    STA CurrentSprites_TickCounters,X
    INC CurrentSprites_Phases,X

  @LAB_PRG14__9ed8:                         ; [$9ed8]
    RTS

  @LAB_PRG14__9ed9:                         ; [$9ed9]
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    LDA #$ff
    STA CurrentSprites_Entities,X

  @_return:                                 ; [$9ee3]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Garbled03
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::808d]
;============================================================================
SpriteUpdateHandler_Garbled03:              ; [$9ee4]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$03
    LDA CurrentSprites_Phases,X
    CMP #$02
    BCC @LAB_PRG14__9eff
    LDA CurrentSprites_TickCounters,X
    CMP #$0a
    BCS @LAB_PRG14__9eff
    LDY #$03
    CMP #$05
    BCS @LAB_PRG14__9eff
    LDY #$05

  @LAB_PRG14__9eff:                         ; [$9eff]
    TYA
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__9f03
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a605]
;============================================================================
SpriteBehavior__9f03:                       ; [$9f03]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__9f1d
    LDA #$05
    STA CurrentSprites_HitBoxTypes,X
    LDA #$ff
    STA CurrentSprites_StateCounter,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__9f1d:                         ; [$9f1d]
    LDA CurrentSprites_Phases,X
    AND #$03
    TAY
    BEQ @LAB_PRG14__9f2e
    DEY
    BEQ @LAB_PRG14__9f65
    DEY
    BEQ SpriteBehavior__9f03__MoveDown
    JMP @LAB_PRG14__9f86

  @LAB_PRG14__9f2e:                         ; [$9f2e]
    LDA #$01
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    LDA CurrentSprites_Flags,X
    ORA #$80
    STA CurrentSprites_Flags,X
    LDA CurrentSprites_StateCounter,X
    LDY #$02
    JSR CalcVerticalSpriteMovement
    JSR Sprite_MoveVertical
    BCS @LAB_PRG14__9f5c
    LDA CurrentSprites_StateCounter,X
    SEC
    SBC #$02
    STA CurrentSprites_StateCounter,X
    BCC @LAB_PRG14__9f5c
    RTS

  @LAB_PRG14__9f5c:                         ; [$9f5c]
    INC CurrentSprites_Phases,X
    LDA #$3c
    STA CurrentSprites_TickCounters,X
    RTS

  @LAB_PRG14__9f65:                         ; [$9f65]
    LDA a:SpriteUpdateCounter
    AND #$0f
    BNE @LAB_PRG14__9f86
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$9f9c,Y
    STA a:BYTE_0384
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$04
    STA a:BYTE_0385
    JSR FUN_PRG14__a0f6

  @LAB_PRG14__9f86:                         ; [$9f86]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE @_return1
    INC CurrentSprites_Phases,X
    LDA #$ff
    STA CurrentSprites_StateCounter,X
    LDA #$00
    STA CurrentSprites_TickCounters,X

  @_return1:                                ; [$9f9b]
    RTS

;
; XREFS:
;     SpriteBehavior__9f03
;
BYTE_ARRAY_PRG14__9f9c:                     ; [$9f9c]
    db $00                                  ; [0]:
    db $30                                  ; [1]:


;============================================================================
; TODO: Document SpriteBehavior__9f03__MoveDown
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9f03
;============================================================================
SpriteBehavior__9f03__MoveDown:             ; [$9f9e]
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X
    LDA #$00
    STA a:Arg_DeltaY_Frac
    LDA #$01
    STA a:Arg_DeltaY_Full
    JSR Sprite_MoveVertical
    BCS @LAB_PRG14__9fbb
    LDA CurrentSprites_YPos,X
    CMP #$10
    BCS @LAB_PRG14__9fc3

  @LAB_PRG14__9fbb:                         ; [$9fbb]
    INC CurrentSprites_Phases,X
    LDA #$1e
    STA CurrentSprites_TickCounters,X

  @LAB_PRG14__9fc3:                         ; [$9fc3]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_KingGrieve
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80eb]
;============================================================================
SpriteUpdateHandler_Boss_KingGrieve:        ; [$9fc4]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$02
    LDA CurrentSprites_Phases,X
    AND #$03
    BEQ @LAB_PRG14__9fd9
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    TAY

  @LAB_PRG14__9fd9:                         ; [$9fd9]
    LDA #$9fdf,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Boss_KingGrieve
;
BYTE_ARRAY_PRG14__9fdf:                     ; [$9fdf]
    db $00                                  ; [0]:
    db $01                                  ; [1]:

;
; XREFS:
;     SpriteUpdateHandler_Boss_KingGrieve
;
BYTE_ARRAY_PRG14__9fdf_2_:                  ; [$9fe1]
    db $02                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__9fe3
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a607]
;============================================================================
SpriteBehavior__9fe3:                       ; [$9fe3]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a007
    LDA #$06
    STA CurrentSprites_HitBoxTypes,X
    LDA #$00
    STA CurrentSprites_InternalBehaviorStates,X
    STA CurrentSprites_StateCounter,X
    STA CurrentSprites_Phases,X
    LDA #$14
    STA CurrentSprites_TickCounters,X
    JSR Sprite_MoveTowardsPlayerX
    JSR Sprite_EnableBehavior
    LDA #$0a
    STA CurrentMusic

  @LAB_PRG14__a007:                         ; [$a007]
    JSR Sprite_MoveTowardsPlayerX
    LDA CurrentSprites_Phases,X
    LSR A
    BCS @LAB_PRG14__a053
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$07
    BNE @LAB_PRG14__a052
    INC CurrentSprites_InternalBehaviorStates,X
    LDA CurrentSprites_InternalBehaviorStates,X
    CMP #$0a
    BCC @LAB_PRG14__a029
    LDA #$00
    STA CurrentSprites_InternalBehaviorStates,X

  @LAB_PRG14__a029:                         ; [$a029]
    PHA
    CMP #$03
    BEQ @LAB_PRG14__a032
    CMP #$08
    BNE @LAB_PRG14__a035

  @LAB_PRG14__a032:                         ; [$a032]
    JSR FUN_PRG14__a077

  @LAB_PRG14__a035:                         ; [$a035]
    PLA
    TAY
    LDA #$a064,Y
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    DEC CurrentSprites_TickCounters,X
    BNE @LAB_PRG14__a052
    INC CurrentSprites_Phases,X
    LDA #$1e
    STA CurrentSprites_TickCounters,X

  @LAB_PRG14__a052:                         ; [$a052]
    RTS

  @LAB_PRG14__a053:                         ; [$a053]
    JSR Sprite_MoveTowardsPlayerX
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    INC CurrentSprites_Phases,X
    LDA #$14
    STA CurrentSprites_TickCounters,X

  @_return:                                 ; [$a063]
    RTS

;
; XREFS:
;     SpriteBehavior__9fe3
;
BYTE_ARRAY_PRG14__a064:                     ; [$a064]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $08                                  ; [2]:
    db $08                                  ; [3]:
    db $08                                  ; [4]:
    db $00                                  ; [5]:
    db $00                                  ; [6]:
    db $08                                  ; [7]:
    db $08                                  ; [8]:
    db $08                                  ; [9]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Boss_ShadowEura
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80ed]
;============================================================================
SpriteUpdateHandler_Boss_ShadowEura:        ; [$a06e]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_InternalBehaviorStates,X
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document FUN_PRG14__a077
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__9fe3
;============================================================================
FUN_PRG14__a077:                            ; [$a077]
    LDA CurrentSprites_Flags,X
    AND #$01
    TAY
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$a091,Y
    STA a:BYTE_0384
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$10
    STA a:BYTE_0385
    JMP FUN_PRG14__a12d

;
; XREFS:
;     FUN_PRG14__a077
;
BYTE_ARRAY_PRG14__a091:                     ; [$a091]
    db $00                                  ; [0]:
    db $20                                  ; [1]:


;============================================================================
; TODO: Document FUN_PRG14__a093
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__91b3
;============================================================================
FUN_PRG14__a093:                            ; [$a093]
    JSR Sprites_HasMaxOnScreen
    BCS RETURN_A0CA
    LDA CurrentSprites_YPos,X
    STA CurrentSprites_YPos,Y
    JMP FUN_PRG14__a0ad


;============================================================================
; TODO: Document FUN_PRG14__a0a0
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9735
;     SpriteBehavior__9060
;     SpriteBehavior__9129
;============================================================================
FUN_PRG14__a0a0:                            ; [$a0a0]
    JSR Sprites_HasMaxOnScreen
    BCS RETURN_A0CA
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$0c
    STA CurrentSprites_YPos,Y

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__a0ad
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a093
;============================================================================
FUN_PRG14__a0ad:                            ; [$a0ad]
    LDA #$51
    STA CurrentSprites_Entities,Y
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$04
    STA CurrentSprites_XPos,Y
    LDA CurrentSprites_Flags,X
    AND #$01
    STA CurrentSprites_Flags,Y
    LDA #$00
    STA CurrentSprites_PPUAddrs,Y
    JMP Sprite_Maybe_ResetState

    ;
    ; XREFS:
    ;     FUN_PRG14__a093
    ;     FUN_PRG14__a0a0
    ;
RETURN_A0CA:                                ; [$a0ca]
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a0cb
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a61d]
;     _thunk_SpriteBehavior__a0cb
;============================================================================
SpriteBehavior__a0cb:                       ; [$a0cb]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a0d3
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a0d3:                         ; [$a0d3]
    LDA #$02
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR FUN_PRG14__8427
    BCC @_return
    LDA #$ff
    STA CurrentSprites_Entities,X

  @_return:                                 ; [$a0e7]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_TODO_Garbled_81
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8129]
;============================================================================
SpriteUpdateHandler_TODO_Garbled_81:        ; [$a0e8]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document FUN_PRG14__a0f6
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9b45
;     SpriteBehavior__9f03
;============================================================================
FUN_PRG14__a0f6:                            ; [$a0f6]
    JSR Sprites_HasMaxOnScreen
    BCS @_return
    LDA #$0a
    STA CurrentSprites_Entities,Y
    LDA a:BYTE_0384
    STA CurrentSprites_XPos,Y
    LDA a:BYTE_0385
    STA CurrentSprites_YPos,Y
    LDA CurrentSprites_Flags,X
    AND #$01
    STA CurrentSprites_Flags,Y
    LDA #$80
    STA CurrentSprites_PPUAddrs,Y
    JMP Sprite_Maybe_ResetState

  @_return:                                 ; [$a11c]
    RTS


;============================================================================
; TODO: Document _thunk_SpriteBehavior__a0cb
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a61f]
;============================================================================
_thunk_SpriteBehavior__a0cb:                ; [$a11d]
    JMP SpriteBehavior__a0cb


;============================================================================
; TODO: Document SpriteUpdateHandler_TODO_Garbled10
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::809b]
;============================================================================
SpriteUpdateHandler_TODO_Garbled10:         ; [$a120]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document FUN_PRG14__a12d
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a077
;============================================================================
FUN_PRG14__a12d:                            ; [$a12d]
    JSR Sprites_HasMaxOnScreen
    BCS @_return
    LDA #$53
    STA CurrentSprites_Entities,Y
    LDA a:BYTE_0384
    STA CurrentSprites_XPos,Y
    LDA a:BYTE_0385
    STA CurrentSprites_YPos,Y
    LDA CurrentSprites_Flags,X
    AND #$01
    STA CurrentSprites_Flags,Y
    LDA #$00
    STA CurrentSprites_PPUAddrs,Y
    JMP Sprite_Maybe_ResetState

  @_return:                                 ; [$a153]
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a154
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a621]
;============================================================================
SpriteBehavior__a154:                       ; [$a154]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a183
    LDA #$00
    STA CurrentSprites_InternalBehaviorStates,X
    LDA CurrentSprites_Flags,X
    AND #$01
    PHA
    JSR FUN_PRG14__8329
    ASL CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    ROL CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    ASL CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    ROL CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    PLA
    STA Temp_00
    LDA CurrentSprites_Flags,X
    AND #$fe
    ORA Temp_00
    STA CurrentSprites_Flags,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a183:                         ; [$a183]
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:Arg_DeltaX_Full
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    BCS @LAB_PRG14__a1bc
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    STA a:Arg_DeltaY_Full
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    STA a:Arg_DeltaY_Frac
    JSR Sprite_MoveVertical
    BCS @LAB_PRG14__a1bc
    LDA a:SpriteUpdateCounter
    AND #$03
    BNE @_return
    INC CurrentSprites_InternalBehaviorStates,X
    LDA CurrentSprites_InternalBehaviorStates,X
    CMP #$03
    BCC @_return
    LDA #$00
    STA CurrentSprites_InternalBehaviorStates,X

  @_return:                                 ; [$a1bb]
    RTS

  @LAB_PRG14__a1bc:                         ; [$a1bc]
    LDA #$ff
    STA CurrentSprites_Entities,X
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_TODO_Unknown_83
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::812d]
;============================================================================
SpriteUpdateHandler_TODO_Unknown_83:        ; [$a1c2]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA CurrentSprites_InternalBehaviorStates,X
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document FUN_PRG14__a1cc
;
; INPUTS:
;     A
;     X
;     Y
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__a1cc:                            ; [$a1cc]
    JSR Sprites_HasMaxOnScreen
    BCS @_return
    LDA #$54
    STA CurrentSprites_Entities,Y
    LDA a:BYTE_0384
    STA CurrentSprites_XPos,Y
    LDA a:BYTE_0385
    STA CurrentSprites_YPos,Y
    LDA CurrentSprites_Flags,X
    AND #$01
    ORA #$80
    STA CurrentSprites_Flags,Y
    LDA #$00
    STA CurrentSprites_PPUAddrs,Y
    JMP Sprite_Maybe_ResetState

  @_return:                                 ; [$a1f4]
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler_TODO_Unknown84
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::812f]
;============================================================================
SpriteUpdateHandler_TODO_Unknown84:         ; [$a1f5]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$03
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document Sprite_Maybe_ResetState
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__9e13
;     FUN_PRG14__a0ad
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     SpriteBehavior__9cf2
;     Sprite_SomethingSpawnMagic
;============================================================================
Sprite_Maybe_ResetState:                    ; [$a202]
    TXA
    PHA
    LDA CurrentSprites_Entities,Y
    ASL A
    TAX
    LDA #$ad2d,X
    STA CurrentSprites_BehaviorAddrs_L,Y
    LDA #$ad2e,X
    STA CurrentSprites_BehaviorAddrs_U,Y
    LDA #$ff
    STA CurrentSprites_Subtypes,Y
    STA CurrentSprites_HitByMagicBehavior,Y
    LDX CurrentSprites_Entities,Y
    LDA #$b4df,X
    STA CurrentSprites_HitBoxTypes,Y
    LDA #$00
    STA CurrentSprites_Phases,Y
    LDA CurrentSprites_Flags,Y
    AND #$bf
    STA CurrentSprites_Flags,Y
    PLA
    TAX
    RTS


;============================================================================
; Return whether all sprite slots are populated.
;
; INPUTS:
;     CurrentSprites_Entities:
;         All populated sprite entities on the screen.
;
; OUTPUTS:
;     C:
;         1 if all sprite slot are populated.
;         0 if any are unpopulated.
;
; XREFS:
;     FUN_PRG14__9e13
;     FUN_PRG14__a093
;     FUN_PRG14__a0a0
;     FUN_PRG14__a0f6
;     FUN_PRG14__a12d
;     FUN_PRG14__a1cc
;     FUN_PRG14__ac21
;     SpriteBehavior__9cf2
;     SpriteBehavior__9da9
;     Sprite_SomethingSpawnMagic
;============================================================================
Sprites_HasMaxOnScreen:                     ; [$a236]
    LDY #$07                                ; Y = 7 (our loop counter)

  @_loop:                                   ; [$a238]
    LDA CurrentSprites_Entities,Y           ; A = sprite entity at X
    CMP #$ff                                ; Is it 0xFF (unpopulated)?
    BNE @_isPopulated                       ; If not, jump to prepare the
                                            ; next loop.

    ;
    ; There's an unpopulated sprite. Return a false result.
    ;
    CLC                                     ; Set C = 0
    RTS                                     ; And return it.

  @_isPopulated:                            ; [$a241]
    DEY                                     ; Y--
    BPL @_loop                              ; If >= 0, loop.

    ;
    ; All slots are populated. Return a true result.
    ;
    SEC                                     ; Set C = 1
    RTS                                     ; And return it.


;============================================================================
; TODO: Document SpriteBehavior__a246
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a639]
;============================================================================
SpriteBehavior__a246:                       ; [$a246]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE FUN_PRG14__a259
    LDA a:DurationOintment
    BMI FUN_PRG14__a256

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document SpriteBehavior_a25f_ClearEntity
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a25f
;============================================================================
SpriteBehavior_a25f_ClearEntity:            ; [$a250]
    LDA #$ff
    STA CurrentSprites_Entities,X
    RTS


;============================================================================
; TODO: Document FUN_PRG14__a256
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a246
;     SpriteBehavior__a25f
;============================================================================
FUN_PRG14__a256:                            ; [$a256]
    JSR Sprite_EnableBehavior

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__a259
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a246
;     SpriteBehavior__a25f
;============================================================================
FUN_PRG14__a259:                            ; [$a259]
    JSR Sprites_SetCurrentSpriteCanWalk
    JMP FUN_PRG14__864a


;============================================================================
; TODO: Document SpriteBehavior__a25f
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a63b]
;============================================================================
SpriteBehavior__a25f:                       ; [$a25f]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE FUN_PRG14__a259
    LDA a:DurationGlove
    BMI FUN_PRG14__a256
    BPL SpriteBehavior_a25f_ClearEntity

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_Walking
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80ef]
;     thunk1_SpriteUpdateHandler_NPC_Walking
;     thunk2_SpriteUpdateHandler_NPC_Walking
;============================================================================
SpriteUpdateHandler_NPC_Walking:            ; [$a26b]
    JSR CurrentSprite_UpdateFlipMask
    LDY #$00
    LDA CurrentSprites_Phases,X
    CMP #$02
    BEQ @LAB_PRG14__a280
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    TAY

  @LAB_PRG14__a280:                         ; [$a280]
    LDA #$a286,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_NPC_Walking
;
BYTE_ARRAY_PRG14__a286:                     ; [$a286]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $00                                  ; [2]:
    db $02                                  ; [3]:


;============================================================================
; TODO: Document thunk1_SpriteUpdateHandler_NPC_Walking
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80f1]
;============================================================================
thunk1_SpriteUpdateHandler_NPC_Walking:     ; [$a28a]
    JMP SpriteUpdateHandler_NPC_Walking


;============================================================================
; TODO: Document thunk2_SpriteUpdateHandler_NPC_Walking
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80f3]
;============================================================================
thunk2_SpriteUpdateHandler_NPC_Walking:     ; [$a28d]
    JMP SpriteUpdateHandler_NPC_Walking


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_ArmorSalesman
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80f5]
;============================================================================
SpriteUpdateHandler_NPC_ArmorSalesman:      ; [$a290]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_MartialArts
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80f7]
;============================================================================
SpriteUpdateHandler_NPC_MartialArts:        ; [$a2a0]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_Priest
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80f9]
;============================================================================
SpriteUpdateHandler_NPC_Priest:             ; [$a2af]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_King
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80fb]
;============================================================================
SpriteUpdateHandler_NPC_King:               ; [$a2be]
    LDA #$40
    STA CurrentSprite_FlipMask
    LDY CurrentSprites_Phases,X
    DEY
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    CLC
    ADC #$a2d6,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_NPC_King
;
BYTE_ARRAY_PRG14__a2d6:                     ; [$a2d6]
    db $00                                  ; [0]:
    db $02                                  ; [1]:


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_MagicTeacher
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80fd]
;============================================================================
SpriteUpdateHandler_NPC_MagicTeacher:       ; [$a2d8]
    JSR CurrentSprite_UpdateFlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_KeySalesman_Others
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::80ff]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8101]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8103]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8105]
;============================================================================
SpriteUpdateHandler_NPC_KeySalesman_Others: ; [$a2e7]
    LDA #$40
    STA CurrentSprite_FlipMask

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__a2eb
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteUpdateHandler_Enemy_UnusedEyeball_Zozura
;     SpriteUpdateHandler_NPC_Doctor
;     SpriteUpdateHandler_NPC_MeatSalesman_Others
;============================================================================
FUN_PRG14__a2eb:                            ; [$a2eb]
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_Doctor
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::810d]
;============================================================================
SpriteUpdateHandler_NPC_Doctor:             ; [$a2f7]
    LDA #$00
    STA CurrentSprite_FlipMask
    JMP FUN_PRG14__a2eb


;============================================================================
; TODO: Document SpriteUpdateHandler_NPC_MeatSalesman_Others
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8107]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8109]
;     SPRITE_UPDATE_HANDLERS [$PRG14::810b]
;     SPRITE_UPDATE_HANDLERS [$PRG14::810f]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8111]
;============================================================================
SpriteUpdateHandler_NPC_MeatSalesman_Others: ; [$a2fe]
    JSR CurrentSprite_UpdateFlipMask
    JMP FUN_PRG14__a2eb


;============================================================================
; TODO: Document SpriteUpdateHandler_Enemy_UnusedEyeball_Zozura
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8113]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8115]
;============================================================================
SpriteUpdateHandler_Enemy_UnusedEyeball_Zozura: ; [$a304]
    JSR CurrentSprite_UpdateFlipMask
    JMP FUN_PRG14__a2eb


;============================================================================
; TODO: Document SpriteUpdateHandler_Item_Standard
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8117]
;     SPRITE_UPDATE_HANDLERS [$PRG14::811d]
;     SPRITE_UPDATE_HANDLERS [$PRG14::811f]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8121]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8123]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8127]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8131]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8133]
;     SPRITE_UPDATE_HANDLERS [$PRG14::813d]
;     SPRITE_UPDATE_HANDLERS [$PRG14::813f]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8141]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8143]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8145]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8147]
;============================================================================
SpriteUpdateHandler_Item_Standard:          ; [$a30a]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA #$00
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteUpdateHandler_Bread
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8089]
;============================================================================
SpriteUpdateHandler_Bread:                  ; [$a313]
    LDA #$00
    STA Maybe_CurrentSprite_PPUOffset
    STA CurrentSprite_FlipMask
    LDA #$00
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__a31e
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a659]
;============================================================================
SpriteBehavior__a31e:                       ; [$a31e]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a326
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a326:                         ; [$a326]
    LDA a:Quests
    AND #$07
    CMP #$07
    BNE @LAB_PRG14__a332
    JMP Sprites_HideSprite

  @LAB_PRG14__a332:                         ; [$a332]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteUpdateHandler_Deco_Fountain
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::812b]
;     SpriteUpdateHandler__a5d2
;============================================================================
SpriteUpdateHandler_Deco_Fountain:          ; [$a335]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA a:SpriteUpdateCounter
    LSR A
    LSR A
    AND #$03
    TAY
    LDA #$a347,Y
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     SpriteUpdateHandler_Deco_Fountain
;
BYTE_ARRAY_PRG14__a347:                     ; [$a347]
    db $04                                  ; [0]:
    db $05                                  ; [1]:
    db $06                                  ; [2]:
    db $05                                  ; [3]:


;============================================================================
; TODO: Document SpriteUpdateHandler_Item_Special
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8119]
;     SPRITE_UPDATE_HANDLERS [$PRG14::811b]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8135]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8137]
;     SPRITE_UPDATE_HANDLERS [$PRG14::8139]
;     SPRITE_UPDATE_HANDLERS [$PRG14::813b]
;============================================================================
SpriteUpdateHandler_Item_Special:           ; [$a34b]
    LDA #$00
    STA CurrentSprite_FlipMask
    LDA #$00
    JMP Sprite_EnterNextAppearancePhase


;============================================================================
; TODO: Document SpriteBehavior__a354
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a63d]
;============================================================================
SpriteBehavior__a354:                       ; [$a354]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a377
    LDA a:SelectedArmor
    CMP #$03
    BEQ Sprites_ClearAllEntities
    LDY a:NumberOfArmors

  @LAB_PRG14__a363:                         ; [$a363]
    DEY
    BMI @LAB_PRG14__a36f
    LDA ArmorInventory,Y
    CMP #$03
    BEQ Sprites_ClearAllEntities
    BNE @LAB_PRG14__a363

  @LAB_PRG14__a36f:                         ; [$a36f]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a377:                         ; [$a377]
    LDA #$2e
    JSR #$efe6
    BCC @LAB_PRG14__a381
    JMP Sprites_HideSprite

  @LAB_PRG14__a381:                         ; [$a381]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a384
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a63f]
;============================================================================
SpriteBehavior__a384:                       ; [$a384]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a3a7
    LDA a:SelectedShield
    CMP #$03
    BEQ Sprites_ClearAllEntities
    LDY a:NumberOfShields

  @LAB_PRG14__a393:                         ; [$a393]
    DEY
    BMI @LAB_PRG14__a39f
    LDA ShieldInventory,Y
    CMP #$03
    BEQ Sprites_ClearAllEntities
    BNE @LAB_PRG14__a393

  @LAB_PRG14__a39f:                         ; [$a39f]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a3a7:                         ; [$a3a7]
    LDA #$2e
    JSR #$efe6
    BCC @LAB_PRG14__a3b1
    JMP Sprites_HideSprite

  @LAB_PRG14__a3b1:                         ; [$a3b1]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document Sprites_ClearAllEntities
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a354
;     SpriteBehavior__a384
;     SpriteBehavior__a3bf
;============================================================================
Sprites_ClearAllEntities:                   ; [$a3b4]
    LDY #$07

  @LAB_PRG14__a3b6:                         ; [$a3b6]
    LDA #$ff
    STA CurrentSprites_Entities,Y
    DEY
    BPL @LAB_PRG14__a3b6
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a3bf
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a641]
;============================================================================
SpriteBehavior__a3bf:                       ; [$a3bf]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a3e2
    LDA a:Player_CurWeapon
    CMP #$03
    BEQ Sprites_ClearAllEntities
    LDY a:NumberOfWeapons

  @LAB_PRG14__a3ce:                         ; [$a3ce]
    DEY
    BMI @LAB_PRG14__a3da
    LDA WeaponInventory,Y
    CMP #$03
    BEQ Sprites_ClearAllEntities
    BNE @LAB_PRG14__a3ce

  @LAB_PRG14__a3da:                         ; [$a3da]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a3e2:                         ; [$a3e2]
    LDA #$32
    JSR #$efe6
    BCC @LAB_PRG14__a3ec
    JMP Sprites_HideSprite

  @LAB_PRG14__a3ec:                         ; [$a3ec]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a3ef
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a643]
;============================================================================
SpriteBehavior__a3ef:                       ; [$a3ef]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a406
    LDA a:Quests
    AND #$10
    BEQ @LAB_PRG14__a3fe
    JMP Sprites_Remove

  @LAB_PRG14__a3fe:                         ; [$a3fe]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a406:                         ; [$a406]
    LDA #$2d
    JSR #$efe6
    BCC @LAB_PRG14__a410
    JMP Sprites_HideSprite

  @LAB_PRG14__a410:                         ; [$a410]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a413
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a645]
;============================================================================
SpriteBehavior__a413:                       ; [$a413]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a42a
    LDA a:Quests
    AND #$08
    BEQ @LAB_PRG14__a422
    JMP Sprites_Remove

  @LAB_PRG14__a422:                         ; [$a422]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a42a:                         ; [$a42a]
    LDA #$31
    JSR #$efe6
    BCC @LAB_PRG14__a434
    JMP Sprites_HideSprite

  @LAB_PRG14__a434:                         ; [$a434]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a437
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a647]
;============================================================================
SpriteBehavior__a437:                       ; [$a437]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a44e
    LDA a:SpecialItems
    AND #$01
    BEQ @LAB_PRG14__a446
    JMP Sprites_Remove

  @LAB_PRG14__a446:                         ; [$a446]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a44e:                         ; [$a44e]
    LDA #$2e
    JSR #$efe6
    BCC @LAB_PRG14__a458
    JMP Sprites_HideSprite

  @LAB_PRG14__a458:                         ; [$a458]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a45b
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a649]
;============================================================================
SpriteBehavior__a45b:                       ; [$a45b]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a472
    LDA a:SpecialItems
    AND #$02
    BEQ @LAB_PRG14__a46a
    JMP Sprites_Remove

  @LAB_PRG14__a46a:                         ; [$a46a]
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a472:                         ; [$a472]
    LDA #$2d
    JSR #$efe6
    BCC @LAB_PRG14__a47c
    JMP Sprites_HideSprite

  @LAB_PRG14__a47c:                         ; [$a47c]
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a47f
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a661]
;============================================================================
SpriteBehavior__a47f:                       ; [$a47f]
    LDA a:SpecialItems
    AND #$04
    BEQ @LAB_PRG14__a489
    JMP Sprites_Remove

  @LAB_PRG14__a489:                         ; [$a489]
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a48a
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a64b]
;============================================================================
SpriteBehavior__a48a:                       ; [$a48a]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a49a
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a497
    JMP Sprites_Remove

  @LAB_PRG14__a497:                         ; [$a497]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a49a:                         ; [$a49a]
    JMP FUN_PRG14__a510


;============================================================================
; TODO: Document SpriteBehavior__a49d
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a64d]
;============================================================================
SpriteBehavior__a49d:                       ; [$a49d]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a4ad
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a4aa
    JMP Sprites_Remove

  @LAB_PRG14__a4aa:                         ; [$a4aa]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a4ad:                         ; [$a4ad]
    JMP FUN_PRG14__a510


;============================================================================
; TODO: Document SpriteBehavior__a4b0
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a64f]
;============================================================================
SpriteBehavior__a4b0:                       ; [$a4b0]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a4c0
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a4bd
    JMP Sprites_Remove

  @LAB_PRG14__a4bd:                         ; [$a4bd]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a4c0:                         ; [$a4c0]
    JMP FUN_PRG14__a510


;============================================================================
; TODO: Document SpriteBehavior__a4c3
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a651]
;============================================================================
SpriteBehavior__a4c3:                       ; [$a4c3]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a4d3
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a4d0
    JMP Sprites_Remove

  @LAB_PRG14__a4d0:                         ; [$a4d0]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a4d3:                         ; [$a4d3]
    JMP FUN_PRG14__a510


;============================================================================
; TODO: Document SpriteBehavior__a4d6
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a653]
;============================================================================
SpriteBehavior__a4d6:                       ; [$a4d6]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a4e6
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a4e3
    JMP Sprites_Remove

  @LAB_PRG14__a4e3:                         ; [$a4e3]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a4e6:                         ; [$a4e6]
    JMP FUN_PRG14__a510


;============================================================================
; TODO: Document SpriteBehavior__a4e9
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a657]
;============================================================================
SpriteBehavior__a4e9:                       ; [$a4e9]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a4f9
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a4f6
    JMP Sprites_Remove

  @LAB_PRG14__a4f6:                         ; [$a4f6]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a4f9:                         ; [$a4f9]
    JMP FUN_PRG14__a510


;============================================================================
; TODO: Document SpriteBehavior__a4fc
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a655]
;============================================================================
SpriteBehavior__a4fc:                       ; [$a4fc]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a50c
    JSR Something_IncAndCapDAT043a
    BCC @LAB_PRG14__a509
    JMP Sprites_Remove

  @LAB_PRG14__a509:                         ; [$a509]
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a50c:                         ; [$a50c]
    JMP FUN_PRG14__a510
    RTS


;============================================================================
; TODO: Document FUN_PRG14__a510
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a48a
;     SpriteBehavior__a49d
;     SpriteBehavior__a4b0
;     SpriteBehavior__a4c3
;     SpriteBehavior__a4d6
;     SpriteBehavior__a4e9
;     SpriteBehavior__a4fc
;============================================================================
FUN_PRG14__a510:                            ; [$a510]
    JSR Maybe_Sprites_HasAnyEnemyOnScreen
    BCC @LAB_PRG14__a518
    JMP Sprite_SetMaybeHidden

  @LAB_PRG14__a518:                         ; [$a518]
    JMP Sprites_HideSprite


;============================================================================
; TODO: Document FUN_PRG14__a51b
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a31e
;     SpriteBehavior__a48a
;     SpriteBehavior__a49d
;     SpriteBehavior__a4b0
;     SpriteBehavior__a4c3
;     SpriteBehavior__a4d6
;     SpriteBehavior__a4e9
;     SpriteBehavior__a4fc
;     SpriteBehavior__a558
;     SpriteBehavior__a56f
;     SpriteBehavior__a586
;============================================================================
FUN_PRG14__a51b:                            ; [$a51b]
    LDA #$00
    STA CurrentSprites_Phases,X
    JMP Sprite_EnableBehavior


;============================================================================
; Queue removal of a sprite.
;
; This clears the sprite type for the given sprite index.
;
; INPUTS:
;     X:
;         The index of the sprite to clear.
;
; OUTPUTS:
;     None
;
; XREFS:
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
;     SpriteBehavior__a47f
;     SpriteBehavior__a48a
;     SpriteBehavior__a49d
;     SpriteBehavior__a4b0
;     SpriteBehavior__a4c3
;     SpriteBehavior__a4d6
;     SpriteBehavior__a4e9
;     SpriteBehavior__a4fc
;============================================================================
Sprites_Remove:                             ; [$a523]
    LDA #$ff
    STA CurrentSprites_Entities,X
    RTS


;============================================================================
; TODO: Document Something_IncAndCapDAT043a
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     SpriteBehavior__a48a
;     SpriteBehavior__a49d
;     SpriteBehavior__a4b0
;     SpriteBehavior__a4c3
;     SpriteBehavior__a4d6
;     SpriteBehavior__a4e9
;     SpriteBehavior__a4fc
;============================================================================
Something_IncAndCapDAT043a:                 ; [$a529]
    INC a:BYTE_043a
    LDA a:BYTE_043a
    CMP #$04
    BCC @_returnTrue
    LDA #$00
    STA a:BYTE_043a
    CLC
    RTS

  @_returnTrue:                             ; [$a53a]
    SEC
    RTS


;============================================================================
; TODO: Document Maybe_Sprites_HasAnyEnemyOnScreen
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG14__a510
;============================================================================
Maybe_Sprites_HasAnyEnemyOnScreen:          ; [$a53c]
    LDY #$07

  @LAB_PRG14__a53e:                         ; [$a53e]
    LDA CurrentSprites_Entities,Y
    CMP #$ff
    BEQ @LAB_PRG14__a550
    TAX
    LDA #$b544,X
    BNE @LAB_PRG14__a550
    LDX a:CurrentSpriteIndex
    SEC
    RTS

  @LAB_PRG14__a550:                         ; [$a550]
    DEY
    BPL @LAB_PRG14__a53e
    LDX a:CurrentSpriteIndex
    CLC
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a558
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a65b]
;============================================================================
SpriteBehavior__a558:                       ; [$a558]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a560
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a560:                         ; [$a560]
    LDA CurrentSprites_Phases,X
    BNE FUN_PRG14__a59d
    LDA a:Quests
    AND #$01
    BNE FUN_PRG14__a59d
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a56f
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a65d]
;============================================================================
SpriteBehavior__a56f:                       ; [$a56f]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a577
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a577:                         ; [$a577]
    LDA CurrentSprites_Phases,X
    BNE FUN_PRG14__a59d
    LDA a:Quests
    AND #$02
    BNE FUN_PRG14__a59d
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document SpriteBehavior__a586
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a65f]
;============================================================================
SpriteBehavior__a586:                       ; [$a586]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a58e
    JSR FUN_PRG14__a51b

  @LAB_PRG14__a58e:                         ; [$a58e]
    LDA CurrentSprites_Phases,X
    BNE FUN_PRG14__a59d
    LDA a:Quests
    AND #$04
    BNE FUN_PRG14__a59d
    JMP Sprite_SetMaybeHidden


;============================================================================
; TODO: Document FUN_PRG14__a59d
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__a558
;     SpriteBehavior__a56f
;     SpriteBehavior__a586
;============================================================================
FUN_PRG14__a59d:                            ; [$a59d]
    JSR Sprites_HideSprite
    LDA CurrentSprites_Phases,X
    BNE @LAB_PRG14__a5b0
    INC CurrentSprites_Phases,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_StateCounter,X

  @LAB_PRG14__a5b0:                         ; [$a5b0]
    LDA CurrentSprites_Phases,X
    CMP #$01
    BNE Sprite_SetPhase2
    INC CurrentSprites_StateCounter,X
    LDA CurrentSprites_StateCounter,X
    AND #$03
    BNE RETURN_A5CB
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$04
    BCS Sprite_SetPhase2

    ;
    ; XREFS:
    ;     FUN_PRG14__a59d
    ;     SpriteUpdateHandler__a5d2
    ;
RETURN_A5CB:                                ; [$a5cb]
    RTS


;============================================================================
; TODO: Document Sprite_SetPhase2
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a59d
;============================================================================
Sprite_SetPhase2:                           ; [$a5cc]
    LDA #$02
    STA CurrentSprites_Phases,X
    RTS


;============================================================================
; TODO: Document SpriteUpdateHandler__a5d2
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_UPDATE_HANDLERS [$PRG14::8149]
;     SPRITE_UPDATE_HANDLERS [$PRG14::814b]
;     SPRITE_UPDATE_HANDLERS [$PRG14::814d]
;============================================================================
SpriteUpdateHandler__a5d2:                  ; [$a5d2]
    LDA CurrentSprites_Phases,X
    BEQ RETURN_A5CB
    CMP #$01
    BEQ @LAB_PRG14__a5de
    JMP SpriteUpdateHandler_Deco_Fountain

  @LAB_PRG14__a5de:                         ; [$a5de]
    JSR CurrentSprite_UpdateFlipMask
    LDA CurrentSprites_TickCounters,X
    JMP Sprite_EnterNextAppearancePhase

;
; XREFS:
;     FUN_PRG14__a66b
;
SPRITE_BEHAVIOR_ADDRS:                      ; [$a5e7]
    dw SpriteBehavior_WalkBackAndForth-1    ; [0]: NPC - Blue dress lady NPC
                                            ; - Blue nurse lady MPC - Knight
    dw Sprite_Something_SetReadyIfIdleAndSomething-1 ; [1]:
    dw SpriteBehavior_MaybeFallingRocks-1   ; [2]:
    dw SpriteBehavior__9e6d-1               ; [3]:
    dw SpriteBehavior_Walking-1             ; [4]: NPC - Start-Stop Walking
                                            ; Man Enemy - Zozura
    dw $a6ad                                ; [5]:
    dw SpriteBehavior__9a32-1               ; [6]:
    dw SpriteBehavior__abcc-1               ; [7]:
    dw SpriteBehavior__abcc-1               ; [8]:
    dw SpriteBehavior_Hopper-1              ; [9]: Enemy - Monodron
    dw SpriteBehavior__9b83-1               ; [10]: Boss - Dragon boss guy
    dw $a6ad                                ; [11]:
    dw SpriteBehavior__9c89-1               ; [12]:
    dw SpriteBehavior__9cf2-1               ; [13]:
    dw SpriteBehavior__9da9-1               ; [14]:
    dw SpriteBehavior__9f03-1               ; [15]:
    dw SpriteBehavior__9fe3-1               ; [16]:
    dw SpriteBehavior__a997-1               ; [17]:
    dw SpriteBehavior__aa86-1               ; [18]:
    dw SpriteBehavior__aafa-1               ; [19]:
    dw SpriteBehavior__a8d7-1               ; [20]:
    dw SpriteBehavior_StandingStill-1       ; [21]: NPC - Smoking Man NPC -
                                            ; Invisible screen 1 event marker
                                            ; NPC - Shop keepers
    dw SpriteBehavior_MaybeFlyingSomething-1 ; [22]:
    dw SpriteBehavior__8ecf-1               ; [23]:
    dw SpriteBehavior__8f2e-1               ; [24]:
    dw SpriteBehavior__8fe7-1               ; [25]:
    dw SpriteBehavior__9060-1               ; [26]:
    dw SpriteBehavior__a0cb-1               ; [27]:
    dw _thunk_SpriteBehavior__a0cb-1        ; [28]:
    dw SpriteBehavior__a154-1               ; [29]:
    dw _thunk_Sprite_ClearBehaviorReadyAndSetSubtypeBit7-1 ; [30]:
    dw SpriteBehavior__MaybeSugata-1        ; [31]:
    dw SpriteBehavior__92e0-1               ; [32]:
    dw SpriteBehavior__93e5-1               ; [33]:
    dw SpriteBehavior__9538-1               ; [34]:
    dw SpriteBehavior__95c0-1               ; [35]:
    dw SpriteBehavior__9632-1               ; [36]:
    dw SpriteBehavior__971d-1               ; [37]:
    dw SpriteBehavior__97ae-1               ; [38]:
    dw SpriteBehavior__9865-1               ; [39]:
    dw SpriteBehavior__9497-1               ; [40]:
    dw SpriteBehavior__a246-1               ; [41]:
    dw SpriteBehavior__a25f-1               ; [42]:
    dw SpriteBehavior__a354-1               ; [43]:
    dw SpriteBehavior__a384-1               ; [44]:
    dw SpriteBehavior__a3bf-1               ; [45]:
    dw SpriteBehavior__a3ef-1               ; [46]:
    dw SpriteBehavior__a413-1               ; [47]:
    dw SpriteBehavior__a437-1               ; [48]:
    dw SpriteBehavior__a45b-1               ; [49]:
    dw SpriteBehavior__a48a-1               ; [50]:
    dw SpriteBehavior__a49d-1               ; [51]:
    dw SpriteBehavior__a4b0-1               ; [52]:
    dw SpriteBehavior__a4c3-1               ; [53]:
    dw SpriteBehavior__a4d6-1               ; [54]:
    dw SpriteBehavior__a4fc-1               ; [55]:
    dw SpriteBehavior__a4e9-1               ; [56]:
    dw SpriteBehavior__a31e-1               ; [57]:
    dw SpriteBehavior__a558-1               ; [58]:
    dw SpriteBehavior__a56f-1               ; [59]:
    dw SpriteBehavior__a586-1               ; [60]:
    dw SpriteBehavior__a47f-1               ; [61]:
    dw SpriteBehavior__ab67-1               ; [62]:
    dw SpriteBehavior__8e77-1               ; [63]:
    dw SpriteBehavior__9129-1               ; [64]:
    dw SpriteBehavior__91b3-1               ; [65]:


;============================================================================
; TODO: Document FUN_PRG14__a66b
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     LAB_PRG14__802e [$PRG14::802e]
;============================================================================
FUN_PRG14__a66b:                            ; [$a66b]
    LDA a:DurationHourGlass
    BMI @LAB_PRG14__a679
    LDY CurrentSprites_Entities,X
    LDA #$b544,Y
    BNE @LAB_PRG14__a679
    RTS

    ;
    ; Set the currently-processing sprite behavior address to
    ; the one from the current sprites map.
    ;
  @LAB_PRG14__a679:                         ; [$a679]
    LDX a:CurrentSpriteIndex
    LDA CurrentSprites_BehaviorAddrs_L,X
    STA Sprites_ReadInfoAddr
    LDA CurrentSprites_BehaviorAddrs_U,X
    STA Sprites_ReadInfoAddr.U
    JSR FUN_PRG14__a6bc
    LDA CurrentSprites_Subtypes,X
    ASL A
    TAY
    CPY #$84
    BCS @_updateCurrentSprites
    LDA #$a6
    PHA
    LDA #$a0
    PHA
    LDA #$a5e8,Y
    PHA
    LDA #$a5e7,Y
    PHA
    RTS

    ;
    ; Update the map of current sprites to sprite behavior addresses
    ; with the updated address.
    ;
  @_updateCurrentSprites:                   ; [$a6a1]
    LDX a:CurrentSpriteIndex
    LDA Sprites_ReadInfoAddr
    STA CurrentSprites_BehaviorAddrs_L,X
    LDA Sprites_ReadInfoAddr.U
    STA CurrentSprites_BehaviorAddrs_U,X

    ;
    ; XREFS:
    ;     FUN_PRG14__a6af
    ;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5f1]
    ;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5fd]
    ;
RETURN_A6AE:                                ; [$a6ae]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__a6af
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a91e
;     SpriteBehavior_StandingStill
;     SpriteBehavior_Walking
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     SpriteBehavior__aafa
;     Sprite_Something_SetReadyIfIdleAndSomething
;============================================================================
FUN_PRG14__a6af:                            ; [$a6af]
    LDA #$0364,X
    BEQ RETURN_A6AE
    DEC #$0364,X
    BNE RETURN_A6AE
    JMP Sprite_ClearBehaviorReadyAndSetSubtypeBit7


;============================================================================
; TODO: Document FUN_PRG14__a6bc
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG14__a66b
;     FUN_PRG14__a734
;     FUN_PRG14__a754
;     FUN_PRG14__a78c
;     FUN_PRG14__a7f8
;     Sprite_SomethingFunc__a6e8
;     Sprite_SomethingFunc__a84f
;     Sprite_SomethingFunc__a86e
;     Sprite_Something__a82a
;============================================================================
FUN_PRG14__a6bc:                            ; [$a6bc]
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    CMP #$ff
    BEQ @LAB_PRG14__a6cf
    ASL A
    TAY
    LDA #$a6d9,Y
    PHA
    LDA #$a6d8,Y
    PHA
    RTS

  @LAB_PRG14__a6cf:                         ; [$a6cf]
    LDA CurrentSprites_Subtypes,X
    AND #$7f
    STA CurrentSprites_Subtypes,X
    RTS

;
; XREFS:
;     FUN_PRG14__a6bc
;
SOMETHING_SOMETHING_FUNCS:                  ; [$a6d8]
    dw Sprite_SomethingFunc__a6ff-1         ; [0]:
    dw Sprite_SomethingFunc__a72c-1         ; [1]:
    dw Sprite_SomethingFunc__a772-1         ; [2]:
    dw Sprite_SomethingFunc__a7e5-1         ; [3]:
    dw Sprite_SomethingFunc__a86e-1         ; [4]:
    dw Sprite_SomethingFunc__a74c-1         ; [5]:
    dw Sprite_SomethingFunc__a84f-1         ; [6]:
    dw Sprite_SomethingFunc__a6e8-1         ; [7]:


;============================================================================
; TODO: Document Sprite_SomethingFunc__a6e8
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6e6]
;============================================================================
Sprite_SomethingFunc__a6e8:                 ; [$a6e8]
    LDA CurrentSprites_Subtypes,X
    BMI @LAB_PRG14__a6f0
    JMP RETURN_A771

  @LAB_PRG14__a6f0:                         ; [$a6f0]
    LDY #$01
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_Phases,X
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    JMP FUN_PRG14__a6bc


;============================================================================
; TODO: Document Sprite_SomethingFunc__a6ff
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6d8]
;============================================================================
Sprite_SomethingFunc__a6ff:                 ; [$a6ff]
    LDA CurrentSprites_Subtypes,X
    BMI @LAB_PRG14__a707
    JMP RETURN_A771

  @LAB_PRG14__a707:                         ; [$a707]
    INC CurrentSprites_Phases,X
    LDA #$01
    JSR Screen_IncSpriteInfoAddr
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_Subtypes,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA #$0364,X
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    LDA CurrentSprites_Subtypes,X
    CMP #$06
    BNE @LAB_PRG14__a72b
    JMP FUN_PRG14__9917

  @LAB_PRG14__a72b:                         ; [$a72b]
    RTS


;============================================================================
; TODO: Document Sprite_SomethingFunc__a72c
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6da]
;============================================================================
Sprite_SomethingFunc__a72c:                 ; [$a72c]
    LDA CurrentSprites_Subtypes,X
    BMI FUN_PRG14__a734
    JMP RETURN_A771


;============================================================================
; TODO: Document FUN_PRG14__a734
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_SomethingFunc__a72c
;============================================================================
FUN_PRG14__a734:                            ; [$a734]
    LDA #$01
    JSR Screen_IncSpriteInfoAddr
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    PHA
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA Sprites_ReadInfoAddr.U
    PLA
    STA Sprites_ReadInfoAddr
    JSR Sprite_ClearBehaviorReadyAndSetSubtypeBit7
    JMP FUN_PRG14__a6bc


;============================================================================
; TODO: Document Sprite_SomethingFunc__a74c
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6e2]
;============================================================================
Sprite_SomethingFunc__a74c:                 ; [$a74c]
    LDA CurrentSprites_Subtypes,X
    BMI FUN_PRG14__a754
    JMP RETURN_A771


;============================================================================
; TODO: Document FUN_PRG14__a754
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_SomethingFunc__a74c
;============================================================================
FUN_PRG14__a754:                            ; [$a754]
    LDA #$01
    JSR Screen_IncSpriteInfoAddr
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    PHA
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA Sprites_ReadInfoAddr.U
    PLA
    STA Sprites_ReadInfoAddr
    LDA #$00
    STA CurrentSprites_Phases,X
    JSR Sprite_ClearBehaviorReadyAndSetSubtypeBit7
    JMP FUN_PRG14__a6bc

    ;
    ; XREFS:
    ;     Sprite_SomethingFunc__a6e8
    ;     Sprite_SomethingFunc__a6ff
    ;     Sprite_SomethingFunc__a72c
    ;     Sprite_SomethingFunc__a74c
    ;     Sprite_SomethingFunc__a772
    ;
RETURN_A771:                                ; [$a771]
    RTS


;============================================================================
; TODO: Document Sprite_SomethingFunc__a772
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6dc]
;============================================================================
Sprite_SomethingFunc__a772:                 ; [$a772]
    LDA CurrentSprites_Subtypes,X
    BPL RETURN_A771
    LDY #$01
    LDA (Sprites_ReadInfoAddr),Y
    ASL A
    TAY
    LDA #$a7
    PHA
    LDA #$8b
    PHA
    LDA #$a795,Y
    PHA
    LDA #$a794,Y
    PHA
    RTS


;============================================================================
; TODO: Document FUN_PRG14__a78c
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG14__a78c:                            ; [$a78c]
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    JMP FUN_PRG14__a6bc

;
; XREFS:
;     Sprite_SomethingFunc__a772
;
SPRITE_SOMETHING_ACTIONS:                   ; [$a794]
    dw Sprite_MoveTowardsPlayerX-1          ; [0]:
    dw Sprite_ToggleMoveRight-1             ; [1]:
    dw Sprite_MoveTowardsPlayerY-1          ; [2]:
    dw Sprite_ChangeYDirection-1            ; [3]:
    dw CurrentSprite_RandomlyChangeHorizDirection-1 ; [4]:
    dw CurrentSprite_RandomlyChangeVertDirection-1 ; [5]:
    dw Sprite_UnsetFalling-1                ; [6]:
    dw Sprite_SomethingSpawnMagic-1         ; [7]:


;============================================================================
; TODO: Document Sprite_UnsetFalling
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a7a0]
;============================================================================
Sprite_UnsetFalling:                        ; [$a7a4]
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document CurrentSprite_RandomlyChangeHorizDirection
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a79c]
;     SpriteBehavior__8f2e
;============================================================================
CurrentSprite_RandomlyChangeHorizDirection: ; [$a7ad]
    JSR #$ca6e
    LDX a:CurrentSpriteIndex
    CMP #$80
    BCS @LAB_PRG14__a7c0
    LDA CurrentSprites_Flags,X
    AND #$fe
    STA CurrentSprites_Flags,X
    RTS

  @LAB_PRG14__a7c0:                         ; [$a7c0]
    LDA CurrentSprites_Flags,X
    ORA #$01
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document CurrentSprite_RandomlyChangeVertDirection
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_SOMETHING_ACTIONS [$PRG14::a79e]
;============================================================================
CurrentSprite_RandomlyChangeVertDirection:  ; [$a7c9]
    JSR #$ca6e
    LDX a:CurrentSpriteIndex
    CMP #$80
    BCS @LAB_PRG14__a7dc
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X
    RTS

  @LAB_PRG14__a7dc:                         ; [$a7dc]
    LDA CurrentSprites_Flags,X
    ORA #$80
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document Sprite_SomethingFunc__a7e5
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6de]
;============================================================================
Sprite_SomethingFunc__a7e5:                 ; [$a7e5]
    LDY #$01
    LDA (Sprites_ReadInfoAddr),Y
    ASL A
    TAY
    LDA #$a7f5,Y
    PHA
    LDA #$a7f4,Y
    PHA
    RTS

;
; XREFS:
;     Sprite_SomethingFunc__a7e5
;
USHORT_ARRAY_PRG14__a7f4:                   ; [$a7f4]
    dw FUN_PRG14__a7f8-1                    ; [0]:
    dw Sprite_Something__a82a-1             ; [1]:


;============================================================================
; TODO: Document FUN_PRG14__a7f8
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     USHORT_ARRAY_PRG14__a7f4 [$PRG14::a7f4]
;============================================================================
FUN_PRG14__a7f8:                            ; [$a7f8]
    LDA CurrentSprites_Subtypes,X
    BPL @LAB_PRG14__a805
    LDA #$07
    JSR Screen_IncSpriteInfoAddr
    JMP FUN_PRG14__a6bc

  @LAB_PRG14__a805:                         ; [$a805]
    JSR FUN_PRG14__82f8
    LDY #$02
    CMP (Sprites_ReadInfoAddr),Y
    BCC @LAB_PRG14__a81d
    LDY #$04
    INY
    LDA (Sprites_ReadInfoAddr),Y
    PHA
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA Sprites_ReadInfoAddr.U
    PLA
    STA Sprites_ReadInfoAddr
    RTS

  @LAB_PRG14__a81d:                         ; [$a81d]
    INY
    LDA (Sprites_ReadInfoAddr),Y
    PHA
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA Sprites_ReadInfoAddr.U
    PLA
    STA Sprites_ReadInfoAddr
    RTS


;============================================================================
; TODO: Document Sprite_Something__a82a
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     USHORT_ARRAY_PRG14__a7f4 [$PRG14::a7f6]
;============================================================================
Sprite_Something__a82a:                     ; [$a82a]
    LDA CurrentSprites_Subtypes,X
    BPL @LAB_PRG14__a837
    LDA #$07
    JSR Screen_IncSpriteInfoAddr
    JMP FUN_PRG14__a6bc

  @LAB_PRG14__a837:                         ; [$a837]
    JSR FUN_PRG14__831b
    LDY #$02
    CMP (Sprites_ReadInfoAddr),Y
    BCC @LAB_PRG14__a842
    LDY #$04

  @LAB_PRG14__a842:                         ; [$a842]
    INY
    LDA (Sprites_ReadInfoAddr),Y
    PHA
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA Sprites_ReadInfoAddr.U
    PLA
    STA Sprites_ReadInfoAddr
    RTS


;============================================================================
; TODO: Document Sprite_SomethingFunc__a84f
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6e4]
;============================================================================
Sprite_SomethingFunc__a84f:                 ; [$a84f]
    LDY #$01
    LDA (Sprites_ReadInfoAddr),Y
    STA Temp_Addr
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA Temp_Addr.U
    INY
    LDA (Sprites_ReadInfoAddr),Y
    PHA
    TXA
    TAY
    PLA
    CLC
    ADC (Temp_Addr),Y
    STA (Temp_Addr),Y
    LDA #$04
    JSR Screen_IncSpriteInfoAddr
    JMP FUN_PRG14__a6bc


;============================================================================
; TODO: Document Sprite_SomethingFunc__a86e
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SOMETHING_SOMETHING_FUNCS [$PRG14::a6e0]
;============================================================================
Sprite_SomethingFunc__a86e:                 ; [$a86e]
    LDA #$01
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_ClearBehaviorReadyAndSetSubtypeBit7
    JMP FUN_PRG14__a6bc


;============================================================================
; Increment the address for a sprite's behavior info.
;
; INPUTS:
;     A:
;         The offset to increment by.
;
;     Sprites_ReadInfoAddr:
;     #$cb:
;         The current address of behavior information.
;
; OUTPUTS:
;     Sprites_ReadInfoAddr:
;         The new address of the behavior information.
;
; XREFS:
;     FUN_PRG14__a734
;     FUN_PRG14__a754
;     FUN_PRG14__a78c
;     FUN_PRG14__a7f8
;     SpriteBehavior_Hopper
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior_Walking
;     SpriteBehavior__a8d7
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     SpriteBehavior__aafa
;     Sprite_SomethingFunc__a6e8
;     Sprite_SomethingFunc__a6ff
;     Sprite_SomethingFunc__a84f
;     Sprite_SomethingFunc__a86e
;     Sprite_Something__a82a
;============================================================================
Screen_IncSpriteInfoAddr:                   ; [$a879]
    CLC                                     ; C = 0
    ADC Sprites_ReadInfoAddr                ; A = offset + lower byte of the
                                            ; behavior address If overflow, C
                                            ; = 1
    STA Sprites_ReadInfoAddr                ; Store it.
    LDA Sprites_ReadInfoAddr.U              ; A = upper byte of the behavior
                                            ; address
    ADC #$00                                ; Add carry, if set.
    STA Sprites_ReadInfoAddr.U              ; Store it.
    RTS


;============================================================================
; Return whether or not a sprite's behavior is disabled.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     CurrentSprites_Flags:
;         Flags for the current sprites.
;
; OUTPUTS:
;     Z:
;         1 if the behavior is disabled.
;         0 if it is enabled.
;
; XREFS:
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_StandingStill
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior_Walking
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8fe7
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
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__9cf2
;     SpriteBehavior__9da9
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     SpriteBehavior__MaybeSugata
;     SpriteBehavior__a0cb
;     SpriteBehavior__a154
;     SpriteBehavior__a246
;     SpriteBehavior__a25f
;     SpriteBehavior__a31e
;     SpriteBehavior__a354
;     SpriteBehavior__a384
;     SpriteBehavior__a3bf
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
;     SpriteBehavior__a48a
;     SpriteBehavior__a49d
;     SpriteBehavior__a4b0
;     SpriteBehavior__a4c3
;     SpriteBehavior__a4d6
;     SpriteBehavior__a4e9
;     SpriteBehavior__a4fc
;     SpriteBehavior__a558
;     SpriteBehavior__a56f
;     SpriteBehavior__a586
;     SpriteBehavior__a8d7
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     SpriteBehavior__aafa
;     SpriteBehavior__ab67
;     SpriteBehavior__abcc
;     Sprite_Something_SetReadyIfIdleAndSomething
;============================================================================
Sprite_IsSpriteBehaviorDisabled:            ; [$a885]
    LDA CurrentSprites_Flags,X
    AND #$40
    RTS


;============================================================================
; Disable a sprite's behavior.
;
; This is used once a sprite's behavior functionality needs
; to pause behavior.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     CurrentSprites_Flags:
;         Flags for the current sprites.
;
; OUTPUTS:
;     CurrentSprites_Flags:
;         The updated flags.
;
; XREFS:
;     Sprite_ClearBehaviorReadyAndSetSubtypeBit7
;     Sprite_ReplaceWithDroppedItem
;     Sprite_ReplaceWithMattock
;     Sprite_SetDeathEntity
;============================================================================
Sprite_DisableBehavior:                     ; [$a88b]
    LDA CurrentSprites_Flags,X
    AND #$bf
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; Enable a sprite's behavior.
;
; This is used once a sprite is set up, or when the sprite's
; behavior handling wants to pause and then resume behavior.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
;     CurrentSprites_Flags:
;         Flags for the current sprites.
;
; OUTPUTS:
;     CurrentSprites_Flags:
;         The updated flags.
;
; XREFS:
;     FUN_PRG14__a256
;     FUN_PRG14__a51b
;     SpriteBehavior_Hopper
;     SpriteBehavior_MaybeFallingRocks
;     SpriteBehavior_MaybeFlyingSomething
;     SpriteBehavior_StandingStill
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior_Walking
;     SpriteBehavior__8e77
;     SpriteBehavior__8ecf
;     SpriteBehavior__8f2e
;     SpriteBehavior__8fe7
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
;     SpriteBehavior__9b83
;     SpriteBehavior__9c89
;     SpriteBehavior__9cf2
;     SpriteBehavior__9da9
;     SpriteBehavior__9e6d
;     SpriteBehavior__9f03
;     SpriteBehavior__9fe3
;     SpriteBehavior__MaybeSugata
;     SpriteBehavior__a0cb
;     SpriteBehavior__a154
;     SpriteBehavior__a354
;     SpriteBehavior__a384
;     SpriteBehavior__a3bf
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
;     SpriteBehavior__a8d7
;     SpriteBehavior__a997
;     SpriteBehavior__aa86
;     SpriteBehavior__aafa
;     SpriteBehavior__ab67
;     SpriteBehavior__abcc
;     Sprite_Something_SetReadyIfIdleAndSomething
;============================================================================
Sprite_EnableBehavior:                      ; [$a894]
    LDA CurrentSprites_Flags,X
    ORA #$40
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document CurrentSpriteFlags_SetBit5
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
CurrentSpriteFlags_SetBit5:                 ; [$a89d]
    LDA CurrentSprites_Flags,X
    ORA #$20
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document Sprite_ClearFlags
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
Sprite_ClearFlags:                          ; [$a8a6]
    LDA #$00
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; TODO: Document Sprite_ClearBehaviorReadyAndSetSubtypeBit7
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__a6af
;     FUN_PRG14__a734
;     FUN_PRG14__a754
;     SpriteBehavior_Hopper
;     SpriteBehavior__MaybeSugata
;     Sprite_SomethingFunc__a86e
;     _thunk_Sprite_ClearBehaviorReadyAndSetSubtypeBit7
;============================================================================
Sprite_ClearBehaviorReadyAndSetSubtypeBit7: ; [$a8ac]
    JSR Sprite_DisableBehavior
    LDA CurrentSprites_Subtypes,X
    ORA #$80
    STA CurrentSprites_Subtypes,X
    RTS


;============================================================================
; TODO: Document Sprite_GetPreviousSpritePhase
;
; INPUTS:
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SpriteUpdateHandler_Enemy_Ikeda
;     SpriteUpdateHandler_Enemy_Monodron
;     SpriteUpdateHandler_Enemy_Zombie
;============================================================================
Sprite_GetPreviousSpritePhase:              ; [$a8b8]
    LDA CurrentSprites_Phases,X
    SEC
    SBC #$01
    RTS


;============================================================================
; TODO: Set a sprite to be... hidden? visible?
;
; INPUTS:
;     X:
;         The index of the sprite.
;
; OUTPUTS:
;     None
;
; XREFS:
;     FUN_PRG14__a510
;     SpriteBehavior__9060
;     SpriteBehavior__9865
;     SpriteBehavior__a31e
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
;============================================================================
Sprite_SetMaybeHidden:                      ; [$a8bf]
    LDA CurrentSprites_Flags,X
    ORA #$10
    STA CurrentSprites_Flags,X
    RTS


;============================================================================
; Return whether a sprite is visible.
;
; INPUTS:
;     X:
;         The index of the sprite.
;
; OUTPUTS:
;     Z:
;         1 if the sprite is visible.
;         0 if the sprite is not visible.
;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     CurrentSprite_UpdateState
;     Player_HitSpriteWithWeapon
;     Sprite_CheckHitByCastMagic
;============================================================================
Sprites_IsSpriteVisible:                    ; [$a8c8]
    LDA CurrentSprites_Flags,X              ; Get the flags for the sprite.
    AND #$10
    RTS


;============================================================================
; Set a sprite to be hidden.
;
; INPUTS:
;     X:
;         The index of the sprite to hide.
;
; OUTPUTS:
;     None
;
; XREFS:
;     FUN_PRG14__a510
;     FUN_PRG14__a59d
;     SpriteBehavior__9060
;     SpriteBehavior__9865
;     SpriteBehavior__a31e
;     SpriteBehavior__a354
;     SpriteBehavior__a384
;     SpriteBehavior__a3bf
;     SpriteBehavior__a3ef
;     SpriteBehavior__a413
;     SpriteBehavior__a437
;     SpriteBehavior__a45b
;============================================================================
Sprites_HideSprite:                         ; [$a8ce]
    LDA CurrentSprites_Flags,X              ; Load the flags for the given
                                            ; sprite.
    AND #$ef                                ; Clear bit 5 (visibility).
    STA CurrentSprites_Flags,X              ; Set the new flags.
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a8d7
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a60f]
;============================================================================
SpriteBehavior__a8d7:                       ; [$a8d7]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE FUN_PRG14__a91e
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_TickCounters,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_StateCounter,X
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_EnableBehavior
    LDA CurrentSprites_Flags,X
    ORA #$02
    STA CurrentSprites_Flags,X
    JMP FUN_PRG14__a91e


;============================================================================
; TODO: Document SpriteBehavior_WalkBackAndForth
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5e7]
;============================================================================
SpriteBehavior_WalkBackAndForth:            ; [$a8fc]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE FUN_PRG14__a91e
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_TickCounters,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_StateCounter,X
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_EnableBehavior
    LDA CurrentSprites_Flags,X
    AND #$fd
    STA CurrentSprites_Flags,X

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG14__a91e
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior_WalkBackAndForth
;     SpriteBehavior__a8d7
;============================================================================
FUN_PRG14__a91e:                            ; [$a91e]
    JSR Sprites_SetCurrentSpriteCanWalk
    BCC @LAB_PRG14__a92e
    JSR FUN_PRG14__864a
    LDA CurrentSprites_Flags,X
    AND #$02
    BEQ @LAB_PRG14__a92e
    RTS

  @LAB_PRG14__a92e:                         ; [$a92e]
    LDA CurrentSprites_TickCounters,X
    STA a:Arg_DeltaX_Frac
    LDA CurrentSprites_StateCounter,X
    STA a:Arg_DeltaX_Full
    JSR Sprites_Something_SomethingAndMoveHoriz
    JSR FUN_PRG14__a6af
    RTS


;============================================================================
; TODO: Document SpriteBehavior_Walking
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5ef]
;============================================================================
SpriteBehavior_Walking:                     ; [$a941]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a95b
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_TickCounters,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_StateCounter,X
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a95b:                         ; [$a95b]
    JSR Sprites_SetCurrentSpriteCanWalk
    BCC @LAB_PRG14__a966
    JSR Sprite_ToggleMoveRight
    JMP FUN_PRG14__864a

  @LAB_PRG14__a966:                         ; [$a966]
    LDA CurrentSprites_TickCounters,X
    STA a:Arg_DeltaX_Frac
    LDA CurrentSprites_StateCounter,X
    STA a:Arg_DeltaX_Full
    JSR Sprite_MoveAndTurnAroundIfNeeded
    JMP FUN_PRG14__a6af


;============================================================================
; TODO: Document SpriteBehavior_StandingStill
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a611]
;============================================================================
SpriteBehavior_StandingStill:               ; [$a978]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a980
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a980:                         ; [$a980]
    JSR Sprites_SetCurrentSpriteCanWalk
    BCC Call_FUNPRG14_a6af
    JSR FUN_PRG14__864a
    JMP FUN_PRG14__a6af


;============================================================================
; TODO: Document Sprite_Something_SetReadyIfIdleAndSomething
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5e9]
;============================================================================
Sprite_Something_SetReadyIfIdleAndSomething: ; [$a98b]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE Call_FUNPRG14_a6af
    JSR Sprite_EnableBehavior

    ;
    ; XREFS:
    ;     SpriteBehavior_StandingStill
    ;     Sprite_Something_SetReadyIfIdleAndSomething
    ;
Call_FUNPRG14_a6af:                         ; [$a993]
    JMP FUN_PRG14__a6af
    RTS


;============================================================================
; TODO: Document SpriteBehavior__a997
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a609]
;============================================================================
SpriteBehavior__a997:                       ; [$a997]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__a9bd
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    LDA #$04
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_EnableBehavior

  @LAB_PRG14__a9bd:                         ; [$a9bd]
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    STA a:Arg_DeltaX_Frac
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:Arg_DeltaX_Full
    JSR FUN_PRG14__8427
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    STA a:Arg_DeltaY_Frac
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    STA a:Arg_DeltaY_Full
    JSR FUN_PRG14__859c
    JMP FUN_PRG14__a6af


;============================================================================
; TODO: Document SpriteBehavior_Hopper
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5f9]
;============================================================================
SpriteBehavior_Hopper:                      ; [$a9de]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__aa14
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_InternalBehaviorStates,X
    LDA #$03
    JSR Screen_IncSpriteInfoAddr
    LDA #$00
    STA #$0364,X
    JSR Sprite_EnableBehavior
    LDA CurrentSprites_Flags,X
    AND #$7f
    STA CurrentSprites_Flags,X
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aa72,Y
    STA CurrentSprites_StateCounter,X

  @LAB_PRG14__aa14:                         ; [$aa14]
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:Arg_DeltaX_Full
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    STA a:Arg_DeltaX_Frac
    JSR Sprites_Something_SomethingAndMoveHoriz
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aa77,Y
    TAY
    LDA CurrentSprites_StateCounter,X
    JSR Sprites_CalcYFromGravity
    PHA
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aa7c,Y
    TAY
    PLA
    JSR CalcVerticalSpriteMovement
    JSR Sprite_MoveVertical
    BCC @LAB_PRG14__aa49
    LDA CurrentSprites_Flags,X
    BPL @LAB_PRG14__aa49
    JMP Sprite_ClearBehaviorReadyAndSetSubtypeBit7

  @LAB_PRG14__aa49:                         ; [$aa49]
    INC CurrentSprites_StateCounter,X
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aa77,Y
    TAY
    LDA CurrentSprites_StateCounter,X
    AND #$83f7,Y
    BNE @_return
    LDA CurrentSprites_Flags,X
    BMI @LAB_PRG14__aa63

    ;
    ; Begin falling.
    ;
    JMP Sprite_ChangeYDirection

  @LAB_PRG14__aa63:                         ; [$aa63]
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA CurrentSprites_StateCounter,X
    CMP #$aa81,Y
    BCC @_return
    DEC CurrentSprites_StateCounter,X

  @_return:                                 ; [$aa71]
    RTS

;
; XREFS:
;     SpriteBehavior_Hopper
;
BYTE_ARRAY_PRG14__aa72:                     ; [$aa72]
    db $40                                  ; [0]:
    db $20                                  ; [1]:
    db $10                                  ; [2]: Monodron
    db $08                                  ; [3]:
    db $10                                  ; [4]:

;
; XREFS:
;     SpriteBehavior_Hopper
;
SPRITE_BEHAVIORS_HOPPER_GRAVITY:            ; [$aa77]
    db $02                                  ; [0]:
    db $03                                  ; [1]:
    db $04                                  ; [2]:
    db $05                                  ; [3]:
    db $04                                  ; [4]:

;
; XREFS:
;     SpriteBehavior_Hopper
;
SPRITE_BEHAVIORS_HOPPER_JUMP_STRENGTH:      ; [$aa7c]
    db $04                                  ; [0]:
    db $05                                  ; [1]:
    db $06                                  ; [2]:
    db $07                                  ; [3]:
    db $07                                  ; [4]:

;
; XREFS:
;     SpriteBehavior_Hopper
;
SPRITE_BEHAVIOR_HOPPER_MAX_COUNTERS:        ; [$aa81]
    db $c0                                  ; [0]:
    db $60                                  ; [1]:
    db $30                                  ; [2]:
    db $18                                  ; [3]:
    db $30                                  ; [4]:


;============================================================================
; TODO: Document SpriteBehavior__aa86
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a60b]
;============================================================================
SpriteBehavior__aa86:                       ; [$aa86]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__aaae
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_InternalBehaviorStates,X
    LDA #$03
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_EnableBehavior
    LDA CurrentSprites_Flags,X
    ORA #$80
    STA CurrentSprites_Flags,X

  @LAB_PRG14__aaae:                         ; [$aaae]
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_030c,X
    STA a:Arg_DeltaX_Full
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_031c,X
    STA a:Arg_DeltaX_Frac
    JSR Sprite_MoveAndTurnAroundIfNeeded
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aaf2,Y
    TAY
    LDA CurrentSprites_StateCounter,X
    JSR Sprites_CalcYFromGravity
    PHA
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aaf6,Y
    TAY
    PLA
    JSR CalcVerticalSpriteMovement
    JSR Sprite_MoveVertical
    INC CurrentSprites_StateCounter,X
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$aaf2,Y
    TAY
    DEY
    LDA CurrentSprites_StateCounter,X
    AND #$83f7,Y
    BNE @LAB_PRG14__aaef
    JMP Sprite_ChangeYDirection

  @LAB_PRG14__aaef:                         ; [$aaef]
    JMP FUN_PRG14__a6af

;
; XREFS:
;     SpriteBehavior__aa86
;
BYTE_ARRAY_PRG14__aaf2:                     ; [$aaf2]
    db $03                                  ; [0]:
    db $04                                  ; [1]:
    db $05                                  ; [2]:
    db $06                                  ; [3]:

;
; XREFS:
;     SpriteBehavior__aa86
;
BYTE_ARRAY_PRG14__aaf6:                     ; [$aaf6]
    db $03                                  ; [0]:
    db $05                                  ; [1]:
    db $05                                  ; [2]:
    db $07                                  ; [3]:


;============================================================================
; TODO: Document SpriteBehavior__aafa
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a60d]
;============================================================================
SpriteBehavior__aafa:                       ; [$aafa]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__ab14
    LDY #$00
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    INY
    LDA (Sprites_ReadInfoAddr),Y
    STA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    LDA #$02
    JSR Screen_IncSpriteInfoAddr
    JSR Sprite_EnableBehavior

  @LAB_PRG14__ab14:                         ; [$ab14]
    LDA CurrentSprites_MaybeBehaviorAddr_L_BYTE_ARRAY_0324,X
    STA a:Arg_DeltaY_Frac
    LDA CurrentSprites_MaybeBehaviorAddr_U_BYTE_ARRAY_0314,X
    STA a:Arg_DeltaY_Full
    JSR MoveSpriteVertBorder
    JMP FUN_PRG14__a6af


;============================================================================
; TODO: Document SpriteBehavior__MaybeSugata
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a625]
;============================================================================
SpriteBehavior__MaybeSugata:                ; [$ab26]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__ab39
    LDA #$02
    STA CurrentSprites_TickCounters,X
    LDA ScreenColorMode
    ORA #$01
    STA ScreenColorMode
    JSR Sprite_EnableBehavior

  @LAB_PRG14__ab39:                         ; [$ab39]
    DEC CurrentSprites_TickCounters,X
    BNE @_return
    LDA ScreenColorMode
    AND #$fe
    STA ScreenColorMode
    LDA #$04
    JSR #$d0e4
    LDA #$3c
    STA Player_InvincibilityPhase
    LDA Player_StatusFlag
    ORA #$02
    STA Player_StatusFlag
    LDA #$00
    STA a:Arg_PlayerHealthDelta_L
    LDA #$0a
    STA a:Arg_PlayerHealthDelta_U
    JSR #$c08e
    LDX a:CurrentSpriteIndex
    JMP Sprite_ClearBehaviorReadyAndSetSubtypeBit7

  @_return:                                 ; [$ab66]
    RTS


;============================================================================
; TODO: Document SpriteBehavior__ab67
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a663]
;============================================================================
SpriteBehavior__ab67:                       ; [$ab67]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__ab77
    LDA #$00
    STA CurrentSprites_TickCounters,X
    STA CurrentSprites_Phases,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__ab77:                         ; [$ab77]
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$08
    BCC @_return
    INC CurrentSprites_Phases,X
    LDY CurrentSprites_Phases,X
    CPY #$0a
    BCS @LAB_PRG14__abb0
    LDA CurrentSprites_XPos,X
    CLC
    ADC #$abb6,Y
    STA CurrentSprites_XPos,X
    LDA CurrentSprites_YPos,X
    CLC
    ADC #$abc1,Y
    STA CurrentSprites_YPos,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    LDA #$03
    JSR #$d0e4
    LDA CurrentSprites_Phases,X
    CMP #$05
    BCS @_return
    JMP FUN_PRG14__ac21

  @_return:                                 ; [$abaf]
    RTS

  @LAB_PRG14__abb0:                         ; [$abb0]
    LDA #$ff
    STA CurrentSprites_Entities,X
    RTS

;
; XREFS:
;     SpriteBehavior__ab67
;
BYTE_ARRAY_PRG14__abb6:                     ; [$abb6]
    db $00                                  ; [0]:
    db $20                                  ; [1]:
    db $f0                                  ; [2]:
    db $f0                                  ; [3]:
    db $20                                  ; [4]:
    db $e0                                  ; [5]:
    db $20                                  ; [6]:
    db $f0                                  ; [7]:
    db $f0                                  ; [8]:
    db $20                                  ; [9]:
    db $e0                                  ; [10]:

;
; XREFS:
;     SpriteBehavior__ab67
;
BYTE_ARRAY_PRG14__abc1:                     ; [$abc1]
    db $00                                  ; [0]:
    db $20                                  ; [1]:
    db $f0                                  ; [2]:
    db $10                                  ; [3]:
    db $e0                                  ; [4]:
    db $00                                  ; [5]:
    db $20                                  ; [6]:
    db $f0                                  ; [7]:
    db $10                                  ; [8]:
    db $e0                                  ; [9]:
    db $00                                  ; [10]:


;============================================================================
; TODO: Document SpriteBehavior__abcc
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5f5]
;     SPRITE_BEHAVIOR_ADDRS [$PRG14::a5f7]
;============================================================================
SpriteBehavior__abcc:                       ; [$abcc]
    JSR Sprite_IsSpriteBehaviorDisabled
    BNE @LAB_PRG14__abd9
    LDA #$00
    STA CurrentSprites_TickCounters,X
    JSR Sprite_EnableBehavior

  @LAB_PRG14__abd9:                         ; [$abd9]
    INC CurrentSprites_TickCounters,X
    LDA CurrentSprites_TickCounters,X
    CMP #$08
    BCC @LAB_PRG14__abeb
    JSR FUN_PRG14__ac21
    LDA #$ff
    STA CurrentSprites_Entities,X

  @LAB_PRG14__abeb:                         ; [$abeb]
    RTS


;============================================================================
; Show an effect for the death of a big enemy.
;
; This will replace the sprite with a big enemy death effect.
;
; INPUTS:
;     X:
;         The index of the enemy sprite.
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;============================================================================
Sprite_ShowBigEnemyDeathByMagicOrWeapon:    ; [$abec]
    LDA #$64
    JMP Sprite_SetDeathEntity


;============================================================================
; Show an effect for the death of a normal enemy by weapon.
;
; This will replace the sprite with an enemy death effect.
;
; INPUTS:
;     X:
;         The index of the enemy sprite.
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_HitSpriteWithWeapon
;============================================================================
Sprite_ShowNormalEnemyDeathByWeapon:        ; [$abf1]
    LDA #$13
    JMP Sprite_SetDeathEntity


;============================================================================
; Show an effect for the death of a normal enemy by magic.
;
; This will clear sprite state, stop the sprite behavior,
; and set an explosion animation.
;
; INPUTS:
;     X:
;         The index of the enemy sprite.
;
; OUTPUTS:
;     None
;
; XREFS:
;     Player_HitEnemyWithMagic
;============================================================================
Sprite_ShowNormalEnemyDeathByMagic:         ; [$abf6]
    LDA #$14

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Sprite_SetDeathEntity
;
; INPUTS:
;     A
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Sprite_ShowBigEnemyDeathByMagicOrWeapon
;     Sprite_ShowNormalEnemyDeathByWeapon
;============================================================================
Sprite_SetDeathEntity:                      ; [$abf8]
    PHA
    LDA CurrentSprites_Entities,X
    STA CurrentSprites_InternalBehaviorStates,X
    PLA
    STA CurrentSprites_Entities,X
    ASL A
    TAY
    LDA #$ad2d,Y
    STA CurrentSprites_BehaviorAddrs_L,X
    LDA #$ad2e,Y
    STA CurrentSprites_BehaviorAddrs_U,X
    LDA #$ff
    STA CurrentSprites_Subtypes,X
    STA CurrentSprites_HitByMagicBehavior,X
    LDA #$00
    STA CurrentSprites_TickCounters,X
    JMP Sprite_DisableBehavior


;============================================================================
; TODO: Document FUN_PRG14__ac21
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SpriteBehavior__ab67
;     SpriteBehavior__abcc
;============================================================================
FUN_PRG14__ac21:                            ; [$ac21]
    JSR Sprites_HasMaxOnScreen
    BCS @_return
    JSR Maybe_Sprite_HandleDeathDrop
    LDX a:CurrentSpriteIndex

  @_return:                                 ; [$ac2c]
    RTS


;============================================================================
; TODO: Document Maybe_Sprite_HandleDeathDrop
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__ac21
;============================================================================
Maybe_Sprite_HandleDeathDrop:               ; [$ac2d]
    STY Temp_00
    LDY CurrentSprites_InternalBehaviorStates,X
    LDA #$b672,Y
    CMP #$ff
    BEQ @_return
    CMP #$40
    BCS @_return
    STA Temp_01
    TAY
    LDA #$aced,Y
    LDY Temp_00
    STA CurrentSprites_Values,Y
    LDA CurrentSprites_XPos,X
    STA CurrentSprites_XPos,Y
    LDA CurrentSprites_YPos,X
    STA CurrentSprites_YPos,Y
    LDA #$00
    STA CurrentSprites_HitCounter,Y
    LDA #$ff
    STA CurrentSprites_HitByMagicBehavior,Y
    LDY #$00
    LDA Temp_01
    CMP #$30
    BCC @LAB_PRG14__ac66
    INY
    INY

  @LAB_PRG14__ac66:                         ; [$ac66]
    LDA #$ac72,Y
    PHA
    LDA #$ac71,Y
    PHA
    LDY Temp_00

  @_return:                                 ; [$ac70]
    RTS


;============================================================================
; XXX Address lookup table for next handlers
;============================================================================

;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;
SPRITE_DROP_HANDLERS:                       ; [$ac71]
    dw Sprites_ReplaceWithCoinDrop-1

;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;
USHORT_PRG14__ac73:                         ; [$ac73]
    dw Sprite_ReplaceWithBreadDrop-1


;============================================================================
; MAYBE: Replace a sprite with a coin.
;
; This is used when a sprite is killed and drops a coin.
;
; INPUTS:
;     Y:
;         The index of the sprite.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;     CurrentSprites_BehaviorAddrs_L:
;     CurrentSprites_BehaviorAddrs_U:
;     CurrentSprites_Subtypes:
;     CurrentSprites_HitBoxTypes:
;         The new bread sprite state.
;
; CALLS:
;     Sprite_DisableBehavior
;
; XREFS:
;     SPRITE_DROP_HANDLERS [$PRG14::ac71]
;============================================================================
Sprites_ReplaceWithCoinDrop:                ; [$ac75]
    LDA #$10
    JSR #$d0e4
    TYA
    TAX
    LDA #$02


;============================================================================
; Replace a sprite with a dropped item sprite.
;
; This will replace a sprite on the screen with a dropped
; item (bread or coin). The entity, sprite behavior,
; subtype, and hitbox type will all be set.
;
; INPUTS:
;     SPRITE_BEHAVIOR_ADDRS:
;         The lookup table of sprite behavior addresses.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;         The updated sprite entities on the screen.
;
;     CurrentSprites_BehaviorAddrs_L:
;     CurrentSprites_BehaviorAddrs_U:
;         The updated sprite behaviors.
;
;     CurrentSprites_Subtypes:
;         The updated subtypes.
;
;     CurrentSprites_HitBoxTypes:
;         The updated hitbox types.
;
; CALLS:
;     Sprite_DisableBehavior
;
; XREFS:
;     Sprite_ReplaceWithBreadDrop
;============================================================================
Sprite_ReplaceWithDroppedItem:              ; [$ac7e]
    ;
    ; Set the sprite entity.
    ;
    STA CurrentSprites_Entities,X           ; Set the provided sprite entity
                                            ; at the given index.

    ;
    ; Set the sprite behavior address.
    ;
    ASL A                                   ; Convert the sprite entity to a
                                            ; word boundary for the behavior
                                            ; addresses.
    TAY                                     ; Y = A
    LDA #$ad2d,Y                            ; Load the lower byte of the
                                            ; sprite behavior for this
                                            ; entity.
    STA CurrentSprites_BehaviorAddrs_L,X    ; Set it as the current behavior
                                            ; for this sprite.
    LDA #$ad2e,Y                            ; Load the upper byte.
    STA CurrentSprites_BehaviorAddrs_U,X    ; And set that.

    ;
    ; Set the sprite subtype to 0xFF (unset).
    ;
    LDA #$ff                                ; A = 0xFF
    STA CurrentSprites_Subtypes,X           ; Set it as the subtype.

    ;
    ; Set the sprite hitbox.
    ;
    LDY #$02                                ; Y = 2
    LDA #$b4df,Y                            ; A = hitbox type for Y.
    STA CurrentSprites_HitBoxTypes,X        ; Set as the hitbox.

    ;
    ; Disable sprite behaviors.
    ;
    JMP Sprite_DisableBehavior              ; Disable behaviors for this
                                            ; sprite.


;============================================================================
; Replace a sprite with bread.
;
; This is used when a sprite is killed and drops bread.
;
; INPUTS:
;     Y:
;         The index of the sprite.
;
; OUTPUTS:
;     CurrentSprites_Entities:
;     CurrentSprites_BehaviorAddrs_L:
;     CurrentSprites_BehaviorAddrs_U:
;     CurrentSprites_Subtypes:
;     CurrentSprites_HitBoxTypes:
;         The new bread sprite state.
;
; CALLS:
;     Sprite_DisableBehavior
;
; XREFS:
;     USHORT_PRG14__ac73 [$PRG14::ac73]
;============================================================================
Sprite_ReplaceWithBreadDrop:                ; [$ac9f]
    TYA                                     ; A = Y (sprite index)
    TAX                                     ; X = A
    LDA #$01                                ; A = 1
    JMP Sprite_ReplaceWithDroppedItem


;============================================================================
; TODO: Document Sprite_ReplaceWithMattock
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;============================================================================
Sprite_ReplaceWithMattock:                  ; [$aca6]
    JSR @_Sprites_ReplaceWithMattock_HasMaxOnScreen ; Check if all sprite
                                                    ; slots are populated.
    BCS @_return                            ; If so, return.

    ;
    ; There are unpopulated slots. Populate at the given index.
    ;
    LDA #$50                                ; A = Mattock sprite ID.
    STA CurrentSprites_Entities,X           ; Store as the entity at this
                                            ; index.
    ASL A                                   ; Normalize to a word boundary.
    TAY                                     ; Y = A

    ;
    ; Set the behavior address for the Mattock to
    ; SPRITE_BEHAVIORS_OBJ_MATTOCK.
    ;
    LDA #$ad2d,Y                            ; A = 0x1B.
    STA CurrentSprites_BehaviorAddrs_L,X    ; Set as lower byte.
    LDA #$ad2e,Y                            ; A = 0xB2.
    STA CurrentSprites_BehaviorAddrs_U,X    ; Set as upper byte.

    ;
    ; Set the subtype to 0xFF (unset).
    ;
    LDA #$ff                                ; A = 0xFF
    STA CurrentSprites_Subtypes,X           ; Set subtype to A.

    ;
    ; Set the hitbox of the sprite.
    ;
    LDY CurrentSprites_Entities,X           ; Y = sprite entity.
    LDA #$b4df,Y                            ; A = hitbox type for Y.
    STA CurrentSprites_HitBoxTypes,X        ; Store as the hitbox type.

    ;
    ; Set the Y position of the sprite to 32.
    ;
    LDA #$20                                ; A = 32
    STA CurrentSprites_YPos,X               ; Set as X position.

    ;
    ; Set the X position of the sprite as 120.
    ;
    LDA #$78                                ; A = 120
    STA CurrentSprites_XPos,X               ; Set as X position.

    ;
    ; Set the PPU address for the sprite.
    ;
    LDA #$90                                ; A = 0x90
    STA CurrentSprites_PPUAddrs,X           ; Set as the PPU address.
    JMP Sprite_DisableBehavior              ; Disable behaviors for the
                                            ; sprite.

  @_return:                                 ; [$acdc]
    RTS


;============================================================================
; Return whether all sprite slots are populated.
;
; This is similar to Sprites_HasMaxOnScreen, but
; is specific to Sprite_ReplaceWithMattock.
;
; It differs in that the counter variable is X instead of Y.
;
; INPUTS:
;     CurrentSprites_Entities:
;         All populated sprite entities on the screen.
;
; OUTPUTS:
;     C:
;         1 if all sprite slot are populated.
;         0 if any are unpopulated.
;
; XREFS:
;     Sprite_ReplaceWithMattock
;============================================================================
  @_Sprites_ReplaceWithMattock_HasMaxOnScreen: ; [$acdd]
    LDX #$07                                ; X = 7 (our loop counter)

  @_loop:                                   ; [$acdf]
    LDA CurrentSprites_Entities,X           ; A = sprite entity at X
    CMP #$ff                                ; Is it 0xFF (unpopulated)?
    BNE @_isPopulated                       ; If not, jump to prepare the
                                            ; next loop.

    ;
    ; There's an unpopulated sprite. Return a false result.
    ;
    CLC                                     ; Set C = 0
    RTS                                     ; And return it.

  @_isPopulated:                            ; [$ace8]
    DEX                                     ; X--
    BPL @_loop                              ; If >= 0, loop.

    ;
    ; All slots are populated. Return a true result.
    ;
    SEC                                     ; Set C = 1
    RTS                                     ; And return it.

;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;
SPRITE_MAYBE_DROP_RANDOM_DATA:              ; [$aced]
    db $0a                                  ; [0]:
    db $0f                                  ; [1]:
    db $12                                  ; [2]:
    db $14                                  ; [3]:
    db $16                                  ; [4]:
    db $1a                                  ; [5]:
    db $20                                  ; [6]:
    db $35                                  ; [7]:
    db $38                                  ; [8]:
    db $3b                                  ; [9]:
    db $3f                                  ; [10]:
    db $40                                  ; [11]:
    db $43                                  ; [12]:
    db $48                                  ; [13]:
    db $4a                                  ; [14]:
    db $4e                                  ; [15]:
    db $55                                  ; [16]:
    db $5a                                  ; [17]:
    db $62                                  ; [18]:
    db $64                                  ; [19]:
    db $73                                  ; [20]:
    db $78                                  ; [21]:
    db $80                                  ; [22]:
    db $88                                  ; [23]:
    db $96                                  ; [24]:
    db $b4                                  ; [25]:
    db $be                                  ; [26]:
    db $c8                                  ; [27]:
    db $dc                                  ; [28]:
    db $e6                                  ; [29]:
    db $f0                                  ; [30]:
    db $fa                                  ; [31]:
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
    db $02                                  ; [48]:
    db $04                                  ; [49]:
    db $08                                  ; [50]:
    db $10                                  ; [51]:
    db $0e                                  ; [52]:
    db $14                                  ; [53]:
    db $19                                  ; [54]:
    db $1e                                  ; [55]:
    db $1f                                  ; [56]:
    db $28                                  ; [57]:
    db $32                                  ; [58]:
    db $37                                  ; [59]:
    db $3c                                  ; [60]:
    db $40                                  ; [61]:
    db $46                                  ; [62]:
    db $4c                                  ; [63]:


;============================================================================
; A mapping of sprite entity IDs to behavior state addresses.
;============================================================================

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
SPRITE_BEHAVIOR_STATE_ADDRS:                ; [$ad2d]
    dw $adf7                                ; [0]:

;
; XREFS:
;     Sprite_ReplaceWithDroppedItem
;
SPRITE_BEHAVIOR_STATE_ADDRS_1_:             ; [$ad2f]
    dw $adf8                                ; [1]:

;
; XREFS:
;     Sprite_ReplaceWithDroppedItem
;
SPRITE_BEHAVIOR_STATE_ADDRS_2_:             ; [$ad31]
    dw $af02                                ; [2]:
    dw $ae02                                ; [3]:
    dw $ae16                                ; [4]:
    dw $af31                                ; [5]:
    dw $af06                                ; [6]:
    dw $ae0a                                ; [7]:
    dw $ae0e                                ; [8]:
    dw $ae12                                ; [9]:
    dw $b120                                ; [10]:
    dw $af35                                ; [11]:
    dw $aee5                                ; [12]:
    dw $af39                                ; [13]:
    dw $af3d                                ; [14]:
    dw $af54                                ; [15]:
    dw $af58                                ; [16]:
    dw $b0ac                                ; [17]:
    dw $b0d3                                ; [18]:

;
; XREFS:
;     Sprite_SetDeathEntity
;
SPRITE_BEHAVIOR_STATE_ADDRS_19_:            ; [$ad53]
    dw $af5c                                ; [19]:

;
; XREFS:
;     Sprite_SetDeathEntity
;
SPRITE_BEHAVIOR_STATE_ADDRS_20_:            ; [$ad55]
    dw $af60                                ; [20]:
    dw $af68                                ; [21]:
    dw $adf7                                ; [22]:
    dw $af89                                ; [23]:
    dw $af98                                ; [24]:
    dw $afb5                                ; [25]:
    dw $b01b                                ; [26]:
    dw $b01f                                ; [27]:
    dw $b044                                ; [28]:
    dw $b0a8                                ; [29]:
    dw $b048                                ; [30]:
    dw $b07a                                ; [31]:
    dw $b07e                                ; [32]:
    dw $b07a                                ; [33]:
    dw $b058                                ; [34]:
    dw $b05c                                ; [35]:
    dw $b060                                ; [36]:
    dw $adf7                                ; [37]:
    dw $ae8c                                ; [38]:
    dw $b064                                ; [39]:
    dw $b068                                ; [40]:
    dw $adf7                                ; [41]:
    dw $aecc                                ; [42]:
    dw $b072                                ; [43]:
    dw $b076                                ; [44]:
    dw $b0d7                                ; [45]:
    dw $b0db                                ; [46]:
    dw $b108                                ; [47]:
    dw $b10c                                ; [48]:
    dw $b110                                ; [49]:
    dw $b114                                ; [50]:
    dw $b118                                ; [51]:
    dw $b124                                ; [52]:
    dw $b131                                ; [53]:
    dw $b149                                ; [54]:
    dw $b167                                ; [55]:
    dw $b16b                                ; [56]:
    dw $b173                                ; [57]:
    dw $b17d                                ; [58]:
    dw $b19e                                ; [59]:
    dw $b1ae                                ; [60]:
    dw $b1b2                                ; [61]:
    dw $b1ba                                ; [62]:
    dw $b1c2                                ; [63]:
    dw $b1c6                                ; [64]:
    dw $b1cc                                ; [65]:
    dw $b1de                                ; [66]:
    dw $b1a6                                ; [67]:
    dw $b1eb                                ; [68]:
    dw $b1fa                                ; [69]:
    dw $ae43                                ; [70]:
    dw $aeb1                                ; [71]:
    dw $b20f                                ; [72]:
    dw $b253                                ; [73]:
    dw $b257                                ; [74]:
    dw $b217                                ; [75]:
    dw $b217                                ; [76]:
    dw $b217                                ; [77]:
    dw $b20b                                ; [78]:
    dw $b217                                ; [79]:

;
; XREFS:
;     Sprite_ReplaceWithMattock
;
SPRITE_BEHAVIOR_STATE_ADDRS_80_:            ; [$adcd]
    dw $b21b                                ; [80]:

;
; XREFS:
;     Sprite_Maybe_ResetState
;
SPRITE_BEHAVIOR_STATE_ADDRS_81_:            ; [$adcf]
    dw $b11c                                ; [81]:
    dw $b223                                ; [82]:
    dw $ae06                                ; [83]:
    dw $b11c                                ; [84]:
    dw $b213                                ; [85]:
    dw $b21f                                ; [86]:
    dw $b24f                                ; [87]:
    dw $b243                                ; [88]:
    dw $b247                                ; [89]:
    dw $b24b                                ; [90]:
    dw $b25b                                ; [91]:
    dw $b25f                                ; [92]:
    dw $b263                                ; [93]:
    dw $b267                                ; [94]:
    dw $b26b                                ; [95]:
    dw $b26f                                ; [96]:
    dw $b22b                                ; [97]:
    dw $b233                                ; [98]:
    dw $b23b                                ; [99]:
    dw $af64                                ; [100]:

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad2d]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad59]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad77]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad7f]
;
SPRITE_BEHAVIORS_NONE:                      ; [$adf7]
    db $ff                                  ; [$adf7] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad2f]
;
SPRITE_BEHAVIORS_OBJ_BREAD:                 ; [$adf8]
    db $00,$09,$00,$00,$00,$03,$00,$15,$ff,$ff ; [$adf8] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad33]
;
SPRITE_BEHAVIORS_GARBLED_03:                ; [$ae02]
    db $00,$03,$00,$ff                      ; [$ae02] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::add3]
;
SPRITE_BEHAVIORS_UNKNOWN_83:                ; [$ae06]
    db $00,$1d,$00,$ff                      ; [$ae06] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad3b]
;
SPRITE_BEHAVIORS_ENEMY_HORNET:              ; [$ae0a]
    db $00,$3f,$00,$ff                      ; [$ae0a] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad3d]
;
SPRITE_BEHAVIORS_ENEMY_BIHORUDA:            ; [$ae0e]
    db $00,$17,$00,$ff                      ; [$ae0e] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad3f]
;
SPRITE_BEHAVIORS_ENEMY_LILITH:              ; [$ae12]
    db $00,$18,$00,$ff                      ; [$ae12] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad35]
;
SPRITE_BEHAVIORS_ENEMY_RAIDEN:              ; [$ae16]
    db $02,$04,$00,$04,$14,$00,$01,$00,$09,$00,$00,$02,$02,$00,$04,$00 ; [$ae16]
                                                                       ; byte
    db $00,$01,$03,$00,$30,$2f,$ae,$28,$ae,$04,$00,$15,$07,$02,$00,$00 ; [$ae26]
                                                                       ; byte
    db $09,$00,$40,$00,$00,$00,$04,$14,$e0,$00,$05,$16,$ae ; [$ae36] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adb9]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_EYEBALL:      ; [$ae43]
    db $02,$04,$00,$11,$00,$00,$01,$00,$00,$03,$00,$30,$53,$ae,$4c,$ae ; [$ae43]
                                                                       ; byte
    db $04,$00,$01,$0a,$02,$02,$00,$11,$00,$00,$00,$00,$01,$03,$01,$08 ; [$ae53]
                                                                       ; byte
    db $67,$ae,$60,$ae,$04,$00,$01,$0a,$02,$00,$00,$11,$32,$00,$01,$00 ; [$ae63]
                                                                       ; byte
    db $00,$02,$03,$00,$11,$32,$00,$00,$00,$01,$00,$01,$0a,$02,$05,$00 ; [$ae73]
                                                                       ; byte
    db $11,$0a,$00,$00,$00,$01,$05,$43,$ae  ; [$ae83] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad79]
;
SPRITE_BEHAVIORS_ENEMY_IKEDA:               ; [$ae8c]
    db $02,$00,$00,$04,$00,$00,$01,$03,$00,$40,$9a,$ae,$93,$ae,$04,$00 ; [$ae8c]
                                                                       ; byte
    db $09,$00,$00,$01,$01,$00,$00,$0a,$08,$00,$02,$04,$00,$09,$00,$c0 ; [$ae9c]
                                                                       ; byte
    db $00,$02,$05,$8c,$ae                  ; [$aeac] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adbb]
;
SPRITE_BEHAVIORS_ENEMY_ZOZURA:              ; [$aeb1]
    db $02,$00,$00,$04,$3c,$60,$00,$05,$b1,$ae,$02,$00,$00,$04,$3c,$60 ; [$aeb1]
                                                                       ; byte
    db $00,$02,$04,$00,$04,$14,$60,$00,$05,$b1,$ae ; [$aec1] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad81]
;
SPRITE_BEHAVIORS_ENEMY_MONODRON:            ; [$aecc]
    db $02,$04,$00,$15,$05,$00,$09,$00,$00,$01,$02,$02,$00,$00,$15,$14 ; [$aecc]
                                                                       ; byte
    db $00,$09,$00,$80,$01,$02,$05,$cc,$ae  ; [$aedc] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad45]
;
SPRITE_BEHAVIORS_ENEMY_SNOWMAN:             ; [$aee5]
    db $02,$04,$00,$15,$1e,$02,$00,$00,$04,$00,$00,$02,$03,$00,$20,$f8 ; [$aee5]
                                                                       ; byte
    db $ae,$f1,$ae,$04,$00,$09,$00,$00,$02,$04,$05,$e5,$ae ; [$aef5] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad31]
;
SPRITE_BEHAVIORS_OBJ_COIN_APPEAR:           ; [$af02]
    db $00,$02,$00,$ff                      ; [$af02] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad39]
;
SPRITE_BEHAVIORS_ENEMY_ZOMBIE:              ; [$af06]
    db $00,$00,$14,$80,$00,$00,$15,$0a,$02,$04,$00,$00,$28,$80,$00,$00 ; [$af06]
                                                                       ; byte
    db $15,$0a,$02,$00,$00,$00,$14,$80,$00,$00,$15,$0a,$02,$01,$00,$00 ; [$af16]
                                                                       ; byte
    db $28,$80,$00,$00,$15,$3c,$02,$00,$05,$06,$af ; [$af26] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad37]
;
SPRITE_BEHAVIORS_ENEMY_NECRON_AIDES:        ; [$af31]
    db $00,$16,$00,$ff                      ; [$af31] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad43]
;
SPRITE_BEHAVIORS_ENEMY_YUINARU:             ; [$af35]
    db $00,$19,$00,$ff                      ; [$af35] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad47]
;
SPRITE_BEHAVIORS_ENEMY_NASH:                ; [$af39]
    db $00,$1a,$00,$ff                      ; [$af39] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad49]
;
SPRITE_BEHAVIORS_ENEMY_FIRE_GIANT:          ; [$af3d]
    db $02,$00,$00,$15,$00,$03,$00,$20,$49,$af,$42,$af,$04,$02,$00,$00 ; [$af3d]
                                                                       ; byte
    db $04,$28,$80,$01,$05,$3d,$af          ; [$af4d] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad4b]
;
SPRITE_BEHAVIORS_ENEMY_ISHIISU:             ; [$af54]
    db $00,$40,$00,$ff                      ; [$af54] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad4d]
;
SPRITE_BEHAVIORS_ENEMY_EXECUTION_HOOD:      ; [$af58]
    db $00,$41,$00,$ff                      ; [$af58] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad53]
;
SPRITE_BEHAVIORS_LIGHTNING_BALL_19:         ; [$af5c]
    db $00,$07,$00,$ff                      ; [$af5c] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad55]
;
SPRITE_BEHAVIORS_ENEMY_CHARRON:             ; [$af60]
    db $00,$08,$00,$ff                      ; [$af60] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adf5]
;
SPRITE_BEHAVIORS_EFFECT_BOSS_DEATH:         ; [$af64]
    db $00,$3e,$00,$ff                      ; [$af64] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad57]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_21:           ; [$af68]
    db $02,$00,$00,$15,$10,$00,$00,$1e,$c0,$00,$02,$00,$00,$15,$10,$00 ; [$af68]
                                                                       ; byte
    db $00,$1e,$00,$01,$02,$00,$00,$01,$08,$02,$07,$00,$01,$08,$05,$68 ; [$af78]
                                                                       ; byte
    db $af                                  ; [$af88] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad5b]
;
SPRITE_BEHAVIORS_ENEMY_GERIBUTA:            ; [$af89]
    db $02,$04,$00,$1e,$00,$02,$00,$00,$00,$1e,$00,$02,$05,$8e,$af ; [$af89]
                                                                   ; byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad5d]
;
SPRITE_BEHAVIORS_ENEMY_SUGATA:              ; [$af98]
    db $02,$00,$00,$00,$1e,$00,$01,$00,$15,$1e,$00,$00,$28,$00,$01,$00 ; [$af98]
                                                                       ; byte
    db $15,$0a,$00,$00,$14,$80,$00,$00,$1f,$00,$05,$98,$af ; [$afa8] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad5f]
;
SPRITE_BEHAVIORS_ENEMY_GRIMLOCK:            ; [$afb5]
    db $02,$00,$00,$15,$10,$02,$00,$02,$01,$00,$15,$14,$02,$00,$00,$15 ; [$afb5]
                                                                       ; byte
    db $0a,$02,$00,$02,$01,$00,$15,$0e,$02,$00,$00,$15,$10,$02,$00,$02 ; [$afc5]
                                                                       ; byte
    db $01,$00,$15,$12,$02,$00,$00,$15,$00,$03,$01,$10,$ff,$af,$e5,$af ; [$afd5]
                                                                       ; byte
    db $04,$00,$00,$28,$80,$00,$03,$00,$10,$f5,$af,$eb,$af,$05,$b5,$af ; [$afe5]
                                                                       ; byte
    db $04,$00,$09,$00,$00,$01,$02,$05,$b5,$af,$04,$07,$09,$00,$00,$28 ; [$aff5]
                                                                       ; byte
    db $00,$02,$03,$00,$10,$11,$b0,$07,$b0,$05,$b5,$af,$04,$00,$09,$00 ; [$b005]
                                                                       ; byte
    db $00,$02,$02,$05,$b5,$af              ; [$b015] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad61]
;
SPRITE_BEHAVIORS_ENEMY_GIANT_BEES:          ; [$b01b]
    db $00,$20,$00,$ff                      ; [$b01b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad63]
;
SPRITE_BEHAVIORS_ENEMY_MYCONID:             ; [$b01f]
    db $02,$00,$00,$00,$3c,$40,$00,$00,$15,$1e,$02,$00,$00,$00,$3c,$40 ; [$b01f]
                                                                       ; byte
    db $00,$00,$15,$1e,$00,$00,$28,$80,$00,$00,$09,$00,$80,$00,$02,$00 ; [$b02f]
                                                                       ; byte
    db $15,$1e,$05,$1f,$b0                  ; [$b03f] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad65]
;
SPRITE_BEHAVIORS_ENEMY_NAGA:                ; [$b044]
    db $00,$21,$00,$ff                      ; [$b044] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad69]
;
SPRITE_BEHAVIORS_ENEMY_GIANT_STRIDER:       ; [$b048]
    db $02,$00,$00,$00,$3c,$00,$01,$00,$09,$00,$00,$01,$02,$05,$48,$b0 ; [$b048]
                                                                       ; byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad71]
;
SPRITE_BEHAVIORS_ENEMY_YAREEKA:             ; [$b058]
    db $00,$22,$00,$ff                      ; [$b058] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad73]
;
SPRITE_BEHAVIORS_ENEMY_MAGMAN:              ; [$b05c]
    db $00,$23,$00,$ff                      ; [$b05c] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad75]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_36:           ; [$b060]
    db $00,$24,$00,$ff                      ; [$b060] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad7b]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_39:           ; [$b064]
    db $00,$25,$00,$ff                      ; [$b064] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad7d]
;
SPRITE_BEHAVIORS_ENEMY_LAMPREY:             ; [$b068]
    db $02,$00,$00,$00,$3c,$50,$00,$05,$68,$b0 ; [$b068] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad83]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_43:           ; [$b072]
    db $00,$26,$00,$ff                      ; [$b072] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad85]
;
SPRITE_BEHAVIORS_ENEMY_TAMAZUTSU:           ; [$b076]
    db $00,$27,$00,$ff                      ; [$b076] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad6b]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad6f]
;
SPRITE_BEHAVIORS_ENEMY_SIR_GAWAINE_WOLFMAN: ; [$b07a]
    db $00,$28,$00,$ff                      ; [$b07a] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad6d]
;
SPRITE_BEHAVIORS_ENEMY_MASKMAN:             ; [$b07e]
    db $02,$00,$00,$00,$14,$00,$01,$00,$09,$00,$00,$01,$02,$02,$00,$00 ; [$b07e]
                                                                       ; byte
    db $00,$14,$00,$01,$00,$09,$00,$00,$01,$02,$02,$00,$00,$00,$14,$00 ; [$b08e]
                                                                       ; byte
    db $01,$00,$09,$00,$00,$01,$01,$05,$7e,$b0 ; [$b09e] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad67]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_29:           ; [$b0a8]
    db $00,$15,$00,$ff                      ; [$b0a8] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad4f]
;
SPRITE_BEHAVIORS_BOSS_ROKUSUTAHN:           ; [$b0ac]
    db $02,$00,$00,$00,$14,$00,$01,$02,$00,$02,$01,$00,$00,$14,$80,$00 ; [$b0ac]
                                                                       ; byte
    db $02,$00,$00,$00,$08,$00,$01,$03,$00,$10,$ca,$b0,$d0,$b0,$00,$09 ; [$b0bc]
                                                                       ; byte
    db $00,$00,$00,$02,$05,$ac,$b0          ; [$b0cc] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad51]
;
SPRITE_BEHAVIORS_ENEMY_UNUSED_18:           ; [$b0d3]
    db $00,$06,$00,$ff                      ; [$b0d3] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad87]
;
SPRITE_BEHAVIORS_BOSS_RIPASHEIKU:           ; [$b0d7]
    db $00,$0a,$00,$ff                      ; [$b0d7] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad89]
;
SPRITE_BEHAVIORS_BOSS_ZORADOHNA:            ; [$b0db]
    db $02,$00,$00,$01,$3c,$00,$09,$00,$00,$00,$02,$02,$06,$00,$13,$08 ; [$b0db]
                                                                       ; byte
    db $00,$02,$02,$00,$00,$12,$00,$00,$01,$02,$03,$00,$20,$fc,$b0,$f5 ; [$b0eb]
                                                                       ; byte
    db $b0,$04,$02,$00,$00,$09,$00,$00,$02,$01,$05,$ed,$b0 ; [$b0fb] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad8b]
;
SPRITE_BEHAVIORS_BOSS_BORABOHRA:            ; [$b108]
    db $00,$0c,$00,$ff                      ; [$b108] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad8d]
;
SPRITE_BEHAVIORS_BOSS_PAKUKAME:             ; [$b10c]
    db $00,$0d,$00,$ff                      ; [$b10c] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad8f]
;
SPRITE_BEHAVIORS_BOSS_ZORUGERIRU:           ; [$b110]
    db $00,$0e,$00,$ff                      ; [$b110] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad91]
;
SPRITE_BEHAVIORS_BOSS_KING_GRIEVE:          ; [$b114]
    db $00,$0f,$00,$ff                      ; [$b114] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad93]
;
SPRITE_BEHAVIORS_BOSS_SHADOW_EURA:          ; [$b118]
    db $00,$10,$00,$ff                      ; [$b118] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adcf]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::add5]
;
SPRITE_BEHAVIORS_GARBLED_81:                ; [$b11c]
    db $00,$1b,$00,$ff                      ; [$b11c] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad41]
;
SPRITE_BEHAVIORS_GARBLED_10:                ; [$b120]
    db $00,$1c,$00,$ff                      ; [$b120] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad95]
;
SPRITE_BEHAVIORS_NPC_WALKING_MAN_1:         ; [$b124]
    db $00,$04,$3c,$c0,$00,$00,$15,$1e,$02,$00,$05,$24,$b1 ; [$b124] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad97]
;
SPRITE_BEHAVIORS_NPC_UNUSED_BLUE_LADY:      ; [$b131]
    db $00,$04,$50,$80,$00,$02,$01,$00,$04,$14,$80,$00,$02,$01,$00,$04 ; [$b131]
                                                                       ; byte
    db $50,$80,$00,$02,$01,$05,$31,$b1      ; [$b141] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad99]
;
SPRITE_BEHAVIORS_NPC_UNUSED_CHILD:          ; [$b149]
    db $00,$04,$3c,$c0,$00,$00,$09,$00,$00,$01,$03,$00,$09,$00,$00,$01 ; [$b149]
                                                                       ; byte
    db $03,$00,$04,$0a,$c0,$00,$00,$15,$05,$02,$01,$05,$49,$b1 ; [$b159] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad9b]
;
SPRITE_BEHAVIORS_NPC_ARMOR_SALESMAN:        ; [$b167]
    db $00,$15,$00,$ff                      ; [$b167] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad9d]
;
SPRITE_BEHAVIORS_NPC_MARTIAL_ARTS:          ; [$b16b]
    db $00,$15,$01,$02,$00,$05,$6b,$b1      ; [$b16b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ad9f]
;
SPRITE_BEHAVIORS_NPC_PRIEST:                ; [$b173]
    db $02,$00,$06,$ba,$00,$04,$00,$15,$00,$ff ; [$b173] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ada1]
;
SPRITE_BEHAVIORS_NPC_KING:                  ; [$b17d]
    db $00,$15,$00,$03,$00,$40,$87,$b1,$80,$b1,$04,$06,$ba,$00,$08,$00 ; [$b17d]
                                                                       ; byte
    db $15,$00,$03,$00,$48,$8f,$b1,$96,$b1,$04,$06,$ba,$00,$f8,$05,$7d ; [$b18d]
                                                                       ; byte
    db $b1                                  ; [$b19d] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ada3]
;
SPRITE_BEHAVIORS_NPC_MAGIC_TEACHER:         ; [$b19e]
    db $00,$15,$01,$02,$00,$01,$9e,$b1      ; [$b19e] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adb3]
;
SPRITE_BEHAVIORS_NPC_DOCTOR:                ; [$b1a6]
    db $06,$ba,$00,$08,$00,$15,$00,$ff      ; [$b1a6] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ada5]
;
SPRITE_BEHAVIORS_NPC_KEY_SALESMAN:          ; [$b1ae]
    db $00,$15,$00,$ff                      ; [$b1ae] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ada7]
;
SPRITE_BEHAVIORS_NPC_SMOKING_MAN:           ; [$b1b2]
    db $00,$15,$05,$02,$01,$05,$b2,$b1      ; [$b1b2] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ada9]
;
SPRITE_BEHAVIORS_NPC_MAN_IN_CHAIR:          ; [$b1ba]
    db $00,$15,$05,$02,$00,$05,$ba,$b1      ; [$b1ba] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adab]
;
SPRITE_BEHAVIORS_NPC_SITTING_MAN_1:         ; [$b1c2]
    db $00,$15,$00,$ff                      ; [$b1c2] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adad]
;
SPRITE_BEHAVIORS_NPC_MEAT_SALESMAN:         ; [$b1c6]
    db $02,$00,$00,$15,$00,$ff              ; [$b1c6] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adaf]
;
SPRITE_BEHAVIORS_NPC_LADY_BLUE_DRESS_WITH_CUP: ; [$b1cc]
    db $00,$00,$c0,$80,$00,$00,$15,$05,$00,$00,$28,$80,$00,$02,$01,$05 ; [$b1cc]
                                                                       ; byte
    db $cc,$b1                              ; [$b1dc] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adb1]
;
SPRITE_BEHAVIORS_NPC_GUARD_1:               ; [$b1de]
    db $00,$00,$50,$c0,$00,$00,$15,$05,$02,$01,$05,$de,$b1 ; [$b1de] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adb5]
;
SPRITE_BEHAVIORS_NPC_WALKING_WOMAN_1:       ; [$b1eb]
    db $00,$00,$50,$c0,$00,$00,$15,$0a,$02,$01,$02,$00,$05,$eb,$b1 ; [$b1eb]
                                                                   ; byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adb7]
;
SPRITE_BEHAVIORS_NPC_WALKING_WOMAN_2:       ; [$b1fa]
    db $00,$00,$3c,$80,$00,$02,$01,$00,$00,$50,$80,$00,$02,$01,$05,$fa ; [$b1fa]
                                                                       ; byte
    db $b1                                  ; [$b20a] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adc9]
;
SPRITE_BEHAVIORS_OBJ_OINTMENT:              ; [$b20b]
    db $00,$29,$00,$ff                      ; [$b20b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adbd]
;
SPRITE_BEHAVIORS_OBJ_GLOVE:                 ; [$b20f]
    db $00,$2a,$00,$ff                      ; [$b20f] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::add7]
;
SPRITE_BEHAVIORS_OBJ_WINGBOOTS:             ; [$b213]
    db $00,$37,$00,$ff                      ; [$b213] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adc3]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adc5]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adc7]
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adcb]
;
SPRITE_BEHAVIORS_OBJ_POTIONLIKE:            ; [$b217]
    db $00,$15,$00,$ff                      ; [$b217] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adcd]
;
SPRITE_BEHAVIORS_OBJ_MATTOCK:               ; [$b21b]
    db $00,$32,$00,$ff                      ; [$b21b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::add9]
;
SPRITE_BEHAVIORS_OBJ_HOURGLASS:             ; [$b21f]
    db $00,$33,$00,$ff                      ; [$b21f] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::add1]
;
SPRITE_BEHAVIORS_DECO_FOUNTAIN:             ; [$b223]
    db $06,$ba,$00,$08,$00,$39,$00,$ff      ; [$b223] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adef]
;
BYTE_PRG14__b22b:                           ; [$b22b]
    db $06,$ba,$00,$08,$00,$3a,$00,$ff      ; [$b22b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adf1]
;
BYTE_PRG14__b233:                           ; [$b233]
    db $06,$ba,$00,$08,$00,$3b,$00,$ff      ; [$b233] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adf3]
;
BYTE_PRG14__b23b:                           ; [$b23b]
    db $06,$ba,$00,$08,$00,$3c,$00,$ff      ; [$b23b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::addd]
;
SPRITE_BEHAVIORS_OBJ_BATTLE_SUIT:           ; [$b243]
    db $00,$2b,$00,$ff                      ; [$b243] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::addf]
;
SPRITE_BEHAVIORS_OBJ_BATTLE_HELMET:         ; [$b247]
    db $00,$2c,$00,$ff                      ; [$b247] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ade1]
;
SPRITE_BEHAVIORS_OBJ_DRAGON_SLAYER:         ; [$b24b]
    db $00,$2d,$00,$ff                      ; [$b24b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::addb]
;
SPRITE_BEHAVIORS_OBJ_MAGICAL_ROD:           ; [$b24f]
    db $00,$3d,$00,$ff                      ; [$b24f] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adbf]
;
SPRITE_BEHAVIORS_OBJ_BLACK_ONYX:            ; [$b253]
    db $00,$30,$00,$ff                      ; [$b253] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adc1]
;
SPRITE_BEHAVIORS_OBJ_PENDANT:               ; [$b257]
    db $00,$31,$00,$ff                      ; [$b257] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ade3]
;
SPRITE_BEHAVIORS_OBJ_MATTOCK_QUEST:         ; [$b25b]
    db $00,$2e,$00,$ff                      ; [$b25b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ade5]
;
SPRITE_BEHAVIORS_OBJ_WINGSBOOTS_QUEST:      ; [$b25f]
    db $00,$2f,$00,$ff                      ; [$b25f] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ade7]
;
SPRITE_BEHAVIORS_OBJ_RED_POTION2:           ; [$b263]
    db $00,$34,$00,$ff                      ; [$b263] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::ade9]
;
SPRITE_BEHAVIORS_OBJ_POISON:                ; [$b267]
    db $00,$35,$00,$ff                      ; [$b267] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::adeb]
;
SPRITE_BEHAVIORS_OBJ_GLOVE2:                ; [$b26b]
    db $00,$36,$00,$ff                      ; [$b26b] byte

;
; XREFS:
;     SPRITE_BEHAVIOR_STATE_ADDRS [$PRG14::aded]
;
SPRITE_BEHAVIORS_OBJ_OINTMENT2:             ; [$b26f]
    db $00,$38,$00,$ff                      ; [$b26f] byte

    hex 00 00 10 20 00 08 10 08 04 08 08 08 00 00 10 10 ; [$b274] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 10 ; [$b283] undefined
    hex 00 00 10 10 00 00 10 10 00 00 10 10 00 00 10 10 ; [$b293] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 20 ; [$b2a3] undefined
    hex 00 00 10 20 04 00 18 30 00 00 10 20 00 00 00 00 ; [$b2b3] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 10 00 00 10 20 ; [$b2c3] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 20 ; [$b2d3] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 20 ; [$b2e3] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 20 ; [$b2f3] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 20 ; [$b303] undefined
    hex 00 00 10 20 00 00 10 20 00 00 10 20 00 00 10 20 ; [$b313] undefined
    hex 00 00 10 20 00 00 20 40 00 00 20 30 04 00 18 30 ; [$b323] undefined
    hex 00 00 20 20 00 00 10 20 00 00 40 18 08 00 28 50 ; [$b333] undefined
    hex f8 00 20 20 f8 00 20 20 f8 00 20 20 00 00 28 30 ; [$b343] undefined
    hex f0 00 30 20 00 00 30 20 00 00 30 20 f0 00 30 20 ; [$b353] undefined
    hex 00 00 20 20 f8 00 20 20 00 00 20 30 f8 00 20 20 ; [$b363] undefined
    hex f8 00 20 20 f8 00 20 20 f8 00 20 20 f8 00 20 20 ; [$b373] undefined
    hex f8 00 20 20 f8 00 20 20 00 00 10 10 00 00 10 10 ; [$b383] undefined
    hex 00 00 08 10 00 00 08 10 00 00 08 10 00 00 08 10 ; [$b393] undefined
    hex 00 00 08 10 00 00 10 10 00 00 10 10 00 00 10 c0 ; [$b3a3] undefined
    hex 00 00 10 10 04 04 08 08 00 00 20 20 00 00 10 10 ; [$b3b3] undefined
    hex 00 00 10 10 00 00 10 10 00 00 10 10 00 00 10 10 ; [$b3c3] undefined
    hex 00 00 10 10 00 00 10 10 00 00 10 10 00 00 10 10 ; [$b3d3] undefined
    hex 00 00 10 10 00 00 10 10 00 00 10 10 00 00 10 10 ; [$b3e3] undefined
    hex 00 00 10 10 00 00 20 20 00 00 20 20 00 00 20 20 ; [$b3f3] undefined
    db $00,$00,$20,$20                      ; [$b403] undefined

;
; XREFS:
;     Sprites_IsSpriteOutOfWeaponRange
;
MAYBE_SPRITE_EXTENTS_X:                     ; [$b407]
    db $10                                  ; [$b407] undefined

;
; XREFS:
;     Sprites_IsSpriteOutOfWeaponRange
;
MAYBE_SPRITE_EXTENTS_Y:                     ; [$b408]
    hex 20 10 08 08 08 10 10 10 20 10 20 10 20 10 10 10 ; [$b408] undefined
    hex 10 10 10 10 10 10 10 10 20 10 20 10 10 10 20 10 ; [$b418] undefined
    hex 20 20 10 10 20 00 00 10 20 10 20 10 10 10 20 10 ; [$b428] undefined
    hex 20 10 20 10 20 10 20 10 20 10 20 10 20 10 20 10 ; [$b438] undefined
    hex 20 10 20 10 20 10 20 10 20 10 20 10 20 10 20 10 ; [$b448] undefined
    hex 20 10 20 10 20 10 20 10 20 20 20 20 18 20 10 20 ; [$b458] undefined
    hex 18 10 20 40 10 30 20 10 20 10 20 10 20 28 30 20 ; [$b468] undefined
    hex 20 30 20 30 20 20 20 10 20 10 20 10 20 10 20 10 ; [$b478] undefined
    hex 20 10 20 10 20 10 20 10 20 10 20 10 10 10 10 08 ; [$b488] undefined
    hex 10 08 10 08 10 08 10 08 10 10 10 10 10 10 c0 10 ; [$b498] undefined
    hex 10 08 08 20 20 10 10 10 10 10 10 10 10 10 10 10 ; [$b4a8] undefined
    hex 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 ; [$b4b8] undefined
    hex 10 10 10 10 10 10 10 10 10          ; [$b4c8] undefined

;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__82f8
;     MoveRight
;     Sprite_CheckHitByCastMagic
;
SPRITE_HITBOX_WIDTHS:                       ; [$b4d1]
    db $0f                                  ; [0]:
    db $0f                                  ; [1]:
    db $1f                                  ; [2]:
    db $1f                                  ; [3]:
    db $1f                                  ; [4]:
    db $3f                                  ; [5]:
    db $2f                                  ; [6]:

;
; XREFS:
;     CurrentSprite_CanMoveInDirection
;     FUN_PRG14__86c6
;     Sprite_CanClimb
;     Sprite_CheckHitByCastMagic
;     Sprites_CanSpriteWalk
;
SPRITE_HITBOX_HEIGHTS:                      ; [$b4d8]
    db $0f                                  ; [0]:
    db $1f                                  ; [1]:
    db $2f                                  ; [2]:
    db $3f                                  ; [3]:
    db $1f                                  ; [4]:
    db $1f                                  ; [5]:
    db $4f                                  ; [6]:


;============================================================================
; A mapping of sprite entity IDs to hitbox types.
;============================================================================

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
SPRITE_ENTITIES_HITBOX_TYPES:               ; [$b4df]
    db SPRITE_HITBOX_1                      ; [0]:
    db SPRITE_HITBOX_1                      ; [1]:

;
; XREFS:
;     Sprite_ReplaceWithDroppedItem
;
SPRITE_ENTITIES_HITBOX_TYPES_2_:            ; [$b4e1]
    db SPRITE_HITBOX_0                      ; [2]:
    db SPRITE_HITBOX_1                      ; [3]:
    db SPRITE_HITBOX_1                      ; [4]:
    db SPRITE_HITBOX_1                      ; [5]:
    db SPRITE_HITBOX_1                      ; [6]:
    db SPRITE_HITBOX_0                      ; [7]:
    db SPRITE_HITBOX_0                      ; [8]:
    db SPRITE_HITBOX_0                      ; [9]:
    db SPRITE_HITBOX_0                      ; [10]:
    db SPRITE_HITBOX_0                      ; [11]:
    db SPRITE_HITBOX_1                      ; [12]:
    db SPRITE_HITBOX_1                      ; [13]:
    db SPRITE_HITBOX_1                      ; [14]:
    db SPRITE_HITBOX_1                      ; [15]:
    db SPRITE_HITBOX_1                      ; [16]:
    db SPRITE_HITBOX_2                      ; [17]:
    db SPRITE_HITBOX_1                      ; [18]:
    db SPRITE_HITBOX_1                      ; [19]:
    db SPRITE_HITBOX_1                      ; [20]:
    db SPRITE_HITBOX_1                      ; [21]:
    db SPRITE_HITBOX_1                      ; [22]:
    db SPRITE_HITBOX_1                      ; [23]:
    db SPRITE_HITBOX_1                      ; [24]:
    db SPRITE_HITBOX_1                      ; [25]:
    db SPRITE_HITBOX_1                      ; [26]:
    db SPRITE_HITBOX_1                      ; [27]:
    db SPRITE_HITBOX_1                      ; [28]:
    db SPRITE_HITBOX_1                      ; [29]:
    db SPRITE_HITBOX_1                      ; [30]:
    db SPRITE_HITBOX_1                      ; [31]:
    db SPRITE_HITBOX_1                      ; [32]:
    db SPRITE_HITBOX_1                      ; [33]:
    db SPRITE_HITBOX_1                      ; [34]:
    db SPRITE_HITBOX_1                      ; [35]:
    db SPRITE_HITBOX_1                      ; [36]:
    db SPRITE_HITBOX_1                      ; [37]:
    db SPRITE_HITBOX_1                      ; [38]:
    db SPRITE_HITBOX_1                      ; [39]:
    db SPRITE_HITBOX_1                      ; [40]:
    db SPRITE_HITBOX_1                      ; [41]:
    db SPRITE_HITBOX_1                      ; [42]:
    db SPRITE_HITBOX_1                      ; [43]:
    db SPRITE_HITBOX_1                      ; [44]:
    db SPRITE_HITBOX_3                      ; [45]:
    db SPRITE_HITBOX_2                      ; [46]:
    db SPRITE_HITBOX_2                      ; [47]:
    db SPRITE_HITBOX_1                      ; [48]:
    db SPRITE_HITBOX_1                      ; [49]:
    db SPRITE_HITBOX_1                      ; [50]:
    db SPRITE_HITBOX_1                      ; [51]:
    db SPRITE_HITBOX_1                      ; [52]:
    db SPRITE_HITBOX_1                      ; [53]:
    db SPRITE_HITBOX_1                      ; [54]:
    db SPRITE_HITBOX_1                      ; [55]:
    db SPRITE_HITBOX_1                      ; [56]:
    db SPRITE_HITBOX_1                      ; [57]:
    db SPRITE_HITBOX_1                      ; [58]:
    db SPRITE_HITBOX_1                      ; [59]:
    db SPRITE_HITBOX_1                      ; [60]:
    db SPRITE_HITBOX_1                      ; [61]:
    db SPRITE_HITBOX_1                      ; [62]:
    db SPRITE_HITBOX_1                      ; [63]:
    db SPRITE_HITBOX_1                      ; [64]:
    db SPRITE_HITBOX_1                      ; [65]:
    db SPRITE_HITBOX_1                      ; [66]:
    db SPRITE_HITBOX_1                      ; [67]:
    db SPRITE_HITBOX_1                      ; [68]:
    db SPRITE_HITBOX_1                      ; [69]:
    db SPRITE_HITBOX_0                      ; [70]:
    db SPRITE_HITBOX_0                      ; [71]:
    db SPRITE_HITBOX_0                      ; [72]:
    db SPRITE_HITBOX_0                      ; [73]:
    db SPRITE_HITBOX_0                      ; [74]:
    db SPRITE_HITBOX_0                      ; [75]:
    db SPRITE_HITBOX_0                      ; [76]:
    db SPRITE_HITBOX_0                      ; [77]:
    db SPRITE_HITBOX_0                      ; [78]:
    db SPRITE_HITBOX_1                      ; [79]:

;
; XREFS:
;     Sprite_ReplaceWithMattock
;
SPRITE_ENTITIES_HITBOX_TYPES_80_:           ; [$b52f]
    db SPRITE_HITBOX_0                      ; [80]:

;
; XREFS:
;     Sprite_Maybe_ResetState
;
SPRITE_ENTITIES_HITBOX_TYPES_81_:           ; [$b530]
    db SPRITE_HITBOX_0                      ; [81]:
    db SPRITE_HITBOX_4                      ; [82]:
    db SPRITE_HITBOX_0                      ; [83]:
    db SPRITE_HITBOX_0                      ; [84]:
    db SPRITE_HITBOX_0                      ; [85]:
    db SPRITE_HITBOX_0                      ; [86]:
    db SPRITE_HITBOX_0                      ; [87]:
    db SPRITE_HITBOX_0                      ; [88]:
    db SPRITE_HITBOX_0                      ; [89]:
    db SPRITE_HITBOX_0                      ; [90]:
    db SPRITE_HITBOX_0                      ; [91]:
    db SPRITE_HITBOX_0                      ; [92]:
    db SPRITE_HITBOX_0                      ; [93]:
    db SPRITE_HITBOX_0                      ; [94]:
    db SPRITE_HITBOX_0                      ; [95]:
    db SPRITE_HITBOX_0                      ; [96]:
    db SPRITE_HITBOX_4                      ; [97]:
    db SPRITE_HITBOX_4                      ; [98]:
    db SPRITE_HITBOX_4                      ; [99]:
    db SPRITE_HITBOX_1                      ; [100]:


;============================================================================
; The category of a sprite entity.
;
; This is used to categorize a sprite entity into the following:
;
; 0 = Enemy
; 1 = Dropped item
; 2 = NPC
; 3 = Special effect
; 4 = Game trigger
; 5 = Item
; 6 = Magic effect
; 7 = Boss
;============================================================================

;
; XREFS:
;     CurrentSprite_CheckHitPlayer
;     FUN_PRG14__a66b
;     Maybe_Sprites_HasAnyEnemyOnScreen
;     Player_HitEnemyWithMagic
;     Player_HitSpriteWithWeapon
;     Sprite_CheckHitByCastMagic
;     WasPlayerHitByMagic
;     Sprites_HasBoss
;
SPRITE_CATEGORIES_BY_ENTITY:                ; [$b544]
    db SPRITE_ENEMY                         ; [0]:
    db SPRITE_DROPPED                       ; [1]:
    db SPRITE_DROPPED                       ; [2]:
    db SPRITE_ENEMY                         ; [3]:
    db SPRITE_ENEMY                         ; [4]:
    db SPRITE_ENEMY                         ; [5]:
    db SPRITE_ENEMY                         ; [6]:
    db SPRITE_ENEMY                         ; [7]:
    db SPRITE_ENEMY                         ; [8]:
    db SPRITE_ENEMY                         ; [9]:
    db SPRITE_MAGIC                         ; [10]:
    db SPRITE_ENEMY                         ; [11]:
    db SPRITE_ENEMY                         ; [12]:
    db SPRITE_ENEMY                         ; [13]:
    db SPRITE_ENEMY                         ; [14]:
    db SPRITE_ENEMY                         ; [15]:
    db SPRITE_ENEMY                         ; [16]:
    db SPRITE_BOSS                          ; [17]:
    db SPRITE_BOSS                          ; [18]:
    db SPRITE_EFFECT                        ; [19]:
    db SPRITE_EFFECT                        ; [20]:
    db SPRITE_ENEMY                         ; [21]:
    db SPRITE_ENEMY                         ; [22]:
    db SPRITE_ENEMY                         ; [23]:
    db SPRITE_ENEMY                         ; [24]:
    db SPRITE_ENEMY                         ; [25]:
    db SPRITE_ENEMY                         ; [26]:
    db SPRITE_ENEMY                         ; [27]:
    db SPRITE_ENEMY                         ; [28]:
    db SPRITE_ENEMY                         ; [29]:
    db SPRITE_ENEMY                         ; [30]:
    db SPRITE_ENEMY                         ; [31]:
    db SPRITE_ENEMY                         ; [32]:
    db SPRITE_ENEMY                         ; [33]:
    db SPRITE_ENEMY                         ; [34]:
    db SPRITE_ENEMY                         ; [35]:
    db SPRITE_ENEMY                         ; [36]:
    db SPRITE_ENEMY                         ; [37]:
    db SPRITE_ENEMY                         ; [38]:
    db SPRITE_ENEMY                         ; [39]:
    db SPRITE_ENEMY                         ; [40]:
    db SPRITE_ENEMY                         ; [41]:
    db SPRITE_ENEMY                         ; [42]:
    db SPRITE_ENEMY                         ; [43]:
    db SPRITE_ENEMY                         ; [44]:
    db SPRITE_BOSS                          ; [45]:
    db SPRITE_BOSS                          ; [46]:
    db SPRITE_BOSS                          ; [47]:
    db SPRITE_BOSS                          ; [48]:
    db SPRITE_BOSS                          ; [49]:
    db SPRITE_BOSS                          ; [50]:
    db SPRITE_BOSS                          ; [51]:
    db SPRITE_NPC                           ; [52]:
    db SPRITE_NPC                           ; [53]:
    db SPRITE_NPC                           ; [54]:
    db SPRITE_NPC                           ; [55]:
    db SPRITE_NPC                           ; [56]:
    db SPRITE_NPC                           ; [57]:
    db SPRITE_NPC                           ; [58]:
    db SPRITE_NPC                           ; [59]:
    db SPRITE_NPC                           ; [60]:
    db SPRITE_NPC                           ; [61]:
    db SPRITE_NPC                           ; [62]:
    db SPRITE_NPC                           ; [63]:
    db SPRITE_NPC                           ; [64]:
    db SPRITE_NPC                           ; [65]:
    db SPRITE_NPC                           ; [66]:
    db SPRITE_NPC                           ; [67]:
    db SPRITE_NPC                           ; [68]:
    db SPRITE_NPC                           ; [69]:
    db SPRITE_ENEMY                         ; [70]:
    db SPRITE_ENEMY                         ; [71]:
    db SPRITE_ITEM                          ; [72]:
    db SPRITE_ITEM                          ; [73]:
    db SPRITE_ITEM                          ; [74]:
    db SPRITE_ITEM                          ; [75]:
    db SPRITE_ITEM                          ; [76]:
    db SPRITE_ITEM                          ; [77]:
    db SPRITE_ITEM                          ; [78]:
    db SPRITE_TRIGGER                       ; [79]:
    db SPRITE_ITEM                          ; [80]:
    db SPRITE_MAGIC                         ; [81]:
    db SPRITE_EFFECT                        ; [82]:
    db SPRITE_MAGIC                         ; [83]:
    db SPRITE_MAGIC                         ; [84]:
    db SPRITE_ITEM                          ; [85]:
    db SPRITE_ITEM                          ; [86]:
    db SPRITE_ITEM                          ; [87]:
    db SPRITE_ITEM                          ; [88]:
    db SPRITE_ITEM                          ; [89]:
    db SPRITE_ITEM                          ; [90]:
    db SPRITE_ITEM                          ; [91]:
    db SPRITE_ITEM                          ; [92]:
    db SPRITE_ITEM                          ; [93]:
    db SPRITE_ITEM                          ; [94]:
    db SPRITE_ITEM                          ; [95]:
    db SPRITE_ITEM                          ; [96]:
    db SPRITE_EFFECT                        ; [97]:
    db SPRITE_EFFECT                        ; [98]:
    db SPRITE_EFFECT                        ; [99]:
    db SPRITE_EFFECT                        ; [100]:


;============================================================================
; Starting HP for each entity type.
;============================================================================

;
; XREFS:
;     Sprites_PopulateNextAvailableSprite
;
SPRITE_ENTITIES_HP:                         ; [$b5a9]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $12                                  ; [4]:
    db $18                                  ; [5]:
    db $0e                                  ; [6]:
    db $03                                  ; [7]:
    db $05                                  ; [8]:

;
; XREFS:
;     SpriteBehavior__9cf2
;
SPRITE_ENTITIES_HP_9_:                      ; [$b5b2]
    db $07                                  ; [9]:
    db $08                                  ; [10]:
    db $03                                  ; [11]:
    db $10                                  ; [12]:
    db $0c                                  ; [13]:
    db $14                                  ; [14]:
    db $18                                  ; [15]:
    db $64                                  ; [16]:
    db $46                                  ; [17]:
    db $24                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $1a                                  ; [21]:
    db $08                                  ; [22]:
    db $12                                  ; [23]:
    db $16                                  ; [24]:
    db $1d                                  ; [25]:
    db $13                                  ; [26]:
    db $16                                  ; [27]:
    db $17                                  ; [28]:
    db $00                                  ; [29]:
    db $1d                                  ; [30]:
    db $23                                  ; [31]:
    db $20                                  ; [32]:
    db $26                                  ; [33]:
    db $30                                  ; [34]:
    db $17                                  ; [35]:
    db $24                                  ; [36]:
    db $1f                                  ; [37]:
    db $11                                  ; [38]:
    db $20                                  ; [39]:
    db $38                                  ; [40]:
    db $24                                  ; [41]:
    db $0a                                  ; [42]:
    db $0b                                  ; [43]:
    db $1a                                  ; [44]:
    db $4b                                  ; [45]:
    db $73                                  ; [46]:
    db $69                                  ; [47]:
    db $28                                  ; [48]:
    db $18                                  ; [49]:
    db $fa                                  ; [50]:
    db $fa                                  ; [51]:
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
    db $10                                  ; [70]:
    db $09                                  ; [71]:
    db $00                                  ; [72]:
    db $00                                  ; [73]:
    db $00                                  ; [74]:
    db $00                                  ; [75]:
    db $00                                  ; [76]:
    db $00                                  ; [77]:
    db $00                                  ; [78]:
    db $00                                  ; [79]:
    db $00                                  ; [80]:
    db $08                                  ; [81]:
    db $00                                  ; [82]:
    db $08                                  ; [83]:
    db $08                                  ; [84]:
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


;============================================================================
; Experience gained from defeating each entity type.
;============================================================================

;
; XREFS:
;     Player_AddExperienceFromSprite
;
ENEMY_EXPERIENCE:                           ; [$b60e]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $00                                  ; [3]:
    db $23                                  ; [4]:
    db $37                                  ; [5]:
    db $19                                  ; [6]:
    db $19                                  ; [7]:
    db $23                                  ; [8]:
    db $19                                  ; [9]:
    db $00                                  ; [10]:
    db $19                                  ; [11]:
    db $37                                  ; [12]:
    db $3c                                  ; [13]:
    db $2d                                  ; [14]:
    db $0a                                  ; [15]:
    db $32                                  ; [16]:
    db $78                                  ; [17]:
    db $5a                                  ; [18]:
    db $00                                  ; [19]:
    db $00                                  ; [20]:
    db $41                                  ; [21]:
    db $00                                  ; [22]:
    db $28                                  ; [23]:
    db $0d                                  ; [24]:
    db $3a                                  ; [25]:
    db $1d                                  ; [26]:
    db $1a                                  ; [27]:
    db $23                                  ; [28]:
    db $00                                  ; [29]:
    db $30                                  ; [30]:
    db $3a                                  ; [31]:
    db $36                                  ; [32]:
    db $31                                  ; [33]:
    db $1e                                  ; [34]:
    db $3e                                  ; [35]:
    db $26                                  ; [36]:
    db $19                                  ; [37]:
    db $21                                  ; [38]:
    db $1d                                  ; [39]:
    db $1e                                  ; [40]:
    db $18                                  ; [41]:
    db $14                                  ; [42]:
    db $12                                  ; [43]:
    db $0f                                  ; [44]:
    db $5a                                  ; [45]:
    db $9e                                  ; [46]:
    db $4b                                  ; [47]:
    db $55                                  ; [48]:
    db $50                                  ; [49]:
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
    db $19                                  ; [70]:
    db $1e                                  ; [71]:
    db $00                                  ; [72]:
    db $00                                  ; [73]:
    db $00                                  ; [74]:
    db $00                                  ; [75]:
    db $00                                  ; [76]:
    db $00                                  ; [77]:
    db $00                                  ; [78]:
    db $00                                  ; [79]:
    db $00                                  ; [80]:
    db $08                                  ; [81]:
    db $00                                  ; [82]:
    db $08                                  ; [83]:
    db $08                                  ; [84]:
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

;
; XREFS:
;     Maybe_Sprite_HandleDeathDrop
;
BYTE_ARRAY_PRG14__b672:                     ; [$b672]
    db $ff                                  ; [0]:
    db $ff                                  ; [1]:
    db $ff                                  ; [2]:
    db $00                                  ; [3]:
    db $08                                  ; [4]:
    db $11                                  ; [5]:
    db $ff                                  ; [6]:
    db $07                                  ; [7]:
    db $08                                  ; [8]:
    db $ff                                  ; [9]:
    db $00                                  ; [10]:
    db $32                                  ; [11]:
    db $13                                  ; [12]:
    db $12                                  ; [13]:
    db $11                                  ; [14]:
    db $15                                  ; [15]:
    db $1d                                  ; [16]:
    db $15                                  ; [17]:
    db $06                                  ; [18]:
    db $ff                                  ; [19]:
    db $ff                                  ; [20]:
    db $14                                  ; [21]:
    db $00                                  ; [22]:
    db $0f                                  ; [23]:
    db $13                                  ; [24]:
    db $12                                  ; [25]:
    db $14                                  ; [26]:
    db $32                                  ; [27]:
    db $38                                  ; [28]:
    db $ff                                  ; [29]:
    db $16                                  ; [30]:
    db $18                                  ; [31]:
    db $19                                  ; [32]:
    db $1a                                  ; [33]:
    db $33                                  ; [34]:
    db $1b                                  ; [35]:
    db $17                                  ; [36]:
    db $18                                  ; [37]:
    db $13                                  ; [38]:
    db $33                                  ; [39]:
    db $34                                  ; [40]:
    db $33                                  ; [41]:
    db $09                                  ; [42]:
    db $34                                  ; [43]:
    db $15                                  ; [44]:
    db $19                                  ; [45]:
    db $1c                                  ; [46]:
    db $08                                  ; [47]:
    db $16                                  ; [48]:
    db $03                                  ; [49]:
    db $ff                                  ; [50]:
    db $ff                                  ; [51]:
    db $ff                                  ; [52]:
    db $ff                                  ; [53]:
    db $ff                                  ; [54]:
    db $ff                                  ; [55]:
    db $ff                                  ; [56]:
    db $ff                                  ; [57]:
    db $ff                                  ; [58]:
    db $ff                                  ; [59]:
    db $ff                                  ; [60]:
    db $ff                                  ; [61]:
    db $ff                                  ; [62]:
    db $ff                                  ; [63]:
    db $ff                                  ; [64]:
    db $ff                                  ; [65]:
    db $ff                                  ; [66]:
    db $ff                                  ; [67]:
    db $ff                                  ; [68]:
    db $ff                                  ; [69]:
    db $0f                                  ; [70]:
    db $32                                  ; [71]:
    db $ff                                  ; [72]:
    db $ff                                  ; [73]:
    db $ff                                  ; [74]:
    db $ff                                  ; [75]:
    db $ff                                  ; [76]:
    db $ff                                  ; [77]:
    db $ff                                  ; [78]:
    db $ff                                  ; [79]:
    db $ff                                  ; [80]:
    db $00                                  ; [81]:
    db $ff                                  ; [82]:
    db $00                                  ; [83]:
    db $00                                  ; [84]:
    db $ff                                  ; [85]:
    db $ff                                  ; [86]:
    db $ff                                  ; [87]:
    db $ff                                  ; [88]:
    db $ff                                  ; [89]:
    db $ff                                  ; [90]:
    db $ff                                  ; [91]:
    db $ff                                  ; [92]:
    db $ff                                  ; [93]:
    db $ff                                  ; [94]:
    db $ff                                  ; [95]:
    db $ff                                  ; [96]:
    db $ff                                  ; [97]:
    db $ff                                  ; [98]:
    db $ff                                  ; [99]:
    db $ff                                  ; [100]:


;============================================================================
; Attack damage from each sprite entity type.
;============================================================================

;
; XREFS:
;     HandlePlayerHitByMagic
;     Player_ApplyDamage
;
SPRITE_ENTITY_DAMAGES:                      ; [$b6d7]
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $00                                  ; [2]:
    db $1f                                  ; [3]:
    db $07                                  ; [4]: Raiden
    db $09                                  ; [5]: Necron Aides
    db $06                                  ; [6]: Zombie
    db $03                                  ; [7]: Hornet
    db $04                                  ; [8]: Bihoruda
    db $06                                  ; [9]: Lilith
    db $1c                                  ; [10]:
    db $03                                  ; [11]: Yuinaru
    db $04                                  ; [12]: Snowman
    db $05                                  ; [13]: Nash
    db $07                                  ; [14]: Fire Giant
    db $0d                                  ; [15]: Ishiisu
    db $0f                                  ; [16]: Execution Hood
    db $14                                  ; [17]: Rokusutahn
    db $14                                  ; [18]: Unused enemy (round body
                                            ; of snake boss)
    db $00                                  ; [19]: Enemy death effect
    db $00                                  ; [20]: Lightning ball effect
    db $07                                  ; [21]: Charron
    db $0a                                  ; [22]: Unused
    db $0a                                  ; [23]: Geributa
    db $04                                  ; [24]: Sugata
    db $0d                                  ; [25]: Grimlock
    db $05                                  ; [26]: Giant Bees
    db $0e                                  ; [27]: Myconid
    db $17                                  ; [28]: Naga
    db $00                                  ; [29]: Unused (skeleton knight
                                            ; with sword and shield)
    db $0f                                  ; [30]: Giant Strider
    db $0c                                  ; [31]: Sir Gawaine
    db $0b                                  ; [32]: Maskman
    db $11                                  ; [33]: Wolfman
    db $12                                  ; [34]: Yareeka
    db $09                                  ; [35]: Magman
    db $10                                  ; [36]: Unused enemy
                                            ; (curly-tailed guy with spear)
    db $0b                                  ; [37]: Unused enemy
    db $07                                  ; [38]: Ikeda
    db $0a                                  ; [39]: Unused (blue
                                            ; muppet-looking guy)
    db $10                                  ; [40]: Lamprey
    db $0c                                  ; [41]: Unused enemy
    db $05                                  ; [42]: Monodron
    db $06                                  ; [43]: Unused enemy (winged
                                            ; skeleton guy)
    db $0f                                  ; [44]: Tamazutsu
    db $12                                  ; [45]: Ripasheiku
    db $1c                                  ; [46]: Zoradohna
    db $18                                  ; [47]: Borabohra
    db $0d                                  ; [48]: Pakukame
    db $0b                                  ; [49]: Zorugeriru
    db $28                                  ; [50]: King Grieve
    db $29                                  ; [51]: Shadow Eura
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
    db $08                                  ; [70]: Unused enemy (eyeball)
    db $07                                  ; [71]: Zozura
    db $00                                  ; [72]:
    db $00                                  ; [73]:
    db $00                                  ; [74]:
    db $00                                  ; [75]:
    db $00                                  ; [76]:
    db $00                                  ; [77]:
    db $00                                  ; [78]:
    db $00                                  ; [79]:
    db $00                                  ; [80]:
    db $08                                  ; [81]: ? Garbled
    db $00                                  ; [82]:
    db $1c                                  ; [83]:
    db $08                                  ; [84]:
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

;
; XREFS:
;     Player_HitEnemyWithMagic
;
SOMETHING_SPRITE_ENTITY_ADDR_VALUES:        ; [$b73b]
    db $fc                                  ; [0]:
    db $fc                                  ; [1]:
    db $fc                                  ; [2]:
    db $fc                                  ; [3]:
    db $10                                  ; [4]:
    db $50                                  ; [5]:
    db $0c                                  ; [6]:
    db $00                                  ; [7]:
    db $00                                  ; [8]:
    db $00                                  ; [9]:
    db $fc                                  ; [10]:
    db $00                                  ; [11]:
    db $04                                  ; [12]:
    db $fc                                  ; [13]:
    db $40                                  ; [14]:
    db $14                                  ; [15]:
    db $c0                                  ; [16]:
    db $00                                  ; [17]:
    db $d0                                  ; [18]:
    db $fc                                  ; [19]:
    db $fc                                  ; [20]:
    db $00                                  ; [21]:
    db $fc                                  ; [22]:
    db $00                                  ; [23]:
    db $3c                                  ; [24]:
    db $00                                  ; [25]:
    db $0c                                  ; [26]:
    db $14                                  ; [27]:
    db $00                                  ; [28]:
    db $00                                  ; [29]:
    db $00                                  ; [30]:
    db $00                                  ; [31]:
    db $00                                  ; [32]:
    db $00                                  ; [33]:
    db $00                                  ; [34]:
    db $00                                  ; [35]:
    db $00                                  ; [36]:
    db $54                                  ; [37]:
    db $00                                  ; [38]:
    db $40                                  ; [39]:
    db $00                                  ; [40]:
    db $00                                  ; [41]:
    db $00                                  ; [42]:
    db $00                                  ; [43]:
    db $14                                  ; [44]:
    db $40                                  ; [45]:
    db $f4                                  ; [46]:
    db $e0                                  ; [47]:
    db $44                                  ; [48]:
    db $00                                  ; [49]:
    db $fc                                  ; [50]:
    db $fc                                  ; [51]:
    db $fc                                  ; [52]:
    db $fc                                  ; [53]:
    db $fc                                  ; [54]:
    db $fc                                  ; [55]:
    db $fc                                  ; [56]:
    db $fc                                  ; [57]:
    db $fc                                  ; [58]:
    db $fc                                  ; [59]:
    db $fc                                  ; [60]:
    db $fc                                  ; [61]:
    db $fc                                  ; [62]:
    db $fc                                  ; [63]:
    db $fc                                  ; [64]:
    db $fc                                  ; [65]:
    db $fc                                  ; [66]:
    db $fc                                  ; [67]:
    db $fc                                  ; [68]:
    db $fc                                  ; [69]:
    db $00                                  ; [70]:
    db $00                                  ; [71]:
    db $00                                  ; [72]:
    db $fc                                  ; [73]:
    db $fc                                  ; [74]:
    db $00                                  ; [75]:
    db $fc                                  ; [76]:
    db $00                                  ; [77]:
    db $fc                                  ; [78]:
    db $fc                                  ; [79]:
    db $00                                  ; [80]:
    db $fc                                  ; [81]:
    db $fc                                  ; [82]:
    db $fc                                  ; [83]:
    db $fc                                  ; [84]:
    db $fc                                  ; [85]:
    db $fc                                  ; [86]:
    db $fc                                  ; [87]:
    db $fc                                  ; [88]:
    db $fc                                  ; [89]:
    db $fc                                  ; [90]:
    db $fc                                  ; [91]:
    db $fc                                  ; [92]:
    db $fc                                  ; [93]:
    db $fc                                  ; [94]:
    db $fc                                  ; [95]:
    db $fc                                  ; [96]:
    db $fc                                  ; [97]:
    db $fc                                  ; [98]:
    db $fc                                  ; [99]:
    db $fc                                  ; [$b79f] undefined


;============================================================================
; Magic damage.
;============================================================================

;
; XREFS:
;     Player_HitEnemyWithMagic
;
MAGIC_DAMAGE:                               ; [$b7a0]
    db $06                                  ; [0]: Deluge -- 6HP
    db $09                                  ; [1]: Thunder -- 9HP
    db $18                                  ; [2]: Fire -- 12HP
    db $22                                  ; [3]: Death -- 34HP
    db $26                                  ; [4]: Tilte -- 38HP


;============================================================================
; Weapon damage.
;============================================================================

;
; XREFS:
;     Player_HitSpriteWithWeapon
;
WEAPON_STRENGTHS:                           ; [$b7a5]
    db $04                                  ; [0]: Hand Dagger -- 4HP
    db $08                                  ; [1]: Long Sword -- 8HP
    db $0c                                  ; [2]: Giant Blade -- 12HP
    db $10                                  ; [3]: Dragon Slayer -- 16HP


;============================================================================
; MP costs for magic spells.
;============================================================================

;
; XREFS:
;     Player_ReduceMP
;
MAGIC_COSTS:                                ; [$b7a9]
    db $02                                  ; [0]: Deluge
    db $04                                  ; [1]: Thunder
    db $06                                  ; [2]: Fire
    db $0a                                  ; [3]: Death
    db $10                                  ; [4]: Tilte


;============================================================================
; TODO: Document Init_PlayerInventoryState
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
Init_PlayerInventoryState:                  ; [$b7ae]
    LDA #$00
    STA a:NumberOfWeapons
    STA a:NumberOfShields
    STA a:NumberOfMagicSpells
    STA a:NumberOfItems
    STA a:NumberOfArmors

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document PlayerDeath_ResetSelectedItemState
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
PlayerDeath_ResetSelectedItemState:         ; [$b7bf]
    LDA #$00
    STA a:SelectedArmor
    LDA #$ff
    STA a:SelectedWeapon
    STA a:Player_CurWeapon
    STA a:SelectedShield
    STA a:SelectedMagic
    STA a:SelectedItem

    ;
    ; XREFS:
    ;     Player_DrawWeapon
    ;
RETURN_B7D5:                                ; [$b7d5]
    RTS


;============================================================================
; TODO: Document Player_DrawWeapon
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
;============================================================================
Player_DrawWeapon:                          ; [$b7d6]
    LDA a:Temp_03C7
    BPL RETURN_B7D5
    LDA a:Player_CurWeapon
    BMI RETURN_B7D5
    LDA Maybe_Player_NormArmorState
    AND #$01
    STA Temp_00
    JSR Player_GetNormalizedWeaponID
    ASL A
    ORA Temp_00
    ASL A
    TAX
    LDA #$b89f,X
    STA Temp_Addr
    LDA #$b8a0,X
    STA Temp_Addr.U
    JSR Maybe_Player_CalcAnimFrame
    STA Temp_00
    ASL A
    TAY
    LDA Player_Flags
    AND #$40
    BEQ @LAB_PRG14__b806
    INY

  @LAB_PRG14__b806:                         ; [$b806]
    LDA (Temp_Addr),Y
    JSR Something_SetValueAndFFForNeg
    LDA PlayerPosX_Full
    CLC
    ADC Temp_04
    STA PlayerPosXPlus10
    LDA Screen_Maybe_ScrollXCounter
    ADC Temp_05
    STA Maybe_Something_PosX
    CMP Screen_Maybe_ScrollXCounter
    BNE RETURN_B7D5
    LDA a:Player_CurWeapon
    ASL A
    TAX
    LDA #$b90f,X
    STA Temp_Addr
    LDA #$b910,X
    STA Temp_Addr.U
    LDY Temp_00
    LDA PlayerPosY
    CLC
    ADC (Temp_Addr),Y
    STA Maybe_Something_PosY
    LDA Player_Something_ScrollPosY
    ADC #$00
    STA DrawWeapon_Unused_00D1
    LDA a:Player_CurWeapon
    ASL A
    TAX
    LDA #$b897,X
    STA Maybe_WeaponRange_X
    LDA #$b898,X
    STA Maybe_WeaponRange_Y
    LDA Maybe_Something_PosX
    CMP Screen_Maybe_ScrollXCounter
    BEQ @LAB_PRG14__b850
    RTS

  @LAB_PRG14__b850:                         ; [$b850]
    LDA Player_Flags
    AND #$40
    STA CurrentSprite_FlipMask
    LDA PlayerPosXPlus10
    STA Maybe_Arg_CurrentSprite_PosX
    LDA Maybe_Something_PosY
    STA Maybe_Arg_CurrentSprite_PosY
    LDA Temp_00
    PHA
    JSR CurrentSprite_CalculateVisibility_MaybeWithArg
    PLA
    STA Temp_00
    LDX a:Player_CurWeapon
    LDA #$b87c,X
    STA Maybe_CurrentSprite_PPUOffset
    LDA Temp_00
    CLC
    ADC #$b878,X
    JMP #$f039


;============================================================================
; Sprite addresses for each weapon type.
;============================================================================

;
; XREFS:
;     Player_DrawWeapon
;
WEAPONS_SPRITE_L:                           ; [$b878]
    db $40                                  ; [0]:
    db $48                                  ; [1]:
    db $50                                  ; [2]:
    db $58                                  ; [3]:

;
; XREFS:
;     Player_DrawWeapon
;
WEAPONS_SPRITE_U:                           ; [$b87c]
    db $38                                  ; [0]:
    db $38                                  ; [1]:
    db $38                                  ; [2]:
    db $34                                  ; [3]:


;============================================================================
; TODO: Document Something_SetValueAndFFForNeg
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_DrawWeapon
;     FUN_PRG15_MIRROR__ec58
;============================================================================
Something_SetValueAndFFForNeg:              ; [$b880]
    STA Temp_04
    LDA #$00
    STA Temp_05
    LDA Temp_04
    BPL @_return
    LDA #$ff
    STA Temp_05

  @_return:                                 ; [$b88e]
    RTS
    hex 18 10 18 18 18 18 20 00             ; [$b88f] undefined

;
; XREFS:
;     Player_DrawWeapon
;
MAYBE_WEAPON_RANGES_U:                      ; [$b897]
    dw $0408,$0810,$0810,$0810              ; [$b897] ushort

;
; XREFS:
;     Player_DrawWeapon
;
PTR_ARRAY_PRG14__b89f:                      ; [$b89f]
    dw $b8af                                ; [0]:
    dw $b8bf                                ; [1]:
    dw $b8cf                                ; [2]:
    dw $b8df                                ; [3]:
    dw $b8ef                                ; [4]:
    dw $b8ff                                ; [5]:
    dw $b8ff                                ; [6]:
    dw $b8ff                                ; [7]:

;
; XREFS:
;     PTR_ARRAY_PRG14__b89f [$PRG14::b89f]
;
DAT_PRG14__b8af:                            ; [$b8af]
    hex f8 10 fc 0c f8 10 f8 10 f8 10 f8 0e f0 18 00 00 ; [$b8af] undefined

;
; XREFS:
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8a1]
;
DAT_PRG14__b8bf:                            ; [$b8bf]
    hex f8 10 f8 10 f8 10 f8 10 f8 10 f8 10 f0 18 00 00 ; [$b8bf] undefined

;
; XREFS:
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8a3]
;
DAT_PRG14__b8cf:                            ; [$b8cf]
    hex f8 10 fc 0c f8 10 f8 10 f8 10 f0 10 e8 18 00 00 ; [$b8cf] undefined

;
; XREFS:
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8a5]
;
DAT_PRG14__b8df:                            ; [$b8df]
    hex f8 10 f8 10 f8 10 f8 10 f8 10 f0 10 e8 18 00 00 ; [$b8df] undefined

;
; XREFS:
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8a7]
;
DAT_PRG14__b8ef:                            ; [$b8ef]
    hex f0 10 fc 0c f8 10 f0 10 f8 10 f0 10 e8 18 00 00 ; [$b8ef] undefined

;
; XREFS:
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8a9]
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8ab]
;     PTR_ARRAY_PRG14__b89f [$PRG14::b8ad]
;
DAT_PRG14__b8ff:                            ; [$b8ff]
    hex f0 10 f8 10 f8 10 f0 10 f8 10 f0 10 e8 18 00 00 ; [$b8ff] undefined

;
; XREFS:
;     Player_DrawWeapon
;
PTR_ARRAY_PRG14__b90f:                      ; [$b90f]
    dw $b917                                ; [0]: Hand dagger
    dw $b91f                                ; [1]: Long sword
    dw $b91f                                ; [2]: Giant blade
    dw $b91f                                ; [3]: Dragon slayer

;
; XREFS:
;     PTR_ARRAY_PRG14__b90f [$PRG14::b90f]
;
DAT_PRG14__b917:                            ; [$b917]
    hex 08 08 08 08 08 08 06 00             ; [$b917] undefined

;
; XREFS:
;     PTR_ARRAY_PRG14__b90f [$PRG14::b911]
;     PTR_ARRAY_PRG14__b90f [$PRG14::b913]
;     PTR_ARRAY_PRG14__b90f [$PRG14::b915]
;
DAT_PRG14__b91f:                            ; [$b91f]
    hex 00 08 08 00 08 08 06 00             ; [$b91f] undefined


;============================================================================
; TODO: Document Maybe_Player_CalcAnimFrame
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Player_DrawShield
;     Player_DrawWeapon
;     WasPlayerHitByMagic
;============================================================================
Maybe_Player_CalcAnimFrame:                 ; [$b927]
    LDA Player_Flags
    LSR A
    BCC @LAB_PRG14__b933
    LDA Player_Flags
    BMI @LAB_PRG14__b958
    LDA #$03
    RTS

  @LAB_PRG14__b933:                         ; [$b933]
    AND #$04
    BEQ @LAB_PRG14__b954
    LDA PlayerPosX_Full
    AND #$0f
    BEQ @LAB_PRG14__b943
    LDA Player_Flags
    AND #$04
    BNE @LAB_PRG14__b954

  @LAB_PRG14__b943:                         ; [$b943]
    LDA Player_Flags
    AND #$10
    BEQ @LAB_PRG14__b954
    LDA Player_MovementTick
    AND #$10
    ASL A
    ASL A
    STA CurrentSprite_FlipMask
    LDA #$07
    RTS

  @LAB_PRG14__b954:                         ; [$b954]
    LDA Player_Flags
    BPL @LAB_PRG14__b95e

  @LAB_PRG14__b958:                         ; [$b958]
    LDX PlayerHitsPhaseCounter
    LDA #$b97b,X
    RTS

  @LAB_PRG14__b95e:                         ; [$b95e]
    LDA Player_StatusFlag
    BPL @LAB_PRG14__b969
    LDA Joy1_ButtonMask
    BPL @LAB_PRG14__b969
    LDA #$03
    RTS

  @LAB_PRG14__b969:                         ; [$b969]
    LDA Player_Flags
    AND #$20
    BEQ @LAB_PRG14__b976
    LDA Player_MovementTick
    LSR A
    LSR A
    LSR A
    AND #$03

  @LAB_PRG14__b976:                         ; [$b976]
    TAX
    LDA #$b97e,X
    RTS

;
; XREFS:
;     Maybe_Player_CalcAnimFrame
;
BYTE_ARRAY_PRG14__b97b:                     ; [$b97b]
    db $04                                  ; [0]:
    db $05                                  ; [1]:
    db $06                                  ; [2]:

;
; XREFS:
;     Maybe_Player_CalcAnimFrame
;
BYTE_ARRAY_PRG14__b97e:                     ; [$b97e]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:


;============================================================================
; TODO: Document Player_DrawShield
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
;============================================================================
Player_DrawShield:                          ; [$b982]
    LDA a:Temp_03C7
    BPL @_return
    LDA a:SelectedShield
    BMI @_return
    CMP #$03
    BEQ @_return
    JSR Maybe_Player_CalcAnimFrame
    STA Temp_00
    ASL A
    TAY
    LDA Player_Flags
    AND #$40
    BEQ @LAB_PRG14__b99e
    INY

  @LAB_PRG14__b99e:                         ; [$b99e]
    LDA PlayerPosX_Full
    CLC
    ADC #$b9dd,Y
    STA a:Player_ShieldPositionX
    LDA PlayerPosY
    CLC
    ADC #$08
    STA a:Player_ShieldPositionY
    LDA Player_Flags
    AND #$40
    STA CurrentSprite_FlipMask
    LDA #$30
    STA Maybe_CurrentSprite_PPUOffset
    LDA a:Player_ShieldPositionX
    STA Maybe_Arg_CurrentSprite_PosX
    LDA a:Player_ShieldPositionY
    STA Maybe_Arg_CurrentSprite_PosY
    LDA Temp_00
    PHA
    JSR CurrentSprite_CalculateVisibility_MaybeWithArg
    PLA
    STA Temp_00
    LDY Temp_00
    LDA #$b9d5,Y
    JMP #$f039

  @_return:                                 ; [$b9d4]
    RTS

;
; XREFS:
;     Player_DrawShield
;
MAYBE_SHIELD_SPRITE_PPU_OFFSETS:            ; [$b9d5]
    db $60                                  ; [0]:
    db $60                                  ; [1]:
    db $60                                  ; [2]:
    db $60                                  ; [3]:
    db $61                                  ; [4]:
    db $60                                  ; [5]:
    db $62                                  ; [6]:
    db $42                                  ; [7]:

;
; XREFS:
;     Player_DrawShield
;
SHIELD_SPRITE_OFFSETS_X:                    ; [$b9dd]
    db $00                                  ; [0]:
    db $08                                  ; [1]:
    db $00                                  ; [2]:
    db $08                                  ; [3]:
    db $00                                  ; [4]:
    db $08                                  ; [5]:
    db $00                                  ; [6]:
    db $08                                  ; [7]:
    db $00                                  ; [8]:
    db $08                                  ; [9]:
    db $00                                  ; [10]:
    db $08                                  ; [11]:
    db $08                                  ; [12]:
    db $00                                  ; [13]:
    db $00                                  ; [14]:
    db $00                                  ; [15]:


;============================================================================
; TODO: Document CurrentSprite_CalculateVisibility_MaybeWithArg
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
CurrentSprite_CalculateVisibility_MaybeWithArg: ; [$b9ed]
    LDA #$00
    STA Temp_MovingSpriteVisibility
    LDA Maybe_Arg_CurrentSprite_PosY
    STA Arg_PixelPosY
    LDA Maybe_Arg_CurrentSprite_PosX
    CLC
    ADC #$04
    STA Arg_PixelPosX
    JSR #$e86c
    JSR #$e8c3
    CMP #$04
    BEQ @LAB_PRG14__ba0e
    CMP #$0d
    BEQ @LAB_PRG14__ba0e
    CMP #$09
    BNE @LAB_PRG14__ba14

  @LAB_PRG14__ba0e:                         ; [$ba0e]
    LDA Temp_MovingSpriteVisibility
    ORA #$01
    STA Temp_MovingSpriteVisibility

  @LAB_PRG14__ba14:                         ; [$ba14]
    LDA Maybe_Arg_CurrentSprite_PosX
    CLC
    ADC #$0c
    STA Arg_PixelPosX
    JSR #$e86c
    JSR #$e8c3
    CMP #$04
    BEQ @LAB_PRG14__ba2d
    CMP #$0d
    BEQ @LAB_PRG14__ba2d
    CMP #$09
    BNE @LAB_PRG14__ba33

  @LAB_PRG14__ba2d:                         ; [$ba2d]
    LDA Temp_MovingSpriteVisibility
    ORA #$02
    STA Temp_MovingSpriteVisibility

  @LAB_PRG14__ba33:                         ; [$ba33]
    LDA Player_Flags
    AND #$40
    BEQ @LAB_PRG14__ba46
    LDA Temp_MovingSpriteVisibility
    BEQ SUB_PRG14__ba48
    CMP #$03
    BEQ SUB_PRG14__ba48
    EOR #$03
    JMP SUB_PRG14__ba48

  @LAB_PRG14__ba46:                         ; [$ba46]
    LDA Temp_MovingSpriteVisibility

    ;
    ; XREFS:
    ;     CurrentSprite_CalculateVisibility_MaybeWithArg
    ;
SUB_PRG14__ba48:                            ; [$ba48]
    STA MovingSpriteVisibility
    RTS


;============================================================================
; Return the player's current weapon.
;
; If the weapon is unset, it will be normalized to a
; hand dagger.
;
; INPUTS:
;     Player_CurWeapon:
;         The current weapon.
;
; OUTPUTS:
;     A:
;         The normalized weapon.
;
; XREFS:
;     Player_DrawWeapon
;============================================================================
Player_GetNormalizedWeaponID:               ; [$ba4b]
    LDA a:Player_CurWeapon
    CMP #$ff
    BNE @LAB_PRG14__ba54
    LDA #$00

  @LAB_PRG14__ba54:                         ; [$ba54]
    RTS


;============================================================================
; Clear the visible magic on the screen.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     CastMagic_Type:
;         The magic, unset.
;
; XREFS:
;     Game_InitStateForSpawn
;============================================================================
Player_ClearVisibleMagic:                   ; [$ba55]
    LDA #$ff
    STA a:CastMagic_Type
    RTS


;============================================================================
; Draw the magic effect on the screen.
;
; INPUTS:
;     TODO
;
; OUTPUTS:
;     TODO
;
; CALLS:
;     Player_IsCastMagicBlocked
;     Player_ReduceMP
;     Sound_PlayEffect
;     PRG14::ba92
;     CastMagic_HandleSpell
;
; XREFS:
;     EndGame_MainLoop
;     Game_MainLoop
;============================================================================
Player_CastMagic:                           ; [$ba5b]
    ;
    ; Check if there's any visible magic on the screen.
    ;
    LDA a:CastMagic_Type                    ; Load the visible magic.
    BPL CastMagic_HandleSpell               ; If unset, jump to the next
                                            ; function in the spell cast
                                            ; logic.

    ;
    ; Check if the player can cast magic.
    ;
    JSR #$ecf6                              ; Check if the player can cast
                                            ; magic.
    BCS @_return2                           ; If not, we're done.

    ;
    ; Check if the player has pressed Up-B to cast magic.
    ;
    LDA Joy1_ButtonMask                     ; Load the current button mask.
    AND #$08                                ; Has Up been pressed?
    BEQ @_return1                           ; If not, return.
    LDA Joy1_ChangedButtonMask              ; Load the newly-changed button
                                            ; mask.
    AND #$40                                ; Has B been pressed?
    BEQ @_return1                           ; If not, return.

    ;
    ; Load the currently-selected magic spell.
    ;
    LDA a:SelectedMagic                     ; Load the magic spell.
    CMP #$05                                ; Compare against 5 (Tilte --
                                            ; last spell).
    BCC @LAB_PRG14__ba79                    ; If a valid spell, then jump.

  @_return1:                                ; [$ba78]
    RTS                                     ; We're done.

    ;
    ; If the player has enough MP for the spell, reduce the MP
    ; for the spell cost.
    ;
  @LAB_PRG14__ba79:                         ; [$ba79]
    JSR #$c0c3                              ; Reduce the MP.
    BCS @_return1                           ; If there's not enough, we're
                                            ; done.

    ;
    ; Load the magic spell again.
    ;
    LDA a:SelectedMagic                     ; Load the magic spell.
    CMP #$04                                ; Compare it to 4 (Fire).
    BEQ @_playTilteSound

    ;
    ; This is any magic spell other than Tilte, which
    ; has its own sound.
    ;
    LDA #$05
    JSR #$d0e4                              ; Play the standard magic sound
                                            ; effect.
    JMP @LAB_PRG14__ba92

    ;
    ; This is Tilte magic. Play its sound effect.
    ;
  @_playTilteSound:                         ; [$ba8d]
    LDA #$14
    JSR #$d0e4                              ; Play the Tilte magic sound
                                            ; effect.

    ;
    ; Begin placing the magic spell on the screen.
    ;
  @LAB_PRG14__ba92:                         ; [$ba92]
    LDA a:SelectedMagic                     ; Load the magic spell.
    STA a:CastMagic_Type                    ; Set it as the visible magic.

    ;
    ; Calculate the direction the player is facing in order
    ; to know which direction to send the spell.
    ;
    LDA Player_Flags                        ; Load the player's flags.
    AND #$40                                ; Pull out the Facing Right bit.
    STA a:CastMagic_Flags                   ; Store as the direction.

    ;
    ; Set the initial X position of the magic.
    ;
    LDY a:CastMagic_Type                    ; Y = visible magic
    LDA PlayerPosX_Full                     ; A = player X position
    ADC #$baf2,Y                            ; Load the relative starting X
                                            ; position for the spell.
    STA a:CastMagic_XPos_Full               ; Set it as the full X start
                                            ; position.
    LDA PlayerPosY                          ; A = player Y position
    CLC

    ;
    ; Set the initial Y position of the magic.
    ;
    ADC #$baed,Y                            ; Load the relative starting Y
                                            ; position for the spell.
    STA a:CastMagic_YPos_Full               ; Set it as the full Y start
                                            ; position.

    ;
    ; Clear the rest of the default state.
    ;
    LDA #$00
    STA a:CastMagic_XPos_Frac               ; Fractional X = 0
    STA a:CastMagic_YPos_Frac               ; Fraction Y = 0
    STA a:CastMagic_Counter                 ; Counter = 0
    STA a:CastMagic_Phase                   ; Phase = 0

    ;
    ; Tilte behaves differently, so check which spell's being cast.
    ;
    LDA a:CastMagic_Type                    ; Load the magic spell.
    CMP #$04                                ; Compare against Tilte.
    BNE CastMagic_HandleSpell               ; If Tilte, jump to the next
                                            ; function in the spell cast
                                            ; logic.

    ;
    ; This is anything but Tilte. Mark the magic as attacking and
    ; facing the player's direction.
    ;
    LDA a:CastMagic_Flags                   ; Load the magic's flags.
    ORA #$80                                ; Set the Falling bit.
    STA a:CastMagic_Flags                   ; Store it back out.

    ;
    ; Set the magic counter to a default of 0x21.
    ;
    LDA #$21                                ; A = 0x21
    STA a:CastMagic_Counter                 ; Store as the magic's counter.
    JMP CastMagic_HandleSpell               ; Jump to the next function in
                                            ; the spell cast logic.

  @_return2:                                ; [$bad8]
    RTS


;============================================================================
; Fetch the address of the method used to handle a spell.
; The address will be pushed to the A register.
;
; NOTES:
;     This is pushing two addresses onto the stack for A:
;
;     1. CastMagic_Maybe_FinishHandler as the
;     finish
;        handler.
;
;     2. The address of the handler.
;
; INPUTS:
;     VisiblePlayerMagic:
;         The magic spell currently set.
;
; OUTPUTS:
;     A:
;         The address of the handler.
;
; XREFS:
;     Player_CastMagic
;============================================================================
CastMagic_HandleSpell:                      ; [$bad9]
    ;
    ; Push PRG15_MIRROR:C2E9 to the stack as the result
    ; after our magic function.
    ;
    LDA #$c2
    PHA
    LDA #$e8
    PHA

    ;
    ; Load the current spell into A and shift left 1 for lookup.
    ;
    ; Transfer that to Y as the index into the lookup table for
    ; the address.
    ;
    LDA a:CastMagic_Type                    ; A = Current spell
    ASL A                                   ; Multiply by 2.
    TAY                                     ; Y = A
    LDA #$baf8,Y                            ; Load the upper nibble of the
                                            ; address
    PHA                                     ; Push onto A
    LDA #$baf7,Y                            ; Load the lower nibble of the
                                            ; address
    PHA                                     ; Push onto A

    ;
    ; XREFS:
    ;     CAST_MAGIC_HANDLERS [$PRG14::bb09]
    ;     MagicHitsHandler [$PRG14::bb39]
    ;
CastMagic_Noop:                             ; [$baec]
    RTS

CAST_MAGIC_START_Y:                         ; [$baed]
    db $08                                  ; [0]: Deluge
    db $00                                  ; [1]: Thunder
    db $00                                  ; [2]: Fire
    db $08                                  ; [3]: Death
    db $08                                  ; [4]: Tilte

CAST_MAGIC_START_X:                         ; [$baf2]
    db $00                                  ; [0]: Deluge
    db $00                                  ; [1]: Thunder
    db $00                                  ; [2]: Fire
    db $00                                  ; [3]: Death
    db $00                                  ; [4]: Tilte

;
; XREFS:
;     CastMagic_HandleSpell
;
CAST_MAGIC_HANDLERS:                        ; [$baf7]
    dw CastMagic_HandleDeluge-1             ; [0]: Deluge
    dw CastMagic_HandleThunderOrDeath-1     ; [1]: Thunder
    dw CastMagic_HandleFire-1               ; [2]: Fire
    dw _thunk_CastMagic_HandleThunderOrDeath-1 ; [3]: Death
    dw CastMagic_HandleTilte-1              ; [4]: Tilte
    dw CastMagic__bc66-1                    ; [5]:
    dw CastMagic_HandleThunderExplosion-1   ; [6]:
    dw CastMagic_HandleFireExplosion-1      ; [7]:
    dw CastMagic__bc90-1                    ; [8]:
    dw $baeb                                ; [9]:
    dw CastMagic__bc99-1                    ; [10]:
    dw CastMagic_HandleTilteExplosion-1     ; [11]:

;
; XREFS:
;     Sprite_CheckHitByCastMagic
;
MagicHitsHandler:                           ; [$bb0f]
    dw CastMagic_HitHandler_Deluge-1        ; [0]: Deluge
    dw CastMagic_HitHandler_Thunder-1       ; [1]: Thunder
    dw CastMagic_HitHandler_Fire-1          ; [2]: Fire
    dw CastMagic_HitHandler_Death-1         ; [3]: Death
    dw CastMagic_HitHandler_Tilte-1         ; [4]: Tilte
    dw $8b71                                ; [5]:
    dw $8b71                                ; [6]:
    dw $8b71                                ; [7]:
    dw $8b71                                ; [8]:
    dw $8b71                                ; [9]:
    dw $8b71                                ; [10]:
    dw $8b71                                ; [11]:

;
; XREFS:
;     CastMagic_Maybe_FinishHandler
;
MagicHitsHandler_12_:                       ; [$bb27]
    dw MagicHitHandler__c39b-1              ; [12]:
    dw MagicHitHandler__c3a7-1              ; [13]:
    dw MagicHitHandler__c3b6-1              ; [14]:
    dw MagicHitHandler__c3c9-1              ; [15]:
    dw MagicHitHandler__c3d6-1              ; [16]:
    dw MagicHitHandler__c3fb-1              ; [17]:
    dw MagicHitHandler__c3a7-1              ; [18]:
    dw MagicHitHandler__c3b6-1              ; [19]:
    dw MagicHitHandler__c3fb-1              ; [20]:
    dw $baeb                                ; [21]:
    dw MagicHitHandler__c403-1              ; [22]:
    dw MagicHitHandler__c42c-1              ; [23]:


;============================================================================
; Clear the cast magic shown on the screen.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CastMagic_Type:
;         The cast magic type to clear.
;
; XREFS:
;     CastMagic_HandleDeluge
;     CastMagic_HandleFire
;     CastMagic_HandleThunderOrDeath
;     CastMagic_HandleTilte
;============================================================================
CastMagic_Clear:                            ; [$bb3f]
    LDA #$ff
    STA a:CastMagic_Type
    RTS


;============================================================================
; Handle casting or updating the Deluge spell.
;
; This will update the position, clearing the spell if it's
; either off-screen or collided with a block on the way.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CastMagic_Something_Appearance:
;         Set to 4 if the magic hit an obstacle.
;
;     CastMagic_Type:
;         Unset if clearing the magic.
;
;     Arg_DeltaX_Frac:
;     Arg_DeltaX_Full:
;         Clobbered.
;
; CALLS:
;     CastMagic_Clear
;     CastMagic_UpdateXPosition
;     Sound_PlayEffect
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::baf7]
;     CastMagic__bc66
;============================================================================
CastMagic_HandleDeluge:                     ; [$bb45]
    ;
    ; Update the position by X +/- 3 and check if the
    ; magic flew off-screen.
    ;
    LDA #$03
    STA a:Arg_DeltaX_Full
    LDA #$00
    STA a:Arg_DeltaX_Frac
    JSR CastMagic_UpdateXPosition           ; Update position.
    BCC @_checkCollision                    ; If not off-screen, check for
                                            ; collision.

    ;
    ; It's off-screen. Clear the magic.
    ;
    JMP CastMagic_Clear                     ; Clear the magic.

    ;
    ; Check if the magic is on a block other than air.
    ;
  @_checkCollision:                         ; [$bb57]
    LDA Blocks_Result                       ; Check which block the magic is
                                            ; on.
    BEQ @_return                            ; If air, we're done.

    ;
    ; It hit a block. Play the sound effect.
    ;
    LDA #$0a
    JSR #$d0e4                              ; Play the Magic Hit Obstacle
                                            ; sound effect.
    LDA #$ff
    STA a:CastMagic_Type                    ; Unset the cast magic spell.
    LDA #$04
    STA a:CastMagic_Something_Appearance

  @_return:                                 ; [$bb6a]
    RTS


;============================================================================
; Handle the Deluge magic hitting something.
;
; This will set an animation counter, clear out the magic
; type, and update the X position based on the sprite's
; X position.
;
; INPUTS:
;     CurrentSpriteIndex:
;         The current sprite index of the entity that
;         was hit.
;
; OUTPUTS:
;     CastMagic_Counter:
;         Set to 4.
;
;     CastMagic_Type:
;         Unset (0xFF).
;
;     CastMagic_XPos_Full:
;         The same position as the sprite that was hit.
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb0f]
;============================================================================
CastMagic_HitHandler_Deluge:                ; [$bb6b]
    LDA #$ff
    STA a:CastMagic_Type                    ; Unset the magic type.
    LDA #$04
    STA a:CastMagic_Counter                 ; Set the magic counter to 4.

    ;
    ; Update the X position of the cast magic to the sprite's
    ; x position.
    ;
    LDX a:CurrentSpriteIndex                ; X = current sprite index
    LDA CurrentSprites_XPos,X               ; A = current sprite X position.
    STA a:CastMagic_XPos_Full               ; Store as the X position.
    RTS


;============================================================================
; Handle casting or updating the Thunder or Death spell.
;
; This will update the position, clearing the spell if it's
; off-screen. These spells can go through blocks.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     Arg_DeltaX_Frac:
;     Arg_DeltaX_Full:
;         Clobbered.
;
; CALLS:
;     CastMagic_Clear
;     CastMagic_UpdateXPosition
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::baf9]
;     CastMagic_HandleThunderExplosion
;     _thunk_CastMagic_HandleThunderOrDeath
;============================================================================
CastMagic_HandleThunderOrDeath:             ; [$bb7e]
    ;
    ; Update the position by X +/- 2 and check if the
    ; magic flew off-screen.
    ;
    LDA #$02
    STA a:Arg_DeltaX_Full                   ; Set the delta X position to
                                            ; check to 2.
    LDA #$00
    STA a:Arg_DeltaX_Frac                   ; Set the delta fractional X
                                            ; position to 0.
    JSR CastMagic_UpdateXPosition           ; Update the X position and check
                                            ; if it stayed on-screen.
    BCC @_return                            ; If still on-screen, jump.

    ;
    ; It's off-screen. Clear the magic.
    ;
    JMP CastMagic_Clear                     ; Clear the magic.

  @_return:                                 ; [$bb90]
    RTS


;============================================================================
; Handle the Thunder magic hitting something.
;
; This will reset the animation counter (as it will
; still go through the enemy) and set a Thunder Explosion
; effect.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     CastMagic_Counter:
;         Set to 0x18.
;
;     CastMagic_Type:
;         Set to the Thunder Explosion state.
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb11]
;============================================================================
CastMagic_HitHandler_Thunder:               ; [$bb91]
    LDA #$18
    STA a:CastMagic_Counter                 ; Set the magic counter to 24.
    LDA #$06
    STA a:CastMagic_Type                    ; Set the magic type to the
                                            ; thunder explosion effect.
    RTS


;============================================================================
; Handle casting or updating the Fire spell.
;
; This will update the position, clearing the spell if it's
; either off-screen or collided with a block on the way.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CastMagic_Something_Appearance:
;         Set to 0 if the magic hit an obstacle.
;
;     CastMagic_Flags:
;         Cleared attack flags.
;
;     CastMagic_XPos_Full:
;         The new X position.
;
;     CastMagic_Type:
;         Unset if clearing the magic.
;
;     Arg_DeltaX_Frac:
;     Arg_DeltaX_Full:
;         Clobbered.
;
; CALLS:
;     CastMagic_Clear
;     CastMagic_UpdateXPosition
;     Sound_PlayEffect
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bafb]
;     CastMagic_HandleFireExplosion
;============================================================================
CastMagic_HandleFire:                       ; [$bb9c]
    ;
    ; Update X +/- 4 and check if the magic flew off-screen.
    ;
    LDA #$04
    STA a:Arg_DeltaX_Full                   ; Full Delta X = 4
    LDA #$00
    STA a:Arg_DeltaX_Frac                   ; Fractional Delta X = 0
    JSR CastMagic_UpdateXPosition           ; Update the X position.
    BCC @_checkCollision                    ; If not off-screen, check for
                                            ; collision.

    ;
    ; It's off-screen. Clear the magic.
    ;
    JMP CastMagic_Clear                     ; Clear the magic.

    ;
    ; Check if the magic is on a block other than air.
    ;
  @_checkCollision:                         ; [$bbae]
    LDA Blocks_Result                       ; Check which block the magic is
                                            ; on.
    BEQ @_return                            ; If air, we're done.

    ;
    ; It hit a block. Play the sound effect.
    ;
    LDA #$0a
    JSR #$d0e4                              ; Play the Magic Hit Obstacle
                                            ; sound effect.
    LDA #$00
    STA a:CastMagic_Something_Appearance

    ;
    ; Clear out the cast magic.
    ;
    LDA #$ff
    STA a:CastMagic_Type                    ; Unset the cast magic spell.

    ;
    ; Set the final X position.
    ;
    ; If facing right, this will add 16 to the position, letting
    ; it appear to go off-screen.
    ;
    LDA a:CastMagic_Flags                   ; Load the magic's flags.
    AND #$40                                ; Check the direction bit.
    LSR A                                   ; If set, divide by 8 (resulting
                                            ; in 16).
    LSR A
    ADC a:CastMagic_XPos_Full               ; Add to the current position.
    STA a:CastMagic_XPos_Full               ; And set it.

    ;
    ; Switch the direction of the spell.
    ;
    LDA a:CastMagic_Flags                   ; Load the flags.
    AND #$7f                                ; Clear the Attacking bit.
    EOR #$40                                ; Toggle the Facing Right bit.
    STA a:CastMagic_Flags                   ; Store it.

  @_return:                                 ; [$bbd8]
    RTS


;============================================================================
; Handle the Fire magic hitting something.
;
; This will clear out the animation counter and then
; set the type to the Fire Explosion effect.
;
; INPUTS:
;     CurrentSpriteIndex:
;         The current sprite index of the entity that
;         was hit.
;
; OUTPUTS:
;     CastMagic_Counter:
;         Set to 0xFF.
;
;     CastMagic_Type:
;         Set to the Fire Explosion state.
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb13]
;============================================================================
CastMagic_HitHandler_Fire:                  ; [$bbd9]
    LDA #$ff
    STA a:CastMagic_Counter                 ; Set the counter to 0xFF.
    LDA #$07
    STA a:CastMagic_Type                    ; Set the magic type to the Fire
                                            ; Explosion.
    LDX a:CurrentSpriteIndex                ; X = Current sprite index.
    RTS


;============================================================================
; Handle casting Thunder or Death magic.
;
; This is a thunking function that forwards to
; CastMagic_HandleThunderOrDeath.
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bafd]
;============================================================================
_thunk_CastMagic_HandleThunderOrDeath:      ; [$bbe7]
    JMP CastMagic_HandleThunderOrDeath


;============================================================================
; Handle the Death magic hitting something.
;
; This will unset the magic from the screen.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CastMagic_Type:
;         Unset (0xFF).
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb15]
;============================================================================
CastMagic_HitHandler_Death:                 ; [$bbea]
    LDA #$ff
    STA a:CastMagic_Type                    ; Set the magic type to 0xFF
                                            ; (unset).
    RTS

    ;
    ; XREFS:
    ;     CastMagic_HandleTilte
    ;
CastMagic_ClearTilte:                       ; [$bbf0]
    JMP CastMagic_Clear


;============================================================================
; Handle casting or updating the Tilte spell.
;
; This spell has two phases:
;
; 1. A slow-moving curved phase
; 2. A fast-moving missile phase
;
; During phase 1, this will control the X/Y positions in a
; curved form. Depending on the tick count, it will move
; downward toward the bottom of the arc, horizontal at
; the bottom, back up, or begin a transition to phase 2.
;
; In phase 2, it will simply move in a single diagonal
; direction.
;
; The block won't collide with anything on the screen,
; and will move through enemies.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CastMagic_Something_Appearance:
;         Set to 0 if the magic hit an obstacle.
;
;     CastMagic_Flags:
;         Cleared attack flags.
;
;     CastMagic_XPos_Full:
;         The new X position.
;
;     CastMagic_Type:
;         Unset if clearing the magic.
;
;     Arg_DeltaX_Frac:
;     Arg_DeltaX_Full:
;         Clobbered.
;
; CALLS:
;     CastMagic_Clear
;     CastMagic_UpdateXPosition
;     Sound_PlayEffect
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::baff]
;============================================================================
CastMagic_HandleTilte:                      ; [$bbf3]
    ;
    ; Update based on the phase of this magic.
    ;
    LDA a:CastMagic_Phase                   ; Check the phase.
    LSR A                                   ; Check bit 0 for even/odd.
    BCS @_curveMagicPhase                   ; If odd, jump.

    ;
    ; We're in the initial, curved magic phase. It dips down and
    ; then back up.
    ;
    ; Update X +/- 1 and check if the magic flew off the screen.
    ; We'll calculate gravity-based Y movement next.
    ;
    LDA #$01
    STA a:Arg_DeltaX_Full                   ; Full Delta X = 1
    LDA #$00
    STA a:Arg_DeltaX_Frac                   ; Fractional Delta X = 0
    JSR CastMagic_UpdateXPosition           ; Update position.
    BCS CastMagic_ClearTilte                ; If off-screen, jump to clear.

    ;
    ; Calculate the next movement behavior.
    ;
    LDA a:CastMagic_Counter                 ; Load the magic tick counter.
    LDY #$03                                ; Y = 3
    JSR Sprites_CalcYFromGravity            ; Calculate the movement behavior
                                            ; (delta Y).
    LDY #$03                                ; Y = 3 (count)
    JSR CalcVerticalSpriteMovement          ; Calculate vertical movement.
    LDA #$00
    STA a:Arg_DeltaY_Full                   ; Full Delta Y = 0
    JSR CastMagic_UpdateYPosition           ; Update the Y position.
    BCS CastMagic_ClearTilte                ; If off-screen, jump to clear.

    ;
    ; It's on-screen. Manage cycle of the magic.
    ;
    ; First, check if we're on tick 32, 64, 96, or 128.
    ;
    LDA a:CastMagic_Counter                 ; A = counter.
    AND #$1f                                ; Check against anything but 32,
                                            ; 64, or 128.
    BNE @_incAndReturn                      ; If 32, 64, or 128, jump to
                                            ; finish up.

    ;
    ; We're on a non-32/64/128 phase, dictating curve movement
    ; and possibly phase transition.
    ;
    ; When 32 is hit, the magic will appear and move downward.
    ;
    ; When 64 is hit, it will begin moving horizontally at the
    ; bottom of the arc.
    ;
    ; When 96 is hit, it will begin moving upward toward the
    ; top of the arc.
    ;
    ; When 128 is hit, it will transition to the missile phase.
    ;
    LDA a:CastMagic_Flags                   ; Load the magic flags.
    EOR #$80                                ; Toggle the Falling phase.
    STA a:CastMagic_Flags                   ; Store the updated flags.
    BPL @_incAndReturn                      ; If attacking is clear, jump to
                                            ; finish up.

    ;
    ; Switch to the missile phase.
    ;
    INC a:CastMagic_Phase                   ; Increment the phase.

    ;
    ; Clear the falling flag, moving back up.
    ;
    LDA a:CastMagic_Flags                   ; Load the magic flags.
    AND #$7f                                ; Clear attacking.
    STA a:CastMagic_Flags                   ; Store it.
    RTS

  @_incAndReturn:                           ; [$bc3c]
    INC a:CastMagic_Counter                 ; Increment the tick counter.
    RTS

    ;
    ; The magic is in the fast-moving diagonal missile phase.
    ;
    ; We'll update X +/- 4 and Y + 4 for the movement, annd check
    ; if it's off-screen.
    ;
  @_curveMagicPhase:                        ; [$bc40]
    LDA #$04
    STA a:Arg_DeltaX_Full                   ; Full Delta X = 4
    STA a:Arg_DeltaY_Full                   ; Full Delta Y = 4
    LDA #$00
    STA a:Arg_DeltaX_Frac                   ; Fractional Delta X = 0
    STA a:Arg_DeltaY_Frac                   ; Fractional Delta Y = 0
    JSR CastMagic_UpdateXPosition           ; Update the X position.
    BCS CastMagic_ClearTilte                ; If off-screen, jump to clear.
    JSR CastMagic_UpdateYPosition           ; Update the Y position.
    BCS CastMagic_ClearTilte                ; If off-screen, jump to clear.
    RTS


;============================================================================
; Handle Tilte magic hitting something.
;
; This will turn off the transition counter and
; set the type to be the Tilte explosion effect.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     CastMagic_Counter:
;         Reset to 0.
;
;     CastMagic_Type:
;         Set to the Tilte Explosion type.
;
; XREFS:
;     MagicHitsHandler [$PRG14::bb17]
;============================================================================
CastMagic_HitHandler_Tilte:                 ; [$bc5b]
    LDA #$00
    STA a:CastMagic_Counter                 ; Set the counter to 0.
    LDA #$0b
    STA a:CastMagic_Type                    ; Set the type to the Tilte
                                            ; Explosion.
    RTS


;============================================================================
; TODO: Document CastMagic__bc66
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bb01]
;============================================================================
CastMagic__bc66:                            ; [$bc66]
    JSR CastMagic_HandleDeluge
    DEC a:CastMagic_Counter
    BNE @_return
    LDA #$ff
    STA a:CastMagic_Type

  @_return:                                 ; [$bc73]
    RTS


;============================================================================
; TODO: Document CastMagic_HandleThunderExplosion
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bb03]
;============================================================================
CastMagic_HandleThunderExplosion:           ; [$bc74]
    JSR CastMagic_HandleThunderOrDeath
    DEC a:CastMagic_Counter
    BNE @LAB_PRG14__bc81
    LDA #$ff
    STA a:CastMagic_Type

  @LAB_PRG14__bc81:                         ; [$bc81]
    RTS


;============================================================================
; TODO: Document CastMagic_HandleFireExplosion
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bb05]
;============================================================================
CastMagic_HandleFireExplosion:              ; [$bc82]
    JSR CastMagic_HandleFire
    DEC a:CastMagic_Counter
    BNE @LAB_PRG14__bc8f
    LDA #$ff
    STA a:CastMagic_Type

  @LAB_PRG14__bc8f:                         ; [$bc8f]
    RTS


;============================================================================
; TODO: Document CastMagic__bc90
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bb07]
;============================================================================
CastMagic__bc90:                            ; [$bc90]
    LDA #$ff
    STA a:CastMagic_Type
    RTS
    JMP CastMagic_Clear


;============================================================================
; TODO: Document CastMagic__bc99
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bb0b]
;============================================================================
CastMagic__bc99:                            ; [$bc99]
    LDA #$ff
    STA a:CastMagic_Type
    RTS


;============================================================================
; TODO: Document CastMagic_HandleTilteExplosion
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CAST_MAGIC_HANDLERS [$PRG14::bb0d]
;============================================================================
CastMagic_HandleTilteExplosion:             ; [$bc9f]
    INC a:CastMagic_Counter
    LDA a:CastMagic_Counter
    CMP #$10
    BCC @LAB_PRG14__bcae
    LDA #$ff
    STA a:CastMagic_Type

  @LAB_PRG14__bcae:                         ; [$bcae]
    RTS


;============================================================================
; TODO: Document CastMagic_UpdateXPosition
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     CastMagic_HandleDeluge
;     CastMagic_HandleFire
;     CastMagic_HandleThunderOrDeath
;     CastMagic_HandleTilte
;============================================================================
CastMagic_UpdateXPosition:                  ; [$bcaf]
    LDA a:CastMagic_Flags
    AND #$40
    BNE @LAB_PRG14__bcd4
    LDA a:CastMagic_XPos_Frac
    SEC
    SBC a:Arg_DeltaX_Frac
    STA a:CastMagic_XPos_Frac
    LDA a:CastMagic_XPos_Full
    SBC a:Arg_DeltaX_Full
    STA a:CastMagic_XPos_Full
    LDX #$00
    JSR FUN_PRG14__bd8f
    LDA a:CastMagic_XPos_Full
    CMP #$f0
    RTS

  @LAB_PRG14__bcd4:                         ; [$bcd4]
    LDA a:CastMagic_XPos_Frac
    CLC
    ADC a:Arg_DeltaX_Frac
    STA a:CastMagic_XPos_Frac
    LDA a:CastMagic_XPos_Full
    ADC a:Arg_DeltaX_Full
    STA a:CastMagic_XPos_Full
    LDX #$01
    JSR FUN_PRG14__bd8f
    LDX a:CastMagic_Type
    LDA a:CastMagic_XPos_Full
    CMP #$bcf6,X
    RTS

;
; XREFS:
;     CastMagic_UpdateXPosition
;
BYTE_ARRAY_PRG14__bcf6:                     ; [$bcf6]
    db $f0                                  ; [0]:
    db $f0                                  ; [1]:
    db $e0                                  ; [2]:
    db $f0                                  ; [3]:
    db $f0                                  ; [4]:


;============================================================================
; TODO: Document CastMagic_UpdateYPosition
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     CastMagic_HandleTilte
;============================================================================
CastMagic_UpdateYPosition:                  ; [$bcfb]
    LDA a:CastMagic_Flags
    BMI @LAB_PRG14__bd1e
    LDA a:CastMagic_YPos_Frac
    SEC
    SBC a:Arg_DeltaY_Frac
    STA a:CastMagic_YPos_Frac
    LDA a:CastMagic_YPos_Full
    SBC a:Arg_DeltaY_Full
    STA a:CastMagic_YPos_Full
    LDX #$02
    JSR FUN_PRG14__bd8f
    LDA a:CastMagic_YPos_Full
    CMP #$f0
    RTS

  @LAB_PRG14__bd1e:                         ; [$bd1e]
    LDA a:CastMagic_YPos_Frac
    CLC
    ADC a:Arg_DeltaY_Frac
    STA a:CastMagic_YPos_Frac
    LDA a:CastMagic_YPos_Full
    ADC a:Arg_DeltaY_Full
    STA a:CastMagic_YPos_Full
    LDA a:Arg_DeltaY_Frac
    PHP
    LDX #$03
    JSR FUN_PRG14__bd8f
    PLP
    RTS


;============================================================================
; TODO: Document CastMagic_Maybe_CheckRightEdgeOrImpassable
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__bd8f
;============================================================================
CastMagic_Maybe_CheckRightEdgeOrImpassable: ; [$bd3c]
    LDA a:CastMagic_XPos_Full
    STA Arg_PixelPosX
    CMP #$f0
    BCC CastMagic_Maybe_CheckImpassableY


;============================================================================
; TODO: Document CastMagic_SetShouldDisperse
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CastMagic_Maybe_CheckXOrImpassable
;============================================================================
CastMagic_SetShouldDisperse:                ; [$bd45]
    LDA #$01
    STA Blocks_Result
    RTS


;============================================================================
; TODO: Document CastMagic_Maybe_CheckXOrImpassable
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG14__bd8f
;============================================================================
CastMagic_Maybe_CheckXOrImpassable:         ; [$bd4a]
    LDY a:CastMagic_Type
    LDA a:CastMagic_XPos_Full
    CLC
    ADC #$bd9d,Y
    STA Arg_PixelPosX
    BCS CastMagic_SetShouldDisperse

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document CastMagic_Maybe_CheckImpassableY
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CastMagic_Maybe_CheckRightEdgeOrImpassable
;============================================================================
CastMagic_Maybe_CheckImpassableY:           ; [$bd58]
    LDA a:CastMagic_YPos_Full
    STA Arg_PixelPosY
    JSR #$e86c
    JSR #$e87c
    STA Blocks_Result
    BNE @_return
    LDY a:CastMagic_Type
    LDA #$bda9,Y
    CMP #$10
    BCC @LAB_PRG14__bd7d
    TXA
    CLC
    ADC #$10
    TAX
    JSR #$e87c
    STA Blocks_Result
    BNE @_return

  @LAB_PRG14__bd7d:                         ; [$bd7d]
    LDA a:CastMagic_YPos_Full
    AND #$0f
    BEQ @_return
    TXA
    CLC
    ADC #$10
    TAX
    JSR #$e87c
    STA Blocks_Result

  @_return:                                 ; [$bd8e]
    RTS


;============================================================================
; TODO: Document FUN_PRG14__bd8f
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     CastMagic_UpdateXPosition
;     CastMagic_UpdateYPosition
;============================================================================
FUN_PRG14__bd8f:                            ; [$bd8f]
    TXA
    BEQ CastMagic_Maybe_CheckRightEdgeOrImpassable
    DEX
    BEQ CastMagic_Maybe_CheckXOrImpassable
    DEX
    BEQ @LAB_PRG14__bd98

  @LAB_PRG14__bd98:                         ; [$bd98]
    LDA #$00
    STA Blocks_Result
    RTS

;
; XREFS:
;     CastMagic_Maybe_CheckXOrImpassable
;
BYTE_ARRAY_PRG14__bd9d:                     ; [$bd9d]
    db $0f                                  ; [0]:
    db $0f                                  ; [1]:
    db $1f                                  ; [2]:
    db $0f                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $0f                                  ; [6]:
    db $1f                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:
    db $0f                                  ; [10]:
    db $0f                                  ; [11]:

;
; XREFS:
;     CastMagic_Maybe_CheckImpassableY
;
BYTE_ARRAY_PRG14__bda9:                     ; [$bda9]
    db $0f                                  ; [0]:
    db $1f                                  ; [1]:
    db $0f                                  ; [2]:
    db $0f                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $1f                                  ; [6]:
    db $0f                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:
    db $0f                                  ; [10]:
    db $0f                                  ; [11]:
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdb5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdc5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdd5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bde5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdf5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be05] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be15] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be25] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be35] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be45] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be55] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be65] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be75] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be85] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be95] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bea5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beb5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bec5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bed5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bee5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bef5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf05] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf15] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf25] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf35] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf45] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf55] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf65] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf75] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf85] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf95] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfa5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfb5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfc5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfd5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfe5] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff    ; [$bff5] undefined
