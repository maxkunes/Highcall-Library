; Hc/NtSubscribeWnfStateChange
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciSubscribeWnfStateChange:DWORD

.DATA
.CODE

HcSubscribeWnfStateChange PROC
	mov r10, rcx
	mov eax, sciSubscribeWnfStateChange
	syscall
	ret
HcSubscribeWnfStateChange ENDP

ELSE
; 32bit

EXTERNDEF C sciSubscribeWnfStateChange:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcSubscribeWnfStateChange PROC
	mov eax, sciSubscribeWnfStateChange
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
HcSubscribeWnfStateChange ENDP

ENDIF

END