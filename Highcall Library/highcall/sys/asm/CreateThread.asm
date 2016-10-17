; Hc/NtCreateThread
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciCreateThread:DWORD

.DATA
.CODE

HcCreateThread PROC
	mov r10, rcx
	mov eax, sciCreateThread
	syscall
	ret
HcCreateThread ENDP

ELSE
; 32bit

EXTERNDEF C sciCreateThread:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcCreateThread PROC
	mov eax, sciCreateThread
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
HcCreateThread ENDP

ENDIF

END