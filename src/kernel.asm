use16
org	0x500
A	mov	ah, 0
	mov	si, kernel_hello
	int	0xf0
B	jmp	B

kernel_hello db	'hello from kernel.bin', 13, 10, 00

times 512 * 17 - ($ - $$) db 0
