# Rust on Xv6-RISC-V
## How to run user Rust program in Xv6-RISC-V

- Run `make init` to add rist-v target to rustc 
- Run `make build` to build the program.

  > It will generate a `_rusty` binary, statically linked with the Xv6-RISC-V user lib.

- Move `_rusty` binary to the `$(XV6_PATH)/user` directory.
- Run `mkfs/mkfs fs.img README  user/xargstest.sh user/_cat ... user/_rusty` where `...` is filled with all user programs.
- Run `qemu-system-riscv64 -machine virt -bios none -kernel kernel/kernel -m 128M -smp 3 -nographic -drive file=fs.img,if=none,format=raw,id=x0 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0` to start QEMU emulator that runs Xv6 kernel.
