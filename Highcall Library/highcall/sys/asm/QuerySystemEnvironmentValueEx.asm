; Hc/NtQuerySystemEnvironmentValueEx
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciQuerySystemEnvironmentValueEx:DWORD

.DATA
.CODE

HcQuerySystemEnvironmentValueEx PROC
	mov r10, rcx
	mov eax, sciQuerySystemEnvironmentValueEx
	syscall
	ret
HcQuerySystemEnvironmentValueEx ENDP

ELSE
; 32bit

EXTERNDEF C sciQuerySystemEnvironmentValueEx:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcQuerySystemEnvironmentValueEx PROC
	mov eax, sciQuerySystemEnvironmentValueEx
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
HcQuerySystemEnvironmentValueEx ENDP

ENDIF

END