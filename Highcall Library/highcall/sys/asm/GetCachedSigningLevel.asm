; Hc/NtGetCachedSigningLevel
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciGetCachedSigningLevel:DWORD

.DATA
.CODE

HcGetCachedSigningLevel PROC
	mov r10, rcx
	mov eax, sciGetCachedSigningLevel
	syscall
	ret
HcGetCachedSigningLevel ENDP

ELSE
; 32bit

EXTERNDEF C sciGetCachedSigningLevel:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcGetCachedSigningLevel PROC
	mov eax, sciGetCachedSigningLevel
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
HcGetCachedSigningLevel ENDP

ENDIF

END