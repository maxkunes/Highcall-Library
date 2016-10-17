; Hc/NtCreateFile
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciCreateFile:DWORD

.DATA
.CODE

HcCreateFile PROC
	mov r10, rcx
	mov eax, sciCreateFile
	syscall
	ret
HcCreateFile ENDP

ELSE
; 32bit

EXTERNDEF C sciCreateFile:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcCreateFile PROC
	mov eax, sciCreateFile
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
HcCreateFile ENDP

ENDIF

END