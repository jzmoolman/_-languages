fn main() {
    let mut s = String::from("hello");

    s.push_str(", world");

    println!("{s}");
    take_ownership(s);
    // println!("{s}"); => error

    let x = 5;
    makes_copy(x);
    println!("{x}");

    // Return Values and Scope
    let s1 = gives_ownership();

    let s2 = String::from("hello");

    let s3 = take_and_gives_back(s2);


}

fn take_ownership(some_string: String) {
    println!("{some_string}");
}

fn makes_copy(some_integer: i32) {
    println!("{some_integer}");
}

fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string
}

fn take_and_gives_back(a_string: String) -> String {
   a_string
}
