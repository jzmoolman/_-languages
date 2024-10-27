fn main() {
    println!("Hello, world!");
    let s1 = String::from("hello");
    let len = calcualte_length(&s1);
    println!("The length of '{}' is {}", s1, len);

    // Mutable References    
    let mut s = String::from("hello");
    change(&mut s);
    println!("s: {}", s);


    //
    let mut s = String::from("hello");

    let r1 = &s; // no problem
    let r2 = &s; // no problem
    println!("{} and {}", r1, r2);
    // variables r1 and r2 will not be used after this point

    let r3 = &mut s; // no problem
    println!("{}", r3);
    // println!("{}", r2); this cause error

}

fn calcualte_length(s: &String)->usize {
    s.len()
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");

}
