; Hc/NtUserInjectKeyboardInput
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciUserInjectKeyboardInput:DWORD

.DATA
.CODE

HcUserInjectKeyboardInput PROC
	mov r10, rcx
	mov eax, sciUserInjectKeyboardInput
	syscall
	ret
HcUserInjectKeyboardInput ENDP

ELSE
; 32bit

EXTERNDEF C sciUserInjectKeyboardInput:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcUserInjectKeyboardInput PROC
	mov eax, sciUserInjectKeyboardInput
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
HcUserInjectKeyboardInput ENDP

ENDIF

END