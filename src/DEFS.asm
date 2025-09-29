
;============================================================================
; Area
;============================================================================
AREA_EOLIS                                         EQU $00
AREA_APOLUNE                                       EQU $01
AREA_FOREPAW                                       EQU $02
AREA_MASCON                                        EQU $03
AREA_VICTIM                                        EQU $04
AREA_CONFLATE                                      EQU $05
AREA_DAYBREAK                                      EQU $06
AREA_EVIL_FORTRESS                                 EQU $07

;============================================================================
; AreasRegion
;============================================================================
REGION_EOLIS                                       EQU $00
REGION_TRUNK                                       EQU $01
REGION_MIST                                        EQU $02
REGION_BRANCH                                      EQU $03
REGION_DARTMOOR                                    EQU $04
REGION_EVIL_FORTRESS                               EQU $05

;============================================================================
; ArmorInventory
;============================================================================
ARMORINVENTORY_LEATHER                             EQU $00
ARMORINVENTORY_STUDDED_MAIL                        EQU $01
ARMORINVENTORY_FULL_PLATE                          EQU $02
ARMORINVENTORY_BATTLE_SUIT                         EQU $03

;============================================================================
; BlockProperty
;============================================================================
BLOCK_IS_AIR                                       EQU $00
BLOCK_IS_SOLID                                     EQU $01
BLOCK_IS_LADDER                                    EQU $02
BLOCK_IS_DOOR                                      EQU $03
BLOCK_FG_0x04                                      EQU $04
BLOCK_0x05                                         EQU $05
BLOCK_PUSHABLE                                     EQU $06
BLOCK_0x07                                         EQU $07
BLOCK_0x08                                         EQU $08
BLOCK_FG_0x09                                      EQU $09
BLOCK_MAYBE_SOMETHING_CLIMBABLE                    EQU $0a
BLOCK_0x0b                                         EQU $0b
BLOCK_AREA_TRANSITION_L2R                          EQU $0c
BLOCK_AREA_TRANSITION_R2L                          EQU $0d
BLOCK_0x0e                                         EQU $0e
BLOCK_LOWER_NIBBLE                                 EQU $0f
BLOCK_UPPER_NIBBLE                                 EQU $f0

;============================================================================
; ButtonBitmask
;============================================================================
BUTTON_BIT_NONE                                    EQU $00
BUTTON_BIT_RIGHT                                   EQU $01
BUTTON_BIT_LEFT                                    EQU $02
BUTTON_BIT_DOWN                                    EQU $04
BUTTON_BIT_UP                                      EQU $08
BUTTON_BITS_DPAD                                   EQU $0f
BUTTON_BIT_START                                   EQU $10
BUTTON_BIT_SELECT                                  EQU $20
BUTTON_BIT_B                                       EQU $40
BUTTON_BIT_A                                       EQU $80

;============================================================================
; CastMagicFlags
;============================================================================
CAST_MAGIC_FLAGS_UNSET                             EQU $00
CAST_MAGIC_FACING_RIGHT                            EQU $40
CAST_MAGIC_CLEAR_FALLING                           EQU $7f
CAST_MAGIC_FALLING                                 EQU $80

;============================================================================
; FacingDirectionBit
;============================================================================
FACING_LEFT                                        EQU $00
FACING_RIGHT                                       EQU $40

;============================================================================
; Inventory
;============================================================================
INVENTORY_WEAPONS                                  EQU $00
INVENTORY_ARMOR                                    EQU $01
INVENTORY_SHIELD                                   EQU $02
INVENTORY_MAGIC                                    EQU $03
INVENTORY_SPECIAL                                  EQU $04

;============================================================================
; InventoryItem
;============================================================================
WEAPON_HAND_DAGGER                                 EQU $00
WEAPON_LONG_SWORD                                  EQU $01
WEAPON_GIANT_BLADE                                 EQU $02
WEAPON_DRAGON_SLAYER                               EQU $03
ARMOR_LEATHER                                      EQU $20
ARMOR_STUDDED_MAIL                                 EQU $21
ARMOR_FULL_PLATE                                   EQU $22
ARMOR_BATTLE_SUIT                                  EQU $23
SHIELD_SMALL                                       EQU $40
SHIELD_LARGE                                       EQU $41
SHIELD_MAGIC                                       EQU $42
SHIELD_BATTLE_HELMET                               EQU $43
MAGIC_DELUGE                                       EQU $60
MAGIC_THUNDER                                      EQU $61
MAGIC_FIRE                                         EQU $62
MAGIC_DEATH                                        EQU $63
MAGIC_TILTE                                        EQU $64
SPECIAL_RING_OF_ELF                                EQU $80
SPECIAL_RING_OF_RUBY                               EQU $81
SPECIAL_RING_OF_DWORF                              EQU $82
SPECIAL_DEMONS_RING                                EQU $83
KEY_A                                              EQU $84
KEY_K                                              EQU $85
KEY_Q                                              EQU $86
KEY_J                                              EQU $87
KEY_JO                                             EQU $88
MATTOCK                                            EQU $89
SPECIAL_MAGICAL_ROD                                EQU $8a
UNUSED_CRYSTAL                                     EQU $8b
UNUSED_LAMP                                        EQU $8c
ITEM_HOUR_GLASS                                    EQU $8d
UNUSED_BOOK                                        EQU $8e
ITEM_WING_BOOTS                                    EQU $8f
ITEM_RED_POTION                                    EQU $90
ITEM_POISON                                        EQU $91
SPECIAL_ELIXIR                                     EQU $92
SPECIAL_PENDANT                                    EQU $93
SPECIAL_BLACK_ONYX                                 EQU $94
SPECIAL_FIRE_CRYSTAL                               EQU $95

;============================================================================
; IScriptAction
;============================================================================
ISCRIPT_ACTION_END                                 EQU $00
ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE            EQU $01
ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE               EQU $02
ISCRIPT_ACTION_SHOW_MESSAGE                        EQU $03
ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE           EQU $04
ISCRIPT_ACTION_PAY_GOLD                            EQU $05
ISCRIPT_ACTION_SET_SPAWN_POINT                     EQU $06
ISCRIPT_ACTION_ADD_ITEM                            EQU $07
ISCRIPT_ACTION_OPEN_SHOP                           EQU $08
ISCRIPT_ACTION_ADD_GOLD                            EQU $09
ISCRIPT_ACTION_ADD_MP                              EQU $0a
ISCRIPT_ACTION_CHECK_QUEST                         EQU $0b
ISCRIPT_ACTION_CHECK_PLAYER_RANK                   EQU $0c
ISCRIPT_ACTION_CHECK_GOLD                          EQU $0d
ISCRIPT_ACTION_SET_QUEST_COMPLETE                  EQU $0e
ISCRIPT_ACTION_SHOW_BUY_SELL_MENU                  EQU $0f
ISCRIPT_ACTION_CONSUME_ITEM                        EQU $10
ISCRIPT_ACTION_SHOW_SELL_MENU                      EQU $11
ISCRIPT_ACTION_CHECK_FOR_ITEM                      EQU $12
ISCRIPT_ACTION_ADD_HP                              EQU $13
ISCRIPT_ACTION_SHOW_PASSWORD                       EQU $14
ISCRIPT_ACTION_END_GAME                            EQU $15
ISCRIPT_ACTION_22                                  EQU $16
ISCRIPT_ACTION_JUMP                                EQU $17

