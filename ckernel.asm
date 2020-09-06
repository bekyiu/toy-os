; Disassembly of file: ckernel.o
; Sat Mar  7 14:24:20 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global CMain: function
global launch_console: function
global cmd_mem: function
global kill_process: function
global cmd_dir: function
global cmd_type: function
global cmd_cls: function
global cmd_hlt: function
global console_task: function
global isSpecialKey: function
global transferScanCode: function
global cons_putstr: function
global cons_putchar: function
global handle_keyboard: function
global kernel_api: function
global api_linewin: function
global set_cursor: function
global cons_newline: function
global computeMousePosition: function
global show_mouse_info: function
global draw_desktop: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showFont8: function
global initBootInfo: function
global showString: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global mouse_decode: function
global showMemoryInfo: function
global message_box: function
global make_window8: function
global make_wtitle8: function
global make_textbox8: function
global file_loadfile: function
global intHandlerForException: function
global intHandlerForStackOverFlow: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_refreshsub: function
global sheet_slide: function
global sheet_refreshmap: function
global sheet_free: function
global timer_alloc: function
global init_pit: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerForTimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global strcmp: function
global set_segmdesc: function
global get_taskctl: function
global init_task_level: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global task_now: function
global task_add: function
global task_remove: function
global task_switchsub: function
global send_message: function
global memman
global KEY_CONTROL
global key_shift
global caps_lock

extern task_timer                                       ; dword
extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern start_app                                        ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern asm_end_app                                      ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 100                                ; 0004 _ 83. EC, 64
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 0000012C(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 0000012C(d)
        mov     dword [ebp-1CH], eax                    ; 001C _ 89. 45, E4
        movzx   eax, word [?_376]                       ; 001F _ 0F B7. 05, 00000130(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 00000140(d)
        movzx   eax, word [?_377]                       ; 002C _ 0F B7. 05, 00000132(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000144(d)
        push    0                                       ; 0039 _ 6A, 00
        push    keybuf                                  ; 003B _ 68, 00000020(d)
        push    32                                      ; 0040 _ 6A, 20
        push    keyinfo                                 ; 0042 _ 68, 000000D8(d)
        call    fifo8_init                              ; 0047 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004C _ 83. C4, 10
        push    0                                       ; 004F _ 6A, 00
        push    mousebuf                                ; 0051 _ 68, 00000040(d)
        push    128                                     ; 0056 _ 68, 00000080
        push    mouseinfo                               ; 005B _ 68, 000000F4(d)
        call    fifo8_init                              ; 0060 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0065 _ 83. C4, 10
        push    0                                       ; 0068 _ 6A, 00
        push    timerbuf                                ; 006A _ 68, 000000C0(d)
        push    8                                       ; 006F _ 6A, 08
        push    timerinfo                               ; 0071 _ 68, 00000110(d)
        call    fifo8_init                              ; 0076 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007B _ 83. C4, 10
        call    init_palette                            ; 007E _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0083 _ E8, FFFFFFFC(rel)
        call    init_pit                                ; 0088 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 008D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0092 _ 89. 45, E0
        sub     esp, 4                                  ; 0095 _ 83. EC, 04
        push    10                                      ; 0098 _ 6A, 0A
        push    timerinfo                               ; 009A _ 68, 00000110(d)
        push    dword [ebp-20H]                         ; 009F _ FF. 75, E0
        call    timer_init                              ; 00A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A7 _ 83. C4, 10
        sub     esp, 8                                  ; 00AA _ 83. EC, 08
        push    100                                     ; 00AD _ 6A, 64
        push    dword [ebp-20H]                         ; 00AF _ FF. 75, E0
        call    timer_settime                           ; 00B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00B7 _ 83. C4, 10
        call    timer_alloc                             ; 00BA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00BF _ 89. 45, DC
        sub     esp, 4                                  ; 00C2 _ 83. EC, 04
        push    2                                       ; 00C5 _ 6A, 02
        push    timerinfo                               ; 00C7 _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 00CC _ FF. 75, DC
        call    timer_init                              ; 00CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D4 _ 83. C4, 10
        sub     esp, 8                                  ; 00D7 _ 83. EC, 08
        push    300                                     ; 00DA _ 68, 0000012C
        push    dword [ebp-24H]                         ; 00DF _ FF. 75, DC
        call    timer_settime                           ; 00E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E7 _ 83. C4, 10
        call    timer_alloc                             ; 00EA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 00EF _ 89. 45, D8
        sub     esp, 4                                  ; 00F2 _ 83. EC, 04
        push    1                                       ; 00F5 _ 6A, 01
        push    timerinfo                               ; 00F7 _ 68, 00000110(d)
        push    dword [ebp-28H]                         ; 00FC _ FF. 75, D8
        call    timer_init                              ; 00FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0104 _ 83. C4, 10
        sub     esp, 8                                  ; 0107 _ 83. EC, 08
        push    50                                      ; 010A _ 6A, 32
        push    dword [ebp-28H]                         ; 010C _ FF. 75, D8
        call    timer_settime                           ; 010F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0114 _ 83. C4, 10
        call    get_memory_block_count                  ; 0117 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 011C _ 89. 45, D4
        call    get_adr_buffer                          ; 011F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0124 _ 89. 45, D0
        mov     eax, dword [memman]                     ; 0127 _ A1, 00000000(d)
        sub     esp, 12                                 ; 012C _ 83. EC, 0C
        push    eax                                     ; 012F _ 50
        call    memman_init                             ; 0130 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0135 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0138 _ A1, 00000000(d)
        sub     esp, 4                                  ; 013D _ 83. EC, 04
        push    1072594944                              ; 0140 _ 68, 3FEE8000
        push    16809984                                ; 0145 _ 68, 01008000
        push    eax                                     ; 014A _ 50
        call    memman_free                             ; 014B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0150 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0153 _ 8B. 0D, 00000144(d)
        mov     edx, dword [xsize]                      ; 0159 _ 8B. 15, 00000140(d)
        mov     eax, dword [memman]                     ; 015F _ A1, 00000000(d)
        push    ecx                                     ; 0164 _ 51
        push    edx                                     ; 0165 _ 52
        push    dword [ebp-1CH]                         ; 0166 _ FF. 75, E4
        push    eax                                     ; 0169 _ 50
        call    shtctl_init                             ; 016A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 016F _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0172 _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 0177 _ A1, 00000264(d)
        sub     esp, 12                                 ; 017C _ 83. EC, 0C
        push    eax                                     ; 017F _ 50
        call    sheet_alloc                             ; 0180 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0185 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0188 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 018D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0192 _ 83. EC, 0C
        push    eax                                     ; 0195 _ 50
        call    sheet_alloc                             ; 0196 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019B _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019E _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01A3 _ 8B. 15, 00000140(d)
        mov     eax, dword [ysize]                      ; 01A9 _ A1, 00000144(d)
        imul    edx, eax                                ; 01AE _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01B1 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B6 _ 83. EC, 08
        push    edx                                     ; 01B9 _ 52
        push    eax                                     ; 01BA _ 50
        call    memman_alloc_4k                         ; 01BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C0 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C3 _ A3, 00000148(d)
        mov     ebx, dword [ysize]                      ; 01C8 _ 8B. 1D, 00000144(d)
        mov     ecx, dword [xsize]                      ; 01CE _ 8B. 0D, 00000140(d)
        mov     edx, dword [buf_back]                   ; 01D4 _ 8B. 15, 00000148(d)
        mov     eax, dword [sht_back]                   ; 01DA _ A1, 00000268(d)
        sub     esp, 12                                 ; 01DF _ 83. EC, 0C
        push    99                                      ; 01E2 _ 6A, 63
        push    ebx                                     ; 01E4 _ 53
        push    ecx                                     ; 01E5 _ 51
        push    edx                                     ; 01E6 _ 52
        push    eax                                     ; 01E7 _ 50
        call    sheet_setbuf                            ; 01E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01ED _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01F0 _ A1, 0000026C(d)
        sub     esp, 12                                 ; 01F5 _ 83. EC, 0C
        push    99                                      ; 01F8 _ 6A, 63
        push    16                                      ; 01FA _ 6A, 10
        push    16                                      ; 01FC _ 6A, 10
        push    buf_mouse                               ; 01FE _ 68, 00000160(d)
        push    eax                                     ; 0203 _ 50
        call    sheet_setbuf                            ; 0204 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0209 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020C _ 8B. 0D, 00000144(d)
        mov     edx, dword [xsize]                      ; 0212 _ 8B. 15, 00000140(d)
        mov     eax, dword [buf_back]                   ; 0218 _ A1, 00000148(d)
        sub     esp, 4                                  ; 021D _ 83. EC, 04
        push    ecx                                     ; 0220 _ 51
        push    edx                                     ; 0221 _ 52
        push    eax                                     ; 0222 _ 50
        call    draw_desktop                            ; 0223 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0228 _ 83. C4, 10
        sub     esp, 8                                  ; 022B _ 83. EC, 08
        push    99                                      ; 022E _ 6A, 63
        push    buf_mouse                               ; 0230 _ 68, 00000160(d)
        call    init_mouse_cursor                       ; 0235 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 023A _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 023D _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0243 _ A1, 00000264(d)
        push    0                                       ; 0248 _ 6A, 00
        push    0                                       ; 024A _ 6A, 00
        push    edx                                     ; 024C _ 52
        push    eax                                     ; 024D _ 50
        call    sheet_slide                             ; 024E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0253 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0256 _ A1, 00000140(d)
        sub     eax, 16                                 ; 025B _ 83. E8, 10
        mov     edx, eax                                ; 025E _ 89. C2
        shr     edx, 31                                 ; 0260 _ C1. EA, 1F
        add     eax, edx                                ; 0263 _ 01. D0
        sar     eax, 1                                  ; 0265 _ D1. F8
        mov     dword [mx], eax                         ; 0267 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 026C _ A1, 00000144(d)
        sub     eax, 44                                 ; 0271 _ 83. E8, 2C
        mov     edx, eax                                ; 0274 _ 89. C2
        shr     edx, 31                                 ; 0276 _ C1. EA, 1F
        add     eax, edx                                ; 0279 _ 01. D0
        sar     eax, 1                                  ; 027B _ D1. F8
        mov     dword [my], eax                         ; 027D _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 0282 _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 0288 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 028E _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0294 _ A1, 00000264(d)
        push    ebx                                     ; 0299 _ 53
        push    ecx                                     ; 029A _ 51
        push    edx                                     ; 029B _ 52
        push    eax                                     ; 029C _ 50
        call    sheet_slide                             ; 029D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A2 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A5 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02AC _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B3 _ A1, 00000264(d)
        sub     esp, 8                                  ; 02B8 _ 83. EC, 08
        push    ?_344                                   ; 02BB _ 68, 00000000(d)
        push    eax                                     ; 02C0 _ 50
        call    message_box                             ; 02C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C6 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02C9 _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 02CE _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 02D4 _ A1, 00000264(d)
        sub     esp, 4                                  ; 02D9 _ 83. EC, 04
        push    0                                       ; 02DC _ 6A, 00
        push    edx                                     ; 02DE _ 52
        push    eax                                     ; 02DF _ 50
        call    sheet_updown                            ; 02E0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E5 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E8 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02EE _ A1, 00000264(d)
        sub     esp, 4                                  ; 02F3 _ 83. EC, 04
        push    100                                     ; 02F6 _ 6A, 64
        push    edx                                     ; 02F8 _ 52
        push    eax                                     ; 02F9 _ 50
        call    sheet_updown                            ; 02FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FF _ 83. C4, 10
        call    io_sti                                  ; 0302 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0307 _ 83. EC, 0C
        push    mdec                                    ; 030A _ 68, 000000C8(d)
        call    enable_mouse                            ; 030F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0314 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0317 _ A1, 00000000(d)
        sub     esp, 12                                 ; 031C _ 83. EC, 0C
        push    eax                                     ; 031F _ 50
        call    task_init                               ; 0320 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0325 _ 83. C4, 10
        mov     dword [task_a.1886], eax                ; 0328 _ A3, 00000284(d)
        mov     eax, dword [task_a.1886]                ; 032D _ A1, 00000284(d)
        mov     dword [?_375], eax                      ; 0332 _ A3, 000000F0(d)
        mov     eax, dword [task_a.1886]                ; 0337 _ A1, 00000284(d)
        mov     dword [task_main], eax                  ; 033C _ A3, 00000274(d)
        call    launch_console                          ; 0341 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0346 _ 89. 45, CC
        mov     dword [ebp-38H], 0                      ; 0349 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 0350 _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 0357 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 035E _ C7. 45, BC, 00000000
        mov     dword [ebp-14H], 0                      ; 0365 _ C7. 45, EC, 00000000
?_001:  call    io_cli                                  ; 036C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0371 _ 83. EC, 0C
        push    keyinfo                                 ; 0374 _ 68, 000000D8(d)
        call    fifo8_status                            ; 0379 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 037E _ 83. C4, 10
        mov     ebx, eax                                ; 0381 _ 89. C3
        sub     esp, 12                                 ; 0383 _ 83. EC, 0C
        push    mouseinfo                               ; 0386 _ 68, 000000F4(d)
        call    fifo8_status                            ; 038B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0390 _ 83. C4, 10
        add     ebx, eax                                ; 0393 _ 01. C3
        sub     esp, 12                                 ; 0395 _ 83. EC, 0C
        push    timerinfo                               ; 0398 _ 68, 00000110(d)
        call    fifo8_status                            ; 039D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A2 _ 83. C4, 10
        add     eax, ebx                                ; 03A5 _ 01. D8
        test    eax, eax                                ; 03A7 _ 85. C0
        jnz     ?_002                                   ; 03A9 _ 75, 07
        call    io_sti                                  ; 03AB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03B0 _ EB, BA

?_002:  sub     esp, 12                                 ; 03B2 _ 83. EC, 0C
        push    keyinfo                                 ; 03B5 _ 68, 000000D8(d)
        call    fifo8_status                            ; 03BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03BF _ 83. C4, 10
        test    eax, eax                                ; 03C2 _ 85. C0
        je      ?_009                                   ; 03C4 _ 0F 84, 000002DD
        call    io_sti                                  ; 03CA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03CF _ 83. EC, 0C
        push    keyinfo                                 ; 03D2 _ 68, 000000D8(d)
        call    fifo8_get                               ; 03D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DC _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 03DF _ 89. 45, C8
        sub     esp, 12                                 ; 03E2 _ 83. EC, 0C
        push    dword [ebp-38H]                         ; 03E5 _ FF. 75, C8
        call    transferScanCode                        ; 03E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03ED _ 83. C4, 10
        mov     eax, dword [KEY_CONTROL]                ; 03F0 _ A1, 00000000(d)
        cmp     dword [ebp-38H], eax                    ; 03F5 _ 39. 45, C8
        jnz     ?_003                                   ; 03F8 _ 75, 47
        mov     eax, dword [key_shift]                  ; 03FA _ A1, 00000000(d)
        test    eax, eax                                ; 03FF _ 85. C0
        jz      ?_003                                   ; 0401 _ 74, 3E
        mov     eax, dword [task_cons]                  ; 0403 _ A1, 00000270(d)
        mov     eax, dword [eax+34H]                    ; 0408 _ 8B. 40, 34
        test    eax, eax                                ; 040B _ 85. C0
        jz      ?_003                                   ; 040D _ 74, 32
        sub     esp, 12                                 ; 040F _ 83. EC, 0C
        push    ?_345                                   ; 0412 _ 68, 00000007(d)
        call    cons_putstr                             ; 0417 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 041C _ 83. C4, 10
        call    io_cli                                  ; 041F _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0424 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], eax                    ; 0429 _ 89. 45, B8
        mov     eax, dword [task_cons]                  ; 042C _ A1, 00000270(d)
        mov     edx, kill_process                       ; 0431 _ BA, 00000000(d)
        sub     edx, dword [ebp-48H]                    ; 0436 _ 2B. 55, B8
        mov     dword [eax+4CH], edx                    ; 0439 _ 89. 50, 4C
        call    io_sti                                  ; 043C _ E8, FFFFFFFC(rel)
?_003:  cmp     dword [ebp-38H], 16                     ; 0441 _ 83. 7D, C8, 10
        jnz     ?_004                                   ; 0445 _ 75, 26
        mov     eax, dword [shtctl]                     ; 0447 _ A1, 00000264(d)
        mov     eax, dword [eax+10H]                    ; 044C _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 044F _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 0452 _ A1, 00000264(d)
        mov     edx, dword [eax+18H]                    ; 0457 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 045A _ A1, 00000264(d)
        sub     esp, 4                                  ; 045F _ 83. EC, 04
        push    ecx                                     ; 0462 _ 51
        push    edx                                     ; 0463 _ 52
        push    eax                                     ; 0464 _ 50
        call    sheet_updown                            ; 0465 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 046A _ 83. C4, 10
?_004:  cmp     dword [ebp-38H], 15                     ; 046D _ 83. 7D, C8, 0F
        jne     ?_007                                   ; 0471 _ 0F 85, 00000115
        mov     dword [ebp-18H], -1                     ; 0477 _ C7. 45, E8, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 047E _ 83. 7D, EC, 00
        jnz     ?_005                                   ; 0482 _ 75, 63
        mov     dword [ebp-14H], 1                      ; 0484 _ C7. 45, EC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 048B _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0491 _ A1, 00000264(d)
        push    0                                       ; 0496 _ 6A, 00
        push    ?_346                                   ; 0498 _ 68, 00000014(d)
        push    edx                                     ; 049D _ 52
        push    eax                                     ; 049E _ 50
        call    make_wtitle8                            ; 049F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04A4 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 04A7 _ A1, 00000264(d)
        push    1                                       ; 04AC _ 6A, 01
        push    ?_347                                   ; 04AE _ 68, 0000001B(d)
        push    dword [ebp-34H]                         ; 04B3 _ FF. 75, CC
        push    eax                                     ; 04B6 _ 50
        call    make_wtitle8                            ; 04B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04BC _ 83. C4, 10
        mov     edx, dword [shtMsgBox]                  ; 04BF _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04C5 _ A1, 00000264(d)
        sub     esp, 12                                 ; 04CA _ 83. EC, 0C
        push    7                                       ; 04CD _ 6A, 07
        push    28                                      ; 04CF _ 6A, 1C
        push    dword [ebp-0CH]                         ; 04D1 _ FF. 75, F4
        push    edx                                     ; 04D4 _ 52
        push    eax                                     ; 04D5 _ 50
        call    set_cursor                              ; 04D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04DB _ 83. C4, 20
        mov     dword [ebp-18H], 87                     ; 04DE _ C7. 45, E8, 00000057
        jmp     ?_006                                   ; 04E5 _ EB, 42

?_005:  mov     dword [ebp-14H], 0                      ; 04E7 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 04EE _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04F4 _ A1, 00000264(d)
        push    1                                       ; 04F9 _ 6A, 01
        push    ?_346                                   ; 04FB _ 68, 00000014(d)
        push    edx                                     ; 0500 _ 52
        push    eax                                     ; 0501 _ 50
        call    make_wtitle8                            ; 0502 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0507 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 050A _ A1, 00000264(d)
        push    0                                       ; 050F _ 6A, 00
        push    ?_347                                   ; 0511 _ 68, 0000001B(d)
        push    dword [ebp-34H]                         ; 0516 _ FF. 75, CC
        push    eax                                     ; 0519 _ 50
        call    make_wtitle8                            ; 051A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 051F _ 83. C4, 10
        mov     dword [ebp-18H], 88                     ; 0522 _ C7. 45, E8, 00000058
?_006:  mov     eax, dword [shtMsgBox]                  ; 0529 _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 052E _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 0531 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0537 _ A1, 00000264(d)
        sub     esp, 8                                  ; 053C _ 83. EC, 08
        push    21                                      ; 053F _ 6A, 15
        push    ecx                                     ; 0541 _ 51
        push    0                                       ; 0542 _ 6A, 00
        push    0                                       ; 0544 _ 6A, 00
        push    edx                                     ; 0546 _ 52
        push    eax                                     ; 0547 _ 50
        call    sheet_refresh                           ; 0548 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 054D _ 83. C4, 20
        mov     eax, dword [ebp-34H]                    ; 0550 _ 8B. 45, CC
        mov     edx, dword [eax+4H]                     ; 0553 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0556 _ A1, 00000264(d)
        sub     esp, 8                                  ; 055B _ 83. EC, 08
        push    21                                      ; 055E _ 6A, 15
        push    edx                                     ; 0560 _ 52
        push    0                                       ; 0561 _ 6A, 00
        push    0                                       ; 0563 _ 6A, 00
        push    dword [ebp-34H]                         ; 0565 _ FF. 75, CC
        push    eax                                     ; 0568 _ 50
        call    sheet_refresh                           ; 0569 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 056E _ 83. C4, 20
        mov     edx, dword [task_cons]                  ; 0571 _ 8B. 15, 00000270(d)
        mov     eax, dword [task_a.1886]                ; 0577 _ A1, 00000284(d)
        sub     esp, 4                                  ; 057C _ 83. EC, 04
        push    dword [ebp-18H]                         ; 057F _ FF. 75, E8
        push    edx                                     ; 0582 _ 52
        push    eax                                     ; 0583 _ 50
        call    send_message                            ; 0584 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0589 _ 83. C4, 10
?_007:  cmp     dword [ebp-14H], 0                      ; 058C _ 83. 7D, EC, 00
        jne     ?_008                                   ; 0590 _ 0F 85, 000000B1
        sub     esp, 12                                 ; 0596 _ 83. EC, 0C
        push    dword [ebp-38H]                         ; 0599 _ FF. 75, C8
        call    transferScanCode                        ; 059C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05A1 _ 83. C4, 10
        test    al, al                                  ; 05A4 _ 84. C0
        je      ?_001                                   ; 05A6 _ 0F 84, FFFFFDC0
        cmp     dword [ebp-0CH], 143                    ; 05AC _ 81. 7D, F4, 0000008F
        jg      ?_001                                   ; 05B3 _ 0F 8F, FFFFFDB3
        mov     edx, dword [shtMsgBox]                  ; 05B9 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05BF _ A1, 00000264(d)
        sub     esp, 12                                 ; 05C4 _ 83. EC, 0C
        push    7                                       ; 05C7 _ 6A, 07
        push    28                                      ; 05C9 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05CB _ FF. 75, F4
        push    edx                                     ; 05CE _ 52
        push    eax                                     ; 05CF _ 50
        call    set_cursor                              ; 05D0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05D5 _ 83. C4, 20
        sub     esp, 12                                 ; 05D8 _ 83. EC, 0C
        push    dword [ebp-38H]                         ; 05DB _ FF. 75, C8
        call    transferScanCode                        ; 05DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05E3 _ 83. C4, 10
        mov     byte [ebp-49H], al                      ; 05E6 _ 88. 45, B7
        movzx   eax, byte [ebp-49H]                     ; 05E9 _ 0F B6. 45, B7
        mov     byte [ebp-5EH], al                      ; 05ED _ 88. 45, A2
        mov     byte [ebp-5DH], 0                       ; 05F0 _ C6. 45, A3, 00
        mov     edx, dword [shtMsgBox]                  ; 05F4 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05FA _ A1, 00000264(d)
        sub     esp, 8                                  ; 05FF _ 83. EC, 08
        lea     ecx, [ebp-5EH]                          ; 0602 _ 8D. 4D, A2
        push    ecx                                     ; 0605 _ 51
        push    0                                       ; 0606 _ 6A, 00
        push    28                                      ; 0608 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 060A _ FF. 75, F4
        push    edx                                     ; 060D _ 52
        push    eax                                     ; 060E _ 50
        call    showString                              ; 060F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0614 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0617 _ 83. 45, F4, 08
        mov     edx, dword [shtMsgBox]                  ; 061B _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0621 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0626 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0629 _ FF. 75, F0
        push    28                                      ; 062C _ 6A, 1C
        push    dword [ebp-0CH]                         ; 062E _ FF. 75, F4
        push    edx                                     ; 0631 _ 52
        push    eax                                     ; 0632 _ 50
        call    set_cursor                              ; 0633 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0638 _ 83. C4, 20
        mov     dword [ebp-44H], 1                      ; 063B _ C7. 45, BC, 00000001
        jmp     ?_001                                   ; 0642 _ E9, FFFFFD25

?_008:  sub     esp, 12                                 ; 0647 _ 83. EC, 0C
        push    dword [ebp-38H]                         ; 064A _ FF. 75, C8
        call    isSpecialKey                            ; 064D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0652 _ 83. C4, 10
        test    eax, eax                                ; 0655 _ 85. C0
        jne     ?_001                                   ; 0657 _ 0F 85, FFFFFD0F
        mov     eax, dword [ebp-38H]                    ; 065D _ 8B. 45, C8
        movzx   eax, al                                 ; 0660 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 0663 _ 8B. 15, 00000270(d)
        add     edx, 16                                 ; 0669 _ 83. C2, 10
        sub     esp, 8                                  ; 066C _ 83. EC, 08
        push    eax                                     ; 066F _ 50
        push    edx                                     ; 0670 _ 52
        call    fifo8_put                               ; 0671 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0676 _ 83. C4, 10
        sub     esp, 12                                 ; 0679 _ 83. EC, 0C
        push    keyinfo                                 ; 067C _ 68, 000000D8(d)
        call    fifo8_status                            ; 0681 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0686 _ 83. C4, 10
        test    eax, eax                                ; 0689 _ 85. C0
        jne     ?_001                                   ; 068B _ 0F 85, FFFFFCDB
        mov     eax, dword [task_a.1886]                ; 0691 _ A1, 00000284(d)
        sub     esp, 12                                 ; 0696 _ 83. EC, 0C
        push    eax                                     ; 0699 _ 50
        call    task_sleep                              ; 069A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 069F _ 83. C4, 10
        jmp     ?_001                                   ; 06A2 _ E9, FFFFFCC5

?_009:  sub     esp, 12                                 ; 06A7 _ 83. EC, 0C
        push    mouseinfo                               ; 06AA _ 68, 000000F4(d)
        call    fifo8_status                            ; 06AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B4 _ 83. C4, 10
        test    eax, eax                                ; 06B7 _ 85. C0
        jz      ?_010                                   ; 06B9 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 06BB _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 06C1 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 06C7 _ A1, 00000264(d)
        sub     esp, 4                                  ; 06CC _ 83. EC, 04
        push    ecx                                     ; 06CF _ 51
        push    edx                                     ; 06D0 _ 52
        push    eax                                     ; 06D1 _ 50
        call    show_mouse_info                         ; 06D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06D7 _ 83. C4, 10
        jmp     ?_001                                   ; 06DA _ E9, FFFFFC8D

?_010:  sub     esp, 12                                 ; 06DF _ 83. EC, 0C
        push    timerinfo                               ; 06E2 _ 68, 00000110(d)
        call    fifo8_status                            ; 06E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06EC _ 83. C4, 10
        test    eax, eax                                ; 06EF _ 85. C0
        je      ?_001                                   ; 06F1 _ 0F 84, FFFFFC75
        call    io_sti                                  ; 06F7 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06FC _ 83. EC, 0C
        push    timerinfo                               ; 06FF _ 68, 00000110(d)
        call    fifo8_get                               ; 0704 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0709 _ 83. C4, 10
        mov     dword [ebp-50H], eax                    ; 070C _ 89. 45, B0
        cmp     dword [ebp-50H], 0                      ; 070F _ 83. 7D, B0, 00
        jz      ?_011                                   ; 0713 _ 74, 1E
        sub     esp, 4                                  ; 0715 _ 83. EC, 04
        push    0                                       ; 0718 _ 6A, 00
        push    timerinfo                               ; 071A _ 68, 00000110(d)
        push    dword [ebp-28H]                         ; 071F _ FF. 75, D8
        call    timer_init                              ; 0722 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0727 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 072A _ C7. 45, F0, 00000000
        jmp     ?_012                                   ; 0731 _ EB, 1C

?_011:  sub     esp, 4                                  ; 0733 _ 83. EC, 04
        push    1                                       ; 0736 _ 6A, 01
        push    timerinfo                               ; 0738 _ 68, 00000110(d)
        push    dword [ebp-28H]                         ; 073D _ FF. 75, D8
        call    timer_init                              ; 0740 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0745 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0748 _ C7. 45, F0, 00000007
?_012:  sub     esp, 8                                  ; 074F _ 83. EC, 08
        push    50                                      ; 0752 _ 6A, 32
        push    dword [ebp-28H]                         ; 0754 _ FF. 75, D8
        call    timer_settime                           ; 0757 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 075C _ 83. C4, 10
        cmp     dword [ebp-14H], 0                      ; 075F _ 83. 7D, EC, 00
        jnz     ?_013                                   ; 0763 _ 75, 25
        mov     edx, dword [shtMsgBox]                  ; 0765 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 076B _ A1, 00000264(d)
        sub     esp, 12                                 ; 0770 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0773 _ FF. 75, F0
        push    28                                      ; 0776 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0778 _ FF. 75, F4
        push    edx                                     ; 077B _ 52
        push    eax                                     ; 077C _ 50
        call    set_cursor                              ; 077D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0782 _ 83. C4, 20
        jmp     ?_001                                   ; 0785 _ E9, FFFFFBE2

?_013:  mov     edx, dword [shtMsgBox]                  ; 078A _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0790 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0795 _ 83. EC, 0C
        push    7                                       ; 0798 _ 6A, 07
        push    28                                      ; 079A _ 6A, 1C
        push    dword [ebp-0CH]                         ; 079C _ FF. 75, F4
        push    edx                                     ; 079F _ 52
        push    eax                                     ; 07A0 _ 50
        call    set_cursor                              ; 07A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07A6 _ 83. C4, 20
        jmp     ?_001                                   ; 07A9 _ E9, FFFFFBBE
; CMain End of function

launch_console:; Function begin
        push    ebp                                     ; 07AE _ 55
        mov     ebp, esp                                ; 07AF _ 89. E5
        push    ebx                                     ; 07B1 _ 53
        sub     esp, 20                                 ; 07B2 _ 83. EC, 14
        mov     eax, dword [shtctl]                     ; 07B5 _ A1, 00000264(d)
        sub     esp, 12                                 ; 07BA _ 83. EC, 0C
        push    eax                                     ; 07BD _ 50
        call    sheet_alloc                             ; 07BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07C3 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 07C6 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 07C9 _ A1, 00000000(d)
        sub     esp, 8                                  ; 07CE _ 83. EC, 08
        push    42240                                   ; 07D1 _ 68, 0000A500
        push    eax                                     ; 07D6 _ 50
        call    memman_alloc_4k                         ; 07D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07DC _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 07DF _ 89. 45, F0
        sub     esp, 12                                 ; 07E2 _ 83. EC, 0C
        push    99                                      ; 07E5 _ 6A, 63
        push    165                                     ; 07E7 _ 68, 000000A5
        push    256                                     ; 07EC _ 68, 00000100
        push    dword [ebp-10H]                         ; 07F1 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 07F4 _ FF. 75, F4
        call    sheet_setbuf                            ; 07F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07FC _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 07FF _ A1, 00000264(d)
        push    0                                       ; 0804 _ 6A, 00
        push    ?_347                                   ; 0806 _ 68, 0000001B(d)
        push    dword [ebp-0CH]                         ; 080B _ FF. 75, F4
        push    eax                                     ; 080E _ 50
        call    make_window8                            ; 080F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0814 _ 83. C4, 10
        sub     esp, 8                                  ; 0817 _ 83. EC, 08
        push    0                                       ; 081A _ 6A, 00
        push    128                                     ; 081C _ 68, 00000080
        push    240                                     ; 0821 _ 68, 000000F0
        push    28                                      ; 0826 _ 6A, 1C
        push    8                                       ; 0828 _ 6A, 08
        push    dword [ebp-0CH]                         ; 082A _ FF. 75, F4
        call    make_textbox8                           ; 082D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0832 _ 83. C4, 20
        call    task_alloc                              ; 0835 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 083A _ 89. 45, EC
        call    get_code32_addr                         ; 083D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0842 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0845 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0848 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0852 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0855 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-18H]                    ; 085F _ 8B. 45, E8
        neg     eax                                     ; 0862 _ F7. D8
        add     eax, console_task                       ; 0864 _ 05, 00000000(d)
        mov     edx, eax                                ; 0869 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 086B _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 086E _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0871 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0874 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 087B _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 087E _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0885 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0888 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 088F _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0892 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 089C _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 089F _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 08A9 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 08AC _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 08B6 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 08B9 _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 08BC _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 08BF _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 08C2 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 08C5 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 08C8 _ 8B. 40, 64
        add     eax, 4                                  ; 08CB _ 83. C0, 04
        mov     edx, eax                                ; 08CE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 08D0 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 08D3 _ 89. 02
        mov     eax, dword [ebp-14H]                    ; 08D5 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 08D8 _ 8B. 40, 64
        add     eax, 8                                  ; 08DB _ 83. C0, 08
        mov     ebx, eax                                ; 08DE _ 89. C3
        mov     eax, dword [memman]                     ; 08E0 _ A1, 00000000(d)
        sub     esp, 12                                 ; 08E5 _ 83. EC, 0C
        push    eax                                     ; 08E8 _ 50
        call    memman_total                            ; 08E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08EE _ 83. C4, 10
        mov     dword [ebx], eax                        ; 08F1 _ 89. 03
        sub     esp, 4                                  ; 08F3 _ 83. EC, 04
        push    5                                       ; 08F6 _ 6A, 05
        push    1                                       ; 08F8 _ 6A, 01
        push    dword [ebp-14H]                         ; 08FA _ FF. 75, EC
        call    task_run                                ; 08FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0902 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0905 _ A1, 00000264(d)
        push    4                                       ; 090A _ 6A, 04
        push    32                                      ; 090C _ 6A, 20
        push    dword [ebp-0CH]                         ; 090E _ FF. 75, F4
        push    eax                                     ; 0911 _ 50
        call    sheet_slide                             ; 0912 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0917 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 091A _ A1, 00000264(d)
        sub     esp, 4                                  ; 091F _ 83. EC, 04
        push    1                                       ; 0922 _ 6A, 01
        push    dword [ebp-0CH]                         ; 0924 _ FF. 75, F4
        push    eax                                     ; 0927 _ 50
        call    sheet_updown                            ; 0928 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 092D _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0930 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0933 _ A3, 00000270(d)
        mov     eax, dword [ebp-0CH]                    ; 0938 _ 8B. 45, F4
        mov     ebx, dword [ebp-4H]                     ; 093B _ 8B. 5D, FC
        leave                                           ; 093E _ C9
        ret                                             ; 093F _ C3
; launch_console End of function

cmd_mem:; Function begin
        push    ebp                                     ; 0940 _ 55
        mov     ebp, esp                                ; 0941 _ 89. E5
        sub     esp, 24                                 ; 0943 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0946 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 0949 _ 8D. 90, 000003FF
        test    eax, eax                                ; 094F _ 85. C0
        cmovs   eax, edx                                ; 0951 _ 0F 48. C2
        sar     eax, 10                                 ; 0954 _ C1. F8, 0A
        sub     esp, 12                                 ; 0957 _ 83. EC, 0C
        push    eax                                     ; 095A _ 50
        call    intToHexStr                             ; 095B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0960 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0963 _ 89. 45, F4
        mov     ecx, dword [?_369]                      ; 0966 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 096C _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0972 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0977 _ 83. EC, 08
        push    ?_348                                   ; 097A _ 68, 00000023(d)
        push    7                                       ; 097F _ 6A, 07
        push    ecx                                     ; 0981 _ 51
        push    16                                      ; 0982 _ 6A, 10
        push    edx                                     ; 0984 _ 52
        push    eax                                     ; 0985 _ 50
        call    showString                              ; 0986 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 098B _ 83. C4, 20
        mov     ecx, dword [?_369]                      ; 098E _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0994 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 099A _ A1, 00000264(d)
        sub     esp, 8                                  ; 099F _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 09A2 _ FF. 75, F4
        push    7                                       ; 09A5 _ 6A, 07
        push    ecx                                     ; 09A7 _ 51
        push    52                                      ; 09A8 _ 6A, 34
        push    edx                                     ; 09AA _ 52
        push    eax                                     ; 09AB _ 50
        call    showString                              ; 09AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09B1 _ 83. C4, 20
        mov     ecx, dword [?_369]                      ; 09B4 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 09BA _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 09C0 _ A1, 00000264(d)
        sub     esp, 8                                  ; 09C5 _ 83. EC, 08
        push    ?_349                                   ; 09C8 _ 68, 00000029(d)
        push    7                                       ; 09CD _ 6A, 07
        push    ecx                                     ; 09CF _ 51
        push    126                                     ; 09D0 _ 6A, 7E
        push    edx                                     ; 09D2 _ 52
        push    eax                                     ; 09D3 _ 50
        call    showString                              ; 09D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09D9 _ 83. C4, 20
        mov     edx, dword [g_Console]                  ; 09DC _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 09E2 _ A1, 00000010(d)
        sub     esp, 8                                  ; 09E7 _ 83. EC, 08
        push    edx                                     ; 09EA _ 52
        push    eax                                     ; 09EB _ 50
        call    cons_newline                            ; 09EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09F1 _ 83. C4, 10
        mov     dword [?_369], eax                      ; 09F4 _ A3, 00000010(d)
        nop                                             ; 09F9 _ 90
        leave                                           ; 09FA _ C9
        ret                                             ; 09FB _ C3
; cmd_mem End of function

kill_process:; Function begin
        push    ebp                                     ; 09FC _ 55
        mov     ebp, esp                                ; 09FD _ 89. E5
        sub     esp, 8                                  ; 09FF _ 83. EC, 08
        mov     edx, dword [g_Console]                  ; 0A02 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 0A08 _ A1, 00000010(d)
        sub     esp, 8                                  ; 0A0D _ 83. EC, 08
        push    edx                                     ; 0A10 _ 52
        push    eax                                     ; 0A11 _ 50
        call    cons_newline                            ; 0A12 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A17 _ 83. C4, 10
        mov     eax, dword [?_369]                      ; 0A1A _ A1, 00000010(d)
        add     eax, 16                                 ; 0A1F _ 83. C0, 10
        mov     dword [?_369], eax                      ; 0A22 _ A3, 00000010(d)
        mov     eax, dword [task_cons]                  ; 0A27 _ A1, 00000270(d)
        add     eax, 48                                 ; 0A2C _ 83. C0, 30
        sub     esp, 12                                 ; 0A2F _ 83. EC, 0C
        push    eax                                     ; 0A32 _ 50
        call    asm_end_app                             ; 0A33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A38 _ 83. C4, 10
        nop                                             ; 0A3B _ 90
        leave                                           ; 0A3C _ C9
        ret                                             ; 0A3D _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0A3E _ 55
        mov     ebp, esp                                ; 0A3F _ 89. E5
        sub     esp, 40                                 ; 0A41 _ 83. EC, 28
        mov     dword [ebp-0CH], 78848                  ; 0A44 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0A4B _ A1, 00000000(d)
        sub     esp, 8                                  ; 0A50 _ 83. EC, 08
        push    13                                      ; 0A53 _ 6A, 0D
        push    eax                                     ; 0A55 _ 50
        call    memman_alloc                            ; 0A56 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A5B _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0A5E _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0A61 _ 8B. 45, E8
        add     eax, 12                                 ; 0A64 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0A67 _ C6. 00, 00
        jmp     ?_021                                   ; 0A6A _ E9, 00000109

?_014:  mov     dword [ebp-10H], 0                      ; 0A6F _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 0A76 _ EB, 28

?_015:  mov     edx, dword [ebp-0CH]                    ; 0A78 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0A7B _ 8B. 45, F0
        add     eax, edx                                ; 0A7E _ 01. D0
        movzx   eax, byte [eax]                         ; 0A80 _ 0F B6. 00
        test    al, al                                  ; 0A83 _ 84. C0
        jz      ?_017                                   ; 0A85 _ 74, 21
        mov     edx, dword [ebp-10H]                    ; 0A87 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0A8A _ 8B. 45, E8
        add     eax, edx                                ; 0A8D _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0A8F _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 0A92 _ 8B. 55, F0
        add     edx, ecx                                ; 0A95 _ 01. CA
        movzx   edx, byte [edx]                         ; 0A97 _ 0F B6. 12
        mov     byte [eax], dl                          ; 0A9A _ 88. 10
        add     dword [ebp-10H], 1                      ; 0A9C _ 83. 45, F0, 01
?_016:  cmp     dword [ebp-10H], 7                      ; 0AA0 _ 83. 7D, F0, 07
        jle     ?_015                                   ; 0AA4 _ 7E, D2
        jmp     ?_018                                   ; 0AA6 _ EB, 01

?_017:  nop                                             ; 0AA8 _ 90
?_018:  mov     dword [ebp-14H], 0                      ; 0AA9 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0AB0 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0AB3 _ 8B. 45, E8
        add     eax, edx                                ; 0AB6 _ 01. D0
        mov     byte [eax], 46                          ; 0AB8 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0ABB _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0ABF _ C7. 45, EC, 00000000
        jmp     ?_020                                   ; 0AC6 _ EB, 20

?_019:  mov     edx, dword [ebp-10H]                    ; 0AC8 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0ACB _ 8B. 45, E8
        add     eax, edx                                ; 0ACE _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0AD0 _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 0AD3 _ 8B. 55, EC
        add     edx, ecx                                ; 0AD6 _ 01. CA
        add     edx, 8                                  ; 0AD8 _ 83. C2, 08
        movzx   edx, byte [edx]                         ; 0ADB _ 0F B6. 12
        mov     byte [eax], dl                          ; 0ADE _ 88. 10
        add     dword [ebp-10H], 1                      ; 0AE0 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0AE4 _ 83. 45, EC, 01
?_020:  cmp     dword [ebp-14H], 2                      ; 0AE8 _ 83. 7D, EC, 02
        jle     ?_019                                   ; 0AEC _ 7E, DA
        mov     ecx, dword [?_369]                      ; 0AEE _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0AF4 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0AFA _ A1, 00000264(d)
        sub     esp, 8                                  ; 0AFF _ 83. EC, 08
        push    dword [ebp-18H]                         ; 0B02 _ FF. 75, E8
        push    7                                       ; 0B05 _ 6A, 07
        push    ecx                                     ; 0B07 _ 51
        push    16                                      ; 0B08 _ 6A, 10
        push    edx                                     ; 0B0A _ 52
        push    eax                                     ; 0B0B _ 50
        call    showString                              ; 0B0C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B11 _ 83. C4, 20
        mov     dword [ebp-1CH], 136                    ; 0B14 _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0B1B _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0B1E _ 8B. 40, 1C
        sub     esp, 12                                 ; 0B21 _ 83. EC, 0C
        push    eax                                     ; 0B24 _ 50
        call    intToHexStr                             ; 0B25 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B2A _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0B2D _ 89. 45, E0
        mov     ecx, dword [?_369]                      ; 0B30 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0B36 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0B3C _ A1, 00000264(d)
        sub     esp, 8                                  ; 0B41 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0B44 _ FF. 75, E0
        push    7                                       ; 0B47 _ 6A, 07
        push    ecx                                     ; 0B49 _ 51
        push    dword [ebp-1CH]                         ; 0B4A _ FF. 75, E4
        push    edx                                     ; 0B4D _ 52
        push    eax                                     ; 0B4E _ 50
        call    showString                              ; 0B4F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B54 _ 83. C4, 20
        mov     edx, dword [g_Console]                  ; 0B57 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 0B5D _ A1, 00000010(d)
        sub     esp, 8                                  ; 0B62 _ 83. EC, 08
        push    edx                                     ; 0B65 _ 52
        push    eax                                     ; 0B66 _ 50
        call    cons_newline                            ; 0B67 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B6C _ 83. C4, 10
        mov     dword [?_369], eax                      ; 0B6F _ A3, 00000010(d)
        add     dword [ebp-0CH], 32                     ; 0B74 _ 83. 45, F4, 20
?_021:  mov     eax, dword [ebp-0CH]                    ; 0B78 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0B7B _ 0F B6. 00
        test    al, al                                  ; 0B7E _ 84. C0
        jne     ?_014                                   ; 0B80 _ 0F 85, FFFFFEE9
        mov     edx, dword [ebp-18H]                    ; 0B86 _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 0B89 _ A1, 00000000(d)
        sub     esp, 4                                  ; 0B8E _ 83. EC, 04
        push    13                                      ; 0B91 _ 6A, 0D
        push    edx                                     ; 0B93 _ 52
        push    eax                                     ; 0B94 _ 50
        call    memman_free                             ; 0B95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B9A _ 83. C4, 10
        nop                                             ; 0B9D _ 90
        leave                                           ; 0B9E _ C9
        ret                                             ; 0B9F _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0BA0 _ 55
        mov     ebp, esp                                ; 0BA1 _ 89. E5
        push    esi                                     ; 0BA3 _ 56
        push    ebx                                     ; 0BA4 _ 53
        sub     esp, 64                                 ; 0BA5 _ 83. EC, 40
        mov     eax, dword [memman]                     ; 0BA8 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0BAD _ 83. EC, 08
        push    13                                      ; 0BB0 _ 6A, 0D
        push    eax                                     ; 0BB2 _ 50
        call    memman_alloc                            ; 0BB3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BB8 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0BBB _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0BBE _ 8B. 45, DC
        add     eax, 12                                 ; 0BC1 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0BC4 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0BC7 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0BCE _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0BD5 _ C7. 45, F0, 00000005
        jmp     ?_023                                   ; 0BDC _ EB, 2C

?_022:  mov     edx, dword [ebp-10H]                    ; 0BDE _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0BE1 _ 8B. 45, 08
        add     eax, edx                                ; 0BE4 _ 01. D0
        movzx   eax, byte [eax]                         ; 0BE6 _ 0F B6. 00
        test    al, al                                  ; 0BE9 _ 84. C0
        jz      ?_024                                   ; 0BEB _ 74, 25
        mov     edx, dword [ebp-0CH]                    ; 0BED _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0BF0 _ 8B. 45, DC
        add     edx, eax                                ; 0BF3 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0BF5 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0BF8 _ 8B. 45, 08
        add     eax, ecx                                ; 0BFB _ 01. C8
        movzx   eax, byte [eax]                         ; 0BFD _ 0F B6. 00
        mov     byte [edx], al                          ; 0C00 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0C02 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 0C06 _ 83. 45, F0, 01
?_023:  cmp     dword [ebp-10H], 16                     ; 0C0A _ 83. 7D, F0, 10
        jle     ?_022                                   ; 0C0E _ 7E, CE
        jmp     ?_025                                   ; 0C10 _ EB, 01

?_024:  nop                                             ; 0C12 _ 90
?_025:  mov     edx, dword [ebp-0CH]                    ; 0C13 _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0C16 _ 8B. 45, DC
        add     eax, edx                                ; 0C19 _ 01. D0
        mov     byte [eax], 0                           ; 0C1B _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 0C1E _ C7. 45, EC, 00013400
        jmp     ?_040                                   ; 0C25 _ E9, 00000224

?_026:  mov     byte [ebp-2DH], 0                       ; 0C2A _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 0C2E _ C7. 45, E8, 00000000
        jmp     ?_028                                   ; 0C35 _ EB, 2A

?_027:  mov     edx, dword [ebp-14H]                    ; 0C37 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0C3A _ 8B. 45, E8
        add     eax, edx                                ; 0C3D _ 01. D0
        movzx   eax, byte [eax]                         ; 0C3F _ 0F B6. 00
        test    al, al                                  ; 0C42 _ 84. C0
        jz      ?_029                                   ; 0C44 _ 74, 23
        mov     edx, dword [ebp-14H]                    ; 0C46 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0C49 _ 8B. 45, E8
        add     eax, edx                                ; 0C4C _ 01. D0
        movzx   eax, byte [eax]                         ; 0C4E _ 0F B6. 00
        mov     ecx, eax                                ; 0C51 _ 89. C1
        lea     edx, [ebp-39H]                          ; 0C53 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0C56 _ 8B. 45, E8
        add     eax, edx                                ; 0C59 _ 01. D0
        mov     byte [eax], cl                          ; 0C5B _ 88. 08
        add     dword [ebp-18H], 1                      ; 0C5D _ 83. 45, E8, 01
?_028:  cmp     dword [ebp-18H], 7                      ; 0C61 _ 83. 7D, E8, 07
        jle     ?_027                                   ; 0C65 _ 7E, D0
        jmp     ?_030                                   ; 0C67 _ EB, 01

?_029:  nop                                             ; 0C69 _ 90
?_030:  mov     dword [ebp-1CH], 0                      ; 0C6A _ C7. 45, E4, 00000000
        lea     edx, [ebp-39H]                          ; 0C71 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0C74 _ 8B. 45, E8
        add     eax, edx                                ; 0C77 _ 01. D0
        mov     byte [eax], 46                          ; 0C79 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 0C7C _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 0C80 _ C7. 45, E4, 00000000
        jmp     ?_032                                   ; 0C87 _ EB, 22

?_031:  mov     edx, dword [ebp-14H]                    ; 0C89 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 0C8C _ 8B. 45, E4
        add     eax, edx                                ; 0C8F _ 01. D0
        add     eax, 8                                  ; 0C91 _ 83. C0, 08
        movzx   eax, byte [eax]                         ; 0C94 _ 0F B6. 00
        mov     ecx, eax                                ; 0C97 _ 89. C1
        lea     edx, [ebp-39H]                          ; 0C99 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0C9C _ 8B. 45, E8
        add     eax, edx                                ; 0C9F _ 01. D0
        mov     byte [eax], cl                          ; 0CA1 _ 88. 08
        add     dword [ebp-18H], 1                      ; 0CA3 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 0CA7 _ 83. 45, E4, 01
?_032:  cmp     dword [ebp-1CH], 2                      ; 0CAB _ 83. 7D, E4, 02
        jle     ?_031                                   ; 0CAF _ 7E, D8
        sub     esp, 8                                  ; 0CB1 _ 83. EC, 08
        lea     eax, [ebp-39H]                          ; 0CB4 _ 8D. 45, C7
        push    eax                                     ; 0CB7 _ 50
        push    dword [ebp-24H]                         ; 0CB8 _ FF. 75, DC
        call    strcmp                                  ; 0CBB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CC0 _ 83. C4, 10
        cmp     eax, 1                                  ; 0CC3 _ 83. F8, 01
        jne     ?_039                                   ; 0CC6 _ 0F 85, 0000017E
        mov     dword [ebp-28H], 88064                  ; 0CCC _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-14H]                    ; 0CD3 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 0CD6 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 0CDA _ 0F B7. C0
        shl     eax, 9                                  ; 0CDD _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 0CE0 _ 01. 45, D8
        mov     eax, dword [ebp-14H]                    ; 0CE3 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 0CE6 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 0CE9 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 0CEC _ C7. 45, E0, 00000000
        mov     dword [?_368], 16                       ; 0CF3 _ C7. 05, 0000000C(d), 00000010
        mov     dword [ebp-20H], 0                      ; 0CFD _ C7. 45, E0, 00000000
        jmp     ?_038                                   ; 0D04 _ E9, 00000132

