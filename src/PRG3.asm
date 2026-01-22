;============================================================================
; Faxanadu (U).nes
;
; PRG3 ($8000 - $bfff)
;============================================================================

    .segment "PRG3"
    .reloc


;============================================================================
; Relative offset to the area tables.
;============================================================================
AREAS_TABLE_PTR:                            ; [$8000]
    .word (AREA_TABLES-$8000) & $FFFF       ; AREA_TABLES
                                            ; [$PRG3::8000]


;============================================================================
; Table of area indexes to metadata tables.
;
; XREFS:
;     AREAS_TABLE_PTR [$PRG3::8000]
;============================================================================

;
; XREFS:
;     AREAS_TABLE_PTR [$PRG3::8000]
;
AREA_TABLES:                                ; [$8002]
    .word (EOLIS_AREA_DATA-$8000) & $FFFF   ; EOLIS_AREA_DATA
                                            ; [$PRG3::8002]
    .word (TRUNK_AREA_DATA-$8000) & $FFFF   ; TRUNK_AREA_DATA
                                            ; [$PRG3::8004]
    .word (MIST_AREA_DATA-$8000) & $FFFF    ; MIST_AREA_DATA
                                            ; [$PRG3::8006]
    .word (TOWNS_AREA_DATA-$8000) & $FFFF   ; TOWNS_AREA_DATA
                                            ; [$PRG3::8008]
    .word (BUILDINGS_AREA_DATA-$8000) & $FFFF ; BUILDINGS_AREA_DATA
                                              ; [$PRG3::800a]
    .word (BRANCH_AREA_DATA-$8000) & $FFFF  ; BRANCH_AREA_DATA
                                            ; [$PRG3::800c]
    .word (DARTMOOR_AREA_DATA-$8000) & $FFFF ; DARTMOOR_AREA_DATA
                                             ; [$PRG3::800e]
    .word (ZENITH_AREA_DATA-$8000) & $FFFF  ; ZENITH_AREA_DATA
                                            ; [$PRG3::8010]


;============================================================================
; Table of relative pointers from 0x8000 for the Eolis area.
;
; XREFS:
;     AREA_TABLES [$PRG3::8002]
;============================================================================

;
; XREFS:
;     AREA_TABLES [$PRG3::8002]
;
EOLIS_AREA_DATA:                            ; [$8012]
    .word (EOLIS_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; EOLIS_AREA_DATA.blockAttrsRelPtr
                                                           ; [$PRG3::8012]
    .word (EOLIS_BLOCK_PROPERTIES-$8000) & $FFFF ; EOLIS_BLOCK_PROPERTIES
                                                 ; [$PRG3::8014]
    .word (EOLIS_SCROLL_DATA-$8000) & $FFFF ; EOLIS_SCROLL_DATA
                                            ; [$PRG3::8016]
    .word (EOLIS_DOOR_LOCATIONS-$8000) & $FFFF ; EOLIS_DOOR_LOCATIONS
                                               ; [$PRG3::8018]
    .word (EOLIS_DOOR_DESTINATIONS-$8000) & $FFFF ; EOLIS_DOOR_DESTINATIONS
                                                  ; [$PRG3::801a]

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8012]
;
EOLIS_AREA_DATA_blockAttrsRelPtr:           ; [$801c]
    .word (EOLIS_BLOCK_ATTRIBUTES-$8000) & $FFFF ; EOLIS_BLOCK_ATTRIBUTES
                                                 ; [$PRG3::801c]
    .word (EOLIS_BLOCK_DATA_01-$8000) & $FFFF ; EOLIS_BLOCK_DATA_01
                                              ; [$PRG3::801e]
    .word (EOLIS_BLOCK_DATA_02-$8000) & $FFFF ; EOLIS_BLOCK_DATA_02
                                              ; [$PRG3::8020]
    .word (EOLIS_BLOCK_DATA_03-$8000) & $FFFF ; EOLIS_BLOCK_DATA_03
                                              ; [$PRG3::8022]
    .word (EOLIS_BLOCK_DATA_04-$8000) & $FFFF ; EOLIS_BLOCK_DATA_04
                                              ; [$PRG3::8024]


;============================================================================
; Eolis block attributes
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::801c]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::801c]
;
EOLIS_BLOCK_ATTRIBUTES:                     ; [$8026]
    .byte $00                               ; [0]:
    .byte $aa                               ; [1]:
    .byte $55                               ; [2]:
    .byte $55                               ; [3]:
    .byte $55                               ; [4]:
    .byte $55                               ; [5]:
    .byte $55                               ; [6]:
    .byte $55                               ; [7]:
    .byte $55                               ; [8]:
    .byte $55                               ; [9]:
    .byte $55                               ; [10]:
    .byte $55                               ; [11]:
    .byte $aa                               ; [12]:
    .byte $55                               ; [13]:
    .byte $55                               ; [14]:
    .byte $aa                               ; [15]:
    .byte $55                               ; [16]:
    .byte $55                               ; [17]:
    .byte $55                               ; [18]:
    .byte $55                               ; [19]:
    .byte $55                               ; [20]:
    .byte $55                               ; [21]:
    .byte $55                               ; [22]:
    .byte $55                               ; [23]:
    .byte $55                               ; [24]:
    .byte $55                               ; [25]:
    .byte $55                               ; [26]:
    .byte $aa                               ; [27]:
    .byte $55                               ; [28]:
    .byte $55                               ; [29]:
    .byte $55                               ; [30]:
    .byte $55                               ; [31]:
    .byte $55                               ; [32]:
    .byte $55                               ; [33]:
    .byte $55                               ; [34]:
    .byte $55                               ; [35]:
    .byte $55                               ; [36]:
    .byte $aa                               ; [37]:
    .byte $55                               ; [38]:
    .byte $55                               ; [39]:
    .byte $aa                               ; [40]:
    .byte $55                               ; [41]:
    .byte $55                               ; [42]:
    .byte $55                               ; [43]:
    .byte $55                               ; [44]:
    .byte $55                               ; [45]:
    .byte $55                               ; [46]:
    .byte $aa                               ; [47]:
    .byte $00                               ; [48]:
    .byte $55                               ; [49]:
    .byte $00                               ; [50]:
    .byte $aa                               ; [51]:
    .byte $aa                               ; [52]:
    .byte $55                               ; [53]:
    .byte $55                               ; [54]:
    .byte $55                               ; [55]:
    .byte $55                               ; [56]:
    .byte $55                               ; [57]:
    .byte $55                               ; [58]:
    .byte $55                               ; [59]:
    .byte $55                               ; [60]:
    .byte $55                               ; [61]:
    .byte $55                               ; [62]:
    .byte $55                               ; [63]:
    .byte $55                               ; [64]:
    .byte $55                               ; [65]:
    .byte $aa                               ; [66]:
    .byte $aa                               ; [67]:
    .byte $55                               ; [68]:
    .byte $aa                               ; [69]:
    .byte $aa                               ; [70]:
    .byte $aa                               ; [71]:
    .byte $55                               ; [72]:
    .byte $55                               ; [73]:
    .byte $aa                               ; [74]:
    .byte $55                               ; [75]:
    .byte $55                               ; [76]:
    .byte $55                               ; [77]:
    .byte $55                               ; [78]:
    .byte $55                               ; [79]:
    .byte $55                               ; [80]:
    .byte $55                               ; [81]:
    .byte $aa                               ; [82]:
    .byte $55                               ; [83]:
    .byte $55                               ; [84]:
    .byte $55                               ; [85]:
    .byte $aa                               ; [86]:
    .byte $55                               ; [87]:
    .byte $55                               ; [88]:
    .byte $55                               ; [89]:
    .byte $55                               ; [90]:
    .byte $55                               ; [91]:
    .byte $55                               ; [92]:
    .byte $55                               ; [93]:
    .byte $55                               ; [94]:
    .byte $55                               ; [95]:
    .byte $aa                               ; [96]:
    .byte $55                               ; [97]:
    .byte $aa                               ; [98]:
    .byte $55                               ; [99]:
    .byte $55                               ; [100]:
    .byte $55                               ; [101]:
    .byte $55                               ; [102]:
    .byte $55                               ; [103]:
    .byte $55                               ; [104]:
    .byte $55                               ; [105]:
    .byte $aa                               ; [106]:
    .byte $aa                               ; [107]:
    .byte $aa                               ; [108]:
    .byte $aa                               ; [109]:
    .byte $aa                               ; [110]:
    .byte $55                               ; [111]:
    .byte $55                               ; [112]:
    .byte $00                               ; [113]:
    .byte $aa                               ; [114]:
    .byte $aa                               ; [115]:
    .byte $55                               ; [116]:
    .byte $55                               ; [117]:
    .byte $55                               ; [118]:
    .byte $55                               ; [119]:
    .byte $55                               ; [120]:
    .byte $55                               ; [121]:
    .byte $55                               ; [122]:
    .byte $aa                               ; [123]:
    .byte $aa                               ; [124]:
    .byte $aa                               ; [125]:
    .byte $aa                               ; [126]:
    .byte $aa                               ; [127]:


;============================================================================
; Eolis block data (1)
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::801e]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::801e]
;
EOLIS_BLOCK_DATA_01:                        ; [$80a6]
    .byte $00                               ; [0]:
    .byte $83                               ; [1]:
    .byte $95                               ; [2]:
    .byte $96                               ; [3]:
    .byte $83                               ; [4]:
    .byte $b0                               ; [5]:
    .byte $90                               ; [6]:
    .byte $ab                               ; [7]:
    .byte $83                               ; [8]:
    .byte $92                               ; [9]:
    .byte $af                               ; [10]:
    .byte $8f                               ; [11]:
    .byte $83                               ; [12]:
    .byte $ac                               ; [13]:
    .byte $d8                               ; [14]:
    .byte $83                               ; [15]:
    .byte $a6                               ; [16]:
    .byte $d8                               ; [17]:
    .byte $94                               ; [18]:
    .byte $a6                               ; [19]:
    .byte $af                               ; [20]:
    .byte $eb                               ; [21]:
    .byte $ac                               ; [22]:
    .byte $84                               ; [23]:
    .byte $df                               ; [24]:
    .byte $af                               ; [25]:
    .byte $ec                               ; [26]:
    .byte $83                               ; [27]:
    .byte $8e                               ; [28]:
    .byte $a6                               ; [29]:
    .byte $94                               ; [30]:
    .byte $af                               ; [31]:
    .byte $95                               ; [32]:
    .byte $d9                               ; [33]:
    .byte $a4                               ; [34]:
    .byte $c6                               ; [35]:
    .byte $93                               ; [36]:
    .byte $83                               ; [37]:
    .byte $ba                               ; [38]:
    .byte $ba                               ; [39]:
    .byte $f6                               ; [40]:
    .byte $c0                               ; [41]:
    .byte $97                               ; [42]:
    .byte $92                               ; [43]:
    .byte $ec                               ; [44]:
    .byte $cf                               ; [45]:
    .byte $8f                               ; [46]:
    .byte $d3                               ; [47]:
    .byte $95                               ; [48]:
    .byte $e1                               ; [49]:
    .byte $a4                               ; [50]:
    .byte $c7                               ; [51]:
    .byte $83                               ; [52]:
    .byte $83                               ; [53]:
    .byte $87                               ; [54]:
    .byte $95                               ; [55]:
    .byte $8d                               ; [56]:
    .byte $ab                               ; [57]:
    .byte $d0                               ; [58]:
    .byte $9f                               ; [59]:
    .byte $00                               ; [60]:
    .byte $a4                               ; [61]:
    .byte $b6                               ; [62]:
    .byte $b4                               ; [63]:
    .byte $93                               ; [64]:
    .byte $8d                               ; [65]:
    .byte $a5                               ; [66]:
    .byte $be                               ; [67]:
    .byte $a2                               ; [68]:
    .byte $83                               ; [69]:
    .byte $c8                               ; [70]:
    .byte $86                               ; [71]:
    .byte $91                               ; [72]:
    .byte $00                               ; [73]:
    .byte $f0                               ; [74]:
    .byte $8c                               ; [75]:
    .byte $cd                               ; [76]:
    .byte $81                               ; [77]:
    .byte $d4                               ; [78]:
    .byte $c1                               ; [79]:
    .byte $ca                               ; [80]:
    .byte $87                               ; [81]:
    .byte $00                               ; [82]:
    .byte $93                               ; [83]:
    .byte $94                               ; [84]:
    .byte $a9                               ; [85]:
    .byte $83                               ; [86]:
    .byte $a4                               ; [87]:
    .byte $af                               ; [88]:
    .byte $b4                               ; [89]:
    .byte $ca                               ; [90]:
    .byte $af                               ; [91]:
    .byte $d8                               ; [92]:
    .byte $d9                               ; [93]:
    .byte $93                               ; [94]:
    .byte $94                               ; [95]:
    .byte $86                               ; [96]:
    .byte $fa                               ; [97]:
    .byte $83                               ; [98]:
    .byte $af                               ; [99]:
    .byte $b6                               ; [100]:
    .byte $ab                               ; [101]:
    .byte $e5                               ; [102]:
    .byte $83                               ; [103]:
    .byte $e8                               ; [104]:
    .byte $eb                               ; [105]:
    .byte $83                               ; [106]:
    .byte $f2                               ; [107]:
    .byte $f1                               ; [108]:
    .byte $be                               ; [109]:
    .byte $83                               ; [110]:
    .byte $94                               ; [111]:
    .byte $ca                               ; [112]:
    .byte $95                               ; [113]:
    .byte $83                               ; [114]:
    .byte $d1                               ; [115]:
    .byte $93                               ; [116]:
    .byte $ba                               ; [117]:
    .byte $ba                               ; [118]:
    .byte $95                               ; [119]:
    .byte $c4                               ; [120]:
    .byte $95                               ; [121]:
    .byte $dd                               ; [122]:
    .byte $83                               ; [123]:
    .byte $8b                               ; [124]:
    .byte $83                               ; [125]:
    .byte $bf                               ; [126]:
    .byte $af                               ; [127]:


;============================================================================
; Eolis block data (2)
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8020]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8020]
;
EOLIS_BLOCK_DATA_02:                        ; [$8126]
    .byte $00                               ; [0]:
    .byte $83                               ; [1]:
    .byte $8e                               ; [2]:
    .byte $96                               ; [3]:
    .byte $83                               ; [4]:
    .byte $b1                               ; [5]:
    .byte $ab                               ; [6]:
    .byte $ab                               ; [7]:
    .byte $83                               ; [8]:
    .byte $92                               ; [9]:
    .byte $c4                               ; [10]:
    .byte $8f                               ; [11]:
    .byte $de                               ; [12]:
    .byte $ac                               ; [13]:
    .byte $94                               ; [14]:
    .byte $83                               ; [15]:
    .byte $a6                               ; [16]:
    .byte $94                               ; [17]:
    .byte $94                               ; [18]:
    .byte $94                               ; [19]:
    .byte $95                               ; [20]:
    .byte $ea                               ; [21]:
    .byte $ac                               ; [22]:
    .byte $85                               ; [23]:
    .byte $e0                               ; [24]:
    .byte $af                               ; [25]:
    .byte $8f                               ; [26]:
    .byte $dc                               ; [27]:
    .byte $a7                               ; [28]:
    .byte $a4                               ; [29]:
    .byte $94                               ; [30]:
    .byte $af                               ; [31]:
    .byte $94                               ; [32]:
    .byte $da                               ; [33]:
    .byte $a4                               ; [34]:
    .byte $c6                               ; [35]:
    .byte $da                               ; [36]:
    .byte $83                               ; [37]:
    .byte $a4                               ; [38]:
    .byte $94                               ; [39]:
    .byte $f7                               ; [40]:
    .byte $96                               ; [41]:
    .byte $83                               ; [42]:
    .byte $92                               ; [43]:
    .byte $85                               ; [44]:
    .byte $8f                               ; [45]:
    .byte $cf                               ; [46]:
    .byte $83                               ; [47]:
    .byte $95                               ; [48]:
    .byte $e2                               ; [49]:
    .byte $a4                               ; [50]:
    .byte $c8                               ; [51]:
    .byte $83                               ; [52]:
    .byte $c9                               ; [53]:
    .byte $87                               ; [54]:
    .byte $95                               ; [55]:
    .byte $8d                               ; [56]:
    .byte $85                               ; [57]:
    .byte $94                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $a7                               ; [61]:
    .byte $b8                               ; [62]:
    .byte $b7                               ; [63]:
    .byte $a4                               ; [64]:
    .byte $8d                               ; [65]:
    .byte $83                               ; [66]:
    .byte $d7                               ; [67]:
    .byte $a3                               ; [68]:
    .byte $c7                               ; [69]:
    .byte $83                               ; [70]:
    .byte $86                               ; [71]:
    .byte $91                               ; [72]:
    .byte $95                               ; [73]:
    .byte $f1                               ; [74]:
    .byte $cd                               ; [75]:
    .byte $91                               ; [76]:
    .byte $9b                               ; [77]:
    .byte $d6                               ; [78]:
    .byte $c2                               ; [79]:
    .byte $ca                               ; [80]:
    .byte $87                               ; [81]:
    .byte $87                               ; [82]:
    .byte $a4                               ; [83]:
    .byte $9f                               ; [84]:
    .byte $9a                               ; [85]:
    .byte $83                               ; [86]:
    .byte $a4                               ; [87]:
    .byte $af                               ; [88]:
    .byte $b7                               ; [89]:
    .byte $cb                               ; [90]:
    .byte $94                               ; [91]:
    .byte $d9                               ; [92]:
    .byte $da                               ; [93]:
    .byte $a4                               ; [94]:
    .byte $9f                               ; [95]:
    .byte $f9                               ; [96]:
    .byte $ac                               ; [97]:
    .byte $83                               ; [98]:
    .byte $94                               ; [99]:
    .byte $b8                               ; [100]:
    .byte $ab                               ; [101]:
    .byte $e5                               ; [102]:
    .byte $83                               ; [103]:
    .byte $ea                               ; [104]:
    .byte $ea                               ; [105]:
    .byte $f0                               ; [106]:
    .byte $f3                               ; [107]:
    .byte $83                               ; [108]:
    .byte $bf                               ; [109]:
    .byte $83                               ; [110]:
    .byte $a4                               ; [111]:
    .byte $b7                               ; [112]:
    .byte $fb                               ; [113]:
    .byte $84                               ; [114]:
    .byte $83                               ; [115]:
    .byte $a4                               ; [116]:
    .byte $ba                               ; [117]:
    .byte $ba                               ; [118]:
    .byte $9f                               ; [119]:
    .byte $92                               ; [120]:
    .byte $9f                               ; [121]:
    .byte $a4                               ; [122]:
    .byte $8a                               ; [123]:
    .byte $83                               ; [124]:
    .byte $be                               ; [125]:
    .byte $83                               ; [126]:
    .byte $ba                               ; [127]:


;============================================================================
; Eolis block data (3)
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8022]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8022]
;
EOLIS_BLOCK_DATA_03:                        ; [$81a6]
    .byte $00                               ; [0]:
    .byte $83                               ; [1]:
    .byte $ab                               ; [2]:
    .byte $94                               ; [3]:
    .byte $83                               ; [4]:
    .byte $d2                               ; [5]:
    .byte $a0                               ; [6]:
    .byte $ab                               ; [7]:
    .byte $96                               ; [8]:
    .byte $92                               ; [9]:
    .byte $c4                               ; [10]:
    .byte $8f                               ; [11]:
    .byte $de                               ; [12]:
    .byte $ab                               ; [13]:
    .byte $d8                               ; [14]:
    .byte $83                               ; [15]:
    .byte $a6                               ; [16]:
    .byte $d8                               ; [17]:
    .byte $95                               ; [18]:
    .byte $a6                               ; [19]:
    .byte $c4                               ; [20]:
    .byte $92                               ; [21]:
    .byte $9f                               ; [22]:
    .byte $84                               ; [23]:
    .byte $00                               ; [24]:
    .byte $af                               ; [25]:
    .byte $ec                               ; [26]:
    .byte $be                               ; [27]:
    .byte $8e                               ; [28]:
    .byte $a6                               ; [29]:
    .byte $af                               ; [30]:
    .byte $94                               ; [31]:
    .byte $d7                               ; [32]:
    .byte $d9                               ; [33]:
    .byte $a4                               ; [34]:
    .byte $a4                               ; [35]:
    .byte $93                               ; [36]:
    .byte $dc                               ; [37]:
    .byte $a4                               ; [38]:
    .byte $9c                               ; [39]:
    .byte $be                               ; [40]:
    .byte $d0                               ; [41]:
    .byte $94                               ; [42]:
    .byte $92                               ; [43]:
    .byte $ec                               ; [44]:
    .byte $8f                               ; [45]:
    .byte $8f                               ; [46]:
    .byte $8f                               ; [47]:
    .byte $95                               ; [48]:
    .byte $e3                               ; [49]:
    .byte $a4                               ; [50]:
    .byte $8a                               ; [51]:
    .byte $be                               ; [52]:
    .byte $96                               ; [53]:
    .byte $98                               ; [54]:
    .byte $92                               ; [55]:
    .byte $94                               ; [56]:
    .byte $d2                               ; [57]:
    .byte $83                               ; [58]:
    .byte $85                               ; [59]:
    .byte $af                               ; [60]:
    .byte $a4                               ; [61]:
    .byte $92                               ; [62]:
    .byte $93                               ; [63]:
    .byte $af                               ; [64]:
    .byte $94                               ; [65]:
    .byte $a7                               ; [66]:
    .byte $d7                               ; [67]:
    .byte $b2                               ; [68]:
    .byte $83                               ; [69]:
    .byte $8b                               ; [70]:
    .byte $ab                               ; [71]:
    .byte $94                               ; [72]:
    .byte $87                               ; [73]:
    .byte $bd                               ; [74]:
    .byte $98                               ; [75]:
    .byte $92                               ; [76]:
    .byte $ed                               ; [77]:
    .byte $d4                               ; [78]:
    .byte $d4                               ; [79]:
    .byte $94                               ; [80]:
    .byte $93                               ; [81]:
    .byte $00                               ; [82]:
    .byte $93                               ; [83]:
    .byte $94                               ; [84]:
    .byte $cc                               ; [85]:
    .byte $bf                               ; [86]:
    .byte $a4                               ; [87]:
    .byte $af                               ; [88]:
    .byte $93                               ; [89]:
    .byte $94                               ; [90]:
    .byte $af                               ; [91]:
    .byte $d8                               ; [92]:
    .byte $d9                               ; [93]:
    .byte $dd                               ; [94]:
    .byte $94                               ; [95]:
    .byte $ab                               ; [96]:
    .byte $ab                               ; [97]:
    .byte $de                               ; [98]:
    .byte $af                               ; [99]:
    .byte $c4                               ; [100]:
    .byte $d2                               ; [101]:
    .byte $83                               ; [102]:
    .byte $c0                               ; [103]:
    .byte $83                               ; [104]:
    .byte $eb                               ; [105]:
    .byte $83                               ; [106]:
    .byte $f4                               ; [107]:
    .byte $f1                               ; [108]:
    .byte $c7                               ; [109]:
    .byte $de                               ; [110]:
    .byte $94                               ; [111]:
    .byte $94                               ; [112]:
    .byte $fb                               ; [113]:
    .byte $83                               ; [114]:
    .byte $d1                               ; [115]:
    .byte $93                               ; [116]:
    .byte $9c                               ; [117]:
    .byte $94                               ; [118]:
    .byte $92                               ; [119]:
    .byte $92                               ; [120]:
    .byte $95                               ; [121]:
    .byte $92                               ; [122]:
    .byte $83                               ; [123]:
    .byte $d1                               ; [124]:
    .byte $83                               ; [125]:
    .byte $c8                               ; [126]:
    .byte $af                               ; [127]:


;============================================================================
; Eolis block data (4)
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8024]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8024]
;
EOLIS_BLOCK_DATA_04:                        ; [$8226]
    .byte $00                               ; [0]:
    .byte $83                               ; [1]:
    .byte $ab                               ; [2]:
    .byte $94                               ; [3]:
    .byte $83                               ; [4]:
    .byte $d2                               ; [5]:
    .byte $a1                               ; [6]:
    .byte $ab                               ; [7]:
    .byte $96                               ; [8]:
    .byte $92                               ; [9]:
    .byte $92                               ; [10]:
    .byte $8f                               ; [11]:
    .byte $8f                               ; [12]:
    .byte $ab                               ; [13]:
    .byte $94                               ; [14]:
    .byte $be                               ; [15]:
    .byte $c3                               ; [16]:
    .byte $94                               ; [17]:
    .byte $94                               ; [18]:
    .byte $94                               ; [19]:
    .byte $92                               ; [20]:
    .byte $fd                               ; [21]:
    .byte $9f                               ; [22]:
    .byte $85                               ; [23]:
    .byte $00                               ; [24]:
    .byte $95                               ; [25]:
    .byte $ce                               ; [26]:
    .byte $bf                               ; [27]:
    .byte $d7                               ; [28]:
    .byte $a4                               ; [29]:
    .byte $af                               ; [30]:
    .byte $94                               ; [31]:
    .byte $d7                               ; [32]:
    .byte $da                               ; [33]:
    .byte $a4                               ; [34]:
    .byte $a4                               ; [35]:
    .byte $da                               ; [36]:
    .byte $83                               ; [37]:
    .byte $a4                               ; [38]:
    .byte $94                               ; [39]:
    .byte $bf                               ; [40]:
    .byte $8e                               ; [41]:
    .byte $a5                               ; [42]:
    .byte $92                               ; [43]:
    .byte $85                               ; [44]:
    .byte $ce                               ; [45]:
    .byte $cf                               ; [46]:
    .byte $d3                               ; [47]:
    .byte $95                               ; [48]:
    .byte $e4                               ; [49]:
    .byte $a4                               ; [50]:
    .byte $8b                               ; [51]:
    .byte $bf                               ; [52]:
    .byte $d0                               ; [53]:
    .byte $98                               ; [54]:
    .byte $92                               ; [55]:
    .byte $94                               ; [56]:
    .byte $d2                               ; [57]:
    .byte $cd                               ; [58]:
    .byte $87                               ; [59]:
    .byte $af                               ; [60]:
    .byte $a7                               ; [61]:
    .byte $92                               ; [62]:
    .byte $a4                               ; [63]:
    .byte $af                               ; [64]:
    .byte $94                               ; [65]:
    .byte $a5                               ; [66]:
    .byte $a7                               ; [67]:
    .byte $b3                               ; [68]:
    .byte $8a                               ; [69]:
    .byte $83                               ; [70]:
    .byte $ab                               ; [71]:
    .byte $94                               ; [72]:
    .byte $87                               ; [73]:
    .byte $f1                               ; [74]:
    .byte $8d                               ; [75]:
    .byte $94                               ; [76]:
    .byte $9a                               ; [77]:
    .byte $d6                               ; [78]:
    .byte $d6                               ; [79]:
    .byte $94                               ; [80]:
    .byte $a4                               ; [81]:
    .byte $00                               ; [82]:
    .byte $a4                               ; [83]:
    .byte $9f                               ; [84]:
    .byte $aa                               ; [85]:
    .byte $83                               ; [86]:
    .byte $a8                               ; [87]:
    .byte $af                               ; [88]:
    .byte $a4                               ; [89]:
    .byte $9f                               ; [90]:
    .byte $94                               ; [91]:
    .byte $d9                               ; [92]:
    .byte $da                               ; [93]:
    .byte $a4                               ; [94]:
    .byte $d1                               ; [95]:
    .byte $ab                               ; [96]:
    .byte $ab                               ; [97]:
    .byte $ce                               ; [98]:
    .byte $d7                               ; [99]:
    .byte $92                               ; [100]:
    .byte $d2                               ; [101]:
    .byte $83                               ; [102]:
    .byte $96                               ; [103]:
    .byte $e9                               ; [104]:
    .byte $ea                               ; [105]:
    .byte $f0                               ; [106]:
    .byte $f5                               ; [107]:
    .byte $83                               ; [108]:
    .byte $c8                               ; [109]:
    .byte $d3                               ; [110]:
    .byte $a4                               ; [111]:
    .byte $a4                               ; [112]:
    .byte $a4                               ; [113]:
    .byte $84                               ; [114]:
    .byte $83                               ; [115]:
    .byte $ba                               ; [116]:
    .byte $9c                               ; [117]:
    .byte $94                               ; [118]:
    .byte $92                               ; [119]:
    .byte $92                               ; [120]:
    .byte $9f                               ; [121]:
    .byte $92                               ; [122]:
    .byte $84                               ; [123]:
    .byte $83                               ; [124]:
    .byte $c7                               ; [125]:
    .byte $83                               ; [126]:
    .byte $9c                               ; [127]:


;============================================================================
; Eolis block properties
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8014]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8014]
;
EOLIS_BLOCK_PROPERTIES:                     ; [$82a6]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_IS_AIR                      ; [1]:
    .byte BLOCK_IS_AIR                      ; [2]:
    .byte BLOCK_IS_SOLID                    ; [3]:
    .byte BLOCK_IS_SOLID                    ; [4]:
    .byte BLOCK_IS_AIR                      ; [5]:
    .byte BLOCK_IS_AIR                      ; [6]:
    .byte BLOCK_IS_AIR                      ; [7]:
    .byte BLOCK_IS_SOLID                    ; [8]:
    .byte BLOCK_IS_AIR                      ; [9]:
    .byte BLOCK_IS_AIR                      ; [10]:
    .byte BLOCK_IS_AIR                      ; [11]:
    .byte BLOCK_IS_AIR                      ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_IS_SOLID                    ; [14]:
    .byte BLOCK_IS_AIR                      ; [15]:
    .byte BLOCK_IS_AIR                      ; [16]:
    .byte BLOCK_IS_AIR                      ; [17]:
    .byte BLOCK_IS_AIR                      ; [18]:
    .byte BLOCK_IS_AIR                      ; [19]:
    .byte BLOCK_IS_AIR                      ; [20]:
    .byte BLOCK_IS_AIR                      ; [21]:
    .byte BLOCK_IS_AIR                      ; [22]:
    .byte BLOCK_IS_SOLID                    ; [23]:
    .byte BLOCK_IS_AIR                      ; [24]:
    .byte BLOCK_IS_AIR                      ; [25]:
    .byte BLOCK_IS_AIR                      ; [26]:
    .byte BLOCK_IS_AIR                      ; [27]:
    .byte BLOCK_IS_AIR                      ; [28]:
    .byte BLOCK_IS_AIR                      ; [29]:
    .byte BLOCK_IS_AIR                      ; [30]:
    .byte BLOCK_IS_AIR                      ; [31]:
    .byte BLOCK_IS_AIR                      ; [32]:
    .byte BLOCK_IS_AIR                      ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_IS_AIR                      ; [35]:
    .byte BLOCK_IS_AIR                      ; [36]:
    .byte BLOCK_IS_AIR                      ; [37]:
    .byte BLOCK_IS_AIR                      ; [38]:
    .byte BLOCK_IS_AIR                      ; [39]:
    .byte BLOCK_IS_AIR                      ; [40]:
    .byte BLOCK_IS_SOLID                    ; [41]:
    .byte BLOCK_IS_SOLID                    ; [42]:
    .byte BLOCK_IS_SOLID                    ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_IS_AIR                      ; [46]:
    .byte BLOCK_IS_AIR                      ; [47]:
    .byte BLOCK_IS_AIR                      ; [48]:
    .byte BLOCK_IS_AIR                      ; [49]:
    .byte BLOCK_IS_AIR                      ; [50]:
    .byte BLOCK_IS_AIR                      ; [51]:
    .byte BLOCK_IS_AIR                      ; [52]:
    .byte BLOCK_IS_SOLID                    ; [53]:
    .byte BLOCK_IS_AIR                      ; [54]:
    .byte BLOCK_IS_AIR                      ; [55]:
    .byte BLOCK_IS_SOLID                    ; [56]:
    .byte BLOCK_IS_AIR                      ; [57]:
    .byte BLOCK_IS_AIR                      ; [58]:
    .byte BLOCK_IS_AIR                      ; [59]:
    .byte BLOCK_IS_AIR                      ; [60]:
    .byte BLOCK_IS_SOLID                    ; [61]:
    .byte BLOCK_IS_DOOR                     ; [62]:
    .byte BLOCK_IS_AIR                      ; [63]:
    .byte BLOCK_IS_AIR                      ; [64]:
    .byte BLOCK_IS_AIR                      ; [65]:
    .byte BLOCK_IS_AIR                      ; [66]:
    .byte BLOCK_IS_AIR                      ; [67]:
    .byte BLOCK_IS_AIR                      ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_AIR                      ; [70]:
    .byte BLOCK_IS_AIR                      ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_AIR                      ; [73]:
    .byte BLOCK_IS_AIR                      ; [74]:
    .byte BLOCK_IS_AIR                      ; [75]:
    .byte BLOCK_IS_AIR                      ; [76]:
    .byte BLOCK_IS_AIR                      ; [77]:
    .byte BLOCK_IS_DOOR                     ; [78]:
    .byte BLOCK_IS_DOOR                     ; [79]:
    .byte BLOCK_IS_AIR                      ; [80]:
    .byte BLOCK_IS_AIR                      ; [81]:
    .byte BLOCK_IS_AIR                      ; [82]:
    .byte BLOCK_IS_AIR                      ; [83]:
    .byte BLOCK_IS_AIR                      ; [84]:
    .byte BLOCK_IS_AIR                      ; [85]:
    .byte BLOCK_IS_AIR                      ; [86]:
    .byte BLOCK_IS_AIR                      ; [87]:
    .byte BLOCK_IS_AIR                      ; [88]:
    .byte BLOCK_IS_AIR                      ; [89]:
    .byte BLOCK_IS_AIR                      ; [90]:
    .byte BLOCK_IS_AIR                      ; [91]:
    .byte BLOCK_FOREGROUND                  ; [92]:
    .byte BLOCK_FOREGROUND                  ; [93]:
    .byte BLOCK_IS_AIR                      ; [94]:
    .byte BLOCK_IS_AIR                      ; [95]:
    .byte BLOCK_IS_AIR                      ; [96]:
    .byte BLOCK_IS_AIR                      ; [97]:
    .byte BLOCK_IS_AIR                      ; [98]:
    .byte BLOCK_IS_AIR                      ; [99]:
    .byte BLOCK_IS_AIR                      ; [100]:
    .byte BLOCK_IS_AIR                      ; [101]:
    .byte BLOCK_IS_AIR                      ; [102]:
    .byte BLOCK_IS_SOLID                    ; [103]:
    .byte BLOCK_IS_AIR                      ; [104]:
    .byte BLOCK_IS_AIR                      ; [105]:
    .byte BLOCK_IS_AIR                      ; [106]:
    .byte BLOCK_IS_AIR                      ; [107]:
    .byte BLOCK_IS_AIR                      ; [108]:
    .byte BLOCK_IS_AIR                      ; [109]:
    .byte BLOCK_IS_AIR                      ; [110]:
    .byte BLOCK_IS_DOOR                     ; [111]:
    .byte BLOCK_IS_AIR                      ; [112]:
    .byte BLOCK_IS_AIR                      ; [113]:
    .byte BLOCK_IS_AIR                      ; [114]:
    .byte BLOCK_IS_AIR                      ; [115]:
    .byte BLOCK_IS_AIR                      ; [116]:
    .byte BLOCK_IS_AIR                      ; [117]:
    .byte BLOCK_IS_AIR                      ; [118]:
    .byte BLOCK_IS_AIR                      ; [119]:
    .byte BLOCK_IS_AIR                      ; [120]:
    .byte BLOCK_IS_AIR                      ; [121]:
    .byte BLOCK_IS_AIR                      ; [122]:
    .byte BLOCK_IS_AIR                      ; [123]:
    .byte BLOCK_IS_AIR                      ; [124]:
    .byte BLOCK_IS_AIR                      ; [125]:
    .byte BLOCK_IS_AIR                      ; [126]:
    .byte BLOCK_IS_AIR                      ; [127]:


;============================================================================
; Eolis scroll data
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8016]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8016]
;
EOLIS_SCROLL_DATA:                          ; [$8326]
    .byte $ff                               ; [0]:
    .byte $ff                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $02                               ; [4]:
    .byte $08                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $03                               ; [8]:
    .byte $01                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $04                               ; [12]:
    .byte $02                               ; [13]:
    .byte $ff                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $05                               ; [16]:
    .byte $03                               ; [17]:
    .byte $ff                               ; [18]:
    .byte $ff                               ; [19]:
    .byte $06                               ; [20]:
    .byte $04                               ; [21]:
    .byte $ff                               ; [22]:
    .byte $ff                               ; [23]:
    .byte $07                               ; [24]:
    .byte $05                               ; [25]:
    .byte $ff                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $ff                               ; [28]:
    .byte $06                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $01                               ; [32]:
    .byte $ff                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $ff                               ; [35]:


;============================================================================
; Eolis door locations
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8018]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::8018]
;
EOLIS_DOOR_LOCATIONS:                       ; [$834a]
    .byte $00                               ; [0]:
    .byte $9c                               ; [1]:
    .byte $00                               ; [2]:
    .byte $99                               ; [3]:
    .byte $01                               ; [4]:
    .byte $93                               ; [5]:
    .byte $20                               ; [6]:
    .byte $00                               ; [7]:
    .byte $02                               ; [8]:
    .byte $9e                               ; [9]:
    .byte $21                               ; [10]:
    .byte $00                               ; [11]:
    .byte $02                               ; [12]:
    .byte $95                               ; [13]:
    .byte $22                               ; [14]:
    .byte $00                               ; [15]:
    .byte $03                               ; [16]:
    .byte $9d                               ; [17]:
    .byte $23                               ; [18]:
    .byte $00                               ; [19]:
    .byte $03                               ; [20]:
    .byte $9a                               ; [21]:
    .byte $24                               ; [22]:
    .byte $00                               ; [23]:
    .byte $06                               ; [24]:
    .byte $9c                               ; [25]:
    .byte $25                               ; [26]:
    .byte $00                               ; [27]:
    .byte $06                               ; [28]:
    .byte $9a                               ; [29]:
    .byte $26                               ; [30]:
    .byte $00                               ; [31]:
    .byte $07                               ; [32]:
    .byte $98                               ; [33]:
    .byte $27                               ; [34]:
    .byte $00                               ; [35]:
    .byte $08                               ; [36]:
    .byte $9c                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $a1                               ; [39]:
    .byte $ff                               ; [40]:


;============================================================================
; Eolis door destinations
;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::801a]
;============================================================================

;
; XREFS:
;     EOLIS_AREA_DATA [$PRG3::801a]
;
EOLIS_DOOR_DESTINATIONS:                    ; [$8373]
    .byte $01,$00,$00,$00,$00,$00,$00,$00   ; [$8373] undefined
    .byte $41,$00,$a2,$00,$00,$00,$00,$00   ; [$837b] undefined
    .byte $a7,$00,$0f,$00,$00,$00,$00,$00   ; [$8383] undefined
    .byte $4a,$00,$0f,$00,$00,$00,$00,$00   ; [$838b] undefined
    .byte $34,$00,$00,$00,$00,$00,$00,$00   ; [$8393] undefined
    .byte $f6,$00,$00,$00,$00,$00,$00,$00   ; [$839b] undefined
    .byte $3b,$00,$c5,$00,$00,$00,$00,$00   ; [$83a3] undefined
    .byte $c0,$00,$12,$00,$00,$00,$00,$10   ; [$83ab] undefined
    .byte $61,$00,$06,$00,$00,$00,$00,$00   ; [$83b3] undefined
    .byte $a7,$00,$c0,$00,$00,$00,$00,$00   ; [$83bb] undefined
    .byte $24,$00,$20,$00,$00,$00,$00,$00   ; [$83c3] undefined
    .byte $11,$00,$00,$00,$00,$00,$00,$00   ; [$83cb] undefined
    .byte $06,$00,$00,$00,$00,$00,$00,$00   ; [$83d3] undefined
    .byte $f8,$00,$00,$00,$00,$00,$00,$00   ; [$83db] undefined
    .byte $54,$00,$10,$00,$00,$00,$00,$00   ; [$83e3] undefined
    .byte $1c,$00,$42,$00,$00,$00,$00,$00   ; [$83eb] undefined
    .byte $00,$07,$00,$00,$01,$06,$00,$00   ; [$83f3] undefined
    .byte $02,$01,$00,$00,$03,$05,$00,$00   ; [$83fb] undefined
    .byte $04,$04,$00,$00,$05,$09,$06,$00   ; [$8403] undefined
    .byte $06,$08,$06,$00,$07,$00,$06,$00   ; [$840b] undefined

TRUNK_AREA_DATA:                            ; [$8413]
    .word (TRUNK_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; TRUNK_AREA_DATA.blockAttrsRelPtr
                                                           ; [$PRG3::8413]
    .word (TRUNK_BLOCK_PROPERTIES-$8000) & $FFFF ; TRUNK_BLOCK_PROPERTIES
                                                 ; [$PRG3::8415]
    .word (TRUNK_SCROLL_DATA-$8000) & $FFFF ; TRUNK_SCROLL_DATA
                                            ; [$PRG3::8417]
    .word (TRUNK_DOOR_LOCATIONS-$8000) & $FFFF ; TRUNK_DOOR_LOCATIONS
                                               ; [$PRG3::8419]
    .word (TRUNK_DOOR_DESTINATIONS-$8000) & $FFFF ; TRUNK_DOOR_DESTINATIONS
                                                  ; [$PRG3::841b]

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8413]
;
TRUNK_AREA_DATA_blockAttrsRelPtr:           ; [$841d]
    .word (TRUNK_BLOCK_ATTRIBUTES-$8000) & $FFFF ; TRUNK_BLOCK_ATTRIBUTES
                                                 ; [$PRG3::841d]
    .word (TRUNK_BLOCK_DATA_01-$8000) & $FFFF ; TRUNK_BLOCK_DATA_01
                                              ; [$PRG3::841f]
    .word (TRUNK_BLOCK_DATA_02-$8000) & $FFFF ; TRUNK_BLOCK_DATA_02
                                              ; [$PRG3::8421]
    .word (TRUNK_BLOCK_DATA_03-$8000) & $FFFF ; TRUNK_BLOCK_DATA_03
                                              ; [$PRG3::8423]
    .word (TRUNK_BLOCK_DATA_04-$8000) & $FFFF ; TRUNK_BLOCK_DATA_04
                                              ; [$PRG3::8425]

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::841d]
;
TRUNK_BLOCK_ATTRIBUTES:                     ; [$8427]
    .byte $00                               ; [0]:
    .byte $55                               ; [1]:
    .byte $55                               ; [2]:
    .byte $55                               ; [3]:
    .byte $55                               ; [4]:
    .byte $55                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $ff                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
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
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $ff                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $00                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $ff                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $00                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $ff                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $ff                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $00                               ; [64]:
    .byte $00                               ; [65]:
    .byte $00                               ; [66]:
    .byte $ff                               ; [67]:
    .byte $ff                               ; [68]:
    .byte $00                               ; [69]:
    .byte $00                               ; [70]:
    .byte $00                               ; [71]:
    .byte $00                               ; [72]:
    .byte $00                               ; [73]:
    .byte $00                               ; [74]:
    .byte $00                               ; [75]:
    .byte $00                               ; [76]:
    .byte $00                               ; [77]:
    .byte $00                               ; [78]:
    .byte $ff                               ; [79]:
    .byte $ff                               ; [80]:
    .byte $00                               ; [81]:
    .byte $55                               ; [82]:
    .byte $ff                               ; [83]:
    .byte $00                               ; [84]:
    .byte $00                               ; [85]:
    .byte $ff                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $00                               ; [89]:
    .byte $00                               ; [90]:
    .byte $00                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:
    .byte $00                               ; [94]:
    .byte $00                               ; [95]:
    .byte $00                               ; [96]:
    .byte $00                               ; [97]:
    .byte $00                               ; [98]:
    .byte $00                               ; [99]:
    .byte $00                               ; [100]:
    .byte $00                               ; [101]:
    .byte $00                               ; [102]:
    .byte $00                               ; [103]:
    .byte $00                               ; [104]:
    .byte $00                               ; [105]:
    .byte $00                               ; [106]:
    .byte $00                               ; [107]:
    .byte $55                               ; [108]:
    .byte $00                               ; [109]:
    .byte $00                               ; [110]:
    .byte $00                               ; [111]:
    .byte $00                               ; [112]:
    .byte $00                               ; [113]:
    .byte $55                               ; [114]:
    .byte $00                               ; [115]:
    .byte $00                               ; [116]:
    .byte $55                               ; [117]:
    .byte $00                               ; [118]:
    .byte $00                               ; [119]:
    .byte $00                               ; [120]:
    .byte $00                               ; [121]:
    .byte $00                               ; [122]:
    .byte $55                               ; [123]:
    .byte $00                               ; [124]:
    .byte $00                               ; [125]:
    .byte $00                               ; [126]:
    .byte $00                               ; [127]:
    .byte $ff                               ; [128]:
    .byte $ff                               ; [129]:
    .byte $ff                               ; [130]:
    .byte $ff                               ; [131]:
    .byte $ff                               ; [132]:
    .byte $00                               ; [133]:
    .byte $00                               ; [134]:
    .byte $00                               ; [135]:
    .byte $ff                               ; [136]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::841f]
;
TRUNK_BLOCK_DATA_01:                        ; [$84b0]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $80                               ; [2]:
    .byte $91                               ; [3]:
    .byte $80                               ; [4]:
    .byte $80                               ; [5]:
    .byte $86                               ; [6]:
    .byte $89                               ; [7]:
    .byte $a5                               ; [8]:
    .byte $8b                               ; [9]:
    .byte $95                               ; [10]:
    .byte $94                               ; [11]:
    .byte $93                               ; [12]:
    .byte $94                               ; [13]:
    .byte $91                               ; [14]:
    .byte $95                               ; [15]:
    .byte $82                               ; [16]:
    .byte $83                               ; [17]:
    .byte $81                               ; [18]:
    .byte $82                               ; [19]:
    .byte $89                               ; [20]:
    .byte $82                               ; [21]:
    .byte $85                               ; [22]:
    .byte $8d                               ; [23]:
    .byte $b0                               ; [24]:
    .byte $8a                               ; [25]:
    .byte $8b                               ; [26]:
    .byte $a4                               ; [27]:
    .byte $85                               ; [28]:
    .byte $95                               ; [29]:
    .byte $95                               ; [30]:
    .byte $85                               ; [31]:
    .byte $8e                               ; [32]:
    .byte $96                               ; [33]:
    .byte $95                               ; [34]:
    .byte $a9                               ; [35]:
    .byte $95                               ; [36]:
    .byte $92                               ; [37]:
    .byte $97                               ; [38]:
    .byte $95                               ; [39]:
    .byte $85                               ; [40]:
    .byte $85                               ; [41]:
    .byte $85                               ; [42]:
    .byte $a0                               ; [43]:
    .byte $96                               ; [44]:
    .byte $ce                               ; [45]:
    .byte $92                               ; [46]:
    .byte $ce                               ; [47]:
    .byte $84                               ; [48]:
    .byte $99                               ; [49]:
    .byte $a9                               ; [50]:
    .byte $9d                               ; [51]:
    .byte $b0                               ; [52]:
    .byte $a2                               ; [53]:
    .byte $ad                               ; [54]:
    .byte $c6                               ; [55]:
    .byte $9c                               ; [56]:
    .byte $a7                               ; [57]:
    .byte $a5                               ; [58]:
    .byte $cf                               ; [59]:
    .byte $c0                               ; [60]:
    .byte $b0                               ; [61]:
    .byte $a4                               ; [62]:
    .byte $81                               ; [63]:
    .byte $00                               ; [64]:
    .byte $9b                               ; [65]:
    .byte $a7                               ; [66]:
    .byte $f5                               ; [67]:
    .byte $b0                               ; [68]:
    .byte $a7                               ; [69]:
    .byte $a8                               ; [70]:
    .byte $a2                               ; [71]:
    .byte $bf                               ; [72]:
    .byte $9d                               ; [73]:
    .byte $85                               ; [74]:
    .byte $85                               ; [75]:
    .byte $96                               ; [76]:
    .byte $cb                               ; [77]:
    .byte $a5                               ; [78]:
    .byte $f3                               ; [79]:
    .byte $c4                               ; [80]:
    .byte $a7                               ; [81]:
    .byte $81                               ; [82]:
    .byte $81                               ; [83]:
    .byte $dd                               ; [84]:
    .byte $ed                               ; [85]:
    .byte $a0                               ; [86]:
    .byte $85                               ; [87]:
    .byte $c4                               ; [88]:
    .byte $98                               ; [89]:
    .byte $97                               ; [90]:
    .byte $f3                               ; [91]:
    .byte $9b                               ; [92]:
    .byte $d2                               ; [93]:
    .byte $d8                               ; [94]:
    .byte $d9                               ; [95]:
    .byte $d9                               ; [96]:
    .byte $cd                               ; [97]:
    .byte $81                               ; [98]:
    .byte $a5                               ; [99]:
    .byte $d8                               ; [100]:
    .byte $a5                               ; [101]:
    .byte $c0                               ; [102]:
    .byte $a5                               ; [103]:
    .byte $a4                               ; [104]:
    .byte $00                               ; [105]:
    .byte $00                               ; [106]:
    .byte $e4                               ; [107]:
    .byte $c6                               ; [108]:
    .byte $b5                               ; [109]:
    .byte $d3                               ; [110]:
    .byte $e4                               ; [111]:
    .byte $d2                               ; [112]:
    .byte $9b                               ; [113]:
    .byte $81                               ; [114]:
    .byte $9b                               ; [115]:
    .byte $db                               ; [116]:
    .byte $a0                               ; [117]:
    .byte $9c                               ; [118]:
    .byte $ea                               ; [119]:
    .byte $eb                               ; [120]:
    .byte $f7                               ; [121]:
    .byte $f9                               ; [122]:
    .byte $b0                               ; [123]:
    .byte $e5                               ; [124]:
    .byte $9c                               ; [125]:
    .byte $e8                               ; [126]:
    .byte $8b                               ; [127]:
    .byte $8e                               ; [128]:
    .byte $a5                               ; [129]:
    .byte $b0                               ; [130]:
    .byte $b0                               ; [131]:
    .byte $b0                               ; [132]:
    .byte $b8                               ; [133]:
    .byte $ac                               ; [134]:
    .byte $a5                               ; [135]:
    .byte $c6                               ; [136]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8421]
;
TRUNK_BLOCK_DATA_02:                        ; [$8539]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $80                               ; [2]:
    .byte $93                               ; [3]:
    .byte $80                               ; [4]:
    .byte $80                               ; [5]:
    .byte $86                               ; [6]:
    .byte $96                               ; [7]:
    .byte $a6                               ; [8]:
    .byte $8b                               ; [9]:
    .byte $95                               ; [10]:
    .byte $92                               ; [11]:
    .byte $94                               ; [12]:
    .byte $94                               ; [13]:
    .byte $93                               ; [14]:
    .byte $8b                               ; [15]:
    .byte $9e                               ; [16]:
    .byte $97                               ; [17]:
    .byte $81                               ; [18]:
    .byte $83                               ; [19]:
    .byte $97                               ; [20]:
    .byte $82                               ; [21]:
    .byte $97                               ; [22]:
    .byte $82                               ; [23]:
    .byte $b1                               ; [24]:
    .byte $8a                               ; [25]:
    .byte $8b                               ; [26]:
    .byte $a5                               ; [27]:
    .byte $85                               ; [28]:
    .byte $95                               ; [29]:
    .byte $8b                               ; [30]:
    .byte $97                               ; [31]:
    .byte $8f                               ; [32]:
    .byte $95                               ; [33]:
    .byte $95                               ; [34]:
    .byte $85                               ; [35]:
    .byte $95                               ; [36]:
    .byte $93                               ; [37]:
    .byte $8c                               ; [38]:
    .byte $89                               ; [39]:
    .byte $85                               ; [40]:
    .byte $85                               ; [41]:
    .byte $8c                               ; [42]:
    .byte $a1                               ; [43]:
    .byte $96                               ; [44]:
    .byte $85                               ; [45]:
    .byte $98                               ; [46]:
    .byte $ce                               ; [47]:
    .byte $84                               ; [48]:
    .byte $84                               ; [49]:
    .byte $85                               ; [50]:
    .byte $95                               ; [51]:
    .byte $b1                               ; [52]:
    .byte $a3                               ; [53]:
    .byte $aa                               ; [54]:
    .byte $c7                               ; [55]:
    .byte $a8                               ; [56]:
    .byte $a9                               ; [57]:
    .byte $a6                               ; [58]:
    .byte $ef                               ; [59]:
    .byte $c3                               ; [60]:
    .byte $b1                               ; [61]:
    .byte $a5                               ; [62]:
    .byte $83                               ; [63]:
    .byte $9c                               ; [64]:
    .byte $bf                               ; [65]:
    .byte $a8                               ; [66]:
    .byte $f6                               ; [67]:
    .byte $b1                               ; [68]:
    .byte $a8                               ; [69]:
    .byte $a8                               ; [70]:
    .byte $a3                               ; [71]:
    .byte $85                               ; [72]:
    .byte $a8                               ; [73]:
    .byte $a8                               ; [74]:
    .byte $85                               ; [75]:
    .byte $95                               ; [76]:
    .byte $cc                               ; [77]:
    .byte $a6                               ; [78]:
    .byte $f4                               ; [79]:
    .byte $c5                               ; [80]:
    .byte $a8                               ; [81]:
    .byte $83                               ; [82]:
    .byte $83                               ; [83]:
    .byte $de                               ; [84]:
    .byte $ee                               ; [85]:
    .byte $a1                               ; [86]:
    .byte $85                               ; [87]:
    .byte $c5                               ; [88]:
    .byte $98                               ; [89]:
    .byte $84                               ; [90]:
    .byte $f4                               ; [91]:
    .byte $9b                               ; [92]:
    .byte $e4                               ; [93]:
    .byte $d9                               ; [94]:
    .byte $da                               ; [95]:
    .byte $d9                               ; [96]:
    .byte $cd                               ; [97]:
    .byte $82                               ; [98]:
    .byte $a6                               ; [99]:
    .byte $da                               ; [100]:
    .byte $a5                               ; [101]:
    .byte $c1                               ; [102]:
    .byte $9b                               ; [103]:
    .byte $9b                               ; [104]:
    .byte $00                               ; [105]:
    .byte $9b                               ; [106]:
    .byte $d2                               ; [107]:
    .byte $c7                               ; [108]:
    .byte $d2                               ; [109]:
    .byte $9c                               ; [110]:
    .byte $d3                               ; [111]:
    .byte $d3                               ; [112]:
    .byte $9b                               ; [113]:
    .byte $83                               ; [114]:
    .byte $a6                               ; [115]:
    .byte $dc                               ; [116]:
    .byte $a1                               ; [117]:
    .byte $9c                               ; [118]:
    .byte $00                               ; [119]:
    .byte $00                               ; [120]:
    .byte $f8                               ; [121]:
    .byte $00                               ; [122]:
    .byte $b1                               ; [123]:
    .byte $e6                               ; [124]:
    .byte $00                               ; [125]:
    .byte $c8                               ; [126]:
    .byte $dc                               ; [127]:
    .byte $8f                               ; [128]:
    .byte $a6                               ; [129]:
    .byte $b1                               ; [130]:
    .byte $b1                               ; [131]:
    .byte $b1                               ; [132]:
    .byte $b9                               ; [133]:
    .byte $ae                               ; [134]:
    .byte $a6                               ; [135]:
    .byte $c7                               ; [136]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8423]
;
TRUNK_BLOCK_DATA_03:                        ; [$85c2]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $91                               ; [2]:
    .byte $86                               ; [3]:
    .byte $92                               ; [4]:
    .byte $92                               ; [5]:
    .byte $95                               ; [6]:
    .byte $91                               ; [7]:
    .byte $b5                               ; [8]:
    .byte $96                               ; [9]:
    .byte $95                               ; [10]:
    .byte $95                               ; [11]:
    .byte $95                               ; [12]:
    .byte $95                               ; [13]:
    .byte $86                               ; [14]:
    .byte $8b                               ; [15]:
    .byte $9e                               ; [16]:
    .byte $83                               ; [17]:
    .byte $81                               ; [18]:
    .byte $82                               ; [19]:
    .byte $97                               ; [20]:
    .byte $8b                               ; [21]:
    .byte $97                               ; [22]:
    .byte $8d                               ; [23]:
    .byte $b0                               ; [24]:
    .byte $95                               ; [25]:
    .byte $97                               ; [26]:
    .byte $b4                               ; [27]:
    .byte $a8                               ; [28]:
    .byte $88                               ; [29]:
    .byte $87                               ; [30]:
    .byte $85                               ; [31]:
    .byte $8e                               ; [32]:
    .byte $97                               ; [33]:
    .byte $96                               ; [34]:
    .byte $a9                               ; [35]:
    .byte $87                               ; [36]:
    .byte $95                               ; [37]:
    .byte $8c                               ; [38]:
    .byte $96                               ; [39]:
    .byte $85                               ; [40]:
    .byte $94                               ; [41]:
    .byte $94                               ; [42]:
    .byte $b0                               ; [43]:
    .byte $97                               ; [44]:
    .byte $92                               ; [45]:
    .byte $86                               ; [46]:
    .byte $92                               ; [47]:
    .byte $8b                               ; [48]:
    .byte $8b                               ; [49]:
    .byte $9b                               ; [50]:
    .byte $9d                               ; [51]:
    .byte $b0                               ; [52]:
    .byte $a3                               ; [53]:
    .byte $e5                               ; [54]:
    .byte $d6                               ; [55]:
    .byte $00                               ; [56]:
    .byte $9c                               ; [57]:
    .byte $b5                               ; [58]:
    .byte $df                               ; [59]:
    .byte $b4                               ; [60]:
    .byte $ba                               ; [61]:
    .byte $b4                               ; [62]:
    .byte $81                               ; [63]:
    .byte $9c                               ; [64]:
    .byte $a7                               ; [65]:
    .byte $a8                               ; [66]:
    .byte $85                               ; [67]:
    .byte $ba                               ; [68]:
    .byte $91                               ; [69]:
    .byte $a2                               ; [70]:
    .byte $a2                               ; [71]:
    .byte $a7                               ; [72]:
    .byte $85                               ; [73]:
    .byte $ce                               ; [74]:
    .byte $85                               ; [75]:
    .byte $b3                               ; [76]:
    .byte $db                               ; [77]:
    .byte $b5                               ; [78]:
    .byte $f2                               ; [79]:
    .byte $85                               ; [80]:
    .byte $92                               ; [81]:
    .byte $81                               ; [82]:
    .byte $81                               ; [83]:
    .byte $ed                               ; [84]:
    .byte $ed                               ; [85]:
    .byte $81                               ; [86]:
    .byte $84                               ; [87]:
    .byte $84                               ; [88]:
    .byte $8d                               ; [89]:
    .byte $82                               ; [90]:
    .byte $f2                               ; [91]:
    .byte $9e                               ; [92]:
    .byte $e2                               ; [93]:
    .byte $81                               ; [94]:
    .byte $82                               ; [95]:
    .byte $82                               ; [96]:
    .byte $81                               ; [97]:
    .byte $81                               ; [98]:
    .byte $a2                               ; [99]:
    .byte $81                               ; [100]:
    .byte $b5                               ; [101]:
    .byte $c2                               ; [102]:
    .byte $b5                               ; [103]:
    .byte $b4                               ; [104]:
    .byte $9b                               ; [105]:
    .byte $00                               ; [106]:
    .byte $e4                               ; [107]:
    .byte $d6                               ; [108]:
    .byte $b5                               ; [109]:
    .byte $e3                               ; [110]:
    .byte $e4                               ; [111]:
    .byte $e2                               ; [112]:
    .byte $b7                               ; [113]:
    .byte $ba                               ; [114]:
    .byte $9b                               ; [115]:
    .byte $db                               ; [116]:
    .byte $b0                               ; [117]:
    .byte $9c                               ; [118]:
    .byte $e7                               ; [119]:
    .byte $e7                               ; [120]:
    .byte $f9                               ; [121]:
    .byte $f9                               ; [122]:
    .byte $b0                               ; [123]:
    .byte $f5                               ; [124]:
    .byte $e7                               ; [125]:
    .byte $e8                               ; [126]:
    .byte $8b                               ; [127]:
    .byte $8e                               ; [128]:
    .byte $b5                               ; [129]:
    .byte $b0                               ; [130]:
    .byte $b0                               ; [131]:
    .byte $b0                               ; [132]:
    .byte $bc                               ; [133]:
    .byte $9f                               ; [134]:
    .byte $b5                               ; [135]:
    .byte $d6                               ; [136]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8425]
;
TRUNK_BLOCK_DATA_04:                        ; [$864b]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $93                               ; [2]:
    .byte $86                               ; [3]:
    .byte $92                               ; [4]:
    .byte $93                               ; [5]:
    .byte $95                               ; [6]:
    .byte $93                               ; [7]:
    .byte $89                               ; [8]:
    .byte $96                               ; [9]:
    .byte $95                               ; [10]:
    .byte $95                               ; [11]:
    .byte $95                               ; [12]:
    .byte $95                               ; [13]:
    .byte $95                               ; [14]:
    .byte $89                               ; [15]:
    .byte $82                               ; [16]:
    .byte $97                               ; [17]:
    .byte $81                               ; [18]:
    .byte $83                               ; [19]:
    .byte $97                               ; [20]:
    .byte $89                               ; [21]:
    .byte $8c                               ; [22]:
    .byte $82                               ; [23]:
    .byte $b1                               ; [24]:
    .byte $95                               ; [25]:
    .byte $95                               ; [26]:
    .byte $b5                               ; [27]:
    .byte $a7                               ; [28]:
    .byte $89                               ; [29]:
    .byte $88                               ; [30]:
    .byte $97                               ; [31]:
    .byte $8f                               ; [32]:
    .byte $96                               ; [33]:
    .byte $96                               ; [34]:
    .byte $85                               ; [35]:
    .byte $88                               ; [36]:
    .byte $95                               ; [37]:
    .byte $86                               ; [38]:
    .byte $97                               ; [39]:
    .byte $85                               ; [40]:
    .byte $94                               ; [41]:
    .byte $86                               ; [42]:
    .byte $b1                               ; [43]:
    .byte $97                               ; [44]:
    .byte $98                               ; [45]:
    .byte $86                               ; [46]:
    .byte $98                               ; [47]:
    .byte $8b                               ; [48]:
    .byte $8b                               ; [49]:
    .byte $9a                               ; [50]:
    .byte $95                               ; [51]:
    .byte $b1                               ; [52]:
    .byte $a2                               ; [53]:
    .byte $e6                               ; [54]:
    .byte $d7                               ; [55]:
    .byte $9c                               ; [56]:
    .byte $bf                               ; [57]:
    .byte $b6                               ; [58]:
    .byte $fa                               ; [59]:
    .byte $da                               ; [60]:
    .byte $bb                               ; [61]:
    .byte $b5                               ; [62]:
    .byte $83                               ; [63]:
    .byte $a8                               ; [64]:
    .byte $a9                               ; [65]:
    .byte $a7                               ; [66]:
    .byte $85                               ; [67]:
    .byte $bb                               ; [68]:
    .byte $93                               ; [69]:
    .byte $a3                               ; [70]:
    .byte $a3                               ; [71]:
    .byte $bf                               ; [72]:
    .byte $a7                               ; [73]:
    .byte $a8                               ; [74]:
    .byte $a7                               ; [75]:
    .byte $95                               ; [76]:
    .byte $dc                               ; [77]:
    .byte $b6                               ; [78]:
    .byte $85                               ; [79]:
    .byte $d4                               ; [80]:
    .byte $98                               ; [81]:
    .byte $83                               ; [82]:
    .byte $83                               ; [83]:
    .byte $ee                               ; [84]:
    .byte $ee                               ; [85]:
    .byte $83                               ; [86]:
    .byte $84                               ; [87]:
    .byte $d4                               ; [88]:
    .byte $82                               ; [89]:
    .byte $83                               ; [90]:
    .byte $84                               ; [91]:
    .byte $9e                               ; [92]:
    .byte $e4                               ; [93]:
    .byte $82                               ; [94]:
    .byte $83                               ; [95]:
    .byte $82                               ; [96]:
    .byte $83                               ; [97]:
    .byte $82                               ; [98]:
    .byte $c9                               ; [99]:
    .byte $83                               ; [100]:
    .byte $b5                               ; [101]:
    .byte $c3                               ; [102]:
    .byte $9b                               ; [103]:
    .byte $9b                               ; [104]:
    .byte $9b                               ; [105]:
    .byte $9b                               ; [106]:
    .byte $d3                               ; [107]:
    .byte $d7                               ; [108]:
    .byte $e2                               ; [109]:
    .byte $b5                               ; [110]:
    .byte $e3                               ; [111]:
    .byte $e3                               ; [112]:
    .byte $b7                               ; [113]:
    .byte $bb                               ; [114]:
    .byte $b6                               ; [115]:
    .byte $dc                               ; [116]:
    .byte $b1                               ; [117]:
    .byte $8b                               ; [118]:
    .byte $ec                               ; [119]:
    .byte $ec                               ; [120]:
    .byte $00                               ; [121]:
    .byte $00                               ; [122]:
    .byte $b1                               ; [123]:
    .byte $f6                               ; [124]:
    .byte $ec                               ; [125]:
    .byte $c8                               ; [126]:
    .byte $dc                               ; [127]:
    .byte $8f                               ; [128]:
    .byte $89                               ; [129]:
    .byte $b1                               ; [130]:
    .byte $b1                               ; [131]:
    .byte $b1                               ; [132]:
    .byte $be                               ; [133]:
    .byte $fd                               ; [134]:
    .byte $89                               ; [135]:
    .byte $d7                               ; [136]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8415]
;
TRUNK_BLOCK_PROPERTIES:                     ; [$86d4]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_IS_AIR                      ; [1]:
    .byte BLOCK_IS_AIR                      ; [2]:
    .byte BLOCK_IS_AIR                      ; [3]:
    .byte BLOCK_IS_AIR                      ; [4]:
    .byte BLOCK_IS_AIR                      ; [5]:
    .byte BLOCK_IS_AIR                      ; [6]:
    .byte BLOCK_IS_AIR                      ; [7]:
    .byte BLOCK_IS_SOLID                    ; [8]:
    .byte BLOCK_IS_AIR                      ; [9]:
    .byte BLOCK_IS_AIR                      ; [10]:
    .byte BLOCK_IS_AIR                      ; [11]:
    .byte BLOCK_IS_AIR                      ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_IS_AIR                      ; [14]:
    .byte BLOCK_IS_AIR                      ; [15]:
    .byte BLOCK_IS_AIR                      ; [16]:
    .byte BLOCK_IS_AIR                      ; [17]:
    .byte BLOCK_IS_AIR                      ; [18]:
    .byte BLOCK_IS_AIR                      ; [19]:
    .byte BLOCK_IS_AIR                      ; [20]:
    .byte BLOCK_IS_AIR                      ; [21]:
    .byte BLOCK_IS_AIR                      ; [22]:
    .byte BLOCK_IS_AIR                      ; [23]:
    .byte BLOCK_IS_SOLID                    ; [24]:
    .byte BLOCK_IS_AIR                      ; [25]:
    .byte BLOCK_IS_AIR                      ; [26]:
    .byte BLOCK_IS_SOLID                    ; [27]:
    .byte BLOCK_IS_AIR                      ; [28]:
    .byte BLOCK_IS_AIR                      ; [29]:
    .byte BLOCK_IS_AIR                      ; [30]:
    .byte BLOCK_IS_AIR                      ; [31]:
    .byte BLOCK_IS_LADDER                   ; [32]:
    .byte BLOCK_IS_AIR                      ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_IS_AIR                      ; [35]:
    .byte BLOCK_IS_AIR                      ; [36]:
    .byte BLOCK_IS_AIR                      ; [37]:
    .byte BLOCK_IS_AIR                      ; [38]:
    .byte BLOCK_IS_AIR                      ; [39]:
    .byte BLOCK_IS_AIR                      ; [40]:
    .byte BLOCK_IS_AIR                      ; [41]:
    .byte BLOCK_IS_AIR                      ; [42]:
    .byte BLOCK_IS_SOLID                    ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_IS_AIR                      ; [46]:
    .byte BLOCK_IS_AIR                      ; [47]:
    .byte BLOCK_IS_AIR                      ; [48]:
    .byte BLOCK_IS_AIR                      ; [49]:
    .byte BLOCK_IS_AIR                      ; [50]:
    .byte BLOCK_IS_AIR                      ; [51]:
    .byte BLOCK_IS_AIR                      ; [52]:
    .byte BLOCK_IS_SOLID                    ; [53]:
    .byte BLOCK_IS_SOLID                    ; [54]:
    .byte BLOCK_IS_SOLID                    ; [55]:
    .byte BLOCK_IS_AIR                      ; [56]:
    .byte BLOCK_IS_AIR                      ; [57]:
    .byte BLOCK_IS_AIR                      ; [58]:
    .byte BLOCK_IS_AIR                      ; [59]:
    .byte BLOCK_IS_AIR                      ; [60]:
    .byte BLOCK_IS_SOLID                    ; [61]:
    .byte BLOCK_IS_AIR                      ; [62]:
    .byte BLOCK_IS_AIR                      ; [63]:
    .byte BLOCK_IS_AIR                      ; [64]:
    .byte BLOCK_IS_AIR                      ; [65]:
    .byte BLOCK_IS_AIR                      ; [66]:
    .byte BLOCK_IS_AIR                      ; [67]:
    .byte BLOCK_IS_SOLID                    ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_AIR                      ; [70]:
    .byte BLOCK_IS_AIR                      ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_AIR                      ; [73]:
    .byte BLOCK_IS_AIR                      ; [74]:
    .byte BLOCK_IS_AIR                      ; [75]:
    .byte BLOCK_IS_AIR                      ; [76]:
    .byte BLOCK_IS_AIR                      ; [77]:
    .byte BLOCK_IS_AIR                      ; [78]:
    .byte BLOCK_IS_AIR                      ; [79]:
    .byte BLOCK_IS_AIR                      ; [80]:
    .byte BLOCK_IS_AIR                      ; [81]:
    .byte BLOCK_IS_AIR                      ; [82]:
    .byte BLOCK_IS_SOLID                    ; [83]:
    .byte BLOCK_IS_DOOR                     ; [84]:
    .byte BLOCK_IS_DOOR                     ; [85]:
    .byte BLOCK_IS_SOLID                    ; [86]:
    .byte BLOCK_IS_AIR                      ; [87]:
    .byte BLOCK_IS_AIR                      ; [88]:
    .byte BLOCK_IS_AIR                      ; [89]:
    .byte BLOCK_IS_AIR                      ; [90]:
    .byte BLOCK_IS_AIR                      ; [91]:
    .byte BLOCK_IS_AIR                      ; [92]:
    .byte BLOCK_IS_AIR                      ; [93]:
    .byte BLOCK_IS_AIR                      ; [94]:
    .byte BLOCK_IS_AIR                      ; [95]:
    .byte BLOCK_IS_AIR                      ; [96]:
    .byte BLOCK_IS_AIR                      ; [97]:
    .byte BLOCK_IS_AIR                      ; [98]:
    .byte BLOCK_MAYBE_BREAKABLE_BY_MATTOCK  ; [99]:
    .byte BLOCK_IS_AIR                      ; [100]:
    .byte BLOCK_IS_AIR                      ; [101]:
    .byte BLOCK_IS_AIR                      ; [102]:
    .byte BLOCK_IS_AIR                      ; [103]:
    .byte BLOCK_IS_AIR                      ; [104]:
    .byte BLOCK_IS_AIR                      ; [105]:
    .byte BLOCK_IS_AIR                      ; [106]:
    .byte BLOCK_IS_AIR                      ; [107]:
    .byte BLOCK_IS_AIR                      ; [108]:
    .byte BLOCK_IS_AIR                      ; [109]:
    .byte BLOCK_IS_AIR                      ; [110]:
    .byte BLOCK_IS_AIR                      ; [111]:
    .byte BLOCK_IS_AIR                      ; [112]:
    .byte BLOCK_IS_AIR                      ; [113]:
    .byte BLOCK_IS_AIR                      ; [114]:
    .byte BLOCK_IS_AIR                      ; [115]:
    .byte BLOCK_IS_AIR                      ; [116]:
    .byte BLOCK_IS_AIR                      ; [117]:
    .byte BLOCK_IS_AIR                      ; [118]:
    .byte BLOCK_IS_AIR                      ; [119]:
    .byte BLOCK_IS_AIR                      ; [120]:
    .byte BLOCK_IS_DOOR                     ; [121]:
    .byte BLOCK_IS_DOOR                     ; [122]:
    .byte BLOCK_IS_AIR                      ; [123]:
    .byte BLOCK_IS_AIR                      ; [124]:
    .byte BLOCK_IS_AIR                      ; [125]:
    .byte BLOCK_IS_AIR                      ; [126]:
    .byte BLOCK_IS_AIR                      ; [127]:
    .byte BLOCK_MAYBE_AREA_TRANSITION_DOWN  ; [128]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [129]:
    .byte BLOCK_FOREGROUND                  ; [130]:
    .byte BLOCK_AREA_TRANSITION_LEFT        ; [131]:
    .byte BLOCK_IS_AIR                      ; [132]:
    .byte BLOCK_IS_AIR                      ; [133]:
    .byte BLOCK_IS_AIR                      ; [134]:
    .byte BLOCK_IS_AIR                      ; [135]:
    .byte BLOCK_PUSHABLE                    ; [136]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8417]
;
TRUNK_SCROLL_DATA:                          ; [$875d]
    .byte $ff                               ; [0]:
    .byte $01                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $00                               ; [4]:
    .byte $02                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $01                               ; [8]:
    .byte $03                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $02                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $04                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $ff                               ; [16]:
    .byte $05                               ; [17]:
    .byte $ff                               ; [18]:
    .byte $03                               ; [19]:
    .byte $04                               ; [20]:
    .byte $06                               ; [21]:
    .byte $ff                               ; [22]:
    .byte $ff                               ; [23]:
    .byte $05                               ; [24]:
    .byte $07                               ; [25]:
    .byte $ff                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $06                               ; [28]:
    .byte $ff                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $09                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $ff                               ; [35]:
    .byte $08                               ; [36]:
    .byte $0a                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $ff                               ; [39]:
    .byte $09                               ; [40]:
    .byte $0b                               ; [41]:
    .byte $ff                               ; [42]:
    .byte $ff                               ; [43]:
    .byte $0a                               ; [44]:
    .byte $0c                               ; [45]:
    .byte $ff                               ; [46]:
    .byte $ff                               ; [47]:
    .byte $0b                               ; [48]:
    .byte $ff                               ; [49]:
    .byte $ff                               ; [50]:
    .byte $ff                               ; [51]:
    .byte $ff                               ; [52]:
    .byte $0e                               ; [53]:
    .byte $ff                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $0d                               ; [56]:
    .byte $0f                               ; [57]:
    .byte $ff                               ; [58]:
    .byte $ff                               ; [59]:
    .byte $0e                               ; [60]:
    .byte $ff                               ; [61]:
    .byte $10                               ; [62]:
    .byte $ff                               ; [63]:
    .byte $ff                               ; [64]:
    .byte $11                               ; [65]:
    .byte $ff                               ; [66]:
    .byte $0f                               ; [67]:
    .byte $10                               ; [68]:
    .byte $12                               ; [69]:
    .byte $ff                               ; [70]:
    .byte $ff                               ; [71]:
    .byte $11                               ; [72]:
    .byte $ff                               ; [73]:
    .byte $13                               ; [74]:
    .byte $ff                               ; [75]:
    .byte $ff                               ; [76]:
    .byte $14                               ; [77]:
    .byte $ff                               ; [78]:
    .byte $12                               ; [79]:
    .byte $13                               ; [80]:
    .byte $15                               ; [81]:
    .byte $ff                               ; [82]:
    .byte $ff                               ; [83]:
    .byte $14                               ; [84]:
    .byte $ff                               ; [85]:
    .byte $ff                               ; [86]:
    .byte $ff                               ; [87]:
    .byte $ff                               ; [88]:
    .byte $17                               ; [89]:
    .byte $18                               ; [90]:
    .byte $ff                               ; [91]:
    .byte $16                               ; [92]:
    .byte $ff                               ; [93]:
    .byte $19                               ; [94]:
    .byte $ff                               ; [95]:
    .byte $ff                               ; [96]:
    .byte $19                               ; [97]:
    .byte $ff                               ; [98]:
    .byte $16                               ; [99]:
    .byte $18                               ; [100]:
    .byte $1a                               ; [101]:
    .byte $ff                               ; [102]:
    .byte $17                               ; [103]:
    .byte $19                               ; [104]:
    .byte $ff                               ; [105]:
    .byte $ff                               ; [106]:
    .byte $ff                               ; [107]:
    .byte $1a                               ; [108]:
    .byte $3e                               ; [109]:
    .byte $28                               ; [110]:
    .byte $ff                               ; [111]:
    .byte $ff                               ; [112]:
    .byte $1e                               ; [113]:
    .byte $ff                               ; [114]:
    .byte $ff                               ; [115]:
    .byte $ff                               ; [116]:
    .byte $ff                               ; [117]:
    .byte $26                               ; [118]:
    .byte $1e                               ; [119]:
    .byte $1c                               ; [120]:
    .byte $1f                               ; [121]:
    .byte $1d                               ; [122]:
    .byte $ff                               ; [123]:
    .byte $1e                               ; [124]:
    .byte $20                               ; [125]:
    .byte $ff                               ; [126]:
    .byte $ff                               ; [127]:
    .byte $1f                               ; [128]:
    .byte $21                               ; [129]:
    .byte $23                               ; [130]:
    .byte $ff                               ; [131]:
    .byte $20                               ; [132]:
    .byte $ff                               ; [133]:
    .byte $22                               ; [134]:
    .byte $ff                               ; [135]:
    .byte $23                               ; [136]:
    .byte $ff                               ; [137]:
    .byte $ff                               ; [138]:
    .byte $21                               ; [139]:
    .byte $ff                               ; [140]:
    .byte $22                               ; [141]:
    .byte $24                               ; [142]:
    .byte $20                               ; [143]:
    .byte $ff                               ; [144]:
    .byte $ff                               ; [145]:
    .byte $25                               ; [146]:
    .byte $23                               ; [147]:
    .byte $ff                               ; [148]:
    .byte $ff                               ; [149]:
    .byte $ff                               ; [150]:
    .byte $24                               ; [151]:
    .byte $27                               ; [152]:
    .byte $ff                               ; [153]:
    .byte $ff                               ; [154]:
    .byte $1d                               ; [155]:
    .byte $28                               ; [156]:
    .byte $26                               ; [157]:
    .byte $ff                               ; [158]:
    .byte $ff                               ; [159]:
    .byte $ff                               ; [160]:
    .byte $27                               ; [161]:
    .byte $ff                               ; [162]:
    .byte $ff                               ; [163]:
    .byte $ff                               ; [164]:
    .byte $2a                               ; [165]:
    .byte $2d                               ; [166]:
    .byte $ff                               ; [167]:
    .byte $29                               ; [168]:
    .byte $2b                               ; [169]:
    .byte $2e                               ; [170]:
    .byte $ff                               ; [171]:
    .byte $2a                               ; [172]:
    .byte $2c                               ; [173]:
    .byte $2f                               ; [174]:
    .byte $ff                               ; [175]:
    .byte $2b                               ; [176]:
    .byte $ff                               ; [177]:
    .byte $30                               ; [178]:
    .byte $ff                               ; [179]:
    .byte $ff                               ; [180]:
    .byte $2e                               ; [181]:
    .byte $33                               ; [182]:
    .byte $29                               ; [183]:
    .byte $2d                               ; [184]:
    .byte $2f                               ; [185]:
    .byte $34                               ; [186]:
    .byte $2a                               ; [187]:
    .byte $2e                               ; [188]:
    .byte $30                               ; [189]:
    .byte $35                               ; [190]:
    .byte $2b                               ; [191]:
    .byte $2f                               ; [192]:
    .byte $31                               ; [193]:
    .byte $36                               ; [194]:
    .byte $2c                               ; [195]:
    .byte $30                               ; [196]:
    .byte $32                               ; [197]:
    .byte $37                               ; [198]:
    .byte $ff                               ; [199]:
    .byte $31                               ; [200]:
    .byte $ff                               ; [201]:
    .byte $38                               ; [202]:
    .byte $ff                               ; [203]:
    .byte $ff                               ; [204]:
    .byte $34                               ; [205]:
    .byte $ff                               ; [206]:
    .byte $2d                               ; [207]:
    .byte $33                               ; [208]:
    .byte $35                               ; [209]:
    .byte $39                               ; [210]:
    .byte $2e                               ; [211]:
    .byte $34                               ; [212]:
    .byte $36                               ; [213]:
    .byte $3a                               ; [214]:
    .byte $2f                               ; [215]:
    .byte $35                               ; [216]:
    .byte $37                               ; [217]:
    .byte $3b                               ; [218]:
    .byte $30                               ; [219]:
    .byte $36                               ; [220]:
    .byte $38                               ; [221]:
    .byte $3c                               ; [222]:
    .byte $31                               ; [223]:
    .byte $37                               ; [224]:
    .byte $ff                               ; [225]:
    .byte $3d                               ; [226]:
    .byte $32                               ; [227]:
    .byte $ff                               ; [228]:
    .byte $3a                               ; [229]:
    .byte $ff                               ; [230]:
    .byte $34                               ; [231]:
    .byte $39                               ; [232]:
    .byte $3b                               ; [233]:
    .byte $ff                               ; [234]:
    .byte $35                               ; [235]:
    .byte $3a                               ; [236]:
    .byte $3c                               ; [237]:
    .byte $ff                               ; [238]:
    .byte $36                               ; [239]:
    .byte $3b                               ; [240]:
    .byte $3d                               ; [241]:
    .byte $ff                               ; [242]:
    .byte $37                               ; [243]:
    .byte $3c                               ; [244]:
    .byte $ff                               ; [245]:
    .byte $ff                               ; [246]:
    .byte $38                               ; [247]:
    .byte $ff                               ; [248]:
    .byte $3f                               ; [249]:
    .byte $ff                               ; [250]:
    .byte $ff                               ; [251]:
    .byte $3e                               ; [252]:
    .byte $ff                               ; [253]:
    .byte $ff                               ; [254]:
    .byte $ff                               ; [255]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::8419]
;
TRUNK_DOOR_LOCATIONS:                       ; [$885d]
    .byte $28                               ; [0]:
    .byte $10                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $9e                               ; [3]:
    .byte $0b                               ; [4]:
    .byte $a9                               ; [5]:
    .byte $00                               ; [6]:
    .byte $91                               ; [7]:
    .byte $0d                               ; [8]:
    .byte $90                               ; [9]:
    .byte $01                               ; [10]:
    .byte $a9                               ; [11]:
    .byte $28                               ; [12]:
    .byte $3d                               ; [13]:
    .byte $02                               ; [14]:
    .byte $93                               ; [15]:
    .byte $29                               ; [16]:
    .byte $92                               ; [17]:
    .byte $03                               ; [18]:
    .byte $3d                               ; [19]:
    .byte $1e                               ; [20]:
    .byte $9d                               ; [21]:
    .byte $04                               ; [22]:
    .byte $92                               ; [23]:
    .byte $3e                               ; [24]:
    .byte $91                               ; [25]:
    .byte $05                               ; [26]:
    .byte $9d                               ; [27]:
    .byte $06                               ; [28]:
    .byte $5a                               ; [29]:
    .byte $20                               ; [30]:
    .byte $9e                               ; [31]:
    .byte $2d                               ; [32]:
    .byte $9a                               ; [33]:
    .byte $21                               ; [34]:
    .byte $9e                               ; [35]:
    .byte $ff                               ; [36]:

;
; XREFS:
;     TRUNK_AREA_DATA [$PRG3::841b]
;
TRUNK_DOOR_DESTINATIONS:                    ; [$8882]
    .byte $0d                               ; [0]:
    .byte $07                               ; [1]:
    .byte $04                               ; [2]:
    .byte $00                               ; [3]:
    .byte $0b                               ; [4]:
    .byte $06                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $29                               ; [8]:
    .byte $07                               ; [9]:
    .byte $04                               ; [10]:
    .byte $00                               ; [11]:
    .byte $28                               ; [12]:
    .byte $06                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $3e                               ; [16]:
    .byte $07                               ; [17]:
    .byte $05                               ; [18]:
    .byte $00                               ; [19]:
    .byte $1e                               ; [20]:
    .byte $06                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $08                               ; [24]:
    .byte $a1                               ; [25]:
    .byte $00                               ; [26]:
    .byte $89                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:
    .byte $00                               ; [32]:
    .byte $bd                               ; [33]:
    .byte $00                               ; [34]:
    .byte $10                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $6f                               ; [41]:
    .byte $00                               ; [42]:
    .byte $60                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $be                               ; [49]:
    .byte $00                               ; [50]:
    .byte $02                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $60                               ; [57]:
    .byte $00                               ; [58]:
    .byte $08                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $00                               ; [64]:
    .byte $9e                               ; [65]:
    .byte $00                               ; [66]:
    .byte $28                               ; [67]:
    .byte $00                               ; [68]:
    .byte $00                               ; [69]:
    .byte $00                               ; [70]:
    .byte $00                               ; [71]:
    .byte $00                               ; [72]:
    .byte $3c                               ; [73]:
    .byte $00                               ; [74]:
    .byte $00                               ; [75]:
    .byte $00                               ; [76]:
    .byte $00                               ; [77]:
    .byte $00                               ; [78]:
    .byte $00                               ; [79]:
    .byte $00                               ; [80]:
    .byte $19                               ; [81]:
    .byte $40                               ; [82]:
    .byte $09                               ; [83]:
    .byte $00                               ; [84]:
    .byte $00                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $54                               ; [89]:
    .byte $00                               ; [90]:
    .byte $83                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:
    .byte $00                               ; [94]:
    .byte $00                               ; [95]:
    .byte $00                               ; [96]:
    .byte $60                               ; [97]:
    .byte $00                               ; [98]:
    .byte $0c                               ; [99]:
    .byte $00                               ; [100]:
    .byte $00                               ; [101]:
    .byte $00                               ; [102]:
    .byte $00                               ; [103]:
    .byte $00                               ; [104]:
    .byte $5a                               ; [105]:
    .byte $00                               ; [106]:
    .byte $24                               ; [107]:
    .byte $00                               ; [108]:
    .byte $00                               ; [109]:
    .byte $00                               ; [110]:
    .byte $00                               ; [111]:
    .byte $00                               ; [112]:
    .byte $f2                               ; [113]:
    .byte $00                               ; [114]:
    .byte $00                               ; [115]:
    .byte $00                               ; [116]:
    .byte $00                               ; [117]:
    .byte $00                               ; [118]:
    .byte $00                               ; [119]:
    .byte $02                               ; [120]:
    .byte $b2                               ; [121]:
    .byte $00                               ; [122]:
    .byte $10                               ; [123]:
    .byte $00                               ; [124]:
    .byte $00                               ; [125]:
    .byte $00                               ; [126]:
    .byte $00                               ; [127]:
    .byte $14                               ; [128]:
    .byte $04                               ; [129]:
    .byte $00                               ; [130]:
    .byte $00                               ; [131]:
    .byte $15                               ; [132]:
    .byte $01                               ; [133]:
    .byte $00                               ; [134]:
    .byte $00                               ; [135]:


;============================================================================
; Table of relative pointers from 0x8000 for Mist.
;
; 68 doors (0x8DDF - 0x8D9A - 1)
; 136 tiles (0x8A2E - 0x89A6)
;============================================================================
MIST_AREA_DATA:                             ; [$890a]
    .word (MIST_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; Block attributes
                                                          ; pointer
    .word (MIST_BLOCK_PROPERTIES-$8000) & $FFFF ; Block properties
    .word (MIST_SCROLL_DATA-$8000) & $FFFF  ; Scroll data
    .word (MIST_DOOR_LOCATIONS-$8000) & $FFFF ; Door locations
    .word (MIST_DOOR_DESTINATIONS-$8000) & $FFFF ; Door destinations

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::890a]
;
MIST_AREA_DATA_blockAttrsRelPtr:            ; [$8914]
    .word (MIST_BLOCK_ATTRIBUTES-$8000) & $FFFF ; Block attributes
    .word (MIST_BLOCK_DATA_01-$8000) & $FFFF ; Block data 1
    .word (MIST_BLOCK_DATA_02-$8000) & $FFFF ; Block data 2
    .word (MIST_BLOCK_DATA_03-$8000) & $FFFF ; Block data 3
    .word (MIST_BLOCK_DATA_04-$8000) & $FFFF ; Block data 4

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::8914]
;
MIST_BLOCK_ATTRIBUTES:                      ; [$891e]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $ff                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $ff                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $00                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $00                               ; [16]:
    .byte $00                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]:
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $ff                               ; [23]:
    .byte $00                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:
    .byte $00                               ; [32]:
    .byte $ff                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $ff                               ; [44]:
    .byte $ff                               ; [45]:
    .byte $00                               ; [46]:
    .byte $ff                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $ff                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $ff                               ; [60]:
    .byte $ff                               ; [61]:
    .byte $ff                               ; [62]:
    .byte $ff                               ; [63]:
    .byte $00                               ; [64]:
    .byte $00                               ; [65]:
    .byte $ff                               ; [66]:
    .byte $ff                               ; [67]:
    .byte $ff                               ; [68]:
    .byte $ff                               ; [69]:
    .byte $55                               ; [70]:
    .byte $55                               ; [71]:
    .byte $ff                               ; [72]:
    .byte $ff                               ; [73]:
    .byte $ff                               ; [74]:
    .byte $ff                               ; [75]:
    .byte $ff                               ; [76]:
    .byte $55                               ; [77]:
    .byte $ff                               ; [78]:
    .byte $ff                               ; [79]:
    .byte $ff                               ; [80]:
    .byte $ff                               ; [81]:
    .byte $55                               ; [82]:
    .byte $ff                               ; [83]:
    .byte $ff                               ; [84]:
    .byte $ff                               ; [85]:
    .byte $ff                               ; [86]:
    .byte $ff                               ; [87]:
    .byte $00                               ; [88]:
    .byte $ff                               ; [89]:
    .byte $ff                               ; [90]:
    .byte $ff                               ; [91]:
    .byte $ff                               ; [92]:
    .byte $ff                               ; [93]:
    .byte $ff                               ; [94]:
    .byte $ff                               ; [95]:
    .byte $55                               ; [96]:
    .byte $ff                               ; [97]:
    .byte $ff                               ; [98]:
    .byte $ff                               ; [99]:
    .byte $ff                               ; [100]:
    .byte $00                               ; [101]:
    .byte $ff                               ; [102]:
    .byte $ff                               ; [103]:
    .byte $ff                               ; [104]:
    .byte $ff                               ; [105]:
    .byte $ff                               ; [106]:
    .byte $ff                               ; [107]:
    .byte $ff                               ; [108]:
    .byte $ff                               ; [109]:
    .byte $ff                               ; [110]:
    .byte $ff                               ; [111]:
    .byte $ff                               ; [112]:
    .byte $ff                               ; [113]:
    .byte $ff                               ; [114]:
    .byte $ff                               ; [115]:
    .byte $ff                               ; [116]:
    .byte $ff                               ; [117]:
    .byte $ff                               ; [118]:
    .byte $ff                               ; [119]:
    .byte $ff                               ; [120]:
    .byte $55                               ; [121]:
    .byte $ff                               ; [122]:
    .byte $ff                               ; [123]:
    .byte $ff                               ; [124]:
    .byte $ff                               ; [125]:
    .byte $ff                               ; [126]:
    .byte $ff                               ; [127]:
    .byte $00                               ; [128]:
    .byte $aa                               ; [129]:
    .byte $00                               ; [130]:
    .byte $00                               ; [131]:
    .byte $00                               ; [132]:
    .byte $aa                               ; [133]:
    .byte $aa                               ; [134]:
    .byte $ff                               ; [135]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::8916]
;
MIST_BLOCK_DATA_01:                         ; [$89a6]
    .byte $00                               ; [0]:
    .byte $81                               ; [1]:
    .byte $80                               ; [2]:
    .byte $82                               ; [3]:
    .byte $8a                               ; [4]:
    .byte $8a                               ; [5]:
    .byte $95                               ; [6]:
    .byte $db                               ; [7]:
    .byte $87                               ; [8]:
    .byte $8e                               ; [9]:
    .byte $00                               ; [10]:
    .byte $82                               ; [11]:
    .byte $83                               ; [12]:
    .byte $b8                               ; [13]:
    .byte $86                               ; [14]:
    .byte $c8                               ; [15]:
    .byte $87                               ; [16]:
    .byte $85                               ; [17]:
    .byte $85                               ; [18]:
    .byte $83                               ; [19]:
    .byte $80                               ; [20]:
    .byte $82                               ; [21]:
    .byte $85                               ; [22]:
    .byte $8c                               ; [23]:
    .byte $84                               ; [24]:
    .byte $82                               ; [25]:
    .byte $84                               ; [26]:
    .byte $c8                               ; [27]:
    .byte $87                               ; [28]:
    .byte $85                               ; [29]:
    .byte $83                               ; [30]:
    .byte $80                               ; [31]:
    .byte $83                               ; [32]:
    .byte $e3                               ; [33]:
    .byte $c8                               ; [34]:
    .byte $86                               ; [35]:
    .byte $85                               ; [36]:
    .byte $83                               ; [37]:
    .byte $83                               ; [38]:
    .byte $84                               ; [39]:
    .byte $83                               ; [40]:
    .byte $82                               ; [41]:
    .byte $f3                               ; [42]:
    .byte $e9                               ; [43]:
    .byte $aa                               ; [44]:
    .byte $b0                               ; [45]:
    .byte $87                               ; [46]:
    .byte $8a                               ; [47]:
    .byte $97                               ; [48]:
    .byte $ff                               ; [49]:
    .byte $97                               ; [50]:
    .byte $82                               ; [51]:
    .byte $b1                               ; [52]:
    .byte $82                               ; [53]:
    .byte $82                               ; [54]:
    .byte $80                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $80                               ; [57]:
    .byte $f7                               ; [58]:
    .byte $f5                               ; [59]:
    .byte $b9                               ; [60]:
    .byte $95                               ; [61]:
    .byte $b0                               ; [62]:
    .byte $95                               ; [63]:
    .byte $8a                               ; [64]:
    .byte $95                               ; [65]:
    .byte $fb                               ; [66]:
    .byte $f9                               ; [67]:
    .byte $d4                               ; [68]:
    .byte $a3                               ; [69]:
    .byte $f0                               ; [70]:
    .byte $fc                               ; [71]:
    .byte $fb                               ; [72]:
    .byte $f7                               ; [73]:
    .byte $f8                               ; [74]:
    .byte $f9                               ; [75]:
    .byte $f7                               ; [76]:
    .byte $ba                               ; [77]:
    .byte $be                               ; [78]:
    .byte $00                               ; [79]:
    .byte $8d                               ; [80]:
    .byte $be                               ; [81]:
    .byte $d5                               ; [82]:
    .byte $ce                               ; [83]:
    .byte $a1                               ; [84]:
    .byte $c8                               ; [85]:
    .byte $a4                               ; [86]:
    .byte $e0                               ; [87]:
    .byte $b7                               ; [88]:
    .byte $a5                               ; [89]:
    .byte $d0                               ; [90]:
    .byte $81                               ; [91]:
    .byte $ba                               ; [92]:
    .byte $ca                               ; [93]:
    .byte $b4                               ; [94]:
    .byte $b5                               ; [95]:
    .byte $bd                               ; [96]:
    .byte $d0                               ; [97]:
    .byte $b3                               ; [98]:
    .byte $b1                               ; [99]:
    .byte $a9                               ; [100]:
    .byte $d4                               ; [101]:
    .byte $bd                               ; [102]:
    .byte $a5                               ; [103]:
    .byte $82                               ; [104]:
    .byte $82                               ; [105]:
    .byte $a9                               ; [106]:
    .byte $f0                               ; [107]:
    .byte $fc                               ; [108]:
    .byte $d0                               ; [109]:
    .byte $b9                               ; [110]:
    .byte $82                               ; [111]:
    .byte $ca                               ; [112]:
    .byte $82                               ; [113]:
    .byte $82                               ; [114]:
    .byte $d2                               ; [115]:
    .byte $ba                               ; [116]:
    .byte $bc                               ; [117]:
    .byte $ca                               ; [118]:
    .byte $e2                               ; [119]:
    .byte $9c                               ; [120]:
    .byte $e3                               ; [121]:
    .byte $b7                               ; [122]:
    .byte $98                               ; [123]:
    .byte $b9                               ; [124]:
    .byte $82                               ; [125]:
    .byte $e0                               ; [126]:
    .byte $a8                               ; [127]:
    .byte $97                               ; [128]:
    .byte $95                               ; [129]:
    .byte $f9                               ; [130]:
    .byte $fa                               ; [131]:
    .byte $b7                               ; [132]:
    .byte $8a                               ; [133]:
    .byte $8a                               ; [134]:
    .byte $8a                               ; [135]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::8918]
;
MIST_BLOCK_DATA_02:                         ; [$8a2e]
    .byte $00                               ; [0]:
    .byte $81                               ; [1]:
    .byte $00                               ; [2]:
    .byte $82                               ; [3]:
    .byte $8b                               ; [4]:
    .byte $94                               ; [5]:
    .byte $96                               ; [6]:
    .byte $dc                               ; [7]:
    .byte $87                               ; [8]:
    .byte $8f                               ; [9]:
    .byte $81                               ; [10]:
    .byte $82                               ; [11]:
    .byte $84                               ; [12]:
    .byte $c8                               ; [13]:
    .byte $86                               ; [14]:
    .byte $c8                               ; [15]:
    .byte $87                               ; [16]:
    .byte $85                               ; [17]:
    .byte $84                               ; [18]:
    .byte $83                               ; [19]:
    .byte $81                               ; [20]:
    .byte $84                               ; [21]:
    .byte $86                               ; [22]:
    .byte $83                               ; [23]:
    .byte $84                               ; [24]:
    .byte $82                               ; [25]:
    .byte $84                               ; [26]:
    .byte $c8                               ; [27]:
    .byte $85                               ; [28]:
    .byte $83                               ; [29]:
    .byte $82                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $85                               ; [32]:
    .byte $e4                               ; [33]:
    .byte $c8                               ; [34]:
    .byte $86                               ; [35]:
    .byte $83                               ; [36]:
    .byte $82                               ; [37]:
    .byte $84                               ; [38]:
    .byte $83                               ; [39]:
    .byte $83                               ; [40]:
    .byte $84                               ; [41]:
    .byte $e8                               ; [42]:
    .byte $ea                               ; [43]:
    .byte $ab                               ; [44]:
    .byte $b1                               ; [45]:
    .byte $85                               ; [46]:
    .byte $8b                               ; [47]:
    .byte $80                               ; [48]:
    .byte $97                               ; [49]:
    .byte $97                               ; [50]:
    .byte $80                               ; [51]:
    .byte $b2                               ; [52]:
    .byte $80                               ; [53]:
    .byte $84                               ; [54]:
    .byte $80                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $82                               ; [57]:
    .byte $f2                               ; [58]:
    .byte $ea                               ; [59]:
    .byte $b9                               ; [60]:
    .byte $96                               ; [61]:
    .byte $b1                               ; [62]:
    .byte $96                               ; [63]:
    .byte $96                               ; [64]:
    .byte $96                               ; [65]:
    .byte $fb                               ; [66]:
    .byte $fa                               ; [67]:
    .byte $fb                               ; [68]:
    .byte $f9                               ; [69]:
    .byte $f1                               ; [70]:
    .byte $fd                               ; [71]:
    .byte $f9                               ; [72]:
    .byte $fb                               ; [73]:
    .byte $f8                               ; [74]:
    .byte $84                               ; [75]:
    .byte $f9                               ; [76]:
    .byte $bf                               ; [77]:
    .byte $bf                               ; [78]:
    .byte $8d                               ; [79]:
    .byte $f9                               ; [80]:
    .byte $bf                               ; [81]:
    .byte $d5                               ; [82]:
    .byte $cf                               ; [83]:
    .byte $a2                               ; [84]:
    .byte $a2                               ; [85]:
    .byte $a5                               ; [86]:
    .byte $c8                               ; [87]:
    .byte $ae                               ; [88]:
    .byte $a6                               ; [89]:
    .byte $d1                               ; [90]:
    .byte $81                               ; [91]:
    .byte $bb                               ; [92]:
    .byte $cb                               ; [93]:
    .byte $b5                               ; [94]:
    .byte $b6                               ; [95]:
    .byte $e6                               ; [96]:
    .byte $cc                               ; [97]:
    .byte $d6                               ; [98]:
    .byte $b1                               ; [99]:
    .byte $d3                               ; [100]:
    .byte $fe                               ; [101]:
    .byte $e6                               ; [102]:
    .byte $a5                               ; [103]:
    .byte $c8                               ; [104]:
    .byte $a8                               ; [105]:
    .byte $c8                               ; [106]:
    .byte $f1                               ; [107]:
    .byte $fd                               ; [108]:
    .byte $cc                               ; [109]:
    .byte $82                               ; [110]:
    .byte $c8                               ; [111]:
    .byte $cb                               ; [112]:
    .byte $d6                               ; [113]:
    .byte $b2                               ; [114]:
    .byte $d3                               ; [115]:
    .byte $bc                               ; [116]:
    .byte $bb                               ; [117]:
    .byte $e1                               ; [118]:
    .byte $cb                               ; [119]:
    .byte $9d                               ; [120]:
    .byte $e4                               ; [121]:
    .byte $ae                               ; [122]:
    .byte $99                               ; [123]:
    .byte $82                               ; [124]:
    .byte $82                               ; [125]:
    .byte $cb                               ; [126]:
    .byte $ea                               ; [127]:
    .byte $81                               ; [128]:
    .byte $96                               ; [129]:
    .byte $f9                               ; [130]:
    .byte $fa                               ; [131]:
    .byte $f9                               ; [132]:
    .byte $8b                               ; [133]:
    .byte $8b                               ; [134]:
    .byte $8b                               ; [135]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::891a]
;
MIST_BLOCK_DATA_03:                         ; [$8ab6]
    .byte $00                               ; [0]:
    .byte $81                               ; [1]:
    .byte $80                               ; [2]:
    .byte $82                               ; [3]:
    .byte $9a                               ; [4]:
    .byte $9a                               ; [5]:
    .byte $95                               ; [6]:
    .byte $db                               ; [7]:
    .byte $87                               ; [8]:
    .byte $9e                               ; [9]:
    .byte $00                               ; [10]:
    .byte $82                               ; [11]:
    .byte $84                               ; [12]:
    .byte $c8                               ; [13]:
    .byte $86                               ; [14]:
    .byte $c8                               ; [15]:
    .byte $87                               ; [16]:
    .byte $85                               ; [17]:
    .byte $85                               ; [18]:
    .byte $84                               ; [19]:
    .byte $81                               ; [20]:
    .byte $82                               ; [21]:
    .byte $85                               ; [22]:
    .byte $f8                               ; [23]:
    .byte $85                               ; [24]:
    .byte $84                               ; [25]:
    .byte $85                               ; [26]:
    .byte $c8                               ; [27]:
    .byte $87                               ; [28]:
    .byte $84                               ; [29]:
    .byte $82                               ; [30]:
    .byte $80                               ; [31]:
    .byte $84                               ; [32]:
    .byte $e5                               ; [33]:
    .byte $a0                               ; [34]:
    .byte $86                               ; [35]:
    .byte $83                               ; [36]:
    .byte $82                               ; [37]:
    .byte $84                               ; [38]:
    .byte $85                               ; [39]:
    .byte $83                               ; [40]:
    .byte $82                               ; [41]:
    .byte $e7                               ; [42]:
    .byte $e9                               ; [43]:
    .byte $ac                               ; [44]:
    .byte $c0                               ; [45]:
    .byte $85                               ; [46]:
    .byte $9a                               ; [47]:
    .byte $89                               ; [48]:
    .byte $80                               ; [49]:
    .byte $97                               ; [50]:
    .byte $83                               ; [51]:
    .byte $c1                               ; [52]:
    .byte $80                               ; [53]:
    .byte $80                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $82                               ; [57]:
    .byte $eb                               ; [58]:
    .byte $f4                               ; [59]:
    .byte $c8                               ; [60]:
    .byte $95                               ; [61]:
    .byte $c0                               ; [62]:
    .byte $93                               ; [63]:
    .byte $96                               ; [64]:
    .byte $9a                               ; [65]:
    .byte $fb                               ; [66]:
    .byte $f9                               ; [67]:
    .byte $da                               ; [68]:
    .byte $da                               ; [69]:
    .byte $fc                               ; [70]:
    .byte $fc                               ; [71]:
    .byte $fb                               ; [72]:
    .byte $f7                               ; [73]:
    .byte $f9                               ; [74]:
    .byte $84                               ; [75]:
    .byte $f7                               ; [76]:
    .byte $d5                               ; [77]:
    .byte $d8                               ; [78]:
    .byte $8d                               ; [79]:
    .byte $fb                               ; [80]:
    .byte $ce                               ; [81]:
    .byte $bc                               ; [82]:
    .byte $ce                               ; [83]:
    .byte $a2                               ; [84]:
    .byte $c8                               ; [85]:
    .byte $b9                               ; [86]:
    .byte $a1                               ; [87]:
    .byte $da                               ; [88]:
    .byte $82                               ; [89]:
    .byte $d0                               ; [90]:
    .byte $a8                               ; [91]:
    .byte $ca                               ; [92]:
    .byte $ca                               ; [93]:
    .byte $c4                               ; [94]:
    .byte $c5                               ; [95]:
    .byte $cd                               ; [96]:
    .byte $e7                               ; [97]:
    .byte $c3                               ; [98]:
    .byte $c1                               ; [99]:
    .byte $82                               ; [100]:
    .byte $00                               ; [101]:
    .byte $cd                               ; [102]:
    .byte $82                               ; [103]:
    .byte $82                               ; [104]:
    .byte $82                               ; [105]:
    .byte $82                               ; [106]:
    .byte $fc                               ; [107]:
    .byte $fc                               ; [108]:
    .byte $e7                               ; [109]:
    .byte $c8                               ; [110]:
    .byte $c8                               ; [111]:
    .byte $e1                               ; [112]:
    .byte $82                               ; [113]:
    .byte $82                               ; [114]:
    .byte $d2                               ; [115]:
    .byte $ca                               ; [116]:
    .byte $bb                               ; [117]:
    .byte $e1                               ; [118]:
    .byte $dd                               ; [119]:
    .byte $d0                               ; [120]:
    .byte $e5                               ; [121]:
    .byte $da                               ; [122]:
    .byte $98                               ; [123]:
    .byte $d2                               ; [124]:
    .byte $82                               ; [125]:
    .byte $ca                               ; [126]:
    .byte $9c                               ; [127]:
    .byte $81                               ; [128]:
    .byte $94                               ; [129]:
    .byte $f9                               ; [130]:
    .byte $fa                               ; [131]:
    .byte $da                               ; [132]:
    .byte $9a                               ; [133]:
    .byte $9a                               ; [134]:
    .byte $9a                               ; [135]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::891c]
;
MIST_BLOCK_DATA_04:                         ; [$8b3e]
    .byte $00                               ; [0]:
    .byte $81                               ; [1]:
    .byte $00                               ; [2]:
    .byte $82                               ; [3]:
    .byte $9b                               ; [4]:
    .byte $9b                               ; [5]:
    .byte $96                               ; [6]:
    .byte $dc                               ; [7]:
    .byte $87                               ; [8]:
    .byte $9f                               ; [9]:
    .byte $81                               ; [10]:
    .byte $83                               ; [11]:
    .byte $86                               ; [12]:
    .byte $c8                               ; [13]:
    .byte $86                               ; [14]:
    .byte $c8                               ; [15]:
    .byte $85                               ; [16]:
    .byte $85                               ; [17]:
    .byte $85                               ; [18]:
    .byte $84                               ; [19]:
    .byte $80                               ; [20]:
    .byte $82                               ; [21]:
    .byte $87                               ; [22]:
    .byte $f9                               ; [23]:
    .byte $84                               ; [24]:
    .byte $84                               ; [25]:
    .byte $86                               ; [26]:
    .byte $c9                               ; [27]:
    .byte $85                               ; [28]:
    .byte $83                               ; [29]:
    .byte $82                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $84                               ; [32]:
    .byte $e5                               ; [33]:
    .byte $a0                               ; [34]:
    .byte $83                               ; [35]:
    .byte $81                               ; [36]:
    .byte $83                               ; [37]:
    .byte $86                               ; [38]:
    .byte $83                               ; [39]:
    .byte $83                               ; [40]:
    .byte $84                               ; [41]:
    .byte $e8                               ; [42]:
    .byte $ea                               ; [43]:
    .byte $ad                               ; [44]:
    .byte $c1                               ; [45]:
    .byte $85                               ; [46]:
    .byte $9b                               ; [47]:
    .byte $97                               ; [48]:
    .byte $80                               ; [49]:
    .byte $97                               ; [50]:
    .byte $80                               ; [51]:
    .byte $c2                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $82                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $80                               ; [56]:
    .byte $83                               ; [57]:
    .byte $ef                               ; [58]:
    .byte $ee                               ; [59]:
    .byte $c8                               ; [60]:
    .byte $84                               ; [61]:
    .byte $c1                               ; [62]:
    .byte $93                               ; [63]:
    .byte $84                               ; [64]:
    .byte $9b                               ; [65]:
    .byte $fb                               ; [66]:
    .byte $fa                               ; [67]:
    .byte $fb                               ; [68]:
    .byte $f8                               ; [69]:
    .byte $fd                               ; [70]:
    .byte $fd                               ; [71]:
    .byte $f9                               ; [72]:
    .byte $fb                               ; [73]:
    .byte $f9                               ; [74]:
    .byte $00                               ; [75]:
    .byte $f9                               ; [76]:
    .byte $d5                               ; [77]:
    .byte $d9                               ; [78]:
    .byte $fb                               ; [79]:
    .byte $f9                               ; [80]:
    .byte $cf                               ; [81]:
    .byte $bc                               ; [82]:
    .byte $cf                               ; [83]:
    .byte $a1                               ; [84]:
    .byte $a1                               ; [85]:
    .byte $82                               ; [86]:
    .byte $e0                               ; [87]:
    .byte $cc                               ; [88]:
    .byte $82                               ; [89]:
    .byte $d1                               ; [90]:
    .byte $a8                               ; [91]:
    .byte $cb                               ; [92]:
    .byte $cb                               ; [93]:
    .byte $c5                               ; [94]:
    .byte $c6                               ; [95]:
    .byte $f6                               ; [96]:
    .byte $d1                               ; [97]:
    .byte $d7                               ; [98]:
    .byte $c1                               ; [99]:
    .byte $d3                               ; [100]:
    .byte $00                               ; [101]:
    .byte $f6                               ; [102]:
    .byte $82                               ; [103]:
    .byte $c8                               ; [104]:
    .byte $c8                               ; [105]:
    .byte $c8                               ; [106]:
    .byte $fd                               ; [107]:
    .byte $fd                               ; [108]:
    .byte $d1                               ; [109]:
    .byte $c8                               ; [110]:
    .byte $c8                               ; [111]:
    .byte $e2                               ; [112]:
    .byte $d7                               ; [113]:
    .byte $c2                               ; [114]:
    .byte $d3                               ; [115]:
    .byte $ba                               ; [116]:
    .byte $cb                               ; [117]:
    .byte $dd                               ; [118]:
    .byte $e2                               ; [119]:
    .byte $d1                               ; [120]:
    .byte $e5                               ; [121]:
    .byte $cc                               ; [122]:
    .byte $99                               ; [123]:
    .byte $d3                               ; [124]:
    .byte $82                               ; [125]:
    .byte $e0                               ; [126]:
    .byte $9d                               ; [127]:
    .byte $80                               ; [128]:
    .byte $96                               ; [129]:
    .byte $f9                               ; [130]:
    .byte $fa                               ; [131]:
    .byte $cc                               ; [132]:
    .byte $9b                               ; [133]:
    .byte $9b                               ; [134]:
    .byte $9b                               ; [135]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::890c]
;
MIST_BLOCK_PROPERTIES:                      ; [$8bc6]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_FOREGROUND                  ; [1]:
    .byte BLOCK_FOREGROUND                  ; [2]:
    .byte BLOCK_FOREGROUND                  ; [3]:
    .byte BLOCK_IS_SOLID                    ; [4]:
    .byte BLOCK_IS_SOLID                    ; [5]:
    .byte BLOCK_IS_SOLID                    ; [6]:
    .byte BLOCK_IS_LADDER                   ; [7]:
    .byte BLOCK_FOREGROUND                  ; [8]:
    .byte BLOCK_IS_AIR                      ; [9]:
    .byte BLOCK_FOREGROUND                  ; [10]:
    .byte BLOCK_FOREGROUND                  ; [11]:
    .byte BLOCK_FOREGROUND                  ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_FOREGROUND                  ; [14]:
    .byte BLOCK_IS_AIR                      ; [15]:
    .byte BLOCK_FOREGROUND                  ; [16]:
    .byte BLOCK_FOREGROUND                  ; [17]:
    .byte BLOCK_FOREGROUND                  ; [18]:
    .byte BLOCK_FOREGROUND                  ; [19]:
    .byte BLOCK_FOREGROUND                  ; [20]:
    .byte BLOCK_FOREGROUND                  ; [21]:
    .byte BLOCK_FOREGROUND                  ; [22]:
    .byte BLOCK_IS_AIR                      ; [23]:
    .byte BLOCK_FOREGROUND                  ; [24]:
    .byte BLOCK_FOREGROUND                  ; [25]:
    .byte BLOCK_FOREGROUND                  ; [26]:
    .byte BLOCK_IS_AIR                      ; [27]:
    .byte BLOCK_FOREGROUND                  ; [28]:
    .byte BLOCK_FOREGROUND                  ; [29]:
    .byte BLOCK_FOREGROUND                  ; [30]:
    .byte BLOCK_FOREGROUND                  ; [31]:
    .byte BLOCK_FOREGROUND                  ; [32]:
    .byte BLOCK_IS_SOLID                    ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_FOREGROUND                  ; [35]:
    .byte BLOCK_FOREGROUND                  ; [36]:
    .byte BLOCK_FOREGROUND                  ; [37]:
    .byte BLOCK_FOREGROUND                  ; [38]:
    .byte BLOCK_FOREGROUND                  ; [39]:
    .byte BLOCK_FOREGROUND                  ; [40]:
    .byte BLOCK_FOREGROUND                  ; [41]:
    .byte BLOCK_IS_SOLID                    ; [42]:
    .byte BLOCK_IS_SOLID                    ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_FOREGROUND                  ; [46]:
    .byte BLOCK_IS_SOLID                    ; [47]:
    .byte BLOCK_FOREGROUND                  ; [48]:
    .byte BLOCK_FOREGROUND                  ; [49]:
    .byte BLOCK_FOREGROUND                  ; [50]:
    .byte BLOCK_FOREGROUND                  ; [51]:
    .byte BLOCK_IS_AIR                      ; [52]:
    .byte BLOCK_FOREGROUND                  ; [53]:
    .byte BLOCK_FOREGROUND                  ; [54]:
    .byte BLOCK_FOREGROUND                  ; [55]:
    .byte BLOCK_FOREGROUND                  ; [56]:
    .byte BLOCK_FOREGROUND                  ; [57]:
    .byte BLOCK_IS_SOLID                    ; [58]:
    .byte BLOCK_IS_SOLID                    ; [59]:
    .byte BLOCK_IS_AIR                      ; [60]:
    .byte BLOCK_IS_SOLID                    ; [61]:
    .byte BLOCK_IS_AIR                      ; [62]:
    .byte BLOCK_IS_SOLID                    ; [63]:
    .byte BLOCK_IS_SOLID                    ; [64]:
    .byte BLOCK_IS_SOLID                    ; [65]:
    .byte BLOCK_IS_AIR                      ; [66]:
    .byte BLOCK_IS_AIR                      ; [67]:
    .byte BLOCK_IS_AIR                      ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_DOOR                     ; [70]:
    .byte BLOCK_IS_DOOR                     ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_AIR                      ; [73]:
    .byte BLOCK_IS_AIR                      ; [74]:
    .byte BLOCK_IS_AIR                      ; [75]:
    .byte BLOCK_IS_AIR                      ; [76]:
    .byte BLOCK_IS_AIR                      ; [77]:
    .byte BLOCK_IS_AIR                      ; [78]:
    .byte BLOCK_IS_AIR                      ; [79]:
    .byte BLOCK_IS_AIR                      ; [80]:
    .byte BLOCK_IS_AIR                      ; [81]:
    .byte BLOCK_IS_AIR                      ; [82]:
    .byte BLOCK_IS_AIR                      ; [83]:
    .byte BLOCK_IS_AIR                      ; [84]:
    .byte BLOCK_IS_AIR                      ; [85]:
    .byte BLOCK_IS_SOLID                    ; [86]:
    .byte BLOCK_IS_AIR                      ; [87]:
    .byte BLOCK_BREAKABLE_FLOOR             ; [88]:
    .byte BLOCK_IS_SOLID                    ; [89]:
    .byte BLOCK_IS_AIR                      ; [90]:
    .byte BLOCK_IS_AIR                      ; [91]:
    .byte BLOCK_IS_AIR                      ; [92]:
    .byte BLOCK_IS_AIR                      ; [93]:
    .byte BLOCK_IS_AIR                      ; [94]:
    .byte BLOCK_IS_AIR                      ; [95]:
    .byte BLOCK_IS_SOLID                    ; [96]:
    .byte BLOCK_IS_AIR                      ; [97]:
    .byte BLOCK_IS_AIR                      ; [98]:
    .byte BLOCK_IS_AIR                      ; [99]:
    .byte BLOCK_IS_AIR                      ; [100]:
    .byte BLOCK_IS_DOOR                     ; [101]:
    .byte BLOCK_IS_SOLID                    ; [102]:
    .byte BLOCK_IS_SOLID                    ; [103]:
    .byte BLOCK_IS_AIR                      ; [104]:
    .byte BLOCK_IS_AIR                      ; [105]:
    .byte BLOCK_IS_AIR                      ; [106]:
    .byte BLOCK_IS_DOOR                     ; [107]:
    .byte BLOCK_IS_DOOR                     ; [108]:
    .byte BLOCK_IS_AIR                      ; [109]:
    .byte BLOCK_IS_AIR                      ; [110]:
    .byte BLOCK_IS_AIR                      ; [111]:
    .byte BLOCK_IS_AIR                      ; [112]:
    .byte BLOCK_IS_AIR                      ; [113]:
    .byte BLOCK_IS_AIR                      ; [114]:
    .byte BLOCK_IS_AIR                      ; [115]:
    .byte BLOCK_IS_AIR                      ; [116]:
    .byte BLOCK_IS_AIR                      ; [117]:
    .byte BLOCK_IS_AIR                      ; [118]:
    .byte BLOCK_IS_AIR                      ; [119]:
    .byte BLOCK_IS_AIR                      ; [120]:
    .byte BLOCK_IS_SOLID                    ; [121]:
    .byte BLOCK_IS_SOLID                    ; [122]:
    .byte BLOCK_IS_LADDER                   ; [123]:
    .byte BLOCK_IS_AIR                      ; [124]:
    .byte BLOCK_IS_AIR                      ; [125]:
    .byte BLOCK_IS_AIR                      ; [126]:
    .byte BLOCK_IS_AIR                      ; [127]:
    .byte BLOCK_AREA_TRANSITION_LEFT        ; [128]:
    .byte BLOCK_IS_AIR                      ; [129]:
    .byte BLOCK_IS_AIR                      ; [130]:
    .byte BLOCK_IS_AIR                      ; [131]:
    .byte BLOCK_MAYBE_BREAKABLE_BY_MATTOCK  ; [132]:
    .byte BLOCK_MAYBE_BREAKABLE_BY_MATTOCK  ; [133]:
    .byte BLOCK_BREAKABLE_FLOOR             ; [134]:
    .byte BLOCK_PUSHABLE                    ; [135]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::890e]
;
MIST_SCROLL_DATA:                           ; [$8c4e]
    .byte $ff                               ; [0]:
    .byte $ff                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $05                               ; [3]:
    .byte $ff                               ; [4]:
    .byte $02                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $07                               ; [7]:
    .byte $01                               ; [8]:
    .byte $03                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $08                               ; [11]:
    .byte $02                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $ff                               ; [14]:
    .byte $09                               ; [15]:
    .byte $ff                               ; [16]:
    .byte $05                               ; [17]:
    .byte $2a                               ; [18]:
    .byte $0e                               ; [19]:
    .byte $04                               ; [20]:
    .byte $06                               ; [21]:
    .byte $00                               ; [22]:
    .byte $0f                               ; [23]:
    .byte $05                               ; [24]:
    .byte $ff                               ; [25]:
    .byte $ff                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $ff                               ; [28]:
    .byte $08                               ; [29]:
    .byte $01                               ; [30]:
    .byte $10                               ; [31]:
    .byte $07                               ; [32]:
    .byte $09                               ; [33]:
    .byte $02                               ; [34]:
    .byte $11                               ; [35]:
    .byte $08                               ; [36]:
    .byte $ff                               ; [37]:
    .byte $03                               ; [38]:
    .byte $ff                               ; [39]:
    .byte $ff                               ; [40]:
    .byte $ff                               ; [41]:
    .byte $ff                               ; [42]:
    .byte $ff                               ; [43]:
    .byte $ff                               ; [44]:
    .byte $ff                               ; [45]:
    .byte $ff                               ; [46]:
    .byte $ff                               ; [47]:
    .byte $ff                               ; [48]:
    .byte $ff                               ; [49]:
    .byte $ff                               ; [50]:
    .byte $12                               ; [51]:
    .byte $ff                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $ff                               ; [54]:
    .byte $14                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $0f                               ; [57]:
    .byte $04                               ; [58]:
    .byte $16                               ; [59]:
    .byte $0e                               ; [60]:
    .byte $ff                               ; [61]:
    .byte $05                               ; [62]:
    .byte $ff                               ; [63]:
    .byte $ff                               ; [64]:
    .byte $11                               ; [65]:
    .byte $07                               ; [66]:
    .byte $ff                               ; [67]:
    .byte $10                               ; [68]:
    .byte $ff                               ; [69]:
    .byte $08                               ; [70]:
    .byte $ff                               ; [71]:
    .byte $ff                               ; [72]:
    .byte $13                               ; [73]:
    .byte $0c                               ; [74]:
    .byte $ff                               ; [75]:
    .byte $12                               ; [76]:
    .byte $14                               ; [77]:
    .byte $ff                               ; [78]:
    .byte $ff                               ; [79]:
    .byte $13                               ; [80]:
    .byte $15                               ; [81]:
    .byte $0d                               ; [82]:
    .byte $ff                               ; [83]:
    .byte $14                               ; [84]:
    .byte $16                               ; [85]:
    .byte $ff                               ; [86]:
    .byte $ff                               ; [87]:
    .byte $15                               ; [88]:
    .byte $ff                               ; [89]:
    .byte $0e                               ; [90]:
    .byte $ff                               ; [91]:
    .byte $ff                               ; [92]:
    .byte $18                               ; [93]:
    .byte $ff                               ; [94]:
    .byte $ff                               ; [95]:
    .byte $17                               ; [96]:
    .byte $19                               ; [97]:
    .byte $ff                               ; [98]:
    .byte $ff                               ; [99]:
    .byte $18                               ; [100]:
    .byte $ff                               ; [101]:
    .byte $ff                               ; [102]:
    .byte $1a                               ; [103]:
    .byte $ff                               ; [104]:
    .byte $1b                               ; [105]:
    .byte $19                               ; [106]:
    .byte $22                               ; [107]:
    .byte $1a                               ; [108]:
    .byte $1c                               ; [109]:
    .byte $ff                               ; [110]:
    .byte $ff                               ; [111]:
    .byte $1b                               ; [112]:
    .byte $1d                               ; [113]:
    .byte $ff                               ; [114]:
    .byte $ff                               ; [115]:
    .byte $1c                               ; [116]:
    .byte $1e                               ; [117]:
    .byte $ff                               ; [118]:
    .byte $25                               ; [119]:
    .byte $1d                               ; [120]:
    .byte $1f                               ; [121]:
    .byte $ff                               ; [122]:
    .byte $ff                               ; [123]:
    .byte $1e                               ; [124]:
    .byte $20                               ; [125]:
    .byte $ff                               ; [126]:
    .byte $ff                               ; [127]:
    .byte $1f                               ; [128]:
    .byte $21                               ; [129]:
    .byte $ff                               ; [130]:
    .byte $27                               ; [131]:
    .byte $20                               ; [132]:
    .byte $ff                               ; [133]:
    .byte $ff                               ; [134]:
    .byte $28                               ; [135]:
    .byte $ff                               ; [136]:
    .byte $ff                               ; [137]:
    .byte $1a                               ; [138]:
    .byte $2c                               ; [139]:
    .byte $ff                               ; [140]:
    .byte $ff                               ; [141]:
    .byte $ff                               ; [142]:
    .byte $ff                               ; [143]:
    .byte $ff                               ; [144]:
    .byte $ff                               ; [145]:
    .byte $ff                               ; [146]:
    .byte $ff                               ; [147]:
    .byte $ff                               ; [148]:
    .byte $ff                               ; [149]:
    .byte $1d                               ; [150]:
    .byte $2d                               ; [151]:
    .byte $ff                               ; [152]:
    .byte $27                               ; [153]:
    .byte $1f                               ; [154]:
    .byte $2f                               ; [155]:
    .byte $26                               ; [156]:
    .byte $28                               ; [157]:
    .byte $20                               ; [158]:
    .byte $ff                               ; [159]:
    .byte $27                               ; [160]:
    .byte $29                               ; [161]:
    .byte $21                               ; [162]:
    .byte $ff                               ; [163]:
    .byte $28                               ; [164]:
    .byte $ff                               ; [165]:
    .byte $ff                               ; [166]:
    .byte $ff                               ; [167]:
    .byte $ff                               ; [168]:
    .byte $2b                               ; [169]:
    .byte $ff                               ; [170]:
    .byte $04                               ; [171]:
    .byte $2a                               ; [172]:
    .byte $2c                               ; [173]:
    .byte $ff                               ; [174]:
    .byte $ff                               ; [175]:
    .byte $2b                               ; [176]:
    .byte $ff                               ; [177]:
    .byte $22                               ; [178]:
    .byte $ff                               ; [179]:
    .byte $ff                               ; [180]:
    .byte $2e                               ; [181]:
    .byte $25                               ; [182]:
    .byte $ff                               ; [183]:
    .byte $2d                               ; [184]:
    .byte $2f                               ; [185]:
    .byte $ff                               ; [186]:
    .byte $ff                               ; [187]:
    .byte $2e                               ; [188]:
    .byte $ff                               ; [189]:
    .byte $26                               ; [190]:
    .byte $ff                               ; [191]:
    .byte $ff                               ; [192]:
    .byte $31                               ; [193]:
    .byte $ff                               ; [194]:
    .byte $35                               ; [195]:
    .byte $30                               ; [196]:
    .byte $32                               ; [197]:
    .byte $ff                               ; [198]:
    .byte $36                               ; [199]:
    .byte $31                               ; [200]:
    .byte $33                               ; [201]:
    .byte $ff                               ; [202]:
    .byte $37                               ; [203]:
    .byte $32                               ; [204]:
    .byte $34                               ; [205]:
    .byte $ff                               ; [206]:
    .byte $38                               ; [207]:
    .byte $33                               ; [208]:
    .byte $ff                               ; [209]:
    .byte $ff                               ; [210]:
    .byte $39                               ; [211]:
    .byte $ff                               ; [212]:
    .byte $36                               ; [213]:
    .byte $30                               ; [214]:
    .byte $3b                               ; [215]:
    .byte $35                               ; [216]:
    .byte $37                               ; [217]:
    .byte $31                               ; [218]:
    .byte $3c                               ; [219]:
    .byte $36                               ; [220]:
    .byte $38                               ; [221]:
    .byte $32                               ; [222]:
    .byte $3d                               ; [223]:
    .byte $37                               ; [224]:
    .byte $39                               ; [225]:
    .byte $33                               ; [226]:
    .byte $ff                               ; [227]:
    .byte $38                               ; [228]:
    .byte $3a                               ; [229]:
    .byte $34                               ; [230]:
    .byte $ff                               ; [231]:
    .byte $39                               ; [232]:
    .byte $ff                               ; [233]:
    .byte $ff                               ; [234]:
    .byte $ff                               ; [235]:
    .byte $ff                               ; [236]:
    .byte $3c                               ; [237]:
    .byte $35                               ; [238]:
    .byte $ff                               ; [239]:
    .byte $3b                               ; [240]:
    .byte $3d                               ; [241]:
    .byte $36                               ; [242]:
    .byte $3e                               ; [243]:
    .byte $3c                               ; [244]:
    .byte $ff                               ; [245]:
    .byte $37                               ; [246]:
    .byte $ff                               ; [247]:
    .byte $ff                               ; [248]:
    .byte $ff                               ; [249]:
    .byte $3c                               ; [250]:
    .byte $ff                               ; [251]:
    .byte $ff                               ; [252]:
    .byte $40                               ; [253]:
    .byte $ff                               ; [254]:
    .byte $48                               ; [255]:
    .byte $3f                               ; [256]:
    .byte $41                               ; [257]:
    .byte $ff                               ; [258]:
    .byte $49                               ; [259]:
    .byte $40                               ; [260]:
    .byte $42                               ; [261]:
    .byte $ff                               ; [262]:
    .byte $4a                               ; [263]:
    .byte $41                               ; [264]:
    .byte $43                               ; [265]:
    .byte $ff                               ; [266]:
    .byte $4b                               ; [267]:
    .byte $42                               ; [268]:
    .byte $44                               ; [269]:
    .byte $ff                               ; [270]:
    .byte $4c                               ; [271]:
    .byte $43                               ; [272]:
    .byte $ff                               ; [273]:
    .byte $ff                               ; [274]:
    .byte $ff                               ; [275]:
    .byte $ff                               ; [276]:
    .byte $46                               ; [277]:
    .byte $ff                               ; [278]:
    .byte $ff                               ; [279]:
    .byte $45                               ; [280]:
    .byte $47                               ; [281]:
    .byte $ff                               ; [282]:
    .byte $ff                               ; [283]:
    .byte $46                               ; [284]:
    .byte $48                               ; [285]:
    .byte $ff                               ; [286]:
    .byte $ff                               ; [287]:
    .byte $47                               ; [288]:
    .byte $49                               ; [289]:
    .byte $3f                               ; [290]:
    .byte $ff                               ; [291]:
    .byte $48                               ; [292]:
    .byte $4a                               ; [293]:
    .byte $40                               ; [294]:
    .byte $ff                               ; [295]:
    .byte $49                               ; [296]:
    .byte $4b                               ; [297]:
    .byte $41                               ; [298]:
    .byte $ff                               ; [299]:
    .byte $4a                               ; [300]:
    .byte $4c                               ; [301]:
    .byte $42                               ; [302]:
    .byte $ff                               ; [303]:
    .byte $4b                               ; [304]:
    .byte $ff                               ; [305]:
    .byte $43                               ; [306]:
    .byte $ff                               ; [307]:
    .byte $ff                               ; [308]:
    .byte $4e                               ; [309]:
    .byte $ff                               ; [310]:
    .byte $ff                               ; [311]:
    .byte $4d                               ; [312]:
    .byte $4f                               ; [313]:
    .byte $ff                               ; [314]:
    .byte $ff                               ; [315]:
    .byte $4e                               ; [316]:
    .byte $ff                               ; [317]:
    .byte $ff                               ; [318]:
    .byte $ff                               ; [319]:
    .byte $ff                               ; [320]:
    .byte $51                               ; [321]:
    .byte $ff                               ; [322]:
    .byte $ff                               ; [323]:
    .byte $50                               ; [324]:
    .byte $52                               ; [325]:
    .byte $ff                               ; [326]:
    .byte $ff                               ; [327]:
    .byte $51                               ; [328]:
    .byte $ff                               ; [329]:
    .byte $ff                               ; [330]:
    .byte $ff                               ; [331]:

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::8910]
;
MIST_DOOR_LOCATIONS:                        ; [$8d9a]
    .byte $00                               ; [0]:
    .byte $9a                               ; [1]:
    .byte $00                               ; [2]:
    .byte $91                               ; [3]:
    .byte $17                               ; [4]:
    .byte $a6                               ; [5]:
    .byte $01                               ; [6]:
    .byte $a1                               ; [7]:
    .byte $20                               ; [8]:
    .byte $97                               ; [9]:
    .byte $02                               ; [10]:
    .byte $a3                               ; [11]:
    .byte $01                               ; [12]:
    .byte $88                               ; [13]:
    .byte $03                               ; [14]:
    .byte $ae                               ; [15]:
    .byte $3e                               ; [16]:
    .byte $90                               ; [17]:
    .byte $04                               ; [18]:
    .byte $99                               ; [19]:
    .byte $45                               ; [20]:
    .byte $a0                               ; [21]:
    .byte $05                               ; [22]:
    .byte $a5                               ; [23]:
    .byte $4f                               ; [24]:
    .byte $af                               ; [25]:
    .byte $06                               ; [26]:
    .byte $7b                               ; [27]:
    .byte $50                               ; [28]:
    .byte $a2                               ; [29]:
    .byte $07                               ; [30]:
    .byte $96                               ; [31]:
    .byte $29                               ; [32]:
    .byte $7c                               ; [33]:
    .byte $20                               ; [34]:
    .byte $9e                               ; [35]:
    .byte $06                               ; [36]:
    .byte $93                               ; [37]:
    .byte $21                               ; [38]:
    .byte $9e                               ; [39]:
    .byte $06                               ; [40]:
    .byte $87                               ; [41]:
    .byte $22                               ; [42]:
    .byte $9e                               ; [43]:
    .byte $06                               ; [44]:
    .byte $9b                               ; [45]:
    .byte $23                               ; [46]:
    .byte $9e                               ; [47]:
    .byte $0d                               ; [48]:
    .byte $7c                               ; [49]:
    .byte $24                               ; [50]:
    .byte $9e                               ; [51]:
    .byte $16                               ; [52]:
    .byte $9b                               ; [53]:
    .byte $25                               ; [54]:
    .byte $9e                               ; [55]:
    .byte $1f                               ; [56]:
    .byte $94                               ; [57]:
    .byte $26                               ; [58]:
    .byte $9e                               ; [59]:
    .byte $11                               ; [60]:
    .byte $9f                               ; [61]:
    .byte $fe                               ; [62]:
    .byte $11                               ; [63]:
    .byte $1f                               ; [64]:
    .byte $9c                               ; [65]:
    .byte $ff                               ; [66]:
    .byte $a6                               ; [67]:
    .byte $ff                               ; [$8dde] undefined

;
; XREFS:
;     MIST_AREA_DATA [$PRG3::8912]
;
MIST_DOOR_DESTINATIONS:                     ; [$8ddf]
    .word $0b3e                             ; [0]:
    .word $0003                             ; [1]:
    .word $0b45                             ; [2]:
    .word $0002                             ; [3]:
    .word $0b50                             ; [4]:
    .word $0002                             ; [5]:
    .word $0b4f                             ; [6]:
    .word $0003                             ; [7]:
    .word $0a00                             ; [8]:
    .word $0000                             ; [9]:
    .word $0a17                             ; [10]:
    .word $0000                             ; [11]:
    .word $0a01                             ; [12]:
    .word $0000                             ; [13]:
    .word $0a20                             ; [14]:
    .word $0000                             ; [15]:
    .word $0000                             ; [16]:
    .word $0000                             ; [17]:
    .word $04fd                             ; [18]:
    .word $00ce                             ; [19]:
    .word $0000                             ; [20]:
    .word $0000                             ; [21]:
    .word $00be                             ; [22]:
    .word $0000                             ; [23]:
    .word $0000                             ; [24]:
    .word $0000                             ; [25]:
    .word $007e                             ; [26]:
    .word $0013                             ; [27]:
    .word $0000                             ; [28]:
    .word $0000                             ; [29]:
    .word $007f                             ; [30]:
    .word $0000                             ; [31]:
    .word $0000                             ; [32]:
    .word $0000                             ; [33]:
    .word $0017                             ; [34]:
    .word $000d                             ; [35]:
    .word $0000                             ; [36]:
    .word $0000                             ; [37]:
    .word $0092                             ; [38]:
    .word $0054                             ; [39]:
    .word $0000                             ; [40]:
    .word $0000                             ; [41]:
    .word $00e2                             ; [42]:
    .word $0091                             ; [43]:
    .word $0000                             ; [44]:
    .word $0000                             ; [45]:
    .word $00b8                             ; [46]:
    .word $00a1                             ; [47]:
    .word $0000                             ; [48]:
    .word $0000                             ; [49]:
    .word $004a                             ; [50]:
    .word $001d                             ; [51]:
    .word $0000                             ; [52]:
    .word $0000                             ; [53]:
    .word $00cf                             ; [54]:
    .word $0068                             ; [55]:
    .word $0000                             ; [56]:
    .word $0000                             ; [57]:
    .word $00f0                             ; [58]:
    .word $00d4                             ; [59]:
    .word $0000                             ; [60]:
    .word $0000                             ; [61]:
    .word $00d4                             ; [62]:
    .word $0000                             ; [63]:
    .word $091c                             ; [64]:
    .word $0000                             ; [65]:
    .word $031d                             ; [66]:
    .word $0000                             ; [67]:
    .word $011e                             ; [68]:
    .word $0000                             ; [69]:
    .word $021f                             ; [70]:
    .word $0000                             ; [71]:
    .word $0420                             ; [72]:
    .word $0000                             ; [73]:
    .word $0621                             ; [74]:
    .word $0000                             ; [75]:
    .word $0622                             ; [76]:
    .word $0000                             ; [77]:


;============================================================================
; Table of relative pointers from 0x8000 for Branch.
;
; 40 doors
; 94 tiles
;============================================================================
BRANCH_AREA_DATA:                           ; [$8e7b]
    .word (BRANCH_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; Block
                                                            ; attributes
                                                            ; pointer
    .word (BRANCH_BLOCK_PROPERTIES-$8000) & $FFFF ; Block properties
    .word (BRANCH_SCROLL_DATA-$8000) & $FFFF ; Scroll data
    .word (BRANCH_DOOR_LOCATIONS-$8000) & $FFFF ; Door locations
    .word (BRANCH_DOOR_DESTINATIONS-$8000) & $FFFF ; Door destinations

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e7b]
;
BRANCH_AREA_DATA_blockAttrsRelPtr:          ; [$8e85]
    .word (BRANCH_BLOCK_ATTRIBUTES-$8000) & $FFFF ; Block attributes
    .word (BRANCH_BLOCK_DATA_01-$8000) & $FFFF ; Block data 1
    .word (BRANCH_BLOCK_DATA_02-$8000) & $FFFF ; Block data 2
    .word (BRANCH_BLOCK_DATA_03-$8000) & $FFFF ; Block data 3
    .word (BRANCH_BLOCK_DATA_04-$8000) & $FFFF ; Block data 4

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e85]
;
BRANCH_BLOCK_ATTRIBUTES:                    ; [$8e8f]
    .byte $00                               ; [0]:
    .byte $55                               ; [1]:
    .byte $55                               ; [2]:
    .byte $55                               ; [3]:
    .byte $55                               ; [4]:
    .byte $55                               ; [5]:
    .byte $00                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $55                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $55                               ; [11]:
    .byte $55                               ; [12]:
    .byte $55                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $00                               ; [16]:
    .byte $00                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]:
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $00                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $55                               ; [30]:
    .byte $55                               ; [31]:
    .byte $55                               ; [32]:
    .byte $55                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $55                               ; [47]:
    .byte $55                               ; [48]:
    .byte $55                               ; [49]:
    .byte $55                               ; [50]:
    .byte $55                               ; [51]:
    .byte $ff                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $55                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $55                               ; [64]:
    .byte $55                               ; [65]:
    .byte $55                               ; [66]:
    .byte $55                               ; [67]:
    .byte $55                               ; [68]:
    .byte $55                               ; [69]:
    .byte $55                               ; [70]:
    .byte $55                               ; [71]:
    .byte $00                               ; [72]:
    .byte $ff                               ; [73]:
    .byte $ff                               ; [74]:
    .byte $ff                               ; [75]:
    .byte $55                               ; [76]:
    .byte $00                               ; [77]:
    .byte $55                               ; [78]:
    .byte $55                               ; [79]:
    .byte $ff                               ; [80]:
    .byte $00                               ; [81]:
    .byte $55                               ; [82]:
    .byte $55                               ; [83]:
    .byte $00                               ; [84]:
    .byte $55                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $55                               ; [89]:
    .byte $00                               ; [90]:
    .byte $00                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e87]
;
BRANCH_BLOCK_DATA_01:                       ; [$8eed]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $80                               ; [2]:
    .byte $91                               ; [3]:
    .byte $80                               ; [4]:
    .byte $80                               ; [5]:
    .byte $86                               ; [6]:
    .byte $e3                               ; [7]:
    .byte $80                               ; [8]:
    .byte $a0                               ; [9]:
    .byte $95                               ; [10]:
    .byte $94                               ; [11]:
    .byte $93                               ; [12]:
    .byte $94                               ; [13]:
    .byte $d3                               ; [14]:
    .byte $a5                               ; [15]:
    .byte $a8                               ; [16]:
    .byte $be                               ; [17]:
    .byte $a2                               ; [18]:
    .byte $be                               ; [19]:
    .byte $c0                               ; [20]:
    .byte $86                               ; [21]:
    .byte $83                               ; [22]:
    .byte $95                               ; [23]:
    .byte $95                               ; [24]:
    .byte $95                               ; [25]:
    .byte $a2                               ; [26]:
    .byte $b4                               ; [27]:
    .byte $b5                               ; [28]:
    .byte $a6                               ; [29]:
    .byte $80                               ; [30]:
    .byte $80                               ; [31]:
    .byte $80                               ; [32]:
    .byte $8d                               ; [33]:
    .byte $85                               ; [34]:
    .byte $b4                               ; [35]:
    .byte $c0                               ; [36]:
    .byte $85                               ; [37]:
    .byte $b8                               ; [38]:
    .byte $bd                               ; [39]:
    .byte $8d                               ; [40]:
    .byte $d0                               ; [41]:
    .byte $ea                               ; [42]:
    .byte $c7                               ; [43]:
    .byte $c8                               ; [44]:
    .byte $84                               ; [45]:
    .byte $c0                               ; [46]:
    .byte $80                               ; [47]:
    .byte $cc                               ; [48]:
    .byte $86                               ; [49]:
    .byte $86                               ; [50]:
    .byte $86                               ; [51]:
    .byte $b8                               ; [52]:
    .byte $c4                               ; [53]:
    .byte $84                               ; [54]:
    .byte $fc                               ; [55]:
    .byte $86                               ; [56]:
    .byte $a6                               ; [57]:
    .byte $a0                               ; [58]:
    .byte $ad                               ; [59]:
    .byte $85                               ; [60]:
    .byte $a8                               ; [61]:
    .byte $84                               ; [62]:
    .byte $d7                               ; [63]:
    .byte $8e                               ; [64]:
    .byte $a7                               ; [65]:
    .byte $ca                               ; [66]:
    .byte $ca                               ; [67]:
    .byte $86                               ; [68]:
    .byte $86                               ; [69]:
    .byte $b8                               ; [70]:
    .byte $c4                               ; [71]:
    .byte $85                               ; [72]:
    .byte $ba                               ; [73]:
    .byte $bc                               ; [74]:
    .byte $bc                               ; [75]:
    .byte $99                               ; [76]:
    .byte $d2                               ; [77]:
    .byte $d5                               ; [78]:
    .byte $db                               ; [79]:
    .byte $e8                               ; [80]:
    .byte $d5                               ; [81]:
    .byte $cc                               ; [82]:
    .byte $dc                               ; [83]:
    .byte $8d                               ; [84]:
    .byte $ec                               ; [85]:
    .byte $f0                               ; [86]:
    .byte $f2                               ; [87]:
    .byte $8d                               ; [88]:
    .byte $8e                               ; [89]:
    .byte $f4                               ; [90]:
    .byte $f8                               ; [91]:
    .byte $b8                               ; [92]:
    .byte $b8                               ; [93]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e89]
;
BRANCH_BLOCK_DATA_02:                       ; [$8f4b]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $80                               ; [2]:
    .byte $93                               ; [3]:
    .byte $80                               ; [4]:
    .byte $80                               ; [5]:
    .byte $86                               ; [6]:
    .byte $e4                               ; [7]:
    .byte $8b                               ; [8]:
    .byte $a1                               ; [9]:
    .byte $95                               ; [10]:
    .byte $92                               ; [11]:
    .byte $94                               ; [12]:
    .byte $94                               ; [13]:
    .byte $d4                               ; [14]:
    .byte $a6                               ; [15]:
    .byte $e7                               ; [16]:
    .byte $bf                               ; [17]:
    .byte $a3                               ; [18]:
    .byte $bf                               ; [19]:
    .byte $85                               ; [20]:
    .byte $95                               ; [21]:
    .byte $b6                               ; [22]:
    .byte $95                               ; [23]:
    .byte $95                               ; [24]:
    .byte $96                               ; [25]:
    .byte $a3                               ; [26]:
    .byte $b3                               ; [27]:
    .byte $b6                               ; [28]:
    .byte $a5                               ; [29]:
    .byte $97                               ; [30]:
    .byte $8b                               ; [31]:
    .byte $a7                               ; [32]:
    .byte $8d                               ; [33]:
    .byte $85                               ; [34]:
    .byte $85                               ; [35]:
    .byte $c1                               ; [36]:
    .byte $bf                               ; [37]:
    .byte $b9                               ; [38]:
    .byte $bd                               ; [39]:
    .byte $a6                               ; [40]:
    .byte $d1                               ; [41]:
    .byte $eb                               ; [42]:
    .byte $85                               ; [43]:
    .byte $bf                               ; [44]:
    .byte $bf                               ; [45]:
    .byte $85                               ; [46]:
    .byte $80                               ; [47]:
    .byte $c9                               ; [48]:
    .byte $86                               ; [49]:
    .byte $86                               ; [50]:
    .byte $9d                               ; [51]:
    .byte $c3                               ; [52]:
    .byte $b9                               ; [53]:
    .byte $84                               ; [54]:
    .byte $a5                               ; [55]:
    .byte $86                               ; [56]:
    .byte $a5                               ; [57]:
    .byte $a1                               ; [58]:
    .byte $86                               ; [59]:
    .byte $c1                               ; [60]:
    .byte $a9                               ; [61]:
    .byte $c1                               ; [62]:
    .byte $d8                               ; [63]:
    .byte $8f                               ; [64]:
    .byte $8d                               ; [65]:
    .byte $80                               ; [66]:
    .byte $80                               ; [67]:
    .byte $cd                               ; [68]:
    .byte $cb                               ; [69]:
    .byte $c3                               ; [70]:
    .byte $b9                               ; [71]:
    .byte $85                               ; [72]:
    .byte $bb                               ; [73]:
    .byte $bd                               ; [74]:
    .byte $bd                               ; [75]:
    .byte $9c                               ; [76]:
    .byte $a5                               ; [77]:
    .byte $c1                               ; [78]:
    .byte $dc                               ; [79]:
    .byte $e9                               ; [80]:
    .byte $b5                               ; [81]:
    .byte $c9                               ; [82]:
    .byte $c1                               ; [83]:
    .byte $a6                               ; [84]:
    .byte $ed                               ; [85]:
    .byte $f1                               ; [86]:
    .byte $f3                               ; [87]:
    .byte $a6                               ; [88]:
    .byte $8f                               ; [89]:
    .byte $f5                               ; [90]:
    .byte $f9                               ; [91]:
    .byte $b9                               ; [92]:
    .byte $b9                               ; [93]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e8b]
;
BRANCH_BLOCK_DATA_03:                       ; [$8fa9]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $91                               ; [2]:
    .byte $86                               ; [3]:
    .byte $92                               ; [4]:
    .byte $92                               ; [5]:
    .byte $95                               ; [6]:
    .byte $e5                               ; [7]:
    .byte $8b                               ; [8]:
    .byte $b0                               ; [9]:
    .byte $95                               ; [10]:
    .byte $86                               ; [11]:
    .byte $86                               ; [12]:
    .byte $86                               ; [13]:
    .byte $85                               ; [14]:
    .byte $b5                               ; [15]:
    .byte $aa                               ; [16]:
    .byte $ce                               ; [17]:
    .byte $b0                               ; [18]:
    .byte $cf                               ; [19]:
    .byte $8a                               ; [20]:
    .byte $95                               ; [21]:
    .byte $84                               ; [22]:
    .byte $95                               ; [23]:
    .byte $a5                               ; [24]:
    .byte $96                               ; [25]:
    .byte $a4                               ; [26]:
    .byte $85                               ; [27]:
    .byte $a2                               ; [28]:
    .byte $83                               ; [29]:
    .byte $80                               ; [30]:
    .byte $97                               ; [31]:
    .byte $80                               ; [32]:
    .byte $a7                               ; [33]:
    .byte $85                               ; [34]:
    .byte $84                               ; [35]:
    .byte $c0                               ; [36]:
    .byte $ac                               ; [37]:
    .byte $ba                               ; [38]:
    .byte $bd                               ; [39]:
    .byte $8d                               ; [40]:
    .byte $e0                               ; [41]:
    .byte $ea                               ; [42]:
    .byte $ce                               ; [43]:
    .byte $85                               ; [44]:
    .byte $ce                               ; [45]:
    .byte $8a                               ; [46]:
    .byte $cc                               ; [47]:
    .byte $86                               ; [48]:
    .byte $9c                               ; [49]:
    .byte $9d                               ; [50]:
    .byte $9f                               ; [51]:
    .byte $ba                               ; [52]:
    .byte $ba                               ; [53]:
    .byte $a2                               ; [54]:
    .byte $fd                               ; [55]:
    .byte $d2                               ; [56]:
    .byte $b5                               ; [57]:
    .byte $d9                               ; [58]:
    .byte $99                               ; [59]:
    .byte $85                               ; [60]:
    .byte $aa                               ; [61]:
    .byte $a8                               ; [62]:
    .byte $a0                               ; [63]:
    .byte $8e                               ; [64]:
    .byte $80                               ; [65]:
    .byte $cd                               ; [66]:
    .byte $86                               ; [67]:
    .byte $86                               ; [68]:
    .byte $cb                               ; [69]:
    .byte $ba                               ; [70]:
    .byte $ba                               ; [71]:
    .byte $84                               ; [72]:
    .byte $bc                               ; [73]:
    .byte $bc                               ; [74]:
    .byte $d9                               ; [75]:
    .byte $80                               ; [76]:
    .byte $d5                               ; [77]:
    .byte $84                               ; [78]:
    .byte $dd                               ; [79]:
    .byte $e5                               ; [80]:
    .byte $84                               ; [81]:
    .byte $d2                               ; [82]:
    .byte $de                               ; [83]:
    .byte $8d                               ; [84]:
    .byte $ee                               ; [85]:
    .byte $f2                               ; [86]:
    .byte $f2                               ; [87]:
    .byte $8d                               ; [88]:
    .byte $8e                               ; [89]:
    .byte $f6                               ; [90]:
    .byte $fa                               ; [91]:
    .byte $ba                               ; [92]:
    .byte $ba                               ; [93]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e8d]
;
BRANCH_BLOCK_DATA_04:                       ; [$9007]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $93                               ; [2]:
    .byte $86                               ; [3]:
    .byte $92                               ; [4]:
    .byte $93                               ; [5]:
    .byte $95                               ; [6]:
    .byte $e6                               ; [7]:
    .byte $86                               ; [8]:
    .byte $b1                               ; [9]:
    .byte $95                               ; [10]:
    .byte $86                               ; [11]:
    .byte $86                               ; [12]:
    .byte $86                               ; [13]:
    .byte $df                               ; [14]:
    .byte $b6                               ; [15]:
    .byte $ab                               ; [16]:
    .byte $cf                               ; [17]:
    .byte $a1                               ; [18]:
    .byte $87                               ; [19]:
    .byte $85                               ; [20]:
    .byte $82                               ; [21]:
    .byte $84                               ; [22]:
    .byte $82                               ; [23]:
    .byte $a6                               ; [24]:
    .byte $96                               ; [25]:
    .byte $b3                               ; [26]:
    .byte $85                               ; [27]:
    .byte $a3                               ; [28]:
    .byte $b5                               ; [29]:
    .byte $98                               ; [30]:
    .byte $95                               ; [31]:
    .byte $80                               ; [32]:
    .byte $8d                               ; [33]:
    .byte $85                               ; [34]:
    .byte $84                               ; [35]:
    .byte $c1                               ; [36]:
    .byte $ce                               ; [37]:
    .byte $bb                               ; [38]:
    .byte $bd                               ; [39]:
    .byte $bc                               ; [40]:
    .byte $e1                               ; [41]:
    .byte $eb                               ; [42]:
    .byte $84                               ; [43]:
    .byte $cf                               ; [44]:
    .byte $cf                               ; [45]:
    .byte $87                               ; [46]:
    .byte $c9                               ; [47]:
    .byte $86                               ; [48]:
    .byte $9d                               ; [49]:
    .byte $9e                               ; [50]:
    .byte $80                               ; [51]:
    .byte $bb                               ; [52]:
    .byte $bb                               ; [53]:
    .byte $a3                               ; [54]:
    .byte $b6                               ; [55]:
    .byte $a5                               ; [56]:
    .byte $b5                               ; [57]:
    .byte $da                               ; [58]:
    .byte $9a                               ; [59]:
    .byte $c1                               ; [60]:
    .byte $ab                               ; [61]:
    .byte $a9                               ; [62]:
    .byte $a1                               ; [63]:
    .byte $8f                               ; [64]:
    .byte $a7                               ; [65]:
    .byte $80                               ; [66]:
    .byte $ca                               ; [67]:
    .byte $cd                               ; [68]:
    .byte $80                               ; [69]:
    .byte $bb                               ; [70]:
    .byte $bb                               ; [71]:
    .byte $84                               ; [72]:
    .byte $bd                               ; [73]:
    .byte $bd                               ; [74]:
    .byte $da                               ; [75]:
    .byte $80                               ; [76]:
    .byte $b5                               ; [77]:
    .byte $84                               ; [78]:
    .byte $de                               ; [79]:
    .byte $e6                               ; [80]:
    .byte $c1                               ; [81]:
    .byte $86                               ; [82]:
    .byte $c1                               ; [83]:
    .byte $bc                               ; [84]:
    .byte $ef                               ; [85]:
    .byte $f3                               ; [86]:
    .byte $f3                               ; [87]:
    .byte $bc                               ; [88]:
    .byte $8f                               ; [89]:
    .byte $f7                               ; [90]:
    .byte $fb                               ; [91]:
    .byte $bb                               ; [92]:
    .byte $bb                               ; [93]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e7d]
;
BRANCH_BLOCK_PROPERTIES:                    ; [$9065]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_IS_AIR                      ; [1]:
    .byte BLOCK_IS_AIR                      ; [2]:
    .byte BLOCK_IS_AIR                      ; [3]:
    .byte BLOCK_IS_AIR                      ; [4]:
    .byte BLOCK_IS_AIR                      ; [5]:
    .byte BLOCK_IS_AIR                      ; [6]:
    .byte BLOCK_FOREGROUND                  ; [7]:
    .byte BLOCK_IS_AIR                      ; [8]:
    .byte BLOCK_FOREGROUND                  ; [9]:
    .byte BLOCK_IS_AIR                      ; [10]:
    .byte BLOCK_IS_AIR                      ; [11]:
    .byte BLOCK_IS_AIR                      ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_IS_AIR                      ; [14]:
    .byte BLOCK_IS_SOLID                    ; [15]:
    .byte BLOCK_IS_AIR                      ; [16]:
    .byte BLOCK_IS_AIR                      ; [17]:
    .byte BLOCK_FOREGROUND                  ; [18]:
    .byte BLOCK_IS_AIR                      ; [19]:
    .byte BLOCK_IS_AIR                      ; [20]:
    .byte BLOCK_IS_SOLID                    ; [21]:
    .byte BLOCK_IS_SOLID                    ; [22]:
    .byte BLOCK_IS_SOLID                    ; [23]:
    .byte BLOCK_IS_AIR                      ; [24]:
    .byte BLOCK_IS_SOLID                    ; [25]:
    .byte BLOCK_IS_SOLID                    ; [26]:
    .byte BLOCK_IS_AIR                      ; [27]:
    .byte BLOCK_IS_SOLID                    ; [28]:
    .byte BLOCK_IS_SOLID                    ; [29]:
    .byte BLOCK_IS_AIR                      ; [30]:
    .byte BLOCK_IS_AIR                      ; [31]:
    .byte BLOCK_IS_AIR                      ; [32]:
    .byte BLOCK_IS_SOLID                    ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_IS_AIR                      ; [35]:
    .byte BLOCK_IS_AIR                      ; [36]:
    .byte BLOCK_IS_AIR                      ; [37]:
    .byte BLOCK_IS_SOLID                    ; [38]:
    .byte BLOCK_IS_AIR                      ; [39]:
    .byte BLOCK_IS_SOLID                    ; [40]:
    .byte BLOCK_IS_DOOR                     ; [41]:
    .byte BLOCK_IS_DOOR                     ; [42]:
    .byte BLOCK_IS_AIR                      ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_IS_AIR                      ; [46]:
    .byte BLOCK_IS_AIR                      ; [47]:
    .byte BLOCK_IS_AIR                      ; [48]:
    .byte BLOCK_IS_SOLID                    ; [49]:
    .byte BLOCK_IS_SOLID                    ; [50]:
    .byte BLOCK_IS_SOLID                    ; [51]:
    .byte BLOCK_IS_SOLID                    ; [52]:
    .byte BLOCK_IS_SOLID                    ; [53]:
    .byte BLOCK_IS_SOLID                    ; [54]:
    .byte BLOCK_IS_SOLID                    ; [55]:
    .byte BLOCK_IS_SOLID                    ; [56]:
    .byte BLOCK_IS_SOLID                    ; [57]:
    .byte BLOCK_FOREGROUND                  ; [58]:
    .byte BLOCK_IS_SOLID                    ; [59]:
    .byte BLOCK_IS_AIR                      ; [60]:
    .byte BLOCK_IS_AIR                      ; [61]:
    .byte BLOCK_IS_AIR                      ; [62]:
    .byte BLOCK_FOREGROUND                  ; [63]:
    .byte BLOCK_IS_LADDER                   ; [64]:
    .byte BLOCK_IS_AIR                      ; [65]:
    .byte BLOCK_IS_AIR                      ; [66]:
    .byte BLOCK_IS_AIR                      ; [67]:
    .byte BLOCK_IS_AIR                      ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_SOLID                    ; [70]:
    .byte BLOCK_IS_SOLID                    ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_SOLID                    ; [73]:
    .byte BLOCK_IS_SOLID                    ; [74]:
    .byte BLOCK_IS_SOLID                    ; [75]:
    .byte BLOCK_IS_AIR                      ; [76]:
    .byte BLOCK_IS_SOLID                    ; [77]:
    .byte BLOCK_IS_AIR                      ; [78]:
    .byte BLOCK_IS_AIR                      ; [79]:
    .byte BLOCK_FOREGROUND                  ; [80]:
    .byte BLOCK_IS_AIR                      ; [81]:
    .byte BLOCK_IS_SOLID                    ; [82]:
    .byte BLOCK_IS_AIR                      ; [83]:
    .byte BLOCK_FOREGROUND                  ; [84]:
    .byte BLOCK_IS_SOLID                    ; [85]:
    .byte BLOCK_IS_DOOR                     ; [86]:
    .byte BLOCK_IS_DOOR                     ; [87]:
    .byte BLOCK_AREA_TRANSITION_LEFT        ; [88]:
    .byte BLOCK_0x0e                        ; [89]:
    .byte BLOCK_IS_SOLID                    ; [90]:
    .byte BLOCK_IS_SOLID                    ; [91]:
    .byte BLOCK_MAYBE_BREAKABLE_BY_MATTOCK  ; [92]:
    .byte BLOCK_BREAKABLE_FLOOR             ; [93]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e7f]
;
BRANCH_SCROLL_DATA:                         ; [$90c3]
    .byte $ff                               ; [0]:
    .byte $01                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $00                               ; [4]:
    .byte $02                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $01                               ; [8]:
    .byte $03                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $02                               ; [12]:
    .byte $04                               ; [13]:
    .byte $05                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $03                               ; [16]:
    .byte $ff                               ; [17]:
    .byte $06                               ; [18]:
    .byte $ff                               ; [19]:
    .byte $ff                               ; [20]:
    .byte $06                               ; [21]:
    .byte $0b                               ; [22]:
    .byte $03                               ; [23]:
    .byte $05                               ; [24]:
    .byte $ff                               ; [25]:
    .byte $0c                               ; [26]:
    .byte $04                               ; [27]:
    .byte $ff                               ; [28]:
    .byte $08                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $07                               ; [32]:
    .byte $09                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $ff                               ; [35]:
    .byte $08                               ; [36]:
    .byte $ff                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $ff                               ; [39]:
    .byte $ff                               ; [40]:
    .byte $0b                               ; [41]:
    .byte $ff                               ; [42]:
    .byte $ff                               ; [43]:
    .byte $0a                               ; [44]:
    .byte $0c                               ; [45]:
    .byte $ff                               ; [46]:
    .byte $05                               ; [47]:
    .byte $0b                               ; [48]:
    .byte $0d                               ; [49]:
    .byte $0e                               ; [50]:
    .byte $06                               ; [51]:
    .byte $0c                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $0f                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $ff                               ; [57]:
    .byte $ff                               ; [58]:
    .byte $0c                               ; [59]:
    .byte $ff                               ; [60]:
    .byte $10                               ; [61]:
    .byte $ff                               ; [62]:
    .byte $0d                               ; [63]:
    .byte $0f                               ; [64]:
    .byte $11                               ; [65]:
    .byte $ff                               ; [66]:
    .byte $ff                               ; [67]:
    .byte $10                               ; [68]:
    .byte $12                               ; [69]:
    .byte $ff                               ; [70]:
    .byte $16                               ; [71]:
    .byte $11                               ; [72]:
    .byte $13                               ; [73]:
    .byte $ff                               ; [74]:
    .byte $17                               ; [75]:
    .byte $12                               ; [76]:
    .byte $ff                               ; [77]:
    .byte $ff                               ; [78]:
    .byte $18                               ; [79]:
    .byte $ff                               ; [80]:
    .byte $15                               ; [81]:
    .byte $ff                               ; [82]:
    .byte $19                               ; [83]:
    .byte $14                               ; [84]:
    .byte $ff                               ; [85]:
    .byte $1f                               ; [86]:
    .byte $1a                               ; [87]:
    .byte $ff                               ; [88]:
    .byte $17                               ; [89]:
    .byte $11                               ; [90]:
    .byte $ff                               ; [91]:
    .byte $16                               ; [92]:
    .byte $18                               ; [93]:
    .byte $12                               ; [94]:
    .byte $ff                               ; [95]:
    .byte $17                               ; [96]:
    .byte $ff                               ; [97]:
    .byte $13                               ; [98]:
    .byte $ff                               ; [99]:
    .byte $ff                               ; [100]:
    .byte $1a                               ; [101]:
    .byte $14                               ; [102]:
    .byte $ff                               ; [103]:
    .byte $19                               ; [104]:
    .byte $1b                               ; [105]:
    .byte $15                               ; [106]:
    .byte $ff                               ; [107]:
    .byte $1a                               ; [108]:
    .byte $1c                               ; [109]:
    .byte $ff                               ; [110]:
    .byte $ff                               ; [111]:
    .byte $1b                               ; [112]:
    .byte $1d                               ; [113]:
    .byte $1e                               ; [114]:
    .byte $ff                               ; [115]:
    .byte $1c                               ; [116]:
    .byte $ff                               ; [117]:
    .byte $ff                               ; [118]:
    .byte $ff                               ; [119]:
    .byte $ff                               ; [120]:
    .byte $ff                               ; [121]:
    .byte $21                               ; [122]:
    .byte $1c                               ; [123]:
    .byte $ff                               ; [124]:
    .byte $20                               ; [125]:
    .byte $ff                               ; [126]:
    .byte $15                               ; [127]:
    .byte $1f                               ; [128]:
    .byte $21                               ; [129]:
    .byte $ff                               ; [130]:
    .byte $ff                               ; [131]:
    .byte $20                               ; [132]:
    .byte $ff                               ; [133]:
    .byte $22                               ; [134]:
    .byte $1e                               ; [135]:
    .byte $ff                               ; [136]:
    .byte $23                               ; [137]:
    .byte $ff                               ; [138]:
    .byte $21                               ; [139]:
    .byte $22                               ; [140]:
    .byte $ff                               ; [141]:
    .byte $ff                               ; [142]:
    .byte $ff                               ; [143]:
    .byte $ff                               ; [144]:
    .byte $25                               ; [145]:
    .byte $ff                               ; [146]:
    .byte $ff                               ; [147]:
    .byte $24                               ; [148]:
    .byte $26                               ; [149]:
    .byte $ff                               ; [150]:
    .byte $ff                               ; [151]:
    .byte $25                               ; [152]:
    .byte $27                               ; [153]:
    .byte $ff                               ; [154]:
    .byte $ff                               ; [155]:
    .byte $26                               ; [156]:
    .byte $ff                               ; [157]:
    .byte $ff                               ; [158]:
    .byte $ff                               ; [159]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e81]
;
BRANCH_DOOR_LOCATIONS:                      ; [$9163]
    .byte $0a                               ; [0]:
    .byte $30                               ; [1]:
    .byte $00                               ; [2]:
    .byte $3e                               ; [3]:
    .byte $09                               ; [4]:
    .byte $3f                               ; [5]:
    .byte $01                               ; [6]:
    .byte $31                               ; [7]:
    .byte $0e                               ; [8]:
    .byte $6f                               ; [9]:
    .byte $02                               ; [10]:
    .byte $61                               ; [11]:
    .byte $0f                               ; [12]:
    .byte $60                               ; [13]:
    .byte $03                               ; [14]:
    .byte $6e                               ; [15]:
    .byte $13                               ; [16]:
    .byte $8f                               ; [17]:
    .byte $04                               ; [18]:
    .byte $81                               ; [19]:
    .byte $14                               ; [20]:
    .byte $80                               ; [21]:
    .byte $05                               ; [22]:
    .byte $8e                               ; [23]:
    .byte $18                               ; [24]:
    .byte $8f                               ; [25]:
    .byte $06                               ; [26]:
    .byte $81                               ; [27]:
    .byte $19                               ; [28]:
    .byte $80                               ; [29]:
    .byte $07                               ; [30]:
    .byte $8e                               ; [31]:
    .byte $00                               ; [32]:
    .byte $a5                               ; [33]:
    .byte $fe                               ; [34]:
    .byte $9b                               ; [35]:
    .byte $27                               ; [36]:
    .byte $a8                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $9e                               ; [39]:
    .byte $ff                               ; [40]:

;
; XREFS:
;     BRANCH_AREA_DATA [$PRG3::8e83]
;
BRANCH_DOOR_DESTINATIONS:                   ; [$918c]
    .byte $09,$09,$02,$00,$0a,$08,$00,$00   ; [$918c] undefined
    .byte $0f,$09,$02,$00,$0e,$08,$00,$00   ; [$9194] undefined
    .byte $14,$08,$00,$00,$13,$09,$02,$00   ; [$919c] undefined
    .byte $19,$08,$00,$00,$18,$09,$02,$00   ; [$91a4] undefined


;============================================================================
; Table of relative pointers from 0x8000 for Buildings.
;
; 0 doors
; 256 tiles
;============================================================================
BUILDINGS_AREA_DATA:                        ; [$91ac]
    .word (BUILDINGS_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; Block
                                                               ; attributes
                                                               ; pointer
    .word (BUILDINGS_BLOCK_PROPERTIES-$8000) & $FFFF ; Block properties
    .word (BUILDINGS_SCROLL_DATA-$8000) & $FFFF ; Scroll data
    .word (BUILDINGS_DOOR_LOCATIONS-$8000) & $FFFF ; Door locations
    .word (BUILDINGS_DOOR_DESTINATIONS-$8000) & $FFFF ; Door destinations

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91ac]
;
BUILDINGS_AREA_DATA_blockAttrsRelPtr:       ; [$91b6]
    .word (BUILDINGS_BLOCK_ATTRIBUTES-$8000) & $FFFF ; Block attributes
    .word (BUILDINGS_BLOCK_DATA_01-$8000) & $FFFF ; Block data 1
    .word (BUILDINGS_BLOCK_DATA_02-$8000) & $FFFF ; Block data 2
    .word (BUILDINGS_BLOCK_DATA_03-$8000) & $FFFF ; Block data 3
    .word (BUILDINGS_BLOCK_DATA_04-$8000) & $FFFF ; Block data 4

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91b6]
;
BUILDINGS_BLOCK_ATTRIBUTES:                 ; [$91c0]
    .byte $00                               ; [0]:
    .byte $00                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $55                               ; [4]:
    .byte $55                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $ff                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $00                               ; [12]:
    .byte $00                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $00                               ; [16]:
    .byte $00                               ; [17]:
    .byte $55                               ; [18]:
    .byte $55                               ; [19]:
    .byte $00                               ; [20]:
    .byte $00                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $00                               ; [24]:
    .byte $00                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $00                               ; [28]:
    .byte $00                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $00                               ; [31]:
    .byte $00                               ; [32]:
    .byte $aa                               ; [33]:
    .byte $aa                               ; [34]:
    .byte $aa                               ; [35]:
    .byte $aa                               ; [36]:
    .byte $00                               ; [37]:
    .byte $55                               ; [38]:
    .byte $55                               ; [39]:
    .byte $55                               ; [40]:
    .byte $00                               ; [41]:
    .byte $ff                               ; [42]:
    .byte $55                               ; [43]:
    .byte $ff                               ; [44]:
    .byte $ff                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $ff                               ; [50]:
    .byte $00                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $00                               ; [64]:
    .byte $ff                               ; [65]:
    .byte $ff                               ; [66]:
    .byte $ff                               ; [67]:
    .byte $00                               ; [68]:
    .byte $00                               ; [69]:
    .byte $ff                               ; [70]:
    .byte $ff                               ; [71]:
    .byte $00                               ; [72]:
    .byte $55                               ; [73]:
    .byte $55                               ; [74]:
    .byte $55                               ; [75]:
    .byte $55                               ; [76]:
    .byte $55                               ; [77]:
    .byte $55                               ; [78]:
    .byte $55                               ; [79]:
    .byte $55                               ; [80]:
    .byte $55                               ; [81]:
    .byte $00                               ; [82]:
    .byte $00                               ; [83]:
    .byte $00                               ; [84]:
    .byte $00                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $00                               ; [89]:
    .byte $00                               ; [90]:
    .byte $55                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:
    .byte $55                               ; [94]:
    .byte $00                               ; [95]:
    .byte $ff                               ; [96]:
    .byte $ff                               ; [97]:
    .byte $00                               ; [98]:
    .byte $00                               ; [99]:
    .byte $55                               ; [100]:
    .byte $ff                               ; [101]:
    .byte $ff                               ; [102]:
    .byte $00                               ; [103]:
    .byte $ff                               ; [104]:
    .byte $00                               ; [105]:
    .byte $00                               ; [106]:
    .byte $ff                               ; [107]:
    .byte $55                               ; [108]:
    .byte $55                               ; [109]:
    .byte $55                               ; [110]:
    .byte $ff                               ; [111]:
    .byte $00                               ; [112]:
    .byte $ff                               ; [113]:
    .byte $00                               ; [114]:
    .byte $ff                               ; [115]:
    .byte $ff                               ; [116]:
    .byte $ff                               ; [117]:
    .byte $ff                               ; [118]:
    .byte $00                               ; [119]:
    .byte $ff                               ; [120]:
    .byte $ff                               ; [121]:
    .byte $00                               ; [122]:
    .byte $00                               ; [123]:
    .byte $55                               ; [124]:
    .byte $55                               ; [125]:
    .byte $00                               ; [126]:
    .byte $ff                               ; [127]:
    .byte $00                               ; [128]:
    .byte $00                               ; [129]:
    .byte $00                               ; [130]:
    .byte $00                               ; [131]:
    .byte $00                               ; [132]:
    .byte $55                               ; [133]:
    .byte $55                               ; [134]:
    .byte $00                               ; [135]:
    .byte $00                               ; [136]:
    .byte $00                               ; [137]:
    .byte $00                               ; [138]:
    .byte $00                               ; [139]:
    .byte $00                               ; [140]:
    .byte $00                               ; [141]:
    .byte $00                               ; [142]:
    .byte $00                               ; [143]:
    .byte $00                               ; [144]:
    .byte $55                               ; [145]:
    .byte $00                               ; [146]:
    .byte $ff                               ; [147]:
    .byte $00                               ; [148]:
    .byte $ff                               ; [149]:
    .byte $00                               ; [150]:
    .byte $55                               ; [151]:
    .byte $55                               ; [152]:
    .byte $55                               ; [153]:
    .byte $55                               ; [154]:
    .byte $55                               ; [155]:
    .byte $55                               ; [156]:
    .byte $55                               ; [157]:
    .byte $ff                               ; [158]:
    .byte $ff                               ; [159]:
    .byte $00                               ; [160]:
    .byte $00                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $00                               ; [164]:
    .byte $00                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $00                               ; [168]:
    .byte $00                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:
    .byte $00                               ; [172]:
    .byte $00                               ; [173]:
    .byte $00                               ; [174]:
    .byte $00                               ; [175]:
    .byte $00                               ; [176]:
    .byte $00                               ; [177]:
    .byte $00                               ; [178]:
    .byte $00                               ; [179]:
    .byte $00                               ; [180]:
    .byte $00                               ; [181]:
    .byte $00                               ; [182]:
    .byte $00                               ; [183]:
    .byte $00                               ; [184]:
    .byte $00                               ; [185]:
    .byte $00                               ; [186]:
    .byte $00                               ; [187]:
    .byte $00                               ; [188]:
    .byte $00                               ; [189]:
    .byte $00                               ; [190]:
    .byte $00                               ; [191]:
    .byte $00                               ; [192]:
    .byte $00                               ; [193]:
    .byte $00                               ; [194]:
    .byte $00                               ; [195]:
    .byte $55                               ; [196]:
    .byte $55                               ; [197]:
    .byte $55                               ; [198]:
    .byte $55                               ; [199]:
    .byte $55                               ; [200]:
    .byte $55                               ; [201]:
    .byte $55                               ; [202]:
    .byte $55                               ; [203]:
    .byte $55                               ; [204]:
    .byte $55                               ; [205]:
    .byte $55                               ; [206]:
    .byte $55                               ; [207]:
    .byte $55                               ; [208]:
    .byte $55                               ; [209]:
    .byte $55                               ; [210]:
    .byte $55                               ; [211]:
    .byte $55                               ; [212]:
    .byte $55                               ; [213]:
    .byte $55                               ; [214]:
    .byte $55                               ; [215]:
    .byte $00                               ; [216]:
    .byte $00                               ; [217]:
    .byte $00                               ; [218]:
    .byte $55                               ; [219]:
    .byte $55                               ; [220]:
    .byte $55                               ; [221]:
    .byte $55                               ; [222]:
    .byte $55                               ; [223]:
    .byte $00                               ; [224]:
    .byte $00                               ; [225]:
    .byte $00                               ; [226]:
    .byte $00                               ; [227]:
    .byte $00                               ; [228]:
    .byte $00                               ; [229]:
    .byte $00                               ; [230]:
    .byte $00                               ; [231]:
    .byte $00                               ; [232]:
    .byte $00                               ; [233]:
    .byte $00                               ; [234]:
    .byte $00                               ; [235]:
    .byte $00                               ; [236]:
    .byte $00                               ; [237]:
    .byte $00                               ; [238]:
    .byte $00                               ; [239]:
    .byte $00                               ; [240]:
    .byte $00                               ; [241]:
    .byte $00                               ; [242]:
    .byte $00                               ; [243]:
    .byte $00                               ; [244]:
    .byte $00                               ; [245]:
    .byte $00                               ; [246]:
    .byte $00                               ; [247]:
    .byte $00                               ; [248]:
    .byte $00                               ; [249]:
    .byte $00                               ; [250]:
    .byte $00                               ; [251]:
    .byte $00                               ; [252]:
    .byte $00                               ; [253]:
    .byte $00                               ; [254]:
    .byte $00                               ; [255]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91b8]
;
BUILDINGS_BLOCK_DATA_01:                    ; [$92c0]
    .byte $00                               ; [0]:
    .byte $b0                               ; [1]:
    .byte $b0                               ; [2]:
    .byte $a0                               ; [3]:
    .byte $a4                               ; [4]:
    .byte $a5                               ; [5]:
    .byte $a2                               ; [6]:
    .byte $a7                               ; [7]:
    .byte $a8                               ; [8]:
    .byte $aa                               ; [9]:
    .byte $ab                               ; [10]:
    .byte $b2                               ; [11]:
    .byte $00                               ; [12]:
    .byte $b2                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $ae                               ; [16]:
    .byte $ae                               ; [17]:
    .byte $00                               ; [18]:
    .byte $bb                               ; [19]:
    .byte $b2                               ; [20]:
    .byte $a8                               ; [21]:
    .byte $bf                               ; [22]:
    .byte $c0                               ; [23]:
    .byte $00                               ; [24]:
    .byte $d2                               ; [25]:
    .byte $d4                               ; [26]:
    .byte $cd                               ; [27]:
    .byte $c6                               ; [28]:
    .byte $c7                               ; [29]:
    .byte $cb                               ; [30]:
    .byte $c0                               ; [31]:
    .byte $cb                               ; [32]:
    .byte $d6                               ; [33]:
    .byte $ea                               ; [34]:
    .byte $ee                               ; [35]:
    .byte $e8                               ; [36]:
    .byte $00                               ; [37]:
    .byte $db                               ; [38]:
    .byte $de                               ; [39]:
    .byte $e2                               ; [40]:
    .byte $d8                               ; [41]:
    .byte $f0                               ; [42]:
    .byte $00                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $ab                               ; [46]:
    .byte $aa                               ; [47]:
    .byte $f4                               ; [48]:
    .byte $f4                               ; [49]:
    .byte $f0                               ; [50]:
    .byte $c7                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $9c                               ; [56]:
    .byte $8b                               ; [57]:
    .byte $8b                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $95                               ; [61]:
    .byte $95                               ; [62]:
    .byte $95                               ; [63]:
    .byte $00                               ; [64]:
    .byte $a0                               ; [65]:
    .byte $a8                               ; [66]:
    .byte $b8                               ; [67]:
    .byte $a9                               ; [68]:
    .byte $ab                               ; [69]:
    .byte $b8                               ; [70]:
    .byte $bf                               ; [71]:
    .byte $bf                               ; [72]:
    .byte $c9                               ; [73]:
    .byte $a9                               ; [74]:
    .byte $a9                               ; [75]:
    .byte $a9                               ; [76]:
    .byte $a9                               ; [77]:
    .byte $c0                               ; [78]:
    .byte $c0                               ; [79]:
    .byte $bb                               ; [80]:
    .byte $a9                               ; [81]:
    .byte $c3                               ; [82]:
    .byte $c7                               ; [83]:
    .byte $b1                               ; [84]:
    .byte $af                               ; [85]:
    .byte $ab                               ; [86]:
    .byte $ab                               ; [87]:
    .byte $ab                               ; [88]:
    .byte $ab                               ; [89]:
    .byte $a9                               ; [90]:
    .byte $cd                               ; [91]:
    .byte $00                               ; [92]:
    .byte $ab                               ; [93]:
    .byte $b0                               ; [94]:
    .byte $a9                               ; [95]:
    .byte $a8                               ; [96]:
    .byte $b3                               ; [97]:
    .byte $c5                               ; [98]:
    .byte $b8                               ; [99]:
    .byte $ce                               ; [100]:
    .byte $cf                               ; [101]:
    .byte $d0                               ; [102]:
    .byte $ab                               ; [103]:
    .byte $ab                               ; [104]:
    .byte $ab                               ; [105]:
    .byte $ab                               ; [106]:
    .byte $d3                               ; [107]:
    .byte $d7                               ; [108]:
    .byte $db                               ; [109]:
    .byte $e0                               ; [110]:
    .byte $cf                               ; [111]:
    .byte $b3                               ; [112]:
    .byte $e1                               ; [113]:
    .byte $ab                               ; [114]:
    .byte $e6                               ; [115]:
    .byte $e5                               ; [116]:
    .byte $e5                               ; [117]:
    .byte $e8                               ; [118]:
    .byte $e3                               ; [119]:
    .byte $ab                               ; [120]:
    .byte $ab                               ; [121]:
    .byte $b3                               ; [122]:
    .byte $cf                               ; [123]:
    .byte $f6                               ; [124]:
    .byte $f7                               ; [125]:
    .byte $ab                               ; [126]:
    .byte $b3                               ; [127]:
    .byte $ee                               ; [128]:
    .byte $b3                               ; [129]:
    .byte $b3                               ; [130]:
    .byte $b3                               ; [131]:
    .byte $f0                               ; [132]:
    .byte $a9                               ; [133]:
    .byte $ab                               ; [134]:
    .byte $a9                               ; [135]:
    .byte $ac                               ; [136]:
    .byte $a9                               ; [137]:
    .byte $f0                               ; [138]:
    .byte $a9                               ; [139]:
    .byte $f1                               ; [140]:
    .byte $00                               ; [141]:
    .byte $00                               ; [142]:
    .byte $ce                               ; [143]:
    .byte $a9                               ; [144]:
    .byte $ce                               ; [145]:
    .byte $00                               ; [146]:
    .byte $a8                               ; [147]:
    .byte $cf                               ; [148]:
    .byte $aa                               ; [149]:
    .byte $fd                               ; [150]:
    .byte $bc                               ; [151]:
    .byte $aa                               ; [152]:
    .byte $a9                               ; [153]:
    .byte $ce                               ; [154]:
    .byte $a9                               ; [155]:
    .byte $be                               ; [156]:
    .byte $bb                               ; [157]:
    .byte $e5                               ; [158]:
    .byte $e6                               ; [159]:
    .byte $00                               ; [160]:
    .byte $00                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $00                               ; [164]:
    .byte $00                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $00                               ; [168]:
    .byte $00                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:
    .byte $00                               ; [172]:
    .byte $00                               ; [173]:
    .byte $00                               ; [174]:
    .byte $00                               ; [175]:
    .byte $00                               ; [176]:
    .byte $00                               ; [177]:
    .byte $00                               ; [178]:
    .byte $00                               ; [179]:
    .byte $00                               ; [180]:
    .byte $00                               ; [181]:
    .byte $00                               ; [182]:
    .byte $00                               ; [183]:
    .byte $00                               ; [184]:
    .byte $00                               ; [185]:
    .byte $00                               ; [186]:
    .byte $00                               ; [187]:
    .byte $00                               ; [188]:
    .byte $00                               ; [189]:
    .byte $00                               ; [190]:
    .byte $00                               ; [191]:
    .byte $00                               ; [192]:
    .byte $a0                               ; [193]:
    .byte $b4                               ; [194]:
    .byte $b5                               ; [195]:
    .byte $a1                               ; [196]:
    .byte $b2                               ; [197]:
    .byte $a9                               ; [198]:
    .byte $ad                               ; [199]:
    .byte $a4                               ; [200]:
    .byte $a3                               ; [201]:
    .byte $a7                               ; [202]:
    .byte $a7                               ; [203]:
    .byte $ac                               ; [204]:
    .byte $a9                               ; [205]:
    .byte $ad                               ; [206]:
    .byte $aa                               ; [207]:
    .byte $a7                               ; [208]:
    .byte $a9                               ; [209]:
    .byte $b9                               ; [210]:
    .byte $b7                               ; [211]:
    .byte $bb                               ; [212]:
    .byte $bd                               ; [213]:
    .byte $c0                               ; [214]:
    .byte $c4                               ; [215]:
    .byte $ad                               ; [216]:
    .byte $a9                               ; [217]:
    .byte $a4                               ; [218]:
    .byte $c8                               ; [219]:
    .byte $a1                               ; [220]:
    .byte $ca                               ; [221]:
    .byte $ce                               ; [222]:
    .byte $ac                               ; [223]:
    .byte $00                               ; [224]:
    .byte $00                               ; [225]:
    .byte $00                               ; [226]:
    .byte $00                               ; [227]:
    .byte $00                               ; [228]:
    .byte $00                               ; [229]:
    .byte $00                               ; [230]:
    .byte $00                               ; [231]:
    .byte $00                               ; [232]:
    .byte $00                               ; [233]:
    .byte $00                               ; [234]:
    .byte $00                               ; [235]:
    .byte $00                               ; [236]:
    .byte $00                               ; [237]:
    .byte $00                               ; [238]:
    .byte $00                               ; [239]:
    .byte $00                               ; [240]:
    .byte $00                               ; [241]:
    .byte $00                               ; [242]:
    .byte $00                               ; [243]:
    .byte $00                               ; [244]:
    .byte $00                               ; [245]:
    .byte $00                               ; [246]:
    .byte $00                               ; [247]:
    .byte $00                               ; [248]:
    .byte $00                               ; [249]:
    .byte $00                               ; [250]:
    .byte $00                               ; [251]:
    .byte $00                               ; [252]:
    .byte $00                               ; [253]:
    .byte $00                               ; [254]:
    .byte $00                               ; [255]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91ba]
;
BUILDINGS_BLOCK_DATA_02:                    ; [$93c0]
    .byte $00                               ; [0]:
    .byte $b1                               ; [1]:
    .byte $b1                               ; [2]:
    .byte $a1                               ; [3]:
    .byte $a5                               ; [4]:
    .byte $a6                               ; [5]:
    .byte $a3                               ; [6]:
    .byte $a7                               ; [7]:
    .byte $a9                               ; [8]:
    .byte $ab                               ; [9]:
    .byte $aa                               ; [10]:
    .byte $c8                               ; [11]:
    .byte $b2                               ; [12]:
    .byte $aa                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $af                               ; [16]:
    .byte $af                               ; [17]:
    .byte $00                               ; [18]:
    .byte $bc                               ; [19]:
    .byte $aa                               ; [20]:
    .byte $a9                               ; [21]:
    .byte $bf                               ; [22]:
    .byte $c0                               ; [23]:
    .byte $cc                               ; [24]:
    .byte $d3                               ; [25]:
    .byte $d5                               ; [26]:
    .byte $00                               ; [27]:
    .byte $aa                               ; [28]:
    .byte $c8                               ; [29]:
    .byte $cb                               ; [30]:
    .byte $c0                               ; [31]:
    .byte $00                               ; [32]:
    .byte $00                               ; [33]:
    .byte $eb                               ; [34]:
    .byte $ef                               ; [35]:
    .byte $e9                               ; [36]:
    .byte $00                               ; [37]:
    .byte $e5                               ; [38]:
    .byte $df                               ; [39]:
    .byte $e3                               ; [40]:
    .byte $00                               ; [41]:
    .byte $f0                               ; [42]:
    .byte $00                               ; [43]:
    .byte $f0                               ; [44]:
    .byte $f0                               ; [45]:
    .byte $aa                               ; [46]:
    .byte $ab                               ; [47]:
    .byte $f4                               ; [48]:
    .byte $f4                               ; [49]:
    .byte $f0                               ; [50]:
    .byte $c8                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $8b                               ; [56]:
    .byte $8b                               ; [57]:
    .byte $8b                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $95                               ; [62]:
    .byte $83                               ; [63]:
    .byte $00                               ; [64]:
    .byte $a0                               ; [65]:
    .byte $a8                               ; [66]:
    .byte $b9                               ; [67]:
    .byte $a9                               ; [68]:
    .byte $ab                               ; [69]:
    .byte $b9                               ; [70]:
    .byte $bf                               ; [71]:
    .byte $bf                               ; [72]:
    .byte $ca                               ; [73]:
    .byte $b0                               ; [74]:
    .byte $a9                               ; [75]:
    .byte $a9                               ; [76]:
    .byte $a9                               ; [77]:
    .byte $a7                               ; [78]:
    .byte $c0                               ; [79]:
    .byte $ba                               ; [80]:
    .byte $a9                               ; [81]:
    .byte $c4                               ; [82]:
    .byte $c8                               ; [83]:
    .byte $b2                               ; [84]:
    .byte $a9                               ; [85]:
    .byte $a9                               ; [86]:
    .byte $ab                               ; [87]:
    .byte $a9                               ; [88]:
    .byte $bc                               ; [89]:
    .byte $a9                               ; [90]:
    .byte $a9                               ; [91]:
    .byte $00                               ; [92]:
    .byte $aa                               ; [93]:
    .byte $a9                               ; [94]:
    .byte $a9                               ; [95]:
    .byte $a8                               ; [96]:
    .byte $b3                               ; [97]:
    .byte $c6                               ; [98]:
    .byte $b9                               ; [99]:
    .byte $ce                               ; [100]:
    .byte $cf                               ; [101]:
    .byte $cf                               ; [102]:
    .byte $cf                               ; [103]:
    .byte $ab                               ; [104]:
    .byte $ab                               ; [105]:
    .byte $d2                               ; [106]:
    .byte $d4                               ; [107]:
    .byte $d8                               ; [108]:
    .byte $dc                               ; [109]:
    .byte $e0                               ; [110]:
    .byte $cf                               ; [111]:
    .byte $b3                               ; [112]:
    .byte $e2                               ; [113]:
    .byte $ab                               ; [114]:
    .byte $e7                               ; [115]:
    .byte $e6                               ; [116]:
    .byte $e6                               ; [117]:
    .byte $cf                               ; [118]:
    .byte $e4                               ; [119]:
    .byte $ab                               ; [120]:
    .byte $ab                               ; [121]:
    .byte $b3                               ; [122]:
    .byte $cf                               ; [123]:
    .byte $f6                               ; [124]:
    .byte $f7                               ; [125]:
    .byte $ab                               ; [126]:
    .byte $b3                               ; [127]:
    .byte $cf                               ; [128]:
    .byte $b3                               ; [129]:
    .byte $b3                               ; [130]:
    .byte $b3                               ; [131]:
    .byte $f0                               ; [132]:
    .byte $a9                               ; [133]:
    .byte $ce                               ; [134]:
    .byte $a9                               ; [135]:
    .byte $a9                               ; [136]:
    .byte $ac                               ; [137]:
    .byte $a9                               ; [138]:
    .byte $a9                               ; [139]:
    .byte $a9                               ; [140]:
    .byte $00                               ; [141]:
    .byte $ab                               ; [142]:
    .byte $ce                               ; [143]:
    .byte $a9                               ; [144]:
    .byte $ce                               ; [145]:
    .byte $00                               ; [146]:
    .byte $a8                               ; [147]:
    .byte $cf                               ; [148]:
    .byte $a9                               ; [149]:
    .byte $fe                               ; [150]:
    .byte $cd                               ; [151]:
    .byte $a9                               ; [152]:
    .byte $a9                               ; [153]:
    .byte $ce                               ; [154]:
    .byte $be                               ; [155]:
    .byte $a9                               ; [156]:
    .byte $bb                               ; [157]:
    .byte $e6                               ; [158]:
    .byte $e7                               ; [159]:
    .byte $00                               ; [160]:
    .byte $00                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $00                               ; [164]:
    .byte $00                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $00                               ; [168]:
    .byte $00                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:
    .byte $00                               ; [172]:
    .byte $00                               ; [173]:
    .byte $00                               ; [174]:
    .byte $00                               ; [175]:
    .byte $00                               ; [176]:
    .byte $00                               ; [177]:
    .byte $00                               ; [178]:
    .byte $00                               ; [179]:
    .byte $00                               ; [180]:
    .byte $00                               ; [181]:
    .byte $00                               ; [182]:
    .byte $00                               ; [183]:
    .byte $00                               ; [184]:
    .byte $00                               ; [185]:
    .byte $00                               ; [186]:
    .byte $00                               ; [187]:
    .byte $00                               ; [188]:
    .byte $00                               ; [189]:
    .byte $00                               ; [190]:
    .byte $00                               ; [191]:
    .byte $00                               ; [192]:
    .byte $a0                               ; [193]:
    .byte $b5                               ; [194]:
    .byte $b4                               ; [195]:
    .byte $a2                               ; [196]:
    .byte $b3                               ; [197]:
    .byte $a9                               ; [198]:
    .byte $ad                               ; [199]:
    .byte $a5                               ; [200]:
    .byte $a6                               ; [201]:
    .byte $a8                               ; [202]:
    .byte $a8                               ; [203]:
    .byte $a9                               ; [204]:
    .byte $a9                               ; [205]:
    .byte $ad                               ; [206]:
    .byte $ab                               ; [207]:
    .byte $a8                               ; [208]:
    .byte $a9                               ; [209]:
    .byte $ad                               ; [210]:
    .byte $a9                               ; [211]:
    .byte $bc                               ; [212]:
    .byte $a9                               ; [213]:
    .byte $c6                               ; [214]:
    .byte $a9                               ; [215]:
    .byte $ad                               ; [216]:
    .byte $a9                               ; [217]:
    .byte $a5                               ; [218]:
    .byte $c9                               ; [219]:
    .byte $a2                               ; [220]:
    .byte $cb                               ; [221]:
    .byte $cf                               ; [222]:
    .byte $a9                               ; [223]:
    .byte $00                               ; [224]:
    .byte $00                               ; [225]:
    .byte $00                               ; [226]:
    .byte $00                               ; [227]:
    .byte $00                               ; [228]:
    .byte $00                               ; [229]:
    .byte $00                               ; [230]:
    .byte $00                               ; [231]:
    .byte $00                               ; [232]:
    .byte $00                               ; [233]:
    .byte $00                               ; [234]:
    .byte $00                               ; [235]:
    .byte $00                               ; [236]:
    .byte $00                               ; [237]:
    .byte $00                               ; [238]:
    .byte $00                               ; [239]:
    .byte $00                               ; [240]:
    .byte $00                               ; [241]:
    .byte $00                               ; [242]:
    .byte $00                               ; [243]:
    .byte $00                               ; [244]:
    .byte $00                               ; [245]:
    .byte $00                               ; [246]:
    .byte $00                               ; [247]:
    .byte $00                               ; [248]:
    .byte $00                               ; [249]:
    .byte $00                               ; [250]:
    .byte $00                               ; [251]:
    .byte $00                               ; [252]:
    .byte $00                               ; [253]:
    .byte $00                               ; [254]:
    .byte $00                               ; [255]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91bc]
;
BUILDINGS_BLOCK_DATA_03:                    ; [$94c0]
    .byte $00                               ; [0]:
    .byte $b0                               ; [1]:
    .byte $a0                               ; [2]:
    .byte $b0                               ; [3]:
    .byte $b4                               ; [4]:
    .byte $b5                               ; [5]:
    .byte $b0                               ; [6]:
    .byte $b7                               ; [7]:
    .byte $a9                               ; [8]:
    .byte $ac                               ; [9]:
    .byte $ad                               ; [10]:
    .byte $b2                               ; [11]:
    .byte $00                               ; [12]:
    .byte $b2                               ; [13]:
    .byte $00                               ; [14]:
    .byte $b3                               ; [15]:
    .byte $b8                               ; [16]:
    .byte $b0                               ; [17]:
    .byte $ba                               ; [18]:
    .byte $bd                               ; [19]:
    .byte $a8                               ; [20]:
    .byte $a9                               ; [21]:
    .byte $c0                               ; [22]:
    .byte $c1                               ; [23]:
    .byte $ce                               ; [24]:
    .byte $ad                               ; [25]:
    .byte $c3                               ; [26]:
    .byte $d0                               ; [27]:
    .byte $c5                               ; [28]:
    .byte $c9                               ; [29]:
    .byte $a9                               ; [30]:
    .byte $c0                               ; [31]:
    .byte $cb                               ; [32]:
    .byte $d7                               ; [33]:
    .byte $ec                               ; [34]:
    .byte $d9                               ; [35]:
    .byte $e6                               ; [36]:
    .byte $cb                               ; [37]:
    .byte $dc                               ; [38]:
    .byte $e0                               ; [39]:
    .byte $e4                               ; [40]:
    .byte $cb                               ; [41]:
    .byte $f0                               ; [42]:
    .byte $00                               ; [43]:
    .byte $f0                               ; [44]:
    .byte $00                               ; [45]:
    .byte $ad                               ; [46]:
    .byte $ac                               ; [47]:
    .byte $f5                               ; [48]:
    .byte $b3                               ; [49]:
    .byte $f0                               ; [50]:
    .byte $c9                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $9c                               ; [57]:
    .byte $8b                               ; [58]:
    .byte $8b                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $95                               ; [62]:
    .byte $95                               ; [63]:
    .byte $00                               ; [64]:
    .byte $a0                               ; [65]:
    .byte $be                               ; [66]:
    .byte $b8                               ; [67]:
    .byte $a9                               ; [68]:
    .byte $ab                               ; [69]:
    .byte $b9                               ; [70]:
    .byte $be                               ; [71]:
    .byte $be                               ; [72]:
    .byte $c9                               ; [73]:
    .byte $c9                               ; [74]:
    .byte $cc                               ; [75]:
    .byte $a2                               ; [76]:
    .byte $a2                               ; [77]:
    .byte $a4                               ; [78]:
    .byte $ab                               ; [79]:
    .byte $ba                               ; [80]:
    .byte $a9                               ; [81]:
    .byte $c5                               ; [82]:
    .byte $a9                               ; [83]:
    .byte $b3                               ; [84]:
    .byte $b0                               ; [85]:
    .byte $ab                               ; [86]:
    .byte $b5                               ; [87]:
    .byte $ab                               ; [88]:
    .byte $ab                               ; [89]:
    .byte $aa                               ; [90]:
    .byte $bc                               ; [91]:
    .byte $a2                               ; [92]:
    .byte $ab                               ; [93]:
    .byte $cb                               ; [94]:
    .byte $af                               ; [95]:
    .byte $a0                               ; [96]:
    .byte $b5                               ; [97]:
    .byte $c7                               ; [98]:
    .byte $b9                               ; [99]:
    .byte $a9                               ; [100]:
    .byte $cf                               ; [101]:
    .byte $cf                               ; [102]:
    .byte $ab                               ; [103]:
    .byte $d2                               ; [104]:
    .byte $ab                               ; [105]:
    .byte $ab                               ; [106]:
    .byte $d5                               ; [107]:
    .byte $d9                               ; [108]:
    .byte $dd                               ; [109]:
    .byte $df                               ; [110]:
    .byte $e0                               ; [111]:
    .byte $d2                               ; [112]:
    .byte $e3                               ; [113]:
    .byte $a9                               ; [114]:
    .byte $e6                               ; [115]:
    .byte $e5                               ; [116]:
    .byte $e6                               ; [117]:
    .byte $ab                               ; [118]:
    .byte $e3                               ; [119]:
    .byte $cf                               ; [120]:
    .byte $ed                               ; [121]:
    .byte $f2                               ; [122]:
    .byte $fa                               ; [123]:
    .byte $f4                               ; [124]:
    .byte $f8                               ; [125]:
    .byte $f9                               ; [126]:
    .byte $f9                               ; [127]:
    .byte $d2                               ; [128]:
    .byte $f9                               ; [129]:
    .byte $f9                               ; [130]:
    .byte $fa                               ; [131]:
    .byte $f1                               ; [132]:
    .byte $c9                               ; [133]:
    .byte $ab                               ; [134]:
    .byte $aa                               ; [135]:
    .byte $ad                               ; [136]:
    .byte $a9                               ; [137]:
    .byte $f1                               ; [138]:
    .byte $f0                               ; [139]:
    .byte $a9                               ; [140]:
    .byte $ab                               ; [141]:
    .byte $00                               ; [142]:
    .byte $c3                               ; [143]:
    .byte $a9                               ; [144]:
    .byte $a9                               ; [145]:
    .byte $00                               ; [146]:
    .byte $ae                               ; [147]:
    .byte $cf                               ; [148]:
    .byte $ab                               ; [149]:
    .byte $fd                               ; [150]:
    .byte $bc                               ; [151]:
    .byte $bc                               ; [152]:
    .byte $a3                               ; [153]:
    .byte $ae                               ; [154]:
    .byte $a9                               ; [155]:
    .byte $be                               ; [156]:
    .byte $ba                               ; [157]:
    .byte $e5                               ; [158]:
    .byte $e6                               ; [159]:
    .byte $00                               ; [160]:
    .byte $00                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $00                               ; [164]:
    .byte $00                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $00                               ; [168]:
    .byte $00                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:
    .byte $00                               ; [172]:
    .byte $00                               ; [173]:
    .byte $00                               ; [174]:
    .byte $00                               ; [175]:
    .byte $00                               ; [176]:
    .byte $00                               ; [177]:
    .byte $00                               ; [178]:
    .byte $00                               ; [179]:
    .byte $00                               ; [180]:
    .byte $00                               ; [181]:
    .byte $00                               ; [182]:
    .byte $00                               ; [183]:
    .byte $00                               ; [184]:
    .byte $00                               ; [185]:
    .byte $00                               ; [186]:
    .byte $00                               ; [187]:
    .byte $00                               ; [188]:
    .byte $00                               ; [189]:
    .byte $00                               ; [190]:
    .byte $00                               ; [191]:
    .byte $00                               ; [192]:
    .byte $a4                               ; [193]:
    .byte $a5                               ; [194]:
    .byte $a1                               ; [195]:
    .byte $a2                               ; [196]:
    .byte $a2                               ; [197]:
    .byte $a9                               ; [198]:
    .byte $ad                               ; [199]:
    .byte $b4                               ; [200]:
    .byte $b0                               ; [201]:
    .byte $a7                               ; [202]:
    .byte $aa                               ; [203]:
    .byte $ac                               ; [204]:
    .byte $c5                               ; [205]:
    .byte $b2                               ; [206]:
    .byte $b2                               ; [207]:
    .byte $aa                               ; [208]:
    .byte $a3                               ; [209]:
    .byte $ba                               ; [210]:
    .byte $b7                               ; [211]:
    .byte $c0                               ; [212]:
    .byte $c4                               ; [213]:
    .byte $c1                               ; [214]:
    .byte $c3                               ; [215]:
    .byte $a9                               ; [216]:
    .byte $a9                               ; [217]:
    .byte $b4                               ; [218]:
    .byte $c8                               ; [219]:
    .byte $ac                               ; [220]:
    .byte $cc                               ; [221]:
    .byte $d0                               ; [222]:
    .byte $c5                               ; [223]:
    .byte $00                               ; [224]:
    .byte $00                               ; [225]:
    .byte $00                               ; [226]:
    .byte $00                               ; [227]:
    .byte $00                               ; [228]:
    .byte $00                               ; [229]:
    .byte $00                               ; [230]:
    .byte $00                               ; [231]:
    .byte $00                               ; [232]:
    .byte $00                               ; [233]:
    .byte $00                               ; [234]:
    .byte $00                               ; [235]:
    .byte $00                               ; [236]:
    .byte $00                               ; [237]:
    .byte $00                               ; [238]:
    .byte $00                               ; [239]:
    .byte $00                               ; [240]:
    .byte $00                               ; [241]:
    .byte $00                               ; [242]:
    .byte $00                               ; [243]:
    .byte $00                               ; [244]:
    .byte $00                               ; [245]:
    .byte $00                               ; [246]:
    .byte $00                               ; [247]:
    .byte $00                               ; [248]:
    .byte $00                               ; [249]:
    .byte $00                               ; [250]:
    .byte $00                               ; [251]:
    .byte $00                               ; [252]:
    .byte $00                               ; [253]:
    .byte $00                               ; [254]:
    .byte $00                               ; [255]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91be]
;
BUILDINGS_BLOCK_DATA_04:                    ; [$95c0]
    .byte $00                               ; [0]:
    .byte $b1                               ; [1]:
    .byte $a1                               ; [2]:
    .byte $b1                               ; [3]:
    .byte $b5                               ; [4]:
    .byte $b6                               ; [5]:
    .byte $b1                               ; [6]:
    .byte $b7                               ; [7]:
    .byte $a8                               ; [8]:
    .byte $ad                               ; [9]:
    .byte $ac                               ; [10]:
    .byte $ca                               ; [11]:
    .byte $b2                               ; [12]:
    .byte $ac                               ; [13]:
    .byte $b2                               ; [14]:
    .byte $b3                               ; [15]:
    .byte $b9                               ; [16]:
    .byte $b1                               ; [17]:
    .byte $00                               ; [18]:
    .byte $be                               ; [19]:
    .byte $a9                               ; [20]:
    .byte $a8                               ; [21]:
    .byte $c0                               ; [22]:
    .byte $c1                               ; [23]:
    .byte $cf                               ; [24]:
    .byte $c3                               ; [25]:
    .byte $c3                               ; [26]:
    .byte $d1                               ; [27]:
    .byte $ac                               ; [28]:
    .byte $ca                               ; [29]:
    .byte $a8                               ; [30]:
    .byte $c0                               ; [31]:
    .byte $cb                               ; [32]:
    .byte $00                               ; [33]:
    .byte $ed                               ; [34]:
    .byte $da                               ; [35]:
    .byte $e7                               ; [36]:
    .byte $cb                               ; [37]:
    .byte $dd                               ; [38]:
    .byte $e1                               ; [39]:
    .byte $00                               ; [40]:
    .byte $cb                               ; [41]:
    .byte $f0                               ; [42]:
    .byte $f0                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $ac                               ; [46]:
    .byte $ad                               ; [47]:
    .byte $f6                               ; [48]:
    .byte $b3                               ; [49]:
    .byte $f0                               ; [50]:
    .byte $ca                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $95                               ; [55]:
    .byte $9c                               ; [56]:
    .byte $00                               ; [57]:
    .byte $8b                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $95                               ; [62]:
    .byte $83                               ; [63]:
    .byte $00                               ; [64]:
    .byte $a0                               ; [65]:
    .byte $be                               ; [66]:
    .byte $b9                               ; [67]:
    .byte $a9                               ; [68]:
    .byte $ab                               ; [69]:
    .byte $b8                               ; [70]:
    .byte $be                               ; [71]:
    .byte $be                               ; [72]:
    .byte $ca                               ; [73]:
    .byte $ca                               ; [74]:
    .byte $a1                               ; [75]:
    .byte $a2                               ; [76]:
    .byte $a3                               ; [77]:
    .byte $a5                               ; [78]:
    .byte $a9                               ; [79]:
    .byte $ba                               ; [80]:
    .byte $ba                               ; [81]:
    .byte $c6                               ; [82]:
    .byte $a9                               ; [83]:
    .byte $b4                               ; [84]:
    .byte $a9                               ; [85]:
    .byte $a9                               ; [86]:
    .byte $b6                               ; [87]:
    .byte $aa                               ; [88]:
    .byte $bc                               ; [89]:
    .byte $bc                               ; [90]:
    .byte $aa                               ; [91]:
    .byte $a3                               ; [92]:
    .byte $aa                               ; [93]:
    .byte $a3                               ; [94]:
    .byte $a9                               ; [95]:
    .byte $a0                               ; [96]:
    .byte $b0                               ; [97]:
    .byte $c8                               ; [98]:
    .byte $b8                               ; [99]:
    .byte $a9                               ; [100]:
    .byte $cf                               ; [101]:
    .byte $cf                               ; [102]:
    .byte $cf                               ; [103]:
    .byte $d2                               ; [104]:
    .byte $d2                               ; [105]:
    .byte $cf                               ; [106]:
    .byte $d6                               ; [107]:
    .byte $da                               ; [108]:
    .byte $de                               ; [109]:
    .byte $df                               ; [110]:
    .byte $cf                               ; [111]:
    .byte $d2                               ; [112]:
    .byte $e4                               ; [113]:
    .byte $a9                               ; [114]:
    .byte $e7                               ; [115]:
    .byte $e6                               ; [116]:
    .byte $e6                               ; [117]:
    .byte $e8                               ; [118]:
    .byte $e4                               ; [119]:
    .byte $cf                               ; [120]:
    .byte $ee                               ; [121]:
    .byte $f3                               ; [122]:
    .byte $fb                               ; [123]:
    .byte $f4                               ; [124]:
    .byte $f8                               ; [125]:
    .byte $b0                               ; [126]:
    .byte $e8                               ; [127]:
    .byte $cf                               ; [128]:
    .byte $b0                               ; [129]:
    .byte $f9                               ; [130]:
    .byte $fb                               ; [131]:
    .byte $b7                               ; [132]:
    .byte $ca                               ; [133]:
    .byte $a9                               ; [134]:
    .byte $a9                               ; [135]:
    .byte $a9                               ; [136]:
    .byte $ad                               ; [137]:
    .byte $a9                               ; [138]:
    .byte $a9                               ; [139]:
    .byte $a9                               ; [140]:
    .byte $ab                               ; [141]:
    .byte $ab                               ; [142]:
    .byte $c4                               ; [143]:
    .byte $a9                               ; [144]:
    .byte $a9                               ; [145]:
    .byte $ab                               ; [146]:
    .byte $d1                               ; [147]:
    .byte $cf                               ; [148]:
    .byte $a9                               ; [149]:
    .byte $fe                               ; [150]:
    .byte $bc                               ; [151]:
    .byte $aa                               ; [152]:
    .byte $a9                               ; [153]:
    .byte $d1                               ; [154]:
    .byte $be                               ; [155]:
    .byte $a9                               ; [156]:
    .byte $bc                               ; [157]:
    .byte $e6                               ; [158]:
    .byte $e7                               ; [159]:
    .byte $00                               ; [160]:
    .byte $00                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $00                               ; [164]:
    .byte $00                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $00                               ; [168]:
    .byte $00                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:
    .byte $00                               ; [172]:
    .byte $00                               ; [173]:
    .byte $00                               ; [174]:
    .byte $00                               ; [175]:
    .byte $00                               ; [176]:
    .byte $00                               ; [177]:
    .byte $00                               ; [178]:
    .byte $00                               ; [179]:
    .byte $00                               ; [180]:
    .byte $00                               ; [181]:
    .byte $00                               ; [182]:
    .byte $00                               ; [183]:
    .byte $00                               ; [184]:
    .byte $00                               ; [185]:
    .byte $00                               ; [186]:
    .byte $00                               ; [187]:
    .byte $00                               ; [188]:
    .byte $00                               ; [189]:
    .byte $00                               ; [190]:
    .byte $00                               ; [191]:
    .byte $00                               ; [192]:
    .byte $a5                               ; [193]:
    .byte $a4                               ; [194]:
    .byte $a2                               ; [195]:
    .byte $a1                               ; [196]:
    .byte $a1                               ; [197]:
    .byte $a9                               ; [198]:
    .byte $ad                               ; [199]:
    .byte $b5                               ; [200]:
    .byte $b1                               ; [201]:
    .byte $a8                               ; [202]:
    .byte $ab                               ; [203]:
    .byte $c5                               ; [204]:
    .byte $c5                               ; [205]:
    .byte $b3                               ; [206]:
    .byte $b3                               ; [207]:
    .byte $ab                               ; [208]:
    .byte $a9                               ; [209]:
    .byte $ad                               ; [210]:
    .byte $a9                               ; [211]:
    .byte $c6                               ; [212]:
    .byte $a9                               ; [213]:
    .byte $c2                               ; [214]:
    .byte $a9                               ; [215]:
    .byte $a9                               ; [216]:
    .byte $a9                               ; [217]:
    .byte $b5                               ; [218]:
    .byte $c9                               ; [219]:
    .byte $ac                               ; [220]:
    .byte $cd                               ; [221]:
    .byte $d1                               ; [222]:
    .byte $a9                               ; [223]:
    .byte $00                               ; [224]:
    .byte $00                               ; [225]:
    .byte $00                               ; [226]:
    .byte $00                               ; [227]:
    .byte $00                               ; [228]:
    .byte $00                               ; [229]:
    .byte $00                               ; [230]:
    .byte $00                               ; [231]:
    .byte $00                               ; [232]:
    .byte $00                               ; [233]:
    .byte $00                               ; [234]:
    .byte $00                               ; [235]:
    .byte $00                               ; [236]:
    .byte $00                               ; [237]:
    .byte $00                               ; [238]:
    .byte $00                               ; [239]:
    .byte $00                               ; [240]:
    .byte $00                               ; [241]:
    .byte $00                               ; [242]:
    .byte $00                               ; [243]:
    .byte $00                               ; [244]:
    .byte $00                               ; [245]:
    .byte $00                               ; [246]:
    .byte $00                               ; [247]:
    .byte $00                               ; [248]:
    .byte $00                               ; [249]:
    .byte $00                               ; [250]:
    .byte $00                               ; [251]:
    .byte $00                               ; [252]:
    .byte $00                               ; [253]:
    .byte $00                               ; [254]:
    .byte $00                               ; [255]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91ae]
;
BUILDINGS_BLOCK_PROPERTIES:                 ; [$96c0]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_IS_AIR                      ; [1]:
    .byte BLOCK_IS_AIR                      ; [2]:
    .byte BLOCK_IS_AIR                      ; [3]:
    .byte BLOCK_IS_AIR                      ; [4]:
    .byte BLOCK_IS_AIR                      ; [5]:
    .byte BLOCK_IS_AIR                      ; [6]:
    .byte BLOCK_IS_AIR                      ; [7]:
    .byte BLOCK_IS_AIR                      ; [8]:
    .byte BLOCK_IS_AIR                      ; [9]:
    .byte BLOCK_IS_AIR                      ; [10]:
    .byte BLOCK_IS_AIR                      ; [11]:
    .byte BLOCK_IS_AIR                      ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_IS_AIR                      ; [14]:
    .byte BLOCK_IS_AIR                      ; [15]:
    .byte BLOCK_IS_AIR                      ; [16]:
    .byte BLOCK_IS_AIR                      ; [17]:
    .byte BLOCK_IS_AIR                      ; [18]:
    .byte BLOCK_IS_AIR                      ; [19]:
    .byte BLOCK_IS_AIR                      ; [20]:
    .byte BLOCK_IS_SOLID                    ; [21]:
    .byte BLOCK_IS_SOLID                    ; [22]:
    .byte BLOCK_IS_SOLID                    ; [23]:
    .byte BLOCK_IS_AIR                      ; [24]:
    .byte BLOCK_IS_AIR                      ; [25]:
    .byte BLOCK_IS_AIR                      ; [26]:
    .byte BLOCK_IS_AIR                      ; [27]:
    .byte BLOCK_IS_AIR                      ; [28]:
    .byte BLOCK_IS_AIR                      ; [29]:
    .byte BLOCK_IS_SOLID                    ; [30]:
    .byte BLOCK_IS_AIR                      ; [31]:
    .byte BLOCK_IS_AIR                      ; [32]:
    .byte BLOCK_IS_AIR                      ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_IS_AIR                      ; [35]:
    .byte BLOCK_IS_AIR                      ; [36]:
    .byte BLOCK_IS_AIR                      ; [37]:
    .byte BLOCK_IS_AIR                      ; [38]:
    .byte BLOCK_IS_AIR                      ; [39]:
    .byte BLOCK_IS_AIR                      ; [40]:
    .byte BLOCK_IS_AIR                      ; [41]:
    .byte BLOCK_IS_AIR                      ; [42]:
    .byte BLOCK_IS_AIR                      ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [46]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [47]:
    .byte BLOCK_IS_AIR                      ; [48]:
    .byte BLOCK_IS_AIR                      ; [49]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [50]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [51]:
    .byte BLOCK_IS_DOOR                     ; [52]:
    .byte BLOCK_IS_DOOR                     ; [53]:
    .byte BLOCK_IS_AIR                      ; [54]:
    .byte BLOCK_IS_AIR                      ; [55]:
    .byte BLOCK_IS_AIR                      ; [56]:
    .byte BLOCK_IS_AIR                      ; [57]:
    .byte BLOCK_IS_AIR                      ; [58]:
    .byte BLOCK_IS_AIR                      ; [59]:
    .byte BLOCK_IS_AIR                      ; [60]:
    .byte BLOCK_IS_AIR                      ; [61]:
    .byte BLOCK_IS_AIR                      ; [62]:
    .byte BLOCK_IS_AIR                      ; [63]:
    .byte BLOCK_IS_AIR                      ; [64]:
    .byte BLOCK_IS_AIR                      ; [65]:
    .byte BLOCK_IS_SOLID                    ; [66]:
    .byte BLOCK_IS_SOLID                    ; [67]:
    .byte BLOCK_IS_AIR                      ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_SOLID                    ; [70]:
    .byte BLOCK_IS_AIR                      ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_AIR                      ; [73]:
    .byte BLOCK_IS_AIR                      ; [74]:
    .byte BLOCK_IS_AIR                      ; [75]:
    .byte BLOCK_IS_AIR                      ; [76]:
    .byte BLOCK_IS_AIR                      ; [77]:
    .byte BLOCK_IS_AIR                      ; [78]:
    .byte BLOCK_IS_AIR                      ; [79]:
    .byte BLOCK_IS_AIR                      ; [80]:
    .byte BLOCK_IS_AIR                      ; [81]:
    .byte BLOCK_IS_AIR                      ; [82]:
    .byte BLOCK_IS_AIR                      ; [83]:
    .byte BLOCK_IS_AIR                      ; [84]:
    .byte BLOCK_IS_AIR                      ; [85]:
    .byte BLOCK_IS_AIR                      ; [86]:
    .byte BLOCK_IS_AIR                      ; [87]:
    .byte BLOCK_IS_AIR                      ; [88]:
    .byte BLOCK_IS_AIR                      ; [89]:
    .byte BLOCK_IS_AIR                      ; [90]:
    .byte BLOCK_IS_AIR                      ; [91]:
    .byte BLOCK_IS_AIR                      ; [92]:
    .byte BLOCK_IS_AIR                      ; [93]:
    .byte BLOCK_IS_AIR                      ; [94]:
    .byte BLOCK_IS_AIR                      ; [95]:
    .byte BLOCK_IS_SOLID                    ; [96]:
    .byte BLOCK_IS_AIR                      ; [97]:
    .byte BLOCK_IS_AIR                      ; [98]:
    .byte BLOCK_IS_SOLID                    ; [99]:
    .byte BLOCK_IS_AIR                      ; [100]:
    .byte BLOCK_IS_AIR                      ; [101]:
    .byte BLOCK_IS_AIR                      ; [102]:
    .byte BLOCK_IS_AIR                      ; [103]:
    .byte BLOCK_IS_AIR                      ; [104]:
    .byte BLOCK_IS_AIR                      ; [105]:
    .byte BLOCK_IS_AIR                      ; [106]:
    .byte BLOCK_IS_AIR                      ; [107]:
    .byte BLOCK_IS_AIR                      ; [108]:
    .byte BLOCK_IS_AIR                      ; [109]:
    .byte BLOCK_IS_AIR                      ; [110]:
    .byte BLOCK_IS_AIR                      ; [111]:
    .byte BLOCK_IS_AIR                      ; [112]:
    .byte BLOCK_IS_AIR                      ; [113]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [114]:
    .byte BLOCK_IS_SOLID                    ; [115]:
    .byte BLOCK_IS_SOLID                    ; [116]:
    .byte BLOCK_IS_SOLID                    ; [117]:
    .byte BLOCK_IS_AIR                      ; [118]:
    .byte BLOCK_IS_AIR                      ; [119]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [120]:
    .byte BLOCK_IS_AIR                      ; [121]:
    .byte BLOCK_IS_AIR                      ; [122]:
    .byte BLOCK_IS_AIR                      ; [123]:
    .byte BLOCK_IS_AIR                      ; [124]:
    .byte BLOCK_IS_AIR                      ; [125]:
    .byte BLOCK_IS_AIR                      ; [126]:
    .byte BLOCK_IS_AIR                      ; [127]:
    .byte BLOCK_IS_AIR                      ; [128]:
    .byte BLOCK_IS_AIR                      ; [129]:
    .byte BLOCK_IS_AIR                      ; [130]:
    .byte BLOCK_IS_AIR                      ; [131]:
    .byte BLOCK_IS_AIR                      ; [132]:
    .byte BLOCK_IS_AIR                      ; [133]:
    .byte BLOCK_IS_AIR                      ; [134]:
    .byte BLOCK_IS_AIR                      ; [135]:
    .byte BLOCK_IS_AIR                      ; [136]:
    .byte BLOCK_IS_AIR                      ; [137]:
    .byte BLOCK_IS_AIR                      ; [138]:
    .byte BLOCK_IS_AIR                      ; [139]:
    .byte BLOCK_IS_AIR                      ; [140]:
    .byte BLOCK_IS_AIR                      ; [141]:
    .byte BLOCK_IS_AIR                      ; [142]:
    .byte BLOCK_IS_AIR                      ; [143]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [144]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [145]:
    .byte BLOCK_IS_AIR                      ; [146]:
    .byte BLOCK_IS_AIR                      ; [147]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [148]:
    .byte BLOCK_IS_AIR                      ; [149]:
    .byte BLOCK_IS_AIR                      ; [150]:
    .byte BLOCK_IS_AIR                      ; [151]:
    .byte BLOCK_IS_AIR                      ; [152]:
    .byte BLOCK_IS_AIR                      ; [153]:
    .byte BLOCK_IS_AIR                      ; [154]:
    .byte BLOCK_IS_AIR                      ; [155]:
    .byte BLOCK_IS_AIR                      ; [156]:
    .byte BLOCK_IS_AIR                      ; [157]:
    .byte BLOCK_IS_AIR                      ; [158]:
    .byte BLOCK_IS_AIR                      ; [159]:
    .byte BLOCK_IS_AIR                      ; [160]:
    .byte BLOCK_IS_AIR                      ; [161]:
    .byte BLOCK_IS_AIR                      ; [162]:
    .byte BLOCK_IS_AIR                      ; [163]:
    .byte BLOCK_IS_AIR                      ; [164]:
    .byte BLOCK_IS_AIR                      ; [165]:
    .byte BLOCK_IS_AIR                      ; [166]:
    .byte BLOCK_IS_AIR                      ; [167]:
    .byte BLOCK_IS_AIR                      ; [168]:
    .byte BLOCK_IS_AIR                      ; [169]:
    .byte BLOCK_IS_AIR                      ; [170]:
    .byte BLOCK_IS_AIR                      ; [171]:
    .byte BLOCK_IS_AIR                      ; [172]:
    .byte BLOCK_IS_AIR                      ; [173]:
    .byte BLOCK_IS_AIR                      ; [174]:
    .byte BLOCK_IS_AIR                      ; [175]:
    .byte BLOCK_IS_AIR                      ; [176]:
    .byte BLOCK_IS_AIR                      ; [177]:
    .byte BLOCK_IS_AIR                      ; [178]:
    .byte BLOCK_IS_AIR                      ; [179]:
    .byte BLOCK_IS_AIR                      ; [180]:
    .byte BLOCK_IS_AIR                      ; [181]:
    .byte BLOCK_IS_AIR                      ; [182]:
    .byte BLOCK_IS_AIR                      ; [183]:
    .byte BLOCK_IS_AIR                      ; [184]:
    .byte BLOCK_IS_AIR                      ; [185]:
    .byte BLOCK_IS_AIR                      ; [186]:
    .byte BLOCK_IS_AIR                      ; [187]:
    .byte BLOCK_IS_AIR                      ; [188]:
    .byte BLOCK_IS_AIR                      ; [189]:
    .byte BLOCK_IS_AIR                      ; [190]:
    .byte BLOCK_IS_AIR                      ; [191]:
    .byte BLOCK_IS_AIR                      ; [192]:
    .byte BLOCK_IS_SOLID                    ; [193]:
    .byte BLOCK_IS_AIR                      ; [194]:
    .byte BLOCK_IS_AIR                      ; [195]:
    .byte BLOCK_IS_AIR                      ; [196]:
    .byte BLOCK_IS_SOLID                    ; [197]:
    .byte BLOCK_IS_AIR                      ; [198]:
    .byte BLOCK_IS_AIR                      ; [199]:
    .byte BLOCK_IS_SOLID                    ; [200]:
    .byte BLOCK_IS_AIR                      ; [201]:
    .byte BLOCK_IS_AIR                      ; [202]:
    .byte BLOCK_IS_AIR                      ; [203]:
    .byte BLOCK_IS_AIR                      ; [204]:
    .byte BLOCK_IS_AIR                      ; [205]:
    .byte BLOCK_IS_AIR                      ; [206]:
    .byte BLOCK_IS_AIR                      ; [207]:
    .byte BLOCK_IS_AIR                      ; [208]:
    .byte BLOCK_IS_AIR                      ; [209]:
    .byte BLOCK_IS_AIR                      ; [210]:
    .byte BLOCK_IS_AIR                      ; [211]:
    .byte BLOCK_IS_AIR                      ; [212]:
    .byte BLOCK_IS_AIR                      ; [213]:
    .byte BLOCK_IS_AIR                      ; [214]:
    .byte BLOCK_IS_AIR                      ; [215]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [216]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [217]:
    .byte BLOCK_IS_SOLID                    ; [218]:
    .byte BLOCK_IS_AIR                      ; [219]:
    .byte BLOCK_IS_AIR                      ; [220]:
    .byte BLOCK_IS_AIR                      ; [221]:
    .byte BLOCK_IS_AIR                      ; [222]:
    .byte BLOCK_IS_AIR                      ; [223]:
    .byte BLOCK_IS_SOLID                    ; [224]:
    .byte BLOCK_IS_AIR                      ; [225]:
    .byte BLOCK_IS_AIR                      ; [226]:
    .byte BLOCK_IS_AIR                      ; [227]:
    .byte BLOCK_IS_AIR                      ; [228]:
    .byte BLOCK_IS_AIR                      ; [229]:
    .byte BLOCK_IS_AIR                      ; [230]:
    .byte BLOCK_IS_AIR                      ; [231]:
    .byte BLOCK_IS_AIR                      ; [232]:
    .byte BLOCK_IS_AIR                      ; [233]:
    .byte BLOCK_IS_AIR                      ; [234]:
    .byte BLOCK_IS_AIR                      ; [235]:
    .byte BLOCK_IS_AIR                      ; [236]:
    .byte BLOCK_IS_AIR                      ; [237]:
    .byte BLOCK_IS_AIR                      ; [238]:
    .byte BLOCK_IS_AIR                      ; [239]:
    .byte BLOCK_IS_AIR                      ; [240]:
    .byte BLOCK_IS_AIR                      ; [241]:
    .byte BLOCK_IS_AIR                      ; [242]:
    .byte BLOCK_IS_AIR                      ; [243]:
    .byte BLOCK_IS_AIR                      ; [244]:
    .byte BLOCK_IS_AIR                      ; [245]:
    .byte BLOCK_IS_AIR                      ; [246]:
    .byte BLOCK_IS_AIR                      ; [247]:
    .byte BLOCK_IS_AIR                      ; [248]:
    .byte BLOCK_IS_AIR                      ; [249]:
    .byte BLOCK_IS_AIR                      ; [250]:
    .byte BLOCK_IS_AIR                      ; [251]:
    .byte BLOCK_IS_AIR                      ; [252]:
    .byte BLOCK_IS_AIR                      ; [253]:
    .byte BLOCK_IS_AIR                      ; [254]:
    .byte BLOCK_IS_AIR                      ; [255]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91b0]
;
BUILDINGS_SCROLL_DATA:                      ; [$97c0]
    .byte $ff                               ; [0]:
    .byte $ff                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $ff                               ; [4]:
    .byte $ff                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $ff                               ; [8]:
    .byte $ff                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $ff                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $ff                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $ff                               ; [16]:
    .byte $ff                               ; [17]:
    .byte $ff                               ; [18]:
    .byte $ff                               ; [19]:
    .byte $ff                               ; [20]:
    .byte $ff                               ; [21]:
    .byte $ff                               ; [22]:
    .byte $ff                               ; [23]:
    .byte $ff                               ; [24]:
    .byte $ff                               ; [25]:
    .byte $ff                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $ff                               ; [28]:
    .byte $ff                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $ff                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $ff                               ; [35]:
    .byte $ff                               ; [36]:
    .byte $ff                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $ff                               ; [39]:

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91b2]
;
BUILDINGS_DOOR_LOCATIONS:                   ; [$97e8]
    .byte $ff                               ; [$97e8] byte

;
; XREFS:
;     BUILDINGS_AREA_DATA [$PRG3::91b4]
;
BUILDINGS_DOOR_DESTINATIONS:                ; [$97e9]
    .byte $ff,$ba,$ff,$ff,$ff,$ff,$48,$00   ; [$97e9] undefined
    .byte $ff,$e7,$ff,$ff,$ff,$ff,$c1,$00   ; [$97f1] undefined
    .byte $ff,$f0,$ff,$ff,$ff,$ff,$7a,$00   ; [$97f9] undefined
    .byte $ff,$7f,$ff,$ff,$ff,$ff,$fb,$00   ; [$9801] undefined
    .byte $ff,$fe,$ff,$ff,$ff,$fd,$66,$00   ; [$9809] undefined
    .byte $ff,$fd,$ff,$ff,$ff,$ef,$7f,$00   ; [$9811] undefined
    .byte $ff,$b7,$ff,$ff,$ff,$fe,$5d,$00   ; [$9819] undefined
    .byte $ff,$36,$ff,$ff,$ff,$ff,$7a,$00   ; [$9821] undefined


;============================================================================
; Table of relative pointers from 0x8000 for Towns.
;
; 172 doors
; 112 tiles
;============================================================================
TOWNS_AREA_DATA:                            ; [$9829]
    .word (TOWNS_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; Block attributes
                                                           ; pointer
    .word (TOWNS_BLOCK_PROPERTIES-$8000) & $FFFF ; Block properties
    .word (TOWNS_SCROLL_DATA-$8000) & $FFFF ; Scroll data
    .word (TOWNS_DOOR_LOCATIONS-$8000) & $FFFF ; Door locations
    .word (TOWNS_DOOR_DESTINATIONS-$8000) & $FFFF ; Door destinations

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::9829]
;
TOWNS_AREA_DATA_blockAttrsRelPtr:           ; [$9833]
    .word (TOWNS_BLOCK_ATTRIBUTES-$8000) & $FFFF ; Block attributes
    .word (TOWNS_BLOCK_DATA_01-$8000) & $FFFF ; Block data 1
    .word (TOWNS_BLOCK_DATA_02-$8000) & $FFFF ; Block data 2
    .word (TOWNS_BLOCK_DATA_03-$8000) & $FFFF ; Block data 3
    .word (TOWNS_BLOCK_DATA_04-$8000) & $FFFF ; Block data 4

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::9833]
;
TOWNS_BLOCK_ATTRIBUTES:                     ; [$983d]
    .byte $00                               ; [0]:
    .byte $aa                               ; [1]:
    .byte $aa                               ; [2]:
    .byte $aa                               ; [3]:
    .byte $aa                               ; [4]:
    .byte $aa                               ; [5]:
    .byte $aa                               ; [6]:
    .byte $aa                               ; [7]:
    .byte $aa                               ; [8]:
    .byte $00                               ; [9]:
    .byte $aa                               ; [10]:
    .byte $aa                               ; [11]:
    .byte $aa                               ; [12]:
    .byte $aa                               ; [13]:
    .byte $aa                               ; [14]:
    .byte $aa                               ; [15]:
    .byte $aa                               ; [16]:
    .byte $aa                               ; [17]:
    .byte $aa                               ; [18]:
    .byte $aa                               ; [19]:
    .byte $aa                               ; [20]:
    .byte $aa                               ; [21]:
    .byte $aa                               ; [22]:
    .byte $aa                               ; [23]:
    .byte $aa                               ; [24]:
    .byte $aa                               ; [25]:
    .byte $aa                               ; [26]:
    .byte $aa                               ; [27]:
    .byte $aa                               ; [28]:
    .byte $aa                               ; [29]:
    .byte $aa                               ; [30]:
    .byte $00                               ; [31]:
    .byte $00                               ; [32]:
    .byte $00                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $aa                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $00                               ; [60]:
    .byte $00                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $00                               ; [64]:
    .byte $00                               ; [65]:
    .byte $00                               ; [66]:
    .byte $00                               ; [67]:
    .byte $00                               ; [68]:
    .byte $00                               ; [69]:
    .byte $00                               ; [70]:
    .byte $00                               ; [71]:
    .byte $00                               ; [72]:
    .byte $00                               ; [73]:
    .byte $aa                               ; [74]:
    .byte $00                               ; [75]:
    .byte $00                               ; [76]:
    .byte $00                               ; [77]:
    .byte $00                               ; [78]:
    .byte $00                               ; [79]:
    .byte $00                               ; [80]:
    .byte $00                               ; [81]:
    .byte $55                               ; [82]:
    .byte $00                               ; [83]:
    .byte $00                               ; [84]:
    .byte $00                               ; [85]:
    .byte $aa                               ; [86]:
    .byte $00                               ; [87]:
    .byte $00                               ; [88]:
    .byte $00                               ; [89]:
    .byte $55                               ; [90]:
    .byte $00                               ; [91]:
    .byte $00                               ; [92]:
    .byte $00                               ; [93]:
    .byte $00                               ; [94]:
    .byte $00                               ; [95]:
    .byte $55                               ; [96]:
    .byte $55                               ; [97]:
    .byte $aa                               ; [98]:
    .byte $aa                               ; [99]:
    .byte $55                               ; [100]:
    .byte $55                               ; [101]:
    .byte $55                               ; [102]:
    .byte $55                               ; [103]:
    .byte $55                               ; [104]:
    .byte $55                               ; [105]:
    .byte $55                               ; [106]:
    .byte $55                               ; [107]:
    .byte $00                               ; [108]:
    .byte $55                               ; [109]:
    .byte $55                               ; [110]:
    .byte $00                               ; [111]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::9835]
;
TOWNS_BLOCK_DATA_01:                        ; [$98ad]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $80                               ; [2]:
    .byte $83                               ; [3]:
    .byte $90                               ; [4]:
    .byte $bd                               ; [5]:
    .byte $8b                               ; [6]:
    .byte $bf                               ; [7]:
    .byte $82                               ; [8]:
    .byte $a7                               ; [9]:
    .byte $80                               ; [10]:
    .byte $82                               ; [11]:
    .byte $85                               ; [12]:
    .byte $91                               ; [13]:
    .byte $a2                               ; [14]:
    .byte $e6                               ; [15]:
    .byte $8e                               ; [16]:
    .byte $8a                               ; [17]:
    .byte $9c                               ; [18]:
    .byte $9c                               ; [19]:
    .byte $8f                               ; [20]:
    .byte $b9                               ; [21]:
    .byte $8e                               ; [22]:
    .byte $9c                               ; [23]:
    .byte $89                               ; [24]:
    .byte $e8                               ; [25]:
    .byte $e8                               ; [26]:
    .byte $ac                               ; [27]:
    .byte $de                               ; [28]:
    .byte $b0                               ; [29]:
    .byte $aa                               ; [30]:
    .byte $d1                               ; [31]:
    .byte $a8                               ; [32]:
    .byte $d2                               ; [33]:
    .byte $85                               ; [34]:
    .byte $84                               ; [35]:
    .byte $90                               ; [36]:
    .byte $8e                               ; [37]:
    .byte $e8                               ; [38]:
    .byte $a9                               ; [39]:
    .byte $82                               ; [40]:
    .byte $00                               ; [41]:
    .byte $d1                               ; [42]:
    .byte $83                               ; [43]:
    .byte $b9                               ; [44]:
    .byte $8f                               ; [45]:
    .byte $9c                               ; [46]:
    .byte $ba                               ; [47]:
    .byte $86                               ; [48]:
    .byte $83                               ; [49]:
    .byte $83                               ; [50]:
    .byte $c5                               ; [51]:
    .byte $84                               ; [52]:
    .byte $c0                               ; [53]:
    .byte $85                               ; [54]:
    .byte $ba                               ; [55]:
    .byte $ba                               ; [56]:
    .byte $83                               ; [57]:
    .byte $ae                               ; [58]:
    .byte $b0                               ; [59]:
    .byte $aa                               ; [60]:
    .byte $9c                               ; [61]:
    .byte $e8                               ; [62]:
    .byte $9f                               ; [63]:
    .byte $9f                               ; [64]:
    .byte $a6                               ; [65]:
    .byte $e7                               ; [66]:
    .byte $e8                               ; [67]:
    .byte $9f                               ; [68]:
    .byte $a7                               ; [69]:
    .byte $a7                               ; [70]:
    .byte $81                               ; [71]:
    .byte $00                               ; [72]:
    .byte $c7                               ; [73]:
    .byte $e2                               ; [74]:
    .byte $85                               ; [75]:
    .byte $a7                               ; [76]:
    .byte $a8                               ; [77]:
    .byte $83                               ; [78]:
    .byte $b9                               ; [79]:
    .byte $8e                               ; [80]:
    .byte $80                               ; [81]:
    .byte $dd                               ; [82]:
    .byte $e4                               ; [83]:
    .byte $de                               ; [84]:
    .byte $cb                               ; [85]:
    .byte $ee                               ; [86]:
    .byte $d9                               ; [87]:
    .byte $d9                               ; [88]:
    .byte $83                               ; [89]:
    .byte $ea                               ; [90]:
    .byte $f2                               ; [91]:
    .byte $f6                               ; [92]:
    .byte $83                               ; [93]:
    .byte $8e                               ; [94]:
    .byte $8e                               ; [95]:
    .byte $db                               ; [96]:
    .byte $82                               ; [97]:
    .byte $cf                               ; [98]:
    .byte $a8                               ; [99]:
    .byte $c9                               ; [100]:
    .byte $bc                               ; [101]:
    .byte $be                               ; [102]:
    .byte $e9                               ; [103]:
    .byte $e9                               ; [104]:
    .byte $b4                               ; [105]:
    .byte $8e                               ; [106]:
    .byte $cf                               ; [107]:
    .byte $e0                               ; [108]:
    .byte $c7                               ; [109]:
    .byte $8b                               ; [110]:
    .byte $a8                               ; [111]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::9837]
;
TOWNS_BLOCK_DATA_02:                        ; [$991d]
    .byte $00                               ; [0]:
    .byte $81                               ; [1]:
    .byte $81                               ; [2]:
    .byte $84                               ; [3]:
    .byte $bc                               ; [4]:
    .byte $be                               ; [5]:
    .byte $8c                               ; [6]:
    .byte $8b                               ; [7]:
    .byte $8b                               ; [8]:
    .byte $00                               ; [9]:
    .byte $81                               ; [10]:
    .byte $82                               ; [11]:
    .byte $86                               ; [12]:
    .byte $92                               ; [13]:
    .byte $a3                               ; [14]:
    .byte $e7                               ; [15]:
    .byte $89                               ; [16]:
    .byte $8e                               ; [17]:
    .byte $9c                               ; [18]:
    .byte $9c                               ; [19]:
    .byte $9c                               ; [20]:
    .byte $ba                               ; [21]:
    .byte $a6                               ; [22]:
    .byte $96                               ; [23]:
    .byte $8a                               ; [24]:
    .byte $9d                               ; [25]:
    .byte $8d                               ; [26]:
    .byte $ad                               ; [27]:
    .byte $df                               ; [28]:
    .byte $b1                               ; [29]:
    .byte $86                               ; [30]:
    .byte $90                               ; [31]:
    .byte $d1                               ; [32]:
    .byte $a8                               ; [33]:
    .byte $d2                               ; [34]:
    .byte $84                               ; [35]:
    .byte $84                               ; [36]:
    .byte $8e                               ; [37]:
    .byte $e8                               ; [38]:
    .byte $82                               ; [39]:
    .byte $82                               ; [40]:
    .byte $00                               ; [41]:
    .byte $d2                               ; [42]:
    .byte $83                               ; [43]:
    .byte $b9                               ; [44]:
    .byte $9c                               ; [45]:
    .byte $9c                               ; [46]:
    .byte $ba                               ; [47]:
    .byte $85                               ; [48]:
    .byte $bb                               ; [49]:
    .byte $84                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $85                               ; [52]:
    .byte $85                               ; [53]:
    .byte $86                               ; [54]:
    .byte $ba                               ; [55]:
    .byte $ba                               ; [56]:
    .byte $d9                               ; [57]:
    .byte $af                               ; [58]:
    .byte $b1                               ; [59]:
    .byte $86                               ; [60]:
    .byte $96                               ; [61]:
    .byte $83                               ; [62]:
    .byte $e6                               ; [63]:
    .byte $8a                               ; [64]:
    .byte $a7                               ; [65]:
    .byte $8a                               ; [66]:
    .byte $e8                               ; [67]:
    .byte $8a                               ; [68]:
    .byte $a7                               ; [69]:
    .byte $80                               ; [70]:
    .byte $a7                               ; [71]:
    .byte $9f                               ; [72]:
    .byte $c8                               ; [73]:
    .byte $e3                               ; [74]:
    .byte $86                               ; [75]:
    .byte $a7                               ; [76]:
    .byte $a8                               ; [77]:
    .byte $84                               ; [78]:
    .byte $ba                               ; [79]:
    .byte $8e                               ; [80]:
    .byte $81                               ; [81]:
    .byte $dd                               ; [82]:
    .byte $e5                               ; [83]:
    .byte $df                               ; [84]:
    .byte $cc                               ; [85]:
    .byte $ef                               ; [86]:
    .byte $86                               ; [87]:
    .byte $86                               ; [88]:
    .byte $d9                               ; [89]:
    .byte $eb                               ; [90]:
    .byte $f3                               ; [91]:
    .byte $f7                               ; [92]:
    .byte $8e                               ; [93]:
    .byte $86                               ; [94]:
    .byte $8e                               ; [95]:
    .byte $82                               ; [96]:
    .byte $db                               ; [97]:
    .byte $ca                               ; [98]:
    .byte $a8                               ; [99]:
    .byte $ca                               ; [100]:
    .byte $bd                               ; [101]:
    .byte $bf                               ; [102]:
    .byte $e9                               ; [103]:
    .byte $b4                               ; [104]:
    .byte $e9                               ; [105]:
    .byte $8e                               ; [106]:
    .byte $d0                               ; [107]:
    .byte $e1                               ; [108]:
    .byte $c8                               ; [109]:
    .byte $e8                               ; [110]:
    .byte $a8                               ; [111]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::9839]
;
TOWNS_BLOCK_DATA_03:                        ; [$998d]
    .byte $00                               ; [0]:
    .byte $81                               ; [1]:
    .byte $87                               ; [2]:
    .byte $83                               ; [3]:
    .byte $90                               ; [4]:
    .byte $8d                               ; [5]:
    .byte $8b                               ; [6]:
    .byte $c0                               ; [7]:
    .byte $82                               ; [8]:
    .byte $00                               ; [9]:
    .byte $80                               ; [10]:
    .byte $82                               ; [11]:
    .byte $85                               ; [12]:
    .byte $93                               ; [13]:
    .byte $a4                               ; [14]:
    .byte $a0                               ; [15]:
    .byte $89                               ; [16]:
    .byte $e7                               ; [17]:
    .byte $89                               ; [18]:
    .byte $9c                               ; [19]:
    .byte $8f                               ; [20]:
    .byte $83                               ; [21]:
    .byte $85                               ; [22]:
    .byte $9c                               ; [23]:
    .byte $b2                               ; [24]:
    .byte $9d                               ; [25]:
    .byte $9d                               ; [26]:
    .byte $ac                               ; [27]:
    .byte $b0                               ; [28]:
    .byte $b0                               ; [29]:
    .byte $a9                               ; [30]:
    .byte $d3                               ; [31]:
    .byte $a8                               ; [32]:
    .byte $d4                               ; [33]:
    .byte $85                               ; [34]:
    .byte $84                               ; [35]:
    .byte $84                               ; [36]:
    .byte $85                               ; [37]:
    .byte $a9                               ; [38]:
    .byte $a9                               ; [39]:
    .byte $82                               ; [40]:
    .byte $82                               ; [41]:
    .byte $d3                               ; [42]:
    .byte $83                               ; [43]:
    .byte $83                               ; [44]:
    .byte $8f                               ; [45]:
    .byte $9c                               ; [46]:
    .byte $83                               ; [47]:
    .byte $86                               ; [48]:
    .byte $c7                               ; [49]:
    .byte $83                               ; [50]:
    .byte $b7                               ; [51]:
    .byte $bf                               ; [52]:
    .byte $86                               ; [53]:
    .byte $85                               ; [54]:
    .byte $c3                               ; [55]:
    .byte $b4                               ; [56]:
    .byte $83                               ; [57]:
    .byte $b0                               ; [58]:
    .byte $b0                               ; [59]:
    .byte $85                               ; [60]:
    .byte $9c                               ; [61]:
    .byte $e8                               ; [62]:
    .byte $e6                               ; [63]:
    .byte $e6                               ; [64]:
    .byte $8a                               ; [65]:
    .byte $e6                               ; [66]:
    .byte $85                               ; [67]:
    .byte $b2                               ; [68]:
    .byte $a7                               ; [69]:
    .byte $a7                               ; [70]:
    .byte $85                               ; [71]:
    .byte $9f                               ; [72]:
    .byte $e2                               ; [73]:
    .byte $e2                               ; [74]:
    .byte $85                               ; [75]:
    .byte $a7                               ; [76]:
    .byte $a7                               ; [77]:
    .byte $83                               ; [78]:
    .byte $83                               ; [79]:
    .byte $82                               ; [80]:
    .byte $87                               ; [81]:
    .byte $dd                               ; [82]:
    .byte $e4                               ; [83]:
    .byte $e4                               ; [84]:
    .byte $cd                               ; [85]:
    .byte $f0                               ; [86]:
    .byte $da                               ; [87]:
    .byte $d9                               ; [88]:
    .byte $83                               ; [89]:
    .byte $ec                               ; [90]:
    .byte $f4                               ; [91]:
    .byte $b5                               ; [92]:
    .byte $83                               ; [93]:
    .byte $d8                               ; [94]:
    .byte $d7                               ; [95]:
    .byte $dc                               ; [96]:
    .byte $82                               ; [97]:
    .byte $cf                               ; [98]:
    .byte $80                               ; [99]:
    .byte $cf                               ; [100]:
    .byte $bb                               ; [101]:
    .byte $00                               ; [102]:
    .byte $e9                               ; [103]:
    .byte $e9                               ; [104]:
    .byte $e9                               ; [105]:
    .byte $e9                               ; [106]:
    .byte $cf                               ; [107]:
    .byte $e2                               ; [108]:
    .byte $e2                               ; [109]:
    .byte $8b                               ; [110]:
    .byte $a8                               ; [111]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::983b]
;
TOWNS_BLOCK_DATA_04:                        ; [$99fd]
    .byte $00                               ; [0]:
    .byte $80                               ; [1]:
    .byte $87                               ; [2]:
    .byte $84                               ; [3]:
    .byte $bb                               ; [4]:
    .byte $82                               ; [5]:
    .byte $8c                               ; [6]:
    .byte $8b                               ; [7]:
    .byte $8b                               ; [8]:
    .byte $a7                               ; [9]:
    .byte $81                               ; [10]:
    .byte $82                               ; [11]:
    .byte $86                               ; [12]:
    .byte $94                               ; [13]:
    .byte $a5                               ; [14]:
    .byte $a1                               ; [15]:
    .byte $e6                               ; [16]:
    .byte $8a                               ; [17]:
    .byte $8a                               ; [18]:
    .byte $9c                               ; [19]:
    .byte $9c                               ; [20]:
    .byte $84                               ; [21]:
    .byte $86                               ; [22]:
    .byte $96                               ; [23]:
    .byte $b3                               ; [24]:
    .byte $9c                               ; [25]:
    .byte $96                               ; [26]:
    .byte $ad                               ; [27]:
    .byte $b1                               ; [28]:
    .byte $b1                               ; [29]:
    .byte $86                               ; [30]:
    .byte $83                               ; [31]:
    .byte $d3                               ; [32]:
    .byte $a7                               ; [33]:
    .byte $d4                               ; [34]:
    .byte $84                               ; [35]:
    .byte $84                               ; [36]:
    .byte $85                               ; [37]:
    .byte $82                               ; [38]:
    .byte $82                               ; [39]:
    .byte $82                               ; [40]:
    .byte $82                               ; [41]:
    .byte $d4                               ; [42]:
    .byte $83                               ; [43]:
    .byte $83                               ; [44]:
    .byte $9c                               ; [45]:
    .byte $9c                               ; [46]:
    .byte $b4                               ; [47]:
    .byte $85                               ; [48]:
    .byte $8d                               ; [49]:
    .byte $b6                               ; [50]:
    .byte $be                               ; [51]:
    .byte $85                               ; [52]:
    .byte $c8                               ; [53]:
    .byte $86                               ; [54]:
    .byte $c4                               ; [55]:
    .byte $85                               ; [56]:
    .byte $da                               ; [57]:
    .byte $b1                               ; [58]:
    .byte $b1                               ; [59]:
    .byte $86                               ; [60]:
    .byte $96                               ; [61]:
    .byte $89                               ; [62]:
    .byte $e7                               ; [63]:
    .byte $e7                               ; [64]:
    .byte $a7                               ; [65]:
    .byte $e7                               ; [66]:
    .byte $86                               ; [67]:
    .byte $b3                               ; [68]:
    .byte $9f                               ; [69]:
    .byte $83                               ; [70]:
    .byte $a7                               ; [71]:
    .byte $e6                               ; [72]:
    .byte $00                               ; [73]:
    .byte $e3                               ; [74]:
    .byte $86                               ; [75]:
    .byte $a7                               ; [76]:
    .byte $a8                               ; [77]:
    .byte $84                               ; [78]:
    .byte $84                               ; [79]:
    .byte $82                               ; [80]:
    .byte $87                               ; [81]:
    .byte $dd                               ; [82]:
    .byte $e5                               ; [83]:
    .byte $e5                               ; [84]:
    .byte $ce                               ; [85]:
    .byte $f1                               ; [86]:
    .byte $86                               ; [87]:
    .byte $86                               ; [88]:
    .byte $d9                               ; [89]:
    .byte $ed                               ; [90]:
    .byte $f5                               ; [91]:
    .byte $d5                               ; [92]:
    .byte $d6                               ; [93]:
    .byte $86                               ; [94]:
    .byte $d7                               ; [95]:
    .byte $82                               ; [96]:
    .byte $dc                               ; [97]:
    .byte $ca                               ; [98]:
    .byte $81                               ; [99]:
    .byte $d0                               ; [100]:
    .byte $00                               ; [101]:
    .byte $c0                               ; [102]:
    .byte $e9                               ; [103]:
    .byte $e9                               ; [104]:
    .byte $e9                               ; [105]:
    .byte $e9                               ; [106]:
    .byte $d0                               ; [107]:
    .byte $e3                               ; [108]:
    .byte $00                               ; [109]:
    .byte $e8                               ; [110]:
    .byte $a8                               ; [111]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::982b]
;
TOWNS_BLOCK_PROPERTIES:                     ; [$9a6d]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_IS_AIR                      ; [1]:
    .byte BLOCK_IS_SOLID                    ; [2]:
    .byte BLOCK_IS_AIR                      ; [3]:
    .byte BLOCK_IS_AIR                      ; [4]:
    .byte BLOCK_IS_AIR                      ; [5]:
    .byte BLOCK_IS_AIR                      ; [6]:
    .byte BLOCK_IS_AIR                      ; [7]:
    .byte BLOCK_IS_AIR                      ; [8]:
    .byte BLOCK_IS_AIR                      ; [9]:
    .byte BLOCK_IS_AIR                      ; [10]:
    .byte BLOCK_IS_AIR                      ; [11]:
    .byte BLOCK_IS_AIR                      ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_IS_AIR                      ; [14]:
    .byte BLOCK_IS_AIR                      ; [15]:
    .byte BLOCK_IS_AIR                      ; [16]:
    .byte BLOCK_IS_AIR                      ; [17]:
    .byte BLOCK_IS_AIR                      ; [18]:
    .byte BLOCK_IS_AIR                      ; [19]:
    .byte BLOCK_IS_AIR                      ; [20]:
    .byte BLOCK_IS_AIR                      ; [21]:
    .byte BLOCK_IS_AIR                      ; [22]:
    .byte BLOCK_IS_AIR                      ; [23]:
    .byte BLOCK_IS_AIR                      ; [24]:
    .byte BLOCK_IS_AIR                      ; [25]:
    .byte BLOCK_IS_AIR                      ; [26]:
    .byte BLOCK_IS_AIR                      ; [27]:
    .byte BLOCK_IS_DOOR                     ; [28]:
    .byte BLOCK_IS_DOOR                     ; [29]:
    .byte BLOCK_IS_AIR                      ; [30]:
    .byte BLOCK_IS_AIR                      ; [31]:
    .byte BLOCK_IS_AIR                      ; [32]:
    .byte BLOCK_IS_AIR                      ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_IS_AIR                      ; [35]:
    .byte BLOCK_IS_AIR                      ; [36]:
    .byte BLOCK_IS_AIR                      ; [37]:
    .byte BLOCK_IS_AIR                      ; [38]:
    .byte BLOCK_IS_AIR                      ; [39]:
    .byte BLOCK_IS_AIR                      ; [40]:
    .byte BLOCK_IS_AIR                      ; [41]:
    .byte BLOCK_IS_AIR                      ; [42]:
    .byte BLOCK_IS_AIR                      ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_IS_AIR                      ; [46]:
    .byte BLOCK_IS_AIR                      ; [47]:
    .byte BLOCK_IS_AIR                      ; [48]:
    .byte BLOCK_IS_AIR                      ; [49]:
    .byte BLOCK_IS_AIR                      ; [50]:
    .byte BLOCK_IS_AIR                      ; [51]:
    .byte BLOCK_IS_AIR                      ; [52]:
    .byte BLOCK_IS_AIR                      ; [53]:
    .byte BLOCK_IS_AIR                      ; [54]:
    .byte BLOCK_IS_AIR                      ; [55]:
    .byte BLOCK_IS_AIR                      ; [56]:
    .byte BLOCK_IS_AIR                      ; [57]:
    .byte BLOCK_IS_DOOR                     ; [58]:
    .byte BLOCK_IS_DOOR                     ; [59]:
    .byte BLOCK_IS_AIR                      ; [60]:
    .byte BLOCK_IS_AIR                      ; [61]:
    .byte BLOCK_IS_AIR                      ; [62]:
    .byte BLOCK_IS_AIR                      ; [63]:
    .byte BLOCK_IS_AIR                      ; [64]:
    .byte BLOCK_IS_AIR                      ; [65]:
    .byte BLOCK_IS_AIR                      ; [66]:
    .byte BLOCK_IS_AIR                      ; [67]:
    .byte BLOCK_IS_AIR                      ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_AIR                      ; [70]:
    .byte BLOCK_IS_AIR                      ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_DOOR                     ; [73]:
    .byte BLOCK_IS_DOOR                     ; [74]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [75]:
    .byte BLOCK_AREA_TRANSITION_RIGHT       ; [76]:
    .byte BLOCK_IS_AIR                      ; [77]:
    .byte BLOCK_IS_AIR                      ; [78]:
    .byte BLOCK_IS_AIR                      ; [79]:
    .byte BLOCK_IS_AIR                      ; [80]:
    .byte BLOCK_IS_SOLID                    ; [81]:
    .byte BLOCK_IS_AIR                      ; [82]:
    .byte BLOCK_IS_DOOR                     ; [83]:
    .byte BLOCK_IS_DOOR                     ; [84]:
    .byte BLOCK_IS_AIR                      ; [85]:
    .byte BLOCK_IS_AIR                      ; [86]:
    .byte BLOCK_IS_AIR                      ; [87]:
    .byte BLOCK_IS_AIR                      ; [88]:
    .byte BLOCK_IS_AIR                      ; [89]:
    .byte BLOCK_IS_AIR                      ; [90]:
    .byte BLOCK_IS_AIR                      ; [91]:
    .byte BLOCK_IS_AIR                      ; [92]:
    .byte BLOCK_IS_AIR                      ; [93]:
    .byte BLOCK_IS_AIR                      ; [94]:
    .byte BLOCK_IS_AIR                      ; [95]:
    .byte BLOCK_IS_AIR                      ; [96]:
    .byte BLOCK_IS_AIR                      ; [97]:
    .byte BLOCK_IS_AIR                      ; [98]:
    .byte BLOCK_IS_AIR                      ; [99]:
    .byte BLOCK_IS_AIR                      ; [100]:
    .byte BLOCK_IS_AIR                      ; [101]:
    .byte BLOCK_IS_AIR                      ; [102]:
    .byte BLOCK_IS_AIR                      ; [103]:
    .byte BLOCK_IS_AIR                      ; [104]:
    .byte BLOCK_IS_AIR                      ; [105]:
    .byte BLOCK_IS_AIR                      ; [106]:
    .byte BLOCK_IS_AIR                      ; [107]:
    .byte BLOCK_IS_DOOR                     ; [108]:
    .byte BLOCK_IS_AIR                      ; [109]:
    .byte BLOCK_IS_AIR                      ; [110]:
    .byte BLOCK_IS_AIR                      ; [111]:
    .byte BLOCK_IS_AIR                      ; [112]:
    .byte BLOCK_IS_AIR                      ; [113]:
    .byte BLOCK_IS_AIR                      ; [114]:
    .byte BLOCK_IS_AIR                      ; [115]:
    .byte BLOCK_IS_AIR                      ; [116]:
    .byte BLOCK_IS_AIR                      ; [117]:
    .byte BLOCK_IS_AIR                      ; [118]:
    .byte BLOCK_IS_AIR                      ; [119]:
    .byte BLOCK_IS_AIR                      ; [120]:
    .byte BLOCK_IS_AIR                      ; [121]:
    .byte BLOCK_IS_AIR                      ; [122]:
    .byte BLOCK_IS_AIR                      ; [123]:
    .byte BLOCK_IS_AIR                      ; [124]:
    .byte BLOCK_IS_AIR                      ; [125]:
    .byte BLOCK_IS_AIR                      ; [126]:
    .byte BLOCK_IS_AIR                      ; [127]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::982d]
;
TOWNS_SCROLL_DATA:                          ; [$9aed]
    .byte $ff                               ; [0]:
    .byte $01                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $00                               ; [4]:
    .byte $ff                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $ff                               ; [8]:
    .byte $03                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $02                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $ff                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $ff                               ; [16]:
    .byte $05                               ; [17]:
    .byte $ff                               ; [18]:
    .byte $ff                               ; [19]:
    .byte $04                               ; [20]:
    .byte $ff                               ; [21]:
    .byte $ff                               ; [22]:
    .byte $ff                               ; [23]:
    .byte $ff                               ; [24]:
    .byte $07                               ; [25]:
    .byte $ff                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $06                               ; [28]:
    .byte $ff                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $09                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $ff                               ; [35]:
    .byte $08                               ; [36]:
    .byte $ff                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $ff                               ; [39]:
    .byte $ff                               ; [40]:
    .byte $0b                               ; [41]:
    .byte $ff                               ; [42]:
    .byte $ff                               ; [43]:
    .byte $0a                               ; [44]:
    .byte $ff                               ; [45]:
    .byte $ff                               ; [46]:
    .byte $ff                               ; [47]:
    .byte $ff                               ; [48]:
    .byte $0d                               ; [49]:
    .byte $ff                               ; [50]:
    .byte $ff                               ; [51]:
    .byte $0c                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $ff                               ; [54]:
    .byte $ff                               ; [55]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::982f]
;
TOWNS_DOOR_LOCATIONS:                       ; [$9b25]
    .byte $00                               ; [0]:
    .byte $94                               ; [1]:
    .byte $20                               ; [2]:
    .byte $00                               ; [3]:
    .byte $00                               ; [4]:
    .byte $98                               ; [5]:
    .byte $21                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $9d                               ; [9]:
    .byte $22                               ; [10]:
    .byte $00                               ; [11]:
    .byte $01                               ; [12]:
    .byte $95                               ; [13]:
    .byte $23                               ; [14]:
    .byte $00                               ; [15]:
    .byte $01                               ; [16]:
    .byte $9a                               ; [17]:
    .byte $24                               ; [18]:
    .byte $00                               ; [19]:
    .byte $01                               ; [20]:
    .byte $9e                               ; [21]:
    .byte $25                               ; [22]:
    .byte $00                               ; [23]:
    .byte $02                               ; [24]:
    .byte $99                               ; [25]:
    .byte $26                               ; [26]:
    .byte $00                               ; [27]:
    .byte $02                               ; [28]:
    .byte $9d                               ; [29]:
    .byte $27                               ; [30]:
    .byte $00                               ; [31]:
    .byte $03                               ; [32]:
    .byte $93                               ; [33]:
    .byte $28                               ; [34]:
    .byte $00                               ; [35]:
    .byte $03                               ; [36]:
    .byte $98                               ; [37]:
    .byte $29                               ; [38]:
    .byte $00                               ; [39]:
    .byte $03                               ; [40]:
    .byte $9b                               ; [41]:
    .byte $2a                               ; [42]:
    .byte $00                               ; [43]:
    .byte $03                               ; [44]:
    .byte $9e                               ; [45]:
    .byte $2b                               ; [46]:
    .byte $00                               ; [47]:
    .byte $04                               ; [48]:
    .byte $93                               ; [49]:
    .byte $2c                               ; [50]:
    .byte $00                               ; [51]:
    .byte $04                               ; [52]:
    .byte $9b                               ; [53]:
    .byte $2d                               ; [54]:
    .byte $00                               ; [55]:
    .byte $04                               ; [56]:
    .byte $9e                               ; [57]:
    .byte $2e                               ; [58]:
    .byte $00                               ; [59]:
    .byte $05                               ; [60]:
    .byte $91                               ; [61]:
    .byte $2f                               ; [62]:
    .byte $00                               ; [63]:
    .byte $05                               ; [64]:
    .byte $94                               ; [65]:
    .byte $30                               ; [66]:
    .byte $00                               ; [67]:
    .byte $05                               ; [68]:
    .byte $9a                               ; [69]:
    .byte $31                               ; [70]:
    .byte $00                               ; [71]:
    .byte $06                               ; [72]:
    .byte $93                               ; [73]:
    .byte $32                               ; [74]:
    .byte $00                               ; [75]:
    .byte $06                               ; [76]:
    .byte $9a                               ; [77]:
    .byte $33                               ; [78]:
    .byte $00                               ; [79]:
    .byte $06                               ; [80]:
    .byte $9e                               ; [81]:
    .byte $34                               ; [82]:
    .byte $00                               ; [83]:
    .byte $07                               ; [84]:
    .byte $91                               ; [85]:
    .byte $35                               ; [86]:
    .byte $00                               ; [87]:
    .byte $07                               ; [88]:
    .byte $94                               ; [89]:
    .byte $36                               ; [90]:
    .byte $00                               ; [91]:
    .byte $07                               ; [92]:
    .byte $9d                               ; [93]:
    .byte $37                               ; [94]:
    .byte $00                               ; [95]:
    .byte $07                               ; [96]:
    .byte $97                               ; [97]:
    .byte $4a                               ; [98]:
    .byte $00                               ; [99]:
    .byte $08                               ; [100]:
    .byte $92                               ; [101]:
    .byte $38                               ; [102]:
    .byte $00                               ; [103]:
    .byte $08                               ; [104]:
    .byte $95                               ; [105]:
    .byte $39                               ; [106]:
    .byte $00                               ; [107]:
    .byte $08                               ; [108]:
    .byte $99                               ; [109]:
    .byte $3a                               ; [110]:
    .byte $00                               ; [111]:
    .byte $08                               ; [112]:
    .byte $9e                               ; [113]:
    .byte $3b                               ; [114]:
    .byte $00                               ; [115]:
    .byte $09                               ; [116]:
    .byte $99                               ; [117]:
    .byte $3c                               ; [118]:
    .byte $00                               ; [119]:
    .byte $09                               ; [120]:
    .byte $9d                               ; [121]:
    .byte $3d                               ; [122]:
    .byte $00                               ; [123]:
    .byte $0a                               ; [124]:
    .byte $93                               ; [125]:
    .byte $3e                               ; [126]:
    .byte $00                               ; [127]:
    .byte $0a                               ; [128]:
    .byte $96                               ; [129]:
    .byte $3f                               ; [130]:
    .byte $00                               ; [131]:
    .byte $0a                               ; [132]:
    .byte $99                               ; [133]:
    .byte $40                               ; [134]:
    .byte $00                               ; [135]:
    .byte $0a                               ; [136]:
    .byte $9d                               ; [137]:
    .byte $41                               ; [138]:
    .byte $00                               ; [139]:
    .byte $0b                               ; [140]:
    .byte $96                               ; [141]:
    .byte $42                               ; [142]:
    .byte $00                               ; [143]:
    .byte $0b                               ; [144]:
    .byte $9d                               ; [145]:
    .byte $43                               ; [146]:
    .byte $00                               ; [147]:
    .byte $0c                               ; [148]:
    .byte $93                               ; [149]:
    .byte $44                               ; [150]:
    .byte $00                               ; [151]:
    .byte $0c                               ; [152]:
    .byte $99                               ; [153]:
    .byte $45                               ; [154]:
    .byte $00                               ; [155]:
    .byte $0c                               ; [156]:
    .byte $9d                               ; [157]:
    .byte $46                               ; [158]:
    .byte $00                               ; [159]:
    .byte $0d                               ; [160]:
    .byte $93                               ; [161]:
    .byte $47                               ; [162]:
    .byte $00                               ; [163]:
    .byte $0d                               ; [164]:
    .byte $99                               ; [165]:
    .byte $48                               ; [166]:
    .byte $00                               ; [167]:
    .byte $0d                               ; [168]:
    .byte $9d                               ; [169]:
    .byte $49                               ; [170]:
    .byte $00                               ; [171]:
    .byte $ff                               ; [172]:

;
; XREFS:
;     TOWNS_AREA_DATA [$PRG3::9831]
;
TOWNS_DOOR_DESTINATIONS:                    ; [$9bd2]
    .byte $08                               ; [0]:
    .byte $04                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $09                               ; [4]:
    .byte $05                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $0a                               ; [8]:
    .byte $03                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $0b                               ; [12]:
    .byte $01                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $0c                               ; [16]:
    .byte $02                               ; [17]:
    .byte $00                               ; [18]:
    .byte $00                               ; [19]:
    .byte $0d                               ; [20]:
    .byte $06                               ; [21]:
    .byte $00                               ; [22]:
    .byte $00                               ; [23]:
    .byte $0e                               ; [24]:
    .byte $07                               ; [25]:
    .byte $00                               ; [26]:
    .byte $00                               ; [27]:
    .byte $0f                               ; [28]:
    .byte $04                               ; [29]:
    .byte $00                               ; [30]:
    .byte $00                               ; [31]:
    .byte $10                               ; [32]:
    .byte $01                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $11                               ; [36]:
    .byte $02                               ; [37]:
    .byte $00                               ; [38]:
    .byte $00                               ; [39]:
    .byte $12                               ; [40]:
    .byte $06                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $13                               ; [44]:
    .byte $05                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $16                               ; [48]:
    .byte $03                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $17                               ; [52]:
    .byte $07                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $18                               ; [56]:
    .byte $04                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $19                               ; [60]:
    .byte $05                               ; [61]:
    .byte $00                               ; [62]:
    .byte $00                               ; [63]:
    .byte $1a                               ; [64]:
    .byte $06                               ; [65]:
    .byte $00                               ; [66]:
    .byte $00                               ; [67]:
    .byte $1b                               ; [68]:
    .byte $02                               ; [69]:
    .byte $00                               ; [70]:
    .byte $00                               ; [71]:
    .byte $23                               ; [72]:
    .byte $01                               ; [73]:
    .byte $00                               ; [74]:
    .byte $00                               ; [75]:
    .byte $24                               ; [76]:
    .byte $02                               ; [77]:
    .byte $00                               ; [78]:
    .byte $00                               ; [79]:
    .byte $25                               ; [80]:
    .byte $06                               ; [81]:
    .byte $00                               ; [82]:
    .byte $00                               ; [83]:
    .byte $26                               ; [84]:
    .byte $07                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $27                               ; [88]:
    .byte $05                               ; [89]:
    .byte $00                               ; [90]:
    .byte $00                               ; [91]:
    .byte $28                               ; [92]:
    .byte $03                               ; [93]:
    .byte $00                               ; [94]:
    .byte $00                               ; [95]:
    .byte $29                               ; [96]:
    .byte $06                               ; [97]:
    .byte $00                               ; [98]:
    .byte $00                               ; [99]:
    .byte $2a                               ; [100]:
    .byte $07                               ; [101]:
    .byte $00                               ; [102]:
    .byte $00                               ; [103]:
    .byte $2b                               ; [104]:
    .byte $01                               ; [105]:
    .byte $00                               ; [106]:
    .byte $00                               ; [107]:
    .byte $2c                               ; [108]:
    .byte $02                               ; [109]:
    .byte $00                               ; [110]:
    .byte $00                               ; [111]:
    .byte $2d                               ; [112]:
    .byte $04                               ; [113]:
    .byte $00                               ; [114]:
    .byte $00                               ; [115]:
    .byte $2e                               ; [116]:
    .byte $03                               ; [117]:
    .byte $00                               ; [118]:
    .byte $00                               ; [119]:
    .byte $2f                               ; [120]:
    .byte $05                               ; [121]:
    .byte $00                               ; [122]:
    .byte $00                               ; [123]:
    .byte $30                               ; [124]:
    .byte $04                               ; [125]:
    .byte $00                               ; [126]:
    .byte $00                               ; [127]:
    .byte $31                               ; [128]:
    .byte $07                               ; [129]:
    .byte $00                               ; [130]:
    .byte $00                               ; [131]:
    .byte $32                               ; [132]:
    .byte $03                               ; [133]:
    .byte $00                               ; [134]:
    .byte $00                               ; [135]:
    .byte $33                               ; [136]:
    .byte $01                               ; [137]:
    .byte $00                               ; [138]:
    .byte $00                               ; [139]:
    .byte $34                               ; [140]:
    .byte $06                               ; [141]:
    .byte $00                               ; [142]:
    .byte $00                               ; [143]:
    .byte $3c                               ; [144]:
    .byte $01                               ; [145]:
    .byte $00                               ; [146]:
    .byte $00                               ; [147]:
    .byte $3d                               ; [148]:
    .byte $03                               ; [149]:
    .byte $00                               ; [150]:
    .byte $00                               ; [151]:
    .byte $3e                               ; [152]:
    .byte $07                               ; [153]:
    .byte $00                               ; [154]:
    .byte $00                               ; [155]:
    .byte $3f                               ; [156]:
    .byte $02                               ; [157]:
    .byte $00                               ; [158]:
    .byte $00                               ; [159]:
    .byte $40                               ; [160]:
    .byte $05                               ; [161]:
    .byte $00                               ; [162]:
    .byte $00                               ; [163]:
    .byte $41                               ; [164]:
    .byte $04                               ; [165]:
    .byte $00                               ; [166]:
    .byte $00                               ; [167]:
    .byte $45                               ; [168]:
    .byte $04                               ; [169]:
    .byte $00                               ; [170]:
    .byte $00                               ; [171]:


;============================================================================
; Table of relative pointers from 0x8000 for Dartmoor.
;
; 64 doors
; 99 tiles
;============================================================================
DARTMOOR_AREA_DATA:                         ; [$9c7e]
    .word (DARTMOOR_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; DARTMOOR_AREA_DATA.blockAttrsRelPtr
                                                              ; [$PRG3::9c7e]
    .word (DARTMOOR_BLOCK_PROPERTIES-$8000) & $FFFF ; DARTMOOR_BLOCK_PROPERTIES
                                                    ; [$PRG3::9c80]
    .word (DARTMOOR_SCROLL_DATA-$8000) & $FFFF ; DARTMOOR_SCROLL_DATA
                                               ; [$PRG3::9c82]
    .word (DARTMOOR_DOOR_LOCATIONS-$8000) & $FFFF ; DARTMOOR_DOOR_LOCATIONS
                                                  ; [$PRG3::9c84]
    .word (DARTMOOR_DOOR_DESTINATIONS-$8000) & $FFFF ; DARTMOOR_DOOR_DESTINATIONS
                                                     ; [$PRG3::9c86]

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c7e]
;
DARTMOOR_AREA_DATA_blockAttrsRelPtr:        ; [$9c88]
    .word (DARTMOOR_BLOCK_ATTRIBUTES-$8000) & $FFFF ; DARTMOOR_BLOCK_ATTRIBUTES
                                                    ; [$PRG3::9c88]
    .word (DARTMOOR_BLOCK_DATA_01-$8000) & $FFFF ; DARTMOOR_BLOCK_DATA_01
                                                 ; [$PRG3::9c8a]
    .word (DARTMOOR_BLOCK_DATA_02-$8000) & $FFFF ; DARTMOOR_BLOCK_DATA_02
                                                 ; [$PRG3::9c8c]
    .word (DARTMOOR_BLOCK_DATA_03-$8000) & $FFFF ; DARTMOOR_BLOCK_DATA_03
                                                 ; [$PRG3::9c8e]
    .word (DARTMOOR_BLOCK_DATA_04-$8000) & $FFFF ; DARTMOOR_BLOCK_DATA_04
                                                 ; [$PRG3::9c90]

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c88]
;
DARTMOOR_BLOCK_ATTRIBUTES:                  ; [$9c92]
    .byte $00                               ; [0]:
    .byte $55                               ; [1]:
    .byte $55                               ; [2]:
    .byte $55                               ; [3]:
    .byte $55                               ; [4]:
    .byte $ff                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $ff                               ; [7]:
    .byte $ff                               ; [8]:
    .byte $ff                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $ff                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $ff                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $55                               ; [16]:
    .byte $55                               ; [17]:
    .byte $55                               ; [18]:
    .byte $aa                               ; [19]:
    .byte $55                               ; [20]:
    .byte $55                               ; [21]:
    .byte $55                               ; [22]:
    .byte $55                               ; [23]:
    .byte $ff                               ; [24]:
    .byte $ff                               ; [25]:
    .byte $ff                               ; [26]:
    .byte $55                               ; [27]:
    .byte $55                               ; [28]:
    .byte $55                               ; [29]:
    .byte $55                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $aa                               ; [33]:
    .byte $aa                               ; [34]:
    .byte $aa                               ; [35]:
    .byte $aa                               ; [36]:
    .byte $aa                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $ff                               ; [39]:
    .byte $aa                               ; [40]:
    .byte $aa                               ; [41]:
    .byte $aa                               ; [42]:
    .byte $aa                               ; [43]:
    .byte $aa                               ; [44]:
    .byte $aa                               ; [45]:
    .byte $aa                               ; [46]:
    .byte $aa                               ; [47]:
    .byte $aa                               ; [48]:
    .byte $aa                               ; [49]:
    .byte $aa                               ; [50]:
    .byte $aa                               ; [51]:
    .byte $aa                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $aa                               ; [54]:
    .byte $aa                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $ff                               ; [57]:
    .byte $ff                               ; [58]:
    .byte $ff                               ; [59]:
    .byte $ff                               ; [60]:
    .byte $aa                               ; [61]:
    .byte $aa                               ; [62]:
    .byte $aa                               ; [63]:
    .byte $aa                               ; [64]:
    .byte $aa                               ; [65]:
    .byte $aa                               ; [66]:
    .byte $ff                               ; [67]:
    .byte $ff                               ; [68]:
    .byte $ff                               ; [69]:
    .byte $ff                               ; [70]:
    .byte $ff                               ; [71]:
    .byte $ff                               ; [72]:
    .byte $ff                               ; [73]:
    .byte $ff                               ; [74]:
    .byte $ff                               ; [75]:
    .byte $ff                               ; [76]:
    .byte $aa                               ; [77]:
    .byte $aa                               ; [78]:
    .byte $aa                               ; [79]:
    .byte $aa                               ; [80]:
    .byte $aa                               ; [81]:
    .byte $aa                               ; [82]:
    .byte $aa                               ; [83]:
    .byte $55                               ; [84]:
    .byte $55                               ; [85]:
    .byte $aa                               ; [86]:
    .byte $ff                               ; [87]:
    .byte $55                               ; [88]:
    .byte $55                               ; [89]:
    .byte $55                               ; [90]:
    .byte $55                               ; [91]:
    .byte $55                               ; [92]:
    .byte $55                               ; [93]:
    .byte $55                               ; [94]:
    .byte $55                               ; [95]:
    .byte $ff                               ; [96]:
    .byte $ff                               ; [97]:
    .byte $55                               ; [98]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c8a]
;
DARTMOOR_BLOCK_DATA_01:                     ; [$9cf5]
    .byte $00                               ; [0]:
    .byte $a0                               ; [1]:
    .byte $a1                               ; [2]:
    .byte $9f                               ; [3]:
    .byte $96                               ; [4]:
    .byte $81                               ; [5]:
    .byte $82                               ; [6]:
    .byte $83                               ; [7]:
    .byte $ba                               ; [8]:
    .byte $82                               ; [9]:
    .byte $bb                               ; [10]:
    .byte $89                               ; [11]:
    .byte $aa                               ; [12]:
    .byte $ac                               ; [13]:
    .byte $b2                               ; [14]:
    .byte $b4                               ; [15]:
    .byte $a0                               ; [16]:
    .byte $a1                               ; [17]:
    .byte $a1                               ; [18]:
    .byte $da                               ; [19]:
    .byte $dd                               ; [20]:
    .byte $e2                               ; [21]:
    .byte $9f                               ; [22]:
    .byte $9f                               ; [23]:
    .byte $00                               ; [24]:
    .byte $cc                               ; [25]:
    .byte $e4                               ; [26]:
    .byte $99                               ; [27]:
    .byte $a0                               ; [28]:
    .byte $a0                               ; [29]:
    .byte $a0                               ; [30]:
    .byte $e6                               ; [31]:
    .byte $d8                               ; [32]:
    .byte $c5                               ; [33]:
    .byte $d2                               ; [34]:
    .byte $c7                               ; [35]:
    .byte $da                               ; [36]:
    .byte $dd                               ; [37]:
    .byte $bc                               ; [38]:
    .byte $d5                               ; [39]:
    .byte $ca                               ; [40]:
    .byte $d9                               ; [41]:
    .byte $d9                               ; [42]:
    .byte $c5                               ; [43]:
    .byte $c0                               ; [44]:
    .byte $87                               ; [45]:
    .byte $e7                               ; [46]:
    .byte $e9                               ; [47]:
    .byte $d8                               ; [48]:
    .byte $cd                               ; [49]:
    .byte $e4                               ; [50]:
    .byte $80                               ; [51]:
    .byte $d9                               ; [52]:
    .byte $e5                               ; [53]:
    .byte $c9                               ; [54]:
    .byte $e6                               ; [55]:
    .byte $99                               ; [56]:
    .byte $e7                               ; [57]:
    .byte $e9                               ; [58]:
    .byte $8d                               ; [59]:
    .byte $9d                               ; [60]:
    .byte $c6                               ; [61]:
    .byte $eb                               ; [62]:
    .byte $d8                               ; [63]:
    .byte $ed                               ; [64]:
    .byte $ed                               ; [65]:
    .byte $c5                               ; [66]:
    .byte $bc                               ; [67]:
    .byte $d3                               ; [68]:
    .byte $e4                               ; [69]:
    .byte $bd                               ; [70]:
    .byte $d4                               ; [71]:
    .byte $b7                               ; [72]:
    .byte $d6                               ; [73]:
    .byte $ee                               ; [74]:
    .byte $d4                               ; [75]:
    .byte $d4                               ; [76]:
    .byte $d2                               ; [77]:
    .byte $90                               ; [78]:
    .byte $c6                               ; [79]:
    .byte $d1                               ; [80]:
    .byte $d4                               ; [81]:
    .byte $db                               ; [82]:
    .byte $dd                               ; [83]:
    .byte $99                               ; [84]:
    .byte $9b                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $f7                               ; [88]:
    .byte $9f                               ; [89]:
    .byte $f9                               ; [90]:
    .byte $fd                               ; [91]:
    .byte $f2                               ; [92]:
    .byte $a1                               ; [93]:
    .byte $fb                               ; [94]:
    .byte $e2                               ; [95]:
    .byte $a8                               ; [96]:
    .byte $a0                               ; [97]:
    .byte $9f                               ; [98]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c8c]
;
DARTMOOR_BLOCK_DATA_02:                     ; [$9d58]
    .byte $00                               ; [0]:
    .byte $a1                               ; [1]:
    .byte $a2                               ; [2]:
    .byte $95                               ; [3]:
    .byte $8f                               ; [4]:
    .byte $82                               ; [5]:
    .byte $81                               ; [6]:
    .byte $84                               ; [7]:
    .byte $bb                               ; [8]:
    .byte $ba                               ; [9]:
    .byte $81                               ; [10]:
    .byte $8a                               ; [11]:
    .byte $ab                               ; [12]:
    .byte $ad                               ; [13]:
    .byte $b3                               ; [14]:
    .byte $b5                               ; [15]:
    .byte $a1                               ; [16]:
    .byte $a1                               ; [17]:
    .byte $a2                               ; [18]:
    .byte $db                               ; [19]:
    .byte $de                               ; [20]:
    .byte $e3                               ; [21]:
    .byte $8f                               ; [22]:
    .byte $8f                               ; [23]:
    .byte $cc                               ; [24]:
    .byte $cc                               ; [25]:
    .byte $e5                               ; [26]:
    .byte $9a                               ; [27]:
    .byte $a2                               ; [28]:
    .byte $a2                               ; [29]:
    .byte $a2                               ; [30]:
    .byte $b3                               ; [31]:
    .byte $b3                               ; [32]:
    .byte $c6                               ; [33]:
    .byte $c6                               ; [34]:
    .byte $c8                               ; [35]:
    .byte $db                               ; [36]:
    .byte $de                               ; [37]:
    .byte $bd                               ; [38]:
    .byte $d5                               ; [39]:
    .byte $ca                               ; [40]:
    .byte $d9                               ; [41]:
    .byte $cc                               ; [42]:
    .byte $c3                               ; [43]:
    .byte $c1                               ; [44]:
    .byte $88                               ; [45]:
    .byte $e8                               ; [46]:
    .byte $ea                               ; [47]:
    .byte $c6                               ; [48]:
    .byte $ce                               ; [49]:
    .byte $d9                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $d9                               ; [52]:
    .byte $d7                               ; [53]:
    .byte $ca                               ; [54]:
    .byte $c6                               ; [55]:
    .byte $a2                               ; [56]:
    .byte $e8                               ; [57]:
    .byte $ea                               ; [58]:
    .byte $8e                               ; [59]:
    .byte $9e                               ; [60]:
    .byte $d2                               ; [61]:
    .byte $ec                               ; [62]:
    .byte $c6                               ; [63]:
    .byte $d8                               ; [64]:
    .byte $e6                               ; [65]:
    .byte $90                               ; [66]:
    .byte $d2                               ; [67]:
    .byte $bd                               ; [68]:
    .byte $bc                               ; [69]:
    .byte $e5                               ; [70]:
    .byte $d4                               ; [71]:
    .byte $d4                               ; [72]:
    .byte $d4                               ; [73]:
    .byte $d2                               ; [74]:
    .byte $d4                               ; [75]:
    .byte $d4                               ; [76]:
    .byte $90                               ; [77]:
    .byte $d2                               ; [78]:
    .byte $d4                               ; [79]:
    .byte $c3                               ; [80]:
    .byte $d4                               ; [81]:
    .byte $c6                               ; [82]:
    .byte $c7                               ; [83]:
    .byte $9a                               ; [84]:
    .byte $9c                               ; [85]:
    .byte $e1                               ; [86]:
    .byte $e1                               ; [87]:
    .byte $f8                               ; [88]:
    .byte $c3                               ; [89]:
    .byte $fa                               ; [90]:
    .byte $fd                               ; [91]:
    .byte $a1                               ; [92]:
    .byte $f2                               ; [93]:
    .byte $fc                               ; [94]:
    .byte $e3                               ; [95]:
    .byte $a9                               ; [96]:
    .byte $a2                               ; [97]:
    .byte $8f                               ; [98]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c8e]
;
DARTMOOR_BLOCK_DATA_03:                     ; [$9dbb]
    .byte $00                               ; [0]:
    .byte $9f                               ; [1]:
    .byte $86                               ; [2]:
    .byte $a3                               ; [3]:
    .byte $a4                               ; [4]:
    .byte $91                               ; [5]:
    .byte $92                               ; [6]:
    .byte $93                               ; [7]:
    .byte $f0                               ; [8]:
    .byte $92                               ; [9]:
    .byte $f1                               ; [10]:
    .byte $92                               ; [11]:
    .byte $ae                               ; [12]:
    .byte $b0                               ; [13]:
    .byte $b6                               ; [14]:
    .byte $b8                               ; [15]:
    .byte $a3                               ; [16]:
    .byte $a4                               ; [17]:
    .byte $a4                               ; [18]:
    .byte $dc                               ; [19]:
    .byte $d4                               ; [20]:
    .byte $e2                               ; [21]:
    .byte $a3                               ; [22]:
    .byte $9f                               ; [23]:
    .byte $bc                               ; [24]:
    .byte $d4                               ; [25]:
    .byte $b6                               ; [26]:
    .byte $c5                               ; [27]:
    .byte $9b                               ; [28]:
    .byte $9f                               ; [29]:
    .byte $a3                               ; [30]:
    .byte $d8                               ; [31]:
    .byte $d8                               ; [32]:
    .byte $d1                               ; [33]:
    .byte $c6                               ; [34]:
    .byte $c7                               ; [35]:
    .byte $dc                               ; [36]:
    .byte $aa                               ; [37]:
    .byte $be                               ; [38]:
    .byte $d5                               ; [39]:
    .byte $c6                               ; [40]:
    .byte $c5                               ; [41]:
    .byte $c7                               ; [42]:
    .byte $d1                               ; [43]:
    .byte $d1                               ; [44]:
    .byte $97                               ; [45]:
    .byte $e9                               ; [46]:
    .byte $e9                               ; [47]:
    .byte $d8                               ; [48]:
    .byte $cf                               ; [49]:
    .byte $d8                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $c6                               ; [52]:
    .byte $d7                               ; [53]:
    .byte $c5                               ; [54]:
    .byte $d8                               ; [55]:
    .byte $a3                               ; [56]:
    .byte $e9                               ; [57]:
    .byte $e9                               ; [58]:
    .byte $00                               ; [59]:
    .byte $a6                               ; [60]:
    .byte $c7                               ; [61]:
    .byte $c6                               ; [62]:
    .byte $d8                               ; [63]:
    .byte $ed                               ; [64]:
    .byte $ed                               ; [65]:
    .byte $d1                               ; [66]:
    .byte $be                               ; [67]:
    .byte $d3                               ; [68]:
    .byte $d4                               ; [69]:
    .byte $bf                               ; [70]:
    .byte $b7                               ; [71]:
    .byte $b7                               ; [72]:
    .byte $d4                               ; [73]:
    .byte $ef                               ; [74]:
    .byte $d5                               ; [75]:
    .byte $d4                               ; [76]:
    .byte $c6                               ; [77]:
    .byte $d2                               ; [78]:
    .byte $d2                               ; [79]:
    .byte $a3                               ; [80]:
    .byte $d2                               ; [81]:
    .byte $eb                               ; [82]:
    .byte $c6                               ; [83]:
    .byte $9b                               ; [84]:
    .byte $99                               ; [85]:
    .byte $00                               ; [86]:
    .byte $00                               ; [87]:
    .byte $9f                               ; [88]:
    .byte $fb                               ; [89]:
    .byte $f9                               ; [90]:
    .byte $fd                               ; [91]:
    .byte $f3                               ; [92]:
    .byte $a4                               ; [93]:
    .byte $a3                               ; [94]:
    .byte $e2                               ; [95]:
    .byte $fe                               ; [96]:
    .byte $a3                               ; [97]:
    .byte $9f                               ; [98]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c90]
;
DARTMOOR_BLOCK_DATA_04:                     ; [$9e1e]
    .byte $00                               ; [0]:
    .byte $85                               ; [1]:
    .byte $8f                               ; [2]:
    .byte $a4                               ; [3]:
    .byte $a5                               ; [4]:
    .byte $92                               ; [5]:
    .byte $91                               ; [6]:
    .byte $94                               ; [7]:
    .byte $f1                               ; [8]:
    .byte $f0                               ; [9]:
    .byte $91                               ; [10]:
    .byte $91                               ; [11]:
    .byte $af                               ; [12]:
    .byte $b1                               ; [13]:
    .byte $b7                               ; [14]:
    .byte $b9                               ; [15]:
    .byte $a4                               ; [16]:
    .byte $a4                               ; [17]:
    .byte $a5                               ; [18]:
    .byte $e5                               ; [19]:
    .byte $df                               ; [20]:
    .byte $e3                               ; [21]:
    .byte $a5                               ; [22]:
    .byte $8f                               ; [23]:
    .byte $c8                               ; [24]:
    .byte $c8                               ; [25]:
    .byte $b7                               ; [26]:
    .byte $c3                               ; [27]:
    .byte $9c                               ; [28]:
    .byte $8f                               ; [29]:
    .byte $a5                               ; [30]:
    .byte $b7                               ; [31]:
    .byte $b7                               ; [32]:
    .byte $d2                               ; [33]:
    .byte $d2                               ; [34]:
    .byte $c8                               ; [35]:
    .byte $aa                               ; [36]:
    .byte $df                               ; [37]:
    .byte $bf                               ; [38]:
    .byte $d5                               ; [39]:
    .byte $c6                               ; [40]:
    .byte $c6                               ; [41]:
    .byte $c8                               ; [42]:
    .byte $c3                               ; [43]:
    .byte $c3                               ; [44]:
    .byte $98                               ; [45]:
    .byte $ea                               ; [46]:
    .byte $ea                               ; [47]:
    .byte $d2                               ; [48]:
    .byte $d0                               ; [49]:
    .byte $c6                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $c6                               ; [52]:
    .byte $d5                               ; [53]:
    .byte $c6                               ; [54]:
    .byte $c6                               ; [55]:
    .byte $a5                               ; [56]:
    .byte $ea                               ; [57]:
    .byte $ea                               ; [58]:
    .byte $e1                               ; [59]:
    .byte $a7                               ; [60]:
    .byte $c7                               ; [61]:
    .byte $c6                               ; [62]:
    .byte $c7                               ; [63]:
    .byte $d8                               ; [64]:
    .byte $d8                               ; [65]:
    .byte $d2                               ; [66]:
    .byte $d2                               ; [67]:
    .byte $bf                               ; [68]:
    .byte $be                               ; [69]:
    .byte $d4                               ; [70]:
    .byte $d4                               ; [71]:
    .byte $d4                               ; [72]:
    .byte $d4                               ; [73]:
    .byte $d2                               ; [74]:
    .byte $d5                               ; [75]:
    .byte $d4                               ; [76]:
    .byte $c6                               ; [77]:
    .byte $c6                               ; [78]:
    .byte $d4                               ; [79]:
    .byte $a5                               ; [80]:
    .byte $d4                               ; [81]:
    .byte $c6                               ; [82]:
    .byte $e9                               ; [83]:
    .byte $9c                               ; [84]:
    .byte $9a                               ; [85]:
    .byte $e1                               ; [86]:
    .byte $e1                               ; [87]:
    .byte $c3                               ; [88]:
    .byte $fc                               ; [89]:
    .byte $fa                               ; [90]:
    .byte $fd                               ; [91]:
    .byte $a4                               ; [92]:
    .byte $f3                               ; [93]:
    .byte $a5                               ; [94]:
    .byte $e3                               ; [95]:
    .byte $e0                               ; [96]:
    .byte $a5                               ; [97]:
    .byte $8f                               ; [98]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c80]
;
DARTMOOR_BLOCK_PROPERTIES:                  ; [$9e81]
    .byte BLOCK_IS_AIR                      ; [0]:
    .byte BLOCK_IS_SOLID                    ; [1]:
    .byte BLOCK_IS_SOLID                    ; [2]:
    .byte BLOCK_IS_SOLID                    ; [3]:
    .byte BLOCK_IS_SOLID                    ; [4]:
    .byte BLOCK_IS_AIR                      ; [5]:
    .byte BLOCK_IS_AIR                      ; [6]:
    .byte BLOCK_IS_AIR                      ; [7]:
    .byte BLOCK_IS_AIR                      ; [8]:
    .byte BLOCK_IS_AIR                      ; [9]:
    .byte BLOCK_IS_AIR                      ; [10]:
    .byte BLOCK_IS_AIR                      ; [11]:
    .byte BLOCK_IS_AIR                      ; [12]:
    .byte BLOCK_IS_AIR                      ; [13]:
    .byte BLOCK_IS_AIR                      ; [14]:
    .byte BLOCK_IS_AIR                      ; [15]:
    .byte BLOCK_IS_SOLID                    ; [16]:
    .byte BLOCK_IS_SOLID                    ; [17]:
    .byte BLOCK_IS_SOLID                    ; [18]:
    .byte BLOCK_IS_AIR                      ; [19]:
    .byte BLOCK_IS_AIR                      ; [20]:
    .byte BLOCK_IS_LADDER                   ; [21]:
    .byte BLOCK_IS_SOLID                    ; [22]:
    .byte BLOCK_IS_SOLID                    ; [23]:
    .byte BLOCK_IS_AIR                      ; [24]:
    .byte BLOCK_IS_AIR                      ; [25]:
    .byte BLOCK_IS_AIR                      ; [26]:
    .byte BLOCK_IS_SOLID                    ; [27]:
    .byte BLOCK_IS_SOLID                    ; [28]:
    .byte BLOCK_IS_SOLID                    ; [29]:
    .byte BLOCK_IS_SOLID                    ; [30]:
    .byte BLOCK_IS_AIR                      ; [31]:
    .byte BLOCK_IS_AIR                      ; [32]:
    .byte BLOCK_IS_AIR                      ; [33]:
    .byte BLOCK_IS_AIR                      ; [34]:
    .byte BLOCK_IS_AIR                      ; [35]:
    .byte BLOCK_IS_AIR                      ; [36]:
    .byte BLOCK_IS_AIR                      ; [37]:
    .byte BLOCK_IS_AIR                      ; [38]:
    .byte BLOCK_IS_AIR                      ; [39]:
    .byte BLOCK_IS_AIR                      ; [40]:
    .byte BLOCK_IS_AIR                      ; [41]:
    .byte BLOCK_IS_AIR                      ; [42]:
    .byte BLOCK_IS_AIR                      ; [43]:
    .byte BLOCK_IS_AIR                      ; [44]:
    .byte BLOCK_IS_AIR                      ; [45]:
    .byte BLOCK_IS_DOOR                     ; [46]:
    .byte BLOCK_IS_DOOR                     ; [47]:
    .byte BLOCK_IS_AIR                      ; [48]:
    .byte BLOCK_IS_AIR                      ; [49]:
    .byte BLOCK_IS_AIR                      ; [50]:
    .byte BLOCK_IS_AIR                      ; [51]:
    .byte BLOCK_IS_AIR                      ; [52]:
    .byte BLOCK_IS_AIR                      ; [53]:
    .byte BLOCK_IS_AIR                      ; [54]:
    .byte BLOCK_IS_AIR                      ; [55]:
    .byte BLOCK_BREAKABLE_FLOOR             ; [56]:
    .byte BLOCK_IS_DOOR                     ; [57]:
    .byte BLOCK_IS_DOOR                     ; [58]:
    .byte BLOCK_IS_DOOR                     ; [59]:
    .byte BLOCK_IS_SOLID                    ; [60]:
    .byte BLOCK_IS_AIR                      ; [61]:
    .byte BLOCK_IS_AIR                      ; [62]:
    .byte BLOCK_IS_AIR                      ; [63]:
    .byte BLOCK_IS_AIR                      ; [64]:
    .byte BLOCK_IS_AIR                      ; [65]:
    .byte BLOCK_IS_AIR                      ; [66]:
    .byte BLOCK_IS_AIR                      ; [67]:
    .byte BLOCK_IS_AIR                      ; [68]:
    .byte BLOCK_IS_AIR                      ; [69]:
    .byte BLOCK_IS_AIR                      ; [70]:
    .byte BLOCK_IS_AIR                      ; [71]:
    .byte BLOCK_IS_AIR                      ; [72]:
    .byte BLOCK_IS_AIR                      ; [73]:
    .byte BLOCK_IS_AIR                      ; [74]:
    .byte BLOCK_IS_AIR                      ; [75]:
    .byte BLOCK_IS_AIR                      ; [76]:
    .byte BLOCK_IS_AIR                      ; [77]:
    .byte BLOCK_IS_AIR                      ; [78]:
    .byte BLOCK_IS_AIR                      ; [79]:
    .byte BLOCK_IS_AIR                      ; [80]:
    .byte BLOCK_IS_AIR                      ; [81]:
    .byte BLOCK_IS_AIR                      ; [82]:
    .byte BLOCK_IS_AIR                      ; [83]:
    .byte BLOCK_IS_SOLID                    ; [84]:
    .byte BLOCK_IS_SOLID                    ; [85]:
    .byte BLOCK_IS_DOOR                     ; [86]:
    .byte BLOCK_IS_DOOR                     ; [87]:
    .byte BLOCK_IS_SOLID                    ; [88]:
    .byte BLOCK_IS_SOLID                    ; [89]:
    .byte BLOCK_IS_SOLID                    ; [90]:
    .byte BLOCK_IS_SOLID                    ; [91]:
    .byte BLOCK_IS_SOLID                    ; [92]:
    .byte BLOCK_IS_SOLID                    ; [93]:
    .byte BLOCK_IS_SOLID                    ; [94]:
    .byte BLOCK_MAYBE_AREA_TRANSITION_DOWN  ; [95]:
    .byte BLOCK_IS_SOLID                    ; [96]:
    .byte BLOCK_MAYBE_BREAKABLE_BY_MATTOCK  ; [97]:
    .byte BLOCK_AREA_TRANSITION_LEFT        ; [98]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c82]
;
DARTMOOR_SCROLL_DATA:                       ; [$9ee4]
    .byte $01                               ; [0]:
    .byte $ff                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $02                               ; [4]:
    .byte $00                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $03                               ; [7]:
    .byte $ff                               ; [8]:
    .byte $01                               ; [9]:
    .byte $ff                               ; [10]:
    .byte $ff                               ; [11]:
    .byte $ff                               ; [12]:
    .byte $ff                               ; [13]:
    .byte $01                               ; [14]:
    .byte $04                               ; [15]:
    .byte $05                               ; [16]:
    .byte $ff                               ; [17]:
    .byte $03                               ; [18]:
    .byte $0b                               ; [19]:
    .byte $ff                               ; [20]:
    .byte $04                               ; [21]:
    .byte $ff                               ; [22]:
    .byte $06                               ; [23]:
    .byte $07                               ; [24]:
    .byte $0b                               ; [25]:
    .byte $05                               ; [26]:
    .byte $ff                               ; [27]:
    .byte $08                               ; [28]:
    .byte $06                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $ff                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $07                               ; [33]:
    .byte $ff                               ; [34]:
    .byte $ff                               ; [35]:
    .byte $0a                               ; [36]:
    .byte $ff                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $0c                               ; [39]:
    .byte $ff                               ; [40]:
    .byte $09                               ; [41]:
    .byte $ff                               ; [42]:
    .byte $0d                               ; [43]:
    .byte $06                               ; [44]:
    .byte $0e                               ; [45]:
    .byte $04                               ; [46]:
    .byte $ff                               ; [47]:
    .byte $0d                               ; [48]:
    .byte $ff                               ; [49]:
    .byte $09                               ; [50]:
    .byte $ff                               ; [51]:
    .byte $0e                               ; [52]:
    .byte $0c                               ; [53]:
    .byte $0a                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $0b                               ; [56]:
    .byte $0d                               ; [57]:
    .byte $ff                               ; [58]:
    .byte $ff                               ; [59]:
    .byte $ff                               ; [60]:
    .byte $ff                               ; [61]:
    .byte $ff                               ; [62]:
    .byte $ff                               ; [63]:
    .byte $ff                               ; [64]:
    .byte $11                               ; [65]:
    .byte $ff                               ; [66]:
    .byte $1d                               ; [67]:
    .byte $10                               ; [68]:
    .byte $12                               ; [69]:
    .byte $ff                               ; [70]:
    .byte $17                               ; [71]:
    .byte $11                               ; [72]:
    .byte $13                               ; [73]:
    .byte $ff                               ; [74]:
    .byte $18                               ; [75]:
    .byte $12                               ; [76]:
    .byte $14                               ; [77]:
    .byte $ff                               ; [78]:
    .byte $19                               ; [79]:
    .byte $13                               ; [80]:
    .byte $ff                               ; [81]:
    .byte $ff                               ; [82]:
    .byte $1a                               ; [83]:
    .byte $ff                               ; [84]:
    .byte $16                               ; [85]:
    .byte $ff                               ; [86]:
    .byte $ff                               ; [87]:
    .byte $15                               ; [88]:
    .byte $ff                               ; [89]:
    .byte $ff                               ; [90]:
    .byte $ff                               ; [91]:
    .byte $1d                               ; [92]:
    .byte $18                               ; [93]:
    .byte $11                               ; [94]:
    .byte $ff                               ; [95]:
    .byte $17                               ; [96]:
    .byte $19                               ; [97]:
    .byte $12                               ; [98]:
    .byte $ff                               ; [99]:
    .byte $18                               ; [100]:
    .byte $1a                               ; [101]:
    .byte $13                               ; [102]:
    .byte $1e                               ; [103]:
    .byte $19                               ; [104]:
    .byte $1b                               ; [105]:
    .byte $14                               ; [106]:
    .byte $ff                               ; [107]:
    .byte $1a                               ; [108]:
    .byte $1c                               ; [109]:
    .byte $ff                               ; [110]:
    .byte $1f                               ; [111]:
    .byte $1b                               ; [112]:
    .byte $1d                               ; [113]:
    .byte $ff                               ; [114]:
    .byte $ff                               ; [115]:
    .byte $1c                               ; [116]:
    .byte $17                               ; [117]:
    .byte $10                               ; [118]:
    .byte $ff                               ; [119]:
    .byte $ff                               ; [120]:
    .byte $ff                               ; [121]:
    .byte $19                               ; [122]:
    .byte $ff                               ; [123]:
    .byte $ff                               ; [124]:
    .byte $ff                               ; [125]:
    .byte $1b                               ; [126]:
    .byte $ff                               ; [127]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c84]
;
DARTMOOR_DOOR_LOCATIONS:                    ; [$9f64]
    .byte $0c                               ; [0]:
    .byte $48                               ; [1]:
    .byte $00                               ; [2]:
    .byte $91                               ; [3]:
    .byte $10                               ; [4]:
    .byte $90                               ; [5]:
    .byte $01                               ; [6]:
    .byte $49                               ; [7]:
    .byte $14                               ; [8]:
    .byte $9e                               ; [9]:
    .byte $02                               ; [10]:
    .byte $92                               ; [11]:
    .byte $15                               ; [12]:
    .byte $91                               ; [13]:
    .byte $03                               ; [14]:
    .byte $9d                               ; [15]:
    .byte $0e                               ; [16]:
    .byte $a9                               ; [17]:
    .byte $04                               ; [18]:
    .byte $ac                               ; [19]:
    .byte $0e                               ; [20]:
    .byte $ab                               ; [21]:
    .byte $05                               ; [22]:
    .byte $a8                               ; [23]:
    .byte $02                               ; [24]:
    .byte $42                               ; [25]:
    .byte $20                               ; [26]:
    .byte $9e                               ; [27]:
    .byte $02                               ; [28]:
    .byte $45                               ; [29]:
    .byte $21                               ; [30]:
    .byte $9e                               ; [31]:
    .byte $02                               ; [32]:
    .byte $4b                               ; [33]:
    .byte $22                               ; [34]:
    .byte $9e                               ; [35]:
    .byte $02                               ; [36]:
    .byte $4e                               ; [37]:
    .byte $23                               ; [38]:
    .byte $9e                               ; [39]:
    .byte $03                               ; [40]:
    .byte $ac                               ; [41]:
    .byte $24                               ; [42]:
    .byte $9e                               ; [43]:
    .byte $08                               ; [44]:
    .byte $42                               ; [45]:
    .byte $25                               ; [46]:
    .byte $9e                               ; [47]:
    .byte $1e                               ; [48]:
    .byte $a7                               ; [49]:
    .byte $27                               ; [50]:
    .byte $9e                               ; [51]:
    .byte $1f                               ; [52]:
    .byte $ad                               ; [53]:
    .byte $28                               ; [54]:
    .byte $9e                               ; [55]:
    .byte $00                               ; [56]:
    .byte $af                               ; [57]:
    .byte $fe                               ; [58]:
    .byte $a9                               ; [59]:
    .byte $0e                               ; [60]:
    .byte $ae                               ; [61]:
    .byte $ff                               ; [62]:
    .byte $a2                               ; [63]:
    .byte $ff                               ; [64]:

;
; XREFS:
;     DARTMOOR_AREA_DATA [$PRG3::9c86]
;
DARTMOOR_DOOR_DESTINATIONS:                 ; [$9fa5]
    .byte $10                               ; [0]:
    .byte $0d                               ; [1]:
    .byte $00                               ; [2]:
    .byte $00                               ; [3]:
    .byte $0c                               ; [4]:
    .byte $0c                               ; [5]:
    .byte $00                               ; [6]:
    .byte $00                               ; [7]:
    .byte $15                               ; [8]:
    .byte $0e                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $14                               ; [12]:
    .byte $0d                               ; [13]:
    .byte $00                               ; [14]:
    .byte $00                               ; [15]:
    .byte $0e                               ; [16]:
    .byte $0c                               ; [17]:
    .byte $08                               ; [18]:
    .byte $00                               ; [19]:
    .byte $0e                               ; [20]:
    .byte $0c                               ; [21]:
    .byte $08                               ; [22]:
    .byte $00                               ; [23]:
    .byte $ff                               ; [24]:
    .byte $ff                               ; [25]:
    .byte $2d                               ; [26]:
    .byte $00                               ; [27]:
    .byte $ff                               ; [28]:
    .byte $6a                               ; [29]:
    .byte $ff                               ; [30]:
    .byte $f7                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $7f                               ; [33]:
    .byte $78                               ; [34]:
    .byte $00                               ; [35]:
    .byte $ff                               ; [36]:
    .byte $ba                               ; [37]:
    .byte $ff                               ; [38]:
    .byte $fb                               ; [39]:
    .byte $ff                               ; [40]:
    .byte $e7                               ; [41]:
    .byte $1a                               ; [42]:
    .byte $00                               ; [43]:
    .byte $ff                               ; [44]:
    .byte $0f                               ; [45]:
    .byte $ff                               ; [46]:
    .byte $ff                               ; [47]:
    .byte $ff                               ; [48]:
    .byte $fe                               ; [49]:
    .byte $8e                               ; [50]:
    .byte $00                               ; [51]:
    .byte $ff                               ; [52]:
    .byte $ff                               ; [53]:
    .byte $ff                               ; [54]:
    .byte $ff                               ; [55]:
    .byte $ff                               ; [56]:
    .byte $ff                               ; [57]:
    .byte $36                               ; [58]:
    .byte $00                               ; [59]:
    .byte $ff                               ; [60]:
    .byte $04                               ; [61]:
    .byte $ff                               ; [62]:
    .byte $dd                               ; [63]:
    .byte $ff                               ; [64]:
    .byte $f9,$cf,$04,$ff,$7b,$ff,$d3,$ff   ; [$9fe6] undefined
    .byte $af,$00,$00,$ff,$f5,$ff,$fd,$ff   ; [$9fee] undefined
    .byte $fb,$c0,$00,$ff,$e6,$ff,$ff,$ff   ; [$9ff6] undefined
    .byte $fb,$83,$00,$00,$00,$fd,$00,$0a   ; [$9ffe] undefined
    .byte $00,$00,$00,$00,$00,$7a,$00,$88   ; [$a006] undefined
    .byte $00,$00,$00,$00,$00,$8f,$00,$1c   ; [$a00e] undefined
    .byte $00,$00,$00,$00,$00,$f3,$00,$25   ; [$a016] undefined
    .byte $00,$00,$00,$00,$00,$7b,$02,$35   ; [$a01e] undefined
    .byte $07,$00,$00,$36,$05,$00,$00,$37   ; [$a026] undefined
    .byte $04,$00,$00,$38,$06,$00,$00,$39   ; [$a02e] undefined
    .byte $03,$00,$00,$3a,$06,$00,$00,$3b   ; [$a036] undefined
    .byte $01,$00,$00,$42,$01,$00,$00,$43   ; [$a03e] undefined
    .byte $04,$00,$00                       ; [$a046] undefined

ZENITH_AREA_DATA:                           ; [$a049]
    .word (ZENITH_AREA_DATA_blockAttrsRelPtr-$8000) & $FFFF ; ZENITH_AREA_DATA.blockAttrsRelPtr
                                                            ; [$PRG3::a049]
    .word (ZENITH_BLOCK_PROPERTIES-$8000) & $FFFF ; ZENITH_BLOCK_PROPERTIES
                                                  ; [$PRG3::a04b]
    .word (ZENITH_SCROLL_DATA-$8000) & $FFFF ; ZENITH_SCROLL_DATA
                                             ; [$PRG3::a04d]
    .word (ZENITH_DOOR_LOCATIONS-$8000) & $FFFF ; ZENITH_DOOR_LOCATIONS
                                                ; [$PRG3::a04f]
    .word (ZENITH_DOOR_DESTINATIONS-$8000) & $FFFF ; ZENITH_DOOR_DESTINATIONS
                                                   ; [$PRG3::a051]

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a049]
;
ZENITH_AREA_DATA_blockAttrsRelPtr:          ; [$a053]
    .word (ZENITH_BLOCK_ATTRIBUTES-$8000) & $FFFF ; ZENITH_BLOCK_ATTRIBUTES
                                                  ; [$PRG3::a053]
    .word (ZENITH_BLOCK_DATA_01-$8000) & $FFFF ; ZENITH_BLOCK_DATA_01
                                               ; [$PRG3::a055]
    .word (ZENITH_BLOCK_DATA_02-$8000) & $FFFF ; ZENITH_BLOCK_DATA_02
                                               ; [$PRG3::a057]
    .word (ZENITH_BLOCK_DATA_03-$8000) & $FFFF ; ZENITH_BLOCK_DATA_03
                                               ; [$PRG3::a059]
    .word (ZENITH_BLOCK_DATA_04-$8000) & $FFFF ; ZENITH_BLOCK_DATA_04
                                               ; [$PRG3::a05b]

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a053]
;
ZENITH_BLOCK_ATTRIBUTES:                    ; [$a05d]
    .byte $00                               ; [0]:
    .byte $55                               ; [1]:
    .byte $55                               ; [2]:
    .byte $55                               ; [3]:
    .byte $55                               ; [4]:
    .byte $aa                               ; [5]:
    .byte $aa                               ; [6]:
    .byte $aa                               ; [7]:
    .byte $aa                               ; [8]:
    .byte $aa                               ; [9]:
    .byte $aa                               ; [10]:
    .byte $aa                               ; [11]:
    .byte $55                               ; [12]:
    .byte $55                               ; [13]:
    .byte $55                               ; [14]:
    .byte $55                               ; [15]:
    .byte $55                               ; [16]:
    .byte $55                               ; [17]:
    .byte $55                               ; [18]:
    .byte $55                               ; [19]:
    .byte $55                               ; [20]:
    .byte $55                               ; [21]:
    .byte $55                               ; [22]:
    .byte $55                               ; [23]:
    .byte $55                               ; [24]:
    .byte $55                               ; [25]:
    .byte $55                               ; [26]:
    .byte $55                               ; [27]:
    .byte $55                               ; [28]:
    .byte $55                               ; [29]:
    .byte $55                               ; [30]:
    .byte $55                               ; [31]:
    .byte $55                               ; [32]:
    .byte $aa                               ; [33]:
    .byte $aa                               ; [34]:
    .byte $aa                               ; [35]:
    .byte $aa                               ; [36]:
    .byte $aa                               ; [37]:
    .byte $55                               ; [38]:
    .byte $55                               ; [39]:
    .byte $aa                               ; [40]:
    .byte $aa                               ; [41]:
    .byte $aa                               ; [42]:
    .byte $aa                               ; [43]:
    .byte $aa                               ; [44]:
    .byte $aa                               ; [45]:
    .byte $aa                               ; [46]:
    .byte $aa                               ; [47]:
    .byte $aa                               ; [48]:
    .byte $aa                               ; [49]:
    .byte $aa                               ; [50]:
    .byte $aa                               ; [51]:
    .byte $aa                               ; [52]:
    .byte $aa                               ; [53]:
    .byte $aa                               ; [54]:
    .byte $aa                               ; [55]:
    .byte $aa                               ; [56]:
    .byte $aa                               ; [57]:
    .byte $aa                               ; [58]:
    .byte $aa                               ; [59]:
    .byte $aa                               ; [60]:
    .byte $aa                               ; [61]:
    .byte $aa                               ; [62]:
    .byte $aa                               ; [63]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a055]
;
ZENITH_BLOCK_DATA_01:                       ; [$a09d]
    .byte $00                               ; [0]:
    .byte $a0                               ; [1]:
    .byte $a1                               ; [2]:
    .byte $9f                               ; [3]:
    .byte $96                               ; [4]:
    .byte $e7                               ; [5]:
    .byte $e9                               ; [6]:
    .byte $87                               ; [7]:
    .byte $c0                               ; [8]:
    .byte $c5                               ; [9]:
    .byte $c5                               ; [10]:
    .byte $cd                               ; [11]:
    .byte $f7                               ; [12]:
    .byte $9f                               ; [13]:
    .byte $f9                               ; [14]:
    .byte $fd                               ; [15]:
    .byte $a0                               ; [16]:
    .byte $a1                               ; [17]:
    .byte $a1                               ; [18]:
    .byte $da                               ; [19]:
    .byte $dd                               ; [20]:
    .byte $e2                               ; [21]:
    .byte $9f                               ; [22]:
    .byte $9f                               ; [23]:
    .byte $f2                               ; [24]:
    .byte $a1                               ; [25]:
    .byte $fb                               ; [26]:
    .byte $99                               ; [27]:
    .byte $9b                               ; [28]:
    .byte $a0                               ; [29]:
    .byte $a0                               ; [30]:
    .byte $a0                               ; [31]:
    .byte $f2                               ; [32]:
    .byte $c5                               ; [33]:
    .byte $d2                               ; [34]:
    .byte $c7                               ; [35]:
    .byte $da                               ; [36]:
    .byte $dd                               ; [37]:
    .byte $a0                               ; [38]:
    .byte $fd                               ; [39]:
    .byte $e6                               ; [40]:
    .byte $d9                               ; [41]:
    .byte $d9                               ; [42]:
    .byte $d4                               ; [43]:
    .byte $f3                               ; [44]:
    .byte $c6                               ; [45]:
    .byte $d8                               ; [46]:
    .byte $d8                               ; [47]:
    .byte $d8                               ; [48]:
    .byte $d4                               ; [49]:
    .byte $e4                               ; [50]:
    .byte $80                               ; [51]:
    .byte $d9                               ; [52]:
    .byte $80                               ; [53]:
    .byte $c9                               ; [54]:
    .byte $e6                               ; [55]:
    .byte $d4                               ; [56]:
    .byte $f8                               ; [57]:
    .byte $d4                               ; [58]:
    .byte $8d                               ; [59]:
    .byte $a0                               ; [60]:
    .byte $9d                               ; [61]:
    .byte $c7                               ; [62]:
    .byte $a0                               ; [63]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a057]
;
ZENITH_BLOCK_DATA_02:                       ; [$a0dd]
    .byte $00                               ; [0]:
    .byte $a1                               ; [1]:
    .byte $a2                               ; [2]:
    .byte $95                               ; [3]:
    .byte $c3                               ; [4]:
    .byte $e8                               ; [5]:
    .byte $ea                               ; [6]:
    .byte $88                               ; [7]:
    .byte $c1                               ; [8]:
    .byte $c3                               ; [9]:
    .byte $90                               ; [10]:
    .byte $ce                               ; [11]:
    .byte $f8                               ; [12]:
    .byte $c3                               ; [13]:
    .byte $fa                               ; [14]:
    .byte $fd                               ; [15]:
    .byte $a1                               ; [16]:
    .byte $a1                               ; [17]:
    .byte $a2                               ; [18]:
    .byte $db                               ; [19]:
    .byte $de                               ; [20]:
    .byte $e3                               ; [21]:
    .byte $8f                               ; [22]:
    .byte $8f                               ; [23]:
    .byte $a1                               ; [24]:
    .byte $f2                               ; [25]:
    .byte $fc                               ; [26]:
    .byte $9a                               ; [27]:
    .byte $9c                               ; [28]:
    .byte $a2                               ; [29]:
    .byte $a2                               ; [30]:
    .byte $a2                               ; [31]:
    .byte $a2                               ; [32]:
    .byte $c6                               ; [33]:
    .byte $c6                               ; [34]:
    .byte $c8                               ; [35]:
    .byte $db                               ; [36]:
    .byte $de                               ; [37]:
    .byte $f2                               ; [38]:
    .byte $f2                               ; [39]:
    .byte $c6                               ; [40]:
    .byte $d9                               ; [41]:
    .byte $cc                               ; [42]:
    .byte $d4                               ; [43]:
    .byte $d4                               ; [44]:
    .byte $d2                               ; [45]:
    .byte $c6                               ; [46]:
    .byte $c6                               ; [47]:
    .byte $c6                               ; [48]:
    .byte $d8                               ; [49]:
    .byte $d9                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $d9                               ; [52]:
    .byte $c6                               ; [53]:
    .byte $ca                               ; [54]:
    .byte $c6                               ; [55]:
    .byte $e5                               ; [56]:
    .byte $d4                               ; [57]:
    .byte $d4                               ; [58]:
    .byte $8e                               ; [59]:
    .byte $a2                               ; [60]:
    .byte $9e                               ; [61]:
    .byte $c7                               ; [62]:
    .byte $a2                               ; [63]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a059]
;
ZENITH_BLOCK_DATA_03:                       ; [$a11d]
    .byte $00                               ; [0]:
    .byte $9f                               ; [1]:
    .byte $86                               ; [2]:
    .byte $a3                               ; [3]:
    .byte $a4                               ; [4]:
    .byte $e9                               ; [5]:
    .byte $e9                               ; [6]:
    .byte $97                               ; [7]:
    .byte $d1                               ; [8]:
    .byte $d1                               ; [9]:
    .byte $d1                               ; [10]:
    .byte $cf                               ; [11]:
    .byte $9f                               ; [12]:
    .byte $fb                               ; [13]:
    .byte $f9                               ; [14]:
    .byte $fd                               ; [15]:
    .byte $a3                               ; [16]:
    .byte $a4                               ; [17]:
    .byte $a4                               ; [18]:
    .byte $dc                               ; [19]:
    .byte $00                               ; [20]:
    .byte $e2                               ; [21]:
    .byte $a3                               ; [22]:
    .byte $9f                               ; [23]:
    .byte $f3                               ; [24]:
    .byte $a4                               ; [25]:
    .byte $a3                               ; [26]:
    .byte $9b                               ; [27]:
    .byte $99                               ; [28]:
    .byte $9f                               ; [29]:
    .byte $a3                               ; [30]:
    .byte $f7                               ; [31]:
    .byte $f3                               ; [32]:
    .byte $d1                               ; [33]:
    .byte $c6                               ; [34]:
    .byte $c7                               ; [35]:
    .byte $dc                               ; [36]:
    .byte $e5                               ; [37]:
    .byte $a3                               ; [38]:
    .byte $fd                               ; [39]:
    .byte $d4                               ; [40]:
    .byte $c5                               ; [41]:
    .byte $c7                               ; [42]:
    .byte $d4                               ; [43]:
    .byte $d4                               ; [44]:
    .byte $c7                               ; [45]:
    .byte $d8                               ; [46]:
    .byte $d4                               ; [47]:
    .byte $d8                               ; [48]:
    .byte $d4                               ; [49]:
    .byte $d8                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $c6                               ; [52]:
    .byte $c5                               ; [53]:
    .byte $c5                               ; [54]:
    .byte $d8                               ; [55]:
    .byte $d4                               ; [56]:
    .byte $c6                               ; [57]:
    .byte $d8                               ; [58]:
    .byte $00                               ; [59]:
    .byte $a3                               ; [60]:
    .byte $a6                               ; [61]:
    .byte $fe                               ; [62]:
    .byte $a3                               ; [63]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a05b]
;
ZENITH_BLOCK_DATA_04:                       ; [$a15d]
    .byte $00                               ; [0]:
    .byte $85                               ; [1]:
    .byte $c3                               ; [2]:
    .byte $a4                               ; [3]:
    .byte $a5                               ; [4]:
    .byte $ea                               ; [5]:
    .byte $ea                               ; [6]:
    .byte $98                               ; [7]:
    .byte $c3                               ; [8]:
    .byte $c3                               ; [9]:
    .byte $d2                               ; [10]:
    .byte $d0                               ; [11]:
    .byte $c3                               ; [12]:
    .byte $fc                               ; [13]:
    .byte $fa                               ; [14]:
    .byte $fd                               ; [15]:
    .byte $a4                               ; [16]:
    .byte $a4                               ; [17]:
    .byte $a5                               ; [18]:
    .byte $00                               ; [19]:
    .byte $df                               ; [20]:
    .byte $e3                               ; [21]:
    .byte $a5                               ; [22]:
    .byte $8f                               ; [23]:
    .byte $a4                               ; [24]:
    .byte $f3                               ; [25]:
    .byte $a5                               ; [26]:
    .byte $9c                               ; [27]:
    .byte $9a                               ; [28]:
    .byte $8f                               ; [29]:
    .byte $a5                               ; [30]:
    .byte $f8                               ; [31]:
    .byte $a5                               ; [32]:
    .byte $d2                               ; [33]:
    .byte $d2                               ; [34]:
    .byte $c8                               ; [35]:
    .byte $e5                               ; [36]:
    .byte $df                               ; [37]:
    .byte $f3                               ; [38]:
    .byte $f3                               ; [39]:
    .byte $e6                               ; [40]:
    .byte $c6                               ; [41]:
    .byte $c8                               ; [42]:
    .byte $d9                               ; [43]:
    .byte $c8                               ; [44]:
    .byte $c7                               ; [45]:
    .byte $c7                               ; [46]:
    .byte $e6                               ; [47]:
    .byte $d2                               ; [48]:
    .byte $d8                               ; [49]:
    .byte $c6                               ; [50]:
    .byte $c6                               ; [51]:
    .byte $c6                               ; [52]:
    .byte $c6                               ; [53]:
    .byte $c6                               ; [54]:
    .byte $c6                               ; [55]:
    .byte $d4                               ; [56]:
    .byte $fc                               ; [57]:
    .byte $fc                               ; [58]:
    .byte $e1                               ; [59]:
    .byte $a5                               ; [60]:
    .byte $a7                               ; [61]:
    .byte $c7                               ; [62]:
    .byte $a5                               ; [63]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a04b]
;
ZENITH_BLOCK_PROPERTIES:                    ; [$a19d]
    .byte $00                               ; [0]:
    .byte $01                               ; [1]:
    .byte $01                               ; [2]:
    .byte $01                               ; [3]:
    .byte $01                               ; [4]:
    .byte $03                               ; [5]:
    .byte $03                               ; [6]:
    .byte $00                               ; [7]:
    .byte $00                               ; [8]:
    .byte $00                               ; [9]:
    .byte $00                               ; [10]:
    .byte $00                               ; [11]:
    .byte $01                               ; [12]:
    .byte $01                               ; [13]:
    .byte $01                               ; [14]:
    .byte $01                               ; [15]:
    .byte $01                               ; [16]:
    .byte $01                               ; [17]:
    .byte $01                               ; [18]:
    .byte $00                               ; [19]:
    .byte $00                               ; [20]:
    .byte $02                               ; [21]:
    .byte $01                               ; [22]:
    .byte $01                               ; [23]:
    .byte $01                               ; [24]:
    .byte $01                               ; [25]:
    .byte $01                               ; [26]:
    .byte $01                               ; [27]:
    .byte $01                               ; [28]:
    .byte $01                               ; [29]:
    .byte $01                               ; [30]:
    .byte $01                               ; [31]:
    .byte $01                               ; [32]:
    .byte $00                               ; [33]:
    .byte $00                               ; [34]:
    .byte $00                               ; [35]:
    .byte $00                               ; [36]:
    .byte $00                               ; [37]:
    .byte $01                               ; [38]:
    .byte $01                               ; [39]:
    .byte $00                               ; [40]:
    .byte $00                               ; [41]:
    .byte $00                               ; [42]:
    .byte $00                               ; [43]:
    .byte $00                               ; [44]:
    .byte $00                               ; [45]:
    .byte $00                               ; [46]:
    .byte $00                               ; [47]:
    .byte $00                               ; [48]:
    .byte $00                               ; [49]:
    .byte $00                               ; [50]:
    .byte $00                               ; [51]:
    .byte $00                               ; [52]:
    .byte $00                               ; [53]:
    .byte $00                               ; [54]:
    .byte $00                               ; [55]:
    .byte $00                               ; [56]:
    .byte $00                               ; [57]:
    .byte $00                               ; [58]:
    .byte $00                               ; [59]:
    .byte $05                               ; [60]:
    .byte $01                               ; [61]:
    .byte $01                               ; [62]:
    .byte $0b                               ; [63]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a04d]
;
ZENITH_SCROLL_DATA:                         ; [$a1dd]
    .byte $ff                               ; [0]:
    .byte $ff                               ; [1]:
    .byte $ff                               ; [2]:
    .byte $ff                               ; [3]:
    .byte $ff                               ; [4]:
    .byte $02                               ; [5]:
    .byte $ff                               ; [6]:
    .byte $06                               ; [7]:
    .byte $13                               ; [8]:
    .byte $03                               ; [9]:
    .byte $11                               ; [10]:
    .byte $07                               ; [11]:
    .byte $02                               ; [12]:
    .byte $04                               ; [13]:
    .byte $10                               ; [14]:
    .byte $ff                               ; [15]:
    .byte $03                               ; [16]:
    .byte $05                               ; [17]:
    .byte $12                               ; [18]:
    .byte $08                               ; [19]:
    .byte $04                               ; [20]:
    .byte $0f                               ; [21]:
    .byte $0f                               ; [22]:
    .byte $09                               ; [23]:
    .byte $09                               ; [24]:
    .byte $07                               ; [25]:
    .byte $01                               ; [26]:
    .byte $0a                               ; [27]:
    .byte $06                               ; [28]:
    .byte $ff                               ; [29]:
    .byte $02                               ; [30]:
    .byte $0b                               ; [31]:
    .byte $ff                               ; [32]:
    .byte $09                               ; [33]:
    .byte $04                               ; [34]:
    .byte $0d                               ; [35]:
    .byte $08                               ; [36]:
    .byte $06                               ; [37]:
    .byte $05                               ; [38]:
    .byte $0e                               ; [39]:
    .byte $0e                               ; [40]:
    .byte $0b                               ; [41]:
    .byte $06                               ; [42]:
    .byte $0f                               ; [43]:
    .byte $0a                               ; [44]:
    .byte $0c                               ; [45]:
    .byte $07                               ; [46]:
    .byte $10                               ; [47]:
    .byte $0b                               ; [48]:
    .byte $0d                               ; [49]:
    .byte $13                               ; [50]:
    .byte $11                               ; [51]:
    .byte $0c                               ; [52]:
    .byte $0e                               ; [53]:
    .byte $08                               ; [54]:
    .byte $12                               ; [55]:
    .byte $0d                               ; [56]:
    .byte $0a                               ; [57]:
    .byte $09                               ; [58]:
    .byte $13                               ; [59]:
    .byte $05                               ; [60]:
    .byte $10                               ; [61]:
    .byte $0a                               ; [62]:
    .byte $05                               ; [63]:
    .byte $0f                               ; [64]:
    .byte $11                               ; [65]:
    .byte $0b                               ; [66]:
    .byte $03                               ; [67]:
    .byte $10                               ; [68]:
    .byte $12                               ; [69]:
    .byte $13                               ; [70]:
    .byte $02                               ; [71]:
    .byte $11                               ; [72]:
    .byte $13                               ; [73]:
    .byte $0d                               ; [74]:
    .byte $04                               ; [75]:
    .byte $12                               ; [76]:
    .byte $02                               ; [77]:
    .byte $0e                               ; [78]:
    .byte $0c                               ; [79]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a04f]
;
ZENITH_DOOR_LOCATIONS:                      ; [$a22d]
    .byte $01                               ; [0]:
    .byte $60                               ; [1]:
    .byte $00                               ; [2]:
    .byte $6e                               ; [3]:
    .byte $08                               ; [4]:
    .byte $a1                               ; [5]:
    .byte $fe                               ; [6]:
    .byte $ad                               ; [7]:
    .byte $ff                               ; [8]:

;
; XREFS:
;     ZENITH_AREA_DATA [$PRG3::a051]
;
ZENITH_DOOR_DESTINATIONS:                   ; [$a236]
    .byte $00,$0f,$00,$00,$00,$3f,$00,$90   ; [$a236] undefined
    .byte $00,$00,$00,$00,$00,$57,$00,$e1   ; [$a23e] undefined
    .byte $00,$00,$00,$00,$00,$b3,$00,$84   ; [$a246] undefined
    .byte $00,$00,$00,$00,$00,$64,$00,$48   ; [$a24e] undefined
    .byte $00,$00,$00,$00,$00,$ba,$00,$ac   ; [$a256] undefined
    .byte $00,$00,$00,$00,$00,$bc,$00,$e9   ; [$a25e] undefined
    .byte $00,$00,$00,$00,$00,$fd,$00,$40   ; [$a266] undefined
    .byte $00,$00,$00,$00,$00,$96,$00,$00   ; [$a26e] undefined
    .byte $00,$00,$00,$00,$00,$c7,$00,$06   ; [$a276] undefined
    .byte $00,$00,$00,$00,$00,$56,$00,$84   ; [$a27e] undefined
    .byte $00,$00,$00,$00,$00,$58,$00,$16   ; [$a286] undefined
    .byte $00,$00,$00,$00,$00,$90,$00,$0a   ; [$a28e] undefined
    .byte $00,$00,$00,$00,$00,$b5,$00,$80   ; [$a296] undefined
    .byte $00,$00,$00,$00,$00,$1e,$00,$25   ; [$a29e] undefined
    .byte $00,$00,$00,$00,$00,$0a,$20,$00   ; [$a2a6] undefined
    .byte $00,$00,$00,$00,$00,$2b,$10,$40   ; [$a2ae] undefined
    .byte $00,$00,$00,$00,$00,$d9,$00,$00   ; [$a2b6] undefined
    .byte $00,$00,$00,$00,$00,$6b,$00,$00   ; [$a2be] undefined
    .byte $00,$00,$00,$00,$00,$78,$00,$6c   ; [$a2c6] undefined
    .byte $00,$00,$00,$00,$00,$3c,$00,$00   ; [$a2ce] undefined
    .byte $00,$00,$00,$00,$00,$85,$01,$00   ; [$a2d6] undefined
    .byte $00,$00,$00,$00,$00,$de,$00,$64   ; [$a2de] undefined
    .byte $00,$00,$00,$00,$00,$98,$00,$10   ; [$a2e6] undefined
    .byte $00,$00,$00,$00,$00,$18,$00,$04   ; [$a2ee] undefined
    .byte $00,$00,$00,$00,$00,$3c,$00,$00   ; [$a2f6] undefined
    .byte $00,$00,$00,$00,$00,$bd,$00,$b2   ; [$a2fe] undefined
    .byte $00,$00,$00,$00,$00,$97,$00,$09   ; [$a306] undefined
    .byte $00,$00,$00,$00,$00,$c3,$00,$b2   ; [$a30e] undefined
    .byte $00,$00,$00,$00,$00,$ca,$00,$21   ; [$a316] undefined
    .byte $00,$00,$00,$00,$00,$1b,$00,$4a   ; [$a31e] undefined
    .byte $00,$00,$00,$00,$00,$93,$00,$89   ; [$a326] undefined
    .byte $00,$00,$00,$00,$00,$77,$00,$01   ; [$a32e] undefined
    .byte $00,$00,$00,$00,$00,$7e,$00,$44   ; [$a336] undefined
    .byte $00,$00,$00,$00,$00,$b7,$00,$3f   ; [$a33e] undefined
    .byte $00,$00,$00,$00,$00,$5a,$00,$30   ; [$a346] undefined
    .byte $00,$00,$00,$00,$00,$6d,$00,$51   ; [$a34e] undefined
    .byte $00,$00,$00,$00,$00,$6c,$00,$00   ; [$a356] undefined
    .byte $00,$00,$00,$00,$00,$d3,$00,$c0   ; [$a35e] undefined
    .byte $00,$00,$00,$00,$00,$0d,$00,$10   ; [$a366] undefined
    .byte $00,$00,$00,$00,$00,$74,$00,$20   ; [$a36e] undefined
    .byte $00,$00,$00,$00,$00,$85,$00,$01   ; [$a376] undefined
    .byte $00,$00,$00,$00,$00,$6d,$00,$4a   ; [$a37e] undefined
    .byte $00,$00,$00,$00,$00,$54,$00,$a0   ; [$a386] undefined
    .byte $00,$00,$00,$00,$00,$f8,$00,$00   ; [$a38e] undefined
    .byte $00,$00,$00,$00,$00,$b5,$01,$04   ; [$a396] undefined
    .byte $00,$00,$00,$00,$00,$16,$00,$0a   ; [$a39e] undefined
    .byte $00,$00,$00,$00,$00,$8f,$00,$10   ; [$a3a6] undefined
    .byte $00,$00,$00,$00,$00,$04,$01,$50   ; [$a3ae] undefined
    .byte $00,$00,$00,$00,$00,$58,$00,$c1   ; [$a3b6] undefined
    .byte $00,$00,$00,$00,$00,$0b,$00,$10   ; [$a3be] undefined
    .byte $00,$00,$00,$00,$00,$33,$00,$80   ; [$a3c6] undefined
    .byte $00,$00,$00,$00,$00,$9c,$00,$00   ; [$a3ce] undefined
    .byte $00,$00,$00,$00,$00,$ca,$00,$10   ; [$a3d6] undefined
    .byte $00,$00,$00,$00,$00,$1e,$00,$02   ; [$a3de] undefined
    .byte $00,$00,$00,$00,$00,$f8,$00,$02   ; [$a3e6] undefined
    .byte $00,$00,$00,$00,$00,$26,$04,$98   ; [$a3ee] undefined
    .byte $00,$00,$00,$00,$00,$21,$44,$20   ; [$a3f6] undefined
    .byte $00,$00,$00,$00,$00,$61,$00,$a1   ; [$a3fe] undefined
    .byte $00,$00,$00,$00,$00,$c5,$00,$32   ; [$a406] undefined
    .byte $00,$00,$00,$00,$00,$97,$00,$10   ; [$a40e] undefined
    .byte $00,$00,$00,$00,$00,$76,$00,$05   ; [$a416] undefined
    .byte $00,$00,$00,$00,$00,$b9,$00,$80   ; [$a41e] undefined
    .byte $00,$00,$00,$00,$00,$c3,$80,$08   ; [$a426] undefined
    .byte $00,$00,$00,$00,$00,$be,$00,$80   ; [$a42e] undefined
    .byte $00,$00,$00,$00,$00,$7c,$00,$03   ; [$a436] undefined
    .byte $00,$00,$00,$00,$00,$56,$00,$18   ; [$a43e] undefined
    .byte $00,$00,$00,$00,$00,$ac,$00,$12   ; [$a446] undefined
    .byte $00,$00,$00,$00,$00,$d6,$10,$00   ; [$a44e] undefined
    .byte $00,$00,$00,$00,$00,$9c,$88,$8e   ; [$a456] undefined
    .byte $00,$00,$00,$00,$00,$f7,$00,$13   ; [$a45e] undefined
    .byte $00,$00,$00,$00,$00,$dd,$00,$d0   ; [$a466] undefined
    .byte $00,$00,$00,$00,$00,$7f,$00,$10   ; [$a46e] undefined
    .byte $00,$00,$00,$00,$00,$60,$00,$14   ; [$a476] undefined
    .byte $00,$00,$00,$00,$00,$ed,$00,$11   ; [$a47e] undefined
    .byte $00,$00,$00,$00,$00,$47,$00,$44   ; [$a486] undefined
    .byte $00,$00,$00,$00,$00,$25,$00,$42   ; [$a48e] undefined
    .byte $00,$00,$00,$00,$00,$ce,$80,$a0   ; [$a496] undefined
    .byte $00,$00,$00,$00,$00,$05,$00,$00   ; [$a49e] undefined
    .byte $00,$00,$00,$00,$00,$6a,$00,$0d   ; [$a4a6] undefined
    .byte $00,$00,$00,$00,$00,$61,$80,$10   ; [$a4ae] undefined
    .byte $00,$00,$00,$00,$00,$12,$00,$40   ; [$a4b6] undefined
    .byte $00,$00,$00,$00,$00,$0e,$00,$39   ; [$a4be] undefined
    .byte $00,$00,$00,$00,$00,$7e,$00,$0c   ; [$a4c6] undefined
    .byte $00,$00,$00,$00,$00,$43,$20,$10   ; [$a4ce] undefined
    .byte $00,$00,$00,$00,$00,$02,$00,$49   ; [$a4d6] undefined
    .byte $00,$00,$00,$00,$00,$39,$00,$10   ; [$a4de] undefined
    .byte $00,$00,$00,$00,$00,$62,$00,$02   ; [$a4e6] undefined
    .byte $00,$00,$00,$00,$00,$42,$00,$01   ; [$a4ee] undefined
    .byte $00,$00,$00,$00,$00,$10,$00,$00   ; [$a4f6] undefined
    .byte $00,$00,$00,$00,$00,$1e,$00,$94   ; [$a4fe] undefined
    .byte $00,$00,$00,$00,$00,$ab,$00,$22   ; [$a506] undefined
    .byte $00,$00,$00,$00,$00,$ee,$00,$94   ; [$a50e] undefined
    .byte $00,$00,$00,$00,$00,$5a,$00,$a2   ; [$a516] undefined
    .byte $00,$00,$00,$00,$00,$19,$00,$40   ; [$a51e] undefined
    .byte $00,$00,$00,$00,$00,$69,$00,$00   ; [$a526] undefined
    .byte $00,$00,$00,$00,$00,$eb,$00,$64   ; [$a52e] undefined
    .byte $00,$00,$00,$00,$00,$75,$00,$82   ; [$a536] undefined
    .byte $00,$00,$00,$00,$00,$1f,$00,$a2   ; [$a53e] undefined
    .byte $00,$00,$00,$00,$00,$df,$00,$19   ; [$a546] undefined
    .byte $00,$00,$00,$00,$00,$ae,$00,$28   ; [$a54e] undefined
    .byte $00,$00,$00,$00,$00,$95,$10,$21   ; [$a556] undefined
    .byte $00,$00,$00,$00,$00,$cd,$00,$12   ; [$a55e] undefined
    .byte $00,$00,$00,$00,$00,$ed,$00,$12   ; [$a566] undefined
    .byte $00,$00,$00,$00,$00,$0f,$00,$81   ; [$a56e] undefined
    .byte $00,$00,$00,$00,$00,$75,$03,$30   ; [$a576] undefined
    .byte $00,$00,$00,$00,$00,$55,$02,$80   ; [$a57e] undefined
    .byte $00,$00,$00,$00,$00,$7c,$00,$0a   ; [$a586] undefined
    .byte $00,$00,$00,$00,$00,$fd,$00,$91   ; [$a58e] undefined
    .byte $00,$00,$00,$00,$00,$57,$00,$44   ; [$a596] undefined
    .byte $00,$00,$00,$00,$00,$de,$10,$02   ; [$a59e] undefined
    .byte $00,$00,$00,$00,$00,$51,$00,$04   ; [$a5a6] undefined
    .byte $00,$00,$00,$00,$00,$c6,$00,$91   ; [$a5ae] undefined
    .byte $00,$00,$00,$00,$00,$c9,$10,$21   ; [$a5b6] undefined
    .byte $00,$00,$00,$00,$00,$7e,$00,$3c   ; [$a5be] undefined
    .byte $00,$00,$00,$00,$00,$70,$00,$00   ; [$a5c6] undefined
    .byte $00,$00,$00,$00,$00,$2c,$00,$28   ; [$a5ce] undefined
    .byte $00,$00,$00,$00,$00,$20,$00,$00   ; [$a5d6] undefined
    .byte $00,$00,$00,$00,$00,$32,$00,$04   ; [$a5de] undefined
    .byte $00,$00,$00,$00,$00,$12,$00,$15   ; [$a5e6] undefined
    .byte $00,$00,$00,$00,$00,$d0,$00,$01   ; [$a5ee] undefined
    .byte $00,$00,$00,$00,$a0,$47,$01,$00   ; [$a5f6] undefined
    .byte $00,$00,$00,$00,$00,$4d,$00,$15   ; [$a5fe] undefined
    .byte $00,$00,$00,$00,$10,$bd,$00,$08   ; [$a606] undefined
    .byte $00,$00,$00,$00,$00,$41,$00,$80   ; [$a60e] undefined
    .byte $00,$00,$00,$00,$00,$64,$00,$49   ; [$a616] undefined
    .byte $00,$00,$00,$00,$00,$1f,$00,$49   ; [$a61e] undefined
    .byte $00,$00,$00,$00,$00,$06,$00,$12   ; [$a626] undefined
    .byte $00,$00,$00,$00,$00,$e7,$00,$05   ; [$a62e] undefined
    .byte $00,$00,$00,$00,$00,$c5,$00,$47   ; [$a636] undefined
    .byte $00,$00,$00,$00,$00,$9f,$80,$a5   ; [$a63e] undefined
    .byte $00,$00,$00,$00,$00,$5a,$80,$06   ; [$a646] undefined
    .byte $00,$00,$00,$00,$00,$7e,$00,$00   ; [$a64e] undefined
    .byte $00,$00,$00,$00,$00,$a0,$00,$21   ; [$a656] undefined
    .byte $00,$00,$00,$00,$20,$7b,$00,$80   ; [$a65e] undefined
    .byte $00,$00,$00,$00,$00,$96,$00,$12   ; [$a666] undefined
    .byte $00,$00,$00,$00,$00,$d0,$40,$00   ; [$a66e] undefined
    .byte $00,$00,$00,$00,$00,$12,$00,$01   ; [$a676] undefined
    .byte $00,$00,$00,$00,$00,$5b,$00,$50   ; [$a67e] undefined
    .byte $00,$00,$00,$00,$00,$b2,$00,$00   ; [$a686] undefined
    .byte $00,$00,$00,$00,$00,$0d,$00,$04   ; [$a68e] undefined
    .byte $00,$00,$00,$00,$00,$ab,$00,$01   ; [$a696] undefined
    .byte $00,$00,$00,$00,$00,$0b,$00,$40   ; [$a69e] undefined
    .byte $00,$00,$00,$00,$00,$63,$00,$00   ; [$a6a6] undefined
    .byte $00,$00,$00,$00,$00,$b1,$16,$00   ; [$a6ae] undefined
    .byte $00,$00,$00,$00,$00,$43,$40,$81   ; [$a6b6] undefined
    .byte $00,$00,$00,$00,$00,$7d,$80,$14   ; [$a6be] undefined
    .byte $00,$00,$00,$00,$00,$ef,$00,$60   ; [$a6c6] undefined
    .byte $00,$00,$00,$00,$00,$a0,$00,$02   ; [$a6ce] undefined
    .byte $00,$00,$00,$00,$00,$61,$41,$04   ; [$a6d6] undefined
    .byte $00,$00,$00,$00,$00,$dd,$00,$41   ; [$a6de] undefined
    .byte $00,$00,$00,$00,$00,$06,$00,$44   ; [$a6e6] undefined
    .byte $00,$00,$00,$00,$00,$9a,$00,$84   ; [$a6ee] undefined
    .byte $00,$00,$00,$00,$00,$4b,$11,$10   ; [$a6f6] undefined
    .byte $00,$00,$00,$00,$00,$67,$00,$04   ; [$a6fe] undefined
    .byte $00,$00,$00,$00,$00,$e6,$20,$01   ; [$a706] undefined
    .byte $00,$00,$00,$00,$00,$fd,$02,$53   ; [$a70e] undefined
    .byte $00,$00,$00,$00,$00,$5c,$10,$40   ; [$a716] undefined
    .byte $00,$00,$00,$00,$00,$d9,$00,$00   ; [$a71e] undefined
    .byte $00,$00,$00,$00,$00,$0f,$00,$0a   ; [$a726] undefined
    .byte $00,$00,$00,$00,$00,$7b,$00,$8f   ; [$a72e] undefined
    .byte $00,$00,$00,$00,$00,$c9,$00,$08   ; [$a736] undefined
    .byte $00,$00,$00,$00,$00,$36,$00,$68   ; [$a73e] undefined
    .byte $00,$00,$00,$00,$00,$5a,$80,$5c   ; [$a746] undefined
    .byte $00,$00,$00,$00,$00,$24,$00,$48   ; [$a74e] undefined
    .byte $00,$00,$00,$00,$00,$72,$00,$03   ; [$a756] undefined
    .byte $00,$00,$00,$00,$00,$5f,$00,$8a   ; [$a75e] undefined
    .byte $00,$00,$00,$00,$00,$57,$00,$25   ; [$a766] undefined
    .byte $00,$00,$00,$00,$80,$fc,$00,$44   ; [$a76e] undefined
    .byte $00,$00,$00,$00,$00,$ae,$00,$ba   ; [$a776] undefined
    .byte $00,$00,$00,$00,$00,$36,$00,$40   ; [$a77e] undefined
    .byte $00,$00,$00,$00,$00,$ea,$00,$00   ; [$a786] undefined
    .byte $00,$00,$00,$00,$00,$76,$00,$40   ; [$a78e] undefined
    .byte $00,$00,$00,$00,$00,$cf,$10,$48   ; [$a796] undefined
    .byte $00,$00,$00,$00,$00,$1f,$00,$03   ; [$a79e] undefined
    .byte $00,$00,$00,$00,$00,$32,$00,$b0   ; [$a7a6] undefined
    .byte $00,$00,$00,$00,$00,$fa,$00,$50   ; [$a7ae] undefined
    .byte $00,$00,$00,$00,$00,$d5,$80,$00   ; [$a7b6] undefined
    .byte $00,$00,$00,$00,$00,$7a,$04,$80   ; [$a7be] undefined
    .byte $00,$00,$00,$00,$00,$9b,$00,$80   ; [$a7c6] undefined
    .byte $00,$00,$00,$00,$00,$59,$00,$50   ; [$a7ce] undefined
    .byte $00,$00,$00,$00,$00,$10,$84,$07   ; [$a7d6] undefined
    .byte $00,$00,$00,$00,$00,$95,$00,$00   ; [$a7de] undefined
    .byte $00,$00,$00,$00,$00,$91,$00,$00   ; [$a7e6] undefined
    .byte $00,$00,$00,$00,$00,$e4,$00,$00   ; [$a7ee] undefined
    .byte $00,$00,$00,$00,$04,$d1,$80,$20   ; [$a7f6] undefined
    .byte $00,$00,$00,$00,$00,$3c,$00,$45   ; [$a7fe] undefined
    .byte $00,$00,$00,$00,$00,$ab,$00,$2e   ; [$a806] undefined
    .byte $00,$00,$00,$00,$00,$eb,$00,$9c   ; [$a80e] undefined
    .byte $00,$00,$00,$00,$00,$77,$00,$0e   ; [$a816] undefined
    .byte $00,$00,$00,$00,$00,$6e,$00,$2a   ; [$a81e] undefined
    .byte $00,$00,$00,$00,$00,$fa,$84,$e8   ; [$a826] undefined
    .byte $00,$00,$00,$00,$00,$72,$00,$35   ; [$a82e] undefined
    .byte $00,$00,$00,$00,$00,$62,$00,$00   ; [$a836] undefined
    .byte $00,$00,$00,$00,$00,$be,$00,$42   ; [$a83e] undefined
    .byte $00,$00,$00,$00,$00,$7d,$00,$21   ; [$a846] undefined
    .byte $00,$00,$00,$00,$00,$4d,$40,$00   ; [$a84e] undefined
    .byte $00,$00,$00,$00,$00,$bf,$00,$61   ; [$a856] undefined
    .byte $00,$00,$00,$00,$00,$36,$00,$14   ; [$a85e] undefined
    .byte $00,$00,$00,$00,$00,$4a,$00,$01   ; [$a866] undefined
    .byte $00,$00,$00,$00,$00,$ab,$00,$21   ; [$a86e] undefined
    .byte $00,$00,$00,$00,$00,$0f,$00,$19   ; [$a876] undefined
    .byte $00,$00,$00,$00,$00,$dd,$00,$2a   ; [$a87e] undefined
    .byte $00,$00,$00,$00,$00,$ed,$00,$a8   ; [$a886] undefined
    .byte $00,$00,$00,$00,$00,$1e,$00,$80   ; [$a88e] undefined
    .byte $00,$00,$00,$00,$00,$aa,$00,$01   ; [$a896] undefined
    .byte $00,$00,$00,$00,$00,$9b,$00,$16   ; [$a89e] undefined
    .byte $00,$00,$00,$00,$00,$70,$00,$a0   ; [$a8a6] undefined
    .byte $00,$00,$00,$00,$00,$98,$00,$21   ; [$a8ae] undefined
    .byte $00,$00,$00,$00,$00,$ca,$00,$21   ; [$a8b6] undefined
    .byte $00,$00,$00,$00,$00,$f1,$00,$99   ; [$a8be] undefined
    .byte $00,$00,$00,$00,$00,$31,$00,$00   ; [$a8c6] undefined
    .byte $00,$00,$00,$00,$00,$b0,$00,$00   ; [$a8ce] undefined
    .byte $00,$00,$00,$00,$00,$41,$02,$08   ; [$a8d6] undefined
    .byte $00,$00,$00,$00,$00,$fc,$00,$09   ; [$a8de] undefined
    .byte $00,$00,$00,$00,$00,$a9,$00,$01   ; [$a8e6] undefined
    .byte $00,$00,$00,$00,$00,$14,$00,$00   ; [$a8ee] undefined
    .byte $00,$00,$00,$00,$00,$7a,$00,$00   ; [$a8f6] undefined
    .byte $00,$00,$00,$00,$00,$dd,$00,$06   ; [$a8fe] undefined
    .byte $00,$00,$00,$00,$00,$62,$00,$e2   ; [$a906] undefined
    .byte $00,$00,$00,$00,$00,$1b,$00,$00   ; [$a90e] undefined
    .byte $00,$00,$00,$00,$00,$ff,$00,$01   ; [$a916] undefined
    .byte $00,$00,$00,$00,$00,$b3,$00,$5c   ; [$a91e] undefined
    .byte $00,$00,$00,$00,$00,$5c,$00,$00   ; [$a926] undefined
    .byte $00,$00,$00,$00,$00,$17,$00,$31   ; [$a92e] undefined
    .byte $00,$00,$00,$00,$00,$8f,$04,$02   ; [$a936] undefined
    .byte $00,$00,$00,$00,$00,$7d,$00,$ab   ; [$a93e] undefined
    .byte $00,$00,$00,$00,$00,$6f,$00,$80   ; [$a946] undefined
    .byte $00,$00,$00,$00,$00,$f3,$00,$c3   ; [$a94e] undefined
    .byte $00,$00,$00,$00,$00,$d0,$00,$00   ; [$a956] undefined
    .byte $00,$00,$00,$00,$00,$bf,$00,$01   ; [$a95e] undefined
    .byte $00,$00,$00,$00,$00,$61,$80,$1a   ; [$a966] undefined
    .byte $00,$00,$00,$00,$00,$be,$00,$00   ; [$a96e] undefined
    .byte $00,$00,$00,$00,$00,$30,$08,$18   ; [$a976] undefined
    .byte $00,$00,$00,$00,$00,$ff,$00,$00   ; [$a97e] undefined
    .byte $00,$00,$00,$00,$00,$eb,$00,$50   ; [$a986] undefined
    .byte $00,$00,$00,$00,$00,$76,$00,$12   ; [$a98e] undefined
    .byte $00,$00,$00,$00,$00,$75,$00,$00   ; [$a996] undefined
    .byte $00,$00,$00,$00,$00,$60,$00,$9c   ; [$a99e] undefined
    .byte $00,$00,$00,$00,$00,$f9,$00,$0c   ; [$a9a6] undefined
    .byte $00,$00,$00,$00,$00,$29,$20,$00   ; [$a9ae] undefined
    .byte $00,$00,$00,$00,$00,$2c,$00,$a0   ; [$a9b6] undefined
    .byte $00,$00,$00,$00,$00,$69,$00,$40   ; [$a9be] undefined
    .byte $00,$00,$00,$00,$00,$13,$00,$12   ; [$a9c6] undefined
    .byte $00,$00,$00,$00,$00,$84,$08,$04   ; [$a9ce] undefined
    .byte $00,$00,$00,$00,$00,$0a,$00,$08   ; [$a9d6] undefined
    .byte $00,$00,$00,$00,$00,$3c,$00,$1e   ; [$a9de] undefined
    .byte $00,$00,$00,$00,$00,$de,$01,$10   ; [$a9e6] undefined
    .byte $00,$00,$00,$00,$00,$06,$20,$09   ; [$a9ee] undefined
    .byte $00,$00,$00,$00,$00,$4c,$00,$42   ; [$a9f6] undefined
    .byte $00,$00,$00,$00,$00,$32,$00,$04   ; [$a9fe] undefined
    .byte $00,$00,$00,$00,$00,$de,$00,$26   ; [$aa06] undefined
    .byte $00,$00,$00,$00,$00,$f8,$00,$b4   ; [$aa0e] undefined
    .byte $00,$00,$00,$00,$00,$f9,$04,$e7   ; [$aa16] undefined
    .byte $00,$00,$00,$00,$00,$6e,$80,$10   ; [$aa1e] undefined
    .byte $00,$00,$00,$00,$00,$96,$00,$01   ; [$aa26] undefined
    .byte $00,$00,$00,$00,$00,$aa,$00,$38   ; [$aa2e] undefined
    .byte $00,$00,$00,$00,$00,$16,$00,$27   ; [$aa36] undefined
    .byte $00,$00,$00,$00,$00,$f8,$00,$84   ; [$aa3e] undefined
    .byte $00,$00,$00,$00,$00,$da,$00,$28   ; [$aa46] undefined
    .byte $00,$00,$00,$00,$00,$d1,$00,$31   ; [$aa4e] undefined
    .byte $00,$00,$00,$00,$00,$e2,$00,$82   ; [$aa56] undefined
    .byte $00,$00,$00,$00,$00,$b1,$00,$31   ; [$aa5e] undefined
    .byte $00,$00,$00,$00,$00,$06,$00,$04   ; [$aa66] undefined
    .byte $00,$00,$00,$00,$00,$57,$00,$46   ; [$aa6e] undefined
    .byte $00,$00,$00,$00,$00,$0c,$00,$64   ; [$aa76] undefined
    .byte $00,$00,$00,$00,$00,$bd,$00,$29   ; [$aa7e] undefined
    .byte $00,$00,$00,$00,$00,$3c,$02,$15   ; [$aa86] undefined
    .byte $00,$00,$00,$00,$00,$02,$00,$48   ; [$aa8e] undefined
    .byte $00,$00,$00,$00,$00,$40,$01,$40   ; [$aa96] undefined
    .byte $00,$00,$00,$00,$00,$c7,$00,$80   ; [$aa9e] undefined
    .byte $00,$00,$00,$00,$00,$3a,$00,$08   ; [$aaa6] undefined
    .byte $00,$00,$00,$00,$00,$0c,$08,$00   ; [$aaae] undefined
    .byte $00,$00,$00,$00,$00,$66,$14,$01   ; [$aab6] undefined
    .byte $00,$00,$00,$00,$00,$7a,$00,$a2   ; [$aabe] undefined
    .byte $00,$00,$00,$00,$00,$39,$00,$04   ; [$aac6] undefined
    .byte $00,$00,$00,$00,$00,$fc,$00,$42   ; [$aace] undefined
    .byte $00,$00,$00,$00,$00,$d6,$05,$20   ; [$aad6] undefined
    .byte $00,$00,$00,$00,$00,$df,$00,$20   ; [$aade] undefined
    .byte $00,$00,$00,$00,$00,$49,$00,$00   ; [$aae6] undefined
    .byte $00,$00,$00,$00,$00,$9e,$00,$00   ; [$aaee] undefined
    .byte $00,$00,$00,$00,$00,$e1,$c0,$00   ; [$aaf6] undefined
    .byte $00,$00,$00,$00,$00,$0b,$00,$01   ; [$aafe] undefined
    .byte $00,$00,$00,$00,$00,$7b,$00,$a4   ; [$ab06] undefined
    .byte $00,$00,$00,$00,$00,$36,$00,$32   ; [$ab0e] undefined
    .byte $00,$00,$00,$00,$00,$07,$00,$08   ; [$ab16] undefined
    .byte $00,$00,$00,$00,$00,$af,$00,$81   ; [$ab1e] undefined
    .byte $00,$00,$00,$00,$00,$9e,$00,$00   ; [$ab26] undefined
    .byte $00,$00,$00,$00,$00,$8e,$20,$22   ; [$ab2e] undefined
    .byte $00,$00,$00,$00,$00,$f5,$02,$70   ; [$ab36] undefined
    .byte $00,$00,$00,$00,$00,$fc,$00,$5d   ; [$ab3e] undefined
    .byte $00,$00,$00,$00,$00,$f3,$02,$b8   ; [$ab46] undefined
    .byte $00,$00,$00,$00,$00,$a9,$00,$04   ; [$ab4e] undefined
    .byte $00,$00,$00,$00,$00,$d5,$00,$18   ; [$ab56] undefined
    .byte $00,$00,$00,$00,$00,$27,$00,$35   ; [$ab5e] undefined
    .byte $00,$00,$00,$00,$00,$d0,$00,$34   ; [$ab66] undefined
    .byte $00,$00,$00,$00,$02,$ed,$00,$38   ; [$ab6e] undefined
    .byte $00,$00,$00,$00,$00,$c1,$04,$01   ; [$ab76] undefined
    .byte $00,$00,$00,$00,$00,$4f,$00,$15   ; [$ab7e] undefined
    .byte $00,$00,$00,$00,$00,$96,$10,$28   ; [$ab86] undefined
    .byte $00,$00,$00,$00,$00,$c6,$00,$20   ; [$ab8e] undefined
    .byte $00,$00,$00,$00,$00,$40,$00,$47   ; [$ab96] undefined
    .byte $00,$00,$00,$00,$00,$ef,$00,$00   ; [$ab9e] undefined
    .byte $00,$00,$00,$00,$00,$4f,$00,$04   ; [$aba6] undefined
    .byte $00,$00,$00,$00,$00,$a5,$00,$00   ; [$abae] undefined
    .byte $00,$00,$00,$00,$40,$a0,$08,$01   ; [$abb6] undefined
    .byte $00,$00,$00,$00,$00,$3b,$00,$88   ; [$abbe] undefined
    .byte $00,$00,$00,$00,$00,$54,$00,$d0   ; [$abc6] undefined
    .byte $00,$00,$00,$00,$00,$a6,$00,$48   ; [$abce] undefined
    .byte $00,$00,$00,$00,$00,$26,$00,$01   ; [$abd6] undefined
    .byte $00,$00,$00,$00,$00,$2c,$00,$b1   ; [$abde] undefined
    .byte $00,$00,$00,$00,$00,$b2,$00,$01   ; [$abe6] undefined
    .byte $00,$00,$00,$00,$00,$b5,$00,$44   ; [$abee] undefined
    .byte $00,$00,$00,$00,$40,$25,$00,$00   ; [$abf6] undefined
    .byte $00,$00,$00,$00,$00,$bd,$20,$04   ; [$abfe] undefined
    .byte $00,$00,$00,$00,$00,$9e,$04,$07   ; [$ac06] undefined
    .byte $00,$00,$00,$00,$00,$e5,$00,$18   ; [$ac0e] undefined
    .byte $00,$00,$00,$00,$00,$8d,$00,$b1   ; [$ac16] undefined
    .byte $00,$00,$00,$00,$00,$16,$00,$92   ; [$ac1e] undefined
    .byte $00,$00,$00,$00,$00,$87,$00,$42   ; [$ac26] undefined
    .byte $00,$00,$00,$00,$00,$fc,$00,$31   ; [$ac2e] undefined
    .byte $00,$00,$00,$00,$00,$37,$00,$01   ; [$ac36] undefined
    .byte $00,$00,$00,$00,$00,$b7,$00,$e0   ; [$ac3e] undefined
    .byte $00,$00,$00,$00,$00,$fd,$20,$40   ; [$ac46] undefined
    .byte $00,$00,$00,$00,$00,$9d,$00,$a8   ; [$ac4e] undefined
    .byte $00,$00,$00,$00,$00,$da,$00,$00   ; [$ac56] undefined
    .byte $00,$00,$00,$00,$00,$96,$00,$28   ; [$ac5e] undefined
    .byte $00,$00,$00,$00,$00,$2b,$00,$52   ; [$ac66] undefined
    .byte $00,$00,$00,$00,$00,$a9,$00,$a2   ; [$ac6e] undefined
    .byte $00,$00,$00,$00,$00,$62,$00,$10   ; [$ac76] undefined
    .byte $00,$00,$00,$00,$00,$74,$00,$19   ; [$ac7e] undefined
    .byte $00,$00,$00,$00,$00,$25,$40,$30   ; [$ac86] undefined
    .byte $00,$00,$00,$00,$00,$3b,$00,$a1   ; [$ac8e] undefined
    .byte $00,$00,$00,$00,$00,$ff,$00,$40   ; [$ac96] undefined
    .byte $00,$00,$00,$00,$00,$e9,$00,$06   ; [$ac9e] undefined
    .byte $00,$00,$00,$00,$00,$ee,$00,$00   ; [$aca6] undefined
    .byte $00,$00,$00,$00,$00,$31,$22,$60   ; [$acae] undefined
    .byte $00,$00,$00,$00,$00,$11,$00,$c0   ; [$acb6] undefined
    .byte $00,$00,$00,$00,$00,$e9,$00,$aa   ; [$acbe] undefined
    .byte $00,$00,$00,$00,$00,$24,$00,$00   ; [$acc6] undefined
    .byte $00,$00,$00,$00,$00,$81,$00,$00   ; [$acce] undefined
    .byte $00,$00,$00,$00,$00,$c2,$04,$00   ; [$acd6] undefined
    .byte $00,$00,$00,$00,$00,$b6,$00,$c0   ; [$acde] undefined
    .byte $00,$00,$00,$00,$00,$aa,$08,$08   ; [$ace6] undefined
    .byte $00,$00,$00,$00,$00,$5c,$00,$05   ; [$acee] undefined
    .byte $00,$00,$00,$00,$00,$3c,$20,$11   ; [$acf6] undefined
    .byte $00,$00,$00,$00,$00,$52,$00,$5a   ; [$acfe] undefined
    .byte $00,$00,$00,$00,$00,$4f,$00,$0c   ; [$ad06] undefined
    .byte $00,$00,$00,$00,$00,$f3,$00,$42   ; [$ad0e] undefined
    .byte $00,$00,$00,$00,$00,$f1,$00,$a4   ; [$ad16] undefined
    .byte $00,$00,$00,$00,$00,$56,$00,$be   ; [$ad1e] undefined
    .byte $00,$00,$00,$00,$10,$15,$00,$17   ; [$ad26] undefined
    .byte $00,$00,$00,$00,$00,$bf,$00,$94   ; [$ad2e] undefined
    .byte $00,$00,$00,$00,$00,$6a,$00,$54   ; [$ad36] undefined
    .byte $00,$00,$00,$00,$00,$fe,$00,$90   ; [$ad3e] undefined
    .byte $00,$00,$00,$00,$00,$72,$00,$02   ; [$ad46] undefined
    .byte $00,$00,$00,$00,$00,$5c,$00,$82   ; [$ad4e] undefined
    .byte $00,$00,$00,$00,$00,$67,$02,$00   ; [$ad56] undefined
    .byte $00,$00,$00,$00,$00,$9f,$00,$01   ; [$ad5e] undefined
    .byte $00,$00,$00,$00,$00,$be,$00,$44   ; [$ad66] undefined
    .byte $00,$00,$00,$00,$00,$1a,$14,$00   ; [$ad6e] undefined
    .byte $00,$00,$00,$00,$00,$d0,$10,$0a   ; [$ad76] undefined
    .byte $00,$00,$00,$00,$00,$b6,$00,$12   ; [$ad7e] undefined
    .byte $00,$00,$00,$00,$00,$7d,$00,$30   ; [$ad86] undefined
    .byte $00,$00,$00,$00,$00,$a1,$00,$04   ; [$ad8e] undefined
    .byte $00,$00,$00,$00,$00,$29,$20,$00   ; [$ad96] undefined
    .byte $00,$00,$00,$00,$00,$fe,$00,$4c   ; [$ad9e] undefined
    .byte $00,$00,$00,$00,$00,$04,$08,$00   ; [$ada6] undefined
    .byte $00,$00,$00,$00,$00,$57,$00,$00   ; [$adae] undefined
    .byte $00,$00,$00,$00,$00,$20,$00,$02   ; [$adb6] undefined
    .byte $00,$00,$00,$00,$00,$8d,$00,$02   ; [$adbe] undefined
    .byte $00,$00,$00,$00,$00,$d8,$00,$04   ; [$adc6] undefined
    .byte $00,$00,$00,$00,$00,$52,$00,$05   ; [$adce] undefined
    .byte $00,$00,$00,$00,$10,$6f,$00,$44   ; [$add6] undefined
    .byte $00,$00,$00,$00,$00,$cf,$00,$00   ; [$adde] undefined
    .byte $00,$00,$00,$00,$80,$15,$00,$09   ; [$ade6] undefined
    .byte $00,$00,$00,$00,$00,$85,$08,$00   ; [$adee] undefined
    .byte $00,$00,$00,$00,$00,$d1,$00,$00   ; [$adf6] undefined
    .byte $00,$00,$00,$00,$00,$12,$00,$10   ; [$adfe] undefined
    .byte $00,$00,$00,$00,$00,$eb,$40,$52   ; [$ae06] undefined
    .byte $00,$00,$00,$00,$00,$d1,$00,$00   ; [$ae0e] undefined
    .byte $00,$00,$00,$00,$00,$c3,$00,$00   ; [$ae16] undefined
    .byte $00,$00,$00,$00,$00,$df,$00,$09   ; [$ae1e] undefined
    .byte $00,$00,$00,$00,$00,$9b,$00,$60   ; [$ae26] undefined
    .byte $00,$00,$00,$00,$00,$ed,$00,$60   ; [$ae2e] undefined
    .byte $00,$00,$00,$00,$00,$98,$00,$d0   ; [$ae36] undefined
    .byte $00,$00,$00,$00,$00,$b7,$00,$19   ; [$ae3e] undefined
    .byte $00,$00,$00,$00,$00,$3f,$00,$01   ; [$ae46] undefined
    .byte $00,$00,$00,$00,$00,$a0,$00,$80   ; [$ae4e] undefined
    .byte $00,$00,$00,$00,$00,$f1,$00,$24   ; [$ae56] undefined
    .byte $00,$00,$00,$00,$00,$1f,$00,$4b   ; [$ae5e] undefined
    .byte $00,$00,$00,$00,$00,$67,$00,$60   ; [$ae66] undefined
    .byte $00,$00,$00,$00,$00,$c0,$00,$10   ; [$ae6e] undefined
    .byte $00,$00,$00,$00,$00,$40,$00,$12   ; [$ae76] undefined
    .byte $00,$00,$00,$00,$00,$7b,$00,$50   ; [$ae7e] undefined
    .byte $00,$00,$00,$00,$00,$79,$20,$03   ; [$ae86] undefined
    .byte $00,$00,$00,$00,$00,$5b,$00,$02   ; [$ae8e] undefined
    .byte $00,$00,$00,$00,$00,$6e,$00,$00   ; [$ae96] undefined
    .byte $00,$00,$00,$00,$00,$c6,$00,$61   ; [$ae9e] undefined
    .byte $00,$00,$00,$00,$00,$47,$00,$12   ; [$aea6] undefined
    .byte $00,$00,$00,$00,$00,$b6,$84,$00   ; [$aeae] undefined
    .byte $00,$00,$00,$00,$00,$10,$81,$c2   ; [$aeb6] undefined
    .byte $00,$00,$00,$00,$00,$1a,$00,$71   ; [$aebe] undefined
    .byte $00,$00,$00,$00,$00,$84,$00,$40   ; [$aec6] undefined
    .byte $00,$00,$00,$00,$00,$25,$00,$00   ; [$aece] undefined
    .byte $00,$00,$00,$00,$00,$45,$00,$01   ; [$aed6] undefined
    .byte $00,$00,$00,$00,$00,$c9,$00,$33   ; [$aede] undefined
    .byte $00,$00,$00,$00,$00,$6a,$00,$88   ; [$aee6] undefined
    .byte $00,$00,$00,$00,$00,$4e,$40,$c0   ; [$aeee] undefined
    .byte $00,$00,$00,$00,$00,$57,$40,$00   ; [$aef6] undefined
    .byte $00,$00,$00,$00,$00,$3a,$00,$37   ; [$aefe] undefined
    .byte $00,$00,$00,$00,$00,$9f,$00,$50   ; [$af06] undefined
    .byte $00,$00,$00,$00,$00,$bc,$01,$c0   ; [$af0e] undefined
    .byte $00,$00,$00,$00,$00,$f0,$00,$29   ; [$af16] undefined
    .byte $00,$00,$00,$00,$00,$e3,$04,$07   ; [$af1e] undefined
    .byte $00,$00,$00,$00,$00,$ff,$00,$09   ; [$af26] undefined
    .byte $00,$00,$00,$00,$02,$1f,$00,$10   ; [$af2e] undefined
    .byte $00,$00,$00,$00,$00,$85,$00,$10   ; [$af36] undefined
    .byte $00,$00,$00,$00,$00,$a6,$00,$03   ; [$af3e] undefined
    .byte $00,$00,$00,$00,$00,$85,$40,$40   ; [$af46] undefined
    .byte $00,$00,$00,$00,$00,$77,$20,$40   ; [$af4e] undefined
    .byte $00,$00,$00,$00,$00,$cf,$00,$00   ; [$af56] undefined
    .byte $00,$00,$00,$00,$00,$7a,$01,$41   ; [$af5e] undefined
    .byte $00,$00,$00,$00,$00,$8e,$80,$00   ; [$af66] undefined
    .byte $00,$00,$00,$00,$00,$2b,$10,$00   ; [$af6e] undefined
    .byte $00,$00,$00,$00,$00,$38,$00,$0a   ; [$af76] undefined
    .byte $00,$00,$00,$00,$00,$3b,$00,$8e   ; [$af7e] undefined
    .byte $00,$00,$00,$00,$00,$18,$20,$41   ; [$af86] undefined
    .byte $00,$00,$00,$00,$00,$c9,$00,$09   ; [$af8e] undefined
    .byte $00,$00,$00,$00,$00,$73,$03,$00   ; [$af96] undefined
    .byte $00,$00,$00,$00,$00,$55,$00,$45   ; [$af9e] undefined
    .byte $00,$00,$00,$00,$00,$28,$00,$01   ; [$afa6] undefined
    .byte $00,$00,$00,$00,$00,$1c,$00,$00   ; [$afae] undefined
    .byte $00,$00,$00,$00,$00,$11,$00,$22   ; [$afb6] undefined
    .byte $00,$00,$00,$00,$00,$7f,$00,$80   ; [$afbe] undefined
    .byte $00,$00,$00,$00,$00,$1c,$01,$04   ; [$afc6] undefined
    .byte $00,$00,$00,$00,$00,$05,$00,$20   ; [$afce] undefined
    .byte $00,$00,$00,$00,$00,$6a,$80,$00   ; [$afd6] undefined
    .byte $00,$00,$00,$00,$00,$eb,$00,$d1   ; [$afde] undefined
    .byte $00,$00,$00,$00,$00,$80,$00,$40   ; [$afe6] undefined
    .byte $00,$00,$00,$00,$00,$89,$80,$10   ; [$afee] undefined
    .byte $00,$00,$00,$00,$00,$23,$40,$30   ; [$aff6] undefined
    .byte $00,$00,$04,$ff,$ff,$ff,$ef,$ff   ; [$affe] undefined
    .byte $df,$1c,$00,$ff,$7e,$ff,$ff,$ff   ; [$b006] undefined
    .byte $ff,$ae,$00,$ff,$3e,$ff,$ef,$ff   ; [$b00e] undefined
    .byte $bf,$fe,$00,$ff,$ee,$ff,$ff,$ff   ; [$b016] undefined
    .byte $ff,$bb,$00,$ff,$bf,$ff,$7f,$ff   ; [$b01e] undefined
    .byte $7f,$5f,$00,$ff,$7d,$ff,$ff,$ff   ; [$b026] undefined
    .byte $ff,$6a,$00,$ff,$df,$ff,$7f,$ff   ; [$b02e] undefined
    .byte $fa,$ed,$00,$ff,$ef,$ff,$db,$ff   ; [$b036] undefined
    .byte $7f,$ff,$00,$ff,$5c,$ff,$cf,$ff   ; [$b03e] undefined
    .byte $ff,$be,$00,$ff,$93,$ff,$f3,$ff   ; [$b046] undefined
    .byte $ff,$a0,$00,$ff,$bf,$ff,$ff,$ff   ; [$b04e] undefined
    .byte $f6,$e6,$00,$ff,$ff,$ff,$ff,$ff   ; [$b056] undefined
    .byte $ff,$6e,$00,$ff,$f9,$ff,$ff,$ff   ; [$b05e] undefined
    .byte $ef,$3f,$00,$ff,$5e,$ff,$ff,$ff   ; [$b066] undefined
    .byte $fb,$bc,$00,$ff,$4f,$ff,$7f,$ff   ; [$b06e] undefined
    .byte $ff,$af,$00,$ff,$df,$ff,$ff,$ff   ; [$b076] undefined
    .byte $f6,$ed,$00,$ff,$4b,$ff,$f7,$ff   ; [$b07e] undefined
    .byte $fb,$f7,$00,$ff,$83,$ff,$fe,$ff   ; [$b086] undefined
    .byte $ff,$be,$00,$ff,$df,$ff,$ff,$ff   ; [$b08e] undefined
    .byte $7f,$d3,$00,$ff,$fd,$ff,$ff,$ff   ; [$b096] undefined
    .byte $ff,$bb,$00,$ff,$ff,$ff,$7f,$ff   ; [$b09e] undefined
    .byte $ff,$d7,$00,$ff,$eb,$ff,$ff,$ff   ; [$b0a6] undefined
    .byte $ff,$b2,$00,$ff,$ff,$ff,$7f,$ff   ; [$b0ae] undefined
    .byte $ff,$d8,$00,$ff,$fd,$ff,$ff,$ff   ; [$b0b6] undefined
    .byte $7d,$6e,$00,$ff,$6b,$ff,$ff,$ff   ; [$b0be] undefined
    .byte $de,$bb,$00,$ff,$27,$ff,$bf,$ff   ; [$b0c6] undefined
    .byte $ff,$47,$00,$ff,$ff,$ff,$bf,$ff   ; [$b0ce] undefined
    .byte $ff,$c8,$00,$ff,$6f,$ff,$ff,$fd   ; [$b0d6] undefined
    .byte $ff,$ac,$00,$ff,$ef,$ff,$fe,$ff   ; [$b0de] undefined
    .byte $8f,$3d,$00,$ff,$41,$ff,$ef,$ff   ; [$b0e6] undefined
    .byte $7f,$8b,$00,$ff,$ff,$ff,$ff,$ff   ; [$b0ee] undefined
    .byte $ff,$1b,$00,$ff,$fd,$ff,$ff,$ff   ; [$b0f6] undefined
    .byte $ff,$50,$00,$ff,$fb,$ff,$ff,$ff   ; [$b0fe] undefined
    .byte $ff,$fd,$00,$ff,$df,$ff,$ff,$ff   ; [$b106] undefined
    .byte $ff,$45,$00,$ff,$fa,$ff,$df,$ff   ; [$b10e] undefined
    .byte $fb,$77,$00,$ff,$de,$ff,$ff,$ff   ; [$b116] undefined
    .byte $ff,$fb,$00,$ff,$2c,$ff,$ff,$ff   ; [$b11e] undefined
    .byte $df,$bb,$00,$ff,$fe,$ff,$f7,$ff   ; [$b126] undefined
    .byte $df,$99,$00,$ff,$68,$ff,$ff,$ff   ; [$b12e] undefined
    .byte $ff,$dd,$00,$ff,$b1,$ff,$ef,$ff   ; [$b136] undefined
    .byte $ff,$e2,$00,$ff,$d7,$ff,$af,$ff   ; [$b13e] undefined
    .byte $df,$de,$00,$ff,$5b,$ff,$7f,$ff   ; [$b146] undefined
    .byte $ff,$bf,$40,$ff,$ef,$ff,$ff,$ff   ; [$b14e] undefined
    .byte $ff,$f7,$00,$ff,$fa,$ff,$bd,$ff   ; [$b156] undefined
    .byte $fd,$d6,$00,$ff,$79,$ff,$ff,$ff   ; [$b15e] undefined
    .byte $fb,$9a,$00,$ff,$ad,$ff,$ff,$ff   ; [$b166] undefined
    .byte $f7,$91,$00,$ff,$b9,$ff,$7f,$ff   ; [$b16e] undefined
    .byte $ff,$ff,$00,$ff,$68,$ff,$ff,$ff   ; [$b176] undefined
    .byte $ef,$bd,$00,$ff,$3c,$ff,$b7,$ff   ; [$b17e] undefined
    .byte $bf,$69,$00,$ff,$77,$ff,$ff,$ff   ; [$b186] undefined
    .byte $ff,$b3,$00,$ff,$e3,$ff,$ff,$ff   ; [$b18e] undefined
    .byte $ff,$e3,$00,$ff,$f3,$ff,$ff,$ff   ; [$b196] undefined
    .byte $ff,$df,$00,$ff,$58,$ff,$df,$ff   ; [$b19e] undefined
    .byte $db,$f7,$00,$ff,$7f,$ff,$7f,$ff   ; [$b1a6] undefined
    .byte $ff,$76,$00,$ff,$28,$ff,$ff,$ff   ; [$b1ae] undefined
    .byte $fe,$d8,$00,$ff,$ff,$ff,$ff,$ff   ; [$b1b6] undefined
    .byte $ff,$e7,$00,$ff,$ef,$ff,$ef,$ff   ; [$b1be] undefined
    .byte $ff,$eb,$00,$ff,$f0,$ff,$df,$ff   ; [$b1c6] undefined
    .byte $ff,$70,$00,$ff,$e3,$ff,$ff,$ff   ; [$b1ce] undefined
    .byte $e7,$6c,$00,$ff,$c0,$ff,$ff,$ff   ; [$b1d6] undefined
    .byte $ff,$5c,$00,$ff,$0d,$ff,$fe,$ff   ; [$b1de] undefined
    .byte $fb,$5f,$00,$ff,$77,$ff,$7f,$ff   ; [$b1e6] undefined
    .byte $ff,$14,$00,$ff,$5f,$ff,$b7,$ff   ; [$b1ee] undefined
    .byte $3f,$de,$00,$ff,$8f,$ff,$ff,$ff   ; [$b1f6] undefined
    .byte $ff,$ea,$00,$ff,$ef,$ff,$ff,$ff   ; [$b1fe] undefined
    .byte $bf,$40,$00,$ff,$f3,$ff,$ef,$ff   ; [$b206] undefined
    .byte $be,$e6,$00,$ff,$fa,$ff,$ff,$ff   ; [$b20e] undefined
    .byte $ff,$bf,$00,$ff,$7f,$ff,$fd,$ff   ; [$b216] undefined
    .byte $ff,$93,$00,$ff,$be,$ff,$df,$ff   ; [$b21e] undefined
    .byte $9d,$fb,$00,$ff,$cf,$ff,$f7,$ff   ; [$b226] undefined
    .byte $ff,$b6,$00,$ff,$e8,$ff,$eb,$ff   ; [$b22e] undefined
    .byte $ef,$bf,$00,$ff,$7f,$ff,$fd,$ff   ; [$b236] undefined
    .byte $ff,$ff,$00,$ff,$d3,$ff,$d7,$ff   ; [$b23e] undefined
    .byte $ff,$7d,$00,$ff,$b7,$ff,$ff,$ff   ; [$b246] undefined
    .byte $5f,$ac,$00,$ff,$3f,$ff,$fd,$ff   ; [$b24e] undefined
    .byte $ff,$2c,$00,$ff,$f6,$ff,$df,$ff   ; [$b256] undefined
    .byte $ff,$ea,$00,$ff,$c0,$ff,$af,$ff   ; [$b25e] undefined
    .byte $fb,$ff,$00,$ff,$47,$ff,$ff,$ff   ; [$b266] undefined
    .byte $ff,$ef,$00,$ff,$bd,$ff,$ff,$ff   ; [$b26e] undefined
    .byte $ff,$f7,$00,$ff,$db,$ff,$bf,$ff   ; [$b276] undefined
    .byte $fd,$c7,$00,$ff,$ce,$ff,$7f,$ff   ; [$b27e] undefined
    .byte $ff,$b9,$00,$ff,$ef,$ff,$ef,$ff   ; [$b286] undefined
    .byte $ff,$c8,$00,$ff,$f7,$ff,$ff,$ff   ; [$b28e] undefined
    .byte $ff,$db,$00,$ff,$bf,$ff,$ff,$ff   ; [$b296] undefined
    .byte $fe,$ef,$00,$ff,$dc,$ff,$ff,$ff   ; [$b29e] undefined
    .byte $5b,$73,$00,$ff,$af,$ff,$df,$ff   ; [$b2a6] undefined
    .byte $ff,$b6,$00,$ff,$e7,$ff,$ff,$ff   ; [$b2ae] undefined
    .byte $ff,$f0,$00,$ff,$7b,$ff,$fd,$ef   ; [$b2b6] undefined
    .byte $ff,$a7,$00,$ff,$89,$ff,$bf,$ff   ; [$b2be] undefined
    .byte $fb,$ef,$00,$ff,$50,$ff,$77,$ff   ; [$b2c6] undefined
    .byte $f7,$f6,$00,$ff,$bc,$ff,$ff,$ff   ; [$b2ce] undefined
    .byte $ff,$f0,$00,$ff,$f3,$ff,$cf,$ff   ; [$b2d6] undefined
    .byte $ff,$be,$00,$ff,$c5,$ff,$b3,$ff   ; [$b2de] undefined
    .byte $ff,$ff,$00,$ff,$52,$ff,$bf,$ff   ; [$b2e6] undefined
    .byte $76,$00,$00,$ff,$dc,$ff,$ef,$ff   ; [$b2ee] undefined
    .byte $ff,$e8,$00,$ff,$d9,$ff,$7f,$ff   ; [$b2f6] undefined
    .byte $4e,$74,$00,$ff,$fb,$ff,$ff,$ff   ; [$b2fe] undefined
    .byte $7f,$ba,$00,$ff,$d5,$ff,$ff,$ff   ; [$b306] undefined
    .byte $ff,$df,$10,$ff,$ff,$ff,$fe,$ff   ; [$b30e] undefined
    .byte $bf,$bf,$00,$ff,$45,$ff,$ff,$ff   ; [$b316] undefined
    .byte $ff,$ec,$00,$ff,$7f,$ff,$f7,$ff   ; [$b31e] undefined
    .byte $ef,$7f,$00,$ff,$ff,$ff,$ff,$ff   ; [$b326] undefined
    .byte $7b,$5c,$00,$ff,$df,$ff,$ff,$ff   ; [$b32e] undefined
    .byte $ef,$cc,$00,$ff,$fb,$ff,$ff,$ff   ; [$b336] undefined
    .byte $ff,$6d,$00,$ff,$76,$ff,$f7,$ff   ; [$b33e] undefined
    .byte $ff,$40,$00,$ff,$bb,$ff,$fd,$ff   ; [$b346] undefined
    .byte $ff,$de,$20,$ff,$ff,$ff,$ff,$ff   ; [$b34e] undefined
    .byte $ef,$a7,$04,$ff,$df,$ff,$ff,$ff   ; [$b356] undefined
    .byte $bf,$3b,$00,$ff,$4b,$ff,$ff,$ff   ; [$b35e] undefined
    .byte $b0,$f5,$00,$ff,$dd,$ff,$ff,$ff   ; [$b366] undefined
    .byte $ff,$bc,$00,$ff,$9d,$ff,$f9,$ff   ; [$b36e] undefined
    .byte $ff,$7e,$00,$ff,$ff,$ff,$df,$ff   ; [$b376] undefined
    .byte $ff,$6f,$00,$ff,$f3,$ff,$ff,$ff   ; [$b37e] undefined
    .byte $bb,$2e,$00,$ff,$e7,$ff,$3d,$ff   ; [$b386] undefined
    .byte $ff,$6e,$00,$ff,$7f,$ff,$fc,$fb   ; [$b38e] undefined
    .byte $ff,$96,$00,$ff,$3b,$ff,$ff,$ff   ; [$b396] undefined
    .byte $ff,$1b,$00,$ff,$df,$ff,$ef,$ff   ; [$b39e] undefined
    .byte $fb,$db,$00,$ff,$f6,$ff,$fd,$ff   ; [$b3a6] undefined
    .byte $bf,$89,$00,$ff,$ff,$ff,$fe,$ff   ; [$b3ae] undefined
    .byte $ff,$11,$00,$ff,$ff,$ff,$df,$ff   ; [$b3b6] undefined
    .byte $bf,$94,$00,$ff,$23,$ff,$ff,$ff   ; [$b3be] undefined
    .byte $af,$fb,$00,$ff,$9a,$ff,$ff,$ff   ; [$b3c6] undefined
    .byte $9f,$3b,$00,$ff,$3f,$ff,$ff,$ff   ; [$b3ce] undefined
    .byte $ff,$7d,$00,$ff,$fe,$ff,$ff,$ff   ; [$b3d6] undefined
    .byte $fd,$aa,$00,$ff,$d2,$ff,$ff,$ff   ; [$b3de] undefined
    .byte $7f,$9f,$00,$ff,$a7,$ff,$ff,$ff   ; [$b3e6] undefined
    .byte $ff,$12,$00,$ff,$69,$ff,$ff,$ff   ; [$b3ee] undefined
    .byte $f7,$dd,$00,$ff,$bf,$ff,$bf,$ff   ; [$b3f6] undefined
    .byte $f7,$44,$00,$ff,$7e,$ff,$ff,$ff   ; [$b3fe] undefined
    .byte $ff,$dd,$00,$ff,$66,$ff,$ff,$ff   ; [$b406] undefined
    .byte $ff,$7f,$00,$ff,$2c,$ff,$ff,$ff   ; [$b40e] undefined
    .byte $df,$fa,$00,$ff,$7f,$ff,$bf,$ff   ; [$b416] undefined
    .byte $ff,$df,$00,$ff,$de,$ff,$df,$ff   ; [$b41e] undefined
    .byte $ff,$fb,$00,$ff,$6c,$ff,$77,$ff   ; [$b426] undefined
    .byte $ff,$52,$00,$ff,$fb,$ff,$ef,$ff   ; [$b42e] undefined
    .byte $ff,$77,$01,$ff,$ff,$ff,$bb,$ff   ; [$b436] undefined
    .byte $ff,$af,$02,$ff,$7f,$ff,$fd,$ff   ; [$b43e] undefined
    .byte $ff,$bd,$00,$ff,$ff,$ff,$f7,$ff   ; [$b446] undefined
    .byte $ff,$a5,$00,$ff,$1d,$ff,$ff,$ff   ; [$b44e] undefined
    .byte $bd,$ef,$00,$ff,$fb,$ff,$ff,$ff   ; [$b456] undefined
    .byte $ff,$ef,$00,$ff,$6a,$ff,$fe,$ff   ; [$b45e] undefined
    .byte $7f,$fd,$00,$ff,$fe,$ff,$ff,$ff   ; [$b466] undefined
    .byte $e7,$e2,$00,$ff,$f7,$ff,$ff,$ff   ; [$b46e] undefined
    .byte $3f,$cd,$00,$ff,$af,$ff,$ff,$ff   ; [$b476] undefined
    .byte $7f,$67,$00,$ff,$f7,$ff,$ff,$ff   ; [$b47e] undefined
    .byte $ff,$65,$00,$ff,$c5,$ff,$ff,$ff   ; [$b486] undefined
    .byte $ff,$c2,$00,$ff,$fe,$ff,$fe,$ff   ; [$b48e] undefined
    .byte $fd,$ff,$00,$ff,$7c,$ff,$fd,$ff   ; [$b496] undefined
    .byte $ff,$db,$00,$ff,$ba,$ff,$fb,$ff   ; [$b49e] undefined
    .byte $ff,$9b,$00,$ff,$f3,$ff,$ff,$ff   ; [$b4a6] undefined
    .byte $f7,$81,$00,$ff,$7c,$ff,$ff,$ff   ; [$b4ae] undefined
    .byte $ef,$b1,$00,$ff,$e7,$ff,$ff,$ff   ; [$b4b6] undefined
    .byte $ff,$87,$00,$ff,$e0,$ff,$7f,$ff   ; [$b4be] undefined
    .byte $ff,$65,$00,$ff,$75,$ff,$ff,$ff   ; [$b4c6] undefined
    .byte $7d,$69,$00,$ff,$38,$ff,$ef,$ff   ; [$b4ce] undefined
    .byte $f3,$87,$00,$ff,$ff,$ff,$ff,$ff   ; [$b4d6] undefined
    .byte $ff,$99,$00,$ff,$b6,$ff,$ff,$ff   ; [$b4de] undefined
    .byte $e3,$df,$00,$ff,$f6,$ff,$f9,$ff   ; [$b4e6] undefined
    .byte $ff,$79,$00,$ff,$7f,$ff,$ff,$ff   ; [$b4ee] undefined
    .byte $fd,$af,$00,$ff,$fa,$ff,$ff,$ff   ; [$b4f6] undefined
    .byte $df,$ec,$20,$ff,$7f,$ff,$ff,$ff   ; [$b4fe] undefined
    .byte $fe,$bb,$00,$ff,$b7,$ff,$ff,$ff   ; [$b506] undefined
    .byte $fe,$dd,$00,$ff,$e5,$ff,$ff,$ff   ; [$b50e] undefined
    .byte $ff,$e2,$00,$ff,$fb,$ff,$ff,$ff   ; [$b516] undefined
    .byte $ff,$fb,$00,$ff,$7a,$ff,$ff,$ff   ; [$b51e] undefined
    .byte $bf,$3e,$00,$ff,$ff,$ff,$ff,$ff   ; [$b526] undefined
    .byte $bb,$77,$00,$ff,$e9,$ff,$fb,$ff   ; [$b52e] undefined
    .byte $ff,$fb,$00,$ff,$7f,$ff,$ff,$ff   ; [$b536] undefined
    .byte $fd,$df,$00,$ff,$b7,$ff,$ff,$ff   ; [$b53e] undefined
    .byte $cf,$cf,$80,$ff,$ff,$ff,$ff,$ff   ; [$b546] undefined
    .byte $ff,$52,$00,$ff,$7f,$ff,$ff,$ff   ; [$b54e] undefined
    .byte $ff,$a7,$00,$ff,$f2,$ff,$fb,$ff   ; [$b556] undefined
    .byte $ff,$7c,$00,$ff,$f7,$ff,$f7,$ff   ; [$b55e] undefined
    .byte $ff,$dd,$00,$ff,$fd,$ff,$df,$ff   ; [$b566] undefined
    .byte $ef,$7b,$00,$ff,$cf,$ff,$ff,$ff   ; [$b56e] undefined
    .byte $ff,$2e,$00,$ff,$fd,$ff,$ff,$ff   ; [$b576] undefined
    .byte $ff,$eb,$00,$ff,$33,$ff,$ff,$ff   ; [$b57e] undefined
    .byte $f7,$bf,$00,$ff,$db,$ff,$bf,$ff   ; [$b586] undefined
    .byte $f7,$77,$00,$ff,$c7,$ff,$ff,$ff   ; [$b58e] undefined
    .byte $ff,$f6,$00,$ff,$c1,$ff,$7f,$ff   ; [$b596] undefined
    .byte $fb,$53,$00,$ff,$6f,$ff,$6f,$ff   ; [$b59e] undefined
    .byte $ff,$3c,$00,$ff,$fa,$ff,$ff,$ff   ; [$b5a6] undefined
    .byte $5f,$c9,$00,$ff,$79,$ff,$ff,$ff   ; [$b5ae] undefined
    .byte $ff,$df,$00,$ff,$fb,$ff,$ff,$ff   ; [$b5b6] undefined
    .byte $ff,$48,$00,$ff,$32,$ff,$d7,$ff   ; [$b5be] undefined
    .byte $7f,$ee,$00,$ff,$ee,$ff,$ff,$ff   ; [$b5c6] undefined
    .byte $ff,$ed,$00,$ff,$ff,$ff,$7f,$ff   ; [$b5ce] undefined
    .byte $ff,$15,$04,$ff,$bd,$ff,$ff,$ff   ; [$b5d6] undefined
    .byte $ff,$02,$00,$ff,$c9,$ff,$ff,$ff   ; [$b5de] undefined
    .byte $ff,$cf,$00,$ff,$fb,$ff,$df,$ff   ; [$b5e6] undefined
    .byte $fc,$15,$00,$ff,$f7,$ff,$fe,$ff   ; [$b5ee] undefined
    .byte $fe,$96,$00,$ff,$fa,$ff,$df,$ff   ; [$b5f6] undefined
    .byte $de,$db,$00,$ff,$ee,$ff,$ff,$ff   ; [$b5fe] undefined
    .byte $fd,$d6,$00,$ff,$8f,$ff,$ff,$ff   ; [$b606] undefined
    .byte $ff,$13,$00,$ff,$2b,$ff,$ff,$ff   ; [$b60e] undefined
    .byte $fb,$77,$00,$ff,$ac,$ff,$ff,$ff   ; [$b616] undefined
    .byte $ff,$fe,$00,$ff,$f6,$ff,$ff,$ff   ; [$b61e] undefined
    .byte $f7,$ff,$00,$ff,$b2,$ff,$fe,$ff   ; [$b626] undefined
    .byte $ff,$be,$00,$ff,$f7,$ff,$ff,$ff   ; [$b62e] undefined
    .byte $bf,$f7,$00,$ff,$fa,$ff,$ff,$ff   ; [$b636] undefined
    .byte $ff,$bb,$00,$ff,$f6,$ff,$ff,$ff   ; [$b63e] undefined
    .byte $5f,$e8,$00,$ff,$fb,$ff,$ff,$ff   ; [$b646] undefined
    .byte $bf,$fe,$00,$ff,$ff,$ff,$7f,$ff   ; [$b64e] undefined
    .byte $eb,$7d,$00,$ff,$9f,$ff,$ff,$ff   ; [$b656] undefined
    .byte $ff,$75,$00,$ff,$fd,$ff,$ff,$ff   ; [$b65e] undefined
    .byte $ef,$f3,$00,$ff,$ba,$ff,$ff,$ff   ; [$b666] undefined
    .byte $f7,$64,$00,$ff,$3a,$ff,$fe,$ff   ; [$b66e] undefined
    .byte $f3,$7f,$00,$ff,$bf,$ff,$fb,$ff   ; [$b676] undefined
    .byte $ff,$7f,$04,$ff,$9e,$ff,$ff,$ff   ; [$b67e] undefined
    .byte $e5,$b5,$00,$ff,$f3,$ff,$7f,$ff   ; [$b686] undefined
    .byte $ff,$bf,$00,$ff,$39,$ff,$ff,$ff   ; [$b68e] undefined
    .byte $ff,$c9,$00,$ff,$59,$ff,$bd,$ff   ; [$b696] undefined
    .byte $ff,$39,$00,$ff,$7d,$ff,$ff,$ff   ; [$b69e] undefined
    .byte $f3,$c9,$00,$ff,$b5,$ff,$7c,$ff   ; [$b6a6] undefined
    .byte $ff,$08,$00,$ff,$db,$ff,$ff,$ff   ; [$b6ae] undefined
    .byte $ff,$fa,$00,$ff,$77,$ff,$ff,$ff   ; [$b6b6] undefined
    .byte $ff,$7b,$00,$ff,$bf,$ff,$ff,$ff   ; [$b6be] undefined
    .byte $f7,$fc,$00,$ff,$eb,$ff,$ef,$ff   ; [$b6c6] undefined
    .byte $ff,$7e,$10,$ff,$2a,$ff,$ff,$ff   ; [$b6ce] undefined
    .byte $ff,$93,$00,$ff,$dc,$ff,$ff,$ff   ; [$b6d6] undefined
    .byte $ff,$fc,$00,$ff,$44,$ff,$b7,$ff   ; [$b6de] undefined
    .byte $fd,$ff,$00,$ff,$bf,$ff,$fd,$ff   ; [$b6e6] undefined
    .byte $f7,$9c,$00,$ff,$ae,$ff,$ff,$ff   ; [$b6ee] undefined
    .byte $ff,$b0,$00,$ff,$bf,$ff,$fd,$ff   ; [$b6f6] undefined
    .byte $ff,$24,$00,$ff,$fb,$ff,$ff,$ff   ; [$b6fe] undefined
    .byte $ff,$87,$40,$ff,$ff,$ff,$ff,$ff   ; [$b706] undefined
    .byte $ff,$6f,$08,$ff,$3f,$ff,$ff,$ff   ; [$b70e] undefined
    .byte $ff,$79,$00,$ff,$b5,$ff,$ff,$ff   ; [$b716] undefined
    .byte $ff,$77,$00,$ff,$d5,$ff,$ed,$ff   ; [$b71e] undefined
    .byte $7f,$ff,$00,$ff,$fb,$ff,$ed,$ff   ; [$b726] undefined
    .byte $ff,$be,$00,$ff,$e5,$ff,$ff,$ff   ; [$b72e] undefined
    .byte $ff,$7d,$00,$ff,$ee,$ff,$df,$ff   ; [$b736] undefined
    .byte $fe,$e7,$00,$ff,$e4,$ff,$bf,$ff   ; [$b73e] undefined
    .byte $ff,$1b,$00,$ff,$bf,$ff,$ff,$ff   ; [$b746] undefined
    .byte $ff,$78,$00,$ff,$77,$ff,$bf,$ff   ; [$b74e] undefined
    .byte $ff,$f9,$00,$ff,$de,$ff,$b9,$ff   ; [$b756] undefined
    .byte $df,$bf,$00,$ff,$ef,$ff,$f7,$ff   ; [$b75e] undefined
    .byte $ff,$ed,$00,$ff,$6f,$ff,$ff,$ff   ; [$b766] undefined
    .byte $7b,$db,$00,$ff,$db,$ff,$ff,$ff   ; [$b76e] undefined
    .byte $ff,$3f,$00,$ff,$56,$ff,$ff,$ff   ; [$b776] undefined
    .byte $7f,$fc,$00,$ff,$5a,$ff,$f1,$ff   ; [$b77e] undefined
    .byte $f7,$b6,$00,$ff,$d6,$ff,$ff,$ff   ; [$b786] undefined
    .byte $7f,$de,$00,$ff,$ff,$ff,$ff,$ff   ; [$b78e] undefined
    .byte $df,$38,$00,$ff,$ff,$ff,$7f,$ff   ; [$b796] undefined
    .byte $fe,$67,$00,$ff,$fb,$ff,$bf,$ff   ; [$b79e] undefined
    .byte $ff,$65,$00,$ff,$ff,$ff,$3f,$ff   ; [$b7a6] undefined
    .byte $ff,$1f,$00,$ff,$f5,$ff,$ff,$ff   ; [$b7ae] undefined
    .byte $fd,$35,$00,$ff,$f4,$ff,$fe,$ff   ; [$b7b6] undefined
    .byte $ff,$dd,$00,$ff,$ce,$ff,$ff,$ff   ; [$b7be] undefined
    .byte $ff,$bf,$00,$ff,$dc,$ff,$f7,$ff   ; [$b7c6] undefined
    .byte $fe,$30,$00,$ff,$79,$ff,$ff,$f7   ; [$b7ce] undefined
    .byte $ef,$26,$00,$ff,$36,$ff,$fd,$ff   ; [$b7d6] undefined
    .byte $ff,$35,$00,$ff,$6b,$ff,$ff,$ff   ; [$b7de] undefined
    .byte $fe,$69,$00,$ff,$bd,$ff,$ff,$ff   ; [$b7e6] undefined
    .byte $ff,$c6,$00,$ff,$3e,$ff,$ff,$ff   ; [$b7ee] undefined
    .byte $ff,$0b,$00,$ff,$d7,$ff,$ff,$ff   ; [$b7f6] undefined
    .byte $d7,$7f,$00,$ff,$a7,$ff,$7d,$ff   ; [$b7fe] undefined
    .byte $fb,$fd,$00,$ff,$ff,$ff,$ff,$ff   ; [$b806] undefined
    .byte $fe,$ad,$08,$ff,$fd,$ff,$ff,$ff   ; [$b80e] undefined
    .byte $ff,$9c,$00,$ff,$3d,$ff,$ff,$ff   ; [$b816] undefined
    .byte $fb,$d7,$00,$ff,$35,$ff,$ff,$ff   ; [$b81e] undefined
    .byte $7f,$37,$00,$ff,$d7,$ff,$bf,$ff   ; [$b826] undefined
    .byte $ef,$fb,$00,$ff,$56,$ff,$ef,$ff   ; [$b82e] undefined
    .byte $ff,$b3,$00,$ff,$ff,$ff,$7f,$ff   ; [$b836] undefined
    .byte $bf,$fb,$00,$ff,$bc,$ff,$fd,$ff   ; [$b83e] undefined
    .byte $fe,$d7,$00,$ff,$5f,$ff,$f7,$ff   ; [$b846] undefined
    .byte $fe,$f5,$00,$ff,$ff,$ff,$fe,$ff   ; [$b84e] undefined
    .byte $ff,$75,$00,$ff,$fd,$ff,$ff,$ff   ; [$b856] undefined
    .byte $ff,$f7,$00,$ff,$bf,$ff,$ff,$ff   ; [$b85e] undefined
    .byte $ff,$6c,$00,$ff,$bb,$ff,$fd,$ff   ; [$b866] undefined
    .byte $fd,$96,$00,$ff,$73,$ff,$ff,$ff   ; [$b86e] undefined
    .byte $df,$d7,$00,$ff,$7f,$ff,$ff,$ff   ; [$b876] undefined
    .byte $ff,$d1,$00,$ff,$49,$ff,$fd,$ff   ; [$b87e] undefined
    .byte $ff,$63,$00,$ff,$f7,$ff,$ff,$ff   ; [$b886] undefined
    .byte $ff,$5d,$00,$ff,$b7,$ff,$ff,$ff   ; [$b88e] undefined
    .byte $ff,$b6,$01,$ff,$b7,$ff,$ff,$ff   ; [$b896] undefined
    .byte $fd,$f1,$00,$ff,$c5,$ff,$ff,$ff   ; [$b89e] undefined
    .byte $df,$8b,$00,$ff,$df,$ff,$7f,$ff   ; [$b8a6] undefined
    .byte $ff,$07,$00,$ff,$b9,$ff,$ef,$ff   ; [$b8ae] undefined
    .byte $cf,$d7,$00,$ff,$ff,$ff,$ff,$ff   ; [$b8b6] undefined
    .byte $ff,$b0,$00,$ff,$5f,$ff,$ff,$ff   ; [$b8be] undefined
    .byte $bf,$43,$00,$ff,$ba,$ff,$ff,$ff   ; [$b8c6] undefined
    .byte $ff,$45,$00,$ff,$27,$ff,$ff,$ff   ; [$b8ce] undefined
    .byte $bf,$53,$04,$ff,$ff,$ff,$fe,$ff   ; [$b8d6] undefined
    .byte $df,$57,$00,$ff,$17,$ff,$ff,$ff   ; [$b8de] undefined
    .byte $37,$ed,$00,$ff,$7f,$ff,$fa,$ff   ; [$b8e6] undefined
    .byte $ef,$1d,$00,$ff,$8f,$ff,$ff,$ff   ; [$b8ee] undefined
    .byte $ff,$fc,$00,$ff,$bf,$ff,$cf,$7f   ; [$b8f6] undefined
    .byte $ef,$1c,$00,$ff,$df,$ff,$ff,$ff   ; [$b8fe] undefined
    .byte $dd,$d7,$00,$ff,$a6,$ff,$ef,$ff   ; [$b906] undefined
    .byte $f7,$ed,$00,$ff,$4f,$ff,$ff,$ff   ; [$b90e] undefined
    .byte $df,$7f,$00,$ff,$6f,$ff,$7b,$ff   ; [$b916] undefined
    .byte $ff,$d4,$00,$ff,$fc,$ff,$f6,$ff   ; [$b91e] undefined
    .byte $ff,$d7,$00,$ff,$7f,$ff,$be,$ff   ; [$b926] undefined
    .byte $ff,$ef,$00,$ff,$f5,$ff,$ff,$ff   ; [$b92e] undefined
    .byte $ff,$3e,$00,$ff,$5b,$ff,$ff,$ff   ; [$b936] undefined
    .byte $ff,$fe,$00,$ff,$75,$ff,$df,$ff   ; [$b93e] undefined
    .byte $ff,$73,$00,$ff,$6e,$ff,$f7,$ff   ; [$b946] undefined
    .byte $fb,$f7,$00,$ff,$fb,$ff,$ff,$ff   ; [$b94e] undefined
    .byte $ff,$fe,$00,$ff,$ed,$ff,$ff,$ff   ; [$b956] undefined
    .byte $ff,$ee,$00,$ff,$cf,$ff,$ff,$ff   ; [$b95e] undefined
    .byte $fd,$31,$00,$ff,$e7,$ff,$df,$ff   ; [$b966] undefined
    .byte $ff,$de,$00,$ff,$ff,$ff,$ef,$ff   ; [$b96e] undefined
    .byte $fb,$f3,$00,$ff,$fc,$ff,$ff,$ff   ; [$b976] undefined
    .byte $ff,$c6,$00,$ff,$03,$ff,$bf,$ff   ; [$b97e] undefined
    .byte $b5,$3f,$00,$ff,$46,$ff,$ff,$ff   ; [$b986] undefined
    .byte $ff,$61,$00,$ff,$ed,$ff,$ff,$ff   ; [$b98e] undefined
    .byte $fb,$b7,$00,$ff,$9e,$ff,$7d,$ff   ; [$b996] undefined
    .byte $ff,$e7,$00,$ff,$fc,$ff,$ff,$ff   ; [$b99e] undefined
    .byte $bf,$7a,$00,$ff,$c7,$ff,$d8,$ff   ; [$b9a6] undefined
    .byte $ff,$3e,$00,$ff,$5a,$ff,$ff,$ff   ; [$b9ae] undefined
    .byte $ff,$bd,$80,$ff,$e7,$ff,$f5,$f7   ; [$b9b6] undefined
    .byte $ff,$1b,$00,$ff,$e3,$ff,$bf,$ff   ; [$b9be] undefined
    .byte $fd,$cf,$00,$ff,$be,$ff,$ff,$ff   ; [$b9c6] undefined
    .byte $7d,$c9,$00,$ff,$2b,$ff,$ff,$ff   ; [$b9ce] undefined
    .byte $f6,$80,$00,$ff,$cf,$ff,$af,$ff   ; [$b9d6] undefined
    .byte $ff,$fc,$00,$ff,$ec,$ff,$fe,$ff   ; [$b9de] undefined
    .byte $fb,$f3,$00,$ff,$b1,$ff,$6f,$ff   ; [$b9e6] undefined
    .byte $37,$de,$00,$ff,$a4,$ff,$ff,$ff   ; [$b9ee] undefined
    .byte $ff,$71,$00,$ff,$3c,$ff,$ff,$ff   ; [$b9f6] undefined
    .byte $f3,$fe,$00,$ff,$7f,$ff,$d7,$ff   ; [$b9fe] undefined
    .byte $f7,$74,$00,$ff,$73,$ff,$fe,$ff   ; [$ba06] undefined
    .byte $fb,$fd,$00,$ff,$f4,$ff,$ff,$ff   ; [$ba0e] undefined
    .byte $ff,$f7,$00,$ff,$93,$ff,$5d,$ff   ; [$ba16] undefined
    .byte $fd,$da,$40,$ff,$bb,$ff,$ff,$ff   ; [$ba1e] undefined
    .byte $fe,$f4,$00,$ff,$fe,$ff,$ff,$ff   ; [$ba26] undefined
    .byte $ff,$5b,$00,$ff,$c5,$ff,$ff,$ff   ; [$ba2e] undefined
    .byte $ff,$e8,$00,$ff,$fc,$ff,$f6,$ff   ; [$ba36] undefined
    .byte $ff,$d7,$00,$ff,$99,$ff,$df,$ff   ; [$ba3e] undefined
    .byte $fb,$f4,$10,$ff,$ef,$ff,$ff,$ff   ; [$ba46] undefined
    .byte $ff,$36,$00,$ff,$5a,$ff,$ff,$ff   ; [$ba4e] undefined
    .byte $ff,$f9,$00,$ff,$f9,$ff,$ff,$ff   ; [$ba56] undefined
    .byte $ff,$9f,$00,$ff,$fe,$ff,$ff,$ff   ; [$ba5e] undefined
    .byte $ff,$bb,$00,$ff,$bd,$ff,$df,$ff   ; [$ba66] undefined
    .byte $ff,$6f,$00,$ff,$bf,$ff,$f3,$ff   ; [$ba6e] undefined
    .byte $af,$56,$00,$ff,$f9,$ff,$ff,$ff   ; [$ba76] undefined
    .byte $ff,$db,$00,$ff,$f1,$ff,$f3,$ff   ; [$ba7e] undefined
    .byte $ff,$93,$00,$ff,$6d,$ff,$6f,$ff   ; [$ba86] undefined
    .byte $df,$0a,$00,$ff,$8f,$ff,$db,$ff   ; [$ba8e] undefined
    .byte $ff,$fd,$00,$ff,$f9,$ff,$ff,$ff   ; [$ba96] undefined
    .byte $5f,$f6,$00,$ff,$c5,$ff,$df,$ff   ; [$ba9e] undefined
    .byte $7f,$df,$00,$ff,$fd,$ff,$ff,$ff   ; [$baa6] undefined
    .byte $ff,$79,$00,$ff,$d9,$ff,$7f,$ff   ; [$baae] undefined
    .byte $fb,$3d,$00,$ff,$e7,$ff,$ff,$ff   ; [$bab6] undefined
    .byte $ff,$dc,$00,$ff,$91,$ff,$e7,$ff   ; [$babe] undefined
    .byte $67,$dc,$00,$ff,$fc,$ff,$ff,$ff   ; [$bac6] undefined
    .byte $ff,$58,$00,$ff,$7d,$ff,$ff,$ff   ; [$bace] undefined
    .byte $ff,$20,$00,$ff,$3f,$ff,$ff,$ff   ; [$bad6] undefined
    .byte $ff,$fc,$00,$ff,$8d,$ff,$ef,$ff   ; [$bade] undefined
    .byte $ff,$41,$00,$ff,$dc,$ff,$fe,$ff   ; [$bae6] undefined
    .byte $bf,$a6,$00,$ff,$8f,$ff,$bd,$ff   ; [$baee] undefined
    .byte $7f,$a8,$00,$ff,$6a,$ff,$ff,$ff   ; [$baf6] undefined
    .byte $fd,$86,$00,$ff,$da,$ff,$fd,$ff   ; [$bafe] undefined
    .byte $ff,$cd,$00,$ff,$ff,$ff,$ff,$ff   ; [$bb06] undefined
    .byte $ff,$66,$00,$ff,$cf,$ff,$ff,$ff   ; [$bb0e] undefined
    .byte $ff,$7a,$00,$ff,$fd,$ff,$ed,$ff   ; [$bb16] undefined
    .byte $7f,$f5,$00,$ff,$ef,$ff,$fe,$ff   ; [$bb1e] undefined
    .byte $de,$37,$00,$ff,$bf,$ff,$ff,$ff   ; [$bb26] undefined
    .byte $ff,$e5,$00,$ff,$d4,$ff,$7f,$ff   ; [$bb2e] undefined
    .byte $7d,$c0,$00,$ff,$eb,$ff,$df,$ff   ; [$bb36] undefined
    .byte $ff,$bb,$00,$ff,$ab,$ff,$ef,$ff   ; [$bb3e] undefined
    .byte $ef,$ff,$00,$ff,$fb,$ff,$fd,$ff   ; [$bb46] undefined
    .byte $f3,$8c,$00,$ff,$ee,$ff,$fe,$ff   ; [$bb4e] undefined
    .byte $fb,$37,$00,$ff,$fd,$ff,$ef,$ff   ; [$bb56] undefined
    .byte $ff,$bf,$00,$ff,$1b,$ff,$fd,$ff   ; [$bb5e] undefined
    .byte $5f,$f2,$00,$ff,$b7,$ff,$ff,$ff   ; [$bb66] undefined
    .byte $f7,$77,$00,$ff,$cf,$ff,$bf,$ff   ; [$bb6e] undefined
    .byte $ff,$d4,$00,$ff,$ff,$ff,$ff,$ff   ; [$bb76] undefined
    .byte $fb,$dc,$00,$ff,$dc,$ff,$7a,$ff   ; [$bb7e] undefined
    .byte $fb,$c2,$00,$ff,$df,$ff,$ed,$ff   ; [$bb86] undefined
    .byte $fe,$d5,$00,$ff,$9c,$ff,$bd,$ff   ; [$bb8e] undefined
    .byte $ff,$fe,$00,$ff,$fe,$ff,$ff,$ff   ; [$bb96] undefined
    .byte $ff,$07,$00,$ff,$b2,$ff,$ff,$ff   ; [$bb9e] undefined
    .byte $7e,$b4,$00,$ff,$5b,$ff,$fe,$ff   ; [$bba6] undefined
    .byte $7f,$73,$00,$ff,$64,$ff,$ff,$ff   ; [$bbae] undefined
    .byte $df,$db,$00,$ff,$ed,$ff,$bd,$ff   ; [$bbb6] undefined
    .byte $ff,$d4,$00,$ff,$04,$ff,$c3,$ff   ; [$bbbe] undefined
    .byte $7f,$ff,$00,$ff,$1a,$ff,$7b,$ff   ; [$bbc6] undefined
    .byte $ff,$d8,$00,$ff,$fb,$ff,$fd,$ff   ; [$bbce] undefined
    .byte $7f,$72,$00,$ff,$bb,$ff,$ff,$ff   ; [$bbd6] undefined
    .byte $ef,$70,$00,$ff,$db,$ff,$ff,$ff   ; [$bbde] undefined
    .byte $ff,$df,$00,$ff,$8d,$ff,$fb,$ff   ; [$bbe6] undefined
    .byte $fd,$64,$00,$ff,$fa,$ff,$4f,$ff   ; [$bbee] undefined
    .byte $bf,$00,$00,$ff,$de,$ff,$ff,$ff   ; [$bbf6] undefined
    .byte $ef,$12,$00,$ff,$ff,$ff,$ff,$ff   ; [$bbfe] undefined
    .byte $fb,$7b,$00,$ff,$d9,$ff,$ff,$ff   ; [$bc06] undefined
    .byte $ff,$df,$00,$ff,$d6,$ff,$fe,$ff   ; [$bc0e] undefined
    .byte $ff,$ff,$00,$ff,$77,$ff,$ef,$ff   ; [$bc16] undefined
    .byte $df,$5d,$00,$ff,$bd,$ff,$7f,$ff   ; [$bc1e] undefined
    .byte $b6,$b3,$00,$ff,$bd,$ff,$fb,$ff   ; [$bc26] undefined
    .byte $f9,$bf,$00,$ff,$7f,$ff,$ff,$ff   ; [$bc2e] undefined
    .byte $f9,$b6,$00,$ff,$b9,$ff,$ff,$ff   ; [$bc36] undefined
    .byte $bb,$7f,$00,$ff,$2e,$ff,$fe,$ff   ; [$bc3e] undefined
    .byte $fe,$fd,$00,$ff,$77,$ff,$ff,$ff   ; [$bc46] undefined
    .byte $7d,$3c,$00,$ff,$bf,$ff,$ff,$ff   ; [$bc4e] undefined
    .byte $ff,$aa,$00,$ff,$ff,$ff,$ff,$ff   ; [$bc56] undefined
    .byte $fa,$7f,$00,$ff,$3f,$ff,$ff,$ff   ; [$bc5e] undefined
    .byte $ff,$5e,$00,$ff,$f9,$ff,$fd,$ff   ; [$bc66] undefined
    .byte $ff,$73,$00,$ff,$ef,$ff,$fb,$ff   ; [$bc6e] undefined
    .byte $ff,$7c,$00,$ff,$fd,$ff,$ff,$ff   ; [$bc76] undefined
    .byte $ef,$77,$00,$ff,$99,$ff,$ff,$ff   ; [$bc7e] undefined
    .byte $7f,$b9,$00,$ff,$bf,$ff,$6b,$ff   ; [$bc86] undefined
    .byte $e9,$c4,$00,$ff,$7a,$ff,$fe,$ff   ; [$bc8e] undefined
    .byte $ff,$7a,$00,$ff,$ff,$ff,$ff,$ff   ; [$bc96] undefined
    .byte $ef,$2e,$00,$ff,$99,$ff,$ff,$ff   ; [$bc9e] undefined
    .byte $fe,$b1,$00,$ff,$bf,$ff,$ff,$ff   ; [$bca6] undefined
    .byte $f7,$ac,$00,$ff,$fa,$ff,$ff,$ff   ; [$bcae] undefined
    .byte $df,$f2,$00,$ff,$fd,$ff,$df,$ff   ; [$bcb6] undefined
    .byte $ff,$7c,$00,$ff,$fc,$ff,$ff,$ff   ; [$bcbe] undefined
    .byte $7f,$1c,$00,$ff,$50,$ff,$fe,$ff   ; [$bcc6] undefined
    .byte $df,$9e,$00,$ff,$7f,$ff,$ff,$ff   ; [$bcce] undefined
    .byte $ff,$1d,$00,$ff,$de,$ff,$f7,$ff   ; [$bcd6] undefined
    .byte $ef,$ec,$00,$ff,$5d,$ff,$ff,$ff   ; [$bcde] undefined
    .byte $37,$68,$00,$ff,$4a,$ff,$c8,$ff   ; [$bce6] undefined
    .byte $fe,$cf,$00,$ff,$ff,$ff,$ff,$ff   ; [$bcee] undefined
    .byte $7b,$9b,$00,$ff,$c7,$ff,$fd,$ff   ; [$bcf6] undefined
    .byte $d7,$d0,$00,$ff,$ef,$ff,$db,$ff   ; [$bcfe] undefined
    .byte $fd,$cf,$00,$ff,$fe,$ff,$ff,$ff   ; [$bd06] undefined
    .byte $ff,$bf,$40,$ff,$9f,$ff,$f7,$ff   ; [$bd0e] undefined
    .byte $ff,$f6,$00,$ff,$f4,$ff,$ff,$ff   ; [$bd16] undefined
    .byte $7f,$54,$00,$ff,$ff,$ff,$df,$ff   ; [$bd1e] undefined
    .byte $ff,$6f,$00,$ff,$f9,$ff,$fd,$ff   ; [$bd26] undefined
    .byte $df,$bb,$00,$ff,$de,$ff,$ff,$ff   ; [$bd2e] undefined
    .byte $bf,$df,$00,$ff,$ff,$ff,$ff,$ff   ; [$bd36] undefined
    .byte $ff,$cc,$00,$ff,$57,$ff,$ff,$ff   ; [$bd3e] undefined
    .byte $af,$9d,$00,$ff,$5a,$ff,$fd,$ff   ; [$bd46] undefined
    .byte $f7,$59,$00,$ff,$7f,$ff,$ff,$ff   ; [$bd4e] undefined
    .byte $ff,$df,$00,$ff,$ff,$ff,$ff,$ff   ; [$bd56] undefined
    .byte $ff,$a9,$00,$ff,$a9,$ff,$fe,$ff   ; [$bd5e] undefined
    .byte $f6,$f9,$00,$ff,$ff,$ff,$af,$ff   ; [$bd66] undefined
    .byte $ff,$1f,$00,$ff,$ff,$ff,$ff,$ff   ; [$bd6e] undefined
    .byte $ff,$8b,$00,$ff,$b7,$ff,$ff,$ff   ; [$bd76] undefined
    .byte $ff,$6d,$00,$ff,$67,$ff,$ff,$ff   ; [$bd7e] undefined
    .byte $df,$37,$00,$ff,$3f,$ff,$fc,$ff   ; [$bd86] undefined
    .byte $db,$44,$00,$ff,$ff,$ff,$ff,$ff   ; [$bd8e] undefined
    .byte $ff,$89,$00,$ff,$1f,$ff,$ff,$ff   ; [$bd96] undefined
    .byte $fe,$db,$00,$ff,$4b,$ff,$df,$ff   ; [$bd9e] undefined
    .byte $ff,$89,$00,$ff,$fb,$ff,$ee,$ff   ; [$bda6] undefined
    .byte $7e,$9e,$00,$ff,$b9,$ff,$fb,$ff   ; [$bdae] undefined
    .byte $ff,$5c,$00,$ff,$ff,$ff,$ff,$ff   ; [$bdb6] undefined
    .byte $ff,$db,$00,$ff,$e5,$ff,$bf,$ff   ; [$bdbe] undefined
    .byte $fb,$f7,$00,$ff,$7b,$ff,$ff,$ff   ; [$bdc6] undefined
    .byte $ef,$63,$00,$ff,$5d,$ff,$bf,$ff   ; [$bdce] undefined
    .byte $ff,$63,$00,$ff,$5f,$ff,$ff,$ff   ; [$bdd6] undefined
    .byte $df,$f3,$00,$ff,$be,$ff,$fc,$ff   ; [$bdde] undefined
    .byte $5f,$77,$00,$ff,$3d,$ff,$7f,$ff   ; [$bde6] undefined
    .byte $fb,$52,$00,$ff,$dc,$ff,$ff,$ff   ; [$bdee] undefined
    .byte $fc,$8a,$00,$ff,$7e,$ff,$ff,$ff   ; [$bdf6] undefined
    .byte $5f,$1c,$00,$ff,$7e,$ff,$f7,$ff   ; [$bdfe] undefined
    .byte $ff,$bc,$00,$ff,$7b,$ff,$7f,$ff   ; [$be06] undefined
    .byte $fe,$ff,$00,$ff,$27,$ff,$ff,$ff   ; [$be0e] undefined
    .byte $ff,$ff,$00,$ff,$ff,$ff,$fb,$ff   ; [$be16] undefined
    .byte $ff,$bf,$00,$ff,$f7,$ff,$ff,$ff   ; [$be1e] undefined
    .byte $ff,$e5,$00,$ff,$43,$ff,$ff,$ff   ; [$be26] undefined
    .byte $fa,$75,$00,$ff,$b7,$ff,$bf,$ff   ; [$be2e] undefined
    .byte $ff,$fb,$00,$ff,$8a,$ff,$fe,$ff   ; [$be36] undefined
    .byte $7f,$5d,$00,$ff,$53,$ff,$ee,$ff   ; [$be3e] undefined
    .byte $f3,$55,$00,$ff,$7e,$ff,$ff,$ff   ; [$be46] undefined
    .byte $ff,$98,$00,$ff,$2f,$ff,$ff,$ff   ; [$be4e] undefined
    .byte $fd,$7d,$00,$ff,$7f,$ff,$fb,$ff   ; [$be56] undefined
    .byte $ff,$7f,$00,$ff,$6f,$ff,$7f,$ff   ; [$be5e] undefined
    .byte $be,$75,$00,$ff,$fd,$ff,$ff,$ff   ; [$be66] undefined
    .byte $7b,$e2,$00,$ff,$ff,$ff,$ef,$ff   ; [$be6e] undefined
    .byte $f7,$f1,$00,$ff,$fd,$ff,$ff,$ff   ; [$be76] undefined
    .byte $ff,$7f,$00,$ff,$69,$ff,$ef,$ff   ; [$be7e] undefined
    .byte $be,$3f,$00,$ff,$ff,$ff,$ff,$ff   ; [$be86] undefined
    .byte $ff,$5c,$00,$ff,$fd,$ff,$ff,$ff   ; [$be8e] undefined
    .byte $ff,$cc,$00,$ff,$fe,$ff,$ff,$ff   ; [$be96] undefined
    .byte $ff,$4f,$00,$ff,$c3,$ff,$f3,$ff   ; [$be9e] undefined
    .byte $ff,$2b,$00,$ff,$ab,$ff,$ff,$ff   ; [$bea6] undefined
    .byte $7b,$0e,$00,$ff,$ff,$ff,$f7,$ff   ; [$beae] undefined
    .byte $ff,$16,$00,$ff,$f3,$ff,$ff,$ff   ; [$beb6] undefined
    .byte $ff,$ab,$00,$ff,$14,$ff,$f1,$ff   ; [$bebe] undefined
    .byte $ef,$a4,$00,$ff,$fb,$ff,$ff,$ff   ; [$bec6] undefined
    .byte $e7,$19,$00,$ff,$56,$ff,$fb,$ff   ; [$bece] undefined
    .byte $ff,$5c,$00,$ff,$ff,$ff,$ff,$ff   ; [$bed6] undefined
    .byte $ff,$c8,$00,$ff,$08,$ff,$b7,$ff   ; [$bede] undefined
    .byte $ce,$2c,$00,$ff,$fc,$ff,$f6,$ff   ; [$bee6] undefined
    .byte $ff,$a1,$00,$ff,$ef,$ff,$ff,$ff   ; [$beee] undefined
    .byte $ff,$5d,$00,$ff,$7f,$ff,$fd,$ff   ; [$bef6] undefined
    .byte $ff,$d9,$00,$ff,$3e,$ff,$ff,$ff   ; [$befe] undefined
    .byte $df,$57,$00,$ff,$f7,$ff,$cf,$ff   ; [$bf06] undefined
    .byte $ff,$fa,$00,$ff,$9d,$ff,$ef,$ff   ; [$bf0e] undefined
    .byte $ff,$ef,$00,$ff,$f4,$ff,$ff,$ff   ; [$bf16] undefined
    .byte $ff,$fd,$00,$ff,$fe,$ff,$bf,$ff   ; [$bf1e] undefined
    .byte $ff,$1b,$00,$ff,$d7,$ff,$eb,$ff   ; [$bf26] undefined
    .byte $ff,$37,$00,$ff,$f7,$ff,$7f,$ff   ; [$bf2e] undefined
    .byte $be,$f3,$00,$ff,$77,$ff,$ff,$ff   ; [$bf36] undefined
    .byte $ff,$6f,$00,$ff,$f6,$ff,$ff,$ff   ; [$bf3e] undefined
    .byte $7f,$79,$00,$ff,$df,$ff,$f7,$ff   ; [$bf46] undefined
    .byte $f7,$fb,$08,$ff,$ff,$ff,$ff,$ff   ; [$bf4e] undefined
    .byte $ff,$a0,$01,$ff,$65,$ff,$ff,$ff   ; [$bf56] undefined
    .byte $f9,$7b,$00,$ff,$df,$ff,$ff,$ff   ; [$bf5e] undefined
    .byte $ff,$e6,$00,$ff,$cf,$ff,$bf,$ff   ; [$bf66] undefined
    .byte $fe,$75,$00,$ff,$7e,$ff,$df,$ff   ; [$bf6e] undefined
    .byte $ff,$6f,$00,$ff,$f1,$ff,$ff,$ff   ; [$bf76] undefined
    .byte $9d,$4a,$00,$ff,$fe,$ff,$c7,$ff   ; [$bf7e] undefined
    .byte $bb,$09,$00,$ff,$b2,$ff,$77,$ff   ; [$bf86] undefined
    .byte $ff,$47,$00,$ff,$f7,$ff,$bf,$fd   ; [$bf8e] undefined
    .byte $ff,$37,$00,$ff,$7f,$ff,$ef,$ff   ; [$bf96] undefined
    .byte $ff,$fd,$00,$ff,$3d,$ff,$3f,$ff   ; [$bf9e] undefined
    .byte $ff,$df,$00,$ff,$bc,$ff,$ff,$ff   ; [$bfa6] undefined
    .byte $f7,$d6,$00,$ff,$ff,$ff,$7f,$ff   ; [$bfae] undefined
    .byte $be,$47,$00,$ff,$9f,$ff,$be,$ff   ; [$bfb6] undefined
    .byte $ff,$d2,$00,$ff,$e4,$ff,$fe,$ff   ; [$bfbe] undefined
    .byte $bc,$ec,$00,$ff,$fb,$ff,$ff,$ff   ; [$bfc6] undefined
    .byte $f6,$83,$00,$ff,$f7,$ff,$fc,$ff   ; [$bfce] undefined
    .byte $ef,$ba,$00,$ff,$9b,$ff,$ff,$ff   ; [$bfd6] undefined
    .byte $ff,$21,$00,$ff,$7c,$ff,$be,$ff   ; [$bfde] undefined
    .byte $77,$d7,$00,$ff,$ac,$ff,$ff,$ff   ; [$bfe6] undefined
    .byte $fd,$a9,$00,$ff,$53,$ff,$f3,$ff   ; [$bfee] undefined
    .byte $ff,$0b,$00,$ff,$99,$ff,$7f,$ff   ; [$bff6] undefined
    .byte $ee,$92                           ; [$bffe] undefined
