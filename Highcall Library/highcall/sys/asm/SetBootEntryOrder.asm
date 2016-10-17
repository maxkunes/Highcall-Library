; Hc/NtSetBootEntryOrder
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciSetBootEntryOrder:DWORD

.DATA
.CODE

HcSetBootEntryOrder PROC
	mov r10, rcx
	mov eax, sciSetBootEntryOrder
	syscall
	ret
HcSetBootEntryOrder ENDP

ELSE
; 32bit

EXTERNDEF C sciSetBootEntryOrder:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcSetBootEntryOrder PROC
	mov eax, sciSetBootEntryOrder
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
HcSetBootEntryOrder ENDP

ENDIF

END