; Hc/NtListenPort
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciListenPort:DWORD

.DATA
.CODE

HcListenPort PROC
	mov r10, rcx
	mov eax, sciListenPort
	syscall
	ret
HcListenPort ENDP

ELSE
; 32bit

EXTERNDEF C sciListenPort:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcListenPort PROC
	mov eax, sciListenPort
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
HcListenPort ENDP

ENDIF

END