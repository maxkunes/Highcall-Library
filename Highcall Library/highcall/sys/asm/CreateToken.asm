; Hc/NtCreateToken
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciCreateToken:DWORD

.DATA
.CODE

HcCreateToken PROC
	mov r10, rcx
	mov eax, sciCreateToken
	syscall
	ret
HcCreateToken ENDP

ELSE
; 32bit

EXTERNDEF C sciCreateToken:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcCreateToken PROC
	mov eax, sciCreateToken
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
HcCreateToken ENDP

ENDIF

END