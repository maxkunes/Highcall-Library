; Hc/NtPropagationFailed
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciPropagationFailed:DWORD

.DATA
.CODE

HcPropagationFailed PROC
	mov r10, rcx
	mov eax, sciPropagationFailed
	syscall
	ret
HcPropagationFailed ENDP

ELSE
; 32bit

EXTERNDEF C sciPropagationFailed:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcPropagationFailed PROC
	mov eax, sciPropagationFailed
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
HcPropagationFailed ENDP

ENDIF

END