; Hc/NtRollbackTransaction
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciRollbackTransaction:DWORD

.DATA
.CODE

HcRollbackTransaction PROC
	mov r10, rcx
	mov eax, sciRollbackTransaction
	syscall
	ret
HcRollbackTransaction ENDP

ELSE
; 32bit

EXTERNDEF C sciRollbackTransaction:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcRollbackTransaction PROC
	mov eax, sciRollbackTransaction
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
HcRollbackTransaction ENDP

ENDIF

END