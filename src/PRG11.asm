;============================================================================
; Faxanadu (U).nes
;
; PRG11 ($8000 - $bfff)
;============================================================================

    .segment "PRG11"
    .reloc


;============================================================================
; Palette data comprising background tiles for areas.
;============================================================================
PALETTE_TILES_EOLIS:                        ; [$8000]
    .byte $0f                               ; [0]:
    .byte $0f                               ; [1]:
    .byte $0c                               ; [2]:
    .byte $1b                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0f                               ; [5]:
    .byte $08                               ; [6]:
    .byte $17                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $0f                               ; [9]:
    .byte $07                               ; [10]:
    .byte $0b                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_TILES_02:                           ; [$8010]
    .byte $0f                               ; [0]:
    .byte $05                               ; [1]:
    .byte $17                               ; [2]:
    .byte $26                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0f                               ; [5]:
    .byte $06                               ; [6]:
    .byte $17                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $06                               ; [9]:
    .byte $18                               ; [10]:
    .byte $28                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_TILES_03:                           ; [$8020]
    .byte $0f                               ; [0]:
    .byte $0b                               ; [1]:
    .byte $1b                               ; [2]:
    .byte $21                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0f                               ; [5]:
    .byte $0b                               ; [6]:
    .byte $1b                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $0b                               ; [9]:
    .byte $1b                               ; [10]:
    .byte $2b                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_TILES_04:                           ; [$8030]
    .byte $0f                               ; [0]:
    .byte $00                               ; [1]:
    .byte $10                               ; [2]:
    .byte $20                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $07                               ; [5]:
    .byte $17                               ; [6]:
    .byte $10                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $18                               ; [9]:
    .byte $28                               ; [10]:
    .byte $38                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_TILES_05:                           ; [$8040]
    .byte $0f                               ; [0]:
    .byte $0f                               ; [1]:
    .byte $0f                               ; [2]:
    .byte $0f                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0f                               ; [5]:
    .byte $0f                               ; [6]:
    .byte $0f                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $0f                               ; [9]:
    .byte $0f                               ; [10]:
    .byte $0f                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0f                               ; [13]:
    .byte $0f                               ; [14]:
    .byte $0f                               ; [15]:

PALETTE_TILES_06:                           ; [$8050]
    .byte $0f                               ; [0]:
    .byte $0f                               ; [1]:
    .byte $00                               ; [2]:
    .byte $10                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $07                               ; [5]:
    .byte $17                               ; [6]:
    .byte $10                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $27                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_TILES_OUTSIDE_APOLUNE:              ; [$8060]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $17                               ; [2]:
    .byte $27                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0c                               ; [5]:
    .byte $17                               ; [6]:
    .byte $27                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0a                               ; [13]:
    .byte $1b                               ; [14]:
    .byte $38                               ; [15]:

PALETTE_TILES_TOWER:                        ; [$8070]
    .byte $0f                               ; [0]:
    .byte $0f                               ; [1]:
    .byte $08                               ; [2]:
    .byte $18                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0f                               ; [5]:
    .byte $06                               ; [6]:
    .byte $18                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $08                               ; [13]:
    .byte $18                               ; [14]:
    .byte $25                               ; [15]:

PALETTE_TILES_BRANCH:                       ; [$8080]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $17                               ; [2]:
    .byte $26                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0c                               ; [5]:
    .byte $17                               ; [6]:
    .byte $26                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $06                               ; [13]:
    .byte $16                               ; [14]:
    .byte $36                               ; [15]:

PALETTE_TILES_LEFT_TRUNK:                   ; [$8090]
    .byte $0f                               ; [0]:
    .byte $09                               ; [1]:
    .byte $18                               ; [2]:
    .byte $36                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0c                               ; [5]:
    .byte $18                               ; [6]:
    .byte $36                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $09                               ; [13]:
    .byte $19                               ; [14]:
    .byte $29                               ; [15]:

PALETTE_TILES_MIST:                         ; [$80a0]
    .byte $0f                               ; [0]:
    .byte $04                               ; [1]:
    .byte $00                               ; [2]:
    .byte $26                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $05                               ; [5]:
    .byte $16                               ; [6]:
    .byte $26                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0f                               ; [13]:
    .byte $05                               ; [14]:
    .byte $16                               ; [15]:

PALETTE_TILES_SUFFER:                       ; [$80b0]
    .byte $0f                               ; [0]:
    .byte $07                               ; [1]:
    .byte $18                               ; [2]:
    .byte $28                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $09                               ; [5]:
    .byte $1b                               ; [6]:
    .byte $27                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $05                               ; [13]:
    .byte $16                               ; [14]:
    .byte $26                               ; [15]:

PALETTE_TILES_DARTMOOR:                     ; [$80c0]
    .byte $0f                               ; [0]:
    .byte $15                               ; [1]:
    .byte $19                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $08                               ; [5]:
    .byte $18                               ; [6]:
    .byte $26                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $04                               ; [9]:
    .byte $00                               ; [10]:
    .byte $10                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $06                               ; [13]:
    .byte $16                               ; [14]:
    .byte $26                               ; [15]:

PALETTE_TILES_FRATERNAL:                    ; [$80d0]
    .byte $0f                               ; [0]:
    .byte $15                               ; [1]:
    .byte $19                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0f                               ; [5]:
    .byte $00                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $04                               ; [9]:
    .byte $00                               ; [10]:
    .byte $10                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0c                               ; [13]:
    .byte $00                               ; [14]:
    .byte $21                               ; [15]:

PALETTE_TILES_KING_GRIEVES_ROOM:            ; [$80e0]
    .byte $0f                               ; [0]:
    .byte $15                               ; [1]:
    .byte $1a                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $04                               ; [5]:
    .byte $13                               ; [6]:
    .byte $24                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $00                               ; [9]:
    .byte $10                               ; [10]:
    .byte $20                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $01                               ; [13]:
    .byte $11                               ; [14]:
    .byte $21                               ; [15]:

PALETTE_TILES_EVIL_FORTRESS:                ; [$80f0]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $00                               ; [2]:
    .byte $21                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0b                               ; [5]:
    .byte $00                               ; [6]:
    .byte $23                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $08                               ; [9]:
    .byte $00                               ; [10]:
    .byte $10                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_TILES_START_SCREEN:                 ; [$8100]
    .byte $0f                               ; [0]:
    .byte $05                               ; [1]:
    .byte $18                               ; [2]:
    .byte $38                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $17                               ; [5]:
    .byte $27                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $0f                               ; [9]:
    .byte $16                               ; [10]:
    .byte $28                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0f                               ; [13]:
    .byte $00                               ; [14]:
    .byte $10                               ; [15]:

PALETTE_TILES_KINGS_ROOM:                   ; [$8110]
    .byte $0f                               ; [0]:
    .byte $07                               ; [1]:
    .byte $17                               ; [2]:
    .byte $27                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0b                               ; [5]:
    .byte $00                               ; [6]:
    .byte $10                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $00                               ; [13]:
    .byte $10                               ; [14]:
    .byte $20                               ; [15]:

PALETTE_TILES_TEMPLE:                       ; [$8120]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $18                               ; [2]:
    .byte $28                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $0a                               ; [5]:
    .byte $00                               ; [6]:
    .byte $29                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0b                               ; [13]:
    .byte $1b                               ; [14]:
    .byte $2b                               ; [15]:

PALETTE_TILES_HOSPITAL:                     ; [$8130]
    .byte $0f                               ; [0]:
    .byte $0b                               ; [1]:
    .byte $17                               ; [2]:
    .byte $10                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $08                               ; [5]:
    .byte $00                               ; [6]:
    .byte $2b                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0c                               ; [13]:
    .byte $1b                               ; [14]:
    .byte $24                               ; [15]:

PALETTE_TILES_TAVERN:                       ; [$8140]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $1b                               ; [2]:
    .byte $2c                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $08                               ; [5]:
    .byte $1b                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $07                               ; [13]:
    .byte $00                               ; [14]:
    .byte $10                               ; [15]:

PALETTE_TILES_TOOL_SHOP:                    ; [$8150]
    .byte $1f                               ; [0]:
    .byte $07                               ; [1]:
    .byte $18                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $07                               ; [5]:
    .byte $17                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $07                               ; [13]:
    .byte $17                               ; [14]:
    .byte $27                               ; [15]:

PALETTE_TILES_KEY_SHOP:                     ; [$8160]
    .byte $0f                               ; [0]:
    .byte $06                               ; [1]:
    .byte $17                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $06                               ; [5]:
    .byte $17                               ; [6]:
    .byte $3b                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $3f                               ; [12]:
    .byte $07                               ; [13]:
    .byte $17                               ; [14]:
    .byte $28                               ; [15]:

PALETTE_TILES_HOUSE:                        ; [$8170]
    .byte $0f                               ; [0]:
    .byte $07                               ; [1]:
    .byte $17                               ; [2]:
    .byte $20                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $07                               ; [5]:
    .byte $17                               ; [6]:
    .byte $36                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $3f                               ; [12]:
    .byte $08                               ; [13]:
    .byte $17                               ; [14]:
    .byte $37                               ; [15]:

PALETTE_TILES_MEAT_SHOP:                    ; [$8180]
    .byte $0f                               ; [0]:
    .byte $07                               ; [1]:
    .byte $18                               ; [2]:
    .byte $38                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $07                               ; [5]:
    .byte $1c                               ; [6]:
    .byte $37                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $3f                               ; [12]:
    .byte $07                               ; [13]:
    .byte $00                               ; [14]:
    .byte $28                               ; [15]:

PALETTE_TILES_MARTIAL_ARTS:                 ; [$8190]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $18                               ; [2]:
    .byte $28                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $07                               ; [5]:
    .byte $17                               ; [6]:
    .byte $27                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $3f                               ; [12]:
    .byte $08                               ; [13]:
    .byte $18                               ; [14]:
    .byte $2b                               ; [15]:

PALETTE_TILES_MAGIC_SHOP:                   ; [$81a0]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $18                               ; [2]:
    .byte $28                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $06                               ; [5]:
    .byte $00                               ; [6]:
    .byte $10                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $15                               ; [9]:
    .byte $19                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $00                               ; [13]:
    .byte $10                               ; [14]:
    .byte $20                               ; [15]:

PALETTE_TILES_TOWN:                         ; [$81b0]
    .byte $0f                               ; [0]:
    .byte $08                               ; [1]:
    .byte $17                               ; [2]:
    .byte $27                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $06                               ; [5]:
    .byte $17                               ; [6]:
    .byte $29                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $0a                               ; [9]:
    .byte $1c                               ; [10]:
    .byte $38                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $15                               ; [13]:
    .byte $19                               ; [14]:
    .byte $30                               ; [15]:


;============================================================================
; Palette data for sprites.
;============================================================================
PALETTE_SPRITES_OUTSIDE:                    ; [$81c0]
    .byte $0f                               ; [0]:
    .byte $18                               ; [1]:
    .byte $26                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $00                               ; [5]:
    .byte $25                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $0f                               ; [9]:
    .byte $1c                               ; [10]:
    .byte $33                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0f                               ; [13]:
    .byte $27                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_SPRITES_INSIDE:                     ; [$81d0]
    .byte $0f                               ; [0]:
    .byte $18                               ; [1]:
    .byte $26                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $00                               ; [5]:
    .byte $25                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $16                               ; [9]:
    .byte $2c                               ; [10]:
    .byte $30                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $17                               ; [13]:
    .byte $25                               ; [14]:
    .byte $30                               ; [15]:

PALETTE_SPRITES_PORTRAIT:                   ; [$81e0]
    .byte $0f                               ; [0]:
    .byte $18                               ; [1]:
    .byte $26                               ; [2]:
    .byte $30                               ; [3]:
    .byte $0f                               ; [4]:
    .byte $00                               ; [5]:
    .byte $25                               ; [6]:
    .byte $30                               ; [7]:
    .byte $0f                               ; [8]:
    .byte $18                               ; [9]:
    .byte $26                               ; [10]:
    .byte $2b                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $0c                               ; [13]:
    .byte $1c                               ; [14]:
    .byte $30                               ; [15]:


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
    .byte $03                               ; [0]: Eolis
    .byte $03                               ; [1]:
    .byte $03                               ; [2]:
    .byte $03                               ; [3]:
    .byte $03                               ; [4]:
    .byte $03                               ; [5]:
    .byte $02                               ; [6]: Between Eolis and Apolune
    .byte $02                               ; [7]: Tower
    .byte $02                               ; [8]: Branch
    .byte $02                               ; [9]: Left, darker side of Trunk
    .byte $02                               ; [10]: Mist
    .byte $02                               ; [11]: Tower of Suffer
    .byte $00                               ; [12]: Dartmoor
    .byte $00                               ; [13]: Castle of Fraternal
    .byte $00                               ; [14]: King Grieve's Room
    .byte $03                               ; [15]: Evil Fortress
    .byte $01                               ; [16]: Start Screen
    .byte $02                               ; [17]: King's Room
    .byte $02                               ; [18]: Temple
    .byte $02                               ; [19]: Hospital
    .byte $02                               ; [20]: Tavern
    .byte $02                               ; [21]: Tool Shop
    .byte $02                               ; [22]: Key Shop
    .byte $02                               ; [23]: House
    .byte $02                               ; [24]: Meat Shop
    .byte $02                               ; [25]: Martial Arts
    .byte $02                               ; [26]: Magic Shop
    .byte $03                               ; [27]: Town
    .byte $03                               ; [28]:
    .byte $03                               ; [29]:
    .byte $03                               ; [30]:
    .byte $03                               ; [31]:


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
    pointer SPRITE_INFO_EOLIS               ; Eolis
    pointer SPRITE_INFO_APOLUNE             ; Apolune
    pointer SPRITE_INFO_FOREPAW             ; Forepaw
    pointer SPRITE_INFO_MASCON              ; Mascon
    pointer SPRITE_INFO_VICTIM              ; Victim
    pointer SPRITE_INFO_CONFLATE            ; Conflate
    pointer SPRITE_INFO_DAYBREAK            ; Daybreak
    pointer SPRITE_INFO_ZENIS               ; Final


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
    pointer SPRITE_INFO_EOLIS_SCREEN_00     ; Screen 0
    pointer SPRITE_INFO_EOLIS_SCREEN_01     ; Screen 1
    pointer SPRITE_INFO_EOLIS_SCREEN_02     ; Screen 2
    pointer SPRITE_INFO_EOLIS_SCREEN_03     ; Screen 3
    pointer SPRITE_INFO_EOLIS_SCREEN_04     ; Screen 4
    pointer SPRITE_INFO_EOLIS_SCREEN_05     ; Screen 5
    pointer SPRITE_INFO_EOLIS_SCREEN_06     ; Screen 6
    pointer SPRITE_INFO_EOLIS_SCREEN_07     ; Screen 7
    pointer SPRITE_INFO_EOLIS_SCREEN_08     ; Screen 8

;
; XREFS:
;     SPRITE_INFO_EOLIS [$PRG11::8220]
;
SPRITE_INFO_EOLIS_SCREEN_00:                ; [$8232]
    .byte SPRITE_TRIGGER_INTRO              ; [$8232] SpriteEntity
    .byte $04,$ff                           ; [$8233] byte

    .byte ISCRIPT_ENTRYPOINT_INTRO          ; IScript 0
    .byte $ff                               ; [$8236] byte

SPRITE_INFO_EOLIS_SCREEN_01:                ; [$8237]
    .byte SPRITE_NPC_WALKING_MAN_1          ; [$8237] SpriteEntity
    .byte $9c,$ff                           ; [$8238] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_WALKING_MAN_1 ; IScript 1
    .byte $ff                               ; [$823b] undefined

SPRITE_INFO_EOLIS_SCREEN_02:                ; [$823c]
    .byte SPRITE_NPC_WALKING_WOMAN_2        ; [$823c] SpriteEntity
    .byte $97,$ff                           ; [$823d] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_1 ; IScript 3
    .byte $ff                               ; [$8240] undefined

SPRITE_INFO_EOLIS_SCREEN_03:                ; [$8241]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8241] SpriteEntity
    .byte $84,$ff                           ; [$8242] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_SMOKING_MAN ; IScript 6
    .byte $ff                               ; [$8245] undefined

SPRITE_INFO_EOLIS_SCREEN_04:                ; [$8246]
    .byte SPRITE_ENEMY_ZOZURA               ; [$8246] SpriteEntity
    .byte $a9                               ; [$8247] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $a4,$ff,$ff                       ; [$8249] undefined

SPRITE_INFO_EOLIS_SCREEN_05:                ; [$824c]
    .byte SPRITE_ENEMY_ZOZURA               ; [$824c] SpriteEntity
    .byte $ab                               ; [$824d] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $a5,$ff,$ff                       ; [$824f] undefined

SPRITE_INFO_EOLIS_SCREEN_06:                ; [$8252]
    .byte SPRITE_NPC_NURSE                  ; [$8252] SpriteEntity
    .byte $93,$ff                           ; [$8253] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_WALKING_WOMAN_2 ; IScript 5
    .byte $ff                               ; [$8256] undefined

SPRITE_INFO_EOLIS_SCREEN_07:                ; [$8257]
    .byte SPRITE_NPC_GUARD_1                ; [$8257] SpriteEntity
    .byte $9a,$ff                           ; [$8258] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_KINGS_GUARD ; ISCRIPT_EOLIS_KINGS_GUARD
                                               ; [$PRG11::825a]
    .byte $ff                               ; [$825b] undefined

SPRITE_INFO_EOLIS_SCREEN_08:                ; [$825c]
    .byte SPRITE_ENEMY_MONODRON             ; [$825c] SpriteEntity
    .byte $9c,$ff,$ff                       ; [$825d] undefined