;============================================================================
; IScriptEntity
;============================================================================
ISCRIPT_ENTITY_GENERIC                             EQU $00
ISCRIPT_ENTITY_KING                                EQU $80
ISCRIPT_ENTITY_GURU                                EQU $81
ISCRIPT_ENTITY_MARTIAL_ARTIST                      EQU $82
ISCRIPT_ENTITY_MAGICIAN                            EQU $83
ISCRIPT_ENTITY_DOCTOR                              EQU $84
ISCRIPT_ENTITY_NURSE                               EQU $85
ISCRIPT_ENTITY_PINK_SHIRT_GUY                      EQU $86
ISCRIPT_ENTIY_SMOKING_GUY                          EQU $87
ISCRIPT_ENTITY_MEAT_SALESMAN                       EQU $88
ISCRIPT_ENTITY_TOOLS_SALESMAN                      EQU $89
ISCRIPT_ENTITY_KEY_SALESMAN                        EQU $8a

;============================================================================
; IScriptEntrypoint
;============================================================================
ISCRIPT_ENTRYPOINT_INTRO                           EQU $00
ISCRIPT_ENTRYPOINT_EOLIS_WALKING_MAN_1             EQU $01
ISCRIPT_ENTRYPOINT_MARK_OF_JACK                    EQU $02
ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_1           EQU $03
ISCRIPT_ENTRYPOINT_EOLIS_GURU                      EQU $04
ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_2           EQU $05
ISCRIPT_ENTRYPOINT_EOLIS_SMOKING_MAN               EQU $06
ISCRIPT_ENTRYPOINT_EOLIS_KINGS_GUARD               EQU $07
ISCRIPT_ENTRYPOINT_EOLIS_KING                      EQU $08
ISCRIPT_ENTRYPOINT_9                               EQU $09
ISCRIPT_ENTRYPOINT_10                              EQU $0a
ISCRIPT_ENTRYPOINT_EOLIS_MEAT_SHOP                 EQU $0b
ISCRIPT_ENTRYPOINT_EOLIS_KEY_SHOP                  EQU $0c
ISCRIPT_ENTRYPOINT_EOLIS_TOOL_SHOP                 EQU $0d
ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS_MAGIC_SHOP   EQU $0e
ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS              EQU $0f
ISCRIPT_ENTRYPOINT_16                              EQU $10
ISCRIPT_ENTRYPOINT_17                              EQU $11
ISCRIPT_ENTRYPOINT_18                              EQU $12
ISCRIPT_ENTRYPOINT_19                              EQU $13
ISCRIPT_ENTRYPOINT_20                              EQU $14
ISCRIPT_ENTRYPOINT_APOLUNE_DOCTOR                  EQU $15
ISCRIPT_ENTRYPOINT_22                              EQU $16
ISCRIPT_ENTRYPOINT_23                              EQU $17
ISCRIPT_ENTRYPOINT_24                              EQU $18
ISCRIPT_ENTRYPOINT_APOLUNE_TOOL_SHOP               EQU $19
ISCRIPT_ENTRYPOINT_APOLUNE_KEY_SHOP                EQU $1a
ISCRIPT_ENTRYPOINT_27                              EQU $1b
ISCRIPT_ENTRYPOINT_APOLUNE_GURU                    EQU $1c
ISCRIPT_ENTRYPOINT_BEFORE_APOLUNE_TOOL_SHOP        EQU $1d
ISCRIPT_ENTRYPOINT_30_INTRO                        EQU $1e
ISCRIPT_ENTRYPOINT_31_REMEMBER_YOUR_MANTRA         EQU $1f
ISCRIPT_ENTRYPOINT_32_FOREPAW_GREETER              EQU $20
ISCRIPT_ENTRYPOINT_33                              EQU $21
ISCRIPT_ENTRYPOINT_34                              EQU $22
ISCRIPT_ENTRYPOINT_35                              EQU $23
ISCRIPT_ENTRYPOINT_36                              EQU $24
ISCRIPT_ENTRYPOINT_37_SPRING_OF_SKY                EQU $25
ISCRIPT_ENTRYPOINT_38_SPRING_OF_TRUNK              EQU $26
ISCRIPT_ENTRYPOINT_39                              EQU $27
ISCRIPT_ENTRYPOINT_40_FOREPAW_TOOL_SHOP            EQU $28
ISCRIPT_ENTRYPOINT_41_FOREPAW_GURU                 EQU $29
ISCRIPT_ENTRYPOINT_42_FOREPAW_DOCTOR               EQU $2a
ISCRIPT_ENTRYPOINT_43_FOREPAW_KEY_SHOP             EQU $2b
ISCRIPT_ENTRYPOINT_44_FOREPAW_MEAT_SHOP            EQU $2c
ISCRIPT_ENTRYPOINT_45_INTRO                        EQU $2d
ISCRIPT_ENTRYPOINT_46_INTRO                        EQU $2e
ISCRIPT_ENTRYPOINT_47_INTRO                        EQU $2f
ISCRIPT_ENTRYPOINT_48                              EQU $30
ISCRIPT_ENTRYPOINT_49                              EQU $31
ISCRIPT_ENTRYPOINT_50                              EQU $32
ISCRIPT_ENTRYPOINT_51                              EQU $33
ISCRIPT_ENTRYPOINT_52                              EQU $34
ISCRIPT_ENTRYPOINT_53_OVERWORLD_MIST_HOUSE_MAN     EQU $35
ISCRIPT_ENTRYPOINT_54_OVERWORLD_MIST_HOUSE_WOMAN   EQU $36
ISCRIPT_ENTRYPOINT_55                              EQU $37
ISCRIPT_ENTRYPOINT_56_MASCON_DOCTOR                EQU $38
ISCRIPT_ENTRYPOINT_57_MASCON_TOOL_SHOP             EQU $39
ISCRIPT_ENTRYPOINT_58_MASCON_MEAT_SHOP             EQU $3a
ISCRIPT_ENTRYPOINT_59_MASCON_KEY_SHOP              EQU $3b
ISCRIPT_ENTRYPOINT_60_AFTER_MASCON_TOOL_SHOP       EQU $3c
ISCRIPT_ENTRYPOINT_61_MASCON_GURU                  EQU $3d
ISCRIPT_ENTRYPOINT_62_INTRO                        EQU $3e
ISCRIPT_ENTRYPOINT_63_INTRO                        EQU $3f
ISCRIPT_ENTRYPOINT_64                              EQU $40
ISCRIPT_ENTRYPOINT_65                              EQU $41
ISCRIPT_ENTRYPOINT_66                              EQU $42
ISCRIPT_ENTRYPOINT_67                              EQU $43
ISCRIPT_ENTRYPOINT_68                              EQU $44
ISCRIPT_ENTRYPOINT_69                              EQU $45
ISCRIPT_ENTRYPOINT_70                              EQU $46
ISCRIPT_ENTRYPOINT_71_VICTIM_DOCTOR                EQU $47
ISCRIPT_ENTRYPOINT_72_VICTIM_TOOL_SHOP             EQU $48
ISCRIPT_ENTRYPOINT_73_VICTIM_MEAT_SHOP             EQU $49
ISCRIPT_ENTRYPOINT_74_VICTIM_KEY_SHOP              EQU $4a
ISCRIPT_ENTRYPOINT_75_AFTER_VICTIM_MAGIC_SHOP      EQU $4b
ISCRIPT_ENTRYPOINT_76_VICTIM_GURU                  EQU $4c
ISCRIPT_ENTRYPOINT_77_INTRO                        EQU $4d
ISCRIPT_ENTRYPOINT_78_INTRO                        EQU $4e
ISCRIPT_ENTRYPOINT_79_INTRO                        EQU $4f
ISCRIPT_ENTRYPOINT_80                              EQU $50
ISCRIPT_ENTRYPOINT_81                              EQU $51
ISCRIPT_ENTRYPOINT_82                              EQU $52
ISCRIPT_ENTRYPOINT_83                              EQU $53
ISCRIPT_ENTRYPOINT_84                              EQU $54
ISCRIPT_ENTRYPOINT_85_CONFLATE_GURU                EQU $55
ISCRIPT_ENTRYPOINT_86_CONFLATE_DOCTOR              EQU $56
ISCRIPT_ENTRYPOINT_87_CONFLATE_TOOL_SHOP           EQU $57
ISCRIPT_ENTRYPOINT_88_CONFLATE_MEAT_SHOP           EQU $58
ISCRIPT_ENTRYPOINT_89_INTRO                        EQU $59
ISCRIPT_ENTRYPOINT_90_INTRO                        EQU $5a
ISCRIPT_ENTRYPOINT_91_INTRO                        EQU $5b
ISCRIPT_ENTRYPOINT_92_INTRO                        EQU $5c
ISCRIPT_ENTRYPOINT_93_INTRO                        EQU $5d
ISCRIPT_ENTRYPOINT_94_INTRO                        EQU $5e
ISCRIPT_ENTRYPOINT_95_INTRO                        EQU $5f
ISCRIPT_ENTRYPOINT_96                              EQU $60
ISCRIPT_ENTRYPOINT_97                              EQU $61
ISCRIPT_ENTRYPOINT_98                              EQU $62
ISCRIPT_ENTRYPOINT_99                              EQU $63
ISCRIPT_ENTRYPOINT_100                             EQU $64
ISCRIPT_ENTRYPOINT_101                             EQU $65
ISCRIPT_ENTRYPOINT_102_DAYBREAK_TOOL_SHOP          EQU $66
ISCRIPT_ENTRYPOINT_103_DAYBREAK_MEAT_SHOP          EQU $67
ISCRIPT_ENTRYPOINT_104_DAYBREAK_KEY_SHOP           EQU $68
ISCRIPT_ENTRYPOINT_105_DAYBREAK_GURU               EQU $69
ISCRIPT_ENTRYPOINT_106_INTRO                       EQU $6a
ISCRIPT_ENTRYPOINT_107_INTRO                       EQU $6b
ISCRIPT_ENTRYPOINT_108_INTRO                       EQU $6c
ISCRIPT_ENTRYPOINT_109_INTRO                       EQU $6d
ISCRIPT_ENTRYPOINT_110_INTRO                       EQU $6e
ISCRIPT_ENTRYPOINT_111_INTRO                       EQU $6f
ISCRIPT_ENTRYPOINT_112                             EQU $70
ISCRIPT_ENTRYPOINT_113_OVERWORLD_HOUSE_MAN         EQU $71
ISCRIPT_ENTRYPOINT_114_OVERWORLD_HOUSE_WOMAN       EQU $72
ISCRIPT_ENTRYPOINT_115                             EQU $73
ISCRIPT_ENTRYPOINT_116_FRATERNAL_GURU              EQU $74
ISCRIPT_ENTRYPOINT_117_DARTMOOR_TOOL_SHOP          EQU $75
ISCRIPT_ENTRYPOINT_118_DARTMOOR_MEAT_SHOP          EQU $76
ISCRIPT_ENTRYPOINT_119_DARTMOOR_KEY_SHOP           EQU $77
ISCRIPT_ENTRYPOINT_120_FINAL_GURU                  EQU $78
ISCRIPT_ENTRYPOINT_121_GLAD_YOU_ARE_BACK           EQU $79
ISCRIPT_ENTRYPOINT_122_DARTMOOR_DOCTOR             EQU $7a
ISCRIPT_ENTRYPOINT_123_MARK_OF_QUEEN               EQU $7b
ISCRIPT_ENTRYPOINT_124_MARK_OF_KING                EQU $7c
ISCRIPT_ENTRYPOINT_125_MARK_OF_ACE                 EQU $7d
ISCRIPT_ENTRYPOINT_126_MARK_OF_JOKER               EQU $7e
ISCRIPT_ENTRYPOINT_127_NEED_RING_FOR_DOOR          EQU $7f
ISCRIPT_ENTRYPOINT_128_USED_RED_POTION             EQU $80
ISCRIPT_ENTRYPOINT_129_USED_MATTOCK                EQU $81
ISCRIPT_ENTRYPOINT_130_USED_HOURGLASS              EQU $82
ISCRIPT_ENTRYPOINT_131_USED_WINGBOOTS              EQU $83
ISCRIPT_ENTRYPOINT_132_USED_KEY                    EQU $84
ISCRIPT_ENTRYPOINT_133_USED_ELIXIR                 EQU $85
ISCRIPT_ENTRYPOINT_134_GOT_ELIXIR                  EQU $86
ISCRIPT_ENTRYPOINT_135_GOT_RED_POTION              EQU $87
ISCRIPT_ENTRYPOINT_136_GOT_MATTOCK                 EQU $88
ISCRIPT_ENTRYPOINT_137_GOT_WINGBOOTS               EQU $89
ISCRIPT_ENTRYPOINT_138_GOT_HOURGLASS               EQU $8a
ISCRIPT_ENTRYPOINT_139_GOT_BATTLE_SUIT             EQU $8b
ISCRIPT_ENTRYPOINT_140_GOT_BATTLE_HELMET           EQU $8c
ISCRIPT_ENTRYPOINT_141_GOT_DRAGON_SLAYER           EQU $8d
ISCRIPT_ENTRYPOINT_142_GOT_BLACK_ONYX              EQU $8e
ISCRIPT_ENTRYPOINT_143_GOT_PENDANT                 EQU $8f
ISCRIPT_ENTRYPOINT_144_GOT_MAGICAL_ROD             EQU $90
ISCRIPT_ENTRYPOINT_145_TOUCHED_POISON              EQU $91
ISCRIPT_ENTRYPOINT_146_GOT_POWER_GLOVE             EQU $92
ISCRIPT_ENTRYPOINT_147_POWER_GLOVE_GONE            EQU $93
ISCRIPT_ENTRYPOINT_148_OINTMENT_USED               EQU $94
ISCRIPT_ENTRYPOINT_149_OINTMENT_GONE               EQU $95
ISCRIPT_ENTRYPOINT_150_WINGBOOTS_GONE              EQU $96
ISCRIPT_ENTRYPOINT_151_HOURGLASS_GONE              EQU $97

