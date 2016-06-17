extern crate rand; 
extern crate rmp; 
use rmp::rmp::{Integer};
use rand::os::OsRng;
//use std::rand::OsRng;

fn main() {
    let mut r = OsRng::new().unwrap();
	let myPrime = Integer::generate_prime(4, &mut r); 
	println!("{}", myPrime); 
}
