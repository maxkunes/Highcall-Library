; Hc/NtUnsubscribeWnfStateChange
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciUnsubscribeWnfStateChange:DWORD

.DATA
.CODE

HcUnsubscribeWnfStateChange PROC
	mov r10, rcx
	mov eax, sciUnsubscribeWnfStateChange
	syscall
	ret
HcUnsubscribeWnfStateChange ENDP

ELSE
; 32bit

EXTERNDEF C sciUnsubscribeWnfStateChange:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcUnsubscribeWnfStateChange PROC
	mov eax, sciUnsubscribeWnfStateChange
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
HcUnsubscribeWnfStateChange ENDP

ENDIF

END