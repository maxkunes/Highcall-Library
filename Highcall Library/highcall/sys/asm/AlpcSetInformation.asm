; Hc/NtAlpcSetInformation
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciAlpcSetInformation:DWORD

.DATA
.CODE

HcAlpcSetInformation PROC
	mov r10, rcx
	mov eax, sciAlpcSetInformation
	syscall
	ret
HcAlpcSetInformation ENDP

ELSE
; 32bit

EXTERNDEF C sciAlpcSetInformation:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcAlpcSetInformation PROC
	mov eax, sciAlpcSetInformation
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
HcAlpcSetInformation ENDP

ENDIF

END