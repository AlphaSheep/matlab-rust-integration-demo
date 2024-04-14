use std::ffi::{c_ulonglong, c_char, CStr, CString};

use crate::{add, do_something_to_string, Point};


/*
 Simple FFI for adding two numbers
*/

#[no_mangle]
pub extern "C" fn add_ffi(left: c_ulonglong, right: c_ulonglong ) -> c_ulonglong  {
    add(left as usize, right as usize)
    .try_into().unwrap()
}


/*
 Accepting and returning a string
*/

#[no_mangle]
pub extern "C" fn do_something_to_string_ffi(input: *const c_char) -> *mut *mut c_char {
    let input_str = unsafe { CStr::from_ptr(input) }
        .to_str()
        .expect("Invalid UTF-8 in input");

    let output = do_something_to_string(input_str);

    let c_string = CString::new(output).expect("Could not convert output to CString");
    let pointer = Box::into_raw(Box::new(c_string.into_raw()));
    pointer
}

#[no_mangle]
pub extern "C" fn free_string_pointer(pointer: *mut *mut c_char) {
    unsafe {
        let boxed_pointer = Box::from_raw(pointer);
        let c_string = CString::from_raw(*boxed_pointer);
        drop(c_string);
        drop(boxed_pointer);
    }
}


/*
 Working with structs
*/

#[repr(C)]
pub struct PointFFI {
    pub x: f64,
    pub y: f64,
}

#[no_mangle]
pub extern "C" fn distance_between_ffi(p1: &PointFFI, p2: &PointFFI) -> f64 {
    let p1 = &Point {
        x: p1.x,
        y: p1.y,
    };
    let p2 = &Point {
        x: p2.x,
        y: p2.y,
    };
    p1.distance_to(p2)
}


/*
 Accepting numeric arrays
*/

#[no_mangle]
pub extern "C" fn do_something_with_array(values: *const f64, n: c_ulonglong) -> f64 {
    let values = unsafe { std::slice::from_raw_parts(values, n as usize) };
    values.iter().sum()
}
