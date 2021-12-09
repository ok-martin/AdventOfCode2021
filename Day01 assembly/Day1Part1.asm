.LC0: .string "r"
.LC1: .string "input.txt"
.LC2: .string "increased %d"

main:
	push    rbp
	mov     rbp, rsp
	sub     rsp, 48
	mov     QWORD PTR [rbp-32], 0
	mov     QWORD PTR [rbp-40], 0
	mov     DWORD PTR [rbp-12], 0			; currNumber
	mov     DWORD PTR [rbp-4], 0			; prevNumber
	mov     DWORD PTR [rbp-16], 0			; NOT USED BUT WHEN I TAKE IT OUT ALL HELL BREAKS LOOSE
	mov     DWORD PTR [rbp-8], 0			; increased
	mov     esi, OFFSET FLAT:.LC0
	mov     edi, OFFSET FLAT:.LC1
	call    fopen
	mov     QWORD PTR [rbp-24], rax
	jmp     .L2
.L4:										; loop
	mov     rax, QWORD PTR [rbp-32]
	mov     rdi, rax
	call    atoi							; syscall to convert string to int
	mov     DWORD PTR [rbp-12], eax			; compare currNumber > prevNumber
	mov     eax, DWORD PTR [rbp-12]
	cmp     eax, DWORD PTR [rbp-4]
	jle     .L3
	add     DWORD PTR [rbp-8], 1			; increased++
.L3:
	mov     eax, DWORD PTR [rbp-12]			; assign prevNumber = currNumber
	mov     DWORD PTR [rbp-4], eax
.L2:
	mov     rdx, QWORD PTR [rbp-24]
	lea     rcx, [rbp-40]
	lea     rax, [rbp-32]
	mov     rsi, rcx
	mov     rdi, rax
	call    getline							; syscall
	cmp     rax, -1							; read until no length
	setne   al
	test    al, al
	jne     .L4								; back to start of the loop
	sub     DWORD PTR [rbp-8], 1			; - 1 because of the initial read with zero
	mov     eax, DWORD PTR [rbp-8]			; print the increased
	mov     esi, eax
	mov     edi, OFFSET FLAT:.LC2
	mov     eax, 0
	call    printf							; sys call
	mov     edi, 0
	call    exit