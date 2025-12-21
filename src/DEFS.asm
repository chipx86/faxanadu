
;============================================================================
; Area
;============================================================================
AREA_EOLIS                                         = $00
AREA_APOLUNE                                       = $01
AREA_FOREPAW                                       = $02
AREA_MASCON                                        = $03
AREA_VICTIM_OR_INSIDE                              = $04
AREA_CONFLATE                                      = $05
AREA_DAYBREAK                                      = $06
AREA_EVIL_FORTRESS                                 = $07

;============================================================================
; AreasRegion
;============================================================================
REGION_EOLIS                                       = $00
REGION_TRUNK                                       = $01
REGION_MIST                                        = $02
REGION_BRANCH                                      = $03
REGION_DARTMOOR                                    = $04
REGION_EVIL_FORTRESS                               = $05

;============================================================================
; ArmorInventory
;============================================================================
ARMORINVENTORY_LEATHER                             = $00
ARMORINVENTORY_STUDDED_MAIL                        = $01
ARMORINVENTORY_FULL_PLATE                          = $02
ARMORINVENTORY_BATTLE_SUIT                         = $03

;============================================================================
; BlockProperty
;============================================================================
BLOCK_IS_AIR                                       = $00
BLOCK_IS_SOLID                                     = $01
BLOCK_IS_LADDER                                    = $02
BLOCK_IS_DOOR                                      = $03
BLOCK_FOREGROUND                                   = $04
BLOCK_BREAKABLE_FLOOR                              = $05
BLOCK_PUSHABLE                                     = $06
BLOCK_0x07                                         = $07
BLOCK_0x08                                         = $08
BLOCK_MAYBE_AREA_TRANSITION_UP                     = $09
BLOCK_MAYBE_AREA_TRANSITION_DOWN                   = $0a
BLOCK_MAYBE_BREAKABLE_BY_MATTOCK                   = $0b
BLOCK_AREA_TRANSITION_RIGHT                        = $0c
BLOCK_AREA_TRANSITION_LEFT                         = $0d
BLOCK_0x0e                                         = $0e
BLOCK_LOWER_NIBBLE                                 = $0f
BLOCK_UPPER_NIBBLE                                 = $f0

;============================================================================
; ButtonBitmask
;============================================================================
BUTTON_BIT_NONE                                    = $00
BUTTON_BIT_RIGHT                                   = $01
BUTTON_BIT_LEFT                                    = $02
BUTTON_BIT_DOWN                                    = $04
BUTTON_BIT_UP                                      = $08
BUTTON_BITS_DPAD                                   = $0f
BUTTON_BIT_START                                   = $10
BUTTON_BIT_SELECT                                  = $20
BUTTON_BIT_B                                       = $40
BUTTON_BIT_A                                       = $80

;============================================================================
; CastMagicFlags
;============================================================================
CAST_MAGIC_FLAGS_UNSET                             = $00
CAST_MAGIC_FACING_RIGHT                            = $40
CAST_MAGIC_CLEAR_FALLING                           = $7f
CAST_MAGIC_FALLING                                 = $80

;============================================================================
; Direction
;============================================================================
DIRECTION_LEFT                                     = $00
DIRECTION_RIGHT                                    = $01
DIRECTION_UP                                       = $02
DIRECTION_DOWN                                     = $03
SCREEN_SCROLL_NONE                                 = $ff

;============================================================================
; FacingDirectionBit
;============================================================================
FACING_LEFT                                        = $00
FACING_RIGHT                                       = $40

;============================================================================
; Inventory
;============================================================================
INVENTORY_WEAPONS                                  = $00
INVENTORY_ARMOR                                    = $01
INVENTORY_SHIELD                                   = $02
INVENTORY_MAGIC                                    = $03
INVENTORY_ITEM                                     = $04

;============================================================================
; InventoryItem
;============================================================================
WEAPON_HAND_DAGGER                                 = $00
WEAPON_LONG_SWORD                                  = $01
WEAPON_GIANT_BLADE                                 = $02
WEAPON_DRAGON_SLAYER                               = $03
ARMOR_LEATHER                                      = $20
ARMOR_STUDDED_MAIL                                 = $21
ARMOR_FULL_PLATE                                   = $22
ARMOR_BATTLE_SUIT                                  = $23
SHIELD_SMALL                                       = $40
SHIELD_LARGE                                       = $41
SHIELD_MAGIC                                       = $42
SHIELD_BATTLE_HELMET                               = $43
MAGIC_DELUGE                                       = $60
MAGIC_THUNDER                                      = $61
MAGIC_FIRE                                         = $62
MAGIC_DEATH                                        = $63
MAGIC_TILTE                                        = $64
SPECIAL_RING_OF_ELF                                = $80
SPECIAL_RING_OF_RUBY                               = $81
SPECIAL_RING_OF_DWORF                              = $82
SPECIAL_DEMONS_RING                                = $83
KEY_A                                              = $84
KEY_K                                              = $85
KEY_Q                                              = $86
KEY_J                                              = $87
KEY_JO                                             = $88
MATTOCK                                            = $89
SPECIAL_MAGICAL_ROD                                = $8a
UNUSED_CRYSTAL                                     = $8b
UNUSED_LAMP                                        = $8c
ITEM_HOUR_GLASS                                    = $8d
UNUSED_BOOK                                        = $8e
ITEM_WING_BOOTS                                    = $8f
ITEM_RED_POTION                                    = $90
ITEM_POISON                                        = $91
SPECIAL_ELIXIR                                     = $92
SPECIAL_PENDANT                                    = $93
SPECIAL_BLACK_ONYX                                 = $94
SPECIAL_FIRE_CRYSTAL                               = $95

;============================================================================
; IScriptAction
;============================================================================
ISCRIPT_ACTION_END                                 = $00
ISCRIPT_ACTION_SHOW_UNSKIPPABLE_MESSAGE            = $01
ISCRIPT_ACTION_SHOW_QUESTION_MESSAGE               = $02
ISCRIPT_ACTION_SHOW_MESSAGE                        = $03
ISCRIPT_ACTION_CHECK_UPDATE_PLAYER_TITLE           = $04
ISCRIPT_ACTION_PAY_GOLD                            = $05
ISCRIPT_ACTION_SET_SPAWN_POINT                     = $06
ISCRIPT_ACTION_ADD_ITEM                            = $07
ISCRIPT_ACTION_OPEN_SHOP                           = $08
ISCRIPT_ACTION_ADD_GOLD                            = $09
ISCRIPT_ACTION_ADD_MP                              = $0a
ISCRIPT_ACTION_CHECK_QUEST                         = $0b
ISCRIPT_ACTION_CHECK_PLAYER_RANK                   = $0c
ISCRIPT_ACTION_CHECK_GOLD                          = $0d
ISCRIPT_ACTION_SET_QUEST_COMPLETE                  = $0e
ISCRIPT_ACTION_SHOW_BUY_SELL_MENU                  = $0f
ISCRIPT_ACTION_CONSUME_ITEM                        = $10
ISCRIPT_ACTION_SHOW_SELL_MENU                      = $11
ISCRIPT_ACTION_CHECK_FOR_ITEM                      = $12
ISCRIPT_ACTION_ADD_HP                              = $13
ISCRIPT_ACTION_SHOW_PASSWORD                       = $14
ISCRIPT_ACTION_END_GAME                            = $15
ISCRIPT_ACTION_22                                  = $16
ISCRIPT_ACTION_JUMP                                = $17

;============================================================================
; IScriptEntity
;============================================================================
ISCRIPT_ENTITY_GENERIC                             = $00
ISCRIPT_ENTITY_KING                                = $80
ISCRIPT_ENTITY_GURU                                = $81
ISCRIPT_ENTITY_MARTIAL_ARTIST                      = $82
ISCRIPT_ENTITY_MAGICIAN                            = $83
ISCRIPT_ENTITY_DOCTOR                              = $84
ISCRIPT_ENTITY_NURSE                               = $85
ISCRIPT_ENTITY_PINK_SHIRT_GUY                      = $86
ISCRIPT_ENTITY_SMOKING_GUY                         = $87
ISCRIPT_ENTITY_MEAT_SALESMAN                       = $88
ISCRIPT_ENTITY_TOOLS_SALESMAN                      = $89
ISCRIPT_ENTITY_KEY_SALESMAN                        = $8a

