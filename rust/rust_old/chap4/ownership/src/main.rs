fn main() {
    println!("Hello, world!");

    let s = String::from("hello");

    let mut s = String::from("hello");
    s.push_str(", world");

    println!("{}",s);
    
    // Variables and Data Interacting with Move
    let x = 5;
    let y = x;

    let s1 = String::from("hello");
    let s2 = s1;
    // println!("s1: {s1}");

    // Variables and Data Interacting with Clone
    let s1 = String::from("hello");
    let s2 = s1.clone();
    println!("s1 = {}, s2 = {}", s1, s2);

    // Stack-Only Data: Copy
    // Ownership and Functions^

  let s = String::from("hello");  // s comes into scope

    takes_ownership(s);             // s's value moves into the function...
                                    // ... and so is no longer valid here

    let x = 5;                      // x comes into scope

    makes_copy(x);                  // x would move into the function,
                                    // but i32 is Copy, so it's okay to still
                                    // use x afterward
    // println!("{}", s);
     println!("{}", x);

    // Return Values and Scope
    let s1 = gives_ownership();

    let s2 = String::from("hello");
    println!("s2: {s2}");
    
    let s3 = take_and_gives_back(s2);
    // println!("s2: {s2}");
    println!("s3: {s3}");

} 
  // Here, x goes out of scope, then s. But because s's value was moved, nothing
  // special happens.

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("{}", some_string);
} 
  // Here, some_string goes out of scope and `drop` is called. The backing
  // memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("{}", some_integer);
} 
  // Here, some_integer goes out of scope. Nothing special happens.

fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string
}

fn take_and_gives_back(a_string: String) -> String {
    a_string
}