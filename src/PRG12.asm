;============================================================================
; Faxanadu (U).nes
;
; PRG12 ($8000 - $bfff)
;============================================================================

BASE $8000

    hex 00 00 00 00 00 c0 bf bf bf bf bf bf bf bf bf bf ; [$8000] undefined
    hex bf bf bf bf bf bf cf 00 00 00 00 00 c0 bf bf bf ; [$8010] undefined
    hex bf ce 00 00 00 c8 00 00 00 be b9 ac b3 b4 00 00 ; [$8020] undefined
    hex bc 00 cd bf bf bf bf cf cb 00 c8 00 00 00 00 bc ; [$8030] undefined
    hex cc 00 00 c1 c2 00 ab ac b3 b4 bc 00 00 00 00 00 ; [$8040] undefined
    hex 00 00 00 cb cb 00 01 02 03 00 00 00 00 00 d0 d1 ; [$8050] undefined
    hex d2 d0 ab ac b3 b4 c8 00 00 c8 00 00 9d 9e 9f cb ; [$8060] undefined
    hex cb 10 11 12 13 14 15 bc 00 d0 b5 b6 b7 b8 b6 b8 ; [$8070] undefined
    hex b3 b4 00 c8 00 9c a0 a1 a2 a3 a4 cb cb 20 21 22 ; [$8080] undefined
    hex 23 24 25 26 27 c9 ca c9 ca ca ca ca b3 b4 bc 2a ; [$8090] undefined
    hex 2b a5 a6 a7 a8 a9 aa cb cb 30 31 32 33 34 35 36 ; [$80a0] undefined
    hex 37 38 39 ad ad ae ad 3e 3f 04 05 06 07 08 09 0a ; [$80b0] undefined
    hex 00 0b 0c cb cb 00 00 42 43 44 45 46 47 48 49 4a ; [$80c0] undefined
    hex 4b 4c 4d 4e 4f 0d 0e 0f 16 17 18 19 1a 1b 00 cb ; [$80d0] undefined
    hex cb 00 00 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e ; [$80e0] undefined
    hex 5f 1d 1e 1f 28 29 2c 2d 2e 2f 00 cb cb 00 bc 62 ; [$80f0] undefined
    hex 63 64 65 66 67 68 69 6a 6b 6c 6d 6e 6f 3a 3b 3c ; [$8100] undefined
    hex 3d 40 41 50 51 60 00 cb cb 00 00 72 73 74 75 76 ; [$8110] undefined
    hex 77 78 79 7a 7b 7c 7d 7e 7f 61 70 71 80 90 91 92 ; [$8120] undefined
    hex 93 00 00 cb cb 00 81 82 83 84 85 86 83 88 89 83 ; [$8130] undefined
    hex 8b 8c 8d 8e 8f 94 95 96 97 98 83 9a 9b f3 ec cb ; [$8140] undefined
    hex cb bc 00 00 bc bc bc 00 c1 d3 00 00 00 00 c4 c5 ; [$8150] undefined
    hex b3 b4 00 00 00 00 00 00 00 bc 00 cb cb bb d3 d3 ; [$8160] undefined
    hex c6 c7 cf d0 d1 b7 b8 00 c8 00 d4 b1 b3 b4 c8 00 ; [$8170] undefined
    hex c1 d3 00 00 d2 d3 c6 cb cd bf bf bf cf af bf b0 ; [$8180] undefined
    hex b0 af bf cf c6 c7 99 8a 87 c3 bb d0 d1 b7 b8 c0 ; [$8190] undefined
    hex bf bf bf ce 00 00 00 00 cd bf bf bf bf bf bf bd ; [$81a0] undefined
    hex af b2 b2 b0 bd af bf b0 bf af bf ce 00 00 00 00 ; [$81b0] undefined


;============================================================================
; TODO: Document GetTextBoxCoordinates
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__81fb
;     OpenTextWindow
;============================================================================
GetTextBoxCoordinates:                      ; [$81c0]
    LDA #$0a
    STA a:TextBox_X
    LDA #$14
    STA a:TextBox_Width
    LDA #$08
    STA a:TextBox_Height
    LDA a:IScriptEntity
    BMI @LAB_PRG12__81dc
    LDY #$06
    LDA PlayerPosY
    CMP #$40
    BCS @LAB_PRG12__81de

  @LAB_PRG12__81dc:                         ; [$81dc]
    LDY #$10

  @LAB_PRG12__81de:                         ; [$81de]
    STY a:TextBox_Y
    RTS


;============================================================================
; TODO: Document OpenTextWindow
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_ShowSellMenu
;     IScripts_Begin
;     Maybe_Shop_DrawTextBox
;============================================================================
OpenTextWindow:                             ; [$81e2]
    JSR GetTextBoxCoordinates
    JSR TextBox_Maybe_Draw

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document IScripts_Something_81E8
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_ShowQuestionMessage
;============================================================================
IScripts_Something_81E8:                    ; [$81e8]
    LDA a:TextBox_X
    CLC
    ADC #$02
    STA TextBox_TextX
    LDA a:TextBox_Y
    CLC
    ADC #$02
    STA TextBox_TextY
    JMP IScripts_Something_9910


;============================================================================
; TODO: Document FUN_PRG12__81fb
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_EndScript
;============================================================================
FUN_PRG12__81fb:                            ; [$81fb]
    JSR GetTextBoxCoordinates
    JMP Maybe_Draw_Textbox


;============================================================================
; TODO: Document Portrait_SetCoords
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     DEADCODE
;     Portrait_Show
;============================================================================
Portrait_SetCoords:                         ; [$8201]
    LDA #$02
    STA a:TextBox_X
    LDA #$0e
    STA a:TextBox_Y
    LDA #$08
    STA a:TextBox_Width
    LDA #$0a
    STA a:TextBox_Height
    RTS


;============================================================================
; Set the sprite X, Y position to the interior of the portrait frame.
;
; This position is relative to the top of the playable screen (below
; the HUD).
;
; INPUTS:
;     None
;
; OUTPUTS:
;     Maybe_Arg_CurrentSprite_PosX:
;         The X position to draw into (0x18)
;
;     Maybe_Arg_CurrentSprite_PosY:
;         The Y position to draw into (0x58)
;
; XREFS:
;     IScripts_UpdatePortraitAnimation
;============================================================================
Portrait_SetInnerSpriteXY:                  ; [$8216]
    LDX #$18
    STX Maybe_Arg_CurrentSprite_PosX
    LDX #$58
    STX Maybe_Arg_CurrentSprite_PosY
    RTS


;============================================================================
; TODO: Document Portrait_Show
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_Begin
;============================================================================
Portrait_Show:                              ; [$821f]
    JSR Portrait_SetCoords
    JMP TextBox_Maybe_Draw


;============================================================================
; TODO: Document DEADCODE
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
DEADCODE:                                   ; [$8225]
    JSR Portrait_SetCoords
    JMP Maybe_Draw_Textbox


;============================================================================
; TODO: Document Portrait_Clear
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_EndScript
;============================================================================
Portrait_Clear:                             ; [$822b]
    LDA #$02
    STA a:TextBox_X
    LDA #$08
    STA a:TextBox_Y
    LDA #$1e
    STA a:TextBox_Width
    LDA #$14
    STA a:TextBox_Height
    JMP Maybe_Draw_Textbox


;============================================================================
; Begin running an IScript.
;
; This will start loading the IScript to run. Based on
; that script, this may display a portrait for an entity.
;
; Once loaded, a text window will be shown and the first
; action of the script will be executed.
;
; INPUTS:
;     A:
;         The entrypoint offset of the IScript to run.
;
;     ISCRIPT_ADDRS_U:
;     ISCRIPT_ADDRS_L:
;         The lookup table of IScript entrypoints.
;
; OUTPUTS:
;     IScriptOrCHRAddr:
;     #$dc:
;         The read address for the IScript.
;
;     IScriptEntity:
;         The entity ID of the IScript, for portrait
;         display.
;
;     Temp_0200:
;         The IScript entrypoint index.
;
;     IScriptOffset:
;         The byte offset into the script.
;
; CALLS:
;     FUN_PRG15_MIRROR__f24d
;     Portrait_Show
;     OpenTextWindow
;     IScripts_LoadByte
;
; XREFS:
;     Player_CheckHandlePressUpOnNPC
;     Game_UnlockDoorWithUsableItem
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
;============================================================================
IScripts_Begin:                             ; [$8242]
    ;
    ; If this is 0xFF, map to the "Remember Your Mantra."
    ;
    CMP #$ff
    BNE @LAB_PRG12__8248
    LDA #$1f

  @LAB_PRG12__8248:                         ; [$8248]
    STA a:Temp_0200
    TAX
    LDA #$9f6b,X
    STA IScriptOrCHRAddr
    LDA #$a003,X
    STA IScriptOrCHRAddr.U
    LDY #$00
    LDA (IScriptOrCHRAddr),Y
    STA a:IScriptEntity
    BPL @_notDoubleWindow

    ;
    ; Begin showing the portrait information.
    ;
    AND #$7f
    JSR #$f24d
    JSR Portrait_Show

  @_notDoubleWindow:                        ; [$8267]
    JSR OpenTextWindow
    LDA #$01
    STA IScriptOffset

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Invoke the next action listed in an IScript.
;
; This will load the action byte, look up the action
; handler, and then run it. The handler will be
; responsible for loading any further bytes and
; advancing the script.
;
; INPUTS:
;     IScriptActions_U:
;     IScriptActions_L:
;         Address table for the IScript action handlers.
;
; OUTPUTS:
;     A:
;         Address of the handler, pushed to the stack.
;
; CALLS:
;     IScripts_LoadByte
;
; XREFS:
;     IScriptAction_AddGold
;     IScriptAction_AddInventoryItem
;     IScriptAction_ConsumeItem
;     IScriptAction_OpenShop
;     IScriptAction_SetQuestComplete
;     IScriptAction_SetSpawnPoint
;     IScriptAction_ShowMessage
;     IScriptAction_ShowPassword
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     IScriptAction_SpendGold
;     IScripts_JumpToNextAddr
;     IScripts_SkipAddrAndInvoke
;     thunk_IScripts_InvokeNextAction
;============================================================================
IScripts_InvokeNextAction:                  ; [$826e]
    JSR IScripts_LoadByte                   ; Load the script ID
    TAX                                     ; Store the byte in X and load
                                            ; from the offset table.
    LDA #$8293,X                            ; Fetch the upper script offset
    PHA                                     ; Push the upper offset to the
                                            ; stack
    LDA #$827b,X                            ; Fetch the lower script offset
    PHA                                     ; Push the lower offset to the
                                            ; stack
    RTS


;============================================================================
; Addresses for the IScript action handlers.
;============================================================================

;
; XREFS:
;     IScripts_InvokeNextAction
;
IScriptActions_L:                           ; [$827b]
    db $b3                                  ; [0]:

;
; XREFS:
;     IScripts_InvokeNextAction
;
IScriptActions_L_1_:                        ; [$827c]
    db $c4                                  ; [1]:
    db $ee                                  ; [2]:
    db $d8                                  ; [3]:
    db $25                                  ; [4]:
    db $5a                                  ; [5]:
    db $90                                  ; [6]:
    db $9e                                  ; [7]:
    db $d7                                  ; [8]:
    db $24                                  ; [9]:
    db $7f                                  ; [10]:
    db $d0                                  ; [11]:
    db $f5                                  ; [12]:
    db $1e                                  ; [13]:
    db $e5                                  ; [14]:
    db $2f                                  ; [15]:
    db $56                                  ; [16]:
    db $5f                                  ; [17]:
    db $17                                  ; [18]:
    db $ae                                  ; [19]:
    db $36                                  ; [20]:
    db $ad                                  ; [21]:
    db $07                                  ; [22]:
    db $aa                                  ; [23]:

;
; XREFS:
;     IScripts_InvokeNextAction
;
IScriptActions_U:                           ; [$8293]
    db $82                                  ; [0]:

;
; XREFS:
;     IScripts_InvokeNextAction
;
IScriptActions_U_1_:                        ; [$8294]
    db $82                                  ; [1]:
    db $82                                  ; [2]:
    db $82                                  ; [3]:
    db $87                                  ; [4]:
    db $83                                  ; [5]:
    db $83                                  ; [6]:
    db $83                                  ; [7]:
    db $83                                  ; [8]:
    db $85                                  ; [9]:
    db $85                                  ; [10]:
    db $85                                  ; [11]:
    db $85                                  ; [12]:
    db $86                                  ; [13]:
    db $85                                  ; [14]:
    db $86                                  ; [15]:
    db $86                                  ; [16]:
    db $86                                  ; [17]:
    db $87                                  ; [18]:
    db $85                                  ; [19]:
    db $87                                  ; [20]:
    db $82                                  ; [21]:
    db $83                                  ; [22]:
    db $82                                  ; [23]:


;============================================================================
; IScript Action $17: Jump to Address
;
; This will immediately jump to the specified address.
;
; Script Parameters:
;
;     1. Jump address (2 bytes)
;
; XREFS:
;     IScriptActions_L [$PRG12::8292]
;============================================================================
IScriptAction_Jump:                         ; [$82ab]
    JMP IScripts_JumpToNextAddr


;============================================================================
; IScript Action $15: Finish Game
;
; This will immediately finish the game, showing
; the outro screen and victory music.
;
; Script Parameters:
;     None.
;
; XREFS:
;     IScriptActions_L [$PRG12::8290]
;============================================================================
IScriptAction_FinishGame:                   ; [$82ae]
    JSR SplashAnimation_RunOutro
    JMP #$c913


;============================================================================
; IScript Action $00: End Script
;
; This will close the textbox, if one is opened, and
; finish processing the script.
;
; Script Parameters:
;     None.
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowMessage
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowSellMenu
;     IScriptActions_L [$PRG12::827b]
;     Shop_ShowMessage
;============================================================================
IScriptAction_EndScript:                    ; [$82b4]
    JSR IScripts_UpdatePortraitAnimation
    LDA a:IScriptEntity
    BPL @LAB_PRG12__82c2
    JSR #$f281
    JMP Portrait_Clear

  @LAB_PRG12__82c2:                         ; [$82c2]
    JMP FUN_PRG12__81fb


;============================================================================
; IScript Action $01: Show Unskippable Message
;
; Displays a message in a text box, with an optional
; portrait depending on the script's Entity ID.
;
; This message cannot be skipped by pressing the B
; button. It's used for important messages, like the
; game's intro.
;
; Script Parameters:
;
;     1. Message ID (1 byte)
;
; XREFS:
;     IScriptActions_L [$PRG12::827c]
;============================================================================
IScriptAction_ShowUnskippableMessage:       ; [$82c5]
    JSR IScripts_LoadByte                   ; Load the next byte as the
                                            ; message ID.
    JSR #$f3f5                              ; Load the message.

  @LAB_PRG12__82cb:                         ; [$82cb]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR IScripts_Something_992A
    BCC @LAB_PRG12__82cb
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; IScript Action $03: Show Message
;
; Displays a message in a text box, with an optional
; portrait depending on the script's Entity ID.
;
; This message can be skipped at any point by pressing
; the B button.
;
; Script Parameters:
;
;     1. Message ID (1 byte)
;
; XREFS:
;     IScriptActions_L [$PRG12::827e]
;============================================================================
IScriptAction_ShowMessage:                  ; [$82d9]
    JSR IScripts_LoadByte
    JSR #$f3f5

  @LAB_PRG12__82df:                         ; [$82df]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR Shop_Something_9956
    BCS IScriptAction_EndScript
    BNE @LAB_PRG12__82df
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; IScript Action $02: Show Question Message
;
; Tihs displays a message in a text box, with an
; optional portrait depending on the script's Entity ID.
;
; The message will terminate with a flashing "?" at the
; bottom-center of the dialogue, indicating a question
; for the player.
;
; This message can be skipped at any point by pressing
; the B button.
;
; Script Parameters:
;
;     1. Message ID (1 byte)
;
; XREFS:
;     IScriptActions_L [$PRG12::827d]
;============================================================================
IScriptAction_ShowQuestionMessage:          ; [$82ef]
    JSR IScripts_LoadByte
    JSR #$f3f5

  @_waitForInput:                           ; [$82f5]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR IScripts_Something_9980
    BCS IScriptAction_EndScript
    BNE @_waitForInput
    JSR IScripts_Something_81E8
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; TODO: Document IScriptAction_22
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptActions_L [$PRG12::8291]
;============================================================================
IScriptAction_22:                           ; [$8308]
    JSR IScripts_LoadByte
    JSR #$f3f5

  @LAB_PRG12__830e:                         ; [$830e]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR IScripts_Something_9980
    BCS @LAB_PRG12__831e
    BNE @LAB_PRG12__830e
    JMP IScripts_JumpToNextAddr             ; Invoke the next action in the
                                            ; script.

  @LAB_PRG12__831e:                         ; [$831e]
    JMP IScripts_SkipAddrAndInvoke          ; Invoke the next action in the
                                            ; script.


;============================================================================
; Progressively subtract gold from the player.
;
; This will subtract the code, animating the reduction
; of gold from the status screen.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Temp_Int24:
;     #$ed:
;     Temp_0202:
;     Temp_0203:
;         Clobbered.
;
; CALLS:
;     IScripts_UpdatePortraitAnimation
;     Player_SubtractGold
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_SpendGold
;     IScripts_ProgressivelySubtractGold
;============================================================================
IScripts_ProgressivelySubtractGold:         ; [$8321]
    JSR IScripts_UpdatePortraitAnimation
    LDA a:Temp_0203
    BMI @LAB_PRG12__8355
    ORA a:Temp_0202
    BEQ @LAB_PRG12__834d
    LDA a:Temp_0202
    SEC
    SBC #$0a
    STA a:Temp_0202
    LDA a:Temp_0203
    SBC #$00
    STA a:Temp_0203
    LDA #$0a
    STA Temp_Int24
    LDA #$00
    STA Temp_Int24.M
    JSR #$f9a5
    JMP IScripts_ProgressivelySubtractGold

  @LAB_PRG12__834d:                         ; [$834d]
    DEC a:Temp_0203
    LDA #$3c                                ; '<'
    STA a:Temp_0202

  @LAB_PRG12__8355:                         ; [$8355]
    DEC a:Temp_0202
    BNE IScripts_ProgressivelySubtractGold
    RTS


;============================================================================
; IScript Action $05: Spend Gold
;
; This takes the specified amount of gold away from the player.
;
; Script Parameters:
;
;     1. Gold amount (2 bytes)
;
; XREFS:
;     IScriptActions_L [$PRG12::8280]
;============================================================================
IScriptAction_SpendGold:                    ; [$835b]
    ;
    ; Load the gold amount parameters for the script.
    ;
    JSR IScripts_LoadByte                   ; Load the lower byte of the gold
                                            ; amount.
    STA a:Temp_0202                         ; Store it.
    JSR IScripts_LoadByte                   ; Load the upper byte of the gold
                                            ; amount.
    STA a:Temp_0203                         ; Store it
    LDA a:Temp_0202                         ; Load the lower byte again.
    STA Temp_Int24                          ; Store it in
                                            ; Temp_Int24
                                            ; for comparison.
    LDA a:Temp_0203                         ; Lower the upper byte again.
    STA Temp_Int24.M                        ; And store it in
                                            ; Temp_Int24
                                            ; for comparison.

    ;
    ; Validate that there's enough money. If there is, spend
    ; it. If not, display an error message.
    ;
    JSR IScripts_CheckEnoughMoney           ; Check if there's enough money
                                            ; to pay.
    BCC Shop_ShowNotEnoughMoney             ; If not, show the Not Enough
                                            ; Money message.
    JSR IScripts_ProgressivelySubtractGold  ; Progressively subtract the
                                            ; gold, animating it.
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; Show that the player doesn't have enough money.
;
; This will progressively show this in a textbox, and
; then end the script.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     Messages_Load
;     IScripts_UpdatePortraitAnimation
;     TextBox_ShowNextChar
;     Shop_Something_9956
;     IScriptAction_EndScript
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_SpendGold
;============================================================================
Shop_ShowNotEnoughMoney:                    ; [$837c]
    ;
    ; Display the Not Enough Money message.
    ;
    LDA #$03                                ; Set the message ID.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Shop_ShowMessage
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;============================================================================
Shop_ShowMessage:                           ; [$837e]
    JSR #$f3f5                              ; And load the message.

    ;
    ; Progressively write the message.
    ;
  @LAB_PRG12__8381:                         ; [$8381]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR Shop_Something_9956
    BCS @LAB_PRG12__838e
    BNE @LAB_PRG12__8381

  @LAB_PRG12__838e:                         ; [$838e]
    JMP IScriptAction_EndScript             ; End processing of the script.


;============================================================================
; IScript Action $06: Set Spawn Point
;
; Sets the spawn point to the specified temple ID.
;
; Only the furthest temple will be set. If backtracking,
; to an earlier spawn point, then ew spawn point will
; not be set.
;
; Script Parameters:
;
;     1. Temple ID (1 byte)
;
; XREFS:
;     IScriptActions_L [$PRG12::8281]
;============================================================================
IScriptAction_SetSpawnPoint:                ; [$8391]
    JSR IScripts_LoadByte                   ; Load the temple/area ID.
    CMP a:TempleSpawnPoint                  ; Compare against the current
                                            ; spawn point.
    BCC @_nextAction                        ; If the older spawn point is
                                            ; further in the game, don't
                                            ; update.
    STA a:TempleSpawnPoint                  ; Else, set the new spawn point.

  @_nextAction:                             ; [$839c]
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; IScript Action $07: Adds an item with the specified ID to the player's
; inventory.
;
; Script Parameters:
;
;     1. Item ID (1 byte)
;
; XREFS:
;     IScriptActions_L [$PRG12::8282]
;============================================================================
IScriptAction_AddInventoryItem:             ; [$839f]
    JSR IScripts_LoadByte                   ; Load the item ID parameter.
    PHA                                     ; Push to the stack, twice.
    PHA
    JSR Player_AddToInventory               ; Add the item to the inventory.

    ;
    ; Begin showing the textbox indicating the added item.
    ;
    JSR IScriptAction_AddItem_Something8EC1
    LDX a:TextBox_X
    INX
    INX
    STX TextBox_TextX
    LDX a:TextBox_Y
    INX
    INX
    STX TextBox_TextY
    PLA
    LDX #$00
    JSR Maybe_DrawItemName
    INC TextBox_TextY
    INC TextBox_TextY
    INC TextBox_TextY
    PLA
    JSR Maybe_DrawItemTitle

  @LAB_PRG12__83c8:                         ; [$83c8]
    JSR IScripts_UpdatePortraitAnimation
    JSR IScripts_Something_SetXYAndOffset_99be
    LDA Joy1_ChangedButtonMask              ; Key pressed by the player:  Bit
                                            ; 0: Right Bit 1: Left Bit 2:
                                            ; Down Bit 3: Up Bit 4: Start Bit
                                            ; 5: Select Bit 6: B Bit 7: A
    BPL @LAB_PRG12__83c8
    JSR IScripts_Something_81E8
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; IScript Action $08: Open Shop
;
; This will load an address for shop item data, and then
; display the items in a box.
;
; Script Parameters:
;
;     1. The address of the shop items (2 bytes)
;
; XREFS:
;     IScriptActions_L [$PRG12::8283]
;============================================================================
IScriptAction_OpenShop:                     ; [$83d8]
    LDA #$14                                ; "What would you like?"
    JSR #$f3f5

  @LAB_PRG12__83dd:                         ; [$83dd]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR Shop_Something_9956
    BCS @_endScript
    BNE @LAB_PRG12__83dd
    JSR IScripts_LoadByte
    STA Temp_Int24                          ; Probably shop inventory table
    JSR IScripts_LoadByte
    STA Temp_Int24.M
    JSR Shop_Populate
    JSR Shop_Draw
    JSR FUN_PRG12__84ed
    BCC @LAB_PRG12__8402

  @_endScript:                              ; [$83ff]
    JMP IScriptAction_EndScript

  @LAB_PRG12__8402:                         ; [$8402]
    JSR Something_ShopCursorInventory
    BCS @LAB_PRG12__8469
    LDX a:Menu_CursorPos
    LDA ShopItems,X
    CMP #$80
    BEQ @LAB_PRG12__8439
    CMP #$81
    BEQ @LAB_PRG12__8439
    CMP #$82
    BEQ @LAB_PRG12__8439
    CMP #$83
    BEQ @LAB_PRG12__8439
    CMP #$92
    BEQ @LAB_PRG12__8439
    CMP #$8a
    BEQ @LAB_PRG12__8439
    CMP #$93
    BEQ @LAB_PRG12__8439
    CMP #$94
    BEQ @LAB_PRG12__8439
    JSR #$f785
    TAX
    LDA NumberOfWeapons,X                   ; Number of weapons in the
                                            ; player's inventory.
    CMP #$847d,X
    BEQ @LAB_PRG12__8469

  @LAB_PRG12__8439:                         ; [$8439]
    LDX a:Menu_CursorPos
    LDA ShopItemCostsL,X
    STA Temp_Int24
    STA a:Temp_0202
    LDA ShopItemCostsU,X
    STA Temp_Int24.M
    STA a:Temp_0203
    JSR IScripts_CheckEnoughMoney
    BCS @LAB_PRG12__8457
    JSR Maybe_Shop_DrawTextBox
    JMP Shop_ShowNotEnoughMoney

  @LAB_PRG12__8457:                         ; [$8457]
    LDX a:Menu_CursorPos
    LDA ShopItems,X
    JSR Player_AddToInventory
    JSR IScripts_ProgressivelySubtractGold
    JSR Maybe_Shop_DrawTextBox
    JMP IScripts_InvokeNextAction

  @LAB_PRG12__8469:                         ; [$8469]
    JSR Maybe_Shop_DrawTextBox
    LDA #$06
    JMP Shop_ShowMessage


;============================================================================
; TODO: Document Maybe_Shop_DrawTextBox
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_OpenShop
;============================================================================
Maybe_Shop_DrawTextBox:                     ; [$8471]
    JSR IScripts_UpdatePortraitAnimation
    JSR IScripts_UpdatePortraitAnimation
    JSR Maybe_Draw_Textbox
    JMP OpenTextWindow

;
; XREFS:
;     IScriptAction_OpenShop
;     Player_AddToInventory
;
MAX_INVENTORY_SLOTS:                        ; [$847d]
    db $04                                  ; [0]: Max weapons
    db $04                                  ; [1]: Max armor
    db $04                                  ; [2]: Max shields
    db $04                                  ; [3]: Max spells
    db $08                                  ; [4]: Max consumable items


;============================================================================
; TODO: Document Something_ShopCursorInventory
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     IScriptAction_OpenShop
;============================================================================
Something_ShopCursorInventory:              ; [$8482]
    LDX a:Menu_CursorPos
    LDA ShopItems,X
    BPL @LAB_PRG12__84bf
    LDX #$00
    CMP #$80
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$81
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$82
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$83
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$92
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$8a
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$93
    BEQ @LAB_PRG12__84b5
    INX
    CMP #$94
    BEQ @LAB_PRG12__84b5

  @LAB_PRG12__84b3:                         ; [$84b3]
    CLC
    RTS

  @LAB_PRG12__84b5:                         ; [$84b5]
    LDA a:SpecialItems
    AND #$84e5,X
    BEQ @LAB_PRG12__84b3

  @LAB_PRG12__84bd:                         ; [$84bd]
    SEC
    RTS

  @LAB_PRG12__84bf:                         ; [$84bf]
    PHA
    JSR #$f785
    TAX
    LDA #$9b29,X
    STA Temp_Int24
    LDA #$9b2e,X
    STA Temp_Int24.M
    PLA
    AND #$1f
    CMP SelectedWeapon,X
    BEQ @LAB_PRG12__84bd
    LDY NumberOfWeapons,X
    BEQ @LAB_PRG12__84b3
    DEY

  @LAB_PRG12__84dc:                         ; [$84dc]
    CMP (Temp_Int24),Y
    BEQ @LAB_PRG12__84bd
    DEY
    BPL @LAB_PRG12__84dc
    CLC
    RTS

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5:                     ; [$84e5]
    db $80                                  ; [0]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_1_:                  ; [$84e6]
    db $40                                  ; [1]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_2_:                  ; [$84e7]
    db $20                                  ; [2]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_3_:                  ; [$84e8]
    db $10                                  ; [3]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_4_:                  ; [$84e9]
    db $08                                  ; [4]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_5_:                  ; [$84ea]
    db $04                                  ; [5]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_6_:                  ; [$84eb]
    db $02                                  ; [6]:

;
; XREFS:
;     Something_ShopCursorInventory
;
BYTE_ARRAY_PRG12__84e5_7_:                  ; [$84ec]
    db $01                                  ; [7]:


;============================================================================
; TODO: Document FUN_PRG12__84ed
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG12__84ed
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;============================================================================
FUN_PRG12__84ed:                            ; [$84ed]
    JSR IScripts_UpdatePortraitAnimation
    JSR Menu_Draw
    LDA Joy1_ChangedButtonMask
    BMI @_returnFalse
    ASL A
    BMI @_returnTrue
    JMP FUN_PRG12__84ed

  @_returnFalse:                            ; [$84fd]
    CLC
    RTS

  @_returnTrue:                             ; [$84ff]
    SEC
    RTS


;============================================================================
; Populate the items in the menu.
;
; This will take the menus stored in the address indicated
; in Temp_Int24 and #$ed. It will loop through
; these, adding the items and costs to the menu state.
;
; INPUTS:
;     Temp_Int24:
;     #$ed:
;         The address of the menu items to load.
;
; OUTPUTS:
;     Menu_LastPos:
;         Position of the last menu item.
;
;     Menu_CursorPos:
;         Start position of the cursor (0).
;
;     ShopItems:
;         The populated list of items.
;
;     ShopItemCostsL:
;     ShopItemCostsU:
;         The populated costs for each item.
;
; XREFS:
;     IScriptAction_OpenShop
;============================================================================
Shop_Populate:                              ; [$8501]
    LDY #$00                                ; Y = 0 (loop counter)
    LDX #$00                                ; X = 0 (menu position counter)
    STX a:Menu_CursorPos                    ; Cusor position = 0

    ;
    ; Fetch the menu item at this index.
    ;
  @_populateLoop:                           ; [$8508]
    LDA (Temp_Int24),Y                      ; A = Menu item at Y.

    ;
    ; Check if we're on the last item.
    ;
    CMP #$ff                                ; Check if it's 0xFF (the menu
                                            ; terminator).
    BEQ @_finish                            ; If so, we're done.

    ;
    ; Store the item.
    ;
    STA ShopItems,X                         ; Store the item in the menu.
    INY                                     ; Y++

    ;
    ; Store the cost.
    ;
    LDA (Temp_Int24),Y                      ; Load the lower byte of the item
                                            ; cost.
    STA ShopItemCostsL,X                    ; Store it.
    INY                                     ; Y++
    LDA (Temp_Int24),Y                      ; Load the upper byte of the item
                                            ; cost.
    STA ShopItemCostsU,X                    ; Store it.

    ;
    ; Increment our counters.
    ;
    INY                                     ; Y++
    INX                                     ; X++
    BNE @_populateLoop                      ; If we're not done, loop.

  @_finish:                                 ; [$8521]
    STX a:Menu_LastPos                      ; Set the last menu position.
    RTS


;============================================================================
; IScript action to add gold.
;
; This will load the lower and middle bytes of gold and
; progressively fill up the player's gold counter.
;
; It will then invoke the next action in the script.
;
; XREFS:
;     IScriptActions_L [$PRG12::8284]
;============================================================================
IScriptAction_AddGold:                      ; [$8525]
    JSR IScripts_LoadByte                   ; Load the lower byte for the
                                            ; gold amount.
    STA a:Temp_0202                         ; Store it.
    JSR IScripts_LoadByte                   ; Load the upper byte for the
                                            ; gold amount.
    STA a:Temp_0203                         ; Store it.
    JSR IScripts_ProgressivelyAddGold       ; Progressively add gold.
    JMP IScripts_InvokeNextAction           ; Invoke the next action.


;============================================================================
; TODO: Document IScripts_ProgressivelyAddGold
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddGold
;     IScriptAction_ShowSellMenu
;     IScripts_ProgressivelyAddGold
;============================================================================
IScripts_ProgressivelyAddGold:              ; [$8537]
    JSR IScripts_UpdatePortraitAnimation
    LDA a:Temp_0203
    BMI @LAB_PRG12__856e
    ORA a:Temp_0202
    BEQ @LAB_PRG12__8566
    JSR IScripts_PlayGoldChangeSound
    LDA a:Temp_0202
    SEC
    SBC #$0a
    STA a:Temp_0202
    LDA a:Temp_0203
    SBC #$00
    STA a:Temp_0203
    LDA #$0a
    STA Temp_Int24
    LDA #$00
    STA Temp_Int24.M
    JSR #$f9c1
    JMP IScripts_ProgressivelyAddGold

  @LAB_PRG12__8566:                         ; [$8566]
    DEC a:Temp_0203
    LDA #$3c
    STA a:Temp_0202

  @LAB_PRG12__856e:                         ; [$856e]
    DEC a:Temp_0202
    BNE IScripts_ProgressivelyAddGold
    RTS


;============================================================================
; Play the gold change sound every 7 ticks.
;
; INPUTS:
;     InterruptCounter:
;         The interrupt counter to control timing of sounds.
;
; OUTPUTS:
;     None
;
; XREFS:
;     IScripts_ProgressivelyAddGold
;============================================================================
IScripts_PlayGoldChangeSound:               ; [$8574]
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$03                                ; Check if we're ready to play a
                                            ; sound.
    BNE @_return                            ; If not, return.

    ;
    ; We're ready to play the sound.
    ;
    LDA #$19                                ; Play the sound.
    JSR #$d0e4

  @_return:                                 ; [$857f]
    RTS


;============================================================================
; IScript action for adding MP.
;
; This will read the first byte as the MP amount.
;
; If this is under the MP cap, it will begin the process of
; progressively adding MP to the user, animating filling up
; the HP.
;
; XREFS:
;     IScriptActions_L [$PRG12::8285]
;============================================================================
IScriptAction_AddMP:                        ; [$8580]
    JSR IScripts_LoadByte                   ; Load the MP amount from the
                                            ; script.
    STA a:IScript_HPOrMPValueToAdd          ; Store in the variable to fill
                                            ; MP up to.
    LDA a:Player_MP                         ; Load the currently-added MP
                                            ; value we're filling from.
    CMP #$50                                ; Compare to the cap.
    BCS thunk_IScripts_InvokeNextAction     ; If at or over, we're done. Jump
                                            ; to invoke the next action.

  @_fillLoop:                               ; [$858d]
    JSR IScripts_UpdatePortraitAnimation
    JSR IScripts_PlayFillingSound           ; Play the sound for filling a
                                            ; bit of MP.
    LDX a:Player_MP                         ; X = Remaining value to add.
    INX                                     ; X++
    TXA                                     ; A = X
    JSR #$fa85                              ; Set the current mana points.
    DEC a:IScript_HPOrMPValueToAdd          ; Decrement the remaining value
                                            ; to add.
    BNE @_fillLoop                          ; If we're not done, loop.

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; Thunk for invoking the next IScript action.
;
; This is here so that other code can jump to it cleanly.
;
; XREFS:
;     IScriptAction_AddHP
;     IScriptAction_AddMP
;============================================================================
thunk_IScripts_InvokeNextAction:            ; [$85a0]
    JMP IScripts_InvokeNextAction


;============================================================================
; Play a sound when filling the HP or MP bar.
;
; This will play every 7 ticks.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     IScriptAction_AddHP
;     IScriptAction_AddMP
;============================================================================
IScripts_PlayFillingSound:                  ; [$85a3]
    LDA InterruptCounter
    AND #$03
    BNE @LAB_PRG12__85ae
    LDA #$13
    JSR #$d0e4

  @LAB_PRG12__85ae:                         ; [$85ae]
    RTS


;============================================================================
; IScript action for adding HP.
;
; This will read the first byte as the HP amount.
;
; If this is under the HP cap, it will begin the process of
; progressively adding HP to the user, animating filling up
; the HP.
;
; NOTE: If you look at the last couple instructions, it may
;       seem it's falling through to
;       IScriptAction_IfQuestCompleted.
;
;       This does not happen. The combination of BEQ and BNE
;       ensures we jump to an IScripts_InvokeNextAction
;       and
;       ends.
;
; XREFS:
;     IScriptActions_L [$PRG12::828e]
;============================================================================
IScriptAction_AddHP:                        ; [$85af]
    JSR IScripts_LoadByte                   ; Load the HP value to add.
    STA a:IScript_HPOrMPValueToAdd          ; Store in the variable to fill
                                            ; HP up to.
    LDA a:Temp_AddedHPValue                 ; Load the currently-added HP
                                            ; value we're filling from.
    CMP #$50                                ; Compare against the cap of 80.
    BCS thunk_IScripts_InvokeNextAction     ; If over, we're done. Invoke the
                                            ; next action.

  @_fillLoop:                               ; [$85bc]
    JSR IScripts_UpdatePortraitAnimation
    JSR IScripts_PlayFillingSound           ; Play the sound for filling a
                                            ; bit of HP.
    LDX a:Temp_AddedHPValue                 ; X = Remaining value to add
    INX                                     ; X++
    TXA                                     ; A = X
    JSR #$fa75                              ; Draw the next bit of health.
    DEC a:IScript_HPOrMPValueToAdd          ; Decrement the remaining amount
                                            ; to add.
    BNE @_fillLoop                          ; If there's more to add, loop.
    BEQ thunk_IScripts_InvokeNextAction     ; Else, invoke the next action.

    ;
    ; X-- Does not fall through -- Terminates at branches above --X
    ;


;============================================================================
; IScript action for a conditional check based on completed quests.
;
; This will read the next byte representing a quest index.
;
; If the player has completed the quests in the bitmask,
; this will read the next 2-byte address and jump to the
; script at that location.
;
; If they have not completed the quests, this will skip the
; address and invoke the following action.
;
; NOTE: This only checks the 3 least-significant bits of the
;       quests bitmask.
;
; XREFS:
;     IScriptActions_L [$PRG12::8286]
;============================================================================
IScriptAction_IfQuestCompleted:             ; [$85d1]
    JSR IScripts_LoadByte                   ; Load the next byte as the
                                            ; quest.
    TAX                                     ; X = A
    LDA a:Quests                            ; Load the current player quests.
    AND #$85e2,X                            ; AND it to the bitmask at the
                                            ; given index.
    BNE @_hasQuestCompleted
    JMP IScripts_SkipAddrAndInvoke          ; Skip 2 bytes and invoke the
                                            ; following action.

  @_hasQuestCompleted:                      ; [$85e0]
    JMP IScripts_JumpToNextAddr

;
; XREFS:
;     IScriptAction_SetQuestComplete
;
ISCRIPTS_QUEST_BITS:                        ; [$85e3]
    db $01,$02,$04                          ; [$85e3] byte


;============================================================================
; IScript action for marking a quest as complete.
;
; This will read the next byte as a quest bitmask value
; and set it.
;
; It will then invoke the following action.
;
; XREFS:
;     IScriptActions_L [$PRG12::8289]
;============================================================================
IScriptAction_SetQuestComplete:             ; [$85e6]
    JSR IScripts_LoadByte
    TAX
    LDA a:Quests
    ORA #$85e2,X
    STA a:Quests
    JMP IScripts_InvokeNextAction


;============================================================================
; IScript action for a conditional check based on a player title.
;
; This will read the next byte as a player title.
;
; If the player has reached that title, this will read
; the next 2-byte address and jump to the script at that
; location.
;
; If not, this will skip the 2 bytes and invoke the
; following action.
;
; XREFS:
;     IScriptActions_L [$PRG12::8287]
;============================================================================
IScriptAction_IfPlayerHasTitle:             ; [$85f6]
    JSR IScripts_LoadByte
    CMP a:PlayerTitle
    BEQ IScripts_JumpToNextAddr
    BCC IScripts_JumpToNextAddr
    JMP IScripts_SkipAddrAndInvoke


;============================================================================
; Jump to the next address found in an IScript.
;
; This will read the next 2-byte address and jump to the
; script at that location.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; XREFS:
;     IScriptAction_22
;     IScriptAction_CheckUpdatePlayerTitle
;     IScriptAction_IfPlayerHasGold
;     IScriptAction_IfPlayerHasItem
;     IScriptAction_IfPlayerHasTitle
;     IScriptAction_IfQuestCompleted
;     IScriptAction_Jump
;     IScriptAction_ShowBuySellMenu
;============================================================================
IScripts_JumpToNextAddr:                    ; [$8603]
    ;
    ; Load the next two event bytes and use that as the
    ; address for the next event to invoke.
    ;
    JSR IScripts_LoadByte
    PHA
    JSR IScripts_LoadByte
    STA IScriptOrCHRAddr.U
    PLA
    STA IScriptOrCHRAddr
    LDA #$00
    STA IScriptOffset
    JMP IScripts_InvokeNextAction


;============================================================================
; Skip the next 2-byte address and invoke the next IScript action.
;
; XREFS:
;     IScriptAction_22
;     IScriptAction_CheckUpdatePlayerTitle
;     IScriptAction_IfPlayerHasGold
;     IScriptAction_IfPlayerHasItem
;     IScriptAction_IfPlayerHasTitle
;     IScriptAction_IfQuestCompleted
;     IScriptAction_ShowBuySellMenu
;============================================================================
IScripts_SkipAddrAndInvoke:                 ; [$8616]
    JSR IScripts_LoadByte
    JSR IScripts_LoadByte
    JMP IScripts_InvokeNextAction


;============================================================================
; IScript action for a conditional check based on gold.
;
; If the player has any gold, the next 2-byte address will
; be read and this will jump to the script at that location.
;
; If the player has no gold, the next 2 bytes will be skipped
; and the following action will be invoked.
;
; XREFS:
;     IScriptActions_L [$PRG12::8288]
;============================================================================
IScriptAction_IfPlayerHasGold:              ; [$861f]
    LDA a:Gold
    ORA a:Gold_M
    ORA a:Gold_U
    BNE @_hasGold
    JMP IScripts_SkipAddrAndInvoke

  @_hasGold:                                ; [$862d]
    JMP IScripts_JumpToNextAddr


;============================================================================
; IScript action for showing the Buy/Sell menu.
;
; This will first display the "Come here to buy or sell?"
; message. It'll listen for a choice.
;
; If the player chose "Buy", the next 2-byte address will
; be read from the script and this will jump to that
; address.
;
; If the player chose "Sell", this will skip the address
; and execute the next script action.
;
; XREFS:
;     IScriptActions_L [$PRG12::828a]
;============================================================================
IScriptAction_ShowBuySellMenu:              ; [$8630]
    ;
    ; Display the next "Come here to buy or sell?" message.
    ;
    LDA #$10
    JSR #$f3e9

    ;
    ; Set the last menu item position to point to Sell.
    ;
    LDA #$02                                ; Set the last position to 2.
    STA a:Menu_LastPos

    ;
    ; Set the start cursor position to Buy.
    ;
    LDA #$00                                ; Set the start cursor position
                                            ; to 0.
    STA a:Menu_CursorPos

    ;
    ; Render the menu and wait for button changes.
    ;
  @_loop:                                   ; [$863f]
    JSR IScripts_UpdatePortraitAnimation
    JSR Menu_Draw
    LDA Joy1_ChangedButtonMask              ; Load the changed button mask.
    BMI @_choiceMade                        ; If the A button was pressed,
                                            ; jump.

    ;
    ; Check any button presses since the last iteration.
    ;
    ASL A                                   ; Increment the bit to check in
                                            ; the button mask.
    BPL @_loop                              ; If any other button was
                                            ; pressed, loop.

    ;
    ; End the script.
    ;
    JMP IScriptAction_EndScript

    ;
    ; Perform the next action based on the choice.
    ;
  @_choiceMade:                             ; [$864f]
    LDA a:Menu_CursorPos                    ; Check the cursor position.
    BEQ IScripts_JumpToNextAddr             ; If it's the first item, jump to
                                            ; the next address in the script.
    JMP IScripts_SkipAddrAndInvoke          ; Else, skip the address and
                                            ; invoke the next action.


;============================================================================
; IScript action for consuming a player's item.
;
; This will load the next byte as an inventory item type
; and remove it from the player's inventory.
;
; It will then invoke the next action in the script.
;
; XREFS:
;     IScriptActions_L [$PRG12::828b]
;============================================================================
IScriptAction_ConsumeItem:                  ; [$8657]
    JSR IScripts_LoadByte
    JSR Player_RemoveItem
    JMP IScripts_InvokeNextAction


;============================================================================
; TODO: Document IScriptAction_ShowSellMenu
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptActions_L [$PRG12::828c]
;============================================================================
IScriptAction_ShowSellMenu:                 ; [$8660]
    JSR IScripts_LoadByte
    STA Temp_Int24
    JSR IScripts_LoadByte
    STA Temp_Int24.M
    LDA #$00
    STA a:Menu_LastPos
    LDX #$04

  @LAB_PRG12__8671:                         ; [$8671]
    LDY NumberOfWeapons,X
    BEQ @LAB_PRG12__86b7
    TXA
    PHA
    JSR #$f78b
    STA a:Maybe_Shop_InventoryBitmask
    LDA #$9b29,X
    STA Temp_Int24.U
    LDA #$9b2e,X
    STA Maybe_Temp4
    DEY

  @LAB_PRG12__8689:                         ; [$8689]
    TYA
    PHA
    LDA (#$ee),Y
    ORA a:Maybe_Shop_InventoryBitmask
    TAX
    JSR IScripts_SellMenu_Something8704
    BNE @LAB_PRG12__86b0
    LDX a:Menu_LastPos
    STA ShopItems,X
    INY
    LDA (Temp_Int24),Y
    STA ShopItemCostsL,X
    INY
    LDA (Temp_Int24),Y
    LSR A
    ROR ShopItemCostsL,X
    STA ShopItemCostsU,X
    INX
    STX a:Menu_LastPos

  @LAB_PRG12__86b0:                         ; [$86b0]
    PLA
    TAY
    DEY
    BPL @LAB_PRG12__8689
    PLA
    TAX

  @LAB_PRG12__86b7:                         ; [$86b7]
    INX
    CPX #$05
    BNE @LAB_PRG12__8671
    LDA a:Menu_LastPos
    BNE @LAB_PRG12__86c6
    LDA #$12
    JMP Shop_ShowMessage

  @LAB_PRG12__86c6:                         ; [$86c6]
    LDA #$13
    JSR #$f3f5

  @LAB_PRG12__86cb:                         ; [$86cb]
    JSR IScripts_UpdatePortraitAnimation
    JSR #$f466
    JSR Shop_Something_9956
    BCS @_endScript
    BNE @LAB_PRG12__86cb
    JSR Shop_Draw
    JSR FUN_PRG12__84ed
    BCS @_endScript
    LDX a:Menu_CursorPos
    LDA ShopItemCostsL,X
    STA a:Temp_0202
    LDA ShopItemCostsU,X
    STA a:Temp_0203
    LDA ShopItems,X
    JSR Player_RemoveItem
    JSR IScripts_ProgressivelyAddGold
    JSR Maybe_Draw_Textbox
    JSR OpenTextWindow
    JMP IScripts_InvokeNextAction

  @_endScript:                              ; [$8701]
    JMP IScriptAction_EndScript


;============================================================================
; TODO: Document IScripts_SellMenu_Something8704
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_ShowSellMenu
;============================================================================
IScripts_SellMenu_Something8704:            ; [$8704]
    LDY #$00

  @LAB_PRG12__8706:                         ; [$8706]
    LDA (Temp_Int24),Y
    CMP #$ff
    BEQ @LAB_PRG12__8716
    TXA
    CMP (Temp_Int24),Y
    BEQ @_return
    INY
    INY
    INY
    BNE @LAB_PRG12__8706

  @LAB_PRG12__8716:                         ; [$8716]
    TAX

  @_return:                                 ; [$8717]
    RTS


;============================================================================
; IScript Action $12: If Player Has Item.
;
; This will load the next byte as an inventory item type.
;
; If the player has the item, the next 2-byte address will
; be loaded and this will jump to that address.
;
; If the item is not in the inventory, the address will
; be skipped and the following action will be invoked.
;
; Script Parameters:
;
;     1. Item ID (1 byte)
;     2. Jump address (2 bytes)
;
; XREFS:
;     IScriptActions_L [$PRG12::828d]
;============================================================================
IScriptAction_IfPlayerHasItem:              ; [$8718]
    JSR IScripts_LoadByte
    JSR Player_LacksItem
    BCC @_invokeElse
    JMP IScripts_SkipAddrAndInvoke

  @_invokeElse:                             ; [$8723]
    JMP IScripts_JumpToNextAddr


;============================================================================
; IScript Action $04: Check and Update Player Title
;
; If the player was eligible for a new title, their title
; will be increased and the next 2-byte address in the
; script be loaded and this will jump to that address.
;
; If not, the address will be skipped and the next action
; will be invoked.
;
; Script Parameters:
;
;     1. If-Updated Jump Address (2 bytes)
;
; XREFS:
;     IScriptActions_L [$PRG12::827f]
;============================================================================
IScriptAction_CheckUpdatePlayerTitle:       ; [$8726]
    LDA a:NextPlayerTitle
    CMP a:PlayerTitle
    BEQ @_invokeElse
    STA a:PlayerTitle
    JMP IScripts_JumpToNextAddr

  @_invokeElse:                             ; [$8734]
    JMP IScripts_SkipAddrAndInvoke


;============================================================================
; IScript Action $14: Show Password
;
; This is used when interacting with Gurus. The current
; state of the game will be encoded as a password and
; displayed.
;
; Script Parameters:
;     None.
;
; XREFS:
;     IScriptActions_L [$PRG12::828f]
;============================================================================
IScriptAction_ShowPassword:                 ; [$8737]
    JSR Password_GenerateStateAndReset      ; Generate the password state.
    JSR #$f434                              ; Clear the textbox.
    LDA #$00
    STA a:IScripts_Unused_207

  @_charLoop:                               ; [$8742]
    JSR IScripts_UpdatePortraitAnimation
    JSR PasswordScreen_ShowNextChar         ; Show the next character in the
                                            ; password.
    BCC @_charLoop                          ; If not done, loop.

  @_portraitLoop:                           ; [$874a]
    JSR IScripts_UpdatePortraitAnimation
    JSR IScripts_Something_SetXYAndOffset_99be
    LDA Joy1_ChangedButtonMask              ; A = Changed button mask
    BPL @_portraitLoop                      ; If not dismissed, loop.
    JMP IScripts_InvokeNextAction           ; Invoke the next action in the
                                            ; script.


;============================================================================
; Show the next character of a password.
;
; This will fetch the next 6 bits of a password and look
; that up in the character display lookup table.
;
; INPUTS:
;     PASSWORD_ENTERED_CHARS
;         The lookup table of characters.
;
; OUTPUTS:
;     C:
;         1 if finished with the password.
;         0 if there are characters remaining.
;
; CALLS:
;     Password_GetNext6Bits
;     TextBox_ShowMessage
;
; XREFS:
;     IScriptAction_ShowPassword
;============================================================================
PasswordScreen_ShowNextChar:                ; [$8757]
    JSR Password_GetNext6Bits               ; Get the next 6 bits of password
                                            ; state for the character offset.
    PHP                                     ; Push flags to stack.
    TAY                                     ; Y = A (index)
    LDA #$8764,Y                            ; A = character at index Y
    JSR #$f4ff                              ; Show the character in the
                                            ; textbox.
    PLP                                     ; Pop flags.
    RTS


;============================================================================
; List of password characters by index.
;============================================================================

;
; XREFS:
;     PasswordScreen_Maybe_WriteCharAtCursor
;     PasswordScreen_ShowNextChar
;
PASSWORD_ENTERED_CHARS:                     ; [$8764]
    db "ABCDEFGHIJKLMNOP"                   ; [$8764] char
    db "QRSTUVWXYZabcdef"                   ; [$8774] char
    db "ghijklmnopqrstuv"                   ; [$8784] char
    db "wxyz0123456789,?"                   ; [$8794] char


;============================================================================
; Load the next byte from the IScript.
;
; This will load the byte and update the offset.
;
; If the offset wraps around from 0xFF to 0, the upper
; bound of the address will wrap.
;
; INPUTS:
;     IScriptOrCHRAddr:
;         The start address of the script to read from.
;
;     IScriptOffset:
;         The offset within the script.
;
; OUTPUTS:
;     A:
;         The resulting byte.
;
; XREFS:
;     IScriptAction_22
;     IScriptAction_AddGold
;     IScriptAction_AddHP
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddMP
;     IScriptAction_ConsumeItem
;     IScriptAction_IfPlayerHasItem
;     IScriptAction_IfPlayerHasTitle
;     IScriptAction_IfQuestCompleted
;     IScriptAction_OpenShop
;     IScriptAction_SetQuestComplete
;     IScriptAction_SetSpawnPoint
;     IScriptAction_ShowMessage
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     IScriptAction_SpendGold
;     IScripts_InvokeNextAction
;     IScripts_JumpToNextAddr
;     IScripts_SkipAddrAndInvoke
;============================================================================
IScripts_LoadByte:                          ; [$87a4]
    LDY IScriptOffset                       ; Y = current event offset
    LDA (IScriptOrCHRAddr),Y                ; A = byte in the script at the
                                            ; offset
    INY                                     ; Y++
    BNE @_incOffset                         ; If byte is not 0, update event
                                            ; and return.

    ;
    ; The offset wrapped from 0xFF to 0. Update the upper byte
    ; of the script address for the next read.
    ;
    INC IScriptOrCHRAddr.U                  ; Increment the address

  @_incOffset:                              ; [$87ad]
    STY IScriptOffset                       ; Set new offset

    ;
    ; XREFS:
    ;     IScripts_UpdatePortraitAnimation
    ;
RETURN_87AF:                                ; [$87af]
    RTS


;============================================================================
; TODO: Document IScripts_UpdatePortraitAnimation
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__84ed
;     IScriptAction_22
;     IScriptAction_AddHP
;     IScriptAction_AddInventoryItem
;     IScriptAction_AddMP
;     IScriptAction_EndScript
;     IScriptAction_OpenShop
;     IScriptAction_ShowBuySellMenu
;     IScriptAction_ShowMessage
;     IScriptAction_ShowPassword
;     IScriptAction_ShowQuestionMessage
;     IScriptAction_ShowSellMenu
;     IScriptAction_ShowUnskippableMessage
;     IScripts_ProgressivelyAddGold
;     IScripts_ProgressivelySubtractGold
;     Maybe_Shop_DrawTextBox
;     Shop_ShowMessage
;============================================================================
IScripts_UpdatePortraitAnimation:           ; [$87b0]
    JSR #$ca25
    JSR #$cb47
    JSR #$dc46
    LDA a:IScriptEntity
    BPL RETURN_87AF
    JMP @LAB_PRG12__87c1

  @LAB_PRG12__87c1:                         ; [$87c1]
    LDA a:MessageID
    BEQ @LAB_PRG12__87d4
    LDA a:TextBox_MessageEnded
    BNE @LAB_PRG12__87d4
    LDA InterruptCounter
    LSR A
    LSR A
    LSR A
    AND #$03
    BPL @LAB_PRG12__87d6

  @LAB_PRG12__87d4:                         ; [$87d4]
    LDA #$00

  @LAB_PRG12__87d6:                         ; [$87d6]
    JSR Portrait_SetInnerSpriteXY
    JMP #$f29b


;============================================================================
; Check if the user has enough money.
;
; This will determine a result based on the values stored
; in GoldMRequired and GoldLRequired.
;
; If Gold_U is at all set, it's assumed the player has
; enough money, because all checks are under this amount.
;
; Else, if Gold_M has more than the requested amount, or
; is equal and Gold_L has more, then the player has enough.
;
; INPUTS:
;     Temp_Int24:
;     #$ed:
;         The amount of gold required for a true result.
;
;     Gold:
;     Gold_M:
;     Gold_U:
;         The amount of gold the player has.
;
; OUTPUTS:
;     C:
;         1 if the player has enough gold.
;         0 if the player does not.;
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_SpendGold
;============================================================================
IScripts_CheckEnoughMoney:                  ; [$87dc]
    ;
    ; Check the upper byte of the gold.
    ;
    LDA a:Gold_U                            ; Load the upper byte of the
                                            ; player's gold amount.
    CMP #$00                                ; Is it 0?
    BNE @_return                            ; If no, return. CMP set Carry as
                                            ; our result.

    ;
    ; Check the middle byte of the gold.
    ;
    LDA a:Gold_M                            ; Load the middle byte of the
                                            ; player's gold amount.
    CMP Temp_Int24.M                        ; Compare to the required amount.
    BNE @_return                            ; If not 0, return. CMP set Carry
                                            ; as our result.

    ;
    ; Check the lower byte of the gold.
    ;
    LDA a:Gold                              ; Load the lower byte of the gold
                                            ; amount.
    CMP Temp_Int24                          ; Compare to get our final result
                                            ; as the Carry flag.

  @_return:                                 ; [$87ef]
    RTS


;============================================================================
; TODO: Document TextBox_GetCursorXForTileX1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG12__9075
;============================================================================
TextBox_GetCursorXForTileX1:                ; [$87f0]
    LDA a:TextBox_X                         ; Load the left coordinate.
    ASL A                                   ; Multiply by 8.
    ASL A
    ASL A
    RTS


;============================================================================
; TODO: Document TextBox_GetCursorYForTileY2
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG12__9075
;============================================================================
TextBox_GetCursorYForTileY2:                ; [$87f7]
    LDA a:TextBox_Y                         ; Load the bottom coordinate.
    ASL A                                   ; Multiply by 8.
    ASL A
    ASL A
    RTS


;============================================================================
; TODO: Document FUN_PRG12__87fe
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG12__880e
;     Maybe_Draw_Textbox_Something8F51
;============================================================================
FUN_PRG12__87fe:                            ; [$87fe]
    LDA TextBox_TextY
    ASL A
    ASL A
    AND #$f8
    STA Temp_Int24.M
    LDA TextBox_TextX
    LSR A
    ORA Temp_Int24.M
    STA Temp_Int24.M
    RTS


;============================================================================
; TODO: Document FUN_PRG12__880e
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Draw_Textbox_Something8F51
;============================================================================
FUN_PRG12__880e:                            ; [$880e]
    STA Temp_Int24
    JSR FUN_PRG12__87fe
    TAX
    LDA TextBox_TextY
    LSR A
    BCS @LAB_PRG12__8842
    LDA TextBox_TextX
    LSR A
    BCS @LAB_PRG12__882f
    LDA Something_ValuesToDraw,X
    AND #$fc
    STA Temp_Int24.M
    LDA Temp_Int24
    AND #$03
    ORA Temp_Int24.M
    STA Something_ValuesToDraw,X
    RTS

  @LAB_PRG12__882f:                         ; [$882f]
    LDA Something_ValuesToDraw,X
    AND #$f3
    STA Temp_Int24.M
    LDA Temp_Int24
    ASL A
    ASL A
    AND #$0c
    ORA Temp_Int24.M
    STA Something_ValuesToDraw,X
    RTS

  @LAB_PRG12__8842:                         ; [$8842]
    LDA TextBox_TextX
    LSR A
    BCS @LAB_PRG12__885c
    LDA Something_ValuesToDraw,X
    AND #$cf
    STA Temp_Int24.M
    LDA Temp_Int24
    ASL A
    ASL A
    ASL A
    ASL A
    AND #$30
    ORA Temp_Int24.M
    STA Something_ValuesToDraw,X
    RTS

  @LAB_PRG12__885c:                         ; [$885c]
    LDA Something_ValuesToDraw,X
    AND #$3f
    STA Temp_Int24.M
    LDA Temp_Int24
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    AND #$c0
    ORA Temp_Int24.M
    STA Something_ValuesToDraw,X
    RTS

PLAYER_TOP_MENU_ITEM_STRINGS:               ; [$8873]
    db $06,"WEAPON         "                ; [$8873] char
    db $05,"ARMOR          "                ; [$8883] char
    db $06,"SHIELD         "                ; [$8893] char
    db $05,"MAGIC          "                ; [$88a3] char
    db $04,"ITEM           "                ; [$88b3] char
    db $06,"PLAYER         "                ; [$88c3] char

PLAYER_STATUS_MENU_STRINGS:                 ; [$88d3]
    db $09,"    RANK:      "                ; [$88d3] char
    db $09,"NEXT EXP:      "                ; [$88e3] char
    db $09,"WEAPON:        "                ; [$88f3] char
    db $09," ARMOR:        "                ; [$8903] char
    db $09,"SHIELD:        "                ; [$8913] char
    db $09," MAGIC:        "                ; [$8923] char
    db $09,"  ITEM:        "                ; [$8933] char
    db $09,"NOVICE         "                ; [$8943] char
    db $09,"ASPIRANT       "                ; [$8953] char
    db $09,"BATTLER        "                ; [$8963] char
    db $09,"FIGHTER        "                ; [$8973] char
    db $09,"ADEPT          "                ; [$8983] char
    db $09,"CHEVALIER      "                ; [$8993] char
    db $09,"VETERAN        "                ; [$89a3] char
    db $09,"WARRIOR        "                ; [$89b3] char
    db $09,"SWORDMAN       "                ; [$89c3] char
    db $09,"HERO           "                ; [$89d3] char
    db $09,"SOLDIER        "                ; [$89e3] char
    db $09,"MYRMIDON       "                ; [$89f3] char
    db $09,"CHAMPION       "                ; [$8a03] char
    db $09,"SUPERHERO      "                ; [$8a13] char
    db $09,"PALADIN        "                ; [$8a23] char
    db $09,"LORD           "                ; [$8a33] char
    db $09,"NO WEAPON      "                ; [$8a43] char
    db $09,"NO ARMOR       "                ; [$8a53] char
    db $09,"NO SHIELD      "                ; [$8a63] char
    db $09,"NO MAGIC       "                ; [$8a73] char
    db $09,"NO ITEM        "                ; [$8a83] char


;============================================================================
; TODO: Document UI_ShowPlayerMenu
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     GameLoop_CheckShowPlayerMenu
;============================================================================
UI_ShowPlayerMenu:                          ; [$8a93]
    LDA #$06
    STA a:Menu_LastPos
    LDA #$00
    STA a:Menu_CursorPos
    LDA #$02
    STA a:TextBox_X
    LDA #$06
    STA a:TextBox_Y
    LDA #$0a
    STA a:TextBox_Width
    LDA #$0e
    STA a:TextBox_Height
    LDA #$18
    JSR #$d0e4
    JSR TextBox_Maybe_Draw
    LDA #$73
    STA Temp_Int24
    LDA #$88
    STA Temp_Int24.M
    LDX #$00
    STX a:ShopItems
    INX
    STX a:ShopItems_1_
    INX
    STX a:ShopItems_2_
    INX
    STX a:ShopItems_3_
    INX
    STX a:ShopItems_4_
    INX
    STX a:ShopItems_5_
    JSR Shop_DrawItemStrings

  @LAB_PRG12__8add:                         ; [$8add]
    JSR #$ca25
    JSR #$cb47
    JSR Menu_Draw
    LDA Joy1_ChangedButtonMask
    BMI @LAB_PRG12__8af0
    ASL A
    BPL @LAB_PRG12__8add
    JMP Maybe_Draw_Textbox

  @LAB_PRG12__8af0:                         ; [$8af0]
    LDX a:Menu_CursorPos
    CPX #$05
    BNE @LAB_PRG12__8afa
    JMP PlayerMenu_Maybe_ShowStatus

  @LAB_PRG12__8afa:                         ; [$8afa]
    LDA #$04
    STA a:TextBox_X
    LDA #$08
    STA a:TextBox_Y
    LDA #$14
    STA a:TextBox_Width
    LDA #$12
    STA a:TextBox_Height
    JSR TextBox_Maybe_Draw
    LDX a:Menu_CursorPos
    STX a:PlayerMenu_SelectedInventory
    LDA NumberOfWeapons,X
    BNE @LAB_PRG12__8b4f
    LDA a:TextBox_X
    CLC
    ADC #$02
    STA TextBox_TextX
    LDA a:TextBox_Y
    CLC
    ADC #$02
    STA TextBox_TextY
    JSR #$f804
    LDA #$43
    STA Temp_Int24
    LDA #$8a
    STA Temp_Int24.M
    LDA a:Menu_CursorPos
    JSR #$f78c
    TAY
    JSR Strings_Draw

  @LAB_PRG12__8b41:                         ; [$8b41]
    JSR #$ca25
    JSR #$cb47
    LDA Joy1_ChangedButtonMask
    ASL A
    BPL @LAB_PRG12__8b41
    JMP FUN_PRG12__8bed

  @LAB_PRG12__8b4f:                         ; [$8b4f]
    STA a:Menu_LastPos
    LDA #$9b29,X
    STA Temp_Int24
    LDA #$9b2e,X
    STA Temp_Int24.M
    LDY #$00

  @LAB_PRG12__8b5e:                         ; [$8b5e]
    LDA (Temp_Int24),Y
    STA ShopItems,Y
    INY
    CPY a:Menu_LastPos
    BNE @LAB_PRG12__8b5e
    JSR FUN_PRG12__8c04
    LDA #$00
    STA a:Menu_CursorPos


;============================================================================
; TODO: Document FUN_PRG12__8b71
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG12__8be5
;============================================================================
FUN_PRG12__8b71:                            ; [$8b71]
    JSR #$ca25
    JSR #$cb47
    JSR Menu_Draw
    LDA Joy1_ChangedButtonMask
    BMI @LAB_PRG12__8b83
    ASL A
    BMI FUN_PRG12__8bed
    BPL FUN_PRG12__8b71

  @LAB_PRG12__8b83:                         ; [$8b83]
    LDA a:Area_CurrentArea
    CMP #$04
    BEQ FUN_PRG12__8be5
    LDA a:PlayerMenu_SelectedInventory
    CMP #$03
    BCS FUN_PRG12__8bce
    LDA a:SelectedWeapon
    CMP #$03
    BEQ FUN_PRG12__8be5
    LDX a:Menu_CursorPos
    LDA ShopItems,X
    CMP #$03
    BNE FUN_PRG12__8bce
    LDA #$03
    JSR Player_LacksItem
    BCS FUN_PRG12__8be5
    LDA #$23
    JSR Player_LacksItem
    BCS FUN_PRG12__8be5
    LDA #$43
    JSR Player_LacksItem
    BCS FUN_PRG12__8be5
    LDA #$08
    JSR #$d0e4
    LDA #$03
    JSR Player_Equip
    LDA #$23
    JSR Player_Equip
    LDA #$43
    JSR Player_Equip
    JMP FUN_PRG12__8bed


;============================================================================
; TODO: Document FUN_PRG12__8bce
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__8b71
;============================================================================
FUN_PRG12__8bce:                            ; [$8bce]
    LDA #$08
    JSR #$d0e4
    LDX a:Menu_CursorPos
    LDA a:PlayerMenu_SelectedInventory
    JSR #$f78b
    ORA ShopItems,X
    JSR Player_Equip
    JMP FUN_PRG12__8bed


;============================================================================
; TODO: Document FUN_PRG12__8be5
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__8b71
;============================================================================
FUN_PRG12__8be5:                            ; [$8be5]
    LDA #$0d
    JSR #$d0e4
    JMP FUN_PRG12__8b71


;============================================================================
; TODO: Document FUN_PRG12__8bed
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG12__8bce
;     UI_ShowPlayerMenu
;============================================================================
FUN_PRG12__8bed:                            ; [$8bed]
    LDA #$02
    STA a:TextBox_X
    LDA #$06
    STA a:TextBox_Y
    LDA #$16
    STA a:TextBox_Width
    LDA #$14
    STA a:TextBox_Height
    JMP Maybe_Draw_Textbox


;============================================================================
; TODO: Document FUN_PRG12__8c04
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     UI_ShowPlayerMenu
;============================================================================
FUN_PRG12__8c04:                            ; [$8c04]
    LDA a:TextBox_Y
    STA TextBox_TextY
    LDX #$00

  @LAB_PRG12__8c0b:                         ; [$8c0b]
    TXA
    PHA
    INC TextBox_TextY
    LDY a:TextBox_X
    INY
    INY
    STY TextBox_TextX
    LDA a:PlayerMenu_SelectedInventory
    JSR #$f78b
    ORA ShopItems,X
    PHA
    JSR Maybe_DrawItemName
    PLA
    INC TextBox_TextY
    INC TextBox_TextX
    INC TextBox_TextX
    JSR Maybe_DrawItemTitle
    PLA
    TAX
    INX
    CPX a:Menu_LastPos
    BNE @LAB_PRG12__8c0b
    RTS


;============================================================================
; TODO: Document Maybe_DrawItemTitle
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__8c04
;     IScriptAction_AddInventoryItem
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Draw
;============================================================================
Maybe_DrawItemTitle:                        ; [$8c36]
    PHA
    PHA
    JSR #$f804
    PLA
    JSR #$f785
    TAX
    LDA #$9b33,X
    STA Temp_Int24
    LDA #$9b38,X
    STA Temp_Int24.M
    PLA
    AND #$1f
    JSR #$f78c
    BCC @LAB_PRG12__8c54
    INC Temp_Int24.M

  @LAB_PRG12__8c54:                         ; [$8c54]
    TAY
    JMP Strings_Draw


;============================================================================
; TODO: Document Maybe_DrawItemName
;
; INPUTS:
;     A
;     X
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     FUN_PRG12__8c04
;     IScriptAction_AddInventoryItem
;     PlayerMenu_Maybe_ShowStatus
;     Shop_Draw
;============================================================================
Maybe_DrawItemName:                         ; [$8c58]
    STA Temp_Int24
    TYA
    PHA
    TXA
    PHA
    LDA #$00
    STA PPU_TargetAddr
    TXA
    PHA
    PHA
    LSR A
    ROR PPU_TargetAddr
    LSR A
    ROR PPU_TargetAddr
    ADC #$14
    STA PPU_TargetAddr.U
    LDA Temp_Int24
    JSR #$fc18
    JSR #$f804
    LDA #$02
    JSR #$cfdc
    PLA
    ASL A
    ASL A
    ADC #$40
    JSR #$f845
    CLC
    ADC #$01
    JSR #$f845
    STX PPUBuffer_UpperBounds
    JSR #$f826
    LDA #$02
    JSR #$cfdc
    PLA
    ASL A
    ASL A
    ADC #$42
    JSR #$f845
    CLC
    ADC #$01
    JSR #$f845
    STX PPUBuffer_UpperBounds
    PLA
    TAX
    PLA
    TAY
    RTS


;============================================================================
; Equip an item from the inventory.
;
; INPUTS:
;     A:
;         The inventory item, with bits indicating the inventory.
;
; OUTPUTS:
;     None
;
; XREFS:
;     FUN_PRG12__8b71
;     FUN_PRG12__8bce
;============================================================================
Player_Equip:                               ; [$8ca9]
    ;
    ; Calculate the target inventory and store the old and
    ; new items temporary.
    ;
    STA a:Temp_EquipingItem                 ; Store the item that we're
                                            ; equipping.
    JSR #$f785                              ; Compute the inventory index of
                                            ; the item.
    TAX                                     ; Set X = the inventory index we
                                            ; computed
    LDA SelectedWeapon,X                    ; Get the current item in the
                                            ; target inventory.
    STA a:Temp_PrevInventoryItem            ; Store the old item we're
                                            ; unequipping.

    ;
    ; Unequip the old item.
    ;
    LDA a:Temp_EquipingItem
    JSR Player_RemoveItem                   ; Unequip the old item.
    LDA a:Temp_PrevInventoryItem            ; Load back the previous item.

    ;
    ; Only add to the inventory if we didn't already have one.
    ;
    BMI @_inInventory                       ; Branch if we don't need to add
                                            ; to the inventory.
    LDA a:Temp_EquipingItem                 ; Load the item we're equipping.
    AND #$e0                                ; Clear out all but the inventory
                                            ; bits.
    ORA a:Temp_PrevInventoryItem            ; Add the item's value.
    JSR Player_AddToInventory               ; Now add to the inventory.

  @_inInventory:                            ; [$8ccc]
    LDA a:Temp_EquipingItem

    ;
    ; Set the normalized value within the inventory.
    ;
    JSR #$f785                              ; Calculate the inventory slot
                                            ; again.
    TAY                                     ; Set Y = inventory slot
    LDA a:Temp_EquipingItem                 ; Set A = new item
    AND #$1f                                ; Clear out the inventory bits,
                                            ; yielding the item value.
    DEY
    BEQ @_isArmor                           ; Check if it's armor.
    DEY
    BEQ @_isShield                          ; Check if it's a shield.
    DEY
    BEQ @_isMagic                           ; Check if it's magic.
    DEY
    BEQ @_isItem                            ; Check if it's an item.

    ;
    ; Inventory 0 (weapons)
    ;
    JMP #$edec                              ; Set the current weapon.

    ;
    ; Inventory 1 (armor)
    ;
  @_isArmor:                                ; [$8ce7]
    JMP #$ee05                              ; Set the current armor.

    ;
    ; Inventory 2 (shield)
    ;
  @_isShield:                               ; [$8cea]
    JMP #$ee0d                              ; Set the current shield.

    ;
    ; Inventory 3 (magic)
    ;
  @_isMagic:                                ; [$8ced]
    JMP Player_SetMagic                     ; Set the current magic.

    ;
    ; Inventory 4 (normal items)
    ;
  @_isItem:                                 ; [$8cf0]
    JMP #$fc0b                              ; Set the current item.


;============================================================================
; Set the player's current magic spell.
;
; INPUTS:
;     A:
;         The magic spell to set.
;
; OUTPUTS:
;     SelectedMagic:
;         The updated magic spell.
;
; XREFS:
;     Player_Equip
;============================================================================
Player_SetMagic:                            ; [$8cf3]
    STA a:SelectedMagic                     ; Store the provided A value as
                                            ; the selected magic.
    RTS


;============================================================================
; Return whether the player lacks an item in the inventory.
;
; This will inspect the inventory bits of the item (the 3
; most significant bits), using the remaining bits as the
; value of the item in the inventory.
;
; INPUTS:
;     A:
;         The item index with inventory bits to check.
;
; OUTPUTS:
;     C:
;         1 if the item is not in the inventory.
;         0 if it is.
;
; XREFS:
;     FUN_PRG12__8b71
;     IScriptAction_IfPlayerHasItem
;============================================================================
Player_LacksItem:                           ; [$8cf7]
    ;
    ; Check if this is a special item.
    ;
    ; Each special item type will be converted into an index in
    ; the SPECIAL_ITEMS_BITMASKS lookup table.
    ;
    ; If the matching bit is set, the item exists, so return false.
    ;
    LDX #$00                                ; X will be our lookup table
                                            ; index.
    CMP #$80                                ; Check Ring of Elf.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$81                                ; Check Ring of Ruby.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$82                                ; Check Ring of Dworf.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$83                                ; Check Demon's Ring.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$92                                ; Check Elixir.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$8a                                ; Check Magical Rod.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$93                                ; Check Pendant.
    BEQ @_specialItemMatched
    INX                                     ; X++
    CMP #$94                                ; Check Black Onyx.
    BEQ @_specialItemMatched
    PHA                                     ; Push the item value on the
                                            ; stack.
    JSR #$f785                              ; Get the inventory for the item.
    TAY                                     ; Set Y = inventory.
    LDA #$9b29,Y
    STA Temp_Int24
    LDA #$9b2e,Y
    STA Temp_Int24.M

    ;
    ; Check if this item is currently equipped.
    ;
    ; If so, we'll be returning false (we don't lack it).
    ;
    PLA                                     ; Pull the item into A
    AND #$1f                                ; Clear out the inventory bits,
                                            ; leaving the item value.
    CMP SelectedWeapon,Y                    ; Get the inventory index from Y.
    BEQ @_returnFalse                       ; If this item is currently set,
                                            ; return false.

    ;
    ; Check the number of items in the target inventory.
    ;
    ; If the number is 0, we definitely lack the item.
    ;
    LDX NumberOfWeapons,Y                   ; Set X = inventory item count.
    BEQ @_returnTrue                        ; If 0, we lack the item.

    ;
    ; Loop through all items in the inventory to see if
    ; we have this item.
    ;
    LDY #$00                                ; Set Y = 0 for the loop counter

    ;
    ; Check the item at the address to see if it matches this one.
    ;
    ; If so, we don't lack the item.
    ;
  @_checkInventoryLoop:                     ; [$8d3e]
    CMP (Temp_Int24),Y                      ; Check the inventory address at
                                            ; this index.
    BEQ @_returnFalse                       ; If it's a match, we don't lack
                                            ; the item. Return false.
    INY                                     ; Y++.
    DEX                                     ; Reduce the number of items left
                                            ; to check.
    BNE @_checkInventoryLoop                ; Next loop.

    ;
    ; The item could not be found. The player lacks the item.
    ;
  @_returnTrue:                             ; [$8d46]
    SEC                                     ; Set for a true result.
    RTS

  @_specialItemMatched:                     ; [$8d48]
    LDA a:SpecialItems                      ; Load the player's Special Items
                                            ; bitmask.
    AND #$8d52,X                            ; Clear the bit for the matched
                                            ; item.
    BEQ @_returnTrue

  @_returnFalse:                            ; [$8d50]
    CLC                                     ; Clear for a false result.
    RTS

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS:                     ; [$8d52]
    db $80                                  ; [0]: Ring of Elf

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_1_:                  ; [$8d53]
    db $40                                  ; [1]: Ring of Ruby

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_2_:                  ; [$8d54]
    db $20                                  ; [2]: Ring of Dworf

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_3_:                  ; [$8d55]
    db $10                                  ; [3]: Demon's Ring

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_4_:                  ; [$8d56]
    db $08                                  ; [4]: Elixir

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_5_:                  ; [$8d57]
    db $04                                  ; [5]: Magical Rod

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_6_:                  ; [$8d58]
    db $02                                  ; [6]: Pendant

;
; XREFS:
;     Player_LacksItem
;
SPECIAL_ITEMS_BITMASKS_7_:                  ; [$8d59]
    db $01                                  ; [7]: Black Onyx


;============================================================================
; TODO: Document PlayerMenu_Maybe_ShowStatus
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     UI_ShowPlayerMenu
;============================================================================
PlayerMenu_Maybe_ShowStatus:                ; [$8d5a]
    LDA #$04
    STA a:TextBox_X
    LDA #$08
    STA a:TextBox_Y
    LDA #$1a
    STA a:TextBox_Width
    LDA #$10
    STA a:TextBox_Height
    JSR TextBox_Maybe_Draw
    LDA #$07
    STA a:Menu_LastPos
    LDA #$d3
    STA Temp_Int24
    LDA #$88
    STA Temp_Int24.M
    LDX #$00
    STX a:ShopItems
    INX
    STX a:ShopItems_1_
    INX
    STX a:ShopItems_2_
    INX
    STX a:ShopItems_3_
    INX
    STX a:ShopItems_4_
    INX
    STX a:ShopItems_5_
    INX
    STX a:ShopItems_6_
    JSR Shop_DrawItemStrings
    LDA a:TextBox_X
    CLC
    ADC #$0b
    STA TextBox_TextX
    LDA a:TextBox_Y
    CLC
    ADC #$02
    STA TextBox_TextY
    JSR #$f804
    LDA a:PlayerTitle
    JSR #$f78c
    TAY
    LDA #$43
    STA Temp_Int24
    LDA #$89
    STA Temp_Int24.M
    JSR Strings_Draw
    INC TextBox_TextY
    INC TextBox_TextY
    LDA a:NextPlayerTitle
    CMP #$0f
    BCS @LAB_PRG12__8de3

    ;
    ; Look up the experience in the lookup table in bank 15.
    ;
    ; Note that we're starting our offset 2 bytes before the
    ; lookup table. This is because our X will actually be a
    ; 1-based index, normalized to 0-based in the lookup table.
    ; Each entry is a word.
    ;
    ASL A
    TAX
    LDA #$f749,X
    STA Temp_Int24
    LDA #$f74a,X
    STA Temp_Int24.M
    LDA #$00
    STA Temp_Int24.U
    LDY #$05
    JSR #$fa03

  @LAB_PRG12__8de3:                         ; [$8de3]
    LDX #$00

  @LAB_PRG12__8de5:                         ; [$8de5]
    TXA
    PHA
    INC TextBox_TextY
    INC TextBox_TextY
    LDA SelectedWeapon,X
    BMI @LAB_PRG12__8e0f
    LDA a:TextBox_X
    CLC
    ADC #$09
    STA TextBox_TextX
    TXA
    JSR #$f78b
    ORA SelectedWeapon,X
    PHA
    DEC TextBox_TextY
    JSR Maybe_DrawItemName
    INC TextBox_TextY
    INC TextBox_TextX
    INC TextBox_TextX
    PLA
    JSR Maybe_DrawItemTitle

  @LAB_PRG12__8e0f:                         ; [$8e0f]
    PLA
    TAX
    INX
    CPX #$04
    BNE @LAB_PRG12__8de5
    LDA a:TextBox_X
    CLC
    ADC #$09
    STA TextBox_TextX
    INC TextBox_TextY
    LDX #$00
    LDA a:SpecialItems

  @LAB_PRG12__8e25:                         ; [$8e25]
    ASL A
    BCC @LAB_PRG12__8e38
    PHA
    TXA
    PHA
    LDA #$8e63,X
    INX
    INX
    INX
    INX
    JSR Maybe_DrawItemName
    PLA
    TAX
    PLA

  @LAB_PRG12__8e38:                         ; [$8e38]
    INC TextBox_TextX
    INC TextBox_TextX
    INX
    CPX #$08
    BNE @LAB_PRG12__8e25

  @LAB_PRG12__8e41:                         ; [$8e41]
    JSR #$ca25
    JSR #$cb47
    LDA Joy1_ChangedButtonMask
    ASL A
    BPL @LAB_PRG12__8e41
    LDA #$02
    STA a:TextBox_X
    LDA #$06
    STA a:TextBox_Y
    LDA #$1c
    STA a:TextBox_Width
    LDA #$12
    STA a:TextBox_Height
    JMP Maybe_Draw_Textbox

;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;
BYTE_ARRAY_PRG12__8e63:                     ; [$8e63]
    db $80                                  ; [0]:
    db $81                                  ; [1]:
    db $82                                  ; [2]:
    db $83                                  ; [3]:
    db $92                                  ; [4]:
    db $8a                                  ; [5]:
    db $93                                  ; [6]:
    db $94                                  ; [7]:


;============================================================================
; TODO: Document Shop_DrawItemStrings
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PlayerMenu_Maybe_ShowStatus
;     UI_ShowPlayerMenu
;============================================================================
Shop_DrawItemStrings:                       ; [$8e6b]
    LDA a:TextBox_X
    CLC
    ADC #$02
    STA TextBox_TextX
    LDA a:TextBox_Y
    CLC
    ADC #$02
    STA TextBox_TextY
    JSR #$f804
    LDX #$00

  @LAB_PRG12__8e80:                         ; [$8e80]
    TXA
    PHA
    LDA ShopItems,X
    ASL A
    ASL A
    ASL A
    ASL A
    TAY
    JSR Strings_Draw
    LDA #$40
    JSR #$f828
    PLA
    TAX
    INX
    CPX a:Menu_LastPos
    BNE @LAB_PRG12__8e80
    RTS


;============================================================================
; Draw a length-prefixed string to the PPU.
;
; This will draw a string stored in Temp_Int24. The
; first byte must be the length of the string, and the
; remaining are ASCII characters for the string.
;
; INPUTS:
;     X:
;         The PPU buffer offset to write to.
;
;     Y:
;         The starting offset into the loaded string buffer.
;
;     Temp_Int24:
;         The loaded address containing the string at the
;         offset.
;
; OUTPUTS:
;     PPUBuffer_UpperBounds:
;         The new upper bounds of the PPU buffer.
;
;     Temp_Int24:
;         Clobbered.
;
; CALLS:
;     Strings_ASCIIToIndex
;     PPUBuffer_Set
;     PPUBuffer_QueueCommandOrLength
;
; XREFS:
;     Maybe_DrawItemTitle
;     PlayerMenu_Maybe_ShowStatus
;     Shop_DrawItemStrings
;     UI_ShowPlayerMenu
;============================================================================
Strings_Draw:                               ; [$8e9b]
    ;
    ; Load the length of the string and prepare to draw.
    ;
    LDA (Temp_Int24),Y                      ; Load the length value from the
                                            ; loaded string.
    STA Temp_Int24.U                        ; Store it.
    INY                                     ; Y++ (character offset)
    JSR #$cfdc                              ; Queue drawing up to the length.

    ;
    ; Begin drawing each character.
    ;
  @_drawLoop:                               ; [$8ea3]
    LDA (Temp_Int24),Y                      ; Load the next character.
    JSR Strings_ASCIIToIndex                ; Conver the ASCII value to a
                                            ; tile index.
    INY                                     ; Y++ (character offset)
    JSR #$f845                              ; Set that in the PPU buffer.
    DEC Temp_Int24.U                        ; Decrement loop counter.
    BNE @_drawLoop                          ; If we're not done, loop.
    STX PPUBuffer_UpperBounds               ; Store the new PPU buffer upper
                                            ; bounds.
    RTS


;============================================================================
; Return an alphanumeric/symbol tile index from an ASCII value.
;
; INPUTS:
;     A:
;         The ASCII value to normalize.
;
; OUTPUTS:
;     A:
;         The normalized value.
;
; XREFS:
;     Strings_Draw
;============================================================================
Strings_ASCIIToIndex:                       ; [$8eb3]
    CMP #$20                                ; Is this a space?
    BEQ @_isSpace                           ; If so, jump.
    CMP #$41                                ; Is this >= "A"?
    BCC @_return                            ; If not, return.
    SBC #$31                                ; Convert to an index.
    RTS

  @_isSpace:                                ; [$8ebe]
    LDA #$00                                ; Convert a space to an index of
                                            ; 0.

  @_return:                                 ; [$8ec0]
    RTS


;============================================================================
; TODO: Document IScriptAction_AddItem_Something8EC1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddInventoryItem
;============================================================================
IScriptAction_AddItem_Something8EC1:        ; [$8ec1]
    LDX a:TextBox_X
    INX
    STX TextBox_TextX
    LDX a:TextBox_Y
    INX
    STX TextBox_TextY
    JSR #$f804
    LDX a:TextBox_Height

  @LAB_PRG12__8ed3:                         ; [$8ed3]
    TXA
    PHA
    LDA a:TextBox_Width
    TAY
    SEC
    SBC #$02
    JSR #$cfdc
    LDA #$00
    JSR #$f839
    STX PPUBuffer_UpperBounds
    JSR #$f826
    PLA
    TAX
    DEX
    CPX #$02
    BNE @LAB_PRG12__8ed3
    RTS


;============================================================================
; TODO: Document TextBox_Maybe_Draw
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     OpenTextWindow
;     PlayerMenu_Maybe_ShowStatus
;     Portrait_Show
;     Shop_Draw
;     UI_ShowPlayerMenu
;============================================================================
TextBox_Maybe_Draw:                         ; [$8ef1]
    LDA a:TextBox_X
    STA TextBox_TextX
    LDA a:TextBox_Y
    STA TextBox_TextY
    JSR #$f804
    JSR #$f832
    LDA #$01
    JSR #$f845
    LDA #$02
    JSR #$f839
    LDA #$03
    JSR #$f845
    STX PPUBuffer_UpperBounds
    JSR #$f826
    LDY a:TextBox_Height

  @LAB_PRG12__8f18:                         ; [$8f18]
    TYA
    PHA
    JSR #$f832
    LDA #$04
    JSR #$f845
    LDA #$00
    JSR #$f839
    LDA #$04
    JSR #$f845
    STX PPUBuffer_UpperBounds
    JSR #$f826
    PLA
    TAY
    DEY
    CPY #$02
    BNE @LAB_PRG12__8f18
    JSR #$f832
    LDA #$05
    JSR #$f845
    LDA #$02
    JSR #$f839
    LDA #$06
    JSR #$f845
    STX PPUBuffer_UpperBounds
    LDA #$00
    STA a:Maybe_TextBox_Dismissed


;============================================================================
; TODO: Document Maybe_Draw_Textbox_Something8F51
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Draw_Textbox
;============================================================================
Maybe_Draw_Textbox_Something8F51:           ; [$8f51]
    LDA a:TextBox_X
    LSR A
    STA TextBox_TextX
    LDA a:TextBox_Y
    LSR A
    STA TextBox_TextY
    LDY a:TextBox_Height

  @LAB_PRG12__8f60:                         ; [$8f60]
    TYA
    PHA
    LDA TextBox_TextX
    PHA
    LDY a:TextBox_Width

  @LAB_PRG12__8f68:                         ; [$8f68]
    JSR TextBox_Maybe_GetPalette
    JSR FUN_PRG12__880e
    INC TextBox_TextX
    DEY
    DEY
    BNE @LAB_PRG12__8f68
    PLA
    STA TextBox_TextX
    INC TextBox_TextY
    PLA
    TAY
    DEY
    DEY
    BNE @LAB_PRG12__8f60
    LDA a:TextBox_X
    LSR A
    STA TextBox_TextX
    LDA a:TextBox_Y
    LSR A
    STA TextBox_TextY
    JSR FUN_PRG12__87fe
    TAY
    AND #$3f
    ORA #$c0
    STA PPU_TargetAddr
    LDA ScrollHelp_Screen
    AND #$01
    ASL A
    ASL A
    ORA #$23
    STA PPU_TargetAddr.U
    LDA a:TextBox_X
    LSR A
    LSR A
    STA TextBox_TextX
    LDA a:TextBox_X
    CLC
    ADC a:TextBox_Width
    SEC
    SBC #$01
    LSR A
    LSR A
    SEC
    SBC TextBox_TextX
    STA TextBox_TextX
    INC TextBox_TextX
    LDA a:TextBox_Y
    LSR A
    LSR A
    STA TextBox_TextY
    LDA a:TextBox_Y
    CLC
    ADC a:TextBox_Height
    SEC
    SBC #$01
    LSR A
    LSR A
    SEC
    SBC TextBox_TextY
    STA TextBox_TextY
    INC TextBox_TextY

  @LAB_PRG12__8fd3:                         ; [$8fd3]
    TYA
    PHA
    LDA TextBox_TextX
    STA Temp_Int24
    JSR #$cfdc

  @LAB_PRG12__8fdc:                         ; [$8fdc]
    LDA Something_ValuesToDraw,Y
    INY
    JSR #$f845
    DEC Temp_Int24
    BNE @LAB_PRG12__8fdc
    STX PPUBuffer_UpperBounds
    JSR #$f822
    PLA
    CLC
    ADC #$08
    TAY
    DEC TextBox_TextY
    BNE @LAB_PRG12__8fd3
    RTS


;============================================================================
; TODO: Document TextBox_Maybe_GetPalette
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Maybe_Draw_Textbox_Something8F51
;============================================================================
TextBox_Maybe_GetPalette:                   ; [$8ff6]
    LDA a:Maybe_TextBox_Dismissed
    BEQ @LAB_PRG12__8ffe
    JMP #$f791

  @LAB_PRG12__8ffe:                         ; [$8ffe]
    LDA a:HUD_AttributeDataIndex
    RTS


;============================================================================
; TODO: Document Maybe_Draw_Textbox
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     DEADCODE
;     FUN_PRG12__81fb
;     FUN_PRG12__8bed
;     IScriptAction_ShowSellMenu
;     Maybe_Shop_DrawTextBox
;     PlayerMenu_Maybe_ShowStatus
;     Portrait_Clear
;     UI_ShowPlayerMenu
;============================================================================
Maybe_Draw_Textbox:                         ; [$9002]
    LDA #$01
    STA a:Maybe_TextBox_Dismissed
    JSR Maybe_Draw_Textbox_Something8F51
    LDA a:TextBox_X
    STA TextBox_TextX
    LDA a:TextBox_Y
    STA TextBox_TextY
    JSR #$f804
    LDY a:TextBox_Height

  @LAB_PRG12__901a:                         ; [$901a]
    TYA
    PHA
    LDA TextBox_TextX
    PHA
    LDA a:TextBox_Width
    TAY
    JSR #$cfdc

  @LAB_PRG12__9026:                         ; [$9026]
    JSR #$f7b7
    JSR #$f845
    INC TextBox_TextX
    DEY
    BNE @LAB_PRG12__9026
    STX PPUBuffer_UpperBounds
    PLA
    STA TextBox_TextX
    PLA
    TAY
    INC TextBox_TextY
    JSR #$f826
    DEY
    BNE @LAB_PRG12__901a
    RTS


;============================================================================
; MAYBE DEADCODE
;============================================================================
FUN_PRG12__9041:                            ; [$9041]
    LDA #$05
    STA TextBox_TextX
    JSR #$cfdc

  @LAB_PRG12__9048:                         ; [$9048]
    LDA Something_ValuesToDraw,Y
    INY
    JSR #$f845
    DEC TextBox_TextX
    BNE @LAB_PRG12__9048
    STX PPUBuffer_UpperBounds
    RTS


;============================================================================
; TODO: Document Menu_Draw
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__84ed
;     FUN_PRG12__8b71
;     IScriptAction_ShowBuySellMenu
;     UI_ShowPlayerMenu
;============================================================================
Menu_Draw:                                  ; [$9056]
    LDA Joy1_ChangedButtonMask
    AND #$08
    BNE PasswordScreen_Draw
    LDA Joy1_ChangedButtonMask
    AND #$04
    BEQ FUN_PRG12__9075
    LDX a:Menu_CursorPos
    INX
    CPX a:Menu_LastPos
    BNE FUN_PRG12__906d
    LDX #$00

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG12__906d
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Draw
;============================================================================
FUN_PRG12__906d:                            ; [$906d]
    STX a:Menu_CursorPos
    LDA #$0b
    JSR #$d0e4

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG12__9075
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Draw
;============================================================================
FUN_PRG12__9075:                            ; [$9075]
    JSR TextBox_GetCursorXForTileX1
    ADC #$08
    TAX
    JSR TextBox_GetCursorYForTileY2
    ADC #$10
    STA Temp_Int24
    LDA a:Menu_CursorPos
    JSR #$f78c
    ADC Temp_Int24
    SBC #$20
    TAY
    LDA #$ad
    JMP #$fca7

    ;
    ; XREFS:
    ;     Menu_Draw
    ;
PasswordScreen_Draw:                        ; [$9092]
    LDX a:Menu_CursorPos

  @LAB_PRG12__9095:                         ; [$9095]
    DEX
    BPL FUN_PRG12__906d
    LDX a:Menu_LastPos
    BPL @LAB_PRG12__9095

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document PasswordScreen_Show
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
PasswordScreen_Show:                        ; [$909d]
    JSR #$caf7
    LDA #$10
    STA a:PPUADDR
    LDA #$00
    STA a:PPUADDR
    LDY #$10
    JSR #$fcb2
    JSR #$f3a5
    LDY #$1f

  @LAB_PRG12__90b4:                         ; [$90b4]
    LDA #$9204,Y
    STA CurrentPaletteData,Y
    DEY
    BPL @LAB_PRG12__90b4
    JSR #$d090
    JSR #$fcb9

    ;
    ; Set the position to the first character of the first row of
    ; the password screen. This starts at 0x2128.
    ;
    ; Then draw the field (16 characters).
    ;
    LDA #$21
    STA a:PPUADDR
    LDA #$28
    STA a:PPUADDR
    LDA #$5f
    LDY #$10
    JSR #$fcb2

    ;
    ; Now do the same for the second row of the password input at
    ; 0x2148.
    ;
    LDA #$21
    STA a:PPUADDR
    LDA #$48
    STA a:PPUADDR
    LDA #$5f
    LDY #$10
    JSR #$fcb2

    ;
    ; Begin drawing all the available password characters.
    ;
    LDY #$00

    ;
    ; Set the cursor position for the start of the row of
    ; available password characters based on the first two
    ; bytes of the current offset into PASSWORD_INPUT_CHARS.
    ;
  @_startRow:                               ; [$90e7]
    LDA #$9224,Y
    STA a:PPUADDR
    INY
    LDA #$9224,Y
    STA a:PPUADDR
    INY

    ;
    ; Every row has 25 characters (this includes spaces between
    ; visible characters). Loop through each character draw it
    ; on the current row.
    ;
    LDX #$19

  @_writePasswordCharsLoop:                 ; [$90f7]
    LDA #$9224,Y
    STA a:PPUDATA
    INY
    DEX
    BNE @_writePasswordCharsLoop
    CPY #$a2
    BNE @_startRow

    ;
    ; Begin writing the top row: "Enter your mantra."
    ; This starts at PPU position 0x20A5.
    ;
    ; The string is at STRING_ENTER_YOUR_MANTRA.
    ;
    LDA #$20
    STA a:PPUADDR
    LDA #$a5
    STA a:PPUADDR
    LDA #$ec
    STA Temp_Int24
    LDA #$91
    STA Temp_Int24.M
    JSR UI_DrawText

    ;
    ; Set the initial password to 32 characters of empty (0xFF).
    ;
    ; This is in Password_EnteredChars.
    ;
    LDA #$20
    STA a:Password_MaxChars
    TAX
    DEX
    LDA #$ff

  @LAB_PRG12__9123:                         ; [$9123]
    STA ScreenBuffer,X
    DEX
    BPL @LAB_PRG12__9123
    LDA #$00
    STA a:Password_EnteredCharsLength
    STA a:Password_FieldCursorPos
    STA a:Password_CursorCol
    STA a:Password_CursorRow
    STA a:Password_DPadBits
    STA a:Password_CounterBeforeAutoRepeatMove

    ;
    ; Handle password input.
    ;
    JSR #$cb27

  @LAB_PRG12__9140:                         ; [$9140]
    JSR #$ca25
    JSR #$cb4f
    JSR Menu_Something_9405
    BCC @LAB_PRG12__9140
    CMP #$83
    BNE @LAB_PRG12__917b
    LDA a:Password_EnteredCharsLength
    BEQ @_playInputSound
    JSR Password_Maybe_CheckPasswordLength
    BCS PasswordScreen_HandleWrongPasswordAndWaitForInput
    JSR Password_Load
    BCS PasswordScreen_HandleWrongPasswordAndWaitForInput
    RTS


;============================================================================
; TODO: Document PasswordScreen_HandleWrongPasswordAndWaitForInput
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PasswordScreen_Show
;============================================================================
PasswordScreen_HandleWrongPasswordAndWaitForInput: ; [$915f]
    JSR Sound_PlayInputSound

  @_handleWrongPassword:                    ; [$9162]
    JSR #$ca25
    JSR #$cb4f
    JSR PasswordScreen_WriteWrongPassword
    LDA Joy1_ChangedButtonMask
    BPL @_handleWrongPassword
    JSR PasswordScreen_WriteEnterYourMantra
    JMP @LAB_PRG12__9140

  @_playInputSound:                         ; [$9175]
    JSR Sound_PlayInputSound
    JMP @LAB_PRG12__9140

  @LAB_PRG12__917b:                         ; [$917b]
    JSR Menu_Draw_Something9312
    JMP @LAB_PRG12__9140


;============================================================================
; Write the "Enter your mantra" message.
;
; INPUTS:
;     X:
;         Destination offset into the PPU buffer.
;
;     InterruptCounter:
;         The game interrupt counter.
;
;     PASSWORD_MESSAGE_STRINGS_U:
;     PASSWORD_MESSAGE_STRINGS_U:
;         The lookup table of message strings.
;
; OUTPUTS:
;     PPUBuffer_UpperBounds:
;         New upper bounds of the PPU buffer.
;
;     PPU_TargetAddr:
;     #$e9:
;     Temp_Int24:
;     #$ed:
;         Clobbered.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_WriteFromTemp
;
; XREFS:
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;============================================================================
PasswordScreen_WriteEnterYourMantra:        ; [$9181]
    LDY #$02
    BNE PasswordScreen_DrawMessage

    ;
    ; X-- We should never fall through here --X
    ;


;============================================================================
; Write the message stating that the password was wrong.
;
; This will display in a blinking form, alternating between
; empty spaces and the message.
;
; INPUTS:
;     X:
;         Destination offset into the PPU buffer.
;
;     InterruptCounter:
;         The game interrupt counter.
;
;     PASSWORD_MESSAGE_STRINGS_U:
;     PASSWORD_MESSAGE_STRINGS_U:
;         The lookup table of message strings.
;
; OUTPUTS:
;     PPUBuffer_UpperBounds:
;         New upper bounds of the PPU buffer.
;
;     PPU_TargetAddr:
;     #$e9:
;     Temp_Int24:
;     #$ed:
;         Clobbered.
;
; CALLS:
;     PPUBuffer_QueueCommandOrLength
;     PPUBuffer_WriteFromTemp
;
; XREFS:
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;============================================================================
PasswordScreen_WriteWrongPassword:          ; [$9185]
    LDA InterruptCounter                    ; Load the interrupt counter.
    AND #$1f                                ; Check if we're on an animation
                                            ; frame.
    BNE RETURN_91B7                         ; If not, return.

    ;
    ; Calculate the string index based on the frame.
    ;
    LDA InterruptCounter                    ; Load the interrupt counter
                                            ; again.
    LSR A                                   ; Compute a message index based
                                            ; on the interval.
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$01
    TAY                                     ; Y = message string index

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document PasswordScreen_DrawMessage
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PasswordScreen_WriteEnterYourMantra
;============================================================================
PasswordScreen_DrawMessage:                 ; [$9195]
    ;
    ; Load the message string.
    ;
    LDA #$91b8,Y                            ; Load the lower byte of the
                                            ; string address.
    STA Temp_Int24                          ; Store that.
    LDA #$91bb,Y                            ; Load the upper byte of the
                                            ; string address.
    STA Temp_Int24.M                        ; Store that.

    ;
    ; Set the PPU tile address to 0x20A5.
    ;
    LDA #$20
    STA PPU_TargetAddr.U                    ; Upper byte = 0x20
    LDA #$a5
    STA PPU_TargetAddr                      ; Lower byte = 0xA5

    ;
    ; Queue up a string of 23 characters.
    ;
    LDA #$17
    JSR #$cfdc                              ; Queue 23 characters to draw.

    ;
    ; Begin the draw loop.
    ;
    LDY #$00                                ; Y = 0 (loop counter)

  @LAB_PRG12__91ae:                         ; [$91ae]
    JSR #$f842                              ; Put the next character from our
                                            ; loaded string into the PPU
                                            ; buffer.
    CPY #$17                                ; Have we written 23 characters?
    BNE @LAB_PRG12__91ae                    ; If not, loop.
    STX PPUBuffer_UpperBounds               ; Store the new upper bounds of
                                            ; the PPU buffer.

    ;
    ; XREFS:
    ;     PasswordScreen_WriteWrongPassword
    ;
RETURN_91B7:                                ; [$91b7]
    RTS


;============================================================================
; Lookup table for password screen strings.
;============================================================================

;
; XREFS:
;     PasswordScreen_DrawMessage
;
PASSWORD_MESSAGE_STRINGS_L:                 ; [$91b8]
    db $be                                  ; [0]:
    db $d5                                  ; [1]:
    db $ec                                  ; [2]:

;
; XREFS:
;     PasswordScreen_DrawMessage
;
PASSWORD_MESSAGE_STRINGS_U:                 ; [$91bb]
    db $91                                  ; [0]:
    db $91                                  ; [1]:
    db $91                                  ; [2]:


;============================================================================
; String: "Mantra is in the wrong."
;
; This is used whenever an incorrect password was entered.
;============================================================================

;
; XREFS:
;     PASSWORD_MESSAGE_STRINGS_L [$PRG12::91b8]
;
STRING_MANTRA_IN_THE_WRONG:                 ; [$91be]
    db "Mantra is in the"                   ; [$91be] char
    db " wrong."                            ; [$91ce] char


;============================================================================
; String: Empty spaces
;
; This is part of the blink animation for the invalid password text.
;============================================================================

;
; XREFS:
;     PASSWORD_MESSAGE_STRINGS_L [$PRG12::91b9]
;
STRING_PASSWORD_SPACES:                     ; [$91d5]
    db "                "                   ; [$91d5] char
    db "       "                            ; [$91e5] char


;============================================================================
; String: "Enter your mantra."
;
; This is shown at the top of the password screen.
;============================================================================

;
; XREFS:
;     PASSWORD_MESSAGE_STRINGS_L [$PRG12::91ba]
;
STRING_ENTER_YOUR_MANTRA:                   ; [$91ec]
    db "  Enter your man"                   ; [$91ec] char
    db "tra.   ",$00                        ; [$91fc] char


;============================================================================
; Palette data for the password screen.
;============================================================================
PASSWORD_SCREEN_PALETTE:                    ; [$9204]
    db $0f                                  ; [0]:
    db $00                                  ; [1]:
    db $10                                  ; [2]:
    db $20                                  ; [3]:
    db $0f                                  ; [4]:
    db $00                                  ; [5]:
    db $10                                  ; [6]:
    db $20                                  ; [7]:
    db $0f                                  ; [8]:
    db $00                                  ; [9]:
    db $10                                  ; [10]:
    db $20                                  ; [11]:
    db $0f                                  ; [12]:
    db $0f                                  ; [13]:
    db $0f                                  ; [14]:
    db $0f                                  ; [15]:
    db $0f                                  ; [16]:
    db $0f                                  ; [17]:
    db $27                                  ; [18]:
    db $30                                  ; [19]:
    db $0f                                  ; [20]:
    db $06                                  ; [21]:
    db $16                                  ; [22]:
    db $26                                  ; [23]:
    db $0f                                  ; [24]:
    db $06                                  ; [25]:
    db $16                                  ; [26]:
    db $26                                  ; [27]:
    db $0f                                  ; [28]:
    db $0f                                  ; [29]:

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_SCREEN_PALETTE_30_:                ; [$9222]
    db $0f                                  ; [30]:

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_SCREEN_PALETTE_31_:                ; [$9223]
    db $0f                                  ; [31]:


;============================================================================
; Available list of input characters for the password screen, broken down by
; row.
;============================================================================

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_INPUT_CHARS:                       ; [$9224]
    db $21                                  ; [0]: [0]:

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_INPUT_CHARS_0_.ppuAddr_1_:         ; [$9225]
    db $c4                                  ; [0]: [1]:

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_INPUT_CHARS_0_.chars_0_:           ; [$9226]
    db "A"                                  ; [$9226] char

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_INPUT_CHARS_0_.chars_1_:           ; [$9227]
    db " "                                  ; [$9227] char

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_INPUT_CHARS_0_.chars_2_:           ; [$9228]
    db "B"                                  ; [$9228] char

;
; XREFS:
;     PasswordScreen_Show
;
PASSWORD_INPUT_CHARS_0_.chars_3_:           ; [$9229]
    db " C D E F G H I J"                   ; [$9229] char
    db " K L M"                             ; [$9239] char

    db $22                                  ; [1]: [0]:
    db $04                                  ; [1]: [1]:
    db "N O P Q R S T U "                   ; [$9241] char
    db "V W X Y Z"                          ; [$9251] char

    db $22                                  ; [2]: [0]:
    db $44                                  ; [2]: [1]:
    db "a b c d e f g h "                   ; [$925c] char
    db "i j k l m"                          ; [$926c] char

    db $22                                  ; [3]: [0]:
    db $84                                  ; [3]: [1]:
    db "n o p q r s t u "                   ; [$9277] char
    db "v w x y z"                          ; [$9287] char

    db $22                                  ; [4]: [0]:
    db $c4                                  ; [4]: [1]:
    db "0 1 2 3 4 5 6 7 "                   ; [$9292] char
    db "8 9 , ?  "                          ; [$92a2] char

    db $23                                  ; [5]: [0]:
    db $04                                  ; [5]: [1]:
    db "{|} ~|",$7f," DEL END "             ; [$92ad] char
    db "         "                          ; [$92bd] char


;============================================================================
; PPU tile positions for each input character cursor position.
;============================================================================

;
; XREFS:
;     FUN_PRG12__92ed
;
PASSWORD_CURSOR_START_PPU_ADDRS_L:          ; [$92c6]
    db $28                                  ; [0]:
    db $48                                  ; [1]:

;
; XREFS:
;     FUN_PRG12__92ed
;
PASSWORD_CURSOR_START_PPU_ADDRS_U:          ; [$92c8]
    db $21                                  ; [0]:
    db $21                                  ; [1]:


;============================================================================
; TODO: Document PasswordScreen_Maybe_DrawChar
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Something_9405
;============================================================================
PasswordScreen_Maybe_DrawChar:              ; [$92ca]
    LDA InterruptCounter
    AND #$0f
    BNE RETURN_9311
    LDA InterruptCounter
    AND #$10
    BEQ PasswordScreen_Maybe_WriteCharAtCursor
    LDA #$60
    JMP FUN_PRG12__92ed


;============================================================================
; TODO: Document PasswordScreen_Maybe_WriteCharAtCursor
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Draw_Something9312
;     Menu_Draw_Something9351
;     Menu_Draw_Something9386
;     Menu_Something_93EC
;     PasswordScreen_Maybe_DrawChar
;============================================================================
PasswordScreen_Maybe_WriteCharAtCursor:     ; [$92db]
    LDX a:Password_FieldCursorPos
    LDA ScreenBuffer,X
    CMP #$ff
    BEQ @LAB_PRG12__92eb
    TAX
    LDA #$8764,X
    BPL FUN_PRG12__92ed

  @LAB_PRG12__92eb:                         ; [$92eb]
    LDA #$5f

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG12__92ed
;
; INPUTS:
;     A
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PasswordScreen_Maybe_DrawChar
;     PasswordScreen_Maybe_WriteCharAtCursor
;============================================================================
FUN_PRG12__92ed:                            ; [$92ed]
    PHA
    LDA a:Password_FieldCursorPos
    LSR A
    LSR A
    LSR A
    LSR A
    TAY
    LDA #$92c8,Y
    STA PPU_TargetAddr.U
    LDA a:Password_FieldCursorPos
    AND #$0f
    CLC
    ADC #$92c6,Y
    STA PPU_TargetAddr
    LDA #$01
    JSR #$cfdc
    PLA
    JSR #$f845
    STX PPUBuffer_UpperBounds

    ;
    ; XREFS:
    ;     PasswordScreen_Maybe_DrawChar
    ;
RETURN_9311:                                ; [$9311]
    RTS


;============================================================================
; TODO: Document Menu_Draw_Something9312
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;============================================================================
Menu_Draw_Something9312:                    ; [$9312]
    TAX
    BMI Menu_Draw_Something9351
    LDX a:Password_FieldCursorPos
    STA ScreenBuffer,X
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    LDX a:Password_FieldCursorPos
    INX
    CPX a:Password_MaxChars
    BEQ @LAB_PRG12__9336
    DEX
    CPX a:Password_EnteredCharsLength
    BNE @LAB_PRG12__9330
    INC a:Password_EnteredCharsLength

  @LAB_PRG12__9330:                         ; [$9330]
    INC a:Password_FieldCursorPos
    JMP PasswordScreen_Maybe_WriteCharAtCursor

  @LAB_PRG12__9336:                         ; [$9336]
    STX a:Password_EnteredCharsLength
    LDA #$00
    STA a:Password_FieldCursorPos
    JMP PasswordScreen_Maybe_WriteCharAtCursor


;============================================================================
; Play the Character Input sound.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     Sound_PlayEffect
;
; XREFS:
;     Menu_Draw_Something9386
;     PasswordScreen_HandleWrongPasswordAndWaitForInput
;============================================================================
Sound_PlayInputSound:                       ; [$9341]
    PHA
    LDA #$0d
    JSR #$d0e4
    PLA
    RTS


;============================================================================
; Play the Move Cursor sound.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     None
;
; CALLS:
;     Sound_PlayEffect
;
; XREFS:
;     Maybe_Password_CursorHandler
;============================================================================
Sound_PlayMoveCursorSound:                  ; [$9349]
    PHA
    LDA #$0b
    JSR #$d0e4
    PLA

    ;
    ; XREFS:
    ;     Menu_Draw_Something9351
    ;
RETURN_9350:                                ; [$9350]
    RTS


;============================================================================
; TODO: Document Menu_Draw_Something9351
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Draw_Something9312
;============================================================================
Menu_Draw_Something9351:                    ; [$9351]
    CMP #$81
    BEQ @_is0x81
    CMP #$80
    BEQ Menu_Draw_Something9386
    CMP #$82
    BNE RETURN_9350
    JMP Menu_Draw_Something93B4

  @_is0x81:                                 ; [$9360]
    LDA a:Password_EnteredCharsLength
    BEQ Call_Sound_PlayInputSound
    LDX a:Password_FieldCursorPos
    BNE @_writeFirstChar
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    LDA a:Password_EnteredCharsLength
    STA a:Password_FieldCursorPos
    CMP a:Password_MaxChars
    BNE @_writeSecondChar
    DEC a:Password_FieldCursorPos
    BNE @_writeSecondChar

  @_writeFirstChar:                         ; [$937d]
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    DEC a:Password_FieldCursorPos

  @_writeSecondChar:                        ; [$9383]
    JMP PasswordScreen_Maybe_WriteCharAtCursor


;============================================================================
; TODO: Document Menu_Draw_Something9386
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Draw_Something9351
;============================================================================
Menu_Draw_Something9386:                    ; [$9386]
    LDA a:Password_EnteredCharsLength
    BEQ Call_Sound_PlayInputSound
    LDX a:Password_FieldCursorPos
    CPX a:Password_EnteredCharsLength
    BEQ @LAB_PRG12__939e
    INX
    CPX a:Password_EnteredCharsLength
    BNE @LAB_PRG12__93a8
    CPX a:Password_MaxChars
    BNE @LAB_PRG12__93a8

  @LAB_PRG12__939e:                         ; [$939e]
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    LDA #$00
    STA a:Password_FieldCursorPos
    BEQ @LAB_PRG12__93ae

  @LAB_PRG12__93a8:                         ; [$93a8]
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    INC a:Password_FieldCursorPos

  @LAB_PRG12__93ae:                         ; [$93ae]
    JMP PasswordScreen_Maybe_WriteCharAtCursor

    ;
    ; XREFS:
    ;     Menu_Draw_Something9351
    ;     Menu_Draw_Something9386
    ;     Menu_Something_93EC
    ;
Call_Sound_PlayInputSound:                  ; [$93b1]
    JMP Sound_PlayInputSound

    ;
    ; XREFS:
    ;     Menu_Draw_Something9351
    ;
Menu_Draw_Something93B4:                    ; [$93b4]
    LDA a:Password_FieldCursorPos
    CMP a:Password_EnteredCharsLength
    BEQ Menu_Something_93EC
    PHA

  @LAB_PRG12__93bd:                         ; [$93bd]
    LDX a:Password_FieldCursorPos
    INX
    CPX a:Password_EnteredCharsLength
    BEQ @LAB_PRG12__93d7
    LDX a:Password_FieldCursorPos
    LDA #$0601,X
    STA ScreenBuffer,X
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    INC a:Password_FieldCursorPos
    BNE @LAB_PRG12__93bd

  @LAB_PRG12__93d7:                         ; [$93d7]
    LDX a:Password_FieldCursorPos
    LDA #$ff
    STA ScreenBuffer,X
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    DEC a:Password_EnteredCharsLength
    PLA
    STA a:Password_FieldCursorPos
    JMP PasswordScreen_Maybe_WriteCharAtCursor


;============================================================================
; TODO: Document Menu_Something_93EC
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
Menu_Something_93EC:                        ; [$93ec]
    LDX a:Password_FieldCursorPos
    BEQ Call_Sound_PlayInputSound
    JSR PasswordScreen_Maybe_WriteCharAtCursor
    DEC a:Password_FieldCursorPos
    DEC a:Password_EnteredCharsLength
    LDX a:Password_FieldCursorPos
    LDA #$ff
    STA ScreenBuffer,X
    JMP PasswordScreen_Maybe_WriteCharAtCursor


;============================================================================
; TODO: Document Menu_Something_9405
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     PasswordScreen_Show
;============================================================================
Menu_Something_9405:                        ; [$9405]
    JSR PasswordScreen_Maybe_DrawChar
    JSR Maybe_Password_CursorHandler
    JSR Menu_Something_954F
    LDA Joy1_ChangedButtonMask
    BMI @LAB_PRG12__9416

    ;
    ; Return whether the "A" button was pressed.
    ;
    ASL A
    BMI @LAB_PRG12__9422
    RTS

  @LAB_PRG12__9416:                         ; [$9416]
    PHA
    LDA #$0e
    JSR #$d0e4
    PLA
    JSR Password_IsCursorWrapping
    SEC
    RTS

  @LAB_PRG12__9422:                         ; [$9422]
    LDA #$81
    SEC
    RTS


;============================================================================
; TODO: Document Password_IsCursorWrapping
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     Maybe_Password_CursorHandler
;     Menu_Something_9405
;============================================================================
Password_IsCursorWrapping:                  ; [$9426]
    ;
    ; Calculate an offset into
    ; PASSWORD_VALUES_FOR_CURSOR_POS.
    ;
    LDA a:Password_CursorRow
    ASL A
    ADC a:Password_CursorRow
    ASL A
    ASL A
    ADC a:Password_CursorRow
    ADC a:Password_CursorCol

    ;
    ; Load the value from that entry in the table.
    ;
    TAX
    LDA #$943c,X

    ;
    ; See if that is 0xFF, which maps to values like DEL, END,
    ; arrows. If so, the result is false.
    ;
    CMP #$ff
    RTS

;
; XREFS:
;     Password_IsCursorWrapping
;
PASSWORD_VALUES_FOR_CURSOR_POS:             ; [$943c]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $03                                  ; [3]:
    db $04                                  ; [4]:
    db $05                                  ; [5]:
    db $06                                  ; [6]:
    db $07                                  ; [7]:
    db $08                                  ; [8]:
    db $09                                  ; [9]:
    db $0a                                  ; [10]:
    db $0b                                  ; [11]:
    db $0c                                  ; [12]:
    db $0d                                  ; [13]:
    db $0e                                  ; [14]:
    db $0f                                  ; [15]:
    db $10                                  ; [16]:
    db $11                                  ; [17]:
    db $12                                  ; [18]:
    db $13                                  ; [19]:
    db $14                                  ; [20]:
    db $15                                  ; [21]:
    db $16                                  ; [22]:
    db $17                                  ; [23]:
    db $18                                  ; [24]:
    db $19                                  ; [25]:
    db $1a                                  ; [26]:
    db $1b                                  ; [27]:
    db $1c                                  ; [28]:
    db $1d                                  ; [29]:
    db $1e                                  ; [30]:
    db $1f                                  ; [31]:
    db $20                                  ; [32]:
    db $21                                  ; [33]:
    db $22                                  ; [34]:
    db $23                                  ; [35]:
    db $24                                  ; [36]:
    db $25                                  ; [37]:
    db $26                                  ; [38]:
    db $27                                  ; [39]:
    db $28                                  ; [40]:
    db $29                                  ; [41]:
    db $2a                                  ; [42]:
    db $2b                                  ; [43]:
    db $2c                                  ; [44]:
    db $2d                                  ; [45]:
    db $2e                                  ; [46]:
    db $2f                                  ; [47]:
    db $30                                  ; [48]:
    db $31                                  ; [49]:
    db $32                                  ; [50]:
    db $33                                  ; [51]:
    db $34                                  ; [52]:
    db $35                                  ; [53]:
    db $36                                  ; [54]:
    db $37                                  ; [55]:
    db $38                                  ; [56]:
    db $39                                  ; [57]:
    db $3a                                  ; [58]:
    db $3b                                  ; [59]:
    db $3c                                  ; [60]:
    db $3d                                  ; [61]:
    db $3e                                  ; [62]:
    db $3f                                  ; [63]:
    db $ff                                  ; [64]:
    db $80                                  ; [65]:
    db $81                                  ; [66]:
    db $82                                  ; [67]:
    db $83                                  ; [68]:
    db $ff                                  ; [69]:
    db $ff                                  ; [70]:
    db $ff                                  ; [71]:
    db $ff                                  ; [72]:
    db $ff                                  ; [73]:
    db $ff                                  ; [74]:
    db $ff                                  ; [75]:
    db $ff                                  ; [76]:
    db $ff                                  ; [77]:


;============================================================================
; TODO: Document PasswordScreen_GetDPadBits
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     Maybe_Password_CursorHandler
;============================================================================
PasswordScreen_GetDPadBits:                 ; [$948a]
    ;
    ; Check if there have been any changes to the directional
    ; button presses since we were last called.
    ;
    LDA Joy1_ChangedButtonMask
    AND #$0f
    BNE @LAB_PRG12__94b9

    ;
    ; There were no new changes to buttons. Check whether any
    ; directional buttons were already being held down.
    ;
    LDA Joy1_ButtonMask
    AND #$0f
    BEQ @LAB_PRG12__94c2
    CMP a:Password_DPadBits
    BNE @LAB_PRG12__94c2

    ;
    ; A direction key has been held down. We're now going to
    ; begin considering moving in that direction until the
    ; player changes directions or stops holding down the
    ; button.
    ;
    ; Here's how this works:
    ;
    ; 1. This will start at 0 and count up until it gets to 0x29.
    ;
    ; 2. Once it hits that, it will switch to 0x80 and immediately
    ;    return the directional button mask, telling the caller
    ;    it can move one space.
    ;
    ; 3. It will then count up until it hits 0x85. Until it hits
    ;    that, it won't return any directional button masks. This
    ;    serves as a delay between movements.
    ;
    ; 4. Once it hits 0x85, it'll drop back to 0x80 and begin again.
    ;
    LDX a:Password_CounterBeforeAutoRepeatMove
    BPL @LAB_PRG12__94ae
    INC a:Password_CounterBeforeAutoRepeatMove
    INX
    CPX #$86
    BNE @_incCounter

  @LAB_PRG12__94a8:                         ; [$94a8]
    LDX #$80
    STX a:Password_CounterBeforeAutoRepeatMove
    RTS

  @LAB_PRG12__94ae:                         ; [$94ae]
    INC a:Password_CounterBeforeAutoRepeatMove
    INX
    CPX #$2a
    BEQ @LAB_PRG12__94a8

  @_incCounter:                             ; [$94b6]
    LDA #$00
    RTS

    ;
    ; A new direction has been held down. Store it and return it,
    ; moving the cursor.
    ;
  @LAB_PRG12__94b9:                         ; [$94b9]
    STA a:Password_DPadBits
    LDX #$00
    STX a:Password_CounterBeforeAutoRepeatMove
    RTS

    ;
    ; No direction buttons are being pressed, or the direction
    ; has changed. Stop moving the cursor.
    ;
  @LAB_PRG12__94c2:                         ; [$94c2]
    LDA #$00
    STA a:Password_DPadBits
    RTS


;============================================================================
; TODO: Document Maybe_Password_CursorHandler
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Something_9405
;============================================================================
Maybe_Password_CursorHandler:               ; [$94c8]
    JSR PasswordScreen_GetDPadBits

    ;
    ; Only consider the bitmask bits, which shouldn't be
    ; necessary since PasswordScreen_GetDPadBits
    ; already does this.
    ;
    AND #$0f
    BEQ @LAB_PRG12__94f7

    ;
    ; We can move in a direction. Play a sound and figure
    ; out which direction we're moving.
    ;
    JSR Sound_PlayMoveCursorSound

    ;
    ; Move the cursor right, handling wrapping.
    ;
    LSR A
    BCS @_moveRight
    LSR A
    BCS @_moveLeft
    LSR A
    BCS @LAB_PRG12__94f8

  @LAB_PRG12__94db:                         ; [$94db]
    LDX a:Password_CursorRow
    DEX
    BPL @LAB_PRG12__94e8
    JSR Password_NormalizeCursorColForBottomRow
    LDX #$05
    BNE @LAB_PRG12__94ef

  @LAB_PRG12__94e8:                         ; [$94e8]
    CPX #$04
    BNE @LAB_PRG12__94ef
    JSR Maybe_Password_CursorHandler_Something9545

  @LAB_PRG12__94ef:                         ; [$94ef]
    STX a:Password_CursorRow
    JSR Password_IsCursorWrapping
    BCS @LAB_PRG12__94db

  @LAB_PRG12__94f7:                         ; [$94f7]
    RTS

  @LAB_PRG12__94f8:                         ; [$94f8]
    LDX a:Password_CursorRow
    INX
    CPX #$05
    BEQ @LAB_PRG12__9509
    BCC @LAB_PRG12__950c

    ;
    ; We've moved down past the last row. We'll be wrapping.
    ;
    JSR Maybe_Password_CursorHandler_Something9545
    LDX #$00
    BEQ @LAB_PRG12__950c

    ;
    ; We're on the final row, with the arrows, DEL, and END.
    ; We have to ensure the cursor position is a multiple of 2,
    ; since each of these take 2 character positions.
    ;
  @LAB_PRG12__9509:                         ; [$9509]
    JSR Password_NormalizeCursorColForBottomRow

    ;
    ; Save the new row position.
    ;
  @LAB_PRG12__950c:                         ; [$950c]
    STX a:Password_CursorRow

    ;
    ; Keep running this logic while the cursor is wrapping
    ; vertically so we end up with a proper row and column
    ; offset.
    ;
    JSR Password_IsCursorWrapping
    BCS @LAB_PRG12__94f8
    RTS

    ;
    ; Move the cursor left, handling wrapping.
    ;
  @_moveLeft:                               ; [$9515]
    LDX a:Password_CursorCol
    DEX
    BPL @LAB_PRG12__951d

    ;
    ; We're wrapping from the left to the right.
    ;
    LDX #$0c

  @LAB_PRG12__951d:                         ; [$951d]
    STX a:Password_CursorCol
    JSR Password_IsCursorWrapping
    BCS @_moveLeft
    RTS

  @_moveRight:                              ; [$9526]
    LDX a:Password_CursorCol
    INX
    CPX #$0d
    BCC @LAB_PRG12__9530

    ;
    ; We're wrapping from the right to the left.
    ;
    LDX #$00

  @LAB_PRG12__9530:                         ; [$9530]
    STX a:Password_CursorCol
    JSR Password_IsCursorWrapping
    BCS @_moveRight
    RTS


;============================================================================
; Update the cursor column for the bottom row of the password screen.
;
; When the cursor is on the bottom row, the cursor doesn't
; move one step at a time, it moves 2. The reason is that the
; arrows, DEL, and END are all 2 characters.
;
; INPUTS:
;     Password_CursorCol:
;         The current cursor column position.
;
; OUTPUTS:
;     Password_CursorCol:
;         The normalized cursor position.
;
; XREFS:
;     Maybe_Password_CursorHandler
;============================================================================
Password_NormalizeCursorColForBottomRow:    ; [$9539]
    LDA a:Password_CursorCol
    CMP #$08
    BCS RETURN_9544
    LSR A


;============================================================================
; TODO: Document PasswordScreen_SetCusorCol
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Password_CursorHandler_Something9545
;============================================================================
PasswordScreen_SetCusorCol:                 ; [$9541]
    STA a:Password_CursorCol

    ;
    ; XREFS:
    ;     Maybe_Password_CursorHandler_Something9545
    ;     Password_NormalizeCursorColForBottomRow
    ;
RETURN_9544:                                ; [$9544]
    RTS


;============================================================================
; TODO: Document Maybe_Password_CursorHandler_Something9545
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Maybe_Password_CursorHandler
;============================================================================
Maybe_Password_CursorHandler_Something9545: ; [$9545]
    LDA a:Password_CursorCol
    CMP #$04
    BCS RETURN_9544
    ASL A
    BCC PasswordScreen_SetCusorCol

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document Menu_Something_954F
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Menu_Something_9405
;============================================================================
Menu_Something_954F:                        ; [$954f]
    LDA a:Password_CursorCol
    LDX a:Password_CursorRow
    CPX #$05
    BNE @LAB_PRG12__955a
    ASL A

  @LAB_PRG12__955a:                         ; [$955a]
    ASL A
    ASL A
    ASL A
    ASL A
    ADC #$20
    TAX
    LDA a:Password_CursorRow
    ASL A
    ASL A
    ASL A
    ASL A
    ADC #$55
    TAY
    LDA #$e4
    JMP #$fca7


;============================================================================
; Set the starting game state for the player.
;
; This will place them in Eolis, with all basic stats,
; no gold, no experience, no inventory.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     TempleSpawnPoint:
;     PlayerTitle:
;     SpecialItems:
;     Quests:
;     NumberOfWeapons:
;     NumberOfArmors:
;     NumberOfShields:
;     NumberOfMagicSpells:
;     NumberOfItems:
;     NextPlayerTitle:
;     Gold:
;     Gold_M:
;     Gold_U:
;         0
;
;     SelectedWeapon:
;     SelectedArmor:
;     SelectedShield:
;     SelectedMagic:
;     SelectedItem:
;         0xFF
;
; XREFS:
;     Game_ShowStartScreen
;============================================================================
Player_SetStartGameState:                   ; [$9570]
    LDA #$00
    STA a:TempleSpawnPoint
    STA a:PlayerTitle
    STA a:SpecialItems
    STA a:Quests
    LDX #$ff
    STX a:SelectedWeapon
    STA a:SelectedArmor
    STX a:SelectedShield
    STX a:SelectedMagic
    STX a:SelectedItem
    STA a:NumberOfWeapons
    STA a:NumberOfArmors
    STA a:NumberOfShields
    STA a:NumberOfMagicSpells
    STA a:NumberOfItems
    STA a:Experience
    STA a:Experience_U
    STA a:Gold
    STA a:Gold_M
    STA a:Gold_U
    STA a:NextPlayerTitle
    RTS


;============================================================================
; Set the initial experience and gold based on the title.
;
; This will set initial experience and gold for the player
; based on their title. This is used after starting from a
; password.
;
; INPUTS:
;     PlayerTitle:
;         The player's title.
;
;     #$f747:
;         Lookup table for the experience, based on title
;         index.
;
;     #$f765:
;         Lookup table for the gold, based on title index.
;
; OUTPUTS:
;     NextPlayerTitle:
;         The next player title.
;
;     Experience:
;     Experience_U:
;         The player's new starting experience.
;
;     Gold:
;     Gold_M:
;     Gold_U:
;          The player's new starting gold.
;
; XREFS:
;     Game_ShowStartScreen
;============================================================================
Player_SetInitialExpAndGold:                ; [$95b1]
    ;
    ; Set the next player title as the current.
    ;
    LDA a:PlayerTitle                       ; Load the current player title.
    STA a:NextPlayerTitle                   ; Set it as the next.
    BEQ @_isNovice                          ; If it's 0 (Novice), jump.

    ;
    ; Generate an offset into the gold and experience arrays.
    ;
    ASL A                                   ; Multiply by 2 to generate an
                                            ; offset into the lookup tables.
    TAX                                     ; X = A

    ;
    ; Set the player's experience.
    ;
    ; Note that this looks up starting at an offset 2 bytes
    ; *before* the lookup table. This is because this code
    ; is always working with an X starting at 2, which becomes
    ; effectively 0 in the lookup table.
    ;
    ; These tables are in bank 15.
    ;
    LDA #$f747,X                            ; Load the lower byte of
                                            ; experience for the title.
    STA a:Experience                        ; Set it as the player's
                                            ; experience.
    LDA #$f748,X                            ; Load the uper byte of
                                            ; experience for the title.
    STA a:Experience_U                      ; Set it as the player's
                                            ; experience.

    ;
    ; Set the player's gold.
    ;
    ; The same off-by-2 trick is being used for this lookup table.
    ;
    LDA #$f765,X                            ; Load the lower byte of gold.
    STA a:Gold                              ; Set it.
    LDA #$f766,X                            ; Load the middle byte of gold.
    STA a:Gold_M                            ; Set it.
    LDA #$00                                ; Set the upper byte to 0.
    STA a:Gold_U
    RTS

    ;
    ; The player is Novice. Set experience and gold to 0.
    ;
  @_isNovice:                               ; [$95d9]
    STA a:Experience                        ; Set experience to 0.
    STA a:Experience_U
    STA a:Gold                              ; Set gold to 0.
    STA a:Gold_M
    STA a:Gold_U
    RTS


;============================================================================
; Load from the calculated password state.
;
; INPUTS:
;     None
;
; OUTPUTS:
;     NumberOfArmors:
;     NumberOfItems:
;     NumberOfMagicSpells:
;     NumberOfShields:
;     NumberOfWeapons:
;     PlayerTitle:
;     Quests:
;     SelectedArmor:
;     SelectedMagic:
;     SelectedItem:
;     SelectedShield:
;     SelectedWeapon:
;     TempleSpawnPoint:
;     SpecialItems:
;         The new state loaded from the password.
;
;     Password_ByteCounter:
;     Password_BitCounter:
;     #$ee:
;     Maybe_Temp4:
;         Clobbered.
;
; XREFS:
;     PasswordScreen_Show
;============================================================================
Password_Load:                              ; [$95e9]
    LDX #$00
    STX a:Password_ByteCounter
    STX a:Password_BitCounter
    LDY #$0d
    JSR Password_DecodeValue
    LDY #$03
    JSR Password_DecodeValue
    STA a:TempleSpawnPoint
    LDY #$04
    JSR Password_DecodeValue
    STA a:PlayerTitle
    LDY #$08
    JSR Password_DecodeValue
    STA a:SpecialItems
    LDY #$08
    JSR Password_DecodeValue
    STA a:Quests
    LDY #$02
    JSR Password_DecodeValueOrUnset
    STA a:SelectedWeapon
    LDY #$02
    JSR Password_DecodeValueOrUnset
    STA a:SelectedArmor
    LDY #$02
    JSR Password_DecodeValueOrUnset
    STA a:SelectedShield
    LDY #$03
    JSR Password_DecodeValueOrUnset
    STA a:SelectedMagic
    LDY #$05
    JSR Password_DecodeValueOrUnset
    STA a:SelectedItem
    LDA #$9d
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$02
    JSR Password_DecodeValueList
    CMP #$05
    BCS @_returnTrue
    STA a:NumberOfWeapons
    LDA #$a1
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$02
    JSR Password_DecodeValueList
    CMP #$05
    BCS @_returnTrue
    STA a:NumberOfArmors
    LDA #$a5
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$02
    JSR Password_DecodeValueList
    CMP #$05
    BCS @_returnTrue
    STA a:NumberOfShields
    LDA #$a9
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$03
    JSR Password_DecodeValueList
    CMP #$05
    BCS @_returnTrue
    STA a:NumberOfMagicSpells
    LDA #$ad
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$04
    LDX #$05
    JSR Password_DecodeValueList
    CMP #$09
    BCS @_returnTrue
    STA a:NumberOfItems
    CLC
    RTS

  @_returnTrue:                             ; [$96ae]
    SEC
    RTS


;============================================================================
; TODO: Document Password_DecodeValueOrUnset
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     Password_Load
;============================================================================
Password_DecodeValueOrUnset:                ; [$96b0]
    TYA
    PHA
    LDY #$01
    JSR Password_DecodeValue
    LSR A
    PLA
    TAY
    BCC @_returnUnset
    JMP Password_DecodeValue

  @_returnUnset:                            ; [$96bf]
    LDA #$ff
    RTS


;============================================================================
; TODO: Document Password_DecodeValueList
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     Password_Load
;============================================================================
Password_DecodeValueList:                   ; [$96c2]
    STX a:Password_Temp2
    JSR Password_DecodeValue
    STA a:Password_Temp3
    BEQ @_return
    LDY #$00

  @LAB_PRG12__96cf:                         ; [$96cf]
    TYA
    PHA
    LDY a:Password_Temp2
    JSR Password_DecodeValue
    TAX
    PLA
    TAY
    TXA
    STA (#$ee),Y
    INY
    CPY a:Password_Temp3
    BNE @LAB_PRG12__96cf
    TYA

  @_return:                                 ; [$96e4]
    RTS


;============================================================================
; Generate the full password byte state for the game and reset.
;
; This wraps Password_GenerateState and then resets
; counters.
; See that method for details and other outputs.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Password_EncodedState:
;         The resulting computed password state.
;
;     Password_ByteCounter:
;     Password_BitCounter:
;         Internal, and clobbered.
;
; CALLS:
;     Password_GenerateState
;
; XREFS:
;     IScriptAction_ShowPassword
;============================================================================
Password_GenerateStateAndReset:             ; [$96e5]
    JSR Password_GenerateState              ; Generate the password state.

    ;
    ; Reset the state.
    ;
    LDX #$00
    STX a:Password_ByteCounter
    STX a:Password_BitCounter
    RTS


;============================================================================
; TODO: Document Password_GetNext6Bits
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     PasswordScreen_ShowNextChar
;============================================================================
Password_GetNext6Bits:                      ; [$96f1]
    LDY #$06
    JSR Password_DecodeValue
    CLC
    DEC a:Password_6BitCount
    BNE @LAB_PRG12__96fd
    SEC

  @LAB_PRG12__96fd:                         ; [$96fd]
    RTS


;============================================================================
; Generate the full password byte state for the game.
;
; This generates the password state based on the game state,
; prior to building the readable alphanumeric/symbolic
; password.
;
; This is done by encoding an initial but incomplete
; password state, which contains all the saved game
; elements (spawn point, items, weapons, armor, etc.)
; but does not contain some of the initial validation
; state (checksum and a 6-bit-length data counter).
;
; Then it calculates the 6-bit length data counter based
; on that, which will go into the final password.
;
; The state is reset and password state is generated again.
; This time, the first 5 bits of the second byte is
; populated with the 6-bit data counter, following by the
; game state, followed by padding bits to round up to the
; nearest byte.
;
; The checksum is then stored in the first byte.
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     Password_EncodedState:
;         The resulting computed password state.
;
;     Password_ByteCounter:
;     Password_BitCounter:
;     Password_Checksum:
;         Internal, and clobbered.
;
; CALLS:
;     Password_EncodeValue
;     Password_EncodeGameState
;
; XREFS:
;     Password_GenerateStateAndReset
;============================================================================
Password_GenerateState:                     ; [$96fe]
    ;
    ; Reset all the encoding state.
    ;
    LDX #$00
    STX a:Password_ByteCounter
    STX a:Password_BitCounter
    STX a:Password_Checksum
    LDY #$08

    ;
    ; Place 0x00 in the first byte.
    ;
    LDA #$00
    JSR Password_EncodeValue
    LDY #$05

    ;
    ; Place 0x00 in the first 5 bits of the second byte.
    ;
    LDA #$00
    JSR Password_EncodeValue

    ;
    ; Save all the game state into the remaining bits and
    ; progress the checksum.
    ;
    JSR Password_EncodeGameState

    ;
    ; Begin resetting state again for another run, but now using
    ; the calculated values as part of the final state.
    ;
    ; First, generate the total bits placed in the state as:
    ;
    ;     total_bits = total_bytes * 8 + remaining_bits;
    ;
    ;     If total_bytes == 32:  // End of password state
    ;         total_bits--;
    ;
    LDA a:Password_ByteCounter              ; Multiply the current state byte
                                            ; index by 8, and track carry.
    ASL A
    ASL A
    ASL A
    ADC a:Password_BitCounter               ; Add the current bit counter
                                            ; within the final byte - the
                                            ; carry.

    ;
    ; Begin our 6-bit count loop.
    ;
    ; Roughly:
    ;
    ;     result = ceil(total_bits / 6)
    ;
    LDX #$00                                ; X = 0 (Loop counter)

  @_6BitCountLoop:                          ; [$9725]
    INX                                     ; X++
    SEC                                     ; X = 1
    SBC #$06                                ; A -= 6
    BEQ @_resetLoop                         ; If 0, break out of the loop.
    BCS @_6BitCountLoop                     ; Else, loop.

  @_resetLoop:                              ; [$972d]
    STX a:Password_6BitCount                ; X = 6-bit counter

    ;
    ; Reset for a new password generation using the counter.
    ;
    LDX #$00
    STX a:Password_ByteCounter
    STX a:Password_BitCounter
    STX a:Password_Checksum
    LDY #$08

    ;
    ; Encode the blank checksum.
    ;
    LDA #$00
    JSR Password_EncodeValue

    ;
    ; Encode the 6-bit counter.
    ;
    LDY #$05
    LDA a:Password_6BitCount
    JSR Password_EncodeValue

    ;
    ; Encode the game state again.
    ;
    JSR Password_EncodeGameState
    JMP @LAB_PRG12__9757

    ;
    ; Encode a padding bits for any remaining bits.
    ;
  @_fillPaddedBits:                         ; [$9750]
    LDY #$01                                ; Y = 1
    LDA #$00                                ; A = 0
    JSR Password_EncodeValue                ; Encode the padding.

  @LAB_PRG12__9757:                         ; [$9757]
    LDA a:Password_BitCounter               ; A = current bit offset
    BNE @_fillPaddedBits                    ; If not 0, add our padding bit.

    ;
    ; Set the last byte to 0.
    ;
    LDX a:Password_ByteCounter
    LDA #$00
    STA Password_EncodedState,X

    ;
    ; Set the checksum.
    ;
    SEC
    SBC a:Password_Checksum
    STA a:Password_EncodedState
    RTS


;============================================================================
; TODO: Document Password_EncodeGameState
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Password_GenerateState
;============================================================================
Password_EncodeGameState:                   ; [$976c]
    LDA a:TempleSpawnPoint
    LDY #$03
    JSR Password_EncodeValue
    LDA a:PlayerTitle
    LDY #$04
    JSR Password_EncodeValue
    LDA a:SpecialItems
    LDY #$08
    JSR Password_EncodeValue
    LDA a:Quests
    LDY #$08
    JSR Password_EncodeValue
    LDA a:SelectedWeapon
    LDY #$02
    JSR Password_EncodeValueOrUnset
    LDA a:SelectedArmor
    LDY #$02
    JSR Password_EncodeValueOrUnset
    LDA a:SelectedShield
    LDY #$02
    JSR Password_EncodeValueOrUnset
    LDA a:SelectedMagic
    LDY #$03
    JSR Password_EncodeValueOrUnset
    LDA a:SelectedItem
    LDY #$05
    JSR Password_EncodeValueOrUnset

    ;
    ; Set the value to write to the address of 0x39d.
    ;
    LDA #$9d
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$02
    LDA a:NumberOfWeapons
    JSR Password_EncodeValueList

    ;
    ; Set the value to write to the address of 0x3a1.
    ;
    LDA #$a1
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$02
    LDA a:NumberOfArmors
    JSR Password_EncodeValueList

    ;
    ; Set the value to write to the address of 0x3a5.
    ;
    LDA #$a5
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$02
    LDA a:NumberOfShields
    JSR Password_EncodeValueList

    ;
    ; Set the value to write to the address of 0x3a9.
    ;
    LDA #$a9
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$03
    LDX #$03
    LDA a:NumberOfMagicSpells
    JSR Password_EncodeValueList

    ;
    ; Set the value to write to the address of 0x3ad.
    ;
    LDA #$ad
    STA Temp_Int24.U
    LDA #$03
    STA Maybe_Temp4
    LDY #$04
    LDX #$05
    LDA a:NumberOfItems
    JSR Password_EncodeValueList
    RTS


;============================================================================
; TODO: Document Password_EncodeValueOrUnset
;
; INPUTS:
;     A
;     X
;     Y
;
; OUTPUTS:
;     X
;
; XREFS:
;     Password_EncodeGameState
;============================================================================
Password_EncodeValueOrUnset:                ; [$980f]
    CMP #$ff
    BEQ @LAB_PRG12__9823
    PHA
    TYA
    PHA
    LDY #$01
    LDA #$01
    JSR Password_EncodeValue
    PLA
    TAY
    PLA
    JMP Password_EncodeValue

  @LAB_PRG12__9823:                         ; [$9823]
    LDY #$01
    LDA #$00
    JMP Password_EncodeValue


;============================================================================
; TODO: Document Password_EncodeValueList
;
; INPUTS:
;     A
;     X
;     Y
;     Z
;
; OUTPUTS:
;     X
;
; XREFS:
;     Password_EncodeGameState
;============================================================================
Password_EncodeValueList:                   ; [$982a]
    BEQ @_encodeValue                       ; If empty, just encode the value
                                            ; directly.

    ;
    ; Store A, X, and Y so we can work with these variables.
    ;
    STA a:Password_Temp3                    ; Password_Temp3
                                            ; = A
    STY a:Password_Temp1                    ; Password_Temp1
                                            ; = Y
    STX a:Password_Temp2                    ; Password_Temp2
                                            ; = X

    ;
    ; Encode the number of entries as a value. Roughly:
    ;
    ; Password_EncodeValue(numEntries, startOffset, numBits)
    ;
    JSR Password_EncodeValue                ; Encode that value.

    ;
    ; Prepare for the loop.
    ;
    ; Y is our counter.
    ; Password_Temp3 is our upper bounds.
    ;
    LDY #$00                                ; Y = 0 (loop counter)

  @_loop:                                   ; [$983a]
    TYA                                     ; A = Y
    PHA                                     ; Push A to stack

    ;
    ; Encode a value from the list. Roughly:
    ;
    ; Password_EncodeValue(entryList[Y], X, numBits)
    ;
    LDA (#$ee),Y                            ; A = value at bits offset
    LDY a:Password_Temp2                    ; Y =
                                            ; Password_Temp2
                                            ; (num bits)
    JSR Password_EncodeValue                ; Encode this value.

    ;
    ; We're done encoding. See if we've reached the end
    ; of the encoding loop.
    ;
    PLA                                     ; Pop A from stack
    TAY                                     ; Y = A
    INY                                     ; Y++
    CPY a:Password_Temp3                    ; If Y !=
                                            ; Password_Temp3
                                            ; ...
    BNE @_loop                              ; ... Loop.
    RTS

  @_encodeValue:                            ; [$984d]
    JMP Password_EncodeValue


;============================================================================
; TODO: Document Password_Maybe_CheckPasswordLength
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     PasswordScreen_Show
;============================================================================
Password_Maybe_CheckPasswordLength:         ; [$9850]
    LDX #$00
    STX a:Password_ByteCounter
    STX a:Password_BitCounter
    STX a:Password_Checksum
    LDY #$06
    LDA ScreenBuffer,X
    JSR Password_EncodeValue
    INX
    LDY #$06
    LDA ScreenBuffer,X
    JSR Password_EncodeValue
    INX
    LDY #$06
    LDA ScreenBuffer,X
    JSR Password_EncodeValue
    INX
    LDA a:Password_EncodedState_1_
    LSR A
    LSR A
    LSR A
    CMP a:Password_EnteredCharsLength
    BNE @_returnTrue

  @LAB_PRG12__9881:                         ; [$9881]
    LDY #$06
    LDA ScreenBuffer,X
    JSR Password_EncodeValue
    INX
    CPX a:Password_EnteredCharsLength
    BNE @LAB_PRG12__9881

  @LAB_PRG12__988f:                         ; [$988f]
    LDA a:Password_BitCounter
    BEQ @LAB_PRG12__989e
    LDY #$01
    LDA #$00
    JSR Password_EncodeValue
    JMP @LAB_PRG12__988f

  @LAB_PRG12__989e:                         ; [$989e]
    LDA a:Password_Checksum
    BNE @_returnTrue
    CLC
    RTS

  @_returnTrue:                             ; [$98a5]
    SEC
    RTS


;============================================================================
; TODO: Document Password_EncodeValue
;
; INPUTS:
;     A
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Password_EncodeGameState
;     Password_EncodeValueList
;     Password_EncodeValueOrUnset
;     Password_GenerateState
;     Password_Maybe_CheckPasswordLength
;============================================================================
Password_EncodeValue:                       ; [$98a7]
    STA Temp_Int24                          ; Temp_Int24 =
                                            ; A (character code value)
    TXA                                     ; A = X (character code offset)
    PHA                                     ; Push A to stack, saving it.

    ;
    ; Determine the number of bits we'll be using as an
    ; offset in our math below.
    ;
    ; This will be 8 - Y.
    ;
    ; If that is > 0, we'll do looped math below to
    ; calculate a source bit offset, storing in Temp_Int24.
    ;
    ; If it's 0, we'll skip the math and keep
    ; Temp_Int24 = A (the character code value).
    ;
    STY Temp_Int24.M                        ; 0xed = Y (number of bits)
    LDA #$08                                ; A = 8 (bits in a byte)
    SEC                                     ; C = 1
    SBC Temp_Int24.M                        ; A = 8 - 0xed - (1 - C)   = 8 -
                                            ; 0xed   = 8 - Y  If overflow, C
                                            ; = 0
    BEQ @_loop2                             ; If A == 0, skip the bit offset
                                            ; math.
    STA Temp_Int24.M                        ; 0xed = A (our loop counter;
                                            ; remaining bits)

    ;
    ; Do:
    ;
    ; Temp_Int24 = Temp_Int24 * (2 to the
    ; power of 0xed)
    ;
    ; Or, rather:
    ;
    ; bitPos = charCode * (2 to the power of (8 - numBits))
    ;
    ; We're effectively taking a 0-based character code (A-Za-z0-9)
    ; into the entered password and we're getting a source bit offset
    ; using increments of (8 - numBits), which for value-to-ASCII
    ; encoding (for example) will be 8 - 6 = 2.
    ;
  @_loop1:                                  ; [$98b6]
    ASL Temp_Int24                          ; Temp_Int24 *=
                                            ; 2 If overflow, C = 1
    DEC Temp_Int24.M                        ; 0xed--
    BNE @_loop1                             ; If 0xed != 0, loop.

    ;
    ; Encode the character.
    ;
  @_loop2:                                  ; [$98bc]
    LDX a:Password_ByteCounter              ; X = index of the character to
                                            ; encode

    ;
    ; Advance our source bit position, multipying by 2 and
    ; OR'ing the carry flag from above.
    ;
    ROL Temp_Int24                          ; Temp_Int24 =
                                            ; Temp_Int24 *
                                            ; 2 | C If overflow, C = 1

    ;
    ; Store a new computed value at the dest offset (X, or
    ; Password_ByteCounter). This will be the stored value * 2,
    ; OR'd with the carry bit from the calculation above.
    ;
    ROL Password_EncodedState,X             ; Dest value = Dest value * 2 | C
                                            ; If overflow, C = 1

    ;
    ; Advance the bit position.
    ;
    ; If we're at the end of the byte, jump to advance
    ; the destination byte position and reset the bit counter.
    ;
    INC a:Password_BitCounter               ; Password_BitCounter++
    LDX a:Password_BitCounter               ; X =
                                            ; Password_BitCounter
    CPX #$08                                ; If X != 8...
    BNE @_nextLoop                          ; ... Jump

    ;
    ; We finished processing the byte. We can now update the
    ; checksum, reset the destination byte, and reset the dest
    ; bit counter.
    ;
    LDX a:Password_ByteCounter              ; X = Computed byte index
    LDA Password_EncodedState,X             ; A = Dest value

    ;
    ; Update the checksum value.
    ;
    ; The checksum is the sum of the character values computed.
    ;
    CLC                                     ; C = 0
    ADC a:Password_Checksum                 ; Password_Checksum
                                            ; += A (dest value) If overflow,
                                            ; C = 1
    STA a:Password_Checksum

    ;
    ; Increment the destination index and reset the bit counter.
    ;
    INC a:Password_ByteCounter
    LDX #$00
    STX a:Password_BitCounter

  @_nextLoop:                               ; [$98e3]
    DEY                                     ; Y--
    BNE @_loop2                             ; If not 0, loop.

    ;
    ; Restore the original value for X. This won't be modified.
    ;
    PLA                                     ; Pull A from stack.
    TAX                                     ; X = A. This is our result.
    RTS


;============================================================================
; TODO: Document Password_DecodeValue
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     A
;
; XREFS:
;     Password_DecodeValueList
;     Password_DecodeValueOrUnset
;     Password_GetNext6Bits
;     Password_Load
;============================================================================
Password_DecodeValue:                       ; [$98e9]
    TXA
    PHA
    LDA #$00

  @LAB_PRG12__98ed:                         ; [$98ed]
    LDX a:Password_ByteCounter
    ASL Password_EncodedState,X
    ROL A
    INC a:Password_BitCounter
    LDX a:Password_BitCounter
    CPX #$08
    BNE @LAB_PRG12__9906
    INC a:Password_ByteCounter
    LDX #$00
    STX a:Password_BitCounter

  @LAB_PRG12__9906:                         ; [$9906]
    DEY
    BNE @LAB_PRG12__98ed
    STA Temp_Int24
    PLA
    TAX
    LDA Temp_Int24
    RTS


;============================================================================
; TODO: Document IScripts_Something_9910
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_Something_81E8
;============================================================================
IScripts_Something_9910:                    ; [$9910]
    JSR #$f44a
    JSR #$f804
    LDY #$40
    JSR #$f5d9
    LDY #$50
    JSR #$f5d9
    LDY #$60
    JSR #$f5d9
    LDY #$70
    JMP #$f5d9


;============================================================================
; TODO: Document IScripts_Something_992A
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     IScriptAction_ShowUnskippableMessage
;============================================================================
IScripts_Something_992A:                    ; [$992a]
    LDA a:MessageID
    BNE @LAB_PRG12__9938
    JSR IScripts_Something_SetXYAndOffset_99be
    LDA Joy1_ChangedButtonMask
    BPL @LAB_PRG12__9947
    SEC
    RTS

  @LAB_PRG12__9938:                         ; [$9938]
    LDA a:TextBox_MessageEnded
    BEQ @LAB_PRG12__9947
    JSR IScripts_Something_SetXYAndOffset_99a1
    LDA Joy1_ChangedButtonMask
    BPL @LAB_PRG12__9947
    JSR Shops_Something_9949

  @LAB_PRG12__9947:                         ; [$9947]
    CLC
    RTS


;============================================================================
; TODO: Document Shops_Something_9949
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__9969
;     IScripts_Something_992A
;     IScripts_Something_9980
;============================================================================
Shops_Something_9949:                       ; [$9949]
    LDA #$00
    STA a:TextBox_MessageEnded
    LDA #$04
    STA a:MaybeUnused_Arg_TextBox_Height
    JMP #$f539


;============================================================================
; TODO: Document Shop_Something_9956
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowMessage
;     IScriptAction_ShowSellMenu
;     Shop_ShowMessage
;============================================================================
Shop_Something_9956:                        ; [$9956]
    LDA a:MessageID
    BNE FUN_PRG12__9969
    JSR IScripts_Something_SetXYAndOffset_99be
    LDA Joy1_ChangedButtonMask
    BMI IScripts_Something_ReturnFalse

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document IScripts_IsBPressed
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     FUN_PRG12__9969
;     IScripts_Something_9980
;============================================================================
IScripts_IsBPressed:                        ; [$9962]
    LDA Joy1_ChangedButtonMask
    ASL A
    ASL A
    LDA #$01
    RTS


;============================================================================
; TODO: Document FUN_PRG12__9969
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     Shop_Something_9956
;============================================================================
FUN_PRG12__9969:                            ; [$9969]
    LDA a:TextBox_MessageEnded
    BEQ IScripts_IsBPressed
    JSR IScripts_Something_SetXYAndOffset_99a1
    LDA Joy1_ChangedButtonMask
    BPL IScripts_IsBPressed
    JSR Shops_Something_9949
    CLC
    LDA #$01
    RTS


;============================================================================
; TODO: Document IScripts_Something_ReturnFalse
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     IScripts_Something_9980
;     Shop_Something_9956
;============================================================================
IScripts_Something_ReturnFalse:             ; [$997c]
    CLC
    LDA #$00
    RTS


;============================================================================
; TODO: Document IScripts_Something_9980
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     C
;
; XREFS:
;     IScriptAction_22
;     IScriptAction_ShowQuestionMessage
;============================================================================
IScripts_Something_9980:                    ; [$9980]
    LDA a:MessageID
    BNE @LAB_PRG12__998e
    JSR IScripts_Something_99DB
    LDA Joy1_ChangedButtonMask
    BMI IScripts_Something_ReturnFalse
    BPL IScripts_IsBPressed

  @LAB_PRG12__998e:                         ; [$998e]
    LDA a:TextBox_MessageEnded
    BEQ IScripts_IsBPressed
    JSR IScripts_Something_SetXYAndOffset_99a1
    LDA Joy1_ChangedButtonMask
    BPL IScripts_IsBPressed
    JSR Shops_Something_9949
    CLC
    LDA #$01

    ;
    ; XREFS:
    ;     IScripts_Something_99DB
    ;     IScripts_Something_SetXYAndOffset_99a1
    ;     IScripts_Something_SetXYAndOffset_99be
    ;
RETURN_99A0:                                ; [$99a0]
    RTS


;============================================================================
; TODO: Document IScripts_Something_SetXYAndOffset_99a1
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     FUN_PRG12__9969
;     IScripts_Something_992A
;     IScripts_Something_9980
;============================================================================
IScripts_Something_SetXYAndOffset_99a1:     ; [$99a1]
    LDA InterruptCounter
    AND #$10
    BEQ RETURN_99A0
    LDA a:TextBox_X
    ASL A
    ASL A
    ASL A
    ADC #$4c
    TAX
    LDA a:TextBox_Y
    ASL A
    ASL A
    ASL A
    ADC #$10
    TAY
    LDA #$e5
    JMP #$fca7


;============================================================================
; TODO: Document IScripts_Something_SetXYAndOffset_99be
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_ShowPassword
;     IScripts_Something_992A
;     Shop_Something_9956
;============================================================================
IScripts_Something_SetXYAndOffset_99be:     ; [$99be]
    LDA InterruptCounter
    AND #$10
    BEQ RETURN_99A0
    LDA a:TextBox_X
    ASL A
    ASL A
    ASL A
    ADC #$8e
    TAX
    LDA a:TextBox_Y
    ASL A
    ASL A
    ASL A
    ADC #$0e
    TAY
    LDA #$e6
    JMP #$fca7


;============================================================================
; TODO: Document IScripts_Something_99DB
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScripts_Something_9980
;============================================================================
IScripts_Something_99DB:                    ; [$99db]
    LDA InterruptCounter
    AND #$10
    BEQ RETURN_99A0
    LDA a:TextBox_X
    ASL A
    ASL A
    ASL A
    ADC #$4c
    TAX
    LDA a:TextBox_Y
    ASL A
    ASL A
    ASL A
    ADC #$10
    TAY
    LDA #$e7
    JMP #$fca7


;============================================================================
; TODO: Document Shop_Draw
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_OpenShop
;     IScriptAction_ShowSellMenu
;============================================================================
Shop_Draw:                                  ; [$99f8]
    LDA #$0a
    STA a:TextBox_X
    LDA #$08
    STA a:TextBox_Y
    LDA #$14
    STA a:TextBox_Width
    LDA #$14
    STA a:TextBox_Height
    JSR TextBox_Maybe_Draw
    LDA a:TextBox_Y
    CLC
    ADC #$02
    STA TextBox_TextY
    LDX #$00
    STX a:Menu_CursorPos

  @LAB_PRG12__9a1c:                         ; [$9a1c]
    TXA
    PHA
    LDA a:TextBox_X
    CLC
    ADC #$02
    STA TextBox_TextX
    TXA
    PHA
    LDA ShopItems,X
    JSR Maybe_DrawItemName
    PLA
    TAX
    LDA ShopItemCostsU,X
    PHA
    LDA ShopItemCostsL,X
    PHA
    LDA a:TextBox_X
    CLC
    ADC #$05
    STA TextBox_TextX
    LDA ShopItems,X
    JSR Maybe_DrawItemTitle
    PLA
    STA Temp_Int24
    PLA
    STA Temp_Int24.M
    LDA #$00
    STA Temp_Int24.U
    LDA a:TextBox_X
    CLC
    ADC #$0d
    STA TextBox_TextX
    INC TextBox_TextY
    LDY #$05
    JSR #$fa26
    INC TextBox_TextY
    PLA
    TAX
    INX
    CPX a:Menu_LastPos
    BNE @LAB_PRG12__9a1c
    RTS


;============================================================================
; TODO: Document Player_RemoveItem
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_ConsumeItem
;     IScriptAction_ShowSellMenu
;     Player_Equip
;============================================================================
Player_RemoveItem:                          ; [$9a6a]
    LDX #$00
    CMP #$80
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$81
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$82
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$83
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$92
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$8a
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$93
    BEQ @LAB_PRG12__9acb
    INX
    CMP #$94
    BEQ @LAB_PRG12__9acb
    STA Temp_Int24.U
    JSR #$f785
    TAX
    LDA NumberOfWeapons,X
    BEQ @_return
    STA Maybe_Temp4
    LDA #$9b29,X
    STA Temp_Int24
    LDA #$9b2e,X
    STA Temp_Int24.M
    LDY #$00
    LDA Temp_Int24.U
    AND #$1f

  @LAB_PRG12__9ab0:                         ; [$9ab0]
    CMP (Temp_Int24),Y
    BEQ @LAB_PRG12__9aba
    INY
    CPY Maybe_Temp4
    BNE @LAB_PRG12__9ab0
    RTS

  @LAB_PRG12__9aba:                         ; [$9aba]
    INY
    CPY Maybe_Temp4
    BEQ @LAB_PRG12__9ac7
    LDA (Temp_Int24),Y
    DEY
    STA (Temp_Int24),Y
    INY
    BNE @LAB_PRG12__9aba

  @LAB_PRG12__9ac7:                         ; [$9ac7]
    DEC NumberOfWeapons,X

  @_return:                                 ; [$9aca]
    RTS

  @LAB_PRG12__9acb:                         ; [$9acb]
    LDA a:SpecialItems
    AND #$9ad5,X
    STA a:SpecialItems
    RTS

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS:       ; [$9ad5]
    db $7f                                  ; [0]: Clear Ring of Elf

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_1_:    ; [$9ad6]
    db $bf                                  ; [1]: Clear Ring of Ruby

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_2_:    ; [$9ad7]
    db $df                                  ; [2]: Clear Ring of Dworf

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_3_:    ; [$9ad8]
    db $ef                                  ; [3]: Clear Demon's Ring

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_4_:    ; [$9ad9]
    db $f7                                  ; [4]: Clear Elixir

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_5_:    ; [$9ada]
    db $fb                                  ; [5]: Clear Magical Rod

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_6_:    ; [$9adb]
    db $fd                                  ; [6]: Clear Pendant

;
; XREFS:
;     Player_RemoveItem
;
SHOP_ITEM_TO_CLEAR_SPECIAL_ITEM_BITS_7_:    ; [$9adc]
    db $fe                                  ; [7]: Clear Black Onyx

SPECIAL_ITEM_IDS:                           ; [$9add]
    db SPECIAL_RING_OF_ELF                  ; [0]:
    db SPECIAL_RING_OF_RUBY                 ; [1]:
    db SPECIAL_RING_OF_DWORF                ; [2]:
    db SPECIAL_DEMONS_RING                  ; [3]:
    db SPECIAL_ELIXIR                       ; [4]:
    db SPECIAL_MAGICAL_ROD                  ; [5]:

;
; XREFS:
;     Player_AddToInventory
;
SPECIAL_ITEM_IDS_6_:                        ; [$9ae3]
    db SPECIAL_PENDANT                      ; [6]:

;
; XREFS:
;     Player_AddToInventory
;
SPECIAL_ITEM_IDS_7_:                        ; [$9ae4]
    db SPECIAL_BLACK_ONYX                   ; [7]:

SPECIAL_ITEM_BITMASKS:                      ; [$9ae5]
    db $80                                  ; [0]:
    db $40                                  ; [1]:
    db $20                                  ; [2]:
    db $10                                  ; [3]:
    db $08                                  ; [4]:
    db $04                                  ; [5]:
    db $02                                  ; [6]:

;
; XREFS:
;     Player_SetSpecialItem
;
BYTE_PRG12__9aec:                           ; [$9aec]
    db $01                                  ; [$9aec] byte


;============================================================================
; TODO: Document Player_SetSpecialItem
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Player_AddToInventory
;============================================================================
Player_SetSpecialItem:                      ; [$9aed]
    LDA a:SpecialItems
    ORA #$9ae5,X
    STA a:SpecialItems
    RTS


;============================================================================
; TODO: Document Player_AddToInventory
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_AddInventoryItem
;     IScriptAction_OpenShop
;     Player_Equip
;============================================================================
Player_AddToInventory:                      ; [$9af7]
    LDX #$07                                ; i = 7; Loop through item bits.

  @_checkSpecialItems:                      ; [$9af9]
    CMP #$9add,X                            ; Check if this is a special,
                                            ; non-consumable item
    BEQ Player_SetSpecialItem               ; If this is a special item...
    DEX                                     ; Next i
    BPL @_checkSpecialItems
    STA Temp_Int24.U
    JSR #$f785                              ; Convert the item ID to a
                                            ; category.
    TAX
    LDA #$9b29,X
    STA Temp_Int24
    LDA #$9b2e,X
    STA Temp_Int24.M

    ;
    ; Check if the maximum has been reached for the inventory category.
    ;
    LDA NumberOfWeapons,X                   ; Load the number of items in the
                                            ; inventory category
    CMP #$847d,X                            ; Check if the max has been hit
    BNE @LAB_PRG12__9b1c
    DEC NumberOfWeapons,X                   ; The max has been hit. Remove
                                            ; one.

  @LAB_PRG12__9b1c:                         ; [$9b1c]
    LDY NumberOfWeapons,X
    LDA Temp_Int24.U
    AND #$1f
    STA (Temp_Int24),Y
    INC NumberOfWeapons,X                   ; Increase the length of the
                                            ; inventory
    RTS


;============================================================================
; Lower nibble lookup table for inventory category addresses
;============================================================================

;
; XREFS:
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Something_ShopCursorInventory
;     UI_ShowPlayerMenu
;
INVENTORY_CATEGORY_L:                       ; [$9b29]
    db $9d                                  ; [0]: Weapons
    db $a1                                  ; [1]: Armor
    db $a5                                  ; [2]: Shields
    db $a9                                  ; [3]: Magic

;
; XREFS:
;     IScriptAction_ShowSellMenu
;
INVENTORY_CATEGORY_L_4_:                    ; [$9b2d]
    db $ad                                  ; [4]: Items


;============================================================================
; Upper nibble lookup table for inventory category addresses
;============================================================================

;
; XREFS:
;     Player_AddToInventory
;     Player_LacksItem
;     Player_RemoveItem
;     Something_ShopCursorInventory
;     UI_ShowPlayerMenu
;
INVENTORY_CATEGORY_U:                       ; [$9b2e]
    db $03                                  ; [0]: Weapons
    db $03                                  ; [1]: Armor
    db $03                                  ; [2]: Shields
    db $03                                  ; [3]: Magic

;
; XREFS:
;     IScriptAction_ShowSellMenu
;
INVENTORY_CATEGORY_U_4_:                    ; [$9b32]
    db $03                                  ; [4]: Special

;
; XREFS:
;     Maybe_DrawItemTitle
;
ITEM_NAME_CATEGORIES_L:                     ; [$9b33]
    db $3d                                  ; [0]:
    db $7d                                  ; [1]:
    db $bd                                  ; [2]:
    db $fd                                  ; [3]:
    db $4d                                  ; [4]:

;
; XREFS:
;     Maybe_DrawItemTitle
;
ITEM_NAME_CATEGORIES_U:                     ; [$9b38]
    db $9b                                  ; [0]:
    db $9b                                  ; [1]:
    db $9b                                  ; [2]:
    db $9b                                  ; [3]:
    db $9c                                  ; [4]:

;
; XREFS:
;     ITEM_NAME_CATEGORIES_L [$PRG12::9b33]
;     ITEM_NAME_CATEGORIES_U [$PRG12::9b38]
;
ITEM_NAMES_WEAPONS:                         ; [$9b3d]
    db $0d,"HAND DAGGER    "                ; [$9b3d] char
    db $0d,"LONG SWORD     "                ; [$9b4d] char
    db $0d,"GIANT BLADE    "                ; [$9b5d] char
    db $0d,"DRAGON SLAYER  "                ; [$9b6d] char

;
; XREFS:
;     ITEM_NAME_CATEGORIES_L [$PRG12::9b34]
;     ITEM_NAME_CATEGORIES_U [$PRG12::9b39]
;
ITEM_NAMES_ARMOR:                           ; [$9b7d]
    db $0d,"LEATHER ARMOR  "                ; [$9b7d] char
    db $0d,"STUDDED MAIL   "                ; [$9b8d] char
    db $0d,"FULL PLATE     "                ; [$9b9d] char
    db $0d,"BATTLE SUIT    "                ; [$9bad] char

;
; XREFS:
;     ITEM_NAME_CATEGORIES_L [$PRG12::9b35]
;     ITEM_NAME_CATEGORIES_U [$PRG12::9b3a]
;
ITEM_NAMES_SHIELDS:                         ; [$9bbd]
    db $0d,"SMALL SHIELD   "                ; [$9bbd] char
    db $0d,"LARGE SHIELD   "                ; [$9bcd] char
    db $0d,"MAGIC SHIELD   "                ; [$9bdd] char
    db $0d,"BATTLE HELMET  "                ; [$9bed] char

;
; XREFS:
;     ITEM_NAME_CATEGORIES_L [$PRG12::9b36]
;     ITEM_NAME_CATEGORIES_U [$PRG12::9b3b]
;
ITEM_NAMES_MAGIC:                           ; [$9bfd]
    db $0d,"DELUGE         "                ; [$9bfd] char
    db $0d,"THUNDER        "                ; [$9c0d] char
    db $0d,"FIRE           "                ; [$9c1d] char
    db $0d,"DEATH          "                ; [$9c2d] char
    db $0d,"TILTE          "                ; [$9c3d] char

;
; XREFS:
;     ITEM_NAME_CATEGORIES_L [$PRG12::9b37]
;     ITEM_NAME_CATEGORIES_U [$PRG12::9b3c]
;
ITEM_NAMES_KEYS:                            ; [$9c4d]
    db $0d,"RING OF ELF    "                ; [$9c4d] char
    db $0d,"RUBY RING      "                ; [$9c5d] char
    db $0d,"RING OF DWORF  "                ; [$9c6d] char
    db $0d,"DEMONS RING    "                ; [$9c7d] char
    db $0d,"KEY A          "                ; [$9c8d] char
    db $0d,"KEY K          "                ; [$9c9d] char
    db $0d,"KEY Q          "                ; [$9cad] char
    db $0d,"KEY J          "                ; [$9cbd] char
    db $0d,"KEY JO         "                ; [$9ccd] char
    db $0d,"MATTOCK        "                ; [$9cdd] char
    db $0d,"ROD            "                ; [$9ced] char
    db $0d,"CRYSTAL        "                ; [$9cfd] char
    db $0d,"LAMP           "                ; [$9d0d] char
    db $0d,"HOUR GLASS     "                ; [$9d1d] char
    db $0d,"BOOK           "                ; [$9d2d] char
    db $0d,"WING BOOTS     "                ; [$9d3d] char
    db $0d,"RED POTION     "                ; [$9d4d] char
    db $0d,"BLACK POTION   "                ; [$9d5d] char
    db $0d,"ELIXIR         "                ; [$9d6d] char
    db $0d,"PENDANT        "                ; [$9d7d] char
    db $0d,"BLACK ONIX     "                ; [$9d8d] char
    db $0d,"FIRE CRYSTAL   "                ; [$9d9d] char
    db $0f                                  ; [0]:
    db $00                                  ; [1]:
    db $10                                  ; [2]:
    db $20                                  ; [3]:
    db $0f                                  ; [4]:
    db $00                                  ; [5]:
    db $10                                  ; [6]:
    db $20                                  ; [7]:
    db $0f                                  ; [8]:
    db $00                                  ; [9]:
    db $10                                  ; [10]:
    db $20                                  ; [11]:
    db $0f                                  ; [12]:
    db $00                                  ; [13]:

;
; XREFS:
;     StartScreen_Draw
;
BYTE_ARRAY_PRG12__9dad_14_:                 ; [$9dbb]
    db $10                                  ; [14]:

;
; XREFS:
;     StartScreen_Draw
;
BYTE_ARRAY_PRG12__9dad_15_:                 ; [$9dbc]
    db $20                                  ; [15]:

TEXT_TILES_START:                           ; [$9dbd]
    db $f2                                  ; [0]: S
    db $f3                                  ; [1]: T
    db $e0                                  ; [2]: A
    db $f1                                  ; [3]: R
    db $f3                                  ; [4]: T
    db $00                                  ; [5]: \0

TEXT_TILES_CONTINUE:                        ; [$9dc3]
    db $e2                                  ; [0]: C
    db $ee                                  ; [1]: O
    db $ed                                  ; [2]: N
    db $f3                                  ; [3]: T
    db $e8                                  ; [4]: I
    db $ed                                  ; [5]: N
    db $f4                                  ; [6]: U
    db $e4                                  ; [7]: E
    db $00                                  ; [8]: \0

TEXT_TILES_COPYRIGHT_1998_HUDSON_SOFT:      ; [$9dcc]
    db $fa                                  ; [0]: (C)
    db $20                                  ; [1]:
    db $d7                                  ; [2]: 1
    db $df                                  ; [3]: 9
    db $de                                  ; [4]: 9
    db $de                                  ; [5]: 8
    db $20                                  ; [6]:
    db $e7                                  ; [7]: H
    db $f4                                  ; [8]: U
    db $e3                                  ; [9]: D
    db $f2                                  ; [10]: S
    db $ee                                  ; [11]: O
    db $ed                                  ; [12]: N
    db $20                                  ; [13]:
    db $f2                                  ; [14]: S
    db $ee                                  ; [15]: O
    db $e5                                  ; [16]: F
    db $f3                                  ; [17]: T
    db $00                                  ; [18]: \0

TEXT_TILES_UNDER_LICENSE_FROM_FALCOM:       ; [$9ddf]
    db $f4                                  ; [0]: U
    db $ed                                  ; [1]: N
    db $e3                                  ; [2]: D
    db $e4                                  ; [3]: E
    db $f1                                  ; [4]: R
    db $20                                  ; [5]:
    db $eb                                  ; [6]: L
    db $e8                                  ; [7]: I
    db $e2                                  ; [8]: C
    db $e4                                  ; [9]: E
    db $ed                                  ; [10]: N
    db $f2                                  ; [11]: S
    db $e4                                  ; [12]: E
    db $20                                  ; [13]:
    db $e5                                  ; [14]: F
    db $f1                                  ; [15]: R
    db $ee                                  ; [16]: O
    db $ec                                  ; [17]: M
    db $20                                  ; [18]:
    db $e5                                  ; [19]: F
    db $e0                                  ; [20]: A
    db $eb                                  ; [21]: L
    db $e2                                  ; [22]: C
    db $ee                                  ; [23]: O
    db $ec                                  ; [24]: M
    db $00                                  ; [25]: \0

TEXT_TILES_LICENSED_TO_NINTENDO:            ; [$9df9]
    db $eb                                  ; [0]: L
    db $e8                                  ; [1]: I
    db $e2                                  ; [2]: C
    db $e4                                  ; [3]: E
    db $ed                                  ; [4]: N
    db $f2                                  ; [5]: S
    db $e4                                  ; [6]: E
    db $e3                                  ; [7]: D
    db $20                                  ; [8]:
    db $f3                                  ; [9]: T
    db $ee                                  ; [10]: O
    db $20                                  ; [11]:
    db $ed                                  ; [12]: N
    db $e8                                  ; [13]: I
    db $ed                                  ; [14]: N
    db $f3                                  ; [15]: T
    db $e4                                  ; [16]: E
    db $ed                                  ; [17]: N
    db $e3                                  ; [18]: D
    db $ee                                  ; [19]: O
    db $00                                  ; [20]: \0


;============================================================================
; TODO: Document UI_DrawText
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     PasswordScreen_Show
;     StartScreen_Draw
;============================================================================
UI_DrawText:                                ; [$9e0e]
    LDY #$00

  @LAB_PRG12__9e10:                         ; [$9e10]
    LDA (Temp_Int24),Y
    BEQ @_return
    CMP #$20
    BNE @LAB_PRG12__9e1a
    LDA #$00

  @LAB_PRG12__9e1a:                         ; [$9e1a]
    STA a:PPUDATA
    INY
    BNE @LAB_PRG12__9e10

  @_return:                                 ; [$9e20]
    RTS


;============================================================================
; TODO: Document StartScreen_Draw
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
StartScreen_Draw:                           ; [$9e21]
    JSR #$caf7

    ;
    ; Write 224 Faxanadu logo tiles
    ;
    ; From: CHR ROM: Bank 10, 0x8E00: CHR_FAXANADU_LOGO
    ; To:   CHR RAM: 0x1000
    ;
    LDA #$00
    STA IScriptOrCHRAddr
    LDA #$8e
    STA IScriptOrCHRAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDA #$10
    STA PPU_TargetAddr.U
    LDX #$0a
    LDY #$e0
    JSR #$f89e

    ;
    ; Write 27 letter tiles:
    ;
    ; From: CHR ROM: Bank 10, 0x8240: CHR_LETTERS
    ; To:   CHR RAM: 0x1E00
    ;
    LDA #$40
    STA IScriptOrCHRAddr
    LDA #$82
    STA IScriptOrCHRAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDA #$1e
    STA PPU_TargetAddr.U
    LDX #$0a
    LDY #$1b
    JSR #$f89e

    ;
    ; Write 10 number tiles:
    ;
    ; From: CHR ROM: Bank 10, 0x8440: CHR_NUMBERS
    ; To:   CHR RAM: 0x1D60
    ;
    LDA #$40
    STA IScriptOrCHRAddr
    LDA #$84
    STA IScriptOrCHRAddr.U
    LDA #$60
    STA PPU_TargetAddr
    LDA #$1d
    STA PPU_TargetAddr.U
    LDX #$0a
    LDY #$0a
    JSR #$f89e
    JSR #$fcb9

    ;
    ; Write 4 attribute values
    ;
    ; From: Bank 10, 0x9B60: PRG10:9B60
    ; To:   Attribute table: 0x23C0
    ;
    LDA #$60
    STA IScriptOrCHRAddr
    LDA #$9b
    STA IScriptOrCHRAddr.U
    LDA #$c0
    STA PPU_TargetAddr
    LDA #$23
    STA PPU_TargetAddr.U
    LDX #$0a
    LDY #$04
    JSR #$f89e

    ;
    ; Set to top-left of bordered Faxanadu logo (0x2042) and draw
    ; the tiles.
    ;
    ; Copy from the CHR RAM we populated earlier, drawing from the
    ; bottom row to the top.
    ;
    LDA #$20
    STA a:PPUADDR
    LDA #$42
    STA a:PPUADDR
    LDA #$00
    STA Temp_Int24
    LDA #$80
    STA Temp_Int24.M
    LDY #$00
    LDA #$10
    STA Temp_Int24.U

  @LAB_PRG12__9e9b:                         ; [$9e9b]
    LDX #$1c

  @LAB_PRG12__9e9d:                         ; [$9e9d]
    LDA (Temp_Int24),Y
    STA a:PPUDATA
    INY
    BNE @LAB_PRG12__9ea7
    INC Temp_Int24.M

  @LAB_PRG12__9ea7:                         ; [$9ea7]
    DEX
    BNE @LAB_PRG12__9e9d
    LDA #$00
    STA a:PPUDATA
    STA a:PPUDATA
    STA a:PPUDATA
    STA a:PPUDATA
    DEC Temp_Int24.U
    BNE @LAB_PRG12__9e9b
    LDA #$00
    STA a:ScreenBuffer_135_

    ;
    ; Set position to the start of "START" (0x2288) and
    ; draw the text tiles.
    ;
    LDA #$22
    STA a:PPUADDR
    LDA #$88
    STA a:PPUADDR
    LDA #$bd
    STA Temp_Int24
    LDA #$9d
    STA Temp_Int24.M
    JSR UI_DrawText

    ;
    ; Set position to the start of "CONTINUE" (0x2290) and
    ; draw the text tiles.
    ;
    LDA #$22
    STA a:PPUADDR
    LDA #$90
    STA a:PPUADDR
    LDA #$c3
    STA Temp_Int24
    LDA #$9d
    STA Temp_Int24.M
    JSR UI_DrawText

    ;
    ; Set position to the start of "(C) 1988 Hudson Soft" (0x22E7)
    ; and draw the text tiles.
    ;
    LDA #$22
    STA a:PPUADDR
    LDA #$e7
    STA a:PPUADDR
    LDA #$cc
    STA Temp_Int24
    LDA #$9d
    STA Temp_Int24.M
    JSR UI_DrawText

    ;
    ; Set position to the start of "Under license from Falcom" (0x2423)
    ; and draw the text tiles.
    ;
    LDA #$23
    STA a:PPUADDR
    LDA #$24
    STA a:PPUADDR
    LDA #$df
    STA Temp_Int24
    LDA #$9d
    STA Temp_Int24.M
    JSR UI_DrawText

    ;
    ; Set position to the start of "Licensed to Nintendo" (0x2366)
    ; and draw the text tiles.
    ;
    LDA #$23
    STA a:PPUADDR
    LDA #$66
    STA a:PPUADDR
    LDA #$f9
    STA Temp_Int24
    LDA #$9d
    STA Temp_Int24.M
    JSR UI_DrawText
    LDA #$10
    JSR #$d03b
    LDX #$0f

  @LAB_PRG12__9f31:                         ; [$9f31]
    LDA #$9dad,X
    STA #$02a3,X
    DEX
    BPL @LAB_PRG12__9f31
    JSR #$d090
    LDA #$01
    STA CurrentMusic
    JMP #$cb27


;============================================================================
; TODO: Document StartScreen_CheckHandleInput
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;============================================================================
StartScreen_CheckHandleInput:               ; [$9f44]
    LDA Joy1_ChangedButtonMask
    AND #$20
    BEQ @LAB_PRG12__9f57
    LDA a:ScreenBuffer_135_
    EOR #$01
    STA a:ScreenBuffer_135_
    LDA #$0b
    JSR #$d0e4

  @LAB_PRG12__9f57:                         ; [$9f57]
    LDY #$00
    LDA a:ScreenBuffer_135_
    BEQ @LAB_PRG12__9f5f
    INY

  @LAB_PRG12__9f5f:                         ; [$9f5f]
    LDX #$9f69,Y
    LDY #$7e
    LDA #$ad
    JMP #$fca7

;
; XREFS:
;     StartScreen_CheckHandleInput
;
BYTE_ARRAY_PRG12__9f69:                     ; [$9f69]
    db $34                                  ; [0]:

;
; XREFS:
;     StartScreen_CheckHandleInput
;
BYTE_ARRAY_PRG12__9f69_1_:                  ; [$9f6a]
    db $74                                  ; [1]:


;============================================================================
; Lower bytes of IScript addresses by entrypoint index.
;============================================================================
ISCRIPT_ADDRS_L:                            ; [$9f6b]
    db $9f                                  ; [0]:
    db $a3                                  ; [1]:
    db $ad                                  ; [2]:
    db $b1                                  ; [3]:
    db $bc                                  ; [4]:
    db $c9                                  ; [5]:
    db $d3                                  ; [6]:
    db $dd                                  ; [7]:
    db $50                                  ; [8]:
    db $ee                                  ; [9]:
    db $f8                                  ; [10]:
    db $a1                                  ; [11]:
    db $fc                                  ; [12]:
    db $7a                                  ; [13]:
    db $5d                                  ; [14]:
    db $02                                  ; [15]:
    db $0b                                  ; [16]:
    db $16                                  ; [17]:
    db $21                                  ; [18]:
    db $2c                                  ; [19]:
    db $37                                  ; [20]:
    db $a2                                  ; [21]:
    db $3b                                  ; [22]:
    db $46                                  ; [23]:
    db $51                                  ; [24]:
    db $8c                                  ; [25]:
    db $0e                                  ; [26]:
    db $55                                  ; [27]:
    db $03                                  ; [28]:
    db $9e                                  ; [29]:
    db $9f                                  ; [30]:

;
; XREFS:
;     IScripts_Begin
;
ISCRIPT_ADDRS_L_31_:                        ; [$9f8a]
    db $9b                                  ; [31]:
    db $57                                  ; [32]:
    db $62                                  ; [33]:
    db $6d                                  ; [34]:
    db $78                                  ; [35]:
    db $8a                                  ; [36]:
    db $9e                                  ; [37]:
    db $ab                                  ; [38]:
    db $c3                                  ; [39]:
    db $b0                                  ; [40]:
    db $0c                                  ; [41]:
    db $b1                                  ; [42]:
    db $20                                  ; [43]:
    db $ae                                  ; [44]:
    db $9f                                  ; [45]:
    db $9f                                  ; [46]:
    db $9f                                  ; [47]:
    db $d9                                  ; [48]:
    db $e4                                  ; [49]:
    db $ef                                  ; [50]:
    db $fa                                  ; [51]:
    db $05                                  ; [52]:
    db $10                                  ; [53]:
    db $1b                                  ; [54]:
    db $26                                  ; [55]:
    db $c0                                  ; [56]:
    db $c2                                  ; [57]:
    db $bb                                  ; [58]:
    db $32                                  ; [59]:
    db $d4                                  ; [60]:
    db $15                                  ; [61]:
    db $9f                                  ; [62]:
    db $9f                                  ; [63]:
    db $31                                  ; [64]:
    db $3c                                  ; [65]:
    db $47                                  ; [66]:
    db $52                                  ; [67]:
    db $66                                  ; [68]:
    db $71                                  ; [69]:
    db $7c                                  ; [70]:
    db $cf                                  ; [71]:
    db $e6                                  ; [72]:
    db $c8                                  ; [73]:
    db $44                                  ; [74]:
    db $68                                  ; [75]:
    db $1e                                  ; [76]:
    db $9f                                  ; [77]:
    db $9f                                  ; [78]:
    db $9f                                  ; [79]:
    db $90                                  ; [80]:
    db $9b                                  ; [81]:
    db $a6                                  ; [82]:
    db $b8                                  ; [83]:
    db $c3                                  ; [84]:
    db $27                                  ; [85]:
    db $de                                  ; [86]:
    db $f8                                  ; [87]:
    db $d5                                  ; [88]:
    db $9f                                  ; [89]:
    db $9f                                  ; [90]:
    db $9f                                  ; [91]:
    db $9f                                  ; [92]:
    db $9f                                  ; [93]:
    db $9f                                  ; [94]:
    db $9f                                  ; [95]:
    db $ce                                  ; [96]:
    db $d9                                  ; [97]:
    db $e4                                  ; [98]:
    db $ef                                  ; [99]:
    db $fa                                  ; [100]:
    db $05                                  ; [101]:
    db $0a                                  ; [102]:
    db $e2                                  ; [103]:
    db $56                                  ; [104]:
    db $3d                                  ; [105]:
    db $9f                                  ; [106]:
    db $9f                                  ; [107]:
    db $9f                                  ; [108]:
    db $9f                                  ; [109]:
    db $9f                                  ; [110]:
    db $9f                                  ; [111]:
    db $10                                  ; [112]:
    db $1b                                  ; [113]:
    db $26                                  ; [114]:
    db $31                                  ; [115]:
    db $3c                                  ; [116]:
    db $1c                                  ; [117]:
    db $ef                                  ; [118]:
    db $68                                  ; [119]:
    db $46                                  ; [120]:
    db $4f                                  ; [121]:
    db $ed                                  ; [122]:
    db $54                                  ; [123]:
    db $58                                  ; [124]:
    db $5c                                  ; [125]:
    db $60                                  ; [126]:
    db $64                                  ; [127]:
    db $68                                  ; [128]:
    db $6c                                  ; [129]:
    db $70                                  ; [130]:
    db $74                                  ; [131]:
    db $78                                  ; [132]:
    db $7c                                  ; [133]:
    db $80                                  ; [134]:
    db $84                                  ; [135]:
    db $88                                  ; [136]:
    db $8c                                  ; [137]:
    db $90                                  ; [138]:
    db $94                                  ; [139]:
    db $98                                  ; [140]:
    db $9c                                  ; [141]:
    db $a0                                  ; [142]:
    db $a4                                  ; [143]:
    db $a8                                  ; [144]:
    db $ac                                  ; [145]:
    db $b0                                  ; [146]:
    db $b4                                  ; [147]:
    db $b8                                  ; [148]:
    db $bc                                  ; [149]:
    db $c0                                  ; [150]:
    db $c4                                  ; [151]:


;============================================================================
; Upper bytes of IScript addresses by entrypoint index.
;============================================================================
ISCRIPT_ADDRS_U:                            ; [$a003]
    db $a0                                  ; [0]:
    db $a0                                  ; [1]:
    db $a0                                  ; [2]:
    db $a0                                  ; [3]:
    db $a0                                  ; [4]:
    db $a0                                  ; [5]:
    db $a0                                  ; [6]:
    db $a0                                  ; [7]:
    db $a3                                  ; [8]:
    db $a0                                  ; [9]:
    db $a0                                  ; [10]:
    db $a4                                  ; [11]:
    db $a4                                  ; [12]:
    db $a3                                  ; [13]:
    db $a3                                  ; [14]:
    db $a1                                  ; [15]:
    db $a1                                  ; [16]:
    db $a1                                  ; [17]:
    db $a1                                  ; [18]:
    db $a1                                  ; [19]:
    db $a1                                  ; [20]:
    db $a5                                  ; [21]:
    db $a1                                  ; [22]:
    db $a1                                  ; [23]:
    db $a1                                  ; [24]:
    db $a3                                  ; [25]:
    db $a5                                  ; [26]:
    db $a1                                  ; [27]:
    db $a6                                  ; [28]:
    db $a3                                  ; [29]:
    db $a0                                  ; [30]:

;
; XREFS:
;     IScripts_Begin
;
ISCRIPT_ADDRS_U_31_:                        ; [$a022]
    db $a0                                  ; [31]:
    db $a1                                  ; [32]:
    db $a1                                  ; [33]:
    db $a1                                  ; [34]:
    db $a1                                  ; [35]:
    db $a1                                  ; [36]:
    db $a1                                  ; [37]:
    db $a1                                  ; [38]:
    db $a1                                  ; [39]:
    db $a3                                  ; [40]:
    db $a6                                  ; [41]:
    db $a5                                  ; [42]:
    db $a5                                  ; [43]:
    db $a4                                  ; [44]:
    db $a0                                  ; [45]:
    db $a0                                  ; [46]:
    db $a0                                  ; [47]:
    db $a1                                  ; [48]:
    db $a1                                  ; [49]:
    db $a1                                  ; [50]:
    db $a1                                  ; [51]:
    db $a2                                  ; [52]:
    db $a2                                  ; [53]:
    db $a2                                  ; [54]:
    db $a2                                  ; [55]:
    db $a5                                  ; [56]:
    db $a3                                  ; [57]:
    db $a4                                  ; [58]:
    db $a5                                  ; [59]:
    db $a3                                  ; [60]:
    db $a6                                  ; [61]:
    db $a0                                  ; [62]:
    db $a0                                  ; [63]:
    db $a2                                  ; [64]:
    db $a2                                  ; [65]:
    db $a2                                  ; [66]:
    db $a2                                  ; [67]:
    db $a2                                  ; [68]:
    db $a2                                  ; [69]:
    db $a2                                  ; [70]:
    db $a5                                  ; [71]:
    db $a3                                  ; [72]:
    db $a4                                  ; [73]:
    db $a5                                  ; [74]:
    db $a3                                  ; [75]:
    db $a6                                  ; [76]:
    db $a0                                  ; [77]:
    db $a0                                  ; [78]:
    db $a0                                  ; [79]:
    db $a2                                  ; [80]:
    db $a2                                  ; [81]:
    db $a2                                  ; [82]:
    db $a2                                  ; [83]:
    db $a2                                  ; [84]:
    db $a6                                  ; [85]:
    db $a5                                  ; [86]:
    db $a3                                  ; [87]:
    db $a4                                  ; [88]:
    db $a0                                  ; [89]:
    db $a0                                  ; [90]:
    db $a0                                  ; [91]:
    db $a0                                  ; [92]:
    db $a0                                  ; [93]:
    db $a0                                  ; [94]:
    db $a0                                  ; [95]:
    db $a2                                  ; [96]:
    db $a2                                  ; [97]:
    db $a2                                  ; [98]:
    db $a2                                  ; [99]:
    db $a2                                  ; [100]:
    db $a3                                  ; [101]:
    db $a4                                  ; [102]:
    db $a4                                  ; [103]:
    db $a5                                  ; [104]:
    db $a6                                  ; [105]:
    db $a0                                  ; [106]:
    db $a0                                  ; [107]:
    db $a0                                  ; [108]:
    db $a0                                  ; [109]:
    db $a0                                  ; [110]:
    db $a0                                  ; [111]:
    db $a3                                  ; [112]:
    db $a3                                  ; [113]:
    db $a3                                  ; [114]:
    db $a3                                  ; [115]:
    db $a3                                  ; [116]:
    db $a4                                  ; [117]:
    db $a4                                  ; [118]:
    db $a5                                  ; [119]:
    db $a6                                  ; [120]:
    db $a6                                  ; [121]:
    db $a5                                  ; [122]:
    db $a6                                  ; [123]:
    db $a6                                  ; [124]:
    db $a6                                  ; [125]:
    db $a6                                  ; [126]:
    db $a6                                  ; [127]:
    db $a6                                  ; [128]:
    db $a6                                  ; [129]:
    db $a6                                  ; [130]:
    db $a6                                  ; [131]:
    db $a6                                  ; [132]:
    db $a6                                  ; [133]:
    db $a6                                  ; [134]:
    db $a6                                  ; [135]:
    db $a6                                  ; [136]:
    db $a6                                  ; [137]:
    db $a6                                  ; [138]:
    db $a6                                  ; [139]:
    db $a6                                  ; [140]:
    db $a6                                  ; [141]:
    db $a6                                  ; [142]:
    db $a6                                  ; [143]:
    db $a6                                  ; [144]:
    db $a6                                  ; [145]:
    db $a6                                  ; [146]:
    db $a6                                  ; [147]:
    db $a6                                  ; [148]:
    db $a6                                  ; [149]:
    db $a6                                  ; [150]:
    db $a6                                  ; [151]:


;============================================================================
; Death screen.
;
; "Don't have negative thoughts. Remember your mantra."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f8a]
;
ISCRIPT_REMEMBER_YOUR_MANTRA:               ; [$a09b]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_REMEMBER_YOUR_MANTRA.
    db MESSAGEID_REMEMBER_YOUR_MANTRA       ; [$a09d] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; The intro message at the start of the game.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f6b]
;     ISCRIPT_ADDRS_L [$PRG12::9f89]
;     ISCRIPT_ADDRS_L [$PRG12::9f98]
;     ISCRIPT_ADDRS_L [$PRG12::9f99]
;     ISCRIPT_ADDRS_L [$PRG12::9f9a]
;     ISCRIPT_ADDRS_L [$PRG12::9fa9]
;     ISCRIPT_ADDRS_L [$PRG12::9faa]
;     ISCRIPT_ADDRS_L [$PRG12::9fb8]
;     ISCRIPT_ADDRS_L [$PRG12::9fb9]
;     ISCRIPT_ADDRS_L [$PRG12::9fba]
;     ISCRIPT_ADDRS_L [$PRG12::9fc4]
;     ISCRIPT_ADDRS_L [$PRG12::9fc5]
;     ISCRIPT_ADDRS_L [$PRG12::9fc6]
;     ISCRIPT_ADDRS_L [$PRG12::9fc7]
;     ISCRIPT_ADDRS_L [$PRG12::9fc8]
;     ISCRIPT_ADDRS_L [$PRG12::9fc9]
;     ISCRIPT_ADDRS_L [$PRG12::9fca]
;     ISCRIPT_ADDRS_L [$PRG12::9fd5]
;     ISCRIPT_ADDRS_L [$PRG12::9fd6]
;     ISCRIPT_ADDRS_L [$PRG12::9fd7]
;     ISCRIPT_ADDRS_L [$PRG12::9fd8]
;     ISCRIPT_ADDRS_L [$PRG12::9fd9]
;     ISCRIPT_ADDRS_L [$PRG12::9fda]
;
ISCRIPT_INTRO:                              ; [$a09f]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic textbox.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_INTRO.
    db MESSAGEID_INTRO                      ; [$a0a1] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Walking man shown when you enter the first town.
;
; If the player has no gold, they'll be told to see
; the king. Otherwise, they're given directions to
; Apolune.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f6c]
;
ISCRIPT_EOLIS_WALKING_MAN_1:                ; [$a0a3]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic textbox.
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has any
                                            ; gold.
    dw $a0aa                                ; If yes, then jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_GO_SEE_KING.
    db MESSAGEID_GO_SEE_KING                ; [$a0a8] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_NPC_FIRST_WALKING_MAN_GO_TO_APOLUNE: ; [$a0aa]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DIRECTIONS_APOLUNE.
    db MESSAGEID_DIRECTIONS_APOLUNE         ; [$a0ab] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; "There is a mark of Jack by the key hole."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f6d]
;
ISCRIPT_MARK_OF_JACK:                       ; [$a0ad]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic textbox.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MARK_OF_JACK.
    db MESSAGEID_MARK_OF_JACK               ; [$a0af] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f6e]
;
ISCRIPT_EOLIS_WALKING_WOMAN_1:              ; [$a0b1]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic textbox.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Elf.
    db SPECIAL_RING_OF_ELF                  ; [$a0b3] InventoryItem
    dw $a0b9                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THIS_IS_EOLIS.
    db MESSAGEID_THIS_IS_EOLIS              ; [$a0b7] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A081_HAS_RING:                  ; [$a0b9]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_LOOK_FOR_RINGS.
    db MESSAGEID_LOOK_FOR_RINGS             ; [$a0ba] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the guru in Eolis.
;
; If the player does not have the Ring of Elf, they will
; be given the ring and told to talk to the King.
;
; If they do have it, they will be told to talk to gurus
; to get a title.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f6f]
;
ISCRIPT_EOLIS_GURU:                         ; [$a0bc]
    db ISCRIPT_ENTITY_GURU                  ; Show the Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Elf.
    db SPECIAL_RING_OF_ELF                  ; [$a0be] InventoryItem
    dw $a0c6                                ; If yes, then jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_TAKE_RING_TO_KING.
    db MESSAGEID_TAKE_RING_TO_KING          ; [$a0c2] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Add the Ring of Elf to the
                                            ; inventory.
    db SPECIAL_RING_OF_ELF                  ; [$a0c4] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_GURU_EOLIS_HAS_RING:            ; [$a0c6]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_VISIT_GURUS_GET_TITLE.
    db MESSAGEID_VISIT_GURUS_GET_TITLE      ; [$a0c7] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f70]
;
ISCRIPT_EOLIS_WALKING_WOMAN_2:              ; [$a0c9]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has any
                                            ; gold.
    dw $a0d0                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_LAST_WELL_ALMOST_DRY.
    db MESSAGEID_LAST_WELL_ALMOST_DRY       ; [$a0ce] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A0C9_HAS_GOLD:                  ; [$a0d0]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THIS_IS_FOREPAW.
    db MESSAGEID_THIS_IS_FOREPAW            ; [$a0d1] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the smoking man in Eolis.
;
; If the player has any gold, they'll be asked if they
; have a weapon.
;
; If they don't have gold, they'll be told that there
; are dwarves here in town.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f71]
;
ISCRIPT_EOLIS_SMOKING_MAN:                  ; [$a0d3]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has any
                                            ; gold.
    dw $a0da                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DWARVES_ARE_HERE.
    db MESSAGEID_DWARVES_ARE_HERE           ; [$a0d8] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_NPC_SMOKING_MAN_HAS_GOLD:       ; [$a0da]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_HAVE_WEAPON.
    db MESSAGEID_DO_YOU_HAVE_WEAPON         ; [$a0db] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the King's guard.
;
; If the player does not have the Ring of Elf, he'll
; say the player can't go in.
;
; If the player does have it, but no gold, he'll say the
; King is waiting.
;
; If they have the ring and gold, he'll wish the player
; luck.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f72]
;
ISCRIPT_EOLIS_KINGS_GUARD:                  ; [$a0dd]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Elf.
    db SPECIAL_RING_OF_ELF                  ; [$a0df] InventoryItem
    dw $a0e5                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_CANT_LET_YOU_GO.
    db MESSAGEID_CANT_LET_YOU_GO            ; [$a0e3] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_KINGS_GUARD_HAS_RING:           ; [$a0e5]
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has any
                                            ; gold.
    dw $a0eb                                ; If yes, then jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_KING_IS_WAITING.
    db MESSAGEID_KING_IS_WAITING            ; [$a0e9] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_KINGS_GUARD_HAS_GOLD:           ; [$a0eb]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_GOOD_LUCK.
    db MESSAGEID_GOOD_LUCK                  ; [$a0ec] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f74]
;
ISCRIPT_A0EE:                               ; [$a0ee]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has any
                                            ; gold.
    dw $a0f5                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DWARVES_ROBBING_ELVES.
    db MESSAGEID_DWARVES_ROBBING_ELVES      ; [$a0f3] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A0EE_HAS_GOLD:                  ; [$a0f5]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_METEORITE_EXPOSITION.
    db MESSAGEID_METEORITE_EXPOSITION       ; [$a0f6] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f75]
;
ISCRIPT_A0F8:                               ; [$a0f8]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has any
                                            ; gold.
    dw $a0ff                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_LISTEN_TO_PEOPLE.
    db MESSAGEID_LISTEN_TO_PEOPLE           ; [$a0fd] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A0F8_HAS_GOLD:                  ; [$a0ff]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD_2.
    db MESSAGEID_DONT_TRY_TOO_HARD_2        ; [$a100] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Eolis Martial Artist.
;
; The player will be offered 40HP for 200G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f7a]
;
ISCRIPT_EOLIS_MARTIAL_ARTIST:               ; [$a102]
    db ISCRIPT_ENTITY_MARTIAL_ARTIST        ; Show a Martial Artist portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_MARTIAL_ARTS_200G.
    db MESSAGEID_MARTIAL_ARTS_200G          ; [$a104] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 200G.
    dw $00c8                                ; [$a106] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 40HP.
    db $28                                  ; [$a109] byte

    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f7b]
;
ISCRIPT_A10B:                               ; [$a10b]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Small Shield.
    db SHIELD_SMALL                         ; [$a10d] InventoryItem
    dw $a113                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WELCOME_TO_APOLUNE.
    db MESSAGEID_WELCOME_TO_APOLUNE         ; [$a111] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A10B_HAS_SMALL_SHIELD:          ; [$a113]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DIRECTIONS_FOREPAW.
    db MESSAGEID_DIRECTIONS_FOREPAW         ; [$a114] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f7c]
;
ISCRIPT_A116:                               ; [$a116]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Small Shield.
    db SHIELD_SMALL                         ; [$a118] InventoryItem
    dw $a11e                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DIRECTIONS_TO_TRUNK.
    db MESSAGEID_DIRECTIONS_TO_TRUNK        ; [$a11c] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A116_HAS_SMALL_SHIELD:          ; [$a11e]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_GOOD_LUCK_2.
    db MESSAGEID_GOOD_LUCK_2                ; [$a11f] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f7d]
;
ISCRIPT_A121:                               ; [$a121]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Small Shield.
    db SHIELD_SMALL                         ; [$a123] InventoryItem
    dw $a129                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_SHOULD_HAVE_SHIELD.
    db MESSAGEID_SHOULD_HAVE_SHIELD         ; [$a127] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A121_HAS_SMALL_SHIELD:          ; [$a129]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MATTOCK_IN_TOWER.
    db MESSAGEID_MATTOCK_IN_TOWER           ; [$a12a] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f7e]
;
ISCRIPT_A12C:                               ; [$a12c]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Small Shield.
    db SHIELD_SMALL                         ; [$a12e] InventoryItem
    dw $a134                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_BLOCKED_PASSAGE.
    db MESSAGEID_BLOCKED_PASSAGE            ; [$a132] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A12C_HAS_SMALL_SHIELD:          ; [$a134]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MATTOCK_BREAKS_WALL.
    db MESSAGEID_MATTOCK_BREAKS_WALL        ; [$a135] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f7f]
;
ISCRIPT_A137:                               ; [$a137]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_YOU_NEED_KEY.
    db MESSAGEID_YOU_NEED_KEY               ; [$a139] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f81]
;
ISCRIPT_A13B:                               ; [$a13b]
    db ISCRIPT_ENTITY_NURSE                 ; [$a13b] IScriptEntity
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Small Shield.
    db SHIELD_SMALL                         ; [$a13d] InventoryItem
    dw $a143                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DOCTOR_CAN_HELP.
    db MESSAGEID_DOCTOR_CAN_HELP            ; [$a141] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A13B_HAS_SMALL_SHIELD:          ; [$a143]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_POISON_IS_BAD.
    db MESSAGEID_POISON_IS_BAD              ; [$a144] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f82]
;
ISCRIPT_A146:                               ; [$a146]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_PLAYER_RANK     ; Check if the player has reached
                                            ; Aspirant yet.
    db RANK_ASPIRANT                        ; [$a148] PlayerTitle
    dw $a14e                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_LEARN_MANTRAS.
    db MESSAGEID_LEARN_MANTRAS              ; [$a14c] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A146_HAS_ASPIRANT:              ; [$a14e]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_SECRET_GURU_IN_TOWER.
    db MESSAGEID_SECRET_GURU_IN_TOWER       ; [$a14f] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f83]
;
ISCRIPT_A151:                               ; [$a151]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_CARRY_ITEMS.
    db MESSAGEID_CARRY_ITEMS                ; [$a153] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; An empty interaction.
;
; This immediately terminates.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f86]
;
ISCRIPT_A155:                               ; [$a155]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f8b]
;
ISCRIPT_FOREPAW_GREETER:                    ; [$a157]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the player has
                                            ; completed the Spring of Trunk
                                            ; quest.
    db QUEST_SPRING_OF_TRUNK                ; [$a159] Quests
    dw $a15f                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WELCOME_TO_FOREPAW.
    db MESSAGEID_WELCOME_TO_FOREPAW         ; [$a15d] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_FOREPAW_GREETER_SPRING_OF_TRUNK_COMPLETE: ; [$a15f]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_FOUNTAIN_WILL_FLOW_TO_TOWN.
    db MESSAGEID_FOUNTAIN_WILL_FLOW_TO_TOWN ; [$a160] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f8c]
;
ISCRIPT_A162:                               ; [$a162]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Ruby.
    db SPECIAL_RING_OF_RUBY                 ; [$a164] InventoryItem
    dw $a16a                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_FIND_3_SPRINGS.
    db MESSAGEID_FIND_3_SPRINGS             ; [$a168] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A162_HAS_RING_OF_RUBY:          ; [$a16a]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_WATER_IS_FLOWING.
    db MESSAGEID_WATER_IS_FLOWING           ; [$a16b] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f8d]
;
ISCRIPT_A16D:                               ; [$a16d]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the player has
                                            ; completed the Spring of Trunk
                                            ; quest.
    db QUEST_SPRING_OF_TRUNK                ; [$a16f] Quests
    dw $a175                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_FOUNTAIN_IN_SKY.
    db MESSAGEID_FOUNTAIN_IN_SKY            ; [$a173] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A175:                           ; [$a175]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_PUSH_FOUNTAIN_ROCK.
    db MESSAGEID_PUSH_FOUNTAIN_ROCK         ; [$a176] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f8e]
;
ISCRIPT_A178:                               ; [$a178]
    db ISCRIPT_ENTITY_NURSE                 ; [$a178] IScriptEntity
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the player has
                                            ; completed the Spring of Trunk
                                            ; quest.
    db QUEST_SPRING_OF_TRUNK                ; [$a17a] Quests
    dw $a180                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_SPRING_IN_TOWER.
    db MESSAGEID_SPRING_IN_TOWER            ; [$a17e] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A178_SPRING_OF_TRUNK_COMPLETED: ; [$a180]
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the player has
                                            ; completed the Spring of Sky
                                            ; quest.
    db QUEST_SPRING_OF_SKY                  ; [$a181] Quests
    dw $a187                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WINGBOOTS_IN_TOWER.
    db MESSAGEID_WINGBOOTS_IN_TOWER         ; [$a185] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A178_SPRING_OF_SKY_COMPLETED:   ; [$a187]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DIRECTIONS_TO_MASCON.
    db MESSAGEID_DIRECTIONS_TO_MASCON       ; [$a188] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f8f]
;
ISCRIPT_A18A:                               ; [$a18a]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the Spring of Sky
                                            ; quest is complete.
    db QUEST_SPRING_OF_SKY                  ; [$a18c] Quests
    dw $a192                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_FOUNTAIN_IN_SKY_HINT.
    db MESSAGEID_FOUNTAIN_IN_SKY_HINT       ; [$a190] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A18A_IS_COMPLETE:               ; [$a192]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Joker key.
    db KEY_JO                               ; [$a193] InventoryItem
    dw $a19b                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_USE_THIS_KEY_FOR_FIRST_SPRING.
    db MESSAGEID_USE_THIS_KEY_FOR_FIRST_SPRING ; [$a197] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Add the Joker key to the
                                            ; inventory.
    db KEY_JO                               ; [$a199] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A192_HAS_JOKER:                 ; [$a19b]
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_GET_JOKER_OR_COME_BACK.
    db MESSAGEID_GET_JOKER_OR_COME_BACK     ; [$a19c] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Spring of Sky man.
;
; He's asleep. Must talk to him twice to wake him up, which
; completes that quest.
;
; With a second interaction, he'll tell you to find a key
; and reach the fountain.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f90]
;
ISCRIPT_SPRING_OF_SKY:                      ; [$a19e]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the Spring of Sky
                                            ; quest is complete.
    db QUEST_SPRING_OF_SKY                  ; [$a1a0] Quests
    dw $a1a8                                ; If it has, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_HO_HO_HO_ZZZ.
    db MESSAGEID_HO_HO_HO_ZZZ               ; [$a1a4] Message
    db ISCRIPT_ACTION_SET_QUEST_COMPLETE    ; Mark the Springs man as woken
                                            ; up.
    db QUEST_SPRING_OF_SKY                  ; [$a1a6] Quests
    db ISCRIPT_ACTION_END                   ; End

  @_ISCRIPT_SPRING_OF_SKY_IS_COMPLETE:      ; [$a1a8]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_GET_KEY_FIND_FOUNTAIN.
    db MESSAGEID_GET_KEY_FIND_FOUNTAIN      ; [$a1a9] Message
    db ISCRIPT_ACTION_END                   ; End


;============================================================================
; Interaction with the Spring of Trunk man.
;
; If the quest was not complete, he'll explain that you
; need the Elixir. If the player already has it, it will
; get consumed and the quest will be complete. Otherwise,
; he'll say to come back with the medicine.
;
; If the quest was already complete, he'll say to find the
; poison in Mascon.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f91]
;
ISCRIPT_SPRING_OF_TRUNK:                    ; [$a1ab]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if the Spring of Trunk
                                            ; quest is complete.
    db QUEST_SPRING_OF_TRUNK                ; [$a1ad] Quests
    dw $a1c0                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Else, show
                                            ; MESSAGE_THIS_IS_SPRING_OF_TRUNK_GET_ELIXIR.
    db MESSAGEID_THIS_IS_SPRING_OF_TRUNK_GET_ELIXIR ; [$a1b1] Message
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Elixir.
    db SPECIAL_ELIXIR                       ; [$a1b3] InventoryItem
    dw $a1b9                                ; If yes, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_COME_BACK_WITH_MEDICINE.
    db MESSAGEID_COME_BACK_WITH_MEDICINE    ; [$a1b7] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_SPRING_OF_TRUNK_HAS_ELIXIR:     ; [$a1b9]
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_2_MORE_SPRINGS.
    db MESSAGEID_2_MORE_SPRINGS             ; [$a1ba] Message
    db ISCRIPT_ACTION_CONSUME_ITEM          ; Consume the player's Elixir.
    db SPECIAL_ELIXIR                       ; [$a1bc] InventoryItem
    db ISCRIPT_ACTION_SET_QUEST_COMPLETE    ; Mark the Spring of Trunk as
                                            ; complete.
    db QUEST_SPRING_OF_TRUNK                ; [$a1be] Quests
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_SPRING_OF_TRUNK_IS_COMPLETE:    ; [$a1c0]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_FIND_POISON_IN_MASCON.
    db MESSAGEID_FIND_POISON_IN_MASCON      ; [$a1c1] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f92]
;
ISCRIPT_A1C3:                               ; [$a1c3]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box
    db ISCRIPT_ACTION_CHECK_QUEST           ; Check if all spring quests are
                                            ; complete.
    db $03                                  ; [$a1c5] Quests
    dw $a1cd                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_WILL_REVIVE_SPRING
    db MESSAGEID_WILL_REVIVE_SPRING         ; [$a1c9] Message
    db ISCRIPT_ACTION_SET_QUEST_COMPLETE    ; Mark all spring quests as
                                            ; complete.
    db $03                                  ; [$a1cb] Quests
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A1C3_COMPLETED_SPRINGS:         ; [$a1cd]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Ruby.
    db SPECIAL_RING_OF_RUBY                 ; [$a1ce] InventoryItem
    dw $a1d6                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_GIVING_RING_OF_RUBY
    db MESSAGEID_GIVING_RING_OF_RUBY        ; [$a1d2] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Give the player the Ring of
                                            ; Ruby.
    db SPECIAL_RING_OF_RUBY                 ; [$a1d4] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A1CD_HAS_RING_OF_RUBY:          ; [$a1d6]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_TRUST_YOUR_POWER
    db MESSAGEID_TRUST_YOUR_POWER           ; [$a1d7] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f9b]
;
ISCRIPT_A1D9:                               ; [$a1d9]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Large Shield.
    db SHIELD_LARGE                         ; [$a1db] InventoryItem
    dw $a1e1                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WELCOME_TO_MASCON
    db MESSAGEID_WELCOME_TO_MASCON          ; [$a1df] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A1D9_HAS_LARGE_SHIELD:          ; [$a1e1]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_PREPARE_BEFORE_FOREPAW.
    db MESSAGEID_PREPARE_BEFORE_FOREPAW     ; [$a1e2] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f9c]
;
ISCRIPT_A1E4:                               ; [$a1e4]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Pendant.
    db SPECIAL_PENDANT                      ; [$a1e6] InventoryItem
    dw $a1ec                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_METEORITE_BECOMES_POISON
    db MESSAGEID_METEORITE_BECOMES_POISON   ; [$a1ea] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A1E4_HAS_PENDANT:               ; [$a1ec]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DID_YOU_GET_PENDANT.
    db MESSAGEID_DID_YOU_GET_PENDANT        ; [$a1ed] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f9d]
;
ISCRIPT_A1EF:                               ; [$a1ef]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Large Shield.
    db SHIELD_LARGE                         ; [$a1f1] InventoryItem
    dw $a1f7                                ; If so, branch.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_STORES_OUTSIDE_TOWN
    db MESSAGEID_STORES_OUTSIDE_TOWN        ; [$a1f5] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A1EF_HAS_SHIELD:                ; [$a1f7]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THIS_IS_LARGE_SHIELD.
    db MESSAGEID_THIS_IS_LARGE_SHIELD       ; [$a1f8] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f9e]
;
ISCRIPT_A1FA:                               ; [$a1fa]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Fire magic.
    db MAGIC_FIRE                           ; [$a1fc] InventoryItem
    dw $a202                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DIRECTIONS_TO_SUFFER.
    db MESSAGEID_DIRECTIONS_TO_SUFFER       ; [$a200] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A1FA_HAS_FIRE:                  ; [$a202]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_NEED_WING_BOOTS_FOR_MIST.
    db MESSAGEID_NEED_WING_BOOTS_FOR_MIST   ; [$a203] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f9f]
;
ISCRIPT_A205:                               ; [$a205]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Fire magic.
    db MAGIC_FIRE                           ; [$a207] InventoryItem
    dw $a20d                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WELCOME_TO_MIST
    db MESSAGEID_WELCOME_TO_MIST            ; [$a20b] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A205_HAS_FIRE:                  ; [$a20d]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_HOUSE_OUTSIDE_ABANDONED.
    db MESSAGEID_HOUSE_OUTSIDE_ABANDONED    ; [$a20e] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with a man sitting in a house in the Mist part of the
; Overworld.
;
; This house is nested in the bottom-right of the
; overworld part of the Mist area.
;
; If the player has the Fire magic, he'll say that it's
; best you keep the pendant. Otherwise, he'll say you'll
; reach the town of Suffer soon.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa0]
;
ISCRIPT_OVERWORLD_MIST_HOUSE_MAN:           ; [$a210]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Pendant.
    db SPECIAL_PENDANT                      ; [$a212] InventoryItem
    dw $a218                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_TOWER_OF_SUFFER_SOON.
    db MESSAGEID_TOWER_OF_SUFFER_SOON       ; [$a216] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_OVERWORLD_MIST_HOUSE_MAN_HAS_PENDANT: ; [$a218]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_KEEP_PENDANT.
    db MESSAGEID_KEEP_PENDANT               ; [$a219] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with a woman walking in a house in the Mist part of the
; Overworld.
;
; This house is nested in the bottom-right of the
; overworld part of the Mist area.
;
; If the player has the Pendant, she'll say that the
; Meteorite has moved. Otherwise, she'll say that the
; dwarves are chanting to the meteorite.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa1]
;
ISCRIPT_OVERWORLD_MIST_HOUSE_WOMAN:         ; [$a21b]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Pendant.
    db SPECIAL_PENDANT                      ; [$a21d] InventoryItem
    dw $a223                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DWARVES_CHANTING.
    db MESSAGEID_DWARVES_CHANTING           ; [$a221] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_OVERWORLD_MIST_HOUSE_WOMAN_HAS_PENDANT: ; [$a223]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_METEORITE_WAS_MOVED.
    db MESSAGEID_METEORITE_WAS_MOVED        ; [$a224] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa2]
;
ISCRIPT_A226:                               ; [$a226]
    db ISCRIPT_ENTITY_NURSE                 ; XXX Show a portrait box
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Hour Glass.
    db ITEM_HOUR_GLASS                      ; [$a228] InventoryItem
    dw $a22e                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_HOUR_GLASS.
    db MESSAGEID_HOUR_GLASS                 ; [$a22c] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A226_HAS_HOURGLASS:             ; [$a22e]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_HOUR_GLASS_USES_ENERGY.
    db MESSAGEID_HOUR_GLASS_USES_ENERGY     ; [$a22f] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fab]
;
ISCRIPT_A231:                               ; [$a231]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Thunder magic.
    db MAGIC_THUNDER                        ; [$a233] InventoryItem
    dw $a239                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WELCOME_TO_VICTIM.
    db MESSAGEID_WELCOME_TO_VICTIM          ; [$a237] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A231_HAS_THUNDER:               ; [$a239]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DANGEROUS_WITHOUT_MAGIC.
    db MESSAGEID_DANGEROUS_WITHOUT_MAGIC    ; [$a23a] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fac]
;
ISCRIPT_A23C:                               ; [$a23c]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Thunder magic.
    db MAGIC_THUNDER                        ; [$a23e] InventoryItem
    dw $a244                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_MAGIC_CONSUMES_POWER.
    db MESSAGEID_MAGIC_CONSUMES_POWER       ; [$a242] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A23C_HAS_THUNDER:               ; [$a244]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_METEORITE_BECOMES_BLACK_ONYX.
    db MESSAGEID_METEORITE_BECOMES_BLACK_ONYX ; [$a245] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fad]
;
ISCRIPT_A247:                               ; [$a247]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Thunder magic.
    db MAGIC_THUNDER                        ; [$a249] InventoryItem
    dw $a24f                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_MAGIC_HALL_OUTSIDE_TOWN.
    db MESSAGEID_MAGIC_HALL_OUTSIDE_TOWN    ; [$a24d] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A247_HAS_THUNDER:               ; [$a24f]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MAGIC_CANE.
    db MESSAGEID_MAGIC_CANE                 ; [$a250] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fae]
;
ISCRIPT_A252:                               ; [$a252]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_PLAYER_RANK     ; Check if the Player has at
                                            ; least the Soldier rank.
    db RANK_SOLDIER                         ; [$a254] PlayerTitle
    dw $a25a                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_GO_TO_CAPITAL.
    db MESSAGEID_GO_TO_CAPITAL              ; [$a258] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A252_HAS_RANK:                  ; [$a25a]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Full Plate armor.
    db ARMOR_FULL_PLATE                     ; [$a25b] InventoryItem
    dw $a263                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_GOT_ARMOR_FOR_BOTTLE.
    db MESSAGEID_GOT_ARMOR_FOR_BOTTLE       ; [$a25f] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Add the full plate to the
                                            ; inventory.
    db ARMOR_FULL_PLATE                     ; [$a261] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A252_HAS_ARMOR:                 ; [$a263]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_ILL_HAVE_DRINK.
    db MESSAGEID_ILL_HAVE_DRINK             ; [$a264] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9faf]
;
ISCRIPT_A266:                               ; [$a266]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Thunder magic.
    db MAGIC_THUNDER                        ; [$a268] InventoryItem
    dw $a26e                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_IM_LOST.
    db MESSAGEID_IM_LOST                    ; [$a26c] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A266_HAS_THUNDER:               ; [$a26e]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_IM_LOST_MAGIC_DOES_NOT_WORK.
    db MESSAGEID_IM_LOST_MAGIC_DOES_NOT_WORK ; [$a26f] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb0]
;
ISCRIPT_A271:                               ; [$a271]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Thunder magic.
    db MAGIC_THUNDER                        ; [$a273] InventoryItem
    dw $a279                                ; If so, branch.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_MAGIC_OF_JUSTICE_OR_DESTRUCTION.
    db MESSAGEID_MAGIC_OF_JUSTICE_OR_DESTRUCTION ; [$a277] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A271_HAS_THUNDER:               ; [$a279]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MAGIC_INDIVIDUAL_POWERS.
    db MESSAGEID_MAGIC_INDIVIDUAL_POWERS    ; [$a27a] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb1]
;
ISCRIPT_A27C:                               ; [$a27c]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Black Onyx.
    db SPECIAL_BLACK_ONYX                   ; [$a27e] InventoryItem
    dw $a284                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DIRECTIONS_TO_TOWER_OF_MIST.
    db MESSAGEID_DIRECTIONS_TO_TOWER_OF_MIST ; [$a282] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A27C_HAS_BLACK_ONYX:            ; [$a284]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the "A"
                                            ; key.
    db KEY_A                                ; [$a285] InventoryItem
    dw $a28d                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_USE_KEY_FOR_CONFLATE.
    db MESSAGEID_USE_KEY_FOR_CONFLATE       ; [$a289] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Add the "A" key to the
                                            ; inventory.
    db KEY_A                                ; [$a28b] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A27C_HAS_KEY:                   ; [$a28d]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_YOU_NEED_KEY_ACE.
    db MESSAGEID_YOU_NEED_KEY_ACE           ; [$a28e] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fbb]
;
ISCRIPT_A290:                               ; [$a290]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic textbox.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Giant Blade.
    db WEAPON_GIANT_BLADE                   ; [$a292] InventoryItem
    dw $a298                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WELCOME_TO_CONFLATE.
    db MESSAGEID_WELCOME_TO_CONFLATE        ; [$a296] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A290_HAS_GIANT_BLADE:           ; [$a298]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_LEGENDARY_SHIELD_HELMET.
    db MESSAGEID_LEGENDARY_SHIELD_HELMET    ; [$a299] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fbc]
;
ISCRIPT_A29B:                               ; [$a29b]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Giant Blade.
    db WEAPON_GIANT_BLADE                   ; [$a29d] InventoryItem
    dw $a2a3                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_TOWN_SURROUNDED_BY_DOORS.
    db MESSAGEID_TOWN_SURROUNDED_BY_DOORS   ; [$a2a1] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A29B_HAS_GIANT_BLADE:           ; [$a2a3]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_SEE_GURU_AFTER_SHIELD_HELMET.
    db MESSAGEID_SEE_GURU_AFTER_SHIELD_HELMET ; [$a2a4] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fbd]
;
ISCRIPT_A2A6:                               ; [$a2a6]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Dworf.
    db SPECIAL_RING_OF_DWORF                ; [$a2a8] InventoryItem
    dw $a2ae                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_GUARDIAN_OF_GURU.
    db MESSAGEID_GUARDIAN_OF_GURU           ; [$a2ac] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2A6_HAS_RING_OF_DWORF:         ; [$a2ae]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Magical Rod.
    db SPECIAL_MAGICAL_ROD                  ; [$a2af] InventoryItem
    dw $a2b5                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_SOMETHING_YOU_CAN_GET.
    db MESSAGEID_SOMETHING_YOU_CAN_GET      ; [$a2b3] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2A6_HAS_MAGICAL_ROD:           ; [$a2b5]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_RELY_ON_MAGIC_FINAL_BATTLE.
    db MESSAGEID_DONT_RELY_ON_MAGIC_FINAL_BATTLE ; [$a2b6] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fbe]
;
ISCRIPT_A2B8:                               ; [$a2b8]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Helmet.
    db SHIELD_BATTLE_HELMET                 ; [$a2ba] InventoryItem
    dw $a2c0                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_USED_TO_TRADE_WITH_DWARVES.
    db MESSAGEID_USED_TO_TRADE_WITH_DWARVES ; [$a2be] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2B8_HAS_BATTLE_HELMET:         ; [$a2c0]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_USED_TO_BE_SKILLED.
    db MESSAGEID_USED_TO_BE_SKILLED         ; [$a2c1] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fbf]
;
ISCRIPT_A2C3:                               ; [$a2c3]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Helmet.
    db SHIELD_BATTLE_HELMET                 ; [$a2c5] InventoryItem
    dw $a2cb                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_USED_TO_VISIT_DWARVES.
    db MESSAGEID_USED_TO_VISIT_DWARVES      ; [$a2c9] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2C3_HAS_BATTLE_HELMET:         ; [$a2cb]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_AM_PICKPOCKET.
    db MESSAGEID_I_AM_PICKPOCKET            ; [$a2cc] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fcb]
;
ISCRIPT_A2CE:                               ; [$a2ce]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Tilte magic.
    db MAGIC_TILTE                          ; [$a2d0] InventoryItem
    dw $a2d6                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DIRECTIONS_DAYBREAK.
    db MESSAGEID_DIRECTIONS_DAYBREAK        ; [$a2d4] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2CE_HAS_TILTE:                 ; [$a2d6]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_FRIENDS_IN_DARTMOOR.
    db MESSAGEID_FRIENDS_IN_DARTMOOR        ; [$a2d7] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fcc]
;
ISCRIPT_A2D9:                               ; [$a2d9]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Suit.
    db ARMOR_BATTLE_SUIT                    ; [$a2db] InventoryItem
    dw $a2e1                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_LOOK_FOR_BATTLE_SUIT.
    db MESSAGEID_LOOK_FOR_BATTLE_SUIT       ; [$a2df] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2D9_HAS_BATTLE_SUIT:           ; [$a2e1]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_FIND_MAGIC_CANE.
    db MESSAGEID_FIND_MAGIC_CANE            ; [$a2e2] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;
; XXX Check if easter egg?
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fcd]
;
ISCRIPT_A2E4:                               ; [$a2e4]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Dworf.
    db SPECIAL_RING_OF_DWORF                ; [$a2e6] InventoryItem
    dw $a2ec                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_YOU_ARE_FAMOUS_GOOD_LOOKING.
    db MESSAGEID_YOU_ARE_FAMOUS_GOOD_LOOKING ; [$a2ea] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2E4_HAS_RING_OF_DWORF:         ; [$a2ec]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_AUTOGRAPH.
    db MESSAGEID_AUTOGRAPH                  ; [$a2ed] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fce]
;
ISCRIPT_A2EF:                               ; [$a2ef]
    db ISCRIPT_ENTITY_NURSE                 ; XXX Show a portrait text box
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Suit.
    db ARMOR_BATTLE_SUIT                    ; [$a2f1] InventoryItem
    dw $a2f7                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_WHEN_TAKE_BATH.
    db MESSAGEID_WHEN_TAKE_BATH             ; [$a2f5] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2EF_HAS_BATTLE_SUIT:           ; [$a2f7]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_GURU_CONFLATE_HAS_RING_DWARVES.
    db MESSAGEID_GURU_CONFLATE_HAS_RING_DWARVES ; [$a2f8] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fcf]
;
ISCRIPT_A2FA:                               ; [$a2fa]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Suit.
    db ARMOR_BATTLE_SUIT                    ; [$a2fc] InventoryItem
    dw $a302                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DID_YOU_GET_BATTLE_SUIT.
    db MESSAGEID_DID_YOU_GET_BATTLE_SUIT    ; [$a300] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A2FA_HAS_BATTLE_SUIT:           ; [$a302]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show,
                                            ; MESSAGE_DARTMORE_IS_MAZE.
    db MESSAGEID_DARTMORE_IS_MAZE           ; [$a303] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fd0]
;
ISCRIPT_A305:                               ; [$a305]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Suit.
    db ARMOR_BATTLE_SUIT                    ; [$a307] InventoryItem
    dw $a30d                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_IS_FIRST_VISIT_TO_STORE.
    db MESSAGEID_IS_FIRST_VISIT_TO_STORE    ; [$a30b] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A305_HAS_BATTLE_SUIT:           ; [$a30d]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MAGIC_CANE_ABOVE_TOWER.
    db MESSAGEID_MAGIC_CANE_ABOVE_TOWER     ; [$a30e] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fdb]
;
ISCRIPT_A310:                               ; [$a310]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Dragon Slayer.
    db WEAPON_DRAGON_SLAYER                 ; [$a312] InventoryItem
    dw $a318                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_DIRECTIONS_TO_FRATERNAL.
    db MESSAGEID_DIRECTIONS_TO_FRATERNAL    ; [$a316] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A310_HAS_DRAGON_SLAYER:         ; [$a318]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_YOU_NEED_DEMONS_RING.
    db MESSAGEID_YOU_NEED_DEMONS_RING       ; [$a319] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with a man sitting in a house in the overworld.
;
; This is in the bottom-left of an area otherwise full of
; enemy houses, 4 screens to the left of the Evil Fortress
; entrance. Exterior looks like a castle.
;
; If the player has the Dragon Slayer, he'll say to defeat
; evil with it. If not, he'll say that King Grieve has it.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fdc]
;
ISCRIPT_OVERWORLD_HOUSE_MAN:                ; [$a31b]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Dragon Slayer.
    db WEAPON_DRAGON_SLAYER                 ; [$a31d] InventoryItem
    dw $a323                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_KING_GRIEVE_HAS_DRAGON_SLAYER.
    db MESSAGEID_KING_GRIEVE_HAS_DRAGON_SLAYER ; [$a321] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_OVERWORLD_HOUSE_MAN_HAS_DRAGON_SLAYER: ; [$a323]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DEFEAT_EVIL_WITH_DRAGON_SLAYER.
    db MESSAGEID_DEFEAT_EVIL_WITH_DRAGON_SLAYER ; [$a324] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with a woman walking in a house in the overworld.
;
; This is in the bottom-left of an area otherwise full of
; enemy houses, 4 screens to the left of the Evil Fortress
; entrance. Exterior looks like a castle.
;
; If the player has the Dragon Slayer, she'll say that the
; Guru has the Demon's Ring. Otherwise, she'll say to find
; the Guru in Castle Fraternal.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fdd]
;
ISCRIPT_OVERWORLD_HOUSE_WOMAN:              ; [$a326]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Dragon Slayer.
    db WEAPON_DRAGON_SLAYER                 ; [$a328] InventoryItem
    dw $a32e                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_GO_TO_FRATERNAL_GURU.
    db MESSAGEID_GO_TO_FRATERNAL_GURU       ; [$a32c] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_OVERWORLD_HOUSE_WOMAN_HAS_DRAGON_SLAYER: ; [$a32e]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_GURU_HAS_DEMONS_RING.
    db MESSAGEID_GURU_HAS_DEMONS_RING       ; [$a32f] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; TODO
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fde]
;
ISCRIPT_A331:                               ; [$a331]
    db ISCRIPT_ENTITY_GENERIC               ; Show a generic text box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Dragon Slayer.
    db WEAPON_DRAGON_SLAYER                 ; [$a333] InventoryItem
    dw $a339                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_SEARCH_CASTLE_FOR_GURU.
    db MESSAGEID_SEARCH_CASTLE_FOR_GURU     ; [$a337] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A331_HAS_DRAGON_SLAYER:         ; [$a339]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_EVIL_IMMUNE_TO_MAGIC.
    db MESSAGEID_EVIL_IMMUNE_TO_MAGIC       ; [$a33a] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Guru of Castle Fraternal.
;
; If the player has both the Dragon Slayer sword
; and the Demon's Ring, the Guru will say he'll
; meditate for you.
;
; If the player has the Dragon Slayer but not the
; Demon's Ring, the player will receive the Demon's Ring
; and tell you King Grieve has been defeated and to use
; the ring to reach the final boss.
;
; If the player doesn't have the Dragon Slayer, the
; Guru will give exposition on the meteorite.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fdf]
;
ISCRIPT_FRATERNAL_GURU:                     ; [$a33c]
    db ISCRIPT_ENTITY_GURU                  ; Show the Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Dragon Slayer.
    db WEAPON_DRAGON_SLAYER                 ; [$a33e] InventoryItem
    dw $a344                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Else, show
                                            ; MESSAGE_METEORITE_EXPOSITION_2.
    db MESSAGEID_METEORITE_EXPOSITION_2     ; [$a342] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A33C_HAS_DRAGON_SLAYER:         ; [$a344]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Demon's Ring.
    db SPECIAL_DEMONS_RING                  ; [$a345] InventoryItem
    dw $a34d                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_DEFEATED_KING_GRIEVE.
    db MESSAGEID_DEFEATED_KING_GRIEVE       ; [$a349] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Add the Demon's Ring to the
                                            ; inventory.
    db SPECIAL_DEMONS_RING                  ; [$a34b] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_A33C_HAS_DEMONS_RING:           ; [$a34d]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_ILL_MEDITATE_FOR_YOU.
    db MESSAGEID_ILL_MEDITATE_FOR_YOU       ; [$a34e] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the King.
;
; If the player has no gold, the King will say some
; exposition and give 1500G.
;
; If the player already has gold, the King will say there's
; nothing more he can do to help.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f73]
;
ISCRIPT_EOLIS_KING:                         ; [$a350]
    db ISCRIPT_ENTITY_KING                  ; Show the King portrait text
                                            ; box.
    db ISCRIPT_ACTION_CHECK_GOLD            ; Check if the player has gold.
    dw $a35a                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Else, show
                                               ; MESSAGE_KING_EXPOSITION.
    db MESSAGEID_KING_EXPOSITION            ; [$a355] Message
    db ISCRIPT_ACTION_ADD_GOLD              ; Add 1500 gold.
    dw $05dc                                ; [$a357] ushort

    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_NPC_KING_FOLLOW_UP_HAS_GOLD:    ; [$a35a]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_NOTHING_MORE_TO_HELP.
    db MESSAGEID_NOTHING_MORE_TO_HELP       ; [$a35b] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction for Eolis Martial Arts / Magic Shop.
;
; The Martial Artist/Magician will give 40MP for 200G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f79]
;
ISCRIPT_EOLIS_MARTIAL_ARTS_MAGIC_SHOP:      ; [$a35d]
    db ISCRIPT_ENTITY_MAGICIAN              ; Show the Magician portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_MAGIC_200G.
    db MESSAGEID_MAGIC_200G                 ; [$a35f] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 200G.
    dw $00c8                                ; [$a361] ushort

    db ISCRIPT_ACTION_ADD_MP                ; Add 40MP.
    db $28                                  ; [$a364] byte

    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_WATCH_POWER_LEVEL.
    db MESSAGEID_WATCH_POWER_LEVEL          ; [$a366] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction for the after-Victim Magic Shop.
;
; The Magician will sell Fire magic for 3000G.
;
; If the player already has Fire, he will say magic
; can be used for justice or destruction depending on
; who uses it.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb6]
;
ISCRIPT_AFTER_VICTIM_MAGIC_SHOP:            ; [$a368]
    db ISCRIPT_ENTITY_MAGICIAN              ; Show the Magician portrait text
                                            ; box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Fire magic.
    db MAGIC_FIRE                           ; [$a36a] InventoryItem
    dw $a377                                ; If so, jump.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Else, show a dismissible
                                            ; MESSAGE_MAGIC_FIRE_3000G.
    db MESSAGEID_MAGIC_FIRE_3000G           ; [$a36e] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 3000G.
    dw $0bb8                                ; [$a370] ushort

    db ISCRIPT_ACTION_ADD_ITEM              ; Add the Fire magic to the
                                            ; inventory.
    db MAGIC_FIRE                           ; [$a373] InventoryItem
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_MAGIC_OF_JUSTICE_OR_DESTRUCTION.
    db MESSAGEID_MAGIC_OF_JUSTICE_OR_DESTRUCTION ; [$a375] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_AFTER_VICTIM_MAGIC_SHOP_HAS_FIRE: ; [$a377]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_RELY_ON_MAGIC.
    db MESSAGEID_DONT_RELY_ON_MAGIC         ; [$a378] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Eolis Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f78]
;
ISCRIPT_EOLIS_TOOL_SHOP:                    ; [$a37a]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a37c] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a386                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a42e                                ; [$a381] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a384] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_EOLIS_TOOL_SHOP_BUY:            ; [$a386]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a42e                                ; [$a387] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a38a] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Apolune Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f84]
;
ISCRIPT_APOLUNE_TOOL_SHOP:                  ; [$a38c]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a38e] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a398                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a43b                                ; [$a393] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a396] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_APOLUNE_TOOL_SHOP_BUY:          ; [$a398]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a43b                                ; Choose Buy
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a39c] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Before-Apolune Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f88]
;
ISCRIPT_BEFORE_APOLUNE_TOOL_SHOP:           ; [$a39e]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a3a0] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a3aa                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a448                                ; [$a3a5] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3a8] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_BEFORE_APOLUNE_TOOL_SHOP_BUY:   ; [$a3aa]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a448                                ; [$a3ab] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3ae] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Forepaw Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f93]
;
ISCRIPT_FOREPAW_TOOL_SHOP:                  ; [$a3b0]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a3b2] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a3bc                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a44f                                ; [$a3b7] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3ba] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_FOREPAW_TOOL_SHOP_BUY:          ; [$a3bc]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a44f                                ; [$a3bd] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3c0] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Mascon Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa4]
;
ISCRIPT_MASCON_TOOL_SHOP:                   ; [$a3c2]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a3c4] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a3ce                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a45f                                ; [$a3c9] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3cc] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_MASCON_TOOL_SHOP_BUY:           ; [$a3ce]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a45f                                ; [$a3cf] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3d2] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the After-Mascon Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa7]
;
ISCRIPT_AFTER_MASCON_TOOL_SHOP:             ; [$a3d4]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a3d6] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a3e0                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a46c                                ; [$a3db] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3de] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_AFTER_MASCON_TOOL_SHOP_BUY:     ; [$a3e0]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a46c                                ; [$a3e1] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3e4] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Victim Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb3]
;
ISCRIPT_VICTIM_TOOL_SHOP:                   ; [$a3e6]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a3e8] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a3f2                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a479                                ; [$a3ed] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3f0] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_VICTIM_TOOL_SHOP_BUY:           ; [$a3f2]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a479                                ; [$a3f3] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a3f6] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Conflate Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fc2]
;
ISCRIPT_CONFLATE_TOOL_SHOP:                 ; [$a3f8]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a3fa] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a404                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a483                                ; [$a3ff] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a402] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_CONFLATE_TOOL_SHOP_BUY:         ; [$a404]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a483                                ; [$a405] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a408] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Daybreak Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fd1]
;
ISCRIPT_DAYBREAK_TOOL_SHOP:                 ; [$a40a]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a40c] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a416                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a490                                ; [$a411] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a414] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_DAYBREAK_TOOL_SHOP_BUY:         ; [$a416]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a490                                ; [$a417] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a41a] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Dartmoor Tool Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe0]
;
ISCRIPT_DARTMOOR_TOOL_SHOP:                 ; [$a41c]
    db ISCRIPT_ENTITY_TOOLS_SALESMAN        ; Show the tools salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_TOOLS.
    db MESSAGEID_I_SELL_TOOLS               ; [$a41e] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a428                                ; If Buy, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell, show the sell menu.
    dw $a49a                                ; [$a423] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a426] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_DARTMOOR_TOOL_SHOP_BUY:         ; [$a428]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a49a                                ; [$a429] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a42c] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Eolis Tool Shop Items.
;
; * Hand Dagger: 400G
; * Red Potion:  160G
; * Elixir:      320G
; * Deluge:      400G
;============================================================================
EOLIS_TOOL_SHOP_ITEMS:                      ; [$a42e]
    db WEAPON_HAND_DAGGER                   ; [$a42e] InventoryItem
    dw $0190                                ; [$a42f] ushort

    db ITEM_RED_POTION
    dw $00a0                                ; [$a432] ushort

    db SPECIAL_ELIXIR
    dw $0140                                ; [$a435] ushort

    db MAGIC_DELUGE
    dw $0190                                ; [$a438] ushort

    db $ff


;============================================================================
; Apolune Tool Shop Items.
;
; * Small Shield: 800G
; * Hand Dagger:  500G
; * Deluge:       500G
; * Red Potion:   300G
;============================================================================
APOLUNE_TOOL_SHOP_ITEMS:                    ; [$a43b]
    db SHIELD_SMALL                         ; [$a43b] InventoryItem
    dw $0320                                ; [$a43c] ushort

    db WEAPON_HAND_DAGGER
    dw $01f4                                ; [$a43f] ushort

    db MAGIC_DELUGE
    dw $01f4                                ; [$a442] ushort

    db ITEM_RED_POTION
    dw $012c                                ; [$a445] ushort

    db $ff


;============================================================================
; Before Apolune Tool Shop Items.
;
; * Magic Shield:  7600G
; * Death:        12500G
;============================================================================
BEFORE_APOLUNE_TOOL_SHOP_ITEMS:             ; [$a448]
    db SHIELD_MAGIC                         ; [$a448] InventoryItem
    dw $1db0                                ; [$a449] ushort

    db MAGIC_DEATH
    dw $30d4                                ; [$a44c] ushort

    db $ff


;============================================================================
; Forepaw Tool Shop Items.
;
; * Long Sword:   1600G
; * Studded Mail: 2500G
; * Small Shield: 1100G
; * Red Potion:    400G
; * Wing Boots:   2800G
;============================================================================
FOREPAW_TOOL_SHOP_ITEMS:                    ; [$a44f]
    db WEAPON_LONG_SWORD                    ; [$a44f] InventoryItem
    dw $0640                                ; [$a450] ushort

    db ARMOR_STUDDED_MAIL
    dw $09c4                                ; [$a453] ushort

    db SHIELD_SMALL
    dw $044c                                ; [$a456] ushort

    db ITEM_RED_POTION
    dw $0190                                ; [$a459] ushort

    db ITEM_WING_BOOTS
    dw $0af0                                ; [$a45c] ushort

    db $ff


;============================================================================
; Mascon Tool Shop Items:
;
; * Large Shield: 3500G
; * Thunder:      1200G
; * Mattock:       800G
; * Red Potion:    600G
;============================================================================
MASCON_TOOL_SHOP_ITEMS:                     ; [$a45f]
    db SHIELD_LARGE                         ; [$a45f] InventoryItem
    dw $0dac                                ; [$a460] ushort

    db MAGIC_THUNDER
    dw $04b0                                ; [$a463] ushort

    db MATTOCK
    dw $0320                                ; [$a466] ushort

    db ITEM_RED_POTION
    dw $0258                                ; [$a469] ushort

    db $ff


;============================================================================
; After Mascon Tool Shop Items.
;
; * Death:      9800G
; * Hour Glass: 5600G
; * Elixir:     4300G
; * Red Potion:  300G
;============================================================================
AFTER_MASCON_TOOL_SHOP_ITEMS:               ; [$a46c]
    db MAGIC_DEATH                          ; [$a46c] InventoryItem
    dw $2648                                ; [$a46d] ushort

    db ITEM_HOUR_GLASS
    dw $15e0                                ; [$a470] ushort

    db SPECIAL_ELIXIR
    dw $10cc                                ; [$a473] ushort

    db ITEM_RED_POTION
    dw $012c                                ; [$a476] ushort

    db $ff


;============================================================================
; Victim Tool Shop Items.
;
; * Full Plate: 5200G
; * Mattock:    1200G
; * Red Potion:  800G
;============================================================================
VICTIM_TOOL_SHOP_ITEMS:                     ; [$a479]
    db ARMOR_FULL_PLATE                     ; [$a479] InventoryItem
    dw $1450                                ; [$a47a] ushort

    db MATTOCK
    dw $04b0                                ; [$a47d] ushort

    db ITEM_RED_POTION
    dw $0320                                ; [$a480] ushort

    db $ff


;============================================================================
; Conflate Tool Shop Items:
;
; * Giant Blade:  8500G
; * Magic Shield: 9800G
; * Wing Boots:   5500G
; * Red Potion:   1000G
;============================================================================
CONFLATE_TOOL_SHOP_ITEMS:                   ; [$a483]
    db WEAPON_GIANT_BLADE                   ; [$a483] InventoryItem
    dw $2134                                ; [$a484] ushort

    db SHIELD_MAGIC
    dw $2648                                ; [$a487] ushort

    db ITEM_WING_BOOTS
    dw $157c                                ; [$a48a] ushort

    db ITEM_RED_POTION
    dw $03e8                                ; [$a48d] ushort

    db $ff


;============================================================================
; Daybreak Tool Shop Items.
;
; * Tilte:       15000G
; * Giant Blade: 11500G
; * Red Potion:   1200G
;============================================================================
DAYBREAK_TOOL_SHOP_ITEMS:                   ; [$a490]
    db MAGIC_TILTE                          ; [$a490] InventoryItem
    dw $3a98                                ; [$a491] ushort

    db WEAPON_GIANT_BLADE
    dw $2cec                                ; [$a494] ushort

    db ITEM_RED_POTION
    dw $04b0                                ; [$a497] ushort

    db $ff


;============================================================================
; Dartmoor Tool Shop Items.
;
; * Giant Blade: 13000G
; * Red Potion:   2000G
;============================================================================
DARTMOOR_TOOL_SHOP_ITEMS:                   ; [$a49a]
    db WEAPON_GIANT_BLADE                   ; [$a49a] InventoryItem
    dw $32c8                                ; [$a49b] ushort

    db ITEM_RED_POTION
    dw $07d0                                ; [$a49e] ushort

    db $ff


;============================================================================
; Interaction with the Eolis Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 50G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f76]
;
ISCRIPT_EOLIS_MEAT_SHOP:                    ; [$a4a1]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_50G.
    db MESSAGEID_DRIED_MEAT_50G             ; [$a4a3] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 50G.
    dw $0032                                ; [$a4a5] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4a8] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4aa] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4ac] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Forepaw Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 150G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f97]
;
ISCRIPT_FOREPAW_MEAT_SHOP:                  ; [$a4ae]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_150G.
    db MESSAGEID_DRIED_MEAT_150G            ; [$a4b0] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 150G.
    dw $0096                                ; [$a4b2] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4b5] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4b7] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4b9] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Mascon Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 180G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa5]
;
ISCRIPT_MASCON_MEAT_SHOP:                   ; [$a4bb]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_180G.
    db MESSAGEID_DRIED_MEAT_180G            ; [$a4bd] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 180G.
    dw $00b4                                ; [$a4bf] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4c2] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4c4] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4c6] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Victim Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 250G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb4]
;
ISCRIPT_VICTIM_MEAT_SHOP:                   ; [$a4c8]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_250G.
    db MESSAGEID_DRIED_MEAT_250G            ; [$a4ca] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 250G.
    dw $00fa                                ; [$a4cc] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4cf] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4d1] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4d3] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Conflate Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 350G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fc3]
;
ISCRIPT_CONFLATE_MEAT_SHOP:                 ; [$a4d5]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_350G.
    db MESSAGEID_DRIED_MEAT_350G            ; [$a4d7] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 350G.
    dw $015e                                ; [$a4d9] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4dc] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4de] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4e0] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Daybreak Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 500G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fd2]
;
ISCRIPT_DAYBREAK_MEAT_SHOP:                 ; [$a4e2]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_500G.
    db MESSAGEID_DRIED_MEAT_500G            ; [$a4e4] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 500G.
    dw $01f4                                ; [$a4e6] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4e9] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4eb] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4ed] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Dartmoor Meat Shop.
;
; The shop keeper will offer 30HP and 30MP for 800G.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe1]
;
ISCRIPT_DARTMOOR_MEAT_SHOP:                 ; [$a4ef]
    db ISCRIPT_ENTITY_MEAT_SALESMAN         ; Show the meat shop salesman
                                            ; portrait text box.
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show
                                            ; MESSAGE_DRIED_MEAT_800G.
    db MESSAGEID_DRIED_MEAT_800G            ; [$a4f1] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay 800G.
    dw $0320                                ; [$a4f3] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 30HP.
    db $1e                                  ; [$a4f6] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 30MP.
    db $1e                                  ; [$a4f8] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a4fa] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Eolis Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f77]
;
ISCRIPT_EOLIS_KEY_SHOP:                     ; [$a4fc]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a4fe] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a508                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a57a                                ; [$a503] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a506] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_EOLIS_KEY_SHOP_BUY:             ; [$a508]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a57a                                ; [$a509] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a50c] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Apolune Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f85]
;
ISCRIPT_APOLUNE_KEY_SHOP:                   ; [$a50e]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a510] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a51a                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a57e                                ; [$a515] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a518] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_APOLUNE_KEY_SHOP_BUY:           ; [$a51a]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a57e                                ; [$a51b] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a51e] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Forepaw Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f96]
;
ISCRIPT_FOREPAW_KEY_SHOP:                   ; [$a520]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a522] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a52c                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a582                                ; [$a527] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a52a] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_FOREPAW_KEY_SHOP_BUY:           ; [$a52c]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a582                                ; [$a52d] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a530] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Mascon Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa6]
;
ISCRIPT_MASCON_KEY_SHOP:                    ; [$a532]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a534] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a53e                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a589                                ; [$a539] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a53c] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_MASCONE_KEY_SHOP_BUY:           ; [$a53e]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a589                                ; [$a53f] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a542] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Victim Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb5]
;
ISCRIPT_VICTIM_KEY_SHOP:                    ; [$a544]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a546] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a550                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a590                                ; [$a54b] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a54e] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_VICTIM_KEY_SHOP_BUY:            ; [$a550]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a590                                ; [$a551] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a554] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Daybreak Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fd3]
;
ISCRIPT_DAYBREAK_KEY_SHOP:                  ; [$a556]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a558] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a562                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a597                                ; [$a55d] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a560] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_DAYBREAK_KEY_SHOP_BUY:          ; [$a562]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a597                                ; [$a563] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a566] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the Dartmoor Key Shop.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe2]
;
ISCRIPT_DARTMOOR_KEY_SHOP:                  ; [$a568]
    db ISCRIPT_ENTITY_KEY_SALESMAN          ; Show the key salesman portrait
                                            ; text box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_I_SELL_KEYS.
    db MESSAGEID_I_SELL_KEYS                ; [$a56a] Message
    db ISCRIPT_ACTION_SHOW_BUY_SELL_MENU    ; Show the Buy/Sell menu.
    dw $a574                                ; If Buy was chosen, jump.
    db ISCRIPT_ACTION_SHOW_SELL_MENU        ; If Sell was chosen, show the
                                            ; sell menu.
    dw $a59e                                ; [$a56f] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a572] Message
    db ISCRIPT_ACTION_END                   ; End.

  @_ISCRIPT_DARTMOOR_KEY_SHOP_BUY:          ; [$a574]
    db ISCRIPT_ACTION_OPEN_SHOP             ; Open the Buy shop menu.
    dw $a59e                                ; [$a575] pointer

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_THANK_YOU_FOR_SHOPPING.
    db MESSAGEID_THANK_YOU_FOR_SHOPPING     ; [$a578] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Eolis Key Shop Items
;
; * "J" Key: 100G
;============================================================================
EOLIS_KEY_SHOP_ITEMS:                       ; [$a57a]
    db KEY_J                                ; [$a57a] InventoryItem
    dw $0064                                ; [$a57b] ushort

    db $ff


;============================================================================
; Apolune Key Shop
;
; * "J" Key: 140G
;============================================================================
APOLUNE_KEY_SHOP_ITEMS:                     ; [$a57e]
    db KEY_J                                ; [$a57e] InventoryItem
    dw $008c                                ; [$a57f] ushort

    db $ff


;============================================================================
; Forepaw Key Shop Items
;
; * "J" Key: 200G
; * "Q" Key: 500G
;============================================================================
FOREPAW_KEY_SHOP_ITEMS:                     ; [$a582]
    db KEY_J                                ; [$a582] InventoryItem
    dw $00c8                                ; [$a583] ushort

    db KEY_Q
    dw $01f4                                ; [$a586] ushort

    db $ff


;============================================================================
; Mascone Key Shop Items
;
; * "J" Key: 500G
; * "Q" Key: 600G
;============================================================================
MACONE_KEY_SHOP_ITEMS:                      ; [$a589]
    db KEY_J                                ; [$a589] InventoryItem
    dw $01f4                                ; [$a58a] ushort

    db KEY_Q
    dw $0258                                ; [$a58d] ushort

    db $ff


;============================================================================
; Victim Key Shop Items
;
; * "K" Key: 1500G
; * "Q" Key: 1200G
;============================================================================
VICTIM_KEY_SHOP_ITEMS:                      ; [$a590]
    db KEY_K                                ; [$a590] InventoryItem
    dw $05dc                                ; [$a591] ushort

    db KEY_Q
    dw $04b0                                ; [$a594] ushort

    db $ff


;============================================================================
; Daybreak Key Shop Items
;
; * "K" Key: 1200G
; * "Q" Key: 1000G
;============================================================================
DAYBREAK_KEY_SHOP_ITEMS:                    ; [$a597]
    db KEY_K                                ; [$a597] InventoryItem
    dw $04b0                                ; [$a598] ushort

    db KEY_Q
    dw $03e8                                ; [$a59b] ushort

    db $ff


;============================================================================
; Dartmoor Key Shop Items
;
; * "K" Key - 1300G
;============================================================================
DARTMOOR_KEY_SHOP_ITEMS:                    ; [$a59e]
    db KEY_K                                ; [$a59e] InventoryItem
    dw $0514                                ; [$a59f] ushort

    db $ff


;============================================================================
; Interaction with the doctor of Apolune.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f80]
;
ISCRIPT_APOLUNE_DOCTOR:                     ; [$a5a2]
    db ISCRIPT_ENTITY_DOCTOR                ; Show the Doctor portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_WANT_TREATMENT.
    db MESSAGEID_DO_YOU_WANT_TREATMENT      ; [$a5a4] Message
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_250G_PLEASE.
    db MESSAGEID_250G_PLEASE                ; [$a5a6] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay gold.
    dw $00fa                                ; [$a5a8] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 80HP.
    db $50                                  ; [$a5ab] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 80MP.
    db $50                                  ; [$a5ad] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD.
    db MESSAGEID_DONT_TRY_TOO_HARD          ; [$a5af] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the doctor of Forepaw.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f95]
;
ISCRIPT_FOREPAW_DOCTOR:                     ; [$a5b1]
    db ISCRIPT_ENTITY_DOCTOR                ; Show the Doctor portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_WANT_TREATMENT.
    db MESSAGEID_DO_YOU_WANT_TREATMENT      ; [$a5b3] Message
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_500G_PLEASE.
    db MESSAGEID_500G_PLEASE                ; [$a5b5] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay gold.
    dw $01f4                                ; [$a5b7] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 80HP.
    db $50                                  ; [$a5ba] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 80MP.
    db $50                                  ; [$a5bc] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD.
    db MESSAGEID_DONT_TRY_TOO_HARD          ; [$a5be] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the doctor of Mascon.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa3]
;
ISCRIPT_MASCON_DOCTOR:                      ; [$a5c0]
    db ISCRIPT_ENTITY_DOCTOR                ; Show the Doctor portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_WANT_TREATMENT.
    db MESSAGEID_DO_YOU_WANT_TREATMENT      ; [$a5c2] Message
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_1000G_PLEASE.
    db MESSAGEID_1000G_PLEASE               ; [$a5c4] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay gold.
    dw $03e8                                ; [$a5c6] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 80HP.
    db $50                                  ; [$a5c9] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 80MP.
    db $50                                  ; [$a5cb] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD.
    db MESSAGEID_DONT_TRY_TOO_HARD          ; [$a5cd] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the doctor of Victim.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb2]
;
ISCRIPT_VICTIM_DOCTOR:                      ; [$a5cf]
    db ISCRIPT_ENTITY_DOCTOR                ; Show the Doctor portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_WANT_TREATMENT.
    db MESSAGEID_DO_YOU_WANT_TREATMENT      ; [$a5d1] Message
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_2500G_PLEASE.
    db MESSAGEID_2500G_PLEASE               ; [$a5d3] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay gold.
    dw $09c4                                ; [$a5d5] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 80HP.
    db $50                                  ; [$a5d8] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 80MP.
    db $50                                  ; [$a5da] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD.
    db MESSAGEID_DONT_TRY_TOO_HARD          ; [$a5dc] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the doctor of Conflate.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fc1]
;
ISCRIPT_CONFLATE_DOCTOR:                    ; [$a5de]
    db ISCRIPT_ENTITY_DOCTOR                ; Show the Doctor portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_WANT_TREATMENT.
    db MESSAGEID_DO_YOU_WANT_TREATMENT      ; [$a5e0] Message
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_1800G_PLEASE.
    db MESSAGEID_1800G_PLEASE               ; [$a5e2] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay gold.
    dw $0708                                ; [$a5e4] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 80HP.
    db $50                                  ; [$a5e7] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 80MP.
    db $50                                  ; [$a5e9] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD.
    db MESSAGEID_DONT_TRY_TOO_HARD          ; [$a5eb] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the doctor of Dartmoor.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe5]
;
ISCRIPT_DARTMOOR_DOCTOR:                    ; [$a5ed]
    db ISCRIPT_ENTITY_DOCTOR                ; Show the Doctor portrait text
                                            ; box.
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DO_YOU_WANT_TREATMENT.
    db MESSAGEID_DO_YOU_WANT_TREATMENT      ; [$a5ef] Message
    db ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE ; Show a dismissible
                                            ; MESSAGE_3000G_PLEASE.
    db MESSAGEID_3000G_PLEASE               ; [$a5f1] Message
    db ISCRIPT_ACTION_PAY_GOLD              ; If not dismissed, pay gold.
    dw $0bb8                                ; [$a5f3] ushort

    db ISCRIPT_ACTION_ADD_HP                ; Add 80HP.
    db $50                                  ; [$a5f6] byte

    db ISCRIPT_ACTION_ADD_MP                ; Add 80MP.
    db $50                                  ; [$a5f8] byte

    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_DONT_TRY_TOO_HARD.
    db MESSAGEID_DONT_TRY_TOO_HARD          ; [$a5fa] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Common script for a player's new password at a temple.
;============================================================================
ISCRIPT_COMMON_GURU_PASSWORD:               ; [$a5fc]
    db ISCRIPT_ACTION_SHOW_MESSAGE          ; Show
                                            ; MESSAGE_MEDITATE_WITH_YOU.
    db MESSAGEID_MEDITATE_WITH_YOU          ; [$a5fd] Message
    db ISCRIPT_ACTION_SHOW_PASSWORD         ; Generate and show a new
                                            ; password.
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Common script for a player's new rank at a temple.
;============================================================================
ISCRIPT_COMMON_GURU_NEW_RANK:               ; [$a600]
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_NEW_TITLE.
    db MESSAGEID_NEW_TITLE                  ; [$a601] Message
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the guru of Apolune.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f87]
;
ISCRIPT_APOLUNE_GURU:                       ; [$a603]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; temple of Apolune.
    db TEMPLE_APOLUNE                       ; [$a605] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a60a] pointer


;============================================================================
; Interaction with the guru of Forepaw.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9f94]
;
ISCRIPT_FOREPAW_GURU:                       ; [$a60c]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; temple of Forepaw.
    db TEMPLE_FOREPAW                       ; [$a60e] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a613] pointer


;============================================================================
; Interaction with the guru of Mascon.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fa8]
;
ISCRIPT_MASCON_GURU:                        ; [$a615]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; temple of Mascon.
    db TEMPLE_MASCON                        ; [$a617] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a61c] pointer


;============================================================================
; Interaction with the guru of Victim.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fb7]
;
ISCRIPT_VICTIM_GURU:                        ; [$a61e]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; temple of Victim.
    db TEMPLE_VICTIM                        ; [$a620] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a625] pointer


;============================================================================
; Interaction with the guru of Conflate.
;
; This guru will check if the player has the Battle Suit
; and Ring of Dworf.
;
; If they have the Battle Suit but not Ring of Dworf,
; the player will receive the ring and be given directions
; to Dartmore.
;
; Otherwise, they'll get the normal Guru behavior.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fc0]
;
ISCRIPT_CONFLATE_GURU:                      ; [$a627]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Battle Suit.
    db ARMOR_BATTLE_SUIT                    ; [$a629] InventoryItem
    dw $a634                                ; If so, jump.

  @_ISCRIPT_GURU_CONFLATE_DEFAULT:          ; [$a62c]
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; temple of Conflate.
    db TEMPLE_CONFLATE                      ; [$a62d] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a632] pointer

  @_ISCRIPT_GURU_CONFLATE_HAS_BATTLE_SUIT:  ; [$a634]
    db ISCRIPT_ACTION_CHECK_FOR_ITEM        ; Check if the player has the
                                            ; Ring of Dworf.
    db SPECIAL_RING_OF_DWORF                ; [$a635] InventoryItem
    dw $a62c                                ; If so, jump to normal guru
                                            ; behavior.
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; Show
                                               ; MESSAGE_DIRECTIONS_DARTMORE.
    db MESSAGEID_DIRECTIONS_DARTMORE        ; [$a639] Message
    db ISCRIPT_ACTION_ADD_ITEM              ; Add the Ring of Dworf to the
                                            ; inventory.
    db SPECIAL_RING_OF_DWORF                ; [$a63b] InventoryItem
    db ISCRIPT_ACTION_END                   ; End.


;============================================================================
; Interaction with the guru of Daybreak.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fd4]
;
ISCRIPT_DAYBREAK_GURU:                      ; [$a63d]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; Daybreak temple.
    db TEMPLE_DAYBREAK                      ; [$a63f] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a644] pointer


;============================================================================
; Interaction with the guru of the final temple.
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe3]
;
ISCRIPT_GURU_FINAL:                         ; [$a646]
    db ISCRIPT_ENTITY_GURU                  ; Display a Guru portrait text
                                            ; box.
    db ISCRIPT_ACTION_SET_SPAWN_POINT       ; Set the spawn point to the
                                            ; final temple.
    db TEMPLE_FINAL                         ; [$a648] Temple
    db ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE ; Check the player rank and
                                                ; update if needed.
    dw $a600                                ; If set, jump to show the new
                                            ; rank.
    db ISCRIPT_ACTION_JUMP                  ; Else, jump to show the new
                                            ; password.
    dw $a5fc                                ; [$a64d] pointer


;============================================================================
; "Glad you're back."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe4]
;
ISCRIPT_KING_END_GAME:                      ; [$a64f]
    db ISCRIPT_ENTITY_GENERIC               ; [$a64f] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a650] IScriptAction
    db MESSAGEID_GLAD_YOURE_BACK            ; [$a651] Message
    db ISCRIPT_ACTION_END_GAME              ; [$a652] IScriptAction
    db ISCRIPT_ACTION_END                   ; [$a653] IScriptAction


;============================================================================
; "There is the mark of Queen by the key hole."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe6]
;
ISCRIPT_MARK_OF_QUEEN:                      ; [$a654]
    db ISCRIPT_ENTITY_GENERIC               ; [$a654] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a655] IScriptAction
    db MESSAGEID_MARK_OF_QUEEN              ; [$a656] Message
    db ISCRIPT_ACTION_END                   ; [$a657] IScriptAction


;============================================================================
; "There is the mark of King by the key hole."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe7]
;
ISCRIPT_MARK_OF_KING:                       ; [$a658]
    db ISCRIPT_ENTITY_GENERIC               ; [$a658] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a659] IScriptAction
    db MESSAGEID_MARK_OF_KING               ; [$a65a] Message
    db ISCRIPT_ACTION_END                   ; [$a65b] IScriptAction


;============================================================================
; "There is the mark of Ace by the key hole."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe8]
;
ISCRIPT_MARK_OF_ACE:                        ; [$a65c]
    db ISCRIPT_ENTITY_GENERIC               ; [$a65c] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a65d] IScriptAction
    db MESSAGEID_MARK_OF_ACE                ; [$a65e] Message
    db ISCRIPT_ACTION_END                   ; [$a65f] IScriptAction


;============================================================================
; "There is the mark of Joker by the key hole."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fe9]
;
ISCRIPT_MARK_OF_JOKER:                      ; [$a660]
    db ISCRIPT_ENTITY_GENERIC               ; [$a660] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a661] IScriptAction
    db MESSAGEID_MARK_OF_JOKER              ; [$a662] Message
    db ISCRIPT_ACTION_END                   ; [$a663] IScriptAction


;============================================================================
; "Do you need a ring to open a door?"
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fea]
;
ISCRIPT_NEED_RING_FOR_DOOR:                 ; [$a664]
    db ISCRIPT_ENTITY_GENERIC               ; [$a664] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a665] IScriptAction
    db MESSAGEID_NEED_RING_FOR_DOOR         ; [$a666] Message
    db ISCRIPT_ACTION_END                   ; [$a667] IScriptAction


;============================================================================
; "I've used Red Potion."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9feb]
;
ISCRIPT_USED_RED_POTION:                    ; [$a668]
    db ISCRIPT_ENTITY_GENERIC               ; [$a668] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a669] IScriptAction
    db MESSAGEID_USED_RED_POTION            ; [$a66a] Message
    db ISCRIPT_ACTION_END                   ; [$a66b] IScriptAction


;============================================================================
; "I've used Mattock."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fec]
;
ISCRIPT_USED_MATTOCK:                       ; [$a66c]
    db ISCRIPT_ENTITY_GENERIC               ; [$a66c] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a66d] IScriptAction
    db MESSAGEID_USED_MATTOCK               ; [$a66e] Message
    db ISCRIPT_ACTION_END                   ; [$a66f] IScriptAction


;============================================================================
; "I've used Hour Glass."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fed]
;
ISCRIPT_USED_HOURGLASS:                     ; [$a670]
    db ISCRIPT_ENTITY_GENERIC               ; [$a670] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a671] IScriptAction
    db MESSAGEID_USED_HOURGLASS             ; [$a672] Message
    db ISCRIPT_ACTION_END                   ; [$a673] IScriptAction


;============================================================================
; "I've used Wing Boots."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fee]
;
ISCRIPT_USED_WINGBOOTS:                     ; [$a674]
    db ISCRIPT_ENTITY_GENERIC               ; [$a674] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a675] IScriptAction
    db MESSAGEID_USED_WINGBOOTS             ; [$a676] Message
    db ISCRIPT_ACTION_END                   ; [$a677] IScriptAction


;============================================================================
; "I've used key."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fef]
;
ISCRIPT_USED_KEY:                           ; [$a678]
    db ISCRIPT_ENTITY_GENERIC               ; [$a678] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a679] IScriptAction
    db MESSAGEID_USED_KEY                   ; [$a67a] Message
    db ISCRIPT_ACTION_END                   ; [$a67b] IScriptAction


;============================================================================
; "I've used Elixir."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff0]
;
ISCRIPT_USED_ELIXIR:                        ; [$a67c]
    db ISCRIPT_ENTITY_GENERIC               ; [$a67c] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a67d] IScriptAction
    db MESSAGEID_USED_ELIXIR                ; [$a67e] Message
    db ISCRIPT_ACTION_END                   ; [$a67f] IScriptAction


;============================================================================
; "I'm holding Elixir."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff1]
;
ISCRIPT_GOT_ELIXIR:                         ; [$a680]
    db ISCRIPT_ENTITY_GENERIC               ; [$a680] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a681] IScriptAction
    db MESSAGEID_HOLDING_ELIXIR             ; [$a682] Message
    db ISCRIPT_ACTION_END                   ; [$a683] IScriptAction


;============================================================================
; "I'm holding Red Potion."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff2]
;
ISCRIPT_GOT_RED_POTION:                     ; [$a684]
    db ISCRIPT_ENTITY_GENERIC               ; [$a684] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a685] IScriptAction
    db MESSAGEID_HOLDING_RED_POTION         ; [$a686] Message
    db ISCRIPT_ACTION_END                   ; [$a687] IScriptAction


;============================================================================
; "I'm holding Mattock."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff3]
;
ISCRIPT_GOT_MATTOCK:                        ; [$a688]
    db ISCRIPT_ENTITY_GENERIC               ; [$a688] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a689] IScriptAction
    db MESSAGEID_HOLDING_MATTOCK            ; [$a68a] Message
    db ISCRIPT_ACTION_END                   ; [$a68b] IScriptAction


;============================================================================
; "I'm holding Wing Boots."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff4]
;
ISCRIPT_GOT_WINGBOOTS:                      ; [$a68c]
    db ISCRIPT_ENTITY_GENERIC               ; [$a68c] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a68d] IScriptAction
    db MESSAGEID_HOLDING_WINGBOOTS          ; [$a68e] Message
    db ISCRIPT_ACTION_END                   ; [$a68f] IScriptAction


;============================================================================
; "I'm holding Hour Glass."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff5]
;
ISCRIPT_GOT_HOURGLASS:                      ; [$a690]
    db ISCRIPT_ENTITY_GENERIC               ; [$a690] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a691] IScriptAction
    db MESSAGEID_HOLDING_HOURGLASS          ; [$a692] Message
    db ISCRIPT_ACTION_END                   ; [$a693] IScriptAction


;============================================================================
; "I've got the Battle Suit."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff6]
;
ISCRIPT_GOT_BATTLE_SUIT:                    ; [$a694]
    db ISCRIPT_ENTITY_GENERIC               ; [$a694] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a695] IScriptAction
    db MESSAGEID_GOT_BATTLE_SUIT            ; [$a696] Message
    db ISCRIPT_ACTION_END                   ; [$a697] IScriptAction


;============================================================================
; "I've got the Battle Helmet."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff7]
;
ISCRIPT_GOT_BATTLE_HELMET:                  ; [$a698]
    db ISCRIPT_ENTITY_GENERIC               ; [$a698] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a699] IScriptAction
    db MESSAGEID_GOT_BATTLE_HELMET          ; [$a69a] Message
    db ISCRIPT_ACTION_END                   ; [$a69b] IScriptAction


;============================================================================
; "I've got the Dragon Slayer."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff8]
;
ISCRIPT_GOT_DRAGON_SLAYER:                  ; [$a69c]
    db ISCRIPT_ENTITY_GENERIC               ; [$a69c] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a69d] IScriptAction
    db MESSAGEID_GOT_DRAGON_SLAYER          ; [$a69e] Message
    db ISCRIPT_ACTION_END                   ; [$a69f] IScriptAction


;============================================================================
; "I've got the Black Onyx."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ff9]
;
ISCRIPT_GOT_BLACK_ONYX:                     ; [$a6a0]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6a0] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6a1] IScriptAction
    db MESSAGEID_GOT_BLACK_ONYX             ; [$a6a2] Message
    db ISCRIPT_ACTION_END                   ; [$a6a3] IScriptAction


;============================================================================
; "I've got the Pendant."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ffa]
;
ISCRIPT_GOT_PENDANT:                        ; [$a6a4]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6a4] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6a5] IScriptAction
    db MESSAGEID_GOT_PENDANT                ; [$a6a6] Message
    db ISCRIPT_ACTION_END                   ; [$a6a7] IScriptAction


;============================================================================
; "I've got the Magical Rod."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ffb]
;
ISCRIPT_GOT_MAGICAL_ROD:                    ; [$a6a8]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6a8] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6a9] IScriptAction
    db MESSAGEID_GOT_MAGICAL_ROD            ; [$a6aa] Message
    db ISCRIPT_ACTION_END                   ; [$a6ab] IScriptAction


;============================================================================
; "I've touched Poison."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ffc]
;
ISCRIPT_TOUCHED_POISON:                     ; [$a6ac]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6ac] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6ad] IScriptAction
    db MESSAGEID_TOUCHED_POISON             ; [$a6ae] Message
    db ISCRIPT_ACTION_END                   ; [$a6af] IScriptAction


;============================================================================
; "The glove increases offensive power."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ffd]
;
ISCRIPT_GOT_POWER_GLOVE:                    ; [$a6b0]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6b0] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6b1] IScriptAction
    db MESSAGEID_GLOVE_INCREASES_POWER      ; [$a6b2] Message
    db ISCRIPT_ACTION_END                   ; [$a6b3] IScriptAction


;============================================================================
; "The power of the Glove is gone."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9ffe]
;
ISCRIPT_POWER_GLOVE_GONE:                   ; [$a6b4]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6b4] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6b5] IScriptAction
    db MESSAGEID_POWER_GLOVE_IS_GONE        ; [$a6b6] Message
    db ISCRIPT_ACTION_END                   ; [$a6b7] IScriptAction


;============================================================================
; "I am free from injury because of the Ointment."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::9fff]
;
ISCRIPT_OINTMENT_USED:                      ; [$a6b8]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6b8] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6b9] IScriptAction
    db MESSAGEID_USED_OINTMENT              ; [$a6ba] Message
    db ISCRIPT_ACTION_END                   ; [$a6bb] IScriptAction


;============================================================================
; "The power of the Ointment is gone."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::a000]
;
ISCRIPT_OINTMENT_GONE:                      ; [$a6bc]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6bc] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6bd] IScriptAction
    db MESSAGEID_OINTMENT_GONE              ; [$a6be] Message
    db ISCRIPT_ACTION_END                   ; [$a6bf] IScriptAction


;============================================================================
; "The power of the Wing Boots is gone."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::a001]
;
ISCRIPT_WINGBOOTS_GONE:                     ; [$a6c0]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6c0] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6c1] IScriptAction
    db MESSAGEID_WINGBOOTS_GONE             ; [$a6c2] Message
    db ISCRIPT_ACTION_END                   ; [$a6c3] IScriptAction


;============================================================================
; "The power of the Hour Glass is gone."
;============================================================================

;
; XREFS:
;     ISCRIPT_ADDRS_L [$PRG12::a002]
;
ISCRIPT_HOURGLASS_GONE:                     ; [$a6c4]
    db ISCRIPT_ENTITY_GENERIC               ; [$a6c4] IScriptEntity
    db ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE ; [$a6c5] IScriptAction
    db MESSAGEID_HOURGLASS_GONE             ; [$a6c6] Message
    db ISCRIPT_ACTION_END                   ; [$a6c7] IScriptAction

;
; XREFS:
;     SPLASHANIM_PALETTE_L [$PRG12::a72c]
;
SPLASHANIM_INTRO_PALETTE:                   ; [$a6c8]
    db $0f                                  ; [0]:
    db $07                                  ; [1]:
    db $17                                  ; [2]:
    db $27                                  ; [3]:
    db $0f                                  ; [4]:
    db $27                                  ; [5]:
    db $17                                  ; [6]:
    db $27                                  ; [7]:
    db $0f                                  ; [8]:
    db $0c                                  ; [9]:
    db $17                                  ; [10]:
    db $10                                  ; [11]:
    db $0f                                  ; [12]:
    db $0c                                  ; [13]:
    db $17                                  ; [14]:
    db $27                                  ; [15]:
    db $0f                                  ; [16]:
    db $17                                  ; [17]:
    db $26                                  ; [18]:
    db $30                                  ; [19]:
    db $0f                                  ; [20]:
    db $17                                  ; [21]:
    db $26                                  ; [22]:
    db $30                                  ; [23]:
    db $0f                                  ; [24]:
    db $17                                  ; [25]:
    db $26                                  ; [26]:
    db $30                                  ; [27]:
    db $0f                                  ; [28]:
    db $17                                  ; [29]:
    db $26                                  ; [30]:
    db $30                                  ; [31]:

;
; XREFS:
;     SPLASHANIM_PALETTE_L [$PRG12::a72d]
;
SPLASHANIM_OUTRO_PALETTE:                   ; [$a6e8]
    db $0f                                  ; [0]:
    db $17                                  ; [1]:
    db $27                                  ; [2]:
    db $37                                  ; [3]:
    db $0f                                  ; [4]:
    db $37                                  ; [5]:
    db $19                                  ; [6]:
    db $29                                  ; [7]:
    db $0f                                  ; [8]:
    db $1c                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $1c                                  ; [13]:
    db $27                                  ; [14]:
    db $37                                  ; [15]:
    db $0f                                  ; [16]:
    db $17                                  ; [17]:
    db $26                                  ; [18]:
    db $30                                  ; [19]:
    db $0f                                  ; [20]:
    db $1c                                  ; [21]:
    db $2c                                  ; [22]:
    db $30                                  ; [23]:
    db $0f                                  ; [24]:
    db $17                                  ; [25]:
    db $26                                  ; [26]:
    db $30                                  ; [27]:
    db $0f                                  ; [28]:
    db $17                                  ; [29]:
    db $26                                  ; [30]:
    db $30                                  ; [31]:


;============================================================================
; TODO: Document SplashAnimation_SomethingA708
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunIntro
;============================================================================
SplashAnimation_SomethingA708:              ; [$a708]
    INC a:ScreenBuffer_164_
    LDA a:ScreenBuffer_164_
    AND #$07
    BNE @LAB_PRG12__a727
    LDY #$1f

  @LAB_PRG12__a714:                         ; [$a714]
    LDA CurrentPaletteData,Y
    SEC
    SBC #$10
    BPL @LAB_PRG12__a71e
    LDA #$0f

  @LAB_PRG12__a71e:                         ; [$a71e]
    STA CurrentPaletteData,Y
    DEY
    BPL @LAB_PRG12__a714
    JMP #$d090

  @LAB_PRG12__a727:                         ; [$a727]
    RTS

;
; XREFS:
;     SplashAnimation_DrawScenery
;
SPLASHANIM_CHR_L:                           ; [$a728]
    db $a0                                  ; [0]: Intro
    db $a0                                  ; [1]: Outro

;
; XREFS:
;     SplashAnimation_DrawScenery
;
SPLASHANIM_CHR_U:                           ; [$a72a]
    db $ac                                  ; [0]: Intro
    db $b0                                  ; [1]: Outro

;
; XREFS:
;     SplashAnimation_DrawScenery
;
SPLASHANIM_PALETTE_L:                       ; [$a72c]
    db $c8                                  ; [0]: Intro
    db $e8                                  ; [1]: Outro

;
; XREFS:
;     SplashAnimation_DrawScenery
;
SPLASHANIM_PALETTE_U:                       ; [$a72e]
    db $a6                                  ; [0]: Intro
    db $a6                                  ; [1]: Outro


;============================================================================
; TODO: Document SplashAnimation_DrawScenery
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_DrawScenery:                ; [$a730]
    STA a:SplashAnimScene
    JSR #$caf7
    LDA #$a0
    STA IScriptOrCHRAddr
    LDA #$9b
    STA IScriptOrCHRAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDA #$00
    STA PPU_TargetAddr.U
    LDX #$0a
    LDY #$90
    JSR #$f89e
    LDA #$a0
    STA IScriptOrCHRAddr
    LDA #$a4
    STA IScriptOrCHRAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDA #$18
    STA PPU_TargetAddr.U
    LDX #$0a
    LDY #$80
    JSR #$f89e
    LDX a:SplashAnimScene
    LDA #$a728,X
    STA IScriptOrCHRAddr
    LDA #$a72a,X
    STA IScriptOrCHRAddr.U
    LDA #$20
    STA PPU_TargetAddr.U
    LDA #$00
    STA PPU_TargetAddr
    LDX #$0a
    LDY #$40
    JSR #$f89e
    LDX a:SplashAnimScene
    LDA #$a72c,X
    STA Temp_Int24
    LDA #$a72e,X
    STA Temp_Int24.M
    LDY #$1f

  @_paletteLoop:                            ; [$a78f]
    LDA (Temp_Int24),Y
    STA CurrentPaletteData,Y
    DEY
    BPL @_paletteLoop
    JMP #$d090


;============================================================================
; TODO: Document SplashAnimation_RunIntro
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     Game_ShowStartScreen
;============================================================================
SplashAnimation_RunIntro:                   ; [$a79a]
    LDA #$00
    JSR SplashAnimation_DrawScenery
    JSR Maybe_SplashAnimation_InitIntroState
    LDA #$00
    STA a:ScreenBuffer_164_
    LDA #$00
    STA CurrentMusic
    JSR #$cb27

  @LAB_PRG12__a7ae:                         ; [$a7ae]
    JSR #$ca25
    JSR #$cb4f
    JSR SplashAnimation_SomethingUpdateState
    JSR SplashAnimation_Maybe_CalcPlayerAnimState
    JSR SplashAnimation_Maybe_AnimPlayerStep
    LDX a:IntroAnimation_PlayerSizeCounter
    CPX #$04
    BNE @LAB_PRG12__a7ae
    JSR SplashAnimation_SomethingA708
    LDA a:ScreenBuffer_164_
    CMP #$20
    BNE @LAB_PRG12__a7ae
    RTS


;============================================================================
; TODO: Document SplashAnimation_Maybe_CalcPlayerAnimState
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunIntro
;============================================================================
SplashAnimation_Maybe_CalcPlayerAnimState:  ; [$a7cf]
    LDY #$07
    JSR SplashAnimation_Maybe_NextAnimState1
    LDY #$07
    JSR SplashAnimation_Maybe_NextAnimState2
    LDX a:IntroAnimation_PlayerSizeCounter
    CMP #$a859,X
    BCS RETURN_A7F0
    INC a:IntroAnimation_PlayerSizeCounter
    LDA #$a85e,X
    STA a:ScreenBuffer_146_
    LDA #$a862,X
    STA a:ScreenBuffer_147_

    ;
    ; XREFS:
    ;     SplashAnimation_Maybe_CalcPlayerAnimSize
    ;     SplashAnimation_Maybe_CalcPlayerAnimState
    ;
RETURN_A7F0:                                ; [$a7f0]
    RTS


;============================================================================
; TODO: Document SplashAnimation_Maybe_CalcPlayerAnimSize
;
; INPUTS:
;     A
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_Maybe_CalcPlayerAnimSize:   ; [$a7f1]
    LDY #$07
    JSR SplashAnimation_Maybe_NextAnimState1
    LDY #$07
    JSR SplashAnimation_Maybe_NextAnimState2
    LDX a:IntroAnimation_PlayerSizeCounter
    CMP #$a866,X
    BCC RETURN_A7F0
    INC a:IntroAnimation_PlayerSizeCounter
    LDA #$a86a,X
    STA a:ScreenBuffer_146_
    LDA #$a86e,X
    STA a:ScreenBuffer_147_
    RTS


;============================================================================
; TODO: Document Maybe_SplashAnimation_InitIntroState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunIntro
;============================================================================
Maybe_SplashAnimation_InitIntroState:       ; [$a813]
    LDA #$18
    STA a:ScreenBuffer_142_
    LDA #$ff
    STA a:ScreenBuffer_143_
    LDA #$00
    STA a:ScreenBuffer_140_
    STA a:IntroAnimation_PlayerSizeCounter
    STA a:ScreenBuffer_144_
    STA a:ScreenBuffer_145_
    LDA #$20
    STA a:ScreenBuffer_146_
    LDA #$e0
    STA a:ScreenBuffer_147_
    RTS


;============================================================================
; TODO: Document Maybe_SplashAnimation_InitOutroState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
Maybe_SplashAnimation_InitOutroState:       ; [$a836]
    LDA #$70
    STA a:ScreenBuffer_142_
    LDA #$ae
    STA a:ScreenBuffer_143_
    LDA #$00
    STA a:ScreenBuffer_140_
    STA a:IntroAnimation_PlayerSizeCounter
    STA a:ScreenBuffer_144_
    STA a:ScreenBuffer_145_
    LDA #$fd
    STA a:ScreenBuffer_146_
    LDA #$01
    STA a:ScreenBuffer_147_
    RTS

;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimState
;
BYTE_ARRAY_PRG12__a859:                     ; [$a859]
    db $cc                                  ; [0]:
    db $bc                                  ; [1]:
    db $b4                                  ; [2]:
    db $b0                                  ; [3]:
    db $00                                  ; [4]:

;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimState
;
BYTE_ARRAY_PRG12__a85e:                     ; [$a85e]
    db $11                                  ; [0]:
    db $0a                                  ; [1]:
    db $05                                  ; [2]:
    db $03                                  ; [3]:

;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimState
;
BYTE_ARRAY_PRG12__a862:                     ; [$a862]
    db $f0                                  ; [0]:
    db $f8                                  ; [1]:
    db $fd                                  ; [2]:
    db $ff                                  ; [3]:

;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;
BYTE_ARRAY_PRG12__a866:                     ; [$a866]
    db $b0                                  ; [0]:
    db $b4                                  ; [1]:
    db $bc                                  ; [2]:
    db $cc                                  ; [3]:

;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;
BYTE_ARRAY_PRG12__a86a:                     ; [$a86a]
    db $fb                                  ; [0]:
    db $f6                                  ; [1]:
    db $ef                                  ; [2]:
    db $e0                                  ; [3]:

;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;
BYTE_ARRAY_PRG12__a86e:                     ; [$a86e]
    db $03                                  ; [0]:
    db $08                                  ; [1]:
    db $10                                  ; [2]:
    db $20                                  ; [3]:


;============================================================================
; TODO: Document SplashAnimation_Maybe_NextAnimState1
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;============================================================================
SplashAnimation_Maybe_NextAnimState1:       ; [$a872]
    LDA #$00
    STA Temp_Int24
    LDA a:ScreenBuffer_146_

  @LAB_PRG12__a879:                         ; [$a879]
    STA Temp_Int24.M
    ROL Temp_Int24.M
    ROR A
    ROR Temp_Int24
    DEY
    BNE @LAB_PRG12__a879
    CLC
    STA Temp_Int24.M
    LDA Temp_Int24
    CLC
    ADC a:ScreenBuffer_144_
    STA a:ScreenBuffer_144_
    LDA Temp_Int24.M
    ADC a:ScreenBuffer_142_
    STA a:ScreenBuffer_142_
    RTS


;============================================================================
; TODO: Document SplashAnimation_Maybe_NextAnimState2
;
; INPUTS:
;     Y
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_Maybe_CalcPlayerAnimSize
;     SplashAnimation_Maybe_CalcPlayerAnimState
;============================================================================
SplashAnimation_Maybe_NextAnimState2:       ; [$a898]
    LDA #$00
    STA Temp_Int24
    LDA a:ScreenBuffer_147_

  @LAB_PRG12__a89f:                         ; [$a89f]
    STA Temp_Int24.M
    ROL Temp_Int24.M
    ROR A
    ROR Temp_Int24
    DEY
    BNE @LAB_PRG12__a89f
    CLC
    STA Temp_Int24.M
    LDA Temp_Int24
    CLC
    ADC a:ScreenBuffer_145_
    STA a:ScreenBuffer_145_
    LDA Temp_Int24.M
    ADC a:ScreenBuffer_143_
    STA a:ScreenBuffer_143_
    RTS


;============================================================================
; TODO: Document SplashAnimation_Maybe_AnimPlayerStep
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunIntro
;============================================================================
SplashAnimation_Maybe_AnimPlayerStep:       ; [$a8be]
    JSR SplashAnimation_A90F
    LDY a:IntroAnimation_PlayerSizeCounter
    CPY #$03
    BCS @LAB_PRG12__a8d8
    AND #$01
    BNE @LAB_PRG12__a8d8
    LDA a:ScreenBuffer_140_
    AND #$0f
    BNE @LAB_PRG12__a8d8
    LDA #$15
    JSR #$d0e4

  @LAB_PRG12__a8d8:                         ; [$a8d8]
    LDA #$a8de,X
    JMP SplashAnimation_FuncAA94

;
; XREFS:
;     SplashAnimation_Maybe_AnimPlayerStep
;
BYTE_ARRAY_PRG12__a8de:                     ; [$a8de]
    db $00                                  ; [0]:
    db $01                                  ; [1]:
    db $02                                  ; [2]:
    db $01                                  ; [3]:
    db $03                                  ; [4]:
    db $04                                  ; [5]:
    db $05                                  ; [6]:
    db $04                                  ; [7]:
    db $06                                  ; [8]:
    db $06                                  ; [9]:
    db $07                                  ; [10]:
    db $07                                  ; [11]:
    db $08                                  ; [12]:
    db $08                                  ; [13]:
    db $09                                  ; [14]:
    db $09                                  ; [15]:
    db $0a                                  ; [16]:
    db $0a                                  ; [17]:
    db $0b                                  ; [18]:
    db $0b                                  ; [19]:


;============================================================================
; TODO: Document SplashAnimation_OutroFuncAF82
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_OutroFuncAF82:              ; [$a8f2]
    JSR SplashAnimation_A90F
    LDA #$a8fb,X
    JMP SplashAnimation_FuncAA94

;
; XREFS:
;     SplashAnimation_OutroFuncAF82
;
BYTE_ARRAY_PRG12__a8fb:                     ; [$a8fb]
    db $0c                                  ; [0]:
    db $0c                                  ; [1]:
    db $0d                                  ; [2]:
    db $0d                                  ; [3]:
    db $0e                                  ; [4]:
    db $0e                                  ; [5]:
    db $0f                                  ; [6]:
    db $0f                                  ; [7]:
    db $10                                  ; [8]:
    db $10                                  ; [9]:
    db $11                                  ; [10]:
    db $11                                  ; [11]:
    db $12                                  ; [12]:
    db $13                                  ; [13]:
    db $14                                  ; [14]:
    db $13                                  ; [15]:
    db $15                                  ; [16]:
    db $16                                  ; [17]:
    db $17                                  ; [18]:
    db $16                                  ; [19]:


;============================================================================
; TODO: Document SplashAnimation_A90F
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     A
;
; XREFS:
;     SplashAnimation_Maybe_AnimPlayerStep
;     SplashAnimation_OutroFuncAF82
;============================================================================
SplashAnimation_A90F:                       ; [$a90f]
    LDA a:ScreenBuffer_142_
    STA a:ScreenBuffer_137_
    LDA a:ScreenBuffer_143_
    STA a:ScreenBuffer_138_
    LDA a:ScreenBuffer_140_
    INC a:ScreenBuffer_140_
    LSR A
    LSR A
    LSR A
    LSR A
    AND #$03
    STA Temp_Int24
    LDA a:IntroAnimation_PlayerSizeCounter
    ASL A
    ASL A
    ORA Temp_Int24
    TAX
    RTS


;============================================================================
; TODO: Document SplashAnimation_RunOutro
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     IScriptAction_FinishGame
;============================================================================
SplashAnimation_RunOutro:                   ; [$a932]
    LDA #$01
    JSR SplashAnimation_DrawScenery
    JSR Maybe_SplashAnimation_InitOutroState
    JSR SplashAnimation_Something_A99C
    LDA #$0c
    STA CurrentMusic
    JSR #$cb27

  @LAB_PRG12__a944:                         ; [$a944]
    JSR #$ca25
    JSR #$cb4f
    JSR SplashAnimation_SomethingUpdateState
    JSR SplashAnimation_Maybe_CalcPlayerAnimSize
    JSR SplashAnimation_OutroFuncAF82
    JSR SplashAnimation_SomethingOutroA9C9
    JSR SplashAnimation_SomethingA9F2
    JSR SplashAnimation_SomethingOutroUpdate
    LDA a:ScreenBuffer_143_
    CMP #$fa
    BCC @LAB_PRG12__a944

  @LAB_PRG12__a963:                         ; [$a963]
    JSR #$ca25
    JSR #$cb4f
    JSR SplashAnimation_SomethingUpdateState
    JSR SplashAnimation_SomethingOutroA9C9
    JSR SplashAnimation_SomethingA9F2
    JSR SplashAnimation_SomethingOutroUpdate
    LDA CurrentMusic
    BNE @LAB_PRG12__a963
    LDA #$10
    STA InterruptCounter

  @LAB_PRG12__a97d:                         ; [$a97d]
    JSR #$ca25
    JSR #$cb4f
    JSR SplashAnimation_SomethingUpdateState
    JSR SplashAnimation_SomethingOutroA9C9
    JSR SplashAnimation_SomethingA9F2
    JSR SplashAnimation_SomethingOutroUpdate
    LDA InterruptCounter
    BNE @LAB_PRG12__a97d
    RTS

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a994:                     ; [$a994]
    db $d8                                  ; [0]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a994_1_:                  ; [$a995]
    db $e0                                  ; [1]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a996:                     ; [$a996]
    db $c2                                  ; [0]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a996_1_:                  ; [$a997]
    db $d0                                  ; [1]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a998:                     ; [$a998]
    db $ff                                  ; [0]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a998_1_:                  ; [$a999]
    db $ff                                  ; [1]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a99a:                     ; [$a99a]
    db $00                                  ; [0]:

;
; XREFS:
;     FUN_PRG12__a9a2
;
BYTE_ARRAY_PRG12__a99a_1_:                  ; [$a99b]
    db $01                                  ; [1]:


;============================================================================
; TODO: Document SplashAnimation_Something_A99C
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_Something_A99C:             ; [$a99c]
    LDX #$00
    JSR FUN_PRG12__a9a2
    INX

    ;
    ; v-- Fall through --v
    ;


;============================================================================
; TODO: Document FUN_PRG12__a9a2
;
; INPUTS:
;     X
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_Something_A99C
;============================================================================
FUN_PRG12__a9a2:                            ; [$a9a2]
    LDA #$00
    STA #$0694,X
    STA #$0696,X
    STA #$069c,X
    STA #$069e,X
    LDA #$a994,X
    STA #$0698,X
    LDA #$a996,X
    STA #$069a,X
    LDA #$a998,X
    STA #$06a0,X
    LDA #$a99a,X
    STA #$06a2,X
    RTS


;============================================================================
; TODO: Document SplashAnimation_SomethingOutroA9C9
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_SomethingOutroA9C9:         ; [$a9c9]
    LDX #$00
    JSR @LAB_PRG12__a9cf
    INX

  @LAB_PRG12__a9cf:                         ; [$a9cf]
    LDY #$01
    JSR FUN_PRG12__aa20
    LDY #$01
    JSR FUN_PRG12__aa46
    LDY #$0696,X
    INY
    CPY #$08
    BNE @LAB_PRG12__a9ed
    INC #$0694,X
    LDA #$0694,X
    CMP #$0a
    BEQ FUN_PRG12__a9a2
    LDY #$00

  @LAB_PRG12__a9ed:                         ; [$a9ed]
    TYA
    STA #$0696,X

RETURN_A9F1:                                ; [$a9f1]
    RTS


;============================================================================
; TODO: Document SplashAnimation_SomethingA9F2
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_SomethingA9F2:              ; [$a9f2]
    LDX #$00
    JSR @LAB_PRG12__a9f8
    INX

  @LAB_PRG12__a9f8:                         ; [$a9f8]
    LDA #$0694,X
    CMP #$03
    BCS RETURN_A9F1
    LDA #$0698,X
    STA a:ScreenBuffer_137_
    LDA #$069a,X
    STA a:ScreenBuffer_138_
    TXA
    ASL A
    ASL A
    ORA #$0694,X
    TAY
    LDA #$aa18,Y
    JMP SplashAnimation_FuncAA94

BYTE_ARRAY_PRG12__aa18:                     ; [$aa18]
    db $1a                                  ; [0]:
    db $1b                                  ; [1]:
    db $1c                                  ; [2]:
    db $00                                  ; [3]:
    db $1d                                  ; [4]:
    db $1e                                  ; [5]:
    db $1f                                  ; [6]:
    db $00                                  ; [7]:


;============================================================================
; TODO: Document FUN_PRG12__aa20
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG12__aa20:                            ; [$aa20]
    LDA #$00
    STA Temp_Int24
    LDA #$06a0,X

  @LAB_PRG12__aa27:                         ; [$aa27]
    STA Temp_Int24.M
    ROL Temp_Int24.M
    ROR A
    ROR Temp_Int24
    DEY
    BNE @LAB_PRG12__aa27
    CLC
    STA Temp_Int24.M
    LDA Temp_Int24
    CLC
    ADC #$069c,X
    STA #$069c,X
    LDA Temp_Int24.M
    ADC #$0698,X
    STA #$0698,X
    RTS


;============================================================================
; TODO: Document FUN_PRG12__aa46
;
; INPUTS:
;     X
;     Y
;
; OUTPUTS:
;     TODO
;============================================================================
FUN_PRG12__aa46:                            ; [$aa46]
    LDA #$00
    STA Temp_Int24
    LDA #$06a2,X

  @LAB_PRG12__aa4d:                         ; [$aa4d]
    STA Temp_Int24.M
    ROL Temp_Int24.M
    ROR A
    ROR Temp_Int24
    DEY
    BNE @LAB_PRG12__aa4d
    CLC
    STA Temp_Int24.M
    LDA Temp_Int24
    CLC
    ADC #$069e,X
    STA #$069e,X
    LDA Temp_Int24.M
    ADC #$069a,X
    STA #$069a,X
    RTS


;============================================================================
; TODO: Document SplashAnimation_SomethingOutroUpdate
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_SomethingOutroUpdate:       ; [$aa6c]
    LDA #$e0
    STA a:ScreenBuffer_137_
    LDA #$78
    STA a:ScreenBuffer_138_
    LDA InterruptCounter
    AND #$10
    LSR A
    LSR A
    LSR A
    LSR A
    ADC #$18
    JMP SplashAnimation_FuncAA94


;============================================================================
; TODO: Document SplashAnimation_SomethingUpdateState
;
; INPUTS:
;     None.
;
; OUTPUTS:
;     TODO
;
; XREFS:
;     SplashAnimation_RunIntro
;     SplashAnimation_RunOutro
;============================================================================
SplashAnimation_SomethingUpdateState:       ; [$aa83]
    LDX #$00
    LDA #$f0

  @LAB_PRG12__aa87:                         ; [$aa87]
    STA #$0700,X
    INX
    INX
    INX
    INX
    BNE @LAB_PRG12__aa87
    STX a:ScreenBuffer_136_
    RTS


;============================================================================
; TODO: Document SplashAnimation_FuncAA94
;
; INPUTS:
;     A
;     X
;
; OUTPUTS:
;     A
;
; XREFS:
;     SplashAnimation_Maybe_AnimPlayerStep
;     SplashAnimation_OutroFuncAF82
;     SplashAnimation_SomethingOutroUpdate
;============================================================================
SplashAnimation_FuncAA94:                   ; [$aa94]
    TAY
    LDA #$ab17,Y
    STA Temp_Int24
    LDA #$ab37,Y
    STA Temp_Int24.M
    LDY #$00
    LDA a:ScreenBuffer_137_
    CLC
    ADC (Temp_Int24),Y
    STA a:ScreenBuffer_137_
    INY
    LDA a:ScreenBuffer_138_
    CLC
    ADC (Temp_Int24),Y
    CMP #$f0
    BCS @_return
    STA a:ScreenBuffer_138_
    INY
    LDA (Temp_Int24),Y
    STA a:ScreenBuffer_139_
    INY
    LDA (Temp_Int24),Y
    STA TextBox_TextY
    INY
    TXA
    PHA
    LDX a:ScreenBuffer_136_

  @LAB_PRG12__aac9:                         ; [$aac9]
    LDA a:ScreenBuffer_139_
    STA Temp_Int24.U
    LDA a:ScreenBuffer_137_
    STA TextBox_TextX

  @LAB_PRG12__aad3:                         ; [$aad3]
    LDA (Temp_Int24),Y
    INY
    CMP #$ff
    BEQ @LAB_PRG12__aaf9
    STA #$0701,X
    LDA a:ScreenBuffer_138_
    CMP #$f0
    BCS @LAB_PRG12__ab11
    LDA a:ScreenBuffer_138_
    STA #$0700,X
    LDA (Temp_Int24),Y
    INY
    STA #$0702,X
    LDA TextBox_TextX
    STA #$0703,X
    INX
    INX
    INX
    INX

  @LAB_PRG12__aaf9:                         ; [$aaf9]
    LDA TextBox_TextX
    CLC
    ADC #$08
    STA TextBox_TextX
    DEC Temp_Int24.U
    BNE @LAB_PRG12__aad3
    LDA a:ScreenBuffer_138_
    CLC
    ADC #$08
    STA a:ScreenBuffer_138_
    DEC TextBox_TextY
    BNE @LAB_PRG12__aac9

  @LAB_PRG12__ab11:                         ; [$ab11]
    STX a:ScreenBuffer_136_
    PLA
    TAX

  @_return:                                 ; [$ab16]
    RTS

;
; XREFS:
;     SplashAnimation_FuncAA94
;
BYTE_ARRAY_PRG12__ab17:                     ; [$ab17]
    db $57                                  ; [0]:
    db $6f                                  ; [1]:
    db $87                                  ; [2]:
    db $9f                                  ; [3]:
    db $b3                                  ; [4]:
    db $c7                                  ; [5]:
    db $db                                  ; [6]:
    db $eb                                  ; [7]:
    db $fb                                  ; [8]:
    db $05                                  ; [9]:
    db $0f                                  ; [10]:
    db $17                                  ; [11]:
    db $1f                                  ; [12]:
    db $27                                  ; [13]:
    db $2f                                  ; [14]:
    db $39                                  ; [15]:
    db $43                                  ; [16]:
    db $53                                  ; [17]:
    db $63                                  ; [18]:
    db $77                                  ; [19]:
    db $8b                                  ; [20]:
    db $9f                                  ; [21]:
    db $b7                                  ; [22]:
    db $cf                                  ; [23]:
    db $e7                                  ; [24]:
    db $26                                  ; [25]:
    db $65                                  ; [26]:
    db $6b                                  ; [27]:
    db $71                                  ; [28]:
    db $77                                  ; [29]:
    db $7d                                  ; [30]:
    db $83                                  ; [31]:

;
; XREFS:
;     SplashAnimation_FuncAA94
;
BYTE_ARRAY_PRG12__ab37:                     ; [$ab37]
    db $ab                                  ; [0]:
    db $ab                                  ; [1]:
    db $ab                                  ; [2]:
    db $ab                                  ; [3]:
    db $ab                                  ; [4]:
    db $ab                                  ; [5]:
    db $ab                                  ; [6]:
    db $ab                                  ; [7]:
    db $ab                                  ; [8]:
    db $ac                                  ; [9]:
    db $ac                                  ; [10]:
    db $ac                                  ; [11]:
    db $ac                                  ; [12]:
    db $ac                                  ; [13]:
    db $ac                                  ; [14]:
    db $ac                                  ; [15]:
    db $ac                                  ; [16]:
    db $ac                                  ; [17]:
    db $ac                                  ; [18]:
    db $ac                                  ; [19]:
    db $ac                                  ; [20]:
    db $ac                                  ; [21]:
    db $ac                                  ; [22]:
    db $ac                                  ; [23]:
    db $ac                                  ; [24]:
    db $ad                                  ; [25]:
    db $ad                                  ; [26]:
    db $ad                                  ; [27]:
    db $ad                                  ; [28]:
    db $ad                                  ; [29]:
    db $ad                                  ; [30]:
    db $ad                                  ; [31]:
    db $f8                                  ; [0]:
    db $ec                                  ; [1]:
    db $02                                  ; [2]:
    db $05                                  ; [3]:
    db $46                                  ; [4]:
    db $00                                  ; [5]:
    db $47                                  ; [6]:
    db $00                                  ; [7]:
    db $48                                  ; [8]:
    db $00                                  ; [9]:
    db $49                                  ; [10]:
    db $00                                  ; [11]:
    db $4a                                  ; [12]:
    db $00                                  ; [13]:
    db $4b                                  ; [14]:
    db $00                                  ; [15]:
    db $4c                                  ; [16]:
    db $00                                  ; [17]:
    db $4d                                  ; [18]:
    db $00                                  ; [19]:
    db $4e                                  ; [20]:
    db $00                                  ; [21]:
    db $4f                                  ; [22]:
    db $00                                  ; [23]:
    db $f8                                  ; [0]:
    db $ec                                  ; [1]:
    db $02                                  ; [2]:
    db $05                                  ; [3]:
    db $50                                  ; [4]:
    db $00                                  ; [5]:
    db $51                                  ; [6]:
    db $00                                  ; [7]:
    db $52                                  ; [8]:
    db $00                                  ; [9]:
    db $53                                  ; [10]:
    db $00                                  ; [11]:
    db $54                                  ; [12]:
    db $00                                  ; [13]:
    db $55                                  ; [14]:
    db $00                                  ; [15]:
    db $56                                  ; [16]:
    db $00                                  ; [17]:
    db $57                                  ; [18]:
    db $00                                  ; [19]:
    db $58                                  ; [20]:
    db $00                                  ; [21]:
    db $59                                  ; [22]:
    db $00                                  ; [23]:
    db $f8                                  ; [0]:
    db $ec                                  ; [1]:
    db $02                                  ; [2]:
    db $05                                  ; [3]:
    db $46                                  ; [4]:
    db $00                                  ; [5]:
    db $47                                  ; [6]:
    db $00                                  ; [7]:
    db $5a                                  ; [8]:
    db $00                                  ; [9]:
    db $5b                                  ; [10]:
    db $00                                  ; [11]:
    db $5c                                  ; [12]:
    db $00                                  ; [13]:
    db $5d                                  ; [14]:
    db $00                                  ; [15]:
    db $5e                                  ; [16]:
    db $00                                  ; [17]:
    db $5f                                  ; [18]:
    db $00                                  ; [19]:
    db $60                                  ; [20]:
    db $00                                  ; [21]:
    db $61                                  ; [22]:
    db $00                                  ; [23]:
    db $f8                                  ; [0]:
    db $f0                                  ; [1]:
    db $02                                  ; [2]:
    db $04                                  ; [3]:
    db $62                                  ; [4]:
    db $00                                  ; [5]:
    db $63                                  ; [6]:
    db $00                                  ; [7]:
    db $64                                  ; [8]:
    db $00                                  ; [9]:
    db $65                                  ; [10]:
    db $00                                  ; [11]:
    db $66                                  ; [12]:
    db $00                                  ; [13]:
    db $67                                  ; [14]:
    db $00                                  ; [15]:
    db $68                                  ; [16]:
    db $00                                  ; [17]:
    db $69                                  ; [18]:
    db $00                                  ; [19]:
    db $f8                                  ; [0]:
    db $f0                                  ; [1]:
    db $02                                  ; [2]:
    db $04                                  ; [3]:
    db $62                                  ; [4]:
    db $00                                  ; [5]:
    db $63                                  ; [6]:
    db $00                                  ; [7]:
    db $70                                  ; [8]:
    db $00                                  ; [9]:
    db $71                                  ; [10]:
    db $00                                  ; [11]:
    db $72                                  ; [12]:
    db $00                                  ; [13]:
    db $73                                  ; [14]:
    db $00                                  ; [15]:
    db $74                                  ; [16]:
    db $00                                  ; [17]:
    db $75                                  ; [18]:
    db $00                                  ; [19]:
    db $f8                                  ; [0]:
    db $f0                                  ; [1]:
    db $02                                  ; [2]:
    db $04                                  ; [3]:
    db $62                                  ; [4]:
    db $00                                  ; [5]:
    db $63                                  ; [6]:
    db $00                                  ; [7]:
    db $6a                                  ; [8]:
    db $00                                  ; [9]:
    db $6b                                  ; [10]:
    db $00                                  ; [11]:
    db $6c                                  ; [12]:
    db $00                                  ; [13]:
    db $6d                                  ; [14]:
    db $00                                  ; [15]:
    db $6e                                  ; [16]:
    db $00                                  ; [17]:
    db $6f                                  ; [18]:
    db $00                                  ; [19]:
    db $f8                                  ; [0]:
    db $f4                                  ; [1]:
    db $02                                  ; [2]:
    db $03                                  ; [3]:
    db $76                                  ; [4]:
    db $00                                  ; [5]:
    db $77                                  ; [6]:
    db $00                                  ; [7]:
    db $78                                  ; [8]:
    db $00                                  ; [9]:
    db $79                                  ; [10]:
    db $00                                  ; [11]:
    db $34                                  ; [12]:
    db $00                                  ; [13]:
    db $7b                                  ; [14]:
    db $00                                  ; [15]:
    db $f8                                  ; [0]:
    db $f4                                  ; [1]:
    db $02                                  ; [2]:
    db $03                                  ; [3]:
    db $76                                  ; [4]:
    db $00                                  ; [5]:
    db $77                                  ; [6]:
    db $00                                  ; [7]:
    db $7c                                  ; [8]:
    db $00                                  ; [9]:
    db $7d                                  ; [10]:
    db $00                                  ; [11]:
    db $3a                                  ; [12]:
    db $00                                  ; [13]:
    db $7f                                  ; [14]:
    db $00                                  ; [15]:
    db $fc                                  ; [0]:
    db $f4                                  ; [1]:
    db $01                                  ; [2]:
    db $03                                  ; [3]:
    db $36                                  ; [4]:
    db $00                                  ; [5]:
    db $3d                                  ; [6]:
    db $00                                  ; [7]:
    db $3e                                  ; [8]:
    db $00                                  ; [9]:
    db $fc                                  ; [0]:
    db $f4                                  ; [1]:
    db $01                                  ; [2]:
    db $03                                  ; [3]:
    db $37                                  ; [4]:
    db $00                                  ; [5]:
    db $40                                  ; [6]:
    db $00                                  ; [7]:
    db $41                                  ; [8]:
    db $00                                  ; [9]:
    db $fc                                  ; [0]:
    db $f8                                  ; [1]:
    db $01                                  ; [2]:
    db $02                                  ; [3]:
    db $7a                                  ; [4]:
    db $00                                  ; [5]:
    db $43                                  ; [6]:
    db $00                                  ; [7]:
    db $fc                                  ; [0]:
    db $f8                                  ; [1]:
    db $01                                  ; [2]:
    db $02                                  ; [3]:
    db $7e                                  ; [4]:
    db $00                                  ; [5]:
    db $45                                  ; [6]:
    db $00                                  ; [7]:
    db $fc                                  ; [0]:
    db $f8                                  ; [1]:
    db $01                                  ; [2]:
    db $02                                  ; [3]:
    db $42                                  ; [4]:
    db $00                                  ; [5]:
    db $43                                  ; [6]:
    db $00                                  ; [7]:
    db $fc                                  ; [0]:
    db $f8                                  ; [1]:
    db $01                                  ; [2]:
    db $02                                  ; [3]:
    db $44                                  ; [4]:
    db $00                                  ; [5]:
    db $45                                  ; [6]:
    db $00                                  ; [7]:
    db $fc                                  ; [0]:
    db $f4                                  ; [1]:
    db $01                                  ; [2]:
    db $03                                  ; [3]:
    db $3c                                  ; [4]:
    db $00                                  ; [5]:
    db $3d                                  ; [6]:
    db $00                                  ; [7]:
    db $3e                                  ; [8]:
    db $00                                  ; [9]:
    db $fc                                  ; [0]:
    db $f4                                  ; [1]:
    db $01                                  ; [2]:
    db $03                                  ; [3]:
    db $3f                                  ; [4]:
    db $00                                  ; [5]:
    db $40                                  ; [6]:
    db $00                                  ; [7]:
    db $41                                  ; [8]:
    db $00                                  ; [9]:
    db $f8                                  ; [0]:
    db $f4                                  ; [1]:
    db $02                                  ; [0]:
    db $03                                  ; [1]:
    db $30                                  ; [2]:
    db $00                                  ; [3]:
    db $31                                  ; [4]:
    db $00                                  ; [5]:
    db $32                                  ; [6]:
    db $00                                  ; [7]:
    db $33                                  ; [8]:
    db $00                                  ; [9]:
    db $34                                  ; [10]:
    db $00                                  ; [11]:
    db $35                                  ; [12]:
    db $00                                  ; [13]:
    db $f8                                  ; [0]:
    db $f4                                  ; [1]:
    db $02                                  ; [2]:
    db $03                                  ; [3]:
    db $30                                  ; [4]:
    db $00                                  ; [5]:
    db $31                                  ; [6]:
    db $00                                  ; [7]:
    db $38                                  ; [8]:
    db $00                                  ; [9]:
    db $39                                  ; [10]:
    db $00                                  ; [11]:
    db $3a                                  ; [12]:
    db $00                                  ; [13]:
    db $3b                                  ; [14]:
    db $00                                  ; [15]:
    db $f8                                  ; [0]:
    db $f0                                  ; [1]:
    db $02                                  ; [2]:
    db $04                                  ; [3]:
    db $1c                                  ; [4]:
    db $00                                  ; [5]:
    db $1d                                  ; [6]:
    db $00                                  ; [7]:
    db $1e                                  ; [8]:
    db $00                                  ; [9]:
    db $1f                                  ; [10]:
    db $00                                  ; [11]:
    db $20                                  ; [12]:
    db $00                                  ; [13]:
    db $21                                  ; [14]:
    db $00                                  ; [15]:
    db $22                                  ; [16]:
    db $00                                  ; [17]:
    db $23                                  ; [18]:
    db $00                                  ; [19]:
    db $f8                                  ; [0]:
    db $f0                                  ; [1]:
    db $02                                  ; [2]:
    db $04                                  ; [3]:
    db $1c                                  ; [4]:
    db $00                                  ; [5]:
    db $1d                                  ; [6]:
    db $00                                  ; [7]:
    db $2a                                  ; [8]:
    db $00                                  ; [9]:
    db $2b                                  ; [10]:
    db $00                                  ; [11]:
    db $2c                                  ; [12]:
    db $00                                  ; [13]:
    db $2d                                  ; [14]:
    db $00                                  ; [15]:
    db $2e                                  ; [16]:
    db $00                                  ; [17]:
    db $2f                                  ; [18]:
    db $00                                  ; [19]:
    db $f8                                  ; [0]:
    db $f0                                  ; [1]:
    db $02                                  ; [2]:
    db $04                                  ; [3]:
    db $1c                                  ; [4]:
    db $00                                  ; [5]:
    db $1d                                  ; [6]:
    db $00                                  ; [7]:
    db $24                                  ; [8]:
    db $00                                  ; [9]:
    db $25                                  ; [10]:
    db $00                                  ; [11]:
    db $26                                  ; [12]:
    db $00                                  ; [13]:
    db $27                                  ; [14]:
    db $00                                  ; [15]:
    db $28                                  ; [16]:
    db $00                                  ; [17]:
    db $29                                  ; [18]:
    db $00                                  ; [19]:
    db $f8                                  ; [0]:
    db $ec                                  ; [1]:
    db $02                                  ; [2]:
    db $05                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $01                                  ; [6]:
    db $00                                  ; [7]:
    db $02                                  ; [8]:
    db $00                                  ; [9]:
    db $03                                  ; [10]:
    db $00                                  ; [11]:
    db $04                                  ; [12]:
    db $00                                  ; [13]:
    db $05                                  ; [14]:
    db $00                                  ; [15]:
    db $06                                  ; [16]:
    db $00                                  ; [17]:
    db $07                                  ; [18]:
    db $00                                  ; [19]:
    db $08                                  ; [20]:
    db $00                                  ; [21]:
    db $09                                  ; [22]:
    db $00                                  ; [23]:
    db $f8                                  ; [0]:
    db $ec                                  ; [1]:
    db $02                                  ; [2]:
    db $05                                  ; [3]:
    db $0a                                  ; [4]:
    db $00                                  ; [5]:
    db $0b                                  ; [6]:
    db $00                                  ; [7]:
    db $0c                                  ; [8]:
    db $00                                  ; [9]:
    db $0d                                  ; [10]:
    db $00                                  ; [11]:
    db $0e                                  ; [12]:
    db $00                                  ; [13]:
    db $0f                                  ; [14]:
    db $00                                  ; [15]:
    db $10                                  ; [16]:
    db $00                                  ; [17]:
    db $11                                  ; [18]:
    db $00                                  ; [19]:
    db $12                                  ; [20]:
    db $00                                  ; [21]:
    db $13                                  ; [22]:
    db $00                                  ; [23]:
    db $f8                                  ; [0]:
    db $ec                                  ; [1]:
    db $02                                  ; [2]:
    db $05                                  ; [3]:
    db $00                                  ; [4]:
    db $00                                  ; [5]:
    db $01                                  ; [6]:
    db $00                                  ; [7]:
    db $14                                  ; [8]:
    db $00                                  ; [9]:
    db $15                                  ; [10]:
    db $00                                  ; [11]:
    db $16                                  ; [12]:
    db $00                                  ; [13]:
    db $17                                  ; [14]:
    db $00                                  ; [15]:
    db $18                                  ; [16]:
    db $00                                  ; [17]:
    db $19                                  ; [18]:
    db $00                                  ; [19]:
    db $1a                                  ; [20]:
    db $00                                  ; [21]:
    db $1b                                  ; [22]:
    db $00                                  ; [23]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $04                                  ; [2]:
    db $0b                                  ; [3]:
    db $ff                                  ; [4]:
    db $80                                  ; [5]:
    db $01                                  ; [6]:
    db $83                                  ; [7]:
    db $01                                  ; [8]:
    db $83                                  ; [9]:
    db $01                                  ; [10]:
    db $ff                                  ; [11]:
    db $81                                  ; [12]:
    db $01                                  ; [13]:
    db $8e                                  ; [14]:
    db $01                                  ; [15]:
    db $ff                                  ; [16]:
    db $ff                                  ; [17]:
    db $81                                  ; [18]:
    db $01                                  ; [19]:
    db $ff                                  ; [20]:
    db $ff                                  ; [21]:
    db $ff                                  ; [22]:
    db $81                                  ; [23]:
    db $01                                  ; [24]:
    db $ff                                  ; [25]:
    db $ff                                  ; [26]:
    db $ff                                  ; [27]:
    db $81                                  ; [28]:
    db $01                                  ; [29]:
    db $ff                                  ; [30]:
    db $ff                                  ; [31]:
    db $ff                                  ; [32]:
    db $81                                  ; [33]:
    db $01                                  ; [34]:
    db $ff                                  ; [35]:
    db $ff                                  ; [36]:
    db $ff                                  ; [37]:
    db $81                                  ; [38]:
    db $01                                  ; [39]:
    db $ff                                  ; [40]:
    db $ff                                  ; [41]:
    db $ff                                  ; [42]:
    db $81                                  ; [43]:
    db $01                                  ; [44]:
    db $ff                                  ; [45]:
    db $ff                                  ; [46]:
    db $ff                                  ; [47]:
    db $81                                  ; [48]:
    db $01                                  ; [49]:
    db $ff                                  ; [50]:
    db $ff                                  ; [51]:
    db $84                                  ; [52]:
    db $01                                  ; [53]:
    db $85                                  ; [54]:
    db $01                                  ; [55]:
    db $ff                                  ; [56]:
    db $ff                                  ; [57]:
    db $ff                                  ; [58]:
    db $8f                                  ; [59]:
    db $01                                  ; [60]:
    db $ff                                  ; [61]:
    db $ff                                  ; [62]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $04                                  ; [2]:
    db $0b                                  ; [3]:
    db $ff                                  ; [4]:
    db $82                                  ; [5]:
    db $01                                  ; [6]:
    db $83                                  ; [7]:
    db $81                                  ; [8]:
    db $83                                  ; [9]:
    db $81                                  ; [10]:
    db $ff                                  ; [11]:
    db $81                                  ; [12]:
    db $41                                  ; [13]:
    db $8e                                  ; [14]:
    db $01                                  ; [15]:
    db $ff                                  ; [16]:
    db $ff                                  ; [17]:
    db $81                                  ; [18]:
    db $41                                  ; [19]:
    db $ff                                  ; [20]:
    db $ff                                  ; [21]:
    db $ff                                  ; [22]:
    db $81                                  ; [23]:
    db $41                                  ; [24]:
    db $ff                                  ; [25]:
    db $ff                                  ; [26]:
    db $ff                                  ; [27]:
    db $81                                  ; [28]:
    db $41                                  ; [29]:
    db $ff                                  ; [30]:
    db $ff                                  ; [31]:
    db $ff                                  ; [32]:
    db $81                                  ; [33]:
    db $41                                  ; [34]:
    db $ff                                  ; [35]:
    db $ff                                  ; [36]:
    db $ff                                  ; [37]:
    db $81                                  ; [38]:
    db $41                                  ; [39]:
    db $ff                                  ; [40]:
    db $ff                                  ; [41]:
    db $ff                                  ; [42]:
    db $81                                  ; [43]:
    db $41                                  ; [44]:
    db $ff                                  ; [45]:
    db $ff                                  ; [46]:
    db $ff                                  ; [47]:
    db $81                                  ; [48]:
    db $41                                  ; [49]:
    db $ff                                  ; [50]:
    db $ff                                  ; [51]:
    db $86                                  ; [52]:
    db $01                                  ; [53]:
    db $87                                  ; [54]:
    db $41                                  ; [55]:
    db $ff                                  ; [56]:
    db $ff                                  ; [57]:
    db $ff                                  ; [58]:
    db $8f                                  ; [59]:
    db $41                                  ; [60]:
    db $ff                                  ; [61]:
    db $ff                                  ; [62]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $01                                  ; [2]:
    db $01                                  ; [3]:
    db $88                                  ; [4]:
    db $01                                  ; [5]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $01                                  ; [2]:
    db $01                                  ; [3]:
    db $89                                  ; [4]:
    db $01                                  ; [5]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $01                                  ; [2]:
    db $01                                  ; [3]:
    db $8a                                  ; [4]:
    db $01                                  ; [5]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $01                                  ; [2]:
    db $01                                  ; [3]:
    db $8b                                  ; [4]:
    db $01                                  ; [5]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $01                                  ; [2]:
    db $01                                  ; [3]:
    db $8c                                  ; [4]:
    db $01                                  ; [5]:
    db $00                                  ; [0]:
    db $00                                  ; [1]:
    db $01                                  ; [2]:
    db $01                                  ; [3]:
    db $8d                                  ; [4]:
    db $01                                  ; [5]:
    db $80                                  ; [6]:
    db $ff                                  ; [7]:
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adbb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adcb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$addb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adfb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aeab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aebb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aecb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aedb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aeeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aefb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afbb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afcb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afdb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$affb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b00b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b01b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b02b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b03b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b04b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b05b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b06b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b07b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b08b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b09b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b10b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b11b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b12b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b13b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b14b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b15b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b16b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b17b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b18b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b19b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b20b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b21b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b22b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b23b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b24b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b25b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b26b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b27b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b28b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b29b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b30b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b31b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b32b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b33b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b34b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b35b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b36b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b37b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b38b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b39b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b40b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b41b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b42b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b43b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b44b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b45b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b46b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b47b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b48b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b49b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b50b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b51b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b52b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b53b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b54b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b55b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b56b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b57b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b58b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b59b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b60b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b61b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b62b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b63b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b64b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b65b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b66b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b67b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b68b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b69b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b70b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b71b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b72b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b73b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b74b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b75b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b76b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b77b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b78b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b79b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b80b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b81b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b82b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b83b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b84b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b85b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b86b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b87b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b88b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b89b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b90b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b91b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b92b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b93b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b94b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b95b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b96b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b97b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b98b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b99b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9ab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9bb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9cb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9db] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9eb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9fb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$babb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bacb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$badb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bafb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbbb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbcb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbdb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbfb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcbb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bccb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcdb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bceb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcfb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdbb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdcb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bddb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdfb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bebb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$becb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bedb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beeb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$befb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf0b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf1b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf2b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf3b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf4b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf5b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf6b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf7b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf8b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf9b] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfab] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfbb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfcb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfdb] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfeb] undefined
    db $ff,$ff,$ff,$ff,$ff                  ; [$bffb] undefined
