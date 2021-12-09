.LC0: .string "r"
.LC1: .string "Day1Input.txt"				; inpute file
.LC2: .string "increased %d"				; log the response

main:
	push    rbp
	mov     rbp, rsp
	push    rbx
	sub     rsp, 40056						
	mov     QWORD PTR [rbp-48], 0			; numbers
	mov     QWORD PTR [rbp-56], 0			; sums
	mov     DWORD PTR [rbp-20], 0			; index counter
	mov     DWORD PTR [rbp-24], 0			; increased counter
	
	mov     esi, OFFSET FLAT:.LC0			; read command
	mov     edi, OFFSET FLAT:.LC1			; text file
	call    fopen							; sys call to open the file
	mov     QWORD PTR [rbp-40], rax
	jmp     .L2
.L4:										; grab 3 numbers and sum
	mov     rcx, QWORD PTR [rbp-48]
	mov     eax, DWORD PTR [rbp-20]
	movsx   rdx, eax
	imul    rdx, rdx, 1431655766			; idk how big it has to be
	shr     rdx, 32							
	mov     esi, eax
	sar     esi, 31
	mov     ebx, edx
	sub     ebx, esi
	mov     edx, ebx
	add     edx, edx
	add     edx, ebx
	sub     eax, edx
	mov     ebx, eax
	mov     rdi, rcx
	call    atoi							; convert to int
	movsx   rdx, ebx
	mov     DWORD PTR [rbp-68+rdx*4], eax
	cmp     DWORD PTR [rbp-20], 2
	jle     .L3
	mov     edx, DWORD PTR [rbp-68]
	mov     eax, DWORD PTR [rbp-64]
	lea     ecx, [rdx+rax]
	mov     edx, DWORD PTR [rbp-60]
	mov     eax, DWORD PTR [rbp-20]
	sub     eax, 2
	add     edx, ecx
	cdqe
	mov     DWORD PTR [rbp-40064+rax*4], edx
.L3:
	add     DWORD PTR [rbp-20], 1				; increment index
.L2:											; read line
	mov     rdx, QWORD PTR [rbp-40]
	lea     rcx, [rbp-56]
	lea     rax, [rbp-48]
	mov     rsi, rcx
	mov     rdi, rax
	call    getline								; syscall
	cmp     rax, -1								; read until no length
	setne   al
	test    al, al
	jne     .L4
	mov     DWORD PTR [rbp-28], 1				
	jmp     .L5
.L7:											; go from 1 to index, compare number and number before
	mov     eax, DWORD PTR [rbp-28]
	cdqe
	mov     edx, DWORD PTR [rbp-40064+rax*4]
	mov     eax, DWORD PTR [rbp-28]
	sub     eax, 1								; to get the number before
	cdqe
	mov     eax, DWORD PTR [rbp-40064+rax*4]
	cmp     edx, eax
	jle     .L6
	add     DWORD PTR [rbp-24], 1				; increment increased
.L6:
	add     DWORD PTR [rbp-28], 1				; ii++
.L5:
	mov     eax, DWORD PTR [rbp-20]				; go up to index - 2
	sub     eax, 2
	cmp     DWORD PTR [rbp-28], eax				; cond to check for index - 2
	jl      .L7									; jump to start of the loop

	mov     eax, DWORD PTR [rbp-24]				; grab the how many increased
	mov     esi, eax
	mov     edi, OFFSET FLAT:.LC2				; print message
	mov     eax, 0
	call    printf								; spit out the answer
	mov     edi, 0
	call    exit