;============================================================================
; ItemInventory
;============================================================================
ITEMINVENTORY_RING_OF_ELF                          EQU $00
ITEMINVENTORY_RING_OF_RUBY                         EQU $01
ITEMINVENTORY_RING_OF_DWORF                        EQU $02
ITEMINVENTORY_DEMONS_RING                          EQU $03
ITEMINVENTORY_KEY_A                                EQU $04
ITEMINVENTORY_KEY_K                                EQU $05
ITEMINVENTORY_KEY_Q                                EQU $06
ITEMINVENTORY_KEY_J                                EQU $07
ITEMINVENTORY_KEY_JO                               EQU $08
ITEMINVENTORY_MATTOCK                              EQU $09
ITEMINVENTORY_MAGICAL_ROD                          EQU $0a
ITEMINVENTORY_CRYSTAL                              EQU $0b
ITEMINVENTORY_LAMP                                 EQU $0c
ITEMINVENTORY_HOUR_GLASS                           EQU $0d
ITEMINVENTORY_BOOK                                 EQU $0e
ITEMINVENTORY_WING_BOOTS                           EQU $0f
ITEMINVENTORY_RED_POTION                           EQU $10
ITEMINVENTORY_POISON                               EQU $11
ITEMINVENTORY_ELIXIR                               EQU $12
ITEMINVENTORY_PENDANT                              EQU $13
ITEMINVENTORY_BLACK_ONYX                           EQU $14
ITEMINVENTORY_FIRE_CRYSTAL                         EQU $15
ITEMINVENTORY_NO_ITEM_SELECTED                     EQU $ff

;============================================================================
; LoadedState
;============================================================================
LOADED_STATE_READY                                 EQU $00
LOADED_STATE_NOT_PLAYING                           EQU $ff

