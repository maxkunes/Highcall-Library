; Hc/NtDeleteValueKey
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciDeleteValueKey:DWORD

.DATA
.CODE

HcDeleteValueKey PROC
	mov r10, rcx
	mov eax, sciDeleteValueKey
	syscall
	ret
HcDeleteValueKey ENDP

ELSE
; 32bit

EXTERNDEF C sciDeleteValueKey:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcDeleteValueKey PROC
	mov eax, sciDeleteValueKey
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
HcDeleteValueKey ENDP

ENDIF

END