;============================================================================
; IScriptEntrypoint
;============================================================================
ISCRIPT_ENTRYPOINT_INTRO                           = $00
ISCRIPT_ENTRYPOINT_EOLIS_WALKING_MAN_1             = $01
ISCRIPT_ENTRYPOINT_MARK_OF_JACK                    = $02
ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_1           = $03
ISCRIPT_ENTRYPOINT_EOLIS_GURU                      = $04
ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_2           = $05
ISCRIPT_ENTRYPOINT_EOLIS_SMOKING_MAN               = $06
ISCRIPT_ENTRYPOINT_EOLIS_KINGS_GUARD               = $07
ISCRIPT_ENTRYPOINT_EOLIS_KING                      = $08
ISCRIPT_ENTRYPOINT_9                               = $09
ISCRIPT_ENTRYPOINT_10                              = $0a
ISCRIPT_ENTRYPOINT_EOLIS_MEAT_SHOP                 = $0b
ISCRIPT_ENTRYPOINT_EOLIS_KEY_SHOP                  = $0c
ISCRIPT_ENTRYPOINT_EOLIS_TOOL_SHOP                 = $0d
ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS_MAGIC_SHOP   = $0e
ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS              = $0f
ISCRIPT_ENTRYPOINT_16                              = $10
ISCRIPT_ENTRYPOINT_17                              = $11
ISCRIPT_ENTRYPOINT_18                              = $12
ISCRIPT_ENTRYPOINT_19                              = $13
ISCRIPT_ENTRYPOINT_20                              = $14
ISCRIPT_ENTRYPOINT_APOLUNE_DOCTOR                  = $15
ISCRIPT_ENTRYPOINT_22                              = $16
ISCRIPT_ENTRYPOINT_23                              = $17
ISCRIPT_ENTRYPOINT_24                              = $18
ISCRIPT_ENTRYPOINT_APOLUNE_TOOL_SHOP               = $19
ISCRIPT_ENTRYPOINT_APOLUNE_KEY_SHOP                = $1a
ISCRIPT_ENTRYPOINT_27                              = $1b
ISCRIPT_ENTRYPOINT_APOLUNE_GURU                    = $1c
ISCRIPT_ENTRYPOINT_BEFORE_APOLUNE_TOOL_SHOP        = $1d
ISCRIPT_ENTRYPOINT_30_INTRO                        = $1e
ISCRIPT_ENTRYPOINT_31_REMEMBER_YOUR_MANTRA         = $1f
ISCRIPT_ENTRYPOINT_32_FOREPAW_GREETER              = $20
ISCRIPT_ENTRYPOINT_33                              = $21
ISCRIPT_ENTRYPOINT_34                              = $22
ISCRIPT_ENTRYPOINT_35                              = $23
ISCRIPT_ENTRYPOINT_36                              = $24
ISCRIPT_ENTRYPOINT_37_SPRING_OF_SKY                = $25
ISCRIPT_ENTRYPOINT_38_SPRING_OF_TRUNK              = $26
ISCRIPT_ENTRYPOINT_39                              = $27
ISCRIPT_ENTRYPOINT_40_FOREPAW_TOOL_SHOP            = $28
ISCRIPT_ENTRYPOINT_41_FOREPAW_GURU                 = $29
ISCRIPT_ENTRYPOINT_42_FOREPAW_DOCTOR               = $2a
ISCRIPT_ENTRYPOINT_43_FOREPAW_KEY_SHOP             = $2b
ISCRIPT_ENTRYPOINT_44_FOREPAW_MEAT_SHOP            = $2c
ISCRIPT_ENTRYPOINT_45_INTRO                        = $2d
ISCRIPT_ENTRYPOINT_46_INTRO                        = $2e
ISCRIPT_ENTRYPOINT_47_INTRO                        = $2f
ISCRIPT_ENTRYPOINT_48                              = $30
ISCRIPT_ENTRYPOINT_49                              = $31
ISCRIPT_ENTRYPOINT_50                              = $32
ISCRIPT_ENTRYPOINT_51                              = $33
ISCRIPT_ENTRYPOINT_52                              = $34
ISCRIPT_ENTRYPOINT_53_OVERWORLD_MIST_HOUSE_MAN     = $35
ISCRIPT_ENTRYPOINT_54_OVERWORLD_MIST_HOUSE_WOMAN   = $36
ISCRIPT_ENTRYPOINT_55                              = $37
ISCRIPT_ENTRYPOINT_56_MASCON_DOCTOR                = $38
ISCRIPT_ENTRYPOINT_57_MASCON_TOOL_SHOP             = $39
ISCRIPT_ENTRYPOINT_58_MASCON_MEAT_SHOP             = $3a
ISCRIPT_ENTRYPOINT_59_MASCON_KEY_SHOP              = $3b
ISCRIPT_ENTRYPOINT_60_AFTER_MASCON_TOOL_SHOP       = $3c
ISCRIPT_ENTRYPOINT_61_MASCON_GURU                  = $3d
ISCRIPT_ENTRYPOINT_62_INTRO                        = $3e
ISCRIPT_ENTRYPOINT_63_INTRO                        = $3f
ISCRIPT_ENTRYPOINT_64                              = $40
ISCRIPT_ENTRYPOINT_65                              = $41
ISCRIPT_ENTRYPOINT_66                              = $42
ISCRIPT_ENTRYPOINT_67                              = $43
ISCRIPT_ENTRYPOINT_68                              = $44
ISCRIPT_ENTRYPOINT_69                              = $45
ISCRIPT_ENTRYPOINT_70                              = $46
ISCRIPT_ENTRYPOINT_71_VICTIM_DOCTOR                = $47
ISCRIPT_ENTRYPOINT_72_VICTIM_TOOL_SHOP             = $48
ISCRIPT_ENTRYPOINT_73_VICTIM_MEAT_SHOP             = $49
ISCRIPT_ENTRYPOINT_74_VICTIM_KEY_SHOP              = $4a
ISCRIPT_ENTRYPOINT_75_AFTER_VICTIM_MAGIC_SHOP      = $4b
ISCRIPT_ENTRYPOINT_76_VICTIM_GURU                  = $4c
ISCRIPT_ENTRYPOINT_77_INTRO                        = $4d
ISCRIPT_ENTRYPOINT_78_INTRO                        = $4e
ISCRIPT_ENTRYPOINT_79_INTRO                        = $4f
ISCRIPT_ENTRYPOINT_80                              = $50
ISCRIPT_ENTRYPOINT_81                              = $51
ISCRIPT_ENTRYPOINT_82                              = $52
ISCRIPT_ENTRYPOINT_83                              = $53
ISCRIPT_ENTRYPOINT_84                              = $54
ISCRIPT_ENTRYPOINT_85_CONFLATE_GURU                = $55
ISCRIPT_ENTRYPOINT_86_CONFLATE_DOCTOR              = $56
ISCRIPT_ENTRYPOINT_87_CONFLATE_TOOL_SHOP           = $57
ISCRIPT_ENTRYPOINT_88_CONFLATE_MEAT_SHOP           = $58
ISCRIPT_ENTRYPOINT_89_INTRO                        = $59
ISCRIPT_ENTRYPOINT_90_INTRO                        = $5a
ISCRIPT_ENTRYPOINT_91_INTRO                        = $5b
ISCRIPT_ENTRYPOINT_92_INTRO                        = $5c
ISCRIPT_ENTRYPOINT_93_INTRO                        = $5d
ISCRIPT_ENTRYPOINT_94_INTRO                        = $5e
ISCRIPT_ENTRYPOINT_95_INTRO                        = $5f
ISCRIPT_ENTRYPOINT_96                              = $60
ISCRIPT_ENTRYPOINT_97                              = $61
ISCRIPT_ENTRYPOINT_98                              = $62
ISCRIPT_ENTRYPOINT_99                              = $63
ISCRIPT_ENTRYPOINT_100                             = $64
ISCRIPT_ENTRYPOINT_101                             = $65
ISCRIPT_ENTRYPOINT_102_DAYBREAK_TOOL_SHOP          = $66
ISCRIPT_ENTRYPOINT_103_DAYBREAK_MEAT_SHOP          = $67
ISCRIPT_ENTRYPOINT_104_DAYBREAK_KEY_SHOP           = $68
ISCRIPT_ENTRYPOINT_105_DAYBREAK_GURU               = $69
ISCRIPT_ENTRYPOINT_106_INTRO                       = $6a
ISCRIPT_ENTRYPOINT_107_INTRO                       = $6b
ISCRIPT_ENTRYPOINT_108_INTRO                       = $6c
ISCRIPT_ENTRYPOINT_109_INTRO                       = $6d
ISCRIPT_ENTRYPOINT_110_INTRO                       = $6e
ISCRIPT_ENTRYPOINT_111_INTRO                       = $6f
ISCRIPT_ENTRYPOINT_112                             = $70
ISCRIPT_ENTRYPOINT_113_OVERWORLD_HOUSE_MAN         = $71
ISCRIPT_ENTRYPOINT_114_OVERWORLD_HOUSE_WOMAN       = $72
ISCRIPT_ENTRYPOINT_115                             = $73
ISCRIPT_ENTRYPOINT_116_FRATERNAL_GURU              = $74
ISCRIPT_ENTRYPOINT_117_DARTMOOR_TOOL_SHOP          = $75
ISCRIPT_ENTRYPOINT_118_DARTMOOR_MEAT_SHOP          = $76
ISCRIPT_ENTRYPOINT_119_DARTMOOR_KEY_SHOP           = $77
ISCRIPT_ENTRYPOINT_120_FINAL_GURU                  = $78
ISCRIPT_ENTRYPOINT_121_GLAD_YOU_ARE_BACK           = $79
ISCRIPT_ENTRYPOINT_122_DARTMOOR_DOCTOR             = $7a
ISCRIPT_ENTRYPOINT_123_MARK_OF_QUEEN               = $7b
ISCRIPT_ENTRYPOINT_124_MARK_OF_KING                = $7c
ISCRIPT_ENTRYPOINT_125_MARK_OF_ACE                 = $7d
ISCRIPT_ENTRYPOINT_126_MARK_OF_JOKER               = $7e
ISCRIPT_ENTRYPOINT_127_NEED_RING_FOR_DOOR          = $7f
ISCRIPT_ENTRYPOINT_128_USED_RED_POTION             = $80
ISCRIPT_ENTRYPOINT_129_USED_MATTOCK                = $81
ISCRIPT_ENTRYPOINT_130_USED_HOURGLASS              = $82
ISCRIPT_ENTRYPOINT_131_USED_WINGBOOTS              = $83
ISCRIPT_ENTRYPOINT_132_USED_KEY                    = $84
ISCRIPT_ENTRYPOINT_133_USED_ELIXIR                 = $85
ISCRIPT_ENTRYPOINT_134_GOT_ELIXIR                  = $86
ISCRIPT_ENTRYPOINT_135_GOT_RED_POTION              = $87
ISCRIPT_ENTRYPOINT_136_GOT_MATTOCK                 = $88
ISCRIPT_ENTRYPOINT_137_GOT_WINGBOOTS               = $89
ISCRIPT_ENTRYPOINT_138_GOT_HOURGLASS               = $8a
ISCRIPT_ENTRYPOINT_139_GOT_BATTLE_SUIT             = $8b
ISCRIPT_ENTRYPOINT_140_GOT_BATTLE_HELMET           = $8c
ISCRIPT_ENTRYPOINT_141_GOT_DRAGON_SLAYER           = $8d
ISCRIPT_ENTRYPOINT_142_GOT_BLACK_ONYX              = $8e
ISCRIPT_ENTRYPOINT_143_GOT_PENDANT                 = $8f
ISCRIPT_ENTRYPOINT_144_GOT_MAGICAL_ROD             = $90
ISCRIPT_ENTRYPOINT_145_TOUCHED_POISON              = $91
ISCRIPT_ENTRYPOINT_146_GOT_POWER_GLOVE             = $92
ISCRIPT_ENTRYPOINT_147_POWER_GLOVE_GONE            = $93
ISCRIPT_ENTRYPOINT_148_OINTMENT_USED               = $94
ISCRIPT_ENTRYPOINT_149_OINTMENT_GONE               = $95
ISCRIPT_ENTRYPOINT_150_WINGBOOTS_GONE              = $96
ISCRIPT_ENTRYPOINT_151_HOURGLASS_GONE              = $97

