; Hc/NtRecoverTransactionManager
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciRecoverTransactionManager:DWORD

.DATA
.CODE

HcRecoverTransactionManager PROC
	mov r10, rcx
	mov eax, sciRecoverTransactionManager
	syscall
	ret
HcRecoverTransactionManager ENDP

ELSE
; 32bit

EXTERNDEF C sciRecoverTransactionManager:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcRecoverTransactionManager PROC
	mov eax, sciRecoverTransactionManager
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
HcRecoverTransactionManager ENDP

ENDIF

END