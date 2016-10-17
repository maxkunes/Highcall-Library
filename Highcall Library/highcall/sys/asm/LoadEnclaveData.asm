; Hc/NtLoadEnclaveData
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciLoadEnclaveData:DWORD

.DATA
.CODE

HcLoadEnclaveData PROC
	mov r10, rcx
	mov eax, sciLoadEnclaveData
	syscall
	ret
HcLoadEnclaveData ENDP

ELSE
; 32bit

EXTERNDEF C sciLoadEnclaveData:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcLoadEnclaveData PROC
	mov eax, sciLoadEnclaveData
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
HcLoadEnclaveData ENDP

ENDIF

END