;============================================================================
; ItemInventory
;============================================================================
ITEMINVENTORY_RING_OF_ELF                          = $00
ITEMINVENTORY_RING_OF_RUBY                         = $01
ITEMINVENTORY_RING_OF_DWORF                        = $02
ITEMINVENTORY_DEMONS_RING                          = $03
ITEMINVENTORY_KEY_A                                = $04
ITEMINVENTORY_KEY_K                                = $05
ITEMINVENTORY_KEY_Q                                = $06
ITEMINVENTORY_KEY_J                                = $07
ITEMINVENTORY_KEY_JO                               = $08
ITEMINVENTORY_MATTOCK                              = $09
ITEMINVENTORY_MAGICAL_ROD                          = $0a
ITEMINVENTORY_CRYSTAL                              = $0b
ITEMINVENTORY_LAMP                                 = $0c
ITEMINVENTORY_HOUR_GLASS                           = $0d
ITEMINVENTORY_BOOK                                 = $0e
ITEMINVENTORY_WING_BOOTS                           = $0f
ITEMINVENTORY_RED_POTION                           = $10
ITEMINVENTORY_POISON                               = $11
ITEMINVENTORY_ELIXIR                               = $12
ITEMINVENTORY_PENDANT                              = $13
ITEMINVENTORY_BLACK_ONYX                           = $14
ITEMINVENTORY_FIRE_CRYSTAL                         = $15
ITEMINVENTORY_NO_ITEM_SELECTED                     = $ff

