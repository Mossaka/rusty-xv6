XV6PATH ?= ../../splvm/xv6-labs-utils-2021
init:
	rustup target add riscv64gc-unknown-none-elf

build:
	rustc src/lib.rs --emit=obj --target riscv64gc-unknown-none-elf
	riscv64-unknown-elf-ld -z max-page-size=4096 -N -e main -Ttext 0 -o _rusty lib.o $(XV6PATH)/user/printf.o $(XV6PATH)/user/usys.o $(XV6PATH)/user/ulib.o $(XV6PATH)/user/umalloc.o

clean:
	rm *.o _rusty