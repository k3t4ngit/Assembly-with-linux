.data 
	HW:
		.ascii "K10 \n"

	New:
		.ascii
			"K10 Hacker!"
.text

.globl _start

	_start:
			movl $HW,%eax
			movl $New,(%eax)
			int $0x80
			movl $1,%eax
			movl $0,%ebx
			int $0x80
		ret