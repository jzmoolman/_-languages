fn main() {
    // let _s = "hello";

    // let mut s = String::from("hello");

    // s.push_str(", world");

    // println!("{}", s);

    // let s1 = String::from("hello");
    // let s2 = s1;

    // println!("{}", s2);
    // println!("{}", s1);

    //     let s1 = String::from("hello");
    //     take_ownership(s1);
    //     println!("{}", s1);

    //     let x = 5;
    //     makes_copy(x);
    //     println!("{}", x);
    // let s1 = gives_onwership();

    /* new section */
    let s1 = String::from("hello");
    let (s2, len) = calculate_length(s1);
    println!("The length of '{}' is {}.", s2, len);
}

fn calculate_length(s: String) -> (String, usize) {
    let lenght = s.len();
    return (s, lenght);
}

// fn take_ownership(some_str: String) {
//     println!("{}", some_str);
// }

// fn makes_copy(some_interget: i32) {
//     println!("{}", some_interget);
// }

// fn gives_onwership() -> String {
//     let some_str = String::from("TEST");
//     some_str
// }
