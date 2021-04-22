section	.text
			extern ___error
			global	_ft_read

_ft_read:								; fd = rdi, buffer = rsi, bytes = rdx
			mov		rax, 0x2000003
			syscall		
			jc		exit				; if there is an error goto exit
			ret
exit:
			push	rax ; save errno value
			call	___error ; rax is now points to external variable errno.
			pop		QWORD[rax]
			mov		rax , -1
			ret