?_033:  mov     edx, dword [ebp-20H]                    ; 0D09 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 0D0C _ 8B. 45, D8
        add     eax, edx                                ; 0D0F _ 01. D0
        movzx   eax, byte [eax]                         ; 0D11 _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 0D14 _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 0D17 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 0D1B _ 0F B6. 45, C5
        cmp     al, 9                                   ; 0D1F _ 3C, 09
        jnz     ?_035                                   ; 0D21 _ 75, 6F
?_034:  mov     ebx, dword [?_369]                      ; 0D23 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_368]                      ; 0D29 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 0D2F _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0D35 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0D3A _ 83. EC, 08
        push    ?_350                                   ; 0D3D _ 68, 0000002D(d)
        push    7                                       ; 0D42 _ 6A, 07
        push    ebx                                     ; 0D44 _ 53
        push    ecx                                     ; 0D45 _ 51
        push    edx                                     ; 0D46 _ 52
        push    eax                                     ; 0D47 _ 50
        call    showString                              ; 0D48 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D4D _ 83. C4, 20
        mov     eax, dword [?_368]                      ; 0D50 _ A1, 0000000C(d)
        add     eax, 8                                  ; 0D55 _ 83. C0, 08
        mov     dword [?_368], eax                      ; 0D58 _ A3, 0000000C(d)
        mov     eax, dword [?_368]                      ; 0D5D _ A1, 0000000C(d)
        cmp     eax, 248                                ; 0D62 _ 3D, 000000F8
        jnz     ?_034                                   ; 0D67 _ 75, BA
        mov     dword [?_368], 8                        ; 0D69 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 0D73 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 0D79 _ A1, 00000010(d)
        sub     esp, 8                                  ; 0D7E _ 83. EC, 08
        push    edx                                     ; 0D81 _ 52
        push    eax                                     ; 0D82 _ 50
        call    cons_newline                            ; 0D83 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D88 _ 83. C4, 10
        mov     dword [?_369], eax                      ; 0D8B _ A3, 00000010(d)
        jmp     ?_034                                   ; 0D90 _ EB, 91

?_035:  movzx   eax, byte [ebp-3BH]                     ; 0D92 _ 0F B6. 45, C5
        cmp     al, 10                                  ; 0D96 _ 3C, 0A
        jnz     ?_036                                   ; 0D98 _ 75, 29
        mov     dword [?_368], 8                        ; 0D9A _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 0DA4 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 0DAA _ A1, 00000010(d)
        sub     esp, 8                                  ; 0DAF _ 83. EC, 08
        push    edx                                     ; 0DB2 _ 52
        push    eax                                     ; 0DB3 _ 50
        call    cons_newline                            ; 0DB4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB9 _ 83. C4, 10
        mov     dword [?_369], eax                      ; 0DBC _ A3, 00000010(d)
        jmp     ?_037                                   ; 0DC1 _ EB, 74

?_036:  movzx   eax, byte [ebp-3BH]                     ; 0DC3 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 0DC7 _ 3C, 0D
        jz      ?_037                                   ; 0DC9 _ 74, 6C
        mov     ebx, dword [?_369]                      ; 0DCB _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_368]                      ; 0DD1 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 0DD7 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0DDD _ A1, 00000264(d)
        sub     esp, 8                                  ; 0DE2 _ 83. EC, 08
        lea     esi, [ebp-3BH]                          ; 0DE5 _ 8D. 75, C5
        push    esi                                     ; 0DE8 _ 56
        push    7                                       ; 0DE9 _ 6A, 07
        push    ebx                                     ; 0DEB _ 53
        push    ecx                                     ; 0DEC _ 51
        push    edx                                     ; 0DED _ 52
        push    eax                                     ; 0DEE _ 50
        call    showString                              ; 0DEF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DF4 _ 83. C4, 20
        mov     eax, dword [?_368]                      ; 0DF7 _ A1, 0000000C(d)
        add     eax, 8                                  ; 0DFC _ 83. C0, 08
        mov     dword [?_368], eax                      ; 0DFF _ A3, 0000000C(d)
        mov     eax, dword [?_368]                      ; 0E04 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 0E09 _ 3D, 000000F8
        jnz     ?_037                                   ; 0E0E _ 75, 27
        mov     dword [?_368], 16                       ; 0E10 _ C7. 05, 0000000C(d), 00000010
        mov     edx, dword [g_Console]                  ; 0E1A _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 0E20 _ A1, 00000010(d)
        sub     esp, 8                                  ; 0E25 _ 83. EC, 08
        push    edx                                     ; 0E28 _ 52
        push    eax                                     ; 0E29 _ 50
        call    cons_newline                            ; 0E2A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E2F _ 83. C4, 10
        mov     dword [?_369], eax                      ; 0E32 _ A3, 00000010(d)
?_037:  add     dword [ebp-20H], 1                      ; 0E37 _ 83. 45, E0, 01
?_038:  mov     eax, dword [ebp-20H]                    ; 0E3B _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 0E3E _ 3B. 45, D4
        jl      ?_033                                   ; 0E41 _ 0F 8C, FFFFFEC2
        nop                                             ; 0E47 _ 90
        jmp     ?_041                                   ; 0E48 _ EB, 12

?_039:  add     dword [ebp-14H], 32                     ; 0E4A _ 83. 45, EC, 20
?_040:  mov     eax, dword [ebp-14H]                    ; 0E4E _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 0E51 _ 0F B6. 00
        test    al, al                                  ; 0E54 _ 84. C0
        jne     ?_026                                   ; 0E56 _ 0F 85, FFFFFDCE
?_041:  mov     edx, dword [g_Console]                  ; 0E5C _ 8B. 15, 00000008(d)
        mov     eax, dword [?_369]                      ; 0E62 _ A1, 00000010(d)
        sub     esp, 8                                  ; 0E67 _ 83. EC, 08
        push    edx                                     ; 0E6A _ 52
        push    eax                                     ; 0E6B _ 50
        call    cons_newline                            ; 0E6C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E71 _ 83. C4, 10
        mov     dword [?_369], eax                      ; 0E74 _ A3, 00000010(d)
        mov     edx, dword [ebp-24H]                    ; 0E79 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 0E7C _ A1, 00000000(d)
        sub     esp, 4                                  ; 0E81 _ 83. EC, 04
        push    13                                      ; 0E84 _ 6A, 0D
        push    edx                                     ; 0E86 _ 52
        push    eax                                     ; 0E87 _ 50
        call    memman_free                             ; 0E88 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E8D _ 83. C4, 10
        mov     dword [?_368], 16                       ; 0E90 _ C7. 05, 0000000C(d), 00000010
        nop                                             ; 0E9A _ 90
        lea     esp, [ebp-8H]                           ; 0E9B _ 8D. 65, F8
        pop     ebx                                     ; 0E9E _ 5B
        pop     esi                                     ; 0E9F _ 5E
        pop     ebp                                     ; 0EA0 _ 5D
        ret                                             ; 0EA1 _ C3
; cmd_type End of function

cmd_cls:; Function begin
        push    ebp                                     ; 0EA2 _ 55
        mov     ebp, esp                                ; 0EA3 _ 89. E5
        sub     esp, 24                                 ; 0EA5 _ 83. EC, 18
        mov     dword [ebp-0CH], 8                      ; 0EA8 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 0EAF _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 0EB6 _ C7. 45, F0, 0000001C
        jmp     ?_045                                   ; 0EBD _ EB, 39

?_042:  mov     dword [ebp-0CH], 8                      ; 0EBF _ C7. 45, F4, 00000008
        jmp     ?_044                                   ; 0EC6 _ EB, 23

?_043:  mov     eax, dword [g_Console]                  ; 0EC8 _ A1, 00000008(d)
        mov     edx, dword [eax]                        ; 0ECD _ 8B. 10
        mov     eax, dword [g_Console]                  ; 0ECF _ A1, 00000008(d)
        mov     eax, dword [eax+4H]                     ; 0ED4 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 0ED7 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 0EDB _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 0EDD _ 8B. 45, F4
        add     eax, ecx                                ; 0EE0 _ 01. C8
        add     eax, edx                                ; 0EE2 _ 01. D0
        mov     byte [eax], 0                           ; 0EE4 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 0EE7 _ 83. 45, F4, 01
?_044:  cmp     dword [ebp-0CH], 247                    ; 0EEB _ 81. 7D, F4, 000000F7
        jle     ?_043                                   ; 0EF2 _ 7E, D4
        add     dword [ebp-10H], 1                      ; 0EF4 _ 83. 45, F0, 01
?_045:  cmp     dword [ebp-10H], 155                    ; 0EF8 _ 81. 7D, F0, 0000009B
        jle     ?_042                                   ; 0EFF _ 7E, BE
        mov     edx, dword [g_Console]                  ; 0F01 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0F07 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0F0C _ 83. EC, 08
        push    156                                     ; 0F0F _ 68, 0000009C
        push    248                                     ; 0F14 _ 68, 000000F8
        push    28                                      ; 0F19 _ 6A, 1C
        push    8                                       ; 0F1B _ 6A, 08
        push    edx                                     ; 0F1D _ 52
        push    eax                                     ; 0F1E _ 50
        call    sheet_refresh                           ; 0F1F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F24 _ 83. C4, 20
        mov     dword [?_369], 28                       ; 0F27 _ C7. 05, 00000010(d), 0000001C
        mov     edx, dword [g_Console]                  ; 0F31 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0F37 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0F3C _ 83. EC, 08
        push    ?_351                                   ; 0F3F _ 68, 0000002F(d)
        push    7                                       ; 0F44 _ 6A, 07
        push    28                                      ; 0F46 _ 6A, 1C
        push    8                                       ; 0F48 _ 6A, 08
        push    edx                                     ; 0F4A _ 52
        push    eax                                     ; 0F4B _ 50
        call    showString                              ; 0F4C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F51 _ 83. C4, 20
        nop                                             ; 0F54 _ 90
        leave                                           ; 0F55 _ C9
        ret                                             ; 0F56 _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 0F57 _ 55
        mov     ebp, esp                                ; 0F58 _ 89. E5
        sub     esp, 24                                 ; 0F5A _ 83. EC, 18
        sub     esp, 8                                  ; 0F5D _ 83. EC, 08
        push    buffer                                  ; 0F60 _ 68, 00000278(d)
        push    ?_352                                   ; 0F65 _ 68, 00000031(d)
        call    file_loadfile                           ; 0F6A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F6F _ 83. C4, 10
        call    get_addr_gdt                            ; 0F72 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0F77 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 0F7A _ A1, 00000278(d)
        mov     edx, eax                                ; 0F7F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0F81 _ 8B. 45, F4
        add     eax, 88                                 ; 0F84 _ 83. C0, 58
        push    16634                                   ; 0F87 _ 68, 000040FA
        push    edx                                     ; 0F8C _ 52
        push    1048575                                 ; 0F8D _ 68, 000FFFFF
        push    eax                                     ; 0F92 _ 50
        call    set_segmdesc                            ; 0F93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F98 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0F9B _ A1, 00000000(d)
        sub     esp, 8                                  ; 0FA0 _ 83. EC, 08
        push    65536                                   ; 0FA3 _ 68, 00010000
        push    eax                                     ; 0FA8 _ 50
        call    memman_alloc_4k                         ; 0FA9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FAE _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0FB1 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0FB4 _ 8B. 45, F0
        mov     dword [?_378], eax                      ; 0FB7 _ A3, 0000027C(d)
        mov     eax, dword [ebp-10H]                    ; 0FBC _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 0FBF _ 8B. 55, F4
        add     edx, 96                                 ; 0FC2 _ 83. C2, 60
        push    16626                                   ; 0FC5 _ 68, 000040F2
        push    eax                                     ; 0FCA _ 50
        push    65535                                   ; 0FCB _ 68, 0000FFFF
        push    edx                                     ; 0FD0 _ 52
        call    set_segmdesc                            ; 0FD1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FD6 _ 83. C4, 10
        call    task_now                                ; 0FD9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0FDE _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0FE1 _ 8B. 45, EC
        add     eax, 48                                 ; 0FE4 _ 83. C0, 30
        sub     esp, 12                                 ; 0FE7 _ 83. EC, 0C
        push    eax                                     ; 0FEA _ 50
        push    96                                      ; 0FEB _ 6A, 60
        push    65536                                   ; 0FED _ 68, 00010000
        push    88                                      ; 0FF2 _ 6A, 58
        push    0                                       ; 0FF4 _ 6A, 00
        call    start_app                               ; 0FF6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FFB _ 83. C4, 20
        mov     eax, dword [?_379]                      ; 0FFE _ A1, 00000280(d)
        mov     ecx, eax                                ; 1003 _ 89. C1
        mov     eax, dword [buffer]                     ; 1005 _ A1, 00000278(d)
        mov     edx, eax                                ; 100A _ 89. C2
        mov     eax, dword [memman]                     ; 100C _ A1, 00000000(d)
        sub     esp, 4                                  ; 1011 _ 83. EC, 04
        push    ecx                                     ; 1014 _ 51
        push    edx                                     ; 1015 _ 52
        push    eax                                     ; 1016 _ 50
        call    memman_free_4k                          ; 1017 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 101C _ 83. C4, 10
        mov     edx, dword [ebp-10H]                    ; 101F _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 1022 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1027 _ 83. EC, 04
        push    65536                                   ; 102A _ 68, 00010000
        push    edx                                     ; 102F _ 52
        push    eax                                     ; 1030 _ 50
        call    memman_free_4k                          ; 1031 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1036 _ 83. C4, 10
        nop                                             ; 1039 _ 90
        leave                                           ; 103A _ C9
        ret                                             ; 103B _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 103C _ 55
        mov     ebp, esp                                ; 103D _ 89. E5
        sub     esp, 56                                 ; 103F _ 83. EC, 38
        call    task_now                                ; 1042 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1047 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 104A _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1051 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1058 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 105F _ A1, 00000000(d)
        sub     esp, 8                                  ; 1064 _ 83. EC, 08
        push    128                                     ; 1067 _ 68, 00000080
        push    eax                                     ; 106C _ 50
        call    memman_alloc                            ; 106D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1072 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1075 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 1078 _ A1, 00000000(d)
        sub     esp, 8                                  ; 107D _ 83. EC, 08
        push    30                                      ; 1080 _ 6A, 1E
        push    eax                                     ; 1082 _ 50
        call    memman_alloc                            ; 1083 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1088 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 108B _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 108E _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 1091 _ A3, 00000008(d)
        mov     dword [?_368], 16                       ; 1096 _ C7. 05, 0000000C(d), 00000010
        mov     dword [?_369], 28                       ; 10A0 _ C7. 05, 00000010(d), 0000001C
        mov     dword [?_370], -1                       ; 10AA _ C7. 05, 00000014(d), FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 10B4 _ 8B. 45, F0
        add     eax, 16                                 ; 10B7 _ 83. C0, 10
        push    dword [ebp-10H]                         ; 10BA _ FF. 75, F0
        push    dword [ebp-1CH]                         ; 10BD _ FF. 75, E4
        push    128                                     ; 10C0 _ 68, 00000080
        push    eax                                     ; 10C5 _ 50
        call    fifo8_init                              ; 10C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10CB _ 83. C4, 10
        call    timer_alloc                             ; 10CE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 10D3 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 10D6 _ 8B. 45, F0
        add     eax, 16                                 ; 10D9 _ 83. C0, 10
        sub     esp, 4                                  ; 10DC _ 83. EC, 04
        push    1                                       ; 10DF _ 6A, 01
        push    eax                                     ; 10E1 _ 50
        push    dword [ebp-24H]                         ; 10E2 _ FF. 75, DC
        call    timer_init                              ; 10E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10EA _ 83. C4, 10
        sub     esp, 8                                  ; 10ED _ 83. EC, 08
        push    50                                      ; 10F0 _ 6A, 32
        push    dword [ebp-24H]                         ; 10F2 _ FF. 75, DC
        call    timer_settime                           ; 10F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10FA _ 83. C4, 10
        mov     eax, dword [ebp-24H]                    ; 10FD _ 8B. 45, DC
        mov     dword [?_373], eax                      ; 1100 _ A3, 0000001C(d)
        mov     eax, dword [shtctl]                     ; 1105 _ A1, 00000264(d)
        sub     esp, 8                                  ; 110A _ 83. EC, 08
        push    ?_351                                   ; 110D _ 68, 0000002F(d)
        push    7                                       ; 1112 _ 6A, 07
        push    28                                      ; 1114 _ 6A, 1C
        push    8                                       ; 1116 _ 6A, 08
        push    dword [ebp+8H]                          ; 1118 _ FF. 75, 08
        push    eax                                     ; 111B _ 50
        call    showString                              ; 111C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1121 _ 83. C4, 20
        mov     dword [ebp-28H], 0                      ; 1124 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 112B _ C7. 45, D4, 00013400
?_046:  call    io_cli                                  ; 1132 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1137 _ 8B. 45, F0
        add     eax, 16                                 ; 113A _ 83. C0, 10
        sub     esp, 12                                 ; 113D _ 83. EC, 0C
        push    eax                                     ; 1140 _ 50
        call    fifo8_status                            ; 1141 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1146 _ 83. C4, 10
        test    eax, eax                                ; 1149 _ 85. C0
        jnz     ?_047                                   ; 114B _ 75, 07
        call    io_sti                                  ; 114D _ E8, FFFFFFFC(rel)
        jmp     ?_046                                   ; 1152 _ EB, DE

?_047:  call    io_sti                                  ; 1154 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1159 _ 8B. 45, F0
        add     eax, 16                                 ; 115C _ 83. C0, 10
        sub     esp, 12                                 ; 115F _ 83. EC, 0C
        push    eax                                     ; 1162 _ 50
        call    fifo8_get                               ; 1163 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1168 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 116B _ 89. 45, D0
        cmp     dword [ebp-30H], 1                      ; 116E _ 83. 7D, D0, 01
        jg      ?_050                                   ; 1172 _ 7F, 5F
        cmp     dword [ebp-0CH], 0                      ; 1174 _ 83. 7D, F4, 00
        js      ?_050                                   ; 1178 _ 78, 59
        cmp     dword [ebp-30H], 0                      ; 117A _ 83. 7D, D0, 00
        jz      ?_048                                   ; 117E _ 74, 20
        mov     eax, dword [ebp-10H]                    ; 1180 _ 8B. 45, F0
        add     eax, 16                                 ; 1183 _ 83. C0, 10
        sub     esp, 4                                  ; 1186 _ 83. EC, 04
        push    0                                       ; 1189 _ 6A, 00
        push    eax                                     ; 118B _ 50
        push    dword [ebp-24H]                         ; 118C _ FF. 75, DC
        call    timer_init                              ; 118F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1194 _ 83. C4, 10
        mov     dword [ebp-0CH], 7                      ; 1197 _ C7. 45, F4, 00000007
        jmp     ?_049                                   ; 119E _ EB, 1E

?_048:  mov     eax, dword [ebp-10H]                    ; 11A0 _ 8B. 45, F0
        add     eax, 16                                 ; 11A3 _ 83. C0, 10
        sub     esp, 4                                  ; 11A6 _ 83. EC, 04
        push    1                                       ; 11A9 _ 6A, 01
        push    eax                                     ; 11AB _ 50
        push    dword [ebp-24H]                         ; 11AC _ FF. 75, DC
        call    timer_init                              ; 11AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11B4 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 11B7 _ C7. 45, F4, 00000000
?_049:  sub     esp, 8                                  ; 11BE _ 83. EC, 08
        push    50                                      ; 11C1 _ 6A, 32
        push    dword [ebp-24H]                         ; 11C3 _ FF. 75, DC
        call    timer_settime                           ; 11C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11CB _ 83. C4, 10
        jmp     ?_060                                   ; 11CE _ E9, 00000291

?_050:  cmp     dword [ebp-30H], 87                     ; 11D3 _ 83. 7D, D0, 57
        jnz     ?_051                                   ; 11D7 _ 75, 33
        mov     dword [ebp-0CH], 7                      ; 11D9 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 11E0 _ 8B. 45, F0
        add     eax, 16                                 ; 11E3 _ 83. C0, 10
        sub     esp, 4                                  ; 11E6 _ 83. EC, 04
        push    0                                       ; 11E9 _ 6A, 00
        push    eax                                     ; 11EB _ 50
        push    dword [ebp-24H]                         ; 11EC _ FF. 75, DC
        call    timer_init                              ; 11EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11F4 _ 83. C4, 10
        sub     esp, 8                                  ; 11F7 _ 83. EC, 08
        push    50                                      ; 11FA _ 6A, 32
        push    dword [ebp-24H]                         ; 11FC _ FF. 75, DC
        call    timer_settime                           ; 11FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1204 _ 83. C4, 10
        jmp     ?_060                                   ; 1207 _ E9, 00000258

?_051:  cmp     dword [ebp-30H], 88                     ; 120C _ 83. 7D, D0, 58
        jnz     ?_052                                   ; 1210 _ 75, 45
        mov     ecx, dword [?_369]                      ; 1212 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_368]                      ; 1218 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 121E _ A1, 00000264(d)
        sub     esp, 12                                 ; 1223 _ 83. EC, 0C
        push    0                                       ; 1226 _ 6A, 00
        push    ecx                                     ; 1228 _ 51
        push    edx                                     ; 1229 _ 52
        push    dword [ebp+8H]                          ; 122A _ FF. 75, 08
        push    eax                                     ; 122D _ 50
        call    set_cursor                              ; 122E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1233 _ 83. C4, 20
        mov     dword [ebp-0CH], -1                     ; 1236 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 123D _ A1, 00000274(d)
        sub     esp, 4                                  ; 1242 _ 83. EC, 04
        push    0                                       ; 1245 _ 6A, 00
        push    -1                                      ; 1247 _ 6A, FF
        push    eax                                     ; 1249 _ 50
        call    task_run                                ; 124A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 124F _ 83. C4, 10
        jmp     ?_060                                   ; 1252 _ E9, 0000020D

?_052:  cmp     dword [ebp-30H], 28                     ; 1257 _ 83. 7D, D0, 1C
        jne     ?_058                                   ; 125B _ 0F 85, 0000012E
        mov     ecx, dword [?_369]                      ; 1261 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_368]                      ; 1267 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 126D _ A1, 00000264(d)
        sub     esp, 12                                 ; 1272 _ 83. EC, 0C
        push    0                                       ; 1275 _ 6A, 00
        push    ecx                                     ; 1277 _ 51
        push    edx                                     ; 1278 _ 52
        push    dword [ebp+8H]                          ; 1279 _ FF. 75, 08
        push    eax                                     ; 127C _ 50
        call    set_cursor                              ; 127D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1282 _ 83. C4, 20
        mov     eax, dword [?_368]                      ; 1285 _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 128A _ 8D. 50, 07
        test    eax, eax                                ; 128D _ 85. C0
        cmovs   eax, edx                                ; 128F _ 0F 48. C2
        sar     eax, 3                                  ; 1292 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1295 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1298 _ 8B. 45, E0
        add     eax, edx                                ; 129B _ 01. D0
        mov     byte [eax], 0                           ; 129D _ C6. 00, 00
        mov     eax, dword [?_369]                      ; 12A0 _ A1, 00000010(d)
        sub     esp, 8                                  ; 12A5 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 12A8 _ FF. 75, 08
        push    eax                                     ; 12AB _ 50
        call    cons_newline                            ; 12AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12B1 _ 83. C4, 10
        mov     dword [?_369], eax                      ; 12B4 _ A3, 00000010(d)
        sub     esp, 8                                  ; 12B9 _ 83. EC, 08
        push    ?_353                                   ; 12BC _ 68, 00000039(d)
        push    dword [ebp-20H]                         ; 12C1 _ FF. 75, E0
        call    strcmp                                  ; 12C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12C9 _ 83. C4, 10
        cmp     eax, 1                                  ; 12CC _ 83. F8, 01
        jnz     ?_053                                   ; 12CF _ 75, 13
        sub     esp, 12                                 ; 12D1 _ 83. EC, 0C
        push    dword [ebp+0CH]                         ; 12D4 _ FF. 75, 0C
        call    cmd_mem                                 ; 12D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12DC _ 83. C4, 10
        jmp     ?_057                                   ; 12DF _ E9, 0000009C

?_053:  sub     esp, 8                                  ; 12E4 _ 83. EC, 08
        push    ?_354                                   ; 12E7 _ 68, 0000003D(d)
        push    dword [ebp-20H]                         ; 12EC _ FF. 75, E0
        call    strcmp                                  ; 12EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12F4 _ 83. C4, 10
        cmp     eax, 1                                  ; 12F7 _ 83. F8, 01
        jnz     ?_054                                   ; 12FA _ 75, 07
        call    cmd_cls                                 ; 12FC _ E8, FFFFFFFC(rel)
        jmp     ?_057                                   ; 1301 _ EB, 7D

?_054:  sub     esp, 8                                  ; 1303 _ 83. EC, 08
        push    ?_355                                   ; 1306 _ 68, 00000041(d)
        push    dword [ebp-20H]                         ; 130B _ FF. 75, E0
        call    strcmp                                  ; 130E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1313 _ 83. C4, 10
        cmp     eax, 1                                  ; 1316 _ 83. F8, 01
        jnz     ?_055                                   ; 1319 _ 75, 07
        call    cmd_dir                                 ; 131B _ E8, FFFFFFFC(rel)
        jmp     ?_057                                   ; 1320 _ EB, 5E

?_055:  sub     esp, 8                                  ; 1322 _ 83. EC, 08
        push    ?_356                                   ; 1325 _ 68, 00000045(d)
        push    dword [ebp-20H]                         ; 132A _ FF. 75, E0
        call    strcmp                                  ; 132D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1332 _ 83. C4, 10
        cmp     eax, 1                                  ; 1335 _ 83. F8, 01
        jnz     ?_056                                   ; 1338 _ 75, 07
        call    cmd_hlt                                 ; 133A _ E8, FFFFFFFC(rel)
        jmp     ?_057                                   ; 133F _ EB, 3F

