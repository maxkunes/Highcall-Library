; Hc/NtSetIRTimer
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciSetIRTimer:DWORD

.DATA
.CODE

HcSetIRTimer PROC
	mov r10, rcx
	mov eax, sciSetIRTimer
	syscall
	ret
HcSetIRTimer ENDP

ELSE
; 32bit

EXTERNDEF C sciSetIRTimer:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcSetIRTimer PROC
	mov eax, sciSetIRTimer
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
HcSetIRTimer ENDP

ENDIF

END