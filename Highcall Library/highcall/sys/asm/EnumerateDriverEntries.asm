; Hc/NtEnumerateDriverEntries
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciEnumerateDriverEntries:DWORD

.DATA
.CODE

HcEnumerateDriverEntries PROC
	mov r10, rcx
	mov eax, sciEnumerateDriverEntries
	syscall
	ret
HcEnumerateDriverEntries ENDP

ELSE
; 32bit

EXTERNDEF C sciEnumerateDriverEntries:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcEnumerateDriverEntries PROC
	mov eax, sciEnumerateDriverEntries
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
HcEnumerateDriverEntries ENDP

ENDIF

END