?_056:  mov     eax, dword [ebp-20H]                    ; 1341 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 1344 _ 0F B6. 00
        cmp     al, 116                                 ; 1347 _ 3C, 74
        jnz     ?_057                                   ; 1349 _ 75, 35
        mov     eax, dword [ebp-20H]                    ; 134B _ 8B. 45, E0
        add     eax, 1                                  ; 134E _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1351 _ 0F B6. 00
        cmp     al, 121                                 ; 1354 _ 3C, 79
        jnz     ?_057                                   ; 1356 _ 75, 28
        mov     eax, dword [ebp-20H]                    ; 1358 _ 8B. 45, E0
        add     eax, 2                                  ; 135B _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 135E _ 0F B6. 00
        cmp     al, 112                                 ; 1361 _ 3C, 70
        jnz     ?_057                                   ; 1363 _ 75, 1B
        mov     eax, dword [ebp-20H]                    ; 1365 _ 8B. 45, E0
        add     eax, 3                                  ; 1368 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 136B _ 0F B6. 00
        cmp     al, 101                                 ; 136E _ 3C, 65
        jnz     ?_057                                   ; 1370 _ 75, 0E
        sub     esp, 12                                 ; 1372 _ 83. EC, 0C
        push    dword [ebp-20H]                         ; 1375 _ FF. 75, E0
        call    cmd_type                                ; 1378 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 137D _ 83. C4, 10
?_057:  mov     dword [?_368], 16                       ; 1380 _ C7. 05, 0000000C(d), 00000010
        jmp     ?_060                                   ; 138A _ E9, 000000D5

?_058:  cmp     dword [ebp-30H], 14                     ; 138F _ 83. 7D, D0, 0E
        jnz     ?_059                                   ; 1393 _ 75, 61
        mov     eax, dword [?_368]                      ; 1395 _ A1, 0000000C(d)
        cmp     eax, 8                                  ; 139A _ 83. F8, 08
        jle     ?_059                                   ; 139D _ 7E, 57
        mov     ecx, dword [?_369]                      ; 139F _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_368]                      ; 13A5 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 13AB _ A1, 00000264(d)
        sub     esp, 12                                 ; 13B0 _ 83. EC, 0C
        push    0                                       ; 13B3 _ 6A, 00
        push    ecx                                     ; 13B5 _ 51
        push    edx                                     ; 13B6 _ 52
        push    dword [ebp+8H]                          ; 13B7 _ FF. 75, 08
        push    eax                                     ; 13BA _ 50
        call    set_cursor                              ; 13BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13C0 _ 83. C4, 20
        mov     eax, dword [?_368]                      ; 13C3 _ A1, 0000000C(d)
        sub     eax, 8                                  ; 13C8 _ 83. E8, 08
        mov     dword [?_368], eax                      ; 13CB _ A3, 0000000C(d)
        mov     ecx, dword [?_369]                      ; 13D0 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_368]                      ; 13D6 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 13DC _ A1, 00000264(d)
        sub     esp, 12                                 ; 13E1 _ 83. EC, 0C
        push    0                                       ; 13E4 _ 6A, 00
        push    ecx                                     ; 13E6 _ 51
        push    edx                                     ; 13E7 _ 52
        push    dword [ebp+8H]                          ; 13E8 _ FF. 75, 08
        push    eax                                     ; 13EB _ 50
        call    set_cursor                              ; 13EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13F1 _ 83. C4, 20
        jmp     ?_060                                   ; 13F4 _ EB, 6E

?_059:  sub     esp, 12                                 ; 13F6 _ 83. EC, 0C
        push    dword [ebp-30H]                         ; 13F9 _ FF. 75, D0
        call    transferScanCode                        ; 13FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1401 _ 83. C4, 10
        mov     byte [ebp-31H], al                      ; 1404 _ 88. 45, CF
        mov     eax, dword [?_368]                      ; 1407 _ A1, 0000000C(d)
        cmp     eax, 239                                ; 140C _ 3D, 000000EF
        jg      ?_060                                   ; 1411 _ 7F, 51
        cmp     byte [ebp-31H], 0                       ; 1413 _ 80. 7D, CF, 00
        jz      ?_060                                   ; 1417 _ 74, 4B
        mov     eax, dword [?_368]                      ; 1419 _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 141E _ 8D. 50, 07
        test    eax, eax                                ; 1421 _ 85. C0
        cmovs   eax, edx                                ; 1423 _ 0F 48. C2
        sar     eax, 3                                  ; 1426 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1429 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 142C _ 8B. 45, E0
        add     edx, eax                                ; 142F _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 1431 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 1435 _ 88. 02
        mov     eax, dword [?_368]                      ; 1437 _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 143C _ 8D. 50, 07
        test    eax, eax                                ; 143F _ 85. C0
        cmovs   eax, edx                                ; 1441 _ 0F 48. C2
        sar     eax, 3                                  ; 1444 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1447 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 144A _ 8B. 45, E0
        add     eax, edx                                ; 144D _ 01. D0
        mov     byte [eax], 0                           ; 144F _ C6. 00, 00
        movsx   eax, byte [ebp-31H]                     ; 1452 _ 0F BE. 45, CF
        sub     esp, 8                                  ; 1456 _ 83. EC, 08
        push    1                                       ; 1459 _ 6A, 01
        push    eax                                     ; 145B _ 50
        call    cons_putchar                            ; 145C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1461 _ 83. C4, 10
?_060:  cmp     dword [ebp-0CH], 0                      ; 1464 _ 83. 7D, F4, 00
        js      ?_046                                   ; 1468 _ 0F 88, FFFFFCC4
        mov     ecx, dword [?_369]                      ; 146E _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_368]                      ; 1474 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 147A _ A1, 00000264(d)
        sub     esp, 12                                 ; 147F _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 1482 _ FF. 75, F4
        push    ecx                                     ; 1485 _ 51
        push    edx                                     ; 1486 _ 52
        push    dword [ebp+8H]                          ; 1487 _ FF. 75, 08
        push    eax                                     ; 148A _ 50
        call    set_cursor                              ; 148B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1490 _ 83. C4, 20
        jmp     ?_046                                   ; 1493 _ E9, FFFFFC9A
; console_task End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 1498 _ 55
        mov     ebp, esp                                ; 1499 _ 89. E5
        sub     esp, 8                                  ; 149B _ 83. EC, 08
        sub     esp, 12                                 ; 149E _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 14A1 _ FF. 75, 08
        call    transferScanCode                        ; 14A4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14A9 _ 83. C4, 10
        cmp     dword [ebp+8H], 58                      ; 14AC _ 83. 7D, 08, 3A
        jz      ?_061                                   ; 14B0 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 14B2 _ 81. 7D, 08, 000000BA
        jz      ?_061                                   ; 14B9 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 14BB _ 83. 7D, 08, 2A
        jz      ?_061                                   ; 14BF _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 14C1 _ 83. 7D, 08, 36
        jz      ?_061                                   ; 14C5 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 14C7 _ 81. 7D, 08, 000000AA
        jz      ?_061                                   ; 14CE _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 14D0 _ 81. 7D, 08, 000000B6
        jnz     ?_062                                   ; 14D7 _ 75, 07
?_061:  mov     eax, 1                                  ; 14D9 _ B8, 00000001
        jmp     ?_063                                   ; 14DE _ EB, 05

?_062:  mov     eax, 0                                  ; 14E0 _ B8, 00000000
?_063:  leave                                           ; 14E5 _ C9
        ret                                             ; 14E6 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 14E7 _ 55
        mov     ebp, esp                                ; 14E8 _ 89. E5
        sub     esp, 16                                 ; 14EA _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 14ED _ 83. 7D, 08, 2A
        jnz     ?_064                                   ; 14F1 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 14F3 _ A1, 00000000(d)
        or      eax, 01H                                ; 14F8 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 14FB _ A3, 00000000(d)
?_064:  cmp     dword [ebp+8H], 54                      ; 1500 _ 83. 7D, 08, 36
        jnz     ?_065                                   ; 1504 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1506 _ A1, 00000000(d)
        or      eax, 02H                                ; 150B _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 150E _ A3, 00000000(d)
?_065:  cmp     dword [ebp+8H], 170                     ; 1513 _ 81. 7D, 08, 000000AA
        jnz     ?_066                                   ; 151A _ 75, 0D
        mov     eax, dword [key_shift]                  ; 151C _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 1521 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1524 _ A3, 00000000(d)
?_066:  cmp     dword [ebp+8H], 182                     ; 1529 _ 81. 7D, 08, 000000B6
        jnz     ?_067                                   ; 1530 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1532 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 1537 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 153A _ A3, 00000000(d)
?_067:  cmp     dword [ebp+8H], 58                      ; 153F _ 83. 7D, 08, 3A
        jnz     ?_069                                   ; 1543 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 1545 _ A1, 00000000(d)
        test    eax, eax                                ; 154A _ 85. C0
        jnz     ?_068                                   ; 154C _ 75, 0C
        mov     dword [caps_lock], 1                    ; 154E _ C7. 05, 00000000(d), 00000001
        jmp     ?_069                                   ; 1558 _ EB, 0A

?_068:  mov     dword [caps_lock], 0                    ; 155A _ C7. 05, 00000000(d), 00000000
?_069:  cmp     dword [ebp+8H], 42                      ; 1564 _ 83. 7D, 08, 2A
        jz      ?_070                                   ; 1568 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 156A _ 83. 7D, 08, 36
        jz      ?_070                                   ; 156E _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 1570 _ 81. 7D, 08, 000000AA
        jz      ?_070                                   ; 1577 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 1579 _ 81. 7D, 08, 000000B6
        jz      ?_070                                   ; 1580 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 1582 _ 83. 7D, 08, 53
        jg      ?_070                                   ; 1586 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 1588 _ 83. 7D, 08, 3A
        jnz     ?_071                                   ; 158C _ 75, 0A
?_070:  mov     eax, 0                                  ; 158E _ B8, 00000000
        jmp     ?_076                                   ; 1593 _ E9, 0000008A

?_071:  mov     byte [ebp-1H], 0                        ; 1598 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 159C _ A1, 00000000(d)
        test    eax, eax                                ; 15A1 _ 85. C0
        jnz     ?_072                                   ; 15A3 _ 75, 44
        cmp     dword [ebp+8H], 83                      ; 15A5 _ 83. 7D, 08, 53
        jg      ?_072                                   ; 15A9 _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 15AB _ 8B. 45, 08
        add     eax, keytable                           ; 15AE _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 15B3 _ 0F B6. 00
        test    al, al                                  ; 15B6 _ 84. C0
        jz      ?_072                                   ; 15B8 _ 74, 2F
        mov     eax, dword [ebp+8H]                     ; 15BA _ 8B. 45, 08
        add     eax, keytable                           ; 15BD _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 15C2 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 15C5 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 15C8 _ 80. 7D, FF, 40
        jle     ?_074                                   ; 15CC _ 7E, 4F
        cmp     byte [ebp-1H], 90                       ; 15CE _ 80. 7D, FF, 5A
        jg      ?_074                                   ; 15D2 _ 7F, 49
        mov     eax, dword [caps_lock]                  ; 15D4 _ A1, 00000000(d)
        test    eax, eax                                ; 15D9 _ 85. C0
        jnz     ?_074                                   ; 15DB _ 75, 40
        movzx   eax, byte [ebp-1H]                      ; 15DD _ 0F B6. 45, FF
        add     eax, 32                                 ; 15E1 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 15E4 _ 88. 45, FF
        jmp     ?_074                                   ; 15E7 _ EB, 34

?_072:  mov     eax, dword [key_shift]                  ; 15E9 _ A1, 00000000(d)
        test    eax, eax                                ; 15EE _ 85. C0
        jz      ?_073                                   ; 15F0 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 15F2 _ 83. 7D, 08, 7F
        jg      ?_073                                   ; 15F6 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 15F8 _ 8B. 45, 08
        add     eax, keytable1                          ; 15FB _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 1600 _ 0F B6. 00
        test    al, al                                  ; 1603 _ 84. C0
        jz      ?_073                                   ; 1605 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 1607 _ 8B. 45, 08
        add     eax, keytable1                          ; 160A _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 160F _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1612 _ 88. 45, FF
        jmp     ?_075                                   ; 1615 _ EB, 07

?_073:  mov     byte [ebp-1H], 0                        ; 1617 _ C6. 45, FF, 00
        jmp     ?_075                                   ; 161B _ EB, 01

?_074:  nop                                             ; 161D _ 90
?_075:  movzx   eax, byte [ebp-1H]                      ; 161E _ 0F B6. 45, FF
?_076:  leave                                           ; 1622 _ C9
        ret                                             ; 1623 _ C3
; transferScanCode End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1624 _ 55
        mov     ebp, esp                                ; 1625 _ 89. E5
        sub     esp, 8                                  ; 1627 _ 83. EC, 08
        jmp     ?_078                                   ; 162A _ EB, 1B

?_077:  mov     eax, dword [ebp+8H]                     ; 162C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 162F _ 0F B6. 00
        movsx   eax, al                                 ; 1632 _ 0F BE. C0
        sub     esp, 8                                  ; 1635 _ 83. EC, 08
        push    1                                       ; 1638 _ 6A, 01
        push    eax                                     ; 163A _ 50
        call    cons_putchar                            ; 163B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1640 _ 83. C4, 10
        add     dword [ebp+8H], 1                       ; 1643 _ 83. 45, 08, 01
?_078:  mov     eax, dword [ebp+8H]                     ; 1647 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 164A _ 0F B6. 00
        test    al, al                                  ; 164D _ 84. C0
        jnz     ?_077                                   ; 164F _ 75, DB
        nop                                             ; 1651 _ 90
        leave                                           ; 1652 _ C9
        ret                                             ; 1653 _ C3
; cons_putstr End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1654 _ 55
        mov     ebp, esp                                ; 1655 _ 89. E5
        push    ebx                                     ; 1657 _ 53
        sub     esp, 20                                 ; 1658 _ 83. EC, 14
        mov     edx, dword [ebp+8H]                     ; 165B _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 165E _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1661 _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1664 _ 88. 45, F0
        mov     ebx, dword [?_369]                      ; 1667 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_368]                      ; 166D _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1673 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1679 _ A1, 00000264(d)
        sub     esp, 12                                 ; 167E _ 83. EC, 0C
        push    0                                       ; 1681 _ 6A, 00
        push    ebx                                     ; 1683 _ 53
        push    ecx                                     ; 1684 _ 51
        push    edx                                     ; 1685 _ 52
        push    eax                                     ; 1686 _ 50
        call    set_cursor                              ; 1687 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 168C _ 83. C4, 20
        movzx   eax, byte [ebp-0CH]                     ; 168F _ 0F B6. 45, F4
        mov     byte [?_371], al                        ; 1693 _ A2, 00000018(d)
        mov     byte [?_372], 0                         ; 1698 _ C6. 05, 00000019(d), 00
        mov     ebx, dword [?_369]                      ; 169F _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_368]                      ; 16A5 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 16AB _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 16B1 _ A1, 00000264(d)
        sub     esp, 8                                  ; 16B6 _ 83. EC, 08
        push    ?_371                                   ; 16B9 _ 68, 00000018(d)
        push    7                                       ; 16BE _ 6A, 07
        push    ebx                                     ; 16C0 _ 53
        push    ecx                                     ; 16C1 _ 51
        push    edx                                     ; 16C2 _ 52
        push    eax                                     ; 16C3 _ 50
        call    showString                              ; 16C4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16C9 _ 83. C4, 20
        mov     eax, dword [?_368]                      ; 16CC _ A1, 0000000C(d)
        add     eax, 8                                  ; 16D1 _ 83. C0, 08
        mov     dword [?_368], eax                      ; 16D4 _ A3, 0000000C(d)
        nop                                             ; 16D9 _ 90
        mov     ebx, dword [ebp-4H]                     ; 16DA _ 8B. 5D, FC
        leave                                           ; 16DD _ C9
        ret                                             ; 16DE _ C3
; cons_putchar End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 16DF _ 55
        mov     ebp, esp                                ; 16E0 _ 89. E5
        sub     esp, 24                                 ; 16E2 _ 83. EC, 18
        mov     eax, dword [?_373]                      ; 16E5 _ A1, 0000001C(d)
        mov     dword [ebp-0CH], eax                    ; 16EA _ 89. 45, F4
?_079:  mov     eax, dword [ebp+8H]                     ; 16ED _ 8B. 45, 08
        add     eax, 16                                 ; 16F0 _ 83. C0, 10
        sub     esp, 12                                 ; 16F3 _ 83. EC, 0C
        push    eax                                     ; 16F6 _ 50
        call    fifo8_status                            ; 16F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16FC _ 83. C4, 10
        test    eax, eax                                ; 16FF _ 85. C0
        jnz     ?_080                                   ; 1701 _ 75, 22
        cmp     dword [ebp+0CH], 0                      ; 1703 _ 83. 7D, 0C, 00
        jne     ?_083                                   ; 1707 _ 0F 85, 00000083
        call    io_sti                                  ; 170D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1712 _ 8B. 45, 10
        add     eax, 28                                 ; 1715 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1718 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 171E _ B8, 00000000
        jmp     ?_084                                   ; 1723 _ EB, 71

?_080:  mov     eax, dword [ebp+8H]                     ; 1725 _ 8B. 45, 08
        add     eax, 16                                 ; 1728 _ 83. C0, 10
        sub     esp, 12                                 ; 172B _ 83. EC, 0C
        push    eax                                     ; 172E _ 50
        call    fifo8_get                               ; 172F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1734 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1737 _ 89. 45, F0
        cmp     dword [ebp-10H], 1                      ; 173A _ 83. 7D, F0, 01
        jg      ?_081                                   ; 173E _ 7F, 29
        mov     eax, dword [ebp+8H]                     ; 1740 _ 8B. 45, 08
        add     eax, 16                                 ; 1743 _ 83. C0, 10
        sub     esp, 4                                  ; 1746 _ 83. EC, 04
        push    1                                       ; 1749 _ 6A, 01
        push    eax                                     ; 174B _ 50
        push    dword [ebp-0CH]                         ; 174C _ FF. 75, F4
        call    timer_init                              ; 174F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1754 _ 83. C4, 10
        sub     esp, 8                                  ; 1757 _ 83. EC, 08
        push    50                                      ; 175A _ 6A, 32
        push    dword [ebp-0CH]                         ; 175C _ FF. 75, F4
        call    timer_settime                           ; 175F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1764 _ 83. C4, 10
        jmp     ?_079                                   ; 1767 _ EB, 84

?_081:  cmp     dword [ebp-10H], 2                      ; 1769 _ 83. 7D, F0, 02
        jnz     ?_082                                   ; 176D _ 75, 0F
        mov     dword [?_370], 7                        ; 176F _ C7. 05, 00000014(d), 00000007
        jmp     ?_079                                   ; 1779 _ E9, FFFFFF6F

?_082:  mov     eax, dword [ebp+10H]                    ; 177E _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 1781 _ 8D. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 1784 _ 8B. 45, F0
        mov     dword [edx], eax                        ; 1787 _ 89. 02
        mov     eax, 0                                  ; 1789 _ B8, 00000000
        jmp     ?_084                                   ; 178E _ EB, 06

?_083:  nop                                             ; 1790 _ 90
        jmp     ?_079                                   ; 1791 _ E9, FFFFFF57

?_084:  leave                                           ; 1796 _ C9
        ret                                             ; 1797 _ C3
; handle_keyboard End of function

kernel_api:; Function begin
        push    ebp                                     ; 1798 _ 55
        mov     ebp, esp                                ; 1799 _ 89. E5
        push    ebx                                     ; 179B _ 53
        sub     esp, 20                                 ; 179C _ 83. EC, 14
        call    task_now                                ; 179F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 17A4 _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 17A7 _ 8D. 45, 24
        add     eax, 4                                  ; 17AA _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 17AD _ 89. 45, F0
        cmp     dword [ebp+1CH], 1                      ; 17B0 _ 83. 7D, 1C, 01
        jnz     ?_085                                   ; 17B4 _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 17B6 _ 8B. 45, 24
        movsx   eax, al                                 ; 17B9 _ 0F BE. C0
        sub     esp, 8                                  ; 17BC _ 83. EC, 08
        push    1                                       ; 17BF _ 6A, 01
        push    eax                                     ; 17C1 _ 50
        call    cons_putchar                            ; 17C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17C7 _ 83. C4, 10
        jmp     ?_099                                   ; 17CA _ E9, 000002E9

?_085:  cmp     dword [ebp+1CH], 2                      ; 17CF _ 83. 7D, 1C, 02
        jnz     ?_086                                   ; 17D3 _ 75, 1C
        mov     edx, dword [buffer]                     ; 17D5 _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+18H]                    ; 17DB _ 8B. 45, 18
        add     eax, edx                                ; 17DE _ 01. D0
        sub     esp, 12                                 ; 17E0 _ 83. EC, 0C
        push    eax                                     ; 17E3 _ 50
        call    cons_putstr                             ; 17E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17E9 _ 83. C4, 10
        jmp     ?_099                                   ; 17EC _ E9, 000002C7

?_086:  cmp     dword [ebp+1CH], 4                      ; 17F1 _ 83. 7D, 1C, 04
        jnz     ?_087                                   ; 17F5 _ 75, 17
        mov     eax, dword [ebp-0CH]                    ; 17F7 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 17FA _ C7. 40, 34, 00000000
        mov     eax, dword [task_cons]                  ; 1801 _ A1, 00000270(d)
        add     eax, 48                                 ; 1806 _ 83. C0, 30
        jmp     ?_100                                   ; 1809 _ E9, 000002AF

?_087:  cmp     dword [ebp+1CH], 5                      ; 180E _ 83. 7D, 1C, 05
        jne     ?_088                                   ; 1812 _ 0F 85, 00000092
        mov     eax, dword [shtctl]                     ; 1818 _ A1, 00000264(d)
        sub     esp, 12                                 ; 181D _ 83. EC, 0C
        push    eax                                     ; 1820 _ 50
        call    sheet_alloc                             ; 1821 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1826 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 1829 _ 89. 45, EC
        mov     eax, dword [ebp+24H]                    ; 182C _ 8B. 45, 24
        mov     ecx, dword [?_378]                      ; 182F _ 8B. 0D, 0000027C(d)
        mov     edx, dword [ebp+18H]                    ; 1835 _ 8B. 55, 18
        add     edx, ecx                                ; 1838 _ 01. CA
        sub     esp, 12                                 ; 183A _ 83. EC, 0C
        push    eax                                     ; 183D _ 50
        push    dword [ebp+8H]                          ; 183E _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 1841 _ FF. 75, 0C
        push    edx                                     ; 1844 _ 52
        push    dword [ebp-14H]                         ; 1845 _ FF. 75, EC
        call    sheet_setbuf                            ; 1848 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 184D _ 83. C4, 20
        mov     edx, dword [buffer]                     ; 1850 _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+20H]                    ; 1856 _ 8B. 45, 20
        add     edx, eax                                ; 1859 _ 01. C2
        mov     eax, dword [shtctl]                     ; 185B _ A1, 00000264(d)
        push    0                                       ; 1860 _ 6A, 00
        push    edx                                     ; 1862 _ 52
        push    dword [ebp-14H]                         ; 1863 _ FF. 75, EC
        push    eax                                     ; 1866 _ 50
        call    make_window8                            ; 1867 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 186C _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 186F _ A1, 00000264(d)
        push    50                                      ; 1874 _ 6A, 32
        push    100                                     ; 1876 _ 6A, 64
        push    dword [ebp-14H]                         ; 1878 _ FF. 75, EC
        push    eax                                     ; 187B _ 50
        call    sheet_slide                             ; 187C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1881 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 1884 _ A1, 00000264(d)
        sub     esp, 4                                  ; 1889 _ 83. EC, 04
        push    3                                       ; 188C _ 6A, 03
        push    dword [ebp-14H]                         ; 188E _ FF. 75, EC
        push    eax                                     ; 1891 _ 50
        call    sheet_updown                            ; 1892 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1897 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 189A _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 189D _ 8D. 50, 1C
        mov     eax, dword [ebp-14H]                    ; 18A0 _ 8B. 45, EC
        mov     dword [edx], eax                        ; 18A3 _ 89. 02
        jmp     ?_099                                   ; 18A5 _ E9, 0000020E

?_088:  cmp     dword [ebp+1CH], 6                      ; 18AA _ 83. 7D, 1C, 06
        jnz     ?_089                                   ; 18AE _ 75, 6A
        mov     eax, dword [ebp+18H]                    ; 18B0 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 18B3 _ 89. 45, EC
        mov     edx, dword [?_378]                      ; 18B6 _ 8B. 15, 0000027C(d)
        mov     eax, dword [ebp+10H]                    ; 18BC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 18BF _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 18C2 _ 8B. 45, 24
        movsx   edx, al                                 ; 18C5 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 18C8 _ A1, 00000264(d)
        sub     esp, 8                                  ; 18CD _ 83. EC, 08
        push    ecx                                     ; 18D0 _ 51
        push    edx                                     ; 18D1 _ 52
        push    dword [ebp+8H]                          ; 18D2 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 18D5 _ FF. 75, 0C
        push    dword [ebp-14H]                         ; 18D8 _ FF. 75, EC
        push    eax                                     ; 18DB _ 50
        call    showString                              ; 18DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18E1 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 18E4 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 18E7 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 18EA _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 18ED _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 18F4 _ 8B. 45, 0C
        add     edx, eax                                ; 18F7 _ 01. C2
        mov     eax, dword [shtctl]                     ; 18F9 _ A1, 00000264(d)
        sub     esp, 8                                  ; 18FE _ 83. EC, 08
        push    ecx                                     ; 1901 _ 51
        push    edx                                     ; 1902 _ 52
        push    dword [ebp+8H]                          ; 1903 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 1906 _ FF. 75, 0C
        push    dword [ebp-14H]                         ; 1909 _ FF. 75, EC
        push    eax                                     ; 190C _ 50
        call    sheet_refresh                           ; 190D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1912 _ 83. C4, 20
        jmp     ?_099                                   ; 1915 _ E9, 0000019E

?_089:  cmp     dword [ebp+1CH], 7                      ; 191A _ 83. 7D, 1C, 07
        jnz     ?_090                                   ; 191E _ 75, 60
        mov     eax, dword [ebp+18H]                    ; 1920 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 1923 _ 89. 45, EC
        mov     ebx, dword [ebp+24H]                    ; 1926 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 1929 _ 8B. 45, 10
        movzx   ecx, al                                 ; 192C _ 0F B6. C8
        mov     eax, dword [ebp-14H]                    ; 192F _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 1932 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 1935 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 1938 _ 8B. 00
        sub     esp, 4                                  ; 193A _ 83. EC, 04
        push    dword [ebp+8H]                          ; 193D _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 1940 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 1943 _ FF. 75, 20
        push    ebx                                     ; 1946 _ 53
        push    ecx                                     ; 1947 _ 51
        push    edx                                     ; 1948 _ 52
        push    eax                                     ; 1949 _ 50
        call    boxfill8                                ; 194A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 194F _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1952 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 1955 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1958 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 195B _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 195E _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1961 _ A1, 00000264(d)
        sub     esp, 8                                  ; 1966 _ 83. EC, 08
        push    ebx                                     ; 1969 _ 53
        push    ecx                                     ; 196A _ 51
        push    dword [ebp+20H]                         ; 196B _ FF. 75, 20
        push    edx                                     ; 196E _ 52
        push    dword [ebp-14H]                         ; 196F _ FF. 75, EC
        push    eax                                     ; 1972 _ 50
        call    sheet_refresh                           ; 1973 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1978 _ 83. C4, 20
        jmp     ?_099                                   ; 197B _ E9, 00000138

?_090:  cmp     dword [ebp+1CH], 11                     ; 1980 _ 83. 7D, 1C, 0B
        jnz     ?_091                                   ; 1984 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 1986 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 1989 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 198C _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 198F _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1991 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1994 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 1997 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 199B _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 199D _ 8B. 45, 0C
        add     eax, ecx                                ; 19A0 _ 01. C8
        add     eax, edx                                ; 19A2 _ 01. D0
        mov     edx, dword [ebp+24H]                    ; 19A4 _ 8B. 55, 24
        mov     byte [eax], dl                          ; 19A7 _ 88. 10
        jmp     ?_099                                   ; 19A9 _ E9, 0000010A

?_091:  cmp     dword [ebp+1CH], 12                     ; 19AE _ 83. 7D, 1C, 0C
        jnz     ?_092                                   ; 19B2 _ 75, 2C
        mov     eax, dword [ebp+18H]                    ; 19B4 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 19B7 _ 89. 45, EC
        mov     edx, dword [ebp+24H]                    ; 19BA _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 19BD _ A1, 00000264(d)
        sub     esp, 8                                  ; 19C2 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 19C5 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 19C8 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 19CB _ FF. 75, 20
        push    edx                                     ; 19CE _ 52
        push    dword [ebp-14H]                         ; 19CF _ FF. 75, EC
        push    eax                                     ; 19D2 _ 50
        call    sheet_refresh                           ; 19D3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19D8 _ 83. C4, 20
        jmp     ?_099                                   ; 19DB _ E9, 000000D8

?_092:  cmp     dword [ebp+1CH], 13                     ; 19E0 _ 83. 7D, 1C, 0D
        jnz     ?_093                                   ; 19E4 _ 75, 29
        mov     eax, dword [ebp+18H]                    ; 19E6 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 19E9 _ 89. 45, EC
        mov     eax, dword [ebp+24H]                    ; 19EC _ 8B. 45, 24
        sub     esp, 8                                  ; 19EF _ 83. EC, 08
        push    dword [ebp+10H]                         ; 19F2 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 19F5 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 19F8 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 19FB _ FF. 75, 20
        push    eax                                     ; 19FE _ 50
        push    dword [ebp-14H]                         ; 19FF _ FF. 75, EC
        call    api_linewin                             ; 1A02 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A07 _ 83. C4, 20
        jmp     ?_099                                   ; 1A0A _ E9, 000000A9

?_093:  cmp     dword [ebp+1CH], 14                     ; 1A0F _ 83. 7D, 1C, 0E
        jnz     ?_094                                   ; 1A13 _ 75, 1A
        mov     edx, dword [ebp+18H]                    ; 1A15 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 1A18 _ A1, 00000264(d)
        sub     esp, 8                                  ; 1A1D _ 83. EC, 08
        push    edx                                     ; 1A20 _ 52
        push    eax                                     ; 1A21 _ 50
        call    sheet_free                              ; 1A22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A27 _ 83. C4, 10
        jmp     ?_099                                   ; 1A2A _ E9, 00000089

?_094:  cmp     dword [ebp+1CH], 15                     ; 1A2F _ 83. 7D, 1C, 0F
        jnz     ?_095                                   ; 1A33 _ 75, 17
        mov     eax, dword [ebp+24H]                    ; 1A35 _ 8B. 45, 24
        sub     esp, 4                                  ; 1A38 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 1A3B _ FF. 75, F0
        push    eax                                     ; 1A3E _ 50
        push    dword [ebp-0CH]                         ; 1A3F _ FF. 75, F4
        call    handle_keyboard                         ; 1A42 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A47 _ 83. C4, 10
        jmp     ?_099                                   ; 1A4A _ EB, 6C

?_095:  cmp     dword [ebp+1CH], 16                     ; 1A4C _ 83. 7D, 1C, 10
        jnz     ?_096                                   ; 1A50 _ 75, 0F
        mov     eax, dword [ebp-10H]                    ; 1A52 _ 8B. 45, F0
        lea     ebx, [eax+1CH]                          ; 1A55 _ 8D. 58, 1C
        call    timer_alloc                             ; 1A58 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 1A5D _ 89. 03
        jmp     ?_099                                   ; 1A5F _ EB, 57

?_096:  cmp     dword [ebp+1CH], 17                     ; 1A61 _ 83. 7D, 1C, 11
        jnz     ?_097                                   ; 1A65 _ 75, 1F
        mov     eax, dword [ebp+24H]                    ; 1A67 _ 8B. 45, 24
        movzx   edx, al                                 ; 1A6A _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 1A6D _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 1A70 _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 1A73 _ 8B. 45, 18
        sub     esp, 4                                  ; 1A76 _ 83. EC, 04
        push    edx                                     ; 1A79 _ 52
        push    ecx                                     ; 1A7A _ 51
        push    eax                                     ; 1A7B _ 50
        call    timer_init                              ; 1A7C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A81 _ 83. C4, 10
        jmp     ?_099                                   ; 1A84 _ EB, 32

?_097:  cmp     dword [ebp+1CH], 18                     ; 1A86 _ 83. 7D, 1C, 12
        jnz     ?_098                                   ; 1A8A _ 75, 17
        mov     eax, dword [ebp+24H]                    ; 1A8C _ 8B. 45, 24
        mov     edx, eax                                ; 1A8F _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 1A91 _ 8B. 45, 18
        sub     esp, 8                                  ; 1A94 _ 83. EC, 08
        push    edx                                     ; 1A97 _ 52
        push    eax                                     ; 1A98 _ 50
        call    timer_settime                           ; 1A99 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A9E _ 83. C4, 10
        jmp     ?_099                                   ; 1AA1 _ EB, 15

?_098:  cmp     dword [ebp+1CH], 19                     ; 1AA3 _ 83. 7D, 1C, 13
        jnz     ?_099                                   ; 1AA7 _ 75, 0F
        mov     eax, dword [ebp+18H]                    ; 1AA9 _ 8B. 45, 18
        sub     esp, 12                                 ; 1AAC _ 83. EC, 0C
        push    eax                                     ; 1AAF _ 50
        call    timer_free                              ; 1AB0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AB5 _ 83. C4, 10
?_099:  mov     eax, 0                                  ; 1AB8 _ B8, 00000000
?_100:  mov     ebx, dword [ebp-4H]                     ; 1ABD _ 8B. 5D, FC
        leave                                           ; 1AC0 _ C9
        ret                                             ; 1AC1 _ C3
; kernel_api End of function

api_linewin:; Function begin
        push    ebp                                     ; 1AC2 _ 55
        mov     ebp, esp                                ; 1AC3 _ 89. E5
        sub     esp, 32                                 ; 1AC5 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 1AC8 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1ACB _ 2B. 45, 0C
        mov     dword [ebp-14H], eax                    ; 1ACE _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1AD1 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1AD4 _ 2B. 45, 10
        mov     dword [ebp-18H], eax                    ; 1AD7 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1ADA _ 8B. 45, 0C
        shl     eax, 10                                 ; 1ADD _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1AE0 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1AE3 _ 8B. 45, 10
        shl     eax, 10                                 ; 1AE6 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1AE9 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1AEC _ 83. 7D, EC, 00
        jns     ?_101                                   ; 1AF0 _ 79, 03
        neg     dword [ebp-14H]                         ; 1AF2 _ F7. 5D, EC
?_101:  cmp     dword [ebp-18H], 0                      ; 1AF5 _ 83. 7D, E8, 00
        jns     ?_102                                   ; 1AF9 _ 79, 03
        neg     dword [ebp-18H]                         ; 1AFB _ F7. 5D, E8
?_102:  mov     eax, dword [ebp-14H]                    ; 1AFE _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1B01 _ 3B. 45, E8
        jl      ?_106                                   ; 1B04 _ 7C, 53
        mov     eax, dword [ebp-14H]                    ; 1B06 _ 8B. 45, EC
        add     eax, 1                                  ; 1B09 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1B0C _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1B0F _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1B12 _ 3B. 45, 14
        jle     ?_103                                   ; 1B15 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1B17 _ C7. 45, EC, FFFFFC00
        jmp     ?_104                                   ; 1B1E _ EB, 07

?_103:  mov     dword [ebp-14H], 1024                   ; 1B20 _ C7. 45, EC, 00000400
?_104:  mov     eax, dword [ebp+10H]                    ; 1B27 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1B2A _ 3B. 45, 18
        jg      ?_105                                   ; 1B2D _ 7F, 15
        mov     eax, dword [ebp+18H]                    ; 1B2F _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1B32 _ 2B. 45, 10
        add     eax, 1                                  ; 1B35 _ 83. C0, 01
        shl     eax, 10                                 ; 1B38 _ C1. E0, 0A
        cdq                                             ; 1B3B _ 99
        idiv    dword [ebp-10H]                         ; 1B3C _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1B3F _ 89. 45, E8
        jmp     ?_110                                   ; 1B42 _ EB, 66

?_105:  mov     eax, dword [ebp+18H]                    ; 1B44 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1B47 _ 2B. 45, 10
        sub     eax, 1                                  ; 1B4A _ 83. E8, 01
        shl     eax, 10                                 ; 1B4D _ C1. E0, 0A
        cdq                                             ; 1B50 _ 99
        idiv    dword [ebp-10H]                         ; 1B51 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1B54 _ 89. 45, E8
        jmp     ?_110                                   ; 1B57 _ EB, 51

?_106:  mov     eax, dword [ebp-18H]                    ; 1B59 _ 8B. 45, E8
        add     eax, 1                                  ; 1B5C _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1B5F _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1B62 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1B65 _ 3B. 45, 18
        jle     ?_107                                   ; 1B68 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1B6A _ C7. 45, E8, FFFFFC00
        jmp     ?_108                                   ; 1B71 _ EB, 07

?_107:  mov     dword [ebp-18H], 1024                   ; 1B73 _ C7. 45, E8, 00000400
?_108:  mov     eax, dword [ebp+0CH]                    ; 1B7A _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1B7D _ 3B. 45, 14
        jg      ?_109                                   ; 1B80 _ 7F, 15
        mov     eax, dword [ebp+14H]                    ; 1B82 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1B85 _ 2B. 45, 0C
        add     eax, 1                                  ; 1B88 _ 83. C0, 01
        shl     eax, 10                                 ; 1B8B _ C1. E0, 0A
        cdq                                             ; 1B8E _ 99
        idiv    dword [ebp-10H]                         ; 1B8F _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1B92 _ 89. 45, EC
        jmp     ?_110                                   ; 1B95 _ EB, 13

?_109:  mov     eax, dword [ebp+14H]                    ; 1B97 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1B9A _ 2B. 45, 0C
        sub     eax, 1                                  ; 1B9D _ 83. E8, 01
        shl     eax, 10                                 ; 1BA0 _ C1. E0, 0A
        cdq                                             ; 1BA3 _ 99
        idiv    dword [ebp-10H]                         ; 1BA4 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1BA7 _ 89. 45, EC
?_110:  mov     dword [ebp-4H], 0                       ; 1BAA _ C7. 45, FC, 00000000
        jmp     ?_112                                   ; 1BB1 _ EB, 35

