fn main() {
    // let v1: Vec<i32> = Vec::new();
    let v2 = vec![1, 2, 3, 4, 5];

    println!("Hello, world! {:#?}", v2);
    let third: &i32 = &v2[2];

    println!("The third element is {}", third);

    let third: Option<&i32> = v2.get(3);
    match third {
        Some(third) => println!("The third element is {}", third),
        None => println!("There is no third element"),
    }

    for i in &v2 {
        println!("{}", i);
    }

    let mut v3 = vec![100, 32, 57];
    for i in &mut v3 {
        *i += 50;
    }

    for i in &v3 {
        println!("{}", i);
    }

    #[derive(Debug)]
    enum cell_e {
        Int(i32),
        Float(f64),
        Text(String),
    }

    let row = vec![
        cell_e::Int(3),
        cell_e::Text(String::from("blue")),
        cell_e::Float(10.12),
    ];
    println!("Hello, world! {:#?}", row);

    let data = "Initial contents";
    let s = data.to_string();

    let mut s = String::from("foo");
    s.push_str(" bar");
    println!("{}", s);

    let s1 = String::from("hello");

    // let h = s1[0];

    let hello = "Здравствуйте";
    let s = &hello[0..4];
    println!("{}", s);

    for c in "Здравствуйте".chars() {
        println!("{}", c);
    }

    for b in "Здравствуйте".bytes() {
        println!("{}", b);
    }
}
