; Hc/NtStopProfile
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciStopProfile:DWORD

.DATA
.CODE

HcStopProfile PROC
	mov r10, rcx
	mov eax, sciStopProfile
	syscall
	ret
HcStopProfile ENDP

ELSE
; 32bit

EXTERNDEF C sciStopProfile:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcStopProfile PROC
	mov eax, sciStopProfile
	mov ecx, fs:[0c0h]
	test ecx, ecx
	jne _wow64
	lea edx, [esp + 4]
	INT 02eh
	ret
	_wow64:
	xor ecx, ecx
	lea edx, [esp + 4h]
	call dword ptr fs:[0c0h]
	ret
HcStopProfile ENDP

ENDIF

END