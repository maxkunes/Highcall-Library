; Hc/NtStartProfile
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciStartProfile:DWORD

.DATA
.CODE

HcStartProfile PROC
	mov r10, rcx
	mov eax, sciStartProfile
	syscall
	ret
HcStartProfile ENDP

ELSE
; 32bit

EXTERNDEF C sciStartProfile:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcStartProfile PROC
	mov eax, sciStartProfile
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
HcStartProfile ENDP

ENDIF

END