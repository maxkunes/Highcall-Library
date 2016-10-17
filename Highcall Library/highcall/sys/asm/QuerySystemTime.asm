; Hc/NtQuerySystemTime
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciQuerySystemTime:DWORD

.DATA
.CODE

HcQuerySystemTime PROC
	mov r10, rcx
	mov eax, sciQuerySystemTime
	syscall
	ret
HcQuerySystemTime ENDP

ELSE
; 32bit

EXTERNDEF C sciQuerySystemTime:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcQuerySystemTime PROC
	mov eax, sciQuerySystemTime
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
HcQuerySystemTime ENDP

ENDIF

END