?_111:  mov     eax, dword [ebp+8H]                     ; 1BB3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1BB6 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1BB8 _ 8B. 45, F4
        sar     eax, 10                                 ; 1BBB _ C1. F8, 0A
        mov     ecx, eax                                ; 1BBE _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1BC0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1BC3 _ 8B. 40, 04
        imul    eax, ecx                                ; 1BC6 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1BC9 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1BCC _ C1. F9, 0A
        add     eax, ecx                                ; 1BCF _ 01. C8
        add     eax, edx                                ; 1BD1 _ 01. D0
        mov     edx, dword [ebp+1CH]                    ; 1BD3 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 1BD6 _ 88. 10
        mov     eax, dword [ebp-14H]                    ; 1BD8 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1BDB _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1BDE _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1BE1 _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1BE4 _ 83. 45, FC, 01
?_112:  mov     eax, dword [ebp-4H]                     ; 1BE8 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1BEB _ 3B. 45, F0
        jl      ?_111                                   ; 1BEE _ 7C, C3
        nop                                             ; 1BF0 _ 90
        leave                                           ; 1BF1 _ C9
        ret                                             ; 1BF2 _ C3
; api_linewin End of function

set_cursor:; Function begin
        push    ebp                                     ; 1BF3 _ 55
        mov     ebp, esp                                ; 1BF4 _ 89. E5
        push    esi                                     ; 1BF6 _ 56
        push    ebx                                     ; 1BF7 _ 53
        mov     eax, dword [ebp+14H]                    ; 1BF8 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 1BFB _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 1BFE _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 1C01 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 1C04 _ 8B. 45, 18
        movzx   ecx, al                                 ; 1C07 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1C0A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1C0D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1C10 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C13 _ 8B. 00
        sub     esp, 4                                  ; 1C15 _ 83. EC, 04
        push    esi                                     ; 1C18 _ 56
        push    ebx                                     ; 1C19 _ 53
        push    dword [ebp+14H]                         ; 1C1A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1C1D _ FF. 75, 10
        push    ecx                                     ; 1C20 _ 51
        push    edx                                     ; 1C21 _ 52
        push    eax                                     ; 1C22 _ 50
        call    boxfill8                                ; 1C23 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C28 _ 83. C4, 20
        mov     eax, dword [ebp+14H]                    ; 1C2B _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 1C2E _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 1C31 _ 8B. 45, 10
        add     eax, 8                                  ; 1C34 _ 83. C0, 08
        sub     esp, 8                                  ; 1C37 _ 83. EC, 08
        push    edx                                     ; 1C3A _ 52
        push    eax                                     ; 1C3B _ 50
        push    dword [ebp+14H]                         ; 1C3C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1C3F _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1C42 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1C45 _ FF. 75, 08
        call    sheet_refresh                           ; 1C48 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C4D _ 83. C4, 20
        nop                                             ; 1C50 _ 90
        lea     esp, [ebp-8H]                           ; 1C51 _ 8D. 65, F8
        pop     ebx                                     ; 1C54 _ 5B
        pop     esi                                     ; 1C55 _ 5E
        pop     ebp                                     ; 1C56 _ 5D
        ret                                             ; 1C57 _ C3
; set_cursor End of function

cons_newline:; Function begin
        push    ebp                                     ; 1C58 _ 55
        mov     ebp, esp                                ; 1C59 _ 89. E5
        push    ebx                                     ; 1C5B _ 53
        sub     esp, 20                                 ; 1C5C _ 83. EC, 14
        cmp     dword [ebp+8H], 139                     ; 1C5F _ 81. 7D, 08, 0000008B
        jg      ?_113                                   ; 1C66 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 1C68 _ 83. 45, 08, 10
        jmp     ?_122                                   ; 1C6C _ E9, 000000CD

?_113:  mov     dword [ebp-10H], 28                     ; 1C71 _ C7. 45, F0, 0000001C
        jmp     ?_117                                   ; 1C78 _ EB, 52

?_114:  mov     dword [ebp-0CH], 8                      ; 1C7A _ C7. 45, F4, 00000008
        jmp     ?_116                                   ; 1C81 _ EB, 3C

?_115:  mov     eax, dword [ebp+0CH]                    ; 1C83 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1C86 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1C88 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C8B _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1C8E _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1C92 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1C94 _ 8B. 45, F4
        add     eax, ecx                                ; 1C97 _ 01. C8
        add     edx, eax                                ; 1C99 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1C9B _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 1C9E _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 1CA0 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 1CA3 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 1CA6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CA9 _ 8B. 40, 04
        imul    ebx, eax                                ; 1CAC _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 1CAF _ 8B. 45, F4
        add     eax, ebx                                ; 1CB2 _ 01. D8
        add     eax, ecx                                ; 1CB4 _ 01. C8
        movzx   eax, byte [eax]                         ; 1CB6 _ 0F B6. 00
        mov     byte [edx], al                          ; 1CB9 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1CBB _ 83. 45, F4, 01
?_116:  cmp     dword [ebp-0CH], 247                    ; 1CBF _ 81. 7D, F4, 000000F7
        jle     ?_115                                   ; 1CC6 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 1CC8 _ 83. 45, F0, 01
?_117:  cmp     dword [ebp-10H], 139                    ; 1CCC _ 81. 7D, F0, 0000008B
        jle     ?_114                                   ; 1CD3 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 1CD5 _ C7. 45, F0, 0000008C
        jmp     ?_121                                   ; 1CDC _ EB, 35

?_118:  mov     dword [ebp-0CH], 8                      ; 1CDE _ C7. 45, F4, 00000008
        jmp     ?_120                                   ; 1CE5 _ EB, 1F

?_119:  mov     eax, dword [ebp+0CH]                    ; 1CE7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1CEA _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1CEC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CEF _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1CF2 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1CF6 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1CF8 _ 8B. 45, F4
        add     eax, ecx                                ; 1CFB _ 01. C8
        add     eax, edx                                ; 1CFD _ 01. D0
        mov     byte [eax], 0                           ; 1CFF _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1D02 _ 83. 45, F4, 01
?_120:  cmp     dword [ebp-0CH], 247                    ; 1D06 _ 81. 7D, F4, 000000F7
        jle     ?_119                                   ; 1D0D _ 7E, D8
        add     dword [ebp-10H], 1                      ; 1D0F _ 83. 45, F0, 01
?_121:  cmp     dword [ebp-10H], 155                    ; 1D13 _ 81. 7D, F0, 0000009B
        jle     ?_118                                   ; 1D1A _ 7E, C2
        mov     eax, dword [shtctl]                     ; 1D1C _ A1, 00000264(d)
        sub     esp, 8                                  ; 1D21 _ 83. EC, 08
        push    156                                     ; 1D24 _ 68, 0000009C
        push    248                                     ; 1D29 _ 68, 000000F8
        push    28                                      ; 1D2E _ 6A, 1C
        push    8                                       ; 1D30 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1D32 _ FF. 75, 0C
        push    eax                                     ; 1D35 _ 50
        call    sheet_refresh                           ; 1D36 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D3B _ 83. C4, 20
?_122:  mov     eax, dword [shtctl]                     ; 1D3E _ A1, 00000264(d)
        sub     esp, 8                                  ; 1D43 _ 83. EC, 08
        push    ?_351                                   ; 1D46 _ 68, 0000002F(d)
        push    7                                       ; 1D4B _ 6A, 07
        push    dword [ebp+8H]                          ; 1D4D _ FF. 75, 08
        push    8                                       ; 1D50 _ 6A, 08
        push    dword [ebp+0CH]                         ; 1D52 _ FF. 75, 0C
        push    eax                                     ; 1D55 _ 50
        call    showString                              ; 1D56 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D5B _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1D5E _ 8B. 45, 08
        mov     ebx, dword [ebp-4H]                     ; 1D61 _ 8B. 5D, FC
        leave                                           ; 1D64 _ C9
        ret                                             ; 1D65 _ C3
; cons_newline End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 1D66 _ 55
        mov     ebp, esp                                ; 1D67 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1D69 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1D6C _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 1D6F _ A1, 00000134(d)
        add     eax, edx                                ; 1D74 _ 01. D0
        mov     dword [mx], eax                         ; 1D76 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 1D7B _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1D7E _ 8B. 50, 08
        mov     eax, dword [my]                         ; 1D81 _ A1, 00000138(d)
        add     eax, edx                                ; 1D86 _ 01. D0
        mov     dword [my], eax                         ; 1D88 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 1D8D _ A1, 00000134(d)
        test    eax, eax                                ; 1D92 _ 85. C0
        jns     ?_123                                   ; 1D94 _ 79, 0A
        mov     dword [mx], 0                           ; 1D96 _ C7. 05, 00000134(d), 00000000
?_123:  mov     eax, dword [my]                         ; 1DA0 _ A1, 00000138(d)
        test    eax, eax                                ; 1DA5 _ 85. C0
        jns     ?_124                                   ; 1DA7 _ 79, 0A
        mov     dword [my], 0                           ; 1DA9 _ C7. 05, 00000138(d), 00000000
?_124:  mov     eax, dword [xsize]                      ; 1DB3 _ A1, 00000140(d)
        lea     edx, [eax-10H]                          ; 1DB8 _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 1DBB _ A1, 00000134(d)
        cmp     edx, eax                                ; 1DC0 _ 39. C2
        jge     ?_125                                   ; 1DC2 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 1DC4 _ A1, 00000140(d)
        sub     eax, 16                                 ; 1DC9 _ 83. E8, 10
        mov     dword [mx], eax                         ; 1DCC _ A3, 00000134(d)
?_125:  mov     eax, dword [ysize]                      ; 1DD1 _ A1, 00000144(d)
        lea     edx, [eax-10H]                          ; 1DD6 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 1DD9 _ A1, 00000138(d)
        cmp     edx, eax                                ; 1DDE _ 39. C2
        jge     ?_126                                   ; 1DE0 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 1DE2 _ A1, 00000144(d)
        sub     eax, 16                                 ; 1DE7 _ 83. E8, 10
        mov     dword [my], eax                         ; 1DEA _ A3, 00000138(d)
?_126:  nop                                             ; 1DEF _ 90
        pop     ebp                                     ; 1DF0 _ 5D
        ret                                             ; 1DF1 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1DF2 _ 55
        mov     ebp, esp                                ; 1DF3 _ 89. E5
        sub     esp, 40                                 ; 1DF5 _ 83. EC, 28
        mov     byte [ebp-0DH], 0                       ; 1DF8 _ C6. 45, F3, 00
        mov     dword [ebp-14H], 0                      ; 1DFC _ C7. 45, EC, 00000000
        call    io_sti                                  ; 1E03 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 1E08 _ 83. EC, 0C
        push    mouseinfo                               ; 1E0B _ 68, 000000F4(d)
        call    fifo8_get                               ; 1E10 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E15 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 1E18 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 1E1B _ 0F B6. 45, F3
        sub     esp, 8                                  ; 1E1F _ 83. EC, 08
        push    eax                                     ; 1E22 _ 50
        push    mdec                                    ; 1E23 _ 68, 000000C8(d)
        call    mouse_decode                            ; 1E28 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E2D _ 83. C4, 10
        test    eax, eax                                ; 1E30 _ 85. C0
        je      ?_134                                   ; 1E32 _ 0F 84, 0000024E
        sub     esp, 4                                  ; 1E38 _ 83. EC, 04
        push    mdec                                    ; 1E3B _ 68, 000000C8(d)
        push    dword [ebp+0CH]                         ; 1E40 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1E43 _ FF. 75, 08
        call    computeMousePosition                    ; 1E46 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E4B _ 83. C4, 10
        mov     edx, dword [my]                         ; 1E4E _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 1E54 _ A1, 00000134(d)
        push    edx                                     ; 1E59 _ 52
        push    eax                                     ; 1E5A _ 50
        push    dword [ebp+10H]                         ; 1E5B _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1E5E _ FF. 75, 08
        call    sheet_slide                             ; 1E61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E66 _ 83. C4, 10
        mov     eax, dword [?_374]                      ; 1E69 _ A1, 000000D4(d)
        and     eax, 01H                                ; 1E6E _ 83. E0, 01
        test    eax, eax                                ; 1E71 _ 85. C0
        je      ?_132                                   ; 1E73 _ 0F 84, 00000200
        mov     eax, dword [mmx]                        ; 1E79 _ A1, 0000001C(d)
        test    eax, eax                                ; 1E7E _ 85. C0
        jns     ?_131                                   ; 1E80 _ 0F 89, 0000018B
        mov     eax, dword [ebp+8H]                     ; 1E86 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E89 _ 8B. 40, 10
        sub     eax, 1                                  ; 1E8C _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 1E8F _ 89. 45, F4
        jmp     ?_130                                   ; 1E92 _ E9, 0000016E

?_127:  mov     eax, dword [ebp+8H]                     ; 1E97 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E9A _ 8B. 55, F4
        add     edx, 4                                  ; 1E9D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1EA0 _ 8B. 44 90, 04
        mov     dword [ebp-14H], eax                    ; 1EA4 _ 89. 45, EC
        mov     edx, dword [mx]                         ; 1EA7 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-14H]                    ; 1EAD _ 8B. 45, EC
        mov     eax, dword [eax+0CH]                    ; 1EB0 _ 8B. 40, 0C
        sub     edx, eax                                ; 1EB3 _ 29. C2
        mov     eax, edx                                ; 1EB5 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 1EB7 _ 89. 45, E8
        mov     edx, dword [my]                         ; 1EBA _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-14H]                    ; 1EC0 _ 8B. 45, EC
        mov     eax, dword [eax+10H]                    ; 1EC3 _ 8B. 40, 10
        sub     edx, eax                                ; 1EC6 _ 29. C2
        mov     eax, edx                                ; 1EC8 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 1ECA _ 89. 45, E4
        cmp     dword [ebp-18H], 0                      ; 1ECD _ 83. 7D, E8, 00
        js      ?_129                                   ; 1ED1 _ 0F 88, 0000012A
        mov     eax, dword [ebp-14H]                    ; 1ED7 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1EDA _ 8B. 40, 04
        cmp     eax, dword [ebp-18H]                    ; 1EDD _ 3B. 45, E8
        jle     ?_129                                   ; 1EE0 _ 0F 8E, 0000011B
        cmp     dword [ebp-1CH], 0                      ; 1EE6 _ 83. 7D, E4, 00
        js      ?_129                                   ; 1EEA _ 0F 88, 00000111
        mov     eax, dword [ebp-14H]                    ; 1EF0 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 1EF3 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 1EF6 _ 3B. 45, E4
        jle     ?_129                                   ; 1EF9 _ 0F 8E, 00000102
        mov     eax, dword [ebp-14H]                    ; 1EFF _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 1F02 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1F04 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1F07 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 1F0A _ 0F AF. 45, E4
        mov     ecx, eax                                ; 1F0E _ 89. C1
        mov     eax, dword [ebp-18H]                    ; 1F10 _ 8B. 45, E8
        add     eax, ecx                                ; 1F13 _ 01. C8
        add     eax, edx                                ; 1F15 _ 01. D0
        movzx   eax, byte [eax]                         ; 1F17 _ 0F B6. 00
        movzx   edx, al                                 ; 1F1A _ 0F B6. D0
        mov     eax, dword [ebp-14H]                    ; 1F1D _ 8B. 45, EC
        mov     eax, dword [eax+14H]                    ; 1F20 _ 8B. 40, 14
        cmp     edx, eax                                ; 1F23 _ 39. C2
        je      ?_129                                   ; 1F25 _ 0F 84, 000000D6
        mov     eax, dword [ebp+8H]                     ; 1F2B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F2E _ 8B. 40, 10
        sub     eax, 1                                  ; 1F31 _ 83. E8, 01
        sub     esp, 4                                  ; 1F34 _ 83. EC, 04
        push    eax                                     ; 1F37 _ 50
        push    dword [ebp-14H]                         ; 1F38 _ FF. 75, EC
        push    dword [ebp+8H]                          ; 1F3B _ FF. 75, 08
        call    sheet_updown                            ; 1F3E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F43 _ 83. C4, 10
        cmp     dword [ebp-18H], 2                      ; 1F46 _ 83. 7D, E8, 02
        jle     ?_128                                   ; 1F4A _ 7E, 36
        mov     eax, dword [ebp-14H]                    ; 1F4C _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1F4F _ 8B. 40, 04
        sub     eax, 3                                  ; 1F52 _ 83. E8, 03
        cmp     eax, dword [ebp-18H]                    ; 1F55 _ 3B. 45, E8
        jle     ?_128                                   ; 1F58 _ 7E, 28
        cmp     dword [ebp-1CH], 2                      ; 1F5A _ 83. 7D, E4, 02
        jle     ?_128                                   ; 1F5E _ 7E, 22
        cmp     dword [ebp-1CH], 20                     ; 1F60 _ 83. 7D, E4, 14
        jg      ?_128                                   ; 1F64 _ 7F, 1C
        mov     eax, dword [mx]                         ; 1F66 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 1F6B _ A3, 0000001C(d)
        mov     eax, dword [my]                         ; 1F70 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 1F75 _ A3, 00000020(d)
        mov     eax, dword [ebp-14H]                    ; 1F7A _ 8B. 45, EC
        mov     dword [mouse_clicked_sht], eax          ; 1F7D _ A3, 0000013C(d)
?_128:  mov     eax, dword [ebp-14H]                    ; 1F82 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1F85 _ 8B. 40, 04
        sub     eax, 21                                 ; 1F88 _ 83. E8, 15
        cmp     eax, dword [ebp-18H]                    ; 1F8B _ 3B. 45, E8
        jg      ?_133                                   ; 1F8E _ 0F 8F, 000000F1
        mov     eax, dword [ebp-14H]                    ; 1F94 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1F97 _ 8B. 40, 04
        sub     eax, 5                                  ; 1F9A _ 83. E8, 05
        cmp     eax, dword [ebp-18H]                    ; 1F9D _ 3B. 45, E8
        jle     ?_133                                   ; 1FA0 _ 0F 8E, 000000DF
        cmp     dword [ebp-1CH], 4                      ; 1FA6 _ 83. 7D, E4, 04
        jle     ?_133                                   ; 1FAA _ 0F 8E, 000000D5
        cmp     dword [ebp-1CH], 18                     ; 1FB0 _ 83. 7D, E4, 12
        jg      ?_133                                   ; 1FB4 _ 0F 8F, 000000CB
        mov     eax, dword [ebp-14H]                    ; 1FBA _ 8B. 45, EC
        mov     eax, dword [eax+20H]                    ; 1FBD _ 8B. 40, 20
        test    eax, eax                                ; 1FC0 _ 85. C0
        je      ?_133                                   ; 1FC2 _ 0F 84, 000000BD
        call    io_cli                                  ; 1FC8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1FCD _ 83. EC, 08
        push    dword [ebp-14H]                         ; 1FD0 _ FF. 75, EC
        push    dword [ebp+8H]                          ; 1FD3 _ FF. 75, 08
        call    sheet_free                              ; 1FD6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FDB _ 83. C4, 10
        call    get_code32_addr                         ; 1FDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1FE3 _ 89. 45, E0
        mov     eax, dword [ebp-14H]                    ; 1FE6 _ 8B. 45, EC
        mov     eax, dword [eax+20H]                    ; 1FE9 _ 8B. 40, 20
        mov     edx, kill_process                       ; 1FEC _ BA, 00000000(d)
        sub     edx, dword [ebp-20H]                    ; 1FF1 _ 2B. 55, E0
        mov     dword [eax+4CH], edx                    ; 1FF4 _ 89. 50, 4C
        call    io_sti                                  ; 1FF7 _ E8, FFFFFFFC(rel)
        jmp     ?_133                                   ; 1FFC _ E9, 00000084

?_129:  sub     dword [ebp-0CH], 1                      ; 2001 _ 83. 6D, F4, 01
?_130:  cmp     dword [ebp-0CH], 0                      ; 2005 _ 83. 7D, F4, 00
        jg      ?_127                                   ; 2009 _ 0F 8F, FFFFFE88
        jmp     ?_134                                   ; 200F _ EB, 75

?_131:  mov     edx, dword [mx]                         ; 2011 _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 2017 _ A1, 0000001C(d)
        sub     edx, eax                                ; 201C _ 29. C2
        mov     eax, edx                                ; 201E _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2020 _ 89. 45, E8
        mov     edx, dword [my]                         ; 2023 _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 2029 _ A1, 00000020(d)
        sub     edx, eax                                ; 202E _ 29. C2
        mov     eax, edx                                ; 2030 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2032 _ 89. 45, E4
        mov     eax, dword [mouse_clicked_sht]          ; 2035 _ A1, 0000013C(d)
        mov     edx, dword [eax+10H]                    ; 203A _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 203D _ 8B. 45, E4
        lea     ecx, [edx+eax]                          ; 2040 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 2043 _ A1, 0000013C(d)
        mov     edx, dword [eax+0CH]                    ; 2048 _ 8B. 50, 0C
        mov     eax, dword [ebp-18H]                    ; 204B _ 8B. 45, E8
        add     edx, eax                                ; 204E _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 2050 _ A1, 0000013C(d)
        push    ecx                                     ; 2055 _ 51
        push    edx                                     ; 2056 _ 52
        push    eax                                     ; 2057 _ 50
        push    dword [ebp+8H]                          ; 2058 _ FF. 75, 08
        call    sheet_slide                             ; 205B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2060 _ 83. C4, 10
        mov     eax, dword [mx]                         ; 2063 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2068 _ A3, 0000001C(d)
        mov     eax, dword [my]                         ; 206D _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2072 _ A3, 00000020(d)
        jmp     ?_134                                   ; 2077 _ EB, 0D

?_132:  mov     dword [mmx], -1                         ; 2079 _ C7. 05, 0000001C(d), FFFFFFFF
        jmp     ?_134                                   ; 2083 _ EB, 01

?_133:  nop                                             ; 2085 _ 90
?_134:  nop                                             ; 2086 _ 90
        leave                                           ; 2087 _ C9
        ret                                             ; 2088 _ C3
; show_mouse_info End of function

draw_desktop:; Function begin
        push    ebp                                     ; 2089 _ 55
        mov     ebp, esp                                ; 208A _ 89. E5
        push    ebx                                     ; 208C _ 53
        sub     esp, 4                                  ; 208D _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2090 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2093 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 2096 _ 8B. 45, 0C
        sub     eax, 1                                  ; 2099 _ 83. E8, 01
        sub     esp, 4                                  ; 209C _ 83. EC, 04
        push    edx                                     ; 209F _ 52
        push    eax                                     ; 20A0 _ 50
        push    0                                       ; 20A1 _ 6A, 00
        push    0                                       ; 20A3 _ 6A, 00
        push    14                                      ; 20A5 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 20A7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 20AA _ FF. 75, 08
        call    boxfill8                                ; 20AD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 20B2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 20B5 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 20B8 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 20BB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 20BE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 20C1 _ 8B. 45, 10
        sub     eax, 28                                 ; 20C4 _ 83. E8, 1C
        sub     esp, 4                                  ; 20C7 _ 83. EC, 04
        push    ecx                                     ; 20CA _ 51
        push    edx                                     ; 20CB _ 52
        push    eax                                     ; 20CC _ 50
        push    0                                       ; 20CD _ 6A, 00
        push    8                                       ; 20CF _ 6A, 08
        push    dword [ebp+0CH]                         ; 20D1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 20D4 _ FF. 75, 08
        call    boxfill8                                ; 20D7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 20DC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 20DF _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 20E2 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 20E5 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 20E8 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 20EB _ 8B. 45, 10
        sub     eax, 27                                 ; 20EE _ 83. E8, 1B
        sub     esp, 4                                  ; 20F1 _ 83. EC, 04
        push    ecx                                     ; 20F4 _ 51
        push    edx                                     ; 20F5 _ 52
        push    eax                                     ; 20F6 _ 50
        push    0                                       ; 20F7 _ 6A, 00
        push    7                                       ; 20F9 _ 6A, 07
        push    dword [ebp+0CH]                         ; 20FB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 20FE _ FF. 75, 08
        call    boxfill8                                ; 2101 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2106 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2109 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 210C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 210F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2112 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2115 _ 8B. 45, 10
        sub     eax, 26                                 ; 2118 _ 83. E8, 1A
        sub     esp, 4                                  ; 211B _ 83. EC, 04
        push    ecx                                     ; 211E _ 51
        push    edx                                     ; 211F _ 52
        push    eax                                     ; 2120 _ 50
        push    0                                       ; 2121 _ 6A, 00
        push    8                                       ; 2123 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2125 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2128 _ FF. 75, 08
        call    boxfill8                                ; 212B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2130 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2133 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2136 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2139 _ 8B. 45, 10
        sub     eax, 24                                 ; 213C _ 83. E8, 18
        sub     esp, 4                                  ; 213F _ 83. EC, 04
        push    edx                                     ; 2142 _ 52
        push    59                                      ; 2143 _ 6A, 3B
        push    eax                                     ; 2145 _ 50
        push    3                                       ; 2146 _ 6A, 03
        push    7                                       ; 2148 _ 6A, 07
        push    dword [ebp+0CH]                         ; 214A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 214D _ FF. 75, 08
        call    boxfill8                                ; 2150 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2155 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2158 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 215B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 215E _ 8B. 45, 10
        sub     eax, 24                                 ; 2161 _ 83. E8, 18
        sub     esp, 4                                  ; 2164 _ 83. EC, 04
        push    edx                                     ; 2167 _ 52
        push    2                                       ; 2168 _ 6A, 02
        push    eax                                     ; 216A _ 50
        push    2                                       ; 216B _ 6A, 02
        push    7                                       ; 216D _ 6A, 07
        push    dword [ebp+0CH]                         ; 216F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2172 _ FF. 75, 08
        call    boxfill8                                ; 2175 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 217A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 217D _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2180 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2183 _ 8B. 45, 10
        sub     eax, 4                                  ; 2186 _ 83. E8, 04
        sub     esp, 4                                  ; 2189 _ 83. EC, 04
        push    edx                                     ; 218C _ 52
        push    59                                      ; 218D _ 6A, 3B
        push    eax                                     ; 218F _ 50
        push    3                                       ; 2190 _ 6A, 03
        push    15                                      ; 2192 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2194 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2197 _ FF. 75, 08
        call    boxfill8                                ; 219A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 219F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 21A2 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 21A5 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 21A8 _ 8B. 45, 10
        sub     eax, 23                                 ; 21AB _ 83. E8, 17
        sub     esp, 4                                  ; 21AE _ 83. EC, 04
        push    edx                                     ; 21B1 _ 52
        push    59                                      ; 21B2 _ 6A, 3B
        push    eax                                     ; 21B4 _ 50
        push    59                                      ; 21B5 _ 6A, 3B
        push    15                                      ; 21B7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 21B9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 21BC _ FF. 75, 08
        call    boxfill8                                ; 21BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 21C4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 21C7 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 21CA _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 21CD _ 8B. 45, 10
        sub     eax, 3                                  ; 21D0 _ 83. E8, 03
        sub     esp, 4                                  ; 21D3 _ 83. EC, 04
        push    edx                                     ; 21D6 _ 52
        push    59                                      ; 21D7 _ 6A, 3B
        push    eax                                     ; 21D9 _ 50
        push    2                                       ; 21DA _ 6A, 02
        push    0                                       ; 21DC _ 6A, 00
        push    dword [ebp+0CH]                         ; 21DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 21E1 _ FF. 75, 08
        call    boxfill8                                ; 21E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 21E9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 21EC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 21EF _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 21F2 _ 8B. 45, 10
        sub     eax, 24                                 ; 21F5 _ 83. E8, 18
        sub     esp, 4                                  ; 21F8 _ 83. EC, 04
        push    edx                                     ; 21FB _ 52
        push    60                                      ; 21FC _ 6A, 3C
        push    eax                                     ; 21FE _ 50
        push    60                                      ; 21FF _ 6A, 3C
        push    0                                       ; 2201 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2203 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2206 _ FF. 75, 08
        call    boxfill8                                ; 2209 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 220E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2211 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2214 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2217 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 221A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 221D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2220 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2223 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2226 _ 83. E8, 2F
        sub     esp, 4                                  ; 2229 _ 83. EC, 04
        push    ebx                                     ; 222C _ 53
        push    ecx                                     ; 222D _ 51
        push    edx                                     ; 222E _ 52
        push    eax                                     ; 222F _ 50
        push    15                                      ; 2230 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2232 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2235 _ FF. 75, 08
        call    boxfill8                                ; 2238 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 223D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2240 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2243 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2246 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2249 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 224C _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 224F _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2252 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2255 _ 83. E8, 2F
        sub     esp, 4                                  ; 2258 _ 83. EC, 04
        push    ebx                                     ; 225B _ 53
        push    ecx                                     ; 225C _ 51
        push    edx                                     ; 225D _ 52
        push    eax                                     ; 225E _ 50
        push    15                                      ; 225F _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2261 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2264 _ FF. 75, 08
        call    boxfill8                                ; 2267 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 226C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 226F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2272 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2275 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2278 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 227B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 227E _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2281 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2284 _ 83. E8, 2F
        sub     esp, 4                                  ; 2287 _ 83. EC, 04
        push    ebx                                     ; 228A _ 53
        push    ecx                                     ; 228B _ 51
        push    edx                                     ; 228C _ 52
        push    eax                                     ; 228D _ 50
        push    7                                       ; 228E _ 6A, 07
        push    dword [ebp+0CH]                         ; 2290 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2293 _ FF. 75, 08
        call    boxfill8                                ; 2296 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 229B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 229E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 22A1 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 22A4 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 22A7 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 22AA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 22AD _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 22B0 _ 8B. 45, 0C
        sub     eax, 3                                  ; 22B3 _ 83. E8, 03
        sub     esp, 4                                  ; 22B6 _ 83. EC, 04
        push    ebx                                     ; 22B9 _ 53
        push    ecx                                     ; 22BA _ 51
        push    edx                                     ; 22BB _ 52
        push    eax                                     ; 22BC _ 50
        push    7                                       ; 22BD _ 6A, 07
        push    dword [ebp+0CH]                         ; 22BF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 22C2 _ FF. 75, 08
        call    boxfill8                                ; 22C5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22CA _ 83. C4, 20
        nop                                             ; 22CD _ 90
        mov     ebx, dword [ebp-4H]                     ; 22CE _ 8B. 5D, FC
        leave                                           ; 22D1 _ C9
        ret                                             ; 22D2 _ C3
; draw_desktop End of function

init_palette:; Function begin
        push    ebp                                     ; 22D3 _ 55
        mov     ebp, esp                                ; 22D4 _ 89. E5
        sub     esp, 680                                ; 22D6 _ 81. EC, 000002A8
        sub     esp, 4                                  ; 22DC _ 83. EC, 04
        push    table_rgb.2147                          ; 22DF _ 68, 00000120(d)
        push    15                                      ; 22E4 _ 6A, 0F
        push    0                                       ; 22E6 _ 6A, 00
        call    set_palette                             ; 22E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22ED _ 83. C4, 10
        mov     dword [ebp-14H], 0                      ; 22F0 _ C7. 45, EC, 00000000
        jmp     ?_140                                   ; 22F7 _ E9, 000000EF

?_135:  mov     dword [ebp-10H], 0                      ; 22FC _ C7. 45, F0, 00000000
        jmp     ?_139                                   ; 2303 _ E9, 000000D5

?_136:  mov     dword [ebp-0CH], 0                      ; 2308 _ C7. 45, F4, 00000000
        jmp     ?_138                                   ; 230F _ E9, 000000BB

?_137:  mov     edx, dword [ebp-10H]                    ; 2314 _ 8B. 55, F0
        mov     eax, edx                                ; 2317 _ 89. D0
        add     eax, eax                                ; 2319 _ 01. C0
        add     eax, edx                                ; 231B _ 01. D0
        add     eax, eax                                ; 231D _ 01. C0
        mov     edx, eax                                ; 231F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2321 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2324 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2327 _ 8B. 55, EC
        mov     eax, edx                                ; 232A _ 89. D0
        shl     eax, 3                                  ; 232C _ C1. E0, 03
        add     eax, edx                                ; 232F _ 01. D0
        shl     eax, 2                                  ; 2331 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2334 _ 8D. 14 01
        mov     eax, edx                                ; 2337 _ 89. D0
        add     eax, eax                                ; 2339 _ 01. C0
        add     edx, eax                                ; 233B _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 233D _ 8B. 45, F4
        mov     ecx, 51                                 ; 2340 _ B9, 00000033
        imul    eax, ecx                                ; 2345 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2348 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 234F _ 8B. 55, F0
        mov     eax, edx                                ; 2352 _ 89. D0
        add     eax, eax                                ; 2354 _ 01. C0
        add     eax, edx                                ; 2356 _ 01. D0
        add     eax, eax                                ; 2358 _ 01. C0
        mov     edx, eax                                ; 235A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 235C _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 235F _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2362 _ 8B. 55, EC
        mov     eax, edx                                ; 2365 _ 89. D0
        shl     eax, 3                                  ; 2367 _ C1. E0, 03
        add     eax, edx                                ; 236A _ 01. D0
        shl     eax, 2                                  ; 236C _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 236F _ 8D. 14 01
        mov     eax, edx                                ; 2372 _ 89. D0
        add     eax, eax                                ; 2374 _ 01. C0
        add     eax, edx                                ; 2376 _ 01. D0
        lea     edx, [eax+1H]                           ; 2378 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 237B _ 8B. 45, F0
        mov     ecx, 51                                 ; 237E _ B9, 00000033
        imul    eax, ecx                                ; 2383 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2386 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 238D _ 8B. 55, F0
        mov     eax, edx                                ; 2390 _ 89. D0
        add     eax, eax                                ; 2392 _ 01. C0
        add     eax, edx                                ; 2394 _ 01. D0
        add     eax, eax                                ; 2396 _ 01. C0
        mov     edx, eax                                ; 2398 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 239A _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 239D _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 23A0 _ 8B. 55, EC
        mov     eax, edx                                ; 23A3 _ 89. D0
        shl     eax, 3                                  ; 23A5 _ C1. E0, 03
        add     eax, edx                                ; 23A8 _ 01. D0
        shl     eax, 2                                  ; 23AA _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 23AD _ 8D. 14 01
        mov     eax, edx                                ; 23B0 _ 89. D0
        add     eax, eax                                ; 23B2 _ 01. C0
        add     eax, edx                                ; 23B4 _ 01. D0
        lea     edx, [eax+2H]                           ; 23B6 _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 23B9 _ 8B. 45, EC
        mov     ecx, 51                                 ; 23BC _ B9, 00000033
        imul    eax, ecx                                ; 23C1 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 23C4 _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 23CB _ 83. 45, F4, 01
?_138:  cmp     dword [ebp-0CH], 5                      ; 23CF _ 83. 7D, F4, 05
        jle     ?_137                                   ; 23D3 _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 23D9 _ 83. 45, F0, 01
?_139:  cmp     dword [ebp-10H], 5                      ; 23DD _ 83. 7D, F0, 05
        jle     ?_136                                   ; 23E1 _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 23E7 _ 83. 45, EC, 01
?_140:  cmp     dword [ebp-14H], 5                      ; 23EB _ 83. 7D, EC, 05
        jle     ?_135                                   ; 23EF _ 0F 8E, FFFFFF07
        sub     esp, 4                                  ; 23F5 _ 83. EC, 04
        lea     eax, [ebp-29CH]                         ; 23F8 _ 8D. 85, FFFFFD64
        push    eax                                     ; 23FE _ 50
        push    231                                     ; 23FF _ 68, 000000E7
        push    16                                      ; 2404 _ 6A, 10
        call    set_palette                             ; 2406 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 240B _ 83. C4, 10
        nop                                             ; 240E _ 90
        leave                                           ; 240F _ C9
        ret                                             ; 2410 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 2411 _ 55
        mov     ebp, esp                                ; 2412 _ 89. E5
        sub     esp, 24                                 ; 2414 _ 83. EC, 18
        call    io_load_eflags                          ; 2417 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 241C _ 89. 45, F0
        call    io_cli                                  ; 241F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2424 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 2427 _ FF. 75, 08
        push    968                                     ; 242A _ 68, 000003C8
        call    io_out8                                 ; 242F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2434 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2437 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 243A _ 89. 45, F4
        jmp     ?_142                                   ; 243D _ EB, 65

?_141:  mov     eax, dword [ebp+10H]                    ; 243F _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 2442 _ 0F B6. 00
        shr     al, 2                                   ; 2445 _ C0. E8, 02
        movzx   eax, al                                 ; 2448 _ 0F B6. C0
        sub     esp, 8                                  ; 244B _ 83. EC, 08
        push    eax                                     ; 244E _ 50
        push    969                                     ; 244F _ 68, 000003C9
        call    io_out8                                 ; 2454 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2459 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 245C _ 8B. 45, 10
        add     eax, 1                                  ; 245F _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 2462 _ 0F B6. 00
        shr     al, 2                                   ; 2465 _ C0. E8, 02
        movzx   eax, al                                 ; 2468 _ 0F B6. C0
        sub     esp, 8                                  ; 246B _ 83. EC, 08
        push    eax                                     ; 246E _ 50
        push    969                                     ; 246F _ 68, 000003C9
        call    io_out8                                 ; 2474 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2479 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 247C _ 8B. 45, 10
        add     eax, 2                                  ; 247F _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2482 _ 0F B6. 00
        shr     al, 2                                   ; 2485 _ C0. E8, 02
        movzx   eax, al                                 ; 2488 _ 0F B6. C0
        sub     esp, 8                                  ; 248B _ 83. EC, 08
        push    eax                                     ; 248E _ 50
        push    969                                     ; 248F _ 68, 000003C9
        call    io_out8                                 ; 2494 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2499 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 249C _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 24A0 _ 83. 45, F4, 01
?_142:  mov     eax, dword [ebp-0CH]                    ; 24A4 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 24A7 _ 3B. 45, 0C
        jle     ?_141                                   ; 24AA _ 7E, 93
        sub     esp, 12                                 ; 24AC _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 24AF _ FF. 75, F0
        call    io_store_eflags                         ; 24B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24B7 _ 83. C4, 10
        nop                                             ; 24BA _ 90
        leave                                           ; 24BB _ C9
        ret                                             ; 24BC _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 24BD _ 55
        mov     ebp, esp                                ; 24BE _ 89. E5
        sub     esp, 20                                 ; 24C0 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 24C3 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 24C6 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 24C9 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 24CC _ 89. 45, F8
        jmp     ?_146                                   ; 24CF _ EB, 33

?_143:  mov     eax, dword [ebp+14H]                    ; 24D1 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 24D4 _ 89. 45, FC
        jmp     ?_145                                   ; 24D7 _ EB, 1F

?_144:  mov     eax, dword [ebp-8H]                     ; 24D9 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 24DC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 24E0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 24E2 _ 8B. 45, FC
        add     eax, edx                                ; 24E5 _ 01. D0
        mov     edx, eax                                ; 24E7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 24E9 _ 8B. 45, 08
        add     edx, eax                                ; 24EC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 24EE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 24F2 _ 88. 02
        add     dword [ebp-4H], 1                       ; 24F4 _ 83. 45, FC, 01
