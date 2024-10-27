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

fn largest<T : std::cmp::PartialOrd>(list: &[T]) -> &T {
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

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }

}

struct PointV2<T, U> {
    x: T,
    y: U,
}

fn main() {
    println!("Hello, world!");
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest_i32(&number_list);
    println!("The largest number is {}", result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest_char(&char_list);
    println!("The largest char is {}", result);

    let result = largest(&char_list);
    println!("The largest char is {}", result);

    // In Struct Definitions
    let integer = Point { 
        x: 5, 
        y: 10,
    };

    let float = Point { 
        x: 5.0, 
        y: 10.0,
    };
    let both_integer = PointV2 { x: 5, y: 10 };
    let both_float = PointV2 { x: 1.0, y: 4.0 };
    let integer_and_float = PointV2 { x: 5, y: 4.0 };

    // In Method Definitions
    let p = Point { x: 5, y: 10 };
    println!("p.x = {}", p.x());


}
