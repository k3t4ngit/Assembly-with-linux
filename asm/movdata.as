#moving_data using mov

.data
	HW:
			.ascii "Hello World! \n"

	ByetLoc:

			.byte 10
	
	Int32:

			.int 2

	Int16:

			.short 3

	IntArray:

			.int 10,20,30,40,50

	New:

			.int 3


.text


.globl _start


_start:
		nop
	# 1) immediate value to registers
		#Usage format movx $value,destination
		
		movl $10,%eax

	# 2) immediate value to memlocation
		#Usage format movx $value,memloc
		#suppose we have memloc: 
		#				.byte 0
		# to mov a data into this location wll use 
		#movb $10,memloc
		#note that we have used movb bco the data_type of that location is byte .

		movw $12,Int16

	# 3) between registers
		#Usage format movX source,destination where X=l,w,b
		#just copies value of source into destination i,e. source dont change
		#mov a 32-bit value movl %eax,%ebx i,e. l=long
		#mov a 16-bit value movw %ax,%bx i,e. w=word
		#mov a 8-bit value movb %ah,%bh i,e. b=byte

		movl %eax,%ebx

	# 4) between memory_location and registers
		#Usage format movx memlocation(i,e. labelof the location),destination
		# movl memloc,%eax
		#movl %eax,memloc

		movl Int32,%eax
		movl %eax,New

	# 5) moving data to indexed memory location
		#now if there is an array in the above memloc like
		#memloc :
		# 		.int 10,20,30,40,50
		#and we want to move any value on the 3rd place of the array then we have to use indexed address
		#which is BaseAddress(Offset,Index,Size)
		#Offset =position from where to start counting 
		#offset and index should be in the form of registers 
		#index=how much to count 
		#size =how much mem to grab from where the counting ends  
		#for the 3rd place in above array the indexed addrs will be memloc(0,2,4)
		#it starts counting from position 0 i,e. 10 and goes to 20 coz the index is 2
		#and grabs 4 mem blocks where mem block for 20 ends
		#movl %eax,memloc(0,2,4) copies the value of eax on the place of 30 	
		#the 
		movl $0,%ecx
		movl $2,%edi

		movl $22,IntArray(%ecx,%edi,4)
		int $0x80
	# Exit 
		movl $1,%eax
		movl $0,%ebx
		int $0x80
		ret
