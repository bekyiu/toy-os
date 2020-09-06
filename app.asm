; Disassembly of file: app.o
; Sat Mar  7 13:38:33 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global rand: function
global intToStr: function
global main: function
global ran

extern api_closewin                                     ; near
extern api_refreshwin                                   ; near
extern api_freetimer                                    ; near
extern api_getkey                                       ; near
extern api_settimer                                     ; near
extern api_putstrwin                                    ; near
extern api_boxfilwin                                    ; near
extern api_inittimer                                    ; near
extern api_alloctimer                                   ; near
extern api_openwin                                      ; near


SECTION .text   align=1 execute                         ; section number 1, code

rand:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        mov     eax, dword [ran]                        ; 0003 _ A1, 00000000(d)
        imul    eax, eax, 214013                        ; 0008 _ 69. C0, 000343FD
        add     eax, 2531011                            ; 000E _ 05, 00269EC3
        mov     dword [ran], eax                        ; 0013 _ A3, 00000000(d)
        mov     eax, dword [ran]                        ; 0018 _ A1, 00000000(d)
        sar     eax, 16                                 ; 001D _ C1. F8, 10
        and     eax, 7FFFH                              ; 0020 _ 25, 00007FFF
        pop     ebp                                     ; 0025 _ 5D
        ret                                             ; 0026 _ C3
; rand End of function

intToStr:; Function begin
        push    ebp                                     ; 0027 _ 55
        mov     ebp, esp                                ; 0028 _ 89. E5
        sub     esp, 16                                 ; 002A _ 83. EC, 10
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-3H], 0                        ; 002D _ 66: C7. 45, FD, 0000
        mov     byte [ebp-1H], 0                        ; 0033 _ C6. 45, FF, 00
        mov     byte [ebp-3H], 48                       ; 0037 _ C6. 45, FD, 30
        mov     byte [ebp-1H], 0                        ; 003B _ C6. 45, FF, 00
        mov     ecx, dword [ebp+8H]                     ; 003F _ 8B. 4D, 08
        mov     edx, 1717986919                         ; 0042 _ BA, 66666667
        mov     eax, ecx                                ; 0047 _ 89. C8
        imul    edx                                     ; 0049 _ F7. EA
        sar     edx, 2                                  ; 004B _ C1. FA, 02
        mov     eax, ecx                                ; 004E _ 89. C8
        sar     eax, 31                                 ; 0050 _ C1. F8, 1F
        sub     edx, eax                                ; 0053 _ 29. C2
        mov     eax, edx                                ; 0055 _ 89. D0
        shl     eax, 2                                  ; 0057 _ C1. E0, 02
        add     eax, edx                                ; 005A _ 01. D0
        add     eax, eax                                ; 005C _ 01. C0
        sub     ecx, eax                                ; 005E _ 29. C1
        mov     edx, ecx                                ; 0060 _ 89. CA
        mov     eax, edx                                ; 0062 _ 89. D0
        add     eax, 48                                 ; 0064 _ 83. C0, 30
        mov     byte [ebp-2H], al                       ; 0067 _ 88. 45, FE
        mov     ecx, dword [ebp+8H]                     ; 006A _ 8B. 4D, 08
        mov     edx, 1717986919                         ; 006D _ BA, 66666667
        mov     eax, ecx                                ; 0072 _ 89. C8
        imul    edx                                     ; 0074 _ F7. EA
        sar     edx, 2                                  ; 0076 _ C1. FA, 02
        mov     eax, ecx                                ; 0079 _ 89. C8
        sar     eax, 31                                 ; 007B _ C1. F8, 1F
        sub     edx, eax                                ; 007E _ 29. C2
        mov     eax, edx                                ; 0080 _ 89. D0
        add     eax, 48                                 ; 0082 _ 83. C0, 30
        mov     byte [ebp-3H], al                       ; 0085 _ 88. 45, FD
        mov     eax, 0                                  ; 0088 _ B8, 00000000
        leave                                           ; 008D _ C9
        ret                                             ; 008E _ C3
; intToStr End of function

