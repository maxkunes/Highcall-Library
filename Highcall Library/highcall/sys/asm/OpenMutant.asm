; Hc/NtOpenMutant
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciOpenMutant:DWORD

.DATA
.CODE

HcOpenMutant PROC
	mov r10, rcx
	mov eax, sciOpenMutant
	syscall
	ret
HcOpenMutant ENDP

ELSE
; 32bit

EXTERNDEF C sciOpenMutant:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcOpenMutant PROC
	mov eax, sciOpenMutant
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
HcOpenMutant ENDP

ENDIF

END