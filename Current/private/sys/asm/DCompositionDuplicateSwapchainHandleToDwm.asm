; Hc/NtDCompositionDuplicateSwapchainHandleToDwm
; This file was automatically generated by Highcall's syscall generator.

IFDEF RAX
; 64bit

EXTERNDEF sciDCompositionDuplicateSwapchainHandleToDwm:DWORD

.DATA
.CODE

HcDCompositionDuplicateSwapchainHandleToDwm PROC
	mov r10, rcx
	mov eax, sciDCompositionDuplicateSwapchainHandleToDwm
	syscall
	ret
HcDCompositionDuplicateSwapchainHandleToDwm ENDP

ELSE
; 32bit

EXTERNDEF C sciDCompositionDuplicateSwapchainHandleToDwm:DWORD

.586			  
.MODEL FLAT, C   
.STACK
.DATA
.CODE

ASSUME FS:NOTHING

HcDCompositionDuplicateSwapchainHandleToDwm PROC
	mov eax, sciDCompositionDuplicateSwapchainHandleToDwm
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
HcDCompositionDuplicateSwapchainHandleToDwm ENDP

ENDIF

END