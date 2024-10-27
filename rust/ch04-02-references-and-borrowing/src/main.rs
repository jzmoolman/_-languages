fn main() {
    let mut s1 = String::from("hello");

    let len = calcualte_length(&s1);

    println!("The length of 's1' is {len}");

    // Mutable References
    change(&mut s1);
    println!("{s1}");

   // Dangling References
    let reference_to_nothing = dangle();

    // The Slice Type
    kj


}

fn calcualte_length(s: &String) -> usize {
    s.len()
}

fn change(some_string: &mut String) {
   some_string.push_str(", world");
}

// fn dangle() -> &String {
//     let s = String::from("hello");
//     &s
// }

fn first_word(s: &String) -> usize {
    let bytes = s.as_bytes();
    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }
    s.len()
}