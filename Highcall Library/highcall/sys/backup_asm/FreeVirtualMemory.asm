; FreeVirtualMemory

IFDEF RAX
; 64bit

EXTERNDEF sciFreeVirtualMemory:DWORD
   
.DATA
.CODE
 
HcFreeVirtualMemory PROC 
	mov r10, rcx
	mov eax, sciFreeVirtualMemory
	syscall
	ret
HcFreeVirtualMemory ENDP 

ELSE
; 32bit

EXTERNDEF C sciFreeVirtualMemory:DWORD

.586              
.MODEL FLAT, C   
.STACK         
.DATA
.CODE
 
ASSUME FS:NOTHING	
 
HcFreeVirtualMemory PROC 
	mov eax, sciFreeVirtualMemory
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
HcFreeVirtualMemory ENDP 

ENDIF

END