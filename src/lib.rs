#![no_std]
#![no_main]
use core::panic::PanicInfo;

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}

extern "C" {
    fn printf(s: *const u8);
    fn exit(status: i32) -> i32;
}

#[no_mangle]
pub extern "C" fn main(argc: i32, argv: *const *const u8) -> i32 {
    unsafe {
        printf("hello world from Rust!!\n".as_bytes().as_ptr());
        exit(0_i32)
    }
}