?_145:  mov     eax, dword [ebp-4H]                     ; 24F8 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 24FB _ 3B. 45, 1C
        jle     ?_144                                   ; 24FE _ 7E, D9
        add     dword [ebp-8H], 1                       ; 2500 _ 83. 45, F8, 01
?_146:  mov     eax, dword [ebp-8H]                     ; 2504 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 2507 _ 3B. 45, 20
        jle     ?_143                                   ; 250A _ 7E, C5
        nop                                             ; 250C _ 90
        leave                                           ; 250D _ C9
        ret                                             ; 250E _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 250F _ 55
        mov     ebp, esp                                ; 2510 _ 89. E5
        sub     esp, 20                                 ; 2512 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 2515 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 2518 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 251B _ C7. 45, FC, 00000000
        jmp     ?_156                                   ; 2522 _ E9, 0000016C

?_147:  mov     edx, dword [ebp-4H]                     ; 2527 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 252A _ 8B. 45, 1C
        add     eax, edx                                ; 252D _ 01. D0
        movzx   eax, byte [eax]                         ; 252F _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 2532 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 2535 _ 80. 7D, FB, 00
        jns     ?_148                                   ; 2539 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 253B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 253E _ 8B. 45, FC
        add     eax, edx                                ; 2541 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2543 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2547 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2549 _ 8B. 45, 10
        add     eax, edx                                ; 254C _ 01. D0
        mov     edx, eax                                ; 254E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2550 _ 8B. 45, 08
        add     edx, eax                                ; 2553 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2555 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2559 _ 88. 02
?_148:  movsx   eax, byte [ebp-5H]                      ; 255B _ 0F BE. 45, FB
        and     eax, 40H                                ; 255F _ 83. E0, 40
        test    eax, eax                                ; 2562 _ 85. C0
        jz      ?_149                                   ; 2564 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2566 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2569 _ 8B. 45, FC
        add     eax, edx                                ; 256C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 256E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2572 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2574 _ 8B. 45, 10
        add     eax, edx                                ; 2577 _ 01. D0
        lea     edx, [eax+1H]                           ; 2579 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 257C _ 8B. 45, 08
        add     edx, eax                                ; 257F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2581 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2585 _ 88. 02
?_149:  movsx   eax, byte [ebp-5H]                      ; 2587 _ 0F BE. 45, FB
        and     eax, 20H                                ; 258B _ 83. E0, 20
        test    eax, eax                                ; 258E _ 85. C0
        jz      ?_150                                   ; 2590 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2592 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2595 _ 8B. 45, FC
        add     eax, edx                                ; 2598 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 259A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 259E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 25A0 _ 8B. 45, 10
        add     eax, edx                                ; 25A3 _ 01. D0
        lea     edx, [eax+2H]                           ; 25A5 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 25A8 _ 8B. 45, 08
        add     edx, eax                                ; 25AB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 25AD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 25B1 _ 88. 02
?_150:  movsx   eax, byte [ebp-5H]                      ; 25B3 _ 0F BE. 45, FB
        and     eax, 10H                                ; 25B7 _ 83. E0, 10
        test    eax, eax                                ; 25BA _ 85. C0
        jz      ?_151                                   ; 25BC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 25BE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 25C1 _ 8B. 45, FC
        add     eax, edx                                ; 25C4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 25C6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 25CA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 25CC _ 8B. 45, 10
        add     eax, edx                                ; 25CF _ 01. D0
        lea     edx, [eax+3H]                           ; 25D1 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 25D4 _ 8B. 45, 08
        add     edx, eax                                ; 25D7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 25D9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 25DD _ 88. 02
?_151:  movsx   eax, byte [ebp-5H]                      ; 25DF _ 0F BE. 45, FB
        and     eax, 08H                                ; 25E3 _ 83. E0, 08
        test    eax, eax                                ; 25E6 _ 85. C0
        jz      ?_152                                   ; 25E8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 25EA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 25ED _ 8B. 45, FC
        add     eax, edx                                ; 25F0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 25F2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 25F6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 25F8 _ 8B. 45, 10
        add     eax, edx                                ; 25FB _ 01. D0
        lea     edx, [eax+4H]                           ; 25FD _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2600 _ 8B. 45, 08
        add     edx, eax                                ; 2603 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2605 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2609 _ 88. 02
?_152:  movsx   eax, byte [ebp-5H]                      ; 260B _ 0F BE. 45, FB
        and     eax, 04H                                ; 260F _ 83. E0, 04
        test    eax, eax                                ; 2612 _ 85. C0
        jz      ?_153                                   ; 2614 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2616 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2619 _ 8B. 45, FC
        add     eax, edx                                ; 261C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 261E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2622 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2624 _ 8B. 45, 10
        add     eax, edx                                ; 2627 _ 01. D0
        lea     edx, [eax+5H]                           ; 2629 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 262C _ 8B. 45, 08
        add     edx, eax                                ; 262F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2631 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2635 _ 88. 02
?_153:  movsx   eax, byte [ebp-5H]                      ; 2637 _ 0F BE. 45, FB
        and     eax, 02H                                ; 263B _ 83. E0, 02
        test    eax, eax                                ; 263E _ 85. C0
        jz      ?_154                                   ; 2640 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2642 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2645 _ 8B. 45, FC
        add     eax, edx                                ; 2648 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 264A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 264E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2650 _ 8B. 45, 10
        add     eax, edx                                ; 2653 _ 01. D0
        lea     edx, [eax+6H]                           ; 2655 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 2658 _ 8B. 45, 08
        add     edx, eax                                ; 265B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 265D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2661 _ 88. 02
?_154:  movsx   eax, byte [ebp-5H]                      ; 2663 _ 0F BE. 45, FB
        and     eax, 01H                                ; 2667 _ 83. E0, 01
        test    eax, eax                                ; 266A _ 85. C0
        jz      ?_155                                   ; 266C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 266E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2671 _ 8B. 45, FC
        add     eax, edx                                ; 2674 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2676 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 267A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 267C _ 8B. 45, 10
        add     eax, edx                                ; 267F _ 01. D0
        lea     edx, [eax+7H]                           ; 2681 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 2684 _ 8B. 45, 08
        add     edx, eax                                ; 2687 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2689 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 268D _ 88. 02
?_155:  add     dword [ebp-4H], 1                       ; 268F _ 83. 45, FC, 01
?_156:  cmp     dword [ebp-4H], 15                      ; 2693 _ 83. 7D, FC, 0F
        jle     ?_147                                   ; 2697 _ 0F 8E, FFFFFE8A
        nop                                             ; 269D _ 90
        leave                                           ; 269E _ C9
        ret                                             ; 269F _ C3
; showFont8 End of function

initBootInfo:; Function begin
        push    ebp                                     ; 26A0 _ 55
        mov     ebp, esp                                ; 26A1 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 26A3 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 26A6 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 26AC _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 26AF _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 26B5 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 26B8 _ 66: C7. 40, 06, 01E0
        nop                                             ; 26BE _ 90
        pop     ebp                                     ; 26BF _ 5D
        ret                                             ; 26C0 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 26C1 _ 55
        mov     ebp, esp                                ; 26C2 _ 89. E5
        push    ebx                                     ; 26C4 _ 53
        sub     esp, 36                                 ; 26C5 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 26C8 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 26CB _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 26CE _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 26D1 _ 89. 45, F4
        jmp     ?_158                                   ; 26D4 _ EB, 3B

?_157:  mov     eax, dword [ebp+1CH]                    ; 26D6 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 26D9 _ 0F B6. 00
        movzx   eax, al                                 ; 26DC _ 0F B6. C0
        shl     eax, 4                                  ; 26DF _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 26E2 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 26E8 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 26EC _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 26EF _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 26F2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 26F5 _ 8B. 00
        push    ebx                                     ; 26F7 _ 53
        push    ecx                                     ; 26F8 _ 51
        push    dword [ebp+14H]                         ; 26F9 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 26FC _ FF. 75, 10
        push    edx                                     ; 26FF _ 52
        push    eax                                     ; 2700 _ 50
        call    showFont8                               ; 2701 _ E8, FFFFFFFC(rel)
        add     esp, 24                                 ; 2706 _ 83. C4, 18
        add     dword [ebp+10H], 8                      ; 2709 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 270D _ 83. 45, 1C, 01
?_158:  mov     eax, dword [ebp+1CH]                    ; 2711 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2714 _ 0F B6. 00
        test    al, al                                  ; 2717 _ 84. C0
        jnz     ?_157                                   ; 2719 _ 75, BB
        mov     eax, dword [ebp+14H]                    ; 271B _ 8B. 45, 14
        add     eax, 16                                 ; 271E _ 83. C0, 10
        sub     esp, 8                                  ; 2721 _ 83. EC, 08
        push    eax                                     ; 2724 _ 50
        push    dword [ebp+10H]                         ; 2725 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 2728 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 272B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 272E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2731 _ FF. 75, 08
        call    sheet_refresh                           ; 2734 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2739 _ 83. C4, 20
        nop                                             ; 273C _ 90
        mov     ebx, dword [ebp-4H]                     ; 273D _ 8B. 5D, FC
        leave                                           ; 2740 _ C9
        ret                                             ; 2741 _ C3
; showString End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 2742 _ 55
        mov     ebp, esp                                ; 2743 _ 89. E5
        sub     esp, 20                                 ; 2745 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2748 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 274B _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 274E _ C7. 45, F8, 00000000
        jmp     ?_165                                   ; 2755 _ E9, 000000B1

?_159:  mov     dword [ebp-4H], 0                       ; 275A _ C7. 45, FC, 00000000
        jmp     ?_164                                   ; 2761 _ E9, 00000097

?_160:  mov     eax, dword [ebp-8H]                     ; 2766 _ 8B. 45, F8
        shl     eax, 4                                  ; 2769 _ C1. E0, 04
        mov     edx, eax                                ; 276C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 276E _ 8B. 45, FC
        add     eax, edx                                ; 2771 _ 01. D0
        add     eax, cursor.2222                        ; 2773 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 2778 _ 0F B6. 00
        cmp     al, 42                                  ; 277B _ 3C, 2A
        jnz     ?_161                                   ; 277D _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 277F _ 8B. 45, F8
        shl     eax, 4                                  ; 2782 _ C1. E0, 04
        mov     edx, eax                                ; 2785 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2787 _ 8B. 45, FC
        add     eax, edx                                ; 278A _ 01. D0
        mov     edx, eax                                ; 278C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 278E _ 8B. 45, 08
        add     eax, edx                                ; 2791 _ 01. D0
        mov     byte [eax], 0                           ; 2793 _ C6. 00, 00
?_161:  mov     eax, dword [ebp-8H]                     ; 2796 _ 8B. 45, F8
        shl     eax, 4                                  ; 2799 _ C1. E0, 04
        mov     edx, eax                                ; 279C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 279E _ 8B. 45, FC
        add     eax, edx                                ; 27A1 _ 01. D0
        add     eax, cursor.2222                        ; 27A3 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 27A8 _ 0F B6. 00
        cmp     al, 79                                  ; 27AB _ 3C, 4F
        jnz     ?_162                                   ; 27AD _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 27AF _ 8B. 45, F8
        shl     eax, 4                                  ; 27B2 _ C1. E0, 04
        mov     edx, eax                                ; 27B5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 27B7 _ 8B. 45, FC
        add     eax, edx                                ; 27BA _ 01. D0
        mov     edx, eax                                ; 27BC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27BE _ 8B. 45, 08
        add     eax, edx                                ; 27C1 _ 01. D0
        mov     byte [eax], 7                           ; 27C3 _ C6. 00, 07
?_162:  mov     eax, dword [ebp-8H]                     ; 27C6 _ 8B. 45, F8
        shl     eax, 4                                  ; 27C9 _ C1. E0, 04
        mov     edx, eax                                ; 27CC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 27CE _ 8B. 45, FC
        add     eax, edx                                ; 27D1 _ 01. D0
        add     eax, cursor.2222                        ; 27D3 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 27D8 _ 0F B6. 00
        cmp     al, 46                                  ; 27DB _ 3C, 2E
        jnz     ?_163                                   ; 27DD _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 27DF _ 8B. 45, F8
        shl     eax, 4                                  ; 27E2 _ C1. E0, 04
        mov     edx, eax                                ; 27E5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 27E7 _ 8B. 45, FC
        add     eax, edx                                ; 27EA _ 01. D0
        mov     edx, eax                                ; 27EC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27EE _ 8B. 45, 08
        add     edx, eax                                ; 27F1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 27F3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 27F7 _ 88. 02
?_163:  add     dword [ebp-4H], 1                       ; 27F9 _ 83. 45, FC, 01
?_164:  cmp     dword [ebp-4H], 15                      ; 27FD _ 83. 7D, FC, 0F
        jle     ?_160                                   ; 2801 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 2807 _ 83. 45, F8, 01
?_165:  cmp     dword [ebp-8H], 15                      ; 280B _ 83. 7D, F8, 0F
        jle     ?_159                                   ; 280F _ 0F 8E, FFFFFF45
        nop                                             ; 2815 _ 90
        leave                                           ; 2816 _ C9
        ret                                             ; 2817 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 2818 _ 55
        mov     ebp, esp                                ; 2819 _ 89. E5
        sub     esp, 16                                 ; 281B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 281E _ C7. 45, F8, 00000000
        jmp     ?_169                                   ; 2825 _ EB, 50

?_166:  mov     dword [ebp-4H], 0                       ; 2827 _ C7. 45, FC, 00000000
        jmp     ?_168                                   ; 282E _ EB, 3B

?_167:  mov     edx, dword [ebp+1CH]                    ; 2830 _ 8B. 55, 1C
        mov     eax, dword [ebp-8H]                     ; 2833 _ 8B. 45, F8
        add     eax, edx                                ; 2836 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2838 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 283C _ 8B. 4D, 18
        mov     edx, dword [ebp-4H]                     ; 283F _ 8B. 55, FC
        add     edx, ecx                                ; 2842 _ 01. CA
        add     eax, edx                                ; 2844 _ 01. D0
        mov     edx, eax                                ; 2846 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2848 _ 8B. 45, 08
        add     edx, eax                                ; 284B _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 284D _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 2850 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 2854 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 2856 _ 8B. 45, FC
        add     eax, ecx                                ; 2859 _ 01. C8
        mov     ecx, eax                                ; 285B _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 285D _ 8B. 45, 20
        add     eax, ecx                                ; 2860 _ 01. C8
        movzx   eax, byte [eax]                         ; 2862 _ 0F B6. 00
        mov     byte [edx], al                          ; 2865 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2867 _ 83. 45, FC, 01
?_168:  mov     eax, dword [ebp-4H]                     ; 286B _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 286E _ 3B. 45, 10
        jl      ?_167                                   ; 2871 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2873 _ 83. 45, F8, 01
?_169:  mov     eax, dword [ebp-8H]                     ; 2877 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 287A _ 3B. 45, 14
        jl      ?_166                                   ; 287D _ 7C, A8
        nop                                             ; 287F _ 90
        leave                                           ; 2880 _ C9
        ret                                             ; 2881 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2882 _ 55
        mov     ebp, esp                                ; 2883 _ 89. E5
        sub     esp, 24                                 ; 2885 _ 83. EC, 18
        sub     esp, 8                                  ; 2888 _ 83. EC, 08
        push    32                                      ; 288B _ 6A, 20
        push    32                                      ; 288D _ 6A, 20
        call    io_out8                                 ; 288F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2894 _ 83. C4, 10
        mov     byte [ebp-9H], 0                        ; 2897 _ C6. 45, F7, 00
        sub     esp, 12                                 ; 289B _ 83. EC, 0C
        push    96                                      ; 289E _ 6A, 60
        call    io_in8                                  ; 28A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 28A5 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 28A8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 28AB _ 0F B6. 45, F7
        sub     esp, 8                                  ; 28AF _ 83. EC, 08
        push    eax                                     ; 28B2 _ 50
        push    keyinfo                                 ; 28B3 _ 68, 000000D8(d)
        call    fifo8_put                               ; 28B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 28BD _ 83. C4, 10
        nop                                             ; 28C0 _ 90
        leave                                           ; 28C1 _ C9
        ret                                             ; 28C2 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 28C3 _ 55
        mov     ebp, esp                                ; 28C4 _ 89. E5
        sub     esp, 4                                  ; 28C6 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 28C9 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 28CC _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 28CF _ 80. 7D, FC, 09
        jle     ?_170                                   ; 28D3 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 28D5 _ 0F B6. 45, FC
        add     eax, 55                                 ; 28D9 _ 83. C0, 37
        jmp     ?_171                                   ; 28DC _ EB, 07

?_170:  movzx   eax, byte [ebp-4H]                      ; 28DE _ 0F B6. 45, FC
        add     eax, 48                                 ; 28E2 _ 83. C0, 30
?_171:  leave                                           ; 28E5 _ C9
        ret                                             ; 28E6 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 28E7 _ 55
        mov     ebp, esp                                ; 28E8 _ 89. E5
        sub     esp, 20                                 ; 28EA _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 28ED _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 28F0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 28F3 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 28FA _ 0F B6. 45, EC
        and     eax, 0FH                                ; 28FE _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2901 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2904 _ 0F BE. 45, FB
        push    eax                                     ; 2908 _ 50
        call    charToHexVal                            ; 2909 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 290E _ 83. C4, 04
        mov     byte [?_367], al                        ; 2911 _ A2, 00000017(d)
        movzx   eax, byte [ebp-14H]                     ; 2916 _ 0F B6. 45, EC
        shr     al, 4                                   ; 291A _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 291D _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2920 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2924 _ 0F BE. C0
        push    eax                                     ; 2927 _ 50
        call    charToHexVal                            ; 2928 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 292D _ 83. C4, 04
        mov     byte [?_366], al                        ; 2930 _ A2, 00000016(d)
        mov     eax, keyval                             ; 2935 _ B8, 00000014(d)
        leave                                           ; 293A _ C9
        ret                                             ; 293B _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 293C _ 55
        mov     ebp, esp                                ; 293D _ 89. E5
        sub     esp, 16                                 ; 293F _ 83. EC, 10
        mov     byte [str.2267], 48                     ; 2942 _ C6. 05, 00000394(d), 30
        mov     byte [?_380], 88                        ; 2949 _ C6. 05, 00000395(d), 58
        mov     byte [?_381], 0                         ; 2950 _ C6. 05, 0000039E(d), 00
        mov     dword [ebp-4H], 2                       ; 2957 _ C7. 45, FC, 00000002
        jmp     ?_173                                   ; 295E _ EB, 0F

?_172:  mov     eax, dword [ebp-4H]                     ; 2960 _ 8B. 45, FC
        add     eax, str.2267                           ; 2963 _ 05, 00000394(d)
        mov     byte [eax], 48                          ; 2968 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 296B _ 83. 45, FC, 01
?_173:  cmp     dword [ebp-4H], 9                       ; 296F _ 83. 7D, FC, 09
        jle     ?_172                                   ; 2973 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2975 _ C7. 45, F8, 00000009
        jmp     ?_177                                   ; 297C _ EB, 42

?_174:  mov     eax, dword [ebp+8H]                     ; 297E _ 8B. 45, 08
        and     eax, 0FH                                ; 2981 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 2984 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2987 _ 8B. 45, 08
        shr     eax, 4                                  ; 298A _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 298D _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 2990 _ 83. 7D, F4, 09
        jle     ?_175                                   ; 2994 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 2996 _ 8B. 45, F4
        add     eax, 55                                 ; 2999 _ 83. C0, 37
        mov     edx, eax                                ; 299C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 299E _ 8B. 45, F8
        add     eax, str.2267                           ; 29A1 _ 05, 00000394(d)
        mov     byte [eax], dl                          ; 29A6 _ 88. 10
        jmp     ?_176                                   ; 29A8 _ EB, 12

?_175:  mov     eax, dword [ebp-0CH]                    ; 29AA _ 8B. 45, F4
        add     eax, 48                                 ; 29AD _ 83. C0, 30
        mov     edx, eax                                ; 29B0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 29B2 _ 8B. 45, F8
        add     eax, str.2267                           ; 29B5 _ 05, 00000394(d)
        mov     byte [eax], dl                          ; 29BA _ 88. 10
?_176:  sub     dword [ebp-8H], 1                       ; 29BC _ 83. 6D, F8, 01
?_177:  cmp     dword [ebp-8H], 1                       ; 29C0 _ 83. 7D, F8, 01
        jle     ?_178                                   ; 29C4 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 29C6 _ 83. 7D, 08, 00
        jnz     ?_174                                   ; 29CA _ 75, B2
?_178:  mov     eax, str.2267                           ; 29CC _ B8, 00000394(d)
        leave                                           ; 29D1 _ C9
        ret                                             ; 29D2 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 29D3 _ 55
        mov     ebp, esp                                ; 29D4 _ 89. E5
        sub     esp, 8                                  ; 29D6 _ 83. EC, 08
?_179:  sub     esp, 12                                 ; 29D9 _ 83. EC, 0C
        push    100                                     ; 29DC _ 6A, 64
        call    io_in8                                  ; 29DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29E3 _ 83. C4, 10
        and     eax, 02H                                ; 29E6 _ 83. E0, 02
        test    eax, eax                                ; 29E9 _ 85. C0
        jz      ?_180                                   ; 29EB _ 74, 02
        jmp     ?_179                                   ; 29ED _ EB, EA

?_180:  nop                                             ; 29EF _ 90
        nop                                             ; 29F0 _ 90
        leave                                           ; 29F1 _ C9
        ret                                             ; 29F2 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 29F3 _ 55
        mov     ebp, esp                                ; 29F4 _ 89. E5
        sub     esp, 8                                  ; 29F6 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 29F9 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 29FE _ 83. EC, 08
        push    96                                      ; 2A01 _ 6A, 60
        push    100                                     ; 2A03 _ 6A, 64
        call    io_out8                                 ; 2A05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A0A _ 83. C4, 10
        call    wait_KBC_sendready                      ; 2A0D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2A12 _ 83. EC, 08
        push    71                                      ; 2A15 _ 6A, 47
        push    96                                      ; 2A17 _ 6A, 60
        call    io_out8                                 ; 2A19 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A1E _ 83. C4, 10
        nop                                             ; 2A21 _ 90
        leave                                           ; 2A22 _ C9
        ret                                             ; 2A23 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2A24 _ 55
        mov     ebp, esp                                ; 2A25 _ 89. E5
        sub     esp, 8                                  ; 2A27 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 2A2A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2A2F _ 83. EC, 08
        push    212                                     ; 2A32 _ 68, 000000D4
        push    100                                     ; 2A37 _ 6A, 64
        call    io_out8                                 ; 2A39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A3E _ 83. C4, 10
        call    wait_KBC_sendready                      ; 2A41 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2A46 _ 83. EC, 08
        push    244                                     ; 2A49 _ 68, 000000F4
        push    96                                      ; 2A4E _ 6A, 60
        call    io_out8                                 ; 2A50 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A55 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2A58 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 2A5B _ C6. 40, 03, 00
        nop                                             ; 2A5F _ 90
        leave                                           ; 2A60 _ C9
        ret                                             ; 2A61 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 2A62 _ 55
        mov     ebp, esp                                ; 2A63 _ 89. E5
        sub     esp, 24                                 ; 2A65 _ 83. EC, 18
        sub     esp, 8                                  ; 2A68 _ 83. EC, 08
        push    32                                      ; 2A6B _ 6A, 20
        push    160                                     ; 2A6D _ 68, 000000A0
        call    io_out8                                 ; 2A72 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A77 _ 83. C4, 10
        sub     esp, 8                                  ; 2A7A _ 83. EC, 08
        push    32                                      ; 2A7D _ 6A, 20
        push    32                                      ; 2A7F _ 6A, 20
        call    io_out8                                 ; 2A81 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A86 _ 83. C4, 10
        sub     esp, 12                                 ; 2A89 _ 83. EC, 0C
        push    96                                      ; 2A8C _ 6A, 60
        call    io_in8                                  ; 2A8E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A93 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 2A96 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2A99 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 2A9D _ 83. EC, 08
        push    eax                                     ; 2AA0 _ 50
        push    mouseinfo                               ; 2AA1 _ 68, 000000F4(d)
        call    fifo8_put                               ; 2AA6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2AAB _ 83. C4, 10
        nop                                             ; 2AAE _ 90
        leave                                           ; 2AAF _ C9
        ret                                             ; 2AB0 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2AB1 _ 55
        mov     ebp, esp                                ; 2AB2 _ 89. E5
        sub     esp, 4                                  ; 2AB4 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2AB7 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2ABA _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2ABD _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2AC0 _ 0F B6. 40, 03
        test    al, al                                  ; 2AC4 _ 84. C0
        jnz     ?_182                                   ; 2AC6 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2AC8 _ 80. 7D, FC, FA
        jnz     ?_181                                   ; 2ACC _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2ACE _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2AD1 _ C6. 40, 03, 01
?_181:  mov     eax, 0                                  ; 2AD5 _ B8, 00000000
        jmp     ?_189                                   ; 2ADA _ E9, 0000010F

?_182:  mov     eax, dword [ebp+8H]                     ; 2ADF _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2AE2 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2AE6 _ 3C, 01
        jnz     ?_184                                   ; 2AE8 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2AEA _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2AEE _ 25, 000000C8
        cmp     eax, 8                                  ; 2AF3 _ 83. F8, 08
        jnz     ?_183                                   ; 2AF6 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2AF8 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2AFB _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2AFF _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2B01 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2B04 _ C6. 40, 03, 02
?_183:  mov     eax, 0                                  ; 2B08 _ B8, 00000000
        jmp     ?_189                                   ; 2B0D _ E9, 000000DC

?_184:  mov     eax, dword [ebp+8H]                     ; 2B12 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2B15 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2B19 _ 3C, 02
        jnz     ?_185                                   ; 2B1B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2B1D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2B20 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2B24 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B27 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2B2A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2B2E _ B8, 00000000
        jmp     ?_189                                   ; 2B33 _ E9, 000000B6

?_185:  mov     eax, dword [ebp+8H]                     ; 2B38 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2B3B _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2B3F _ 3C, 03
        jne     ?_188                                   ; 2B41 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2B47 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2B4A _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2B4E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2B51 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2B54 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2B58 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2B5B _ 0F B6. 00
        movzx   eax, al                                 ; 2B5E _ 0F B6. C0
        and     eax, 07H                                ; 2B61 _ 83. E0, 07
        mov     edx, eax                                ; 2B64 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B66 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2B69 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2B6C _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2B6F _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2B73 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2B76 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2B79 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2B7C _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2B7F _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2B83 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2B86 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2B89 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B8C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2B8F _ 0F B6. 00
        movzx   eax, al                                 ; 2B92 _ 0F B6. C0
        and     eax, 10H                                ; 2B95 _ 83. E0, 10
        test    eax, eax                                ; 2B98 _ 85. C0
        jz      ?_186                                   ; 2B9A _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2B9C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B9F _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2BA2 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2BA7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BA9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2BAC _ 89. 50, 04
?_186:  mov     eax, dword [ebp+8H]                     ; 2BAF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2BB2 _ 0F B6. 00
        movzx   eax, al                                 ; 2BB5 _ 0F B6. C0
        and     eax, 20H                                ; 2BB8 _ 83. E0, 20
        test    eax, eax                                ; 2BBB _ 85. C0
        jz      ?_187                                   ; 2BBD _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2BBF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2BC2 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2BC5 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2BCA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BCC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2BCF _ 89. 50, 08
?_187:  mov     eax, dword [ebp+8H]                     ; 2BD2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2BD5 _ 8B. 40, 08
        neg     eax                                     ; 2BD8 _ F7. D8
        mov     edx, eax                                ; 2BDA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BDC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2BDF _ 89. 50, 08
        mov     eax, 1                                  ; 2BE2 _ B8, 00000001
        jmp     ?_189                                   ; 2BE7 _ EB, 05

?_188:  mov     eax, 4294967295                         ; 2BE9 _ B8, FFFFFFFF
?_189:  leave                                           ; 2BEE _ C9
        ret                                             ; 2BEF _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 2BF0 _ 55
        mov     ebp, esp                                ; 2BF1 _ 89. E5
        sub     esp, 40                                 ; 2BF3 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 2BF6 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 2BFD _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 2C04 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 2C0B _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 2C12 _ 8B. 15, 00000144(d)
        mov     eax, dword [ebp+0CH]                    ; 2C18 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2C1B _ 8B. 00
        sub     esp, 4                                  ; 2C1D _ 83. EC, 04
        push    edx                                     ; 2C20 _ 52
        push    dword [ebp+1CH]                         ; 2C21 _ FF. 75, 1C
        push    eax                                     ; 2C24 _ 50
        call    draw_desktop                            ; 2C25 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C2A _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 2C2D _ 8B. 45, 20
        movsx   eax, al                                 ; 2C30 _ 0F BE. C0
        sub     esp, 8                                  ; 2C33 _ 83. EC, 08
        push    ?_357                                   ; 2C36 _ 68, 00000049(d)
        push    eax                                     ; 2C3B _ 50
        push    dword [ebp-10H]                         ; 2C3C _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2C3F _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 2C42 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2C45 _ FF. 75, 08
        call    showString                              ; 2C48 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2C4D _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 2C50 _ 8B. 45, 18
        sub     esp, 12                                 ; 2C53 _ 83. EC, 0C
        push    eax                                     ; 2C56 _ 50
        call    intToHexStr                             ; 2C57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C5C _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 2C5F _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 2C62 _ 8B. 45, 20
        movsx   eax, al                                 ; 2C65 _ 0F BE. C0
        sub     esp, 8                                  ; 2C68 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 2C6B _ FF. 75, E4
        push    eax                                     ; 2C6E _ 50
        push    dword [ebp-10H]                         ; 2C6F _ FF. 75, F0
        push    dword [ebp-14H]                         ; 2C72 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 2C75 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2C78 _ FF. 75, 08
        call    showString                              ; 2C7B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2C80 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 2C83 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2C87 _ 8B. 45, 20
        movsx   eax, al                                 ; 2C8A _ 0F BE. C0
        sub     esp, 8                                  ; 2C8D _ 83. EC, 08
        push    ?_358                                   ; 2C90 _ 68, 00000053(d)
        push    eax                                     ; 2C95 _ 50
        push    dword [ebp-10H]                         ; 2C96 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2C99 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 2C9C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2C9F _ FF. 75, 08
        call    showString                              ; 2CA2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2CA7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2CAA _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 2CAD _ 8B. 00
        sub     esp, 12                                 ; 2CAF _ 83. EC, 0C
        push    eax                                     ; 2CB2 _ 50
        call    intToHexStr                             ; 2CB3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CB8 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 2CBB _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 2CBE _ 8B. 45, 20
        movsx   eax, al                                 ; 2CC1 _ 0F BE. C0
        sub     esp, 8                                  ; 2CC4 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 2CC7 _ FF. 75, E0
        push    eax                                     ; 2CCA _ 50
        push    dword [ebp-10H]                         ; 2CCB _ FF. 75, F0
        push    dword [ebp-14H]                         ; 2CCE _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 2CD1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2CD4 _ FF. 75, 08
        call    showString                              ; 2CD7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2CDC _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 2CDF _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2CE3 _ 8B. 45, 20
        movsx   eax, al                                 ; 2CE6 _ 0F BE. C0
        sub     esp, 8                                  ; 2CE9 _ 83. EC, 08
        push    ?_359                                   ; 2CEC _ 68, 0000005F(d)
        push    eax                                     ; 2CF1 _ 50
        push    dword [ebp-10H]                         ; 2CF2 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2CF5 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 2CF8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2CFB _ FF. 75, 08
        call    showString                              ; 2CFE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2D03 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2D06 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 2D09 _ 8B. 40, 04
        sub     esp, 12                                 ; 2D0C _ 83. EC, 0C
        push    eax                                     ; 2D0F _ 50
        call    intToHexStr                             ; 2D10 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D15 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 2D18 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 2D1B _ 8B. 45, 20
        movsx   eax, al                                 ; 2D1E _ 0F BE. C0
        sub     esp, 8                                  ; 2D21 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 2D24 _ FF. 75, DC
        push    eax                                     ; 2D27 _ 50
        push    dword [ebp-10H]                         ; 2D28 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 2D2B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 2D2E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2D31 _ FF. 75, 08
        call    showString                              ; 2D34 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2D39 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 2D3C _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2D40 _ 8B. 45, 20
        movsx   eax, al                                 ; 2D43 _ 0F BE. C0
        sub     esp, 8                                  ; 2D46 _ 83. EC, 08
        push    ?_360                                   ; 2D49 _ 68, 0000006B(d)
        push    eax                                     ; 2D4E _ 50
        push    dword [ebp-10H]                         ; 2D4F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2D52 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 2D55 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2D58 _ FF. 75, 08
        call    showString                              ; 2D5B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2D60 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2D63 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 2D66 _ 8B. 40, 08
        sub     esp, 12                                 ; 2D69 _ 83. EC, 0C
        push    eax                                     ; 2D6C _ 50
        call    intToHexStr                             ; 2D6D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D72 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 2D75 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 2D78 _ 8B. 45, 20
        movsx   eax, al                                 ; 2D7B _ 0F BE. C0
        sub     esp, 8                                  ; 2D7E _ 83. EC, 08
        push    dword [ebp-28H]                         ; 2D81 _ FF. 75, D8
        push    eax                                     ; 2D84 _ 50
        push    dword [ebp-10H]                         ; 2D85 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 2D88 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 2D8B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2D8E _ FF. 75, 08
        call    showString                              ; 2D91 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2D96 _ 83. C4, 20
        nop                                             ; 2D99 _ 90
        leave                                           ; 2D9A _ C9
        ret                                             ; 2D9B _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 2D9C _ 55
        mov     ebp, esp                                ; 2D9D _ 89. E5
        sub     esp, 24                                 ; 2D9F _ 83. EC, 18
        sub     esp, 12                                 ; 2DA2 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 2DA5 _ FF. 75, 08
        call    sheet_alloc                             ; 2DA8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DAD _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 2DB0 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2DB3 _ A1, 00000000(d)
        sub     esp, 8                                  ; 2DB8 _ 83. EC, 08
        push    10880                                   ; 2DBB _ 68, 00002A80
        push    eax                                     ; 2DC0 _ 50
        call    memman_alloc_4k                         ; 2DC1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DC6 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 2DC9 _ 89. 45, F0
        sub     esp, 12                                 ; 2DCC _ 83. EC, 0C
        push    -1                                      ; 2DCF _ 6A, FF
        push    68                                      ; 2DD1 _ 6A, 44
        push    160                                     ; 2DD3 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 2DD8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2DDB _ FF. 75, F4
        call    sheet_setbuf                            ; 2DDE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2DE3 _ 83. C4, 20
        push    1                                       ; 2DE6 _ 6A, 01
        push    dword [ebp+0CH]                         ; 2DE8 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 2DEB _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2DEE _ FF. 75, 08
        call    make_window8                            ; 2DF1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DF6 _ 83. C4, 10
        sub     esp, 8                                  ; 2DF9 _ 83. EC, 08
        push    7                                       ; 2DFC _ 6A, 07
        push    16                                      ; 2DFE _ 6A, 10
        push    144                                     ; 2E00 _ 68, 00000090
        push    28                                      ; 2E05 _ 6A, 1C
        push    8                                       ; 2E07 _ 6A, 08
        push    dword [ebp-0CH]                         ; 2E09 _ FF. 75, F4
        call    make_textbox8                           ; 2E0C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2E11 _ 83. C4, 20
        push    172                                     ; 2E14 _ 68, 000000AC
        push    260                                     ; 2E19 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 2E1E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2E21 _ FF. 75, 08
        call    sheet_slide                             ; 2E24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E29 _ 83. C4, 10
        sub     esp, 4                                  ; 2E2C _ 83. EC, 04
        push    2                                       ; 2E2F _ 6A, 02
        push    dword [ebp-0CH]                         ; 2E31 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2E34 _ FF. 75, 08
        call    sheet_updown                            ; 2E37 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E3C _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2E3F _ 8B. 45, F4
        leave                                           ; 2E42 _ C9
        ret                                             ; 2E43 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 2E44 _ 55
        mov     ebp, esp                                ; 2E45 _ 89. E5
        push    ebx                                     ; 2E47 _ 53
        sub     esp, 36                                 ; 2E48 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 2E4B _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2E4E _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 2E51 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2E54 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2E57 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2E5A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2E5D _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 2E60 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 2E63 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2E66 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2E69 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E6C _ 8B. 00
        push    0                                       ; 2E6E _ 6A, 00
        push    edx                                     ; 2E70 _ 52
        push    0                                       ; 2E71 _ 6A, 00
        push    0                                       ; 2E73 _ 6A, 00
        push    8                                       ; 2E75 _ 6A, 08
        push    dword [ebp-0CH]                         ; 2E77 _ FF. 75, F4
        push    eax                                     ; 2E7A _ 50
        call    boxfill8                                ; 2E7B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2E80 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 2E83 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 2E86 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2E89 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E8C _ 8B. 00
        push    1                                       ; 2E8E _ 6A, 01
        push    edx                                     ; 2E90 _ 52
        push    1                                       ; 2E91 _ 6A, 01
        push    1                                       ; 2E93 _ 6A, 01
        push    7                                       ; 2E95 _ 6A, 07
        push    dword [ebp-0CH]                         ; 2E97 _ FF. 75, F4
        push    eax                                     ; 2E9A _ 50
        call    boxfill8                                ; 2E9B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2EA0 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2EA3 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2EA6 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2EA9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EAC _ 8B. 00
        push    edx                                     ; 2EAE _ 52
        push    0                                       ; 2EAF _ 6A, 00
        push    0                                       ; 2EB1 _ 6A, 00
        push    0                                       ; 2EB3 _ 6A, 00
        push    8                                       ; 2EB5 _ 6A, 08
        push    dword [ebp-0CH]                         ; 2EB7 _ FF. 75, F4
        push    eax                                     ; 2EBA _ 50
        call    boxfill8                                ; 2EBB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2EC0 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2EC3 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2EC6 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2EC9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2ECC _ 8B. 00
        push    edx                                     ; 2ECE _ 52
        push    1                                       ; 2ECF _ 6A, 01
        push    1                                       ; 2ED1 _ 6A, 01
        push    1                                       ; 2ED3 _ 6A, 01
        push    7                                       ; 2ED5 _ 6A, 07
        push    dword [ebp-0CH]                         ; 2ED7 _ FF. 75, F4
        push    eax                                     ; 2EDA _ 50
        call    boxfill8                                ; 2EDB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2EE0 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2EE3 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 2EE6 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 2EE9 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 2EEC _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 2EEF _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 2EF2 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2EF5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EF8 _ 8B. 00
        push    ebx                                     ; 2EFA _ 53
        push    ecx                                     ; 2EFB _ 51
        push    1                                       ; 2EFC _ 6A, 01
        push    edx                                     ; 2EFE _ 52
        push    15                                      ; 2EFF _ 6A, 0F
        push    dword [ebp-0CH]                         ; 2F01 _ FF. 75, F4
        push    eax                                     ; 2F04 _ 50
        call    boxfill8                                ; 2F05 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2F0A _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2F0D _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 2F10 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2F13 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2F16 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 2F19 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2F1C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2F1F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F22 _ 8B. 00
        push    ebx                                     ; 2F24 _ 53
        push    ecx                                     ; 2F25 _ 51
        push    0                                       ; 2F26 _ 6A, 00
        push    edx                                     ; 2F28 _ 52
        push    0                                       ; 2F29 _ 6A, 00
        push    dword [ebp-0CH]                         ; 2F2B _ FF. 75, F4
        push    eax                                     ; 2F2E _ 50
        call    boxfill8                                ; 2F2F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2F34 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2F37 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 2F3A _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 2F3D _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 2F40 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2F43 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F46 _ 8B. 00
        push    ecx                                     ; 2F48 _ 51
        push    edx                                     ; 2F49 _ 52
        push    2                                       ; 2F4A _ 6A, 02
        push    2                                       ; 2F4C _ 6A, 02
        push    8                                       ; 2F4E _ 6A, 08
        push    dword [ebp-0CH]                         ; 2F50 _ FF. 75, F4
        push    eax                                     ; 2F53 _ 50
        call    boxfill8                                ; 2F54 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2F59 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 2F5C _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 2F5F _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 2F62 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F65 _ 8B. 00
        push    20                                      ; 2F67 _ 6A, 14
        push    edx                                     ; 2F69 _ 52
        push    3                                       ; 2F6A _ 6A, 03
        push    3                                       ; 2F6C _ 6A, 03
        push    12                                      ; 2F6E _ 6A, 0C
        push    dword [ebp-0CH]                         ; 2F70 _ FF. 75, F4
        push    eax                                     ; 2F73 _ 50
        call    boxfill8                                ; 2F74 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2F79 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2F7C _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 2F7F _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 2F82 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 2F85 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 2F88 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 2F8B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2F8E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F91 _ 8B. 00
        push    ebx                                     ; 2F93 _ 53
        push    ecx                                     ; 2F94 _ 51
        push    edx                                     ; 2F95 _ 52
        push    1                                       ; 2F96 _ 6A, 01
        push    15                                      ; 2F98 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 2F9A _ FF. 75, F4
        push    eax                                     ; 2F9D _ 50
        call    boxfill8                                ; 2F9E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2FA3 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 2FA6 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 2FA9 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2FAC _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2FAF _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 2FB2 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2FB5 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2FB8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2FBB _ 8B. 00
        push    ebx                                     ; 2FBD _ 53
        push    ecx                                     ; 2FBE _ 51
        push    edx                                     ; 2FBF _ 52
        push    0                                       ; 2FC0 _ 6A, 00
        push    0                                       ; 2FC2 _ 6A, 00
        push    dword [ebp-0CH]                         ; 2FC4 _ FF. 75, F4
        push    eax                                     ; 2FC7 _ 50
        call    boxfill8                                ; 2FC8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2FCD _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 2FD0 _ 0F BE. 45, E4
        push    eax                                     ; 2FD4 _ 50
        push    dword [ebp+10H]                         ; 2FD5 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 2FD8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2FDB _ FF. 75, 08
        call    make_wtitle8                            ; 2FDE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2FE3 _ 83. C4, 10
        nop                                             ; 2FE6 _ 90
        mov     ebx, dword [ebp-4H]                     ; 2FE7 _ 8B. 5D, FC
        leave                                           ; 2FEA _ C9
        ret                                             ; 2FEB _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 2FEC _ 55
        mov     ebp, esp                                ; 2FED _ 89. E5
        push    ebx                                     ; 2FEF _ 53
        sub     esp, 36                                 ; 2FF0 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 2FF3 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2FF6 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 2FF9 _ 80. 7D, E4, 00
        jz      ?_190                                   ; 2FFD _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 2FFF _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 3003 _ C6. 45, ED, 0C
        jmp     ?_191                                   ; 3007 _ EB, 08

