enum MyOption<T> {
    None,
    Some(T),
}

fn main() {
    let some_number = MyOption::Some(5);
    let some_char = MyOption::Some('e');
    let absent_number: MyOption<i32> = MyOption::None;

    let x: i8 = 5;
    let y: Option<i8> = Some(5);

    match y {
        Some(i) => println!("{}", i),
        None => println!("[None]"),
    }

    // let sum = x + y;

    println!("Hello, world!");

    let config_max = Some(3u8);
    match config_max {
        Some(max) => println!("The maximum is configured to be {}", max),
        _ => (),
    }

    if let Some(max) = config_max {
        println!("The maximum is configured to be {}", max);
    }
}
