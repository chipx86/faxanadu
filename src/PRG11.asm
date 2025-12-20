;============================================================================
; Faxanadu (U).nes
;
; PRG11 ($8000 - $bfff)
;============================================================================

    BASE $8000


;============================================================================
; Palette data comprising background tiles for areas.
;============================================================================
PALETTE_TILES_EOLIS:                        ; [$8000]
    db $0f                                  ; [0]:
    db $0f                                  ; [1]:
    db $0c                                  ; [2]:
    db $1b                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $08                                  ; [6]:
    db $17                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:
    db $07                                  ; [10]:
    db $0b                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_TILES_02:                           ; [$8010]
    db $0f                                  ; [0]:
    db $05                                  ; [1]:
    db $17                                  ; [2]:
    db $26                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $06                                  ; [6]:
    db $17                                  ; [7]:
    db $0f                                  ; [8]:
    db $06                                  ; [9]:
    db $18                                  ; [10]:
    db $28                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_TILES_03:                           ; [$8020]
    db $0f                                  ; [0]:
    db $0b                                  ; [1]:
    db $1b                                  ; [2]:
    db $21                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $0b                                  ; [6]:
    db $1b                                  ; [7]:
    db $0f                                  ; [8]:
    db $0b                                  ; [9]:
    db $1b                                  ; [10]:
    db $2b                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_TILES_04:                           ; [$8030]
    db $0f                                  ; [0]:
    db $00                                  ; [1]:
    db $10                                  ; [2]:
    db $20                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $17                                  ; [6]:
    db $10                                  ; [7]:
    db $0f                                  ; [8]:
    db $18                                  ; [9]:
    db $28                                  ; [10]:
    db $38                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_TILES_05:                           ; [$8040]
    db $0f                                  ; [0]:
    db $0f                                  ; [1]:
    db $0f                                  ; [2]:
    db $0f                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $0f                                  ; [6]:
    db $0f                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:
    db $0f                                  ; [10]:
    db $0f                                  ; [11]:
    db $0f                                  ; [12]:
    db $0f                                  ; [13]:
    db $0f                                  ; [14]:
    db $0f                                  ; [15]:

PALETTE_TILES_06:                           ; [$8050]
    db $0f                                  ; [0]:
    db $0f                                  ; [1]:
    db $00                                  ; [2]:
    db $10                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $17                                  ; [6]:
    db $10                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $27                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_TILES_OUTSIDE_APOLUNE:              ; [$8060]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $17                                  ; [2]:
    db $27                                  ; [3]:
    db $0f                                  ; [4]:
    db $0c                                  ; [5]:
    db $17                                  ; [6]:
    db $27                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $0a                                  ; [13]:
    db $1b                                  ; [14]:
    db $38                                  ; [15]:

PALETTE_TILES_TOWER:                        ; [$8070]
    db $0f                                  ; [0]:
    db $0f                                  ; [1]:
    db $08                                  ; [2]:
    db $18                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $06                                  ; [6]:
    db $18                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $08                                  ; [13]:
    db $18                                  ; [14]:
    db $25                                  ; [15]:

PALETTE_TILES_BRANCH:                       ; [$8080]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $17                                  ; [2]:
    db $26                                  ; [3]:
    db $0f                                  ; [4]:
    db $0c                                  ; [5]:
    db $17                                  ; [6]:
    db $26                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $06                                  ; [13]:
    db $16                                  ; [14]:
    db $36                                  ; [15]:

PALETTE_TILES_LEFT_TRUNK:                   ; [$8090]
    db $0f                                  ; [0]:
    db $09                                  ; [1]:
    db $18                                  ; [2]:
    db $36                                  ; [3]:
    db $0f                                  ; [4]:
    db $0c                                  ; [5]:
    db $18                                  ; [6]:
    db $36                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $09                                  ; [13]:
    db $19                                  ; [14]:
    db $29                                  ; [15]:

PALETTE_TILES_MIST:                         ; [$80a0]
    db $0f                                  ; [0]:
    db $04                                  ; [1]:
    db $00                                  ; [2]:
    db $26                                  ; [3]:
    db $0f                                  ; [4]:
    db $05                                  ; [5]:
    db $16                                  ; [6]:
    db $26                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $0f                                  ; [13]:
    db $05                                  ; [14]:
    db $16                                  ; [15]:

PALETTE_TILES_SUFFER:                       ; [$80b0]
    db $0f                                  ; [0]:
    db $07                                  ; [1]:
    db $18                                  ; [2]:
    db $28                                  ; [3]:
    db $0f                                  ; [4]:
    db $09                                  ; [5]:
    db $1b                                  ; [6]:
    db $27                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $05                                  ; [13]:
    db $16                                  ; [14]:
    db $26                                  ; [15]:

PALETTE_TILES_DARTMOOR:                     ; [$80c0]
    db $0f                                  ; [0]:
    db $15                                  ; [1]:
    db $19                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $08                                  ; [5]:
    db $18                                  ; [6]:
    db $26                                  ; [7]:
    db $0f                                  ; [8]:
    db $04                                  ; [9]:
    db $00                                  ; [10]:
    db $10                                  ; [11]:
    db $0f                                  ; [12]:
    db $06                                  ; [13]:
    db $16                                  ; [14]:
    db $26                                  ; [15]:

PALETTE_TILES_FRATERNAL:                    ; [$80d0]
    db $0f                                  ; [0]:
    db $15                                  ; [1]:
    db $19                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $0f                                  ; [5]:
    db $00                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $04                                  ; [9]:
    db $00                                  ; [10]:
    db $10                                  ; [11]:
    db $0f                                  ; [12]:
    db $0c                                  ; [13]:
    db $00                                  ; [14]:
    db $21                                  ; [15]:

PALETTE_TILES_KING_GRIEVES_ROOM:            ; [$80e0]
    db $0f                                  ; [0]:
    db $15                                  ; [1]:
    db $1a                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $04                                  ; [5]:
    db $13                                  ; [6]:
    db $24                                  ; [7]:
    db $0f                                  ; [8]:
    db $00                                  ; [9]:
    db $10                                  ; [10]:
    db $20                                  ; [11]:
    db $0f                                  ; [12]:
    db $01                                  ; [13]:
    db $11                                  ; [14]:
    db $21                                  ; [15]:

PALETTE_TILES_EVIL_FORTRESS:                ; [$80f0]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $00                                  ; [2]:
    db $21                                  ; [3]:
    db $0f                                  ; [4]:
    db $0b                                  ; [5]:
    db $00                                  ; [6]:
    db $23                                  ; [7]:
    db $0f                                  ; [8]:
    db $08                                  ; [9]:
    db $00                                  ; [10]:
    db $10                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_TILES_START_SCREEN:                 ; [$8100]
    db $0f                                  ; [0]:
    db $05                                  ; [1]:
    db $18                                  ; [2]:
    db $38                                  ; [3]:
    db $0f                                  ; [4]:
    db $17                                  ; [5]:
    db $27                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:
    db $16                                  ; [10]:
    db $28                                  ; [11]:
    db $0f                                  ; [12]:
    db $0f                                  ; [13]:
    db $00                                  ; [14]:
    db $10                                  ; [15]:

PALETTE_TILES_KINGS_ROOM:                   ; [$8110]
    db $0f                                  ; [0]:
    db $07                                  ; [1]:
    db $17                                  ; [2]:
    db $27                                  ; [3]:
    db $0f                                  ; [4]:
    db $0b                                  ; [5]:
    db $00                                  ; [6]:
    db $10                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $00                                  ; [13]:
    db $10                                  ; [14]:
    db $20                                  ; [15]:

PALETTE_TILES_TEMPLE:                       ; [$8120]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $18                                  ; [2]:
    db $28                                  ; [3]:
    db $0f                                  ; [4]:
    db $0a                                  ; [5]:
    db $00                                  ; [6]:
    db $29                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $0b                                  ; [13]:
    db $1b                                  ; [14]:
    db $2b                                  ; [15]:

PALETTE_TILES_HOSPITAL:                     ; [$8130]
    db $0f                                  ; [0]:
    db $0b                                  ; [1]:
    db $17                                  ; [2]:
    db $10                                  ; [3]:
    db $0f                                  ; [4]:
    db $08                                  ; [5]:
    db $00                                  ; [6]:
    db $2b                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $0c                                  ; [13]:
    db $1b                                  ; [14]:
    db $24                                  ; [15]:

PALETTE_TILES_TAVERN:                       ; [$8140]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $1b                                  ; [2]:
    db $2c                                  ; [3]:
    db $0f                                  ; [4]:
    db $08                                  ; [5]:
    db $1b                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $07                                  ; [13]:
    db $00                                  ; [14]:
    db $10                                  ; [15]:

PALETTE_TILES_TOOL_SHOP:                    ; [$8150]
    db $1f                                  ; [0]:
    db $07                                  ; [1]:
    db $18                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $17                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $07                                  ; [13]:
    db $17                                  ; [14]:
    db $27                                  ; [15]:

PALETTE_TILES_KEY_SHOP:                     ; [$8160]
    db $0f                                  ; [0]:
    db $06                                  ; [1]:
    db $17                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $06                                  ; [5]:
    db $17                                  ; [6]:
    db $3b                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $3f                                  ; [12]:
    db $07                                  ; [13]:
    db $17                                  ; [14]:
    db $28                                  ; [15]:

PALETTE_TILES_HOUSE:                        ; [$8170]
    db $0f                                  ; [0]:
    db $07                                  ; [1]:
    db $17                                  ; [2]:
    db $20                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $17                                  ; [6]:
    db $36                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $3f                                  ; [12]:
    db $08                                  ; [13]:
    db $17                                  ; [14]:
    db $37                                  ; [15]:

PALETTE_TILES_MEAT_SHOP:                    ; [$8180]
    db $0f                                  ; [0]:
    db $07                                  ; [1]:
    db $18                                  ; [2]:
    db $38                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $1c                                  ; [6]:
    db $37                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $3f                                  ; [12]:
    db $07                                  ; [13]:
    db $00                                  ; [14]:
    db $28                                  ; [15]:

PALETTE_TILES_MARTIAL_ARTS:                 ; [$8190]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $18                                  ; [2]:
    db $28                                  ; [3]:
    db $0f                                  ; [4]:
    db $07                                  ; [5]:
    db $17                                  ; [6]:
    db $27                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $3f                                  ; [12]:
    db $08                                  ; [13]:
    db $18                                  ; [14]:
    db $2b                                  ; [15]:

PALETTE_TILES_MAGIC_SHOP:                   ; [$81a0]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $18                                  ; [2]:
    db $28                                  ; [3]:
    db $0f                                  ; [4]:
    db $06                                  ; [5]:
    db $00                                  ; [6]:
    db $10                                  ; [7]:
    db $0f                                  ; [8]:
    db $15                                  ; [9]:
    db $19                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $00                                  ; [13]:
    db $10                                  ; [14]:
    db $20                                  ; [15]:

PALETTE_TILES_TOWN:                         ; [$81b0]
    db $0f                                  ; [0]:
    db $08                                  ; [1]:
    db $17                                  ; [2]:
    db $27                                  ; [3]:
    db $0f                                  ; [4]:
    db $06                                  ; [5]:
    db $17                                  ; [6]:
    db $29                                  ; [7]:
    db $0f                                  ; [8]:
    db $0a                                  ; [9]:
    db $1c                                  ; [10]:
    db $38                                  ; [11]:
    db $0f                                  ; [12]:
    db $15                                  ; [13]:
    db $19                                  ; [14]:
    db $30                                  ; [15]:


;============================================================================
; Palette data for sprites.
;============================================================================
PALETTE_SPRITES_OUTSIDE:                    ; [$81c0]
    db $0f                                  ; [0]:
    db $18                                  ; [1]:
    db $26                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $00                                  ; [5]:
    db $25                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $0f                                  ; [9]:
    db $1c                                  ; [10]:
    db $33                                  ; [11]:
    db $0f                                  ; [12]:
    db $0f                                  ; [13]:
    db $27                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_SPRITES_INSIDE:                     ; [$81d0]
    db $0f                                  ; [0]:
    db $18                                  ; [1]:
    db $26                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $00                                  ; [5]:
    db $25                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $16                                  ; [9]:
    db $2c                                  ; [10]:
    db $30                                  ; [11]:
    db $0f                                  ; [12]:
    db $17                                  ; [13]:
    db $25                                  ; [14]:
    db $30                                  ; [15]:

PALETTE_SPRITES_PORTRAIT:                   ; [$81e0]
    db $0f                                  ; [0]:
    db $18                                  ; [1]:
    db $26                                  ; [2]:
    db $30                                  ; [3]:
    db $0f                                  ; [4]:
    db $00                                  ; [5]:
    db $25                                  ; [6]:
    db $30                                  ; [7]:
    db $0f                                  ; [8]:
    db $18                                  ; [9]:
    db $26                                  ; [10]:
    db $2b                                  ; [11]:
    db $0f                                  ; [12]:
    db $0c                                  ; [13]:
    db $1c                                  ; [14]:
    db $30                                  ; [15]:


;============================================================================
; Mapping of palette indexes to HUD/textbox attribute data lookup indexes.
;
; XREFS:
;     Screen_LoadUIPalette
;============================================================================

;
; XREFS:
;     Screen_LoadUIPalette
;
PALETTE_INDEX_TO_UI_BG_ATTRIBUTE_INDEX:     ; [$81f0]
    db $03                                  ; [0]: Eolis
    db $03                                  ; [1]:
    db $03                                  ; [2]:
    db $03                                  ; [3]:
    db $03                                  ; [4]:
    db $03                                  ; [5]:
    db $02                                  ; [6]: Between Eolis and Apolune
    db $02                                  ; [7]: Tower
    db $02                                  ; [8]: Branch
    db $02                                  ; [9]: Left, darker side of Trunk
    db $02                                  ; [10]: Mist
    db $02                                  ; [11]: Tower of Suffer
    db $00                                  ; [12]: Dartmoor
    db $00                                  ; [13]: Castle of Fraternal
    db $00                                  ; [14]: King Grieve's Room
    db $03                                  ; [15]: Evil Fortress
    db $01                                  ; [16]: Start Screen
    db $02                                  ; [17]: King's Room
    db $02                                  ; [18]: Temple
    db $02                                  ; [19]: Hospital
    db $02                                  ; [20]: Tavern
    db $02                                  ; [21]: Tool Shop
    db $02                                  ; [22]: Key Shop
    db $02                                  ; [23]: House
    db $02                                  ; [24]: Meat Shop
    db $02                                  ; [25]: Martial Arts
    db $02                                  ; [26]: Magic Shop
    db $03                                  ; [27]: Town
    db $03                                  ; [28]:
    db $03                                  ; [29]:
    db $03                                  ; [30]:
    db $03                                  ; [31]:


;============================================================================
; Table of sprite information start addresses.
;
; Each index into this is an area index.
;
; XREFS:
;     Screen_LoadAllScreenInfo
;============================================================================

;
; XREFS:
;     Screen_LoadAllScreenInfo
;
AREA_SPRITE_ADDRESSES:                      ; [$8210]
    dw SPRITE_INFO_EOLIS                    ; Eolis
    dw SPRITE_INFO_APOLUNE                  ; Apolune
    dw SPRITE_INFO_FOREPAW                  ; Forepaw
    dw SPRITE_INFO_MASCON                   ; Mascon
    dw SPRITE_INFO_VICTIM                   ; Victim
    dw SPRITE_INFO_CONFLATE                 ; Conflate
    dw SPRITE_INFO_DAYBREAK                 ; Daybreak
    dw SPRITE_INFO_ZENIS                    ; Final


;============================================================================
; Eolis Sprite Information by Screen Index
;
; XREFS:
;     AREA_SPRITE_ADDRESSES [$PRG11::8210]
;============================================================================

;
; XREFS:
;     AREA_SPRITE_ADDRESSES [$PRG11::8210]
;
SPRITE_INFO_EOLIS:                          ; [$8220]
    dw SPRITE_INFO_EOLIS_SCREEN_00          ; Screen 0
    dw SPRITE_INFO_EOLIS_SCREEN_01          ; Screen 1
    dw SPRITE_INFO_EOLIS_SCREEN_02          ; Screen 2
    dw SPRITE_INFO_EOLIS_SCREEN_03          ; Screen 3
    dw SPRITE_INFO_EOLIS_SCREEN_04          ; Screen 4
    dw SPRITE_INFO_EOLIS_SCREEN_05          ; Screen 5
    dw SPRITE_INFO_EOLIS_SCREEN_06          ; Screen 6
    dw SPRITE_INFO_EOLIS_SCREEN_07          ; Screen 7
    dw SPRITE_INFO_EOLIS_SCREEN_08          ; Screen 8

;
; XREFS:
;     SPRITE_INFO_EOLIS [$PRG11::8220]
;
SPRITE_INFO_EOLIS_SCREEN_00:                ; [$8232]
    db SPRITE_TRIGGER_INTRO                 ; [$8232] SpriteEntity
    db $04,$ff                              ; [$8233] byte

    db ISCRIPT_ENTRYPOINT_INTRO             ; IScript 0
    db $ff                                  ; [$8236] byte

SPRITE_INFO_EOLIS_SCREEN_01:                ; [$8237]
    db SPRITE_NPC_WALKING_MAN_1             ; [$8237] SpriteEntity
    db $9c,$ff                              ; [$8238] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_WALKING_MAN_1 ; IScript 1
    db $ff                                  ; [$823b] undefined

SPRITE_INFO_EOLIS_SCREEN_02:                ; [$823c]
    db SPRITE_NPC_WALKING_WOMAN_2           ; [$823c] SpriteEntity
    db $97,$ff                              ; [$823d] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_1 ; IScript 3
    db $ff                                  ; [$8240] undefined

SPRITE_INFO_EOLIS_SCREEN_03:                ; [$8241]
    db SPRITE_NPC_SMOKING_MAN               ; [$8241] SpriteEntity
    db $84,$ff                              ; [$8242] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_SMOKING_MAN ; IScript 6
    db $ff                                  ; [$8245] undefined

SPRITE_INFO_EOLIS_SCREEN_04:                ; [$8246]
    db SPRITE_ENEMY_ZOZURA                  ; [$8246] SpriteEntity
    db $a9                                  ; [$8247] undefined

    db SPRITE_ENEMY_ZOZURA
    db $a4,$ff,$ff                          ; [$8249] undefined

SPRITE_INFO_EOLIS_SCREEN_05:                ; [$824c]
    db SPRITE_ENEMY_ZOZURA                  ; [$824c] SpriteEntity
    db $ab                                  ; [$824d] undefined

    db SPRITE_ENEMY_ZOZURA
    db $a5,$ff,$ff                          ; [$824f] undefined

SPRITE_INFO_EOLIS_SCREEN_06:                ; [$8252]
    db SPRITE_NPC_NURSE                     ; [$8252] SpriteEntity
    db $93,$ff                              ; [$8253] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_2 ; IScript 5
    db $ff                                  ; [$8256] undefined

SPRITE_INFO_EOLIS_SCREEN_07:                ; [$8257]
    db SPRITE_NPC_GUARD_1                   ; [$8257] SpriteEntity
    db $9a,$ff                              ; [$8258] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_KINGS_GUARD ; ISCRIPT_EOLIS_KINGS_GUARD
                                            ; [$PRG11::825a]
    db $ff                                  ; [$825b] undefined

SPRITE_INFO_EOLIS_SCREEN_08:                ; [$825c]
    db SPRITE_ENEMY_MONODRON                ; [$825c] SpriteEntity
    db $9c,$ff,$ff                          ; [$825d] undefined