?_190:  mov     byte [ebp-12H], 8                       ; 3009 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 300D _ C6. 45, ED, 0F
?_191:  mov     eax, dword [ebp+0CH]                    ; 3011 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3014 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 3017 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 301A _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 301E _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 3021 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3024 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3027 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 302A _ 8B. 00
        push    20                                      ; 302C _ 6A, 14
        push    ebx                                     ; 302E _ 53
        push    3                                       ; 302F _ 6A, 03
        push    3                                       ; 3031 _ 6A, 03
        push    ecx                                     ; 3033 _ 51
        push    edx                                     ; 3034 _ 52
        push    eax                                     ; 3035 _ 50
        call    boxfill8                                ; 3036 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 303B _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 303E _ 0F BE. 45, EE
        sub     esp, 8                                  ; 3042 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 3045 _ FF. 75, 10
        push    eax                                     ; 3048 _ 50
        push    4                                       ; 3049 _ 6A, 04
        push    24                                      ; 304B _ 6A, 18
        push    dword [ebp+0CH]                         ; 304D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3050 _ FF. 75, 08
        call    showString                              ; 3053 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3058 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 305B _ C7. 45, F0, 00000000
        jmp     ?_199                                   ; 3062 _ E9, 00000083

?_192:  mov     dword [ebp-0CH], 0                      ; 3067 _ C7. 45, F4, 00000000
        jmp     ?_198                                   ; 306E _ EB, 70

?_193:  mov     eax, dword [ebp-10H]                    ; 3070 _ 8B. 45, F0
        shl     eax, 4                                  ; 3073 _ C1. E0, 04
        mov     edx, eax                                ; 3076 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3078 _ 8B. 45, F4
        add     eax, edx                                ; 307B _ 01. D0
        add     eax, closebtn.2339                      ; 307D _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 3082 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3085 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3088 _ 80. 7D, EF, 40
        jnz     ?_194                                   ; 308C _ 75, 06
        mov     byte [ebp-11H], 0                       ; 308E _ C6. 45, EF, 00
        jmp     ?_197                                   ; 3092 _ EB, 1C

?_194:  cmp     byte [ebp-11H], 36                      ; 3094 _ 80. 7D, EF, 24
        jnz     ?_195                                   ; 3098 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 309A _ C6. 45, EF, 0F
        jmp     ?_197                                   ; 309E _ EB, 10

?_195:  cmp     byte [ebp-11H], 81                      ; 30A0 _ 80. 7D, EF, 51
        jnz     ?_196                                   ; 30A4 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 30A6 _ C6. 45, EF, 08
        jmp     ?_197                                   ; 30AA _ EB, 04

?_196:  mov     byte [ebp-11H], 7                       ; 30AC _ C6. 45, EF, 07
?_197:  mov     eax, dword [ebp+0CH]                    ; 30B0 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 30B3 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 30B5 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 30B8 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 30BB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 30BE _ 8B. 40, 04
        imul    ecx, eax                                ; 30C1 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 30C4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 30C7 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 30CA _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 30CD _ 8B. 45, F4
        add     eax, ebx                                ; 30D0 _ 01. D8
        add     eax, ecx                                ; 30D2 _ 01. C8
        add     edx, eax                                ; 30D4 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 30D6 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 30DA _ 88. 02
        add     dword [ebp-0CH], 1                      ; 30DC _ 83. 45, F4, 01
?_198:  cmp     dword [ebp-0CH], 15                     ; 30E0 _ 83. 7D, F4, 0F
        jle     ?_193                                   ; 30E4 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 30E6 _ 83. 45, F0, 01
?_199:  cmp     dword [ebp-10H], 13                     ; 30EA _ 83. 7D, F0, 0D
        jle     ?_192                                   ; 30EE _ 0F 8E, FFFFFF73
        nop                                             ; 30F4 _ 90
        mov     ebx, dword [ebp-4H]                     ; 30F5 _ 8B. 5D, FC
        leave                                           ; 30F8 _ C9
        ret                                             ; 30F9 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 30FA _ 55
        mov     ebp, esp                                ; 30FB _ 89. E5
        push    edi                                     ; 30FD _ 57
        push    esi                                     ; 30FE _ 56
        push    ebx                                     ; 30FF _ 53
        sub     esp, 16                                 ; 3100 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 3103 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 3106 _ 8B. 45, 14
        add     eax, edx                                ; 3109 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 310B _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 310E _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 3111 _ 8B. 45, 18
        add     eax, edx                                ; 3114 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3116 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3119 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 311C _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 311F _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3122 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3125 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3128 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 312B _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 312E _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3131 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3134 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3137 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 313A _ 8B. 00
        push    edi                                     ; 313C _ 57
        push    esi                                     ; 313D _ 56
        push    ebx                                     ; 313E _ 53
        push    ecx                                     ; 313F _ 51
        push    15                                      ; 3140 _ 6A, 0F
        push    edx                                     ; 3142 _ 52
        push    eax                                     ; 3143 _ 50
        call    boxfill8                                ; 3144 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3149 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 314C _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 314F _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3152 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3155 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3158 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 315B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 315E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3161 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3164 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3167 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 316A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 316D _ 8B. 00
        push    edi                                     ; 316F _ 57
        push    esi                                     ; 3170 _ 56
        push    ebx                                     ; 3171 _ 53
        push    ecx                                     ; 3172 _ 51
        push    15                                      ; 3173 _ 6A, 0F
        push    edx                                     ; 3175 _ 52
        push    eax                                     ; 3176 _ 50
        call    boxfill8                                ; 3177 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 317C _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 317F _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3182 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3185 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3188 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 318B _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 318E _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3191 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3194 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3197 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 319A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 319D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31A0 _ 8B. 00
        push    edi                                     ; 31A2 _ 57
        push    esi                                     ; 31A3 _ 56
        push    ebx                                     ; 31A4 _ 53
        push    ecx                                     ; 31A5 _ 51
        push    7                                       ; 31A6 _ 6A, 07
        push    edx                                     ; 31A8 _ 52
        push    eax                                     ; 31A9 _ 50
        call    boxfill8                                ; 31AA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 31AF _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 31B2 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 31B5 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 31B8 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 31BB _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 31BE _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 31C1 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 31C4 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 31C7 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 31CA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 31CD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 31D0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31D3 _ 8B. 00
        push    edi                                     ; 31D5 _ 57
        push    esi                                     ; 31D6 _ 56
        push    ebx                                     ; 31D7 _ 53
        push    ecx                                     ; 31D8 _ 51
        push    7                                       ; 31D9 _ 6A, 07
        push    edx                                     ; 31DB _ 52
        push    eax                                     ; 31DC _ 50
        call    boxfill8                                ; 31DD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 31E2 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 31E5 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 31E8 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 31EB _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 31EE _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 31F1 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 31F4 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 31F7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 31FA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 31FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3200 _ 8B. 00
        push    esi                                     ; 3202 _ 56
        push    dword [ebp-10H]                         ; 3203 _ FF. 75, F0
        push    ebx                                     ; 3206 _ 53
        push    ecx                                     ; 3207 _ 51
        push    0                                       ; 3208 _ 6A, 00
        push    edx                                     ; 320A _ 52
        push    eax                                     ; 320B _ 50
        call    boxfill8                                ; 320C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3211 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 3214 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 3217 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 321A _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 321D _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3220 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3223 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3226 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3229 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 322C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 322F _ 8B. 00
        push    dword [ebp-14H]                         ; 3231 _ FF. 75, EC
        push    esi                                     ; 3234 _ 56
        push    ebx                                     ; 3235 _ 53
        push    ecx                                     ; 3236 _ 51
        push    0                                       ; 3237 _ 6A, 00
        push    edx                                     ; 3239 _ 52
        push    eax                                     ; 323A _ 50
        call    boxfill8                                ; 323B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3240 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3243 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3246 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3249 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 324C _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 324F _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3252 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3255 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3258 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 325B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 325E _ 8B. 00
        push    esi                                     ; 3260 _ 56
        push    dword [ebp-10H]                         ; 3261 _ FF. 75, F0
        push    ebx                                     ; 3264 _ 53
        push    ecx                                     ; 3265 _ 51
        push    8                                       ; 3266 _ 6A, 08
        push    edx                                     ; 3268 _ 52
        push    eax                                     ; 3269 _ 50
        call    boxfill8                                ; 326A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 326F _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3272 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3275 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3278 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 327B _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 327E _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3281 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3284 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3287 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 328A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 328D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3290 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3293 _ 8B. 00
        push    edi                                     ; 3295 _ 57
        push    esi                                     ; 3296 _ 56
        push    ebx                                     ; 3297 _ 53
        push    ecx                                     ; 3298 _ 51
        push    8                                       ; 3299 _ 6A, 08
        push    edx                                     ; 329B _ 52
        push    eax                                     ; 329C _ 50
        call    boxfill8                                ; 329D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 32A2 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 32A5 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 32A8 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 32AB _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 32AE _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 32B1 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 32B4 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 32B7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 32BA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 32BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 32C0 _ 8B. 00
        push    dword [ebp-14H]                         ; 32C2 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 32C5 _ FF. 75, F0
        push    esi                                     ; 32C8 _ 56
        push    ebx                                     ; 32C9 _ 53
        push    ecx                                     ; 32CA _ 51
        push    edx                                     ; 32CB _ 52
        push    eax                                     ; 32CC _ 50
        call    boxfill8                                ; 32CD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 32D2 _ 83. C4, 1C
        nop                                             ; 32D5 _ 90
        lea     esp, [ebp-0CH]                          ; 32D6 _ 8D. 65, F4
        pop     ebx                                     ; 32D9 _ 5B
        pop     esi                                     ; 32DA _ 5E
        pop     edi                                     ; 32DB _ 5F
        pop     ebp                                     ; 32DC _ 5D
        ret                                             ; 32DD _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 32DE _ 55
        mov     ebp, esp                                ; 32DF _ 89. E5
        sub     esp, 40                                 ; 32E1 _ 83. EC, 28
        mov     dword [ebp-0CH], 78848                  ; 32E4 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 32EB _ A1, 00000000(d)
        sub     esp, 8                                  ; 32F0 _ 83. EC, 08
        push    13                                      ; 32F3 _ 6A, 0D
        push    eax                                     ; 32F5 _ 50
        call    memman_alloc                            ; 32F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 32FB _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 32FE _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 3301 _ 8B. 45, E4
        add     eax, 12                                 ; 3304 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 3307 _ C6. 00, 00
        jmp     ?_210                                   ; 330A _ E9, 0000011F

?_200:  mov     dword [ebp-10H], 0                      ; 330F _ C7. 45, F0, 00000000
        jmp     ?_202                                   ; 3316 _ EB, 28

?_201:  mov     edx, dword [ebp-0CH]                    ; 3318 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 331B _ 8B. 45, F0
        add     eax, edx                                ; 331E _ 01. D0
        movzx   eax, byte [eax]                         ; 3320 _ 0F B6. 00
        test    al, al                                  ; 3323 _ 84. C0
        jz      ?_203                                   ; 3325 _ 74, 21
        mov     edx, dword [ebp-10H]                    ; 3327 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 332A _ 8B. 45, E4
        add     eax, edx                                ; 332D _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 332F _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 3332 _ 8B. 55, F0
        add     edx, ecx                                ; 3335 _ 01. CA
        movzx   edx, byte [edx]                         ; 3337 _ 0F B6. 12
        mov     byte [eax], dl                          ; 333A _ 88. 10
        add     dword [ebp-10H], 1                      ; 333C _ 83. 45, F0, 01
?_202:  cmp     dword [ebp-10H], 7                      ; 3340 _ 83. 7D, F0, 07
        jle     ?_201                                   ; 3344 _ 7E, D2
        jmp     ?_204                                   ; 3346 _ EB, 01

?_203:  nop                                             ; 3348 _ 90
?_204:  mov     dword [ebp-14H], 0                      ; 3349 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 3350 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3353 _ 8B. 45, E4
        add     eax, edx                                ; 3356 _ 01. D0
        mov     byte [eax], 46                          ; 3358 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 335B _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 335F _ C7. 45, EC, 00000000
        jmp     ?_206                                   ; 3366 _ EB, 20

?_205:  mov     edx, dword [ebp-10H]                    ; 3368 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 336B _ 8B. 45, E4
        add     eax, edx                                ; 336E _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 3370 _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 3373 _ 8B. 55, EC
        add     edx, ecx                                ; 3376 _ 01. CA
        add     edx, 8                                  ; 3378 _ 83. C2, 08
        movzx   edx, byte [edx]                         ; 337B _ 0F B6. 12
        mov     byte [eax], dl                          ; 337E _ 88. 10
        add     dword [ebp-10H], 1                      ; 3380 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3384 _ 83. 45, EC, 01
?_206:  cmp     dword [ebp-14H], 2                      ; 3388 _ 83. 7D, EC, 02
        jle     ?_205                                   ; 338C _ 7E, DA
        sub     esp, 8                                  ; 338E _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 3391 _ FF. 75, E4
        push    dword [ebp+8H]                          ; 3394 _ FF. 75, 08
        call    strcmp                                  ; 3397 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 339C _ 83. C4, 10
        cmp     eax, 1                                  ; 339F _ 83. F8, 01
        jne     ?_209                                   ; 33A2 _ 0F 85, 00000082
        mov     eax, dword [ebp-0CH]                    ; 33A8 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 33AB _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 33AE _ A1, 00000000(d)
        sub     esp, 8                                  ; 33B3 _ 83. EC, 08
        push    edx                                     ; 33B6 _ 52
        push    eax                                     ; 33B7 _ 50
        call    memman_alloc_4k                         ; 33B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33BD _ 83. C4, 10
        mov     edx, eax                                ; 33C0 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 33C2 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 33C5 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 33C7 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 33CA _ 8B. 40, 1C
        mov     edx, eax                                ; 33CD _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 33CF _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 33D2 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 33D5 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 33DC _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 33DF _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 33E3 _ 0F B7. C0
        shl     eax, 9                                  ; 33E6 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 33E9 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 33EC _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 33EF _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 33F2 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 33F5 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 33FC _ C7. 45, E8, 00000000
        jmp     ?_208                                   ; 3403 _ EB, 1B

?_207:  mov     eax, dword [ebp+0CH]                    ; 3405 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3408 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 340A _ 8B. 45, E8
        add     eax, edx                                ; 340D _ 01. D0
        mov     ecx, dword [ebp-18H]                    ; 340F _ 8B. 4D, E8
        mov     edx, dword [ebp-20H]                    ; 3412 _ 8B. 55, E0
        add     edx, ecx                                ; 3415 _ 01. CA
        movzx   edx, byte [edx]                         ; 3417 _ 0F B6. 12
        mov     byte [eax], dl                          ; 341A _ 88. 10
        add     dword [ebp-18H], 1                      ; 341C _ 83. 45, E8, 01
?_208:  mov     eax, dword [ebp-18H]                    ; 3420 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 3423 _ 3B. 45, DC
        jl      ?_207                                   ; 3426 _ 7C, DD
        jmp     ?_211                                   ; 3428 _ EB, 12

?_209:  add     dword [ebp-0CH], 32                     ; 342A _ 83. 45, F4, 20
?_210:  mov     eax, dword [ebp-0CH]                    ; 342E _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 3431 _ 0F B6. 00
        test    al, al                                  ; 3434 _ 84. C0
        jne     ?_200                                   ; 3436 _ 0F 85, FFFFFED3
?_211:  mov     edx, dword [ebp-1CH]                    ; 343C _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 343F _ A1, 00000000(d)
        sub     esp, 4                                  ; 3444 _ 83. EC, 04
        push    13                                      ; 3447 _ 6A, 0D
        push    edx                                     ; 3449 _ 52
        push    eax                                     ; 344A _ 50
        call    memman_free                             ; 344B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3450 _ 83. C4, 10
        nop                                             ; 3453 _ 90
        leave                                           ; 3454 _ C9
        ret                                             ; 3455 _ C3
; file_loadfile End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 3456 _ 55
        mov     ebp, esp                                ; 3457 _ 89. E5
        sub     esp, 24                                 ; 3459 _ 83. EC, 18
        mov     dword [?_368], 8                        ; 345C _ C7. 05, 0000000C(d), 00000008
        sub     esp, 12                                 ; 3466 _ 83. EC, 0C
        push    ?_361                                   ; 3469 _ 68, 00000077(d)
        call    cons_putstr                             ; 346E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3473 _ 83. C4, 10
        mov     dword [?_368], 8                        ; 3476 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_369]                      ; 3480 _ A1, 00000010(d)
        add     eax, 16                                 ; 3485 _ 83. C0, 10
        mov     dword [?_369], eax                      ; 3488 _ A3, 00000010(d)
        sub     esp, 12                                 ; 348D _ 83. EC, 0C
        push    ?_362                                   ; 3490 _ 68, 0000007F(d)
        call    cons_putstr                             ; 3495 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 349A _ 83. C4, 10
        mov     eax, dword [?_369]                      ; 349D _ A1, 00000010(d)
        add     eax, 16                                 ; 34A2 _ 83. C0, 10
        mov     dword [?_369], eax                      ; 34A5 _ A3, 00000010(d)
        mov     dword [?_368], 8                        ; 34AA _ C7. 05, 0000000C(d), 00000008
        call    task_now                                ; 34B4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 34B9 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 34BC _ 8B. 45, F4
        add     eax, 48                                 ; 34BF _ 83. C0, 30
        leave                                           ; 34C2 _ C9
        ret                                             ; 34C3 _ C3
; intHandlerForException End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 34C4 _ 55
        mov     ebp, esp                                ; 34C5 _ 89. E5
        sub     esp, 24                                 ; 34C7 _ 83. EC, 18
        mov     dword [?_368], 8                        ; 34CA _ C7. 05, 0000000C(d), 00000008
        sub     esp, 12                                 ; 34D4 _ 83. EC, 0C
        push    ?_363                                   ; 34D7 _ 68, 0000009B(d)
        call    cons_putstr                             ; 34DC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 34E1 _ 83. C4, 10
        mov     dword [?_368], 8                        ; 34E4 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_369]                      ; 34EE _ A1, 00000010(d)
        add     eax, 16                                 ; 34F3 _ 83. C0, 10
        mov     dword [?_369], eax                      ; 34F6 _ A3, 00000010(d)
        sub     esp, 12                                 ; 34FB _ 83. EC, 0C
        push    ?_364                                   ; 34FE _ 68, 000000A2(d)
        call    cons_putstr                             ; 3503 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3508 _ 83. C4, 10
        mov     dword [?_368], 8                        ; 350B _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_369]                      ; 3515 _ A1, 00000010(d)
        add     eax, 16                                 ; 351A _ 83. C0, 10
        mov     dword [?_369], eax                      ; 351D _ A3, 00000010(d)
        mov     eax, dword [ebp+8H]                     ; 3522 _ 8B. 45, 08
        add     eax, 44                                 ; 3525 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3528 _ 8B. 00
        sub     esp, 12                                 ; 352A _ 83. EC, 0C
        push    eax                                     ; 352D _ 50
        call    intToHexStr                             ; 352E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3533 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 3536 _ 89. 45, F4
        sub     esp, 12                                 ; 3539 _ 83. EC, 0C
        push    ?_365                                   ; 353C _ 68, 000000B2(d)
        call    cons_putstr                             ; 3541 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3546 _ 83. C4, 10
        sub     esp, 12                                 ; 3549 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 354C _ FF. 75, F4
        call    cons_putstr                             ; 354F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3554 _ 83. C4, 10
        mov     dword [?_368], 8                        ; 3557 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_369]                      ; 3561 _ A1, 00000010(d)
        add     eax, 16                                 ; 3566 _ 83. C0, 10
        mov     dword [?_369], eax                      ; 3569 _ A3, 00000010(d)
        call    task_now                                ; 356E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3573 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3576 _ 8B. 45, F0
        add     eax, 48                                 ; 3579 _ 83. C0, 30
        leave                                           ; 357C _ C9
        ret                                             ; 357D _ C3
; intHandlerForStackOverFlow End of function

memman_init:; Function begin
        push    ebp                                     ; 357E _ 55
        mov     ebp, esp                                ; 357F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3581 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 3584 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 358A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 358D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3594 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3597 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 359E _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 35A1 _ C7. 40, 0C, 00000000
        nop                                             ; 35A8 _ 90
        pop     ebp                                     ; 35A9 _ 5D
        ret                                             ; 35AA _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 35AB _ 55
        mov     ebp, esp                                ; 35AC _ 89. E5
        sub     esp, 16                                 ; 35AE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 35B1 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 35B8 _ C7. 45, F8, 00000000
        jmp     ?_213                                   ; 35BF _ EB, 14

?_212:  mov     eax, dword [ebp+8H]                     ; 35C1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35C4 _ 8B. 55, F8
        add     edx, 2                                  ; 35C7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 35CA _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 35CE _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 35D1 _ 83. 45, F8, 01
?_213:  mov     eax, dword [ebp+8H]                     ; 35D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 35D8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 35DA _ 3B. 45, F8
        ja      ?_212                                   ; 35DD _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 35DF _ 8B. 45, FC
        leave                                           ; 35E2 _ C9
        ret                                             ; 35E3 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 35E4 _ 55
        mov     ebp, esp                                ; 35E5 _ 89. E5
        sub     esp, 16                                 ; 35E7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 35EA _ C7. 45, F8, 00000000
        jmp     ?_217                                   ; 35F1 _ E9, 00000085

?_214:  mov     eax, dword [ebp+8H]                     ; 35F6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35F9 _ 8B. 55, F8
        add     edx, 2                                  ; 35FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 35FF _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3603 _ 3B. 45, 0C
        jc      ?_216                                   ; 3606 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3608 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 360B _ 8B. 55, F8
        add     edx, 2                                  ; 360E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3611 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3614 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3617 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 361A _ 8B. 55, F8
        add     edx, 2                                  ; 361D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3620 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3623 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3626 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3629 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 362C _ 8B. 55, F8
        add     edx, 2                                  ; 362F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 3632 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3635 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3638 _ 8B. 55, F8
        add     edx, 2                                  ; 363B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 363E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 3642 _ 2B. 45, 0C
        mov     edx, eax                                ; 3645 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3647 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 364A _ 8B. 4D, F8
        add     ecx, 2                                  ; 364D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 3650 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3654 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3657 _ 8B. 55, F8
        add     edx, 2                                  ; 365A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 365D _ 8B. 44 D0, 04
        test    eax, eax                                ; 3661 _ 85. C0
        jnz     ?_215                                   ; 3663 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3665 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3668 _ 8B. 00
        lea     edx, [eax-1H]                           ; 366A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 366D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3670 _ 89. 10
?_215:  mov     eax, dword [ebp-4H]                     ; 3672 _ 8B. 45, FC
        jmp     ?_218                                   ; 3675 _ EB, 17

?_216:  add     dword [ebp-8H], 1                       ; 3677 _ 83. 45, F8, 01
?_217:  mov     eax, dword [ebp+8H]                     ; 367B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 367E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3680 _ 3B. 45, F8
        ja      ?_214                                   ; 3683 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3689 _ B8, 00000000
?_218:  leave                                           ; 368E _ C9
        ret                                             ; 368F _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3690 _ 55
        mov     ebp, esp                                ; 3691 _ 89. E5
        push    ebx                                     ; 3693 _ 53
        sub     esp, 16                                 ; 3694 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3697 _ C7. 45, F4, 00000000
        jmp     ?_220                                   ; 369E _ EB, 15

?_219:  mov     eax, dword [ebp+8H]                     ; 36A0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 36A3 _ 8B. 55, F4
        add     edx, 2                                  ; 36A6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 36A9 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 36AC _ 3B. 45, 0C
        ja      ?_221                                   ; 36AF _ 77, 10
        add     dword [ebp-0CH], 1                      ; 36B1 _ 83. 45, F4, 01
?_220:  mov     eax, dword [ebp+8H]                     ; 36B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36B8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 36BA _ 3B. 45, F4
        jg      ?_219                                   ; 36BD _ 7F, E1
        jmp     ?_222                                   ; 36BF _ EB, 01

?_221:  nop                                             ; 36C1 _ 90
?_222:  cmp     dword [ebp-0CH], 0                      ; 36C2 _ 83. 7D, F4, 00
        jle     ?_224                                   ; 36C6 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 36CC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 36CF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 36D2 _ 8B. 45, 08
        add     edx, 2                                  ; 36D5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 36D8 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 36DB _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 36DE _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 36E1 _ 8B. 45, 08
        add     ecx, 2                                  ; 36E4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 36E7 _ 8B. 44 C8, 04
        add     eax, edx                                ; 36EB _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 36ED _ 3B. 45, 0C
        jne     ?_224                                   ; 36F0 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 36F6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 36F9 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 36FC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 36FF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3702 _ 8B. 45, 08
        add     edx, 2                                  ; 3705 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3708 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 370C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 370F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3712 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3715 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3718 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 371C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 371F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3721 _ 3B. 45, F4
        jle     ?_223                                   ; 3724 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 3726 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 3729 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 372C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 372F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3732 _ 8B. 55, F4
        add     edx, 2                                  ; 3735 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3738 _ 8B. 04 D0
        cmp     ecx, eax                                ; 373B _ 39. C1
        jnz     ?_223                                   ; 373D _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 373F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3742 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3745 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3748 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 374B _ 8B. 45, 08
        add     edx, 2                                  ; 374E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3751 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3755 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3758 _ 8B. 4D, F4
        add     ecx, 2                                  ; 375B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 375E _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3762 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3765 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3768 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 376B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 376F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3772 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3774 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3777 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 377A _ 89. 10
?_223:  mov     eax, 0                                  ; 377C _ B8, 00000000
        jmp     ?_230                                   ; 3781 _ E9, 0000011C

?_224:  mov     eax, dword [ebp+8H]                     ; 3786 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3789 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 378B _ 3B. 45, F4
        jle     ?_225                                   ; 378E _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 3790 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 3793 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3796 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3799 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 379C _ 8B. 55, F4
        add     edx, 2                                  ; 379F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 37A2 _ 8B. 04 D0
        cmp     ecx, eax                                ; 37A5 _ 39. C1
        jnz     ?_225                                   ; 37A7 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 37A9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37AC _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 37AF _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 37B2 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 37B5 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 37B8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37BB _ 8B. 55, F4
        add     edx, 2                                  ; 37BE _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 37C1 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 37C5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 37C8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 37CB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37CE _ 8B. 55, F4
        add     edx, 2                                  ; 37D1 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 37D4 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 37D8 _ B8, 00000000
        jmp     ?_230                                   ; 37DD _ E9, 000000C0

?_225:  mov     eax, dword [ebp+8H]                     ; 37E2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37E5 _ 8B. 00
        cmp     eax, 4095                               ; 37E7 _ 3D, 00000FFF
        jg      ?_229                                   ; 37EC _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 37F2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37F5 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 37F7 _ 89. 45, F8
        jmp     ?_227                                   ; 37FA _ EB, 28

?_226:  mov     eax, dword [ebp-8H]                     ; 37FC _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 37FF _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3802 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3805 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3808 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 380B _ 8B. 45, 08
        add     edx, 2                                  ; 380E _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3811 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3814 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3816 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3819 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 381C _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3820 _ 83. 6D, F8, 01
?_227:  mov     eax, dword [ebp-8H]                     ; 3824 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3827 _ 3B. 45, F4
        jg      ?_226                                   ; 382A _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 382C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 382F _ 8B. 00
        lea     edx, [eax+1H]                           ; 3831 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3834 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3837 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3839 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 383C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 383F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3842 _ 8B. 00
        cmp     edx, eax                                ; 3844 _ 39. C2
        jge     ?_228                                   ; 3846 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3848 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 384B _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 384D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3850 _ 89. 50, 04
?_228:  mov     eax, dword [ebp+8H]                     ; 3853 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3856 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3859 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 385C _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 385F _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3862 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3865 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3868 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 386B _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 386E _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3872 _ B8, 00000000
        jmp     ?_230                                   ; 3877 _ EB, 29

?_229:  mov     eax, dword [ebp+8H]                     ; 3879 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 387C _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 387F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3882 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3885 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3888 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 388B _ 8B. 40, 08
        mov     edx, eax                                ; 388E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3890 _ 8B. 45, 10
        add     eax, edx                                ; 3893 _ 01. D0
        mov     edx, eax                                ; 3895 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3897 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 389A _ 89. 50, 08
        mov     eax, 4294967295                         ; 389D _ B8, FFFFFFFF
?_230:  add     esp, 16                                 ; 38A2 _ 83. C4, 10
        pop     ebx                                     ; 38A5 _ 5B
        pop     ebp                                     ; 38A6 _ 5D
        ret                                             ; 38A7 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 38A8 _ 55
        mov     ebp, esp                                ; 38A9 _ 89. E5
        sub     esp, 16                                 ; 38AB _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 38AE _ 8B. 45, 0C
        add     eax, 4095                               ; 38B1 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 38B6 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 38BB _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 38BE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 38C1 _ FF. 75, 08
        call    memman_alloc                            ; 38C4 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 38C9 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 38CC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 38CF _ 8B. 45, FC
        leave                                           ; 38D2 _ C9
        ret                                             ; 38D3 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 38D4 _ 55
        mov     ebp, esp                                ; 38D5 _ 89. E5
        sub     esp, 16                                 ; 38D7 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 38DA _ 8B. 45, 10
        add     eax, 4095                               ; 38DD _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 38E2 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 38E7 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 38EA _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 38ED _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 38F0 _ FF. 75, 08
        call    memman_free                             ; 38F3 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 38F8 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 38FB _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 38FE _ 8B. 45, FC
        leave                                           ; 3901 _ C9
        ret                                             ; 3902 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 3903 _ 55
        mov     ebp, esp                                ; 3904 _ 89. E5
        sub     esp, 24                                 ; 3906 _ 83. EC, 18
        sub     esp, 8                                  ; 3909 _ 83. EC, 08
        push    9232                                    ; 390C _ 68, 00002410
        push    dword [ebp+8H]                          ; 3911 _ FF. 75, 08
        call    memman_alloc_4k                         ; 3914 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3919 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 391C _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 391F _ 83. 7D, F4, 00
        jnz     ?_231                                   ; 3923 _ 75, 0A
        mov     eax, 0                                  ; 3925 _ B8, 00000000
        jmp     ?_235                                   ; 392A _ E9, 000000A0

?_231:  mov     eax, dword [ebp+10H]                    ; 392F _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3932 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 3936 _ 83. EC, 08
        push    eax                                     ; 3939 _ 50
        push    dword [ebp+8H]                          ; 393A _ FF. 75, 08
        call    memman_alloc_4k                         ; 393D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3942 _ 83. C4, 10
        mov     edx, eax                                ; 3945 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3947 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 394A _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 394D _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3950 _ 8B. 40, 04
        test    eax, eax                                ; 3953 _ 85. C0
        jnz     ?_232                                   ; 3955 _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 3957 _ 8B. 45, F4
        sub     esp, 4                                  ; 395A _ 83. EC, 04
        push    9232                                    ; 395D _ 68, 00002410
        push    eax                                     ; 3962 _ 50
        push    dword [ebp+8H]                          ; 3963 _ FF. 75, 08
        call    memman_free_4k                          ; 3966 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 396B _ 83. C4, 10
        mov     eax, 0                                  ; 396E _ B8, 00000000
        jmp     ?_235                                   ; 3973 _ EB, 5A

?_232:  mov     eax, dword [ebp-0CH]                    ; 3975 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3978 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 397B _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 397D _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3980 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3983 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3986 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3989 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 398C _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 398F _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 3992 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3999 _ C7. 45, F0, 00000000
        jmp     ?_234                                   ; 39A0 _ EB, 21

?_233:  mov     ecx, dword [ebp-0CH]                    ; 39A2 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 39A5 _ 8B. 55, F0
        mov     eax, edx                                ; 39A8 _ 89. D0
        shl     eax, 3                                  ; 39AA _ C1. E0, 03
        add     eax, edx                                ; 39AD _ 01. D0
        shl     eax, 2                                  ; 39AF _ C1. E0, 02
        add     eax, ecx                                ; 39B2 _ 01. C8
        add     eax, 1072                               ; 39B4 _ 05, 00000430
        mov     dword [eax], 0                          ; 39B9 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 39BF _ 83. 45, F0, 01
?_234:  cmp     dword [ebp-10H], 255                    ; 39C3 _ 81. 7D, F0, 000000FF
        jle     ?_233                                   ; 39CA _ 7E, D6
        mov     eax, dword [ebp-0CH]                    ; 39CC _ 8B. 45, F4
?_235:  leave                                           ; 39CF _ C9
        ret                                             ; 39D0 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 39D1 _ 55
        mov     ebp, esp                                ; 39D2 _ 89. E5
        sub     esp, 24                                 ; 39D4 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 39D7 _ C7. 45, F0, 00000000
        jmp     ?_238                                   ; 39DE _ EB, 75

?_236:  mov     ecx, dword [ebp+8H]                     ; 39E0 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 39E3 _ 8B. 55, F0
        mov     eax, edx                                ; 39E6 _ 89. D0
        shl     eax, 3                                  ; 39E8 _ C1. E0, 03
        add     eax, edx                                ; 39EB _ 01. D0
        shl     eax, 2                                  ; 39ED _ C1. E0, 02
        add     eax, ecx                                ; 39F0 _ 01. C8
        add     eax, 1072                               ; 39F2 _ 05, 00000430
        mov     eax, dword [eax]                        ; 39F7 _ 8B. 00
        test    eax, eax                                ; 39F9 _ 85. C0
        jnz     ?_237                                   ; 39FB _ 75, 54
        mov     edx, dword [ebp-10H]                    ; 39FD _ 8B. 55, F0
        mov     eax, edx                                ; 3A00 _ 89. D0
        shl     eax, 3                                  ; 3A02 _ C1. E0, 03
        add     eax, edx                                ; 3A05 _ 01. D0
        shl     eax, 2                                  ; 3A07 _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 3A0A _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3A10 _ 8B. 45, 08
        add     eax, edx                                ; 3A13 _ 01. D0
        add     eax, 4                                  ; 3A15 _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 3A18 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3A1B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3A1E _ 8B. 55, F0
        lea     ecx, [edx+4H]                           ; 3A21 _ 8D. 4A, 04
        mov     edx, dword [ebp-0CH]                    ; 3A24 _ 8B. 55, F4
        mov     dword [eax+ecx*4+4H], edx               ; 3A27 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 3A2B _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 3A2E _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3A35 _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 3A38 _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 3A3F _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3A44 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3A46 _ 8B. 45, F4
        mov     dword [eax+20H], edx                    ; 3A49 _ 89. 50, 20
        mov     eax, dword [ebp-0CH]                    ; 3A4C _ 8B. 45, F4
        jmp     ?_239                                   ; 3A4F _ EB, 12

