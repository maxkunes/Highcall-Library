; Hc/NtGdiEnumFontClose
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciGdiEnumFontClose:DWORD

.DATA
.CODE

HcGdiEnumFontClose PROC
	mov r10, rcx
	mov eax, sciGdiEnumFontClose
	syscall
	ret
HcGdiEnumFontClose ENDP

ELSE
; 32bit

EXTERNDEF C sciGdiEnumFontClose:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcGdiEnumFontClose PROC
	mov eax, sciGdiEnumFontClose
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
HcGdiEnumFontClose ENDP

ENDIF

END