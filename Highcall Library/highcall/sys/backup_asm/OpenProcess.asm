; OpenProcess

IFDEF RAX
; 64bit

EXTERNDEF sciOpenProcess:DWORD
   
.DATA
.CODE
 
HcOpenProcess PROC 
	mov r10, rcx
	mov eax, sciOpenProcess
	syscall
	ret
HcOpenProcess ENDP 

ELSE
; 32bit

EXTERNDEF C sciOpenProcess:DWORD

.586              
.MODEL FLAT, C   
.STACK         
.DATA
.CODE
 
ASSUME FS:NOTHING	
 
HcOpenProcess PROC 
	mov eax, sciOpenProcess
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
HcOpenProcess ENDP 

ENDIF

END