;============================================================================
; Message
;============================================================================
MESSAGEID_UNSET                                    EQU $00
MESSAGEID_HELP_WITH_ANYTHING                       EQU $01
MESSAGEID_THANK_YOU_FOR_SHOPPING                   EQU $02
MESSAGEID_NOT_ENOUGH_GOLD                          EQU $03
MESSAGEID_ANYTHING_ELSE                            EQU $04
MESSAGEID_COME_BACK_AGAIN                          EQU $05
MESSAGEID_CANT_CARRY_MORE                          EQU $06
MESSAGEID_DRIED_MEAT_50G                           EQU $07
MESSAGEID_DRIED_MEAT_150G                          EQU $08
MESSAGEID_DRIED_MEAT_180G                          EQU $09
MESSAGEID_DRIED_MEAT_250G                          EQU $0a
MESSAGEID_DRIED_MEAT_350G                          EQU $0b
MESSAGEID_DRIED_MEAT_500G                          EQU $0c
MESSAGEID_DRIED_MEAT_800G                          EQU $0d
MESSAGEID_I_SELL_KEYS                              EQU $0e
MESSAGEID_I_SELL_TOOLS                             EQU $0f
MESSAGEID_COME_HERE_TO_BUY_SELL                    EQU $10
MESSAGEID_NO_KEY                                   EQU $11
MESSAGEID_NOTHING_TO_BUY                           EQU $12
MESSAGEID_WHICH_TO_SELL                            EQU $13
MESSAGEID_WHAT_WOULD_YOU_LIKE                      EQU $14
MESSAGEID_MAGIC_200G                               EQU $15
MESSAGEID_WATCH_POWER_LEVEL                        EQU $16
MESSAGEID_MAGIC_FIRE_3000G                         EQU $17
MESSAGEID_DONT_RELY_ON_MAGIC                       EQU $18
MESSAGEID_MARTIAL_ARTS_200G                        EQU $19
MESSAGEID_DO_YOU_WANT_TREATMENT                    EQU $1a
MESSAGEID_DONT_TRY_TOO_HARD                        EQU $1b
MESSAGEID_250G_PLEASE                              EQU $1c
MESSAGEID_500G_PLEASE                              EQU $1d
MESSAGEID_1000G_PLEASE                             EQU $1e
MESSAGEID_2500G_PLEASE                             EQU $1f
MESSAGEID_1800G_PLEASE                             EQU $20
MESSAGEID_3000G_PLEASE                             EQU $21
MESSAGEID_MEDITATE_WITH_YOU                        EQU $22
MESSAGEID_NEW_TITLE                                EQU $23
MESSAGEID_REMEMBER_YOUR_MANTRA                     EQU $24
MESSAGEID_HEAR_AGAIN                               EQU $25
MESSAGEID_INTRO                                    EQU $26
MESSAGEID_GO_SEE_KING                              EQU $27
MESSAGEID_DIRECTIONS_APOLUNE                       EQU $28
MESSAGEID_MARK_OF_JACK                             EQU $29
MESSAGEID_THIS_IS_EOLIS                            EQU $2a
MESSAGEID_LOOK_FOR_RINGS                           EQU $2b
MESSAGEID_TAKE_RING_TO_KING                        EQU $2c
MESSAGEID_VISIT_GURUS_GET_TITLE                    EQU $2d
MESSAGEID_LAST_WELL_ALMOST_DRY                     EQU $2e
MESSAGEID_THIS_IS_FOREPAW                          EQU $2f
MESSAGEID_DWARVES_ARE_HERE                         EQU $30
MESSAGEID_DO_YOU_HAVE_WEAPON                       EQU $31
MESSAGEID_CANT_LET_YOU_GO                          EQU $32
MESSAGEID_KING_IS_WAITING                          EQU $33
MESSAGEID_GOOD_LUCK                                EQU $34
MESSAGEID_KING_EXPOSITION                          EQU $35
MESSAGEID_NOTHING_MORE_TO_HELP                     EQU $36
MESSAGEID_DWARVES_ROBBING_ELVES                    EQU $37
MESSAGEID_METEORITE_EXPOSITION                     EQU $38
MESSAGEID_LISTEN_TO_PEOPLE                         EQU $39
MESSAGEID_DONT_TRY_TOO_HARD_2                      EQU $3a
MESSAGEID_WELCOME_TO_APOLUNE                       EQU $3b
MESSAGEID_DIRECTIONS_FOREPAW                       EQU $3c
MESSAGEID_DIRECTIONS_TO_TRUNK                      EQU $3d
MESSAGEID_GOOD_LUCK_2                              EQU $3e
MESSAGEID_SHOULD_HAVE_SHIELD                       EQU $3f
MESSAGEID_MATTOCK_IN_TOWER                         EQU $40
MESSAGEID_BLOCKED_PASSAGE                          EQU $41
MESSAGEID_MATTOCK_BREAKS_WALL                      EQU $42
MESSAGEID_YOU_NEED_KEY                             EQU $43
MESSAGEID_YOU_NEED_DIFFERENT_KEY                   EQU $44
MESSAGEID_DOCTOR_CAN_HELP                          EQU $45
MESSAGEID_POISON_IS_BAD                            EQU $46
MESSAGEID_LEARN_MANTRAS                            EQU $47
MESSAGEID_SECRET_GURU_IN_TOWER                     EQU $48
MESSAGEID_CARRY_ITEMS                              EQU $49
MESSAGEID_WELCOME_TO_FOREPAW                       EQU $4a
MESSAGEID_FOUNTAIN_WILL_FLOW_TO_TOWN               EQU $4b
MESSAGEID_FIND_3_SPRINGS                           EQU $4c
MESSAGEID_WATER_IS_FLOWING                         EQU $4d
MESSAGEID_FOUNTAIN_IN_SKY                          EQU $4e
MESSAGEID_PUSH_FOUNTAIN_ROCK                       EQU $4f
MESSAGEID_SPRING_IN_TOWER                          EQU $50
MESSAGEID_WINGBOOTS_IN_TOWER                       EQU $51
MESSAGEID_DIRECTIONS_TO_MASCON                     EQU $52
MESSAGEID_LOOK_FOR_WINGBOOTS                       EQU $53
MESSAGEID_FOUNTAIN_IN_SKY_HINT                     EQU $54
MESSAGEID_USE_THIS_KEY_FOR_FIRST_SPRING            EQU $55
MESSAGEID_GET_JOKER_OR_COME_BACK                   EQU $56
MESSAGEID_HO_HO_HO_ZZZ                             EQU $57
MESSAGEID_GET_KEY_FIND_FOUNTAIN                    EQU $58
MESSAGEID_THIS_IS_SPRING_OF_TRUNK_GET_ELIXIR       EQU $59
MESSAGEID_2_MORE_SPRINGS                           EQU $5a
MESSAGEID_COME_BACK_WITH_MEDICINE                  EQU $5b
MESSAGEID_FIND_POISON_IN_MASCON                    EQU $5c
MESSAGEID_WILL_REVIVE_SPRING                       EQU $5d
MESSAGEID_GIVING_RING_OF_RUBY                      EQU $5e
MESSAGEID_TRUST_YOUR_POWER                         EQU $5f
MESSAGEID_WELCOME_TO_MASCON                        EQU $60
MESSAGEID_PREPARE_BEFORE_FOREPAW                   EQU $61
MESSAGEID_METEORITE_BECOMES_POISON                 EQU $62
MESSAGEID_DID_YOU_GET_PENDANT                      EQU $63
MESSAGEID_STORES_OUTSIDE_TOWN                      EQU $64
MESSAGEID_THIS_IS_LARGE_SHIELD                     EQU $65
MESSAGEID_DIRECTIONS_TO_SUFFER                     EQU $66
MESSAGEID_NEED_WING_BOOTS_FOR_MIST                 EQU $67
MESSAGEID_WELCOME_TO_MIST                          EQU $68
MESSAGEID_HOUSE_OUTSIDE_ABANDONED                  EQU $69
MESSAGEID_TOWER_OF_SUFFER_SOON                     EQU $6a
MESSAGEID_KEEP_PENDANT                             EQU $6b
MESSAGEID_DWARVES_CHANTING                         EQU $6c
MESSAGEID_METEORITE_WAS_MOVED                      EQU $6d
MESSAGEID_HOUR_GLASS                               EQU $6e
MESSAGEID_HOUR_GLASS_USES_ENERGY                   EQU $6f
MESSAGEID_WELCOME_TO_VICTIM                        EQU $70
MESSAGEID_DANGEROUS_WITHOUT_MAGIC                  EQU $71
MESSAGEID_MAGIC_HALL_OUTSIDE_TOWN                  EQU $72
MESSAGEID_MAGIC_CANE                               EQU $73
MESSAGEID_GO_TO_CAPITAL                            EQU $74
MESSAGEID_GOT_ARMOR_FOR_BOTTLE                     EQU $75
MESSAGEID_ILL_HAVE_DRINK                           EQU $76
MESSAGEID_IM_LOST                                  EQU $77
MESSAGEID_IM_LOST_MAGIC_DOES_NOT_WORK              EQU $78
MESSAGEID_MAGIC_OF_JUSTICE_OR_DESTRUCTION          EQU $79
MESSAGEID_MAGIC_INDIVIDUAL_POWERS                  EQU $7a
MESSAGEID_MAGIC_CONSUMES_POWER                     EQU $7b
MESSAGEID_METEORITE_BECOMES_BLACK_ONYX             EQU $7c
MESSAGEID_DIRECTIONS_TO_TOWER_OF_MIST              EQU $7d
MESSAGEID_USE_KEY_FOR_CONFLATE                     EQU $7e
MESSAGEID_YOU_NEED_KEY_ACE                         EQU $7f
MESSAGEID_WELCOME_TO_CONFLATE                      EQU $80
MESSAGEID_LEGENDARY_SHIELD_HELMET                  EQU $81
MESSAGEID_TOWN_SURROUNDED_BY_DOORS                 EQU $82
MESSAGEID_SEE_GURU_AFTER_SHIELD_HELMET             EQU $83
MESSAGEID_GUARDIAN_OF_GURU                         EQU $84
MESSAGEID_SOMETHING_YOU_CAN_GET                    EQU $85
MESSAGEID_DONT_RELY_ON_MAGIC_FINAL_BATTLE          EQU $86
MESSAGEID_USED_TO_TRADE_WITH_DWARVES               EQU $87
MESSAGEID_USED_TO_BE_SKILLED                       EQU $88
MESSAGEID_USED_TO_VISIT_DWARVES                    EQU $89
MESSAGEID_I_AM_PICKPOCKET                          EQU $8a
MESSAGEID_NEED_FINAL_WEAPON_ARMOR                  EQU $8b
MESSAGEID_DIRECTIONS_DARTMORE                      EQU $8c
MESSAGEID_DIRECTIONS_DAYBREAK                      EQU $8d
MESSAGEID_FRIENDS_IN_DARTMOOR                      EQU $8e
MESSAGEID_LOOK_FOR_BATTLE_SUIT                     EQU $8f
MESSAGEID_FIND_MAGIC_CANE                          EQU $90
MESSAGEID_YOU_ARE_FAMOUS_GOOD_LOOKING              EQU $91
MESSAGEID_AUTOGRAPH                                EQU $92
MESSAGEID_WHEN_TAKE_BATH                           EQU $93
MESSAGEID_GURU_CONFLATE_HAS_RING_DWARVES           EQU $94
MESSAGEID_DID_YOU_GET_BATTLE_SUIT                  EQU $95
MESSAGEID_DARTMORE_IS_MAZE                         EQU $96
MESSAGEID_IS_FIRST_VISIT_TO_STORE                  EQU $97
MESSAGEID_MAGIC_CANE_ABOVE_TOWER                   EQU $98
MESSAGEID_DIRECTIONS_TO_FRATERNAL                  EQU $99
MESSAGEID_YOU_NEED_DEMONS_RING                     EQU $9a
MESSAGEID_KING_GRIEVE_HAS_DRAGON_SLAYER            EQU $9b
MESSAGEID_DEFEAT_EVIL_WITH_DRAGON_SLAYER           EQU $9c
MESSAGEID_GO_TO_FRATERNAL_GURU                     EQU $9d
MESSAGEID_GURU_HAS_DEMONS_RING                     EQU $9e
MESSAGEID_SEARCH_CASTLE_FOR_GURU                   EQU $9f
MESSAGEID_EVIL_IMMUNE_TO_MAGIC                     EQU $a0
MESSAGEID_METEORITE_EXPOSITION_2                   EQU $a1
MESSAGEID_DEFEATED_KING_GRIEVE                     EQU $a2
MESSAGEID_ILL_MEDITATE_FOR_YOU                     EQU $a3
MESSAGEID_GLAD_YOURE_BACK                          EQU $a4
MESSAGEID_MARK_OF_QUEEN                            EQU $a5
MESSAGEID_MARK_OF_KING                             EQU $a6
MESSAGEID_MARK_OF_ACE                              EQU $a7
MESSAGEID_MARK_OF_JOKER                            EQU $a8
MESSAGEID_NEED_RING_FOR_DOOR                       EQU $a9
MESSAGEID_USED_RED_POTION                          EQU $aa
MESSAGEID_USED_MATTOCK                             EQU $ab
MESSAGEID_USED_HOURGLASS                           EQU $ac
MESSAGEID_USED_WINGBOOTS                           EQU $ad
MESSAGEID_USED_KEY                                 EQU $ae
MESSAGEID_USED_ELIXIR                              EQU $af
MESSAGEID_HOLDING_ELIXIR                           EQU $b0
MESSAGEID_HOLDING_RED_POTION                       EQU $b1
MESSAGEID_HOLDING_MATTOCK                          EQU $b2
MESSAGEID_HOLDING_WINGBOOTS                        EQU $b3
MESSAGEID_HOLDING_HOURGLASS                        EQU $b4
MESSAGEID_GOT_BATTLE_SUIT                          EQU $b5
MESSAGEID_GOT_BATTLE_HELMET                        EQU $b6
MESSAGEID_GOT_DRAGON_SLAYER                        EQU $b7
MESSAGEID_GOT_BLACK_ONYX                           EQU $b8
MESSAGEID_GOT_PENDANT                              EQU $b9
MESSAGEID_GOT_MAGICAL_ROD                          EQU $ba
MESSAGEID_TOUCHED_POISON                           EQU $bb
MESSAGEID_GLOVE_INCREASES_POWER                    EQU $bc
MESSAGEID_POWER_GLOVE_IS_GONE                      EQU $bd
MESSAGEID_USED_OINTMENT                            EQU $be
MESSAGEID_OINTMENT_GONE                            EQU $bf
MESSAGEID_WINGBOOTS_GONE                           EQU $c0
MESSAGEID_HOURGLASS_GONE                           EQU $c1
MESSAGEID_CHAR_PLAYER_TITLE                        EQU $fb
MESSAGEID_CHAR_PAUSE                               EQU $fc
MESSAGEID_CHAR_SPACE                               EQU $fd
MESSAGEID_CHAR_NEWLINE                             EQU $fe
MESSAGEID_CHAR_END                                 EQU $ff

