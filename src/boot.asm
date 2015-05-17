use16
org	0x7c00
A	cli
	mov	ax, cs
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov 	gs, ax
	mov	ax, 0x7c00
	mov	sp, ax
	sti
	mov	ax, 0x0002
	int	0x10
	mov	ah, 02
	mov	bx, 0x500
	xor	dx, dx
	mov	cx, 0002
	mov	al, 17
	int	0x13
	
	mov	word [0x03c0], iF0
	mov	word [0x03c2], 0000
	
	mov	si, hello_msg
	mov	ah, 0x0
	int	0xf0
	
	jmp	0x500

hello_msg	db 'POTNUY', 13, 10, 00

iF0:
	cmp	ah, 0
	jz	iF0_0
iF0_E:
	iret
iF0_0	push	ax
	mov	ah, 0x0e
.A	lodsb
	cmp	al, 00
	jz	.D
	int	0x10
	jmp	.A
.D	pop	ax
	iret

times 510 - ($ - $$) db 0
db 0x55
db 0xaa
