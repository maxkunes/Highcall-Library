; Hc/NtOpenSection
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciOpenSection:DWORD

.DATA
.CODE

HcOpenSection PROC
	mov r10, rcx
	mov eax, sciOpenSection
	syscall
	ret
HcOpenSection ENDP

ELSE
; 32bit

EXTERNDEF C sciOpenSection:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcOpenSection PROC
	mov eax, sciOpenSection
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
HcOpenSection ENDP

ENDIF

END