;============================================================================
; MovingSpriteVisibility
;============================================================================
MOVING_SPRITE_FULLY_VISIBLE                        EQU $00
MOVING_SPRITE_TRAILING_OBSCURED                    EQU $01
MOVING_SPRITE_LEADING_OBSCURED                     EQU $02
MOVING_SPRITE_FULLY_OBSCURED                       EQU $03

;============================================================================
; Music
;============================================================================
MUSIC_START_THEME                                  EQU $01
MUSIC_MAYBE_LAST_WORLD                             EQU $02
MUSIC_MAYBE_BETWEEN_FIRST_TOWN_FOG                 EQU $03
MUSIC_MAYBE_TREE_WORLD                             EQU $04
MUSIC_MAYBE_FOG                                    EQU $05
MUSIC_MAYBE_TOWER                                  EQU $06
MUSIC_EOLIS                                        EQU $07
MUSIC_DEATH                                        EQU $08
MUSIC_MAYBE_TOWN_BUILDING                          EQU $09
MUSIC_BOSS                                         EQU $0a
MUSIC_0x0B                                         EQU $0b
MUSIC_MAYBE_ENDING                                 EQU $0c
MUSIC_MAYBE_TEMPLE_1                               EQU $0d
MUSIC_TEMPLE                                       EQU $0e
MUSIC_SHOP                                         EQU $0f
MUSIC_MAYBE_FINAL_MAZE                             EQU $10

