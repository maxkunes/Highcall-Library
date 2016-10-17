; Hc/NtSetBootOptions
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciSetBootOptions:DWORD

.DATA
.CODE

HcSetBootOptions PROC
	mov r10, rcx
	mov eax, sciSetBootOptions
	syscall
	ret
HcSetBootOptions ENDP

ELSE
; 32bit

EXTERNDEF C sciSetBootOptions:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcSetBootOptions PROC
	mov eax, sciSetBootOptions
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
HcSetBootOptions ENDP

ENDIF

END