;============================================================================
; Apolune Sprite Information
;============================================================================
SPRITE_INFO_APOLUNE:                        ; [$8260]
    pointer SPRITE_INFO_APOLUNE_SCREEN_00   ; SPRITE_INFO_APOLUNE_SCREEN_00
                                            ; [$PRG11::8260]
    pointer SPRITE_INFO_APOLUNE_SCREEN_01   ; SPRITE_INFO_APOLUNE_SCREEN_01
                                            ; [$PRG11::8262]
    pointer SPRITE_INFO_APOLUNE_SCREEN_02   ; SPRITE_INFO_APOLUNE_SCREEN_02
                                            ; [$PRG11::8264]
    pointer SPRITE_INFO_APOLUNE_SCREEN_03   ; SPRITE_INFO_APOLUNE_SCREEN_03
                                            ; [$PRG11::8266]
    pointer SPRITE_INFO_APOLUNE_SCREEN_04   ; SPRITE_INFO_APOLUNE_SCREEN_04
                                            ; [$PRG11::8268]
    pointer SPRITE_INFO_APOLUNE_SCREEN_05   ; SPRITE_INFO_APOLUNE_SCREEN_05
                                            ; [$PRG11::826a]
    pointer SPRITE_INFO_APOLUNE_SCREEN_06   ; SPRITE_INFO_APOLUNE_SCREEN_06
                                            ; [$PRG11::826c]
    pointer SPRITE_INFO_APOLUNE_SCREEN_07   ; SPRITE_INFO_APOLUNE_SCREEN_07
                                            ; [$PRG11::826e]
    pointer SPRITE_INFO_APOLUNE_SCREEN_08   ; SPRITE_INFO_APOLUNE_SCREEN_08
                                            ; [$PRG11::8270]
    pointer SPRITE_INFO_APOLUNE_SCREEN_09   ; SPRITE_INFO_APOLUNE_SCREEN_09
                                            ; [$PRG11::8272]
    pointer SPRITE_INFO_APOLUNE_SCREEN_10   ; SPRITE_INFO_APOLUNE_SCREEN_10
                                            ; [$PRG11::8274]
    pointer SPRITE_INFO_APOLUNE_SCREEN_11   ; SPRITE_INFO_APOLUNE_SCREEN_11
                                            ; [$PRG11::8276]
    pointer SPRITE_INFO_APOLUNE_SCREEN_12   ; SPRITE_INFO_APOLUNE_SCREEN_12
                                            ; [$PRG11::8278]
    pointer SPRITE_INFO_APOLUNE_SCREEN_13   ; SPRITE_INFO_APOLUNE_SCREEN_13
                                            ; [$PRG11::827a]
    pointer SPRITE_INFO_APOLUNE_SCREEN_14   ; SPRITE_INFO_APOLUNE_SCREEN_14
                                            ; [$PRG11::827c]
    pointer SPRITE_INFO_APOLUNE_SCREEN_15   ; SPRITE_INFO_APOLUNE_SCREEN_15
                                            ; [$PRG11::827e]
    pointer SPRITE_INFO_APOLUNE_SCREEN_16   ; SPRITE_INFO_APOLUNE_SCREEN_16
                                            ; [$PRG11::8280]
    pointer SPRITE_INFO_APOLUNE_SCREEN_17   ; SPRITE_INFO_APOLUNE_SCREEN_17
                                            ; [$PRG11::8282]
    pointer SPRITE_INFO_APOLUNE_SCREEN_18   ; SPRITE_INFO_APOLUNE_SCREEN_18
                                            ; [$PRG11::8284]
    pointer SPRITE_INFO_APOLUNE_SCREEN_19   ; SPRITE_INFO_APOLUNE_SCREEN_19
                                            ; [$PRG11::8286]
    pointer SPRITE_INFO_APOLUNE_SCREEN_20   ; SPRITE_INFO_APOLUNE_SCREEN_20
                                            ; [$PRG11::8288]
    pointer SPRITE_INFO_APOLUNE_SCREEN_21   ; SPRITE_INFO_APOLUNE_SCREEN_21
                                            ; [$PRG11::828a]
    pointer SPRITE_INFO_APOLUNE_SCREEN_22   ; SPRITE_INFO_APOLUNE_SCREEN_22
                                            ; [$PRG11::828c]
    pointer SPRITE_INFO_APOLUNE_SCREEN_23   ; SPRITE_INFO_APOLUNE_SCREEN_23
                                            ; [$PRG11::828e]
    pointer SPRITE_INFO_APOLUNE_SCREEN_24   ; SPRITE_INFO_APOLUNE_SCREEN_24
                                            ; [$PRG11::8290]
    pointer SPRITE_INFO_APOLUNE_SCREEN_25   ; SPRITE_INFO_APOLUNE_SCREEN_25
                                            ; [$PRG11::8292]
    pointer SPRITE_INFO_APOLUNE_SCREEN_26   ; SPRITE_INFO_APOLUNE_SCREEN_26
                                            ; [$PRG11::8294]
    pointer SPRITE_INFO_APOLUNE_SCREEN_27   ; SPRITE_INFO_APOLUNE_SCREEN_27
                                            ; [$PRG11::8296]
    pointer SPRITE_INFO_APOLUNE_SCREEN_28   ; SPRITE_INFO_APOLUNE_SCREEN_28
                                            ; [$PRG11::8298]
    pointer SPRITE_INFO_APOLUNE_SCREEN_29   ; SPRITE_INFO_APOLUNE_SCREEN_29
                                            ; [$PRG11::829a]
    pointer SPRITE_INFO_APOLUNE_SCREEN_30   ; SPRITE_INFO_APOLUNE_SCREEN_30
                                            ; [$PRG11::829c]
    pointer SPRITE_INFO_APOLUNE_SCREEN_31   ; SPRITE_INFO_APOLUNE_SCREEN_31
                                            ; [$PRG11::829e]
    pointer SPRITE_INFO_APOLUNE_SCREEN_32   ; SPRITE_INFO_APOLUNE_SCREEN_32
                                            ; [$PRG11::82a0]
    pointer SPRITE_INFO_APOLUNE_SCREEN_33   ; SPRITE_INFO_APOLUNE_SCREEN_33
                                            ; [$PRG11::82a2]
    pointer SPRITE_INFO_APOLUNE_SCREEN_34   ; SPRITE_INFO_APOLUNE_SCREEN_34
                                            ; [$PRG11::82a4]
    pointer SPRITE_INFO_APOLUNE_SCREEN_35   ; SPRITE_INFO_APOLUNE_SCREEN_35
                                            ; [$PRG11::82a6]
    pointer SPRITE_INFO_APOLUNE_SCREEN_36   ; SPRITE_INFO_APOLUNE_SCREEN_36
                                            ; [$PRG11::82a8]
    pointer SPRITE_INFO_APOLUNE_SCREEN_37   ; SPRITE_INFO_APOLUNE_SCREEN_37
                                            ; [$PRG11::82aa]
    pointer SPRITE_INFO_APOLUNE_SCREEN_38   ; SPRITE_INFO_APOLUNE_SCREEN_38
                                            ; [$PRG11::82ac]
    pointer SPRITE_INFO_APOLUNE_SCREEN_39   ; SPRITE_INFO_APOLUNE_SCREEN_39
                                            ; [$PRG11::82ae]
    pointer SPRITE_INFO_APOLUNE_SCREEN_40   ; SPRITE_INFO_APOLUNE_SCREEN_40
                                            ; [$PRG11::82b0]
    pointer SPRITE_INFO_APOLUNE_SCREEN_41   ; SPRITE_INFO_APOLUNE_SCREEN_41
                                            ; [$PRG11::82b2]
    pointer SPRITE_INFO_APOLUNE_SCREEN_42   ; SPRITE_INFO_APOLUNE_SCREEN_42
                                            ; [$PRG11::82b4]
    pointer SPRITE_INFO_APOLUNE_SCREEN_43   ; SPRITE_INFO_APOLUNE_SCREEN_43
                                            ; [$PRG11::82b6]
    pointer SPRITE_INFO_APOLUNE_SCREEN_44   ; SPRITE_INFO_APOLUNE_SCREEN_44
                                            ; [$PRG11::82b8]
    pointer SPRITE_INFO_APOLUNE_SCREEN_45   ; SPRITE_INFO_APOLUNE_SCREEN_45
                                            ; [$PRG11::82ba]
    pointer SPRITE_INFO_APOLUNE_SCREEN_46   ; SPRITE_INFO_APOLUNE_SCREEN_46
                                            ; [$PRG11::82bc]
    pointer SPRITE_INFO_APOLUNE_SCREEN_47   ; SPRITE_INFO_APOLUNE_SCREEN_47
                                            ; [$PRG11::82be]
    pointer SPRITE_INFO_APOLUNE_SCREEN_48   ; SPRITE_INFO_APOLUNE_SCREEN_48
                                            ; [$PRG11::82c0]
    pointer SPRITE_INFO_APOLUNE_SCREEN_49   ; SPRITE_INFO_APOLUNE_SCREEN_49
                                            ; [$PRG11::82c2]
    pointer SPRITE_INFO_APOLUNE_SCREEN_50   ; SPRITE_INFO_APOLUNE_SCREEN_50
                                            ; [$PRG11::82c4]
    pointer SPRITE_INFO_APOLUNE_SCREEN_51   ; SPRITE_INFO_APOLUNE_SCREEN_51
                                            ; [$PRG11::82c6]
    pointer SPRITE_INFO_APOLUNE_SCREEN_52   ; SPRITE_INFO_APOLUNE_SCREEN_52
                                            ; [$PRG11::82c8]
    pointer SPRITE_INFO_APOLUNE_SCREEN_53   ; SPRITE_INFO_APOLUNE_SCREEN_53
                                            ; [$PRG11::82ca]
    pointer SPRITE_INFO_APOLUNE_SCREEN_54   ; SPRITE_INFO_APOLUNE_SCREEN_54
                                            ; [$PRG11::82cc]
    pointer SPRITE_INFO_APOLUNE_SCREEN_55   ; SPRITE_INFO_APOLUNE_SCREEN_55
                                            ; [$PRG11::82ce]
    pointer SPRITE_INFO_APOLUNE_SCREEN_56   ; SPRITE_INFO_APOLUNE_SCREEN_56
                                            ; [$PRG11::82d0]
    pointer SPRITE_INFO_APOLUNE_SCREEN_57   ; SPRITE_INFO_APOLUNE_SCREEN_57
                                            ; [$PRG11::82d2]
    pointer SPRITE_INFO_APOLUNE_SCREEN_58   ; SPRITE_INFO_APOLUNE_SCREEN_58
                                            ; [$PRG11::82d4]
    pointer SPRITE_INFO_APOLUNE_SCREEN_59   ; SPRITE_INFO_APOLUNE_SCREEN_59
                                            ; [$PRG11::82d6]
    pointer SPRITE_INFO_APOLUNE_SCREEN_60   ; SPRITE_INFO_APOLUNE_SCREEN_60
                                            ; [$PRG11::82d8]
    pointer SPRITE_INFO_APOLUNE_SCREEN_61   ; SPRITE_INFO_APOLUNE_SCREEN_61
                                            ; [$PRG11::82da]
    pointer SPRITE_INFO_APOLUNE_SCREEN_62   ; SPRITE_INFO_APOLUNE_SCREEN_62
                                            ; [$PRG11::82dc]
    pointer SPRITE_INFO_APOLUNE_SCREEN_63   ; SPRITE_INFO_APOLUNE_SCREEN_63
                                            ; [$PRG11::82de]

;
; XREFS:
;     SPRITE_INFO_APOLUNE [$PRG11::8260]
;
SPRITE_INFO_APOLUNE_SCREEN_00:              ; [$82e0]
    .byte SPRITE_ENEMY_MONODRON             ; [$82e0] SpriteEntity
    .byte $a8,$ff,$ff                       ; [$82e1] byte

SPRITE_INFO_APOLUNE_SCREEN_01:              ; [$82e4]
    .byte SPRITE_ENEMY_MONODRON             ; [$82e4] SpriteEntity
    .byte $14                               ; [$82e5] byte

    .byte SPRITE_ENEMY_MONODRON
    .byte $a8,$ff,$ff                       ; [$82e7] byte

SPRITE_INFO_APOLUNE_SCREEN_02:              ; [$82ea]
    .byte SPRITE_ENEMY_MONODRON             ; [$82ea] SpriteEntity
    .byte $18                               ; [$82eb] byte

    .byte SPRITE_ENEMY_ZOZURA
    .byte $b6                               ; [$82ed] byte

    .byte SPRITE_ENEMY_ZOZURA
    .byte $ba,$ff,$ff                       ; [$82ef] byte

SPRITE_INFO_APOLUNE_SCREEN_03:              ; [$82f2]
    .byte SPRITE_ENEMY_ZOZURA               ; [$82f2] SpriteEntity
    .byte $ba                               ; [$82f3] byte

    .byte SPRITE_ENEMY_MONODRON
    .byte $a5,$ff,$ff                       ; [$82f5] byte

SPRITE_INFO_APOLUNE_SCREEN_04:              ; [$82f8]
    .byte SPRITE_ENEMY_MONODRON             ; [$82f8] SpriteEntity
    .byte $a4                               ; [$82f9] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $b4,$ff,$ff                       ; [$82fb] undefined

SPRITE_INFO_APOLUNE_SCREEN_05:              ; [$82fe]
    .byte SPRITE_ENEMY_MONODRON             ; [$82fe] SpriteEntity
    .byte $a6                               ; [$82ff] undefined

    .byte SPRITE_ENEMY_MONODRON
    .byte $aa,$ff,$ff                       ; [$8301] undefined

SPRITE_INFO_APOLUNE_SCREEN_06:              ; [$8304]
    .byte SPRITE_ENEMY_ZOMBIE               ; [$8304] SpriteEntity
    .byte $a6                               ; [$8305] undefined

    .byte SPRITE_ENEMY_ZOMBIE
    .byte $5b,$ff,$ff                       ; [$8307] undefined

SPRITE_INFO_APOLUNE_SCREEN_07:              ; [$830a]
    .byte SPRITE_ENEMY_ZOMBIE               ; [$830a] SpriteEntity
    .byte $a5                               ; [$830b] byte

    .byte SPRITE_ENEMY_ZOZURA
    .byte $ba,$ff                           ; [$830d] byte

SPRITE_INFO_APOLUNE_SCREEN_08:              ; [$830f]
    .byte SPRITE_ENEMY_MONODRON             ; [$830f] SpriteEntity
    .byte $25                               ; [$8310] byte

    .byte SPRITE_ENEMY_ZOMBIE
    .byte $aa,$ff,$ff                       ; [$8312] byte

SPRITE_INFO_APOLUNE_SCREEN_09:              ; [$8315]
    .byte SPRITE_ENEMY_MONODRON             ; [$8315] SpriteEntity
    .byte $aa                               ; [$8316] undefined

    .byte SPRITE_ENEMY_MONODRON
    .byte $a5,$ff,$ff                       ; [$8318] undefined

SPRITE_INFO_APOLUNE_SCREEN_10:              ; [$831b]
    .byte SPRITE_ENEMY_MONODRON             ; [$831b] SpriteEntity
    .byte $a8                               ; [$831c] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $bb,$ff,$ff                       ; [$831e] undefined

SPRITE_INFO_APOLUNE_SCREEN_11:              ; [$8321]
    .byte SPRITE_ENEMY_MONODRON             ; [$8321] SpriteEntity
    .byte $ab                               ; [$8322] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $b6,$ff,$ff                       ; [$8324] undefined

SPRITE_INFO_APOLUNE_SCREEN_12:              ; [$8327]
    .byte SPRITE_OBJ_RED_POTION             ; [$8327] SpriteEntity
    .byte $3b                               ; [$8328] undefined

    .byte SPRITE_ENEMY_MONODRON
    .byte $48                               ; [$832a] undefined

    .byte SPRITE_ENEMY_MONODRON
    .byte $ad,$ff,$ff                       ; [$832c] undefined

SPRITE_INFO_APOLUNE_SCREEN_13:              ; [$832f]
    .byte SPRITE_ENEMY_MONODRON             ; [$832f] SpriteEntity
    .byte $9a                               ; [$8330] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $52                               ; [$8332] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $5e,$ff,$ff                       ; [$8334] undefined

SPRITE_INFO_APOLUNE_SCREEN_14:              ; [$8337]
    .byte SPRITE_OBJ_MATTOCK1               ; [$8337] SpriteEntity
    .byte $5d                               ; [$8338] undefined

    .byte SPRITE_ENEMY_MONODRON
    .byte $9a                               ; [$833a] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $58                               ; [$833c] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $5d,$ff,$ff                       ; [$833e] undefined

SPRITE_INFO_APOLUNE_SCREEN_15:              ; [$8341]
    .byte SPRITE_ENEMY_MONODRON             ; [$8341] SpriteEntity
    .byte $9a                               ; [$8342] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $46,$ff,$ff                       ; [$8344] undefined

SPRITE_INFO_APOLUNE_SCREEN_16:              ; [$8347]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$8347] SpriteEntity
    .byte $9a,$ff,$ff                       ; [$8348] undefined

SPRITE_INFO_APOLUNE_SCREEN_17:              ; [$834b]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$834b] SpriteEntity
    .byte $9a,$ff,$ff                       ; [$834c] undefined

SPRITE_INFO_APOLUNE_SCREEN_18:              ; [$834f]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$834f] SpriteEntity
    .byte $9a                               ; [$8350] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $45,$ff,$ff                       ; [$8352] undefined

SPRITE_INFO_APOLUNE_SCREEN_19:              ; [$8355]
    .byte SPRITE_OBJ_HOUR_GLASS             ; [$8355] SpriteEntity
    .byte $4d                               ; [$8356] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $7a                               ; [$8358] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $4b                               ; [$835a] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $89,$ff,$ff                       ; [$835c] undefined

SPRITE_INFO_APOLUNE_SCREEN_20:              ; [$835f]
    .byte SPRITE_ENEMY_IKEDA                ; [$835f] SpriteEntity
    .byte $7a                               ; [$8360] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $a6                               ; [$8362] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $ac,$ff,$ff                       ; [$8364] undefined

SPRITE_INFO_APOLUNE_SCREEN_21:              ; [$8367]
    .byte SPRITE_OBJ_MATTOCK2               ; [$8367] SpriteEntity
    .byte $ae                               ; [$8368] undefined

    .byte SPRITE_BOSS_RIPASHEIKU
    .byte $4b,$ff,$ff                       ; [$836a] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; CurrentScreen_SpecialEventID

SPRITE_INFO_APOLUNE_SCREEN_22:              ; [$836f]
    .byte SPRITE_ENEMY_MONODRON             ; [$836f] SpriteEntity
    .byte $9c                               ; [$8370] undefined

    .byte SPRITE_ENEMY_MYCONID
    .byte $46,$ff,$ff                       ; [$8372] undefined

SPRITE_INFO_APOLUNE_SCREEN_23:              ; [$8375]
    .byte SPRITE_ENEMY_MONODRON             ; [$8375] SpriteEntity
    .byte $9a                               ; [$8376] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $35                               ; [$8378] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $5f,$ff,$ff                       ; [$837a] undefined

SPRITE_INFO_APOLUNE_SCREEN_24:              ; [$837d]
    .byte SPRITE_ENEMY_MYCONID              ; [$837d] SpriteEntity
    .byte $9c                               ; [$837e] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $55                               ; [$8380] undefined

    .byte SPRITE_OBJ_GLOVE_2
    .byte $31,$ff,$ff                       ; [$8382] undefined

SPRITE_INFO_APOLUNE_SCREEN_25:              ; [$8385]
    .byte SPRITE_ENEMY_MYCONID              ; [$8385] SpriteEntity
    .byte $98                               ; [$8386] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $4d,$ff,$ff                       ; [$8388] undefined

SPRITE_INFO_APOLUNE_SCREEN_26:              ; [$838b]
    .byte SPRITE_ENEMY_YUINARU              ; [$838b] SpriteEntity
    .byte $28                               ; [$838c] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $99,$ff,$ff                       ; [$838e] undefined

SPRITE_INFO_APOLUNE_SCREEN_28:              ; [$8391]
    .byte SPRITE_ENEMY_CHARRON              ; [$8391] SpriteEntity
    .byte $25                               ; [$8392] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $98,$ff,$ff                       ; [$8394] undefined

SPRITE_INFO_APOLUNE_SCREEN_29:              ; [$8397]
    .byte SPRITE_OBJ_OINTMENT               ; [$8397] SpriteEntity
    .byte $41                               ; [$8398] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $99                               ; [$839a] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $cc                               ; [$839c] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $55,$ff,$ff                       ; [$839e] undefined

SPRITE_INFO_APOLUNE_SCREEN_30:              ; [$83a1]
    .byte SPRITE_ENEMY_CHARRON              ; [$83a1] SpriteEntity
    .byte $99                               ; [$83a2] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $3b,$ff,$ff                       ; [$83a4] undefined

SPRITE_INFO_APOLUNE_SCREEN_31:              ; [$83a7]
    .byte SPRITE_ENEMY_IKEDA                ; [$83a7] SpriteEntity
    .byte $99                               ; [$83a8] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $95,$ff,$ff                       ; [$83aa] undefined

SPRITE_INFO_APOLUNE_SCREEN_32:              ; [$83ad]
    .byte SPRITE_ENEMY_IKEDA                ; [$83ad] SpriteEntity
    .byte $99                               ; [$83ae] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $95,$ff,$ff                       ; [$83b0] undefined

SPRITE_INFO_APOLUNE_SCREEN_33:              ; [$83b3]
    .byte SPRITE_OBJ_RED_POTION             ; [$83b3] SpriteEntity
    .byte $7e                               ; [$83b4] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $88,$ff,$ff                       ; [$83b6] undefined

SPRITE_INFO_APOLUNE_SCREEN_34:              ; [$83b9]
    .byte SPRITE_OBJ_RED_POTION_2           ; [$83b9] SpriteEntity
    .byte $6e                               ; [$83ba] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $55                               ; [$83bc] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $7b,$ff,$ff                       ; [$83be] undefined

SPRITE_INFO_APOLUNE_SCREEN_39:              ; [$83c1]
    .byte SPRITE_ENEMY_CHARRON              ; [$83c1] SpriteEntity
    .byte $95                               ; [$83c2] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $38,$ff,$ff                       ; [$83c4] undefined

SPRITE_INFO_APOLUNE_SCREEN_35:              ; [$83c7]
    .byte SPRITE_ENEMY_YUINARU              ; [$83c7] SpriteEntity
    .byte $35                               ; [$83c8] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $58                               ; [$83ca] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $8f,$ff,$ff                       ; [$83cc] undefined

SPRITE_INFO_APOLUNE_SCREEN_36:              ; [$83cf]
    .byte SPRITE_ENEMY_CHARRON              ; [$83cf] SpriteEntity
    .byte $89                               ; [$83d0] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $35,$ff,$ff                       ; [$83d2] undefined

SPRITE_INFO_APOLUNE_SCREEN_38:              ; [$83d5]
    .byte SPRITE_ENEMY_CHARRON              ; [$83d5] SpriteEntity
    .byte $34                               ; [$83d6] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $75,$ff,$ff                       ; [$83d8] undefined

SPRITE_INFO_APOLUNE_SCREEN_37:              ; [$83db]
    .byte SPRITE_NPC_MAGIC_TEACHER          ; [$83db] SpriteEntity
    .byte $4b,$62,$38,$ff,$25,$ff           ; [$83dc] undefined

SPRITE_INFO_APOLUNE_SCREEN_61:              ; [$83e2]
    .byte SPRITE_NPC_MAGIC_TEACHER          ; [$83e2] SpriteEntity
    .byte $2a,$61,$1b,$ff                   ; [$83e3] undefined

    .byte $26
    .byte $ff                               ; [$83e8] undefined

SPRITE_INFO_APOLUNE_SCREEN_63:              ; [$83e9]
    .byte SPRITE_NPC_MAGIC_TEACHER          ; [$83e9] SpriteEntity
    .byte $99,$63,$8a,$ff                   ; [$83ea] undefined

    .byte $27
    .byte $ff                               ; [$83ef] undefined

SPRITE_INFO_APOLUNE_SCREEN_40:              ; [$83f0]
    .byte SPRITE_EFFECT_FOUNTAIN            ; [$83f0] SpriteEntity
    .byte $55,$ff,$ff                       ; [$83f1] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_PATH_TO_MASCON       ; CurrentScreen_SpecialEventID

SPRITE_INFO_APOLUNE_SCREEN_41:              ; [$83f6]
    .byte SPRITE_OBJ_POISON_2               ; [$83f6] SpriteEntity
    .byte $31                               ; [$83f7] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $99                               ; [$83f9] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $96,$ff,$ff                       ; [$83fb] undefined

SPRITE_INFO_APOLUNE_SCREEN_42:              ; [$83fe]
    .byte SPRITE_ENEMY_CHARRON              ; [$83fe] SpriteEntity
    .byte $99,$ff,$ff                       ; [$83ff] undefined

SPRITE_INFO_APOLUNE_SCREEN_43:              ; [$8402]
    .byte SPRITE_ENEMY_CHARRON              ; [$8402] SpriteEntity
    .byte $35                               ; [$8403] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $3b,$ff,$ff                       ; [$8405] undefined

SPRITE_INFO_APOLUNE_SCREEN_44:              ; [$8408]
    .byte SPRITE_ENEMY_MYCONID              ; [$8408] SpriteEntity
    .byte $99                               ; [$8409] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $6a                               ; [$840b] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $53,$ff,$ff                       ; [$840d] undefined

SPRITE_INFO_APOLUNE_SCREEN_45:              ; [$8410]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$8410] SpriteEntity
    .byte $41                               ; [$8411] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $89                               ; [$8413] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $12                               ; [$8415] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $6c,$ff,$ff                       ; [$8417] undefined

SPRITE_INFO_APOLUNE_SCREEN_46:              ; [$841a]
    .byte SPRITE_BOSS_RIPASHEIKU            ; [$841a] SpriteEntity
    .byte $64,$ff,$ff                       ; [$841b] undefined

SPRITE_INFO_APOLUNE_SCREEN_47:              ; [$841e]
    .byte SPRITE_ENEMY_MYCONID              ; [$841e] SpriteEntity
    .byte $39                               ; [$841f] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $99,$ff,$ff                       ; [$8421] undefined

SPRITE_INFO_APOLUNE_SCREEN_48:              ; [$8424]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$8424] SpriteEntity
    .byte $99                               ; [$8425] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $45,$ff,$ff                       ; [$8427] undefined

SPRITE_INFO_APOLUNE_SCREEN_49:              ; [$842a]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$842a] SpriteEntity
    .byte $99                               ; [$842b] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $45,$ff,$ff                       ; [$842d] undefined

SPRITE_INFO_APOLUNE_SCREEN_50:              ; [$8430]
    .byte SPRITE_ENEMY_CHARRON              ; [$8430] SpriteEntity
    .byte $99                               ; [$8431] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $23,$ff,$ff                       ; [$8433] undefined

SPRITE_INFO_APOLUNE_SCREEN_51:              ; [$8436]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$8436] SpriteEntity
    .byte $94                               ; [$8437] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $45,$ff,$ff                       ; [$8439] undefined

SPRITE_INFO_APOLUNE_SCREEN_52:              ; [$843c]
    .byte SPRITE_ENEMY_IKEDA                ; [$843c] SpriteEntity
    .byte $99                               ; [$843d] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $21,$ff,$ff                       ; [$843f] undefined

SPRITE_INFO_APOLUNE_SCREEN_53:              ; [$8442]
    .byte SPRITE_OBJ_POISON_2               ; [$8442] SpriteEntity
    .byte $a2                               ; [$8443] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $93                               ; [$8445] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $45,$ff,$ff                       ; [$8447] undefined

