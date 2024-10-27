fn main() {
    let mut s = String::from("hello");
    println!("{}", s);
    change(&mut s);
    println!("{}", s);

    let r1 = &s;
    println!("{}", r1);
    let r2 = &s;
    println!("{}", r2);
    println!("{}", r1);

    let reference_to_nothing = dangle();
}

fn change(str: &mut String) {
    str.push_str(", world");
}

fn dangle() -> &String {
    let s = String::from("Hello");
    &s
}
