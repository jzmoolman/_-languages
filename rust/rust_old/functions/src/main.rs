fn main() {
    println!("Hello, world!");

    another_function(100);

    let number = 3;

    if number < 3 {
        println!("Conditions was true")
    } else {
        println!("Conditions was false")
    }

    let number = if true { 5 } else { 10 };
    println!("The value of x is {number}");

    let mut cnt = 0;

    // let result = 'loop_name: loop {
    'loop_name: loop {
        cnt += 1;
        if cnt == 10 {
            // break cnt * 2; 'loop_name;
            break 'loop_name;
        }
    }

    // println!("The cnt is {result}");
    println!("The cnt is {cnt}");

    let a = [10, 20, 30, 40, 50];
    for e in a {
        println!("The values is: {e}");
    }

    for number in (1..4).rev() {
        println!("{number}!");
    }
    println!("LIFTOFF!!!")
}

fn another_function(x: i32) -> i32 {
    println!("The value of x is {x}");
    10
}