SPRITE_INFO_APOLUNE_SCREEN_54:              ; [$844a]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$844a] SpriteEntity
    .byte $9e                               ; [$844b] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $45,$ff,$ff                       ; [$844d] undefined

SPRITE_INFO_APOLUNE_SCREEN_55:              ; [$8450]
    .byte SPRITE_OBJ_OINTMENT_2             ; [$8450] SpriteEntity
    .byte $33                               ; [$8451] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $95,$ff,$ff                       ; [$8453] undefined

SPRITE_INFO_APOLUNE_SCREEN_56:              ; [$8456]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$8456] SpriteEntity
    .byte $79                               ; [$8457] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $76,$ff,$ff                       ; [$8459] undefined

SPRITE_INFO_APOLUNE_SCREEN_57:              ; [$845c]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$845c] SpriteEntity
    .byte $97                               ; [$845d] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $4a,$ff,$ff                       ; [$845f] undefined

SPRITE_INFO_APOLUNE_SCREEN_58:              ; [$8462]
    .byte SPRITE_BOSS_BORABOHRA             ; [$8462] SpriteEntity
    .byte $8a                               ; [$8463] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $45                               ; [$8465] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $28,$ff,$ff                       ; [$8467] undefined

SPRITE_INFO_APOLUNE_SCREEN_59:              ; [$846a]
    .byte SPRITE_OBJ_WING_BOOTS_QUEST       ; [$846a] SpriteEntity
    .byte $3d                               ; [$846b] undefined

    .byte SPRITE_BOSS_ZORUGERIRU
    .byte $2c,$ff,$ff                       ; [$846d] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; CurrentScreen_SpecialEventID

SPRITE_INFO_APOLUNE_SCREEN_60:              ; [$8472]
    .byte SPRITE_OBJ_ELIXIR                 ; [$8472] SpriteEntity
    .byte $32                               ; [$8473] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $15                               ; [$8475] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $3c                               ; [$8477] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $89,$ff,$ff                       ; [$8479] undefined

SPRITE_INFO_APOLUNE_SCREEN_62:              ; [$847c]
    .byte SPRITE_BOSS_RIPASHEIKU            ; [$847c] SpriteEntity
    .byte $69,$ff,$ff                       ; [$847d] undefined

SPRITE_INFO_APOLUNE_SCREEN_27:              ; [$8480]
    .byte $ff,$ff                           ; [$8480] undefined


;============================================================================
; Forepaw Sprite Information
;============================================================================
SPRITE_INFO_FOREPAW:                        ; [$8482]
    pointer SPRITE_INFO_FOREPAW_SCREEN_00   ; SPRITE_INFO_FOREPAW_SCREEN_00
                                            ; [$PRG11::8482]
    pointer SPRITE_INFO_FOREPAW_SCREEN_01   ; SPRITE_INFO_FOREPAW_SCREEN_01
                                            ; [$PRG11::8484]
    pointer SPRITE_INFO_FOREPAW_SCREEN_02   ; SPRITE_INFO_FOREPAW_SCREEN_02
                                            ; [$PRG11::8486]
    pointer SPRITE_INFO_FOREPAW_SCREEN_03   ; SPRITE_INFO_FOREPAW_SCREEN_03
                                            ; [$PRG11::8488]
    pointer SPRITE_INFO_FOREPAW_SCREEN_04   ; SPRITE_INFO_FOREPAW_SCREEN_04
                                            ; [$PRG11::848a]
    pointer SPRITE_INFO_FOREPAW_SCREEN_05   ; SPRITE_INFO_FOREPAW_SCREEN_05
                                            ; [$PRG11::848c]
    pointer SPRITE_INFO_FOREPAW_SCREEN_06   ; SPRITE_INFO_FOREPAW_SCREEN_06
                                            ; [$PRG11::848e]
    pointer SPRITE_INFO_FOREPAW_SCREEN_07   ; SPRITE_INFO_FOREPAW_SCREEN_07
                                            ; [$PRG11::8490]
    pointer SPRITE_INFO_FOREPAW_SCREEN_08   ; SPRITE_INFO_FOREPAW_SCREEN_08
                                            ; [$PRG11::8492]
    pointer SPRITE_INFO_FOREPAW_SCREEN_09   ; SPRITE_INFO_FOREPAW_SCREEN_09
                                            ; [$PRG11::8494]
    pointer SPRITE_INFO_FOREPAW_SCREEN_10_11 ; SPRITE_INFO_FOREPAW_SCREEN_10_11
                                             ; [$PRG11::8496]
    pointer SPRITE_INFO_FOREPAW_SCREEN_10_11 ; SPRITE_INFO_FOREPAW_SCREEN_10_11
                                             ; [$PRG11::8498]
    pointer SPRITE_INFO_FOREPAW_SCREEN_12   ; SPRITE_INFO_FOREPAW_SCREEN_12
                                            ; [$PRG11::849a]
    pointer SPRITE_INFO_FOREPAW_SCREEN_13   ; SPRITE_INFO_FOREPAW_SCREEN_13
                                            ; [$PRG11::849c]
    pointer SPRITE_INFO_FOREPAW_SCREEN_14   ; SPRITE_INFO_FOREPAW_SCREEN_14
                                            ; [$PRG11::849e]
    pointer SPRITE_INFO_FOREPAW_SCREEN_15   ; SPRITE_INFO_FOREPAW_SCREEN_15
                                            ; [$PRG11::84a0]
    pointer SPRITE_INFO_FOREPAW_SCREEN_16   ; SPRITE_INFO_FOREPAW_SCREEN_16
                                            ; [$PRG11::84a2]
    pointer SPRITE_INFO_FOREPAW_SCREEN_17   ; SPRITE_INFO_FOREPAW_SCREEN_17
                                            ; [$PRG11::84a4]
    pointer SPRITE_INFO_FOREPAW_SCREEN_18   ; SPRITE_INFO_FOREPAW_SCREEN_18
                                            ; [$PRG11::84a6]
    pointer SPRITE_INFO_FOREPAW_SCREEN_19   ; SPRITE_INFO_FOREPAW_SCREEN_19
                                            ; [$PRG11::84a8]
    pointer SPRITE_INFO_FOREPAW_SCREEN_20   ; SPRITE_INFO_FOREPAW_SCREEN_20
                                            ; [$PRG11::84aa]
    pointer SPRITE_INFO_FOREPAW_SCREEN_21   ; SPRITE_INFO_FOREPAW_SCREEN_21
                                            ; [$PRG11::84ac]
    pointer SPRITE_INFO_FOREPAW_SCREEN_22   ; SPRITE_INFO_FOREPAW_SCREEN_22
                                            ; [$PRG11::84ae]
    pointer SPRITE_INFO_FOREPAW_SCREEN_23   ; SPRITE_INFO_FOREPAW_SCREEN_23
                                            ; [$PRG11::84b0]
    pointer SPRITE_INFO_FOREPAW_SCREEN_24   ; SPRITE_INFO_FOREPAW_SCREEN_24
                                            ; [$PRG11::84b2]
    pointer SPRITE_INFO_FOREPAW_SCREEN_25   ; SPRITE_INFO_FOREPAW_SCREEN_25
                                            ; [$PRG11::84b4]
    pointer SPRITE_INFO_FOREPAW_SCREEN_26   ; SPRITE_INFO_FOREPAW_SCREEN_26
                                            ; [$PRG11::84b6]
    pointer SPRITE_INFO_FOREPAW_SCREEN_27   ; SPRITE_INFO_FOREPAW_SCREEN_27
                                            ; [$PRG11::84b8]
    pointer SPRITE_INFO_FOREPAW_SCREEN_28   ; SPRITE_INFO_FOREPAW_SCREEN_28
                                            ; [$PRG11::84ba]
    pointer SPRITE_INFO_FOREPAW_SCREEN_29   ; SPRITE_INFO_FOREPAW_SCREEN_29
                                            ; [$PRG11::84bc]
    pointer SPRITE_INFO_FOREPAW_SCREEN_30   ; SPRITE_INFO_FOREPAW_SCREEN_30
                                            ; [$PRG11::84be]
    pointer SPRITE_INFO_FOREPAW_SCREEN_31   ; SPRITE_INFO_FOREPAW_SCREEN_31
                                            ; [$PRG11::84c0]
    pointer SPRITE_INFO_FOREPAW_SCREEN_32   ; SPRITE_INFO_FOREPAW_SCREEN_32
                                            ; [$PRG11::84c2]
    pointer SPRITE_INFO_FOREPAW_SCREEN_33   ; SPRITE_INFO_FOREPAW_SCREEN_33
                                            ; [$PRG11::84c4]
    pointer SPRITE_INFO_FOREPAW_SCREEN_34   ; SPRITE_INFO_FOREPAW_SCREEN_34
                                            ; [$PRG11::84c6]
    pointer SPRITE_INFO_FOREPAW_SCREEN_35_36 ; SPRITE_INFO_FOREPAW_SCREEN_35_36
                                             ; [$PRG11::84c8]
    pointer SPRITE_INFO_FOREPAW_SCREEN_35_36 ; SPRITE_INFO_FOREPAW_SCREEN_35_36
                                             ; [$PRG11::84ca]
    pointer SPRITE_INFO_FOREPAW_SCREEN_37   ; SPRITE_INFO_FOREPAW_SCREEN_37
                                            ; [$PRG11::84cc]
    pointer SPRITE_INFO_FOREPAW_SCREEN_38   ; SPRITE_INFO_FOREPAW_SCREEN_38
                                            ; [$PRG11::84ce]
    pointer SPRITE_INFO_FOREPAW_SCREEN_39   ; SPRITE_INFO_FOREPAW_SCREEN_39
                                            ; [$PRG11::84d0]
    pointer SPRITE_INFO_FOREPAW_SCREEN_40   ; SPRITE_INFO_FOREPAW_SCREEN_40
                                            ; [$PRG11::84d2]
    pointer SPRITE_INFO_FOREPAW_SCREEN_41   ; SPRITE_INFO_FOREPAW_SCREEN_41
                                            ; [$PRG11::84d4]
    pointer SPRITE_INFO_FOREPAW_SCREEN_42   ; SPRITE_INFO_FOREPAW_SCREEN_42
                                            ; [$PRG11::84d6]
    pointer SPRITE_INFO_FOREPAW_SCREEN_43   ; SPRITE_INFO_FOREPAW_SCREEN_43
                                            ; [$PRG11::84d8]
    pointer SPRITE_INFO_FOREPAW_SCREEN_44   ; SPRITE_INFO_FOREPAW_SCREEN_44
                                            ; [$PRG11::84da]
    pointer SPRITE_INFO_FOREPAW_SCREEN_45   ; SPRITE_INFO_FOREPAW_SCREEN_45
                                            ; [$PRG11::84dc]
    pointer SPRITE_INFO_FOREPAW_SCREEN_46   ; SPRITE_INFO_FOREPAW_SCREEN_46
                                            ; [$PRG11::84de]
    pointer SPRITE_INFO_FOREPAW_SCREEN_47   ; SPRITE_INFO_FOREPAW_SCREEN_47
                                            ; [$PRG11::84e0]
    pointer SPRITE_INFO_FOREPAW_SCREEN_48   ; SPRITE_INFO_FOREPAW_SCREEN_48
                                            ; [$PRG11::84e2]
    pointer SPRITE_INFO_FOREPAW_SCREEN_49   ; SPRITE_INFO_FOREPAW_SCREEN_49
                                            ; [$PRG11::84e4]
    pointer SPRITE_INFO_FOREPAW_SCREEN_50   ; SPRITE_INFO_FOREPAW_SCREEN_50
                                            ; [$PRG11::84e6]
    pointer SPRITE_INFO_FOREPAW_SCREEN_51   ; SPRITE_INFO_FOREPAW_SCREEN_51
                                            ; [$PRG11::84e8]
    pointer SPRITE_INFO_FOREPAW_SCREEN_52   ; SPRITE_INFO_FOREPAW_SCREEN_52
                                            ; [$PRG11::84ea]
    pointer SPRITE_INFO_FOREPAW_SCREEN_53   ; SPRITE_INFO_FOREPAW_SCREEN_53
                                            ; [$PRG11::84ec]
    pointer SPRITE_INFO_FOREPAW_SCREEN_54   ; SPRITE_INFO_FOREPAW_SCREEN_54
                                            ; [$PRG11::84ee]
    pointer SPRITE_INFO_FOREPAW_SCREEN_55   ; SPRITE_INFO_FOREPAW_SCREEN_55
                                            ; [$PRG11::84f0]
    pointer SPRITE_INFO_FOREPAW_SCREEN_56   ; SPRITE_INFO_FOREPAW_SCREEN_56
                                            ; [$PRG11::84f2]
    pointer SPRITE_INFO_FOREPAW_SCREEN_57   ; SPRITE_INFO_FOREPAW_SCREEN_57
                                            ; [$PRG11::84f4]
    pointer SPRITE_INFO_FOREPAW_SCREEN_58   ; SPRITE_INFO_FOREPAW_SCREEN_58
                                            ; [$PRG11::84f6]
    pointer SPRITE_INFO_FOREPAW_SCREEN_59   ; SPRITE_INFO_FOREPAW_SCREEN_59
                                            ; [$PRG11::84f8]
    pointer SPRITE_INFO_FOREPAW_SCREEN_60   ; SPRITE_INFO_FOREPAW_SCREEN_60
                                            ; [$PRG11::84fa]
    pointer SPRITE_INFO_FOREPAW_SCREEN_61   ; SPRITE_INFO_FOREPAW_SCREEN_61
                                            ; [$PRG11::84fc]
    pointer SPRITE_INFO_FOREPAW_SCREEN_62   ; SPRITE_INFO_FOREPAW_SCREEN_62
                                            ; [$PRG11::84fe]
    pointer SPRITE_INFO_FOREPAW_SCREEN_63   ; SPRITE_INFO_FOREPAW_SCREEN_63
                                            ; [$PRG11::8500]
    pointer SPRITE_INFO_FOREPAW_SCREEN_64   ; SPRITE_INFO_FOREPAW_SCREEN_64
                                            ; [$PRG11::8502]
    pointer SPRITE_INFO_FOREPAW_SCREEN_65   ; SPRITE_INFO_FOREPAW_SCREEN_65
                                            ; [$PRG11::8504]
    pointer SPRITE_INFO_FOREPAW_SCREEN_66   ; SPRITE_INFO_FOREPAW_SCREEN_66
                                            ; [$PRG11::8506]
    pointer SPRITE_INFO_FOREPAW_SCREEN_67   ; SPRITE_INFO_FOREPAW_SCREEN_67
                                            ; [$PRG11::8508]
    pointer SPRITE_INFO_FOREPAW_SCREEN_68   ; SPRITE_INFO_FOREPAW_SCREEN_68
                                            ; [$PRG11::850a]
    pointer SPRITE_INFO_FOREPAW_SCREEN_69   ; SPRITE_INFO_FOREPAW_SCREEN_69
                                            ; [$PRG11::850c]
    pointer SPRITE_INFO_FOREPAW_SCREEN_70   ; SPRITE_INFO_FOREPAW_SCREEN_70
                                            ; [$PRG11::850e]
    pointer SPRITE_INFO_FOREPAW_SCREEN_71   ; SPRITE_INFO_FOREPAW_SCREEN_71
                                            ; [$PRG11::8510]
    pointer SPRITE_INFO_FOREPAW_SCREEN_72   ; SPRITE_INFO_FOREPAW_SCREEN_72
                                            ; [$PRG11::8512]
    pointer SPRITE_INFO_FOREPAW_SCREEN_73   ; SPRITE_INFO_FOREPAW_SCREEN_73
                                            ; [$PRG11::8514]
    pointer SPRITE_INFO_FOREPAW_SCREEN_74   ; SPRITE_INFO_FOREPAW_SCREEN_74
                                            ; [$PRG11::8516]
    pointer SPRITE_INFO_FOREPAW_SCREEN_75   ; SPRITE_INFO_FOREPAW_SCREEN_75
                                            ; [$PRG11::8518]
    pointer SPRITE_INFO_FOREPAW_SCREEN_76   ; SPRITE_INFO_FOREPAW_SCREEN_76
                                            ; [$PRG11::851a]
    pointer SPRITE_INFO_FOREPAW_SCREEN_77   ; SPRITE_INFO_FOREPAW_SCREEN_77
                                            ; [$PRG11::851c]
    pointer SPRITE_INFO_FOREPAW_SCREEN_78   ; SPRITE_INFO_FOREPAW_SCREEN_78
                                            ; [$PRG11::851e]
    pointer SPRITE_INFO_FOREPAW_SCREEN_79   ; SPRITE_INFO_FOREPAW_SCREEN_79
                                            ; [$PRG11::8520]
    pointer SPRITE_INFO_FOREPAW_SCREEN_80   ; SPRITE_INFO_FOREPAW_SCREEN_80
                                            ; [$PRG11::8522]
    pointer SPRITE_INFO_FOREPAW_SCREEN_81   ; SPRITE_INFO_FOREPAW_SCREEN_81
                                            ; [$PRG11::8524]
    pointer SPRITE_INFO_FOREPAW_SCREEN_82   ; SPRITE_INFO_FOREPAW_SCREEN_82
                                            ; [$PRG11::8526]

;
; XREFS:
;     SPRITE_INFO_FOREPAW [$PRG11::8482]
;
SPRITE_INFO_FOREPAW_SCREEN_00:              ; [$8528]
    .byte SPRITE_ENEMY_NAGA                 ; [$8528] SpriteEntity
    .byte $85                               ; [$8529] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $43                               ; [$852b] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $2c,$ff,$ff                       ; [$852d] undefined

SPRITE_INFO_FOREPAW_SCREEN_01:              ; [$8530]
    .byte SPRITE_ENEMY_NAGA                 ; [$8530] SpriteEntity
    .byte $9c                               ; [$8531] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $5d                               ; [$8533] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $81,$ff,$ff                       ; [$8535] undefined

SPRITE_INFO_FOREPAW_SCREEN_02:              ; [$8538]
    .byte SPRITE_ENEMY_NAGA                 ; [$8538] SpriteEntity
    .byte $66                               ; [$8539] undefined

    .byte SPRITE_ENEMY_NAGA
    .byte $8c,$ff,$ff                       ; [$853b] undefined

SPRITE_INFO_FOREPAW_SCREEN_03:              ; [$853e]
    .byte SPRITE_ENEMY_NAGA                 ; [$853e] SpriteEntity
    .byte $94                               ; [$853f] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $48                               ; [$8541] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $23,$ff,$ff                       ; [$8543] undefined

SPRITE_INFO_FOREPAW_SCREEN_04:              ; [$8546]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8546] SpriteEntity
    .byte $96                               ; [$8547] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $22,$ff,$ff                       ; [$8549] undefined

SPRITE_INFO_FOREPAW_SCREEN_05:              ; [$854c]
    .byte SPRITE_ENEMY_CHARRON              ; [$854c] SpriteEntity
    .byte $43                               ; [$854d] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $98,$ff,$ff                       ; [$854f] undefined

SPRITE_INFO_FOREPAW_SCREEN_06:              ; [$8552]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8552] SpriteEntity
    .byte $23                               ; [$8553] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $89,$ff,$ff                       ; [$8555] undefined

SPRITE_INFO_FOREPAW_SCREEN_07:              ; [$8558]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8558] SpriteEntity
    .byte $38                               ; [$8559] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $3b,$ff,$ff                       ; [$855b] undefined

SPRITE_INFO_FOREPAW_SCREEN_08:              ; [$855e]
    .byte SPRITE_ENEMY_HORNET               ; [$855e] SpriteEntity
    .byte $28                               ; [$855f] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $4b                               ; [$8561] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $98,$ff,$ff                       ; [$8563] undefined

SPRITE_INFO_FOREPAW_SCREEN_09:              ; [$8566]
    .byte SPRITE_ENEMY_HORNET               ; [$8566] SpriteEntity
    .byte $38                               ; [$8567] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $54                               ; [$8569] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $9b,$ff,$ff                       ; [$856b] undefined

SPRITE_INFO_FOREPAW_SCREEN_10_11:           ; [$856e]
    .byte $ff,$ff                           ; [$856e] undefined

SPRITE_INFO_FOREPAW_SCREEN_12:              ; [$8570]
    .byte SPRITE_ENEMY_HORNET               ; [$8570] SpriteEntity
    .byte $45                               ; [$8571] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $78                               ; [$8573] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $2b,$ff,$ff                       ; [$8575] undefined

SPRITE_INFO_FOREPAW_SCREEN_13:              ; [$8578]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8578] SpriteEntity
    .byte $63                               ; [$8579] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $38                               ; [$857b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $5a,$ff,$ff                       ; [$857d] undefined

SPRITE_INFO_FOREPAW_SCREEN_14:              ; [$8580]
    .byte SPRITE_ENEMY_BIHORUDA             ; [$8580] SpriteEntity
    .byte $43                               ; [$8581] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $3b                               ; [$8583] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $87,$ff,$ff                       ; [$8585] undefined

SPRITE_INFO_FOREPAW_SCREEN_15:              ; [$8588]
    .byte SPRITE_ENEMY_BIHORUDA             ; [$8588] SpriteEntity
    .byte $27                               ; [$8589] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $4c                               ; [$858b] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $87,$ff,$ff                       ; [$858d] undefined

SPRITE_INFO_FOREPAW_SCREEN_16:              ; [$8590]
    .byte SPRITE_ENEMY_HORNET               ; [$8590] SpriteEntity
    .byte $45                               ; [$8591] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $88                               ; [$8593] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $9b,$ff,$ff                       ; [$8595] undefined

SPRITE_INFO_FOREPAW_SCREEN_17:              ; [$8598]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$8598] SpriteEntity
    .byte $5e                               ; [$8599] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $45                               ; [$859b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $88                               ; [$859d] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $24,$ff,$ff                       ; [$859f] undefined

SPRITE_INFO_FOREPAW_SCREEN_18:              ; [$85a2]
    .byte SPRITE_ENEMY_HORNET               ; [$85a2] SpriteEntity
    .byte $45                               ; [$85a3] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $68                               ; [$85a5] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $9b,$ff,$ff                       ; [$85a7] undefined

SPRITE_INFO_FOREPAW_SCREEN_19:              ; [$85aa]
    .byte SPRITE_ENEMY_BIHORUDA             ; [$85aa] SpriteEntity
    .byte $45                               ; [$85ab] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $88                               ; [$85ad] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $9b,$ff,$ff                       ; [$85af] undefined

SPRITE_INFO_FOREPAW_SCREEN_20:              ; [$85b2]
    .byte SPRITE_ENEMY_BIHORUDA             ; [$85b2] SpriteEntity
    .byte $35                               ; [$85b3] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $28                               ; [$85b5] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $97,$ff,$ff                       ; [$85b7] undefined

SPRITE_INFO_FOREPAW_SCREEN_21:              ; [$85ba]
    .byte SPRITE_ENEMY_BIHORUDA             ; [$85ba] SpriteEntity
    .byte $45                               ; [$85bb] undefined

    .byte SPRITE_ENEMY_BIHORUDA
    .byte $88                               ; [$85bd] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $98,$ff,$ff                       ; [$85bf] undefined

SPRITE_INFO_FOREPAW_SCREEN_22:              ; [$85c2]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$85c2] SpriteEntity
    .byte $98                               ; [$85c3] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $77,$ff,$ff                       ; [$85c5] undefined