;============================================================================
; Palette
;============================================================================
PALETTE_EOLIS                                      EQU $00
PALETTE_OUTSIDE                                    EQU $06
PALETTE_TOWER                                      EQU $07
PALETTE_BRANCH                                     EQU $08
PALETTE_LEFT_TRUNK                                 EQU $09
PALETTE_MIST                                       EQU $0a
PALETTE_SUFFER                                     EQU $0b
PALETTE_DARTMOOR                                   EQU $0c
PALETTE_FRATERNAL                                  EQU $0d
PALETTE_KING_GRIEVES_ROOM                          EQU $0e
PALETTE_EVIL_FORTRESS                              EQU $0f
PALETTE_START_SCREEN                               EQU $10
PALETTTE_KINGS_ROOM                                EQU $11
PALETTE_TEMPLE                                     EQU $12
PALETTE_HOSPITAL                                   EQU $13
PALETTE_TAVERN                                     EQU $14
PALETTE_TOOL_SHOP                                  EQU $15
PALETTE_KEY_SHOP                                   EQU $16
PALETTE_HOUSE                                      EQU $17
PALETTE_MEAT_SHOP                                  EQU $18
PALETTE_MARTIAL_ARTS                               EQU $19
PALETTE_MAGIC_SHOP                                 EQU $1a
PALETTE_TOWN                                       EQU $1b

;============================================================================
; PlayerFlags
;============================================================================
PLAYER_FLAGS_UNSET                                 EQU $00
PLAYER_JUMPING                                     EQU $01
PLAYER_HOLDING_TO_CLIMB                            EQU $02
PLAYER_FALLING_OFF                                 EQU $04
PLAYER_CAN_CLIMB                                   EQU $08
PLAYER_CLIMBING                                    EQU $10
PLAYER_MOVING                                      EQU $20
PLAYER_FACING_RIGHT                                EQU $40
PLAYER_CLEAR_ATTACKING                             EQU $7f
PLAYER_ATTACKING                                   EQU $80
PLAYER_CLEAR_FACING_RIGHT                          EQU $bf
PLAYER_CLEAR_MOVING                                EQU $df
PLAYER_CLEAR_CLIMBING                              EQU $ef
PLAYER_CLEAR_CAN_CLIMB                             EQU $f7
PLAYER_CLEAR_FALLING_OFF                           EQU $fb
PLAYER_CLEAR_JUMPING                               EQU $fe
PLAYER_FLAGS_ALL                                   EQU $ff

;============================================================================
; PlayerStatusFlags
;============================================================================
PLAYER_STATUS_ATTACKING                            EQU $01
PLAYER_STATUS_KNOCKBACK                            EQU $02
PLAYER_STATUS_WING_BOOTS                           EQU $80
PLAYER_STATUS_CLEAR_ATTACKING                      EQU $fe

;============================================================================
; PlayerTitle
;============================================================================
RANK_NOVICE                                        EQU $00
RANK_ASPIRANT                                      EQU $01
RANK_BATTLER                                       EQU $02
RANK_FIGHTER                                       EQU $03
RANK_ADEPT                                         EQU $04
RANK_CHEVALIER                                     EQU $05
RANK_VETERAN                                       EQU $06
RANK_WARRIOR                                       EQU $07
RANK_SWORDMAN                                      EQU $08
RANK_HERO                                          EQU $09
RANK_SOLDIER                                       EQU $0a
RANK_MYRMIDON                                      EQU $0b
RANK_CHAMPION                                      EQU $0c
RANK_SUPERHERO                                     EQU $0d
RANK_PALADIN                                       EQU $0e
RANK_LORD                                          EQU $0f

;============================================================================
; PPUCtrlFlags
;============================================================================
PPUCTRL_NAMETABLE_2000                             EQU $00
PPUCTRL_NAMETABLE_2400                             EQU $01
PPUCTRL_NAMETABLE_2800                             EQU $02
PPUCTRL_NAMETABLE_2C00                             EQU $03
PPUCTRL_VRAM_INC_ADD32_DOWN                        EQU $04
PPUCTRL_SPRITE_PATTERN_1000                        EQU $08
PPUCTRL_BGTABLE_ADDR_1000                          EQU $10
PPUCTRL_SPRITE_SIZE_8x16                           EQU $20
PPUCTRL_PPU_OUTPUT_COLOR_ON_EXT                    EQU $40
PPUCTRL_VBLANK_DISABLE                             EQU $7f
PPUCTRL_VBLANK_ENABLE                              EQU $80
PPUCTRL_VRAM_INC_ADD1_ACROSS                       EQU $fb
PPUCTRL_CLEAR_NAMETABLE_2400                       EQU $fe

;============================================================================
; PPUMaskFlags
;============================================================================
PPUMASK_CLEAR                                      EQU $00
PPUMASK_GREYSCALE                                  EQU $01
PPUMASK_SHOW_BG_LEFTMOST_8                         EQU $02
PPUMASK_SHOW_SPRITES_LEFTMOST_8                    EQU $04
PPUMASK_ENABLE_BG                                  EQU $08
PPUMASK_ENABLE_SPRITES                             EQU $10
PPUMASK_EMPHASIZE_RED                              EQU $20
PPUMASK_EMPHASIZE_GREEN                            EQU $40
PPUMASK_EMPHASIZE_BLUE                             EQU $80
PPUMASK_CLEAR_GREYSCALE                            EQU $fe

;============================================================================
; PPUStatusFlags
;============================================================================
PPUSTATUS_SPRITE_OVERFLOW                          EQU $20
PPUSTATUS_SPRITE_0_HIT                             EQU $40
PPUSTATUS_VBLANK                                   EQU $80

;============================================================================
; Quests
;============================================================================
QUEST_NONE                                         EQU $00
QUEST_SPRING_OF_TRUNK                              EQU $01
QUEST_SPRING_OF_SKY                                EQU $02
QUEST_SOMETHING_WING_BOOTS                         EQU $08
QUEST_MATTOCK                                      EQU $10
QUEST_MASCON_OPENED                                EQU $20

;============================================================================
; ROMBank
;============================================================================
BANK_0                                             EQU $00
BANK_1_SPRITES                                     EQU $01
BANK_2_SPRITES                                     EQU $02
BANK_3_LEVEL_DATA                                  EQU $03
BANK_5_AUDIO_LOGIC                                 EQU $05
BANK_6                                             EQU $06
BANK_7_PRG                                         EQU $07
BANK_8_PRG                                         EQU $08
BANK_9_UNUSED                                      EQU $09
BANK_10_CHRRAM                                     EQU $0a
BANK_11_SPRITEINFO_PALETTES                        EQU $0b
BANK_12_LOGIC                                      EQU $0c
BANK_13_STRINGS                                    EQU $0d
BANK_14_LOGIC                                      EQU $0e
BANK_15_LOGIC                                      EQU $0f

;============================================================================
; ScreenEventID
;============================================================================
SCREEN_EVENT_PATH_TO_MASCON                        EQU $00
SCREEN_EVENT_BOSS                                  EQU $01
SCREEN_EVENT_FINAL_BOSS                            EQU $02
SCREEN_EVENT_UNSET                                 EQU $ff

