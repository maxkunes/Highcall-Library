; Hc/NtMapUserPhysicalPagesScatter
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciMapUserPhysicalPagesScatter:DWORD

.DATA
.CODE

HcMapUserPhysicalPagesScatter PROC
	mov r10, rcx
	mov eax, sciMapUserPhysicalPagesScatter
	syscall
	ret
HcMapUserPhysicalPagesScatter ENDP

ELSE
; 32bit

EXTERNDEF C sciMapUserPhysicalPagesScatter:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcMapUserPhysicalPagesScatter PROC
	mov eax, sciMapUserPhysicalPagesScatter
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
HcMapUserPhysicalPagesScatter ENDP

ENDIF

END