SPRITE_INFO_FOREPAW_SCREEN_23:              ; [$85c8]
    .byte SPRITE_ENEMY_HORNET               ; [$85c8] SpriteEntity
    .byte $69                               ; [$85c9] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $a3                               ; [$85cb] undefined

    .byte SPRITE_ENEMY_RAIDEN
    .byte $a5,$ff,$ff                       ; [$85cd] undefined

SPRITE_INFO_FOREPAW_SCREEN_24:              ; [$85d0]
    .byte SPRITE_ENEMY_HORNET               ; [$85d0] SpriteEntity
    .byte $64                               ; [$85d1] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $1a                               ; [$85d3] undefined

    .byte SPRITE_ENEMY_RAIDEN
    .byte $87,$ff,$ff                       ; [$85d5] undefined

SPRITE_INFO_FOREPAW_SCREEN_25:              ; [$85d8]
    .byte SPRITE_ENEMY_YAREEKA              ; [$85d8] SpriteEntity
    .byte $81                               ; [$85d9] undefined

    .byte SPRITE_ENEMY_RAIDEN
    .byte $37,$ff,$ff                       ; [$85db] undefined

SPRITE_INFO_FOREPAW_SCREEN_26:              ; [$85de]
    .byte SPRITE_ENEMY_CHARRON              ; [$85de] SpriteEntity
    .byte $61                               ; [$85df] undefined

    .byte SPRITE_ENEMY_RAIDEN
    .byte $25,$ff,$ff                       ; [$85e1] undefined

SPRITE_INFO_FOREPAW_SCREEN_27:              ; [$85e4]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$85e4] SpriteEntity
    .byte $35                               ; [$85e5] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $24                               ; [$85e7] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $99,$ff,$ff                       ; [$85e9] undefined

SPRITE_INFO_FOREPAW_SCREEN_28:              ; [$85ec]
    .byte SPRITE_ENEMY_IKEDA                ; [$85ec] SpriteEntity
    .byte $84                               ; [$85ed] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $98,$ff,$ff                       ; [$85ef] undefined

SPRITE_INFO_FOREPAW_SCREEN_29:              ; [$85f2]
    .byte SPRITE_ENEMY_CHARRON              ; [$85f2] SpriteEntity
    .byte $44                               ; [$85f3] undefined

    .byte SPRITE_ENEMY_YAREEKA
    .byte $89,$ff,$ff                       ; [$85f5] undefined

SPRITE_INFO_FOREPAW_SCREEN_30:              ; [$85f8]
    .byte SPRITE_OBJ_POISON                 ; [$85f8] SpriteEntity
    .byte $68                               ; [$85f9] undefined

    .byte SPRITE_ENEMY_SUGATA
    .byte $99,$ff,$ff                       ; [$85fb] undefined

SPRITE_INFO_FOREPAW_SCREEN_31:              ; [$85fe]
    .byte SPRITE_OBJ_POISON                 ; [$85fe] SpriteEntity
    .byte $a1                               ; [$85ff] undefined

    .byte SPRITE_ENEMY_SUGATA
    .byte $95,$ff,$ff                       ; [$8601] undefined

SPRITE_INFO_FOREPAW_SCREEN_32:              ; [$8604]
    .byte SPRITE_ENEMY_YAREEKA              ; [$8604] SpriteEntity
    .byte $39                               ; [$8605] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $96,$ff,$ff                       ; [$8607] undefined

SPRITE_INFO_FOREPAW_SCREEN_33:              ; [$860a]
    .byte SPRITE_ENEMY_YAREEKA              ; [$860a] SpriteEntity
    .byte $64                               ; [$860b] undefined

    .byte SPRITE_ENEMY_GIANT_BEES
    .byte $53                               ; [$860d] undefined

    .byte SPRITE_ENEMY_GIANT_BEES
    .byte $5a,$ff,$ff                       ; [$860f] undefined

SPRITE_INFO_FOREPAW_SCREEN_34:              ; [$8612]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8612] SpriteEntity
    .byte $4c                               ; [$8613] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $34                               ; [$8615] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $5c,$ff,$ff                       ; [$8617] undefined

SPRITE_INFO_FOREPAW_SCREEN_35_36:           ; [$861a]
    .byte $ff,$ff                           ; [$861a] undefined

SPRITE_INFO_FOREPAW_SCREEN_37:              ; [$861c]
    .byte SPRITE_ENEMY_YAREEKA              ; [$861c] SpriteEntity
    .byte $29                               ; [$861d] undefined

    .byte SPRITE_ENEMY_YAREEKA
    .byte $85,$ff,$ff                       ; [$861f] undefined

SPRITE_INFO_FOREPAW_SCREEN_38:              ; [$8622]
    .byte SPRITE_ENEMY_LAMPREY              ; [$8622] SpriteEntity
    .byte $98                               ; [$8623] undefined

    .byte SPRITE_ENEMY_GIANT_BEES
    .byte $15                               ; [$8625] undefined

    .byte SPRITE_ENEMY_GIANT_BEES
    .byte $5a,$ff,$ff                       ; [$8627] undefined

SPRITE_INFO_FOREPAW_SCREEN_39:              ; [$862a]
    .byte SPRITE_ENEMY_LAMPREY              ; [$862a] SpriteEntity
    .byte $3a                               ; [$862b] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $85,$ff,$ff                       ; [$862d] undefined

SPRITE_INFO_FOREPAW_SCREEN_40:              ; [$8630]
    .byte SPRITE_ENEMY_CHARRON              ; [$8630] SpriteEntity
    .byte $87                               ; [$8631] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $2b,$ff,$ff                       ; [$8633] undefined

SPRITE_INFO_FOREPAW_SCREEN_41:              ; [$8636]
    .byte SPRITE_ENEMY_IKEDA                ; [$8636] SpriteEntity
    .byte $7d                               ; [$8637] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $75,$ff,$ff                       ; [$8639] undefined

SPRITE_INFO_FOREPAW_SCREEN_42:              ; [$863c]
    .byte SPRITE_ENEMY_NASH                 ; [$863c] SpriteEntity
    .byte $1c                               ; [$863d] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $7a,$ff,$ff                       ; [$863f] undefined

SPRITE_INFO_FOREPAW_SCREEN_43:              ; [$8642]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8642] SpriteEntity
    .byte $99                               ; [$8643] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $4e,$ff,$ff                       ; [$8645] undefined

SPRITE_INFO_FOREPAW_SCREEN_44:              ; [$8648]
    .byte SPRITE_ENEMY_IKEDA                ; [$8648] SpriteEntity
    .byte $6d                               ; [$8649] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $85,$ff,$ff                       ; [$864b] undefined

SPRITE_INFO_FOREPAW_SCREEN_45:              ; [$864e]
    .byte SPRITE_ENEMY_YAREEKA              ; [$864e] SpriteEntity
    .byte $82                               ; [$864f] undefined

    .byte SPRITE_ENEMY_YAREEKA
    .byte $2b,$ff,$ff                       ; [$8651] undefined

SPRITE_INFO_FOREPAW_SCREEN_46:              ; [$8654]
    .byte SPRITE_ENEMY_CHARRON              ; [$8654] SpriteEntity
    .byte $39                               ; [$8655] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $9a,$ff,$ff                       ; [$8657] undefined

SPRITE_INFO_FOREPAW_SCREEN_47:              ; [$865a]
    .byte SPRITE_ENEMY_CHARRON              ; [$865a] SpriteEntity
    .byte $25                               ; [$865b] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $9a,$ff,$ff                       ; [$865d] undefined

SPRITE_INFO_FOREPAW_SCREEN_48:              ; [$8660]
    .byte SPRITE_OBJ_HOUR_GLASS             ; [$8660] SpriteEntity
    .byte $32                               ; [$8661] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $65                               ; [$8663] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $a7,$ff,$ff                       ; [$8665] undefined

SPRITE_INFO_FOREPAW_SCREEN_49:              ; [$8668]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$8668] SpriteEntity
    .byte $97                               ; [$8669] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $13                               ; [$866b] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $8d,$ff,$ff                       ; [$866d] undefined

SPRITE_INFO_FOREPAW_SCREEN_50:              ; [$8670]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$8670] SpriteEntity
    .byte $48                               ; [$8671] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $3a                               ; [$8673] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $b8                               ; [$8675] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $be,$ff,$ff                       ; [$8677] undefined

SPRITE_INFO_FOREPAW_SCREEN_51:              ; [$867a]
    .byte SPRITE_BOSS_RIPASHEIKU            ; [$867a] SpriteEntity
    .byte $59,$ff,$ff                       ; [$867b] undefined

SPRITE_INFO_FOREPAW_SCREEN_52:              ; [$867e]
    .byte SPRITE_OBJ_PENDANT                ; [$867e] SpriteEntity
    .byte $9e                               ; [$867f] undefined

    .byte SPRITE_BOSS_RIPASHEIKU
    .byte $48,$ff,$ff                       ; [$8681] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; CurrentScreen_SpecialEventID

SPRITE_INFO_FOREPAW_SCREEN_53:              ; [$8686]
    .byte SPRITE_ENEMY_CHARRON              ; [$8686] SpriteEntity
    .byte $ac                               ; [$8687] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $67,$ff,$ff                       ; [$8689] undefined

SPRITE_INFO_FOREPAW_SCREEN_54:              ; [$868c]
    .byte SPRITE_ENEMY_NECRON_AIDES         ; [$868c] SpriteEntity
    .byte $28                               ; [$868d] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $97,$ff,$ff                       ; [$868f] undefined

SPRITE_INFO_FOREPAW_SCREEN_55:              ; [$8692]
    .byte SPRITE_ENEMY_CHARRON              ; [$8692] SpriteEntity
    .byte $52                               ; [$8693] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $a7,$ff,$ff                       ; [$8695] undefined

SPRITE_INFO_FOREPAW_SCREEN_56:              ; [$8698]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$8698] SpriteEntity
    .byte $98                               ; [$8699] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $33,$ff,$ff                       ; [$869b] undefined

SPRITE_INFO_FOREPAW_SCREEN_57:              ; [$869e]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$869e] SpriteEntity
    .byte $98                               ; [$869f] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $39                               ; [$86a1] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $35,$ff,$ff                       ; [$86a3] undefined

SPRITE_INFO_FOREPAW_SCREEN_58:              ; [$86a6]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$86a6] SpriteEntity
    .byte $98                               ; [$86a7] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $35,$ff,$ff                       ; [$86a9] undefined

SPRITE_INFO_FOREPAW_SCREEN_59:              ; [$86ac]
    .byte SPRITE_ENEMY_ZOZURA               ; [$86ac] SpriteEntity
    .byte $54                               ; [$86ad] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $97,$ff,$ff                       ; [$86af] undefined

SPRITE_INFO_FOREPAW_SCREEN_60:              ; [$86b2]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$86b2] SpriteEntity
    .byte $a6                               ; [$86b3] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $53,$ff,$ff                       ; [$86b5] undefined

SPRITE_INFO_FOREPAW_SCREEN_61:              ; [$86b8]
    .byte SPRITE_ENEMY_IKEDA                ; [$86b8] SpriteEntity
    .byte $4a                               ; [$86b9] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $a7,$ff,$ff                       ; [$86bb] undefined

SPRITE_INFO_FOREPAW_SCREEN_62:              ; [$86be]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$86be] SpriteEntity
    .byte $25                               ; [$86bf] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $2a                               ; [$86c1] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $98,$ff,$ff                       ; [$86c3] undefined

SPRITE_INFO_FOREPAW_SCREEN_63:              ; [$86c6]
    .byte SPRITE_BOSS_RIPASHEIKU            ; [$86c6] SpriteEntity
    .byte $3a,$ff,$ff                       ; [$86c7] undefined

SPRITE_INFO_FOREPAW_SCREEN_64:              ; [$86ca]
    .byte SPRITE_BOSS_ZORUGERIRU            ; [$86ca] SpriteEntity
    .byte $4c,$ff,$ff                       ; [$86cb] undefined

SPRITE_INFO_FOREPAW_SCREEN_65:              ; [$86ce]
    .byte SPRITE_BOSS_ZORADOHNA             ; [$86ce] SpriteEntity
    .byte $67                               ; [$86cf] undefined

    .byte SPRITE_OBJ_ELIXIR
    .byte $a1,$ff,$ff                       ; [$86d1] undefined

SPRITE_INFO_FOREPAW_SCREEN_66:              ; [$86d4]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$86d4] SpriteEntity
    .byte $4a                               ; [$86d5] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $9a                               ; [$86d7] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $86                               ; [$86d9] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $72,$ff,$ff                       ; [$86db] undefined

SPRITE_INFO_FOREPAW_SCREEN_67:              ; [$86de]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$86de] SpriteEntity
    .byte $3a                               ; [$86df] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $6c                               ; [$86e1] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $98                               ; [$86e3] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $a3,$ff,$ff                       ; [$86e5] undefined

SPRITE_INFO_FOREPAW_SCREEN_68:              ; [$86e8]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$86e8] SpriteEntity
    .byte $4a                               ; [$86e9] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $63                               ; [$86eb] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $97                               ; [$86ed] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $8b,$ff,$ff                       ; [$86ef] undefined

SPRITE_INFO_FOREPAW_SCREEN_69:              ; [$86f2]
    .byte SPRITE_ENEMY_MASKMAN              ; [$86f2] SpriteEntity
    .byte $a6                               ; [$86f3] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $3c,$ff,$ff                       ; [$86f5] undefined

SPRITE_INFO_FOREPAW_SCREEN_70:              ; [$86f8]
    .byte SPRITE_ENEMY_MASKMAN              ; [$86f8] SpriteEntity
    .byte $35                               ; [$86f9] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $3c,$ff,$ff                       ; [$86fb] undefined

SPRITE_INFO_FOREPAW_SCREEN_71:              ; [$86fe]
    .byte SPRITE_OBJ_OINTMENT               ; [$86fe] SpriteEntity
    .byte $42                               ; [$86ff] undefined

    .byte SPRITE_ENEMY_GERIBUTA
    .byte $35                               ; [$8701] undefined

    .byte SPRITE_ENEMY_GERIBUTA
    .byte $ac,$ff,$ff                       ; [$8703] undefined

SPRITE_INFO_FOREPAW_SCREEN_72:              ; [$8706]
    .byte SPRITE_BOSS_RIPASHEIKU            ; [$8706] SpriteEntity
    .byte $3a,$ff,$ff                       ; [$8707] undefined

SPRITE_INFO_FOREPAW_SCREEN_73:              ; [$870a]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$870a] SpriteEntity
    .byte $9c                               ; [$870b] undefined

    .byte SPRITE_ENEMY_RAIDEN
    .byte $a8,$ff,$ff                       ; [$870d] undefined

SPRITE_INFO_FOREPAW_SCREEN_74:              ; [$8710]
    .byte SPRITE_ENEMY_GERIBUTA             ; [$8710] SpriteEntity
    .byte $39                               ; [$8711] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $ac,$ff,$ff                       ; [$8713] undefined

SPRITE_INFO_FOREPAW_SCREEN_75:              ; [$8716]
    .byte SPRITE_ENEMY_GERIBUTA             ; [$8716] SpriteEntity
    .byte $35                               ; [$8717] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $ab,$ff,$ff                       ; [$8719] undefined

SPRITE_INFO_FOREPAW_SCREEN_76:              ; [$871c]
    .byte SPRITE_OBJ_BLACK_ONYX             ; [$871c] SpriteEntity
    .byte $a4                               ; [$871d] undefined

    .byte SPRITE_BOSS_ZORADOHNA
    .byte $49,$ff,$ff                       ; [$871f] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; CurrentScreen_SpecialEventID

SPRITE_INFO_FOREPAW_SCREEN_77:              ; [$8724]
    .byte SPRITE_OBJ_RED_POTION_2           ; [$8724] SpriteEntity
    .byte $31                               ; [$8725] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $9a,$ff,$ff                       ; [$8727] undefined

SPRITE_INFO_FOREPAW_SCREEN_78:              ; [$872a]
    .byte SPRITE_ENEMY_SUGATA               ; [$872a] SpriteEntity
    .byte $a8                               ; [$872b] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $a3,$ff,$ff                       ; [$872d] undefined

SPRITE_INFO_FOREPAW_SCREEN_79:              ; [$8730]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8730] SpriteEntity
    .byte $a6                               ; [$8731] undefined

    .byte SPRITE_ENEMY_SUGATA
    .byte $38,$ff,$ff                       ; [$8733] undefined

SPRITE_INFO_FOREPAW_SCREEN_80:              ; [$8736]
    .byte SPRITE_OBJ_RED_POTION             ; [$8736] SpriteEntity
    .byte $31                               ; [$8737] undefined

    .byte SPRITE_ENEMY_FIRE_GIANT
    .byte $3b                               ; [$8739] undefined

    .byte SPRITE_ENEMY_ISHIISU
    .byte $aa,$ff,$ff                       ; [$873b] undefined

SPRITE_INFO_FOREPAW_SCREEN_81:              ; [$873e]
    .byte SPRITE_ENEMY_FIRE_GIANT           ; [$873e] SpriteEntity
    .byte $36                               ; [$873f] undefined

    .byte SPRITE_ENEMY_ISHIISU
    .byte $ab,$ff,$ff                       ; [$8741] undefined

SPRITE_INFO_FOREPAW_SCREEN_82:              ; [$8744]
    .byte SPRITE_ENEMY_FIRE_GIANT           ; [$8744] SpriteEntity
    .byte $37                               ; [$8745] undefined

    .byte SPRITE_ENEMY_ISHIISU
    .byte $ac,$ff,$ff                       ; [$8747] undefined


;============================================================================
; Conflate Sprite Information
;============================================================================
SPRITE_INFO_CONFLATE:                       ; [$874a]
    pointer SPRITE_INFO_CONFLATE_SCREEN_00  ; SPRITE_INFO_CONFLATE_SCREEN_00
                                            ; [$PRG11::874a]
    pointer SPRITE_INFO_CONFLATE_SCREEN_01  ; SPRITE_INFO_CONFLATE_SCREEN_01
                                            ; [$PRG11::874c]
    pointer SPRITE_INFO_CONFLATE_SCREEN_02  ; SPRITE_INFO_CONFLATE_SCREEN_02
                                            ; [$PRG11::874e]
    pointer SPRITE_INFO_CONFLATE_SCREEN_03  ; SPRITE_INFO_CONFLATE_SCREEN_03
                                            ; [$PRG11::8750]
    pointer SPRITE_INFO_CONFLATE_SCREEN_04  ; SPRITE_INFO_CONFLATE_SCREEN_04
                                            ; [$PRG11::8752]
    pointer SPRITE_INFO_CONFLATE_SCREEN_05  ; SPRITE_INFO_CONFLATE_SCREEN_05
                                            ; [$PRG11::8754]
    pointer SPRITE_INFO_CONFLATE_SCREEN_06  ; SPRITE_INFO_CONFLATE_SCREEN_06
                                            ; [$PRG11::8756]
    pointer SPRITE_INFO_CONFLATE_SCREEN_07  ; SPRITE_INFO_CONFLATE_SCREEN_07
                                            ; [$PRG11::8758]
    pointer SPRITE_INFO_CONFLATE_SCREEN_08  ; SPRITE_INFO_CONFLATE_SCREEN_08
                                            ; [$PRG11::875a]
    pointer SPRITE_INFO_CONFLATE_SCREEN_09  ; SPRITE_INFO_CONFLATE_SCREEN_09
                                            ; [$PRG11::875c]
    pointer SPRITE_INFO_CONFLATE_SCREEN_10  ; SPRITE_INFO_CONFLATE_SCREEN_10
                                            ; [$PRG11::875e]
    pointer SPRITE_INFO_CONFLATE_SCREEN_11  ; SPRITE_INFO_CONFLATE_SCREEN_11
                                            ; [$PRG11::8760]
    pointer SPRITE_INFO_CONFLATE_SCREEN_12  ; SPRITE_INFO_CONFLATE_SCREEN_12
                                            ; [$PRG11::8762]
    pointer SPRITE_INFO_CONFLATE_SCREEN_13  ; SPRITE_INFO_CONFLATE_SCREEN_13
                                            ; [$PRG11::8764]
    pointer SPRITE_INFO_CONFLATE_SCREEN_14  ; SPRITE_INFO_CONFLATE_SCREEN_14
                                            ; [$PRG11::8766]
    pointer SPRITE_INFO_CONFLATE_SCREEN_15  ; SPRITE_INFO_CONFLATE_SCREEN_15
                                            ; [$PRG11::8768]
    pointer SPRITE_INFO_CONFLATE_SCREEN_16  ; SPRITE_INFO_CONFLATE_SCREEN_16
                                            ; [$PRG11::876a]
    pointer SPRITE_INFO_CONFLATE_SCREEN_17  ; SPRITE_INFO_CONFLATE_SCREEN_17
                                            ; [$PRG11::876c]
    pointer SPRITE_INFO_CONFLATE_SCREEN_18  ; SPRITE_INFO_CONFLATE_SCREEN_18
                                            ; [$PRG11::876e]
    pointer SPRITE_INFO_CONFLATE_SCREEN_19  ; SPRITE_INFO_CONFLATE_SCREEN_19
                                            ; [$PRG11::8770]
    pointer SPRITE_INFO_CONFLATE_SCREEN_20  ; SPRITE_INFO_CONFLATE_SCREEN_20
                                            ; [$PRG11::8772]
    pointer SPRITE_INFO_CONFLATE_SCREEN_21  ; SPRITE_INFO_CONFLATE_SCREEN_21
                                            ; [$PRG11::8774]
    pointer SPRITE_INFO_CONFLATE_SCREEN_22  ; SPRITE_INFO_CONFLATE_SCREEN_22
                                            ; [$PRG11::8776]
    pointer SPRITE_INFO_CONFLATE_SCREEN_23  ; SPRITE_INFO_CONFLATE_SCREEN_23
                                            ; [$PRG11::8778]
    pointer SPRITE_INFO_CONFLATE_SCREEN_24  ; SPRITE_INFO_CONFLATE_SCREEN_24
                                            ; [$PRG11::877a]
    pointer SPRITE_INFO_CONFLATE_SCREEN_25  ; SPRITE_INFO_CONFLATE_SCREEN_25
                                            ; [$PRG11::877c]
    pointer SPRITE_INFO_CONFLATE_SCREEN_26  ; SPRITE_INFO_CONFLATE_SCREEN_26
                                            ; [$PRG11::877e]
    pointer SPRITE_INFO_CONFLATE_SCREEN_27  ; SPRITE_INFO_CONFLATE_SCREEN_27
                                            ; [$PRG11::8780]
    pointer SPRITE_INFO_CONFLATE_SCREEN_28  ; SPRITE_INFO_CONFLATE_SCREEN_28
                                            ; [$PRG11::8782]
    pointer SPRITE_INFO_CONFLATE_SCREEN_29  ; SPRITE_INFO_CONFLATE_SCREEN_29
                                            ; [$PRG11::8784]
    pointer SPRITE_INFO_CONFLATE_SCREEN_30  ; SPRITE_INFO_CONFLATE_SCREEN_30
                                            ; [$PRG11::8786]
    pointer SPRITE_INFO_CONFLATE_SCREEN_31  ; SPRITE_INFO_CONFLATE_SCREEN_31
                                            ; [$PRG11::8788]
    pointer SPRITE_INFO_CONFLATE_SCREEN_32  ; SPRITE_INFO_CONFLATE_SCREEN_32
                                            ; [$PRG11::878a]
    pointer SPRITE_INFO_CONFLATE_SCREEN_33  ; SPRITE_INFO_CONFLATE_SCREEN_33
                                            ; [$PRG11::878c]
    pointer SPRITE_INFO_CONFLATE_SCREEN_34  ; SPRITE_INFO_CONFLATE_SCREEN_34
                                            ; [$PRG11::878e]
    pointer SPRITE_INFO_CONFLATE_SCREEN_35  ; SPRITE_INFO_CONFLATE_SCREEN_35
                                            ; [$PRG11::8790]
    pointer SPRITE_INFO_CONFLATE_SCREEN_36  ; SPRITE_INFO_CONFLATE_SCREEN_36
                                            ; [$PRG11::8792]
    pointer SPRITE_INFO_CONFLATE_SCREEN_37  ; SPRITE_INFO_CONFLATE_SCREEN_37
                                            ; [$PRG11::8794]
    pointer SPRITE_INFO_CONFLATE_SCREEN_38  ; SPRITE_INFO_CONFLATE_SCREEN_38
                                            ; [$PRG11::8796]
    pointer SPRITE_INFO_CONFLATE_SCREEN_39  ; SPRITE_INFO_CONFLATE_SCREEN_39
                                            ; [$PRG11::8798]