;============================================================================
; Message
;============================================================================
MESSAGEID_UNSET                                    = $00
MESSAGEID_HELP_WITH_ANYTHING                       = $01
MESSAGEID_THANK_YOU_FOR_SHOPPING                   = $02
MESSAGEID_NOT_ENOUGH_GOLD                          = $03
MESSAGEID_ANYTHING_ELSE                            = $04
MESSAGEID_COME_BACK_AGAIN                          = $05
MESSAGEID_CANT_CARRY_MORE                          = $06
MESSAGEID_DRIED_MEAT_50G                           = $07
MESSAGEID_DRIED_MEAT_150G                          = $08
MESSAGEID_DRIED_MEAT_180G                          = $09
MESSAGEID_DRIED_MEAT_250G                          = $0a
MESSAGEID_DRIED_MEAT_350G                          = $0b
MESSAGEID_DRIED_MEAT_500G                          = $0c
MESSAGEID_DRIED_MEAT_800G                          = $0d
MESSAGEID_I_SELL_KEYS                              = $0e
MESSAGEID_I_SELL_TOOLS                             = $0f
MESSAGEID_COME_HERE_TO_BUY_SELL                    = $10
MESSAGEID_NO_KEY                                   = $11
MESSAGEID_NOTHING_TO_BUY                           = $12
MESSAGEID_WHICH_TO_SELL                            = $13
MESSAGEID_WHAT_WOULD_YOU_LIKE                      = $14
MESSAGEID_MAGIC_200G                               = $15
MESSAGEID_WATCH_POWER_LEVEL                        = $16
MESSAGEID_MAGIC_FIRE_3000G                         = $17
MESSAGEID_DONT_RELY_ON_MAGIC                       = $18
MESSAGEID_MARTIAL_ARTS_200G                        = $19
MESSAGEID_DO_YOU_WANT_TREATMENT                    = $1a
MESSAGEID_DONT_TRY_TOO_HARD                        = $1b
MESSAGEID_250G_PLEASE                              = $1c
MESSAGEID_500G_PLEASE                              = $1d
MESSAGEID_1000G_PLEASE                             = $1e
MESSAGEID_2500G_PLEASE                             = $1f
MESSAGEID_1800G_PLEASE                             = $20
MESSAGEID_3000G_PLEASE                             = $21
MESSAGEID_MEDITATE_WITH_YOU                        = $22
MESSAGEID_NEW_TITLE                                = $23
MESSAGEID_REMEMBER_YOUR_MANTRA                     = $24
MESSAGEID_HEAR_AGAIN                               = $25
MESSAGEID_INTRO                                    = $26
MESSAGEID_GO_SEE_KING                              = $27
MESSAGEID_DIRECTIONS_APOLUNE                       = $28
MESSAGEID_MARK_OF_JACK                             = $29
MESSAGEID_THIS_IS_EOLIS                            = $2a
MESSAGEID_LOOK_FOR_RINGS                           = $2b
MESSAGEID_TAKE_RING_TO_KING                        = $2c
MESSAGEID_VISIT_GURUS_GET_TITLE                    = $2d
MESSAGEID_LAST_WELL_ALMOST_DRY                     = $2e
MESSAGEID_THIS_IS_FOREPAW                          = $2f
MESSAGEID_DWARVES_ARE_HERE                         = $30
MESSAGEID_DO_YOU_HAVE_WEAPON                       = $31
MESSAGEID_CANT_LET_YOU_GO                          = $32
MESSAGEID_KING_IS_WAITING                          = $33
MESSAGEID_GOOD_LUCK                                = $34
MESSAGEID_KING_EXPOSITION                          = $35
MESSAGEID_NOTHING_MORE_TO_HELP                     = $36
MESSAGEID_DWARVES_ROBBING_ELVES                    = $37
MESSAGEID_METEORITE_EXPOSITION                     = $38
MESSAGEID_LISTEN_TO_PEOPLE                         = $39
MESSAGEID_DONT_TRY_TOO_HARD_2                      = $3a
MESSAGEID_WELCOME_TO_APOLUNE                       = $3b
MESSAGEID_DIRECTIONS_FOREPAW                       = $3c
MESSAGEID_DIRECTIONS_TO_TRUNK                      = $3d
MESSAGEID_GOOD_LUCK_2                              = $3e
MESSAGEID_SHOULD_HAVE_SHIELD                       = $3f
MESSAGEID_MATTOCK_IN_TOWER                         = $40
MESSAGEID_BLOCKED_PASSAGE                          = $41
MESSAGEID_MATTOCK_BREAKS_WALL                      = $42
MESSAGEID_YOU_NEED_KEY                             = $43
MESSAGEID_YOU_NEED_DIFFERENT_KEY                   = $44
MESSAGEID_DOCTOR_CAN_HELP                          = $45
MESSAGEID_POISON_IS_BAD                            = $46
MESSAGEID_LEARN_MANTRAS                            = $47
MESSAGEID_SECRET_GURU_IN_TOWER                     = $48
MESSAGEID_CARRY_ITEMS                              = $49
MESSAGEID_WELCOME_TO_FOREPAW                       = $4a
MESSAGEID_FOUNTAIN_WILL_FLOW_TO_TOWN               = $4b
MESSAGEID_FIND_3_SPRINGS                           = $4c
MESSAGEID_WATER_IS_FLOWING                         = $4d
MESSAGEID_FOUNTAIN_IN_SKY                          = $4e
MESSAGEID_PUSH_FOUNTAIN_ROCK                       = $4f
MESSAGEID_SPRING_IN_TOWER                          = $50
MESSAGEID_WINGBOOTS_IN_TOWER                       = $51
MESSAGEID_DIRECTIONS_TO_MASCON                     = $52
MESSAGEID_LOOK_FOR_WINGBOOTS                       = $53
MESSAGEID_FOUNTAIN_IN_SKY_HINT                     = $54
MESSAGEID_USE_THIS_KEY_FOR_FIRST_SPRING            = $55
MESSAGEID_GET_JOKER_OR_COME_BACK                   = $56
MESSAGEID_HO_HO_HO_ZZZ                             = $57
MESSAGEID_GET_KEY_FIND_FOUNTAIN                    = $58
MESSAGEID_THIS_IS_SPRING_OF_TRUNK_GET_ELIXIR       = $59
MESSAGEID_2_MORE_SPRINGS                           = $5a
MESSAGEID_COME_BACK_WITH_MEDICINE                  = $5b
MESSAGEID_FIND_POISON_IN_MASCON                    = $5c
MESSAGEID_WILL_REVIVE_SPRING                       = $5d
MESSAGEID_GIVING_RING_OF_RUBY                      = $5e
MESSAGEID_TRUST_YOUR_POWER                         = $5f
MESSAGEID_WELCOME_TO_MASCON                        = $60
MESSAGEID_PREPARE_BEFORE_FOREPAW                   = $61
MESSAGEID_METEORITE_BECOMES_POISON                 = $62
MESSAGEID_DID_YOU_GET_PENDANT                      = $63
MESSAGEID_STORES_OUTSIDE_TOWN                      = $64
MESSAGEID_THIS_IS_LARGE_SHIELD                     = $65
MESSAGEID_DIRECTIONS_TO_SUFFER                     = $66
MESSAGEID_NEED_WING_BOOTS_FOR_MIST                 = $67
MESSAGEID_WELCOME_TO_MIST                          = $68
MESSAGEID_HOUSE_OUTSIDE_ABANDONED                  = $69
MESSAGEID_TOWER_OF_SUFFER_SOON                     = $6a
MESSAGEID_KEEP_PENDANT                             = $6b
MESSAGEID_DWARVES_CHANTING                         = $6c
MESSAGEID_METEORITE_WAS_MOVED                      = $6d
MESSAGEID_HOUR_GLASS                               = $6e
MESSAGEID_HOUR_GLASS_USES_ENERGY                   = $6f
MESSAGEID_WELCOME_TO_VICTIM                        = $70
MESSAGEID_DANGEROUS_WITHOUT_MAGIC                  = $71
MESSAGEID_MAGIC_HALL_OUTSIDE_TOWN                  = $72
MESSAGEID_MAGIC_CANE                               = $73
MESSAGEID_GO_TO_CAPITAL                            = $74
MESSAGEID_GOT_ARMOR_FOR_BOTTLE                     = $75
MESSAGEID_ILL_HAVE_DRINK                           = $76
MESSAGEID_IM_LOST                                  = $77
MESSAGEID_IM_LOST_MAGIC_DOES_NOT_WORK              = $78
MESSAGEID_MAGIC_OF_JUSTICE_OR_DESTRUCTION          = $79
MESSAGEID_MAGIC_INDIVIDUAL_POWERS                  = $7a
MESSAGEID_MAGIC_CONSUMES_POWER                     = $7b
MESSAGEID_METEORITE_BECOMES_BLACK_ONYX             = $7c
MESSAGEID_DIRECTIONS_TO_TOWER_OF_MIST              = $7d
MESSAGEID_USE_KEY_FOR_CONFLATE                     = $7e
MESSAGEID_YOU_NEED_KEY_ACE                         = $7f
MESSAGEID_WELCOME_TO_CONFLATE                      = $80
MESSAGEID_LEGENDARY_SHIELD_HELMET                  = $81
MESSAGEID_TOWN_SURROUNDED_BY_DOORS                 = $82
MESSAGEID_SEE_GURU_AFTER_SHIELD_HELMET             = $83
MESSAGEID_GUARDIAN_OF_GURU                         = $84
MESSAGEID_SOMETHING_YOU_CAN_GET                    = $85
MESSAGEID_DONT_RELY_ON_MAGIC_FINAL_BATTLE          = $86
MESSAGEID_USED_TO_TRADE_WITH_DWARVES               = $87
MESSAGEID_USED_TO_BE_SKILLED                       = $88
MESSAGEID_USED_TO_VISIT_DWARVES                    = $89
MESSAGEID_I_AM_PICKPOCKET                          = $8a
MESSAGEID_NEED_FINAL_WEAPON_ARMOR                  = $8b
MESSAGEID_DIRECTIONS_DARTMORE                      = $8c
MESSAGEID_DIRECTIONS_DAYBREAK                      = $8d
MESSAGEID_FRIENDS_IN_DARTMOOR                      = $8e
MESSAGEID_LOOK_FOR_BATTLE_SUIT                     = $8f
MESSAGEID_FIND_MAGIC_CANE                          = $90
MESSAGEID_YOU_ARE_FAMOUS_GOOD_LOOKING              = $91
MESSAGEID_AUTOGRAPH                                = $92
MESSAGEID_WHEN_TAKE_BATH                           = $93
MESSAGEID_GURU_CONFLATE_HAS_RING_DWARVES           = $94
MESSAGEID_DID_YOU_GET_BATTLE_SUIT                  = $95
MESSAGEID_DARTMORE_IS_MAZE                         = $96
MESSAGEID_IS_FIRST_VISIT_TO_STORE                  = $97
MESSAGEID_MAGIC_CANE_ABOVE_TOWER                   = $98
MESSAGEID_DIRECTIONS_TO_FRATERNAL                  = $99
MESSAGEID_YOU_NEED_DEMONS_RING                     = $9a
MESSAGEID_KING_GRIEVE_HAS_DRAGON_SLAYER            = $9b
MESSAGEID_DEFEAT_EVIL_WITH_DRAGON_SLAYER           = $9c
MESSAGEID_GO_TO_FRATERNAL_GURU                     = $9d
MESSAGEID_GURU_HAS_DEMONS_RING                     = $9e
MESSAGEID_SEARCH_CASTLE_FOR_GURU                   = $9f
MESSAGEID_EVIL_IMMUNE_TO_MAGIC                     = $a0
MESSAGEID_METEORITE_EXPOSITION_2                   = $a1
MESSAGEID_DEFEATED_KING_GRIEVE                     = $a2
MESSAGEID_ILL_MEDITATE_FOR_YOU                     = $a3
MESSAGEID_GLAD_YOURE_BACK                          = $a4
MESSAGEID_MARK_OF_QUEEN                            = $a5
MESSAGEID_MARK_OF_KING                             = $a6
MESSAGEID_MARK_OF_ACE                              = $a7
MESSAGEID_MARK_OF_JOKER                            = $a8
MESSAGEID_NEED_RING_FOR_DOOR                       = $a9
MESSAGEID_USED_RED_POTION                          = $aa
MESSAGEID_USED_MATTOCK                             = $ab
MESSAGEID_USED_HOURGLASS                           = $ac
MESSAGEID_USED_WINGBOOTS                           = $ad
MESSAGEID_USED_KEY                                 = $ae
MESSAGEID_USED_ELIXIR                              = $af
MESSAGEID_HOLDING_ELIXIR                           = $b0
MESSAGEID_HOLDING_RED_POTION                       = $b1
MESSAGEID_HOLDING_MATTOCK                          = $b2
MESSAGEID_HOLDING_WINGBOOTS                        = $b3
MESSAGEID_HOLDING_HOURGLASS                        = $b4
MESSAGEID_GOT_BATTLE_SUIT                          = $b5
MESSAGEID_GOT_BATTLE_HELMET                        = $b6
MESSAGEID_GOT_DRAGON_SLAYER                        = $b7
MESSAGEID_GOT_BLACK_ONYX                           = $b8
MESSAGEID_GOT_PENDANT                              = $b9
MESSAGEID_GOT_MAGICAL_ROD                          = $ba
MESSAGEID_TOUCHED_POISON                           = $bb
MESSAGEID_GLOVE_INCREASES_POWER                    = $bc
MESSAGEID_POWER_GLOVE_IS_GONE                      = $bd
MESSAGEID_USED_OINTMENT                            = $be
MESSAGEID_OINTMENT_GONE                            = $bf
MESSAGEID_WINGBOOTS_GONE                           = $c0
MESSAGEID_HOURGLASS_GONE                           = $c1
MESSAGEID_CHAR_PLAYER_TITLE                        = $fb
MESSAGEID_CHAR_PAUSE                               = $fc
MESSAGEID_CHAR_SPACE                               = $fd
MESSAGEID_CHAR_NEWLINE                             = $fe
MESSAGEID_CHAR_END                                 = $ff

