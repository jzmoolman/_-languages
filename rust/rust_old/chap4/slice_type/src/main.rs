fn main() {
    // let mut s = String::from("Hello, world!");
    // let word = first_word(&s);
    // s.clear();
    // println!("word: {word}");

    // // Slice
    // let hello = &s[0..5];
    // let world = &s[6..11];

    let mut s = String::from("hello world!");
    let word = first_wordv2(&s);
    println!("first word: {}", word);
    // s.clear();
    // println!("first word: {}", word);
    
    let my_string = String::from("hello world");
    // `first_word` works on slices of `String`s, whether partial or whole
    let word = first_wordv3(&my_string[0..6]);
    let word = first_wordv3(&my_string[..]);
    // `first_word` also works on references to `String`s, which are equivalent
    // to whole slices of `String`s
    let word = first_wordv3(&my_string);

    let my_string_literal = "hello world";

    // `first_word` works on slices of string literals, whether partial or whole
    let word = first_wordv3(&my_string_literal[0..6]);
    let word = first_wordv3(&my_string_literal[..]);

    // Because string literals *are* string slices already,
    // this works too, without the slice syntax!
    let word = first_wordv3(my_string_literal);



    // Other  Slice

    let a = [1, 2, 3, 4, 5];
    let slice = &a[1..3];

    assert_eq!(slice, &[2, 3]);


   
}

fn first_word(s: &String) -> usize {

    let bytes = s.as_bytes();
    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }
    s.len()
}

fn first_wordv2(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[..i];
        }
    }
    &s[..]
}

fn first_wordv3(s: &str) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[..i];
        }
    }
    &s[..]
}