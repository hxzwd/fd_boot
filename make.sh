nasm -f bin src/boot.asm -o boot.bin
nasm -f bin src/kernel.asm -o kernel.bin
rm fd.img
dd if=/dev/zero of=tail.bin bs=512 count=2862
dd if=boot.bin >> fd.img
dd if=kernel.bin >> fd.img
dd if=tail.bin >> fd.img
date