;============================================================================
; ScreenExtraInfo
;============================================================================
SCREEN_HAS_SPECIAL_EVENT                           EQU $80

;============================================================================
; ScreenScrollDirection
;============================================================================
SCREEN_SCROLL_LEFT                                 EQU $00
SCREEN_SCROLL_RIGHT                                EQU $01
SCREEN_SCROLL_UP                                   EQU $02
SCREEN_SCROLL_DOWN                                 EQU $03
SCREEN_SCROLL_NONE                                 EQU $ff

;============================================================================
; SelectedMagic
;============================================================================
SELECTEDMAGIC_DELUGE                               EQU $00
SELECTEDMAGIC_THUNDER                              EQU $01
SELECTEDMAGIC_FIRE                                 EQU $02
SELECTEDMAGIC_DEATH                                EQU $03
SELECTEDMAGIC_TILTE                                EQU $04
SELECTEDMAGIC_DELUGE_AFTER_HIT                     EQU $05
SELECTEDMAGIC_THUNDER_AFTER_HIT                    EQU $06
SELECTEDMAGIC_FIRE_AFTER_HIT                       EQU $07
SELECTEDMAGIC_DEATH_AFTER_HIT                      EQU $08
SELECTEDMAGIC_UNKNOWN_9                            EQU $09
SELECTEDMAGIC_UNKNOWN_10                           EQU $0a
SELECTEDMAGIC_TILTE_AFTER_HIT                      EQU $0b
SELECTEDMAGIC_NONE                                 EQU $ff

;============================================================================
; ShieldInventory
;============================================================================
SHIELDINVENTORY_SMALL                              EQU $00
SHIELDINVENTORY_LARGE                              EQU $01
SHIELDINVENTORY_MAGIC                              EQU $02
SHIELDINVENTORY_BATTLE_HELMET                      EQU $03
SHIELDINVENTORY_UNSET                              EQU $ff

;============================================================================
; ShopItem
;============================================================================
SHOP_ITEM_HAND_DAGGER                              EQU $00
SHOP_ITEM_LONG_SWORD                               EQU $01
SHOP_ITEM_GIANT_BLADE                              EQU $02
SHOP_ITEM_DRAGON_SLAYER                            EQU $03
SHOP_ITEM_LEATHER_ARMOR                            EQU $20
SHOP_ITEM_STUDDEDMAIL                              EQU $21
SHOP_ITEM_FULL_PLATE                               EQU $22
SHOP_ITEM_BATTLE_SUIT                              EQU $23
SHOP_ITEM_SMALL_SHIELD                             EQU $40
SHOP_ITEM_LARGE_SHIELD                             EQU $41
SHOP_ITEM_MAGIC_SHIELD                             EQU $42
SHOP_ITEM_BATTLE_HELMET                            EQU $43
SHOP_ITEM_DELUGE                                   EQU $60
SHOP_ITEM_THUNDER                                  EQU $61
SHOP_ITEM_FIRE                                     EQU $62
SHOP_ITEM_DEATH                                    EQU $63
SHOP_ITEM_TILTE                                    EQU $64

;============================================================================
; SoundChannels
;============================================================================
SNDCHN_PULSE_1                                     EQU $01
SNDCHN_PULSE_2                                     EQU $02
SNDCHN_TRIANGLE                                    EQU $04
SNDCHAN_NOISE                                      EQU $08
SNDCHN_DMC                                         EQU $10

;============================================================================
; SoundID
;============================================================================
SOUND_MESSAGE                                      EQU $01
SOUND_HIT_ENEMY                                    EQU $02
SOUND_ENEMY_DEAD                                   EQU $03
SOUND_PLAYER_HIT                                   EQU $04
SOUND_MAGIC                                        EQU $05
SOUND_OPEN_DOOR                                    EQU $06
SOUND_TYPING                                       EQU $07
SOUND_ITEM_PICK_UP                                 EQU $08
SOUND_TOUCH_COIN                                   EQU $09
SOUND_MAGIC_HIT_OBSTACLE                           EQU $0a
SOUND_MAYBE_MOVE_CURSOR                            EQU $0b
SOUND_0x0C                                         EQU $0c
SOUND_INPUT                                        EQU $0d
SOUND_MAYBE_ENTER_PASSWORD_CHAR                    EQU $0e
SOUND_PUSHING                                      EQU $0f
SOUND_MAYBE_DROP_COIN                              EQU $10
SOUND_FILL_HP_OR_MANA                              EQU $13
SOUND_TILTE_MAGIC                                  EQU $14
SOUND_MAYBE_STEP_SOUND                             EQU $15
SOUND_PLAYER_DEATH                                 EQU $16
SOUND_DROP_LADDER                                  EQU $17
SOUND_0x18                                         EQU $18
SOUND_MAYBE_GOLD_CHANGE                            EQU $19
SOUND_USE_SPECIAL_ITEM_2                           EQU $1a
SOUND_TOUCH_BREAD                                  EQU $1b
SOUND_MAX_IDS                                      EQU $1d

;============================================================================
; SpecialItemsBits
;============================================================================
BIT_UNSET                                          EQU $00
BIT_BLACK_ONYX                                     EQU $01
BIT_PENDANT                                        EQU $02
BIT_MAGICAL_ROD                                    EQU $04
BIT_ELIXIR                                         EQU $08
BIT_DEMONS_RING                                    EQU $10
BIT_RING_OF_DWORF                                  EQU $20
BIT_RING_OF_RUBY                                   EQU $40
BIT_RING_OF_ELF                                    EQU $80
BIT_CLEAR_ELIXIR                                   EQU $f7
BIT_ALL                                            EQU $ff

;============================================================================
; SpriteCategory
;============================================================================
SPRITE_ENEMY                                       EQU $00
SPRITE_DROPPED                                     EQU $01
SPRITE_NPC                                         EQU $02
SPRITE_EFFECT                                      EQU $03
SPRITE_TRIGGER                                     EQU $04
SPRITE_ITEM                                        EQU $05
SPRITE_MAGIC                                       EQU $06
SPRITE_BOSS                                        EQU $07