;
; XREFS:
;     SPRITE_INFO_CONFLATE [$PRG11::874a]
;
SPRITE_INFO_CONFLATE_SCREEN_00:             ; [$879a]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$879a] SpriteEntity
    .byte $aa                               ; [$879b] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $55,$ff,$ff                       ; [$879d] undefined

SPRITE_INFO_CONFLATE_SCREEN_01:             ; [$87a0]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$87a0] SpriteEntity
    .byte $8d                               ; [$87a1] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $65,$ff,$ff                       ; [$87a3] undefined

SPRITE_INFO_CONFLATE_SCREEN_02:             ; [$87a6]
    .byte SPRITE_ENEMY_MASKMAN              ; [$87a6] SpriteEntity
    .byte $76                               ; [$87a7] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $8b,$ff,$ff                       ; [$87a9] undefined

SPRITE_INFO_CONFLATE_SCREEN_03:             ; [$87ac]
    .byte SPRITE_ENEMY_TAMAZUTSU            ; [$87ac] SpriteEntity
    .byte $58,$ff,$ff                       ; [$87ad] undefined

SPRITE_INFO_CONFLATE_SCREEN_04:             ; [$87b0]
    .byte SPRITE_OBJ_OINTMENT               ; [$87b0] SpriteEntity
    .byte $4d                               ; [$87b1] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $5a,$ff,$ff                       ; [$87b3] undefined

SPRITE_INFO_CONFLATE_SCREEN_05:             ; [$87b6]
    .byte SPRITE_ENEMY_NECRON_AIDES         ; [$87b6] SpriteEntity
    .byte $37                               ; [$87b7] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $33                               ; [$87b9] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $1d,$ff,$ff                       ; [$87bb] undefined

SPRITE_INFO_CONFLATE_SCREEN_06:             ; [$87be]
    .byte SPRITE_ENEMY_LAMPREY              ; [$87be] SpriteEntity
    .byte $44,$ff,$ff                       ; [$87bf] undefined

SPRITE_INFO_CONFLATE_SCREEN_07:             ; [$87c2]
    .byte SPRITE_OBJ_BATTLE_HELMET          ; [$87c2] SpriteEntity
    .byte $a4                               ; [$87c3] undefined

    .byte SPRITE_BOSS_ZORADOHNA
    .byte $49,$ff,$ff                       ; [$87c5] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; [$87c9] ScreenEventID

SPRITE_INFO_CONFLATE_SCREEN_08:             ; [$87ca]
    .byte SPRITE_OBJ_GLOVE                  ; [$87ca] SpriteEntity
    .byte $4e                               ; [$87cb] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $36                               ; [$87cd] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $3b,$ff,$ff                       ; [$87cf] undefined

SPRITE_INFO_CONFLATE_SCREEN_09:             ; [$87d2]
    .byte SPRITE_ENEMY_LAMPREY              ; [$87d2] SpriteEntity
    .byte $64                               ; [$87d3] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $15                               ; [$87d5] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $af,$ff,$ff                       ; [$87d7] undefined

SPRITE_INFO_CONFLATE_SCREEN_10:             ; [$87da]
    .byte SPRITE_ENEMY_CHARRON              ; [$87da] SpriteEntity
    .byte $35,$ff,$ff                       ; [$87db] undefined

SPRITE_INFO_CONFLATE_SCREEN_11:             ; [$87de]
    .byte SPRITE_OBJ_POISON_2               ; [$87de] SpriteEntity
    .byte $7d                               ; [$87df] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $6d                               ; [$87e1] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $72,$ff,$ff                       ; [$87e3] undefined

SPRITE_INFO_CONFLATE_SCREEN_12:             ; [$87e6]
    .byte SPRITE_ENEMY_YAREEKA              ; [$87e6] SpriteEntity
    .byte $49,$ff,$ff                       ; [$87e7] undefined

SPRITE_INFO_CONFLATE_SCREEN_13:             ; [$87ea]
    .byte SPRITE_ENEMY_CHARRON              ; [$87ea] SpriteEntity
    .byte $63                               ; [$87eb] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $79,$ff,$ff                       ; [$87ed] undefined

SPRITE_INFO_CONFLATE_SCREEN_14:             ; [$87f0]
    .byte SPRITE_ENEMY_LAMPREY              ; [$87f0] SpriteEntity
    .byte $6d,$ff,$ff                       ; [$87f1] undefined

SPRITE_INFO_CONFLATE_SCREEN_15:             ; [$87f4]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$87f4] SpriteEntity
    .byte $69,$ff,$ff                       ; [$87f5] undefined

SPRITE_INFO_CONFLATE_SCREEN_16:             ; [$87f8]
    .byte SPRITE_OBJ_OINTMENT               ; [$87f8] SpriteEntity
    .byte $48                               ; [$87f9] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $98                               ; [$87fb] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $3b,$ff,$ff                       ; [$87fd] undefined

SPRITE_INFO_CONFLATE_SCREEN_17:             ; [$8800]
    .byte SPRITE_ENEMY_TAMAZUTSU            ; [$8800] SpriteEntity
    .byte $4b                               ; [$8801] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $35                               ; [$8803] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $9b,$ff,$ff                       ; [$8805] undefined

SPRITE_INFO_CONFLATE_SCREEN_18:             ; [$8808]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$8808] SpriteEntity
    .byte $47                               ; [$8809] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $85,$ff,$ff                       ; [$880b] undefined

SPRITE_INFO_CONFLATE_SCREEN_19:             ; [$880e]
    .byte SPRITE_ENEMY_MASKMAN              ; [$880e] SpriteEntity
    .byte $8c,$ff,$ff                       ; [$880f] undefined

SPRITE_INFO_CONFLATE_SCREEN_20:             ; [$8812]
    .byte SPRITE_ENEMY_MASKMAN              ; [$8812] SpriteEntity
    .byte $48                               ; [$8813] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $3c                               ; [$8815] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $64,$ff,$ff                       ; [$8817] undefined

SPRITE_INFO_CONFLATE_SCREEN_21:             ; [$881a]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$881a] SpriteEntity
    .byte $28                               ; [$881b] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $5c,$ff,$ff                       ; [$881d] undefined

SPRITE_INFO_CONFLATE_SCREEN_22:             ; [$8820]
    .byte SPRITE_OBJ_HOUR_GLASS             ; [$8820] SpriteEntity
    .byte $72                               ; [$8821] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $85,$ff,$ff                       ; [$8823] undefined

SPRITE_INFO_CONFLATE_SCREEN_23:             ; [$8826]
    .byte SPRITE_OBJ_POISON_2               ; [$8826] SpriteEntity
    .byte $56                               ; [$8827] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $a6                               ; [$8829] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $8b,$ff,$ff                       ; [$882b] undefined

SPRITE_INFO_CONFLATE_SCREEN_24:             ; [$882e]
    .byte SPRITE_OBJ_MATTOCK1               ; [$882e] SpriteEntity
    .byte $58                               ; [$882f] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $97                               ; [$8831] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $35,$ff,$ff                       ; [$8833] undefined

SPRITE_INFO_CONFLATE_SCREEN_25:             ; [$8836]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$8836] SpriteEntity
    .byte $29                               ; [$8837] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $56,$ff,$ff                       ; [$8839] undefined

SPRITE_INFO_CONFLATE_SCREEN_26:             ; [$883c]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$883c] SpriteEntity
    .byte $33                               ; [$883d] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $89,$ff,$ff                       ; [$883f] undefined

SPRITE_INFO_CONFLATE_SCREEN_27:             ; [$8842]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$8842] SpriteEntity
    .byte $55                               ; [$8843] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $9a,$ff,$ff                       ; [$8845] undefined

SPRITE_INFO_CONFLATE_SCREEN_28:             ; [$8848]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$8848] SpriteEntity
    .byte $a9                               ; [$8849] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $57                               ; [$884b] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $18,$ff,$ff                       ; [$884d] undefined

SPRITE_INFO_CONFLATE_SCREEN_29:             ; [$8850]
    .byte SPRITE_OBJ_BATTLE_SUIT            ; [$8850] SpriteEntity
    .byte $bd                               ; [$8851] undefined

    .byte SPRITE_BOSS_ZORADOHNA
    .byte $59,$ff,$ff                       ; [$8853] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; CurrentScreen_SpecialEventID

SPRITE_INFO_CONFLATE_SCREEN_30:             ; [$8858]
    .byte SPRITE_OBJ_MAGICAL_ROD            ; [$8858] SpriteEntity
    .byte $b9                               ; [$8859] undefined

    .byte SPRITE_OBJ_POISON_2
    .byte $4d                               ; [$885b] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $ba                               ; [$885d] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $4a,$ff,$ff                       ; [$885f] undefined

SPRITE_INFO_CONFLATE_SCREEN_31:             ; [$8862]
    .byte SPRITE_ENEMY_GERIBUTA             ; [$8862] SpriteEntity
    .byte $9a,$ff,$ff                       ; [$8863] undefined

SPRITE_INFO_CONFLATE_SCREEN_32:             ; [$8866]
    .byte SPRITE_ENEMY_MAGMAN               ; [$8866] SpriteEntity
    .byte $8a                               ; [$8867] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $2d                               ; [$8869] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $66,$ff,$ff                       ; [$886b] undefined

SPRITE_INFO_CONFLATE_SCREEN_33:             ; [$886e]
    .byte SPRITE_OBJ_GLOVE_2                ; [$886e] SpriteEntity
    .byte $32                               ; [$886f] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $4d                               ; [$8871] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $49,$ff,$ff                       ; [$8873] undefined

SPRITE_INFO_CONFLATE_SCREEN_34:             ; [$8876]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$8876] SpriteEntity
    .byte $92                               ; [$8877] undefined

    .byte SPRITE_ENEMY_MAGMAN
    .byte $00                               ; [$8879] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $3c,$ff,$ff                       ; [$887b] undefined

SPRITE_INFO_CONFLATE_SCREEN_35:             ; [$887e]
    .byte SPRITE_ENEMY_WOLFMAN              ; [$887e] SpriteEntity
    .byte $3d                               ; [$887f] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $99,$ff,$ff                       ; [$8881] undefined

SPRITE_INFO_CONFLATE_SCREEN_36:             ; [$8884]
    .byte SPRITE_ENEMY_WOLFMAN              ; [$8884] SpriteEntity
    .byte $21                               ; [$8885] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $9a                               ; [$8887] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $49                               ; [$8889] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $63,$ff,$ff                       ; [$888b] undefined

SPRITE_INFO_CONFLATE_SCREEN_37:             ; [$888e]
    .byte SPRITE_ENEMY_WOLFMAN              ; [$888e] SpriteEntity
    .byte $7b                               ; [$888f] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $4d                               ; [$8891] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $98,$ff,$ff                       ; [$8893] undefined

SPRITE_INFO_CONFLATE_SCREEN_38:             ; [$8896]
    .byte SPRITE_ENEMY_CHARRON              ; [$8896] SpriteEntity
    .byte $7c                               ; [$8897] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $21,$ff,$ff                       ; [$8899] undefined

SPRITE_INFO_CONFLATE_SCREEN_39:             ; [$889c]
    .byte SPRITE_ENEMY_CHARRON              ; [$889c] SpriteEntity
    .byte $36                               ; [$889d] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $69,$ff,$ff                       ; [$889f] undefined


;============================================================================
; Daybreak Sprite Information
;============================================================================
SPRITE_INFO_DAYBREAK:                       ; [$88a2]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_00  ; SPRITE_INFO_DAYBREAK_SCREEN_00
                                            ; [$PRG11::88a2]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_01  ; SPRITE_INFO_DAYBREAK_SCREEN_01
                                            ; [$PRG11::88a4]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_02  ; SPRITE_INFO_DAYBREAK_SCREEN_02
                                            ; [$PRG11::88a6]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_03  ; SPRITE_INFO_DAYBREAK_SCREEN_03
                                            ; [$PRG11::88a8]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_04  ; SPRITE_INFO_DAYBREAK_SCREEN_04
                                            ; [$PRG11::88aa]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_05  ; SPRITE_INFO_DAYBREAK_SCREEN_05
                                            ; [$PRG11::88ac]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_06  ; SPRITE_INFO_DAYBREAK_SCREEN_06
                                            ; [$PRG11::88ae]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_07  ; SPRITE_INFO_DAYBREAK_SCREEN_07
                                            ; [$PRG11::88b0]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_08  ; SPRITE_INFO_DAYBREAK_SCREEN_08
                                            ; [$PRG11::88b2]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_09  ; SPRITE_INFO_DAYBREAK_SCREEN_09
                                            ; [$PRG11::88b4]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_10  ; SPRITE_INFO_DAYBREAK_SCREEN_10
                                            ; [$PRG11::88b6]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_11  ; SPRITE_INFO_DAYBREAK_SCREEN_11
                                            ; [$PRG11::88b8]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_12  ; SPRITE_INFO_DAYBREAK_SCREEN_12
                                            ; [$PRG11::88ba]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_13  ; SPRITE_INFO_DAYBREAK_SCREEN_13
                                            ; [$PRG11::88bc]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_14  ; SPRITE_INFO_DAYBREAK_SCREEN_14
                                            ; [$PRG11::88be]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_15  ; SPRITE_INFO_DAYBREAK_SCREEN_15
                                            ; [$PRG11::88c0]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_16  ; SPRITE_INFO_DAYBREAK_SCREEN_16
                                            ; [$PRG11::88c2]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_17  ; SPRITE_INFO_DAYBREAK_SCREEN_17
                                            ; [$PRG11::88c4]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_18  ; SPRITE_INFO_DAYBREAK_SCREEN_18
                                            ; [$PRG11::88c6]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_19  ; SPRITE_INFO_DAYBREAK_SCREEN_19
                                            ; [$PRG11::88c8]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_20  ; SPRITE_INFO_DAYBREAK_SCREEN_20
                                            ; [$PRG11::88ca]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_21  ; SPRITE_INFO_DAYBREAK_SCREEN_21
                                            ; [$PRG11::88cc]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_22  ; SPRITE_INFO_DAYBREAK_SCREEN_22
                                            ; [$PRG11::88ce]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_23  ; SPRITE_INFO_DAYBREAK_SCREEN_23
                                            ; [$PRG11::88d0]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_24  ; SPRITE_INFO_DAYBREAK_SCREEN_24
                                            ; [$PRG11::88d2]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_25  ; SPRITE_INFO_DAYBREAK_SCREEN_25
                                            ; [$PRG11::88d4]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_26  ; SPRITE_INFO_DAYBREAK_SCREEN_26
                                            ; [$PRG11::88d6]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_27  ; SPRITE_INFO_DAYBREAK_SCREEN_27
                                            ; [$PRG11::88d8]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_28  ; SPRITE_INFO_DAYBREAK_SCREEN_28
                                            ; [$PRG11::88da]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_29  ; SPRITE_INFO_DAYBREAK_SCREEN_29
                                            ; [$PRG11::88dc]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_30  ; SPRITE_INFO_DAYBREAK_SCREEN_30
                                            ; [$PRG11::88de]
    pointer SPRITE_INFO_DAYBREAK_SCREEN_31  ; SPRITE_INFO_DAYBREAK_SCREEN_31
                                            ; [$PRG11::88e0]

;
; XREFS:
;     SPRITE_INFO_DAYBREAK [$PRG11::88a2]
;
SPRITE_INFO_DAYBREAK_SCREEN_00:             ; [$88e2]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$88e2] SpriteEntity
    .byte $a4                               ; [$88e3] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $47,$ff,$ff                       ; [$88e5] undefined

SPRITE_INFO_DAYBREAK_SCREEN_01:             ; [$88e8]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$88e8] SpriteEntity
    .byte $48                               ; [$88e9] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $a4,$ff,$ff                       ; [$88eb] undefined

SPRITE_INFO_DAYBREAK_SCREEN_02:             ; [$88ee]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$88ee] SpriteEntity
    .byte $49                               ; [$88ef] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $a5,$ff,$ff                       ; [$88f1] undefined

SPRITE_INFO_DAYBREAK_SCREEN_03:             ; [$88f4]
    .byte SPRITE_ENEMY_LAMPREY              ; [$88f4] SpriteEntity
    .byte $aa                               ; [$88f5] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $a4                               ; [$88f7] undefined

    .byte SPRITE_ENEMY_YUINARU
    .byte $58,$ff,$ff                       ; [$88f9] undefined

SPRITE_INFO_DAYBREAK_SCREEN_04:             ; [$88fc]
    .byte SPRITE_OBJ_HOUR_GLASS             ; [$88fc] SpriteEntity
    .byte $5e                               ; [$88fd] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $9a                               ; [$88ff] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $43,$ff,$ff                       ; [$8901] undefined

SPRITE_INFO_DAYBREAK_SCREEN_05:             ; [$8904]
    .byte SPRITE_ENEMY_WOLFMAN              ; [$8904] SpriteEntity
    .byte $45                               ; [$8905] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $99,$ff,$ff                       ; [$8907] undefined