;============================================================================
; Apolune Sprite Information
;============================================================================
SPRITE_INFO_APOLUNE:                        ; [$8260]
    dw SPRITE_INFO_APOLUNE_SCREEN_00        ; SPRITE_INFO_APOLUNE_SCREEN_00
                                            ; [$PRG11::8260]
    dw SPRITE_INFO_APOLUNE_SCREEN_01        ; SPRITE_INFO_APOLUNE_SCREEN_01
                                            ; [$PRG11::8262]
    dw SPRITE_INFO_APOLUNE_SCREEN_02        ; SPRITE_INFO_APOLUNE_SCREEN_02
                                            ; [$PRG11::8264]
    dw SPRITE_INFO_APOLUNE_SCREEN_03        ; SPRITE_INFO_APOLUNE_SCREEN_03
                                            ; [$PRG11::8266]
    dw SPRITE_INFO_APOLUNE_SCREEN_04        ; SPRITE_INFO_APOLUNE_SCREEN_04
                                            ; [$PRG11::8268]
    dw SPRITE_INFO_APOLUNE_SCREEN_05        ; SPRITE_INFO_APOLUNE_SCREEN_05
                                            ; [$PRG11::826a]
    dw SPRITE_INFO_APOLUNE_SCREEN_06        ; SPRITE_INFO_APOLUNE_SCREEN_06
                                            ; [$PRG11::826c]
    dw SPRITE_INFO_APOLUNE_SCREEN_07        ; SPRITE_INFO_APOLUNE_SCREEN_07
                                            ; [$PRG11::826e]
    dw SPRITE_INFO_APOLUNE_SCREEN_08        ; SPRITE_INFO_APOLUNE_SCREEN_08
                                            ; [$PRG11::8270]
    dw SPRITE_INFO_APOLUNE_SCREEN_09        ; SPRITE_INFO_APOLUNE_SCREEN_09
                                            ; [$PRG11::8272]
    dw SPRITE_INFO_APOLUNE_SCREEN_10        ; SPRITE_INFO_APOLUNE_SCREEN_10
                                            ; [$PRG11::8274]
    dw SPRITE_INFO_APOLUNE_SCREEN_11        ; SPRITE_INFO_APOLUNE_SCREEN_11
                                            ; [$PRG11::8276]
    dw SPRITE_INFO_APOLUNE_SCREEN_12        ; SPRITE_INFO_APOLUNE_SCREEN_12
                                            ; [$PRG11::8278]
    dw SPRITE_INFO_APOLUNE_SCREEN_13        ; SPRITE_INFO_APOLUNE_SCREEN_13
                                            ; [$PRG11::827a]
    dw SPRITE_INFO_APOLUNE_SCREEN_14        ; SPRITE_INFO_APOLUNE_SCREEN_14
                                            ; [$PRG11::827c]
    dw SPRITE_INFO_APOLUNE_SCREEN_15        ; SPRITE_INFO_APOLUNE_SCREEN_15
                                            ; [$PRG11::827e]
    dw SPRITE_INFO_APOLUNE_SCREEN_16        ; SPRITE_INFO_APOLUNE_SCREEN_16
                                            ; [$PRG11::8280]
    dw SPRITE_INFO_APOLUNE_SCREEN_17        ; SPRITE_INFO_APOLUNE_SCREEN_17
                                            ; [$PRG11::8282]
    dw SPRITE_INFO_APOLUNE_SCREEN_18        ; SPRITE_INFO_APOLUNE_SCREEN_18
                                            ; [$PRG11::8284]
    dw SPRITE_INFO_APOLUNE_SCREEN_19        ; SPRITE_INFO_APOLUNE_SCREEN_19
                                            ; [$PRG11::8286]
    dw SPRITE_INFO_APOLUNE_SCREEN_20        ; SPRITE_INFO_APOLUNE_SCREEN_20
                                            ; [$PRG11::8288]
    dw SPRITE_INFO_APOLUNE_SCREEN_21        ; SPRITE_INFO_APOLUNE_SCREEN_21
                                            ; [$PRG11::828a]
    dw SPRITE_INFO_APOLUNE_SCREEN_22        ; SPRITE_INFO_APOLUNE_SCREEN_22
                                            ; [$PRG11::828c]
    dw SPRITE_INFO_APOLUNE_SCREEN_23        ; SPRITE_INFO_APOLUNE_SCREEN_23
                                            ; [$PRG11::828e]
    dw SPRITE_INFO_APOLUNE_SCREEN_24        ; SPRITE_INFO_APOLUNE_SCREEN_24
                                            ; [$PRG11::8290]
    dw SPRITE_INFO_APOLUNE_SCREEN_25        ; SPRITE_INFO_APOLUNE_SCREEN_25
                                            ; [$PRG11::8292]
    dw SPRITE_INFO_APOLUNE_SCREEN_26        ; SPRITE_INFO_APOLUNE_SCREEN_26
                                            ; [$PRG11::8294]
    dw SPRITE_INFO_APOLUNE_SCREEN_27        ; SPRITE_INFO_APOLUNE_SCREEN_27
                                            ; [$PRG11::8296]
    dw SPRITE_INFO_APOLUNE_SCREEN_28        ; SPRITE_INFO_APOLUNE_SCREEN_28
                                            ; [$PRG11::8298]
    dw SPRITE_INFO_APOLUNE_SCREEN_29        ; SPRITE_INFO_APOLUNE_SCREEN_29
                                            ; [$PRG11::829a]
    dw SPRITE_INFO_APOLUNE_SCREEN_30        ; SPRITE_INFO_APOLUNE_SCREEN_30
                                            ; [$PRG11::829c]
    dw SPRITE_INFO_APOLUNE_SCREEN_31        ; SPRITE_INFO_APOLUNE_SCREEN_31
                                            ; [$PRG11::829e]
    dw SPRITE_INFO_APOLUNE_SCREEN_32        ; SPRITE_INFO_APOLUNE_SCREEN_32
                                            ; [$PRG11::82a0]
    dw SPRITE_INFO_APOLUNE_SCREEN_33        ; SPRITE_INFO_APOLUNE_SCREEN_33
                                            ; [$PRG11::82a2]
    dw SPRITE_INFO_APOLUNE_SCREEN_34        ; SPRITE_INFO_APOLUNE_SCREEN_34
                                            ; [$PRG11::82a4]
    dw SPRITE_INFO_APOLUNE_SCREEN_35        ; SPRITE_INFO_APOLUNE_SCREEN_35
                                            ; [$PRG11::82a6]
    dw SPRITE_INFO_APOLUNE_SCREEN_36        ; SPRITE_INFO_APOLUNE_SCREEN_36
                                            ; [$PRG11::82a8]
    dw SPRITE_INFO_APOLUNE_SCREEN_37        ; SPRITE_INFO_APOLUNE_SCREEN_37
                                            ; [$PRG11::82aa]
    dw SPRITE_INFO_APOLUNE_SCREEN_38        ; SPRITE_INFO_APOLUNE_SCREEN_38
                                            ; [$PRG11::82ac]
    dw SPRITE_INFO_APOLUNE_SCREEN_39        ; SPRITE_INFO_APOLUNE_SCREEN_39
                                            ; [$PRG11::82ae]
    dw SPRITE_INFO_APOLUNE_SCREEN_40        ; SPRITE_INFO_APOLUNE_SCREEN_40
                                            ; [$PRG11::82b0]
    dw SPRITE_INFO_APOLUNE_SCREEN_41        ; SPRITE_INFO_APOLUNE_SCREEN_41
                                            ; [$PRG11::82b2]
    dw SPRITE_INFO_APOLUNE_SCREEN_42        ; SPRITE_INFO_APOLUNE_SCREEN_42
                                            ; [$PRG11::82b4]
    dw SPRITE_INFO_APOLUNE_SCREEN_43        ; SPRITE_INFO_APOLUNE_SCREEN_43
                                            ; [$PRG11::82b6]
    dw SPRITE_INFO_APOLUNE_SCREEN_44        ; SPRITE_INFO_APOLUNE_SCREEN_44
                                            ; [$PRG11::82b8]
    dw SPRITE_INFO_APOLUNE_SCREEN_45        ; SPRITE_INFO_APOLUNE_SCREEN_45
                                            ; [$PRG11::82ba]
    dw SPRITE_INFO_APOLUNE_SCREEN_46        ; SPRITE_INFO_APOLUNE_SCREEN_46
                                            ; [$PRG11::82bc]
    dw SPRITE_INFO_APOLUNE_SCREEN_47        ; SPRITE_INFO_APOLUNE_SCREEN_47
                                            ; [$PRG11::82be]
    dw SPRITE_INFO_APOLUNE_SCREEN_48        ; SPRITE_INFO_APOLUNE_SCREEN_48
                                            ; [$PRG11::82c0]
    dw SPRITE_INFO_APOLUNE_SCREEN_49        ; SPRITE_INFO_APOLUNE_SCREEN_49
                                            ; [$PRG11::82c2]
    dw SPRITE_INFO_APOLUNE_SCREEN_50        ; SPRITE_INFO_APOLUNE_SCREEN_50
                                            ; [$PRG11::82c4]
    dw SPRITE_INFO_APOLUNE_SCREEN_51        ; SPRITE_INFO_APOLUNE_SCREEN_51
                                            ; [$PRG11::82c6]
    dw SPRITE_INFO_APOLUNE_SCREEN_52        ; SPRITE_INFO_APOLUNE_SCREEN_52
                                            ; [$PRG11::82c8]
    dw SPRITE_INFO_APOLUNE_SCREEN_53        ; SPRITE_INFO_APOLUNE_SCREEN_53
                                            ; [$PRG11::82ca]
    dw SPRITE_INFO_APOLUNE_SCREEN_54        ; SPRITE_INFO_APOLUNE_SCREEN_54
                                            ; [$PRG11::82cc]
    dw SPRITE_INFO_APOLUNE_SCREEN_55        ; SPRITE_INFO_APOLUNE_SCREEN_55
                                            ; [$PRG11::82ce]
    dw SPRITE_INFO_APOLUNE_SCREEN_56        ; SPRITE_INFO_APOLUNE_SCREEN_56
                                            ; [$PRG11::82d0]
    dw SPRITE_INFO_APOLUNE_SCREEN_57        ; SPRITE_INFO_APOLUNE_SCREEN_57
                                            ; [$PRG11::82d2]
    dw SPRITE_INFO_APOLUNE_SCREEN_58        ; SPRITE_INFO_APOLUNE_SCREEN_58
                                            ; [$PRG11::82d4]
    dw SPRITE_INFO_APOLUNE_SCREEN_59        ; SPRITE_INFO_APOLUNE_SCREEN_59
                                            ; [$PRG11::82d6]
    dw SPRITE_INFO_APOLUNE_SCREEN_60        ; SPRITE_INFO_APOLUNE_SCREEN_60
                                            ; [$PRG11::82d8]
    dw SPRITE_INFO_APOLUNE_SCREEN_61        ; SPRITE_INFO_APOLUNE_SCREEN_61
                                            ; [$PRG11::82da]
    dw SPRITE_INFO_APOLUNE_SCREEN_62        ; SPRITE_INFO_APOLUNE_SCREEN_62
                                            ; [$PRG11::82dc]
    dw SPRITE_INFO_APOLUNE_SCREEN_63        ; SPRITE_INFO_APOLUNE_SCREEN_63
                                            ; [$PRG11::82de]

;
; XREFS:
;     SPRITE_INFO_APOLUNE [$PRG11::8260]
;
SPRITE_INFO_APOLUNE_SCREEN_00:              ; [$82e0]
    db SPRITE_ENEMY_MONODRON                ; [$82e0] SpriteEntity
    db $a8,$ff,$ff                          ; [$82e1] byte

SPRITE_INFO_APOLUNE_SCREEN_01:              ; [$82e4]
    db SPRITE_ENEMY_MONODRON                ; [$82e4] SpriteEntity
    db $14                                  ; [$82e5] byte

    db SPRITE_ENEMY_MONODRON
    db $a8,$ff,$ff                          ; [$82e7] byte

SPRITE_INFO_APOLUNE_SCREEN_02:              ; [$82ea]
    db SPRITE_ENEMY_MONODRON                ; [$82ea] SpriteEntity
    db $18                                  ; [$82eb] byte

    db SPRITE_ENEMY_ZOZURA
    db $b6                                  ; [$82ed] byte

    db SPRITE_ENEMY_ZOZURA
    db $ba,$ff,$ff                          ; [$82ef] byte

SPRITE_INFO_APOLUNE_SCREEN_03:              ; [$82f2]
    db SPRITE_ENEMY_ZOZURA                  ; [$82f2] SpriteEntity
    db $ba                                  ; [$82f3] byte

    db SPRITE_ENEMY_MONODRON
    db $a5,$ff,$ff                          ; [$82f5] byte

SPRITE_INFO_APOLUNE_SCREEN_04:              ; [$82f8]
    db SPRITE_ENEMY_MONODRON                ; [$82f8] SpriteEntity
    db $a4                                  ; [$82f9] undefined

    db SPRITE_ENEMY_ZOZURA
    db $b4,$ff,$ff                          ; [$82fb] undefined

SPRITE_INFO_APOLUNE_SCREEN_05:              ; [$82fe]
    db SPRITE_ENEMY_MONODRON                ; [$82fe] SpriteEntity
    db $a6                                  ; [$82ff] undefined

    db SPRITE_ENEMY_MONODRON
    db $aa,$ff,$ff                          ; [$8301] undefined

SPRITE_INFO_APOLUNE_SCREEN_06:              ; [$8304]
    db SPRITE_ENEMY_ZOMBIE                  ; [$8304] SpriteEntity
    db $a6                                  ; [$8305] undefined

    db SPRITE_ENEMY_ZOMBIE
    db $5b,$ff,$ff                          ; [$8307] undefined

SPRITE_INFO_APOLUNE_SCREEN_07:              ; [$830a]
    db SPRITE_ENEMY_ZOMBIE                  ; [$830a] SpriteEntity
    db $a5                                  ; [$830b] byte

    db SPRITE_ENEMY_ZOZURA
    db $ba,$ff                              ; [$830d] byte

SPRITE_INFO_APOLUNE_SCREEN_08:              ; [$830f]
    db SPRITE_ENEMY_MONODRON                ; [$830f] SpriteEntity
    db $25                                  ; [$8310] byte

    db SPRITE_ENEMY_ZOMBIE
    db $aa,$ff,$ff                          ; [$8312] byte

SPRITE_INFO_APOLUNE_SCREEN_09:              ; [$8315]
    db SPRITE_ENEMY_MONODRON                ; [$8315] SpriteEntity
    db $aa                                  ; [$8316] undefined

    db SPRITE_ENEMY_MONODRON
    db $a5,$ff,$ff                          ; [$8318] undefined

SPRITE_INFO_APOLUNE_SCREEN_10:              ; [$831b]
    db SPRITE_ENEMY_MONODRON                ; [$831b] SpriteEntity
    db $a8                                  ; [$831c] undefined

    db SPRITE_ENEMY_ZOZURA
    db $bb,$ff,$ff                          ; [$831e] undefined

SPRITE_INFO_APOLUNE_SCREEN_11:              ; [$8321]
    db SPRITE_ENEMY_MONODRON                ; [$8321] SpriteEntity
    db $ab                                  ; [$8322] undefined

    db SPRITE_ENEMY_ZOZURA
    db $b6,$ff,$ff                          ; [$8324] undefined

SPRITE_INFO_APOLUNE_SCREEN_12:              ; [$8327]
    db SPRITE_OBJ_RED_POTION                ; [$8327] SpriteEntity
    db $3b                                  ; [$8328] undefined

    db SPRITE_ENEMY_MONODRON
    db $48                                  ; [$832a] undefined

    db SPRITE_ENEMY_MONODRON
    db $ad,$ff,$ff                          ; [$832c] undefined

SPRITE_INFO_APOLUNE_SCREEN_13:              ; [$832f]
    db SPRITE_ENEMY_MONODRON                ; [$832f] SpriteEntity
    db $9a                                  ; [$8330] undefined

    db SPRITE_ENEMY_ZOZURA
    db $52                                  ; [$8332] undefined

    db SPRITE_ENEMY_ZOZURA
    db $5e,$ff,$ff                          ; [$8334] undefined

SPRITE_INFO_APOLUNE_SCREEN_14:              ; [$8337]
    db SPRITE_OBJ_MATTOCK1                  ; [$8337] SpriteEntity
    db $5d                                  ; [$8338] undefined

    db SPRITE_ENEMY_MONODRON
    db $9a                                  ; [$833a] undefined

    db SPRITE_ENEMY_ZOZURA
    db $58                                  ; [$833c] undefined

    db SPRITE_ENEMY_ZOZURA
    db $5d,$ff,$ff                          ; [$833e] undefined

SPRITE_INFO_APOLUNE_SCREEN_15:              ; [$8341]
    db SPRITE_ENEMY_MONODRON                ; [$8341] SpriteEntity
    db $9a                                  ; [$8342] undefined

    db SPRITE_ENEMY_ZOZURA
    db $46,$ff,$ff                          ; [$8344] undefined

SPRITE_INFO_APOLUNE_SCREEN_16:              ; [$8347]
    db SPRITE_ENEMY_SNOWMAN                 ; [$8347] SpriteEntity
    db $9a,$ff,$ff                          ; [$8348] undefined

SPRITE_INFO_APOLUNE_SCREEN_17:              ; [$834b]
    db SPRITE_ENEMY_SNOWMAN                 ; [$834b] SpriteEntity
    db $9a,$ff,$ff                          ; [$834c] undefined

SPRITE_INFO_APOLUNE_SCREEN_18:              ; [$834f]
    db SPRITE_ENEMY_SNOWMAN                 ; [$834f] SpriteEntity
    db $9a                                  ; [$8350] undefined

    db SPRITE_ENEMY_ZOZURA
    db $45,$ff,$ff                          ; [$8352] undefined

SPRITE_INFO_APOLUNE_SCREEN_19:              ; [$8355]
    db SPRITE_OBJ_HOUR_GLASS                ; [$8355] SpriteEntity
    db $4d                                  ; [$8356] undefined

    db SPRITE_ENEMY_IKEDA
    db $7a                                  ; [$8358] undefined

    db SPRITE_ENEMY_ZOZURA
    db $4b                                  ; [$835a] undefined

    db SPRITE_ENEMY_ZOZURA
    db $89,$ff,$ff                          ; [$835c] undefined

SPRITE_INFO_APOLUNE_SCREEN_20:              ; [$835f]
    db SPRITE_ENEMY_IKEDA                   ; [$835f] SpriteEntity
    db $7a                                  ; [$8360] undefined

    db SPRITE_ENEMY_ZOZURA
    db $a6                                  ; [$8362] undefined

    db SPRITE_ENEMY_ZOZURA
    db $ac,$ff,$ff                          ; [$8364] undefined

SPRITE_INFO_APOLUNE_SCREEN_21:              ; [$8367]
    db SPRITE_OBJ_MATTOCK2                  ; [$8367] SpriteEntity
    db $ae                                  ; [$8368] undefined

    db SPRITE_BOSS_RIPASHEIKU
    db $4b,$ff,$ff                          ; [$836a] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; CurrentScreen_SpecialEventID

SPRITE_INFO_APOLUNE_SCREEN_22:              ; [$836f]
    db SPRITE_ENEMY_MONODRON                ; [$836f] SpriteEntity
    db $9c                                  ; [$8370] undefined

    db SPRITE_ENEMY_MYCONID
    db $46,$ff,$ff                          ; [$8372] undefined

SPRITE_INFO_APOLUNE_SCREEN_23:              ; [$8375]
    db SPRITE_ENEMY_MONODRON                ; [$8375] SpriteEntity
    db $9a                                  ; [$8376] undefined

    db SPRITE_ENEMY_YUINARU
    db $35                                  ; [$8378] undefined

    db SPRITE_ENEMY_YUINARU
    db $5f,$ff,$ff                          ; [$837a] undefined

SPRITE_INFO_APOLUNE_SCREEN_24:              ; [$837d]
    db SPRITE_ENEMY_MYCONID                 ; [$837d] SpriteEntity
    db $9c                                  ; [$837e] undefined

    db SPRITE_ENEMY_ZOZURA
    db $55                                  ; [$8380] undefined

    db SPRITE_OBJ_GLOVE_2
    db $31,$ff,$ff                          ; [$8382] undefined

SPRITE_INFO_APOLUNE_SCREEN_25:              ; [$8385]
    db SPRITE_ENEMY_MYCONID                 ; [$8385] SpriteEntity
    db $98                                  ; [$8386] undefined

    db SPRITE_ENEMY_CHARRON
    db $4d,$ff,$ff                          ; [$8388] undefined

SPRITE_INFO_APOLUNE_SCREEN_26:              ; [$838b]
    db SPRITE_ENEMY_YUINARU                 ; [$838b] SpriteEntity
    db $28                                  ; [$838c] undefined

    db SPRITE_ENEMY_CHARRON
    db $99,$ff,$ff                          ; [$838e] undefined

SPRITE_INFO_APOLUNE_SCREEN_28:              ; [$8391]
    db SPRITE_ENEMY_CHARRON                 ; [$8391] SpriteEntity
    db $25                                  ; [$8392] undefined

    db SPRITE_ENEMY_IKEDA
    db $98,$ff,$ff                          ; [$8394] undefined

SPRITE_INFO_APOLUNE_SCREEN_29:              ; [$8397]
    db SPRITE_OBJ_OINTMENT                  ; [$8397] SpriteEntity
    db $41                                  ; [$8398] undefined

    db SPRITE_ENEMY_YUINARU
    db $99                                  ; [$839a] undefined

    db SPRITE_ENEMY_YUINARU
    db $cc                                  ; [$839c] undefined

    db SPRITE_ENEMY_YUINARU
    db $55,$ff,$ff                          ; [$839e] undefined

SPRITE_INFO_APOLUNE_SCREEN_30:              ; [$83a1]
    db SPRITE_ENEMY_CHARRON                 ; [$83a1] SpriteEntity
    db $99                                  ; [$83a2] undefined

    db SPRITE_ENEMY_YUINARU
    db $3b,$ff,$ff                          ; [$83a4] undefined

SPRITE_INFO_APOLUNE_SCREEN_31:              ; [$83a7]
    db SPRITE_ENEMY_IKEDA                   ; [$83a7] SpriteEntity
    db $99                                  ; [$83a8] undefined

    db SPRITE_ENEMY_IKEDA
    db $95,$ff,$ff                          ; [$83aa] undefined

SPRITE_INFO_APOLUNE_SCREEN_32:              ; [$83ad]
    db SPRITE_ENEMY_IKEDA                   ; [$83ad] SpriteEntity
    db $99                                  ; [$83ae] undefined

    db SPRITE_ENEMY_IKEDA
    db $95,$ff,$ff                          ; [$83b0] undefined

SPRITE_INFO_APOLUNE_SCREEN_33:              ; [$83b3]
    db SPRITE_OBJ_RED_POTION                ; [$83b3] SpriteEntity
    db $7e                                  ; [$83b4] undefined

    db SPRITE_ENEMY_CHARRON
    db $88,$ff,$ff                          ; [$83b6] undefined

SPRITE_INFO_APOLUNE_SCREEN_34:              ; [$83b9]
    db SPRITE_OBJ_RED_POTION_2              ; [$83b9] SpriteEntity
    db $6e                                  ; [$83ba] undefined

    db SPRITE_ENEMY_YUINARU
    db $55                                  ; [$83bc] undefined

    db SPRITE_ENEMY_CHARRON
    db $7b,$ff,$ff                          ; [$83be] undefined

SPRITE_INFO_APOLUNE_SCREEN_39:              ; [$83c1]
    db SPRITE_ENEMY_CHARRON                 ; [$83c1] SpriteEntity
    db $95                                  ; [$83c2] undefined

    db SPRITE_ENEMY_CHARRON
    db $38,$ff,$ff                          ; [$83c4] undefined

SPRITE_INFO_APOLUNE_SCREEN_35:              ; [$83c7]
    db SPRITE_ENEMY_YUINARU                 ; [$83c7] SpriteEntity
    db $35                                  ; [$83c8] undefined

    db SPRITE_ENEMY_YUINARU
    db $58                                  ; [$83ca] undefined

    db SPRITE_ENEMY_YUINARU
    db $8f,$ff,$ff                          ; [$83cc] undefined

SPRITE_INFO_APOLUNE_SCREEN_36:              ; [$83cf]
    db SPRITE_ENEMY_CHARRON                 ; [$83cf] SpriteEntity
    db $89                                  ; [$83d0] undefined

    db SPRITE_ENEMY_CHARRON
    db $35,$ff,$ff                          ; [$83d2] undefined

SPRITE_INFO_APOLUNE_SCREEN_38:              ; [$83d5]
    db SPRITE_ENEMY_CHARRON                 ; [$83d5] SpriteEntity
    db $34                                  ; [$83d6] undefined

    db SPRITE_ENEMY_YUINARU
    db $75,$ff,$ff                          ; [$83d8] undefined

SPRITE_INFO_APOLUNE_SCREEN_37:              ; [$83db]
    db SPRITE_NPC_MAGIC_TEACHER             ; [$83db] SpriteEntity
    db $4b,$62,$38,$ff,$25,$ff              ; [$83dc] undefined

SPRITE_INFO_APOLUNE_SCREEN_61:              ; [$83e2]
    db SPRITE_NPC_MAGIC_TEACHER             ; [$83e2] SpriteEntity
    db $2a,$61,$1b,$ff                      ; [$83e3] undefined

    db $26
    db $ff                                  ; [$83e8] undefined

SPRITE_INFO_APOLUNE_SCREEN_63:              ; [$83e9]
    db SPRITE_NPC_MAGIC_TEACHER             ; [$83e9] SpriteEntity
    db $99,$63,$8a,$ff                      ; [$83ea] undefined

    db $27
    db $ff                                  ; [$83ef] undefined

SPRITE_INFO_APOLUNE_SCREEN_40:              ; [$83f0]
    db SPRITE_EFFECT_FOUNTAIN               ; [$83f0] SpriteEntity
    db $55,$ff,$ff                          ; [$83f1] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_PATH_TO_MASCON          ; CurrentScreen_SpecialEventID

SPRITE_INFO_APOLUNE_SCREEN_41:              ; [$83f6]
    db SPRITE_OBJ_POISON_2                  ; [$83f6] SpriteEntity
    db $31                                  ; [$83f7] undefined

    db SPRITE_ENEMY_IKEDA
    db $99                                  ; [$83f9] undefined

    db SPRITE_ENEMY_IKEDA
    db $96,$ff,$ff                          ; [$83fb] undefined

SPRITE_INFO_APOLUNE_SCREEN_42:              ; [$83fe]
    db SPRITE_ENEMY_CHARRON                 ; [$83fe] SpriteEntity
    db $99,$ff,$ff                          ; [$83ff] undefined

SPRITE_INFO_APOLUNE_SCREEN_43:              ; [$8402]
    db SPRITE_ENEMY_CHARRON                 ; [$8402] SpriteEntity
    db $35                                  ; [$8403] undefined

    db SPRITE_ENEMY_CHARRON
    db $3b,$ff,$ff                          ; [$8405] undefined

SPRITE_INFO_APOLUNE_SCREEN_44:              ; [$8408]
    db SPRITE_ENEMY_MYCONID                 ; [$8408] SpriteEntity
    db $99                                  ; [$8409] undefined

    db SPRITE_ENEMY_ZOZURA
    db $6a                                  ; [$840b] undefined

    db SPRITE_ENEMY_ZOZURA
    db $53,$ff,$ff                          ; [$840d] undefined

SPRITE_INFO_APOLUNE_SCREEN_45:              ; [$8410]
    db SPRITE_OBJ_WING_BOOTS                ; [$8410] SpriteEntity
    db $41                                  ; [$8411] undefined

    db SPRITE_ENEMY_HORNET
    db $89                                  ; [$8413] undefined

    db SPRITE_ENEMY_HORNET
    db $12                                  ; [$8415] undefined

    db SPRITE_ENEMY_HORNET
    db $6c,$ff,$ff                          ; [$8417] undefined