;============================================================================
; MovingSpriteVisibility
;============================================================================
MOVING_SPRITE_FULLY_VISIBLE                        = $00
MOVING_SPRITE_TRAILING_OBSCURED                    = $01
MOVING_SPRITE_LEADING_OBSCURED                     = $02
MOVING_SPRITE_FULLY_OBSCURED                       = $03

;============================================================================
; MScriptOp
;============================================================================
MSCRIPT_OP_SET_SQ2_PITCH_BIAS                      = $ee
MSCRIPT_OP_SET_SQ_PITCH_EFFECT_DEPTH               = $ef
MSCRIPT_OP_SET_SQ_ENVELOPE_MODE                    = $f0
MSCRIPT_OP_SET_SQ_FADE                             = $f1
MSCRIPT_OP_SET_SQ_CONTROL_BITS                     = $f2
MSCRIPT_OP_SET_NOTE_DURATION                       = $f3
MSCRIPT_OP_RESTART_CHANNEL                         = $f4
MSCRIPT_OP_RET                                     = $f5
MSCRIPT_OP_SET_CHANNEL_TRANSPOSE                   = $f6
MSCRIPT_OP_SET_GLOBAL_TRANSPOSE                    = $f7
MSCRIPT_OP_JSR                                     = $f8
MSCRIPT_OP_PUSH_ADDR                               = $f9
MSCRIPT_OP_NOOP                                    = $fa
MSCRIPT_OP_NEXT_LOOP_IF_N_ITERS                    = $fb
MSCRIPT_OP_END_LOOP                                = $fc
MSCRIPT_OP_BEGIN_LOOP                              = $fd
MSCRIPT_OP_POP_ADDR                                = $fe
MSCRIPT_OP_END                                     = $ff

;============================================================================
; Music
;============================================================================
MUSIC_NONE                                         = $00
MUSIC_START_THEME                                  = $01
MUSIC_DAYBREAK                                     = $02
MUSIC_APOLUNE                                      = $03
MUSIC_CONFLATE                                     = $04
MUSIC_FOREPAW                                      = $05
MUSIC_MAYBE_TOWER                                  = $06
MUSIC_EOLIS                                        = $07
MUSIC_DEATH                                        = $08
MUSIC_MASCON_VICTIM                                = $09
MUSIC_BOSS                                         = $0a
MUSIC_HOURGLASS                                    = $0b
MUSIC_MAYBE_ENDING                                 = $0c
MUSIC_KINGS_ROOM                                   = $0d
MUSIC_TEMPLE                                       = $0e
MUSIC_SHOP                                         = $0f
MUSIC_EVIL_FORTRESS                                = $10

;============================================================================
; MusicNote
;============================================================================
NOTE_REST                                          = $00
NOTE_01_C2                                         = $01
NOTE_02_Cs2                                        = $02
NOTE_03_D2                                         = $03
NOTE_04_Ds2                                        = $04
NOTE_05_E2                                         = $05
NOTE_06_F2                                         = $06
NOTE_07_Fs2                                        = $07
NOTE_08_G2                                         = $08
NOTE_09_Gs2                                        = $09
NOTE_0A_A2                                         = $0a
NOTE_0B_As2                                        = $0b
NOTE_0C_B2                                         = $0c
NOTE_0D_C3                                         = $0d
NOTE_0E_Cs3                                        = $0e
NOTE_0F_D3                                         = $0f
NOTE_10_Ds3                                        = $10
NOTE_11_E3                                         = $11
NOTE_12_F3                                         = $12
NOTE_13_Fs3                                        = $13
NOTE_14_G3                                         = $14
NOTE_15_Gs3                                        = $15
NOTE_16_A3                                         = $16
NOTE_17_As3                                        = $17
NOTE_18_B3                                         = $18
NOTE_19_C4                                         = $19
NOTE_1A_Cs4                                        = $1a
NOTE_1B_D4                                         = $1b
NOTE_1C_Ds4                                        = $1c
NOTE_1D_E4                                         = $1d
NOTE_1E_F4                                         = $1e
NOTE_1F_Fs4                                        = $1f
NOTE_20_G4                                         = $20
NOTE_21_Gs4                                        = $21
NOTE_22_A4                                         = $22
NOTE_23_As4                                        = $23
NOTE_24_B4                                         = $24
NOTE_25_C5                                         = $25
NOTE_26_Cs5                                        = $26
NOTE_27_D5                                         = $27
NOTE_28_Ds5                                        = $28
NOTE_29_E5                                         = $29
NOTE_2A_F5                                         = $2a
NOTE_2B_Fs5                                        = $2b
NOTE_2C_G5                                         = $2c
NOTE_2D_Gs5                                        = $2d
NOTE_2E_A5                                         = $2e
NOTE_2F_As5                                        = $2f
NOTE_30_B5                                         = $30
NOTE_31_C6                                         = $31
NOTE_32_Cs6                                        = $32
NOTE_33_D6                                         = $33
NOTE_34_Ds6                                        = $34
NOTE_35_E6                                         = $35
NOTE_36_F6                                         = $36
NOTE_37_Fs6                                        = $37
NOTE_38_G6                                         = $38
NOTE_39_Gs6                                        = $39
NOTE_3A_A6                                         = $3a
NOTE_3B_As6                                        = $3b
NOTE_3C_B6                                         = $3c

;============================================================================
; Palette
;============================================================================
PALETTE_EOLIS                                      = $00
PALETTE_01                                         = $01
PALETTE_02                                         = $02
PALETTE_03                                         = $03
PALETTE_04                                         = $04
PALETTE_05                                         = $05
PALETTE_OUTSIDE                                    = $06
PALETTE_TOWER                                      = $07
PALETTE_BRANCH                                     = $08
PALETTE_LEFT_TRUNK                                 = $09
PALETTE_MIST                                       = $0a
PALETTE_SUFFER                                     = $0b
PALETTE_DARTMOOR                                   = $0c
PALETTE_FRATERNAL                                  = $0d
PALETTE_KING_GRIEVES_ROOM                          = $0e
PALETTE_EVIL_FORTRESS                              = $0f
PALETTE_START_SCREEN                               = $10
PALETTE_KINGS_ROOM                                 = $11
PALETTE_TEMPLE                                     = $12
PALETTE_HOSPITAL                                   = $13
PALETTE_TAVERN                                     = $14
PALETTE_TOOL_SHOP                                  = $15
PALETTE_KEY_SHOP                                   = $16
PALETTE_HOUSE                                      = $17
PALETTE_MEAT_SHOP                                  = $18
PALETTE_MARTIAL_ARTS                               = $19
PALETTE_MAGIC_SHOP                                 = $1a
PALETTE_TOWN                                       = $1b

;============================================================================
; PlayerFlags
;============================================================================
PLAYER_FLAGS_UNSET                                 = $00
PLAYER_JUMPING                                     = $01
PLAYER_HOLDING_TO_CLIMB                            = $02
PLAYER_FALLING_OFF                                 = $04
PLAYER_CAN_CLIMB                                   = $08
PLAYER_CLIMBING                                    = $10
PLAYER_MOVING                                      = $20
PLAYER_FACING_RIGHT                                = $40
PLAYER_CLEAR_ATTACKING                             = $7f
PLAYER_ATTACKING                                   = $80
PLAYER_CLEAR_FACING_RIGHT                          = $bf
PLAYER_CLEAR_MOVING                                = $df
PLAYER_CLEAR_CLIMBING                              = $ef
PLAYER_CLEAR_CAN_CLIMB                             = $f7
PLAYER_CLEAR_FALLING_OFF                           = $fb
PLAYER_CLEAR_JUMPING                               = $fe
PLAYER_FLAGS_ALL                                   = $ff

