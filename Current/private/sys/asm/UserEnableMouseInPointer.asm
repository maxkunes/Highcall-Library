; Hc/NtUserEnableMouseInPointer
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciUserEnableMouseInPointer:DWORD

.DATA
.CODE

HcUserEnableMouseInPointer PROC
	mov r10, rcx
	mov eax, sciUserEnableMouseInPointer
	syscall
	ret
HcUserEnableMouseInPointer ENDP

ELSE
; 32bit

EXTERNDEF C sciUserEnableMouseInPointer:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcUserEnableMouseInPointer PROC
	mov eax, sciUserEnableMouseInPointer
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
HcUserEnableMouseInPointer ENDP

ENDIF

END