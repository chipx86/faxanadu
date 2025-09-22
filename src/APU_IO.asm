;============================================================================
; Faxanadu (U).nes
;
; APU_IO ($4000 - $4017)
;============================================================================

BASE $4000

;
; XREFS:
;     FUN_PRG5__81f1
;     ResetAudio
;
SQ1_VOL:                                    ; [$4000]
    db $00                                  ; [$4000] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
SQ1_SWEEP:                                  ; [$4001]
    db $00                                  ; [$4001] undefined

;
; XREFS:
;     FUN_PRG5__820d
;     FUN_PRG5__8326
;     ResetAudio
;
SQ1_LO:                                     ; [$4002]
    db $00                                  ; [$4002] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
SQ1_HI:                                     ; [$4003]
    db $00                                  ; [$4003] undefined

;
; XREFS:
;     ResetAudio
;
SQ2_VOL:                                    ; [$4004]
    db $00                                  ; [$4004] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
SQ2_SWEEP:                                  ; [$4005]
    db $00                                  ; [$4005] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
SQ2_LO:                                     ; [$4006]
    db $00                                  ; [$4006] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
SQ2_HI:                                     ; [$4007]
    db $00                                  ; [$4007] undefined

;
; XREFS:
;     FUN_PRG5__8132
;     FUN_PRG5__8326
;     ResetAudio
;
TRI_LINEAR:                                 ; [$4008]
    db $00,$00                              ; [$4008] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
TRI_LO:                                     ; [$400a]
    db $00                                  ; [$400a] undefined

;
; XREFS:
;     FUN_PRG5__8326
;     ResetAudio
;
TRI_HI:                                     ; [$400b]
    db $00                                  ; [$400b] undefined

;
; XREFS:
;     FUN_PRG5__82ff
;     ResetAudio
;
NOISE_VOL:                                  ; [$400c]
    db $00                                  ; [$400c] undefined1

;
; XREFS:
;     FUN_PRG5__82ff
;
DAT_400d:                                   ; [$400d]
    db $00                                  ; [$400d] undefined1

;
; XREFS:
;     ResetAudio
;
NOISE_LO:                                   ; [$400e]
    db $00                                  ; [$400e] undefined

;
; XREFS:
;     ResetAudio
;
NOISE_HI:                                   ; [$400f]
    db $00                                  ; [$400f] undefined

DMC_FREQ:                                   ; [$4010]
    db $00                                  ; [$4010] undefined

;
; XREFS:
;     Sound_Init
;
DMC_RAW:                                    ; [$4011]
    db $00                                  ; [$4011] undefined

DMC_START:                                  ; [$4012]
    db $00                                  ; [$4012] undefined

DMC_LEN:                                    ; [$4013]
    db $00                                  ; [$4013] undefined

;
; XREFS:
;     OnInterrupt
;
OAMDMA:                                     ; [$4014]
    db $00                                  ; [$4014] undefined

;
; XREFS:
;     Sound_Init
;     Sound_InitPlayingState
;
SND_CHN:                                    ; [$4015]
    db $00                                  ; [$4015] SoundChannels

;
; XREFS:
;     Input_HandleOnInterrupt
;
JOY1:                                       ; [$4016]
    db $00                                  ; [$4016] undefined1

;
; XREFS:
;     Input_HandleOnInterrupt
;
JOY2:                                       ; [$4017]
    db $00                                  ; [$4017] undefined1
