; UnlockVirtualMemory (HANDLE)

IFDEF RAX
; 64bit
   
EXTERNDEF sciUnlockVirtualMemory:DWORD

.DATA
.CODE
 
HcUnlockVirtualMemory PROC 
	mov r10, rcx
	mov eax, sciUnlockVirtualMemory
	syscall
	ret
HcUnlockVirtualMemory ENDP 

ELSE
; 32bit

EXTERNDEF C sciUnlockVirtualMemory:DWORD

.586              
.MODEL FLAT, C   
.STACK         
.DATA
.CODE
 
ASSUME FS:NOTHING	
 
HcUnlockVirtualMemory PROC 
	mov eax, sciUnlockVirtualMemory
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
HcUnlockVirtualMemory ENDP 

ENDIF

END