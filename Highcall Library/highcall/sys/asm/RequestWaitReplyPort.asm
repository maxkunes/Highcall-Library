; Hc/NtRequestWaitReplyPort
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciRequestWaitReplyPort:DWORD

.DATA
.CODE

HcRequestWaitReplyPort PROC
	mov r10, rcx
	mov eax, sciRequestWaitReplyPort
	syscall
	ret
HcRequestWaitReplyPort ENDP

ELSE
; 32bit

EXTERNDEF C sciRequestWaitReplyPort:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcRequestWaitReplyPort PROC
	mov eax, sciRequestWaitReplyPort
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
HcRequestWaitReplyPort ENDP

ENDIF

END