SPRITE_INFO_APOLUNE_SCREEN_46:              ; [$841a]
    db SPRITE_BOSS_RIPASHEIKU               ; [$841a] SpriteEntity
    db $64,$ff,$ff                          ; [$841b] undefined

SPRITE_INFO_APOLUNE_SCREEN_47:              ; [$841e]
    db SPRITE_ENEMY_MYCONID                 ; [$841e] SpriteEntity
    db $39                                  ; [$841f] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $99,$ff,$ff                          ; [$8421] undefined

SPRITE_INFO_APOLUNE_SCREEN_48:              ; [$8424]
    db SPRITE_ENEMY_SNOWMAN                 ; [$8424] SpriteEntity
    db $99                                  ; [$8425] undefined

    db SPRITE_ENEMY_CHARRON
    db $45,$ff,$ff                          ; [$8427] undefined

SPRITE_INFO_APOLUNE_SCREEN_49:              ; [$842a]
    db SPRITE_ENEMY_SNOWMAN                 ; [$842a] SpriteEntity
    db $99                                  ; [$842b] undefined

    db SPRITE_ENEMY_CHARRON
    db $45,$ff,$ff                          ; [$842d] undefined

SPRITE_INFO_APOLUNE_SCREEN_50:              ; [$8430]
    db SPRITE_ENEMY_CHARRON                 ; [$8430] SpriteEntity
    db $99                                  ; [$8431] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $23,$ff,$ff                          ; [$8433] undefined

SPRITE_INFO_APOLUNE_SCREEN_51:              ; [$8436]
    db SPRITE_ENEMY_SNOWMAN                 ; [$8436] SpriteEntity
    db $94                                  ; [$8437] undefined

    db SPRITE_ENEMY_CHARRON
    db $45,$ff,$ff                          ; [$8439] undefined

SPRITE_INFO_APOLUNE_SCREEN_52:              ; [$843c]
    db SPRITE_ENEMY_IKEDA                   ; [$843c] SpriteEntity
    db $99                                  ; [$843d] undefined

    db SPRITE_ENEMY_CHARRON
    db $21,$ff,$ff                          ; [$843f] undefined

SPRITE_INFO_APOLUNE_SCREEN_53:              ; [$8442]
    db SPRITE_OBJ_POISON_2                  ; [$8442] SpriteEntity
    db $a2                                  ; [$8443] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $93                                  ; [$8445] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $45,$ff,$ff                          ; [$8447] undefined

SPRITE_INFO_APOLUNE_SCREEN_54:              ; [$844a]
    db SPRITE_ENEMY_SNOWMAN                 ; [$844a] SpriteEntity
    db $9e                                  ; [$844b] undefined

    db SPRITE_ENEMY_CHARRON
    db $45,$ff,$ff                          ; [$844d] undefined

SPRITE_INFO_APOLUNE_SCREEN_55:              ; [$8450]
    db SPRITE_OBJ_OINTMENT_2                ; [$8450] SpriteEntity
    db $33                                  ; [$8451] undefined

    db SPRITE_ENEMY_CHARRON
    db $95,$ff,$ff                          ; [$8453] undefined

SPRITE_INFO_APOLUNE_SCREEN_56:              ; [$8456]
    db SPRITE_ENEMY_SNOWMAN                 ; [$8456] SpriteEntity
    db $79                                  ; [$8457] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $76,$ff,$ff                          ; [$8459] undefined

SPRITE_INFO_APOLUNE_SCREEN_57:              ; [$845c]
    db SPRITE_ENEMY_SNOWMAN                 ; [$845c] SpriteEntity
    db $97                                  ; [$845d] undefined

    db SPRITE_ENEMY_CHARRON
    db $4a,$ff,$ff                          ; [$845f] undefined

SPRITE_INFO_APOLUNE_SCREEN_58:              ; [$8462]
    db SPRITE_BOSS_BORABOHRA                ; [$8462] SpriteEntity
    db $8a                                  ; [$8463] undefined

    db SPRITE_ENEMY_HORNET
    db $45                                  ; [$8465] undefined

    db SPRITE_ENEMY_HORNET
    db $28,$ff,$ff                          ; [$8467] undefined

SPRITE_INFO_APOLUNE_SCREEN_59:              ; [$846a]
    db SPRITE_OBJ_WING_BOOTS_QUEST          ; [$846a] SpriteEntity
    db $3d                                  ; [$846b] undefined

    db SPRITE_BOSS_ZORUGERIRU
    db $2c,$ff,$ff                          ; [$846d] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; CurrentScreen_SpecialEventID

SPRITE_INFO_APOLUNE_SCREEN_60:              ; [$8472]
    db SPRITE_OBJ_ELIXIR                    ; [$8472] SpriteEntity
    db $32                                  ; [$8473] undefined

    db SPRITE_ENEMY_HORNET
    db $15                                  ; [$8475] undefined

    db SPRITE_ENEMY_HORNET
    db $3c                                  ; [$8477] undefined

    db SPRITE_ENEMY_HORNET
    db $89,$ff,$ff                          ; [$8479] undefined

SPRITE_INFO_APOLUNE_SCREEN_62:              ; [$847c]
    db SPRITE_BOSS_RIPASHEIKU               ; [$847c] SpriteEntity
    db $69,$ff,$ff                          ; [$847d] undefined

SPRITE_INFO_APOLUNE_SCREEN_27:              ; [$8480]
    db $ff,$ff                              ; [$8480] undefined


;============================================================================
; Forepaw Sprite Information
;============================================================================
SPRITE_INFO_FOREPAW:                        ; [$8482]
    dw SPRITE_INFO_FOREPAW_SCREEN_00        ; SPRITE_INFO_FOREPAW_SCREEN_00
                                            ; [$PRG11::8482]
    dw SPRITE_INFO_FOREPAW_SCREEN_01        ; SPRITE_INFO_FOREPAW_SCREEN_01
                                            ; [$PRG11::8484]
    dw SPRITE_INFO_FOREPAW_SCREEN_02        ; SPRITE_INFO_FOREPAW_SCREEN_02
                                            ; [$PRG11::8486]
    dw SPRITE_INFO_FOREPAW_SCREEN_03        ; SPRITE_INFO_FOREPAW_SCREEN_03
                                            ; [$PRG11::8488]
    dw SPRITE_INFO_FOREPAW_SCREEN_04        ; SPRITE_INFO_FOREPAW_SCREEN_04
                                            ; [$PRG11::848a]
    dw SPRITE_INFO_FOREPAW_SCREEN_05        ; SPRITE_INFO_FOREPAW_SCREEN_05
                                            ; [$PRG11::848c]
    dw SPRITE_INFO_FOREPAW_SCREEN_06        ; SPRITE_INFO_FOREPAW_SCREEN_06
                                            ; [$PRG11::848e]
    dw SPRITE_INFO_FOREPAW_SCREEN_07        ; SPRITE_INFO_FOREPAW_SCREEN_07
                                            ; [$PRG11::8490]
    dw SPRITE_INFO_FOREPAW_SCREEN_08        ; SPRITE_INFO_FOREPAW_SCREEN_08
                                            ; [$PRG11::8492]
    dw SPRITE_INFO_FOREPAW_SCREEN_09        ; SPRITE_INFO_FOREPAW_SCREEN_09
                                            ; [$PRG11::8494]
    dw SPRITE_INFO_FOREPAW_SCREEN_10_11     ; SPRITE_INFO_FOREPAW_SCREEN_10_11
                                            ; [$PRG11::8496]
    dw SPRITE_INFO_FOREPAW_SCREEN_10_11     ; SPRITE_INFO_FOREPAW_SCREEN_10_11
                                            ; [$PRG11::8498]
    dw SPRITE_INFO_FOREPAW_SCREEN_12        ; SPRITE_INFO_FOREPAW_SCREEN_12
                                            ; [$PRG11::849a]
    dw SPRITE_INFO_FOREPAW_SCREEN_13        ; SPRITE_INFO_FOREPAW_SCREEN_13
                                            ; [$PRG11::849c]
    dw SPRITE_INFO_FOREPAW_SCREEN_14        ; SPRITE_INFO_FOREPAW_SCREEN_14
                                            ; [$PRG11::849e]
    dw SPRITE_INFO_FOREPAW_SCREEN_15        ; SPRITE_INFO_FOREPAW_SCREEN_15
                                            ; [$PRG11::84a0]
    dw SPRITE_INFO_FOREPAW_SCREEN_16        ; SPRITE_INFO_FOREPAW_SCREEN_16
                                            ; [$PRG11::84a2]
    dw SPRITE_INFO_FOREPAW_SCREEN_17        ; SPRITE_INFO_FOREPAW_SCREEN_17
                                            ; [$PRG11::84a4]
    dw SPRITE_INFO_FOREPAW_SCREEN_18        ; SPRITE_INFO_FOREPAW_SCREEN_18
                                            ; [$PRG11::84a6]
    dw SPRITE_INFO_FOREPAW_SCREEN_19        ; SPRITE_INFO_FOREPAW_SCREEN_19
                                            ; [$PRG11::84a8]
    dw SPRITE_INFO_FOREPAW_SCREEN_20        ; SPRITE_INFO_FOREPAW_SCREEN_20
                                            ; [$PRG11::84aa]
    dw SPRITE_INFO_FOREPAW_SCREEN_21        ; SPRITE_INFO_FOREPAW_SCREEN_21
                                            ; [$PRG11::84ac]
    dw SPRITE_INFO_FOREPAW_SCREEN_22        ; SPRITE_INFO_FOREPAW_SCREEN_22
                                            ; [$PRG11::84ae]
    dw SPRITE_INFO_FOREPAW_SCREEN_23        ; SPRITE_INFO_FOREPAW_SCREEN_23
                                            ; [$PRG11::84b0]
    dw SPRITE_INFO_FOREPAW_SCREEN_24        ; SPRITE_INFO_FOREPAW_SCREEN_24
                                            ; [$PRG11::84b2]
    dw SPRITE_INFO_FOREPAW_SCREEN_25        ; SPRITE_INFO_FOREPAW_SCREEN_25
                                            ; [$PRG11::84b4]
    dw SPRITE_INFO_FOREPAW_SCREEN_26        ; SPRITE_INFO_FOREPAW_SCREEN_26
                                            ; [$PRG11::84b6]
    dw SPRITE_INFO_FOREPAW_SCREEN_27        ; SPRITE_INFO_FOREPAW_SCREEN_27
                                            ; [$PRG11::84b8]
    dw SPRITE_INFO_FOREPAW_SCREEN_28        ; SPRITE_INFO_FOREPAW_SCREEN_28
                                            ; [$PRG11::84ba]
    dw SPRITE_INFO_FOREPAW_SCREEN_29        ; SPRITE_INFO_FOREPAW_SCREEN_29
                                            ; [$PRG11::84bc]
    dw SPRITE_INFO_FOREPAW_SCREEN_30        ; SPRITE_INFO_FOREPAW_SCREEN_30
                                            ; [$PRG11::84be]
    dw SPRITE_INFO_FOREPAW_SCREEN_31        ; SPRITE_INFO_FOREPAW_SCREEN_31
                                            ; [$PRG11::84c0]
    dw SPRITE_INFO_FOREPAW_SCREEN_32        ; SPRITE_INFO_FOREPAW_SCREEN_32
                                            ; [$PRG11::84c2]
    dw SPRITE_INFO_FOREPAW_SCREEN_33        ; SPRITE_INFO_FOREPAW_SCREEN_33
                                            ; [$PRG11::84c4]
    dw SPRITE_INFO_FOREPAW_SCREEN_34        ; SPRITE_INFO_FOREPAW_SCREEN_34
                                            ; [$PRG11::84c6]
    dw SPRITE_INFO_FOREPAW_SCREEN_35_36     ; SPRITE_INFO_FOREPAW_SCREEN_35_36
                                            ; [$PRG11::84c8]
    dw SPRITE_INFO_FOREPAW_SCREEN_35_36     ; SPRITE_INFO_FOREPAW_SCREEN_35_36
                                            ; [$PRG11::84ca]
    dw SPRITE_INFO_FOREPAW_SCREEN_37        ; SPRITE_INFO_FOREPAW_SCREEN_37
                                            ; [$PRG11::84cc]
    dw SPRITE_INFO_FOREPAW_SCREEN_38        ; SPRITE_INFO_FOREPAW_SCREEN_38
                                            ; [$PRG11::84ce]
    dw SPRITE_INFO_FOREPAW_SCREEN_39        ; SPRITE_INFO_FOREPAW_SCREEN_39
                                            ; [$PRG11::84d0]
    dw SPRITE_INFO_FOREPAW_SCREEN_40        ; SPRITE_INFO_FOREPAW_SCREEN_40
                                            ; [$PRG11::84d2]
    dw SPRITE_INFO_FOREPAW_SCREEN_41        ; SPRITE_INFO_FOREPAW_SCREEN_41
                                            ; [$PRG11::84d4]
    dw SPRITE_INFO_FOREPAW_SCREEN_42        ; SPRITE_INFO_FOREPAW_SCREEN_42
                                            ; [$PRG11::84d6]
    dw SPRITE_INFO_FOREPAW_SCREEN_43        ; SPRITE_INFO_FOREPAW_SCREEN_43
                                            ; [$PRG11::84d8]
    dw SPRITE_INFO_FOREPAW_SCREEN_44        ; SPRITE_INFO_FOREPAW_SCREEN_44
                                            ; [$PRG11::84da]
    dw SPRITE_INFO_FOREPAW_SCREEN_45        ; SPRITE_INFO_FOREPAW_SCREEN_45
                                            ; [$PRG11::84dc]
    dw SPRITE_INFO_FOREPAW_SCREEN_46        ; SPRITE_INFO_FOREPAW_SCREEN_46
                                            ; [$PRG11::84de]
    dw SPRITE_INFO_FOREPAW_SCREEN_47        ; SPRITE_INFO_FOREPAW_SCREEN_47
                                            ; [$PRG11::84e0]
    dw SPRITE_INFO_FOREPAW_SCREEN_48        ; SPRITE_INFO_FOREPAW_SCREEN_48
                                            ; [$PRG11::84e2]
    dw SPRITE_INFO_FOREPAW_SCREEN_49        ; SPRITE_INFO_FOREPAW_SCREEN_49
                                            ; [$PRG11::84e4]
    dw SPRITE_INFO_FOREPAW_SCREEN_50        ; SPRITE_INFO_FOREPAW_SCREEN_50
                                            ; [$PRG11::84e6]
    dw SPRITE_INFO_FOREPAW_SCREEN_51        ; SPRITE_INFO_FOREPAW_SCREEN_51
                                            ; [$PRG11::84e8]
    dw SPRITE_INFO_FOREPAW_SCREEN_52        ; SPRITE_INFO_FOREPAW_SCREEN_52
                                            ; [$PRG11::84ea]
    dw SPRITE_INFO_FOREPAW_SCREEN_53        ; SPRITE_INFO_FOREPAW_SCREEN_53
                                            ; [$PRG11::84ec]
    dw SPRITE_INFO_FOREPAW_SCREEN_54        ; SPRITE_INFO_FOREPAW_SCREEN_54
                                            ; [$PRG11::84ee]
    dw SPRITE_INFO_FOREPAW_SCREEN_55        ; SPRITE_INFO_FOREPAW_SCREEN_55
                                            ; [$PRG11::84f0]
    dw SPRITE_INFO_FOREPAW_SCREEN_56        ; SPRITE_INFO_FOREPAW_SCREEN_56
                                            ; [$PRG11::84f2]
    dw SPRITE_INFO_FOREPAW_SCREEN_57        ; SPRITE_INFO_FOREPAW_SCREEN_57
                                            ; [$PRG11::84f4]
    dw SPRITE_INFO_FOREPAW_SCREEN_58        ; SPRITE_INFO_FOREPAW_SCREEN_58
                                            ; [$PRG11::84f6]
    dw SPRITE_INFO_FOREPAW_SCREEN_59        ; SPRITE_INFO_FOREPAW_SCREEN_59
                                            ; [$PRG11::84f8]
    dw SPRITE_INFO_FOREPAW_SCREEN_60        ; SPRITE_INFO_FOREPAW_SCREEN_60
                                            ; [$PRG11::84fa]
    dw SPRITE_INFO_FOREPAW_SCREEN_61        ; SPRITE_INFO_FOREPAW_SCREEN_61
                                            ; [$PRG11::84fc]
    dw SPRITE_INFO_FOREPAW_SCREEN_62        ; SPRITE_INFO_FOREPAW_SCREEN_62
                                            ; [$PRG11::84fe]
    dw SPRITE_INFO_FOREPAW_SCREEN_63        ; SPRITE_INFO_FOREPAW_SCREEN_63
                                            ; [$PRG11::8500]
    dw SPRITE_INFO_FOREPAW_SCREEN_64        ; SPRITE_INFO_FOREPAW_SCREEN_64
                                            ; [$PRG11::8502]
    dw SPRITE_INFO_FOREPAW_SCREEN_65        ; SPRITE_INFO_FOREPAW_SCREEN_65
                                            ; [$PRG11::8504]
    dw SPRITE_INFO_FOREPAW_SCREEN_66        ; SPRITE_INFO_FOREPAW_SCREEN_66
                                            ; [$PRG11::8506]
    dw SPRITE_INFO_FOREPAW_SCREEN_67        ; SPRITE_INFO_FOREPAW_SCREEN_67
                                            ; [$PRG11::8508]
    dw SPRITE_INFO_FOREPAW_SCREEN_68        ; SPRITE_INFO_FOREPAW_SCREEN_68
                                            ; [$PRG11::850a]
    dw SPRITE_INFO_FOREPAW_SCREEN_69        ; SPRITE_INFO_FOREPAW_SCREEN_69
                                            ; [$PRG11::850c]
    dw SPRITE_INFO_FOREPAW_SCREEN_70        ; SPRITE_INFO_FOREPAW_SCREEN_70
                                            ; [$PRG11::850e]
    dw SPRITE_INFO_FOREPAW_SCREEN_71        ; SPRITE_INFO_FOREPAW_SCREEN_71
                                            ; [$PRG11::8510]
    dw SPRITE_INFO_FOREPAW_SCREEN_72        ; SPRITE_INFO_FOREPAW_SCREEN_72
                                            ; [$PRG11::8512]
    dw SPRITE_INFO_FOREPAW_SCREEN_73        ; SPRITE_INFO_FOREPAW_SCREEN_73
                                            ; [$PRG11::8514]
    dw SPRITE_INFO_FOREPAW_SCREEN_74        ; SPRITE_INFO_FOREPAW_SCREEN_74
                                            ; [$PRG11::8516]
    dw SPRITE_INFO_FOREPAW_SCREEN_75        ; SPRITE_INFO_FOREPAW_SCREEN_75
                                            ; [$PRG11::8518]
    dw SPRITE_INFO_FOREPAW_SCREEN_76        ; SPRITE_INFO_FOREPAW_SCREEN_76
                                            ; [$PRG11::851a]
    dw SPRITE_INFO_FOREPAW_SCREEN_77        ; SPRITE_INFO_FOREPAW_SCREEN_77
                                            ; [$PRG11::851c]
    dw SPRITE_INFO_FOREPAW_SCREEN_78        ; SPRITE_INFO_FOREPAW_SCREEN_78
                                            ; [$PRG11::851e]
    dw SPRITE_INFO_FOREPAW_SCREEN_79        ; SPRITE_INFO_FOREPAW_SCREEN_79
                                            ; [$PRG11::8520]
    dw SPRITE_INFO_FOREPAW_SCREEN_80        ; SPRITE_INFO_FOREPAW_SCREEN_80
                                            ; [$PRG11::8522]
    dw SPRITE_INFO_FOREPAW_SCREEN_81        ; SPRITE_INFO_FOREPAW_SCREEN_81
                                            ; [$PRG11::8524]
    dw SPRITE_INFO_FOREPAW_SCREEN_82        ; SPRITE_INFO_FOREPAW_SCREEN_82
                                            ; [$PRG11::8526]

;
; XREFS:
;     SPRITE_INFO_FOREPAW [$PRG11::8482]
;
SPRITE_INFO_FOREPAW_SCREEN_00:              ; [$8528]
    db SPRITE_ENEMY_NAGA                    ; [$8528] SpriteEntity
    db $85                                  ; [$8529] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $43                                  ; [$852b] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $2c,$ff,$ff                          ; [$852d] undefined

SPRITE_INFO_FOREPAW_SCREEN_01:              ; [$8530]
    db SPRITE_ENEMY_NAGA                    ; [$8530] SpriteEntity
    db $9c                                  ; [$8531] undefined

    db SPRITE_ENEMY_HORNET
    db $5d                                  ; [$8533] undefined

    db SPRITE_ENEMY_HORNET
    db $81,$ff,$ff                          ; [$8535] undefined

SPRITE_INFO_FOREPAW_SCREEN_02:              ; [$8538]
    db SPRITE_ENEMY_NAGA                    ; [$8538] SpriteEntity
    db $66                                  ; [$8539] undefined

    db SPRITE_ENEMY_NAGA
    db $8c,$ff,$ff                          ; [$853b] undefined

SPRITE_INFO_FOREPAW_SCREEN_03:              ; [$853e]
    db SPRITE_ENEMY_NAGA                    ; [$853e] SpriteEntity
    db $94                                  ; [$853f] undefined

    db SPRITE_ENEMY_HORNET
    db $48                                  ; [$8541] undefined

    db SPRITE_ENEMY_HORNET
    db $23,$ff,$ff                          ; [$8543] undefined

SPRITE_INFO_FOREPAW_SCREEN_04:              ; [$8546]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8546] SpriteEntity
    db $96                                  ; [$8547] undefined

    db SPRITE_ENEMY_IKEDA
    db $22,$ff,$ff                          ; [$8549] undefined

SPRITE_INFO_FOREPAW_SCREEN_05:              ; [$854c]
    db SPRITE_ENEMY_CHARRON                 ; [$854c] SpriteEntity
    db $43                                  ; [$854d] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $98,$ff,$ff                          ; [$854f] undefined

SPRITE_INFO_FOREPAW_SCREEN_06:              ; [$8552]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8552] SpriteEntity
    db $23                                  ; [$8553] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $89,$ff,$ff                          ; [$8555] undefined

SPRITE_INFO_FOREPAW_SCREEN_07:              ; [$8558]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8558] SpriteEntity
    db $38                                  ; [$8559] undefined

    db SPRITE_ENEMY_HORNET
    db $3b,$ff,$ff                          ; [$855b] undefined

SPRITE_INFO_FOREPAW_SCREEN_08:              ; [$855e]
    db SPRITE_ENEMY_HORNET                  ; [$855e] SpriteEntity
    db $28                                  ; [$855f] undefined

    db SPRITE_ENEMY_HORNET
    db $4b                                  ; [$8561] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $98,$ff,$ff                          ; [$8563] undefined

SPRITE_INFO_FOREPAW_SCREEN_09:              ; [$8566]
    db SPRITE_ENEMY_HORNET                  ; [$8566] SpriteEntity
    db $38                                  ; [$8567] undefined

    db SPRITE_ENEMY_HORNET
    db $54                                  ; [$8569] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $9b,$ff,$ff                          ; [$856b] undefined

SPRITE_INFO_FOREPAW_SCREEN_10_11:           ; [$856e]
    db $ff,$ff                              ; [$856e] undefined

