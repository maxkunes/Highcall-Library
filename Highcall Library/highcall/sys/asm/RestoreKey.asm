; Hc/NtRestoreKey
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciRestoreKey:DWORD

.DATA
.CODE

HcRestoreKey PROC
	mov r10, rcx
	mov eax, sciRestoreKey
	syscall
	ret
HcRestoreKey ENDP

ELSE
; 32bit

EXTERNDEF C sciRestoreKey:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcRestoreKey PROC
	mov eax, sciRestoreKey
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
HcRestoreKey ENDP

ENDIF

END