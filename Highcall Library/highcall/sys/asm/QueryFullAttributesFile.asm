; Hc/NtQueryFullAttributesFile
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciQueryFullAttributesFile:DWORD

.DATA
.CODE

HcQueryFullAttributesFile PROC
	mov r10, rcx
	mov eax, sciQueryFullAttributesFile
	syscall
	ret
HcQueryFullAttributesFile ENDP

ELSE
; 32bit

EXTERNDEF C sciQueryFullAttributesFile:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcQueryFullAttributesFile PROC
	mov eax, sciQueryFullAttributesFile
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
HcQueryFullAttributesFile ENDP

ENDIF

END