SPRITE_INFO_FOREPAW_SCREEN_12:              ; [$8570]
    db SPRITE_ENEMY_HORNET                  ; [$8570] SpriteEntity
    db $45                                  ; [$8571] undefined

    db SPRITE_ENEMY_HORNET
    db $78                                  ; [$8573] undefined

    db SPRITE_ENEMY_HORNET
    db $2b,$ff,$ff                          ; [$8575] undefined

SPRITE_INFO_FOREPAW_SCREEN_13:              ; [$8578]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8578] SpriteEntity
    db $63                                  ; [$8579] undefined

    db SPRITE_ENEMY_HORNET
    db $38                                  ; [$857b] undefined

    db SPRITE_ENEMY_HORNET
    db $5a,$ff,$ff                          ; [$857d] undefined

SPRITE_INFO_FOREPAW_SCREEN_14:              ; [$8580]
    db SPRITE_ENEMY_BIHORUDA                ; [$8580] SpriteEntity
    db $43                                  ; [$8581] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $3b                                  ; [$8583] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $87,$ff,$ff                          ; [$8585] undefined

SPRITE_INFO_FOREPAW_SCREEN_15:              ; [$8588]
    db SPRITE_ENEMY_BIHORUDA                ; [$8588] SpriteEntity
    db $27                                  ; [$8589] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $4c                                  ; [$858b] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $87,$ff,$ff                          ; [$858d] undefined

SPRITE_INFO_FOREPAW_SCREEN_16:              ; [$8590]
    db SPRITE_ENEMY_HORNET                  ; [$8590] SpriteEntity
    db $45                                  ; [$8591] undefined

    db SPRITE_ENEMY_HORNET
    db $88                                  ; [$8593] undefined

    db SPRITE_ENEMY_CHARRON
    db $9b,$ff,$ff                          ; [$8595] undefined

SPRITE_INFO_FOREPAW_SCREEN_17:              ; [$8598]
    db SPRITE_OBJ_WING_BOOTS                ; [$8598] SpriteEntity
    db $5e                                  ; [$8599] undefined

    db SPRITE_ENEMY_HORNET
    db $45                                  ; [$859b] undefined

    db SPRITE_ENEMY_HORNET
    db $88                                  ; [$859d] undefined

    db SPRITE_ENEMY_CHARRON
    db $24,$ff,$ff                          ; [$859f] undefined

SPRITE_INFO_FOREPAW_SCREEN_18:              ; [$85a2]
    db SPRITE_ENEMY_HORNET                  ; [$85a2] SpriteEntity
    db $45                                  ; [$85a3] undefined

    db SPRITE_ENEMY_HORNET
    db $68                                  ; [$85a5] undefined

    db SPRITE_ENEMY_CHARRON
    db $9b,$ff,$ff                          ; [$85a7] undefined

SPRITE_INFO_FOREPAW_SCREEN_19:              ; [$85aa]
    db SPRITE_ENEMY_BIHORUDA                ; [$85aa] SpriteEntity
    db $45                                  ; [$85ab] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $88                                  ; [$85ad] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $9b,$ff,$ff                          ; [$85af] undefined

SPRITE_INFO_FOREPAW_SCREEN_20:              ; [$85b2]
    db SPRITE_ENEMY_BIHORUDA                ; [$85b2] SpriteEntity
    db $35                                  ; [$85b3] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $28                                  ; [$85b5] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $97,$ff,$ff                          ; [$85b7] undefined

SPRITE_INFO_FOREPAW_SCREEN_21:              ; [$85ba]
    db SPRITE_ENEMY_BIHORUDA                ; [$85ba] SpriteEntity
    db $45                                  ; [$85bb] undefined

    db SPRITE_ENEMY_BIHORUDA
    db $88                                  ; [$85bd] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $98,$ff,$ff                          ; [$85bf] undefined

SPRITE_INFO_FOREPAW_SCREEN_22:              ; [$85c2]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$85c2] SpriteEntity
    db $98                                  ; [$85c3] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $77,$ff,$ff                          ; [$85c5] undefined

SPRITE_INFO_FOREPAW_SCREEN_23:              ; [$85c8]
    db SPRITE_ENEMY_HORNET                  ; [$85c8] SpriteEntity
    db $69                                  ; [$85c9] undefined

    db SPRITE_ENEMY_HORNET
    db $a3                                  ; [$85cb] undefined

    db SPRITE_ENEMY_RAIDEN
    db $a5,$ff,$ff                          ; [$85cd] undefined

SPRITE_INFO_FOREPAW_SCREEN_24:              ; [$85d0]
    db SPRITE_ENEMY_HORNET                  ; [$85d0] SpriteEntity
    db $64                                  ; [$85d1] undefined

    db SPRITE_ENEMY_HORNET
    db $1a                                  ; [$85d3] undefined

    db SPRITE_ENEMY_RAIDEN
    db $87,$ff,$ff                          ; [$85d5] undefined

SPRITE_INFO_FOREPAW_SCREEN_25:              ; [$85d8]
    db SPRITE_ENEMY_YAREEKA                 ; [$85d8] SpriteEntity
    db $81                                  ; [$85d9] undefined

    db SPRITE_ENEMY_RAIDEN
    db $37,$ff,$ff                          ; [$85db] undefined

SPRITE_INFO_FOREPAW_SCREEN_26:              ; [$85de]
    db SPRITE_ENEMY_CHARRON                 ; [$85de] SpriteEntity
    db $61                                  ; [$85df] undefined

    db SPRITE_ENEMY_RAIDEN
    db $25,$ff,$ff                          ; [$85e1] undefined

SPRITE_INFO_FOREPAW_SCREEN_27:              ; [$85e4]
    db SPRITE_OBJ_WING_BOOTS                ; [$85e4] SpriteEntity
    db $35                                  ; [$85e5] undefined

    db SPRITE_ENEMY_IKEDA
    db $24                                  ; [$85e7] undefined

    db SPRITE_ENEMY_IKEDA
    db $99,$ff,$ff                          ; [$85e9] undefined

SPRITE_INFO_FOREPAW_SCREEN_28:              ; [$85ec]
    db SPRITE_ENEMY_IKEDA                   ; [$85ec] SpriteEntity
    db $84                                  ; [$85ed] undefined

    db SPRITE_ENEMY_IKEDA
    db $98,$ff,$ff                          ; [$85ef] undefined

SPRITE_INFO_FOREPAW_SCREEN_29:              ; [$85f2]
    db SPRITE_ENEMY_CHARRON                 ; [$85f2] SpriteEntity
    db $44                                  ; [$85f3] undefined

    db SPRITE_ENEMY_YAREEKA
    db $89,$ff,$ff                          ; [$85f5] undefined

SPRITE_INFO_FOREPAW_SCREEN_30:              ; [$85f8]
    db SPRITE_OBJ_POISON                    ; [$85f8] SpriteEntity
    db $68                                  ; [$85f9] undefined

    db SPRITE_ENEMY_SUGATA
    db $99,$ff,$ff                          ; [$85fb] undefined

SPRITE_INFO_FOREPAW_SCREEN_31:              ; [$85fe]
    db SPRITE_OBJ_POISON                    ; [$85fe] SpriteEntity
    db $a1                                  ; [$85ff] undefined

    db SPRITE_ENEMY_SUGATA
    db $95,$ff,$ff                          ; [$8601] undefined

SPRITE_INFO_FOREPAW_SCREEN_32:              ; [$8604]
    db SPRITE_ENEMY_YAREEKA                 ; [$8604] SpriteEntity
    db $39                                  ; [$8605] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $96,$ff,$ff                          ; [$8607] undefined

SPRITE_INFO_FOREPAW_SCREEN_33:              ; [$860a]
    db SPRITE_ENEMY_YAREEKA                 ; [$860a] SpriteEntity
    db $64                                  ; [$860b] undefined

    db SPRITE_ENEMY_GIANT_BEES
    db $53                                  ; [$860d] undefined

    db SPRITE_ENEMY_GIANT_BEES
    db $5a,$ff,$ff                          ; [$860f] undefined

SPRITE_INFO_FOREPAW_SCREEN_34:              ; [$8612]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8612] SpriteEntity
    db $4c                                  ; [$8613] undefined

    db SPRITE_ENEMY_HORNET
    db $34                                  ; [$8615] undefined

    db SPRITE_ENEMY_HORNET
    db $5c,$ff,$ff                          ; [$8617] undefined

SPRITE_INFO_FOREPAW_SCREEN_35_36:           ; [$861a]
    db $ff,$ff                              ; [$861a] undefined

SPRITE_INFO_FOREPAW_SCREEN_37:              ; [$861c]
    db SPRITE_ENEMY_YAREEKA                 ; [$861c] SpriteEntity
    db $29                                  ; [$861d] undefined

    db SPRITE_ENEMY_YAREEKA
    db $85,$ff,$ff                          ; [$861f] undefined

SPRITE_INFO_FOREPAW_SCREEN_38:              ; [$8622]
    db SPRITE_ENEMY_LAMPREY                 ; [$8622] SpriteEntity
    db $98                                  ; [$8623] undefined

    db SPRITE_ENEMY_GIANT_BEES
    db $15                                  ; [$8625] undefined

    db SPRITE_ENEMY_GIANT_BEES
    db $5a,$ff,$ff                          ; [$8627] undefined

SPRITE_INFO_FOREPAW_SCREEN_39:              ; [$862a]
    db SPRITE_ENEMY_LAMPREY                 ; [$862a] SpriteEntity
    db $3a                                  ; [$862b] undefined

    db SPRITE_ENEMY_LAMPREY
    db $85,$ff,$ff                          ; [$862d] undefined

SPRITE_INFO_FOREPAW_SCREEN_40:              ; [$8630]
    db SPRITE_ENEMY_CHARRON                 ; [$8630] SpriteEntity
    db $87                                  ; [$8631] undefined

    db SPRITE_ENEMY_LAMPREY
    db $2b,$ff,$ff                          ; [$8633] undefined

SPRITE_INFO_FOREPAW_SCREEN_41:              ; [$8636]
    db SPRITE_ENEMY_IKEDA                   ; [$8636] SpriteEntity
    db $7d                                  ; [$8637] undefined

    db SPRITE_ENEMY_IKEDA
    db $75,$ff,$ff                          ; [$8639] undefined

SPRITE_INFO_FOREPAW_SCREEN_42:              ; [$863c]
    db SPRITE_ENEMY_NASH                    ; [$863c] SpriteEntity
    db $1c                                  ; [$863d] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $7a,$ff,$ff                          ; [$863f] undefined

SPRITE_INFO_FOREPAW_SCREEN_43:              ; [$8642]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8642] SpriteEntity
    db $99                                  ; [$8643] undefined

    db SPRITE_ENEMY_CHARRON
    db $4e,$ff,$ff                          ; [$8645] undefined

SPRITE_INFO_FOREPAW_SCREEN_44:              ; [$8648]
    db SPRITE_ENEMY_IKEDA                   ; [$8648] SpriteEntity
    db $6d                                  ; [$8649] undefined

    db SPRITE_ENEMY_IKEDA
    db $85,$ff,$ff                          ; [$864b] undefined

SPRITE_INFO_FOREPAW_SCREEN_45:              ; [$864e]
    db SPRITE_ENEMY_YAREEKA                 ; [$864e] SpriteEntity
    db $82                                  ; [$864f] undefined

    db SPRITE_ENEMY_YAREEKA
    db $2b,$ff,$ff                          ; [$8651] undefined

SPRITE_INFO_FOREPAW_SCREEN_46:              ; [$8654]
    db SPRITE_ENEMY_CHARRON                 ; [$8654] SpriteEntity
    db $39                                  ; [$8655] undefined

    db SPRITE_ENEMY_LAMPREY
    db $9a,$ff,$ff                          ; [$8657] undefined

SPRITE_INFO_FOREPAW_SCREEN_47:              ; [$865a]
    db SPRITE_ENEMY_CHARRON                 ; [$865a] SpriteEntity
    db $25                                  ; [$865b] undefined

    db SPRITE_ENEMY_LAMPREY
    db $9a,$ff,$ff                          ; [$865d] undefined

SPRITE_INFO_FOREPAW_SCREEN_48:              ; [$8660]
    db SPRITE_OBJ_HOUR_GLASS                ; [$8660] SpriteEntity
    db $32                                  ; [$8661] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $65                                  ; [$8663] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $a7,$ff,$ff                          ; [$8665] undefined

SPRITE_INFO_FOREPAW_SCREEN_49:              ; [$8668]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$8668] SpriteEntity
    db $97                                  ; [$8669] undefined

    db SPRITE_ENEMY_YUINARU
    db $13                                  ; [$866b] undefined

    db SPRITE_ENEMY_YUINARU
    db $8d,$ff,$ff                          ; [$866d] undefined

SPRITE_INFO_FOREPAW_SCREEN_50:              ; [$8670]
    db SPRITE_OBJ_WING_BOOTS                ; [$8670] SpriteEntity
    db $48                                  ; [$8671] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $3a                                  ; [$8673] undefined

    db SPRITE_ENEMY_ZOZURA
    db $b8                                  ; [$8675] undefined

    db SPRITE_ENEMY_ZOZURA
    db $be,$ff,$ff                          ; [$8677] undefined

SPRITE_INFO_FOREPAW_SCREEN_51:              ; [$867a]
    db SPRITE_BOSS_RIPASHEIKU               ; [$867a] SpriteEntity
    db $59,$ff,$ff                          ; [$867b] undefined

SPRITE_INFO_FOREPAW_SCREEN_52:              ; [$867e]
    db SPRITE_OBJ_PENDANT                   ; [$867e] SpriteEntity
    db $9e                                  ; [$867f] undefined

    db SPRITE_BOSS_RIPASHEIKU
    db $48,$ff,$ff                          ; [$8681] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; CurrentScreen_SpecialEventID

SPRITE_INFO_FOREPAW_SCREEN_53:              ; [$8686]
    db SPRITE_ENEMY_CHARRON                 ; [$8686] SpriteEntity
    db $ac                                  ; [$8687] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $67,$ff,$ff                          ; [$8689] undefined

SPRITE_INFO_FOREPAW_SCREEN_54:              ; [$868c]
    db SPRITE_ENEMY_NECRON_AIDES            ; [$868c] SpriteEntity
    db $28                                  ; [$868d] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $97,$ff,$ff                          ; [$868f] undefined

SPRITE_INFO_FOREPAW_SCREEN_55:              ; [$8692]
    db SPRITE_ENEMY_CHARRON                 ; [$8692] SpriteEntity
    db $52                                  ; [$8693] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $a7,$ff,$ff                          ; [$8695] undefined

SPRITE_INFO_FOREPAW_SCREEN_56:              ; [$8698]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$8698] SpriteEntity
    db $98                                  ; [$8699] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $33,$ff,$ff                          ; [$869b] undefined

SPRITE_INFO_FOREPAW_SCREEN_57:              ; [$869e]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$869e] SpriteEntity
    db $98                                  ; [$869f] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $39                                  ; [$86a1] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $35,$ff,$ff                          ; [$86a3] undefined

SPRITE_INFO_FOREPAW_SCREEN_58:              ; [$86a6]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$86a6] SpriteEntity
    db $98                                  ; [$86a7] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $35,$ff,$ff                          ; [$86a9] undefined

SPRITE_INFO_FOREPAW_SCREEN_59:              ; [$86ac]
    db SPRITE_ENEMY_ZOZURA                  ; [$86ac] SpriteEntity
    db $54                                  ; [$86ad] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $97,$ff,$ff                          ; [$86af] undefined

SPRITE_INFO_FOREPAW_SCREEN_60:              ; [$86b2]
    db SPRITE_ENEMY_GRIMLOCK                ; [$86b2] SpriteEntity
    db $a6                                  ; [$86b3] undefined

    db SPRITE_ENEMY_ZOZURA
    db $53,$ff,$ff                          ; [$86b5] undefined

SPRITE_INFO_FOREPAW_SCREEN_61:              ; [$86b8]
    db SPRITE_ENEMY_IKEDA                   ; [$86b8] SpriteEntity
    db $4a                                  ; [$86b9] undefined

    db SPRITE_ENEMY_IKEDA
    db $a7,$ff,$ff                          ; [$86bb] undefined

SPRITE_INFO_FOREPAW_SCREEN_62:              ; [$86be]
    db SPRITE_ENEMY_SNOWMAN                 ; [$86be] SpriteEntity
    db $25                                  ; [$86bf] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $2a                                  ; [$86c1] undefined

    db SPRITE_ENEMY_IKEDA
    db $98,$ff,$ff                          ; [$86c3] undefined

SPRITE_INFO_FOREPAW_SCREEN_63:              ; [$86c6]
    db SPRITE_BOSS_RIPASHEIKU               ; [$86c6] SpriteEntity
    db $3a,$ff,$ff                          ; [$86c7] undefined

SPRITE_INFO_FOREPAW_SCREEN_64:              ; [$86ca]
    db SPRITE_BOSS_ZORUGERIRU               ; [$86ca] SpriteEntity
    db $4c,$ff,$ff                          ; [$86cb] undefined

SPRITE_INFO_FOREPAW_SCREEN_65:              ; [$86ce]
    db SPRITE_BOSS_ZORADOHNA                ; [$86ce] SpriteEntity
    db $67                                  ; [$86cf] undefined

    db SPRITE_OBJ_ELIXIR
    db $a1,$ff,$ff                          ; [$86d1] undefined

SPRITE_INFO_FOREPAW_SCREEN_66:              ; [$86d4]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$86d4] SpriteEntity
    db $4a                                  ; [$86d5] undefined

    db SPRITE_ENEMY_HORNET
    db $9a                                  ; [$86d7] undefined

    db SPRITE_ENEMY_HORNET
    db $86                                  ; [$86d9] undefined

    db SPRITE_ENEMY_HORNET
    db $72,$ff,$ff                          ; [$86db] undefined

SPRITE_INFO_FOREPAW_SCREEN_67:              ; [$86de]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$86de] SpriteEntity
    db $3a                                  ; [$86df] undefined

    db SPRITE_ENEMY_HORNET
    db $6c                                  ; [$86e1] undefined

    db SPRITE_ENEMY_HORNET
    db $98                                  ; [$86e3] undefined

    db SPRITE_ENEMY_HORNET
    db $a3,$ff,$ff                          ; [$86e5] undefined

SPRITE_INFO_FOREPAW_SCREEN_68:              ; [$86e8]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$86e8] SpriteEntity
    db $4a                                  ; [$86e9] undefined

    db SPRITE_ENEMY_HORNET
    db $63                                  ; [$86eb] undefined

    db SPRITE_ENEMY_HORNET
    db $97                                  ; [$86ed] undefined

    db SPRITE_ENEMY_HORNET
    db $8b,$ff,$ff                          ; [$86ef] undefined

SPRITE_INFO_FOREPAW_SCREEN_69:              ; [$86f2]
    db SPRITE_ENEMY_MASKMAN                 ; [$86f2] SpriteEntity
    db $a6                                  ; [$86f3] undefined

    db SPRITE_ENEMY_MASKMAN
    db $3c,$ff,$ff                          ; [$86f5] undefined

SPRITE_INFO_FOREPAW_SCREEN_70:              ; [$86f8]
    db SPRITE_ENEMY_MASKMAN                 ; [$86f8] SpriteEntity
    db $35                                  ; [$86f9] undefined

    db SPRITE_ENEMY_MASKMAN
    db $3c,$ff,$ff                          ; [$86fb] undefined

SPRITE_INFO_FOREPAW_SCREEN_71:              ; [$86fe]
    db SPRITE_OBJ_OINTMENT                  ; [$86fe] SpriteEntity
    db $42                                  ; [$86ff] undefined

    db SPRITE_ENEMY_GERIBUTA
    db $35                                  ; [$8701] undefined

    db SPRITE_ENEMY_GERIBUTA
    db $ac,$ff,$ff                          ; [$8703] undefined

SPRITE_INFO_FOREPAW_SCREEN_72:              ; [$8706]
    db SPRITE_BOSS_RIPASHEIKU               ; [$8706] SpriteEntity
    db $3a,$ff,$ff                          ; [$8707] undefined

SPRITE_INFO_FOREPAW_SCREEN_73:              ; [$870a]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$870a] SpriteEntity
    db $9c                                  ; [$870b] undefined

    db SPRITE_ENEMY_RAIDEN
    db $a8,$ff,$ff                          ; [$870d] undefined

SPRITE_INFO_FOREPAW_SCREEN_74:              ; [$8710]
    db SPRITE_ENEMY_GERIBUTA                ; [$8710] SpriteEntity
    db $39                                  ; [$8711] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $ac,$ff,$ff                          ; [$8713] undefined

SPRITE_INFO_FOREPAW_SCREEN_75:              ; [$8716]
    db SPRITE_ENEMY_GERIBUTA                ; [$8716] SpriteEntity
    db $35                                  ; [$8717] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $ab,$ff,$ff                          ; [$8719] undefined

SPRITE_INFO_FOREPAW_SCREEN_76:              ; [$871c]
    db SPRITE_OBJ_BLACK_ONYX                ; [$871c] SpriteEntity
    db $a4                                  ; [$871d] undefined

    db SPRITE_BOSS_ZORADOHNA
    db $49,$ff,$ff                          ; [$871f] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; CurrentScreen_SpecialEventID

SPRITE_INFO_FOREPAW_SCREEN_77:              ; [$8724]
    db SPRITE_OBJ_RED_POTION_2              ; [$8724] SpriteEntity
    db $31                                  ; [$8725] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $9a,$ff,$ff                          ; [$8727] undefined

SPRITE_INFO_FOREPAW_SCREEN_78:              ; [$872a]
    db SPRITE_ENEMY_SUGATA                  ; [$872a] SpriteEntity
    db $a8                                  ; [$872b] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $a3,$ff,$ff                          ; [$872d] undefined

SPRITE_INFO_FOREPAW_SCREEN_79:              ; [$8730]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8730] SpriteEntity
    db $a6                                  ; [$8731] undefined

    db SPRITE_ENEMY_SUGATA
    db $38,$ff,$ff                          ; [$8733] undefined

SPRITE_INFO_FOREPAW_SCREEN_80:              ; [$8736]
    db SPRITE_OBJ_RED_POTION                ; [$8736] SpriteEntity
    db $31                                  ; [$8737] undefined

    db SPRITE_ENEMY_FIRE_GIANT
    db $3b                                  ; [$8739] undefined

    db SPRITE_ENEMY_ISHIISU
    db $aa,$ff,$ff                          ; [$873b] undefined

SPRITE_INFO_FOREPAW_SCREEN_81:              ; [$873e]
    db SPRITE_ENEMY_FIRE_GIANT              ; [$873e] SpriteEntity
    db $36                                  ; [$873f] undefined

    db SPRITE_ENEMY_ISHIISU
    db $ab,$ff,$ff                          ; [$8741] undefined

SPRITE_INFO_FOREPAW_SCREEN_82:              ; [$8744]
    db SPRITE_ENEMY_FIRE_GIANT              ; [$8744] SpriteEntity
    db $37                                  ; [$8745] undefined

    db SPRITE_ENEMY_ISHIISU
    db $ac,$ff,$ff                          ; [$8747] undefined


