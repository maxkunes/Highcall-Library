; Hc/NtSetEaFile
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciSetEaFile:DWORD

.DATA
.CODE

HcSetEaFile PROC
	mov r10, rcx
	mov eax, sciSetEaFile
	syscall
	ret
HcSetEaFile ENDP

ELSE
; 32bit

EXTERNDEF C sciSetEaFile:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcSetEaFile PROC
	mov eax, sciSetEaFile
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
HcSetEaFile ENDP

ENDIF

END