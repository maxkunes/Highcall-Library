; Hc/NtSetContextThread
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciSetContextThread:DWORD

.DATA
.CODE

HcSetContextThread PROC
	mov r10, rcx
	mov eax, sciSetContextThread
	syscall
	ret
HcSetContextThread ENDP

ELSE
; 32bit

EXTERNDEF C sciSetContextThread:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcSetContextThread PROC
	mov eax, sciSetContextThread
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
HcSetContextThread ENDP

ENDIF

END