SPRITE_INFO_DAYBREAK_SCREEN_06:             ; [$890a]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$890a] SpriteEntity
    .byte $98                               ; [$890b] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $4c,$ff,$ff                       ; [$890d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_07:             ; [$8910]
    .byte SPRITE_ENEMY_HORNET               ; [$8910] SpriteEntity
    .byte $48                               ; [$8911] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $95                               ; [$8913] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $98,$ff,$ff                       ; [$8915] undefined

SPRITE_INFO_DAYBREAK_SCREEN_08:             ; [$8918]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$8918] SpriteEntity
    .byte $98                               ; [$8919] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $42                               ; [$891b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $78,$ff,$ff                       ; [$891d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_09:             ; [$8920]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8920] SpriteEntity
    .byte $16                               ; [$8921] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $4a                               ; [$8923] undefined

    .byte SPRITE_ENEMY_LAMPREY
    .byte $a8,$ff,$ff                       ; [$8925] undefined

SPRITE_INFO_DAYBREAK_SCREEN_10:             ; [$8928]
    .byte SPRITE_ENEMY_FIRE_GIANT           ; [$8928] SpriteEntity
    .byte $66                               ; [$8929] undefined

    .byte SPRITE_ENEMY_GERIBUTA
    .byte $ab                               ; [$892b] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $39,$ff,$ff                       ; [$892d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_11:             ; [$8930]
    .byte SPRITE_ENEMY_FIRE_GIANT           ; [$8930] SpriteEntity
    .byte $a8                               ; [$8931] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $55                               ; [$8933] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $4a,$ff,$ff                       ; [$8935] undefined

SPRITE_INFO_DAYBREAK_SCREEN_12:             ; [$8938]
    .byte SPRITE_ENEMY_WOLFMAN              ; [$8938] SpriteEntity
    .byte $ab                               ; [$8939] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $ae,$ff,$ff                       ; [$893b] undefined

SPRITE_INFO_DAYBREAK_SCREEN_13:             ; [$893e]
    .byte SPRITE_ENEMY_MASKMAN              ; [$893e] SpriteEntity
    .byte $a8                               ; [$893f] undefined

    .byte SPRITE_ENEMY_NECRON_AIDES
    .byte $61,$ff,$ff                       ; [$8941] undefined

SPRITE_INFO_DAYBREAK_SCREEN_14:             ; [$8944]
    .byte SPRITE_OBJ_POISON_2               ; [$8944] SpriteEntity
    .byte $b1                               ; [$8945] undefined

    .byte SPRITE_ENEMY_FIRE_GIANT
    .byte $2c                               ; [$8947] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $6d,$ff,$ff                       ; [$8949] undefined

SPRITE_INFO_DAYBREAK_SCREEN_15:             ; [$894c]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$894c] SpriteEntity
    .byte $aa                               ; [$894d] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $48,$ff,$ff                       ; [$894f] undefined

SPRITE_INFO_DAYBREAK_SCREEN_16:             ; [$8952]
    .byte SPRITE_ENEMY_HORNET               ; [$8952] SpriteEntity
    .byte $33                               ; [$8953] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $2b                               ; [$8955] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $8b,$ff,$ff                       ; [$8957] undefined

SPRITE_INFO_DAYBREAK_SCREEN_17:             ; [$895a]
    .byte SPRITE_ENEMY_HORNET               ; [$895a] SpriteEntity
    .byte $4b                               ; [$895b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $73                               ; [$895d] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $26                               ; [$895f] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $aa,$ff,$ff                       ; [$8961] undefined

SPRITE_INFO_DAYBREAK_SCREEN_18:             ; [$8964]
    .byte SPRITE_BOSS_ZORADOHNA             ; [$8964] SpriteEntity
    .byte $6a                               ; [$8965] undefined

    .byte SPRITE_OBJ_HOUR_GLASS
    .byte $32,$ff,$ff                       ; [$8967] undefined

SPRITE_INFO_DAYBREAK_SCREEN_19:             ; [$896a]
    .byte SPRITE_BOSS_PAKUKAME              ; [$896a] SpriteEntity
    .byte $15                               ; [$896b] undefined

    .byte SPRITE_OBJ_POISON_2
    .byte $a6                               ; [$896d] undefined

    .byte SPRITE_OBJ_RED_POTION_2
    .byte $ae,$ff,$ff                       ; [$896f] undefined

SPRITE_INFO_DAYBREAK_SCREEN_20:             ; [$8972]
    .byte SPRITE_BOSS_PAKUKAME              ; [$8972] SpriteEntity
    .byte $16                               ; [$8973] undefined

    .byte SPRITE_OBJ_POISON_2
    .byte $66,$ff,$ff                       ; [$8975] undefined

SPRITE_INFO_DAYBREAK_SCREEN_21:             ; [$8978]
    .byte SPRITE_OBJ_DRAGON_SLAYER          ; [$8978] SpriteEntity
    .byte $9d                               ; [$8979] undefined

    .byte SPRITE_BOSS_KING_GRIEVE
    .byte $49,$ff,$ff                       ; [$897b] undefined

    .byte SCREEN_HAS_SPECIAL_EVENT
    .byte SCREEN_EVENT_BOSS                 ; CurrentScreen_SpecialEventID

SPRITE_INFO_DAYBREAK_SCREEN_22:             ; [$8980]
    .byte SPRITE_BOSS_KING_GRIEVE           ; [$8980] SpriteEntity
    .byte $41,$ff,$ff                       ; [$8981] undefined

SPRITE_INFO_DAYBREAK_SCREEN_23:             ; [$8984]
    .byte SPRITE_ENEMY_GIANT_STRIDER        ; [$8984] SpriteEntity
    .byte $4c                               ; [$8985] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $93,$ff,$ff                       ; [$8987] undefined

SPRITE_INFO_DAYBREAK_SCREEN_24:             ; [$898a]
    .byte SPRITE_ENEMY_SNOWMAN              ; [$898a] SpriteEntity
    .byte $a7                               ; [$898b] undefined

    .byte SPRITE_ENEMY_SNOWMAN
    .byte $43,$ff,$ff                       ; [$898d] undefined

SPRITE_INFO_DAYBREAK_SCREEN_25:             ; [$8990]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$8990] SpriteEntity
    .byte $98                               ; [$8991] undefined

    .byte SPRITE_ENEMY_YAREEKA
    .byte $3c,$ff,$ff                       ; [$8993] undefined

SPRITE_INFO_DAYBREAK_SCREEN_26:             ; [$8996]
    .byte SPRITE_OBJ_OINTMENT               ; [$8996] SpriteEntity
    .byte $be                               ; [$8997] undefined

    .byte SPRITE_BOSS_BORABOHRA
    .byte $98,$ff,$ff                       ; [$8999] undefined

SPRITE_INFO_DAYBREAK_SCREEN_27:             ; [$899c]
    .byte SPRITE_ENEMY_ZOZURA               ; [$899c] SpriteEntity
    .byte $56                               ; [$899d] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $5b                               ; [$899f] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $ab                               ; [$89a1] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $a3,$ff,$ff                       ; [$89a3] undefined

SPRITE_INFO_DAYBREAK_SCREEN_28:             ; [$89a6]
    .byte SPRITE_ENEMY_CHARRON              ; [$89a6] SpriteEntity
    .byte $4c                               ; [$89a7] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $99,$ff,$ff                       ; [$89a9] undefined

SPRITE_INFO_DAYBREAK_SCREEN_29:             ; [$89ac]
    .byte SPRITE_OBJ_POISON_2               ; [$89ac] SpriteEntity
    .byte $b2                               ; [$89ad] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $4d                               ; [$89af] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $a9,$ff,$ff                       ; [$89b1] undefined

SPRITE_INFO_DAYBREAK_SCREEN_30:             ; [$89b4]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$89b4] SpriteEntity
    .byte $92,$ff,$ff                       ; [$89b5] undefined

SPRITE_INFO_DAYBREAK_SCREEN_31:             ; [$89b8]
    .byte SPRITE_BOSS_PAKUKAME              ; [$89b8] SpriteEntity
    .byte $2b,$ff,$ff                       ; [$89b9] undefined


;============================================================================
; Zenis Sprite Information
;============================================================================
SPRITE_INFO_ZENIS:                          ; [$89bc]
    pointer SPRITE_INFO_ZENIS_SCREEN_00     ; SPRITE_INFO_ZENIS_SCREEN_00
                                            ; [$PRG11::89bc]
    pointer SPRITE_INFO_ZENIS_SCREEN_01     ; SPRITE_INFO_ZENIS_SCREEN_01
                                            ; [$PRG11::89be]
    pointer SPRITE_INFO_ZENIS_SCREEN_02     ; SPRITE_INFO_ZENIS_SCREEN_02
                                            ; [$PRG11::89c0]
    pointer SPRITE_INFO_ZENIS_SCREEN_03     ; SPRITE_INFO_ZENIS_SCREEN_03
                                            ; [$PRG11::89c2]
    pointer SPRITE_INFO_ZENIS_SCREEN_04     ; SPRITE_INFO_ZENIS_SCREEN_04
                                            ; [$PRG11::89c4]
    pointer SPRITE_INFO_ZENIS_SCREEN_05     ; SPRITE_INFO_ZENIS_SCREEN_05
                                            ; [$PRG11::89c6]
    pointer SPRITE_INFO_ZENIS_SCREEN_06     ; SPRITE_INFO_ZENIS_SCREEN_06
                                            ; [$PRG11::89c8]
    pointer SPRITE_INFO_ZENIS_SCREEN_07     ; SPRITE_INFO_ZENIS_SCREEN_07
                                            ; [$PRG11::89ca]
    pointer SPRITE_INFO_ZENIS_SCREEN_08     ; SPRITE_INFO_ZENIS_SCREEN_08
                                            ; [$PRG11::89cc]
    pointer SPRITE_INFO_ZENIS_SCREEN_09     ; SPRITE_INFO_ZENIS_SCREEN_09
                                            ; [$PRG11::89ce]
    pointer SPRITE_INFO_ZENIS_SCREEN_10     ; SPRITE_INFO_ZENIS_SCREEN_10
                                            ; [$PRG11::89d0]
    pointer SPRITE_INFO_ZENIS_SCREEN_11     ; SPRITE_INFO_ZENIS_SCREEN_11
                                            ; [$PRG11::89d2]
    pointer SPRITE_INFO_ZENIS_SCREEN_12     ; SPRITE_INFO_ZENIS_SCREEN_12
                                            ; [$PRG11::89d4]
    pointer SPRITE_INFO_ZENIS_SCREEN_13     ; SPRITE_INFO_ZENIS_SCREEN_13
                                            ; [$PRG11::89d6]
    pointer SPRITE_INFO_ZENIS_SCREEN_14     ; SPRITE_INFO_ZENIS_SCREEN_14
                                            ; [$PRG11::89d8]
    pointer SPRITE_INFO_ZENIS_SCREEN_15     ; SPRITE_INFO_ZENIS_SCREEN_15
                                            ; [$PRG11::89da]
    pointer SPRITE_INFO_ZENIS_SCREEN_16     ; SPRITE_INFO_ZENIS_SCREEN_16
                                            ; [$PRG11::89dc]
    pointer SPRITE_INFO_ZENIS_SCREEN_17     ; SPRITE_INFO_ZENIS_SCREEN_17
                                            ; [$PRG11::89de]
    pointer SPRITE_INFO_ZENIS_SCREEN_18     ; SPRITE_INFO_ZENIS_SCREEN_18
                                            ; [$PRG11::89e0]
    pointer SPRITE_INFO_ZENIS_SCREEN_19     ; SPRITE_INFO_ZENIS_SCREEN_19
                                            ; [$PRG11::89e2]

;
; XREFS:
;     SPRITE_INFO_ZENIS [$PRG11::89bc]
;
SPRITE_INFO_ZENIS_SCREEN_00:                ; [$89e4]
    .byte SPRITE_BOSS_SHADOW_EURA           ; [$89e4] SpriteEntity
    .byte $73,$ff,$ff,$80,$02               ; [$89e5] undefined

SPRITE_INFO_ZENIS_SCREEN_01:                ; [$89ea]
    .byte SPRITE_BOSS_ZORADOHNA             ; [$89ea] SpriteEntity
    .byte $34                               ; [$89eb] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $a9,$ff,$ff                       ; [$89ed] undefined

SPRITE_INFO_ZENIS_SCREEN_02:                ; [$89f0]
    .byte SPRITE_ENEMY_WOLFMAN              ; [$89f0] SpriteEntity
    .byte $a2                               ; [$89f1] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $3d                               ; [$89f3] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $68,$ff,$ff                       ; [$89f5] undefined

SPRITE_INFO_ZENIS_SCREEN_03:                ; [$89f8]
    .byte SPRITE_ENEMY_GERIBUTA             ; [$89f8] SpriteEntity
    .byte $a5                               ; [$89f9] undefined

    .byte SPRITE_ENEMY_GERIBUTA
    .byte $aa                               ; [$89fb] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $48,$ff,$ff                       ; [$89fd] undefined

SPRITE_INFO_ZENIS_SCREEN_04:                ; [$8a00]
    .byte SPRITE_BOSS_RIPASHEIKU            ; [$8a00] SpriteEntity
    .byte $66,$ff,$ff                       ; [$8a01] undefined

SPRITE_INFO_ZENIS_SCREEN_05:                ; [$8a04]
    .byte SPRITE_BOSS_ZORUGERIRU            ; [$8a04] SpriteEntity
    .byte $4e,$ff,$ff                       ; [$8a05] undefined

SPRITE_INFO_ZENIS_SCREEN_06:                ; [$8a08]
    .byte SPRITE_OBJ_OINTMENT_2             ; [$8a08] SpriteEntity
    .byte $b2                               ; [$8a09] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $1b                               ; [$8a0b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $23                               ; [$8a0d] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $ad                               ; [$8a0f] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $ab,$ff,$ff                       ; [$8a11] undefined

SPRITE_INFO_ZENIS_SCREEN_07:                ; [$8a14]
    .byte SPRITE_BOSS_PAKUKAME              ; [$8a14] SpriteEntity
    .byte $13,$ff,$ff                       ; [$8a15] undefined

SPRITE_INFO_ZENIS_SCREEN_08:                ; [$8a18]
    .byte $ff,$ff                           ; [$8a18] undefined

SPRITE_INFO_ZENIS_SCREEN_09:                ; [$8a1a]
    .byte SPRITE_OBJ_POISON_2               ; [$8a1a] SpriteEntity
    .byte $be                               ; [$8a1b] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $46                               ; [$8a1d] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $a6                               ; [$8a1f] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $8a,$ff,$ff                       ; [$8a21] undefined

SPRITE_INFO_ZENIS_SCREEN_10:                ; [$8a24]
    .byte SPRITE_OBJ_GLOVE_2                ; [$8a24] SpriteEntity
    .byte $6d                               ; [$8a25] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $37                               ; [$8a27] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $a9                               ; [$8a29] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $a7                               ; [$8a2b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $24,$ff,$ff                       ; [$8a2d] undefined

SPRITE_INFO_ZENIS_SCREEN_11:                ; [$8a30]
    .byte SPRITE_BOSS_PAKUKAME              ; [$8a30] SpriteEntity
    .byte $12,$ff,$ff                       ; [$8a31] undefined

SPRITE_INFO_ZENIS_SCREEN_12:                ; [$8a34]
    .byte SPRITE_BOSS_ZORUGERIRU            ; [$8a34] SpriteEntity
    .byte $2c,$ff,$ff                       ; [$8a35] undefined

SPRITE_INFO_ZENIS_SCREEN_13:                ; [$8a38]
    .byte SPRITE_OBJ_POISON_2               ; [$8a38] SpriteEntity
    .byte $3e                               ; [$8a39] undefined

    .byte SPRITE_ENEMY_IKEDA
    .byte $ad                               ; [$8a3b] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $85                               ; [$8a3d] undefined

    .byte SPRITE_ENEMY_HORNET
    .byte $48,$ff,$ff                       ; [$8a3f] undefined

SPRITE_INFO_ZENIS_SCREEN_14:                ; [$8a42]
    .byte SPRITE_OBJ_POISON_2               ; [$8a42] SpriteEntity
    .byte $a1                               ; [$8a43] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $29                               ; [$8a45] undefined

    .byte SPRITE_BOSS_ROKUSUTAHN
    .byte $97,$ff,$ff                       ; [$8a47] undefined

SPRITE_INFO_ZENIS_SCREEN_15:                ; [$8a4a]
    .byte SPRITE_ENEMY_MASKMAN              ; [$8a4a] SpriteEntity
    .byte $46                               ; [$8a4b] undefined

    .byte SPRITE_ENEMY_MASKMAN
    .byte $99                               ; [$8a4d] undefined

    .byte SPRITE_ENEMY_TAMAZUTSU
    .byte $93,$ff,$ff                       ; [$8a4f] undefined

SPRITE_INFO_ZENIS_SCREEN_16:                ; [$8a52]
    .byte SPRITE_ENEMY_EXECUTION_HOOD       ; [$8a52] SpriteEntity
    .byte $4c                               ; [$8a53] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $aa                               ; [$8a55] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $a6                               ; [$8a57] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $a8,$ff,$ff                       ; [$8a59] undefined

SPRITE_INFO_ZENIS_SCREEN_17:                ; [$8a5c]
    .byte SPRITE_OBJ_GLOVE                  ; [$8a5c] SpriteEntity
    .byte $ac                               ; [$8a5d] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $66                               ; [$8a5f] undefined

    .byte SPRITE_ENEMY_ZOZURA
    .byte $63                               ; [$8a61] undefined

    .byte SPRITE_BOSS_BORABOHRA
    .byte $93,$ff,$ff                       ; [$8a63] undefined

SPRITE_INFO_ZENIS_SCREEN_18:                ; [$8a66]
    .byte SPRITE_BOSS_ROKUSUTAHN            ; [$8a66] SpriteEntity
    .byte $48                               ; [$8a67] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $a5                               ; [$8a69] undefined

    .byte SPRITE_ENEMY_SIR_GAWAINE
    .byte $ab,$ff,$ff                       ; [$8a6b] undefined

SPRITE_INFO_ZENIS_SCREEN_19:                ; [$8a6e]
    .byte SPRITE_ENEMY_MYCONID              ; [$8a6e] SpriteEntity
    .byte $58                               ; [$8a6f] undefined

    .byte SPRITE_ENEMY_CHARRON
    .byte $ac                               ; [$8a71] undefined

    .byte SPRITE_ENEMY_GERIBUTA
    .byte $a3,$ff,$ff                       ; [$8a73] undefined


;============================================================================
; Victim and Indoor Area Sprite Information
;============================================================================
SPRITE_INFO_VICTIM:                         ; [$8a76]
    pointer SPRITE_INFO_VICTIM_SCREEN_00    ; SPRITE_INFO_VICTIM_SCREEN_00
                                            ; [$PRG11::8a76]
    pointer SPRITE_INFO_VICTIM_SCREEN_01    ; SPRITE_INFO_VICTIM_SCREEN_01
                                            ; [$PRG11::8a78]
    pointer SPRITE_INFO_VICTIM_SCREEN_02    ; SPRITE_INFO_VICTIM_SCREEN_02
                                            ; [$PRG11::8a7a]
    pointer SPRITE_INFO_VICTIM_SCREEN_03    ; SPRITE_INFO_VICTIM_SCREEN_03
                                            ; [$PRG11::8a7c]
    pointer SPRITE_INFO_VICTIM_SCREEN_04    ; SPRITE_INFO_VICTIM_SCREEN_04
                                            ; [$PRG11::8a7e]
    pointer SPRITE_INFO_VICTIM_SCREEN_05    ; SPRITE_INFO_VICTIM_SCREEN_05
                                            ; [$PRG11::8a80]
    pointer SPRITE_INFO_VICTIM_SCREEN_06    ; SPRITE_INFO_VICTIM_SCREEN_06
                                            ; [$PRG11::8a82]
    pointer SPRITE_INFO_VICTIM_SCREEN_07    ; SPRITE_INFO_VICTIM_SCREEN_07
                                            ; [$PRG11::8a84]
    pointer SPRITE_INFO_VICTIM_SCREEN_08    ; SPRITE_INFO_VICTIM_SCREEN_08
                                            ; [$PRG11::8a86]
    pointer SPRITE_INFO_VICTIM_SCREEN_09    ; SPRITE_INFO_VICTIM_SCREEN_09
                                            ; [$PRG11::8a88]
    pointer SPRITE_INFO_VICTIM_SCREEN_10    ; SPRITE_INFO_VICTIM_SCREEN_10
                                            ; [$PRG11::8a8a]
    pointer SPRITE_INFO_VICTIM_SCREEN_11    ; SPRITE_INFO_VICTIM_SCREEN_11
                                            ; [$PRG11::8a8c]
    pointer SPRITE_INFO_VICTIM_SCREEN_12    ; SPRITE_INFO_VICTIM_SCREEN_12
                                            ; [$PRG11::8a8e]
    pointer SPRITE_INFO_VICTIM_SCREEN_13    ; SPRITE_INFO_VICTIM_SCREEN_13
                                            ; [$PRG11::8a90]
    pointer SPRITE_INFO_VICTIM_SCREEN_14    ; SPRITE_INFO_VICTIM_SCREEN_14
                                            ; [$PRG11::8a92]
    pointer SPRITE_INFO_VICTIM_SCREEN_15    ; SPRITE_INFO_VICTIM_SCREEN_15
                                            ; [$PRG11::8a94]
    pointer SPRITE_INFO_VICTIM_SCREEN_16    ; SPRITE_INFO_VICTIM_SCREEN_16
                                            ; [$PRG11::8a96]
    pointer SPRITE_INFO_VICTIM_SCREEN_17    ; SPRITE_INFO_VICTIM_SCREEN_17
                                            ; [$PRG11::8a98]
    pointer SPRITE_INFO_VICTIM_SCREEN_18    ; SPRITE_INFO_VICTIM_SCREEN_18
                                            ; [$PRG11::8a9a]
    pointer SPRITE_INFO_VICTIM_SCREEN_19    ; SPRITE_INFO_VICTIM_SCREEN_19
                                            ; [$PRG11::8a9c]
    pointer SPRITE_INFO_VICTIM_SCREEN_20    ; SPRITE_INFO_VICTIM_SCREEN_20
                                            ; [$PRG11::8a9e]
    pointer SPRITE_INFO_VICTIM_SCREEN_21    ; SPRITE_INFO_VICTIM_SCREEN_21
                                            ; [$PRG11::8aa0]
    pointer SPRITE_INFO_VICTIM_SCREEN_22    ; SPRITE_INFO_VICTIM_SCREEN_22
                                            ; [$PRG11::8aa2]
    pointer SPRITE_INFO_VICTIM_SCREEN_23    ; SPRITE_INFO_VICTIM_SCREEN_23
                                            ; [$PRG11::8aa4]
    pointer SPRITE_INFO_VICTIM_SCREEN_24    ; SPRITE_INFO_VICTIM_SCREEN_24
                                            ; [$PRG11::8aa6]
    pointer SPRITE_INFO_VICTIM_SCREEN_25    ; SPRITE_INFO_VICTIM_SCREEN_25
                                            ; [$PRG11::8aa8]
    pointer SPRITE_INFO_VICTIM_SCREEN_26    ; SPRITE_INFO_VICTIM_SCREEN_26
                                            ; [$PRG11::8aaa]
    pointer SPRITE_INFO_VICTIM_SCREEN_27    ; SPRITE_INFO_VICTIM_SCREEN_27
                                            ; [$PRG11::8aac]
    pointer SPRITE_INFO_VICTIM_SCREEN_28    ; SPRITE_INFO_VICTIM_SCREEN_28
                                            ; [$PRG11::8aae]
    pointer SPRITE_INFO_VICTIM_SCREEN_29    ; SPRITE_INFO_VICTIM_SCREEN_29
                                            ; [$PRG11::8ab0]
    pointer SPRITE_INFO_VICTIM_SCREEN_30    ; SPRITE_INFO_VICTIM_SCREEN_30
                                            ; [$PRG11::8ab2]
    pointer SPRITE_INFO_VICTIM_SCREEN_31    ; SPRITE_INFO_VICTIM_SCREEN_31
                                            ; [$PRG11::8ab4]
    pointer SPRITE_INFO_VICTIM_SCREEN_32    ; SPRITE_INFO_VICTIM_SCREEN_32
                                            ; [$PRG11::8ab6]
    pointer SPRITE_INFO_VICTIM_SCREEN_33    ; SPRITE_INFO_VICTIM_SCREEN_33
                                            ; [$PRG11::8ab8]
    pointer SPRITE_INFO_VICTIM_SCREEN_34    ; SPRITE_INFO_VICTIM_SCREEN_34
                                            ; [$PRG11::8aba]
    pointer SPRITE_INFO_VICTIM_SCREEN_35    ; SPRITE_INFO_VICTIM_SCREEN_35
                                            ; [$PRG11::8abc]
    pointer SPRITE_INFO_VICTIM_SCREEN_36    ; SPRITE_INFO_VICTIM_SCREEN_36
                                            ; [$PRG11::8abe]
    pointer SPRITE_INFO_VICTIM_SCREEN_37    ; SPRITE_INFO_VICTIM_SCREEN_37
                                            ; [$PRG11::8ac0]
    pointer SPRITE_INFO_VICTIM_SCREEN_38    ; SPRITE_INFO_VICTIM_SCREEN_38
                                            ; [$PRG11::8ac2]
    pointer SPRITE_INFO_VICTIM_SCREEN_39    ; SPRITE_INFO_VICTIM_SCREEN_39
                                            ; [$PRG11::8ac4]
    pointer SPRITE_INFO_VICTIM_SCREEN_40    ; SPRITE_INFO_VICTIM_SCREEN_40
                                            ; [$PRG11::8ac6]
    pointer SPRITE_INFO_VICTIM_SCREEN_41    ; SPRITE_INFO_VICTIM_SCREEN_41
                                            ; [$PRG11::8ac8]
    pointer SPRITE_INFO_VICTIM_SCREEN_42    ; SPRITE_INFO_VICTIM_SCREEN_42
                                            ; [$PRG11::8aca]
    pointer SPRITE_INFO_VICTIM_SCREEN_43    ; SPRITE_INFO_VICTIM_SCREEN_43
                                            ; [$PRG11::8acc]
    pointer SPRITE_INFO_VICTIM_SCREEN_44    ; SPRITE_INFO_VICTIM_SCREEN_44
                                            ; [$PRG11::8ace]
    pointer SPRITE_INFO_VICTIM_SCREEN_45    ; SPRITE_INFO_VICTIM_SCREEN_45
                                            ; [$PRG11::8ad0]
    pointer SPRITE_INFO_VICTIM_SCREEN_46    ; SPRITE_INFO_VICTIM_SCREEN_46
                                            ; [$PRG11::8ad2]
    pointer SPRITE_INFO_VICTIM_SCREEN_47    ; SPRITE_INFO_VICTIM_SCREEN_47
                                            ; [$PRG11::8ad4]
    pointer SPRITE_INFO_VICTIM_SCREEN_48    ; SPRITE_INFO_VICTIM_SCREEN_48
                                            ; [$PRG11::8ad6]
    pointer SPRITE_INFO_VICTIM_SCREEN_49    ; SPRITE_INFO_VICTIM_SCREEN_49
                                            ; [$PRG11::8ad8]
    pointer SPRITE_INFO_VICTIM_SCREEN_50    ; SPRITE_INFO_VICTIM_SCREEN_50
                                            ; [$PRG11::8ada]
    pointer SPRITE_INFO_VICTIM_SCREEN_51    ; SPRITE_INFO_VICTIM_SCREEN_51
                                            ; [$PRG11::8adc]
    pointer SPRITE_INFO_VICTIM_SCREEN_52    ; SPRITE_INFO_VICTIM_SCREEN_52
                                            ; [$PRG11::8ade]
    pointer SPRITE_INFO_VICTIM_SCREEN_53    ; SPRITE_INFO_VICTIM_SCREEN_53
                                            ; [$PRG11::8ae0]
    pointer SPRITE_INFO_VICTIM_SCREEN_54    ; SPRITE_INFO_VICTIM_SCREEN_54
                                            ; [$PRG11::8ae2]
    pointer SPRITE_INFO_VICTIM_SCREEN_55    ; SPRITE_INFO_VICTIM_SCREEN_55
                                            ; [$PRG11::8ae4]
    pointer SPRITE_INFO_VICTIM_SCREEN_56    ; SPRITE_INFO_VICTIM_SCREEN_56
                                            ; [$PRG11::8ae6]
    pointer SPRITE_INFO_VICTIM_SCREEN_57    ; SPRITE_INFO_VICTIM_SCREEN_57
                                            ; [$PRG11::8ae8]
    pointer SPRITE_INFO_VICTIM_SCREEN_58    ; SPRITE_INFO_VICTIM_SCREEN_58
                                            ; [$PRG11::8aea]
    pointer SPRITE_INFO_VICTIM_SCREEN_59    ; SPRITE_INFO_VICTIM_SCREEN_59
                                            ; [$PRG11::8aec]
    pointer SPRITE_INFO_VICTIM_SCREEN_60    ; SPRITE_INFO_VICTIM_SCREEN_60
                                            ; [$PRG11::8aee]
    pointer SPRITE_INFO_VICTIM_SCREEN_61    ; SPRITE_INFO_VICTIM_SCREEN_61
                                            ; [$PRG11::8af0]
    pointer SPRITE_INFO_VICTIM_SCREEN_62    ; SPRITE_INFO_VICTIM_SCREEN_62
                                            ; [$PRG11::8af2]
    pointer SPRITE_INFO_VICTIM_SCREEN_63    ; SPRITE_INFO_VICTIM_SCREEN_63
                                            ; [$PRG11::8af4]
    pointer SPRITE_INFO_VICTIM_SCREEN_64    ; SPRITE_INFO_VICTIM_SCREEN_64
                                            ; [$PRG11::8af6]
    pointer SPRITE_INFO_VICTIM_SCREEN_65    ; SPRITE_INFO_VICTIM_SCREEN_65
                                            ; [$PRG11::8af8]
    pointer SPRITE_INFO_VICTIM_SCREEN_66    ; SPRITE_INFO_VICTIM_SCREEN_66
                                            ; [$PRG11::8afa]
    pointer SPRITE_INFO_VICTIM_SCREEN_67    ; SPRITE_INFO_VICTIM_SCREEN_67
                                            ; [$PRG11::8afc]
    pointer SPRITE_INFO_VICTIM_SCREEN_68    ; SPRITE_INFO_VICTIM_SCREEN_68
                                            ; [$PRG11::8afe]
    pointer SPRITE_INFO_VICTIM_SCREEN_69    ; SPRITE_INFO_VICTIM_SCREEN_69
                                            ; [$PRG11::8b00]

;
; XREFS:
;     SPRITE_INFO_VICTIM [$PRG11::8a76]
;
SPRITE_INFO_VICTIM_SCREEN_00:               ; [$8b02]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8b02] SpriteEntity
    .byte $84,$ff                           ; [$8b03] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_MEAT_SHOP
    .byte $ff                               ; [$8b06] undefined

SPRITE_INFO_VICTIM_SCREEN_01:               ; [$8b07]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8b07] SpriteEntity
    .byte $84                               ; [$8b08] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8b0a] undefined

    .byte ISCRIPT_ENTRYPOINT_9
    .byte ISCRIPT_ENTRYPOINT_10             ; [$8b0d] IScriptEntrypoint
    .byte $ff                               ; [$8b0e] undefined