;============================================================================
; SpriteEntity
;============================================================================
SPRITE_DROPPED_BREAD                               EQU $01
SPRITE_DROPPED_COIN                                EQU $02
SPRITE_GARBLED_03                                  EQU $03
SPRITE_ENEMY_RAIDEN                                EQU $04
SPRITE_ENEMY_NECRON_AIDES                          EQU $05
SPRITE_ENEMY_ZOMBIE                                EQU $06
SPRITE_ENEMY_HORNET                                EQU $07
SPRITE_ENEMY_BIHORUDA                              EQU $08
SPRITE_ENEMY_LILITH                                EQU $09
SPRITE_MAGIC_GARBLED_10                            EQU $0a
SPRITE_ENEMY_YUINARU                               EQU $0b
SPRITE_ENEMY_SNOWMAN                               EQU $0c
SPRITE_ENEMY_NASH                                  EQU $0d
SPRITE_ENEMY_FIRE_GIANT                            EQU $0e
SPRITE_ENEMY_ISHIISU                               EQU $0f
SPRITE_ENEMY_EXECUTION_HOOD                        EQU $10
SPRITE_BOSS_ROKUSUTAHN                             EQU $11
SPRITE_BOSS_UNUSED_18                              EQU $12
SPRITE_EFFECT_ENEMY_DEATH                          EQU $13
SPRITE_EFFECT_LIGHTNING_BALL_20                    EQU $14
SPRITE_ENEMY_CHARRON                               EQU $15
SPRITE_ENEMY_UNUSED_22                             EQU $16
SPRITE_ENEMY_GERIBUTA                              EQU $17
SPRITE_ENEMY_SUGATA                                EQU $18
SPRITE_ENEMY_GRIMLOCK                              EQU $19
SPRITE_ENEMY_GIANT_BEES                            EQU $1a
SPRITE_ENEMY_MYCONID                               EQU $1b
SPRITE_ENEMY_NAGA                                  EQU $1c
SPRITE_ENEMY_UNUSED_29                             EQU $1d
SPRITE_ENEMY_GIANT_STRIDER                         EQU $1e
SPRITE_ENEMY_SIR_GAWAINE                           EQU $1f
SPRITE_ENEMY_MASKMAN                               EQU $20
SPRITE_ENEMY_WOLFMAN                               EQU $21
SPRITE_ENEMY_YAREEKA                               EQU $22
SPRITE_ENEMY_MAGMAN                                EQU $23
SPRITE_ENEMY_UNUSED_36                             EQU $24
SPRITE_ENEMY_UNUSED_37                             EQU $25
SPRITE_ENEMY_IKEDA                                 EQU $26
SPRITE_ENEMY_UNUSED_39                             EQU $27
SPRITE_ENEMY_LAMPREY                               EQU $28
SPRITE_ENEMY_UNUSED_41                             EQU $29
SPRITE_ENEMY_MONODRON                              EQU $2a
SPRITE_ENEMY_UNUSED_43                             EQU $2b
SPRITE_ENEMY_TAMAZUTSU                             EQU $2c
SPRITE_BOSS_RIPASHEIKU                             EQU $2d
SPRITE_BOSS_ZORADOHNA                              EQU $2e
SPRITE_BOSS_BORABOHRA                              EQU $2f
SPRITE_BOSS_PAKUKAME                               EQU $30
SPRITE_BOSS_ZORUGERIRU                             EQU $31
SPRITE_BOSS_KING_GRIEVE                            EQU $32
SPRITE_BOSS_SHADOW_EURA                            EQU $33
SPRITE_NPC_WALKING_MAN_1                           EQU $34
SPRITE_NPC_UNUSED_BLUE_LADY                        EQU $35
SPRITE_NPC_UNUSED_CHILD                            EQU $36
SPRITE_NPC_ARMOR_SALESMAN                          EQU $37
SPRITE_NPC_MARTIAL_ARTS                            EQU $38
SPRITE_NPC_PRIEST                                  EQU $39
SPRITE_NPC_KING                                    EQU $3a
SPRITE_NPC_MAGIC_TEACHER                           EQU $3b
SPRITE_NPC_KEY_SALESMAN                            EQU $3c
SPRITE_NPC_SMOKING_MAN                             EQU $3d
SPRITE_NPC_MAN_IN_CHAIR                            EQU $3e
SPRITE_NPC_SITTING_MAN_1                           EQU $3f
SPRITE_NPC_MEAT_SALESMAN                           EQU $40
SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP                EQU $41
SPRITE_NPC_GUARD_1                                 EQU $42
SPRITE_NPC_DOCTOR                                  EQU $43
SPRITE_NPC_WALKING_WOMAN_1                         EQU $44
SPRITE_NPC_WALKING_WOMAN_2                         EQU $45
SPRITE_ENEMY_UNUSED_EYEBALL                        EQU $46
SPRITE_ENEMY_ZOZURA                                EQU $47
SPRITE_OBJ_GLOVE_2                                 EQU $48
SPRITE_OBJ_BLACK_ONYX                              EQU $49
SPRITE_OBJ_PENDANT                                 EQU $4a
SPRITE_OBJ_RED_POTION_2                            EQU $4b
SPRITE_OBJ_POISON_2                                EQU $4c
SPRITE_OBJ_ELIXIR                                  EQU $4d
SPRITE_OBJ_OINTMENT_2                              EQU $4e
SPRITE_TRIGGER_INTRO                               EQU $4f
SPRITE_OBJ_MATTOCK1                                EQU $50
SPRITE_MAGIC_GARBLED_81                            EQU $51
SPRITE_EFFECT_FOUNTAIN                             EQU $52
SPRITE_MAGIC_83                                    EQU $53
SPRITE_MAGIC_84                                    EQU $54
SPRITE_OBJ_WING_BOOTS                              EQU $55
SPRITE_OBJ_HOUR_GLASS                              EQU $56
SPRITE_OBJ_MAGICAL_ROD                             EQU $57
SPRITE_OBJ_BATTLE_SUIT                             EQU $58
SPRITE_OBJ_BATTLE_HELMET                           EQU $59
SPRITE_OBJ_DRAGON_SLAYER                           EQU $5a
SPRITE_OBJ_MATTOCK2                                EQU $5b
SPRITE_OBJ_WING_BOOTS_QUEST                        EQU $5c
SPRITE_OBJ_RED_POTION                              EQU $5d
SPRITE_OBJ_POISON                                  EQU $5e
SPRITE_OBJ_GLOVE                                   EQU $5f
SPRITE_OBJ_OINTMENT                                EQU $60
SPRITE_EFFECT_97                                   EQU $61
SPRITE_EFFECT_98                                   EQU $62
SPRITE_EFFECT_99                                   EQU $63
SPRITE_EFFECT_BOSS_DEATH                           EQU $64
SPRITE_OBJ_UNSET                                   EQU $ff

;============================================================================
; SpriteFlags
;============================================================================
SPRITE_FLAGS_UNSET                                 EQU $00
SPRITE_FLAGS_MOVE_RIGHT                            EQU $01
SPRITE_FLAGS_UNKNOWN_2                             EQU $02
SPRITE_FLAGS_MAYBE_MOVE                            EQU $04
SPRITE_FLAGS_UNKNOWN_3                             EQU $08
SPRITE_FLAGS_MAYBE_HIDDEN                          EQU $10
SPRITE_FLAGS_UNKNOWN_5                             EQU $20
SPRITE_FLAGS_BEHAVIOR_READY                        EQU $40
SPRITE_FLAGS_CLEAR_FALLING                         EQU $7f
SPRITE_FLAGS_FALLING                               EQU $80
SPRITE_FLAGS_CLEAR_BEHAVIOR_READY                  EQU $bf
SPRITE_FLAGS_CLEAR_MAYBE_HIDDEN                    EQU $ef
SPRITE_FLAGS_CLEAR_MAYBE_MOVE                      EQU $fb
SPRITE_FLAGS_CLEAR_UNKNOWN_2                       EQU $fd
SPRITE_FLAGS_CLEAR_MOVE_RIGHT                      EQU $fe
New_Name                                           EQU $ff

;============================================================================
; SpriteHitboxTypes
;============================================================================
SPRITE_HITBOX_0                                    EQU $00
SPRITE_HITBOX_1                                    EQU $01
SPRITE_HITBOX_2                                    EQU $02
SPRITE_HITBOX_3                                    EQU $03
SPRITE_HITBOX_4                                    EQU $04

;============================================================================
; SpriteSubtype
;============================================================================
SPRITE_SUBTYPE_CLEAR_BIT_7                         EQU $7f

;============================================================================
; Temple
;============================================================================
TEMPLE_EOLIS                                       EQU $00
TEMPLE_APOLUNE                                     EQU $01
TEMPLE_FOREPAW                                     EQU $02
TEMPLE_MASCON                                      EQU $03
TEMPLE_VICTIM                                      EQU $04
TEMPLE_CONFLATE                                    EQU $05
TEMPLE_DAYBREAK                                    EQU $06
TEMPLE_FINAL                                       EQU $07

;============================================================================
; WeaponInventory
;============================================================================
WEAPONINVENTORY_HAND_DAGGER                        EQU $00
WEAPONINVENTORY_LONG_SWORD                         EQU $01
WEAPONINVENTORY_GIANT_BLADE                        EQU $02
WEAPONINVENTORY_DRAGON_SLAYER                      EQU $03
WEAPONINVENTORY_NONE                               EQU $ff