;============================================================================
; PlayerStatusFlags
;============================================================================
PLAYER_STATUS_NONE                                 = $00
PLAYER_STATUS_ATTACKING                            = $01
PLAYER_STATUS_KNOCKBACK                            = $02
PLAYER_STATUS_WING_BOOTS                           = $80
PLAYER_STATUS_CLEAR_ATTACKING                      = $fe

;============================================================================
; PlayerTitle
;============================================================================
RANK_NOVICE                                        = $00
RANK_ASPIRANT                                      = $01
RANK_BATTLER                                       = $02
RANK_FIGHTER                                       = $03
RANK_ADEPT                                         = $04
RANK_CHEVALIER                                     = $05
RANK_VETERAN                                       = $06
RANK_WARRIOR                                       = $07
RANK_SWORDMAN                                      = $08
RANK_HERO                                          = $09
RANK_SOLDIER                                       = $0a
RANK_MYRMIDON                                      = $0b
RANK_CHAMPION                                      = $0c
RANK_SUPERHERO                                     = $0d
RANK_PALADIN                                       = $0e
RANK_LORD                                          = $0f

;============================================================================
; PPUCtrlFlags
;============================================================================
PPUCTRL_NAMETABLE_2000                             = $00
PPUCTRL_NAMETABLE_2400                             = $01
PPUCTRL_NAMETABLE_2800                             = $02
PPUCTRL_NAMETABLE_2C00                             = $03
PPUCTRL_VRAM_INC_ADD32_DOWN                        = $04
PPUCTRL_SPRITE_PATTERN_1000                        = $08
PPUCTRL_BGTABLE_ADDR_1000                          = $10
PPUCTRL_SPRITE_SIZE_8x16                           = $20
PPUCTRL_PPU_OUTPUT_COLOR_ON_EXT                    = $40
PPUCTRL_VBLANK_DISABLE                             = $7f
PPUCTRL_VBLANK_ENABLE                              = $80
PPUCTRL_VRAM_INC_ADD1_ACROSS                       = $fb
PPUCTRL_CLEAR_NAMETABLE_2400                       = $fe

;============================================================================
; PPUMaskFlags
;============================================================================
PPUMASK_CLEAR                                      = $00
PPUMASK_GREYSCALE                                  = $01
PPUMASK_SHOW_BG_LEFTMOST_8                         = $02
PPUMASK_SHOW_SPRITES_LEFTMOST_8                    = $04
PPUMASK_ENABLE_BG                                  = $08
PPUMASK_ENABLE_SPRITES                             = $10
PPUMASK_EMPHASIZE_RED                              = $20
PPUMASK_EMPHASIZE_GREEN                            = $40
PPUMASK_EMPHASIZE_BLUE                             = $80
PPUMASK_CLEAR_GREYSCALE                            = $fe

;============================================================================
; PPUStatusFlags
;============================================================================
PPUSTATUS_SPRITE_OVERFLOW                          = $20
PPUSTATUS_SPRITE_0_HIT                             = $40
PPUSTATUS_VBLANK                                   = $80

;============================================================================
; Quests
;============================================================================
QUEST_NONE                                         = $00
QUEST_SPRING_OF_TRUNK                              = $01
QUEST_SPRING_OF_SKY                                = $02
QUEST_SPRING_OF_JOKER                              = $04
QUEST_ALL_SPRINGS                                  = $07
QUEST_WING_BOOTS_FROM_TOWER                        = $08
QUEST_MATTOCK                                      = $10
QUEST_MASCON_OPENED                                = $20

;============================================================================
; ROMBank
;============================================================================
BANK_0_AREA_DATA                                   = $00
BANK_1_AREA_DATA                                   = $01
BANK_2_AREA_DATA                                   = $02
BANK_3_AREA_METADATA                               = $03
BANK_5_AUDIO_LOGIC                                 = $05
BANK_6_SPRITES                                     = $06
BANK_7_SPRITES                                     = $07
BANK_8_SPRITES                                     = $08
BANK_9_UNUSED                                      = $09
BANK_10_CHRRAM                                     = $0a
BANK_11_SPRITEINFO_PALETTES                        = $0b
BANK_12_LOGIC                                      = $0c
BANK_13_STRINGS                                    = $0d
BANK_14_LOGIC                                      = $0e
BANK_15_LOGIC                                      = $0f

;============================================================================
; ScreenEventID
;============================================================================
SCREEN_EVENT_PATH_TO_MASCON                        = $00
SCREEN_EVENT_BOSS                                  = $01
SCREEN_EVENT_FINAL_BOSS                            = $02
SCREEN_EVENT_UNSET                                 = $ff

;============================================================================
; ScreenExtraInfo
;============================================================================
SCREEN_HAS_SPECIAL_EVENT                           = $80

;============================================================================
; ScreenReadyState
;============================================================================
SCREEN_STATE_READY                                 = $00
SCREEN_STATE_NOT_PLAYING                           = $ff

;============================================================================
; ScreenScrollLoadMode
;============================================================================
SCROLL_LOAD_TILES                                  = $00
SCROLL_LOAD_ATTRS                                  = $01

;============================================================================
; SelectedMagic
;============================================================================
SELECTEDMAGIC_DELUGE                               = $00
SELECTEDMAGIC_THUNDER                              = $01
SELECTEDMAGIC_FIRE                                 = $02
SELECTEDMAGIC_DEATH                                = $03
SELECTEDMAGIC_TILTE                                = $04
SELECTEDMAGIC_DELUGE_AFTER_HIT                     = $05
SELECTEDMAGIC_THUNDER_AFTER_HIT                    = $06
SELECTEDMAGIC_FIRE_AFTER_HIT                       = $07
SELECTEDMAGIC_DEATH_AFTER_HIT                      = $08
SELECTEDMAGIC_UNKNOWN_9                            = $09
SELECTEDMAGIC_HIT_WALL_EFFECT                      = $0a
SELECTEDMAGIC_TILTE_AFTER_HIT                      = $0b
SELECTEDMAGIC_NONE                                 = $ff

;============================================================================
; ShieldInventory
;============================================================================
SHIELDINVENTORY_SMALL                              = $00
SHIELDINVENTORY_LARGE                              = $01
SHIELDINVENTORY_MAGIC                              = $02
SHIELDINVENTORY_BATTLE_HELMET                      = $03
SHIELDINVENTORY_UNSET                              = $ff

;============================================================================
; ShopItem
;============================================================================
SHOP_ITEM_HAND_DAGGER                              = $00
SHOP_ITEM_LONG_SWORD                               = $01
SHOP_ITEM_GIANT_BLADE                              = $02
SHOP_ITEM_DRAGON_SLAYER                            = $03
SHOP_ITEM_LEATHER_ARMOR                            = $20
SHOP_ITEM_STUDDEDMAIL                              = $21
SHOP_ITEM_FULL_PLATE                               = $22
SHOP_ITEM_BATTLE_SUIT                              = $23
SHOP_ITEM_SMALL_SHIELD                             = $40
SHOP_ITEM_LARGE_SHIELD                             = $41
SHOP_ITEM_MAGIC_SHIELD                             = $42
SHOP_ITEM_BATTLE_HELMET                            = $43
SHOP_ITEM_DELUGE                                   = $60
SHOP_ITEM_THUNDER                                  = $61
SHOP_ITEM_FIRE                                     = $62
SHOP_ITEM_DEATH                                    = $63
SHOP_ITEM_TILTE                                    = $64

;============================================================================
; SoundChannels
;============================================================================
SNDCHN_PULSE_1                                     = $01
SNDCHN_PULSE_2                                     = $02
SNDCHN_TRIANGLE                                    = $04
SNDCHAN_NOISE                                      = $08
SNDCHN_DMC                                         = $10

