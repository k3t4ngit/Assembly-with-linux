
.data
	
	HW:
		.ascii "Hello World\n"
.text
	.globl _start
	_start:
			nop
			movl $4, %eax
			movl $1, %ebx
			movl $HW, %ecx
			movl $13, %edx
			int $0x80
			movl $1, %eax
			movl $0, %ebx
			int $0x80 

		ret