SPRITE_INFO_VICTIM_SCREEN_02:               ; [$8b0f]
    .byte SPRITE_NPC_PRIEST                 ; [$8b0f] SpriteEntity
    .byte $82,$ff                           ; [$8b10] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_GURU
    .byte $ff                               ; [$8b13] undefined

SPRITE_INFO_VICTIM_SCREEN_03:               ; [$8b14]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8b14] SpriteEntity
    .byte $84,$ff                           ; [$8b15] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_KEY_SHOP
    .byte $ff                               ; [$8b18] undefined

SPRITE_INFO_VICTIM_SCREEN_04:               ; [$8b19]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8b19] SpriteEntity
    .byte $73,$ff                           ; [$8b1a] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_TOOL_SHOP
    .byte $ff                               ; [$8b1d] undefined

SPRITE_INFO_VICTIM_SCREEN_05:               ; [$8b1e]
    .byte SPRITE_NPC_MAGIC_TEACHER          ; [$8b1e] SpriteEntity
    .byte $71,$ff                           ; [$8b1f] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS_MAGIC_SHOP
    .byte $ff                               ; [$8b22] undefined

SPRITE_INFO_VICTIM_SCREEN_06:               ; [$8b23]
    .byte SPRITE_NPC_MARTIAL_ARTS           ; [$8b23] SpriteEntity
    .byte $87,$ff                           ; [$8b24] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_MARTIAL_ARTS
    .byte $ff                               ; [$8b27] undefined

SPRITE_INFO_VICTIM_SCREEN_07:               ; [$8b28]
    .byte SPRITE_NPC_KING                   ; [$8b28] SpriteEntity
    .byte $72,$ff                           ; [$8b29] undefined

    .byte ISCRIPT_ENTRYPOINT_EOLIS_KING
    .byte $ff                               ; [$8b2c] undefined

SPRITE_INFO_VICTIM_SCREEN_08:               ; [$8b2d]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8b2d] SpriteEntity
    .byte $73,$ff                           ; [$8b2e] undefined

    .byte ISCRIPT_ENTRYPOINT_APOLUNE_TOOL_SHOP
    .byte $ff                               ; [$8b31] undefined

SPRITE_INFO_VICTIM_SCREEN_09:               ; [$8b32]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8b32] SpriteEntity
    .byte $84,$ff                           ; [$8b33] undefined

    .byte ISCRIPT_ENTRYPOINT_APOLUNE_KEY_SHOP
    .byte $ff                               ; [$8b36] undefined

SPRITE_INFO_VICTIM_SCREEN_10:               ; [$8b37]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8b37] SpriteEntity
    .byte $81                               ; [$8b38] undefined

    .byte SPRITE_NPC_DOCTOR
    .byte $87,$ff                           ; [$8b3a] undefined

    .byte ISCRIPT_ENTRYPOINT_18
    .byte ISCRIPT_ENTRYPOINT_19             ; [$8b3d] IScriptEntrypoint
    .byte $ff                               ; [$8b3e] undefined

SPRITE_INFO_VICTIM_SCREEN_11:               ; [$8b3f]
    .byte SPRITE_NPC_PRIEST                 ; [$8b3f] SpriteEntity
    .byte $82,$ff                           ; [$8b40] undefined

    .byte ISCRIPT_ENTRYPOINT_APOLUNE_GURU
    .byte $ff                               ; [$8b43] undefined

SPRITE_INFO_VICTIM_SCREEN_12:               ; [$8b44]
    .byte SPRITE_NPC_MAN_IN_CHAIR           ; [$8b44] SpriteEntity
    .byte $82                               ; [$8b45] undefined

    .byte SPRITE_NPC_NURSE
    .byte $95,$ff                           ; [$8b47] undefined

    .byte ISCRIPT_ENTRYPOINT_APOLUNE_DOCTOR
    .byte ISCRIPT_ENTRYPOINT_22             ; [$8b4a] IScriptEntrypoint
    .byte $ff                               ; [$8b4b] undefined

SPRITE_INFO_VICTIM_SCREEN_13:               ; [$8b4c]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8b4c] SpriteEntity
    .byte $84                               ; [$8b4d] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8b4f] undefined

    .byte ISCRIPT_ENTRYPOINT_23
    .byte ISCRIPT_ENTRYPOINT_24             ; [$8b52] IScriptEntrypoint
    .byte $ff                               ; [$8b53] undefined

SPRITE_INFO_VICTIM_SCREEN_14:               ; [$8b54]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8b54] SpriteEntity
    .byte $84,$ff                           ; [$8b55] undefined

    .byte ISCRIPT_ENTRYPOINT_44_FOREPAW_MEAT_SHOP
    .byte $ff                               ; [$8b58] undefined

SPRITE_INFO_VICTIM_SCREEN_15:               ; [$8b59]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8b59] SpriteEntity
    .byte $73,$ff                           ; [$8b5a] undefined

    .byte ISCRIPT_ENTRYPOINT_40_FOREPAW_TOOL_SHOP
    .byte $ff                               ; [$8b5d] undefined

SPRITE_INFO_VICTIM_SCREEN_16:               ; [$8b5e]
    .byte SPRITE_NPC_PRIEST                 ; [$8b5e] SpriteEntity
    .byte $82,$ff                           ; [$8b5f] undefined

    .byte ISCRIPT_ENTRYPOINT_41_FOREPAW_GURU
    .byte $ff                               ; [$8b62] undefined

SPRITE_INFO_VICTIM_SCREEN_17:               ; [$8b63]
    .byte SPRITE_NPC_MAN_IN_CHAIR           ; [$8b63] SpriteEntity
    .byte $82                               ; [$8b64] undefined

    .byte SPRITE_NPC_NURSE
    .byte $85,$ff                           ; [$8b66] undefined

    .byte ISCRIPT_ENTRYPOINT_42_FOREPAW_DOCTOR
    .byte ISCRIPT_ENTRYPOINT_35             ; [$8b69] IScriptEntrypoint
    .byte $ff                               ; [$8b6a] undefined

SPRITE_INFO_VICTIM_SCREEN_18:               ; [$8b6b]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8b6b] SpriteEntity
    .byte $84,$ff                           ; [$8b6c] undefined

    .byte ISCRIPT_ENTRYPOINT_34
    .byte $ff                               ; [$8b6f] undefined

SPRITE_INFO_VICTIM_SCREEN_19:               ; [$8b70]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8b70] SpriteEntity
    .byte $84,$ff                           ; [$8b71] undefined

    .byte ISCRIPT_ENTRYPOINT_43_FOREPAW_KEY_SHOP
    .byte $ff                               ; [$8b74] undefined

SPRITE_INFO_VICTIM_SCREEN_20:               ; [$8b75]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8b75] SpriteEntity
    .byte $73,$ff                           ; [$8b76] undefined

    .byte ISCRIPT_ENTRYPOINT_BEFORE_APOLUNE_TOOL_SHOP
    .byte $ff                               ; [$8b79] undefined

SPRITE_INFO_VICTIM_SCREEN_21:               ; [$8b7a]
    .byte SPRITE_NPC_PRIEST                 ; [$8b7a] SpriteEntity
    .byte $82,$ff                           ; [$8b7b] undefined

    .byte ISCRIPT_ENTRYPOINT_36
    .byte $ff                               ; [$8b7e] undefined

SPRITE_INFO_VICTIM_SCREEN_22:               ; [$8b7f]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8b7f] SpriteEntity
    .byte $81                               ; [$8b80] undefined

    .byte SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP
    .byte $87,$ff                           ; [$8b82] undefined

    .byte ISCRIPT_ENTRYPOINT_49
    .byte ISCRIPT_ENTRYPOINT_50             ; [$8b85] IScriptEntrypoint
    .byte $ff                               ; [$8b86] undefined

SPRITE_INFO_VICTIM_SCREEN_23:               ; [$8b87]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8b87] SpriteEntity
    .byte $84,$ff                           ; [$8b88] undefined

    .byte ISCRIPT_ENTRYPOINT_58_MASCON_MEAT_SHOP
    .byte $ff                               ; [$8b8b] undefined

SPRITE_INFO_VICTIM_SCREEN_24:               ; [$8b8c]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8b8c] SpriteEntity
    .byte $73,$ff                           ; [$8b8d] undefined

    .byte ISCRIPT_ENTRYPOINT_57_MASCON_TOOL_SHOP
    .byte $ff                               ; [$8b90] undefined

SPRITE_INFO_VICTIM_SCREEN_25:               ; [$8b91]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8b91] SpriteEntity
    .byte $84,$ff                           ; [$8b92] undefined

    .byte ISCRIPT_ENTRYPOINT_59_MASCON_KEY_SHOP
    .byte $ff                               ; [$8b95] undefined

SPRITE_INFO_VICTIM_SCREEN_26:               ; [$8b96]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8b96] SpriteEntity
    .byte $84                               ; [$8b97] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8b99] undefined

    .byte ISCRIPT_ENTRYPOINT_51
    .byte ISCRIPT_ENTRYPOINT_52             ; [$8b9c] IScriptEntrypoint
    .byte $ff                               ; [$8b9d] undefined

SPRITE_INFO_VICTIM_SCREEN_27:               ; [$8b9e]
    .byte SPRITE_NPC_MAN_IN_CHAIR           ; [$8b9e] SpriteEntity
    .byte $82                               ; [$8b9f] undefined

    .byte SPRITE_NPC_NURSE
    .byte $95,$ff                           ; [$8ba1] undefined

    .byte ISCRIPT_ENTRYPOINT_56_MASCON_DOCTOR
    .byte ISCRIPT_ENTRYPOINT_55             ; [$8ba4] IScriptEntrypoint
    .byte $ff                               ; [$8ba5] undefined

SPRITE_INFO_VICTIM_SCREEN_28:               ; [$8ba6]
    .byte SPRITE_NPC_MAGIC_TEACHER          ; [$8ba6] SpriteEntity
    .byte $71,$ff                           ; [$8ba7] undefined

    .byte ISCRIPT_ENTRYPOINT_75_AFTER_VICTIM_MAGIC_SHOP
    .byte $ff                               ; [$8baa] undefined

SPRITE_INFO_VICTIM_SCREEN_29:               ; [$8bab]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8bab] SpriteEntity
    .byte $87,$ff,$ff                       ; [$8bac] undefined

SPRITE_INFO_VICTIM_SCREEN_30:               ; [$8baf]
    .byte SPRITE_NPC_PRIEST                 ; [$8baf] SpriteEntity
    .byte $82,$ff                           ; [$8bb0] undefined

    .byte ISCRIPT_ENTRYPOINT_61_MASCON_GURU
    .byte $ff                               ; [$8bb3] undefined

SPRITE_INFO_VICTIM_SCREEN_31:               ; [$8bb4]
    .byte SPRITE_OBJ_WING_BOOTS             ; [$8bb4] SpriteEntity
    .byte $a3                               ; [$8bb5] undefined

    .byte SPRITE_ENEMY_GIANT_STRIDER
    .byte $82,$ff,$ff                       ; [$8bb7] undefined

SPRITE_INFO_VICTIM_SCREEN_32:               ; [$8bba]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8bba] SpriteEntity
    .byte $73,$ff                           ; [$8bbb] undefined

    .byte ISCRIPT_ENTRYPOINT_60_AFTER_MASCON_TOOL_SHOP
    .byte $ff                               ; [$8bbe] undefined

SPRITE_INFO_VICTIM_SCREEN_33:               ; [$8bbf]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8bbf] SpriteEntity
    .byte $84                               ; [$8bc0] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8bc2] undefined

    .byte ISCRIPT_ENTRYPOINT_53_OVERWORLD_MIST_HOUSE_MAN
    .byte ISCRIPT_ENTRYPOINT_54_OVERWORLD_MIST_HOUSE_WOMAN ; [$8bc5]
                                                           ; IScriptEntrypoint
    .byte $ff                               ; [$8bc6] undefined

SPRITE_INFO_VICTIM_SCREEN_34:               ; [$8bc7]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8bc7] SpriteEntity
    .byte $84,$ff                           ; [$8bc8] undefined

    .byte ISCRIPT_ENTRYPOINT_70
    .byte $ff                               ; [$8bcb] undefined

SPRITE_INFO_VICTIM_SCREEN_35:               ; [$8bcc]
    .byte SPRITE_NPC_PRIEST                 ; [$8bcc] SpriteEntity
    .byte $82,$ff                           ; [$8bcd] undefined

    .byte ISCRIPT_ENTRYPOINT_76_VICTIM_GURU
    .byte $ff                               ; [$8bd0] undefined

SPRITE_INFO_VICTIM_SCREEN_36:               ; [$8bd1]
    .byte SPRITE_NPC_MAN_IN_CHAIR           ; [$8bd1] SpriteEntity
    .byte $82,$ff                           ; [$8bd2] undefined

    .byte ISCRIPT_ENTRYPOINT_71_VICTIM_DOCTOR
    .byte $ff                               ; [$8bd5] undefined

SPRITE_INFO_VICTIM_SCREEN_37:               ; [$8bd6]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8bd6] SpriteEntity
    .byte $84                               ; [$8bd7] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8bd9] undefined

    .byte ISCRIPT_ENTRYPOINT_65
    .byte ISCRIPT_ENTRYPOINT_66             ; [$8bdc] IScriptEntrypoint
    .byte $ff                               ; [$8bdd] undefined

SPRITE_INFO_VICTIM_SCREEN_38:               ; [$8bde]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8bde] SpriteEntity
    .byte $84,$ff                           ; [$8bdf] undefined

    .byte ISCRIPT_ENTRYPOINT_73_VICTIM_MEAT_SHOP
    .byte $ff                               ; [$8be2] undefined

SPRITE_INFO_VICTIM_SCREEN_39:               ; [$8be3]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8be3] SpriteEntity
    .byte $84,$ff                           ; [$8be4] undefined

    .byte ISCRIPT_ENTRYPOINT_74_VICTIM_KEY_SHOP
    .byte $ff                               ; [$8be7] undefined

SPRITE_INFO_VICTIM_SCREEN_40:               ; [$8be8]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8be8] SpriteEntity
    .byte $81                               ; [$8be9] undefined

    .byte SPRITE_NPC_DOCTOR
    .byte $87,$ff                           ; [$8beb] undefined

    .byte ISCRIPT_ENTRYPOINT_67
    .byte ISCRIPT_ENTRYPOINT_68             ; [$8bee] IScriptEntrypoint
    .byte $ff                               ; [$8bef] undefined

SPRITE_INFO_VICTIM_SCREEN_41:               ; [$8bf0]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8bf0] SpriteEntity
    .byte $84,$ff                           ; [$8bf1] undefined

    .byte ISCRIPT_ENTRYPOINT_81
    .byte $ff                               ; [$8bf4] undefined

SPRITE_INFO_VICTIM_SCREEN_42:               ; [$8bf5]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8bf5] SpriteEntity
    .byte $84,$ff                           ; [$8bf6] undefined

    .byte ISCRIPT_ENTRYPOINT_88_CONFLATE_MEAT_SHOP
    .byte $ff                               ; [$8bf9] undefined

SPRITE_INFO_VICTIM_SCREEN_43:               ; [$8bfa]
    .byte SPRITE_NPC_PRIEST                 ; [$8bfa] SpriteEntity
    .byte $82,$ff                           ; [$8bfb] undefined

    .byte ISCRIPT_ENTRYPOINT_85_CONFLATE_GURU
    .byte $ff                               ; [$8bfe] undefined

SPRITE_INFO_VICTIM_SCREEN_44:               ; [$8bff]
    .byte SPRITE_NPC_MAN_IN_CHAIR           ; [$8bff] SpriteEntity
    .byte $82,$ff                           ; [$8c00] undefined

    .byte ISCRIPT_ENTRYPOINT_86_CONFLATE_DOCTOR
    .byte $ff                               ; [$8c03] undefined

SPRITE_INFO_VICTIM_SCREEN_45:               ; [$8c04]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8c04] SpriteEntity
    .byte $73,$ff                           ; [$8c05] undefined

    .byte ISCRIPT_ENTRYPOINT_87_CONFLATE_TOOL_SHOP
    .byte $ff                               ; [$8c08] undefined

SPRITE_INFO_VICTIM_SCREEN_46:               ; [$8c09]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8c09] SpriteEntity
    .byte $81                               ; [$8c0a] undefined

    .byte SPRITE_NPC_DOCTOR
    .byte $87,$ff                           ; [$8c0c] undefined

    .byte ISCRIPT_ENTRYPOINT_83
    .byte ISCRIPT_ENTRYPOINT_84             ; [$8c0f] IScriptEntrypoint
    .byte $ff                               ; [$8c10] undefined