main:   ; Function begin
        lea     ecx, [esp+4H]                           ; 008F _ 8D. 4C 24, 04
        and     esp, 0FFFFFFF0H                         ; 0093 _ 83. E4, F0
        push    dword [ecx-4H]                          ; 0096 _ FF. 71, FC
        push    ebp                                     ; 0099 _ 55
        mov     ebp, esp                                ; 009A _ 89. E5
        push    ecx                                     ; 009C _ 51
        sub     esp, 16052                              ; 009D _ 81. EC, 00003EB4
        mov     dword [ebp-3EADH], 0                    ; 00A3 _ C7. 85, FFFFC153, 00000000
        mov     dword [ebp-3EA9H], 0                    ; 00AD _ C7. 85, FFFFC157, 00000000
        mov     byte [ebp-3EA5H], 0                     ; 00B7 _ C6. 85, FFFFC15B, 00
        mov     byte [ebp-3EADH], 97                    ; 00BE _ C6. 85, FFFFC153, 61
        mov     byte [ebp-3EACH], 112                   ; 00C5 _ C6. 85, FFFFC154, 70
        mov     byte [ebp-3EABH], 112                   ; 00CC _ C6. 85, FFFFC155, 70
        mov     dword [ebp-0CH], 0                      ; 00D3 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 00DA _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 0                      ; 00E1 _ C7. 45, EC, 00000000
        sub     esp, 12                                 ; 00E8 _ 83. EC, 0C
        push    ?_004                                   ; 00EB _ 68, 00000000(d)
        push    -1                                      ; 00F0 _ 6A, FF
        push    100                                     ; 00F2 _ 6A, 64
        push    150                                     ; 00F4 _ 68, 00000096
        lea     eax, [ebp-3EA4H]                        ; 00F9 _ 8D. 85, FFFFC15C
        push    eax                                     ; 00FF _ 50
        call    api_openwin                             ; 0100 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0105 _ 83. C4, 20
        mov     dword [ebp-18H], eax                    ; 0108 _ 89. 45, E8
        mov     dword [ebp-1CH], 0                      ; 010B _ C7. 45, E4, 00000000
        call    api_alloctimer                          ; 0112 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0117 _ 89. 45, E0
        sub     esp, 8                                  ; 011A _ 83. EC, 08
        push    128                                     ; 011D _ 68, 00000080
        push    dword [ebp-20H]                         ; 0122 _ FF. 75, E0
        call    api_inittimer                           ; 0125 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 012A _ 83. C4, 10
