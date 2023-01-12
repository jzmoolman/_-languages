fn largest_i32(list: &[i32]) -> &i32 {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

fn largest_char(list: &[char]) -> &char {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

fn largest<T: std::cmp::PartialOrd>(list: &[T]) -> &T {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

struct Point<T> {
    x: T,
    y: T,
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest_i32(&number_list);
    println!("The largest number is {}", result);

    let result = largest(&number_list);
    println!("The largest number is {}", result);
    let number_list = vec!['y', 'm', 'a', 'q'];

    let result = largest_char(&number_list);
    println!("The largest number is {}", result);

    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let wont_wok = Point { x: 5, y: 4 };
}
