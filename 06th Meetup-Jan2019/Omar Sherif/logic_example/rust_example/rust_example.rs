#![crate_type="staticlib"]

#[no_mangle]
pub extern "system" fn rust_add(a: i32, b: i32) -> i32 {
    a + b
}