?_237:  add     dword [ebp-10H], 1                      ; 3A51 _ 83. 45, F0, 01
?_238:  cmp     dword [ebp-10H], 255                    ; 3A55 _ 81. 7D, F0, 000000FF
        jle     ?_236                                   ; 3A5C _ 7E, 82
        mov     eax, 0                                  ; 3A5E _ B8, 00000000
?_239:  leave                                           ; 3A63 _ C9
        ret                                             ; 3A64 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3A65 _ 55
        mov     ebp, esp                                ; 3A66 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3A68 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3A6B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3A6E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3A70 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3A73 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3A76 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3A79 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3A7C _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3A7F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3A82 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3A85 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3A88 _ 89. 50, 14
        nop                                             ; 3A8B _ 90
        pop     ebp                                     ; 3A8C _ 5D
        ret                                             ; 3A8D _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3A8E _ 55
        mov     ebp, esp                                ; 3A8F _ 89. E5
        push    esi                                     ; 3A91 _ 56
        push    ebx                                     ; 3A92 _ 53
        sub     esp, 16                                 ; 3A93 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 3A96 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3A99 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3A9C _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3A9F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3AA2 _ 8B. 40, 10
        add     eax, 1                                  ; 3AA5 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3AA8 _ 3B. 45, 10
        jge     ?_240                                   ; 3AAB _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3AAD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3AB0 _ 8B. 40, 10
        add     eax, 1                                  ; 3AB3 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3AB6 _ 89. 45, 10
?_240:  cmp     dword [ebp+10H], -1                     ; 3AB9 _ 83. 7D, 10, FF
        jge     ?_241                                   ; 3ABD _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3ABF _ C7. 45, 10, FFFFFFFF
?_241:  mov     eax, dword [ebp+0CH]                    ; 3AC6 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3AC9 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3ACC _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3ACF _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3AD2 _ 3B. 45, 10
        jle     ?_248                                   ; 3AD5 _ 0F 8E, 000001D5
        cmp     dword [ebp+10H], 0                      ; 3ADB _ 83. 7D, 10, 00
        js      ?_244                                   ; 3ADF _ 0F 88, 000000E2
        mov     eax, dword [ebp-0CH]                    ; 3AE5 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3AE8 _ 89. 45, F0
        jmp     ?_243                                   ; 3AEB _ EB, 34

?_242:  mov     eax, dword [ebp-10H]                    ; 3AED _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3AF0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3AF3 _ 8B. 45, 08
        add     edx, 4                                  ; 3AF6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3AF9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3AFD _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3B00 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3B03 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3B06 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3B0A _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3B0D _ 8B. 55, F0
        add     edx, 4                                  ; 3B10 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3B13 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3B17 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3B1A _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3B1D _ 83. 6D, F0, 01
?_243:  mov     eax, dword [ebp-10H]                    ; 3B21 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3B24 _ 3B. 45, 10
        jg      ?_242                                   ; 3B27 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3B29 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3B2C _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3B2F _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3B32 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3B35 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3B39 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3B3C _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3B3F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B42 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B45 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B48 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3B4B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B4E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3B51 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B54 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B57 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3B5A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3B5D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B60 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B63 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3B66 _ 8B. 40, 0C
        sub     esp, 8                                  ; 3B69 _ 83. EC, 08
        push    esi                                     ; 3B6C _ 56
        push    ebx                                     ; 3B6D _ 53
        push    ecx                                     ; 3B6E _ 51
        push    edx                                     ; 3B6F _ 52
        push    eax                                     ; 3B70 _ 50
        push    dword [ebp+8H]                          ; 3B71 _ FF. 75, 08
        call    sheet_refreshmap                        ; 3B74 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3B79 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3B7C _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3B7F _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3B82 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B85 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B88 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B8B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3B8E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B91 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3B94 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B97 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B9A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3B9D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3BA0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3BA3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3BA6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3BA9 _ 8B. 40, 0C
        sub     esp, 4                                  ; 3BAC _ 83. EC, 04
        push    dword [ebp-0CH]                         ; 3BAF _ FF. 75, F4
        push    esi                                     ; 3BB2 _ 56
        push    ebx                                     ; 3BB3 _ 53
        push    ecx                                     ; 3BB4 _ 51
        push    edx                                     ; 3BB5 _ 52
        push    eax                                     ; 3BB6 _ 50
        push    dword [ebp+8H]                          ; 3BB7 _ FF. 75, 08
        call    sheet_refreshsub                        ; 3BBA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3BBF _ 83. C4, 20
        jmp     ?_255                                   ; 3BC2 _ E9, 0000023E

?_244:  mov     eax, dword [ebp+8H]                     ; 3BC7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3BCA _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 3BCD _ 3B. 45, F4
        jle     ?_247                                   ; 3BD0 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3BD2 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3BD5 _ 89. 45, F0
        jmp     ?_246                                   ; 3BD8 _ EB, 34

?_245:  mov     eax, dword [ebp-10H]                    ; 3BDA _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3BDD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3BE0 _ 8B. 45, 08
        add     edx, 4                                  ; 3BE3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3BE6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3BEA _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3BED _ 8B. 4D, F0
        add     ecx, 4                                  ; 3BF0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3BF3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3BF7 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3BFA _ 8B. 55, F0
        add     edx, 4                                  ; 3BFD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3C00 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3C04 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3C07 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3C0A _ 83. 45, F0, 01
?_246:  mov     eax, dword [ebp+8H]                     ; 3C0E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3C11 _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 3C14 _ 3B. 45, F0
        jg      ?_245                                   ; 3C17 _ 7F, C1
?_247:  mov     eax, dword [ebp+8H]                     ; 3C19 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3C1C _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3C1F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3C22 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3C25 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C28 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C2B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C2E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C31 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C34 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C37 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C3A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C3D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C40 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C43 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C46 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C49 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C4C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C4F _ 8B. 40, 0C
        sub     esp, 8                                  ; 3C52 _ 83. EC, 08
        push    0                                       ; 3C55 _ 6A, 00
        push    ebx                                     ; 3C57 _ 53
        push    ecx                                     ; 3C58 _ 51
        push    edx                                     ; 3C59 _ 52
        push    eax                                     ; 3C5A _ 50
        push    dword [ebp+8H]                          ; 3C5B _ FF. 75, 08
        call    sheet_refreshmap                        ; 3C5E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3C63 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 3C66 _ 8B. 45, F4
        lea     esi, [eax-1H]                           ; 3C69 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3C6C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C6F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C72 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C75 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C78 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C7B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C7E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C81 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C84 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C87 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C8A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C8D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C90 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C93 _ 8B. 40, 0C
        sub     esp, 4                                  ; 3C96 _ 83. EC, 04
        push    esi                                     ; 3C99 _ 56
        push    0                                       ; 3C9A _ 6A, 00
        push    ebx                                     ; 3C9C _ 53
        push    ecx                                     ; 3C9D _ 51
        push    edx                                     ; 3C9E _ 52
        push    eax                                     ; 3C9F _ 50
        push    dword [ebp+8H]                          ; 3CA0 _ FF. 75, 08
        call    sheet_refreshsub                        ; 3CA3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3CA8 _ 83. C4, 20
        jmp     ?_255                                   ; 3CAB _ E9, 00000155

?_248:  mov     eax, dword [ebp-0CH]                    ; 3CB0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3CB3 _ 3B. 45, 10
        jge     ?_255                                   ; 3CB6 _ 0F 8D, 00000149
        cmp     dword [ebp-0CH], 0                      ; 3CBC _ 83. 7D, F4, 00
        js      ?_251                                   ; 3CC0 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3CC2 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3CC5 _ 89. 45, F0
        jmp     ?_250                                   ; 3CC8 _ EB, 34

?_249:  mov     eax, dword [ebp-10H]                    ; 3CCA _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3CCD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3CD0 _ 8B. 45, 08
        add     edx, 4                                  ; 3CD3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3CD6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3CDA _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3CDD _ 8B. 4D, F0
        add     ecx, 4                                  ; 3CE0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3CE3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3CE7 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3CEA _ 8B. 55, F0
        add     edx, 4                                  ; 3CED _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3CF0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3CF4 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3CF7 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3CFA _ 83. 45, F0, 01
?_250:  mov     eax, dword [ebp-10H]                    ; 3CFE _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3D01 _ 3B. 45, 10
        jl      ?_249                                   ; 3D04 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3D06 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D09 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3D0C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3D0F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3D12 _ 89. 54 88, 04
        jmp     ?_254                                   ; 3D16 _ EB, 6C

?_251:  mov     eax, dword [ebp+8H]                     ; 3D18 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D1B _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 3D1E _ 89. 45, F0
        jmp     ?_253                                   ; 3D21 _ EB, 3A

?_252:  mov     eax, dword [ebp-10H]                    ; 3D23 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3D26 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3D29 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3D2C _ 8B. 55, F0
        add     edx, 4                                  ; 3D2F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D32 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D36 _ 8B. 45, 08
        add     ecx, 4                                  ; 3D39 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D3C _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3D40 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3D43 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D46 _ 8B. 45, 08
        add     edx, 4                                  ; 3D49 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D4C _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3D50 _ 8B. 55, F0
        add     edx, 1                                  ; 3D53 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3D56 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3D59 _ 83. 6D, F0, 01
?_253:  mov     eax, dword [ebp-10H]                    ; 3D5D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3D60 _ 3B. 45, 10
        jge     ?_252                                   ; 3D63 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3D65 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D68 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3D6B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3D6E _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3D71 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3D75 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D78 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 3D7B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D7E _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3D81 _ 89. 50, 10
?_254:  mov     eax, dword [ebp+0CH]                    ; 3D84 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D87 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D8A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D8D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3D90 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D93 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D96 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D99 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D9C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3D9F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3DA2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DA5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DA8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DAB _ 8B. 40, 0C
        sub     esp, 8                                  ; 3DAE _ 83. EC, 08
        push    dword [ebp+10H]                         ; 3DB1 _ FF. 75, 10
        push    ebx                                     ; 3DB4 _ 53
        push    ecx                                     ; 3DB5 _ 51
        push    edx                                     ; 3DB6 _ 52
        push    eax                                     ; 3DB7 _ 50
        push    dword [ebp+8H]                          ; 3DB8 _ FF. 75, 08
        call    sheet_refreshmap                        ; 3DBB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3DC0 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 3DC3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DC6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DC9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DCC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3DCF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3DD2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3DD5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DD8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DDB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3DDE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3DE1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DE4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DE7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DEA _ 8B. 40, 0C
        sub     esp, 4                                  ; 3DED _ 83. EC, 04
        push    dword [ebp+10H]                         ; 3DF0 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 3DF3 _ FF. 75, 10
        push    ebx                                     ; 3DF6 _ 53
        push    ecx                                     ; 3DF7 _ 51
        push    edx                                     ; 3DF8 _ 52
        push    eax                                     ; 3DF9 _ 50
        push    dword [ebp+8H]                          ; 3DFA _ FF. 75, 08
        call    sheet_refreshsub                        ; 3DFD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3E02 _ 83. C4, 20
?_255:  nop                                             ; 3E05 _ 90
        lea     esp, [ebp-8H]                           ; 3E06 _ 8D. 65, F8
        pop     ebx                                     ; 3E09 _ 5B
        pop     esi                                     ; 3E0A _ 5E
        pop     ebp                                     ; 3E0B _ 5D
        ret                                             ; 3E0C _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3E0D _ 55
        mov     ebp, esp                                ; 3E0E _ 89. E5
        push    edi                                     ; 3E10 _ 57
        push    esi                                     ; 3E11 _ 56
        push    ebx                                     ; 3E12 _ 53
        sub     esp, 28                                 ; 3E13 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 3E16 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3E19 _ 8B. 40, 18
        test    eax, eax                                ; 3E1C _ 85. C0
        js      ?_256                                   ; 3E1E _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 3E20 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 3E23 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 3E26 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 3E29 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 3E2C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E2F _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 3E32 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 3E35 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 3E38 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E3B _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 3E3E _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 3E41 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3E44 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E47 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 3E4A _ 8B. 45, 14
        add     edx, eax                                ; 3E4D _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3E4F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E52 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 3E55 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 3E58 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 3E5B _ 03. 45, E4
        sub     esp, 4                                  ; 3E5E _ 83. EC, 04
        push    ebx                                     ; 3E61 _ 53
        push    ecx                                     ; 3E62 _ 51
        push    edi                                     ; 3E63 _ 57
        push    esi                                     ; 3E64 _ 56
        push    edx                                     ; 3E65 _ 52
        push    eax                                     ; 3E66 _ 50
        push    dword [ebp+8H]                          ; 3E67 _ FF. 75, 08
        call    sheet_refreshsub                        ; 3E6A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3E6F _ 83. C4, 20
?_256:  mov     eax, 0                                  ; 3E72 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 3E77 _ 8D. 65, F4
        pop     ebx                                     ; 3E7A _ 5B
        pop     esi                                     ; 3E7B _ 5E
        pop     edi                                     ; 3E7C _ 5F
        pop     ebp                                     ; 3E7D _ 5D
        ret                                             ; 3E7E _ C3
; sheet_refresh End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 3E7F _ 55
        mov     ebp, esp                                ; 3E80 _ 89. E5
        sub     esp, 48                                 ; 3E82 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 3E85 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E88 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3E8A _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3E8D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E90 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 3E93 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3E96 _ 83. 7D, 0C, 00
        jns     ?_257                                   ; 3E9A _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3E9C _ C7. 45, 0C, 00000000
?_257:  cmp     dword [ebp+10H], 8                      ; 3EA3 _ 83. 7D, 10, 08
        jg      ?_258                                   ; 3EA7 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 3EA9 _ C7. 45, 10, 00000000
?_258:  mov     eax, dword [ebp+8H]                     ; 3EB0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3EB3 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 3EB6 _ 3B. 45, 14
        jge     ?_259                                   ; 3EB9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3EBB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3EBE _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 3EC1 _ 89. 45, 14
?_259:  mov     eax, dword [ebp+8H]                     ; 3EC4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3EC7 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 3ECA _ 3B. 45, 18
        jge     ?_260                                   ; 3ECD _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3ECF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3ED2 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 3ED5 _ 89. 45, 18
?_260:  mov     eax, dword [ebp+1CH]                    ; 3ED8 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3EDB _ 89. 45, DC
        jmp     ?_267                                   ; 3EDE _ E9, 0000011E

?_261:  mov     eax, dword [ebp+8H]                     ; 3EE3 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3EE6 _ 8B. 55, DC
        add     edx, 4                                  ; 3EE9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3EEC _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3EF0 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3EF3 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3EF6 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3EF8 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3EFB _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 3EFE _ 8B. 55, 08
        add     edx, 1044                               ; 3F01 _ 81. C2, 00000414
        sub     eax, edx                                ; 3F07 _ 29. D0
        sar     eax, 2                                  ; 3F09 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 3F0C _ 69. C0, 38E38E39
        mov     byte [ebp-26H], al                      ; 3F12 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3F15 _ C7. 45, E4, 00000000
        jmp     ?_266                                   ; 3F1C _ E9, 000000CD

?_262:  mov     eax, dword [ebp-10H]                    ; 3F21 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3F24 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3F27 _ 8B. 45, E4
        add     eax, edx                                ; 3F2A _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3F2C _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3F2F _ C7. 45, E0, 00000000
        jmp     ?_265                                   ; 3F36 _ E9, 000000A0

?_263:  mov     eax, dword [ebp-10H]                    ; 3F3B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3F3E _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3F41 _ 8B. 45, E0
        add     eax, edx                                ; 3F44 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3F46 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3F49 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3F4C _ 3B. 45, FC
        jg      ?_264                                   ; 3F4F _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3F55 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3F58 _ 3B. 45, 14
        jge     ?_264                                   ; 3F5B _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3F5D _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3F60 _ 3B. 45, F8
        jg      ?_264                                   ; 3F63 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3F65 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3F68 _ 3B. 45, 18
        jge     ?_264                                   ; 3F6B _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3F6D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3F70 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3F73 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3F77 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3F79 _ 8B. 45, E0
        add     eax, edx                                ; 3F7C _ 01. D0
        mov     edx, eax                                ; 3F7E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3F80 _ 8B. 45, F4
        add     eax, edx                                ; 3F83 _ 01. D0
        movzx   eax, byte [eax]                         ; 3F85 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3F88 _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 3F8B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3F8E _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 3F91 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3F95 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3F97 _ 8B. 45, FC
        add     eax, edx                                ; 3F9A _ 01. D0
        mov     edx, eax                                ; 3F9C _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3F9E _ 8B. 45, EC
        add     eax, edx                                ; 3FA1 _ 01. D0
        movzx   eax, byte [eax]                         ; 3FA3 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3FA6 _ 3A. 45, DA
        jnz     ?_264                                   ; 3FA9 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 3FAB _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3FAF _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3FB2 _ 8B. 40, 14
        cmp     edx, eax                                ; 3FB5 _ 39. C2
        jz      ?_264                                   ; 3FB7 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3FB9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3FBC _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 3FBF _ 0F AF. 45, F8
        mov     edx, eax                                ; 3FC3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3FC5 _ 8B. 45, FC
        add     eax, edx                                ; 3FC8 _ 01. D0
        mov     edx, eax                                ; 3FCA _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3FCC _ 8B. 45, E8
        add     edx, eax                                ; 3FCF _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 3FD1 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3FD5 _ 88. 02
?_264:  add     dword [ebp-20H], 1                      ; 3FD7 _ 83. 45, E0, 01
?_265:  mov     eax, dword [ebp-10H]                    ; 3FDB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3FDE _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 3FE1 _ 3B. 45, E0
        jg      ?_263                                   ; 3FE4 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3FEA _ 83. 45, E4, 01
?_266:  mov     eax, dword [ebp-10H]                    ; 3FEE _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3FF1 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3FF4 _ 3B. 45, E4
        jg      ?_262                                   ; 3FF7 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 3FFD _ 83. 45, DC, 01
?_267:  mov     eax, dword [ebp-24H]                    ; 4001 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 4004 _ 3B. 45, 20
        jle     ?_261                                   ; 4007 _ 0F 8E, FFFFFED6
        nop                                             ; 400D _ 90
        leave                                           ; 400E _ C9
        ret                                             ; 400F _ C3
; sheet_refreshsub End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4010 _ 55
        mov     ebp, esp                                ; 4011 _ 89. E5
        push    esi                                     ; 4013 _ 56
        push    ebx                                     ; 4014 _ 53
        sub     esp, 16                                 ; 4015 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 4018 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 401B _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 401E _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4021 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4024 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4027 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 402A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 402D _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4030 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4033 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4036 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4039 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 403C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 403F _ 8B. 40, 18
        test    eax, eax                                ; 4042 _ 85. C0
        js      ?_268                                   ; 4044 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 404A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 404D _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4050 _ 8B. 45, F4
        add     edx, eax                                ; 4053 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4055 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4058 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 405B _ 8B. 45, F0
        add     eax, ecx                                ; 405E _ 01. C8
        sub     esp, 8                                  ; 4060 _ 83. EC, 08
        push    0                                       ; 4063 _ 6A, 00
        push    edx                                     ; 4065 _ 52
        push    eax                                     ; 4066 _ 50
        push    dword [ebp-0CH]                         ; 4067 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 406A _ FF. 75, F0
        push    dword [ebp+8H]                          ; 406D _ FF. 75, 08
        call    sheet_refreshmap                        ; 4070 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4075 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4078 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 407B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 407E _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4081 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4084 _ 8B. 55, 14
        add     ecx, edx                                ; 4087 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4089 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 408C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 408F _ 8B. 55, 10
        add     edx, ebx                                ; 4092 _ 01. DA
        sub     esp, 8                                  ; 4094 _ 83. EC, 08
        push    eax                                     ; 4097 _ 50
        push    ecx                                     ; 4098 _ 51
        push    edx                                     ; 4099 _ 52
        push    dword [ebp+14H]                         ; 409A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 409D _ FF. 75, 10
        push    dword [ebp+8H]                          ; 40A0 _ FF. 75, 08
        call    sheet_refreshmap                        ; 40A3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 40A8 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 40AB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40AE _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 40B1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 40B4 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 40B7 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 40BA _ 8B. 45, F4
        add     edx, eax                                ; 40BD _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 40BF _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 40C2 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 40C5 _ 8B. 45, F0
        add     eax, ebx                                ; 40C8 _ 01. D8
        sub     esp, 4                                  ; 40CA _ 83. EC, 04
        push    ecx                                     ; 40CD _ 51
        push    0                                       ; 40CE _ 6A, 00
        push    edx                                     ; 40D0 _ 52
        push    eax                                     ; 40D1 _ 50
        push    dword [ebp-0CH]                         ; 40D2 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 40D5 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 40D8 _ FF. 75, 08
        call    sheet_refreshsub                        ; 40DB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 40E0 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 40E3 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 40E6 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 40E9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40EC _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 40EF _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 40F2 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 40F5 _ 8B. 4D, 14
        add     ebx, ecx                                ; 40F8 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 40FA _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 40FD _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4100 _ 8B. 4D, 10
        add     ecx, esi                                ; 4103 _ 01. F1
        sub     esp, 4                                  ; 4105 _ 83. EC, 04
        push    edx                                     ; 4108 _ 52
        push    eax                                     ; 4109 _ 50
        push    ebx                                     ; 410A _ 53
        push    ecx                                     ; 410B _ 51
        push    dword [ebp+14H]                         ; 410C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 410F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 4112 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4115 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 411A _ 83. C4, 20
?_268:  nop                                             ; 411D _ 90
        lea     esp, [ebp-8H]                           ; 411E _ 8D. 65, F8
        pop     ebx                                     ; 4121 _ 5B
        pop     esi                                     ; 4122 _ 5E
        pop     ebp                                     ; 4123 _ 5D
        ret                                             ; 4124 _ C3
; sheet_slide End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4125 _ 55
        mov     ebp, esp                                ; 4126 _ 89. E5
        sub     esp, 64                                 ; 4128 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 412B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 412E _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4131 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4134 _ 83. 7D, 0C, 00
        jns     ?_269                                   ; 4138 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 413A _ C7. 45, 0C, 00000000
?_269:  cmp     dword [ebp+10H], 0                      ; 4141 _ 83. 7D, 10, 00
        jns     ?_270                                   ; 4145 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4147 _ C7. 45, 10, 00000000
?_270:  mov     eax, dword [ebp+8H]                     ; 414E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4151 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4154 _ 3B. 45, 14
        jge     ?_271                                   ; 4157 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4159 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 415C _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 415F _ 89. 45, 14
?_271:  mov     eax, dword [ebp+8H]                     ; 4162 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4165 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4168 _ 3B. 45, 18
        jge     ?_272                                   ; 416B _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 416D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4170 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4173 _ 89. 45, 18
?_272:  mov     eax, dword [ebp+1CH]                    ; 4176 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4179 _ 89. 45, D0
        jmp     ?_283                                   ; 417C _ E9, 00000146

?_273:  mov     eax, dword [ebp+8H]                     ; 4181 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4184 _ 8B. 55, D0
        add     edx, 4                                  ; 4187 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 418A _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 418E _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4191 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 4194 _ 8B. 55, 08
        add     edx, 1044                               ; 4197 _ 81. C2, 00000414
        sub     eax, edx                                ; 419D _ 29. D0
        sar     eax, 2                                  ; 419F _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 41A2 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 41A8 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 41AB _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 41AE _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 41B0 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 41B3 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 41B6 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 41B9 _ 8B. 55, 0C
        sub     edx, eax                                ; 41BC _ 29. C2
        mov     eax, edx                                ; 41BE _ 89. D0
        mov     dword [ebp-24H], eax                    ; 41C0 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 41C3 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 41C6 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 41C9 _ 8B. 55, 10
        sub     edx, eax                                ; 41CC _ 29. C2
        mov     eax, edx                                ; 41CE _ 89. D0
        mov     dword [ebp-20H], eax                    ; 41D0 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 41D3 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 41D6 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 41D9 _ 8B. 55, 14
        sub     edx, eax                                ; 41DC _ 29. C2
        mov     eax, edx                                ; 41DE _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 41E0 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 41E3 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 41E6 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 41E9 _ 8B. 55, 18
        sub     edx, eax                                ; 41EC _ 29. C2
        mov     eax, edx                                ; 41EE _ 89. D0
        mov     dword [ebp-18H], eax                    ; 41F0 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 41F3 _ 83. 7D, DC, 00
        jns     ?_274                                   ; 41F7 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 41F9 _ C7. 45, DC, 00000000
?_274:  cmp     dword [ebp-20H], 0                      ; 4200 _ 83. 7D, E0, 00
        jns     ?_275                                   ; 4204 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4206 _ C7. 45, E0, 00000000
?_275:  mov     eax, dword [ebp-10H]                    ; 420D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4210 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 4213 _ 3B. 45, E4
        jge     ?_276                                   ; 4216 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4218 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 421B _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 421E _ 89. 45, E4
?_276:  mov     eax, dword [ebp-10H]                    ; 4221 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4224 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4227 _ 3B. 45, E8
        jge     ?_277                                   ; 422A _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 422C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 422F _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 4232 _ 89. 45, E8
?_277:  mov     eax, dword [ebp-20H]                    ; 4235 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4238 _ 89. 45, D8
        jmp     ?_282                                   ; 423B _ EB, 7A

?_278:  mov     eax, dword [ebp-10H]                    ; 423D _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4240 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 4243 _ 8B. 45, D8
        add     eax, edx                                ; 4246 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4248 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 424B _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 424E _ 89. 45, D4
        jmp     ?_281                                   ; 4251 _ EB, 58

?_279:  mov     eax, dword [ebp-10H]                    ; 4253 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4256 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 4259 _ 8B. 45, D4
        add     eax, edx                                ; 425C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 425E _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4261 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4264 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 4267 _ 0F AF. 45, D8
        mov     edx, eax                                ; 426B _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 426D _ 8B. 45, D4
        add     eax, edx                                ; 4270 _ 01. D0
        mov     edx, eax                                ; 4272 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4274 _ 8B. 45, F4
        add     eax, edx                                ; 4277 _ 01. D0
        movzx   eax, byte [eax]                         ; 4279 _ 0F B6. 00
        movzx   edx, al                                 ; 427C _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 427F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4282 _ 8B. 40, 14
        cmp     edx, eax                                ; 4285 _ 39. C2
        jz      ?_280                                   ; 4287 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4289 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 428C _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 428F _ 0F AF. 45, F8
        mov     edx, eax                                ; 4293 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4295 _ 8B. 45, FC
        add     eax, edx                                ; 4298 _ 01. D0
        mov     edx, eax                                ; 429A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 429C _ 8B. 45, EC
        add     edx, eax                                ; 429F _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 42A1 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 42A5 _ 88. 02
?_280:  add     dword [ebp-2CH], 1                      ; 42A7 _ 83. 45, D4, 01
?_281:  mov     eax, dword [ebp-2CH]                    ; 42AB _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 42AE _ 3B. 45, E4
        jl      ?_279                                   ; 42B1 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 42B3 _ 83. 45, D8, 01
?_282:  mov     eax, dword [ebp-28H]                    ; 42B7 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 42BA _ 3B. 45, E8
        jl      ?_278                                   ; 42BD _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 42C3 _ 83. 45, D0, 01
?_283:  mov     eax, dword [ebp+8H]                     ; 42C7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 42CA _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 42CD _ 3B. 45, D0
        jge     ?_273                                   ; 42D0 _ 0F 8D, FFFFFEAB
        nop                                             ; 42D6 _ 90
        leave                                           ; 42D7 _ C9
        ret                                             ; 42D8 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 42D9 _ 55
        mov     ebp, esp                                ; 42DA _ 89. E5
        sub     esp, 8                                  ; 42DC _ 83. EC, 08
        mov     eax, dword [ebp+0CH]                    ; 42DF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 42E2 _ 8B. 40, 18
        test    eax, eax                                ; 42E5 _ 85. C0
        js      ?_284                                   ; 42E7 _ 78, 13
        sub     esp, 4                                  ; 42E9 _ 83. EC, 04
        push    -1                                      ; 42EC _ 6A, FF
        push    dword [ebp+0CH]                         ; 42EE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 42F1 _ FF. 75, 08
        call    sheet_updown                            ; 42F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 42F9 _ 83. C4, 10
?_284:  mov     eax, dword [ebp+0CH]                    ; 42FC _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 42FF _ C7. 40, 1C, 00000000
        nop                                             ; 4306 _ 90
        leave                                           ; 4307 _ C9
        ret                                             ; 4308 _ C3
; sheet_free End of function

timer_alloc:; Function begin
        push    ebp                                     ; 4309 _ 55
        mov     ebp, esp                                ; 430A _ 89. E5
        sub     esp, 16                                 ; 430C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 430F _ C7. 45, FC, 00000000
        jmp     ?_287                                   ; 4316 _ EB, 36

?_285:  mov     eax, dword [ebp-4H]                     ; 4318 _ 8B. 45, FC
        shl     eax, 4                                  ; 431B _ C1. E0, 04
        add     eax, ?_383                              ; 431E _ 05, 000003A8(d)
        mov     eax, dword [eax]                        ; 4323 _ 8B. 00
        test    eax, eax                                ; 4325 _ 85. C0
        jnz     ?_286                                   ; 4327 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 4329 _ 8B. 45, FC
        shl     eax, 4                                  ; 432C _ C1. E0, 04
        add     eax, ?_383                              ; 432F _ 05, 000003A8(d)
        mov     dword [eax], 1                          ; 4334 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 433A _ 8B. 45, FC
        shl     eax, 4                                  ; 433D _ C1. E0, 04
        add     eax, timerctl                           ; 4340 _ 05, 000003A0(d)
        add     eax, 4                                  ; 4345 _ 83. C0, 04
        jmp     ?_288                                   ; 4348 _ EB, 12

?_286:  add     dword [ebp-4H], 1                       ; 434A _ 83. 45, FC, 01
?_287:  cmp     dword [ebp-4H], 499                     ; 434E _ 81. 7D, FC, 000001F3
        jle     ?_285                                   ; 4355 _ 7E, C1
        mov     eax, 0                                  ; 4357 _ B8, 00000000
?_288:  leave                                           ; 435C _ C9
        ret                                             ; 435D _ C3
; timer_alloc End of function

init_pit:; Function begin
        push    ebp                                     ; 435E _ 55
        mov     ebp, esp                                ; 435F _ 89. E5
        sub     esp, 24                                 ; 4361 _ 83. EC, 18
        sub     esp, 8                                  ; 4364 _ 83. EC, 08
        push    52                                      ; 4367 _ 6A, 34
        push    67                                      ; 4369 _ 6A, 43
        call    io_out8                                 ; 436B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4370 _ 83. C4, 10
        sub     esp, 8                                  ; 4373 _ 83. EC, 08
        push    156                                     ; 4376 _ 68, 0000009C
        push    64                                      ; 437B _ 6A, 40
        call    io_out8                                 ; 437D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4382 _ 83. C4, 10
        sub     esp, 8                                  ; 4385 _ 83. EC, 08
        push    46                                      ; 4388 _ 6A, 2E
        push    64                                      ; 438A _ 6A, 40
        call    io_out8                                 ; 438C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4391 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 4394 _ C7. 05, 000003A0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 439E _ C7. 45, F4, 00000000
        jmp     ?_290                                   ; 43A5 _ EB, 26

?_289:  mov     eax, dword [ebp-0CH]                    ; 43A7 _ 8B. 45, F4
        shl     eax, 4                                  ; 43AA _ C1. E0, 04
        add     eax, ?_383                              ; 43AD _ 05, 000003A8(d)
        mov     dword [eax], 0                          ; 43B2 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 43B8 _ 8B. 45, F4
        shl     eax, 4                                  ; 43BB _ C1. E0, 04
        add     eax, ?_384                              ; 43BE _ 05, 000003AC(d)
        mov     dword [eax], 0                          ; 43C3 _ C7. 00, 00000000
        add     dword [ebp-0CH], 1                      ; 43C9 _ 83. 45, F4, 01
?_290:  cmp     dword [ebp-0CH], 499                    ; 43CD _ 81. 7D, F4, 000001F3
        jle     ?_289                                   ; 43D4 _ 7E, D1
        nop                                             ; 43D6 _ 90
        leave                                           ; 43D7 _ C9
        ret                                             ; 43D8 _ C3
; init_pit End of function

timer_free:; Function begin
        push    ebp                                     ; 43D9 _ 55
        mov     ebp, esp                                ; 43DA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 43DC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 43DF _ C7. 40, 04, 00000000
        nop                                             ; 43E6 _ 90
        pop     ebp                                     ; 43E7 _ 5D
        ret                                             ; 43E8 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 43E9 _ 55
        mov     ebp, esp                                ; 43EA _ 89. E5
        sub     esp, 4                                  ; 43EC _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 43EF _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 43F2 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 43F5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 43F8 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 43FB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 43FE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4401 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4405 _ 88. 50, 0C
        nop                                             ; 4408 _ 90
        leave                                           ; 4409 _ C9
        ret                                             ; 440A _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 440B _ 55
        mov     ebp, esp                                ; 440C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 440E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4411 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4414 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4416 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4419 _ C7. 40, 04, 00000002
        nop                                             ; 4420 _ 90
        pop     ebp                                     ; 4421 _ 5D
        ret                                             ; 4422 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 4423 _ 55
        mov     ebp, esp                                ; 4424 _ 89. E5
        sub     esp, 24                                 ; 4426 _ 83. EC, 18
        sub     esp, 8                                  ; 4429 _ 83. EC, 08
        push    32                                      ; 442C _ 6A, 20
        push    32                                      ; 442E _ 6A, 20
        call    io_out8                                 ; 4430 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4435 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 4438 _ A1, 000003A0(d)
        add     eax, 1                                  ; 443D _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 4440 _ A3, 000003A0(d)
        mov     byte [ebp-0DH], 0                       ; 4445 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4449 _ C7. 45, F4, 00000000
        jmp     ?_294                                   ; 4450 _ E9, 000000AA

?_291:  mov     eax, dword [ebp-0CH]                    ; 4455 _ 8B. 45, F4
        shl     eax, 4                                  ; 4458 _ C1. E0, 04
        add     eax, ?_383                              ; 445B _ 05, 000003A8(d)
        mov     eax, dword [eax]                        ; 4460 _ 8B. 00
        cmp     eax, 2                                  ; 4462 _ 83. F8, 02
        jne     ?_292                                   ; 4465 _ 0F 85, 00000085
        mov     eax, dword [ebp-0CH]                    ; 446B _ 8B. 45, F4
        shl     eax, 4                                  ; 446E _ C1. E0, 04
        add     eax, ?_382                              ; 4471 _ 05, 000003A4(d)
        mov     eax, dword [eax]                        ; 4476 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4478 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 447B _ 8B. 45, F4
        shl     eax, 4                                  ; 447E _ C1. E0, 04
        add     eax, ?_382                              ; 4481 _ 05, 000003A4(d)
        mov     dword [eax], edx                        ; 4486 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4488 _ 8B. 45, F4
        shl     eax, 4                                  ; 448B _ C1. E0, 04
        add     eax, ?_382                              ; 448E _ 05, 000003A4(d)
        mov     eax, dword [eax]                        ; 4493 _ 8B. 00
        test    eax, eax                                ; 4495 _ 85. C0
        jnz     ?_292                                   ; 4497 _ 75, 57
        mov     eax, dword [ebp-0CH]                    ; 4499 _ 8B. 45, F4
        shl     eax, 4                                  ; 449C _ C1. E0, 04
        add     eax, ?_383                              ; 449F _ 05, 000003A8(d)
        mov     dword [eax], 1                          ; 44A4 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 44AA _ 8B. 45, F4
        shl     eax, 4                                  ; 44AD _ C1. E0, 04
        add     eax, ?_385                              ; 44B0 _ 05, 000003B0(d)
        movzx   eax, byte [eax]                         ; 44B5 _ 0F B6. 00
        movzx   edx, al                                 ; 44B8 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 44BB _ 8B. 45, F4
        shl     eax, 4                                  ; 44BE _ C1. E0, 04
        add     eax, ?_384                              ; 44C1 _ 05, 000003AC(d)
        mov     eax, dword [eax]                        ; 44C6 _ 8B. 00
        sub     esp, 8                                  ; 44C8 _ 83. EC, 08
        push    edx                                     ; 44CB _ 52
        push    eax                                     ; 44CC _ 50
        call    fifo8_put                               ; 44CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 44D2 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 44D5 _ 8B. 45, F4
        shl     eax, 4                                  ; 44D8 _ C1. E0, 04
        add     eax, timerctl                           ; 44DB _ 05, 000003A0(d)
        lea     edx, [eax+4H]                           ; 44E0 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 44E3 _ A1, 00000000(d)
        cmp     edx, eax                                ; 44E8 _ 39. C2
        jnz     ?_292                                   ; 44EA _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 44EC _ C6. 45, F3, 01
?_292:  cmp     byte [ebp-0DH], 0                       ; 44F0 _ 80. 7D, F3, 00
        jz      ?_293                                   ; 44F4 _ 74, 05
        call    task_switch                             ; 44F6 _ E8, FFFFFFFC(rel)
?_293:  add     dword [ebp-0CH], 1                      ; 44FB _ 83. 45, F4, 01
?_294:  cmp     dword [ebp-0CH], 499                    ; 44FF _ 81. 7D, F4, 000001F3
        jle     ?_291                                   ; 4506 _ 0F 8E, FFFFFF49
        nop                                             ; 450C _ 90
        leave                                           ; 450D _ C9
        ret                                             ; 450E _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 450F _ 55
        mov     ebp, esp                                ; 4510 _ 89. E5
        mov     eax, timerctl                           ; 4512 _ B8, 000003A0(d)
        pop     ebp                                     ; 4517 _ 5D
        ret                                             ; 4518 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 4519 _ 55
        mov     ebp, esp                                ; 451A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 451C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 451F _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4522 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4525 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4528 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 452B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 452D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4530 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4533 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4536 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 4539 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4540 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4543 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 454A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 454D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4554 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4557 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 455A _ 89. 50, 18
        nop                                             ; 455D _ 90
        pop     ebp                                     ; 455E _ 5D
        ret                                             ; 455F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 4560 _ 55
        mov     ebp, esp                                ; 4561 _ 89. E5
        sub     esp, 24                                 ; 4563 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4566 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 4569 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 456C _ 83. 7D, 08, 00
        jnz     ?_295                                   ; 4570 _ 75, 0A
        mov     eax, 4294967295                         ; 4572 _ B8, FFFFFFFF
        jmp     ?_299                                   ; 4577 _ E9, 000000A0

