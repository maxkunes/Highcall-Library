; SuspendProcess

IFDEF RAX
; 64bit
   
EXTERNDEF sciSuspendProcess:DWORD

.DATA
.CODE
 
HcSuspendProcess PROC 
	mov r10, rcx
	mov eax, sciSuspendProcess
	syscall
	ret
HcSuspendProcess ENDP 

ELSE
; 32bit

EXTERNDEF C sciSuspendProcess:DWORD

.586              
.MODEL FLAT, C   
.STACK         
.DATA
.CODE
 
ASSUME FS:NOTHING	
 
HcSuspendProcess PROC 
	mov eax, sciSuspendProcess
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
HcSuspendProcess ENDP 

ENDIF

END