?_001:  sub     esp, 8                                  ; 012D _ 83. EC, 08
        push    7                                       ; 0130 _ 6A, 07
        push    93                                      ; 0132 _ 6A, 5D
        push    143                                     ; 0134 _ 68, 0000008F
        push    26                                      ; 0139 _ 6A, 1A
        push    6                                       ; 013B _ 6A, 06
        push    dword [ebp-18H]                         ; 013D _ FF. 75, E8
        call    api_boxfilwin                           ; 0140 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0145 _ 83. C4, 20
        sub     esp, 12                                 ; 0148 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 014B _ FF. 75, EC
        call    intToStr                                ; 014E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0153 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0156 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0159 _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 015C _ 0F B6. 00
        mov     byte [ebp-3EADH], al                    ; 015F _ 88. 85, FFFFC153
        mov     eax, dword [ebp-24H]                    ; 0165 _ 8B. 45, DC
        movzx   eax, byte [eax+1H]                      ; 0168 _ 0F B6. 40, 01
        mov     byte [ebp-3EACH], al                    ; 016C _ 88. 85, FFFFC154
        mov     byte [ebp-3EABH], 58                    ; 0172 _ C6. 85, FFFFC155, 3A
        sub     esp, 12                                 ; 0179 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 017C _ FF. 75, F0
        call    intToStr                                ; 017F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0184 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0187 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 018A _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 018D _ 0F B6. 00
        mov     byte [ebp-3EAAH], al                    ; 0190 _ 88. 85, FFFFC156
        mov     eax, dword [ebp-24H]                    ; 0196 _ 8B. 45, DC
        movzx   eax, byte [eax+1H]                      ; 0199 _ 0F B6. 40, 01
        mov     byte [ebp-3EA9H], al                    ; 019D _ 88. 85, FFFFC157
        mov     byte [ebp-3EA8H], 58                    ; 01A3 _ C6. 85, FFFFC158, 3A
        sub     esp, 12                                 ; 01AA _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 01AD _ FF. 75, F4
        call    intToStr                                ; 01B0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01B5 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 01B8 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 01BB _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 01BE _ 0F B6. 00
        mov     byte [ebp-3EA7H], al                    ; 01C1 _ 88. 85, FFFFC159
        mov     eax, dword [ebp-24H]                    ; 01C7 _ 8B. 45, DC
        movzx   eax, byte [eax+1H]                      ; 01CA _ 0F B6. 40, 01
        mov     byte [ebp-3EA6H], al                    ; 01CE _ 88. 85, FFFFC15A
        sub     esp, 8                                  ; 01D4 _ 83. EC, 08
        lea     eax, [ebp-3EADH]                        ; 01D7 _ 8D. 85, FFFFC153
        push    eax                                     ; 01DD _ 50
        push    8                                       ; 01DE _ 6A, 08
        push    0                                       ; 01E0 _ 6A, 00
        push    26                                      ; 01E2 _ 6A, 1A
        push    6                                       ; 01E4 _ 6A, 06
        push    dword [ebp-18H]                         ; 01E6 _ FF. 75, E8
        call    api_putstrwin                           ; 01E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EE _ 83. C4, 20
        sub     esp, 8                                  ; 01F1 _ 83. EC, 08
        push    100                                     ; 01F4 _ 6A, 64
        push    dword [ebp-20H]                         ; 01F6 _ FF. 75, E0
        call    api_settimer                            ; 01F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01FE _ 83. C4, 10
        sub     esp, 12                                 ; 0201 _ 83. EC, 0C
        push    1                                       ; 0204 _ 6A, 01
        call    api_getkey                              ; 0206 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 020B _ 83. C4, 10
        cmp     eax, 28                                 ; 020E _ 83. F8, 1C
        jnz     ?_002                                   ; 0211 _ 75, 2D
        sub     esp, 12                                 ; 0213 _ 83. EC, 0C
        push    dword [ebp-20H]                         ; 0216 _ FF. 75, E0
        call    api_freetimer                           ; 0219 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021E _ 83. C4, 10
        nop                                             ; 0221 _ 90
        sub     esp, 12                                 ; 0222 _ 83. EC, 0C
        push    156                                     ; 0225 _ 68, 0000009C
        push    136                                     ; 022A _ 68, 00000088
        push    28                                      ; 022F _ 6A, 1C
        push    8                                       ; 0231 _ 6A, 08
        push    dword [ebp-18H]                         ; 0233 _ FF. 75, E8
        call    api_refreshwin                          ; 0236 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 023B _ 83. C4, 20
        jmp     ?_003                                   ; 023E _ EB, 33

?_002:  add     dword [ebp-0CH], 1                      ; 0240 _ 83. 45, F4, 01
        cmp     dword [ebp-0CH], 60                     ; 0244 _ 83. 7D, F4, 3C
        jne     ?_001                                   ; 0248 _ 0F 85, FFFFFEDF
        mov     dword [ebp-0CH], 0                      ; 024E _ C7. 45, F4, 00000000
        add     dword [ebp-10H], 1                      ; 0255 _ 83. 45, F0, 01
        cmp     dword [ebp-10H], 60                     ; 0259 _ 83. 7D, F0, 3C
        jne     ?_001                                   ; 025D _ 0F 85, FFFFFECA
        mov     dword [ebp-10H], 0                      ; 0263 _ C7. 45, F0, 00000000
        add     dword [ebp-14H], 1                      ; 026A _ 83. 45, EC, 01
        jmp     ?_001                                   ; 026E _ E9, FFFFFEBA

?_003:  sub     esp, 12                                 ; 0273 _ 83. EC, 0C
        push    1                                       ; 0276 _ 6A, 01
        call    api_getkey                              ; 0278 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 027D _ 83. C4, 10
        cmp     eax, 28                                 ; 0280 _ 83. F8, 1C
        jnz     ?_003                                   ; 0283 _ 75, EE
        sub     esp, 12                                 ; 0285 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 0288 _ FF. 75, E8
        call    api_closewin                            ; 028B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0290 _ 83. C4, 10
        nop                                             ; 0293 _ 90
        mov     ecx, dword [ebp-4H]                     ; 0294 _ 8B. 4D, FC
        leave                                           ; 0297 _ C9
        lea     esp, [ecx-4H]                           ; 0298 _ 8D. 61, FC
        ret                                             ; 029B _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_004:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0000 _ star.


