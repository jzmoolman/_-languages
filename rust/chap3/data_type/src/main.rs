#![allow(unused)]
use std::io;
fn main() {
    let guess: u32 = "42".parse()
        .expect("Not a numner");
    println!("Hello, world!");

    // Compound Types
    let tup: (i32, f64, u8) = (500, 6.4,1);
    let (x, y, z) = tup;

    println!("The value of y is: {y}");
    let xx = tup.0;
    let yy = tup.1;
    let zz = tup.2;

    println!("xx: {xx}");
    println!("yy: {yy}");
    println!("zz: {zz}");

    //emty tuple
    let empty = ();
    // println!("empty tuple: {empty}");

   // Array types
   let a = [1,2,3,4,5];

   let months = ["January", "February", "March", "April", "May", "June", "July",
   "August", "September", "October", "November", "December"];

    let a: [i32; 5] = [1, 2, 3, 4, 5];

    let a = [1, 2, 3, 4, 5];

    println!("Please enter an array index.");

    let mut index = String::new();

    io::stdin()
        .read_line(&mut index)
        .expect("Failed to read line");

    let index: usize = index
        .trim()
        .parse()
        .expect("Index entered was not a number");

    let element = a[index];

    println!("The value of the element at index {index} is: {element}");    

}
