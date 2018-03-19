extern crate base64;
extern crate hmac;
extern crate sha2;

use std::mem;
use std::ffi::CString;
use std::os::raw::{c_char, c_void};
use hmac::Mac;

#[no_mangle]
pub extern "C" fn alloc(size: usize) -> *mut c_void {
    let mut buf = Vec::with_capacity(size);
    let ptr = buf.as_mut_ptr();
    mem::forget(buf);
    return ptr as *mut c_void;
}

#[no_mangle]
pub extern "C" fn dealloc_str(ptr: *mut c_char) {
    unsafe {
        let _ = CString::from_raw(ptr);
    }
}

#[no_mangle]
pub fn to_sign(ptr: *mut c_char) -> *mut c_char {
    let s: String;

    unsafe {
        s = CString::from_raw(ptr).into_string().unwrap();
    }
    let key = "1343d198b510a0315db1c03f3aa0e32418b7a743f8e4b47cbff670601345cf75";
    let mut mac = hmac::Hmac::<sha2::Sha256>::new(key.as_bytes()).unwrap();
    let bytes = s.as_bytes();
    mac.input(bytes);
    let digest = mac.result();
    let c_string = CString::new(base64::encode(&digest.code().to_vec())).unwrap();
    c_string.into_raw()
}