?_295:  mov     eax, dword [ebp+8H]                     ; 457C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 457F _ 8B. 40, 10
        test    eax, eax                                ; 4582 _ 85. C0
        jnz     ?_296                                   ; 4584 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 4586 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 4589 _ 8B. 40, 14
        or      eax, 01H                                ; 458C _ 83. C8, 01
        mov     edx, eax                                ; 458F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4591 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 4594 _ 89. 50, 14
        mov     eax, 4294967295                         ; 4597 _ B8, FFFFFFFF
        jmp     ?_299                                   ; 459C _ EB, 7E

?_296:  mov     eax, dword [ebp+8H]                     ; 459E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 45A1 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 45A3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 45A6 _ 8B. 40, 04
        add     edx, eax                                ; 45A9 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 45AB _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 45AF _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 45B1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 45B4 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 45B7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 45BA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 45BD _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 45C0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 45C3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 45C6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 45C9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 45CC _ 39. C2
        jnz     ?_297                                   ; 45CE _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 45D0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 45D3 _ C7. 40, 04, 00000000
?_297:  mov     eax, dword [ebp+8H]                     ; 45DA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 45DD _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 45E0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 45E3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 45E6 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 45E9 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 45EC _ 8B. 40, 18
        test    eax, eax                                ; 45EF _ 85. C0
        jz      ?_298                                   ; 45F1 _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 45F3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 45F6 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 45F9 _ 8B. 40, 04
        cmp     eax, 2                                  ; 45FC _ 83. F8, 02
        jz      ?_298                                   ; 45FF _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 4601 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4604 _ 8B. 40, 18
        sub     esp, 4                                  ; 4607 _ 83. EC, 04
        push    0                                       ; 460A _ 6A, 00
        push    -1                                      ; 460C _ 6A, FF
        push    eax                                     ; 460E _ 50
        call    task_run                                ; 460F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4614 _ 83. C4, 10
?_298:  mov     eax, 0                                  ; 4617 _ B8, 00000000
?_299:  leave                                           ; 461C _ C9
        ret                                             ; 461D _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 461E _ 55
        mov     ebp, esp                                ; 461F _ 89. E5
        sub     esp, 16                                 ; 4621 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4624 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4627 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 462A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 462D _ 8B. 40, 0C
        cmp     edx, eax                                ; 4630 _ 39. C2
        jnz     ?_300                                   ; 4632 _ 75, 07
        mov     eax, 4294967295                         ; 4634 _ B8, FFFFFFFF
        jmp     ?_302                                   ; 4639 _ EB, 51

?_300:  mov     eax, dword [ebp+8H]                     ; 463B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 463E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4640 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4643 _ 8B. 40, 08
        add     eax, edx                                ; 4646 _ 01. D0
        movzx   eax, byte [eax]                         ; 4648 _ 0F B6. 00
        movzx   eax, al                                 ; 464B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 464E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4651 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4654 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 4657 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 465A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 465D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4660 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 4663 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4666 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4669 _ 8B. 40, 0C
        cmp     edx, eax                                ; 466C _ 39. C2
        jnz     ?_301                                   ; 466E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4670 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4673 _ C7. 40, 08, 00000000
?_301:  mov     eax, dword [ebp+8H]                     ; 467A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 467D _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4680 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4683 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4686 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 4689 _ 8B. 45, FC
?_302:  leave                                           ; 468C _ C9
        ret                                             ; 468D _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 468E _ 55
        mov     ebp, esp                                ; 468F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4691 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4694 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4697 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 469A _ 8B. 40, 10
        sub     edx, eax                                ; 469D _ 29. C2
        mov     eax, edx                                ; 469F _ 89. D0
        pop     ebp                                     ; 46A1 _ 5D
        ret                                             ; 46A2 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 46A3 _ 55
        mov     ebp, esp                                ; 46A4 _ 89. E5
        sub     esp, 16                                 ; 46A6 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 46A9 _ 83. 7D, 08, 00
        jz      ?_303                                   ; 46AD _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 46AF _ 83. 7D, 0C, 00
        jnz     ?_304                                   ; 46B3 _ 75, 0A
?_303:  mov     eax, 0                                  ; 46B5 _ B8, 00000000
        jmp     ?_311                                   ; 46BA _ E9, 0000009B

?_304:  mov     dword [ebp-4H], 0                       ; 46BF _ C7. 45, FC, 00000000
        jmp     ?_307                                   ; 46C6 _ EB, 25

?_305:  mov     edx, dword [ebp-4H]                     ; 46C8 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 46CB _ 8B. 45, 08
        add     eax, edx                                ; 46CE _ 01. D0
        movzx   edx, byte [eax]                         ; 46D0 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 46D3 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 46D6 _ 8B. 45, 0C
        add     eax, ecx                                ; 46D9 _ 01. C8
        movzx   eax, byte [eax]                         ; 46DB _ 0F B6. 00
        cmp     dl, al                                  ; 46DE _ 38. C2
        jz      ?_306                                   ; 46E0 _ 74, 07
        mov     eax, 0                                  ; 46E2 _ B8, 00000000
        jmp     ?_311                                   ; 46E7 _ EB, 71

?_306:  add     dword [ebp-4H], 1                       ; 46E9 _ 83. 45, FC, 01
?_307:  mov     edx, dword [ebp-4H]                     ; 46ED _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 46F0 _ 8B. 45, 08
        add     eax, edx                                ; 46F3 _ 01. D0
        movzx   eax, byte [eax]                         ; 46F5 _ 0F B6. 00
        test    al, al                                  ; 46F8 _ 84. C0
        jz      ?_308                                   ; 46FA _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 46FC _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 46FF _ 8B. 45, 0C
        add     eax, edx                                ; 4702 _ 01. D0
        movzx   eax, byte [eax]                         ; 4704 _ 0F B6. 00
        test    al, al                                  ; 4707 _ 84. C0
        jnz     ?_305                                   ; 4709 _ 75, BD
?_308:  mov     edx, dword [ebp-4H]                     ; 470B _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 470E _ 8B. 45, 08
        add     eax, edx                                ; 4711 _ 01. D0
        movzx   eax, byte [eax]                         ; 4713 _ 0F B6. 00
        test    al, al                                  ; 4716 _ 84. C0
        jnz     ?_309                                   ; 4718 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 471A _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 471D _ 8B. 45, 0C
        add     eax, edx                                ; 4720 _ 01. D0
        movzx   eax, byte [eax]                         ; 4722 _ 0F B6. 00
        test    al, al                                  ; 4725 _ 84. C0
        jz      ?_309                                   ; 4727 _ 74, 07
        mov     eax, 0                                  ; 4729 _ B8, 00000000
        jmp     ?_311                                   ; 472E _ EB, 2A

?_309:  mov     edx, dword [ebp-4H]                     ; 4730 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4733 _ 8B. 45, 08
        add     eax, edx                                ; 4736 _ 01. D0
        movzx   eax, byte [eax]                         ; 4738 _ 0F B6. 00
        test    al, al                                  ; 473B _ 84. C0
        jz      ?_310                                   ; 473D _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 473F _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4742 _ 8B. 45, 0C
        add     eax, edx                                ; 4745 _ 01. D0
        movzx   eax, byte [eax]                         ; 4747 _ 0F B6. 00
        test    al, al                                  ; 474A _ 84. C0
        jz      ?_310                                   ; 474C _ 74, 07
        mov     eax, 0                                  ; 474E _ B8, 00000000
        jmp     ?_311                                   ; 4753 _ EB, 05

?_310:  mov     eax, 1                                  ; 4755 _ B8, 00000001
?_311:  leave                                           ; 475A _ C9
        ret                                             ; 475B _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 475C _ 55
        mov     ebp, esp                                ; 475D _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 475F _ 81. 7D, 0C, 000FFFFF
        jbe     ?_312                                   ; 4766 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4768 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 476F _ 8B. 45, 0C
        shr     eax, 12                                 ; 4772 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 4775 _ 89. 45, 0C
?_312:  mov     eax, dword [ebp+0CH]                    ; 4778 _ 8B. 45, 0C
        mov     edx, eax                                ; 477B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 477D _ 8B. 45, 08
        mov     word [eax], dx                          ; 4780 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4783 _ 8B. 45, 10
        mov     edx, eax                                ; 4786 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4788 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 478B _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 478F _ 8B. 45, 10
        sar     eax, 16                                 ; 4792 _ C1. F8, 10
        mov     edx, eax                                ; 4795 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4797 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 479A _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 479D _ 8B. 45, 14
        mov     edx, eax                                ; 47A0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47A2 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 47A5 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 47A8 _ 8B. 45, 0C
        shr     eax, 16                                 ; 47AB _ C1. E8, 10
        and     eax, 0FH                                ; 47AE _ 83. E0, 0F
        mov     edx, eax                                ; 47B1 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 47B3 _ 8B. 45, 14
        sar     eax, 8                                  ; 47B6 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 47B9 _ 83. E0, F0
        or      eax, edx                                ; 47BC _ 09. D0
        mov     edx, eax                                ; 47BE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47C0 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 47C3 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 47C6 _ 8B. 45, 10
        shr     eax, 24                                 ; 47C9 _ C1. E8, 18
        mov     edx, eax                                ; 47CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47CE _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 47D1 _ 88. 50, 07
        nop                                             ; 47D4 _ 90
        pop     ebp                                     ; 47D5 _ 5D
        ret                                             ; 47D6 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 47D7 _ 55
        mov     ebp, esp                                ; 47D8 _ 89. E5
        mov     eax, dword [taskctl]                    ; 47DA _ A1, 000022E8(d)
        pop     ebp                                     ; 47DF _ 5D
        ret                                             ; 47E0 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 47E1 _ 55
        mov     ebp, esp                                ; 47E2 _ 89. E5
        sub     esp, 16                                 ; 47E4 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 47E7 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 47ED _ 8B. 55, 08
        mov     eax, edx                                ; 47F0 _ 89. D0
        shl     eax, 2                                  ; 47F2 _ C1. E0, 02
        add     eax, edx                                ; 47F5 _ 01. D0
        shl     eax, 2                                  ; 47F7 _ C1. E0, 02
        add     eax, ecx                                ; 47FA _ 01. C8
        add     eax, 8                                  ; 47FC _ 83. C0, 08
        mov     dword [eax], 0                          ; 47FF _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4805 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 480B _ 8B. 55, 08
        mov     eax, edx                                ; 480E _ 89. D0
        shl     eax, 2                                  ; 4810 _ C1. E0, 02
        add     eax, edx                                ; 4813 _ 01. D0
        shl     eax, 2                                  ; 4815 _ C1. E0, 02
        add     eax, ecx                                ; 4818 _ 01. C8
        add     eax, 12                                 ; 481A _ 83. C0, 0C
        mov     dword [eax], 0                          ; 481D _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4823 _ C7. 45, FC, 00000000
        jmp     ?_314                                   ; 482A _ EB, 21

?_313:  mov     ecx, dword [taskctl]                    ; 482C _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 4832 _ 8B. 55, 08
        mov     eax, edx                                ; 4835 _ 89. D0
        shl     eax, 2                                  ; 4837 _ C1. E0, 02
        add     eax, edx                                ; 483A _ 01. D0
        mov     edx, dword [ebp-4H]                     ; 483C _ 8B. 55, FC
        add     eax, edx                                ; 483F _ 01. D0
        mov     dword [ecx+eax*4+10H], 0                ; 4841 _ C7. 44 81, 10, 00000000
        add     dword [ebp-4H], 1                       ; 4849 _ 83. 45, FC, 01
?_314:  cmp     dword [ebp-4H], 2                       ; 484D _ 83. 7D, FC, 02
        jle     ?_313                                   ; 4851 _ 7E, D9
        nop                                             ; 4853 _ 90
        leave                                           ; 4854 _ C9
        ret                                             ; 4855 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4856 _ 55
        mov     ebp, esp                                ; 4857 _ 89. E5
        sub     esp, 24                                 ; 4859 _ 83. EC, 18
        call    get_addr_gdt                            ; 485C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4861 _ 89. 45, F0
        sub     esp, 8                                  ; 4864 _ 83. EC, 08
        push    808                                     ; 4867 _ 68, 00000328
        push    dword [ebp+8H]                          ; 486C _ FF. 75, 08
        call    memman_alloc_4k                         ; 486F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4874 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 4877 _ A3, 000022E8(d)
        mov     dword [ebp-14H], 0                      ; 487C _ C7. 45, EC, 00000000
        jmp     ?_316                                   ; 4883 _ EB, 7C

?_315:  mov     edx, dword [taskctl]                    ; 4885 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 488B _ 8B. 45, EC
        imul    eax, eax, 148                           ; 488E _ 69. C0, 00000094
        add     eax, edx                                ; 4894 _ 01. D0
        add     eax, 72                                 ; 4896 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4899 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 489F _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 48A5 _ 8B. 45, EC
        add     eax, 7                                  ; 48A8 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 48AB _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 48B2 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 48B5 _ 69. C0, 00000094
        add     eax, ecx                                ; 48BB _ 01. C8
        add     eax, 68                                 ; 48BD _ 83. C0, 44
        mov     dword [eax], edx                        ; 48C0 _ 89. 10
        mov     eax, dword [taskctl]                    ; 48C2 _ A1, 000022E8(d)
        mov     edx, dword [ebp-14H]                    ; 48C7 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 48CA _ 69. D2, 00000094
        add     edx, 96                                 ; 48D0 _ 83. C2, 60
        add     eax, edx                                ; 48D3 _ 01. D0
        add     eax, 16                                 ; 48D5 _ 83. C0, 10
        mov     ecx, eax                                ; 48D8 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 48DA _ 8B. 45, EC
        add     eax, 7                                  ; 48DD _ 83. C0, 07
        lea     edx, [eax*8]                            ; 48E0 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 48E7 _ 8B. 45, F0
        add     eax, edx                                ; 48EA _ 01. D0
        push    137                                     ; 48EC _ 68, 00000089
        push    ecx                                     ; 48F1 _ 51
        push    103                                     ; 48F2 _ 6A, 67
        push    eax                                     ; 48F4 _ 50
        call    set_segmdesc                            ; 48F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 48FA _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 48FD _ 83. 45, EC, 01
?_316:  cmp     dword [ebp-14H], 4                      ; 4901 _ 83. 7D, EC, 04
        jle     ?_315                                   ; 4905 _ 0F 8E, FFFFFF7A
        mov     dword [ebp-14H], 0                      ; 490B _ C7. 45, EC, 00000000
        jmp     ?_318                                   ; 4912 _ EB, 12

?_317:  sub     esp, 12                                 ; 4914 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 4917 _ FF. 75, EC
        call    init_task_level                         ; 491A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 491F _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 4922 _ 83. 45, EC, 01
?_318:  cmp     dword [ebp-14H], 2                      ; 4926 _ 83. 7D, EC, 02
        jle     ?_317                                   ; 492A _ 7E, E8
        call    task_alloc                              ; 492C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4931 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4934 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4937 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 493E _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4941 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4948 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 494B _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 4952 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 4955 _ FF. 75, F4
        call    task_add                                ; 4958 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 495D _ 83. C4, 10
        call    task_switchsub                          ; 4960 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4965 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4968 _ 8B. 00
        sub     esp, 12                                 ; 496A _ 83. EC, 0C
        push    eax                                     ; 496D _ 50
        call    load_tr                                 ; 496E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4973 _ 83. C4, 10
        call    timer_alloc                             ; 4976 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 497B _ A3, 000022E4(d)
        mov     eax, dword [ebp-0CH]                    ; 4980 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4983 _ 8B. 40, 08
        mov     edx, eax                                ; 4986 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4988 _ A1, 000022E4(d)
        sub     esp, 8                                  ; 498D _ 83. EC, 08
        push    edx                                     ; 4990 _ 52
        push    eax                                     ; 4991 _ 50
        call    timer_settime                           ; 4992 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4997 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 499A _ 8B. 45, F4
        leave                                           ; 499D _ C9
        ret                                             ; 499E _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 499F _ 55
        mov     ebp, esp                                ; 49A0 _ 89. E5
        sub     esp, 16                                 ; 49A2 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 49A5 _ C7. 45, F8, 00000000
        jmp     ?_321                                   ; 49AC _ E9, 00000100

?_319:  mov     edx, dword [taskctl]                    ; 49B1 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-8H]                     ; 49B7 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 49BA _ 69. C0, 00000094
        add     eax, edx                                ; 49C0 _ 01. D0
        add     eax, 72                                 ; 49C2 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 49C5 _ 8B. 00
        test    eax, eax                                ; 49C7 _ 85. C0
        jne     ?_320                                   ; 49C9 _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 49CF _ A1, 000022E8(d)
        mov     edx, dword [ebp-8H]                     ; 49D4 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 49D7 _ 69. D2, 00000094
        add     edx, 64                                 ; 49DD _ 83. C2, 40
        add     eax, edx                                ; 49E0 _ 01. D0
        add     eax, 4                                  ; 49E2 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 49E5 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 49E8 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 49EB _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 49F2 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 49F5 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 49FC _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 49FF _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4A06 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4A09 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A10 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4A13 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A1A _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4A1D _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A24 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4A27 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A2E _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4A31 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 4A38 _ 8B. 45, F8
        add     eax, 1                                  ; 4A3B _ 83. C0, 01
        shl     eax, 9                                  ; 4A3E _ C1. E0, 09
        mov     edx, eax                                ; 4A41 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4A43 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4A46 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4A49 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4A4C _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A53 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4A56 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A5D _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4A60 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A67 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4A6A _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A74 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4A77 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A81 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4A84 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A8E _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4A91 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A9B _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4A9E _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4AA8 _ 8B. 45, FC
        jmp     ?_322                                   ; 4AAB _ EB, 13

?_320:  add     dword [ebp-8H], 1                       ; 4AAD _ 83. 45, F8, 01
?_321:  cmp     dword [ebp-8H], 4                       ; 4AB1 _ 83. 7D, F8, 04
        jle     ?_319                                   ; 4AB5 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 4ABB _ B8, 00000000
?_322:  leave                                           ; 4AC0 _ C9
        ret                                             ; 4AC1 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4AC2 _ 55
        mov     ebp, esp                                ; 4AC3 _ 89. E5
        sub     esp, 8                                  ; 4AC5 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 4AC8 _ 83. 7D, 0C, 00
        jns     ?_323                                   ; 4ACC _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4ACE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4AD1 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4AD4 _ 89. 45, 0C
?_323:  cmp     dword [ebp+10H], 0                      ; 4AD7 _ 83. 7D, 10, 00
        jle     ?_324                                   ; 4ADB _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4ADD _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4AE0 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4AE3 _ 89. 50, 08
?_324:  mov     eax, dword [ebp+8H]                     ; 4AE6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4AE9 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4AEC _ 83. F8, 02
        jnz     ?_325                                   ; 4AEF _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 4AF1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4AF4 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4AF7 _ 3B. 45, 0C
        jz      ?_325                                   ; 4AFA _ 74, 0E
        sub     esp, 12                                 ; 4AFC _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 4AFF _ FF. 75, 08
        call    task_remove                             ; 4B02 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4B07 _ 83. C4, 10
?_325:  mov     eax, dword [ebp+8H]                     ; 4B0A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B0D _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B10 _ 83. F8, 02
        jz      ?_326                                   ; 4B13 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 4B15 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4B18 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4B1B _ 89. 50, 0C
        sub     esp, 12                                 ; 4B1E _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 4B21 _ FF. 75, 08
        call    task_add                                ; 4B24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4B29 _ 83. C4, 10
?_326:  mov     eax, dword [taskctl]                    ; 4B2C _ A1, 000022E8(d)
        mov     dword [eax+4H], 1                       ; 4B31 _ C7. 40, 04, 00000001
        nop                                             ; 4B38 _ 90
        leave                                           ; 4B39 _ C9
        ret                                             ; 4B3A _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4B3B _ 55
        mov     ebp, esp                                ; 4B3C _ 89. E5
        sub     esp, 24                                 ; 4B3E _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 4B41 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4B47 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4B4C _ 8B. 10
        mov     eax, edx                                ; 4B4E _ 89. D0
        shl     eax, 2                                  ; 4B50 _ C1. E0, 02
        add     eax, edx                                ; 4B53 _ 01. D0
        shl     eax, 2                                  ; 4B55 _ C1. E0, 02
        add     eax, ecx                                ; 4B58 _ 01. C8
        add     eax, 8                                  ; 4B5A _ 83. C0, 08
        mov     dword [ebp-18H], eax                    ; 4B5D _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 4B60 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 4B63 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 4B66 _ 8B. 45, E8
        mov     eax, dword [eax+edx*4+8H]               ; 4B69 _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 4B6D _ 89. 45, EC
        mov     eax, dword [ebp-18H]                    ; 4B70 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4B73 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 4B76 _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 4B79 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4B7C _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4B7F _ 8D. 50, 01
        mov     eax, dword [ebp-18H]                    ; 4B82 _ 8B. 45, E8
        mov     dword [eax+4H], edx                     ; 4B85 _ 89. 50, 04
        mov     eax, dword [ebp-18H]                    ; 4B88 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 4B8B _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 4B8E _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 4B91 _ 8B. 00
        cmp     edx, eax                                ; 4B93 _ 39. C2
        jnz     ?_327                                   ; 4B95 _ 75, 0A
        mov     eax, dword [ebp-18H]                    ; 4B97 _ 8B. 45, E8
        mov     dword [eax+4H], 0                       ; 4B9A _ C7. 40, 04, 00000000
?_327:  mov     eax, dword [taskctl]                    ; 4BA1 _ A1, 000022E8(d)
        mov     eax, dword [eax+4H]                     ; 4BA6 _ 8B. 40, 04
        test    eax, eax                                ; 4BA9 _ 85. C0
        jz      ?_329                                   ; 4BAB _ 74, 4E
        call    task_switchsub                          ; 4BAD _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 4BB2 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4BB8 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4BBD _ 8B. 10
        mov     eax, edx                                ; 4BBF _ 89. D0
        shl     eax, 2                                  ; 4BC1 _ C1. E0, 02
        add     eax, edx                                ; 4BC4 _ 01. D0
        shl     eax, 2                                  ; 4BC6 _ C1. E0, 02
        add     eax, ecx                                ; 4BC9 _ 01. C8
        add     eax, 8                                  ; 4BCB _ 83. C0, 08
        cmp     eax, dword [ebp-18H]                    ; 4BCE _ 3B. 45, E8
        jz      ?_328                                   ; 4BD1 _ 74, 09
        mov     eax, dword [ebp-18H]                    ; 4BD3 _ 8B. 45, E8
        mov     edx, dword [ebp-10H]                    ; 4BD6 _ 8B. 55, F0
        mov     dword [eax+4H], edx                     ; 4BD9 _ 89. 50, 04
?_328:  mov     ecx, dword [taskctl]                    ; 4BDC _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4BE2 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4BE7 _ 8B. 10
        mov     eax, edx                                ; 4BE9 _ 89. D0
        shl     eax, 2                                  ; 4BEB _ C1. E0, 02
        add     eax, edx                                ; 4BEE _ 01. D0
        shl     eax, 2                                  ; 4BF0 _ C1. E0, 02
        add     eax, ecx                                ; 4BF3 _ 01. C8
        add     eax, 8                                  ; 4BF5 _ 83. C0, 08
        mov     dword [ebp-18H], eax                    ; 4BF8 _ 89. 45, E8
?_329:  mov     eax, dword [ebp-18H]                    ; 4BFB _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 4BFE _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 4C01 _ 8B. 45, E8
        mov     eax, dword [eax+edx*4+8H]               ; 4C04 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4C08 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4C0B _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4C0E _ 8B. 40, 08
        mov     edx, eax                                ; 4C11 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4C13 _ A1, 000022E4(d)
        sub     esp, 8                                  ; 4C18 _ 83. EC, 08
        push    edx                                     ; 4C1B _ 52
        push    eax                                     ; 4C1C _ 50
        call    timer_settime                           ; 4C1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4C22 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 4C25 _ 8B. 45, F4
        cmp     eax, dword [ebp-14H]                    ; 4C28 _ 3B. 45, EC
        jz      ?_330                                   ; 4C2B _ 74, 1A
        cmp     dword [ebp-0CH], 0                      ; 4C2D _ 83. 7D, F4, 00
        jz      ?_330                                   ; 4C31 _ 74, 14
        mov     eax, dword [ebp-0CH]                    ; 4C33 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4C36 _ 8B. 00
        sub     esp, 8                                  ; 4C38 _ 83. EC, 08
        push    eax                                     ; 4C3B _ 50
        push    0                                       ; 4C3C _ 6A, 00
        call    farjmp                                  ; 4C3E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4C43 _ 83. C4, 10
        nop                                             ; 4C46 _ 90
?_330:  nop                                             ; 4C47 _ 90
        leave                                           ; 4C48 _ C9
        ret                                             ; 4C49 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4C4A _ 55
        mov     ebp, esp                                ; 4C4B _ 89. E5
        sub     esp, 24                                 ; 4C4D _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 4C50 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4C57 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4C5E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4C61 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4C64 _ 83. F8, 02
        jnz     ?_331                                   ; 4C67 _ 75, 52
        call    task_now                                ; 4C69 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4C6E _ 89. 45, F4
        sub     esp, 12                                 ; 4C71 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 4C74 _ FF. 75, 08
        call    task_remove                             ; 4C77 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4C7C _ 83. C4, 10
        mov     dword [ebp-10H], 1                      ; 4C7F _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4C86 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4C89 _ 3B. 45, F4
        jnz     ?_331                                   ; 4C8C _ 75, 2D
        call    task_switchsub                          ; 4C8E _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4C93 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4C98 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4C9B _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4CA2 _ 83. 7D, F4, 00
        jz      ?_331                                   ; 4CA6 _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 4CA8 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4CAB _ 8B. 00
        sub     esp, 8                                  ; 4CAD _ 83. EC, 08
        push    eax                                     ; 4CB0 _ 50
        push    0                                       ; 4CB1 _ 6A, 00
        call    farjmp                                  ; 4CB3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4CB8 _ 83. C4, 10
?_331:  mov     eax, dword [ebp-10H]                    ; 4CBB _ 8B. 45, F0
        leave                                           ; 4CBE _ C9
        ret                                             ; 4CBF _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4CC0 _ 55
        mov     ebp, esp                                ; 4CC1 _ 89. E5
        sub     esp, 16                                 ; 4CC3 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4CC6 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4CCC _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4CD1 _ 8B. 10
        mov     eax, edx                                ; 4CD3 _ 89. D0
        shl     eax, 2                                  ; 4CD5 _ C1. E0, 02
        add     eax, edx                                ; 4CD8 _ 01. D0
        shl     eax, 2                                  ; 4CDA _ C1. E0, 02
        add     eax, ecx                                ; 4CDD _ 01. C8
        add     eax, 8                                  ; 4CDF _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4CE2 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4CE5 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4CE8 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4CEB _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4CEE _ 8B. 44 90, 08
        leave                                           ; 4CF2 _ C9
        ret                                             ; 4CF3 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4CF4 _ 55
        mov     ebp, esp                                ; 4CF5 _ 89. E5
        sub     esp, 16                                 ; 4CF7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4CFA _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 4D00 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4D03 _ 8B. 50, 0C
        mov     eax, edx                                ; 4D06 _ 89. D0
        shl     eax, 2                                  ; 4D08 _ C1. E0, 02
        add     eax, edx                                ; 4D0B _ 01. D0
        shl     eax, 2                                  ; 4D0D _ C1. E0, 02
        add     eax, ecx                                ; 4D10 _ 01. C8
        add     eax, 8                                  ; 4D12 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4D15 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4D18 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4D1B _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4D1D _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4D20 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4D23 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4D27 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D2A _ 8B. 00
        lea     edx, [eax+1H]                           ; 4D2C _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4D2F _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4D32 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4D34 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4D37 _ C7. 40, 04, 00000002
        nop                                             ; 4D3E _ 90
        leave                                           ; 4D3F _ C9
        ret                                             ; 4D40 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4D41 _ 55
        mov     ebp, esp                                ; 4D42 _ 89. E5
        sub     esp, 16                                 ; 4D44 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4D47 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 4D4D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4D50 _ 8B. 50, 0C
        mov     eax, edx                                ; 4D53 _ 89. D0
        shl     eax, 2                                  ; 4D55 _ C1. E0, 02
        add     eax, edx                                ; 4D58 _ 01. D0
        shl     eax, 2                                  ; 4D5A _ C1. E0, 02
        add     eax, ecx                                ; 4D5D _ 01. C8
        add     eax, 8                                  ; 4D5F _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4D62 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4D65 _ C7. 45, F8, 00000000
        jmp     ?_334                                   ; 4D6C _ EB, 23

?_332:  mov     eax, dword [ebp-4H]                     ; 4D6E _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D71 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4D74 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4D78 _ 3B. 45, 08
        jnz     ?_333                                   ; 4D7B _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4D7D _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D80 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4D83 _ C7. 44 90, 08, 00000000
        jmp     ?_335                                   ; 4D8B _ EB, 0E

?_333:  add     dword [ebp-8H], 1                       ; 4D8D _ 83. 45, F8, 01
?_334:  mov     eax, dword [ebp-4H]                     ; 4D91 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D94 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4D96 _ 3B. 45, F8
        jg      ?_332                                   ; 4D99 _ 7F, D3
?_335:  mov     eax, dword [ebp-4H]                     ; 4D9B _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D9E _ 8B. 00
        lea     edx, [eax-1H]                           ; 4DA0 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4DA3 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4DA6 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4DA8 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4DAB _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4DAE _ 3B. 45, F8
        jle     ?_336                                   ; 4DB1 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4DB3 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4DB6 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4DB9 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4DBC _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4DBF _ 89. 50, 04
?_336:  mov     eax, dword [ebp-4H]                     ; 4DC2 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4DC5 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4DC8 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DCB _ 8B. 00
        cmp     edx, eax                                ; 4DCD _ 39. C2
        jl      ?_337                                   ; 4DCF _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4DD1 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4DD4 _ C7. 40, 04, 00000000
?_337:  mov     eax, dword [ebp+8H]                     ; 4DDB _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4DDE _ C7. 40, 04, 00000001
        jmp     ?_339                                   ; 4DE5 _ EB, 1B

?_338:  mov     eax, dword [ebp-8H]                     ; 4DE7 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4DEA _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4DED _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4DF0 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4DF4 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4DF7 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4DFA _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4DFE _ 83. 45, F8, 01
?_339:  mov     eax, dword [ebp-4H]                     ; 4E02 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4E05 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4E07 _ 3B. 45, F8
        jg      ?_338                                   ; 4E0A _ 7F, DB
        nop                                             ; 4E0C _ 90
        leave                                           ; 4E0D _ C9
        ret                                             ; 4E0E _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 4E0F _ 55
        mov     ebp, esp                                ; 4E10 _ 89. E5
        sub     esp, 16                                 ; 4E12 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4E15 _ C7. 45, FC, 00000000
        jmp     ?_341                                   ; 4E1C _ EB, 22

?_340:  mov     ecx, dword [taskctl]                    ; 4E1E _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4E24 _ 8B. 55, FC
        mov     eax, edx                                ; 4E27 _ 89. D0
        shl     eax, 2                                  ; 4E29 _ C1. E0, 02
        add     eax, edx                                ; 4E2C _ 01. D0
        shl     eax, 2                                  ; 4E2E _ C1. E0, 02
        add     eax, ecx                                ; 4E31 _ 01. C8
        add     eax, 8                                  ; 4E33 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4E36 _ 8B. 00
        test    eax, eax                                ; 4E38 _ 85. C0
        jg      ?_342                                   ; 4E3A _ 7F, 0C
        add     dword [ebp-4H], 1                       ; 4E3C _ 83. 45, FC, 01
?_341:  cmp     dword [ebp-4H], 2                       ; 4E40 _ 83. 7D, FC, 02
        jle     ?_340                                   ; 4E44 _ 7E, D8
        jmp     ?_343                                   ; 4E46 _ EB, 01

?_342:  nop                                             ; 4E48 _ 90
?_343:  mov     eax, dword [taskctl]                    ; 4E49 _ A1, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4E4E _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4E51 _ 89. 10
        mov     eax, dword [taskctl]                    ; 4E53 _ A1, 000022E8(d)
        mov     dword [eax+4H], 0                       ; 4E58 _ C7. 40, 04, 00000000
        nop                                             ; 4E5F _ 90
        leave                                           ; 4E60 _ C9
        ret                                             ; 4E61 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 4E62 _ 55
        mov     ebp, esp                                ; 4E63 _ 89. E5
        sub     esp, 8                                  ; 4E65 _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 4E68 _ 8B. 45, 10
        movzx   eax, al                                 ; 4E6B _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4E6E _ 8B. 55, 0C
        add     edx, 16                                 ; 4E71 _ 83. C2, 10
        sub     esp, 8                                  ; 4E74 _ 83. EC, 08
        push    eax                                     ; 4E77 _ 50
        push    edx                                     ; 4E78 _ 52
        call    fifo8_put                               ; 4E79 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4E7E _ 83. C4, 10
        sub     esp, 12                                 ; 4E81 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 4E84 _ FF. 75, 08
        call    task_sleep                              ; 4E87 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4E8C _ 83. C4, 10
        nop                                             ; 4E8F _ 90
        leave                                           ; 4E90 _ C9
        ret                                             ; 4E91 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_344:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_345:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0007 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 000F _ cess.

?_346:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0014 _ task_a.

?_347:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001B _ console.

?_348:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0023 _ free .

?_349:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 0029 _  KB.

?_350:                                                  ; byte
        db 20H, 00H                                     ; 002D _  .

?_351:                                                  ; byte
        db 3EH, 00H                                     ; 002F _ >.

?_352:                                                  ; byte
        db 61H, 62H, 63H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ abc.exe.

?_353:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0039 _ mem.

?_354:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 003D _ cls.

?_355:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0041 _ dir.

?_356:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0045 _ hlt.

?_357:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0049 _ page is:
        db 20H, 00H                                     ; 0051 _  .

?_358:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0053 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 005B _ L: .

?_359:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 005F _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0067 _ H: .

?_360:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 006B _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0073 _ w: .

?_361:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 0077 _ INT 0D .

?_362:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 007F _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 0087 _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 008F _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 0097 _ ion.

?_363:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009B _ INT OC.

?_364:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A2 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AA _ ception.

?_365:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B2 _ EIP = .


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0004 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 000C _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0014 _ 0X

?_366:  db 00H                                          ; 0016 _ .

?_367:  db 00H, 00H, 00H, 00H, 00H                      ; 0017 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 001C _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 0020 _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0024 _ 29 0 
        dd 00000000H, 00000000H                         ; 002C _ 0 0 
        dd 00000000H, 00000000H                         ; 0034 _ 0 0 
        dd 00000000H                                    ; 003C _ 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0040 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0048 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0050 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0058 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0060 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0068 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0070 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0080 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0088 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0090 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 00A0 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 00A8 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 00B0 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 00B8 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00C0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00C8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00D0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 00E8 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 00F0 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 0110 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 0118 _ ......|.

table_rgb.2147:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0120 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2222:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0160 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0168 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0170 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0178 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0180 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0190 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01A0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01B0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01D0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 01E0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 01F0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0200 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0208 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0210 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0218 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0220 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0228 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0230 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0238 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0240 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0248 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0250 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0258 _ .....***

closebtn.2339:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0260 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0268 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0280 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0288 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0290 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0298 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0300 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0310 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0320 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0328 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0330 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0338 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 4, bss

key_shift:                                              ; dword
        resd    1                                       ; 0000

caps_lock:                                              ; dword
        resd    1                                       ; 0004

g_Console:                                              ; byte
        resd    1                                       ; 0008

?_368:  resd    1                                       ; 000C

?_369:  resd    1                                       ; 0010

?_370:  resd    1                                       ; 0014

?_371:  resb    1                                       ; 0018

?_372:  resb    3                                       ; 0019

?_373:  resd    1                                       ; 001C

keybuf:                                                 ; yword
        resb    32                                      ; 0020

mousebuf:                                               ; byte
        resb    128                                     ; 0040

timerbuf: resq  1                                       ; 00C0

mdec:                                                   ; oword
        resb    12                                      ; 00C8

?_374:  resd    1                                       ; 00D4

keyinfo:                                                ; byte
        resb    24                                      ; 00D8

?_375:  resd    1                                       ; 00F0

mouseinfo:                                              ; byte
        resb    28                                      ; 00F4

timerinfo:                                              ; byte
        resb    28                                      ; 0110

bootInfo:                                               ; qword
        resb    4                                       ; 012C

?_376:  resw    1                                       ; 0130

?_377:  resw    1                                       ; 0132

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 013C

xsize:  resd    1                                       ; 0140

ysize:  resd    1                                       ; 0144

buf_back: resd  6                                       ; 0148

buf_mouse:                                              ; byte
        resb    256                                     ; 0160

shtMsgBox:                                              ; dword
        resd    1                                       ; 0260

shtctl: resd    1                                       ; 0264

sht_back: resd  1                                       ; 0268

sht_mouse:                                              ; dword
        resd    1                                       ; 026C

task_cons:                                              ; dword
        resd    1                                       ; 0270

task_main:                                              ; dword
        resd    1                                       ; 0274

buffer:                                                 ; byte
        resd    1                                       ; 0278

?_378:  resd    1                                       ; 027C

?_379:  resd    1                                       ; 0280

task_a.1886:                                            ; dword
        resd    7                                       ; 0284

tss_a.1885:                                             ; byte
        resb    128                                     ; 02A0

tss_b.1884:                                             ; byte
        resb    104                                     ; 0320

task_b.1875:                                            ; byte
        resb    12                                      ; 0388

str.2267:                                               ; byte
        resb    1                                       ; 0394

?_380:  resb    9                                       ; 0395

?_381:  resb    2                                       ; 039E

timerctl:                                               ; byte
        resd    1                                       ; 03A0

?_382:                                                  ; byte
        resb    4                                       ; 03A4

?_383:                                                  ; byte
        resb    4                                       ; 03A8

?_384:                                                  ; byte
        resb    4                                       ; 03AC

?_385:                                                  ; byte
        resb    7988                                    ; 03B0

task_timer:                                             ; dword
        resd    1                                       ; 22E4

taskctl: resd   1                                       ; 22E8