;============================================================================
; Conflate Sprite Information
;============================================================================
SPRITE_INFO_CONFLATE:                       ; [$874a]
    dw SPRITE_INFO_CONFLATE_SCREEN_00       ; SPRITE_INFO_CONFLATE_SCREEN_00
                                            ; [$PRG11::874a]
    dw SPRITE_INFO_CONFLATE_SCREEN_01       ; SPRITE_INFO_CONFLATE_SCREEN_01
                                            ; [$PRG11::874c]
    dw SPRITE_INFO_CONFLATE_SCREEN_02       ; SPRITE_INFO_CONFLATE_SCREEN_02
                                            ; [$PRG11::874e]
    dw SPRITE_INFO_CONFLATE_SCREEN_03       ; SPRITE_INFO_CONFLATE_SCREEN_03
                                            ; [$PRG11::8750]
    dw SPRITE_INFO_CONFLATE_SCREEN_04       ; SPRITE_INFO_CONFLATE_SCREEN_04
                                            ; [$PRG11::8752]
    dw SPRITE_INFO_CONFLATE_SCREEN_05       ; SPRITE_INFO_CONFLATE_SCREEN_05
                                            ; [$PRG11::8754]
    dw SPRITE_INFO_CONFLATE_SCREEN_06       ; SPRITE_INFO_CONFLATE_SCREEN_06
                                            ; [$PRG11::8756]
    dw SPRITE_INFO_CONFLATE_SCREEN_07       ; SPRITE_INFO_CONFLATE_SCREEN_07
                                            ; [$PRG11::8758]
    dw SPRITE_INFO_CONFLATE_SCREEN_08       ; SPRITE_INFO_CONFLATE_SCREEN_08
                                            ; [$PRG11::875a]
    dw SPRITE_INFO_CONFLATE_SCREEN_09       ; SPRITE_INFO_CONFLATE_SCREEN_09
                                            ; [$PRG11::875c]
    dw SPRITE_INFO_CONFLATE_SCREEN_10       ; SPRITE_INFO_CONFLATE_SCREEN_10
                                            ; [$PRG11::875e]
    dw SPRITE_INFO_CONFLATE_SCREEN_11       ; SPRITE_INFO_CONFLATE_SCREEN_11
                                            ; [$PRG11::8760]
    dw SPRITE_INFO_CONFLATE_SCREEN_12       ; SPRITE_INFO_CONFLATE_SCREEN_12
                                            ; [$PRG11::8762]
    dw SPRITE_INFO_CONFLATE_SCREEN_13       ; SPRITE_INFO_CONFLATE_SCREEN_13
                                            ; [$PRG11::8764]
    dw SPRITE_INFO_CONFLATE_SCREEN_14       ; SPRITE_INFO_CONFLATE_SCREEN_14
                                            ; [$PRG11::8766]
    dw SPRITE_INFO_CONFLATE_SCREEN_15       ; SPRITE_INFO_CONFLATE_SCREEN_15
                                            ; [$PRG11::8768]
    dw SPRITE_INFO_CONFLATE_SCREEN_16       ; SPRITE_INFO_CONFLATE_SCREEN_16
                                            ; [$PRG11::876a]
    dw SPRITE_INFO_CONFLATE_SCREEN_17       ; SPRITE_INFO_CONFLATE_SCREEN_17
                                            ; [$PRG11::876c]
    dw SPRITE_INFO_CONFLATE_SCREEN_18       ; SPRITE_INFO_CONFLATE_SCREEN_18
                                            ; [$PRG11::876e]
    dw SPRITE_INFO_CONFLATE_SCREEN_19       ; SPRITE_INFO_CONFLATE_SCREEN_19
                                            ; [$PRG11::8770]
    dw SPRITE_INFO_CONFLATE_SCREEN_20       ; SPRITE_INFO_CONFLATE_SCREEN_20
                                            ; [$PRG11::8772]
    dw SPRITE_INFO_CONFLATE_SCREEN_21       ; SPRITE_INFO_CONFLATE_SCREEN_21
                                            ; [$PRG11::8774]
    dw SPRITE_INFO_CONFLATE_SCREEN_22       ; SPRITE_INFO_CONFLATE_SCREEN_22
                                            ; [$PRG11::8776]
    dw SPRITE_INFO_CONFLATE_SCREEN_23       ; SPRITE_INFO_CONFLATE_SCREEN_23
                                            ; [$PRG11::8778]
    dw SPRITE_INFO_CONFLATE_SCREEN_24       ; SPRITE_INFO_CONFLATE_SCREEN_24
                                            ; [$PRG11::877a]
    dw SPRITE_INFO_CONFLATE_SCREEN_25       ; SPRITE_INFO_CONFLATE_SCREEN_25
                                            ; [$PRG11::877c]
    dw SPRITE_INFO_CONFLATE_SCREEN_26       ; SPRITE_INFO_CONFLATE_SCREEN_26
                                            ; [$PRG11::877e]
    dw SPRITE_INFO_CONFLATE_SCREEN_27       ; SPRITE_INFO_CONFLATE_SCREEN_27
                                            ; [$PRG11::8780]
    dw SPRITE_INFO_CONFLATE_SCREEN_28       ; SPRITE_INFO_CONFLATE_SCREEN_28
                                            ; [$PRG11::8782]
    dw SPRITE_INFO_CONFLATE_SCREEN_29       ; SPRITE_INFO_CONFLATE_SCREEN_29
                                            ; [$PRG11::8784]
    dw SPRITE_INFO_CONFLATE_SCREEN_30       ; SPRITE_INFO_CONFLATE_SCREEN_30
                                            ; [$PRG11::8786]
    dw SPRITE_INFO_CONFLATE_SCREEN_31       ; SPRITE_INFO_CONFLATE_SCREEN_31
                                            ; [$PRG11::8788]
    dw SPRITE_INFO_CONFLATE_SCREEN_32       ; SPRITE_INFO_CONFLATE_SCREEN_32
                                            ; [$PRG11::878a]
    dw SPRITE_INFO_CONFLATE_SCREEN_33       ; SPRITE_INFO_CONFLATE_SCREEN_33
                                            ; [$PRG11::878c]
    dw SPRITE_INFO_CONFLATE_SCREEN_34       ; SPRITE_INFO_CONFLATE_SCREEN_34
                                            ; [$PRG11::878e]
    dw SPRITE_INFO_CONFLATE_SCREEN_35       ; SPRITE_INFO_CONFLATE_SCREEN_35
                                            ; [$PRG11::8790]
    dw SPRITE_INFO_CONFLATE_SCREEN_36       ; SPRITE_INFO_CONFLATE_SCREEN_36
                                            ; [$PRG11::8792]
    dw SPRITE_INFO_CONFLATE_SCREEN_37       ; SPRITE_INFO_CONFLATE_SCREEN_37
                                            ; [$PRG11::8794]
    dw SPRITE_INFO_CONFLATE_SCREEN_38       ; SPRITE_INFO_CONFLATE_SCREEN_38
                                            ; [$PRG11::8796]
    dw SPRITE_INFO_CONFLATE_SCREEN_39       ; SPRITE_INFO_CONFLATE_SCREEN_39
                                            ; [$PRG11::8798]

;
; XREFS:
;     SPRITE_INFO_CONFLATE [$PRG11::874a]
;
SPRITE_INFO_CONFLATE_SCREEN_00:             ; [$879a]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$879a] SpriteEntity
    db $aa                                  ; [$879b] undefined

    db SPRITE_ENEMY_YUINARU
    db $55,$ff,$ff                          ; [$879d] undefined

SPRITE_INFO_CONFLATE_SCREEN_01:             ; [$87a0]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$87a0] SpriteEntity
    db $8d                                  ; [$87a1] undefined

    db SPRITE_ENEMY_YUINARU
    db $65,$ff,$ff                          ; [$87a3] undefined

SPRITE_INFO_CONFLATE_SCREEN_02:             ; [$87a6]
    db SPRITE_ENEMY_MASKMAN                 ; [$87a6] SpriteEntity
    db $76                                  ; [$87a7] undefined

    db SPRITE_ENEMY_MASKMAN
    db $8b,$ff,$ff                          ; [$87a9] undefined

SPRITE_INFO_CONFLATE_SCREEN_03:             ; [$87ac]
    db SPRITE_ENEMY_TAMAZUTSU               ; [$87ac] SpriteEntity
    db $58,$ff,$ff                          ; [$87ad] undefined

SPRITE_INFO_CONFLATE_SCREEN_04:             ; [$87b0]
    db SPRITE_OBJ_OINTMENT                  ; [$87b0] SpriteEntity
    db $4d                                  ; [$87b1] undefined

    db SPRITE_ENEMY_MASKMAN
    db $5a,$ff,$ff                          ; [$87b3] undefined

SPRITE_INFO_CONFLATE_SCREEN_05:             ; [$87b6]
    db SPRITE_ENEMY_NECRON_AIDES            ; [$87b6] SpriteEntity
    db $37                                  ; [$87b7] undefined

    db SPRITE_ENEMY_YUINARU
    db $33                                  ; [$87b9] undefined

    db SPRITE_ENEMY_YUINARU
    db $1d,$ff,$ff                          ; [$87bb] undefined

SPRITE_INFO_CONFLATE_SCREEN_06:             ; [$87be]
    db SPRITE_ENEMY_LAMPREY                 ; [$87be] SpriteEntity
    db $44,$ff,$ff                          ; [$87bf] undefined

SPRITE_INFO_CONFLATE_SCREEN_07:             ; [$87c2]
    db SPRITE_OBJ_BATTLE_HELMET             ; [$87c2] SpriteEntity
    db $a4                                  ; [$87c3] undefined

    db SPRITE_BOSS_ZORADOHNA
    db $49,$ff,$ff                          ; [$87c5] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; [$87c9] ScreenEventID

SPRITE_INFO_CONFLATE_SCREEN_08:             ; [$87ca]
    db SPRITE_OBJ_GLOVE                     ; [$87ca] SpriteEntity
    db $4e                                  ; [$87cb] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $36                                  ; [$87cd] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $3b,$ff,$ff                          ; [$87cf] undefined

SPRITE_INFO_CONFLATE_SCREEN_09:             ; [$87d2]
    db SPRITE_ENEMY_LAMPREY                 ; [$87d2] SpriteEntity
    db $64                                  ; [$87d3] undefined

    db SPRITE_ENEMY_YUINARU
    db $15                                  ; [$87d5] undefined

    db SPRITE_ENEMY_YUINARU
    db $af,$ff,$ff                          ; [$87d7] undefined

SPRITE_INFO_CONFLATE_SCREEN_10:             ; [$87da]
    db SPRITE_ENEMY_CHARRON                 ; [$87da] SpriteEntity
    db $35,$ff,$ff                          ; [$87db] undefined

SPRITE_INFO_CONFLATE_SCREEN_11:             ; [$87de]
    db SPRITE_OBJ_POISON_2                  ; [$87de] SpriteEntity
    db $7d                                  ; [$87df] undefined

    db SPRITE_ENEMY_LAMPREY
    db $6d                                  ; [$87e1] undefined

    db SPRITE_ENEMY_LAMPREY
    db $72,$ff,$ff                          ; [$87e3] undefined

SPRITE_INFO_CONFLATE_SCREEN_12:             ; [$87e6]
    db SPRITE_ENEMY_YAREEKA                 ; [$87e6] SpriteEntity
    db $49,$ff,$ff                          ; [$87e7] undefined

SPRITE_INFO_CONFLATE_SCREEN_13:             ; [$87ea]
    db SPRITE_ENEMY_CHARRON                 ; [$87ea] SpriteEntity
    db $63                                  ; [$87eb] undefined

    db SPRITE_ENEMY_CHARRON
    db $79,$ff,$ff                          ; [$87ed] undefined

SPRITE_INFO_CONFLATE_SCREEN_14:             ; [$87f0]
    db SPRITE_ENEMY_LAMPREY                 ; [$87f0] SpriteEntity
    db $6d,$ff,$ff                          ; [$87f1] undefined

SPRITE_INFO_CONFLATE_SCREEN_15:             ; [$87f4]
    db SPRITE_ENEMY_GRIMLOCK                ; [$87f4] SpriteEntity
    db $69,$ff,$ff                          ; [$87f5] undefined

SPRITE_INFO_CONFLATE_SCREEN_16:             ; [$87f8]
    db SPRITE_OBJ_OINTMENT                  ; [$87f8] SpriteEntity
    db $48                                  ; [$87f9] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $98                                  ; [$87fb] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $3b,$ff,$ff                          ; [$87fd] undefined

SPRITE_INFO_CONFLATE_SCREEN_17:             ; [$8800]
    db SPRITE_ENEMY_TAMAZUTSU               ; [$8800] SpriteEntity
    db $4b                                  ; [$8801] undefined

    db SPRITE_ENEMY_YUINARU
    db $35                                  ; [$8803] undefined

    db SPRITE_ENEMY_YUINARU
    db $9b,$ff,$ff                          ; [$8805] undefined

SPRITE_INFO_CONFLATE_SCREEN_18:             ; [$8808]
    db SPRITE_ENEMY_GRIMLOCK                ; [$8808] SpriteEntity
    db $47                                  ; [$8809] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $85,$ff,$ff                          ; [$880b] undefined

SPRITE_INFO_CONFLATE_SCREEN_19:             ; [$880e]
    db SPRITE_ENEMY_MASKMAN                 ; [$880e] SpriteEntity
    db $8c,$ff,$ff                          ; [$880f] undefined

SPRITE_INFO_CONFLATE_SCREEN_20:             ; [$8812]
    db SPRITE_ENEMY_MASKMAN                 ; [$8812] SpriteEntity
    db $48                                  ; [$8813] undefined

    db SPRITE_ENEMY_HORNET
    db $3c                                  ; [$8815] undefined

    db SPRITE_ENEMY_HORNET
    db $64,$ff,$ff                          ; [$8817] undefined

SPRITE_INFO_CONFLATE_SCREEN_21:             ; [$881a]
    db SPRITE_ENEMY_GRIMLOCK                ; [$881a] SpriteEntity
    db $28                                  ; [$881b] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $5c,$ff,$ff                          ; [$881d] undefined

SPRITE_INFO_CONFLATE_SCREEN_22:             ; [$8820]
    db SPRITE_OBJ_HOUR_GLASS                ; [$8820] SpriteEntity
    db $72                                  ; [$8821] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $85,$ff,$ff                          ; [$8823] undefined

SPRITE_INFO_CONFLATE_SCREEN_23:             ; [$8826]
    db SPRITE_OBJ_POISON_2                  ; [$8826] SpriteEntity
    db $56                                  ; [$8827] undefined

    db SPRITE_ENEMY_MASKMAN
    db $a6                                  ; [$8829] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $8b,$ff,$ff                          ; [$882b] undefined

SPRITE_INFO_CONFLATE_SCREEN_24:             ; [$882e]
    db SPRITE_OBJ_MATTOCK1                  ; [$882e] SpriteEntity
    db $58                                  ; [$882f] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $97                                  ; [$8831] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $35,$ff,$ff                          ; [$8833] undefined

SPRITE_INFO_CONFLATE_SCREEN_25:             ; [$8836]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$8836] SpriteEntity
    db $29                                  ; [$8837] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $56,$ff,$ff                          ; [$8839] undefined

SPRITE_INFO_CONFLATE_SCREEN_26:             ; [$883c]
    db SPRITE_ENEMY_GRIMLOCK                ; [$883c] SpriteEntity
    db $33                                  ; [$883d] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $89,$ff,$ff                          ; [$883f] undefined

SPRITE_INFO_CONFLATE_SCREEN_27:             ; [$8842]
    db SPRITE_ENEMY_GRIMLOCK                ; [$8842] SpriteEntity
    db $55                                  ; [$8843] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $9a,$ff,$ff                          ; [$8845] undefined

SPRITE_INFO_CONFLATE_SCREEN_28:             ; [$8848]
    db SPRITE_OBJ_WING_BOOTS                ; [$8848] SpriteEntity
    db $a9                                  ; [$8849] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $57                                  ; [$884b] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $18,$ff,$ff                          ; [$884d] undefined

SPRITE_INFO_CONFLATE_SCREEN_29:             ; [$8850]
    db SPRITE_OBJ_BATTLE_SUIT               ; [$8850] SpriteEntity
    db $bd                                  ; [$8851] undefined

    db SPRITE_BOSS_ZORADOHNA
    db $59,$ff,$ff                          ; [$8853] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; CurrentScreen_SpecialEventID

SPRITE_INFO_CONFLATE_SCREEN_30:             ; [$8858]
    db SPRITE_OBJ_MAGICAL_ROD               ; [$8858] SpriteEntity
    db $b9                                  ; [$8859] undefined

    db SPRITE_OBJ_POISON_2
    db $4d                                  ; [$885b] undefined

    db SPRITE_ENEMY_ZOZURA
    db $ba                                  ; [$885d] undefined

    db SPRITE_ENEMY_ZOZURA
    db $4a,$ff,$ff                          ; [$885f] undefined

SPRITE_INFO_CONFLATE_SCREEN_31:             ; [$8862]
    db SPRITE_ENEMY_GERIBUTA                ; [$8862] SpriteEntity
    db $9a,$ff,$ff                          ; [$8863] undefined

SPRITE_INFO_CONFLATE_SCREEN_32:             ; [$8866]
    db SPRITE_ENEMY_MAGMAN                  ; [$8866] SpriteEntity
    db $8a                                  ; [$8867] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $2d                                  ; [$8869] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $66,$ff,$ff                          ; [$886b] undefined

SPRITE_INFO_CONFLATE_SCREEN_33:             ; [$886e]
    db SPRITE_OBJ_GLOVE_2                   ; [$886e] SpriteEntity
    db $32                                  ; [$886f] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $4d                                  ; [$8871] undefined

    db SPRITE_ENEMY_YUINARU
    db $49,$ff,$ff                          ; [$8873] undefined

SPRITE_INFO_CONFLATE_SCREEN_34:             ; [$8876]
    db SPRITE_OBJ_WING_BOOTS                ; [$8876] SpriteEntity
    db $92                                  ; [$8877] undefined

    db SPRITE_ENEMY_MAGMAN
    db $00                                  ; [$8879] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $3c,$ff,$ff                          ; [$887b] undefined

SPRITE_INFO_CONFLATE_SCREEN_35:             ; [$887e]
    db SPRITE_ENEMY_WOLFMAN                 ; [$887e] SpriteEntity
    db $3d                                  ; [$887f] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $99,$ff,$ff                          ; [$8881] undefined

SPRITE_INFO_CONFLATE_SCREEN_36:             ; [$8884]
    db SPRITE_ENEMY_WOLFMAN                 ; [$8884] SpriteEntity
    db $21                                  ; [$8885] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $9a                                  ; [$8887] undefined

    db SPRITE_ENEMY_HORNET
    db $49                                  ; [$8889] undefined

    db SPRITE_ENEMY_HORNET
    db $63,$ff,$ff                          ; [$888b] undefined

SPRITE_INFO_CONFLATE_SCREEN_37:             ; [$888e]
    db SPRITE_ENEMY_WOLFMAN                 ; [$888e] SpriteEntity
    db $7b                                  ; [$888f] undefined

    db SPRITE_ENEMY_HORNET
    db $4d                                  ; [$8891] undefined

    db SPRITE_ENEMY_HORNET
    db $98,$ff,$ff                          ; [$8893] undefined

SPRITE_INFO_CONFLATE_SCREEN_38:             ; [$8896]
    db SPRITE_ENEMY_CHARRON                 ; [$8896] SpriteEntity
    db $7c                                  ; [$8897] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $21,$ff,$ff                          ; [$8899] undefined

SPRITE_INFO_CONFLATE_SCREEN_39:             ; [$889c]
    db SPRITE_ENEMY_CHARRON                 ; [$889c] SpriteEntity
    db $36                                  ; [$889d] undefined

    db SPRITE_ENEMY_LAMPREY
    db $69,$ff,$ff                          ; [$889f] undefined


;============================================================================
; Daybreak Sprite Information
;============================================================================
SPRITE_INFO_DAYBREAK:                       ; [$88a2]
    dw SPRITE_INFO_DAYBREAK_SCREEN_00       ; SPRITE_INFO_DAYBREAK_SCREEN_00
                                            ; [$PRG11::88a2]
    dw SPRITE_INFO_DAYBREAK_SCREEN_01       ; SPRITE_INFO_DAYBREAK_SCREEN_01
                                            ; [$PRG11::88a4]
    dw SPRITE_INFO_DAYBREAK_SCREEN_02       ; SPRITE_INFO_DAYBREAK_SCREEN_02
                                            ; [$PRG11::88a6]
    dw SPRITE_INFO_DAYBREAK_SCREEN_03       ; SPRITE_INFO_DAYBREAK_SCREEN_03
                                            ; [$PRG11::88a8]
    dw SPRITE_INFO_DAYBREAK_SCREEN_04       ; SPRITE_INFO_DAYBREAK_SCREEN_04
                                            ; [$PRG11::88aa]
    dw SPRITE_INFO_DAYBREAK_SCREEN_05       ; SPRITE_INFO_DAYBREAK_SCREEN_05
                                            ; [$PRG11::88ac]
    dw SPRITE_INFO_DAYBREAK_SCREEN_06       ; SPRITE_INFO_DAYBREAK_SCREEN_06
                                            ; [$PRG11::88ae]
    dw SPRITE_INFO_DAYBREAK_SCREEN_07       ; SPRITE_INFO_DAYBREAK_SCREEN_07
                                            ; [$PRG11::88b0]
    dw SPRITE_INFO_DAYBREAK_SCREEN_08       ; SPRITE_INFO_DAYBREAK_SCREEN_08
                                            ; [$PRG11::88b2]
    dw SPRITE_INFO_DAYBREAK_SCREEN_09       ; SPRITE_INFO_DAYBREAK_SCREEN_09
                                            ; [$PRG11::88b4]
    dw SPRITE_INFO_DAYBREAK_SCREEN_10       ; SPRITE_INFO_DAYBREAK_SCREEN_10
                                            ; [$PRG11::88b6]
    dw SPRITE_INFO_DAYBREAK_SCREEN_11       ; SPRITE_INFO_DAYBREAK_SCREEN_11
                                            ; [$PRG11::88b8]
    dw SPRITE_INFO_DAYBREAK_SCREEN_12       ; SPRITE_INFO_DAYBREAK_SCREEN_12
                                            ; [$PRG11::88ba]
    dw SPRITE_INFO_DAYBREAK_SCREEN_13       ; SPRITE_INFO_DAYBREAK_SCREEN_13
                                            ; [$PRG11::88bc]
    dw SPRITE_INFO_DAYBREAK_SCREEN_14       ; SPRITE_INFO_DAYBREAK_SCREEN_14
                                            ; [$PRG11::88be]
    dw SPRITE_INFO_DAYBREAK_SCREEN_15       ; SPRITE_INFO_DAYBREAK_SCREEN_15
                                            ; [$PRG11::88c0]
    dw SPRITE_INFO_DAYBREAK_SCREEN_16       ; SPRITE_INFO_DAYBREAK_SCREEN_16
                                            ; [$PRG11::88c2]
    dw SPRITE_INFO_DAYBREAK_SCREEN_17       ; SPRITE_INFO_DAYBREAK_SCREEN_17
                                            ; [$PRG11::88c4]
    dw SPRITE_INFO_DAYBREAK_SCREEN_18       ; SPRITE_INFO_DAYBREAK_SCREEN_18
                                            ; [$PRG11::88c6]
    dw SPRITE_INFO_DAYBREAK_SCREEN_19       ; SPRITE_INFO_DAYBREAK_SCREEN_19
                                            ; [$PRG11::88c8]
    dw SPRITE_INFO_DAYBREAK_SCREEN_20       ; SPRITE_INFO_DAYBREAK_SCREEN_20
                                            ; [$PRG11::88ca]
    dw SPRITE_INFO_DAYBREAK_SCREEN_21       ; SPRITE_INFO_DAYBREAK_SCREEN_21
                                            ; [$PRG11::88cc]
    dw SPRITE_INFO_DAYBREAK_SCREEN_22       ; SPRITE_INFO_DAYBREAK_SCREEN_22
                                            ; [$PRG11::88ce]
    dw SPRITE_INFO_DAYBREAK_SCREEN_23       ; SPRITE_INFO_DAYBREAK_SCREEN_23
                                            ; [$PRG11::88d0]
    dw SPRITE_INFO_DAYBREAK_SCREEN_24       ; SPRITE_INFO_DAYBREAK_SCREEN_24
                                            ; [$PRG11::88d2]
    dw SPRITE_INFO_DAYBREAK_SCREEN_25       ; SPRITE_INFO_DAYBREAK_SCREEN_25
                                            ; [$PRG11::88d4]
    dw SPRITE_INFO_DAYBREAK_SCREEN_26       ; SPRITE_INFO_DAYBREAK_SCREEN_26
                                            ; [$PRG11::88d6]
    dw SPRITE_INFO_DAYBREAK_SCREEN_27       ; SPRITE_INFO_DAYBREAK_SCREEN_27
                                            ; [$PRG11::88d8]
    dw SPRITE_INFO_DAYBREAK_SCREEN_28       ; SPRITE_INFO_DAYBREAK_SCREEN_28
                                            ; [$PRG11::88da]
    dw SPRITE_INFO_DAYBREAK_SCREEN_29       ; SPRITE_INFO_DAYBREAK_SCREEN_29
                                            ; [$PRG11::88dc]
    dw SPRITE_INFO_DAYBREAK_SCREEN_30       ; SPRITE_INFO_DAYBREAK_SCREEN_30
                                            ; [$PRG11::88de]
    dw SPRITE_INFO_DAYBREAK_SCREEN_31       ; SPRITE_INFO_DAYBREAK_SCREEN_31
                                            ; [$PRG11::88e0]