;============================================================================
; SoundID
;============================================================================
SOUND_MESSAGE                                      = $01
SOUND_HIT_ENEMY                                    = $02
SOUND_ENEMY_DEAD                                   = $03
SOUND_PLAYER_HIT                                   = $04
SOUND_MAGIC                                        = $05
SOUND_OPEN_DOOR                                    = $06
SOUND_TYPING                                       = $07
SOUND_ITEM_PICK_UP                                 = $08
SOUND_TOUCH_COIN                                   = $09
SOUND_MAGIC_HIT_OBSTACLE                           = $0a
SOUND_MAYBE_MOVE_CURSOR                            = $0b
SOUND_SHIELD_HIT_BY_MAGIC                          = $0c
SOUND_INVALID_CHOICE                               = $0d
SOUND_MAYBE_ENTER_PASSWORD_CHAR                    = $0e
SOUND_PUSHING                                      = $0f
SOUND_MAYBE_DROP_COIN                              = $10
SOUND_17                                           = $11
SOUND_PAKUKAME                                     = $12
SOUND_FILL_HP_OR_MANA                              = $13
SOUND_TILTE_MAGIC                                  = $14
SOUND_MAYBE_STEP_SOUND                             = $15
SOUND_PLAYER_DEATH                                 = $16
SOUND_DROP_LADDER                                  = $17
SOUND_SHOW_PLAYER_MENU                             = $18
SOUND_MAYBE_GOLD_CHANGE                            = $19
SOUND_USE_SPECIAL_ITEM_2                           = $1a
SOUND_TOUCH_BREAD                                  = $1b
SOUND_28                                           = $1c
SOUND_MAX_IDS                                      = $1d

;============================================================================
; SpecialItemsBits
;============================================================================
BIT_UNSET                                          = $00
BIT_BLACK_ONYX                                     = $01
BIT_PENDANT                                        = $02
BIT_MAGICAL_ROD                                    = $04
BIT_ELIXIR                                         = $08
BIT_DEMONS_RING                                    = $10
BIT_RING_OF_DWORF                                  = $20
BIT_RING_OF_RUBY                                   = $40
BIT_RING_OF_ELF                                    = $80
BIT_CLEAR_ELIXIR                                   = $f7
BIT_ALL                                            = $ff

;============================================================================
; Sprite0Mode
;============================================================================
SPRITE0_MODE_X8_Y23                                = $00
SPRITE0_MODE_X0_Y72                                = $01
SPRITE0_MODE_NONE                                  = $ff

;============================================================================
; SpriteAction
;============================================================================
SPRITE_ACTION_FACE_PLAYER_X                        = $00
SPRITE_ACTION_FLIP_X_DIRECTION                     = $01
SPRITE_ACTION_FACE_PLAYER_Y                        = $02
SPRITE_ACTION_FLIP_Y_DIRECTION                     = $03
SPRITE_ACTION_RANDOMLY_FLIP_X_DIRECTION            = $04
SPRITE_ACTION_RANDOMLY_FLIP_Y_DIRECTION            = $05
SPRITE_ACTION_FLY_UP                               = $06
SPRITE_ACTION_CAST_MAGIC                           = $07

;============================================================================
; SpriteBehavior
;============================================================================
SPRITE_BEHAVIOR_MOVE_TOWARD_PLAYER                   = $00
SPRITE_BEHAVIOR_WAIT                                 = $01
SPRITE_BEHAVIOR_BOUNCE_AND_EXPIRE                    = $02
SPRITE_BEHAVIOR_GARBLED_3                            = $03
SPRITE_BEHAVIOR_WALK_FORWARD                         = $04
SPRITE_BEHAVIOR_ENEMY_UNUSED_18                      = $06
SPRITE_BEHAVIOR_MAYBE_LIGHTNINGBALL                  = $07
SPRITE_BEHAVIOR_LIGHTNINBALL_CHARRON                 = $08
SPRITE_BEHAVIOR_HOP                                  = $09
SPRITE_BEHAVIOR_RIPASHEIKU                           = $0a
SPRITE_BEHAVIOR_BORABOHRA                            = $0c
SPRITE_BEHAVIOR_PAKUKAME                             = $0d
SPRITE_BEHAVIOR_ZORUGERIRU                           = $0e
SPRITE_BEHAVIOR_KING_GRIEVE                          = $0f
SPRITE_BEHAVIOR_SHADOW_EURA                          = $10
SPRITE_BEHAVIOR_MAYBE_MOVE_XY                        = $11
SPRITE_BEHAVIOR_SOMETHING_ZORADOHNA_18               = $12
SPRITE_BEHAVIOR_MOVE_VERT                            = $13
SPRITE_BEHAVIOR_FALL                                 = $15
SPRITE_BEHAVIOR_NECRON_AIDES                         = $16
SPRITE_BEHAVIOR_BIHORUDA                             = $17
SPRITE_BEHAVIOR_LILITH                               = $18
SPRITE_BEHAVIOR_YUINARU                              = $19
SPRITE_BEHAVIOR_NASH                                 = $1a
SPRITE_BEHAVIOR_SOMETHING_GARBLED_81                 = $1b
SPRITE_BEHAVIOR_SOMETHING_GARBLED_10                 = $1c
SPRITE_BEHAVIOR_UNKNOWN_29                           = $1d
SPRITE_BEHAVIOR_CLEAR_READY_SET_BIT_7                = $1e
SPRITE_BEHAVIOR_FLASH_DAMAGE_PLAYER                  = $1f
SPRITE_BEHAVIOR_GIANT_BEES                           = $20
SPRITE_BEHAVIOR_NAGA                                 = $21
SPRITE_BEHAVIOR_YAREEKA                              = $22
SPRITE_BEHAVIOR_MAGMAN                               = $23
SPRITE_BEHAVIOR_ENEMY_UNUSED_36                      = $24
SPRITE_BEHAVIOR_ENEMY_UNUSED_39                      = $25
SPRITE_BEHAVIOR_ENEMY_UNUSED_43                      = $26
SPRITE_BEHAVIOR_TAMAZUTSU                            = $27
SPRITE_BEHAVIOR_SIR_GAWAINE_WOLFMAN                  = $28
SPRITE_BEHAVIOR_ITEM_OINTMENT                        = $29
SPRITE_BEHAVIOR_ITEM_GLOVE                           = $2a
SPRITE_BEHAVIOR_BATTLE_SUIT_DROPPED_BY_ZORADOHNA     = $2b
SPRITE_BEHAVIOR_BATTLE_HELMET_DROPPED_BY_ZORADOHNA   = $2c
SPRITE_BEHAVIOR_DRAGON_SLAYER_DROPPED_BY_KING_GRIEVE = $2d
SPRITE_BEHAVIOR_MATTOCK_DROPPED_BY_RPIASHEIKU        = $2e
SPRITE_BEHAVIOR_WING_BOOTS_DROPPED_BY_ZORUGERIRU     = $2f
SPRITE_BEHAVIOR_BLACK_ONYX_DROPPED_FROM_ZORADOHNA    = $30
SPRITE_BEHAVIOR_PENDANT_DROPPED_FROM_RIPASHEIKU      = $31
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_50                = $32
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_51                = $33
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_52                = $34
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_53                = $35
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_54                = $36
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_55                = $37
SPRITE_BEHAVIOR_RANDOMLY_SHOW_ITEM_56                = $38
SPRITE_BEHAVIOR_FOUNTAIN                             = $39
SPRITE_BEHAVIOR_SPRING_OF_FORTRESS                   = $3a
SPRITE_BEHAVIOR_SPRING_OF_SKY                        = $3b
SPRITE_BEHAVIOR_SPRING_OF_JOKER                      = $3c
SPRITE_BEHAVIOR_SHOW_MAGICAL_ROD                     = $3d
SPRITE_BEHAVIOR_EFFECT_BOSS_DEATH                    = $3e
SPRITE_BEHAVIOR_BUZZ_AROUND                          = $3f
SPRITE_BEHAVIOR_ISHIISU                              = $40
SPRITE_BEHAVIOR_EXECUTION_HOOD                       = $41
SPRITE_BEHAVIOR_CLEAR_BIT_7                          = $7f

;============================================================================
; SpriteCategory
;============================================================================
SPRITE_ENEMY                                       = $00
SPRITE_DROPPED                                     = $01
SPRITE_NPC                                         = $02
SPRITE_EFFECT                                      = $03
SPRITE_TRIGGER                                     = $04
SPRITE_ITEM                                        = $05
SPRITE_MAGIC                                       = $06
SPRITE_BOSS                                        = $07

