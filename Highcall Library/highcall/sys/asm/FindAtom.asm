; Hc/NtFindAtom
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciFindAtom:DWORD

.DATA
.CODE

HcFindAtom PROC
	mov r10, rcx
	mov eax, sciFindAtom
	syscall
	ret
HcFindAtom ENDP

ELSE
; 32bit

EXTERNDEF C sciFindAtom:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcFindAtom PROC
	mov eax, sciFindAtom
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
HcFindAtom ENDP

ENDIF

END