SPRITE_INFO_VICTIM_SCREEN_47:               ; [$8c11]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8c11] SpriteEntity
    .byte $84,$ff                           ; [$8c12] undefined

    .byte ISCRIPT_ENTRYPOINT_104_DAYBREAK_KEY_SHOP
    .byte $ff                               ; [$8c15] undefined

SPRITE_INFO_VICTIM_SCREEN_48:               ; [$8c16]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8c16] SpriteEntity
    .byte $73,$ff                           ; [$8c17] undefined

    .byte ISCRIPT_ENTRYPOINT_102_DAYBREAK_TOOL_SHOP
    .byte $ff                               ; [$8c1a] undefined

SPRITE_INFO_VICTIM_SCREEN_49:               ; [$8c1b]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8c1b] SpriteEntity
    .byte $84                               ; [$8c1c] undefined

    .byte SPRITE_NPC_NURSE
    .byte $88,$ff                           ; [$8c1e] undefined

    .byte ISCRIPT_ENTRYPOINT_103_DAYBREAK_MEAT_SHOP
    .byte ISCRIPT_ENTRYPOINT_99             ; [$8c21] IScriptEntrypoint
    .byte $ff                               ; [$8c22] undefined

SPRITE_INFO_VICTIM_SCREEN_50:               ; [$8c23]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8c23] SpriteEntity
    .byte $81                               ; [$8c24] undefined

    .byte SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP
    .byte $87,$ff                           ; [$8c26] undefined

    .byte ISCRIPT_ENTRYPOINT_100
    .byte ISCRIPT_ENTRYPOINT_101            ; [$8c29] IScriptEntrypoint
    .byte $ff                               ; [$8c2a] undefined

SPRITE_INFO_VICTIM_SCREEN_51:               ; [$8c2b]
    .byte SPRITE_NPC_PRIEST                 ; [$8c2b] SpriteEntity
    .byte $82,$ff                           ; [$8c2c] undefined

    .byte ISCRIPT_ENTRYPOINT_105_DAYBREAK_GURU
    .byte $ff                               ; [$8c2f] undefined

SPRITE_INFO_VICTIM_SCREEN_52:               ; [$8c30]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8c30] SpriteEntity
    .byte $84                               ; [$8c31] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8c33] undefined

    .byte ISCRIPT_ENTRYPOINT_97
    .byte ISCRIPT_ENTRYPOINT_98             ; [$8c36] IScriptEntrypoint
    .byte $ff                               ; [$8c37] undefined

SPRITE_INFO_VICTIM_SCREEN_53:               ; [$8c38]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8c38] SpriteEntity
    .byte $84,$ff,$ff                       ; [$8c39] undefined

SPRITE_INFO_VICTIM_SCREEN_54:               ; [$8c3c]
    .byte SPRITE_ENEMY_GRIMLOCK             ; [$8c3c] SpriteEntity
    .byte $84,$ff,$ff                       ; [$8c3d] undefined

SPRITE_INFO_VICTIM_SCREEN_55:               ; [$8c40]
    .byte SPRITE_OBJ_RED_POTION             ; [$8c40] SpriteEntity
    .byte $98                               ; [$8c41] undefined

    .byte SPRITE_ENEMY_GRIMLOCK
    .byte $84,$ff,$ff                       ; [$8c43] undefined

SPRITE_INFO_VICTIM_SCREEN_56:               ; [$8c46]
    .byte SPRITE_ENEMY_MASKMAN              ; [$8c46] SpriteEntity
    .byte $84,$ff,$ff                       ; [$8c47] undefined

SPRITE_INFO_VICTIM_SCREEN_57:               ; [$8c4a]
    .byte SPRITE_ENEMY_SIR_GAWAINE          ; [$8c4a] SpriteEntity
    .byte $84,$ff,$ff                       ; [$8c4b] undefined

SPRITE_INFO_VICTIM_SCREEN_58:               ; [$8c4e]
    .byte SPRITE_NPC_SITTING_MAN_1          ; [$8c4e] SpriteEntity
    .byte $84                               ; [$8c4f] undefined

    .byte SPRITE_NPC_WALKING_WOMAN_2
    .byte $89,$ff                           ; [$8c51] undefined

    .byte ISCRIPT_ENTRYPOINT_113_OVERWORLD_HOUSE_MAN
    .byte ISCRIPT_ENTRYPOINT_114_OVERWORLD_HOUSE_WOMAN ; [$8c54]
                                                       ; IScriptEntrypoint
    .byte $ff                               ; [$8c55] undefined

SPRITE_INFO_VICTIM_SCREEN_59:               ; [$8c56]
    .byte SPRITE_NPC_PRIEST                 ; [$8c56] SpriteEntity
    .byte $82,$ff,$ff                       ; [$8c57] undefined

SPRITE_INFO_VICTIM_SCREEN_60:               ; [$8c5a]
    .byte SPRITE_NPC_PRIEST                 ; [$8c5a] SpriteEntity
    .byte $82,$ff,$78,$ff                   ; [$8c5b] undefined

SPRITE_INFO_VICTIM_SCREEN_61:               ; [$8c5f]
    .byte SPRITE_NPC_SMOKING_MAN            ; [$8c5f] SpriteEntity
    .byte $81,$ff,$73,$ff                   ; [$8c60] undefined

SPRITE_INFO_VICTIM_SCREEN_62:               ; [$8c64]
    .byte SPRITE_NPC_MEAT_SALESMAN          ; [$8c64] SpriteEntity
    .byte $84,$ff                           ; [$8c65] undefined

    .byte ISCRIPT_ENTRYPOINT_118_DARTMOOR_MEAT_SHOP
    .byte $ff                               ; [$8c68] undefined

SPRITE_INFO_VICTIM_SCREEN_63:               ; [$8c69]
    .byte SPRITE_NPC_MAN_IN_CHAIR           ; [$8c69] SpriteEntity
    .byte $82,$ff                           ; [$8c6a] undefined

    .byte ISCRIPT_ENTRYPOINT_122_DARTMOOR_DOCTOR
    .byte $ff                               ; [$8c6d] undefined

SPRITE_INFO_VICTIM_SCREEN_64:               ; [$8c6e]
    .byte SPRITE_NPC_KEY_SALESMAN           ; [$8c6e] SpriteEntity
    .byte $84,$ff                           ; [$8c6f] undefined

    .byte ISCRIPT_ENTRYPOINT_119_DARTMOOR_KEY_SHOP
    .byte $ff                               ; [$8c72] undefined

SPRITE_INFO_VICTIM_SCREEN_65:               ; [$8c73]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8c73] SpriteEntity
    .byte $73,$ff                           ; [$8c74] undefined

    .byte ISCRIPT_ENTRYPOINT_117_DARTMOOR_TOOL_SHOP
    .byte $ff                               ; [$8c77] undefined

SPRITE_INFO_VICTIM_SCREEN_66:               ; [$8c78]
    .byte SPRITE_NPC_PRIEST                 ; [$8c78] SpriteEntity
    .byte $82,$ff                           ; [$8c79] undefined

    .byte ISCRIPT_ENTRYPOINT_116_FRATERNAL_GURU
    .byte $ff                               ; [$8c7c] undefined

SPRITE_INFO_VICTIM_SCREEN_67:               ; [$8c7d]
    .byte SPRITE_OBJ_OINTMENT               ; [$8c7d] SpriteEntity
    .byte $95                               ; [$8c7e] undefined

    .byte SPRITE_ENEMY_WOLFMAN
    .byte $87,$ff,$ff                       ; [$8c80] undefined

SPRITE_INFO_VICTIM_SCREEN_68:               ; [$8c83]
    .byte SPRITE_NPC_KING                   ; [$8c83] SpriteEntity
    .byte $72,$ff                           ; [$8c84] undefined

    .byte ISCRIPT_ENTRYPOINT_121_GLAD_YOU_ARE_BACK
    .byte $ff                               ; [$8c87] undefined

SPRITE_INFO_VICTIM_SCREEN_69:               ; [$8c88]
    .byte SPRITE_NPC_ARMOR_SALESMAN         ; [$8c88] SpriteEntity
    .byte $73,$ff                           ; [$8c89] undefined

    .byte ISCRIPT_ENTRYPOINT_72_VICTIM_TOOL_SHOP
    .byte $ff                               ; [$8c8c] undefined


;============================================================================
; Mascon Sprite Information
;============================================================================
SPRITE_INFO_MASCON:                         ; [$8c8d]
    pointer SPRITE_INFO_MASCON_SCREEN_00    ; SPRITE_INFO_MASCON_SCREEN_00
                                            ; [$PRG11::8c8d]
    pointer SPRITE_INFO_MASCON_SCREEN_01    ; SPRITE_INFO_MASCON_SCREEN_01
                                            ; [$PRG11::8c8f]
    pointer SPRITE_INFO_MASCON_SCREEN_02    ; SPRITE_INFO_MASCON_SCREEN_02
                                            ; [$PRG11::8c91]
    pointer SPRITE_INFO_MASCON_SCREEN_03    ; SPRITE_INFO_MASCON_SCREEN_03
                                            ; [$PRG11::8c93]
    pointer SPRITE_INFO_MASCON_SCREEN_04    ; SPRITE_INFO_MASCON_SCREEN_04
                                            ; [$PRG11::8c95]
    pointer SPRITE_INFO_MASCON_SCREEN_05    ; SPRITE_INFO_MASCON_SCREEN_05
                                            ; [$PRG11::8c97]
    pointer SPRITE_INFO_MASCON_SCREEN_06    ; SPRITE_INFO_MASCON_SCREEN_06
                                            ; [$PRG11::8c99]
    pointer SPRITE_INFO_MASCON_SCREEN_07    ; SPRITE_INFO_MASCON_SCREEN_07
                                            ; [$PRG11::8c9b]
    pointer SPRITE_INFO_MASCON_SCREEN_08    ; SPRITE_INFO_MASCON_SCREEN_08
                                            ; [$PRG11::8c9d]
    pointer SPRITE_INFO_MASCON_SCREEN_09    ; SPRITE_INFO_MASCON_SCREEN_09
                                            ; [$PRG11::8c9f]
    pointer SPRITE_INFO_MASCON_SCREEN_10    ; SPRITE_INFO_MASCON_SCREEN_10
                                            ; [$PRG11::8ca1]
    pointer SPRITE_INFO_MASCON_SCREEN_11    ; SPRITE_INFO_MASCON_SCREEN_11
                                            ; [$PRG11::8ca3]
    pointer SPRITE_INFO_MASCON_SCREEN_12_13 ; SPRITE_INFO_MASCON_SCREEN_12_13
                                            ; [$PRG11::8ca5]
    pointer SPRITE_INFO_MASCON_SCREEN_12_13 ; SPRITE_INFO_MASCON_SCREEN_12_13
                                            ; [$PRG11::8ca7]

;
; XREFS:
;     SPRITE_INFO_MASCON [$PRG11::8c8d]
;
SPRITE_INFO_MASCON_SCREEN_00:               ; [$8ca9]
    .byte SPRITE_NPC_WALKING_WOMAN_2        ; [$8ca9] SpriteEntity
    .byte $97,$ff                           ; [$8caa] undefined

    .byte ISCRIPT_ENTRYPOINT_17
    .byte $ff                               ; [$8cad] undefined

SPRITE_INFO_MASCON_SCREEN_01:               ; [$8cae]
    .byte SPRITE_NPC_WALKING_MAN_1          ; [$8cae] SpriteEntity
    .byte $97,$ff                           ; [$8caf] undefined

    .byte ISCRIPT_ENTRYPOINT_16
    .byte $ff                               ; [$8cb2] undefined

SPRITE_INFO_MASCON_SCREEN_02:               ; [$8cb3]
    .byte SPRITE_NPC_NURSE                  ; [$8cb3] SpriteEntity
    .byte $97,$ff                           ; [$8cb4] undefined

    .byte ISCRIPT_ENTRYPOINT_32_FOREPAW_GREETER
    .byte $ff                               ; [$8cb7] undefined

SPRITE_INFO_MASCON_SCREEN_03:               ; [$8cb8]
    .byte SPRITE_NPC_WALKING_MAN_1          ; [$8cb8] SpriteEntity
    .byte $97,$ff                           ; [$8cb9] undefined

    .byte ISCRIPT_ENTRYPOINT_33
    .byte $ff                               ; [$8cbc] undefined

SPRITE_INFO_MASCON_SCREEN_04:               ; [$8cbd]
    .byte SPRITE_NPC_WALKING_MAN_1          ; [$8cbd] SpriteEntity
    .byte $97,$ff                           ; [$8cbe] undefined

    .byte ISCRIPT_ENTRYPOINT_48
    .byte $ff                               ; [$8cc1] undefined

SPRITE_INFO_MASCON_SCREEN_05:               ; [$8cc2]
    .byte $ff,$ff                           ; [$8cc2] undefined

SPRITE_INFO_MASCON_SCREEN_06:               ; [$8cc4]
    .byte SPRITE_NPC_WALKING_WOMAN_2        ; [$8cc4] SpriteEntity
    .byte $97,$ff                           ; [$8cc5] undefined

    .byte ISCRIPT_ENTRYPOINT_64
    .byte $ff                               ; [$8cc8] undefined

SPRITE_INFO_MASCON_SCREEN_07:               ; [$8cc9]
    .byte $ff,$ff                           ; [$8cc9] undefined

SPRITE_INFO_MASCON_SCREEN_08:               ; [$8ccb]
    .byte SPRITE_NPC_GUARD_1                ; [$8ccb] SpriteEntity
    .byte $9b,$ff                           ; [$8ccc] undefined

    .byte ISCRIPT_ENTRYPOINT_82
    .byte $ff                               ; [$8ccf] undefined

SPRITE_INFO_MASCON_SCREEN_09:               ; [$8cd0]
    .byte SPRITE_NPC_WALKING_MAN_1          ; [$8cd0] SpriteEntity
    .byte $97,$ff                           ; [$8cd1] undefined

    .byte ISCRIPT_ENTRYPOINT_80
    .byte $ff                               ; [$8cd4] undefined

SPRITE_INFO_MASCON_SCREEN_10:               ; [$8cd5]
    .byte SPRITE_NPC_LADY_BLUE_DRESS_WITH_CUP ; [$8cd5] SpriteEntity
    .byte $97,$ff                           ; [$8cd6] undefined

    .byte ISCRIPT_ENTRYPOINT_96
    .byte $ff                               ; [$8cd9] undefined

SPRITE_INFO_MASCON_SCREEN_11:               ; [$8cda]
    .byte $ff,$ff                           ; [$8cda] undefined

SPRITE_INFO_MASCON_SCREEN_12_13:            ; [$8cdc]
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8cdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ce4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8cec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8cf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8cfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8d9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8da4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8db4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ddc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8de4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8df4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8dfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8e9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ea4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8eac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8eb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ebc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ec4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ecc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ed4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8edc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ee4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8eec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ef4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8efc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8f9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fe4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8fec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ff4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$8ffc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9004] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$900c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9014] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$901c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9024] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$902c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9034] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$903c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9044] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$904c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9054] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$905c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9064] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$906c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9074] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$907c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9084] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$908c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9094] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$909c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$90fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9104] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$910c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9114] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$911c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9124] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$912c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9134] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$913c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9144] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$914c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9154] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$915c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9164] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$916c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9174] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$917c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9184] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$918c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9194] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$919c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$91fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9204] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$920c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9214] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$921c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9224] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$922c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9234] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$923c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9244] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$924c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9254] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$925c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9264] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$926c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9274] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$927c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9284] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$928c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9294] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$929c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$92fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9304] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$930c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9314] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$931c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9324] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$932c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9334] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$933c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9344] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$934c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9354] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$935c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9364] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$936c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9374] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$937c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9384] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$938c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9394] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$939c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$93fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9404] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$940c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9414] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$941c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9424] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$942c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9434] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$943c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9444] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$944c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9454] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$945c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9464] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$946c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9474] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$947c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9484] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$948c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9494] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$949c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$94fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9504] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$950c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9514] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$951c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9524] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$952c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9534] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$953c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9544] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$954c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9554] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$955c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9564] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$956c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9574] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$957c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9584] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$958c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9594] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$959c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$95fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9604] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$960c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9614] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$961c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9624] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$962c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9634] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$963c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9644] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$964c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9654] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$965c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9664] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$966c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9674] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$967c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9684] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$968c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9694] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$969c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$96fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9704] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$970c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9714] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$971c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9724] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$972c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9734] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$973c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9744] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$974c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9754] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$975c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9764] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$976c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9774] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$977c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9784] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$978c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9794] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$979c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$97fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9804] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$980c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9814] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$981c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9824] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$982c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9834] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$983c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9844] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$984c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9854] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$985c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9864] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$986c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9874] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$987c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9884] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$988c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9894] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$989c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$98fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9904] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$990c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9914] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$991c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9924] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$992c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9934] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$993c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9944] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$994c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9954] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$995c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9964] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$996c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9974] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$997c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9984] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$998c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9994] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$999c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$99fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9a9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9aa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9aac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ab4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9abc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ac4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9acc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ad4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9adc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ae4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9aec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9af4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9afc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9b9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ba4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9be4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9bfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9c9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ca4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ccc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ce4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9cfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9d9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9da4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9db4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ddc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9de4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9df4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9dfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9e9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ea4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9eac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9eb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ebc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ec4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ecc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ed4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9edc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ee4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9eec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ef4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9efc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9f9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fe4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9fec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ff4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$9ffc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a004] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a00c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a014] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a01c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a024] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a02c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a034] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a03c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a044] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a04c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a054] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a05c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a064] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a06c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a074] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a07c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a084] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a08c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a094] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a09c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a0fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a104] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a10c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a114] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a11c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a124] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a12c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a134] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a13c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a144] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a14c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a154] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a15c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a164] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a16c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a174] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a17c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a184] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a18c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a194] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a19c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a1fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a204] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a20c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a214] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a21c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a224] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a22c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a234] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a23c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a244] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a24c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a254] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a25c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a264] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a26c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a274] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a27c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a284] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a28c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a294] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a29c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a2fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a304] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a30c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a314] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a31c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a324] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a32c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a334] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a33c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a344] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a34c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a354] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a35c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a364] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a36c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a374] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a37c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a384] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a38c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a394] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a39c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a3fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a404] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a40c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a414] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a41c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a424] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a42c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a434] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a43c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a444] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a44c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a454] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a45c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a464] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a46c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a474] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a47c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a484] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a48c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a494] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a49c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a4fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a504] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a50c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a514] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a51c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a524] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a52c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a534] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a53c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a544] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a54c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a554] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a55c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a564] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a56c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a574] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a57c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a584] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a58c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a594] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a59c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a5fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a604] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a60c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a614] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a61c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a624] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a62c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a634] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a63c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a644] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a64c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a654] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a65c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a664] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a66c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a674] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a67c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a684] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a68c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a694] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a69c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a6fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a704] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a70c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a714] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a71c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a724] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a72c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a734] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a73c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a744] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a74c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a754] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a75c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a764] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a76c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a774] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a77c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a784] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a78c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a794] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a79c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a7fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a804] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a80c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a814] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a81c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a824] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a82c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a834] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a83c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a844] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a84c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a854] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a85c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a864] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a86c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a874] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a87c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a884] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a88c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a894] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a89c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a8fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a904] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a90c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a914] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a91c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a924] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a92c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a934] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a93c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a944] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a94c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a954] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a95c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a964] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a96c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a974] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a97c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a984] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a98c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a994] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a99c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$a9fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aa9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aaa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aaac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aab4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aabc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aac4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aacc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aad4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aadc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aae4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aaec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aaf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aafc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ab9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aba4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abe4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$abfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ac9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aca4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$accc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ace4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$acfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ad9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ada4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$add4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$addc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ade4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$adfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ae9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aea4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aeac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aeb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aebc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aec4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aecc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aed4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aedc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aee4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aeec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aef4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aefc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$af9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afe4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$afec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$aff4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$affc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b004] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b00c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b014] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b01c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b024] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b02c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b034] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b03c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b044] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b04c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b054] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b05c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b064] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b06c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b074] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b07c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b084] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b08c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b094] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b09c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b0fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b104] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b10c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b114] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b11c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b124] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b12c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b134] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b13c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b144] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b14c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b154] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b15c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b164] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b16c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b174] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b17c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b184] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b18c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b194] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b19c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b1fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b204] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b20c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b214] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b21c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b224] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b22c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b234] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b23c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b244] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b24c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b254] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b25c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b264] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b26c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b274] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b27c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b284] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b28c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b294] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b29c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b2fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b304] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b30c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b314] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b31c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b324] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b32c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b334] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b33c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b344] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b34c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b354] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b35c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b364] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b36c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b374] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b37c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b384] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b38c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b394] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b39c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b3fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b404] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b40c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b414] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b41c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b424] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b42c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b434] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b43c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b444] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b44c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b454] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b45c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b464] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b46c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b474] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b47c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b484] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b48c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b494] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b49c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b4fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b504] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b50c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b514] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b51c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b524] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b52c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b534] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b53c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b544] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b54c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b554] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b55c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b564] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b56c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b574] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b57c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b584] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b58c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b594] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b59c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b5fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b604] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b60c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b614] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b61c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b624] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b62c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b634] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b63c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b644] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b64c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b654] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b65c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b664] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b66c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b674] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b67c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b684] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b68c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b694] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b69c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b6fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b704] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b70c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b714] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b71c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b724] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b72c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b734] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b73c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b744] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b74c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b754] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b75c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b764] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b76c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b774] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b77c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b784] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b78c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b794] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b79c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b7fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b804] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b80c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b814] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b81c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b824] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b82c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b834] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b83c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b844] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b84c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b854] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b85c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b864] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b86c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b874] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b87c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b884] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b88c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b894] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b89c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b8fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b904] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b90c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b914] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b91c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b924] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b92c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b934] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b93c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b944] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b94c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b954] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b95c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b964] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b96c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b974] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b97c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b984] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b98c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b994] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b99c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9a4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9ac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9b4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9bc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9c4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9cc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9d4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9dc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9e4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9ec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9f4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$b9fc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$ba9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bab4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$babc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bac4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bacc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bad4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$badc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bae4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$baf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bafc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bb9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bba4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbe4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bbfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bc9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bca4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bccc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bce4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bcfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bd9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bda4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bddc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bde4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdf4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bdfc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$be9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bea4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bebc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bec4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$becc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bed4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bedc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bee4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$beec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bef4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$befc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf04] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf0c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf14] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf1c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf24] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf2c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf34] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf3c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf44] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf4c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf54] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf5c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf64] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf6c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf74] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf7c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf84] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf8c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf94] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bf9c] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfa4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfac] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfb4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfbc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfc4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfcc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfd4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfdc] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfe4] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bfec] undefined
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff   ; [$bff4] undefined
    .byte $ff,$ff,$ff,$ff                   ; [$bffc] undefined