;
; XREFS:
;     SPRITE_INFO_DAYBREAK [$PRG11::88a2]
;
SPRITE_INFO_DAYBREAK_SCREEN_00:             ; [$88e2]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$88e2] SpriteEntity
    db $a4                                  ; [$88e3] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $47,$ff,$ff                          ; [$88e5] undefined

SPRITE_INFO_DAYBREAK_SCREEN_01:             ; [$88e8]
    db SPRITE_ENEMY_SNOWMAN                 ; [$88e8] SpriteEntity
    db $48                                  ; [$88e9] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $a4,$ff,$ff                          ; [$88eb] undefined

SPRITE_INFO_DAYBREAK_SCREEN_02:             ; [$88ee]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$88ee] SpriteEntity
    db $49                                  ; [$88ef] undefined

    db SPRITE_ENEMY_MASKMAN
    db $a5,$ff,$ff                          ; [$88f1] undefined

SPRITE_INFO_DAYBREAK_SCREEN_03:             ; [$88f4]
    db SPRITE_ENEMY_LAMPREY                 ; [$88f4] SpriteEntity
    db $aa                                  ; [$88f5] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $a4                                  ; [$88f7] undefined

    db SPRITE_ENEMY_YUINARU
    db $58,$ff,$ff                          ; [$88f9] undefined

SPRITE_INFO_DAYBREAK_SCREEN_04:             ; [$88fc]
    db SPRITE_OBJ_HOUR_GLASS                ; [$88fc] SpriteEntity
    db $5e                                  ; [$88fd] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $9a                                  ; [$88ff] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $43,$ff,$ff                          ; [$8901] undefined

SPRITE_INFO_DAYBREAK_SCREEN_05:             ; [$8904]
    db SPRITE_ENEMY_WOLFMAN                 ; [$8904] SpriteEntity
    db $45                                  ; [$8905] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $99,$ff,$ff                          ; [$8907] undefined

SPRITE_INFO_DAYBREAK_SCREEN_06:             ; [$890a]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$890a] SpriteEntity
    db $98                                  ; [$890b] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $4c,$ff,$ff                          ; [$890d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_07:             ; [$8910]
    db SPRITE_ENEMY_HORNET                  ; [$8910] SpriteEntity
    db $48                                  ; [$8911] undefined

    db SPRITE_ENEMY_HORNET
    db $95                                  ; [$8913] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $98,$ff,$ff                          ; [$8915] undefined

SPRITE_INFO_DAYBREAK_SCREEN_08:             ; [$8918]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$8918] SpriteEntity
    db $98                                  ; [$8919] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $42                                  ; [$891b] undefined

    db SPRITE_ENEMY_HORNET
    db $78,$ff,$ff                          ; [$891d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_09:             ; [$8920]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8920] SpriteEntity
    db $16                                  ; [$8921] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $4a                                  ; [$8923] undefined

    db SPRITE_ENEMY_LAMPREY
    db $a8,$ff,$ff                          ; [$8925] undefined

SPRITE_INFO_DAYBREAK_SCREEN_10:             ; [$8928]
    db SPRITE_ENEMY_FIRE_GIANT              ; [$8928] SpriteEntity
    db $66                                  ; [$8929] undefined

    db SPRITE_ENEMY_GERIBUTA
    db $ab                                  ; [$892b] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $39,$ff,$ff                          ; [$892d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_11:             ; [$8930]
    db SPRITE_ENEMY_FIRE_GIANT              ; [$8930] SpriteEntity
    db $a8                                  ; [$8931] undefined

    db SPRITE_ENEMY_HORNET
    db $55                                  ; [$8933] undefined

    db SPRITE_ENEMY_HORNET
    db $4a,$ff,$ff                          ; [$8935] undefined

SPRITE_INFO_DAYBREAK_SCREEN_12:             ; [$8938]
    db SPRITE_ENEMY_WOLFMAN                 ; [$8938] SpriteEntity
    db $ab                                  ; [$8939] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $ae,$ff,$ff                          ; [$893b] undefined

SPRITE_INFO_DAYBREAK_SCREEN_13:             ; [$893e]
    db SPRITE_ENEMY_MASKMAN                 ; [$893e] SpriteEntity
    db $a8                                  ; [$893f] undefined

    db SPRITE_ENEMY_NECRON_AIDES
    db $61,$ff,$ff                          ; [$8941] undefined

SPRITE_INFO_DAYBREAK_SCREEN_14:             ; [$8944]
    db SPRITE_OBJ_POISON_2                  ; [$8944] SpriteEntity
    db $b1                                  ; [$8945] undefined

    db SPRITE_ENEMY_FIRE_GIANT
    db $2c                                  ; [$8947] undefined

    db SPRITE_ENEMY_MASKMAN
    db $6d,$ff,$ff                          ; [$8949] undefined

SPRITE_INFO_DAYBREAK_SCREEN_15:             ; [$894c]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$894c] SpriteEntity
    db $aa                                  ; [$894d] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $48,$ff,$ff                          ; [$894f] undefined

SPRITE_INFO_DAYBREAK_SCREEN_16:             ; [$8952]
    db SPRITE_ENEMY_HORNET                  ; [$8952] SpriteEntity
    db $33                                  ; [$8953] undefined

    db SPRITE_ENEMY_HORNET
    db $2b                                  ; [$8955] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $8b,$ff,$ff                          ; [$8957] undefined

SPRITE_INFO_DAYBREAK_SCREEN_17:             ; [$895a]
    db SPRITE_ENEMY_HORNET                  ; [$895a] SpriteEntity
    db $4b                                  ; [$895b] undefined

    db SPRITE_ENEMY_HORNET
    db $73                                  ; [$895d] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $26                                  ; [$895f] undefined

    db SPRITE_ENEMY_ZOZURA
    db $aa,$ff,$ff                          ; [$8961] undefined

SPRITE_INFO_DAYBREAK_SCREEN_18:             ; [$8964]
    db SPRITE_BOSS_ZORADOHNA                ; [$8964] SpriteEntity
    db $6a                                  ; [$8965] undefined

    db SPRITE_OBJ_HOUR_GLASS
    db $32,$ff,$ff                          ; [$8967] undefined

SPRITE_INFO_DAYBREAK_SCREEN_19:             ; [$896a]
    db SPRITE_BOSS_PAKUKAME                 ; [$896a] SpriteEntity
    db $15                                  ; [$896b] undefined

    db SPRITE_OBJ_POISON_2
    db $a6                                  ; [$896d] undefined

    db SPRITE_OBJ_RED_POTION_2
    db $ae,$ff,$ff                          ; [$896f] undefined

SPRITE_INFO_DAYBREAK_SCREEN_20:             ; [$8972]
    db SPRITE_BOSS_PAKUKAME                 ; [$8972] SpriteEntity
    db $16                                  ; [$8973] undefined

    db SPRITE_OBJ_POISON_2
    db $66,$ff,$ff                          ; [$8975] undefined

SPRITE_INFO_DAYBREAK_SCREEN_21:             ; [$8978]
    db SPRITE_OBJ_DRAGON_SLAYER             ; [$8978] SpriteEntity
    db $9d                                  ; [$8979] undefined

    db SPRITE_BOSS_KING_GRIEVE
    db $49,$ff,$ff                          ; [$897b] undefined

    db SCREEN_HAS_SPECIAL_EVENT
    db SCREEN_EVENT_BOSS                    ; CurrentScreen_SpecialEventID

SPRITE_INFO_DAYBREAK_SCREEN_22:             ; [$8980]
    db SPRITE_BOSS_KING_GRIEVE              ; [$8980] SpriteEntity
    db $41,$ff,$ff                          ; [$8981] undefined

SPRITE_INFO_DAYBREAK_SCREEN_23:             ; [$8984]
    db SPRITE_ENEMY_GIANT_STRIDER           ; [$8984] SpriteEntity
    db $4c                                  ; [$8985] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $93,$ff,$ff                          ; [$8987] undefined

SPRITE_INFO_DAYBREAK_SCREEN_24:             ; [$898a]
    db SPRITE_ENEMY_SNOWMAN                 ; [$898a] SpriteEntity
    db $a7                                  ; [$898b] undefined

    db SPRITE_ENEMY_SNOWMAN
    db $43,$ff,$ff                          ; [$898d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_25:             ; [$8990]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$8990] SpriteEntity
    db $98                                  ; [$8991] undefined

    db SPRITE_ENEMY_YAREEKA
    db $3c,$ff,$ff                          ; [$8993] undefined

SPRITE_INFO_DAYBREAK_SCREEN_26:             ; [$8996]
    db SPRITE_OBJ_OINTMENT                  ; [$8996] SpriteEntity
    db $be                                  ; [$8997] undefined

    db SPRITE_BOSS_BORABOHRA
    db $98,$ff,$ff                          ; [$8999] undefined

SPRITE_INFO_DAYBREAK_SCREEN_27:             ; [$899c]
    db SPRITE_ENEMY_ZOZURA                  ; [$899c] SpriteEntity
    db $56                                  ; [$899d] undefined

    db SPRITE_ENEMY_ZOZURA
    db $5b                                  ; [$899f] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $ab                                  ; [$89a1] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $a3,$ff,$ff                          ; [$89a3] undefined

SPRITE_INFO_DAYBREAK_SCREEN_28:             ; [$89a6]
    db SPRITE_ENEMY_CHARRON                 ; [$89a6] SpriteEntity
    db $4c                                  ; [$89a7] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $99,$ff,$ff                          ; [$89a9] undefined

SPRITE_INFO_DAYBREAK_SCREEN_29:             ; [$89ac]
    db SPRITE_OBJ_POISON_2                  ; [$89ac] SpriteEntity
    db $b2                                  ; [$89ad] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $4d                                  ; [$89af] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $a9,$ff,$ff                          ; [$89b1] undefined

SPRITE_INFO_DAYBREAK_SCREEN_30:             ; [$89b4]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$89b4] SpriteEntity
    db $92,$ff,$ff                          ; [$89b5] undefined

SPRITE_INFO_DAYBREAK_SCREEN_31:             ; [$89b8]
    db SPRITE_BOSS_PAKUKAME                 ; [$89b8] SpriteEntity
    db $2b,$ff,$ff                          ; [$89b9] undefined


;============================================================================
; Zenis Sprite Information
;============================================================================
SPRITE_INFO_ZENIS:                          ; [$89bc]
    dw SPRITE_INFO_ZENIS_SCREEN_00          ; SPRITE_INFO_ZENIS_SCREEN_00
                                            ; [$PRG11::89bc]
    dw SPRITE_INFO_ZENIS_SCREEN_01          ; SPRITE_INFO_ZENIS_SCREEN_01
                                            ; [$PRG11::89be]
    dw SPRITE_INFO_ZENIS_SCREEN_02          ; SPRITE_INFO_ZENIS_SCREEN_02
                                            ; [$PRG11::89c0]
    dw SPRITE_INFO_ZENIS_SCREEN_03          ; SPRITE_INFO_ZENIS_SCREEN_03
                                            ; [$PRG11::89c2]
    dw SPRITE_INFO_ZENIS_SCREEN_04          ; SPRITE_INFO_ZENIS_SCREEN_04
                                            ; [$PRG11::89c4]
    dw SPRITE_INFO_ZENIS_SCREEN_05          ; SPRITE_INFO_ZENIS_SCREEN_05
                                            ; [$PRG11::89c6]
    dw SPRITE_INFO_ZENIS_SCREEN_06          ; SPRITE_INFO_ZENIS_SCREEN_06
                                            ; [$PRG11::89c8]
    dw SPRITE_INFO_ZENIS_SCREEN_07          ; SPRITE_INFO_ZENIS_SCREEN_07
                                            ; [$PRG11::89ca]
    dw SPRITE_INFO_ZENIS_SCREEN_08          ; SPRITE_INFO_ZENIS_SCREEN_08
                                            ; [$PRG11::89cc]
    dw SPRITE_INFO_ZENIS_SCREEN_09          ; SPRITE_INFO_ZENIS_SCREEN_09
                                            ; [$PRG11::89ce]
    dw SPRITE_INFO_ZENIS_SCREEN_10          ; SPRITE_INFO_ZENIS_SCREEN_10
                                            ; [$PRG11::89d0]
    dw SPRITE_INFO_ZENIS_SCREEN_11          ; SPRITE_INFO_ZENIS_SCREEN_11
                                            ; [$PRG11::89d2]
    dw SPRITE_INFO_ZENIS_SCREEN_12          ; SPRITE_INFO_ZENIS_SCREEN_12
                                            ; [$PRG11::89d4]
    dw SPRITE_INFO_ZENIS_SCREEN_13          ; SPRITE_INFO_ZENIS_SCREEN_13
                                            ; [$PRG11::89d6]
    dw SPRITE_INFO_ZENIS_SCREEN_14          ; SPRITE_INFO_ZENIS_SCREEN_14
                                            ; [$PRG11::89d8]
    dw SPRITE_INFO_ZENIS_SCREEN_15          ; SPRITE_INFO_ZENIS_SCREEN_15
                                            ; [$PRG11::89da]
    dw SPRITE_INFO_ZENIS_SCREEN_16          ; SPRITE_INFO_ZENIS_SCREEN_16
                                            ; [$PRG11::89dc]
    dw SPRITE_INFO_ZENIS_SCREEN_17          ; SPRITE_INFO_ZENIS_SCREEN_17
                                            ; [$PRG11::89de]
    dw SPRITE_INFO_ZENIS_SCREEN_18          ; SPRITE_INFO_ZENIS_SCREEN_18
                                            ; [$PRG11::89e0]
    dw SPRITE_INFO_ZENIS_SCREEN_19          ; SPRITE_INFO_ZENIS_SCREEN_19
                                            ; [$PRG11::89e2]

;
; XREFS:
;     SPRITE_INFO_ZENIS [$PRG11::89bc]
;
SPRITE_INFO_ZENIS_SCREEN_00:                ; [$89e4]
    db SPRITE_BOSS_SHADOW_EURA              ; [$89e4] SpriteEntity
    db $73,$ff,$ff,$80,$02                  ; [$89e5] undefined

SPRITE_INFO_ZENIS_SCREEN_01:                ; [$89ea]
    db SPRITE_BOSS_ZORADOHNA                ; [$89ea] SpriteEntity
    db $34                                  ; [$89eb] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $a9,$ff,$ff                          ; [$89ed] undefined

SPRITE_INFO_ZENIS_SCREEN_02:                ; [$89f0]
    db SPRITE_ENEMY_WOLFMAN                 ; [$89f0] SpriteEntity
    db $a2                                  ; [$89f1] undefined

    db SPRITE_ENEMY_HORNET
    db $3d                                  ; [$89f3] undefined

    db SPRITE_ENEMY_HORNET
    db $68,$ff,$ff                          ; [$89f5] undefined

SPRITE_INFO_ZENIS_SCREEN_03:                ; [$89f8]
    db SPRITE_ENEMY_GERIBUTA                ; [$89f8] SpriteEntity
    db $a5                                  ; [$89f9] undefined

    db SPRITE_ENEMY_GERIBUTA
    db $aa                                  ; [$89fb] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $48,$ff,$ff                          ; [$89fd] undefined

SPRITE_INFO_ZENIS_SCREEN_04:                ; [$8a00]
    db SPRITE_BOSS_RIPASHEIKU               ; [$8a00] SpriteEntity
    db $66,$ff,$ff                          ; [$8a01] undefined

SPRITE_INFO_ZENIS_SCREEN_05:                ; [$8a04]
    db SPRITE_BOSS_ZORUGERIRU               ; [$8a04] SpriteEntity
    db $4e,$ff,$ff                          ; [$8a05] undefined

SPRITE_INFO_ZENIS_SCREEN_06:                ; [$8a08]
    db SPRITE_OBJ_OINTMENT_2                ; [$8a08] SpriteEntity
    db $b2                                  ; [$8a09] undefined

    db SPRITE_ENEMY_HORNET
    db $1b                                  ; [$8a0b] undefined

    db SPRITE_ENEMY_HORNET
    db $23                                  ; [$8a0d] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $ad                                  ; [$8a0f] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $ab,$ff,$ff                          ; [$8a11] undefined

SPRITE_INFO_ZENIS_SCREEN_07:                ; [$8a14]
    db SPRITE_BOSS_PAKUKAME                 ; [$8a14] SpriteEntity
    db $13,$ff,$ff                          ; [$8a15] undefined

SPRITE_INFO_ZENIS_SCREEN_08:                ; [$8a18]
    db $ff,$ff                              ; [$8a18] undefined

SPRITE_INFO_ZENIS_SCREEN_09:                ; [$8a1a]
    db SPRITE_OBJ_POISON_2                  ; [$8a1a] SpriteEntity
    db $be                                  ; [$8a1b] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $46                                  ; [$8a1d] undefined

    db SPRITE_ENEMY_HORNET
    db $a6                                  ; [$8a1f] undefined

    db SPRITE_ENEMY_HORNET
    db $8a,$ff,$ff                          ; [$8a21] undefined

SPRITE_INFO_ZENIS_SCREEN_10:                ; [$8a24]
    db SPRITE_OBJ_GLOVE_2                   ; [$8a24] SpriteEntity
    db $6d                                  ; [$8a25] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $37                                  ; [$8a27] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $a9                                  ; [$8a29] undefined

    db SPRITE_ENEMY_HORNET
    db $a7                                  ; [$8a2b] undefined

    db SPRITE_ENEMY_HORNET
    db $24,$ff,$ff                          ; [$8a2d] undefined

SPRITE_INFO_ZENIS_SCREEN_11:                ; [$8a30]
    db SPRITE_BOSS_PAKUKAME                 ; [$8a30] SpriteEntity
    db $12,$ff,$ff                          ; [$8a31] undefined

SPRITE_INFO_ZENIS_SCREEN_12:                ; [$8a34]
    db SPRITE_BOSS_ZORUGERIRU               ; [$8a34] SpriteEntity
    db $2c,$ff,$ff                          ; [$8a35] undefined

SPRITE_INFO_ZENIS_SCREEN_13:                ; [$8a38]
    db SPRITE_OBJ_POISON_2                  ; [$8a38] SpriteEntity
    db $3e                                  ; [$8a39] undefined

    db SPRITE_ENEMY_IKEDA
    db $ad                                  ; [$8a3b] undefined

    db SPRITE_ENEMY_HORNET
    db $85                                  ; [$8a3d] undefined

    db SPRITE_ENEMY_HORNET
    db $48,$ff,$ff                          ; [$8a3f] undefined

SPRITE_INFO_ZENIS_SCREEN_14:                ; [$8a42]
    db SPRITE_OBJ_POISON_2                  ; [$8a42] SpriteEntity
    db $a1                                  ; [$8a43] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $29                                  ; [$8a45] undefined

    db SPRITE_BOSS_ROKUSUTAHN
    db $97,$ff,$ff                          ; [$8a47] undefined

SPRITE_INFO_ZENIS_SCREEN_15:                ; [$8a4a]
    db SPRITE_ENEMY_MASKMAN                 ; [$8a4a] SpriteEntity
    db $46                                  ; [$8a4b] undefined

    db SPRITE_ENEMY_MASKMAN
    db $99                                  ; [$8a4d] undefined

    db SPRITE_ENEMY_TAMAZUTSU
    db $93,$ff,$ff                          ; [$8a4f] undefined

SPRITE_INFO_ZENIS_SCREEN_16:                ; [$8a52]
    db SPRITE_ENEMY_EXECUTION_HOOD          ; [$8a52] SpriteEntity
    db $4c                                  ; [$8a53] undefined

    db SPRITE_ENEMY_ZOZURA
    db $aa                                  ; [$8a55] undefined

    db SPRITE_ENEMY_ZOZURA
    db $a6                                  ; [$8a57] undefined

    db SPRITE_ENEMY_ZOZURA
    db $a8,$ff,$ff                          ; [$8a59] undefined

SPRITE_INFO_ZENIS_SCREEN_17:                ; [$8a5c]
    db SPRITE_OBJ_GLOVE                     ; [$8a5c] SpriteEntity
    db $ac                                  ; [$8a5d] undefined

    db SPRITE_ENEMY_ZOZURA
    db $66                                  ; [$8a5f] undefined

    db SPRITE_ENEMY_ZOZURA
    db $63                                  ; [$8a61] undefined

    db SPRITE_BOSS_BORABOHRA
    db $93,$ff,$ff                          ; [$8a63] undefined

SPRITE_INFO_ZENIS_SCREEN_18:                ; [$8a66]
    db SPRITE_BOSS_ROKUSUTAHN               ; [$8a66] SpriteEntity
    db $48                                  ; [$8a67] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $a5                                  ; [$8a69] undefined

    db SPRITE_ENEMY_SIR_GAWAINE
    db $ab,$ff,$ff                          ; [$8a6b] undefined

SPRITE_INFO_ZENIS_SCREEN_19:                ; [$8a6e]
    db SPRITE_ENEMY_MYCONID                 ; [$8a6e] SpriteEntity
    db $58                                  ; [$8a6f] undefined

    db SPRITE_ENEMY_CHARRON
    db $ac                                  ; [$8a71] undefined

    db SPRITE_ENEMY_GERIBUTA
    db $a3,$ff,$ff                          ; [$8a73] undefined


