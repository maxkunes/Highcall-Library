; Hc/NtResetWriteWatch
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciResetWriteWatch:DWORD

.DATA
.CODE

HcResetWriteWatch PROC
	mov r10, rcx
	mov eax, sciResetWriteWatch
	syscall
	ret
HcResetWriteWatch ENDP

ELSE
; 32bit

EXTERNDEF C sciResetWriteWatch:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcResetWriteWatch PROC
	mov eax, sciResetWriteWatch
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
HcResetWriteWatch ENDP

ENDIF

END