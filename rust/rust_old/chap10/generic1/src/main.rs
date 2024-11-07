fn main() {
    println!("Hello, world!");

    let numner_list = vec![34,50,25, 100,65];   

    let mut largest = &numner_list[0];

    for number in &numner_list {
        if number > largest {
            largest = number;
        }
    }

    println!("The largest number is {}", largest);

    let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];

    let mut largest = &number_list[0];

    for number in &number_list {
        if number > largest {
            largest = number;
        }
    }

    println!("The largest number is {}", largest);

    let result = largestV2(&number_list);
    println!("The largest number is {}", result);


}

fn largestV2(list: &[i32]) -> &i32 {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}