;============================================================================
; Victim and Indoor Area Sprite Information
;============================================================================
SPRITE_INFO_VICTIM:                         ; [$8a76]
    dw SPRITE_INFO_VICTIM_SCREEN_00         ; SPRITE_INFO_VICTIM_SCREEN_00
                                            ; [$PRG11::8a76]
    dw SPRITE_INFO_VICTIM_SCREEN_01         ; SPRITE_INFO_VICTIM_SCREEN_01
                                            ; [$PRG11::8a78]
    dw SPRITE_INFO_VICTIM_SCREEN_02         ; SPRITE_INFO_VICTIM_SCREEN_02
                                            ; [$PRG11::8a7a]
    dw SPRITE_INFO_VICTIM_SCREEN_03         ; SPRITE_INFO_VICTIM_SCREEN_03
                                            ; [$PRG11::8a7c]
    dw SPRITE_INFO_VICTIM_SCREEN_04         ; SPRITE_INFO_VICTIM_SCREEN_04
                                            ; [$PRG11::8a7e]
    dw SPRITE_INFO_VICTIM_SCREEN_05         ; SPRITE_INFO_VICTIM_SCREEN_05
                                            ; [$PRG11::8a80]
    dw SPRITE_INFO_VICTIM_SCREEN_06         ; SPRITE_INFO_VICTIM_SCREEN_06
                                            ; [$PRG11::8a82]
    dw SPRITE_INFO_VICTIM_SCREEN_07         ; SPRITE_INFO_VICTIM_SCREEN_07
                                            ; [$PRG11::8a84]
    dw SPRITE_INFO_VICTIM_SCREEN_08         ; SPRITE_INFO_VICTIM_SCREEN_08
                                            ; [$PRG11::8a86]
    dw SPRITE_INFO_VICTIM_SCREEN_09         ; SPRITE_INFO_VICTIM_SCREEN_09
                                            ; [$PRG11::8a88]
    dw SPRITE_INFO_VICTIM_SCREEN_10         ; SPRITE_INFO_VICTIM_SCREEN_10
                                            ; [$PRG11::8a8a]
    dw SPRITE_INFO_VICTIM_SCREEN_11         ; SPRITE_INFO_VICTIM_SCREEN_11
                                            ; [$PRG11::8a8c]
    dw SPRITE_INFO_VICTIM_SCREEN_12         ; SPRITE_INFO_VICTIM_SCREEN_12
                                            ; [$PRG11::8a8e]
    dw SPRITE_INFO_VICTIM_SCREEN_13         ; SPRITE_INFO_VICTIM_SCREEN_13
                                            ; [$PRG11::8a90]
    dw SPRITE_INFO_VICTIM_SCREEN_14         ; SPRITE_INFO_VICTIM_SCREEN_14
                                            ; [$PRG11::8a92]
    dw SPRITE_INFO_VICTIM_SCREEN_15         ; SPRITE_INFO_VICTIM_SCREEN_15
                                            ; [$PRG11::8a94]
    dw SPRITE_INFO_VICTIM_SCREEN_16         ; SPRITE_INFO_VICTIM_SCREEN_16
                                            ; [$PRG11::8a96]
    dw SPRITE_INFO_VICTIM_SCREEN_17         ; SPRITE_INFO_VICTIM_SCREEN_17
                                            ; [$PRG11::8a98]
    dw SPRITE_INFO_VICTIM_SCREEN_18         ; SPRITE_INFO_VICTIM_SCREEN_18
                                            ; [$PRG11::8a9a]
    dw SPRITE_INFO_VICTIM_SCREEN_19         ; SPRITE_INFO_VICTIM_SCREEN_19
                                            ; [$PRG11::8a9c]
    dw SPRITE_INFO_VICTIM_SCREEN_20         ; SPRITE_INFO_VICTIM_SCREEN_20
                                            ; [$PRG11::8a9e]
    dw SPRITE_INFO_VICTIM_SCREEN_21         ; SPRITE_INFO_VICTIM_SCREEN_21
                                            ; [$PRG11::8aa0]
    dw SPRITE_INFO_VICTIM_SCREEN_22         ; SPRITE_INFO_VICTIM_SCREEN_22
                                            ; [$PRG11::8aa2]
    dw SPRITE_INFO_VICTIM_SCREEN_23         ; SPRITE_INFO_VICTIM_SCREEN_23
                                            ; [$PRG11::8aa4]
    dw SPRITE_INFO_VICTIM_SCREEN_24         ; SPRITE_INFO_VICTIM_SCREEN_24
                                            ; [$PRG11::8aa6]
    dw SPRITE_INFO_VICTIM_SCREEN_25         ; SPRITE_INFO_VICTIM_SCREEN_25
                                            ; [$PRG11::8aa8]
    dw SPRITE_INFO_VICTIM_SCREEN_26         ; SPRITE_INFO_VICTIM_SCREEN_26
                                            ; [$PRG11::8aaa]
    dw SPRITE_INFO_VICTIM_SCREEN_27         ; SPRITE_INFO_VICTIM_SCREEN_27
                                            ; [$PRG11::8aac]
    dw SPRITE_INFO_VICTIM_SCREEN_28         ; SPRITE_INFO_VICTIM_SCREEN_28
                                            ; [$PRG11::8aae]
    dw SPRITE_INFO_VICTIM_SCREEN_29         ; SPRITE_INFO_VICTIM_SCREEN_29
                                            ; [$PRG11::8ab0]
    dw SPRITE_INFO_VICTIM_SCREEN_30         ; SPRITE_INFO_VICTIM_SCREEN_30
                                            ; [$PRG11::8ab2]
    dw SPRITE_INFO_VICTIM_SCREEN_31         ; SPRITE_INFO_VICTIM_SCREEN_31
                                            ; [$PRG11::8ab4]
    dw SPRITE_INFO_VICTIM_SCREEN_32         ; SPRITE_INFO_VICTIM_SCREEN_32
                                            ; [$PRG11::8ab6]
    dw SPRITE_INFO_VICTIM_SCREEN_33         ; SPRITE_INFO_VICTIM_SCREEN_33
                                            ; [$PRG11::8ab8]
    dw SPRITE_INFO_VICTIM_SCREEN_34         ; SPRITE_INFO_VICTIM_SCREEN_34
                                            ; [$PRG11::8aba]
    dw SPRITE_INFO_VICTIM_SCREEN_35         ; SPRITE_INFO_VICTIM_SCREEN_35
                                            ; [$PRG11::8abc]
    dw SPRITE_INFO_VICTIM_SCREEN_36         ; SPRITE_INFO_VICTIM_SCREEN_36
                                            ; [$PRG11::8abe]
    dw SPRITE_INFO_VICTIM_SCREEN_37         ; SPRITE_INFO_VICTIM_SCREEN_37
                                            ; [$PRG11::8ac0]
    dw SPRITE_INFO_VICTIM_SCREEN_38         ; SPRITE_INFO_VICTIM_SCREEN_38
                                            ; [$PRG11::8ac2]
    dw SPRITE_INFO_VICTIM_SCREEN_39         ; SPRITE_INFO_VICTIM_SCREEN_39
                                            ; [$PRG11::8ac4]
    dw SPRITE_INFO_VICTIM_SCREEN_40         ; SPRITE_INFO_VICTIM_SCREEN_40
                                            ; [$PRG11::8ac6]
    dw SPRITE_INFO_VICTIM_SCREEN_41         ; SPRITE_INFO_VICTIM_SCREEN_41
                                            ; [$PRG11::8ac8]
    dw SPRITE_INFO_VICTIM_SCREEN_42         ; SPRITE_INFO_VICTIM_SCREEN_42
                                            ; [$PRG11::8aca]
    dw SPRITE_INFO_VICTIM_SCREEN_43         ; SPRITE_INFO_VICTIM_SCREEN_43
                                            ; [$PRG11::8acc]
    dw SPRITE_INFO_VICTIM_SCREEN_44         ; SPRITE_INFO_VICTIM_SCREEN_44
                                            ; [$PRG11::8ace]
    dw SPRITE_INFO_VICTIM_SCREEN_45         ; SPRITE_INFO_VICTIM_SCREEN_45
                                            ; [$PRG11::8ad0]
    dw SPRITE_INFO_VICTIM_SCREEN_46         ; SPRITE_INFO_VICTIM_SCREEN_46
                                            ; [$PRG11::8ad2]
    dw SPRITE_INFO_VICTIM_SCREEN_47         ; SPRITE_INFO_VICTIM_SCREEN_47
                                            ; [$PRG11::8ad4]
    dw SPRITE_INFO_VICTIM_SCREEN_48         ; SPRITE_INFO_VICTIM_SCREEN_48
                                            ; [$PRG11::8ad6]
    dw SPRITE_INFO_VICTIM_SCREEN_49         ; SPRITE_INFO_VICTIM_SCREEN_49
                                            ; [$PRG11::8ad8]
    dw SPRITE_INFO_VICTIM_SCREEN_50         ; SPRITE_INFO_VICTIM_SCREEN_50
                                            ; [$PRG11::8ada]
    dw SPRITE_INFO_VICTIM_SCREEN_51         ; SPRITE_INFO_VICTIM_SCREEN_51
                                            ; [$PRG11::8adc]
    dw SPRITE_INFO_VICTIM_SCREEN_52         ; SPRITE_INFO_VICTIM_SCREEN_52
                                            ; [$PRG11::8ade]
    dw SPRITE_INFO_VICTIM_SCREEN_53         ; SPRITE_INFO_VICTIM_SCREEN_53
                                            ; [$PRG11::8ae0]
    dw SPRITE_INFO_VICTIM_SCREEN_54         ; SPRITE_INFO_VICTIM_SCREEN_54
                                            ; [$PRG11::8ae2]
    dw SPRITE_INFO_VICTIM_SCREEN_55         ; SPRITE_INFO_VICTIM_SCREEN_55
                                            ; [$PRG11::8ae4]
    dw SPRITE_INFO_VICTIM_SCREEN_56         ; SPRITE_INFO_VICTIM_SCREEN_56
                                            ; [$PRG11::8ae6]
    dw SPRITE_INFO_VICTIM_SCREEN_57         ; SPRITE_INFO_VICTIM_SCREEN_57
                                            ; [$PRG11::8ae8]
    dw SPRITE_INFO_VICTIM_SCREEN_58         ; SPRITE_INFO_VICTIM_SCREEN_58
                                            ; [$PRG11::8aea]
    dw SPRITE_INFO_VICTIM_SCREEN_59         ; SPRITE_INFO_VICTIM_SCREEN_59
                                            ; [$PRG11::8aec]
    dw SPRITE_INFO_VICTIM_SCREEN_60         ; SPRITE_INFO_VICTIM_SCREEN_60
                                            ; [$PRG11::8aee]
    dw SPRITE_INFO_VICTIM_SCREEN_61         ; SPRITE_INFO_VICTIM_SCREEN_61
                                            ; [$PRG11::8af0]
    dw SPRITE_INFO_VICTIM_SCREEN_62         ; SPRITE_INFO_VICTIM_SCREEN_62
                                            ; [$PRG11::8af2]
    dw SPRITE_INFO_VICTIM_SCREEN_63         ; SPRITE_INFO_VICTIM_SCREEN_63
                                            ; [$PRG11::8af4]
    dw SPRITE_INFO_VICTIM_SCREEN_64         ; SPRITE_INFO_VICTIM_SCREEN_64
                                            ; [$PRG11::8af6]
    dw SPRITE_INFO_VICTIM_SCREEN_65         ; SPRITE_INFO_VICTIM_SCREEN_65
                                            ; [$PRG11::8af8]
    dw SPRITE_INFO_VICTIM_SCREEN_66         ; SPRITE_INFO_VICTIM_SCREEN_66
                                            ; [$PRG11::8afa]
    dw SPRITE_INFO_VICTIM_SCREEN_67         ; SPRITE_INFO_VICTIM_SCREEN_67
                                            ; [$PRG11::8afc]
    dw SPRITE_INFO_VICTIM_SCREEN_68         ; SPRITE_INFO_VICTIM_SCREEN_68
                                            ; [$PRG11::8afe]
    dw SPRITE_INFO_VICTIM_SCREEN_69         ; SPRITE_INFO_VICTIM_SCREEN_69
                                            ; [$PRG11::8b00]

;
; XREFS:
;     SPRITE_INFO_VICTIM [$PRG11::8a76]
;
SPRITE_INFO_VICTIM_SCREEN_00:               ; [$8b02]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8b02] SpriteEntity
    db $84,$ff                              ; [$8b03] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_MEAT_SHOP
    db $ff                                  ; [$8b06] undefined

SPRITE_INFO_VICTIM_SCREEN_01:               ; [$8b07]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8b07] SpriteEntity
    db $84                                  ; [$8b08] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8b0a] undefined

    db ISCRIPT_ENTRYPOINT_9
    db ISCRIPT_ENTRYPOINT_10                ; [$8b0d] IScriptEntrypoint
    db $ff                                  ; [$8b0e] undefined

SPRITE_INFO_VICTIM_SCREEN_02:               ; [$8b0f]
    db SPRITE_NPC_PRIEST                    ; [$8b0f] SpriteEntity
    db $82,$ff                              ; [$8b10] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_GURU
    db $ff                                  ; [$8b13] undefined

SPRITE_INFO_VICTIM_SCREEN_03:               ; [$8b14]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8b14] SpriteEntity
    db $84,$ff                              ; [$8b15] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_KEY_SHOP
    db $ff                                  ; [$8b18] undefined

SPRITE_INFO_VICTIM_SCREEN_04:               ; [$8b19]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8b19] SpriteEntity
    db $73,$ff                              ; [$8b1a] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_TOOL_SHOP
    db $ff                                  ; [$8b1d] undefined

SPRITE_INFO_VICTIM_SCREEN_05:               ; [$8b1e]
    db SPRITE_NPC_MAGIC_TEACHER             ; [$8b1e] SpriteEntity
    db $71,$ff                              ; [$8b1f] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS_MAGIC_SHOP
    db $ff                                  ; [$8b22] undefined

SPRITE_INFO_VICTIM_SCREEN_06:               ; [$8b23]
    db SPRITE_NPC_MARTIAL_ARTS              ; [$8b23] SpriteEntity
    db $87,$ff                              ; [$8b24] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS
    db $ff                                  ; [$8b27] undefined

SPRITE_INFO_VICTIM_SCREEN_07:               ; [$8b28]
    db SPRITE_NPC_KING                      ; [$8b28] SpriteEntity
    db $72,$ff                              ; [$8b29] undefined

    db ISCRIPT_ENTRYPOINT_EOLIS_KING
    db $ff                                  ; [$8b2c] undefined

SPRITE_INFO_VICTIM_SCREEN_08:               ; [$8b2d]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8b2d] SpriteEntity
    db $73,$ff                              ; [$8b2e] undefined

    db ISCRIPT_ENTRYPOINT_APOLUNE_TOOL_SHOP
    db $ff                                  ; [$8b31] undefined

SPRITE_INFO_VICTIM_SCREEN_09:               ; [$8b32]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8b32] SpriteEntity
    db $84,$ff                              ; [$8b33] undefined

    db ISCRIPT_ENTRYPOINT_APOLUNE_KEY_SHOP
    db $ff                                  ; [$8b36] undefined

SPRITE_INFO_VICTIM_SCREEN_10:               ; [$8b37]
    db SPRITE_NPC_SMOKING_MAN               ; [$8b37] SpriteEntity
    db $81                                  ; [$8b38] undefined

    db SPRITE_NPC_DOCTOR
    db $87,$ff                              ; [$8b3a] undefined

    db ISCRIPT_ENTRYPOINT_18
    db ISCRIPT_ENTRYPOINT_19                ; [$8b3d] IScriptEntrypoint
    db $ff                                  ; [$8b3e] undefined

SPRITE_INFO_VICTIM_SCREEN_11:               ; [$8b3f]
    db SPRITE_NPC_PRIEST                    ; [$8b3f] SpriteEntity
    db $82,$ff                              ; [$8b40] undefined

    db ISCRIPT_ENTRYPOINT_APOLUNE_GURU
    db $ff                                  ; [$8b43] undefined

SPRITE_INFO_VICTIM_SCREEN_12:               ; [$8b44]
    db SPRITE_NPC_MAN_IN_CHAIR              ; [$8b44] SpriteEntity
    db $82                                  ; [$8b45] undefined

    db SPRITE_NPC_NURSE
    db $95,$ff                              ; [$8b47] undefined

    db ISCRIPT_ENTRYPOINT_APOLUNE_DOCTOR
    db ISCRIPT_ENTRYPOINT_22                ; [$8b4a] IScriptEntrypoint
    db $ff                                  ; [$8b4b] undefined

SPRITE_INFO_VICTIM_SCREEN_13:               ; [$8b4c]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8b4c] SpriteEntity
    db $84                                  ; [$8b4d] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8b4f] undefined

    db ISCRIPT_ENTRYPOINT_23
    db ISCRIPT_ENTRYPOINT_24                ; [$8b52] IScriptEntrypoint
    db $ff                                  ; [$8b53] undefined

SPRITE_INFO_VICTIM_SCREEN_14:               ; [$8b54]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8b54] SpriteEntity
    db $84,$ff                              ; [$8b55] undefined

    db ISCRIPT_ENTRYPOINT_44_FOREPAW_MEAT_SHOP
    db $ff                                  ; [$8b58] undefined

SPRITE_INFO_VICTIM_SCREEN_15:               ; [$8b59]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8b59] SpriteEntity
    db $73,$ff                              ; [$8b5a] undefined

    db ISCRIPT_ENTRYPOINT_40_FOREPAW_TOOL_SHOP
    db $ff                                  ; [$8b5d] undefined

SPRITE_INFO_VICTIM_SCREEN_16:               ; [$8b5e]
    db SPRITE_NPC_PRIEST                    ; [$8b5e] SpriteEntity
    db $82,$ff                              ; [$8b5f] undefined

    db ISCRIPT_ENTRYPOINT_41_FOREPAW_GURU
    db $ff                                  ; [$8b62] undefined

SPRITE_INFO_VICTIM_SCREEN_17:               ; [$8b63]
    db SPRITE_NPC_MAN_IN_CHAIR              ; [$8b63] SpriteEntity
    db $82                                  ; [$8b64] undefined

    db SPRITE_NPC_NURSE
    db $85,$ff                              ; [$8b66] undefined

    db ISCRIPT_ENTRYPOINT_42_FOREPAW_DOCTOR
    db ISCRIPT_ENTRYPOINT_35                ; [$8b69] IScriptEntrypoint
    db $ff                                  ; [$8b6a] undefined

SPRITE_INFO_VICTIM_SCREEN_18:               ; [$8b6b]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8b6b] SpriteEntity
    db $84,$ff                              ; [$8b6c] undefined

    db ISCRIPT_ENTRYPOINT_34
    db $ff                                  ; [$8b6f] undefined

SPRITE_INFO_VICTIM_SCREEN_19:               ; [$8b70]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8b70] SpriteEntity
    db $84,$ff                              ; [$8b71] undefined

    db ISCRIPT_ENTRYPOINT_43_FOREPAW_KEY_SHOP
    db $ff                                  ; [$8b74] undefined

SPRITE_INFO_VICTIM_SCREEN_20:               ; [$8b75]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8b75] SpriteEntity
    db $73,$ff                              ; [$8b76] undefined

    db ISCRIPT_ENTRYPOINT_BEFORE_APOLUNE_TOOL_SHOP
    db $ff                                  ; [$8b79] undefined

SPRITE_INFO_VICTIM_SCREEN_21:               ; [$8b7a]
    db SPRITE_NPC_PRIEST                    ; [$8b7a] SpriteEntity
    db $82,$ff                              ; [$8b7b] undefined

    db ISCRIPT_ENTRYPOINT_36
    db $ff                                  ; [$8b7e] undefined

SPRITE_INFO_VICTIM_SCREEN_22:               ; [$8b7f]
    db SPRITE_NPC_SMOKING_MAN               ; [$8b7f] SpriteEntity
    db $81                                  ; [$8b80] undefined

    db SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP
    db $87,$ff                              ; [$8b82] undefined

    db ISCRIPT_ENTRYPOINT_49
    db ISCRIPT_ENTRYPOINT_50                ; [$8b85] IScriptEntrypoint
    db $ff                                  ; [$8b86] undefined

SPRITE_INFO_VICTIM_SCREEN_23:               ; [$8b87]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8b87] SpriteEntity
    db $84,$ff                              ; [$8b88] undefined

    db ISCRIPT_ENTRYPOINT_58_MASCON_MEAT_SHOP
    db $ff                                  ; [$8b8b] undefined

SPRITE_INFO_VICTIM_SCREEN_24:               ; [$8b8c]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8b8c] SpriteEntity
    db $73,$ff                              ; [$8b8d] undefined

    db ISCRIPT_ENTRYPOINT_57_MASCON_TOOL_SHOP
    db $ff                                  ; [$8b90] undefined

SPRITE_INFO_VICTIM_SCREEN_25:               ; [$8b91]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8b91] SpriteEntity
    db $84,$ff                              ; [$8b92] undefined

    db ISCRIPT_ENTRYPOINT_59_MASCON_KEY_SHOP
    db $ff                                  ; [$8b95] undefined

SPRITE_INFO_VICTIM_SCREEN_26:               ; [$8b96]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8b96] SpriteEntity
    db $84                                  ; [$8b97] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8b99] undefined

    db ISCRIPT_ENTRYPOINT_51
    db ISCRIPT_ENTRYPOINT_52                ; [$8b9c] IScriptEntrypoint
    db $ff                                  ; [$8b9d] undefined

SPRITE_INFO_VICTIM_SCREEN_27:               ; [$8b9e]
    db SPRITE_NPC_MAN_IN_CHAIR              ; [$8b9e] SpriteEntity
    db $82                                  ; [$8b9f] undefined

    db SPRITE_NPC_NURSE
    db $95,$ff                              ; [$8ba1] undefined

    db ISCRIPT_ENTRYPOINT_56_MASCON_DOCTOR
    db ISCRIPT_ENTRYPOINT_55                ; [$8ba4] IScriptEntrypoint
    db $ff                                  ; [$8ba5] undefined

SPRITE_INFO_VICTIM_SCREEN_28:               ; [$8ba6]
    db SPRITE_NPC_MAGIC_TEACHER             ; [$8ba6] SpriteEntity
    db $71,$ff                              ; [$8ba7] undefined

    db ISCRIPT_ENTRYPOINT_75_AFTER_VICTIM_MAGIC_SHOP
    db $ff                                  ; [$8baa] undefined

SPRITE_INFO_VICTIM_SCREEN_29:               ; [$8bab]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8bab] SpriteEntity
    db $87,$ff,$ff                          ; [$8bac] undefined

SPRITE_INFO_VICTIM_SCREEN_30:               ; [$8baf]
    db SPRITE_NPC_PRIEST                    ; [$8baf] SpriteEntity
    db $82,$ff                              ; [$8bb0] undefined

    db ISCRIPT_ENTRYPOINT_61_MASCON_GURU
    db $ff                                  ; [$8bb3] undefined

SPRITE_INFO_VICTIM_SCREEN_31:               ; [$8bb4]
    db SPRITE_OBJ_WING_BOOTS                ; [$8bb4] SpriteEntity
    db $a3                                  ; [$8bb5] undefined

    db SPRITE_ENEMY_GIANT_STRIDER
    db $82,$ff,$ff                          ; [$8bb7] undefined

SPRITE_INFO_VICTIM_SCREEN_32:               ; [$8bba]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8bba] SpriteEntity
    db $73,$ff                              ; [$8bbb] undefined

    db ISCRIPT_ENTRYPOINT_60_AFTER_MASCON_TOOL_SHOP
    db $ff                                  ; [$8bbe] undefined

SPRITE_INFO_VICTIM_SCREEN_33:               ; [$8bbf]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8bbf] SpriteEntity
    db $84                                  ; [$8bc0] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8bc2] undefined

    db ISCRIPT_ENTRYPOINT_53_OVERWORLD_MIST_HOUSE_MAN
    db ISCRIPT_ENTRYPOINT_54_OVERWORLD_MIST_HOUSE_WOMAN ; [$8bc5]
                                                        ; IScriptEntrypoint
    db $ff                                  ; [$8bc6] undefined

SPRITE_INFO_VICTIM_SCREEN_34:               ; [$8bc7]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8bc7] SpriteEntity
    db $84,$ff                              ; [$8bc8] undefined

    db ISCRIPT_ENTRYPOINT_70
    db $ff                                  ; [$8bcb] undefined

SPRITE_INFO_VICTIM_SCREEN_35:               ; [$8bcc]
    db SPRITE_NPC_PRIEST                    ; [$8bcc] SpriteEntity
    db $82,$ff                              ; [$8bcd] undefined

    db ISCRIPT_ENTRYPOINT_76_VICTIM_GURU
    db $ff                                  ; [$8bd0] undefined