;============================================================================
; SpriteEntity
;============================================================================
SPRITE_DROPPED_BREAD                               = $01
SPRITE_DROPPED_COIN                                = $02
SPRITE_GARBLED_03                                  = $03
SPRITE_ENEMY_RAIDEN                                = $04
SPRITE_ENEMY_NECRON_AIDES                          = $05
SPRITE_ENEMY_ZOMBIE                                = $06
SPRITE_ENEMY_HORNET                                = $07
SPRITE_ENEMY_BIHORUDA                              = $08
SPRITE_ENEMY_LILITH                                = $09
SPRITE_MAGIC_GARBLED_10                            = $0a
SPRITE_ENEMY_YUINARU                               = $0b
SPRITE_ENEMY_SNOWMAN                               = $0c
SPRITE_ENEMY_NASH                                  = $0d
SPRITE_ENEMY_FIRE_GIANT                            = $0e
SPRITE_ENEMY_ISHIISU                               = $0f
SPRITE_ENEMY_EXECUTION_HOOD                        = $10
SPRITE_BOSS_ROKUSUTAHN                             = $11
SPRITE_BOSS_UNUSED_18                              = $12
SPRITE_EFFECT_ENEMY_DEATH                          = $13
SPRITE_EFFECT_LIGHTNING_BALL_20                    = $14
SPRITE_ENEMY_CHARRON                               = $15
SPRITE_ENEMY_UNUSED_22                             = $16
SPRITE_ENEMY_GERIBUTA                              = $17
SPRITE_ENEMY_SUGATA                                = $18
SPRITE_ENEMY_GRIMLOCK                              = $19
SPRITE_ENEMY_GIANT_BEES                            = $1a
SPRITE_ENEMY_MYCONID                               = $1b
SPRITE_ENEMY_NAGA                                  = $1c
SPRITE_ENEMY_UNUSED_29                             = $1d
SPRITE_ENEMY_GIANT_STRIDER                         = $1e
SPRITE_ENEMY_SIR_GAWAINE                           = $1f
SPRITE_ENEMY_MASKMAN                               = $20
SPRITE_ENEMY_WOLFMAN                               = $21
SPRITE_ENEMY_YAREEKA                               = $22
SPRITE_ENEMY_MAGMAN                                = $23
SPRITE_ENEMY_UNUSED_36                             = $24
SPRITE_ENEMY_UNUSED_37                             = $25
SPRITE_ENEMY_IKEDA                                 = $26
SPRITE_ENEMY_UNUSED_39                             = $27
SPRITE_ENEMY_LAMPREY                               = $28
SPRITE_ENEMY_UNUSED_41                             = $29
SPRITE_ENEMY_MONODRON                              = $2a
SPRITE_ENEMY_UNUSED_43                             = $2b
SPRITE_ENEMY_TAMAZUTSU                             = $2c
SPRITE_BOSS_RIPASHEIKU                             = $2d
SPRITE_BOSS_ZORADOHNA                              = $2e
SPRITE_BOSS_BORABOHRA                              = $2f
SPRITE_BOSS_PAKUKAME                               = $30
SPRITE_BOSS_ZORUGERIRU                             = $31
SPRITE_BOSS_KING_GRIEVE                            = $32
SPRITE_BOSS_SHADOW_EURA                            = $33
SPRITE_NPC_WALKING_MAN_1                           = $34
SPRITE_NPC_UNUSED_BLUE_LADY                        = $35
SPRITE_NPC_UNUSED_CHILD                            = $36
SPRITE_NPC_ARMOR_SALESMAN                          = $37
SPRITE_NPC_MARTIAL_ARTS                            = $38
SPRITE_NPC_PRIEST                                  = $39
SPRITE_NPC_KING                                    = $3a
SPRITE_NPC_MAGIC_TEACHER                           = $3b
SPRITE_NPC_KEY_SALESMAN                            = $3c
SPRITE_NPC_SMOKING_MAN                             = $3d
SPRITE_NPC_MAN_IN_CHAIR                            = $3e
SPRITE_NPC_SITTING_MAN_1                           = $3f
SPRITE_NPC_MEAT_SALESMAN                           = $40
SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP                = $41
SPRITE_NPC_GUARD_1                                 = $42
SPRITE_NPC_DOCTOR                                  = $43
SPRITE_NPC_NURSE                                   = $44
SPRITE_NPC_WALKING_WOMAN_2                         = $45
SPRITE_ENEMY_UNUSED_EYEBALL                        = $46
SPRITE_ENEMY_ZOZURA                                = $47
SPRITE_OBJ_GLOVE_2                                 = $48
SPRITE_OBJ_BLACK_ONYX                              = $49
SPRITE_OBJ_PENDANT                                 = $4a
SPRITE_OBJ_RED_POTION_2                            = $4b
SPRITE_OBJ_POISON_2                                = $4c
SPRITE_OBJ_ELIXIR                                  = $4d
SPRITE_OBJ_OINTMENT_2                              = $4e
SPRITE_TRIGGER_INTRO                               = $4f
SPRITE_OBJ_MATTOCK1                                = $50
SPRITE_MAGIC_GARBLED_81                            = $51
SPRITE_EFFECT_FOUNTAIN                             = $52
SPRITE_MAGIC_83                                    = $53
SPRITE_MAGIC_ENEMY_FIREBALL                        = $54
SPRITE_OBJ_WING_BOOTS                              = $55
SPRITE_OBJ_HOUR_GLASS                              = $56
SPRITE_OBJ_MAGICAL_ROD                             = $57
SPRITE_OBJ_BATTLE_SUIT                             = $58
SPRITE_OBJ_BATTLE_HELMET                           = $59
SPRITE_OBJ_DRAGON_SLAYER                           = $5a
SPRITE_OBJ_MATTOCK2                                = $5b
SPRITE_OBJ_WING_BOOTS_QUEST                        = $5c
SPRITE_OBJ_RED_POTION                              = $5d
SPRITE_OBJ_POISON                                  = $5e
SPRITE_OBJ_GLOVE                                   = $5f
SPRITE_OBJ_OINTMENT                                = $60
SPRITE_SPRING_OF_TRUNK                             = $61
SPRITE_SPRING_OF_SKY                               = $62
SPRITE_SPRING_OF_TOWER                             = $63
SPRITE_EFFECT_BOSS_DEATH                           = $64
SPRITE_OBJ_UNSET                                   = $ff

;============================================================================
; SpriteFlags
;============================================================================
SPRITE_FLAGS_UNSET                                 = $00
SPRITE_FLAGS_FACING_RIGHT                          = $01
SPRITE_FLAGS_UNKNOWN_2                             = $02
SPRITE_FLAGS_CAN_MOVE                              = $04
SPRITE_FLAGS_UNKNOWN_3                             = $08
SPRITE_FLAGS_VISIBLE                               = $10
SPRITE_FLAGS_UNKNOWN_5                             = $20
SPRITE_FLAGS_BEHAVIOR_READY                        = $40
SPRITE_FLAGS_CLEAR_FALLING                         = $7f
SPRITE_FLAGS_FALLING                               = $80
SPRITE_FLAGS_CLEAR_BEHAVIOR_READY                  = $bf
SPRITE_FLAGS_CLEAR_VISIBLE                         = $ef
SPRITE_FLAGS_CLEAR_CAN_MOVE                        = $fb
SPRITE_FLAGS_CLEAR_UNKNOWN_2                       = $fd
SPRITE_FLAGS_CLEAR_FACING_RIGHT                    = $fe

;============================================================================
; SpriteHitboxTypes
;============================================================================
SPRITE_HITBOX_0                                    = $00
SPRITE_HITBOX_1                                    = $01
SPRITE_HITBOX_2                                    = $02
SPRITE_HITBOX_3                                    = $03
SPRITE_HITBOX_4                                    = $04

;============================================================================
; SpriteOp
;============================================================================
SPRITE_OP_SWITCH_BEHAVIOR                          = $00
SPRITE_OP_MAYBE_DISABLE_AND_GOTO                   = $01
SPRITE_OP_RUN_ACTION                               = $02
SPRITE_OP_CHECK_DISTANCE                           = $03
SPRITE_OP_FINISH_BEHAVIOR                          = $04
SPRITE_OP_GOTO                                     = $05
SPRITE_OP_ADD_TO_SPRITE_DATA                       = $06
SPRITE_OP_SET_PHASE                                = $07
SPRITE_OP_END_SCRIPT                               = $ff

;============================================================================
; SQEffectMode
;============================================================================
SQEFFECT_MODE_VOLUME_DECAY                         = $00
SQEFFECT_MODE_CURVE_HELD                           = $01
SQEFFECT_MODE_TABLE_DRIVEN                         = $02

;============================================================================
; Temple
;============================================================================
TEMPLE_EOLIS                                       = $00
TEMPLE_APOLUNE                                     = $01
TEMPLE_FOREPAW                                     = $02
TEMPLE_MASCON                                      = $03
TEMPLE_VICTIM                                      = $04
TEMPLE_CONFLATE                                    = $05
TEMPLE_DAYBREAK                                    = $06
TEMPLE_FINAL                                       = $07

;============================================================================
; WeaponInventory
;============================================================================
WEAPONINVENTORY_HAND_DAGGER                        = $00
WEAPONINVENTORY_LONG_SWORD                         = $01
WEAPONINVENTORY_GIANT_BLADE                        = $02
WEAPONINVENTORY_DRAGON_SLAYER                      = $03
WEAPONINVENTORY_NONE                               = $ff
