; Hc/NtGdiDvpGetVideoPortOutputFormats
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciGdiDvpGetVideoPortOutputFormats:DWORD

.DATA
.CODE

HcGdiDvpGetVideoPortOutputFormats PROC
	mov r10, rcx
	mov eax, sciGdiDvpGetVideoPortOutputFormats
	syscall
	ret
HcGdiDvpGetVideoPortOutputFormats ENDP

ELSE
; 32bit

EXTERNDEF C sciGdiDvpGetVideoPortOutputFormats:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcGdiDvpGetVideoPortOutputFormats PROC
	mov eax, sciGdiDvpGetVideoPortOutputFormats
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
HcGdiDvpGetVideoPortOutputFormats ENDP

ENDIF

END