SPRITE_INFO_VICTIM_SCREEN_36:               ; [$8bd1]
    db SPRITE_NPC_MAN_IN_CHAIR              ; [$8bd1] SpriteEntity
    db $82,$ff                              ; [$8bd2] undefined

    db ISCRIPT_ENTRYPOINT_71_VICTIM_DOCTOR
    db $ff                                  ; [$8bd5] undefined

SPRITE_INFO_VICTIM_SCREEN_37:               ; [$8bd6]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8bd6] SpriteEntity
    db $84                                  ; [$8bd7] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8bd9] undefined

    db ISCRIPT_ENTRYPOINT_65
    db ISCRIPT_ENTRYPOINT_66                ; [$8bdc] IScriptEntrypoint
    db $ff                                  ; [$8bdd] undefined

SPRITE_INFO_VICTIM_SCREEN_38:               ; [$8bde]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8bde] SpriteEntity
    db $84,$ff                              ; [$8bdf] undefined

    db ISCRIPT_ENTRYPOINT_73_VICTIM_MEAT_SHOP
    db $ff                                  ; [$8be2] undefined

SPRITE_INFO_VICTIM_SCREEN_39:               ; [$8be3]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8be3] SpriteEntity
    db $84,$ff                              ; [$8be4] undefined

    db ISCRIPT_ENTRYPOINT_74_VICTIM_KEY_SHOP
    db $ff                                  ; [$8be7] undefined

SPRITE_INFO_VICTIM_SCREEN_40:               ; [$8be8]
    db SPRITE_NPC_SMOKING_MAN               ; [$8be8] SpriteEntity
    db $81                                  ; [$8be9] undefined

    db SPRITE_NPC_DOCTOR
    db $87,$ff                              ; [$8beb] undefined

    db ISCRIPT_ENTRYPOINT_67
    db ISCRIPT_ENTRYPOINT_68                ; [$8bee] IScriptEntrypoint
    db $ff                                  ; [$8bef] undefined

SPRITE_INFO_VICTIM_SCREEN_41:               ; [$8bf0]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8bf0] SpriteEntity
    db $84,$ff                              ; [$8bf1] undefined

    db ISCRIPT_ENTRYPOINT_81
    db $ff                                  ; [$8bf4] undefined

SPRITE_INFO_VICTIM_SCREEN_42:               ; [$8bf5]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8bf5] SpriteEntity
    db $84,$ff                              ; [$8bf6] undefined

    db ISCRIPT_ENTRYPOINT_88_CONFLATE_MEAT_SHOP
    db $ff                                  ; [$8bf9] undefined

SPRITE_INFO_VICTIM_SCREEN_43:               ; [$8bfa]
    db SPRITE_NPC_PRIEST                    ; [$8bfa] SpriteEntity
    db $82,$ff                              ; [$8bfb] undefined

    db ISCRIPT_ENTRYPOINT_85_CONFLATE_GURU
    db $ff                                  ; [$8bfe] undefined

SPRITE_INFO_VICTIM_SCREEN_44:               ; [$8bff]
    db SPRITE_NPC_MAN_IN_CHAIR              ; [$8bff] SpriteEntity
    db $82,$ff                              ; [$8c00] undefined

    db ISCRIPT_ENTRYPOINT_86_CONFLATE_DOCTOR
    db $ff                                  ; [$8c03] undefined

SPRITE_INFO_VICTIM_SCREEN_45:               ; [$8c04]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8c04] SpriteEntity
    db $73,$ff                              ; [$8c05] undefined

    db ISCRIPT_ENTRYPOINT_87_CONFLATE_TOOL_SHOP
    db $ff                                  ; [$8c08] undefined

SPRITE_INFO_VICTIM_SCREEN_46:               ; [$8c09]
    db SPRITE_NPC_SMOKING_MAN               ; [$8c09] SpriteEntity
    db $81                                  ; [$8c0a] undefined

    db SPRITE_NPC_DOCTOR
    db $87,$ff                              ; [$8c0c] undefined

    db ISCRIPT_ENTRYPOINT_83
    db ISCRIPT_ENTRYPOINT_84                ; [$8c0f] IScriptEntrypoint
    db $ff                                  ; [$8c10] undefined

SPRITE_INFO_VICTIM_SCREEN_47:               ; [$8c11]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8c11] SpriteEntity
    db $84,$ff                              ; [$8c12] undefined

    db ISCRIPT_ENTRYPOINT_104_DAYBREAK_KEY_SHOP
    db $ff                                  ; [$8c15] undefined

SPRITE_INFO_VICTIM_SCREEN_48:               ; [$8c16]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8c16] SpriteEntity
    db $73,$ff                              ; [$8c17] undefined

    db ISCRIPT_ENTRYPOINT_102_DAYBREAK_TOOL_SHOP
    db $ff                                  ; [$8c1a] undefined

SPRITE_INFO_VICTIM_SCREEN_49:               ; [$8c1b]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8c1b] SpriteEntity
    db $84                                  ; [$8c1c] undefined

    db SPRITE_NPC_NURSE
    db $88,$ff                              ; [$8c1e] undefined

    db ISCRIPT_ENTRYPOINT_103_DAYBREAK_MEAT_SHOP
    db ISCRIPT_ENTRYPOINT_99                ; [$8c21] IScriptEntrypoint
    db $ff                                  ; [$8c22] undefined

SPRITE_INFO_VICTIM_SCREEN_50:               ; [$8c23]
    db SPRITE_NPC_SMOKING_MAN               ; [$8c23] SpriteEntity
    db $81                                  ; [$8c24] undefined

    db SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP
    db $87,$ff                              ; [$8c26] undefined

    db ISCRIPT_ENTRYPOINT_100
    db ISCRIPT_ENTRYPOINT_101               ; [$8c29] IScriptEntrypoint
    db $ff                                  ; [$8c2a] undefined

SPRITE_INFO_VICTIM_SCREEN_51:               ; [$8c2b]
    db SPRITE_NPC_PRIEST                    ; [$8c2b] SpriteEntity
    db $82,$ff                              ; [$8c2c] undefined

    db ISCRIPT_ENTRYPOINT_105_DAYBREAK_GURU
    db $ff                                  ; [$8c2f] undefined

SPRITE_INFO_VICTIM_SCREEN_52:               ; [$8c30]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8c30] SpriteEntity
    db $84                                  ; [$8c31] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8c33] undefined

    db ISCRIPT_ENTRYPOINT_97
    db ISCRIPT_ENTRYPOINT_98                ; [$8c36] IScriptEntrypoint
    db $ff                                  ; [$8c37] undefined

SPRITE_INFO_VICTIM_SCREEN_53:               ; [$8c38]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8c38] SpriteEntity
    db $84,$ff,$ff                          ; [$8c39] undefined

SPRITE_INFO_VICTIM_SCREEN_54:               ; [$8c3c]
    db SPRITE_ENEMY_GRIMLOCK                ; [$8c3c] SpriteEntity
    db $84,$ff,$ff                          ; [$8c3d] undefined

SPRITE_INFO_VICTIM_SCREEN_55:               ; [$8c40]
    db SPRITE_OBJ_RED_POTION                ; [$8c40] SpriteEntity
    db $98                                  ; [$8c41] undefined

    db SPRITE_ENEMY_GRIMLOCK
    db $84,$ff,$ff                          ; [$8c43] undefined

SPRITE_INFO_VICTIM_SCREEN_56:               ; [$8c46]
    db SPRITE_ENEMY_MASKMAN                 ; [$8c46] SpriteEntity
    db $84,$ff,$ff                          ; [$8c47] undefined

SPRITE_INFO_VICTIM_SCREEN_57:               ; [$8c4a]
    db SPRITE_ENEMY_SIR_GAWAINE             ; [$8c4a] SpriteEntity
    db $84,$ff,$ff                          ; [$8c4b] undefined

SPRITE_INFO_VICTIM_SCREEN_58:               ; [$8c4e]
    db SPRITE_NPC_SITTING_MAN_1             ; [$8c4e] SpriteEntity
    db $84                                  ; [$8c4f] undefined

    db SPRITE_NPC_WALKING_WOMAN_2
    db $89,$ff                              ; [$8c51] undefined

    db ISCRIPT_ENTRYPOINT_113_OVERWORLD_HOUSE_MAN
    db ISCRIPT_ENTRYPOINT_114_OVERWORLD_HOUSE_WOMAN ; [$8c54]
                                                    ; IScriptEntrypoint
    db $ff                                  ; [$8c55] undefined

SPRITE_INFO_VICTIM_SCREEN_59:               ; [$8c56]
    db SPRITE_NPC_PRIEST                    ; [$8c56] SpriteEntity
    db $82,$ff,$ff                          ; [$8c57] undefined

SPRITE_INFO_VICTIM_SCREEN_60:               ; [$8c5a]
    db SPRITE_NPC_PRIEST                    ; [$8c5a] SpriteEntity
    db $82,$ff,$78,$ff                      ; [$8c5b] undefined

SPRITE_INFO_VICTIM_SCREEN_61:               ; [$8c5f]
    db SPRITE_NPC_SMOKING_MAN               ; [$8c5f] SpriteEntity
    db $81,$ff,$73,$ff                      ; [$8c60] undefined

SPRITE_INFO_VICTIM_SCREEN_62:               ; [$8c64]
    db SPRITE_NPC_MEAT_SALESMAN             ; [$8c64] SpriteEntity
    db $84,$ff                              ; [$8c65] undefined

    db ISCRIPT_ENTRYPOINT_118_DARTMOOR_MEAT_SHOP
    db $ff                                  ; [$8c68] undefined

SPRITE_INFO_VICTIM_SCREEN_63:               ; [$8c69]
    db SPRITE_NPC_MAN_IN_CHAIR              ; [$8c69] SpriteEntity
    db $82,$ff                              ; [$8c6a] undefined

    db ISCRIPT_ENTRYPOINT_122_DARTMOOR_DOCTOR
    db $ff                                  ; [$8c6d] undefined

SPRITE_INFO_VICTIM_SCREEN_64:               ; [$8c6e]
    db SPRITE_NPC_KEY_SALESMAN              ; [$8c6e] SpriteEntity
    db $84,$ff                              ; [$8c6f] undefined

    db ISCRIPT_ENTRYPOINT_119_DARTMOOR_KEY_SHOP
    db $ff                                  ; [$8c72] undefined

SPRITE_INFO_VICTIM_SCREEN_65:               ; [$8c73]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8c73] SpriteEntity
    db $73,$ff                              ; [$8c74] undefined

    db ISCRIPT_ENTRYPOINT_117_DARTMOOR_TOOL_SHOP
    db $ff                                  ; [$8c77] undefined

SPRITE_INFO_VICTIM_SCREEN_66:               ; [$8c78]
    db SPRITE_NPC_PRIEST                    ; [$8c78] SpriteEntity
    db $82,$ff                              ; [$8c79] undefined

    db ISCRIPT_ENTRYPOINT_116_FRATERNAL_GURU
    db $ff                                  ; [$8c7c] undefined

SPRITE_INFO_VICTIM_SCREEN_67:               ; [$8c7d]
    db SPRITE_OBJ_OINTMENT                  ; [$8c7d] SpriteEntity
    db $95                                  ; [$8c7e] undefined

    db SPRITE_ENEMY_WOLFMAN
    db $87,$ff,$ff                          ; [$8c80] undefined

SPRITE_INFO_VICTIM_SCREEN_68:               ; [$8c83]
    db SPRITE_NPC_KING                      ; [$8c83] SpriteEntity
    db $72,$ff                              ; [$8c84] undefined

    db ISCRIPT_ENTRYPOINT_121_GLAD_YOU_ARE_BACK
    db $ff                                  ; [$8c87] undefined

SPRITE_INFO_VICTIM_SCREEN_69:               ; [$8c88]
    db SPRITE_NPC_ARMOR_SALESMAN            ; [$8c88] SpriteEntity
    db $73,$ff                              ; [$8c89] undefined

    db ISCRIPT_ENTRYPOINT_72_VICTIM_TOOL_SHOP
    db $ff                                  ; [$8c8c] undefined


;============================================================================
; Mascon Sprite Information
;============================================================================
SPRITE_INFO_MASCON:                         ; [$8c8d]
    dw SPRITE_INFO_MASCON_SCREEN_00         ; SPRITE_INFO_MASCON_SCREEN_00
                                            ; [$PRG11::8c8d]
    dw SPRITE_INFO_MASCON_SCREEN_01         ; SPRITE_INFO_MASCON_SCREEN_01
                                            ; [$PRG11::8c8f]
    dw SPRITE_INFO_MASCON_SCREEN_02         ; SPRITE_INFO_MASCON_SCREEN_02
                                            ; [$PRG11::8c91]
    dw SPRITE_INFO_MASCON_SCREEN_03         ; SPRITE_INFO_MASCON_SCREEN_03
                                            ; [$PRG11::8c93]
    dw SPRITE_INFO_MASCON_SCREEN_04         ; SPRITE_INFO_MASCON_SCREEN_04
                                            ; [$PRG11::8c95]
    dw SPRITE_INFO_MASCON_SCREEN_05         ; SPRITE_INFO_MASCON_SCREEN_05
                                            ; [$PRG11::8c97]
    dw SPRITE_INFO_MASCON_SCREEN_06         ; SPRITE_INFO_MASCON_SCREEN_06
                                            ; [$PRG11::8c99]
    dw SPRITE_INFO_MASCON_SCREEN_07         ; SPRITE_INFO_MASCON_SCREEN_07
                                            ; [$PRG11::8c9b]
    dw SPRITE_INFO_MASCON_SCREEN_08         ; SPRITE_INFO_MASCON_SCREEN_08
                                            ; [$PRG11::8c9d]
    dw SPRITE_INFO_MASCON_SCREEN_09         ; SPRITE_INFO_MASCON_SCREEN_09
                                            ; [$PRG11::8c9f]
    dw SPRITE_INFO_MASCON_SCREEN_10         ; SPRITE_INFO_MASCON_SCREEN_10
                                            ; [$PRG11::8ca1]
    dw SPRITE_INFO_MASCON_SCREEN_11         ; SPRITE_INFO_MASCON_SCREEN_11
                                            ; [$PRG11::8ca3]
    dw SPRITE_INFO_MASCON_SCREEN_12_13      ; SPRITE_INFO_MASCON_SCREEN_12_13
                                            ; [$PRG11::8ca5]
    dw SPRITE_INFO_MASCON_SCREEN_12_13      ; SPRITE_INFO_MASCON_SCREEN_12_13
                                            ; [$PRG11::8ca7]

;
; XREFS:
;     SPRITE_INFO_MASCON [$PRG11::8c8d]
;
SPRITE_INFO_MASCON_SCREEN_00:               ; [$8ca9]
    db SPRITE_NPC_WALKING_WOMAN_2           ; [$8ca9] SpriteEntity
    db $97,$ff                              ; [$8caa] undefined

    db ISCRIPT_ENTRYPOINT_17
    db $ff                                  ; [$8cad] undefined

SPRITE_INFO_MASCON_SCREEN_01:               ; [$8cae]
    db SPRITE_NPC_WALKING_MAN_1             ; [$8cae] SpriteEntity
    db $97,$ff                              ; [$8caf] undefined

    db ISCRIPT_ENTRYPOINT_16
    db $ff                                  ; [$8cb2] undefined

SPRITE_INFO_MASCON_SCREEN_02:               ; [$8cb3]
    db SPRITE_NPC_NURSE                     ; [$8cb3] SpriteEntity
    db $97,$ff                              ; [$8cb4] undefined

    db ISCRIPT_ENTRYPOINT_32_FOREPAW_GREETER
    db $ff                                  ; [$8cb7] undefined

SPRITE_INFO_MASCON_SCREEN_03:               ; [$8cb8]
    db SPRITE_NPC_WALKING_MAN_1             ; [$8cb8] SpriteEntity
    db $97,$ff                              ; [$8cb9] undefined

    db ISCRIPT_ENTRYPOINT_33
    db $ff                                  ; [$8cbc] undefined

SPRITE_INFO_MASCON_SCREEN_04:               ; [$8cbd]
    db SPRITE_NPC_WALKING_MAN_1             ; [$8cbd] SpriteEntity
    db $97,$ff                              ; [$8cbe] undefined

    db ISCRIPT_ENTRYPOINT_48
    db $ff                                  ; [$8cc1] undefined

SPRITE_INFO_MASCON_SCREEN_05:               ; [$8cc2]
    db $ff,$ff                              ; [$8cc2] undefined

SPRITE_INFO_MASCON_SCREEN_06:               ; [$8cc4]
    db SPRITE_NPC_WALKING_WOMAN_2           ; [$8cc4] SpriteEntity
    db $97,$ff                              ; [$8cc5] undefined

    db ISCRIPT_ENTRYPOINT_64
    db $ff                                  ; [$8cc8] undefined

SPRITE_INFO_MASCON_SCREEN_07:               ; [$8cc9]
    db $ff,$ff                              ; [$8cc9] undefined

SPRITE_INFO_MASCON_SCREEN_08:               ; [$8ccb]
    db SPRITE_NPC_GUARD_1                   ; [$8ccb] SpriteEntity
    db $9b,$ff                              ; [$8ccc] undefined

    db ISCRIPT_ENTRYPOINT_82
    db $ff                                  ; [$8ccf] undefined

SPRITE_INFO_MASCON_SCREEN_09:               ; [$8cd0]
    db SPRITE_NPC_WALKING_MAN_1             ; [$8cd0] SpriteEntity
    db $97,$ff                              ; [$8cd1] undefined

    db ISCRIPT_ENTRYPOINT_80
    db $ff                                  ; [$8cd4] undefined

SPRITE_INFO_MASCON_SCREEN_10:               ; [$8cd5]
    db SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP  ; [$8cd5] SpriteEntity
    db $97,$ff                              ; [$8cd6] undefined

    db ISCRIPT_ENTRYPOINT_96
    db $ff                                  ; [$8cd9] undefined

SPRITE_INFO_MASCON_SCREEN_11:               ; [$8cda]
    db $ff,$ff                              ; [$8cda] undefined

SPRITE_INFO_MASCON_SCREEN_12_13:            ; [$8cdc]
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8cdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8cec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8cfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8d9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8dac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8dbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8dcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8ddc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8dec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8dfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8e9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8eac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8ebc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8ecc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8edc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8eec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8efc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8f9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8fac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8fbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8fcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8fdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8fec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$8ffc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$900c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$901c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$902c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$903c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$904c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$905c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$906c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$907c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$908c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$909c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$90ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$90bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$90cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$90dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$90ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$90fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$910c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$911c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$912c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$913c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$914c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$915c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$916c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$917c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$918c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$919c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$91ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$91bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$91cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$91dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$91ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$91fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$920c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$921c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$922c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$923c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$924c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$925c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$926c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$927c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$928c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$929c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$92ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$92bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$92cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$92dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$92ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$92fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$930c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$931c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$932c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$933c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$934c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$935c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$936c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$937c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$938c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$939c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$93ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$93bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$93cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$93dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$93ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$93fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$940c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$941c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$942c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$943c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$944c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$945c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$946c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$947c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$948c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$949c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$94ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$94bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$94cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$94dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$94ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$94fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$950c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$951c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$952c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$953c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$954c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$955c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$956c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$957c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$958c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$959c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$95ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$95bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$95cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$95dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$95ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$95fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$960c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$961c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$962c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$963c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$964c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$965c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$966c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$967c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$968c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$969c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$96ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$96bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$96cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$96dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$96ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$96fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$970c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$971c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$972c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$973c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$974c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$975c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$976c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$977c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$978c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$979c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$97ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$97bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$97cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$97dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$97ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$97fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$980c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$981c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$982c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$983c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$984c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$985c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$986c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$987c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$988c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$989c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$98ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$98bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$98cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$98dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$98ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$98fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$990c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$991c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$992c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$993c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$994c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$995c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$996c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$997c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$998c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$999c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$99ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$99bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$99cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$99dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$99ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$99fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9a9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9aac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9abc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9acc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9adc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9aec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9afc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9b9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9bac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9bbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9bcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9bdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9bec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9bfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9c9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9cac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9cbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9ccc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9cdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9cec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9cfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9d9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9dac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9dbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9dcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9ddc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9dec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9dfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9e9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9eac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9ebc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9ecc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9edc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9eec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9efc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9f9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9fac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9fbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9fcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9fdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9fec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$9ffc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a00c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a01c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a02c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a03c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a04c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a05c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a06c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a07c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a08c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a09c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a0ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a0bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a0cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a0dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a0ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a0fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a10c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a11c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a12c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a13c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a14c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a15c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a16c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a17c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a18c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a19c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a1ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a1bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a1cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a1dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a1ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a1fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a20c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a21c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a22c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a23c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a24c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a25c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a26c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a27c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a28c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a29c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a2ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a2bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a2cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a2dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a2ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a2fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a30c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a31c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a32c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a33c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a34c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a35c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a36c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a37c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a38c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a39c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a3ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a3bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a3cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a3dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a3ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a3fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a40c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a41c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a42c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a43c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a44c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a45c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a46c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a47c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a48c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a49c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a4ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a4bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a4cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a4dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a4ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a4fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a50c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a51c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a52c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a53c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a54c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a55c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a56c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a57c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a58c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a59c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a5ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a5bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a5cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a5dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a5ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a5fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a60c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a61c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a62c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a63c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a64c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a65c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a66c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a67c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a68c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a69c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a6ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a6bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a6cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a6dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a6ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a6fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a70c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a71c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a72c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a73c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a74c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a75c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a76c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a77c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a78c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a79c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a7ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a7bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a7cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a7dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a7ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a7fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a80c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a81c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a82c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a83c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a84c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a85c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a86c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a87c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a88c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a89c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a8ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a8bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a8cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a8dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a8ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a8fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a90c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a91c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a92c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a93c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a94c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a95c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a96c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a97c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a98c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a99c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a9ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a9bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a9cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a9dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a9ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$a9fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aa9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aaac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aabc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aacc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aadc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aaec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aafc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ab9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$abac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$abbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$abcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$abdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$abec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$abfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ac9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$acac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$acbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$accc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$acdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$acec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$acfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ad9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$addc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$adfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ae9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aeac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aebc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aecc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aedc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aeec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$aefc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$af9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$afec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$affc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b00c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b01c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b02c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b03c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b04c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b05c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b06c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b07c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b08c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b09c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b0fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b10c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b11c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b12c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b13c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b14c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b15c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b16c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b17c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b18c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b19c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b1fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b20c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b21c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b22c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b23c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b24c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b25c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b26c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b27c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b28c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b29c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b2fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b30c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b31c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b32c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b33c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b34c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b35c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b36c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b37c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b38c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b39c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b3fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b40c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b41c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b42c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b43c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b44c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b45c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b46c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b47c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b48c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b49c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b4fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b50c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b51c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b52c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b53c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b54c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b55c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b56c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b57c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b58c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b59c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b5fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b60c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b61c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b62c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b63c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b64c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b65c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b66c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b67c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b68c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b69c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b6fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b70c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b71c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b72c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b73c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b74c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b75c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b76c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b77c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b78c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b79c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b7fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b80c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b81c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b82c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b83c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b84c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b85c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b86c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b87c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b88c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b89c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b8fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b90c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b91c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b92c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b93c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b94c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b95c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b96c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b97c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b98c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b99c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9ac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9bc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9cc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9dc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9ec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$b9fc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$ba9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$babc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bacc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$badc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$baec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bafc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bb9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bbfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bc9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bccc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bcfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bd9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bddc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bdfc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$be9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bebc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$becc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bedc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$beec] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$befc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf0c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf1c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf2c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf3c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf4c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf5c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf6c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf7c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf8c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bf9c] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfac] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfbc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfcc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfdc] undefined
    hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ; [$bfec] undefined
    db $ff,$ff,$ff,$ff                      ; [$bffc] undefined
