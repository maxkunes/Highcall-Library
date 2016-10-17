; Hc/NtGetCurrentProcessorNumber
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciGetCurrentProcessorNumber:DWORD

.DATA
.CODE

HcGetCurrentProcessorNumber PROC
	mov r10, rcx
	mov eax, sciGetCurrentProcessorNumber
	syscall
	ret
HcGetCurrentProcessorNumber ENDP

ELSE
; 32bit

EXTERNDEF C sciGetCurrentProcessorNumber:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcGetCurrentProcessorNumber PROC
	mov eax, sciGetCurrentProcessorNumber
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
HcGetCurrentProcessorNumber ENDP

ENDIF

END