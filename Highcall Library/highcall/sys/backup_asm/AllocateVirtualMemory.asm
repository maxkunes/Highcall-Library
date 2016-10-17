; AllocateVirtualMemory

IFDEF RAX
; 64bit

EXTERNDEF sciAllocateVirtualMemory:DWORD

.DATA
.CODE
 
HcAllocateVirtualMemory PROC 
	mov r10, rcx
	mov eax, sciAllocateVirtualMemory
	syscall
	ret
HcAllocateVirtualMemory ENDP 

ELSE
; 32bit

EXTERNDEF C sciAllocateVirtualMemory:DWORD

.586              
.MODEL FLAT, C   
.STACK         
.DATA
.CODE
 
ASSUME FS:NOTHING	
 
HcAllocateVirtualMemory PROC 
	mov eax, sciAllocateVirtualMemory
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
HcAllocateVirtualMemory ENDP 

ENDIF

END
