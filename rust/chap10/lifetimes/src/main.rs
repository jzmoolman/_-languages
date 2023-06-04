// struct ImportantExceprt<'a> {
//     part: &'a str,
// }

struct ImportantExceprt {
    part: &str,
}

fn main() {
    println!("Hello, world!");
    // let r;
    {
        let x = 5;
        // r = &x

    }   
    // println!("r: {}", r);

    let string1 = String::from("abcd");
    let result;
    {
        let string2 = "xyz";

        result = longest(string1.as_str(), string2);
        println!("The longest string is {}", result);
    }
    // println!("The longest string is {}", result);

    // Lifetime Annotations in Struct Definitions
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().expect("Could not find a '.'");
    let i = ImportantExceprt {
        part: first_sentence,
    };

    println!("first: {}", i.part);


}

fn longest<'a>(x: &'a str, y:&'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}