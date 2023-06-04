use std::thread;
use std::time::Duration;

#[derive(Debug, PartialEq, Copy, Clone)]
enum ShirtColor {
    Red,
    Blue,
}

struct Invetory {
    shirts: Vec<ShirtColor>,
}

impl Invetory {
    fn giveaway(&self, user_preference: Option<ShirtColor>) -> ShirtColor {
        user_preference.unwrap_or_else(|| self.most_stocked())
    }
    fn most_stocked(&self) -> ShirtColor {
        let mut num_red= 0;
        let mut num_blue = 0;
         
        for color in &self.shirts {
            match color {
                ShirtColor::Red => num_red += 1,
                ShirtColor::Blue => num_blue += 1,
            }
        }
        if num_red > num_blue {
            ShirtColor::Red
        } else {
            ShirtColor::Blue
        }
    }
}

fn main() {
    let store = Invetory {
        shirts: vec![ShirtColor::Blue,ShirtColor::Red,ShirtColor::Blue,],
    };

    let user_pref1 = Some(ShirtColor::Red);
    let giveaway1 = store.giveaway(user_pref1);
    println!(
        " The user with preference {:?} gets {:?}",
        user_pref1, giveaway1
    );

    let user_pref2 = None;
    let giveaway2 = store.giveaway(user_pref2);
    println!(
        "The user with preference {:?} gets {:?}",
        user_pref2, giveaway2
    );

    // Closure Type Inference and Annotation

let simulated_user_specified_valued = 10;
let simulated_random_number = 7;

generate_workout(simulated_user_specified_valued, simulated_random_number);

// Capturing References or Moving Ownership
let list = vec![1,2,3];
println!("Before defininng closure: {:?}",list);

let only_borrows = || println!("From closure: {:?}", list);

println!("Before calling closure: {:?}",list);
only_borrows();
println!("After calling closure: {:?}",list);

// ...

let mut list = vec![1,2,3];
println!("Before defininng closure: {:?}",list);

let mut borrows_mutably = || list.push(7);

borrows_mutably();
println!("After calling closure: {:?}",list);


}

fn generate_workout(intensity: u32, random_number: u32) {
    let expensive_closure = |num: u32| -> u32 {
        println!("calculating slowly...");
        thread::sleep(Duration::from_secs(2));
        num
    };

    if intensity < 25 {
        println!("Today, do {} pushups!", expensive_closure(intensity));
    } else {
        if random_number == 3 {
            println!("Take a break!");
        } else {
            println!(
                "Today, run for {} minutes!",
                expensive_closure(intensity)
            );
        }
    }
}

